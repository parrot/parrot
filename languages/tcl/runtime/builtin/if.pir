###
# [if]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&if'
    .param pmc argv :slurpy

    .local int argc
    argc = elements argv

    .local pmc __expr
    __expr = get_root_global ['_tcl'], '__expr'

    if argc == 0 goto no_args

    # we have to do arg checking first, to make sure we got the proper type of
    # exception. but [expr] checking has to happen before that. so replace each
    # string expression with a Sub that represents it. and while we're at it,
    # strip out the "then"s.

    $S0 = argv[0]
    $P0 = __expr($S0)
    argv[0] = $P0

    $I0 = 1
    if $I0 == argc goto no_script
    $S0 = argv[$I0]
    unless $S0 == 'then' goto arg_next

    # we have to do this check first so that "then" shows up in the error
    inc $I0
    if $I0 == argc goto no_script

    dec $I0
    delete argv[$I0]
    dec argc
arg_next:
    inc $I0
    if $I0 == argc goto arg_end

    $S0 = argv[$I0]
    if $S0 == 'elseif' goto arg_elseif
    if $S0 == 'else'   goto arg_else

    # 'else' is optional
    dec $I0
    goto arg_else

arg_elseif:
    inc $I0
    if $I0 == argc goto no_expression
    $S0 = argv[$I0]
    $P0 = __expr($S0)
    argv[$I0] = $P0

    inc $I0
    if $I0 == argc goto no_script
    $S0 = argv[$I0]
    unless $S0 == 'then' goto arg_next

    # we have to do this check first so that "then" shows up in the error
    inc $I0
    if $I0 == argc goto no_script

    dec $I0
    delete argv[$I0]
    dec argc
    goto arg_next

arg_else:
    inc $I0
    if $I0 == argc goto no_script

    inc $I0
    if $I0 != argc goto extra_words_after_else
arg_end:

    # now we can do the actual evaluation
    .local pmc __script, __boolean
    __script  = get_root_global ['_tcl'], '__script'
    __boolean = get_root_global ['_tcl'], '__boolean'

    .local pmc    cond
    .local string code
    cond = argv[0]
    code = argv[1]
    $I0  = 1

loop:
    $P1 = cond()
    $I1 = __boolean($P1)
    unless $I1 goto next
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
    cond = argv[$I0]
    inc $I0
    code = argv[$I0]
    goto loop

else:
    inc $I0
    code = argv[$I0]
    $P0  = __script(code)
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
