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

my @test_cases_without_exit_code = (
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
      q{package-name of 'common-lisp' package},
    ],
    [ q{ ( print (sys:%package-name (sys:%find-package "cl")))
      },
      q{COMMON-LISP},
      q{package-name of 'cl' package},
    ],
    [ q{ ( print ( null (sys:%find-package "common-lisp")))
      },
      q{NIL},
      q{null of find-package "common-lisp"},
    ],
    [ q{ ( print ( null (sys:%find-package "un-common-lisp")))
      },
      q{T},
      q{null of find-package "uncommon-lisp"},
    ],
    [ q{( sys:%alias-package (sys:%find-package "common-lisp") "un-common-lisp")
        ( print ( null ( sys:%find-package "un-common-lisp")) )
      },
      q{NIL},
      q{null of find-package "uncommon-lisp" after alias-package},
    ],
    [ q{( sys:%alias-package (sys:%find-package "common-lisp") "un-common-lisp")
        ( print ( sys:%package-name ( sys:%find-package "un-common-lisp")) )
      },
      q{COMMON-LISP},
      q{package-name of find-package "uncommon-lisp" after alias-package},
    ],
);

my @test_cases_with_exit_code = (
    [ q{ ( print SYS:*INSIDE-BACKQUOTE* )
      },
      qr{has no value},
      q{undefined var *INSIDE-BACKQUOTE*},
    ],
    [ q{ ( print sys:*inside-backquote-list*)
      },
      qr{has no value},
      q{undefined var *INSIDE-BACKQUOTE-LIST*},
    ],
);

Test::More::plan( tests =>   scalar @test_cases_without_exit_code
                           + scalar @test_cases_with_exit_code );

foreach ( @test_cases_without_exit_code )
{
    my ( $code, $out, $desc, @other ) = @{ $_ };

    $desc ||= substr( $code, 0, 32 ); 
    language_output_is( 'Lisp', $code, $out . "\n", $desc, @other );
}

foreach ( @test_cases_with_exit_code )
{
    my ( $code, $regex, $desc, @other ) = @{ $_ };

    $desc ||= substr( $code, 0, 32 ); 
    language_error_output_like( 'Lisp', $code, $regex, $desc, @other );
}
