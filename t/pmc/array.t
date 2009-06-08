#! parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/array.t - Array PMC

=head1 SYNOPSIS

    % prove t/pmc/array.t

=head1 DESCRIPTION

Tests C<Array> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

.namespace []

.include "except_types.pasm"
.include 'fp_equality.pasm'

.sub main :main
    .include 'test_more.pir'

    plan(64)

    setting_array_size() # 4 tests
    setting_first_element() # 3 tests
    setting_second_element() # 3 tests
    setting_out_of_bounds_element() # 2 tests
    defined_sub() # 8 tests
    exists_sub() # 6 tests
    set_via_pmc_keys_access_via_ints() # 4 tests
    set_via_ints_access_via_pmc_keys() # 4 tests
    multikeyed_access_i_arg() # 5 tests
    multikeyed_access_p_arg() # 5 tests
    delete_sub() # 3 tests
    check_whether_interface_is_done() # 3 tests
    get_bool() # 4 tests
    freeze_thaw() # 5 tests
    array_comparison() # 5 tests
.end


.sub setting_array_size
    .local pmc foo, ifoo
    .local int size

    foo = new ['Array']
    size = foo
    is(size, 0, 'array size initialised to 0 correctly')

    foo = 1
    size = foo
    is(size, 1, 'array size set to 1 correctly')

    foo = 2
    size = foo
    is(size, 2, 'array size set to 2 correctly')

    ifoo = new ['Integer']
    ifoo = 3
    foo = ifoo
    size = foo
    is(size, 3, 'array size set to 3 correctly')
.end

.sub setting_first_element
    .local pmc foo
    .local int ival
    .local num nval
    .local string sval

    foo = new ['Array']
    foo = 1

    foo[0] = -7
    ival = foo[0]
    is(ival, -7, 'array first element set to integer correctly')

    foo[0] = 3.7
    nval = foo[0]
    is(nval, 3.7, 'array first element set to number correctly')

    foo[0] = "Buckaroo"
    sval = foo[0]
    is(sval, "Buckaroo", 'array first element set to string correctly')
.end

.sub setting_second_element
    .local pmc foo
    .local int ival
    .local num nval
    .local string sval

    foo = new ['Array']
    foo = 2

    foo[1] = -7
    ival = foo[1]
    is(ival, -7, 'array second element set to integer correctly')

    foo[1] = 3.7
    nval = foo[1]
    is(nval, 3.7, 'array second element set to number correctly')

    foo[1] = "Buckaroo"
    sval = foo[1]
    is(sval, "Buckaroo", 'array second element set to string correctly')
.end

.sub setting_out_of_bounds_element
    .local pmc foo, eh
    .local int ifoo

    foo = new ['Array']
    foo = 1

    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    set_addr eh, eh_label

    foo[0] = 42
    ifoo = foo[0]
    is(ifoo, 42, 'array in-bounds element set correctly')

    push_eh eh
      foo[1] = -7
    pop_eh

    ok(0, 'setting_out_of_bounds_element')
    goto end

eh_label:
    .local string message
    .get_results($P0)
    message = $P0['message']
    is(message, "Array index out of bounds!", 'setting_out_of_bounds_element')

end:
.end

.sub defined_sub
    .local pmc foo, bar, baz
    .local int ival
    
    foo = new ['Array']
    defined ival, foo
    is(ival, 1, 'newed array is defined')

    defined ival, bar
    is(ival, 0, 'unreferenced pmc is undefined')

    foo = 5
    foo[0] = 1
    defined ival, foo[0]
    is(ival, 1, 'assigned array element is defined')

    defined ival, foo[1]
    is(ival, 0, 'unassigned in-bounds array element is undefined')

    defined ival, foo[100]
    is(ival, 0, 'unassigned out-of-bounds array element is undefined')

    bar = new ['Undef']
    foo[2] = bar
    defined ival, foo[2]
    is(ival, 0, 'assigned undef pmc is undefined')

    baz = new ['Key']
    baz = 3
    foo[3] = 4
    defined ival, foo[baz]
    is(ival, 1, 'defined keyed array element is defined')

    baz = 4
    defined ival, foo[baz]
    is(ival, 0, 'undefined keyed array element is defined')
.end

.sub exists_sub
    .local pmc foo, bar, baz
    .local int ival

    foo = new ['Array']
    foo = 5
    foo[0] = 1
    exists ival, foo[0]
    is(ival, 1, 'assigned array element exists')

    exists ival, foo[1]
    is(ival, 0, 'unassigned in-bounds array element does not exist')

    exists ival, foo[100]
    is(ival, 0, 'unassigned out-of-bounds array element does not exist')

    bar = new ['Undef']
    foo[2] = bar
    exists ival, foo[2]
    is(ival, 1, 'assigned undef array element exists')

    baz = new ['Key']
    baz = 3
    foo[3] = 4
    exists ival, foo[baz]
    is(ival, 1, 'defined keyed array element exists')

    baz = 4
    exists ival, foo[baz]
    is(ival, 0, 'undefined keyed array element does not exist')
.end

.sub set_via_pmc_keys_access_via_ints
    .local pmc foo, bar, baz, faz
    .local int ival
    .local num nval
    .local string sval, inner
   
    foo = new ['Array']
    foo = 4
    bar = new ['Key']

    bar = 0
    foo[bar] = 25
    ival = foo[0]
    is(ival, 25, 'integer element can be retrieved from array')

    bar = 1
    foo[bar] = 2.5
    nval = foo[1]
    is(nval, 2.5, 'number element can be retrieved from array')

    bar = 2
    foo[bar] = "Squeek"
    sval = foo[2]
    is(sval, "Squeek", 'string element can be retrieved from array')

    bar = 3
    baz = new ['Hash']
    baz["a"] = "apple"
    foo[bar] = baz

    faz = foo[3]
    inner = faz["a"]
    is(inner, "apple", 'inner string element can be retrieved from array')
.end

.sub set_via_ints_access_via_pmc_keys
    .local pmc foo, bar, baz, faz
    .local int ival, inner
    .local num nval
    .local string sval

    foo = new ['Array']
    foo = 1024

    foo[25] = 125
    foo[128] = -9.9
    foo[513] = "qwertyuiopasdfghjklzxcvbnm"
    bar = new ['Integer']
    bar = 123456
    foo[1023] = bar

    baz = new ['Key']
    baz = 25

    ival = foo[baz]
    is(ival, 125, 'integer element can be retrieved from array')

    baz = 128
    nval = foo[baz]
    is(nval, -9.9, 'number element can be retrieved from array')

    baz = 513
    sval = foo[baz]
    is(sval, "qwertyuiopasdfghjklzxcvbnm", 'string element can be retrieved from array')

    baz = 1023
    faz = foo[baz]
    inner = faz
    is(inner, 123456, 'indirect integer element can be retrieved from array')
.end

.sub multikeyed_access_i_arg
    .local pmc foo, bar, baz
    .local int ival, inum
    .local string pmctype

    foo = new ['Array']
    foo = 1
    bar = new ['Array']
    bar = 1

    foo[0] = bar
    foo[0;0] = 20
    baz = foo[0]
    typeof pmctype, baz
    is(pmctype, 'Array', 'pmc is an array')

    ival = foo[0;0]
    is(ival, 20, 'access to array via [int;int] works correctly')

    inum = 0
    ival = foo[inum;0]
    is(ival, 20, 'access to array via [var;int] works correctly')

    ival = foo[0;inum]
    is(ival, 20, 'access to array via [int;var] works correctly')

    ival = foo[inum;inum]
    is(ival, 20, 'access to array via [var;var] works correctly')
.end

.sub multikeyed_access_p_arg
    .local pmc foo, bar, baz, faz
    .local int ival, inum
    .local string pmctype

    foo = new ['Array']
    foo = 1
    bar = new ['Array']
    bar = 1

    faz = new ['Integer']
    faz = 20
    foo[0] = bar
    foo[0;0] = faz
    baz = foo[0]
    typeof pmctype, baz
    is(pmctype, 'Array', 'pmc is an array')

    ival = foo[0;0]
    is(ival, 20, 'access to array via [int;int] works correctly')

    inum = 0
    ival = foo[inum;0]
    is(ival, 20, 'access to array via [var;int] works correctly')

    ival = foo[0;inum]
    is(ival, 20, 'access to array via [int;var] works correctly')

    ival = foo[inum;inum]
    is(ival, 20, 'access to array via [var;var] works correctly')
.end

.sub delete_sub
    .local pmc foo
    .local int ival

    foo = new ['Array']
    foo = 3
    foo[0] = 10
    foo[1] = 20
    foo[2] = 30

    delete foo[1]
    ival = foo
    is(ival, 2, 'array with deleted element correctly sized')

    ival = foo[0]
    is(ival, 10, 'array with deleted element has correct first element')

    ival = foo[1]
    is(ival, 30, 'array with deleted element has correct first element')
.end

.sub check_whether_interface_is_done
    .local pmc pmc1
    pmc1 = new ['Array']
    .local int bool1
    does bool1, pmc1, "scalar"
    is(bool1, 0, 'pmc array does not do scalar correctly')

    does bool1, pmc1, "array"
    is(bool1, 1, 'pmc array does array correctly')

    does bool1, pmc1, "no_interface"
    is(bool1, 0, 'pmc array does not do no_interface correctly')
.end

.sub get_bool
    .local pmc p
    .local int i

    p = new ['Array']
    is(p, 0, 'newed array is not true correctly')
    
    p = 4
    is(p, 4, 'resized array is true correctly')

    p[0] = 2
    is(p, 4, 'assigned array is true correctly')

    p = new ['Array']
    p = 0
    is(p, 0, 'newed array set to zero length is not true correctly')
.end


.sub freeze_thaw
    .local pmc p, it, val
    .local string s

    .local string reason
    reason = "freeze/thaw known to be broken"

    p = new ['Array']

    unshift p, 2
    unshift p, "foo"
    unshift p, 9999
    unshift p, -3
    unshift p, "p"

    s = freeze p
    p = thaw s

    it = iter p

    val = shift it
    #is(val, '"p"', 'first thawed array element accessed correctly')
    unless null val goto NOT_NULL_1
        val = new 'String'
  NOT_NULL_1:
    $I0 = cmp val, '"p"'
    $I0 = not $I0
    todo($I0, 'first thawed array element accessed correctly', reason)

    val = shift it
    #is(val, '-3', 'second thawed array element accessed correctly')
    unless null val goto NOT_NULL_2
        val = new 'String'
  NOT_NULL_2:
    $I0 = cmp val, -3
    $I0 = not $I0
    todo($I0, 'second thawed array element accessed correctly', reason)

    val = shift it
    #is(val, '9999', 'third thawed array element accessed correctly')
    unless null val goto NOT_NULL_3
        val = new 'String'
  NOT_NULL_3:
    $I0 = cmp val, '9999'
    $I0 = not $I0
    todo($I0, 'third thawed array element accessed correctly', reason)

    val = shift it
    #is(val, 'foo', 'fourth thawed array element accessed correctly')
    unless null val goto NOT_NULL_4
        val = new 'String'
  NOT_NULL_4:
    $I0 = cmp val, 'foo'
    $I0 = not $I0
    todo($I0, 'fourth thawed array element accessed correctly', reason)

    val = shift it
    #is(val, '2', 'fifth thawed array element accessed correctly')
    unless null val goto NOT_NULL_5
        val = new 'String'
  NOT_NULL_5:
    $I0 = cmp val, '2'
    $I0 = not $I0
    todo($I0, 'fifth thawed array element accessed correctly', reason)
.end

.sub array_comparison
    .local pmc a1, a2
    .local int i

    a1 = new ['Array']
    a2 = new ['Array']

    is(a1, a2, 'two newed arrays are equal correctly')

    a1 = 4
    isnt(a1, a2, 'a sized array is not the same as a newed array correctly')

    a2 = 4
    is(a1, a2, 'two identically sized arrays are equal correctly')

    a1[0] = "foo"
    a2[0] = "foo"
    is(a1, a2, 'two identically assigned arrays are equal correctly')

    a1[1] = 234
    a2[1] = 234
    a1[3] = "bar"
    a2[3] = "bar"
    is(a1, a2, 'two identically assigned arrays are equal correctly')
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
