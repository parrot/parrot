#!./parrot
# Copyright (C) 2005-2009, Parrot Foundation.
# $Id$
#
# fasta.pir N         (N = 2500000 for shootout)
# by Joshua Isom
# modified by karl : fixed bug in default value (N=1000) assignment


# 48.2 sec on AMD@2000/512K cache

.sub makeCumulative
	.param pmc genelist
	.param int count
	.local num cp
	.local int i
	cp = 0.0
	i = 0
beginfor:
	unless i < count goto endfor
	$N0 = genelist[i;1]
	cp += $N0
	genelist[i;1] = cp
	inc i
	goto beginfor
endfor:
.end

.sub selectRandom
	.param pmc genelist
	.param int count
	.local num r
	r = gen_random(1.0)
	.local int i, lo, hi

	$N0 = genelist[0;1]
	unless r < $N0 goto endif
	$S0 = genelist[0;0]
	.return($S0)
endif:
	lo = 0
	hi = count - 1
beginwhile:
	$I0 = lo + 1
	unless hi > $I0 goto endwhile
	i = hi + lo
	i /= 2
	$N0 = genelist[i;1]
	unless r < $N0 goto else_1
	hi = i
	goto endif_1
else_1:
	lo = i
endif_1:
	goto beginwhile
endwhile:
	$S0 = genelist[hi;0]
	.return($S0)
.end

.const int LINE_LENGTH = 60

.sub makeRandomFasta
	.param string id
	.param string desc
	.param pmc genelist
	.param int count
	.param int n
	.local int todo, i, m
	todo = n

	print ">"
	print id
	print " "
	print desc
	print "\n"

	.local string pick
beginfor:
	unless todo > 0 goto endfor

	unless todo < LINE_LENGTH goto else
		m = todo
	goto endif
	else:
		m = LINE_LENGTH
	endif:

	i = 0
beginfor_1:
	unless i < m goto endfor_1
	$S0 = selectRandom(genelist, count)
	pick .= $S0
	inc i
	goto beginfor_1
endfor_1:
	print pick
	print "\n"
	pick = ''

	todo -= LINE_LENGTH
	goto beginfor
endfor:
.end

.sub makeRepeatFasta
	.param string id
	.param string desc
	.param string s
	.param int n
	.local int todo, k, kn, m
	todo = n
	k = 0
	kn = length s

	print ">"
	print id
	print " "
	print desc
	print "\n"

beginfor:
	unless todo > 0 goto endfor

	unless todo < LINE_LENGTH goto else
		m = todo
	goto endif
	else:
		m = LINE_LENGTH
	endif:

beginwhile:
	$I0 = kn - k
	unless m >= $I0 goto endwhile
	$S0 = substr s, k
	print $S0
	$I0 = kn - k
	m -= $I0
	k = 0
	goto beginwhile
endwhile:

	$S0 = substr s, k, m
	print $S0
	print "\n"
	k += m

	todo -= LINE_LENGTH
	goto beginfor
endfor:
.end

.macro InitStruct (iub, i, char, num)
	$P0 = new 'FixedPMCArray'
	$P0 = 2
	.iub[.i] = $P0
	.iub[.i;0] = .char
	.iub[.i;1] = .num
.endm

.sub main :main
	.param pmc argv
	.local pmc interp, stdout
	.local int n
	# stdout is linebuffered per default - make it block buffered
        interp = getinterp
	stdout = interp.'stdhandle'(1)
	stdout.'buffer_size'(40960)
	$I0 = argv
	if $I0 > 1 goto argsok
	n = 1000
	goto argsdone
argsok:
	$S0 = argv[1]
	n = $S0
argsdone:
	.local pmc iub
	iub = new 'FixedPMCArray'
	iub = 15
	.InitStruct(iub, 0, "a", 0.27)
	.InitStruct(iub, 1, "c", 0.12)
	.InitStruct(iub, 2, "g", 0.12)
	.InitStruct(iub, 3, "t", 0.27)

	.InitStruct(iub, 4, "B", 0.02)
	.InitStruct(iub, 5, "D", 0.02)
	.InitStruct(iub, 6, "H", 0.02)
	.InitStruct(iub, 7, "K", 0.02)
	.InitStruct(iub, 8, "M", 0.02)
	.InitStruct(iub, 9, "N", 0.02)
	.InitStruct(iub, 10, "R", 0.02)
	.InitStruct(iub, 11, "S", 0.02)
	.InitStruct(iub, 12, "V", 0.02)
	.InitStruct(iub, 13, "W", 0.02)
	.InitStruct(iub, 14, "Y", 0.02)

	.local pmc homosapiens
	homosapiens = new 'FixedPMCArray'
	homosapiens = 4
	.InitStruct(homosapiens, 0, "a", 0.3029549426680)
	.InitStruct(homosapiens, 1, "c", 0.1979883004921)
	.InitStruct(homosapiens, 2, "g", 0.1975473066391)
	.InitStruct(homosapiens, 3, "t", 0.3015094502008)

	.local string alu
	alu = "GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA"

	makeCumulative(iub, 15)
	makeCumulative(homosapiens, 4)

	$I0 = n * 2
	makeRepeatFasta("ONE", "Homo sapiens alu", alu, $I0)
	$I0 = n * 3
	makeRandomFasta ("TWO", "IUB ambiguity codes", iub, 15, $I0)
	$I0 = n * 5
	makeRandomFasta ("THREE", "Homo sapiens frequency", homosapiens, 4, $I0)
.end

.const num IM = 139968.0
.const num IA = 3877.0
.const num IC = 29573.0

.sub gen_random
	.param num max
	.local num last
	last = 42.0
loop:
	$N0 = last
	$N0 *= IA
	$N0 += IC
	$N0 %= IM
	$N1 = max
	$N1 *= $N0
	$N1 /= IM
	last = $N0
	.yield($N1)
	get_params "0", max
	goto loop
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
