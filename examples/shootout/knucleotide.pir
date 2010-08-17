# Copyright (C) 2005-2010, Parrot Foundation.
# $Id$

.loadlib 'io_ops'

.sub main :main
	.local pmc stdin
	.local string line
	stdin = getstdin
	# Skip to block THREE
beginwhile_1:
	line = readline stdin
	$S0 = chopn line, -6
	if $S0 != ">THREE" goto beginwhile_1
	line = ''
	.local string seq
beginwhile_2:
	line = chopn line, 1
	seq .= line
	line = readline stdin
	$I0 = length line
	unless $I0 goto endwhile_2
	$S0 = chopn line, -1
	if $S0 != ">" goto beginwhile_2
endwhile_2:
	seq = upcase seq
	sort_seq(seq, 1)
	sort_seq(seq, 2)
	find_seq(seq, "GGT")
	find_seq(seq, "GGTA")
	find_seq(seq, "GGTATT")
	find_seq(seq, "GGTATTTTAATT")
	find_seq(seq, "GGTATTTTAATTTATAGT")
.end

.sub sort_seq
	.param string seq
	.param int len
	.local int i, seqend
	.local pmc table
	table = new 'Hash'
	i = 0
	seqend = length seq
beginfor:
	unless i < seqend goto endfor
	$S0 = substr seq, i, len
	$I1 = length $S0
	if $I1 < len goto endfor
	$I0 = table[$S0]
	inc $I0
	table[$S0] = $I0
	inc i
	goto beginfor
endfor:
	sort_n_print(table, i)
	print "\n"
.end

.include "iterator.pasm"
.sub sort_n_print
	.param pmc table
	.param int seqlen
	.local int i

	.local pmc array
	array = new 'FixedPMCArray'
	$I0 = elements table
	array = $I0

	.local pmc it
    it = iter table
	set it, .ITERATE_FROM_START
	i = 0
iter_loop_1:
	unless it goto iter_end_1
	$S0 = shift it
	$I0 = table[$S0]
	$P0 = new 'FixedPMCArray'
	$P0 = 2
	array[i] = $P0
	array[i;0] = $S0
	array[i;1] = $I0
	inc i
	goto iter_loop_1
iter_end_1:

	$P0 = get_global "sort"
	array."sort"($P0)

	$I0 = array
	i = 0
beginfor:
	unless i < $I0 goto endfor
	$S0 = array[i;0]
	$N0 = array[i;1]
	print $S0
	print " "
	$P0 = new 'FixedFloatArray'
	$P0 = 1
	$N1 = seqlen
	$N0 /= $N1
	$N0 *= 100
	$P0[0] = $N0
	$S0 = sprintf "%.3f\n", $P0
	print $S0
	inc i
	goto beginfor
endfor:
.end

.sub sort
	.param pmc a
	.param pmc b
	$I0 = a[1]
	$I1 = b[1]
	$I2 = cmp $I1, $I0
	.return($I2)
.end

.sub find_seq
	.param string seq
	.param string s
	.local int i
	i = 0
	$I0 = 0
beginwhile:
	$I2 = $I0 + 1
	$I0 = index seq, s, $I2
	if $I0 == -1 goto endwhile
	inc i
	goto beginwhile
endwhile:
	print i
	print "\t"
	print s
	print "\n"
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
