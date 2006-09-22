=head1 NAME

examples/shootout/harmonic.pir - Partial sum of Harmonic series

=head1 SYNOPSIS

    % ./parrot examples/shootout/harmonic.pir -j 10000000

=head1 DESCRIPTION

Seemed to be deprecated, no longer found on shootout site (Karl), 
so could not find an expected output file.

Translated from C code by Greg Buchholz into PIR
by Peter Baylies <pbaylies@gmail.com>.

The C code is at:
   The Great Computer Language Shootout
   http://shootout.alioth.debian.org/

=cut

.sub 'main' :main
	.param pmc argv
	.local int argc
	.local int n
	.local num i, sum
	i = 1
	sum = 0
	argc = argv
	n = 10000000
	if argc <= 1 goto NREDO
	$S0 = argv[1]
	n = $S0
NREDO:	$N1 = 1 / i
	sum += $N1
	inc i
	dec n
	if n goto NREDO

      	$P0 = new .FixedFloatArray
	$P0 = 1
	$P0[0] = sum
	$S0 = sprintf "%.9f\n", $P0
        print $S0
	end
.end
