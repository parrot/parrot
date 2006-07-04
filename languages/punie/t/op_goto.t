#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is('punie', <<'CODE', <<'OUT', 'a simple label');
label1: print "ok 1\n";
CODE
ok 1
OUT

TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'op.goto');
#!./perl

# $Header: op.goto,v 1.0 87/12/18 13:13:40 root Exp $

print "1..3\n";

while (0) {
    $foo = 1;
  label1:
    $foo = 2;
    goto label2;
} continue {
    $foo = 0;
    goto label4;
  label3:
    $foo = 4;
    goto label4;
}
goto label1;

$foo = 3;

label2:
print "#1\t:$foo: == 2\n";
if ($foo == 2) {print "ok 1\n";} else {print "not ok 1\n";}
goto label3;

label4:
print "#2\t:$foo: == 4\n";
if ($foo == 4) {print "ok 2\n";} else {print "not ok 2\n";}

$x = `./perl -e 'goto foo;' 2>&1`;
print "#3\t/label/ in :$x";
if ($x =~ /label/) {print "ok 3\n";} else {print "not ok 3\n";}

EOC
1..3
ok 1
ok 2
ok 3 
OUT

}
