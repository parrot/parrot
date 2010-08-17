#!./parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/resizablestringarray.t - testing the ResizableStringArray PMC

=head1 SYNOPSIS

    % prove t/pmc/resizablestringarray.t

=head1 DESCRIPTION

Tests C<ResizableStringArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut



.sub main :main
    .include 'test_more.pir'

    # set a test plan
    plan(263)

    'size/resize'()
    'clone'()

    'set_pmc_keyed'()
    'set_string_keyed'()
    'set_integer_keyed'()
    'set_number_keyed'()

    'get_pmc_keyed'()
    'get_string_keyed'()
    'get_integer_keyed'()
    'get_number_keyed'()

    'delete_keyed'()

    'push_pmc'()
    'push_string'()
    'push_integer'()
    'push_float'()

    'pop_pmc'()
    'pop_string'()
    'pop_integer'()
    'pop_float'()

    'shift_pmc'()
    'shift_string'()
    'shift_integer'()
    'shift_float'()

    'unshift_pmc'()
    'unshift_string'()
    'unshift_integer'()
    'unshift_float'()

    'unshift_string_resize_threshold'()

    'does'()
#    'get_string'()
    'sparse'()

    'splice'()

    method_push_pmc()
    method_push_string()
    method_push_integer()
    method_push_float()

    method_pop_pmc()
    method_pop_string()
    method_pop_integer()
    method_pop_float()

    method_shift_pmc()
    method_shift_string()
    method_shift_integer()
    method_shift_float()

    method_unshift_pmc()
    method_unshift_string()
    method_unshift_integer()
    method_unshift_float()
.end

#
# test the sizing and resizing of the array (including init to 0)
# this tests the following vtable functions:
#  - elements
#  - init
#  - get_integer_native
#  - set_integer_native
#
.sub 'size/resize'
    .local pmc array
    array = new ['ResizableStringArray']

    $I0 = array
    $I1 = elements array
    is($I0, 0, "initial array size (get_int)")
    is($I1, 0, "initial array size (elements)")

    array = 1
    $I0 = array
    $I1 = elements array
    is($I0, 1, "array resize to 1 (get_int)")
    is($I1, 1, "array resize to 1 (elements)")

    array = 5
    $I0 = array
    $I1 = elements array
    is($I0, 5, "array resize to 5 (get_int)")
    is($I1, 5, "array resize to 5 (elements)")

    array = 9
    $I0 = array
    $I1 = elements array
    is($I0, 9, "array resize to 9 (get_int)")
    is($I1, 9, "array resize to 9 (elements)")

    array = 7
    $I0 = array
    $I1 = elements array
    is($I0, 7, "array resize to 7 (get_int)")
    is($I1, 7, "array resize to 7 (elements)")

    push_eh neg_exception
      array = -3
    pop_eh
    ok(0, "array resize to -3")
    goto still_ok

neg_exception:
    ok(1, "array resize to -3")

still_ok:
    $I0 = array
    $I1 = elements array
    is($I0, 7, "array resize to -3 (get_int)")
    is($I1, 7, "array resize to -3 (elements)")
.end

#
# test setting different elements of the array with PMCs
#
.sub 'set_pmc_keyed'
    .local pmc array, elem
    array = new ['ResizableStringArray']
    elem  = new ['Integer']

    array = 1

    elem = 5
    array[0] = elem
    $S0 = array[0]
    is($S0, "5", "set_pmc_keyed_int")

    elem = 7
    array["0"] = elem
    $S0 = array[0]
    is($S0, "7", "set_pmc_keyed")

    array = 3

    elem = 4
    array[-2] = elem
    $S0 = array[1]
    is($S0, "4", "set_pmc_keyed_int (negative)")

    elem = 9
    array["-3"] = elem
    $S0 = array[0]
    is($S0, "9", "set_pmc_keyed (negative)")

    array = 3
    elem  = 8
    array[4] = elem
    $I0 = elements array
    $S0 = array[4]
    is($I0, 5,   "set_pmc_keyed_int (out of bounds - length)")
    is($S0, "8", "set_pmc_keyed_int (out of bounds)")

    array = 3
    elem  = 11
    array["4"] = elem
    $I0 = elements array
    $S0 = array[4]
    is($I0, 5,    "set_pmc_keyed (out of bounds - length)")
    is($S0, "11", "set_pmc_keyed (out of bounds)")

    push_eh set_pmc_keyed_int_exception
      array[-10] = elem
    pop_eh
    ok(0, "set_pmc_keyed_int (negative, out of bounds)")
    goto set_pmc_keyed

set_pmc_keyed_int_exception:
    ok(1, "set_pmc_keyed_int (negative, out of bounds)")

set_pmc_keyed:
    push_eh set_pmc_keyed_exception
        array["-10"] = elem
    pop_eh
    ok(0, "set_pmc_keyed (negative, out of bounds)")
    goto done

set_pmc_keyed_exception:
    ok(1, "set_pmc_keyed (negative, out of bounds)")

done:
    .return()
.end

#
# test getting different elements as PMCs
#
.sub 'get_pmc_keyed'
    .local pmc array
    array = new ['ResizableStringArray']
    array = 1
    array[0] = "first"
    array[1] = "second"
    array[2] = "third"
    array[3] = "fourth"

    $P0 = array[0]
    $S0 = typeof $P0
    is($S0, 'String', "get_pmc_keyed_int - type")
    is($P0, 'first',  "get_pmc_keyed_int - value")

    # get_pmc_keyed
    $P0 = array['1']
    $S0 = typeof $P0
    is($S0, 'String', "get_pmc_keyed - type")
    is($P0, 'second', "get_pmc_keyed - value")

    # get_pmc_keyed_int (negative)
    $P0 = array[-1]
    $S0 = typeof $P0
    is($S0, 'String', "get_pmc_keyed_int (negative) - type")
    is($P0, 'fourth', "get_pmc_keyed_int (negative) - value")

    # get_pmc_keyed (negative)
    $P0 = array['-2']
    $S0 = typeof $P0
    is($S0, 'String', "get_pmc_keyed (negative) - type")
    is($P0, 'third',  "get_pmc_keyed (negative) - value")

    array = 1
    $P0 = array[2]
    $S0 = typeof $P0
    is($S0, 'String', "get_pmc_keyed_int (out of bounds) - type")
    is($P0, '',      "get_pmc_keyed_int (out of bounds) - value")

    array = 1
    $P0 = array["2"]
    $S0 = typeof $P0
    is($S0, 'String', "get_pmc_keyed (out of bounds) - type")
    is($P0, '',      "get_pmc_keyed (out of bounds) - value")

    push_eh get_pmc_keyed_int_exception
      $P0 = array[-10]
    pop_eh
    ok(0, "get_pmc_keyed_int (negative, out of bounds)")
    goto get_pmc_keyed

get_pmc_keyed_int_exception:
    ok(1, "get_pmc_keyed_int (negative, out of bounds)")

get_pmc_keyed:
    push_eh get_pmc_keyed_exception
        $P0 = array["-10"]
    pop_eh
    ok(0, "get_pmc_keyed (negative, out of bounds)")
    goto done

get_pmc_keyed_exception:
    ok(1, "get_pmc_keyed (negative, out of bounds)")

done:
    .return()
.end

#
# test setting different elements of the array with STRINGs
#
.sub 'set_string_keyed'
    .local pmc    array
    .local string elem
    array = new ['ResizableStringArray']

    array = 1

    elem = "5"
    array[0] = elem
    $S0 = array[0]
    is($S0, "5", "set_string_keyed_int")

    elem = "7"
    array["0"] = elem
    $S0 = array[0]
    is($S0, "7", "set_string_keyed")

    array = 3

    elem = "4"
    array[-2] = elem
    $S0 = array[1]
    is($S0, "4", "set_string_keyed_int (negative)")

    elem = "9"
    array["-3"] = elem
    $S0 = array[0]
    is($S0, "9", "set_string_keyed (negative)")

    array = 3
    elem  = "8"
    array[4] = elem
    $I0 = elements array
    $S0 = array[4]
    is($I0, 5,   "set_string_keyed_int (out of bounds - length)")
    is($S0, "8", "set_string_keyed_int (out of bounds)")

    array = 3
    elem  = "11"
    array["4"] = elem
    $I0 = elements array
    $S0 = array[4]
    is($I0, 5,    "set_string_keyed (out of bounds - length)")
    is($S0, "11", "set_string_keyed (out of bounds)")

    push_eh set_pmc_keyed_int_exception
      array[-10] = elem
    pop_eh
    ok(0, "set_string_keyed_int (negative, out of bounds)")
    goto set_pmc_keyed

set_pmc_keyed_int_exception:
    ok(1, "set_string_keyed_int (negative, out of bounds)")

set_pmc_keyed:
    push_eh set_pmc_keyed_exception
        array["-10"] = elem
    pop_eh
    ok(0, "set_string_keyed (negative, out of bounds)")
    goto done

set_pmc_keyed_exception:
    ok(1, "set_string_keyed (negative, out of bounds)")

done:
    .return()
.end

#
# test getting different elements as STRINGs
#
.sub 'get_string_keyed'
    .local pmc array
    array = new ['ResizableStringArray']
    array = 1
    array[0] = "first"
    array[1] = "second"
    array[2] = "third"
    array[3] = "fourth"

    $S0 = array[0]
    is($S0, 'first', "get_string_keyed_int")

    $S0 = array['1']
    is($S0, 'second', "get_string_keyed")

    $S0 = array[-1]
    is($S0, 'fourth', "get_string_keyed_int (negative)")

    $S0 = array['-2']
    is($S0, 'third', "get_string_keyed (negative)")

    array = 1
    $S0 = array[2]
    is($S0, '', "get_string_keyed_int (out of bounds)")

    array = 1
    $S0 = array["2"]
    is($S0, '', "get_string_keyed (out of bounds)")

    push_eh get_string_keyed_int_exception
      $S0 = array[-10]
    pop_eh
    ok(0, "get_string_keyed_int (negative, out of bounds)")
    goto get_string_keyed

get_string_keyed_int_exception:
    ok(1, "get_string_keyed_int (negative, out of bounds)")

get_string_keyed:
    push_eh get_string_keyed_exception
        $S0 = array["-10"]
    pop_eh
    ok(0, "get_string_keyed (negative, out of bounds)")
    goto done

get_string_keyed_exception:
    ok(1, "get_string_keyed (negative, out of bounds)")

done:
    .return()
.end

#
# test setting different elements of the array with INTVALs
#
.sub 'set_integer_keyed'
    .local pmc array
    .local int elem
    array = new ['ResizableStringArray']

    array = 1

    elem = 5
    array[0] = elem
    $S0 = array[0]
    is($S0, "5", "set_integer_keyed_int")

    elem = 7
    array["0"] = elem
    $S0 = array[0]
    is($S0, "7", "set_integer_keyed")

    array = 3

    elem = 4
    array[-2] = elem
    $S0 = array[1]
    is($S0, "4", "set_integer_keyed_int (negative)")

    elem = 9
    array["-3"] = elem
    $S0 = array[0]
    is($S0, "9", "set_integer_keyed (negative)")

    array = 3
    elem  = 8
    array[4] = elem
    $I0 = elements array
    $S0 = array[4]
    is($I0, 5,   "set_integer_keyed_int (out of bounds - length)")
    is($S0, "8", "set_integer_keyed_int (out of bounds)")

    array = 3
    elem  = 11
    array["4"] = elem
    $I0 = elements array
    $S0 = array[4]
    is($I0, 5,    "set_integer_keyed (out of bounds - length)")
    is($S0, "11", "set_integer_keyed (out of bounds)")

    push_eh set_pmc_keyed_int_exception
      array[-10] = elem
    pop_eh
    ok(0, "set_integer_keyed_int (negative, out of bounds)")
    goto set_pmc_keyed

set_pmc_keyed_int_exception:
    ok(1, "set_integer_keyed_int (negative, out of bounds)")

set_pmc_keyed:
    push_eh set_pmc_keyed_exception
      array["-10"] = elem
    pop_eh
    ok(0, "set_integer_keyed (negative, out of bounds)")
    goto done

set_pmc_keyed_exception:
    ok(1, "set_integer_keyed (negative, out of bounds)")

done:
    .return()
.end

#
# test getting different elements as INTVALs
#
.sub 'get_integer_keyed'
    .local pmc array
    array = new ['ResizableStringArray']
    array = 1
    array[0] = "1"
    array[1] = "2"
    array[2] = "3"
    array[3] = "4"

    $I0 = array[0]
    is($I0, 1, "get_integer_keyed_int")

    $I0 = array['1']
    is($I0, 2, "get_integer_keyed")

    $I0 = array[-1]
    is($I0, 4, "get_integer_keyed_int (negative)")

    $I0 = array['-2']
    is($I0, 3, "get_integer_keyed (negative)")

    array = 1
    $I0 = array[2]
    is($I0, 0, "get_integer_keyed_int (out of bounds)")

    array = 1
    $I0 = array["2"]
    is($I0, 0, "get_integer_keyed (out of bounds)")

    push_eh get_integer_keyed_int_exception
      $I0 = array[-10]
    pop_eh
    ok(0, "get_integer_keyed_int (negative, out of bounds)")
    goto get_integer_keyed

get_integer_keyed_int_exception:
    ok(1, "get_integer_keyed_int (negative, out of bounds)")

get_integer_keyed:
    push_eh get_integer_keyed_exception
        $I0 = array["-10"]
    pop_eh
    ok(0, "get_integer_keyed (negative, out of bounds)")
    goto done

get_integer_keyed_exception:
    ok(1, "get_integer_keyed (negative, out of bounds)")

done:
    .return()
.end

#
# test setting different elements of the array with FLOATs
#
.sub 'set_number_keyed'
    .local pmc   array
    .local num elem
    array = new ['ResizableStringArray']

    array = 1

    elem = 5.1
    array[0] = elem
    $S0 = array[0]
    is($S0, "5.1", "set_number_keyed_int")

    elem = 7.2
    array["0"] = elem
    $S0 = array[0]
    is($S0, "7.2", "set_number_keyed")

    array = 3

    elem = 4.3
    array[-2] = elem
    $S0 = array[1]
    is($S0, "4.3", "set_number_keyed_int (negative)")

    elem = 9.4
    array["-3"] = elem
    $S0 = array[0]
    is($S0, "9.4", "set_number_keyed (negative)")

    array = 3
    elem  = 8.5
    array[4] = elem
    $I0 = elements array
    $S0 = array[4]
    is($I0, 5,     "set_number_keyed_int (out of bounds - length)")
    is($S0, "8.5", "set_number_keyed_int (out of bounds)")

    array = 3
    elem  = 11.6
    array["4"] = elem
    $I0 = elements array
    $S0 = array[4]
    is($I0, 5,      "set_number_keyed (out of bounds - length)")
    is($S0, "11.6", "set_number_keyed (out of bounds)")

    push_eh set_pmc_keyed_int_exception
      array[-10] = elem
    pop_eh
    ok(0, "set_number_keyed_int (negative, out of bounds)")
    goto set_pmc_keyed

set_pmc_keyed_int_exception:
    ok(1, "set_number_keyed_int (negative, out of bounds)")

set_pmc_keyed:
    push_eh set_pmc_keyed_exception
        array["-10"] = elem
    pop_eh
    ok(0, "set_number_keyed (negative, out of bounds)")
    goto done

set_pmc_keyed_exception:
    ok(1, "set_number_keyed (negative, out of bounds)")

done:
    .return()
.end

#
# test getting different elements as FLOATs
#
.sub 'get_number_keyed'
    .local pmc array
    array = new ['ResizableStringArray']
    array = 1
    array[0] = "1.1"
    array[1] = "2.2"
    array[2] = "3.3"
    array[3] = "4.4"

    $N0 = array[0]
    is($N0, 1.1, "get_number_keyed_int")

    $N0 = array['1']
    is($N0, 2.2, "get_number_keyed")

    $N0 = array[-1]
    is($N0, 4.4, "get_number_keyed_int (negative)")

    $N0 = array['-2']
    is($N0, 3.3, "get_number_keyed (negative)")

    array = 1
    $N0 = array[2]
    is($N0, 0.0, "get_number_keyed_int (out of bounds)")

    array = 1
    $N0 = array["2"]
    is($N0, 0.0, "get_number_keyed (out of bounds)")

    push_eh get_number_keyed_int_exception
      $N0 = array[-10]
    pop_eh
    ok(0, "get_number_keyed_int (negative, out of bounds)")
    goto get_number_keyed

get_number_keyed_int_exception:
    ok(1, "get_number_keyed_int (negative, out of bounds)")

get_number_keyed:
    push_eh get_number_keyed_exception
        $S0 = array["-10"]
    pop_eh
    ok(0, "get_number_keyed (negative, out of bounds)")
    goto done

get_number_keyed_exception:
    ok(1, "get_number_keyed (negative, out of bounds)")

done:
    .return()
.end

#
# test delete_keyed
#
.sub 'delete_keyed'
    .local pmc array
    array = new ['ResizableStringArray']
    array[0] = "one"
    array[1] = "two"
    array[2] = "three"
    $P0 = new ['Integer']
    $P0 = 1
    delete array[$P0]
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,       "delete_keyed - elements")
    is($S0, "three", "delete_keyed - value")
.end

#
# test pushing PMCs onto the array
#
.sub 'push_pmc'
    .local pmc array
    array = new ['ResizableStringArray']

    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    $P0 = new ['String']
    $P0 = "one"
    push array, $P0
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "push_pmc - elements")
    is($S0, "one", "push_pmc - value")

    $P0 = new ['String']
    $P0 = "two"
    push array, $P0
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,     "push_pmc (grow) - elements")
    is($S0, "two", "push_pmc (grow) - value")

    array = 1
    push array, "three"
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,       "push_pmc (shrink, grow) - elements")
    is($S0, "three", "push_pmc (shrink, grow) - value")
.end


#
# test pushing STRINGs onto the array
#
.sub 'push_string'
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    push array, "one"
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "push_string - elements")
    is($S0, "one", "push_string - value")

    push array, "two"
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,     "push_string (grow) - elements")
    is($S0, "two", "push_string (grow) - value")

    array = 1
    push array, "three"
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,       "push_string (shrink, grow) - elements")
    is($S0, "three", "push_string (shrink, grow) - value")
.end


#
# test pushing INTVALs onto the array
#
.sub 'push_integer'
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    push array, 1
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,   "push_integer - elements")
    is($S0, "1", "push_integer - value")

    push array, 2
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,   "push_integer (grow) - elements")
    is($S0, "2", "push_integer (grow) - value")

    array = 1
    push array, 3
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,   "push_integer (shrink, grow) - elements")
    is($S0, "3", "push_integer (shrink, grow) - value")
.end


#
# test pushing FLOATs onto the array
#
.sub 'push_float'
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    push array, 1.1
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "push_float - elements")
    is($S0, "1.1", "push_float - value")

    push array, 2.2
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,     "push_float (grow) - elements")
    is($S0, "2.2", "push_float (grow) - value")

    array = 1
    push array, 3.3
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,     "push_float (shrink, grow) - elements")
    is($S0, "3.3", "push_float (shrink, grow) - value")
.end

.sub 'pop_pmc'
    .local pmc array
    array = new ['ResizableStringArray']

    array[1] = "foo"
    $P0 = pop array
    $I0 = elements array
    $S0 = typeof $P0
    $S1 = $P0
    is($I0, 1,        "pop_pmc - elements")
    is($S0, 'String', "pop_pmc - type")
    is($S1, 'foo',    "pop_pmc - value")

    array = 0
    push_eh exception
      $P0 = pop array
    pop_eh
    ok(0, "pop_pmc - exception")
    .return()

exception:
    ok(1, "pop_pmc - exception")
    .return()
.end

.sub 'pop_string'
    .local pmc array
    array = new ['ResizableStringArray']

    array[1] = "foo"
    $S0 = pop array
    $I0 = elements array
    is($I0, 1,        "pop_string - elements")
    is($S0, 'foo',    "pop_string - value")

    array = 0
    push_eh exception
      $S0 = pop array
    pop_eh
    ok(0, "pop_string - exception")
    .return()

exception:
    ok(1, "pop_string - exception")
    .return()
.end

.sub 'pop_integer'
    .local pmc array
    array = new ['ResizableStringArray']

    array[1] = "2"
    $I1 = pop array
    $I0 = elements array
    is($I0, 1, "pop_integer - elements")
    is($I1, 2, "pop_integer - value")

    array = 0
    push_eh exception
      $I0 = pop array
    pop_eh
    ok(0, "pop_integer - exception")
    .return()

exception:
    ok(1, "pop_integer - exception")
    .return()
.end

.sub 'pop_float'
    .local pmc array
    array = new ['ResizableStringArray']

    array[1] = "2.2"
    $N0 = pop array
    $I0 = elements array
    is($I0, 1,   "pop_float - elements")
    is($N0, 2.2, "pop_float - value")

    array = 0
    push_eh exception
      $N0 = pop array
    pop_eh
    ok(0, "pop_float - exception")
    .return()

exception:
    ok(1, "pop_float - exception")
    .return()
.end

.sub 'shift_pmc'
    .local pmc array
    array = new ['ResizableStringArray']

    array[0] = "foo"
    array[1] = "bar"
    $P0 = shift array
    $I0 = elements array
    $S0 = typeof $P0
    $S1 = $P0
    is($I0, 1,        "shift_pmc - elements")
    is($S0, 'String', "shift_pmc - type")
    is($S1, 'foo',    "shift_pmc - value")

    array = 0
    push_eh exception
      $P0 = shift array
    pop_eh
    ok(0, "shift_pmc - exception")
    .return()

exception:
    ok(1, "shift_pmc - exception")
    .return()
.end

.sub 'shift_string'
    .local pmc array
    array = new ['ResizableStringArray']

    array[0] = "foo"
    array[1] = "bar"
    $S0 = shift array
    $I0 = elements array
    is($I0, 1,        "shift_string - elements")
    is($S0, 'foo',    "shift_string - value")

    array = 0
    push_eh exception
      $S0 = shift array
    pop_eh
    ok(0, "shift_string - exception")
    .return()

exception:
    ok(1, "shift_string - exception")
    .return()
.end

.sub 'shift_integer'
    .local pmc array
    array = new ['ResizableStringArray']

    array[0] = "2"
    array[1] = "3"
    $I1 = shift array
    $I0 = elements array
    is($I0, 1, "shift_integer - elements")
    is($I1, 2, "shift_integer - value")

    array = 0
    push_eh exception
      $I0 = shift array
    pop_eh
    ok(0, "shift_integer - exception")
    .return()

exception:
    ok(1, "shift_integer - exception")
    .return()
.end

.sub 'shift_float'
    .local pmc array
    array = new ['ResizableStringArray']

    array[0] = "2.2"
    array[1] = "3.3"
    $N0 = shift array
    $I0 = elements array
    is($I0, 1,   "shift_float - elements")
    is($N0, 2.2, "shift_float - value")

    array = 0
    push_eh exception
      $N0 = shift array
    pop_eh
    ok(0, "shift_float - exception")
    .return()

exception:
    ok(1, "shift_float - exception")
    .return()
.end

#
# test unshifting PMCs onto the array
#
.sub 'unshift_pmc'
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    $P0 = new ['String']
    $P0 = "one"
    unshift array, $P0
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "unshift_pmc - elements")
    is($S0, "one", "unshift_pmc - value")

    $P0 = new ['String']
    $P0 = "two"
    unshift array, $P0
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,     "unshift_pmc (grow) - elements")
    is($S0, "two", "unshift_pmc (grow) - value")

    array = 1
    unshift array, "three"
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,       "unshift_pmc (shrink, grow) - elements")
    is($S0, "three", "unshift_pmc (shrink, grow) - value")
.end


#
# test unshifting STRINGs onto the array
#
.sub 'unshift_string'
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    unshift array, "one"
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "unshift_string - elements")
    is($S0, "one", "unshift_string - value")

    unshift array, "two"
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,     "unshift_string (grow) - elements")
    is($S0, "two", "unshift_string (grow) - value")

    array = 1
    unshift array, "three"
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,       "unshift_string (shrink, grow) - elements")
    is($S0, "three", "unshift_string (shrink, grow) - value")
.end


#
# Test unshifting STRINGs onto an array
# that is at the default resize_threshold(8).
# Trac ticket# 256
#
.sub 'unshift_string_resize_threshold'
    .local pmc rsarray
    rsarray = new ['ResizableStringArray']

    push rsarray, "1"
    push rsarray, "2"
    push rsarray, "3"
    push rsarray, "4"
    push rsarray, "5"
    push rsarray, "6"
    push rsarray, "7"
    push rsarray, "8"
# rsarray is now:  1  2  3  4  5  6  7  8

# This unshift will cause a resize larger than the
# initial resize_threshold (8), triggering the bug.
    unshift rsarray, "0"

# rsarray should now be   : 0  1  2  3  4  5  6  7  8
# The bug causes it to be : 0  2  3  4  5  6  7  8  ""

    $S0 = rsarray[0]
    $S1 = rsarray[1]
    $S2 = rsarray[2]
    $S3 = rsarray[3]
    $S4 = rsarray[4]
    $S5 = rsarray[5]
    $S6 = rsarray[6]
    $S7 = rsarray[7]
    $S8 = rsarray[8]

    $S9  = $S0
    $S9 .= $S1
    $S9 .= $S2
    $S9 .= $S3
    $S9 .= $S4
    $S9 .= $S5
    $S9 .= $S6
    $S9 .= $S7
    $S9 .= $S8

    is( $S9, "012345678", 'Unshift prepends at array instead of overlaying' )
.end


#
# test unshifting INTVALs onto the array
#
.sub 'unshift_integer'
    .local pmc array
    array = new ['ResizableStringArray']

    # unshift_string
    array = 0
    unshift array, 1
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,   "unshift_integer - elements")
    is($S0, "1", "unshift_integer - value")

    unshift array, 2
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,   "unshift_integer (grow) - elements")
    is($S0, "2", "unshift_integer (grow) - value")

    array = 1
    unshift array, 3
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,   "unshift_integer (shrink, grow) - elements")
    is($S0, "3", "unshift_integer (shrink, grow) - value")
.end


#
# test unshifting FLOATs onto the array
#
.sub 'unshift_float'
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    unshift array, 1.1
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "unshift_float - elements")
    is($S0, "1.1", "unshift_float - value")

    unshift array, 2.2
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,     "unshift_float (grow) - elements")
    is($S0, "2.2", "unshift_float (grow) - value")

    array = 1
    unshift array, 3.3
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,     "unshift_float (shrink, grow) - elements")
    is($S0, "3.3", "unshift_float (shrink, grow) - value")
.end

#
# test clone
#
.sub 'clone'
    .local pmc array
    array = new ['ResizableStringArray']
    array = 3
    array[0] = 1
    array[1] = 3.2
    array[2] = "boo"

    .local pmc cloned
    cloned = clone array

    $I0 = elements cloned
    is($I0, 3, 'cloned array - size')

    $S0 = typeof cloned
    is($S0, 'ResizableStringArray', 'cloned array - type')

    is_deeply(cloned, array, 'cloned array - deep comparison')
.end

.sub 'get_string'
    .local pmc array
    array = new ['ResizablePMCArray']
    array[0] = "foo"
    array[1] = "bar"
    array[2] = "baz"

    $S0 = array
    is($S0, 3, "get_string")
.end

.sub 'does'
    .local pmc array
    array = new ['ResizableStringArray']

    $I0 = does array, 'array'
    is($I0, 1, "does array")

    $I0 = does array, 'scalar'
    is($I0, 0, "doesn't do scalar")
.end

#
# a test with a sparse array. this converted from PASM from the original
# ResizableStringArray tests.
#
.sub sparse
    .local pmc array
    array = new ['ResizableStringArray']

    $I10 = 110000
    $I0  = 1
lp1:
    $I1 = $I0 + 5
    $I9 = $I1 % 2

    $S9 = $I9
    array[$I0] = $S9

    $I3 = $I1 + $I0
    $I9 = $I3 % 2

    $S9 = $I9
    push array, $S9

    $I0 = shl $I0, 1
    inc $I0
    if $I0 <= $I10 goto lp1

    $I0 = 1
lp2:
    $I1 = $I0 + 5
    $I9 = $I1 % 2

    $S2 = array[$I0]
    $I2 = $S2
    if $I2 != $I9 goto err_1

    $I3 = $I1 + $I0
    $I9 = $I3 % 2

    $I4 = $I0 + 1
    $S4 = array[$I4]
    $I4 = $S4
    if $I9 != $I4 goto err_1

    $I0 = shl $I0, 1
    inc $I0
    if $I0 <= $I10 goto lp2
    ok(1, "sparse 1")

    # now repeat and fill some holes
two:
    $I0 = 777
lp3:
    $I1 = $I0 + 5
    $I9 = $I1 % 2
    $S9 = $I9
    array[$I0] = $S9

    $I0 += 666
    if $I0 <= $I10 goto lp3

    $I0 = 777
lp4:
    $I1 = $I0 + 5
    $I9 = $I1 % 2
    $S2 = array[$I0]
    $I2 = $S2
    if $I2 != $I9 goto err_2

    $I0 += 666
    if $I0 <= $I10 goto lp4
    ok(1, "sparse 2")
    .return()

err_1:
    ok(0, "sparse 1")
    goto two

err_2:
    ok(0, "sparse 2")
    .return()
.end





.sub 'splice'
    $P1 = new ['ResizableStringArray']
    $P1 = 3
    $P1[0] = '1'
    $P1[1] = '2'
    $P1[2] = '3'
    $P2 = new ['ResizableStringArray']
    $P2 = 1
    $P2[0] = 'A'
    splice $P1, $P2, 0, 2
    $S0 = join "", $P1
    is($S0, "A3", "splice replace")

    $P1 = new ['ResizableStringArray']
    $P1 = 3
    $P1[0] = '1'
    $P1[1] = '2'
    $P1[2] = '3'
    $P2 = new ['ResizableStringArray']
    $P2 = 1
    $P2[0] = 'A'
    splice $P1, $P2, 1, 2
    $S0 = join "", $P1
    is($S0, "1A", "splice replace")

.macro SpliceMadeEasy(code, out, testing)
    $P1 = new ['ResizableStringArray']
    $P1[0] = "1"
    $P1[1] = "2"
    $P1[2] = "3"
    $P1[3] = "4"
    $P1[4] = "5"
    $P2 = new ['ResizableStringArray']
    $P2[0] = 'A'
    $P2[1] = 'B'
    $P2[2] = 'C'
    $P2[3] = 'D'
    $P2[4] = 'E'
.code
    $S0 = join "", $P1
    is($S0, .out, .testing)
.endm

    .SpliceMadeEasy({ splice $P1, $P2, 0, 5 }, "ABCDE", "splice, complete replace")
    .SpliceMadeEasy({ splice $P1, $P2, 5, 0 }, "12345ABCDE", "splice, append")
    .SpliceMadeEasy({ splice $P1, $P2, 4, 0 }, "1234ABCDE5", "splice, insert before last element")
    .SpliceMadeEasy({ splice $P1, $P2, 3, 0 }, "123ABCDE45", "splice, append-in-middle")
    .SpliceMadeEasy({ splice $P1, $P2, 0, 2 }, "ABCDE345", "splice, replace at beginning")
    .SpliceMadeEasy({ splice $P1, $P2, 2, 2 }, "12ABCDE5", "splice, replace in middle")
    .SpliceMadeEasy({ splice $P1, $P2, 3, 2 }, "123ABCDE", "splice, replace at end")
    .SpliceMadeEasy({ splice $P1, $P2, -3, 2 }, "12ABCDE5", "splice, replace in middle start from end")
    .SpliceMadeEasy({
        $P2 = new ['ResizableStringArray']
        splice $P1, $P2, 2, 2
    }, "125", "splice, empty replacement")
    .SpliceMadeEasy({
        $P2 = new ['ResizableStringArray']
        $P2[0] = "A"
        splice $P1, $P2, 2, 1
    }, "12A45", "splice, equal size replacement")

    $P1 = new ['ResizableStringArray']
    $P1[0] = "1"
    $P2 = new ['ResizableStringArray']
    $P2[0] = 'A'
    $I0 = 0
    push_eh handle_negtoobig
    splice $P1, $P2, -10, 1
    goto after_negtoobig
handle_negtoobig:
    inc $I0
after_negtoobig:
    pop_eh
    is($I0, 1, 'splice, negative offset too long throws')

    $P1 = new ['ResizableStringArray']
    $P1[0] = "1"
    $P1[1] = "2"
    $P1[2] = "3"
    $P1[3] = "4"
    $P1[4] = "5"
    $P2 = new ['ResizablePMCArray']
    $P2[0] = 'A'
    $P2[1] = 'B'
    $P2[2] = 'C'
    $P2[3] = 'D'
    $P2[4] = 'E'

    push_eh bad_type
    splice $P1, $P2, 1, 0
    pop_eh
    goto still_ok

    .local pmc exception
    .local string message
bad_type:
    pop_eh
    .get_results (exception)
    message = exception
still_ok:
    message = substr message, 22, 23
    is(message, 'illegal type for splice', "splice with a different type")
.end

#
# test pushing PMCs onto the array
#
.sub method_push_pmc
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    $P0 = new ['String']
    $P0 = "one"
    array.'push'($P0)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "method_push_pmc - elements")
    is($S0, "one", "method_push_pmc - value")

    $P0 = new ['String']
    $P0 = "two"
    array.'push'($P0)
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,     "method_push_pmc (grow) - elements")
    is($S0, "two", "method_push_pmc (grow) - value")

    array = 1
    array.'push'('three')
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,       "method_push_pmc (shrink, grow) - elements")
    is($S0, "three", "method_push_pmc (shrink, grow) - value")
.end


#
# test pushing STRINGs onto the array
#
.sub method_push_string
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    array.'push'("one")
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "method_push_string - elements")
    is($S0, "one", "method_push_string - value")

    array.'push'("two")
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,     "method_push_string (grow) - elements")
    is($S0, "two", "method_push_string (grow) - value")

    array = 1
    array.'push'("three")
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,       "method_push_string (shrink, grow) - elements")
    is($S0, "three", "method_push_string (shrink, grow) - value")
.end


#
# test pushing INTVALs onto the array
#
.sub method_push_integer
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    array.'push'(1)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,   "method_push_integer - elements")
    is($S0, "1", "method_push_integer - value")

    array.'push'(2)
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,   "method_push_integer (grow) - elements")
    is($S0, "2", "method_push_integer (grow) - value")

    array = 1
    array.'push'(3)
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,   "method_push_integer (shrink, grow) - elements")
    is($S0, "3", "method_push_integer (shrink, grow) - value")
.end


#
# test pushing FLOATs onto the array
#
.sub method_push_float
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    array.'push'(1.1)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "method_push_float - elements")
    is($S0, "1.1", "method_push_float - value")

    array.'push'(2.2)
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,     "method_push_float (grow) - elements")
    is($S0, "2.2", "method_push_float (grow) - value")

    array = 1
    array.'push'(3.3)
    $I0 = elements array
    $S0 = array[1]
    is($I0, 2,     "method_push_float (shrink, grow) - elements")
    is($S0, "3.3", "method_push_float (shrink, grow) - value")
.end


.sub method_pop_pmc
    .local pmc array
    array = new ['ResizableStringArray']

    array[1] = "foo"
    $P0 = array.'pop'()
    $I0 = elements array
    $S0 = typeof $P0
    $S1 = $P0
    is($I0, 1,        "method_pop_pmc - elements")
    is($S0, 'String', "method_pop_pmc - type")
    is($S1, 'foo',    "method_pop_pmc - value")

    array = 0
    push_eh exception
      $P0 = array.'pop'()
    pop_eh
    ok(0, "method_pop_pmc - exception")
    .return()

exception:
    ok(1, "method_pop_pmc - exception")
    .return()
.end

.sub method_pop_string
    .local pmc array
    array = new ['ResizableStringArray']

    array[1] = "foo"
    $S0 = array.'pop'()
    $I0 = elements array
    is($I0, 1,     "method_pop_string - elements")
    is($S0, 'foo', "method_pop_string - value")

    array = 0
    push_eh exception
      $S0 = array.'pop'()
    pop_eh
    ok(0, "method_pop_string - exception")
    .return()

exception:
    ok(1, "method_pop_string - exception")
    .return()
.end

.sub method_pop_integer
    .local pmc array
    array = new ['ResizableStringArray']

    array[1] = "2"
    $I1 = array.'pop'()
    $I0 = elements array
    is($I0, 1, "method_pop_integer - elements")
    is($I1, 2, "method_pop_integer - value")

    array = 0
    push_eh exception
      $I0 = array.'pop'()
    pop_eh
    ok(0, "method_pop_integer - exception")
    .return()

exception:
    ok(1, "method_pop_integer - exception")
    .return()
.end

.sub method_pop_float
    .local pmc array
    array = new ['ResizableStringArray']

    array[1] = "2.2"
    $N0 = array.'pop'()
    $I0 = elements array
    is($I0, 1,   "method_pop_float - elements")
    is($N0, 2.2, "method_pop_float - value")

    array = 0
    push_eh exception
      $N0 = array.'pop'()
    pop_eh
    ok(0, "method_pop_float - exception")
    .return()

exception:
    ok(1, "method_pop_float - exception")
    .return()
.end

.sub method_shift_pmc
    .local pmc array
    array = new ['ResizableStringArray']

    array[0] = "foo"
    array[1] = "bar"
    $P0 = array.'shift'()
    $I0 = elements array
    $S0 = typeof $P0
    $S1 = $P0
    is($I0, 1,        "method_shift_pmc - elements")
    is($S0, 'String', "method_shift_pmc - type")
    is($S1, 'foo',    "method_shift_pmc - value")

    array = 0
    push_eh exception
      $P0 = array.'shift'()
    pop_eh
    ok(0, "method_shift_pmc - exception")
    .return()

exception:
    ok(1, "method_shift_pmc - exception")
    .return()
.end

.sub method_shift_string
    .local pmc array
    array = new ['ResizableStringArray']

    array[0] = "foo"
    array[1] = "bar"
    $S0 = array.'shift'()
    $I0 = elements array
    is($I0, 1,        "method_shift_string - elements")
    is($S0, 'foo',    "method_shift_string - value")

    array = 0
    push_eh exception
      $S0 = array.'shift'()
    pop_eh
    ok(0, "method_shift_string - exception")
    .return()

exception:
    ok(1, "method_shift_string - exception")
    .return()
.end

.sub method_shift_integer
    .local pmc array
    array = new ['ResizableStringArray']

    array[0] = "2"
    array[1] = "3"
    $I1 = array.'shift'()
    $I0 = elements array
    is($I0, 1, "method_shift_integer - elements")
    is($I1, 2, "method_shift_integer - value")

    array = 0
    push_eh exception
      $I0 = array.'shift'()
    pop_eh
    ok(0, "method_shift_integer - exception")
    .return()

exception:
    ok(1, "method_shift_integer - exception")
    .return()
.end

.sub method_shift_float
    .local pmc array
    array = new ['ResizableStringArray']

    array[0] = "2.2"
    array[1] = "3.3"
    $N0 = array.'shift'()
    $I0 = elements array
    is($I0, 1,   "method_shift_float - elements")
    is($N0, 2.2, "method_shift_float - value")

    array = 0
    push_eh exception
      $N0 = array.'shift'()
    pop_eh
    ok(0, "method_shift_float - exception")
    .return()

exception:
    ok(1, "method_shift_float - exception")
    .return()
.end

.sub method_unshift_pmc
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    $P0 = new ['String']
    $P0 = "one"
    array.'unshift'($P0)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "method_unshift_pmc - elements")
    is($S0, "one", "method_unshift_pmc - value")

    $P0 = new ['String']
    $P0 = "two"
    array.'unshift'($P0)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,     "method_unshift_pmc (grow) - elements")
    is($S0, "two", "method_unshift_pmc (grow) - value")

    array = 1
    array.'unshift'("three")
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,       "method_unshift_pmc (shrink, grow) - elements")
    is($S0, "three", "method_unshift_pmc (shrink, grow) - value")
.end


#
# test unshifting STRINGs onto the array
#
.sub method_unshift_string
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    array.'unshift'("one")
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "method_unshift_string - elements")
    is($S0, "one", "method_unshift_string - value")

    array.'unshift'("two")
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,     "method_unshift_string (grow) - elements")
    is($S0, "two", "method_unshift_string (grow) - value")

    array = 1
    array.'unshift'("three")
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,       "method_unshift_string (shrink, grow) - elements")
    is($S0, "three", "method_unshift_string (shrink, grow) - value")
.end


#
# test unshifting INTVALs onto the array
#
.sub method_unshift_integer
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    array.'unshift'(1)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,   "method_unshift_integer - elements")
    is($S0, "1", "method_unshift_integer - value")

    array.'unshift'(2)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,   "method_unshift_integer (grow) - elements")
    is($S0, "2", "method_unshift_integer (grow) - value")

    array = 1
    array.'unshift'(3)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,   "method_unshift_integer (shrink, grow) - elements")
    is($S0, "3", "method_unshift_integer (shrink, grow) - value")
.end


#
# test unshifting FLOATs onto the array
#
.sub method_unshift_float
    .local pmc array
    array = new ['ResizableStringArray']

    array = 0
    array.'unshift'(1.1)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 1,     "method_unshift_float - elements")
    is($S0, "1.1", "method_unshift_float - value")

    array.'unshift'(2.2)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,     "method_unshift_float (grow) - elements")
    is($S0, "2.2", "method_unshift_float (grow) - value")

    array = 1
    array.'unshift'(3.3)
    $I0 = elements array
    $S0 = array[0]
    is($I0, 2,     "method_unshift_float (shrink, grow) - elements")
    is($S0, "3.3", "method_unshift_float (shrink, grow) - value")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
