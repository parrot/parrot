#!./parrot
# Copyright (C) 2007, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/proxy.t - Test OO class proxies.

=head1 SYNOPSIS

    % prove t/oo/proxy.t

=head1 DESCRIPTION

Tests OO features related to creating and using class proxies.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(11)

    typeof_a_low_level_object()
    typeof_a_high_level_object()
    typeof_a_class_object()
    proxy_as_parent_of_class()
    proxy_as_parent_of_class_with_new()
    proxy_no_method_conflict()
    .local pmc proxy_no_invade
    proxy_no_invade = get_root_global ['foo'], 'proxy_no_invade'
    proxy_no_invade()
.end

.sub typeof_a_low_level_object
    $P0 = new 'String'
    $S1 = typeof $P0
    $P1 = typeof $P0
    $I3 = isa $P1, "PMCProxy"

    is ($S1, 'String', 'object is typeof string')
    ok ($I3, 'object isa PMCProxy')
.end

.sub typeof_a_high_level_object
    $P0 = newclass "Foo"
    $P0 = new "Foo"

    $S1 = typeof $P0
    is ($S1, 'Foo', 'object is typeof Foo')

    $P1 = typeof $P0
    $I3 = isa $P1, "PMCProxy"
    nok ($I3, 'object not isa PMCProxy')

    $I3 = isa $P1, "Foo"
    ok ($I3, 'object isa Foo')
.end

.sub typeof_a_class_object
    $P0 = newclass "Bar"
    $S1 = typeof $P0
    is ($S1, 'Class', 'object is typeof Class')
    $P1 = typeof $P0

    $I3 = isa $P1, "PMCProxy"
    ok ($I3, "object isa PMCProxy")
.end

.sub proxy_as_parent_of_class
    $P0 = get_class 'Hash'
    $P1 = subclass $P0, [ 'MyClass' ]
    $P2 = new [ 'MyClass' ]
    $P2['xyz'] = 'abc'
    $S1 = $P2['xyz']
    is ($S1, 'abc', "retrieve value from subclassed hash")
.end

.sub proxy_as_parent_of_class_with_new
    $P0 = get_class 'Hash'
    $P1 = subclass $P0, ['Foo';'Bar']
    $P2 = new ['Foo';'Bar']
    $S0 = typeof $P2
    is ($S0, 'Foo;Bar', 'object is typeof Foo;Bar')
.end

.sub proxy_no_method_conflict
    $P0 = new 'Complex'
    $P0['real'] = 1
    $P1 = $P0.'Complex'()
    $S0 = $P1
    is($S0, "1+0i", 'Complex method survived')
.end

.namespace ['Complex']
.sub 'Complex' :method :nsentry('Complex')
    .return (self)
.end

.HLL 'foo'

.sub proxy_no_invade
    .local pmc is
    is = get_root_global ['parrot'], 'is'

    $P0 = new 'Class'
    $I0 = isa $P0, 'Sub'
    $P1 = get_root_global ['foo'], 'Sub'
    $I1 = 0
    if null $P1 goto do_test
    inc $I1
do_test:
    is($I1, 0, 'No proxy in current HLL namespace, TT #715')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
