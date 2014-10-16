#!./parrot
# Copyright (C) 2006-2014, Parrot Foundation.

=head1 NAME

t/pmc/lexinfo.t - test LexInfo PMC


=head1 SYNOPSIS

    % prove t/pmc/lexinfo.t

=head1 DESCRIPTION

Tests the LexInfo PMC.

=cut

.include 'except_types.pasm'

.sub main :main
    .include 'test_more.pir'
    plan(6)

    inspect_test()
    inspect_invalid_test()
    declare_lex_preg_test()
.end

.sub inspect_test
    .lex "$a", $P0
    .lex "$b", $P1

    $P2 = new 'ParrotInterpreter'
    $P2 = $P2['sub']
    $P2 = $P2.'get_lexinfo'()
    $P2 = inspect $P2, 'symbols'
    $I0 = elements $P2
    is($I0, 2, "correct number of symbol in introspection hash")

    .local int have_a, have_b
    have_a = 0
    have_b = 0
    $S0 = $P2[0]
    if $S0 != "$a" goto not_a_1
    inc have_a
  not_a_1:
    if $S0 != "$b" goto not_b_1
    inc have_b
  not_b_1:

    $S0 = $P2[1]
    if $S0 != "$a" goto not_a_2
    inc have_a
  not_a_2:
    if $S0 != "$b" goto not_b_2
    inc have_b
  not_b_2:

    is(have_a, 1, "$a symbol was in list")
    is(have_b, 1, "$b symbol was in list")
.end

.sub inspect_invalid_test
    .local pmc li, in, ex
    .local int r, type
    li = new ['LexInfo']
    r = 0
    push_eh catch
    in = inspect li, 'fubar'
    goto done
  catch:
    .get_results(ex)
    type = ex['type']
    r = iseq type, .EXCEPTION_INVALID_OPERATION
  done:
    ok(r, 'invalid introspection key throws as expected')
.end

.sub declare_lex_preg_test
    .local pmc li, in, ex, pad
    li = new ['LexInfo']
    pad = new ['LexPad'], li

    $S0 = "$foo"
    # dynamic version of .lex "$foo", $P4
    li.'declare_lex_preg'($S0, 4)

    in = inspect li, 'symbols'
    $I0 = elements in
    is($I0, 1, "one lex stored in lex hash")

    $S1 = in[0]
    is($S1, "$foo", "and it is $foo")

    # But this does not work yet
    #$P4 = box 'pants'
    #$P1 = pad["$foo"]
    #is($P1, "pants", "changed the lex value")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
