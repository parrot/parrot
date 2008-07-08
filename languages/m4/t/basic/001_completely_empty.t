# $Id$

use strict;
use warnings;
use lib qw( lib ../lib ../../lib m4/lib );

use Parrot::Test tests => 1;

language_output_is( 'm4', <<'CODE', <<'OUT', 'completely empty' );
CODE
OUT
