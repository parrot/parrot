# Copyright (C) 2008, Parrot Foundation.
# $Id$
#
# pirric.pir
# A rudimentary old style Basic interpreter for parrot
# This is a proof of concept version, don't blame for redundant code
# and other ugliness
#
# pirric is PIR Retro basIC
#
# Only one instruction per line.
#
# Instructions implemented:
# - Flow control: GOTO, GOSUB, RETURN, RUN, END, STOP, CONT, EXIT
# - Conditional: IF/ELSE
# - Loop: FOR/NEXT
# - Programming: LIST, LOAD, SAVE
# - Debugging: TRON, TROFF
# - Input/Output: PRINT
# - Error control: ERROR, ON ERROR GOTO, ON ERROR EXIT
# - Miscellaneous: REM, CLEAR
# - Variables: varname = expression
# - Access to parrot modules: LOAD "module name" , B
#
# Shorthands:
# - ? -> PRINT
#
# Expressions:
# - Operators: + - * / < > = unary+ unary- MOD ^
# - Predefined numeric functions: COMPLEX, SQR, EXP, LN, SIN, COS, TAN, ASIN, ACOS, ATAN, SINH, COSH, TANH
# - Predefined string functions: CHR$, ASC, LEN, LEFT$, RIGHT$, MID$
# - Parenthesis
# - Indexing with [ ]
# - Special functions: NEW, ISA, COMPREG, GETPARROTINTERP
# - Calls to methods in foreign objects
# - Calls to functions in foreign namespaces
#
# Command line options:
# -d Parrot debugger mode. Jumps to the debugger after each
#    TRON line inform and after the 'Ready' prompt.
# -t Trace on. Same as the TRON instruction
# -p all remaining arguments are executed as PRINT instructions
#-----------------------------------------------------------------------

.include 'iterator.pasm'
.include 'except_severity.pasm'
.include 'except_types.pasm'
.include 'cclass.pasm'

.include 'warnings.pasm'

.loadlib 'io_ops'
.loadlib 'debug_ops'
.loadlib 'trans_ops'

#-----------------------------------------------------------------------

.sub pirric_aux_loadbytecode
    .param string bcname
    load_bytecode bcname
.end

.HLL 'parrot'

#-----------------------------------------------------------------------

.const int PIRRIC_ERROR_NORMAL = 0
.const int PIRRIC_ERROR_EXIT = 1
.const int PIRRIC_ERROR_GOTO = 2

#-----------------------------------------------------------------------
.sub init :load :init

    warningson .PARROT_WARNINGS_DEPRECATED_FLAG

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
    addattribute runnerclass, 'exitcode'
    addattribute runnerclass, 'errormode'
    addattribute runnerclass, 'errorvalue'
    addattribute runnerclass, 'curline'
    addattribute runnerclass, 'vars'
    addattribute runnerclass, 'stack'
    addattribute runnerclass, 'debugger'
    addattribute runnerclass, 'tron'

    $P0 = get_class 'String'
    cl = newclass 'Literal'
    addparent cl, $P0
    set_global 'Literal', cl

    .local pmc keywords, methods
    # Get methods hash to verify
    methods = inspect runnerclass, 'methods'
    keywords = new 'Hash'
    setkeyword(methods, keywords, 'CLEAR')
    setkeyword(methods, keywords, 'CONT')
    setkeyword(methods, keywords, 'END')
    setkeyword(methods, keywords, 'EXIT')
    setkeyword(methods, keywords, 'ERROR')
    setkeyword(methods, keywords, 'FOR')
    setkeyword(methods, keywords, 'GOSUB')
    setkeyword(methods, keywords, 'GOTO')
    setkeyword(methods, keywords, 'IF')
    setkeyword(methods, keywords, 'LIST')
    setkeyword(methods, keywords, 'LOAD')
    setkeyword(methods, keywords, 'NEXT')
    setkeyword(methods, keywords, 'NEW')
    setkeyword(methods, keywords, 'ON')
    setkeyword(methods, keywords, 'PRINT')
    setkeyword(methods, keywords, 'REM')
    setkeyword(methods, keywords, 'RETURN')
    setkeyword(methods, keywords, 'RUN')
    setkeyword(methods, keywords, 'SAVE')
    setkeyword(methods, keywords, 'STOP')
    setkeyword(methods, keywords, 'TROFF')
    setkeyword(methods, keywords, 'TRON')
    set_global 'keywords', keywords

    .local pmc predefs
    predefs = new 'Hash'
    setpredef(methods, predefs, 'NEW')
    setpredef(methods, predefs, 'ISA')
    setpredef(methods, predefs, 'GETPARROTINTERP')
    setpredef(methods, predefs, 'CHR$', 'CHR_S')
    setpredef(methods, predefs, 'ASC')
    setpredef(methods, predefs, 'LEN')
    setpredef(methods, predefs, 'LEFT$', 'LEFT_S')
    setpredef(methods, predefs, 'RIGHT$', 'RIGHT_S')
    setpredef(methods, predefs, 'MID$', 'MID_S')
    setpredef(methods, predefs, 'COMPLEX')
    setpredef(methods, predefs, 'COMPREG')
    setpredef(methods, predefs, 'EXP')
    setpredef(methods, predefs, 'LN')
    setpredef(methods, predefs, 'SIN')
    setpredef(methods, predefs, 'SINH')
    setpredef(methods, predefs, 'COS')
    setpredef(methods, predefs, 'COSH')
    setpredef(methods, predefs, 'TAN')
    setpredef(methods, predefs, 'TANH')
    setpredef(methods, predefs, 'ASIN')
    setpredef(methods, predefs, 'ACOS')
    setpredef(methods, predefs, 'ATAN')
    setpredef(methods, predefs, 'SQR')
    set_global 'predefs', predefs

# Create classes for control flow exceptions

    .local pmc pircontrol
    pircontrol = newclass ['pircontrol']

    .local pmc basejump
    basejump = subclass pircontrol, ['basejump']
    addattribute basejump, 'jumpline'

    .local pmc endclass
    endclass = subclass pircontrol, ['End']

    .local pmc exitclass
    exitclass = subclass pircontrol, ['Exit']

    .local pmc returnclass
    returnclass = subclass pircontrol, ['Return']

    .local pmc nextclass
    nextclass = subclass basejump, ['Next']

    .local pmc jumpclass
    jumpclass = subclass basejump, ['Jump']
    addattribute jumpclass, 'jumptype'

    .local pmc stopclass
    stopclass = subclass pircontrol, ['Stop']

    .local pmc contclass
    stopclass = subclass pircontrol,['Cont']

    .local pmc forclass
    forclass = subclass basejump, ['For']
    addattribute forclass, 'controlvar'
    addattribute forclass, 'increment'
    addattribute forclass, 'limit'
.end

#-----------------------------------------------------------------------
.sub main :main
    .param pmc args

    .local pmc program
    program = new ['Program']

    .local pmc runner
    runner = new ['Runner']
    setattribute runner, 'program', program

    $I0 = args
    $I1 = 1
read_args:
    le $I0, $I1, no_prog
    .local string arg
    arg = args[$I1]
    if arg == '-d' goto opt_debugger
    if arg == '-t' goto opt_tron
    if arg == '-p' goto print_items

    #say arg
    program.'load'(arg)

    $I0 = 1
    goto start

opt_debugger:
    debug_init
    runner.'debugger'()
    inc $I1
    goto read_args

opt_tron:
    runner.'trace'(1)
    inc $I1
    goto read_args

print_items:
    .local pmc tokenizer
    inc $I1
    le $I0, $I1, print_end
    $S9 = args [$I1]
    tokenizer = newTokenizer($S9)
    runner.'func_PRINT'(tokenizer)
    null tokenizer
    goto print_items
print_end:
    exit 0

no_prog:
    $I0 = 0
start:
    $I1 = runner.'runloop'($I0)
    exit $I1
.end

#-----------------------------------------------------------------------
.sub setkeyword
    .param pmc methods
    .param pmc keywords
    .param string key

    .local string funcname
    funcname = concat 'func_', key

    .local pmc func
    func = methods[funcname]
    $I0 = defined func
    if $I0 goto good
    print funcname
    die ': No func!'
    exit 1
good:
    keywords [key] = func
.end

#-----------------------------------------------------------------------
.sub setpredef
    .param pmc methods
    .param pmc predefs
    .param string key
    .param string name :optional
    .param int has_name :opt_flag

    if has_name goto setfuncname
    name = key
setfuncname:
    .local string funcname
    funcname = concat 'predef_', name

    .local pmc func
    func = methods[funcname]
    $I0 = defined func
    if $I0 goto good
    print funcname
    say ': no func!'
    exit 1
good:
    predefs [key] = func
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
.sub UserError
    .param string msg

    .local pmc excep, message, severity
    message = new 'String'
    message = 'ERROR: '
    concat message, msg
    severity = new 'Integer'
    severity = .EXCEPT_ERROR
    excep = new 'Exception'
    setattribute excep, 'message', message
    setattribute excep, 'severity', severity
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
.sub VarNotDefined
    .local pmc excep
    excep = new 'Exception'
    .local pmc aux
    aux = new 'String'
    aux = 'Variable not found'
    setattribute excep, 'message', aux
    aux = new 'Integer'
    aux = .EXCEPT_ERROR
    setattribute excep, 'severity', aux
    throw excep
.end

#-----------------------------------------------------------------------
.sub readlinebas
    .param pmc file
    .param int interactive :optional

    .local string line

    if interactive goto read_inter
    line = readline file
    goto read_done
read_inter:
    line = file.'readline_interactive'()
read_done:

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
    $P0 = new 'Integer'
    $P0 = 0
    setattribute self, 'debugger', $P0
    $P1 = new 'ResizablePMCArray'
    setattribute self, 'stack', $P1
    $P2 = new 'Integer'
    $P2 = PIRRIC_ERROR_NORMAL
    setattribute self, 'errormode', $P2
    $P3 = new 'Integer'
    setattribute self, 'errorvalue', $P3
    $P4 = new 'Integer'
    setattribute self, 'exitcode', $P4

    self.'clear_vars'()
.end

#-----------------------------------------------------------------------
.sub clear_vars :method
    .local pmc vars
    vars = new 'Hash'
    setattribute self, 'vars', vars
.end

#-----------------------------------------------------------------------
.sub get_var :method
    .param string varname

    .local pmc vars, var
    vars = getattribute self, 'vars'
    varname = upcase varname
    var = vars[varname]
    .return(var)
.end

#-----------------------------------------------------------------------
.sub set_var :method
    .param string varname
    .param pmc value

    .local pmc vars, var
    vars = getattribute self, 'vars'
    varname = upcase varname
    vars[varname] = value
.end

#-----------------------------------------------------------------------
.sub set_error_exit :method
    .param int code

    $P0 = getattribute self, 'errormode'
    $P0 = PIRRIC_ERROR_EXIT
    $P1 = getattribute self, 'errorvalue'
    $P1 = code
.end

#-----------------------------------------------------------------------
.sub set_error_goto :method
    .param int code

    .local int newmode
    newmode = PIRRIC_ERROR_GOTO
    ne code, 0, setmode
    # ON ERROR GOTO 0 means use default error handling
    newmode = PIRRIC_ERROR_NORMAL
setmode:
    $P0 = getattribute self, 'errormode'
    $P0 = newmode
    $P1 = getattribute self, 'errorvalue'
    $P1 = code
.end

#-----------------------------------------------------------------------
.sub clear_all :method
    .local pmc stack

    self.'clear_vars'()
    stack = getattribute self, 'stack'
    stack = 0
.end

#-----------------------------------------------------------------------
.sub set_program :method
    .param pmc program

    setattribute self, 'program', program
.end

#-----------------------------------------------------------------------
.sub getcurline :method
    $P0 = getattribute self, 'curline'
    $S0 = $P0
    .return($S0)
.end

#-----------------------------------------------------------------------
.sub debugger :method
    $P0 = getattribute self, 'debugger'
    $P0 = 1
.end

#-----------------------------------------------------------------------
.sub trace :method
    .param int level

    $P0 = getattribute self, 'tron'
    $P0 = level
.end

#-----------------------------------------------------------------------
.sub get_numeric_arg :method
    .param pmc tokenizer

    .local pmc arg

    arg = self.'evaluate'(tokenizer)
    $P0 = tokenizer.'get'()
    $I0 = defined $P0
    unless $I0 goto fail
    ne $P0, ')', fail

    $I0 = isa arg, 'Integer'
    unless $I0 goto done
    $I0 = arg
    $N0 = $I0
    arg = new 'Float'
    arg = $N0
done:
    .return(arg)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub get_1_arg :method
    .param pmc tokenizer

    .local pmc arg

    arg = self.'evaluate'(tokenizer)
    $P0 = tokenizer.'get'()
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

    arg1 = self.'evaluate'(tokenizer)
    $P0 = tokenizer.'get'()
    if_null $P0, fail
    $I0 = defined $P0
    unless $I0 goto fail
    ne $P0, ',', fail
    arg2 = self.'evaluate'(tokenizer)
    $P0 = tokenizer.'get'()
    if_null $P0, fail
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
    token = tokenizer.'get'()
    $I0 = defined token
    unless $I0 goto fail
    eq token, ')', empty
    null arg
    arg = self.'evaluate'(tokenizer, token)
nextarg:
    push args, arg
    null arg
    delim = tokenizer.'get'()
    if_null delim, fail
    $I0 = defined delim
    unless $I0 goto fail
    eq delim, ')', endargs
    ne delim, ',', fail
    arg = self.'evaluate'(tokenizer)
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
.sub predef_NEW :method
    .param pmc tokenizer

    .local pmc args
    .local int nargs
    .local string name
    .local pmc obj

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    args = self.'get_args'(tokenizer)
    $I0 = defined args
    unless $I0 goto fail
    nargs = args
    name = args [0]
    #print 'NEW: '
    #say name
    eq nargs, 1, noarg

    .local pmc arg1
    arg1 = args [1]
    #say arg1

    obj = new name, arg1

    goto done
noarg:
    obj = new name
done:
    .return(obj)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_ISA :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    ($P1, $P2) = self.'get_2_args'(tokenizer)
    $I0 = isa $P1, $P2
    $P0 = new 'Integer'
    $P0 = $I0
    .return($P0)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------

.sub predef_GETPARROTINTERP :method
    .param pmc tokenizer

    $P0 = getinterp
    .return($P0)
.end

#-----------------------------------------------------------------------
.sub predef_CHR_S :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_1_arg'(tokenizer)

    $I0 = $P2
    $S0 = chr $I0
    $I1 = find_encoding 'utf8'
    $S0 = trans_encoding $S0, $I1
    $P3 = new 'String'
    $P3 = $S0
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_ASC :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_1_arg'(tokenizer)

    $S0 = $P2
    $I0 = ord $S0
    $P3 = new 'Integer'
    $P3 = $I0
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_LEN :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    null $P5
    $P5 = self.'get_1_arg'(tokenizer)

    $S5 = $P5
    $I0 = length $S5
    $P6 = new 'Integer'
    $P6 = $I0
    .return($P6)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_LEFT_S :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    null $P5
    null $P6
    ($P5, $P6) = self.'get_2_args'(tokenizer)

    $S0 = $P5
    $I0 = $P6
    $S1 = substr $S0, 0, $I0
    $P7 = new 'String'
    $P7 = $S1
    .return($P7)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_RIGHT_S :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    null $P5
    null $P6
    ($P5, $P6) = self.'get_2_args'(tokenizer)

    $S0 = $P5
    $I0 = $P6
    $I1 = $S0
    $I0 = $I1 - $I0
    $S1 = substr $S0, $I0
    $P7 = new 'String'
    $P7 = $S1
    .return($P7)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_MID_S :method
    .param pmc tokenizer

    $P0 = tokenizer.'get'()
    ne $P0, '(', fail
    $P1 = self.'get_args'(tokenizer)
    $I0 = $P1
    lt $I0, 2, fail
    gt $I0, 3, fail
    $S0 = $P1[0]
    $I1 = $P1[1]
    dec $I1
    lt $I0, 3, mid_nolen
    $I2 = $P1[2]
    $S1 = substr $S0, $I1, $I2
    goto mid_result
mid_nolen:
    $S1 = substr $S0, $I1
mid_result:
    $P2 = new 'String'
    $P2 = $S1
    .return($P2)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_COMPLEX :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    null $P5
    null $P6
    ($P5, $P6) = self.'get_2_args'(tokenizer)
    $P7 = new 'Complex'
    $N5 = $P5
    $N6 = $P6
    $P7[0] = $N5
    $P7[1] = $N6
    .return($P7)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_COMPREG :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_1_arg'(tokenizer)
    $S1 = $P2
    $P3 = compreg $S1
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_EXP :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'exp'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_LN :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'ln'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_SIN :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'sin'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_SINH :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'sinh'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_COS :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'cos'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_COSH :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'cosh'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_TAN :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'tan'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_TANH :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'tanh'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_ASIN :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'asin'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_ACOS :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'acos'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_ATAN :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'atan'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub predef_SQR :method
    .param pmc tokenizer

    $P1 = tokenizer.'get'()
    ne $P1, '(', fail
    $P2 = self.'get_numeric_arg'(tokenizer)
    $P3 = $P2.'sqrt'()
    .return($P3)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub get_args_and_call :method
    .param pmc tokenizer
    .param pmc fun

    .local pmc args, result

    args = self.'get_args'(tokenizer)
    $I0 = defined args
    unless $I0 goto emptyargs
    result = fun(args :flat)
    goto done
emptyargs:
    result = fun()
done:
    .return(result)
.end

#-----------------------------------------------------------------------
.sub eval_base :method
    .param pmc tokenizer
    .param pmc token :optional

    .local pmc arg
    .local pmc args

    $I0 = defined token
    if $I0 goto check
    token = tokenizer.'get'()
check:
    $I0 = defined token
    unless $I0 goto fail

    eq token, '(', parenexp

    $I0 = isa token, 'Literal'
    if $I0 goto isliteral
    $I0 = isa token, 'Integer'
    if $I0 goto isinteger
    $I0 = isa token, 'Float'
    if $I0 goto isfloat
    $I0 = isa token, 'String'
    unless $I0 goto fail

    $S0 = token
    $S0 = upcase $S0
    #print $S0

# Some predefined functions:
    .local pmc predefs
    predefs = get_hll_global 'predefs'
    .local pmc func
    func = predefs[$S0]
    $I0 = defined func
    unless $I0 goto no_predef

    $P0 = self.func(tokenizer)
    .return($P0)

no_predef:

    #say $S0
    .local pmc var
    var = self.'get_var'($S0)

    unless_null var, getvar

    $P0 = get_namespace token
    $I0 = defined $P0
    if $I0 goto spaced
    $P0 = get_root_namespace token
    $I0 = defined $P0
    if $I0 goto spaced

    $P1 = tokenizer.'get'()
    $S1 = $P1
    ne $S1, '(', var_not_defined

    $S0 = token
    #say $S0
    var = get_hll_global $S0
    if_null var, fail
    args = self.'get_args'(tokenizer)
    $P9 = var(args)
    .return($P9)

spaced:
    # say "namespace"

    $P1 = tokenizer.'get'()
    ne $P1, '.', fail
    $P1 = tokenizer.'get'()
    $S1 = $P1
    $P2 = $P0 [$S1]

    $P4 = tokenizer.'get'()
    eq $P4, '(', getargs
    tokenizer.'back'()

    .return($P2)

isliteral:
    .return(token)

isinteger:
    .return(token)

isfloat:
    .return(token)

getargs:
    args = self.'get_args'(tokenizer)
    $I0 = defined args
    unless $I0 goto emptyargs
endargs:
    $P3 = $P2(args :flat)
    .return($P3)
emptyargs:
    $P3 = $P2()
    .return($P3)

getvar:
    $P2 = tokenizer.'get'()
    if_null $P2, donevar
    eq $P2, '.', dotted
    eq $P2, '(', isfunctor
    tokenizer.'back'()
donevar:
    .return(var)

isfunctor:
    #say 'Functor'

    $P3 = self.'get_args_and_call'(tokenizer, var)
    .return($P3)


dotted:
    $P3 = tokenizer.'get'()
    $P4 = tokenizer.'get'()
    eq $P4, '(', methodcall
    tokenizer.'back'()

    $S1 = $P3
    $P5 = getattribute token, $S1
    .return($P5)

methodcall:
    $S2 = $P3
    #say $S2

    .local pmc methargs
    methargs = self.'get_args'(tokenizer)
    $I0 = defined methargs
    unless $I0 goto memptyargs
    $P5 = var.$S2(methargs :flat)
    .return($P5)

memptyargs:
    $P2 = var.$S2()
    .return($P2)

parenexp:
    $P1 = self.'evaluate'(tokenizer)
    token = tokenizer.'get'()
    ne token, ')', fail
    .return($P1)

var_not_defined:
    VarNotDefined()

fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub eval_base_1 :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.'eval_base'(tokenizer, token)
again:
    $P1 = tokenizer.'get'()
    if_null $P1, done
    $I0 = defined $P1
    unless $I0 goto done
    eq $P1, '[', keyit
    tokenizer.'back'()
done:
    .return($P0)
keyit:
    $P2 = self.'evaluate'(tokenizer)
    $P1 = tokenizer.'get'()
    if_null $P1, fail
    eq $P1, ']', last
    ne $P1, ',', fail
    $P3 = $P0 [$P2]
    null $P2
    null $P0
    $P0 = $P3
    null $P3
    goto keyit
last:
    $P3 = $P0 [$P2]
    null $P0
    $P0 = $P3
    null $P3
    goto again
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub eval_pow :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.'eval_base_1'(tokenizer, token)
more:
    $P1 = tokenizer.'get'()
    if_null $P1, done
    eq $P1, '^', dopow
    tokenizer.'back'()
done:
    .return($P0)
dopow:
    $P2 = self.'eval_unary'(tokenizer)
    null $P3
    $P3 = pow $P0, $P2
    set $P0, $P3
    null $P2
    goto more
.end

#-----------------------------------------------------------------------
.sub eval_mod :method
    .param pmc tokenizer
    .param pmc token :optional
    $P0 = self.'eval_pow'(tokenizer, token)
more:
    $P1 = tokenizer.'get'()
    if_null $P1, done
    eq $P1, 'MOD', domod
    tokenizer.'back'()
done:
    .return($P0)
domod:
    $P2 = self.'eval_pow'(tokenizer)
    $P3 = clone $P0
    mod $P3, $P2
    set $P0, $P3
    goto more
.end

#-----------------------------------------------------------------------
.sub eval_unary :method
    .param pmc tokenizer
    .param pmc token :optional

    $I0 = defined token
    if $I0 goto check
    token = tokenizer.'get'()
    $I0 = defined token
    unless $I0 goto fail
check:
# Quick fix to MMD problem
    $I0 = isa token, 'Literal'
    if $I0 goto notoken

    eq token, '-', unaryminus
    eq token, '+', unaryplus
notoken:
    $P0 = self.'eval_mod'(tokenizer, token)
    .return($P0)
unaryplus:
    $P0 = self.'eval_unary'(tokenizer)
    .return($P0)
unaryminus:
    $P0 = self.'eval_unary'(tokenizer)
    $P1 = clone $P0
    $P1 = 0
    $P1 = $P1 - $P0
    .return($P1)
fail:
    SyntaxError()
.end

#-----------------------------------------------------------------------
.sub eval_mul :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.'eval_unary'(tokenizer, token)
more:
    $P1 = tokenizer.'get'()
    if_null $P1, done
    eq $P1, '*', domul
    eq $P1, '/', dodiv
    tokenizer.'back'()
done:
    .return($P0)
domul:
    $P2 = self.'eval_unary'(tokenizer)
    $P3 = clone $P0
    mul $P3, $P2
    set $P0, $P3
    goto more
dodiv:
    $P2 = self.'eval_unary'(tokenizer)
    $P3 = clone $P0
    div $P3, $P2
    set $P0, $P3
    goto more
.end

#-----------------------------------------------------------------------
.sub eval_add :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.'eval_mul'(tokenizer, token)
more:
    $P1 = tokenizer.'get'()
    if_null $P1, done
    eq $P1, '+', doadd
    eq $P1, '-', dosub
    tokenizer.'back'()
done:
    .return($P0)

doadd:
    $P2 = self.'eval_mul'(tokenizer)
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
    $P2 = self.'eval_mul'(tokenizer)
    clone $P3, $P0
    sub $P3, $P2
    set $P0, $P3
    goto more
.end

#-----------------------------------------------------------------------
.sub eval_comp :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.'eval_add'(tokenizer, token)
more:
    $P1 = tokenizer.'get'()
    if_null $P1, done
    eq $P1, '=', doequal
    eq $P1, '<', doless
    eq $P1, '>', dogreat
    tokenizer.'back'()
done:
    .return($P0)
doequal:
    $P2 = self.'eval_add'(tokenizer)
    set $P3, $P0
    $I0 = iseq $P3, $P2
    goto next
doless:
    $P2 = self.'eval_add'(tokenizer)
    set $P3, $P0
    $I0 = islt $P3, $P2
    goto next
dogreat:
    $P2 = self.'eval_add'(tokenizer)
    set $P3, $P0
    $I0 = isgt $P3, $P2
next:
    null $P0
    $P0 = new 'Integer'
    set $P0, $I0
    goto more
.end

#-----------------------------------------------------------------------
.sub evaluate :method
    .param pmc tokenizer
    .param pmc token :optional

    $P0 = self.'eval_comp'(tokenizer, token)
#    $I0 = isa $P0, 'Integer'
#    unless $I0 goto done
#    say '<Integer'
#done:
    .return($P0)
.end

#-----------------------------------------------------------------------
.sub findline :method
    .param int linenum

    .local pmc program
    program = getattribute self, 'program'
    .local pmc iter
    iter = program.'begin'()

    .local int fline
nextline:
    unless iter goto noline
    shift fline, iter
    gt fline, linenum, noline
    lt fline, linenum, nextline
    .return(iter)
noline:
    null iter
    .return(iter)
.end

#-----------------------------------------------------------------------
.sub runloop :method
    .param int start :optional

    .local pmc program
    .local pmc stack
    .local pmc iter
    .local pmc debugger
    .local pmc tron
    .local pmc pircontrol
    .local int stopline
    .local int curline
    .local pmc pcurline
    .local int target

    pircontrol = get_class ['pircontrol']

    program = getattribute self, 'program'
    stack = getattribute self, 'stack'

    tron = getattribute self, 'tron'
    debugger = getattribute self, 'debugger'
    stopline = 0

    pcurline = new 'Integer'
    setattribute self, 'curline', pcurline

    iter = program.'begin'()

    push_eh handle_excep

    curline = 0

    unless start goto next
    shift curline, iter

next:
    if curline goto runit
    self.'interactive'()
    goto next

runit:
    pcurline = curline
    unless tron goto executeline
    print '['
    print curline
    print ']'

    unless debugger goto executeline
    debug_break

executeline:
    program = getattribute self, 'program'
    $S1 = program [curline]

    .local pmc tokenizer
    tokenizer = newTokenizer($S1)
    self.'execute'(tokenizer)
    unless iter goto endprog
    shift curline, iter
    goto next
endprog:
    curline = 0
    goto next

handle_excep:
    .local pmc excep, type, severity
    .local int itype
    .get_results(excep)

    type = getattribute excep, 'type'
    itype = type
    severity = getattribute excep, 'severity'
    eq severity, .EXCEPT_EXIT, finish

    eq itype, .CONTROL_RETURN, handle_return

    $P1 = getattribute excep, 'payload'
    $I1 = defined $P1
    unless $I1 goto unhandled
    $I1 = isa $P1, pircontrol
    unless $I1 goto unhandled

    $I1 = isa $P1, 'Jump'
    if $I1 goto handle_jump
    $I1 = isa $P1, 'Next'
    if $I1 goto handle_next
    $I1 = isa $P1, 'Return'
    if $I1 goto handle_return
    $I1 = isa $P1, 'Stop'
    if $I1 goto handle_stop
    $I1 = isa $P1, 'Cont'
    if $I1 goto handle_cont
    $I1 = isa $P1, 'End'
    if $I1 goto prog_end
    $I1 = isa $P1, 'Exit'
    if $I1 goto finish
    FatalError('Unhandled control type')

handle_stop:
    print 'Stopped'
    goto linenum_msg

handle_cont:
    unless stopline goto cannot_cont
    iter = self.'findline'(stopline)
    shift curline, iter
    stopline = 0
    push_eh handle_excep
    goto next
cannot_cont:
    print 'Cannot CONTinue'
    goto linenum_msg

handle_jump:
    $P2 = getattribute $P1, 'jumpline'
    $I1 = $P2
    eq $I1, 0, prog_end
    eq $I1, -1, prog_end

    $S2 = curline
    target = $P2

do_jump:
    iter = self.'findline'(target)
    if_null iter, noline
    curline = target

    $P3 = getattribute $P1, 'jumptype'
    $I1 = defined $P3
    unless $I1 goto handled_jump
    eq $P3, 1, handle_gosub
    goto handled_jump

handle_gosub:
    push stack, $S2
    goto handled_jump

handle_next:
    $P2 = getattribute $P1, 'jumpline'
    $I1 = $P2
    iter = self.'findline'($I1)
    curline = shift iter

handled_jump:
    push_eh handle_excep
    goto runit

handle_return:
    .local pmc stack
    stack = getattribute self, 'stack'
    $I0 = stack
    unless $I0 goto no_gosub
    $P0 = pop stack
    curline = $P0
    iter = self.'findline'(curline)
    curline = shift iter
    #say curline
    push_eh handle_excep
    goto next
no_gosub:
    print 'RETURN without GOSUB'
    goto linenum_msg

prog_end:
    curline = 0
    null iter
    push_eh handle_excep
    goto next

unhandled:
    $P3 = getattribute self, 'errormode'
    $I0 = $P3
    eq $I0, PIRRIC_ERROR_GOTO, goto_error
    ne $I0, PIRRIC_ERROR_NORMAL, exit_error
    $P1 = getattribute excep, 'message'
    print $P1
    goto linenum_msg
exit_error:
    $P4 = getattribute self, 'errorvalue'
    $I0 = $P4
    $P5 = getattribute self, 'exitcode'
    $P5 = $I0
    goto finish
goto_error:
    $P4 = getattribute self, 'errorvalue'
    $I1 = PIRRIC_ERROR_NORMAL
    $P3 = $I1
    $I0 = $P4
    iter = self.'findline'($I0)
    if_null iter, noline
    curline = $I0
    push_eh handle_excep
    goto runit

noline:
    print 'Line does not exist'

linenum_msg:
    unless curline goto endmsg
    print ' in '
    print curline
endmsg:
    say ''
    curline = 0
    push_eh handle_excep
    goto next

finish:
    $P9 = getattribute self, 'exitcode'
    $I0 = $P9
    .return($I0)
.end

#-----------------------------------------------------------------------
.sub interactive :method
    .local pmc stdin
    stdin = getstdin
    .local pmc program
    program = getattribute self, 'program'
    .local string line
    .local pmc debugger
    debugger = getattribute self, 'debugger'

    say 'Ready'

reinit:
    unless debugger goto doreadline
    debug_break
doreadline:
    line = readlinebas(stdin, 1)

    .local pmc tokenizer
    .local pmc token

    tokenizer = newTokenizer(line)
    token = tokenizer.'get'()
    if_null token, reinit
    $I0 = isa token, 'Integer'
    unless $I0 goto execute

# Have line number: if has content store it, else delete
    $I0 = token
    line = tokenizer.'getall'()
    $I1 = length line
    unless $I1 goto deleteit

    program.'storeline'($I0, line)
    goto reinit

deleteit:
    program.'deleteline'($I0)
    goto reinit

execute:
    self.'execute'(tokenizer, token)
.end

#-----------------------------------------------------------------------
.sub execute :method
    .param pmc tokenizer
    .param pmc token :optional
    .param int has :opt_flag

    if has goto check
    token = tokenizer.'get'()
check:
    unless token goto next

    .local string key
    key = token
    unless key == '?' goto findkey
    key = 'PRINT'

findkey:
    key = upcase key
    .local pmc keywords
    keywords = get_hll_global 'keywords'
    $I0 = keywords
    .local pmc func
    func = keywords [key]
    $I0 = defined func
    if $I0 goto exec

    .local pmc op
    op = tokenizer.'get'()
    eq op, '=', assign
    eq op, '[', keyed
    goto fail
assign:
    .local pmc value
    value = self.'evaluate'(tokenizer)
    self.'set_var'(key, value)

    goto next
keyed:
    .local pmc obj, index, auxobj
    obj = self.'get_var'(key)
keyed_next:
    index = self.'evaluate'(tokenizer)
    op = tokenizer.'get'()
    if_null op, fail
    eq op, ']', last
    ne op, ',', fail
    auxobj = obj[index]
    null index
    null obj
    obj = auxobj
    null auxobj
    goto keyed_next
last:
    op = tokenizer.'get'()
    ne op, '=', fail
    value = self.'evaluate'(tokenizer)
    obj[index] = value
    goto next
fail:
    SyntaxError()
exec:
    self.func(tokenizer)
next:
.end

#-----------------------------------------------------------------------
.sub throw_typed
    .param pmc payload
    .param int type :optional
    .param int has_type :opt_flag

    .local pmc excep, ex_severity
    excep = new 'Exception'
    ex_severity = new 'Integer'
    ex_severity= .EXCEPT_NORMAL
    unless has_type goto setattrs
    .local pmc ex_type
    ex_type = new 'Integer'
    ex_type = type
    setattribute excep, 'type', ex_type
setattrs:
    setattribute excep, 'severity', ex_severity
    setattribute excep, 'payload', payload
    throw excep
.end

#-----------------------------------------------------------------------
.sub throw_jump
    .param pmc payload
    .param int jumpline

    $P0 = new 'Integer'
    $P0 = jumpline
    setattribute payload, 'jumpline', $P0

    throw_typed(payload)
.end

#-----------------------------------------------------------------------
.sub func_CLEAR :method
    .param pmc tokenizer

    self.'clear_all'()
.end

.sub func_CONT :method
    .param pmc tokenizer

    .local pmc cont
    cont = new 'Cont'
    throw_typed(cont)
.end

.sub func_END :method
    .param pmc tokenizer

    .local pmc end
    end = new 'End'
    throw_typed(end)
.end

.sub func_EXIT :method
    .param pmc tokenizer

    .local pmc ex_exit
    ex_exit = new 'Exit'
    throw_typed(ex_exit)
.end

.sub func_ERROR :method
    .param pmc tokenizer

    .local pmc arg
    arg = self.'evaluate'(tokenizer)
    .local string msg
    msg = arg
    UserError(msg)
.end

.sub func_FOR :method
    .param pmc tokenizer

    .local pmc pvar
    pvar = tokenizer.'get'()
    .local string var
    var = pvar
    var = upcase var
    $P0 = tokenizer.'get'()
    ne $P0, '=', fail
    .local pmc value
    value = self.'evaluate'(tokenizer)
    $P0 = tokenizer.'get'()
    $S0 = $P0
    $S0 = upcase $S0
    ne $S0, 'TO', fail

    .local pmc limit
    limit = self.'evaluate'(tokenizer)

    .local pmc increment
    $P0 = tokenizer.'get'()
    $I0 = defined $P0
    unless $I0 goto default_step
    $S0 = $P0
    $S0 = upcase $S0
    ne $S0, 'STEP', fail
    increment = self.'evaluate'(tokenizer)
    goto prepare
default_step:
    increment = new 'Integer'
    increment = 1
prepare:
    .local pmc for
    for = new 'For'
    .local pmc line
    line = self.'getcurline'()
    setattribute for, 'jumpline', line
    setattribute for, 'increment', increment
    setattribute for, 'limit', limit

    .local pmc vars, controlvar
    vars = getattribute self, 'vars'
    vars[var] = value
    controlvar = vars[var]
    $P0 = new 'String'
    $P0 = var
    setattribute for, 'controlvar', $P0

    .local pmc stack
    stack = getattribute self, 'stack'
    push stack, for

    .return()
fail:
    SyntaxError()
.end

.sub func_GOTO :method
    .param pmc tokenizer

    .local pmc arg
    arg = tokenizer.'get'()
    $I0 = defined arg
    unless $I0 goto fail
    $I0 = arg

    .local pmc line
    line = new 'Jump'
    throw_jump(line, $I0)

fail:
    SyntaxError()
.end

.sub func_GOSUB :method
    .param pmc tokenizer

    .local pmc arg
    arg = tokenizer.'get'()
    $I0 = defined arg
    unless $I0 goto fail
    $I0 = arg

    .local pmc line
    line = new 'Jump'
    $P1 = new 'Integer'
    $P1 = 1
    setattribute line, 'jumptype', $P1
    throw_jump(line, $I0)

fail:
    SyntaxError()
.end

.sub func_IF :method
    .param pmc tokenizer

    .local pmc arg
    .local pmc token

    arg = self.'evaluate'(tokenizer)
    token = tokenizer.'get'()
    $I0 = defined token
    unless $I0 goto fail
    $S0 = token
    $S0 = upcase $S0
    ne $S0, 'THEN', fail

    $I0 = defined arg
    unless $I0 goto is_false
    $I0 = arg
    unless $I0 goto is_false
    self.'execute'(tokenizer)
    goto finish

is_false:
    .local int level
    level = 1
# Search for ELSE, taking nested IF into account
nextitem:
    $P0 = tokenizer.'get' ()
    $I0 = defined $P0
    unless $I0 goto finish
    $I0 = isa $P0, 'String'
    unless $I0 goto nextitem
    $S0 = $P0
    $S0 = upcase $S0
    eq $S0, 'ELSE', is_else
    eq $S0, 'IF', is_if
    goto nextitem
is_if:
    inc level
    goto nextitem
is_else:
    dec level
    if level > 0 goto nextitem
    self.'execute'(tokenizer)

finish:
    .return()
fail:
    SyntaxError()
.end

.sub func_LIST :method
    .param pmc tokenizer

    .local pmc program
    program = getattribute self, 'program'
    program.'list'(0, 0)

.end

.sub func_LOAD :method
    .param pmc tokenizer

    .local pmc arg
    arg = self.'evaluate'(tokenizer)
    $P1 = tokenizer.'get'()
    if_null $P1, notype
    $I1 = defined $P1
    unless $I1 goto notype
    ne $P1, ',', notype

    $P1 = tokenizer.'get'()
    $I1 = defined $P1
    unless $I1 goto fail
    $S1 = $P1
    $S1 = upcase $S1
    ne $S1, 'B', fail
    $S1 = arg
    pirric_aux_loadbytecode($S1)
    .return()
notype:
    .local pmc program, newprogram
    newprogram = new ['Program']
    .local string filename
    filename = arg
    newprogram.'load'(filename)
    setattribute self, 'program', newprogram

    .local pmc end
    end = new 'End'
    throw_typed(end)

fail:
    SyntaxError()
.end

.sub func_NEXT :method
    .param pmc tokenizer

    .local pmc stack
    stack = getattribute self, 'stack'
    $I0 = stack
    dec $I0
    .local pmc for
    for = stack[$I0]
    .local pmc controlvar, varvalue, increment, limit
    controlvar = getattribute for, 'controlvar'
    varvalue = self.'get_var'(controlvar)
    increment = getattribute for, 'increment'
    limit = getattribute for, 'limit'

    $P0 = clone varvalue
    add $P0, increment
    self.'set_var'(controlvar, $P0)

    lt increment, 0, negstep
    gt $P0, limit, endloop
    goto jump
negstep:
    lt $P0, limit, endloop
jump:
    .local pmc jumpline
    jumpline = getattribute for, 'jumpline'

    .local pmc line
    line = new 'Next'
    throw_jump(line,jumpline)

    .return()
endloop:
    $P0 = pop stack
.end

.sub func_NEW :method
    .param pmc tokenizer

    .local pmc newprogram
    newprogram = new ['Program']
    setattribute self, 'program', newprogram

    self.'clear_all'()

    .local pmc end
    end = new 'End'
    throw_typed(end)
.end

.sub func_ON :method
    .param pmc tokenizer

    .local pmc token
    token = tokenizer.'get'()
    $S0 = token
    $S0 = upcase $S0
    if $S0 == 'ERROR' goto on_error
    goto fail
on_error:
    token = tokenizer.'get'()
    $S0 = token
    $S0 = upcase $S0
    if $S0 == 'GOTO' goto on_error_goto
    if $S0 == 'EXIT' goto on_error_exit
    goto fail
on_error_exit:
    $P0 = self.'evaluate'(tokenizer)
    $I0 = $P0
    self.'set_error_exit'($I0)
    goto finish
on_error_goto:
    $P0 = tokenizer.'get'()
    $I0 = defined $P0
    unless $I0 goto fail
    $I0 = $P0
    self.'set_error_goto'($I0)
    goto finish
fail:
    SyntaxError()
finish:
.end

.sub func_PRINT :method
    .param pmc tokenizer

    .local pmc arg

    arg = tokenizer.'get'()
    $I0 = defined arg
    unless $I0 goto endline

item:
    $S0 = arg
    $S0 = upcase $S0
    eq $S0, 'ELSE', endline
    arg = self.'evaluate'(tokenizer, arg)
print_it:
    print arg
    arg = tokenizer.'get'()
    $I0 = defined arg
    unless $I0 goto endline
    eq arg, ';', nextitem
    eq arg, ',', comma
    $S0 = arg
    $S0 = upcase $S0
    eq $S0, 'ELSE', endline
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
    arg = tokenizer.'get'()
    $I0 = defined arg
    unless $I0 goto finish
    $S0 = arg
    $S0 = upcase $S0
    eq $S0, 'ELSE', finish
    goto item
finish:
.end

.sub func_REM :method
    .param pmc tokenizer

    # Do nothing
.end

.sub func_RETURN :method
    .param pmc tokenizer

    .local pmc line
    line = new 'Return'
    throw_typed(line, .CONTROL_RETURN)

fail:
    SyntaxError()
.end

.sub func_RUN :method
    .param pmc tokenizer

    self.'clear_all'()
    .local pmc program, iter
    program = getattribute self, 'program'
    iter = program.'begin'()
    .local int numline
    numline = 0
    unless iter goto doit
    numline = shift iter
doit:
    .local pmc line
    line = new 'Jump'
    throw_jump(line, numline)
.end

.sub func_SAVE :method
    .param pmc tokenizer

    .local pmc arg
    arg = self.'evaluate'(tokenizer)
    $P1 = tokenizer.'get'()
    $I1 = defined $P1
    if $I1 goto fail

    .local string filename
    filename = arg
    .local pmc program
    program = getattribute self, 'program'
    program.'save'(filename)

    .return()

fail:
    SyntaxError()
.end

.sub func_STOP :method
    .param pmc tokenizer

    .local pmc line
    line = new 'Stop'
    throw_typed(line)
.end

.sub func_TROFF :method
    .param pmc tokenizer

    self.'trace'(0)
.end

.sub func_TRON :method
    .param pmc tokenizer

    self.'trace'(1)
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
    eq c, '^', operator
    eq c, '<', operator
    eq c, '>', operator
    eq c, '(', operator
    eq c, ')', operator
    eq c, '[', operator
    eq c, ']', operator
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
    eq c, ',', endtoken
    eq c, ';', endtoken
    eq c, '=', endtoken
    eq c, '+', endtoken
    eq c, '-', endtoken
    eq c, '*', endtoken
    eq c, '/', endtoken
    eq c, '^', endtoken
    eq c, '<', endtoken
    eq c, '>', endtoken
    eq c, '(', endtoken
    eq c, ')', endtoken
    eq c, '[', endtoken
    eq c, ']', endtoken
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
    eq c, '"', checkquote
    concat result, c
    goto str
checkquote:
    ge i, l, endstr
    c = substr line, i, 1
    ne c, '"', endstr
    inc i
    concat result, c
    goto str
endstr:
    objres = new 'Literal'
    objres = result
    goto doit

endline:
#    last = new 'Undef'
    null last
    setattribute self, 'last', last
    .local pmc none
#    none = new 'Undef'
    null none
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
    iter $P0, text
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

    #say filename

    open file, filename, 'r'

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
    token = tokenizeline.'get'()
    linenum = token
    unless linenum goto fail
    line = tokenizeline.'getall'()
    self.'storeline'(linenum, line)
    goto nextline

eof:
    close file
    $I0 = self.'elements'()
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

    open file, filename, 'w'

    self.'list'(0, 0, file)

    close file
.end

#-----------------------------------------------------------------------
.sub list :method
    .param int start
    .param int stop
    .param pmc file :optional
    .param int has_file :opt_flag

    if has_file goto do_list
    file = getstdout
do_list:
    gt start, stop, finish
    .local pmc lines, text
    lines = getattribute self, 'lines'
    text = getattribute self, 'text'

    .local int i, n, linenum
    .local string content
    n = lines
#    say n
    i = 0
nextline:
    ge i, n, finish
    linenum = lines [i]
    lt linenum, start, skip
    unless stop > 0 goto list_it
    gt linenum, stop, finish
list_it:
    content = text [linenum]
    print file, linenum
    print file, ' '
    print file, content
    print file, "\n"
skip:
    inc i
    goto nextline
finish:
.end

########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
