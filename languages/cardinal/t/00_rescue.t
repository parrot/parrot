#!perl

# Copyright (C) 2006, The Perl Foundation.

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple throw rescue test' );
throw "Exception" rescue puts "Exception Caught"
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
