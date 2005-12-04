### $ANTLR 2.7.5 (20051104): "antlr2past.g" -> "Antlr2PastTreeWalker.py"$
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
    def gen_pir_past(self, _t):    
        
        gen_pir_past_AST_in = None
        if _t != antlr.ASTNULL:
            gen_pir_past_AST_in = _t
        self.returnAST = None
        currentAST = antlr.ASTPair()
        gen_pir_past_AST = None
        try:      ## for error handling
            pass
            tmp1_AST = None
            tmp1_AST_in = None
            tmp1_AST = self.astFactory.create(_t)
            tmp1_AST_in = _t
            self.match(_t,PAST_Stmts)
            _t = _t.getNextSibling()
            gen_pir_past_AST = currentAST.root
            pir = """
                 .local pmc val
                 val = new 'PAST::Val'
                 val.set_node('1', 0, 1 )
                 
                 .local pmc exp
                 exp = new 'PAST::Exp'
                 $P4 = new PerlArray
                 push $P4, val 
                 exp.set_node('1', 1, $P4)
                 
                 .local pmc op
                 op = new 'PAST::Op'
                 $P5 = new PerlArray
                 push $P5, exp 
                 op.set_node('1', 1, 'print' ,$P5)
                 
                 .local pmc exp
                 exp = new 'PAST::Exp'
                 $P6 = new PerlArray
                 push $P6, op 
                 exp.set_node('1', 1 ,$P6)
                 
                 .local pmc stmt1
                 stmt1 = new 'PAST::Stmt'
                 $P7 = new PerlArray
                 push $P7, exp 
                 stmt1.set_node('1', 1 ,$P7)
                 
                 .local pmc val
                 val = new 'PAST::Val'
                 val.set_node('1', 0, '"\\n"' )
                 
                 .local pmc exp
                 exp = new 'PAST::Exp'
                 $P4 = new PerlArray
                 push $P4, val 
                 exp.set_node('1', 1, $P4)
                 
                 .local pmc op
                 op = new 'PAST::Op'
                 $P5 = new PerlArray
                 push $P5, exp 
                 op.set_node('1', 1, 'print' ,$P5)
                 
                 .local pmc exp
                 exp = new 'PAST::Exp'
                 $P6 = new PerlArray
                 push $P6, op 
                 exp.set_node('1', 1 ,$P6)
                 
                 .local pmc stmt2
                 stmt2 = new 'PAST::Stmt'
                 $P7 = new PerlArray
                 push $P7, exp 
                 stmt2.set_node('1', 1 ,$P7)
            
            
                 .local pmc stmts
                 stmts = new 'PAST::Stmts'
                 $P8 = new PerlArray
                 push $P8, stmt1
                 push $P8, stmt2
                 stmts.set_node('1', 1, $P8)
                 
            #"""
            gen_pir_past_AST = antlr.make(self.astFactory.create(PIR_OP,pir));
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
    "PAST_Stmts"
]
    
