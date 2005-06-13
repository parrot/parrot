# Copyright: 2004-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Distribution - Parrot Distribution Directory

=head1 SYNOPSIS

    use Parrot::Distribution;
    $dist = Parrot::Distribution->new();

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

use Data::Dumper;
use ExtUtils::Manifest;
use File::Spec;
use Parrot::Revision;
use Parrot::Configure::Step qw(capture_output);

use Parrot::Docs::Directory;
@Parrot::Distribution::ISA = qw(Parrot::Docs::Directory);

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
                                $self->file_with_name('README')->read =~ /^This is Parrot/os;
        
        $path = $self->parent_path();
    }
    
    die "Failed to find Parrot distribution root\n";
}

=back

=head2 Instance Methods

=over 4

=item C<c_source_file_directories()>

Returns the directories which contain C source files.

This is not really a complete list, for example F<icu> is ignored.

=cut

sub c_source_file_directories
{
    my $self = shift;
    
    return $self->directory_with_name('src'),
        $self->directory_with_name('encodings'),
        $self->directory_with_name('io'),
        $self->directory_with_name('pf'),
        $self->directory_with_name('types'),
        $self->directory_with_name('examples')->directory_with_name('c'),;
}

=item C<c_source_file_with_name($name)>

Returns the C source file with the specified name.

=cut

sub c_source_file_with_name
{
    my $self = shift;
    my $name = shift || return undef;
    
    $name .= '.c' unless $name =~ /\.[Cc]$/o;
    
    foreach my $dir ($self->c_source_file_directories)
    {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }
    
    print 'WARNING: ' . __FILE__ . ':' . __LINE__ . ' File not found:' . $name ."\n";
    return undef;
}

=item C<c_header_file_directories()>

Returns the directories which contain C header files.

Currently only F<include/parrot>.

=cut

sub c_header_file_directories
{
    my $self = shift;
    
    return $self->directory_with_relative_path('include/parrot');
}

=item C<c_header_file_with_name($name)>

Returns the C header file with the specified name.

=cut

sub c_header_file_with_name
{
    my $self = shift;
    my $name = shift || return undef;
    
    $name .= '.h' unless $name =~ /\.[Hh]$/o;
    
    foreach my $dir ($self->c_header_file_directories)
    {
        return $dir->file_with_name($name)
            if $dir->file_exists_with_name($name);
    }
    
    return undef;
}

=item C<file_for_perl_module($module)>

Returns the Perl module file for the specified module.

=cut

sub file_for_perl_module
{
    my $self = shift;
    my $module = shift || return undef;

    my @path = split '::', $module;
    
    $module = pop @path;
    $module .= '.pm';
    
    my $dir = $self->existing_directory_with_name('lib');
    
    foreach my $name (@path)
    {
        return undef unless $dir = $dir->existing_directory_with_name($name);
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

   # manicheck.pl is propably only useful for checked out revisions
   # Checkout is done either with svn or svk
   my $svn_cmd = $Parrot::Revision::svn_entries =~ m/\.svn/ ? 'svn' : 'svk';

   # cd to the distribution root first
   my $file_list = ExtUtils::Manifest::manifind();
   my %dir_list  = map { ( File::Spec->splitpath( $_ ) )[1] => 1 } keys %{$file_list};
 
   my @skip;     # regular expressions for files to skip
   foreach my $dir ( sort keys %dir_list ) {
       next if $dir =~ m/\.svn/;
       next if ( $dir && ! -d $dir ); 

       my $patterns = capture_output( "$svn_cmd propget svn:ignore $dir" );
       # TODO: escape chars that are special in regular expressions
       push @skip, qq{# generated from svn:ignore of '$dir'},
                   map { my $end = $dir_list{ $dir . $_} ? '$' : '/'; # ignore file or dir
                         s/\./\\./g;                          # . is simply a dot
                         s/\*/.*/g;                           # * is any amount of chars
                         "^${dir}${_}\$",                     # SVN globs are specific to a dir
                         "^${dir}${_}/",                      # SVN globs are specific to a dir
                       } split( /\n/, $patterns );
    }

    return \@skip;
}

=back

=cut

1;
