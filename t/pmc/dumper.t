#! perl -w
use strict;

use Parrot::Test tests => 8;

output_is(<<'CODE', <<'OUT', "dumping array of sorted numbers");
##PIR##
.sub _main
    .local pmc array
    
    new array, .PerlArray
    push array, 0
    push array, 1
    push array, 2
    push array, 3
    push array, 4
    push array, 5
    push array, 6
    push array, 7
    push array, 8
    push array, 9

    _dumper( "array", array )
    end
.end
.include "library/dumper.imc"
CODE
"array" => PerlArray (size:10) [
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

output_is(<<'CODE', <<'OUT', "dumping unsorted numbers");
##PIR##
.sub _main
    .local pmc array
    
    new array, .PerlArray
    push array, 6
    push array, 1
    push array, 8
    push array, 3
    push array, 2
    push array, 9
    push array, 7
    push array, 4
    push array, 0
    push array, 5

    _dumper( "array", array )
    end
.end
.include "library/dumper.imc"
CODE
"array" => PerlArray (size:10) [
    6,
    1,
    8,
    3,
    2,
    9,
    7,
    4,
    0,
    5
]
OUT

output_is(<<'CODE', <<'OUT', "dumping sorted strings");
##PIR##
.sub _main
    .local pmc array
    
    new array, .PerlArray
    push array, "alpha"
    push array, "bravo"
    push array, "charlie"
    push array, "delta"
    push array, "echo"
    push array, "foxtrot"
    push array, "golf"
    push array, "hotel"

    _dumper( "strings", array )
    end
.end
.include "library/dumper.imc"
CODE
"strings" => PerlArray (size:8) [
    "alpha",
    "bravo",
    "charlie",
    "delta",
    "echo",
    "foxtrot",
    "golf",
    "hotel"
]
OUT

output_is(<<'CODE', <<'OUT', "sorting unsorted strings");
##PIR##
.sub _main
    .local pmc array
    
    new array, .PerlArray
    push array, "charlie"
    push array, "hotel"
    push array, "alpha"
    push array, "delta"
    push array, "foxtrot"
    push array, "golf"
    push array, "bravo"
    push array, "echo"

    _dumper( "strings", array )
    end
.end
.include "library/dumper.imc"
CODE
"strings" => PerlArray (size:8) [
    "charlie",
    "hotel",
    "alpha",
    "delta",
    "foxtrot",
    "golf",
    "bravo",
    "echo"
]
OUT

output_is(<<'CODE', <<'OUT', "dumping different types");
##PIR##
.sub _main
    .local pmc array
    
    new array, .PerlArray
    push array, 0.1
    push array, "charlie"
    push array, 2
    push array, "hotel"
    push array, 5
    push array, "alpha"
    push array, 0.2
    push array, "delta"
    push array, 4
    push array, "foxtrot"
    push array, 0.5
    push array, 0.4
    push array, 1
    push array, "golf"
    push array, 0.3
    push array, 3
    push array, "bravo"
    push array, 0.0
    push array, 0
    push array, "echo"

    _dumper( "array", array )
    end
.end
.include "library/dumper.imc"
CODE
"array" => PerlArray (size:20) [
    0.100000,
    "charlie",
    2,
    "hotel",
    5,
    "alpha",
    0.200000,
    "delta",
    4,
    "foxtrot",
    0.500000,
    0.400000,
    1,
    "golf",
    0.300000,
    3,
    "bravo",
    0,
    0,
    "echo"
]
OUT

output_is(<<'CODE', <<'OUT', "dumping complex data");
##PIR##
.sub _main
    .local pmc hash1
    .local pmc hash2
    .local pmc hash3
    .local pmc array1
    .local pmc array2
    
    new hash1, .PerlHash
    new hash2, .PerlHash
    new hash3, .PerlHash
    new array1, .PerlArray
    new array2, .PerlArray
    
    _dumper( "hash1", hash1 )

    S0 = "hello"
    S1 = "world"
    set hash1[S0], S1

    _dumper( "hash1", hash1 )

    S0 = "hello2"
    S1 = "world2"
    set hash1[S0], S1

    _dumper( "hash1", hash1 )

    S0 = "hash2"
    set hash1[S0], hash2
    
    _dumper( "hash1", hash1 )

    S0 = "hello3"
    S1 = "world3"
    set hash2[S0], S1
    
    _dumper( "hash1", hash1 )

    S0 = "name"
    S1 = "parrot"
    set hash3[S0], S1
    S0 = "is"
    S1 = "cool"
    set hash3[S0], S1
    
    push array1, "this"
    push array1, "is"
    push array1, "a"
    push array1, "test"
    push array1, hash3

    S0 = "array1"
    set hash2[S0], array1
    
    _dumper( "hash1", hash1 )

    end
.end
.include "library/dumper.imc"
CODE
"hash1" => PerlHash {
}
"hash1" => PerlHash {
    "hello" => "world",
}
"hash1" => PerlHash {
    "hello" => "world",
    "hello2" => "world2",
}
"hash1" => PerlHash {
    "hash2" => PerlHash {
    },
    "hello" => "world",
    "hello2" => "world2",
}
"hash1" => PerlHash {
    "hash2" => PerlHash {
        "hello3" => "world3",
    },
    "hello" => "world",
    "hello2" => "world2",
}
"hash1" => PerlHash {
    "hash2" => PerlHash {
        "array1" => PerlArray (size:5) [
            "this",
            "is",
            "a",
            "test",
            PerlHash {
                "is" => "cool",
                "name" => "parrot",
            }
        ],
        "hello3" => "world3",
    },
    "hello" => "world",
    "hello2" => "world2",
}
OUT

output_is(<<'CODE', <<'OUT', "properties");
##PIR##
.sub _main
    .local pmc str
    .local pmc array
    
    new array, .PerlArray
    push array, "test1"
    push array, "test2"

    new str, .PerlString
    set str, "value1"
    setprop array, "key1", str

    new str, .PerlString
    set str, "value2"
    setprop array, "key2", str

    _dumper( array )
    
    end
.end
.include "library/dumper.imc"
CODE
PerlArray (size:2) [
    "test1",
    "test2"
] with-properties: {
    "key1" => "value1",
    "key2" => "value2",
}
OUT

output_is(<<'CODE', <<'OUT', "indent string");
##PIR##
.sub _main
    .local pmc hash1
    .local pmc hash2
    .local pmc array1
    .local pmc array2
    .local string name
    .local string indent
    
    new hash1, .PerlHash
    new hash2, .PerlHash
    new array1, .PerlArray
    new array2, .PerlArray
    
    set hash1["hash2"], hash2
    set hash2["array"], array1
    set hash1["test1"], "test1"
    set hash2["test2"], "test2"
    push array1, 1
    push array1, array2
    push array2, "test"
    setprop hash1, "array2", array2    
    name = "hash"
    indent = "|"
    _dumper( name, hash1, indent )
    _dumper( name, hash1, indent )
    print "name = '"
    print name
    print "'\nindent = '"
    print indent
    print "'\n"
    end
.end
.include "library/dumper.imc"
CODE
|"hash" => PerlHash {
    |"hash2" => PerlHash {
        |"array" => PerlArray (size:2) [
            |1,
            |PerlArray (size:1) [
                |"test"
            |]
        |],
        |"test2" => "test2",
    |},
    |"test1" => "test1",
|} with-properties: {
    |"array2" => PerlArray (size:1) [
        |"test"
    |],
|}
|"hash" => PerlHash {
    |"hash2" => PerlHash {
        |"array" => PerlArray (size:2) [
            |1,
            |PerlArray (size:1) [
                |"test"
            |]
        |],
        |"test2" => "test2",
    |},
    |"test1" => "test1",
|} with-properties: {
    |"array2" => PerlArray (size:1) [
        |"test"
    |],
|}
name = 'hash'
indent = '|'
OUT
