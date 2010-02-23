#! parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/env.t - System Environment

=head1 SYNOPSIS

    % prove t/pmc/env.t

=head1 DESCRIPTION

Tests the C<Env> PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(16)

    all_envs_are_identical()
    setenv_getenv()
    all_envs_are_the_same()
    gone_delete()
    iterate()
    exists_delete()
    is_interface_done()
    get_integer()
    oob_query()
.end

.sub all_envs_are_identical
    $P0 = new ['Env']
    $P1 = new ['Env']
    eq_addr $P0, $P1, ok
    ok(0, "all Envs aren't identical")
    goto end
ok:
    ok(1, "all Envs are identical")
end:
.end

.sub setenv_getenv
    $P0 = new ['Env']
    set $P0['PARROT_TMP'], 'hello polly'
    set $S0, $P0['PARROT_TMP']
    is($S0, 'hello polly', 'getenv and setenv work with string keys')
    delete $P0['PARROT_TMP']

    $P1 = new ['Key']
    set $P1, "PARROT_TMP"
    $P2 = new ['String']
    set $P2, "Foobar"
    $P3 = new ['String']
    set $P0[$P1], $P2
    set $P3, $P0[$P1]
    is($P3, "Foobar", "getenv and setenv work with PMC keys")
    delete $P0['PARROT_TMP']

    set $S0, $P0[""]
    is($S0, '', 'getenv works with a null key')
.end

.sub all_envs_are_the_same
    $P0 = new ['Env']
    set $P0['PARROT_TMP'], 'hello polly'
    set $S0, $P0['PARROT_TMP']
    $P1 = new ['Env']
    set $S1, $P1['PARROT_TMP']
    is($S0, $S1, 'all envs are the same')
    delete $P0['PARROT_TMP']
.end

.sub gone_delete
    $P0 = new ['Env']
    set $P0['PARROT_TMP'], 'hello polly'
    exists $I0, $P0['PARROT_TMP']
    if $I0, ok1
    ok(0, "expected element doesn't exist")
ok1:
    ok(1, 'expected element exists')
    delete $P0['PARROT_TMP']
    set $S0, $P0['PARROT_TMP']
    unless $S0, ok2
    ok(0, 'deleted element exists')
ok2:
    ok(1, 'deleted element is deleted')
.end

.sub iterate
    $P0 = new ['Env']
    set $P0["PARROT_1"], "hello"
    set $P0["PARROT_2"], "polly"
    iter $P1, $P0
    set $I0, 0
loop:
    unless $P1, loopend
    shift $S2, $P1
    eq $S2, "PARROT_1", gotit
    eq $S2, "PARROT_2", gotit
    branch notit
gotit:
    inc $I0
notit:
    branch loop
loopend:
    is($I0, 2, 'assigned env vars showed up in the iterator')
.end

    # This will not work on our unsetenv implementation
    #skip( "no native unsetenv", 1 ) unless $PConfig{"unsetenv"};
.sub exists_delete

    .include "iglobals.pasm"
    .local pmc config_hash, interp
    interp = getinterp
    config_hash = interp[.IGLOBALS_CONFIG_HASH]
    $I0 = config_hash["unsetenv"]

    unless $I0 goto no_unsetenv

    $P0 = new ['Env']
    set $P0['PARROT_TMP'], 'hello polly'
    exists $I0, $P0['PARROT_TMP']
    ok( $I0, "set env var stays set")
    delete $P0["PARROT_TMP"]
    exists $I0, $P0["PARROT_TMP"]
    is($I0, 0, "deleted env var stays deleted")
    goto end

no_unsetenv:
    skip(1, "no native unsetenv")
    skip(1, "no native unsetenv")
end:
.end

.sub is_interface_done
    .local pmc pmc1
    pmc1 = new ['Env']
    .local int bool1

    does bool1, pmc1, 'hash'
    ok(bool1, 'does Hash')

    does bool1, pmc1, 'scalar'
    is(bool1, 0, "doesn't do Scalar")

    does bool1, pmc1, 'no_interface'
    is(bool1, 0, "doesn't do no_interface")
.end

.sub get_integer
    .local pmc env
    .local int int_before, int_after, int_diff
    .local num num_before, num_after, num_diff

    # add three more keys in env
    env = new ['Env']
    num_before = env
    int_before = env
    env["PARROT_TMP_ADD_1"] = "tmp_add_1"
    env["PARROT_TMP_ADD_2"] = "tmp_add_2"
    env["PARROT_TMP_ADD_3"] = "tmp_add_3"
    num_after = env
    int_after = env
    num_diff = num_after - num_before
    int_diff = int_after - int_before
    is(int_diff, 3, "get_integer seems sane")
    is(num_diff, 3, "get_number seems sane")

    #clean up the environment
    delete env['PARROT_TMP_ADD_1']
    delete env['PARROT_TMP_ADD_2']
    delete env['PARROT_TMP_ADD_3']
.end

.sub oob_query
    $P0 = new ['Env']
    set $S0, $P0[999]
    is($S0, '', 'no segfault')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
