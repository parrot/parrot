#!/usr/bin/perl
# Copyright (C) 2008, The Perl Foundation.
# $Id: 10-version.t 34398 2008-12-26 19:40:48Z bernhard $

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 2;

language_output_is( 'JS', <<'CODE', <<'OUT', '' );
CODE
OUT

language_output_is( 'JS', <<'CODE', <<'OUT', '', todo => 'todoed');
CODE
FAILED
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
