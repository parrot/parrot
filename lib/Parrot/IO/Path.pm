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
# qw() to avoid the export because we have a stat() method.
use File::stat qw();

my %instance_for_path = ();

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
	
	# Clean up any /foo/../ stuff.
	while ( $path =~ s|/[^/]+/\.\.|| ) {}

	if ( exists $instance_for_path{$path} )
	{
		if ( ref($instance_for_path{$path}) ne $self )
		{
			bless $instance_for_path{$path}, $self;
		}
		
		return $instance_for_path{$path};
	}
	
	my ($volume, $directories, $name) = File::Spec->splitpath($path);
	
	# Needs '' to avoid a warning.
	my $parent_path = File::Spec->catpath($volume, $directories, '');
	
	# To remove the trailing slash.
	$parent_path = File::Spec->canonpath($parent_path);
	
	# If we are root then the above will make parent the same as path.
	undef $parent_path if $parent_path eq $path;
	
	$self = bless {
		PATH => $path,
		NAME => $name,
		PARENT_PATH => $parent_path,
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
	
	return 1 unless $self->parent_path;
	
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

=item C<stat()>

Returns the C<File::stat> object. Used by subclasses to get information
about the path.

=cut

sub stat
{
	my $self = shift;
	
	return File::stat::stat($self->path);
}

=item C<delete()>

Removes the instance from the cache, and undefines it.

=cut

sub delete
{
	# Use $_[0] so that we can undef the instance.

	delete($instance_for_path{$_[0]->path});
	
	undef $_[0];
}

=back

=head1 SEE ALSO

C<Parrot::IO::Directory>, C<Parrot::IO::File>.

=cut

1;