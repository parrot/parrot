# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/gc_generations.pasm - GC/DOD Benchmark

=head1 SYNOPSIS

    % ./parrot examples/benchmarks/gc_generations.pasm

=head1 DESCRIPTION

Runs a loop several loops, each making big strings with C<repeat>, then
prints out some statistics indicating:

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

	set I0, 70
	set I2, 70
	set I4, 70
	set S0,  "                                                 "
	time N5
	set I1, 0
loop:
	repeat S1, S0, 2
	repeat S2, S0, 2
	repeat S3, S0, 2
	repeat S4, S0, 2
	repeat S5, S0, 2
	repeat S6, S0, 2
	repeat S7, S0, 2
	repeat S8, S0, 2

        set I3, 0
iloop:

	repeat S9, S0, 2
	repeat S10, S0, 2
	repeat S11, S0, 2
	repeat S12, S0, 2
	repeat S13, S0, 2
	repeat S14, S0, 2
	repeat S15, S0, 2
	repeat S16, S0, 2
        set I5, 0
jloop:
	repeat S17, S0, 2
	repeat S18, S0, 2
	repeat S19, S0, 2
	repeat S20, S0, 2
	repeat S21, S0, 2
	repeat S22, S0, 2
	repeat S23, S0, 2
	repeat S24, S0, 2

	inc I5
	lt I5, I4, jloop

	inc I3
	lt I3, I2, iloop

	inc I1
	lt I1, I0, loop


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
F<examples/benchmarks/gc_header_new.pasm>,
F<examples/benchmarks/gc_header_reuse.pasm>,
F<examples/benchmarks/gc_waves_headers.pasm>,
F<examples/benchmarks/gc_waves_sizeable_data.pasm>,
F<examples/benchmarks/gc_waves_sizeable_headers.pasm>.

=cut
