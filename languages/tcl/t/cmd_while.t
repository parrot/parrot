#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

my($tcl,$expected);

$tcl = <<'EOTCL';
 set a 3
 while {$a} {
   puts $a
   incr a -1
 }
 puts "done"
EOTCL
$expected = <<EOL;
3
2
1
done
EOL
language_output_is("tcl",$tcl,$expected,"simple while");

# XXX should check return value of exit, also
