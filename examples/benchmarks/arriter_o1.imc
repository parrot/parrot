# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/benchmarks/arriter_o1.imc - Iterator Benchmark

=head1 SYNOPSIS

    % time ./parrot examples/benchmarks/arriter_o1.imc

=head1 DESCRIPTION

Hand-crafted PIR code version of F<examples/benchmarks/arriter.pl>.

=cut

# optimizations:
# - pull somecode out of the inner loop, s. opt below

.sub _main
.include "iterator.pasm"
    new_pad 0
    .local PerlHash ha
    ha = new PerlHash
    store_lex -1, "ha", ha
    .local PerlHash hb
    ha = new PerlHash
    store_lex -1, "hb", hb
    .local PerlUndef i
    i = new PerlUndef
    store_lex -1, "i", i
    .local PerlArray k
    k = new PerlArray
    store_lex -1, "k", k
    .local PerlArray nk
    nk = new PerlArray
    store_lex -1, "nk", nk
    .local PerlUndef s
    s = new PerlUndef
    store_lex -1, "s", s

    find_lex $P0 , "i"
    $P1 = new PerlUndef
    $P1 = 10
for_1_start:
    if $P0 >= $P1 goto for_1_end
	find_lex $P2 , "s"
	$P3 = new PerlUndef
	$P3 = 65
	$P4 = new PerlUndef
	add $P4, $P3, $P0
	set $I0, $P4
	chr $S0, $I0
	$P2 = new PerlUndef
	$P2 = $S0
	push k, $P2
	inc $P0
	branch for_1_start
for_1_end:

    .local PerlUndef e
    e = new PerlUndef
    store_lex -1, "e", e
    find_lex $P0 , "e"
    $P0 = 0
    $P1 = new PerlUndef
    $P1 = 3
for_2_start:
    if $P0 > $P1 goto for_2_end
	find_lex $P2 , "i"
	$P2 = 0
	$P3 = new PerlUndef
	$P3 = 10
    for_3_start:
	if $P2 >= $P3 goto for_3_end
	    find_lex $P5 , "k"
	    $P4 = new Iterator, $P5
	    $P4 = .ITERATE_FROM_START
		# opt, out of loop
		# scalar results may go out of loop
		$P6 = new PerlUndef
		# invariant
		$P6 = 65
		$P7 = new PerlUndef
		$P8 = new PerlUndef
		find_lex $P11, "nk"
		# end opt
	iter_1_start:
	    unless $P4 goto iter_1_end
		add $P7, $P6, $P2	# 65 + $i
		$I0 = $P7
		chr $S0, $I0
		$P8 = $S0
		shift $P9, $P4		# $s
		# $P10 goes into the aggregate and can not be
		# pulled out of loop
		$P10 = new PerlUndef
		concat $P10, $P9, $P8
		push $P11, $P10
		branch iter_1_start
	iter_1_end:
	    inc $P2
	    branch for_3_start
    for_3_end:
	find_lex $P12 , "nk"
	clone $P13, $P12
	store_lex -1, "k", $P13
	$P12 = 0
	inc $P0
	branch for_2_start
for_2_end:

    find_lex $P14 , "k"
    $I0 = $P14
    print $I0
    print "\n"

    $P15 = new Iterator, $P14
    $P15 = .ITERATE_FROM_START
    find_lex $P16 , "ha"
    $I1 = 0
iter_2_start:
    unless $P15 goto iter_2_end
        inc $I1
	shift $P17, $P15
	$S0 = $P17
	$P16[$S0] = 1
	branch iter_2_start
iter_2_end:

    print $I1
    print "\n"
    $I0 = $P16
    print $I0
    print "\n"
    $I0 = defined $P16["AAAAA"]
    print $I0
    $I0 = defined $P16["ABCDE"]
    print $I0
    $I0 = defined $P16["BBBBB"]
    print $I0
    $I0 = defined $P16["CCCCC"]
    print $I0
    $I0 = defined $P16["HHHHH"]
    print $I0
    $I0 = defined $P16["IIIII"]
    print $I0
    print "\n"
    end
.end

=head1 SEE ALSO

F<examples/benchmarks/arriter.imc>,
F<examples/benchmarks/arriter.pl>.

=cut
