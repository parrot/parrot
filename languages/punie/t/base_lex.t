#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'base_cond.t');
#!./perl

# $Header: base.lex,v 1.0.1.1 88/01/28 10:37:00 root Exp $

print "1..6\n";

$ # this is the register <space>
= 'x';

print "#1	:$ : eq :x:\n";
if ($  eq 'x') {print "ok 1\n";} else {print "not ok 1\n";}

$x = $#;	# this is the register $#

if ($x eq '') {print "ok 2\n";} else {print "not ok 2\n";}

$x = $#x;

if ($x eq '-1') {print "ok 3\n";} else {print "not ok 3\n";}

$x = '\\'; # ';

if (length($x) == 1) {print "ok 4\n";} else {print "not ok 4\n";}

eval 'while (0) {
    print "foo\n";
}
/^/ && (print "ok 5\n");
';

eval '$foo{1} / 1;';
if (!$@) {print "ok 6\n";} else {print "not ok 6\n";}

EOC
1..6
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUT

}
