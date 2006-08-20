// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-20 13:37:58

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class BcParserLexer extends Lexer {
    public static final int MINUS=14;
    public static final int LETTER=11;
    public static final int T29=29;
    public static final int INCR=20;
    public static final int ARRAY=4;
    public static final int If=25;
    public static final int WS=28;
    public static final int DECR=21;
    public static final int NUMBER=13;
    public static final int STRING=10;
    public static final int MUL_OP=16;
    public static final int Auto=24;
    public static final int Define=23;
    public static final int Quit=22;
    public static final int STMTS=7;
    public static final int PROGRAM=6;
    public static final int NEWLINE=9;
    public static final int VAR=8;
    public static final int ASSIGN_OP=18;
    public static final int INTEGER=12;
    public static final int KEYWORDS=26;
    public static final int PRINT=5;
    public static final int SEMICOLON=17;
    public static final int EOF=-1;
    public static final int Tokens=31;
    public static final int REL_OP=19;
    public static final int PLUS=15;
    public static final int ML_COMMENT=27;
    public static final int T30=30;
    public BcParserLexer() {;} 
    public BcParserLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "grammar/antlr_3/bc.g"; }

    // $ANTLR start T29
    public void mT29() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T29;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:3:7: ( '(' )
            // grammar/antlr_3/bc.g:3:7: '('
            {
            match('('); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T29

    // $ANTLR start T30
    public void mT30() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T30;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:4:7: ( ')' )
            // grammar/antlr_3/bc.g:4:7: ')'
            {
            match(')'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T30

    // $ANTLR start NEWLINE
    public void mNEWLINE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NEWLINE;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:31:11: ( ( '\\r' )? ( '\\n' )+ )
            // grammar/antlr_3/bc.g:31:11: ( '\\r' )? ( '\\n' )+
            {
            // grammar/antlr_3/bc.g:31:11: ( '\\r' )?
            int alt1=2;
            int LA1_0 = input.LA(1);
            if ( (LA1_0=='\r') ) {
                alt1=1;
            }
            switch (alt1) {
                case 1 :
                    // grammar/antlr_3/bc.g:31:12: '\\r'
                    {
                    match('\r'); 

                    }
                    break;

            }

            // grammar/antlr_3/bc.g:31:19: ( '\\n' )+
            int cnt2=0;
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);
                if ( (LA2_0=='\n') ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:31:19: '\\n'
            	    {
            	    match('\n'); 

            	    }
            	    break;

            	default :
            	    if ( cnt2 >= 1 ) break loop2;
                        EarlyExitException eee =
                            new EarlyExitException(2, input);
                        throw eee;
                }
                cnt2++;
            } while (true);


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end NEWLINE

    // $ANTLR start STRING
    public void mSTRING() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = STRING;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:34:10: ( '\\\"' (~ '\\\"' )* '\\\"' )
            // grammar/antlr_3/bc.g:34:10: '\\\"' (~ '\\\"' )* '\\\"'
            {
            match('\"'); 
            // grammar/antlr_3/bc.g:34:15: (~ '\\\"' )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>='\u0000' && LA3_0<='!')||(LA3_0>='#' && LA3_0<='\uFFFE')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:34:17: ~ '\\\"'
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='!')||(input.LA(1)>='#' && input.LA(1)<='\uFFFE') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse =
            	            new MismatchedSetException(null,input);
            	        recover(mse);    throw mse;
            	    }


            	    }
            	    break;

            	default :
            	    break loop3;
                }
            } while (true);

            match('\"'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end STRING

    // $ANTLR start LETTER
    public void mLETTER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = LETTER;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:36:10: ( 'a' .. 'z' )
            // grammar/antlr_3/bc.g:36:10: 'a' .. 'z'
            {
            matchRange('a','z'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end LETTER

    // $ANTLR start INTEGER
    public void mINTEGER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // grammar/antlr_3/bc.g:39:11: ( ( ('0'..'9'|'A'..'F'))+ )
            // grammar/antlr_3/bc.g:39:11: ( ('0'..'9'|'A'..'F'))+
            {
            // grammar/antlr_3/bc.g:39:11: ( ('0'..'9'|'A'..'F'))+
            int cnt4=0;
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='0' && LA4_0<='9')||(LA4_0>='A' && LA4_0<='F')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:39:12: ('0'..'9'|'A'..'F')
            	    {
            	    if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='F') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse =
            	            new MismatchedSetException(null,input);
            	        recover(mse);    throw mse;
            	    }


            	    }
            	    break;

            	default :
            	    if ( cnt4 >= 1 ) break loop4;
                        EarlyExitException eee =
                            new EarlyExitException(4, input);
                        throw eee;
                }
                cnt4++;
            } while (true);


            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end INTEGER

    // $ANTLR start NUMBER
    public void mNUMBER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NUMBER;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:42:5: ( INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt6=2;
            int LA6_0 = input.LA(1);
            if ( ((LA6_0>='0' && LA6_0<='9')||(LA6_0>='A' && LA6_0<='F')) ) {
                alt6=1;
            }
            else if ( (LA6_0=='.') ) {
                alt6=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("41:1: NUMBER : ( INTEGER ( '.' INTEGER )? | '.' INTEGER );", 6, 0, input);

                throw nvae;
            }
            switch (alt6) {
                case 1 :
                    // grammar/antlr_3/bc.g:42:5: INTEGER ( '.' INTEGER )?
                    {
                    mINTEGER(); 
                    // grammar/antlr_3/bc.g:42:13: ( '.' INTEGER )?
                    int alt5=2;
                    int LA5_0 = input.LA(1);
                    if ( (LA5_0=='.') ) {
                        alt5=1;
                    }
                    switch (alt5) {
                        case 1 :
                            // grammar/antlr_3/bc.g:42:14: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:44:5: '.' INTEGER
                    {
                    match('.'); 
                    mINTEGER(); 

                    }
                    break;

            }


                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end NUMBER

    // $ANTLR start MINUS
    public void mMINUS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = MINUS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:47:14: ( '-' )
            // grammar/antlr_3/bc.g:47:14: '-'
            {
            match('-'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end MINUS

    // $ANTLR start PLUS
    public void mPLUS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = PLUS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:48:14: ( '+' )
            // grammar/antlr_3/bc.g:48:14: '+'
            {
            match('+'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end PLUS

    // $ANTLR start MUL_OP
    public void mMUL_OP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = MUL_OP;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:49:12: ( ('*'|'/'|'%'))
            // grammar/antlr_3/bc.g:49:14: ('*'|'/'|'%')
            {
            if ( input.LA(1)=='%'||input.LA(1)=='*'||input.LA(1)=='/' ) {
                input.consume();

            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end MUL_OP

    // $ANTLR start SEMICOLON
    public void mSEMICOLON() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = SEMICOLON;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:50:14: ( ';' )
            // grammar/antlr_3/bc.g:50:14: ';'
            {
            match(';'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SEMICOLON

    // $ANTLR start ASSIGN_OP
    public void mASSIGN_OP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = ASSIGN_OP;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:51:14: ( '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' )
            int alt7=7;
            switch ( input.LA(1) ) {
            case '=':
                alt7=1;
                break;
            case '+':
                alt7=2;
                break;
            case '-':
                alt7=3;
                break;
            case '*':
                alt7=4;
                break;
            case '/':
                alt7=5;
                break;
            case '%':
                alt7=6;
                break;
            case '^':
                alt7=7;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("51:1: ASSIGN_OP : ( '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' );", 7, 0, input);

                throw nvae;
            }

            switch (alt7) {
                case 1 :
                    // grammar/antlr_3/bc.g:51:14: '='
                    {
                    match('='); 

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:51:20: '+='
                    {
                    match("+="); 


                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:51:27: '-='
                    {
                    match("-="); 


                    }
                    break;
                case 4 :
                    // grammar/antlr_3/bc.g:51:34: '*='
                    {
                    match("*="); 


                    }
                    break;
                case 5 :
                    // grammar/antlr_3/bc.g:51:41: '/='
                    {
                    match("/="); 


                    }
                    break;
                case 6 :
                    // grammar/antlr_3/bc.g:51:48: '%='
                    {
                    match("%="); 


                    }
                    break;
                case 7 :
                    // grammar/antlr_3/bc.g:51:55: '^='
                    {
                    match("^="); 


                    }
                    break;

            }


                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end ASSIGN_OP

    // $ANTLR start REL_OP
    public void mREL_OP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = REL_OP;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:52:14: ( '==' | '<=' | '>=' | '!=' | '<' | '>' )
            int alt8=6;
            switch ( input.LA(1) ) {
            case '=':
                alt8=1;
                break;
            case '<':
                int LA8_2 = input.LA(2);
                if ( (LA8_2=='=') ) {
                    alt8=2;
                }
                else {
                    alt8=5;}
                break;
            case '>':
                int LA8_3 = input.LA(2);
                if ( (LA8_3=='=') ) {
                    alt8=3;
                }
                else {
                    alt8=6;}
                break;
            case '!':
                alt8=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("52:1: REL_OP : ( '==' | '<=' | '>=' | '!=' | '<' | '>' );", 8, 0, input);

                throw nvae;
            }

            switch (alt8) {
                case 1 :
                    // grammar/antlr_3/bc.g:52:14: '=='
                    {
                    match("=="); 


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:52:21: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:52:28: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // grammar/antlr_3/bc.g:52:35: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // grammar/antlr_3/bc.g:52:42: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // grammar/antlr_3/bc.g:52:48: '>'
                    {
                    match('>'); 

                    }
                    break;

            }


                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end REL_OP

    // $ANTLR start INCR
    public void mINCR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = INCR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:53:14: ( '++' )
            // grammar/antlr_3/bc.g:53:14: '++'
            {
            match("++"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end INCR

    // $ANTLR start DECR
    public void mDECR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = DECR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:54:14: ( '--' )
            // grammar/antlr_3/bc.g:54:14: '--'
            {
            match("--"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end DECR

    // $ANTLR start Quit
    public void mQuit() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Quit;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:57:14: ( 'quit' )
            // grammar/antlr_3/bc.g:57:14: 'quit'
            {
            match("quit"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Quit

    // $ANTLR start Define
    public void mDefine() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Define;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:60:14: ( 'define' )
            // grammar/antlr_3/bc.g:60:14: 'define'
            {
            match("define"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Define

    // $ANTLR start Auto
    public void mAuto() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Auto;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:61:14: ( 'auto' )
            // grammar/antlr_3/bc.g:61:14: 'auto'
            {
            match("auto"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Auto

    // $ANTLR start If
    public void mIf() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = If;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:63:14: ( 'if' )
            // grammar/antlr_3/bc.g:63:14: 'if'
            {
            match("if"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end If

    // $ANTLR start KEYWORDS
    public void mKEYWORDS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = KEYWORDS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:67:5: ( 'break' | 'length' | 'return' | 'for' | 'while' | 'sqrt' | 'scale' | 'ibase' | 'obase' )
            int alt9=9;
            switch ( input.LA(1) ) {
            case 'b':
                alt9=1;
                break;
            case 'l':
                alt9=2;
                break;
            case 'r':
                alt9=3;
                break;
            case 'f':
                alt9=4;
                break;
            case 'w':
                alt9=5;
                break;
            case 's':
                int LA9_6 = input.LA(2);
                if ( (LA9_6=='q') ) {
                    alt9=6;
                }
                else if ( (LA9_6=='c') ) {
                    alt9=7;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("66:1: KEYWORDS : ( 'break' | 'length' | 'return' | 'for' | 'while' | 'sqrt' | 'scale' | 'ibase' | 'obase' );", 9, 6, input);

                    throw nvae;
                }
                break;
            case 'i':
                alt9=8;
                break;
            case 'o':
                alt9=9;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("66:1: KEYWORDS : ( 'break' | 'length' | 'return' | 'for' | 'while' | 'sqrt' | 'scale' | 'ibase' | 'obase' );", 9, 0, input);

                throw nvae;
            }

            switch (alt9) {
                case 1 :
                    // grammar/antlr_3/bc.g:67:5: 'break'
                    {
                    match("break"); 


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:67:16: 'length'
                    {
                    match("length"); 


                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:68:5: 'return'
                    {
                    match("return"); 


                    }
                    break;
                case 4 :
                    // grammar/antlr_3/bc.g:68:16: 'for'
                    {
                    match("for"); 


                    }
                    break;
                case 5 :
                    // grammar/antlr_3/bc.g:68:27: 'while'
                    {
                    match("while"); 


                    }
                    break;
                case 6 :
                    // grammar/antlr_3/bc.g:68:37: 'sqrt'
                    {
                    match("sqrt"); 


                    }
                    break;
                case 7 :
                    // grammar/antlr_3/bc.g:69:5: 'scale'
                    {
                    match("scale"); 


                    }
                    break;
                case 8 :
                    // grammar/antlr_3/bc.g:69:16: 'ibase'
                    {
                    match("ibase"); 


                    }
                    break;
                case 9 :
                    // grammar/antlr_3/bc.g:69:27: 'obase'
                    {
                    match("obase"); 


                    }
                    break;

            }


                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end KEYWORDS

    // $ANTLR start ML_COMMENT
    public void mML_COMMENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = ML_COMMENT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:74:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // grammar/antlr_3/bc.g:74:5: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // grammar/antlr_3/bc.g:74:10: ( options {greedy=false; } : . )*
            loop10:
            do {
                int alt10=2;
                int LA10_0 = input.LA(1);
                if ( (LA10_0=='*') ) {
                    int LA10_1 = input.LA(2);
                    if ( (LA10_1=='/') ) {
                        alt10=2;
                    }
                    else if ( ((LA10_1>='\u0000' && LA10_1<='.')||(LA10_1>='0' && LA10_1<='\uFFFE')) ) {
                        alt10=1;
                    }


                }
                else if ( ((LA10_0>='\u0000' && LA10_0<=')')||(LA10_0>='+' && LA10_0<='\uFFFE')) ) {
                    alt10=1;
                }


                switch (alt10) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:74:38: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop10;
                }
            } while (true);

            match("*/"); 


                  channel = 99;       // send into nirwana 
                

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end ML_COMMENT

    // $ANTLR start WS
    public void mWS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = WS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:82:5: ( ( (' '|'\\t'))+ )
            // grammar/antlr_3/bc.g:82:5: ( (' '|'\\t'))+
            {
            // grammar/antlr_3/bc.g:82:5: ( (' '|'\\t'))+
            int cnt11=0;
            loop11:
            do {
                int alt11=2;
                int LA11_0 = input.LA(1);
                if ( (LA11_0=='\t'||LA11_0==' ') ) {
                    alt11=1;
                }


                switch (alt11) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:82:7: (' '|'\\t')
            	    {
            	    if ( input.LA(1)=='\t'||input.LA(1)==' ' ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse =
            	            new MismatchedSetException(null,input);
            	        recover(mse);    throw mse;
            	    }


            	    }
            	    break;

            	default :
            	    if ( cnt11 >= 1 ) break loop11;
                        EarlyExitException eee =
                            new EarlyExitException(11, input);
                        throw eee;
                }
                cnt11++;
            } while (true);


                  channel = 99;       // send into nirwana 
                

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end WS

    public void mTokens() throws RecognitionException {
        // grammar/antlr_3/bc.g:1:10: ( T29 | T30 | NEWLINE | STRING | LETTER | NUMBER | MINUS | PLUS | MUL_OP | SEMICOLON | ASSIGN_OP | REL_OP | INCR | DECR | Quit | Define | Auto | If | KEYWORDS | ML_COMMENT | WS )
        int alt12=21;
        switch ( input.LA(1) ) {
        case '(':
            alt12=1;
            break;
        case ')':
            alt12=2;
            break;
        case '\n':
        case '\r':
            alt12=3;
            break;
        case '\"':
            alt12=4;
            break;
        case 'q':
            int LA12_5 = input.LA(2);
            if ( (LA12_5=='u') ) {
                alt12=15;
            }
            else {
                alt12=5;}
            break;
        case '.':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
            alt12=6;
            break;
        case '-':
            switch ( input.LA(2) ) {
            case '-':
                alt12=14;
                break;
            case '=':
                alt12=11;
                break;
            default:
                alt12=7;}

            break;
        case '+':
            switch ( input.LA(2) ) {
            case '=':
                alt12=11;
                break;
            case '+':
                alt12=13;
                break;
            default:
                alt12=8;}

            break;
        case '*':
            int LA12_9 = input.LA(2);
            if ( (LA12_9=='=') ) {
                alt12=11;
            }
            else {
                alt12=9;}
            break;
        case ';':
            alt12=10;
            break;
        case '=':
            int LA12_11 = input.LA(2);
            if ( (LA12_11=='=') ) {
                alt12=12;
            }
            else {
                alt12=11;}
            break;
        case '/':
            switch ( input.LA(2) ) {
            case '*':
                alt12=20;
                break;
            case '=':
                alt12=11;
                break;
            default:
                alt12=9;}

            break;
        case '%':
            int LA12_13 = input.LA(2);
            if ( (LA12_13=='=') ) {
                alt12=11;
            }
            else {
                alt12=9;}
            break;
        case '^':
            alt12=11;
            break;
        case '!':
        case '<':
        case '>':
            alt12=12;
            break;
        case 'd':
            int LA12_16 = input.LA(2);
            if ( (LA12_16=='e') ) {
                alt12=16;
            }
            else {
                alt12=5;}
            break;
        case 'a':
            int LA12_17 = input.LA(2);
            if ( (LA12_17=='u') ) {
                alt12=17;
            }
            else {
                alt12=5;}
            break;
        case 'i':
            switch ( input.LA(2) ) {
            case 'f':
                alt12=18;
                break;
            case 'b':
                alt12=19;
                break;
            default:
                alt12=5;}

            break;
        case 'b':
            int LA12_19 = input.LA(2);
            if ( (LA12_19=='r') ) {
                alt12=19;
            }
            else {
                alt12=5;}
            break;
        case 'l':
            int LA12_20 = input.LA(2);
            if ( (LA12_20=='e') ) {
                alt12=19;
            }
            else {
                alt12=5;}
            break;
        case 'r':
            int LA12_21 = input.LA(2);
            if ( (LA12_21=='e') ) {
                alt12=19;
            }
            else {
                alt12=5;}
            break;
        case 'f':
            int LA12_22 = input.LA(2);
            if ( (LA12_22=='o') ) {
                alt12=19;
            }
            else {
                alt12=5;}
            break;
        case 'w':
            int LA12_23 = input.LA(2);
            if ( (LA12_23=='h') ) {
                alt12=19;
            }
            else {
                alt12=5;}
            break;
        case 's':
            int LA12_24 = input.LA(2);
            if ( (LA12_24=='c'||LA12_24=='q') ) {
                alt12=19;
            }
            else {
                alt12=5;}
            break;
        case 'o':
            int LA12_25 = input.LA(2);
            if ( (LA12_25=='b') ) {
                alt12=19;
            }
            else {
                alt12=5;}
            break;
        case 'c':
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'p':
        case 't':
        case 'u':
        case 'v':
        case 'x':
        case 'y':
        case 'z':
            alt12=5;
            break;
        case '\t':
        case ' ':
            alt12=21;
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T29 | T30 | NEWLINE | STRING | LETTER | NUMBER | MINUS | PLUS | MUL_OP | SEMICOLON | ASSIGN_OP | REL_OP | INCR | DECR | Quit | Define | Auto | If | KEYWORDS | ML_COMMENT | WS );", 12, 0, input);

            throw nvae;
        }

        switch (alt12) {
            case 1 :
                // grammar/antlr_3/bc.g:1:10: T29
                {
                mT29(); 

                }
                break;
            case 2 :
                // grammar/antlr_3/bc.g:1:14: T30
                {
                mT30(); 

                }
                break;
            case 3 :
                // grammar/antlr_3/bc.g:1:18: NEWLINE
                {
                mNEWLINE(); 

                }
                break;
            case 4 :
                // grammar/antlr_3/bc.g:1:26: STRING
                {
                mSTRING(); 

                }
                break;
            case 5 :
                // grammar/antlr_3/bc.g:1:33: LETTER
                {
                mLETTER(); 

                }
                break;
            case 6 :
                // grammar/antlr_3/bc.g:1:40: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 7 :
                // grammar/antlr_3/bc.g:1:47: MINUS
                {
                mMINUS(); 

                }
                break;
            case 8 :
                // grammar/antlr_3/bc.g:1:53: PLUS
                {
                mPLUS(); 

                }
                break;
            case 9 :
                // grammar/antlr_3/bc.g:1:58: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 10 :
                // grammar/antlr_3/bc.g:1:65: SEMICOLON
                {
                mSEMICOLON(); 

                }
                break;
            case 11 :
                // grammar/antlr_3/bc.g:1:75: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 12 :
                // grammar/antlr_3/bc.g:1:85: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 13 :
                // grammar/antlr_3/bc.g:1:92: INCR
                {
                mINCR(); 

                }
                break;
            case 14 :
                // grammar/antlr_3/bc.g:1:97: DECR
                {
                mDECR(); 

                }
                break;
            case 15 :
                // grammar/antlr_3/bc.g:1:102: Quit
                {
                mQuit(); 

                }
                break;
            case 16 :
                // grammar/antlr_3/bc.g:1:107: Define
                {
                mDefine(); 

                }
                break;
            case 17 :
                // grammar/antlr_3/bc.g:1:114: Auto
                {
                mAuto(); 

                }
                break;
            case 18 :
                // grammar/antlr_3/bc.g:1:119: If
                {
                mIf(); 

                }
                break;
            case 19 :
                // grammar/antlr_3/bc.g:1:122: KEYWORDS
                {
                mKEYWORDS(); 

                }
                break;
            case 20 :
                // grammar/antlr_3/bc.g:1:131: ML_COMMENT
                {
                mML_COMMENT(); 

                }
                break;
            case 21 :
                // grammar/antlr_3/bc.g:1:142: WS
                {
                mWS(); 

                }
                break;

        }

    }


 

}