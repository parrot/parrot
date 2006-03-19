#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is('APL', <<'CODE', '20', 'scalar multiplication');
print 10 × 2;
CODE
