// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-23 20:13:39

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int CODE_START=7;
    public static final int MINUS=14;
    public static final int NUMBER=13;
    public static final int WS=9;
    public static final int MUL_OP=16;
    public static final int SEA=6;
    public static final int T20=20;
    public static final int CODE_END=8;
    public static final int PROGRAM=4;
    public static final int INTEGER=12;
    public static final int DOUBLEQUOTE_STRING=10;
    public static final int ECHO=11;
    public static final int T18=18;
    public static final int EOF=-1;
    public static final int Tokens=21;
    public static final int REL_OP=17;
    public static final int PLUS=15;
    public static final int NOQUOTE_STRING=5;
    public static final int T19=19;

      public static boolean codeMode = false;

    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T18
    public void mT18() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T18;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:6:7: ( ';' )
            // src/antlr3/Plumhead.g:6:7: ';'
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
            // src/antlr3/Plumhead.g:7:7: ( '(' )
            // src/antlr3/Plumhead.g:7:7: '('
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
    // $ANTLR end T19

    // $ANTLR start T20
    public void mT20() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T20;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:8:7: ( ')' )
            // src/antlr3/Plumhead.g:8:7: ')'
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
    // $ANTLR end T20

    // $ANTLR start SEA
    public void mSEA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SEA;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:29:15: ({...}? => (~ '<' )+ )
            // src/antlr3/Plumhead.g:29:15: {...}? => (~ '<' )+
            {
            if ( !( !codeMode ) ) {
                throw new FailedPredicateException(input, "SEA", " !codeMode ");
            }
            // src/antlr3/Plumhead.g:29:32: (~ '<' )+
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
            	    // src/antlr3/Plumhead.g:29:33: ~ '<'
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

    // $ANTLR start CODE_START
    public void mCODE_START() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = CODE_START;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:30:15: ( '<?php' )
            // src/antlr3/Plumhead.g:30:15: '<?php'
            {
            match("<?php"); 

             codeMode = true; 

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
            // src/antlr3/Plumhead.g:31:15: ({...}? => '?>' ( '\\n' )? )
            // src/antlr3/Plumhead.g:31:15: {...}? => '?>' ( '\\n' )?
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "CODE_END", " codeMode ");
            }
            match("?>"); 

            // src/antlr3/Plumhead.g:31:36: ( '\\n' )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0=='\n') ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:31:36: '\\n'
                    {
                    match('\n'); 

                    }
                    break;

            }

             codeMode = false; 

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
            // src/antlr3/Plumhead.g:33:5: ({...}? => ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // src/antlr3/Plumhead.g:33:5: {...}? => ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "WS", " codeMode ");
            }
            // src/antlr3/Plumhead.g:34:5: ( (' '|'\\t'|'\\r'|'\\n'))+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>='\t' && LA3_0<='\n')||LA3_0=='\r'||LA3_0==' ') ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:34:7: (' '|'\\t'|'\\r'|'\\n')
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
            	    if ( cnt3 >= 1 ) break loop3;
                        EarlyExitException eee =
                            new EarlyExitException(3, input);
                        throw eee;
                }
                cnt3++;
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

    // $ANTLR start DOUBLEQUOTE_STRING
    public void mDOUBLEQUOTE_STRING() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = DOUBLEQUOTE_STRING;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:39:26: ({...}? => '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:39:26: {...}? => '\\\"' (~ '\\\"' )* '\\\"'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "DOUBLEQUOTE_STRING", " codeMode ");
            }
            match('\"'); 
            // src/antlr3/Plumhead.g:39:47: (~ '\\\"' )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='\u0000' && LA4_0<='!')||(LA4_0>='#' && LA4_0<='\uFFFE')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:39:49: ~ '\\\"'
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
    // $ANTLR end DOUBLEQUOTE_STRING

    // $ANTLR start ECHO
    public void mECHO() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = ECHO;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:40:14: ({...}? => 'echo' )
            // src/antlr3/Plumhead.g:40:14: {...}? => 'echo'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "ECHO", " codeMode ");
            }
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
            // src/antlr3/Plumhead.g:43:11: ({...}? => ( '0' .. '9' )+ )
            // src/antlr3/Plumhead.g:43:11: {...}? => ( '0' .. '9' )+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "INTEGER", " codeMode ");
            }
            // src/antlr3/Plumhead.g:43:27: ( '0' .. '9' )+
            int cnt5=0;
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>='0' && LA5_0<='9')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:43:28: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

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
            // src/antlr3/Plumhead.g:46:6: ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt7=2;
            int LA7_0 = input.LA(1);
            if ( ((LA7_0>='0' && LA7_0<='9')) && ( codeMode )) {
                alt7=1;
            }
            else if ( (LA7_0=='.') ) {
                alt7=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("45:1: NUMBER : ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER );", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:46:6: {...}? => INTEGER ( '.' INTEGER )?
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "NUMBER", " codeMode ");
                    }
                    mINTEGER(); 
                    // src/antlr3/Plumhead.g:46:31: ( '.' INTEGER )?
                    int alt6=2;
                    int LA6_0 = input.LA(1);
                    if ( (LA6_0=='.') ) {
                        alt6=1;
                    }
                    switch (alt6) {
                        case 1 :
                            // src/antlr3/Plumhead.g:46:32: '.' INTEGER
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
            // src/antlr3/Plumhead.g:50:13: ({...}? => '-' )
            // src/antlr3/Plumhead.g:50:13: {...}? => '-'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "MINUS", " codeMode ");
            }
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
            // src/antlr3/Plumhead.g:51:13: ({...}? => '+' )
            // src/antlr3/Plumhead.g:51:13: {...}? => '+'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "PLUS", " codeMode ");
            }
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
            // src/antlr3/Plumhead.g:52:13: ({...}? => '*' | '/' | '%' )
            int alt8=3;
            int LA8_0 = input.LA(1);
            if ( (LA8_0=='*') && ( codeMode )) {
                alt8=1;
            }
            else if ( (LA8_0=='/') ) {
                alt8=2;
            }
            else if ( (LA8_0=='%') ) {
                alt8=3;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("52:1: MUL_OP : ({...}? => '*' | '/' | '%' );", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:52:13: {...}? => '*'
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "MUL_OP", " codeMode ");
                    }
                    match('*'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:52:37: '/'
                    {
                    match('/'); 

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:52:44: '%'
                    {
                    match('%'); 

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
            // src/antlr3/Plumhead.g:53:13: ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' )
            int alt9=6;
            int LA9_0 = input.LA(1);
            if ( (LA9_0=='=') && ( codeMode )) {
                alt9=1;
            }
            else if ( (LA9_0=='<') ) {
                int LA9_2 = input.LA(2);
                if ( (LA9_2=='=') ) {
                    alt9=2;
                }
                else {
                    alt9=5;}
            }
            else if ( (LA9_0=='>') ) {
                int LA9_3 = input.LA(2);
                if ( (LA9_3=='=') ) {
                    alt9=3;
                }
                else {
                    alt9=6;}
            }
            else if ( (LA9_0=='!') ) {
                alt9=4;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("53:1: REL_OP : ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' );", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:53:13: {...}? => '=='
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "REL_OP", " codeMode ");
                    }
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:53:37: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:53:44: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:53:51: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:53:58: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:53:65: '>'
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
        // src/antlr3/Plumhead.g:1:10: ( T18 | T19 | T20 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP )
        int alt10=14;
        alt10 = dfa10.predict(input);
        switch (alt10) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T18
                {
                mT18(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T19
                {
                mT19(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T20
                {
                mT20(); 

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
                // src/antlr3/Plumhead.g:1:49: DOUBLEQUOTE_STRING
                {
                mDOUBLEQUOTE_STRING(); 

                }
                break;
            case 9 :
                // src/antlr3/Plumhead.g:1:68: ECHO
                {
                mECHO(); 

                }
                break;
            case 10 :
                // src/antlr3/Plumhead.g:1:73: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 11 :
                // src/antlr3/Plumhead.g:1:80: MINUS
                {
                mMINUS(); 

                }
                break;
            case 12 :
                // src/antlr3/Plumhead.g:1:86: PLUS
                {
                mPLUS(); 

                }
                break;
            case 13 :
                // src/antlr3/Plumhead.g:1:91: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:98: REL_OP
                {
                mREL_OP(); 

                }
                break;

        }

    }


    protected DFA10 dfa10 = new DFA10(this);
    public static final String DFA10_eotS =
        "\1\uffff\1\24\1\25\1\26\1\23\1\30\1\32\2\23\1\37\1\23\1\42\1\43"+
        "\1\44\2\45\1\23\1\50\1\23\4\uffff\1\55\3\uffff\1\23\1\60\1\uffff"+
        "\1\23\1\uffff\1\23\1\64\4\uffff\1\71\1\50\1\uffff\1\50\4\uffff\1"+
        "\55\2\uffff\1\23\1\uffff\1\37\7\uffff\1\75\3\uffff";
    public static final String DFA10_eofS =
        "\77\uffff";
    public static final String DFA10_minS =
        "\4\0\1\76\1\77\2\0\1\143\1\0\1\60\5\0\1\75\1\0\1\75\1\uffff\4\0"+
        "\2\uffff\3\0\1\uffff\1\150\1\0\1\60\11\0\3\uffff\2\0\1\uffff\1\0"+
        "\1\157\1\uffff\2\0\4\uffff\1\0\1\uffff\1\0\1\uffff\1\0\1\uffff";
    public static final String DFA10_maxS =
        "\4\ufffe\1\76\1\77\2\ufffe\1\143\1\ufffe\1\71\5\ufffe\1\75\1\ufffe"+
        "\1\75\1\uffff\3\0\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff\1\150\1\0"+
        "\1\71\1\ufffe\4\0\2\ufffe\1\0\1\ufffe\3\uffff\1\0\1\ufffe\1\uffff"+
        "\1\0\1\157\1\uffff\1\ufffe\1\0\4\uffff\1\0\1\uffff\1\ufffe\1\uffff"+
        "\1\0\1\uffff";
    public static final String DFA10_acceptS =
        "\23\uffff\1\4\4\uffff\1\16\1\5\3\uffff\1\10\14\uffff\1\1\1\2\1\3"+
        "\2\uffff\1\7\2\uffff\1\12\2\uffff\1\13\1\14\2\15\1\uffff\1\6\1\uffff"+
        "\1\12\1\uffff\1\11";
    public static final String DFA10_specialS =
        "\1\14\1\36\1\51\1\25\1\23\1\uffff\1\30\1\45\1\15\1\21\1\27\1\55"+
        "\1\46\1\32\1\41\1\50\1\54\1\11\1\17\1\uffff\1\10\1\5\1\22\1\3\2"+
        "\uffff\1\12\1\13\1\4\1\uffff\1\44\1\26\1\6\1\34\1\0\1\2\1\52\1\53"+
        "\1\7\1\37\1\42\1\31\3\uffff\1\1\1\43\1\uffff\1\16\1\35\1\uffff\1"+
        "\47\1\24\4\uffff\1\40\1\uffff\1\20\1\uffff\1\33\1\uffff}>";
    public static final String[] DFA10_transition = {
        "\11\23\2\6\2\23\1\6\22\23\1\6\1\22\1\7\2\23\1\17\2\23\1\2\1\3\1"+
        "\15\1\14\1\23\1\13\1\12\1\16\12\11\1\23\1\1\1\5\1\20\1\21\1\4\45"+
        "\23\1\10\uff99\23",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\1\27",
        "\1\31",
        "\11\23\2\6\2\23\1\6\22\23\1\6\33\23\1\uffff\uffc2\23",
        "\42\33\1\34\31\33\1\35\uffc2\33",
        "\1\36",
        "\56\23\1\40\1\23\12\11\2\23\1\uffff\uffc2\23",
        "\12\41",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\1\46",
        "\74\23\1\uffff\1\47\uffc1\23",
        "\1\51",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\12\23\1\56\61\23\1\uffff\uffc2\23",
        "",
        "",
        "\1\uffff",
        "\42\33\1\34\31\33\1\35\uffc2\33",
        "\74\23\1\uffff\uffc2\23",
        "",
        "\1\61",
        "\1\uffff",
        "\12\63",
        "\60\23\12\41\2\23\1\uffff\uffc2\23",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\1\uffff",
        "\74\23\1\uffff\uffc2\23",
        "",
        "",
        "",
        "\1\uffff",
        "\74\23\1\uffff\uffc2\23",
        "",
        "\1\uffff",
        "\1\73",
        "",
        "\60\23\12\63\2\23\1\uffff\uffc2\23",
        "\1\uffff",
        "",
        "",
        "",
        "",
        "\1\uffff",
        "",
        "\74\23\1\uffff\uffc2\23",
        "",
        "\1\uffff",
        ""
    };

    class DFA10 extends DFA {
        public DFA10(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 10;
            this.eot = DFA.unpackEncodedString(DFA10_eotS);
            this.eof = DFA.unpackEncodedString(DFA10_eofS);
            this.min = DFA.unpackEncodedStringToUnsignedChars(DFA10_minS);
            this.max = DFA.unpackEncodedStringToUnsignedChars(DFA10_maxS);
            this.accept = DFA.unpackEncodedString(DFA10_acceptS);
            this.special = DFA.unpackEncodedString(DFA10_specialS);
            int numStates = DFA10_transition.length;
            this.transition = new short[numStates][];
            for (int i=0; i<numStates; i++) {
                transition[i] = DFA.unpackEncodedString(DFA10_transition[i]);
            }
        }
        public String getDescription() {
            return "1:1: Tokens : ( T18 | T19 | T20 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 53;}

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 58;}

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 54;}

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        int LA10_23 = input.LA(1);
                        s = -1;
                        if ( (LA10_23=='\n') && (( codeMode || !codeMode ))) {s = 46;}

                        else if ( ((LA10_23>='\u0000' && LA10_23<='\t')||(LA10_23>='\u000B' && LA10_23<=';')||(LA10_23>='=' && LA10_23<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 45;

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        int LA10_28 = input.LA(1);
                        s = -1;
                        if ( ((LA10_28>='\u0000' && LA10_28<=';')||(LA10_28>='=' && LA10_28<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 48;

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 43;}

                        else if ( ( !codeMode ) ) {s = 19;}

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        int LA10_32 = input.LA(1);
                        s = -1;
                        if ( ((LA10_32>='0' && LA10_32<='9')) && (( codeMode || !codeMode ))) {s = 51;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        int LA10_38 = input.LA(1);
                        s = -1;
                        if ( ((LA10_38>='\u0000' && LA10_38<=';')||(LA10_38>='=' && LA10_38<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 57;

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 42;}

                        else if ( ( !codeMode ) ) {s = 19;}

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        int LA10_17 = input.LA(1);
                        s = -1;
                        if ( (LA10_17=='=') ) {s = 39;}

                        else if ( ((LA10_17>='\u0000' && LA10_17<=';')||(LA10_17>='>' && LA10_17<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 40;

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 47;}

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA10_27 = input.LA(1);
                        s = -1;
                        if ( (LA10_27=='\"') && (( codeMode || !codeMode ))) {s = 28;}

                        else if ( ((LA10_27>='\u0000' && LA10_27<='!')||(LA10_27>='#' && LA10_27<=';')||(LA10_27>='=' && LA10_27<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 27;}

                        else if ( (LA10_27=='<') && ( codeMode )) {s = 29;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        int LA10_0 = input.LA(1);
                        s = -1;
                        if ( (LA10_0==';') ) {s = 1;}

                        else if ( (LA10_0=='(') ) {s = 2;}

                        else if ( (LA10_0==')') ) {s = 3;}

                        else if ( (LA10_0=='?') && (( codeMode || !codeMode ))) {s = 4;}

                        else if ( (LA10_0=='<') ) {s = 5;}

                        else if ( ((LA10_0>='\t' && LA10_0<='\n')||LA10_0=='\r'||LA10_0==' ') && (( codeMode || !codeMode ))) {s = 6;}

                        else if ( (LA10_0=='\"') && (( codeMode || !codeMode ))) {s = 7;}

                        else if ( (LA10_0=='e') && (( codeMode || !codeMode ))) {s = 8;}

                        else if ( ((LA10_0>='0' && LA10_0<='9')) && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( (LA10_0=='.') ) {s = 10;}

                        else if ( (LA10_0=='-') && (( codeMode || !codeMode ))) {s = 11;}

                        else if ( (LA10_0=='+') && (( codeMode || !codeMode ))) {s = 12;}

                        else if ( (LA10_0=='*') && (( codeMode || !codeMode ))) {s = 13;}

                        else if ( (LA10_0=='/') ) {s = 14;}

                        else if ( (LA10_0=='%') ) {s = 15;}

                        else if ( (LA10_0=='=') && (( codeMode || !codeMode ))) {s = 16;}

                        else if ( (LA10_0=='>') ) {s = 17;}

                        else if ( (LA10_0=='!') ) {s = 18;}

                        else if ( ((LA10_0>='\u0000' && LA10_0<='\b')||(LA10_0>='\u000B' && LA10_0<='\f')||(LA10_0>='\u000E' && LA10_0<='\u001F')||(LA10_0>='#' && LA10_0<='$')||(LA10_0>='&' && LA10_0<='\'')||LA10_0==','||LA10_0==':'||(LA10_0>='@' && LA10_0<='d')||(LA10_0>='f' && LA10_0<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        int LA10_8 = input.LA(1);
                        s = -1;
                        if ( (LA10_8=='c') && (( codeMode || !codeMode ))) {s = 30;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 29;}

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        int LA10_18 = input.LA(1);
                        s = -1;
                        if ( (LA10_18=='=') ) {s = 41;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        int LA10_59 = input.LA(1);
                        s = -1;
                        if ( ((LA10_59>='\u0000' && LA10_59<=';')||(LA10_59>='=' && LA10_59<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 61;

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        int LA10_9 = input.LA(1);
                        s = -1;
                        if ( (LA10_9=='.') && (( codeMode || !codeMode ))) {s = 32;}

                        else if ( ((LA10_9>='0' && LA10_9<='9')) && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( ((LA10_9>='\u0000' && LA10_9<='-')||LA10_9=='/'||(LA10_9>=':' && LA10_9<=';')||(LA10_9>='=' && LA10_9<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 31;

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 44;}

                        else if ( ( !codeMode ) ) {s = 19;}

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        int LA10_4 = input.LA(1);
                        s = -1;
                        if ( (LA10_4=='>') && (( codeMode || !codeMode ))) {s = 23;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( (true) ) {s = 60;}

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        int LA10_3 = input.LA(1);
                        s = -1;
                        if ( ((LA10_3>='\u0000' && LA10_3<=';')||(LA10_3>='=' && LA10_3<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 50;}

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        int LA10_10 = input.LA(1);
                        s = -1;
                        if ( ((LA10_10>='0' && LA10_10<='9')) ) {s = 33;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        int LA10_6 = input.LA(1);
                        s = -1;
                        if ( ((LA10_6>='\t' && LA10_6<='\n')||LA10_6=='\r'||LA10_6==' ') && (( codeMode || !codeMode ))) {s = 6;}

                        else if ( ((LA10_6>='\u0000' && LA10_6<='\b')||(LA10_6>='\u000B' && LA10_6<='\f')||(LA10_6>='\u000E' && LA10_6<='\u001F')||(LA10_6>='!' && LA10_6<=';')||(LA10_6>='=' && LA10_6<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        int LA10_41 = input.LA(1);
                        s = -1;
                        if ( ((LA10_41>='\u0000' && LA10_41<=';')||(LA10_41>='=' && LA10_41<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 40;

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        int LA10_13 = input.LA(1);
                        s = -1;
                        if ( ((LA10_13>='\u0000' && LA10_13<=';')||(LA10_13>='=' && LA10_13<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 36;

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 62;}

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        int LA10_33 = input.LA(1);
                        s = -1;
                        if ( ((LA10_33>='0' && LA10_33<='9')) ) {s = 33;}

                        else if ( ((LA10_33>='\u0000' && LA10_33<='/')||(LA10_33>=':' && LA10_33<=';')||(LA10_33>='=' && LA10_33<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 52;

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        int LA10_49 = input.LA(1);
                        s = -1;
                        if ( (LA10_49=='o') && (( codeMode || !codeMode ))) {s = 59;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        int LA10_1 = input.LA(1);
                        s = -1;
                        if ( ((LA10_1>='\u0000' && LA10_1<=';')||(LA10_1>='=' && LA10_1<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 20;

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        int LA10_39 = input.LA(1);
                        s = -1;
                        if ( ((LA10_39>='\u0000' && LA10_39<=';')||(LA10_39>='=' && LA10_39<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 40;

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 24;}

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
                        int LA10_14 = input.LA(1);
                        s = -1;
                        if ( ((LA10_14>='\u0000' && LA10_14<=';')||(LA10_14>='=' && LA10_14<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 37;

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( (true) ) {s = 24;}

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        int LA10_46 = input.LA(1);
                        s = -1;
                        if ( ((LA10_46>='\u0000' && LA10_46<=';')||(LA10_46>='=' && LA10_46<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 45;

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        int LA10_30 = input.LA(1);
                        s = -1;
                        if ( (LA10_30=='h') && (( codeMode || !codeMode ))) {s = 49;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        int LA10_7 = input.LA(1);
                        s = -1;
                        if ( ((LA10_7>='\u0000' && LA10_7<='!')||(LA10_7>='#' && LA10_7<=';')||(LA10_7>='=' && LA10_7<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 27;}

                        else if ( (LA10_7=='\"') && (( codeMode || !codeMode ))) {s = 28;}

                        else if ( (LA10_7=='<') && ( codeMode )) {s = 29;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        int LA10_12 = input.LA(1);
                        s = -1;
                        if ( ((LA10_12>='\u0000' && LA10_12<=';')||(LA10_12>='=' && LA10_12<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 35;

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        int LA10_51 = input.LA(1);
                        s = -1;
                        if ( ((LA10_51>='0' && LA10_51<='9')) && (( codeMode || !codeMode ))) {s = 51;}

                        else if ( ((LA10_51>='\u0000' && LA10_51<='/')||(LA10_51>=':' && LA10_51<=';')||(LA10_51>='=' && LA10_51<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 31;

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        int LA10_15 = input.LA(1);
                        s = -1;
                        if ( ((LA10_15>='\u0000' && LA10_15<=';')||(LA10_15>='=' && LA10_15<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 37;

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        int LA10_2 = input.LA(1);
                        s = -1;
                        if ( ((LA10_2>='\u0000' && LA10_2<=';')||(LA10_2>='=' && LA10_2<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 21;

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 55;}

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( (true) ) {s = 56;}

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        int LA10_16 = input.LA(1);
                        s = -1;
                        if ( (LA10_16=='=') && (( codeMode || !codeMode ))) {s = 38;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 45 : 
                        int LA10_11 = input.LA(1);
                        s = -1;
                        if ( ((LA10_11>='\u0000' && LA10_11<=';')||(LA10_11>='=' && LA10_11<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 34;

                        if ( s>=0 ) return s;
                        break;
            }
            NoViableAltException nvae =
                new NoViableAltException(getDescription(), 10, _s, input);
            error(nvae);
            throw nvae;
        }
    }
 

}