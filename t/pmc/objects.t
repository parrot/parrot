#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/objects.t - Objects

=head1 SYNOPSIS

    % prove t/pmc/objects.t

=head1 DESCRIPTION

Tests the object/class subsystem.

=cut

.sub main :main
    .include 'test_more.pir'
    .include "iglobals.pasm"
    .include "interpinfo.pasm"

    plan(194)

    get_classname_from_class()
    test_get_class()
    test_isa()
    does_scalar()
    does_array()
    new_object()
    new_object__isa_test()
    new_object__classname()
    isa_subclass()
    isa_subclass__objects()
    test_addmethod()
    test_addattribute()
    addattribute_subclass()
    addattribute_subclass__same_name()
    set_and_get_object_attribs()
    set_and_get_multiple_object_attribs()
    attribute_values_are_specific_to_objects()
    attribute_values_and_subclassing()
    attribute_values_and_subclassing_2()
    PMC_as_classes__overridden_mmd_methods()
    typeof_class()
    typeof_objects()
    multiple_inheritance__with_attributes()
    attributes_two_levels_of_inheritance()
    class_op_test()
    anon_subclass_has_no_name()
    get_attrib_by_name()
    get_attrib_by_name_subclass()
    set_attrib_by_name_subclass()
    PMC_as_classes()
    PMC_as_classes__subclass()
    PMC_as_classes__instantiate()
    PMC_as_classes__methods()
    PMC_as_classes__mmd_methods()
    PMC_as_classes__derived_1()
    PMC_as_classes__derived_2()
    PMC_as_classes__derived_3()
    subclassing_Class()
    namespace_vs_name()
    multiple_anon_classes()
    subclassed_Integer_bug()
    equality_of_subclassed_Integer()
    short_name_attributes()
    init_with_and_without_arg()
    newclass_bracket_parsing()
    verify_namespace_types()
    verify_data_type()
    new_keyed()
    new_keyed_2()
    new_keyed_3()
    subclass_keyed()
    test_class_name_multipart_name()
    test_get_class_multipart_name()
    isa_bug()
    new_nested_ordering()
    vtable_override_once_removed()
    vtable_fails_for_subclasses_of_core_classes()
    super___init_called_twice()
    using_class_object_from_typeof_op_with_new()
    setting_non_existent_attribute()
    setting_non_existent_attribute_by_name()
    getting_null_attribute()
    getting_non_existent_attribute()
    addparent_exceptions_1()
    addparent_exceptions_2()
    subclassing_a_non_existent_class()
    anon_subclass_of_non_existent_class()
    addattribute_duplicate()
    wrong_way_to_create_new_objects()
    attribute_values__subclassing_access_meths()
    attribute_values__inherited_access_meths()

    # END_OF_TESTS
.end

.sub get_classname_from_class
    newclass $P1, "Foo5"
    set $S0, $P1
    is( $S0, "Foo5", "got classname Foo5" )

    subclass $P2, $P1, "Bar5"
    set $S1, $P2
    is( $S1, "Bar5", "got subclass Bar5" )

    subclass $P3, "Foo5", "Baz5"
    set $S2, $P3
    is( $S2, "Baz5", "got subclass Baz5" )
.end

.sub test_get_class
    newclass $P1, "Foo6"
    get_class $P2, "Foo6"
    set $S2, $P2
    is( $S2, "Foo6", 'get_class for Foo6' )

    subclass $P3, $P1, "FooBar6"
    get_class $P4, "FooBar6"
    set $S4, $P4
    is( $S4, 'FooBar6', 'get_class for FooBar6' )

    get_class $P3, "NoSuch6"
    isnull $I0, $P3
    ok( $I0, "no class for 'NoSuch6'" )
.end

.sub test_isa
    new $P1, ['Boolean']

    isa $I0, $P1, "Boolean"
    is( $I0, 1, 'Boolean isa Boolean' )

    isa $I0, $P1, "Bool"
    is( $I0, 0, 'Boolean !isa Bool' )

    isa $I0, $P1, "scalar"
    is( $I0, 1, 'Boolean isa scalar' )

    isa $I0, $P1, "calar"
    is( $I0, 0, 'Boolean !isa calar' )

    isa $I0, $P1, "Integer"
    is( $I0, 1, 'Boolean isa Integer' )

    isa $I0, $P1, "Integ"
    is( $I0, 0, 'Boolean !isa Integ' )

    isa $I0, $P1, "eger"
    is( $I0, 0, 'Boolean !isa eger' )

    isa $I0, $P1, " "
    is( $I0, 0, 'Boolean !isa " "' )

    isa $I0, $P1, ""
    is( $I0, 0, 'Boolean !isa ""' )

    null $S0
    isa $I0, $P1, $S0
    is( $I0, 0, 'Boolean !isa null $S0' )

    set $S0, "scalar"
    isa $I0, $P1, $S0
    is( $I0, 1, 'Boolean isa scalar $S0' )
.end

.sub does_scalar
    new $P1, ['Boolean']

    does $I0, $P1, "Boolean"
    is( $I0, 0, 'Boolean !does Boolean' )

    does $I0, $P1, "Bool"
    is( $I0, 0, 'Boolean !does Bool' )

    does $I0, $P1, "scalar"
    is( $I0, 1, 'Boolean does scalar' )
.end

.sub does_array
    new $P1, ['OrderedHash']

    does $I0, $P1, "Boolean"
    is( $I0, 0, 'OrderedHash !does Boolean' )

    does $I0, $P1, "Bool"
    is( $I0, 0, 'OrderedHash !does Bool' )

    does $I0, $P1, "hash"
    is( $I0, 1, 'OrderedHash does hash' )

    does $I0, $P1, "array"
    is( $I0, 1, 'OrderedHash does array' )
.end

.sub new_object
    newclass $P1, "Foo7"
    new $P2, "Foo7"
    ok( 1, 'created new object from Foo7 class' )
.end

.sub new_object__isa_test
    newclass $P1, "Foo8"
    new $P2, $P1
    ok( 1, 'created new object from Foo8 class' )

    isa $I0, $P2, "Foo8"
    ok( $I0, 'new object isa Foo8' )
.end

.sub new_object__classname
    newclass $P1, "Foo9"
    new $P2, $P1
    set $S0, $P1    # class
    is( $S0, "Foo9", 'new object from Foo9 class as a string is Foo9' )

    typeof $S0, $P2 # object
    is( $S0, 'Foo9', 'typeof obj is Foo9' )

    class $P3, $P1
    set $S0, $P1    # class
    is( $S0, 'Foo9', 'class of obj is Foo9' )

    typeof $S0, $P2 # object
    is( $S0, 'Foo9', 'typeof obj is Foo9' )

.end

.sub isa_subclass
    newclass $P1, "Foo10"
    subclass $P2, $P1, "Bar10"

    isa_ok( $P2, "Foo10", 'newclass isa Foo10' )
    isa_ok( $P2, "Bar10", 'new subclass isa Bar10' )
    isa_ok( $P2, "Foo10", 'new subclass isa parent' )
    isa_ok( $P2, "Class", 'new subclass isa Class' )

    isa $I0, $P2, "Object"
    is( $I0, 0, 'new subclass !isa Object' )
.end

.sub isa_subclass__objects
    newclass $P3, "Foo30"
    subclass $P4, $P3, "Bar30"
    $P1 = $P3.'new'()
    $P2 = $P4.'new'()

    isa_ok( $P1, "Foo30",  'obj isa its class' )
    isa_ok( $P2, "Bar30",  'obj isa its class' )
    isa_ok( $P2, "Foo30",  'obj isa its parent class' )
    isa_ok( $P2, "Object", 'obj isa Object' )
    isa_ok( $P2, "Class",  'obj isa Class' )
.end

.sub test_addmethod
    newclass $P0, 'Foo31'
    $P2 = get_hll_global 'sayFoo31'

    # add a method BEFORE creating a Foo object
    addmethod $P0, 'foo31', $P2
    $P1 = new 'Foo31'
    $P1.'foo31'()

    # get a method from some other namespace
    $P2 = get_hll_global ['Bar31'], 'sayBar31'

    # add a method AFTER creating the object
    addmethod $P0, 'bar31', $P2
    $P1.'bar31'()
.end

.sub sayFoo31
    ok( 1, 'called method added before creating obj' )
.end

.namespace ['Bar31']
.sub sayBar31
    ok( 1, 'called method added after created obj' )
.end

.namespace [] # Reset to root namespace for next test

.sub test_addattribute
    newclass $P1, "Foo11"

    addattribute $P1, "foo_i"
    ok( 1, 'addattribute did not blow up' )

    set $S0, $P1
    is( $S0, "Foo11", '$P1 is still the same class as PMC' )

    # Check that we can add multiple attributes
    set $I0, 0
l1:
    set $S0, $I0
    addattribute $P1, $S0
    inc $I0
    lt $I0, 1000, l1
    ok( 1, 'addattribute 1000x without blow up' )
.end

.sub addattribute_subclass
    newclass $P1, "Foo12"
    addattribute $P1, "foo_i"
    ok( 1, 'addattribute to Foo12' )

    subclass $P2, $P1, "Bar12"
    addattribute $P2, "bar_i"
    ok( 1, 'addattribute to subclass of Foo12' )
.end

.sub addattribute_subclass__same_name
    newclass $P1, "Foo32"
    addattribute $P1, "i"
    addattribute $P1, "j"

    subclass $P2, $P1, "Bar32"
    addattribute $P2, "j"
    addattribute $P2, "k"

    ok( 1, 'created class and subclass and added attributes' )

    .local pmc o
    o = $P2.'new'()
    $P0 = getattribute o, 'i'
    is( $P0, 'Foo32.i', 'parent attrib initialized in init' )
    $P0 = getattribute o, ['Foo32'], 'j'
    is( $P0, 'Foo32.j', 'parent attrib initialized in init' )
    $P0 = getattribute o, ['Bar32'], 'j'
    is( $P0, 'Bar32.j', 'subclass attrib initialized in init' )
    $P0 = getattribute o, 'k'
    is( $P0, 'Bar32.k', 'subclass attrib initialized in init' )

    $P0 = getattribute o, 'i'
    is( $P0, 'Foo32.i', 'parent attrib init-ed' )
    $P0 = getattribute o, ['Foo32'], "j"
    is( $P0, 'Foo32.j', 'parent attrib init-ed' )
    $P0 = getattribute o, 'j'
    is( $P0, 'Bar32.j', 'subclass attrib returned over parent' )
    $P0 = getattribute o, 'k'
    is( $P0, 'Bar32.k', 'subclass attrib init-ed' )
.end

.namespace ['Bar32']

.sub init :vtable :method
    $P0 = new ['String']
    $P0 = 'Foo32.i'
    setattribute self, ['Foo32'], "i", $P0
    $P0 = new ['String']
    $P0 = 'Foo32.j'
    setattribute self, ["Foo32"], "j", $P0
    $P0 = new ['String']
    $P0 = 'Bar32.j'
    setattribute self, ["Bar32"], "j", $P0
    $P0 = new ['String']
    $P0 = 'Bar32.k'
    setattribute self, ["Bar32"], "k", $P0
.end

.namespace []       # Reset to root namespace for next test

.sub set_and_get_object_attribs
    newclass $P1, "Foo13"
    addattribute $P1, "i"
    new $P2, $P1

    new $P3, ['Integer']
    set $P3, 1024
    setattribute $P2, "i", $P3

    new $P4, ['Integer']
    getattribute $P4, $P2, "i"

    is( $P4, 1024, 'set/get Integer attribute' )
.end

.sub set_and_get_multiple_object_attribs
    newclass $P1, "Foo14"
    addattribute $P1, "i"
    addattribute $P1, "j"
    new $P2, "Foo14"

    new $P3, ['Integer']
    set $P3, 4201
    new $P4, ['Hash']
    set $P4["Key"], "Value"

    setattribute $P2, "i", $P3
    setattribute $P2, "j", $P4

    getattribute $P5, $P2, "i"
    is( $P5, '4201', 'set/get Integer attribute' )

    getattribute $P6, $P2, "j"
    set $S0, $P6["Key"]
    is( $S0, 'Value', 'set/get Hash attribute on same obj' )
.end

.sub attribute_values_are_specific_to_objects
    newclass $P1, "Foo15"
    addattribute $P1, "i"
    new $P2, $P1
    new $P3, $P1

    new $P4, ['Integer']
    set $P4, 100
    setattribute $P2, "i", $P4
    new $P5, ['String']
    set $P5, "One hundred"
    setattribute $P3, "i", $P5

    getattribute $P6, $P2, "i"
    is( $P6, 100, 'attribute value on 1st object is specific to obj' )

    getattribute $P6, $P3, "i"
    is( $P6, 'One hundred', 'attribute value on 2nd obj is specific to obj' )
.end

.sub attribute_values_and_subclassing
    newclass $P1, "Foo16"
    addattribute $P1, "i"
    addattribute $P1, "j"
    subclass $P2, $P1, "Bar16"
    addattribute $P2, "k"
    addattribute $P2, "l"

    new $P2, "Bar16"
    new $P3, "Bar16"

    # Note that setattribute holds the actual PMC, not a copy, so
    # in this test both attributes get the PMC from $P4, and should
    # both have the same value, despite the C<inc>.
    new $P4, ['Integer']
    set $P4, 10
    setattribute $P2, "i", $P4
    inc $P4
    setattribute $P2, "j", $P4

    new $P5, ['Integer']
    set $P5, 100
    setattribute $P3, "i", $P5
    inc $P5
    setattribute $P3, "j", $P5

    getattribute $P6, $P2, "i"
    is( $P6, 11, 'setattrib with a PMC holds actual PMC not copy' )

    getattribute $P6, $P2, "j"
    is( $P6, 11, '...so changes to the PMC appear through the attrib' )

    getattribute $P6, $P3, "i"
    is( $P6, 101, '...and second test on new objects' )

    getattribute $P6, $P3, "j"
    is( $P6, 101, '...should have same result' )
.end

.sub attribute_values_and_subclassing_2
    newclass $P1, "Foo17"
    # must add attributes before object instantiation
    addattribute $P1, ".i"
    addattribute $P1, ".j"

    subclass $P2, $P1, "Bar17"
    addattribute $P2, ".k"
    addattribute $P2, ".l"

    # subclass is preferred for the SI case over
    #   newclass $P2, "Bar"
    #   addattrib ...
    #   addparent $P2, $P1
    # which is suitable for adding multiple parents to one class

    # instantiate a Bar object
    new $P3, "Bar17"

    # Set the attribute values
    new $P10, ['String']           # set attribute values
    set $P10, "i"                # attribute slots have reference semantics
    setattribute $P3, ".i", $P10  # so always put new PMCs in
                                # if you have unique values
    new $P10, ['String']
    set $P10, "j"
    setattribute $P3, ".j", $P10

    new $P10, ['String']
    set $P10, "k"
    setattribute $P3, ".k", $P10

    new $P10, ['String']
    set $P10, "l"
    setattribute $P3, ".l", $P10

    # retrieve attribs
    getattribute $P11, $P3, ".i"
    is( $P11, "i", 'string attribute get/set on parent' )

    getattribute $P11, $P3, ".j"
    is( $P11, "j", 'string attribute get/set on parent' )

    getattribute $P11, $P3, ".k"
    is( $P11, "k", 'string attribute get/set on subclass' )

    getattribute $P11, $P3, ".l"
    is( $P11, "l", 'string attribute get/set on subclass' )
.end

.sub PMC_as_classes__overridden_mmd_methods
    .local pmc myint, i, j, k

    get_class $P0, "Integer"
    subclass myint, $P0, "MyInt1"

    i = new 'MyInt1'
    j = new 'MyInt1'
    k = new 'MyInt1'
    i = 6
    j = 7
    k = i + j

    is( k, 13, 'added two MyInt1' )

    j = new ['Integer']
    j = 100
    k = i + j

    is( k, 106, 'added MyInt1 and an Integer' )
.end

.namespace ["MyInt1"]

.sub add :multi(MyInt1, MyInt1, MyInt1)
    .param pmc self
    .param pmc right
    .param pmc dest
    ok( 1, 'in the add method' )
    $P0 = getattribute self, ['Integer'], "proxy"
    $I0 = $P0
    $I1 = right
    $I2 = $I0 + $I1
    dest = $I2
    .return(dest)
.end

.namespace []       # Reset to root namespace for next test

.sub typeof_class
    newclass $P0, "Foo21"
    typeof $S0, $P0
    is( $S0, "Class", 'typeof for a Class PMC is "Class"' )
.end

.sub typeof_objects
    newclass $P0, "A"
    newclass $P1, "B"

    new $P0, ['A']
    new $P1, ['B']

    typeof $S0, $P0
    typeof $S1, $P1

    is( $S0, 'A', 'typeof object of class A is "A"' )
    is( $S1, 'B', 'typeof object of class B is "B"' )
.end

.sub multiple_inheritance__with_attributes
    newclass $P1, "Star"
    addattribute $P1, "Spectral Type"

    newclass $P2, "Company"
    addattribute $P2, "Annual Profit"

    subclass $P3, $P1, "Sun"
    addparent $P3, $P2

    new $P4, ['Sun']

    new $P5, ['String']
    set $P5, "G"
    setattribute $P4, "Spectral Type", $P5

    new $P6, ['String']
    set $P6, "$100,000,000"
    setattribute $P4, "Annual Profit", $P6

    getattribute $P7, $P4, "Spectral Type"
    is( $P7, 'G', 'direct parents attribute' )

    getattribute $P8, $P4, "Annual Profit"
    is( $P8, '$100,000,000', "addparent's attribute" )
.end

.sub attributes_two_levels_of_inheritance
    newclass $P0, "Astronomical Object"
    addattribute $P0, "Location"

    subclass $P1, $P0, "Star2"
    addattribute $P1, "Spectral Type"

    newclass $P2, "Sun2"
    addparent $P2, $P1
    addparent $P2, $P0

    new $P4, "Sun2"

    new $P5, ['String']
    set $P5, "Taurus"
    setattribute $P4, "Location", $P5
    getattribute $P6, $P4, "Location"
    is( $P6, 'Taurus', 'attributes with two levels of inheritance' )
.end

.sub class_op_test
    newclass $P0, "City1"
    new $P1, "City1"

    class $P2, $P1
    set $S0, $P2
    is( $S0, 'City1', 'class op works' )
.end

.sub anon_subclass_has_no_name
    newclass $P0, "City2"
    subclass $P1, $P0
    set $S0, $P1
    is( $S0, '', 'anonymous subclass has no name' )
.end

.sub get_attrib_by_name
    newclass $P1, "Foo18"
    addattribute $P1, "i"
    new $P2, "Foo18"
    new $P3, ['String']
    set $P3, "ok"
    setattribute $P2, "i", $P3

    getattribute $P4, $P2, ["Foo18"], "i"
    is( $P4, 'ok', 'get attrib by name' )
.end

.sub get_attrib_by_name_subclass
    newclass $P0, "Bar19"
    addattribute $P0, "j"

    subclass $P1, $P0, "Foo19"
    addattribute $P1, "i"

    new $P2, "Foo19"

    new $P3, ['String']
    set $P3, "foo i"
    setattribute $P2, "i", $P3

    new $P3, ['String']
    set $P3, "bar j"
    setattribute $P2, "j", $P3

    getattribute $P4, $P2, ["Foo19"], "i"
    is( $P4, 'foo i', 'attribute from subclass get by name' )

    getattribute $P4, $P2, ["Bar19"], "j"
    is( $P4, 'bar j', 'attribute from parent class get by name' )
.end

.sub set_attrib_by_name_subclass
    newclass $P0, "Bar20"
    addattribute $P0, "j"

    subclass $P1, $P0, "Foo20"
    addattribute $P1, "i"

    new $P2, "Foo20"

    new $P3, ['String']
    set $P3, "foo i"
    setattribute $P2, ["Foo20"], "i", $P3

    new $P3, ['String']
    set $P3, "bar j"
    setattribute $P2, ["Bar20"], "j", $P3

    getattribute $P4, $P2, "i"
    is( $P4, 'foo i', 'attribute from subclass set by name' )

    getattribute $P4, $P2, "j"
    is( $P4, 'bar j', 'attribute from parent class set by name' )
.end

.sub PMC_as_classes
    get_class $P0, "Integer"
    ok( 1, "get_class of Integer did't croak" )

    get_class $P0, "Integer"
    ok( 1, "get_class of Integer did't croak second time" )

    typeof $S0, $P0
    is( $S0, 'PMCProxy', 'typeof PMCProxy' )
.end

.sub PMC_as_classes__subclass
    .local pmc MyInt3
    get_class $P0, "Integer"
    ok( 1, "get_class on Integer didn't blow up" )

    subclass MyInt3, $P0, "MyInt3"
    ok( 1, "subclassing didn't blow up" )

    $S0 = typeof MyInt3
    is( $S0, 'Class', 'new subclass is typeof Class' )

    $I0 = isa MyInt3, "MyInt3"
    ok( $I0, 'new subclass isa MyInt' )

    $I0 = isa MyInt3, "Integer"
    ok( $I0, 'new subclass isa parent class' )
.end

.sub PMC_as_classes__instantiate
    .local pmc MyInt4
    get_class $P0, "Integer"
    ok( 1, 'able to get_class of Integer' )

    subclass MyInt4, $P0, "MyInt4"
    addattribute MyInt4, ".i"
    ok( 1, 'able to addattribute to subclass' )

    .local pmc i
    i = new "MyInt4"
    ok( 1, 'able to instantiate obj of subclass w/ attribute' )
.end

.sub PMC_as_classes__methods
    .local pmc MyInt5
    get_class $P0, "Integer"

    subclass MyInt5, $P0, "MyInt5"
    addattribute MyInt5, "intval"

    .local pmc i, i2
    i = new "MyInt5"
    i2 = new ['Integer']
    i2 = 43

    i = 42    # set_integer is inherited from Integer
    ok( 1, 'able to assign int to MyInt' )

    $I0 = i   # get_integer is overridden below
    is( $I0, 42, 'get_integer is overridden for MyInt5' )

    $S0 = i   # get_string is overridden below
    is( $S0, 'MyInt5(42)', 'get_string is overridden for MyInt5' )
.end

.namespace ["MyInt5"]

.sub set_integer_native :vtable :method
   .param int new_value
   $P1 = new ['Integer']
   $P1 = new_value
   setattribute self, "intval", $P1
.end

.sub get_integer :vtable :method
   $P0 = getattribute self, "intval"
   $I0 = $P0
   .return ($I0)
.end

.sub get_string :vtable :method
   $P0 = getattribute self, "intval"
   $I0 = $P0
   $S1 = $I0
   $S0 = "MyInt5("
   $S0 .= $S1
   $S0 .= ")"
   .return ($S0)
.end

.namespace []       # Reset to root namespace for next test

.sub PMC_as_classes__mmd_methods
  .local pmc MyInt6
  get_class $P0, "Integer"
  subclass MyInt6, $P0, "MyInt6"
  .local pmc i
  .local pmc j
  .local pmc k
  i = new "MyInt6"
  j = new "MyInt6"
  k = new "MyInt6"
  i = 6
  j = 7
  k = i * j
  $I0 = k
  is( $I0, 42, 'MyInt6 defaults to Integer class for mult' )

  $S0 = k   # get_string is overridden below
  is( $S0, 'MyInt6(42)', 'get_string is overridden for MyInt6' )
.end

.namespace ["MyInt6"]

.sub get_string :vtable :method
   $I0 = self   # get_integer is not overridden
   $S1 = $I0
   $S0 = "MyInt6("
   $S0 .= $S1
   $S0 .= ")"
   .return ($S0)
.end

.namespace []       # Reset to root namespace for next test

.sub PMC_as_classes__derived_1
  .local pmc MyInt8
  .local pmc MyInt8_2
  get_class $P0, "Integer"

  subclass MyInt8, $P0, "MyInt8"
  addattribute MyInt8, 'intval'
  get_class $P1, "MyInt8"
  subclass MyInt8_2, $P1, "MyInt8_2"

  .local pmc i
  i = new "MyInt8_2"
  $I0 = isa i, "Integer"
  ok( $I0, 'obj isa grandparent (Integer)' )

  $I0 = isa i, "MyInt8"
  ok( $I0, 'obj isa parent (MyInt8)' )

  $I0 = isa i, "MyInt8_2"
  ok( $I0, 'obj isa its class (MyInt8_2)' )

  i = 42    # set_integer is overridden below
  $I0 = i   # get_integer is overridden below
  is( $I0, 42, 'set/get_integer overridden' )

  $S0 = i   # get_string is overridden below
  is( $S0, 'MyInt8_2(42)', 'set/get_string overridden' )
.end

.namespace ["MyInt8"]
.sub 'set_integer_native' :vtable :method
    .param int val
    $P1 = new ['Integer']
    $P1 = val
    setattribute self, "intval", $P1
    .return ()
.end
.sub get_integer :vtable :method
   $P0 = getattribute self, 'intval'
   $I0 = $P0
   .return ($I0)
.end
.sub get_string :vtable :method
   $P0 = getattribute self, 'intval'
   $I0 = $P0
   $S1 = $I0
   $S0 = typeof self
   $S0 .= "("
   $S0 .= $S1
   $S0 .= ")"
   .return ($S0)
.end

.namespace []       # Reset to root namespace for next test

.sub PMC_as_classes__derived_2
  .local pmc MyInt9
  .local pmc MyInt9_2
  get_class $P0, "Integer"

  subclass MyInt9, $P0, "MyInt9"
  addattribute MyInt9, 'intval'
  get_class $P1, "MyInt9"
  subclass MyInt9_2, $P1, "MyInt9_2"

  .local pmc i
  i = new "MyInt9_2"
  $I0 = isa i, "Integer"
  ok( $I0, 'obj isa grandparent (Integer)' )
  $I0 = isa i, "MyInt9"
  ok( $I0, 'obj isa parent (MyInt9)' )
  $I0 = isa i, "MyInt9_2"
  ok( $I0, 'obj isa its class (MyInt9_2)' )

  i = 42    # set_integer is overridden below
  $I0 = i   # get_integer is overridden below
  is( $I0, 43, 'set/get_integer overridden' )

  $S0 = i   # get_string is overridden below
  is( $S0, 'MyInt9_2(42)', 'set/get_string overridden' )
.end

.namespace ["MyInt9_2"]
# subclassing methods from MyInt9 is ok
# this one changes the value a bit
.sub get_integer :vtable :method
   $P0 = getattribute self, 'intval'
   $I0 = $P0
   inc $I0            # <<<<<
   .return ($I0)
.end
.namespace ["MyInt9"]
.sub 'set_integer_native' :vtable :method
    .param int val
    $P1 = new ['Integer']
    $P1 = val
    setattribute self, "intval", $P1
    .return ()
.end
.sub get_integer :vtable :method
   $P0 = getattribute self, 'intval'
   $I0 = $P0
   .return ($I0)
.end
.sub get_string :vtable :method
   $P0 = getattribute self, 'intval'
   $I0 = $P0
   $S1 = $I0
   $S0 = typeof self
   $S0 .= "("
   $S0 .= $S1
   $S0 .= ")"
   .return ($S0)
.end

.namespace []       # Reset to root namespace for next test

.sub PMC_as_classes__derived_3
    .local pmc MyInt10
    .local pmc MyInt10_2
    get_class $P0, "Integer"

    subclass MyInt10, $P0, "MyInt10"
    addattribute MyInt10, 'intval'
    get_class $P1, "MyInt10"
    subclass MyInt10_2, $P1, "MyInt10_2"

    .local pmc i
    i = new "MyInt10_2"
    $I0 = isa i, "Integer"
    ok( $I0, 'obj isa grandparent (Integer)' )
    $I0 = isa i, "MyInt10"
    ok( $I0, 'obj isa parent (MyInt10)' )
    $I0 = isa i, "MyInt10_2"
    ok( $I0, 'obj isa its class (MyInt102)' )

    i = 42    # set_integer is overridden below
    $I0 = i   # get_integer is overridden below
    is( $I0, 42, 'set/get_integer overridden' )

    $S0 = i   # get_string is overridden below
    is( $S0, 'MyInt10_2(42)', 'set/get_string overridden' )
.end

.namespace ["MyInt10_2"]
.sub get_integer :vtable :method
    $P0 = getattribute self, 'intval'
    $I0 = $P0
    .return ($I0)
.end
.sub get_string :vtable :method
    $P0 = getattribute self, 'intval'
    $I0 = $P0
    $S1 = $I0
    $S0 = typeof self
    $S0 .= "("
    $S0 .= $S1
    $S0 .= ")"
    .return ($S0)
.end
.namespace ['MyInt10']
.sub 'set_integer_native' :vtable :method
    .param int val
    $P1 = new ['Integer']
    $P1 = val
    setattribute self, "intval", $P1
    .return ()
.end

.namespace []       # Reset to root namespace for next test

.sub subclassing_Class
    .local pmc cl
    .local pmc parent
    parent = get_class "Class"
    cl = subclass parent, "Foo33"
    ok( 1, 'able to subclass Class' )

    .local pmc o
    o = new "Foo33"
    ok( 1, 'able to instantiate subclass of Class' )

    $S0 = typeof o
    is( $S0, 'Foo33', 'object returns correct class' )
.end

.sub namespace_vs_name
    .local pmc o, cl, f
    newclass cl, "Foo34"
    o = new "Foo34"
    is( o, 'Foo34::get_string', 'found Foo34 namespace' )

    o = Foo34()
    is( o, 'Foo34', 'found global Foo34' )

    f = get_global "Foo34"
    o = f()
    is( o, 'Foo34', 'found global Foo34 explicitly' )

    f = get_global ["Foo34"], "Foo34"
    o = f()
    is( o, 'Foo34::Foo34', 'found method in Foo34 namespace' )
.end

.sub Foo34
    .return("Foo34")
.end

.namespace [ "Foo34" ]

.sub get_string :vtable :method
    .return("Foo34::get_string")
.end

.sub Foo34
    .return("Foo34::Foo34")
.end

.namespace []       # Reset to root namespace for next test

.sub multiple_anon_classes
     newclass $P0, "City3"
     subclass $P1, $P0
     newclass $P2, "State3"
     subclass $P3, $P2
     ok( 1,  "multiple anon classes didn't croak (bug #33103)" )
.end

.sub subclassed_Integer_bug
   .local pmc class
   .local pmc a
   .local pmc b

    subclass class, "Integer", "LispInteger1"

    a = new "LispInteger1"
    b = new "LispInteger1"

    a = 1
    b = 1

    set $S0, a
    is( $S0, '1', 'subclassed Integer is 1' )
    set $S0, b
    is( $S0, '1', 'subclassed Integer is 1' )

    a = a * b
    set $S0, a
    is( $S0, '1', 'multip and reasign to subclassed Integer is 1' )
.end

.sub equality_of_subclassed_Integer
  .local pmc class
  class = subclass "Integer", "LispInteger2"

  .local pmc a
  a = new 'LispInteger2'
  a = 123

  .local pmc b
  b = new 'LispInteger2'
  b = 123

  $I0 = a == b
  ok( $I0, '123 is equal to 123' )

.end

.sub short_name_attributes
    newclass $P1, "Foo22"
    addattribute $P1, "i"
    addattribute $P1, "j"

    subclass $P2, $P1, "Bar22"
    addattribute $P2, "k"
    addattribute $P2, "l"

    new $P2, "Bar22"

    # set a bunch of attribs
    new $P4, ['Integer']
    set $P4, 10
    setattribute $P2, "i", $P4

    new $P4, ['Integer']
    set $P4, 11
    setattribute $P2, "j", $P4

    new $P4, ['Integer']
    set $P4, 20
    setattribute $P2, "k", $P4

    new $P4, ['Integer']
    set $P4, 21
    setattribute $P2, "l", $P4

    getattribute $P6, $P2, "i"
    is( $P6, 10, '"i" getattribute on parent class attrib' )
    getattribute $P6, $P2, "j"
    is( $P6, 11, '"j" getattribute on parent class attrib' )

    getattribute $P6, $P2, "k"
    is( $P6, 20, '"k" getattribute on subclass attrib' )
    getattribute $P6, $P2, "l"
    is( $P6, 21, '"l" getattribute on subclass attrib' )

    getattribute $P6, $P2, ["Foo22"], "i"
    is( $P6, 10, '["Foo22"], "i" getattribute on parent class attrib' )
    getattribute $P6, $P2, ["Bar22"], "k"
    is( $P6, 20, '["Bar22"], "k" getattribute on subclass attrib' )
.end

.sub init_with_and_without_arg
    .local pmc cl, o, h, a
    cl = newclass "Foo35"
    addattribute cl, "a"
    o = cl.'new'()
    a = getattribute o, "a"
    is( a, 'ok 1', 'init without an arg' )

    h = new ['Hash']
    $P0 = new ['String']
    $P0 = "ok 2"
    h['a'] = $P0
    o  = new cl, h
    a = getattribute o, "a"
    is( a, 'ok 2', 'init with an arg' )
.end

.namespace ["Foo35"]
.sub init_pmc :vtable :method
    .param pmc args
    $P0 = args['a']
    setattribute self, 'a', $P0
    .return()
.end
.sub init :vtable :method
    $P0 = new ['String']
    $P0 = "ok 1"
    setattribute self, 'a', $P0
.end

.namespace []       # Reset to root namespace for next test

.sub newclass_bracket_parsing
    newclass $P0, ['Foo23';'Bar23']
    ok( 1, 'newclass  created with brackets' )
.end

.sub verify_namespace_types
    newclass $P0, ['Foo24';'Bar24']
    getinterp $P0
    set $P1, $P0[.IGLOBALS_CLASSNAME_HASH]
    typeof $S0, $P1
    is( $S0, 'NameSpace', 'namespace verified' )

    set $P2, $P1['Foo24']
    typeof $S0, $P2
    is( $S0, 'NameSpace', 'namespace verified' )
.end

.sub verify_data_type
    newclass $P0, ['Foo25';'Bar25']
    getinterp $P0
    set $P1, $P0[.IGLOBALS_CLASSNAME_HASH]
    set $P2, $P1['Foo25']
    set $P3, $P2['Bar25']

    set $I0, $P3
    isgt $I0, $I0, 0
    ok( $I0, 'verified datatype > 0' )
.end

# Puts init in a namespace
.sub new_keyed
    .local pmc cl, o, p
    cl = newclass ['Foo36';'Bar36']
    addattribute cl, "init_check"
    o = cl.'new'()
    ok( 1, 'obj successfully created' )

    p = getattribute o, "init_check"
    is( p, 999, "overridden init called")
.end

.namespace ['Foo36';'Bar36']

.sub init :vtable :method
    .local pmc p
    p = new ['Integer']
    p = 999
    setattribute self, "init_check", p
.end

.namespace []   # revert to root for next test

.sub new_keyed_2
    .local pmc c1, c2, o1, o2
    c1 = newclass ['Foo37';'Bar37']
    c2 = newclass ['Foo37';'Fuz37']
    o1 = c1.'new'()
    o2 = c2.'new'()
    ok( 1, 'objects created successfully' )
.end

.namespace ['Foo37';'Bar37']

.sub init :vtable :method
    ok( 1, '__init Bar37' )
.end

.namespace ['Foo37';'Fuz37']

.sub init :vtable :method
    ok( 1, '__init Fuz37' )
.end

.namespace []   # revert to root for next test

.sub new_keyed_3
    .local pmc c1, c2, c3, o1, o2, o3
    c1 = newclass ['Foo38';'Bar38']
    c2 = newclass ['Foo38';'Buz38']
    c3 = newclass 'Foo38'
    o1 = new      ['Foo38';'Bar38']
    o2 = new      ['Foo38';'Buz38']
    o3 = new      'Foo38'
    ok( 1, 'objects created successfully' )
.end

.namespace ['Foo38';'Bar38']

.sub init :vtable :method
    ok( 1, '__init Bar38' )
.end

.namespace ['Foo38';'Buz38']

.sub init :vtable :method
    ok( 1, '__init Buz38' )
.end

.namespace ['Foo38']

.sub init :vtable :method
    ok( 1, '__init Foo38' )
.end

.namespace []   # revert to root for next test

.sub subclass_keyed
    .local pmc base, o1, o2
    base = subclass 'Hash', ['Perl6-3'; 'PAST'; 'Node']
    addattribute base, '$.source'                  # original source
    addattribute base, '$.pos'                     # offset position

    $P0 = subclass base, ['Perl6-3'; 'PAST'; 'Sub']
    $P0 = subclass base, ['Perl6-3'; 'PAST'; 'Stmt']
    ok( 1, 'ok 1\n' )

    o1 = new   ['Perl6-3'; 'PAST'; 'Sub']
    o2 = new   ['Perl6-3'; 'PAST'; 'Stmt']
    ok( 1, 'objects created successfully' )
.end

.namespace ['Perl6-3'; 'PAST'; 'Stmt']

.sub init :vtable :method
    ok( 1, '__init Stmt' )
.end

.namespace ['Perl6-3'; 'PAST'; 'Sub']

.sub init :vtable :method
    ok( 1, '__init Sub' )
.end

.namespace []   # revert to root for next test

.sub test_class_name_multipart_name
    .local pmc base, o1
    base = subclass 'Hash', ['Perl6'; 'PAST'; 'Node']
    o1 = new base
    $S0 = typeof o1
    is( $S0, "Perl6;PAST;Node", "typeof returns object's class name" )
.end

.sub test_get_class_multipart_name
    .local pmc base, o1
    base = subclass 'Hash', ['Perl6a'; 'PAST'; 'Node']
    $P0 = get_class ['Perl6a'; 'PAST'; 'Node']
    o1 = new $P0
    $S0 = typeof o1
    is( $S0, 'Perl6a;PAST;Node', 'typeof returns objects created from get_class' )
.end

.sub isa_bug
    .local pmc base, o1, o2
    base = subclass 'Hash', ['Perl6b'; 'PAST'; 'Node']
    $P0 = new [ 'Perl6b'; 'PAST'; 'Node' ]

    $I0 = isa $P0, [ 'Perl6b'; 'PAST'; 'Node']
    is( $I0, 1, 'obj isa the full class name' )

    $I0 = isa $P0, 'Hash'
    is( $I0, 1, 'obj isa the parent class' )

    $I0 = isa $P0, 'Perl6b'
    is( $I0, 0, 'obj !isa the first part of the class name' )
.end

.sub new_nested_ordering
    .local pmc c1, c2, o
    c1 = newclass ['Foo39']
    c2 = newclass ['Foo39';'Bar39']
    o = c2.'new'()
    ok( 1, 'objects created successfully' )
.end

.namespace ['Foo39']

.sub init :vtable :method
    ok( 0, '__init Foo39' )     # shouldn't be called
.end

.namespace ['Foo39';'Bar39']

.sub init :vtable :method
    ok( 1, '__init Bar39' )     # should be called
.end

.namespace []   # revert to root for next test

.sub vtable_override_once_removed
    .local pmc base
    $P0 = get_class 'Integer'
    base = subclass $P0, 'Foo40'      # create subclass 'Foo40'
    addattribute base, '@!capt'

    $P0 = subclass 'Foo40', 'Bar40'   # create subclass 'Bar40'
    $P1 = new 'Bar40'                 # create an instance of 'Bar40'

    $S1 = $P1                         # get its string representation
    is( $S1, 'ok bar', 'get_string overridden' )
.end

.namespace [ 'Bar40' ]

.sub 'get_string' :vtable :method
    $S0 = 'ok bar'
    .return ($S0)
.end

.namespace []   # revert to root for next test

.sub vtable_fails_for_subclasses_of_core_classes
    $P0 = subclass 'Hash', 'Foo41'
    $P0 = subclass 'Hash', 'Bar41'

    $P1 = new 'Foo41'
    $S1 = $P1
    is( $S1, 'Hello world', 'get_string :vtable :method' )

    $P1 = new 'Bar41'
    $S1 = $P1
    is( $S1, 'Hello world', 'get_string :method :vtable' )
.end

.namespace [ 'Foo41' ]

.sub 'get_string' :vtable :method
    .return('Hello world')
.end

.namespace [ 'Bar41' ]

.sub 'get_string' :method :vtable
    .return('Hello world')
.end

.namespace []   # revert to root for next test

.sub super___init_called_twice
    $P0 = newclass 'Foo42'
    $P1 = subclass $P0, 'Bar42'
    addattribute $P1, 'i'

    $P2 = $P1.'new'()
.end

.namespace [ 'Foo42' ]

.sub 'init' :vtable :method
    $P0 = getattribute self, 'i'
    isnull $I1, $P0
    ok( $I1, 'should be null' )

    $P1 = new ['Integer']
    setattribute self, "i", $P1  # i won't be null if init called again
    .return ()
.end

.namespace []   # revert to root for next test

.sub using_class_object_from_typeof_op_with_new
    $P0 = newclass [ "Monkey" ; "Banana" ]
    $P0 = $P0.'new'()
    $S0 = $P0."ook"()
    is( $S0, "Ook!", 'obj created from .new() class method' )

    $P2 = typeof $P0
    $P3 = new $P2
    $S0 = $P3."ook"()
    is( $S0, "Ook!", 'obj created from "new" called on result of typeof' )
.end

.namespace [ "Monkey" ; "Banana" ]
.sub ook :method
    $S1 = "Ook!"
    .return ($S1)
.end

.namespace []   # revert to root for next test

.macro exception_is ( M )
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    is( message, .M, .M )
.endm

.sub setting_non_existent_attribute
    newclass $P1, "Foo45"
    new $P2, $P1

    new $P3, ['Integer']
    push_eh handler
        setattribute $P2, "bar", $P3
    pop_eh
    ok(0, "'No such attribute' exception not thrown")
    goto end
handler:
    .exception_is( "No such attribute 'bar'" )
end:
.end

.sub setting_non_existent_attribute_by_name
    newclass $P1, "Foo47"
    new $P2, $P1

    new $P3, ['Integer']
    push_eh handler
        setattribute $P2, ["Foo47"], "no_such", $P3
    pop_eh
    ok(0, "'No such attribute' exception not thrown")
    goto end
handler:
    .exception_is( "No such attribute 'no_such' in class 'Foo47'" )
end:
.end

.sub getting_null_attribute
    newclass $P1, "Foo51"
    addattribute $P1, "i"
    new $P2, "Foo51"

    getattribute $P3, $P2, "i"
    isnull $I0, $P3
    is($I0, 1, "null attribute is null")
.end

.sub getting_non_existent_attribute
    newclass $P1, "Foo52"
    $P2 = $P1.'new'()

    push_eh handler
        getattribute $P3, $P2, "bar"
    pop_eh
    ok(0, "'No such attribute' exception not thrown")
    goto end
handler:
    .exception_is( "No such attribute 'bar'" )
end:
.end

.sub addparent_exceptions_1
    newclass $P0, "Astronomical Object 2"
    new $P1, ['String']
    set $P1, "Not a class"
    push_eh handler
        addparent $P0, $P1
    pop_eh
    ok(0, "'Parent isn\'t a Class' exception not thrown")
    goto end
handler:
    .exception_is( "Parent isn't a Class." )
end:
.end

.sub addparent_exceptions_2
    new $P0, ['Hash']
    newclass $P1, "Trashcan"
    push_eh handler
        addparent $P0, $P1
    pop_eh
    ok(0, "'Only classes can be subclassed' exception not thrown")
    goto end
handler:
    .exception_is( "Only classes can be subclassed" )
end:
.end

.sub subclassing_a_non_existent_class
    push_eh handler
        subclass $P1, "Character", "Nemo"
    pop_eh
    ok(0, "nonexistent class exception not thrown")
    goto end
handler:
    .exception_is( "Class 'Character' doesn't exist" )
end:
.end

.sub anon_subclass_of_non_existent_class
    push_eh handler
        subclass $P1, "Character"
    pop_eh
    ok(0, "nonexistent class exception not thrown")
    goto end
handler:
    .exception_is( "Class 'Character' doesn't exist" )
end:
.end

.sub addattribute_duplicate
    newclass $P1, "Foo53"
    addattribute $P1, "i"
    addattribute $P1, "j"
    push_eh handler
        addattribute $P1, "i"
    pop_eh
    ok(0, "attribute already exists exception not thrown")
    goto end
handler:
    .exception_is( "Attribute 'i' already exists in 'Foo53'." )
end:
.end

.sub wrong_way_to_create_new_objects
    push_eh handler
        new $P0, ['Object']
    pop_eh
    ok(0, "object instantiation exception not thrown")
    goto end
handler:
    .exception_is( "Object must be created by a class." )
end:
.end

.sub attribute_values__subclassing_access_meths
    newclass $P1, "Foo54"
    # must add attributes before object instantiation
    addattribute $P1, "i"
    addattribute $P1, "j"
    # define attrib access functions in Foo54 namespace
    get_global $P5, "Foo54__set"
    addmethod $P1, "Foo54__set", $P5
    get_global $P5, "Foo54__get"
    addmethod $P1, "Foo54__get", $P5

    subclass $P2, $P1, "Bar54"
    addattribute $P2, "k"
    addattribute $P2, "l"
    get_global $P5, "Bar54__set"
    addmethod $P2, "Bar54__set", $P5
    get_global $P5, "Bar54__get"
    addmethod $P2, "Bar54__get", $P5

    # instantiate a Bar54 object
    new $P13, "Bar54"

    # Foo54 and Bar54 have attribute accessor methods
    new $P5, ['String']        # set attribute values
    set $P5, "i"       # attribute slots have reference semantics
    set_args "0,0", $P5, "i"
    callmethodcc $P13, "Foo54__set"
    get_results ""

    new $P5, ['String']
    set $P5, "j"
    set_args "0,0", $P5, "j"
    callmethodcc  $P13,"Foo54__set"
    get_results ""

    new $P5, ['String']
    set $P5, "k"
    set_args "0,0", $P5, "k"
    callmethodcc  $P13,"Bar54__set"
    get_results ""

    new $P5, ['String']
    set $P5, "l"
    set_args "0,0", $P5, "l"
    callmethodcc  $P13,"Bar54__set"
    get_results ""

    # now retrieve attributes
    set_args "0",  "i"
    callmethodcc  $P13,"Foo54__get"
    get_results "0", $P5
    is( $P5, "i", 'got attrib i from Bar54->Foo54__get' )

    set_args "0",  "j"
    callmethodcc  $P13,"Foo54__get"
    get_results "0", $P5
    is( $P5, "j", 'got attrib j from Bar54->Foo54__get' )

    set_args "0",  "k"
    callmethodcc  $P13,"Bar54__get"
    get_results "0", $P5
    is( $P5, "k", 'got attrib k from Bar54->Bar54__get' )

    set_args "0",  "l"
    callmethodcc  $P13,"Bar54__get"
    get_results "0", $P5
    is( $P5, "l", 'got attrib l from Bar54->Bar54__get' )
.end

# set(obj: Pvalue, Iattr_idx)
.sub Foo54__set
    get_params "0,0", $P5, $S4
    ok( 1, "in Foo54__set" )
    interpinfo $P2, .INTERPINFO_CURRENT_OBJECT
    setattribute $P2, $S4, $P5
    set_returns ""
    returncc
.end

# Pattr = get(obj: Iattr_idx)
.sub Foo54__get
    get_params "0", $S4
    ok( 1, "in Foo54__get" )
    interpinfo $P2, .INTERPINFO_CURRENT_OBJECT
    getattribute $P5, $P2, $S4
    set_returns "0", $P5
    returncc
.end

.sub Bar54__set
    get_params "0,0", $P5, $S4
    interpinfo $P2, .INTERPINFO_CURRENT_OBJECT
    ok( 1, "in Bar54__set" )
    setattribute $P2, $S4, $P5
    set_returns ""
    returncc
.end

.sub Bar54__get
    get_params "0", $S4
    ok( 1, "in Bar54__get" )
    interpinfo $P2, .INTERPINFO_CURRENT_OBJECT
    getattribute $P5, $P2, $S4
    set_returns "0", $P5
    returncc
.end

.sub attribute_values__inherited_access_meths
    newclass $P1, "Foo56"
    # must add attributes before object instantiation
    addattribute $P1, "i"
    addattribute $P1, "j"
    # define attrib access functions
    get_global $P5, "set"
    addmethod $P1, "set", $P5
    get_global $P5, "get"
    addmethod $P1, "get", $P5

    subclass $P2, $P1, "Bar56"
    addattribute $P2, "k"
    addattribute $P2, "l"
    addattribute $P2, "m"

    # subclass is preferred for the SI case over
    #   newclass $P2, "Bar56"
    #   addattrib ...
    #   addparent $P2, $P1
    # which is suitable for adding multiple parents to one class

    # instantiate a Bar56 object
    new $P2, "Bar56"

    # Foo56 and Bar56 have attribute accessor methods
    new $P5, ['String']        # set attribute values
    set $P5, "i"       # attribute slots have reference semantics
    set_args "0,0,0", $P5, "Foo56", "i"
    callmethodcc $P2, "set"

    new $P5, ['String']
    set $P5, "j"
    set_args "0,0,0", $P5, "Foo56", "j"
    callmethodcc $P2, "set"

    new $P5, ['String']
    set $P5, "k"
    set_args "0,0,0", $P5, "Bar56", "k"
    callmethodcc $P2, "set"

    new $P5, ['String']
    set $P5, "l"
    set_args "0,0,0", $P5, "Bar56", "l"
    callmethodcc $P2, "set"

    new $P5, ['String']
    set $P5, "m"
    set_args "0,0,0", $P5, "Bar56", "m"
    callmethodcc $P2, "set"

    # now retrieve attributes
    set_args "0,0", "Foo56", "i"
    callmethodcc $P2, "get"
    get_results "0", $P5
    is( $P5, 'i', 'got attrib i from subclass through parent method' )

    set_args "0,0", "Foo56", "j"
    callmethodcc $P2, "get"
    get_results "0", $P5
    is( $P5, "j", 'got attrib i from subclass through parent method' )

    set_args "0,0", "Bar56", "k"
    callmethodcc $P2, "get"
    get_results "0", $P5
    is( $P5, "k", 'got attrib i from subclass through parent method' )

    set_args "0,0", "Bar56", "l"
    callmethodcc $P2, "get"
    get_results "0", $P5
    is( $P5, "l", 'got attrib i from subclass through parent method' )

    set_args "0,0", "Bar56", "m"
    callmethodcc $P2, "get"
    get_results "0", $P5
    is( $P5, "m", 'got attrib i from subclass through parent method' )
.end

# Foo56 provides accessor functions which Bar56 inherits
# they take an additional classname argument SClass

# set(obj: Pvalue, SClass, Sattr)
.sub set
    get_params "0,0,0", $P5, $S4, $S5
    interpinfo $P2, .INTERPINFO_CURRENT_OBJECT
    setattribute $P2, $S5, $P5
    set_returns ""
    returncc
.end

# Pattr = get(obj: SClass, Sattr)
.sub get
    get_params "0,0", $S4, $S5
    interpinfo $P2, .INTERPINFO_CURRENT_OBJECT
    getattribute $P5, $P2, $S5
    set_returns "0", $P5
    returncc
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
