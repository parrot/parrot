# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/bench_new.pasm - PMC Creation

=head1 SYNOPSIS

    % ./parrot examples/benchmarks/bench_new.pasm

=head1 DESCRIPTION

Creates a C<PerlArray> PMC and fills it with C<PerlInt> PMCs. Then
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

	set I2, 1000
	set I3, 1000
	set I0, I2
	time N5
loop:	new P0, .PerlArray
	set P0, I3
	set I1, 0
fill:	new P1, .PerlInt
	set P1, I1
	set P0[I1], P1
	inc I1
	lt I1, I3, fill
	dec I0
	if I0, loop
	sweep 1
	time N6
	sub N7, N6, N5
	print N7
 	print " seconds. "
	set N8, I2
	div N1, N8, N7
	print N1
	print " loops/sec\n"
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
	interpinfo I1, 4
	print "There are "
	print I1
	print " active PMC structs\n"
	interpinfo I1, 6
	print "There are "
	print I1
	print " total PMC structs\n"
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

F<examples/benchmarks/gc_alloc_new.pasm>,
F<examples/benchmarks/gc_alloc_reuse.pasm>,
F<examples/benchmarks/gc_generations.pasm>,
F<examples/benchmarks/gc_header_new.pasm>,
F<examples/benchmarks/gc_header_reuse.pasm>,
F<examples/benchmarks/gc_waves_headers.pasm>,
F<examples/benchmarks/gc_waves_sizeable_data.pasm>,
F<examples/benchmarks/gc_waves_sizeable_headers.pasm>.

=cut
