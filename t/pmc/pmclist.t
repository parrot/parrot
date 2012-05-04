#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

.sub main :main
    .include 'test_more.pir'

    plan(10)

    empty_exceptions()
    push_five()
    push_two_pop_two()
    unshift_two_shift_two()
    push_shift()
    unshift_pop()
    insert_by_num()
.end

.sub empty_exceptions
    $P0 = new 'PMCList'

    push_eh pop_good
    $P1 = pop $P0
    pop_eh

    ok(0, "pop empty")
    goto try_shift

pop_good:
    ok(1, "pop empty")

try_shift:

    $P0 = new 'PMCList'

    push_eh shift_good
    $P1 = pop $P0
    pop_eh

    ok(0, "shift empty")
    .return()

shift_good:
    ok(1, "shift empty")
.end

.sub push_many
    .param pmc a
    .param int n

    if n < 1 goto done

    $P0 = new 'Integer'
    $P0 = n
    push a, $P0

    $N0 = n - 1
    push_many(a, $N0)

done:
    .return()
.end

.sub push_five
    $P0 = new 'PMCList'

    push_eh fail
    push_many($P0, 5)
    pop_eh

    $I0 = $P0

    if $I0 != 5 goto fail
    ok(1, "push five")

    .return()

fail:
    ok(0, "push five")
.end

.sub push_two_pop_two
    $P0 = new 'PMCList'

    push_many($P0, 2)

    $P1 = pop $P0
    $I0 = $P0

    if $I0 == 1 goto size_good

    ok(0, "push two pop one")
    goto try_value

size_good:
    ok(1, "push two pop one")

try_value:
    $P1 = pop $P0
    $I0 = $P1

    if $I0 == 2 goto value_good
    ok(0, "push two pop two")
    .return()

value_good:
    ok(1, "push two pop two")
.end

.sub unshift_two_shift_two
    $P0 = new 'PMCList'

    $P1 = new 'Integer', 2
    unshift $P0, $P1

    $P1 = new 'Integer', 1
    unshift $P0, $P1

    $P1 = shift $P0
    $I0 = $P0

    if $I0 == 1 goto size_good

    ok(0, "unshift shift size")
    goto try_value

size_good:
    ok(1, "unshift shift size")

try_value:
    $P1 = shift $P0
    $I0 = $P1

    if $I0 == 2 goto value_good
    ok(0, "unshift shift value")
    .return()

value_good:
    ok(1, "unshift shift value")
.end

.sub push_shift
    $P0 = new 'PMCList'

    $P1 = new 'Integer', 5
    push $P0, $P1

    $P1 = new 'Integer', 6
    push $P0, $P1

    $P1 = shift $P0
    $I0 = $P1

    if $I0 == 5 goto value_good
    ok(0, "push shift")
    .return()

value_good:
    ok(1, "push shift")
.end

.sub unshift_pop
    $P0 = new 'PMCList'

    $P1 = new 'Integer', 5
    unshift $P0, $P1

    $P1 = new 'Integer', 6
    unshift $P0, $P1

    $P1 = pop $P0
    $I0 = $P1

    if $I0 == 5 goto value_good
    ok(0, "unshift pop")
    .return()

value_good:
    ok(1, "unshift pop")
.end

.sub insert_by_num
    $P0 = new 'PMCList'

    $P1 = new 'Float'
    $P1 = 3.14
    $P0.'insert_by_number'($P1)

    $P1 = new 'Float'
    $P1 = 1.41
    $P0.'insert_by_number'($P1)

    $P1 = new 'Float'
    $P1 = 9.8
    $P0.'insert_by_number'($P1)


    $I0 = $P0
    if $I0 == 3 goto size_good
    ok(0, "insert by num")
    .return()

size_good:
    $P2 = shift $P0
    $P1 = new 'Float'
    $P1 = 1.41

    eq_num $P1, $P2, shift_good
    ok(0, "insert by num")
    .return()

shift_good:
    $P2 = pop $P0
    $P1 = new 'Float'
    $P1 = 9.8

    eq_num $P1, $P2, pop_good
    ok(0, "insert by num")
    .return()

pop_good:
    ok(1, "insert by num")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
