# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::DynaPMCs - Dynamic PMCs documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::DynaPMCs;

=head1 DESCRIPTION

A documentation section describing all the dynamic PMCs.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::DynaPMCs;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::DynaPMCs::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Dynamic PMCs', 'dynapmc.html', '',
		$self->new_group('Loading', '', 'dynclasses'),
		$self->new_group('Runtime', '', 'runtime/parrot/include'),
	);
}

=back

=cut

1;