#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 12;
use run_pir;

my($pir,$expected);

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    _dumper("TEST",$P1)
    
    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
"TEST" => PerlArray (size:7) [
    0,
    0,
    -1,
    0,
    PerlArray (size:1) [
        -1
    ],
    PerlArray (size:1) [
        "THIS"
    ],
    PerlArray (size:1) [
        0
    ]
]
EOF

is(output($pir),$expected,"substitution init");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    ($P1,$I1) = __substitution_iter_next($P1)
    print $I1
    print "\n"
    _dumper("TEST",$P1)
    
    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
0
"TEST" => PerlArray (size:7) [
    0,
    0,
    -1,
    1,
    PerlArray (size:1) [
        -1
    ],
    PerlArray (size:1) [
        "THIS"
    ],
    PerlArray (size:1) [
        0
    ]
]
EOF

is(output($pir),$expected,"substitution next");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    ($P1,$I1) = __substitution_iter_next($P1)
    ($P1,$I1) = __substitution_iter_next($P1)
    print $I1
    print "\n"
    _dumper($P1,"TEST")
    
    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
1
"TEST" => PerlArray (size:7) [
    -1,
    0,
    0,
    1,
    PerlArray (size:1) [
        -1
    ],
    PerlArray (size:1) [
        "THIS"
    ],
    PerlArray (size:1) [
        0
    ]
]
EOF

is(output($pir),$expected,"substitution next overflow");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    ($P1,$I1) = __substitution_iter_next($P1)
    ($P1,$I1) = __substitution_iter_next($P1)
    $P1 = __substitution_iter_reset($P1)
    _dumper($P1,"TEST")
    
    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
"TEST" => PerlArray (size:7) [
    0,
    0,
    -1,
    0,
    PerlArray (size:1) [
        -1
    ],
    PerlArray (size:1) [
        "THIS"
    ],
    PerlArray (size:1) [
        0
    ]
]
EOF

is(output($pir),$expected,"substitution reset");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    $P1 = __substitution_replace($P1,"foo",0,4)
    _dumper($P1,"TEST")
    
    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
"TEST" => PerlArray (size:7) [
    1,
    1,
    -1,
    0,
    PerlArray (size:2) [
        -1,
        -1
    ],
    PerlArray (size:2) [
        "THIS",
        "foo"
    ],
    PerlArray (size:2) [
        0,
        1
    ]
]
EOF

is(output($pir),$expected,"substitution replace whole");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    $P1 = __substitution_replace($P1,"foo",0,4)
    $S0 = __substitution_integrate($P1) 
    print $S0
    print "\n"

    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
foo
EOF

is(output($pir),$expected,"substitution replace whole output");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    $P1 = __substitution_replace($P1,"foo",0,2)
    _dumper($P1,"TEST")
    
    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
"TEST" => PerlArray (size:7) [
    1,
    1,
    -1,
    0,
    PerlArray (size:3) [
        -1,
        2,
        -1
    ],
    PerlArray (size:3) [
        "THIS",
        "foo",
        "IS"
    ],
    PerlArray (size:3) [
        0,
        1,
        0
    ]
]
EOF

is(output($pir),$expected,"substitution replace begin");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    $P1 = __substitution_replace($P1,"foo",0,2)
    $S0 = __substitution_integrate($P1) 
    print $S0
    print "\n"

    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
fooIS
EOF

is(output($pir),$expected,"substitution replace begin output");

# XXX - not sure if I agree with last_pointer being set to 
# current_pointer after this call...
($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    $P1 = __substitution_replace($P1,"foo",1,2)
    _dumper($P1,"TEST")
    
    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
"TEST" => PerlArray (size:7) [
    2,
    1,
    2,
    0,
    PerlArray (size:4) [
        -1,
        2,
        3,
        -1
    ],
    PerlArray (size:4) [
        "THIS",
        "T",
        "foo",
        "S"
    ],
    PerlArray (size:4) [
        0,
        0,
        1,
        0
    ]
]
EOF

is(output($pir),$expected,"substitution replace middle");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    $P1 = __substitution_replace($P1,"foo",1,2)
    $S0 = __substitution_integrate($P1) 
    print $S0
    print "\n"

    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
TfooS
EOF

is(output($pir),$expected,"substitution replace middle output");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    $P1 = __substitution_replace($P1,"foo",2,2)
    _dumper($P1,"TEST")
    
    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
"TEST" => PerlArray (size:7) [
    2,
    1,
    1,
    0,
    PerlArray (size:3) [
        -1,
        2,
        -1
    ],
    PerlArray (size:3) [
        "THIS",
        "TH",
        "foo"
    ],
    PerlArray (size:3) [
        0,
        0,
        1
    ]
]
EOF

is(output($pir),$expected,"substitution replace end");

($pir,$expected) = (<<'EOPIR',<<'EOF');
  .pcc_sub _main prototyped

    $P1 = new PerlArray
    $P1 = __substitution_init("THIS")
    $P1 = __substitution_replace($P1,"foo",2,2)
    $S0 = __substitution_integrate($P1) 
    print $S0
    print "\n"

    end
  .end
  .include "library/dumper.imc"
  .include "languages/tcl/lib/substitution.imc"
EOPIR
THfoo
EOF

is(output($pir),$expected,"substitution replace middle end");
