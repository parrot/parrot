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

sub new
{
    my $self = shift;

    return $dist if defined $dist;

    my $path = '.';

    while ( $self = $self->SUPER::new($path) ) {
        return $dist = $self if $self->file_exists_with_name('README') and
            $self->file_with_name('README')->read =~ m/^This is Parrot/os;

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

sub c_source_file_directories
{
    my $self = shift;

    return
        map $self->directory_with_name($_) =>
            map("compilers/$_" => qw<ast bcg/src bcg/src/pmc imcc>),
            'config/gen/cpu/i386',
            map("config/gen/platform/$_" =>
                qw<aix ansi cygwin darwin generic
                ia64 netbsd openbsd solaris win32>),
            map("examples/$_" => qw<c compilers mops nci>),
            'src',
            map("src/$_" =>
                qw<atomic charset dynoplibs dynpmc
                encodings io ops packfile pmc stm>),
    ;
}


=item C<c_source_file_with_name($name)>

Returns the C source file with the specified name.

=cut

sub c_source_file_with_name
{
    my $self = shift;
    my $name = shift || return;

    $name .= '.c' unless $name =~ /\.[Cc]$/o;

    foreach my $dir ($self->c_source_file_directories)
    {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name ."\n";

    return;
}


=item C<c_header_file_directories()>

Returns the directories which contain C header files.

Currently only F<include/parrot>.

=cut

sub c_header_file_directories
{
    my $self = shift;

    return
        map $self->directory_with_name($_) =>
            map("compilers/$_" => qw<ast bcg/include imcc>),
            'config/gen/platform',
            map("config/gen/platform/$_" =>
                qw<aix ansi cygwin darwin generic
                ia64 netbsd openbsd solaris win32>),
            'include/parrot',
            map("include/parrot/$_" => qw<atomic oplib stm>),
            'src',
            map("src/$_" =>
                qw<atomic charset dynoplibs dynpmc
                encodings io ops packfile pmc stm>),
            map("src/jit/$_" =>
                qw<alpha arm hppa i386 ia64 mips ppc skeleton sun4>),
    ;
}


=item C<c_header_file_with_name($name)>

Returns the C header file with the specified name.

=cut

sub c_header_file_with_name
{
    my $self = shift;
    my $name = shift || return;

    $name .= '.h' unless $name =~ /\.[Hh]$/o;

    foreach my $dir ($self->c_header_file_directories)
    {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    return;
}

=item C<pmc_source_file_directories()>

Returns the directories which contain PMC source files.

=cut

sub pmc_source_file_directories
{
    my $self = shift;

    return
        map $self->directory_with_name($_) =>
            'compilers/bcg/src/pmc',
            'languages/APL/src/pmc',
            'languages/WMLScript/pmc',
            'languages/amber/lib/kernel/pmc',
            'languages/cardinal/src/pmc',
            'languages/dotnet/pmc',
            'languages/lua/pmc',
            'languages/perl6/src/pmc',
            'languages/pugs/pmc',
            'languages/python/pmc',
            'languages/tcl/src/pmc',
            map("src/$_" => qw<dynpmc pmc>),
    ;
}


=item C<pmc_source_file_with_name($name)>

Returns the PMC source file with the specified name.

=cut

sub pmc_source_file_with_name
{
    my $self = shift;
    my $name = shift || return;

    $name .= '.pmc';

    foreach my $dir ($self->pmc_source_file_directories)
    {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name ."\n";

    return;
}

=item C<yacc_source_file_directories()>

Returns the directories which contain yacc source files.

=cut

sub yacc_source_file_directories
{
    my $self = shift;

    return
        map $self->directory_with_name($_) =>
            'compilers/ast/',
            'compilers/imcc/',
            'languages/cola/',
            'languages/lua/doc',
            'languages/regex/lib/Regex',
    ;
}


=item C<yacc_source_file_with_name($name)>

Returns the yacc source file with the specified name.

=cut

sub yacc_source_file_with_name
{
    my $self = shift;
    my $name = shift || return;

    $name .= '.y';

    foreach my $dir ($self->yacc_source_file_directories)
    {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name ."\n";

    return;
}

=item C<lex_source_file_directories()>

Returns the directories which contain lex source files.

=cut

sub lex_source_file_directories
{
    my $self = shift;

    return
        map $self->directory_with_name($_) =>
            'compilers/ast/',
            'compilers/imcc/',
            'languages/cola/',
    ;
}


=item C<lex_source_file_with_name($name)>

Returns the lex source file with the specified name.

=cut

sub lex_source_file_with_name
{
    my $self = shift;
    my $name = shift || return;

    $name .= '.l';

    foreach my $dir ($self->lex_source_file_directories)
    {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name ."\n";

    return;
}

=item C<ops_source_file_directories()>

Returns the directories which contain ops source files.

=cut

sub ops_source_file_directories
{
    my $self = shift;

    return
        map $self->directory_with_name($_) =>
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

sub ops_source_file_with_name
{
    my $self = shift;
    my $name = shift || return;

    $name .= '.ops';

    foreach my $dir ($self->ops_source_file_directories)
    {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }

    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name ."\n";

    return;
}

=item C<file_for_perl_module($module)>

Returns the Perl module file for the specified module.

=cut

sub file_for_perl_module
{
    my $self = shift;
    my $module = shift || return;

    my @path = split '::', $module;

    $module = pop @path;
    $module .= '.pm';

    my $dir = $self->existing_directory_with_name('lib');

    foreach my $name (@path)
    {
        return unless $dir = $dir->existing_directory_with_name($name);
    }

    return $dir->existing_file_with_name($module);
}


=item C<docs_directory()>

Returns the documentation directory.

=cut

sub docs_directory
{
    my $self = shift;

    return $self->existing_directory_with_name('docs');
}


=item C<html_docs_directory()>

Returns the HTML documentation directory.

=cut

sub html_docs_directory
{
    my $self = shift;

    return $self->docs_directory->directory_with_name('html');
}


=item C<delete_html_docs()>

Deletes the HTML documentation directory.

=cut

sub delete_html_docs
{
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
   if (defined $Parrot::Revision::svn_entries
            && $Parrot::Revision::svn_entries =~ m/\.svn/) {
       $svn_cmd = 'svn';
   } else {
       $svn_cmd = 'svk';
   }

   # Find all directories in the Parrot distribution
   my %dir_list  = map { my $dir = ( File::Spec->splitpath( $_ ) )[1];
                         $dir =~ s!\.svn/$!!;
                         $dir => 1
                       } keys %{ ExtUtils::Manifest::manifind() };
   my @skip;     # regular expressions for files to skip
   foreach my $dir ( sort keys %dir_list ) {
       next if $dir =~ m/\.svn/;
       next if ( $dir && ! -d $dir );

       my $patterns = capture_output( "$svn_cmd propget svn:ignore $dir" );
       # TODO: escape chars that are special in regular expressions
       push @skip, qq{# generated from svn:ignore of '$dir'},
           map {
               my $end = $dir_list{ $dir . $_} ? '$' : '/'; # ignore file or dir
               s/\./\\./g;                  # . is simply a dot
               s/\*/.*/g;                   # * is any amount of chars
               "^${dir}${_}\$",             # SVN globs are specific to a dir
               "^${dir}${_}/",              # SVN globs are specific to a dir
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
    my $generated = ExtUtils::Manifest::maniread( 'MANIFEST.generated' );
    my $path      = $dist->path();

    return { map { File::Spec->catfile( $path, $_ ) => $generated->{ $_ } }
        keys %$generated };
}


=back

=cut

1;
