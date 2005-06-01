use strict;
use warnings;
use Parrot::Test tests => 4;
use Parrot::Test::PGE;


p6rule_is  ("   int argc ",
    [
        [ type    => 'int | double | float | char' ],
        [ ident   => '\w+' ],
        [ _MASTER => ':w<type> <ident>' ],
    ],
    "simple subrules");

p6rule_isnt("doggy",
    [
        [ type    => 'int | double | float | char' ],
        [ ident   => '\w+' ],
        [ _MASTER => ':w<type> <ident>' ],
    ],
    "simple subrules");

p6rule_is  ("(565) 325-2935",
    [
        [ digits => '\d+' ],
        [ exch => '\(<digits>\)' ],
        [ _MASTER => ':w<exch> <digits>-<digits>' ],
    ],
    "nested subrules");

p6rule_isnt("0-900-04-41-59",
    [
        [ digits => '\d+' ],
        [ exch => '\(<digits>\)' ],
        [ _MASTER => ':w<exch> <digits>-<digits>' ],
    ],
    "nested subrules");

# Don't forget to change the number of tests :-)
