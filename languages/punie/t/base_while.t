#!perl

# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;

language_output_is( 'punie', <<'CODE', <<'OUT', 'simple loops' );
while (0) {
  print "nok 1\n";
}
print "ok 1\n";

until (1) {
    print "nok 2\n";
}
print "ok 2\n";

CODE
ok 1
ok 2
OUT

language_output_is( 'punie', <<'CODE', <<'OUT', 'expr modifiers' );
print "ok 1\n" while 0;

print "ok 2\n";

print "ok 3\n" until 1;

CODE
ok 1
ok 2
ok 3
OUT

language_output_is( 'punie', <<'CODE', <<'OUT', 'for loop' );

$x = 1;
for (; $x <= 5; ) {
    print "ok "; print $x; print "\n";
    $x = $x + 1;
}
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUT
