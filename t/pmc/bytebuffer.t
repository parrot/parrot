#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id:  $

=head1 NAME

t/pmc/bytebuffer.t - ByteBuffer PMC

=head1 SYNOPSIS

    % prove t/pmc/bytebuffer.t

=head1 DESCRIPTION

Tests C<ByteBuffer> PMC..

=cut

.sub 'main' :main
    .include 'test_more.pir'
    plan(2)

    test_init()
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
