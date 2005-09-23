# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

bc/t/basic.t - tests for Parrot bc

=head1 DESCRIPTION

Very basic checks.

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Test::More;
use Parrot::Test tests => 55;

sub run_tests
{
  my ( $tests ) = @_;

  foreach my $test_case ( @{$tests} )
  {
    die "invalid test" unless ref( $test_case ) eq 'ARRAY';
    die "invalid test" unless scalar(@$test_case) == 2 || scalar(@$test_case) == 3;

    my $bc_code  = $test_case->[0] . "\nquit\n";
    my $expected = ref($test_case->[1]) eq '' ?
                     $test_case->[1] 
                     :
                     ref($test_case->[1]) eq 'ARRAY' ?
                       join( "\n", @{$test_case->[1]} ) :
                       die "expected ARRAY reference";   
    my $desc     = $test_case->[2] || "bc: $bc_code";
    language_output_is( 'bc', $bc_code, "$expected\n", $desc );
  }
} 

my @tests = 
     (
       # comments 
       [ '/* */1', 1, 'one line comment' ],
       [ "/* line1 \n line2 \n line 3 */    -2  ", -2, 'multi line comment' ],
       # Strings 
       [ qq{1;2;"asdf"   ;  3    }, [ 1, 2, 'asdf3' ], 'string' ],
       # empty lines
       [ "\n-1", '-1', 'single newline' ],
       [ "        \n    \n  -  1   \n    2", [ -1, 2 ], 'multiple empty lines' ],
       # positive and negative Integers
       #[ '+1', '1', 'unary +' ], Surprise, there is no unary + in POSIX bc
       [ '-1', '-1', 'unary -' ],
       [ '0', '0' ],
       [ '-0', '0' ],
       [ '1', '1' ],
       [ '-10', '-10' ],
       [ '123456789', '123456789' ],
       [ '-123456789', '-123456789' ],
       [ '0001', '1' ],
       [ '-0001', '-1' ],
       # floats
       [ '-1.0001', '-1.0001' ],
       [ '1.2', '1.2' ],
       [ '1.2 *2 - 2.0 + 3', '3.4' ],
       # binary PLUS
       [ '1 + 2', '3' ],
       [ '1 + 2 + 3', '6' ],
       [ '1 + 0 + 3', '4' ],
       [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14', '105', 'Gauss was right' ],
       # binary '-'
       [ '2 - 1', '1' ],
       [ '1 - 1', '0' ],
       [ '1 - 2', '-1' ],
       [ '-1 - -2', '1' ],
       [ '-1 + -2 - -4 + 10', '11' ],
       # multiplication
       [ '2 * 2', '4' ],
       # division
       [ '2 / 2', '1' ],
       # modulus
       [ '2 % 2', '0' ],
       # precedence of mul, diff, mod
       [ '2 / 2 + .1', '1.1' ],
       [ '2 * 2 + .4', '4.4' ],
       [ '.1 - 6 / 2', '-2.9' ],
       [ '2 % 2 + 4', '4' ],
       # parenthesis
       [ '  ( 1 ) ', '1' ],
       [ '  ( 1 + 2 ) * 3 ', '9' ],
       [ '  ( 1 * 2 ) * 3 ', '6' ],
       [ '  ( 1 * 2 ) + 3 ', '5' ],
       [ '  ( 1 * 2 ) + ( ( ( ( 3 + 4 ) + 5 ) * 6 ) * 7 ) ', '506' ],
       # semicolons
       [ '1; 2', [1, 2] ],
       [ '1+1*1; 2+2*2', [2, 6] ],
       [ '3-3/3; 4+4%4;  5-5+5', [2, 4, 5] ],
       # keyword quit
       [ "1; 2\nquit\n 3", [1, 2] ],
       # named expressions
       [ "a", [0], 'uninitialized a' ],
       [ "a; a = 1; a", [0,1], 'assign number to lexical' ],
       [ 'a; b; a = 4; b = a; c = 1; "a = "; a;  "b = "; b;  "c = "; c', [ 0, 0, 'a = 4', 'b = 4', 'c = 1' ], 'assing lexical to lexical' ], 
       # increment and decrement 
       [ "a; a = 1; a; ++a; a", [0,1,2,2], 'increment' ],
       [ "a; a = 1; a; --a; a", [0,1,0,0], 'decrement' ],
       # If 
       [ "1; if ( 1 ) 2; 3", [1,2,3], 'if with a true condition' ],
       [ "1; if ( 0 ) 2; 3", [1,3], 'if with a true condition' ],
       [ "1; if ( 1 < 2 ) 2; 3", [1,2,3] ],
       [ "1; if ( 3 + 4 < 8*2 - 10 ) 2; 3", [1,3] ],
     );

my @todo_tests = 
     ( # floats
       [ '.1', '.1', 'Parrot bc says 0.1' ],
       [ '-.1', '-.1', 'Parrot bc says -0.1'],
       [ '-1.0000001', '-1.0000001', 'propably limited precission of Float PMC' ],
       # keyword quit
       [ "0\n1; 2; quit;  3", [ 0 ], 'is that correct in GNU bc?' ],
     );

run_tests( \@tests );

TODO:
{
  local $TODO = 'not implemented';
  run_tests( \@todo_tests );
} 
