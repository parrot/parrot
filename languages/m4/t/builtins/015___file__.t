# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 1;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', '__line__' );
Currently the file '__file__' is being processed.
CODE
Currently the file 'languages/m4/t/builtins/015___file___1.m4' is being processed.
OUT
}
