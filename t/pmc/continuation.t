#! parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/continuation.t - test Continuation PMC

=head1 SYNOPSIS

    % prove t/pmc/continuation.t

=head1 DESCRIPTION

Tests the Continuation PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(3)

    test_new()
    invoke_with_init()
    returns_tt1511()
.end

.sub test_new
    $P0 = new ['Continuation']
    ok(1, "new Continuation didn't explode")
.end

.sub invoke_with_init
    $P0 = new ['Continuation']
    set_addr $P0, L1
    $P0()
    ok(0, "didn't call continuation")
    goto end
L1:
    ok(1, "called continuation")
    goto end
end:
.end

.sub 'choose'
    .param pmc options :slurpy
    .local pmc cc
    .local pmc chosen
    .local pmc paths

    if options goto got_options
    'fail'()
  got_options:
    chosen = shift options

    cc = new 'Continuation'
    set_addr cc, recurse
    paths = get_global '!paths'
    push paths, cc

    $P0  = get_global '!results'
    push $P0, chosen
    .return (chosen)

  recurse:
    .tailcall 'choose'(options :flat)
.end

.sub 'fail'
    .local pmc cc
    .local pmc paths

    paths = get_global '!paths'

    if paths goto got_paths
    cc = get_global '!topcc'
    goto call_cc
  got_paths:
    cc = shift paths

  call_cc:
    cc()
.end

.sub 'blob'
    .local pmc city
    .local pmc store
    .local pmc bx
    .local pmc paths

    paths = new 'ResizablePMCArray'
    set_global '!paths', paths

    city = 'choose'("la", "ny", "bos")
    $P0  = get_global '!results'
    push $P0, city
    push $P0, ' '

    'fail'()
.end

.sub 'returns_tt1511'
    .local pmc cc

    # Install top-level cc in global.
    cc = new 'Continuation'
    set_addr cc, final_failure
    set_global '!topcc', cc

    $P0 = new 'ResizableStringArray'
    set_global '!results', $P0

    'blob'()
  final_failure:
    $S0 = join '', $P0
    is('lala nyny bosbos ', $S0, 'Results processed correctly')
.end

# end of tests.

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
