# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Directory - Docs-related Directory

=head1 SYNOPSIS

	use Parrot::Docs::Directory;
	my $dir = Parrot::Docs::Directory->new('parrot');

=head1 DESCRIPTION

This C<Parrot::IO::Directory> subclass creates C<Parrot::Docs::Files>.

It's used by the documentation tools in F<tools/docs>.

=head2 Methods

=over

=cut

package Parrot::Docs::Directory;

use strict;

use Parrot::IO::Directory;
@Parrot::Docs::Directory::ISA = qw(Parrot::IO::Directory);

use Parrot::Docs::File;

=item C<file_class()>

Returns C<Parrot::Docs::File>.

=cut

sub file_class
{
	return 'Parrot::Docs::File';
}

=item C<directory_class()>

Returns C<Parrot::Docs::Directory>.

=cut

sub directory_class
{
	return 'Parrot::Docs::Directory';
}

=item C<files_of_type($type, $recursive, $ignore)>

Use this to get a list of the files of a particular type.

C<$recursive> and C<$ignore> function as specified in C<files()>.

=cut

sub files_of_type
{
	my $self = shift;
	my $type = shift;
	
	return () unless defined $type;
	
	my $recursive = shift;
	my $ignore = shift;
	my @files = ();
	
	foreach my $file ($self->files)
	{
		next unless $file->is_of_type($type);
		push @files, $file;
	}
	
	if ( $recursive )
	{
		foreach my $dir ($self->directories)
		{
			next if defined $ignore and $dir->name =~ /$ignore/;
			
			push @files, $dir->files_of_type($type, 1, $ignore);
		}
	}
	
	return @files;
}

=back

=head1 SEE ALSO

C<Parrot::Docs::File>.

=cut

1;