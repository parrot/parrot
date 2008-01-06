#!perl

# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;
use Test::More;

language_output_is( 'punie', <<'CODE', <<'OUT', 'simple loops' );
while (0) {
  print "nok 1\n";
}
print "ok 1\n";

until (1) {
    print "nok 2\n";
}
print "ok 2\n";

CODE
ok 1
ok 2
OUT
