#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 13;
use Test::More;

language_output_is('punie', <<'EOC', '1', 'printing one');
print 1;
EOC

language_output_is('punie', <<'EOC', '5', 'printing a single number');
print 5;
EOC

language_output_is('punie', <<'EOC', '42', 'printing a number with multiple digits');
print 42;
EOC

language_output_is('punie', <<'EOC', '64.999000', 'printing a number with decimal point');
print 64.999;
EOC

language_output_is('punie', <<'EOC', '135', 'printing multiple numbers');
print 1;
print 3;
print 5;
EOC

language_output_is('punie', <<'CODE', <<'OUT', 'printing simple strings');
print "ok 1\n";
print "ok 2\n";
CODE
ok 1
ok 2
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'printing single quoted strings');
print 'ok 1\n';
print 'ok 2\n';
print "\n";
CODE
ok 1\nok 2\n
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'printing list of strings');
print "ok 2\n","ok 3\n","ok 4\n","ok 5\n";
CODE
ok 2
ok 3
ok 4
ok 5
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'printing a few added values');
print 1 + 2 + 3;
print "\n";
CODE
6
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'printing a few added values');
print 1 + 2, "\n", 3 + 4, "\n";
CODE
3
7
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'printing a few subtracted values');
print 10 - 2 - 3;
print "\n";
CODE
5
OUT

language_output_is('punie', <<'CODE', <<'OUT', 'printing a few subtracted values');
print 1 - 2, "\n", 7 - 1, "\n";
CODE
-1
6
OUT


TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'io.print');
#!./perl

# $Header: io.print,v 1.0 87/12/18 13:12:55 root Exp $

print "1..11\n";

print stdout "ok 1\n";
print "ok 2\n","ok 3\n","ok 4\n","ok 5\n";

open(foo,">-");
print foo "ok 6\n";

printf "ok %d\n",7;
printf("ok %d\n",8);

@a = ("ok %d%c",9,ord("\n"));
printf @a;

$a[1] = 10;
printf stdout @a;

$, = ' ';
$\ = "\n";

print "ok","11";

EOC
1..11
ok 1
ok 2
ok 3 
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
ok 10
ok 11
OUT

}
