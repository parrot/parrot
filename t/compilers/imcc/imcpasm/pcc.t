#!perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 1;


pir_2_pasm_like(<<'CODE', <<'OUT', 'end in :main');
.sub _main :main
     noop
.end
CODE
/_main:
  noop
  end
/
OUT

