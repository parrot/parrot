# Copyright (C) 2004, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::Tests - Tests documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Tests;

=head1 DESCRIPTION

A documentation section describing Parrot tests.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Tests;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Tests', 'tests.html', '',
		$self->new_group('Tools', '', 't/harness'),
		$self->new_group('Benchmarks Tests', '', 't/benchmark'),
		$self->new_group('Coding Standards Tests', '', 't/codingstd'),
		$self->new_group('Compilers Tests', '', 't/compilers'),
		$self->new_group('Configure Tests', '', 't/configure'),
		$self->new_group('Distribution Tests', '', 't/distro'),
		$self->new_group('Documentation Tests', '', 't/doc'),
		$self->new_group('Examples Tests', '', 't/examples'),
		$self->new_group('Libraries Tests', '', 't/library'),
		$self->new_group('Native Bytecode Tests', '', 't/native_pbc'),
		$self->new_group('Ops Tests', '', 't/op', 't/dynoplibs'),
		$self->new_group('PMC Tests', '', 't/pmc', 't/dynpmc'),
		$self->new_group('C Source Code Tests', '', 't/src'),
		$self->new_group('Software Transactional Memory Tests', '', 't/stm'),
		$self->new_group('Stress Tests', '', 't/stress'),
	);
}

=back

=cut

1;
