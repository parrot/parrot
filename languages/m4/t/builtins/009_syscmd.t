#!perl

# $Id$

use strict;

use M4::Test tests => 2*1;

{
  output_is( <<'CODE', <<'OUT', 'substring in middle of string' );
syscmd(`touch /tmp/touched_by_Parrot_m4')
CODE

OUT
}
