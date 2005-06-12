# $Id$

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 1;

{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'substring in middle of string' );
syscmd(`touch /tmp/touched_by_Parrot_m4')
CODE

OUT
}
