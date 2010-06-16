# Copyright (C) 2004-2010, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Distribution - Info on the Parrot Distribution

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

use ExtUtils::Manifest;
use File::Spec;

use lib qw( lib );
use Parrot::BuildUtil ();

use base 'Parrot::Docs::Directory';

=item C<new()>

Searches up the file system tree from the current working directory
looking for the distribution directory, and returns it if it finds it.
The search is only performed once.

The criterion is that there should be a F<README> file beginning with
the words "This is Parrot" in the directory.

Raises an exception if the distribution root is not found.

=cut

{
    my $dist; ## i'm a singleton

    sub new {
        my ($class) = @_;

        return $dist if defined $dist;

        my $self = bless {}, $class;

        return $self->_initialize;
    }

    sub _initialize {
        my ($self) = @_;

        my $file = 'README';
        my $path = '.';

        while ( $self = $self->SUPER::new($path) ) {
            if (    $self->file_exists_with_name($file)
                and $self->file_with_name($file)->read =~ m/^This is Parrot/os )
            {
                $dist = $self;
                last;
            }

            $path = $self->parent_path();
        }

        # non-object call syntax since $self is undefined
        _croak( undef, "Failed to find Parrot distribution root\n" )
            unless $self;

        if ( defined $dist ) {
            $self->_dist_files(
                [
                    sort keys %{
                        ExtUtils::Manifest::maniread( File::Spec->catfile( $self->path, "MANIFEST" ) )
                        },
                ]
            );
        }

        return $self;
    }
}

sub _croak {
    my ( $self, @message ) = @_;

    require Carp;
    Carp::croak(@message);
}

BEGIN {
    my @getter_setters = qw{ _dist_files };

    for my $method (@getter_setters) {
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

=item C<is_svn_co()>

=item C<is_git_co()>

Check the type of checkout.

=item C<c_header_file_directories()>

=item C<c_source_file_directories()>

=item C<lex_source_file_directories()>

=item C<ops_source_file_directories()>

=item C<perl_source_file_directories()>

=item C<pir_source_file_directories()>

=item C<pmc_source_file_directories()>

=item C<yacc_source_file_directories()>

Returns the directories which contain source files of the appropriate filetype.

=item C<c_header_file_with_name()>

=item C<c_source_file_with_name()>

=item C<lex_source_file_with_name()>

=item C<ops_source_file_with_name()>

=item C<perl_source_file_with_name()>

=item C<pir_source_file_with_name()>

=item C<pmc_source_file_with_name()>

=item C<yacc_source_file_with_name()>

Returns the source file with the specified name and of the appropriate filetype.

=item C<c_header_files()>

=item C<c_source_files()>

=item C<lex_source_files()>

=item C<ops_source_files()>

=item C<perl_source_files()>

=item C<pir_source_files()>

=item C<pmc_source_files()>

=item C<yacc_source_files()>

Returns a sorted list of the source files listed within the MANIFEST of
Parrot.  Returns a list of Parrot::IO::File objects of the appropriate filetype.

=cut

BEGIN {
    my %file_class = (
        source => {
            c   => { file_exts => ['c'] },
            pmc => { file_exts => ['pmc'] },
            pir => { file_exts => ['pir', 'pasm', 't'] },
            ops => { file_exts => ['ops'] },
            lex => {
                file_exts   => ['l'],
                except_dirs => [qw{ examples/library }],
            },
            yacc => { file_exts => ['y'] },
            perl => {
                file_exts   => [ 'pl', 'pm', 't' ],
                shebang     => qr/^#!\s*perl/,
                shebang_ext => qr/.t$/,
            },
        },
        header => { c => { file_exts => ['h'] }, },
    );

    my @ignore_dirs = qw{ .svn };

    for my $class ( keys %file_class ) {
        for my $type ( keys %{ $file_class{$class} } ) {
            no strict 'refs';

            my @exts        = @{ $file_class{$class}{$type}{file_exts} };
            my $shebang     = $file_class{$class}{$type}{shebang};
            my $shebang_ext = $file_class{$class}{$type}{shebang_ext};
            my @exceptions =
                defined $file_class{$class}{$type}{except_dirs}
                ? @{ $file_class{$class}{$type}{except_dirs} }
                : ();
            my $method = join '_' => $type, $class;
            my $filter_ext = join '|' => map { "\\.${_}\$|_${_}\\.in\$" } @exts;
            my $filter_dir = join
                '|' => map { qr{\b$_\b} }
                map { quotemeta($_) } @ignore_dirs,
                @exceptions;

            next unless $method;

            *{ $method . '_file_directories' } = sub {
                my $self = shift;

                # Look through the list of distribution files
                # for files ending in the proper extension(s)
                # and make a hash out of the directories
                my %dirs =
                    map { ( ( File::Spec->splitpath($_) )[1] => 1 ) }
                    grep { m/(?i)(?:$filter_ext)/ } $self->_dist_files;

                # Filter out ignored directories
                # and return the results
                my @dirs = sort
                    map  { $self->directory_with_name($_) }
                    grep { !m/(?:$filter_dir)/ }
                    keys %dirs;
                return @dirs;
            };

            *{ $method . '_file_with_name' } = sub {
                my ( $self, $name ) = @_;
                return unless length $name;

                if ( 1 == @exts ) {
                    my $ext = $exts[0];
                    $name .= ".$ext"
                        if $name !~ qr/(?i)\.$ext$/;
                }

                my $meth = $method . '_file_directories';
                for my $dir ( $self->$meth ) {
                    if ( $dir->file_exists_with_name($name) ) {

                        my $file = $dir->file_with_name($name);
                        return $file unless $shebang && $name =~ $shebang_ext;

                        my $first_line = ( $file->read )[0];
                        return $file if $first_line =~ $shebang;
                    }
                }

                print '# WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found: ' . $name . "\n";
                return;
            };

            *{ $method . '_files' } = sub {
                my ($self) = @_;

                # Look through the list of distribution files
                # for files ending in the proper extension(s)
                # and return a sorted list of filenames
                my @files = sort
                    map  { $self->file_with_name($_) }
                    grep { m/(?i)(?:$filter_ext)/ }
                    $self->_dist_files;
                return @files;
            };
        }
    }
}

=item C<is_svn_co()>

Returns true if this is a subversion checkout of Parrot.

=cut

sub is_svn_co {
    return shift->directory_exists_with_name('.svn');
}

=item C<is_git_co()>

Returns true if this is a git checkout of Parrot.

=cut

sub is_git_co {
    return shift->directory_exists_with_name('.git');
}

=item C<get_make_language_files()>

Returns the Make language source files within Parrot.

=cut

sub get_make_language_files {
    my ($self) = @_;

    # Look through the list of distribution files
    # and return a sorted list of filenames
    my @files = sort
        map  { $self->file_with_name($_) }
        grep { m{[/\\]makefiles[/\\][a-z]+\.in$} }
        $self->_dist_files;
    return @files;
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
        $self->lex_source_files,
        $self->ops_source_files,
    );

    my @c_language_files = ();
    foreach my $file (@files) {
        next if $self->is_c_exemption($file);
        push @c_language_files, $file;
    }

    return @c_language_files;
}

=item C<is_c_exemption()>

Determines if the given filename is an exemption to being in the C source.
This is to exclude automatically generated C-language files Parrot might have.

=cut

{
    my @exemptions;

    sub is_c_exemption {
        my ( $self, $file ) = @_;

        push @exemptions => map { File::Spec->canonpath($_) } qw{
            config/auto/cpu/i386/memcpy_mmx.c
            config/auto/cpu/i386/memcpy_mmx_in.c
            config/auto/cpu/i386/memcpy_sse.c
            config/auto/cpu/i386/memcpy_sse_in.c
            config/gen/config_h/feature_h.in
            compilers/imcc/imclexer.c
            compilers/imcc/imcparser.c
            compilers/imcc/imcparser.h
            compilers/pirc/src/main.c
            compilers/pirc/src/pir.l
            compilers/pirc/src/pir.y
            compilers/pirc/src/pasm.l
            compilers/pirc/src/pasm.y
            compilers/pirc/src/pircompiler.h
            compilers/pirc/src/pirlexer.c
            compilers/pirc/src/pirlexer.h
            compilers/pirc/src/pirparser.c
            compilers/pirc/src/pirparser.h
            compilers/pirc/src/pircompunit.c
            compilers/pirc/src/pircompunit.h
            compilers/pirc/src/hdocprep.l
            compilers/pirc/src/hdocprep.c
            compilers/pirc/macro/lexer.h
            compilers/pirc/macro/macro.h
            compilers/pirc/macro/macro.l
            compilers/pirc/macro/macro.y
            compilers/pirc/macro/macrolexer.c
            compilers/pirc/macro/macrolexer.h
            compilers/pirc/macro/macroparser.c
            compilers/pirc/macro/macroparser.h
            include/parrot/config.h
            include/parrot/has_header.h
            include/parrot/oplib/core_ops.h
            include/parrot/oplib/ops.h
            include/parrot/opsenum.h
            src/gc/malloc.c
            src/ops/core_ops.c
            } unless @exemptions;

        my $path = -f $file ? $file : $file->path;
        $path =~ /\Q$_\E$/ && return 1 for @exemptions;
        return;
    }
}

=item C<get_perl_language_files()>

Returns the Perl language source files within Parrot.  Namely:

=over 4

=item Perl source files C<*.pl>

=item Perl module files C<*.pm>

=item test files C<*.t>

=back

=cut

sub get_perl_language_files {
    my $self = shift;

    # make sure we're picking up perl files (i.e. look for the shebang line)
    my @perl_files;
    for my $file ( $self->perl_source_files ) {
        push @perl_files, $file
            if $self->is_perl( $file->path );
    }

    # return only those files which aren't exempt
    return grep { !$self->is_perl_exemption($_) } @perl_files;
}

=item C<is_perl_exemption()>

Determines if the given filename is an exemption to being in the Perl
source.  This is to exclude automatically generated Perl-language files, and
any external modules Parrot might have.

=cut

{
    my @exemptions;
    my $exemptions;

    sub is_perl_exemption {
        my ( $self, $file ) = @_;

        $exemptions ||= $self->get_perl_exemption_regexp();

        return $file->path =~ $exemptions;
    }
}

=item C<get_perl_exemption_regexp()>

Returns a list of regular expressions containing the currently
coding-standard-exempt Perl files within Parrot

=cut

sub get_perl_exemption_regexp {
    my $self = shift;

    my $parrot_dir = $self->path();
    my @paths = map { File::Spec->catdir( $parrot_dir, File::Spec->canonpath($_) ) } qw{
        compilers/nqp/
        compilers/ncigen/src/parser/actions.pm
        examples/sdl/
        examples/languages/squaak/src/parser/actions.pm
        lib/Digest/Perl/
        lib/File/
        lib/IO/
        lib/Pod/
        ext/
    };

    my $regex = join '|', map { quotemeta $_ } @paths;

    return qr/^$regex/;
}

=item C<is_perl()>

Determines if the given filename is Perl source

=cut

# Since .t files might be written in any language, we can't *just* check the
# filename to see if something should be treated as perl.
sub is_perl {
    my $self     = shift;
    my $filename = shift;

    return 0 unless -f $filename;

    # modules and perl scripts should always be tested..
    return 1 if $filename =~ /\.(?:pm|pl)$/;
    return 1 if $filename =~ /_(?:pm|pl)\.in$/;

    # test files (.t) might need testing.
    # ignore everything else.
    return 0 if $filename !~ /\.t$/;

    # Now let's check to see if there's a perl shebang.

    open my $file_handle, '<', $filename
        or $self->_croak("Could not open $filename for reading");
    my $line = <$file_handle>;
    close $file_handle;

    return 1 if $line && $line =~ /^#!.*perl/;

    return 0;
}

=item C<get_pir_language_files()>

Returns the PIR language source files within Parrot.

returns a Parrot::Docs::File object

=cut

sub get_pir_language_files {
    my $self = shift;

    # make sure we're picking up pir files (i.e. look for the shebang line)
    my @pir_files;
    for my $file ( $self->pir_source_files ) {
        next if $self->is_pir_exemption($file);
        push @pir_files, $file
            if $self->is_pir( $file->path );
    }

    return @pir_files;
}

=item C<is_pir_exemption()>

Determines if the given filename is an exemption to being in the PIR source.
This is to exclude automatically generated PIR-language files Parrot might have.

=cut

sub is_pir_exemption {
    my ( $self, $file ) = @_;
    return $file->path =~ m{/ext/};
}


=item C<is_pir()>

Determines if the given filename is PIR source

=cut

# Since .t files might be written in any language, we can't *just* check the
# filename to see if something should be treated as PIR.
sub is_pir {
    my $self     = shift;
    my $filename = shift;

    return 0 unless -f $filename;

    # .pir files should always be tested
    return 1 if $filename =~ /\.(?:pir|pasm)$/;
    return 1 if $filename =~ /_(?:pir|pasm)\.in$/;

    # test files (.t) files might need testing.
    # ignore everything else.
    return 0 if $filename !~ /\.t$/;

    # Now let's check to see if there's a plain parrot shebang.
    open my $file_handle, '<', $filename
        or $self->_croak("Could not open $filename for reading");
    my $line = <$file_handle>;
    close $file_handle;

    if ( $line && $line =~ /^#!.*parrot(?:\s|$)/ ) {
        # something that specifies a pir or pbc is probably a HLL, skip it
        return 0 if $line =~ /\.(?:pir|pbc)/;
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

    my @path = split m/::/, $module;

    $module = pop @path;
    $module .= '.pm';

    my $dir = $self->existing_directory_with_name('lib');

    foreach my $name (@path) {
        return unless $dir = $dir->existing_directory_with_name($name);
    }

    return $dir->existing_file_with_name($module);
}

=item C<perl_script_file_directories()>

Returns the directories which contain perl source files.

(but misses Configure.pl...)

=cut

sub perl_script_file_directories {
    my $self = shift;

    return map $self->directory_with_name($_) => 'compilers/imcc',
        'editor', 'examples/benchmarks', 'examples/mops',
        map( "tools/$_" => qw<build dev docs util> ),;
}

=item C<perl_script_file_with_name($name)>

Returns the perl script with the specified name.

=cut

sub perl_script_file_with_name {
    my $self = shift;
    my $name = shift || return;

    $name .= '.pl' unless $name =~ /\.pl$/o;

    foreach my $dir ( $self->perl_script_file_directories ) {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name . "\n";

    return;
}

=item C<perl_module_file_directories()>

Returns the directories which contain perl module files.

=cut

sub perl_module_file_directories {
    my $self = shift;

    return
        map $self->directory_with_name($_) =>
        map( "config/$_" => qw<auto auto/cpu/i386 auto/cpu/ppc
            auto/cpu/sun4 auto/cpu/x86_64
            gen gen/cpu/i386 gen/cpu/x86_64 init init/hints inter> ),
        'ext/Parrot-Embed/lib/Parrot',
        map( "lib/$_" => qw<
            Class Digest/Perl File Parrot Parse Pod Pod/Simple Test Text
            > ),
        map( "lib/Parrot/$_" => qw<
            Config Configure Configure/Step Docs Docs/Section IO
            OpTrans PIR Pmc2c Test
            > ),
        ;
}

=item C<perl_module_file_with_name($name)>

Returns the perl module file with the specified name.

=cut

sub perl_module_file_with_name {
    my $self = shift;
    my $name = shift || return;

    $name .= '.pm' unless $name =~ /\.pm$/o;

    foreach my $dir ( $self->perl_module_file_directories ) {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name . "\n";

    return;
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

=item C<generated_files>

Returns a hash where the keys are the files in F<MANIFEST.generated> and the
values are the comments.

=cut

sub generated_files {
    my $self = shift;

    my $generated = ExtUtils::Manifest::maniread('MANIFEST.generated');
    my $path      = $self->path();

    return {
        map { File::Spec->catfile( $path, $_ ) => $generated->{$_} }
            keys %$generated
    };
}

=item C<slurp>

Returns the text of the file at the given path

=cut

sub slurp {
    my $self = shift;
    my $path = shift;
    my $buf;

    # slurp in the file
    open( my $fh, '<', $path )
        or die "Cannot open '$path' for reading: $!\n";
    {
        local $/;
        $buf = <$fh>;
    }
    close $fh;

    return $buf;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
