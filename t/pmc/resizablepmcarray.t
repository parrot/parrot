#!./parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/resizablepmcarray.t - testing the ResizablePMCArray PMC

=head1 SYNOPSIS

    % prove t/pmc/resizablepmcarray.t

=head1 DESCRIPTION

Tests C<ResizablePMCArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

.sub main :main
    .include 'fp_equality.pasm'
    .include 'test_more.pir'

    plan(142)

    resize_tests()
    negative_array_size()
    set_tests()
    exception_tests()
    set_keyed_get_keyed_tests()
    interface_check()
    inherited_sort_method()
    sort_subclass()
    push_pmc()
    push_int()
    push_string()
    shift_int()
    unshift_pmc()
    get_mro_tests()
    push_and_pop()
    unshift_and_shift()
    shift_empty()
    pop_empty()
    multikey_access()
    exists_and_defined()
    delete_keyed()
    get_rep()
    append_tests()
    splice_tests()
    splice_replace1()
    splice_replace2()
    iterate_subclass_of_rpa()
    method_forms_of_unshift_etc()
    sort_with_broken_cmp()
    addr_tests()
    equality_tests()
    sort_tailcall()
    push_to_subclasses_array()
.end


.sub resize_tests
    .local pmc p
    .local int is_ok, i
    p = new ['ResizablePMCArray']

    i = p
    is_ok = i == 0
    ok(is_ok, "resize test (0)")

    p = 1
    i = p
    is_ok = i == 1
    ok(is_ok, "resize test (1)")

    p = 5
    i = p
    is_ok = i == 5
    ok(is_ok, "resize test (5)")

    p = 9
    i = p
    is_ok = i == 9
    ok(is_ok, "resize test (9)")

    p = 7
    i = p
    is_ok = i == 7
    ok(is_ok, "resize test (7)")
.end


.sub negative_array_size
    .local pmc p
    .local int is_ok, i
    p = new ['ResizablePMCArray']
    push_eh eh
    p = -1
    pop_eh
    ok(0, "exception not caught")
    goto end
eh:
    ok(1, "exception caught")
end:
.end


.sub set_tests
    .local pmc p
    .local int is_ok, i
    .local num n
    .local string s

    p = new ['ResizablePMCArray']
    p = 1

    p[0] = -7
    i = p[0]
    is_ok = i == -7
    ok(is_ok, "INTVAL assignment to first element")

    p[0] = 3.7
    n = p[0]
    is_ok = n == 3.7
    ok(is_ok, "FLOATVAL assignment to first element")

    p[0] = "muwhahaha"
    s = p[0]
    is_ok = s == "muwhahaha"
    ok(is_ok, "STRING assignment to first element")

    p[1] = -7
    i = p[1]
    is_ok = i == -7
    ok(is_ok, "INTVAL assignment to second element")

    p[1] = 3.7
    n = p[1]
    is_ok = n == 3.7
    ok(is_ok, "FLOATVAL assignment to second element")

    p[1] = "muwhahaha"
    s = p[1]
    is_ok = s == "muwhahaha"
    ok(is_ok, "STRING assignment to second element")

    p[10] = -7
    i = p[10]
    is_ok = i == -7
    ok(is_ok, "INTVAL assignment to last element")

    p[10] = 3.7
    n = p[10]
    is_ok = n == 3.7
    ok(is_ok, "FLOATVAL assignment to last element")

    p[10] = "muwhahaha"
    s = p[10]
    is_ok = s == "muwhahaha"
    ok(is_ok, "STRING assignment to last element")
.end


.sub exception_tests
    .local pmc rpa, i

    rpa = new ['ResizablePMCArray']
    rpa = 1
    i = new ['Integer']
    i = 12345

    push_eh eh1
    rpa[10] = i
    pop_eh
    goto no_eh1
eh1:
    ok(0, "unwanted ex thrown for out-of-bounds index")
    goto test2
no_eh1:
    ok(1, "no ex thrown for out-of-bounds index")

test2:
    rpa = 1
    push_eh eh2
    rpa[-10] = i
    pop_eh
    goto no_eh2
eh2:
    ok(1, "ex thrown for negative index")
    goto test3
no_eh2:
    ok(0, "no ex thrown for negative index")

test3:
    rpa = 1
    push_eh eh3
    i = rpa[10]
    pop_eh
    goto no_eh3
eh3:
    ok(0, "unwanted ex thrown for out-of-bounds index")
    goto test4
no_eh3:
    ok(1, "no ex thrown for out-of-bounds index")

test4:
    rpa = 1
    push_eh eh4
    i = rpa[-10]
    pop_eh
    goto no_eh4
eh4:
    ok(1, "ex thrown for negative index")
    goto end
no_eh4:
    ok(0, "no ex thrown for negative index")
end:
.end


.sub set_keyed_get_keyed_tests

    new $P0, ['ResizablePMCArray']
    new $P1, ['Key']

    set $P1, 0
    set $P0[$P1], 25

    set $P1, 1
    set $P0[$P1], 2.5

    set $P1, 2
    set $P0[$P1], "bleep"

    new $P2, ['String']
    set $P2, "Bloop"
    set $P1, 3
    set $P0[$P1], $P2

    set $I0, $P0[0]
    is($I0, 25, "set int via Key PMC, get int via int")

    set $N0, $P0[1]
    .fp_eq($N0, 2.5, OK1)
    ok(0, "set num via Key PMC, get num via int fails")
    goto NOK1
OK1:
    ok(1, "set num via Key PMC, get num via int fails")
NOK1:

    set $S0, $P0[2]
    is($S0, "bleep", "set string via Key PMC, get string via int")

    new $P3, ['Undef']
    set $P3, $P0[3]
    set $S0, $P3
    is($S0, "Bloop", "set PMC via Key PMC, get PMC via PMC")


    new $P0, ['ResizablePMCArray']
    set $P0, 1

    set $P0[25], 125
    set $P0[128], 10.2
    set $P0[513], "cow"
    new $P1, ['Integer']
    set $P1, 123456
    set $P0[1023], $P1

    new $P2, ['Key']
    set $P2, 25
    set $I0, $P0[$P2]
    is($I0, 125, "set int via int, get int via Key PMC")

    set $P2, 128
    set $N0, $P0[$P2]
    .fp_eq($N0, 10.2, OK2)
    ok(0, "set num via int, get num via Key PMC")
    goto NOK2
OK2:
    ok(1, "set num via int, get num via Key PMC")
NOK2:

    set $P2, 513
    set $S0, $P0[$P2]
    is($S0, "cow", "set string via int, get string via Key PMC")

    set $P2, 1023
    set $P3, $P0[$P2]
    set $I1, $P3
    is($I1, 123456, "set int via int, get int via Key PMC")

.end


.sub interface_check
    .local pmc p
    p = new ['ResizablePMCArray']
    .local int b
    does b, p, "scalar"
    is(b, 0 ,"ResizablePMCArray doesn't do scalar")
    does b, p, "array"
    is(b, 1, "ResizablePMCArray does array")
    does b, p, "no_interface"
    is(b, 0, "ResizablePMCArray doesn't do no_interface")
.end


.sub inherited_sort_method
    .local pmc ar
    ar = new ['ResizablePMCArray']

    ar[0] = 10
    ar[1] = 2
    ar[2] = 5
    ar[3] = 9
    ar[4] = 1

    .local pmc cmp_fun
    null cmp_fun
    ar."sort"(cmp_fun)

    .local string sorted
    sorted = ''
    .local pmc it
    iter it, ar
lp:
    unless it goto done
    $P0 = shift it
    $S0 = $P0
    concat sorted, $S0
    concat sorted, " "
    goto lp
done:
    is(sorted, "1 2 5 9 10 ", "inherited sort method works")
.end


.sub sort_subclass
    .local pmc subrpa, arr
    subrpa = subclass ['ResizablePMCArray'], 'ssRPA'
    arr = new subrpa
    arr[0] = 'p'
    arr[1] = 'a'
    arr[2] = 'z'
    # Use a comparator that gives a reverse alphabetical order
    # to make sure sort is using it, and not some default from
    # elsewhere.
    .local pmc comparator
    comparator = get_global 'compare_reverse'
    arr.'sort'(comparator)
    .local string s, aux
    s = typeof arr
    concat s, ':'
    aux = join '-', arr
    concat s, aux
    is(s, 'ssRPA:z-p-a', "sort works in a pir subclass, TT #218")
.end

.sub compare_reverse
    .param string a
    .param string b
    $I0 = cmp b, a
    .return($I0)
.end


.sub push_pmc
    .local pmc pmc_arr, pmc_9999, pmc_10000
    pmc_arr = new ['ResizablePMCArray']
    pmc_9999  = new ['Float']
    pmc_9999  = 10000.10000
    pmc_10000 = new ['Float']
    pmc_10000 = 123.123
    pmc_arr[9999] = pmc_9999
    push pmc_arr, pmc_10000
    .local int elements
    elements = pmc_arr
    is(elements, 10001, "element count is correct")
    .local pmc last
    last = pmc_arr[10000]
    is(last, 123.123, "last element has correct value")
.end


.sub push_int
    .local pmc pmc_arr, pmc_9999
    .local int int_10000
    pmc_arr = new ['ResizablePMCArray']
    pmc_9999  = new ['Float']
    pmc_9999  = 10000.10000
    int_10000 = 123
    pmc_arr[9999] = pmc_9999
    push pmc_arr, int_10000
    .local int elements
    elements = pmc_arr
    is(elements, 10001, "element count is correct")
    .local pmc last
    last = pmc_arr[10000]
    is(last, 123, "last element has correct value")
.end


.sub push_string
    .local pmc pmc_arr, pmc_9999
    .local string string_10000
    pmc_arr = new ['ResizablePMCArray']
    pmc_9999  = new ['Float']
    pmc_9999  = 10000.10000
    string_10000 = '123asdf'
    pmc_arr[9999] = pmc_9999
    push pmc_arr, string_10000
    .local int elements
    elements = pmc_arr
    is(elements, 10001, "element count is correct")
    .local pmc last
    last = pmc_arr[10000]
    is(last, "123asdf", "last element has correct value")
.end


.sub shift_int
    .local pmc pmc_arr, elem
    pmc_arr = new ['ResizablePMCArray']
    push pmc_arr, 4
    push pmc_arr, 3
    push pmc_arr, 2
    push pmc_arr, 1
    push pmc_arr, 0

    .local int elements

    elements = pmc_arr
    is(elements, 5, "element count is correct")

    elem = shift pmc_arr
    is(elem, 4, "correct element unshifted")
    elements = pmc_arr
    is(elements, 4, "correct element count after unshifing")

    elem = shift pmc_arr
    is(elem, 3, "correct element unshifted")
    elements = pmc_arr
    is(elements, 3, "correct element count after unshifing")

    elem = shift pmc_arr
    is(elem, 2, "correct element unshifted")
    elements = pmc_arr
    is(elements, 2, "correct element count after unshifing")

    elem = shift pmc_arr
    is(elem, 1, "correct element unshifted")
    elements = pmc_arr
    is(elements, 1, "correct element count after unshifing")

    elem = shift pmc_arr
    is(elem, 0, "correct element unshifted")
    elements = pmc_arr
    is(elements, 0, "correct element count after unshifing")

.end

.sub unshift_pmc
    new $P0, ['ResizablePMCArray']
    new $P1, ['Integer']
    set $P1, 1
    new $P2, ['Integer']
    set $P2, 2
    new $P3, ['Integer']
    set $P3, 3
    unshift $P0, $P1
    unshift $P0, $P2
    unshift $P0, $P3
    elements $I0, $P0
    is($I0, 3, "element count is correct")
    set $P3, $P0[0]
    is($P3, 3, "element 0 has correct value")
    set $P3, $P0[1]
    is($P3, 2, "element 1 has correct value")
    set $P3, $P0[2]
    is($P3, 1, "element 2 has correct value")
.end


.sub get_mro_tests
    new $P0, ['ResizablePMCArray']
    $P1 = inspect $P0, 'mro'
    ok(1, "get_mro didn't explode")
    elements $I1, $P1
    null $I0
    $S1 = ''
loop:
    set $P2, $P1[$I0]
    typeof $S0, $P2
    concat $S1, $S0
    concat $S1, ","
    inc $I0
    lt $I0, $I1, loop

    is($S1, "ResizablePMCArray,FixedPMCArray,", "ResizablePMCArrays have the right MRO")
.end


.sub push_and_pop
    .local num f, f_elem
    .local int i, i_elem, elements
    .local pmc p, p_elem, pmc_arr
    .local string s, s_elem

    f = 123.123
    i = 123
    p = new ['Float']
    p = 456.456
    s = "abc"

    pmc_arr = new ['ResizablePMCArray']

    elements = pmc_arr
    is(elements, 0, "element count of empty ResizablePMCArray is 0")

    push pmc_arr, s
    push pmc_arr, p
    push pmc_arr, i
    push pmc_arr, f

    elements = pmc_arr
    is(elements, 4, "element count after several push operations is correct")

    f_elem = pop pmc_arr
    is(f_elem, 123.123000, "shifted float is correct")

    i_elem = pop pmc_arr
    is(i_elem, 123, "shifted int is correct")

    p_elem = pop pmc_arr
    is(p_elem, 456.456, "shifted PMC is correct")

    s_elem = pop pmc_arr
    is(s_elem, "abc", "shifted string is correct")
    elements = pmc_arr
    is(elements, 0, "element count after several shift operations is correct")

.end


.sub unshift_and_shift
    .local num f, f_elem
    .local int i, i_elem, elements
    .local pmc p, p_elem, pmc_arr
    .local string s, s_elem

    f = 123.123
    i = 123
    p = new ['Float']
    p = 456.456
    s = "abc"

    pmc_arr = new ['ResizablePMCArray']

    elements = pmc_arr
    is(elements, 0, "empty RPA has 0 elements")

    unshift pmc_arr, f
    unshift pmc_arr, i
    unshift pmc_arr, p
    unshift pmc_arr, s

    elements = pmc_arr
    is(elements, 4, "RPA has 4 elements after 4 unshifts")

    s_elem = shift pmc_arr
    is(s_elem, "abc", "shifted string has correct value")

    p_elem = shift pmc_arr
    is(p_elem, 456.456, "shifted pmc has correct value")

    i_elem = shift pmc_arr
    is(i_elem, 123, "shifted int has correct value")

    f_elem = shift pmc_arr
    is(f_elem, 123.123000, "shifted num has correct value")
    elements = pmc_arr
    is(elements, 0, "expectedly empty RPA has 0 elements")
.end

.sub shift_empty
    .local pmc pmc_arr
    pmc_arr = new ['ResizablePMCArray']
    $I1 = 0
    push_eh handle_i
    $I0 = shift pmc_arr
    inc $I1
handle_i:
    pop_eh
    is($I1, 0, 'shift int from empty RPA throws')

    push_eh handle_n
    $N0 = shift pmc_arr
    inc $I1
handle_n:
    pop_eh
    is($I1, 0, 'shift num from empty RPA throws')

    push_eh handle_s
    $S0 = shift pmc_arr
    inc $I1
handle_s:
    pop_eh
    is($I1, 0, 'shift string from empty RPA throws')

    push_eh handle_p
    $P0 = shift pmc_arr
    inc $I1
handle_p:
    pop_eh
    is($I1, 0, 'shift pmc from empty RPA throws')

.end

.sub pop_empty
    .local pmc pmc_arr
    pmc_arr = new ['ResizablePMCArray']
    $I1 = 0
    push_eh handle_i
    $I0 = pop pmc_arr
    inc $I1
handle_i:
    pop_eh
    is($I1, 0, 'pop int from empty RPA throws')

    push_eh handle_n
    $N0 = pop pmc_arr
    inc $I1
handle_n:
    pop_eh
    is($I1, 0, 'pop num from empty RPA throws')

    push_eh handle_s
    $S0 = pop pmc_arr
    inc $I1
handle_s:
    pop_eh
    is($I1, 0, 'pop string from empty RPA throws')

    push_eh handle_p
    $P0 = pop pmc_arr
    inc $I1
handle_p:
    pop_eh
    is($I1, 0, 'pop pmc from empty RPA throws')

.end

## an Integer Matrix, as used by befunge as a playing field
.sub multikey_access
    .local pmc matrix, row_in, row_out
    matrix = new ['ResizablePMCArray']
    row_in = new ['ResizableIntegerArray']
    push row_in, 42
    push matrix, row_in

    .local int elem
    elem = matrix[0;0]
    is(elem, 42, "int in nested ResizableIntegerArray is 42")

    matrix[0;1] = 43
    elem = matrix[0;1]
    is(elem, 43, "int in nested ResizableIntegerArray is 43")
.end


.sub exists_and_defined
    .local pmc array
    array = new ['ResizablePMCArray']
    push array, 'a'
    push array, 'b'
    push array, 'c'
    $P0 = new ['Null']
    push array, $P0
    push array, 'e'
    $P0 = new ['Undef']
    push array, $P0
    push array, '7'
    push array, '-8.8'

    .local int flag, index, ex, def

    ## bounds checking: lower (0)
    ex = exists array[0]
    is(ex, 1, "element at idx 0 exists")
    def = defined array[0]
    is(def, 1, "element at idx 0 is defined")
    $P0 = new 'Integer', 0
    ex = exists array[$P0]
    is(ex, 1, "element at PMC idx 0 exists")

    ## bounds checking: upper (7)
    ex = exists array[7]
    is(ex, 1, "element at idx 7 exists")
    def = defined array[7]
    is(def, 1, "element at idx 7 is defined")

    ## bounds checking: negative lower (-1)
    ex = exists array[-1]
    is(ex, 1, "element at idx -1 exists")
    def = defined array[-1]
    is(def, 1, "element at idx -1 is defined")

    ## bounds checking: negative upper (-8)
    ex = exists array[-8]
    is(ex, 1, "element at idx -8 exists")
    def = defined array[-8]
    is(def, 1, "element at idx -8 is defined")

    ## bounds checking: out-of-bounds (8)
    ex = exists array[8]
    is(ex, 0, "element at idx 8 does not exist")
    def = defined array[8]
    is(def, 0, "element at idx 8 is not defined")

    ## bounds checking: negative out-of-bounds (-9)
    ex = exists array[-9]
    is(ex, 0, "element at idx -9 does not exist")
    def = defined array[-9]
    is(def, 0, "element at idx -9 is not defined")

    ## null value (3)
    ex = exists array[3]
    is(ex, 0, "element at idx 3 does not exist")
    def = defined array[3]
    is(def, 0, "element at idx 3 is not defined")

    ## undefined value (5)
    ex = exists array[5]
    is(ex, 1, "element at idx 5 does not exist")
    def = defined array[5]
    is(def, 0, "element at idx 5 is not defined")
.end

.sub delete_keyed
    .local pmc array
    array = new ['ResizablePMCArray']
    push array, 'a'
    push array, 'b'
    push array, 'c'
    $P0 = new 'Integer', 1
    delete array[$P0]
    $S0 = array[1]
    is($S0, 'c', 'delete_keyed with PMC key')
.end

.sub get_rep
    .local pmc array
    array = new ['ResizablePMCArray']
    push array, 'a'
    push array, 'b'
    $S0 = get_repr array
    like($S0, '[.*a.*\,.*b.*]', 'get_repr')
.end

.sub append_tests

    $P1 = new ['ResizablePMCArray']
    push $P1, 'a'
    push $P1, 'b'
    push $P1, 'c'

    $P2 = new ['FixedPMCArray']
    $P2 = 2
    $P0 = new ['Null']
    $P2[0] = $P0
    $P2[1] = 'e'
    $P0 = new ['Undef']

    $P3 = new ['ResizablePMCArray']
    push $P3, $P0
    push $P3, '7'
    push $P3, '-8.8'

    $P4 = new ['ResizablePMCArray']

    $P5 = new ['MultiSub']    # extends ResizablePMCArray
    $P99 = new ['Sub']
    push $P5, $P99

    $P4.'append'( $P4 )
    ok( 1, 'parsing' )

    $I1 = $P4
    is( $I1, 0, 'still size 0' )

    $P10 = $P1
    $I1 = $P10
    $P10.'append'( $P4 )
    $I2 = $P10
    is( $I1, $I2, 'append empty ResizablePMCArray' )

    $S1 = $P10[2]
    is( $S1, 'c', 'indexing elements' )

    $P10.'append'( $P2 )
    is( $P10, 5, 'append FixedPMCArray' )

    $S1 = $P10[2]
    is( $S1, 'c', 'indexing elements' )

    $S1 = $P10[4]
    is( $S1, 'e', 'indexing elements' )

    $P3.'append'( $P10 )
    is( $P3, 8, 'append ResizablePMCArray' )

    $S1 = $P3[2]
    is( $S1, '-8.8', 'indexing elements' )

    $S1 = $P3[4]
    is( $S1, 'b', 'indexing elements' )

    $P3.'append'( $P5 )
    is( $P3, 9, 'append subclass' )

    $S1 = $P3[2]
    is( $S1, '-8.8', 'indexing elements' )

    $P99 = $P3[8]
    $I99 = isa $P99, 'Sub'
    ok( $I99, 'indexing elements' )
.end


.sub get_array_string
    .param pmc p
    $S0 = ''
    $P3 = iter p
loop:
    unless $P3 goto loop_end
    $P4 = shift $P3
    $S1 = $P4
    concat $S0, $S1
    goto loop
loop_end:
    .return($S0)
.end


.sub splice_tests
    .local pmc ar1, ar2
    ar1 = new ['ResizablePMCArray']
    ar1[0] = 1
    ar1[1] = 2
    ar1[2] = 3
    ar1[3] = 4
    ar1[4] = 5

    ar2 = new ['ResizablePMCArray']
    ar2[0] = 'A'
    ar2[1] = 'B'
    ar2[2] = 'C'
    ar2[3] = 'D'
    ar2[4] = 'E'

    $P1 = clone ar1
    $P2 = clone ar2
    splice $P1, $P2, 0, 5
    $S0 = get_array_string($P1)
    is($S0, "ABCDE", "splice with complete replace")

    $P1 = clone ar1
    $P2 = clone ar2
    splice $P1, $P2, 5, 0
    $S0 = get_array_string($P1)
    is($S0, "12345ABCDE", "splice, append")

    $P1 = clone ar1
    $P2 = clone ar2
    splice $P1, $P2, 4, 0
    $S0 = get_array_string($P1)
    is($S0, "1234ABCDE5", "splice, insert before last element")

    $P1 = clone ar1
    $P2 = clone ar2
    splice $P1, $P2, 3, 0
    $S0 = get_array_string($P1)
    is($S0, "123ABCDE45", "splice, append-in-middle")

    $P1 = clone ar1
    $P2 = clone ar2
    splice $P1, $P2, 0, 2
    $S0 = get_array_string($P1)
    is($S0, "ABCDE345", "splice, replace at beginning")

    $P1 = clone ar1
    $P2 = clone ar2
    splice $P1, $P2, 2, 2
    $S0 = get_array_string($P1)
    is($S0, "12ABCDE5", "splice, replace in middle")

    $P1 = clone ar1
    $P2 = clone ar2
    splice $P1, $P2, 3, 2
    $S0 = get_array_string($P1)
    is($S0, "123ABCDE", "splice, replace at end")

    $P1 = clone ar1
    $P2 = new ['FixedStringArray']
    $P2 = 5
    $P2[0] = 'A'
    $P2[1] = 'B'
    $P2[2] = 'C'
    $P2[3] = 'D'
    $P2[4] = 'E'
    splice $P1, $P2, 3, 2
    $S0 = get_array_string($P1)
    is($S0, "123ABCDE", "splice, replace with another type")

    $P1 = clone ar1
    $P2 = new ['ResizablePMCArray']
    splice $P1, $P2, 2, 2
    $S0 = get_array_string($P1)
    is($S0, "125", "splice with empty replacement")

    $P1 = clone ar1
    $P2 = new ['ResizablePMCArray']
    $P2[0] = 'A'
    splice $P1, $P2, 2, 1
    $S0 = get_array_string($P1)
    is($S0, "12A45", "splice with empty replacement")

    $P1 = clone ar1
    $P2 = clone ar2
    splice $P1, $P2, -3, 2
    $S0 = get_array_string($P1)
    is($S0, "12ABCDE5", "splice with negative offset")

    $P1 = clone ar1
    $P2 = clone ar2
    $I0 = 1
    push_eh too_low
    splice $P1, $P2, -10, 2
    dec $I0
    goto too_low_end
too_low:
    .get_results($P9)
    finalize $P9
too_low_end:
    ok($I0, "splice with negative offset too low")
.end


.sub splice_replace1
    $P1 = new ['ResizablePMCArray']
    $P1 = 3
    $P1[0] = '1'
    $P1[1] = '2'
    $P1[2] = '3'
    $P2 = new ['ResizablePMCArray']
    $P2 = 1
    $P2[0] = 'A'
    splice $P1, $P2, 1, 2
    $S0 = join "", $P1
    is($S0, "1A", "replacement via splice works")
.end


.sub splice_replace2
    $P1 = new ['ResizablePMCArray']
    $P1 = 3
    $P1[0] = '1'
    $P1[1] = '2'
    $P1[2] = '3'
    $P2 = new ['ResizablePMCArray']
    $P2 = 1
    $P2[0] = 'A'
    splice $P1, $P2, 0, 2
    $S0 = join "", $P1
    is($S0, "A3", "replacement via splice works")
.end


.sub iterate_subclass_of_rpa
    .local pmc arr, it
    $P0 = subclass 'ResizablePMCArray', 'MyArray'

    arr = new ['MyArray']
    push arr, 11
    push arr, 13
    push arr, 15
    $I0 = elements arr
    is($I0, 3, "RPA subclass has correct element count")

    $S1 = ''
    it = iter arr
loop:
    unless it goto end
    $P2 = shift it
    $S0 = $P2
    concat $S1, $S0
    concat $S1, ","
    goto loop
end:
    is($S1, "11,13,15,", "iterator works on RPA subclass")
.end


.sub method_forms_of_unshift_etc
    $P0 = new ['ResizablePMCArray']
    $P0.'unshift'(1)
    $P0.'push'('two')
    $I0 = $P0
    is($I0, 2, "method forms of unshift and push add elements to an RPA")
    $P1 = $P0.'shift'()
    is($P1, 1, "method form of shift works")
    $P1 = $P0.'pop'()
    is($P1, "two", "method form of pop works")
.end


.sub sort_with_broken_cmp
    .local pmc array
    array = new ['ResizablePMCArray']
    push array, 4
    push array, 5
    push array, 3
    push array, 2
    push array, 5
    push array, 1

    $S0 = join ' ', array
    is($S0, "4 5 3 2 5 1", "RPA has expected values")

    $P0 = get_global 'cmp_func'
    array.'sort'($P0)
    ok(1, "sort returns without crashing")
.end

.sub 'cmp_func'
    .param pmc a
    .param pmc b
    $I0 = 1
    .return ($I0)
.end

.sub 'addr_tests'
    $P0 = new 'ResizablePMCArray'
    $I0 = get_addr $P0
    $P1 = new 'ResizablePMCArray'
    $I1 = get_addr $P1

    $I2 = $I0 != 0
    ok($I2, 'ResizablePMCArray address is not zero')
    $I2 = $I0 != $I1
    ok($I2, 'Two empty RPAs do not have same address')

    push $P0, 3
    $I1 = get_addr $P0
    is($I0, $I1, 'Adding element to RPA keeps same addr')
.end

.sub 'equality_tests'
    .local pmc array1, array2, array3, array4
    array1 = new ['ResizablePMCArray']
    array2 = new ['ResizablePMCArray']
    array3 = new ['ResizablePMCArray']

    array1[0] = "Hello Parrot!"
    array1[1] = 1664
    array1[2] = 2.718

    $P0 = box "Hello Parrot!"
    array2[0] = $P0
    $P0 = box 1664
    array2[1] = $P0
    $P0 = box 2.718
    array2[2] = $P0

    array3[0] = "Goodbye Parrot!"
    array3[1] = 1664
    array3[2] = 2.718

    array4 = clone array1

    is(array1, array2, 'Physically disjoint, but equal arrays')
    is(array1, array4, 'Clones are equal')
    isnt(array1, array3, 'Different arrays')
.end

.sub sort_tailcall
    .local pmc array
    array = new 'ResizablePMCArray'
    push array, 4
    push array, 5
    push array, 3
    push array, 2
    push array, 5
    push array, 1

    .local string unsorted
    unsorted = join ' ', array
    is(unsorted,"4 5 3 2 5 1", "unsorted array")

    ## sort using a non-tailcall function
    .const 'Sub' cmp_normal = 'cmp_normal_tailcall'
    $P1 = clone array
    $P1.'sort'(cmp_normal)
    .local string sorted1
    sorted1 = join ' ', $P1
    is (sorted1, "1 2 3 4 5 5", "sorted array, no tailcall")

    ## sort using a tailcall function
    .const 'Sub' cmp_tailcall = 'cmp_tailcall_tailcall'
    $P1 = clone array
    $P1.'sort'(cmp_tailcall)
    .local string sorted2
    sorted2 = join ' ', $P1
    is(sorted2, "1 2 3 4 5 5", "sorted array, with tailcall")
.end

.sub 'cmp_func_tailcall'
    .param pmc a
    .param pmc b
    $I0 = cmp a, b
    .return ($I0)
.end

.sub 'cmp_normal_tailcall'
    .param pmc a
    .param pmc b
    $P0 = 'cmp_func_tailcall'(a, b)
    .return ($P0)
.end

.sub 'cmp_tailcall_tailcall'
    .param pmc a
    .param pmc b
    .tailcall 'cmp_func_tailcall'(a, b)
.end

# Regression test for TT#835
.sub 'push_to_subclasses_array'
    .local pmc cl, array_one
    cl = subclass "ResizablePMCArray", "ExampleArray"
    array_one = new "ExampleArray"

    $I0 = 100000
  loop:
    array_one.'push'($I0)
    dec $I0
    if $I0 goto loop

    ok(1, "Push to subclassed array works")
.end

# don't forget to change the test plan

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
