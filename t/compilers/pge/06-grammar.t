#!./parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/compilers/pge/06-grammar.t - test some simple grammars

=head1 SYNOPSIS

% prove t/compilers/pge/06-grammar.t

=head1 DESCRIPTION

Test some simple grammars.

=cut

.sub main :main
    load_bytecode 'Test/Builder.pbc'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Perl6Grammar.pbc'
    .include "iglobals.pasm"

    .local pmc test, todo_tests, todo_desc, grammar, expr, description, test_num

    # avoid name clashes in grammars with fatal method redefinition
    test_num  = new 'Integer'
    test_num  = 0
    set_global 'test_num', test_num

    # the test builder
    test = new [ 'Test'; 'Builder' ]

    # PMCs to store TODO tests and reasons/descriptions
    todo_tests = new 'Hash'
    todo_desc  = new 'Hash'

    # PMCs to store grammars and expressions to test for each grammar
    # also set description for that grammar
    grammar     = new 'ResizableStringArray'
    expr        = new 'ResizablePMCArray'
    description = new 'ResizableStringArray'

    .local int ok, n_grammars, n_tests

    # plan tests to run
    test.'plan'(16)

    # define descriptions / grammars / expressions to run

    .local pmc targets

    targets = new 'ResizableStringArray'
    push targets, '1313'                    # n1
    push targets, ' 1414 '                  # n2

    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match' )
grammar Simple::Test1;
rule main { <number> }
token number { \d+ }
EOF_SIMPLE_GRAMMAR


    targets = new 'ResizableStringArray'
    push targets, '[1313]'                  # n3
    push targets, '[ 1313 ]'                # n4
    push targets, '[    1313  ]'            # n5
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match with constant chars' )
grammar Simple::Test2;
rule main { \[ <number> \] }
token number { \d+ }
EOF_SIMPLE_GRAMMAR


    targets = new 'ResizableStringArray'
    push targets, ''                        # n6
    push targets, '11'                      # n7
    push targets, '11 12 13'                # n8
    push targets, ' 11     12  13   14'     # n9
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match with repetition using *' )
grammar Simple::Test3;
rule main { [<number> <.ws>]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR


    targets = new 'ResizableStringArray'
    push targets, '11 12 13'                # n10
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'another simple token/rule match with repetition using *' )
grammar Simple::Test4;
rule main { [<number> ]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR

    targets = new 'ResizableStringArray'
    push targets, '11'                      # n11
    push targets, '11 12 13'                # n12
    push targets, ' 11     12  13   14'     # n13
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match with repetition using +' )
grammar Simple::Test5;
rule main { [<number> <.ws>]+ }
token number { \d+ }
EOF_SIMPLE_GRAMMAR

    targets = new 'ResizableStringArray'
    push targets, '11'                      # n14
    push targets, '11 12 13'                # n15
    push targets, '  11     12  13  '       # n16
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match with repetition using *' )
grammar Simple::Test6;
rule main { [ <number>]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR

.end


.sub 'test_grammar_against_targets'
    .param string grammar
    .param pmc    targets
    .param string description

    load_bytecode 'Test/Builder.pbc'
    .local pmc    test
                  test = new [ 'Test'; 'Builder' ]

    .local int    ok
                  ok = 0
    .local pmc    compiler
                  compiler = '_compile_grammar'(grammar)

    .local pmc    test_num
                  test_num  = get_global 'test_num'

    # it starts at zero
    inc test_num

    .local string test_num_str
                  test_num_str = test_num
    .local string test_name
                  test_name    = 'Simple::Test' . test_num_str

    $P0 = split '::', test_name
    .local pmc parser
               parser = get_hll_global $P0, 'main'

  next_target:
    .local string target
                  target = shift targets

    ok = '_match_expr'( parser, target )
    test.'ok'( ok, description )
    $I0 = targets
    if $I0 goto next_target
.end

.sub '_compile_grammar'
    .param string grammar

    .local pmc p6grammar, code, pir_compiler, parser

    p6grammar    = compreg 'PGE::Perl6Grammar'
    code         = p6grammar.'compile'(grammar, 'target'=>'PIR')
    pir_compiler = compreg 'PIR'
    parser       = pir_compiler(code)

    .return( parser )
.end


.sub '_match_expr'
    .param pmc    parser
    .param string expr

    .local int ok
    .local string result, test_name, test_num_str
    .local pmc p6grammar, code, parse, match, test_num

  do_match:
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Perl6Grammar.pbc'

    ok        = 1
    match     = parser(expr)
    result    = match

    if result == expr goto match_ok
    ok = 0

  match_ok:
    .return(ok)
.end

=head1 AUTHOR

Nuno 'smash' Carvalho <mestre.smash@gmail.com>

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
