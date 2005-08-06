### $ANTLR 2.7.5 (20050416): "bc_python.g" -> "BcLexer.py"$
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
literals[u"newLine"] = 51
literals[u"elsif"] = 45
literals[u"get"] = 50
literals[u"if"] = 42
literals[u"define"] = 37
literals[u"quit"] = 34
literals[u"while"] = 47
literals[u"var"] = 38
literals[u"end"] = 43
literals[u"then"] = 44
literals[u"else"] = 46
literals[u"Boolean"] = 36
literals[u"when"] = 40
literals[u"Integer"] = 35
literals[u"skipLine"] = 52
literals[u"not"] = 53
literals[u"loop"] = 48
literals[u"exit"] = 39
literals[u"put"] = 49
literals[u"return"] = 41


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
                                self.mSEMICOLON(True)
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
                            elif la1 and la1 in u'{':
                                pass
                                self.mLCURLY(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'}':
                                pass
                                self.mRCURLY(True)
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
    
    def mSEMICOLON(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = SEMICOLON
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
    
    def mLCURLY(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = LCURLY
        _saveIndex = 0
        pass
        self.match('{')
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mRCURLY(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = RCURLY
        _saveIndex = 0
        pass
        self.match('}')
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
