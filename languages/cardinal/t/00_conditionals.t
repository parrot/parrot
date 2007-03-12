#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 9;

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
if true
1
end
CODE
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
if true then puts "TRUE" end
CODE
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
puts("Condition is True") if true
CODE
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
if true
  puts("Its true")
end
CODE
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
if true
  puts "OK"
else
  puts "NOK"
end
CODE
OK
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
if true then puts "OK" else puts "NOK" end
CODE
OK
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
if false
  puts "NOK"
elsif false
  puts "NOK"
elsif true
  puts "OK"
else
  puts "NOK"
end
CODE
OK
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
if false
  puts "NOK"
elsif false
  puts "NOK"
else
  puts "OK"
end
CODE
OK
OUT

language_output_is( 'cardinal', <<'CODE', <<'OUT', 'simple conditional test' );
if true
  puts "OK"
elsif false
  puts "NOK"
else
  puts "NOK"
end
CODE
OK
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
