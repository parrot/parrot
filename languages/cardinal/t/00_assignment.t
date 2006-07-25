#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

TODO: {
#local $TODO = "variables not implemented in ASTGrammar\n";

language_output_is('cardinal', <<'CODE', <<'OUT', 'simple conditional test');
a=1
CODE
OUT
}
