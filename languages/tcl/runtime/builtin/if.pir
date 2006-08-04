###
# [if]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&if'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv

    if argc == 0 goto no_args

    .local pmc __expr, __script
    __expr   = get_root_global ['_tcl'], '__expr'
    __script = get_root_global ['_tcl'], '__script'

    .local string cond, code
    cond = argv[0]
    $I0  = 1
    if argc == 1 goto no_script
    code = argv[1]

    unless code == 'then' goto loop
    $I0  = 2
    if argc == 2 goto no_script
    code = argv[2]

loop:
    $P0 = __expr(cond)
    $P1 = $P0()
    unless $P1 goto next
    $P0 = __script(code)
    .return $P0()

next:
    inc $I0
    if $I0 == argc goto nothing

    $S0 = argv[$I0]
    if $S0 == 'elseif' goto elseif
    if $S0 == 'else'   goto else

    # 'else' is optional
    dec $I0
    goto else

elseif:
    inc $I0
    if $I0 == argc goto no_expression

    cond = argv[$I0]
    inc $I0
    if $I0 == argc goto no_script

    code = argv[$I0]
    goto loop

else:
    inc $I0
    if $I0 == argc goto no_script
    code = argv[$I0]

    inc $I0
    if $I0 != argc goto extra_words_after_else

    $P0 = __script(code)
    .return $P0()

extra_words_after_else:
    .throw('wrong # args: extra words after "else" clause in "if" command')

nothing:
    .return('')

no_args:
    .throw('wrong # args: no expression after "if" argument')

no_script:
    dec $I0
    $S0 = argv[$I0]
    $S0 = 'wrong # args: no script following "' . $S0
    $S0 = $S0 . '" argument'
    .throw($S0)

no_expression:
    dec $I0
    $S0 = argv[$I0]
    $S0 = 'wrong # args: no expression after "' . $S0
    $S0 = $S0 . '" argument'
    .throw($S0)
.end
