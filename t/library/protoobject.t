#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/protoobject.t - testing Protoobject.pir

=head1 SYNOPSIS

        % prove t/library/protoobject.t

=head1 DESCRIPTION

This test exercises the protoobject/Protomaker implementations.

=cut

.sub main :main
    load_bytecode 'Protoobject.pbc'

    .include 'test_more.pir'
    plan(13)

    test_basic_load()
    test_type_of_protoobject()
    test_type_of_ns_based_protoobject()
    test_protoobject_symbol_1()
    test_protoobject_symbol_2()
    test_protoobject_symbol_for_classes()
    test_new_subclass_for_classes()
    test_new_subclass_with_attrs()
    test_method_new_on_protoobject()
.end


.sub test_basic_load
    $P0 = get_hll_global 'Protomaker'
    $S0 = typeof $P0
    is($S0, 'Protomaker', 'basic load')
.end


.sub test_type_of_protoobject
    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass 'XYZ'
    $P2 = $P0.'new_proto'($P1)

    $S0 = typeof $P2
    is($S0, 'XYZ', 'type of protoobject')
.end


.sub test_type_of_ns_based_protoobject
    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass ['Foo';'Bar1']
    $P2 = $P0.'new_proto'($P1)

    $S0 = typeof $P2
    is($S0, 'Foo;Bar1', 'type of ns-based protoobject')
.end


.sub test_protoobject_symbol_1
    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass ['Foo';'Bar2']
    $P2 = $P0.'new_proto'($P1)

    $P2 = get_hll_global ['Foo'], 'Bar2'
    $S0 = typeof $P2
    is($S0, 'Foo;Bar2', 'protoobject symbol 1')
.end


.sub test_protoobject_symbol_2
    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass 'Foo'
    $P2 = $P0.'new_proto'($P1)

    $P2 = get_hll_global 'Foo'
    $S0 = typeof $P2
    is($S0, 'Foo', 'protoobject symbol 2')
.end


.sub test_protoobject_symbol_for_classes
    $P0 = get_hll_global 'Protomaker'
    $P1 = newclass 'Foo::Bar3'
    $P2 = $P0.'new_proto'($P1)

    $P2 = get_hll_global ['Foo'], 'Bar3'
    $S0 = typeof $P2
    is($S0, 'Foo::Bar3', 'protoobject symbol for :: classes')
.end


.sub test_new_subclass_for_classes
    $P0 = get_hll_global 'Protomaker'
    $P1 = get_class 'Hash'
    $P0.'new_subclass'($P1, 'Foo::Bar4')

    $P2 = new 'Foo::Bar4'
    $S0 = typeof $P2
    is($S0, 'Foo::Bar4', 'new_subclass for :: classes')

    $P2 = get_hll_global ['Foo'], 'Bar4'
    $S0 = typeof $P2
    is($S0, 'Foo::Bar4', 'new_subclass for :: classes')
.end


.sub test_new_subclass_with_attrs
    .local pmc protomaker, hashclass, attrs
    protomaker = get_hll_global 'Protomaker'
    hashclass = get_class 'Hash'
    attrs = split ' ', '$a $b $c $d'
    protomaker.'new_subclass'(hashclass, 'Foo::Bar', attrs :flat)

    .local pmc object, it
    object = new 'Foo::Bar'
    it = iter attrs
  iter_loop:
    unless it goto iter_end
    $P0 = shift it
    $S0 = $P0
    setattribute object, $S0, $P0
    $P1 = getattribute object, $S0
    is($P1, $P0,'new_subclass with attrs')
    goto iter_loop
  iter_end:
.end


.sub test_method_new_on_protoobject
    $P0 = newclass 'Foo1'

    .local pmc protomaker
    protomaker = get_hll_global 'Protomaker'
    protomaker.'new_proto'('Foo1')

    $P0 = get_hll_global 'Foo1'
    $P1 = $P0.'new'()
    $S0 = typeof $P1
    is($S0, 'Foo1', 'method "new" on protoobject')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
