#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 3;

## tests for imcc error messages

pir_output_like(<<'CODE', <<'OUT', "op not found.");
.sub 'test' :main
    branch $P0
.end
CODE
/.*The opcode 'branch_p' \(branch\<1\>\) was not found\. Check the type and number of the arguments.*/
OUT



pir_output_like(<<'CODE', <<'OUT', "check parser recovery 1.");
.sub foo :main
        $I1 = 2
        print "foo\n"
        $I0 +=
        $I2 = $I0 + $I1
        $I3 = $1
        $I1 = 5
        $I2 = 6
        print $I2
        print "\n"
.end
CODE
/^error:imcc:syntax error, unexpected.*\n.*line 4.*\n.*error:imcc:syntax error, unexpected.*\n.*line 6/
OUT



# Test the patience of the parser. On imc.h PARROT_MAX_RECOVER_ERRORS
# is defined. The value in the for loop below should be GREATER than
# the defined value.
my $test_3_pir_code = ".sub foo :main\n";
for (1..50) {
  $test_3_pir_code .= "\t\$I1 = 2\n";                  # a legal instruction
  $test_3_pir_code .= "\tprint \"foo\\n\"\n";          # other legal instruction
  $test_3_pir_code .= "\t\$I2 = \$I0 + \$I1 + \$I2\n"; # oops!!!
}
$test_3_pir_code .= ".end\n";

pir_output_like($test_3_pir_code, <<'OUT', "check parser recovery patience.");
/Too much errors. Correct some first.\n$/
OUT



