#!./parrot -C
#
# random.pir N         (N = 900000 for shootout)
# by Joshua Isom

# this needs random_lib.pir either in the parrot directory
# or in $prefix.../library

.sub main :main
	.param pmc argv
	$S0 = argv[1]
	$I0 = $S0
	load_bytecode "random_lib.pir"
	$P0 = global "gen_random"
        .local float max, r
        max = 100.0
while_1:
	r = $P0(max)
	dec $I0
	if $I0 goto while_1
	$P0 = new .FixedFloatArray
	$P0 = 1
	$P0[0] = r
	$S0 = sprintf "%.9f\n", $P0
	print $S0
	.return(0)
.end

