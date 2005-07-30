### $ANTLR 2.7.5 (20050425): "bc_python.g" -> "BcTreeWalker.py"$
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
DIGIT = 4
NUMBER = 5
STRING = 6
NEWLINE = 7
WS = 8
IDENT = 9
LETTER = 10
DOT = 11
BECOMES = 12
COLON = 13
SEMI = 14
COMMA = 15
ASSIGN_OP = 16
LBRACKET = 17
RBRACKET = 18
DOTDOT = 19
LPAREN = 20
RPAREN = 21
REL_OP = 22
PLUS = 23
MINUS = 24
INCR_DECR = 25
MUL = 26
DIV = 27
MOD = 28
PIR_OP = 29
UNARY_MINUS = 30
LITERAL_quit = 31
LITERAL_var = 32
LITERAL_constant = 33
LITERAL_type = 34
LITERAL_array = 35
LITERAL_of = 36
LITERAL_record = 37
LITERAL_end = 38
LITERAL_Integer = 39
LITERAL_Boolean = 40
LITERAL_procedure = 41
LITERAL_exit = 42
LITERAL_when = 43
LITERAL_return = 44
LITERAL_if = 45
LITERAL_then = 46
LITERAL_elsif = 47
LITERAL_else = 48
LITERAL_while = 49
LITERAL_loop = 50
LITERAL_put = 51
LITERAL_get = 52
LITERAL_newLine = 53
LITERAL_skipLine = 54
LITERAL_not = 55
NOT_EQUALS = 56
LITERAL_and = 57
LITERAL_or = 58
PIR_FOOTER = 59
PIR_HEADER = 60
PIR_NOOP = 61
PIR_COMMENT = 62
PIR_NEWLINE = 63

### user code>>>

### user code<<<

class Walker(antlr.TreeParser):
    
    # ctor ..
    def __init__(self, *args, **kwargs):
        antlr.TreeParser.__init__(self, *args, **kwargs)
        self.tokenNames = _tokenNames
        ### __init__ header action >>> 
        self.reg_num = 0;        # counter for unlimited number of PMC registers
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
            _t118 = _t
            tmp1_AST = None
            tmp1_AST_in = None
            tmp1_AST = self.astFactory.create(_t)
            tmp1_AST_in = _t
            _currentAST118 = currentAST.copy()
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
            currentAST = _currentAST118
            _t = _t118
            _t = _t.getNextSibling()
            plus_AST = currentAST.root
            reg_name = "P%d" % self.reg_num
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
            _t120 = _t
            tmp2_AST = None
            tmp2_AST_in = None
            tmp2_AST = self.astFactory.create(_t)
            tmp2_AST_in = _t
            _currentAST120 = currentAST.copy()
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
            currentAST = _currentAST120
            _t = _t120
            _t = _t.getNextSibling()
            minus_AST = currentAST.root
            reg_name = "P%d" % self.reg_num
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
            _t122 = _t
            tmp3_AST = None
            tmp3_AST_in = None
            tmp3_AST = self.astFactory.create(_t)
            tmp3_AST_in = _t
            _currentAST122 = currentAST.copy()
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
            currentAST = _currentAST122
            _t = _t122
            _t = _t.getNextSibling()
            mul_AST = currentAST.root
            reg_name = "P%d" % self.reg_num
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
            _t124 = _t
            tmp4_AST = None
            tmp4_AST_in = None
            tmp4_AST = self.astFactory.create(_t)
            tmp4_AST_in = _t
            _currentAST124 = currentAST.copy()
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
            currentAST = _currentAST124
            _t = _t124
            _t = _t.getNextSibling()
            div_AST = currentAST.root
            reg_name = "P%d" % self.reg_num
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
            _t126 = _t
            tmp5_AST = None
            tmp5_AST_in = None
            tmp5_AST = self.astFactory.create(_t)
            tmp5_AST_in = _t
            _currentAST126 = currentAST.copy()
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
            currentAST = _currentAST126
            _t = _t126
            _t = _t.getNextSibling()
            mod_AST = currentAST.root
            reg_name = "P%d" % self.reg_num
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
            reg_name = "P%d" % self.reg_num
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
                _t129 = _t
                tmp6_AST = None
                tmp6_AST_in = None
                tmp6_AST = self.astFactory.create(_t)
                tmp6_AST_in = _t
                self.addASTChild(currentAST, tmp6_AST)
                _currentAST129 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,UNARY_MINUS)
                _t = _t.getFirstChild()
                i2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_name=self.integer(_t)
                _t = self._retTree
                i2_AST = self.returnAST
                self.addASTChild(currentAST, self.returnAST)
                currentAST = _currentAST129
                _t = _t129
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
    
    def expr_line(self, _t):    
        
        expr_line_AST_in = None
        if _t != antlr.ASTNULL:
            expr_line_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expr_line_AST = None
        E_AST = None
        E = None
        try:      ## for error handling
            pass
            E = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_name=self.expr(_t)
            _t = self._retTree
            E_AST = self.returnAST
            self.addASTChild(currentAST, self.returnAST)
            expr = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E_AST, self.astFactory.create(PIR_OP,"\nprint "), self.astFactory.create(PIR_OP,reg_name), self.astFactory.create(PIR_NEWLINE,"\nprint \"\\n\" # "))
            expr_line_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = expr_line_AST
        self._retTree = _t
    
    def expr_list(self, _t):    
        
        expr_list_AST_in = None
        if _t != antlr.ASTNULL:
            expr_list_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expr_list_AST = None
        try:      ## for error handling
            pass
            _cnt134= 0
            while True:
                if not _t:
                    _t = antlr.ASTNULL
                if (_tokenSet_0.member(_t.getType())):
                    pass
                    self.expr(_t)
                    _t = self._retTree
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
                _cnt134 += 1
            if _cnt134 < 1:
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
        A_AST = None
        A = None
        B_AST = None
        B = None
        try:      ## for error handling
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [NUMBER,PLUS,MINUS,MUL,DIV,MOD,UNARY_MINUS]:
                pass
                A = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                self.expr_line(_t)
                _t = self._retTree
                A_AST = self.returnAST
                gen_pir_AST = currentAST.root
                gen_pir_AST = antlr.make(self.astFactory.create(PIR_HEADER,"pir header\n#"), A_AST, self.astFactory.create(PIR_FOOTER,"pir footer\nend\n#"));
                currentAST.root = gen_pir_AST
                if (gen_pir_AST != None) and (gen_pir_AST.getFirstChild() != None):
                    currentAST.child = gen_pir_AST.getFirstChild()
                else:
                    currentAST.child = gen_pir_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [PIR_OP]:
                pass
                _t136 = _t
                tmp7_AST = None
                tmp7_AST_in = None
                tmp7_AST = self.astFactory.create(_t)
                tmp7_AST_in = _t
                _currentAST136 = currentAST.copy()
                currentAST.root = currentAST.child
                currentAST.child = None
                self.match(_t,PIR_OP)
                _t = _t.getFirstChild()
                B = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                self.expr_line(_t)
                _t = self._retTree
                B_AST = self.returnAST
                currentAST = _currentAST136
                _t = _t136
                _t = _t.getNextSibling()
                gen_pir_AST = currentAST.root
                gen_pir_AST = antlr.make(self.astFactory.create(PIR_HEADER,"pir header tree\n#"), B_AST, self.astFactory.create(PIR_FOOTER,"pir footer tree\nend\n#"));
                currentAST.root = gen_pir_AST
                if (gen_pir_AST != None) and (gen_pir_AST.getFirstChild() != None):
                    currentAST.child = gen_pir_AST.getFirstChild()
                else:
                    currentAST.child = gen_pir_AST
                currentAST.advanceChildToEnd()
            else:
                    raise antlr.NoViableAltException(_t)
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = gen_pir_AST
        self._retTree = _t
    

_tokenNames = [
    "<0>", 
    "EOF", 
    "<2>", 
    "NULL_TREE_LOOKAHEAD", 
    "DIGIT", 
    "NUMBER", 
    "STRING", 
    "NEWLINE", 
    "WS", 
    "IDENT", 
    "LETTER", 
    "DOT", 
    "BECOMES", 
    "COLON", 
    "SEMI", 
    "COMMA", 
    "ASSIGN_OP", 
    "LBRACKET", 
    "RBRACKET", 
    "DOTDOT", 
    "LPAREN", 
    "RPAREN", 
    "REL_OP", 
    "PLUS", 
    "MINUS", 
    "INCR_DECR", 
    "MUL", 
    "DIV", 
    "MOD", 
    "PIR_OP", 
    "UNARY_MINUS", 
    "\"quit\"", 
    "\"var\"", 
    "\"constant\"", 
    "\"type\"", 
    "\"array\"", 
    "\"of\"", 
    "\"record\"", 
    "\"end\"", 
    "\"Integer\"", 
    "\"Boolean\"", 
    "\"procedure\"", 
    "\"exit\"", 
    "\"when\"", 
    "\"return\"", 
    "\"if\"", 
    "\"then\"", 
    "\"elsif\"", 
    "\"else\"", 
    "\"while\"", 
    "\"loop\"", 
    "\"put\"", 
    "\"get\"", 
    "\"newLine\"", 
    "\"skipLine\"", 
    "\"not\"", 
    "NOT_EQUALS", 
    "\"and\"", 
    "\"or\"", 
    "PIR_FOOTER", 
    "PIR_HEADER", 
    "PIR_NOOP", 
    "PIR_COMMENT", 
    "PIR_NEWLINE"
]
    

### generate bit set
def mk_tokenSet_0(): 
    ### var1
    data = [ 1568669728L, 0L]
    return data
_tokenSet_0 = antlr.BitSet(mk_tokenSet_0())
