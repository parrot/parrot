#! perl -w

use strict;
use lib qw(../../../lib);
use Test::More tests => 7;
use run_tcl;

my($tcl,$expected);

$tcl = <<'EOTCL';
 puts "Parsing"
EOTCL
$expected = "Parsing\n";
is(output($tcl),$expected,"double quoting words, puts");

$tcl = <<'EOTCL';
 puts {Parsing}
EOTCL
$expected = "Parsing\n";
is(output($tcl),$expected,"simple block quoting");

$tcl = <<'EOTCL';
 puts Parsing;
EOTCL
$expected = "Parsing\n";
is(output($tcl),$expected,"bare words should be allowed");

$tcl = <<'EOTCL';
 puts #whee
 exit ;
EOTCL
$expected = "#whee\n";
is(output($tcl),$expected,"hash isn't a comment if it starts a word");

$tcl = <<'EOTCL';
 puts {test}
 exit
 puts {bar}
EOTCL
$expected = "test\n";
is(output($tcl),$expected,"no arg command");

$tcl = <<'EOTCL';
 puts {test}
 exit;
 puts {bar}
EOTCL
$expected = "test\n";
is(output($tcl),$expected,"no arg command with semicolon");

$tcl = <<'EOTCL';
 puts {test}
 exit ;
EOTCL
$expected = "test\n";
is(output($tcl),$expected,"no arg command with spaced semicolon");

unlink("test.tcl");
