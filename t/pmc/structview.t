#!./parrot
# Copyright (C) 2011, Parrot Foundation.

.include 'datatypes.pasm'

.sub 'main' :main
    .include 'test_more.pir'

    plan(16)

    test_bit_struct()
    test_unaligned_struct()
    test_union()
    test_fp()
    test_explicit_sized_types()
    test_struct_pad()
.end

.sub test_bit_struct
    $P0 = new ['FixedIntegerArray'], 10
    $P0[0] = .DATATYPE_STRUCT
    $P0[1] = 8
    $I0 = 2
  loop:
    $P0[$I0] = .DATATYPE_BIT
    inc $I0
    unless $I0 > 9 goto loop

    .local pmc sv
    sv = new ['StructView'], $P0

    $I0 = sv.'size'()
    is($I0, 1, '8 bits in one byte')
    $I0 = sv.'align'()
    is($I0, 1, 'single byte is byte-aligned')
    $I0 = sv.'aligned_size'()
    is($I0, 1, 'byte-aligned single byte is single byte when aligned')

    .local pmc buf
    buf = sv.'alloc'()
    ok(buf, 'allocate an instance')

    $I0 = 1
  loop2:
    sv[buf; $I0] = 1
    $I0 += 2
    unless $I0 > 8 goto loop2

    $P0 = new ['FixedIntegerArray'], 3
    $P0[0] = .DATATYPE_STRUCT
    $P0[1] = 1
    $P0[2] = .DATATYPE_UCHAR

    .local pmc sv2
    sv2 = new ['StructView'], $P0

    $I0 = sv2[buf; 0]
    is($I0, 0xAA, 'bitpattern gives correct byte')
.end

.sub 'test_unaligned_struct'
    $P0 = new ['FixedIntegerArray'], 13
    $P0[0] = .DATATYPE_SIZED # custom layout struct
    $P0[1] = 3
    $P0[2] = 2 # size
    $P0[3] = 1 # alignment
    $P0[4] = .DATATYPE_UINT4
    $P0[5] = 0 # byte-offset
    $P0[6] = 0 # bit-offset
    $P0[7] = .DATATYPE_UCHAR
    $P0[8] = 0
    $P0[9] = 4
    $P0[10] = .DATATYPE_UINT4
    $P0[11] = 1
    $P0[12] = 4

    .local pmc sv, buf
    sv  = new ['StructView'], $P0
    buf = sv.'alloc'()
    sv[buf; 0] = 0xB
    sv[buf; 1] = 0xDA
    sv[buf; 2] = 0xC

    $P0 = new ['FixedIntegerArray'], 4
    $P0[0] = .DATATYPE_STRUCT
    $P0[1] = 2
    $P0[2] = .DATATYPE_UCHAR
    $P0[3] = .DATATYPE_UCHAR

    .local pmc sv2
    sv2 = new ['StructView'], $P0
    $I0 = sv2[buf; 0]
    is($I0, 0xAB, 'unaligned struct first byte')
    $I0 = sv2[buf; 1]
    is($I0, 0xCD, 'unaligned struct second byte')
.end

.sub 'test_union'
    $P0    = new ['FixedIntegerArray'], 4
    $P0[0] = .DATATYPE_UNION
    $P0[1] = 2
    $P0[2] = .DATATYPE_UINT
    $P0[3] = .DATATYPE_UCHAR

    .local pmc sv, buf
    sv  = new ['StructView'], $P0
    buf = sv.'alloc'()

    sv[buf; 0] = 0xFEDC
    $I0 = sv[buf; 1]
    $I1 = $I0 == 0xFE
    $I2 = $I0 == 0xDC
    $I0 = $I1 || $I2
    ok($I0, 'union { short s; char c; }')
.end

.sub 'test_fp'
    $P0 = new ['FixedIntegerArray'], 5
    $P0[0] = .DATATYPE_STRUCT
    $P0[1] = 3
    $P0[2] = .DATATYPE_FLOAT
    $P0[3] = .DATATYPE_DOUBLE
    $P0[4] = .DATATYPE_FLOATVAL

    .local pmc sv, buf
    sv = new ['StructView'], $P0
    buf = sv.'alloc'()

    $N0 = 2.41241
    sv[buf; 0] = $N0
    sv[buf; 1] = $N0
    sv[buf; 2] = $N0

    $N1 = sv[buf; 0]
    $I0 = fp_like($N0, $N1, 0.0001)
    ok($I0, 'float roundtrip')
    $N1 = sv[buf; 1]
    $I0 = fp_like($N0, $N1, 0.000001)
    ok($I0, 'double roundtrip')
    $N1 = sv[buf; 2]
    $I0 = fp_like($N0, $N1, 0.000001)
    ok($I0, 'floatval roundtrip')
.end

.sub 'fp_like'
    .param num n1
    .param num n2
    .param num eps
    $N0 = n1 - n2
    $N0 = abs $N0
    $I0 = eps > $N0
    .return ($I0)
.end

.sub 'test_explicit_sized_types'
    $P0 = new ['FixedPMCArray'], 3
    $P0[0] = .DATATYPE_STRUCT
    $P0[1] = 1
    $P0[2] = .DATATYPE_INT8

    .local pmc sv
    sv = new ['StructView'], $P0
    $I0 = sv.'size'()
    is($I0, 1, 'sizeof (struct { int8 c; })')

    $P0[2] = .DATATYPE_UINT16
    sv = new ['StructView'], $P0
    $I0 = sv.'size'()
    is($I0, 2, 'sizeof (struct { uint16 s; })')

    $P0[2] = .DATATYPE_UINT32
    sv = new ['StructView'], $P0
    $I0 = sv.'size'()
    is($I0, 4, 'sizeof (struct { int32 i; })')
.end

.sub 'test_struct_pad'
    $P0 = new ['FixedIntegerArray'], 5
    $P0[0] = .DATATYPE_STRUCT
    $P0[1] = 3
    $P0[2] = .DATATYPE_INT8
    $P0[3] = .DATATYPE_INT32
    $P0[4] = .DATATYPE_INT8

    .local pmc sv, sv2
    sv = new ['StructView'], $P0

    $P0[1] = 1
    $P0[2] = .DATATYPE_INT8
    sv2 = new ['StructView'], $P0
    $I0 = sv2.'size'()

    $P0[1] = 1
    $P0[2] = .DATATYPE_INT32
    sv2 = new ['StructView'], $P0
    $I1 = sv2.'size'()

    $I0 *= 2
    $I0 += $I1

    $I1 = sv.'size'()

    $I2 = $I1 > $I0
    ok($I2, 'sizeof poorly aligned struct greater than the sum of the sizes')

    $I0 = sv.'aligned_size'()
    $I2 = $I0 > $I1
    ok($I2, 'aligned size of poorly aligned struct greater than size')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
