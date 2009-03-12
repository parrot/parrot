# $Id$

=head1 NAME

lisp/t/cl.t - tests function in COMMON-LISP

=head1 DESCRIPTION

Functions defined in cl.pir.

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
    [ q{ ( print *gensym-counter* )
      },
      q{1},
      q{defined var *gensym-counter*},
    ],
    [ q{ ( print *package* )
      },
      q{#<PACKAGE COMMON-LISP>},
      q{*package* stringified},
    ],
    [ q{ ( print *readtable* )
      },
      q{#<READTABLE 0x????????>},
      q{*readtable* stringified},
    ],
    [ q{ ( print *standard-input* )
      },
      q{#<IO STREAM>},
      q{*standard-input* stringified},
    ],
    [ q{ ( print *standard-output* )
      },
      q{#<IO STREAM>},
      q{*standard-output* stringified},
    ],
    [ q{ (print '(1 2)) },
      q{(1 . (2 . NIL))},
      q{quoting a list},
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
    [ q{ ( print "How does function work?" ) },
      q{},
      q{function},
      todo => 'test the function function'
    ],
    [ q{ ( print ( gensym ) ) },
      q{G000001},
    ],
    [ q{ ( gensym ) ( print *gensym-counter* ) },
      q{2},
    ],
    [ q{ ( gensym )( gensym )( gensym ) ( print *gensym-counter* ) },
      q{4},
    ],
    [ q{ ( if T ( print "T is true" ) ( print "T is false" ) ) },
      q{T is true},
    ],
    [ q{ ( if NIL ( print "NIL is true" ) ( print "NIL is false" ) ) },
      q{NIL is false},
    ],
    [ q{ ( if ( - 3 3 ) ( print "3-3 is true" ) ( print "3-3 is false" ) ) },
      q{3-3 is true},
    ],
    [ q{ ( if ( + 3 3 ) ( print "3+3 is true" ) ( print "3+3 is false" ) ) },
      q{3+3 is true},
    ],
    [ q{ ( "let" ) },
      q{NIL},
      q{let not tested yet},
      todo => 'understand let'
    ],
    [ q{ ( print ( list 1 2 ) ) },
      q{(1 . (2 . NIL))},
    ],
    [ q{ ( print ( null nil ) ) },
      q{T},
    ],
    [ q{ ( print ( null 1 ) ) },
      q{NIL},
    ],
    [ q{ ( print ( null ' (  ) ) ) },
      q{T},
    ],
    [ q{ ( print ( null T ) ) },
      q{NIL},
    ],
    [ q{ ( print ( progn 1 ( + 1 1 ) ( + 1 1 1 ) ) ) },
      q{3},
    ],
    [ q{ ( setq asdf 1234 ) ( print asdf ) },
      q{1234},
    ],
    [ q{ ( print ( quote (   +   1    1     ) ) ) },
      q{(+ . (1 . (1 . NIL)))},
    ],
    [ q{ ( print ( quote '1 ) ) },
      q{(QUOTE . (1 . NIL))},
    ],
    [ q{ ( print ( rplaca ( cons 1 2 ) 3 ) ) },
      q{(3 . 2)},
    ],
    [ q{ ( print ( rplacd ( cons 1 2 ) 3 ) ) },
      q{(1 . 3)},
    ],
    [ q{ ( setq asdf 1234 ) ( print asdf ) },
      q{1234},
    ],
    [ q{ ( setq asdf 1234 ) ( print ( type-of asdf ) ) },
      q{INTEGER},
    ],
    [ q{ ( setq asdf 1234 ) ( print ( type-of 'asdf ) ) },
      q{SYMBOL},
    ],
    [ q{ ( print ( type-of ( cons 1 2 ) ) ) },
      q{CONS},
    ],
    [ q{ ( print ( type-of '( cons 1 2 ) ) ) },
      q{CONS},
    ],
    [ q{ ( print ( type-of T ) ) },
      q{BOOLEAN},
      q{type-of T},
      todo => q{sbcl says T is a BOOLEAN}
    ],
    [ q{ ( print ( type-of NIL ) ) },
      q{NULL},
      q{type-of NIL},
      todo => q{sbcl says NIL is a NULL}
    ],
    [ q{ ( print (values 3 4 5 ) ) },
      q{3},
      q{values},
      todo => 'values is not evaluated',
    ],
);

Test::More::plan( tests => scalar @test_cases );

foreach ( @test_cases )
{
    my ( $code, $out, $desc, @other ) = @{ $_ };

    $desc ||= substr( $code, 0, 32 ); 
    language_output_is( 'Lisp', $code, $out . "\n", $desc, @other );
}
