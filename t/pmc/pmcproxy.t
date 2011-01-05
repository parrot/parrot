#!./parrot
# Copyright (C) 2007-2008, Parrot Foundation.

=head1 NAME

t/pmc/pmcproxy.t - test the PMCProxy PMC

=head1 SYNOPSIS

    % prove t/pmc/pmcproxy.t

=head1 DESCRIPTION

Tests the PMCProxy PMC.

=cut

.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'
    plan(50)

    new_tests()
    get_class_tests()
    name_and_namespace_tests()
    method_introspection_tests()
    parent_introspection_tests()
    new_creates_pmc()
    add_pmcproxy_as_parent()
    non_vtable_method_override()
    vtable_method_override()
    self_calls_overridden_methods()
    get_class_and_typeof_return_same_pmcproxy()
    inspect_pmcproxy()
.end

.sub new_tests
    new $P0, ['PMCProxy']
    ok(1, "new PMCProxy didn't explode")
    isa_ok($P0, "PMCProxy")

    $I0 = isa $P0, 'Foo'
    is($I0, 0, "non-default isa on PMCProxy works")

    .local pmc eh
    eh = new ['ExceptionHandler'], .EXCEPTION_INVALID_OPERATION
    set_label eh, catch
    push_eh eh
    $I0 = 1
    new $P0, ['PMCProxy'], -1
    $I0 = 0
    goto check
  catch:
    finalize eh
  check:
    pop_eh
    is($I0, 1, 'Attempt to proxy invalid type throws appropriately')
.end


.sub get_class_tests
    .local int is_ok
    $P0 = get_class 'NameSpace'
    ok(1, "get_class returned something")
    isa_ok($P0, "PMCProxy")
.end


.sub name_and_namespace_tests
    $P0 = get_class 'NameSpace'
    ok(1, "get_class returned something")
    $S1 = $P0.'name'()
    is($S1, 'NameSpace', 'got name')

    $P1 = $P0.'get_namespace'()
    is($P1, 'NameSpace', 'got namespace')
.end


.sub method_introspection_tests
    $P0 = get_class 'NameSpace'
    ok(1, "get_class returned something")

    $P1 = $P0.'methods'()
    ok(1, "got methods")

    $I0 = exists $P1['export_to']
    is($I0, 1, "export_to method in the list")

    $I0 = exists $P1['get_name']
    is($I0, 1, "get_name method in the list")
.end

.sub parent_introspection_tests
    $P0 = get_class 'PMCProxy'

    $P1 = new ['FixedPMCArray']
    $P1 = $P0.'parents'()
    ok(1, "got parents")

    $P2 = new ['Class']
    $P2 = $P1[0]

    $S0 = $P2.'inspect'('name')
    is($S0, 'Class', 'PMCProxy inherits from Class')
.end


.sub new_creates_pmc
    $P0 = get_class 'ResizablePMCArray'
    ok(1, "get_class returned something")

    $P1 = $P0.'new'()
    ok(1, "created a PMC")
    isa_ok($P1, 'ResizablePMCArray', 'created the Right Thing')
.end


.sub add_pmcproxy_as_parent
    $P0 = new ['Class']
    ok(1, 'created a PDD15 class')

    $P1 = get_class 'Hash'
    ok(1, 'got the PMCProxy for Hash')

    addparent $P0, $P1
    ok(1, "added Hash's PMCProxy as a parent of the PDD15 class")

    $P2 = $P0.'new'()
    ok(1, 'instantiated the class')
.end


.sub non_vtable_method_override
    $P0 = new ['Class']
    ok(1, 'ok 1 - created a PDD15 class')

    $P1 = get_class 'Class'
    ok(1, 'got the PMCProxy for Class')

    addparent $P0, $P1
    ok(1, "added Class's PMCProxy as a parent of the PDD15 class")

    #We'll override the add_role method.
    $P2 = get_global 'no_add_role_non_vtable'
    $P0.'add_method'('add_role', $P2)

    $P2 = $P0.'new'()
    ok(1, 'instantiated the class')

    $P2.'add_attribute'('foo')
    ok(1, 'called the add_attribute method of the PMC parent')

    $P3 = new ['Role']
    $P2.'add_role'($P3)
    ok(1, 'done with method call overridding')
.end

.sub no_add_role_non_vtable
    #XXX: If this fails to be overridden, the only indicator will be
    #that the wrong number of tests ran.  It'd be better if a test tested that
    #this sub was called.  The same applies to vtable_method_override.
    ok(1, 'overridden add_role method called')
.end


.sub vtable_method_override
    $P0 = new ['Class']
    ok(1, 'created a PDD15 class')

    $P1 = get_class 'Class'
    ok(1, 'got the PMCProxy for Class')

    addparent $P0, $P1
    ok(1, "added Class's PMCProxy as a parent of the PDD15 class")

    #We will override the add_role vtable
    $P2 = get_global 'no_add_role'
    $P0.'add_vtable_override'('add_role', $P2)
    ok(1, 'overrode a vtable')

    $P2 = $P0.'new'()
    ok(1, 'instantiated the class')

    addattribute $P2, 'foo'
    ok(1, 'called the add_attribute v-table method of the PMC parent')

    $P3 = inspect $P2, "attributes"
    $I0 = elements $P3
    is($I0, 1, "the attribute was actually added")

    $P3 = new ['Role']
    addrole $P2, $P3
    ok(1, 'done with vtable override test')
.end
.sub no_add_role_vtable
    ok(1, 'overridden add_role v-table method called')
.end


.sub self_calls_overridden_methods

    $P0 = new ['Class']
    ok(1, 'created a PDD15 class')

    $P1 = get_class 'Class'
    ok(1, 'got the PMCProxy for Class')

    addparent $P0, $P1
    ok(1, "added Class's PMCProxy as a parent of the PDD15 class")

    #We will override the inspect_str vtable
    $P2 = get_global 'always42'
    $P0.'add_vtable_override'('inspect_str', $P2)
    ok(1, 'overrode inspect_str method')

    $P2 = $P0.'new'()
    ok(1, 'instantiated the class')

    $P3 = $P2.'inspect'('methods')
    is($P3, 42, "the magic overriding sub was called")
    ok(1, 'Called non-overridden method, which called overridden vtable')
.end
.sub always42 :method :nsentry('always42')
    .param string what
    $P0 = new ['Integer']
    $P0 = 42
    .return($P0)
.end


.sub get_class_and_typeof_return_same_pmcproxy
    $P0 = get_class 'Integer'
    $P1 = new $P0
    $P2 = typeof $P1

    $I0 = issame $P0, $P2
    is($I0, 1, "PMCs made with 'new' and 'typeof' are the same")

    $P3 = typeof $P1
    $P4 = typeof $P1

    $I0 = issame $P3, $P4
    is($I0, 1, "PMCs have the same types")
    is($P3, "Integer", "P3 is an Integer")
    is($P4, "Integer", "P4 is also an Integer")
.end

.sub inspect_pmcproxy
   $P0 = new ['PMCProxy']
   $P1 = new ['Hash']
   $P0 = get_class 'Integer'
   $P1 = inspect $P0

   $S0 = $P1['name']
   is($S0, 'Integer', 'Integer name inspected correctly')

   $S1 = $P1['namespace']
   is($S1, 'Integer', 'Integer namespace inspected correctly')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
