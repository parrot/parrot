#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/bytebuffer.t - ByteBuffer PMC

=head1 SYNOPSIS

    % prove t/pmc/bytebuffer.t

=head1 DESCRIPTION

Tests C<ByteBuffer> PMC..

=cut

.sub 'main' :main
    .include 'test_more.pir'
    plan(7)

    test_init()
    test_set()
.end

.sub test_init
    .local pmc bb
    .local int n
    bb = new ['ByteBuffer']
    n = elements bb
    is(n, 0, "size of a new buffer is 0")

    bb = new ['ByteBuffer'], 42
    n = elements bb
    is(n, 42, "size of a new buffer with initial size is correct")

.end

.sub test_set
    .local pmc bb
    .local string s
    .local int n, c
    bb = new ['ByteBuffer']
    s = 'Hi'
    bb = s
    n = elements bb
    is(n, 2, "size is the same as the source string bytelength")
    n = bb[0]
    c = ord 'H'
    is(n, c, "first byte is the same as the source string")
    n = bb[1]
    c = ord 'i'
    is(n, c, "second byte is the same as the source string")
    n = bb[2]
    is(n, 0, "byte out of size is 0")
    n = bb[-1]
    is(n, 0, "byte at negative index is 0")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
