#!./parrot -j
#
# fannkuch.pir N         (N = 9 for shootout)
# by Joshua Isom
# modified by karl : default value of N=7 to match shootout output


.sub fannkuch
	.param int n
	.local pmc perm, perm1, count
	perm  = new .FixedIntegerArray
	perm1 = new .FixedIntegerArray
	count = new .FixedIntegerArray
	.local int flips, flipsMax, r, i, k, didpr
	.local int n1
	n1 = n
	dec n1
	
	if n > 1 goto countok
	.return(0)
countok:
	perm  = n
	perm1 = n
	count = n
	i = 0
for_1:
	perm1[i] = i
	inc i
	if i < n goto for_1
	r = n
	didpr = 0
	flipsMax = 0
beginwhile_1:
	unless didpr < 30 goto endif_1
			i = 0
		for_2:
			$I0 = perm1[i]
			inc $I0
			print $I0
		inc i
		if i < n goto for_2
		print "\n"
		inc didpr
	endif_1: 
	for_3:
		unless r != 1 goto endfor_3
			$I0 = r - 1
			count[$I0] = r
		dec r
		goto for_3
	endfor_3:
	$I0 = perm1[0]
	$I1 = iseq $I0, 0
	$I0 = perm1[n1]
	$I2 = iseq $I0, n1
	$I0 = or $I1, $I2
	if $I0 goto endif_2
			flips = 0
			perm = clone perm1
			k = perm1[0]
		dowhile_1:
			.local int j
			i = 1
			j = k - 1
			for_5:
			unless i < j goto endfor_5
				$I0 = perm[i]
				$I1 = perm[j]
				perm[i] = $I1
				perm[j] = $I0
			inc i
			dec j
			goto for_5
			endfor_5:
			inc flips
			j = perm[k]
			perm[k] = k
			k = j
		if k goto dowhile_1
		unless flipsMax < flips goto endif_3
			flipsMax = flips
		endif_3:
endif_2:
while_1:
	unless r == n goto endif_4
		.return(flipsMax)
	endif_4:
	.local int perm0
	perm0 = perm1[0]
	i = 0
	beginwhile_2:
		unless i < r goto endwhile_2
		k = i + 1
		$I0 = perm1[k]
		perm1[i] = $I0
		i = k
	goto beginwhile_2
	endwhile_2:
	perm1[r] = perm0
	$I0 = count[r]
	dec $I0
	count[r] = $I0
	if $I0 > 0 goto beginwhile_1
	inc r
	goto while_1
.end

.sub main :main
	.param pmc argv
	.local int argc
	argc = elements argv
	$S0 = "7"
	if argc == 1 goto default
	$S0 = argv[1]
default:
	$I0 = $S0
	$I1 = fannkuch($I0)
	print "Pfannkuchen("
	print $S0
	print ") = "
	print $I1
	print "\n"
	exit 0
.end
