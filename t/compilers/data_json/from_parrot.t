#!parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/compilers/data_json/from_parrot.t - test parrot to JSON conversion.

=head1 SYNOPSIS

    % prove t/compilers/data_json/from_parrot.t

=head1 DESCRIPTION

Tests JSON->Parrot conversions.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(39)

    load_bytecode 'JSON.pbc'
    test_create_json_of_an_empty_string()
    test_create_json_of_a_non_empty_string()
    test_create_json_of_a_string_with_simple_escapes()
    test_create_json_of_some_integers()
    test_create_json_of_some_numbers()
    test_create_json_of_various_scalars_with_pretty_option()
    test_create_json_of_an_array()
    test_create_pretty_json_of_an_array()
    test_create_json_of_array_keep_element_ordering()
    test_create_json_of_a_mixed_array()
    test_create_json_of_hash()
    test_create_non_pretty_json_of_hash()
    test_create_json_of_nested_structure_including_resizablepmcarray_and_empties()
    test_create_non_pretty_json_of_nested_structure()
    test_create_json_of_string_pmcs()
    test_create_json_of_integer_pmcs()
    test_create_json_of_boolean_pmcs()
    test_create_json_of_null_and_undef()
.end


# no. 1
.sub test_create_json_of_an_empty_string
    .local string s
    s = ''

    $S0 = _json( s, 0 )
    is($S0, '""', 'Create JSON of an empty string')
.end


# no. 2
.sub test_create_json_of_a_non_empty_string
    .local string s
    s = 'abcdeABCDE01234$%^&*'

    $S0 = _json( s, 0 )
    is($S0, '"abcdeABCDE01234$%^&*"', 'Create JSON of a non-empty string')
.end


# no. 3
.sub test_create_json_of_a_string_with_simple_escapes
    .local string s
    s = "abcde\\ABCDE\"01234\n$%^&*"
    # XXX more escapes need to be tested; see http://www.json.org/
    $S0 = _json( s, 0 )
    is($S0, '"abcde\\ABCDE\"01234\n$%^&*"', 'Create JSON of a string with simple escapes')
.end


# no. 4..8
.sub test_create_json_of_some_integers
    .local int i
    i = 0
    $S0 = _json( i, 0 )
    is($S0, 0, 'Create JSON of some integers (0)')
    i = 35
    $S0 = _json( i, 0 )
    is($S0, 35, 'Create JSON of some integers (35)')
    i = -42
    $S0 = _json( i, 0 )
    is($S0, -42, 'Create JSON of some integers (-42)')
    i = 2147483647
    $S0 = _json( i, 0 )
    is($S0, 2147483647, 'Create JSON of some integers (2147483647)')
    i = -2147483648
    $S0 = _json( i, 0 )
    is($S0, -2147483648, 'Create JSON of some integers (-2147483647)')
.end


# no. 9..12
.sub test_create_json_of_some_numbers
    .local num n
    n = 0.0
    $S0 = _json( n )
    is($S0, 0, 'Create JSON of some numbers (0)')
    n = 2.50
    $S0 = _json( n )
    is($S0, 2.5, 'Create JSON of some numbers (2.5)')
    n = -42.0
    $S0 = _json( n )
    is($S0, -42, 'Create JSON of some numbers (-42)')
    n = 4.5e1
    $S0 = _json( n )
    is($S0, 45, 'Create JSON of some numbers (45)')
.end


# no. 13..15
.sub test_create_json_of_various_scalars_with_pretty_option
    .local string s
    s = "abcde\\ABCDE\"01234\n$%^&*"
    $S0 = _json( s, 1 )
    is($S0, "\"abcde\\\\ABCDE\\\"01234\\n\$\%\^\&\*\"\n", 'Create JSON of various scalars with pretty option (string)')

    .local int i
    i = -42
    $S0 = _json( i, 1 )
    is($S0, "-42\n", 'Create JSON of various scalars with pretty option (integer)')

    .local num n
    n = 2.50
    $S0 = _json( n, 1 )
    is($S0, "2.5\n", 'Create JSON of various scalars with pretty option (number)')
.end


# no. 16
.sub test_create_json_of_an_array
    .local pmc array

    new array, 'ResizablePMCArray'
    array = 10
    array[0] = 0
    array[1] = 1
    array[2] = 2
    array[3] = 3
    array[4] = 4
    array[5] = 5
    array[6] = 6
    array[7] = 7
    array[8] = 8
    array[9] = 9

    $S0 = _json( array, 0 )
    is($S0, '[0,1,2,3,4,5,6,7,8,9]', 'Create JSON of an array')
.end


# no. 17
.sub test_create_pretty_json_of_an_array
    .local pmc array

    new array, 'ResizablePMCArray'
    array = 10
    array[0] = 0
    array[1] = 1
    array[2] = 2
    array[3] = 3
    array[4] = 4
    array[5] = 5
    array[6] = 6
    array[7] = 7
    array[8] = 8
    array[9] = 9

    $S0 = _json( array, 1 )
    is($S0, <<'OUTPUT', 'Create pretty JSON of an array')
[
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9
]
OUTPUT
.end


# no. 18
.sub test_create_json_of_array_keep_element_ordering
    .local pmc array

    new array, 'ResizablePMCArray'
    array = 6
    array[0] = 35
    array[1] = 1
    array[2] = -5
    array[3] = 0
    array[4] = -2147483648
    array[5] = 2147483647

    $S0 = _json( array, 1 )
    is($S0, <<'OUTPUT', 'Create JSON of an array, keep element ordering')
[
  35,
  1,
  -5,
  0,
  -2147483648,
  2147483647
]
OUTPUT
.end


# no. 19
.sub test_create_json_of_a_mixed_array
    .local pmc array

    new array, 'ResizablePMCArray'
    array = 6
    array[0] = 0
    array[1] = 1500e-2
    array[2] = "JSON"
    array[3] = -7
    array[4] = "json"
    array[5] = 0.0

    $S0 = _json( array, 1 )
    is($S0, <<'OUTPUT', 'Create JSON of a mixed array')
[
  0,
  15,
  "JSON",
  -7,
  "json",
  0
]
OUTPUT
.end


# no. 20
.sub test_create_json_of_hash
    .local pmc hash

    new hash, 'Hash'
    hash["alpha"] = 29
    hash["beta"] = "B"
    hash["gamma"] = 3.1
    hash["delta"] = "DELTA"

    $S0 = _json( hash, 1 )
    is($S0, <<'OUTPUT', 'Create JSON of hash')
{
  "alpha" : 29,
  "beta" : "B",
  "delta" : "DELTA",
  "gamma" : 3.1
}
OUTPUT
.end


# no. 21
.sub test_create_non_pretty_json_of_hash
    .local pmc hash

    new hash, 'Hash'
    hash["alpha"] = 29
    hash["beta"] = "B"
    hash["gamma"] = 3.1
    hash["delta"] = "DELTA"

    $S0 = _json( hash, 0 )
    is($S0, '{"alpha":29,"beta":"B","delta":"DELTA","gamma":3.1}', 'Create non-pretty JSON of hash')
.end


# no. 22
.sub test_create_json_of_nested_structure_including_resizablepmcarray_and_empties
    .local pmc street1, street2, city1, city2, country, world

    street1 = new 'Hash'
    street1["Perl"] = "Highway"
    street1["Python"] = "Grove"
    street1["Ruby"] = "Lane"

    street2 = new 'Hash'  # empty

    city1 = new 'ResizablePMCArray'
    push city1, street1
    push city1, street2

    city2 = new 'FixedPMCArray'  # empty

    country = new 'FixedPMCArray'
    country = 2
    country[0] = city1
    country[1] = city2

    world = new 'Hash'
    world["population"] = 1234567890
    world["some_country"] = country

    $S0 = _json( world, 1 )
    is($S0, <<'OUTPUT', 'Create JSON of nested structure including ResizablePMCArray and empties')
{
  "population" : 1234567890,
  "some_country" : [
    [
      {
        "Perl" : "Highway",
        "Python" : "Grove",
        "Ruby" : "Lane"
      },
      {
      }
    ],
    [
    ]
  ]
}
OUTPUT
.end


# no. 23
.sub test_create_non_pretty_json_of_nested_structure
    .local pmc street1, street2, city1, city2, country, world

    street1 = new 'Hash'
    street1["Perl"] = "Highway"
    street1["Python"] = "Grove"
    street1["Ruby"] = "Lane"

    street2 = new 'Hash'  # empty

    city1 = new 'ResizablePMCArray'
    push city1, street1
    push city1, street2

    city2 = new 'FixedPMCArray'  # empty

    country = new 'FixedPMCArray'
    country = 2
    country[0] = city1
    country[1] = city2

    world = new 'Hash'
    world["population"] = 1234567890
    world["some_country"] = country

    $S0 = _json( world, 0 )
    is($S0, '{"population":1234567890,"some_country":[[{"Perl":"Highway","Python":"Grove","Ruby":"Lane"},{}],[]]}', 'Create non-pretty JSON of nested structure')
.end


# no. 24..27
.sub test_create_json_of_string_pmcs
    .local pmc s

    s = new 'String'
    s = ''
    $S0 = _json( s, 0 )
    is($S0, '""', 'Create JSON of String PMCs')
    $S0 = _json( s, 1 )
    is($S0, "\"\"\n", 'Create JSON of String PMCs')

    s = new 'String'
    s = "12345\"67890"
    $S0 = _json( s, 0 )
    is($S0, '"12345\"67890"', 'Create JSON of String PMCs')
    $S0 = _json( s, 1 )
    is($S0, "\"12345\\\"67890\"\n", 'Create JSON of String PMCs')
.end


# no. 28..31
.sub test_create_json_of_integer_pmcs
    .local pmc i

    i = new 'Integer'
    i = 0
    $S0 = _json( i, 0 )
    is($S0, 0, 'Create JSON of String PMCs')
    $S0 = _json( i, 1 )
    is($S0, "0\n", 'Create JSON of String PMCs')

    i = new 'Integer'
    i = -42
    $S0 = _json( i, 0 )
    is($S0, -42, 'Create JSON of String PMCs')
    $S0 = _json( i, 1 )
    is($S0, "-42\n", 'Create JSON of String PMCs')
.end


# no. 32..35
.sub test_create_json_of_boolean_pmcs
    .local pmc b

    b = new 'Boolean'
    b = 0
    $S0 = _json( b, 0 )
    is($S0, 'false', 'Create JSON of Boolean PMCs')
    $S0 = _json( b, 1 )
    is($S0, "false\n", 'Create JSON of Boolean PMCs')

    b = new 'Boolean'
    b = 1
    $S0 = _json( b, 0 )
    is($S0, 'true', 'Create JSON of Boolean PMCs')
    $S0 = _json( b, 1 )
    is($S0, "true\n", 'Create JSON of Boolean PMCs')
.end


# no. 36..39
.sub test_create_json_of_null_and_undef
    .local pmc n
    null n

    $S0 = _json( n, 0 )
    is($S0, 'null', 'Create JSON of null and .Undef')
    $S0 = _json( n, 1 )
    is($S0, "null\n", 'Create JSON of null and .Undef')

    n = new 'Undef'
    $S0 = _json( n, 0 )
    is($S0, 'null', 'Create JSON of null and .Undef')
    $S0 = _json( n, 1 )
    is($S0, "null\n", 'Create JSON of null and .Undef')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
