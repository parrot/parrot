#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 27;

use Parrot::Test;

###
### if
###

language_output_is( 'Scheme', <<'CODE', 1, 'basic if - Fail' );
(write (if (= 1 1) 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'basic if - Pass' );
(write (if (= 0 1) 0 1))
CODE

language_output_is( 'Scheme', <<'CODE', 7, 'slightly more complex if' );
(write (if (= 9 9) 7 -23))
CODE

###
### boolean?
###

language_output_is( 'Scheme', <<'CODE', '#t', 'boolean? #t' );
(write (boolean? #t))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'boolean? #f' );
(write (boolean? #f))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'boolean? 0' );
(write (boolean? 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'boolean? 1' );
(write (boolean? 1))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'boolean? 0' );
(write (boolean? (boolean? "hello")))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'boolean? #t' );
(write (if (boolean? #t) 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'boolean? #f' );
(write (if (boolean? #f) 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'boolean? 0' );
(write (if (boolean? 0) 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'boolean? 1' );
(write (if (boolean? 1) 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'boolean? 0' );
(write (if (boolean? (boolean? "hello")) 1 0))
CODE


###
### and
###

language_output_is( 'Scheme', <<'CODE', 3, 'basic and' );
(write (and 1 3))
CODE

language_output_is( 'Scheme', <<'CODE', 1, 'basic and' );
(write (and 0 1))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'basic and' );
(write (and 3 2 1 0))
CODE

language_output_is( 'Scheme', <<'CODE', 6, 'basic and' );
(write (and 1 2 3 4 5 6))
CODE

language_output_is( 'Scheme', <<'CODE', 4, 'and, 0 is true' );
(write (and 0 4))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'and, 0 is true' );
(write (and 1 2 #f 4))
CODE

###
### or
###

language_output_is( 'Scheme', <<'CODE', 1, 'basic or - Pass' );
(write (or 1 1))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'basic or - Fail' );
(write (or 0 0))
CODE

###
### not
###

language_output_is( 'Scheme', <<'CODE', '#f', 'not 1' );
(write (not 1))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'not #f' );
(write (not #f))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'not 0' );
(write (not 0))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'not #t' );
(write (not #t))
CODE

language_output_is( 'Scheme', <<'CODE', '#f', 'not true expression' );
(write (not (= 42 (* 21 2))))
CODE

language_output_is( 'Scheme', <<'CODE', '#t', 'not false expression' );
(write (not (= 43 (* 21 2))))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
