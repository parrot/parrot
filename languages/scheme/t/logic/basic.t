#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 12;

use Parrot::Test;

###
### If
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

TODO:
{
    local $TODO = 'No support for booleans yet';

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
}


###
### And
###

language_output_is( 'Scheme', <<'CODE', 1, 'basic and - Pass' );
(write (and 1 1))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'basic and - Fail' );
(write (and 0 1))
CODE

###
### Or
###

language_output_is( 'Scheme', <<'CODE', 1, 'basic or - Pass' );
(write (or 1 1))
CODE

language_output_is( 'Scheme', <<'CODE', 0, 'basic or - Fail' );
(write (or 0 0))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
