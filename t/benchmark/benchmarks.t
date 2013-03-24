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
    q{addit.pasm}       => qq(21001097.97\n),
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
    q{bench_newp.pasm} => qr/^\d+\.\d+\sseconds.\s\d+\.\d+\sloops\/sec\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sPMC\sstructs\n
        There\sare\s\d+\stotal\sPMC\sstructs\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q{fib.pir}     => qr/^fib\(28\)\s=\s317811$/x,
    q{freeze.pasm} => qr/^constr.time\s\d+\.\d+\n
        freeze\stime\s\d+\.\d+\n
        \s\sthaw\stime\s\d+\.\d+\n
        Image\slen\s\d+\n
        ResizablePMCArray\s100000\n$/x,
    q{gc_alloc_new.pasm} => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q{gc_alloc_reuse.pasm} => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q{gc_generations.pasm} => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q{gc_header_new.pasm} => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q{gc_header_reuse.pasm} => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q{gc_waves_headers.pasm} => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q{gc_waves_sizeable_data.pasm} => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q{gc_waves_sizeable_headers.pasm} => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
#omitted because they're slow and doesn't exercise anything novel
#    q{mops.pasm} => qr/^Iterations:\s\s\s\s10000000\n
#        Estimated\sops:\s20000000\n
#        done\n
#        Elapsed\stime:\s\s\d+\.\d+\n
#        M\sop\/s:\s\s\s\s\s\s\s\s\d+\.\d+\n$/x,
#    q(mops_intval.pasm) => qr/^Iterations:\s\s\s\s100000000\n
#        Estimated\sops:\s200000000\n
#        Elapsed\stime:\s\s\d+\.\d+\n
#        M\sop\/s:\s\s\s\s\s\s\s\s\d+\.\d+\n$/x,
    q{oo1.pir}      => qq(10\n),
    q{oo2.pir}      => qq(10\n),
    q{oo3.pir}      => qq(10\n),
    q{oo5.pir}      => qq(10\n),
    q{oo6.pir}      => qq(500000\n),
    q{oofib.pir}    => qr/^fib\(24\)\s=\s46368\s\d+\.\d+s$/x,
    q{overload.pir} => qq(42\n),
    q{primes.pasm}  => qr/^N\sprimes\sup\sto\s5000\sis:\s669\n
        last\sis:\s4999\n
        Elapsed\stime:\s\d+\.\d+\n$/x,
    q{primes2.pir} => qr/^N\sprimes\scalculated\sto\s500\sis\s96\n
        last\sis:\s499\n$/x,
    q{primes2_i.pir} => qr/^N\sprimes\scalculated\sto\s10000\s
        is\s1230\nlast\sis:\s9973\n$/x,
    q{primes_i.pasm} => qr/^N\sprimes\sup\sto\s10000\sis:\s1229\n
        last\sis:\s9973\nElapsed\stime:\s\d+\.\d+\n$/x,
    q{sort_ffa.pir} => qr/Sorted 1000000 floats/,
    q{sort_fia.pir} => qr/Sorted 1000000 integers/,
    q{sort_rfa.pir} => qr/Sorted 1000000 floats/,
    q{sort_ria.pir} => qr/Sorted 1000000 integers/,
    q{stress.pasm}     => qr/^A\stotal\sof\s\d+\sGC\sruns\s
        were\smade\n$/x,
    q{stress1.pasm} => qr/^\d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sGC\sruns\swere\smade\n$/x,
    q{stress2.pasm} => qq(),
    q{stress3.pasm} => qr/^A\stotal\sof\s\d+\sGC\sruns\swere\smade\n
        \d+\sactive\sPMCs\n
        \d+\stotal\s\sPMCs\n$/x,
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
