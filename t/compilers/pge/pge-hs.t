#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/library/pge-hs.t

=head1 SYNOPSIS

        % prove t/library/pge-hs.t

=head1 DESCRIPTION

Grammar Engine Haskell Output tests

=cut

# 1
.sub main :main
    .include 'test_more.pir'
    plan(1)

    test_pge_hs_match()
.end

.sub test_pge_hs_match
    .local pmc match, add_rule
    .local string result

    load_bytecode "PGE.pbc"
    load_bytecode "PGE/Hs.pir"

    match = get_global ['PGE';'Hs'], "match"
    add_rule = get_global ['PGE';'Hs'], "add_rule"
    add_rule("foo", "s")
    result = match("test", "t(.<foo>)t")
    eq result, "PGE_Match 0 4 [PGE_Match 1 3 [] [(\"foo\", PGE_Match 2 3 [] [])]] []\n", OK
    ok(0, 'PGE::Hs match')
    .return()
  OK:
    ok(1, 'PGE::Hs match')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
