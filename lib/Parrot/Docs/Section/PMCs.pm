# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::PMCs - PMCs documentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::PMCs;

=head1 DESCRIPTION

A documentation section describing all the PMCs.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::PMCs;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::PMCs::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'PMCs', 'pmc.html', '',
		$self->new_group('Tools', '',
			$self->new_item('', 'classes/genclass.pl'),
			$self->new_item('', 'classes/null.pl'),
			$self->new_item('', 'classes/pmc2c.pl'),
			$self->new_item('', 'classes/pmc2c2.pl'),
		),
		$self->new_group('Abstract Classes', '',
			$self->new_item('', 'classes/default.pmc'),
			$self->new_item('', 'classes/delegate.pmc'),
			$self->new_item('', 'classes/mmd_default.pmc'),
			$self->new_item('', 'classes/perlscalar.pmc'),
			$self->new_item('', 'classes/scalar.pmc'),
		),
		$self->new_group('Concrete Classes', '',
			$self->new_item('', 'classes/array.pmc'),
			$self->new_item('', 'classes/boolean.pmc'),
			$self->new_item('', 'classes/closure.pmc'),
			$self->new_item('', 'classes/compiler.pmc'),
			$self->new_item('', 'classes/continuation.pmc'),
			$self->new_item('', 'classes/coroutine.pmc'),
			$self->new_item('', 'classes/csub.pmc'),
			$self->new_item('', 'classes/env.pmc'),
			$self->new_item('', 'classes/eval.pmc'),
			$self->new_item('', 'classes/exception.pmc'),
			$self->new_item('', 'classes/exception_handler.pmc'),
			$self->new_item('', 'classes/float.pmc'),
			$self->new_item('', 'classes/integer.pmc'),
			$self->new_item('', 'classes/intlist.pmc'),
			$self->new_item('', 'classes/iterator.pmc'),
			$self->new_item('', 'classes/key.pmc'),
			$self->new_item('', 'classes/managedstruct.pmc'),
			$self->new_item('', 'classes/multiarray.pmc'),
			$self->new_item('', 'classes/nci.pmc'),
			$self->new_item('', 'classes/null.pmc'),
			$self->new_item('', 'classes/orderedhash.pmc'),
			$self->new_item('', 'classes/parrotclass.pmc'),
			$self->new_item('', 'classes/parrotinterpreter.pmc'),
			$self->new_item('', 'classes/parrotio.pmc'),
			$self->new_item('', 'classes/parrotlibrary.pmc'),
			$self->new_item('', 'classes/parrotobject.pmc'),
			$self->new_item('', 'classes/parrotthread.pmc'),
			$self->new_item('', 'classes/perlarray.pmc'),
			$self->new_item('', 'classes/perlenv.pmc'),
			$self->new_item('', 'classes/perlhash.pmc'),
			$self->new_item('', 'classes/perlint.pmc'),
			$self->new_item('', 'classes/perlnum.pmc'),
			$self->new_item('', 'classes/perlstring.pmc'),
			$self->new_item('', 'classes/perlundef.pmc'),
			$self->new_item('', 'classes/pointer.pmc'),
			$self->new_item('', 'classes/random.pmc'),
			$self->new_item('', 'classes/ref.pmc'),
			$self->new_item('', 'classes/retcontinuation.pmc'),
			$self->new_item('', 'classes/sarray.pmc'),
			$self->new_item('', 'classes/scratchpad.pmc'),
			$self->new_item('', 'classes/sharedref.pmc'),
			$self->new_item('', 'classes/sub.pmc'),
			$self->new_item('', 'classes/timer.pmc'),
			$self->new_item('', 'classes/tqueue.pmc'),
			$self->new_item('', 'classes/unmanagedstruct.pmc'),
			$self->new_item('', 'classes/version.pmc'),
		),
	);
}

=back

=cut

1;