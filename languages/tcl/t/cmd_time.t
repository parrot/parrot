#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 1;
use run_tcl;

my($tcl,$expected);

TODO: {
local $TODO = "XXX NOT TESTED";
is(1,2,"XXX not tested!");
}
