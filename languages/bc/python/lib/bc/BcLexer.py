### $ANTLR 2.7.5 (20050425): "bc_python.g" -> "BcLexer.py"$
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
### preamble action >>> 

### preamble action <<< 
### >>>The Literals<<<
literals = {}
literals[u"newLine"] = 53
literals[u"elsif"] = 47
literals[u"get"] = 52
literals[u"if"] = 45
literals[u"type"] = 34
literals[u"quit"] = 31
literals[u"while"] = 49
literals[u"var"] = 32
literals[u"record"] = 37
literals[u"end"] = 38
literals[u"of"] = 36
literals[u"then"] = 46
literals[u"or"] = 58
literals[u"else"] = 48
literals[u"Boolean"] = 40
literals[u"constant"] = 33
literals[u"array"] = 35
literals[u"when"] = 43
literals[u"Integer"] = 39
literals[u"skipLine"] = 54
literals[u"and"] = 57
literals[u"not"] = 55
literals[u"loop"] = 50
literals[u"exit"] = 42
literals[u"procedure"] = 41
literals[u"put"] = 51
literals[u"return"] = 44


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

class Lexer(antlr.CharScanner) :
    ### user action >>>
    ### user action <<<
    def __init__(self, *argv, **kwargs) :
        antlr.CharScanner.__init__(self, *argv, **kwargs)
        self.caseSensitiveLiterals = True
        self.setCaseSensitive(True)
        self.literals = literals
    
    def nextToken(self):
        while True:
            try: ### try again ..
                while True:
                    _token = None
                    _ttype = INVALID_TYPE
                    self.resetText()
                    try: ## for char stream error handling
                        try: ##for lexical error handling
                            la1 = self.LA(1)
                            if False:
                                pass
                            elif la1 and la1 in u'"':
                                pass
                                self.mSTRING(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'\n\r':
                                pass
                                self.mNEWLINE(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'\t\u000c ':
                                pass
                                self.mWS(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u';':
                                pass
                                self.mSEMI(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u',':
                                pass
                                self.mCOMMA(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'[':
                                pass
                                self.mLBRACKET(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u']':
                                pass
                                self.mRBRACKET(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'(':
                                pass
                                self.mLPAREN(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u')':
                                pass
                                self.mRPAREN(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'*':
                                pass
                                self.mMUL(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'/':
                                pass
                                self.mDIV(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'%':
                                pass
                                self.mMOD(True)
                                theRetToken = self._returnToken
                            else:
                                if (_tokenSet_0.member(self.LA(1))):
                                    pass
                                    self.mNUMBER(True)
                                    theRetToken = self._returnToken
                                elif ((self.LA(1) >= u'a' and self.LA(1) <= u'z')):
                                    pass
                                    self.mIDENT(True)
                                    theRetToken = self._returnToken
                                elif ((self.LA(1) >= u'a' and self.LA(1) <= u'z')):
                                    pass
                                    self.mLETTER(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'.'):
                                    pass
                                    self.mDOT(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u':'):
                                    pass
                                    self.mBECOMES(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u':'):
                                    pass
                                    self.mCOLON(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'=' or self.LA(1)==u'^'):
                                    pass
                                    self.mASSIGN_OP(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'.'):
                                    pass
                                    self.mDOTDOT(True)
                                    theRetToken = self._returnToken
                                elif (_tokenSet_1.member(self.LA(1))):
                                    pass
                                    self.mREL_OP(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'+'):
                                    pass
                                    self.mPLUS(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'-'):
                                    pass
                                    self.mMINUS(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'+' or self.LA(1)==u'-'):
                                    pass
                                    self.mINCR_DECR(True)
                                    theRetToken = self._returnToken
                                else:
                                    self.default(self.LA(1))
                                
                            if not self._returnToken:
                                raise antlr.TryAgain ### found SKIP token
                            ### option { testLiterals=true } 
                            self.testForLiteral(self._returnToken)
                            ### return token to caller
                            return self._returnToken
                        ### handle lexical errors ....
                        except antlr.RecognitionException, e:
                            raise antlr.TokenStreamRecognitionException(e)
                    ### handle char stream errors ...
                    except antlr.CharStreamException,cse:
                        if isinstance(cse, antlr.CharStreamIOException):
                            raise antlr.TokenStreamIOException(cse.io)
                        else:
                            raise antlr.TokenStreamException(str(cse))
            except antlr.TryAgain:
                pass
        
    def mDIGIT(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = DIGIT
        _saveIndex = 0
        la1 = self.LA(1)
        if False:
            pass
        elif la1 and la1 in u'0123456789':
            pass
            self.matchRange(u'0', u'9')
        elif la1 and la1 in u'ABCDEF':
            pass
            self.matchRange(u'A', u'F')
        else:
                self.raise_NoViableAlt(self.LA(1))
            
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mNUMBER(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = NUMBER
        _saveIndex = 0
        la1 = self.LA(1)
        if False:
            pass
        elif la1 and la1 in u'0123456789ABCDEF':
            pass
            _cnt4= 0
            while True:
                if (_tokenSet_2.member(self.LA(1))):
                    pass
                    self.mDIGIT(False)
                else:
                    break
                
                _cnt4 += 1
            if _cnt4 < 1:
                self.raise_NoViableAlt(self.LA(1))
        elif la1 and la1 in u'.':
            pass
            self.match('.')
            _cnt6= 0
            while True:
                if (_tokenSet_2.member(self.LA(1))):
                    pass
                    self.mDIGIT(False)
                else:
                    break
                
                _cnt6 += 1
            if _cnt6 < 1:
                self.raise_NoViableAlt(self.LA(1))
        else:
                self.raise_NoViableAlt(self.LA(1))
            
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mSTRING(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = STRING
        _saveIndex = 0
        pass
        _saveIndex = self.text.length()
        self.match('"')
        self.text.setLength(_saveIndex)
        while True:
            if (self.LA(1)==u'"'):
                pass
                self.match('"')
                _saveIndex = self.text.length()
                self.match('"')
                self.text.setLength(_saveIndex)
            elif (_tokenSet_3.member(self.LA(1))):
                pass
                self.match(_tokenSet_3)
            else:
                break
            
        if (self.LA(1)==u'"'):
            pass
            _saveIndex = self.text.length()
            self.match('"')
            self.text.setLength(_saveIndex)
        else: ## <m4>
                pass
            
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mNEWLINE(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = NEWLINE
        _saveIndex = 0
        if (self.LA(1)==u'\r'):
            pass
            self.match('\r')
        elif (self.LA(1)==u'\n'):
            pass
            self.match('\n')
        elif (self.LA(1)==u'\r'):
            pass
            self.match('\r')
            self.match('\n')
        else:
            self.raise_NoViableAlt(self.LA(1))
        
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mWS(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = WS
        _saveIndex = 0
        pass
        la1 = self.LA(1)
        if False:
            pass
        elif la1 and la1 in u' ':
            pass
            self.match(' ')
        elif la1 and la1 in u'\t':
            pass
            self.match('\t')
        elif la1 and la1 in u'\u000c':
            pass
            self.match('\f')
        else:
                self.raise_NoViableAlt(self.LA(1))
            
        _ttype = Token.SKIP;
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mIDENT(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = IDENT
        _saveIndex = 0
        pass
        pass
        self.matchRange(u'a', u'z')
        while True:
            if ((self.LA(1) >= u'a' and self.LA(1) <= u'z')):
                pass
                self.matchRange(u'a', u'z')
            else:
                break
            
        ### option { testLiterals=true } 
        _ttype = self.testLiteralsTable(_ttype)
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mLETTER(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = LETTER
        _saveIndex = 0
        pass
        self.matchRange(u'a', u'z')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mDOT(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = DOT
        _saveIndex = 0
        pass
        self.match('.')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mBECOMES(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = BECOMES
        _saveIndex = 0
        pass
        self.match(":=")
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mCOLON(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = COLON
        _saveIndex = 0
        pass
        self.match(':')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mSEMI(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = SEMI
        _saveIndex = 0
        pass
        self.match(';')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mCOMMA(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = COMMA
        _saveIndex = 0
        pass
        self.match(',')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mASSIGN_OP(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = ASSIGN_OP
        _saveIndex = 0
        la1 = self.LA(1)
        if False:
            pass
        elif la1 and la1 in u'=':
            pass
            self.match('=')
        elif la1 and la1 in u'^':
            pass
            self.match("^=")
        else:
                self.raise_NoViableAlt(self.LA(1))
            
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mLBRACKET(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = LBRACKET
        _saveIndex = 0
        pass
        self.match('[')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mRBRACKET(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = RBRACKET
        _saveIndex = 0
        pass
        self.match(']')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mDOTDOT(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = DOTDOT
        _saveIndex = 0
        pass
        self.match("..")
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mLPAREN(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = LPAREN
        _saveIndex = 0
        pass
        self.match('(')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mRPAREN(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = RPAREN
        _saveIndex = 0
        pass
        self.match(')')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mREL_OP(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = REL_OP
        _saveIndex = 0
        la1 = self.LA(1)
        if False:
            pass
        elif la1 and la1 in u'=':
            pass
            self.match("==")
        elif la1 and la1 in u'!':
            pass
            self.match("!=")
        else:
            if (self.LA(1)==u'<'):
                pass
                self.match('<')
            elif (self.LA(1)==u'>'):
                pass
                self.match('>')
            elif (self.LA(1)==u'<'):
                pass
                self.match("<=")
            elif (self.LA(1)==u'>'):
                pass
                self.match(">=")
            else:
                self.raise_NoViableAlt(self.LA(1))
            
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mPLUS(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = PLUS
        _saveIndex = 0
        pass
        self.match('+')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mMINUS(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = MINUS
        _saveIndex = 0
        pass
        self.match('-')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mINCR_DECR(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = INCR_DECR
        _saveIndex = 0
        la1 = self.LA(1)
        if False:
            pass
        elif la1 and la1 in u'+':
            pass
            self.match("++")
        elif la1 and la1 in u'-':
            pass
            self.match("--")
        else:
                self.raise_NoViableAlt(self.LA(1))
            
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mMUL(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = MUL
        _saveIndex = 0
        pass
        self.match('*')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mDIV(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = DIV
        _saveIndex = 0
        pass
        self.match('/')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mMOD(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = MOD
        _saveIndex = 0
        pass
        self.match('%')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    

### generate bit set
def mk_tokenSet_0(): 
    ### var1
    data = [ 288019269919178752L, 126L, 0L, 0L]
    return data
_tokenSet_0 = antlr.BitSet(mk_tokenSet_0())

### generate bit set
def mk_tokenSet_1(): 
    ### var1
    data = [ 8070450540837863424L, 0L, 0L]
    return data
_tokenSet_1 = antlr.BitSet(mk_tokenSet_1())

### generate bit set
def mk_tokenSet_2(): 
    ### var1
    data = [ 287948901175001088L, 126L, 0L, 0L]
    return data
_tokenSet_2 = antlr.BitSet(mk_tokenSet_2())

### generate bit set
def mk_tokenSet_3(): 
    ### var1
    data = [ -17179878401L, -1L, 0L, 0L]
    return data
_tokenSet_3 = antlr.BitSet(mk_tokenSet_3())
    
### __main__ header action >>> 
if __name__ == '__main__' :
    import sys
    import antlr
    import BcLexer
    
    ### create lexer - shall read from stdin
    try:
        for token in BcLexer.Lexer():
            print token
            
    except antlr.TokenStreamException, e:
        print "error: exception caught while lexing: ", e
### __main__ header action <<< 
