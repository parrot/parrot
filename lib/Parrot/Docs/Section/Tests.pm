# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Tests - Tests docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Tests;
	
	my $section = Parrot::Docs::Section::Tests->new;

=head1 DESCRIPTION

A documentation section describing Parrot tests.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::Tests;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Tests::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Tests', 'tests.html', '',
		$self->group('Native Bytecode Tests', '',
			$self->item('', 't/native_pbc'),
		),
		$self->group('Ops Tests', '',
			$self->item('', 't/op'),
		),
		$self->group('PMC Tests', '',
			$self->item('', 't/pmc'),
		),
		$self->group('C Source Code Tests', '',
			$self->item('', 't/src'),
		),
		$self->group('Stress Tests', '',
			$self->item('', 't/src'),
		),
	);
}

=back

=cut

1;