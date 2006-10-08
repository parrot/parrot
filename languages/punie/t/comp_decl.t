#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

TODO: {
    local $TODO = 'unimplemented feature';

    language_output_is( 'punie', <<'EOC', <<'OUT', 'comp.decl' );
#!./perl

# $Header: comp.decl,v 1.0 87/12/18 13:12:27 root Exp $

# check to see if subroutine declarations work everwhere

sub one {
    print "ok 1\n";
}
format one =
ok 5
.

print "1..7\n";

do one();
do two();

sub two {
    print "ok 2\n";
}
format two =
@<<<
$foo
.

if ($x eq $x) {
    sub three {
	print "ok 3\n";
    }
    do three();
}

do four();
$~ = 'one';
write;
$~ = 'two';
$foo = "ok 6";
write;
$~ = 'three';
write;

format three =
ok 7
.

sub four {
    print "ok 4\n";
}

EOC
1..7
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
OUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
