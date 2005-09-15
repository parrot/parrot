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
                            elif la1 and la1 in u'\n\r':
                                pass
                                self.mNEWLINE(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'"':
                                pass
                                self.mSTRING(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'.0123456789ABCDEF':
                                pass
                                self.mNUMBER(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'*':
                                pass
                                self.mMUL(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'%':
                                pass
                                self.mMOD(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'(':
                                pass
                                self.mLPAREN(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u')':
                                pass
                                self.mRPAREN(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u',':
                                pass
                                self.mCOMMA(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u';':
                                pass
                                self.mSEMICOLON(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'[':
                                pass
                                self.mLBRACKET(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u']':
                                pass
                                self.mRBRACKET(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'^':
                                pass
                                self.mCARET(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'{':
                                pass
                                self.mLCURLY(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'}':
                                pass
                                self.mRCURLY(True)
                                theRetToken = self._returnToken
                            elif la1 and la1 in u'\t\u000c ':
                                pass
                                self.mWS(True)
                                theRetToken = self._returnToken
                            else:
                                if (self.LA(1)==u'+') and (self.LA(2)==u'+'):
                                    pass
                                    self.mINCR(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'-') and (self.LA(2)==u'-'):
                                    pass
                                    self.mDECR(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'q') and (self.LA(2)==u'u'):
                                    pass
                                    self.mQuit(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'd') and (self.LA(2)==u'e'):
                                    pass
                                    self.mDefine(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'a') and (self.LA(2)==u'u'):
                                    pass
                                    self.mAuto(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'i') and (self.LA(2)==u'f'):
                                    pass
                                    self.mIf(True)
                                    theRetToken = self._returnToken
                                elif (_tokenSet_0.member(self.LA(1))) and (_tokenSet_1.member(self.LA(2))):
                                    pass
                                    self.mKEYWORDS(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'/') and (self.LA(2)==u'*'):
                                    pass
                                    self.mML_COMMENT(True)
                                    theRetToken = self._returnToken
                                elif ((self.LA(1) >= u'a' and self.LA(1) <= u'z')) and (True):
                                    pass
                                    self.mLETTER(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'/') and (True):
                                    pass
                                    self.mDIV(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'=') and (True):
                                    pass
                                    self.mASSIGN_OP(True)
                                    theRetToken = self._returnToken
                                elif (_tokenSet_2.member(self.LA(1))) and (True):
                                    pass
                                    self.mREL_OP(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'+') and (True):
                                    pass
                                    self.mPLUS(True)
                                    theRetToken = self._returnToken
                                elif (self.LA(1)==u'-') and (True):
                                    pass
                                    self.mMINUS(True)
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
        
    def mNEWLINE(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = NEWLINE
        _saveIndex = 0
        if (self.LA(1)==u'\r') and (self.LA(2)==u'\n'):
            pass
            self.match('\r')
            self.match('\n')
        elif (self.LA(1)==u'\r') and (True):
            pass
            self.match('\r')
        elif (self.LA(1)==u'\n'):
            pass
            self.match('\n')
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
            if (_tokenSet_3.member(self.LA(1))):
                pass
                self.matchNot('"')
            else:
                break
            
        _saveIndex = self.text.length()
        self.match('"')
        self.text.setLength(_saveIndex)
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
    
    def mINTEGER(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = INTEGER
        _saveIndex = 0
        pass
        _cnt9= 0
        while True:
            if (_tokenSet_4.member(self.LA(1))):
                pass
                self.mDIGIT(False)
            else:
                break
            
            _cnt9 += 1
        if _cnt9 < 1:
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
            self.mINTEGER(False)
            if (self.LA(1)==u'.'):
                pass
                self.match(".")
                self.mINTEGER(False)
            else: ## <m4>
                    pass
                
        elif la1 and la1 in u'.':
            pass
            self.match('.')
            self.mINTEGER(False)
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
    
    def mASSIGN_OP(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = ASSIGN_OP
        _saveIndex = 0
        pass
        self.match('=')
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
            if (self.LA(1)==u'<') and (self.LA(2)==u'='):
                pass
                self.match("<=")
            elif (self.LA(1)==u'>') and (self.LA(2)==u'='):
                pass
                self.match(">=")
            elif (self.LA(1)==u'<') and (True):
                pass
                self.match('<')
            elif (self.LA(1)==u'>') and (True):
                pass
                self.match('>')
            else:
                self.raise_NoViableAlt(self.LA(1))
            
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mINCR(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = INCR
        _saveIndex = 0
        pass
        self.match("++")
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mDECR(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = DECR
        _saveIndex = 0
        pass
        self.match("--")
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mQuit(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = Quit
        _saveIndex = 0
        pass
        self.match("quit")
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mDefine(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = Define
        _saveIndex = 0
        pass
        self.match("define")
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mAuto(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = Auto
        _saveIndex = 0
        pass
        self.match("auto")
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mIf(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = If
        _saveIndex = 0
        pass
        self.match("if")
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    def mKEYWORDS(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = KEYWORDS
        _saveIndex = 0
        la1 = self.LA(1)
        if False:
            pass
        elif la1 and la1 in u'b':
            pass
            self.match("break")
        elif la1 and la1 in u'l':
            pass
            self.match("length")
        elif la1 and la1 in u'r':
            pass
            self.match("return")
        elif la1 and la1 in u'f':
            pass
            self.match("for")
        elif la1 and la1 in u'w':
            pass
            self.match("while")
        elif la1 and la1 in u'i':
            pass
            self.match("ibase")
        elif la1 and la1 in u'o':
            pass
            self.match("obase")
        else:
            if (self.LA(1)==u's') and (self.LA(2)==u'q'):
                pass
                self.match("sqrt")
            elif (self.LA(1)==u's') and (self.LA(2)==u'c'):
                pass
                self.match("scale")
            else:
                self.raise_NoViableAlt(self.LA(1))
            
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
    
    def mCOMMA(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = COMMA
        _saveIndex = 0
        pass
        self.match(',')
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
    
    def mSEMICOLON(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = SEMICOLON
        _saveIndex = 0
        pass
        self.match(';')
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
    
    def mCARET(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = CARET
        _saveIndex = 0
        pass
        self.match('^')
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
    
    def mML_COMMENT(self, _createToken):    
        _ttype = 0
        _token = None
        _begin = self.text.length()
        _ttype = ML_COMMENT
        _saveIndex = 0
        pass
        self.match("/*")
        while True:
            la1 = self.LA(1)
            if False:
                pass
            elif la1 and la1 in u'\n':
                pass
                self.match('\n')
                self.newline();
            elif la1 and la1 in u'\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007\u0008\t\u000b\u000c\r\u000e\u000f\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f !"#$%&\'()+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\u007f':
                pass
                self.match(_tokenSet_5)
            else:
                if ((self.LA(1)==u'*') and ((self.LA(2) >= u'\u0000' and self.LA(2) <= u'\u007f')) and ( self.LA(2) != '/' )):
                    pass
                    self.match('*')
                else:
                    break
                
        self.match("*/")
        _ttype = SKIP;
        self.set_return_token(_createToken, _token, _ttype, _begin)
    
    

### generate bit set
def mk_tokenSet_0(): 
    ### var1
    data = [ 0L, 39567317494923264L, 0L, 0L]
    return data
_tokenSet_0 = antlr.BitSet(mk_tokenSet_0())

### generate bit set
def mk_tokenSet_1(): 
    ### var1
    data = [ 0L, 1830875838808064L, 0L, 0L]
    return data
_tokenSet_1 = antlr.BitSet(mk_tokenSet_1())

### generate bit set
def mk_tokenSet_2(): 
    ### var1
    data = [ 8070450540837863424L, 0L, 0L]
    return data
_tokenSet_2 = antlr.BitSet(mk_tokenSet_2())

### generate bit set
def mk_tokenSet_3(): 
    ### var1
    data = [ -17179869185L, -1L, 0L, 0L]
    return data
_tokenSet_3 = antlr.BitSet(mk_tokenSet_3())

### generate bit set
def mk_tokenSet_4(): 
    ### var1
    data = [ 287948901175001088L, 126L, 0L, 0L]
    return data
_tokenSet_4 = antlr.BitSet(mk_tokenSet_4())

### generate bit set
def mk_tokenSet_5(): 
    ### var1
    data = [ -4398046512129L, -1L, 0L, 0L]
    return data
_tokenSet_5 = antlr.BitSet(mk_tokenSet_5())
    
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
