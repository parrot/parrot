#! perl -w

###############################################
# This is the example given in Exegesis 4.
# Modifications are marked with XXX.
###############################################

use strict;

use FindBin;
use lib $FindBin::Bin;

my @tests = glob "t/parser/exe4_*.pl";

use P6CTest tests => 1;

check_parse {
    name => "Exegesis 4",
    pgm_files => \@tests,
    skip => "loops parser\n",
};
