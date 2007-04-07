#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 1;

=head1 NAME

t/oo/ops.t - test OO related ops

=head1 SYNOPSIS

    % prove t/oo/ops.t

=head1 DESCRIPTION

Tests opcodes related to the OO implementation.

=cut

pir_output_is( <<'CODE', <<'OUT', 'addrole' );
.sub 'test' :main
    $P0 = new 'Role'
    $P1 = new 'Class'
    addrole $P1, $P0
    print "ok 1 - addrole op executed\n"

    $P2 = $P1.roles()
    $I0 = elements $P2
    if $I0 == 1 goto ok_2
    print "not "
ok_2:
    print "ok 2 - addrole op actually added the role\n"
.end
CODE
ok 1 - addrole op executed
ok 2 - addrole op actually added the role
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
