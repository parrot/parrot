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

.sub main :main
    .include 'test_more.pir'

    plan(13)

    single_parent()
    grandparent()
    multiple_inheritance()
    diamond_inheritance()
    merge_two_pairs()
.end

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

.sub single_parent
    .local pmc A, B

    A = new 'Class'
    $P0 = get_global 'method_A'
    A.'add_method'('foo', $P0)
    A.'add_method'('bar', $P0)

    B = new 'Class'
    B.'add_parent'(A)
    $P0 = get_global 'method_B'
    B.'add_method'('foo', $P0)

    $P0 = B.'new'()
    $S0 = $P0.'foo'()
    $S1 = $P0.'bar'()
    is($S0, 'Method from B', 'Single Parent - Method foo overloaded in B')
    is($S1, 'Method from A', 'Single Parent - Method bar inherited from A')
.end

.sub grandparent
    .local pmc A, B, C

    A = new 'Class'
    $P0 = get_global 'method_A'
    A.'add_method'('foo', $P0)
    A.'add_method'('bar', $P0)
    A.'add_method'('baz', $P0)

    B = new 'Class'
    B.'add_parent'(A)
    $P0 = get_global 'method_B'
    B.'add_method'('foo', $P0)
    B.'add_method'('bar', $P0)

    C = new 'Class'
    C.'add_parent'(B)
    $P0 = get_global 'method_C'
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
    .local pmc A, B, C

    A = newclass 'MIA'
    $P0 = get_global 'method_A'
    A.'add_method'('foo', $P0)
    A.'add_method'('bar', $P0)
    A.'add_method'('baz', $P0)

    B = newclass 'MIB'
    $P0 = get_global 'method_B'
    B.'add_method'('foo', $P0)
    B.'add_method'('bar', $P0)

    C = newclass 'MIC'
    C.'add_parent'(B)
    C.'add_parent'(A)
    $P0 = get_global 'method_C'
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
    .local pmc A, B, C, D

    A = newclass 'DIA'
    $P0 = get_global 'method_A'
    A.'add_method'('foo', $P0)
    A.'add_method'('bar', $P0)
    A.'add_method'('baz', $P0)
    A.'add_method'('wag', $P0)

    B = newclass 'DIB'
    B.'add_parent'(A)
    $P0 = get_global 'method_B'
    B.'add_method'('foo', $P0)
    B.'add_method'('bar', $P0)
    B.'add_method'('baz', $P0)

    C = newclass 'DIC'
    C.'add_parent'(A)
    $P0 = get_global 'method_C'
    C.'add_method'('foo', $P0)
    C.'add_method'('bar', $P0)

    D = newclass 'DID'
    D.'add_parent'(C)
    D.'add_parent'(B)
    $P0 = get_global 'method_D'
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

# See TT#1426
.sub merge_two_pairs
    .local pmc C, A, B

    push_eh test_fail

    C = newclass 'TPC'
    $P0 = get_global 'method_C'
    C.'add_method'('bar', $P0)

    B = newclass 'TPB'
    B.'add_parent'(C)
    $P0 = get_global 'method_B'
    B.'add_method'('bar', $P0)

    A = newclass 'TPA'
    A.'add_parent'(C)
    A.'add_parent'(B)
    $P0 = get_global 'method_A'
    A.'add_method'('foo', $P0)


    $P0 = A.'new'()
    $S0 = $P0.'bar'()
    is($S0, 'Method from B', 'Merge Two Pairs - Method A.bar added from B')

    .return ()

test_fail:
    pop_eh
    todo(0, 'Merge Two Pairs - Method A.bar added from B', 'See TT#1426')
.end
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
