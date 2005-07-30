# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

bc/t/basic.t - tests for bc

=head1 DESCRIPTION

Very basic checks.

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Test::More;
use Parrot::Test tests => 27;

sub run_tests
{
  my ( $tests ) = @_;
  foreach my $test_case ( @{$tests} )
  {
    die "invalid test" unless ref( $test_case ) eq 'ARRAY';
    die "invalid test" unless scalar(@$test_case) == 2 || scalar(@$test_case) == 3;

    my ( $bc, $expected, $desc ) = @{$test_case};
    language_output_is( 'bc', "$bc\nquit\n", "$expected\n", $desc || "bc: $bc" );
  }
} 

my @tests = 
     ( # positive and negative Integers
       #[ '+1', '1', 'unary +' ], Surprise, there is no unary +
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
       [ '2 % 2', '0' ],
       # precedence of mul, diff, mod
       [ '2 / 2 + .1', '1.1' ],
       [ '2 * 2 + .4', '4.4' ],
       [ '.1 - 6 / 2', '-2.9' ],
       [ '2 % 2 + 4', '4' ],
     );
my @todo_tests = 
     ( # floats
       [ '.1', '.1' ],
       [ '-.1', '-.1' ],
     );

run_tests( \@tests );

TODO:
{
  local $TODO = 'not implemented';
  run_tests( \@todo_tests );
} 
