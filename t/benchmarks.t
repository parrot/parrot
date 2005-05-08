#! perl
# Copyright: 2004-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/benchmarks.t - test scrips in examples/benchmarks

=head1 DESCRIPTION

Called by 'make testbench'.

=cut

use strict;
use warnings;

use Parrot::Test;
use Test::More;

# Set up expected output from files in 'examples/benchmarks'
my %outputs = (
    q(addit.imc)        => qq(21001097.970000\n),
    q(addit.pasm)       => qq(21001097.970000\n),
    q(addit2.imc)       => qq(21001097.970000\n),
    q(array_access.imc) => qr/^1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        Array:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        FixedFloatArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        FixedIntegerArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        FixedPMCArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        FixedStringArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        IntList:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        OrderedHash:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        PerlArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        ResizableFloatArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        ResizableIntegerArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        ResizablePMCArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        ResizableStringArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        SArray:\s\d+\.\d+s\n
        \n
        1\s\*\s1000\s=\s1000\n
        1000\s\*\s1000\s=\s1000000\n
        StringArray:\s\d+\.\d+s\n$/x,
    q(arriter.imc)    => qq(100000\n100000\n100000\n111111\n),
    q(arriter_o1.imc) => qq(100000\n100000\n100000\n111111\n),
    q(bench_newp.pasm) => qr/^\d+\.\d+\sseconds.\s\d+\.\d+\sloops\/sec\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sPMC\sstructs\n
        There\sare\s\d+\stotal\sPMC\sstructs\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(fib.imc)     => qr/^fib\(28\)\s=\s317811\s\d+\.\d+s$/x,
    q(freeze.pasm) => qr/^constr.time\s\d+\.\d+\n
        freeze\stime\s\d+\.\d+\n
        \s\sthaw\stime\s\d+\.\d+\n
        Image\slen\s\d+\n
        PerlArray\s100000\n$/x,
    q(gc_alloc_new.pasm) => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(gc_alloc_reuse.pasm) => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(gc_generations.pasm) => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(gc_header_new.pasm) => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(gc_header_reuse.pasm) => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(gc_waves_headers.pasm) => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(gc_waves_sizeable_data.pasm) => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(gc_waves_sizeable_headers.pasm) => qr/^\d+\.\d+\sseconds\.\n
        A\stotal\sof\s\d+\sbytes\swere\sallocated\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        A\stotal\sof\s\d+\scollection\sruns\swere\smade\n
        Copying\sa\stotal\sof\s\d+\sbytes\n
        There\sare\s\d+\sactive\sBuffer\sstructs\n
        There\sare\s\d+\stotal\sBuffer\sstructs\n$/x,
    q(mops.pasm)      => qr/^Iterations:\s\s\s\s10000000\n
        Estimated\sops:\s20000000\n
        done\n
        Elapsed\stime:\s\s\d+\.\d+\n
        M\sop\/s:\s\s\s\s\s\s\s\s\d+\.\d+\n$/x,
    q(oo1.pasm)      => qq(10\n),
    q(oo2.pasm)      => qq(10\n),
    q(oo3.pasm)      => qq(10\n),
    q(oo4.pasm)      => qq(500000\n),
    q(oo5.imc)       => qq(10\n),
    q(oo6.imc)       => qq(500000\n),
    q(oofib.imc)     => qr/^fib\(28\)\s=\s317811\s\d+\.\d+s$/x,
    q(overload.imc)  => qq(42\n),
    q(primes.pasm)   => qr/^N\sprimes\sup\sto\s10000\sis:\s1229\n
        last\sis:\s10001\n
        Elapsed\stime:\s\d+\.\d+\n$/x,
    q(primes2.pasm) => qr/^N\sprimes\scalculated\sto\s5000\sis\s670\n
        last\sis:\s4999\n$/x,
    q(primes2_i.pasm) => qr/^N\sprimes\scalculated\sto\s10000\s
        is\s1230\nlast\sis:\s9973\n$/x,
    q(primes_i.pasm) => qr/^N\sprimes\sup\sto\s10000\sis:\s1229\n
        last\sis:\s9973\nElapsed\stime:\s\d+\.\d+\n$/x,
    q(shared_ref.pasm) => qq(),
    q(stress.pasm)     => qr/^A\stotal\sof\s\d+\sDOD\sruns\s
        were\smade\n$/x,
    q(stress1.pasm) => qr/^\d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\.\d+\n
        A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n$/x,
    q(stress2.pasm) => qq(),
    q(stress3.pasm) => qr/^A\stotal\sof\s\d+\sDOD\sruns\swere\smade\n
        \d+\sactive\sPMCs\n
        \d+\stotal\s\sPMCs\n$/x,
    q(vpm.imc) => qq(100000;\nl hackerjust another per\n)
);

# array_access.imc has weird output
my %filters = ( q(array_access.imc) => \&array_access_imc_filter );

sub array_access_imc_filter {
    $_[ 0 ] =~ s/arr_size = S1/arr_size = 1000/;
}

plan tests => scalar keys %outputs;

foreach ( sort keys %outputs ) {
  SKIP: {
        my $bench;
        eval {
            my $file = q(examples/benchmarks/) . $_;
            open( BENCH, qq(examples/benchmarks/$_) )
              or die qq(Couldn't open $_:  $!.\n);
            while ( my $line = <BENCH> ) { $bench .= $line; }
            close( BENCH );

            if ( exists $filters{ $_ } ) {
                &{ $filters{ $_ } }( $bench );
            }
        };
        skip( $@, 1 ) if $@;

        if ( ref $outputs{ $_ } eq q(Regexp) ) {
            if ( /\.pasm$/ ) {
                output_like( $bench, $outputs{ $_ }, $_ );
            }
            elsif ( /\.imc$/ ) {
                pir_output_like( $bench, $outputs{ $_ }, $_ );
            }
            else {
                skip( qq(Unknown file type:  $_.), 1 );
            }
        }
        else {
            if ( /\.pasm$/ ) {
                output_is( $bench, $outputs{ $_ }, $_ );
            }
            elsif ( /\.imc$/ ) {
                pir_output_is( $bench, $outputs{ $_ }, $_ );
            }
            else {
                skip( qq(Unknown file type:  $_.), 1 );
            }
        }
    }
}
