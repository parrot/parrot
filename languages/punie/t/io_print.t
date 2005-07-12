#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 2;

language_output_is('punie', <<'EOC', '1', 'printing one');
print 1;
EOC

language_output_is('punie', <<'EOC', '5', 'printing a single number');
print 5;
EOC
