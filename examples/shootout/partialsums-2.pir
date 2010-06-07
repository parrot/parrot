#!./parrot
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$
#
# ./parrot -R jit partialsums-2.pir N  (N = 2500000 for shootout)
#
# By Joshua Isom
# changed default value to N=25000 (shootout test default) Karl Forner

.loadlib 'trans_ops'

.sub main :main
	.param pmc argv
	.local int k, n
	.local num sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8, sum9, a
	.local pmc parray
	.local string result
	parray = new 'FixedFloatArray'
	parray = 9
	$I0 = argv
	n = 25000
	unless $I0 == 2 goto argok
	$S0 = argv[1]
	n = $S0
argok:

	sum1 = 0.0
	sum2 = 0.0
	sum3 = 0.0
	sum4 = 0.0
	sum5 = 0.0
	sum6 = 0.0
	sum7 = 0.0
	sum8 = 0.0
	sum9 = 0.0
	a = -1.0
	.local num div23, k2, k3
	div23 = 2.0 / 3.0
	# sum1 starts at zero - k := 0 case unrolled
	$N1 = pow div23, 0
	sum1 += $N1
	k = 1
beginfor:
	# This is what overoptimized looks like....
	$N1 = pow div23, k
	sum1 += $N1
	$N1 = sqrt k
	$N1 = 1.0 / $N1
	sum2 += $N1
	$N1 = k + 1.0
	$N1 *= k
	$N1 = 1.0 / $N1
	sum3 += $N1
	k2 = k * k
	$N1 = 1.0 / k2
	sum7 += $N1
	k3 = k2 * k
	$N1 = sin k
	$N1 *= $N1
	$N1 *= k3
	$N1 = 1.0 / $N1
	sum4 += $N1
	$N1 = cos k
	$N1 *= $N1
	$N1 *= k3
	$N1 = 1.0 / $N1
	sum5 += $N1
	$N1 = 1.0 / k
	sum6 += $N1
	neg a
	$N1 = a * $N1
	sum8 += $N1
	$N1 = 2.0 * k
	dec $N1
	$N1 = a / $N1
	sum9 += $N1
	inc k
	if k <= n goto beginfor

	parray[0] = sum1
	parray[1] = sum2
	parray[2] = sum3
	parray[3] = sum4
	parray[4] = sum5
	parray[5] = sum6
	parray[6] = sum7
	parray[7] = sum8
	parray[8] = sum9

	result = sprintf <<"END", parray
%.9f\t(2/3)^k
%.9f\tk^-0.5
%.9f\t1/k(k+1)
%.9f\tFlint Hills
%.9f\tCookson Hills
%.9f\tHarmonic
%.9f\tRiemann Zeta
%.9f\tAlternating Harmonic
%.9f\tGregory
END
	print result

.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
