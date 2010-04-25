#!./parrot
# Copyright (C) 2001-2005, Parrot Foundation.
# $Id$

=head1 NAME

t/op/ifunless.t - If/Unless

=head1 SYNOPSIS

        % prove t/op/ifunless.t

=head1 DESCRIPTION

Tests the conditional C<if> and C<unless> operations.

=cut

.const int TESTS = 14

.sub 'test' :main
    .include 'test_more.pir'

    plan(TESTS)

    if_i_ic_positive()
    if_i_ic_negative()
    if_i_ic_zero()
    if_n_ic_positive()
    if_n_ic_negative()
    if_n_ic_zero()
    if_s_ic_helloworld()
    if_s_ic_empty()

    unless_i_ic_zero()
    unless_i_ic_negative()
    unless_n_ic_zero()
    unless_n_ic_negative()
    unless_s_ic_empty()
    unless_s_ic_helloworld()

.end

.sub 'if_i_ic_positive'
    $I0 = 2147483647

    $I1 = 0
    if $I0 goto if_i_ic_positive_ok
    goto if_i_ic_positive_end

  if_i_ic_positive_ok:
    $I1 = 1
  if_i_ic_positive_end:
    ok($I1, "if_i_ic with a positive integer")
.end

.sub 'if_i_ic_negative'
    $I0 = -2147483647

    $I1 = 0
    if $I0 goto if_i_ic_negative_ok
    goto if_i_ic_negative_end

  if_i_ic_negative_ok:
    $I1 = 1
  if_i_ic_negative_end:
    ok($I1, "if_i_ic with a negative integer")
.end

.sub 'if_i_ic_zero'
    $I0 = 0

    $I1 = 0
    if $I0 goto if_i_ic_zero_end
    $I1 = 1

  if_i_ic_zero_end:
    ok($I1, "if_i_ic with integer zero")
.end

.sub 'if_n_ic_positive'
    $N0 = 0.1

    $I1 = 0
    if $N0 goto if_n_ic_positive_ok
    goto if_n_ic_positive_end

  if_n_ic_positive_ok:
    $I1 = 1
  if_n_ic_positive_end:
    ok($I1, "if_n_ic with a positive float")
.end

.sub 'if_n_ic_negative'
    $N0 = -0.1

    $I1 = 0
    if $N0 goto if_n_ic_negative_ok
    goto if_n_ic_negative_end

  if_n_ic_negative_ok:
    $I1 = 1
  if_n_ic_negative_end:
    ok($I1, "if_n_ic with a negative float")
.end

.sub 'if_n_ic_zero'
    $N0 = 0.0

    $I1 = 0
    if $N0 goto if_n_ic_zero_end
    $I1 = 1

  if_n_ic_zero_end:
    ok($I1, "if_n_ic with float zero")
.end

.sub 'if_s_ic_helloworld'
    $S0 = "Hello World"

    $I1 = 0
    if $S0 goto if_s_ic_helloworld_ok
    goto if_s_ic_helloworld_end

  if_s_ic_helloworld_ok:
    $I1 = 1
  if_s_ic_helloworld_end:
    ok($I1, "if_s_ic with a non-empty string")
.end

.sub 'if_s_ic_empty'
    $S0 = ''

    $I1 = 0
    if $S0 goto if_s_ic_empty_end
    $I1 = 1

  if_s_ic_empty_end:
    ok($I1, "if_n_ic with the empty string")
.end

.sub 'unless_i_ic_zero'
    $I0 = 0

    $I1 = 0
    unless $I0 goto unless_i_ic_zero_ok
    goto unless_i_ic_zero_end

  unless_i_ic_zero_ok:
    $I1 = 1
  unless_i_ic_zero_end:
    ok($I1, "unless_i_ic with integer zero")
.end

.sub 'unless_i_ic_negative'
    $I0 = -2147483648

    $I1 = 0
    unless $I0 goto unless_i_ic_negative_end
    $I1 = 1

  unless_i_ic_negative_end:
    ok($I1, "unless_i_ic with a negative integer")
.end

.sub 'unless_n_ic_zero'
    $N0 = 0.0

    $I1 = 0
    unless $N0 goto unless_n_ic_zero_ok
    goto unless_n_ic_zero_end

  unless_n_ic_zero_ok:
    $I1 = 1
  unless_n_ic_zero_end:
    ok($I1, "unless_n_ic with float zero")
.end

.sub 'unless_n_ic_negative'
    $N0 = -0.1

    $I1 = 0
    unless $N0 goto unless_n_ic_negative_end
    $I1 = 1

  unless_n_ic_negative_end:
    ok($I1, "unless_n_ic with a negative float")
.end

.sub 'unless_s_ic_empty'
    $S0 = ''

    $I1 = 0
    unless $S0 goto unless_s_ic_empty_ok
    goto unless_s_ic_empty_end

  unless_s_ic_empty_ok:
    $I1 = 1
  unless_s_ic_empty_end:
    ok($I1, "unless_s_ic with the empty string")
.end

.sub 'unless_s_ic_helloworld'
    $S0 = "Hello World"

    $I1 = 0
    unless $S0 goto unless_s_ic_helloworld_end
    $I1 = 1

  unless_s_ic_helloworld_end:
    ok($I1, "unless_s_ic with a non-empty string")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
