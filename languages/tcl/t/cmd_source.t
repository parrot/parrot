#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_tcl;

my($tcl,$expected);

TODO: {
  local $TODO = "fails when run as .t - running the two tcl files manually works.";
# prolly not portable, patches welcome.
my $source_file = <<'EOF';
 set a 10
 puts $b
EOF

my $source_filename = "temp.tcl";
open (TMP,">$source_filename") or die $!;
print TMP $source_file;
close(TMP) ;

$tcl = <<"EOTCL";
 set b 20
 source "$source_filename"
 puts \$a
EOTCL
$expected = <<EOF;
20
10
EOF
is(output($tcl),$expected,"simple source");
unlink($source_filename)
}
