#!perl
# Copyright (C) 2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( lib );

use Test::More;
use Parrot::Test tests => 26;

=head1 NAME

t/library/yaml_dumper.t - test dumping of data in YAML format

=head1 SYNOPSIS

    % prove t/library/yaml_dumper.t

=head1 DESCRIPTION

Tests data dumping in YAML format.

=cut


pir_output_is( <<'CODE', <<'OUT', "dumping array of sorted numbers" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizablePMCArray'
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

    yaml( array, "array" )
.end
CODE
---
{
    "array" : !ResizablePMCArray [
        !Integer [ 0 ],
        !Integer [ 1 ],
        !Integer [ 2 ],
        !Integer [ 3 ],
        !Integer [ 4 ],
        !Integer [ 5 ],
        !Integer [ 6 ],
        !Integer [ 7 ],
        !Integer [ 8 ],
        !Integer [ 9 ],
    ],
}
OUT


pir_output_is( <<'CODE', <<'OUT', "dumping unsorted numbers" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizablePMCArray'
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

    yaml( array, "array" )
.end
CODE
---
{
    "array" : !ResizablePMCArray [
        !Integer [ 6 ],
        !Integer [ 1 ],
        !Integer [ 8 ],
        !Integer [ 3 ],
        !Integer [ 2 ],
        !Integer [ 9 ],
        !Integer [ 7 ],
        !Integer [ 4 ],
        !Integer [ 0 ],
        !Integer [ 5 ],
    ],
}
OUT


pir_output_is( <<'CODE', <<'OUT', "dumping sorted strings" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizablePMCArray'
    push array, "alpha"
    push array, "bravo"
    push array, "charlie"
    push array, "delta"
    push array, "echo"
    push array, "foxtrot"
    push array, "golf"
    push array, "hotel"

    yaml( array, "strings" )
.end
CODE
---
{
    "strings" : !ResizablePMCArray [
        !String [ "alpha" ],
        !String [ "bravo" ],
        !String [ "charlie" ],
        !String [ "delta" ],
        !String [ "echo" ],
        !String [ "foxtrot" ],
        !String [ "golf" ],
        !String [ "hotel" ],
    ],
}
OUT


pir_output_is( <<'CODE', <<'OUT', "sorting unsorted strings" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizablePMCArray'
    push array, "charlie"
    push array, "hotel"
    push array, "alpha"
    push array, "delta"
    push array, "foxtrot"
    push array, "golf"
    push array, "bravo"
    push array, "echo"

    yaml( array, "strings" )
.end
CODE
---
{
    "strings" : !ResizablePMCArray [
        !String [ "charlie" ],
        !String [ "hotel" ],
        !String [ "alpha" ],
        !String [ "delta" ],
        !String [ "foxtrot" ],
        !String [ "golf" ],
        !String [ "bravo" ],
        !String [ "echo" ],
    ],
}
OUT


pir_output_is( <<'CODE', <<'OUT', "dumping different types" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizablePMCArray'
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

    yaml( array, "array" )
.end
CODE
---
{
    "array" : !ResizablePMCArray [
        !Float [ 0.1 ],
        !String [ "charlie" ],
        !Integer [ 2 ],
        !String [ "hotel" ],
        !Integer [ 5 ],
        !String [ "alpha" ],
        !Float [ 0.2 ],
        !String [ "delta" ],
        !Integer [ 4 ],
        !String [ "foxtrot" ],
        !Float [ 0.5 ],
        !Float [ 0.4 ],
        !Integer [ 1 ],
        !String [ "golf" ],
        !Float [ 0.3 ],
        !Integer [ 3 ],
        !String [ "bravo" ],
        !Float [ 0 ],
        !Integer [ 0 ],
        !String [ "echo" ],
    ],
}
OUT


pir_output_is( <<'CODE', <<'OUT', "dumping complex data" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc hash1
    .local pmc hash2
    .local pmc hash3
    .local pmc array1
    .local pmc array2

    new hash1, 'Hash'
    new hash2, 'Hash'
    new hash3, 'Hash'
    new array1, 'ResizablePMCArray'
    new array2, 'ResizablePMCArray'

    yaml( hash1,"hash1" )

    $S0 = "hello"
    $S1 = "world"
    set hash1[$S0], $S1

    yaml( hash1,"hash1" )

    $S0 = "hello2"
    $S1 = "world2"
    set hash1[$S0], $S1

    yaml( hash1,"hash1" )

    $S0 = "hash2"
    set hash1[$S0], hash2

    yaml( hash1,"hash1" )

    $S0 = "hello3"
    $S1 = "world3"
    set hash2[$S0], $S1

    yaml( hash1,"hash1" )

    $S0 = "name"
    $S1 = "parrot"
    set hash3[$S0], $S1
    $S0 = "is"
    $S1 = "cool"
    set hash3[$S0], $S1

    push array1, "this"
    push array1, "is"
    push array1, "a"
    push array1, "test"
    push array1, hash3

    $S0 = "array1"
    set hash2[$S0], array1

    yaml( hash1,"hash1" )

.end
CODE
---
{
    "hash1" : !Hash {
    },
}
---
{
    "hash1" : !Hash {
        "hello" : !String [ "world" ],
    },
}
---
{
    "hash1" : !Hash {
        "hello" : !String [ "world" ],
        "hello2" : !String [ "world2" ],
    },
}
---
{
    "hash1" : !Hash {
        "hash2" : !Hash {
        },
        "hello" : !String [ "world" ],
        "hello2" : !String [ "world2" ],
    },
}
---
{
    "hash1" : !Hash {
        "hash2" : !Hash {
            "hello3" : !String [ "world3" ],
        },
        "hello" : !String [ "world" ],
        "hello2" : !String [ "world2" ],
    },
}
---
{
    "hash1" : !Hash {
        "hash2" : !Hash {
            "array1" : !ResizablePMCArray [
                !String [ "this" ],
                !String [ "is" ],
                !String [ "a" ],
                !String [ "test" ],
                !Hash {
                    "is" : !String [ "cool" ],
                    "name" : !String [ "parrot" ],
                },
            ],
            "hello3" : !String [ "world3" ],
        },
        "hello" : !String [ "world" ],
        "hello2" : !String [ "world2" ],
    },
}
OUT


pir_output_is( <<'CODE', <<'OUT', "properties", todo => 'not yet implemented' );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc str
    .local pmc array

    new array, 'ResizablePMCArray'
    push array, "test1"
    push array, "test2"

    new str, 'String'
    set str, "value1"
    setprop array, "key1", str

    new str, 'String'
    set str, "value2"
    setprop array, "key2", str

    yaml( array )

.end
CODE
---
{
    "VAR1" : !ResizablePMCArray [
        !"key1" : !String [ "value1" ],
        !"key2" : !String [ "value2" ],
        "test1",
        "test2",
    ],
}
OUT


pir_output_is( <<'CODE', <<'OUT', "indent string", todo => 'not supported' );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc hash1
    .local pmc hash2
    .local pmc array1
    .local pmc array2
    .local string name
    .local string indent

    new hash1, 'Hash'
    new hash2, 'Hash'
    new array1, 'ResizablePMCArray'
    new array2, 'ResizablePMCArray'

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
    yaml( hash1, name, indent )
    yaml( hash1, name, indent )
    print "name = '"
    print name
    print "'\nindent = '"
    print indent
    print "'\n"
.end
CODE
"hash" : Hash {
|  "hash2" : Hash {
|  |  "array" : ResizablePMCArray (size:2) [
|  |  |  1,
|  |  |  ResizablePMCArray (size:1) [
|  |  |  |  "test"
|  |  |  ]
|  |  ],
|  |  "test2" : "test2"
|  },
|  "test1" : "test1"
} with-properties: Hash {
|  "array2" : \hash["hash2"]["array"][1]
}
"hash" : Hash {
|  "hash2" : Hash {
|  |  "array" : ResizablePMCArray (size:2) [
|  |  |  1,
|  |  |  ResizablePMCArray (size:1) [
|  |  |  |  "test"
|  |  |  ]
|  |  ],
|  |  "test2" : "test2"
|  },
|  "test1" : "test1"
} with-properties: Hash {
|  "array2" : \hash["hash2"]["array"][1]
}
name = 'hash'
indent = '|  '
OUT


pir_output_is( <<'CODE', <<'OUT', "back-referencing properties", todo => 'not yet implemented' );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc hash

    new hash, 'Hash'

    set hash["hello"], "world"
    setprop hash, "backref", hash
    yaml( hash )
.end
CODE
"VAR1" : Hash {
    "hello" : "world"
} with-properties: Hash {
    "backref" : \VAR1
}
OUT


pir_output_is( <<'CODE', <<'OUT', "self-referential properties (1)", todo => 'not yet implemented' );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc hash
    .local pmc prop

    new hash, 'Hash'

    set hash["hello"], "world"
    setprop hash, "self", hash
    prophash prop, hash
    setprop hash, "self", prop
    yaml( hash )
.end
CODE
"VAR1" : Hash {
    "hello" : "world"
} with-properties: Hash {
    "self" : \VAR1.properties()
}
OUT


pir_output_is( <<'CODE', <<'OUT', "self-referential properties (2)", todo => 'not yet implemented' );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array
    .local pmc hash1
    .local pmc hash2
    .local pmc prop

    new array, 'ResizablePMCArray'
    new hash1, 'Hash'
    new hash2, 'Hash'

    set hash1["hello1"], "world1"
    set hash2["hello2"], "world2"
    setprop hash1, "das leben", hash2
    prophash prop, hash1
    set prop["das leben"], "ist schoen"
    setprop hash2, "hash1prop", prop
    push array, hash1
    push array, hash2
    push array, prop
    prophash prop, hash2
    push array, prop
    yaml( array )
.end
CODE
"VAR1" : ResizablePMCArray (size:4) [
    Hash {
        "hello1" : "world1"
    } with-properties: Hash {
        "das leben" : "ist schoen"
    },
    Hash {
        "hello2" : "world2"
    } with-properties: Hash {
        "hash1prop" : \VAR1[0].properties()
    },
    \VAR1[0].properties(),
    \VAR1[1].properties()
]
OUT


pir_output_is( <<'CODE', <<'OUT', "dumping objects" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc temp
    .local pmc array

    newclass temp, "TestClass"

    new array, 'ResizablePMCArray'
    temp = new "TestClass"
    push array, temp
    $P0 = get_class 'TestClass'
    temp = new $P0
    push array, temp

    yaml( array )
.end

.namespace ["TestClass"]

.sub __yaml :method
    .param pmc dumper
    .param string dname
    .local string subindent
    .local string indent
    .local string name

    (subindent, indent) = dumper."newIndent"()
    print "{\n"

    print subindent
    print "this is\n"

    print subindent
    print "_"
    typeof name, self
    print name
    print "::__yaml,\n"

    print indent
    print "}"

    dumper."deleteIndent"()

    .begin_return
    .end_return
.end
.namespace []
CODE
---
{
    "VAR1" : !ResizablePMCArray [
        !TestClass {
            this is
            _TestClass::__yaml,
        },
        !TestClass {
            this is
            _TestClass::__yaml,
        },
    ],
}
OUT


pir_output_is( <<'CODE', <<'OUT', "dumping 'null'" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array
    .local pmc temp

    new array, 'ResizablePMCArray'

    push array, 0
    push array, "0"

    null temp
    push array, temp

    new temp, 'Integer'
    set temp, 0
    push array, temp

    new temp, 'String'
    set temp, "0"
    push array, temp

    yaml( array, "array" )
.end
CODE
---
{
    "array" : !ResizablePMCArray [
        !Integer [ 0 ],
        !String [ "0" ],
        null,
        !Integer [ 0 ],
        !String [ "0" ],
    ],
}
OUT


pir_output_is( << 'CODE', << 'OUT', "dumping strings" );

.sub _test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array
    array = new 'ResizablePMCArray'

    .local pmc pmc_string, pmc_perl_string
    .local string string_1

    pmc_string = new 'String'
    pmc_string = "This is a String PMC"
    push array, pmc_string

    pmc_perl_string = new 'String'
    pmc_perl_string = "This is a String PMC"
    push array, pmc_perl_string

    string_1 = "This is a String"
    push array, string_1

    yaml( array, "array of various strings" )
.end
CODE
---
{
    "array of various strings" : !ResizablePMCArray [
        !String [ "This is a String PMC" ],
        !String [ "This is a String PMC" ],
        !String [ "This is a String" ],
    ],
}
OUT


pir_output_is( <<'CODE', <<'OUT', "dumping complex data in Hash" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc hash1
    .local pmc hash2
    .local pmc hash3
    .local pmc array1

    new hash1, 'Hash'
    new hash2, 'Hash'
    new hash3, 'Hash'
    new array1, 'ResizablePMCArray'

    yaml( hash1,"hash1" )

    $S0 = "hello"
    $S1 = "world"
    set hash1[$S0], $S1

    yaml( hash1,"hash1" )

    $S0 = "hello2"
    $S1 = "world2"
    set hash1[$S0], $S1

    yaml( hash1,"hash1" )

    $S0 = "hash2"
    set hash1[$S0], hash2

    yaml( hash1,"hash1" )

    $S0 = "hello3"
    $S1 = "world3"
    set hash2[$S0], $S1

    yaml( hash1,"hash1" )

    $S0 = "name"
    $S1 = "parrot"
    set hash3[$S0], $S1
    $S0 = "is"
    $S1 = "cool"
    set hash3[$S0], $S1

    array1 = 5
    array1[0] = "this"
    array1[1] = "is"
    array1[2] = "a"
    array1[3] = "test"
    array1[4] = hash3

    $S0 = "array1"
    set hash2[$S0], array1

    yaml( hash1,"hash1" )

.end
CODE
---
{
    "hash1" : !Hash {
    },
}
---
{
    "hash1" : !Hash {
        "hello" : !String [ "world" ],
    },
}
---
{
    "hash1" : !Hash {
        "hello" : !String [ "world" ],
        "hello2" : !String [ "world2" ],
    },
}
---
{
    "hash1" : !Hash {
        "hash2" : !Hash {
        },
        "hello" : !String [ "world" ],
        "hello2" : !String [ "world2" ],
    },
}
---
{
    "hash1" : !Hash {
        "hash2" : !Hash {
            "hello3" : !String [ "world3" ],
        },
        "hello" : !String [ "world" ],
        "hello2" : !String [ "world2" ],
    },
}
---
{
    "hash1" : !Hash {
        "hash2" : !Hash {
            "array1" : !ResizablePMCArray [
                !String [ "this" ],
                !String [ "is" ],
                !String [ "a" ],
                !String [ "test" ],
                !Hash {
                    "is" : !String [ "cool" ],
                    "name" : !String [ "parrot" ],
                },
            ],
            "hello3" : !String [ "world3" ],
        },
        "hello" : !String [ "world" ],
        "hello2" : !String [ "world2" ],
    },
}
OUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping Integer PMC" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc int1

    new int1, 'Integer'
    int1 = 12345
    yaml( int1, "Int" )
.end
CODE
---
{
    "Int" : !Integer [ 12345 ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping Float PMC" );

.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc float1

    new float1, 'Float'
    float1 = 12345.678
    yaml( float1, "Float" )
.end
CODE
---
{
    "Float" : !Float [ 12345.678 ],
}
OUTPUT



pir_output_is( <<'CODE', <<'OUTPUT', "dumping ResizablePMCArray PMC" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizablePMCArray'
    push array, 12345
    push array, "hello"
    yaml( array, "array" )
.end
CODE
---
{
    "array" : !ResizablePMCArray [
        !Integer [ 12345 ],
        !String [ "hello" ],
    ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping ResizableStringArray PMC" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizableStringArray'
    push array, "hello"
    push array, "world"
    yaml( array, "array:" )
.end
CODE
---
{
    "array:" : !ResizableStringArray [
        !String [ "hello" ],
        !String [ "world" ],
    ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping ResizableIntegerArray PMC" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizableIntegerArray'
    push array, 12345
    push array, 67890
    yaml( array, "array:" )
.end
CODE
---
{
    "array:" : !ResizableIntegerArray [
        !Integer [ 12345 ],
        !Integer [ 67890 ],
    ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping ResizableFloatArray PMC" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'ResizableFloatArray'
    push array, 123.45
    push array, 67.89
    yaml( array, "array:" )
.end
CODE
---
{
    "array:" : !ResizableFloatArray [
        !Float [ 123.45 ],
        !Float [ 67.89 ],
    ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping FixedPMCArray PMC" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'FixedPMCArray'
    array = 2
    array[0] = 12345
    array[1] = "hello"
    yaml( array, "array:" )
.end
CODE
---
{
    "array:" : !FixedPMCArray [
        !Integer [ 12345 ],
        !String [ "hello" ],
    ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping FixedStringArray PMC" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'FixedStringArray'
    array = 2
    array[0] = "hello"
    array[1] = "world"
    yaml( array, "array:" )
.end
CODE
---
{
    "array:" : !FixedStringArray [
        !String [ "hello" ],
        !String [ "world" ],
    ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping FixedIntegerArray PMC" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'FixedIntegerArray'
    array = 2
    array[0] = 12345
    array[1] = 67890
    yaml( array, "array:" )
.end
CODE
---
{
    "array:" : !FixedIntegerArray [
        !Integer [ 12345 ],
        !Integer [ 67890 ],
    ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "dumping FixedFloatArray PMC" );
.sub test :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc array

    new array, 'FixedFloatArray'
    array = 2
    array[0] = 123.45
    array[1] = 67.89
    yaml( array, "array:" )
.end
CODE
---
{
    "array:" : !FixedFloatArray [
        !Float [ 123.45 ],
        !Float [ 67.89 ],
    ],
}
OUTPUT


pir_output_is( <<'CODE', <<'OUTPUT', "custom dumper", todo => 'not yet implemented');
.sub main :main
    load_bytecode "yaml_dumper.pbc"
    .local pmc o, cl
    cl = subclass 'ResizablePMCArray', 'bar'
    o = new cl
    yaml(o)
.end

.namespace ["bar"]
.sub init :vtable :method
    .local pmc ar
    ar = getattribute self, ['ResizablePMCArray'], 'proxy'
    push ar, 1
    push ar, 2
.end

.sub __yaml :method
    .param pmc dumper
    .param string label
    print " {\n"
    .local pmc ar
    ar = getattribute self, ['ResizablePMCArray'], 'proxy'
    dumper.'yaml'('attr', ar)
    print "\n}"
.end
.namespace []

CODE
---
{
    "VAR1" : !bar {
        !ResizablePMCArray [
            !Integer [ 1 ],
            !Integer [ 2 ],
       ],
    },
}
OUTPUT

# pir_output_is(<<'CODE', <<'OUTPUT', "dumping IntegerArray PMC");
# pir_output_is(<<'CODE', <<'OUTPUT', "dumping FloatValArray PMC");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
