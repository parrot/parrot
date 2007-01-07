// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-07 18:06:36

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int CODE_START=6;
    public static final int MINUS=13;
    public static final int NUMBER=12;
    public static final int WS=8;
    public static final int STRING=9;
    public static final int MUL_OP=15;
    public static final int SEA=5;
    public static final int CODE_END=7;
    public static final int PROGRAM=4;
    public static final int INTEGER=11;
    public static final int ECHO=10;
    public static final int T18=18;
    public static final int EOF=-1;
    public static final int T17=17;
    public static final int Tokens=20;
    public static final int REL_OP=16;
    public static final int PLUS=14;
    public static final int T19=19;
    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T17
    public void mT17() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T17;
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
    // $ANTLR end T17

    // $ANTLR start T18
    public void mT18() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T18;
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
    // $ANTLR end T18

    // $ANTLR start T19
    public void mT19() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T19;
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
    // $ANTLR end T19

    // $ANTLR start SEA
    public void mSEA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SEA;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:23:14: ( 'start_sea' ( options {greedy=false; } : . )* 'end_sea' )
            // src/antlr3/Plumhead.g:23:14: 'start_sea' ( options {greedy=false; } : . )* 'end_sea'
            {
            match("start_sea"); 

            // src/antlr3/Plumhead.g:23:26: ( options {greedy=false; } : . )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( (LA1_0=='e') ) {
                    int LA1_1 = input.LA(2);
                    if ( (LA1_1=='n') ) {
                        int LA1_3 = input.LA(3);
                        if ( (LA1_3=='d') ) {
                            int LA1_4 = input.LA(4);
                            if ( (LA1_4=='_') ) {
                                int LA1_5 = input.LA(5);
                                if ( (LA1_5=='s') ) {
                                    int LA1_6 = input.LA(6);
                                    if ( (LA1_6=='e') ) {
                                        int LA1_7 = input.LA(7);
                                        if ( (LA1_7=='a') ) {
                                            alt1=2;
                                        }
                                        else if ( ((LA1_7>='\u0000' && LA1_7<='`')||(LA1_7>='b' && LA1_7<='\uFFFE')) ) {
                                            alt1=1;
                                        }


                                    }
                                    else if ( ((LA1_6>='\u0000' && LA1_6<='d')||(LA1_6>='f' && LA1_6<='\uFFFE')) ) {
                                        alt1=1;
                                    }


                                }
                                else if ( ((LA1_5>='\u0000' && LA1_5<='r')||(LA1_5>='t' && LA1_5<='\uFFFE')) ) {
                                    alt1=1;
                                }


                            }
                            else if ( ((LA1_4>='\u0000' && LA1_4<='^')||(LA1_4>='`' && LA1_4<='\uFFFE')) ) {
                                alt1=1;
                            }


                        }
                        else if ( ((LA1_3>='\u0000' && LA1_3<='c')||(LA1_3>='e' && LA1_3<='\uFFFE')) ) {
                            alt1=1;
                        }


                    }
                    else if ( ((LA1_1>='\u0000' && LA1_1<='m')||(LA1_1>='o' && LA1_1<='\uFFFE')) ) {
                        alt1=1;
                    }


                }
                else if ( ((LA1_0>='\u0000' && LA1_0<='d')||(LA1_0>='f' && LA1_0<='\uFFFE')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:23:54: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);

            match("end_sea"); 


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

    // $ANTLR start CODE_START
    public void mCODE_START() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = CODE_START;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:24:14: ( '<?php' )
            // src/antlr3/Plumhead.g:24:14: '<?php'
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
    // $ANTLR end CODE_START

    // $ANTLR start CODE_END
    public void mCODE_END() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = CODE_END;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:25:14: ( '?>' )
            // src/antlr3/Plumhead.g:25:14: '?>'
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
    // $ANTLR end CODE_END

    // $ANTLR start WS
    public void mWS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = WS;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:27:5: ( ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // src/antlr3/Plumhead.g:27:5: ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            // src/antlr3/Plumhead.g:27:5: ( (' '|'\\t'|'\\r'|'\\n'))+
            int cnt2=0;
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);
                if ( ((LA2_0>='\t' && LA2_0<='\n')||LA2_0=='\r'||LA2_0==' ') ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:27:7: (' '|'\\t'|'\\r'|'\\n')
            	    {
            	    if ( (input.LA(1)>='\t' && input.LA(1)<='\n')||input.LA(1)=='\r'||input.LA(1)==' ' ) {
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
            	    if ( cnt2 >= 1 ) break loop2;
                        EarlyExitException eee =
                            new EarlyExitException(2, input);
                        throw eee;
                }
                cnt2++;
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

    // $ANTLR start STRING
    public void mSTRING() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = STRING;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:32:14: ( '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:32:14: '\\\"' (~ '\\\"' )* '\\\"'
            {
            match('\"'); 
            // src/antlr3/Plumhead.g:32:19: (~ '\\\"' )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>='\u0000' && LA3_0<='!')||(LA3_0>='#' && LA3_0<='\uFFFE')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:32:21: ~ '\\\"'
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

    // $ANTLR start ECHO
    public void mECHO() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = ECHO;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:33:14: ( 'echo' )
            // src/antlr3/Plumhead.g:33:14: 'echo'
            {
            match("echo"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end ECHO

    // $ANTLR start INTEGER
    public void mINTEGER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // src/antlr3/Plumhead.g:36:11: ( ( '0' .. '9' )+ )
            // src/antlr3/Plumhead.g:36:11: ( '0' .. '9' )+
            {
            // src/antlr3/Plumhead.g:36:11: ( '0' .. '9' )+
            int cnt4=0;
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='0' && LA4_0<='9')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:36:12: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

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
            // src/antlr3/Plumhead.g:39:7: ( INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt6=2;
            int LA6_0 = input.LA(1);
            if ( ((LA6_0>='0' && LA6_0<='9')) ) {
                alt6=1;
            }
            else if ( (LA6_0=='.') ) {
                alt6=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("38:1: NUMBER : ( INTEGER ( '.' INTEGER )? | '.' INTEGER );", 6, 0, input);

                throw nvae;
            }
            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:39:7: INTEGER ( '.' INTEGER )?
                    {
                    mINTEGER(); 
                    // src/antlr3/Plumhead.g:39:15: ( '.' INTEGER )?
                    int alt5=2;
                    int LA5_0 = input.LA(1);
                    if ( (LA5_0=='.') ) {
                        alt5=1;
                    }
                    switch (alt5) {
                        case 1 :
                            // src/antlr3/Plumhead.g:39:16: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:40:7: '.' INTEGER
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
            // src/antlr3/Plumhead.g:43:14: ( '-' )
            // src/antlr3/Plumhead.g:43:14: '-'
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
            // src/antlr3/Plumhead.g:44:14: ( '+' )
            // src/antlr3/Plumhead.g:44:14: '+'
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
            // src/antlr3/Plumhead.g:45:12: ( ('*'|'/'|'%'))
            // src/antlr3/Plumhead.g:45:14: ('*'|'/'|'%')
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

    // $ANTLR start REL_OP
    public void mREL_OP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = REL_OP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:46:14: ( '==' | '<=' | '>=' | '!=' | '<' | '>' )
            int alt7=6;
            switch ( input.LA(1) ) {
            case '=':
                alt7=1;
                break;
            case '<':
                int LA7_2 = input.LA(2);
                if ( (LA7_2=='=') ) {
                    alt7=2;
                }
                else {
                    alt7=5;}
                break;
            case '>':
                int LA7_3 = input.LA(2);
                if ( (LA7_3=='=') ) {
                    alt7=3;
                }
                else {
                    alt7=6;}
                break;
            case '!':
                alt7=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("46:1: REL_OP : ( '==' | '<=' | '>=' | '!=' | '<' | '>' );", 7, 0, input);

                throw nvae;
            }

            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:46:14: '=='
                    {
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:46:21: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:46:28: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:46:35: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:46:42: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:46:49: '>'
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

    public void mTokens() throws RecognitionException {
        // src/antlr3/Plumhead.g:1:10: ( T17 | T18 | T19 | SEA | CODE_START | CODE_END | WS | STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP )
        int alt8=14;
        switch ( input.LA(1) ) {
        case ';':
            alt8=1;
            break;
        case '(':
            alt8=2;
            break;
        case ')':
            alt8=3;
            break;
        case 's':
            alt8=4;
            break;
        case '<':
            int LA8_5 = input.LA(2);
            if ( (LA8_5=='?') ) {
                alt8=5;
            }
            else {
                alt8=14;}
            break;
        case '?':
            alt8=6;
            break;
        case '\t':
        case '\n':
        case '\r':
        case ' ':
            alt8=7;
            break;
        case '\"':
            alt8=8;
            break;
        case 'e':
            alt8=9;
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
            alt8=10;
            break;
        case '-':
            alt8=11;
            break;
        case '+':
            alt8=12;
            break;
        case '%':
        case '*':
        case '/':
            alt8=13;
            break;
        case '!':
        case '=':
        case '>':
            alt8=14;
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T17 | T18 | T19 | SEA | CODE_START | CODE_END | WS | STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP );", 8, 0, input);

            throw nvae;
        }

        switch (alt8) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T17
                {
                mT17(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T18
                {
                mT18(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T19
                {
                mT19(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: SEA
                {
                mSEA(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: CODE_START
                {
                mCODE_START(); 

                }
                break;
            case 6 :
                // src/antlr3/Plumhead.g:1:37: CODE_END
                {
                mCODE_END(); 

                }
                break;
            case 7 :
                // src/antlr3/Plumhead.g:1:46: WS
                {
                mWS(); 

                }
                break;
            case 8 :
                // src/antlr3/Plumhead.g:1:49: STRING
                {
                mSTRING(); 

                }
                break;
            case 9 :
                // src/antlr3/Plumhead.g:1:56: ECHO
                {
                mECHO(); 

                }
                break;
            case 10 :
                // src/antlr3/Plumhead.g:1:61: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 11 :
                // src/antlr3/Plumhead.g:1:68: MINUS
                {
                mMINUS(); 

                }
                break;
            case 12 :
                // src/antlr3/Plumhead.g:1:74: PLUS
                {
                mPLUS(); 

                }
                break;
            case 13 :
                // src/antlr3/Plumhead.g:1:79: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:86: REL_OP
                {
                mREL_OP(); 

                }
                break;

        }

    }


 

}