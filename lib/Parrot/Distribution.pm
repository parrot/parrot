# Copyright (C) 2004-2006, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Distribution - Parrot Distribution Directory

=head1 SYNOPSIS

    use Parrot::Distribution;

    my $dist = Parrot::Distribution->new();

=head1 DESCRIPTION

C<Parrot::Distribution> knows all kinds of stuff about the contents of
the distribution.

This is a subclass of C<Parrot::Docs::Directory> so that it can be used
to build the HTML docs. There may come a time when it is necessary to
make C<file_class()> and C<directory_class()> dynamic so that different
file methods can be used depending on the circumstances.

=head2 Class Methods

=over 4

=cut

package Parrot::Distribution;

use strict;
use warnings;

use Data::Dumper;
use ExtUtils::Manifest;
use File::Spec;
use Parrot::Revision;
use Parrot::Configure::Step qw(capture_output);

use Parrot::Docs::Directory;
use base qw(Parrot::Docs::Directory);


=item C<new()>

Searches up the file system tree from the current working directory
looking for the distribution directory, and returns it if it finds it.
The search is only performed once.

The criterion is that there should be a F<README> file beginning with
the words "This is Parrot" in the directory.

Raises an exception if the distribution root is not found.

=cut

## i'm a singleton
my $dist;


sub new {
    my( $class ) = @_;

    return $dist if defined $dist;
    my $self = bless {}, $class;
    return $self->_initialize;
}


sub _initialize {
    my( $self ) = @_;

    my $file = 'README';
    my $path = '.';

    while ( $self = $self->SUPER::new($path) ) {
        if (
            $self->file_exists_with_name($file)
            and $self->file_with_name($file)->read =~ m/^This is Parrot/os
        ) {
            $dist = $self;
            last;
        }

        $path = $self->parent_path();
    }

    # non-object call syntax since $self is undefined
    _croak( undef, "Failed to find Parrot distribution root\n" )
        unless $self;

    if( defined $dist ) {
        $self->_dist_files( [
            sort keys %{ ExtUtils::Manifest::maniread(
                File::Spec->catfile( $self->path, "MANIFEST" )
            ) },
        ] );
    }

    return $self;
}


sub _croak {
    my( $self, @message ) = @_;
    require Carp;
    Carp::croak(@message);
}


BEGIN {
    my @getter_setters = qw{ _dist_files };

    for my $method ( @getter_setters ) {
        no strict 'refs';

        *$method = sub {
            my $self = shift;
            unless (@_) {
                $self->{$method} ||= [];
                return wantarray
                    ? @{ $self->{$method} }
                    : $self->{$method};
            }
            $self->{$method} = shift;
            return $self;
        };
    }
}


=back

=head2 Instance Methods

=over 4

=item C<c_source_file_directories()>

=item C<c_header_file_directories()>

=item C<pmc_source_file_directories()>

=item C<yacc_source_file_directories()>

=item C<lex_source_file_directories()>

=item C<ops_source_file_directories()>

Returns the directories which contain source files of the appropriate filetype.

=item C<c_source_file_with_name($name)>

=item C<c_header_file_with_name($name)>

=item C<pmc_source_file_with_name($name)>

=item C<yacc_source_file_with_name($name)>

=item C<lex_source_file_with_name($name)>

=item C<ops_source_file_with_name($name)>

Returns the source file with the specified name and of the appropriate filetype.

=item C<c_source_files()>

=item C<c_header_files()>

=item C<pmc_source_files()>

=item C<yacc_source_files()>

=item C<lex_source_files()>

=item C<ops_source_files()>

Returns a sorted list of the source files listed within the MANIFEST of
Parrot.  Returns a list of Parrot::IO::File objects of the appropriate filetype.

=cut

BEGIN {
    my %file_class = (
        source => {
            c    => { file_exts => ['c'] },
            pmc  => { file_exts => ['pmc'] },
            ops  => { file_exts => ['ops'] },
            lex  => {
                file_exts => ['l'],
                except_dirs => [
                    qw{ languages/lisp examples/library }
                ],
            },
            yacc => { file_exts => ['y'] },
            perl => { file_exts => ['pl', 'pm', 'in', 't'],
                      shebang      => qr/^#!\s*perl/,
                      shebang_ext  => qr/.t$/ },
        },
        header => {
            c    => { file_exts => ['h'] },
        },
    );

    my @ignore_dirs = qw{ .svn };


    for my $class ( keys %file_class ) {
        for my $type ( keys %{ $file_class{$class} } ) {
            no strict 'refs';

            my @exts        = @{ $file_class{$class}{$type}{file_exts} };
            my $shebang     = $file_class{$class}{$type}{shebang};
            my $shebang_ext = $file_class{$class}{$type}{shebang_ext};
            my @exceptions  = defined $file_class{$class}{$type}{except_dirs}
                ? @{ $file_class{$class}{$type}{except_dirs} }
                : ();
            my $method     = join '_' => $type, $class;
            my $filter_ext = join '|' => map { "\\.${_}\$" } @exts;
            my $filter_dir = join '|' =>
                map { qr{\b$_\b} }
                map { quotemeta($_) }
                @ignore_dirs,
                @exceptions;

            next unless $method;

            *{ $method . '_file_directories' } = sub {
                my $self = shift;

                # Look through the list of distribution files
                # for files ending in the proper extension(s)
                # and make a hash out of the directories
                my %dirs =
                    map { ( ( File::Spec->splitpath($_) )[1] => 1 ) }
                    grep { m|(?i)(?:$filter_ext)| }
                    $self->_dist_files;

                # Filter out ignored directories
                # and return the results
                return
                    sort
                    map { $self->directory_with_name($_) }
                    grep { !m|(?:$filter_dir)| }
                    keys %dirs;
            };


            *{ $method . '_file_with_name' } = sub {
                my( $self, $name ) = @_;
                return unless length $name;

                if ( 1 == @exts ) {
                    my $ext = $exts[0];
                    $name .= ".$ext"
                       if $name !~ qr/(?i)\.$ext$/;
                }

                my $meth = $method . '_file_directories';
                for my $dir ( $self->$meth ) {
                    if ($dir->file_exists_with_name($name)) {

                        my $file = $dir->file_with_name($name);
                        return $file unless $shebang && $name =~ $shebang_ext;

                        my $first_line = ($file->read)[0];
                        return $file if $first_line =~ $shebang;
                    };
                }

                print 'WARNING: ' . __FILE__ . ':' . __LINE__
                    . ' File not found: ' . $name . "\n";
                return;
            };


            *{ $method . '_files' } = sub {
                my( $self ) = @_;

                # Look through the list of distribution files
                # for files ending in the proper extension(s)
                # and return a sorted list of filenames
                return
                    sort
                    map { $self->file_with_name($_) }
                    grep { m|(?i)(?:$filter_ext)| }
                    $self->_dist_files;
            };
        }
    }
}


=item C<get_c_language_files()>

Returns the C language source files within Parrot.  Namely:

=over 4

=item C source files C<*.c>

=item C header files C<*.h>

=item (f)lex files C<*.l>

=item yacc/bison files C<*.y>

=item pmc files C<*.pmc>

=item ops files C<*.ops>

returns a Parrot::Docs::File object

=back

=cut

sub get_c_language_files {
    my $self = shift;

    my @files = (
        $self->c_source_files,
        $self->c_header_files,
        $self->pmc_source_files,
        $self->yacc_source_files,
        #$self->lex_source_files,
        map( $_->files_of_type('Lex file'), $self->lex_source_file_directories ),
        $self->ops_source_files,
    );

    my @c_language_files = ();
    foreach my $file ( @files ) {
        next if $self->is_c_exemption($file);
        push @c_language_files, $file;
    }

    return @c_language_files;

    # XXX: lex_source_files() collects lisp files as well...  how to fix ???
}


=item C<is_c_exemption()>

Determines if the given filename is an exemption to being in the C source.
This is to exclude automatically generated C-language files Parrot might have.

=cut

{
    my @exemptions;

    sub is_c_exemption {
        my( $self, $file ) = @_;

        push @exemptions => map { File::Spec->canonpath($_) } qw{
            config/gen/cpu/i386/memcpy_mmx.c config/gen/cpu/i386/memcpy_sse.c
            compilers/imcc/imclexer.c        compilers/imcc/imcparser.c
            compilers/imcc/imcparser.h       languages/cola/lexer.c
            languages/cola/parser.c          languages/cola/parser.h
        } unless @exemptions;

        $file->path =~ /\Q$_\E$/ && return 1
            for @exemptions;
        return;
    }
}


=item C<get_perl_language_files()>

Returns the Perl language source files within Parrot.  Namely:

=over 4

=item Perl source files C<*.pl>

=item Perl module files C<*.pm>

=item .in files C<*.in>

=item test files C<*.t>

=back

=cut

sub get_perl_language_files {
    my $self = shift;

    my @files = (
        $self->perl_source_files,
    );

    my @perl_language_files = ();
    foreach my $file ( @files ) {
        next if $self->is_perl_exemption($file);
        push @perl_language_files, $file;
    }

    return @perl_language_files;
}


=item C<is_perl_exemption()>

Determines if the given filename is an exemption to being in the Perl
source.  This is to exclude automatically generated Perl-language files, and
any external modules Parrot might have.

=cut

{
    my @exemptions;

    sub is_perl_exemption {
        my( $self, $file ) = @_;

        # RT#41610: for some reason the * isn't picking up subdirectories in
        # this map.  The addition of subdirectory names such as
        # lib/Pod/Simple should be considered a temporary hack only!
        # TODO: write a test to make sure these files don't get picked up
        # again...  i.e. a test of is_perl_exemption
        # TODO: make the list of exemption files a variable so that the test
        # can pick it up, and so that the list is only mentioned in the one
        # place to make maintenance of such a list easier
        push @exemptions => map { File::Spec->canonpath($_) } qw{
            languages/lua/Lua/parser.pm
            languages/regex/lib/Regex/Grammar.pm
            lib/Class/*
            lib/Digest/Perl/*
            lib/File/*
            lib/Parse/*
            lib/Pod/*
            lib/Pod/Simple/*
            lib/SmartLink.pm
            lib/Test/*
            lib/Text/*
        } unless @exemptions;

        $file->path =~ /\Q$_\E$/ && return 1
            for <@exemptions>;
        return;
    }
}


=item C<is_perl()>

Determines if the given filename is Perl source

=cut

# Since .t files might be written in any language, we can't *just* check the
# filename to see if something should be treated as perl.
sub is_perl {
    my $self     = shift;
    my $filename = shift;

    if ( !-f $filename ) {
        return 0;
    }

    # modules and perl scripts should always be tested..
    if ( $filename =~ /\.(?:pm|pl)$/ ) {
        return 1;
    }

    # test files (.t) and configure (.in) files might need testing.
    # ignore everything else.
    if ( $filename !~ /\.(?:t|in)$/ ) {
        return 0;
    }

    # Now let's check to see if there's a perl shebang.

    open my $file_handle, '<', $filename
        or $self->_croak( "Could not open $filename for reading" );
    my $line = <$file_handle>;
    close $file_handle;

    if ( $line && $line =~ /^#!.*perl/ ) {
        return 1;
    }

    return 0;
}


=item C<file_for_perl_module($module)>

Returns the Perl module file for the specified module.

=cut

sub file_for_perl_module {
    my $self = shift;
    my $module = shift || return;

    my @path = split '::', $module;

    $module = pop @path;
    $module .= '.pm';

    my $dir = $self->existing_directory_with_name('lib');

    foreach my $name (@path) {
        return unless $dir = $dir->existing_directory_with_name($name);
    }

    return $dir->existing_file_with_name($module);
}


=item C<docs_directory()>

Returns the documentation directory.

=cut

sub docs_directory {
    my $self = shift;

    return $self->existing_directory_with_name('docs');
}


=item C<html_docs_directory()>

Returns the HTML documentation directory.

=cut

sub html_docs_directory {
    my $self = shift;

    return $self->docs_directory->directory_with_name('html');
}


=item C<delete_html_docs()>

Deletes the HTML documentation directory.

=cut

sub delete_html_docs {
    my $self = shift;

    return $self->html_docs_directory->delete();
}


=item C<gen_manifest_skip>

Query the svn:ignore property and generate the lines for MANIFEST.SKIP.

=cut

sub gen_manifest_skip {

    # manicheck.pl is probably only useful for checked out revisions
    # Checkout is done either with svn or svk
    my $svn_cmd;
    if ( defined $Parrot::Revision::svn_entries
        && $Parrot::Revision::svn_entries =~ m/\.svn/ )
    {
        $svn_cmd = 'svn';
    }
    else {
        $svn_cmd = 'svk';
    }

    # Find all directories in the Parrot distribution
    my %dir_list = map {
        my $dir = ( File::Spec->splitpath($_) )[1];
        $dir =~ s!\.svn/$!!;
        $dir => 1
    } keys %{ ExtUtils::Manifest::manifind() };
    my @skip;    # regular expressions for files to skip
    foreach my $dir ( sort keys %dir_list ) {
        next if $dir =~ m/\.svn/;
        next if ( $dir && !-d $dir );

        my $patterns = capture_output("$svn_cmd propget svn:ignore $dir");

        # TODO: escape chars that are special in regular expressions
        push @skip, qq{# generated from svn:ignore of '$dir'}, map {
            my $end = $dir_list{ $dir . $_ } ? '$' : '/';    # ignore file or dir
            s/\./\\./g;                                      # . is simply a dot
            s/\*/.*/g;                                       # * is any amount of chars
            "^${dir}${_}\$",                                 # SVN globs are specific to a dir
                "^${dir}${_}/",                              # SVN globs are specific to a dir
        } split( /\n/, $patterns );
    }

    return \@skip;
}


=item C<generated_files>

Returns a hash where the keys are the files in F<MANIFEST.generated> and the
values are the comments.

=cut

sub generated_files {
    my $self      = shift;
    my $generated = ExtUtils::Manifest::maniread('MANIFEST.generated');
    my $path      = $dist->path();

    return {
        map { File::Spec->catfile( $path, $_ ) => $generated->{$_} }
            keys %$generated
    };
}

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
