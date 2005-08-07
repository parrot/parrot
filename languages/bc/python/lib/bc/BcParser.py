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
SEMICOLON = 14
COMMA = 15
ASSIGN_OP = 16
LBRACKET = 17
RBRACKET = 18
LCURLY = 19
RCURLY = 20
DOTDOT = 21
LPAREN = 22
RPAREN = 23
REL_OP = 24
PLUS = 25
MINUS = 26
INCR_DECR = 27
MUL = 28
DIV = 29
MOD = 30
PIR_OP = 31
UNARY_MINUS = 32
PIR_PRINT = 33
LITERAL_quit = 34
LITERAL_Integer = 35
LITERAL_Boolean = 36
LITERAL_define = 37
LITERAL_var = 38
LITERAL_exit = 39
LITERAL_when = 40
LITERAL_return = 41
LITERAL_if = 42
LITERAL_end = 43
LITERAL_then = 44
LITERAL_elsif = 45
LITERAL_else = 46
LITERAL_while = 47
LITERAL_loop = 48
LITERAL_put = 49
LITERAL_get = 50
LITERAL_newLine = 51
LITERAL_skipLine = 52
LITERAL_not = 53
NOT_EQUALS = 54
PIR_FOOTER = 55
PIR_HEADER = 56
PIR_NOOP = 57
PIR_COMMENT = 58
PIR_NEWLINE = 59

class Parser(antlr.LLkParser):
    ### user action >>>
    ### user action <<<
    
    def __init__(self, *args, **kwargs):
        antlr.LLkParser.__init__(self, *args, **kwargs)
        self.tokenNames = _tokenNames
        self.buildTokenTypeASTClassMap()
        self.astFactory = antlr.ASTFactory(self.getTokenTypeToASTClassMap())
        self.astFactory.setASTNodeClass()
        
    def program(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        program_AST = None
        try:      ## for error handling
            pass
            while True:
                if (self.LA(1)==NUMBER or self.LA(1)==MINUS):
                    pass
                    self.input_item()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            self.match(LITERAL_quit)
            program_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = program_AST
    
    def input_item(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        input_item_AST = None
        try:      ## for error handling
            pass
            self.semicolon_list()
            self.addASTChild(currentAST, self.returnAST)
            self.match(NEWLINE)
            input_item_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_1)
            else:
                raise ex
        
        self.returnAST = input_item_AST
    
    def semicolon_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        semicolon_list_AST = None
        try:      ## for error handling
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
                
            semicolon_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_2)
            else:
                raise ex
        
        self.returnAST = semicolon_list_AST
    
    def statement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        statement_AST = None
        try:      ## for error handling
            pass
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            statement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_3)
            else:
                raise ex
        
        self.returnAST = statement_AST
    
    def expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expression_AST = None
        a_AST = None
        try:      ## for error handling
            pass
            self.addingExpression()
            a_AST = self.returnAST
            if not self.inputState.guessing:
                expression_AST = currentAST.root
                expression_AST = antlr.make(self.astFactory.create(PIR_PRINT,"print"), a_AST)
                currentAST.root = expression_AST
                if (expression_AST != None) and (expression_AST.getFirstChild() != None):
                    currentAST.child = expression_AST.getFirstChild()
                else:
                    currentAST.child = expression_AST
                currentAST.advanceChildToEnd()
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_4)
            else:
                raise ex
        
        self.returnAST = expression_AST
    
    def addingExpression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        addingExpression_AST = None
        try:      ## for error handling
            pass
            self.multiplyingExpression()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if (self.LA(1)==PLUS or self.LA(1)==MINUS):
                    pass
                    la1 = self.LA(1)
                    if False:
                        pass
                    elif la1 and la1 in [PLUS]:
                        pass
                        tmp11_AST = None
                        tmp11_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp11_AST)
                        self.match(PLUS)
                    elif la1 and la1 in [MINUS]:
                        pass
                        tmp12_AST = None
                        tmp12_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp12_AST)
                        self.match(MINUS)
                    else:
                            raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                        
                    self.multiplyingExpression()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            addingExpression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_5)
            else:
                raise ex
        
        self.returnAST = addingExpression_AST
    
    def subprogramBody(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        subprogramBody_AST = None
        try:      ## for error handling
            pass
            while True:
                if (self.LA(1)==LITERAL_define):
                    pass
                    self.function()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            self.statement_list()
            self.addASTChild(currentAST, self.returnAST)
            subprogramBody_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_6)
            else:
                raise ex
        
        self.returnAST = subprogramBody_AST
    
    def function(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        function_AST = None
        try:      ## for error handling
            pass
            tmp13_AST = None
            tmp13_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp13_AST)
            self.match(LITERAL_define)
            tmp14_AST = None
            tmp14_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp14_AST)
            self.match(LETTER)
            tmp15_AST = None
            tmp15_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp15_AST)
            self.match(LPAREN)
            self.opt_parameter_list()
            self.addASTChild(currentAST, self.returnAST)
            tmp16_AST = None
            tmp16_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp16_AST)
            self.match(RPAREN)
            tmp17_AST = None
            tmp17_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp17_AST)
            self.match(RCURLY)
            tmp18_AST = None
            tmp18_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp18_AST)
            self.match(NEWLINE)
            self.statement_list()
            self.addASTChild(currentAST, self.returnAST)
            tmp19_AST = None
            tmp19_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp19_AST)
            self.match(LCURLY)
            self.subprogramBody()
            self.addASTChild(currentAST, self.returnAST)
            tmp20_AST = None
            tmp20_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp20_AST)
            self.match(SEMICOLON)
            function_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_7)
            else:
                raise ex
        
        self.returnAST = function_AST
    
    def statement_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        statement_list_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [NUMBER,MINUS]:
                pass
                self.addingExpression()
                self.addASTChild(currentAST, self.returnAST)
                self.statement_list()
                self.addASTChild(currentAST, self.returnAST)
                statement_list_AST = currentAST.root
            elif la1 and la1 in [SEMICOLON,LCURLY,LITERAL_end,LITERAL_elsif,LITERAL_else]:
                pass
                statement_list_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_8)
            else:
                raise ex
        
        self.returnAST = statement_list_AST
    
    def identList(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        identList_AST = None
        try:      ## for error handling
            pass
            tmp21_AST = None
            tmp21_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp21_AST)
            self.match(LETTER)
            while True:
                if (self.LA(1)==COMMA):
                    pass
                    tmp22_AST = None
                    tmp22_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp22_AST)
                    self.match(COMMA)
                    tmp23_AST = None
                    tmp23_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp23_AST)
                    self.match(LETTER)
                else:
                    break
                
            identList_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_9)
            else:
                raise ex
        
        self.returnAST = identList_AST
    
    def typeName(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        typeName_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LETTER]:
                pass
                tmp24_AST = None
                tmp24_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp24_AST)
                self.match(LETTER)
                typeName_AST = currentAST.root
            elif la1 and la1 in [LITERAL_Integer]:
                pass
                tmp25_AST = None
                tmp25_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp25_AST)
                self.match(LITERAL_Integer)
                typeName_AST = currentAST.root
            elif la1 and la1 in [LITERAL_Boolean]:
                pass
                tmp26_AST = None
                tmp26_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp26_AST)
                self.match(LITERAL_Boolean)
                typeName_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_10)
            else:
                raise ex
        
        self.returnAST = typeName_AST
    
    def opt_parameter_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        opt_parameter_list_AST = None
        try:      ## for error handling
            pass
            self.parameterSpec()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if (self.LA(1)==SEMICOLON):
                    pass
                    tmp27_AST = None
                    tmp27_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp27_AST)
                    self.match(SEMICOLON)
                    self.parameterSpec()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            tmp28_AST = None
            tmp28_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp28_AST)
            self.match(RPAREN)
            opt_parameter_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_11)
            else:
                raise ex
        
        self.returnAST = opt_parameter_list_AST
    
    def parameterSpec(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        parameterSpec_AST = None
        try:      ## for error handling
            pass
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_var]:
                pass
                tmp29_AST = None
                tmp29_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp29_AST)
                self.match(LITERAL_var)
            elif la1 and la1 in [LETTER]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            self.identList()
            self.addASTChild(currentAST, self.returnAST)
            tmp30_AST = None
            tmp30_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp30_AST)
            self.match(COLON)
            self.typeName()
            self.addASTChild(currentAST, self.returnAST)
            parameterSpec_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_10)
            else:
                raise ex
        
        self.returnAST = parameterSpec_AST
    
    def opt_auto_define_list(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        opt_auto_define_list_AST = None
        try:      ## for error handling
            pass
            self.parameterSpec()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if (self.LA(1)==SEMICOLON):
                    pass
                    tmp31_AST = None
                    tmp31_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp31_AST)
                    self.match(SEMICOLON)
                    self.parameterSpec()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            tmp32_AST = None
            tmp32_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp32_AST)
            self.match(RPAREN)
            opt_auto_define_list_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = opt_auto_define_list_AST
    
    def statement_from_tutorial(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        statement_from_tutorial_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_exit]:
                pass
                self.exitStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_from_tutorial_AST = currentAST.root
            elif la1 and la1 in [LITERAL_return]:
                pass
                self.returnStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_from_tutorial_AST = currentAST.root
            elif la1 and la1 in [LITERAL_if]:
                pass
                self.ifStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_from_tutorial_AST = currentAST.root
            elif la1 and la1 in [LITERAL_while,LITERAL_loop]:
                pass
                self.loopStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_from_tutorial_AST = currentAST.root
            elif la1 and la1 in [LITERAL_put,LITERAL_get,LITERAL_newLine,LITERAL_skipLine]:
                pass
                self.ioStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_from_tutorial_AST = currentAST.root
            elif la1 and la1 in [NUMBER,MINUS]:
                pass
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
                statement_from_tutorial_AST = currentAST.root
            else:
                synPredMatched68 = False
                if (self.LA(1)==LETTER):
                    _m68 = self.mark()
                    synPredMatched68 = True
                    self.inputState.guessing += 1
                    try:
                        pass
                        self.match(LETTER)
                        la1 = self.LA(1)
                        if False:
                            pass
                        elif la1 and la1 in [LPAREN]:
                            pass
                            self.match(LPAREN)
                        elif la1 and la1 in [SEMICOLON]:
                            pass
                            self.match(SEMICOLON)
                        else:
                                raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                            
                    except antlr.RecognitionException, pe:
                        synPredMatched68 = False
                    self.rewind(_m68)
                    self.inputState.guessing -= 1
                if synPredMatched68:
                    pass
                    self.procedureCallStatement()
                    self.addASTChild(currentAST, self.returnAST)
                    statement_from_tutorial_AST = currentAST.root
                elif (self.LA(1)==LETTER):
                    pass
                    self.assignmentStatement()
                    self.addASTChild(currentAST, self.returnAST)
                    statement_from_tutorial_AST = currentAST.root
                else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = statement_from_tutorial_AST
    
    def exitStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        exitStatement_AST = None
        try:      ## for error handling
            pass
            tmp33_AST = None
            tmp33_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp33_AST)
            self.match(LITERAL_exit)
            tmp34_AST = None
            tmp34_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp34_AST)
            self.match(LITERAL_when)
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            tmp35_AST = None
            tmp35_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp35_AST)
            self.match(SEMICOLON)
            exitStatement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = exitStatement_AST
    
    def returnStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        returnStatement_AST = None
        try:      ## for error handling
            pass
            tmp36_AST = None
            tmp36_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp36_AST)
            self.match(LITERAL_return)
            tmp37_AST = None
            tmp37_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp37_AST)
            self.match(SEMICOLON)
            returnStatement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = returnStatement_AST
    
    def ifStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        ifStatement_AST = None
        try:      ## for error handling
            pass
            tmp38_AST = None
            tmp38_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp38_AST)
            self.match(LITERAL_if)
            self.ifPart()
            self.addASTChild(currentAST, self.returnAST)
            tmp39_AST = None
            tmp39_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp39_AST)
            self.match(LITERAL_end)
            tmp40_AST = None
            tmp40_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp40_AST)
            self.match(LITERAL_if)
            tmp41_AST = None
            tmp41_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp41_AST)
            self.match(SEMICOLON)
            ifStatement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = ifStatement_AST
    
    def loopStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        loopStatement_AST = None
        try:      ## for error handling
            pass
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_while]:
                pass
                tmp42_AST = None
                tmp42_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp42_AST)
                self.match(LITERAL_while)
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [LITERAL_loop]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp43_AST = None
            tmp43_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp43_AST)
            self.match(LITERAL_loop)
            self.statement_list()
            self.addASTChild(currentAST, self.returnAST)
            tmp44_AST = None
            tmp44_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp44_AST)
            self.match(LITERAL_end)
            tmp45_AST = None
            tmp45_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp45_AST)
            self.match(LITERAL_loop)
            tmp46_AST = None
            tmp46_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp46_AST)
            self.match(SEMICOLON)
            loopStatement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = loopStatement_AST
    
    def ioStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        ioStatement_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_put]:
                pass
                tmp47_AST = None
                tmp47_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp47_AST)
                self.match(LITERAL_put)
                tmp48_AST = None
                tmp48_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp48_AST)
                self.match(LPAREN)
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
                tmp49_AST = None
                tmp49_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp49_AST)
                self.match(RPAREN)
                tmp50_AST = None
                tmp50_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp50_AST)
                self.match(SEMICOLON)
                ioStatement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_get]:
                pass
                tmp51_AST = None
                tmp51_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp51_AST)
                self.match(LITERAL_get)
                tmp52_AST = None
                tmp52_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp52_AST)
                self.match(LPAREN)
                self.variableReference()
                self.addASTChild(currentAST, self.returnAST)
                tmp53_AST = None
                tmp53_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp53_AST)
                self.match(RPAREN)
                tmp54_AST = None
                tmp54_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp54_AST)
                self.match(SEMICOLON)
                ioStatement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_newLine]:
                pass
                tmp55_AST = None
                tmp55_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp55_AST)
                self.match(LITERAL_newLine)
                la1 = self.LA(1)
                if False:
                    pass
                elif la1 and la1 in [LPAREN]:
                    pass
                    tmp56_AST = None
                    tmp56_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp56_AST)
                    self.match(LPAREN)
                    tmp57_AST = None
                    tmp57_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp57_AST)
                    self.match(RPAREN)
                elif la1 and la1 in [SEMICOLON]:
                    pass
                else:
                        raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                    
                tmp58_AST = None
                tmp58_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp58_AST)
                self.match(SEMICOLON)
                ioStatement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_skipLine]:
                pass
                tmp59_AST = None
                tmp59_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp59_AST)
                self.match(LITERAL_skipLine)
                la1 = self.LA(1)
                if False:
                    pass
                elif la1 and la1 in [LPAREN]:
                    pass
                    tmp60_AST = None
                    tmp60_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp60_AST)
                    self.match(LPAREN)
                    tmp61_AST = None
                    tmp61_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp61_AST)
                    self.match(RPAREN)
                elif la1 and la1 in [SEMICOLON]:
                    pass
                else:
                        raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                    
                tmp62_AST = None
                tmp62_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp62_AST)
                self.match(SEMICOLON)
                ioStatement_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = ioStatement_AST
    
    def procedureCallStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        procedureCallStatement_AST = None
        try:      ## for error handling
            pass
            tmp63_AST = None
            tmp63_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp63_AST)
            self.match(LETTER)
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LPAREN]:
                pass
                self.actualParameters()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [SEMICOLON]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp64_AST = None
            tmp64_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp64_AST)
            self.match(SEMICOLON)
            procedureCallStatement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = procedureCallStatement_AST
    
    def assignmentStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        assignmentStatement_AST = None
        try:      ## for error handling
            pass
            self.variableReference()
            self.addASTChild(currentAST, self.returnAST)
            tmp65_AST = None
            tmp65_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp65_AST)
            self.match(BECOMES)
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            tmp66_AST = None
            tmp66_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp66_AST)
            self.match(SEMICOLON)
            assignmentStatement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = assignmentStatement_AST
    
    def variableReference(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        variableReference_AST = None
        try:      ## for error handling
            pass
            tmp67_AST = None
            tmp67_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp67_AST)
            self.match(LETTER)
            while True:
                la1 = self.LA(1)
                if False:
                    pass
                elif la1 and la1 in [LBRACKET]:
                    pass
                    tmp68_AST = None
                    tmp68_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp68_AST)
                    self.match(LBRACKET)
                    self.expression()
                    self.addASTChild(currentAST, self.returnAST)
                    tmp69_AST = None
                    tmp69_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp69_AST)
                    self.match(RBRACKET)
                elif la1 and la1 in [DOT]:
                    pass
                    tmp70_AST = None
                    tmp70_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp70_AST)
                    self.match(DOT)
                    tmp71_AST = None
                    tmp71_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp71_AST)
                    self.match(LETTER)
                else:
                        break
                    
            variableReference_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_12)
            else:
                raise ex
        
        self.returnAST = variableReference_AST
    
    def actualParameters(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        actualParameters_AST = None
        try:      ## for error handling
            pass
            tmp72_AST = None
            tmp72_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp72_AST)
            self.match(LPAREN)
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [NUMBER,MINUS]:
                pass
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
                while True:
                    if (self.LA(1)==COMMA):
                        pass
                        tmp73_AST = None
                        tmp73_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp73_AST)
                        self.match(COMMA)
                        self.expression()
                        self.addASTChild(currentAST, self.returnAST)
                    else:
                        break
                    
            elif la1 and la1 in [RPAREN]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp74_AST = None
            tmp74_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp74_AST)
            self.match(RPAREN)
            actualParameters_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_6)
            else:
                raise ex
        
        self.returnAST = actualParameters_AST
    
    def ifPart(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        ifPart_AST = None
        try:      ## for error handling
            pass
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            tmp75_AST = None
            tmp75_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp75_AST)
            self.match(LITERAL_then)
            self.statement_list()
            self.addASTChild(currentAST, self.returnAST)
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_elsif]:
                pass
                tmp76_AST = None
                tmp76_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp76_AST)
                self.match(LITERAL_elsif)
                self.ifPart()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [LITERAL_else]:
                pass
                tmp77_AST = None
                tmp77_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp77_AST)
                self.match(LITERAL_else)
                self.statement_list()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [LITERAL_end]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            ifPart_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_13)
            else:
                raise ex
        
        self.returnAST = ifPart_AST
    
    def endStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        endStatement_AST = None
        try:      ## for error handling
            pass
            tmp78_AST = None
            tmp78_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp78_AST)
            self.match(LITERAL_end)
            tmp79_AST = None
            tmp79_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp79_AST)
            self.match(SEMICOLON)
            endStatement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = endStatement_AST
    
    def primitiveElement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        primitiveElement_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LETTER]:
                pass
                self.variableReference()
                self.addASTChild(currentAST, self.returnAST)
                primitiveElement_AST = currentAST.root
            elif la1 and la1 in [LPAREN]:
                pass
                tmp80_AST = None
                tmp80_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp80_AST)
                self.match(LPAREN)
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
                tmp81_AST = None
                tmp81_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp81_AST)
                self.match(RPAREN)
                primitiveElement_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = primitiveElement_AST
    
    def booleanNegationExpression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        booleanNegationExpression_AST = None
        try:      ## for error handling
            pass
            while True:
                if (self.LA(1)==LITERAL_not):
                    pass
                    tmp82_AST = None
                    tmp82_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp82_AST)
                    self.match(LITERAL_not)
                else:
                    break
                
            self.primitiveElement()
            self.addASTChild(currentAST, self.returnAST)
            booleanNegationExpression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = booleanNegationExpression_AST
    
    def multiplyingExpression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        multiplyingExpression_AST = None
        try:      ## for error handling
            pass
            self.signExpression()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if ((self.LA(1) >= MUL and self.LA(1) <= MOD)):
                    pass
                    la1 = self.LA(1)
                    if False:
                        pass
                    elif la1 and la1 in [MUL]:
                        pass
                        tmp83_AST = None
                        tmp83_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp83_AST)
                        self.match(MUL)
                    elif la1 and la1 in [DIV]:
                        pass
                        tmp84_AST = None
                        tmp84_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp84_AST)
                        self.match(DIV)
                    elif la1 and la1 in [MOD]:
                        pass
                        tmp85_AST = None
                        tmp85_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp85_AST)
                        self.match(MOD)
                    else:
                            raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                        
                    self.signExpression()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            multiplyingExpression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_14)
            else:
                raise ex
        
        self.returnAST = multiplyingExpression_AST
    
    def signExpression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        signExpression_AST = None
        i1 = None
        i1_AST = None
        i2 = None
        i2_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [MINUS]:
                pass
                tmp86_AST = None
                tmp86_AST = self.astFactory.create(self.LT(1))
                self.match(MINUS)
                i1 = self.LT(1)
                i1_AST = self.astFactory.create(i1)
                self.match(NUMBER)
                if not self.inputState.guessing:
                    signExpression_AST = currentAST.root
                    signExpression_AST = antlr.make(self.astFactory.create(UNARY_MINUS), i1_AST)
                    currentAST.root = signExpression_AST
                    if (signExpression_AST != None) and (signExpression_AST.getFirstChild() != None):
                        currentAST.child = signExpression_AST.getFirstChild()
                    else:
                        currentAST.child = signExpression_AST
                    currentAST.advanceChildToEnd()
            elif la1 and la1 in [NUMBER]:
                pass
                i2 = self.LT(1)
                i2_AST = self.astFactory.create(i2)
                self.match(NUMBER)
                if not self.inputState.guessing:
                    signExpression_AST = currentAST.root
                    signExpression_AST = i2_AST
                    currentAST.root = signExpression_AST
                    if (signExpression_AST != None) and (signExpression_AST.getFirstChild() != None):
                        currentAST.child = signExpression_AST.getFirstChild()
                    else:
                        currentAST.child = signExpression_AST
                    currentAST.advanceChildToEnd()
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_15)
            else:
                raise ex
        
        self.returnAST = signExpression_AST
    
    def relationalExpression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        relationalExpression_AST = None
        try:      ## for error handling
            pass
            self.addingExpression()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if (self.LA(1)==ASSIGN_OP or self.LA(1)==REL_OP or self.LA(1)==NOT_EQUALS):
                    pass
                    la1 = self.LA(1)
                    if False:
                        pass
                    elif la1 and la1 in [ASSIGN_OP]:
                        pass
                        tmp87_AST = None
                        tmp87_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp87_AST)
                        self.match(ASSIGN_OP)
                    elif la1 and la1 in [NOT_EQUALS]:
                        pass
                        tmp88_AST = None
                        tmp88_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp88_AST)
                        self.match(NOT_EQUALS)
                    elif la1 and la1 in [REL_OP]:
                        pass
                        tmp89_AST = None
                        tmp89_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp89_AST)
                        self.match(REL_OP)
                    else:
                            raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                        
                    self.addingExpression()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            relationalExpression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = relationalExpression_AST
    
    
    def buildTokenTypeASTClassMap(self):
        self.tokenTypeToASTClassMap = None

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
    "SEMICOLON", 
    "COMMA", 
    "ASSIGN_OP", 
    "LBRACKET", 
    "RBRACKET", 
    "LCURLY", 
    "RCURLY", 
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
    "PIR_PRINT", 
    "\"quit\"", 
    "\"Integer\"", 
    "\"Boolean\"", 
    "\"define\"", 
    "\"var\"", 
    "\"exit\"", 
    "\"when\"", 
    "\"return\"", 
    "\"if\"", 
    "\"end\"", 
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
    "PIR_FOOTER", 
    "PIR_HEADER", 
    "PIR_NOOP", 
    "PIR_COMMENT", 
    "PIR_NEWLINE"
]
    

### generate bit set
def mk_tokenSet_0(): 
    ### var1
    data = [ 2L, 0L]
    return data
_tokenSet_0 = antlr.BitSet(mk_tokenSet_0())

### generate bit set
def mk_tokenSet_1(): 
    ### var1
    data = [ 17246978080L, 0L]
    return data
_tokenSet_1 = antlr.BitSet(mk_tokenSet_1())

### generate bit set
def mk_tokenSet_2(): 
    ### var1
    data = [ 128L, 0L]
    return data
_tokenSet_2 = antlr.BitSet(mk_tokenSet_2())

### generate bit set
def mk_tokenSet_3(): 
    ### var1
    data = [ 16512L, 0L]
    return data
_tokenSet_3 = antlr.BitSet(mk_tokenSet_3())

### generate bit set
def mk_tokenSet_4(): 
    ### var1
    data = [ 299067171455106L, 0L]
    return data
_tokenSet_4 = antlr.BitSet(mk_tokenSet_4())

### generate bit set
def mk_tokenSet_5(): 
    ### var1
    data = [ 18427814974701730L, 0L]
    return data
_tokenSet_5 = antlr.BitSet(mk_tokenSet_5())

### generate bit set
def mk_tokenSet_6(): 
    ### var1
    data = [ 16384L, 0L]
    return data
_tokenSet_6 = antlr.BitSet(mk_tokenSet_6())

### generate bit set
def mk_tokenSet_7(): 
    ### var1
    data = [ 137506078752L, 0L]
    return data
_tokenSet_7 = antlr.BitSet(mk_tokenSet_7())

### generate bit set
def mk_tokenSet_8(): 
    ### var1
    data = [ 114349209829376L, 0L]
    return data
_tokenSet_8 = antlr.BitSet(mk_tokenSet_8())

### generate bit set
def mk_tokenSet_9(): 
    ### var1
    data = [ 8192L, 0L]
    return data
_tokenSet_9 = antlr.BitSet(mk_tokenSet_9())

### generate bit set
def mk_tokenSet_10(): 
    ### var1
    data = [ 8404992L, 0L]
    return data
_tokenSet_10 = antlr.BitSet(mk_tokenSet_10())

### generate bit set
def mk_tokenSet_11(): 
    ### var1
    data = [ 8388608L, 0L]
    return data
_tokenSet_11 = antlr.BitSet(mk_tokenSet_11())

### generate bit set
def mk_tokenSet_12(): 
    ### var1
    data = [ 8392706L, 0L]
    return data
_tokenSet_12 = antlr.BitSet(mk_tokenSet_12())

### generate bit set
def mk_tokenSet_13(): 
    ### var1
    data = [ 8796093022208L, 0L]
    return data
_tokenSet_13 = antlr.BitSet(mk_tokenSet_13())

### generate bit set
def mk_tokenSet_14(): 
    ### var1
    data = [ 18427815008256162L, 0L]
    return data
_tokenSet_14 = antlr.BitSet(mk_tokenSet_14())

### generate bit set
def mk_tokenSet_15(): 
    ### var1
    data = [ 18427816887304354L, 0L]
    return data
_tokenSet_15 = antlr.BitSet(mk_tokenSet_15())
    
