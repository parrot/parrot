#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/library/dumper.t - Data Dumping

=head1 SYNOPSIS

	% perl -Ilib t/library/dumper.t

=head1 DESCRIPTION

Tests data dumping.

=cut

use strict;

use Parrot::Test tests => 13;

# no. 1
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

# no. 2
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

# no. 3
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

# no. 4
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

# no. 5
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

# no. 6
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
    "hello" => "world"
}
"hash1" => PerlHash {
    "hello" => "world",
    "hello2" => "world2"
}
"hash1" => PerlHash {
    "hash2" => PerlHash {
    },
    "hello" => "world",
    "hello2" => "world2"
}
"hash1" => PerlHash {
    "hash2" => PerlHash {
        "hello3" => "world3"
    },
    "hello" => "world",
    "hello2" => "world2"
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
                "name" => "parrot"
            }
        ],
        "hello3" => "world3"
    },
    "hello" => "world",
    "hello2" => "world2"
}
OUT

# no.7
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
"VAR1" => PerlArray (size:2) [
    "test1",
    "test2"
] with-properties: PerlHash {
    "key1" => "value1",
    "key2" => "value2"
}
OUT

# no. 8
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
    indent = "|  "
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
"hash" => PerlHash {
|  "hash2" => PerlHash {
|  |  "array" => PerlArray (size:2) [
|  |  |  1,
|  |  |  PerlArray (size:1) [
|  |  |  |  "test"
|  |  |  ]
|  |  ],
|  |  "test2" => "test2"
|  },
|  "test1" => "test1"
} with-properties: PerlHash {
|  "array2" => \hash["hash2"]["array"][1]
}
"hash" => PerlHash {
|  "hash2" => PerlHash {
|  |  "array" => PerlArray (size:2) [
|  |  |  1,
|  |  |  PerlArray (size:1) [
|  |  |  |  "test"
|  |  |  ]
|  |  ],
|  |  "test2" => "test2"
|  },
|  "test1" => "test1"
} with-properties: PerlHash {
|  "array2" => \hash["hash2"]["array"][1]
}
name = 'hash'
indent = '|  '
OUT

# no. 9
output_is(<<'CODE', <<'OUT', "back-referencing properties");
##PIR##
.sub _main
    .local pmc hash

    new hash, .PerlHash

    set hash["hello"], "world"
    setprop hash, "backref", hash
    _dumper( hash )
    end
.end
.include "library/dumper.imc"
CODE
"VAR1" => PerlHash {
    "hello" => "world"
} with-properties: PerlHash {
    "backref" => \VAR1
}
OUT

# no. 10
output_is(<<'CODE', <<'OUT', "self-referential properties");
##PIR##
.sub _main
    .local pmc hash
    .local pmc prop

    new hash, .PerlHash

    set hash["hello"], "world"
    prophash prop, hash
    setprop hash, "self", prop
    _dumper( hash )
    end
.end
.include "library/dumper.imc"
CODE
"VAR1" => PerlHash {
    "hello" => "world"
} with-properties: PerlHash {
    "self" => \VAR1.properties()
}
OUT

# no. 11
output_is(<<'CODE', <<'OUT', "self-referential properties");
##PIR##
.sub _main
    .local pmc array
    .local pmc hash1
    .local pmc hash2
    .local pmc prop

    new array, .PerlArray
    new hash1, .PerlHash
    new hash2, .PerlHash

    set hash1["hello1"], "world1"
    set hash2["hello2"], "world2"
    prophash prop, hash1
    set prop["das leben"], "ist schoen"
    setprop hash2, "hash1prop", prop
    push array, hash1
    push array, hash2
    push array, prop
    prophash prop, hash2
    push array, prop
    _dumper( array )
    end
.end
.include "library/dumper.imc"
CODE
"VAR1" => PerlArray (size:4) [
    PerlHash {
        "hello1" => "world1"
    } with-properties: PerlHash {
        "das leben" => "ist schoen"
    },
    PerlHash {
        "hello2" => "world2"
    } with-properties: PerlHash {
        "hash1prop" => \VAR1[0].properties()
    },
    \VAR1[0].properties(),
    \VAR1[1].properties()
]
OUT

# no. 12
output_is(<<'CODE', <<'OUT', "dumping objects");
##PIR##
.sub _main
    .local pmc temp
    .local pmc array

    newclass temp, "TestClass"

    find_type I0, "TestClass"
    new array, .PerlArray
    new temp, I0
    push array, temp
    new temp, I0
    push array, temp

    _dumper( array )
    end
.end

.namespace ["TestClass"]

.sub __dump method
    .param pmc dumper
    .local string subindent
    .local string indent
    .local string name

    (subindent, indent) = dumper."newIndent"()
    print "{\n"

    print subindent
    print "this is\n"

    print subindent
    print "_"
    classname name, self
    print name
    print "::__dump\n"

    print indent
    print "}"

    dumper."deleteIndent"()

    .pcc_begin_return
    .pcc_end_return
.end
.include "library/dumper.imc"
CODE
"VAR1" => PerlArray (size:2) [
    PMC 'TestClass' {
        this is
        _TestClass::__dump
    },
    PMC 'TestClass' {
        this is
        _TestClass::__dump
    }
]
OUT

# no. 13
output_is(<<'CODE', <<'OUT', "dumping 'null'");
##PIR##
.sub _main
    .local pmc array
    .local pmc temp

    new array, .PerlArray

    push array, 0

    push array, "0"

    null temp
    push array, temp

    new temp, .PerlInt
    set temp, 0
    push array, temp

    new temp, .PerlString
    set temp, "0"
    push array, temp

    _dumper( "array", array )
    end
.end
.include "library/dumper.imc"
CODE
"array" => PerlArray (size:5) [
    0,
    "0",
    null,
    0,
    "0"
]
OUT

