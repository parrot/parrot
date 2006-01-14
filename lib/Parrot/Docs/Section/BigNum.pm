# Copyright: 2004-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::BigNum - Big Number documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::BigNum;

=head1 DESCRIPTION

A documentation section describing Parrot's big number subsystem.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::BigNum;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::BigNum::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Big Number Arithmetic', 'bignum.html', '',
		$self->new_group('Decimal Arithmetic', '',
			$self->new_item('', 'src/bignum.c', 'src/bignum.h'),
		),
		$self->new_group('Testing', '',
			$self->new_item('', 't/pmc/bignum.t' ),
		),
	);
}

=back

=cut

1;
