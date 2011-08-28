#!./parrot
# Copyright (C) 2007-2010, Parrot Foundation.

=head1 NAME

t/oo/new.t - Test OO instantiation

=head1 SYNOPSIS

    % prove t/oo/new.t

=head1 DESCRIPTION

Tests OO features related to instantiating new objects.

=cut

.sub main :main
    .include 'except_types.pasm'
    .include 'test_more.pir'
    plan(111)

    instantiate_from_class_object()
    manually_create_anonymous_class_object()
    manually_create_named_class_object()
    instantiate_from_class_object_method()
    instantiate_from_string_name()
    instantiate_from_string_register_name()
    instantiate_from_string_PMC_name()
    instantiate_from_key_name()
    instantiate_from_key_PMC_name()
    create_and_instantiate_from_array_of_names()
    only_string_arrays_work_for_creating_classes()
    instantiate_from_class_object_with_init()
    instantiate_from_string_name_with_init()
    instantiate_from_string_register_name_with_init()
    instantiate_from_string_PMC_name_with_init()
    instantiate_from_array_of_names_with_init()
    instantiate_from_key_name_with_init()
    create_class_namespace_initializer()
    regression_test_instantiate_class_within_different_namespace()
    get_class_retrieves_a_high_level_class_object()
    get_class_retrieves_a_proxy_class_object()
    get_class_retrieves_a_class_object_that_doesnt_exist()
    instantiate_class_from_invalid_key()
.end


#
# Utility sub
#
.sub _test_instance
    .param pmc obj
    .param string in_str

    # Set up local variables
    .local pmc key_pmc
    .local string class_name

    key_pmc = new 'Key'
    $P0 = split ' ', in_str
    $S0 = shift $P0
    $I1 = 1
    key_pmc    = $S0
    class_name = $S0

  LOOP:
    $I0 = elements $P0
    if $I0 == 0 goto BEGIN_TEST
    $S1 = shift $P0
    $P1 = new 'Key'
    $P1 = $S1
    push key_pmc, $P1
    class_name = concat class_name, ';'
    class_name = concat class_name, $S1
    $I1 += 1
    goto LOOP

    # Start testing
  BEGIN_TEST:
    .local string typeof_message
    typeof_message = concat 'New instance is of type: ', class_name
    $S1 = typeof obj
    is($S1, class_name, typeof_message)

    isa_ok(obj, 'Object')

    .local string keypmc_message
    $S2 = get_repr key_pmc
    keypmc_message = concat 'The object isa ', $S2
    $I2 = isa obj, key_pmc
    ok($I2, keypmc_message)

    unless $I1 == 1 goto END_TEST
    isa_ok(obj, class_name)

  END_TEST:
    .return()
.end


#############################################################################


.sub instantiate_from_class_object
    ok(1, "Instantiate from class object")
    $P1 = newclass 'Foo1'
    $S1 = typeof $P1
    is($S1, 'Class', '`newclass "Foo"` creates a Class PMC')
    isa_ok($P1, 'Class')

    $P2 = new $P1
    _test_instance($P2, 'Foo1')
.end


.sub manually_create_anonymous_class_object
    ok(2, "Manually create anonymous class object")
    $P1 = new 'Class'
    $S1 = typeof $P1
    is($S1, 'Class', 'New anonymous class creates a Class PMC')
    isa_ok($P1, 'Class')

    $P2 = new $P1
    $S1 = typeof $P2
    is($S1, '', 'New instance is of type ""')
    isa_ok($P2, 'Object')

    $I3 = isa $P2, ''
    is($I3, 0, '"isa" will not match an empty type')
    $I3 = isa $P2, 'Foo'
    is($I3, 0, '"isa" will not match a random type')
.end


.sub manually_create_named_class_object
    ok(3, "Manually create named class object")
    $P1 = new 'Class'
    $P1.'name'('Foo2')
    $S1 = typeof $P1
    is($S1, 'Class', 'new named class creates a "Class" PMC')
    isa_ok($P1, 'Class')

    $P2 = new $P1
    _test_instance($P2, 'Foo2')
.end


.sub instantiate_from_class_object_method
    ok(4, "Instantiate from class object 'new' method")
    $P1 = newclass 'Foo3'

    $P2 = $P1.'new'()
    _test_instance($P2, 'Foo3')
.end


.sub instantiate_from_string_name
    ok(5, "Instantiate from string name")
    $P1 = newclass 'Foo4'

    $P2 = new 'Foo4'
    _test_instance($P2, 'Foo4')
.end


.sub instantiate_from_string_register_name
    ok(6, "Instantiate from string register name")
    $P1 = newclass 'Foo5'

    $S1 = 'Foo5'
    $P2 = new $S1
    _test_instance($P2, 'Foo5')
.end


.sub instantiate_from_string_PMC_name
    ok(7, "Instantiate from string PMC name")
    $P1 = newclass 'Foo6'

    $P3 = new 'String'
    $P3 = 'Foo6'
    $P2 = new $P3
    _test_instance($P2, 'Foo6')
.end


.sub instantiate_from_key_name
    ok(8, "Instantiate from Key name")
    $P1 = newclass ['Foo';'Bar1']
    $S1 = typeof $P1
    is($S1, 'Class', "`newclass ['Foo';'Bar1']` creates a Class PMC")
    isa_ok($P1, 'Class')

    $P2 = new $P1
    _test_instance($P2, 'Foo Bar1')
.end


.sub instantiate_from_key_PMC_name
    ok(9, "Instantiate from Key PMC name")
    $P1 = newclass ['Foo';'Bar2']

    $P3 = new 'Key'
    $P3 = 'Foo'
    $P4 = new 'Key'
    $P4 = 'Bar2'
    push $P3, $P4

    $P2 = new $P3
    _test_instance($P2, 'Foo Bar2')
.end


.sub create_and_instantiate_from_array_of_names
    ok(10, "Create and instantiate from ResizableStringArray")
    $P0 = split ' ', 'Foo Bar3'
    $P1 = newclass $P0
    $S1 = typeof $P1
    is($S1, 'Class', "`newclass some_string_array` creates a Class PMC")
    isa_ok($P1, 'Class')

    $P2 = new $P0
    _test_instance($P2, 'Foo Bar3')
.end


.sub only_string_arrays_work_for_creating_classes
    ok(11, 'Create a class via a ResizablePMCArray')
    .local pmc eh
    .local string message
    $P0  = new 'ResizablePMCArray'
    $P10 = new 'String'
    $P10 = 'Foo'
    $P11 = new 'String'
    $P11 = 'Bar4'
    $P0.'push'($P10)
    $P0.'push'($P11)

  try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_INVALID_OPERATION)
    set_label eh, catch

    push_eh eh
    $P1 = newclass $P0
    $I0 = 1
    goto finally

  catch:
    .local pmc exception
    .get_results(exception)
    message = exception['message']
    $I0 = 0

  finally:
    pop_eh
    nok($I0, "Exception caught for ...")
    is(message, 'Invalid class name key in init_pmc for Class', 'Invalid class name key')
.end


.sub instantiate_from_class_object_with_init
    ok(12, 'Instantiate from Class object, with init')
    $P1 = newclass 'Foo7'
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'data for Foo7'
    $P3['data'] = $P4

    $P2 = new $P1, $P3
    _test_instance($P2, 'Foo7')

    $P5 = getattribute $P2, 'data'
    is($P5, 'data for Foo7', 'class attribute retrieved via the instance')
.end


.sub instantiate_from_string_name_with_init
    ok(13, 'Instantiate from string name, with init')
    $P1 = newclass 'Foo8'
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'data for Foo8'
    $P3['data'] = $P4

    $P2 = new 'Foo8', $P3
    _test_instance($P2, 'Foo8')

    $P5 = getattribute $P2, 'data'
    is($P5, 'data for Foo8', 'class attribute retrieved via the instance')
.end


.sub instantiate_from_string_register_name_with_init
    ok(14, 'Instantiate from string register name, with init')
    $P1 = newclass 'Foo9'
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'data for Foo9'
    $P3['data'] = $P4

    $S1 = 'Foo9'
    $P2 = new $S1, $P3
    _test_instance($P2, 'Foo9')

    $P5 = getattribute $P2, 'data'
    is($P5, 'data for Foo9', 'class attribute retrieved via the instance')
.end


.sub instantiate_from_string_PMC_name_with_init
    ok(15, 'Instantiate from string PMC name, with init')
    $P1 = newclass 'Foo10'
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'data for Foo10'
    $P3['data'] = $P4

    $P6 = new 'String'
    $P6 = 'Foo10'
    $P2 = new $P6, $P3
    _test_instance($P2, 'Foo10')

    $P5 = getattribute $P2, 'data'
    is($P5, 'data for Foo10', 'class attribute retrieved via the instance')
.end


.sub instantiate_from_array_of_names_with_init
    ok(16, 'Instantiate from string array, with init')
    $P0 = split ' ', 'Foo Bar5'
    $P1 = newclass $P0
    addattribute $P1, 'data'
    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'data for Foo;Bar5'
    $P3['data'] = $P4

    $P2 = new $P0, $P3

    $S1 = typeof $P2
    _test_instance($P2, 'Foo Bar5')

    $P5 = getattribute $P2, 'data'
    is($P5, 'data for Foo;Bar5', 'class attribute retrieved via the instance')
.end


.sub instantiate_from_key_name_with_init
    ok(17, 'Instantiate from Key name, with init')
    $P1 = newclass ['Foo';'Bar6']
    addattribute $P1, 'data'

    $P3 = new 'Hash'
    $P4 = new 'String'
    $P4 = 'data for Foo;Bar6'
    $P3['data'] = $P4

    $P2 = new ['Foo';'Bar6'], $P3
    _test_instance($P2, 'Foo Bar6')

    $P5 = getattribute $P2, 'data'
    is($P5, 'data for Foo;Bar6', 'class attribute retrieved via the instance')
.end


.sub create_class_namespace_initializer
    .local pmc ns
    ns = get_namespace ['Foo';'Bar7']
    $P0 = new 'Class', ns

    $P1 = new ['Foo';'Bar7']
    $S0 = $P1.'blue'()
    is($S0, 'foo_bar7 blue', 'Create class namespace initializer')
.end

.namespace [ 'Foo';'Bar7' ]
.sub blue :method
    .return('foo_bar7 blue')
.end

.namespace []


.sub regression_test_instantiate_class_within_different_namespace
    $P0 = newclass 'Foo11'
    $P0 = newclass 'Bar11'

    $P1 = new 'Foo11'
    $S0 = $P1.'blue'()
    is($S0, 'foo11 blue bar11 blue', 'Regression test: instantiate class within different namespace')
.end

.namespace [ 'Foo11' ]
.sub blue :method
    $P0 = new 'Bar11'
    $S0 = $P0.'blue'()
    $S0 = concat 'foo11 blue ', $S0
    .return($S0)
.end

.namespace [ 'Bar11' ]
.sub blue :method
    .return('bar11 blue')
.end

.namespace []


.sub get_class_retrieves_a_high_level_class_object
    ok(20, 'get_class retrieves a high level class object')
    $P0 = newclass 'Foo12'
    $S1 = typeof $P0
    is($S1, 'Class',"`newclass 'Foo12' returns a Class PMC`")

    $P1 = get_class 'Foo12'
    $S1 = typeof $P1
    is($S1, 'Class',"`get_class 'Foo12' returns a Class PMC`")

    $P2 = new $P1
    _test_instance($P2, 'Foo12')
.end


.sub get_class_retrieves_a_proxy_class_object
    ok(21, 'get_class retrieves a proxy class object')
    $P1 = get_class 'String'
    $S1 = typeof $P1
    is($S1, 'PMCProxy', "`get_class 'String'` returns a PMCProxy PMC")

    $P2 = new $P1
    $S1 = typeof $P2
    is($S1, 'String', 'Instantiating the proxy returns a String PMC')
.end


.sub get_class_retrieves_a_class_object_that_doesnt_exist
    ok(22, 'get_class retrieves a class object that does not exist')
    .local int murple_not_defined
    murple_not_defined = 1
    $P1 = get_class 'Murple'
    if null $P1 goto not_defined
    murple_not_defined = 0

  not_defined:
    ok(murple_not_defined, '"Murple" class is not defined')
.end


.sub instantiate_class_from_invalid_key
    ok(23, 'Instantiate a class from invalid Key PMC')
    .local pmc eh
    .local string message

  try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_NO_CLASS)
    set_label eh, catch

    push_eh eh
    $P0 = new [ 'Foo'; 'Bar'; 'Baz' ]
    $I0 = 1
    goto finally

  catch:
    .local pmc exception
    .get_results(exception)
    message = exception['message']
    $I0 = 0

  finally:    pop_eh
    nok($I0, 'Exception caught for ...')
    is(message, "Class '[ 'Foo' ; 'Bar' ; 'Baz' ]' not found", 'Class not found')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
