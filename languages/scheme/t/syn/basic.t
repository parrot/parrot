#! perl
# $Id$

# Copyright (C) 2007, Parrot Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Parrot::Test tests => 6;

# begin

language_output_is( 'Scheme', <<'CODE', q{}, 'string, no sideeffects' );
"Hello World!"
CODE

language_output_is( 'Scheme', <<'CODE', q{}, 'string, no sideeffects' );
+12345678
CODE

language_output_is( 'Scheme', <<'CODE', q{}, 'string, no sideeffects' );
12345678
CODE

language_output_is( 'Scheme', <<'CODE', q{}, 'string, no sideeffects' );
-12345678
CODE

language_output_is( 'Scheme', <<'CODE', q{}, 'string, no sideeffects' );
#t
CODE

language_output_is( 'Scheme', <<'CODE', q{}, 'string, no sideeffects' );
#f
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
