#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Config;
use Parrot::Test tests => 7;
use Test::More;

# APL really needs unicode to function
plan skip_all => "No unicode library available." unless $PConfig{has_icu};

TODO: {
  local $TODO = "no unicode input files yet.";
language_output_is('APL', <<'CODE', '20', 'scalar multiplication');
print 10 × 2
CODE
}

language_output_is('APL', <<'CODE', '20', 'scalar multiplication');
print 10 * 2
CODE

TODO: {
  local $TODO = "characters don't work yet.";

language_output_is('APL', <<'CODE', q{he said, "she said."}, 'double quotes');
print "he said, ""she said."""
CODE

language_output_is('APL', <<'CODE', q{surely you can't be serious}, 'single quotes');
print 'surely you can''t be serious.'
CODE
}

TODO: {
  local $TODO = "basic vector support missing";

language_output_is('APL', <<'CODE', '10 2 3', 'vectors');
print 10 2 3
CODE
}

TODO: {
  local $TODO = "use same glyph in monadic and dyadic forms...";

language_output_is('APL', <<'CODE', '3', 'ceiling (scalar)');
print ⌈ 2.5
CODE

language_output_is('APL', <<'CODE', '3', 'maximum (scalar)');
print  2 ⌈ 3
CODE
}
  

