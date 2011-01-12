#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/fixedstringarray.t - FixedStringArray PMC

=head1 SYNOPSIS

    % prove t/pmc/fixedstringarray.t

=head1 DESCRIPTION

Tests C<FixedStringArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

.sub 'main' :main
    .include 'test_more.pir'
    plan(50)

    test_set_size()
    test_reset_size()
    test_set_first()
    test_set_second()
    test_out_of_bounds()
    test_set_via_pmc()
    test_get_via_pmc()
    test_interface_done()
    test_clone()
    test_clone_unitialized()
    test_truth()
    test_get_iter()
    test_freez_thaw()
    test_get_string()
    test_equality()
    test_gc()
    test_number()
    test_new_style_init()
    test_invalid_init_tt1509()
.end

.sub 'test_set_size'
    $P0 = new ['FixedStringArray']

    $I0 = $P0
    is($I0, 0, "Fresh array has 0 elements")

    $P0 = 42
    $I0 = $P0
    is($I0, 42, "Size was set correctly")
.end

.sub 'test_reset_size'
    $P0 = new ['FixedStringArray']

    $I0 = 1
    $P0 = 1
    push_eh handled
    $P0 = 2
    $I0 = 0
  handled:
    pop_eh

    ok($I0, "Can't resize")
.end


.sub 'test_set_first'
    $P0 = new ['FixedStringArray']
    $P0 = 1

    $P0[0] = -7
    $I0 = $P0[0]
    is($I0, -7, "First element set to integer properly")

    $P0[0] = 3.7
    $N0 = $P0[0]
    is($N0, 3.7, "First element set to number properly")

    $P0[0] = "muwhahaha"
    $S0 = $P0[0]
    is($S0, "muwhahaha", "First element set to string properly")
.end


.sub 'test_set_second'
    $P0 = new ['FixedStringArray']
    $P0 = 2

    $P0[1] = -7
    $I0 = $P0[1]
    is($I0, -7, "Second element set to integer properly")

    $P0[1] = 3.7
    $I0 = $P0[1]
    is($I0, 3, "Second element set to number properly")

    $P0[1] = "purple"
    $S0 = $P0[1]
    is($S0, "purple", "Second element set to string properly")
.end

.sub 'test_out_of_bounds'
    $P0 = new ['FixedStringArray']
    $P0 = 1

    $I0 = 1
    push_eh handle_set
    $P0[2] = 7
    $I0 = 0
  handle_set:
    ok($I0, "Can't set out-of-bounds element")
    pop_eh

    $I0 = 1
    push_eh handle_set_negative
    $P0[-42] = 7
    $I0 = 0
  handle_set_negative:
    ok($I0, "Can't set element on negative index")
    pop_eh

    $I0 = 1
    push_eh handle_get
    $I1 = $P0[2]
    $I0 = 0
  handle_get:
    ok($I0, "Can't get out-of-bounds element")
    pop_eh

    $I0 = 1
    push_eh handle_get_negative
    $I1 = $P0[-1]
    $I0 = 0
  handle_get_negative:
    ok($I0, "Can't get element with negative index")
    pop_eh

.end


# Set via PMC keys, access via INTs
.sub 'test_set_via_pmc'
    $P0 = new ['FixedStringArray']
    $P0 = 3

    $P1 = new ['Key']

    $P1 = 0
    $P0[$P1] = 25
    $S0 = $P0[0]
    is($S0, "25", "Set INTVAL via PMC Key works")

    $P1 = 1
    $P0[$P1] = 2.5
    $S0 = $P0[1]
    is($S0, "2.5", "Set FLOATVAL via PMC Key works")

    $P1 = 2
    $P0[$P1] = "bleep"
    $S0 = $P0[2]
    is($S0, "bleep", "Set STRING via PMC Key works")
.end

# Set via INTs, access via PMC Keys
.sub 'test_get_via_pmc'
    $P0 = new ['FixedStringArray']
    $P0 = 1024

    $P0[25]   = 125
    $P0[128]  = 10.2
    $P0[513]  = "blah"

    $P1 = new ['Integer']
    $P1 = 123456
    $P0[1023] = $P1

    $P2 = new ['Key']

    $P2 = 25
    $I0 = $P0[$P2]
    is($I0, 125, "Get INTVAL via Key works")

    $P2 = 128
    $N0 = $P0[$P2]
    is($N0, 10.2, "Get FLOATVAL via Key works")

    $P2 = 513
    $S0 = $P0[$P2]
    is($S0, "blah", "Get STRING via Key works")

    $P2 = 1023
    $I0 = $P0[$P2]
    is($I0, 123456, "Get INTVAL for stored PMC via Key works")

.end


.sub 'test_interface_done'
    .local pmc pmc1
    pmc1 = new ['FixedStringArray']
    .local int bool1
    does bool1, pmc1, "scalar"
    nok(bool1, "Does not scalar")
    does bool1, pmc1, "array"
    ok(bool1, "Does array")
    does bool1, pmc1, "no_interface"
    nok(bool1, "Does not no_interface")
.end


.sub 'test_clone'
     new $P0, ['FixedStringArray']
     set $P0, 3
     set $P0[0], "abcde"
     set $P0[1], "fghi"
     set $P0[2], "jkl"
     clone $P1, $P0
     set $P0[0], ""
     set $P0[1], ""
     set $P0[2], ""
     set $S0, $P1[0]
     is($S0, "abcde", "First element cloned")
     set $S0, $P1[1]
     is($S0, "fghi", "Second element cloned")
     set $S0, $P1[2]
     is($S0, "jkl", "Third element cloned")
.end

.sub 'test_clone_unitialized'
    $P0 = new ['FixedStringArray']
    $P1 = clone $P0

    $I0 = 0
    push_eh clone_1
    $P0 = 10
    $P1 = 20
    $I0 = 1
  clone_1:
    pop_eh
    ok($I0, "Resize of uninitialized clone successful")

    $I1 = 1
    push_eh clone_2
    $P2 = clone $P0
    $P2 = 30
    $I0 = 0
  clone_2:
    ok($I0, "Resize of initialization not successful")
    pop_eh

.end

.sub 'test_truth'
    $P0 = new ['FixedStringArray']
    nok($P0, "Empty array is false")
    $P0 = 10
    ok($P0, "Non-empty array is true")
.end

.sub 'test_gc'
    $P0 = new ['FixedStringArray']
    $P0 = 8192

    $I0 = 0
  loop:
    $P0[$I0] = $I0
    inc $I0
    sweep 1
    if $I0 < 8192 goto loop

    $S0 = $P0[1000]
    is($S0, "1000", "1000th element survived")
    $S0 = $P0[2000]
    is($S0, "2000", "2000th element survived")
    $S0 = $P0[4000]
    is($S0, "4000", "4000th element survived")
    $S0 = $P0[8000]
    is($S0, "8000", "8000th element survived")
.end

.sub 'test_get_iter'
    $P0 = new ['FixedStringArray']
    $P0 = 3
    $P0[0] = "foo"
    $P0[1] = "bar"
    $P0[2] = "baz"
    $S0 = ""
    $P1 = iter $P0
  loop:
    unless $P1 goto loop_end
    $S2 = shift $P1
    $S0 = concat $S0, $S2
    goto loop
  loop_end:
    is($S0, "foobarbaz", "Iteration works")
.end

.sub 'test_freez_thaw'
    .local pmc fsa, it
    .local string s

    new fsa, ['FixedStringArray']
    fsa = 5
    fsa[0] = 42
    fsa[1] = 43
    fsa[2] = 44
    fsa[3] = 99
    fsa[4] = 101

    s = freeze fsa
    fsa = thaw s

    it = iter fsa
    $S0 = ""
  loop:
    unless it goto loop_end
    s = shift it
    $S0 = concat $S0, s
    goto loop
  loop_end:
    is($S0, "42434499101", "get_iter works")
.end

.sub 'test_get_string'
    $P0 = new ['FixedStringArray']
    $P0 = 2
    $P0[0] = "foo"
    is($P0, '[ "foo", "" ]', "Array stringified properly")
.end

.sub 'test_equality'
    .local pmc a1, a2, other
    .local int i
    .local string s
    a1 = new ['FixedStringArray']
    a2 = new ['FixedStringArray']
    other = new ['Integer']

    is(a1, a2, "Empty arrays are equal")

    i = iseq a1, other
    is(i, 0, "Not equal to other type")

    a1 = 3
    isnt(a1, a2, "Different size arrays aren't equal")

    a2 = 3

    a1[0] = "foo"
    a2[0] = "foo"
    is(a1, a2, "Equal with first element set")

    a1[1] = "bar"
    a2[1] = "BAR"
    isnt(a1, a2, "Not equal when second element differ")

    a2[1] = "bar"
    is(a1, a2, "Equal when second element same")

    null s
    a2[1] = s
    isnt(a1, a2, "Not equal when second element is null")
.end


.sub 'test_number'
    .local pmc fsa
    fsa = new ['FixedStringArray']
    fsa = 3

    $I0 = fsa
    is($I0, 3, "get_integer returns correct size")
    $N0 = fsa
    is($N0, 3.0, "get_number returns correct size")
.end

.sub 'test_new_style_init'
    $P0 = new 'FixedStringArray', 10

    $I0 = $P0
    is($I0, 10, "New style init creates the correct # of elements")

    $P0 = new ['FixedStringArray'], 10

    $I0 = $P0
    is($I0, 10, "New style init creates the correct # of elements for a key constant")
.end

.sub test_invalid_init_tt1509
    throws_substring(<<'CODE', 'FixedStringArray: Cannot set array size to a negative number (-10)', 'New style init does not dump core for negative array lengths')
    .sub main :main
        $P0 = new ['FixedStringArray'], -10
    .end
CODE

    throws_substring(<<'CODE', 'FixedStringArray: Cannot set array size to a negative number (-10)', 'New style init (key constant) does not dump core for negative array lengths')
    .sub main :main
        $P0 = new 'FixedStringArray', -10
    .end
CODE
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
