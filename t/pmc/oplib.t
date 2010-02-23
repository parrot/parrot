#! parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/oplib.t - OpLib PMC

=head1 SYNOPSIS

    % prove t/pmc/oplib.t

=cut

.sub main :main
    .include 'test_more.pir'
    plan(2)
    get_singleton()
.end

.sub get_singleton
    $P0 = new ['OpLib']
    $I0 = isnull $P0
    is($I0, 0)

    $P1 = new ['OpLib']
    eq_addr $P0, $P1, ok
    ok(0, "all OpLibs aren't identical")
    goto end
ok:
    ok(1, "all OpLibs are identical")
end:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

