// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2006-12-31 13:05:00

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int MINUS=17;
    public static final int INCR=22;
    public static final int ARRAY=6;
    public static final int If=30;
    public static final int NUMBER=16;
    public static final int DECR=23;
    public static final int Break=25;
    public static final int MUL_OP=19;
    public static final int Define=24;
    public static final int T45=45;
    public static final int PROGRAM=9;
    public static final int STMTS=10;
    public static final int NEWLINE=12;
    public static final int ASSIGN_OP=20;
    public static final int INTEGER=15;
    public static final int Obase=35;
    public static final int FUNCTION=7;
    public static final int REL_OP=21;
    public static final int T46=46;
    public static final int ML_COMMENT=37;
    public static final int PLUS=18;
    public static final int Length=27;
    public static final int T41=41;
    public static final int T39=39;
    public static final int T44=44;
    public static final int LETTER=14;
    public static final int WS=38;
    public static final int STRING=13;
    public static final int Sqrt=32;
    public static final int T43=43;
    public static final int Ibase=34;
    public static final int START_PHP=4;
    public static final int T42=42;
    public static final int Scale=33;
    public static final int T40=40;
    public static final int Auto=36;
    public static final int Quit=26;
    public static final int VAR=11;
    public static final int PRINT=8;
    public static final int END_PHP=5;
    public static final int EOF=-1;
    public static final int While=31;
    public static final int Tokens=47;
    public static final int For=29;
    public static final int Return=28;
    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T39
    public void mT39() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T39;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:3:7: ( ';' )
            // src/antlr3/Plumhead.g:3:7: ';'
            {
            match(';'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = T40;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:4:7: ( '(' )
            // src/antlr3/Plumhead.g:4:7: '('
            {
            match('('); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = T41;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:5:7: ( ')' )
            // src/antlr3/Plumhead.g:5:7: ')'
            {
            match(')'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = T42;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:6:7: ( '{' )
            // src/antlr3/Plumhead.g:6:7: '{'
            {
            match('{'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = T43;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:7:7: ( '}' )
            // src/antlr3/Plumhead.g:7:7: '}'
            {
            match('}'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T43

    // $ANTLR start T44
    public void mT44() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T44;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:8:7: ( '[' )
            // src/antlr3/Plumhead.g:8:7: '['
            {
            match('['); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T44

    // $ANTLR start T45
    public void mT45() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T45;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:9:7: ( ']' )
            // src/antlr3/Plumhead.g:9:7: ']'
            {
            match(']'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T45

    // $ANTLR start T46
    public void mT46() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T46;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:10:7: ( ',' )
            // src/antlr3/Plumhead.g:10:7: ','
            {
            match(','); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T46

    // $ANTLR start NEWLINE
    public void mNEWLINE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = NEWLINE;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:30:11: ( ( '\\r' )? ( '\\n' )+ )
            // src/antlr3/Plumhead.g:30:11: ( '\\r' )? ( '\\n' )+
            {
            // src/antlr3/Plumhead.g:30:11: ( '\\r' )?
            int alt1=2;
            int LA1_0 = input.LA(1);
            if ( (LA1_0=='\r') ) {
                alt1=1;
            }
            switch (alt1) {
                case 1 :
                    // src/antlr3/Plumhead.g:30:12: '\\r'
                    {
                    match('\r'); 

                    }
                    break;

            }

            // src/antlr3/Plumhead.g:30:19: ( '\\n' )+
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
            	    // src/antlr3/Plumhead.g:30:19: '\\n'
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
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = STRING;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:33:10: ( '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:33:10: '\\\"' (~ '\\\"' )* '\\\"'
            {
            match('\"'); 
            // src/antlr3/Plumhead.g:33:15: (~ '\\\"' )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>='\u0000' && LA3_0<='!')||(LA3_0>='#' && LA3_0<='\uFFFE')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:33:17: ~ '\\\"'
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
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = LETTER;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:35:10: ( 'a' .. 'z' )
            // src/antlr3/Plumhead.g:35:10: 'a' .. 'z'
            {
            matchRange('a','z'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            // src/antlr3/Plumhead.g:38:11: ( ( ('0'..'9'|'A'..'F'))+ )
            // src/antlr3/Plumhead.g:38:11: ( ('0'..'9'|'A'..'F'))+
            {
            // src/antlr3/Plumhead.g:38:11: ( ('0'..'9'|'A'..'F'))+
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
            	    // src/antlr3/Plumhead.g:38:12: ('0'..'9'|'A'..'F')
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
            int _type = NUMBER;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:41:7: ( INTEGER ( '.' INTEGER )? | '.' INTEGER )
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
                    new NoViableAltException("40:1: NUMBER : ( INTEGER ( '.' INTEGER )? | '.' INTEGER );", 6, 0, input);

                throw nvae;
            }
            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:41:7: INTEGER ( '.' INTEGER )?
                    {
                    mINTEGER(); 
                    // src/antlr3/Plumhead.g:41:15: ( '.' INTEGER )?
                    int alt5=2;
                    int LA5_0 = input.LA(1);
                    if ( (LA5_0=='.') ) {
                        alt5=1;
                    }
                    switch (alt5) {
                        case 1 :
                            // src/antlr3/Plumhead.g:41:16: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:42:7: '.' INTEGER
                    {
                    match('.'); 
                    mINTEGER(); 

                    }
                    break;

            }


                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = MINUS;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:45:14: ( '-' )
            // src/antlr3/Plumhead.g:45:14: '-'
            {
            match('-'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = PLUS;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:46:14: ( '+' )
            // src/antlr3/Plumhead.g:46:14: '+'
            {
            match('+'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = MUL_OP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:48:12: ( ('*'|'/'|'%'))
            // src/antlr3/Plumhead.g:48:14: ('*'|'/'|'%')
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
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = ASSIGN_OP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:49:14: ( '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' )
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
                    new NoViableAltException("49:1: ASSIGN_OP : ( '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' );", 7, 0, input);

                throw nvae;
            }

            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:49:14: '='
                    {
                    match('='); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:49:21: '+='
                    {
                    match("+="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:49:28: '-='
                    {
                    match("-="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:49:35: '*='
                    {
                    match("*="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:49:42: '/='
                    {
                    match("/="); 


                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:49:49: '%='
                    {
                    match("%="); 


                    }
                    break;
                case 7 :
                    // src/antlr3/Plumhead.g:49:56: '^='
                    {
                    match("^="); 


                    }
                    break;

            }


                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = REL_OP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:50:14: ( '==' | '<=' | '>=' | '!=' | '<' | '>' )
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
                    new NoViableAltException("50:1: REL_OP : ( '==' | '<=' | '>=' | '!=' | '<' | '>' );", 8, 0, input);

                throw nvae;
            }

            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:50:14: '=='
                    {
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:50:21: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:50:28: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:50:35: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:50:42: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:50:49: '>'
                    {
                    match('>'); 

                    }
                    break;

            }


                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = INCR;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:51:14: ( '++' )
            // src/antlr3/Plumhead.g:51:14: '++'
            {
            match("++"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = DECR;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:52:14: ( '--' )
            // src/antlr3/Plumhead.g:52:14: '--'
            {
            match("--"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Define;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:54:14: ( 'define' )
            // src/antlr3/Plumhead.g:54:14: 'define'
            {
            match("define"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Break;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:55:14: ( 'break' )
            // src/antlr3/Plumhead.g:55:14: 'break'
            {
            match("break"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end Break

    // $ANTLR start START_PHP
    public void mSTART_PHP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = START_PHP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:56:14: ( '<?php' )
            // src/antlr3/Plumhead.g:56:14: '<?php'
            {
            match("<?php"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end START_PHP

    // $ANTLR start END_PHP
    public void mEND_PHP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = END_PHP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:57:14: ( '?>' )
            // src/antlr3/Plumhead.g:57:14: '?>'
            {
            match("?>"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end END_PHP

    // $ANTLR start Quit
    public void mQuit() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = Quit;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:60:14: ( 'quit' )
            // src/antlr3/Plumhead.g:60:14: 'quit'
            {
            match("quit"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Length;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:62:14: ( 'length' )
            // src/antlr3/Plumhead.g:62:14: 'length'
            {
            match("length"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Return;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:63:14: ( 'return' )
            // src/antlr3/Plumhead.g:63:14: 'return'
            {
            match("return"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = For;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:64:14: ( 'for' )
            // src/antlr3/Plumhead.g:64:14: 'for'
            {
            match("for"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = If;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:65:14: ( 'if' )
            // src/antlr3/Plumhead.g:65:14: 'if'
            {
            match("if"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = While;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:66:14: ( 'while' )
            // src/antlr3/Plumhead.g:66:14: 'while'
            {
            match("while"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Sqrt;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:67:14: ( 'sqrt' )
            // src/antlr3/Plumhead.g:67:14: 'sqrt'
            {
            match("sqrt"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Scale;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:68:14: ( 'scale' )
            // src/antlr3/Plumhead.g:68:14: 'scale'
            {
            match("scale"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Ibase;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:69:14: ( 'ibase' )
            // src/antlr3/Plumhead.g:69:14: 'ibase'
            {
            match("ibase"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Obase;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:70:14: ( 'obase' )
            // src/antlr3/Plumhead.g:70:14: 'obase'
            {
            match("obase"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = Auto;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:71:14: ( 'auto' )
            // src/antlr3/Plumhead.g:71:14: 'auto'
            {
            match("auto"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = ML_COMMENT;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:75:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // src/antlr3/Plumhead.g:75:5: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // src/antlr3/Plumhead.g:75:10: ( options {greedy=false; } : . )*
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
            	    // src/antlr3/Plumhead.g:75:38: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop9;
                }
            } while (true);

            match("*/"); 


                  _channel = HIDDEN;       // send into nirwana 
                

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            int _type = WS;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:83:5: ( ( (' '|'\\t'))+ )
            // src/antlr3/Plumhead.g:83:5: ( (' '|'\\t'))+
            {
            // src/antlr3/Plumhead.g:83:5: ( (' '|'\\t'))+
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
            	    // src/antlr3/Plumhead.g:83:7: (' '|'\\t')
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


                  _channel = HIDDEN;       // send into nirwana 
                

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end WS

    public void mTokens() throws RecognitionException {
        // src/antlr3/Plumhead.g:1:10: ( T39 | T40 | T41 | T42 | T43 | T44 | T45 | T46 | NEWLINE | STRING | LETTER | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | INCR | DECR | Define | Break | START_PHP | END_PHP | Quit | Length | Return | For | If | While | Sqrt | Scale | Ibase | Obase | Auto | ML_COMMENT | WS )
        int alt11=36;
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
        case '[':
            alt11=6;
            break;
        case ']':
            alt11=7;
            break;
        case ',':
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
            case '=':
                alt11=16;
                break;
            case '-':
                alt11=19;
                break;
            default:
                alt11=13;}

            break;
        case '+':
            switch ( input.LA(2) ) {
            case '=':
                alt11=16;
                break;
            case '+':
                alt11=18;
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
                alt11=35;
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
        case '<':
            int LA11_20 = input.LA(2);
            if ( (LA11_20=='?') ) {
                alt11=22;
            }
            else {
                alt11=17;}
            break;
        case '!':
        case '>':
            alt11=17;
            break;
        case 'b':
            int LA11_22 = input.LA(2);
            if ( (LA11_22=='r') ) {
                alt11=21;
            }
            else {
                alt11=11;}
            break;
        case 'q':
            int LA11_23 = input.LA(2);
            if ( (LA11_23=='u') ) {
                alt11=24;
            }
            else {
                alt11=11;}
            break;
        case '?':
            alt11=23;
            break;
        case 'l':
            int LA11_25 = input.LA(2);
            if ( (LA11_25=='e') ) {
                alt11=25;
            }
            else {
                alt11=11;}
            break;
        case 'r':
            int LA11_26 = input.LA(2);
            if ( (LA11_26=='e') ) {
                alt11=26;
            }
            else {
                alt11=11;}
            break;
        case 'f':
            int LA11_27 = input.LA(2);
            if ( (LA11_27=='o') ) {
                alt11=27;
            }
            else {
                alt11=11;}
            break;
        case 'i':
            switch ( input.LA(2) ) {
            case 'f':
                alt11=28;
                break;
            case 'b':
                alt11=32;
                break;
            default:
                alt11=11;}

            break;
        case 'w':
            int LA11_29 = input.LA(2);
            if ( (LA11_29=='h') ) {
                alt11=29;
            }
            else {
                alt11=11;}
            break;
        case 's':
            switch ( input.LA(2) ) {
            case 'c':
                alt11=31;
                break;
            case 'q':
                alt11=30;
                break;
            default:
                alt11=11;}

            break;
        case 'o':
            int LA11_31 = input.LA(2);
            if ( (LA11_31=='b') ) {
                alt11=33;
            }
            else {
                alt11=11;}
            break;
        case 'a':
            int LA11_32 = input.LA(2);
            if ( (LA11_32=='u') ) {
                alt11=34;
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
            alt11=36;
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T39 | T40 | T41 | T42 | T43 | T44 | T45 | T46 | NEWLINE | STRING | LETTER | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | INCR | DECR | Define | Break | START_PHP | END_PHP | Quit | Length | Return | For | If | While | Sqrt | Scale | Ibase | Obase | Auto | ML_COMMENT | WS );", 11, 0, input);

            throw nvae;
        }

        switch (alt11) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T39
                {
                mT39(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T40
                {
                mT40(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T41
                {
                mT41(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: T42
                {
                mT42(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: T43
                {
                mT43(); 

                }
                break;
            case 6 :
                // src/antlr3/Plumhead.g:1:30: T44
                {
                mT44(); 

                }
                break;
            case 7 :
                // src/antlr3/Plumhead.g:1:34: T45
                {
                mT45(); 

                }
                break;
            case 8 :
                // src/antlr3/Plumhead.g:1:38: T46
                {
                mT46(); 

                }
                break;
            case 9 :
                // src/antlr3/Plumhead.g:1:42: NEWLINE
                {
                mNEWLINE(); 

                }
                break;
            case 10 :
                // src/antlr3/Plumhead.g:1:50: STRING
                {
                mSTRING(); 

                }
                break;
            case 11 :
                // src/antlr3/Plumhead.g:1:57: LETTER
                {
                mLETTER(); 

                }
                break;
            case 12 :
                // src/antlr3/Plumhead.g:1:64: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 13 :
                // src/antlr3/Plumhead.g:1:71: MINUS
                {
                mMINUS(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:77: PLUS
                {
                mPLUS(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:82: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:89: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:99: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:106: INCR
                {
                mINCR(); 

                }
                break;
            case 19 :
                // src/antlr3/Plumhead.g:1:111: DECR
                {
                mDECR(); 

                }
                break;
            case 20 :
                // src/antlr3/Plumhead.g:1:116: Define
                {
                mDefine(); 

                }
                break;
            case 21 :
                // src/antlr3/Plumhead.g:1:123: Break
                {
                mBreak(); 

                }
                break;
            case 22 :
                // src/antlr3/Plumhead.g:1:129: START_PHP
                {
                mSTART_PHP(); 

                }
                break;
            case 23 :
                // src/antlr3/Plumhead.g:1:139: END_PHP
                {
                mEND_PHP(); 

                }
                break;
            case 24 :
                // src/antlr3/Plumhead.g:1:147: Quit
                {
                mQuit(); 

                }
                break;
            case 25 :
                // src/antlr3/Plumhead.g:1:152: Length
                {
                mLength(); 

                }
                break;
            case 26 :
                // src/antlr3/Plumhead.g:1:159: Return
                {
                mReturn(); 

                }
                break;
            case 27 :
                // src/antlr3/Plumhead.g:1:166: For
                {
                mFor(); 

                }
                break;
            case 28 :
                // src/antlr3/Plumhead.g:1:170: If
                {
                mIf(); 

                }
                break;
            case 29 :
                // src/antlr3/Plumhead.g:1:173: While
                {
                mWhile(); 

                }
                break;
            case 30 :
                // src/antlr3/Plumhead.g:1:179: Sqrt
                {
                mSqrt(); 

                }
                break;
            case 31 :
                // src/antlr3/Plumhead.g:1:184: Scale
                {
                mScale(); 

                }
                break;
            case 32 :
                // src/antlr3/Plumhead.g:1:190: Ibase
                {
                mIbase(); 

                }
                break;
            case 33 :
                // src/antlr3/Plumhead.g:1:196: Obase
                {
                mObase(); 

                }
                break;
            case 34 :
                // src/antlr3/Plumhead.g:1:202: Auto
                {
                mAuto(); 

                }
                break;
            case 35 :
                // src/antlr3/Plumhead.g:1:207: ML_COMMENT
                {
                mML_COMMENT(); 

                }
                break;
            case 36 :
                // src/antlr3/Plumhead.g:1:218: WS
                {
                mWS(); 

                }
                break;

        }

    }


 

}