# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Ops - Parrot ops docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Ops;
	
	my $section = Parrot::Docs::Section::Ops->new;

=head1 DESCRIPTION

A documentation section describing the Parrot ops.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::Ops;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Ops::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'Ops', 'ops.html', '',
		$self->group('Tools', '',
			$self->item('', 'build_tools/ops2c.pl'),
			$self->item('', 'ops/ops.num'),
			$self->item('', 'build_tools/ops2pm.pl'),
		),
		$self->group('Op Libs', '',
			$self->item('', 'ops'),
		),
	);
}

=back

=cut

1;
