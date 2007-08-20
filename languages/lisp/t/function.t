# $Id$

=head1 NAME

lisp/t/function.t - tests the function 'function'

=head1 DESCRIPTION

Needed for 'defun'.

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
    [ q{ ( print (apply ( function +) ( list 1 2)) ) },
      q{3},
      q{apply of builtin function},
    ],
    [ q{ ( print (funcall ( function +) 1 2) ) },
      q{3},
      q{funcall of builtin function},
      todo => 'no FUNCALL yet'
    ],
    [ q{ ( setq my_function '+) ( print (apply my_function ( list 1 2)) ) },
      q{3},
      q{apply of setq'd builtin function},
    ],
    [ q{ ( setq my_function '+) ( print (funcall my_function 1 2) ) },
      q{3},
      q{funcall of setq'd builtin function},
      todo => 'no FUNCALL yet'
    ],
    [ q{ ( print ( function (lambda () ( + 1 5 ) ) ))
      },
      q{#<FUNCTION ANONYMOUS>},
      q{stringification of a function with 0 params },
    ],
    [ q{ ( print ( funcall ( function (lambda () ( + 1 5 ) ) ) ) )
      },
      q{6},
      q{funcall a function with 0 params },
      todo => 'funcall does not work yet'
    ],
    [ q{ ( print ( apply ( function (lambda () ( + 1 5 ) ) ) () ) )
      },
      q{6},
      q{apply a function with 0 params },
    ],
    [ q{ ( print ( function (lambda ( a b ) ( + a b ) ) ))
      },
      q{#<FUNCTION ANONYMOUS>},
      q{stringification of a function with two params },
    ],
    [ q{ ( print ( funcall ( function (lambda (a b) ( + a b ) ) ) 2 40 ) )
      },
      q{42},
      q{funcall a function with 2 params },
      todo => 'funcall does not work yet'
    ],
    [ q{ ( print ( apply ( function (lambda (a b) ( + a b ) ) ) ( list 2 40 ) ) )
      },
      q{42},
      q{apply a function with 2 params },
      todo => 'apply does not work yet'
    ],
);

my @test_cases_with_exit_code = (
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
