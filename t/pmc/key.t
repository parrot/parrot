#! parrot
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/key.t - Keys

=head1 SYNOPSIS

    % prove t/pmc/key.t

=head1 DESCRIPTION

Tests the C<Key> PMC.

=cut

.sub main :main
    .include 'include/test_more.pir'

    plan(6)

    traverse_key_chain()
    extract_int_from_string_keys()
    extract_string_from_int_keys()
.end

.sub traverse_key_chain
    .local string result
    result = ''

    new P0, 'Key'
    set P0, "1"
    new P1, 'Key'
    set P1, "2"
    push P0, P1
    new P2, 'Key'
    set P2, "3"
    push P1, P2

    set P4, P0
l1:
    defined I0, P0
    unless I0, e1
    S0 = P0
    result .= S0
    shift P0, P0
    branch l1
e1:
    is( result, '123', 'traverse key chain' )

    result = ''
    set P0, P4
l2:
    defined I0, P0
    unless I0, e2
    S0 = P0
    result .= S0
    shift P0, P0
    branch l2
e2:
    is( result, '123', 'traverse second key chain' )
.end

.sub extract_int_from_string_keys
    new P0, 'ResizableStringArray'
    push P0, 'ok1'
    push P0, 'ok2'
    set S0, 0
    set P1, P0[S0]
    is( P1, 'ok1', 'retrieve key is number as string' )
    set P1, P0["1"]
    is( P1, 'ok2', 'retrieved key is number as str const' )
.end

.sub extract_string_from_int_keys
    new P0, 'Hash'
    set P0['1'], 'ok1'
    set P0['2'], 'ok2'
    set I0, 1
    set P1, P0[I0]
    is( P1, 'ok1', 'retrieve key is int, set key was str const' )
    set P1, P0[2]
    is( P1, 'ok2', 'retrieve key is const int, set key was str const' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
