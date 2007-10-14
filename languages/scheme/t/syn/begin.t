#! perl
# $Id: basic.t 21430 2007-09-20 16:39:38Z bernhard $

# Copyright (C) 2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Parrot::Test tests => 3;

# begin

language_output_is( 'Scheme', <<'CODE', 1, 'begin 1 subexpression' );
(begin
   (write 1))
CODE

language_output_is( 'Scheme', <<'CODE', 12, 'begin 2 subexpression' );
(begin
   (write 1)
   (write 2))
CODE

language_output_is( 'Scheme', <<'CODE', '12333333333333333333333', 'begin 23 subexpression' );
(begin
   (write 1)
   (write 2)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3)
   (write 3))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
