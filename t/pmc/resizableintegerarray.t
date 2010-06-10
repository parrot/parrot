#!./parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/resizableintegerarray.t - Tests for the ResizableIntegerArray PMC

=head1 SYNOPSIS

    % prove t/pmc/resizableintegerarray.t

=head1 DESCRIPTION

This tests the C<ResizableIntegerArray> PMC. It checks size, sets various
elements, including out-of-bounds test as well as INT and PMC keys.

=cut

=for notes

Coverage plan:

 * Get & Set Size

 * Get & Set Element
     * Type of value (int, num, string, pmc)
     * Type of index (int, pmc)
     * index negative/in-range/beyond-end
     * Set doesn't clobber other elements
     * Delete

 * Push/Unshift, Pop/Shift
     * Correct values
     * Correct sequence
     * Correctly resized

 * Iterator
     * Doesn't change array size
     * Multiple concurrent iterators don't interfere

=cut

.sub main :main
    .include 'test_more.pir'
    plan(47)

    test_does_interfaces()

    test_get_size()
    test_resize()
    test_distinct_storage()

    test_cant_set_negative()
    test_cant_get_negative()
    test_set_beyond_end()
    test_get_beyond_end()
    test_delete()

    test_conversion()
    test_conversion_overflow()

    test_set_pmc_index()
    test_get_pmc_index()

    test_push()
    test_pop()
    test_pop_many()
    test_push_many()
    test_push_pop()
    test_cant_pop_empty()
    test_shift()
    test_unshift()
    test_cant_shift_empty()
    test_iterator()
    test_clone()
    test_freeze()
.end

.sub test_does_interfaces
    $P0 = new ['ResizableIntegerArray']
    ok( 1, 'Instantiated ResizableIntegerArray PMC' )
    $I0 = does $P0, 'array'
    ok( $I0, 'Interface does "array"' )
    $I0 = does $P0, 'scalar'
    is( $I0, 0, 'Interface does not do "scalar"' )
    $I0 = does $P0, 'no_interface'
    is( $I0, 0, 'Interface does not do "no_interface"' )
.end

.sub test_get_size
    $P0 = new ['ResizableIntegerArray']
    $I0 = $P0
    is( $I0, 0, 'Initial array size is 0' )
    $I1 = elements $P0
    is( $I0, $I1, '... and "elements" opcode agrees' )
.end

.sub test_resize
    $P0 = new ['ResizableIntegerArray']
    $I1 = 0

    $P0 = 1
    $I0 = $P0
    ne $I0, 1, X1
    inc $I1

    $P0 = 9
    $I0 = $P0
    ne $I0, 9, X1
    inc $I1

    $P0 = 5
    $I0 = $P0
    ne $I0, 5, X1
    inc $I1

    $P0 = 99999
    $I0 = $P0
    ne $I0, 99999, X1
    inc $I1

    $P0 = 0
    $I0 = $P0
    ne $I0, 0, X1
    inc $I1

    $P0 = 77
    $I0 = $P0
    ne $I0, 77, X1
    inc $I1

X1:
    is( $I1, 6, 'Setting array size (four different values, including 0)' )

    $I2 = elements $P0
    is( $I0, $I2, '... and "elements" opcode still agrees' )

    push_eh E
    $I1 = 1
    $P0 = -4
    $I1 = 0
E:
    pop_eh
    ok( $I1, 'Setting negative size should throw an exception' )
.end

.sub test_distinct_storage
    # Walk the array in pseudo-random order
    # Pick a sample size $I4 and another number $I2, such that
    ############################################################
    ##### Plase rewrite this with ascii chars, it got unreadable
    ##### by editing with mixed charsets.
    #  n: n > 0  $I2  % $I4 = 1  n % $I4 = 0
    ############################################################
    $I4 = 17
    $I2 = 3
    # Create and fill array in random order
    $P0 = new ['ResizableIntegerArray']
    $P0 = $I4
#   say '\n ... checking that pseudo-random sequence is exhaustive ...'
    $I0 = 1
L1:
#   say $I0
    $I0 = mul $I0, $I2
    $I0 = mod $I0, $I4
    $P0[$I0] = $I0
    gt $I0, 1, L1
    $P0[0] = 0
#   say 0
    # Read back array and check values match
    $I0 = 0
L2:
    $I1 = $P0[$I0]
    ne $I1, $I0, X1
    inc $I0
    lt $I0, $I4, L2
X1:
    is( $I0, $I4, 'All array elements stored separately' )
.end

.sub test_cant_set_negative
    $P0 = new ['ResizableIntegerArray']
    $P0 = 1
    $I0 = 1
    push_eh eh
    $P0[-1] = -7
    $I0 = 0
eh:
    pop_eh
    ok( $I0, 'Setting with negative index should throw an exception' )
.end

.sub test_cant_get_negative
    $P0 = new ['ResizableIntegerArray']
    $P0 = 1
    $I0 = 1
    push_eh eh
    $I0 = $P0[-1]
    $I0 = 0
eh:
    pop_eh
    ok( $I0, 'Getting with negative index should throw an exception' )
.end

.sub test_set_beyond_end
    $P0 = new ['ResizableIntegerArray']
    $P0 = 1
    $I0 = 0
    push_eh eh
    $P0[1] = -7
    $I0 = 1
eh:
    pop_eh
    ok( $I0, 'Setting with too-big index should not throw an exception' )

    $I0 = $P0
    is( $I0, 2, '... and should extend array' )
.end

.sub test_get_beyond_end
    $P0 = new ['ResizableIntegerArray']
    $P0 = 1
    $I0 = 1
    push_eh eh
    $I1 = $P0[1]
    $I0 = 1
eh:
    pop_eh
    ok( $I0, 'Getting with too-big index should not throw an exception' )
    is( $I1, 0, '... and result should be 0' )

    $I0 = $P0
    is( $I0, 1, '... and should not extend array' )
.end

.sub test_delete
    $P0 = new ['ResizableIntegerArray'], 3
    $P0[0] = 9
    $P0[1] = 8
    $P0[2] = 7
    delete $P0[1]
    $I0 = elements $P0
    is( $I0, 2, 'delete one element dec size')
    $I0 = $P0[1]
    is( $I0, 7, 'deleted move back the remaining part')
    push_eh caught
    delete $P0[2]
    pop_eh
    ok(0, 'delete ouf of bound should throw')
    goto end
caught:
    pop_eh
    ok(1, 'delete ouf of bound throws')
end:
.end

.sub test_conversion
    $P0 = new ['ResizableIntegerArray']
    $P0 = 6
    $P0[0] = -7
    $P0[1] = 3.7
    $P0[2] = '17'
    $P1 = new ['Integer']
    $P1 = 123456
    $P0[3] = $P1
    $P2 = new ['Float']
    $P2 = 7.3
    $P0[4] = $P2
    $P3 = new ['String']
    $P3 = '987654321'
    $P0[5] = $P3
    $I0 = $P0[0]
    is( $I0, -7, 'Setting element to integer' )
    $N0 = $P0[1]
    is( $N0, 3.0, 'Setting element to float (gets truncated)' )
    $S0 = $P0[2]
    is( $S0, '17', 'Setting element to string (gets converted to int and back)' )
    $I0 = $P0[3]
    is( $I0, 123456, 'Setting element to boxed integer' )
    $N0 = $P0[4]
    is( $N0, 7.0, 'Setting element to boxed float (gets truncated)' )
    $S0 = $P0[5]
    is( $S0, '987654321', 'Setting element to boxed string (gets converted to int and back)' )
.end

.sub test_conversion_overflow
    $P0 = new ['ResizableIntegerArray']
    $P0 = 1

    $S0 = '12345678901234567890123456789012345678901234567890123456789012345678901234567890'

    push_eh eh0
    $I1 = 1
        $P0[0] = $S0
        $I0 = $P0[0]
    $I1 = 0
eh0:
    pop_eh
    ok( $I1, 'Throw exception when setting element to too-large digit-string' )

.end

.sub test_set_pmc_index
    $P0 = new ['ResizableIntegerArray']
    $P1 = new ['Key']
    $P1 = 0
    $P0[$P1] = 25
    $P1 = 1
    $P0[$P1] = 2.5
    $P1 = 2
    $P0[$P1] = '17'

    $I1 = 0

    $I0 = $P0[0]
    ne $I0, 25, X1
    inc $I1

    $N0 = $P0[1]
    ne $N0, 2.0, X1
    inc $I1

    $S0 = $P0[2]
    ne $S0, '17', X1
    inc $I1
X1:
    is( $I1, 3, 'Setting via PMC key (3 different types)' )
.end

.sub test_get_pmc_index
    $P0 = new ['ResizableIntegerArray']
    $P0 = 1
    $P0[25] = 125
    $P0[128] = 10.2
    $P0[513] = '17'
    $P0[1023] = 123456

    $I1 = 0

    $P2 = new ['Key']

    $P2 = 25
    $I0 = $P0[$P2]
    ne $I0, 125, X1
    inc $I1

    $P2 = 128
    $N0 = $P0[$P2]
    ne $N0, 10.0, X1
    inc $I1

    $P2 = 513
    $S0 = $P0[$P2]
    ne $S0, '17', X1
    inc $I1

    $P2 = 1023
    $I2 = $P0[$P2]
    ne $I2, 123456, X1
    inc $I1
X1:
    is( $I1, 4, 'Getting via PMC key (4 different types)' )
.end

.sub test_push
    $P0 = new ['ResizableIntegerArray']
    $P0[9999] = 0
    push $P0, 12345
    $I0 = $P0
    is( $I0, 10001, 'Push increases number of elements by one' )
    $I0 = $P0[10000]
    is( $I0, 12345, '... and stores correct value' )
.end

.sub test_pop
    $P0 = new ['ResizableIntegerArray']
    $P0[0] = 4
    $P0[1] = 8
    $P0[2] = 16
    $I0 = $P0
    $I0 = pop $P0
    is( $I0, 16, 'Pop retrieves correct value' )
    $I0 = $P0
    is( $I0, 2, '... and reduces number of elements by one' )
.end

.sub test_pop_many
    $P0 = new ['ResizableIntegerArray']
    $I0 = 0
l1:
    $P0[$I0] = $I0
    inc $I0
    lt $I0, 100000, l1
l2:
    le $I0, 0, e2
    dec $I0
    $I1 = pop $P0
    eq $I0, $I1, l2
e2:
    is( $I0, $I1, 'Pop many times retrieves correct values' )
    $I0 = $P0
    is( $I0, 0, '... and leaves array empty' )
.end

.sub test_push_many
    $P0 = new ['ResizableIntegerArray']
    $I0 = 0
l1:
    push $P0, $I0
    inc $I0
    lt $I0, 100000, l1
    $I1 = $P0
    is( $I1, 100000, 'Push many values fills array to correct size' )
l2:
    le $I0, 0, e2
    dec $I0
    $I1 = $P0[$I0]
    eq $I0, $I1, l2
e2:
    is( $I0, $I1, '... and stores correct values')
.end

.sub test_push_pop
    $P0 = new ['ResizableIntegerArray']
    $I1 = 0

    push $P0, 2
    $I0 = $P0
    ne $I0, 1, X1
    inc $I1

    push $P0, 4
    $I0 = $P0
    ne $I0, 2, X1
    inc $I1

    push $P0, 6
    $I0 = $P0
    ne $I0, 3, X1
    inc $I1

    $I0 = pop $P0
    ne $I0, 6, X1
    inc $I1

    $I0 = $P0
    ne $I0, 2, X1
    inc $I1

    $I0 = pop $P0
    ne $I0, 4, X1
    inc $I1

    $I0 = $P0
    ne $I0, 1, X1
    inc $I1

    $I0 = pop $P0
    ne $I0, 2, X1
    inc $I1

    $I0 = $P0
    ne $I0, 0, X1
    inc $I1

X1:
    is( $I1, 9, 'Push-then-Pop retrieves values in reverse order' )
.end

.sub test_cant_pop_empty
    $P0 = new ['ResizableIntegerArray']
    $I0 = 1
    push_eh eh
    $I0 = pop $P0
    $I0 = 0
eh:
    pop_eh
    ok( $I0, 'Pop from empty array should throw an exception' )
.end

# .sub test_cant_pop_empty
# #   test_pass( 'pop from empty array should throw exception' )
#     throws_like( <<'CODE', 'Can\'t pop from an empty array!', 'pop from empty array should throw exception' )
# .sub main
#     $P0 = new ['ResizableIntegerArray']
#     $I0 = pop $P0
# .end
# CODE
# #   test_test( 'pop from empty array should throw exception' )
# .end

.sub test_shift
    $P0 = new ['ResizableIntegerArray']
    $P0[0] = 10
    $P0[1] = 20

    $I1 = 0

    $I0 = $P0
    ne $I0, 2, X1
    inc $I1

    $I0 = shift $P0
    ne $I0, 10, X1
    inc $I1

    $I0 = $P0
    ne $I0, 1, X1
    inc $I1

    $I0 = shift $P0
    ne $I0, 20, X1
    inc $I1

X1:
    is( $I1, 4, 'Shift returns values in correct order' )

    $I0 = $P0
    is( $I0, 0, '... and removes correct number of elements' )
.end

.sub test_unshift
    $P0 = new ['ResizableIntegerArray']
    unshift $P0, 10
    unshift $P0, 20

    $I0 = $P0
    is( $I0, 2, 'Unshift adds correct number of elements' )

    $I1 = 0

    $I0 = $P0[0]
    ne $I0, 20, X1
    inc $I1
    $I0 = $P0[1]
    ne $I0, 10, X1
    inc $I1

X1:
    is( $I1, 2, '... and stores values in correct order' )
.end

.sub test_cant_shift_empty
    $P0 = new ['ResizableIntegerArray']
    $I0 = 1
    push_eh eh
    $I0 = shift $P0
    $I0 = 0
eh:
    pop_eh
    ok( $I0, 'Shift from empty array should throw an exception' )
.end

.sub test_iterator
    $P0 = new ['ResizableIntegerArray']
    push_eh k0
    $P0[0] = 42
    $P0[1] = 43
    $P0[2] = 44
    push $P0, 999
    $I0 = 0
    $P1 = iter $P0
    $I2 = shift $P1
    inc $I0
    eq $I2, 42, k3
    dec $I0
    say 'Missing 42'
k3:
    $I2 = shift $P1
    inc $I0
    eq $I2, 43, k2
    dec $I0
    say 'Missing 43'
k2:
    $I2 = shift $P1
    inc $I0
    eq $I2, 44, k1
    dec $I0
    say 'Missing 44'
k1:
    $I2 = shift $P1
    inc $I0
    eq $I2, 999, k0
    dec $I0
    say 'Missing 999'
k0:
    pop_eh
    is( $I0, 4, 'get_iter: iterator returns all values in correct sequence' )
.end

.sub test_clone
    $P0 = new ['ResizableIntegerArray']
    push $P0, 1
    $P1 = clone $P0
    $I0 = iseq $P0, $P1
    is( $I0, 1, 'cloned is equal to original')
.end

.sub test_freeze
    .local pmc ria, th
    .local string s
    ria = new ['ResizableIntegerArray']
    push ria, 1
    push ria, 0x1FFFF
    s = freeze ria
    th = thaw s
    is( ria, th, 'freeze/thaw copy is equal to original' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
