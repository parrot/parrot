# Copyright (C) 2008, The Perl Foundation.
# $Id$
# pirric.pir
# A rudimentary old style Basic interpreter for parrot
# This is proof of concept version, don't blame for redundant code
# and other ugliness

.include 'iterator.pasm'
.include 'except_severity.pasm'
.include 'cclass.pasm'

#-----------------------------------------------------------------------
.sub init :load :init
    .local pmc func
    func = get_global ['Tokenizer'], 'new'
    set_global 'newTokenizer', func

    .local pmc cl
    cl = newclass ['Tokenizer']
    addattribute cl, 'line'
    addattribute cl, 'pos'
    addattribute cl, 'last'
    addattribute cl, 'pending'

    .local pmc progclass
    progclass = newclass ['Program']
    addattribute progclass, 'text'
    addattribute progclass, 'lines'

    $P0 = get_class 'String'
    cl = newclass 'Literal'
    addparent cl, $P0
    set_global 'Literal', cl
.end

#-----------------------------------------------------------------------
.sub main :main
    .param pmc args

    .local pmc keywords
    keywords = new 'Hash'
    setkeyword(keywords, 'END')
    setkeyword(keywords, 'EXIT')
    setkeyword(keywords, 'GOTO')
    setkeyword(keywords, 'IF')
    setkeyword(keywords, 'LIST')
    setkeyword(keywords, 'LOAD')
    setkeyword(keywords, 'PRINT')
    setkeyword(keywords, 'REM')
    setkeyword(keywords, 'RUN')
    setkeyword(keywords, 'SAVE')
    set_global 'keywords', keywords

    .local pmc program
    program = new ['Program']

    set_global 'program', program

    $I0 = args
    le $I0, 1, start
    .local string filename
    filename = args[1]
    say filename
    load_program(filename)

start:
    runloop($I0)
.end

#-----------------------------------------------------------------------
.sub setkeyword
    .param pmc keywords
    .param string key

    .local string funcname
    funcname = concat 'func_', key
    .local pmc func
    func = get_global funcname
    $I0 = defined func
    if $I0 goto good
    say 'No func!'
    exit 1
good:
    keywords [key] = func
.end

#-----------------------------------------------------------------------
.sub readlinebas
    .param pmc file
    .local string line
    line = readline file
    $I1 = length line
checkline:
    if $I1 < 1 goto done
    dec $I1
    $I2 = is_cclass .CCLASS_NEWLINE, line, $I1
    unless $I2 goto done
    line = substr line, 0, $I1
    goto checkline
done:
    .return(line)
.end

#-----------------------------------------------------------------------
.sub load_program
    .param string filename

    .local pmc file
    .local string line
    .local pmc tokenizeline
    .local pmc token
    .local int linenum
    .local pmc program

    program = get_global 'program'

    open file, filename, '<'
nextline:
    line = readlinebas(file)
    unless line goto eof

    say line

    tokenizeline = newTokenizer(line)
    token = tokenizeline.get()
    linenum = token
    unless linenum goto fail
    line = tokenizeline.getall()
    program.storeline(linenum, line)

    goto nextline

eof:
    close file
    .return()

fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub save_program
    .param string filename

    .local pmc file
    .local pmc program

    open file, filename, '>'

    program = get_global 'program'
    $P0 = program.begin()
next:
    unless $P0, finish
    shift $S0, $P0
    $S1 = program [$S0]
    print file, $S0
    print file, ' '
    print file, $S1
    print file, "\n"
    goto next
finish:
    close file
.end

#-----------------------------------------------------------------------
.sub interactive
    .local pmc stdin
    stdin = getstdin

    .local string line
reinit:
    say 'Ready'
    line = readlinebas(stdin)

    .local pmc tokenizer
    .local pmc ptoken

    tokenizer = newTokenizer(line)
    ptoken = tokenizer.get()
    $I0 = isa ptoken, 'Integer'
    if $I0 goto storeline

    execute(tokenizer, ptoken)

    goto done

storeline:
    line = tokenizer.getall()
    $I0 = ptoken
    .local pmc program
    program = get_global "program"

    program.storeline($I0, line)
done:
.end

#-----------------------------------------------------------------------
.sub execute
    .param pmc tokenizer
    .param pmc token :optional
    .param int has :opt_flag

    if has goto check
    token = tokenizer.get()
check:
    unless token goto next

    .local string key
    key = token
    upcase key

    .local pmc keywords
    keywords = get_global 'keywords'
    $I0 = keywords
    .local pmc func
    func = keywords [key]
    $I0 = defined func
    if $I0 goto exec

    .local pmc op
    op = tokenizer.get()
    eq op, '=', assign
    goto fail
assign:
    $S0 = key

    .local pmc value
    value = evaluate(tokenizer)

#    $P3 = get_global $S0
#    $I0 = defined $P3
#    if $I0 goto set_it
    set_global $S0, value
    goto next
#set_it:
#    assign $P3, value
#    goto next

fail:
    SyntaxError()
exec:
    func(tokenizer)
next:
.end

#-----------------------------------------------------------------------
.sub get_args
    .param pmc tokenizer

    .local pmc args
    .local pmc arg
    .local pmc token
    .local pmc delim

    args = new 'ResizablePMCArray'
    token = tokenizer.get()
    $I0 = defined token
    unless $I0 goto fail
    eq token, ')', empty
    null arg
    arg = evaluate(tokenizer, token)
nextarg:
    push args, arg
    null arg
    delim = tokenizer.get()
    $I0 = defined delim
    unless $I0 goto fail
    eq delim, ')', endargs
    ne delim, ',', fail
    arg = evaluate(tokenizer)
    goto nextarg
endargs:
    .return(args)
empty:
    null $P0
    .return($P0)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub eval_base
    .param pmc tokenizer
    .param pmc token :optional

    .local pmc args
    .local pmc arg

    $I0 = defined token
    if $I0 goto check
    token = tokenizer.get()
check:
    $I0 = defined token
    unless $I0 goto fail

    eq token, '(', parenexp

    $I0 = isa token, 'Literal'
    if $I0 goto done
    $I0 = isa token, 'Integer'
    if $I0 goto done
    $I0 = isa token, 'String'
    unless $I0 goto fail

    $S0 = token
    upcase $S0
    #print $S0

    eq $S0, 'NEW', new_op
    eq $S0, 'SIN', func_sin

    $P1 = get_global $S0
    unless_null $P1, getvar

    $P0 = get_namespace token
    $I0 = defined $P0
    if $I0 goto spaced
    SyntaxError()
spaced:
    $P1 = tokenizer.get()
    ne $P1, '.', fail
    $P1 = tokenizer.get()
    $S1 = $P1
    $P2 = $P0 [$S1]

    $P4 = tokenizer.get()
    eq $P4, '(', getargs
    tokenizer.back()

    .return($P2)

getargs:
    args = get_args(tokenizer)
    $I0 = defined args
    unless $I0 goto emptyargs
endargs:
    $P3 = $P2(args :flat)
    .return($P3)
emptyargs:
    $P3 = $P2()
    .return($P3)

getvar:
    #say token
    assign token, $P1
    $P1 = tokenizer.get()
    eq $P1, '.', dotted
    tokenizer.back()
done:
    #say token
    .return(token)
new_op:
    $P1 = tokenizer.get()
    $I0 = defined $P1
    unless $I0 goto fail
    $I0 = isa $P1, 'Literal'
    if $I0 goto getit
    $I0 = isa $P1, 'String'
    unless $I0 goto fail
    $S0 = $P1
    upcase $S0
    $P1 = get_global $S0
    $I0 = defined $P1
    if $I0 goto getit
    goto fail

getit:
    $S1 = $P1

    $P1 = new $S1
    .return($P1)
dotted:
    $P2 = tokenizer.get()
    $P3 = tokenizer.get()
    eq $P3, '(', methodcall
    tokenizer.back()

    $S1 = $P2
    $P1 = getattribute token, $S1
    .return($P1)

methodcall:
    $S2 = $P2
    #say $S2

    args = get_args(tokenizer)
    $I0 = defined args
    unless $I0 goto memptyargs
    $P2 = token.$S2(args :flat)
    .return($P2)

memptyargs:
    $P2 = token.$S2()
    .return($P2)

parenexp:
    $P1 = evaluate(tokenizer)
    token = tokenizer.get()
    ne token, ')', fail
    .return($P1)

func_sin:
    null $P1
    $P1 = tokenizer.get()
    ne $P1, '(', fail
    $P5 = evaluate(tokenizer)
    null $P1
    $P1 = tokenizer.get()
    ne $P1, ')', fail
    say $P5
    $P9 = $P5.sin()
    #say $P9
    .return($P9)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub eval_comp
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = eval_base(tokenizer, token)
more:
    $P1 = tokenizer.get()
    eq $P1, '=', doequal
    eq $P1, '<', doless
    eq $P1, '>', dogreat
    tokenizer.back()
    .return($P0)
doequal:
    $P2 = eval_base(tokenizer)
    clone $P3, $P0
    $I0 = iseq $P3, $P2
    set $P0, $I0
    goto more
doless:
    $P2 = eval_base(tokenizer)
    clone $P3, $P0
    $I0 = islt $P3, $P2
    set $P0, $I0
    goto more
dogreat:
    $P2 = eval_base(tokenizer)
    $I0 = isgt $P0, $P2
    set $P0, $I0
    goto more
.end

#-----------------------------------------------------------------------
.sub eval_mul
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = eval_comp(tokenizer, token)
more:
    $P1 = tokenizer.get()
    eq $P1, '*', domul
    eq $P1, '/', dodiv
    tokenizer.back()
    .return($P0)
domul:
    $P2 = eval_comp(tokenizer)
    $P3 = clone $P0
    mul $P3, $P2
    set $P0, $P3
    goto more
dodiv:
    $P2 = eval_comp(tokenizer)
    $P3 = clone $P0
    div $P3, $P2
    set $P0, $P3
    goto more
.end

#-----------------------------------------------------------------------
.sub eval_add
    .param pmc tokenizer
    .param pmc token

    $P0 = eval_mul(tokenizer, token)
more:
    $P1 = tokenizer.get()
    eq $P1, '+', doadd
    eq $P1, '-', dosub
    tokenizer.back()
    .return($P0)
doadd:
    $P2 = eval_mul(tokenizer)
    clone $P3, $P0
    add $P3, $P2
    set $P0, $P3
    goto more
dosub:
    $P2 = eval_mul(tokenizer)
    clone $P3, $P0
    sub $P3, $P2
    set $P0, $P3
    goto more
.end

#-----------------------------------------------------------------------
.sub evaluate
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = eval_add(tokenizer, token)
    .return($P0)
.end

#-----------------------------------------------------------------------

.sub func_END
    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'Integer'
    aux = 2
    setattribute excep, 'severity', aux
    .local pmc line
    line = new 'Integer'
    line = -1
    setattribute excep, 'payload', line
    throw excep
.end

.sub func_EXIT
    exit 0
.end

.sub func_GOTO
    .param pmc tokenizer
    .local pmc arg
    arg = tokenizer.get()
    $I0 = defined arg
    unless $I0 goto fail
    $I0 = arg

    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'Integer'
    aux = 2
    setattribute excep, 'severity', aux
    .local pmc line
    line = new 'Integer'
    line = $I0
    setattribute excep, 'payload', line
    throw excep
fail:
    SyntaxError()
.end

.sub func_IF
    .param pmc tokenizer
    .local pmc arg
    .local pmc token

    arg = evaluate(tokenizer)
    token = tokenizer.get()
    $I0 = defined token
    unless $I0 goto fail
    $S0 = token
    upcase $S0
    ne $S0, "THEN", fail

    $I0 = defined arg
    unless $I0 goto is_false
    $I0 = arg
    unless $I0 goto is_false
    execute(tokenizer)
is_false:
    .return()
fail:
    SyntaxError()
.end

.sub func_LIST
    .local pmc program
    program = get_global 'program'

#    $P0 = program.begin()
#next:
#    unless $P0, finish
#    shift $S0, $P0
#    $S1 = program [$S0]
#    $I1 = length $S1
#    unless $I1 goto next
#    print $S0
#    print ' '
#    say $S1
#    goto next

    .local pmc lines, text
    lines = getattribute program, 'lines'
    text = getattribute program, 'text'
    .local int i, n, linenum
    .local string content
    n = lines
    say n
    i = 0
nextline:
    ge i, n, finish
    linenum = lines [i]
    content = text [linenum]
    print linenum
    print ' '
    say content
    inc i
    goto nextline
finish:
.end

.sub func_LOAD
    .param pmc tokenizer
    .local pmc arg
    arg = evaluate(tokenizer)
    $P1 = tokenizer.get()
    $I1 = defined $P1
    unless $I1 goto notype
    ne $P1, ',', notype

    $P1 = tokenizer.get()
    $I1 = defined $P1
    unless $I1 goto fail
    $S1 = $P1
    upcase $S1
    ne $S1, 'B', fail
    $S1 = arg
    load_bytecode $S1
    .return()
notype:
    .local string filename

    filename = arg
    load_program(filename)

    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'Integer'
    aux = 2
    setattribute excep, 'severity', aux
    .local pmc line
    line = new 'Integer'
    line = -1
    setattribute excep, 'payload', line
    throw excep

fail:
    SyntaxError()
.end

.sub func_SAVE
    .param pmc tokenizer
    .local pmc arg
    arg = evaluate(tokenizer)
    $P1 = tokenizer.get()
    $I1 = defined $P1
    if $I1 goto fail

    .local string filename

    filename = arg
    save_program(filename)

    .return()

fail:
    SyntaxError()
.end

.sub func_PRINT
    .param pmc tokenizer
    .local pmc arg

    arg = tokenizer.get()
    $I0 = defined arg
    unless $I0 goto endline

item:
    arg = evaluate(tokenizer, arg)
print_it:
    print arg
    arg = tokenizer.get()
    $I0 = defined arg
    unless $I0 goto endline
    eq arg, ';', nextitem
    eq arg, ',', comma
    SyntaxError()
comma:
    print "\t"
    goto nextitem

fail:
    SyntaxError()
endline:
    say ''
    .return()
nextitem:
    arg = tokenizer.get()
    $I0 = defined arg
    if $I0 goto item
.end

.sub func_REM
    # Do nothing
.end

.sub func_RUN
    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'Integer'
    aux = 2
    setattribute excep, 'severity', aux
    .local pmc line
    line = new 'Integer'
    line = 0
    setattribute excep, 'payload', line
    throw excep
.end

#-----------------------------------------------------------------------
.sub runloop
    .param int start :optional

    .local pmc program
    .local pmc iter
    program = get_global 'program'

    iter = program.begin()

    push_eh handle_excep

    null $S0

    unless start goto next
    shift $S0, iter

next:
    if $S0 goto runit
    interactive()
    goto next

runit:
    $S1 = program [$S0]

    .local pmc tokenizer
    tokenizer = newTokenizer($S1)
    execute(tokenizer)
    unless iter goto endprog
    shift $S0, iter
    goto next
endprog:
    null $S0
    goto next

handle_excep:
    .local pmc excep
    .local string msg
    .get_results(excep, msg)
    $P1 = getattribute excep, 'severity'
    $I1 = $P1
    eq $I1, .EXCEPT_EXIT, finish
handle_it:
    $P1 = getattribute excep, 'payload'
    $I1 = defined $P1
    unless $I1 goto unhandled
    $I1 = $P1
    eq $I1, -1, prog_end
    .local int target
    target = $P1

    iter = program.begin()

findline:
    unless iter, noline
    shift $S0, iter
    eq target, 0, handled_done
    $I0 = $S0
    gt $I0, target, noline
    lt $I0, target, findline
handled_done:
    push_eh handle_excep
    goto runit
noline:
    say 'Line does not exist'
    null $S0
    push_eh handle_excep
    goto next

prog_end:
    null $S0
    push_eh handle_excep
    goto next

unhandled:
    $P1 = getattribute excep, 'message'
    say $P1
    null $S0
    push_eh handle_excep
    goto next

finish:
.end

#-----------------------------------------------------------------------

.sub SyntaxError
    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'String'
    aux = 'Syntax error'
    setattribute excep, 'message', aux
    aux = new 'Integer'
    aux = 2
    setattribute excep, 'severity', aux
    throw excep
.end

########################################################################

.namespace [ 'Tokenizer' ]

#-----------------------------------------------------------------------
.sub 'new'
    .param string line
    .local pmc tkn
    .local pmc l

    tkn = new ['Tokenizer']
    l = new 'String'
    l = line
    setattribute tkn, 'line', l
    $P0 = new 'Integer'
    $P0 = 0
    setattribute tkn, 'pos', $P0
    .return(tkn)
.end

#-----------------------------------------------------------------------
.sub get :method

    .local pmc pending
    .local pmc last

    pending = getattribute self, 'pending'
    if_null pending, getnext
    null $P1
    setattribute self, 'pending', $P1
    last = clone pending
    setattribute self, 'last', last
    .return(pending)

getnext:
    .local string line
    $P0 = getattribute self, 'line'
    line = $P0
    .local pmc pos
    pos = getattribute self, 'pos'

    .local int i, l
    l = length line
    i = pos
    .local string result
    result = ''
    .local pmc objres
    .local string c
loop:
    ge i, l, endline
    c = substr line, i, 1
    inc i
    eq c, ' ', loop
    eq c, "\n", endline

    eq c, '.', operator
    eq c, ',', operator
    eq c, ';', operator
    eq c, '=', operator
    eq c, '+', operator
    eq c, '-', operator
    eq c, '*', operator
    eq c, '/', operator
    eq c, '<', operator
    eq c, '>', operator
    eq c, '(', operator
    eq c, ')', operator

    eq c, '"', str
    $I0 = ord c
    $I1 = ord '9'
    gt $I0, $I1, nextchar
    $I1 = ord '0'
    lt $I0, $I1, nextchar
    objres = new 'Integer'
    .local int value
    sub $I0, $I1
    value = $I0
    #say value
nextnum:
    ge i, l, endnum
    c = substr line, i, 1
    $I0 = ord c
    $I1 = ord '9'
    gt $I0, $I1, endnum
    $I1 = ord '0'
    lt $I0, $I1, endnum
    inc i
    sub $I0, $I1
    #say $I0
    mul value, 10
    add value, $I0
    #say value
    goto nextnum
endnum:
    objres = value
    goto doit

operator:
    result = c
    goto endtoken

nextchar:
    concat result, c
    ge i, l, endtoken
    c = substr line, i , 1
    eq c, ' ', endtoken
    eq c, "\n", endtoken
    eq c, '"', endtoken
    eq c, '.', endtoken
    eq c, ",", endtoken
    eq c, ";", endtoken
    eq c, '=', endtoken
    eq c, '+', endtoken
    eq c, '-', endtoken
    eq c, '*', endtoken
    eq c, '/', endtoken
    eq c, '<', endtoken
    eq c, '>', endtoken
    eq c, '(', endtoken
    eq c, ')', endtoken
    inc i
    goto nextchar
endtoken:
    objres = new 'String'
    objres = result
    goto doit

str:
    ge i, l, endstr
    c = substr line, i, 1
    inc i
    eq c, '"', endstr
    concat result, c
    goto str
endstr:
    objres = new 'Literal'
    objres = result
    goto doit

endline:
    last = new 'Undef'
    setattribute self, 'last', last
    .local pmc none
    none = new 'Undef'
    .return(none)

doit:
    pos = i
    last = clone objres
    setattribute self, 'last', last
    .return(objres)
.end

#-----------------------------------------------------------------------
.sub back :method
    $P0 = getattribute self, 'last'
    setattribute self, 'pending', $P0
.end

#-----------------------------------------------------------------------
.sub getall :method
    .local string line
    $P0 = getattribute self, 'line'
    line = $P0
    .local pmc pos
    pos = getattribute self, 'pos'
    .local int i, l
    l = length line
    i = pos
loop:
    ge i, l, endline
    .local string c
    c = substr line, i, 1
    inc i
    eq c, ' ', loop
    eq c, "\n", endline
    dec i
endline:
    .local string str
    str = substr line, i
    .return(str)
.end

########################################################################

.namespace ['Program']

#-----------------------------------------------------------------------
.sub init :vtable
    .local pmc text
    .local pmc lines

    say 'Program.init'

    text = new 'Hash'
    lines = new 'ResizableIntegerArray'
    setattribute self, 'text', text
    setattribute self, 'lines', lines
.end

#-----------------------------------------------------------------------
.sub elements :method :vtable
    .local pmc text
    text = getattribute self, 'text'
    $I0 = text
    .return($I0)
.end

#;-----------------------------------------------------------------------
.sub get_string_keyed :vtable
    .param pmc key

    #say key

    .local pmc text
    text = getattribute self, 'text'
    $S0 = text[key]
    .return($S0)
.end

#-----------------------------------------------------------------------
.sub begin :method
    .local pmc text
    text = getattribute self, 'lines'
    new $P0, 'Iterator', text
    set $P0, .ITERATE_FROM_START
    .return($P0)
.end

#-----------------------------------------------------------------------
.sub storeline :method
    .param int linenum
    .param string line

    .local pmc text, lines
    .local int n, i, j, curnum
    text = getattribute self, 'text'
    lines = getattribute self, 'lines'
    n = lines
    i = 0
next:
    ge i, n, storenum
    curnum = lines [i]
    ge curnum, linenum, storeit
    inc i
    goto next
storeit:
    eq curnum, linenum, storeline
    j = n
nextmove:
    dec j
    curnum = lines [j]
    lines [n] = curnum
    dec n
    gt n, i, nextmove
storenum:
    lines [i] = linenum
storeline:
    text [linenum] = line
.end

########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
