#!./parrot 
# Copyright (C) 2006, The Perl Foundation.

=head1 NAME

t/compilers/pge/06-grammar.t - test some simple grammars

=head1 SYNOPSIS

% prove t/compilers/pge/06-grammar.t

=head1 DESCRIPTION

Test some simple grammars. 

=cut

.sub _match_expr
    .param string grammar
    .param string expr
    .local int ok
    .local string result
    .local pmc p6regex, code, parse, match

    load_bytecode 'PGE.pbc'
    load_bytecode 'compilers/pge/pgc.pir'

    ok = 1
    p6regex = compreg 'PGE::P6Grammar'
    code = p6regex(grammar)
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

.sub main :main
    load_bytecode 'Test/Builder.pir'
    load_bytecode 'PGE.pbc'
    load_bytecode 'compilers/pge/pgc.pir'
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

    description[0] = 'simple token/rule match'
    grammar[0] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { <number> }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, '1313' # n1
    push $P0, ' 1414 ' #n2
    expr[0] = $P0

    description[1] = 'simple token/rule match with constant chars'
    grammar[1] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { \[ <number> \] }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, '[1313]' # n3
    push $P0, '[ 1313 ]' # n4
    push $P0, '[    1313  ]' # n5
    expr[1] = $P0

   description[2] = 'simple token/rule match with repetition using *'
   grammar[2] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> <?ws>]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, '' # n6
    push $P0, '11' # n7
    push $P0, '11 12 13' # n8
    push $P0, ' 11     12  13   14' # n9
    expr[2] = $P0

   description[3] = 'another simple token/rule match with repetition using *'
   grammar[3] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> ]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, '11 12 13' # n10
    expr[3] = $P0

   description[4] = 'simple token/rule match with repetition using +'
   grammar[4] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> <?ws>]+ }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, '11' # n11
    push $P0, '11 12 13' # n12
    push $P0, ' 11     12  13   14' # n13
    expr[4] = $P0

    description[5] = 'simple token/rule match with repetition using *'
    grammar[5] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [ <number>]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, '11' # n14
    push $P0, '11 12 13' # n15
    push $P0, '  11     12  13  ' # n16
    expr[5] = $P0

    # define todo tests
    # if test is to be tagged TODO set todo_test[test_number] = 1
    # also add why with todo_desc[test_number] = <reason>
    todo_tests[10] = 1
    todo_desc[10] = 'bug in PGE'

    # set the number of grammars to run
    n_grammars = elements grammar

    # for each grammar run the tests
    $I0 = 0
    n_tests = 0
  main_loop:
    $S0 = grammar[$I0]
    $S1 = description[$I0]
    $P0 = expr[$I0]
    $I1 = 0
    $I2 = elements $P0
  next_expr:
    $S2 = $P0[$I1]
    inc $I1
    inc n_tests
    ok = _match_expr($S0,$S2)
    $I3 = todo_tests[n_tests]
    if $I3 == 1 goto todo_test
    test.'ok'(ok,$S1)
    if $I1 < $I2 goto next_expr
    inc $I0
    if $I0 < n_grammars goto main_loop
    goto the_end
  todo_test:
    inc $I0
    $S2 = todo_desc[n_tests]
    test.'todo'(ok,$S2)
    goto main_loop
  the_end:

.end

=head1 AUTHOR

Nuno 'smash' Carvalho <mestre.smash@gmail.com>

=cut

