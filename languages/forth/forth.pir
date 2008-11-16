
.HLL 'Forth'
.namespace []

.include 'languages/forth/words.pir'

.sub ' init' :load
    # load the libraries we depend on
    load_bytecode 'languages/forth/tokenstream.pbc'
    load_bytecode 'languages/forth/variablestack.pbc'
    load_bytecode 'languages/forth/virtualstack.pbc'

    # initialize the rstack
    .local pmc stack
    stack = new 'ResizablePMCArray'
    set_hll_global ' stack', stack

    # word dictionary - used for compilation
    .local pmc dict
    dict = new 'Hash'
    set_hll_global ' dict', dict

    .local pmc vars, vstack
    vars   = new 'Hash'
    vstack = new 'VariableStack'
    set_hll_global ' variables', vars
    set_hll_global ' vstack', vstack

    # register the actual compiler
    .local pmc compiler
    compiler = get_hll_global ' compile'
    compreg 'forth', compiler
.end

.sub main :main :anon
    .param pmc args
    .local int argc
    argc = elements args

    ' init'()
    if argc == 0 goto prompt

prompt:
    ' prompt'()
    end
.end


.sub ' prompt'
    .local pmc stdin, stdout, forth
    stdin  = getstdin
    stdout = getstdout
    forth  = compreg 'forth'

    $S0 = pop stdout
    print "Parrot Forth\n"

loop:
    print "> "
    $S0 = readline stdin
    unless stdin goto end

    push_eh exception
      $P0 = forth($S0)
      $P0()
    pop_eh

    print " ok\n"
    goto loop
end:
    .return()

exception:
    .get_results ($P0)
    $S0 = $P0
    print $S0
    print "\n"
    goto loop
.end


.sub ' compile'
    .param string input

    .local pmc code, stream, stack
    code   = new 'CodeString'
    stream = new 'TokenStream'
    set stream, input
    stack  = new 'VirtualStack'

    code.'emit'(<<"END_PIR")
.sub code :anon
    .local pmc stack
    stack = get_hll_global " stack"
END_PIR

    .local pmc token
next_token:
    unless stream goto done
    token = shift stream

    ' dispatch'(code, stream, stack, token)

    goto next_token

done:
    $S0 = stack.'consolidate_to_cstack'()
    code .= $S0
    code.'emit'(<<"END_PIR")
    .return(stack)
.end
END_PIR

    $P0 = compreg "PIR"
    .tailcall $P0(code)
.end

.sub ' dispatch'
    .param pmc code
    .param pmc stream
    .param pmc stack
    .param pmc token

    $I0 = isa token, 'Integer'
    if $I0 goto numeric

    .local pmc dict, vars
    dict = get_hll_global ' dict'
    vars = get_hll_global ' variables'

    $S0 = token
    $I0 = exists dict[$S0]
    if $I0 goto user_word
    $I0 = exists vars[$S0]
    if $I0 goto user_var

    $P0 = get_hll_global $S0
    if null $P0 goto undefined
    $P0(code, stream, stack)
    .return()

user_word:
    $S1 = stack.'consolidate_to_cstack'()
    code .= $S1
    $S0 = dict[$S0]
    code.'emit'("    '%0'(stack)", $S0)
    .return()

user_var:
    $I0 = vars[$S0]
    $S0 = code.'unique'('$P')
    code.'emit'(<<'END_PIR', $S0, $I0)
    %0 = new 'Integer'
    %0 = %1
END_PIR
    push stack, $S0
    .return()

undefined:
    $S0 = token
    $S0 = "undefined symbol: " . $S0
    $P0 = new 'Exception'
    $P0[0] = $S0
    throw $P0

numeric:
    $S0 = code.'unique'('$P')
    code.'emit'(<<"END_PIR", $S0, token)
    %0 = new 'Integer'
    %0 = %1
END_PIR
    push stack, $S0
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
