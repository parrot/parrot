#! perl
# $Id$

# Copyright (C) 2007, Parrot Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Parrot::Test tests => 7;

# begin

language_output_is( 'Scheme', <<'CODE', 1, 'begin 1 subexpression' );
(begin
   (write 1))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'no begin 1 subexpression' );
   (write 1)
CODE

language_output_is( 'Scheme', <<'CODE', 12, 'no begin 2 subexpression' );
(begin
   (write 1)
   (write 2))
CODE

language_output_is( 'Scheme', <<'CODE', 12, 'no begin 2 subexpression' );
   (write 1)
   (write 2)
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

language_output_is( 'Scheme', <<'CODE', '12333333333333333333333', 'no begin 23 subexpression' );
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
   (write 3)
CODE

language_output_is( 'Scheme', <<'CODE', '6', 'nested begins' );
(begin ( begin ( begin ( begin ( begin ( write (* 2 3 ) ))))))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
