#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id $

=head1 NAME

t/library/json.t - test JSON library

=head1 SYNOPSIS

    % perl -Ilib t/library/json.t

=head1 DESCRIPTION

Tests JSON->Parrot and Parrot->JSON conversions.

=cut

use strict;

use Parrot::Test tests => 22;
use Test::More;

# no. 1
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of an empty string');

.sub test :main
    .local string s
    s = ''

    $S0 = _json( s, 0 )
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
""
OUT

# no. 2
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of a non-empty string');

.sub test :main
    .local string s
    s = 'abcdeABCDE01234$%^&*'

    $S0 = _json( s, 0 )
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
"abcdeABCDE01234$%^&*"
OUT

# no. 3
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of a string with simple escapes');

.sub test :main
    .local string s
    s = "abcde\\ABCDE\"01234\n$%^&*"
    # XXX more escapes need to be tested; see http://www.crockford.com/JSON/
    $S0 = _json( s, 0 )
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
"abcde\\ABCDE\"01234\n$%^&*"
OUT

# no. 4
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of some integers');

.sub test :main
    .local int i
    i = 0
    $S0 = _json( i, 0 )
    print $S0
    print "\n"
    i = 35
    $S0 = _json( i, 0 )
    print $S0
    print "\n"
    i = -42
    $S0 = _json( i, 0 )
    print $S0
    print "\n"
    i = 2147483647
    $S0 = _json( i, 0 )
    print $S0
    print "\n"
    i = -2147483648
    $S0 = _json( i, 0 )
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
0
35
-42
2147483647
-2147483648
OUT

# no. 5
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of some numbers');

.sub test :main
    .local num n
    n = 0.0
    $S0 = _json( n )
    print $S0
    print "\n"
    n = 2.50
    $S0 = _json( n )
    print $S0
    print "\n"
    n = -42.0
    $S0 = _json( n )
    print $S0
    print "\n"
    n = 4.5e1
    $S0 = _json( n )
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
0
2.5
-42
45
OUT

# no. 6
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of various scalars with pretty option');

.sub test :main
    .local string s
    s = "abcde\\ABCDE\"01234\n$%^&*"
    $S0 = _json( s, 1 )
    print $S0

    .local int i
    i = -42
    $S0 = _json( i, 1 )
    print $S0

    .local num n
    n = 2.50
    $S0 = _json( n, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
"abcde\\ABCDE\"01234\n$%^&*"
-42
2.5
OUT

# no. 7
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of an array');

.sub test :main
    .local pmc array

    new array, .Array
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
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
[0,1,2,3,4,5,6,7,8,9]
OUT

# no. 8
pir_output_is(<<'CODE', <<'OUT', 'Create pretty JSON of an array');

.sub test :main
    .local pmc array

    new array, .Array
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
    print $S0
.end
.include 'library/JSON.imc'
CODE
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
OUT

# no. 9
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of array, keep element ordering');

.sub test :main
    .local pmc array

    new array, .Array
    array = 6
    array[0] = 35
    array[1] = 1
    array[2] = -5
    array[3] = 0
    array[4] = -2147483648
    array[5] = 2147483647

    $S0 = _json( array, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
[
  35,
  1,
  -5,
  0,
  -2147483648,
  2147483647
]
OUT

# no. 10
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of a mixed array');

.sub test :main
    .local pmc array

    new array, .Array
    array = 6
    array[0] = 0
    array[1] = 1500e-2
    array[2] = "JSON"
    array[3] = -7
    array[4] = "json"
    array[5] = 0.0

    $S0 = _json( array, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
[
  0,
  15,
  "JSON",
  -7,
  "json",
  0
]
OUT

# no. 11
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of hash');

.sub test :main
    .local pmc hash

    new hash, .Hash
    hash["alpha"] = 29
    hash["beta"] = "B"
    hash["gamma"] = 3.1
    hash["delta"] = "DELTA"

    $S0 = _json( hash, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
{
  "alpha" : 29,
  "beta" : "B",
  "delta" : "DELTA",
  "gamma" : 3.1
}
OUT

# no. 12
pir_output_is(<<'CODE', <<'OUT', 'Create non-pretty JSON of hash');

.sub test :main
    .local pmc hash

    new hash, .Hash
    hash["alpha"] = 29
    hash["beta"] = "B"
    hash["gamma"] = 3.1
    hash["delta"] = "DELTA"

    $S0 = _json( hash, 0 )
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
{"alpha":29,"beta":"B","delta":"DELTA","gamma":3.1}
OUT

# no. 13
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of nested structure including PerlArray and empties');

.sub test :main
    .local pmc street1, street2, city1, city2, country, world

    street1 = new .Hash
    street1["Perl"] = "Highway"
    street1["Python"] = "Grove"
    street1["Ruby"] = "Lane"

    street2 = new .Hash  # empty

    city1 = new .PerlArray
    push city1, street1
    push city1, street2

    city2 = new .Array  # empty

    country = new .Array
    country = 2
    country[0] = city1
    country[1] = city2

    world = new .Hash
    world["population"] = 1234567890
    world["some_country"] = country

    $S0 = _json( world, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
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
OUT

# no. 14
pir_output_is(<<'CODE', <<'OUT', 'Create non-pretty JSON of nested structure');

.sub test :main
    .local pmc street1, street2, city1, city2, country, world

    street1 = new .Hash
    street1["Perl"] = "Highway"
    street1["Python"] = "Grove"
    street1["Ruby"] = "Lane"

    street2 = new .Hash  # empty

    city1 = new .PerlArray
    push city1, street1
    push city1, street2

    city2 = new .Array  # empty

    country = new .Array
    country = 2
    country[0] = city1
    country[1] = city2

    world = new .Hash
    world["population"] = 1234567890
    world["some_country"] = country

    $S0 = _json( world, 0 )
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
{"population":1234567890,"some_country":[[{"Perl":"Highway","Python":"Grove","Ruby":"Lane"},{}],[]]}
OUT

# no. 15
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of String PMCs');

.sub test :main
    .local pmc s

    s = new .String
    s = ''
    $S0 = _json( s, 0 )
    print $S0
    print "\n"
    $S0 = _json( s, 1 )
    print $S0

    s = new .String
    s = "12345\"67890"
    $S0 = _json( s, 0 )
    print $S0
    print "\n"
    $S0 = _json( s, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
""
""
"12345\"67890"
"12345\"67890"
OUT

# no. 16
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of Integer PMCs');

.sub test :main
    .local pmc i

    i = new .Integer
    i = 0
    $S0 = _json( i, 0 )
    print $S0
    print "\n"
    $S0 = _json( i, 1 )
    print $S0

    i = new .Integer
    i = -42
    $S0 = _json( i, 0 )
    print $S0
    print "\n"
    $S0 = _json( i, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
0
0
-42
-42
OUT

# no. 17
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of Boolean PMCs');

.sub test :main
    .local pmc b

    b = new .Boolean
    b = 0
    $S0 = _json( b, 0 )
    print $S0
    print "\n"
    $S0 = _json( b, 1 )
    print $S0

    b = new .Boolean
    b = 1
    $S0 = _json( b, 0 )
    print $S0
    print "\n"
    $S0 = _json( b, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
false
false
true
true
OUT

# no. 18
pir_output_is(<<'CODE', <<'OUT', 'Create JSON of null and .Undef');

.sub test :main
    .local pmc n
    null n

    $S0 = _json( n, 0 )
    print $S0
    print "\n"
    $S0 = _json( n, 1 )
    print $S0

    n = new .Undef
    $S0 = _json( n, 0 )
    print $S0
    print "\n"
    $S0 = _json( n, 1 )
    print $S0
.end
.include 'library/JSON.imc'
CODE
null
null
null
null
OUT

SKIP: {
skip('_json_to_pmc: Not implemented',4);

# no. 19
pir_output_is(<<'CODE', <<'OUT', 'Decode JSON empty string');

.sub test :main
    $P0 = _json_to_pmc( '""' )
    $S0 = typeof $P0
    print $S0
    print "\n"

    $S0 = $P0
    print $S0
    print "\n"

.end
.include 'library/JSON.imc'
CODE
String

OUT

# no. 20
pir_output_is(<<'CODE', <<'OUT', 'Decode JSON null');

.sub test :main
    $P0 = _json_to_pmc( 'null' )
    if_null $P0, ok

    print "not "
ok:
    print "ok\n"
.end
.include 'library/JSON.imc'
CODE
ok
OUT

# no. 21
pir_output_is(<<'CODE', <<'OUT', 'Decode JSON true');

.sub test :main
    $P0 = _json_to_pmc( 'true' )
    $S0 = typeof $P0
    print $S0
    print "\n"

    $S0 = $P0
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
.Boolean
1
OUT

# no. 22
pir_output_is(<<'CODE', <<'OUT', 'Decode JSON false');

.sub test :main
    $P0 = _json_to_pmc( 'false' )
    $S0 = typeof $P0
    print $S0
    print "\n"

    $S0 = $P0
    print $S0
    print "\n"
.end
.include 'library/JSON.imc'
CODE
.Boolean
0
OUT

}
