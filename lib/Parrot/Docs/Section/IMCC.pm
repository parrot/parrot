# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::IMCC - IMCC docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::IMCC;
	
	my $section = Parrot::Docs::Section::IMCC->new;

=head1 DESCRIPTION

A documentation section describing IMCC.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::IMCC;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::IMCC::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'IMCC', 'imcc.html', '',
		Parrot::Docs::Item->new('', 'imcc')
	);
}

=back

=cut

1;