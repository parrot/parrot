#! perl -w

###############################################
# This are the examples given in Exegesis 2.
# Modifications are marked with XXX.
###############################################

use strict;

use FindBin;
use lib $FindBin::Bin;

my @tests = glob "t/parser/exe2_*.pl";

use P6CTest tests => 2;

check_parse {
    name => "Exegesis 2",
    pgm_files => \@tests,
};
