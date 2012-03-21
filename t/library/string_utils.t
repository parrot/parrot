#!./parrot
# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

t/library/string_utils.t

=head1 DESCRIPTION

Tests for String/Utils.pbc

=head1 SYNOPSIS

    % prove t/library/string_utils.t

=cut

.const string TESTS = '29'

.include 'load_bytecode.pir'

.sub main :main
    '__load_bytecode'('Test/Builder.pbc')

    .local pmc test       # the test harness object.
               test = new [ 'Test'; 'Builder' ]

    set_global '$test', test

    test.'plan'(TESTS)

    '__load_bytecode'('String/Utils.pbc')
    test.'ok'(1, 'loaded String/Utils.pbc')

    $P0 = get_hll_global ['String';'Utils'], 'chomp'
    $I0 = istrue $P0
    test.'ok'($I0, 'loaded chomp')

    $P0 = get_hll_global ['String';'Utils'], 'convert_string_to_int'
    $I0 = istrue $P0
    test.'ok'($I0, 'loaded convert_string_to_int')

    test_radix(''       , 'x', 0, 0     , 0, 'null string')
    test_radix('nothing', 'x', 0, 0     , 0, 'no leading digits')

    # \x conversions
    test_radix('41'     , 'x', 0, 65    , 2, 'x41')
    test_radix('42G'    , 'x', 0, 66    , 2, 'x42G')
    test_radix('0a'     , 'x', 0, 10    , 2, 'x0a')
    test_radix('000a'   , 'x', 0, 10    , 4, 'x000a')
    test_radix('abcd'   , 'x', 0, 0xabcd, 4, 'xabcd')
    test_radix('ab0aX'  , 'x', 2, 10    , 2, 'pos offset')
    test_radix('0A'     , 'x', 0, 10    , 2, 'x0A')
    test_radix('000A'   , 'x', 0, 10    , 4, 'x000A')
    test_radix('ABCD'   , 'x', 0, 0xabcd, 4, 'xABCD')
    test_radix('AB0AX'  , 'x', 2, 10    , 2, 'pos offset')

    # \o conversions
    test_radix('41'     , 'o', 0, 33    , 2, 'o41')
    test_radix('42G'    , 'o', 0, 34    , 2, 'o42G')
    test_radix('12'     , 'o', 0, 10    , 2, 'o12')
    test_radix('0012'   , 'o', 0, 10    , 4, 'o0012')
    test_radix('1238'   , 'o', 0, 83    , 3, 'o1238')
    test_radix('1212X'  , 'o', 2, 10    , 2, 'pos offset')

    test_radix_digits('41'        , 'x', 0, 'A' , 2, '\x41')
    test_radix_digits('41XYZ'     , 'x', 0, 'A' , 2, '\x41')
    test_radix_digits('[41,42]'   , 'x', 0, 'AB', 7, '\x[41,42]')
    test_radix_digits('[41,42]XYZ', 'x', 0, 'AB', 7, '\x[41,42]')
    test_radix_digits('[41,42]'   , 'x', 1, 'A' , 2, '\x41')
    test_radix_digits('[41,42]'   , 'x', 4, 'B',  2, '\x42')
    test_radix_digits('2000'      , 'x', 0, utf8:"\u2000", 4, '\x2000')
    test_radix_digits('1680'      , 'x', 0, utf8:"\u1680", 4, '\x1680')
.end


.sub test_radix
    .param string source
    .param string radix
    .param int pos
    .param int target
    .param int len
    .param string description
    .param string todo         :named('todo') :optional
    .param int has_todo        :opt_flag

    .local pmc convert
    convert = get_hll_global ['String';'Utils'], 'convert_string_to_int'

    .local int t_target, t_len, ok_target, ok_len, ok
    (t_target, t_len) = convert(source, radix, pos)

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

.sub test_radix_digits
    .param string source
    .param string radix
    .param int pos
    .param int target
    .param int len
    .param string description
    .param string todo         :named('todo') :optional
    .param int has_todo        :opt_flag

    .local pmc convert
    convert = get_hll_global ['String';'Utils'], 'convert_digits_to_string'

    .local int t_target, t_len, ok_target, ok_len, ok
    (t_target, t_len) = convert(source, radix, pos)

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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
