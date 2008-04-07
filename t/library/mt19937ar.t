#!perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 10;

=head1 NAME

t/library/mt19937ar.t - Math::Random::MT tests

=head1 SYNOPSIS

    % prove t/library/mt19937ar.t

=cut

pir_output_is( << 'CODE', << 'OUTPUT', 'MT typeof' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $S0 = typeof mt
    print $S0
    print "\n"
.end
CODE
Math;Random;MT
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'MT can init_genrand' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $I0 = can mt, 'init_genrand'
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'MT can init_by_array' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $I0 = can mt, 'init_by_array'
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'MT can genrand_int32' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $I0 = can mt, 'genrand_int32'
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'MT can genrand_int31' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $I0 = can mt, 'genrand_int31'
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'MT can genrand_real1' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $I0 = can mt, 'genrand_real1'
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'MT can genrand_real2' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $I0 = can mt, 'genrand_real2'
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'MT can genrand_real3' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $I0 = can mt, 'genrand_real3'
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


pir_output_is( << 'CODE', << 'OUTPUT', 'MT can genrand_res53' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    $I0 = can mt, 'genrand_res53'
    print $I0
    print "\n"
.end
CODE
1
OUTPUT


my $out = Parrot::Test::slurp_file(File::Spec->catfile( 't', 'library', 'mt19937ar.txt' ));
pir_output_is( << 'CODE', $out, 'mt19937ar output' );
.sub test :main
    load_bytecode 'library/Math/Random/mt19937ar.pbc'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]
    .local pmc init
    new init, 'FixedIntegerArray'
    set init, 4
    set init[0], 0x123
    set init[1], 0x234
    set init[2], 0x345
    set init[3], 0x456
    mt.'init_by_array'(init)
    print "1000 outputs of genrand_int32()\n"
    .local int i
    i = 0
    new $P0, 'FixedPMCArray'
    set $P0, 1
  L1:
    unless i < 1000 goto L2
    $I0 = mt.'genrand_int32'()
    $P0[0] = $I0
    $S0 = sprintf "%10lu ", $P0
    print $S0
    $I0 = i % 5
    unless $I0 == 4 goto L3
    print "\n"
  L3:
    inc i
    goto L1
  L2:
    print "\n1000 outputs of genrand_real2()\n"
    i = 0
  L4:
    unless i < 1000 goto L5
    $N0 = mt.'genrand_real2'()
    $P0[0] = $N0
    $S0 = sprintf "%10.8f ", $P0
    print $S0
    $I0 = i % 5
    unless $I0 == 4 goto L6
    print "\n"
  L6:
    inc i
    goto L4
  L5:
.end
CODE


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
