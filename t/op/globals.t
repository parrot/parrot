#!./parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/op/globals.t - Global Variables

=head1 SYNOPSIS

        % prove t/op/globals.t

=head1 DESCRIPTION

Tests the C<get_global> and C<set_global> operations.

=cut

.const int TESTS = 12

.namespace []

.sub 'test' :main
    .include 'test_more.pir'

    plan(TESTS)

    root_integer()
    get_null_global()
    not_found_null()
    get_set_global_with_key()
    fetch_and_store()
    find_null_global()
    get_hll_global_not_found()
    find_store_with_key()
.end

.namespace []
.sub 'root_integer'
    $P0 = new ['Integer']
    $P1 = new ['Integer']

    $P0 = 12
    $P1 = 7

    set_global "Integer", $P0
    $P1 = get_global "Integer"

    is($P1, 12, 'root_integer')
.end

.sub 'get_null_global'
    $S0 = null

    $I0 = 0
    push_eh get_null_global_catch
    $P1 = get_global $S0
    pop_eh
    goto get_null_global_end

  get_null_global_catch:
    $I0 = 1

  get_null_global_end:
    ok($I0, 'get null global')
.end

.sub 'not_found_null'
    $P1 = get_global 'no_such_global'
    ok(1, 'not_found_null get_global returns')

    $I0 = defined $P1
    nok($I0, 'not_found_null get_global returns null')
.end

.sub 'get_set_global_with_key'
    $P0 = get_global ['Monkey'], 'do_explosion'
    $I0 = defined $P0
    ok($I0, 'get_global of a sub with a key')
    $P0()
.end

.namespace ['Monkey']
.sub 'do_explosion'
    set_it()
    $P1 = get_hll_global [ "Monkey" ; "Toaster" ], "Explosion"
    is($P1, "Ook...BANG!\n", 'get/set_global with key')
.end

.sub 'set_it'
        $P0 = new 'String'
        $P0 = "Ook...BANG!\n"
        set_global [ "Toaster" ], "Explosion", $P0
.end

#----------------------------------------------------------------
# LEGACY
#----------------------------------------------------------------

.namespace []

.sub 'fetch_and_store'
    $P0 = new 'Integer'
    $P1 = new 'Integer'

    $P0 = 12
    $P1 = 7

    set_global 'Integer', $P0
    $P1 = get_hll_global 'Integer'
    is($P1, 12, 'Fetch and store')
.end

.sub 'find_null_global'
    $S0 = null
    push_eh find_null_global_catch
    $P1 = get_hll_global $S0
    pop_eh
    $I0 = 0
    goto find_null_global_end

  find_null_global_catch:
    $I0 = 1
  find_null_global_end:
    ok($I0, 'Find null global')
.end

.sub 'get_hll_global_not_found'
    $P1 = get_hll_global 'no such global'
    ok(1, 'get_hll_global returns if not found')

    $I0 = defined $P1
    nok($I0, 'get_hll_global returns null if not found')
.end

.sub 'find_store_with_key'
    $P0 = get_global ['Monkey2'], 'do_explosion'
    $I0 = defined $P0
    ok($I0, 'get_hll_global of a sub with a key')
    $P0()
.end

.namespace ['Monkey2']
.sub 'do_explosion'
    set_it()
    $P1 = get_hll_global [ "Monkey2" ; "Toaster" ], "Explosion"
    is($P1, "Ook...BANG, again!\n", 'find/store global with key')
.end

.sub 'set_it'
    $P0 = new 'String'
    $P0 = "Ook...BANG, again!\n"
    set_hll_global [ "Monkey2"; "Toaster" ], "Explosion", $P0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
