#!perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test;

# test for GMP
use Parrot::Config;

=head1 NAME

t/op/arithmetics_pmc.t - Arithmetic Ops involving PMCs

=head1 SYNOPSIS

        % prove t/op/arithmetics_pmc.t

=head1 DESCRIPTION

Test handling C<dest> arg in 3-args arithmetic.

=cut

# We don't check BigInt and BigNum ops
if ( $PConfig{gmp} ) {
    plan tests => 68;
}
else {
    plan tests => 34;
}


# Map vtable method to op
my %methods = qw{
    add             add
    subtract        sub
    multiply        mul
    divide          div

    floor_divide    fdiv
    modulus         mod
    pow             pow

    bitwise_or      bor
    bitwise_and     band
    bitwise_xor     bxor

    bitwise_shr     shr
    bitwise_shl     shl
    bitwise_lsr     lsr

    concatenate     concat

    logical_or      or
    logical_and     and
    logical_xor     xor
};

# XXX Put BigInt and BigNum here 
my @pmcs = qw{
    Integer Float
};

if ($PConfig{gmp}) {
    push @pmcs, qw{ BigInt BigNum};
}

foreach my $pmc (@pmcs) {
    while(my($vtable, $op) = each(%methods)) {

# We should generate more tests for all possible combinations
pir_output_is( <<"CODE", <<OUTPUT, "Original dest is untouched in $pmc.$vtable " );
.sub 'test' :main
    \$P0 = new '$pmc'
    \$P0 = 40
    \$P1 = new '$pmc'
    \$P1 = 2
    \$P2 = new '$pmc'
    \$P2 = 115200

    \$P99 = \$P2
    # ignore exceptions
    push_eh done
    $op \$P2, \$P0, \$P1

    \$I0 = cmp \$P99, 115200
    unless \$I0 goto done
    print " not "
  done:
    say "ok"
.end
CODE
ok
OUTPUT

    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
