#!./parrot -C
#
# partialsums N  (N = 2500000 for shootout)
#
# By Joshua Isom

.sub main :main
	.param pmc argv
	.local int k, n
	.local float sum, a
	.local pmc parray
	parray = new .FixedFloatArray
	parray = 1
	$I0 = argv
	n = 2500000
	unless $I0 == 2 goto argok
	$S0 = argv[1]
	n = $S0
argok:

	sum = 0.0
	$N0 = 2.0 / 3.0
	k = 0
beginfor_0:
	unless k <= n goto endfor_0
	$N1 = pow $N0, k
	sum += $N1
	inc k
	goto beginfor_0
endfor_0:
	parray[0] = sum
	$S0 = sprintf "%.9f\t(2/3)^k\n", parray
	print $S0

	sum = 0.0
	k = 1
beginfor_1:
	unless k <= n goto endfor_1
	$N1 = sqrt k
	$N1 = 1.0 / $N1
	sum += $N1
	inc k
	goto beginfor_1
endfor_1:
	parray[0] = sum
	$S0 = sprintf "%.9f\tk^-0.5\n", parray
	print $S0

	sum = 0.0
	k = 1
beginfor_3:
	unless k <= n goto endfor_3
	$N1 = k + 1.0
	$N1 *= k
	$N1 = 1.0 /$N1
	sum += $N1
	inc k
	goto beginfor_3
endfor_3:
	parray[0] = sum
	$S0 = sprintf "%.9f\t1/k(k+1)\n", parray
	print $S0

	sum = 0.0
	k = 1
beginfor_4:
	unless k <= n goto endfor_4
	$N1 = sin k
	$N1 *= $N1
	$N1 *= k
	$N1 *= k
	$N1 *= k
	$N1 = 1.0 /$N1
	sum += $N1
	inc k
	goto beginfor_4
endfor_4:
	parray[0] = sum
	$S0 = sprintf "%.9f\tFlint Hills\n", parray
	print $S0

	sum = 0.0
	k = 1
beginfor_5:
	unless k <= n goto endfor_5
	$N1 = cos k
	$N1 *= $N1
	$N1 *= k
	$N1 *= k
	$N1 *= k
	$N1 = 1.0 /$N1
	sum += $N1
	inc k
	goto beginfor_5
endfor_5:
	parray[0] = sum
	$S0 = sprintf "%.9f\tCookson Hills\n", parray
	print $S0

	sum = 0.0
	k = 1
beginfor_6:
	unless k <= n goto endfor_6
	$N1 = 1.0 /k
	sum += $N1
	inc k
	goto beginfor_6
endfor_6:
	parray[0] = sum 
	$S0 = sprintf "%.9f\tHarmonic\n", parray
	print $S0

	sum = 0.0
	k = 1
beginfor_7:
	unless k <= n goto endfor_7
	$N1 = k * k
	$N1 = 1.0 / $N1
	sum += $N1
	inc k
	goto beginfor_7
endfor_7:
	parray[0] = sum
	$S0 = sprintf "%.9f\tRiemann Zeta\n", parray
	print $S0

	sum = 0.0
	a = -1.0
	k = 1
beginfor_8:
	unless k <= n goto endfor_8
	neg a
	$N1 = a / k
	sum += $N1
	inc k
	goto beginfor_8
endfor_8:
	parray[0] = sum
	$S0 = sprintf "%.9f\tAlternating Harmonic\n", parray
	print $S0

	sum = 0.0
	a = -1.0
	k = 1
beginfor_9:
	unless k <= n goto endfor_9
	neg a
	$N1 = 2.0 * k
	dec $N1
	$N1 = a / $N1
	sum += $N1
	inc k
	goto beginfor_9
endfor_9:
	parray[0] = sum
	$S0 = sprintf "%.9f\tGregory\n", parray
	print $S0

.end
