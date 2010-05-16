#!./parrot
# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1 NAME

t/compilers/pge/04-compile.t - Test our ability to compile regexes into various names

=head1 SYNOPSIS

        % prove t/compilers/pge/04-compile.t

=head1 DESCRIPTION

Tests various arguments to the compiler.

=cut

.namespace []

.sub main :main
    .include 'test_more.pir'
    plan(4)

    test_basic_compile_no_name_grammar()
    test_compile_into_current_namespace()
    test_compile_into_a_new_grammar()
    test_compile_into_a_new_grammar_2x()
.end


.sub test_basic_compile_no_name_grammar
    load_bytecode 'PGE.pbc'

    .local pmc p6compiler
    p6compiler = compreg 'PGE::Perl6Regex'
    $P1 = p6compiler('.+')
    $P2 = $P1('ok 1')
    is($P2, 'ok 1', 'basic compile, no name/grammar')
.end


.sub test_compile_into_current_namespace
    load_bytecode 'PGE.pbc'

    .local pmc p6compiler
    p6compiler = compreg 'PGE::Perl6Regex'
    $P1 = p6compiler('.+', 'name'=>'xyz', 'grammar'=>'')
    $P2 = 'xyz'('ok 1')
    is($P2, 'ok 1', 'compile into current namespace')
.end


.sub test_compile_into_a_new_grammar
    load_bytecode 'PGE.pbc'

    .local pmc p6compiler
    p6compiler = compreg 'PGE::Perl6Regex'
    $P1 = p6compiler('.+', 'name'=>'xyz1', 'grammar'=>'PGE::Test')
    $P2 = get_hll_global ['PGE';'Test'], 'xyz1'
    $P3 = $P2('ok 1')
    is($P3, 'ok 1', 'compile into a new grammar')
.end


.sub test_compile_into_a_new_grammar_2x
    load_bytecode 'PGE.pbc'

    .local pmc p6compiler
    p6compiler = compreg 'PGE::Perl6Regex'
    $P1 = p6compiler('.+', 'name'=>'abc', 'grammar'=>'PGE::Test')
    $P1 = p6compiler('.+', 'name'=>'xyz2', 'grammar'=>'PGE::Test')
    $P2 = get_hll_global ['PGE';'Test'], 'abc'
    $P3 = $P2('ok 1')
    is($P3, 'ok 1', 'compile into a new grammar, 2x')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
