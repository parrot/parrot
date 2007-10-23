# $Id$

=head1 NAME

lisp/t/arithmetics.t - tests for Parrot Common Lisp

=head1 DESCRIPTION

Basic math.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

# core Perl modules
use Test::More     tests => 6;

# Parrot modules
use Parrot::Test;

language_output_is( 'Lisp', <<'END_CODE', <<'END_OUT', 'addition' );
( print ( + 1 3 ) )
END_CODE
4
END_OUT

language_output_is( 'Lisp', <<'END_CODE', <<'END_OUT', 'negation' );
( print ( - 3 ) )
END_CODE
-3
END_OUT

language_output_is( 'Lisp', <<'END_CODE', <<'END_OUT', '1 equals 1' );
( print ( =  1 1 ) )
END_CODE
T
END_OUT

language_output_is( 'Lisp', <<'END_CODE', <<'END_OUT', '1 does not equal 2' );
( print ( =  1 2 ) )
END_CODE
NIL
END_OUT

language_output_is( 'Lisp', <<'END_CODE', <<'END_OUT', '2 equals 1+1' );
( print ( =  2 ( + 1 1 ) ) )
END_CODE
T
END_OUT

language_output_is( 'Lisp', <<'END_CODE', <<'END_OUT', '2 equals 1+1' );
( print ( mod  11 3 ) )
END_CODE
2
END_OUT
