#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 1;

##############################
pir_output_is(<<'CODE', <<'OUT', "global const");
.sub test @MAIN
	.globalconst string ok = "ok\n"
	print ok
	bsr _sub
	end
.end
.sub _sub
	print ok
	ret
.end
CODE
ok
ok
OUT
