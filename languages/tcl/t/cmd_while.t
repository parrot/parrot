#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_tcl;

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
is(output($tcl),$expected,"simple while");

# XXX should check return value of exit, also
