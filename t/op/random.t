#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/random.t - Random numbers

=head1 SYNOPSIS

	% perl -Ilib t/op/random.t

=head1 DESCRIPTION

Tests random number generation

=cut

use Parrot::Test tests => 1;
use Test::More;
use Parrot::Config;
use Config;

output_is(<<'CODE', <<OUT, "generate random int");
    new P0, .Random
    set I0, P0
    print "Called random just fine\n"
    end
CODE
Called random just fine
OUT
