#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;
use vars qw($TODO);

TODO: {
  local $TODO = "fails when run as .t - probably due to path changing.";
    
# prolly not portable, patches welcome.
my $source_filename = "tmp.tcl";
open (TMP,">$source_filename") or die $!;
print TMP <<'EOF';
 set a 10
 puts $b
EOF
close(TMP) ;

language_output_is("tcl",<<TCL,<<OUT,"simple source");
 set b 20
 source "$source_filename"
 puts \$a
TCL
20
10
OUT

# clean up temp file.
unlink($source_filename);
}

language_output_is("tcl",<<'TCL',<<'OUT',"invalid file");
 source "hopefullynonexistantfile.tcl"
TCL
couldn't read file "hopefullynonexistantfile.tcl": no such file or directory
OUT

