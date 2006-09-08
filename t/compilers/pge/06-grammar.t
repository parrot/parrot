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

    .local pmc test
    test = new 'Test::Builder'
    .local pmc todo_tests # Keys indicate tests ID; values reasons.
    todo_tests = new .Hash
    .local pmc grammar
    grammar = new .ResizableStringArray
    .local pmc expr 
    expr = new .ResizablePMCArray
    .local pmc description 
    description = new .ResizableStringArray

    .local int ok,n_grammars,n_tests

    # plan tests to run 
    test.'plan'(13)

    # define descriptions / grammars / expressions to run

    description[0] = 'simple token/rule match'
    grammar[0] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { <number> }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, "1313"
    push $P0, " 1414 "
    expr[0] = $P0

    description[1] = 'simple token/rule match with constant chars'
    grammar[1] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { \[ <number> \] }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, "[1313]"
    push $P0, "[ 1313 ]"
    push $P0, "[    1313  ]"
    expr[1] = $P0

   description[2] = 'simple token/rule match with repetition using *'
   grammar[2] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> <?ws>]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, ""
    push $P0, "11"
    push $P0, "11 12 13"
    push $P0, " 11     12  13   14"
    expr[2] = $P0

   description[3] = 'another simple token/rule match with repetition using *'
   grammar[3] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> ]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, "11 12 13"
    expr[3] = $P0

   description[4] = 'simple token/rule match with repetition using +'
   grammar[4] = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> <?ws>]+ }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
    $P0 = new .ResizableStringArray
    push $P0, "11"
    push $P0, "11 12 13"
    push $P0, " 11     12  13   14"
    expr[4] = $P0

    # define todo tests
    # XXX need to add reasons for todo tests
    todo_tests[10] = 1

    n_grammars = elements grammar

    # run the tests
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
    $I3 = todo_tests[n_tests]
    if $I3 == 1 goto skip_test
    ok = _match_expr($S0,$S2)
    test.'ok'(ok,$S1)
    if $I1 < $I2 goto next_expr
    inc $I0
    if $I0 < n_grammars goto main_loop
    goto the_end
  skip_test:
    inc $I0
    test.'todo'(1,$S1)
    goto main_loop
  the_end:

.end

=head1 AUTHOR

Nuno 'smash' Carvalho <mestre.smash@gmail.com>

=cut

