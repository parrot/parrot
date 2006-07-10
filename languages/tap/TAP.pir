# This source borrows from punie and perl6

.namespace [ 'TAP' ]

.sub '__onload' :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pir'
#    load_bytecode 'TGE.pbc'

    $P0 = getclass 'PGE::Grammar'
    $P1 = subclass $P0, 'TAP::Grammar'

    $P0 = find_global 'TAP', 'compile'
    compreg 'TAP', $P0
.end


.sub 'compile'
    .param pmc code
    .param string target       :named('target') :optional
    .param int has_target      :opt_flag
    .param int dump            :named('dump') :optional
    .param int has_dump        :opt_flag

    if has_target goto set_dump
    target = 'pbc'
  set_dump:
    if has_dump goto parse
    dump = 0

  parse:
    .local pmc parse
    .local pmc match
    parse = find_global 'TAP::Grammar', 'output'
    match = parse(code, 'grammar'=>'TAP::Grammar', 'pos'=>0)

    unless match goto return_match
    unless dump goto parse_1
    '_dumper'(match, 'parse')
  parse_1:
    if target == 'parse' goto return_match

  build_ast:
    .local pmc astgrammar, astbuilder, ast
    astgrammar = new 'TAP::PAST::Grammar'
    astbuilder = astgrammar.apply(match)
    ast = astbuilder.get('past')
    unless dump goto build_ast_1
    '_dumper'(match, 'PAST')
  build_ast_1:
    if target == 'PAST' goto return_ast

  build_post:
    .local pmc postgrammar, postbuilder, post
    postgrammar = new 'TAP::POST::Grammar'
    postbuilder = postgrammar.'apply'(ast)
    post = postbuilder.get('root')
    unless dump goto build_post_1
    '_dumper'(match, 'POST')
  build_post_1:
    if target == 'POST' goto return_post

  build_pir:
    .local string pir
    pir = post.'root_pir'()
    unless dump goto build_pir_1
    print pir
  build_pir_1:
    if target == 'PIR' goto return_pir

 compile_pir:
    $P0 = compreg 'PIR'
    $P1 = $P0(pir)
    .return ($P1)

  return_match:
    .return (match)
  return_ast:
#    .return (ast)
  return_post:
#    .return (post)
  return_pir:
#    .return (pir)
.end


.include 'src/main.pir'

# Pull in the compiled grammar
.namespace [ 'TAP::Grammar' ]
.include 'src/TAP_grammar.pir'


## vim: expandtab sw=4
