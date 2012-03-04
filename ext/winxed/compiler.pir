# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ 'Winxed'; 'Compiler' ]

.sub 'sformat' :subid('WSubId_45')
        .param string __ARG_1
        .param pmc __ARG_2 :slurpy
    new $P1, [ 'StringBuilder' ]
    $P1.'append_format'(__ARG_1, __ARG_2 :flat)
    set $S1, $P1
    .return($S1)

.end # sformat


.sub 'bindfirst' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2 :slurpy
.lex '__WLEX_1', __ARG_1
.lex '__WLEX_2', __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
    newclosure $P1, WSubId_2
    .return($P1)

.end # bindfirst


.sub '' :anon :subid('WSubId_2') :outer('WSubId_1')
        .param pmc __ARG_3 :slurpy
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    .tailcall $P1($P2 :flat, __ARG_3 :flat)

.end # WSubId_2


.sub 'bindlast' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2 :slurpy
.lex '__WLEX_1', __ARG_1
.lex '__WLEX_2', __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
    newclosure $P1, WSubId_4
    .return($P1)

.end # bindlast


.sub '' :anon :subid('WSubId_4') :outer('WSubId_3')
        .param pmc __ARG_3 :slurpy
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    .tailcall $P1(__ARG_3 :flat, $P2 :flat)

.end # WSubId_4


.sub 'bindmethod' :subid('WSubId_5')
        .param string __ARG_1
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
    newclosure $P1, WSubId_6
    .return($P1)

.end # bindmethod


.sub '' :anon :subid('WSubId_6') :outer('WSubId_5')
        .param pmc __ARG_2
        .param pmc __ARG_3 :slurpy
    find_lex $S1, '__WLEX_1'
    find_lex $S2, '__WLEX_1'
    .tailcall __ARG_2.$S2(__ARG_3 :flat)

.end # WSubId_6


.sub 'method_fun' :subid('WSubId_7')
        .param pmc __ARG_1
        .param string __ARG_2
.lex '__WLEX_1', __ARG_1
.lex '__WLEX_2', $P1
.const 'Sub' WSubId_8 = "WSubId_8"
    find_method $P1, __ARG_1, __ARG_2
    newclosure $P2, WSubId_8
    .return($P2)

.end # method_fun


.sub '' :anon :subid('WSubId_8') :outer('WSubId_7')
        .param pmc __ARG_3 :slurpy
    find_lex $P1, '__WLEX_1'
    find_lex $P2, '__WLEX_2'
    .tailcall $P1.$P2(__ARG_3 :flat)

.end # WSubId_8


.sub 'addprefix' :subid('WSubId_9')
        .param string __ARG_1
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_10 = "WSubId_10"
    newclosure $P1, WSubId_10
    .return($P1)

.end # addprefix


.sub '' :anon :subid('WSubId_10') :outer('WSubId_9')
        .param string __ARG_2
    find_lex $S1, '__WLEX_1'
    find_lex $S2, '__WLEX_1'
    concat $S3, $S2, __ARG_2
    .return($S3)

.end # WSubId_10

.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]

.sub 'WinxedCompilerError' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
        .param int __ARG_4 :optional
    box $P1, __ARG_1
    setattribute self, 'type', $P1
    box $P1, __ARG_2
    setattribute self, 'message', $P1
    box $P1, __ARG_3
    setattribute self, 'filename', $P1
    box $P1, __ARG_4
    setattribute self, 'line', $P1

.end # WinxedCompilerError

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    addattribute $P0, 'type'
    addattribute $P0, 'filename'
    addattribute $P0, 'line'
    addattribute $P0, 'message'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Warn' :subid('WSubId_42')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
    getstderr $P1
    $P1.'print'('WARNING: ')
    $P1.'print'(__ARG_1)
    if_null __ARG_2, __label_1
    $P1.'print'(' near ')
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
  __label_1: # endif
    $P1.'print'("\n")

.end # Warn


.sub 'InternalError' :subid('WSubId_30')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
    unless __ARG_3 goto __label_1
    __ARG_2 = __ARG_2.'getstart'()
    $P2 = __ARG_2.'show'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
    concat $S2, __ARG_1, ' near '
    concat $S2, $S2, $S1
    set __ARG_1, $S2
  __label_1: # endif
    unless __ARG_3 goto __label_4
    new $P2, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P3 = __ARG_2.'filename'()
    $P4 = __ARG_2.'linenum'()
    $P2.'WinxedCompilerError'('internal', __ARG_1, $P3, $P4)
    set $P1, $P2
    goto __label_3
  __label_4:
    new $P6, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P6.'WinxedCompilerError'('internal', __ARG_1)
    set $P5, $P6
    set $P1, $P5
  __label_3:
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2

.end # InternalError


.sub 'SyntaxError' :subid('WSubId_25')
        .param string __ARG_1
        .param pmc __ARG_2
    if_null __ARG_2, __label_1
    __ARG_2 = __ARG_2.'getstart'()
  __label_1: # endif
    if_null __ARG_2, __label_3
    $P1 = __ARG_2.'linenum'()
    goto __label_2
  __label_3:
    box $P1, -1
  __label_2:
    set $I1, $P1
    if_null __ARG_2, __label_5
    $P1 = __ARG_2.'filename'()
    goto __label_4
  __label_5:
    box $P1, "UNKNOWN"
  __label_4:
    null $S1
    if_null $P1, __label_6
    set $S1, $P1
  __label_6:
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S2, ' near ', $S3
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1

.end # SyntaxError


.sub 'NoLeftSide' :subid('WSubId_89')
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    WSubId_25('Not a left-side expression', __ARG_1)

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_70')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    concat $S1, "Expected ", __ARG_1
    WSubId_25($S1, __ARG_2)

.end # Expected


.sub 'Unexpected' :subid('WSubId_71')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    concat $S1, "Unexpected ", __ARG_1
    WSubId_25($S1, __ARG_2)

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_27')
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    WSubId_25("Expected identifier", __ARG_1)

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_26')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_25($S1, __ARG_2)

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_28')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
    WSubId_26(__ARG_1, __ARG_2)
  __label_1: # endif

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_29')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_26 = "WSubId_26"
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
    WSubId_26(__ARG_1, __ARG_2)
  __label_1: # endif

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_124')
        .param pmc __ARG_1
.const 'Sub' WSubId_27 = "WSubId_27"
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
    WSubId_27(__ARG_1)
  __label_1: # endif

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_84')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_28 = "WSubId_28"
    $P1 = __ARG_2.'get'()
    WSubId_28(__ARG_1, $P1)

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_126')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_29 = "WSubId_29"
    $P1 = __ARG_2.'get'()
    WSubId_29(__ARG_1, $P1)

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_91')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    concat $S1, "Variable '", __ARG_1
    concat $S1, $S1, "' is not defined"
    WSubId_25($S1, __ARG_2)

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
    box $P1, __ARG_1
    setattribute self, 'file', $P1
    box $P1, __ARG_2
    setattribute self, 'line', $P1

.end # Token


.sub 'getstart' :method
    .return(self)

.end # getstart


.sub 'iseof' :method
    .return(0)

.end # iseof


.sub 'iscomment' :method
    .return(0)

.end # iscomment


.sub 'isidentifier' :method
    .return(0)

.end # isidentifier


.sub 'isint' :method
    .return(0)

.end # isint


.sub 'isfloat' :method
    .return(0)

.end # isfloat


.sub 'isstring' :method
    .return(0)

.end # isstring


.sub 'issinglequoted' :method
    .return(0)

.end # issinglequoted


.sub 'getintvalue' :method
.const 'Sub' WSubId_30 = "WSubId_30"
    WSubId_30('Not a literal int', self)

.end # getintvalue


.sub 'rawstring' :method
.const 'Sub' WSubId_30 = "WSubId_30"
    WSubId_30('Not a literal string', self)

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_27 = "WSubId_27"
    WSubId_27(self)

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
    .return(0)

.end # iskeyword


.sub 'checkkeyword' :method
    .return(0)

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
    .return(0)

.end # isop


.sub 'checkop' :method
    .return('')

.end # checkop


.sub 'viewable' :method
    .return('(unknown)')

.end # viewable


.sub 'filename' :method
    getattribute $P1, self, 'file'
    .return($P1)

.end # filename


.sub 'linenum' :method
    getattribute $P1, self, 'line'
    .return($P1)

.end # linenum


.sub 'show' :method
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    getattribute $P1, self, 'file'
    set $S2, $P1
    getattribute $P2, self, 'line'
    set $S3, $P2
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)

.end # show

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
    addattribute $P0, 'file'
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
    self.'Token'(__ARG_1, 0)

.end # TokenEof


.sub 'iseof' :method
    .return(1)

.end # iseof


.sub 'viewable' :method
    .return('(End of file)')

.end # viewable

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
    self.'Token'(__ARG_1, __ARG_2)
    box $P1, __ARG_3
    setattribute self, 'str', $P1

.end # TokenWithVal


.sub 'get_string' :method :vtable
    getattribute $P1, self, 'str'
    .return($P1)

.end # get_string


.sub 'viewable' :method
    getattribute $P1, self, 'str'
    .return($P1)

.end # viewable

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)

.end # TokenComment


.sub 'iscomment' :method
    .return(1)

.end # iscomment

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)

.end # isop


.sub 'checkop' :method
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)

.end # checkop

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)

.end # TokenIdentifier


.sub 'isidentifier' :method
    .return(1)

.end # isidentifier


.sub 'getidentifier' :method
    getattribute $P1, self, 'str'
    .return($P1)

.end # getidentifier


.sub 'checkkeyword' :method
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)

.end # iskeyword

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
    .return(1)

.end # isstring


.sub 'rawstring' :method
    getattribute $P1, self, 'str'
    .return($P1)

.end # rawstring

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)

.end # TokenQuoted


.sub 'get_string' :method :vtable
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)

.end # get_string


.sub 'viewable' :method
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)

.end # viewable


.sub 'getasquoted' :method
    getattribute $P1, self, 'str'
    .return($P1)

.end # getasquoted


.sub 'getPirString' :method
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    null $S2
    new $P1, 'ExceptionHandler'
    set_label $P1, __label_2
    push_eh $P1
    $P0 = new ['String']
    $P0 = $S1
    $S2 = $P0.'unescape'('utf8')
    pop_eh
    goto __label_3
  __label_2:
    .get_results($P2)
    finalize $P2
    pop_eh
    WSubId_25("Invalid escape sequence in literal string", self)
  __label_3:
    null $I1
    box $P1, $S2
    if_null $P1, __label_5
    iter $P3, $P1
    set $P3, 0
  __label_4: # for iteration
    unless $P3 goto __label_5
    shift $I2, $P3
    le $I2, 127, __label_6
    set $I1, 1
    goto __label_5 # break
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    escape $S1, $S2
    unless $I1 goto __label_8
    set $S3, "utf8:"
    goto __label_7
  __label_8:
    set $S3, ""
  __label_7:
    concat $S4, $S3, '"'
    concat $S4, $S4, $S1
    concat $S4, $S4, '"'
    .return($S4)

.end # getPirString

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)

.end # TokenSingleQuoted


.sub 'issinglequoted' :method
    .return(1)

.end # issinglequoted


.sub 'get_string' :method :vtable
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)

.end # get_string


.sub 'viewable' :method
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)

.end # viewable


.sub 'getasquoted' :method
    set $S1, ''
    getattribute $P1, self, 'str'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
    if_null $S2, __label_3
    length $I1, $S2
    ne $I1, 1, __label_3
    ord $I1, $S2
    if $I1 == 34 goto __label_5
    if $I1 == 92 goto __label_6
    if $I1 == 39 goto __label_7
    goto __label_3
  __label_5: # case
  __label_6: # case
  __label_7: # case
    concat $S3, '\', $S2
    set $S2, $S3
    goto __label_4 # break
  __label_3: # default
  __label_4: # switch end
    concat $S1, $S1, $S2
    goto __label_1
  __label_2: # endfor
    .return($S1)

.end # getasquoted


.sub 'getPirString' :method
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    set $S2, "'"
    null $I1
    box $P1, $S1
    if_null $P1, __label_3
    iter $P2, $P1
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $I2, $P2
    islt $I5, $I2, 32
    if $I5 goto __label_5
    isgt $I5, $I2, 127
  __label_5:
    unless $I5 goto __label_4
    set $I1, 1
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $I3
    unless $I1 goto __label_6
    set $S2, '"'
    set $S3, ''
    box $P1, $S1
    if_null $P1, __label_8
    iter $P3, $P1
    set $P3, 0
  __label_7: # for iteration
    unless $P3 goto __label_8
    shift $S4, $P3
    ne $S4, '\', __label_9
    concat $S3, $S3, '\\'
    goto __label_10
  __label_9: # else
    ord $I4, $S4
    islt $I5, $I4, 32
    if $I5 goto __label_13
    isgt $I5, $I4, 127
  __label_13:
    unless $I5 goto __label_11
    le $I4, 127, __label_14
    set $I3, 1
  __label_14: # endif
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_15
    set $S5, $P1
  __label_15:
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
    goto __label_12
  __label_11: # else
    concat $S3, $S3, $S4
  __label_12: # endif
  __label_10: # endif
    goto __label_7
  __label_8: # endfor
    set $S1, $S3
  __label_6: # endif
    concat $S6, $S2, $S1
    concat $S6, $S6, $S2
    set $S1, $S6
    unless $I3 goto __label_16
    concat $S6, 'utf8:', $S1
    set $S1, $S6
  __label_16: # endif
    .return($S1)

.end # getPirString

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)

.end # TokenInteger


.sub 'isint' :method
    .return(1)

.end # isint


.sub 'getintvalue' :method
    getattribute $P1, self, 'str'
    set $I1, $P1
    .return($I1)

.end # getintvalue

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)

.end # TokenFloat


.sub 'isfloat' :method
    .return(1)

.end # isfloat


.sub 'getfloatvalue' :method
    getattribute $P1, self, 'str'
    set $N1, $P1
    .return($N1)

.end # getfloatvalue

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'TokenError' :subid('WSubId_31')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1

.end # TokenError


.sub 'UnterminatedString' :subid('WSubId_32')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_31 = "WSubId_31"
    WSubId_31('Unterminated string', __ARG_1, __ARG_2)

.end # UnterminatedString


.sub 'UnterminatedHeredoc' :subid('WSubId_33')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_31 = "WSubId_31"
    WSubId_31('Unterminated heredoc', __ARG_1, __ARG_2)

.end # UnterminatedHeredoc


.sub 'UnclosedComment' :subid('WSubId_34')
        .param pmc __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_31 = "WSubId_31"
    WSubId_31("Unclosed comment", __ARG_1, __ARG_2)

.end # UnclosedComment


.sub 'getquoted' :subid('WSubId_37')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_32 = "WSubId_32"
    set $S1, ''
    null $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
    if $S2 == "" goto __label_6
    if $S2 == "\n" goto __label_7
    if $S2 == '\' goto __label_8
    goto __label_4
  __label_6: # case
  __label_7: # case
    WSubId_32(__ARG_1, __ARG_3)
  __label_8: # case
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
    WSubId_32(__ARG_1, __ARG_3)
  __label_10: # endif
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_5 # break
  __label_4: # default
    concat $S1, $S1, $S2
  __label_5: # switch end
  __label_1: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_38')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_32 = "WSubId_32"
    set $S1, ''
    null $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
    WSubId_32(__ARG_1, __ARG_3)
  __label_4: # endif
    concat $S1, $S1, $S2
  __label_1: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_39')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_33 = "WSubId_33"
    set $S1, ''
    null $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
    if $S2 == '' goto __label_6
    if $S2 == '"' goto __label_7
    if $S2 == '\' goto __label_8
    goto __label_4
  __label_6: # case
    WSubId_33(__ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
    concat $S6, '\', $S2
    set $S2, $S6
    goto __label_5 # break
  __label_4: # default
  __label_5: # switch end
    concat $S5, $S1, $S2
    set $S1, $S5
  __label_1: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
    concat $S5, $S1, ':>>'
    set $S1, $S5
    set $S3, ''
    null $S4
  __label_9: # do
    set $S4, ''
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
    if $S2 == '' goto __label_17
    if $S2 == '"' goto __label_18
    if $S2 == '\' goto __label_19
    goto __label_15
  __label_17: # case
    WSubId_33(__ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
    concat $S6, '\', $S2
    set $S2, $S6
    goto __label_16 # break
  __label_15: # default
  __label_16: # switch end
    concat $S4, $S4, $S2
  __label_12: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
    eq $S4, $S1, __label_20
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
  __label_11: # continue
    ne $S4, $S1, __label_9
  __label_10: # enddo
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)

.end # getheredoc


.sub 'getident' :subid('WSubId_35')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
    set $S1, __ARG_2
    null $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    set $S3, $S2
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', $S3
    isgt $I1, $I2, -1
    goto __label_4
  __label_4:
    unless $I1 goto __label_2
    concat $S1, $S1, $S2
  __label_1: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
    __ARG_1.'ungetchar'($S2)
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)

.end # getident


.sub 'getnumber' :subid('WSubId_43')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
    null $S1
    set $S2, __ARG_2
  __label_1: # do
    concat $S1, $S1, $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # continue
    set $S3, $S2
    index $I5, '0123456789', $S3
    isgt $I4, $I5, -1
    goto __label_4
  __label_4:
    if $I4 goto __label_1
  __label_2: # enddo
    iseq $I5, $S1, '0'
    unless $I5 goto __label_6
    iseq $I5, $S2, 'x'
    if $I5 goto __label_7
    iseq $I5, $S2, 'X'
  __label_7:
  __label_6:
    unless $I5 goto __label_5
    null $I1
    null $I2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_10: # for condition
    set $S4, $S2
    index $I3, '0123456789abcdef0123456789ABCDEF', $S4
    lt $I3, 0, __label_12
    mod $I3, $I3, 16
  __label_12: # endif
    set $I2, $I3
    goto __label_11
  __label_11:
    lt $I2, 0, __label_9
    mul $I5, $I1, 16
    add $I1, $I5, $I2
    concat $S1, $S1, $S2
  __label_8: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_10
  __label_9: # for end
    __ARG_1.'ungetchar'($S2)
    set $S1, $I1
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
  __label_5: # endif
    ne $S2, '.', __label_13
  __label_15: # do
    concat $S1, $S1, $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_17: # continue
    set $S5, $S2
    index $I5, '0123456789', $S5
    isgt $I6, $I5, -1
    goto __label_18
  __label_18:
    if $I6 goto __label_15
  __label_16: # enddo
    iseq $I5, $S2, 'e'
    if $I5 goto __label_20
    iseq $I5, $S2, 'E'
  __label_20:
    unless $I5 goto __label_19
    concat $S1, $S1, 'E'
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I5, $S2, '+'
    if $I5 goto __label_22
    iseq $I5, $S2, '-'
  __label_22:
    unless $I5 goto __label_21
    concat $S1, $S1, $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_21: # endif
  __label_25: # for condition
    set $S6, $S2
    index $I5, '0123456789', $S6
    isgt $I7, $I5, -1
    goto __label_26
  __label_26:
    unless $I7 goto __label_24
    concat $S1, $S1, $S2
  __label_23: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_25
  __label_24: # for end
  __label_19: # endif
    __ARG_1.'ungetchar'($S2)
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
    goto __label_14
  __label_13: # else
    iseq $I5, $S2, 'e'
    if $I5 goto __label_29
    iseq $I5, $S2, 'E'
  __label_29:
    unless $I5 goto __label_27
    concat $S1, $S1, 'E'
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I5, $S2, '+'
    if $I5 goto __label_31
    iseq $I5, $S2, '-'
  __label_31:
    unless $I5 goto __label_30
    concat $S1, $S1, $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_30: # endif
  __label_34: # for condition
    set $S7, $S2
    index $I5, '0123456789', $S7
    isgt $I8, $I5, -1
    goto __label_35
  __label_35:
    unless $I8 goto __label_33
    concat $S1, $S1, $S2
  __label_32: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_34
  __label_33: # for end
    __ARG_1.'ungetchar'($S2)
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
    goto __label_28
  __label_27: # else
    __ARG_1.'ungetchar'($S2)
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
  __label_28: # endif
  __label_14: # endif

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_40')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
    set $S1, __ARG_2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
  __label_3: # for condition
    isne $I1, $S2, ''
    unless $I1 goto __label_5
    isne $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_2
    concat $S1, $S1, $S2
  __label_1: # for iteration
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_41')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_34 = "WSubId_34"
    set $S1, __ARG_2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
  __label_7: # for condition
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
    concat $S1, $S1, $S2
  __label_5: # for iteration
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
    ne $S2, '', __label_9
    WSubId_34(__ARG_1, __ARG_3)
  __label_9: # endif
    concat $S1, $S1, $S2
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    ne $S2, '', __label_10
    WSubId_34(__ARG_1, __ARG_3)
  __label_10: # endif
  __label_4: # continue
    ne $S2, '/', __label_2
  __label_3: # enddo
    concat $S1, $S1, '/'
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)

.end # getcomment


.sub 'getop' :subid('WSubId_36')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
    set $S1, __ARG_2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)

.end # getop

.namespace [ 'Winxed'; 'Compiler'; 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_38 = "WSubId_38"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
    not $I1, __ARG_3
    new $P3, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P3
    setattribute self, 'h', __ARG_1
    box $P2, ''
    setattribute self, 'pending', $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
    box $P2, 1
    setattribute self, 'line', $P2
    root_new $P1, ['parrot';'Hash']
    root_new $P2, ['parrot';'Hash']
    $P2[''] = WSubId_35
    $P2['{'] = WSubId_36
    $P1['$'] = $P2
    $P1['"'] = WSubId_37
    $P1["'"] = WSubId_38
    root_new $P3, ['parrot';'Hash']
    root_new $P4, ['parrot';'Hash']
    $P4[''] = WSubId_36
    $P4['='] = WSubId_36
    $P3['='] = $P4
    $P3[':'] = WSubId_36
    $P1['='] = $P3
    root_new $P5, ['parrot';'Hash']
    $P5['+'] = WSubId_36
    $P5['='] = WSubId_36
    $P1['+'] = $P5
    root_new $P6, ['parrot';'Hash']
    $P6['-'] = WSubId_36
    $P6['='] = WSubId_36
    $P1['-'] = $P6
    root_new $P7, ['parrot';'Hash']
    $P7['='] = WSubId_36
    $P1['*'] = $P7
    root_new $P8, ['parrot';'Hash']
    $P8['|'] = WSubId_36
    $P1['|'] = $P8
    root_new $P9, ['parrot';'Hash']
    $P9['&'] = WSubId_36
    $P1['&'] = $P9
    root_new $P10, ['parrot';'Hash']
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_36
    $P11[':'] = WSubId_39
    $P10['<'] = $P11
    $P10['='] = WSubId_36
    $P1['<'] = $P10
    root_new $P12, ['parrot';'Hash']
    root_new $P13, ['parrot';'Hash']
    $P13[''] = WSubId_36
    $P13['>'] = WSubId_36
    $P12['>'] = $P13
    $P12['='] = WSubId_36
    $P1['>'] = $P12
    root_new $P14, ['parrot';'Hash']
    root_new $P15, ['parrot';'Hash']
    $P15[''] = WSubId_36
    $P15['='] = WSubId_36
    $P14['='] = $P15
    $P1['!'] = $P14
    root_new $P16, ['parrot';'Hash']
    $P16['%'] = WSubId_36
    $P16['='] = WSubId_36
    $P1['%'] = $P16
    root_new $P17, ['parrot';'Hash']
    $P17['='] = WSubId_36
    $P17['/'] = WSubId_40
    $P17['*'] = WSubId_41
    $P1['/'] = $P17
    $P1['#'] = WSubId_40
    setattribute self, 'select', $P1

.end # Tokenizer


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_42 = "WSubId_42"
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
    WSubId_42(__ARG_1, __ARG_2)
  __label_1: # endif

.end # warn


.sub 'getchar' :method
    getattribute $P1, self, 'pending'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    eq $S1, '', __label_2
    assign $P1, ''
    goto __label_3
  __label_2: # else
    getattribute $P2, self, 'h'
    $P3 = $P2.'read'(1)
    set $S1, $P3
    ne $S1, "\n", __label_4
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
  __label_3: # endif
    .return($S1)

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1

.end # ungetchar


.sub 'get_token' :method
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_36 = "WSubId_36"
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
    set $S3, $S1
    iseq $I2, $S3, ' '
    if $I2 goto __label_7
    iseq $I2, $S3, "\n"
  __label_7:
    if $I2 goto __label_6
    iseq $I2, $S3, "\t"
  __label_6:
    goto __label_5
  __label_5:
    unless $I2 goto __label_3
    $P3 = self.'getchar'()
    set $S1, $P3
    goto __label_4
  __label_3: # endwhile
    getattribute $P3, self, 'line'
    set $I1, $P3
    ne $S1, '', __label_8
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
    set $S4, $S1
    index $I4, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', $S4
    isgt $I3, $I4, -1
    goto __label_10
  __label_10:
    unless $I3 goto __label_9
    .tailcall WSubId_35(self, $S1, $I1)
  __label_9: # endif
    set $S5, $S1
    index $I4, '0123456789', $S5
    isgt $I5, $I4, -1
    goto __label_12
  __label_12:
    unless $I5 goto __label_11
    .tailcall WSubId_43(self, $S1, $I1)
  __label_11: # endif
    set $S2, $S1
    getattribute $P1, self, 'select'
    $P2 = $P1[$S1]
  __label_14: # while
    isnull $I4, $P2
    not $I4
    unless $I4 goto __label_15
    isa $I4, $P2, 'Hash'
  __label_15:
    unless $I4 goto __label_13
    $P3 = self.'getchar'()
    set $S1, $P3
    set $P1, $P2
    $P2 = $P1[$S1]
    unless_null $P2, __label_16
    self.'ungetchar'($S1)
    $P2 = $P1['']
    goto __label_17
  __label_16: # else
    concat $S2, $S2, $S1
  __label_17: # endif
    goto __label_14
  __label_13: # endwhile
    if_null $P2, __label_19
    $P3 = $P2(self, $S2, $I1)
    goto __label_18
  __label_19:
    $P4 = WSubId_36(self, $S2, $I1)
    set $P3, $P4
  __label_18:
    .return($P3)

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
    $P1 = self.'get_token'()
  __label_2: # while
    $P3 = $P1.'iseof'()
    isfalse $I1, $P3
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    box $P2, $I1
    unless $P2 goto __label_3
    $P2 = $P1.'iscomment'()
  __label_3:
    if_null $P2, __label_1
    unless $P2 goto __label_1
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
    .return($P1)

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'stacked'
    push $P1, __ARG_1

.end # unget

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    addattribute $P0, 'warnings'
    addattribute $P0, 'h'
    addattribute $P0, 'pending'
    addattribute $P0, 'select'
    addattribute $P0, 'stacked'
    addattribute $P0, 'filename'
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'typetoregcheck' :subid('WSubId_127')
        .param string __ARG_1
    if __ARG_1 == 'int' goto __label_3
    if __ARG_1 == 'float' goto __label_4
    if __ARG_1 == 'string' goto __label_5
    if __ARG_1 == 'var' goto __label_6
    goto __label_1
  __label_3: # case
    .return('I')
  __label_4: # case
    .return('N')
  __label_5: # case
    .return('S')
  __label_6: # case
    .return('P')
  __label_1: # default
    .return('')
  __label_2: # switch end

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_136')
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    if_null __ARG_1, __label_1
    length $I1, __ARG_1
    ne $I1, 1, __label_1
    ord $I1, __ARG_1
    if $I1 == 73 goto __label_3
    if $I1 == 78 goto __label_4
    if $I1 == 83 goto __label_5
    if $I1 == 80 goto __label_6
    goto __label_1
  __label_3: # case
    .return('int')
  __label_4: # case
    .return('num')
  __label_5: # case
    .return('string')
  __label_6: # case
    .return('pmc')
  __label_1: # default
    WSubId_30('Invalid reg type')
  __label_2: # switch end

.end # typetopirname

.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
        .param int __ARG_2
    setattribute self, 'handle', __ARG_1
    box $P1, ""
    setattribute self, 'file', $P1
    box $P1, 0
    setattribute self, 'line', $P1
    box $P1, 0
    setattribute self, 'pendingf', $P1
    box $P1, 0
    setattribute self, 'pendingl', $P1
    not $I1, __ARG_2
    new $P2, [ 'Boolean' ], $I1
    setattribute self, 'warnings', $P2

.end # Emit


.sub 'setDebug' :method
    box $P1, 1
    setattribute self, 'debug', $P1

.end # setDebug


.sub 'getDebug' :method
    getattribute $P1, self, 'debug'
    isnull $I1, $P1
    not $I1
    .return($I1)

.end # getDebug


.sub 'disable_annotations' :method
    box $P1, 1
    setattribute self, 'noan', $P1

.end # disable_annotations


.sub 'close' :method
    null $P1
    setattribute self, 'handle', $P1

.end # close


.sub 'warn' :method
        .param string __ARG_1
        .param pmc __ARG_2 :optional
.const 'Sub' WSubId_42 = "WSubId_42"
    getattribute $P1, self, 'warnings'
    if_null $P1, __label_1
    unless $P1 goto __label_1
    WSubId_42(__ARG_1, __ARG_2)
  __label_1: # endif

.end # warn


.sub 'updateannot' :method
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'file', '"
    getattribute $P4, self, 'file'
    $P3[1] = $P4
    $P3[2] = "'\n"
    join $S1, "", $P3
    $P2.'print'($S1)
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
  __label_1: # endif
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = ".annotate 'line', "
    getattribute $P4, self, 'line'
    $P3[1] = $P4
    $P3[2] = "\n"
    join $S1, "", $P3
    $P2.'print'($S1)
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
  __label_2: # endif

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_7 = "WSubId_7"
    set $P1, __ARG_1
    getattribute $P4, self, 'handle'
    $P2 = WSubId_7($P4, "print")
    if_null $P1, __label_3
    iter $P5, $P1
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
    self.'updateannot'()
    self.'vprint'(__ARG_1)

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
    self.'updateannot'()
    self.'vprint'(__ARG_1)
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
    getattribute $P1, self, 'file'
    getattribute $P2, self, 'line'
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
    set $S2, $P1
    eq $S2, $S1, __label_3
    assign $P1, $S1
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
    assign $P2, 0
  __label_3: # endif
    set $I2, $P2
    eq $I2, $I1, __label_4
    assign $P2, $I1
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
  __label_4: # endif
  __label_1: # endif

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
    self.'updateannot'()
    getattribute $P1, self, 'handle'
    concat $S1, "# ", __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
    getattribute $P1, self, 'handle'
    $P1.'print'('  ')
    $P1.'print'(__ARG_1)
    $P1.'print'(":")
    if_null __ARG_2, __label_1
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
    $P1.'print'("\n")

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
    getattribute $P1, self, 'handle'
    $P1.'print'("    goto ")
    $P1.'print'(__ARG_1)
    if_null __ARG_2, __label_1
    concat $S1, " # ", __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
    $P1.'print'("\n")

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'('    ', __ARG_1, " ", __ARG_2)

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3)

.end # emitarg2


.sub 'emitarg3' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)

.end # emitarg3


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    if ", __ARG_1, " goto ", __ARG_2)

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    unless ", __ARG_1, " goto ", __ARG_2)

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    if_null ", __ARG_1, ", ", __ARG_2)

.end # emitif_null


.sub 'emitunless_null' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    unless_null ", __ARG_1, ", ", __ARG_2)

.end # emitunless_null


.sub 'emitnull' :method
        .param string __ARG_1
    self.'say'("    null ", __ARG_1)

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
    self.'say'("    inc ", __ARG_1)

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
    self.'say'("    dec ", __ARG_1)

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
    self.'say'("    print ", __ARG_1)

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
    self.'say'("    say ", __ARG_1)

.end # emitsay


.sub 'emitget_hll_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
    concat $S1, ", ", __ARG_2
    self.'say'("    get_hll_namespace ", __ARG_1, $S1)

.end # emitget_hll_namespace


.sub 'emitget_root_namespace' :method
        .param string __ARG_1
        .param string __ARG_2
    concat $S1, ", ", __ARG_2
    self.'say'("    get_root_namespace ", __ARG_1, $S1)

.end # emitget_root_namespace


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
    self.'print'("    get_hll_global ", __ARG_1)
    if_null __ARG_3, __label_1
    self.'print'(", ", __ARG_3)
  __label_1: # endif
    self.'say'(", '", __ARG_2, "'")

.end # emitget_hll_global


.sub 'emitget_root_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
    self.'print'("    get_root_global ", __ARG_1)
    if_null __ARG_3, __label_1
    self.'print'(", ", __ARG_3)
  __label_1: # endif
    self.'say'(", '", __ARG_2, "'")

.end # emitget_root_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    find_lex ", __ARG_1, ", '", __ARG_2, "'")

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
    self.'say'("    store_lex '", __ARG_1, "', ", __ARG_2)

.end # emitstore_lex

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
    addattribute $P0, 'handle'
    addattribute $P0, 'file'
    addattribute $P0, 'line'
    addattribute $P0, 'pendingf'
    addattribute $P0, 'pendingl'
    addattribute $P0, 'debug'
    addattribute $P0, 'noan'
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)

.end # integerValue


.sub 'floatValue' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenFloat'($P3, $P4, __ARG_3)
    set $P1, $P2
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)

.end # floatValue


.sub 'stringQuotedValue' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, __ARG_3)
    set $P1, $P2
    new $P3, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P3.'StringLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)

.end # stringQuotedValue


.sub 'floatresult' :subid('WSubId_95')
        .param string __ARG_1
        .param string __ARG_2
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
    .return($I1)

.end # floatresult


.sub 'floatAsString' :subid('WSubId_90')
        .param num __ARG_1
    set $S1, __ARG_1
    box $P2, $S1
    $P1 = $P2.'is_integer'($S1)
    if_null $P1, __label_1
    unless $P1 goto __label_1
    concat $S1, $S1, '.0'
  __label_1: # endif
    .return($S1)

.end # floatAsString


.sub 'createPredefConstInt' :subid('WSubId_147')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P3.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
    set $P1, $P3
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
    $P3 = WSubId_44(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_140')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P3.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
    set $P1, $P3
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
    $P2.'setvalue'($P3)

.end # createPredefConstString


.sub 'string_from_literal' :subid('WSubId_47')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    null $S1
    $P1 = __ARG_1.'isintegerliteral'()
    set $I1, $P1
    if $I1 goto __label_3
    $P2 = __ARG_1.'isfloatliteral'()
    set $I1, $P2
    if $I1 goto __label_4
    $P3 = __ARG_1.'isstringliteral'()
    set $I1, $P3
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    getattribute $P4, __ARG_1, 'numval'
    set $S1, $P4
    goto __label_1 # break
  __label_4: # case
    $P5 = __ARG_1.'getFloatValue'()
    set $S1, $P5
    goto __label_1 # break
  __label_5: # case
    $P6 = __ARG_1.'get_value'()
    set $S1, $P6
    goto __label_1 # break
  __label_2: # default
    WSubId_30('wrong call to string_from_literal', __ARG_1)
  __label_1: # switch end
    .return($S1)

.end # string_from_literal


.sub 'int_from_literal' :subid('WSubId_48')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    null $I1
    $P1 = __ARG_1.'isintegerliteral'()
    set $I2, $P1
    if $I2 goto __label_3
    $P2 = __ARG_1.'isfloatliteral'()
    set $I2, $P2
    if $I2 goto __label_4
    $P3 = __ARG_1.'isstringliteral'()
    set $I2, $P3
    if $I2 goto __label_5
    goto __label_2
  __label_3: # case
    getattribute $P4, __ARG_1, 'numval'
    set $I1, $P4
    goto __label_1 # break
  __label_4: # case
    $P5 = __ARG_1.'getFloatValue'()
    set $I1, $P5
    goto __label_1 # break
  __label_5: # case
    $P6 = __ARG_1.'get_value'()
    set $I1, $P6
    goto __label_1 # break
  __label_2: # default
    WSubId_30('wrong call to int_from_literal', __ARG_1)
  __label_1: # switch end
    .return($I1)

.end # int_from_literal


.sub 'float_from_literal' :subid('WSubId_128')
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    null $N1
    $P1 = __ARG_1.'isintegerliteral'()
    set $I1, $P1
    if $I1 goto __label_3
    $P2 = __ARG_1.'isfloatliteral'()
    set $I1, $P2
    if $I1 goto __label_4
    $P3 = __ARG_1.'isstringliteral'()
    set $I1, $P3
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
  __label_4: # case
    $P4 = __ARG_1.'getFloatValue'()
    set $N1, $P4
    goto __label_1 # break
  __label_5: # case
    $P5 = __ARG_1.'get_value'()
    set $N1, $P5
    goto __label_1 # break
  __label_2: # default
    WSubId_30('wrong call to float_from_literal', __ARG_1)
  __label_1: # switch end
    .return($N1)

.end # float_from_literal

.namespace [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]

.sub 'Builtin_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
    length $I3, __ARG_2
    sub $I2, $I3, 1
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
    split $P1, "\n", __ARG_2
    join $S1, "\n    ", $P1
    concat $S2, '    ', $S1
    set __ARG_2, $S2
    box $P1, __ARG_2
    setattribute self, 'body', $P1
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1

.end # Builtin_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_45 = "WSubId_45"
    getattribute $P1, self, 'typeresult'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    ne $S1, 'v', __label_2
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_4, ''
  __label_5:
    unless $I1 goto __label_4
    WSubId_25('using return value from void builtin', __ARG_3)
  __label_4: # endif
    goto __label_3
  __label_2: # else
    isnull $I1, __ARG_4
    if $I1 goto __label_7
    iseq $I1, __ARG_4, ''
  __label_7:
    unless $I1 goto __label_6
    WSubId_30('Bad result in non void builtin')
  __label_6: # endif
  __label_3: # endif
    __ARG_1.'annotate'(__ARG_3)
    getattribute $P2, self, 'body'
    $P1 = WSubId_45($P2, __ARG_4, __ARG_5 :flat)
    __ARG_1.'say'($P1)

.end # invoke

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
    addattribute $P0, 'body'
    addattribute $P0, 'typeresult'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]

.sub 'BuiltinBase' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param string __ARG_6
        .param string __ARG_7
.const 'Sub' WSubId_30 = "WSubId_30"
    box $P1, __ARG_1
    setattribute self, 'name', $P1
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
    new $P3, [ 'Winxed'; 'Compiler'; 'Builtin_frombody' ]
    $P3.'Builtin_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
    setattribute self, 'body', __ARG_2
  __label_2: # endif
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
    null $I1
    if_null __ARG_4, __label_3
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
    if_null __ARG_4, __label_4
    length $I2, __ARG_4
    ne $I2, 1, __label_4
    ord $I2, __ARG_4
    if $I2 == 42 goto __label_6
    if $I2 == 33 goto __label_7
    goto __label_4
  __label_6: # case
    set $I1, -1
    goto __label_5 # break
  __label_7: # case
    set $I1, -2
    if_null __ARG_5, __label_8
    concat $S1, "Invalid builtin '", __ARG_1
    concat $S1, $S1, '"'
    WSubId_30($S1)
  __label_8: # endif
    goto __label_5 # break
  __label_4: # default
    set $I1, 1
    if_null __ARG_5, __label_9
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
    inc $I1
  __label_9: # endif
    if_null __ARG_6, __label_10
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
    inc $I1
  __label_10: # endif
    if_null __ARG_7, __label_11
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
    inc $I1
  __label_11: # endif
  __label_5: # switch end
  __label_3: # endif
    box $P1, $I1
    setattribute self, 'nparams', $P1

.end # BuiltinBase


.sub 'iscompileevaluable' :method
    .return(0)

.end # iscompileevaluable


.sub 'name' :method
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    .return($S1)

.end # name


.sub 'result' :method
    getattribute $P1, self, 'typeresult'
    .return($P1)

.end # result


.sub 'params' :method
    getattribute $P1, self, 'nparams'
    .return($P1)

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    null $S1
    if __ARG_1 == 0 goto __label_3
    if __ARG_1 == 1 goto __label_4
    if __ARG_1 == 2 goto __label_5
    if __ARG_1 == 3 goto __label_6
    goto __label_1
  __label_3: # case
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_2 # break
  __label_4: # case
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_2 # break
  __label_5: # case
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_2 # break
  __label_6: # case
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_2 # break
  __label_1: # default
    WSubId_30('Invalid builtin arg')
  __label_2: # switch end
    .return($S1)

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
    eq $S1, '__ASSERT__', __label_3
    concat $S3, 'builtin ', $S1
    __ARG_1.'comment'($S3)
  __label_3: # endif
  __label_2: # endif
    getattribute $P2, self, 'typeresult'
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
    isne $I1, $S2, 'v'
    unless $I1 goto __label_6
    iseq $I1, __ARG_4, ''
  __label_6:
    unless $I1 goto __label_5
    $P2 = __ARG_2.'tempreg'($S2)
    set __ARG_4, $P2
  __label_5: # endif
    getattribute $P1, self, 'body'
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)

.end # expand

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addattribute $P0, 'name'
    addattribute $P0, 'body'
    addattribute $P0, 'typeresult'
    addattribute $P0, 'type0'
    addattribute $P0, 'type1'
    addattribute $P0, 'type2'
    addattribute $P0, 'type3'
    addattribute $P0, 'nparams'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]

.sub 'BuiltinFunction' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
    self.'BuiltinBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)

.end # BuiltinFunction

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]

.sub 'BuiltinFunctionEval' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
        .param string __ARG_8 :optional
    self.'BuiltinBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
    setattribute self, 'evalfun', __ARG_2

.end # BuiltinFunctionEval


.sub 'iscompileevaluable' :method
    .return(1)

.end # iscompileevaluable

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BuiltinBase' ]
    addparent $P0, $P1
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]

.sub 'Builtin_typecast' :method
        .param string __ARG_1
    box $P1, __ARG_1
    setattribute self, 'type', $P1

.end # Builtin_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
    WSubId_30("Invalid Builtin_typecast.invoke call")
  __label_2: # endif
    $P1 = __ARG_5[0]
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
    __ARG_1.'annotate'(__ARG_3)
    ne $S3, 'null', __label_9
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end

.end # invoke

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'builtineval_stringcast' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
    $P2 = WSubId_47($P1)
    .tailcall WSubId_46(__ARG_1, __ARG_2, $P2)

.end # builtineval_stringcast


.sub 'builtineval_intcast' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
    $P2 = WSubId_48($P1)
    set $I1, $P2
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)

.end # builtineval_intcast


.sub 'Builtin_varcast' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_30 = "WSubId_30"
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
    WSubId_30("Invalid var cast")
  __label_1: # endif
    $P1 = __ARG_5[0]
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_2
    set $S1, $P10
  __label_2:
    ne $S1, 'P', __label_3
    null $S2
    null $P2
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
    $P10 = $P1.'getName'()
    set $S2, $P10
    $P11 = $P1.'checkIdentifier'()
    null $S3
    if_null $P11, __label_9
    set $S3, $P11
  __label_9:
    $P3 = $P1.'checkVar'()
    isne $I2, $S3, ''
    unless $I2 goto __label_13
    isnull $I2, $P3
    not $I2
  __label_13:
    unless $I2 goto __label_12
    $P12 = $P3.'issubid'()
    isfalse $I2, $P12
  __label_12:
    unless $I2 goto __label_10
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_11
  __label_10: # else
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 1
    $P10[0] = $S2
    $P2 = $P1.'scopesearch'($P10, 0)
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
    getattribute $P10, $P2, 'owner'
    $P4 = $P10.'getpath'()
    set $P7, $P4
    null $S5
    elements $I1, $P7
    unless $I1 goto __label_17
    join $S9, "'; '", $P7
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S5, $S10
  __label_17: # endif
    set $S8, $S5
    goto __label_16
  __label_16:
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S8)
  __label_14: # endif
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
    new $P5, ['ResizableStringArray']
    $P1.'buildkey'($P5)
    $P2 = __ARG_2.'scopesearch'($P5, 0)
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_19
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_19:
    unless $I1 goto __label_18
    getattribute $P10, $P2, 'owner'
    $P6 = $P10.'getpath'()
    __ARG_1.'annotate'(__ARG_3)
    set $P8, $P6
    null $S6
    elements $I1, $P8
    unless $I1 goto __label_21
    join $S9, "'; '", $P8
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S6, $S10
  __label_21: # endif
    set $S11, $S6
    goto __label_20
  __label_20:
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S11)
  __label_18: # endif
    $P10 = $P5.'pop'()
    set $S2, $P10
    __ARG_1.'annotate'(__ARG_3)
    set $P9, $P5
    null $S7
    elements $I1, $P9
    unless $I1 goto __label_23
    join $S9, "'; '", $P9
    concat $S10, "[ '", $S9
    concat $S10, $S10, "' ]"
    set $S7, $S10
  __label_23: # endif
    set $S12, $S7
    goto __label_22
  __label_22:
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $S12)
    goto __label_5 # break
  __label_6: # default
    __ARG_1.'annotate'(__ARG_3)
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
    goto __label_4
  __label_3: # else
    $P10 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_24
    set $S4, $P10
  __label_24:
    __ARG_1.'annotate'(__ARG_3)
    ne $S4, 'null', __label_25
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_26
  __label_25: # else
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_26: # endif
  __label_4: # endif

.end # Builtin_varcast


.sub 'Builtin_say' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
    __ARG_1.'annotate'(__ARG_3)
    elements $I3, __ARG_5
    sub $I1, $I3, 1
    lt $I1, 0, __label_1
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
    inc $I2
    goto __label_5
  __label_4: # for end
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
    goto __label_2
  __label_1: # else
    __ARG_1.'emitsay'("''")
  __label_2: # endif

.end # Builtin_say


.sub 'Builtin_cry' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_9 = "WSubId_9"
    __ARG_1.'annotate'(__ARG_3)
    set $P1, __ARG_5
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P3 = WSubId_9("    print $P0, ")
    if_null $P1, __label_3
    iter $P7, $P1
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P4, $P7
    $P8 = $P3($P4)
    push $P2, $P8
    goto __label_2
  __label_3: # endfor
    set $P6, $P2
    goto __label_1
  __label_1:
    set $P5, $P6
    join $S1, "\n", $P5
    $P5 = WSubId_45("    getstderr $P0\n%0\n    print $P0, \"\\n\"\n", $S1)
    __ARG_1.'say'($P5)

.end # Builtin_cry


.sub 'Builtin_print' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_7 = "WSubId_7"
    __ARG_1.'annotate'(__ARG_3)
    set $P1, __ARG_5
    $P2 = WSubId_7(__ARG_1, "emitprint")
    if_null $P1, __label_3
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:

.end # Builtin_print


.sub 'Builtin_abs' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
    $P1 = __ARG_5[0]
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    ne $S3, 'S', __label_2
    $P3 = __ARG_2.'tempreg'('N')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
    __ARG_1.'annotate'(__ARG_3)
    __ARG_1.'emitset'($S2, $S1)
    __ARG_1.'emitarg2'('abs', $S2, $S2)
    __ARG_1.'emitset'(__ARG_4, $S2)
    goto __label_3
  __label_2: # else
    __ARG_1.'annotate'(__ARG_3)
    __ARG_1.'emitarg2'('abs', __ARG_4, $S1)
  __label_3: # endif

.end # Builtin_abs


.sub 'Builtin_ASSERT' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_45 = "WSubId_45"
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
    __ARG_1.'annotate'(__ARG_3)
    $P3 = __ARG_2.'genlabel'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
    $P1 = __ARG_5[0]
    $P2 = $P1.'emit_getint'(__ARG_1)
    __ARG_1.'emitif'($P2, $S1)
    $P4 = __ARG_3.'filename'()
    $P5 = __ARG_3.'linenum'()
    $P3 = WSubId_45("    getstderr $P0\n    print $P0, \"Assertion failed at '%0' line \"\n    print $P0, %1\n    print $P0, \"\\n\"\n    exit 1\n", $P4, $P5)
    __ARG_1.'print'($P3)
    __ARG_1.'emitlabel'($S1)
  __label_1: # endif

.end # Builtin_ASSERT


.sub 'Builtin_invoke' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_25 = "WSubId_25"
    $P1 = __ARG_5[0]
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
    WSubId_25("invoke argument must be callable", __ARG_3)
  __label_1: # endif
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)

.end # Builtin_invoke


.sub 'builtineval_length' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
    $P2 = WSubId_47($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    length $I1, $S1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)

.end # builtineval_length


.sub 'builtineval_bytelength' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
    $P2 = WSubId_47($P1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    bytelength $I1, $S1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)

.end # builtineval_bytelength


.sub 'builtineval_ord' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
    elements $I1, __ARG_3
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
    $P3 = WSubId_47($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    null $I2
    le $I1, 1, __label_2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
    $P3 = WSubId_48($P2)
    set $I2, $P3
  __label_2: # endif
    ord $I3, $S1, $I2
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I3)

.end # builtineval_ord


.sub 'builtineval_chr' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_48 = "WSubId_48"
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
    $P2 = WSubId_48($P1)
    set $I1, $P2
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S1)

.end # builtineval_chr


.sub 'builtineval_substr' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_46 = "WSubId_46"
    elements $I1, __ARG_3
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
    $P4 = WSubId_47($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
    $P4 = WSubId_48($P2)
    set $I2, $P4
    null $S2
    set $I4, __ARG_3
    le $I4, 2, __label_2
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
    $P4 = WSubId_48($P3)
    set $I3, $P4
    substr $S2, $S1, $I2, $I3
    goto __label_3
  __label_2: # else
    substr $S2, $S1, $I2
  __label_3: # endif
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S2)

.end # builtineval_substr


.sub 'builtineval_indexof' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_44 = "WSubId_44"
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
    $P3 = WSubId_47($P1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P3 = WSubId_47($P2)
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    index $I1, $S1, $S2
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I1)

.end # builtineval_indexof


.sub 'builtineval_indexof_pos' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_44 = "WSubId_44"
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
    $P4 = WSubId_47($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
    $P4 = WSubId_47($P2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
    $P6 = __ARG_3[2]
    getattribute $P5, $P6, 'arg'
    $P4 = WSubId_48($P5)
    set $I1, $P4
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_44(__ARG_1, __ARG_2, $I2)

.end # builtineval_indexof_pos


.sub 'builtineval_escape' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_46 = "WSubId_46"
.const 'Sub' WSubId_47 = "WSubId_47"
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
    $P2 = WSubId_47($P1)
    set $S3, $P2
    escape $S2, $S3
    escape $S1, $S2
    .tailcall WSubId_46(__ARG_1, __ARG_2, $S1)

.end # builtineval_escape


.sub 'builtin_sleep' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
    $P1 = __ARG_5[0]
    null $S1
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
    if_null $S2, __label_2
    length $I1, $S2
    ne $I1, 1, __label_2
    ord $I1, $S2
    if $I1 == 73 goto __label_4
    if $I1 == 78 goto __label_5
    goto __label_2
  __label_4: # case
    $P2 = $P1.'emit_getint'(__ARG_1)
    set $S1, $P2
    goto __label_3 # break
  __label_5: # case
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
    goto __label_3 # break
  __label_2: # default
    $P4 = $P1.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
    set $S1, "0"
    goto __label_7
  __label_6: # else
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
    set $S1, "$N0"
    __ARG_1.'annotate'(__ARG_3)
    __ARG_1.'emitset'($S1, $S3)
  __label_7: # endif
  __label_3: # switch end
    __ARG_1.'annotate'(__ARG_3)
    __ARG_1.'emitarg1'('sleep', $S1)

.end # builtin_sleep


.sub 'getbuiltins' :subid('WSubId_148')
        .param pmc __ARG_1
.const 'Sub' WSubId_49 = "WSubId_49"
.const 'Sub' WSubId_50 = "WSubId_50"
.const 'Sub' WSubId_51 = "WSubId_51"
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_55 = "WSubId_55"
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_61 = "WSubId_61"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_63 = "WSubId_63"
.const 'Sub' WSubId_64 = "WSubId_64"
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_66 = "WSubId_66"
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('I')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('int', WSubId_49, $P3, 'I', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('N')
    set $P3, $P4
    $P2.'BuiltinFunction'('float', $P3, 'N', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    new $P4, [ 'Winxed'; 'Compiler'; 'Builtin_typecast' ]
    $P4.'Builtin_typecast'('S')
    set $P3, $P4
    $P2.'BuiltinFunctionEval'('string', WSubId_50, $P3, 'S', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('var', WSubId_51, 'P', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sleep', WSubId_52, 'v', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('length', WSubId_53, 'length %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('bytelength', WSubId_54, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('chr', WSubId_55, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('ord', WSubId_56, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('ord', WSubId_56, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('substr', WSubId_57, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('substr', WSubId_57, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('indexof', WSubId_58, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('indexof', WSubId_59, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunctionEval' ]
    $P2.'BuiltinFunctionEval'('escape', WSubId_60, 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('unshift', 'unshift %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_var', 'pop %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_var', 'shift %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_int', 'pop %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_int', 'shift %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_float', 'pop %0, %1', 'N', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_float', 'shift %0, %1', 'N', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pop_string', 'pop %0, %1', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('shift_string', 'shift %0, %1', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('abs', WSubId_61, ':', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sinh', 'sinh %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cosh', 'cosh %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('tanh', 'tanh %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('print', WSubId_62, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('say', WSubId_63, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('cry', WSubId_64, 'v', '*')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('__ASSERT__', WSubId_65, 'v', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)
    new $P2, [ 'Winxed'; 'Compiler'; 'BuiltinFunction' ]
    $P2.'BuiltinFunction'('invoke', WSubId_66, 'P', '!')
    set $P1, $P2
    __ARG_1.'add'($P1)

.end # getbuiltins


.sub 'parseDotted' :subid('WSubId_85')
        .param pmc __ARG_1
    root_new $P1, ['parrot';'ResizablePMCArray']
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
    push $P1, $P2
  __label_3: # while
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
    $P2 = __ARG_1.'get'()
    push $P1, $P2
    goto __label_3
  __label_2: # endwhile
  __label_1: # endif
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseDotted


.sub 'parseList' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
    root_new $P1, ['parrot';'ResizablePMCArray']
    null $P2
  __label_1: # do
    $P3 = __ARG_3(__ARG_1, __ARG_2)
    push $P1, $P3
  __label_3: # continue
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
    unless_null __ARG_4, __label_4
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
    WSubId_25("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
    .return($P1)

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_27 = "WSubId_27"
    $P1 = __ARG_1.'get'()
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
    WSubId_27($P1)
  __label_1: # endif
    .return($P1)

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_86')
        .param pmc __ARG_1
.const 'Sub' WSubId_5 = "WSubId_5"
    new $P1, ['ResizableStringArray']
    set $P2, __ARG_1
    set $P3, $P1
    $P4 = WSubId_5("getidentifier")
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P5, $P6
    $P7 = $P4($P5)
    push $P3, $P7
    goto __label_2
  __label_3: # endfor
    goto __label_1
  __label_1:
    .return($P1)

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    setattribute self, 'start', __ARG_1
    setattribute self, 'owner', __ARG_2

.end # initbase


.sub 'clone' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    typeof $P1, self
    set $S1, $P1
    concat $S2, "Cannot use ", $S1
    concat $S2, $S2, " in inline (yet)"
    WSubId_25($S2, self)

.end # clone


.sub 'getstart' :method
    getattribute $P1, self, 'start'
    .return($P1)

.end # getstart


.sub 'viewable' :method
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
    .return("")
  __label_2: # endif

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)

.end # annotate


.sub 'getpath' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()

.end # getpath


.sub 'use_builtin' :method
        .param string __ARG_1
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)

.end # use_builtin


.sub 'generatesubid' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)

.end # scopesearch


.sub 'dowarnings' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()

.end # dowarnings

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addattribute $P0, 'start'
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    setattribute self, 'owner', __ARG_1
    setattribute self, 'e', __ARG_2

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'e'
    null $S1
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
    getattribute $P2, self, 'pnull'
    unless_null $P2, __label_3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
    $P1.'emitnull'($S2)
    box $P2, $S2
    setattribute self, 'pnull', $P2
  __label_3: # endif
    set $S1, $P2
    goto __label_2
  __label_1: # else
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
    .return($S1)

.end # add

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    addattribute $P0, 'owner'
    addattribute $P0, 'e'
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
    $P2 = WSubId_67(__ARG_1, __ARG_2, WSubId_68, __ARG_3)
    setattribute self, 'args', $P2

.end # SimpleArgList


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    getattribute $P2, self, 'args'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P6 = WSubId_3($P10, $P3)
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
    set $P9, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
    set $P8, $P9
    setattribute $P1, 'args', $P8
    .return($P1)

.end # clone


.sub 'numargs' :method
    getattribute $P1, self, 'args'
    elements $I1, $P1
    .return($I1)

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
    getattribute $P1, self, 'args'
    $P2 = $P1[__ARG_1]
    .return($P2)

.end # getarg


.sub 'optimizeargs' :method
    getattribute $P1, self, 'args'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    getattribute $P1, self, 'args'
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_5("emit_get")
    $P3 = WSubId_3($P6, __ARG_1)
    if_null $P1, __label_3
    iter $P7, $P1
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P4, $P7
    $P8 = $P3($P4)
    push $P2, $P8
    goto __label_2
  __label_3: # endfor
    set $P5, $P2
    goto __label_1
  __label_1:
    set $P6, $P5
    .return($P6)

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
    $P1 = self.'getargvalues'(__ARG_1)
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)

.end # emitargs

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
    getattribute $P1, self, 'name'
    .return($P1)

.end # getname


.sub 'numargs' :method
    getattribute $P1, self, 'args'
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'args'
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
    WSubId_30('Wrong modifier arg number')
  __label_1: # endif
    .tailcall $P1.'getarg'(__ARG_1)

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
    box $P1, __ARG_1
    setattribute self, 'name', $P1
    if_null __ARG_2, __label_1
    setattribute self, 'args', __ARG_2
  __label_1: # endif

.end # Modifier


.sub 'optimize' :method
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
    .return(self)

.end # optimize

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    addattribute $P0, 'name'
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P1 = __ARG_1.'get'()
    null $P2
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
    __ARG_1.'unget'($P1)
  __label_3: # endif
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_69 = "WSubId_69"
    $P2 = WSubId_67(__ARG_1, __ARG_2, WSubId_69, ']')
    setattribute self, 'list', $P2

.end # ModifierList


.sub 'optimize' :method
    getattribute $P1, self, 'list'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:

.end # optimize


.sub 'getlist' :method
    getattribute $P1, self, 'list'
    .return($P1)

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
    .return($P2)

.end # pick

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseUsing' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'iskeyword'('extern')
    set $I1, $P2
    if $I1 goto __label_3
    $P3 = $P1.'iskeyword'('static')
    set $I1, $P3
    if $I1 goto __label_4
    $P4 = $P1.'iskeyword'('namespace')
    set $I1, $P4
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    new $P6, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P6.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P5, $P6
    .return($P5)
  __label_4: # case
    new $P8, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P8.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
    new $P10, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P10.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P9, $P10
    .return($P9)
  __label_2: # default
    __ARG_2.'unget'($P1)
    new $P12, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P12.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P11, $P12
    .return($P11)
  __label_1: # switch end

.end # parseUsing


.sub 'parseSig' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_68 = "WSubId_68"
    new $P4, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P4.'SigParameterList'(__ARG_2, __ARG_3)
    set $P1, $P4
    $P2 = __ARG_2.'get'()
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
    WSubId_70("'='", $P2)
  __label_1: # endif
    $P3 = WSubId_68(__ARG_2, __ARG_3)
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)

.end # parseSig


.sub 'parseClassSpecifier' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    $P1 = __ARG_1.'get'()
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
    WSubId_25('Invalid class', $P1)

.end # parseClassSpecifier


.sub 'parseStatement' :subid('WSubId_125')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_76 = "WSubId_76"
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
    $P1 = __ARG_1.'get'()
    null $P2
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
    $P3 = __ARG_1.'get'()
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
    WSubId_71("':'", $P1)
  __label_5: # endif
    .tailcall WSubId_72($P1, __ARG_1, __ARG_2)
  __label_4: # endif
    $P5 = $P1.'checkkeyword'()
    set $S1, $P5
    if $S1 == 'using' goto __label_8
    if $S1 == 'const' goto __label_9
    if $S1 == 'volatile' goto __label_10
    if $S1 == 'var' goto __label_11
    if $S1 == 'string' goto __label_12
    if $S1 == 'int' goto __label_13
    if $S1 == 'float' goto __label_14
    if $S1 == 'return' goto __label_15
    if $S1 == 'yield' goto __label_16
    if $S1 == 'goto' goto __label_17
    if $S1 == 'if' goto __label_18
    if $S1 == 'while' goto __label_19
    if $S1 == 'do' goto __label_20
    if $S1 == 'continue' goto __label_21
    if $S1 == 'break' goto __label_22
    if $S1 == 'switch' goto __label_23
    if $S1 == 'for' goto __label_24
    if $S1 == 'throw' goto __label_25
    if $S1 == 'try' goto __label_26
    goto __label_6
  __label_8: # case
    .tailcall WSubId_73($P1, __ARG_1, __ARG_2)
  __label_9: # case
    .tailcall WSubId_74($P1, __ARG_1, __ARG_2)
    goto __label_7 # break
  __label_10: # case
    .tailcall WSubId_75($P1, __ARG_1, __ARG_2)
    goto __label_7 # break
  __label_11: # case
    $P2 = __ARG_1.'get'()
    __ARG_1.'unget'($P2)
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
    .tailcall WSubId_76($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_7 # break
  __label_12: # case
    $P2 = __ARG_1.'get'()
    __ARG_1.'unget'($P2)
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
    .tailcall WSubId_77($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_7 # break
  __label_13: # case
    $P2 = __ARG_1.'get'()
    __ARG_1.'unget'($P2)
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
    .tailcall WSubId_78($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_7 # break
  __label_14: # case
    $P2 = __ARG_1.'get'()
    __ARG_1.'unget'($P2)
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
    .tailcall WSubId_79($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_7 # break
  __label_15: # case
    .tailcall WSubId_80($P1, __ARG_1, __ARG_2)
  __label_16: # case
    new $P11, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P11.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_17: # case
    new $P13, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P13.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_18: # case
    new $P15, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P15.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_19: # case
    new $P17, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P17.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_20: # case
    new $P19, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P19.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_21: # case
    new $P21, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P21.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_22: # case
    new $P23, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P23.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_23: # case
    .tailcall WSubId_81($P1, __ARG_1, __ARG_2)
  __label_24: # case
    .tailcall WSubId_82($P1, __ARG_1, __ARG_2)
  __label_25: # case
    new $P25, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P25.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_26: # case
    new $P27, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P27.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_6: # default
  __label_7: # switch end
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
    $P4 = __ARG_1.'get'()
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
    __ARG_1.'unget'($P4)
  __label_31: # endif
    __ARG_1.'unget'($P1)
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'initbase'(__ARG_1, __ARG_2)

.end # Statement


.sub 'isempty' :method
    .return(0)

.end # isempty


.sub 'allowtailcall' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)

.end # tempreg


.sub 'freetemps' :method
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()

.end # freetemps


.sub 'genlabel' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)

.end # usenamespace


.sub 'getouter' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'start'
    WSubId_30('**checking**', $P1)
    .return(self)

.end # optimize

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
    .return(1)

.end # isempty


.sub 'clone' :method
        .param pmc __ARG_1
    .return(self)

.end # clone


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    WSubId_30('Attempt to annotate empty statement')

.end # annotate


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
    getattribute $P1, self, 'statements'
    elements $I1, $P1
    set $I2, 1
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
    null $I2
  __label_4: # endif
    $P1[$I3] = $P2
  __label_1: # for iteration
    inc $I3
    goto __label_3
  __label_2: # for end
    unless $I2 goto __label_7
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)

.end # optimize

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 2
    $P2[0] = __ARG_1
    $P2[1] = __ARG_2
    setattribute self, 'statements', $P2

.end # MultiStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    getattribute $P2, self, 'statements'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P6 = WSubId_3($P10, $P3)
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
    set $P9, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
    set $P8, $P9
    setattribute $P1, 'statements', $P8
    .return($P1)

.end # clone


.sub 'isempty' :method
    .return(0)

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'statements'
    push $P1, __ARG_1
    .return(self)

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
    set $P1, __ARG_1
    getattribute $P2, self, 'statements'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P3, $P2
    $P6 = WSubId_5("emit")
    $P4 = WSubId_3($P6, $P1)
    if_null $P3, __label_4
    iter $P7, $P3
    set $P7, 0
  __label_3: # for iteration
    unless $P7 goto __label_4
    shift $P5, $P7
    $P4($P5)
    goto __label_3
  __label_4: # endfor
  __label_2:
  __label_1:

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parsePiropArg' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_68 = "WSubId_68"
    null $P1
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
    goto __label_2
  __label_1: # else
    __ARG_1.'unget'($P2)
    $P1 = WSubId_68(__ARG_1, __ARG_2)
  __label_2: # endif
    .return($P1)

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'Statement'(__ARG_1, __ARG_3)
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'('.')
    set $I1, $P2
    unless $I1 goto __label_1
    $P1 = __ARG_2.'get'()
  __label_1: # endif
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
    __ARG_2.'unget'($P1)
    $P3 = WSubId_67(__ARG_2, __ARG_3, WSubId_83, '}')
    setattribute self, 'args', $P3
  __label_5: # endif
    WSubId_84(';', __ARG_2)

.end # PiropStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    getattribute $P8, self, 'start'
    $P1.'Statement'($P8, __ARG_1)
    getattribute $P9, self, 'opname'
    setattribute $P1, 'opname', $P9
    getattribute $P2, self, 'args'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P9 = WSubId_5("clone")
    $P6 = WSubId_3($P9, $P3)
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
    set $P10, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
    set $P8, $P10
    setattribute $P1, 'args', $P8
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P1, self, 'args'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    getattribute $P6, self, 'opname'
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
    self.'annotate'(__ARG_1)
    $P6 = __ARG_1.'getDebug'()
    if_null $P6, __label_2
    unless $P6 goto __label_2
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
  __label_2: # endif
    getattribute $P1, self, 'args'
    __ARG_1.'print'('    ')
    unless_null $P1, __label_3
    __ARG_1.'say'($S1)
    goto __label_4
  __label_3: # else
    set $P2, $P1
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_5("emit_get")
    $P4 = WSubId_3($P6, __ARG_1)
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P5, $P8
    $P9 = $P4($P5)
    push $P3, $P9
    goto __label_6
  __label_7: # endfor
    set $P7, $P3
    goto __label_5
  __label_5:
    set $P6, $P7
    join $S2, ', ', $P6
    __ARG_1.'say'($S1, ' ', $S2)
  __label_4: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'opname'
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_86 = "WSubId_86"
    self.'Statement'(__ARG_1, __ARG_3)
    $P1 = WSubId_85(__ARG_2)
    elements $I1, $P1
    if $I1 goto __label_1
    $P2 = __ARG_2.'get'()
    WSubId_27($P2)
  __label_1: # endif
    WSubId_84(';', __ARG_2)
    $P3 = WSubId_86($P1)
    setattribute self, 'path', $P3
    .return(self)

.end # ExternStatement


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'path'
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_87 = "WSubId_87"
    self.'Statement'(__ARG_1, __ARG_3)
    null $P3
    $P1 = WSubId_67(__ARG_2, $P3, WSubId_87, ';')
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
    self.'createvarnamed'($P2, 'P', $S1)
    goto __label_1
  __label_2: # endfor
    setattribute self, 'names', $P1

.end # StaticStatement


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'names'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
    $P5 = self.'getvar'($P1)
    $P4 = $P5.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P4, " = '", $P1, "'")
    goto __label_1
  __label_2: # endfor

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'Statement'(__ARG_1, __ARG_3)
    $P1 = WSubId_85(__ARG_2)
    elements $I1, $P1
    if $I1 goto __label_1
    $P2 = __ARG_2.'get'()
    WSubId_27($P2)
  __label_1: # endif
    WSubId_84(';', __ARG_2)
    setattribute self, 'path', $P1

.end # UsingStatement


.sub 'optimize' :method
    getattribute $P1, self, 'path'
    $P2 = $P1[-1]
    $P3 = self.'scopesearch'($P1, 0)
    isnull $I1, $P3
    if $I1 goto __label_3
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
    elements $I2, $P1
    unless $I2 goto __label_5
    clone $P4, $P1
    $P4.'pop'()
    $P5 = self.'scopesearch'($P4, 1)
    if_null $P5, __label_6
    $P3 = $P5.'getvar'($P2)
    if_null $P3, __label_7
    self.'createvarused'($P2, $P3)
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_7: # endif
  __label_6: # endif
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
    self.'createvarnamed'($P2, 'P', $S1)
    box $P7, $S1
    setattribute self, 'subid', $P7
    self.'usesubid'($S1)
    .return(self)
  __label_2: # default
  __label_1: # switch end
    self.'createvar'($P2, 'P')
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'path'
    $S1 = $P1[-1]
    $P2 = self.'getvar'($S1)
    getattribute $P4, self, 'subid'
    unless_null $P4, __label_1
    self.'annotate'(__ARG_1)
    null $S2
    elements $I1, $P1
    le $I1, 1, __label_2
    $P1.'pop'()
    set $P3, $P1
    null $S3
    elements $I1, $P3
    unless $I1 goto __label_4
    join $S4, "'; '", $P3
    concat $S5, "[ '", $S4
    concat $S5, $S5, "' ]"
    set $S3, $S5
  __label_4: # endif
    set $S2, $S3
    goto __label_3
  __label_3:
  __label_2: # endif
    $P4 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P4, $S1, $S2)
  __label_1: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'path'
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_25 = "WSubId_25"
    $P1 = WSubId_85(__ARG_2)
    elements $I1, $P1
    if $I1 goto __label_1
    WSubId_70('namespace identifier', __ARG_1)
  __label_1: # endif
    $P2 = __ARG_3.'scopesearch'($P1, 1)
    unless_null $P2, __label_2
    WSubId_25('unknow namespace', __ARG_1)
  __label_2: # endif
    __ARG_3.'usenamespace'($P2)

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'Statement'(__ARG_2, __ARG_3)
    WSubId_88(__ARG_1, __ARG_2, __ARG_3)
    WSubId_84(';', __ARG_2)

.end # UsingNamespaceStatement


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_28 = "WSubId_28"
    self.'Statement'(__ARG_1, __ARG_3)
    root_new $P1, ['parrot';'ResizablePMCArray']
    null $P2
  __label_1: # do
    $P3 = WSubId_68(__ARG_2, self)
    $P1.'push'($P3)
  __label_3: # continue
    $P2 = __ARG_2.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
    WSubId_28(';', $P2)
    setattribute self, 'expr', $P1

.end # ExprStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    getattribute $P8, self, 'start'
    $P1.'Statement'($P8, __ARG_1)
    getattribute $P2, self, 'expr'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P6 = WSubId_3($P10, $P3)
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
    set $P9, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
    set $P8, $P9
    setattribute $P1, 'expr', $P8
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P1, self, 'expr'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    getattribute $P1, self, 'expr'
    $P4 = WSubId_5("emit_void")
    $P2 = WSubId_3($P4, __ARG_1)
    if_null $P1, __label_3
    iter $P5, $P1
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
    setattribute self, 'type', __ARG_1
    setattribute self, 'reg', __ARG_2
    setattribute self, 'scope', __ARG_3
    box $P1, __ARG_4
    setattribute self, 'flags', $P1

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1

.end # setlex


.sub 'gettype' :method
    getattribute $P1, self, 'type'
    .return($P1)

.end # gettype


.sub 'getreg' :method
    getattribute $P1, self, 'reg'
    .return($P1)

.end # getreg


.sub 'getscope' :method
    getattribute $P1, self, 'scope'
    .return($P1)

.end # getscope


.sub 'getvalue' :method
    getattribute $P1, self, 'value'
    .return($P1)

.end # getvalue


.sub 'isconst' :method
    .return(0)

.end # isconst


.sub 'getlex' :method
    getattribute $P1, self, 'lexname'
    .return($P1)

.end # getlex


.sub 'getflags' :method
    getattribute $P1, self, 'flags'
    .return($P1)

.end # getflags


.sub 'issubid' :method
    getattribute $P1, self, 'reg'
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_1
    set $S2, $P1
    substr $S1, $S2, 0, 7
    iseq $I1, $S1, 'WSubId_'
  __label_1:
    .return($I1)

.end # issubid

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addattribute $P0, 'type'
    addattribute $P0, 'reg'
    addattribute $P0, 'scope'
    addattribute $P0, 'flags'
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
    setattribute self, 'name', __ARG_1

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'name'
    WSubId_30('Attempt to use unexpanded constant!!!', $P1)

.end # get_string

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)

.end # VarData_const


.sub 'isconst' :method
    .return(1)

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
    WSubId_30('Attempt change value of constant!!!')
  __label_1: # endif
    setattribute self, 'value', __ARG_1

.end # setvalue

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'VarContainer' :method
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2

.end # VarContainer


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'locals'
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
    $P2 = $P1[$S1]
    if_null $P2, __label_2
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_25($S3, __ARG_1)
  __label_2: # endif
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, $S2, self, __ARG_3)
    set $P3, $P4
    $P1[$S1] = $P3
    .return($P3)

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'locals'
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
    $P2 = $P1[$S1]
    if_null $P2, __label_2
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
    $P1[$S1] = __ARG_2

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'locals'
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
    $P2 = $P1[$S1]
    if_null $P2, __label_2
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'locals'
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
    $P2 = $P1[$S1]
    if_null $P2, __label_2
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_25($S2, __ARG_1)
  __label_2: # endif
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P4.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
    set $P3, $P4
    $P1[$S1] = $P3
    .return($P3)

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'locals'
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
    null $P1
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P3
    .return($P3)

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
    null $P1
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
    .return($P1)
  __label_1: # endif
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
    .return($P1)
  __label_2: # endif
    getattribute $P2, self, 'owner'
    if_null $P2, __label_3
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
    .return($P3)

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
    $P1 = self.'getouter'()
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    .return($S1)

.end # makelexical


.sub 'makelexicalself' :method
    self.'setlex'('__WLEX_self', 'self')
    .return('__WLEX_self')

.end # makelexicalself

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addattribute $P0, 'locals'
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]

.sub 'BlockStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'Statement'(__ARG_1, __ARG_2)
    self.'VarContainer'()

.end # BlockStatement

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'initbase'(__ARG_2, __ARG_1)

.end # Expr


.sub 'issimple' :method
    .return(0)

.end # issimple


.sub 'isliteral' :method
    .return(0)

.end # isliteral


.sub 'isintegerliteral' :method
    .return(0)

.end # isintegerliteral


.sub 'isintegerzero' :method
    .return(0)

.end # isintegerzero


.sub 'isfloatliteral' :method
    .return(0)

.end # isfloatliteral


.sub 'isstringliteral' :method
    .return(0)

.end # isstringliteral


.sub 'isidentifier' :method
    .return(0)

.end # isidentifier


.sub 'isnull' :method
    .return(0)

.end # isnull


.sub 'hascompilevalue' :method
    .return(0)

.end # hascompilevalue


.sub 'isnegable' :method
    .return(0)

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)

.end # tempreg


.sub 'genlabel' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()

.end # genlabel


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'cantailcall' :method
    .return(0)

.end # cantailcall


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'emit'(__ARG_1, __ARG_2)

.end # emit_init


.sub 'emit_get' :method
        .param pmc __ARG_1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'emit'(__ARG_1, $S2)
    .return($S2)

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    null $S2
    if_null $S1, __label_2
    length $I1, $S1
    ne $I1, 1, __label_2
    ord $I1, $S1
    if $I1 == 73 goto __label_4
    if $I1 == 78 goto __label_5
    if $I1 == 83 goto __label_6
    if $I1 == 80 goto __label_7
    goto __label_2
  __label_4: # case
    set $S2, "$I0"
    goto __label_3 # break
  __label_5: # case
    set $S2, "$N0"
    goto __label_3 # break
  __label_6: # case
    set $S2, "$S0"
    goto __label_3 # break
  __label_7: # case
    set $S2, "$P0"
    goto __label_3 # break
  __label_2: # default
    concat $S3, "Unexcpected emit_void with type '", $S1
    concat $S3, $S3, "'"
    getattribute $P1, self, 'start'
    WSubId_30($S3, $P1)
  __label_3: # switch end
    self.'emit'(__ARG_1, $S2)

.end # emit_void


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
    WSubId_25("Invalid 'null' usage", self)
  __label_1: # endif
    .tailcall self.'emit_get'(__ARG_1)

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitset'($S2, $S1)
    set $S1, $S2
  __label_2: # endif
    .return($S1)

.end # emit_getint


.sub 'emit_getvar' :method
        .param pmc __ARG_1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    eq $S1, 'P', __label_3
    set $S3, $S2
    $P1 = self.'tempreg'('P')
    set $S2, $P1
    __ARG_1.'emitbox'($S2, $S3)
  __label_3: # endif
    .return($S2)

.end # emit_getvar


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
    WSubId_89(self)

.end # emit_assign_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
    .return(1)

.end # issimple

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FinalExpr' ]

.sub 'optimize' :method
.const 'Sub' WSubId_30 = "WSubId_30"
    typeof $P1, self
    set $S1, $P1
    concat $S2, "misuse of ", $S1
    WSubId_30($S2, self)

.end # optimize

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
    self.'Expr'(__ARG_2, __ARG_3)
    $P1 = __ARG_1.'get'()
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
    WSubId_70('anonymous function', $P1)
  __label_1: # endif
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3

.end # FunctionExpr


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'optimize' :method
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'fn'
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_3
  __label_2: # else
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'fn'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
    setattribute self, 'condexpr', __ARG_1
    .return(self)

.end # set


.sub 'optimize_condition' :method
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2

.end # optimize_condition


.sub 'optimize' :method
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
    .return(self)

.end # optimize


.sub 'getvalue' :method
    getattribute $P1, self, 'condexpr'
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_3
    unless $P3 goto __label_3
    set $I1, 2
    goto __label_2
  __label_3:
    set $I1, 1
  __label_2:
    .return($I1)
  __label_1: # endif
    .return(0)

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'condexpr'
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if_null $S2, __label_5
    length $I1, $S2
    ne $I1, 1, __label_5
    ord $I1, $S2
    if $I1 == 83 goto __label_7
    if $I1 == 80 goto __label_8
    if $I1 == 73 goto __label_9
    if $I1 == 78 goto __label_10
    goto __label_5
  __label_7: # case
  __label_8: # case
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_6 # break
  __label_5: # default
    WSubId_30('Invalid if condition')
  __label_6: # switch end
  __label_2: # endif

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'condexpr'
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if_null $S2, __label_5
    length $I1, $S2
    ne $I1, 1, __label_5
    ord $I1, $S2
    if $I1 == 83 goto __label_7
    if $I1 == 80 goto __label_8
    if $I1 == 73 goto __label_9
    if $I1 == 78 goto __label_10
    goto __label_5
  __label_7: # case
  __label_8: # case
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_6 # break
  __label_5: # default
    WSubId_30('Invalid if condition')
  __label_6: # switch end
  __label_2: # endif

.end # emit_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
    .return(1)

.end # isliteral


.sub 'hascompilevalue' :method
    .return(1)

.end # hascompilevalue


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'strval', __ARG_2

.end # StringLiteral


.sub 'clone' :method
        .param pmc __ARG_1
    new $P2, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P3, self, 'strval'
    $P2.'StringLiteral'(__ARG_1, $P3)
    set $P1, $P2
    .return($P1)

.end # clone


.sub 'isstringliteral' :method
    .return(1)

.end # isstringliteral


.sub 'checkresult' :method
    .return('S')

.end # checkresult


.sub 'getPirString' :method
    getattribute $P1, self, 'strval'
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    .return($S1)

.end # getPirString


.sub 'get_value' :method
    getattribute $P1, self, 'strval'
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
    .return($S1)

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
    .tailcall self.'getPirString'()

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'pos', __ARG_2
    set $I1, __ARG_3
    box $P1, $I1
    setattribute self, 'numval', $P1

.end # IntegerLiteral


.sub 'clone' :method
        .param pmc __ARG_1
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    getattribute $P3, self, 'pos'
    getattribute $P4, self, 'numval'
    $P2.'IntegerLiteral'(__ARG_1, $P3, $P4)
    set $P1, $P2
    .return($P1)

.end # clone


.sub 'isintegerliteral' :method
    .return(1)

.end # isintegerliteral


.sub 'isintegerzero' :method
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)

.end # isintegerzero


.sub 'checkresult' :method
    .return('I')

.end # checkresult


.sub 'getIntegerValue' :method
    getattribute $P1, self, 'numval'
    .return($P1)

.end # getIntegerValue


.sub 'getFloatValue' :method
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
    .return($N1)

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
    if $I1 goto __label_1
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
  __label_1: # else
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_2: # endif

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
    .tailcall self.'getIntegerValue'()

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
    addattribute $P0, 'pos'
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'numval', __ARG_2

.end # FloatLiteral


.sub 'clone' :method
        .param pmc __ARG_1
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    getattribute $P3, self, 'numval'
    $P2.'FloatLiteral'(__ARG_1, $P3)
    set $P1, $P2
    .return($P1)

.end # clone


.sub 'isfloatliteral' :method
    .return(1)

.end # isfloatliteral


.sub 'checkresult' :method
    .return('N')

.end # checkresult


.sub 'getFloatValue' :method
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
    .return($N1)

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'emitset'(__ARG_2, $S1)

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_90 = "WSubId_90"
    $P1 = self.'getFloatValue'()
    set $N1, $P1
    .tailcall WSubId_90($N1)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'concat_literal' :subid('WSubId_94')
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, __ARG_1, 'strval'
    getattribute $P2, __ARG_2, 'strval'
    $P4 = $P1.'issinglequoted'()
    unless $P4 goto __label_3
    $P4 = $P2.'issinglequoted'()
  __label_3:
    if_null $P4, __label_2
    unless $P4 goto __label_2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P6, $P1, 'file'
    getattribute $P7, $P1, 'line'
    getattribute $P8, $P1, 'str'
    set $S1, $P8
    getattribute $P9, $P2, 'str'
    set $S2, $P9
    concat $S3, $S1, $S2
    $P5.'TokenSingleQuoted'($P6, $P7, $S3)
    set $P3, $P5
    goto __label_1
  __label_2:
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P1, 'file'
    getattribute $P13, $P1, 'line'
    $P14 = $P1.'getasquoted'()
    set $S4, $P14
    $P15 = $P2.'getasquoted'()
    set $S5, $P15
    concat $S6, $S4, $S5
    $P11.'TokenQuoted'($P12, $P13, $S6)
    set $P10, $P11
    set $P3, $P10
  __label_1:
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)

.end # concat_literal

.namespace [ 'Winxed'; 'Compiler'; 'FunctionId' ]

.sub 'FunctionId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
    self.'Expr'(__ARG_1, __ARG_2)
    box $P1, __ARG_4
    setattribute self, 'subid', $P1

.end # FunctionId


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'subid'
    .return($P1)

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'subid'
    __ARG_1.'emitset'(__ARG_2, $P1)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionRef' ]

.sub 'FunctionRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'sym', __ARG_3

.end # FunctionRef


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'sym'
    getattribute $P3, $P1, 'owner'
    $P2 = $P3.'getpath'()
    self.'annotate'(__ARG_1)
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'name'
    $P2.'emit_get_global'(__ARG_1, $P3, __ARG_2, $P4)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'sym'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
    .return(1)

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'name', __ARG_2

.end # IdentifierExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
    getattribute $P3, self, 'name'
    setattribute $P1, 'name', $P3
    .return($P1)

.end # clone


.sub 'isnull' :method
    getattribute $P1, self, 'name'
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
    .return(0)
  __label_1: # endif
    .tailcall $P1.'iskeyword'('null')

.end # isnull


.sub 'checkresult' :method
    getattribute $P1, self, 'name'
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
    set $S1, $P1
    if $S1 == 'self' goto __label_5
    if $S1 == 'null' goto __label_6
    goto __label_3
  __label_5: # case
  __label_6: # case
    .return('P')
  __label_3: # default
    .return('')
  __label_4: # switch end
  __label_2: # endif

.end # checkresult


.sub 'getName' :method
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    .return($S1)

.end # getName


.sub 'checkVar' :method
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'name'
    unless_null $P1, __label_1
    WSubId_30('Bad thing')
  __label_1: # endif
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    null $S1
    unless_null $P2, __label_2
    set $S2, $P1
    if $S2 == 'self' goto __label_6
    if $S2 == 'null' goto __label_7
    goto __label_4
  __label_6: # case
  __label_7: # case
    set $S1, $P1
    goto __label_5 # break
  __label_4: # default
    set $S1, ''
  __label_5: # switch end
    goto __label_3
  __label_2: # else
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
    .return($S1)

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_91 = "WSubId_91"
    $P1 = self.'checkIdentifier'()
    set $S1, $P1
    ne $S1, '', __label_1
    getattribute $P2, self, 'name'
    WSubId_91($P2, self)
  __label_1: # endif
    .return($P1)

.end # getIdentifier


.sub 'optimize' :method
    getattribute $P1, self, 'name'
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
    if_null $P2, __label_1
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
    .tailcall $P2.'getvalue'()
  __label_3: # endif
    $P5 = $P2.'getflags'()
    set $I1, $P5
    band $I2, $I1, 1
    unless $I2 goto __label_4
    band $I3, $I1, 2
    unless $I3 goto __label_6
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
    goto __label_5
  __label_4: # else
    $P3 = $P2.'getreg'()
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionId'($P7, $P8, $P1, $P3)
    set $P5, $P6
    .return($P5)
  __label_7: # endif
  __label_5: # endif
    goto __label_2
  __label_1: # else
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
    isnull $I2, $P4
    if $I2 goto __label_11
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I2 goto __label_12
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I2 goto __label_13
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    if $I2 goto __label_14
    goto __label_10
  __label_11: # case
    goto __label_9 # break
  __label_12: # case
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_15
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_17
    set $S1, $P6
  __label_17:
    self.'usesubid'($S1)
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionId' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionId'($P7, $P8, $P1, $S1)
    set $P5, $P6
    .return($P5)
    goto __label_16
  __label_15: # else
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'FunctionRef'($P7, $P8, $P4)
    set $P5, $P6
    .return($P5)
  __label_16: # endif
    goto __label_9 # break
  __label_13: # case
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    $P10.'FunctionRef'($P11, $P12, $P4)
    set $P9, $P10
    .return($P9)
  __label_14: # case
    new $P14, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
    getattribute $P15, self, 'owner'
    getattribute $P16, self, 'start'
    $P14.'InlineRef'($P15, $P16, $P4)
    set $P13, $P14
    .return($P13)
  __label_10: # default
  __label_9: # switch end
  __label_2: # endif
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitset'(__ARG_2, $S1)

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
    null $S1
    $P2 = self.'getIdentifier'()
    set $S1, $P2
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_1:
    band $I2, $I1, 1
    unless $I2 goto __label_3
    band $I3, $I1, 2
    unless $I3 goto __label_4
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
  __label_7:
    unless $I2 goto __label_6
    self.'annotate'(__ARG_1)
  __label_6: # endif
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_4: # endif
  __label_3: # endif
    .return($S1)

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    self.'annotate'(__ARG_1)
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
    WSubId_25("Cannot assign to null", self)
  __label_1: # endif
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
    if_null $S1, __label_6
    length $I1, $S1
    ne $I1, 1, __label_6
    ord $I1, $S1
    if $I1 == 83 goto __label_8
    if $I1 == 80 goto __label_9
    goto __label_6
  __label_8: # case
  __label_9: # case
    __ARG_1.'emitnull'($S2)
    goto __label_7 # break
  __label_6: # default
    WSubId_25("Can't assign null to that type", self)
  __label_7: # switch end
    goto __label_5
  __label_4: # else
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
    ne $S3, 'v', __label_13
    WSubId_25("Can't assign from void expression", self)
  __label_13: # endif
    ne $S1, $S3, __label_14
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
    self.'annotate'(__ARG_1)
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
  __label_15: # endif
  __label_11: # endif
  __label_5: # endif
    .return($S2)

.end # emit_assign_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
    setattribute self, 'desc', __ARG_2

.end # LexicalVolatileExpr


.sub 'checkresult' :method
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'desc'
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
    __ARG_1.'emitfind_lex'($S2, $S1)
    .return($S2)

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'annotate'(__ARG_1)
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'emitset'(__ARG_2, $S1)

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'desc'
    $P3 = $P2.'gettype'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    null $S2
    $P3 = __ARG_2.'isnull'()
    set $I1, $P3
    if $I1 goto __label_4
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
    $P4 = $P1.'tempreg'($S1)
    set $S2, $P4
    __ARG_1.'emitnull'($S2)
    goto __label_2 # break
  __label_5: # case
    $P5 = $P1.'tempreg'($S1)
    set $S2, $P5
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_2 # break
  __label_3: # default
    ne $S1, 'P', __label_6
    $P6 = __ARG_2.'emit_getvar'(__ARG_1)
    set $S2, $P6
    goto __label_7
  __label_6: # else
    $P7 = __ARG_2.'checkresult'()
    set $S3, $P7
    ne $S1, $S3, __label_8
    $P8 = __ARG_2.'emit_get'(__ARG_1)
    set $S2, $P8
    goto __label_9
  __label_8: # else
    $P9 = $P1.'tempreg'($S1)
    set $S2, $P9
    __ARG_2.'emit'(__ARG_1, $S2)
  __label_9: # endif
  __label_7: # endif
  __label_2: # switch end
    $P3 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P3, $S2)
    .return($S2)

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)

.end # emit_store

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'Expr'(__ARG_1, __ARG_2)

.end # initop

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_70 = "WSubId_70"
    self.'initop'(__ARG_2, __ARG_3)
    $P2 = WSubId_85(__ARG_1)
    setattribute self, 'key', $P2
    getattribute $P1, self, 'key'
    elements $I1, $P1
    if $I1 goto __label_1
    WSubId_70('namespace identifier', __ARG_3)
  __label_1: # endif

.end # OpNamespaceExpr


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'owner'
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
    unless_null $P2, __label_1
    WSubId_25('unknown namespace', self)
  __label_1: # endif
    $P3 = $P2.'getpath'()
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_92 = "WSubId_92"
    self.'initop'(__ARG_2, __ARG_3)
    $P2 = WSubId_92(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2

.end # OpClassExpr


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'clspec'
    null $P3
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    if $I1 goto __label_4
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    $P3 = $P2.'checknskey'($P1)
    if_null $P3, __label_7
    getattribute $P4, $P3, 'path'
    goto __label_6
  __label_7:
    null $P4
  __label_6:
    .return($P4)
  __label_4: # case
    $P3 = $P2.'checknskey'($P1)
    if_null $P3, __label_9
    getattribute $P5, $P3, 'path'
    goto __label_8
  __label_9:
    null $P5
  __label_8:
    .return($P5)
  __label_5: # case
    typeof $P6, $P2
    set $S1, $P6
    concat $S2, $S1, " not supported yet here"
    getattribute $P7, $P2, 'start'
    WSubId_25($S2, $P7)
  __label_2: # default
  __label_1: # switch end
    getattribute $P4, $P2, 'start'
    WSubId_30("Unexpected class key", $P4)

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'owner'
    getattribute $P2, self, 'clspec'
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    goto __label_2
  __label_3: # case
    $P3 = $P2.'checknskey'($P1)
    if_null $P3, __label_4
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
    .return()
  __label_4: # endif
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
    __ARG_1.'say'()

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'initop'(__ARG_1, __ARG_2)
    setattribute self, 'subexpr', __ARG_3

.end # OpUnaryExpr


.sub 'cloneunary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'start'
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'clone'(__ARG_2)
    __ARG_1.'OpUnaryExpr'(__ARG_2, $P1, $P2)
    .return(__ARG_1)

.end # cloneunary


.sub 'optimizearg' :method
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2

.end # optimizearg


.sub 'optimize' :method
    self.'optimizearg'()
    .return(self)

.end # optimize

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'subexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'initop'(__ARG_1, __ARG_2)
    setattribute self, 'lexpr', __ARG_3
    setattribute self, 'rexpr', __ARG_4

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    .return(self)

.end # set


.sub 'clonebinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'start'
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'clone'(__ARG_2)
    getattribute $P5, self, 'rexpr'
    $P4 = $P5.'clone'(__ARG_2)
    __ARG_1.'initbinary'(__ARG_2, $P1, $P2, $P4)
    .return(__ARG_1)

.end # clonebinary


.sub 'setfrom' :method
        .param pmc __ARG_1
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)

.end # setfrom


.sub 'optimizearg' :method
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2

.end # optimizearg


.sub 'optimize' :method
    self.'optimizearg'()
    .return(self)

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)

.end # emit_intright

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'lexpr'
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
    .return('I')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
    self.'optimizearg'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_44($P3, $P4, $P5)
  __label_1: # endif
    .return(self)

.end # optimize

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
    .return('I')

.end # checkresult

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpDeleteExpr


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
    self.'optimizearg'()
    getattribute $P1, self, 'subexpr'
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    not $I1, $I2
    if $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    iseq $I1, $S1, 'S'
  __label_2:
    unless $I1 goto __label_1
    WSubId_25("delete with invalid operator", self)
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'emit_void' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'subexpr'
    $P1.'emit_prep'(__ARG_1)
    self.'annotate'(__ARG_1)
    __ARG_1.'print'('    delete ')
    $P1.'emit_aux'(__ARG_1)
    __ARG_1.'say'()

.end # emit_void


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'emit_void'(__ARG_1)
    __ARG_1.'emitset'(__ARG_2, '1')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'subexpr'
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
    $P1.'emit_prep'(__ARG_1)
    self.'annotate'(__ARG_1)
    __ARG_1.'print'('    exists ', __ARG_2, ', ')
    $P1.'emit_aux'(__ARG_1)
    __ARG_1.'say'()
    goto __label_2
  __label_1: # else
    WSubId_25("exists with invalid operator", self)
  __label_2: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpUnaryMinusExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)

.end # clone


.sub 'checkresult' :method
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
    .return(self)

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_93 = "WSubId_93"
    getattribute $P1, self, 'subexpr'
    self.'optimizearg'()
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_93($P2, $P3, $N2)
  __label_2: # endif
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpNotExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)

.end # clone


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'checkresult' :method
    .return('I')

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
    .return(self)

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
    self.'optimizearg'()
    getattribute $P1, self, 'subexpr'
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
    .tailcall $P1.'negated'()
  __label_2: # endif
    .return(self)

.end # optimize


.sub 'negated' :method
    getattribute $P1, self, 'subexpr'
    .return($P1)

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'subexpr'
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    self.'annotate'(__ARG_1)
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    if_null $S2, __label_2
    length $I1, $S2
    ne $I1, 1, __label_2
    ord $I1, $S2
    if $I1 == 73 goto __label_4
    if $I1 == 80 goto __label_5
    goto __label_2
  __label_4: # case
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_3 # break
  __label_5: # case
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_3 # break
  __label_2: # default
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_3: # switch end

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]

.sub 'OpBinNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpBinNotExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)

.end # clone


.sub 'checkresult' :method
    .return('I')

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
    .return(self)

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
    self.'optimizearg'()
    getattribute $P1, self, 'subexpr'
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_44($P2, $P3, $I2)
  __label_1: # endif
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
    .tailcall $P1.'negated'()
  __label_2: # endif
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'subexpr'
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'subexpr'
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif

.end # iflexical

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'emitset'(__ARG_2, $S1)

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'emit_get'(__ARG_1)

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpPreIncExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitinc'($S1)
    self.'iflexical'(__ARG_1, $S1)
    .return($S1)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpPreDecExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitdec'($S1)
    self.'iflexical'(__ARG_1, $S1)
    .return($S1)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpPostIncExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_2
    $P2 = self.'tempreg'('P')
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    __ARG_1.'emitset'(__ARG_2, $S2)
    goto __label_3
  __label_2: # else
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
    __ARG_1.'emitinc'($S1)
    self.'iflexical'(__ARG_1, $S1)

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    $P2 = self.'checkresult'()
    $P1 = self.'tempreg'($P2)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_3
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    goto __label_4
  __label_3: # else
    __ARG_1.'emitset'($S2, $S1)
  __label_4: # endif
    __ARG_1.'emitinc'($S1)
    self.'iflexical'(__ARG_1, $S1)
    .return($S2)

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitinc'($S1)
    self.'iflexical'(__ARG_1, $S1)

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # OpPostDecExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    .tailcall self.'cloneunary'($P1, __ARG_1)

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_2
    $P2 = self.'tempreg'('P')
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    __ARG_1.'emitset'(__ARG_2, $S2)
    goto __label_3
  __label_2: # else
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif
    __ARG_1.'emitdec'($S1)
    self.'iflexical'(__ARG_1, $S1)
    .return($S1)

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    $P2 = self.'checkresult'()
    $P1 = self.'tempreg'($P2)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    $P1 = self.'checkresult'()
    set $S3, $P1
    ne $S3, 'P', __label_3
    __ARG_1.'emitarg2'('clone', $S2, $S1)
    goto __label_4
  __label_3: # else
    __ARG_1.'emitset'($S2, $S1)
  __label_4: # endif
    __ARG_1.'emitdec'($S1)
    self.'iflexical'(__ARG_1, $S1)
    .return($S2)

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitdec'($S1)
    self.'iflexical'(__ARG_1, $S1)

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'lexpr', __ARG_3
    setattribute self, 'rexpr', __ARG_4
    .return(self)

.end # set


.sub 'cloneassign' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'start'
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'clone'(__ARG_2)
    getattribute $P5, self, 'rexpr'
    $P4 = $P5.'clone'(__ARG_2)
    .tailcall __ARG_1.'set'(__ARG_2, $P1, $P2, $P4)

.end # cloneassign


.sub 'checkresult' :method
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()

.end # checkresult


.sub 'optimize_base' :method
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
    .return(self)

.end # optimize_base


.sub 'optimize' :method
    .tailcall self.'optimize_base'()

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_89 = "WSubId_89"
    getattribute $P1, self, 'lexpr'
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
    $P2 = $P1.'isliteral'()
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
    WSubId_89($P1)
  __label_1: # endif

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitset'(__ARG_2, $S1)

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'emit_get'(__ARG_1)

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'lexpr'
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    .tailcall self.'cloneassign'($P1, __ARG_1)

.end # clone


.sub 'emit_get' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P1.'emit_assign_get'(__ARG_1, $P2)

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'annotate'(__ARG_1)
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'emitassign'(__ARG_2, $S1)

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    self.'checkleft'()
    getattribute $P1, self, 'lexpr'
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
    WSubId_25("Wrong dest type in =:", $P1)
  __label_1: # endif
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitassign'($S1, $S2)
    .return($S1)

.end # emit_get


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
    self.'checkleft'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
    null $S5
    self.'annotate'(__ARG_1)
    if_null $S1, __label_8
    length $I1, $S1
    ne $I1, 1, __label_8
    ord $I1, $S1
    if $I1 == 83 goto __label_10
    if $I1 == 73 goto __label_11
    if $I1 == 78 goto __label_12
    goto __label_8
  __label_10: # case
    eq $S2, 'S', __label_13
    $P3 = self.'tempreg'('S')
    set $S5, $P3
    __ARG_1.'emitset'($S5, $S4)
    set $S4, $S5
  __label_13: # endif
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
    eq $S1, $S2, __label_14
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
    __ARG_1.'emitset'($S5, $S4)
    set $S4, $S5
  __label_14: # endif
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_9 # break
  __label_8: # default
    __ARG_1.'emitaddto'($S3, $S4)
  __label_9: # switch end
  __label_5: # endif
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_15
    $P1.'emit_store'(__ARG_1, $S3)
  __label_15: # endif
    .return($S3)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    self.'checkleft'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
    null $S5
    self.'annotate'(__ARG_1)
    if_null $S1, __label_5
    length $I1, $S1
    ne $I1, 1, __label_5
    ord $I1, $S1
    if $I1 == 83 goto __label_7
    if $I1 == 73 goto __label_8
    if $I1 == 78 goto __label_9
    goto __label_5
  __label_7: # case
    WSubId_25("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
    eq $S1, $S2, __label_10
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
    __ARG_1.'emitset'($S5, $S4)
    set $S4, $S5
  __label_10: # endif
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_6 # break
  __label_5: # default
    __ARG_1.'emitsubto'($S3, $S4)
  __label_6: # switch end
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_11
    $P1.'emit_store'(__ARG_1, $S3)
  __label_11: # endif
    .return($S3)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
    self.'checkleft'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    null $S2
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    if_null $S3, __label_2
    length $I1, $S3
    ne $I1, 1, __label_2
    ord $I1, $S3
    if $I1 == 83 goto __label_4
    goto __label_2
  __label_4: # case
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
    self.'annotate'(__ARG_1)
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_3 # break
  __label_2: # default
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
    self.'annotate'(__ARG_1)
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_3: # switch end
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_5
    $P1.'emit_store'(__ARG_1, $S1)
  __label_5: # endif
    .return($S1)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
    self.'checkleft'()
    getattribute $P1, self, 'lexpr'
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitarg2'('div', $S1, $S2)
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_3
    $P1.'emit_store'(__ARG_1, $S1)
  __label_3: # endif
    .return($S1)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
    self.'checkleft'()
    getattribute $P1, self, 'lexpr'
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitarg2'('mod', $S1, $S2)
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_3
    $P1.'emit_store'(__ARG_1, $S1)
  __label_3: # endif
    .return($S1)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
    .return('I')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
    self.'optimizearg'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'isintegerliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isintegerliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_44($P3, $P4, $P5)
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
    self.'annotate'(__ARG_1)
    null $S5
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
    $P1 = self.'tempreg'('N')
    set $S5, $P1
    __ARG_1.'emitset'($S5, $S3)
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
    $P2 = self.'tempreg'('N')
    set $S5, $P2
    __ARG_1.'emitset'($S5, $S4)
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
    $P3 = self.'tempreg'('I')
    set $S5, $P3
    __ARG_1.'emitset'($S5, $S3)
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
    $P4 = self.'tempreg'('I')
    set $S5, $P4
    __ARG_1.'emitset'($S5, $S4)
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
    $P5 = self.'tempreg'('S')
    set $S5, $P5
    __ARG_1.'emitset'($S5, $S3)
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
    $P6 = self.'tempreg'('S')
    set $S5, $P6
    __ARG_1.'emitset'($S5, $S4)
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
    if __ARG_3 == 0 goto __label_21
    if __ARG_3 == 1 goto __label_22
    if __ARG_3 == 2 goto __label_23
    goto __label_19
  __label_21: # case
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_22: # case
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_23: # case
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_19: # default
  __label_20: # switch end

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'emit_comparator'(__ARG_1, __ARG_2)

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)

.end # emit_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2

.end # Negable


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'negated' :method
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    getattribute $P1, self, 'positive'
    assign $P1, $I1
    .return(self)

.end # negated

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
    self.'Negable'(__ARG_3)
    setattribute self, 'expr', __ARG_2

.end # CheckerExpr


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'checkresult' :method
    .return('I')

.end # checkresult

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    __ARG_1.'emitif_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
    __ARG_1.'emitunless_null'($S1, __ARG_2)
  __label_3: # endif

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif

.end # emit_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]

.sub 'ZeroCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'expr'
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_3
  __label_2: # else
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_3: # endif

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'expr'
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
    __ARG_1.'emitif'($S1, __ARG_2)
  __label_3: # endif

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'expr'
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif

.end # emit_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'OpEqualExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    self.'Negable'(__ARG_5)

.end # OpEqualExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P2, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = self.'clonebinary'($P2, __ARG_1)
    getattribute $P2, self, 'positive'
    $P1.'Negable'($P2)
    .return($P1)

.end # clone


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
    self.'optimizearg'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'isnull'()
    set $I1, $P3
    $P3 = $P2.'isnull'()
    set $I2, $P3
    unless $I1 goto __label_1
    unless $I2 goto __label_2
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_44($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
  __label_1: # endif
    unless $I2 goto __label_4
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_8
    $P3 = $P2.'isliteral'()
  __label_8:
    if_null $P3, __label_7
    unless $P3 goto __label_7
    ne $S1, $S2, __label_9
    if_null $S1, __label_10
    length $I7, $S1
    ne $I7, 1, __label_10
    ord $I7, $S1
    if $I7 == 73 goto __label_12
    if $I7 == 83 goto __label_13
    goto __label_10
  __label_12: # case
    $P4 = $P1.'getIntegerValue'()
    set $I3, $P4
    $P5 = $P2.'getIntegerValue'()
    set $I4, $P5
    getattribute $P6, self, 'positive'
    if_null $P6, __label_15
    unless $P6 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    .tailcall WSubId_44($P7, $P8, $I5)
  __label_13: # case
    getattribute $P10, $P1, 'strval'
    getattribute $P9, $P10, 'str'
    null $S3
    if_null $P9, __label_16
    set $S3, $P9
  __label_16:
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_17
    set $S4, $P11
  __label_17:
    getattribute $P13, self, 'positive'
    if_null $P13, __label_19
    unless $P13 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    .tailcall WSubId_44($P14, $P15, $I6)
  __label_10: # default
  __label_11: # switch end
  __label_9: # endif
  __label_7: # endif
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
    .return(self)

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'iseq'
    goto __label_1
  __label_2:
    set $S1, 'isne'
  __label_1:
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'annotate'(__ARG_1)
    self.'emit_comparator'(__ARG_1, __ARG_2)

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'eq'
    goto __label_1
  __label_2:
    set $S1, 'ne'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S1, 'ne'
    goto __label_1
  __label_2:
    set $S1, 'eq'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)

.end # emitop_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]

.sub 'OpSameExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    self.'Negable'(__ARG_5)

.end # OpSameExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P2, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P1 = self.'clonebinary'($P2, __ARG_1)
    getattribute $P2, self, 'positive'
    $P1.'Negable'($P2)
    .return($P1)

.end # clone


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'positive'
    set $I1, $P1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'emit_comparator'(__ARG_1, __ARG_2)

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'positive'
    set $I1, $P1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'positive'
    set $I1, $P1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)

.end # emitop_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'negated' :method
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
    islt $I1, __ARG_1, __ARG_2
    .return($I1)

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)

.end # emitop_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'negated' :method
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)

.end # emitop_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'negated' :method
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
    isle $I1, __ARG_1, __ARG_2
    .return($I1)

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)

.end # emitop_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'isnegable' :method
    .return(1)

.end # isnegable


.sub 'negated' :method
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
    isge $I1, __ARG_1, __ARG_2
    .return($I1)

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)

.end # emitop_else

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    set $S2, $P1
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_3
    getattribute $P4, self, 'rexpr'
    $P3 = $P4.'checkresult'()
    set $S3, $P3
    iseq $I1, $S3, 'I'
  __label_3:
    unless $I1 goto __label_2
    set $S1, 'I'
    goto __label_1
  __label_2:
    set $S1, 'P'
  __label_1:
    .return($S1)

.end # checkresult

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpBoolAndExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
    self.'optimizearg'()
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
    unless $I1 goto __label_3
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_44($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
    .return($P1)
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    $P3 = $P1.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    $P3 = $P2.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
    __ARG_1.'emitbinop'('and', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
    $P4 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
    __ARG_1.'emitunless'(__ARG_2, $S4)
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    $P3 = $P1.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    $P3 = $P2.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
    __ARG_1.'emitbinop'('and', "$I0", $S2, $S3)
    goto __label_3
  __label_2: # else
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_9
    set $S5, $P3
  __label_9:
    __ARG_1.'emitunless'($S5, $S4)
    $P2.'emit_void'(__ARG_1)
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpBoolOrExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
    self.'optimizearg'()
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
    if $I1 goto __label_3
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_44($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
    .return($P1)
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    $P3 = $P1.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    $P3 = $P2.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
    __ARG_1.'emitbinop'('or', __ARG_2, $S2, $S3)
    goto __label_3
  __label_2: # else
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_11
    $P3 = $P1.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_11:
    unless $I1 goto __label_9
    $P4 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
    __ARG_1.'emitif'(__ARG_2, $S4)
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_15
    $P3 = $P2.'checkresult'()
    set $S7, $P3
    isne $I1, $S7, 'P'
  __label_15:
    unless $I1 goto __label_13
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P4, __label_16
    set $S6, $P4
  __label_16:
    __ARG_1.'emitbox'(__ARG_2, $S6)
    goto __label_14
  __label_13: # else
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    iseq $I1, $S1, 'I'
    box $P3, $I1
    unless $P3 goto __label_5
    $P3 = $P1.'issimple'()
  __label_5:
    unless $P3 goto __label_4
    $P3 = $P2.'issimple'()
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
    $P4 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
    $P3 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P3, __label_7
    set $S3, $P3
  __label_7:
    __ARG_1.'emitbinop'('or', "$I0", $S2, $S3)
    goto __label_3
  __label_2: # else
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S4
    if_null $P3, __label_8
    set $S4, $P3
  __label_8:
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_9
    set $S5, $P3
  __label_9:
    __ARG_1.'emitif'($S5, $S4)
    $P2.'emit_void'(__ARG_1)
    __ARG_1.'emitlabel'($S4)
  __label_3: # endif

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpBinAndExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitbinop'('band', __ARG_2, $S1, $S2)

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
    band $I1, __ARG_1, __ARG_2
    .return($I1)

.end # do_op

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpBinOrExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitbinop'('bor', __ARG_2, $S1, $S2)

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
    bor $I1, __ARG_1, __ARG_2
    .return($I1)

.end # do_op

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitbinop'('bxor', __ARG_2, $S1, $S2)

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)

.end # do_op

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'Expr'(__ARG_1, __ARG_2)
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
    getattribute $P3, __ARG_4, 'values'
    self.'append'($P3)
    goto __label_6
  __label_5: # else
    self.'pushexpr'(__ARG_4)
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
    getattribute $P5, __ARG_4, 'values'
    setattribute self, 'values', $P5
    self.'unshiftexpr'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 2
    $P7[0] = __ARG_3
    $P7[1] = __ARG_4
    setattribute self, 'values', $P7
  __label_1: # switch end

.end # ConcatString


.sub 'pushexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_94 = "WSubId_94"
    getattribute $P1, self, 'values'
    $P2 = $P1[-1]
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P4 = WSubId_94($P2, __ARG_1)
    $P1[-1] = $P4
    goto __label_2
  __label_1: # else
    push $P1, __ARG_1
  __label_2: # endif

.end # pushexpr


.sub 'unshiftexpr' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_94 = "WSubId_94"
    getattribute $P1, self, 'values'
    $P2 = $P1[0]
    $P3 = $P2.'isstringliteral'()
    unless $P3 goto __label_3
    $P3 = __ARG_1.'isstringliteral'()
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P4 = WSubId_94(__ARG_1, $P2)
    $P1[0] = $P4
    goto __label_2
  __label_1: # else
    unshift $P1, __ARG_1
  __label_2: # endif

.end # unshiftexpr


.sub 'append' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_94 = "WSubId_94"
    getattribute $P1, self, 'values'
    $P2 = $P1[-1]
    $P4 = $P2.'isstringliteral'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
    $P3 = __ARG_1[0]
    $P4 = $P3.'isstringliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
    $P5 = WSubId_94($P2, $P3)
    $P1[-1] = $P5
    __ARG_1.'shift'()
  __label_2: # endif
  __label_1: # endif
    $P1.'append'(__ARG_1)

.end # append


.sub 'checkresult' :method
    .return('S')

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'values'
    elements $I1, $P1
    new $P2, ['FixedStringArray'], $I1
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
    inc $I2
    goto __label_3
  __label_2: # for end
    .return($P2)

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'emitset'(__ARG_2, $S1)

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
    $P1 = self.'getregs'(__ARG_1)
    elements $I1, $P1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    self.'annotate'(__ARG_1)
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
    inc $I2
    goto __label_4
  __label_3: # for end
    .return($S1)

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'getregs'(__ARG_1)
    elements $I1, $P1
    self.'annotate'(__ARG_1)
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
    inc $I2
    goto __label_3
  __label_2: # for end

.end # emit_init


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'getregs'(__ARG_1)
    elements $I1, $P1
    self.'annotate'(__ARG_1)
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
    inc $I2
    goto __label_3
  __label_2: # for end

.end # emit_concat_to

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)

.end # RepeatString


.sub 'checkresult' :method
    .return('S')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'rexpr'
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpAddExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_93 = "WSubId_93"
    self.'optimizearg'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'S'
  __label_6:
    unless $I3 goto __label_5
    .tailcall WSubId_94($P1, $P2)
  __label_5: # endif
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_8
    iseq $I3, $S2, 'I'
  __label_8:
    unless $I3 goto __label_7
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_7: # endif
    $P3 = WSubId_95($S1, $S2)
    if_null $P3, __label_9
    unless $P3 goto __label_9
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_93($P3, $P4, $N3)
  __label_9: # endif
  __label_3: # endif
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'S'
  __label_11:
    unless $I3 goto __label_10
    new $P4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    $P4.'ConcatString'($P5, $P6, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_10: # endif
    .return(self)

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_95 = "WSubId_95"
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    ne $S1, $S2, __label_3
    .return($S1)
  __label_3: # endif
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
    .return('S')
  __label_4: # endif
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
    .return('S')
  __label_6: # endif
    $P1 = WSubId_95($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
    .return('N')
  __label_8: # endif
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
    ne $S1, 'S', __label_6
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
    eq $S2, 'S', __label_11
    __ARG_1.'emitset'($S6, $S4)
    set $S4, $S6
    goto __label_12
  __label_11: # else
    __ARG_1.'emitset'($S6, $S5)
    set $S5, $S6
  __label_12: # endif
  __label_8: # endif
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
    goto __label_7
  __label_6: # else
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
    null $S7
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
    $P3 = self.'tempreg'('I')
    set $S7, $P3
    __ARG_1.'emitset'($S7, $S4)
  __label_18: # endif
    null $S8
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
    $P3 = self.'tempreg'('I')
    set $S8, $P3
    __ARG_1.'emitset'($S8, $S5)
  __label_20: # endif
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
    goto __label_14
  __label_13: # else
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
  __label_7: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpSubExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
    self.'optimizearg'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_2
    $P3 = $P2.'isliteral'()
  __label_2:
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P4 = $P1.'checkresult'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_5: # endif
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'checkresult' :method
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
    .return($S1)
  __label_6: # case
    .return('P')
  __label_8: # case
    .return('N')
  __label_10: # case
    .return('N')
  __label_4: # default
    .return('I')
  __label_3: # switch end

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
    null $S6
    eq $S2, $S1, __label_6
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
    ne $S1, 'P', __label_7
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
    set $S4, $S6
  __label_6: # endif
    eq $S3, $S1, __label_9
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
    ne $S1, 'P', __label_10
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
    set $S5, $S6
  __label_9: # endif
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpMulExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_93 = "WSubId_93"
    self.'optimizearg'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    $P3 = $P1.'isliteral'()
    unless $P3 goto __label_4
    $P3 = $P2.'isliteral'()
  __label_4:
    if_null $P3, __label_3
    unless $P3 goto __label_3
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_44($P3, $P4, $I3)
  __label_5: # endif
    $P3 = WSubId_95($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_93($P3, $P4, $N3)
  __label_7: # endif
  __label_3: # endif
    ne $S1, 'S', __label_8
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
    .return(self)

.end # optimize


.sub 'checkresult' :method
    getattribute $P1, self, 'lexpr'
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
    ne $S1, $S2, __label_3
    .return($S1)
  __label_3: # endif
    ne $S1, 'S', __label_4
    .return('S')
    goto __label_5
  __label_4: # else
    .return('N')
  __label_5: # endif

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    null $S3
    null $S4
    iseq $I3, $S1, $S2
    unless $I3 goto __label_4
    iseq $I3, $S1, 'I'
    if $I3 goto __label_6
    iseq $I3, $S1, 'N'
  __label_6:
    if $I3 goto __label_5
    iseq $I3, $S1, 'P'
  __label_5:
  __label_4:
    unless $I3 goto __label_3
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
    .return()
  __label_3: # endif
    ne $S1, 'N', __label_7
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
    null $S5
    if_null $S2, __label_8
    length $I3, $S2
    ne $I3, 1, __label_8
    ord $I3, $S2
    if $I3 == 73 goto __label_10
    if $I3 == 78 goto __label_11
    goto __label_8
  __label_10: # case
    $P3 = self.'tempreg'('N')
    set $S5, $P3
    __ARG_1.'emitset'($S5, $S4)
    set $S5, $S4
    goto __label_9 # break
  __label_11: # case
    set $S5, $S4
    goto __label_9 # break
  __label_8: # default
    $P4 = self.'tempreg'('N')
    set $S5, $P4
    __ARG_1.'emitset'($S5, $S4)
  __label_9: # switch end
    self.'annotate'(__ARG_1)
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
    .return()
  __label_7: # endif
    null $I1
    null $I2
    $P4 = $P1.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_14
    $P3 = $P1.'isidentifier'()
  __label_14:
    if_null $P3, __label_12
    unless $P3 goto __label_12
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S3, $P5
    $P1.'emit'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
    set $S3, $I1
  __label_13: # endif
    $P4 = $P2.'issimple'()
    isfalse $I3, $P4
    box $P3, $I3
    if $P3 goto __label_17
    $P3 = $P2.'isidentifier'()
  __label_17:
    if_null $P3, __label_15
    unless $P3 goto __label_15
    $P6 = self.'checkresult'()
    $P5 = self.'tempreg'($P6)
    set $S4, $P5
    $P2.'emit'(__ARG_1, $S4)
    goto __label_16
  __label_15: # else
    if_null $S2, __label_18
    length $I3, $S2
    ne $I3, 1, __label_18
    ord $I3, $S2
    if $I3 == 83 goto __label_20
    if $I3 == 78 goto __label_21
    if $I3 == 73 goto __label_22
    goto __label_18
  __label_20: # case
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_21: # case
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_22: # case
  __label_18: # default
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
  __label_16: # endif
    self.'annotate'(__ARG_1)
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpDivExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_95 = "WSubId_95"
    self.'optimizearg'()
    getattribute $P1, self, 'lexpr'
    getattribute $P2, self, 'rexpr'
    $P5 = $P1.'isliteral'()
    unless $P5 goto __label_2
    $P5 = $P2.'isliteral'()
  __label_2:
    if_null $P5, __label_1
    unless $P5 goto __label_1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
    null $P3
    null $P4
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
    unless $I2 goto __label_7
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall WSubId_93($P5, $P6, $N3)
  __label_7: # endif
  __label_5: # endif
    $P5 = WSubId_95($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
    set $I3, $N2
    unless $I3 goto __label_9
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_93($P5, $P6, $N3)
  __label_9: # endif
  __label_8: # endif
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'checkresult' :method
    .return('N')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'lexpr'
    null $P2
    $P3 = $P1.'emit_get'(__ARG_1)
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
    $P2 = self.'tempreg'('N')
    __ARG_1.'emitset'($P2, $P3)
    set $P3, $P2
  __label_1: # endif
    getattribute $P4, self, 'rexpr'
    $P5 = $P4.'emit_get'(__ARG_1)
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
    $P2 = self.'tempreg'('N')
    __ARG_1.'emitset'($P2, $P5)
    set $P5, $P2
  __label_2: # endif
    self.'annotate'(__ARG_1)
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpModExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
    mod $I1, __ARG_1, __ARG_2
    .return($I1)

.end # do_op

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpCModExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'checkresult' :method
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpShiftleftExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitbinop'('shl', __ARG_2, $S1, $S2)

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
    shl $I1, __ARG_1, __ARG_2
    .return($I1)

.end # do_op

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpShiftrightExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitbinop'('shr', __ARG_2, $S1, $S2)

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
    shr $I1, __ARG_1, __ARG_2
    .return($I1)

.end # do_op

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]

.sub 'OpShiftlrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)

.end # OpShiftlrightExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
    .tailcall self.'clonebinary'($P1, __ARG_1)

.end # clone


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitbinop'('lsr', __ARG_2, $S1, $S2)

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
    lsr $I1, __ARG_1, __ARG_2
    .return($I1)

.end # do_op

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'ModifierList'(__ARG_1, __ARG_2)

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    null $I1
    null $I2
    set $S1, ''
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
    $P5 = $P1.'getname'()
    set $S2, $P5
    if $S2 == 'flat' goto __label_5
    if $S2 == 'named' goto __label_6
    goto __label_3
  __label_5: # case
    set $I1, 1
    goto __label_4 # break
  __label_6: # case
    set $I2, 1
    $P6 = $P1.'numargs'()
    set $I3, $P6
    if $I3 == 0 goto __label_9
    if $I3 == 1 goto __label_10
    goto __label_7
  __label_9: # case
    goto __label_8 # break
  __label_10: # case
    $P2 = $P1.'getarg'(0)
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
    WSubId_25('Invalid modifier', self)
  __label_11: # endif
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_8 # break
  __label_7: # default
    WSubId_25('Invalid modifier', self)
  __label_8: # switch end
  __label_3: # default
  __label_4: # switch end
    goto __label_1
  __label_2: # endfor
    and $I3, $I1, $I2
    if $I3 goto __label_14
    set $I3, $I1
    if $I3 goto __label_15
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
    __ARG_1.'print'(' :named')
    eq $S1, '', __label_17
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end

.end # emitmodifiers

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    setattribute self, 'arg', __ARG_1
    setattribute self, 'modifiers', __ARG_2

.end # Argument


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'Argument' ]
    getattribute $P4, self, 'arg'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'arg', $P3
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
    .return(self)

.end # optimize


.sub 'hascompilevalue' :method
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()

.end # hascompilevalue

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
    addattribute $P0, 'arg'
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
    null $P1
    $P2 = WSubId_68(__ARG_1, __ARG_2)
    $P3 = __ARG_1.'get'()
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
    $P3 = __ARG_1.'get'()
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
    goto __label_4
  __label_3: # else
    WSubId_70('modifier list', $P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
    __ARG_1.'unget'($P3)
  __label_2: # endif
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_96 = "WSubId_96"
    setattribute self, 'owner', __ARG_1
    setattribute self, 'start', __ARG_2
    $P1 = __ARG_3.'get'()
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
    __ARG_3.'unget'($P1)
    $P3 = WSubId_67(__ARG_3, __ARG_1, WSubId_96, __ARG_4)
    setattribute self, 'args', $P3
  __label_1: # endif

.end # ArgumentList


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    setattribute $P1, 'owner', __ARG_1
    getattribute $P10, self, 'start'
    setattribute $P1, 'start', $P10
    getattribute $P2, self, 'args'
    if_null $P2, __label_1
    set $P3, $P2
    set $P4, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P5, $P3
    root_new $P6, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P7 = WSubId_3($P10, $P4)
    if_null $P5, __label_5
    iter $P12, $P5
    set $P12, 0
  __label_4: # for iteration
    unless $P12 goto __label_5
    shift $P8, $P12
    $P13 = $P7($P8)
    push $P6, $P13
    goto __label_4
  __label_5: # endfor
    set $P11, $P6
    goto __label_3
  __label_3:
    goto __label_2
  __label_2:
    set $P9, $P11
    setattribute $P1, 'args', $P9
  __label_1: # endif
    .return($P1)

.end # clone


.sub 'numargs' :method
    getattribute $P1, self, 'args'
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
    .return($I1)

.end # numargs


.sub 'getrawargs' :method
    getattribute $P1, self, 'args'
    .return($P1)

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
    getattribute $P1, self, 'args'
    $P2 = $P1[__ARG_1]
    .return($P2)

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
    getattribute $P1, self, 'args'
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)

.end # getfreearg


.sub 'optimize' :method
    getattribute $P1, self, 'args'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
    .return(self)

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'argregs'
    unless_null $P1, __label_1
    new $P2, ['ResizableStringArray']
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P7, $P5
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P4, $P7
    getattribute $P8, $P4, 'arg'
    $P6 = $P3.'add'($P8)
    null $S1
    if_null $P6, __label_4
    set $S1, $P6
  __label_4:
    push $P2, $S1
    goto __label_2
  __label_3: # endfor
    setattribute self, 'argregs', $P2
  __label_1: # endif
    .return($P1)

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'args'
    $P2 = self.'getargvalues'(__ARG_1)
    set $S1, ''
    $P4 = self.'numargs'()
    set $I1, $P4
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
    if_null $P3, __label_4
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
    set $S1, ', '
  __label_1: # for iteration
    inc $I2
    goto __label_3
  __label_2: # for end

.end # emitargs

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    addattribute $P0, 'owner'
    addattribute $P0, 'start'
    addattribute $P0, 'args'
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_97')
        .param pmc __ARG_1
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    .return(1)

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'builtin', __ARG_3
    setattribute self, 'args', __ARG_4

.end # CallBuiltinExpr


.sub 'checkresult' :method
    getattribute $P2, self, 'builtin'
    $P1 = $P2.'result'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    ne $S1, ':', __label_2
    getattribute $P4, self, 'args'
    $P3 = $P4[0]
    getattribute $P2, $P3, 'arg'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
  __label_2: # endif
    .return($S1)

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'emit'(__ARG_1, "")

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    if_null $S1, __label_2
    length $I1, $S1
    ne $I1, 1, __label_2
    ord $I1, $S1
    if $I1 == 73 goto __label_4
    if $I1 == 78 goto __label_5
    if $I1 == 83 goto __label_6
    if $I1 == 80 goto __label_7
    if $I1 == 118 goto __label_8
    goto __label_2
  __label_4: # case
  __label_5: # case
  __label_6: # case
  __label_7: # case
    goto __label_3 # break
  __label_8: # case
    WSubId_25("Can't use result of a void builtin", self)
  __label_2: # default
    concat $S3, "Unexpected result type '", $S1
    concat $S3, $S3, "'"
    WSubId_30($S3, self)
  __label_3: # switch end
    $P1 = self.'tempreg'($S1)
    null $S2
    if_null $P1, __label_9
    set $S2, $P1
  __label_9:
    self.'emit'(__ARG_1, $S2)
    .return($S2)

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'builtin'
    getattribute $P2, self, 'args'
    new $P3, ['ResizableStringArray']
    null $P4
    $P8 = $P1.'params'()
    set $I3, $P8
    if $I3 == -1 goto __label_3
    if $I3 == -2 goto __label_4
    goto __label_1
  __label_3: # case
    new $P9, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P10, self, 'owner'
    $P9.'CollectValues'($P10, __ARG_1)
    set $P5, $P9
    if_null $P2, __label_6
    iter $P11, $P2
    set $P11, 0
  __label_5: # for iteration
    unless $P11 goto __label_6
    shift $P4, $P11
    getattribute $P13, $P4, 'arg'
    $P12 = $P5.'add'($P13)
    push $P3, $P12
    goto __label_5
  __label_6: # endfor
    goto __label_2 # break
  __label_4: # case
    root_new $P6, ['parrot';'ResizablePMCArray']
    if_null $P2, __label_8
    iter $P14, $P2
    set $P14, 0
  __label_7: # for iteration
    unless $P14 goto __label_8
    shift $P4, $P14
    getattribute $P15, $P4, 'arg'
    push $P6, $P15
    goto __label_7
  __label_8: # endfor
    getattribute $P16, self, 'builtin'
    getattribute $P17, self, 'start'
    $P16.'expand'(__ARG_1, self, $P17, __ARG_2, $P6)
    .return()
  __label_1: # default
    getattribute $P18, self, 'args'
    set $I1, $P18
    new $P19, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P20, self, 'owner'
    $P19.'CollectValues'($P20, __ARG_1)
    set $P7, $P19
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
    $P21 = $P2[$I2]
    getattribute $P4, $P21, 'arg'
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
    null $S3
    $P8 = $P4.'isnull'()
    if_null $P8, __label_14
    unless $P8 goto __label_14
    if_null $S2, __label_16
    length $I3, $S2
    ne $I3, 1, __label_16
    ord $I3, $S2
    if $I3 == 73 goto __label_18
    if $I3 == 78 goto __label_19
    if $I3 == 83 goto __label_20
    goto __label_16
  __label_18: # case
  __label_19: # case
  __label_20: # case
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
    __ARG_1.'emitnull'($S3)
    goto __label_17 # break
  __label_16: # default
    $P10 = $P7.'add'($P4)
    set $S3, $P10
  __label_17: # switch end
    goto __label_15
  __label_14: # else
    iseq $I3, $S1, $S2
    if $I3 goto __label_24
    iseq $I3, $S2, '?'
  __label_24:
    if $I3 goto __label_23
    iseq $I3, $S2, 'p'
    unless $I3 goto __label_25
    iseq $I3, $S1, 'S'
    if $I3 goto __label_26
    iseq $I3, $S1, 'P'
  __label_26:
  __label_25:
  __label_23:
    unless $I3 goto __label_21
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
    ne $S2, 'p', __label_27
    set $S2, 'P'
  __label_27: # endif
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P8, __label_28
    set $S4, $P8
  __label_28:
    if_null $S2, __label_29
    length $I3, $S2
    ne $I3, 1, __label_29
    ord $I3, $S2
    if $I3 == 80 goto __label_31
    if $I3 == 73 goto __label_32
    if $I3 == 78 goto __label_33
    if $I3 == 83 goto __label_34
    goto __label_29
  __label_31: # case
    if_null $S1, __label_35
    length $I4, $S1
    ne $I4, 1, __label_35
    ord $I4, $S1
    if $I4 == 73 goto __label_37
    if $I4 == 78 goto __label_38
    if $I4 == 83 goto __label_39
    goto __label_35
  __label_37: # case
  __label_38: # case
  __label_39: # case
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_36 # break
  __label_35: # default
    set $S3, $S4
  __label_36: # switch end
    goto __label_30 # break
  __label_32: # case
  __label_33: # case
  __label_34: # case
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
    __ARG_1.'emitset'($S3, $S4)
    goto __label_30 # break
  __label_29: # default
    set $S3, $S4
  __label_30: # switch end
  __label_22: # endif
  __label_15: # endif
    push $P3, $S3
  __label_9: # for iteration
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_2: # switch end
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'builtin'
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_97 = "WSubId_97"
    $P7 = __ARG_3.'getname'()
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
    __ARG_1.'use_builtin'($S1)
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P7 = __ARG_4.'numargs'()
    set $I1, $P7
  __label_2:
    if $I1 goto __label_5
    root_new $P7, ['parrot';'ResizablePMCArray']
    set $P1, $P7
    goto __label_4
  __label_5:
    $P8 = __ARG_4.'getrawargs'()
    set $P1, $P8
  __label_4:
    getattribute $P2, __ARG_3, 'variants'
    null $P3
    if_null $P2, __label_7
    iter $P9, $P2
    set $P9, 0
  __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P4, $P9
    getattribute $P7, $P4, 'nparams'
    set $I2, $P7
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
    set $P3, $P4
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    unless_null $P3, __label_12
    WSubId_25("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
    $P7 = $P3.'iscompileevaluable'()
    if_null $P7, __label_13
    unless $P7 goto __label_13
    $P8 = WSubId_97($P1)
    if_null $P8, __label_14
    unless $P8 goto __label_14
    getattribute $P5, $P3, 'evalfun'
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_15
    push_eh $P7
    getattribute $P10, __ARG_1, 'owner'
    getattribute $P11, __ARG_1, 'start'
    $P8 = $P5($P10, $P11, $P1)
    .return($P8)
    pop_eh
    goto __label_16
  __label_15:
    .get_results($P6)
    finalize $P6
    pop_eh
    $S2 = $P6["message"]
    concat $S3, "Compile time evaluation of builtin ", $S1
    concat $S3, $S3, " failed: '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
    WSubId_25($S3, __ARG_2)
  __label_16:
  __label_14: # endif
  __label_13: # endif
    new $P8, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P8.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P7, $P8
    .return($P7)

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'Expr'(__ARG_2, __ARG_3)
    setattribute self, 'funref', __ARG_4
    $P1 = __ARG_1.'get'()
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
    __ARG_1.'unget'($P1)
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
  __label_1: # endif

.end # CallExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    getattribute $P3, self, 'start'
    $P1.'Expr'(__ARG_1, $P3)
    getattribute $P5, self, 'funref'
    $P4 = $P5.'clone'(__ARG_1)
    setattribute $P1, 'funref', $P4
    getattribute $P2, self, 'args'
    if_null $P2, __label_1
    $P4 = $P2.'clone'(__ARG_1)
    setattribute $P1, 'args', $P4
  __label_1: # endif
    .return($P1)

.end # clone


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
    getattribute $P2, self, 'args'
    if_null $P2, __label_1
    $P2 = $P2.'optimize'()
  __label_1: # endif
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
    $P3 = $P1.'search_nonmember'()
    isnull $I1, $P3
    if $I1 goto __label_5
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_6
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_4
  __label_5: # case
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_6: # case
    $P8 = $P3.'ismulti'()
    isfalse $I2, $P8
    unless $I2 goto __label_9
    $P4 = $P3.'makesubid'()
    self.'usesubid'($P4)
    new $P7, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
    $P7.'CallSubid'(self, $P1, $P2, $P4)
    set $P6, $P7
    .return($P6)
    goto __label_10
  __label_9: # else
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
    .return(self)
  __label_10: # endif
    goto __label_3 # break
  __label_7: # case
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'start'
    $P8.'FunctionRef'($P9, $P10, $P3)
    set $P7, $P8
    setattribute self, 'funref', $P7
    .return(self)
  __label_8: # case
    getattribute $P11, self, 'owner'
    getattribute $P12, $P1, 'start'
    .tailcall WSubId_98($P11, $P12, $P3, $P2)
    goto __label_3 # break
  __label_4: # default
    getattribute $P13, self, 'start'
    WSubId_30("unexpected type found in scope", $P13)
  __label_3: # switch end
  __label_2: # endif
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_11
    new $P7, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_11: # endif
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
    unless $I1 goto __label_12
    new $P7, [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]
    $P7.'CallInlineExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_12: # endif
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_13
    unless $P6 goto __label_13
    $P7 = $P1.'checkIdentifier'()
    set $S1, $P7
    ne $S1, '', __label_14
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P9 = $P1.'getName'()
    $P8[0] = $P9
    $P5 = self.'scopesearch'($P8, 0)
    isnull $I1, $P5
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
    getattribute $P6, self, 'owner'
    getattribute $P7, $P1, 'start'
    .tailcall WSubId_98($P6, $P7, $P5, $P2)
  __label_15: # endif
  __label_14: # endif
  __label_13: # endif
    setattribute self, 'funref', $P1
    setattribute self, 'args', $P2
    .return(self)

.end # optimize


.sub 'cantailcall' :method
    .return(1)

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'funref'
    null $S1
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
    ne $S1, '', __label_3
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
    isnull $I1, $P2
    if $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_7
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_8
    goto __label_5
  __label_6: # case
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 3
    $P3[0] = "'"
    $P4 = $P1.'getName'()
    $P3[1] = $P4
    $P3[2] = "'"
    join $S1, "", $P3
    goto __label_4 # break
  __label_7: # case
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_4 # break
  __label_8: # case
    WSubId_30("Builtin unexpected here", self)
  __label_5: # default
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 3
    $P6[0] = "'"
    $P7 = $P1.'getName'()
    $P6[1] = $P7
    $P6[2] = "'"
    join $S1, "", $P6
  __label_4: # switch end
  __label_3: # endif
    goto __label_2
  __label_1: # else
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
    .return($S1)

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
    __ARG_1.'print'('(')
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
    __ARG_1.'say'(')')

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'prepareargs'(__ARG_1)
    self.'annotate'(__ARG_1)
    __ARG_1.'print'('    ')
    ne __ARG_2, '.tailcall', __label_2
    __ARG_1.'print'('.tailcall ')
    goto __label_3
  __label_2: # else
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_3: # endif
    __ARG_1.'print'($S1)
    self.'emitargs'(__ARG_1)

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'prepareargs'(__ARG_1)
    self.'annotate'(__ARG_1)
    __ARG_1.'print'('    ')
    __ARG_1.'print'($S1)
    self.'emitargs'(__ARG_1)

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'funref'
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallSubid' ]

.sub 'CallSubid' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
    setattribute self, 'funref', __ARG_2
    setattribute self, 'args', __ARG_3
    setattribute self, 'subid', __ARG_4

.end # CallSubid


.sub 'emitcall' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'subid'
    .return($P1)

.end # emitcall

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallSubid' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
    setattribute self, 'funref', __ARG_2
    setattribute self, 'args', __ARG_3

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'funref'
    getattribute $P2, $P1, 'left'
  __label_2: # while
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
    $P6 = $P2.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
    $P7 = $P2.'checkIdentifier'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
    isnull $I1, $S1
    if $I1 goto __label_6
    iseq $I1, $S1, ''
  __label_6:
    unless $I1 goto __label_5
    new $P3, ['ResizableStringArray']
    $P1.'buildkey'($P3)
    $P6 = $P3.'pop'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
    $P4 = self.'tempreg'('P')
    self.'annotate'(__ARG_1)
    set $P5, $P3
    null $S3
    elements $I1, $P5
    unless $I1 goto __label_9
    join $S5, "'; '", $P5
    concat $S6, "[ '", $S5
    concat $S6, $S6, "' ]"
    set $S3, $S6
  __label_9: # endif
    set $S4, $S3
    goto __label_8
  __label_8:
    __ARG_1.'emitget_hll_global'($P4, $S2, $S4)
    .return($P4)
  __label_5: # endif
  __label_3: # endif
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P1.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
    $P8 = $P1.'get_member'()
    $P6[2] = $P8
    $P6[3] = "'"
    join $S5, "", $P6
    .return($S5)

.end # emitcall

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
    setattribute self, 'funref', __ARG_2
    setattribute self, 'args', __ARG_3

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'funref'
    getattribute $P2, $P1, 'right'
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
    WSubId_25("Invalid expression type in '.*'", $P1)
  __label_1: # endif
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)

.end # emitcall

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'left', __ARG_3

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'left'
    .tailcall $P1.'emit_getvar'(__ARG_1)

.end # emit_left_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'left'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
    setattribute self, 'right', __ARG_4

.end # MemberExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    getattribute $P2, self, 'start'
    getattribute $P4, self, 'left'
    $P3 = $P4.'clone'(__ARG_1)
    $P1.'MemberExprBase'(__ARG_1, $P2, $P3)
    getattribute $P3, self, 'right'
    setattribute $P1, 'right', $P3
    .return($P1)

.end # clone


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'search_nonmember' :method
    null $P1
    getattribute $P2, self, 'left'
  __label_2: # while
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
    $P3 = $P2.'checkIdentifier'()
    isnull $I1, $P3
    if $I1 goto __label_5
    set $S1, $P3
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
    root_new $P4, ['parrot';'ResizablePMCArray']
    self.'buildkey'($P4)
    .tailcall self.'scopesearch'($P4, 0)
  __label_4: # endif
  __label_3: # endif
    null $P5
    .return($P5)

.end # search_nonmember


.sub 'optimize' :method
    getattribute $P4, self, 'left'
    $P3 = $P4.'optimize'()
    setattribute self, 'left', $P3
    $P1 = self.'search_nonmember'()
    isnull $I1, $P1
    if $I1 goto __label_3
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_5
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    box $P2, $I2
    unless $P2 goto __label_7
    $P2 = $P1.'isconst'()
  __label_7:
    set $I1, $P2
    if $I1 goto __label_6
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
    $P3 = $P1.'ismulti'()
    if_null $P3, __label_8
    unless $P3 goto __label_8
    new $P5, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'FunctionRef'($P6, $P7, $P1)
    set $P4, $P5
    .return($P4)
  __label_8: # endif
    goto __label_1 # break
  __label_5: # case
    new $P9, [ 'Winxed'; 'Compiler'; 'FunctionRef' ]
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    $P9.'FunctionRef'($P10, $P11, $P1)
    set $P8, $P9
    .return($P8)
  __label_6: # case
    .tailcall $P1.'getvalue'()
  __label_2: # default
  __label_1: # switch end
    .return(self)

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'left'
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
    $P2 = $P1.'getName'()
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
    push __ARG_1, $P2

.end # buildkey


.sub 'get_member' :method
    getattribute $P1, self, 'right'
    .return($P1)

.end # get_member


.sub '__emit_get_left' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'left'
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    eq $S1, 'P', __label_1
    WSubId_25("non-var at left of '.'", self)
  __label_1: # endif
    .tailcall $P1.'emit_get_nonull'(__ARG_1)

.end # __emit_get_left


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'emit'(__ARG_1, $S1)
    .return($S1)

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    null $S2
    ne __ARG_2, 'P', __label_2
    ne __ARG_3, 'null', __label_4
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
    __ARG_1.'emitnull'(__ARG_3)
  __label_4: # endif
    set $S2, __ARG_3
    goto __label_3
  __label_2: # else
    $P1 = self.'tempreg'('P')
    set $S2, $P1
    __ARG_1.'emitbox'($S2, __ARG_3)
  __label_3: # endif
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    $P1 = self.'__emit_get_left'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
    set $S2, $S3
  __label_7: # endif
  __label_4: # endif
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
    .return($S2)

.end # emit_assign_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
    setattribute self, 'right', __ARG_4

.end # MemberRefExpr


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'optimize' :method
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_70 = "WSubId_70"
    getattribute $P1, self, 'left'
    getattribute $P2, self, 'right'
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
    WSubId_70("string expression", $P2)
  __label_1: # endif
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
    self.'annotate'(__ARG_1)
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_70 = "WSubId_70"
    getattribute $P1, self, 'left'
    getattribute $P2, self, 'right'
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
    WSubId_70("string expression", $P2)
  __label_1: # endif
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
    null $S3
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    if_null $S5, __label_4
    length $I1, $S5
    ne $I1, 1, __label_4
    ord $I1, $S5
    if $I1 == 80 goto __label_6
    goto __label_4
  __label_6: # case
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
    ne $S3, 'null', __label_7
    $P5 = self.'tempreg'('P')
    set $S3, $P5
    __ARG_1.'emitnull'($S3)
  __label_7: # endif
    goto __label_5 # break
  __label_4: # default
    $P3 = self.'tempreg'('P')
    set $S3, $P3
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
    __ARG_1.'emitbox'($S3, $S4)
  __label_5: # switch end
    self.'annotate'(__ARG_1)
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
    .return($S3)

.end # emit_assign_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
    addattribute $P0, 'right'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]

.sub 'StringIndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'left', __ARG_3
    setattribute self, 'arg', __ARG_4

.end # StringIndexExpr


.sub 'checkresult' :method
    .return('S')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    $P1 = WSubId_45("    substr %0, %1, %2, 1", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P1)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'left'
    addattribute $P0, 'arg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'Expr'(__ARG_2, __ARG_3)
    setattribute self, 'left', __ARG_4
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2

.end # IndexExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
    getattribute $P4, self, 'left'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'left', $P3
    getattribute $P4, self, 'args'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'args', $P3
    .return($P1)

.end # clone


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_46 = "WSubId_46"
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
    setattribute self, 'left', $P1
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
    $P4 = $P1.'checkresult'()
    set $S2, $P4
    if_null $S2, __label_1
    length $I2, $S2
    ne $I2, 1, __label_1
    ord $I2, $S2
    if $I2 == 83 goto __label_3
    if $I2 == 80 goto __label_4
    goto __label_1
  __label_3: # case
    $P5 = $P2.'numargs'()
    set $I3, $P5
    eq $I3, 1, __label_5
    WSubId_25('Bad string index', self)
  __label_5: # endif
    $P3 = $P2.'getarg'(0)
    $P6 = $P1.'isstringliteral'()
    unless $P6 goto __label_7
    $P6 = $P3.'isintegerliteral'()
  __label_7:
    if_null $P6, __label_6
    unless $P6 goto __label_6
    $P7 = $P3.'getIntegerValue'()
    set $I1, $P7
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_8
    set $S1, $P4
  __label_8:
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    substr $S2, $S1, $I1, 1
    .tailcall WSubId_46($P4, $P5, $S2)
  __label_6: # endif
    new $P5, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    $P5.'StringIndexExpr'($P6, $P7, $P1, $P3)
    set $P4, $P5
    .return($P4)
  __label_4: # case
    goto __label_2 # break
  __label_1: # default
    WSubId_25("Type not valid for indexing", $P1)
  __label_2: # switch end
    .return(self)

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
    getattribute $P4, self, 'start'
    WSubId_30('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
    getattribute $P1, self, 'left'
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
    setattribute self, 'regleft', $P3
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'regleft'
    getattribute $P2, self, 'argregs'
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
    getattribute $P3, self, 'start'
    WSubId_30('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
    __ARG_1.'print'(']')

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'emit_prep'(__ARG_1)
    self.'annotate'(__ARG_1)
    __ARG_1.'print'('    ', __ARG_2, ' = ')
    self.'emit_aux'(__ARG_1)
    __ARG_1.'say'('')

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'emit'(__ARG_1, $S1)
    .return($S1)

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    self.'emit_prep'(__ARG_1)
    self.'annotate'(__ARG_1)
    __ARG_1.'print'('    ')
    self.'emit_aux'(__ARG_1)
    __ARG_1.'say'(' = ', __ARG_3)

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'emit_prep'(__ARG_1)
    null $S1
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
    $P2 = self.'tempreg'('P')
    set $S1, $P2
    __ARG_1.'emitnull'($S1)
    goto __label_2
  __label_1: # else
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
    self.'annotate'(__ARG_1)
    __ARG_1.'print'('    ')
    self.'emit_aux'(__ARG_1)
    __ARG_1.'say'(' = ', $S1)
    .return($S1)

.end # emit_assign_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'left'
    addattribute $P0, 'regleft'
    addattribute $P0, 'args'
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_68 = "WSubId_68"
    self.'Expr'(__ARG_2, __ARG_3)
    $P1 = __ARG_1.'get'()
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
    __ARG_1.'unget'($P1)
    $P3 = WSubId_67(__ARG_1, __ARG_2, WSubId_68, ']')
    setattribute self, 'values', $P3
  __label_1: # endif

.end # ArrayExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    getattribute $P8, self, 'start'
    $P1.'Expr'(__ARG_1, $P8)
    getattribute $P8, self, 'values'
    if_null $P8, __label_1
    getattribute $P2, self, 'values'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P11 = WSubId_5("clone")
    $P6 = WSubId_3($P11, $P3)
    if_null $P4, __label_5
    iter $P12, $P4
    set $P12, 0
  __label_4: # for iteration
    unless $P12 goto __label_5
    shift $P7, $P12
    $P13 = $P6($P7)
    push $P5, $P13
    goto __label_4
  __label_5: # endfor
    set $P10, $P5
    goto __label_3
  __label_3:
    goto __label_2
  __label_2:
    set $P8, $P10
    setattribute $P1, 'values', $P8
  __label_1: # endif
    .return($P1)

.end # clone


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'optimize' :method
    getattribute $P1, self, 'values'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'emitset'(__ARG_2, $S1)

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'emit_init'(__ARG_1, '')

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'emit_init'(__ARG_1, $S1)
    .return($S1)

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'values'
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
    eq __ARG_2, '', __label_3
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
    le $I1, 0, __label_4
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
  __label_3: # endif
    new $P4, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P4.'CollectValues'($P5, __ARG_1)
    set $P2, $P4
    null $I2
    if_null $P1, __label_6
    iter $P6, $P1
    set $P6, 0
  __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P3, $P6
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
    eq __ARG_2, '', __label_8
    self.'annotate'(__ARG_1)
    $P4 = WSubId_45("    %0[%1] = %2", __ARG_2, $I2, $S1)
    __ARG_1.'say'($P4)
    inc $I2
  __label_8: # endif
    goto __label_5
  __label_6: # endfor

.end # emit_init

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_70 = "WSubId_70"
    self.'Expr'(__ARG_2, __ARG_3)
    $P1 = __ARG_1.'get'()
    root_new $P2, ['parrot';'ResizablePMCArray']
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
    __ARG_1.'unget'($P1)
  __label_2: # do
    $P4 = WSubId_68(__ARG_1, __ARG_2)
    WSubId_84(':', __ARG_1)
    $P5 = WSubId_68(__ARG_1, __ARG_2)
    push $P2, $P4
    push $P3, $P5
  __label_4: # continue
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
    WSubId_70("',' or '}'", $P1)
  __label_5: # endif
  __label_1: # endif
    setattribute self, 'keys', $P2
    setattribute self, 'values', $P3

.end # HashExpr


.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'optimize' :method
    getattribute $P1, self, 'keys'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P4 = $P1[$I2]
    $P3 = $P4.'optimize'()
    $P1[$I2] = $P3
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
    getattribute $P2, self, 'values'
    if_null $P2, __label_9
    elements $I3, $P2
    goto __label_8
  __label_9:
    null $I3
  __label_8:
    null $I4
  __label_12: # for condition
    ge $I4, $I3, __label_11
    $P4 = $P2[$I4]
    $P3 = $P4.'optimize'()
    $P2[$I4] = $P3
  __label_10: # for iteration
    inc $I4
    goto __label_12
  __label_11: # for end
  __label_7:
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'annotate'(__ARG_1)
    eq __ARG_2, '', __label_1
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
    getattribute $P1, self, 'keys'
    getattribute $P2, self, 'values'
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P6, self, 'owner'
    $P5.'CollectValues'($P6, __ARG_1)
    set $P3, $P5
    set $I1, $P1
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
    $P4 = $P1[$I2]
    null $S1
    $P5 = $P4.'isidentifier'()
    unless $P5 goto __label_7
    $P6 = $P4.'checkIdentifier'()
    set $S4, $P6
    iseq $I3, $S4, ''
    box $P5, $I3
  __label_7:
    if_null $P5, __label_5
    unless $P5 goto __label_5
    $P7 = $P4.'getName'()
    null $S2
    if_null $P7, __label_8
    set $S2, $P7
  __label_8:
    $P5 = self.'tempreg'('P')
    set $S1, $P5
    __ARG_1.'emitget_hll_global'($S1, $S2)
    goto __label_6
  __label_5: # else
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
    eq __ARG_2, '', __label_10
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_10: # endif
  __label_2: # for iteration
    inc $I2
    goto __label_4
  __label_3: # for end

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'emit'(__ARG_1, '')

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'emit'(__ARG_1, $S1)
    .return($S1)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'keys'
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
    .return('P')

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2

.end # parseinitializer


.sub 'numargs' :method
    getattribute $P1, self, 'initializer'
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
    .return($I1)

.end # numargs


.sub 'optimize_initializer' :method
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif

.end # optimize_initializer


.sub 'optimize' :method
    self.'optimize_initializer'()
    .return(self)

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
    if_null $P1, __label_2
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
    __ARG_1.'say'(")")

.end # emit_constructor

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'warn_class_unknown' :subid('WSubId_99')
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
    concat $S1, "class ", __ARG_2
    concat $S1, $S1, " not found at compile time"
    __ARG_1.'warn'($S1, __ARG_3)

.end # warn_class_unknown

.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_25 = "WSubId_25"
    self.'Expr'(__ARG_2, __ARG_3)
    $P2 = __ARG_4.'isstring'()
    if $P2 goto __label_2
    $P2 = __ARG_4.'isidentifier'()
  __label_2:
    isfalse $I1, $P2
    unless $I1 goto __label_1
    WSubId_25("Unimplemented", __ARG_4)
  __label_1: # endif
    setattribute self, 'value', __ARG_4
    $P1 = __ARG_1.'get'()
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
    __ARG_1.'unget'($P1)
  __label_4: # endif

.end # NewExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
    getattribute $P3, self, 'value'
    setattribute $P1, 'value', $P3
    getattribute $P2, self, 'initializer'
    if_null $P2, __label_1
    getattribute $P5, self, 'initializer'
    $P4 = $P5.'clone'(__ARG_1)
    setattribute $P1, 'initializer', $P4
  __label_1: # endif
    .return($P1)

.end # clone


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'value'
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
    isnull $I1, $P2
    not $I1
    box $P3, $I1
    unless $P3 goto __label_3
    $P3 = $P2.'isconst'()
  __label_3:
    if_null $P3, __label_2
    unless $P3 goto __label_2
    $P1 = $P2.'getvalue'()
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
    WSubId_25('Constant value must evaluate to a string', $P1)
  __label_4: # endif
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
  __label_2: # endif
  __label_1: # endif
    self.'optimize_initializer'()
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_30 = "WSubId_30"
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'initializer'
    getattribute $P2, self, 'value'
    $P8 = self.'numargs'()
    set $I1, $P8
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
    set $S1, ''
    set $S2, __ARG_2
    null $S3
    if $I1 == -1 goto __label_7
    if $I1 == 0 goto __label_8
    if $I1 == 1 goto __label_9
    goto __label_5
  __label_7: # case
  __label_8: # case
    goto __label_6 # break
  __label_9: # case
    ne $I2, 1, __label_10
    not $I4, __ARG_3
    unless $I4 goto __label_12
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_12: # endif
    goto __label_11
  __label_10: # else
    $P3 = $P1.'getfreearg'(0)
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
    concat $S5, ', ', $S1
    set $S1, $S5
  __label_11: # endif
    goto __label_6 # break
  __label_5: # default
    eq $I2, 1, __label_13
    WSubId_25('Multiple init arguments not allowed here', self)
  __label_13: # endif
    not $I3, __ARG_3
    unless $I3 goto __label_14
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_14: # endif
  __label_6: # switch end
    ne $S2, '', __label_15
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
    if $I2 == 0 goto __label_18
    if $I2 == 1 goto __label_19
    goto __label_16
  __label_18: # case
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
  __label_20:
    get_class $P4, $S4
    unless_null $P4, __label_21
    WSubId_99(__ARG_1, $S4, $P2)
  __label_21: # endif
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
    le $I1, 1, __label_22
    __ARG_1.'say'($S2, ".'", $P2, "'()")
  __label_22: # endif
    goto __label_17 # break
  __label_19: # case
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
    unless_null $P5, __label_23
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
    if_null $P6, __label_25
    $P7 = $P6.'getpath'()
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
    goto __label_26
  __label_25: # else
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
    if_null $P5, __label_27
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_28
  __label_27: # else
    $P9 = $P2.'getidentifier'()
    WSubId_99(__ARG_1, $P9, $P2)
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
  __label_28: # endif
  __label_26: # endif
    set $S3, $P2
    goto __label_24
  __label_23: # else
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
  __label_24: # endif
    goto __label_17 # break
  __label_16: # default
    WSubId_30('Unexpected type in new')
  __label_17: # switch end
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isge $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
  __label_31:
  __label_30:
    unless $I3 goto __label_29
    self.'emit_constructor'(__ARG_1, $S2, $S3)
    not $I3, __ARG_3
    unless $I3 goto __label_32
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_32: # endif
  __label_29: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'Expr'(__ARG_2, __ARG_3)
    setattribute self, 'owner', __ARG_2
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P3.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
    setattribute self, 'nskey', $P1
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
    __ARG_1.'unget'($P2)
  __label_2: # endif

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    null $S1
    $P3 = self.'numargs'()
    set $I1, $P3
    if $I1 == -1 goto __label_3
    if $I1 == 0 goto __label_4
    if $I1 == 1 goto __label_5
    goto __label_1
  __label_3: # case
  __label_4: # case
    goto __label_2 # break
  __label_5: # case
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_2 # break
  __label_1: # default
    WSubId_25('Multiple init arguments not allowed here', self)
  __label_2: # switch end
    getattribute $P2, self, 'nskey'
    __ARG_1.'print'('    ')
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
    __ARG_1.'print'("root_")
  __label_6: # endif
    __ARG_1.'print'("new ", __ARG_2, ", ")
    null $P3
    $P2.'emit'(__ARG_1, $P3)
    if_null $S1, __label_7
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
    __ARG_1.'say'()

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'Expr'(__ARG_2, __ARG_3)
    setattribute self, 'owner', __ARG_2
    new $P3, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P3.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P3
    setattribute self, 'nskey', $P1
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
    __ARG_1.'unget'($P2)
  __label_2: # endif

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P2 = self.'numargs'()
    set $I1, $P2
    set $S1, __ARG_2
    le $I1, 0, __label_1
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_1: # endif
    getattribute $P1, self, 'nskey'
    ne $S1, '', __label_2
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
    $P1.'emit_new'(__ARG_1, self, $S1)
    lt $I1, 0, __label_3
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
    self.'emit_constructor'(__ARG_1, $S1, $S2)
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_3: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'('(')
    set $I1, $P3
    if $I1 goto __label_3
    $P4 = $P1.'isop'('[')
    set $I1, $P4
    if $I1 goto __label_4
    $P5 = $P1.'isidentifier'()
    set $I1, $P5
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
    new $P7, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    new $P9, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P9.'StringLiteral'(__ARG_2, __ARG_3)
    set $P8, $P9
    $P7.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P8)
    set $P6, $P7
    .return($P6)
  __label_4: # case
    new $P11, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P11.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P10, $P11
    .return($P10)
  __label_5: # case
    $P2 = __ARG_1.'get'()
    __ARG_1.'unget'($P2)
    $P12 = $P2.'isop'('.')
    if_null $P12, __label_6
    unless $P12 goto __label_6
    new $P14, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P14.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P13, $P14
    .return($P13)
  __label_6: # endif
  __label_2: # default
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_92 = "WSubId_92"
    self.'Expr'(__ARG_1, __ARG_2)
    setattribute self, 'lexpr', __ARG_3
    $P2 = WSubId_92(__ARG_4, self)
    setattribute self, 'checked', $P2

.end # OpInstanceOfExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'lexpr', $P3
    getattribute $P4, self, 'checked'
    $P3 = $P4.'clone'(self)
    setattribute $P1, 'checked', $P3
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
    .return(self)

.end # optimize


.sub 'checkresult' :method
    .return('I')

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'lexpr'
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    eq $S1, 'P', __label_2
    WSubId_25('Invalid instanceof left operand', $P1)
  __label_2: # endif
    getattribute $P2, self, 'checked'
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
    self.'annotate'(__ARG_1)
    __ARG_1.'print'('    isa ', __ARG_2, ', ', $S2, ', ')
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
    __ARG_1.'say'()

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'lexpr'
    addattribute $P0, 'checked'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
    self.'Expr'(__ARG_1, __ARG_2)
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
    setattribute self, 'etrue', __ARG_4
    setattribute self, 'efalse', __ARG_5
    .return(self)

.end # OpConditionalExpr


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    getattribute $P2, self, 'start'
    $P1.'Expr'(__ARG_1, $P2)
    new $P4, [ 'Winxed'; 'Compiler'; 'Condition' ]
    getattribute $P7, self, 'condition'
    getattribute $P6, $P7, 'condexpr'
    $P5 = $P6.'clone'(__ARG_1)
    $P3 = $P4.'set'($P5)
    setattribute $P1, 'condition', $P3
    getattribute $P4, self, 'etrue'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'etrue', $P3
    getattribute $P4, self, 'efalse'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'efalse', $P3
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_1: # default
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
    .return(self)
  __label_2: # switch end

.end # optimize


.sub 'checkresult' :method
    getattribute $P1, self, 'etrue'
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
    .tailcall $P1.'checkresult'()
  __label_2: # endif

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'owner'
    $P5 = $P1.'genlabel'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
    $P5 = $P1.'genlabel'()
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
  __label_2:
    getattribute $P5, self, 'condition'
    $P5.'emit_else'(__ARG_1, $S2)
    getattribute $P2, self, 'etrue'
    $P5 = self.'checkresult'()
    null $S3
    if_null $P5, __label_3
    set $S3, $P5
  __label_3:
    $P5 = $P2.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
    __ARG_1.'emitgoto'($S1)
    __ARG_1.'emitlabel'($S2)
    getattribute $P3, self, 'efalse'
    $P5 = $P3.'isnull'()
    if_null $P5, __label_6
    unless $P5 goto __label_6
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
    $P6 = $P3.'checkresult'()
    null $S4
    if_null $P6, __label_8
    set $S4, $P6
  __label_8:
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
    $P5 = $P3.'emit_get'(__ARG_1)
    null $S5
    if_null $P5, __label_12
    set $S5, $P5
  __label_12:
    __ARG_1.'emitbox'(__ARG_2, $S5)
    goto __label_10
  __label_9: # else
    ne $S4, 'P', __label_13
    $P4 = $P3.'emit_get'(__ARG_1)
    __ARG_1.'emitset'(__ARG_2, $P4)
    goto __label_14
  __label_13: # else
    $P3.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
  __label_10: # endif
  __label_7: # endif
    __ARG_1.'emitlabel'($S1)

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'owner'
    $P2 = $P1.'genlabel'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    $P2 = $P1.'genlabel'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
    getattribute $P2, self, 'condition'
    $P2.'emit_else'(__ARG_1, $S2)
    getattribute $P2, self, 'etrue'
    $P2.'emit_void'(__ARG_1)
    __ARG_1.'emitgoto'($S1)
    __ARG_1.'emitlabel'($S2)
    getattribute $P2, self, 'efalse'
    $P2.'emit_void'(__ARG_1)
    __ARG_1.'emitlabel'($S1)

.end # emit_void

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    addattribute $P0, 'condition'
    addattribute $P0, 'etrue'
    addattribute $P0, 'efalse'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getOpCode_2' :subid('WSubId_102')
        .param pmc __ARG_1
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if_null $S1, __label_1
    length $I1, $S1
    ne $I1, 1, __label_1
    ord $I1, $S1
    if $I1 == 40 goto __label_3
    if $I1 == 91 goto __label_4
    if $I1 == 46 goto __label_5
    goto __label_1
  __label_3: # case
    .return(1)
  __label_4: # case
    .return(2)
  __label_5: # case
    .return(3)
  __label_1: # default
    .return(0)
  __label_2: # switch end

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_104')
        .param pmc __ARG_1
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '-' goto __label_3
    if $S1 == '!' goto __label_4
    if $S1 == '~' goto __label_5
    if $S1 == '++' goto __label_6
    if $S1 == '--' goto __label_7
    goto __label_1
  __label_3: # case
    .return(8)
  __label_4: # case
    .return(11)
  __label_5: # case
    .return(34)
  __label_6: # case
    .return(9)
  __label_7: # case
    .return(10)
  __label_1: # default
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(32)
    goto __label_9
  __label_8: # else
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(33)
    goto __label_11
  __label_10: # else
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_2: # switch end

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_107')
        .param pmc __ARG_1
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '*' goto __label_3
    if $S1 == '/' goto __label_4
    if $S1 == '%' goto __label_5
    if $S1 == '%%' goto __label_6
    goto __label_1
  __label_3: # case
    .return(19)
  __label_4: # case
    .return(20)
  __label_5: # case
    .return(21)
  __label_6: # case
    .return(22)
  __label_1: # default
    .return(0)
  __label_2: # switch end

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_110')
        .param pmc __ARG_1
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<<' goto __label_3
    if $S1 == '>>' goto __label_4
    if $S1 == '>>>' goto __label_5
    goto __label_1
  __label_3: # case
    .return(28)
  __label_4: # case
    .return(29)
  __label_5: # case
    .return(30)
  __label_1: # default
    .return(0)
  __label_2: # switch end

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_112')
        .param pmc __ARG_1
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '<' goto __label_3
    if $S1 == '>' goto __label_4
    if $S1 == '<=' goto __label_5
    if $S1 == '>=' goto __label_6
    goto __label_1
  __label_3: # case
    .return(14)
  __label_4: # case
    .return(16)
  __label_5: # case
    .return(15)
  __label_6: # case
    .return(17)
  __label_1: # default
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
    .return(0)
  __label_8: # endif
  __label_2: # switch end

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_114')
        .param pmc __ARG_1
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '==' goto __label_3
    if $S1 == '!=' goto __label_4
    if $S1 == '===' goto __label_5
    if $S1 == '!==' goto __label_6
    goto __label_1
  __label_3: # case
    .return(12)
  __label_4: # case
    .return(13)
  __label_5: # case
    .return(25)
  __label_6: # case
    .return(26)
  __label_1: # default
    .return(0)
  __label_2: # switch end

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_123')
        .param pmc __ARG_1
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    if $S1 == '=' goto __label_3
    if $S1 == '=:' goto __label_4
    if $S1 == '+=' goto __label_5
    if $S1 == '-=' goto __label_6
    if $S1 == '*=' goto __label_7
    if $S1 == '/=' goto __label_8
    if $S1 == '%=' goto __label_9
    goto __label_1
  __label_3: # case
    .return(4)
  __label_4: # case
    .return(5)
  __label_5: # case
    .return(6)
  __label_6: # case
    .return(18)
  __label_7: # case
    .return(23)
  __label_8: # case
    .return(24)
  __label_9: # case
    .return(31)
  __label_1: # default
    .return(0)
  __label_2: # switch end

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_70 = "WSubId_70"
    $P1 = __ARG_1.'get'()
    null $P2
    $P3 = $P1.'isop'('(')
    set $I1, $P3
    if $I1 goto __label_3
    $P4 = $P1.'isop'('[')
    set $I1, $P4
    if $I1 goto __label_4
    $P5 = $P1.'isop'('{')
    set $I1, $P5
    if $I1 goto __label_5
    $P6 = $P1.'isstring'()
    set $I1, $P6
    if $I1 goto __label_6
    $P7 = $P1.'isint'()
    set $I1, $P7
    if $I1 goto __label_7
    $P8 = $P1.'isfloat'()
    set $I1, $P8
    if $I1 goto __label_8
    $P9 = $P1.'iskeyword'('new')
    set $I1, $P9
    if $I1 goto __label_9
    $P10 = $P1.'iskeyword'('function')
    set $I1, $P10
    if $I1 goto __label_10
    $P11 = $P1.'iskeyword'('class')
    set $I1, $P11
    if $I1 goto __label_11
    $P12 = $P1.'iskeyword'('namespace')
    set $I1, $P12
    if $I1 goto __label_12
    $P13 = $P1.'isidentifier'()
    set $I1, $P13
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
    $P2 = WSubId_68(__ARG_1, __ARG_2)
    WSubId_84(')', __ARG_1)
    .return($P2)
  __label_4: # case
    new $P15, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P15.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_5: # case
    new $P17, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P17.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_6: # case
    new $P19, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P19.'StringLiteral'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_7: # case
    $P20 = $P1.'getintvalue'()
    .tailcall WSubId_44(__ARG_2, $P1, $P20)
  __label_8: # case
    new $P22, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P22.'FloatLiteral'(__ARG_2, $P1)
    set $P21, $P22
    .return($P21)
  __label_9: # case
    .tailcall WSubId_100(__ARG_1, __ARG_2, $P1)
  __label_10: # case
    new $P24, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P24.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P23, $P24
    .return($P23)
  __label_11: # case
    new $P26, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P26.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P25, $P26
    .return($P25)
  __label_12: # case
    new $P28, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P28.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P27, $P28
    .return($P27)
  __label_13: # case
    new $P30, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P30.'IdentifierExpr'(__ARG_2, $P1)
    set $P29, $P30
    .return($P29)
  __label_2: # default
    WSubId_70('expression', $P1)
  __label_1: # switch end

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = WSubId_101(__ARG_1, __ARG_2)
    null $P2
    null $P3
    null $I1
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_102($P2)
    set $I1, $P5
    unless $I1 goto __label_1
    if $I1 == 1 goto __label_5
    if $I1 == 2 goto __label_6
    if $I1 == 3 goto __label_7
    goto __label_3
  __label_5: # case
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_4 # break
  __label_6: # case
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_4 # break
  __label_7: # case
    set $P3, $P2
    $P2 = __ARG_1.'get'()
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
    $P4 = WSubId_101(__ARG_1, __ARG_2)
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
    goto __label_9
  __label_8: # else
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_4 # break
  __label_3: # default
    WSubId_30('Unexpected code in parseExpr_2')
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_103 = "WSubId_103"
    $P1 = WSubId_103(__ARG_1, __ARG_2)
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('++')
    set $I1, $P3
    if $I1 goto __label_3
    $P4 = $P2.'isop'('--')
    set $I1, $P4
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P6.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_4: # case
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P8.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
    __ARG_1.'unget'($P2)
    .return($P1)
  __label_1: # switch end

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_104 = "WSubId_104"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_106 = "WSubId_106"
    $P1 = __ARG_1.'get'()
    $P3 = WSubId_104($P1)
    set $I1, $P3
    unless $I1 goto __label_1
    $P2 = WSubId_105(__ARG_1, __ARG_2)
    if $I1 == 8 goto __label_5
    if $I1 == 11 goto __label_6
    if $I1 == 34 goto __label_7
    if $I1 == 9 goto __label_8
    if $I1 == 10 goto __label_9
    if $I1 == 32 goto __label_10
    if $I1 == 33 goto __label_11
    goto __label_3
  __label_5: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_3: # default
    WSubId_30('Invalid code in parseExpr_4', $P1)
  __label_4: # switch end
    goto __label_2
  __label_1: # else
    __ARG_1.'unget'($P1)
    .tailcall WSubId_106(__ARG_1, __ARG_2)
  __label_2: # endif

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = WSubId_105(__ARG_1, __ARG_2)
    null $P2
    null $I1
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_107($P2)
    set $I1, $P4
    unless $I1 goto __label_1
    $P3 = WSubId_105(__ARG_1, __ARG_2)
    if $I1 == 19 goto __label_5
    if $I1 == 20 goto __label_6
    if $I1 == 21 goto __label_7
    if $I1 == 22 goto __label_8
    goto __label_3
  __label_5: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_4 # break
  __label_6: # case
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_4 # break
  __label_7: # case
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_4 # break
  __label_8: # case
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
    WSubId_30('Invalid code in parseExpr_5', $P2)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_108 = "WSubId_108"
    $P1 = WSubId_108(__ARG_1, __ARG_2)
    null $P2
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('+')
    if $P5 goto __label_3
    $P5 = $P2.'isop'('-')
  __label_3:
    if_null $P5, __label_1
    unless $P5 goto __label_1
    $P3 = WSubId_108(__ARG_1, __ARG_2)
    null $P4
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = WSubId_109(__ARG_1, __ARG_2)
    null $P2
    null $P3
    null $I1
  __label_2: # while
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_110($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 28 goto __label_5
    if $I1 == 29 goto __label_6
    if $I1 == 30 goto __label_7
    goto __label_3
  __label_5: # case
    $P2 = WSubId_109(__ARG_1, __ARG_2)
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
    $P2 = WSubId_109(__ARG_1, __ARG_2)
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
    $P2 = WSubId_109(__ARG_1, __ARG_2)
    new $P7, [ 'Winxed'; 'Compiler'; 'OpShiftlrightExpr' ]
    $P7.'OpShiftlrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_4 # break
  __label_3: # default
    WSubId_30('Invalid code in parseExpr_7', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P3)
    .return($P1)

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = WSubId_111(__ARG_1, __ARG_2)
    null $P2
    null $P3
    null $I1
  __label_2: # while
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_112($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 14 goto __label_5
    if $I1 == 16 goto __label_6
    if $I1 == 15 goto __label_7
    if $I1 == 17 goto __label_8
    if $I1 == 27 goto __label_9
    goto __label_3
  __label_5: # case
    $P2 = WSubId_111(__ARG_1, __ARG_2)
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_6: # case
    $P2 = WSubId_111(__ARG_1, __ARG_2)
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_7: # case
    $P2 = WSubId_111(__ARG_1, __ARG_2)
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_8: # case
    $P2 = WSubId_111(__ARG_1, __ARG_2)
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_4 # break
  __label_9: # case
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_4 # break
  __label_3: # default
    WSubId_30('Invalid code in parseExpr_9', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P3)
    .return($P1)

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_115')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = WSubId_113(__ARG_1, __ARG_2)
    null $P2
    null $P3
    null $I1
  __label_2: # while
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_114($P3)
    set $I1, $P4
    unless $I1 goto __label_1
    if $I1 == 12 goto __label_5
    if $I1 == 13 goto __label_6
    if $I1 == 25 goto __label_7
    if $I1 == 26 goto __label_8
    goto __label_3
  __label_5: # case
    $P2 = WSubId_113(__ARG_1, __ARG_2)
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_4 # break
  __label_6: # case
    $P2 = WSubId_113(__ARG_1, __ARG_2)
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_4 # break
  __label_7: # case
    $P2 = WSubId_113(__ARG_1, __ARG_2)
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_4 # break
  __label_8: # case
    $P2 = WSubId_113(__ARG_1, __ARG_2)
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_4 # break
  __label_3: # default
    WSubId_30('Invalid code in parseExpr_8', $P3)
  __label_4: # switch end
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P3)
    .return($P1)

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_115 = "WSubId_115"
    $P1 = WSubId_115(__ARG_1, __ARG_2)
    null $P2
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
    $P3 = WSubId_115(__ARG_1, __ARG_2)
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_116 = "WSubId_116"
    $P1 = WSubId_116(__ARG_1, __ARG_2)
    null $P2
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
    $P3 = WSubId_116(__ARG_1, __ARG_2)
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_118')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_117 = "WSubId_117"
    $P1 = WSubId_117(__ARG_1, __ARG_2)
    null $P2
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
    $P3 = WSubId_117(__ARG_1, __ARG_2)
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_119')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_118 = "WSubId_118"
    $P1 = WSubId_118(__ARG_1, __ARG_2)
    null $P2
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
    $P3 = WSubId_118(__ARG_1, __ARG_2)
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_120')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_119 = "WSubId_119"
.const 'Sub' WSubId_118 = "WSubId_118"
    $P1 = WSubId_119(__ARG_1, __ARG_2)
    null $P2
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
    $P3 = WSubId_118(__ARG_1, __ARG_2)
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_122')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_120 = "WSubId_120"
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_84 = "WSubId_84"
    $P1 = WSubId_120(__ARG_1, __ARG_2)
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
    $P3 = WSubId_121(__ARG_1, __ARG_2)
    WSubId_84(':', __ARG_1)
    $P4 = WSubId_121(__ARG_1, __ARG_2)
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
    __ARG_1.'unget'($P2)
    .return($P1)
  __label_2: # endif

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_121')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_122 = "WSubId_122"
.const 'Sub' WSubId_123 = "WSubId_123"
.const 'Sub' WSubId_121 = "WSubId_121"
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = WSubId_122(__ARG_1, __ARG_2)
    null $P2
    null $I1
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_123($P2)
    set $I1, $P5
    unless $I1 goto __label_1
    $P3 = WSubId_121(__ARG_1, __ARG_2)
    null $P4
    if $I1 == 4 goto __label_5
    if $I1 == 5 goto __label_6
    if $I1 == 6 goto __label_7
    if $I1 == 18 goto __label_8
    if $I1 == 23 goto __label_9
    if $I1 == 24 goto __label_10
    if $I1 == 31 goto __label_11
    goto __label_3
  __label_5: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_4 # break
  __label_6: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_4 # break
  __label_7: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_4 # break
  __label_8: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_4 # break
  __label_9: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_4 # break
  __label_10: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_4 # break
  __label_11: # case
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_4 # break
  __label_3: # default
    WSubId_30('Unexpected code in parseExpr_16', $P2)
  __label_4: # switch end
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    .return($P1)

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_121 = "WSubId_121"
    .tailcall WSubId_121(__ARG_1, __ARG_2)

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
    WSubId_30('attempt to generate break label twice')
  __label_1: # endif
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
    box $P1, $S1
    setattribute self, 'brlabel', $P1
    .return($S1)

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'brlabel'
    unless_null $P1, __label_1
    WSubId_30('attempt to get break label before creating it')
  __label_1: # endif
    .return($P1)

.end # getbreaklabel

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
    WSubId_30('attempt to generate continue label twice')
  __label_1: # endif
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
    .return($S1)

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'cntlabel'
    unless_null $P1, __label_1
    WSubId_30('attempt to get continue label before creating it')
  __label_1: # endif
    .return($P1)

.end # getcontinuelabel

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'Statement'(__ARG_1, __ARG_3)
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
    __ARG_2.'unget'($P1)
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
  __label_1: # endif

.end # parse


.sub 'optimize' :method
    getattribute $P1, self, 'values'
    if_null $P1, __label_1
    $P1 = $P1.'optimize'()
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'values'
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
    $P2 = $P1.'getfreearg'(0)
    $P3 = $P2.'cantailcall'()
    unless $P3 goto __label_6
    getattribute $P4, self, 'owner'
    $P3 = $P4.'allowtailcall'()
  __label_6:
    if_null $P3, __label_5
    unless $P3 goto __label_5
    self.'annotate'(__ARG_1)
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
  __label_5: # endif
  __label_3: # endif
    le $I1, 0, __label_7
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
    self.'annotate'(__ARG_1)
    self.'emitret'(__ARG_1)
    le $I1, 0, __label_8
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
    __ARG_1.'say'(')')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
    __ARG_1.'print'('    ', '.return(')

.end # emitret

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)

.end # YieldStatement


.sub 'clone' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    WSubId_25("inlined yield not allowed", self)

.end # clone


.sub 'emitret' :method
        .param pmc __ARG_1
    __ARG_1.'print'('    ', '.yield(')

.end # emitret

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]

.sub 'InlineReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
    self.'Statement'(__ARG_1, __ARG_3)
    $P1 = __ARG_2.'get'()
    __ARG_2.'unget'($P1)
    $P2 = $P1.'isop'(";")
    isfalse $I1, $P2
    unless $I1 goto __label_1
    $P4 = WSubId_68(__ARG_2, __ARG_3)
    setattribute self, 'expr', $P4
  __label_1: # endif

.end # InlineReturnStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
    getattribute $P3, self, 'start'
    $P1.'Statement'($P3, __ARG_1)
    getattribute $P2, self, 'expr'
    if_null $P2, __label_1
    $P4 = $P2.'clone'(__ARG_1)
    setattribute $P1, 'expr', $P4
  __label_1: # endif
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P1, self, 'expr'
    if_null $P1, __label_1
    $P3 = $P1.'optimize'()
    setattribute self, 'expr', $P3
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    getattribute $P4, self, 'owner'
    $P1 = $P4.'getouter'()
    getattribute $P2, self, 'expr'
    $P4 = $P1.'getrettype'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
    self.'annotate'(__ARG_1)
    if_null $P2, __label_2
    $P3 = $P1.'getretreg'()
    unless_null $P3, __label_3
    $P2.'emit_void'(__ARG_1)
    goto __label_4
  __label_3: # else
    $P4 = $P2.'isnull'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
    __ARG_1.'emitnull'($P3)
    goto __label_6
  __label_5: # else
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_7
    set $S2, $P5
  __label_7:
    ne $S2, $S1, __label_8
    $P2.'emit'(__ARG_1, $P3)
    goto __label_9
  __label_8: # else
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P4, __label_10
    set $S3, $P4
  __label_10:
    self.'annotate'(__ARG_1)
    ne $S1, 'P', __label_11
    __ARG_1.'emitbox'($P3, $S3)
    goto __label_12
  __label_11: # else
    __ARG_1.'emitset'($P3, $S3)
  __label_12: # endif
  __label_9: # endif
  __label_6: # endif
  __label_4: # endif
  __label_2: # endif
    $P4 = $P1.'getendlabel'()
    null $S4
    if_null $P4, __label_13
    set $S4, $P4
  __label_13:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitgoto'($S4)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseReturn' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    $P1 = __ARG_3.'getouter'()
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    unless $I1 goto __label_1
    new $P3, [ 'Winxed'; 'Compiler'; 'InlineReturnStatement' ]
    $P3.'InlineReturnStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
    goto __label_2
  __label_1: # else
    new $P5, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P5.'ReturnStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_2: # endif

.end # parseReturn

.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'Statement'(__ARG_1, __ARG_2)
    setattribute self, 'name', __ARG_1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2

.end # LabelStatement


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'value'
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
    setattribute self, 'owner', __ARG_1
    box $P1, __ARG_2
    setattribute self, 'label', $P1

.end # Reflabel


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    .return($S2)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    addattribute $P0, 'owner'
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'Statement'(__ARG_1, __ARG_3)
    $P1 = __ARG_2.'get'()
    WSubId_124($P1)
    setattribute self, 'label', $P1
    WSubId_84(';', __ARG_2)

.end # GotoStatement


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
    $P1 = WSubId_68(__ARG_1, self)
    self.'set'($P1)

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_68 = "WSubId_68"
    WSubId_84('(', __ARG_1)
    $P1 = WSubId_68(__ARG_1, self)
    self.'set'($P1)
    WSubId_84(')', __ARG_1)

.end # parsecondition

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Condition' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'IfStatement' ]

.sub 'IfStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_125 = "WSubId_125"
    self.'Statement'(__ARG_1, __ARG_3)
    self.'parsecondition'(__ARG_2)
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'truebranch', $P3
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
    $P4 = WSubId_125(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
    __ARG_2.'unget'($P1)
  __label_2: # endif

.end # IfStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'condexpr', $P3
    getattribute $P4, self, 'truebranch'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'truebranch', $P3
    getattribute $P4, self, 'falsebranch'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'falsebranch', $P3
    .return($P1)

.end # clone


.sub 'optimize' :method
    self.'optimize_condition'()
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_1: # default
  __label_2: # switch end
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'truebranch'
    getattribute $P2, self, 'falsebranch'
    $P3 = $P1.'isempty'()
    set $I1, $P3
    $P3 = $P2.'isempty'()
    set $I2, $P3
    set $S1, ''
    not $I3, $I2
    unless $I3 goto __label_1
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
    self.'annotate'(__ARG_1)
    self.'emit_else'(__ARG_1, $S3)
    $P1.'emit'(__ARG_1)
    not $I3, $I2
    unless $I3 goto __label_5
    __ARG_1.'emitgoto'($S2)
    __ARG_1.'emitlabel'($S1, 'else')
    $P2.'emit'(__ARG_1)
  __label_5: # endif
    __ARG_1.'emitlabel'($S2, 'endif')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
    addattribute $P0, 'truebranch'
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_125 = "WSubId_125"
    $P2 = WSubId_125(__ARG_1, self)
    setattribute self, 'body', $P2

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
    __ARG_1.'emitgoto'($S2)
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')

.end # emit_infinite

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'Statement'(__ARG_1, __ARG_3)
    self.'parsecondition'(__ARG_2)
    self.'parsebody'(__ARG_2)

.end # WhileStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condexpr', $P3
    getattribute $P4, self, 'body'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'body', $P3
    .return($P1)

.end # clone


.sub 'optimize' :method
    self.'optimize_condition'()
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    $P1 = self.'getvalue'()
    set $I1, $P1
    if $I1 == 1 goto __label_3
    if $I1 == 2 goto __label_4
    goto __label_1
  __label_3: # case
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_4: # case
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
    __ARG_1.'comment'('while(false) optimized out')
  __label_5: # endif
    goto __label_2 # break
  __label_1: # default
    $P3 = self.'genbreaklabel'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
    $P4 = self.'gencontinuelabel'()
    null $S2
    if_null $P4, __label_7
    set $S2, $P4
  __label_7:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitlabel'($S2, 'while')
    self.'emit_else'(__ARG_1, $S1)
    getattribute $P5, self, 'body'
    $P5.'emit'(__ARG_1)
    __ARG_1.'emitgoto'($S2)
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_2: # switch end

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'DoStatement' ]

.sub 'DoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_126 = "WSubId_126"
    self.'Statement'(__ARG_1, __ARG_3)
    self.'parsebody'(__ARG_2)
    WSubId_126('while', __ARG_2)
    self.'parsecondition'(__ARG_2)

.end # DoStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
    getattribute $P4, self, 'condexpr'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condexpr', $P3
    getattribute $P4, self, 'body'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'body', $P3
    .return($P1)

.end # clone


.sub 'optimize' :method
    self.'optimize_condition'()
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
    $P2 = $P1.'isempty'()
    unless $P2 goto __label_2
    $P3 = self.'getvalue'()
    set $I2, $P3
    iseq $I1, $I2, 2
    box $P2, $I1
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
    setattribute self, 'body', $P1
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'body'
    $P2 = self.'getvalue'()
    set $I1, $P2
    if $I1 == 1 goto __label_3
    goto __label_1
  __label_3: # case
    self.'emit_infinite'(__ARG_1)
    goto __label_2 # break
  __label_1: # default
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
    self.'annotate'(__ARG_1)
    __ARG_1.'emitlabel'($S1, 'do')
    $P1.'emit'(__ARG_1)
    __ARG_1.'emitlabel'($S3, 'continue')
    eq $I1, 2, __label_7
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_2: # switch end

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]

.sub 'ContinueStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'Statement'(__ARG_1, __ARG_3)
    WSubId_84(';', __ARG_2)

.end # ContinueStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
    .return($P1)

.end # clone


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'emitgoto'($S1, 'continue')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'Statement'(__ARG_1, __ARG_3)
    WSubId_84(';', __ARG_2)

.end # BreakStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
    .return($P1)

.end # clone


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'emitgoto'($S1, 'break')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'Statement'(__ARG_1, __ARG_2)
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2

.end # SwitchBaseStatement


.sub 'cloneswitchto' :subid('WSubId_11') :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.lex '__WLEX_1', __ARG_2
.const 'Sub' WSubId_12 = "WSubId_12"
    getattribute $P17, self, 'start'
    __ARG_1.'Statement'($P17, __ARG_2)
    getattribute $P1, self, 'case_value'
    set $P2, __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P3, $P1
    root_new $P4, ['parrot';'ResizablePMCArray']
    $P19 = WSubId_5("clone")
    $P5 = WSubId_3($P19, $P2)
    if_null $P3, __label_4
    iter $P20, $P3
    set $P20, 0
  __label_3: # for iteration
    unless $P20 goto __label_4
    shift $P6, $P20
    $P21 = $P5($P6)
    push $P4, $P21
    goto __label_3
  __label_4: # endfor
    set $P18, $P4
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
    set $P17, $P18
    setattribute __ARG_1, 'case_value', $P17
    getattribute $P7, self, 'case_st'
    root_new $P8, ['parrot';'ResizablePMCArray']
    newclosure $P9, WSubId_12
    if_null $P7, __label_7
    iter $P23, $P7
    set $P23, 0
  __label_6: # for iteration
    unless $P23 goto __label_7
    shift $P10, $P23
    $P19 = $P9($P10)
    push $P8, $P19
    goto __label_6
  __label_7: # endfor
    set $P22, $P8
    goto __label_5
  __label_5:
    set $P17, $P22
    setattribute __ARG_1, 'case_st', $P17
    getattribute $P11, self, 'default_st'
    set $P12, __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P13, $P11
    root_new $P14, ['parrot';'ResizablePMCArray']
    $P19 = WSubId_5("clone")
    $P15 = WSubId_3($P19, $P12)
    if_null $P13, __label_11
    iter $P25, $P13
    set $P25, 0
  __label_10: # for iteration
    unless $P25 goto __label_11
    shift $P16, $P25
    $P21 = $P15($P16)
    push $P14, $P21
    goto __label_10
  __label_11: # endfor
    set $P24, $P14
    goto __label_9
  __label_9:
    goto __label_8
  __label_8:
    set $P17, $P24
    setattribute __ARG_1, 'default_st', $P17
    .return(__ARG_1)

.end # cloneswitchto


.sub '' :anon :subid('WSubId_12') :outer('WSubId_11')
        .param pmc __ARG_3
    find_lex $P1, '__WLEX_1'
    set $P2, __ARG_3
    set $P3, $P1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P9 = WSubId_5("clone")
    $P6 = WSubId_3($P9, $P3)
    if_null $P4, __label_4
    iter $P10, $P4
    set $P10, 0
  __label_3: # for iteration
    unless $P10 goto __label_4
    shift $P7, $P10
    $P11 = $P6($P7)
    push $P5, $P11
    goto __label_3
  __label_4: # endfor
    set $P8, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
    set $P9, $P8
    .return($P9)

.end # WSubId_12


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_125 = "WSubId_125"
    null $P1
  __label_2: # while
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'iskeyword'('case')
    if $P3 goto __label_3
    $P3 = $P1.'iskeyword'('default')
  __label_3:
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P4 = $P1.'iskeyword'('case')
    if_null $P4, __label_4
    unless $P4 goto __label_4
    getattribute $P5, self, 'case_value'
    $P6 = WSubId_68(__ARG_1, self)
    push $P5, $P6
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
    WSubId_70("':' in case", $P1)
  __label_6: # endif
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'('}')
    if $P3 goto __label_10
    $P3 = $P1.'iskeyword'('case')
  __label_10:
    if $P3 goto __label_9
    $P3 = $P1.'iskeyword'('default')
  __label_9:
    isfalse $I1, $P3
    unless $I1 goto __label_7
    __ARG_1.'unget'($P1)
    $P3 = WSubId_125(__ARG_1, self)
    push $P2, $P3
    goto __label_8
  __label_7: # endwhile
    getattribute $P3, self, 'case_st'
    push $P3, $P2
    __ARG_1.'unget'($P1)
    goto __label_5
  __label_4: # else
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
    WSubId_70("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'('}')
    if $P3 goto __label_15
    $P3 = $P1.'iskeyword'('case')
  __label_15:
    if $P3 goto __label_14
    $P3 = $P1.'iskeyword'('default')
  __label_14:
    isfalse $I1, $P3
    unless $I1 goto __label_12
    __ARG_1.'unget'($P1)
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_125(__ARG_1, self)
    push $P3, $P4
    goto __label_13
  __label_12: # endwhile
    __ARG_1.'unget'($P1)
  __label_5: # endif
    goto __label_2
  __label_1: # endwhile
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
    WSubId_70("'}' in switch", $P1)
  __label_16: # endif

.end # parse_cases


.sub 'optimize_cases' :method
    getattribute $P2, self, 'case_value'
    if_null $P2, __label_3
    elements $I1, $P2
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P6 = $P2[$I2]
    $P5 = $P6.'optimize'()
    $P2[$I2] = $P5
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
    getattribute $P5, self, 'case_st'
    if_null $P5, __label_8
    iter $P7, $P5
    set $P7, 0
  __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P1, $P7
    set $P3, $P1
    if_null $P3, __label_11
    elements $I3, $P3
    goto __label_10
  __label_11:
    null $I3
  __label_10:
    null $I4
  __label_14: # for condition
    ge $I4, $I3, __label_13
    $P6 = $P3[$I4]
    $P5 = $P6.'optimize'()
    $P3[$I4] = $P5
  __label_12: # for iteration
    inc $I4
    goto __label_14
  __label_13: # for end
  __label_9:
    goto __label_7
  __label_8: # endfor
    getattribute $P4, self, 'default_st'
    if_null $P4, __label_17
    elements $I5, $P4
    goto __label_16
  __label_17:
    null $I5
  __label_16:
    null $I6
  __label_20: # for condition
    ge $I6, $I5, __label_19
    $P6 = $P4[$I6]
    $P5 = $P6.'optimize'()
    $P4[$I6] = $P5
  __label_18: # for iteration
    inc $I6
    goto __label_20
  __label_19: # for end
  __label_15:

.end # optimize_cases

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
    addattribute $P0, 'case_value'
    addattribute $P0, 'case_st'
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_70 = "WSubId_70"
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
    $P3 = WSubId_68(__ARG_2, self)
    setattribute self, 'condition', $P3
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
    WSubId_70("')' in switch", $P1)
  __label_1: # endif
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
    WSubId_70("'{' in switch", $P1)
  __label_2: # endif
    self.'parse_cases'(__ARG_2)

.end # SwitchStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P2, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P1 = self.'cloneswitchto'($P2, __ARG_1)
    getattribute $P4, self, 'condition'
    $P3 = $P4.'clone'($P1)
    setattribute $P1, 'condition', $P3
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
    self.'optimize_cases'()
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_45 = "WSubId_45"
    set $S1, ''
    getattribute $P19, self, 'case_value'
    if_null $P19, __label_2
    iter $P20, $P19
    set $P20, 0
  __label_1: # for iteration
    unless $P20 goto __label_2
    shift $P1, $P20
    $P21 = $P1.'checkresult'()
    null $S2
    if_null $P21, __label_3
    set $S2, $P21
  __label_3:
    ne $S2, 'N', __label_4
    WSubId_25("Invalid type in case", self)
  __label_4: # endif
    ne $S2, 'S', __label_5
    iseq $I4, $S1, ''
    if $I4 goto __label_7
    iseq $I4, $S1, 'char'
  __label_7:
    unless $I4 goto __label_6
    $P19 = $P1.'isstringliteral'()
    unless $P19 goto __label_10
    $P21 = WSubId_47($P1)
    set $S11, $P21
    length $I6, $S11
    iseq $I5, $I6, 1
    box $P19, $I5
  __label_10:
    if_null $P19, __label_8
    unless $P19 goto __label_8
    set $S2, 'char'
    goto __label_9
  __label_8: # else
    set $S1, 'S'
  __label_9: # endif
  __label_6: # endif
  __label_5: # endif
    ne $S1, '', __label_11
    set $S1, $S2
    goto __label_12
  __label_11: # else
    eq $S1, $S2, __label_13
    set $S1, 'P'
  __label_13: # endif
  __label_12: # endif
    goto __label_1
  __label_2: # endfor
    getattribute $P2, self, 'condition'
    $P3 = $P2.'checkresult'()
    ne $S1, '', __label_14
    set $S1, $P3
  __label_14: # endif
    $P19 = __ARG_1.'getDebug'()
    if_null $P19, __label_15
    unless $P19 goto __label_15
    __ARG_1.'comment'('switch')
  __label_15: # endif
    $P19 = self.'genlabel'()
    null $S3
    if_null $P19, __label_16
    set $S3, $P19
  __label_16:
    null $S4
    ne $S1, 'char', __label_17
    isa $I4, $P2, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    unless $I4 goto __label_21
    getattribute $P21, $P2, 'builtin'
    $P19 = $P21.'name'()
    set $S11, $P19
    iseq $I4, $S11, "chr"
  __label_21:
    unless $I4 goto __label_19
    getattribute $P4, $P2, 'args'
    $P19 = $P4[0]
    getattribute $P5, $P19, 'arg'
    $P19 = $P5.'emit_getint'(__ARG_1)
    set $S4, $P19
    goto __label_20
  __label_19: # else
    null $S5
    set $S11, $P3
    eq $S11, 'S', __label_22
    $P19 = $P2.'emit_get'(__ARG_1)
    null $S6
    if_null $P19, __label_24
    set $S6, $P19
  __label_24:
    $P19 = self.'tempreg'('S')
    set $S5, $P19
    __ARG_1.'emitset'($S5, $S6)
    goto __label_23
  __label_22: # else
    $P19 = $P2.'emit_get'(__ARG_1)
    set $S5, $P19
  __label_23: # endif
    __ARG_1.'emitif_null'($S5, $S3)
    $P19 = self.'tempreg'('I')
    set $S4, $P19
    __ARG_1.'emitarg2'('length', $S4, $S5)
    __ARG_1.'emitarg3'('ne', $S4, "1", $S3)
    __ARG_1.'emitarg2'('ord', $S4, $S5)
  __label_20: # endif
    goto __label_18
  __label_17: # else
    set $S11, $P3
    ne $S11, $S1, __label_25
    $P19 = $P2.'emit_get'(__ARG_1)
    set $S4, $P19
    goto __label_26
  __label_25: # else
    $P21 = self.'tempreg'($S1)
    set $S4, $P21
    $P19 = $P2.'emit_get'(__ARG_1)
    null $S7
    if_null $P19, __label_27
    set $S7, $P19
  __label_27:
    __ARG_1.'emitset'($S4, $S7)
  __label_26: # endif
  __label_18: # endif
    self.'genbreaklabel'()
    new $P6, ['ResizableStringArray']
    null $S8
    eq $S1, 'char', __label_28
    self.'tempreg'($S1)
  __label_28: # endif
    getattribute $P19, self, 'case_value'
    if_null $P19, __label_30
    iter $P22, $P19
    set $P22, 0
  __label_29: # for iteration
    unless $P22 goto __label_30
    shift $P7, $P22
    $P21 = self.'genlabel'()
    null $S9
    if_null $P21, __label_31
    set $S9, $P21
  __label_31:
    push $P6, $S9
    null $S10
    ne $S1, 'I', __label_32
    $P19 = $P7.'emit_getint'(__ARG_1)
    set $S10, $P19
    goto __label_33
  __label_32: # else
    ne $S1, 'char', __label_34
    $P21 = WSubId_47($P7)
    set $S11, $P21
    ord $I1, $S11
    set $S10, $I1
    goto __label_35
  __label_34: # else
    $P19 = $P7.'checkresult'()
    set $S11, $P19
    ne $S1, $S11, __label_36
    $P21 = $P7.'emit_get'(__ARG_1)
    set $S10, $P21
    goto __label_37
  __label_36: # else
    $P7.'emit'(__ARG_1, $S8)
    set $S10, $S8
  __label_37: # endif
  __label_35: # endif
  __label_33: # endif
    $P19 = WSubId_45("    if %0 == %1 goto %2", $S4, $S10, $S9)
    __ARG_1.'say'($P19)
    goto __label_29
  __label_30: # endfor
    __ARG_1.'emitgoto'($S3)
    self.'annotate'(__ARG_1)
    getattribute $P8, self, 'case_st'
    set $I2, $P8
    null $I3
  __label_40: # for condition
    ge $I3, $I2, __label_39
    $P19 = $P6[$I3]
    __ARG_1.'emitlabel'($P19, 'case')
    set $P9, __ARG_1
    $P10 = $P8[$I3]
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P11, $P10
    $P19 = WSubId_5("emit")
    $P12 = WSubId_3($P19, $P9)
    if_null $P11, __label_44
    iter $P23, $P11
    set $P23, 0
  __label_43: # for iteration
    unless $P23 goto __label_44
    shift $P13, $P23
    $P12($P13)
    goto __label_43
  __label_44: # endfor
  __label_42:
  __label_41:
  __label_38: # for iteration
    inc $I3
    goto __label_40
  __label_39: # for end
    __ARG_1.'emitlabel'($S3, 'default')
    set $P14, __ARG_1
    getattribute $P15, self, 'default_st'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P16, $P15
    $P19 = WSubId_5("emit")
    $P17 = WSubId_3($P19, $P14)
    if_null $P16, __label_48
    iter $P24, $P16
    set $P24, 0
  __label_47: # for iteration
    unless $P24 goto __label_48
    shift $P18, $P24
    $P17($P18)
    goto __label_47
  __label_48: # endfor
  __label_46:
  __label_45:
    getattribute $P21, self, 'start'
    $P19 = self.'getbreaklabel'($P21)
    __ARG_1.'emitlabel'($P19, 'switch end')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
    self.'parse_cases'(__ARG_2)

.end # SwitchCaseStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    .tailcall self.'cloneswitchto'($P1, __ARG_1)

.end # clone


.sub 'optimize' :method
    self.'optimize_cases'()
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    self.'genbreaklabel'()
    $P14 = self.'genlabel'()
    null $S1
    if_null $P14, __label_1
    set $S1, $P14
  __label_1:
    new $P1, ['ResizableStringArray']
    $P14 = __ARG_1.'getDebug'()
    if_null $P14, __label_2
    unless $P14 goto __label_2
    __ARG_1.'comment'('switch-case')
  __label_2: # endif
    $P14 = self.'tempreg'('I')
    null $S2
    if_null $P14, __label_3
    set $S2, $P14
  __label_3:
    getattribute $P14, self, 'case_value'
    if_null $P14, __label_5
    iter $P15, $P14
    set $P15, 0
  __label_4: # for iteration
    unless $P15 goto __label_5
    shift $P2, $P15
    $P16 = self.'genlabel'()
    null $S3
    if_null $P16, __label_6
    set $S3, $P16
  __label_6:
    push $P1, $S3
    $P14 = $P2.'checkresult'()
    set $S5, $P14
    ne $S5, 'I', __label_7
    $P2.'emit'(__ARG_1, $S2)
    goto __label_8
  __label_7: # else
    $P16 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P16, __label_9
    set $S4, $P16
  __label_9:
    __ARG_1.'emitset'($S2, $S4)
  __label_8: # endif
    __ARG_1.'emitif'($S2, $S3)
    goto __label_4
  __label_5: # endfor
    __ARG_1.'emitgoto'($S1)
    self.'annotate'(__ARG_1)
    getattribute $P3, self, 'case_st'
    set $I1, $P3
    null $I2
  __label_12: # for condition
    ge $I2, $I1, __label_11
    $P14 = $P1[$I2]
    __ARG_1.'emitlabel'($P14, 'case')
    set $P4, __ARG_1
    $P5 = $P3[$I2]
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P6, $P5
    $P14 = WSubId_5("emit")
    $P7 = WSubId_3($P14, $P4)
    if_null $P6, __label_16
    iter $P17, $P6
    set $P17, 0
  __label_15: # for iteration
    unless $P17 goto __label_16
    shift $P8, $P17
    $P7($P8)
    goto __label_15
  __label_16: # endfor
  __label_14:
  __label_13:
  __label_10: # for iteration
    inc $I2
    goto __label_12
  __label_11: # for end
    __ARG_1.'emitlabel'($S1, 'default')
    set $P9, __ARG_1
    getattribute $P10, self, 'default_st'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P11, $P10
    $P14 = WSubId_5("emit")
    $P12 = WSubId_3($P14, $P9)
    if_null $P11, __label_20
    iter $P18, $P11
    set $P18, 0
  __label_19: # for iteration
    unless $P18 goto __label_20
    shift $P13, $P18
    $P12($P13)
    goto __label_19
  __label_20: # endfor
  __label_18:
  __label_17:
    getattribute $P16, self, 'start'
    $P14 = self.'getbreaklabel'($P16)
    __ARG_1.'emitlabel'($P14, 'switch end')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
    WSubId_70("'(' in switch", $P1)

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_28 = "WSubId_28"
    self.'BlockStatement'(__ARG_1, __ARG_3)
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_1
    __ARG_2.'unget'($P1)
    $P4 = WSubId_125(__ARG_2, self)
    setattribute self, 'initializer', $P4
  __label_1: # endif
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'(';')
    isfalse $I1, $P3
    unless $I1 goto __label_2
    __ARG_2.'unget'($P1)
    self.'parseconditionshort'(__ARG_2)
    WSubId_84(';', __ARG_2)
  __label_2: # endif
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_3
    __ARG_2.'unget'($P1)
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_4: # do
    $P3 = WSubId_68(__ARG_2, self)
    push $P2, $P3
  __label_6: # continue
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_5
    if $P3 goto __label_4
  __label_5: # enddo
    setattribute self, 'iteration', $P2
    WSubId_28(')', $P1)
  __label_3: # endif
    self.'parsebody'(__ARG_2)

.end # ForStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    getattribute $P8, self, 'start'
    $P1.'BlockStatement'($P8, __ARG_1)
    getattribute $P8, self, 'initializer'
    if_null $P8, __label_1
    getattribute $P11, self, 'initializer'
    $P10 = $P11.'clone'($P1)
    setattribute $P1, 'initializer', $P10
  __label_1: # endif
    getattribute $P8, self, 'condexpr'
    if_null $P8, __label_2
    getattribute $P11, self, 'condexpr'
    $P10 = $P11.'clone'($P1)
    setattribute $P1, 'condexpr', $P10
  __label_2: # endif
    getattribute $P8, self, 'iteration'
    if_null $P8, __label_3
    getattribute $P2, self, 'iteration'
    set $P3, $P1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_5("clone")
    $P6 = WSubId_3($P10, $P3)
    if_null $P4, __label_7
    iter $P13, $P4
    set $P13, 0
  __label_6: # for iteration
    unless $P13 goto __label_7
    shift $P7, $P13
    $P11 = $P6($P7)
    push $P5, $P11
    goto __label_6
  __label_7: # endfor
    set $P12, $P5
    goto __label_5
  __label_5:
    goto __label_4
  __label_4:
    set $P8, $P12
    setattribute $P1, 'iteration', $P8
  __label_3: # endif
    getattribute $P10, self, 'body'
    $P9 = $P10.'clone'($P1)
    setattribute $P1, 'body', $P9
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_2
    self.'optimize_condition'()
    $P3 = self.'getvalue'()
    set $I3, $P3
    ne $I3, 2, __label_3
    if_null $P1, __label_4
    .return($P1)
    goto __label_5
  __label_4: # else
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_5: # endif
  __label_3: # endif
  __label_2: # endif
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_8
    elements $I1, $P2
    goto __label_7
  __label_8:
    null $I1
  __label_7:
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
    $P4 = $P2[$I2]
    $P3 = $P4.'optimize'()
    $P2[$I2] = $P3
  __label_9: # for iteration
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_6:
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'iteration'
    isnull $I1, $P1
    not $I1
    getattribute $P3, self, 'initializer'
    isnull $I2, $P3
    unless $I2 goto __label_3
    getattribute $P4, self, 'condexpr'
    isnull $I2, $P4
  __label_3:
    unless $I2 goto __label_2
    not $I2, $I1
  __label_2:
    unless $I2 goto __label_1
    self.'emit_infinite'(__ARG_1)
    .return()
  __label_1: # endif
    $P3 = __ARG_1.'getDebug'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
    __ARG_1.'comment'('for loop')
  __label_4: # endif
    $P3 = self.'gencontinuelabel'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
    unless $I1 goto __label_8
    $P3 = self.'genlabel'()
    set $S3, $P3
    goto __label_7
  __label_8:
    set $S3, $S1
  __label_7:
    getattribute $P3, self, 'initializer'
    if_null $P3, __label_9
    getattribute $P4, self, 'initializer'
    $P4.'emit'(__ARG_1)
  __label_9: # endif
    __ARG_1.'emitlabel'($S3, 'for condition')
    getattribute $P3, self, 'condexpr'
    if_null $P3, __label_10
    self.'emit_else'(__ARG_1, $S2)
  __label_10: # endif
    getattribute $P3, self, 'body'
    $P3.'emit'(__ARG_1)
    unless $I1 goto __label_11
    __ARG_1.'emitlabel'($S1, 'for iteration')
    if_null $P1, __label_13
    iter $P5, $P1
    set $P5, 0
  __label_12: # for iteration
    unless $P5 goto __label_13
    shift $P2, $P5
    $P2.'emit_void'(__ARG_1)
    goto __label_12
  __label_13: # endfor
  __label_11: # endif
    __ARG_1.'emitgoto'($S3)
    __ARG_1.'emitlabel'($S2, 'for end')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
    addattribute $P0, 'initializer'
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_127 = "WSubId_127"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'BlockStatement'(__ARG_1, __ARG_3)
    eq __ARG_5, '', __label_1
    $P1 = WSubId_127(__ARG_5)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
    self.'createvar'(__ARG_4, $S1)
    box $P1, $S1
    setattribute self, 'deftype', $P1
  __label_1: # endif
    setattribute self, 'varname', __ARG_4
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'container', $P2
    WSubId_84(')', __ARG_2)
    self.'parsebody'(__ARG_2)

.end # ForeachStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    getattribute $P4, self, 'start'
    $P1.'BlockStatement'($P4, __ARG_1)
    getattribute $P2, self, 'deftype'
    getattribute $P3, self, 'varname'
    if_null $P2, __label_1
    $P1.'createvar'($P3, $P2)
  __label_1: # endif
    setattribute $P1, 'deftype', $P2
    setattribute $P1, 'varname', $P3
    getattribute $P6, self, 'container'
    $P5 = $P6.'clone'($P1)
    setattribute $P1, 'container', $P5
    getattribute $P6, self, 'body'
    $P5 = $P6.'clone'($P1)
    setattribute $P1, 'body', $P5
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
    $P2 = $P1.'isnull'()
    if $P2 goto __label_2
    $P2 = $P1.'isstringliteral'()
    unless $P2 goto __label_3
    $P3 = $P1.'get_value'()
    set $S1, $P3
    length $I2, $S1
    iseq $I1, $I2, 0
    box $P2, $I1
  __label_3:
  __label_2:
    if_null $P2, __label_1
    unless $P2 goto __label_1
    new $P4, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P4)
  __label_1: # endif
    setattribute self, 'container', $P1
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_91 = "WSubId_91"
    self.'annotate'(__ARG_1)
    null $S1
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
    $P2 = self.'tempreg'('P')
    set $S1, $P2
    __ARG_1.'emitbox'($S1, $S2)
    goto __label_2
  __label_1: # else
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
    unless_null $P1, __label_4
    getattribute $P2, self, 'varname'
    WSubId_91($P2, self)
  __label_4: # endif
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
    __ARG_1.'emitif_null'($S1, $S5)
    __ARG_1.'emitarg2'('iter', $S3, $S1)
    __ARG_1.'emitset'($S3, '0')
    __ARG_1.'emitlabel'($S4, 'for iteration')
    __ARG_1.'emitunless'($S3, $S5)
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
    __ARG_1.'emitgoto'($S4)
    __ARG_1.'emitlabel'($S5, 'endfor')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    addattribute $P0, 'deftype'
    addattribute $P0, 'varname'
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
    WSubId_84('(', __ARG_2)
    $P1 = __ARG_2.'get'()
    $P2 = __ARG_2.'get'()
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
    $P3 = __ARG_2.'get'()
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
    __ARG_2.'unget'($P3)
    __ARG_2.'unget'($P2)
    __ARG_2.'unget'($P1)
  __label_2: # endif
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_68 = "WSubId_68"
    self.'Statement'(__ARG_1, __ARG_3)
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'excep', $P2

.end # ThrowStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    getattribute $P2, self, 'start'
    $P1.'Statement'($P2, __ARG_1)
    getattribute $P4, self, 'excep'
    $P3 = $P4.'clone'(__ARG_1)
    setattribute $P1, 'excep', $P3
    .return($P1)

.end # clone


.sub 'optimize' :method
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'excep'
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    self.'annotate'(__ARG_1)
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    if_null $S3, __label_2
    length $I1, $S3
    ne $I1, 1, __label_2
    ord $I1, $S3
    if $I1 == 80 goto __label_4
    if $I1 == 83 goto __label_5
    goto __label_2
  __label_4: # case
    goto __label_3 # break
  __label_5: # case
    set $S2, $S1
    $P3 = self.'tempreg'('P')
    set $S1, $P3
    $P4 = WSubId_45("    root_new %0, ['parrot';'Exception']\n    %0['message'] = %1\n", $S1, $S2)
    __ARG_1.'print'($P4)
    goto __label_3 # break
  __label_2: # default
    WSubId_25("Invalid throw argument", self)
  __label_3: # switch end
    __ARG_1.'emitarg1'('throw', $S1)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    setattribute self, 'start', __ARG_1
    self.'ModifierList'(__ARG_2, __ARG_3)

.end # TryModifierList


.sub 'allowtailcall' :method
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_45 = "WSubId_45"
    $P1 = self.'getlist'()
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
    $P7 = $P2.'numargs'()
    set $I1, $P7
    if $S1 == 'min_severity' goto __label_6
    if $S1 == 'max_severity' goto __label_7
    if $S1 == 'handle_types' goto __label_8
    if $S1 == 'handle_types_except' goto __label_9
    if $S1 == 'allowtailcall' goto __label_10
    goto __label_4
  __label_6: # case
  __label_7: # case
    eq $I1, 1, __label_11
    WSubId_25('Wrong modifier args', self)
  __label_11: # endif
    $P3 = $P2.'getarg'(0)
    $P8 = $P3.'emit_get'(__ARG_1)
    $P7 = WSubId_45("    %0.'%1'(%2)", __ARG_2, $S1, $P8)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_8: # case
  __label_9: # case
    new $P4, ['ResizableStringArray']
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
    $P5 = $P2.'getarg'($I2)
    $P7 = $P5.'emit_get'(__ARG_1)
    push $P4, $P7
  __label_12: # for iteration
    inc $I2
    goto __label_14
  __label_13: # for end
    join $S2, ', ', $P4
    $P7 = WSubId_45("    %0.'%1'(%2)", __ARG_2, $S1, $S2)
    __ARG_1.'say'($P7)
    goto __label_5 # break
  __label_10: # case
    goto __label_5 # break
  __label_4: # default
    concat $S3, "Modifier '", $S1
    concat $S3, $S3, "' not valid for try"
    WSubId_25($S3, self)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor

.end # emitmodifiers

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_26 = "WSubId_26"
.const 'Sub' WSubId_70 = "WSubId_70"
    self.'BlockStatement'(__ARG_1, __ARG_3)
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
    __ARG_2.'unget'($P1)
  __label_2: # endif
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'stry', $P3
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
    WSubId_26('catch', $P1)
  __label_3: # endif
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
    WSubId_70("'(' after 'catch'", $P1)
  __label_4: # endif
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
    setattribute self, 'exname', $P1
    self.'createvar'($S1, 'P')
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
    WSubId_70("')' in 'catch'", $P1)
  __label_7: # endif
  __label_5: # endif
    $P3 = WSubId_125(__ARG_2, self)
    setattribute self, 'scatch', $P3

.end # TryStatement


.sub 'allowtailcall' :method
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
    .return(0)
  __label_2: # endif

.end # allowtailcall


.sub 'optimize' :method
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
    self.'annotate'(__ARG_1)
    unless $I1 goto __label_7
    __ARG_1.'comment'('try: create handler')
  __label_7: # endif
    $P1 = WSubId_45("    new %0, 'ExceptionHandler'\n    set_label %0, %1\n", $S1, $S2)
    __ARG_1.'print'($P1)
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_8
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_8: # endif
    __ARG_1.'emitarg1'('push_eh', $S1)
    unless $I1 goto __label_9
    __ARG_1.'comment'('try: begin')
  __label_9: # endif
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
    unless $I1 goto __label_10
    __ARG_1.'comment'('try: end')
  __label_10: # endif
    __ARG_1.'say'('    ', 'pop_eh')
    self.'annotate'(__ARG_1)
    __ARG_1.'emitgoto'($S3)
    unless $I1 goto __label_11
    __ARG_1.'comment'('catch')
  __label_11: # endif
    __ARG_1.'emitlabel'($S2)
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
    __ARG_1.'emitarg1'('finalize', $S4)
    __ARG_1.'say'('    ', 'pop_eh')
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
    unless $I1 goto __label_12
    __ARG_1.'comment'('catch end')
  __label_12: # endif
    __ARG_1.'emitlabel'($S3)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
    addattribute $P0, 'stry'
    addattribute $P0, 'modifiers'
    addattribute $P0, 'exname'
    addattribute $P0, 'scatch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
    self.'Statement'(__ARG_1, __ARG_2)
    setattribute self, 'name', __ARG_3
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
    box $P2, __ARG_4
    setattribute self, 'flags', $P2

.end # initvarbase

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
    addattribute $P0, 'reg'
    addattribute $P0, 'flags'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
    self.'Statement'(__ARG_1, __ARG_2)
    setattribute self, 'name', __ARG_3
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
    box $P2, __ARG_5
    setattribute self, 'regtype', $P2
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3

.end # DeclareBase

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
    addattribute $P0, 'basetype'
    addattribute $P0, 'regtype'
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_68 = "WSubId_68"
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
    $P1 = __ARG_5.'get'()
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
    $P4 = WSubId_68(__ARG_5, self)
    setattribute self, 'init', $P4
    goto __label_2
  __label_1: # else
    __ARG_5.'unget'($P1)
  __label_2: # endif

.end # DeclareSingleStatement


.sub 'clonedeclare' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'start'
    getattribute $P2, self, 'name'
    getattribute $P3, self, 'basetype'
    getattribute $P4, self, 'regtype'
    __ARG_1.'DeclareBase'($P1, __ARG_2, $P2, $P3, $P4)
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
    getattribute $P4, self, 'init'
    $P3 = $P4.'clone'(__ARG_2)
    setattribute __ARG_1, 'init', $P3
  __label_1: # endif
    .return(__ARG_1)

.end # clonedeclare


.sub 'optimize' :method
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_128 = "WSubId_128"
.const 'Sub' WSubId_47 = "WSubId_47"
.const 'Sub' WSubId_30 = "WSubId_30"
.const 'Sub' WSubId_25 = "WSubId_25"
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
    null $S3
    getattribute $P2, self, 'basetype'
    null $S4
    if_null $P2, __label_3
    set $S4, $P2
  __label_3:
    getattribute $P1, self, 'init'
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
  __label_4: # endif
    isnull $I1, $P1
    box $P2, $I1
    if $P2 goto __label_7
    $P2 = $P1.'isnull'()
  __label_7:
    if_null $P2, __label_5
    unless $P2 goto __label_5
    __ARG_1.'emitnull'($S2)
    goto __label_6
  __label_5: # else
    $P3 = $P1.'checkresult'()
    null $S5
    if_null $P3, __label_8
    set $S5, $P3
  __label_8:
    ne $S5, $S4, __label_9
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_11
    $P1.'emit'(__ARG_1, $S2)
    goto __label_12
  __label_11: # else
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_13
    unless $P2 goto __label_13
    if_null $S4, __label_15
    length $I1, $S4
    ne $I1, 1, __label_15
    ord $I1, $S4
    if $I1 == 73 goto __label_17
    if $I1 == 78 goto __label_18
    if $I1 == 83 goto __label_19
    goto __label_15
  __label_17: # case
    $P3 = WSubId_48($P1)
    set $S3, $P3
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_18: # case
    $P4 = WSubId_128($P1)
    set $S3, $P4
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_19: # case
    $P5 = WSubId_47($P1)
    set $S3, $P5
    __ARG_1.'emitset'($S2, $S3)
    goto __label_16 # break
  __label_15: # default
    WSubId_30("Wrong type", self)
  __label_16: # switch end
    goto __label_14
  __label_13: # else
    if_null $S5, __label_20
    length $I1, $S5
    ne $I1, 1, __label_20
    ord $I1, $S5
    if $I1 == 118 goto __label_22
    goto __label_20
  __label_22: # case
    WSubId_25('Invalid initialization from void value', self)
  __label_20: # default
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S3, $P2
  __label_21: # switch end
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_25
    iseq $I1, $S5, 'P'
  __label_25:
    unless $I1 goto __label_23
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_26
    set $S6, $P2
  __label_26:
    __ARG_1.'emitnull'($S2)
    __ARG_1.'emitif_null'($S3, $S6)
    __ARG_1.'emitset'($S2, $S3)
    __ARG_1.'emitlabel'($S6)
    goto __label_24
  __label_23: # else
    __ARG_1.'emitset'($S2, $S3)
  __label_24: # endif
  __label_14: # endif
  __label_12: # endif
  __label_10: # endif
  __label_6: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]

.sub 'DeclareArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param pmc __ARG_6
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_67 = "WSubId_67"
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
    $P1 = __ARG_6.'get'()
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
    __ARG_6.'unget'($P1)
    $P3 = WSubId_68(__ARG_6, self)
    setattribute self, 'size', $P3
    WSubId_84(']', __ARG_6)
  __label_1: # endif
    $P1 = __ARG_6.'get'()
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
    $P1 = __ARG_6.'get'()
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
    WSubId_70("array initializer", $P1)
  __label_4: # endif
    $P1 = __ARG_6.'get'()
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
    __ARG_6.'unget'($P1)
    $P3 = WSubId_67(__ARG_6, self, WSubId_68, ']')
    setattribute self, 'initarray', $P3
  __label_5: # endif
    goto __label_3
  __label_2: # else
    __ARG_6.'unget'($P1)
  __label_3: # endif

.end # DeclareArrayStatement


.sub 'clonedeclare' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P7, self, 'start'
    getattribute $P8, self, 'name'
    getattribute $P9, self, 'basetype'
    __ARG_1.'DeclareBase'($P7, __ARG_2, $P8, $P9, 'P')
    getattribute $P8, self, 'arraytype'
    setattribute __ARG_1, 'arraytype', $P8
    getattribute $P7, self, 'size'
    if_null $P7, __label_1
    unless $P7 goto __label_1
    getattribute $P10, self, 'size'
    $P9 = $P10.'clone'(__ARG_1)
    setattribute __ARG_1, 'size', $P9
  __label_1: # endif
    getattribute $P7, self, 'initarray'
    if_null $P7, __label_2
    getattribute $P1, self, 'initarray'
    set $P2, __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P3, $P1
    root_new $P4, ['parrot';'ResizablePMCArray']
    $P9 = WSubId_5("clone")
    $P5 = WSubId_3($P9, $P2)
    if_null $P3, __label_6
    iter $P12, $P3
    set $P12, 0
  __label_5: # for iteration
    unless $P12 goto __label_6
    shift $P6, $P12
    $P10 = $P5($P6)
    push $P4, $P10
    goto __label_5
  __label_6: # endfor
    set $P11, $P4
    goto __label_4
  __label_4:
    goto __label_3
  __label_3:
    set $P7, $P11
    setattribute __ARG_1, 'initarray', $P7
  __label_2: # endif
    .return(__ARG_1)

.end # clonedeclare


.sub 'optimize' :method
    getattribute $P2, self, 'size'
    if_null $P2, __label_1
    getattribute $P5, self, 'size'
    $P4 = $P5.'optimize'()
    setattribute self, 'size', $P4
  __label_1: # endif
    getattribute $P1, self, 'initarray'
    if_null $P1, __label_4
    elements $I1, $P1
    goto __label_3
  __label_4:
    null $I1
  __label_3:
    null $I2
  __label_7: # for condition
    ge $I2, $I1, __label_6
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_5: # for iteration
    inc $I2
    goto __label_7
  __label_6: # for end
  __label_2:
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'reg'
    getattribute $P2, self, 'size'
    getattribute $P3, self, 'initarray'
    getattribute $P4, self, 'basetype'
    getattribute $P5, self, 'arraytype'
    if_null $P2, __label_1
    $P8 = $P2.'emit_get'(__ARG_1)
    $P7 = WSubId_45("    new %0, ['Fixed%1Array'], %2", $P1, $P5, $P8)
    __ARG_1.'say'($P7)
    goto __label_2
  __label_1: # else
    $P7 = WSubId_45("    new %0, ['Resizable%1Array']", $P1, $P5)
    __ARG_1.'say'($P7)
  __label_2: # endif
    if_null $P3, __label_3
    $P7 = self.'tempreg'($P4)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
    elements $I1, $P3
    unless_null $P2, __label_5
    unless $I1 goto __label_6
    __ARG_1.'emitset'($P1, $I1)
  __label_6: # endif
  __label_5: # endif
    null $I2
    if_null $P3, __label_8
    iter $P9, $P3
    set $P9, 0
  __label_7: # for iteration
    unless $P9 goto __label_8
    shift $P6, $P9
    $P6.'emit'(__ARG_1, $S1)
    $P7 = WSubId_45("    %0[%1] = %2", $P1, $I2, $S1)
    __ARG_1.'say'($P7)
    inc $I2
    goto __label_7
  __label_8: # endfor
  __label_3: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
    addattribute $P0, 'size'
    addattribute $P0, 'initarray'
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_129')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_28 = "WSubId_28"
    null $P1
    null $P2
  __label_1: # do
    $P3 = __ARG_4.'get'()
    WSubId_124($P3)
    $P4 = __ARG_4.'get'()
    null $P5
    $P8 = $P4.'isop'('[')
    if_null $P8, __label_4
    unless $P8 goto __label_4
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
    __ARG_4.'unget'($P4)
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
  __label_5: # endif
    set $P6, $P2
    set $P7, $P5
    isnull $I1, $P6
    if $I1 goto __label_9
    isa $I1, $P6, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_10
    goto __label_8
  __label_9: # case
    set $P2, $P7
    goto __label_6
  __label_10: # case
    $P2 = $P6.'push'($P7)
    goto __label_6
  __label_8: # default
    new $P8, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P8.'MultiStatement'($P6, $P7)
    set $P2, $P8
    goto __label_6
  __label_7: # switch end
  __label_6:
    $P1 = __ARG_4.'get'()
  __label_3: # continue
    $P8 = $P1.'isop'(',')
    if_null $P8, __label_2
    if $P8 goto __label_1
  __label_2: # enddo
    WSubId_28(';', $P1)
    .return($P2)

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)

.end # IntStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)

.end # clone

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)

.end # IntArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)

.end # clone

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_130')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_131')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)

.end # newIntArray


.sub 'parseInt' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_130 = "WSubId_130"
.const 'Sub' WSubId_131 = "WSubId_131"
    .tailcall WSubId_129(WSubId_130, WSubId_131, __ARG_1, __ARG_2, __ARG_3)

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)

.end # FloatStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)

.end # clone

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)

.end # FloatArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)

.end # clone

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_132')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_133')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_132 = "WSubId_132"
.const 'Sub' WSubId_133 = "WSubId_133"
    .tailcall WSubId_129(WSubId_132, WSubId_133, __ARG_1, __ARG_2, __ARG_3)

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)

.end # StringStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)

.end # clone

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)

.end # StringArrayStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    .tailcall self.'clonedeclare'($P1, __ARG_1)

.end # clone

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_134')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_135')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)

.end # newStringArray


.sub 'parseString' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_129 = "WSubId_129"
.const 'Sub' WSubId_134 = "WSubId_134"
.const 'Sub' WSubId_135 = "WSubId_135"
    .tailcall WSubId_129(WSubId_134, WSubId_135, __ARG_1, __ARG_2, __ARG_3)

.end # parseString

.namespace [ 'Winxed'; 'Compiler'; 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
    self.'Statement'(__ARG_1, __ARG_2)
    box $P1, __ARG_3
    setattribute self, 'type', $P1
    setattribute self, 'name', __ARG_4
    setattribute self, 'value', __ARG_5
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'value'
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    $P1 = $P1.'optimize'()
    $P2 = $P1.'hascompilevalue'()
    isfalse $I1, $P2
    unless $I1 goto __label_2
    WSubId_25('Value for const is not evaluable at compile time', self)
  __label_2: # endif
    getattribute $P2, self, 'data'
    $P2.'setvalue'($P1)
    .return(self)

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_30 = "WSubId_30"
    getattribute $P1, self, 'start'
    WSubId_30('Direct use of const', $P1)

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
    getattribute $P3, self, 'data'
    $P1 = $P3.'getvalue'()
    null $S1
    getattribute $P2, self, 'type'
    set $S2, $P2
    if_null $S2, __label_2
    length $I1, $S2
    ne $I1, 1, __label_2
    ord $I1, $S2
    if $I1 == 73 goto __label_4
    if $I1 == 78 goto __label_5
    if $I1 == 83 goto __label_6
    goto __label_2
  __label_4: # case
    $P3 = $P1.'getIntegerValue'()
    set $S1, $P3
    goto __label_3 # break
  __label_5: # case
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_3 # break
  __label_6: # case
    $P5 = $P1.'getPirString'()
    set $S1, $P5
    goto __label_3 # break
  __label_2: # default
  __label_3: # switch end
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, "Constant '", $S2
    concat $S3, $S3, "' set to: "
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
  __label_1: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'type'
    addattribute $P0, 'name'
    addattribute $P0, 'data'
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_127 = "WSubId_127"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_28 = "WSubId_28"
    $P1 = __ARG_2.'get'()
    $P7 = WSubId_127($P1)
    null $S1
    if_null $P7, __label_1
    set $S1, $P7
  __label_1:
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
    WSubId_25('Invalid type for const', __ARG_1)
  __label_2: # endif
    null $P2
  __label_5: # do
    $P3 = __ARG_2.'get'()
    WSubId_84('=', __ARG_2)
    $P4 = WSubId_68(__ARG_2, __ARG_3)
    set $P5, $P2
    new $P7, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P7.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P6, $P7
    isnull $I1, $P5
    if $I1 goto __label_11
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_12
    goto __label_10
  __label_11: # case
    set $P2, $P6
    goto __label_8
  __label_12: # case
    $P2 = $P5.'push'($P6)
    goto __label_8
  __label_10: # default
    new $P8, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P8.'MultiStatement'($P5, $P6)
    set $P2, $P8
    goto __label_8
  __label_9: # switch end
  __label_8:
  __label_7: # continue
    $P1 = __ARG_2.'get'()
    $P7 = $P1.'isop'(',')
    if_null $P7, __label_6
    if $P7 goto __label_5
  __label_6: # enddo
    WSubId_28(';', $P1)
    .return($P2)

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_28 = "WSubId_28"
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
    $P4 = WSubId_68(__ARG_2, self)
    setattribute self, 'init', $P4
    $P1 = __ARG_2.'get'()
  __label_1: # endif
    WSubId_28(';', $P1)

.end # VarStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    getattribute $P2, self, 'start'
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'flags'
    $P1.'initvarbase'($P2, __ARG_1, $P3, $P4)
    getattribute $P2, self, 'init'
    if_null $P2, __label_1
    getattribute $P5, self, 'init'
    $P4 = $P5.'clone'($P1)
    setattribute $P1, 'init', $P4
  __label_1: # endif
    .return($P1)

.end # clone


.sub 'optimize_init' :method
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
    .return(self)

.end # optimize_init


.sub 'optimize' :method
    .tailcall self.'optimize_init'()

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
    getattribute $P1, self, 'init'
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
  __label_3: # endif
    if_null $P1, __label_4
    $P2 = $P1.'isnull'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
    null $P1
  __label_5: # endif
  __label_4: # endif
    if_null $P1, __label_6
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    if_null $S4, __label_8
    length $I1, $S4
    ne $I1, 1, __label_8
    ord $I1, $S4
    if $I1 == 80 goto __label_10
    if $I1 == 83 goto __label_11
    if $I1 == 73 goto __label_12
    if $I1 == 78 goto __label_13
    if $I1 == 118 goto __label_14
    goto __label_8
  __label_10: # case
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_9 # break
  __label_11: # case
  __label_12: # case
  __label_13: # case
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_15
    set $S3, $P3
  __label_15:
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_9 # break
  __label_14: # case
    WSubId_25("Can't use void function as initializer", self)
  __label_8: # default
    WSubId_25("Invalid var initializer", self)
  __label_9: # switch end
    goto __label_7
  __label_6: # else
    __ARG_1.'emitnull'($S2)
  __label_7: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
    WSubId_84(';', __ARG_2)

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
    getattribute $P3, self, 'name'
    $P2 = WSubId_45("var %0[] : %1", $P3, $S1)
    __ARG_1.'comment'($P2)
  __label_2: # endif
    $P1 = WSubId_45("    new %0, 'ResizablePMCArray'", $S1)
    __ARG_1.'say'($P1)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_84 = "WSubId_84"
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
    $P2 = WSubId_68(__ARG_2, self)
    setattribute self, 'exprsize', $P2
    WSubId_84(']', __ARG_2)
    WSubId_84(';', __ARG_2)

.end # FixedVarStatement


.sub 'optimize' :method
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
    .tailcall self.'optimize_init'()

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    self.'annotate'(__ARG_1)
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
    getattribute $P3, self, 'name'
    $P2 = WSubId_45("var %0[] : %1", $P3, $S2)
    __ARG_1.'comment'($P2)
  __label_3: # endif
    $P1 = WSubId_45("    new %0, 'FixedPMCArray', %1", $S2, $S1)
    __ARG_1.'say'($P1)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_124 = "WSubId_124"
    $P1 = __ARG_2.'get'()
    WSubId_124($P1)
    $P2 = __ARG_2.'get'()
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P2 = __ARG_2.'get'()
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
    __ARG_2.'unget'($P2)
    new $P4, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
    goto __label_2
  __label_1: # else
    __ARG_2.'unget'($P2)
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
  __label_2: # endif

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_76 = "WSubId_76"
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
    WSubId_25("invalid volatile type", $P1)
  __label_1: # endif
    .tailcall WSubId_76(__ARG_1, __ARG_2, __ARG_3, 1)

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_125 = "WSubId_125"
.const 'Sub' WSubId_30 = "WSubId_30"
    self.'BlockStatement'(__ARG_1, __ARG_3)
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
    null $P1
  __label_2: # while
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
    __ARG_2.'unget'($P1)
    $P2 = WSubId_125(__ARG_2, self)
    unless_null $P2, __label_3
    WSubId_30('Unexpected null statement')
  __label_3: # endif
    getattribute $P3, self, 'statements'
    push $P3, $P2
    goto __label_2
  __label_1: # endwhile
    setattribute self, 'end', $P1

.end # CompoundStatement


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    getattribute $P8, self, 'start'
    $P1.'BlockStatement'($P8, __ARG_1)
    root_new $P9, ['parrot';'Hash']
    setattribute $P1, 'labels', $P9
    getattribute $P9, self, 'end'
    setattribute $P1, 'end', $P9
    getattribute $P2, self, 'statements'
    set $P3, __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P9 = WSubId_5("clone")
    $P6 = WSubId_3($P9, $P3)
    if_null $P4, __label_4
    iter $P11, $P4
    set $P11, 0
  __label_3: # for iteration
    unless $P11 goto __label_4
    shift $P7, $P11
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_3
  __label_4: # endfor
    set $P10, $P5
    goto __label_2
  __label_2:
    goto __label_1
  __label_1:
    set $P8, $P10
    setattribute $P1, 'statements', $P8
    .return($P1)

.end # clone


.sub 'getlabel' :method
        .param pmc __ARG_1
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
    getattribute $P1, self, 'labels'
    $S2 = $P1[$S1]
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
    .return($S2)

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    null $S1
    if_null __ARG_1, __label_1
    set $S1, __ARG_1
  __label_1:
    getattribute $P1, self, 'labels'
    $S2 = $P1[$S1]
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
    WSubId_25('Label already defined', __ARG_1)
  __label_2: # endif
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
    $P1[$S1] = $S3
    .return($S3)

.end # createlabel


.sub 'getend' :method
    getattribute $P1, self, 'end'
    .return($P1)

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
    $P2 = __ARG_1.'getDebug'()
    set $I1, $P2
    unless $I1 goto __label_1
    __ARG_1.'comment'('{')
  __label_1: # endif
    getattribute $P2, self, 'statements'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
    $P1.'emit'(__ARG_1)
    self.'freetemps'()
    goto __label_2
  __label_3: # endfor
    unless $I1 goto __label_4
    __ARG_1.'comment'('}')
  __label_4: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    addattribute $P0, 'end'
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
    box $P3, __ARG_1
    setattribute self, 'type', $P3
    box $P3, 1
    setattribute self, 'nreg', $P3
    new $P1, ['ResizableStringArray']
    new $P2, ['ResizableStringArray']
    setattribute self, 'tempreg', $P1
    setattribute self, 'freereg', $P2

.end # RegisterStore


.sub 'createreg' :method
    getattribute $P1, self, 'nreg'
    set $I1, $P1
    set $I2, $I1
    inc $I1
    set $S1, $I2
    assign $P1, $I1
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)

.end # createreg


.sub 'tempreg' :method
    getattribute $P1, self, 'freereg'
    getattribute $P2, self, 'tempreg'
    null $S1
    elements $I1, $P1
    unless $I1 goto __label_1
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
    push $P2, $S1
    .return($S1)

.end # tempreg


.sub 'freetemps' :method
    getattribute $P1, self, 'freereg'
    getattribute $P2, self, 'tempreg'
    elements $I1, $P2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
    $S1 = $P2[$I2]
    push $P1, $S1
  __label_1: # for iteration
    dec $I2
    goto __label_3
  __label_2: # for end
    assign $P2, 0

.end # freetemps

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    addattribute $P0, 'type'
    addattribute $P0, 'nreg'
    addattribute $P0, 'tempreg'
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'ModifierList'(__ARG_1, __ARG_2)

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
    null $P1
    null $P2
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
    if $S1 == 'named' goto __label_6
    if $S1 == 'slurpy' goto __label_7
    goto __label_4
  __label_6: # case
    set $P1, $P4
    goto __label_5 # break
  __label_7: # case
    set $P2, $P4
    goto __label_5 # break
  __label_4: # default
    __ARG_1.'print'(' :', $S1)
  __label_5: # switch end
    goto __label_1
  __label_2: # endfor
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
    null $S2
    $P7 = $P1.'numargs'()
    set $I2, $P7
    if $I2 == 0 goto __label_16
    if $I2 == 1 goto __label_17
    goto __label_14
  __label_16: # case
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_15 # break
  __label_17: # case
    $P5 = $P1.'getarg'(0)
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
    WSubId_25('Invalid modifier', __ARG_2)
  __label_18: # endif
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_15 # break
  __label_14: # default
    WSubId_25('Invalid modifier', __ARG_2)
  __label_15: # switch end
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end

.end # emitmodifiers

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_127 = "WSubId_127"
    setattribute self, 'func', __ARG_1
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_127($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    eq $S1, '', __label_2
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
    set $S1, 'P'
  __label_3: # endif
    box $P2, $S1
    setattribute self, 'type', $P2
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
    $P1 = __ARG_2.'get'()
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
    __ARG_2.'unget'($P1)
  __label_5: # endif

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_136 = "WSubId_136"
    getattribute $P1, self, 'func'
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
    $P2 = $P1.'getvar'($S1)
    $P5 = $P2.'gettype'()
    $P4 = WSubId_136($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
    getattribute $P3, self, 'modifiers'
    if_null $P3, __label_3
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
    __ARG_1.'say'('')

.end # emit


.sub 'get_type' :method
    getattribute $P1, self, 'type'
    .return($P1)

.end # get_type

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    addattribute $P0, 'func'
    addattribute $P0, 'name'
    addattribute $P0, 'modifiers'
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_137')
        .param pmc __ARG_1
        .param pmc __ARG_2
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'initbase'(__ARG_1, __ARG_2)
    setattribute self, 'name', __ARG_1

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    self.'annotate'(__ARG_1)
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
    .return($S1)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'emit_subid' :subid('WSubId_139')
        .param string __ARG_1
    concat $S1, ".const 'Sub' ", __ARG_1
    concat $S1, $S1, ' = "'
    concat $S1, $S1, __ARG_1
    concat $S1, $S1, "\"\n"
    .return($S1)

.end # emit_subid

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'ModifierList'(__ARG_1, __ARG_2)

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
    $P3 = $P1.'numargs'()
    set $I1, $P3
    __ARG_1.'print'(' :', $S1)
    le $I1, 0, __label_5
    __ARG_1.'print'('(')
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
    $P2 = $P1.'getarg'($I2)
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
    WSubId_25('Invalid modifier', $P2)
  __label_9: # endif
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
    __ARG_1.'print'(", ")
  __label_10: # endif
  __label_6: # for iteration
    inc $I2
    goto __label_8
  __label_7: # for end
    __ARG_1.'print'(')')
  __label_5: # endif
    goto __label_1
  __label_2: # endfor

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'multi_sig_from_multi_modifier' :subid('WSubId_138')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    $P5 = __ARG_2.'numargs'()
    set $I1, $P5
    null $P1
    unless $I1 goto __label_1
    root_new $P5, ['parrot';'ResizablePMCArray']
    set $P1, $P5
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
    $P2 = __ARG_2.'getarg'($I2)
    $P5 = $P2.'isstringliteral'()
    set $I3, $P5
    if $I3 goto __label_7
    $P6 = $P2.'isidentifier'()
    set $I3, $P6
    if $I3 goto __label_8
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
    $P7 = $P2.'get_value'()
    push $P1, $P7
    goto __label_5 # break
  __label_8: # case
    $P8 = $P2.'getName'()
    null $S1
    if_null $P8, __label_10
    set $S1, $P8
  __label_10:
    if $S1 == "int" goto __label_13
    if $S1 == "string" goto __label_14
    if $S1 == "float" goto __label_15
    if $S1 == "var" goto __label_16
    goto __label_11
  __label_13: # case
  __label_14: # case
    push $P1, $S1
    goto __label_12 # break
  __label_15: # case
    push $P1, "num"
    goto __label_12 # break
  __label_16: # case
    push $P1, "pmc"
    goto __label_12 # break
  __label_11: # default
    WSubId_25("unsupported multi signature", $P2)
  __label_12: # switch end
    goto __label_5 # break
  __label_9: # case
    $P3 = $P2.'get_class_raw_key'()
    unless_null $P3, __label_17
    WSubId_25("class not found", $P2)
  __label_17: # endif
    set $P4, $P3
    null $S2
    elements $I3, $P4
    unless $I3 goto __label_19
    join $S3, "'; '", $P4
    concat $S5, "[ '", $S3
    concat $S5, $S5, "' ]"
    set $S2, $S5
  __label_19: # endif
    set $S4, $S2
    goto __label_18
  __label_18:
    push $P1, $S4
    goto __label_5 # break
  __label_6: # default
    WSubId_25("unsupported multi signature", $P2)
  __label_5: # switch end
  __label_2: # for iteration
    inc $I2
    goto __label_4
  __label_3: # for end
  __label_1: # endif
    .return($P1)

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'BlockStatement'(__ARG_1, __ARG_2)
    box $P1, 0
    setattribute self, 'nlabel', $P1
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2

.end # FunctionBase


.sub 'getouter' :method
    .return(self)

.end # getouter


.sub 'allowtailcall' :method
    .return(1)

.end # allowtailcall


.sub 'makesubid' :method
    getattribute $P1, self, 'subid'
    unless_null $P1, __label_1
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
    .return($P1)

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
    getattribute $P1, self, 'usedsubids'
    unless_null $P1, __label_1
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
    $P1[__ARG_1] = 1

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
    issame $I1, self, __ARG_1
    .return($I1)

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_137 = "WSubId_137"
    $P1 = __ARG_1.'get'()
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
    __ARG_1.'unget'($P1)
    $P3 = WSubId_67(__ARG_1, self, WSubId_137, ')')
    setattribute self, 'params', $P3
  __label_1: # endif

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'localfun'
    unless_null $P1, __label_1
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
    push $P1, __ARG_1
  __label_2: # endif

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'usednamespaces'
    unless_null $P1, __label_1
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 1
    $P6[0] = __ARG_1
    setattribute self, 'usednamespaces', $P6
    goto __label_2
  __label_1: # else
    set $P2, $P1
    set $P3, __ARG_1
    if_null $P2, __label_6
    iter $P8, $P2
    set $P8, 0
  __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P4, $P8
    ne_addr $P4, $P3, __label_7
    set $P7, $P4
    goto __label_4
  __label_7: # endif
    goto __label_5
  __label_6: # endfor
    null $P7
    goto __label_4
  __label_4:
    set $P5, $P7
    if_null $P5, __label_3
    .return()
  __label_3: # endif
    push $P1, __ARG_1
  __label_2: # endif

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
    $P2 = $P1.'scopesearch'(__ARG_1, __ARG_2)
    if_null $P2, __label_3
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_138 = "WSubId_138"
.const 'Sub' WSubId_5 = "WSubId_5"
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
    $P2 = $P1.'pick'('multi')
    if_null $P2, __label_2
    self.'setmulti'()
    $P7 = WSubId_138(self, $P2)
    setattribute self, 'multi_sig', $P7
  __label_2: # endif
  __label_1: # endif
    getattribute $P3, self, 'usednamespaces'
    $P4 = WSubId_5("fixnamespaces")
    if_null $P3, __label_5
    iter $P8, $P3
    set $P8, 0
  __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P5, $P8
    $P4($P5)
    goto __label_4
  __label_5: # endfor
  __label_3:
    getattribute $P9, self, 'body'
    $P7 = $P9.'optimize'()
    setattribute self, 'body', $P7
    .return(self)

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'usedlexicals'
    unless_null $P1, __label_1
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
    $P1[__ARG_2] = __ARG_1

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'lexicals'
    unless_null $P1, __label_1
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
    $P1[__ARG_2] = __ARG_1

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
    $P1 = __ARG_1.'getlex'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
    goto __label_2
  __label_1: # else
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
    $P2 = self.'getlexnum'()
    set $I1, $P2
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
    self.'setlex'($S1, $S2)
    __ARG_1.'setlex'($S1)
  __label_2: # endif
    .return($S1)

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    null $P1
    if_null __ARG_1, __label_1
    length $I1, __ARG_1
    ne $I1, 1, __label_1
    ord $I1, __ARG_1
    if $I1 == 73 goto __label_3
    if $I1 == 78 goto __label_4
    if $I1 == 83 goto __label_5
    if $I1 == 80 goto __label_6
    goto __label_1
  __label_3: # case
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
    concat $S2, "Invalid type in createreg: ", __ARG_1
    WSubId_30($S2)
  __label_2: # switch end
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
    .return($S1)

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    null $P1
    if_null __ARG_1, __label_1
    length $I1, __ARG_1
    ne $I1, 1, __label_1
    ord $I1, __ARG_1
    if $I1 == 73 goto __label_3
    if $I1 == 78 goto __label_4
    if $I1 == 83 goto __label_5
    if $I1 == 80 goto __label_6
    goto __label_1
  __label_3: # case
    getattribute $P1, self, 'regstI'
    goto __label_2 # break
  __label_4: # case
    getattribute $P1, self, 'regstN'
    goto __label_2 # break
  __label_5: # case
    getattribute $P1, self, 'regstS'
    goto __label_2 # break
  __label_6: # case
    getattribute $P1, self, 'regstP'
    goto __label_2 # break
  __label_1: # default
    concat $S2, "Invalid type in tempreg: ", __ARG_1
    WSubId_30($S2)
  __label_2: # switch end
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
    .return($S1)

.end # tempreg


.sub 'freetemps' :method
.const 'Sub' WSubId_5 = "WSubId_5"
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 4
    getattribute $P4, self, 'regstI'
    $P1[0] = $P4
    getattribute $P5, self, 'regstN'
    $P1[1] = $P5
    getattribute $P6, self, 'regstS'
    $P1[2] = $P6
    getattribute $P7, self, 'regstP'
    $P1[3] = $P7
    $P2 = WSubId_5("freetemps")
    if_null $P1, __label_3
    iter $P8, $P1
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P3, $P8
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:

.end # freetemps


.sub 'genlabel' :method
    getattribute $P1, self, 'nlabel'
    inc $P1
    set $I1, $P1
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    WSubId_25('break not allowed here', __ARG_1)

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    WSubId_25('continue not allowed here', __ARG_1)

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_139 = "WSubId_139"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    getattribute $P19, self, 'name'
    null $S1
    if_null $P19, __label_1
    set $S1, $P19
  __label_1:
    __ARG_1.'say'()
    __ARG_1.'print'(".sub ")
    $P19 = self.'isanonymous'()
    if_null $P19, __label_2
    unless $P19 goto __label_2
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
    getattribute $P19, self, 'subid'
    if_null $P19, __label_4
    getattribute $P20, self, 'subid'
    __ARG_1.'print'(" :subid('", $P20, "')")
  __label_4: # endif
    getattribute $P1, self, 'outer'
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_6
    getattribute $P19, self, 'usedlexicals'
    isnull $I2, $P19
    not $I2
  __label_6:
    unless $I2 goto __label_5
    getattribute $P2, $P1, 'subid'
    if_null $P2, __label_7
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_7: # endif
  __label_5: # endif
    $P19 = self.'ismethod'()
    if_null $P19, __label_8
    unless $P19 goto __label_8
    __ARG_1.'print'(' :method')
  __label_8: # endif
    getattribute $P3, self, 'modifiers'
    if_null $P3, __label_9
    $P3.'emit'(__ARG_1)
    goto __label_10
  __label_9: # else
    ne $S1, 'main', __label_11
    __ARG_1.'print'(' :main')
  __label_11: # endif
  __label_10: # endif
    self.'emit_extra_modifiers'(__ARG_1)
    __ARG_1.'say'()
    set $P7, __ARG_1
    getattribute $P8, self, 'params'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P9, $P8
    $P19 = WSubId_5("emit")
    $P10 = WSubId_3($P19, $P7)
    if_null $P9, __label_15
    iter $P21, $P9
    set $P21, 0
  __label_14: # for iteration
    unless $P21 goto __label_15
    shift $P11, $P21
    $P10($P11)
    goto __label_14
  __label_15: # endfor
  __label_13:
  __label_12:
    getattribute $P4, self, 'lexicals'
    getattribute $P5, self, 'usedlexicals'
    isnull $I2, $P4
    not $I2
    if $I2 goto __label_17
    isnull $I2, $P5
    not $I2
  __label_17:
    unless $I2 goto __label_16
    getattribute $P19, self, 'start'
    __ARG_1.'annotate'($P19)
    if_null $P4, __label_19
    iter $P22, $P4
    set $P22, 0
  __label_18: # for iteration
    unless $P22 goto __label_19
    shift $S2, $P22
    $P20 = $P4[$S2]
    $P19 = WSubId_45(".lex '%0', %1", $P20, $S2)
    __ARG_1.'say'($P19)
    goto __label_18
  __label_19: # endfor
    if_null $P5, __label_21
    iter $P23, $P5
    set $P23, 0
  __label_20: # for iteration
    unless $P23 goto __label_21
    shift $S3, $P23
    substr $S4, $S3, 0, 1
    eq $S4, '$', __label_22
    concat $S5, "    .local pmc ", $S3
    __ARG_1.'say'($S5)
  __label_22: # endif
    $P19 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P19)
    goto __label_20
  __label_21: # endfor
  __label_16: # endif
    getattribute $P12, self, 'usedsubids'
    root_new $P13, ['parrot';'ResizablePMCArray']
    set $P14, WSubId_139
    if_null $P12, __label_25
    iter $P25, $P12
    set $P25, 0
  __label_24: # for iteration
    unless $P25 goto __label_25
    shift $P15, $P25
    $P19 = $P14($P15)
    push $P13, $P19
    goto __label_24
  __label_25: # endfor
    set $P24, $P13
    goto __label_23
  __label_23:
    set $P19, $P24
    join $S4, "", $P19
    __ARG_1.'print'($S4)
    $P19 = __ARG_1.'getDebug'()
    set $I1, $P19
    getattribute $P6, self, 'body'
    $P19 = $P6.'isempty'()
    if_null $P19, __label_26
    unless $P19 goto __label_26
    unless $I1 goto __label_28
    __ARG_1.'comment'('Empty body')
  __label_28: # endif
    goto __label_27
  __label_26: # else
    unless $I1 goto __label_29
    __ARG_1.'comment'('Body')
  __label_29: # endif
    $P6.'emit'(__ARG_1)
    $P19 = $P6.'getend'()
    __ARG_1.'annotate'($P19)
  __label_27: # endif
    __ARG_1.'say'("\n.end # ", $S1, "\n")
    getattribute $P16, self, 'localfun'
    $P19 = WSubId_5("emit")
    $P17 = WSubId_3($P19, __ARG_1)
    if_null $P16, __label_32
    iter $P26, $P16
    set $P26, 0
  __label_31: # for iteration
    unless $P26 goto __label_32
    shift $P18, $P26
    $P17($P18)
    goto __label_31
  __label_32: # endfor
  __label_30:

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
    addattribute $P0, 'subid'
    addattribute $P0, 'modifiers'
    addattribute $P0, 'params'
    addattribute $P0, 'body'
    addattribute $P0, 'regstI'
    addattribute $P0, 'regstN'
    addattribute $P0, 'regstS'
    addattribute $P0, 'regstP'
    addattribute $P0, 'nlabel'
    addattribute $P0, 'localfun'
    addattribute $P0, 'lexicals'
    addattribute $P0, 'usedlexicals'
    addattribute $P0, 'usedsubids'
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'FunctionBase'(__ARG_1, __ARG_3)
    box $P1, 0
    setattribute self, 'paramnum', $P1
    box $P1, 0
    setattribute self, 'lexnum', $P1
    self.'parse'(__ARG_2)
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2

.end # FunctionStatement


.sub 'isanonymous' :method
    .return(0)

.end # isanonymous


.sub 'getparamnum' :method
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)

.end # getparamnum


.sub 'getlexnum' :method
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)

.end # getlexnum


.sub 'ismethod' :method
    .return(0)

.end # ismethod


.sub 'ismulti' :method
    getattribute $P1, self, 'is_multi'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $I1, 1
    goto __label_1
  __label_2:
    null $I1
  __label_1:
    .return($I1)

.end # ismulti


.sub 'setmulti' :method
    getattribute $P1, self, 'is_multi'
    assign $P1, 1

.end # setmulti


.sub 'default_multi_sig' :subid('WSubId_13') :method
.const 'Sub' WSubId_14 = "WSubId_14"
    root_new $P1, ['parrot';'ResizablePMCArray']
    $P6 = self.'ismethod'()
    if_null $P6, __label_1
    unless $P6 goto __label_1
    push $P1, "_"
  __label_1: # endif
    getattribute $P2, self, 'params'
    set $P3, $P1
    set $P4, WSubId_14
    if_null $P2, __label_4
    iter $P7, $P2
    set $P7, 0
  __label_3: # for iteration
    unless $P7 goto __label_4
    shift $P5, $P7
    $P6 = $P4($P5)
    push $P3, $P6
    goto __label_3
  __label_4: # endfor
    goto __label_2
  __label_2:
    .return($P1)

.end # default_multi_sig


.sub '' :anon :subid('WSubId_14')
        .param pmc __ARG_1
.const 'Sub' WSubId_136 = "WSubId_136"
    $P1 = __ARG_1.'get_type'()
    .tailcall WSubId_136($P1)

.end # WSubId_14


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_26 = "WSubId_26"
    $P1 = __ARG_1.'get'()
    setattribute self, 'name', $P1
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    $P2 = __ARG_1.'get'()
  __label_1: # endif
    WSubId_28('(', $P2)
    self.'parse_parameters'(__ARG_1)
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
    $P4 = $P3.'fullname'()
    WSubId_140(self, '__FUNCTION__', $P4)
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
    WSubId_26('{', $P2)
  __label_2: # endif
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
    .return(self)

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
    getattribute $P1, self, 'multi_sig'
    unless_null $P1, __label_2
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
    join $S1, ", ", $P1
    __ARG_1.'print'(' :multi(', $S1, ')')
  __label_1: # endif

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
    addattribute $P0, 'paramnum'
    addattribute $P0, 'lexnum'
    addattribute $P0, 'is_multi'
    addattribute $P0, 'multi_sig'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_28 = "WSubId_28"
    self.'FunctionBase'(__ARG_1, __ARG_3)
    $P1 = __ARG_3.'getouter'()
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    unless $I1 goto __label_1
    $P4 = WSubId_25("local functions not allowed in inline", self)
    throw $P4
  __label_1: # endif
    $P1.'makesubid'()
    setattribute self, 'outer', $P1
    $P2 = self.'makesubid'()
    setattribute self, 'name', $P2
    self.'parse_parameters'(__ARG_2)
    $P3 = __ARG_2.'get'()
    WSubId_28('{', $P3)
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P3, __ARG_2, self)
    set $P5, $P6
    setattribute self, 'body', $P5
    __ARG_3.'addlocalfunction'(self)

.end # LocalFunctionStatement


.sub 'isanonymous' :method
    .return(1)

.end # isanonymous


.sub 'ismethod' :method
    .return(0)

.end # ismethod


.sub 'needclosure' :method
.const 'Sub' WSubId_5 = "WSubId_5"
    getattribute $P4, self, 'lexicals'
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_2
    getattribute $P5, self, 'usedlexicals'
    isnull $I1, $P5
    not $I1
  __label_2:
    unless $I1 goto __label_1
    .return(1)
  __label_1: # endif
    getattribute $P1, self, 'localfun'
    $P2 = WSubId_5("needclosure")
    if_null $P1, __label_5
    iter $P7, $P1
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P3, $P7
    $P4 = $P2($P3)
    if_null $P4, __label_6
    unless $P4 goto __label_6
    set $P6, $P3
    goto __label_3
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P6
    goto __label_3
  __label_3:
    set $P4, $P6
    isnull $I1, $P4
    not $I1
    .return($I1)

.end # needclosure


.sub 'getsubid' :method
    getattribute $P1, self, 'subid'
    .return($P1)

.end # getsubid


.sub 'getparamnum' :method
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()

.end # getparamnum


.sub 'getlexnum' :method
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
    .return(__ARG_2)
  __label_1: # endif
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
    self.'usesubid'($S1)
    .return(__ARG_2)
  __label_3: # endif
    $P1 = __ARG_2.'getscope'()
    $P2 = $P1.'getouter'()
    getattribute $P3, self, 'outer'
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
    eq $S3, 'P', __label_8
    bor $I1, $I1, 1
  __label_8: # endif
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
    .return($P4)
  __label_5: # endif
  __label_4: # endif
    .return(__ARG_2)

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_30 = "WSubId_30"
    $P1 = self.'getlocalvar'(__ARG_1)
    unless_null $P1, __label_1
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
    unless_null $P1, __label_2
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
    unless_null $P1, __label_3
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
    getattribute $P2, self, 'outer'
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
    $P1 = self.'createvar'(__ARG_1, 'P')
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
    self.'setusedlex'($S1, $S2)
  __label_6: # endif
  __label_5: # endif
    goto __label_4
  __label_3: # else
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
  __label_2: # endif
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
    WSubId_30('Incorrect data for variable in LocalFunction')
  __label_9: # endif
    .return($P1)

.end # getvar

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)

.end # MethodStatement


.sub 'ismethod' :method
    .return(1)

.end # ismethod

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineParam' ]

.sub 'InlineParam' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_127 = "WSubId_127"
    null $I1
    $P1 = __ARG_1.'get'()
    self.'initbase'($P1, __ARG_2)
    $P3 = $P1.'getidentifier'()
    set $S2, $P3
    ne $S2, "const", __label_1
    bor $I1, $I1, 1
    $P1 = __ARG_1.'get'()
  __label_1: # endif
    null $S1
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(",")
    if $P3 goto __label_4
    $P3 = $P2.'isop'(")")
  __label_4:
    if_null $P3, __label_2
    unless $P3 goto __label_2
    set $S1, '?'
    __ARG_1.'unget'($P2)
    goto __label_3
  __label_2: # else
    $P4 = $P1.'getidentifier'()
    $P3 = WSubId_127($P4)
    set $S1, $P3
    set $P1, $P2
  __label_3: # endif
    box $P3, $I1
    setattribute self, 'flags', $P3
    box $P3, $S1
    setattribute self, 'type', $P3
    setattribute self, 'name', $P1

.end # InlineParam


.sub 'isconst' :method
    getattribute $P1, self, 'flags'
    set $I2, $P1
    band $I1, $I2, 1
    .return($I1)

.end # isconst


.sub 'getname' :method
    getattribute $P1, self, 'name'
    .return($P1)

.end # getname


.sub 'gettype' :method
    getattribute $P1, self, 'type'
    .return($P1)

.end # gettype

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineParam' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
    addattribute $P0, 'flags'
    addattribute $P0, 'type'
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineStatement' ]

.sub 'InlineStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_127 = "WSubId_127"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_125 = "WSubId_125"
    self.'BlockStatement'(__ARG_1, __ARG_3)
    $P1 = __ARG_2.'get'()
    WSubId_84("(", __ARG_2)
    $P2 = __ARG_2.'get'()
    null $P3
    $P6 = $P2.'isop'(")")
    isfalse $I1, $P6
    unless $I1 goto __label_1
    __ARG_2.'unget'($P2)
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P3, $P6
  __label_2: # do
    new $P6, [ 'Winxed'; 'Compiler'; 'InlineParam' ]
    $P6.'InlineParam'(__ARG_2, self)
    set $P4, $P6
    $P3.'push'($P4)
  __label_4: # continue
    $P2 = __ARG_2.'get'()
    $P6 = $P2.'isop'(",")
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
    WSubId_28(")", $P2)
  __label_1: # endif
    $P2 = __ARG_2.'get'()
    null $S1
    $P6 = $P2.'iskeyword'('return')
    if_null $P6, __label_5
    unless $P6 goto __label_5
    $P2 = __ARG_2.'get'()
    $P6 = $P2.'getidentifier'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
    $P6 = WSubId_127($S2)
    set $S1, $P6
    ne $S1, '', __label_8
    WSubId_25("Invalid return type", $P2)
  __label_8: # endif
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # else
    set $S1, 'v'
  __label_6: # endif
    WSubId_28("{", $P2)
    __ARG_2.'unget'($P2)
    $P5 = WSubId_125(__ARG_2, self)
    setattribute self, 'name', $P1
    box $P6, $S1
    setattribute self, 'rettype', $P6
    setattribute self, 'params', $P3
    setattribute self, 'body', $P5

.end # InlineStatement


.sub 'getouter' :method
    .return(self)

.end # getouter


.sub 'createreg' :method
        .param string __ARG_1
    .return("FAKEREG")

.end # createreg

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
    addattribute $P0, 'name'
    addattribute $P0, 'rettype'
    addattribute $P0, 'body'
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]

.sub 'InlinedBlock' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P7, __ARG_2, 'start'
    self.'BlockStatement'($P7, __ARG_1)
    setattribute self, 'inliner', __ARG_2
    setattribute self, 'inlined', __ARG_1
    getattribute $P1, __ARG_1, 'params'
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    elements $I1, $P1
  __label_1:
    unless_null __ARG_3, __label_4
    null $I2
    goto __label_3
  __label_4:
    $P7 = __ARG_3.'numargs'()
    set $I2, $P7
  __label_3:
    eq $I1, $I2, __label_5
    WSubId_25("Wrong arguments in inline expansion", __ARG_2)
  __label_5: # endif
    null $I3
  __label_8: # for condition
    ge $I3, $I1, __label_7
    $P2 = $P1[$I3]
    $P3 = $P2.'getname'()
    $P4 = __ARG_3.'getfreearg'($I3)
    $P7 = $P2.'gettype'()
    null $S1
    if_null $P7, __label_9
    set $S1, $P7
  __label_9:
    ne $S1, '?', __label_10
    $P7 = $P4.'checkresult'()
    set $S1, $P7
  __label_10: # endif
    $P7 = $P2.'isconst'()
    set $I4, $P7
    box $P7, $I4
    unless $P7 goto __label_13
    $P7 = $P4.'hascompilevalue'()
  __label_13:
    if_null $P7, __label_11
    unless $P7 goto __label_11
    $P5 = self.'createconst'($P3, $S1)
    $P5.'setvalue'($P4)
    goto __label_12
  __label_11: # else
    self.'createvar'($P3, $S1, 0)
  __label_12: # endif
  __label_6: # for iteration
    inc $I3
    goto __label_8
  __label_7: # for end
    setattribute self, 'params', $P1
    setattribute self, 'args', __ARG_3
    getattribute $P6, __ARG_1, 'body'
    $P6 = $P6.'clone'(self)
    $P6 = $P6.'optimize'()
    setattribute self, 'body', $P6

.end # InlinedBlock


.sub 'getouter' :method
    .return(self)

.end # getouter


.sub 'createreg' :method
        .param string __ARG_1
    getattribute $P2, self, 'inliner'
    getattribute $P1, $P2, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
    getattribute $P1, self, 'inliner'
    .tailcall $P1.'tempreg'(__ARG_1)

.end # tempreg


.sub 'freetemps' :method
    getattribute $P2, self, 'inliner'
    getattribute $P1, $P2, 'owner'
    $P1.'freetemps'()

.end # freetemps


.sub 'usesubid' :method
        .param string __ARG_1
    getattribute $P1, self, 'usedsubids'
    unless_null $P1, __label_1
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
    $P1[__ARG_1] = 1

.end # usesubid


.sub 'genlabel' :method
    getattribute $P1, self, 'inliner'
    .tailcall $P1.'genlabel'()

.end # genlabel


.sub 'getendlabel' :method
    getattribute $P1, self, 'endlabel'
    .return($P1)

.end # getendlabel


.sub 'getrettype' :method
    getattribute $P2, self, 'inlined'
    getattribute $P1, $P2, 'rettype'
    .return($P1)

.end # getrettype


.sub 'checkresult' :method
    getattribute $P2, self, 'inlined'
    getattribute $P1, $P2, 'rettype'
    .return($P1)

.end # checkresult


.sub 'getretreg' :method
    getattribute $P1, self, 'retreg'
    .return($P1)

.end # getretreg


.sub 'emit_it' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_139 = "WSubId_139"
    $P9 = __ARG_1.'getDebug'()
    if_null $P9, __label_1
    unless $P9 goto __label_1
    __ARG_1.'comment'("inlined start")
  __label_1: # endif
    $P10 = self.'genlabel'()
    setattribute self, 'endlabel', $P10
    getattribute $P1, self, 'params'
    getattribute $P2, self, 'args'
    unless_null $P1, __label_3
    null $I1
    goto __label_2
  __label_3:
    elements $I1, $P1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P4 = $P2.'getfreearg'($I2)
    $P9 = $P3.'isconst'()
    unless $P9 goto __label_8
    $P9 = $P4.'hascompilevalue'()
  __label_8:
    if_null $P9, __label_7
    unless $P9 goto __label_7
    goto __label_4 # continue
  __label_7: # endif
    $P9 = $P3.'gettype'()
    null $S1
    if_null $P9, __label_9
    set $S1, $P9
  __label_9:
    $P9 = $P4.'checkresult'()
    null $S2
    if_null $P9, __label_10
    set $S2, $P9
  __label_10:
    $P11 = $P3.'getname'()
    $P10 = self.'getvar'($P11)
    $P9 = $P10.'getreg'()
    null $S3
    if_null $P9, __label_11
    set $S3, $P9
  __label_11:
    iseq $I3, $S1, '?'
    if $I3 goto __label_14
    iseq $I3, $S2, $S1
  __label_14:
    unless $I3 goto __label_12
    $P4.'emit_init'(__ARG_1, $S3)
    goto __label_13
  __label_12: # else
    $P9 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
    ne $S1, 'P', __label_16
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_17
  __label_16: # else
    __ARG_1.'emitset'($S3, $S4)
  __label_17: # endif
  __label_13: # endif
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
    getattribute $P5, self, 'usedsubids'
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P7, WSubId_139
    if_null $P5, __label_20
    iter $P13, $P5
    set $P13, 0
  __label_19: # for iteration
    unless $P13 goto __label_20
    shift $P8, $P13
    $P9 = $P7($P8)
    push $P6, $P9
    goto __label_19
  __label_20: # endfor
    set $P12, $P6
    goto __label_18
  __label_18:
    set $P9, $P12
    join $S5, "", $P9
    __ARG_1.'print'($S5)
    getattribute $P9, self, 'body'
    $P9.'emit'(__ARG_1)
    getattribute $P9, self, 'endlabel'
    __ARG_1.'emitlabel'($P9)

.end # emit_it


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    $P1 = self.'getrettype'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    box $P1, __ARG_2
    setattribute self, 'retreg', $P1
    $P1 = __ARG_1.'getDebug'()
    set $I1, $P1
    self.'emit_it'(__ARG_1)
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_2
    unless $P1 goto __label_2
    __ARG_1.'comment'("inlined end")
  __label_2: # endif

.end # emit


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'emit_it'(__ARG_1)
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
    __ARG_1.'comment'("inlined end")
  __label_1: # endif

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    ne $S1, 'v', __label_2
    WSubId_25("Cannot get a result from a void inline", self)
  __label_2: # endif
    $P2 = self.'createreg'($S1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
    box $P2, $S2
    setattribute self, 'retreg', $P2
    self.'emit_it'(__ARG_1)
    ne $S1, 'P', __label_4
    $P1 = self.'tempreg'('P')
    __ARG_1.'emitset'($P1, $S2)
    set $S2, $P1
  __label_4: # endif
    $P2 = __ARG_1.'getDebug'()
    if_null $P2, __label_5
    unless $P2 goto __label_5
    __ARG_1.'comment'("inlined end")
  __label_5: # endif
    .return($S2)

.end # emit_get

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
    addattribute $P0, 'inliner'
    addattribute $P0, 'inlined'
    addattribute $P0, 'usedsubids'
    addattribute $P0, 'params'
    addattribute $P0, 'args'
    addattribute $P0, 'body'
    addattribute $P0, 'endlabel'
    addattribute $P0, 'retreg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'InlineRef' ]

.sub 'InlineRef' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'Expr'(__ARG_2, __ARG_1)
    setattribute self, 'inlined', __ARG_3

.end # InlineRef


.sub 'checkresult' :method
    .return('v')

.end # checkresult


.sub 'misused' :method
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'start'
    WSubId_25("inline used by reference", $P1)

.end # misused


.sub 'emit_void' :method
        .param pmc __ARG_1
    self.'misused'()

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
    self.'misused'()

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    self.'misused'()

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'InlineRef' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'inlined'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]

.sub 'CallInlineExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    getattribute $P1, __ARG_2, 'start'
    self.'Expr'($P1, __ARG_1)
    new $P3, [ 'Winxed'; 'Compiler'; 'InlinedBlock' ]
    getattribute $P4, __ARG_2, 'inlined'
    $P3.'InlinedBlock'($P4, __ARG_1, __ARG_3)
    set $P2, $P3
    setattribute self, 'block', $P2

.end # CallInlineExpr


.sub 'checkresult' :method
    getattribute $P1, self, 'block'
    .tailcall $P1.'checkresult'()

.end # checkresult


.sub 'emit_void' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'block'
    $P1.'emit_void'(__ARG_1)

.end # emit_void


.sub 'emit_get' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'block'
    .tailcall $P1.'emit_get'(__ARG_1)

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param string __ARG_2
    getattribute $P1, self, 'block'
    $P1.'emit'(__ARG_1, __ARG_2)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallInlineExpr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FinalExpr' ]
    addparent $P0, $P1
    addattribute $P0, 'block'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_27 = "WSubId_27"
.const 'Sub' WSubId_127 = "WSubId_127"
    $P1 = __ARG_1.'get'()
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
    WSubId_27($P1)
  __label_1: # endif
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_127($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
    set $P1, $P2
    __ARG_2.'createvar'($P1, $S1)
    $P2 = __ARG_1.'get'()
  __label_2: # endif
    setattribute self, 'name', $P1
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
    __ARG_1.'unget'($P2)
  __label_5: # endif

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
    getattribute $P2, self, 'name'
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
  __label_1: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    addattribute $P0, 'name'
    addattribute $P0, 'modifiers'
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_141')
        .param pmc __ARG_1
        .param pmc __ARG_2
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_141 = "WSubId_141"
    $P2 = WSubId_67(__ARG_1, __ARG_2, WSubId_141, ')')
    setattribute self, 'params', $P2

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
    __ARG_1.'print'('(')
    set $S1, ''
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
    __ARG_1.'print'($S1)
    $P1.'emit'(__ARG_1)
    set $S1, ', '
    goto __label_1
  __label_2: # endfor
    __ARG_1.'print'(')')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
    self.'Statement'(__ARG_1, __ARG_2)
    setattribute self, 'params', __ARG_3
    setattribute self, 'expr', __ARG_4

.end # MultiAssignStatement


.sub 'optimize' :method
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'expr'
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
    WSubId_25('multi assignment used with non function call', $P1)
  __label_1: # endif
    $P2 = $P1.'emitcall'(__ARG_1)
    $P1.'prepareargs'(__ARG_1)
    __ARG_1.'print'('    ')
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
    __ARG_1.'print'(' = ', $P2)
    $P1.'emitargs'(__ARG_1)
    __ARG_1.'say'()

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
    addattribute $P0, 'params'
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'initbase'(__ARG_2, __ARG_1)

.end # ClassSpecifier


.sub 'reftype' :method
    .return(0)

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)

.end # annotate

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'name', __ARG_2

.end # ClassSpecifierStr


.sub 'reftype' :method
    .return(1)

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    __ARG_1.'print'($S1)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_28 = "WSubId_28"
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
    root_new $P1, ['parrot';'ResizablePMCArray']
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
    WSubId_70('literal string', $P2)
  __label_1: # endif
    $P3 = $P2.'rawstring'()
    push $P1, $P3
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
    $P4 = $P2.'checkop'()
    set $S1, $P4
    if_null $S1, __label_3
    length $I2, $S1
    ne $I2, 1, __label_3
    ord $I2, $S1
    if $I2 == 58 goto __label_5
    if $I2 == 44 goto __label_6
    goto __label_3
  __label_5: # case
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_4 # break
  __label_3: # default
    WSubId_71('token in class key', $P2)
  __label_4: # switch end
  __label_7: # do
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
    WSubId_70('literal string', $P2)
  __label_10: # endif
    $P3 = $P2.'rawstring'()
    push $P1, $P3
  __label_9: # continue
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
    WSubId_28(']', $P2)
  __label_2: # endif
    setattribute self, 'key', $P1

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
    .return(2)

.end # reftype


.sub 'hasHLL' :method
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)

.end # hasHLL


.sub 'checknskey' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    getattribute $P1, self, 'key'
    null $S1
    elements $I1, $P1
    unless $I1 goto __label_2
    join $S3, "'; '", $P1
    concat $S4, "[ '", $S3
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_2: # endif
    set $S2, $S1
    goto __label_1
  __label_1:
    __ARG_1.'print'($S2)

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
    addattribute $P0, 'key'
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
    set $S1, __ARG_3
    $P1[0] = $S1
    null $P2
  __label_2: # while
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P2 = __ARG_1.'get'()
    set $S1, $P2
    push $P1, $S1
    goto __label_2
  __label_1: # endwhile
    __ARG_1.'unget'($P2)
    setattribute self, 'key', $P1

.end # ClassSpecifierId


.sub 'clone' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    getattribute $P2, self, 'start'
    $P1.'ClassSpecifier'(__ARG_1, $P2)
    getattribute $P3, self, 'key'
    setattribute $P1, 'key', $P3
    .return($P1)

.end # clone


.sub 'reftype' :method
    .return(3)

.end # reftype


.sub 'last' :method
    getattribute $P1, self, 'key'
    $P2 = $P1[-1]
    .return($P2)

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_99 = "WSubId_99"
    getattribute $P3, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P3, 2)
    unless_null $P1, __label_1
    getattribute $P3, self, 'key'
    join $S2, ".", $P3
    getattribute $P4, self, 'start'
    WSubId_99(__ARG_1, $S2, $P4)
    getattribute $P2, self, 'key'
    null $S1
    elements $I1, $P2
    unless $I1 goto __label_4
    join $S2, "'; '", $P2
    concat $S4, "[ '", $S2
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_4: # endif
    set $S3, $S1
    goto __label_3
  __label_3:
    __ARG_1.'print'($S3)
    goto __label_2
  __label_1: # else
    $P3 = $P1.'getclasskey'()
    __ARG_1.'print'($P3)
  __label_2: # endif

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_99 = "WSubId_99"
    $P1 = self.'checknskey'(__ARG_2)
    unless_null $P1, __label_1
    getattribute $P3, self, 'key'
    join $S2, ".", $P3
    getattribute $P4, self, 'start'
    WSubId_99(__ARG_1, $S2, $P4)
    getattribute $P2, self, 'key'
    null $S1
    elements $I1, $P2
    unless $I1 goto __label_4
    join $S2, "'; '", $P2
    concat $S4, "[ '", $S2
    concat $S4, $S4, "' ]"
    set $S1, $S4
  __label_4: # endif
    set $S3, $S1
    goto __label_3
  __label_3:
    __ARG_1.'say'("new ", __ARG_3, ", ", $S3)
    goto __label_2
  __label_1: # else
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
  __label_2: # endif

.end # emit_new

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'initbase'(__ARG_1, __ARG_3)
    setattribute self, 'name', __ARG_2
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
    setattribute self, 'classns', $P1

.end # ClassBase


.sub 'getpath' :method
    getattribute $P1, self, 'classns'
    .return($P1)

.end # getpath


.sub 'getclasskey' :method
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()

.end # getclasskey

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
    addattribute $P0, 'name'
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]

.sub 'FunctionContainer' :method
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions', $P2

.end # FunctionContainer


.sub 'addfunction' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'functions'
    getattribute $P3, __ARG_1, 'name'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
    $P2 = $P1[$S1]
    unless_null $P2, __label_2
    $P1[$S1] = __ARG_1
    goto __label_3
  __label_2: # else
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_4
    $P2.'setmulti'()
  __label_4: # endif
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_5
    __ARG_1.'setmulti'()
  __label_5: # endif
  __label_3: # endif

.end # addfunction


.sub 'find' :method
        .param string __ARG_1
    getattribute $P1, self, 'functions'
    $P2 = $P1[__ARG_1]
    .return($P2)

.end # find

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    addattribute $P0, 'functions'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_28 = "WSubId_28"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_71 = "WSubId_71"
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
    self.'VarContainer'()
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P8.'FunctionContainer'()
    set $P8, $P8
    setattribute self, 'funcont', $P8
    setattribute self, 'parent', __ARG_3
    root_new $P1, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P1
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'members', $P2
    $P3 = __ARG_4.'get'()
    $P7 = $P3.'isop'(':')
    if_null $P7, __label_1
    unless $P7 goto __label_1
    $P9 = WSubId_67(__ARG_4, self, WSubId_92)
    setattribute self, 'bases', $P9
    $P3 = __ARG_4.'get'()
  __label_1: # endif
    WSubId_28('{', $P3)
    getattribute $P8, self, 'classns'
    $P7 = $P8.'fullname'()
    WSubId_140(self, '__CLASS__', $P7)
    $P3 = __ARG_4.'get'()
  __label_4: # for condition
    $P7 = $P3.'isop'('}')
    isfalse $I1, $P7
    unless $I1 goto __label_3
    $P8 = $P3.'checkkeyword'()
    set $S1, $P8
    if $S1 == 'function' goto __label_7
    if $S1 == 'var' goto __label_8
    if $S1 == 'const' goto __label_9
    goto __label_5
  __label_7: # case
    new $P9, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P9.'MethodStatement'($P3, __ARG_4, self)
    set $P4, $P9
    self.'addmethod'($P4)
    push $P1, $P4
    goto __label_6 # break
  __label_8: # case
    $P5 = __ARG_4.'get'()
    $P10 = $P5.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
    WSubId_70("member identifier", $P5)
  __label_10: # endif
    push $P2, $P5
    $P3 = __ARG_4.'get'()
    $P11 = $P3.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
    WSubId_70("';' in member declaration", $P3)
  __label_11: # endif
    goto __label_6 # break
  __label_9: # case
    $P6 = WSubId_74($P3, __ARG_4, self)
    push $P1, $P6
    goto __label_6 # break
  __label_5: # default
    WSubId_71("item in class", $P3)
  __label_6: # switch end
  __label_2: # for iteration
    $P3 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end

.end # ClassStatement


.sub 'addmethod' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)

.end # addmethod


.sub 'generatesubid' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)

.end # use_builtin


.sub 'optimize' :method
    getattribute $P1, self, 'items'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    getattribute $P8, self, 'classns'
    $P8.'emitnamespace'(__ARG_1)
    set $P3, __ARG_1
    getattribute $P4, self, 'items'
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P5, $P4
    $P8 = WSubId_5("emit")
    $P6 = WSubId_3($P8, $P3)
    if_null $P5, __label_4
    iter $P9, $P5
    set $P9, 0
  __label_3: # for iteration
    unless $P9 goto __label_4
    shift $P7, $P9
    $P6($P7)
    goto __label_3
  __label_4: # endfor
  __label_2:
  __label_1:
    __ARG_1.'say'('.sub Winxed_class_init :anon :tag("load") :tag("init")')
    $P8 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P8)
    set $I1, 1
    getattribute $P8, self, 'bases'
    if_null $P8, __label_6
    iter $P10, $P8
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P1, $P10
    $P1.'annotate'(__ARG_1)
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
    getattribute $P8, self, 'parent'
    $P1.'emit'(__ARG_1, $P8)
    __ARG_1.'say'()
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
    goto __label_5
  __label_6: # endfor
    getattribute $P8, self, 'members'
    if_null $P8, __label_8
    iter $P11, $P8
    set $P11, 0
  __label_7: # for iteration
    unless $P11 goto __label_8
    shift $P2, $P11
    __ARG_1.'annotate'($P2)
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
    goto __label_7
  __label_8: # endfor
    __ARG_1.'say'('.end')

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
    addattribute $P0, 'parent'
    addattribute $P0, 'bases'
    addattribute $P0, 'constants'
    addattribute $P0, 'items'
    addattribute $P0, 'members'
    addattribute $P0, 'funcont'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)

.end # DeclareClassStatement


.sub 'optimize' :method
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_143')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
    $P1 = __ARG_2.'get'()
    $P2 = __ARG_2.'get'()
    root_new $P3, ['parrot';'ResizablePMCArray']
    null $P4
  __label_3: # for condition
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
    $P3.'push'($P1)
    $P1 = __ARG_2.'get'()
  __label_1: # for iteration
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
    goto __label_5
  __label_4: # else
    __ARG_2.'unget'($P2)
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
  __label_5: # endif

.end # parseClass


.sub 'open_include' :subid('WSubId_142')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_25 = "WSubId_25"
    getinterp $P1
    $P2 = $P1[9]
    $P3 = $P2[0]
    null $P4
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
    concat $S2, $S1, __ARG_1
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
    pop_eh
    goto __label_4
  __label_3:
    .get_results($P7)
    finalize $P7
    pop_eh
  __label_4:
    goto __label_1
  __label_2: # endfor
    isnull $I1, $P4
    box $P6, $I1
    if $P6 goto __label_8
    $P6 = $P4.'is_closed'()
  __label_8:
    if_null $P6, __label_7
    unless $P6 goto __label_7
    WSubId_25('File not found', __ARG_2)
  __label_7: # endif
    $P4.'encoding'("utf8")
    .return($P4)

.end # open_include


.sub 'include_parrot' :subid('WSubId_145')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_142 = "WSubId_142"
.const 'Sub' WSubId_44 = "WSubId_44"
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
    WSubId_70('literal string', $P1)
  __label_1: # endif
    WSubId_84(';', __ARG_2)
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
    $P2 = WSubId_142($S1, __ARG_1)
    $P4 = $P2.'readline'()
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
  __label_5: # for condition
    $P5 = $P2.'eof'()
    isfalse $I4, $P5
    unless $I4 goto __label_4
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
    set $I1, 12
    null $S3
  __label_9: # while
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
    inc $I1
    goto __label_9
  __label_8: # endwhile
    set $I2, $I1
  __label_12: # while
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
    inc $I2
    goto __label_12
  __label_11: # endwhile
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
    sub $I4, $I2, $I1
    substr $S4, $S2, $I1, $I4
  __label_19: # while
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
    inc $I2
    goto __label_19
  __label_18: # endwhile
    set $I1, $I2
  __label_22: # while
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
    inc $I2
    goto __label_22
  __label_21: # endwhile
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
    sub $I4, $I2, $I1
    substr $S5, $S2, $I1, $I4
    null $I3
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
    set $I3, $S5
  __label_29: # endif
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
    $P4 = WSubId_44(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
  __label_7: # endif
  __label_3: # for iteration
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
    $P2.'close'()

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_146')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_142 = "WSubId_142"
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
    WSubId_25("Must be used at root namespace level", __ARG_1)
  __label_1: # endif
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
    WSubId_70('literal string', $P1)
  __label_2: # endif
    WSubId_84(';', __ARG_2)
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
    $P2 = WSubId_142($S1, __ARG_1)
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P2, $S1, 0)
    set $P3, $P4
    __ARG_3.'parse'($P3)
    $P2.'close'()

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_144')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_70 = "WSubId_70"
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
    WSubId_88(__ARG_1, __ARG_2, __ARG_3)
    WSubId_84(';', __ARG_2)
    .return()
  __label_1: # endif
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
    __ARG_2.'unget'($P1)
    $P2 = WSubId_85(__ARG_2)
    elements $I1, $P2
    ge $I1, 1, __label_3
    WSubId_25('Unsupported at namespace level', $P1)
  __label_3: # endif
    WSubId_84(';', __ARG_2)
    __ARG_3.'use'($P2)
    .return()
  __label_2: # endif
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isstring'()
    set $I2, $P5
    if $I2 goto __label_6
    $P6 = $P1.'isidentifier'()
    set $I2, $P6
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
    __ARG_2.'warn'("using extern 'file'; is deprecated, use $loadlib instead.", $P1)
    null $S1
    if_null $P1, __label_8
    set $S1, $P1
  __label_8:
    __ARG_3.'addlib'($S1)
    WSubId_84(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
    __ARG_2.'unget'($P1)
    $P3 = WSubId_85(__ARG_2)
    $P1 = __ARG_2.'get'()
    $P7 = $P1.'isop'(';')
    isfalse $I3, $P7
    unless $I3 goto __label_9
    __ARG_2.'unget'($P1)
    null $P5
    $P4 = WSubId_67(__ARG_2, $P5, WSubId_87, ';')
    __ARG_3.'addextern'($P3, $P4)
  __label_9: # endif
    join $S3, '/', $P3
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
    WSubId_70('string literal or identifier', $P1)
  __label_4: # switch end

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    setattribute self, 'module', __ARG_1
    setattribute self, 'names', __ARG_2

.end # External


.sub 'emit' :subid('WSubId_15') :method
        .param pmc __ARG_1
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_16 = "WSubId_16"
    __ARG_1.'say'(".sub 'importextern' :anon :tag('load') :tag('init')\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
    getattribute $P4, self, 'module'
    join $S1, "'; '", $P4
    concat $S2, "['parrot'; '", $S1
    concat $S2, $S2, "']"
    __ARG_1.'emitget_root_namespace'("srcns", $S2)
    getattribute $P1, self, 'names'
    newclosure $P2, WSubId_16
    if_null $P1, __label_3
    iter $P5, $P1
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
    $P2($P3)
    goto __label_2
  __label_3: # endfor
  __label_1:
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")

.end # emit


.sub '' :anon :subid('WSubId_16') :outer('WSubId_15')
        .param string __ARG_2
    find_lex $P1, '__WLEX_1'
    $P1.'say'("    push symbols, '", __ARG_2, "'")

.end # WSubId_16

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
    addattribute $P0, 'module'
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
    new $P1, ['ResizableStringArray']
    unless __ARG_2 goto __label_1
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
    if_null __ARG_1, __label_3
    push $P1, __ARG_1
  __label_3: # endif
  __label_2: # endif
    setattribute self, 'path', $P1

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
    getattribute $P3, self, 'path'
    clone $P2, $P3
    push $P2, __ARG_1
    setattribute $P1, 'path', $P2
    .return($P1)

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
    $P1 = __ARG_1.'getpath'()
    getattribute $P2, self, 'hll'
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
    unless_null $P2, __label_3
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif

.end # samehllas


.sub 'fullname' :method
    getattribute $P1, self, 'path'
    join $S1, '.', $P1
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
    .return($S1)
  __label_2: # endif

.end # fullname


.sub 'getparrotkey' :method
    getattribute $P1, self, 'path'
    null $S1
    elements $I1, $P1
    unless $I1 goto __label_1
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
    .return($S1)

.end # getparrotkey


.sub 'getparrotrootkey' :method
    getattribute $P1, self, 'path'
    getattribute $P2, self, 'hll'
    set $S1, "[ '"
    if_null $P2, __label_1
    set $S3, $P2
    downcase $S2, $S3
    concat $S1, $S1, $S2
    goto __label_2
  __label_1: # else
    concat $S1, $S1, "parrot"
  __label_2: # endif
    concat $S1, $S1, "'"
    elements $I1, $P1
    unless $I1 goto __label_3
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
    concat $S1, $S1, " ]"
    .return($S1)

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'path'
    __ARG_1.'print'(".namespace [ ")
    elements $I1, $P1
    unless $I1 goto __label_1
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
    __ARG_1.'say'("]")

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_45 = "WSubId_45"
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
    $P3 = self.'getparrotkey'()
    $P2 = WSubId_45("    new %0, %1", __ARG_3, $P3)
    __ARG_1.'print'($P2)
    goto __label_2
  __label_1: # else
    $P5 = self.'getparrotrootkey'()
    $P4 = WSubId_45("    root_new %0, %1", __ARG_3, $P5)
    __ARG_1.'print'($P4)
  __label_2: # endif
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
    __ARG_1.'say'()

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
    $P5 = self.'getparrotkey'()
    $P4 = WSubId_45("    get_class %0, %1", __ARG_3, $P5)
    __ARG_1.'say'($P4)
    goto __label_2
  __label_1: # else
    getattribute $P1, self, 'hll'
    getattribute $P3, self, 'path'
    clone $P2, $P3
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
    if_null $P1, __label_5
    set $S3, $P1
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
    elements $I1, $P2
    unless $I1 goto __label_6
    join $S3, "'; '", $P2
    $P3 = WSubId_45("    get_root_global %0, ['%1'; '%2'], '%3'", __ARG_3, $S2, $S3, $S1)
    __ARG_1.'say'($P3)
    goto __label_7
  __label_6: # else
    $P4 = WSubId_45("    get_root_global %0, ['%1'], '%2'", __ARG_3, $S2, $S1)
    __ARG_1.'say'($P4)
  __label_7: # endif
    $P3 = WSubId_45("    get_class %0, %0", __ARG_3)
    __ARG_1.'say'($P3)
  __label_2: # endif

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif

.end # emit_get_global

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    addattribute $P0, 'hll'
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_140 = "WSubId_140"
    self.'VarContainer'()
    setattribute self, 'nspath', __ARG_1
    unless_null __ARG_2, __label_1
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionContainer' ]
    $P2.'FunctionContainer'()
    set $P2, $P2
    setattribute self, 'funcont', $P2
    $P1 = __ARG_1.'fullname'()
    WSubId_140(self, '__NAMESPACE__', $P1)
    goto __label_2
  __label_1: # else
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
    getattribute $P2, __ARG_2, 'funcont'
    setattribute self, 'funcont', $P2
  __label_2: # endif
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2

.end # NamespaceBase


.sub 'addfunction' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'funcont'
    $P1.'addfunction'(__ARG_1)

.end # addfunction


.sub 'fixnamespaces' :subid('WSubId_17') :method
.lex '__WLEX_1', $P1
.const 'Sub' WSubId_5 = "WSubId_5"
.const 'Sub' WSubId_7 = "WSubId_7"
.const 'Sub' WSubId_18 = "WSubId_18"
    getattribute $P2, self, 'namespaces'
    $P3 = WSubId_5("fixnamespaces")
    if_null $P2, __label_3
    iter $P8, $P2
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P4, $P8
    $P3($P4)
    goto __label_2
  __label_3: # endfor
  __label_1:
    $P1 = WSubId_7(self, "usenamespace")
    getattribute $P5, self, 'usednamespaces'
    newclosure $P6, WSubId_18
    if_null $P5, __label_6
    iter $P9, $P5
    set $P9, 0
  __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P7, $P9
    $P6($P7)
    goto __label_5
  __label_6: # endfor
  __label_4:

.end # fixnamespaces


.sub '' :anon :subid('WSubId_18') :outer('WSubId_17')
        .param pmc __ARG_1
    find_lex $P1, '__WLEX_1'
    getattribute $P2, __ARG_1, 'usednamespaces'
    set $P3, $P1
    if_null $P2, __label_3
    iter $P5, $P2
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P4, $P5
    $P3($P4)
    goto __label_2
  __label_3: # endfor
  __label_1:

.end # WSubId_18


.sub 'getpath' :method
    getattribute $P1, self, 'nspath'
    .return($P1)

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
    ne_addr __ARG_1, self, __label_1
    .return()
  __label_1: # endif
    getattribute $P1, self, 'usednamespaces'
    set $P2, $P1
    set $P3, __ARG_1
    if_null $P2, __label_5
    iter $P6, $P2
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P4, $P6
    ne_addr $P4, $P3, __label_6
    set $P5, $P4
    goto __label_3
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
    goto __label_3
  __label_3:
    set $P7, $P5
    if_null $P7, __label_2
    .return()
  __label_2: # endif
    push $P1, __ARG_1

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
    $P1 = self.'scopesearch'(__ARG_1, 0)
    if_null $P1, __label_1
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
    self.'addfunction'($P1)
  __label_3: # endif
    goto __label_2
  __label_1: # else
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
    $P2 = self.'scopesearch'(__ARG_1, 1)
    if_null $P2, __label_5
    $P1 = $P2.'getvar'($S1)
    if_null $P1, __label_6
    self.'createvarused'($S1, $P1)
  __label_6: # endif
  __label_5: # endif
  __label_2: # endif

.end # use


.sub 'getusedns' :subid('WSubId_19') :method
        .param string __ARG_1
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_20 = "WSubId_20"
    getattribute $P1, self, 'usednamespaces'
    newclosure $P2, WSubId_20
    if_null $P1, __label_3
    iter $P5, $P1
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
    $P6 = $P2($P3)
    if_null $P6, __label_4
    unless $P6 goto __label_4
    set $P4, $P3
    goto __label_1
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P4
    goto __label_1
  __label_1:
    set $P6, $P4
    .return($P6)

.end # getusedns


.sub '' :anon :subid('WSubId_20') :outer('WSubId_19')
        .param pmc __ARG_2
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_20


.sub 'getlocalns' :subid('WSubId_21') :method
        .param string __ARG_1
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
    getattribute $P2, self, 'namespaces'
    newclosure $P3, WSubId_22
    if_null $P2, __label_3
    iter $P5, $P2
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P4, $P5
    $P6 = $P3($P4)
    if_null $P6, __label_4
    unless $P6 goto __label_4
    set $P1, $P4
    goto __label_1
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P1
    goto __label_1
  __label_1:
    if_null $P1, __label_5
    .return($P1)
  __label_5: # endif
    .tailcall self.'getusedns'(__ARG_1)

.end # getlocalns


.sub '' :anon :subid('WSubId_22') :outer('WSubId_21')
        .param pmc __ARG_2
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_22


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    new $P3, [ 'Winxed'; 'Compiler'; 'External' ]
    $P3.'External'(__ARG_1, __ARG_2)
    set $P1, $P3
    getattribute $P2, self, 'externals'
    unless_null $P2, __label_1
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
    push $P2, $P1
  __label_2: # endif

.end # addextern


.sub 'checkclass_base' :subid('WSubId_23') :method
        .param string __ARG_1
.lex '__WLEX_1', __ARG_1
.const 'Sub' WSubId_24 = "WSubId_24"
    getattribute $P3, self, 'classes'
    newclosure $P4, WSubId_24
    if_null $P3, __label_3
    iter $P6, $P3
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P5, $P6
    $P7 = $P4($P5)
    if_null $P7, __label_4
    unless $P7 goto __label_4
    set $P1, $P5
    goto __label_1
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P1
    goto __label_1
  __label_1:
    if_null $P1, __label_5
    .return($P1)
  __label_5: # endif
    getattribute $P7, self, 'usednamespaces'
    if_null $P7, __label_7
    iter $P8, $P7
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P2, $P8
    $P1 = $P2.'checkclass_base'(__ARG_1)
    if_null $P1, __label_8
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    null $P7
    .return($P7)

.end # checkclass_base


.sub '' :anon :subid('WSubId_24') :outer('WSubId_23')
        .param pmc __ARG_2
    find_lex $S1, '__WLEX_1'
    getattribute $P1, __ARG_2, 'name'
    find_lex $S2, '__WLEX_1'
    set $S3, $P1
    iseq $I1, $S3, $S2
    .return($I1)

.end # WSubId_24


.sub 'findsymbolbyname' :method
        .param string __ARG_1
    $P1 = self.'checkclass_base'(__ARG_1)
    if_null $P1, __label_1
    .return($P1)
  __label_1: # endif
    getattribute $P2, self, 'funcont'
    $P1 = $P2.'find'(__ARG_1)
    if_null $P1, __label_2
    .return($P1)
  __label_2: # endif
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
    .return($P1)
  __label_3: # endif
    null $P3
    .return($P3)

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
    elements $I1, __ARG_1
    null $S1
    null $P1
    null $P2
    sub $I2, $I1, __ARG_3
    if $I2 == 0 goto __label_3
    if $I2 == 1 goto __label_4
    goto __label_1
  __label_3: # case
    goto __label_2 # break
  __label_4: # case
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
    if __ARG_2 == 1 goto __label_7
    if __ARG_2 == 2 goto __label_8
    goto __label_5
  __label_7: # case
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
    .tailcall self.'checkclass_base'($S1)
  __label_5: # default
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
    .return($P1)
  __label_9: # endif
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_6: # switch end
    goto __label_2 # break
  __label_1: # default
    $S1 = __ARG_1[__ARG_3]
    $P2 = self.'getlocalns'($S1)
    isnull $I6, $P2
    not $I6
    unless $I6 goto __label_14
    add $I7, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I7)
    isnull $I6, $P1
    not $I6
  __label_14:
    unless $I6 goto __label_13
    .return($P1)
  __label_13: # endif
    $P2 = self.'getusedns'($S1)
    isnull $I8, $P2
    not $I8
    unless $I8 goto __label_16
    add $I9, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I9)
    isnull $I8, $P1
    not $I8
  __label_16:
    unless $I8 goto __label_15
    .return($P1)
  __label_15: # endif
  __label_2: # switch end
    null $P3
    .return($P3)

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P3
    $P2.'NamespaceStatement'(self, __ARG_1, $P3, __ARG_2, $P3)
    set $P1, $P2
    getattribute $P2, self, 'namespaces'
    push $P2, $P1
    .return($P1)

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
    $P1 = self.'getlocalns'(__ARG_2)
    new $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
    set $P2, $P3
    getattribute $P3, self, 'namespaces'
    push $P3, $P2
    getattribute $P3, self, 'items'
    push $P3, $P2
    .return($P2)

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'classes'
    push $P1, __ARG_1
    getattribute $P1, self, 'items'
    push $P1, __ARG_1

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_28 = "WSubId_28"
    $P1 = __ARG_2.'get'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
    $P1 = __ARG_2.'get'()
    set $P2, self
  __label_4: # for condition
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
    $P5 = __ARG_2.'get'()
    set $S1, $P5
  __label_2: # for iteration
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
    null $P3
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
    $P1 = __ARG_2.'get'()
  __label_5: # endif
    WSubId_28('{', $P1)
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
    $P4.'parse'(__ARG_2)

.end # parsenamespace


.sub 'parseextern' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
.const 'Sub' WSubId_124 = "WSubId_124"
.const 'Sub' WSubId_84 = "WSubId_84"
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'iskeyword'('function')
    isfalse $I1, $P3
    unless $I1 goto __label_1
    WSubId_25('Unsupported extern', $P1)
  __label_1: # endif
    $P1 = __ARG_1.'get'()
    WSubId_124($P1)
    WSubId_84(';', __ARG_1)
    new $P3, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P3.'FunctionExtern'($P1, self)
    set $P2, $P3
    self.'addfunction'($P2)

.end # parseextern


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_143 = "WSubId_143"
.const 'Sub' WSubId_144 = "WSubId_144"
.const 'Sub' WSubId_145 = "WSubId_145"
.const 'Sub' WSubId_146 = "WSubId_146"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_71 = "WSubId_71"
    getattribute $P1, self, 'items'
    null $P2
    $P2 = __ARG_1.'get'()
  __label_3: # for condition
    $P6 = $P2.'iseof'()
    if $P6 goto __label_4
    $P6 = $P2.'isop'('}')
  __label_4:
    isfalse $I1, $P6
    unless $I1 goto __label_2
    $P7 = $P2.'checkkeyword'()
    set $S1, $P7
    if $S1 == 'namespace' goto __label_7
    if $S1 == 'const' goto __label_8
    if $S1 == 'function' goto __label_9
    if $S1 == 'inline' goto __label_10
    if $S1 == 'class' goto __label_11
    if $S1 == 'extern' goto __label_12
    if $S1 == 'using' goto __label_13
    if $S1 == '$include_const' goto __label_14
    if $S1 == '$include' goto __label_15
    if $S1 == '$load' goto __label_16
    if $S1 == '$loadlib' goto __label_17
    goto __label_5
  __label_7: # case
    self.'parsenamespace'($P2, __ARG_1)
    goto __label_6 # break
  __label_8: # case
    $P3 = WSubId_74($P2, __ARG_1, self)
    push $P1, $P3
    goto __label_6 # break
  __label_9: # case
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P8.'FunctionStatement'($P2, __ARG_1, self)
    set $P4, $P8
    self.'addfunction'($P4)
    push $P1, $P4
    goto __label_6 # break
  __label_10: # case
    new $P9, [ 'Winxed'; 'Compiler'; 'InlineStatement' ]
    $P9.'InlineStatement'($P2, __ARG_1, self)
    set $P5, $P9
    self.'addfunction'($P5)
    goto __label_6 # break
  __label_11: # case
    WSubId_143($P2, __ARG_1, self)
    goto __label_6 # break
  __label_12: # case
    self.'parseextern'(__ARG_1)
    goto __label_6 # break
  __label_13: # case
    WSubId_144($P2, __ARG_1, self)
    goto __label_6 # break
  __label_14: # case
    WSubId_145($P2, __ARG_1, self)
    goto __label_6 # break
  __label_15: # case
    WSubId_146($P2, __ARG_1, self)
    goto __label_6 # break
  __label_16: # case
    $P2 = __ARG_1.'get'()
    $P10 = $P2.'isstring'()
    isfalse $I2, $P10
    unless $I2 goto __label_18
    WSubId_70('string literal', $P2)
  __label_18: # endif
    WSubId_84(';', __ARG_1)
    new $P13, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P13.'StringLiteral'(self, $P2)
    set $P12, $P13
    $P11 = $P12.'getPirString'()
    self.'addload'($P11)
    goto __label_6 # break
  __label_17: # case
    $P2 = __ARG_1.'get'()
    $P14 = $P2.'isstring'()
    isfalse $I3, $P14
    unless $I3 goto __label_19
    WSubId_70('string literal', $P2)
  __label_19: # endif
    WSubId_84(';', __ARG_1)
    new $P17, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P17.'StringLiteral'(self, $P2)
    set $P16, $P17
    $P15 = $P16.'getPirString'()
    self.'addlib'($P15)
    goto __label_6 # break
  __label_5: # default
    WSubId_71("token", $P2)
  __label_6: # switch end
  __label_1: # for iteration
    $P2 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
    $P6 = $P2.'iseof'()
    if_null $P6, __label_20
    unless $P6 goto __label_20
    self.'unclosed_ns'()
    goto __label_21
  __label_20: # else
    self.'close_ns'($P2)
  __label_21: # endif

.end # parse


.sub 'optimize_base' :method
    getattribute $P1, self, 'items'
    if_null $P1, __label_3
    elements $I1, $P1
    goto __label_2
  __label_3:
    null $I1
  __label_2:
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
    $P3 = $P1[$I2]
    $P2 = $P3.'optimize'()
    $P1[$I2] = $P2
  __label_4: # for iteration
    inc $I2
    goto __label_6
  __label_5: # for end
  __label_1:

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
    $P1 = self.'getpath'()
    set $I1, 1
    getattribute $P2, self, 'externals'
    if_null $P2, __label_1
    $P1.'emitnamespace'(__ARG_1)
    null $I1
    set $P4, __ARG_1
    set $P5, $P2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_5 = "WSubId_5"
    set $P6, $P5
    $P9 = WSubId_5("emit")
    $P7 = WSubId_3($P9, $P4)
    if_null $P6, __label_5
    iter $P10, $P6
    set $P10, 0
  __label_4: # for iteration
    unless $P10 goto __label_5
    shift $P8, $P10
    $P7($P8)
    goto __label_4
  __label_5: # endfor
  __label_3:
  __label_2:
  __label_1: # endif
    getattribute $P9, self, 'items'
    if_null $P9, __label_7
    iter $P11, $P9
    set $P11, 0
  __label_6: # for iteration
    unless $P11 goto __label_7
    shift $P3, $P11
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_10
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_10:
    unless $I2 goto __label_8
    set $I1, 1
    goto __label_9
  __label_8: # else
    unless $I1 goto __label_11
    $P1.'emitnamespace'(__ARG_1)
    null $I1
  __label_11: # endif
  __label_9: # endif
    $P3.'emit'(__ARG_1)
    goto __label_6
  __label_7: # endfor

.end # emit_base

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
    addattribute $P0, 'nspath'
    addattribute $P0, 'externals'
    addattribute $P0, 'namespaces'
    addattribute $P0, 'classes'
    addattribute $P0, 'funcont'
    addattribute $P0, 'items'
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
    setattribute self, 'modifier', __ARG_5
    null $I1
    if_null __ARG_5, __label_1
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
    set $I1, 1
  __label_2: # endif
  __label_1: # endif
    unless $I1 goto __label_4
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
    self.'NamespaceBase'($P1, __ARG_3)
    setattribute self, 'parent', __ARG_1
    setattribute self, 'start', __ARG_2
    setattribute self, 'owner', __ARG_1
    box $P2, __ARG_4
    setattribute self, 'name', $P2

.end # NamespaceStatement


.sub 'dowarnings' :method
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()

.end # dowarnings


.sub 'generatesubid' :method
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
    $P1 = self.'checkclass_base'(__ARG_1)
    unless_null $P1, __label_1
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
    .return($P1)

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
    .return($P1)

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_25 = "WSubId_25"
    getattribute $P1, self, 'start'
    WSubId_25('unclosed namespace', $P1)

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1

.end # close_ns


.sub 'optimize' :method
    getattribute $P1, self, 'modifier'
    if_null $P1, __label_1
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
    self.'optimize_base'()
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_45 = "WSubId_45"
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
    $P2 = WSubId_45(".HLL '%0'", $P1)
    __ARG_1.'say'($P2)
  __label_1: # endif
    self.'emit_base'(__ARG_1)
    if_null $P1, __label_2
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif

.end # emit

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
    addattribute $P0, 'parent'
    addattribute $P0, 'start'
    addattribute $P0, 'name'
    addattribute $P0, 'modifier'
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
    setattribute self, 'unit', __ARG_1
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
    box $P1, 0
    setattribute self, 'subidgen', $P1

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
    getattribute $P1, self, 'bultins_used'
    $P1[__ARG_1] = 1

.end # use_builtin


.sub 'generatesubid' :method
    getattribute $P1, self, 'subidgen'
    inc $P1
    set $I1, $P1
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
    getattribute $P1, self, 'libs'
    unless_null $P1, __label_1
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
    $P1[__ARG_1] = 1

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
    getattribute $P1, self, 'loads'
    unless_null $P1, __label_1
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
    $P1[__ARG_1] = 1

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
    .tailcall self.'checkclass_base'(__ARG_1)

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)

.end # scopesearch


.sub 'unclosed_ns' :method

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_25 = "WSubId_25"
    WSubId_25('Cannot close root namespace', __ARG_1)

.end # close_ns


.sub 'dowarnings' :method
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()

.end # dowarnings


.sub 'optimize' :method
    self.'optimize_base'()
    .return(self)

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_45 = "WSubId_45"
    getattribute $P1, self, 'bultins_used'
    $P12 = $P1['chomp']
    if_null $P12, __label_1
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
    split $P12, " ", "acos asin atan cos exp ln sin tan pow sinh cosh tanh"
    if_null $P12, __label_3
    iter $P13, $P12
    set $P13, 0
  __label_2: # for iteration
    unless $P13 goto __label_3
    shift $S1, $P13
    $P14 = $P1[$S1]
    if_null $P14, __label_4
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    getattribute $P2, self, 'libs'
    if_null $P2, __label_5
    set $P4, $P2
    root_new $P5, ['parrot';'ResizablePMCArray']
    $P6 = WSubId_9(".loadlib ")
    if_null $P4, __label_8
    iter $P16, $P4
    set $P16, 0
  __label_7: # for iteration
    unless $P16 goto __label_8
    shift $P7, $P16
    $P12 = $P6($P7)
    push $P5, $P12
    goto __label_7
  __label_8: # endfor
    set $P15, $P5
    goto __label_6
  __label_6:
    set $P12, $P15
    join $S2, "\n", $P12
    __ARG_1.'say'($S2)
  __label_5: # endif
    getattribute $P3, self, 'loads'
    if_null $P3, __label_9
    set $P8, $P3
    root_new $P9, ['parrot';'ResizablePMCArray']
    $P10 = WSubId_9('    load_bytecode ')
    if_null $P8, __label_12
    iter $P18, $P8
    set $P18, 0
  __label_11: # for iteration
    unless $P18 goto __label_12
    shift $P11, $P18
    $P14 = $P10($P11)
    push $P9, $P14
    goto __label_11
  __label_12: # endfor
    set $P17, $P9
    goto __label_10
  __label_10:
    set $P12, $P17
    join $S2, "\n", $P12
    $P12 = WSubId_45(".sub initial_load_bytecode :anon :tag('load') :tag('init')\n%0\n.end\n", $S2)
    __ARG_1.'say'($P12)
  __label_9: # endif
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_14
    isnull $I1, $P3
    not $I1
  __label_14:
    unless $I1 goto __label_13
    __ARG_1.'comment'('end libs')
  __label_13: # endif
    self.'emit_base'(__ARG_1)

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'locals'
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
    $P2 = $P1[$S1]
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
    $P3 = $P2.'getvalue'()
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
    goto __label_1
  __label_2: # endfor

.end # emitinclude

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
    addattribute $P0, 'unit'
    addattribute $P0, 'bultins_used'
    addattribute $P0, 'libs'
    addattribute $P0, 'loads'
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
    box $P1, __ARG_1
    setattribute self, 'name', $P1
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2

.end # Builtin


.sub 'getname' :method
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'variants'
    push $P1, __ARG_1

.end # addvariant

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    addattribute $P0, 'name'
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'entries'
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
    $P2 = $P1[$S1]
    if_null $P2, __label_2
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif

.end # add


.sub 'put' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'entries'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
    $P3 = $P1[$S1]
    __ARG_1.'addfunction'($P3)
    goto __label_1
  __label_2: # endfor

.end # put

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_147 = "WSubId_147"
.const 'Sub' WSubId_140 = "WSubId_140"
.const 'Sub' WSubId_148 = "WSubId_148"
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P4.'RootNamespace'(self)
    set $P1, $P4
    WSubId_147($P1, 'false', 0)
    WSubId_147($P1, 'true', 1)
    WSubId_140($P1, '__STAGE__', "4")
    WSubId_147($P1, '__DEBUG__', __ARG_2)
    WSubId_147($P1, '__WINXED_ERROR__', 567)
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
    set $P3, $P3
    WSubId_148($P3)
    $P3.'put'($P2)
    $P1.'usenamespace'($P2)
    setattribute self, 'rootns', $P1

.end # WinxedCompileUnit


.sub 'dowarnings' :method
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()

.end # parse


.sub 'optimize' :method
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
    __ARG_1.'comment'('Begin generated code')
    __ARG_1.'say'('')
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
    __ARG_1.'comment'('End generated code')

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
    __ARG_1.'comment'('Generated automatically from Winxed sources')
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
    __ARG_1.'comment'('End')

.end # emitinclude

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    addattribute $P0, 'rootns'
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 5
    $P1[1] = $I1
    null $I1
    $P1[2] = $I1
    .return($P1)

.end # version


.sub 'version_string' :method
    $P1 = self.'version'()
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
        .param int __ARG_6
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
    .return(__ARG_1)
  __label_1: # endif
    null $P1
    unless_null __ARG_3, __label_2
    new $P1, [ 'StringHandle' ]
    $P1.'open'('__eval__', 'w')
    goto __label_3
  __label_2: # else
    set $P1, __ARG_3
  __label_3: # endif
    new $P5, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P5.'Emit'($P1, __ARG_6)
    set $P2, $P5
    unless __ARG_4 goto __label_4
    $P2.'setDebug'()
  __label_4: # endif
    unless __ARG_5 goto __label_5
    $P2.'disable_annotations'()
  __label_5: # endif
    __ARG_1.'emit'($P2)
    $P2.'close'()
    if_null __ARG_3, __label_6
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
    $P1.'close'()
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
    null $P3
    set $S2, __ARG_2
    if $S2 == 'pir' goto __label_11
    if $S2 == 'pbc' goto __label_12
    if $S2 == '' goto __label_13
    goto __label_9
  __label_11: # case
    new $P3, [ 'String' ]
    assign $P3, $S1
    goto __label_10 # break
  __label_12: # case
  __label_13: # case
    compreg $P4, 'PIR'
    $P3 = $P4($S1)
    goto __label_10 # break
  __label_9: # default
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
    die $S5
  __label_10: # switch end
    .return($P3)
  __label_7: # endif

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
    null $P1
    unless_null __ARG_2, __label_1
    new $P1, [ 'StringHandle' ]
    $P1.'open'('__eval__', 'w')
    goto __label_2
  __label_1: # else
    set $P1, __ARG_2
  __label_2: # endif
    new $P3, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P3.'Emit'($P1, 1)
    set $P2, $P3
    __ARG_1.'emitinclude'($P2)
    $P2.'close'()
    if_null __ARG_2, __label_3
    .return(__ARG_2)
    goto __label_4
  __label_3: # else
    $P1.'close'()
    .tailcall $P1.'read'(0)
  __label_4: # endif

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
    unless_null __ARG_2, __label_1
    set __ARG_2, ''
  __label_1: # endif
    new $P1, [ 'StringHandle' ]
    $P1.'open'('__eval__', 'w')
    $P1.'puts'(__ARG_1)
    $P1.'close'()
    $P1.'open'('__eval__', 'r')
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, '__eval__', __ARG_6)
    set $P2, $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
    $P3.'parse'($P2)
    $P1.'close'()
    $P3.'optimize'()
    ne __ARG_2, 'include', __label_2
    .tailcall self.'__private_geninclude'($P3, __ARG_3)
    goto __label_3
  __label_2: # else
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('debug')
        .param int __ARG_5 :optional :named('noan')
        .param int __ARG_6 :optional :named('nowarn')
    unless_null __ARG_2, __label_1
    set __ARG_2, ''
  __label_1: # endif
    new $P1, [ 'FileHandle' ]
    $P1.'open'(__ARG_1, 'r')
    $P1.'encoding'('utf8')
    new $P4, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P4.'Tokenizer'($P1, __ARG_1, __ARG_6)
    set $P2, $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P4.'WinxedCompileUnit'(__ARG_6, __ARG_4)
    set $P3, $P4
    $P3.'parse'($P2)
    $P1.'close'()
    $P3.'optimize'()
    ne __ARG_2, 'include', __label_2
    .tailcall self.'__private_geninclude'($P3, __ARG_3)
    goto __label_3
  __label_2: # else
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6)
  __label_3: # endif

.end # compile_from_file

.sub Winxed_class_init :anon :tag('load') :tag('init')
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :tag('init') :tag('load')
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
    compreg 'winxed', $P1

.end # initializer

# End generated code
