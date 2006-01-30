#!./parrot -j
#
# nsieve-bits N  (N = 9 for shootout)
# by Leopold Toetsch
# modified by Joshua Isom

# set bits - this might be cheating see nsieve-bits-2 for resetting bits

.sub primes_in_range
    .param int M
    .param pmc flags
    .local int i, count
    i = 2
    count = 0
lp1:
     $I0 = flags[i]
     if $I0 goto not_p
     .local int j
     j = i + i
     if j >= M goto done
lp2:
     flags[j] = 1
     j += i
     if j < M goto lp2
done:
     inc count
not_p:
     inc i
     if i < M goto lp1
    .return (count)
.end
.sub main :main
    .param pmc argv
    $S0 = argv[1]
    .local int i, j, N, M, count
	.local pmc flags
    flags = new .FixedBooleanArray
    N = $S0
	M = 1 << N
	M *= 10000
	flags = M
	null i
    null j
loop:
    $I0 = N - j
    inc j
    $I1 = 1 << $I0
    M = $I1 * 10000
    count = primes_in_range(M, flags)
    $P0 = new .FixedIntegerArray
    $P0 = 2
    $P0[0] = M
    $P0[1] = count
    $S0 = sprintf "Primes up to %8u %8u\n", $P0
    print $S0
    inc i
    if i < 3 goto loop
.end
    
