#! parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/context.t - test Context PMC

=head1 SYNOPSIS

    % prove t/pmc/context.t

=head1 DESCRIPTION

Tests the Context PMC.

TODO: Implement real tests when Context PMC will be migrated to use ATTRibutes.

=cut

.HLL 'FOO'

.sub main :main
    .include 'test_more.pir'

    plan(19)

    test_new()

    $P0 = get_hll_global ['Foo'], 'load'
    $P0()
    $P0 = new ['Foo']
    $P0.'test_inspect'() # 15 tests

    test_backtrace()     # 3 tests
.end

.sub 'test_new'
    $P0 = new ['Context']
    sweep 1
    ok(1, 'Instantiated .Context')
.end

# Put test_inspect into Namespace, as method, with outer, etc.
.namespace ['Foo']

.sub 'load'
    $P0 = newclass 'Foo'
.end

.sub 'test_inspect' :method :outer('load')
    .include 'test_more.pir'

    .local pmc ctx

    # We need LexPad
    .lex 'foo_ctx', ctx

    $P0 = getinterp
    ctx = $P0['context']
    $I0 = defined ctx 
    ok($I0, "Got Context")

    # Check current_sub first. Other tests relying on it
    $P0 = ctx['current_sub']
    is($P0, 'test_inspect', 'Got Context.current_sub')

    $P0 = ctx['caller_ctx']
    $I0 = isa $P0, 'Context'
    ok($I0, 'Got Context.caller_ctx')
    $P0 = $P0['current_sub']
    is($P0, 'main', '... from proper Sub')

    $P0 = ctx['outer_ctx']
    $I0 = isa $P0, 'Context'
    ok($I0, 'Got Context.outer_ctx')
    $P0 = $P0['current_sub']
    is($P0, 'load', '... from proper Sub')

    $P0 = ctx['lex_pad']
    $I0 = isa $P0, 'LexPad'
    ok($I0, 'Got Context.lex_pad')
    $P1 = $P0['foo_ctx']
    $I0 = defined $P1
    ok($I0, '... with proper content')

    $P0 = ctx['current_cont']
    $I0 = isa $P0, 'Continuation'
    ok($I0, 'Got Context.current_cont')

    $P0 = ctx['current_object']
    $I0 = isa $P0, 'Foo'
    ok($I0, 'Got Context.current_object')

    $P0 = ctx['current_namespace']
    ok($P0, 'Got Context.current_namespace')
    $P1 = $P0['test_inspect']
    is($P1, 'test_inspect', '... with proper content')

    # Checking handlers
    push_eh done
    $P0 = ctx['handlers']
    $I0 = elements $P0

    push_eh cought
    # Now we should have one more handler
    $P0 = ctx['handlers']
    $I1 = elements $P0
    dec $I1
    is($I0, $I1, 'Got Context.handlers')

    # Check absurd fields
    $I0 = 1
    $P0 = ctx['world_domination']
    $I0 = 0
  cought:
    pop_eh
    ok($I0, "No world domination in this Context")

    # Current HLL shouldn't be zero
    $P0 = ctx['current_HLL']
    $I0 = $P0
    ok($I0, 'Got Context.current_HLL')

  done:
    pop_eh

.end

.namespace []

.sub 'test_backtrace'
    .local pmc bt
    bt = 'test_bt1'()
    $I0 = defined bt
    ok($I0, "Got Context.backtrace()")

    # We should have more than 3 elements
    $I0 = elements bt
    $I1 = $I0 > 3
    ok($I1, "... got enough elements")

    # First one should be "test_bt2"
    $P1 = shift bt
    $P2 = $P1['sub']
    is($P2, 'test_bt2', "... with correct first element")
.end

.sub 'test_bt1'
    $P0 = 'test_bt2'()
    .return ($P0)
.end

.sub 'test_bt2'
    $P0 = getinterp
    $P1 = $P0['context']
    $P2 = $P1.'backtrace'()
    .return ($P2)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
