#! parrot
# Copyright (C) 2005-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/dynpmc/subproxy.t - test if Sub is overridable via hll_map()

=head1 SYNOPSIS

        % prove t/dynpmc/subproxy.t

=head1 DESCRIPTION

Tests the hll mapping of Sub PMCs. The test is using SubProxy, which
happens to be a Sub.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(3)

    test_loadlib()
    test_type_of_hll_mapped_sub()
.end

.sub test_loadlib
    .local pmc lib
    lib = loadlib "subproxy"
    unless lib goto not_loaded
    ok(1, 'loadlib')
    .return()
  not_loaded:
    ok(1, 'loadlib')
.end

.sub test_type_of_hll_mapped_sub
    .local pmc b, f
    b = get_global 'bar'
    $S0 = typeof b
    is($S0, 'Sub', "test type of hll_map'ped .Sub")
    f = get_root_global ['some'], 'foo'
    $S0 = typeof f
    is($S0, 'SubProxy', "test type of hll_map'ped .Sub")
.end

.sub bar
    noop
.end

.HLL "Some"
.loadlib "subproxy"
.sub load :anon :immediate
    .local pmc interp
    .local pmc sub,subproxy
    interp = getinterp
    sub = get_class 'Sub'
    subproxy = get_class 'SubProxy'
    interp.'hll_map'(sub,subproxy)
.end

.sub foo
    noop
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
