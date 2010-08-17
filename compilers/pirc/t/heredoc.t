#!perl
# Copyright (C) 2008-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw(lib);
use Parrot::Test tests => 1;

pirc_2_pasm_is(<<'CODE', <<'OUTPUT', "a single const declaration");
.sub main
    say "ok"
.end
CODE
ok
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
