#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id:$

# Test some basic pasm errors, not pir

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 1;

# I am not sure if it is really important to support this, but at
# least, we should not segfault when it happens :->
pasm_output_is("print \"Hi\\n\"", <<'OUT', "No new line at end of file");
Hi
OUT
