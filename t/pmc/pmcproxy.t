#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/pmc/pmcproxy.t - test the PMCProxy PMC

=head1 SYNOPSIS

    % prove t/pmc/pmcproxy.t

=head1 DESCRIPTION

Tests the PMCProxy PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    new $P0, .PMCProxy
    say 'ok 1 - $P0 = new .PMCProxy'

    $I0 = isa $P0, 'PMCProxy'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'PMCProxy'"
.end
CODE
ok 1 - $P0 = new .PMCProxy
ok 2 - isa $P0, 'PMCProxy'
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
