# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

examples/benchmarks/stress.pasm - GC stress-testing

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/stress.pasm

=head1 DESCRIPTION

Creates 50 arrays with 10000 elements each, and then prints out the
total number of DOD runs made.

=cut

	set I0, 10
	new P0, .ResizablePMCArray

ol:	bsr buildarray
	set P0[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol

	set I0, 20
	new P2, .ResizablePMCArray

ol1:	bsr buildarray
	set P2[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol1

	set I0, 20
	new P3, .ResizablePMCArray

ol2:	bsr buildarray
	set P3[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol2

	interpinfo I1, 2
	print "A total of "
	print I1
	print " DOD runs were made\n"

	end


	# Our inner loop, 10000 times
buildarray:
	set I1, 10000
	new P1, .ResizablePMCArray
loop1:	new P9, .Integer
	set P9, I1
	set P1[I1], P9
	dec I1
	if I1, loop1
	ret

=head1 SEE ALSO

F<examples/benchmarks/stress.pl>, 
F<examples/benchmarks/stress1.pasm>, 
F<examples/benchmarks/stress1.pl>, 
F<examples/benchmarks/stress2.pasm>, 
F<examples/benchmarks/stress2.pl>, 
F<examples/benchmarks/stress3.pasm>.

=cut
