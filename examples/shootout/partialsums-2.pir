#!./parrot -j
#
# partialsums N  (N = 2500000 for shootout)
#
# By Joshua Isom

.sub main :main
	.param pmc argv
	.local int k, n
	.local num sum1, sum2, sum3, sum4, sum5, sum6, sum7, sum8, sum9, a
	.local pmc parray
	.local string result
	parray = new .FixedFloatArray
	parray = 9
	$I0 = argv
	n = 2500000
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
	$N0 = 2.0 / 3.0
	$I2 = 2
	k = 1
beginfor:
	# This is what overoptimized looks like....
	$N1 = sqrt k
	$N1 = 1.0 / $N1
	sum2 += $N1
	$N1 = k + 1.0
	$N1 *= k
	$N1 = 1.0 / $N1
	sum3 += $N1
	$N1 = k * k
	$N2 = 1.0 / $N1
	sum7 += $N2
	$N1 *= k
	$N2 = sin k
	$N2 *= $N2
	$N2 *= $N1
	$N2 = 1.0 / $N2
	sum4 += $N2
	$N2 = cos k
	$N2 *= $N2
	$N2 *= $N1
	$N2 = 1.0 / $N2
	sum5 += $N2
	$N1 = 1.0 / k
	sum6 += $N1
	neg a
	$N1 = a / k
	sum8 += $N1
	$N1 = 2.0 * k
	dec $N1
	$N1 = a / $N1
	sum9 += $N1
lastfor:
	$N1 = k - 1
	$N1 = pow $N0, $N1
	sum1 += $N1
	inc k
	if k <= n goto beginfor
	dec $I2
	if $I2 goto lastfor

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

