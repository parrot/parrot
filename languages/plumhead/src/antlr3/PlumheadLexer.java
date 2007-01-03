// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-03 20:11:10

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int MINUS=19;
    public static final int INCR=24;
    public static final int ARRAY=6;
    public static final int START_CODE=13;
    public static final int If=32;
    public static final int NUMBER=18;
    public static final int DECR=25;
    public static final int Break=27;
    public static final int MUL_OP=21;
    public static final int SEA=12;
    public static final int Define=26;
    public static final int T45=45;
    public static final int PROGRAM=9;
    public static final int STMTS=10;
    public static final int NEWLINE=14;
    public static final int ASSIGN_OP=22;
    public static final int INTEGER=17;
    public static final int Obase=37;
    public static final int FUNCTION=7;
    public static final int REL_OP=23;
    public static final int T46=46;
    public static final int ML_COMMENT=39;
    public static final int PLUS=20;
    public static final int Length=29;
    public static final int T41=41;
    public static final int T44=44;
    public static final int LETTER=16;
    public static final int WS=40;
    public static final int STRING=15;
    public static final int Sqrt=34;
    public static final int T43=43;
    public static final int Ibase=36;
    public static final int START_PHP=4;
    public static final int T42=42;
    public static final int Scale=35;
    public static final int Auto=38;
    public static final int Quit=28;
    public static final int VAR=11;
    public static final int PRINT=8;
    public static final int T48=48;
    public static final int END_PHP=5;
    public static final int EOF=-1;
    public static final int While=33;
    public static final int T47=47;
    public static final int Tokens=49;
    public static final int For=31;
    public static final int Return=30;
    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T41
    public void mT41() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T41;
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
    // $ANTLR end T46

    // $ANTLR start T47
    public void mT47() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T47;
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
    // $ANTLR end T47

    // $ANTLR start T48
    public void mT48() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T48;
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
    // $ANTLR end T48

    // $ANTLR start SEA
    public void mSEA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SEA;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:30:14: ( (~ '<' )+ )
            // src/antlr3/Plumhead.g:30:14: (~ '<' )+
            {
            // src/antlr3/Plumhead.g:30:14: (~ '<' )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( ((LA1_0>='\u0000' && LA1_0<=';')||(LA1_0>='=' && LA1_0<='\uFFFE')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:30:15: ~ '<'
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<=';')||(input.LA(1)>='=' && input.LA(1)<='\uFFFE') ) {
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
            	    if ( cnt1 >= 1 ) break loop1;
                        EarlyExitException eee =
                            new EarlyExitException(1, input);
                        throw eee;
                }
                cnt1++;
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
    // $ANTLR end SEA

    // $ANTLR start START_CODE
    public void mSTART_CODE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = START_CODE;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:31:14: ( '<' )
            // src/antlr3/Plumhead.g:31:14: '<'
            {
            match('<'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end START_CODE

    // $ANTLR start NEWLINE
    public void mNEWLINE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = NEWLINE;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:35:11: ( ( '\\r' )? ( '\\n' )+ )
            // src/antlr3/Plumhead.g:35:11: ( '\\r' )? ( '\\n' )+
            {
            // src/antlr3/Plumhead.g:35:11: ( '\\r' )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0=='\r') ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:35:12: '\\r'
                    {
                    match('\r'); 

                    }
                    break;

            }

            // src/antlr3/Plumhead.g:35:19: ( '\\n' )+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( (LA3_0=='\n') ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:35:19: '\\n'
            	    {
            	    match('\n'); 

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
            // src/antlr3/Plumhead.g:38:10: ( '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:38:10: '\\\"' (~ '\\\"' )* '\\\"'
            {
            match('\"'); 
            // src/antlr3/Plumhead.g:38:15: (~ '\\\"' )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='\u0000' && LA4_0<='!')||(LA4_0>='#' && LA4_0<='\uFFFE')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:38:17: ~ '\\\"'
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
            	    break loop4;
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
            // src/antlr3/Plumhead.g:40:10: ( 'a' .. 'z' )
            // src/antlr3/Plumhead.g:40:10: 'a' .. 'z'
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
            // src/antlr3/Plumhead.g:43:11: ( ( ('0'..'9'|'A'..'F'))+ )
            // src/antlr3/Plumhead.g:43:11: ( ('0'..'9'|'A'..'F'))+
            {
            // src/antlr3/Plumhead.g:43:11: ( ('0'..'9'|'A'..'F'))+
            int cnt5=0;
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>='0' && LA5_0<='9')||(LA5_0>='A' && LA5_0<='F')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:43:12: ('0'..'9'|'A'..'F')
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
            	    if ( cnt5 >= 1 ) break loop5;
                        EarlyExitException eee =
                            new EarlyExitException(5, input);
                        throw eee;
                }
                cnt5++;
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
            // src/antlr3/Plumhead.g:46:7: ( INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt7=2;
            int LA7_0 = input.LA(1);
            if ( ((LA7_0>='0' && LA7_0<='9')||(LA7_0>='A' && LA7_0<='F')) ) {
                alt7=1;
            }
            else if ( (LA7_0=='.') ) {
                alt7=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("45:1: NUMBER : ( INTEGER ( '.' INTEGER )? | '.' INTEGER );", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:46:7: INTEGER ( '.' INTEGER )?
                    {
                    mINTEGER(); 
                    // src/antlr3/Plumhead.g:46:15: ( '.' INTEGER )?
                    int alt6=2;
                    int LA6_0 = input.LA(1);
                    if ( (LA6_0=='.') ) {
                        alt6=1;
                    }
                    switch (alt6) {
                        case 1 :
                            // src/antlr3/Plumhead.g:46:16: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:47:7: '.' INTEGER
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
            // src/antlr3/Plumhead.g:50:14: ( '-' )
            // src/antlr3/Plumhead.g:50:14: '-'
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
            // src/antlr3/Plumhead.g:51:14: ( '+' )
            // src/antlr3/Plumhead.g:51:14: '+'
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
            // src/antlr3/Plumhead.g:53:12: ( ('*'|'/'|'%'))
            // src/antlr3/Plumhead.g:53:14: ('*'|'/'|'%')
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
            // src/antlr3/Plumhead.g:54:14: ( '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' )
            int alt8=7;
            switch ( input.LA(1) ) {
            case '=':
                alt8=1;
                break;
            case '+':
                alt8=2;
                break;
            case '-':
                alt8=3;
                break;
            case '*':
                alt8=4;
                break;
            case '/':
                alt8=5;
                break;
            case '%':
                alt8=6;
                break;
            case '^':
                alt8=7;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("54:1: ASSIGN_OP : ( '=' | '+=' | '-=' | '*=' | '/=' | '%=' | '^=' );", 8, 0, input);

                throw nvae;
            }

            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:54:14: '='
                    {
                    match('='); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:54:21: '+='
                    {
                    match("+="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:54:28: '-='
                    {
                    match("-="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:54:35: '*='
                    {
                    match("*="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:54:42: '/='
                    {
                    match("/="); 


                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:54:49: '%='
                    {
                    match("%="); 


                    }
                    break;
                case 7 :
                    // src/antlr3/Plumhead.g:54:56: '^='
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
            // src/antlr3/Plumhead.g:55:14: ( '==' | '<=' | '>=' | '!=' | '<' | '>' )
            int alt9=6;
            switch ( input.LA(1) ) {
            case '=':
                alt9=1;
                break;
            case '<':
                int LA9_2 = input.LA(2);
                if ( (LA9_2=='=') ) {
                    alt9=2;
                }
                else {
                    alt9=5;}
                break;
            case '>':
                int LA9_3 = input.LA(2);
                if ( (LA9_3=='=') ) {
                    alt9=3;
                }
                else {
                    alt9=6;}
                break;
            case '!':
                alt9=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("55:1: REL_OP : ( '==' | '<=' | '>=' | '!=' | '<' | '>' );", 9, 0, input);

                throw nvae;
            }

            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:55:14: '=='
                    {
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:55:21: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:55:28: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:55:35: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:55:42: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:55:49: '>'
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
            // src/antlr3/Plumhead.g:56:14: ( '++' )
            // src/antlr3/Plumhead.g:56:14: '++'
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
            // src/antlr3/Plumhead.g:57:14: ( '--' )
            // src/antlr3/Plumhead.g:57:14: '--'
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
            // src/antlr3/Plumhead.g:59:14: ( 'define' )
            // src/antlr3/Plumhead.g:59:14: 'define'
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
            // src/antlr3/Plumhead.g:60:14: ( 'break' )
            // src/antlr3/Plumhead.g:60:14: 'break'
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

    // $ANTLR start END_PHP
    public void mEND_PHP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = END_PHP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:61:14: ( '?>' )
            // src/antlr3/Plumhead.g:61:14: '?>'
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
            // src/antlr3/Plumhead.g:64:14: ( 'quit' )
            // src/antlr3/Plumhead.g:64:14: 'quit'
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
            // src/antlr3/Plumhead.g:66:14: ( 'length' )
            // src/antlr3/Plumhead.g:66:14: 'length'
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
            // src/antlr3/Plumhead.g:67:14: ( 'return' )
            // src/antlr3/Plumhead.g:67:14: 'return'
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
            // src/antlr3/Plumhead.g:68:14: ( 'for' )
            // src/antlr3/Plumhead.g:68:14: 'for'
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
            // src/antlr3/Plumhead.g:69:14: ( 'if' )
            // src/antlr3/Plumhead.g:69:14: 'if'
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
            // src/antlr3/Plumhead.g:70:14: ( 'while' )
            // src/antlr3/Plumhead.g:70:14: 'while'
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
            // src/antlr3/Plumhead.g:71:14: ( 'sqrt' )
            // src/antlr3/Plumhead.g:71:14: 'sqrt'
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
            // src/antlr3/Plumhead.g:72:14: ( 'scale' )
            // src/antlr3/Plumhead.g:72:14: 'scale'
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
            // src/antlr3/Plumhead.g:73:14: ( 'ibase' )
            // src/antlr3/Plumhead.g:73:14: 'ibase'
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
            // src/antlr3/Plumhead.g:74:14: ( 'obase' )
            // src/antlr3/Plumhead.g:74:14: 'obase'
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
            // src/antlr3/Plumhead.g:75:14: ( 'auto' )
            // src/antlr3/Plumhead.g:75:14: 'auto'
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
            // src/antlr3/Plumhead.g:79:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // src/antlr3/Plumhead.g:79:5: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // src/antlr3/Plumhead.g:79:10: ( options {greedy=false; } : . )*
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
            	    // src/antlr3/Plumhead.g:79:38: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop10;
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
            // src/antlr3/Plumhead.g:87:5: ( ( (' '|'\\t'))+ )
            // src/antlr3/Plumhead.g:87:5: ( (' '|'\\t'))+
            {
            // src/antlr3/Plumhead.g:87:5: ( (' '|'\\t'))+
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
            	    // src/antlr3/Plumhead.g:87:7: (' '|'\\t')
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
        // src/antlr3/Plumhead.g:1:10: ( T41 | T42 | T43 | T44 | T45 | T46 | T47 | T48 | SEA | START_CODE | NEWLINE | STRING | LETTER | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | INCR | DECR | Define | Break | END_PHP | Quit | Length | Return | For | If | While | Sqrt | Scale | Ibase | Obase | Auto | ML_COMMENT | WS )
        int alt12=37;
        alt12 = dfa12.predict(input);
        switch (alt12) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T41
                {
                mT41(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T42
                {
                mT42(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T43
                {
                mT43(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: T44
                {
                mT44(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: T45
                {
                mT45(); 

                }
                break;
            case 6 :
                // src/antlr3/Plumhead.g:1:30: T46
                {
                mT46(); 

                }
                break;
            case 7 :
                // src/antlr3/Plumhead.g:1:34: T47
                {
                mT47(); 

                }
                break;
            case 8 :
                // src/antlr3/Plumhead.g:1:38: T48
                {
                mT48(); 

                }
                break;
            case 9 :
                // src/antlr3/Plumhead.g:1:42: SEA
                {
                mSEA(); 

                }
                break;
            case 10 :
                // src/antlr3/Plumhead.g:1:46: START_CODE
                {
                mSTART_CODE(); 

                }
                break;
            case 11 :
                // src/antlr3/Plumhead.g:1:57: NEWLINE
                {
                mNEWLINE(); 

                }
                break;
            case 12 :
                // src/antlr3/Plumhead.g:1:65: STRING
                {
                mSTRING(); 

                }
                break;
            case 13 :
                // src/antlr3/Plumhead.g:1:72: LETTER
                {
                mLETTER(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:79: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:86: MINUS
                {
                mMINUS(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:92: PLUS
                {
                mPLUS(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:97: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:104: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 19 :
                // src/antlr3/Plumhead.g:1:114: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 20 :
                // src/antlr3/Plumhead.g:1:121: INCR
                {
                mINCR(); 

                }
                break;
            case 21 :
                // src/antlr3/Plumhead.g:1:126: DECR
                {
                mDECR(); 

                }
                break;
            case 22 :
                // src/antlr3/Plumhead.g:1:131: Define
                {
                mDefine(); 

                }
                break;
            case 23 :
                // src/antlr3/Plumhead.g:1:138: Break
                {
                mBreak(); 

                }
                break;
            case 24 :
                // src/antlr3/Plumhead.g:1:144: END_PHP
                {
                mEND_PHP(); 

                }
                break;
            case 25 :
                // src/antlr3/Plumhead.g:1:152: Quit
                {
                mQuit(); 

                }
                break;
            case 26 :
                // src/antlr3/Plumhead.g:1:157: Length
                {
                mLength(); 

                }
                break;
            case 27 :
                // src/antlr3/Plumhead.g:1:164: Return
                {
                mReturn(); 

                }
                break;
            case 28 :
                // src/antlr3/Plumhead.g:1:171: For
                {
                mFor(); 

                }
                break;
            case 29 :
                // src/antlr3/Plumhead.g:1:175: If
                {
                mIf(); 

                }
                break;
            case 30 :
                // src/antlr3/Plumhead.g:1:178: While
                {
                mWhile(); 

                }
                break;
            case 31 :
                // src/antlr3/Plumhead.g:1:184: Sqrt
                {
                mSqrt(); 

                }
                break;
            case 32 :
                // src/antlr3/Plumhead.g:1:189: Scale
                {
                mScale(); 

                }
                break;
            case 33 :
                // src/antlr3/Plumhead.g:1:195: Ibase
                {
                mIbase(); 

                }
                break;
            case 34 :
                // src/antlr3/Plumhead.g:1:201: Obase
                {
                mObase(); 

                }
                break;
            case 35 :
                // src/antlr3/Plumhead.g:1:207: Auto
                {
                mAuto(); 

                }
                break;
            case 36 :
                // src/antlr3/Plumhead.g:1:212: ML_COMMENT
                {
                mML_COMMENT(); 

                }
                break;
            case 37 :
                // src/antlr3/Plumhead.g:1:223: WS
                {
                mWS(); 

                }
                break;

        }

    }


    protected DFA12 dfa12 = new DFA12(this);
    public static final String DFA12_eotS =
        "\1\uffff\1\47\1\50\1\51\1\52\1\53\1\54\1\55\1\56\1\46\1\60\32\46"+
        "\14\uffff\1\46\2\uffff\3\46\7\uffff\1\46\5\uffff\6\46\1\uffff\11"+
        "\46\1\uffff\4\46\1\uffff\11\46\1\uffff\5\46\1\uffff\1\46\1\uffff"+
        "\1\46\1\uffff\2\46\7\uffff";
    public static final String DFA12_eofS =
        "\167\uffff";
    public static final String DFA12_minS =
        "\11\0\1\12\1\75\1\12\1\0\1\145\1\56\1\60\1\55\1\53\3\75\1\52\3\75"+
        "\1\76\1\162\1\165\1\11\2\145\1\157\1\142\1\150\1\143\1\142\1\165"+
        "\14\uffff\1\0\2\uffff\1\146\2\60\7\uffff\1\0\5\uffff\1\145\1\151"+
        "\1\156\1\164\1\162\1\141\1\uffff\1\151\1\141\1\162\1\141\1\164\1"+
        "\151\1\60\2\0\1\uffff\1\141\1\164\1\147\1\165\1\uffff\1\163\2\154"+
        "\1\164\1\163\1\157\1\156\1\0\1\153\1\uffff\1\164\1\162\3\145\1\uffff"+
        "\1\145\1\uffff\1\145\1\uffff\1\150\1\156\7\uffff";
    public static final String DFA12_maxS =
        "\11\ufffe\1\12\1\75\1\12\1\ufffe\1\145\2\106\11\75\1\76\1\162\1"+
        "\165\1\40\2\145\1\157\1\146\1\150\1\161\1\142\1\165\14\uffff\1\ufffe"+
        "\2\uffff\1\146\2\106\7\uffff\1\ufffe\5\uffff\1\145\1\151\1\156\1"+
        "\164\1\162\1\141\1\uffff\1\151\1\141\1\162\1\141\1\164\1\151\1\106"+
        "\2\ufffe\1\uffff\1\141\1\164\1\147\1\165\1\uffff\1\163\2\154\1\164"+
        "\1\163\1\157\1\156\1\ufffe\1\153\1\uffff\1\164\1\162\3\145\1\uffff"+
        "\1\145\1\uffff\1\145\1\uffff\1\150\1\156\7\uffff";
    public static final String DFA12_acceptS =
        "\45\uffff\2\11\1\1\1\2\1\3\1\4\1\5\1\6\1\7\1\10\1\23\1\12\1\uffff"+
        "\1\11\1\14\3\uffff\7\11\1\uffff\5\11\6\uffff\1\11\11\uffff\1\44"+
        "\4\uffff\1\11\11\uffff\1\11\5\uffff\1\11\1\uffff\1\11\1\uffff\1"+
        "\11\2\uffff\7\11";
    public static final String DFA12_specialS =
        "\167\uffff}>";
    public static final String[] DFA12_transition = {
        "\11\46\1\34\1\13\2\46\1\11\22\46\1\34\1\30\1\14\2\46\1\26\2\46\1"+
        "\2\1\3\1\22\1\21\1\10\1\20\1\17\1\25\12\16\1\46\1\1\1\12\1\23\1"+
        "\27\1\31\1\46\6\16\24\46\1\6\1\46\1\7\1\24\2\46\1\44\1\32\1\45\1"+
        "\15\1\45\1\37\2\45\1\40\2\45\1\35\2\45\1\43\1\45\1\33\1\36\1\42"+
        "\3\45\1\41\3\45\1\4\1\46\1\5\uff81\46",
        "\74\46\1\uffff\uffc2\46",
        "\74\46\1\uffff\uffc2\46",
        "\74\46\1\uffff\uffc2\46",
        "\74\46\1\uffff\uffc2\46",
        "\74\46\1\uffff\uffc2\46",
        "\74\46\1\uffff\uffc2\46",
        "\74\46\1\uffff\uffc2\46",
        "\74\46\1\uffff\uffc2\46",
        "\1\13",
        "\1\57",
        "\1\13",
        "\42\61\1\62\31\61\1\63\uffc2\61",
        "\1\64",
        "\1\65\1\uffff\12\16\7\uffff\6\16",
        "\12\66\7\uffff\6\66",
        "\1\67\17\uffff\1\70",
        "\1\72\21\uffff\1\71",
        "\1\73",
        "\1\74",
        "\1\75",
        "\1\76\22\uffff\1\77",
        "\1\100",
        "\1\101",
        "\1\102",
        "\1\103",
        "\1\104",
        "\1\105",
        "\1\34\26\uffff\1\34",
        "\1\106",
        "\1\107",
        "\1\110",
        "\1\111\3\uffff\1\112",
        "\1\113",
        "\1\114\15\uffff\1\115",
        "\1\116",
        "\1\117",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "\42\61\1\62\31\61\1\63\uffc2\61",
        "",
        "",
        "\1\120",
        "\12\121\7\uffff\6\121",
        "\12\66\7\uffff\6\66",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "\52\123\1\122\21\123\1\124\uffc2\123",
        "",
        "",
        "",
        "",
        "",
        "\1\125",
        "\1\126",
        "\1\127",
        "\1\130",
        "\1\131",
        "\1\132",
        "",
        "\1\133",
        "\1\134",
        "\1\135",
        "\1\136",
        "\1\137",
        "\1\140",
        "\12\121\7\uffff\6\121",
        "\52\123\1\122\4\123\1\141\14\123\1\124\uffc2\123",
        "\52\123\1\122\21\123\1\124\uffc2\123",
        "",
        "\1\142",
        "\1\143",
        "\1\144",
        "\1\145",
        "",
        "\1\146",
        "\1\147",
        "\1\150",
        "\1\151",
        "\1\152",
        "\1\153",
        "\1\154",
        "\52\123\1\122\21\123\1\124\uffc2\123",
        "\1\155",
        "",
        "\1\156",
        "\1\157",
        "\1\160",
        "\1\161",
        "\1\162",
        "",
        "\1\163",
        "",
        "\1\164",
        "",
        "\1\165",
        "\1\166",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
    };

    class DFA12 extends DFA {
        public DFA12(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 12;
            this.eot = DFA.unpackEncodedString(DFA12_eotS);
            this.eof = DFA.unpackEncodedString(DFA12_eofS);
            this.min = DFA.unpackEncodedStringToUnsignedChars(DFA12_minS);
            this.max = DFA.unpackEncodedStringToUnsignedChars(DFA12_maxS);
            this.accept = DFA.unpackEncodedString(DFA12_acceptS);
            this.special = DFA.unpackEncodedString(DFA12_specialS);
            int numStates = DFA12_transition.length;
            this.transition = new short[numStates][];
            for (int i=0; i<numStates; i++) {
                transition[i] = DFA.unpackEncodedString(DFA12_transition[i]);
            }
        }
        public String getDescription() {
            return "1:1: Tokens : ( T41 | T42 | T43 | T44 | T45 | T46 | T47 | T48 | SEA | START_CODE | NEWLINE | STRING | LETTER | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | INCR | DECR | Define | Break | END_PHP | Quit | Length | Return | For | If | While | Sqrt | Scale | Ibase | Obase | Auto | ML_COMMENT | WS );";
        }
    }
 

}