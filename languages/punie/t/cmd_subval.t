#!/usr/bin/perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

TODO: {
    local $TODO = 'unimplemented feature';

    language_output_is( 'punie', <<'EOC', <<'OUT', 'cmd.subval' );
#!./perl

# $Header: cmd.subval,v 1.0 87/12/18 13:12:12 root Exp $

sub foo1 {
    'true1';
    if ($_[0]) { 'true2'; }
}

sub foo2 {
    'true1';
    if ($_[0]) { 'true2'; } else { 'true3'; }
}

sub foo3 {
    'true1';
    unless ($_[0]) { 'true2'; }
}

sub foo4 {
    'true1';
    unless ($_[0]) { 'true2'; } else { 'true3'; }
}

sub foo5 {
    'true1';
    'true2' if $_[0];
}

sub foo6 {
    'true1';
    'true2' unless $_[0];
}

print "1..12\n";

if (do foo1(0) eq '') {print "ok 1\n";} else {print "not ok 1\n";}
if (do foo1(1) eq 'true2') {print "ok 2\n";} else {print "not ok 2\n";}
if (do foo2(0) eq 'true3') {print "ok 3\n";} else {print "not ok 3\n";}
if (do foo2(1) eq 'true2') {print "ok 4\n";} else {print "not ok 4\n";}

if (do foo3(0) eq 'true2') {print "ok 5\n";} else {print "not ok 5\n";}
if (do foo3(1) eq '') {print "ok 6\n";} else {print "not ok 6\n";}
if (do foo4(0) eq 'true2') {print "ok 7\n";} else {print "not ok 7\n";}
if (do foo4(1) eq 'true3') {print "ok 8\n";} else {print "not ok 8\n";}

if (do foo5(0) eq '') {print "ok 9\n";} else {print "not ok 9\n";}
if (do foo5(1) eq 'true2') {print "ok 10\n";} else {print "not ok 10\n";}
if (do foo6(0) eq 'true2') {print "ok 11\n";} else {print "not ok 11\n";}
if (do foo6(1) eq '') {print "ok 12\n";} else {print "not ok 12\n";}
f (/^foo/) { print "not ok 2\n"; } else { print "ok 2\n";}

EOC
1..12
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
ok 12
OUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
