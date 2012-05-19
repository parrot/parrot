#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.

=head1 NAME

t/pmc/lexpad.t - test LexPad PMC


=head1 SYNOPSIS

    % prove t/pmc/lexpad.t

=head1 DESCRIPTION

Tests the LexPad PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(17)

    new_test()
    test_keyed()
    test_keyed_empty()
    test_iter()
    test_iter2()
    test_register_type()
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

.sub test_keyed
    .local pmc p1
    .lex 'p1', p1

    $P0 = getinterp
    $P0 = $P0['lexpad']
    $I0 = elements $P0
    is($I0, 1, "get LexPad elements")

    $I0 = exists $P0['p1']
    is($I0, 1, ".lex exists_keyed true")

    $I0 = exists $P0['nosuchlex']
    is($I0, 0, ".lex exists_keyed false")

    $P1 = new 'Integer'
    push_eh eh
    $P0['nosuchlex'] = $P1
    ok(0, "setting a non existent .lex should throw")
    goto end
eh:
    pop_eh
    ok(1, "setting a non existent .lex throws")
end:
.end

.sub test_keyed_empty
    .local pmc info, pad, lex
    info = new ['LexInfo']
    pad = new ['LexPad'], info
    lex = pad['nosuchlex']
    $I0 = isnull lex
    ok($I0, 'get an item from empty lexpad gives null')
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

.sub 'test_iter2'
    .lex '$a', $P99
    $P99 = box 54321

    .local pmc lexpad, lexiter
    $P0 = getinterp
    lexpad = $P0['lexpad']

    lexiter = iter lexpad
  loop:
    unless lexiter goto done
    .local pmc item, key, value
    item = shift lexiter
    key = item.'key'()
    value = item.'value'()
    is (key, '$a', 'got lex name')
    is (value, 54321, 'got lex value')
    $P0 = lexpad[key]
    is ($P0, 54321, 'got lex value the other way')
    goto loop
  done:
.end


.sub 'test_register_type'
    .local int i
    .local num n, type
    .local string s
    .local pmc pad, p

    .lex 'I', i
    .lex 'N', n
    .lex 'S', s
    .lex 'P', p

    pad = getinterp
    pad = pad['lexpad']

    type = pad.'register_type'('?')
    is(type, -1, 'type for non-existant lexical')
    type = pad.'register_type'('I')
    is(type,  0, 'type for integer lexical')
    type = pad.'register_type'('N')
    is(type,  1, 'type for num lexical')
    type = pad.'register_type'('S')
    is(type,  2, 'type for string lexical')
    type = pad.'register_type'('P')
    is(type,  3, 'type for PMC lexical')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
