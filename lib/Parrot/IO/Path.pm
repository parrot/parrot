# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::IO::Path - Abstract superclass for File and Directory

=head1 DESCRIPTION

Provides common path logic for C<Parrot::IO::File> and
C<Parrot::IO::Directory>.

Instances created with C<new()> are cached so that there is only one
unique instance for each path.

=head2 Methods

=over

=cut

package Parrot::IO::Path;

use strict;
use warnings;
use File::Path;
use File::Spec;
use File::stat;

my %instance_for_path = ();

=item C<tmp($path)>

Returns C<$path> with the default temporary directory path prepended.

=cut

sub tmp
{
	my $self = shift;
	
	return File::Spec->catfile(File::Spec->tmpdir, @_);
}

=item C<new($path)>

Returns the instance for C<$path> if it already exists, otherwise it is
created and cached. A relative path is made absolute.

=cut

sub new
{
	my $self = ref $_[0] ? ref shift : shift;
	my $path = shift;
	
	return undef unless defined $path;
	
	$path = File::Spec->rel2abs($path);
	
	return $instance_for_path{$path} if exists $instance_for_path{$path};
	
	my ($volume, $directories, $name) = File::Spec->splitpath($path);

	$self = bless {
		PATH => $path,
		NAME => $name,
		PARENT_PATH => File::Spec->catpath($volume, $directories, ''),
	}, $self;
	
	return undef unless $self->create_path;
	
	return $instance_for_path{$path} = $self;
}

=item C<create_path()>

This is called from C<new()> to create the parent path if necessary.
Subclasses should reimplement this method to complete the task.

=cut

sub create_path
{
	my $self = shift;
	
	unless ( -e $self->parent_path )
	{
		# This dies if it fails.
		mkpath($self->parent_path);
	}
	
	return -e $self->parent_path;
}

=item C<path()>

Returns the actual path.

=cut

sub path
{
	my $self = shift;
	
	return $self->{PATH};
}

=item C<name()>

Returns the name part of the path.

=cut

sub name
{
	my $self = shift;
	
	return $self->{NAME};
}

=item C<name_without_suffix()>

This will give you the name minus any .xyz suffix.

=cut

sub name_without_suffix
{
	my $self = shift;
	my $name = $self->name;
	
    $name =~ s/\.[^\.]*$//o;
    
    return $name;	
}

=item C<suffix()>

Use this to get the name's .xyz suffix or extension. If there is no
suffix then the empty string is returned.

=cut

sub suffix
{
	my $self = shift;
	
	return $self->{SUFFIX} if exists $self->{SUFFIX};
	
	my ($suffix) = $self->name =~ /\.([^.]+)$/;
	
	$self->{SUFFIX} = defined $suffix ? $suffix : '';
	
	return $self->{SUFFIX};
}

=item C<has_suffix()>

Finds out whether the name has a .xyz suffix.

=item C<has_suffix($suffix)>

Finds out whether the name suffix is C<$suffix>.

Note that if a name has no suffix and if C<$suffix> is the empty string
then this method will return true.

=cut

sub has_suffix
{
	my $self = shift;
	my $suffix = $self->suffix;
	
	if ( @_ > 0 )
	{
		return 0 unless defined $_[0];
		return $_[0] eq $suffix;
	}
	
	return $suffix ne '';
}

=item C<parent_path()>

Returns the path of the containing directory.

=cut

sub parent_path
{
	my $self = shift;
	
	return $self->{PARENT_PATH};
}

=item C<relative_path($path)>

Returns a relative path. This is primarily intended for situations where
a Directory is asked for the relative path for a file somewhere below
it.

=cut

sub relative_path
{
	my $self = shift;
	my $path = shift;
	
	return File::Spec->abs2rel($path, $self->path);
}

=item C<relative_path_no_suffix($path)>

Returns a relative path with any .xyz suffix removed.

=cut

sub relative_path_no_suffix
{
	my $self = shift;
	my $path = shift;
	
	$path = $self->relative_path($path);
	
	$path =~ s/\.[^\.]*$//o;

	return $path;
}

=item C<status()>

Returns the File::stat object. Used by subclasses to get information
about the path.

=cut

sub status
{
	my $self = shift;
	
	return stat($self->path);
}

=item C<delete()>

Removes the instance from the cache.

=cut

sub delete
{
	my $self = shift;
	
	delete($instance_for_path{$self->path});
}

=back

=head1 SEE ALSO

C<Parrot::IO::Directory>, C<Parrot::IO::File>.

=cut

1;