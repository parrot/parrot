# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Examples - Examples docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Examples;
	
	my $section = Parrot::Docs::Section::Examples->new;

=head1 DESCRIPTION

A documentation section describing all the Parrot examples.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::Examples;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Examples::ISA = qw(Parrot::Docs::Section);

use Parrot::Docs::Item;
use Parrot::Docs::Group;

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Examples', 'examples.html', '',
		$self->group('PASM and PIR', '', 'examples/assembly'),
		$self->group('Subroutines', '', 'examples/subs'),
		$self->group('IO', '', 'examples/io'),
		$self->group('Benchmarking', '', 'examples/benchmarks'),
		$self->group('Speed Comparison', '', 'examples/mops'),
		$self->group('Parrot Extensions', '', 'examples/pni'),
	);
}

=back

=cut

1;