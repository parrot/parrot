### $ANTLR 2.7.5 (20050416): "antlr2past.g" -> "Antlr2PastTreeWalker.py"$
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
PAST_Stmts = 44
PAST_Stmt = 45
PAST_Exp = 46
PAST_Op = 47
PAST_Val = 48

### user code>>>

### user code<<<

class Walker(antlr.TreeParser):
    
    # ctor ..
    def __init__(self, *args, **kwargs):
        antlr.TreeParser.__init__(self, *args, **kwargs)
        self.tokenNames = _tokenNames
        ### __init__ header action >>> 
        self.reg       = 10;  # counter for unlimited number of PMC registers
        self.label_num = 0;  # counter for generation jump labels
        self.level     = 0;  # for indentation
        ### __init__ header action <<< 
    
    ### user action >>>
    ### user action <<<
    def gen_pir_past(self, _t):    
        
        gen_pir_past_AST_in = None
        if _t != antlr.ASTNULL:
            gen_pir_past_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        gen_pir_past_AST = None
        S1_AST = None
        S1 = None
        S2_AST = None
        S2 = None
        try:      ## for error handling
            pass
            _t2 = _t
            tmp1_AST = None
            tmp1_AST_in = None
            tmp1_AST = self.astFactory.create(_t)
            tmp1_AST_in = _t
            _currentAST2 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,PAST_Stmts)
            _t = _t.getFirstChild()
            S1 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_S1=self.past_stmt(_t)
            _t = self._retTree
            S1_AST = self.returnAST
            S2 = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_S2=self.past_stmt(_t)
            _t = self._retTree
            S2_AST = self.returnAST
            currentAST = _currentAST2
            _t = _t2
            _t = _t.getNextSibling()
            gen_pir_past_AST = currentAST.root
            pir = """
            # stmts will be used by the executing part 
            .local pmc stmts
            stmts = new 'PAST::Stmts'
            
            .local pmc stmts_children
            stmts_children = new PerlArray
            push stmts_children, $P%d
            push stmts_children, $P%d
            
            stmts.set_node('1', 1, stmts_children)
                 
            #""" % ( reg_S1, reg_S2 )
            
            gen_pir_past_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), S1_AST, S2_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = gen_pir_past_AST
            if (gen_pir_past_AST != None) and (gen_pir_past_AST.getFirstChild() != None):
                currentAST.child = gen_pir_past_AST.getFirstChild()
            else:
                currentAST.child = gen_pir_past_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = gen_pir_past_AST
        self._retTree = _t
    
    def past_stmt(self, _t):    
        reg = None
        
        past_stmt_AST_in = None
        if _t != antlr.ASTNULL:
            past_stmt_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_stmt_AST = None
        E_AST = None
        E = None
        try:      ## for error handling
            pass
            _t4 = _t
            tmp2_AST = None
            tmp2_AST_in = None
            tmp2_AST = self.astFactory.create(_t)
            tmp2_AST_in = _t
            _currentAST4 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,PAST_Stmt)
            _t = _t.getFirstChild()
            E = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_E=self.past_exp(_t)
            _t = self._retTree
            E_AST = self.returnAST
            currentAST = _currentAST4
            _t = _t4
            _t = _t.getNextSibling()
            past_stmt_AST = currentAST.root
            reg = self.reg;
            self.reg = self.reg + 10;
            pir = """
            $P%d = new 'PAST::Stmt'
            $P%d = new PerlArray
            
            push $P%d, $P%d 
            $P%d.set_node('1', 1 ,$P%d)
            #""" % (
            reg,
            reg + 1,
            reg + 1, reg_E,
            reg, reg + 1
            )
            
            past_stmt_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = past_stmt_AST
            if (past_stmt_AST != None) and (past_stmt_AST.getFirstChild() != None):
                currentAST.child = past_stmt_AST.getFirstChild()
            else:
                currentAST.child = past_stmt_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_stmt_AST
        self._retTree = _t
        return reg
    
    def past_exp(self, _t):    
        reg = None
        
        past_exp_AST_in = None
        if _t != antlr.ASTNULL:
            past_exp_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_exp_AST = None
        O_AST = None
        O = None
        V_AST = None
        V = None
        try:      ## for error handling
            pass
            _t6 = _t
            tmp3_AST = None
            tmp3_AST_in = None
            tmp3_AST = self.astFactory.create(_t)
            tmp3_AST_in = _t
            _currentAST6 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,PAST_Exp)
            _t = _t.getFirstChild()
            if not _t:
                _t = antlr.ASTNULL
            la1 = _t.getType()
            if False:
                pass
            elif la1 and la1 in [PAST_Op]:
                pass
                O = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_O=self.past_op(_t)
                _t = self._retTree
                O_AST = self.returnAST
                past_exp_AST = currentAST.root
                reg = self.reg;
                self.reg = self.reg + 10;
                pir = """
                         $P%d = new 'PAST::Exp'
                         $P%d = new PerlArray
                
                         push $P%d, $P%d 
                         $P%d.set_node('1', 1, $P%d)
                #""" % (
                         reg,
                         reg + 1,
                
                         reg + 1, reg_O,
                         reg, reg + 1
                )
                
                past_exp_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), O_AST, self.astFactory.create(PIR_OP,pir));
                currentAST.root = past_exp_AST
                if (past_exp_AST != None) and (past_exp_AST.getFirstChild() != None):
                    currentAST.child = past_exp_AST.getFirstChild()
                else:
                    currentAST.child = past_exp_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [PAST_Val]:
                pass
                V = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
                reg_V=self.past_val(_t)
                _t = self._retTree
                V_AST = self.returnAST
                past_exp_AST = currentAST.root
                reg = self.reg;
                self.reg = self.reg + 10;
                pir = """
                         $P%d = new 'PAST::Exp'
                         $P%d = new PerlArray
                
                         push $P%d, $P%d 
                         $P%d.set_node('1', 1, $P%d)
                #""" % (
                         reg,
                         reg + 1,
                
                         reg + 1, reg_V,
                         reg, reg + 1
                )
                
                past_exp_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), V_AST, self.astFactory.create(PIR_OP,pir));
                currentAST.root = past_exp_AST
                if (past_exp_AST != None) and (past_exp_AST.getFirstChild() != None):
                    currentAST.child = past_exp_AST.getFirstChild()
                else:
                    currentAST.child = past_exp_AST
                currentAST.advanceChildToEnd()
            else:
                    raise antlr.NoViableAltException(_t)
                
            currentAST = _currentAST6
            _t = _t6
            _t = _t.getNextSibling()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_exp_AST
        self._retTree = _t
        return reg
    
    def past_op(self, _t):    
        reg = None
        
        past_op_AST_in = None
        if _t != antlr.ASTNULL:
            past_op_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_op_AST = None
        E_AST = None
        E = None
        try:      ## for error handling
            pass
            _t9 = _t
            tmp4_AST = None
            tmp4_AST_in = None
            tmp4_AST = self.astFactory.create(_t)
            tmp4_AST_in = _t
            _currentAST9 = currentAST.copy()
            currentAST.root = currentAST.child
            currentAST.child = None
            self.match(_t,PAST_Op)
            _t = _t.getFirstChild()
            E = antlr.ifelse(_t == antlr.ASTNULL, None, _t)
            reg_E=self.past_exp(_t)
            _t = self._retTree
            E_AST = self.returnAST
            currentAST = _currentAST9
            _t = _t9
            _t = _t.getNextSibling()
            past_op_AST = currentAST.root
            reg = self.reg;
            self.reg = self.reg + 10;
            pir = """
                 $P%d = new 'PAST::Op'
                 $P%d = new PerlArray
            
                 push $P%d, $P%d 
                 $P%d.set_node('1', 1, 'print' ,$P%d)
            #""" % (
                 reg,
                 reg + 1,
            
                 reg + 1, reg_E,
                 reg, reg + 1
            )
            
            past_op_AST = antlr.make(self.astFactory.create(PIR_NOOP,"noop"), E_AST, self.astFactory.create(PIR_OP,pir));
            currentAST.root = past_op_AST
            if (past_op_AST != None) and (past_op_AST.getFirstChild() != None):
                currentAST.child = past_op_AST.getFirstChild()
            else:
                currentAST.child = past_op_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_op_AST
        self._retTree = _t
        return reg
    
    def past_val(self, _t):    
        reg = None
        
        past_val_AST_in = None
        if _t != antlr.ASTNULL:
            past_val_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        past_val_AST = None
        V = None
        V_AST = None
        try:      ## for error handling
            pass
            V = _t
            V_AST_in = None
            V_AST = self.astFactory.create(V)
            self.match(_t,PAST_Val)
            _t = _t.getNextSibling()
            past_val_AST = currentAST.root
            reg = self.reg;
            self.reg = self.reg + 10;
            pir = """
                         $P%d = new 'PAST::Val'
                         $P%d.set_node('1', 0, '%s' )
            #""" % ( reg, reg, V.getText() )
            
            past_val_AST = antlr.make(self.astFactory.create(PIR_OP,pir));
            currentAST.root = past_val_AST
            if (past_val_AST != None) and (past_val_AST.getFirstChild() != None):
                currentAST.child = past_val_AST.getFirstChild()
            else:
                currentAST.child = past_val_AST
            currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            if _t:
                _t = _t.getNextSibling()
        
        self.returnAST = past_val_AST
        self._retTree = _t
        return reg
    

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
    "PIR_NEWLINE", 
    "PAST_Stmts", 
    "PAST_Stmt", 
    "PAST_Exp", 
    "PAST_Op", 
    "PAST_Val"
]
    
