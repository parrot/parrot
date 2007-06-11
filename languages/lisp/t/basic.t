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
    [ q{ ( print ( list 1 2 ) ) },
      q{(1 . (2 . NIL))},
    ],
    [ q{ ( print ( car ( list 1 2 )) ) },
      q{1},
    ],
    [ q{( print ( cdr ( list 1 2 )) ) },
      q{(2 . NIL)},
    ],
    [ q{( print ( cons 1 2 ) ) },
      q{(1 . 2)},
    ],
    [ q{ ( print ( car ( cons 1 2 )) ) },
      q{1},
    ],
    [ q{ ( print ( cdr ( cons 1 2 )) ) },
      q{2},
    ],
    [ q{ ( setq asdf 1234 ) ( print asdf ) },
      q{1234},
    ],
);

Test::More::plan( tests => scalar @test_cases );

foreach ( @test_cases )
{
     my ( $code, $out, $desc ) = @{ $_ };

     $desc ||= substr( $code, 0, 32 ); 
     language_output_is( 'Lisp', $code, $out . "\n", $desc );
}
