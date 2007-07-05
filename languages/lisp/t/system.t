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
    [ q{ ( print SYS:*INSIDE-BACKQUOTE* )
      },
      q{unused variable *INSIDE-BACKQUOTE*},
      q{undefined var *INSIDE-BACKQUOTE*},
      todo => 'need to check error output'
    ],
    [ q{ ( print sys:*inside-backquote-list*)
      },
      q{unused variable *INSIDE-BACKQUOTE-LIST*},
      q{undefined var *INSIDE-BACKQUOTE-LIST*},
      todo => 'need to check error output'
    ],
    [ q{ ( print *gensym-counter* )
      },
      q{1},
      q{defined var *gensym-counter*},
    ],
    [ q{ ( print (sys:%get-object-attribute '*gensym-counter* "LispSymbol" "name"))
      },
      q{*GENSYM-COUNTER*},
      q{get-object-attribute name},
    ],
    [ q{ ( print ( sys:%package-name (sys:%get-object-attribute '*gensym-counter* "LispSymbol" "package")))
      },
      q{COMMON-LISP},
      q{get-object-attribute package},
    ],
    [ q{ ( print (sys:%get-object-attribute '*gensym-counter* "LispSymbol" "value"))
      },
      q{1},
      q{get-object-attribute value},
    ],
    [ q{  ( sys:%set-object-attribute '*gensym-counter* "LispSymbol" "value" (* 42 2) )
          ( print (sys:%get-object-attribute '*gensym-counter* "LispSymbol" "value"))
      },
      q{84},
      q{get-object-attribute value},
    ],
    [ q{ (setq english_to_german (sys:%make-hash-table))
         (sys:%set-hash english_to_german "House" "Haus")
         ( print (sys:%get-hash english_to_german "House" ))
      },
      q{Haus},
      q{make-hash-table set-hash get-hash},
    ],
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
