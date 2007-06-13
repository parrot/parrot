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
    [ q{ (print '(1 2)) },
      q{(1 . (2 . NIL))},
      q{quoting a list},
    ],
    [ q{ ( setq my_function '+) ( print (apply my_function '(1 2)) ) },
      q{3},
      q{function apply},
      todo => 'apply does not evaluate',
    ],
    [ q{ ( setq my_function '+) ( print (boundp 'my_function) ) },
      q{T},
      q{boundp on a bound variable},
    ],
    [ q{ ( setq my_function '+) ( print (boundp 'your_function) ) },
      q{NIL},
      q{boundp on an unbound variable},
    ],
    [ q{ ( print ( car ( list 1 2 )) ) },
      q{1},
    ],
    [ q{ ( print ( car ( cons 1 2 )) ) },
      q{1},
    ],
    [ q{( print ( cdr ( list 1 2 )) ) },
      q{(2 . NIL)},
    ],
    [ q{ ( print ( cdr ( cons 1 2 )) ) },
      q{2},
    ],
    [ q{ ( print ( char "asdf" 0 ) ) },
      q{a},
      q{first character},
      todo => 'still cannot pass 0',
    ],
    [ q{ ( print ( char "asdf" 1 ) ) },
      q{s},
    ],
    [ q{ ( print ( char "asdf" 3 ) ) },
      q{f},
    ],
    [ q{ ( print ( cons 1 2 ) ) },
      q{(1 . 2)},
    ],
    [ q{ ( print ( cons 1 ( cons 2 3 ) ) ) },
      q{(1 . (2 . 3))},
    ],
    [ q{ ( print ( eq 1 1 ) ) },
      q{T},
      q{function eq},
      todo => 'eq is broken',
    ],
    [ q{ ( print ( eval '( + 1 1 ) ) ) },
      q{2},
      q{eval an addition},
    ],
    [ q{ ( print ( list 1 2 ) ) },
      q{(1 . (2 . NIL))},
    ],
    [ q{ ( setq asdf 1234 ) ( print asdf ) },
      q{1234},
    ],
    [ q{ ( setq asdf 1234 ) ( print asdf ) },
      q{1234},
    ],
);

Test::More::plan( tests => scalar @test_cases );

foreach ( @test_cases )
{
    my ( $code, $out, $desc, @other ) = @{ $_ };

    $desc ||= substr( $code, 0, 32 ); 
    language_output_is( 'Lisp', $code, $out . "\n", $desc, @other );
}
