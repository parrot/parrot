#!./parrot -C
#
# ./parrot -C takfp.pir N         (N = 10 for shootout)
# by Joshua Isom

.sub main :main
	.param pmc argv
	.local int argc, n
	argc = argv
	n = 1
	unless argc == 2 goto argsok
	$S0 = argv[1]
	n = $S0
argsok:
	.local float f
	$N0 = n
	$N0 *= 3
	$N1 = n
	$N1 *= 2
	$N2 = n
	$N2 *= 1
	f = Tak($N0, $N1, $N2)
	$P0 = new .FixedFloatArray
	$P0 = 1
	$P0[0] = f
	$S0 = sprintf "%.1f\n", $P0
	print $S0
.end

.sub Tak
	.param float x
	.param float y
	.param float z
	unless y >= x goto endif
	.return(z)
endif:
	.local float tmp
	tmp = x - 1
	$N0 = Tak(tmp, y, z)
	tmp = y - 1
	$N1 = Tak(tmp, z, x)
	tmp = z - 1
	$N2 = Tak(tmp, x, y)
	.return Tak($N0, $N1, $N2)
.end

