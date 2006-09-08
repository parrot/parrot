# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 41;

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

json_dump_is(<<'JSON', <<'OUT', 'integer');
1
JSON
"JSON" => 1
OUT

json_dump_is(<<'JSON', <<'OUT', 'float');
3.14
JSON
"JSON" => 3.14
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

json_dump_is(<<'JSON', <<'OUT', 'random object/array example',todo=>'TODO parse error');
{[],{[],{}},"str":true,{"a":"1",{},"b":"2"},[true],false,{[],"d":3}}
JSON
"JSON" => Hash {
    ResizablePMCArray (size:0) [
    ],
    Hash {
        ResizablePMCArray (size:0) [
        ],
        Hash {
        }
    },
    "str" => null,
    Hash {
        "a" => 1,
        "b" => 2,
        Hash {
        }
    },
    ResizablePMCArray (size:1) [
        1
    ],
    0,
    Hash {
        ResizablePMCArray (size:0) [
        ],
        "d" => 3
    }
}
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
