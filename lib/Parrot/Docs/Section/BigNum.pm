# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::BigNum - Big Number docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::BigNum;
	
	my $section = Parrot::Docs::Section::BigNum->new;

=head1 DESCRIPTION

A documentation section describing Parrot's big number subsystem.

=head2 Methods

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
		$self->group('Decimal Arithmetic', '',
			$self->item('', 'types/bignum.c', 'types/bignum.h'),
		),
		$self->group('Testing', '',
			$self->item('', 'types/bignum_atest.pl', 'types/bignum_test.pl'),
		),
	);
}

=back

=cut

1;
