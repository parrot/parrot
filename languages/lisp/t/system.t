# $Id$

=head1 NAME

lisp/t/system.t - tests function in SYSTEM

=head1 DESCRIPTION

Functions defined in system.pir.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

# core Perl modules
use Test::More;

# Parrot modules
use Parrot::Test;

my @test_cases = (
    [ q{ (setq english_to_german (sys:%make-hash-table))
         (setf (sys:%get-hash "House" table) "Haus")
         ( print (sys:%get-hash "House" table))
      },
      q{Haus},
      q{hash-table},
      todo => 'setf not here yet'
    ],
);

Test::More::plan( tests => scalar @test_cases );

foreach ( @test_cases )
{
    my ( $code, $out, $desc, @other ) = @{ $_ };

    $desc ||= substr( $code, 0, 32 ); 
    language_output_is( 'Lisp', $code, $out . "\n", $desc, @other );
}
