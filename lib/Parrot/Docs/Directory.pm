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

=item C<files($recursive, $ignore)>

This gives you an array of C<Parrot::Docs::File> instances.

Set C<$recursive> to true if you want all files in subdirectories to be
included. To ignore everything below particular directories use a regex
in C<$ignore>.

=cut

sub files
{
	my $self = shift;
	
	return map {bless $_, 'Parrot::Docs::File'} $self->SUPER::files(@_);
}

=back

=head1 SEE ALSO

C<Parrot::Docs::File>.

=cut

1;