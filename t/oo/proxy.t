#! parrot
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
    .include 'include/test_more.pir'

    plan(9)

    typeof_a_low_level_object()
    typeof_a_high_level_object()
    typeof_a_class_object()
    proxy_as_parent_of_class()
    proxy_as_parent_of_class_with_new()

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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
