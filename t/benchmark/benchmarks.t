#!perl
# Copyright (C) 2006-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( lib . ../lib ../../lib );

use Parrot::Test;
use Test::More;

=head1 NAME

t/benchmark/benchmarks.t - test scripts in examples/benchmarks

=head1 SYNOPSIS

    prove t/benchmark/benchmarks.t

=head1 DESCRIPTION

Called by 'make benchmark_tests'.

=cut

# Expected output from scripts in 'examples/benchmarks'.
# The expected out is needed for checking results with pir_output_is() and pir_output_like().
my %outputs = (
    q{addit.pir}        => qq(21001097.97\n),
    q{addit2.pir}       => qq(21001097.97\n),
    q{array_access.pir} => qr/
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
FixedFloatArray:\s\d+\.\d+s\n
\n
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
FixedIntegerArray:\s\d+\.\d+s\n
\n
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
FixedPMCArray:\s\d+\.\d+s\n
\n
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
FixedStringArray:\s\d+\.\d+s\n
\n
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
ResizableFloatArray:\s\d+\.\d+s\n
\n
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
ResizableIntegerArray:\s\d+\.\d+s\n
\n
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
ResizablePMCArray:\s\d+\.\d+s\n
\n
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
ResizableStringArray:\s\d+\.\d+s\n
\n
1\s\*\s1000\s=\s1000\n
100\s\*\s1000\s=\s100000\n
FixedPMCArray:\s\d+\.\d+s\n
\s+$/x,
    q{arriter.pir}     => qq(100000\n100000\n100000\n111111\n),
    q{arriter_o1.pir}  => qq(100000\n100000\n100000\n111111\n),
    q{fib.pir}     => qr/^fib\(28\)\s=\s317811$/x,
    q{oo1.pir}      => qq(10\n),
    q{oo2.pir}      => qq(10\n),
    q{oo3.pir}      => qq(10\n),
    q{oo5.pir}      => qq(10\n),
    q{oo6.pir}      => qq(500000\n),
    q{oofib.pir}    => qr/^fib\(24\)\s=\s46368\s\d+\.\d+s$/x,
    q{overload.pir} => qq(42\n),
    q{primes2.pir} => qr/^N\sprimes\scalculated\sto\s500\sis\s96\n
        last\sis:\s499\n$/x,
    q{primes2_i.pir} => qr/^N\sprimes\scalculated\sto\s10000\s
        is\s1230\nlast\sis:\s9973\n$/x,
    q{vpm.pir} => qq(100000;\nl hackerjust another per\n)
);

# These scripts are known to be failing.
my %todo = ();

plan tests => scalar keys %outputs;

foreach ( sort keys %outputs ) {
SKIP: {
        my $bench = Parrot::Test::slurp_file("examples/benchmarks/$_");
        skip( "Could not slurp $_", 1 ) unless $bench;

        my @todo = $todo{$_} ? ( todo => $todo{$_} ) : ();

        if ( ref $outputs{$_} eq 'Regexp' ) {
            example_output_like( "examples/benchmarks/$_", $outputs{$_}, @todo );
        }
        else {
            example_output_is( "examples/benchmarks/$_", $outputs{$_}, @todo );
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
