#! parrot
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

t/dynpmc/foo-01.t - Test for a very simple dynamic PMC

=head1 SYNOPSIS

    % prove t/dynpmc/foo-*.t

=head1 DESCRIPTION

Tests the dynamic loading of the Foo DynPMC.

Note that each test of dynamically loading this PMC must be in its own
individual file, because a DynPMC cannot be unloaded, so having more than
one loadlib per file will produce false positives. See TT#1217 for more detail.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(1)

    loadlib $P1, "foo_group"
    $P1 = new "Foo"

    $I1 = $P1
    is($I1, 42, 'get integer')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
