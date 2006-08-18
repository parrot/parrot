// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-18 21:04:45

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class BcParserLexer extends Lexer {
    public static final int T21=21;
    public static final int INCR_DECR=12;
    public static final int MINUS=15;
    public static final int LETTER=13;
    public static final int T22=22;
    public static final int WS=20;
    public static final int NUMBER=17;
    public static final int STRING=11;
    public static final int MUL_OP=16;
    public static final int Quit=7;
    public static final int PROGRAM=5;
    public static final int NEWLINE=8;
    public static final int VAR=6;
    public static final int ASSIGN_OP=10;
    public static final int INTEGER=18;
    public static final int PRINT=4;
    public static final int SEMICOLON=9;
    public static final int EOF=-1;
    public static final int Tokens=23;
    public static final int ML_COMMENT=19;
    public static final int PLUS=14;
    public BcParserLexer() {;} 
    public BcParserLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "grammar/antlr_3/bc.g"; }

    // $ANTLR start T21
    public void mT21() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T21;
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
    // $ANTLR end T21

    // $ANTLR start T22
    public void mT22() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T22;
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
    // $ANTLR end T22

    // $ANTLR start NUMBER
    public void mNUMBER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NUMBER;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:110:5: ( INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( ((LA2_0>='0' && LA2_0<='9')||(LA2_0>='A' && LA2_0<='F')) ) {
                alt2=1;
            }
            else if ( (LA2_0=='.') ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("109:1: NUMBER : ( INTEGER ( '.' INTEGER )? | '.' INTEGER );", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // grammar/antlr_3/bc.g:110:5: INTEGER ( '.' INTEGER )?
                    {
                    mINTEGER(); 
                    // grammar/antlr_3/bc.g:110:13: ( '.' INTEGER )?
                    int alt1=2;
                    int LA1_0 = input.LA(1);
                    if ( (LA1_0=='.') ) {
                        alt1=1;
                    }
                    switch (alt1) {
                        case 1 :
                            // grammar/antlr_3/bc.g:110:14: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:112:5: '.' INTEGER
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

    // $ANTLR start INTEGER
    public void mINTEGER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // grammar/antlr_3/bc.g:117:5: ( ( ('0'..'9'|'A'..'F'))+ )
            // grammar/antlr_3/bc.g:117:5: ( ('0'..'9'|'A'..'F'))+
            {
            // grammar/antlr_3/bc.g:117:5: ( ('0'..'9'|'A'..'F'))+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>='0' && LA3_0<='9')||(LA3_0>='A' && LA3_0<='F')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:117:6: ('0'..'9'|'A'..'F')
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
            	    if ( cnt3 >= 1 ) break loop3;
                        EarlyExitException eee =
                            new EarlyExitException(3, input);
                        throw eee;
                }
                cnt3++;
            } while (true);


            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end INTEGER

    // $ANTLR start MINUS
    public void mMINUS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = MINUS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:121:5: ( '-' )
            // grammar/antlr_3/bc.g:121:5: '-'
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
            // grammar/antlr_3/bc.g:125:5: ( '+' )
            // grammar/antlr_3/bc.g:125:5: '+'
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
            // grammar/antlr_3/bc.g:129:3: ( ('*'|'/'|'%'))
            // grammar/antlr_3/bc.g:129:5: ('*'|'/'|'%')
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
            // grammar/antlr_3/bc.g:133:5: ( ';' )
            // grammar/antlr_3/bc.g:133:5: ';'
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
            // grammar/antlr_3/bc.g:137:5: ( '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' )
            int alt4=7;
            switch ( input.LA(1) ) {
            case '=':
                alt4=1;
                break;
            case '+':
                alt4=2;
                break;
            case '-':
                alt4=3;
                break;
            case '*':
                alt4=4;
                break;
            case '/':
                alt4=5;
                break;
            case '%':
                alt4=6;
                break;
            case '^':
                alt4=7;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("136:1: ASSIGN_OP : ( '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' );", 4, 0, input);

                throw nvae;
            }

            switch (alt4) {
                case 1 :
                    // grammar/antlr_3/bc.g:137:5: '='
                    {
                    match('='); 

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:137:11: '+='
                    {
                    match("+="); 


                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:137:18: '-='
                    {
                    match("-="); 


                    }
                    break;
                case 4 :
                    // grammar/antlr_3/bc.g:137:25: '*='
                    {
                    match("*="); 


                    }
                    break;
                case 5 :
                    // grammar/antlr_3/bc.g:137:32: '/='
                    {
                    match("/="); 


                    }
                    break;
                case 6 :
                    // grammar/antlr_3/bc.g:137:39: '%='
                    {
                    match("%="); 


                    }
                    break;
                case 7 :
                    // grammar/antlr_3/bc.g:137:46: '^='
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

    // $ANTLR start INCR_DECR
    public void mINCR_DECR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = INCR_DECR;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:141:5: ( '++' | '--' )
            int alt5=2;
            int LA5_0 = input.LA(1);
            if ( (LA5_0=='+') ) {
                alt5=1;
            }
            else if ( (LA5_0=='-') ) {
                alt5=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("140:1: INCR_DECR : ( '++' | '--' );", 5, 0, input);

                throw nvae;
            }
            switch (alt5) {
                case 1 :
                    // grammar/antlr_3/bc.g:141:5: '++'
                    {
                    match("++"); 


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:141:12: '--'
                    {
                    match("--"); 


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
    // $ANTLR end INCR_DECR

    // $ANTLR start Quit
    public void mQuit() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Quit;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:146:5: ( 'quit' )
            // grammar/antlr_3/bc.g:146:5: 'quit'
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

    // $ANTLR start ML_COMMENT
    public void mML_COMMENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = ML_COMMENT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:151:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // grammar/antlr_3/bc.g:151:5: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // grammar/antlr_3/bc.g:151:10: ( options {greedy=false; } : . )*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( (LA6_0=='*') ) {
                    int LA6_1 = input.LA(2);
                    if ( (LA6_1=='/') ) {
                        alt6=2;
                    }
                    else if ( ((LA6_1>='\u0000' && LA6_1<='.')||(LA6_1>='0' && LA6_1<='\uFFFE')) ) {
                        alt6=1;
                    }


                }
                else if ( ((LA6_0>='\u0000' && LA6_0<=')')||(LA6_0>='+' && LA6_0<='\uFFFE')) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:151:38: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop6;
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
            // grammar/antlr_3/bc.g:159:5: ( ( (' '|'\\t'))+ )
            // grammar/antlr_3/bc.g:159:5: ( (' '|'\\t'))+
            {
            // grammar/antlr_3/bc.g:159:5: ( (' '|'\\t'))+
            int cnt7=0;
            loop7:
            do {
                int alt7=2;
                int LA7_0 = input.LA(1);
                if ( (LA7_0=='\t'||LA7_0==' ') ) {
                    alt7=1;
                }


                switch (alt7) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:159:7: (' '|'\\t')
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
            	    if ( cnt7 >= 1 ) break loop7;
                        EarlyExitException eee =
                            new EarlyExitException(7, input);
                        throw eee;
                }
                cnt7++;
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

    // $ANTLR start NEWLINE
    public void mNEWLINE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NEWLINE;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:167:5: ( ( '\\r' )? ( '\\n' )+ )
            // grammar/antlr_3/bc.g:167:5: ( '\\r' )? ( '\\n' )+
            {
            // grammar/antlr_3/bc.g:167:5: ( '\\r' )?
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( (LA8_0=='\r') ) {
                alt8=1;
            }
            switch (alt8) {
                case 1 :
                    // grammar/antlr_3/bc.g:167:6: '\\r'
                    {
                    match('\r'); 

                    }
                    break;

            }

            // grammar/antlr_3/bc.g:167:13: ( '\\n' )+
            int cnt9=0;
            loop9:
            do {
                int alt9=2;
                int LA9_0 = input.LA(1);
                if ( (LA9_0=='\n') ) {
                    alt9=1;
                }


                switch (alt9) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:167:13: '\\n'
            	    {
            	    match('\n'); 

            	    }
            	    break;

            	default :
            	    if ( cnt9 >= 1 ) break loop9;
                        EarlyExitException eee =
                            new EarlyExitException(9, input);
                        throw eee;
                }
                cnt9++;
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
            // grammar/antlr_3/bc.g:172:5: ( '\\\"' (~ '\\\"' )* '\\\"' )
            // grammar/antlr_3/bc.g:172:5: '\\\"' (~ '\\\"' )* '\\\"'
            {
            match('\"'); 
            // grammar/antlr_3/bc.g:172:10: (~ '\\\"' )*
            loop10:
            do {
                int alt10=2;
                int LA10_0 = input.LA(1);
                if ( ((LA10_0>='\u0000' && LA10_0<='!')||(LA10_0>='#' && LA10_0<='\uFFFE')) ) {
                    alt10=1;
                }


                switch (alt10) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:172:12: ~ '\\\"'
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
            	    break loop10;
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
            // grammar/antlr_3/bc.g:176:5: ( 'a' .. 'z' )
            // grammar/antlr_3/bc.g:176:5: 'a' .. 'z'
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

    public void mTokens() throws RecognitionException {
        // grammar/antlr_3/bc.g:1:10: ( T21 | T22 | NUMBER | MINUS | PLUS | MUL_OP | SEMICOLON | ASSIGN_OP | INCR_DECR | Quit | ML_COMMENT | WS | NEWLINE | STRING | LETTER )
        int alt11=15;
        switch ( input.LA(1) ) {
        case '(':
            alt11=1;
            break;
        case ')':
            alt11=2;
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
            alt11=3;
            break;
        case '-':
            switch ( input.LA(2) ) {
            case '=':
                alt11=8;
                break;
            case '-':
                alt11=9;
                break;
            default:
                alt11=4;}

            break;
        case '+':
            switch ( input.LA(2) ) {
            case '+':
                alt11=9;
                break;
            case '=':
                alt11=8;
                break;
            default:
                alt11=5;}

            break;
        case '*':
            int LA11_6 = input.LA(2);
            if ( (LA11_6=='=') ) {
                alt11=8;
            }
            else {
                alt11=6;}
            break;
        case ';':
            alt11=7;
            break;
        case '=':
        case '^':
            alt11=8;
            break;
        case '/':
            switch ( input.LA(2) ) {
            case '*':
                alt11=11;
                break;
            case '=':
                alt11=8;
                break;
            default:
                alt11=6;}

            break;
        case '%':
            int LA11_10 = input.LA(2);
            if ( (LA11_10=='=') ) {
                alt11=8;
            }
            else {
                alt11=6;}
            break;
        case 'q':
            int LA11_11 = input.LA(2);
            if ( (LA11_11=='u') ) {
                alt11=10;
            }
            else {
                alt11=15;}
            break;
        case '\t':
        case ' ':
            alt11=12;
            break;
        case '\n':
        case '\r':
            alt11=13;
            break;
        case '\"':
            alt11=14;
            break;
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
            alt11=15;
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T21 | T22 | NUMBER | MINUS | PLUS | MUL_OP | SEMICOLON | ASSIGN_OP | INCR_DECR | Quit | ML_COMMENT | WS | NEWLINE | STRING | LETTER );", 11, 0, input);

            throw nvae;
        }

        switch (alt11) {
            case 1 :
                // grammar/antlr_3/bc.g:1:10: T21
                {
                mT21(); 

                }
                break;
            case 2 :
                // grammar/antlr_3/bc.g:1:14: T22
                {
                mT22(); 

                }
                break;
            case 3 :
                // grammar/antlr_3/bc.g:1:18: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 4 :
                // grammar/antlr_3/bc.g:1:25: MINUS
                {
                mMINUS(); 

                }
                break;
            case 5 :
                // grammar/antlr_3/bc.g:1:31: PLUS
                {
                mPLUS(); 

                }
                break;
            case 6 :
                // grammar/antlr_3/bc.g:1:36: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 7 :
                // grammar/antlr_3/bc.g:1:43: SEMICOLON
                {
                mSEMICOLON(); 

                }
                break;
            case 8 :
                // grammar/antlr_3/bc.g:1:53: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 9 :
                // grammar/antlr_3/bc.g:1:63: INCR_DECR
                {
                mINCR_DECR(); 

                }
                break;
            case 10 :
                // grammar/antlr_3/bc.g:1:73: Quit
                {
                mQuit(); 

                }
                break;
            case 11 :
                // grammar/antlr_3/bc.g:1:78: ML_COMMENT
                {
                mML_COMMENT(); 

                }
                break;
            case 12 :
                // grammar/antlr_3/bc.g:1:89: WS
                {
                mWS(); 

                }
                break;
            case 13 :
                // grammar/antlr_3/bc.g:1:92: NEWLINE
                {
                mNEWLINE(); 

                }
                break;
            case 14 :
                // grammar/antlr_3/bc.g:1:100: STRING
                {
                mSTRING(); 

                }
                break;
            case 15 :
                // grammar/antlr_3/bc.g:1:107: LETTER
                {
                mLETTER(); 

                }
                break;

        }

    }


 

}