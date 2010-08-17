#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/string.t - Strings

=head1 SYNOPSIS

    % prove t/pmc/string.t

=head1 DESCRIPTION

Tests the C<String> PMC.

=cut

.sub main :main
    .include 'test_more.pir'

    plan(120)

    set_or_get_strings()
    setting_integers()
    setting_numbers()
    ensure_that_concat_ppp_copies_strings()
    ensure_that_concat_pps_copies_strings()
    test_repeat()
    test_repeat_without_creating_dest_pmc()
    test_repeat_int()
    test_repeat_int_without_declaring_dest()
    test_if_string()
    test_concat()
    test_concat_without_defining_dest()
    test_cmp()
    cmp_with_integer()
    test_substr()
    test_eq_str()
    test_ne_str()
    check_whether_interface_is_done()
    test_clone()
    test_set_px_i()
    test_set_px_s()
    test_string_replace()
    set_i0__p0__string_to_int()
    test_string_trans()
    is_integer__check_integer()
    instantiate_str()
    get_string_returns_cow_string()
    to_int_1()
    elements_gives_length_of_string()
    test_string_reverse_index()
    out_of_bounds_substr_positive_offset()
    out_of_bounds_substr_negative_offset()
    exception_to_int_2()
    exception_to_int_3()
    assign_null_string()
    access_keyed()
    # END_OF_TESTS
.end

.sub set_or_get_strings
        new $P0, ['String']

        set $P0, "foo"
        set $S0, $P0
        is( $S0, "foo", 'String obj set with literal string' )

        set $P0, "\0"
        set $S0, $P0
        is( $S0, "\0", 'String obj set with \0 string' )

        set $P0, ""
        set $S0, $P0
        is( $S0, "", 'String obj set with "" string' )

        set $P0, 123
        set $S0, $P0
        is( $S0, "123", 'String obj set with literal int' )

        set $P0, 1.23456789
        set $S0, $P0
        is( $S0, "1.23456789", 'String obj set with literal floating point' )

        set $P0, "0xFFFFFF"
        set $S0, $P0
        is( $S0, "0xFFFFFF", 'String obj set with literal hex string' )

        null $S0
        set $P0, $S0
        set $S1, $P0
        isnull $I0, $S1
        ok( $I0, 'String obj is null-in null-out' )
.end

.sub setting_integers
        new $P0, ['String']
        set $P0, "1"
        set $I0, $P0
        is( $I0, 1, 'string "1" -> int' )

        new $P0, ['String']
        set $P0, "2.0"
        set $I0, $P0
        is( $I0, 2, 'string "2.0" -> int' )

        new $P0, ['String']
        set $P0, ""
        set $I0, $P0
        is( $I0, 0, 'string "" -> int' )

        new $P0, ['String']
        set $P0, "\0"
        set $I0, $P0
        is( $I0, 0, 'string "\0" -> int' )

        new $P0, ['String']
        set $P0, "foo"
        set $I0, $P0
        is( $I0, 0, 'string "foo" -> int' )
.end

.sub setting_numbers
        .include 'fp_equality.pasm'
        new $P0, ['String']
        set $P0, "1"
        set $N0, $P0
        .fp_eq_ok($N0, 1.0, 'String 1 -> $N0 == 1.0')

        new $P0, ['String']
        set $P0, "2.0"
        set $N0, $P0
        .fp_eq_ok($N0, 2.0, 'String "2.0" -> $N0 == 2.0')

        new $P0, ['String']
        set $P0, ""
        set $N0, $P0
        .fp_eq_ok($N0, 0.0, 'String "" -> $N0 == 0.0')

        new $P0, ['String']
        set $P0, "\0"
        set $N0, $P0
        .fp_eq_ok($N0, 0.0, 'String "\0" -> $N0 == 0.0')

        new $P0, ['String']
        set $P0, "foo"
        set $N0, $P0
        .fp_eq_ok($N0, 0.0, 'String "foo" -> $N0 == 0.0')

        new $P0, ['String']
        set $P0, "1.3e5"
        set $N0, $P0
        .fp_eq_ok($N0, 130000.0, 'String "1.3e5" -> $N0 == 130000.0')
.end

.sub ensure_that_concat_ppp_copies_strings
    new $P0, ['String']
    new $P1, ['String']
    new $P2, ['String']

    set $P0, "foo"
    concat  $P1, $P0, $P0

    is( $P0, 'foo', 'original String is unchanged' )
    is( $P1, 'foofoo', 'concat on String' )

    set $P1, "You can't teach an old dog new..."
    set $P2, "clear physics"
    concat $P0, $P1, $P2

    is( $P1, "You can't teach an old dog new...", 'original String is unchanges' )
    is( $P2, 'clear physics', 'original String is unchanges' )
    is( $P0, "You can't teach an old dog new...clear physics", 'concat on String' )
.end

.sub ensure_that_concat_pps_copies_strings
    new $P0, ['String']
    new $P1, ['String']

    set $S0, "Grunties"
    set $P1, "fnargh"
    concat $P0, $P1, $S0

    is( $S0, 'Grunties', 'original untouched' )
    is( $P1, 'fnargh', 'original untouched' )
    is( $P0, 'fnarghGrunties', 'concat success' )
.end

.sub test_repeat
    new $P0, ['String']
    set $P0, "x"
    new $P1, ['Integer']
    set $P1, 12
    new $P2, ['String']
    repeat $P2, $P0, $P1
    is( $P2, 'xxxxxxxxxxxx', 'Integer arg to repeat' )

    set $P0, "y"
    new $P1, ['Float']
    set $P1, 6.5
    repeat $P2, $P0, $P1
    is( $P2, 'yyyyyy', 'Float arg to repeat' )

    set $P0, "z"
    new $P1, ['String']
    set $P1, "3"
    repeat $P2, $P0, $P1
    is( $P2, 'zzz', 'String "3" arg to repeat' )

    set $P0, "a"
    new $P1, ['Undef']
    repeat $P2, $P0, $P1
    is( $P2, '', 'undef PMC arg to repeat' )
.end

.sub test_repeat_without_creating_dest_pmc
    new $P0, ['String']
    set $P0, "x"
    new $P1, ['Integer']
    set $P1, 12
    repeat $P2, $P0, $P1
    is( $P2, 'xxxxxxxxxxxx', 'Integer argument to repeat' )

    set $P0, "y"
    new $P1, ['Float']
    set $P1, 6.5
    repeat $P3, $P0, $P1
    is( $P3, 'yyyyyy', 'Float arg to repeat' )

    set $P0, "z"
    new $P1, ['String']
    set $P1, "3"
    repeat $P4, $P0, $P1
    is( $P4, 'zzz', 'String "3" arg to repeat' )

    set $P0, "a"
    new $P1, ['Undef']
    repeat $P5, $P0, $P1
    is( $P5, '', 'Undef PMC arg to repeat' )
.end

.sub test_repeat_int
    new $P0, ['String']
    set $P0, "x"
    set $I1, 12
    new $P2, ['String']
    repeat $P2, $P0, $I1
    is( $P2, 'xxxxxxxxxxxx', 'repeat with int arg' )

    set $P0, "za"
    set $I1, 3
    repeat $P2, $P0, $I1
    is( $P2, 'zazaza', 'repeat with int arg' )
.end

.sub test_repeat_int_without_declaring_dest
    new $P0, ['String']
    set $P0, "x"
    set $I1, 12
    repeat $P2, $P0, $I1
    is( $P2, "xxxxxxxxxxxx", 'repeat with int arg' )    # print $P2

    set $P0, "za"
    repeat $P3, $P0, 3
    is( $P3, "zazaza", 'repeat with literal int arg' )    # print $P3
.end


.sub test_if_string
    new $P0, ['String']
    set $S0, "True"
    set $P0, $S0

        set $I0, 1
        if $P0, TRUE
        set $I0, 0
TRUE:   ok( $I0, 'String "String" is true' )

        new $P1, ['String']
        set $S1, ""
        set $P1, $S1
        set $I0, 1
        if $P1, TRUE2
        set $I0, 0
TRUE2:  nok( $I0, 'String "" is false' )

        new $P2, ['String']
        set $S2, "0"
        set $P2, $S2
        set $I0, 1
        if $P2, TRUE3
        set $I0, 0
TRUE3:  nok( $I0, 'String "0" is false' )

        new $P3, ['String']
        set $S3, "0123"
        set $P3, $S3
        set $I0, 1
        if $P3, TRUE4
        set $I0, 0
TRUE4:  ok( $I0, 'String "0123" is true' )

        new $P4, ['String']
        set $I0, 1
        if $P4, TRUE5
        set $I0, 0
TRUE5:  nok( $I0, 'uninitialized String is false' )
.end

.sub test_concat
    new $P0, ['String']
    new $P1, ['Undef']
    set $P0, "foo"
    concat  $P1, $P0, $P0
    is( $P0, "foo", 'original String is untouched' )
    is( $P1, "foofoo", '...and concat worked' )

    new $P0, ['String']
    new $P1, ['Undef']
    set $P0, "bar"
    concat  $P0, $P0, $P1
    is( $P0, "bar", '"bar" + Undef = "bar"' )
    is( $P1, "", '... Undef is ""' )

    new $P0, ['String']
    new $P1, ['Undef']
    set $P1, "str"
    concat  $P1, $P0, $P1
    is( $P0, "", 'original Undef is ""' )
    is( $P1, "str", '"str" + Undef = "str"' )
.end

.sub test_concat_without_defining_dest
    new $P0, ['String']
    set $P0, "foo"
    concat    $P1, $P0, $P0
    is( $P0, "foo", 'original String is unchanged' )
    is( $P1, "foofoo", '... concat String x2' )

    new $P0, ['String']
    set $P0, "foo"
    concat $P2, $P0, "bar"
    is( $P0, "foo", 'original String is unchanged' )
    is( $P2, "foobar", '... concat String and "bar"' )
.end

.sub test_cmp
    new $P1, ['String']
    new $P2, ['String']

    set $P1, "abc"
    set $P2, "abc"
    cmp $I0, $P1, $P2
    is( $I0, "0", 'cmp "abc", "abc" = 0' )

    set $P1, "abcde"
    set $P2, "abc"
    cmp $I0, $P1, $P2
    is( $I0, "1", 'cmp "abcde", "abc" = 1' )

    set $P1, "abc"
    set $P2, "abcde"
    cmp $I0, $P1, $P2
    is( $I0, "-1", 'cmp "abcde", "abc" = -1' )
.end

.sub cmp_with_integer
    new $P1, ['Integer']
    new $P2, ['String']
    set $P2, "10"

    # Int. vs Str.
    set $P1, 10
    cmp $I0, $P1, $P2
    is( $I0, 0, 'cmp 10(Integer PMC), "10"(String PMC) = 0' )

    set $P1, 20
    cmp $I0, $P1, $P2
    is( $I0, 1, 'cmp 20, "10" = 1' )

    set $P1, 0
    cmp $I0, $P1, $P2
    is( $I0, -1, 'cmp 0, "10" = -1' )

    # Str. vs Int.
    set $P1, 0
    cmp $I0, $P2, $P1
    is( $I0, 1, 'cmp "10", 0 = 1' )

    set $P1, 20
    cmp $I0, $P2, $P1
    is( $I0, -1, 'cmp "10", 20 = -1' )

    set $P1, 10
    cmp $I0, $P2, $P1
    is( $I0, 0, 'cmp "10", 10 = 0' )
.end

.sub test_substr
    new $P0, ['String']

    set $P0, "This is a test\n"
    substr $S0, $P0, 0, 5
    substr $S1, $P0, 10, 4
    substr $S2, $P0, -11, 3
    substr $S3, $P0, 7, 1000  # Valid offset, but length > string length
    is( $S0, 'This ',             'first 5 chars' )
    is( $S1, 'test',              '10-14' )
    is( $S2, ' is',               'start from the end' )
    is( $S3, " a test\n",         'valid offset, but length > string length' )
    is( $P0, "This is a test\n",  'original is unmodified' )
.end

.sub test_eq_str
        new $P1, ['String']
        new $P2, ['String']
        set $P1, "ABC"
        set $P2, "ABC"

        set $I0, 1
        eq_str $P2, $P1, OK1
        set $I0, 0
OK1:    ok( $I0, 'eq_str "ABC"(String), "ABC"(String) -> true' )

        set $P2, "abc"
        set $I0, 1
        eq_str $P2, $P1, OK2
        set $I0, 0
OK2:    nok( $I0, 'eq_str "abc"(String), 1(Int) -> false' )

        new $P3, ['Integer']
        set $P3, 0
        set $I0, 1
        eq_str $P2, $P3, OK3
        set $I0, 0
OK3:    nok( $I0, 'eq_str "abc"(String), 0(Integer) -> false' )

        set $I0, 1
        eq_str $P3, $P2, OK4
        set $I0, 0
OK4:    nok( $I0, 'eq_str 0(Integer), "abc"(String) -> false' )
.end

.sub test_ne_str
        new $P1, ['String']
        new $P2, ['String']
        set $P1, "ABC"
        set $P2, "abc"
        set $I0, 1
        ne_str $P2, $P1, OK1
        set $I0, 0
OK1:    ok( $I0, 'ne_str "abc", "ABC" -> true' )

        set $P2, "ABC"
        set $I0, 1
        ne_str $P2, $P1, OK2
        set $I0, 0
OK2:    nok( $I0, 'ne_str "ABC", "ABC" -> false' )

        new $P3, ['Integer']
        set $P3, 0
        set $I0, 1
        ne_str $P2, $P3, OK3
        set $I0, 0
OK3:    ok( $I0, 'ne_str "ABC", 0(Integer) -> true' )

        set $I0, 1
        ne_str $P3, $P2, OK4
        set $I0, 0
OK4:    ok( $I0, 'ne_str "0(Integer), "ABC" -> true' )
.end

.sub check_whether_interface_is_done
    .local pmc pmc1
    pmc1 = new ['String']
    .local int bool1

    does bool1, pmc1, "scalar"
    ok( bool1, 'String does scalar' )

    does bool1, pmc1, "string"
    ok( bool1, 'String does string' )

    does bool1, pmc1, "no_interface"
    nok( bool1, 'String !does no_interface' )
.end

.sub test_clone
    new $P0, ['String']
    set $P0, "Tacitus\n"
    clone $P1, $P0
    set $P0, ""
    is( $P1, "Tacitus\n", 'clone creates a copy' )
.end

.sub test_set_px_i
  new $P0, ['String']
  set $P0, "abcdef\n"
  set $P0[2], 65
  is( $P0, "abAdef\n", 'set p[x] = int' )
.end

.sub test_set_px_s
  new $P0, ['String']
  set $P0, "abcdef\n"
  set $P0[2], "AB"
  is( $P0, "abABef\n", 'set p[x] = string' )
.end

.sub test_string_replace
    $P0 = new ['String']
    $P0 = "hello world"

    is( $P0, "hello world", 'original' )
    $P0."replace"("l", "-")
    is( $P0, "he--o wor-d", 'String."replace" l with -' )
    $P0."replace"("wo", "!!!!")
    is( $P0, "he--o !!!!r-d", 'String."replace" wo with !!!!' )
    $P0."replace"("he-", "")
    is( $P0, "-o !!!!r-d", 'String."replace" he- with ""' )
.end

.sub set_i0__p0__string_to_int
    new $P0, ['String']
    set $P0, "12.3E5\n"
    set $I0, $P0
    is( $I0, 12, '"12.3E4\n" -> $I0 = 12' )
.end

.sub test_string_trans
# tr{wsatugcyrkmbdhvnATUGCYRKMBDHVN}
#            {WSTAACGRYMKVHDBNTAACGRYMKVHDBN};
    .local string s, t
    .local int el

    s = "atugcsATUGCS"
    .const 'Sub' tr_00 = 'tr_00_init'
    el = elements tr_00
    is( el, 256, 'elements' )

    $P0 = new ['String']
    t = $P0.'trans'(s, tr_00)

    is( t, 'TAACGSTAACGS', 'trans' )
    is( s, 'atugcsATUGCS', "trans doesn't touch source string")
.end

# create tr table at compile-time
.sub tr_00_init :immediate
    .local pmc tr_array
    tr_array = new ['FixedIntegerArray']   # Todo char array
    tr_array = 256                      # Python compat ;)
    .local string from, to
    from = 'wsatugcyrkmbdhvnATUGCYRKMBDHVN'
    to   = 'WSTAACGRYMKVHDBNTAACGRYMKVHDBN'
    .local int i, ch, r, len
    len = length from
    null i
loop:
    ch = ord from, i
    r  = ord to,   i
    tr_array[ch] = r
    inc i
    if i < len goto loop
    .return(tr_array)
.end

.sub is_integer__check_integer
  $P0 = new ['String']

  $I0 = $P0.'is_integer'('543')
  ok( $I0, 'String."is_integer("543")' )

  $I0 = $P0.'is_integer'('4.3')
  nok( $I0, '... 4.3' )

  $I0 = $P0.'is_integer'('foo')
  nok( $I0, '... foo' )

  $I0 = $P0.'is_integer'('-1')
  ok( $I0, '... -1' )

  $I0 = $P0.'is_integer'('+-1')
  nok( $I0, '... +-1' )

  $I0 = $P0.'is_integer'('+1')
  ok( $I0, '... +1' )
.end

.sub instantiate_str
    .const 'String' ok = "ok"
    is( ok, "ok", ".const 'String'" )
.end

.sub get_string_returns_cow_string
  $P0 = new ['String']
  $P0 = "Foo44"

  $S0 = $P0
  $S0 = replace $S0, 0, 1, "B"
  is( $S0, "Boo44", 'substr replace' )
  is( $P0, "Foo44", '... no change to original' )
.end

.sub to_int_1
    .local pmc s
    s = new ['String']
    s = "123"
    $I0 = s.'to_int'(10)
    is( $I0, "123", 'String.to_int(10)' )
    s = "2a"
    $I0 = s.'to_int'(16)
    is( $I0, "42", '... 16' )
    s = "1001"
    $I0 = s.'to_int'(2)
    is( $I0, "9", '... 2' )
.end

.sub elements_gives_length_of_string
    .local pmc s
    s = new ['String']
    s = "123456789"
    $I0 = elements s
    is( $I0, "9", 'elements gives length of string' )
.end

.sub test_string_reverse_index
  $P0 = new ['String']
  $I0 = $P0.'reverse_index'('hello', 0)
  is( $I0, -1, "main empty -1" )

  $P0 = "Hello world"
  $I0 = $P0.'reverse_index'('', 0)
  is( $I0, -1, "search empty -1" )

  $I0 = $P0.'reverse_index'('o', -1)
  is( $I0, -1, "negative start -1" )

  $I0 = $P0.'reverse_index'('o', 999)
  is( $I0, -1, "far far away -1" )

  $I0 = $P0.'reverse_index'('l', 0)
  is( $I0, 9, "search1 9" )

  $I0 = $P0.'reverse_index'('l', 8)
  is( $I0, 3, "search2 3" )
.end

.macro exception_is ( M )
    .local pmc exception
    .local string message
    .get_results (exception)

    message = exception['message']
    is( message, .M, .M )
.endm

.sub out_of_bounds_substr_positive_offset
    new $P0, ['String']
    set $P0, "Woburn"

    set $I0, 0
    push_eh handler
        substr $S0, $P0, 123, 22
handler:
    .exception_is( 'Cannot take substr outside string' )
.end

.sub out_of_bounds_substr_negative_offset
    new $P0, ['String']
    set $P0, "Woburn"
    push_eh handler
        substr $S0, $P0, -123, 22
handler:
    .exception_is( 'Cannot take substr outside string' )
.end

.sub exception_to_int_2
    .local pmc s
    s = new ['String']
    s = "123"
    push_eh handler
        $I0 = s.'to_int'(3)
handler:
    .exception_is( 'invalid conversion to int - bad char 3' )
.end

.sub exception_to_int_3
    .local pmc s
    s = new ['String']
    s = "123"
    push_eh handler
        $I0 = s.'to_int'(37)
handler:
    .exception_is( 'invalid conversion to int - bad base 37' )
.end

.sub assign_null_string
    .local pmc s
    .local string m
    s = new ['String']
    null m
    assign s, m
    m = 'Any other thing'
    m = s
    $I0 = 0
    if null m goto check
    inc $I0
check:
    is( $I0, 0, 'assign null string, TT #729' )
.end

.sub access_keyed
    .local pmc s
    s = new ['String']
    s = "BAR" # Second character is zero, not 'o'

    # Get
    $S0 = s[0]
    is($S0, 'B', 'Get string by index')

    $I0 = s[1]
    $I1 = ord 'A'
    is($I0, $I1, 'Get integer by index')

    $P0 = s[2]
    is($P0, 'R', 'Get PMC by index')

    # Set
    s = new ['String']
    s = ''

    $S0 = 'f'
    s[0] = $S0
    is(s, 'f', 'Set string keyed')

    $I0 = ord 'o'
    s[1] = $I0
    is(s, 'fo', 'Set integer keyed')

    $P0 = new ['String']
    $P0 = 'o'
    s[2] = $P0
    is(s, 'foo', 'Set PMC keyed')

    push_eh null_replace
    s = new ['String']
    s[0] = 'f'
    nok('Replace on null string throws')
    goto done_null_replace

  null_replace:
    ok(1, 'Replace on null string throws')
  done_null_replace:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
