# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/gc_waves_sizeable_headers.pasm - GC/DOD Benchmark

=head1 SYNOPSIS

    % ./parrot examples/benchmarks/gc_waves_sizeable_headers.pasm

=head1 DESCRIPTION

Makes some big strings with C<concat>, then prints out some statistics
indicating:

=over 4

=item * the time taken

=item * the total number of bytes allocated

=item * the total of DOD runs made

=item * the total number of collection runs made

=item * the total number of bytes copied

=item * the number of active C<Buffer> C<struct>s

=item * the total number of C<Buffer> C<struct>s

=back

=cut

	set I0, 300
	set I2, 300
	set S0,  "                    "
	time N5

mainloop:

loopup:
	pushs
	concat S1, S0, S0
	concat S2, S0, S0
	concat S3, S0, S0
	concat S4, S0, S0
	concat S5, S0, S0
	concat S6, S0, S0
	concat S7, S0, S0
	concat S8, S0, S0
	concat S9, S0, S0
	concat S10, S0, S0
	concat S11, S0, S0
	concat S12, S0, S0
	concat S13, S0, S0
	concat S14, S0, S0
	concat S15, S0, S0
	concat S16, S0, S0
	concat S17, S0, S0
	concat S18, S0, S0
	concat S19, S0, S0
	concat S20, S0, S0

	inc I1
	lt I1, I0, loopup

loopdown:
	pops
	dec I1
	gt I1, 0, loopdown

	inc I3
	lt I3, I2, mainloop


getout:	time N6

	sub N7, N6, N5
	print N7
 	print " seconds.\n"

	interpinfo I1, 1
	print "A total of "
	print I1
	print " bytes were allocated\n"

	interpinfo I1, 2
	print "A total of "
	print I1
	print " DOD runs were made\n"

	interpinfo I1, 3
	print "A total of "
	print I1
	print " collection runs were made\n"

	interpinfo I1, 10
	print "Copying a total of "
	print I1
	print " bytes\n"

	interpinfo I1, 5
	print "There are "
	print I1
	print " active Buffer structs\n"

	interpinfo I1, 7
	print "There are "
	print I1
	print " total Buffer structs\n"

	end

=head1 SEE ALSO

F<examples/benchmarks/bench_newp.pasm>,
F<examples/benchmarks/gc_alloc_new.pasm>,
F<examples/benchmarks/gc_alloc_reuse.pasm>,
F<examples/benchmarks/gc_generations.pasm>,
F<examples/benchmarks/gc_header_new.pasm>,
F<examples/benchmarks/gc_header_reuse.pasm>,
F<examples/benchmarks/gc_waves_headers.pasm>,
F<examples/benchmarks/gc_waves_sizeable_data.pasm>.

=cut
