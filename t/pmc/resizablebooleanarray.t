#!./parrot
# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/resizablebooleanarray.t - testing the ResizableBooleanArray PMC

=head1 SYNOPSIS

    % prove t/pmc/resizablebooleanarray.t

=head1 DESCRIPTION

Tests C<ResizableBooleanArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

.include 'except_types.pasm'
.include 'fp_equality.pasm'

.sub main :main

    .include 'test_more.pir'

    plan(67)

    setting_array_size()
    setting_first_element()
    setting_second_element()
    setting_negatively_indexed_element()
    getting_negatively_indexed_element()
    setting_oob_element()
    getting_oob_element()
    set_via_pmc_keys_access_via_ints()
    set_via_int_access_via_key_pmc()
    interface_check()
    push_integer()
    push_and_pop()
    pop_bounds_check()
    shift_and_unshift()
    shift_bounds_check()
    aerobics()
    direct_access()
    sparse_access()
    check_for_zeroedness()
    pop_into_sparse()
    clone_tests()
    alternate_clone_tests()
    get_iter_test()

.end


.sub setting_array_size

    new $P0, ['ResizableBooleanArray']

    is($P0, 0, "new ResizableBooleanArray is empty")

    $P0 = 1
    is($P0, 1, "int assignment to RBA works")

    $P0 = 5
    is($P0, 5, "another int assignment to RBA works")

    $P0 = 50
    is($P0, 50, "yet another int assignment to RBA works")

    $P0 = 7
    is($P0, 7, "shrinking via int assignment to RBA works")

    new $P1, ['ExceptionHandler']
    set_addr $P1, caught
    $P1.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    push_eh $P1
    $P0 = -1
    ok(0, "no exception caught for setting negative size")
    .return()
caught:
    ok(1, "caught exception on setting negative size")
.end


.sub setting_first_element

    new $P0, ['ResizableBooleanArray']
    $P0 = 1

    $P0[0] = -7
    $I0 = $P0[0]
    is($I0, 1, "negative int -> boolean conversion is ok")

    $P0[0] = 3.7
    $N0 = $P0[0]
    is($N0, 1.0, "float -> boolean conversion is ok")

    $P0[0] = 17
    $I0 = $P0[0]
    is($I0, 1, "positive int -> boolean conversion is ok")

.end

.sub setting_second_element

    new $P0, ['ResizableBooleanArray']
    $P0 = 2

    $P0[1] = -7
    $I0 = $P0[1]
    is($I0, 1, "negative int -> boolean conversion is ok")

    $P0[1] = 3.7
    $N0 = $P0[1]
    is($N0, 1.0, "float -> boolean conversion is ok")

    $P0[1] = 17
    $I0 = $P0[1]
    is($I0, 1, "positive int -> boolean conversion is ok")

.end


.sub setting_negatively_indexed_element
    new $P0, ['ResizableBooleanArray']
    new $P1, ['ExceptionHandler']

    set_addr $P1, caught
    $P1.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    push_eh $P1

    set $P0[-1], 1
    pop_eh

    ok(0, "no exception caught for negative index access")
    goto end

caught:
    ok(1, "caught exception on negative index access")
end:
.end


.sub getting_negatively_indexed_element
    new $P0, ['ResizableBooleanArray']
    set $P0, 1

    set $I0, $P0[-1]
    is($I0, 0, "negative index retrieval is 0")

    new $P1, ['ExceptionHandler']
    set_addr $P1, caught
    $P1.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    push_eh $P1
    set $I0, $P0[-2]
    ok(0, "no exception caught for negative index out of range access")
    .return()
caught:
    pop_eh
    ok(1, "caught exception on negative index out of range access")
.end


.sub setting_oob_element
    new $P0, ['ResizableBooleanArray']

    set $P0[1], -7
    set $I0, $P0[1]
    is($I0, 1, "negative oob assignment is fine")

    $P0[2] = 3.7
    $N0 = $P0[2]
    is($N0, 1.0, "float -> boolean conversion w/ oob assignment is ok")

    $P0[3] = 17
    $I0 = $P0[3]
    is($I0, 1, "positive int -> boolean conversion w/ oob assignment is ok")

.end


.sub getting_oob_element
    new $P0, ['ResizableBooleanArray']
    set $P0, 1

    set $I0, $P0[1]
    ok(1, "setting/getting an oob element worked")
.end


.sub set_via_pmc_keys_access_via_ints
     new $P0, ['ResizableBooleanArray']
     new $P1, ['Key']

     set $P1, 0
     set $P0[$P1], 25

     set $P1, 1
     set $P0[$P1], 2.5

     set $P1, 2
     set $P0[$P1], "17"

     set $I0, $P0[0]
     is($I0, 1, "key set, int get worked")

     set $N0, $P0[1]
     is($N0, 1.0, "key set, num get worked")

     set $S0, $P0[2]
     is($S0, "1", "key set, string get worked")
.end

.sub set_via_int_access_via_key_pmc
     new $P0, ['ResizableBooleanArray']
     set $P0, 1

     set $P0[25], 125
     set $P0[128], 10.2
     set $P0[513], "17"
     new $P1, ['Integer']
     set $P1, 123456
     set $P0[1023], $P1

     new $P2, ['Key']
     set $P2, 25
     set $I0, $P0[$P2]
     is($I0, 1, "int set, key get worked")

     set $P2, 128
     set $N0, $P0[$P2]
     is($N0, 1.0, "int set, key get worked")

     set $P2, 513
     set $S0, $P0[$P2]
     is($S0, "1", "int set key get worked")

     set $P2, 1023
     set $P3, $P0[$P2]
     is($P3, 1, "int set, key get worked")
.end

.sub interface_check
    .local pmc pmc1
    pmc1 = new ['ResizableBooleanArray']
    .local int bool1
    does bool1, pmc1, "scalar"
    is(bool1, 0, "RBA doesn't do 'scalar'")
    does bool1, pmc1, "array"
    is(bool1, 1, "RBA does 'array'")
    does bool1, pmc1, "no_interface"
    is(bool1, 0, "RBA doesn't do 'no_interface'")
.end

.sub push_integer
    .local pmc pmc1
    .local string last
    .local int elements

    pmc1 = new ['ResizableBooleanArray']
    pmc1[9999] = 0
    push pmc1, 10001
    elements = pmc1
    is(elements, 10001, "element count looks good")

    last = pmc1[10000]
    is(last, 1, "last element has the right value")
.end

.sub push_and_pop
    .local int i, i_elem
    .local pmc pmc_arr
    .local int elements

    i = 1
    pmc_arr = new ['ResizableBooleanArray']

    is(pmc_arr, 0, "new RBA doesn't have any elements")

    push pmc_arr, i
    is(pmc_arr, 1, "RBA with 1 element says it has 1 element")

    push pmc_arr, 0
    is(pmc_arr, 2, "RBA with 2 elements says it has 2 elements")

    i_elem = pop pmc_arr
    is(i_elem, 0, "pop popped the right value")
    is(pmc_arr, 1, "RBA has 1 element, as expected")

    i_elem = pop pmc_arr
    is(i_elem, 1, "pop popped the right value again")
    is(pmc_arr, 0, "RBA is now empty, expectedly")

    pmc_arr = 62
    push pmc_arr, 0
    push pmc_arr, 1
    push pmc_arr, 0
    push pmc_arr, 1
    i_elem = pop pmc_arr
    i_elem = pop pmc_arr
    i_elem = pop pmc_arr
    is(i_elem, 1, "pop popped the right thing again")
    is(pmc_arr, 63, "RBA has expected size")
.end


.sub pop_bounds_check
    $P0 = new ['ResizableBooleanArray']
    $P1 = new ['ExceptionHandler']

    set_addr $P1, caught
    $P1.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    push_eh $P1
    pop $I0, $P0
    pop_eh
    ok(0, "failed to catch an oob exception")
    goto end
caught:
    ok(1, "caught an oob exception")
end:
.end


.sub shift_and_unshift
    .local int i, i_elem
    .local pmc pmc_arr
    .local int elements

    i = 1
    pmc_arr = new ['ResizableBooleanArray']

    # No elements are set
    is(pmc_arr, "", "stringification looks ok")

    # Set two of the first three elements
    pmc_arr[0] = 1
    pmc_arr[2] = 1
    is(pmc_arr, "101", "stringification w/ 3 elems is good")

    # Unshift a "1"  element on
    unshift pmc_arr, i
    is(pmc_arr, "1101", "still ok")

    # Unshift a "0"  element on
    unshift pmc_arr, 0
    is(pmc_arr, "01101", "still ok")

    # Shift an element off
    i_elem = shift pmc_arr
    is(i_elem, 0, "shift shifted a 0")
    is(pmc_arr, "1101", "stringification ok")

    # Shift an element off
    i_elem = shift pmc_arr
    is(i_elem, 1, "shift shifted a 1")
    is(pmc_arr, "101", "stringification ok")

    # Resize the array
    pmc_arr = 25
    is(pmc_arr, "1010000000000000000000000", "long stringification is correct")

    # Unshift 4 elements on
    unshift pmc_arr, 1
    unshift pmc_arr, 1
    unshift pmc_arr, 0
    unshift pmc_arr, 1
    is(pmc_arr, "10111010000000000000000000000", "longer stringification is ok")

    # Shift 3 elements off
    i_elem = shift pmc_arr
    i_elem = shift pmc_arr
    i_elem = shift pmc_arr
    is(i_elem, 1, "shift shifted the right thing")
    is(pmc_arr, "11010000000000000000000000", "stringification is still ok")

    # Set same size array is currently
    pmc_arr = 26
    is(pmc_arr, "11010000000000000000000000", "noop size change did nothing")

    # Set 101th element
    pmc_arr[100] = 1
    is(pmc_arr, 101, "setting pmc_arr[100] changed size to 101")

    # Shift off 99 elements
    .local int counter
    counter = 98
shift_loop:
    i_elem = shift pmc_arr
    dec counter
    if counter > 0 goto shift_loop

    is(i_elem, 0, "all peachy")
    is(pmc_arr, "001", "all's well that ends well")
.end


.sub shift_bounds_check
    $P0 = new ['ResizableBooleanArray']
    $P1 = new ['ExceptionHandler']

    set_addr $P1, caught
    $P1.'handle_types'(.EXCEPTION_OUT_OF_BOUNDS)
    push_eh $P1

    shift $I0, $P0
    ok(0, "no OOB exception thrown")
    goto end

caught:
    ok(1, "OOB exception thrown and caught")

end:
.end

.sub aerobics
    .local pmc jmpstack
    jmpstack = new 'ResizableIntegerArray'
    new $P0, ['ResizableBooleanArray']
    set $I10, 10000

    set $I1, 0
    set $I0, 0
  buildup:
    ge $I0, $I10, postBuildUp

    mod $I4, $I1, 2
    push $P0, $I4
    add $I1, 1    # Push $P0, mod $I1++, 2
    mod $I4, $I1, 2
    push $P0, $I4
    add $I1, 1    # Push $P0, mod $I1++, 2
    mod $I4, $I1, 2
    push $P0, $I4
    add $I1, 1    # Push $P0, mod $I1++, 2

    pop $I2, $P0
    mul $I3, $I0, 3
    add $I3, 2
    mod $I3, 2
    ne $I2, $I3, errFirstPop  # fail if pop != mod $I0 * 3 + 2, 2

    pop $I2, $P0
    mul $I3, $I0, 3
    add $I3, 1
    mod $I3, 2
    ne $I2, $I3, errSecondPop  # fail if pop != mod $I0 * 3 + 1, 2

    set $I2, $P0
    add $I3, $I0, 1
    ne $I2, $I3, errBuildLen   # fail if length != $I0 + 1

    add $I0, 1
    branch buildup
  postBuildUp:

    set $I0, 0
  checkBuildUpLeft:
    ge $I0, $I10, postCheckBuildUpLeft
    set $I2, $P0[$I0]
    mul $I3, $I0, 3
    mod $I3, 2
    ne $I2, $I3, errLeftGet
    add $I0, 1
    branch checkBuildUpLeft
  postCheckBuildUpLeft:

    mul $I0, $I10, -1
  checkBuildUpRight:
    ge $I0, 0, postCheckBuildUpRight
    set $I2, $P0[$I0]
    add $I3, $I0, $I10
    mul $I3, 3
    mod $I3, 2
    ne $I2, $I3, errRightGet
    add $I0, 1
    branch checkBuildUpRight
  postCheckBuildUpRight:

    set $I0, $I10
  tearDown:
    le $I0, 0, postTearDown
    pop $I2, $P0
    sub $I3, $I0, 1
    mod $I3, 2
    ne $I2, $I3, errTearDown

    sub $I0, 1
    branch tearDown
  postTearDown:

    ok(1, "aerobics completed successfully")
    .return()
  errFirstPop:
    print "FAILED: first pop\n"
    local_branch jmpstack, info
    .return()
  errSecondPop:
    print "FAILED: second pop\n"
    local_branch jmpstack, info
    .return()
  errBuildLen:
    print "FAILED: buildup length\n"
    local_branch jmpstack, info
    .return()
  errLeftGet:
    print "FAILED: left get\n"
    local_branch jmpstack, info
    .return()
  errRightGet:
    print "FAILED: right get\n"
    local_branch jmpstack, info
    .return()
  errTearDown:
    print "FAILED: tear down cap\n"
    local_branch jmpstack, info
    .return()
  info:
    ok(0, "aerobics goof:")
    print "#Found: "
    print $I2
    print "\n#Wanted: "
    print $I3
    print "\n"
    local_return jmpstack
.end


.sub direct_access
    new $P0, ['ResizableBooleanArray']
    set $I10, 550000
    set $I0, 1
lp1:
    add $I1, $I0, 5
    mod $I2, $I1, 2
    set $P0[$I0], $I2
    add $I3, $I1, $I0
    mod $I2, $I3, 2
    push $P0, $I2
    shl $I0, $I0, 1
    inc $I0
    le $I0, $I10, lp1

    set $I0, 1
lp2:
    add $I1, $I0, 5
    mod $I5, $I1, 2
    # check at $I0
    set $I2, $P0[$I0]
    ne $I2, $I5, err
    add $I4, $I0, 1
    # and pushed value at $I0+1
    set $I4, $P0[$I4]
    add $I3, $I1, $I0
    mod $I5, $I3, 2
    ne $I5, $I4, err

    shl $I0, $I0, 1
    inc $I0
    le $I0, $I10, lp2
    ok(1, "direct access check passed")
    .return()
err:
    print "not ok "
    print $I0
    print " "
    print $I1
    print " "
    print $I2
    print " "
    print $I3
    print " "
    print $I4
    print " "
    print $I5
    print " "
    print $I6
    print " "
    print $I7
    print "\n"

.end


.sub sparse_access
    new $P0, ['ResizableBooleanArray']
    set $I10, 110000
    set $I0, 1
  lp1:
    add $I1, $I0, 5
    mod $I9, $I1, 2
    set $P0[$I0], $I9
    add $I3, $I1, $I0
    mod $I9, $I3, 2
    push $P0, $I9
    shl $I0, $I0, 1
    inc $I0
    le $I0, $I10, lp1

    set $I0, 1
  lp2:
    add $I1, $I0, 5
    mod $I9, $I1, 2
    # check at $I0
    set $I2, $P0[$I0]
    ne $I2, $I9, err
    add $I4, $I0, 1
    # and pushed value at $I0+1
    set $I4, $P0[$I4]
    add $I3, $I1, $I0
    mod $I9, $I3, 2
    ne $I9, $I4, err

    shl $I0, $I0, 1
    inc $I0
    le $I0, $I10, lp2
    ok(1, "sparse access tests ok")

    # now repeat and fill some holes

    set $I0, 777
  lp3:
    add $I1, $I0, 5
    mod $I9, $I1, 2
    set $P0[$I0], $I9
    add $I0, $I0, 666
    le $I0, $I10, lp3

    set $I0, 777
  lp4:
    add $I1, $I0, 5
    mod $I9, $I1, 2
    # check at $I0
    set $I2, $P0[$I0]
    ne $I2, $I9, err

    add $I0, $I0, 666
    le $I0, $I10, lp4
    ok(1, "sparse access tests still ok")
    .return()
  err:
    print "not ok "
    print $I0
    print " "
    print $I1
    print " "
    print $I2
    print " "
    print $I3
    print " "
    print $I4
    print "\n"

.end


.sub check_for_zeroedness
    new $P0, ['ResizableBooleanArray']
    set $I0, 0
lp1:
    push $P0, 0
    inc $I0
    lt $I0, 100, lp1

    set $I2, 10000
    set $P0, $I2
lp2:
    set $I1, $P0[$I0]
    ne $I1, 0, err
    inc $I0
    lt $I0, $I2, lp2
    ok(1, "zeroedness tests passed")
    .return()
err:
    ok(0, "zeroedness tests failed")
    print "#Found non-zero value "
    print $I1
    print " at "
    say $I0
.end


.sub pop_into_sparse
    new $P0, ['ResizableBooleanArray']
    set $I10, 100
    set $I0, 0
    # push some values at start
loop1:
    mod $I5, $I0, 2
    push $P0, $I5
    inc $I0
    lt $I0, $I10, loop1

    # create sparse
    set $I0, 100000
    set $I1, 1000
    mod $I5, $I1, 2
    #set $P0[$I0], $I1
    set $P0[$I0], $I5
    inc $I1
loop2:
    # push some values after hole
    mod $I5, $I1, 2
    push $P0, $I5
    inc $I1
    le $I1, 1100, loop2
    dec $I1

    set $I3, $P0
lp3:
    set $I4, $P0
    ne $I3, $I4, err1
    pop $I2, $P0
    dec $I3
    mod $I5, $I1, 2
    ne $I2, $I5, err2
    gt $I3, $I0, cont1
    lt $I3, $I10, cont1
    set $I1, 0

    gt $I3, $I10, lp3
    set $I1, $I10

cont1:
    dec $I1
    eq $I1, 0, ok
    branch lp3
ok:
    ok(1, "pop into sparse tests passed")
    .return()
    err1:   set $S0, "len"
    branch err
err2:
    set $S0, "val"
err:
    ok(0, "pop into sparse tests failed")
    print "#nok "
    print $S0
    print " "
    print $I0
    print " "
    print $I1
    print " "
    print $I2
    print " "
    print $I3
    print " "
    print $I4
    print " "
    print $I5
.end

.sub clone_tests
    .local pmc rba1, rba2
    .local int i, failed
    failed = 0
    rba1 = new ['ResizableBooleanArray']

    rba1[0]    = 1
    rba1[5000] = 1

    rba2 = clone rba1

    i = rba1[5000]
    if i == 1 goto ok_0
    failed = 1

ok_0:
    i = pop rba1
    if i == 1 goto ok_1
    failed = 2

ok_1:
    i = rba1
    if i == 5000 goto ok_2
    failed = 3

ok_2:
    i = pop rba2
    if i == 1 goto ok_3
    failed = 4

ok_3:
    i = rba2
    if i == 5000 goto ok_4
    failed = 5

ok_4:
    i = rba2[5000] #should be undefined, i.e. 0
    if i == 0 goto ok_5
    failed = 6

ok_5:
    i = pop rba2 #same as previous
    if i == 0 goto ok_6
    failed = 7
    $S0 = rba2
    say $S0

ok_6:
    is(failed, 0, "all clone tests passed")
.end

.sub alternate_clone_tests
    .local pmc rba1, rba2
    .local int i, failed
    failed = 0
    rba1 = new ['ResizableBooleanArray']

    rba1[0]    = 1
    rba1[4]    = 1
    rba1[5004] = 1
    i = shift rba1
    i = shift rba1
    i = shift rba1
    i = shift rba1

    rba2 = clone rba1

    i = rba1[5000]
    if i == 1 goto ok_0
    failed = 1

ok_0:
    i = pop rba1
    if i == 1 goto ok_1
    failed = 2

ok_1:
    i = rba1
    if i == 5000 goto ok_2
    failed = 3

ok_2:
    i = pop rba2
    if i == 1 goto ok_3
    failed = 4

ok_3:
    i = rba2
    if i == 5000 goto ok_4
    failed = 5

ok_4:
    i = rba2[5000] #should be undefined, i.e. 0
    if i == 0 goto ok_5
    failed = 6

ok_5:
    i = pop rba2 #same as previous
    if i == 0 goto ok_6
    failed = 7

ok_6:
    is(failed, 0, "all alternate clone tests passed")
.end

.sub get_iter_test
    $P0 = new ['ResizableBooleanArray']
    $P0 = 3
    $P0[0] = 1
    $P0[1] = 0
    $P0[2] = 1
    $P1 = iter $P0
loop:
    unless $P1 goto loop_end
    $S2 = shift $P1
    $S0 = concat $S0, $S2
    goto loop
  loop_end:
    is($S0, "101", "get_iter works")
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
