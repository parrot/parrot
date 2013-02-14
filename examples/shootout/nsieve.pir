#!./parrot
# Copyright (C) 2006-2009, Parrot Foundation.
#
# ./parrot -R jit nsieve.pir N  (N = 9 for shootout)
# by Leopold Toetsch
# modified by Joshua Isom
# modified by Karl Forner to accept shootout default value of N=2

.sub primes_in_range
	.param int M
	.param pmc flags
    .local int i, count
	flags."fill"(1)
	i = 2
	count = 0
lp1:
     $I0 = flags[i]
     unless $I0 goto not_p
     .local int j
     j = i + i
     if j >= M goto done
lp2:
     flags[j] = 0
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
	.local pmc flags
	.local int argc, i, j, N, M, count

	flags = new 'FixedIntegerArray'
	N = 2
	argc = argv
	if argc == 1 goto default
    $S0 = argv[1]
	N = $S0
default:
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
    $P0 = new 'FixedIntegerArray'
    $P0 = 2
    $P0[0] = M
    $P0[1] = count
    $S0 = sprintf "Primes up to %8u %8u\n", $P0
    print $S0
    inc i
	if i < 3 goto loop
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
