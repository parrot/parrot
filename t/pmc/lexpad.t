#! parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/lexpad.t - test LexPad PMC


=head1 SYNOPSIS

    % prove t/pmc/lexpad.t

=head1 DESCRIPTION

Tests the LexPad PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(4)

    new_test()
    test_iter()
.end

.sub new_test
    push_eh eh
    $P0 = new ['LexPad']
    pop_eh
    ok(0, "shouldn't be able to create a LexPad without an initializer")
    goto end
eh:
    ok(1, "can't create a LexPad without an initializer")
end:
.end



.sub 'test_iter'

    .local pmc str1,str2,str3
    .lex 'a', str1
    .lex 'b', str2
    .lex 'c', str3

    str1 = box 'pants'
    str2 = box 'pants'
    str3 = box 'pants'

    .local pmc interp
    interp = getinterp

    .local pmc dlp
    dlp    = interp['lexpad']

    .local pmc iterator
    iterator = iter dlp
iter_loop:
    unless iterator goto iter_done
    .local pmc key
    key = shift iterator
    .local pmc value
    value = dlp[key]
    is(value, 'pants', "Got value from iterator")
    goto iter_loop
iter_done:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
