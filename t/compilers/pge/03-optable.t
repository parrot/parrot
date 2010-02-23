#!parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

.sub main :main
    .include 'test_more.pir'
    plan(37)

    load_bytecode 'compilers/pge/PGE.pbc'
    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'

    optable_output_is( 'a',     'term:a',                                   'Simple term' )
    optable_output_is( 'a+b',   'infix:+(term:a, term:b)',                  'Simple infix' )
    optable_output_is( 'a-b',   'infix:-(term:a, term:b)',                  'Simple infix' )
    optable_output_is( 'a+b+c', 'infix:+(infix:+(term:a, term:b), term:c)', 'left associativity' )
    optable_output_is( 'a+b-c', 'infix:-(infix:+(term:a, term:b), term:c)', 'left associativity' )
    optable_output_is( 'a-b+c', 'infix:+(infix:-(term:a, term:b), term:c)', 'left associativity' )

    optable_output_is( 'a+b*c', 'infix:+(term:a, infix:*(term:b, term:c))', 'tighter precedence' )
    optable_output_is( 'a*b+c', 'infix:+(infix:*(term:a, term:b), term:c)', 'tighter precedence' )

    optable_output_is( 'a/b/c', 'infix:/(infix:/(term:a, term:b), term:c)', 'left associativity' )
    optable_output_is( 'a*b/c', 'infix:/(infix:*(term:a, term:b), term:c)', 'left associativity' )
    optable_output_is( 'a/b*c', 'infix:*(infix:/(term:a, term:b), term:c)', 'left associativity' )

    optable_output_is( 'a=b*c', 'infix:=(term:a, infix:*(term:b, term:c))', 'looser precedence' )

    optable_output_is( 'a=b=c', 'infix:=(term:a, infix:=(term:b, term:c))', 'right associativity' )

    optable_output_is( 'a=b,c,d+e', 'infix:=(term:a, infix:,(term:b, term:c, infix:+(term:d, term:e)))', 'list associativity' )

    optable_output_is( 'a b',     'term:a (pos=1)', 'two terms in sequence' )
    optable_output_is( 'a = = b', 'term:a (pos=1)', 'two opers in sequence' )
    optable_output_is( 'a +',     'term:a (pos=1)', 'infix missing rhs' )

    optable_output_is( 'a++', 'postfix:++(term:a)', 'postfix' )
    optable_output_is( 'a--', 'postfix:--(term:a)', 'postfix' )
    optable_output_is( '++a', 'prefix:++(term:a)',  'prefix' )
    optable_output_is( '--a', 'prefix:--(term:a)',  'prefix' )

    optable_output_is( '-a',  'prefix:-(term:a)',   'prefix ltm')
    optable_output_is( '->a', 'term:->a',           'prefix ltm')

    optable_output_is( 'a*(b+c)', 'infix:*(term:a, circumfix:( )(infix:+(term:b, term:c)))', 'circumfix parens' )
    optable_output_is( 'a*b+c)+4','infix:+(infix:*(term:a, term:b), term:c) (pos=5)', 'extra close paren' )
    optable_output_is( '  )a*b+c)+4', 'failed', 'only close paren' )
    optable_output_is( '(a*b+c',      'failed', 'missing close paren' )
    optable_output_is( '(a*b+c]',     'failed', 'mismatch close paren' )

    optable_output_is( 'a+++--b', 'infix:+(postfix:++(term:a), prefix:--(term:b))', 'mixed tokens' )

    optable_output_is( '=a+4', 'failed', 'missing lhs term' )

    optable_output_is( 'a(b,c)', 'postcircumfix:( )(term:a, infix:,(term:b, term:c))', 'postcircumfix' )
    optable_output_is( 'a (b,c)', 'term:a (pos=1)', 'nows on postcircumfix' )

    optable_output_is( 'a()', 'postcircumfix:( )(term:a, null)', 'nullterm in postcircumfix' )
    optable_output_is( 'a[]', 'term:a (pos=1)', 'nullterm disallowed' )

    optable_output_is( '(a=b;c;d)', 'circumfix:( )(infix:;(infix:=(term:a, term:b), term:c, term:d))', 'loose list associativity in circumfix' )

    optable_output_is( '(a;b);d', 'circumfix:( )(infix:;(term:a, term:b)) (pos=5)', 'top-level stop token' )

    optable_output_is( 'a,b;c', 'infix:,(term:a, term:b) (pos=3)', 'top-level stop token' )
.end

.sub optable_output_is
    .param string test
    .param string output
    .param string message

    $S0 = test_optable(test)
    is($S0, output, message)
.end

################

.sub test_optable
    .param string test

    .local pmc optable
    .local string return_string
    return_string = ''
    $P0 = get_hll_global ['PGE'], 'OPTable'
    optable = $P0.'new'()

    optable.'newtok'('infix:+', 'precedence'=>'=')
    optable.'newtok'('infix:-', 'equiv'=>'infix:+')
    optable.'newtok'('infix:*', 'tighter'=>'infix:+')
    optable.'newtok'('infix:/', 'equiv'=>'infix:*')
    optable.'newtok'('infix:**', 'tighter'=>'infix:*')
    optable.'newtok'('infix:==', 'looser'=>'infix:+')
    optable.'newtok'('infix:=', 'looser'=>'infix:==', 'assoc'=>'right')
    optable.'newtok'('infix:,', 'tighter'=>'infix:=', 'assoc'=>'list')
    optable.'newtok'('infix:;', 'looser'=>'infix:=', 'assoc'=>'list')

    optable.'newtok'('prefix:++', 'tighter'=>'infix:**')
    optable.'newtok'('prefix:--', 'equiv'=>'prefix:++')
    optable.'newtok'('postfix:++', 'equiv'=>'prefix:++')
    optable.'newtok'('postfix:--', 'equiv'=>'prefix:++')
    optable.'newtok'('prefix:-', 'equiv'=>'prefix:++')

    .local pmc ident
    ident = get_global ['PGE';'Match'], 'ident'
    optable.'newtok'('term:', 'tighter'=>'prefix:++', 'parsed'=>ident)
    optable.'newtok'('circumfix:( )', 'equiv'=>'term:')
    optable.'newtok'('circumfix:[ ]', 'equiv'=>'term:')
    optable.'newtok'('postcircumfix:( )', 'looser'=>'term:', 'nows'=>1, 'nullterm'=>1)
    optable.'newtok'('postcircumfix:[ ]', 'equiv'=>'postcircumfix:( )', 'nows'=>1)

    .local pmc arrow
    $P0 = compreg 'PGE::Perl6Regex'
    arrow = $P0("'->' <ident>")
    optable.'newtok'('term:->', 'equiv'=>'term:', 'parsed'=>arrow, 'skipkey'=>0)

    .local pmc match
    match = optable.'parse'(test, 'stop'=>' ;')
    unless match goto fail
    $P0 = match['expr']
    $S1 = tree($P0)
    return_string .= $S1
    $I0 = match.'to'()
    $I1 = length test
    if $I0 == $I1 goto succeed
    return_string .= " (pos="
    $S1 = $I0
    return_string .= $S1
    return_string .= ")"
  succeed:
    goto endz
  fail:
    return_string = "failed"
  endz:
    .begin_return
    .set_return return_string
    .end_return
.end

.sub 'tree'
    .param pmc match
    .local string type
    .local string return_string
    $S0 = match
    if $S0 == "" goto print_null
    type = match['type']
    return_string .= type
    if type == 'term:' goto print_term
    if type == 'term:->' goto print_term_arrow
    return_string .= '('
    .local pmc it
    $P0 = match.'list'()
    if null $P0 goto iter_end
    unless $P0 goto iter_end
    it = iter $P0
    unless it goto iter_end
  iter_loop:
    $P0 = shift it
    $S1 = tree($P0)
    return_string .= $S1
    unless it goto iter_end
    return_string .= ', '
    goto iter_loop
  iter_end:
    return_string .= ')'
    goto endz

  print_null:
    return_string .= "null"
    goto endz
  print_term:
    $S1 = match
    return_string .= $S1
    goto endz
  print_term_arrow:
    $S0 = match['ident']
    return_string .= $S0
  endz:
    .begin_return
    .set_return return_string
    .end_return
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
