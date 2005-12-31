#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 1;

##############################
pir_output_is(<<'CODE', <<'OUT', "global const");
.sub test :main
	.globalconst string ok = "ok\n"
	print ok
	_sub()
	end
.end
.sub _sub
	print ok
.end
CODE
ok
ok
OUT
