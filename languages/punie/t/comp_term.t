#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

TODO: {
    local $TODO = 'unimplemented feature';

    language_output_is( 'punie', <<'EOC', <<'OUT', 'comp.term' );
#!./perl

# $Header: comp.term,v 1.0 87/12/18 13:12:40 root Exp $

# tests that aren't important enough for base.term

print "1..9\n";

$x = "\\n";
print "#1\t:$x: eq " . ':\n:' . "\n";
if ($x eq '\n') {print "ok 1\n";} else {print "not ok 1\n";}

$x = "#2\t:$x: eq :\\n:\n";
print $x;
unless (index($x,'\\\\')>0) {print "ok 2\n";} else {print "not ok 2\n";}

if (length('\\\\') == 2) {print "ok 3\n";} else {print "not ok 3\n";}

$one = 'a';

if (length("\\n") == 2) {print "ok 4\n";} else {print "not ok 4\n";}
if (length("\\\n") == 2) {print "ok 5\n";} else {print "not ok 5\n";}
if (length("$one\\n") == 3) {print "ok 6\n";} else {print "not ok 6\n";}
if (length("$one\\\n") == 3) {print "ok 7\n";} else {print "not ok 7\n";}
if (length("\\n$one") == 3) {print "ok 8\n";} else {print "not ok 8\n";}
if (length("\\\n$one") == 3) {print "ok 9\n";} else {print "not ok 9\n";}


EOC
1..9
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
ok 8
ok 9
OUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
