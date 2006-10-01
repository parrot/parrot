#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 60;

=head1 NAME

t/compilers/json/to_parrot.t - test JSON to parrot conversions

=head1 SYNOPSIS

    % prove t/compilers/json/to_parrot.t

=head1 DESCRIPTION

Tests JSON->Parrot conversions.

=cut

json_dump_is(<<'JSON', <<'OUT', 'empty string');
""
JSON
"JSON" => ""
OUT

json_dump_is(<<'JSON', <<'OUT', 'string');
"json"
JSON
"JSON" => "json"
OUT

json_isnt('a', 'strings need quotes');

json_dump_is(<<'JSON', <<'OUT', 'string with backslash "');
"\"json\""
JSON
"JSON" => "\"json\""
OUT

json_dump_is(<<'JSON', <<'OUT', 'string with backslash \\');
"\\json\\"
JSON
"JSON" => "\\json\\"
OUT

json_dump_is(<<'JSON', <<'OUT', 'string with /');
"\/json\/"
JSON
"JSON" => "/json/"
OUT

json_dump_is(<<'JSON', <<'OUT', 'string with backslash b');
"\bjson\b"
JSON
"JSON" => "\bjson\b"
OUT

json_dump_is(<<'JSON', <<'OUT', 'string with backslash f');
"\fjson\f"
JSON
"JSON" => "\fjson\f"
OUT

json_dump_is(<<'JSON', <<'OUT', 'string with backslash n');
"\njson\n"
JSON
"JSON" => "\njson\n"
OUT

json_dump_is(<<'JSON', <<'OUT', 'string with backslash r');
"\rjson\r"
JSON
"JSON" => "\rjson\r"
OUT

json_dump_is(<<'JSON', <<'OUT', 'string with backslash t');
"\tjson\t"
JSON
"JSON" => "\tjson\t"
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int');
1
JSON
"JSON" => 1
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int minus');
-1
JSON
"JSON" => -1
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int frac');
3.14
JSON
"JSON" => 3.14
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int frac minus');
-3.14
JSON
"JSON" => -3.14
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int exp');
1e+11
JSON
"JSON" => 1e+11
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int exp');
2e-12
JSON
"JSON" => 2e-12
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int exp minus');
-1e+11
JSON
"JSON" => -1e+11
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int exp minus');
-2e-12
JSON
"JSON" => -2e-12
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int frac exp');
3.14e+10
JSON
"JSON" => 3.14e+10
OUT

json_dump_is(<<'JSON', <<'OUT', 'number int frac exp minus');
-3.14e+10
JSON
"JSON" => -3.14e+10
OUT

json_dump_is(<<'JSON', <<'OUT', 'null');
null
JSON
"JSON" => null
OUT

json_dump_is(<<'JSON', <<'OUT', 'true');
true
JSON
"JSON" => 1
OUT

json_dump_is(<<'JSON', <<'OUT', 'false');
false
JSON
"JSON" => 0
OUT

json_dump_is(<<'JSON', <<'OUT', 'empty array');
[]
JSON
"JSON" => ResizablePMCArray (size:0) [
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'simple array');
[1,2,3]
JSON
"JSON" => ResizablePMCArray (size:3) [
    1,
    2,
    3
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'simple array (check white spaces)');
[    1 , 2    ,  3   ]
JSON
"JSON" => ResizablePMCArray (size:3) [
    1,
    2,
    3
]
OUT


json_dump_is(<<'JSON', <<'OUT', 'array of empty arrays');
[[],[],[]]
JSON
"JSON" => ResizablePMCArray (size:3) [
    ResizablePMCArray (size:0) [
    ],
    ResizablePMCArray (size:0) [
    ],
    ResizablePMCArray (size:0) [
    ]
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'array of empty arrays (check white spaces)');
[    []  ,  [] , []     ]
JSON
"JSON" => ResizablePMCArray (size:3) [
    ResizablePMCArray (size:0) [
    ],
    ResizablePMCArray (size:0) [
    ],
    ResizablePMCArray (size:0) [
    ]
]
OUT


json_dump_is(<<'JSON', <<'OUT', 'array of arrays of integers');
[[1,2,3],[1,2,3],[1,2,3]]
JSON
"JSON" => ResizablePMCArray (size:3) [
    ResizablePMCArray (size:3) [
        1,
        2,
        3
    ],
    ResizablePMCArray (size:3) [
        1,
        2,
        3
    ],
    ResizablePMCArray (size:3) [
        1,
        2,
        3
    ]
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'array of empty strings');
["","",""]
JSON
"JSON" => ResizablePMCArray (size:3) [
    "",
    "",
    ""
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'array of strings');
["string a","string b","string c"]
JSON
"JSON" => ResizablePMCArray (size:3) [
    "string a",
    "string b",
    "string c"
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'array of empty objects');
[{},{},{}]
JSON
"JSON" => ResizablePMCArray (size:3) [
    Hash {
    },
    Hash {
    },
    Hash {
    }
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'array of empty objects (check white spaces)');
[    {} , {}  , {}    ]
JSON
"JSON" => ResizablePMCArray (size:3) [
    Hash {
    },
    Hash {
    },
    Hash {
    }
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'array of objects with one element');
[{"one":1},{"two":2},{"three":3}]
JSON
"JSON" => ResizablePMCArray (size:3) [
    Hash {
        "one" => 1
    },
    Hash {
        "two" => 2
    },
    Hash {
        "three" => 3
    }
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'array of objects with one element (white space check)');
[  { "one"  : 1 }  , {    "two"    :  2 } , {"three"  : 3} ]
JSON
"JSON" => ResizablePMCArray (size:3) [
    Hash {
        "one" => 1
    },
    Hash {
        "two" => 2
    },
    Hash {
        "three" => 3
    }
]
OUT


json_dump_is(<<'JSON', <<'OUT', 'array of objects with multiple elements');
[{"one":1,"two":2,"three":3},{"one":1,"two":2,"three":3},{"one":1,"two":2,"three":3}]
JSON
"JSON" => ResizablePMCArray (size:3) [
    Hash {
        "one" => 1,
        "three" => 3,
        "two" => 2
    },
    Hash {
        "one" => 1,
        "three" => 3,
        "two" => 2
    },
    Hash {
        "one" => 1,
        "three" => 3,
        "two" => 2
    }
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'array of boolean objects',todo=>'TODO RPA converts null child to undef.');
[false,true,null]
JSON
"JSON" => ResizablePMCArray (size:3) [
    0,
    1,
    null
]
OUT


json_dump_is(<<'JSON', <<'OUT', 'empty object');
{}
JSON
"JSON" => Hash {
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with one element');
{"one":1}
JSON
"JSON" => Hash {
    "one" => 1
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with numbers');
{"one":1,"two":2,"three":3}
JSON
"JSON" => Hash {
    "one" => 1,
    "three" => 3,
    "two" => 2
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with strings');
{"one":"string a","two":"string b","three":"string c"}
JSON
"JSON" => Hash {
    "one" => "string a",
    "three" => "string c",
    "two" => "string b"
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with strings (white space check)');
{  "one" : "string a"    ,   "two"  :  "string b" , "three"   : "string c"    }
JSON
"JSON" => Hash {
    "one" => "string a",
    "three" => "string c",
    "two" => "string b"
}
OUT


json_dump_is(<<'JSON', <<'OUT', 'object with one empty object');
{"one":{}}
JSON
"JSON" => Hash {
    "one" => Hash {
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with one object with one element');
{"one":{"one":1}}
JSON
"JSON" => Hash {
    "one" => Hash {
        "one" => 1
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with one object of various element with integers');
{"one":{"one":1,"two":2,"three":3}}
JSON
"JSON" => Hash {
    "one" => Hash {
        "one" => 1,
        "three" => 3,
        "two" => 2
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with one object of various element with strings');
{"one":{"one":"string a","two":"string b","three":"string c"}}
JSON
"JSON" => Hash {
    "one" => Hash {
        "one" => "string a",
        "three" => "string c",
        "two" => "string b"
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with one object of various element with strings (check white spaces)');
{   "one" :  { "one" :   "string a" , "two"  : "string b"  ,  "three" :  "string c"   }    }
JSON
"JSON" => Hash {
    "one" => Hash {
        "one" => "string a",
        "three" => "string c",
        "two" => "string b"
    }
}
OUT


json_dump_is(<<'JSON', <<'OUT', 'object with more than one empty object');
{"one":{},"two":{},"three":{}}
JSON
"JSON" => Hash {
    "one" => Hash {
    },
    "three" => Hash {
    },
    "two" => Hash {
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with more than one object with one integer element');
{"one":{"one":1},"two":{"two":2},"three":{"three":3}}
JSON
"JSON" => Hash {
    "one" => Hash {
        "one" => 1
    },
    "three" => Hash {
        "three" => 3
    },
    "two" => Hash {
        "two" => 2
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with more than one object with various integer elements');
{"one":{"one":1,"two":2,"three":3},"two":{"one":1,"two":2,"three":3},"three":{"one":1,"two":2,"three":3}}
JSON
"JSON" => Hash {
    "one" => Hash {
        "one" => 1,
        "three" => 3,
        "two" => 2
    },
    "three" => Hash {
        "one" => 1,
        "three" => 3,
        "two" => 2
    },
    "two" => Hash {
        "one" => 1,
        "three" => 3,
        "two" => 2
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with more than one object with one string element');
{"one":{"one":"string a"},"two":{"two":"string b"},"three":{"three":"string c"}}
JSON
"JSON" => Hash {
    "one" => Hash {
        "one" => "string a"
    },
    "three" => Hash {
        "three" => "string c"
    },
    "two" => Hash {
        "two" => "string b"
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with more than one object with various integer elements');
{"one":{"one":"string a","two":"string b","three":"string c"},"two":{"one":"string a","two":"string b","three":"string c"},"three":{"one":"string a","two":"string b","three":"string c"}}
JSON
"JSON" => Hash {
    "one" => Hash {
        "one" => "string a",
        "three" => "string c",
        "two" => "string b"
    },
    "three" => Hash {
        "one" => "string a",
        "three" => "string c",
        "two" => "string b"
    },
    "two" => Hash {
        "one" => "string a",
        "three" => "string c",
        "two" => "string b"
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with empty array');
{"one":[]}
JSON
"JSON" => Hash {
    "one" => ResizablePMCArray (size:0) [
    ]
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with array');
{"one":[1,2,3]}
JSON
"JSON" => Hash {
    "one" => ResizablePMCArray (size:3) [
        1,
        2,
        3
    ]
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with various arrays');
{"one":[1,2,3],"two":[1,2,3],"three":[1,2,3]}
JSON
"JSON" => Hash {
    "one" => ResizablePMCArray (size:3) [
        1,
        2,
        3
    ],
    "three" => ResizablePMCArray (size:3) [
        1,
        2,
        3
    ],
    "two" => ResizablePMCArray (size:3) [
        1,
        2,
        3
    ]
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'object with boolean values');
{"one":true,"two":false,"three":null}
JSON
"JSON" => Hash {
    "one" => 1,
    "three" => null,
    "two" => 0
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'example taken from the RFC');
{"Image":{"Width":800,"Height":600,"Title":"View from 15th Floor","Thumbnail":{"Url":"http://www.example.com/image/481989943","Height":125,"Width":"100"},"IDs":[116, 943, 234, 38793]}}
JSON
"JSON" => Hash {
    "Image" => Hash {
        "Height" => 600,
        "IDs" => ResizablePMCArray (size:4) [
            116,
            943,
            234,
            38793
        ],
        "Thumbnail" => Hash {
            "Height" => 125,
            "Url" => "http://www.example.com/image/481989943",
            "Width" => "100"
        },
        "Title" => "View from 15th Floor",
        "Width" => 800
    }
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'another example taken from the RFC',todo=>'check number precision');
[{"precision":"zip","Latitude":37.7668,"Longitude":-122.3959,"Address":"","City":"SAN FRANCISCO","State":"CA","Zip":"94107","Country":"US"},{"precision":"zip","Latitude":37.371991,"Longitude":-122.026020,"Address":"","City":"SUNNYVALE", "State":"CA", "Zip":"94085", "Country":"US"}]
JSON
"JSON" => ResizablePMCArray (size:2) [
    Hash {
        "Address" => "",
        "City" => "SAN FRANCISCO",
        "Country" => "US",
        "Latitude" => 37.7668,
        "Longitude" => -122.3959,
        "State" => "CA",
        "Zip" => "94107",
        "precision" => "zip"
    },
    Hash {
        "Address" => "",
        "City" => "SUNNYVALE",
        "Country" => "US",
        "Latitude" => 37.371991,
        "Longitude" => -122.026020,
        "State" => "CA",
        "Zip" => "94085",
        "precision" => "zip"
    }
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'random object/array example');
[[],[{},{}],{"str":true},{"a":"1","b":{},"c":"2"},[true],false,{"e":[],"d":3}]
JSON
"JSON" => ResizablePMCArray (size:7) [
    ResizablePMCArray (size:0) [
    ],
    ResizablePMCArray (size:2) [
        Hash {
        },
        Hash {
        }
    ],
    Hash {
        "str" => 1
    },
    Hash {
        "a" => "1",
        "b" => Hash {
        },
        "c" => "2"
    },
    ResizablePMCArray (size:1) [
        1
    ],
    0,
    Hash {
        "d" => 3,
        "e" => ResizablePMCArray (size:0) [
        ]
    }
]
OUT


# XXX Need many more tests, exercising all aspects of http://www.json.org/

sub json_dump_is {
    my ($code, $dumped, $reason, %args) = @_;

    chomp $code;
    $code =~ s{("|\\)}{\\$1}g;
    $code =~ s{\n}{\\n}g;

    return pir_output_is(<<"END_PIR", $dumped, $reason, %args);

.sub test :main
    load_bytecode 'compilers/json/JSON.pbc'
    load_bytecode 'library/dumper.pbc'

    .local pmc JSON, result
    JSON = compreg "JSON"
    result = JSON("$code")
    _dumper(result, "JSON")
.end
END_PIR

}

sub json_isnt {
    my ($code, $reason, %args) = @_;

    $code =~ s{("|\\)}{\\$1}g;
    $code =~ s{\n}{\\n}g;

    return pir_output_like(<<"END_PIR", qr/not a valid JSON value/, $reason, %args);

.sub test :main
    load_bytecode 'compilers/json/JSON.pbc'

    .local pmc JSON, result
    JSON = compreg "JSON"
    result = JSON("$code")
.end
END_PIR

}
