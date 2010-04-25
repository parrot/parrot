#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynoplibs/math.t - Tests for mathematical ops

=head1 SYNOPSIS

        % prove t/dynoblibs/math.t

=head1 DESCRIPTION

Tests math.ops

=cut

.loadlib 'math_ops'
.sub main :main
    .include 'test_more.pir'
    .include 'fp_equality.pasm'
    plan(20)
    ok(1, "load math_ops")
    rand $I0
    test_2_arg_int()
    test_3_arg_int()
    test_1_arg_num()
    test_2_arg_num()
    test_3_arg_num()
    test_srand()
    test_local_nums()
    test_local_nums_2_arg()
    test_local_ints()
.end

.sub test_2_arg_int
    rand $I0, 5
    lt $I0, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt $I0, 5, fail2
    ok(1, 'rand returns a number less than or equal to 5')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 5')
finish:
.end

.sub test_3_arg_int
    rand $I0, 50, 75
    lt $I0, 50, fail1
    ok(1, 'rand returns a number greater than or equal to 50')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 50')
upper:
    gt $I0, 75, fail2
    ok(1, 'rand returns a number less than or equal to 75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 75')
finish:
.end

.sub test_1_arg_num
    rand $N0
    lt $N0, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt $N0, 1, fail2
    ok(1, 'rand returns a number less than or equal to 1')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 1')
finish:
.end

.sub test_2_arg_num
    rand $N0, 5
    lt $N0, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt $N0, 5, fail2
    ok(1, 'rand returns a number less than or equal to 5')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 5')
finish:
.end

.sub test_3_arg_num
    rand $N0, 50, 75
    lt $N0, 25, fail1
    ok(1, 'rand returns a number greater than or equal to 50')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 50')
upper:
    gt $N0, 75, fail2
    ok(1, 'rand returns a number less than or equal to 75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 75')
finish:
.end

.sub test_srand
    srand 42
    ok(1, 'call srand with int')
    srand 42.0
    ok(1, 'call srand with num')
    rand $N0
    srand 5
    rand $N2
    srand 42.0
    rand $N1
    .fp_eq_ok($N0, $N1, 'having the same seed generates the same numbers')
.end

.sub test_local_nums_2_arg
    .local num foo, bar
    foo = rand 50.0, 75.0
    lt foo, 50, fail1
    ok(1, 'rand returns a number greater than or equal to 50')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 50')
upper:
    gt foo, 75, fail2
    ok(1, 'rand returns a number less than or equal to 75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 75')
finish:
.end

.sub test_local_nums
    .local num foo, bar
    foo = rand
    lt foo, 0, fail1
    ok(1, 'rand returns a number greater than or equal to 0')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 0')
upper:
    gt foo, 1, fail2
    ok(1, 'rand returns a number less than or equal to 1')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 1')
finish:
.end

.sub test_local_ints
    .local int foo, bar
    foo = rand 50, 75
    lt foo, 50, fail1
    ok(1, 'rand returns a number greater than or equal to 50')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 50')
upper:
    gt foo, 75, fail2
    ok(1, 'rand returns a number less than or equal to 75')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 75')
finish:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
