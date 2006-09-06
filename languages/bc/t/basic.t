# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

=head1 NAME

bc/t/basic.t - tests for Parrot bc

=head1 DESCRIPTION

Very basic checks.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Test::More;

use Parrot::Config (); 
use Parrot::Test;

# A little helper to make setting up tests easier
sub run_tests {
    my ( $tests ) = @_;

    foreach ( @{$tests} ) {
        die 'invalid test' unless ref( $_ ) eq 'ARRAY';
        die 'invalid test' unless scalar(@{$_}) >= 2 || scalar(@{$_}) <= 5;
        my ( $bc_code, $expected, $desc, %options ) = @{$_};

        # bc should not keep waiting for input 
        $bc_code  .= "\nquit\n"; 

        # expected input can be set up as array reference
        if ( ref $expected ) {
            die 'expected ARRAY reference' unless ref( $expected ) eq 'ARRAY';
            $expected = join( "\n", @{$expected} );
        }

        # use default description when '' or undef is set up
        $desc ||= "bc: $bc_code";

        language_output_is( 'bc', $bc_code, $expected . "\n", $desc, %options );
    }
}

my @tests = (
       # single non-negative integer 
       [ '1', [ 1 ], 'positive int 1',  ],
       [ '0', [ 0 ], 'zero',  ],
       [ '2', [ 2 ], 'positive int',  ],
       [ '12345678', [ 12345678 ], 'another positive int',  ],

       # single negative integer 
       [ '-1', [ -1 ], 'negative one',  ],
       [ '-12345678', [ -12345678 ], 'another negative int',  ],

       # multiple lines
       [ "1\n2", [ 1, 2 ], 'two lines',  ],
       [ "1\n2\n3\n4\n\n5\n6\n7", [ 1, 2, 3, 4, 5, 6, 7 ], 'seven lines', ],

       # comments 
       [ '/* */7', 7, 'one line comment',  ],
       [ "/* line1 \n line2 \n line 3 */    2  ", 2, 'multi line comment', ],
       [ "/* line1 \n line2 \n line 3 */   -3  ", -3, 'multi line comment', ],

       # Strings 
       [ '1;2;"asdf"   ;  3    ', [ 1, 2, 'asdf3' ], 'string', ],
       [ q{1;2;"'a's'd'f'"   ;  3    }, [ 1, 2, q{'a's'd'f'3} ], 'string with embedded single quote', ],
       [ '1;2;"as\df"   ;  3    ', [ 1, 2, 'as\df3' ], 'string with embedded backslash', ],
       [ qq{1;2;" asdf\n  jklm\n   rtzu\n"   ;  3    }, [ 1, 2, ' asdf', '  jklm', '   rtzu', 3 ], ],

       # empty lines
       [ "\n-1", '-1', 'single newline', ],
       [ "        \n    \n  -  1   \n    2", [ -1, 2 ], 'multiple empty lines', ],

       # positive and negative Integers
       #[ '+1', '1', 'unary +', ], Surprise, there is no unary + in POSIX bc
       [ '-1', '-1', 'unary -', ],
       [ '0', '0', '0 without sign', ],
       [ '-0', '0', 'negative 0', ],
       [ '1', '1', ],
       [ '-10', '-10', ],
       [ '123456789', '123456789', ],
       [ '-123456789', '-123456789', ],
       [ '0001', '1', ],
       [ '-0001', '-1', ],

       # floats
       [ '.1 + 1', '1.1', 'float with leading dot', with_antrl3 => 1, ],
       [ '-1.0001', '-1.0001', ], 
       [ '1.2', '1.2', ],     # prints 1.200000 in ANTLR3 version
       [ '1.2 *2 - 2.0 + 3', '3.4', ],

       # binary PLUS
       [ '1 + 2', '3', 'two summands', ],
       [ '1 + 2 + 3', '6', 'three summands', ],
       [ '1 + 0 + 3', '4', 'three summands including 0', ],
       [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14', '105', 'Gauss was right', ],
       [ '-1 + 10', '9', 'negative int in expression', ],

       # binary MINUS
       [ '2 - 1', '1', ],
       [ '1 - 1', '0', ],
       [ '1 - 2', '-1', ],
       [ '-1 - -2', '1', ],
       [ '-1 + -2 - -4 + 10', '11', ],
       [ '- 1 - - 6 + 3 - 2', '6', ],

       # multiplication
       [ '2 * 2', '4', ],

       # division
       [ '2 / 2', '1', ],

       # modulus
       [ '2 % 2', '0', ],
       [ '3 % 2', '1', ],

       # precedence of mul, diff, mod
       [ '2 / 2 + .1', '1.1', ],
       [ '2 * 2 + .4', '4.4', ],
       [ '.1 - 6 / 2', '-2.9', ],
       [ '2 % 2 + 4', '4', ],

       # parenthesis
       [ '  ( 1 ) ', '1', 'one in parenthesis', ],
       [ '  ( 1 + 2 ) - 3 ', '0', ],
       [ ' - ( 1 + 2 ) - 3 ', '-6', ],
       [ '  ( 1 + 2 ) - ( 5  + 1 - 2 ) + 7 - ( 8 - 100 ) ', '98', ],
       [ '  ( 1 + 2 ) * 3 ', '9', ],
       [ '  ( 1 * 2 ) * 3 ', '6', ],
       [ '  ( 1 * 2 ) + 3 ', '5', ],
       [ '  ( 1 * 2 ) + ( ( ( ( 3 + 4 ) + 5 ) * 6 ) * 7 ) ', '506', ],

       # semicolons
       [ '; 1', [1], ],
       [ ';;   ;1', [1], ],
       [ '1;', [1], 'semicolon at end of line', ],
       [ '1;;', [1], ],
       [ '1;  ; ; ;;', [1], 'semicolon at end of line', ],
       [ '1; 2', [1, 2], 'two expressions seperated by a semicolon', ],
       [ '1;;;;; ;    ; 2', [1, 2], ],
       [ '1+1+1; 2 + 2 + 2  ;  3 + 3 -1 + 3 +1', [3, 6, 9], '3 additive expression with semicolons', ],
       [ '1+1*1; 2+2*2', [2, 6], ],
       [ '3-3/3; 4+4%4;  5-5+5', [2, 4, 5], ],

       # keyword quit
       [ "1; 2\nquit\n 3", [1, 2], 'int after quit', ],

       # named expressions
       [ 'a', [0], 'uninitialized a', ],
       [ 'a;b;c;d;x;y;z', [ (0) x 7 ], 'more uninitialized vars', ],
       [ 'a; a = 1; a', [0,1], 'assign number to lexical', ],
       [ 'a = 11; -a', -11, 'assign number to lexical', ],
       [ 'a; a = 1 + 1; a', [0,2], 'assign number to expression', ],
       [ 'a; b; a = 4; b = 5; c = 6; "a = "; a;  "b = "; b;  "c = "; c', [ 0, 0, 'a = 4', 'b = 5', 'c = 6' ], 'assign several lexicals' ], 
       [ 'a; b; a = 4; b = a; c = 1; "a = "; a;  "b = "; b;  "c = "; c', [ 0, 0, 'a = 4', 'b = 4', 'c = 1' ], 'assign lexical to lexical' ], 
       [ 'a  + 1', [ 1 ], 'expression with named', ], 
       [ 'a = 4; b = a  + 1; "a = "; a;  "b = "; b ', [ 'a = 4', 'b = 5', ], 'assign lexical to expression with lexical', ], 

       # increment and decrement 
       [ 'a = a + 1; a ; a', [1,1], ],
       [ '++k;', 1, ],
       [ '--k;', -1, ],
       [ '++a; a', [1,1], ],
       [ 'a; a = 1; a; ++a; a', [0,1,2,2], 'increment', ],
       [ 'a; a = 1; 1; --a; a', [0,1,0,0], 'decrement', ],

       # If 
       [ '1; if ( 1 ) 2; 3', [1,2,3], 'if with a true condition', ],
       [ '1; if ( 0 ) 2; 3', [1,3], 'if with a false condition', ],
       [ '1; if ( 1 < 2 ) 2; 3', [1, 2, 3], 'if with a relational operator', ],

       # If with '<'
       [ '1; if ( 3 + 4 < 8*2 - 10 ) 2; 3', [1, 3], ],
       [ '1; if ( 3 + 4 < 8*2 - 9 ) 2; 3', [1, 3], ],
       [ '1; if ( 3 + 4 < 8*2 + 10 ) 2; 3', [1, 2, 3], ],

       # If with '<='
       [ '1; if ( 3 + 4 <= 8*2 - 10 ) 2; 3', [1, 3], ],
       [ '1; if ( 3 + 4 <= 8*2 - 9 ) 2; 3', [1, 2, 3], ],
       [ '1; if ( 3 + 4 <= 8*2 + 10 ) 2; 3', [1, 2, 3], ],
       # If with '=='
       [ '1; if ( 3 + 4 == 8*2 - 10 ) 2; 3', [1, 3], ],
       [ '1; if ( 3 + 4 == 8*2 - 9 ) 2; 3', [1, 2, 3], ],
       [ '1; if ( 3 + 4 == 8*2 + 10 ) 2; 3', [1, 3], ],
       # If with '!='
       [ '1; if ( 3 + 4 != 8*2 - 10 ) 2; 3', [1, 2, 3], ],
       [ '1; if ( 3 + 4 != 8*2 - 9 ) 2; 3', [1, 3], ],
       [ '1; if ( 3 + 4 != 8*2 + 10 ) 2; 3', [1, 2, 3], ],
       # If with '>='
       [ '1; if ( 3 + 4 >= 8*2 - 10 ) 2; 3', [1, 2, 3], ],
       [ '1; if ( 3 + 4 >= 8*2 - 9 ) 2; 3', [1, 2, 3], ],
       [ '1; if ( 3 + 4 >= 8*2 + 10 ) 2; 3', [1, 3], ],

       # If with '>'
       [ '1; if ( 3 + 4 > 8*2 - 10 ) 2; 3', [1, 2, 3], ],
       [ '1; if ( 3 + 4 > 8*2 - 9 ) 2; 3', [1, 3], ],
       [ '1; if ( 3 + 4 > 8*2 + 10 ) 2; 3', [1, 3], ],
   );

# @tests = ( [ '++k', 1 ], );

my @todo_tests
    = ( # floats
        [ '.1', '.1', 'Parrot bc says 0.1', ],
        [ '-.1', '-.1', 'Parrot bc says -0.1',],
        [ '-1.0000001', '-1.0000001', 'probably limited precission of Float PMC', ],

        # keyword quit
        [ "0\n1; 2; quit;  3", [ 0 ], 'is that correct in GNU bc?', ],
      );


if ( $Parrot::Config::PConfig{has_python} ) {
  plan tests => scalar(@tests) + scalar(@todo_tests);
}
else {
  plan skip_all => 'ANTLR2 based bc needs Python';
}

run_tests(\@tests);

TODO:
{
    local $TODO = 'not implemented';
    run_tests( \@todo_tests );
}; 
