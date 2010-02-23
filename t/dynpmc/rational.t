#! perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

t/dynpmc/rational.t - Rational PMC

=head1 SYNOPSIS

    % prove t/dynpmc/rational.t

=head1 DESCRIPTION

Tests the Rational PMC.

=cut

if ( $PConfig{gmp} ) { # If GMP is available, we check all functions.
    plan tests => 32;
}
else {                 # If GMP is not available, we only test the constructor and the
    plan tests => 2;   # version-method that is used to detect presence of GMP at runtime.
}

pir_output_is(<<'CODE', <<'OUTPUT', "Initialization");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    say "ok"
  .end
CODE
ok
OUTPUT

if (! $PConfig{gmp}) { # If GMP is not available, this is the last test:
pir_output_is(<<'CODE', <<'OUTPUT', "version-method");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    $S1 = $P1.'version'()
    say $S1
  .end
CODE
0.0.0
OUTPUT
exit;
}

# These tests are only run, if GMP is available.
pir_output_is(<<'CODE', <<'OUTPUT', "version-method");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    $S1 = $P1.'version'()
    say "ok"
  .end
CODE
ok
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Set and get native integer");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'

    $I1 = 42
    $P1 = $I1
    $I2 = $P1

    say $I2
  .end
CODE
42
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Set and get native float");
  .sub main :main
    loadlib $P0, 'rational'
    new $P0, 'Rational'

    $N0 = 11.1
    $P0 = $N0
    $N1 = $P0

    say $N1
  .end
CODE
11.1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Set and get native string");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'

    $S1 = "7/4"
    $P1 = $S1
    $S2 = $P1

    say $S2
  .end
CODE
7/4
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Set and get Integer");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'

    new $P2, 'Integer'
    new $P3, 'Integer'

    $P2 = 7
    $P1 = $P2
    $P3 = $P1

    say $P3
  .end
CODE
7
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Set and get Float");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'

    new $P2, 'Float'
    new $P3, 'Float'

    $P2 = 7.110000
    $P1 = $P2
    $P3 = $P1

    say $P3
  .end
CODE
7.11
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Set and get String");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'

    new $P2, 'String'
    new $P3, 'String'

    $P2 = "7/4"
    $P1 = $P2
    $P3 = $P1

    say $P3
  .end
CODE
7/4
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Increment and decrement");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'

    $P1 = "7/4"
    inc $P1
    print $P1
    print "\n"

    dec $P1
    dec $P1
    say $P1
  .end
CODE
11/4
3/4
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Adding integers (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 + $I1
    $P1 = $P1 + $I1
    $P1 = $P1 + $I1

    say $P1
    say $P2
  .end
CODE
31/2
17/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Adding floats (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 + $N1
    $P1 = $P1 + $N1
    $P1 = $P1 + $N1

    say $P1
    say $P2
  .end
CODE
31/2
17/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Adding Integers (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 + $P4
    $P2 = $P2 + $P4

    say $P2
    say $P3
  .end
CODE
17/2
17/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Adding Floats (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 + $P4
    $P2 = $P2 + $P4

    say $P2
    say $P3
  .end
CODE
17/2
17/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Adding Rationals (+inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 + $P3
    $P2 = $P2 + $P3

    say $P1
    say $P2
  .end
CODE
4
4
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Subtracting integers (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 - $I1
    $P1 = $P1 - $I1
    $P1 = $P1 - $I1

    say $P1
    say $P2
  .end
CODE
-25/2
-11/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Subtracting floats (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 - $N1
    $P1 = $P1 - $N1
    $P1 = $P1 - $N1

    say $P1
    say $P2
  .end
CODE
-25/2
-11/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Subtracting Integers (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 - $P4
    $P2 = $P2 - $P4

    say $P2
    say $P3
  .end
CODE
-11/2
-11/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Subtracting Floats (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 - $P4
    $P2 = $P2 - $P4

    say $P2
    say $P3
  .end
CODE
-11/2
-11/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Subtracting Rationals (+inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 - $P3
    $P2 = $P2 - $P3

    say $P1
    say $P2
  .end
CODE
-1
-1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Multiplying integers (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 * $I1
    $P1 = $P1 * $I1

    say $P1
    say $P2
  .end
CODE
21/2
21/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Multiplying floats (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 * $N1
    $P1 = $P1 * $N1

    say $P1
    say $P2
  .end
CODE
21/2
21/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Multiplying Integers (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 * $P4
    $P2 = $P2 * $P4

    say $P2
    say $P3
  .end
CODE
21/2
21/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Multiplying Floats (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 * $P4
    $P2 = $P2 * $P4

    say $P2
    say $P3
  .end
CODE
21/2
21/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Multiplying Rationals (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 * $P3
    $P2 = $P2 * $P3

    say $P1
    say $P2
  .end
CODE
15/4
15/4
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Dividing integers (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    $I1 = 7

    $P1 = "3/2"
    $P2 = $P1 / $I1
    $P1 = $P1 / $I1

    say $P1
    say $P2
  .end
CODE
3/14
3/14
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Dividing floats (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    $N1 = 7.

    $P1 = "3/2"
    $P2 = $P1 / $N1
    $P1 = $P1 / $N1

    say $P1
    say $P2
  .end
CODE
3/14
3/14
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Dividing Integers (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Integer'

    $P4 = 7

    $P2 = "3/2"
    $P3 = $P2 / $P4
    $P2 = $P2 / $P4

    say $P2
    say $P3
  .end
CODE
3/14
3/14
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Dividing Floats (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'
    new $P4, 'Float'

    $P4 = 7.

    $P2 = "3/2"
    $P3 = $P2 / $P4
    $P2 = $P2 / $P4

    say $P2
    say $P3
  .end
CODE
3/14
3/14
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Dividing Rationals (+ inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P1, 'Rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "5/2"

    $P1 = $P2 / $P3
    $P2 = $P2 / $P3

    say $P1
    say $P2
  .end
CODE
3/5
3/5
OUTPUT
pir_output_is(<<'CODE', <<'OUTPUT', "Negating (+inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "-3/2"
    $P3 = -$P2
    $P2 = -$P2

    say $P2
    say $P3
  .end
CODE
3/2
3/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Absolute value (+inplace operation)");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "-3/2"
    $P3 = abs $P2
    abs $P2

    say $P2
    say $P3
  .end
CODE
3/2
3/2
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', "Comparing rationals to rationals");
  .sub main :main
    loadlib $P1, 'rational'
    new $P2, 'Rational'
    new $P3, 'Rational'

    $P2 = "3/2"
    $P3 = "6/4"

    if $P2 == $P3 goto EQ
    goto NE
  EQ:
    say "1"
    goto END_EQ
  NE:
    say "0"
  END_EQ:

    $P3 = "7/4"
    cmp $I1, $P2, $P3
    cmp $I2, $P3, $P2

    say $I1
    say $I2
  .end
CODE
1
-1
1
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
