# $Id$

=head1 NAME

plumhead/t/hello.t - tests for Plumhead

=head1 DESCRIPTION

Hello World test.

=cut

# pragmata
use strict;
use warnings;
use 5.006_001;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

# core Perl modules
use Test::More;

# Parrot modules
use Parrot::Test;

# A little helper to do data driven testing
sub run_tests {
    my ( $tests ) = @_;

    foreach ( @{$tests} ) {
        die 'invalid test' unless ref( $_ ) eq 'ARRAY';
        die 'invalid test' unless scalar(@{$_}) >= 2 || scalar(@{$_}) <= 5;
        my ( $php_code, $expected, $desc, %options ) = @{$_};
        $php_code = <<"END_CODE";
<?php
echo $php_code;
echo "\n";
?>
END_CODE

        # expected input can be set up as array reference
        if ( ref $expected ) {
            die 'expected ARRAY reference' unless ref( $expected ) eq 'ARRAY';
            $expected = join( q{\n}, @{$expected} );
        }

        # use default description when '' or undef is set up
        $desc ||= "bc: $php_code";

        language_output_is( 'plumhead', $php_code, $expected . "\n", $desc, %options );
    }
}

my @tests
  = ( [ '1', [ 1 ], 'positive 1', ],
      [ '-1', [ -1 ], 'negative 1', ],
      [ '1 + 1', [ 2 ], 'one plus one', ],
      [ '0', [ 0 ], 'zero',  ],
      [ '2', [ 2 ], 'positive int',  ],
      [ '12345678', [ 12345678 ], 'another positive int',  ],
      [ '-12345678', [ -12345678 ], 'another negative int',  ],
      [ '1 + 2', '3', 'two summands', ],
      [ '1 + 2 + 3', '6', 'three summands', ],
      [ '1 + 0 + 3', '4', 'three summands including 0', ],
      [ '1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 13 + 14', '105', 'Gauss was right', ],
      [ '-1 + 10', '9', 'negative int in expression', ],
      [ '2 - 1', '1', ],
      [ '1 - 1', '0', ],
      [ '1 - 2', '-1', ],
      [ '-1 - -2', '1', ],
      [ '-1 + -2 - -4 + 10', '11', ],
      [ '- 1 - - 6 + 3 - 2', '6', ],
      [ '2 * 2', '4', ],
      [ '2 / 2', '1', ],
      [ '2 % 2', '0', ],
      [ '3 % 2', '1', ],
      [ '2 / 2 + .1', '1.1', ],
      [ '2 * 2 + .4', '4.4', ],
      [ '.1 - 6 / 2', '-2.9', ],
      [ '2 % 2 + 4', '4', ],
      [ '  ( 1 ) ', '1', 'one in parenthesis', ],
      [ '  ( 1 + 2 ) - 3 ', '0', ],
      [ ' - ( 1 + 2 ) - 3 ', '-6', ],
      [ '  ( 1 + 2 ) - ( 5  + 1 - 2 ) + 7 - ( 8 - 100 ) ', '98', ],
      [ '  ( 1 + 2 ) * 3 ', '9', ],
      [ '  ( 1 * 2 ) * 3 ', '6', ],
      [ '  ( 1 * 2 ) + 3 ', '5', ],
      [ '  ( 1 * 2 ) + ( ( ( ( 3 + 4 ) + 5 ) * 6 ) * 7 ) ', '506', ],
      [ '.1', '0.1', 'Parrot says 0.1', ],
      [ '-.1', '-0.1', 'Parrot bc says -0.1',],
      [ '-1.0000001', '-1.0000001', 'probably limited precission of Float PMC', ],
    );

plan( tests => scalar(@tests) );
run_tests(\@tests);
