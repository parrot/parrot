# Copyright (C) 2008, The Perl Foundation.
# $Id$
#
# pirric.pir
# A rudimentary old style Basic interpreter for parrot
# This is a proof of concept version, don't blame for redundant code
# and other ugliness
#
# Only one instruction per line.
#
# Instuctions implemented:
# - Flow control: GOTO, GOSUB, RETURN, RUN, END, EXIT
# - Conditional: IF (without ELSE)
# - Programming: LIST, LOAD, SAVE
# - Debugging: TRON, TROFF
# - Input/Output: PRINT
# - Miscellaneous: REM
# - Variables: varname = expression
# - Access to parrot modules: LOAD "module name" , B
#
# Expressions:
# - Operators: + - * / < > = unary-
# - Predefined functions: COS, SIN, SQR, LEN, LEFT$, RIGHT$
# - Parenthesis
# - Special functions: NEW "Class name"
# - Calls to methods in foreign objects
# - Calls to functions in foreign namespaces

#-----------------------------------------------------------------------

.include 'iterator.pasm'
.include 'except_severity.pasm'
.include 'cclass.pasm'

#-----------------------------------------------------------------------
.sub init :load :init
    .local pmc func
    func = get_global ['Tokenizer'], 'newTokenizer'
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

    .local pmc runnerclass
    runnerclass = newclass ['Runner']
    addattribute runnerclass, 'program'
    addattribute runnerclass, 'vars'
    addattribute runnerclass, 'stack'
    addattribute runnerclass, 'tron'

    .local pmc jumpclass
    jumpclass = newclass ['Jump']
    addattribute jumpclass, 'jumptype'
    addattribute jumpclass, 'jumpline'

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
    setkeyword(keywords, 'GOSUB')
    setkeyword(keywords, 'GOTO')
    setkeyword(keywords, 'IF')
    setkeyword(keywords, 'LIST')
    setkeyword(keywords, 'LOAD')
    setkeyword(keywords, 'PRINT')
    setkeyword(keywords, 'REM')
    setkeyword(keywords, 'RETURN')
    setkeyword(keywords, 'RUN')
    setkeyword(keywords, 'SAVE')
    setkeyword(keywords, 'TROFF')
    setkeyword(keywords, 'TRON')
    set_global 'keywords', keywords

    .local pmc program
    program = new ['Program']

    set_global 'program', program

    .local pmc runner
    runner = new ['Runner']
    setattribute runner, 'program', program

    $I0 = args
    $I1 = 1
read_args:
    le $I0, $I1, no_prog
    .local string arg
    arg = args[$I1]
    if arg == '-t' goto opt_tron

    #say arg
    program.load(arg)

    $I0 = 1
    goto start

opt_tron:
    runner.trace(1)
    inc $I1
    goto read_args

no_prog:
    $I0 = 0
start:
    runner.runloop($I0)
.end

#-----------------------------------------------------------------------
.sub setkeyword
    .param pmc keywords
    .param string key

    .local string funcname
    funcname = concat 'func_', key

    .local pmc func
    func = get_global ['Runner'], funcname
    $I0 = defined func
    if $I0 goto good
    say 'No func!'
    exit 1
good:
    keywords [key] = func
.end

#-----------------------------------------------------------------------
.sub FatalError
    .param string msg

    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'String'
    aux = msg
    setattribute excep, 'message', aux
    aux = new 'Integer'
    aux = .EXCEPT_FATAL
    setattribute excep, 'severity', aux
    throw excep
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
    aux = .EXCEPT_ERROR
    setattribute excep, 'severity', aux
    throw excep
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

########################################################################

.namespace ['Runner']

#-----------------------------------------------------------------------
.sub init :vtable
    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'tron', $P0
    $P1 = new 'ResizablePMCArray'
    setattribute self, 'stack', $P1
.end

#-----------------------------------------------------------------------
.sub trace :method
    .param int level

    $P0 = getattribute self, 'tron'
    $P0 = level
.end

#-----------------------------------------------------------------------
.sub get_1_arg :method
    .param pmc tokenizer

    .local pmc arg

    arg = self.evaluate(tokenizer)
    $P0 = tokenizer.get()
    $I0 = defined $P0
    unless $I0 goto fail
    ne $P0, ')', fail
    .return(arg)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub get_2_args :method
    .param pmc tokenizer

    .local pmc arg1, arg2

    arg1 = self.evaluate(tokenizer)
    $P0 = tokenizer.get()
    $I0 = defined $P0
    unless $I0 goto fail
    ne $P0, ',', fail
    arg2 = self.evaluate(tokenizer)
    $P0 = tokenizer.get()
    $I0 = defined $P0
    unless $I0 goto fail
    ne $P0, ')', fail
    .return(arg1, arg2)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub get_args :method
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
    arg = self.evaluate(tokenizer, token)
nextarg:
    push args, arg
    null arg
    delim = tokenizer.get()
    $I0 = defined delim
    unless $I0 goto fail
    eq delim, ')', endargs
    ne delim, ',', fail
    arg = self.evaluate(tokenizer)
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
.sub eval_base :method
    .param pmc tokenizer
    .param pmc token :optional

    .local pmc arg
    .local pmc args

    $I0 = defined token
    if $I0 goto check
    token = tokenizer.get()
check:
    $I0 = defined token
    unless $I0 goto fail

    eq token, '(', parenexp
    eq token, '-', unaryminus

    $I0 = isa token, 'Literal'
    if $I0 goto isliteral
    $I0 = isa token, 'Integer'
    if $I0 goto isinteger
    $I0 = isa token, 'Float'
    if $I0 goto isfloat
    $I0 = isa token, 'String'
    unless $I0 goto fail

    $S0 = token
    upcase $S0
    #print $S0

# Some predefined functions:
    eq $S0, 'NEW', new_op
    eq $S0, 'COS', func_cos
    eq $S0, 'SIN', func_sin
    eq $S0, 'SQR', func_sqr
    eq $S0, 'LEN', func_len
    eq $S0, 'LEFT$', func_left
    eq $S0, 'RIGHT$', func_right

    #say $S0
    .local pmc var
    var = get_hll_global $S0
    unless_null var, getvar

    $P0 = get_namespace token
    $I0 = defined $P0
    if $I0 goto spaced

    $P1 = tokenizer.get()
    $S1 = $P1
    ne $S1, '(', fail
    $S0 = token
    #say $S0
    var = get_hll_global $S0
    if_null var, fail
    args = self.get_args(tokenizer)
    $P9 = var(args)
    .return($P9)
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

isliteral:
    .return(token)

isinteger:
    .return(token)

isfloat:
    .return(token)

getargs:
    args = self.get_args(tokenizer)
    $I0 = defined args
    unless $I0 goto emptyargs
endargs:
    $P3 = $P2(args :flat)
    .return($P3)
emptyargs:
    $P3 = $P2()
    .return($P3)

getvar:
    $P2 = tokenizer.get()
    eq $P2, '.', dotted
    tokenizer.back()
    .return(var)

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
    #print "NEW: "
    #say $S1

    $P1 = new $S1
    .return($P1)
dotted:
    $P3 = tokenizer.get()
    $P4 = tokenizer.get()
    eq $P4, '(', methodcall
    tokenizer.back()

    $S1 = $P3
    $P5 = getattribute token, $S1
    .return($P5)

methodcall:
    $S2 = $P3
    #say $S2

    .local pmc methargs
    methargs = self.get_args(tokenizer)
    $I0 = defined methargs
    unless $I0 goto memptyargs
    $P5 = var.$S2(methargs :flat)
    .return($P5)

memptyargs:
    $P2 = var.$S2()
    .return($P2)

unaryminus:
    $P1 = self.eval_base(tokenizer)
    $P2 = clone $P1
    $P2 = 0
    $P2 = $P2 - $P1
    .return($P2)

parenexp:
    $P1 = self.evaluate(tokenizer)
    token = tokenizer.get()
    ne token, ')', fail
    .return($P1)

func_len:
    null $P1
    $P1 = tokenizer.get()
    ne $P1, '(', fail
    null $P5
    $P5 = self.get_1_arg(tokenizer)

    $S5 = $P5
    $I0 = length $S5
    $P6 = new 'Integer'
    $P6 = $I0
    .return($P6)

func_left:
    null $P1
    $P1 = tokenizer.get()
    ne $P1, '(', fail
    null $P5
    null $P6
    ($P5, $P6) = self.get_2_args(tokenizer)

    $S0 = $P5
    $I0 = $P6
    $S1 = substr $S0, 0, $I0
    $P7 = new 'String'
    $P7 = $S1
    .return($P7)

func_right:
    null $P1
    $P1 = tokenizer.get()
    ne $P1, '(', fail
    null $P5
    null $P6
    ($P5, $P6) = self.get_2_args(tokenizer)

    $S0 = $P5
    $I0 = $P6
    $I1 = $S0
    $I0 = $I1 - $I0
    $S1 = substr $S0, $I0
    $P7 = new 'String'
    $P7 = $S1
    .return($P7)

func_cos:
    null $P1
    $P1 = tokenizer.get()
    ne $P1, '(', fail
    null $P5
    $P5 = self.get_1_arg(tokenizer)
    $I0 = isa $P5, 'Integer'
    #print 'Integer: '
    #say $I0
    unless $I0 goto do_cos
    $I0 = $P5
    null $P5
    $P5 = new 'Float'
    $N0 = $I0
    $P5 = $N0
do_cos:
    $P9 = $P5.cos()
    .return($P9)

func_sin:
    null $P1
    $P1 = tokenizer.get()
    ne $P1, '(', fail
    null $P5
#    $P5 = self.evaluate(tokenizer)
#    null $P1
#    $P1 = tokenizer.get()
#    ne $P1, ')', fail
#    #say $P5
    $P5 = self.get_1_arg(tokenizer)

    $I0 = isa $P5, 'Integer'
    #print 'Integer: '
    #say $I0
    unless $I0 goto do_sin
    $I0 = $P5
    null $P5
    $P5 = new 'Float'
    $N0 = $I0
    $P5 = $N0
do_sin:
    $P9 = $P5.sin()

    #say $P9
    .return($P9)

func_sqr:
    null $P1
    $P1 = tokenizer.get()
    ne $P1, '(', fail
    null $P5
    $P5 = self.evaluate(tokenizer)
    null $P1
    $P1 = tokenizer.get()
    ne $P1, ')', fail
    #say $P5

    $I0 = isa $P5, 'Integer'
    #print 'Integer: '
    #say $I0
    unless $I0 goto do_sqr
    $I0 = $P5
    null $P5
    $P5 = new 'Float'
    $N0 = $I0
    $P5 = $N0
do_sqr:
    $P9 = $P5.sqrt()

    #say $P9
    .return($P9)

fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub eval_comp :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.eval_base(tokenizer, token)
more:
    $P1 = tokenizer.get()
    eq $P1, '=', doequal
    eq $P1, '<', doless
    eq $P1, '>', dogreat
    tokenizer.back()
    .return($P0)
doequal:
    $P2 = self.eval_base(tokenizer)
    clone $P3, $P0
    $I0 = iseq $P3, $P2
    null $P0
    $P0 = new 'Integer'
    set $P0, $I0
    goto more
doless:
    $P2 = self.eval_base(tokenizer)
    clone $P3, $P0
    $I0 = islt $P3, $P2
    null $P0
    $P0 = new 'Integer'
    set $P0, $I0
    goto more
dogreat:
    $P2 = self.eval_base(tokenizer)
    clone $P3, $P0
    $I0 = isgt $P3, $P2
    null $P0
    $P0 = new 'Integer'
    set $P0, $I0
    goto more
.end

#-----------------------------------------------------------------------
.sub eval_mul :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.eval_comp(tokenizer, token)
more:
    $P1 = tokenizer.get()
    eq $P1, '*', domul
    eq $P1, '/', dodiv
    tokenizer.back()
    .return($P0)
domul:
    $P2 = self.eval_comp(tokenizer)
    $P3 = clone $P0
    mul $P3, $P2
    set $P0, $P3
    goto more
dodiv:
    $P2 = self.eval_comp(tokenizer)
    $P3 = clone $P0
    div $P3, $P2
    set $P0, $P3
    goto more
.end

#-----------------------------------------------------------------------
.sub eval_add :method
    .param pmc tokenizer
    .param pmc token

    $P0 = self.eval_mul(tokenizer, token)
more:
    $P1 = tokenizer.get()
    eq $P1, '+', doadd
    eq $P1, '-', dosub
    tokenizer.back()
    .return($P0)

doadd:
    $P2 = self.eval_mul(tokenizer)
    clone $P3, $P0

    $I3 = isa $P3, 'String'
    if $I3 goto str_add
    $I2 = isa $P2, 'String'
    if $I2 goto str_add

    add $P3, $P2
    set $P0, $P3
    goto more
str_add:
    $S0 = $P3
    $S1 = $P2
    $S3 = concat $S0, $S1
    $P3 = $S3
    set $P0, $P3
    goto more

dosub:
    $P2 = self.eval_mul(tokenizer)
    clone $P3, $P0
    sub $P3, $P2
    set $P0, $P3
    goto more
.end

#-----------------------------------------------------------------------
.sub evaluate :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.eval_add(tokenizer, token)
#    $I0 = isa $P0, 'Integer'
#    unless $I0 goto done
#    say '<Integer'
#done:
    .return($P0)
.end

#-----------------------------------------------------------------------
.sub runloop :method
    .param int start :optional

    .local pmc program
    .local pmc iter
    .local pmc tron
    .local string curline

#    program = get_global 'program'
    program = getattribute self, 'program'
    tron = getattribute self, 'tron'

    iter = program.begin()

    push_eh handle_excep

    null curline

    unless start goto next
    shift curline, iter

next:
    if curline goto runit
    self.interactive()
    goto next

runit:
    unless tron goto executeline
    print '['
    print curline
    print ']'

executeline:
    $S1 = program [curline]

    .local pmc tokenizer
    tokenizer = newTokenizer($S1)
    self.execute(tokenizer)
    unless iter goto endprog
    shift curline, iter
    goto next
endprog:
    null curline
    goto next

handle_excep:
    .local pmc excep
    .get_results(excep)

    $P1 = getattribute excep, 'severity'
    $I1 = $P1
    eq $I1, .EXCEPT_EXIT, finish
handle_it:
    $P1 = getattribute excep, 'payload'
    $I1 = defined $P1
    unless $I1 goto unhandled
    $I1 = isa $P1, 'Jump'
    unless $I1 goto unhandled
    $P2 = getattribute $P1, 'jumpline'
    $I1 = $P2
    eq $I1, -1, prog_end

    $S2 = curline
    .local int target
    target = $P2

    iter = program.begin()

    .local string fline
findline:
    unless iter, noline
    shift fline, iter
    eq target, 0, handled_done
    $I0 = fline
    gt $I0, target, noline
    lt $I0, target, findline

handled_done:
    curline = fline
    $P3 = getattribute $P1, 'jumptype'
    $I1 = defined $P3
    unless $I1 goto handled_jump
    eq $P3, 1, handle_gosub
    eq $P3, 2, handle_return
    goto handled_jump

handle_gosub:
    .local pmc stack
    stack = getattribute self, 'stack'
    push stack, $S2
    goto handled_jump

handle_return:
    shift curline, iter

handled_jump:
    push_eh handle_excep
    goto runit
noline:
    print 'Line does not exist'
    unless curline goto endmsg
    print ' in '
    print curline
endmsg:
    say ''
    null curline
    push_eh handle_excep
    goto next

prog_end:
    null curline
    push_eh handle_excep
    goto next

unhandled:
    $P1 = getattribute excep, 'message'
    say $P1
    null curline
    push_eh handle_excep
    goto next

finish:
.end

#-----------------------------------------------------------------------
.sub interactive :method
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
    if $I0 goto storeit

    self.execute(tokenizer, ptoken)

    goto done

storeit:
    .local pmc program
    program = getattribute self, "program"
    $I0 = ptoken
    line = tokenizer.getall()
    $I1 = length line
    unless $I1 goto deleteit

    program.storeline($I0, line)
    goto done

deleteit:
    program.deleteline($I0)

done:
.end

#-----------------------------------------------------------------------
.sub execute :method
    .param pmc tokenizer
    .param pmc token :optional
    .param int has :opt_flag

    if has goto check
    token = tokenizer.get()
check:
    unless token goto next

    .local string key
    key = token
    unless key == '?' goto findkey
    key = 'PRINT'

findkey:
    upcase key
    .local pmc keywords
    keywords = get_hll_global 'keywords'
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
    value = self.evaluate(tokenizer)

#    $P3 = get_global $S0
#    $I0 = defined $P3
#    if $I0 goto set_it
    set_hll_global $S0, value
    goto next
#set_it:
#    assign $P3, value
#    goto next

fail:
    SyntaxError()
exec:
    self.func(tokenizer)
next:
.end

#-----------------------------------------------------------------------
.sub func_END :method
    .param pmc tokenizer

    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'Integer'
    aux = .EXCEPT_NORMAL
    setattribute excep, 'severity', aux

    .local pmc line
    line = new 'Jump'
    $P0 = new 'Integer'
    $P0 = -1
    setattribute line, 'jumpline', $P0

    setattribute excep, 'payload', line
    throw excep
.end

.sub func_EXIT :method
    .param pmc tokenizer

    exit 0
.end

.sub func_GOTO :method
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
    aux = .EXCEPT_NORMAL
    setattribute excep, 'severity', aux
    .local pmc line
    line = new 'Jump'
    $P0 = new 'Integer'
    $P0 = $I0
    setattribute line, 'jumpline', $P0
    setattribute excep, 'payload', line
    throw excep
fail:
    SyntaxError()
.end

.sub func_GOSUB :method
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
    aux = .EXCEPT_NORMAL
    setattribute excep, 'severity', aux
    aux = new 'Integer'
    aux = 0
    setattribute excep, 'type', aux

    .local pmc line
    line = new 'Jump'
    $P0 = new 'Integer'
    $P0 = $I0
    setattribute line, 'jumpline', $P0
    $P1 = new 'Integer'
    $P1 = 1
    setattribute line, 'jumptype', $P1

    setattribute excep, 'payload', line

    throw excep
fail:
    SyntaxError()
.end

.sub func_IF :method
    .param pmc tokenizer

    .local pmc arg
    .local pmc token

    arg = self.evaluate(tokenizer)
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
    self.execute(tokenizer)
is_false:
    .return()
fail:
    SyntaxError()
.end

.sub func_LIST :method
    .param pmc tokenizer

    .local pmc program
    program = getattribute self, 'program'

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
#    say n
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

.sub func_LOAD :method
    .param pmc tokenizer

    .local pmc arg
    arg = self.evaluate(tokenizer)
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
    .local pmc program
    program = getattribute self, 'program'
    .local string filename
    filename = arg
    program.load(filename)

    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'Integer'
    aux = .EXCEPT_NORMAL
    setattribute excep, 'severity', aux
    .local pmc line
    line = new 'Integer'
    line = -1
    setattribute excep, 'payload', line
    throw excep

fail:
    SyntaxError()
.end

.sub func_PRINT :method
    .param pmc tokenizer

    .local pmc arg

    arg = tokenizer.get()
    $I0 = defined arg
    unless $I0 goto endline

item:
    arg = self.evaluate(tokenizer, arg)
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

.sub func_REM :method
    .param pmc tokenizer

    # Do nothing
.end

.sub func_RETURN :method
    .param pmc tokenizer

    .local pmc stack
    stack = getattribute self, 'stack'
    $P0 = pop stack

    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'Integer'
    aux = .EXCEPT_NORMAL
    setattribute excep, 'severity', aux
    .local pmc line
    line = new 'Jump'
    $P1 = new 'Integer'
    $P1 = 2
    setattribute line, 'jumpline', $P0
    setattribute line, 'jumptype', $P1
    setattribute excep, 'payload', line

    throw excep
fail:
    SyntaxError()
.end

.sub func_RUN :method
    .param pmc tokenizer

    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'Integer'
    aux = .EXCEPT_NORMAL
    setattribute excep, 'severity', aux
    .local pmc line
    line = new 'Jump'
    $P0 = new 'Integer'
    $P0 = 0
    setattribute line, 'jumpline', $P0
    setattribute excep, 'payload', line
    throw excep
.end

.sub func_SAVE :method
    .param pmc tokenizer

    .local pmc arg
    arg = self.evaluate(tokenizer)
    $P1 = tokenizer.get()
    $I1 = defined $P1
    if $I1 goto fail

    .local string filename
    filename = arg
    .local pmc program
    program = getattribute self, 'program'
    program.save(filename)

    .return()

fail:
    SyntaxError()
.end

.sub func_TROFF :method
    .param pmc tokenizer

    self.trace(0)
.end

.sub func_TRON :method
    .param pmc tokenizer

    self.trace(1)
.end

########################################################################

.namespace [ 'Tokenizer' ]

#-----------------------------------------------------------------------
.sub 'newTokenizer'
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
    eq c, '?', operator

    eq c, '"', str
    $I0 = ord c
    $I1 = ord '9'
    gt $I0, $I1, nextchar
    $I1 = ord '0'
    lt $I0, $I1, nextchar

# Number
    .local string snum
    snum = ''

    concat snum, c
    #say value
nextnum:
    ge i, l, endnum
    c = substr line, i, 1
    eq c, '.', floatnum
    $I0 = ord c
    $I1 = ord '9'
    gt $I0, $I1, endnum
    $I1 = ord '0'
    lt $I0, $I1, endnum
    inc i

    concat snum, c
    #say value
    goto nextnum
endnum:
    .local int value
    value = snum
    objres = new 'Integer'
    objres = value
    goto doit

floatnum:
    concat snum, c
    inc i
nextfloat:
    ge i, l, endfloat
    c = substr line, i, 1
    $I0 = ord c
    $I1 = ord '9'
    gt $I0, $I1, endfloat
    $I1 = ord '0'
    lt $I0, $I1, endfloat
    inc i
    concat snum, c
    goto nextfloat

endfloat:
    .local num floatvalue
    #say snum
    floatvalue = snum
    objres = new 'Float'
    objres = floatvalue
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

    # say 'Program.init'

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

#-----------------------------------------------------------------------
.sub deleteline :method
    .param int linenum
    .local pmc text, lines
    .local int n, i, j, curnum
    text = getattribute self, 'text'
    lines = getattribute self, 'lines'
    n = lines
    i = 0
next:
    ge i, n, notexist
    curnum = lines [i]
    ge curnum, linenum, foundnum
    inc i
    goto next
foundnum:
    gt i, n, notexist
    delete text[linenum]
    delete lines[i]
    .return()
notexist:

.end

#-----------------------------------------------------------------------
.sub load :method
    .param string filename

    .local pmc file
    .local string line
    .local pmc tokenizeline
    .local pmc token
    .local int linenum
    .local int linecount

    say filename
    open file, filename, '<'

    linecount = 0
nextline:
    line = readlinebas(file)
    unless line goto eof
    unless linecount == 0 goto enterline
    $S0 = substr line, 0, 1
    if $S0 == '#' goto nextline
enterline:
    inc linecount
    tokenizeline = newTokenizer(line)
    token = tokenizeline.get()
    linenum = token
    unless linenum goto fail
    line = tokenizeline.getall()
    self.storeline(linenum, line)
    goto nextline

eof:
    close file
    $I0 = self.elements()
    unless $I0 == linecount goto fatal
    .return()

fail:
    SyntaxError()
fatal:
    FatalError('Incorrect count when loading file')
.end

#-----------------------------------------------------------------------
.sub save :method
    .param string filename

    .local pmc file
    .local pmc program

    open file, filename, '>'

    $P0 = self.begin()
next:
    unless $P0, finish
    shift $S0, $P0
    $S1 = self [$S0]
    print file, $S0
    print file, ' '
    print file, $S1
    print file, "\n"
    goto next
finish:
    close file
.end

########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
