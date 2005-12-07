#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 3;

language_output_is('punie', <<'EOC', '1', 'printing one');
print 1;
EOC

language_output_is('punie', <<'EOC', '5', 'printing a single number');
print 5;
EOC

language_output_is('punie', <<'EOC', '135', 'printing multiple numbers');
print 1;
print 3;
print 5;
EOC
