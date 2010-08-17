#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynpmc/foo2.t - Test for a very simple dynamic PMC

=head1 SYNOPSIS

        % prove t/dynpmc/foo2.t

=head1 DESCRIPTION

Tests the Foo PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(1)

    test_dynpmcs_can_use_super()
.end

.sub test_dynpmcs_can_use_super
    $P0 = loadlib 'foo_group'
    $P1 = new "Foo2"

    $I1 = $P1
    is($I1, 43, 'dynpmcs can use SUPER to call parent dynpmc VTABLE functions')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
