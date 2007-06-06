# $Id$

=head1 NAME

lisp/t/basic.t - tests for Parrot Common Lisp

=head1 DESCRIPTION

Basic stuff.

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
    [ q{ ( list 1 2 ) },
      q{(1 . (2 . NIL))},
    ],
    [ q{ ( car ( list 1 2 )) },
      q{1},
    ],
    [ q{( cdr ( list 1 2 )) },
      q{(2 . NIL)},
    ],
    [ q{( cons 1 2 ) },
      q{(1 . 2)},
    ],
    [ q{ ( car ( cons 1 2 )) },
      q{1},
    ],
    [ q{ ( cdr ( cons 1 2 )) },
      q{(2)},
    ],
);

Test::More::plan( tests => scalar @test_cases );

foreach ( @test_cases )
{
     my ( $code, $out, $desc ) = @{ $_ };

     $desc ||= substr( $code, 0, 16 ); 
     language_output_is( 'Lisp', "( print $code )", $out . "\n", $desc );
}
