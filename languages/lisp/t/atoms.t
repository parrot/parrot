# $Id$

=head1 NAME

lisp/t/atoms.t - tests for atoms in Parrot Common Lisp

=head1 DESCRIPTION

Atoms.

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
    [ q{ 0 },
      0,
      q{T},
      'integer 0',
      todo => '0 is still strange',
    ],
    [ q{ -0 },
      -0,
      q{T},
      'integer negative 0',
      todo => '0 is still strange',
    ],
    [ q{ 1 },
      1,
      q{T},
      'integer 1'
    ],
    [ q{ -1 },
      -1,
      q{T},
      'integer -1'
    ],
    [ q{ 2 },
      2,
      q{T},
      'integer 2'
    ],
    [ q{ 2 },
      2,
      q{T},
      'integer 2'
    ],
    [ q{ 123456789 },
      123456789,
      q{T},
      'integer 123456789'
    ],
    [ q{ -123456789 },
      -123456789,
      q{T},
      'integer -123456789'
    ],
    [ q{ nil },
      'NIL',
      q{T},
      'false'
    ],
    [ q{ NIL },
      'NIL',
      q{T},
      'NIL'
    ],
    [ q{ Nil },
      'NIL',
      q{T},
      'Nil'
    ],
    [ q{ t },
      'T',
      q{T},
      'true'
    ],
    [ q{ T },
      'T',
      q{T},
      'true'
    ],
    [ q{ () },
      'NIL',
      q{T},
      'empty list is NIL'
    ],
    [ q{ (atom 999) },
      'T',
      q{T},
      'integer 999 is an atom'
    ],
    [ q{ "neunhundertneunundneunzig" },
      'neunhundertneunundneunzig',
      q{T},
      'string in double quotes'
    ],
    [ q{ " single quote '" },
      q{ single quote '},
      q{T},
      'string with single quote'
    ],
    [ q{ " double quote \"" },
      q{ double quote "},
      q{T},
      'string with double quote'
    ],
    [ q{ " backslash \\\\" },      
      q{ backslash \\},
      q{T},
      'string with backslash'
    ],
    [ q{ "" },
      '',
      q{T},
      'empty string'
    ],
    [ q{ " " },
      ' ',
      q{T},
      'single space'
    ],
    [ q{ " a  s   d    f     " },
      ' a  s   d    f     ',
      q{T},
      'string with spaces'
    ],
    [ q{ (atom ( + 1 2 )) },
      'T',
      q{T},
      'result of an addition is an atom'
    ],
    [ q{ (atom '( + 1 2 )) },
      'NIL',
      q{T},
      'a quoted addition is not an atom'
    ],
);

Test::More::plan( tests => 2 * scalar( @test_cases ) );

foreach ( @test_cases )
{
    my ( $code, $out, $is_atom, $desc, @other ) = @{ $_ };

    language_output_is( 'Lisp', "( print $code )", $out . "\n", "print $desc", @other );
    language_output_is( 'Lisp', "( print ( atom $code ))", $is_atom . "\n", "atom: $desc", @other );
}
