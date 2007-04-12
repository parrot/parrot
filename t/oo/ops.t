#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/oo/ops.t - test OO related ops

=head1 SYNOPSIS

    % prove t/oo/ops.t

=head1 DESCRIPTION

Tests opcodes related to the OO implementation.

=cut

pir_output_is( <<'CODE', <<'OUT', 'addrole_p_p' );
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

pir_output_is( <<'CODE', <<'OUT', 'inspect_p_p', todo => 'inspect vtable method for class broke' );
.sub 'test' :main
    $P0 = new 'Class'

    $P1 = inspect $P0
    print "ok 1 - inspect_p_p op executed\n"
    
    $I0 = elements $P1
    if $I0 == 6 goto ok_2
    print "not "
ok_2:
    print "ok 2 - returned hash had correct number of elements\n"
.end
CODE
ok 1 - inspect_p_p op executed
ok 2 - returned hash had correct number of elements
OUT

pir_output_is( <<'CODE', <<'OUT', 'inspect_p_p_s' );
.sub 'test' :main
    $P0 = new 'Class'
    $P0.name('foo')
    $P0.add_attribute('a')

    $P1 = inspect $P0, 'name'
    say $P1
    print "ok 1 - inspect_p_p_s with $3='name'\n"
    
    $P1 = inspect $P0, 'attributes'
    $I0 = elements $P1
    if $I0 == 1 goto ok_2
    print "not "
ok_2:
    print "ok 2 - inspect_p_p_s with $3='attributes'\n"
.end
CODE
foo
ok 1 - inspect_p_p_s with $3='name'
ok 2 - inspect_p_p_s with $3='attributes'
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
