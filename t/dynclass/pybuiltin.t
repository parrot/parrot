#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/dynclass/pybuiltin.t - Python Builtins

=head1 SYNOPSIS

	% perl -Ilib t/dynclass/pybuiltin.t

=head1 DESCRIPTION

Tests the Python Builtins.

=cut

use Parrot::Test tests => 1;

output_is(<< 'CODE', << 'OUTPUT', "attribute");
##PIR##
.sub main @MAIN
    new_pad 0
    loadlib $P0, "python_group"
    find_global P0, "PyBuiltin", "__load__"
    invoke

    find_type $I0, "PyInt"
    new $P0, $I0
    new $P1, $I0

    set $P0, 31
    set $P1, -13

    find_lex $P2, "abs"
    $P3 = $P2($P1)
    print $P3
    print "\n"

    find_lex $P2, "cmp"
    $P3 = $P2($P0,$P1)
    print $P3
    print "\n"

    find_lex $P2, "float"
    $P3 = $P2($P0)
    print $P3
    print "\n"

    find_lex $P2, "hex"
    $P3 = $P2($P0)
    print $P3
    print "\n"

    find_lex $P2, "int"
    $P3 = $P2($P0)
    print $P3
    print "\n"

    find_lex $P2, "oct"
    $P3 = $P2($P0)
    print $P3
    print "\n"
.end
CODE
13
1
31.0
0x1f
31
037
OUTPUT
