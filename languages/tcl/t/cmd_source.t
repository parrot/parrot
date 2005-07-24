#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;
use vars qw($TODO);

my($tcl,$expected);

TODO: {
  local $TODO = "fails when run as .t - running the two tcl files manually works.";
    
# prolly not portable, patches welcome.
my $source_file = <<'EOF';
 set a 10
 puts $b
EOF

my $source_filename = "tmp.tcl";
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
language_output_is("tcl",$tcl,$expected,"simple source");
unlink($source_filename);
}

language_output_is("tcl",<<'TCL',<<'OUT',"invalid file");
 source "hopefullynonexistantfile.tcl"
TCL
couldn't read file "hopefullynonexistantfile.tcl": no such file or directory
OUT

