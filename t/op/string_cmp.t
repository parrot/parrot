#! parrot
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/op/string.t - Parrot Strings

=head1 SYNOPSIS

     % prove t/op/string.t

=head1 DESCRIPTION

Tests Parrot string registers and operations.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(24)

    test_eq_s_s_ic()
    test_eq_sc_s_ic()
    test_eq_s_sc_ic()
    test_eq_sc_sc_ic()
    test_ne_s_s_ic()
    test_ne_sc_s_ic()
    test_ne_s_sc_ic()
    test_ne_sc_sc_ic()
    test_lt_s_s_ic()
    test_lt_sc_s_ic()
    test_lt_s_sc_ic()
    test_lt_sc_sc_ic()
    test_le_s_s_ic()
    test_le_sc_s_ic()
    test_le_s_sc_ic()
    test_le_sc_sc_ic()
    test_gt_s_s_ic()
    test_gt_sc_s_ic()
    test_gt_s_sc_ic()
    test_gt_sc_sc_ic()
    test_ge_s_s_ic()
    test_ge_sc_s_ic()
    test_ge_s_sc_ic()
    test_ge_sc_sc_ic()

.end

.sub test_eq_s_s_ic
    set $S0, "hello"
    set $S1, "hello"
    eq $S0, $S1, OK1
    branch ERROR
  OK1:
    set $S0, "hello"
    set $S1, "world"
    eq $S0, $S1, ERROR
  OK2:
    set $S0, "world"
    set $S1, "hello"
    eq $S0, $S1, ERROR
  OK3:
    set $S0, "hello"
    set $S1, "hellooo"
    eq $S0, $S1, ERROR
  OK4:
    set $S0, "hellooo"
    set $S1, "hello"
    eq $S0, $S1, ERROR
  OK5:
    set $S0, "hello"
    set $S1, "hella"
    eq $S0, $S1, ERROR
  OK6:
    set $S0, "hella"
    set $S1, "hello"
    eq $S0, $S1, ERROR
  OK7:
    set $S0, "hella"
    set $S1, "hellooo"
    eq $S0, $S1, ERROR
  OK8:
    set $S0, "hellooo"
    set $S1, "hella"
    eq $S0, $S1, ERROR
  OK9:
    set $S0, "hElLo"
    set $S1, "HeLlO"
    eq $S0, $S1, ERROR
  OK10:
    set $S0, "hElLo"
    set $S1, "hElLo"
    eq $S0, $S1, OK11
    branch ERROR
  OK11:
    ok( 1, 'eq_s_s_ic' )
    goto END
  ERROR:
   ok( 0, 'eq_s_s_ic' )
   END:
.end

.sub test_eq_sc_s_ic
    set $S0, "hello"
    eq "hello", $S0, OK1
    branch ERROR
  OK1:
    set $S0, "world"
    eq "hello", $S0, ERROR
  OK2:
    set $S0, "hello"
    eq "world", $S0, ERROR
  OK3:
    set $S0, "hellooo"
    eq "hello", $S0, ERROR
  OK4:
    set $S0, "hello"
    eq "hellooo", $S0, ERROR
  OK5:
    set $S0, "hella"
    eq "hello", $S0, ERROR
  OK6:
    set $S0, "hello"
    eq "hella", $S0, ERROR
  OK7:
    set $S0, "hellooo"
    eq "hella", $S0, ERROR
  OK8:
    set $S0, "hella"
    eq "hellooo", $S0, ERROR
  OK9:
    set $S0, "HeLlO"
    eq "hElLo", $S0, ERROR
  OK10:
    set $S0, "hElLo"
    eq "hElLo", $S0, OK11
    branch ERROR
  OK11:
    ok( 1, 'eq_sc_s_ic' )
    goto END
  ERROR:
   ok( 0, 'eq_sc_s_ic' )
   END:
.end

.sub test_eq_s_sc_ic
    set $S0, "hello"
    eq $S0, "hello", OK1
    branch ERROR
  OK1:
    set $S0, "hello"
    eq $S0, "world", ERROR
  OK2:
    set $S0, "world"
    eq $S0, "hello", ERROR
  OK3:
    set $S0, "hello"
    eq $S0, "hellooo", ERROR
  OK4:
    set $S0, "hellooo"
    eq $S0, "hello", ERROR
  OK5:
    set $S0, "hello"
    eq $S0, "hella", ERROR
  OK6:
    set $S0, "hella"
    eq $S0, "hello", ERROR
  OK7:
    set $S0, "hella"
    eq $S0, "hellooo", ERROR
  OK8:
    set $S0, "hellooo"
    eq $S0, "hella", ERROR
  OK9:
    set $S0, "hElLo"
    eq $S0, "HeLlO", ERROR
  OK10:
    set $S0, "hElLo"
    eq $S0, "hElLo", OK11
    branch ERROR
  OK11:
    ok( 1, 'eq_s_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'eq_s_sc_ic' )
   END:
.end

.sub test_eq_sc_sc_ic
    eq "hello", "hello", OK1
    branch ERROR
  OK1:
    eq "hello", "world", ERROR
  OK2:
    eq "world", "hello", ERROR
  OK3:
    eq "hello", "hellooo", ERROR
  OK4:
    eq "hellooo", "hello", ERROR
  OK5:
    eq "hello", "hella", ERROR
  OK6:
    eq "hella", "hello", ERROR
  OK7:
    eq "hella", "hellooo", ERROR
  OK8:
    eq "hellooo", "hella", ERROR
  OK9:
    eq "hElLo", "HeLlO", ERROR
  OK10:
    eq "hElLo", "hElLo", OK11
    branch ERROR
  OK11:
    ok( 1, 'eq_sc_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'eq_sc_sc_ic' )
   END:
.end

.sub test_ne_s_s_ic
    set $S0, "hello"
    set $S1, "hello"
    ne $S0, $S1, ERROR
  OK1:
    set $S0, "hello"
    set $S1, "world"
    ne $S0, $S1, OK2
    branch ERROR
  OK2:
    set $S0, "world"
    set $S1, "hello"
    ne $S0, $S1, OK3
    branch ERROR
  OK3:
    set $S0, "hello"
    set $S1, "hellooo"
    ne $S0, $S1, OK4
    branch ERROR
  OK4:
    set $S0, "hellooo"
    set $S1, "hello"
    ne $S0, $S1, OK5
    branch ERROR
  OK5:
    set $S0, "hello"
    set $S1, "hella"
    ne $S0, $S1, OK6
    branch ERROR
  OK6:
    set $S0, "hella"
    set $S1, "hello"
    ne $S0, $S1, OK7
    branch ERROR
  OK7:
    set $S0, "hella"
    set $S1, "hellooo"
    ne $S0, $S1, OK8
    branch ERROR
  OK8:
    set $S0, "hellooo"
    set $S1, "hella"
    ne $S0, $S1, OK9
    branch ERROR
  OK9:
    set $S0, "hElLo"
    set $S1, "HeLlO"
    ne $S0, $S1, OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    set $S1, "hElLo"
    ne $S0, $S1, ERROR
  OK11:
    ok( 1, 'ne_s_s_ic' )
    goto END
  ERROR:
   ok( 0, 'ne_s_s_ic' )
   END:
.end

.sub test_ne_sc_s_ic
    set $S0, "hello"
    ne "hello", $S0, ERROR
  OK1:
    set $S0, "world"
    ne "hello", $S0, OK2
    branch ERROR
  OK2:
    set $S0, "hello"
    ne "world", $S0, OK3
    branch ERROR
  OK3:
    set $S0, "hellooo"
    ne "hello", $S0, OK4
    branch ERROR
  OK4:
    set $S0, "hello"
    ne "hellooo", $S0, OK5
    branch ERROR
  OK5:
    set $S0, "hella"
    ne "hello", $S0, OK6
    branch ERROR
  OK6:
    set $S0, "hello"
    ne "hella", $S0, OK7
    branch ERROR
  OK7:
    set $S0, "hellooo"
    ne "hella", $S0, OK8
    branch ERROR
  OK8:
    set $S0, "hella"
    ne "hellooo", $S0, OK9
    branch ERROR
  OK9:
    set $S0, "HeLlO"
    ne "hElLo", $S0, OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    ne "hElLo", $S0, ERROR
  OK11:
    ok( 1, 'ne_sc_s_ic' )
    goto END
  ERROR:
   ok( 0, 'ne_sc_s_ic' )
   END:
.end

.sub test_ne_s_sc_ic
    set $S0, "hello"
    ne $S0, "hello", ERROR
  OK1:
    set $S0, "hello"
    ne $S0, "world", OK2
    branch ERROR
  OK2:
    set $S0, "world"
    ne $S0, "hello", OK3
    branch ERROR
  OK3:
    set $S0, "hello"
    ne $S0, "hellooo", OK4
    branch ERROR
  OK4:
    set $S0, "hellooo"
    ne $S0, "hello", OK5
    branch ERROR
  OK5:
    set $S0, "hello"
    ne $S0, "hella", OK6
    branch ERROR
  OK6:
    set $S0, "hella"
    ne $S0, "hello", OK7
    branch ERROR
  OK7:
    set $S0, "hella"
    ne $S0, "hellooo", OK8
    branch ERROR
  OK8:
    set $S0, "hellooo"
    ne $S0, "hella", OK9
    branch ERROR
  OK9:
    set $S0, "hElLo"
    ne $S0, "HeLlO", OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    ne $S0, "hElLo", ERROR
  OK11:
    ok( 1, 'ne_s_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'ne_s_sc_ic' )
   END:
.end

.sub test_ne_sc_sc_ic
    ne "hello", "hello", ERROR
  OK1:
    ne "hello", "world", OK2
    branch ERROR
  OK2:
    ne "world", "hello", OK3
    branch ERROR
  OK3:
    ne "hello", "hellooo", OK4
    branch ERROR
  OK4:
    ne "hellooo", "hello", OK5
    branch ERROR
  OK5:
    ne "hello", "hella", OK6
    branch ERROR
  OK6:
    ne "hella", "hello", OK7
    branch ERROR
  OK7:
    ne "hella", "hellooo", OK8
    branch ERROR
  OK8:
    ne "hellooo", "hella", OK9
    branch ERROR
  OK9:
    ne "hElLo", "HeLlO", OK10
    branch ERROR
  OK10:
    ne "hElLo", "hElLo", ERROR
  OK11:
    ok( 1, 'ne_sc_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'ne_sc_sc_ic' )
   END:
.end

.sub test_lt_s_s_ic
    set $S0, "hello"
    set $S1, "hello"
    lt $S0, $S1, ERROR
  OK1:
    set $S0, "hello"
    set $S1, "world"
    lt $S0, $S1, OK2
    branch ERROR
  OK2:
    set $S0, "world"
    set $S1, "hello"
    lt $S0, $S1, ERROR
  OK3:
    set $S0, "hello"
    set $S1, "hellooo"
    lt $S0, $S1, OK4
    branch ERROR
  OK4:
    set $S0, "hellooo"
    set $S1, "hello"
    lt $S0, $S1, ERROR
  OK5:
    set $S0, "hello"
    set $S1, "hella"
    lt $S0, $S1, ERROR
  OK6:
    set $S0, "hella"
    set $S1, "hello"
    lt $S0, $S1, OK7
    branch ERROR
  OK7:
    set $S0, "hella"
    set $S1, "hellooo"
    lt $S0, $S1, OK8
    branch ERROR
  OK8:
    set $S0, "hellooo"
    set $S1, "hella"
    lt $S0, $S1, ERROR
  OK9:
    set $S0, "hElLo"
    set $S1, "HeLlO"
    lt $S0, $S1, ERROR
  OK10:
    set $S0, "hElLo"
    set $S1, "hElLo"
    lt $S0, $S1, ERROR
  OK11:
    ok( 1, 'lt_s_s_ic' )
    goto END
  ERROR:
   ok( 0, 'lt_s_s_ic' )
   END:
.end

.sub test_lt_sc_s_ic
    set $S0, "hello"
    lt "hello", $S0, ERROR
  OK1:
    set $S0, "world"
    lt "hello", $S0, OK2
    branch ERROR
  OK2:
    set $S0, "hello"
    lt "world", $S0, ERROR
  OK3:
    set $S0, "hellooo"
    lt "hello", $S0, OK4
    branch ERROR
  OK4:
    set $S0, "hello"
    lt "hellooo", $S0, ERROR
  OK5:
    set $S0, "hella"
    lt "hello", $S0, ERROR
  OK6:
    set $S0, "hello"
    lt "hella", $S0, OK7
    branch ERROR
  OK7:
    set $S0, "hellooo"
    lt "hella", $S0, OK8
    branch ERROR
  OK8:
    set $S0, "hella"
    lt "hellooo", $S0, ERROR
  OK9:
    set $S0, "HeLlO"
    lt "hElLo", $S0, ERROR
  OK10:
    set $S0, "hElLo"
    lt "hElLo", $S0, ERROR
  OK11:
    ok( 1, 'lt_sc_s_ic' )
    goto END
  ERROR:
   ok( 0, 'lt_sc_s_ic' )
   END:
.end

.sub test_lt_s_sc_ic
    set $S0, "hello"
    lt $S0, "hello", ERROR
  OK1:
    set $S0, "hello"
    lt $S0, "world", OK2
    branch ERROR
  OK2:
    set $S0, "world"
    lt $S0, "hello", ERROR
  OK3:
    set $S0, "hello"
    lt $S0, "hellooo", OK4
    branch ERROR
  OK4:
    set $S0, "hellooo"
    lt $S0, "hello", ERROR
  OK5:
    set $S0, "hello"
    lt $S0, "hella", ERROR
  OK6:
    set $S0, "hella"
    lt $S0, "hello", OK7
    branch ERROR
  OK7:
    set $S0, "hella"
    lt $S0, "hellooo", OK8
    branch ERROR
  OK8:
    set $S0, "hellooo"
    lt $S0, "hella", ERROR
  OK9:
    set $S0, "hElLo"
    lt $S0, "HeLlO", ERROR
  OK10:
    set $S0, "hElLo"
    lt $S0, "hElLo", ERROR
  OK11:
    ok( 1, 'lt_s_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'lt_s_sc_ic' )
   END:
.end

.sub test_lt_sc_sc_ic
    lt "hello", "hello", ERROR
  OK1:
    lt "hello", "world", OK2
    branch ERROR
  OK2:
    lt "world", "hello", ERROR
  OK3:
    lt "hello", "hellooo", OK4
    branch ERROR
  OK4:
    lt "hellooo", "hello", ERROR
  OK5:
    lt "hello", "hella", ERROR
  OK6:
    lt "hella", "hello", OK7
    branch ERROR
  OK7:
    lt "hella", "hellooo", OK8
    branch ERROR
  OK8:
    lt "hellooo", "hella", ERROR
  OK9:
    lt "hElLo", "HeLlO", ERROR
  OK10:
    lt "hElLo", "hElLo", ERROR
  OK11:
    ok( 1, 'lt_sc_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'lt_sc_sc_ic' )
   END:
.end

.sub test_le_s_s_ic
    set $S0, "hello"
    set $S1, "hello"
    le $S0, $S1, OK1
    branch ERROR
  OK1:
    set $S0, "hello"
    set $S1, "world"
    le $S0, $S1, OK2
    branch ERROR
  OK2:
    set $S0, "world"
    set $S1, "hello"
    le $S0, $S1, ERROR
  OK3:
    set $S0, "hello"
    set $S1, "hellooo"
    le $S0, $S1, OK4
    branch ERROR
  OK4:
    set $S0, "hellooo"
    set $S1, "hello"
    le $S0, $S1, ERROR
  OK5:
    set $S0, "hello"
    set $S1, "hella"
    le $S0, $S1, ERROR
  OK6:
    set $S0, "hella"
    set $S1, "hello"
    le $S0, $S1, OK7
    branch ERROR
  OK7:
    set $S0, "hella"
    set $S1, "hellooo"
    le $S0, $S1, OK8
    branch ERROR
  OK8:
    set $S0, "hellooo"
    set $S1, "hella"
    le $S0, $S1, ERROR
  OK9:
    set $S0, "hElLo"
    set $S1, "HeLlO"
    le $S0, $S1, ERROR
  OK10:
    set $S0, "hElLo"
    set $S1, "hElLo"
    le $S0, $S1, OK11
    branch ERROR
  OK11:
    ok( 1, 'le_s_s_ic' )
    goto END
  ERROR:
   ok( 0, 'le_s_s_ic' )
   END:
.end

.sub test_le_sc_s_ic
    set $S0, "hello"
    le "hello", $S0, OK1
    branch ERROR
  OK1:
    set $S0, "world"
    le "hello", $S0, OK2
    branch ERROR
  OK2:
    set $S0, "hello"
    le "world", $S0, ERROR
  OK3:
    set $S0, "hellooo"
    le "hello", $S0, OK4
    branch ERROR
  OK4:
    set $S0, "hello"
    le "hellooo", $S0, ERROR
  OK5:
    set $S0, "hella"
    le "hello", $S0, ERROR
  OK6:
    set $S0, "hello"
    le "hella", $S0, OK7
    branch ERROR
  OK7:
    set $S0, "hellooo"
    le "hella", $S0, OK8
    branch ERROR
  OK8:
    set $S0, "hella"
    le "hellooo", $S0, ERROR
  OK9:
    set $S0, "HeLlO"
    le "hElLo", $S0, ERROR
  OK10:
    set $S0, "hElLo"
    le "hElLo", $S0, OK11
    branch ERROR
  OK11:
    ok( 1, 'le_sc_s_ic' )
    goto END
  ERROR:
   ok( 0, 'le_sc_s_ic' )
   END:
.end

.sub test_le_s_sc_ic
    set $S0, "hello"
    le $S0, "hello", OK1
    branch ERROR
  OK1:
    set $S0, "hello"
    le $S0, "world", OK2
    branch ERROR
  OK2:
    set $S0, "world"
    le $S0, "hello", ERROR
  OK3:
    set $S0, "hello"
    le $S0, "hellooo", OK4
    branch ERROR
  OK4:
    set $S0, "hellooo"
    le $S0, "hello", ERROR
  OK5:
    set $S0, "hello"
    le $S0, "hella", ERROR
  OK6:
    set $S0, "hella"
    le $S0, "hello", OK7
    branch ERROR
  OK7:
    set $S0, "hella"
    le $S0, "hellooo", OK8
    branch ERROR
  OK8:
    set $S0, "hellooo"
    le $S0, "hella", ERROR
  OK9:
    set $S0, "hElLo"
    le $S0, "HeLlO", ERROR
  OK10:
    set $S0, "hElLo"
    le $S0, "hElLo", OK11
    branch ERROR
  OK11:
    ok( 1, 'le_s_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'le_s_sc_ic' )
   END:
.end

.sub test_le_sc_sc_ic
    le "hello", "hello", OK1
    branch ERROR
  OK1:
    le "hello", "world", OK2
    branch ERROR
  OK2:
    le "world", "hello", ERROR
  OK3:
    le "hello", "hellooo", OK4
    branch ERROR
  OK4:
    le "hellooo", "hello", ERROR
  OK5:
    le "hello", "hella", ERROR
  OK6:
    le "hella", "hello", OK7
    branch ERROR
  OK7:
    le "hella", "hellooo", OK8
    branch ERROR
  OK8:
    le "hellooo", "hella", ERROR
  OK9:
    le "hElLo", "HeLlO", ERROR
  OK10:
    le "hElLo", "hElLo", OK11
    branch ERROR
  OK11:
    ok( 1, 'le_sc_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'le_sc_sc_ic' )
   END:
.end

.sub test_gt_s_s_ic
    set $S0, "hello"
    set $S1, "hello"
    gt $S0, $S1, ERROR
  OK1:
    set $S0, "hello"
    set $S1, "world"
    gt $S0, $S1, ERROR
  OK2:
    set $S0, "world"
    set $S1, "hello"
    gt $S0, $S1, OK3
    branch ERROR
  OK3:
    set $S0, "hello"
    set $S1, "hellooo"
    gt $S0, $S1, ERROR
  OK4:
    set $S0, "hellooo"
    set $S1, "hello"
    gt $S0, $S1, OK5
    branch ERROR
  OK5:
    set $S0, "hello"
    set $S1, "hella"
    gt $S0, $S1, OK6
    branch ERROR
  OK6:
    set $S0, "hella"
    set $S1, "hello"
    gt $S0, $S1, ERROR
  OK7:
    set $S0, "hella"
    set $S1, "hellooo"
    gt $S0, $S1, ERROR
  OK8:
    set $S0, "hellooo"
    set $S1, "hella"
    gt $S0, $S1, OK9
    branch ERROR
  OK9:
    set $S0, "hElLo"
    set $S1, "HeLlO"
    gt $S0, $S1, OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    set $S1, "hElLo"
    gt $S0, $S1, ERROR
  OK11:
    ok( 1, 'gt_s_s_ic' )
    goto END
  ERROR:
   ok( 0, 'gt_s_s_ic' )
   END:
.end

.sub test_gt_sc_s_ic
    set $S0, "hello"
    gt "hello", $S0, ERROR
  OK1:
    set $S0, "world"
    gt "hello", $S0, ERROR
  OK2:
    set $S0, "hello"
    gt "world", $S0, OK3
    branch ERROR
  OK3:
    set $S0, "hellooo"
    gt "hello", $S0, ERROR
  OK4:
    set $S0, "hello"
    gt "hellooo", $S0, OK5
    branch ERROR
  OK5:
    set $S0, "hella"
    gt "hello", $S0, OK6
    branch ERROR
  OK6:
    set $S0, "hello"
    gt "hella", $S0, ERROR
  OK7:
    set $S0, "hellooo"
    gt "hella", $S0, ERROR
  OK8:
    set $S0, "hella"
    gt "hellooo", $S0, OK9
    branch ERROR
  OK9:
    set $S0, "HeLlO"
    gt "hElLo", $S0, OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    gt "hElLo", $S0, ERROR
  OK11:
    ok( 1, 'gt_sc_s_ic' )
    goto END
  ERROR:
   ok( 0, 'gt_sc_s_ic' )
   END:
.end

.sub test_gt_s_sc_ic
    set $S0, "hello"
    gt $S0, "hello", ERROR
  OK1:
    set $S0, "hello"
    gt $S0, "world", ERROR
  OK2:
    set $S0, "world"
    gt $S0, "hello", OK3
    branch ERROR
  OK3:
    set $S0, "hello"
    gt $S0, "hellooo", ERROR
  OK4:
    set $S0, "hellooo"
    gt $S0, "hello", OK5
    branch ERROR
  OK5:
    set $S0, "hello"
    gt $S0, "hella", OK6
    branch ERROR
  OK6:
    set $S0, "hella"
    gt $S0, "hello", ERROR
  OK7:
    set $S0, "hella"
    gt $S0, "hellooo", ERROR
  OK8:
    set $S0, "hellooo"
    gt $S0, "hella", OK9
    branch ERROR
  OK9:
    set $S0, "hElLo"
    gt $S0, "HeLlO", OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    gt $S0, "hElLo", ERROR
  OK11:
    ok( 1, 'gt_s_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'gt_s_sc_ic' )
   END:
.end

.sub test_gt_sc_sc_ic
    gt "hello", "hello", ERROR
  OK1:
    gt "hello", "world", ERROR
  OK2:
    gt "world", "hello", OK3
    branch ERROR
  OK3:
    gt "hello", "hellooo", ERROR
  OK4:
    gt "hellooo", "hello", OK5
    branch ERROR
  OK5:
    gt "hello", "hella", OK6
    branch ERROR
  OK6:
    gt "hella", "hello", ERROR
  OK7:
    gt "hella", "hellooo", ERROR
  OK8:
    gt "hellooo", "hella", OK9
    branch ERROR
  OK9:
    gt "hElLo", "HeLlO", OK10
    branch ERROR
  OK10:
    gt "hElLo", "hElLo", ERROR
  OK11:
    ok( 1, 'gt_sc_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'gt_sc_sc_ic' )
   END:
.end

.sub test_ge_s_s_ic
    set $S0, "hello"
    set $S1, "hello"
    ge $S0, $S1, OK1
    branch ERROR
  OK1:
    set $S0, "hello"
    set $S1, "world"
    ge $S0, $S1, ERROR
  OK2:
    set $S0, "world"
    set $S1, "hello"
    ge $S0, $S1, OK3
    branch ERROR
  OK3:
    set $S0, "hello"
    set $S1, "hellooo"
    ge $S0, $S1, ERROR
  OK4:
    set $S0, "hellooo"
    set $S1, "hello"
    ge $S0, $S1, OK5
    branch ERROR
  OK5:
    set $S0, "hello"
    set $S1, "hella"
    ge $S0, $S1, OK6
    branch ERROR
  OK6:
    set $S0, "hella"
    set $S1, "hello"
    ge $S0, $S1, ERROR
  OK7:
    set $S0, "hella"
    set $S1, "hellooo"
    ge $S0, $S1, ERROR
  OK8:
    set $S0, "hellooo"
    set $S1, "hella"
    ge $S0, $S1, OK9
    branch ERROR
  OK9:
    set $S0, "hElLo"
    set $S1, "HeLlO"
    ge $S0, $S1, OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    set $S1, "hElLo"
    ge $S0, $S1, OK11
    branch ERROR
  OK11:
    ok( 1, 'ge_s_s_ic' )
    goto END
  ERROR:
   ok( 0, 'ge_s_s_ic' )
   END:
.end

.sub test_ge_sc_s_ic
    set $S0, "hello"
    ge "hello", $S0, OK1
    branch ERROR
  OK1:
    set $S0, "world"
    ge "hello", $S0, ERROR
  OK2:
    set $S0, "hello"
    ge "world", $S0, OK3
    branch ERROR
  OK3:
    set $S0, "hellooo"
    ge "hello", $S0, ERROR
  OK4:
    set $S0, "hello"
    ge "hellooo", $S0, OK5
    branch ERROR
  OK5:
    set $S0, "hella"
    ge "hello", $S0, OK6
    branch ERROR
  OK6:
    set $S0, "hello"
    ge "hella", $S0, ERROR
  OK7:
    set $S0, "hellooo"
    ge "hella", $S0, ERROR
  OK8:
    set $S0, "hella"
    ge "hellooo", $S0, OK9
    branch ERROR
  OK9:
    set $S0, "HeLlO"
    ge "hElLo", $S0, OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    ge "hElLo", $S0, OK11
    branch ERROR
  OK11:
    ok( 1, 'ge_sc_s_ic' )
    goto END
  ERROR:
   ok( 0, 'ge_sc_s_ic' )
   END:
.end

.sub test_ge_s_sc_ic
    set $S0, "hello"
    ge $S0, "hello", OK1
    branch ERROR
  OK1:
    set $S0, "hello"
    ge $S0, "world", ERROR
  OK2:
    set $S0, "world"
    ge $S0, "hello", OK3
    branch ERROR
  OK3:
    set $S0, "hello"
    ge $S0, "hellooo", ERROR
  OK4:
    set $S0, "hellooo"
    ge $S0, "hello", OK5
    branch ERROR
  OK5:
    set $S0, "hello"
    ge $S0, "hella", OK6
    branch ERROR
  OK6:
    set $S0, "hella"
    ge $S0, "hello", ERROR
  OK7:
    set $S0, "hella"
    ge $S0, "hellooo", ERROR
  OK8:
    set $S0, "hellooo"
    ge $S0, "hella", OK9
    branch ERROR
  OK9:
    set $S0, "hElLo"
    ge $S0, "HeLlO", OK10
    branch ERROR
  OK10:
    set $S0, "hElLo"
    ge $S0, "hElLo", OK11
    branch ERROR
  OK11:
    ok( 1, 'ge_s_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'ge_s_sc_ic' )
   END:
.end

.sub test_ge_sc_sc_ic
    ge "hello", "hello", OK1
    branch ERROR
  OK1:
    ge "hello", "world", ERROR
  OK2:
    ge "world", "hello", OK3
    branch ERROR
  OK3:
    ge "hello", "hellooo", ERROR
  OK4:
    ge "hellooo", "hello", OK5
    branch ERROR
  OK5:
    ge "hello", "hella", OK6
    branch ERROR
  OK6:
    ge "hella", "hello", ERROR
  OK7:
    ge "hella", "hellooo", ERROR
  OK8:
    ge "hellooo", "hella", OK9
    branch ERROR
  OK9:
    ge "hElLo", "HeLlO", OK10
    branch ERROR
  OK10:
    ge "hElLo", "hElLo", OK11
    branch ERROR
  OK11:
    ok( 1, 'ge_sc_sc_ic' )
    goto END
  ERROR:
   ok( 0, 'ge_sc_sc_ic' )
   END:
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir :
