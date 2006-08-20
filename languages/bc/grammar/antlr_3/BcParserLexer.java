// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-20 15:16:10

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class BcParserLexer extends Lexer {
    public static final int MINUS=14;
    public static final int INCR=19;
    public static final int ARRAY=4;
    public static final int If=27;
    public static final int NUMBER=13;
    public static final int DECR=20;
    public static final int T36=36;
    public static final int Break=22;
    public static final int MUL_OP=16;
    public static final int Define=21;
    public static final int STMTS=7;
    public static final int PROGRAM=6;
    public static final int NEWLINE=9;
    public static final int INTEGER=12;
    public static final int ASSIGN_OP=17;
    public static final int T37=37;
    public static final int Obase=32;
    public static final int REL_OP=18;
    public static final int ML_COMMENT=34;
    public static final int PLUS=15;
    public static final int T38=38;
    public static final int Length=24;
    public static final int T41=41;
    public static final int T39=39;
    public static final int LETTER=11;
    public static final int WS=35;
    public static final int STRING=10;
    public static final int Sqrt=29;
    public static final int T43=43;
    public static final int Ibase=31;
    public static final int T42=42;
    public static final int Scale=30;
    public static final int T40=40;
    public static final int Auto=33;
    public static final int Quit=23;
    public static final int VAR=8;
    public static final int PRINT=5;
    public static final int EOF=-1;
    public static final int While=28;
    public static final int Tokens=44;
    public static final int For=26;
    public static final int Return=25;
    public BcParserLexer() {;} 
    public BcParserLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "grammar/antlr_3/bc.g"; }

    // $ANTLR start T36
    public void mT36() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T36;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:3:7: ( ';' )
            // grammar/antlr_3/bc.g:3:7: ';'
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
    // $ANTLR end T36

    // $ANTLR start T37
    public void mT37() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T37;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:4:7: ( '(' )
            // grammar/antlr_3/bc.g:4:7: '('
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
    // $ANTLR end T37

    // $ANTLR start T38
    public void mT38() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T38;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:5:7: ( ')' )
            // grammar/antlr_3/bc.g:5:7: ')'
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
    // $ANTLR end T38

    // $ANTLR start T39
    public void mT39() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T39;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:6:7: ( '{' )
            // grammar/antlr_3/bc.g:6:7: '{'
            {
            match('{'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T39

    // $ANTLR start T40
    public void mT40() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T40;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:7:7: ( '}' )
            // grammar/antlr_3/bc.g:7:7: '}'
            {
            match('}'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T40

    // $ANTLR start T41
    public void mT41() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T41;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:8:7: ( ',' )
            // grammar/antlr_3/bc.g:8:7: ','
            {
            match(','); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T41

    // $ANTLR start T42
    public void mT42() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T42;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:9:7: ( '[' )
            // grammar/antlr_3/bc.g:9:7: '['
            {
            match('['); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T42

    // $ANTLR start T43
    public void mT43() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T43;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:10:7: ( ']' )
            // grammar/antlr_3/bc.g:10:7: ']'
            {
            match(']'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T43

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
            // grammar/antlr_3/bc.g:50:12: ( ('*'|'/'|'%'))
            // grammar/antlr_3/bc.g:50:14: ('*'|'/'|'%')
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

    // $ANTLR start Define
    public void mDefine() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Define;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:56:14: ( 'define' )
            // grammar/antlr_3/bc.g:56:14: 'define'
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

    // $ANTLR start Break
    public void mBreak() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Break;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:57:14: ( 'break' )
            // grammar/antlr_3/bc.g:57:14: 'break'
            {
            match("break"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Break

    // $ANTLR start Quit
    public void mQuit() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Quit;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:60:14: ( 'quit' )
            // grammar/antlr_3/bc.g:60:14: 'quit'
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

    // $ANTLR start Length
    public void mLength() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Length;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:62:14: ( 'length' )
            // grammar/antlr_3/bc.g:62:14: 'length'
            {
            match("length"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Length

    // $ANTLR start Return
    public void mReturn() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Return;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:63:14: ( 'return' )
            // grammar/antlr_3/bc.g:63:14: 'return'
            {
            match("return"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Return

    // $ANTLR start For
    public void mFor() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = For;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:64:14: ( 'for' )
            // grammar/antlr_3/bc.g:64:14: 'for'
            {
            match("for"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end For

    // $ANTLR start If
    public void mIf() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = If;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:65:14: ( 'if' )
            // grammar/antlr_3/bc.g:65:14: 'if'
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

    // $ANTLR start While
    public void mWhile() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = While;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:66:14: ( 'while' )
            // grammar/antlr_3/bc.g:66:14: 'while'
            {
            match("while"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end While

    // $ANTLR start Sqrt
    public void mSqrt() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Sqrt;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:67:14: ( 'sqrt' )
            // grammar/antlr_3/bc.g:67:14: 'sqrt'
            {
            match("sqrt"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Sqrt

    // $ANTLR start Scale
    public void mScale() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Scale;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:68:14: ( 'scale' )
            // grammar/antlr_3/bc.g:68:14: 'scale'
            {
            match("scale"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Scale

    // $ANTLR start Ibase
    public void mIbase() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Ibase;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:69:14: ( 'ibase' )
            // grammar/antlr_3/bc.g:69:14: 'ibase'
            {
            match("ibase"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Ibase

    // $ANTLR start Obase
    public void mObase() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Obase;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:70:14: ( 'obase' )
            // grammar/antlr_3/bc.g:70:14: 'obase'
            {
            match("obase"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Obase

    // $ANTLR start Auto
    public void mAuto() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = Auto;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:71:14: ( 'auto' )
            // grammar/antlr_3/bc.g:71:14: 'auto'
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

    // $ANTLR start ML_COMMENT
    public void mML_COMMENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = ML_COMMENT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:75:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // grammar/antlr_3/bc.g:75:5: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // grammar/antlr_3/bc.g:75:10: ( options {greedy=false; } : . )*
            loop9:
            do {
                int alt9=2;
                int LA9_0 = input.LA(1);
                if ( (LA9_0=='*') ) {
                    int LA9_1 = input.LA(2);
                    if ( (LA9_1=='/') ) {
                        alt9=2;
                    }
                    else if ( ((LA9_1>='\u0000' && LA9_1<='.')||(LA9_1>='0' && LA9_1<='\uFFFE')) ) {
                        alt9=1;
                    }


                }
                else if ( ((LA9_0>='\u0000' && LA9_0<=')')||(LA9_0>='+' && LA9_0<='\uFFFE')) ) {
                    alt9=1;
                }


                switch (alt9) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:75:38: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop9;
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
            // grammar/antlr_3/bc.g:83:5: ( ( (' '|'\\t'))+ )
            // grammar/antlr_3/bc.g:83:5: ( (' '|'\\t'))+
            {
            // grammar/antlr_3/bc.g:83:5: ( (' '|'\\t'))+
            int cnt10=0;
            loop10:
            do {
                int alt10=2;
                int LA10_0 = input.LA(1);
                if ( (LA10_0=='\t'||LA10_0==' ') ) {
                    alt10=1;
                }


                switch (alt10) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:83:7: (' '|'\\t')
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
            	    if ( cnt10 >= 1 ) break loop10;
                        EarlyExitException eee =
                            new EarlyExitException(10, input);
                        throw eee;
                }
                cnt10++;
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
        // grammar/antlr_3/bc.g:1:10: ( T36 | T37 | T38 | T39 | T40 | T41 | T42 | T43 | NEWLINE | STRING | LETTER | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | INCR | DECR | Define | Break | Quit | Length | Return | For | If | While | Sqrt | Scale | Ibase | Obase | Auto | ML_COMMENT | WS )
        int alt11=34;
        switch ( input.LA(1) ) {
        case ';':
            alt11=1;
            break;
        case '(':
            alt11=2;
            break;
        case ')':
            alt11=3;
            break;
        case '{':
            alt11=4;
            break;
        case '}':
            alt11=5;
            break;
        case ',':
            alt11=6;
            break;
        case '[':
            alt11=7;
            break;
        case ']':
            alt11=8;
            break;
        case '\n':
        case '\r':
            alt11=9;
            break;
        case '\"':
            alt11=10;
            break;
        case 'd':
            int LA11_11 = input.LA(2);
            if ( (LA11_11=='e') ) {
                alt11=20;
            }
            else {
                alt11=11;}
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
            alt11=12;
            break;
        case '-':
            switch ( input.LA(2) ) {
            case '-':
                alt11=19;
                break;
            case '=':
                alt11=16;
                break;
            default:
                alt11=13;}

            break;
        case '+':
            switch ( input.LA(2) ) {
            case '+':
                alt11=18;
                break;
            case '=':
                alt11=16;
                break;
            default:
                alt11=14;}

            break;
        case '*':
            int LA11_15 = input.LA(2);
            if ( (LA11_15=='=') ) {
                alt11=16;
            }
            else {
                alt11=15;}
            break;
        case '=':
            int LA11_16 = input.LA(2);
            if ( (LA11_16=='=') ) {
                alt11=17;
            }
            else {
                alt11=16;}
            break;
        case '/':
            switch ( input.LA(2) ) {
            case '=':
                alt11=16;
                break;
            case '*':
                alt11=33;
                break;
            default:
                alt11=15;}

            break;
        case '%':
            int LA11_18 = input.LA(2);
            if ( (LA11_18=='=') ) {
                alt11=16;
            }
            else {
                alt11=15;}
            break;
        case '^':
            alt11=16;
            break;
        case '!':
        case '<':
        case '>':
            alt11=17;
            break;
        case 'b':
            int LA11_21 = input.LA(2);
            if ( (LA11_21=='r') ) {
                alt11=21;
            }
            else {
                alt11=11;}
            break;
        case 'q':
            int LA11_22 = input.LA(2);
            if ( (LA11_22=='u') ) {
                alt11=22;
            }
            else {
                alt11=11;}
            break;
        case 'l':
            int LA11_23 = input.LA(2);
            if ( (LA11_23=='e') ) {
                alt11=23;
            }
            else {
                alt11=11;}
            break;
        case 'r':
            int LA11_24 = input.LA(2);
            if ( (LA11_24=='e') ) {
                alt11=24;
            }
            else {
                alt11=11;}
            break;
        case 'f':
            int LA11_25 = input.LA(2);
            if ( (LA11_25=='o') ) {
                alt11=25;
            }
            else {
                alt11=11;}
            break;
        case 'i':
            switch ( input.LA(2) ) {
            case 'b':
                alt11=30;
                break;
            case 'f':
                alt11=26;
                break;
            default:
                alt11=11;}

            break;
        case 'w':
            int LA11_27 = input.LA(2);
            if ( (LA11_27=='h') ) {
                alt11=27;
            }
            else {
                alt11=11;}
            break;
        case 's':
            switch ( input.LA(2) ) {
            case 'c':
                alt11=29;
                break;
            case 'q':
                alt11=28;
                break;
            default:
                alt11=11;}

            break;
        case 'o':
            int LA11_29 = input.LA(2);
            if ( (LA11_29=='b') ) {
                alt11=31;
            }
            else {
                alt11=11;}
            break;
        case 'a':
            int LA11_30 = input.LA(2);
            if ( (LA11_30=='u') ) {
                alt11=32;
            }
            else {
                alt11=11;}
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
            alt11=11;
            break;
        case '\t':
        case ' ':
            alt11=34;
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T36 | T37 | T38 | T39 | T40 | T41 | T42 | T43 | NEWLINE | STRING | LETTER | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | INCR | DECR | Define | Break | Quit | Length | Return | For | If | While | Sqrt | Scale | Ibase | Obase | Auto | ML_COMMENT | WS );", 11, 0, input);

            throw nvae;
        }

        switch (alt11) {
            case 1 :
                // grammar/antlr_3/bc.g:1:10: T36
                {
                mT36(); 

                }
                break;
            case 2 :
                // grammar/antlr_3/bc.g:1:14: T37
                {
                mT37(); 

                }
                break;
            case 3 :
                // grammar/antlr_3/bc.g:1:18: T38
                {
                mT38(); 

                }
                break;
            case 4 :
                // grammar/antlr_3/bc.g:1:22: T39
                {
                mT39(); 

                }
                break;
            case 5 :
                // grammar/antlr_3/bc.g:1:26: T40
                {
                mT40(); 

                }
                break;
            case 6 :
                // grammar/antlr_3/bc.g:1:30: T41
                {
                mT41(); 

                }
                break;
            case 7 :
                // grammar/antlr_3/bc.g:1:34: T42
                {
                mT42(); 

                }
                break;
            case 8 :
                // grammar/antlr_3/bc.g:1:38: T43
                {
                mT43(); 

                }
                break;
            case 9 :
                // grammar/antlr_3/bc.g:1:42: NEWLINE
                {
                mNEWLINE(); 

                }
                break;
            case 10 :
                // grammar/antlr_3/bc.g:1:50: STRING
                {
                mSTRING(); 

                }
                break;
            case 11 :
                // grammar/antlr_3/bc.g:1:57: LETTER
                {
                mLETTER(); 

                }
                break;
            case 12 :
                // grammar/antlr_3/bc.g:1:64: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 13 :
                // grammar/antlr_3/bc.g:1:71: MINUS
                {
                mMINUS(); 

                }
                break;
            case 14 :
                // grammar/antlr_3/bc.g:1:77: PLUS
                {
                mPLUS(); 

                }
                break;
            case 15 :
                // grammar/antlr_3/bc.g:1:82: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 16 :
                // grammar/antlr_3/bc.g:1:89: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 17 :
                // grammar/antlr_3/bc.g:1:99: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 18 :
                // grammar/antlr_3/bc.g:1:106: INCR
                {
                mINCR(); 

                }
                break;
            case 19 :
                // grammar/antlr_3/bc.g:1:111: DECR
                {
                mDECR(); 

                }
                break;
            case 20 :
                // grammar/antlr_3/bc.g:1:116: Define
                {
                mDefine(); 

                }
                break;
            case 21 :
                // grammar/antlr_3/bc.g:1:123: Break
                {
                mBreak(); 

                }
                break;
            case 22 :
                // grammar/antlr_3/bc.g:1:129: Quit
                {
                mQuit(); 

                }
                break;
            case 23 :
                // grammar/antlr_3/bc.g:1:134: Length
                {
                mLength(); 

                }
                break;
            case 24 :
                // grammar/antlr_3/bc.g:1:141: Return
                {
                mReturn(); 

                }
                break;
            case 25 :
                // grammar/antlr_3/bc.g:1:148: For
                {
                mFor(); 

                }
                break;
            case 26 :
                // grammar/antlr_3/bc.g:1:152: If
                {
                mIf(); 

                }
                break;
            case 27 :
                // grammar/antlr_3/bc.g:1:155: While
                {
                mWhile(); 

                }
                break;
            case 28 :
                // grammar/antlr_3/bc.g:1:161: Sqrt
                {
                mSqrt(); 

                }
                break;
            case 29 :
                // grammar/antlr_3/bc.g:1:166: Scale
                {
                mScale(); 

                }
                break;
            case 30 :
                // grammar/antlr_3/bc.g:1:172: Ibase
                {
                mIbase(); 

                }
                break;
            case 31 :
                // grammar/antlr_3/bc.g:1:178: Obase
                {
                mObase(); 

                }
                break;
            case 32 :
                // grammar/antlr_3/bc.g:1:184: Auto
                {
                mAuto(); 

                }
                break;
            case 33 :
                // grammar/antlr_3/bc.g:1:189: ML_COMMENT
                {
                mML_COMMENT(); 

                }
                break;
            case 34 :
                // grammar/antlr_3/bc.g:1:200: WS
                {
                mWS(); 

                }
                break;

        }

    }


 

}