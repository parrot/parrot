#! perl -w

#XXX need TODO tests for octal, hex, unicode

use strict;
use lib qw(../../../lib .);
use Test::More tests => 8;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 puts -nonewline "\n"
EOTCL
$expected = chr(0xa);
is(output($tcl),$expected,"newline");

$tcl = <<'EOTCL';
 puts -nonewline "\t"
EOTCL
$expected = chr(0x9);
is(output($tcl),$expected,"tab");

$tcl = <<'EOTCL';
 puts -nonewline "\b"
EOTCL
$expected = chr(0x8);
is(output($tcl),$expected,"backspace");

$tcl = <<'EOTCL';
 puts -nonewline "\f"
EOTCL
$expected = chr(0xc);
is(output($tcl),$expected,"formfeed");

$tcl = <<'EOTCL';
 puts -nonewline "\r"
EOTCL
$expected = chr(0xd);
is(output($tcl),$expected,"carriage return");

$tcl = <<'EOTCL';
 puts -nonewline "\v"
EOTCL
$expected = chr(0xb);
is(output($tcl),$expected,"vertical tab");

$tcl = <<'EOTCL';
 puts -nonewline "\\"
EOTCL
$expected = "\\";
is(output($tcl),$expected,"backslash");

$tcl = <<'EOTCL';
puts -nonewline "\1"
EOTCL
$expected = "1";
is(output($tcl),$expected,"normal character");

unlink("test.tcl");
