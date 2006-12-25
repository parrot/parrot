#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
puts("OK") if true
CODE
OK
OUT
language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
puts('OK') unless false
CODE
Test2
OUT
language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
puts("NOK") if false
CODE
OUT
language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
puts("NOK") unless true
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
