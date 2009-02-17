#!perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 2;

=head1 NAME

t/pmc/default.t - test default PMC


=head1 SYNOPSIS

    % prove t/pmc/default.t

=head1 DESCRIPTION

Tests the default PMC.

=cut

pir_output_is( <<'CODE', <<'OUT', 'new', todo => 'not implemeted' );
.sub 'test' :main
    new P0, ['default']
    print "ok 1\n"
.end
CODE
ok 1
OUT

pir_output_is( <<'CODE', <<'OUT', 'inspect vtable function');
.sub 'test' :main
    $P0 = new ['String']
    $P1 = inspect $P0, 'flags'
    $I9 = 1 << 9   # PObj_is_PMC_FLAG
    $I29 = 1 << 29 # PObj_is_class_FLAG

    $I0 = $P1
    $I1 = $I0 & $I9

    if $I1 goto ok_1
      print "not "
    ok_1:
    print "ok 1\n"

    $I1 = $I0 & $I29
    unless $I1 goto ok_2
      print "not "
    ok_2:
    print "ok 2\n"
.end
CODE
ok 1
ok 2
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
