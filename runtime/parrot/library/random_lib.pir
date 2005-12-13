# used by examples/shootout/random.pir and others
# by Joshua Isom

.const int IM = 139968
.const int IA = 3877
.const int IC = 29573

.sub init :load :anon
	.local pmc last
	last = new .Integer
	last = 42
	global "_last_seed" = last
.end

.sub gen_random
	.param float max
	.local pmc last
	last = global "_last_seed"
        $I0 = last
	$I0 *= IA
	$I0 += IC
	$I0 %= IM
        last = $I0
        $N0 = $I0
        $N1 = IM
	$N0 *= max
	$N0 /= $N1
	.return($N0)
.end

