#! perl -w

use strict;

use FindBin;
use lib $FindBin::Bin;

use P6CTest tests => 1;

##########################################
check_parse {
    name => "rfc73",

    pgm => [
#XXX	q{print scalar localtime;},
#XXX	q{print scalar localtime},
#XXX	q{print scalar(localtime);},
#XXX	q{print(scalar(localtime))},
	q{print(scalar(localtime()))},
    ],

    exp => [
	prefix(
		name => 'print',
		args => prefix(
			name => 'scalar',
			args => prefix(
				name => 'localtime',
				args => undef,
			),
		),
	),
    ],
};
