#! ../../parrot

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'vtdumper.pbc'

    plan(41)
    comments()
    invalid_attributes()
    function_attributes()
    section_attributes()
    attribute_inheritance()
.end

.sub comments
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['comments: before section attribute'] = <<"VTABLE"
#HAVE A NICE DAY
[NICE_DAY] :very
VTABLE

    parse_tests['comments: after section attribute'] = <<"VTABLE"
[NICE_DAY] :very
#HAVE A NICE DAY
VTABLE

    parse_tests['comments: with section attribute'] = <<"VTABLE"
[NICE_DAY] :very #HAVE A NICE DAY
VTABLE

    parse_tests['comments: before function attribute'] = <<"VTABLE"
#HAVE A NICE DAY
void throw_party(INTVAL size, PMC* party) :hardy
VTABLE

    parse_tests['comments: after function attribute'] = <<"VTABLE"
void throw_party(INTVAL size, PMC* party) :hardy
#HAVE A NICE DAY
VTABLE

    parse_tests['comments: with function attribute'] = <<"VTABLE"
void throw_party(INTVAL size, PMC* party) :hardy #HAVE A NICE DAY
VTABLE

    test_parse_loop(parse_tests, 0)

.end


.sub invalid_attributes
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['invalid: empty section attr name'] = <<"VTABLE"
[BR0KEN] :
VTABLE

    parse_tests['invalid: empty func attr name'] = <<"VTABLE"
void zyzzyx(INTVAL i) :
VTABLE

    test_parse_loop(parse_tests, 1)

.end


.sub function_attributes

    .local pmc parse_test

    parse_test = new ['String']

    parse_test = <<"VTABLE"
void no_attrs(INTVAL i)
void one_attr(INTVAL i) :first
void twp_attrs(INTVAL i) :one :two
void lotsa_attrs(INTVAL i) :alpha :beta :gamma :delta :epislon :zeta
VTABLE

    .local pmc past, node, attributes, attribute
    .local string name
    past = get_past(parse_test)

    node       = past[0]
    name       = node['name']
    attributes = node['attributes']
    is(name, 'no_attrs', 'no_attrs has expected name')
    is(attributes, 0, 'no_attrs has no attributes')


    node       = past[1]
    name       = node['name']
    attributes = node['attributes']
    is(name, 'one_attr', 'one_attr has expected name')
    is(attributes, 1, 'one_attr has one attribute')
    attribute  = attributes[0]
    is(attribute, "first", "one_attribute's attribute has the correct name")


    node       = past[2]
    name       = node['name']
    attributes = node['attributes']
    is(name, 'twp_attrs', 'twp_attrs has expected name')
    is(attributes, 2, 'twp_attrs has two attributes')
    attribute  = attributes[0]
    is(attribute, "one", "twp_attrsibute's first attribute has the correct name")
    attribute  = attributes[1]
    is(attribute, "two", "twp_attrsibute's second attribute has the correct name")


    node       = past[3]
    name       = node['name']
    attributes = node['attributes']
    is(name, 'lotsa_attrs', 'lotsa_attrs has expected name')
    is(attributes, 6, 'lotsa_attrs has two attributes')
    attribute  = attributes[0]
    is(attribute, "alpha", "lotsa_attrsibute's first attribute has the correct name")
    attribute  = attributes[1]
    is(attribute, "beta", "lotsa_attrsibute's second attribute has the correct name")
    attribute  = attributes[5]
    is(attribute, "zeta", "lotsa_attrsibute's sixth attribute has the correct name")

.end


.sub section_attributes

    .local pmc parse_test

    parse_test = new ['String']

    parse_test = <<"VTABLE"
[ZERO]
void no_attrs(INTVAL i)
[ONE] :first
void one_attr(INTVAL i)
[TWO] :one :two
void twp_attrs(INTVAL i)
[THREE] :alpha :beta :gamma :delta :epislon :zeta
void lotsa_attrs(INTVAL i)
VTABLE

    .local pmc past, node, attributes, attribute
    .local string name, section
    past = get_past(parse_test)

    node       = past[0]
    name       = node['name']
    attributes = node['attributes']
    section    = node['section']
    is(name, 'no_attrs', 'no_attrs has expected name')
    is(section, 'ZERO', 'no_attrs has expected name')
    is(attributes, 0, 'no_attrs has no attributes')


    node       = past[1]
    name       = node['name']
    attributes = node['attributes']
    section    = node['section']
    is(name, 'one_attr', 'one_attr has expected name')
    is(section, 'ONE', 'no_attrs has expected name')
    is(attributes, 1, 'one_attr has one attribute')
    attribute  = attributes[0]
    is(attribute, "first", "one_attribute's attribute has the correct name")


    node       = past[2]
    name       = node['name']
    attributes = node['attributes']
    section    = node['section']
    is(name, 'twp_attrs', 'twp_attrs has expected name')
    is(section, 'TWO', 'no_attrs has expected name')
    is(attributes, 2, 'twp_attrs has two attributes')
    attribute  = attributes[0]
    is(attribute, "one", "twp_attrsibute's first attribute has the correct name")
    attribute  = attributes[1]
    is(attribute, "two", "twp_attrsibute's second attribute has the correct name")


    node       = past[3]
    name       = node['name']
    attributes = node['attributes']
    section    = node['section']
    is(name, 'lotsa_attrs', 'lotsa_attrs has expected name')
    is(section, 'THREE', 'no_attrs has expected name')
    is(attributes, 6, 'lotsa_attrs has two attributes')
    attribute  = attributes[0]
    is(attribute, "alpha", "lotsa_attrsibute's first attribute has the correct name")
    attribute  = attributes[1]
    is(attribute, "beta", "lotsa_attrsibute's second attribute has the correct name")
    attribute  = attributes[5]
    is(attribute, "zeta", "lotsa_attrsibute's sixth attribute has the correct name")

.end


.sub attribute_inheritance

    .local pmc code

    code = new ['String']

    code = <<"VTABLE"
[FOO] :sattr :shared
void foo() :fattr :shared
VTABLE

    .local pmc past, node

    past = get_past(code)

    node = past[0]
    $I0 = node['attributes']
    is($I0, 3, "section attributes are inherited gracefully")

.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
