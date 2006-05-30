#!perl
# Copyright (C) 2005, The Perl Foundation.
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

