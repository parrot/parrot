#!parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

.sub main :main
    .include 'test_more.pir'
    plan(78)

    test_allocate_1()
    test_spill_1()
    test_pcc_arg_overflow_1()
    test_spill_4()
.end

.sub test_allocate_1
#
# Test the ability of the register allocator to
# generate spills.
#
    $I0 = 0
    $I1 = 1
    $I2 = 2
    $I3 = 3
    $I4 = 4
    $I5 = 5
    $I6 = 6
    $I7 = 7
    $I8 = 8
    $I9 = 9

    $I10 = 10
    $I11 = 11
    $I12 = 12
    $I13 = 13
    $I14 = 14
    $I15 = 15
    $I16 = 16
    $I17 = 17
    $I18 = 18
    $I19 = 19

    $I20 = 20
    $I21 = 21
    $I22 = 22
    $I23 = 23
    $I24 = 24
    $I25 = 25
    $I26 = 26
    $I27 = 27
    $I28 = 28
    $I29 = 29

    $I30 = 30
    $I31 = 31
    $I32 = 32
    $I33 = 33
    $I34 = 34
    $I35 = 35
    $I36 = 36
    $I37 = 37
    $I38 = 38
    $I39 = 39

    $I40 = 40

    is($I0, 0, "allocate 1")
    is($I10, 10, "allocate 1")
    is($I20, 20, "allocate 1")
    is($I30, 30, "allocate 1")
    is($I40, 40, "allocate 1")

.end

.sub test_spill_1
#
# Test the ability of the register allocator to
# generate spills.
#
    $I0 = 0
    $I1 = 1
    $I2 = 2
    $I3 = 3
    $I4 = 4
    $I5 = 5
    $I6 = 6
    $I7 = 7
    $I8 = 8
    $I9 = 9

    $I10 = 10
    $I11 = 11
    $I12 = 12
    $I13 = 13
    $I14 = 14
    $I15 = 15
    $I16 = 16
    $I17 = 17
    $I18 = 18
    $I19 = 19

    $I20 = 20
    $I21 = 21
    $I22 = 22
    $I23 = 23
    $I24 = 24
    $I25 = 25
    $I26 = 26
    $I27 = 27
    $I28 = 28
    $I29 = 29

    $I30 = 30
    $I31 = 31
    $I32 = 32
    $I33 = 33
    $I34 = 34
    $I35 = 35
    $I36 = 36
    $I37 = 37
    $I38 = 38
    $I39 = 39

    $I40 = $I0 + $I1
    $I41 = $I2 + $I3
    $I42 = $I4 + $I5
    $I43 = $I6 + $I7
    $I44 = $I8 + $I9

    $I50 = $I10 + $I11
    $I51 = $I12 + $I13
    $I52 = $I14 + $I15
    $I53 = $I16 + $I17
    $I54 = $I18 + $I19

    $I60 = $I20 + $I21
    $I61 = $I22 + $I23
    $I62 = $I24 + $I25
    $I63 = $I26 + $I27
    $I64 = $I28 + $I29

    $I70 = $I30 + $I31
    $I71 = $I32 + $I33
    $I72 = $I34 + $I35
    $I73 = $I36 + $I37
    $I74 = $I38 + $I39

    is($I0, 0, 'spill 1')
    is($I1, 1, 'spill 1')
    is($I2, 2, 'spill 1')
    is($I3, 3, 'spill 1')
    is($I4, 4, 'spill 1')
    is($I5, 5, 'spill 1')
    is($I6, 6, 'spill 1')
    is($I7, 7, 'spill 1')
    is($I8, 8, 'spill 1')
    is($I9, 9, 'spill 1')
    is($I10, 10, 'spill 1')
    is($I11, 11, 'spill 1')
    is($I12, 12, 'spill 1')
    is($I13, 13, 'spill 1')
    is($I14, 14, 'spill 1')
    is($I15, 15, 'spill 1')
    is($I16, 16, 'spill 1')
    is($I17, 17, 'spill 1')
    is($I18, 18, 'spill 1')
    is($I19, 19, 'spill 1')
    is($I20, 20, 'spill 1')
    is($I21, 21, 'spill 1')
    is($I22, 22, 'spill 1')
    is($I23, 23, 'spill 1')
    is($I24, 24, 'spill 1')
    is($I25, 25, 'spill 1')
    is($I26, 26, 'spill 1')
    is($I27, 27, 'spill 1')
    is($I28, 28, 'spill 1')
    is($I29, 29, 'spill 1')
    is($I30, 30, 'spill 1')
    is($I31, 31, 'spill 1')
    is($I32, 32, 'spill 1')
    is($I33, 33, 'spill 1')
    is($I34, 34, 'spill 1')
    is($I35, 35, 'spill 1')
    is($I36, 36, 'spill 1')
    is($I37, 37, 'spill 1')
    is($I38, 38, 'spill 1')
    is($I39, 39, 'spill 1')
    is($I40, 1, 'spill 1')
    is($I41, 5, 'spill 1')
    is($I42, 9, 'spill 1')
    is($I43, 13, 'spill 1')
    is($I44, 17, 'spill 1')
    is($I50, 21, 'spill 1')
    is($I51, 25, 'spill 1')
    is($I52, 29, 'spill 1')
    is($I53, 33, 'spill 1')
    is($I54, 37, 'spill 1')
    is($I60, 41, 'spill 1')
    is($I61, 45, 'spill 1')
    is($I62, 49, 'spill 1')
    is($I63, 53, 'spill 1')
    is($I64, 57, 'spill 1')
    is($I70, 61, 'spill 1')
    is($I71, 65, 'spill 1')
    is($I72, 69, 'spill 1')
    is($I73, 73, 'spill 1')
    is($I74, 77, 'spill 1')
.end

.sub test_pcc_arg_overflow_1
#
# Test the ability of the register allocator in
# combination with PCC calling convention and overflow arguments.
# Slightly redundant with tests in t/syn/pcc.t but please leave.
#
    _foo(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40)
.end

.sub _foo
    .param int i1
    .param int i2
    .param int i3
    .param int i4
    .param int i5
    .param int i6
    .param int i7
    .param int i8
    .param int i9
    .param int i10
    .param int i11
    .param int i12
    .param int i13
    .param int i14
    .param int i15
    .param int i16
    .param int i17
    .param int i18
    .param int i19
    .param int i20
    .param int i21
    .param int i22
    .param int i23
    .param int i24
    .param int i25
    .param int i26
    .param int i27
    .param int i28
    .param int i29
    .param int i30
    .param int i31
    .param int i32
    .param int i33
    .param int i34
    .param int i35
    .param int i36
    .param int i37
    .param int i38
    .param int i39
    .param int i40
    is(i1, 1, 'pcc arg overflow 1')
    is(i2, 2, 'pcc arg overflow 1')
    is(i3, 3, 'pcc arg overflow 1')
    is(i4, 4, 'pcc arg overflow 1')
    is(i5, 5, 'pcc arg overflow 1')
    is(i10, 10, 'pcc arg overflow 1')
    is(i15, 15, 'pcc arg overflow 1')
    is(i20, 20, 'pcc arg overflow 1')
    is(i25, 25, 'pcc arg overflow 1')
    is(i30, 30, 'pcc arg overflow 1')
    is(i35, 35, 'pcc arg overflow 1')
    is(i40, 40, 'pcc arg overflow 1')
.end

.sub test_spill_4
#
# Another spill test
#
    $I0 = 0
    $I1 = 1
    $I2 = 2
    $I3 = 3
    $I4 = 4
    $I5 = 5
    $I6 = 6
    $I7 = 7
    $I8 = 8
    $I9 = 9

    $I10 = 10
    $I11 = 11
    $I12 = 12
    $I13 = 13
    $I14 = 14
    $I15 = 15
    $I16 = 16
    $I17 = 17
    $I18 = 18
    $I19 = 19

    $I20 = 20
    $I21 = 21
    $I22 = 22
    $I23 = 23
    $I24 = 24
    $I25 = 25
    $I26 = 26
    $I27 = 27
    $I28 = 28
    $I29 = 29

    $I30 = 30
    $I31 = 31
    $I32 = 32
    $I33 = 33
    $I34 = 34
    $I35 = 35
    $I36 = 36
    $I37 = 37
    $I38 = 38
    $I39 = 39

    if $I0 != 0 goto err
    if $I1 != 1 goto err
    if $I2 != 2 goto err
    if $I3 != 3 goto err
    if $I4 != 4 goto err
    if $I5 != 5 goto err
    if $I6 != 6 goto err
    if $I7 != 7 goto err
    if $I8 != 8 goto err
    if $I9 != 9 goto err
    if $I10 != 10 goto err
    if $I11 != 11 goto err
    if $I12 != 12 goto err
    if $I13 != 13 goto err
    if $I14 != 14 goto err
    if $I15 != 15 goto err
    if $I16 != 16 goto err
    if $I17 != 17 goto err
    if $I18 != 18 goto err
    if $I19 != 19 goto err
    if $I20 != 20 goto err
    if $I21 != 21 goto err
    if $I22 != 22 goto err
    if $I23 != 23 goto err
    if $I24 != 24 goto err
    if $I25 != 25 goto err
    if $I26 != 26 goto err
    if $I27 != 27 goto err
    if $I28 != 28 goto err
    if $I29 != 29 goto err
    if $I30 != 30 goto err
    if $I31 != 31 goto err
    if $I32 != 32 goto err
    if $I33 != 33 goto err
    if $I34 != 34 goto err
    if $I35 != 35 goto err
    if $I36 != 36 goto err
    if $I37 != 37 goto err
    if $I38 != 38 goto err
    if $I39 != 39 goto err

    ok(1, 'spill 4')
    .return()
  err:
    ok(0, 'spill 4')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
