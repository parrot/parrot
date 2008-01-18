=head1 NAME

js -- A compiler for js ECMAScript-262

=head1 SYNOPSIS

  $ ./parrot languages/emcascript/js.pir script.js

=head1 DESCRIPTION

js is a compiler for ECMAScript-262, running on Parrot. Its parser is
a PGE grammar (a subclass of PGE::Grammar). The compilation is a series of
tree transformations using TGE: from match tree to abstract syntax tree
(AST), from AST to opcode syntax tree (OST), and finally from OST to
bytecode (actually to PIR, at first).

=cut


#.include 'src/gen_builtins.pir'


.namespace ['JS::Compiler']

.loadlib 'js_group'


.sub 'onload' :load :init :anon
    load_bytecode 'PCT.pbc'
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $P1 = get_class ['PCT::HLLCompiler']
    $P0.'new_subclass'($P1, 'JS::Compiler')
.end


.sub 'init' :vtable :method
    self.'language'('JS')
    self.'parsegrammar'('JS::Grammar')
    self.'parseactions'('JS::Grammar::Actions')
.end


.sub 'main' :main
    .param pmc args

    $P0 = compreg 'JS'
    $P1 = $P0.'command_line'(args)
.end


.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
