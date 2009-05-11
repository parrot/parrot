#! parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

.const int NUM_OF_TESTS = 8

.sub main :main
    loadlib $P1, 'pair'
    load_bytecode 'Test/More.pir'

    .local pmc plan, is, ok
    plan = get_hll_global [ 'Test'; 'More' ], 'plan'
    is   = get_hll_global [ 'Test'; 'More' ], 'is'
    ok   = get_hll_global [ 'Test'; 'More' ], 'ok'

    # set a test plan
    plan(NUM_OF_TESTS)

    new $P0, ['Pair']
    ok(1, "still alive")
    new $P1, ['Integer']
    set $P1, 42
    set $P0["key"], $P1
    ok(1, "still alive")
    set $P2, $P0["key"]
    is($P2, 42, "fetching value")

    .local pmc p, kv
    new p, ['Pair']
    new $P1, ['Integer']
    set $P1, 42
    set p["key"], $P1

    $P0 = p."key"()
    is( $P0, 'key', 'get key' )
    $P0 = p."value"()
    is( $P0, 42, 'get key' )
    kv = p."kv"()
    $I0 = elements kv
    is( $I0, 2, 'number of elements returned from "kv"' )
    $P0 = kv[0]
    is( $P0, 'key', 'first element returned from "kv"' )
    $P0 = kv[1]
    is( $P0, 42, 'third element returned from "kv"' )
.end

=for get it

SKIP: {
    skip( "instantiate disabled", 1 );
    pir_output_is( <<'CODE', <<'OUT', 'instantiate, assign' );
.sub main :main
    .local pmc cl, p, kv, k, v
    k = new ['String']
    k = "key"
    v = new ['String']
    v = "value"
    cl = get_class "Pair"
    p = cl."instantiate"(k, v)

    $P0 = p."key"()
    print $P0
    print ' '
    $P0 = p."value"()
    print $P0
    print ' '

    v = new ['Integer']
    v = 77
    assign p, v
    $P0 = p."value"()
    say $P0
.end
CODE
key value 77
OUT
}

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
