#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;


=head1 NAME

t/op/random.t - Random numbers

=head1 SYNOPSIS

	% prove t/op/random.t

=head1 DESCRIPTION

Tests random number generation

=cut


output_is(<<'CODE', <<OUT, "generate random int");
    new P0, .Random
    set I0, P0
    print "Called random just fine\n"
    end
CODE
Called random just fine
OUT


## remember to change the number of tests :-)
BEGIN { plan tests => 1; }

