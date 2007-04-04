#!./parrot -G
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/library/string_utils.t  -- Tests for String/Utils.pbc

=head1 SYNOPSIS

    % prove t/library/string_utils.t

=cut

.const string TESTS = '24'

.sub main :main
    load_bytecode 'Test/Builder.pir'

    .local pmc test       # the test harness object.
               test = new 'Test::Builder'

    set_global '$test', test

    test.'plan'(TESTS)

    load_bytecode 'String/Utils.pbc'
    test.'ok'(1, 'loaded String/Utils.pbc')

    $P0 = get_hll_global ['String';'Utils'], 'chomp'
    $I0 = istrue $P0
    test.'ok'($I0, 'loaded chomp')

    $P0 = get_hll_global ['String';'Utils'], 'convert_radix'
    $I0 = istrue $P0
    test.'ok'($I0, 'loaded radix')

    # \x conversions
    test_radix('41'     , 'x', 0, 'A'   , 2, '\x41')
    test_radix('42G'    , 'x', 0, 'B'   , 2, '\x42')
    test_radix('[41]'   , 'x', 0, 'A'   , 4, '\x[41]')
    test_radix('[41,42]', 'x', 0, 'AB'  , 7, '\x[41,42]')
    test_radix('0a'     , 'x', 0, "\n"  , 2, '\x0a')
    test_radix('000a'   , 'x', 0, "\n"  , 4, '\x000a')
    test_radix('ab0aX'  , 'x', 2, "\n"  , 2, 'pos offset')
    test_radix('0A'     , 'x', 0, "\n"  , 2, '\x0a')
    test_radix('000A'   , 'x', 0, "\n"  , 4, '\x000a')
    test_radix('AB0AX'  , 'x', 2, "\n"  , 2, 'pos offset')
    test_radix('[41,42]', 'x', 1, 'A'   , 2, 'pos offset')
    test_radix('[41,42]', 'x', 4, 'B'   , 2, 'pos offset')

    # \o conversions
    test_radix('41'     , 'o', 0, '!'   , 2, '\o41')
    test_radix('428'    , 'o', 0, '"'   , 2, '\o42')
    test_radix('[41]'   , 'o', 0, '!'   , 4, '\o[41]')
    test_radix('[41,42]', 'o', 0, '!"'  , 7, '\o[41,42]')
    test_radix('012'    , 'o', 0, "\n"  , 3, '\o012')
    test_radix('00012'  , 'o', 0, "\n"  , 5, '\o00012')
    test_radix('12012'  , 'o', 2, "\n"  , 3, 'pos offset')
    test_radix('[41,42]', 'o', 1, '!'   , 2, 'pos offset')
    test_radix('[41,42]', 'o', 4, '"'   , 2, 'pos offset')
.end


.sub test_radix
    .param string source
    .param string radix
    .param int pos
    .param string target
    .param int len
    .param string description
    .param string todo         :named('todo') :optional
    .param int has_todo        :opt_flag

    .local pmc convert_radix
    .local string t_target
    .local int t_len, ok_target, ok_len, ok
    convert_radix = get_hll_global ['String';'Utils'], 'convert_radix'
    (t_target, t_len) = convert_radix(source, radix, pos)

    ok_target = iseq t_target, target
    ok_len    = iseq t_len, len
    ok = and ok_target, ok_len

    .local pmc test
    test = get_global '$test'

    if has_todo goto todo_test
    test.'ok'(ok, description)
    .return ()
  todo_test:
    test.'todo'(ok, description, todo)
    .return ()
.end


