# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::IO::Directory - Directory in the Parrot distribution.

=head1 SYNOPSIS

	use Parrot::IO::Directory;
	my $dir = Parrot::IO::Directory->new('parrot');

=head1 DESCRIPTION

=head2 Methods

=over

=cut

package Parrot::IO::Directory;

use strict;

use Parrot::IO::Path;
@Parrot::IO::Directory::ISA = qw(Parrot::IO::Path);

use DirHandle;
use File::Path;
use File::Spec;
use Parrot::IO::File;

=item C<file_class()>

Returns the class used in the various file creation methods. This default
implementation returns C<Parrot::IO::File>.

=cut

sub file_class
{
	my $self = shift;
	
	return 'Parrot::IO::File';
}

=item C<tmp_directory($path)>

Returns the directory for C<$path> relative to the default temporary
directory.

=cut

sub tmp_directory
{
	my $self = shift;
	
	return $self->new(File::Spec->catdir(File::Spec->tmpdir, @_));
}

=item C<new($path)>

Returns the instance for C<$path>.

=cut

sub new
{
	my $self = shift;
	my $path = shift;
	
	return undef unless defined $path and ! -f $path;
	
	return $self->SUPER::new($path);
}

=item C<create_path()>

This is called from C<new()> to create the path if necessary.

=cut

sub create_path
{
	my $self = shift;
	
	return undef unless $self->SUPER::create_path;
	
	unless ( -e $self->path )
	{
		# This dies if it fails.
		mkpath($self->path);
	}
	
	return -d $self->path;
}

=item C<relative_path($path)>

Returns C<$path> relative to the directory.	

=cut

sub relative_path
{
	my $self = shift;
	my $path = shift;
	
	return File::Spec->abs2rel($path, $self->path);
}

=item C<parent($path)>

Returns the directory's parent directory.	
	
=cut

sub parent
{
	my $self = shift;
	my $path = shift;
	
	return Parrot::IO::Directory->new($self->parent_path);
}

=item C<file_and_directory_names()>

These are the names of all the files and subdirectories in the
directory.

=cut

sub file_and_directory_names()
{
	my $self = shift;
    my $dh = DirHandle->new($self->path) or 
    	die "can't opendir $self->{PATH}: $!";
    
    return sort grep {$_ ne '.' and $_ ne '..'} $dh->read();
}

=item C<file_and_directory_paths()>

These are the full paths of all the files and subdirectories in the directory.

=cut

sub file_and_directory_paths()
{
	my $self = shift;
	
	return map  {
		File::Spec->catfile($self->{PATH}, $_)
	} $self->file_and_directory_names;
}

=item C<file_paths()>

These are the full paths of all the files in the directory.

=cut

sub file_paths()
{
	my $self = shift;

    return sort grep {-f} $self->file_and_directory_paths;
}

=item C<directory_paths()>

These are the full paths of all the subdirectories in the directory.

=cut

sub directory_paths
{
	my $self = shift;

    return sort grep {-d} $self->file_and_directory_paths;
}

=item C<files($recursive, $ignore)>

This gives you an array of C<Parrot::IO::File> instances.

Set C<$recursive> to true if you want all files in subdirectories to be
included. To ignore everything below particular directories use a regex
in C<$ignore>.

=cut

sub files
{
	my $self = shift;
	my $recursive = shift;
	my $ignore = shift;
	my @files = map {$self->file_class->new($_)} $self->file_paths;
	
	if ( $recursive )
	{
		foreach my $dir ($self->directories)
		{
			next if defined $ignore and $dir->name =~ /$ignore/;
			
			push @files, $dir->files(1, $ignore);
		}
	}
	
	return @files;
}

=item C<directories()>

This gives you an array of C<Parrot::Docs::Directory> instances.

=cut

sub directories
{
	my $self = shift;

	return map {Parrot::IO::Directory->new($_)} $self->directory_paths;
}

=item C<file_suffixes($recursive, $ignore)>

Use this to get an array of the file type suffixes used for files in the
directory.

C<$recursive> and C<$ignore> function as specified above for C<files()>.

For example:

    $parrot->file_suffixes(1, '^(CVS|icu)$');

will give you all the suffixes used in Parrot ignoring all CVS and ICU
files.

Note that if there are files with no suffix then the empty string will
be included in this list.

=cut

sub file_suffixes
{
	my $self = shift;
	my $recursive = shift;
	my $ignore = shift;
	my %suffixes = ();
	
	foreach my $file ($self->files($recursive, $ignore))
	{
		$suffixes{$file->suffix} = 1;
	}
	
	return sort keys %suffixes;
}

=item C<files_with_suffix($suffix, $recursive, $ignore)>

Use this to get a list of the files with a particular suffix.

C<$recursive> and C<$ignore> function as specified above for C<files()>.

Note that if C<$suffix> is the empty string then this will return all
the files with no suffix.

=cut

sub files_with_suffix
{
	my $self = shift;
	my $suffix = shift;
	
	return () unless defined $suffix;
	
	my $recursive = shift;
	my $ignore = shift;
	my @files = ();
	
	foreach my $file ($self->files($recursive, $ignore))
	{
		next unless $file->has_suffix($suffix);
		push @files, $file;
	}
	
	return @files;
}

=item C<directory_with_name($name)>

Returns a directory with the specified name in the directory.

=cut

sub directory_with_name
{
	my $self = shift;
	my $name = shift;
	
	return Parrot::IO::Directory->new(File::Spec->catdir($self->path, $name));
}

=item C<file_with_name($name)>

Returns a file with the specified name in the directory.

=cut

sub file_with_name
{
	my $self = shift;
	my $name = shift;
	
	return $self->file_class->new(File::Spec->catfile($self->path, $name));
}

=item C<relative_path_is_directory($path)>

Returns whether the specified relative path is a directory.

=cut

sub relative_path_is_directory
{
	my $self = shift;
	my $path = shift;
	my ($volume, $directories, $name) = File::Spec->splitpath($path);
	
	return -d File::Spec->catdir($self->path, $directories, $name);
}

=item C<relative_path_is_file($path)>

Returns whether the specified relative path is a file.

=cut

sub relative_path_is_file
{
	my $self = shift;
	my $path = shift;
	my ($volume, $directories, $name) = File::Spec->splitpath($path);
	
	$path = File::Spec->catdir($self->path, $directories);
	$path = File::Spec->catfile($path, $name);
	
	return -f $path;
}

=item C<directory_with_relative_path($path)>

Returns a directory with the specified relative path below the directory.

=cut

sub directory_with_relative_path
{
	my $self = shift;
	my $path = shift;
	my ($volume, $directories, $name) = File::Spec->splitpath($path);
	
	$path = File::Spec->catdir($self->path, $directories, $name);
	
	return Parrot::IO::Directory->new($path);
}

=item C<file_with_relative_path($path)>

Returns a file with the specified relative path below the directory.

=cut

sub file_with_relative_path
{
	my $self = shift;
	my $path = shift;
	my ($volume, $directories, $name) = File::Spec->splitpath($path);
	
	$directories = File::Spec->catdir($self->path, $directories);
	
	return $self->file_class->new(File::Spec->catfile($directories, $name));
}

=item C<delete()>

Deletes the directory and all its contents, removes the instance from
the cache, and undefines it.

Raises an exception if the delete fails.

=cut

sub delete
{
	# Use $_[0] so that we can undef the instance in SUPER::delete().
	
	$_[0]->delete_contents;
	rmdir($_[0]->path) or die 'Failed to rmdir ' . $_[0]->path . ": $!";
	
	$_[0]->SUPER::delete;
}

=item C<delete_contents()>

Deletes the contents of the directory.

Raises an exception if the delete fails.

=cut

sub delete_contents
{
	my $self = shift;

	foreach my $file ($self->files)
	{
		$file->delete;
	}
	
	foreach my $dir ($self->directories)
	{
		$dir->delete;
	}
}

=back

=head1 SEE ALSO

C<Parrot::IO::File>, C<Parrot::IO::Path>.

=cut

1;