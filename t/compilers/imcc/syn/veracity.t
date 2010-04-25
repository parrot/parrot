#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

.sub test :main
    .include 'test_more.pir'
    plan(12)

    test_positive_integers()
    test_negative_integers()
    test_positive_zero()
    test_negative_zero()
    test_positive_and_negative_floats()
    test_float_zeros()
    test_float_nan()
.end

.sub test_positive_integers
    $I0 = 1
    unless $I0 goto not_one
    ok(1, "1 is true")
    .return()
  not_one:
    ok(0, "1 is true")
.end

.sub test_negative_integers
    $I0 = -1
    unless $I0 goto not_neg_one
    ok(1, "-1 is true")
    .return()
  not_neg_one:
    ok(0, "-1 is true")
.end

.sub test_positive_zero
    $I0 = 0
    if $I0 goto not_zero
    ok(1, "0 is false")
    .return()
  not_zero:
    ok(0, "0 is false")
.end

.sub test_negative_zero
    $I0 = -0
    if $I0 goto not_neg_zero
    ok(1, "-0 is false")
    .return()
  not_neg_zero:
    ok(0, "-0 is false")
.end

.sub test_positive_and_negative_floats
    $N0 = 1.0
    unless $N0 goto not_one
    ok(1, "1.0 is true")
    goto neg_one
  not_one:
    ok(0, "1.0 is true")
  neg_one:
    $N0 = -1.0
    unless $N0 goto not_neg_one
    ok(1, "-1.0 is true")
    goto pfive
  not_neg_one:
    ok(0, "-1.0 is true")
  pfive:
    $N0 = 0.5
    unless $N0 goto not_pfive
    ok(1, "0.5 is true")
    goto small
  not_pfive:
    ok(0, "0.5 is true")
  small:
    $N0 = 1e-33
    unless $N0 goto not_small
    ok(1, "1e-33 is true")
    .return()
  not_small:
    ok(0, "1e-33 is true")
.end

.sub test_float_zeros
    $N0 = 0.0
    if $N0 goto not_zero
    ok(1, "0.0 is false")
    goto neg_zero
  not_zero:
    ok(0, "0.0 is false")
  neg_zero:
    $N0 = -0.0
    if $N0 goto not_neg_zero
    ok(1, "-0.0 is false")
    .return()
  not_neg_zero:
    ok(0, "-0.0 is false")
.end

.sub test_float_nan
    $N0 = 'NaN'
    is($N0, 'NaN', 'Float NaN')
    unless $N0 goto not_nan
    ok(1, "NaN is true")
    .return()
  not_nan:
    ok(0, "NaN is true")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
