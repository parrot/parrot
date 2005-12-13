#!./parrot -j
#
# knucleotide.pir -j < f250k
# generated from:  fasta.pir -j 250000 > f250k

# by Joshua Isom

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
	chopn line, 1
	seq .= line
	line = readline stdin
	$I0 = length line
	unless $I0 goto endwhile_2
	$S0 = chopn line, -1
	if $S0 != ">" goto beginwhile_2
endwhile_2:
	upcase seq
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
	.local int seqlen
	.local int i
	.local pmc table
	table = new .Hash
	i = 0
	seqlen = length seq
beginfor:
	unless i < seqlen goto endfor
	$S0 = substr seq, i, len
	$I1 = length $S0
	if $I1 < len goto endfor
	$I0 = table[$S0]
	inc $I0
	table[$S0] = $I0
	inc i
	goto beginfor
endfor:
	sort_n_print(table, seqlen)
	print "\n"
.end

.sub sort_n_print
	.param pmc table
	.param int seqlen
	.local int i

	.local pmc array
	array = new .FixedPMCArray
	$I0 = elements table
	array = $I0
	
	.include "iterator.pasm"
	.local pmc iter
   	iter = new .Iterator, table
	set iter, .ITERATE_FROM_START
	i = 0
iter_loop_1:
	unless iter goto iter_end_1
	$S0 = shift iter
	$I0 = table[$S0]
	$P0 = new .FixedPMCArray
	$P0 = 2
	array[i] = $P0
	array[i;0] = $S0
	array[i;1] = $I0
	inc i
	goto iter_loop_1
iter_end_1:

	$P0 = global "sort"
	array."sort"($P0)
	
	$I0 = array
	i = 0
beginfor:
	unless i < $I0 goto endfor
	$S0 = array[i;0]
	$N0 = array[i;1]
	print $S0
	print " "
	$P0 = new .FixedFloatArray
	$P0 = 1
	$N1 = seqlen
	$N0 /= $N1
	$N0 *= 100
	$P0[0] = $N0
	$S0 = sprintf "%4.3f\n", $P0
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

