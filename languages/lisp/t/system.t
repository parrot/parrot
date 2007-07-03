# $Id$

=head1 NAME

lisp/t/system.t - tests functions in SYSTEM

=head1 DESCRIPTION

Implementations specific functions.

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
      todo => 'setf not implemented yet'
    ],
    [ q{ ( print (sys:%package-name (sys:%find-package "common-lisp")))
      },
      q{COMMON-LISP},
      q{package-name},
    ],
);

Test::More::plan( tests => scalar @test_cases );

foreach ( @test_cases )
{
    my ( $code, $out, $desc, @other ) = @{ $_ };

    $desc ||= substr( $code, 0, 32 ); 
    language_output_is( 'Lisp', $code, $out . "\n", $desc, @other );
}
