#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/fixedfloatarray.t - FixedFloatArray PMC

=head1 SYNOPSIS

    % prove t/pmc/fixedfloatarray.t

=head1 DESCRIPTION

Tests C<FixedFloatArray> PMC. Checks size, sets various elements, including
out-of-bounds test. Checks INT and PMC keys.

=cut

.sub main :main
    .include 'fp_equality.pasm'
    .include 'test_more.pir'
    plan(30)

    array_size_tests()
    element_set_tests()
    oob_tests()
    set_and_get_tests()
    clone_tests()
    what_is_truth()
    interface_check()
    get_iter_test()
    test_new_style_init()
    test_invalid_init_tt1509()
.end

.sub array_size_tests
    $P0 = new ['FixedFloatArray']

    set $I0,$P0
    is($I0, 0, "initial size is 0")

    set $P0,1
    $I0 = $P0
    is($I0, 1, "changed size is 1")

    push_eh eh
    set $P0, 666
    pop_eh
    ok(0, "no exception when changing size")
    goto end
eh:
    ok(1, "exception thrown when changing size")
end:
.end


.sub element_set_tests
    $P0 = new ['FixedFloatArray']
    set $P0, 1

    set $P0[0],-7
    set $I0,$P0[0]
    is($I0, -7, "ok")

    set $P0[0],3.7
    set $N0,$P0[0]
    is($N0, 3.7, "ok")

    set $P0[0],"17.2"
    set $S0,$P0[0]
    is($S0, "17.2", "ok")

    $P0 = new ['FixedFloatArray']
    set $P0, 2

    set $P0[1], -7
    set $I0, $P0[1]
    is($I0, -7, "ok")

    set $P0[1], 3.7
    set $N0, $P0[1]
    is($N0, 3.7, "ok")

    set $P0[1],"17.1"
    set $S0, $P0[1]
    is($S0, "17.1")

.end

.sub oob_tests
    $P0 = new ['FixedFloatArray']
    set $P0, 1

    push_eh eh1
    set $P0[1], -7
    pop_eh
    ok(0, "no exception raised when setting nonexistent element")
    goto after_eh1
eh1:
    ok(1, "exception raised when setting nonexistent element")
after_eh1:

    push_eh eh2
    set $I0, $P0[1]
    pop_eh
    ok(0, "no exception raised when getting nonexistent element")
    goto after_eh2
eh2:
    ok(1, "exception raised when getting nonexistent element")
after_eh2:
.end


.sub set_and_get_tests
     $P0 = new ['FixedFloatArray']
     set $P0, 3
     $P1 = new ['Key']

     set $P1, 0
     set $P0[$P1], 25
     set $P1, 1
     set $P0[$P1], 2.5
     set $P1, 2
     set $P0[$P1], "17.32"

     set $I0, $P0[0]
     is($I0, 25, "set int via PMC Key, get via int")

     set $N0, $P0[1]
     .fp_eq($N0, 2.5, ok1)
     ok(0, "set num via PMC Key, get via int")
     goto after_ok1
ok1:
     ok(1, "set num via PMC Key, get via int")
after_ok1:

     set $S0, $P0[2]
     is($S0, "17.32", "set string via PMC Key, get via int")


     $P0 = new ['FixedFloatArray']
     set $P0, 1024

     set $P0[25], 125
     set $P0[128], 10.2
     set $P0[513], "17.3"
     $P1 = new ['Integer']
     set $P1, 123456
     set $P0[1023], $P1

     $P2 = new ['Key']
     set $P2, 25
     set $I0, $P0[$P2]
     is($I0, 125, "set int via int, get via PMC Key")

     set $P2, 128
     set $N0, $P0[$P2]
     .fp_eq($N0, 10.2, ok2)
     ok(0, "set num via int, get via PMC Key")
     goto after_ok2
ok2:
     ok(1, "set num via int, get via PMC Key")
after_ok2:

     set $P2, 513
     set $S0, $P0[$P2]
     is($S0, "17.3", "set string via int, get via PMC Key")

     set $P2, 1023
     set $P3, $P0[$P2]
     set $I1, $P3
     is($I1, 123456, "set PMC via int, get via PMC Key")
.end


.sub clone_tests
     set $I30, 2000
     $P0 = new ['FixedFloatArray']
     $I1 = 0
     clone $P2, $P0
     if $P2 goto L0
     $I1 = 1
L0:  is($I1, 1, "clone of empty is empty")

     set $P0, $I30
     set $I0, 0
L1:  set $N0, $I0
     set $P0[$I0], $N0
     inc $I0
     lt $I0, $I30, L1

     clone $P1, $P0

L2:  dec $I0
     set $N0, $I0
     set $N1, $P0[$I0]
     .fp_ne($N0, $N1, BAD)
     gt $I0, 0, L2
     ok(1, "clone made a good clone")
     goto end

BAD:
     ok(0, "clone made an evil clone")
     say $N0
     say $N1
end:
.end


.sub what_is_truth
    $P0 = new ['FixedFloatArray']
    $I0 = $P0
    is($I0, 0, "an empty FixedFloatArray is false")
    set $P0, 1
    $I0 = $P0
    is($I0, 1, "a non-empty FixedFloatArray is true")
.end


.sub interface_check
    .local pmc p
    p = new ['FixedFloatArray']
    .local int b
    does b, p, "scalar"
    is(b, 0, "FFA does not do scalar")
    does b, p, "array"
    is(b, 1, "FFA does array")
    does b, p, "no_interface"
    is(b, 0, "FFA does not do no_interface")
.end

.sub get_iter_test
    $P0 = new ['FixedFloatArray']
    $P0 = 3
    $P0[0] = 1.1
    $P0[1] = 99.99
    $P0[2] = -345.001
    $P1 = iter $P0
loop:
    unless $P1 goto loop_end
    $S2 = shift $P1
    $S0 = concat $S0, $S2
    $S0 = concat $S0, ","
    goto loop
  loop_end:
    is($S0, "1.1,99.99,-345.001,", "get_iter works")
.end

.sub test_new_style_init
    $P0 = new 'FixedFloatArray', 10

    $I0 = $P0
    is($I0, 10, "New style init creates the correct # of elements")

    $P0 = new ['FixedFloatArray'], 10

    $I0 = $P0
    is($I0, 10, "New style init creates the correct # of elements for a key constant")
.end

.sub test_invalid_init_tt1509
    throws_substring(<<'CODE', 'FixedFloatArray: Cannot set array size to a negative number (-10)', 'New style init does not dump core for negative array lengths')
    .sub main :main
        $P0 = new ['FixedFloatArray'], -10
    .end
CODE

    throws_substring(<<'CODE', 'FixedFloatArray: Cannot set array size to a negative number (-10)', 'New style init (key constant) does not dump core for negative array lengths')
    .sub main :main
        $P0 = new 'FixedFloatArray', -10
    .end
CODE
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
