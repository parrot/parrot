#! parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/mro-c3.t - test the C3 Method Resolution Order for Parrot OO

=head1 SYNOPSIS

    % prove t/oo/mro-c3.t

=head1 DESCRIPTION

Tests the C3 Method Resolution order for the OO implementation.

=cut

.namespace [ 'Methods' ]

.sub method_A :method
    .return('Method from A')
.end

.sub method_B :method
    .return('Method from B')
.end

.sub method_C :method
    .return('Method from C')
.end

.sub method_D :method
    .return('Method from D')
.end

.namespace []

.sub main :main
    .include 'test_more.pir'

    plan(12)
    $P0 = newclass [ 'Methods' ]

    single_parent()
    grandparent()
    multiple_inheritance()
    diamond_inheritance()
.end

.sub single_parent
    .local pmc A, B, M, methods

    M       = get_class [ 'Methods' ]
    methods = M.'methods'()

    A   = new 'Class'
    $P0 = methods['method_A']
    A.'add_method'('foo', $P0)
    A.'add_method'('bar', $P0)

    B   = new 'Class'
    $P0 = methods['method_B']
    B.'add_parent'(A)
    B.'add_method'('foo', $P0)

    $P0 = B.'new'()
    $S0 = $P0.'foo'()
    $S1 = $P0.'bar'()
    is($S0, 'Method from B', 'Single Parent - Method foo overloaded in B')
    is($S1, 'Method from A', 'Single Parent - Method bar inherited from A')
.end

.sub grandparent
    .local pmc A, B, C, M, methods

    M       = get_class [ 'Methods' ]
    methods = M.'methods'()

    A   = new 'Class'
    $P0 = methods['method_A']
    A.'add_method'('foo', $P0)
    A.'add_method'('bar', $P0)
    A.'add_method'('baz', $P0)

    B   = new 'Class'
    $P0 = methods['method_B']
    B.'add_parent'(A)
    B.'add_method'('foo', $P0)
    B.'add_method'('bar', $P0)

    C   = new 'Class'
    $P0 = methods['method_C']
    C.'add_parent'(B)
    C.'add_method'('foo', $P0)

    $P0 = C.'new'()
    $S0 = $P0.'foo'()
    $S1 = $P0.'bar'()
    $S2 = $P0.'baz'()
    is($S0, 'Method from C', 'Grandparent - Method foo overloaded in C')
    is($S1, 'Method from B', 'Grandparent - Method bar inherited from B')
    is($S2, 'Method from A', 'Grandparent - Method baz inherited from A')
.end

.sub multiple_inheritance
    .local pmc A, B, C, M, methods

    M       = get_class ['Methods']
    methods = M.'methods'()

    A   = newclass 'MIA'
    $P0 = methods['method_A']
    A.'add_method'('foo', $P0)
    A.'add_method'('bar', $P0)
    A.'add_method'('baz', $P0)

    B   = newclass 'MIB'
    $P0 = methods['method_B']
    B.'add_method'('foo', $P0)
    B.'add_method'('bar', $P0)

    C   = newclass 'MIC'
    $P0 = methods['method_C']
    C.'add_parent'(B)
    C.'add_parent'(A)
    C.'add_method'('foo', $P0)

    $P0 = C.'new'()
    $S0 = $P0.'foo'()
    $S1 = $P0.'bar'()
    $S2 = $P0.'baz'()
    is($S0, 'Method from C', 'Multiple Inheritance - Method foo overloaded in C')
    is($S1, 'Method from B', 'Multiple Inheritance - Method bar inherited from B')
    is($S2, 'Method from A', 'Multiple Inheritance - Method baz inherited from A')
.end

.sub diamond_inheritance
    .local pmc A, B, C, D, M, methods

    M       = get_class ['Methods']
    methods = M.'methods'()

    A   = newclass 'DIA'
    $P0 = methods['method_A']
    A.'add_method'('foo', $P0)
    A.'add_method'('bar', $P0)
    A.'add_method'('baz', $P0)
    A.'add_method'('wag', $P0)

    B   = newclass 'DIB'
    $P0 = methods['method_B']
    B.'add_parent'(A)
    B.'add_method'('foo', $P0)
    B.'add_method'('bar', $P0)
    B.'add_method'('baz', $P0)

    C   = newclass 'DIC'
    $P0 = methods['method_C']
    C.'add_parent'(A)
    C.'add_method'('foo', $P0)
    C.'add_method'('bar', $P0)

    D   = newclass 'DID'
    $P0 = methods['method_D']
    D.'add_parent'(C)
    D.'add_parent'(B)
    D.'add_method'('foo', $P0)

    $P0 = D.'new'()
    $S0 = $P0.'foo'()
    $S1 = $P0.'bar'()
    $S2 = $P0.'baz'()
    $S3 = $P0.'wag'()
    is($S0, 'Method from D', 'Diamond Inheritance - Method foo overloaded in D')
    is($S1, 'Method from C', 'Diamond Inheritance - Method bar inherited from C')
    is($S2, 'Method from B', 'Diamond Inheritance - Method baz inherited from B')
    is($S3, 'Method from A', 'Diamond Inheritance - Method wag inherited from A')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
