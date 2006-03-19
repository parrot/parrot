#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;
use Test::More;

TODO: {
  local $TODO = "no unicode input files yet.";
language_output_is('APL', <<'CODE', '20', 'scalar multiplication');
print 10 × 2
CODE
}

language_output_is('APL', <<'CODE', '20', 'scalar multiplication');
print 10 * 2
CODE
