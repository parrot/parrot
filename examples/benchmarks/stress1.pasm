# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/stress1.pasm - GC stress-testing

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/stress1.pasm

=head1 DESCRIPTION

Creates 500 arrays with 20000 elements each. Prints out the number of
DOD runs made.

=cut

# Our master loop, I20 times
	set I20, 10
	time N0
mloop:

	set I0, 10
	new P0, .PerlArray

ol:	bsr buildarray
	set P0[I0], P1
	dec I0
	if I0, ol

	set I0, 20
	new P2, .PerlArray

ol1:	bsr buildarray
	set P2[I0], P1
	dec I0
	if I0, ol1

	set I0, 20
	new P3, .PerlArray

ol2:	bsr buildarray
	set P3[I0], P1
	dec I0
	if I0, ol2

	time N1
	sub N2, N1, N0
	set N0, N1
	print N2

	interpinfo I1, 2
	print "\nA total of "
	print I1
	print " DOD runs were made\n"

	dec I20
	if I20, mloop

	end


	# Our inner loop, 20000 times
buildarray:
	set I1, 20000
	new P1, .PerlArray
	set P1, I1	# set length => fixed sized array
loop1:	new P9, .PerlInt
	set P9, I1
	set P1[I1], P9
	dec I1
	if I1, loop1
	ret

=head1 SEE ALSO

F<examples/benchmarks/stress.pasm>, 
F<examples/benchmarks/stress.pl>, 
F<examples/benchmarks/stress1.pl>, 
F<examples/benchmarks/stress2.pl>, 
F<examples/benchmarks/stress3.pasm>.

=cut
