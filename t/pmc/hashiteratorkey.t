#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/pmc/hashiteratorkey.t - HashIteratorKey PMC

=head1 SYNOPSIS

    % prove t/pmc/hashiteratorkey.t

=head1 DESCRIPTION

Do almost nothing test. HashIteratorKey is supplementary class for
iterating over Hash. Just check that we create it.

=cut

.sub 'main' :main
    .include 'test_more.pir'

    plan(6)

    'test_new'()
    'test_key_value'()
    'test_empty'()

.end


.sub 'test_new'
    $P0 = new ['HashIteratorKey']
    ok(1, "Can create HashIteratorKey directly")
.end


.sub 'test_key_value'
    $P0 = new ['Hash']
    $P0['foo'] = 'bar'
    $P1 = iter $P0
    $P2 = shift $P1
    $S0 = $P2.'key'()
    is($S0, 'foo', 'HashIteratorKey.key works')
    $S0 = $P2.'value'()
    is($S0, 'bar', 'HashIteratorKey.value works')
.end


.sub 'test_empty'
    .local pmc hik, p
    .local int i
    .local string s
    hik = new ['HashIteratorKey']

    # De facto behavior tested for code coverage

    p = hik.'key'()
    i = isnull p
    is(i, 1, 'HIK.key gives null when unitialized')

    s = hik
    is(s, '', 'HIK gives empty string when unitialized')

    # Magic value?
    i = hik
    is(i, -1, 'HIK get_integer gives -1')
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
