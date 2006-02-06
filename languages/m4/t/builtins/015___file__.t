# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 1;

{
  language_output_like( 'm4', <<'CODE', qr/Currently the file 'languages.m4.t.builtins.015___file___1\.m4' is being processed\.\n/, '__line__' );
Currently the file '__file__' is being processed.
CODE
}
