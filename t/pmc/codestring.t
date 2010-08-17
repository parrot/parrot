#!./parrot
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/codestring.t - test the CodeString class


=head1 SYNOPSIS

    % prove t/pmc/codestring.t

=head1 DESCRIPTION

Tests the CodeString class directly.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(38)

    create_codestring()
    calls_to_unique()
    basic_emit()
    emit_with_pos_args()
    emit_with_percent_args()
    emit_with_named_args()
    emit_with_pos_and_named_args()
    output_global_unique_num()
    namespace_keys()
    first_char_repl_regression()
    ord_from_name()
    lineof_tests()
.end

.sub create_codestring
    .local pmc code
    .local string s
    code = new ['CodeString']
    code = 'ok'
    s = code
    is(s, "ok", "code string creation succeeded")
.end

.sub calls_to_unique
    .local pmc code
    .local string s
    code = new ['CodeString']
    $P1 = code.'unique'('ok ')
    s = $P1
    is(s, "ok 10", "call to unique with name")
    $P1 = code.'unique'()
    s = $P1
    is(s, "11", "call to unique with no params")
    $P1 = code.'unique'('$P')
    s = $P1
    is(s, "$P12", "call to unique with reg name")
.end

.sub basic_emit
    .local pmc code
    code = new ['CodeString']
    code.'emit'('label:')
    code.'emit'('    say "Hello, World"')
    code.'emit'('    $I0 = 1')
    code.'emit'('    $N0 = 0.1')
    is(code, <<'CODE', "code string looks fine")
label:
    say "Hello, World"
    $I0 = 1
    $N0 = 0.1
CODE
.end

.sub emit_with_pos_args
    .local pmc code
    code = new ['CodeString']
    code.'emit'('label_%0:', 1234)
    code.'emit'('    say "%0, %1"', 'Hello', 'World')
    code.'emit'('    %0 = %2', '$I0', 24, 48)
    is(code, <<'CODE', "code string with positional args looks fine")
label_1234:
    say "Hello, World"
    $I0 = 48
CODE
.end

.sub emit_with_percent_args
    .local pmc code
    code = new ['CodeString']
    code.'emit'('label_%0:', 1234)
    code.'emit'('    say "%,"', 'Hello')
    code.'emit'('    say "%,"', 'Hello', 'World', 'of', 'Parrot')
    code.'emit'('    say "%%0"')
    is(code, <<'CODE', "code string with % args looks fine")
label_1234:
    say "Hello"
    say "Hello, World, of, Parrot"
    say "%0"
CODE
.end

.sub emit_with_named_args
    .local pmc code
    code = new ['CodeString']
    code.'emit'('label_%a:', 'a'=>1234)
    code.'emit'('    say "%b, %c"', 'b'=>'Hello', 'c'=>'World')
    code.'emit'('    say "%d"', 'b'=>'Hello', 'c'=>'World')
    is(code, <<'CODE', "emit with named args looks fine")
label_1234:
    say "Hello, World"
    say "%d"
CODE
.end

.sub emit_with_pos_and_named_args
    .local pmc code
    code = new ['CodeString']
    code.'emit'('label_%a:', 'a'=>1234)
    code.'emit'('    %0 "%b, %c"', 'say', 'print', 'b'=>'H', 'c'=>'W')
    code.'emit'('    say "%,, %c"', 'alpha', 'beta', 'b'=>'H', 'c'=>'W')
    is(code, <<'CODE', "emit with pos + named args")
label_1234:
    say "H, W"
    say "alpha, beta, W"
CODE
.end

.sub output_global_unique_num
    .local pmc code1, code2
    code1 = new ['CodeString']
    code2 = new ['CodeString']
    .local string unique1, unique2
    unique1 = code1.'unique'()
    unique2 = code2.'unique'('$P')
    is(unique1, "13", "global unique #1 looks ok")
    is(unique2, "$P14", "global unique #2 looks ok")
.end

.sub namespace_keys
    .local pmc code
    code = new ['CodeString']
    $S0 = code.'key'('abc')
    is($S0, '["abc"]', "unnested namespace key")
    $S0 = code.'key'('abc', 'def')
    is($S0, '["abc";"def"]', "nested namespace key")
    $P0 = split ' ', unicode:"abc def T\xe9st"
    $S0 = code.'key'($P0 :flat)
    is($S0, '["abc";"def";unicode:"T\x{e9}st"]', "flattened nested unicode ns key")
    $S0 = code.'key'($P0)
    is($S0, '["abc";"def";unicode:"T\x{e9}st"]', "nested unicode ns key")
    $S0 = code.'key'('_perl6', $P0)
    is($S0, '["_perl6";"abc";"def";unicode:"T\x{e9}st"]', "big ns key")
    $S0 = code.'key'('')
    is($S0, '[""]', "empty string namespace")
    $P0 = new 'ResizablePMCArray'
    $S0 = code.'key'($P0)
    is($S0, '[]', "empty array namespace")
    null $P0
    $S0 = code.'key'($P0)
    is($S0, '[]', "null PMC namespace")
.end

.sub first_char_repl_regression
    .local pmc code
    null $P0
    code = new ['CodeString']
    code.'emit'('new', 'n'=>$P0)
    is(code, "new\n", "regression on first char repl bug looks fine")
.end

.sub 'ord_from_name'
    .local pmc code
    load_bytecode 'config.pbc'
    $P0 = _config()
    $I0 = $P0['has_icu']
    if $I0 goto has_icu
    skip(4, 'ICU unavailable')
    .return ()

  has_icu:
    code = new ['CodeString']
    $I0 = code.'charname_to_ord'('LATIN CAPITAL LETTER C')
    is($I0, 0x0043, "LATIN CAPITAL LETTER C")
    $I0 = code.'charname_to_ord'('MUSIC FLAT SIGN')
    is($I0, 0x266d, "MUSIC FLAT SIGN")
    $I0 = code.'charname_to_ord'('RECYCLING SYMBOL FOR TYPE-1 PLASTICS')
    is($I0, 0x2673, "RECYCLING SYMBOL FOR TYPE-1 PLASTICS")
    $I0 = code.'charname_to_ord'('no such symbol')
    is($I0, -1, 'no such symbol')
.end

.sub 'lineof_tests'
    $P0 = new 'CodeString'
    $P0 = "0123\n5678\r0123\r\n678\n"
    $I0 = $P0.'lineof'(0)
    is($I0, 0, "lineof - beginning of string")
    $I0 = $P0.'lineof'(1)
    is($I0, 0, "lineof - char on first line")
    $I0 = $P0.'lineof'(4)
    is($I0, 0, "lineof - immediately before nl")
    $I0 = $P0.'lineof'(5)
    is($I0, 1, "lineof - immediately after nl")
    $I0 = $P0.'lineof'(8)
    is($I0, 1, "lineof - char before cr")
    $I0 = $P0.'lineof'(9)
    is($I0, 1, "lineof - immediately before cr")
    $I0 = $P0.'lineof'(10)
    is($I0, 2, "lineof - immediately after cr")
    $I0 = $P0.'lineof'(11)
    is($I0, 2, "lineof - char after cr")
    $I0 = $P0.'lineof'(13)
    is($I0, 2, "lineof - char before crnl")
    $I0 = $P0.'lineof'(14)
    is($I0, 2, "lineof - immediately before crnl")
    $I0 = $P0.'lineof'(15)
    is($I0, 3, "lineof - middle of crnl")
    $I0 = $P0.'lineof'(16)
    is($I0, 3, "lineof - immediately after crnl")
    $I0 = $P0.'lineof'(19)
    is($I0, 3, "lineof - immediately before final nl")
    $I0 = $P0.'lineof'(20)
    is($I0, 4, "lineof - immediately after final nl")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
