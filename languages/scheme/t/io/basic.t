#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../..";

use Scheme::Test tests => 2;

output_is( <<'CODE', '0', "basic write" );
(write 0)
CODE

output_is( <<'CODE', '01', "basic write" );
(write 0 1)
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
