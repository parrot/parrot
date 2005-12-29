#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_like('tcl', <<'TCL', '/\d+ microseconds per iteration\n/', 'simple time');
 puts [time { expr 2+2 }]
TCL
