#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/object.t - test the Object PMC

=head1 SYNOPSIS

    % prove t/pmc/object.t

=head1 DESCRIPTION

Tests the Object PMC.

=cut


# L<PDD15/Object PMC API>
# TODO fix smartlinks once this is specced
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    $P0 = new .Object
    say 'ok 1 - $P0 = new .Object'

    $I0 = isa $P0, 'Object'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'Object'"
.end
CODE
ok 1 - $P0 = new .Object
ok 2 - isa $P0, 'Object'
OUT


## TODO add more tests as this is documented and implemented


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
