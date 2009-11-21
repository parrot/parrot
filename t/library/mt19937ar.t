#!parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/library/mt19937ar.t

=head1 DESCRIPTION

Math::Random::MT tests

=head1 SYNOPSIS

    % parrot t/library/mt19937ar.t

=cut

.sub 'main' :main
    load_bytecode 'Math/Random/mt19937ar.pbc'

    .include 'test_more.pir'

    plan(10)

    test_interfaces()
    test_output()
.end

.sub 'test_interfaces'
    .local pmc mt
    mt = new [ 'Math'; 'Random'; 'MT' ]

    $S0 = typeof mt
    is($S0, 'Math;Random;MT', "MT typeof")

    $I0 = can mt, 'init_genrand'
    ok($I0, "MT can init_genrand")

    $I0 = can mt, 'init_by_array'
    ok($I0, "MT can init_by_array")

    $I0 = can mt, 'genrand_int32'
    ok($I0, "MT can genrand_int32")

    $I0 = can mt, 'genrand_int31'
    ok($I0, "MT can genrand_int31")

    $I0 = can mt, 'genrand_real1'
    ok($I0, "MT can genrand_real1")

    $I0 = can mt, 'genrand_real2'
    ok($I0, "MT can genrand_real2")

    $I0 = can mt, 'genrand_real3'
    ok($I0, "MT can genrand_real3")

    $I0 = can mt, 'genrand_res53'
    ok($I0, "MT can genrand_res53")
.end

.sub 'generate_output' :anon
    .param pmc fh
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
    fh.'puts'( "1000 outputs of genrand_int32()\n" )
    .local int i
    i = 0
    new $P0, 'FixedPMCArray'
    set $P0, 1
  L1:
    unless i < 1000 goto L2
    $I0 = mt.'genrand_int32'()
    $P0[0] = $I0
    $S0 = sprintf "%10lu ", $P0
    fh.'puts'( $S0 )
    $I0 = i % 5
    unless $I0 == 4 goto L3
    fh.'puts'( "\n" )
  L3:
    inc i
    goto L1
  L2:
    fh.'puts'( "\n1000 outputs of genrand_real2()\n" )
    i = 0
  L4:
    unless i < 1000 goto L5
    $N0 = mt.'genrand_real2'()
    $P0[0] = $N0
    $S0 = sprintf "%10.8f ", $P0
    fh.'puts'( $S0 )
    $I0 = i % 5
    unless $I0 == 4 goto L6
    fh.'puts'( "\n" )
  L6:
    inc i
    goto L4
  L5:
.end

.sub 'test_output'
    .local pmc fh
    fh = new 'FileHandle'
    .local string ref
    ref = fh.'readall'('t/library/mt19937ar.txt')
    $P0 = split "\r\n", ref     # hack for Windows
    ref = join "\n", $P0
    fh = new 'StringHandle'
    fh.'open'('output', 'w')
    generate_output(fh)
    $S0 = fh.'readall'()
    fh.'close'()
    is($S0, ref, "mt19937ar output")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
