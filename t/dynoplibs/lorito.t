#!./parrot
# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

t/dynoplibs/lorito.t - Tests for Lorito M0 dynops

=head1 SYNOPSIS

        % prove t/dynoblibs/loritio.t

=head1 DESCRIPTION

Tests loritio.ops

=cut

.loadlib 'lorito_ops'

.sub main :main
    .include 'test_more.pir'
    plan(2)
    ok(1,"load lorito_ops")
    $P0 = context
    isa_ok($P0,'CallContext')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
