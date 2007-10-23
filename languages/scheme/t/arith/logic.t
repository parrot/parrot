#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 45;
use Parrot::Test;

###
### Zero?
###

language_output_is( 'Scheme', <<'CODE', '#t', 'write (zero? 0)' );
(write (zero? 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (zero? 2)' );
(write (zero? 2))
CODE

###
### Positive?
###

language_output_is( 'Scheme', <<'CODE', '#f', 'write (positive? 0)' );
(write (positive? 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (positive? 2)' );
(write (positive? 2))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (positive? -3)' );
(write (positive? -3))
CODE

###
### Negative?
###

language_output_is( 'Scheme', <<'CODE', '#f', 'write (negative? 0)' );
(write (negative? 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (negative? 2)' );
(write (negative? 2))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (negative? -3)' );
(write (negative? -3))
CODE

###
### Odd?
###

language_output_is( 'Scheme', <<'CODE', '#f', 'write (odd? 0)' );
(write (odd? 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (odd? 1)' );
(write (odd? 1))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (odd? 2)' );
(write (odd? 2))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (odd? -3)' );
(write (odd? -3))
CODE

###
### Even?
###

language_output_is( 'Scheme', <<'CODE', '#t', 'write (even? 0)' );
(write (even? 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (even? 1)' );
(write (even? 1))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (even? 2)' );
(write (even? 2))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (even? -3)' );
(write (even? -3))
CODE

###
### Max
###

language_output_is( 'Scheme', <<'CODE', 3, 'write (max 1 3))' );
(write (max 1 3))
CODE

language_output_is( 'Scheme', <<'CODE', 9, 'write (max 9 3 5))' );
(write (max 9 3 5))
CODE

language_output_is( 'Scheme', <<'CODE', 3, 'write (max 3 1))' );
(write (max 3 1))
CODE

language_output_is( 'Scheme', <<'CODE', 9, 'write (max 1 9 3))' );
(write (max 1 9 3))
CODE

###
### Min
###

language_output_is( 'Scheme', <<'CODE', 1, 'write (min 1 3))' );
(write (min 1 3))
CODE

language_output_is( 'Scheme', <<'CODE', 3, 'write (min 9 3 5))' );
(write (min 9 3 5))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'write (min 3 1))' );
(write (min 3 1))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'write (min 1 9 3))' );
(write (min 1 9 3))
CODE

###
### Equal (=)
###

language_output_is( 'Scheme', <<'CODE', '#t', 'write (= 0 0))' );
(write (= 0 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (= 1 0))' );
(write (= 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (= 0 1))' );
(write (= 0 1))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (= 0 0 0))' );
(write (= 0 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (= 1 2 3))' );
(write (= 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (= 0 1 1))' );
(write (= 0 1))
CODE

###
### Less (<)
###

language_output_is( 'Scheme', <<'CODE', '#t', 'write (< 0 1))' );
(write (< 0 1))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (< 1 1))' );
(write (< 1 1))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (< 0 1 2))' );
(write (< 0 1 2))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (< 1 1 1))' );
(write (< 1 1 2))
CODE

###
### Greater (>)
###

language_output_is( 'Scheme', <<'CODE', '#t', 'write (> 1 0))' );
(write (> 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (> 1 1))' );
(write (> 1 1))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (> 2 1 0))' );
(write (> 2 1 0))
CODE

language_output_is( 'Scheme',<<'CODE', '#f', 'write (> 2 1 1))');
(write (> 2 1 1))
CODE

###
### LEQ (<=)
###

language_output_is( 'Scheme', <<'CODE', '#t', 'write (<= 0 0))' );
(write (<= 0 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (<= 1 0))' );
(write (<= 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'write (<= 1 2))' );
(write (<= 1 2))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (<= 2 1 0))' );
(write (<= 2 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (<= 2 1 1))' );
(write (<= 2 1 1))
CODE

###
### GEQ (>=)
###

language_output_is( 'Scheme', <<'CODE', '#t', 'write (<= 2 3 3))' );
(write (<= 2 3 3))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'write (<= 2 3 2))' );
(write (<= 2 3 2))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
