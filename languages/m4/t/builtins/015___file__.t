# $Id$

use strict;
use warnings;
use lib qw( lib ../lib ../../lib m4/lib );

use Parrot::Test tests => 1;

{
  language_output_like( 'm4', <<'CODE', qr/Currently the file '.*builtins.015___file___1\.m4' is being processed\.\n/, '__line__' );
Currently the file '__file__' is being processed.
CODE
}
