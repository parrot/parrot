### $ANTLR 2.7.5 (20050425): "bc_python.g" -> "BcParser.py"$
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
### preamble action>>>

### preamble action <<<

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
KEYWORDS = 20
LPAREN = 21
RPAREN = 22
COMMA = 23
PLUS = 24
MINUS = 25
SEMICOLON = 26
LBRACKET = 27
RBRACKET = 28
CARET = 29
LCURLY = 30
RCURLY = 31
WS = 32
ML_COMMENT = 33
PIR_OP = 34
UNARY_MINUS = 35
PIR_PRINT_PMC = 36
PIR_FUNCTION_DEF = 37
PIR_ASSIGN = 38
PIR_FOOTER = 39
PIR_HEADER = 40
PIR_NOOP = 41
PIR_COMMENT = 42
PIR_NEWLINE = 43

class Parser(antlr.LLkParser):
    ### user action >>>
    ### user action <<<
    
    def __init__(self, *args, **kwargs):
        antlr.LLkParser.__init__(self, *args, **kwargs)
        self.tokenNames = _tokenNames
        self.buildTokenTypeASTClassMap()
        self.astFactory = antlr.ASTFactory(self.getTokenTypeToASTClassMap())
        self.astFactory.setASTNodeClass()
        ### __init__ header action >>> 
        self.do_print = 1;    # indicate whether an expression should be printed
        ### __init__ header action <<< 
        
    def program(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        program_AST = None
        try:      ## for error handling
            pass
            while True:
                if (_tokenSet_0.member(self.LA(1))):
                    pass
                    self.input_item()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            tmp11_AST = None
            tmp11_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp11_AST)
            self.match(EOF_TYPE)
            program_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_1)
        
        self.returnAST = program_AST
    
    def input_item(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        input_item_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [NEWLINE,STRING,LETTER,NUMBER,Quit,LPAREN,MINUS,LCURLY]:
                pass
                self.semicolon_list()
                self.addASTChild(currentAST, self.returnAST)
                self.match(NEWLINE)
                input_item_AST = currentAST.root
            elif la1 and la1 in [Define]:
                pass
                self.function()
                self.addASTChild(currentAST, self.returnAST)
                input_item_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_2)
        
        self.returnAST = input_item_AST
    
    def semicolon_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        semicolon_list_AST = None
        try:      ## for error handling
            pass
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [STRING,LETTER,NUMBER,Quit,LPAREN,MINUS,LCURLY]:
                pass
                self.statement()
                self.addASTChild(currentAST, self.returnAST)
                while True:
                    if (self.LA(1)==SEMICOLON):
                        pass
                        self.match(SEMICOLON)
                        self.statement()
                        self.addASTChild(currentAST, self.returnAST)
                    else:
                        break
                    
            elif la1 and la1 in [NEWLINE]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            semicolon_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_3)
        
        self.returnAST = semicolon_list_AST
    
    def function(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        function_AST = None
        try:      ## for error handling
            pass
            tmp14_AST = None
            tmp14_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp14_AST)
            self.match(Define)
            tmp15_AST = None
            tmp15_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp15_AST)
            self.match(LETTER)
            tmp16_AST = None
            tmp16_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp16_AST)
            self.match(LPAREN)
            self.opt_parameter_list()
            self.addASTChild(currentAST, self.returnAST)
            tmp17_AST = None
            tmp17_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp17_AST)
            self.match(RPAREN)
            tmp18_AST = None
            tmp18_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp18_AST)
            self.match(LCURLY)
            tmp19_AST = None
            tmp19_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp19_AST)
            self.match(NEWLINE)
            self.opt_auto_define_list()
            self.addASTChild(currentAST, self.returnAST)
            self.statement_list()
            self.addASTChild(currentAST, self.returnAST)
            tmp20_AST = None
            tmp20_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp20_AST)
            self.match(RCURLY)
            function_AST = currentAST.root
            function_AST = antlr.make(self.astFactory.create(PIR_FUNCTION_DEF,"function definition"))
            currentAST.root = function_AST
            if (function_AST != None) and (function_AST.getFirstChild() != None):
                currentAST.child = function_AST.getFirstChild()
            else:
                currentAST.child = function_AST
            currentAST.advanceChildToEnd()
            function_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_2)
        
        self.returnAST = function_AST
    
    def statement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        statement_AST = None
        a = None
        a_AST = None
        pir = "\n#\n";
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LETTER,NUMBER,LPAREN,MINUS]:
                pass
                self.printable_expression()
                self.addASTChild(currentAST, self.returnAST)
                statement_AST = currentAST.root
            elif la1 and la1 in [STRING]:
                pass
                a = self.LT(1)
                a_AST = self.astFactory.create(a)
                self.addASTChild(currentAST, a_AST)
                self.match(STRING)
                statement_AST = currentAST.root
                pir += "print '" + a.getText() + "'\n # ";
                statement_AST = antlr.make(self.astFactory.create(PIR_OP,pir))
                currentAST.root = statement_AST
                if (statement_AST != None) and (statement_AST.getFirstChild() != None):
                    currentAST.child = statement_AST.getFirstChild()
                else:
                    currentAST.child = statement_AST
                currentAST.advanceChildToEnd()
                statement_AST = currentAST.root
            elif la1 and la1 in [Quit]:
                pass
                tmp21_AST = None
                tmp21_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp21_AST)
                self.match(Quit)
                statement_AST = currentAST.root
                pir += "end\n # ";
                statement_AST = antlr.make(self.astFactory.create(PIR_OP,pir))
                currentAST.root = statement_AST
                if (statement_AST != None) and (statement_AST.getFirstChild() != None):
                    currentAST.child = statement_AST.getFirstChild()
                else:
                    currentAST.child = statement_AST
                currentAST.advanceChildToEnd()
                statement_AST = currentAST.root
            elif la1 and la1 in [LCURLY]:
                pass
                self.match(LCURLY)
                self.statement_list()
                self.addASTChild(currentAST, self.returnAST)
                self.match(RCURLY)
                statement_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_4)
        
        self.returnAST = statement_AST
    
    def statement_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        statement_list_AST = None
        try:      ## for error handling
            if (_tokenSet_5.member(self.LA(1))):
                pass
                while True:
                    la1 = self.LA(1)
                    if False:
                        pass
                    elif la1 and la1 in [STRING,LETTER,NUMBER,Quit,LPAREN,MINUS,LCURLY]:
                        pass
                        self.statement()
                        self.addASTChild(currentAST, self.returnAST)
                    elif la1 and la1 in [NEWLINE]:
                        pass
                        self.match(NEWLINE)
                    else:
                            break
                        
                statement_list_AST = currentAST.root
            elif (self.LA(1)==RCURLY):
                pass
                statement_list_AST = currentAST.root
            else:
                raise antlr.NoViableAltException(self.LT(1), self.getFilename())
            
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_6)
        
        self.returnAST = statement_list_AST
    
    def printable_expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        printable_expression_AST = None
        e_AST = None
        try:      ## for error handling
            pass
            self.expression()
            e_AST = self.returnAST
            self.addASTChild(currentAST, self.returnAST)
            printable_expression_AST = currentAST.root
            if self.do_print:
             printable_expression_AST = antlr.make(self.astFactory.create(PIR_PRINT_PMC,"print"), e_AST)
            else:
             printable_expression_AST = antlr.make(self.astFactory.create(PIR_ASSIGN,"assign"), e_AST)
             self.do_print = 1
            currentAST.root = printable_expression_AST
            if (printable_expression_AST != None) and (printable_expression_AST.getFirstChild() != None):
                currentAST.child = printable_expression_AST.getFirstChild()
            else:
                currentAST.child = printable_expression_AST
            currentAST.advanceChildToEnd()
            printable_expression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_4)
        
        self.returnAST = printable_expression_AST
    
    def opt_parameter_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        opt_parameter_list_AST = None
        try:      ## for error handling
            pass
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LETTER]:
                pass
                self.parameter_list()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [RPAREN]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            opt_parameter_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_7)
        
        self.returnAST = opt_parameter_list_AST
    
    def opt_auto_define_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        opt_auto_define_list_AST = None
        try:      ## for error handling
            pass
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [Auto]:
                pass
                tmp25_AST = None
                tmp25_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp25_AST)
                self.match(Auto)
                self.define_list()
                self.addASTChild(currentAST, self.returnAST)
                la1 = self.LA(1)
                if False:
                    pass
                elif la1 and la1 in [NEWLINE]:
                    pass
                    tmp26_AST = None
                    tmp26_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp26_AST)
                    self.match(NEWLINE)
                elif la1 and la1 in [SEMICOLON]:
                    pass
                    tmp27_AST = None
                    tmp27_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp27_AST)
                    self.match(SEMICOLON)
                else:
                        raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                    
            elif la1 and la1 in [NEWLINE,STRING,LETTER,NUMBER,Quit,LPAREN,MINUS,LCURLY,RCURLY]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            opt_auto_define_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_5)
        
        self.returnAST = opt_auto_define_list_AST
    
    def parameter_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        parameter_list_AST = None
        try:      ## for error handling
            pass
            self.define_list()
            self.addASTChild(currentAST, self.returnAST)
            parameter_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_7)
        
        self.returnAST = parameter_list_AST
    
    def define_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        define_list_AST = None
        try:      ## for error handling
            pass
            tmp28_AST = None
            tmp28_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp28_AST)
            self.match(LETTER)
            while True:
                if (self.LA(1)==COMMA):
                    pass
                    tmp29_AST = None
                    tmp29_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp29_AST)
                    self.match(COMMA)
                    tmp30_AST = None
                    tmp30_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp30_AST)
                    self.match(LETTER)
                else:
                    break
                
            define_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_8)
        
        self.returnAST = define_list_AST
    
    def opt_argument_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        opt_argument_list_AST = None
        try:      ## for error handling
            pass
            self.argument_list()
            self.addASTChild(currentAST, self.returnAST)
            opt_argument_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_1)
        
        self.returnAST = opt_argument_list_AST
    
    def argument_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        argument_list_AST = None
        try:      ## for error handling
            pass
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            argument_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_1)
        
        self.returnAST = argument_list_AST
    
    def expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expression_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LETTER]:
                pass
                self.named_expression()
                self.addASTChild(currentAST, self.returnAST)
                la1 = self.LA(1)
                if False:
                    pass
                elif la1 and la1 in [ASSIGN_OP]:
                    pass
                    self.match(ASSIGN_OP)
                    self.expression()
                    self.addASTChild(currentAST, self.returnAST)
                    self.do_print = 0
                elif la1 and la1 in [EOF,NEWLINE,STRING,LETTER,NUMBER,Quit,LPAREN,MINUS,SEMICOLON,LCURLY,RCURLY]:
                    pass
                else:
                        raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                    
                expression_AST = currentAST.root
            elif la1 and la1 in [NUMBER,LPAREN,MINUS]:
                pass
                self.adding_expression()
                self.addASTChild(currentAST, self.returnAST)
                expression_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_9)
        
        self.returnAST = expression_AST
    
    def relational_expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        relational_expression_AST = None
        try:      ## for error handling
            pass
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            relational_expression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_1)
        
        self.returnAST = relational_expression_AST
    
    def return_expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        return_expression_AST = None
        try:      ## for error handling
            pass
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            return_expression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_1)
        
        self.returnAST = return_expression_AST
    
    def named_expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        named_expression_AST = None
        try:      ## for error handling
            pass
            tmp32_AST = None
            tmp32_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp32_AST)
            self.match(LETTER)
            named_expression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_10)
        
        self.returnAST = named_expression_AST
    
    def adding_expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        adding_expression_AST = None
        try:      ## for error handling
            pass
            self.multiplying_expression()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if (self.LA(1)==PLUS or self.LA(1)==MINUS):
                    pass
                    la1 = self.LA(1)
                    if False:
                        pass
                    elif la1 and la1 in [PLUS]:
                        pass
                        tmp33_AST = None
                        tmp33_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp33_AST)
                        self.match(PLUS)
                    elif la1 and la1 in [MINUS]:
                        pass
                        tmp34_AST = None
                        tmp34_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp34_AST)
                        self.match(MINUS)
                    else:
                            raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                        
                    self.multiplying_expression()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            adding_expression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_11)
        
        self.returnAST = adding_expression_AST
    
    def multiplying_expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        multiplying_expression_AST = None
        try:      ## for error handling
            pass
            self.sign_expression()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if ((self.LA(1) >= MUL and self.LA(1) <= MOD)):
                    pass
                    la1 = self.LA(1)
                    if False:
                        pass
                    elif la1 and la1 in [MUL]:
                        pass
                        tmp35_AST = None
                        tmp35_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp35_AST)
                        self.match(MUL)
                    elif la1 and la1 in [DIV]:
                        pass
                        tmp36_AST = None
                        tmp36_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp36_AST)
                        self.match(DIV)
                    elif la1 and la1 in [MOD]:
                        pass
                        tmp37_AST = None
                        tmp37_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp37_AST)
                        self.match(MOD)
                    else:
                            raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                        
                    self.sign_expression()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            multiplying_expression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_12)
        
        self.returnAST = multiplying_expression_AST
    
    def sign_expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        sign_expression_AST = None
        i1_AST = None
        i2_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [MINUS]:
                pass
                tmp38_AST = None
                tmp38_AST = self.astFactory.create(self.LT(1))
                self.match(MINUS)
                self.paren_expression()
                i1_AST = self.returnAST
                sign_expression_AST = currentAST.root
                sign_expression_AST = antlr.make(self.astFactory.create(UNARY_MINUS), i1_AST)
                currentAST.root = sign_expression_AST
                if (sign_expression_AST != None) and (sign_expression_AST.getFirstChild() != None):
                    currentAST.child = sign_expression_AST.getFirstChild()
                else:
                    currentAST.child = sign_expression_AST
                currentAST.advanceChildToEnd()
            elif la1 and la1 in [NUMBER,LPAREN]:
                pass
                self.paren_expression()
                i2_AST = self.returnAST
                sign_expression_AST = currentAST.root
                sign_expression_AST = i2_AST
                currentAST.root = sign_expression_AST
                if (sign_expression_AST != None) and (sign_expression_AST.getFirstChild() != None):
                    currentAST.child = sign_expression_AST.getFirstChild()
                else:
                    currentAST.child = sign_expression_AST
                currentAST.advanceChildToEnd()
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_13)
        
        self.returnAST = sign_expression_AST
    
    def paren_expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        paren_expression_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [NUMBER]:
                pass
                tmp39_AST = None
                tmp39_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp39_AST)
                self.match(NUMBER)
                paren_expression_AST = currentAST.root
            elif la1 and la1 in [LPAREN]:
                pass
                self.match(LPAREN)
                self.adding_expression()
                self.addASTChild(currentAST, self.returnAST)
                self.match(RPAREN)
                paren_expression_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            self.reportError(ex)
            self.consume()
            self.consumeUntil(_tokenSet_13)
        
        self.returnAST = paren_expression_AST
    
    
    def buildTokenTypeASTClassMap(self):
        self.tokenTypeToASTClassMap = None

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
    "PIR_ASSIGN", 
    "PIR_FOOTER", 
    "PIR_HEADER", 
    "PIR_NOOP", 
    "PIR_COMMENT", 
    "PIR_NEWLINE"
]
    

### generate bit set
def mk_tokenSet_0(): 
    ### var1
    data = [ 1109787248L, 0L]
    return data
_tokenSet_0 = antlr.BitSet(mk_tokenSet_0())

### generate bit set
def mk_tokenSet_1(): 
    ### var1
    data = [ 2L, 0L]
    return data
_tokenSet_1 = antlr.BitSet(mk_tokenSet_1())

### generate bit set
def mk_tokenSet_2(): 
    ### var1
    data = [ 1109787250L, 0L]
    return data
_tokenSet_2 = antlr.BitSet(mk_tokenSet_2())

### generate bit set
def mk_tokenSet_3(): 
    ### var1
    data = [ 16L, 0L]
    return data
_tokenSet_3 = antlr.BitSet(mk_tokenSet_3())

### generate bit set
def mk_tokenSet_4(): 
    ### var1
    data = [ 3324117616L, 0L]
    return data
_tokenSet_4 = antlr.BitSet(mk_tokenSet_4())

### generate bit set
def mk_tokenSet_5(): 
    ### var1
    data = [ 3257008752L, 0L]
    return data
_tokenSet_5 = antlr.BitSet(mk_tokenSet_5())

### generate bit set
def mk_tokenSet_6(): 
    ### var1
    data = [ 2147483648L, 0L]
    return data
_tokenSet_6 = antlr.BitSet(mk_tokenSet_6())

### generate bit set
def mk_tokenSet_7(): 
    ### var1
    data = [ 4194304L, 0L]
    return data
_tokenSet_7 = antlr.BitSet(mk_tokenSet_7())

### generate bit set
def mk_tokenSet_8(): 
    ### var1
    data = [ 71303184L, 0L]
    return data
_tokenSet_8 = antlr.BitSet(mk_tokenSet_8())

### generate bit set
def mk_tokenSet_9(): 
    ### var1
    data = [ 3324117618L, 0L]
    return data
_tokenSet_9 = antlr.BitSet(mk_tokenSet_9())

### generate bit set
def mk_tokenSet_10(): 
    ### var1
    data = [ 3324125810L, 0L]
    return data
_tokenSet_10 = antlr.BitSet(mk_tokenSet_10())

### generate bit set
def mk_tokenSet_11(): 
    ### var1
    data = [ 3328311922L, 0L]
    return data
_tokenSet_11 = antlr.BitSet(mk_tokenSet_11())

### generate bit set
def mk_tokenSet_12(): 
    ### var1
    data = [ 3345089138L, 0L]
    return data
_tokenSet_12 = antlr.BitSet(mk_tokenSet_12())

### generate bit set
def mk_tokenSet_13(): 
    ### var1
    data = [ 3345096306L, 0L]
    return data
_tokenSet_13 = antlr.BitSet(mk_tokenSet_13())
    
