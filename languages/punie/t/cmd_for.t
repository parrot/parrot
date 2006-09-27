#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'cmd.for');
#!./perl

# $Header: cmd.for,v 1.0 87/12/18 13:12:05 root Exp $

print "1..2\n";

for ($i = 0; $i <= 10; $i++) {
    $x[$i] = $i;
}
$y = $x[10];
print "#1	:$y: eq :10:\n";
$y = join(' ', @x);
print "#1	:$y: eq :0 1 2 3 4 5 6 7 8 9 10:\n";
if (join(' ', @x) eq '0 1 2 3 4 5 6 7 8 9 10') {
	print "ok 1\n";
} else {
	print "not ok 1\n";
}

$i = $c = 0;
for (;;) {
	$c++;
	last if $i++ > 10;
}
if ($c == 12) {print "ok 2\n";} else {print "not ok 2\n";}

EOC
1..2
ok 1
ok 2
OUT

}
