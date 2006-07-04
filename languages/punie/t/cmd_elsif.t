#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'cmd.elsif');
#!./perl

# $Header: cmd.elsif,v 1.0 87/12/18 13:12:02 root Exp $

sub foo {
    if ($_[0] == 1) {
	1;
    }
    elsif ($_[0] == 2) {
	2;
    }
    elsif ($_[0] == 3) {
	3;
    }
    else {
	4;
    }
}

print "1..4\n";

if (($x = do foo(1)) == 1) {print "ok 1\n";} else {print "not ok 1\n";}
if (($x = do foo(2)) == 2) {print "ok 2\n";} else {print "not ok 2\n";}
if (($x = do foo(3)) == 3) {print "ok 3\n";} else {print "not ok 3\n";}
if (($x = do foo(4)) == 4) {print "ok 4\n";} else {print "not ok 4\n";}

EOC
1..4
ok 1
ok 2
ok 3
ok 4
OUT

}
