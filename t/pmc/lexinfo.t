#! parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/lexinfo.t - test LexInfo PMC


=head1 SYNOPSIS

    % prove t/pmc/lexinfo.t

=head1 DESCRIPTION

Tests the LexInfo PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(4)

    new_test()
    inspect_test()
.end

.sub new_test
    push_eh eh
    $P0 = new ['LexInfo']
    pop_eh
    ok(0, "shouldn't be able to create a LexInfo without an initializer")
    goto end
eh:
    ok(1, "can't create a LexInfo without an initializer")
end:
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

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
