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
		$self->new_group('Native Bytecode Tests', '', 't/native_pbc'),
		$self->new_group('Ops Tests', '', 't/op'),
		$self->new_group('PMC Tests', '', 't/pmc'),
		$self->new_group('C Source Code Tests', '', 't/src'),
		$self->new_group('Stress Tests', '', 't/stress'),
	);
}

=back

=cut

1;