#! perl -w

use strict;

use FindBin;
use lib $FindBin::Bin;

use P6CTest tests => 18;

##########################################
check_parse {
    name => "basic assign",

    pgm => [
        q{$a=1},

        q{ $a = 1 }, 

        q{$a=1;},

        q{# some comment
   $a=# more commant
1#and more
########},

        q{# some comment
   $a=# more commant
1#and more
########
},
    ],

    exp => [
	Binop(
		op => '=',
		l => variable(
			name => '$a',
			type => 'PerlUndef',
		),
		r => sv_literal(
			type => 'PerlInt',
			lval => 1,
		),
	),
    ],
};

##########################################
check_parse {
    name => "basic if",

    pgm => [
        q{if (1) {}},
        q{if 1 {}},
    ],

    exp => [
	prefix(
            name => 'if',
            args => [
                [
                    undef,
                    sv_literal(
                        type => 'PerlInt',
                        lval => 1,
                    ),
                    closure(
                        block => [],
                    ),
                ],
            ],
	),
    ],
};

##########################################
check_parse {
    name => "basic if-else",

    pgm => [
        q{if (1) {} else {}},
        q{if 1 {} else {}},
    ],

    exp => [
	prefix(
            name => 'if',
            args => [
                [
                    undef,
                    sv_literal(
                        type => 'PerlInt',
                        lval => 1,
                    ),
                    closure(
                        block => [],
                    ),
                ],
                [
                    "else",
                    1,
                    closure(
                        block => [],
                    ),
                ],
            ],
	),
    ],
};

##########################################
check_parse {
    name => "basic if-elseif",

    pgm => [
        q{if (1) {} elsif (2) {}},
        q{if 1 {} elsif (2) {}},
        q{if (1) {} elsif 2 {}},
        q{if 1 {} elsif 2 {}},
    ],

    exp => [
	prefix(
            name => 'if',
            args => [
                [
                    undef,
                    sv_literal(
                        type => 'PerlInt',
                        lval => 1,
                    ),
                    closure(
                        block => [],
                    ),
                ],
                [
                    "elsif",
                    sv_literal(
                        type => 'PerlInt',
                        lval => 2,
                    ),
                    closure(
                        block => [],
                    ),
                ],
            ],
	),
    ],
};

##########################################
check_parse {
    name => "multiple statements",

    pgm => [
        q{if (1) {
          }
          $a = 2;
         },
        q{if (1) {}
          $a = 2;
         },
        q{if 1 {}
          $a = 2;
         },
        q{if 1 {}
          # a comment
          $a = 2;
         },
        q{if (1) {} # a comment
          $a = 2;
         },
    ],

    exp => [
	prefix(
            name => 'if',
            args => [
                [
                    undef,
                    sv_literal(
                        type => 'PerlInt',
                        lval => 1,
                    ),
                    closure(
                        block => [],
                    ),
                ],
            ],
	),
	Binop(
		op => '=',
		l => variable(
			name => '$a',
			type => 'PerlUndef',
		),
		r => sv_literal(
			type => 'PerlInt',
			lval => 2,
		),
	)
    ],
};
