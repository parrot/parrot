#! perl -w

######################################################################
# From "...And Now for Something Completely Similar" by Damian Conway
# http://www.samag.com/documents/s=4075/sam1013019189971/sam0203h.htm
# Modifications are marked with XXX.
######################################################################

use strict;

use FindBin;
use lib $FindBin::Bin;

my @tests = glob "t/parser/similar_*.pl";

use P6CTest tests => 6;

check_parse {
    name => "Something Similar",
    pgm_files => \@tests,
};
