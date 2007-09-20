#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 8;
use Parrot::Test;

###
### Add
###

language_output_is( 'Scheme', <<'CODE', 12, 'write (+ (+ 5 7))' );
(write (+ (+ 5 7)))
CODE

language_output_is( 'Scheme', <<'CODE', 11, 'write (+ (+ 3 -1) (+ 2 7))' );
(write (+ (+ 3 -1) (+ 2 7)))
CODE

###
### Subtract
###

language_output_is( 'Scheme', <<'CODE', 2, 'write (- (- 5 7))' );
(write (- (- 5 7)))
CODE

language_output_is( 'Scheme', <<'CODE', 9, 'write (- (- 3 -1) (- 2 7))' );
(write (- (- 3 -1) (- 2 7)))
CODE

###
### Multiply
###

language_output_is( 'Scheme', <<'CODE', 35, 'write (* (* 5 7))' );
(write (* (* 5 7)))
CODE

language_output_is( 'Scheme', <<'CODE', -42, 'write (* (* 3 -1) (* 2 7))' );
(write (* (* 3 -1) (* 2 7)))
CODE

###
### Divide
###

###
### Abs
###

language_output_is( 'Scheme', <<'CODE', 8, 'abs (+ 3 5)' );
(write (abs (+ 3 5)))
CODE

language_output_is( 'Scheme', <<'CODE', 2, 'abs (- 3 5)' );
(write (abs (- 3 5)))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
