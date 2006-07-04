#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;
use Test::More;

language_output_is('punie', <<'EOC', <<'OUT', 'short circuiting AND');
$x = 1;
if (1 && $x) { print "ok 9\n";} else { print "not ok 9\n";}
if (0 && $x) { print "not ok 10\n";} else { print "ok 10\n";}
$x = '';
if (1 && $x) { print "not ok 11\n";} else { print "ok 11\n";}
if (0 && $x) { print "not ok 12\n";} else { print "ok 12\n";}

$a = 'a';
$x = 1;
if ($a eq 'a' && $x) { print "ok 25\n";} else { print "not ok 25\n";}
if ($a ne 'a' && $x) { print "not ok 26\n";} else { print "ok 26\n";}
$x = '';
if ($a eq 'a' && $x) { print "not ok 27\n";} else { print "ok 27\n";}
if ($a ne 'a' && $x) { print "not ok 28\n";} else { print "ok 28\n";}

EOC
ok 9
ok 10
ok 11
ok 12
ok 25
ok 26
ok 27
ok 28
OUT

language_output_is('punie', <<'EOC', <<'OUT', 'short circuiting OR');
$x = 1;
if (1 || $x) { print "ok 13\n";} else { print "not ok 13\n";}
if (0 || $x) { print "ok 14\n";} else { print "not ok 14\n";}
$x = '';
if (1 || $x) { print "ok 15\n";} else { print "not ok 15\n";}
if (0 || $x) { print "not ok 16\n";} else { print "ok 16\n";}

$a = 'a';
$x = 1;
if ($a eq 'a' || $x) { print "ok 29\n";} else { print "not ok 29\n";}
if ($a ne 'a' || $x) { print "ok 30\n";} else { print "not ok 30\n";}
$x = '';
if ($a eq 'a' || $x) { print "ok 31\n";} else { print "not ok 31\n";}
if ($a ne 'a' || $x) { print "not ok 32\n";} else { print "ok 32\n";}

EOC
ok 13
ok 14
ok 15
ok 16
ok 29
ok 30
ok 31
ok 32
OUT


TODO: {
local $TODO = 'unimplemented feature';

language_output_is('punie', <<'EOC', <<'OUT', 'comp.cmdopt');
#!./perl

# $Header: comp.cmdopt,v 1.0 87/12/18 13:12:19 root Exp $

print "1..40\n";

# test the optimization of constants

if (1) { print "ok 1\n";} else { print "not ok 1\n";}
unless (0) { print "ok 2\n";} else { print "not ok 2\n";}

if (0) { print "not ok 3\n";} else { print "ok 3\n";}
unless (1) { print "not ok 4\n";} else { print "ok 4\n";}

unless (!1) { print "ok 5\n";} else { print "not ok 5\n";}
if (!0) { print "ok 6\n";} else { print "not ok 6\n";}

unless (!0) { print "not ok 7\n";} else { print "ok 7\n";}
if (!1) { print "not ok 8\n";} else { print "ok 8\n";}

$x = 1;
if (1 && $x) { print "ok 9\n";} else { print "not ok 9\n";}
if (0 && $x) { print "not ok 10\n";} else { print "ok 10\n";}
$x = '';
if (1 && $x) { print "not ok 11\n";} else { print "ok 11\n";}
if (0 && $x) { print "not ok 12\n";} else { print "ok 12\n";}

$x = 1;
if (1 || $x) { print "ok 13\n";} else { print "not ok 13\n";}
if (0 || $x) { print "ok 14\n";} else { print "not ok 14\n";}
$x = '';
if (1 || $x) { print "ok 15\n";} else { print "not ok 15\n";}
if (0 || $x) { print "not ok 16\n";} else { print "ok 16\n";}


# test the optimization of registers

$x = 1;
if ($x) { print "ok 17\n";} else { print "not ok 17\n";}
unless ($x) { print "not ok 18\n";} else { print "ok 18\n";}

$x = '';
if ($x) { print "not ok 19\n";} else { print "ok 19\n";}
unless ($x) { print "ok 20\n";} else { print "not ok 20\n";}

# test optimization of string operations

$a = 'a';
if ($a eq 'a') { print "ok 21\n";} else { print "not ok 21\n";}
if ($a ne 'a') { print "not ok 22\n";} else { print "ok 22\n";}

if ($a =~ /a/) { print "ok 23\n";} else { print "not ok 23\n";}
if ($a !~ /a/) { print "not ok 24\n";} else { print "ok 24\n";}
# test interaction of logicals and other operations

$a = 'a';
$x = 1;
if ($a eq 'a' && $x) { print "ok 25\n";} else { print "not ok 25\n";}
if ($a ne 'a' && $x) { print "not ok 26\n";} else { print "ok 26\n";}
$x = '';
if ($a eq 'a' && $x) { print "not ok 27\n";} else { print "ok 27\n";}
if ($a ne 'a' && $x) { print "not ok 28\n";} else { print "ok 28\n";}

$x = 1;
if ($a eq 'a' || $x) { print "ok 29\n";} else { print "not ok 29\n";}
if ($a ne 'a' || $x) { print "ok 30\n";} else { print "not ok 30\n";}
$x = '';
if ($a eq 'a' || $x) { print "ok 31\n";} else { print "not ok 31\n";}
if ($a ne 'a' || $x) { print "not ok 32\n";} else { print "ok 32\n";}

$x = 1;
if ($a =~ /a/ && $x) { print "ok 33\n";} else { print "not ok 33\n";}
if ($a !~ /a/ && $x) { print "not ok 34\n";} else { print "ok 34\n";}
$x = '';
if ($a =~ /a/ && $x) { print "not ok 35\n";} else { print "ok 35\n";}
    if ($a !~ /a/ && $x) { print "not ok 36\n";} else { print "ok 36\n";}

$x = 1;
if ($a =~ /a/ || $x) { print "ok 37\n";} else { print "not ok 37\n";}
if ($a !~ /a/ || $x) { print "ok 38\n";} else { print "not ok 38\n";}
$x = '';
if ($a =~ /a/ || $x) { print "ok 39\n";} else { print "not ok 39\n";}
if ($a !~ /a/ || $x) { print "not ok 40\n";} else { print "ok 40\n";}

EOC
1..40
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
ok 13
ok 14
ok 15
ok 16
ok 17
ok 18
ok 19
ok 20
ok 21
ok 22
ok 23
ok 24
ok 25
ok 26
ok 27
ok 28
ok 29
ok 30
ok 31
ok 32
ok 33
ok 34
ok 35
ok 36
ok 37
ok 38
ok 39
ok 40
OUT

}
