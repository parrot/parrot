# $Id$

=head1 NAME

lisp/t/atoms.t - tests for Parrot Common Lisp

=head1 DESCRIPTION

Basic types.

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
    [ q{ 1 },
      1,
      'integer 1'
    ],
    [ q{ -2 },
      -2,
      'integer -2'
    ],
    [ q{ (- 3) },
      -3,
      '3 negated'
    ],
    [ q{ 0 },
      0,
      'zero',
      todo => '0 is still strange',
    ],
    [ q{ nil },
      'NIL',
      'false'
    ],
    [ q{ NIL },
      'NIL',
      'NIL'
    ],
    [ q{ Nil },
      'NIL',
      'Nil'
    ],
    [ q{ t },
      'T',
      'true'
    ],
    [ q{ T },
      'T',
      'true'
    ],
    [ q{ () },
      'NIL',
      'empty list is NIL'
    ],
    [ q{ (atom 0) },
      'T',
      'integer 0 is an atom',
      todo => '0 is still strange',
    ],
    [ q{ (atom 999) },
      'T',
      'integer 999 is an atom'
    ],
    [ q{ (atom "neunhundertneunundneunzig") },
      'T',
      'string 999 is an atom'
    ],
);

Test::More::plan( tests => scalar @test_cases );

foreach ( @test_cases )
{
    my ( $code, $out, $desc, @other ) = @{ $_ };

    language_output_is( 'Lisp', "( print $code )", $out . "\n", $desc, @other );
}
