# $Id$

=head1 NAME

t/php/arithmetics.t - tests for Pipp

=head1 SYNOPSIS

    perl t/harness t/php/arithmetics.t

=head1 DESCRIPTION

Hello World test.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test;

# A little helper to do data driven testing
sub run_tests {
    my ( $tests ) = @_;

    foreach ( @{$tests} ) {
        die 'invalid test' unless ref( $_ ) eq 'ARRAY';
        die 'invalid test' unless scalar(@{$_}) >= 2 || scalar(@{$_}) <= 5;
        my ( $php_code, $expected, $desc, %options ) = @{$_};
        $php_code = <<"CODE";
<?php
echo $php_code;
echo "\\n";
?>
CODE

        # expected input can be set up as array reference
        if ( ref $expected ) {
            die 'expected ARRAY reference' unless ref( $expected ) eq 'ARRAY';
            $expected = join( q{\n}, @{$expected} );
        }

        # use default description when '' or undef is set up
        $desc ||= "bc: $php_code";

        language_output_is( 'pipp', $php_code, $expected . "\n", $desc, %options );
    }
}

my @tests = (
    [ '0', [ 0 ], 'positive 0', ],
    [ '1', [ 1 ], 'positive 1', ],
    [ '22', [ 22 ], 'positive 22', ],
    [ '333', [ 333 ], 'positive 333', ],
    [ '12345678', [ 12345678 ], 'large positive int',  ],
    [ '+4444', [ 4444 ], 'unary plus, no whitespace',  ],
    [ '+  55555', [ 55555 ], 'unary plus, with whitespace',  ],
    [ '-1', [ -1 ], 'negative 1', ],
    [ '-22', [ -22 ], 'negative 22', ],
    [ '-333', [ -333 ], 'negative 333', ],
    [ '-12345678', [ -12345678 ], 'large negative int',  ],
    [ '-1234567', [ -1234567 ], 'less large negative int',  ],
    [ '-123456', [ -123456 ], 'even less large negative int',  ],
    [ '1 + 1', [ 2 ], 'one plus one', ],
    [ '1 + 2', '3', 'two summands', ],
    [ '1 + 2 + 3', '6', 'three summands', ],
    [ '1 + 0 + 3', '4', 'three summands including 0', ],
    [ '1 + 2 + 3 + 4 + 5', '15', '5 summands', ],
    [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8', '36', '8 summands', ],
    [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10', '55', '10 summands', ],
    [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11', '66', '11 summands', ],
    [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12', '78', '12 summands', ],
    [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13', '91', '13 summands', ],
    [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14', '105', 'Gauss was right', ],
    [ '-1 + 10', '9', 'negative int in expression', ],
    [ '2 - 1', '1', 'subtraction' ],
    [ '1 - 1', '0', ],
    [ '1 - 2', '-1', ],
    [ '-1 - -2', '1', ],
    [ '1 - 2 - 10', '-11', ],
    [ '-1 + -2 - -4 + 10', '11', ],
    [ '- 1 - - 6 + 3 - 2', '6', ],
    [ '2 * 2', '4', ],
    [ ' 1 * 2 * 3 * 4 * 5 ', '120', ],
    [ ' 1 * 2 * 3 * 4 * 5 / 2 ', '60', ],
    [ '2 / 2', '1', ],
    [ '2 % 2', '0', ],
    [ '3 % 2', '1', ],
    [ '2 / 2 + 1000', '1001', ],
    [ '2 * 2 + 4000', '4004', ],
    [ '1 - 6 / 2', '-2', ],
    [ '2 % 2 + 4', '4', ],
    [ '  ( 1 ) ', '1', 'one in parenthesis', ],
    [ '  ( 1 + 2 ) - 3 ', '0', ],
    [ ' - ( 9 ) ', '-9', ],
    [ ' - ( - ( 9 ) ) ', '9', ],
    [ ' - ( - ( - ( 9 ) ) ) ', '-9', ],
    [ ' - ( 1 + 2 ) ', '-3', ],
    [ ' - ( 1 + 2 ) - 3 ', '-6', ],
    [ '  ( 1 + 2 ) - ( 5  + 1 - 2 ) + 7 - ( 8 - 100 ) ', '98', ],
    [ '  ( 1 + 2 ) * 3 ', '9', ],
    [ '  ( 1 * 2 ) * 3 ', '6', ],
    [ '  ( 1 * 2 ) + 3 ', '5', ],
    [ '  ( 1 * 2 ) + ( ( ( ( 3 + 4 ) + 5 ) * 6 ) * 7 ) ', '506', ],
    [ '1.2', '1.2', ],
    [ '-1.23', '-1.23', ],
    [ '-0.12345', '-0.12345', ],
    [ '.1', '0.1', 'Parrot says 0.1', ],
    [ '-.1', '-0.1', 'Parrot bc says -0.1',],
    [ '2 / 2 + .1', '1.1', ],
    [ '2 * 2 + .4', '4.4', ],
    [ '.1 - 6 / 2', '-2.9', ],
    [ '-1.0000001', '-1.0000001', 'float with 8 significant digits' ],
    [ '-1.00000001', '-1.00000001', 'float with 9 significant digits' ],
    [ '-1.000000001', '-1.000000001', 'float with 10 significant digits' ],
    [ '-1.0000000001', '-1.0000000001', 'float with 11 significant digits' ],
    [ '-1.00000000001', '-1.00000000001', 'float with 12 significant digits' ],
    [ '1 & 3', '1', 'bitwise and' ],
    [ '2 & 2 + 8', '2', 'bitwise and, less precedence than +' ],
    [ '1 | 2', '3', 'bitwise or' ],
    [ '6 ^ 5', '3', 'bitwise xor' ],
    [ '010', 8, 'octal', todo => 'broken' ],
    [ '0x10', 16, 'hex', todo => 'broken' ],
);

plan( tests => scalar(@tests) );
run_tests(\@tests);
