# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::PMCs - PMCs docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::PMCs;
	
	my $section = Parrot::Docs::Section::PMCs->new;

=head1 DESCRIPTION

A documentation section describing all the PMCs.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::PMCs;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::PMCs::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns the PMCs section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'PMCs', 'pmc.html', '',
		Parrot::Docs::Item->new('', 'classes')
	);
}

=back

=cut

1;