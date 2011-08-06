#! perl
# Copyright (C) 2005-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;
use Parrot::Config;

=head1 NAME

t/examples/pasm.t - Test examples in F<examples/pasm>

=head1 SYNOPSIS

    % prove t/examples/pasm.t

=head1 DESCRIPTION

Test the examples in F<examples/pasm>.

=head1 SEE ALSO

F<t/examples/pir.t>

=cut

# Set up expected output for examples
my %expected = (

    'hello.pasm' => << 'END_EXPECTED',
Hello World
END_EXPECTED
);

SKIP: {
    skip( 'GMP is not available', 1 ) unless $PConfig{gmp};

    $expected{'fact.pasm'} = << 'END_EXPECTED'
fact of 0 is: 1
fact of 1 is: 1
fact of 2 is: 2
fact of 3 is: 6
fact of 4 is: 24
fact of 5 is: 120
fact of 6 is: 720
fact of 7 is: 5040
fact of 8 is: 40320
fact of 9 is: 362880
fact of 10 is: 3628800
fact of 11 is: 39916800
fact of 12 is: 479001600
fact of 13 is: 6227020800
fact of 14 is: 87178291200
fact of 15 is: 1307674368000
fact of 16 is: 20922789888000
fact of 17 is: 355687428096000
fact of 18 is: 6402373705728000
fact of 19 is: 121645100408832000
fact of 20 is: 2432902008176640000
fact of 21 is: 51090942171709440000
fact of 22 is: 1124000727777607680000
fact of 23 is: 25852016738884976640000
fact of 24 is: 620448401733239439360000
fact of 25 is: 15511210043330985984000000
fact of 26 is: 403291461126605635584000000
fact of 27 is: 10888869450418352160768000000
fact of 28 is: 304888344611713860501504000000
fact of 29 is: 8841761993739701954543616000000
fact of 30 is: 265252859812191058636308480000000
END_EXPECTED
}

while ( my ( $example, $expected ) = each %expected ) {
    example_output_is( "examples/pasm/$example", $expected );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
