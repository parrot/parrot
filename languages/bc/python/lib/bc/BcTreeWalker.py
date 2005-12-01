### $ANTLR 2.7.5 (20051104): "bc_python.g" -> "BcTreeWalker.py"$
### import antlr and other modules ..
import sys
import antlr

version = sys.version.split()[0]
if version < '2.2.1':
    False = 0
if version < '2.3':
    True = not False
### header action >>> 

### header action <<< 

### import antlr.Token 
from antlr import Token
### >>>The Known Token Types <<<
SKIP                = antlr.SKIP
INVALID_TYPE        = antlr.INVALID_TYPE
EOF_TYPE            = antlr.EOF_TYPE
EOF                 = antlr.EOF
NULL_TREE_LOOKAHEAD = antlr.NULL_TREE_LOOKAHEAD
MIN_USER_TYPE       = antlr.MIN_USER_TYPE
NEWLINE = 4
STRING = 5
LETTER = 6
DIGIT = 7
INTEGER = 8
NUMBER = 9
MUL = 10
DIV = 11
MOD = 12
ASSIGN_OP = 13
REL_OP = 14
INCR = 15
DECR = 16
Quit = 17
Define = 18
Auto = 19
If = 20
KEYWORDS = 21
LPAREN = 22
RPAREN = 23
COMMA = 24
PLUS = 25
MINUS = 26
SEMICOLON = 27
LBRACKET = 28
RBRACKET = 29
CARET = 30
LCURLY = 31
RCURLY = 32
WS = 33
ML_COMMENT = 34
PIR_OP = 35
UNARY_MINUS = 36
PIR_PRINT_PMC = 37
PIR_FUNCTION_DEF = 38
PIR_FOOTER = 39
PIR_HEADER = 40
PIR_NOOP = 41
PIR_COMMENT = 42
PIR_NEWLINE = 43

### user code>>>

### user code<<<

class Walker(antlr.TreeParser):
    
    # ctor ..
    def __init__(self, *args, **kwargs):
        antlr.TreeParser.__init__(self, *args, **kwargs)
        self.tokenNames = _tokenNames
        ### __init__ header action >>> 
        self.reg_num   = 0;  # counter for unlimited number of PMC registers
        self.label_num = 0;  # counter for generation jump labels
        ### __init__ header action <<< 
    
    ### user action >>>
    ### user action <<<
    def plus(self, _t):    
        reg_name = None
        
        plus_AST_in = None
        if _t != antlr.ASTNULL:
            plus_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        plus_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t83 = _t
            tmp1_AST = None
            tmp1_AST_in = None
            tmp1_AST = self.astFactory.create(_t)
            tmp1_AST_in = _t
            _currentAST83 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,PLUS)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST83
            _t = _t83
            _t = _t.getNextSibling()
            plus_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = add " + reg_name_left + ", " + reg_name_right + "\n #"
            plus_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = plus_AST
            if (plus_AST != None) and (plus_AST.getFirstChild() != None):
                currentAST.child = plus_AST.getFirstChild()
            else:
                currentAST.child = plus_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = plus_AST
        self._retTree = _t
        return reg_name
    
    def expr(self, _t):    
        reg_name = None
        
        expr_AST_in = None
        if _t != antlr.ASTNULL:
            expr_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expr_AST = None
        try:      ## for error handling
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [PLUS]:
                pass
                reg_name=self.plus(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                expr_AST = currentAST.root
            elif la1 and la1 in [MINUS]:
                pass
                reg_name=self.minus(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                expr_AST = currentAST.root
            elif la1 and la1 in [MUL]:
                pass
                reg_name=self.mul(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                expr_AST = currentAST.root
            elif la1 and la1 in [DIV]:
                pass
                reg_name=self.div(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                expr_AST = currentAST.root
            elif la1 and la1 in [MOD]:
                pass
                reg_name=self.mod(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                expr_AST = currentAST.root
            elif la1 and la1 in [NUMBER,UNARY_MINUS]:
                pass
                reg_name=self.signExpression(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                expr_AST = currentAST.root
            elif la1 and la1 in [LETTER]:
                pass
                reg_name=self.namedExpression(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                expr_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(_t)
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = expr_AST
        self._retTree = _t
        return reg_name
    
    def minus(self, _t):    
        reg_name = None
        
        minus_AST_in = None
        if _t != antlr.ASTNULL:
            minus_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        minus_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t85 = _t
            tmp2_AST = None
            tmp2_AST_in = None
            tmp2_AST = self.astFactory.create(_t)
            tmp2_AST_in = _t
            _currentAST85 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,MINUS)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST85
            _t = _t85
            _t = _t.getNextSibling()
            minus_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = sub " + reg_name_left + ", " + reg_name_right + "\n #"
            minus_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = minus_AST
            if (minus_AST != None) and (minus_AST.getFirstChild() != None):
                currentAST.child = minus_AST.getFirstChild()
            else:
                currentAST.child = minus_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = minus_AST
        self._retTree = _t
        return reg_name
    
    def mul(self, _t):    
        reg_name = None
        
        mul_AST_in = None
        if _t != antlr.ASTNULL:
            mul_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        mul_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t87 = _t
            tmp3_AST = None
            tmp3_AST_in = None
            tmp3_AST = self.astFactory.create(_t)
            tmp3_AST_in = _t
            _currentAST87 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,MUL)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST87
            _t = _t87
            _t = _t.getNextSibling()
            mul_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = mul " + reg_name_left + ", " + reg_name_right + "\n #"
            mul_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = mul_AST
            if (mul_AST != None) and (mul_AST.getFirstChild() != None):
                currentAST.child = mul_AST.getFirstChild()
            else:
                currentAST.child = mul_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = mul_AST
        self._retTree = _t
        return reg_name
    
    def div(self, _t):    
        reg_name = None
        
        div_AST_in = None
        if _t != antlr.ASTNULL:
            div_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        div_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t89 = _t
            tmp4_AST = None
            tmp4_AST_in = None
            tmp4_AST = self.astFactory.create(_t)
            tmp4_AST_in = _t
            _currentAST89 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,DIV)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST89
            _t = _t89
            _t = _t.getNextSibling()
            div_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = div " + reg_name_left + ", " + reg_name_right + "\n #"
            div_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = div_AST
            if (div_AST != None) and (div_AST.getFirstChild() != None):
                currentAST.child = div_AST.getFirstChild()
            else:
                currentAST.child = div_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = div_AST
        self._retTree = _t
        return reg_name
    
    def mod(self, _t):    
        reg_name = None
        
        mod_AST_in = None
        if _t != antlr.ASTNULL:
            mod_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        mod_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t91 = _t
            tmp5_AST = None
            tmp5_AST_in = None
            tmp5_AST = self.astFactory.create(_t)
            tmp5_AST_in = _t
            _currentAST91 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,MOD)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST91
            _t = _t91
            _t = _t.getNextSibling()
            mod_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = mod " + reg_name_left + ", " + reg_name_right + "\n #"
            mod_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = mod_AST
            if (mod_AST != None) and (mod_AST.getFirstChild() != None):
                currentAST.child = mod_AST.getFirstChild()
            else:
                currentAST.child = mod_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = mod_AST
        self._retTree = _t
        return reg_name
    
    def integer(self, _t):    
        reg_name = None
        
        integer_AST_in = None
        if _t != antlr.ASTNULL:
            integer_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        integer_AST = None
        i = None
        i_AST = None
        try:      ## for error handling
            pass
            i = _t
            i_AST_in = None
            i_AST = self.astFactory.create(i)
            self.match(_t,NUMBER)
            _t = _t.getNextSibling()
            integer_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = assign " + i.getText() + "\n #"
            integer_AST = antlr.make(self.astFactory.create(PIR_OP,pir));
            currentAST.root = integer_AST
            if (integer_AST != None) and (integer_AST.getFirstChild() != None):
                currentAST.child = integer_AST.getFirstChild()
            else:
                currentAST.child = integer_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = integer_AST
        self._retTree = _t
        return reg_name
    
    def signExpression(self, _t):    
        reg_name = None
        
        signExpression_AST_in = None
        if _t != antlr.ASTNULL:
            signExpression_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        signExpression_AST = None
        i1_AST = None
        i1 = None
        i2_AST = None
        i2 = None
        try:      ## for error handling
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [NUMBER]:
                pass
                i1 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.integer(_t)
                _t = self._retTree
                i1_AST = self.returnAST
                self.addASTChild(currentAST, self.returnAST)
                signExpression_AST = currentAST.root
                pir = ""
                signExpression_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), signExpression_AST, self.astFactory.create(PIR_OP,pir));
                currentAST.root = signExpression_AST
                if (signExpression_AST != None) and (signExpression_AST.getFirstChild() != None):
                    currentAST.child = signExpression_AST.getFirstChild()
                else:
                    currentAST.child = signExpression_AST
                currentAST.advanceChildToEnd()
                signExpression_AST = currentAST.root
            elif la1 and la1 in [UNARY_MINUS]:
                pass
                _t94 = _t
                tmp6_AST = None
                tmp6_AST_in = None
                tmp6_AST = self.astFactory.create(_t)
                tmp6_AST_in = _t
                self.addASTChild(currentAST, tmp6_AST)
                _currentAST94 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,UNARY_MINUS)
                _t = _t.getFirstChild()
                i2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.integer(_t)
                _t = self._retTree
                i2_AST = self.returnAST
                self.addASTChild(currentAST, self.returnAST)
                currentAST = _currentAST94
                _t = _t94
                _t = _t.getNextSibling()
                signExpression_AST = currentAST.root
                pir = "\n" + \
                     "neg " + reg_name + "\n#"
                signExpression_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), signExpression_AST, self.astFactory.create(PIR_OP,pir));
                currentAST.root = signExpression_AST
                if (signExpression_AST != None) and (signExpression_AST.getFirstChild() != None):
                    currentAST.child = signExpression_AST.getFirstChild()
                else:
                    currentAST.child = signExpression_AST
                currentAST.advanceChildToEnd()
                signExpression_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(_t)
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = signExpression_AST
        self._retTree = _t
        return reg_name
    
    def namedExpression(self, _t):    
        reg_name = None
        
        namedExpression_AST_in = None
        if _t != antlr.ASTNULL:
            namedExpression_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        namedExpression_AST = None
        l = None
        l_AST = None
        try:      ## for error handling
            pass
            l = _t
            l_AST_in = None
            l_AST = self.astFactory.create(l)
            self.addASTChild(currentAST, l_AST)
            self.match(_t,LETTER)
            _t = _t.getNextSibling()
            reg_name = l.getText() + "_lex";
            namedExpression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = namedExpression_AST
        self._retTree = _t
        return reg_name
    
    def expr_line(self, _t):    
        
        expr_line_AST_in = None
        if _t != antlr.ASTNULL:
            expr_line_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expr_line_AST = None
        E1_AST = None
        E1 = None
        E2_AST = None
        E2 = None
        E3_AST = None
        E3 = None
        p2_AST = None
        p2 = None
        p = None
        p_AST = None
        try:      ## for error handling
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [PIR_PRINT_PMC]:
                pass
                _t98 = _t
                tmp7_AST = None
                tmp7_AST_in = None
                tmp7_AST = self.astFactory.create(_t)
                tmp7_AST_in = _t
                _currentAST98 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,PIR_PRINT_PMC)
                _t = _t.getFirstChild()
                E1 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.expr(_t)
                _t = self._retTree
                E1_AST = self.returnAST
                currentAST = _currentAST98
                _t = _t98
                _t = _t.getNextSibling()
                expr_line_AST = currentAST.root
                expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E1_AST, self.astFactory.create(PIR_OP,"\nprint "), self.astFactory.create(PIR_OP,reg_name), self.astFactory.create(PIR_NEWLINE,"\nprint \"\\n\" # "))
                currentAST.root = expr_line_AST
                if (expr_line_AST != None) and (expr_line_AST.getFirstChild() != None):
                    currentAST.child = expr_line_AST.getFirstChild()
                else:
                    currentAST.child = expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [ASSIGN_OP]:
                pass
                _t99 = _t
                tmp8_AST = None
                tmp8_AST_in = None
                tmp8_AST = self.astFactory.create(_t)
                tmp8_AST_in = _t
                _currentAST99 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,ASSIGN_OP)
                _t = _t.getFirstChild()
                lex_name=self.namedExpression(_t)
                _t = self._retTree
                E2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.expr(_t)
                _t = self._retTree
                E2_AST = self.returnAST
                currentAST = _currentAST99
                _t = _t99
                _t = _t.getNextSibling()
                expr_line_AST = currentAST.root
                pir = "\n" + \
                     lex_name + " = " + reg_name + "\n # "
                expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E2_AST, self.astFactory.create(PIR_OP,pir))
                currentAST.root = expr_line_AST
                if (expr_line_AST != None) and (expr_line_AST.getFirstChild() != None):
                    currentAST.child = expr_line_AST.getFirstChild()
                else:
                    currentAST.child = expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [INCR]:
                pass
                _t100 = _t
                tmp9_AST = None
                tmp9_AST_in = None
                tmp9_AST = self.astFactory.create(_t)
                tmp9_AST_in = _t
                _currentAST100 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,INCR)
                _t = _t.getFirstChild()
                lex_name=self.namedExpression(_t)
                _t = self._retTree
                currentAST = _currentAST100
                _t = _t100
                _t = _t.getNextSibling()
                expr_line_AST = currentAST.root
                pir = "\n" + \
                     lex_name + " = " + lex_name + " + 1 \n # "
                expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), self.astFactory.create(PIR_OP,pir), self.astFactory.create(PIR_OP,"\nprint "), self.astFactory.create(PIR_OP,lex_name), self.astFactory.create(PIR_NEWLINE,"\nprint \"\\n\" # "))
                currentAST.root = expr_line_AST
                if (expr_line_AST != None) and (expr_line_AST.getFirstChild() != None):
                    currentAST.child = expr_line_AST.getFirstChild()
                else:
                    currentAST.child = expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [DECR]:
                pass
                _t101 = _t
                tmp10_AST = None
                tmp10_AST_in = None
                tmp10_AST = self.astFactory.create(_t)
                tmp10_AST_in = _t
                _currentAST101 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,DECR)
                _t = _t.getFirstChild()
                lex_name=self.namedExpression(_t)
                _t = self._retTree
                currentAST = _currentAST101
                _t = _t101
                _t = _t.getNextSibling()
                expr_line_AST = currentAST.root
                pir = "\n" + \
                     lex_name + " = " + lex_name + " - 1 \n # "
                expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), self.astFactory.create(PIR_OP,pir), self.astFactory.create(PIR_OP,"\nprint "), self.astFactory.create(PIR_OP,lex_name), self.astFactory.create(PIR_NEWLINE,"\nprint \"\\n\" # "))
                currentAST.root = expr_line_AST
                if (expr_line_AST != None) and (expr_line_AST.getFirstChild() != None):
                    currentAST.child = expr_line_AST.getFirstChild()
                else:
                    currentAST.child = expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [If]:
                pass
                _t102 = _t
                tmp11_AST = None
                tmp11_AST_in = None
                tmp11_AST = self.astFactory.create(_t)
                tmp11_AST_in = _t
                _currentAST102 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,If)
                _t = _t.getFirstChild()
                E3 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.relational_expr(_t)
                _t = self._retTree
                E3_AST = self.returnAST
                p2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                self.expr_line(_t)
                _t = self._retTree
                p2_AST = self.returnAST
                currentAST = _currentAST102
                _t = _t102
                _t = _t.getNextSibling()
                expr_line_AST = currentAST.root
                pir = "\n" + \
                     "unless " + reg_name + " goto LABEL_%d\n#" % self.label_num 
                expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E3_AST, self.astFactory.create(PIR_OP,pir), p2_AST, self.astFactory.create(PIR_OP,"\nLABEL_0:\n#"))
                currentAST.root = expr_line_AST
                if (expr_line_AST != None) and (expr_line_AST.getFirstChild() != None):
                    currentAST.child = expr_line_AST.getFirstChild()
                else:
                    currentAST.child = expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [PIR_OP]:
                pass
                p = _t
                p_AST_in = None
                p_AST = self.astFactory.create(p)
                self.match(_t,PIR_OP)
                _t = _t.getNextSibling()
                expr_line_AST = currentAST.root
                expr_line_AST = p_AST
                currentAST.root = expr_line_AST
                if (expr_line_AST != None) and (expr_line_AST.getFirstChild() != None):
                    currentAST.child = expr_line_AST.getFirstChild()
                else:
                    currentAST.child = expr_line_AST
                currentAST.advanceChildToEnd()
            else:
                    raise antlr.NoViableAltException(_t)
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = expr_line_AST
        self._retTree = _t
    
    def relational_expr(self, _t):    
        reg_name = None
        
        relational_expr_AST_in = None
        if _t != antlr.ASTNULL:
            relational_expr_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        relational_expr_AST = None
        e1_AST = None
        e1 = None
        op = None
        op_AST = None
        e2_AST = None
        e2 = None
        e3_AST = None
        e3 = None
        try:      ## for error handling
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [LETTER,NUMBER,MUL,DIV,MOD,PLUS,MINUS,UNARY_MINUS]:
                pass
                e1 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.expr(_t)
                _t = self._retTree
                e1_AST = self.returnAST
                relational_expr_AST = currentAST.root
                relational_expr_AST = e1_AST
                currentAST.root = relational_expr_AST
                if (relational_expr_AST != None) and (relational_expr_AST.getFirstChild() != None):
                    currentAST.child = relational_expr_AST.getFirstChild()
                else:
                    currentAST.child = relational_expr_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [REL_OP]:
                pass
                _t104 = _t
                op = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                op_AST_in = None
                op_AST = self.astFactory.create(op)
                _currentAST104 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,REL_OP)
                _t = _t.getFirstChild()
                e2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name_left=self.expr(_t)
                _t = self._retTree
                e2_AST = self.returnAST
                e3 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name_right=self.expr(_t)
                _t = self._retTree
                e3_AST = self.returnAST
                currentAST = _currentAST104
                _t = _t104
                _t = _t.getNextSibling()
                relational_expr_AST = currentAST.root
                reg_name = "temp_int"    # this will be returned
                pir_op_for_rel_op = { "<":  "islt",
                                     "<=": "isle",
                                     ">":  "isgt",
                                     ">=": "isge",
                                     "==": "iseq",
                                     "!=": "isne",
                                   }
                pir = "\n" + \
                     reg_name + " = " + pir_op_for_rel_op[op.getText()] + ' ' + reg_name_left + ", " + reg_name_right + "\n #"
                relational_expr_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), e2_AST, e3_AST, self.astFactory.create(PIR_OP,pir))
                currentAST.root = relational_expr_AST
                if (relational_expr_AST != None) and (relational_expr_AST.getFirstChild() != None):
                    currentAST.child = relational_expr_AST.getFirstChild()
                else:
                    currentAST.child = relational_expr_AST
                currentAST.advanceChildToEnd()
            else:
                    raise antlr.NoViableAltException(_t)
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = relational_expr_AST
        self._retTree = _t
        return reg_name
    
    def expr_list(self, _t):    
        
        expr_list_AST_in = None
        if _t != antlr.ASTNULL:
            expr_list_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expr_list_AST = None
        try:      ## for error handling
            pass
            _cnt107= 0
            while True:
                if not _t:
                    _t = antlr.ASTNULL
                la1 = _t.getType()
                if False:
                    pass
                elif la1 and la1 in [ASSIGN_OP,INCR,DECR,If,PIR_OP,PIR_PRINT_PMC]:
                    pass
                    self.expr_line(_t)
                    _t = self._retTree
                    self.addASTChild(currentAST, self.returnAST)
                elif la1 and la1 in [PIR_FUNCTION_DEF]:
                    pass
                    tmp12_AST = None
                    tmp12_AST_in = None
                    tmp12_AST = self.astFactory.create(_t)
                    tmp12_AST_in = _t
                    self.addASTChild(currentAST, tmp12_AST)
                    self.match(_t,PIR_FUNCTION_DEF)
                    _t = _t.getNextSibling()
                else:
                        break
                    
                _cnt107 += 1
            if _cnt107 < 1:
                raise antlr.NoViableAltException(_t)
            expr_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = expr_list_AST
        self._retTree = _t
    
    def gen_pir(self, _t):    
        
        gen_pir_AST_in = None
        if _t != antlr.ASTNULL:
            gen_pir_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        gen_pir_AST = None
        B_AST = None
        B = None
        try:      ## for error handling
            pass
            B = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            self.expr_list(_t)
            _t = self._retTree
            B_AST = self.returnAST
            gen_pir_AST = currentAST.root
            gen_pir_AST = antlr.make(self.astFactory.create(PIR_HEADER,"pir header\n#"), B_AST, self.astFactory.create(PIR_FOOTER,"pir footer\n#"));
            currentAST.root = gen_pir_AST
            if (gen_pir_AST != None) and (gen_pir_AST.getFirstChild() != None):
                currentAST.child = gen_pir_AST.getFirstChild()
            else:
                currentAST.child = gen_pir_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = gen_pir_AST
        self._retTree = _t
    
    def gen_past_pir(self, _t):    
        
        gen_past_pir_AST_in = None
        if _t != antlr.ASTNULL:
            gen_past_pir_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        gen_past_pir_AST = None
        B_AST = None
        B = None
        try:      ## for error handling
            pass
            B = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            self.past_expr_list(_t)
            _t = self._retTree
            B_AST = self.returnAST
            gen_past_pir_AST = currentAST.root
            gen_past_pir_AST = antlr.make(self.astFactory.create(PIR_HEADER,"# pir header past\n#"), B_AST, self.astFactory.create(PIR_FOOTER,"# pir footer past\n#"));
            currentAST.root = gen_past_pir_AST
            if (gen_past_pir_AST != None) and (gen_past_pir_AST.getFirstChild() != None):
                currentAST.child = gen_past_pir_AST.getFirstChild()
            else:
                currentAST.child = gen_past_pir_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = gen_past_pir_AST
        self._retTree = _t
    
    def past_expr_list(self, _t):    
        
        past_expr_list_AST_in = None
        if _t != antlr.ASTNULL:
            past_expr_list_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_expr_list_AST = None
        try:      ## for error handling
            pass
            _cnt112= 0
            while True:
                if not _t:
                    _t = antlr.ASTNULL
                la1 = _t.getType()
                if False:
                    pass
                elif la1 and la1 in [ASSIGN_OP,INCR,DECR,If,PIR_OP,PIR_PRINT_PMC]:
                    pass
                    self.past_expr_line(_t)
                    _t = self._retTree
                    self.addASTChild(currentAST, self.returnAST)
                elif la1 and la1 in [PIR_FUNCTION_DEF]:
                    pass
                    tmp13_AST = None
                    tmp13_AST_in = None
                    tmp13_AST = self.astFactory.create(_t)
                    tmp13_AST_in = _t
                    self.addASTChild(currentAST, tmp13_AST)
                    self.match(_t,PIR_FUNCTION_DEF)
                    _t = _t.getNextSibling()
                else:
                        break
                    
                _cnt112 += 1
            if _cnt112 < 1:
                raise antlr.NoViableAltException(_t)
            past_expr_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_expr_list_AST
        self._retTree = _t
    
    def past_expr_line(self, _t):    
        
        past_expr_line_AST_in = None
        if _t != antlr.ASTNULL:
            past_expr_line_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_expr_line_AST = None
        E1_AST = None
        E1 = None
        E2_AST = None
        E2 = None
        E3_AST = None
        E3 = None
        p2_AST = None
        p2 = None
        p = None
        p_AST = None
        try:      ## for error handling
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [PIR_PRINT_PMC]:
                pass
                _t114 = _t
                tmp14_AST = None
                tmp14_AST_in = None
                tmp14_AST = self.astFactory.create(_t)
                tmp14_AST_in = _t
                _currentAST114 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,PIR_PRINT_PMC)
                _t = _t.getFirstChild()
                E1 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.past_expr(_t)
                _t = self._retTree
                E1_AST = self.returnAST
                currentAST = _currentAST114
                _t = _t114
                _t = _t.getNextSibling()
                past_expr_line_AST = currentAST.root
                past_expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E1_AST, self.astFactory.create(PIR_OP,"\nprint "), self.astFactory.create(PIR_OP,reg_name), self.astFactory.create(PIR_NEWLINE,"\nprint \"\\n\" # "))
                currentAST.root = past_expr_line_AST
                if (past_expr_line_AST != None) and (past_expr_line_AST.getFirstChild() != None):
                    currentAST.child = past_expr_line_AST.getFirstChild()
                else:
                    currentAST.child = past_expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [ASSIGN_OP]:
                pass
                _t115 = _t
                tmp15_AST = None
                tmp15_AST_in = None
                tmp15_AST = self.astFactory.create(_t)
                tmp15_AST_in = _t
                _currentAST115 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,ASSIGN_OP)
                _t = _t.getFirstChild()
                lex_name=self.past_namedExpression(_t)
                _t = self._retTree
                E2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.past_expr(_t)
                _t = self._retTree
                E2_AST = self.returnAST
                currentAST = _currentAST115
                _t = _t115
                _t = _t.getNextSibling()
                past_expr_line_AST = currentAST.root
                pir = "\n" + \
                     lex_name + " = " + reg_name + "\n # "
                past_expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E2_AST, self.astFactory.create(PIR_OP,pir))
                currentAST.root = past_expr_line_AST
                if (past_expr_line_AST != None) and (past_expr_line_AST.getFirstChild() != None):
                    currentAST.child = past_expr_line_AST.getFirstChild()
                else:
                    currentAST.child = past_expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [INCR]:
                pass
                _t116 = _t
                tmp16_AST = None
                tmp16_AST_in = None
                tmp16_AST = self.astFactory.create(_t)
                tmp16_AST_in = _t
                _currentAST116 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,INCR)
                _t = _t.getFirstChild()
                lex_name=self.past_namedExpression(_t)
                _t = self._retTree
                currentAST = _currentAST116
                _t = _t116
                _t = _t.getNextSibling()
                past_expr_line_AST = currentAST.root
                pir = "\n" + \
                     lex_name + " = " + lex_name + " + 1 \n # "
                past_expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), self.astFactory.create(PIR_OP,pir), self.astFactory.create(PIR_OP,"\nprint "), self.astFactory.create(PIR_OP,lex_name), self.astFactory.create(PIR_NEWLINE,"\nprint \"\\n\" # "))
                currentAST.root = past_expr_line_AST
                if (past_expr_line_AST != None) and (past_expr_line_AST.getFirstChild() != None):
                    currentAST.child = past_expr_line_AST.getFirstChild()
                else:
                    currentAST.child = past_expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [DECR]:
                pass
                _t117 = _t
                tmp17_AST = None
                tmp17_AST_in = None
                tmp17_AST = self.astFactory.create(_t)
                tmp17_AST_in = _t
                _currentAST117 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,DECR)
                _t = _t.getFirstChild()
                lex_name=self.past_namedExpression(_t)
                _t = self._retTree
                currentAST = _currentAST117
                _t = _t117
                _t = _t.getNextSibling()
                past_expr_line_AST = currentAST.root
                pir = "\n" + \
                     lex_name + " = " + lex_name + " - 1 \n # "
                past_expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), self.astFactory.create(PIR_OP,pir), self.astFactory.create(PIR_OP,"\nprint "), self.astFactory.create(PIR_OP,lex_name), self.astFactory.create(PIR_NEWLINE,"\nprint \"\\n\" # "))
                currentAST.root = past_expr_line_AST
                if (past_expr_line_AST != None) and (past_expr_line_AST.getFirstChild() != None):
                    currentAST.child = past_expr_line_AST.getFirstChild()
                else:
                    currentAST.child = past_expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [If]:
                pass
                _t118 = _t
                tmp18_AST = None
                tmp18_AST_in = None
                tmp18_AST = self.astFactory.create(_t)
                tmp18_AST_in = _t
                _currentAST118 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,If)
                _t = _t.getFirstChild()
                E3 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.relational_expr(_t)
                _t = self._retTree
                E3_AST = self.returnAST
                p2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                self.past_expr_line(_t)
                _t = self._retTree
                p2_AST = self.returnAST
                currentAST = _currentAST118
                _t = _t118
                _t = _t.getNextSibling()
                past_expr_line_AST = currentAST.root
                pir = "\n" + \
                     "unless " + reg_name + " goto LABEL_%d\n#" % self.label_num 
                past_expr_line_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E3_AST, self.astFactory.create(PIR_OP,pir), p2_AST, self.astFactory.create(PIR_OP,"\nLABEL_0:\n#"))
                currentAST.root = past_expr_line_AST
                if (past_expr_line_AST != None) and (past_expr_line_AST.getFirstChild() != None):
                    currentAST.child = past_expr_line_AST.getFirstChild()
                else:
                    currentAST.child = past_expr_line_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [PIR_OP]:
                pass
                p = _t
                p_AST_in = None
                p_AST = self.astFactory.create(p)
                self.match(_t,PIR_OP)
                _t = _t.getNextSibling()
                past_expr_line_AST = currentAST.root
                past_expr_line_AST = p_AST
                currentAST.root = past_expr_line_AST
                if (past_expr_line_AST != None) and (past_expr_line_AST.getFirstChild() != None):
                    currentAST.child = past_expr_line_AST.getFirstChild()
                else:
                    currentAST.child = past_expr_line_AST
                currentAST.advanceChildToEnd()
            else:
                    raise antlr.NoViableAltException(_t)
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_expr_line_AST
        self._retTree = _t
    
    def past_expr(self, _t):    
        reg_name = None
        
        past_expr_AST_in = None
        if _t != antlr.ASTNULL:
            past_expr_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_expr_AST = None
        try:      ## for error handling
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [PLUS]:
                pass
                reg_name=self.past_plus(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                past_expr_AST = currentAST.root
            elif la1 and la1 in [MINUS]:
                pass
                reg_name=self.past_minus(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                past_expr_AST = currentAST.root
            elif la1 and la1 in [MUL]:
                pass
                reg_name=self.past_mul(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                past_expr_AST = currentAST.root
            elif la1 and la1 in [DIV]:
                pass
                reg_name=self.past_div(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                past_expr_AST = currentAST.root
            elif la1 and la1 in [MOD]:
                pass
                reg_name=self.past_mod(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                past_expr_AST = currentAST.root
            elif la1 and la1 in [NUMBER,UNARY_MINUS]:
                pass
                reg_name=self.past_signExpression(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                past_expr_AST = currentAST.root
            elif la1 and la1 in [LETTER]:
                pass
                reg_name=self.past_namedExpression(_t)
                _t = self._retTree
                self.addASTChild(currentAST, self.returnAST)
                past_expr_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(_t)
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_expr_AST
        self._retTree = _t
        return reg_name
    
    def past_namedExpression(self, _t):    
        reg_name = None
        
        past_namedExpression_AST_in = None
        if _t != antlr.ASTNULL:
            past_namedExpression_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_namedExpression_AST = None
        l = None
        l_AST = None
        try:      ## for error handling
            pass
            l = _t
            l_AST_in = None
            l_AST = self.astFactory.create(l)
            self.addASTChild(currentAST, l_AST)
            self.match(_t,LETTER)
            _t = _t.getNextSibling()
            reg_name = l.getText() + "_lex";
            past_namedExpression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_namedExpression_AST
        self._retTree = _t
        return reg_name
    
    def past_plus(self, _t):    
        reg_name = None
        
        past_plus_AST_in = None
        if _t != antlr.ASTNULL:
            past_plus_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_plus_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t121 = _t
            tmp19_AST = None
            tmp19_AST_in = None
            tmp19_AST = self.astFactory.create(_t)
            tmp19_AST_in = _t
            _currentAST121 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,PLUS)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.past_expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.past_expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST121
            _t = _t121
            _t = _t.getNextSibling()
            past_plus_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = add " + reg_name_left + ", " + reg_name_right + "\n #"
            past_plus_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = past_plus_AST
            if (past_plus_AST != None) and (past_plus_AST.getFirstChild() != None):
                currentAST.child = past_plus_AST.getFirstChild()
            else:
                currentAST.child = past_plus_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_plus_AST
        self._retTree = _t
        return reg_name
    
    def past_minus(self, _t):    
        reg_name = None
        
        past_minus_AST_in = None
        if _t != antlr.ASTNULL:
            past_minus_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_minus_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t123 = _t
            tmp20_AST = None
            tmp20_AST_in = None
            tmp20_AST = self.astFactory.create(_t)
            tmp20_AST_in = _t
            _currentAST123 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,MINUS)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.past_expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.past_expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST123
            _t = _t123
            _t = _t.getNextSibling()
            past_minus_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = sub " + reg_name_left + ", " + reg_name_right + "\n #"
            past_minus_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = past_minus_AST
            if (past_minus_AST != None) and (past_minus_AST.getFirstChild() != None):
                currentAST.child = past_minus_AST.getFirstChild()
            else:
                currentAST.child = past_minus_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_minus_AST
        self._retTree = _t
        return reg_name
    
    def past_mul(self, _t):    
        reg_name = None
        
        past_mul_AST_in = None
        if _t != antlr.ASTNULL:
            past_mul_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_mul_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t125 = _t
            tmp21_AST = None
            tmp21_AST_in = None
            tmp21_AST = self.astFactory.create(_t)
            tmp21_AST_in = _t
            _currentAST125 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,MUL)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.past_expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.past_expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST125
            _t = _t125
            _t = _t.getNextSibling()
            past_mul_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = past_mul " + reg_name_left + ", " + reg_name_right + "\n #"
            past_mul_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = past_mul_AST
            if (past_mul_AST != None) and (past_mul_AST.getFirstChild() != None):
                currentAST.child = past_mul_AST.getFirstChild()
            else:
                currentAST.child = past_mul_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_mul_AST
        self._retTree = _t
        return reg_name
    
    def past_div(self, _t):    
        reg_name = None
        
        past_div_AST_in = None
        if _t != antlr.ASTNULL:
            past_div_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_div_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t127 = _t
            tmp22_AST = None
            tmp22_AST_in = None
            tmp22_AST = self.astFactory.create(_t)
            tmp22_AST_in = _t
            _currentAST127 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,DIV)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.past_expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.past_expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST127
            _t = _t127
            _t = _t.getNextSibling()
            past_div_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = past_div " + reg_name_left + ", " + reg_name_right + "\n #"
            past_div_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = past_div_AST
            if (past_div_AST != None) and (past_div_AST.getFirstChild() != None):
                currentAST.child = past_div_AST.getFirstChild()
            else:
                currentAST.child = past_div_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_div_AST
        self._retTree = _t
        return reg_name
    
    def past_mod(self, _t):    
        reg_name = None
        
        past_mod_AST_in = None
        if _t != antlr.ASTNULL:
            past_mod_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_mod_AST = None
        left_AST = None
        left = None
        right_AST = None
        right = None
        try:      ## for error handling
            pass
            _t129 = _t
            tmp23_AST = None
            tmp23_AST_in = None
            tmp23_AST = self.astFactory.create(_t)
            tmp23_AST_in = _t
            _currentAST129 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,MOD)
            _t = _t.getFirstChild()
            left = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_left=self.past_expr(_t)
            _t = self._retTree
            left_AST = self.returnAST
            right = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name_right=self.past_expr(_t)
            _t = self._retTree
            right_AST = self.returnAST
            currentAST = _currentAST129
            _t = _t129
            _t = _t.getNextSibling()
            past_mod_AST = currentAST.root
            reg_name = "$P%d" % self.reg_num
            self.reg_num = self.reg_num + 1
            pir = "\n" + \
                 reg_name + " = new .Float\n" + \
                 reg_name + " = past_mod " + reg_name_left + ", " + reg_name_right + "\n #"
            past_mod_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), left_AST, right_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = past_mod_AST
            if (past_mod_AST != None) and (past_mod_AST.getFirstChild() != None):
                currentAST.child = past_mod_AST.getFirstChild()
            else:
                currentAST.child = past_mod_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_mod_AST
        self._retTree = _t
        return reg_name
    
    def past_signExpression(self, _t):    
        reg_name = None
        
        past_signExpression_AST_in = None
        if _t != antlr.ASTNULL:
            past_signExpression_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_signExpression_AST = None
        i1_AST = None
        i1 = None
        i2_AST = None
        i2 = None
        try:      ## for error handling
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [NUMBER]:
                pass
                i1 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.integer(_t)
                _t = self._retTree
                i1_AST = self.returnAST
                self.addASTChild(currentAST, self.returnAST)
                past_signExpression_AST = currentAST.root
                pir = ""
                past_signExpression_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), past_signExpression_AST, self.astFactory.create(PIR_OP,pir));
                currentAST.root = past_signExpression_AST
                if (past_signExpression_AST != None) and (past_signExpression_AST.getFirstChild() != None):
                    currentAST.child = past_signExpression_AST.getFirstChild()
                else:
                    currentAST.child = past_signExpression_AST
                currentAST.advanceChildToEnd()
                past_signExpression_AST = currentAST.root
            elif la1 and la1 in [UNARY_MINUS]:
                pass
                _t131 = _t
                tmp24_AST = None
                tmp24_AST_in = None
                tmp24_AST = self.astFactory.create(_t)
                tmp24_AST_in = _t
                self.addASTChild(currentAST, tmp24_AST)
                _currentAST131 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,UNARY_MINUS)
                _t = _t.getFirstChild()
                i2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.integer(_t)
                _t = self._retTree
                i2_AST = self.returnAST
                self.addASTChild(currentAST, self.returnAST)
                currentAST = _currentAST131
                _t = _t131
                _t = _t.getNextSibling()
                past_signExpression_AST = currentAST.root
                pir = "\n" + \
                     "neg " + reg_name + "\n#"
                past_signExpression_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), past_signExpression_AST, self.astFactory.create(PIR_OP,pir));
                currentAST.root = past_signExpression_AST
                if (past_signExpression_AST != None) and (past_signExpression_AST.getFirstChild() != None):
                    currentAST.child = past_signExpression_AST.getFirstChild()
                else:
                    currentAST.child = past_signExpression_AST
                currentAST.advanceChildToEnd()
                past_signExpression_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(_t)
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_signExpression_AST
        self._retTree = _t
        return reg_name
    

_tokenNames = [
    "<0>", 
    "EOF", 
    "<2>", 
    "NULL_TREE_LOOKAHEAD", 
    "NEWLINE", 
    "STRING", 
    "LETTER", 
    "DIGIT", 
    "INTEGER", 
    "NUMBER", 
    "MUL", 
    "DIV", 
    "MOD", 
    "ASSIGN_OP", 
    "REL_OP", 
    "INCR", 
    "DECR", 
    "Quit", 
    "Define", 
    "Auto", 
    "If", 
    "KEYWORDS", 
    "LPAREN", 
    "RPAREN", 
    "COMMA", 
    "PLUS", 
    "MINUS", 
    "SEMICOLON", 
    "LBRACKET", 
    "RBRACKET", 
    "CARET", 
    "LCURLY", 
    "RCURLY", 
    "WS", 
    "ML_COMMENT", 
    "PIR_OP", 
    "UNARY_MINUS", 
    "PIR_PRINT_PMC", 
    "PIR_FUNCTION_DEF", 
    "PIR_FOOTER", 
    "PIR_HEADER", 
    "PIR_NOOP", 
    "PIR_COMMENT", 
    "PIR_NEWLINE"
]
    
