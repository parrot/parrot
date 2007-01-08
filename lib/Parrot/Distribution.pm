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

my $dist;

sub new {
    my $self = shift;

    return $dist if defined $dist;

    my $path = '.';

    while ( $self = $self->SUPER::new($path) ) {
        return $dist = $self
            if $self->file_exists_with_name('README')
            and $self->file_with_name('README')->read =~ m/^This is Parrot/os;

        $path = $self->parent_path();
    }

    die "Failed to find Parrot distribution root\n";
}

=back

=head2 Instance Methods

=over 4

=item C<c_source_file_directories()>

Returns the directories which contain C source files.

=cut

sub c_source_file_directories {
    my $self = shift;

    my %c_source_dirs =

        # Make a hash out of the directories of those files
        map { ( ( File::Spec->splitpath($_) )[1] => 1 ) }

        # Only look at files ending in .c
        grep { m|\.c$| }

        keys %{ ExtUtils::Manifest::maniread( File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    return map $self->directory_with_name($_) => grep { !m|\.svn/$| }
        sort keys %c_source_dirs;
}

=item C<c_source_file_with_name($name)>

Returns the C source file with the specified name.

=cut

sub c_source_file_with_name {
    my $self = shift;
    my $name = shift || return;

    $name .= '.c' unless $name =~ /\.[Cc]$/o;

    foreach my $dir ( $self->c_source_file_directories ) {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name . "\n";

    return;
}

=item C<c_source_files()>

Returns a sorted list of the C source files listed within the MANIFEST of
Parrot.  Returns a list of Parrot::IO::File objects.

=cut

sub c_source_files {
    my $self = shift;

    my @manifest_files = keys %{ ExtUtils::Manifest::maniread( 
            File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    my @c_files = sort grep m{\.[cC]$}o, @manifest_files;

    return map ($self->file_with_name($_), @c_files);
}

=item C<c_header_file_directories()>

Returns the directories which contain C header files.

=cut

# XXX returns what exactly???  The docs need updating here to help with
# debugging and further development

sub c_header_file_directories {
    my $self = shift;

    my %c_header_dirs = 
    
        # Make a hash out of the directories of those files
        map { ( ( File::Spec->splitpath($_) )[1] => 1 ) }

        # Only look at files ending in .h
        grep { m|\.h$| }

        keys %{ ExtUtils::Manifest::maniread( File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    return map $self->directory_with_name($_) => grep { !m|\.svn/$| }
        sort keys %c_header_dirs;
}

=item C<c_header_file_with_name($name)>

Returns the C header file with the specified name.

=cut

sub c_header_file_with_name {
    my $self = shift;
    my $name = shift || return;

    $name .= '.h' unless $name =~ /\.[Hh]$/o;

    foreach my $dir ( $self->c_header_file_directories ) {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name . "\n";

    return;
}

=item C<c_header_files()>

Returns a sorted list of the C header files listed within the MANIFEST of
Parrot.  Returns a list of Parrot::IO::File objects.

=cut

sub c_header_files {
    my $self = shift;

    my @manifest_files = keys %{ ExtUtils::Manifest::maniread( 
            File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    my @h_files = sort grep m{\.[hH]$}o, @manifest_files;

    return map ($self->file_with_name($_), @h_files);
}

=item C<pmc_source_file_directories()>

Returns the directories which contain PMC source files.

=cut

sub pmc_source_file_directories {
    my $self = shift;

    my %pmc_source_dirs =

        # Make a hash out of the directories of those files
        map { ( ( File::Spec->splitpath($_) )[1] => 1 ) }

        # Only look at files ending in .pmc
        grep { m|\.pmc$| }

        keys %{ ExtUtils::Manifest::maniread( File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    return map $self->directory_with_name($_) => grep { !m|\.svn/$| }
        sort keys %pmc_source_dirs;
}

=item C<pmc_source_file_with_name($name)>

Returns the PMC source file with the specified name.

=cut

sub pmc_source_file_with_name {
    my $self = shift;
    my $name = shift || return;

    $name .= '.pmc';

    foreach my $dir ( $self->pmc_source_file_directories ) {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name . "\n";

    return;
}

=item C<pmc_source_files()>

Returns a sorted list of the PMC files listed within the MANIFEST of
Parrot.  Returns a list of Parrot::IO::File objects.

=cut

sub pmc_source_files {
    my $self = shift;

    my @manifest_files = keys %{ ExtUtils::Manifest::maniread( 
            File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    my @pmc_files = sort grep m{\.pmc$}o, @manifest_files;

    return map ($self->file_with_name($_), @pmc_files);
}

=item C<yacc_source_file_directories()>

Returns the directories which contain yacc source files.

=cut

sub yacc_source_file_directories {
    my $self = shift;

    return map $self->directory_with_name($_) => 
        'compilers/imcc/',
        'languages/cola/', 
        'languages/lua/doc', 
        'languages/regex/lib/Regex',
        ;
}

=item C<yacc_source_file_with_name($name)>

Returns the yacc source file with the specified name.

=cut

sub yacc_source_file_with_name {
    my $self = shift;
    my $name = shift || return;

    $name .= '.y';

    foreach my $dir ( $self->yacc_source_file_directories ) {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name . "\n";

    return;
}

=item C<yacc_source_files()>

Returns a sorted list of the yacc files listed within the MANIFEST of
Parrot.  Returns a list of Parrot::IO::File objects.

=cut

sub yacc_source_files {
    my $self = shift;

    my @manifest_files = keys %{ ExtUtils::Manifest::maniread( 
            File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    my @yacc_files = sort grep m{\.y$}o, @manifest_files;

    return map ($self->file_with_name($_), @yacc_files);
}

=item C<lex_source_file_directories()>

Returns the directories which contain lex source files.

=cut

sub lex_source_file_directories {
    my $self = shift;

    return map $self->directory_with_name($_) => 
        'compilers/imcc/', 
        'languages/cola/',
        ;
}

=item C<lex_source_file_with_name($name)>

Returns the lex source file with the specified name.

=cut

sub lex_source_file_with_name {
    my $self = shift;
    my $name = shift || return;

    $name .= '.l';

    foreach my $dir ( $self->lex_source_file_directories ) {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name . "\n";

    return;
}

=item C<lex_source_files()>

Returns a sorted list of the lex files listed within the MANIFEST of
Parrot.  Returns a list of Parrot::IO::File objects.

=cut

sub lex_source_files {
    my $self = shift;

    my @manifest_files = keys %{ ExtUtils::Manifest::maniread( 
            File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    my @lex_files = sort grep m{\.l$}o, @manifest_files;

    return map ($self->file_with_name($_), @lex_files);
}

=item C<ops_source_file_directories()>

Returns the directories which contain ops source files.

=cut

sub ops_source_file_directories {
    my $self = shift;

    return map $self->directory_with_name($_) => 
        'src/ops/',
        'src/dynoplibs/', 
        'languages/tcl/src/ops/', 
        'languages/WMLScript/ops/',
        'languages/dotnet/ops/',
        ;
}

=item C<ops_source_file_with_name($name)>

Returns the ops source file with the specified name.

=cut

sub ops_source_file_with_name {
    my $self = shift;
    my $name = shift || return;

    $name .= '.ops';

    foreach my $dir ( $self->ops_source_file_directories ) {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name . "\n";

    return;
}

=item C<ops_source_files()>

Returns a sorted list of the ops files listed within the MANIFEST of
Parrot.  Returns a list of Parrot::IO::File objects.

=cut

sub ops_source_files {
    my $self = shift;

    my @manifest_files = keys %{ ExtUtils::Manifest::maniread( 
            File::Spec->catfile( $self->path, "MANIFEST" ) ) };

    my @ops_files = sort grep m{\.ops$}o, @manifest_files;

    return map ($self->file_with_name($_), @ops_files);
}

=item C<get_c_language_files()>

Returns the C language source files within Parrot.  Namely:

=over 4

=item C source files C<*.c>

=item C header files C<*.h>

=item (f)lex files C<*.lex>

=item yacc/bison files C<*.y>

=item pmc files C<*.pmc>

=item ops files C<*.ops>

returns a Parrot::Docs::File object

=back

=cut

sub get_c_language_files {
    my $self = shift;

    my @c_language_files = (
        $self->c_source_files,
        $self->c_header_files,
        $self->pmc_source_files,
        $self->yacc_source_files,
        #$self->lex_source_files,
        map( $_->files_of_type('Lex file'), $self->lex_source_file_directories ),
        $self->ops_source_files,
    );

    return grep $_->path !~ m{ \b (imc)?(parser|lexer)\.[hc] $ }x,
        @c_language_files;

    # XXX: lex_source_files() collects lisp files as well...  how to fix ???

    #grep( $_->{PATH} !~ m{ \b imc(parser|lexer)\.[hc] $ }x,

    #map( $_->files_of_type('C code'), $self->c_source_file_directories ),

    #map( $_->files_of_type('C header'), $self->c_header_file_directories ),

    #map( $_->files_of_type('PMC code'), $self->pmc_source_file_directories ),

    #map( $_->files_of_type('Yacc file'), $self->yacc_source_file_directories ),

    #map( $_->files_of_type('Lex file'), $self->lex_source_file_directories ),

    #map( $_->files_of_type('Parrot opcode file'), $self->ops_source_file_directories ),
    #);

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
    my @files;
    my $manifest = ExtUtils::Manifest::maniread('MANIFEST');

    foreach my $file ( keys(%$manifest) ) {
        next if $self->is_perl_exemption($file);
        next unless $self->is_perl($file);
        push @files, $file;
    }

    return @files;
}

=item C<is_perl_exemption()>

Determines if the given filename is an exemption to being in the Perl
source.  This is to exclude automatically generated Perl-language files, and
any external modules Parrot might have.

=cut

sub is_perl_exemption {
    my $self = shift;
    my $file = shift;

    my @exemptions = qw(
        languages/lua/Lua/parser.pm
        languages/regex/lib/Regex/Grammar.pm
        lib/Class/*
        lib/Digest/*
        lib/File/*
        lib/Parse/*
        lib/Pod/*
        lib/SmartLink.pm
        lib/Test/*
        lib/Text/*
        );

    # XXX this is inefficient isn't it?
    foreach my $exemption ( @exemptions ) {
        return 1 if $file =~ $exemption;
    }

    return 0;
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
        or die "Could not open $filename for reading";
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
