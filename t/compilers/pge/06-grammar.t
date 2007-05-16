#!./parrot
# Copyright (C) 2006-2007, The Perl Foundation.

=head1 NAME

t/compilers/pge/06-grammar.t - test some simple grammars

=head1 SYNOPSIS

% prove t/compilers/pge/06-grammar.t

=head1 DESCRIPTION

Test some simple grammars.

=cut

.sub main :main
    load_bytecode 'Test/Builder.pir'
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/P6Grammar.pbc'
    .include "iglobals.pasm"

    .local pmc test, todo_tests, todo_desc, grammar, expr, description

    # the test builder
    test = new 'Test::Builder'

    # PMCs to store TODO tests and reasons/descriptions
    todo_tests = new .Hash
    todo_desc = new .Hash

    # PMCs to store grammars and expressions to test for each grammar
    # also set description for that grammar
    grammar = new .ResizableStringArray
    expr = new .ResizablePMCArray
    description = new .ResizableStringArray

    .local int ok,n_grammars,n_tests

    # plan tests to run
    test.'plan'(16)

    # define descriptions / grammars / expressions to run

    .local pmc targets

    targets = new .ResizableStringArray
    push targets, '1313'                    # n1
    push targets, ' 1414 '                  # n2

    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match' )
grammar Simple::Test;
rule main { <number> }
token number { \d+ }
EOF_SIMPLE_GRAMMAR


    targets = new .ResizableStringArray
    push targets, '[1313]'                  # n3
    push targets, '[ 1313 ]'                # n4
    push targets, '[    1313  ]'            # n5
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match with constant chars' )
grammar Simple::Test;
rule main { \[ <number> \] }
token number { \d+ }
EOF_SIMPLE_GRAMMAR


    targets = new .ResizableStringArray
    push targets, ''                        # n6
    push targets, '11'                      # n7
    push targets, '11 12 13'                # n8
    push targets, ' 11     12  13   14'     # n9
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match with repetition using *' )
grammar Simple::Test;
rule main { [<number> <?ws>]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR


    targets = new .ResizableStringArray
    push targets, '11 12 13'                # n10
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'another simple token/rule match with repetition using *' )
grammar Simple::Test;
rule main { [<number> ]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR

    targets = new .ResizableStringArray
    push targets, '11'                      # n11
    push targets, '11 12 13'                # n12
    push targets, ' 11     12  13   14'     # n13
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match with repetition using +' )
grammar Simple::Test;
rule main { [<number> <?ws>]+ }
token number { \d+ }
EOF_SIMPLE_GRAMMAR

    targets = new .ResizableStringArray
    push targets, '11'                      # n14
    push targets, '11 12 13'                # n15
    push targets, '  11     12  13  '       # n16
    'test_grammar_against_targets'( <<'EOF_SIMPLE_GRAMMAR', targets, 'simple token/rule match with repetition using *' )
grammar Simple::Test;
rule main { [ <number>]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
.end


.sub 'test_grammar_against_targets'
    .param string grammar
    .param pmc    targets
    .param string description

    load_bytecode 'Test/Builder.pir'
    .local pmc    test
                  test = new 'Test::Builder'

    .local int    ok
                  ok = 0
    .local string target

  next_target:
    target = shift targets

    ok = '_match_expr'( grammar, target )
    test.'ok'( ok, description )
    $I0 = targets
    if $I0 goto next_target
.end


.sub '_match_expr'
    .param string grammar
    .param string expr
    .local int ok
    .local string result
    .local pmc p6grammar, code, parse, match

    load_bytecode 'PGE.pbc'
    load_bytecode 'compilers/pge/pgc.pir'

    ok = 1
    p6grammar = compreg 'PGE::P6Grammar'
    code = p6grammar.'compile'(grammar, 'target'=>'PIR')
    $P0 = compreg 'PIR'
    $P1 = $P0(code)
    parse = find_global "Simple::Test", "main"
    match = parse(expr)
    result = match

    if result == expr goto match_ok
    ok = 0

  match_ok:
    .return(ok)
.end

=head1 AUTHOR

Nuno 'smash' Carvalho <mestre.smash@gmail.com>

=cut

