// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-26 19:34:11

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
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
    public static final int ELSE=21;
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

    // $ANTLR start T22
    public void mT22() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T22;
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

    // $ANTLR start ELSE
    public void mELSE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = ELSE;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:58:13: ({...}? => 'else' )
            // src/antlr3/Plumhead.g:58:13: {...}? => 'else'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "ELSE", " codeMode ");
            }
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
    // $ANTLR end ELSE

    public void mTokens() throws RecognitionException {
        // src/antlr3/Plumhead.g:1:10: ( T22 | T23 | T24 | T25 | T26 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP | IF | ELSE )
        int alt11=19;
        alt11 = dfa11.predict(input);
        switch (alt11) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T22
                {
                mT22(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T23
                {
                mT23(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T24
                {
                mT24(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: T25
                {
                mT25(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: T26
                {
                mT26(); 

                }
                break;
            case 6 :
                // src/antlr3/Plumhead.g:1:30: SEA
                {
                mSEA(); 

                }
                break;
            case 7 :
                // src/antlr3/Plumhead.g:1:34: CODE_START
                {
                mCODE_START(); 

                }
                break;
            case 8 :
                // src/antlr3/Plumhead.g:1:45: CODE_END
                {
                mCODE_END(); 

                }
                break;
            case 9 :
                // src/antlr3/Plumhead.g:1:54: WS
                {
                mWS(); 

                }
                break;
            case 10 :
                // src/antlr3/Plumhead.g:1:57: DOUBLEQUOTE_STRING
                {
                mDOUBLEQUOTE_STRING(); 

                }
                break;
            case 11 :
                // src/antlr3/Plumhead.g:1:76: SINGLEQUOTE_STRING
                {
                mSINGLEQUOTE_STRING(); 

                }
                break;
            case 12 :
                // src/antlr3/Plumhead.g:1:95: ECHO
                {
                mECHO(); 

                }
                break;
            case 13 :
                // src/antlr3/Plumhead.g:1:100: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:107: MINUS
                {
                mMINUS(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:113: PLUS
                {
                mPLUS(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:118: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:125: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:132: IF
                {
                mIF(); 

                }
                break;
            case 19 :
                // src/antlr3/Plumhead.g:1:135: ELSE
                {
                mELSE(); 

                }
                break;

        }

    }


    protected DFA11 dfa11 = new DFA11(this);
    public static final String DFA11_eotS =
        "\1\uffff\1\30\1\31\1\32\1\33\1\34\1\27\1\37\1\40\3\27\1\51\1\27"+
        "\1\54\1\55\1\56\2\57\1\27\1\62\2\27\6\uffff\1\73\3\uffff\1\27\1"+
        "\75\1\uffff\1\27\1\76\1\uffff\2\27\1\uffff\1\27\1\103\4\uffff\1"+
        "\110\1\62\1\uffff\1\62\1\111\5\uffff\1\73\4\uffff\2\27\1\uffff\1"+
        "\51\10\uffff\1\117\1\120\6\uffff";
    public static final String DFA11_eofS =
        "\123\uffff";
    public static final String DFA11_minS =
        "\6\0\1\76\1\77\3\0\1\143\1\0\1\60\5\0\1\75\1\0\1\75\1\146\1\uffff"+
        "\6\0\2\uffff\3\0\1\uffff\2\0\1\uffff\1\150\1\163\1\0\1\60\12\0\5"+
        "\uffff\2\0\1\uffff\2\0\1\157\1\145\1\uffff\2\0\4\uffff\2\0\1\uffff"+
        "\2\0\2\uffff\2\0\2\uffff";
    public static final String DFA11_maxS =
        "\6\ufffe\1\76\1\77\3\ufffe\1\154\1\ufffe\1\71\5\ufffe\1\75\1\ufffe"+
        "\1\75\1\146\1\uffff\5\0\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff\2\ufffe"+
        "\1\uffff\1\150\1\163\1\0\1\71\1\ufffe\4\0\2\ufffe\1\0\2\ufffe\5"+
        "\uffff\1\ufffe\1\0\1\uffff\2\0\1\157\1\145\1\uffff\1\ufffe\1\0\4"+
        "\uffff\2\0\1\uffff\2\ufffe\2\uffff\2\0\2\uffff";
    public static final String DFA11_acceptS =
        "\27\uffff\1\6\6\uffff\1\7\1\21\3\uffff\1\12\2\uffff\1\13\16\uffff"+
        "\1\1\1\2\1\3\1\4\1\5\2\uffff\1\11\4\uffff\1\15\2\uffff\1\16\1\17"+
        "\2\20\2\uffff\1\10\2\uffff\1\15\1\22\2\uffff\1\14\1\23";
    public static final String DFA11_specialS =
        "\1\72\1\74\1\7\1\33\1\52\1\1\1\40\1\uffff\1\17\1\41\1\4\1\34\1\73"+
        "\1\46\1\65\1\23\1\53\1\12\1\2\1\0\1\27\1\60\1\11\1\uffff\1\22\1"+
        "\3\1\43\1\51\1\35\1\13\2\uffff\1\56\1\54\1\6\1\uffff\1\57\1\5\1"+
        "\uffff\1\36\1\64\1\45\1\21\1\15\1\42\1\10\1\67\1\70\1\14\1\66\1"+
        "\26\1\55\1\50\5\uffff\1\62\1\30\1\uffff\1\24\1\71\1\37\1\61\1\uffff"+
        "\1\16\1\44\4\uffff\1\25\1\63\1\uffff\1\31\1\47\2\uffff\1\20\1\32"+
        "\2\uffff}>";
    public static final String[] DFA11_transition = {
        "\11\27\2\10\2\27\1\10\22\27\1\10\1\25\1\11\2\27\1\22\1\27\1\12\1"+
        "\2\1\3\1\20\1\17\1\27\1\16\1\15\1\21\12\14\1\27\1\1\1\7\1\23\1\24"+
        "\1\6\45\27\1\13\3\27\1\26\21\27\1\4\1\27\1\5\uff81\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
        "\1\35",
        "\1\36",
        "\11\27\2\10\2\27\1\10\22\27\1\10\33\27\1\uffff\uffc2\27",
        "\42\41\1\42\31\41\1\43\uffc2\41",
        "\47\44\1\45\24\44\1\46\uffc2\44",
        "\1\47\10\uffff\1\50",
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
        "\12\27\1\72\61\27\1\uffff\uffc2\27",
        "",
        "",
        "\1\uffff",
        "\42\41\1\42\31\41\1\43\uffc2\41",
        "\74\27\1\uffff\uffc2\27",
        "",
        "\47\44\1\45\24\44\1\46\uffc2\44",
        "\74\27\1\uffff\uffc2\27",
        "",
        "\1\77",
        "\1\100",
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
        "\74\27\1\uffff\uffc2\27",
        "\1\uffff",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\113",
        "\1\114",
        "",
        "\60\27\12\102\2\27\1\uffff\uffc2\27",
        "\1\uffff",
        "",
        "",
        "",
        "",
        "\1\uffff",
        "\1\uffff",
        "",
        "\74\27\1\uffff\uffc2\27",
        "\74\27\1\uffff\uffc2\27",
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
            return "1:1: Tokens : ( T22 | T23 | T24 | T25 | T26 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP | IF | ELSE );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        int LA11_19 = input.LA(1);
                        s = -1;
                        if ( (LA11_19=='=') && (( codeMode || !codeMode ))) {s = 48;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        int LA11_5 = input.LA(1);
                        s = -1;
                        if ( ((LA11_5>='\u0000' && LA11_5<=';')||(LA11_5>='=' && LA11_5<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        int LA11_18 = input.LA(1);
                        s = -1;
                        if ( ((LA11_18>='\u0000' && LA11_18<=';')||(LA11_18>='=' && LA11_18<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 47;

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 54;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        int LA11_10 = input.LA(1);
                        s = -1;
                        if ( ((LA11_10>='\u0000' && LA11_10<='&')||(LA11_10>='(' && LA11_10<=';')||(LA11_10>='=' && LA11_10<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 36;}

                        else if ( (LA11_10=='\'') && (( codeMode || !codeMode ))) {s = 37;}

                        else if ( (LA11_10=='<') && ( codeMode )) {s = 38;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        int LA11_37 = input.LA(1);
                        s = -1;
                        if ( ((LA11_37>='\u0000' && LA11_37<=';')||(LA11_37>='=' && LA11_37<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 62;

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        int LA11_34 = input.LA(1);
                        s = -1;
                        if ( ((LA11_34>='\u0000' && LA11_34<=';')||(LA11_34>='=' && LA11_34<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 61;

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        int LA11_2 = input.LA(1);
                        s = -1;
                        if ( ((LA11_2>='\u0000' && LA11_2<=';')||(LA11_2>='=' && LA11_2<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 69;}

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        int LA11_22 = input.LA(1);
                        s = -1;
                        if ( (LA11_22=='f') && (( codeMode || !codeMode ))) {s = 52;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        int LA11_17 = input.LA(1);
                        s = -1;
                        if ( ((LA11_17>='\u0000' && LA11_17<=';')||(LA11_17>='=' && LA11_17<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 47;

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA11_29 = input.LA(1);
                        s = -1;
                        if ( (LA11_29=='\n') && (( codeMode || !codeMode ))) {s = 58;}

                        else if ( ((LA11_29>='\u0000' && LA11_29<='\t')||(LA11_29>='\u000B' && LA11_29<=';')||(LA11_29>='=' && LA11_29<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 59;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        int LA11_48 = input.LA(1);
                        s = -1;
                        if ( ((LA11_48>='\u0000' && LA11_48<=';')||(LA11_48>='=' && LA11_48<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 72;

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        int LA11_43 = input.LA(1);
                        s = -1;
                        if ( ((LA11_43>='0' && LA11_43<='9')) ) {s = 43;}

                        else if ( ((LA11_43>='\u0000' && LA11_43<='/')||(LA11_43>=':' && LA11_43<=';')||(LA11_43>='=' && LA11_43<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 67;

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        int LA11_66 = input.LA(1);
                        s = -1;
                        if ( ((LA11_66>='0' && LA11_66<='9')) && (( codeMode || !codeMode ))) {s = 66;}

                        else if ( ((LA11_66>='\u0000' && LA11_66<='/')||(LA11_66>=':' && LA11_66<=';')||(LA11_66>='=' && LA11_66<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 41;

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        int LA11_8 = input.LA(1);
                        s = -1;
                        if ( ((LA11_8>='\t' && LA11_8<='\n')||LA11_8=='\r'||LA11_8==' ') && (( codeMode || !codeMode ))) {s = 8;}

                        else if ( ((LA11_8>='\u0000' && LA11_8<='\b')||(LA11_8>='\u000B' && LA11_8<='\f')||(LA11_8>='\u000E' && LA11_8<='\u001F')||(LA11_8>='!' && LA11_8<=';')||(LA11_8>='=' && LA11_8<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 32;

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 81;}

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        int LA11_42 = input.LA(1);
                        s = -1;
                        if ( ((LA11_42>='0' && LA11_42<='9')) && (( codeMode || !codeMode ))) {s = 66;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 53;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        int LA11_15 = input.LA(1);
                        s = -1;
                        if ( ((LA11_15>='\u0000' && LA11_15<=';')||(LA11_15>='=' && LA11_15<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 45;

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 35;}

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 31;}

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( (true) ) {s = 31;}

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        int LA11_20 = input.LA(1);
                        s = -1;
                        if ( (LA11_20=='=') ) {s = 49;}

                        else if ( ((LA11_20>='\u0000' && LA11_20<=';')||(LA11_20>='>' && LA11_20<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 74;}

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        int LA11_75 = input.LA(1);
                        s = -1;
                        if ( ((LA11_75>='\u0000' && LA11_75<=';')||(LA11_75>='=' && LA11_75<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 79;

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 82;}

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        int LA11_3 = input.LA(1);
                        s = -1;
                        if ( ((LA11_3>='\u0000' && LA11_3<=';')||(LA11_3>='=' && LA11_3<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        int LA11_11 = input.LA(1);
                        s = -1;
                        if ( (LA11_11=='c') && (( codeMode || !codeMode ))) {s = 39;}

                        else if ( (LA11_11=='l') && (( codeMode || !codeMode ))) {s = 40;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 57;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        int LA11_39 = input.LA(1);
                        s = -1;
                        if ( (LA11_39=='h') && (( codeMode || !codeMode ))) {s = 63;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        int LA11_63 = input.LA(1);
                        s = -1;
                        if ( (LA11_63=='o') && (( codeMode || !codeMode ))) {s = 75;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        int LA11_6 = input.LA(1);
                        s = -1;
                        if ( (LA11_6=='>') && (( codeMode || !codeMode ))) {s = 29;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
                        int LA11_9 = input.LA(1);
                        s = -1;
                        if ( ((LA11_9>='\u0000' && LA11_9<='!')||(LA11_9>='#' && LA11_9<=';')||(LA11_9>='=' && LA11_9<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 33;}

                        else if ( (LA11_9=='\"') && (( codeMode || !codeMode ))) {s = 34;}

                        else if ( (LA11_9=='<') && ( codeMode )) {s = 35;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 68;}

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 55;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( (true) ) {s = 77;}

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 65;}

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        int LA11_13 = input.LA(1);
                        s = -1;
                        if ( ((LA11_13>='0' && LA11_13<='9')) ) {s = 43;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        int LA11_76 = input.LA(1);
                        s = -1;
                        if ( ((LA11_76>='\u0000' && LA11_76<=';')||(LA11_76>='=' && LA11_76<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 80;

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        int LA11_52 = input.LA(1);
                        s = -1;
                        if ( ((LA11_52>='\u0000' && LA11_52<=';')||(LA11_52>='=' && LA11_52<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 73;

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 56;}

                        else if ( ( !codeMode ) ) {s = 23;}

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        int LA11_4 = input.LA(1);
                        s = -1;
                        if ( ((LA11_4>='\u0000' && LA11_4<=';')||(LA11_4>='=' && LA11_4<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 27;

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        int LA11_16 = input.LA(1);
                        s = -1;
                        if ( ((LA11_16>='\u0000' && LA11_16<=';')||(LA11_16>='=' && LA11_16<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 46;

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        int LA11_33 = input.LA(1);
                        s = -1;
                        if ( (LA11_33=='\"') && (( codeMode || !codeMode ))) {s = 34;}

                        else if ( ((LA11_33>='\u0000' && LA11_33<='!')||(LA11_33>='#' && LA11_33<=';')||(LA11_33>='=' && LA11_33<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 33;}

                        else if ( (LA11_33=='<') && ( codeMode )) {s = 35;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 45 : 
                        int LA11_51 = input.LA(1);
                        s = -1;
                        if ( ((LA11_51>='\u0000' && LA11_51<=';')||(LA11_51>='=' && LA11_51<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 46 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 60;}

                        if ( s>=0 ) return s;
                        break;
                    case 47 : 
                        int LA11_36 = input.LA(1);
                        s = -1;
                        if ( (LA11_36=='\'') && (( codeMode || !codeMode ))) {s = 37;}

                        else if ( ((LA11_36>='\u0000' && LA11_36<='&')||(LA11_36>='(' && LA11_36<=';')||(LA11_36>='=' && LA11_36<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 36;}

                        else if ( (LA11_36=='<') && ( codeMode )) {s = 38;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 48 : 
                        int LA11_21 = input.LA(1);
                        s = -1;
                        if ( (LA11_21=='=') ) {s = 51;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 49 : 
                        int LA11_64 = input.LA(1);
                        s = -1;
                        if ( (LA11_64=='e') && (( codeMode || !codeMode ))) {s = 76;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 50 : 
                        int LA11_58 = input.LA(1);
                        s = -1;
                        if ( ((LA11_58>='\u0000' && LA11_58<=';')||(LA11_58>='=' && LA11_58<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 59;

                        if ( s>=0 ) return s;
                        break;
                    case 51 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 78;}

                        if ( s>=0 ) return s;
                        break;
                    case 52 : 
                        int LA11_40 = input.LA(1);
                        s = -1;
                        if ( (LA11_40=='s') && (( codeMode || !codeMode ))) {s = 64;}

                        else s = 23;

                        if ( s>=0 ) return s;
                        break;
                    case 53 : 
                        int LA11_14 = input.LA(1);
                        s = -1;
                        if ( ((LA11_14>='\u0000' && LA11_14<=';')||(LA11_14>='=' && LA11_14<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 44;

                        if ( s>=0 ) return s;
                        break;
                    case 54 : 
                        int LA11_49 = input.LA(1);
                        s = -1;
                        if ( ((LA11_49>='\u0000' && LA11_49<=';')||(LA11_49>='=' && LA11_49<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 55 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 70;}

                        if ( s>=0 ) return s;
                        break;
                    case 56 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( (true) ) {s = 71;}

                        if ( s>=0 ) return s;
                        break;
                    case 57 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 23;}

                        else if ( ( codeMode ) ) {s = 38;}

                        if ( s>=0 ) return s;
                        break;
                    case 58 : 
                        int LA11_0 = input.LA(1);
                        s = -1;
                        if ( (LA11_0==';') ) {s = 1;}

                        else if ( (LA11_0=='(') ) {s = 2;}

                        else if ( (LA11_0==')') ) {s = 3;}

                        else if ( (LA11_0=='{') ) {s = 4;}

                        else if ( (LA11_0=='}') ) {s = 5;}

                        else if ( (LA11_0=='?') && (( codeMode || !codeMode ))) {s = 6;}

                        else if ( (LA11_0=='<') ) {s = 7;}

                        else if ( ((LA11_0>='\t' && LA11_0<='\n')||LA11_0=='\r'||LA11_0==' ') && (( codeMode || !codeMode ))) {s = 8;}

                        else if ( (LA11_0=='\"') && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( (LA11_0=='\'') && (( codeMode || !codeMode ))) {s = 10;}

                        else if ( (LA11_0=='e') && (( codeMode || !codeMode ))) {s = 11;}

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
                    case 59 : 
                        int LA11_12 = input.LA(1);
                        s = -1;
                        if ( (LA11_12=='.') && (( codeMode || !codeMode ))) {s = 42;}

                        else if ( ((LA11_12>='0' && LA11_12<='9')) && (( codeMode || !codeMode ))) {s = 12;}

                        else if ( ((LA11_12>='\u0000' && LA11_12<='-')||LA11_12=='/'||(LA11_12>=':' && LA11_12<=';')||(LA11_12>='=' && LA11_12<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 41;

                        if ( s>=0 ) return s;
                        break;
                    case 60 : 
                        int LA11_1 = input.LA(1);
                        s = -1;
                        if ( ((LA11_1>='\u0000' && LA11_1<=';')||(LA11_1>='=' && LA11_1<='\uFFFE')) && ( !codeMode )) {s = 23;}

                        else s = 24;

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