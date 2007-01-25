// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-25 21:22:24

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int T21=21;
    public static final int CODE_START=8;
    public static final int MINUS=16;
    public static final int T22=22;
    public static final int NUMBER=15;
    public static final int WS=10;
    public static final int T23=23;
    public static final int SINGLEQUOTE_STRING=12;
    public static final int MUL_OP=18;
    public static final int SEA=7;
    public static final int CODE_END=9;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int T25=25;
    public static final int INTEGER=14;
    public static final int DOUBLEQUOTE_STRING=11;
    public static final int ECHO=13;
    public static final int T26=26;
    public static final int IF=20;
    public static final int EOF=-1;
    public static final int Tokens=27;
    public static final int REL_OP=19;
    public static final int PLUS=17;
    public static final int NOQUOTE_STRING=5;
    public static final int T24=24;

      public static boolean codeMode = false;

    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T21
    public void mT21() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T21;
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
    // $ANTLR end T25

    // $ANTLR start T26
    public void mT26() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T26;
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
    // $ANTLR end T26

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
            // src/antlr3/Plumhead.g:40:23: ({...}? => '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:40:23: {...}? => '\\\"' (~ '\\\"' )* '\\\"'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "DOUBLEQUOTE_STRING", " codeMode ");
            }
            match('\"'); 
            // src/antlr3/Plumhead.g:40:44: (~ '\\\"' )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='\u0000' && LA4_0<='!')||(LA4_0>='#' && LA4_0<='\uFFFE')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:40:46: ~ '\\\"'
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

    // $ANTLR start SINGLEQUOTE_STRING
    public void mSINGLEQUOTE_STRING() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SINGLEQUOTE_STRING;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:41:23: ({...}? => '\\'' (~ '\\'' )* '\\'' )
            // src/antlr3/Plumhead.g:41:23: {...}? => '\\'' (~ '\\'' )* '\\''
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "SINGLEQUOTE_STRING", " codeMode ");
            }
            match('\''); 
            // src/antlr3/Plumhead.g:41:44: (~ '\\'' )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>='\u0000' && LA5_0<='&')||(LA5_0>='(' && LA5_0<='\uFFFE')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:41:46: ~ '\\''
            	    {
            	    if ( (input.LA(1)>='\u0000' && input.LA(1)<='&')||(input.LA(1)>='(' && input.LA(1)<='\uFFFE') ) {
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
            	    break loop5;
                }
            } while (true);

            match('\''); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SINGLEQUOTE_STRING

    // $ANTLR start ECHO
    public void mECHO() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = ECHO;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:42:23: ({...}? => 'echo' )
            // src/antlr3/Plumhead.g:42:23: {...}? => 'echo'
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
            // src/antlr3/Plumhead.g:45:11: ({...}? => ( '0' .. '9' )+ )
            // src/antlr3/Plumhead.g:45:11: {...}? => ( '0' .. '9' )+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "INTEGER", " codeMode ");
            }
            // src/antlr3/Plumhead.g:45:27: ( '0' .. '9' )+
            int cnt6=0;
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( ((LA6_0>='0' && LA6_0<='9')) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:45:28: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

            	    }
            	    break;

            	default :
            	    if ( cnt6 >= 1 ) break loop6;
                        EarlyExitException eee =
                            new EarlyExitException(6, input);
                        throw eee;
                }
                cnt6++;
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
            // src/antlr3/Plumhead.g:48:6: ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( ((LA8_0>='0' && LA8_0<='9')) && ( codeMode )) {
                alt8=1;
            }
            else if ( (LA8_0=='.') ) {
                alt8=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("47:1: NUMBER : ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER );", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:48:6: {...}? => INTEGER ( '.' INTEGER )?
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "NUMBER", " codeMode ");
                    }
                    mINTEGER(); 
                    // src/antlr3/Plumhead.g:48:31: ( '.' INTEGER )?
                    int alt7=2;
                    int LA7_0 = input.LA(1);
                    if ( (LA7_0=='.') ) {
                        alt7=1;
                    }
                    switch (alt7) {
                        case 1 :
                            // src/antlr3/Plumhead.g:48:32: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:49:7: '.' INTEGER
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
            // src/antlr3/Plumhead.g:52:13: ({...}? => '-' )
            // src/antlr3/Plumhead.g:52:13: {...}? => '-'
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
            // src/antlr3/Plumhead.g:53:13: ({...}? => '+' )
            // src/antlr3/Plumhead.g:53:13: {...}? => '+'
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
            // src/antlr3/Plumhead.g:54:13: ({...}? => '*' | '/' | '%' )
            int alt9=3;
            int LA9_0 = input.LA(1);
            if ( (LA9_0=='*') && ( codeMode )) {
                alt9=1;
            }
            else if ( (LA9_0=='/') ) {
                alt9=2;
            }
            else if ( (LA9_0=='%') ) {
                alt9=3;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("54:1: MUL_OP : ({...}? => '*' | '/' | '%' );", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:54:13: {...}? => '*'
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "MUL_OP", " codeMode ");
                    }
                    match('*'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:54:37: '/'
                    {
                    match('/'); 

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:54:44: '%'
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
            // src/antlr3/Plumhead.g:55:13: ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' )
            int alt10=6;
            int LA10_0 = input.LA(1);
            if ( (LA10_0=='=') && ( codeMode )) {
                alt10=1;
            }
            else if ( (LA10_0=='<') ) {
                int LA10_2 = input.LA(2);
                if ( (LA10_2=='=') ) {
                    alt10=2;
                }
                else {
                    alt10=5;}
            }
            else if ( (LA10_0=='>') ) {
                int LA10_3 = input.LA(2);
                if ( (LA10_3=='=') ) {
                    alt10=3;
                }
                else {
                    alt10=6;}
            }
            else if ( (LA10_0=='!') ) {
                alt10=4;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("55:1: REL_OP : ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' );", 10, 0, input);

                throw nvae;
            }
            switch (alt10) {
                case 1 :
                    // src/antlr3/Plumhead.g:55:13: {...}? => '=='
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "REL_OP", " codeMode ");
                    }
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:55:37: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:55:44: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:55:51: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:55:58: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:55:65: '>'
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
            // src/antlr3/Plumhead.g:57:13: ({...}? => 'if' )
            // src/antlr3/Plumhead.g:57:13: {...}? => 'if'
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
        // src/antlr3/Plumhead.g:1:10: ( T21 | T22 | T23 | T24 | T25 | T26 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP | IF )
        int alt11=19;
        alt11 = dfa11.predict(input);
        switch (alt11) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T21
                {
                mT21(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T22
                {
                mT22(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T23
                {
                mT23(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: T24
                {
                mT24(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: T25
                {
                mT25(); 

                }
                break;
            case 6 :
                // src/antlr3/Plumhead.g:1:30: T26
                {
                mT26(); 

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
                // src/antlr3/Plumhead.g:1:80: SINGLEQUOTE_STRING
                {
                mSINGLEQUOTE_STRING(); 

                }
                break;
            case 13 :
                // src/antlr3/Plumhead.g:1:99: ECHO
                {
                mECHO(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:104: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:111: MINUS
                {
                mMINUS(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:117: PLUS
                {
                mPLUS(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:122: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:129: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 19 :
                // src/antlr3/Plumhead.g:1:136: IF
                {
                mIF(); 

                }
                break;

        }

    }


    protected DFA11 dfa11 = new DFA11(this);
    public static final String DFA11_eotS =
        "\1\uffff\1\30\1\31\1\32\1\33\1\34\2\27\1\40\1\42\2\27\1\51\1\27"+
        "\1\54\1\55\1\56\2\57\1\27\1\62\2\27\6\uffff\2\27\1\75\3\uffff\1"+
        "\27\1\77\1\uffff\1\27\1\100\2\uffff\1\27\1\103\4\uffff\1\110\1\62"+
        "\1\uffff\1\62\1\111\5\uffff\2\27\1\75\5\uffff\1\51\7\uffff\1\117"+
        "\1\120\7\uffff";
    public static final String DFA11_eofS =
        "\123\uffff";
    public static final String DFA11_minS =
        "\6\0\1\143\1\76\1\77\4\0\1\60\5\0\1\75\1\0\1\75\1\146\1\uffff\5"+
        "\0\1\163\1\150\1\0\2\uffff\3\0\1\uffff\2\0\1\uffff\1\0\1\60\12\0"+
        "\5\uffff\1\145\1\157\2\0\1\uffff\2\0\1\uffff\2\0\4\uffff\4\0\3\uffff"+
        "\2\0\2\uffff";
    public static final String DFA11_maxS =
        "\6\ufffe\1\154\1\76\1\77\4\ufffe\1\71\5\ufffe\1\75\1\ufffe\1\75"+
        "\1\146\1\uffff\5\0\1\163\1\150\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff"+
        "\2\ufffe\1\uffff\1\0\1\71\1\ufffe\4\0\2\ufffe\1\0\2\ufffe\5\uffff"+
        "\1\145\1\157\1\ufffe\1\0\1\uffff\2\0\1\uffff\1\ufffe\1\0\4\uffff"+
        "\2\0\2\ufffe\3\uffff\2\0\2\uffff";
    public static final String DFA11_acceptS =
        "\27\uffff\1\7\10\uffff\1\22\1\10\3\uffff\1\13\2\uffff\1\14\14\uffff"+
        "\1\1\1\2\1\3\1\4\1\5\4\uffff\1\12\2\uffff\1\16\2\uffff\1\17\1\20"+
        "\2\21\4\uffff\1\11\1\16\1\23\2\uffff\1\6\1\15";
    public static final String DFA11_specialS =
        "\1\61\1\7\1\52\1\25\1\71\1\42\1\33\1\6\1\uffff\1\10\1\54\1\1\1\23"+
        "\1\34\1\55\1\67\1\43\1\14\1\57\1\3\1\72\1\12\1\32\1\uffff\1\65\1"+
        "\62\1\66\1\15\1\0\1\16\1\13\1\21\2\uffff\1\47\1\2\1\46\1\uffff\1"+
        "\50\1\44\1\uffff\1\74\1\63\1\22\1\11\1\45\1\37\1\40\1\53\1\56\1"+
        "\5\1\30\1\26\5\uffff\1\24\1\31\1\36\1\17\1\uffff\1\27\1\60\1\uffff"+
        "\1\51\1\73\4\uffff\1\4\1\70\1\64\1\35\3\uffff\1\41\1\20\2\uffff}>";
    public static final String[] DFA11_transition = {
        "\11\27\2\11\2\27\1\11\22\27\1\11\1\25\1\12\2\27\1\22\1\27\1\13\1"+
        "\2\1\3\1\20\1\17\1\27\1\16\1\15\1\21\12\14\1\27\1\1\1\10\1\23\1"+
        "\24\1\7\45\27\1\6\3\27\1\26\21\27\1\4\1\27\1\5\uff81\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\1\36\10\uffff\1\35",
        "\1\37",
        "\1\41",
        "\11\27\2\11\2\27\1\11\22\27\1\11\33\27\1\uffff\uffc2\27",
        "\42\43\1\44\31\43\1\45\uffc2\43",
        "\47\46\1\47\24\46\1\50\uffc2\46",
        "\56\27\1\52\1\27\12\14\2\27\1\uffff\uffc2\27",
        "\12\53",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\1\60",
        "\74\27\1\uffff\1\61\uffc1\27",
        "\1\63",
        "\1\64",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\72",
        "\1\73",
        "\12\27\1\74\61\27\1\uffff\uffc2\27",
        "",
        "",
        "\1\uffff",
        "\42\43\1\44\31\43\1\45\uffc2\43",
        "\74\27\1\uffff\uffc2\27",
        "",
        "\47\46\1\47\24\46\1\50\uffc2\46",
        "\74\27\1\uffff\uffc2\27",
        "",
        "\1\uffff",
        "\12\102",
        "\60\27\12\53\2\27\1\uffff\uffc2\27",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\1\uffff",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "",
        "",
        "",
        "",
        "",
        "\1\112",
        "\1\113",
        "\74\27\1\uffff\uffc2\27",
        "\1\uffff",
        "",
        "\1\uffff",
        "\1\uffff",
        "",
        "\60\27\12\102\2\27\1\uffff\uffc2\27",
        "\1\uffff",
        "",
        "",
        "",
        "",
        "\1\uffff",
        "\1\uffff",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "",
        "",
        "",
        "\1\uffff",
        "\1\uffff",
        "",
        ""
    };

    class DFA11 extends DFA {
        public DFA11(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 11;
            this.eot = DFA.unpackEncodedString(DFA11_eotS);
            this.eof = DFA.unpackEncodedString(DFA11_eofS);
            this.min = DFA.unpackEncodedStringToUnsignedChars(DFA11_minS);
            this.max = DFA.unpackEncodedStringToUnsignedChars(DFA11_maxS);
            this.accept = DFA.unpackEncodedString(DFA11_acceptS);
            this.special = DFA.unpackEncodedString(DFA11_specialS);
            int numStates = DFA11_transition.length;
            this.transition = new short[numStates][];
            for (int i=0; i<numStates; i++) {
                transition[i] = DFA.unpackEncodedString(DFA11_transition[i]);
            }
        }
        public String getDescription() {
            return "1:1: Tokens : ( T21 | T22 | T23 | T24 | T25 | T26 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP | IF );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 57;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        int LA11_11 = input.LA(1);
                        s = -1;
                        if ( ((LA11_11>='\u0000' && LA11_11<='&')||(LA11_11>='(' && LA11_11<=';')||(LA11_11>='=' && LA11_11<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 38;}

                        else if ( (LA11_11=='\'') && (( codeMode || !codeMode ))) {s = 39;}

                        else if ( (LA11_11=='<') && ( codeMode )) {s = 40;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        int LA11_35 = input.LA(1);
                        s = -1;
                        if ( (LA11_35=='\"') && (( codeMode || !codeMode ))) {s = 36;}

                        else if ( ((LA11_35>='\u0000' && LA11_35<='!')||(LA11_35>='#' && LA11_35<=';')||(LA11_35>='=' && LA11_35<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 35;}

                        else if ( (LA11_35=='<') && ( codeMode )) {s = 37;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        int LA11_19 = input.LA(1);
                        s = -1;
                        if ( (LA11_19=='=') && (( codeMode || !codeMode ))) {s = 48;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 32;}

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( (true) ) {s = 32;}

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        int LA11_7 = input.LA(1);
                        s = -1;
                        if ( (LA11_7=='>') && (( codeMode || !codeMode ))) {s = 31;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        int LA11_1 = input.LA(1);
                        s = -1;
                        if ( ((LA11_1>='\u0000' && LA11_1<=';')||(LA11_1>='=' && LA11_1<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 24;

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        int LA11_9 = input.LA(1);
                        s = -1;
                        if ( ((LA11_9>='\t' && LA11_9<='\n')||LA11_9=='\r'||LA11_9==' ') && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( ((LA11_9>='\u0000' && LA11_9<='\b')||(LA11_9>='\u000B' && LA11_9<='\f')||(LA11_9>='\u000E' && LA11_9<='\u001F')||(LA11_9>='!' && LA11_9<=';')||(LA11_9>='=' && LA11_9<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 34;

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 68;}

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        int LA11_21 = input.LA(1);
                        s = -1;
                        if ( (LA11_21=='=') ) {s = 51;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA11_30 = input.LA(1);
                        s = -1;
                        if ( (LA11_30=='h') && (( codeMode || !codeMode ))) {s = 59;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        int LA11_17 = input.LA(1);
                        s = -1;
                        if ( ((LA11_17>='\u0000' && LA11_17<=';')||(LA11_17>='=' && LA11_17<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 47;

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 56;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        int LA11_29 = input.LA(1);
                        s = -1;
                        if ( (LA11_29=='s') ) {s = 58;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 76;}

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 82;}

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        int LA11_31 = input.LA(1);
                        s = -1;
                        if ( (LA11_31=='\n') && (( codeMode || !codeMode ))) {s = 60;}

                        else if ( ((LA11_31>='\u0000' && LA11_31<='\t')||(LA11_31>='\u000B' && LA11_31<=';')||(LA11_31>='=' && LA11_31<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 61;

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        int LA11_43 = input.LA(1);
                        s = -1;
                        if ( ((LA11_43>='0' && LA11_43<='9')) ) {s = 43;}

                        else if ( ((LA11_43>='\u0000' && LA11_43<='/')||(LA11_43>=':' && LA11_43<=';')||(LA11_43>='=' && LA11_43<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 67;

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        int LA11_12 = input.LA(1);
                        s = -1;
                        if ( (LA11_12=='.') && (( codeMode || !codeMode ))) {s = 42;}

                        else if ( ((LA11_12>='0' && LA11_12<='9')) && (( codeMode || !codeMode ))) {s = 12;}

                        else if ( ((LA11_12>='\u0000' && LA11_12<='-')||LA11_12=='/'||(LA11_12>=':' && LA11_12<=';')||(LA11_12>='=' && LA11_12<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 41;

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        int LA11_58 = input.LA(1);
                        s = -1;
                        if ( (LA11_58=='e') ) {s = 74;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        int LA11_3 = input.LA(1);
                        s = -1;
                        if ( ((LA11_3>='\u0000' && LA11_3<=';')||(LA11_3>='=' && LA11_3<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        int LA11_52 = input.LA(1);
                        s = -1;
                        if ( ((LA11_52>='\u0000' && LA11_52<=';')||(LA11_52>='=' && LA11_52<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 73;

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 37;}

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        int LA11_51 = input.LA(1);
                        s = -1;
                        if ( ((LA11_51>='\u0000' && LA11_51<=';')||(LA11_51>='=' && LA11_51<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        int LA11_59 = input.LA(1);
                        s = -1;
                        if ( (LA11_59=='o') && (( codeMode || !codeMode ))) {s = 75;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        int LA11_22 = input.LA(1);
                        s = -1;
                        if ( (LA11_22=='f') && (( codeMode || !codeMode ))) {s = 52;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        int LA11_6 = input.LA(1);
                        s = -1;
                        if ( (LA11_6=='l') ) {s = 29;}

                        else if ( (LA11_6=='c') && (( codeMode || !codeMode ))) {s = 30;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        int LA11_13 = input.LA(1);
                        s = -1;
                        if ( ((LA11_13>='0' && LA11_13<='9')) ) {s = 43;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        int LA11_75 = input.LA(1);
                        s = -1;
                        if ( ((LA11_75>='\u0000' && LA11_75<=';')||(LA11_75>='=' && LA11_75<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 80;

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        int LA11_60 = input.LA(1);
                        s = -1;
                        if ( ((LA11_60>='\u0000' && LA11_60<=';')||(LA11_60>='=' && LA11_60<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 61;

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 70;}

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( (true) ) {s = 71;}

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 81;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        int LA11_5 = input.LA(1);
                        s = -1;
                        if ( ((LA11_5>='\u0000' && LA11_5<=';')||(LA11_5>='=' && LA11_5<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        int LA11_16 = input.LA(1);
                        s = -1;
                        if ( ((LA11_16>='\u0000' && LA11_16<=';')||(LA11_16>='=' && LA11_16<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 46;

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        int LA11_39 = input.LA(1);
                        s = -1;
                        if ( ((LA11_39>='\u0000' && LA11_39<=';')||(LA11_39>='=' && LA11_39<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 64;

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 69;}

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        int LA11_36 = input.LA(1);
                        s = -1;
                        if ( ((LA11_36>='\u0000' && LA11_36<=';')||(LA11_36>='=' && LA11_36<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 63;

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 62;}

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        int LA11_38 = input.LA(1);
                        s = -1;
                        if ( (LA11_38=='\'') && (( codeMode || !codeMode ))) {s = 39;}

                        else if ( ((LA11_38>='\u0000' && LA11_38<='&')||(LA11_38>='(' && LA11_38<=';')||(LA11_38>='=' && LA11_38<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 38;}

                        else if ( (LA11_38=='<') && ( codeMode )) {s = 40;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        int LA11_66 = input.LA(1);
                        s = -1;
                        if ( ((LA11_66>='0' && LA11_66<='9')) && (( codeMode || !codeMode ))) {s = 66;}

                        else if ( ((LA11_66>='\u0000' && LA11_66<='/')||(LA11_66>=':' && LA11_66<=';')||(LA11_66>='=' && LA11_66<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 41;

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        int LA11_2 = input.LA(1);
                        s = -1;
                        if ( ((LA11_2>='\u0000' && LA11_2<=';')||(LA11_2>='=' && LA11_2<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        int LA11_48 = input.LA(1);
                        s = -1;
                        if ( ((LA11_48>='\u0000' && LA11_48<=';')||(LA11_48>='=' && LA11_48<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 72;

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        int LA11_10 = input.LA(1);
                        s = -1;
                        if ( ((LA11_10>='\u0000' && LA11_10<='!')||(LA11_10>='#' && LA11_10<=';')||(LA11_10>='=' && LA11_10<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 35;}

                        else if ( (LA11_10=='\"') && (( codeMode || !codeMode ))) {s = 36;}

                        else if ( (LA11_10=='<') && ( codeMode )) {s = 37;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 45 : 
                        int LA11_14 = input.LA(1);
                        s = -1;
                        if ( ((LA11_14>='\u0000' && LA11_14<=';')||(LA11_14>='=' && LA11_14<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 44;

                        if ( s>=0 ) return s;
                        break;
                    case 46 : 
                        int LA11_49 = input.LA(1);
                        s = -1;
                        if ( ((LA11_49>='\u0000' && LA11_49<=';')||(LA11_49>='=' && LA11_49<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 47 : 
                        int LA11_18 = input.LA(1);
                        s = -1;
                        if ( ((LA11_18>='\u0000' && LA11_18<=';')||(LA11_18>='=' && LA11_18<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 47;

                        if ( s>=0 ) return s;
                        break;
                    case 48 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 40;}

                        if ( s>=0 ) return s;
                        break;
                    case 49 : 
                        int LA11_0 = input.LA(1);
                        s = -1;
                        if ( (LA11_0==';') ) {s = 1;}

                        else if ( (LA11_0=='(') ) {s = 2;}

                        else if ( (LA11_0==')') ) {s = 3;}

                        else if ( (LA11_0=='{') ) {s = 4;}

                        else if ( (LA11_0=='}') ) {s = 5;}

                        else if ( (LA11_0=='e') ) {s = 6;}

                        else if ( (LA11_0=='?') && (( codeMode || !codeMode ))) {s = 7;}

                        else if ( (LA11_0=='<') ) {s = 8;}

                        else if ( ((LA11_0>='\t' && LA11_0<='\n')||LA11_0=='\r'||LA11_0==' ') && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( (LA11_0=='\"') && (( codeMode || !codeMode ))) {s = 10;}

                        else if ( (LA11_0=='\'') && (( codeMode || !codeMode ))) {s = 11;}

                        else if ( ((LA11_0>='0' && LA11_0<='9')) && (( codeMode || !codeMode ))) {s = 12;}

                        else if ( (LA11_0=='.') ) {s = 13;}

                        else if ( (LA11_0=='-') && (( codeMode || !codeMode ))) {s = 14;}

                        else if ( (LA11_0=='+') && (( codeMode || !codeMode ))) {s = 15;}

                        else if ( (LA11_0=='*') && (( codeMode || !codeMode ))) {s = 16;}

                        else if ( (LA11_0=='/') ) {s = 17;}

                        else if ( (LA11_0=='%') ) {s = 18;}

                        else if ( (LA11_0=='=') && (( codeMode || !codeMode ))) {s = 19;}

                        else if ( (LA11_0=='>') ) {s = 20;}

                        else if ( (LA11_0=='!') ) {s = 21;}

                        else if ( (LA11_0=='i') && (( codeMode || !codeMode ))) {s = 22;}

                        else if ( ((LA11_0>='\u0000' && LA11_0<='\b')||(LA11_0>='\u000B' && LA11_0<='\f')||(LA11_0>='\u000E' && LA11_0<='\u001F')||(LA11_0>='#' && LA11_0<='$')||LA11_0=='&'||LA11_0==','||LA11_0==':'||(LA11_0>='@' && LA11_0<='d')||(LA11_0>='f' && LA11_0<='h')||(LA11_0>='j' && LA11_0<='z')||LA11_0=='|'||(LA11_0>='~' && LA11_0<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 50 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 54;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 51 : 
                        int LA11_42 = input.LA(1);
                        s = -1;
                        if ( ((LA11_42>='0' && LA11_42<='9')) && (( codeMode || !codeMode ))) {s = 66;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 52 : 
                        int LA11_74 = input.LA(1);
                        s = -1;
                        if ( ((LA11_74>='\u0000' && LA11_74<=';')||(LA11_74>='=' && LA11_74<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 79;

                        if ( s>=0 ) return s;
                        break;
                    case 53 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 53;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 54 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 55;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 55 : 
                        int LA11_15 = input.LA(1);
                        s = -1;
                        if ( ((LA11_15>='\u0000' && LA11_15<=';')||(LA11_15>='=' && LA11_15<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 45;

                        if ( s>=0 ) return s;
                        break;
                    case 56 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 78;}

                        if ( s>=0 ) return s;
                        break;
                    case 57 : 
                        int LA11_4 = input.LA(1);
                        s = -1;
                        if ( ((LA11_4>='\u0000' && LA11_4<=';')||(LA11_4>='=' && LA11_4<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 27;

                        if ( s>=0 ) return s;
                        break;
                    case 58 : 
                        int LA11_20 = input.LA(1);
                        s = -1;
                        if ( (LA11_20=='=') ) {s = 49;}

                        else if ( ((LA11_20>='\u0000' && LA11_20<=';')||(LA11_20>='>' && LA11_20<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 59 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( (true) ) {s = 77;}

                        if ( s>=0 ) return s;
                        break;
                    case 60 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 65;}

                        if ( s>=0 ) return s;
                        break;
            }
            NoViableAltException nvae =
                new NoViableAltException(getDescription(), 11, _s, input);
            error(nvae);
            throw nvae;
        }
    }
 

}