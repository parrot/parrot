#! parrot
# Copyright (C) 2001-2009, The Perl Foundation.
# $Id$

=head1 NAME

t/library/data_escape.t - Data::Escape tests

=head1 SYNOPSIS

    % prove t/library/data_escape.t

=cut

.sub main :main
    .include 'test_more.pir'
    plan(22)

    DE_load_bytecode()
    DE_get_global()
    DE_escape_string_empty_string()
    DE_escape_string_no_escapes()
    DE_escape_string_tab_carriage_return_linefeed()
    DE_escape_string_other_characters_less_than_32()
    DE_escape_string_single_quote()
    DE_escape_string_double_quote()
    DE_escape_string_single_and_double_escape_single()
    DE_escape_string_single_and_double_escape_double()
    DE_escape_string_backslash()
    DE_escape_string_unprintable_followed_by_numbers()
    DE_escape_string_non_ascii()
    DE_escape_string_freeze_a_simple_pmc()
    DE_unicode_test()
.end

.sub DE_load_bytecode
    load_bytecode 'Data/Escape.pir'
    ok(1, 'load_bytecode')
.end

.sub DE_get_global
    .local pmc sub_list, sub_obj
    .local string test_message

    $S0 = 'String'
    sub_list = split ' ', $S0

  LOOP:
    $I0 = elements sub_list
    if $I0 == 0 goto END_TEST
    $S0 = sub_list.'shift'()
    test_message = concat "get_global ['Data::Escape'], '", $S0
    test_message = concat test_message, "'"
    sub_obj = get_global ['Data::Escape'], $S0
    ok(1, test_message)

  END_TEST:
.end

.sub DE_escape_string_empty_string
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = ""
    str = escape_string( str, '"' )
    is(str, '', 'escape_string: empty string')
.end

.sub DE_escape_string_no_escapes
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = "abc 123"
    str = escape_string( str, '"' )
    is(str, 'abc 123', 'escape_string: no escapes')
.end

.sub DE_escape_string_tab_carriage_return_linefeed
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = "a\tb\nc"
    str = escape_string( str, '"' )
    is(str, 'a\tb\nc', 'escape_string: tab, carriage return, linefeed')
.end

.sub DE_escape_string_other_characters_less_than_32
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str, x

    .local int index
    index = 0
    str = ''

  LOOP:
    if index >= 32 goto DONE

    x = chr index
    concat str, x

    inc index
    branch LOOP

  DONE:
    str = escape_string( str, "'" )
    is(str, '\000\001\002\003\004\005\006\007\010\t\n\013\014\015\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037', 'escape_string: other characters less than 32')
.end

.sub DE_escape_string_single_quote
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = "a'b'c"
    str = escape_string( str, "'" )
    is(str, "a\\'b\\'c", 'escape_string: single quote')
.end

.sub DE_escape_string_double_quote
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = 'a"b"c'
    str = escape_string( str, '"' )
    is(str, 'a\"b\"c', 'escape_string: double quote')
.end

.sub DE_escape_string_single_and_double_escape_single
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = "ab\"'\"'c"
    str = escape_string( str, "'" )
    is(str, "ab\"\\'\"\\'c",'escape_string: single and double, escape single')
.end

.sub DE_escape_string_single_and_double_escape_double
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = "ab\"'\"'c"
    str = escape_string( str, '"' )
    is(str, "ab\\\"'\\\"'c", 'escape_string: single and double, escape double')
.end

.sub DE_escape_string_backslash
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = '\ abc \t'
    str = escape_string( str, '"' )
    is(str, '\\ abc \\t', 'escape_string: backslash')
.end

.sub DE_escape_string_unprintable_followed_by_numbers
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local string str
    str = chr 2
    concat str, '123'
    str = escape_string( str, '"' )
    is(str, '\002123', 'escape_string: unprintable followed by numbers')
.end

.sub DE_escape_string_non_ascii
    todo(0, 'escape_string: non-ascii', 'test not written')
.end

.sub DE_escape_string_freeze_a_simple_pmc
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local pmc original_pmc
    original_pmc = new 'String'
    original_pmc = "ok\n"

    .local string frozen_pmc
    frozen_pmc = freeze original_pmc

    .local string escaped_frozen_pmc
    escaped_frozen_pmc = escape_string( frozen_pmc, '"' )

    .local string pir_code
    pir_code = ".sub test :anon\n$P1 = thaw binary:\""

    pir_code .= escaped_frozen_pmc
    pir_code .= "\"\n.return($P1)\n.e"
    # split sub ending to play nice with some editors
    pir_code .= "nd\n"

    .local pmc pir_compiler
    pir_compiler = compreg "PIR"

    .local pmc compiled_sub
    compiled_sub = pir_compiler(pir_code)
    $P0 = compiled_sub()
    is($P0, "ok\n", 'escape_string: freeze a simple pmc')
.end

.sub _unicode_gen
    .param string codepoint

    .local string pir_code
    pir_code  = ".sub ugen :anon\n$S0 = unicode:\"\\u"
    pir_code .= codepoint
    pir_code .= "\"\n.return($S0)\n.e"
    # split sub ending to play nice with some editors
    pir_code .= "nd\n"

    .local pmc pir_compiler, compiled_sub
    pir_compiler = compreg "PIR"
    compiled_sub = pir_compiler(pir_code)
    .tailcall compiled_sub()
.end

.sub DE_unicode_test
    .local pmc escape_string
    escape_string = get_global ['Data::Escape'], 'String'

    .local pmc codepoint_list
    $S0 = '0666 0777 0888 0999 6666 7777 8888 9999'
    codepoint_list = split ' ', $S0

    .local string s_codepoint, i_codepoint
    .local string str, expected, test_message

  LOOP:
    $I0 = elements codepoint_list
    if $I0 == 0 goto TEST_END
    s_codepoint = codepoint_list.'shift'()
    $I1 = s_codepoint
    i_codepoint = $I1

    expected  = concat "\\x{", i_codepoint
    expected .= "}"
    test_message  = concat "escape_string: unicode: ", s_codepoint
    str = _unicode_gen(s_codepoint)

    str = escape_string( str, '"' )
    is(str, expected, test_message)
    goto LOOP

  TEST_END:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
