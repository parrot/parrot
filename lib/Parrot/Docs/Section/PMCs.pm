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
		$self->group('Tools', '',
			$self->item('', 'classes/genclass.pl'),
			$self->item('', 'classes/null.pl'),
			$self->item('', 'classes/pmc2c.pl'),
			$self->item('', 'classes/pmc2c2.pl'),
		),
		$self->group('Abstract Classes', '',
			$self->item('', 'classes/default.pmc'),
			$self->item('', 'classes/delegate.pmc'),
		),
		$self->group('Concrete Classes', '',
			$self->item('', 'classes/array.pmc'),
			$self->item('', 'classes/boolean.pmc'),
			$self->item('', 'classes/closure.pmc'),
			$self->item('', 'classes/compiler.pmc'),
			$self->item('', 'classes/continuation.pmc'),
			$self->item('', 'classes/coroutine.pmc'),
			$self->item('', 'classes/csub.pmc'),
			$self->item('', 'classes/env.pmc'),
			$self->item('', 'classes/eval.pmc'),
			$self->item('', 'classes/exception.pmc'),
			$self->item('', 'classes/exception_handler.pmc'),
			$self->item('', 'classes/float.pmc'),
			$self->item('', 'classes/integer.pmc'),
			$self->item('', 'classes/intlist.pmc'),
			$self->item('', 'classes/iterator.pmc'),
			$self->item('', 'classes/key.pmc'),
			$self->item('', 'classes/managedstruct.pmc'),
			$self->item('', 'classes/mmd_default.pmc'),
			$self->item('', 'classes/multiarray.pmc'),
			$self->item('', 'classes/nci.pmc'),
			$self->item('', 'classes/null.pmc'),
			$self->item('', 'classes/orderedhash.pmc'),
			$self->item('', 'classes/parrotclass.pmc'),
			$self->item('', 'classes/parrotinterpreter.pmc'),
			$self->item('', 'classes/parrotio.pmc'),
			$self->item('', 'classes/parrotlibrary.pmc'),
			$self->item('', 'classes/parrotobject.pmc'),
			$self->item('', 'classes/parrotthread.pmc'),
			$self->item('', 'classes/perlarray.pmc'),
			$self->item('', 'classes/perlenv.pmc'),
			$self->item('', 'classes/perlhash.pmc'),
			$self->item('', 'classes/perlint.pmc'),
			$self->item('', 'classes/perlnum.pmc'),
			$self->item('', 'classes/perlscalar.pmc'),
			$self->item('', 'classes/perlstring.pmc'),
			$self->item('', 'classes/perlundef.pmc'),
			$self->item('', 'classes/pointer.pmc'),
			$self->item('', 'classes/random.pmc'),
			$self->item('', 'classes/ref.pmc'),
			$self->item('', 'classes/retcontinuation.pmc'),
			$self->item('', 'classes/sarray.pmc'),
			$self->item('', 'classes/scalar.pmc'),
			$self->item('', 'classes/scratchpad.pmc'),
			$self->item('', 'classes/sharedref.pmc'),
			$self->item('', 'classes/sub.pmc'),
			$self->item('', 'classes/timer.pmc'),
			$self->item('', 'classes/tqueue.pmc'),
			$self->item('', 'classes/unmanagedstruct.pmc'),
			$self->item('', 'classes/version.pmc'),
		),
	);
}

=back

=cut

1;