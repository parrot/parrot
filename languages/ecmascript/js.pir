=head1 NAME

js -- A compiler for js ECMAScript-262

=head1 SYNOPSIS

  $ ./parrot languages/emcascript/js.pir script.js

=head1 DESCRIPTION

js is a compiler for ECMAScript-262 (3rd edition) running on Parrot.

=cut


## Create a 'List' class; stolen from Rakudo.
## At some point, this should be refactored/reused.
##
.namespace []

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




.namespace ['JS';'Compiler']

.loadlib 'js_group'

.sub 'onload' :load :init :anon
    load_bytecode 'PCT.pbc'

    $P0 = get_hll_global ['PCT'], 'HLLCompiler'
    $P1 = $P0.'new'()
    $P1.'language'('JS')
    $P1.'parsegrammar'('JS::Grammar')
    $P1.'parseactions'('JS::Grammar::Actions')

    ## Create a list called '@?BLOCK' and store it, so it can
    ## be used in the parse actions.
    ##
    $P0 = new 'List'
    set_hll_global ['JS';'Grammar';'Actions'], '@?BLOCK', $P0
.end


.sub 'main' :main
    .param pmc args
    $P0 = compreg 'JS'
    $P1 = $P0.'command_line'(args)
.end


.include 'src/gen_grammar.pir'
.include 'src/gen_actions.pir'


.namespace []

.include 'src/builtin/builtins.pir'
.include 'src/classes/Object.pir'
.include 'src/classes/Boolean.pir'
.include 'src/classes/Null.pir'
#.include 'src/classes/Number.pir'
#.include 'src/classes/String.pir'
#.include 'src/classes/Undefined.pir'


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
