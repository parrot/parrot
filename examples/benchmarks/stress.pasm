# Copyright (C) 2001-2006, Parrot Foundation.

=head1 NAME

examples/benchmarks/stress.pasm - GC stress-testing

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/stress.pasm

=head1 DESCRIPTION

Creates 50 arrays with 10000 elements each, and then prints out the
total number of GC runs made.

=cut

.pcc_sub :main main:

        new P10, 'ResizableIntegerArray'
	set I0, 10
	new P0, 'ResizablePMCArray'

ol:	local_branch P10,  buildarray
	set P0[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol

	set I0, 20
	new P2, 'ResizablePMCArray'

ol1:	local_branch P10,  buildarray
	set P2[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol1

	set I0, 20
	new P3, 'ResizablePMCArray'

ol2:	local_branch P10,  buildarray
	set P3[I0], P1
	dec I0
#	print I0
#	print "\n"
	if I0, ol2

	interpinfo I1, 2
	print "A total of "
	print I1
	print " GC runs were made\n"

	end


	# Our inner loop, 10000 times
buildarray:
	set I1, 10000
	new P1, 'ResizablePMCArray'
loop1:	new P9, 'Integer'
	set P9, I1
	set P1[I1], P9
	dec I1
	if I1, loop1
	local_return P10

=head1 SEE ALSO

F<examples/benchmarks/stress.pl>,
F<examples/benchmarks/stress1.pasm>,
F<examples/benchmarks/stress1.pl>,
F<examples/benchmarks/stress2.pasm>,
F<examples/benchmarks/stress2.pl>,
F<examples/benchmarks/stress3.pasm>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
