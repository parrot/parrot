// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-24 21:38:14

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int T21=21;
    public static final int CODE_START=8;
    public static final int MINUS=15;
    public static final int T22=22;
    public static final int NUMBER=14;
    public static final int WS=10;
    public static final int T23=23;
    public static final int MUL_OP=17;
    public static final int SEA=7;
    public static final int T20=20;
    public static final int CODE_END=9;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int T25=25;
    public static final int INTEGER=13;
    public static final int DOUBLEQUOTE_STRING=11;
    public static final int ECHO=12;
    public static final int IF=19;
    public static final int EOF=-1;
    public static final int Tokens=26;
    public static final int REL_OP=18;
    public static final int PLUS=16;
    public static final int NOQUOTE_STRING=5;
    public static final int T24=24;

      public static boolean codeMode = false;

    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T20
    public void mT20() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T20;
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
    // $ANTLR end T20

    // $ANTLR start T21
    public void mT21() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T21;
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
    // $ANTLR end T21

    // $ANTLR start T22
    public void mT22() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T22;
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
    // $ANTLR end T22

    // $ANTLR start T23
    public void mT23() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T23;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:9:7: ( '{' )
            // src/antlr3/Plumhead.g:9:7: '{'
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
    // $ANTLR end T23

    // $ANTLR start T24
    public void mT24() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T24;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:10:7: ( '}' )
            // src/antlr3/Plumhead.g:10:7: '}'
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
    // $ANTLR end T24

    // $ANTLR start T25
    public void mT25() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T25;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:11:7: ( 'else' )
            // src/antlr3/Plumhead.g:11:7: 'else'
            {
            match("else"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T25

    // $ANTLR start SEA
    public void mSEA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SEA;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:30:15: ({...}? => (~ '<' )+ )
            // src/antlr3/Plumhead.g:30:15: {...}? => (~ '<' )+
            {
            if ( !( !codeMode ) ) {
                throw new FailedPredicateException(input, "SEA", " !codeMode ");
            }
            // src/antlr3/Plumhead.g:30:32: (~ '<' )+
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
            	    // src/antlr3/Plumhead.g:30:33: ~ '<'
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
            // src/antlr3/Plumhead.g:31:15: ( '<?php' )
            // src/antlr3/Plumhead.g:31:15: '<?php'
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
            // src/antlr3/Plumhead.g:32:15: ({...}? => '?>' ( '\\n' )? )
            // src/antlr3/Plumhead.g:32:15: {...}? => '?>' ( '\\n' )?
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "CODE_END", " codeMode ");
            }
            match("?>"); 

            // src/antlr3/Plumhead.g:32:36: ( '\\n' )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0=='\n') ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:32:36: '\\n'
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
            // src/antlr3/Plumhead.g:34:5: ({...}? => ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // src/antlr3/Plumhead.g:34:5: {...}? => ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "WS", " codeMode ");
            }
            // src/antlr3/Plumhead.g:35:5: ( (' '|'\\t'|'\\r'|'\\n'))+
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
            	    // src/antlr3/Plumhead.g:35:7: (' '|'\\t'|'\\r'|'\\n')
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
            // src/antlr3/Plumhead.g:40:26: ({...}? => '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:40:26: {...}? => '\\\"' (~ '\\\"' )* '\\\"'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "DOUBLEQUOTE_STRING", " codeMode ");
            }
            match('\"'); 
            // src/antlr3/Plumhead.g:40:47: (~ '\\\"' )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='\u0000' && LA4_0<='!')||(LA4_0>='#' && LA4_0<='\uFFFE')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:40:49: ~ '\\\"'
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
            // src/antlr3/Plumhead.g:41:14: ({...}? => 'echo' )
            // src/antlr3/Plumhead.g:41:14: {...}? => 'echo'
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
            // src/antlr3/Plumhead.g:44:11: ({...}? => ( '0' .. '9' )+ )
            // src/antlr3/Plumhead.g:44:11: {...}? => ( '0' .. '9' )+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "INTEGER", " codeMode ");
            }
            // src/antlr3/Plumhead.g:44:27: ( '0' .. '9' )+
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
            	    // src/antlr3/Plumhead.g:44:28: '0' .. '9'
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
            // src/antlr3/Plumhead.g:47:6: ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER )
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
                    new NoViableAltException("46:1: NUMBER : ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER );", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:47:6: {...}? => INTEGER ( '.' INTEGER )?
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "NUMBER", " codeMode ");
                    }
                    mINTEGER(); 
                    // src/antlr3/Plumhead.g:47:31: ( '.' INTEGER )?
                    int alt6=2;
                    int LA6_0 = input.LA(1);
                    if ( (LA6_0=='.') ) {
                        alt6=1;
                    }
                    switch (alt6) {
                        case 1 :
                            // src/antlr3/Plumhead.g:47:32: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:48:7: '.' INTEGER
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
            // src/antlr3/Plumhead.g:51:13: ({...}? => '-' )
            // src/antlr3/Plumhead.g:51:13: {...}? => '-'
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
            // src/antlr3/Plumhead.g:52:13: ({...}? => '+' )
            // src/antlr3/Plumhead.g:52:13: {...}? => '+'
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
            // src/antlr3/Plumhead.g:53:13: ({...}? => '*' | '/' | '%' )
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
                    new NoViableAltException("53:1: MUL_OP : ({...}? => '*' | '/' | '%' );", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:53:13: {...}? => '*'
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "MUL_OP", " codeMode ");
                    }
                    match('*'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:53:37: '/'
                    {
                    match('/'); 

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:53:44: '%'
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
            // src/antlr3/Plumhead.g:54:13: ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' )
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
                    new NoViableAltException("54:1: REL_OP : ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' );", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:54:13: {...}? => '=='
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "REL_OP", " codeMode ");
                    }
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:54:37: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:54:44: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:54:51: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:54:58: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:54:65: '>'
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

    // $ANTLR start IF
    public void mIF() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = IF;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:56:13: ({...}? => 'if' )
            // src/antlr3/Plumhead.g:56:13: {...}? => 'if'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "IF", " codeMode ");
            }
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
    // $ANTLR end IF

    public void mTokens() throws RecognitionException {
        // src/antlr3/Plumhead.g:1:10: ( T20 | T21 | T22 | T23 | T24 | T25 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP | IF )
        int alt10=18;
        alt10 = dfa10.predict(input);
        switch (alt10) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T20
                {
                mT20(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T21
                {
                mT21(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T22
                {
                mT22(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: T23
                {
                mT23(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: T24
                {
                mT24(); 

                }
                break;
            case 6 :
                // src/antlr3/Plumhead.g:1:30: T25
                {
                mT25(); 

                }
                break;
            case 7 :
                // src/antlr3/Plumhead.g:1:34: SEA
                {
                mSEA(); 

                }
                break;
            case 8 :
                // src/antlr3/Plumhead.g:1:38: CODE_START
                {
                mCODE_START(); 

                }
                break;
            case 9 :
                // src/antlr3/Plumhead.g:1:49: CODE_END
                {
                mCODE_END(); 

                }
                break;
            case 10 :
                // src/antlr3/Plumhead.g:1:58: WS
                {
                mWS(); 

                }
                break;
            case 11 :
                // src/antlr3/Plumhead.g:1:61: DOUBLEQUOTE_STRING
                {
                mDOUBLEQUOTE_STRING(); 

                }
                break;
            case 12 :
                // src/antlr3/Plumhead.g:1:80: ECHO
                {
                mECHO(); 

                }
                break;
            case 13 :
                // src/antlr3/Plumhead.g:1:85: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:92: MINUS
                {
                mMINUS(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:98: PLUS
                {
                mPLUS(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:103: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:110: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:117: IF
                {
                mIF(); 

                }
                break;

        }

    }


    protected DFA10 dfa10 = new DFA10(this);
    public static final String DFA10_eotS =
        "\1\uffff\1\27\1\30\1\31\1\32\1\33\2\26\1\40\1\41\1\26\1\45\1\26"+
        "\1\50\1\51\1\52\2\53\1\26\1\56\2\26\6\uffff\2\26\1\71\3\uffff\1"+
        "\26\1\73\2\uffff\1\26\1\76\4\uffff\1\103\1\56\1\uffff\1\56\1\104"+
        "\5\uffff\2\26\1\71\4\uffff\1\45\7\uffff\1\112\1\113\7\uffff";
    public static final String DFA10_eofS =
        "\116\uffff";
    public static final String DFA10_minS =
        "\6\0\1\143\1\76\1\77\3\0\1\60\5\0\1\75\1\0\1\75\1\146\1\uffff\5"+
        "\0\1\150\1\163\1\0\2\uffff\3\0\1\uffff\1\0\1\60\12\0\5\uffff\1\157"+
        "\1\145\2\0\1\uffff\1\0\1\uffff\2\0\4\uffff\4\0\3\uffff\2\0\2\uffff";
    public static final String DFA10_maxS =
        "\6\ufffe\1\154\1\76\1\77\3\ufffe\1\71\5\ufffe\1\75\1\ufffe\1\75"+
        "\1\146\1\uffff\5\0\1\150\1\163\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff"+
        "\1\0\1\71\1\ufffe\4\0\2\ufffe\1\0\2\ufffe\5\uffff\1\157\1\145\1"+
        "\ufffe\1\0\1\uffff\1\0\1\uffff\1\ufffe\1\0\4\uffff\2\0\2\ufffe\3"+
        "\uffff\2\0\2\uffff";
    public static final String DFA10_acceptS =
        "\26\uffff\1\7\10\uffff\1\10\1\21\3\uffff\1\13\14\uffff\1\1\1\2\1"+
        "\3\1\4\1\5\4\uffff\1\12\1\uffff\1\15\2\uffff\1\16\1\17\2\20\4\uffff"+
        "\1\11\1\15\1\22\2\uffff\1\14\1\6";
    public static final String DFA10_specialS =
        "\1\57\1\32\1\36\1\12\1\13\1\0\1\4\1\66\1\uffff\1\7\1\67\1\2\1\50"+
        "\1\6\1\61\1\34\1\22\1\52\1\42\1\53\1\1\1\44\1\uffff\1\47\1\43\1"+
        "\40\1\21\1\35\1\51\1\30\1\26\2\uffff\1\16\1\70\1\60\1\uffff\1\63"+
        "\1\11\1\55\1\33\1\17\1\45\1\46\1\27\1\5\1\24\1\15\1\37\5\uffff\1"+
        "\54\1\31\1\14\1\10\1\uffff\1\3\1\uffff\1\25\1\62\4\uffff\1\23\1"+
        "\41\1\20\1\64\3\uffff\1\56\1\65\2\uffff}>";
    public static final String[] DFA10_transition = {
        "\11\26\2\11\2\26\1\11\22\26\1\11\1\24\1\12\2\26\1\21\2\26\1\2\1"+
        "\3\1\17\1\16\1\26\1\15\1\14\1\20\12\13\1\26\1\1\1\10\1\22\1\23\1"+
        "\7\45\26\1\6\3\26\1\25\21\26\1\4\1\26\1\5\uff81\26",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\1\34\10\uffff\1\35",
        "\1\36",
        "\1\37",
        "\11\26\2\11\2\26\1\11\22\26\1\11\33\26\1\uffff\uffc2\26",
        "\42\42\1\43\31\42\1\44\uffc2\42",
        "\56\26\1\46\1\26\12\13\2\26\1\uffff\uffc2\26",
        "\12\47",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\1\54",
        "\74\26\1\uffff\1\55\uffc1\26",
        "\1\57",
        "\1\60",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\66",
        "\1\67",
        "\12\26\1\70\61\26\1\uffff\uffc2\26",
        "",
        "",
        "\1\uffff",
        "\42\42\1\43\31\42\1\44\uffc2\42",
        "\74\26\1\uffff\uffc2\26",
        "",
        "\1\uffff",
        "\12\75",
        "\60\26\12\47\2\26\1\uffff\uffc2\26",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "\1\uffff",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "",
        "",
        "",
        "",
        "",
        "\1\105",
        "\1\106",
        "\74\26\1\uffff\uffc2\26",
        "\1\uffff",
        "",
        "\1\uffff",
        "",
        "\60\26\12\75\2\26\1\uffff\uffc2\26",
        "\1\uffff",
        "",
        "",
        "",
        "",
        "\1\uffff",
        "\1\uffff",
        "\74\26\1\uffff\uffc2\26",
        "\74\26\1\uffff\uffc2\26",
        "",
        "",
        "",
        "\1\uffff",
        "\1\uffff",
        "",
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
            return "1:1: Tokens : ( T20 | T21 | T22 | T23 | T24 | T25 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP | IF );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        int LA10_5 = input.LA(1);
                        s = -1;
                        if ( ((LA10_5>='\u0000' && LA10_5<=';')||(LA10_5>='=' && LA10_5<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 27;

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        int LA10_20 = input.LA(1);
                        s = -1;
                        if ( (LA10_20=='=') ) {s = 47;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        int LA10_11 = input.LA(1);
                        s = -1;
                        if ( (LA10_11=='.') && (( codeMode || !codeMode ))) {s = 38;}

                        else if ( ((LA10_11>='0' && LA10_11<='9')) && (( codeMode || !codeMode ))) {s = 11;}

                        else if ( ((LA10_11>='\u0000' && LA10_11<='-')||LA10_11=='/'||(LA10_11>=':' && LA10_11<=';')||(LA10_11>='=' && LA10_11<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 37;

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 36;}

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        int LA10_6 = input.LA(1);
                        s = -1;
                        if ( (LA10_6=='c') && (( codeMode || !codeMode ))) {s = 28;}

                        else if ( (LA10_6=='l') ) {s = 29;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        int LA10_45 = input.LA(1);
                        s = -1;
                        if ( ((LA10_45>='\u0000' && LA10_45<=';')||(LA10_45>='=' && LA10_45<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 46;

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        int LA10_13 = input.LA(1);
                        s = -1;
                        if ( ((LA10_13>='\u0000' && LA10_13<=';')||(LA10_13>='=' && LA10_13<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 40;

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        int LA10_9 = input.LA(1);
                        s = -1;
                        if ( ((LA10_9>='\t' && LA10_9<='\n')||LA10_9=='\r'||LA10_9==' ') && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( ((LA10_9>='\u0000' && LA10_9<='\b')||(LA10_9>='\u000B' && LA10_9<='\f')||(LA10_9>='\u000E' && LA10_9<='\u001F')||(LA10_9>='!' && LA10_9<=';')||(LA10_9>='=' && LA10_9<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 33;

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 71;}

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        int LA10_38 = input.LA(1);
                        s = -1;
                        if ( ((LA10_38>='0' && LA10_38<='9')) && (( codeMode || !codeMode ))) {s = 61;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        int LA10_3 = input.LA(1);
                        s = -1;
                        if ( ((LA10_3>='\u0000' && LA10_3<=';')||(LA10_3>='=' && LA10_3<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA10_4 = input.LA(1);
                        s = -1;
                        if ( ((LA10_4>='\u0000' && LA10_4<=';')||(LA10_4>='=' && LA10_4<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        int LA10_56 = input.LA(1);
                        s = -1;
                        if ( ((LA10_56>='\u0000' && LA10_56<=';')||(LA10_56>='=' && LA10_56<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 57;

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        int LA10_47 = input.LA(1);
                        s = -1;
                        if ( ((LA10_47>='\u0000' && LA10_47<=';')||(LA10_47>='=' && LA10_47<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 46;

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 58;}

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 64;}

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        int LA10_69 = input.LA(1);
                        s = -1;
                        if ( ((LA10_69>='\u0000' && LA10_69<=';')||(LA10_69>='=' && LA10_69<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 74;

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 52;}

                        else if ( ( !codeMode ) ) {s = 22;}

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        int LA10_16 = input.LA(1);
                        s = -1;
                        if ( ((LA10_16>='\u0000' && LA10_16<=';')||(LA10_16>='=' && LA10_16<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 43;

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 32;}

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( (true) ) {s = 32;}

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        int LA10_61 = input.LA(1);
                        s = -1;
                        if ( ((LA10_61>='0' && LA10_61<='9')) && (( codeMode || !codeMode ))) {s = 61;}

                        else if ( ((LA10_61>='\u0000' && LA10_61<='/')||(LA10_61>=':' && LA10_61<=';')||(LA10_61>='=' && LA10_61<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 37;

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        int LA10_30 = input.LA(1);
                        s = -1;
                        if ( (LA10_30=='\n') && (( codeMode || !codeMode ))) {s = 56;}

                        else if ( ((LA10_30>='\u0000' && LA10_30<='\t')||(LA10_30>='\u000B' && LA10_30<=';')||(LA10_30>='=' && LA10_30<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 57;

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        int LA10_44 = input.LA(1);
                        s = -1;
                        if ( ((LA10_44>='\u0000' && LA10_44<=';')||(LA10_44>='=' && LA10_44<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 67;

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        int LA10_29 = input.LA(1);
                        s = -1;
                        if ( (LA10_29=='s') ) {s = 55;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        int LA10_55 = input.LA(1);
                        s = -1;
                        if ( (LA10_55=='e') ) {s = 70;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        int LA10_1 = input.LA(1);
                        s = -1;
                        if ( ((LA10_1>='\u0000' && LA10_1<=';')||(LA10_1>='=' && LA10_1<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 63;}

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        int LA10_15 = input.LA(1);
                        s = -1;
                        if ( ((LA10_15>='\u0000' && LA10_15<=';')||(LA10_15>='=' && LA10_15<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 42;

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 53;}

                        else if ( ( !codeMode ) ) {s = 22;}

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        int LA10_2 = input.LA(1);
                        s = -1;
                        if ( ((LA10_2>='\u0000' && LA10_2<=';')||(LA10_2>='=' && LA10_2<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 24;

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        int LA10_48 = input.LA(1);
                        s = -1;
                        if ( ((LA10_48>='\u0000' && LA10_48<=';')||(LA10_48>='=' && LA10_48<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 68;

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 51;}

                        else if ( ( !codeMode ) ) {s = 22;}

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 73;}

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        int LA10_18 = input.LA(1);
                        s = -1;
                        if ( (LA10_18=='=') && (( codeMode || !codeMode ))) {s = 44;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 50;}

                        else if ( ( !codeMode ) ) {s = 22;}

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        int LA10_21 = input.LA(1);
                        s = -1;
                        if ( (LA10_21=='f') && (( codeMode || !codeMode ))) {s = 48;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 65;}

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( (true) ) {s = 66;}

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 49;}

                        else if ( ( !codeMode ) ) {s = 22;}

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        int LA10_12 = input.LA(1);
                        s = -1;
                        if ( ((LA10_12>='0' && LA10_12<='9')) ) {s = 39;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        int LA10_28 = input.LA(1);
                        s = -1;
                        if ( (LA10_28=='h') && (( codeMode || !codeMode ))) {s = 54;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        int LA10_17 = input.LA(1);
                        s = -1;
                        if ( ((LA10_17>='\u0000' && LA10_17<=';')||(LA10_17>='=' && LA10_17<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 43;

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        int LA10_19 = input.LA(1);
                        s = -1;
                        if ( (LA10_19=='=') ) {s = 45;}

                        else if ( ((LA10_19>='\u0000' && LA10_19<=';')||(LA10_19>='>' && LA10_19<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 46;

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        int LA10_54 = input.LA(1);
                        s = -1;
                        if ( (LA10_54=='o') && (( codeMode || !codeMode ))) {s = 69;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 45 : 
                        int LA10_39 = input.LA(1);
                        s = -1;
                        if ( ((LA10_39>='0' && LA10_39<='9')) ) {s = 39;}

                        else if ( ((LA10_39>='\u0000' && LA10_39<='/')||(LA10_39>=':' && LA10_39<=';')||(LA10_39>='=' && LA10_39<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 62;

                        if ( s>=0 ) return s;
                        break;
                    case 46 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 76;}

                        if ( s>=0 ) return s;
                        break;
                    case 47 : 
                        int LA10_0 = input.LA(1);
                        s = -1;
                        if ( (LA10_0==';') ) {s = 1;}

                        else if ( (LA10_0=='(') ) {s = 2;}

                        else if ( (LA10_0==')') ) {s = 3;}

                        else if ( (LA10_0=='{') ) {s = 4;}

                        else if ( (LA10_0=='}') ) {s = 5;}

                        else if ( (LA10_0=='e') ) {s = 6;}

                        else if ( (LA10_0=='?') && (( codeMode || !codeMode ))) {s = 7;}

                        else if ( (LA10_0=='<') ) {s = 8;}

                        else if ( ((LA10_0>='\t' && LA10_0<='\n')||LA10_0=='\r'||LA10_0==' ') && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( (LA10_0=='\"') && (( codeMode || !codeMode ))) {s = 10;}

                        else if ( ((LA10_0>='0' && LA10_0<='9')) && (( codeMode || !codeMode ))) {s = 11;}

                        else if ( (LA10_0=='.') ) {s = 12;}

                        else if ( (LA10_0=='-') && (( codeMode || !codeMode ))) {s = 13;}

                        else if ( (LA10_0=='+') && (( codeMode || !codeMode ))) {s = 14;}

                        else if ( (LA10_0=='*') && (( codeMode || !codeMode ))) {s = 15;}

                        else if ( (LA10_0=='/') ) {s = 16;}

                        else if ( (LA10_0=='%') ) {s = 17;}

                        else if ( (LA10_0=='=') && (( codeMode || !codeMode ))) {s = 18;}

                        else if ( (LA10_0=='>') ) {s = 19;}

                        else if ( (LA10_0=='!') ) {s = 20;}

                        else if ( (LA10_0=='i') && (( codeMode || !codeMode ))) {s = 21;}

                        else if ( ((LA10_0>='\u0000' && LA10_0<='\b')||(LA10_0>='\u000B' && LA10_0<='\f')||(LA10_0>='\u000E' && LA10_0<='\u001F')||(LA10_0>='#' && LA10_0<='$')||(LA10_0>='&' && LA10_0<='\'')||LA10_0==','||LA10_0==':'||(LA10_0>='@' && LA10_0<='d')||(LA10_0>='f' && LA10_0<='h')||(LA10_0>='j' && LA10_0<='z')||LA10_0=='|'||(LA10_0>='~' && LA10_0<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        if ( s>=0 ) return s;
                        break;
                    case 48 : 
                        int LA10_35 = input.LA(1);
                        s = -1;
                        if ( ((LA10_35>='\u0000' && LA10_35<=';')||(LA10_35>='=' && LA10_35<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 59;

                        if ( s>=0 ) return s;
                        break;
                    case 49 : 
                        int LA10_14 = input.LA(1);
                        s = -1;
                        if ( ((LA10_14>='\u0000' && LA10_14<=';')||(LA10_14>='=' && LA10_14<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 41;

                        if ( s>=0 ) return s;
                        break;
                    case 50 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( (true) ) {s = 72;}

                        if ( s>=0 ) return s;
                        break;
                    case 51 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 22;}

                        else if ( ( codeMode ) ) {s = 60;}

                        if ( s>=0 ) return s;
                        break;
                    case 52 : 
                        int LA10_70 = input.LA(1);
                        s = -1;
                        if ( ((LA10_70>='\u0000' && LA10_70<=';')||(LA10_70>='=' && LA10_70<='\uFFFE')) && ( !codeMode )) {s = 22;}

                        else s = 75;

                        if ( s>=0 ) return s;
                        break;
                    case 53 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 77;}

                        else if ( ( !codeMode ) ) {s = 22;}

                        if ( s>=0 ) return s;
                        break;
                    case 54 : 
                        int LA10_7 = input.LA(1);
                        s = -1;
                        if ( (LA10_7=='>') && (( codeMode || !codeMode ))) {s = 30;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 55 : 
                        int LA10_10 = input.LA(1);
                        s = -1;
                        if ( ((LA10_10>='\u0000' && LA10_10<='!')||(LA10_10>='#' && LA10_10<=';')||(LA10_10>='=' && LA10_10<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 34;}

                        else if ( (LA10_10=='\"') && (( codeMode || !codeMode ))) {s = 35;}

                        else if ( (LA10_10=='<') && ( codeMode )) {s = 36;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 56 : 
                        int LA10_34 = input.LA(1);
                        s = -1;
                        if ( (LA10_34=='\"') && (( codeMode || !codeMode ))) {s = 35;}

                        else if ( ((LA10_34>='\u0000' && LA10_34<='!')||(LA10_34>='#' && LA10_34<=';')||(LA10_34>='=' && LA10_34<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 34;}

                        else if ( (LA10_34=='<') && ( codeMode )) {s = 36;}

                        else s = 22;

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