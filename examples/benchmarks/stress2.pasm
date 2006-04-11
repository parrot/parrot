# Copyright (C) 2001-2006 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/stress2.pasm - Brief

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/stress2.pasm

=head1 DESCRIPTION

Creates 200 arrays of 10000 elements each.

=cut

    set I3, 20
ol:	set I0, 10
	new P0, .ResizablePMCArray

ol1: bsr buildarray
	set P0[I0], P1
	dec I0
	if I0, ol1

	dec I3
	if I3, ol

	end

buildarray:
	set I1, 10000
	new P1, .ResizablePMCArray
loop1:	new P2, .Integer
	set P2, I1
	set P1[I1], P2
	dec I1
	if I1, loop1
	ret

=head1 SEE ALSO

F<examples/benchmarks/stress.pasm>, 
F<examples/benchmarks/stress.pl>, 
F<examples/benchmarks/stress1.pasm>, 
F<examples/benchmarks/stress1.pl>, 
F<examples/benchmarks/stress2.pl>, 
F<examples/benchmarks/stress3.pasm>.

=cut
