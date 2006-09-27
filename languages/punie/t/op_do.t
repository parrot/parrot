#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

language_output_is('punie', <<'CODE', <<'OUT', 'a do block');
do{
    print "ok 7\n";
    print "ok 8\n";
    print "ok 9\n";
};
CODE
ok 7
ok 8
ok 9
OUT

TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'op.do');
#!./perl

# $Header: op.do,v 1.0 87/12/18 13:13:20 root Exp $
sub foo1
{
    print $_[0];
    'value';
}

sub foo2
{
    shift(_);
    print $_[0];
    $x = 'value';
    $x;
}

print "1..8\n";

$_[0] = "not ok 1\n";
$result = do foo1("ok 1\n");
print "#2\t:$result: eq :value:\n";
if ($result EQ 'value') { print "ok 2\n"; } else { print "not ok 2\n"; }
if ($_[0] EQ "not ok 1\n") { print "ok 3\n"; } else { print "not ok 3\n"; }

$_[0] = "not ok 4\n";
$result = do foo2("not ok 4\n","ok 4\n","not ok 4\n");
print "#5\t:$result: eq :value:\n";
if ($result EQ 'value') { print "ok 5\n"; } else { print "not ok 5\n"; }
if ($_[0] EQ "not ok 4\n") { print "ok 6\n"; } else { print "not ok 6\n"; }

$result = do{print "ok 7\n"; 'value';};
print "#8\t:$result: eq :value:\n";
if ($result EQ 'value') { print "ok 8\n"; } else { print "not ok 8\n"; }

EOC
1..8
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
OUT

}
