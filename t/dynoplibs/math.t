#! parrot
# Copyright (C) 2009, Parrot Foundation.
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
    plan(7)
    ok(1, "load math_ops")
    basic_test_1_arg()
    basic_test_2_arg()
    basic_test_3_arg()
.end

.sub basic_test_1_arg
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

.sub basic_test_2_arg
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

.sub basic_test_3_arg
    rand $N0, 5, 25
    lt $N0, 5, fail1
    ok(1, 'rand returns a number greater than or equal to 5')
    goto upper
fail1:
    ok(0, 'rand returns a number greater than or equal to 5')
upper:
    gt $N0, 25, fail2
    ok(1, 'rand returns a number less than or equal to 25')
    goto finish
fail2:
    ok(0, 'rand returns a number less than or equal to 25')
finish:
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 filetype=pir:
