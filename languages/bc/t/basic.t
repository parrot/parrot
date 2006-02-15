# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

bc/t/basic.t - tests for Parrot bc

=head1 DESCRIPTION

Very basic checks.

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Parrot::Config qw(%PConfig);
use Parrot::Test;
use Test::More;

if ( $PConfig{has_python} ) {
  plan tests => 78;
}
else {
  plan skip_all => 'ANTLR2 based bc needs Python';
}

# A little helper to make setting up tests easier
sub run_tests {
    my ( $tests ) = @_;

    foreach ( @{$tests} ) {
        die "invalid test" unless ref( $_ ) eq 'ARRAY';
        die "invalid test" unless scalar(@{$_}) >= 2 || scalar(@{$_}) <= 5;
        my ( $bc_code, $expected, $desc, %options ) = @{$_};

        # bc should not keep waiting for input 
        $bc_code  .= "\nquit\n"; 

        # expected input can be set up as array reference
        if ( ref $expected ) {
            die "expected ARRAY reference" unless ref( $expected ) eq 'ARRAY';
            $expected = join( "\n", @{$expected} );
        }

        # use default description when '' or undef is set up
        $desc ||= "bc: $bc_code";

        language_output_is( 'bc', $bc_code, $expected . "\n", $desc, %options );
    }
}

my @tests = (
       # single non-negative integer 
       [ '1', [ 1 ], 'positive int 1', with_past => 1, with_antlr3 => 1  ],
       [ '0', [ 0 ], 'zero', with_past => 1, with_antlr3 => 1  ],
       [ '2', [ 2 ], 'positive int', with_past => 1, with_antlr3 => 1  ],
       [ '12345678', [ 12345678 ], 'another positive int', with_past => 1, with_antlr3 => 1  ],

       # multiple lines
       [ "1\n2", [ 1, 2 ], 'two lines', with_past => 1  ],
       [ "1\n2\n3\n4\n\n5\n6\n7", [ 1, 2, 3, 4, 5, 6, 7 ], 'seven lines', with_past => 1  ],

       # comments 
       [ '/* */7', 7, 'one line comment', with_past => 1  ],
       [ "/* line1 \n line2 \n line 3 */    -2  ", -2, 'multi line comment', with_past => 1 ],

       # Strings 
       [ qq{1;2;"asdf"   ;  3    }, [ 1, 2, 'asdf3' ], 'string', with_past => 0 ],

       # empty lines
       [ "\n-1", '-1', 'single newline', with_past => 1, ],
       [ "        \n    \n  -  1   \n    2", [ -1, 2 ], 'multiple empty lines', with_past => 1 ],

       # positive and negative Integers
       #[ '+1', '1', 'unary +', with_past => 1, ], Surprise, there is no unary + in POSIX bc
       [ '-1', '-1', 'unary -', with_past => 1, ],
       [ '0', '0', undef, with_past => 1, ],
       [ '-0', '0', undef, with_past => 1, ],
       [ '1', '1', undef, with_past => 1, ],
       [ '-10', '-10', undef, with_past => 1, ],
       [ '123456789', '123456789', undef, with_past => 1, ],
       [ '-123456789', '-123456789', undef, with_past => 1, ],
       [ '0001', '1', undef, with_past => 1, ],
       [ '-0001', '-1', undef, with_past => 1 ],

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
       [ '  ( 1 ) ', '1', 'one in parenthesis', with_past => 1 ],
       [ '  ( 1 + 2 ) * 3 ', '9' ],
       [ '  ( 1 * 2 ) * 3 ', '6' ],
       [ '  ( 1 * 2 ) + 3 ', '5' ],
       [ '  ( 1 * 2 ) + ( ( ( ( 3 + 4 ) + 5 ) * 6 ) * 7 ) ', '506' ],

       # semicolons
       [ '1; 2', [1, 2], 'two expressions seperated by a semicolon', with_past => 1 ],
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
       [ "1; if ( 1 < 2 ) 2; 3", [1, 2, 3], 'if with a relational operator' ],

       # If with '<'
       [ "1; if ( 3 + 4 < 8*2 - 10 ) 2; 3", [1, 3] ],
       [ "1; if ( 3 + 4 < 8*2 - 9 ) 2; 3", [1, 3] ],
       [ "1; if ( 3 + 4 < 8*2 + 10 ) 2; 3", [1, 2, 3] ],

       # If with '<='
       [ "1; if ( 3 + 4 <= 8*2 - 10 ) 2; 3", [1, 3] ],
       [ "1; if ( 3 + 4 <= 8*2 - 9 ) 2; 3", [1, 2, 3] ],
       [ "1; if ( 3 + 4 <= 8*2 + 10 ) 2; 3", [1, 2, 3] ],
       # If with '==', still TODO
       [ "1; if ( 3 + 4 == 8*2 - 10 ) 2; 3", [1, 3] ],
       [ "1; if ( 3 + 4 == 8*2 - 9 ) 2; 3", [1, 2, 3] ],
       [ "1; if ( 3 + 4 == 8*2 + 10 ) 2; 3", [1, 3] ],
       # If with '!='
       [ "1; if ( 3 + 4 != 8*2 - 10 ) 2; 3", [1, 2, 3] ],
       [ "1; if ( 3 + 4 != 8*2 - 9 ) 2; 3", [1, 3] ],
       [ "1; if ( 3 + 4 != 8*2 + 10 ) 2; 3", [1, 2, 3] ],
       # If with '>='
       [ "1; if ( 3 + 4 >= 8*2 - 10 ) 2; 3", [1, 2, 3] ],
       [ "1; if ( 3 + 4 >= 8*2 - 9 ) 2; 3", [1, 2, 3] ],
       [ "1; if ( 3 + 4 >= 8*2 + 10 ) 2; 3", [1, 3] ],

       # If with '>'
       [ "1; if ( 3 + 4 > 8*2 - 10 ) 2; 3", [1, 2, 3] ],
       [ "1; if ( 3 + 4 > 8*2 - 9 ) 2; 3", [1, 3] ],
       [ "1; if ( 3 + 4 > 8*2 + 10 ) 2; 3", [1, 3] ],
   );

run_tests(\@tests);

TODO:
{
    local $TODO = 'not implemented';
    my @todo_tests = ( 
           # floats
           [ '.1', '.1', 'Parrot bc says 0.1', with_past => 1 ],
           [ '-.1', '-.1', 'Parrot bc says -0.1', with_past => 1],
           [ '-1.0000001', '-1.0000001', 'propably limited precission of Float PMC', with_past => 1 ],

           # keyword quit
           [ "0\n1; 2; quit;  3", [ 0 ], 'is that correct in GNU bc?', with_past => 1 ],
       );
    run_tests( \@todo_tests );
}; 
