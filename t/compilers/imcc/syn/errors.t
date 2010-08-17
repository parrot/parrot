#!perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Config;
use Parrot::Test;

plan skip_all => 'No reason to compile invalid PBC here'
    if $ENV{TEST_PROG_ARGS} && $ENV{TEST_PROG_ARGS} =~ m/--run-pbc/;

plan tests => 7;

## tests for imcc error messages

pir_error_output_like( <<'CODE', <<'OUT', "op not found." );
.sub 'test' :main
    branch $P0
.end
CODE
/.*The opcode 'branch_p' \(branch\<1\>\) was not found\. Check the type and number of the arguments.*/
OUT

pir_error_output_like( <<'CODE', <<'OUT', "check parser recovery 1." );
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
/^error:imcc:syntax error, unexpected.*\n.*line 4.*\n.*error:imcc:'\$1' is not a valid register name.*\n.*line 6/
OUT

# Test the patience of the parser. On imc.h PARROT_MAX_RECOVER_ERRORS
# is defined. The value in the for loop below should be GREATER than
# the defined value.
my $test_3_pir_code = ".sub foo :main\n";
for ( 1 .. 50 ) {
    $test_3_pir_code .= "\t\$I1 = 2\n";                     # a legal instruction
    $test_3_pir_code .= "\tprint \"foo\\n\"\n";             # other legal instruction
    $test_3_pir_code .= "\t\$I2 = \$I0 + \$I1 + \$I2\n";    # oops!!!
}
$test_3_pir_code .= ".end\n";

pir_error_output_like( $test_3_pir_code, <<'OUT', "check parser recovery patience." );
/Too many errors. Correct some first.\n/
OUT

pir_error_output_like( <<'END_PIR', <<'END_EXPECTED', 'identifier SomethingFunny is unexpected' );
.sub main :main
  .local SomethingFunny my_string
  my_string = new String
  my_string = 'hello'
  say my_string
.end
END_PIR
/^error:imcc:syntax error, unexpected IDENTIFIER, expecting/
END_EXPECTED

pir_error_output_like( <<'END_PIR', <<'END_EXPECTED', 'Array is on type' );
.sub main :main
  .local Array my_string
  my_string = new String
  my_string = 'hello'
  say my_string
.end
END_PIR
/^error:imcc:syntax error, unexpected IDENTIFIER, expecting/
END_EXPECTED

pir_error_output_like( <<'END_PIR', <<'END_EXPECTED', 'no multiple .local, TT #767' );
.sub main :main
  .local pmc p
  .local string p
.end
END_PIR
/^error:imcc:syntax error, duplicated IDENTIFIER/
END_EXPECTED

pir_error_output_like( <<'END_PIR', <<'END_EXPECTED', 'warn about failing .loadlib (TT #437)' );
.loadlib 'nosuch'
.sub main :main
    say "WTF"
.end
END_PIR
/^error:imcc:loadlib.*nosuch/
END_EXPECTED

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
