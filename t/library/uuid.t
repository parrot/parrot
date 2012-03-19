#!./parrot
# Copyright (C) 2008-2010, Parrot Foundation.

=head1 NAME

t/library/uuid.t

=head1 SYNOPSIS

    % prove t/library/uuid.t

=head1 DESCRIPTION

uuid library tests

=cut

.include 'load_bytecode.pir'

.sub main :main
    '__load_bytecode'('uuid.pbc')

    .include 'test_more.pir'
    plan(20)

    test_generate_1()
    test_generate_2()
    test_generate_random()
    test_generate_time()
    test_parse_1()
    test_parse_2()
    test_time()
    test_type()
    test_variant()
.end


.sub test_generate_1
    $P0 = get_global ['uuid'], 'generate'
    $P1 = $P0()
    $S1 = typeof $P1
    is($S1,'uuid', 'generate 1')
.end


.sub test_generate_2
    $P0 = get_global ['uuid'], 'generate'
    $P1 = $P0()
    like($P1, '<[0..9a..f]>**8\-<[0..9a..f]>**4\-<[0..9a..f]>**4\-<[0..9a..f]>**4\-<[0..9a..f]>**12', 'generate 2' )
.end


.sub test_generate_random
    $P0 = get_global ['uuid'], 'generate_random'
    $P1 = $P0()
    like($P1, '<[0..9a..f]>**8\-<[0..9a..f]>**4\-<[0..9a..f]>**4\-<[0..9a..f]>**4\-<[0..9a..f]>**12', 'generate random')
.end


.sub test_generate_time
    $P0 = get_global ['uuid'], 'generate_time'
    $P1 = $P0()
    like($P1, '<[0..9a..f]>**8\-<[0..9a..f]>**4\-<[0..9a..f]>**4\-<[0..9a..f]>**4\-<[0..9a..f]>**12', 'generate time')
.end


.sub test_parse_1
    $P0 = get_global ['uuid'], 'parse'
    ($I0, $P1) = $P0("84949cc5-4701-4a84-895b-354c584a981b")
    is($I0, 0, 'parse 1')
    $S1 = typeof $P1
    is($S1, 'uuid', 'parse 1')
.end


.sub test_parse_2
    $P0 = get_global ['uuid'], 'parse'
    $I0 = $P0("84949cc5-4701-4a84-895b-354c584a981b")
    is($I0, 0, 'parse 2')
    $I0 = $P0("84949CC5-4701-4A84-895B-354C584A981B")
    is($I0, 0, 'parse 2')
    $I0 = $P0("84949cc5-4701-4a84-895b-354c584a981bc")
    is($I0, -1, 'parse 2')
    $I0 = $P0("84949cc5-4701-4a84-895b-354c584a981")
    is($I0, -1, 'parse 2')
    $I0 = $P0("84949cc5x4701-4a84-895b-354c584a981b")
    is($I0, -1, 'parse 2')
    $I0 = $P0("84949cc504701-4a84-895b-354c584a981b")
    is($I0, -1, 'parse 2')
    $I0 = $P0("84949cc5-470104a84-895b-354c584a981b")
    is($I0, -1, 'parse 2')
    $I0 = $P0("84949cc5-4701-4a840895b-354c584a981b")
    is($I0, -1, 'parse 2')
    $I0 = $P0("84949cc5-4701-4a84-895b0354c584a981b")
    is($I0, -1, 'parse 2')
    $I0 = $P0("g4949cc5-4701-4a84-895b-354c584a981b")
    is($I0, -1, 'parse 2')
    $I0 = $P0("84949cc5-4701-4a84-895b-354c584a981g")
    is($I0, -1, 'parse 2')
.end


.sub test_time
    $P0 = get_global ['uuid'], 'parse'
    ($I0, $P1) = $P0("84949cc5-4701-4a84-895b-354c584a981b")
    $I1 = $P1.'time'()
    is($I1, -1, 'time')
.end


.sub test_type
    $P0 = get_global ['uuid'], 'generate'
    $P1 = $P0()
    $I0 = $P1.'type'()
    is($I0, 4, 'type')
.end


.sub test_variant
    $P0 = get_global ['uuid'], 'generate'
    $P1 = $P0()
    $I0 = $P1.'variant'()
    is($I0, 1, 'variant')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
