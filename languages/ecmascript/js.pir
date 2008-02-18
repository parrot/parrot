=head1 NAME

js -- A compiler for js ECMAScript-262

=head1 SYNOPSIS

  $ ./parrot languages/emcascript/js.pir script.js

=head1 DESCRIPTION

js is a compiler for ECMAScript-262 (3rd edition) running on Parrot.

=cut


#.include 'src/gen_builtins.pir'

## Create a 'List' class; stolen from Rakudo.
## At some point, this should be refactored/reused.
##
.namespace

.sub '__onload' :load :init
    $P0 = subclass 'ResizablePMCArray', 'List'
.end

## Methods for the List class
##
.namespace ['List']

.sub 'elems' :method
    $I0 = elements self
    .return ($I0)
.end

.sub 'unshift' :method
    .param pmc x
    unshift self, x
.end

.sub 'shift' :method
    .local pmc x
    x = shift self
    .return (x)
.end




.namespace ['JS::Compiler']

.loadlib 'js_group'

.sub 'onload' :load :init :anon
    load_bytecode 'PCT.pbc'
    load_bytecode 'Protoobject.pbc'

    $P0 = get_hll_global 'Protomaker'
    $P1 = get_class ['PCT::HLLCompiler']
    $P0.'new_subclass'($P1, 'JS::Compiler')

    ## Create a list called '@?BLOCK' and store it, so it can
    ## be used in the parse actions.
    ##
    $P0 = new 'List'
    set_hll_global ['JS';'Grammar';'Actions'], '@?BLOCK', $P0
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


.namespace

.include 'src/builtin/builtins.pir'


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
