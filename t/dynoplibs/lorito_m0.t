#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/dynoplibs/lorito_m0.t - Tests for Lorito M0 ops

=head1 SYNOPSIS

    % prove t/dynoblibs/lorito_m0.t

=head1 DESCRIPTION

Tests lorito_m0.ops

=cut

.loadlib 'lorito_m0_ops'

.sub main :main
    .include 'test_more.pir'
    plan(2)
    ok(1,"load lorito_m0_ops")

    test_noop()
.end

.sub test_noop
    m0_noop
    ok(1, 'noop called')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
