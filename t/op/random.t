#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/random.t - Random numbers

=head1 SYNOPSIS

	% perl t/op/random.t

=head1 DESCRIPTION

Tests random number generation

=cut

use Parrot::Test tests => 5;
use Test::More;
use Parrot::Config;
use Config;

output_is(<<'CODE', <<OUT, "generate random int");
    rand I0
    print "Called random just fine\n"
    end
CODE
Called random just fine
OUT

output_is(<<'CODE', <<OUT, "generate random 10>int>=0");
    rand I0, 10
    ge I0, 10, BROKE
    lt I0, 0, BROKE
    print "Called random just fine\n"
    exit 0
  BROKE:
    print "Failure: random number "
    print I0
    print " is not in range 0..9\n"
  end
CODE
Called random just fine
OUT

output_is(<<'CODE', <<OUT, "generate random num");
    rand N0
    print "Called random just fine\n"
    end
CODE
Called random just fine
OUT

output_is(<<'CODE', <<OUT, "generate random 10>num>=0");
    rand N0, 10.0
    ge N0, 10.0, BROKE
    lt N0, 0, BROKE
    print "Called random just fine\n"
    exit 0
  BROKE:
    print "Failure: random number "
    print N0
    print " is not in range 0.0..<10.0\n"
    end
CODE
Called random just fine
OUT

output_is(<<'CODE', <<OUT, "Seed RNG");
    srand 1
    print "Seeded the rng just fine\n"
    end
CODE
Seeded the rng just fine
OUT

1; # HONK
