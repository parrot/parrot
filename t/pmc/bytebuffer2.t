#!./parrot
# Copyright (C) 2012, Parrot Foundation.

=head1 NAME

t/pmc/bytebuffer2.t - Test ByteBuffer resize behaviour

=head1 SYNOPSIS

    % prove t/pmc/bytebuffer2.t

=head1 DESCRIPTION

This file must be seperate from F<t/pmc/bytebuffer.t> as calling the
function from there does not expose this problem.

=cut

# GH 835
.sub test :main
    .include 'test_more.pir'
    plan(8)

    .local int i

    .local string s1, s2
    s1 = 'ABC'
    s2 = 'DEF'

    .local pmc b_normal, b_resize_normal, b_init_size, b_resize_too_big
    b_normal = new ['ByteBuffer']
    b_resize_normal = new ['ByteBuffer']
    b_init_size = new ['ByteBuffer'],4
    b_resize_too_big = new ['ByteBuffer']

    b_normal = s1
    i = b_normal[0]
    is(i, 65, 'simple init - no problem expected')
    b_normal = s2
    i = b_normal[0]
    is(i, 68, 'reset string with new value')

    b_resize_normal = s1
    i = b_resize_normal[0]
    is(i, 65, 'simple init - no problem expected')

    # oddly also works resize to smaller values like 2,1,0
    b_resize_normal = 3
    b_resize_normal = s2
    i = b_resize_normal[0]
    is(i, 68, 'reset resized normal buff with new string')

    b_init_size[0] = 65
    b_init_size[1] = 66
    b_init_size[2] = 67
    # line below probably not needed but I shouldn't cause problem
    b_init_size[3] = 0

    i = b_init_size[0]
    is(i, 65, 'simple init - no problem expected')

    b_init_size = s2
    i = b_init_size[0]
    is(i, 68, 'reset sized buff with new string GH #835')

    b_resize_too_big = s1
    i = b_resize_too_big[0]
    is(i, 65, 'simple init - no problem expected')

    b_resize_too_big = 5
    b_resize_too_big = s2
    i = b_resize_too_big[0]
    is(i, 68, 'reset resized too big buff with new string GH #835')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
