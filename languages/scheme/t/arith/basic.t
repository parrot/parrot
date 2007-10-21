#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More     tests => 22;

use Parrot::Test;

###
### Add
###

language_output_is( 'Scheme', <<'CODE', 0, 'write (+)' );
(write (+))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'write (+ 0)' );
(write (+ 0))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'write (+ 1)' );
(write (+ 1))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'write (+ 0 0)' );
(write (+ 0 0))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'write (+ 0 1)' );
(write (+ 0 1))
CODE

language_output_is( 'Scheme', <<'CODE', 2, 'write (+ 0 1 1)' );
(write (+ 0 1 1))
CODE

###
### Subtract
###

language_error_output_like( 'Scheme', <<'CODE', qr{-: expects at least 1 argument, given 0}, 'write (-)' );
(write (-))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'write (- 0)' );
(write (- 0))
CODE

language_output_is( 'Scheme', <<'CODE', -1, 'write (- 1)' );
(write (- 1))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'write (- 0 0)' );
(write (- 0 0))
CODE

language_output_is( 'Scheme', <<'CODE', -1, 'write (- 0 1)' );
(write (- 0 1))
CODE

language_output_is( 'Scheme', <<'CODE', -2, 'write (- 0 1 1)' );
(write (- 0 1 1))
CODE

###
### Multiply
###

language_output_is( 'Scheme', <<'CODE', 0, 'write (*)' );
(write (*))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'write (* 0)' );
(write (* 0))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'write (* 1)' );
(write (* 1))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'write (* 0 0)' );
(write (* 0 0))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'write (* 0 1)' );
(write (* 0 1))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'write (* 0 1 1)' );
(write (* 0 1 1))
CODE

###
### Divide
###

language_output_is( 'Scheme', <<'CODE', 1, 'reciprocal' );
(write (/ 1))
CODE

language_output_is( 'Scheme', <<'CODE', 1, '1/1' );
(write (/ 1 1))
CODE

###
### Abs
###

language_output_is( 'Scheme', <<'CODE', 5, 'abs 5' );
(write (abs 5))
CODE

language_output_is( 'Scheme', <<'CODE', 7, 'abs -7' );
(write (abs -7))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
