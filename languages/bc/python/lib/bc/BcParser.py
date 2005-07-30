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
                    self.expr_newline()
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
    
    def expr_newline(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expr_newline_AST = None
        try:      ## for error handling
            pass
            self.addingExpression()
            self.addASTChild(currentAST, self.returnAST)
            self.match(NEWLINE)
            expr_newline_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_1)
            else:
                raise ex
        
        self.returnAST = expr_newline_AST
    
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
                        tmp10_AST = None
                        tmp10_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp10_AST)
                        self.match(PLUS)
                    elif la1 and la1 in [MINUS]:
                        pass
                        tmp11_AST = None
                        tmp11_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp11_AST)
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
                self.consumeUntil(_tokenSet_2)
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
                if ((self.LA(1) >= LITERAL_var and self.LA(1) <= LITERAL_type)):
                    pass
                    self.basicDecl()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            while True:
                if (self.LA(1)==LITERAL_procedure):
                    pass
                    self.procedureDecl()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            self.statementList()
            self.addASTChild(currentAST, self.returnAST)
            subprogramBody_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_3)
            else:
                raise ex
        
        self.returnAST = subprogramBody_AST
    
    def basicDecl(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        basicDecl_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_var]:
                pass
                self.varDecl()
                self.addASTChild(currentAST, self.returnAST)
                basicDecl_AST = currentAST.root
            elif la1 and la1 in [LITERAL_constant]:
                pass
                self.constDecl()
                self.addASTChild(currentAST, self.returnAST)
                basicDecl_AST = currentAST.root
            elif la1 and la1 in [LITERAL_type]:
                pass
                self.typeDecl()
                self.addASTChild(currentAST, self.returnAST)
                basicDecl_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_4)
            else:
                raise ex
        
        self.returnAST = basicDecl_AST
    
    def procedureDecl(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        procedureDecl_AST = None
        try:      ## for error handling
            pass
            tmp12_AST = None
            tmp12_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp12_AST)
            self.match(LITERAL_procedure)
            tmp13_AST = None
            tmp13_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp13_AST)
            self.match(LETTER)
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LPAREN]:
                pass
                self.formalParameters()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [ASSIGN_OP]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp14_AST = None
            tmp14_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp14_AST)
            self.match(ASSIGN_OP)
            self.subprogramBody()
            self.addASTChild(currentAST, self.returnAST)
            tmp15_AST = None
            tmp15_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp15_AST)
            self.match(SEMI)
            procedureDecl_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_5)
            else:
                raise ex
        
        self.returnAST = procedureDecl_AST
    
    def statementList(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        statementList_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [NUMBER,MINUS]:
                pass
                self.addingExpression()
                self.addASTChild(currentAST, self.returnAST)
                self.statementList()
                self.addASTChild(currentAST, self.returnAST)
                statementList_AST = currentAST.root
            elif la1 and la1 in [SEMI,LITERAL_end,LITERAL_elsif,LITERAL_else]:
                pass
                statementList_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_6)
            else:
                raise ex
        
        self.returnAST = statementList_AST
    
    def varDecl(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        varDecl_AST = None
        try:      ## for error handling
            pass
            tmp16_AST = None
            tmp16_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp16_AST)
            self.match(LITERAL_var)
            self.identList()
            self.addASTChild(currentAST, self.returnAST)
            tmp17_AST = None
            tmp17_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp17_AST)
            self.match(COLON)
            self.typeName()
            self.addASTChild(currentAST, self.returnAST)
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [BECOMES]:
                pass
                tmp18_AST = None
                tmp18_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp18_AST)
                self.match(BECOMES)
                self.constantValue()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [SEMI]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp19_AST = None
            tmp19_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp19_AST)
            self.match(SEMI)
            varDecl_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_4)
            else:
                raise ex
        
        self.returnAST = varDecl_AST
    
    def constDecl(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        constDecl_AST = None
        try:      ## for error handling
            pass
            tmp20_AST = None
            tmp20_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp20_AST)
            self.match(LITERAL_constant)
            self.identList()
            self.addASTChild(currentAST, self.returnAST)
            tmp21_AST = None
            tmp21_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp21_AST)
            self.match(COLON)
            self.typeName()
            self.addASTChild(currentAST, self.returnAST)
            tmp22_AST = None
            tmp22_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp22_AST)
            self.match(BECOMES)
            self.constantValue()
            self.addASTChild(currentAST, self.returnAST)
            tmp23_AST = None
            tmp23_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp23_AST)
            self.match(SEMI)
            constDecl_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_4)
            else:
                raise ex
        
        self.returnAST = constDecl_AST
    
    def typeDecl(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        typeDecl_AST = None
        try:      ## for error handling
            pass
            tmp24_AST = None
            tmp24_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp24_AST)
            self.match(LITERAL_type)
            tmp25_AST = None
            tmp25_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp25_AST)
            self.match(LETTER)
            tmp26_AST = None
            tmp26_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp26_AST)
            self.match(ASSIGN_OP)
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_array]:
                pass
                self.arrayDecl()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [LITERAL_record]:
                pass
                self.recordDecl()
                self.addASTChild(currentAST, self.returnAST)
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp27_AST = None
            tmp27_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp27_AST)
            self.match(SEMI)
            typeDecl_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_4)
            else:
                raise ex
        
        self.returnAST = typeDecl_AST
    
    def identList(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        identList_AST = None
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
                
            identList_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_7)
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
                tmp31_AST = None
                tmp31_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp31_AST)
                self.match(LETTER)
                typeName_AST = currentAST.root
            elif la1 and la1 in [LITERAL_Integer]:
                pass
                tmp32_AST = None
                tmp32_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp32_AST)
                self.match(LITERAL_Integer)
                typeName_AST = currentAST.root
            elif la1 and la1 in [LITERAL_Boolean]:
                pass
                tmp33_AST = None
                tmp33_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp33_AST)
                self.match(LITERAL_Boolean)
                typeName_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_8)
            else:
                raise ex
        
        self.returnAST = typeName_AST
    
    def constantValue(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        constantValue_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [NUMBER]:
                pass
                tmp34_AST = None
                tmp34_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp34_AST)
                self.match(NUMBER)
                constantValue_AST = currentAST.root
            elif la1 and la1 in [LETTER]:
                pass
                tmp35_AST = None
                tmp35_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp35_AST)
                self.match(LETTER)
                constantValue_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_9)
            else:
                raise ex
        
        self.returnAST = constantValue_AST
    
    def arrayDecl(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        arrayDecl_AST = None
        try:      ## for error handling
            pass
            tmp36_AST = None
            tmp36_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp36_AST)
            self.match(LITERAL_array)
            tmp37_AST = None
            tmp37_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp37_AST)
            self.match(LBRACKET)
            self.integerConstant()
            self.addASTChild(currentAST, self.returnAST)
            tmp38_AST = None
            tmp38_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp38_AST)
            self.match(DOTDOT)
            self.integerConstant()
            self.addASTChild(currentAST, self.returnAST)
            tmp39_AST = None
            tmp39_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp39_AST)
            self.match(RBRACKET)
            tmp40_AST = None
            tmp40_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp40_AST)
            self.match(LITERAL_of)
            self.typeName()
            self.addASTChild(currentAST, self.returnAST)
            arrayDecl_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_3)
            else:
                raise ex
        
        self.returnAST = arrayDecl_AST
    
    def recordDecl(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        recordDecl_AST = None
        try:      ## for error handling
            pass
            tmp41_AST = None
            tmp41_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp41_AST)
            self.match(LITERAL_record)
            _cnt61= 0
            while True:
                if (self.LA(1)==LETTER):
                    pass
                    self.identList()
                    self.addASTChild(currentAST, self.returnAST)
                    tmp42_AST = None
                    tmp42_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp42_AST)
                    self.match(COLON)
                    self.typeName()
                    self.addASTChild(currentAST, self.returnAST)
                    tmp43_AST = None
                    tmp43_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp43_AST)
                    self.match(SEMI)
                else:
                    break
                
                _cnt61 += 1
            if _cnt61 < 1:
                raise antlr.NoViableAltException(self.LT(1), self.getFilename())
            tmp44_AST = None
            tmp44_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp44_AST)
            self.match(LITERAL_end)
            tmp45_AST = None
            tmp45_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp45_AST)
            self.match(LITERAL_record)
            recordDecl_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_3)
            else:
                raise ex
        
        self.returnAST = recordDecl_AST
    
    def integerConstant(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        integerConstant_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [NUMBER]:
                pass
                tmp46_AST = None
                tmp46_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp46_AST)
                self.match(NUMBER)
                integerConstant_AST = currentAST.root
            elif la1 and la1 in [LETTER]:
                pass
                tmp47_AST = None
                tmp47_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp47_AST)
                self.match(LETTER)
                integerConstant_AST = currentAST.root
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_10)
            else:
                raise ex
        
        self.returnAST = integerConstant_AST
    
    def formalParameters(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        formalParameters_AST = None
        try:      ## for error handling
            pass
            tmp48_AST = None
            tmp48_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp48_AST)
            self.match(LPAREN)
            self.parameterSpec()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if (self.LA(1)==SEMI):
                    pass
                    tmp49_AST = None
                    tmp49_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp49_AST)
                    self.match(SEMI)
                    self.parameterSpec()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            tmp50_AST = None
            tmp50_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp50_AST)
            self.match(RPAREN)
            formalParameters_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_11)
            else:
                raise ex
        
        self.returnAST = formalParameters_AST
    
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
                tmp51_AST = None
                tmp51_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp51_AST)
                self.match(LITERAL_var)
            elif la1 and la1 in [LETTER]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            self.identList()
            self.addASTChild(currentAST, self.returnAST)
            tmp52_AST = None
            tmp52_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp52_AST)
            self.match(COLON)
            self.typeName()
            self.addASTChild(currentAST, self.returnAST)
            parameterSpec_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_12)
            else:
                raise ex
        
        self.returnAST = parameterSpec_AST
    
    def statement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        statement_AST = None
        try:      ## for error handling
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_exit]:
                pass
                self.exitStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_return]:
                pass
                self.returnStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_if]:
                pass
                self.ifStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_while,LITERAL_loop]:
                pass
                self.loopStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_put,LITERAL_get,LITERAL_newLine,LITERAL_skipLine]:
                pass
                self.ioStatement()
                self.addASTChild(currentAST, self.returnAST)
                statement_AST = currentAST.root
            elif la1 and la1 in [NUMBER,MINUS]:
                pass
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
                statement_AST = currentAST.root
            else:
                synPredMatched73 = False
                if (self.LA(1)==LETTER):
                    _m73 = self.mark()
                    synPredMatched73 = True
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
                        elif la1 and la1 in [SEMI]:
                            pass
                            self.match(SEMI)
                        else:
                                raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                            
                    except antlr.RecognitionException, pe:
                        synPredMatched73 = False
                    self.rewind(_m73)
                    self.inputState.guessing -= 1
                if synPredMatched73:
                    pass
                    self.procedureCallStatement()
                    self.addASTChild(currentAST, self.returnAST)
                    statement_AST = currentAST.root
                elif (self.LA(1)==LETTER):
                    pass
                    self.assignmentStatement()
                    self.addASTChild(currentAST, self.returnAST)
                    statement_AST = currentAST.root
                else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = statement_AST
    
    def exitStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        exitStatement_AST = None
        try:      ## for error handling
            pass
            tmp53_AST = None
            tmp53_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp53_AST)
            self.match(LITERAL_exit)
            tmp54_AST = None
            tmp54_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp54_AST)
            self.match(LITERAL_when)
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            tmp55_AST = None
            tmp55_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp55_AST)
            self.match(SEMI)
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
            tmp56_AST = None
            tmp56_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp56_AST)
            self.match(LITERAL_return)
            tmp57_AST = None
            tmp57_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp57_AST)
            self.match(SEMI)
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
            tmp58_AST = None
            tmp58_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp58_AST)
            self.match(LITERAL_if)
            self.ifPart()
            self.addASTChild(currentAST, self.returnAST)
            tmp59_AST = None
            tmp59_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp59_AST)
            self.match(LITERAL_end)
            tmp60_AST = None
            tmp60_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp60_AST)
            self.match(LITERAL_if)
            tmp61_AST = None
            tmp61_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp61_AST)
            self.match(SEMI)
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
                tmp62_AST = None
                tmp62_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp62_AST)
                self.match(LITERAL_while)
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [LITERAL_loop]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp63_AST = None
            tmp63_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp63_AST)
            self.match(LITERAL_loop)
            self.statementList()
            self.addASTChild(currentAST, self.returnAST)
            tmp64_AST = None
            tmp64_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp64_AST)
            self.match(LITERAL_end)
            tmp65_AST = None
            tmp65_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp65_AST)
            self.match(LITERAL_loop)
            tmp66_AST = None
            tmp66_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp66_AST)
            self.match(SEMI)
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
                tmp67_AST = None
                tmp67_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp67_AST)
                self.match(LITERAL_put)
                tmp68_AST = None
                tmp68_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp68_AST)
                self.match(LPAREN)
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
                tmp69_AST = None
                tmp69_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp69_AST)
                self.match(RPAREN)
                tmp70_AST = None
                tmp70_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp70_AST)
                self.match(SEMI)
                ioStatement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_get]:
                pass
                tmp71_AST = None
                tmp71_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp71_AST)
                self.match(LITERAL_get)
                tmp72_AST = None
                tmp72_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp72_AST)
                self.match(LPAREN)
                self.variableReference()
                self.addASTChild(currentAST, self.returnAST)
                tmp73_AST = None
                tmp73_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp73_AST)
                self.match(RPAREN)
                tmp74_AST = None
                tmp74_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp74_AST)
                self.match(SEMI)
                ioStatement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_newLine]:
                pass
                tmp75_AST = None
                tmp75_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp75_AST)
                self.match(LITERAL_newLine)
                la1 = self.LA(1)
                if False:
                    pass
                elif la1 and la1 in [LPAREN]:
                    pass
                    tmp76_AST = None
                    tmp76_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp76_AST)
                    self.match(LPAREN)
                    tmp77_AST = None
                    tmp77_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp77_AST)
                    self.match(RPAREN)
                elif la1 and la1 in [SEMI]:
                    pass
                else:
                        raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                    
                tmp78_AST = None
                tmp78_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp78_AST)
                self.match(SEMI)
                ioStatement_AST = currentAST.root
            elif la1 and la1 in [LITERAL_skipLine]:
                pass
                tmp79_AST = None
                tmp79_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp79_AST)
                self.match(LITERAL_skipLine)
                la1 = self.LA(1)
                if False:
                    pass
                elif la1 and la1 in [LPAREN]:
                    pass
                    tmp80_AST = None
                    tmp80_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp80_AST)
                    self.match(LPAREN)
                    tmp81_AST = None
                    tmp81_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp81_AST)
                    self.match(RPAREN)
                elif la1 and la1 in [SEMI]:
                    pass
                else:
                        raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                    
                tmp82_AST = None
                tmp82_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp82_AST)
                self.match(SEMI)
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
            tmp83_AST = None
            tmp83_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp83_AST)
            self.match(LETTER)
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LPAREN]:
                pass
                self.actualParameters()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [SEMI]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp84_AST = None
            tmp84_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp84_AST)
            self.match(SEMI)
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
            tmp85_AST = None
            tmp85_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp85_AST)
            self.match(BECOMES)
            self.expression()
            self.addASTChild(currentAST, self.returnAST)
            tmp86_AST = None
            tmp86_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp86_AST)
            self.match(SEMI)
            assignmentStatement_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_0)
            else:
                raise ex
        
        self.returnAST = assignmentStatement_AST
    
    def expression(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        expression_AST = None
        try:      ## for error handling
            pass
            self.relationalExpression()
            self.addASTChild(currentAST, self.returnAST)
            while True:
                if (self.LA(1)==LITERAL_and or self.LA(1)==LITERAL_or):
                    pass
                    la1 = self.LA(1)
                    if False:
                        pass
                    elif la1 and la1 in [LITERAL_and]:
                        pass
                        tmp87_AST = None
                        tmp87_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp87_AST)
                        self.match(LITERAL_and)
                    elif la1 and la1 in [LITERAL_or]:
                        pass
                        tmp88_AST = None
                        tmp88_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp88_AST)
                        self.match(LITERAL_or)
                    else:
                            raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                        
                    self.relationalExpression()
                    self.addASTChild(currentAST, self.returnAST)
                else:
                    break
                
            expression_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_13)
            else:
                raise ex
        
        self.returnAST = expression_AST
    
    def variableReference(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        variableReference_AST = None
        try:      ## for error handling
            pass
            tmp89_AST = None
            tmp89_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp89_AST)
            self.match(LETTER)
            while True:
                la1 = self.LA(1)
                if False:
                    pass
                elif la1 and la1 in [LBRACKET]:
                    pass
                    tmp90_AST = None
                    tmp90_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp90_AST)
                    self.match(LBRACKET)
                    self.expression()
                    self.addASTChild(currentAST, self.returnAST)
                    tmp91_AST = None
                    tmp91_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp91_AST)
                    self.match(RBRACKET)
                elif la1 and la1 in [DOT]:
                    pass
                    tmp92_AST = None
                    tmp92_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp92_AST)
                    self.match(DOT)
                    tmp93_AST = None
                    tmp93_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp93_AST)
                    self.match(LETTER)
                else:
                        break
                    
            variableReference_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_14)
            else:
                raise ex
        
        self.returnAST = variableReference_AST
    
    def actualParameters(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        actualParameters_AST = None
        try:      ## for error handling
            pass
            tmp94_AST = None
            tmp94_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp94_AST)
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
                        tmp95_AST = None
                        tmp95_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp95_AST)
                        self.match(COMMA)
                        self.expression()
                        self.addASTChild(currentAST, self.returnAST)
                    else:
                        break
                    
            elif la1 and la1 in [RPAREN]:
                pass
            else:
                    raise antlr.NoViableAltException(self.LT(1), self.getFilename())
                
            tmp96_AST = None
            tmp96_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp96_AST)
            self.match(RPAREN)
            actualParameters_AST = currentAST.root
        
        except antlr.RecognitionException, ex:
            if not self.inputState.guessing:
                self.reportError(ex)
                self.consume()
                self.consumeUntil(_tokenSet_3)
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
            tmp97_AST = None
            tmp97_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp97_AST)
            self.match(LITERAL_then)
            self.statementList()
            self.addASTChild(currentAST, self.returnAST)
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in [LITERAL_elsif]:
                pass
                tmp98_AST = None
                tmp98_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp98_AST)
                self.match(LITERAL_elsif)
                self.ifPart()
                self.addASTChild(currentAST, self.returnAST)
            elif la1 and la1 in [LITERAL_else]:
                pass
                tmp99_AST = None
                tmp99_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp99_AST)
                self.match(LITERAL_else)
                self.statementList()
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
                self.consumeUntil(_tokenSet_15)
            else:
                raise ex
        
        self.returnAST = ifPart_AST
    
    def endStatement(self):    
        
        self.returnAST = None
        currentAST = antlr.ASTPair()
        endStatement_AST = None
        try:      ## for error handling
            pass
            tmp100_AST = None
            tmp100_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp100_AST)
            self.match(LITERAL_end)
            tmp101_AST = None
            tmp101_AST = self.astFactory.create(self.LT(1))
            self.addASTChild(currentAST, tmp101_AST)
            self.match(SEMI)
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
            if (self.LA(1)==LETTER):
                pass
                self.variableReference()
                self.addASTChild(currentAST, self.returnAST)
                primitiveElement_AST = currentAST.root
            elif (self.LA(1)==NUMBER or self.LA(1)==LETTER):
                pass
                self.constantValue()
                self.addASTChild(currentAST, self.returnAST)
                primitiveElement_AST = currentAST.root
            elif (self.LA(1)==LPAREN):
                pass
                tmp102_AST = None
                tmp102_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp102_AST)
                self.match(LPAREN)
                self.expression()
                self.addASTChild(currentAST, self.returnAST)
                tmp103_AST = None
                tmp103_AST = self.astFactory.create(self.LT(1))
                self.addASTChild(currentAST, tmp103_AST)
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
                    tmp104_AST = None
                    tmp104_AST = self.astFactory.create(self.LT(1))
                    self.addASTChild(currentAST, tmp104_AST)
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
                        tmp105_AST = None
                        tmp105_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp105_AST)
                        self.match(MUL)
                    elif la1 and la1 in [DIV]:
                        pass
                        tmp106_AST = None
                        tmp106_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp106_AST)
                        self.match(DIV)
                    elif la1 and la1 in [MOD]:
                        pass
                        tmp107_AST = None
                        tmp107_AST = self.astFactory.create(self.LT(1))
                        self.makeASTRoot(currentAST, tmp107_AST)
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
                self.consumeUntil(_tokenSet_16)
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
                tmp108_AST = None
                tmp108_AST = self.astFactory.create(self.LT(1))
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
                self.consumeUntil(_tokenSet_17)
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
                        tmp109_AST = None
                        tmp109_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp109_AST)
                        self.match(ASSIGN_OP)
                    elif la1 and la1 in [NOT_EQUALS]:
                        pass
                        tmp110_AST = None
                        tmp110_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp110_AST)
                        self.match(NOT_EQUALS)
                    elif la1 and la1 in [REL_OP]:
                        pass
                        tmp111_AST = None
                        tmp111_AST = self.astFactory.create(self.LT(1))
                        self.addASTChild(currentAST, tmp111_AST)
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
                self.consumeUntil(_tokenSet_18)
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
    data = [ 2L, 0L]
    return data
_tokenSet_0 = antlr.BitSet(mk_tokenSet_0())

### generate bit set
def mk_tokenSet_1(): 
    ### var1
    data = [ 2164260896L, 0L]
    return data
_tokenSet_1 = antlr.BitSet(mk_tokenSet_1())

### generate bit set
def mk_tokenSet_2(): 
    ### var1
    data = [ 506021914282934434L, 0L]
    return data
_tokenSet_2 = antlr.BitSet(mk_tokenSet_2())

### generate bit set
def mk_tokenSet_3(): 
    ### var1
    data = [ 16384L, 0L]
    return data
_tokenSet_3 = antlr.BitSet(mk_tokenSet_3())

### generate bit set
def mk_tokenSet_4(): 
    ### var1
    data = [ 2229104820256L, 0L]
    return data
_tokenSet_4 = antlr.BitSet(mk_tokenSet_4())

### generate bit set
def mk_tokenSet_5(): 
    ### var1
    data = [ 2199040049184L, 0L]
    return data
_tokenSet_5 = antlr.BitSet(mk_tokenSet_5())

### generate bit set
def mk_tokenSet_6(): 
    ### var1
    data = [ 422487342989312L, 0L]
    return data
_tokenSet_6 = antlr.BitSet(mk_tokenSet_6())

### generate bit set
def mk_tokenSet_7(): 
    ### var1
    data = [ 8192L, 0L]
    return data
_tokenSet_7 = antlr.BitSet(mk_tokenSet_7())

### generate bit set
def mk_tokenSet_8(): 
    ### var1
    data = [ 2117632L, 0L]
    return data
_tokenSet_8 = antlr.BitSet(mk_tokenSet_8())

### generate bit set
def mk_tokenSet_9(): 
    ### var1
    data = [ 16386L, 0L]
    return data
_tokenSet_9 = antlr.BitSet(mk_tokenSet_9())

### generate bit set
def mk_tokenSet_10(): 
    ### var1
    data = [ 786432L, 0L]
    return data
_tokenSet_10 = antlr.BitSet(mk_tokenSet_10())

### generate bit set
def mk_tokenSet_11(): 
    ### var1
    data = [ 65536L, 0L]
    return data
_tokenSet_11 = antlr.BitSet(mk_tokenSet_11())

### generate bit set
def mk_tokenSet_12(): 
    ### var1
    data = [ 2113536L, 0L]
    return data
_tokenSet_12 = antlr.BitSet(mk_tokenSet_12())

### generate bit set
def mk_tokenSet_13(): 
    ### var1
    data = [ 1196268653428738L, 0L]
    return data
_tokenSet_13 = antlr.BitSet(mk_tokenSet_13())

### generate bit set
def mk_tokenSet_14(): 
    ### var1
    data = [ 2101250L, 0L]
    return data
_tokenSet_14 = antlr.BitSet(mk_tokenSet_14())

### generate bit set
def mk_tokenSet_15(): 
    ### var1
    data = [ 274877906944L, 0L]
    return data
_tokenSet_15 = antlr.BitSet(mk_tokenSet_15())

### generate bit set
def mk_tokenSet_16(): 
    ### var1
    data = [ 506021914291323042L, 0L]
    return data
_tokenSet_16 = antlr.BitSet(mk_tokenSet_16())

### generate bit set
def mk_tokenSet_17(): 
    ### var1
    data = [ 506021914761085090L, 0L]
    return data
_tokenSet_17 = antlr.BitSet(mk_tokenSet_17())

### generate bit set
def mk_tokenSet_18(): 
    ### var1
    data = [ 433541832880996354L, 0L]
    return data
_tokenSet_18 = antlr.BitSet(mk_tokenSet_18())
    
