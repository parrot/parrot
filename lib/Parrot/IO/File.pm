# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::IO::File - File in the Parrot distribution.

=head1 SYNOPSIS

	use Parrot::IO::File;
	my $file = Parrot::IO::File->new('parrot/MANIFEST');

=head1 DESCRIPTION

=head2 Methods

=over

=cut

package Parrot::IO::File;

use strict;

use Parrot::IO::Path;
@Parrot::IO::File::ISA = qw(Parrot::IO::Path);

use FileHandle;

=item C<new($path)>

Returns the instance for C<$path>.

=cut

sub new
{
	my $self = shift;
	my $path = shift;
	
	return undef unless defined $path and ! -d $path;
	
	return $self->SUPER::new($path);
}

=item C<create_path()>

This is called from C<new()> to create the path if necessary.

=cut

sub create_path
{
	my $self = shift;
	
	return undef unless $self->SUPER::create_path;
	
	my $path = $self->path;
	
	unless ( -e $path )
	{
		my $fh = FileHandle->new(">$path") or die "Failed to open $path: $!";	
		print $fh '';
		$fh->close;
	}
	
	return -f $self->path;
}

=item C<read()>

This reads the contents of the file and returns it as an array or string
depending on the context in which the method is called.

    $contents = $file->read;
    @lines = $file->read;

=cut

sub read
{
	my $self = shift;
	my $fh = FileHandle->new($self->path) or 
		die 'Failed to open ' . $self->path . ": $!";
	my @lines = <$fh>;
	
	$fh->close;
	
	return wantarray ? @lines : join '', @lines;
}

=item C<write(@lines)>

Writes the specified lines to the file.

=cut

sub write
{
	my $self = shift;
	
	return unless @_;
	
	my $fh = FileHandle->new('>' . $self->path) or 
		die 'Failed to open ' . $self->path . ": $!";
	
	print $fh @_;
	
	$fh->close;
}

=item C<append(@lines)>

Writes the specified lines to the file.

=cut

sub append
{
	my $self = shift;
	
	return unless @_;
	
	my $fh = FileHandle->new('>>' . $self->path) or 
		die 'Failed to open ' . $self->path . ": $!";
	
	print $fh @_;
	
	$fh->close;
}

=item C<is_executable()>

This tells you whether the file is executable.

=cut

sub is_executable
{
	my $self = shift;
	
	return $self->status->mode & 0111;
}

=item C<modified_since($time)>

Use this to find out whether the file has been modified since the
specified time. C<$time> is a number of non-leap seconds since the
epoch.

=cut

sub modified_since
{
	my $self = shift;
	my $time = shift;
	
	return $self->status->mtime > $time;
}

=item cvs_id

Returns the CVS $id string.

=cut

sub cvs_id
{
	my $self = shift;
	my $content = $self->read;
	# Break up the $Id to prevent CVS messing with it.
	my ($id) = $content =~ /((?:\$)Id:[^\$]+\$)/so;
	
	return $id;
}

=item has_cvs_id

Returns whether the file has a CVS $id string.

=cut

sub has_cvs_id
{
	my $self = shift;
	my $content = $self->read;
	# Break up the $Id to prevent CVS messing with it.
	my $has_id = $content =~ /(?:\$)Id:[^\$]+\$/so;
	
	return $has_id;
}

=item cvs_version

Returns the CVS $id string.

=cut

sub cvs_version
{
	my $self = shift;
	my $id = $self->cvs_id;
	my ($version) = $id =~ /,v\s+(\S+)/s;
	
	return $version;
}

=item C<delete()>

Deletes the file.

=cut

sub delete
{
	my $self = shift;
	
	unlink($self->path) or die 'Failed to unlink ' . $self->path . ": $!";
	
	$self->SUPER::delete;
}

=back

=head1 SEE ALSO

C<Parrot::IO::Directory>, C<Parrot::IO::Path>.

=cut

1;