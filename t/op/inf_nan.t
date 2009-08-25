#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 30;

=head1 NAME

t/op/inf_nan.t - Test math properties of Inf and NaN

=head1 SYNOPSIS

    % prove t/op/inf_nan.t

=head1 DESCRIPTION

Tests for mathematical operations with Inf and Nan.

=cut

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - basic arith" );
.sub 'test' :main
    $N0 = 'Inf'
    say $N0
    $N0 -= $N0
    say $N0
    $N0 *= -1
    say $N0
    $N0 *= 0
    say $N0
    $N0 += 5
    say $N0
    $N0 -= 42
    say $N0
    inc $N0
    say $N0
    dec $N0
    say $N0
    $N2 = abs $N0
    say $N2
    $N1 = 'Inf'
    $N3 = abs $N1
    say $N3
    $N1 = '-Inf'
    $N3 = abs $N1
    say $N3
.end
CODE
Inf
NaN
NaN
NaN
NaN
NaN
NaN
NaN
NaN
Inf
Inf
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - exp" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = exp $N0
    say $N1
    $N0 = '-Inf'
    $N1 = exp $N0
    say $N1
    $N0 = 'NaN'
    $N1 = exp $N0
    say $N1
.end
CODE
Inf
0
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - sqrt" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 =  $N0
    say $N1
    $N0 = '-Inf'
    $N1 = sqrt $N0
    say $N1
    $N0 = 'NaN'
    $N1 = sqrt $N0
    say $N1
    $N0 = -1
    $N1 = sqrt $N0
    say $N1
.end
CODE
Inf
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - sin" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = sin $N0
    say $N1
    $N0 = '-Inf'
    $N1 = sin $N0
    say $N1
    $N0 = 'NaN'
    $N1 = sin $N0
    say $N1
.end
CODE
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - sinh" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = sinh $N0
    say $N1
    $N0 = '-Inf'
    $N1 = sinh $N0
    say $N1
    $N0 = 'NaN'
    $N1 = sinh $N0
    say $N1
.end
CODE
Inf
-Inf
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - asin" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = asin $N0
    say $N1
    $N0 = '-Inf'
    $N1 = asin $N0
    say $N1
    $N0 = 'NaN'
    $N1 = asin $N0
    say $N1
    $N0 = '-2'
    $N1 = asin $N0
    say $N1
    $N0 = '2'
    $N1 = asin $N0
    say $N1
.end
CODE
NaN
NaN
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - cos" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = cos $N0
    say $N1
    $N0 = '-Inf'
    $N1 = cos $N0
    say $N1
    $N0 = 'NaN'
    $N1 = cos $N0
    say $N1
.end
CODE
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - cosh" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = cosh $N0
    say $N1
    $N0 = '-Inf'
    $N1 = cosh $N0
    say $N1
    $N0 = 'NaN'
    $N1 = cosh $N0
    say $N1
.end
CODE
Inf
Inf
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - acos" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = acos $N0
    say $N1
    $N0 = '-Inf'
    $N1 = acos $N0
    say $N1
    $N0 = 'NaN'
    $N1 = acos $N0
    say $N1
    $N0 = '-2'
    $N1 = acos $N0
    say $N1
    $N0 = '2'
    $N1 = acos $N0
    say $N1
.end
CODE
NaN
NaN
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - tan" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = tan $N0
    say $N1
    $N0 = '-Inf'
    $N1 = tan $N0
    say $N1
    $N0 = 'NaN'
    $N1 = tan $N0
    say $N1
.end
CODE
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - tanh" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = tanh $N0
    say $N1
    $N0 = '-Inf'
    $N1 = tanh $N0
    say $N1
    $N0 = 'NaN'
    $N1 = tanh $N0
    say $N1
.end
CODE
1
-1
NaN
OUTPUT

pir_output_like( <<'CODE',qr/^1.5707963.*^-1.5707963.*^NaN/ms,"Inf/NaN - atan" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = atan $N0
    say $N1
    $N0 = '-Inf'
    $N1 = atan $N0
    say $N1
    $N0 = 'NaN'
    $N1 = atan $N0
    say $N1
.end
CODE

{
local $TODO = 'cot/coth/acot not implemented for real numbers';
pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - cot" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = cot $N0
    say $N1
    $N0 = '-Inf'
    $N1 = cot $N0
    say $N1
    $N0 = 'NaN'
    $N1 = cot $N0
    say $N1
.end
CODE
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - coth" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = coth $N0
    say $N1
    $N0 = '-Inf'
    $N1 = coth $N0
    say $N1
    $N0 = 'NaN'
    $N1 = coth $N0
    say $N1
.end
CODE
1
-1
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - acot" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = acot $N0
    say $N1
    $N0 = '-Inf'
    $N1 = acot $N0
    say $N1
    $N0 = 'NaN'
    $N1 = acot $N0
    say $N1
    $N0 = '-2'
    $N1 = acot $N0
    say $N1
    $N0 = '2'
    $N1 = acot $N0
    say $N1
.end
CODE
NaN
NaN
NaN
NaN
NaN
OUTPUT
}

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - sec" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = sec $N0
    say $N1
    $N0 = '-Inf'
    $N1 = sec $N0
    say $N1
    $N0 = 'NaN'
    $N1 = sec $N0
    say $N1
.end
CODE
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - sech" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = sech $N0
    say $N1
    $N0 = '-Inf'
    $N1 = sech $N0
    say $N1
    $N0 = 'NaN'
    $N1 = sech $N0
    say $N1
.end
CODE
0
0
NaN
OUTPUT

pir_output_like( <<'CODE',qr/^1.5707963.*^1.5707963.*^NaN/ms,"Inf/NaN - asec" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = asec $N0
    say $N1
    $N0 = '-Inf'
    $N1 = asec $N0
    say $N1
    $N0 = 'NaN'
    $N1 = asec $N0
    say $N1
.end
CODE


pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - ln" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = ln $N0
    say $N1
    $N0 = '-Inf'
    $N1 = ln $N0
    say $N1
    $N0 = 'NaN'
    $N1 = ln $N0
    say $N1
.end
CODE
Inf
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - log10" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = log10 $N0
    say $N1
    $N0 = '-Inf'
    $N1 = log10 $N0
    say $N1
    $N0 = 'NaN'
    $N1 = log10 $N0
    say $N1
.end
CODE
Inf
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - log2" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = log2 $N0
    say $N1
    $N0 = '-Inf'
    $N1 = log2 $N0
    say $N1
    $N0 = 'NaN'
    $N1 = log2 $N0
    say $N1
.end
CODE
Inf
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - neg" );
.sub 'test' :main
    $N0 = 'Inf'
    $N1 = neg $N0
    say $N1
    $N0 = '-Inf'
    $N1 = neg $N0
    say $N1
    $N0 = 'NaN'
    $N1 = neg $N0
    say $N1
.end
CODE
-Inf
Inf
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - pow" );
.sub 'test' :main
    $N0 = 'Inf'
    pow $N1, $N0, 2
    say $N1
    pow $N1, 2, $N0
    say $N1
    $N0 = 'NaN'
    pow $N1, $N0, 2
    say $N1
    pow $N1, 2, $N0
    say $N1
.end
CODE
Inf
Inf
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Mixing NaN and Inf should give NaN" );
.sub 'test' :main
    $N0 = 'NaN'
    $N1 = 'Inf'
    $N0 *= $N1
    say $N0
    $N0 /= $N1
    say $N0
    $N0 -= $N1
    say $N0
    $N0 += $N1
    say $N0
.end
CODE
NaN
NaN
NaN
NaN
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "Inf/NaN - rounding" );
.sub 'test' :main
    $N0 = 'NaN'
    $N1 = floor $N0
    say $N1
    $N2 = ceil $N0
    say $N2
    $N0 = 'Inf'
    $N1 = floor $N0
    say $N1
    $N2 = ceil $N0
    say $N2
    $N0 = '-Inf'
    $N1 = floor $N0
    say $N1
    $N2 = ceil $N0
    say $N2
.end
CODE
NaN
NaN
Inf
Inf
-Inf
-Inf
OUTPUT

TODO: {

local $TODO = 'rounding nan/inf gives something like -2147483648';
pir_output_is(<<'CODE',<<OUTPUT, "TT #370 Rounding inf/nan");
.sub 'main'
        $N0 = 'Inf'
        $I0 = floor $N0
        say $I0
        $N0 = 'NaN'
        $I0 = floor $N0
        say $I0
        $N0 = 'Inf'
        $I0 = ceil $N0
        say $I0
        $N0 = 'NaN'
        $I0 = ceil $N0
        say $I0
    .end
CODE
Inf
NaN
Inf
NaN
OUTPUT

}

TODO: {
local $TODO = '1+i + NaN should be NaN';
pir_output_is(<<'CODE',<<OUTPUT,"Adding NaN to a Complex");
.sub main
    $P1 = new ["Complex"]
    $N0 = 'NaN'
    set $P1, "1 + i"
    $P1 += $N0
    say $P1
.end
CODE
NaN
OUTPUT
}

{
local $TODO = 'fdiv does not play nicely with PMCs and NaN';
pir_output_is(<<'CODE',<<OUTPUT,'fdiv with Integer PMCs and NaN');
.sub main
    $P1 = new "Integer"
    $P2 = new "Integer"
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    say $P1
.end
CODE
NaN
OUTPUT

pir_output_is(<<'CODE',<<OUTPUT,'fdiv with Float PMCs and NaN');
.sub main
    $P1 = new 'Float'
    $P2 = new 'Float'
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    say $P1
.end
CODE
NaN
OUTPUT

pir_output_is(<<'CODE',<<OUTPUT,'fdiv with Float and Integer PMCs and NaN');
.sub main
    $P1 = new 'Float'
    $P2 = new 'Integer'
    $P2 = 1
    $N0 = 'NaN'
    fdiv $P1, $P2, $N0
    say $P1
.end
CODE
NaN
OUTPUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

