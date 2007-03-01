// $ANTLR 3.0b6 src/antlr3/Plumhead.g 2007-03-01 20:28:47

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int CODE_START=10;
    public static final int MINUS=23;
    public static final int ARRAY=7;
    public static final int DIGITS=20;
    public static final int IDENT=18;
    public static final int T33=33;
    public static final int BITWISE_OP=26;
    public static final int NUMBER=22;
    public static final int WS=12;
    public static final int SINGLEQUOTE_STRING=14;
    public static final int T35=35;
    public static final int MUL_OP=25;
    public static final int SEA=9;
    public static final int T34=34;
    public static final int CODE_END=11;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int PREFIX=8;
    public static final int PAREN_OPEN=16;
    public static final int INTEGER=21;
    public static final int ASSIGN_OP=27;
    public static final int DOUBLEQUOTE_STRING=13;
    public static final int PAREN_CLOSE=17;
    public static final int ECHO=15;
    public static final int ELSE=30;
    public static final int IF=29;
    public static final int EOF=-1;
    public static final int T32=32;
    public static final int Tokens=36;
    public static final int T31=31;
    public static final int REL_OP=28;
    public static final int PLUS=24;
    public static final int NOQUOTE_STRING=5;
    public static final int SCALAR=19;

      public static boolean codeMode = false;

    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T31
    public void mT31() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T31;
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
    // $ANTLR end T31

    // $ANTLR start T32
    public void mT32() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T32;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:7:7: ( '{' )
            // src/antlr3/Plumhead.g:7:7: '{'
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
    // $ANTLR end T32

    // $ANTLR start T33
    public void mT33() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T33;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:8:7: ( '}' )
            // src/antlr3/Plumhead.g:8:7: '}'
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
    // $ANTLR end T33

    // $ANTLR start T34
    public void mT34() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T34;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:9:7: ( '[' )
            // src/antlr3/Plumhead.g:9:7: '['
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
    // $ANTLR end T34

    // $ANTLR start T35
    public void mT35() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T35;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:10:7: ( ']' )
            // src/antlr3/Plumhead.g:10:7: ']'
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
    // $ANTLR end T35

    // $ANTLR start SEA
    public void mSEA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SEA;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:32:23: ({...}? => (~ '<' )+ )
            // src/antlr3/Plumhead.g:32:23: {...}? => (~ '<' )+
            {
            if ( !( !codeMode ) ) {
                throw new FailedPredicateException(input, "SEA", " !codeMode ");
            }
            // src/antlr3/Plumhead.g:32:41: (~ '<' )+
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
            	    // src/antlr3/Plumhead.g:32:42: ~ '<'
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
            // src/antlr3/Plumhead.g:33:41: ( '<?php' )
            // src/antlr3/Plumhead.g:33:41: '<?php'
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
            // src/antlr3/Plumhead.g:34:23: ({...}? => '?>' ( '\\n' )? )
            // src/antlr3/Plumhead.g:34:23: {...}? => '?>' ( '\\n' )?
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "CODE_END", "  codeMode ");
            }
            match("?>"); 

            // src/antlr3/Plumhead.g:34:46: ( '\\n' )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0=='\n') ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:34:46: '\\n'
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
            // src/antlr3/Plumhead.g:35:23: ({...}? => ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // src/antlr3/Plumhead.g:35:23: {...}? => ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "WS", "  codeMode ");
            }
            // src/antlr3/Plumhead.g:35:41: ( (' '|'\\t'|'\\r'|'\\n'))+
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
            	    // src/antlr3/Plumhead.g:35:43: (' '|'\\t'|'\\r'|'\\n')
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

             _channel = HIDDEN; 

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
            // src/antlr3/Plumhead.g:36:23: ({...}? => '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:36:23: {...}? => '\\\"' (~ '\\\"' )* '\\\"'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "DOUBLEQUOTE_STRING", "  codeMode ");
            }
            match('\"'); 
            // src/antlr3/Plumhead.g:36:46: (~ '\\\"' )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='\u0000' && LA4_0<='!')||(LA4_0>='#' && LA4_0<='\uFFFE')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:36:48: ~ '\\\"'
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
            // src/antlr3/Plumhead.g:37:23: ({...}? => '\\'' (~ '\\'' )* '\\'' )
            // src/antlr3/Plumhead.g:37:23: {...}? => '\\'' (~ '\\'' )* '\\''
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "SINGLEQUOTE_STRING", "  codeMode ");
            }
            match('\''); 
            // src/antlr3/Plumhead.g:37:46: (~ '\\'' )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>='\u0000' && LA5_0<='&')||(LA5_0>='(' && LA5_0<='\uFFFE')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:37:48: ~ '\\''
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
            // src/antlr3/Plumhead.g:38:23: ({...}? => 'echo' )
            // src/antlr3/Plumhead.g:38:23: {...}? => 'echo'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "ECHO", "  codeMode ");
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

    // $ANTLR start PAREN_OPEN
    public void mPAREN_OPEN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = PAREN_OPEN;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:39:23: ({...}? => '(' )
            // src/antlr3/Plumhead.g:39:23: {...}? => '('
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "PAREN_OPEN", "  codeMode ");
            }
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
    // $ANTLR end PAREN_OPEN

    // $ANTLR start PAREN_CLOSE
    public void mPAREN_CLOSE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = PAREN_CLOSE;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:40:23: ({...}? => ')' )
            // src/antlr3/Plumhead.g:40:23: {...}? => ')'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "PAREN_CLOSE", "  codeMode ");
            }
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
    // $ANTLR end PAREN_CLOSE

    // $ANTLR start IDENT
    public void mIDENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // src/antlr3/Plumhead.g:42:23: ({...}? => ('a'..'z'|'A'..'Z') ( ('a'..'z'|'A'..'Z'))* )
            // src/antlr3/Plumhead.g:42:23: {...}? => ('a'..'z'|'A'..'Z') ( ('a'..'z'|'A'..'Z'))*
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "IDENT", "  codeMode ");
            }
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }

            // src/antlr3/Plumhead.g:42:64: ( ('a'..'z'|'A'..'Z'))*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( ((LA6_0>='A' && LA6_0<='Z')||(LA6_0>='a' && LA6_0<='z')) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:42:66: ('a'..'z'|'A'..'Z')
            	    {
            	    if ( (input.LA(1)>='A' && input.LA(1)<='Z')||(input.LA(1)>='a' && input.LA(1)<='z') ) {
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
            	    break loop6;
                }
            } while (true);


            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end IDENT

    // $ANTLR start SCALAR
    public void mSCALAR() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SCALAR;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:43:23: ({...}? => '$' IDENT )
            // src/antlr3/Plumhead.g:43:23: {...}? => '$' IDENT
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "SCALAR", "  codeMode ");
            }
            match('$'); 
            mIDENT(); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end SCALAR

    // $ANTLR start DIGITS
    public void mDIGITS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // src/antlr3/Plumhead.g:45:23: ({...}? => ( '0' .. '9' )+ )
            // src/antlr3/Plumhead.g:45:23: {...}? => ( '0' .. '9' )+
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "DIGITS", "  codeMode ");
            }
            // src/antlr3/Plumhead.g:45:41: ( '0' .. '9' )+
            int cnt7=0;
            loop7:
            do {
                int alt7=2;
                int LA7_0 = input.LA(1);
                if ( ((LA7_0>='0' && LA7_0<='9')) ) {
                    alt7=1;
                }


                switch (alt7) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:45:42: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

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


            }

        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end DIGITS

    // $ANTLR start INTEGER
    public void mINTEGER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = INTEGER;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:46:23: ({...}? => DIGITS )
            // src/antlr3/Plumhead.g:46:23: {...}? => DIGITS
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "INTEGER", "  codeMode ");
            }
            mDIGITS(); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
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
            // src/antlr3/Plumhead.g:47:23: ({...}? => ( DIGITS )? '.' DIGITS )
            // src/antlr3/Plumhead.g:47:23: {...}? => ( DIGITS )? '.' DIGITS
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "NUMBER", "  codeMode ");
            }
            // src/antlr3/Plumhead.g:47:41: ( DIGITS )?
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( ((LA8_0>='0' && LA8_0<='9')) && (  codeMode )) {
                alt8=1;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:47:41: DIGITS
                    {
                    mDIGITS(); 

                    }
                    break;

            }

            match('.'); 
            mDIGITS(); 

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
            // src/antlr3/Plumhead.g:49:23: ({...}? => '-' )
            // src/antlr3/Plumhead.g:49:23: {...}? => '-'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "MINUS", "  codeMode ");
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
            // src/antlr3/Plumhead.g:50:23: ({...}? => '+' )
            // src/antlr3/Plumhead.g:50:23: {...}? => '+'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "PLUS", "  codeMode ");
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
            // src/antlr3/Plumhead.g:51:23: ({...}? => '*' | '/' | '%' )
            int alt9=3;
            int LA9_0 = input.LA(1);
            if ( (LA9_0=='*') && (  codeMode )) {
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
                    new NoViableAltException("51:1: MUL_OP : ({...}? => '*' | '/' | '%' );", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:51:23: {...}? => '*'
                    {
                    if ( !(  codeMode ) ) {
                        throw new FailedPredicateException(input, "MUL_OP", "  codeMode ");
                    }
                    match('*'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:51:48: '/'
                    {
                    match('/'); 

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:51:55: '%'
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

    // $ANTLR start BITWISE_OP
    public void mBITWISE_OP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = BITWISE_OP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:52:23: ({...}? => '|' | '&' )
            int alt10=2;
            int LA10_0 = input.LA(1);
            if ( (LA10_0=='|') && (  codeMode )) {
                alt10=1;
            }
            else if ( (LA10_0=='&') ) {
                alt10=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("52:1: BITWISE_OP : ({...}? => '|' | '&' );", 10, 0, input);

                throw nvae;
            }
            switch (alt10) {
                case 1 :
                    // src/antlr3/Plumhead.g:52:23: {...}? => '|'
                    {
                    if ( !(  codeMode ) ) {
                        throw new FailedPredicateException(input, "BITWISE_OP", "  codeMode ");
                    }
                    match('|'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:52:48: '&'
                    {
                    match('&'); 

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
    // $ANTLR end BITWISE_OP

    // $ANTLR start ASSIGN_OP
    public void mASSIGN_OP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = ASSIGN_OP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:53:23: ({...}? => '=' )
            // src/antlr3/Plumhead.g:53:23: {...}? => '='
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "ASSIGN_OP", "  codeMode ");
            }
            match('='); 

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
            // src/antlr3/Plumhead.g:54:23: ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' )
            int alt11=6;
            int LA11_0 = input.LA(1);
            if ( (LA11_0=='=') && (  codeMode )) {
                alt11=1;
            }
            else if ( (LA11_0=='<') ) {
                int LA11_2 = input.LA(2);
                if ( (LA11_2=='=') ) {
                    alt11=2;
                }
                else {
                    alt11=5;}
            }
            else if ( (LA11_0=='>') ) {
                int LA11_3 = input.LA(2);
                if ( (LA11_3=='=') ) {
                    alt11=3;
                }
                else {
                    alt11=6;}
            }
            else if ( (LA11_0=='!') ) {
                alt11=4;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("54:1: REL_OP : ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' );", 11, 0, input);

                throw nvae;
            }
            switch (alt11) {
                case 1 :
                    // src/antlr3/Plumhead.g:54:23: {...}? => '=='
                    {
                    if ( !(  codeMode ) ) {
                        throw new FailedPredicateException(input, "REL_OP", "  codeMode ");
                    }
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:54:48: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:54:55: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:54:62: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:54:69: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:54:76: '>'
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
            // src/antlr3/Plumhead.g:56:23: ({...}? => 'if' )
            // src/antlr3/Plumhead.g:56:23: {...}? => 'if'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "IF", "  codeMode ");
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
            // src/antlr3/Plumhead.g:57:23: ({...}? => 'else' )
            // src/antlr3/Plumhead.g:57:23: {...}? => 'else'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "ELSE", "  codeMode ");
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
        // src/antlr3/Plumhead.g:1:10: ( T31 | T32 | T33 | T34 | T35 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | PAREN_OPEN | PAREN_CLOSE | SCALAR | INTEGER | NUMBER | MINUS | PLUS | MUL_OP | BITWISE_OP | ASSIGN_OP | REL_OP | IF | ELSE )
        int alt12=25;
        alt12 = dfa12.predict(input);
        switch (alt12) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T31
                {
                mT31(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T32
                {
                mT32(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T33
                {
                mT33(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: T34
                {
                mT34(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: T35
                {
                mT35(); 

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
                // src/antlr3/Plumhead.g:1:100: PAREN_OPEN
                {
                mPAREN_OPEN(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:111: PAREN_CLOSE
                {
                mPAREN_CLOSE(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:123: SCALAR
                {
                mSCALAR(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:130: INTEGER
                {
                mINTEGER(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:138: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:145: MINUS
                {
                mMINUS(); 

                }
                break;
            case 19 :
                // src/antlr3/Plumhead.g:1:151: PLUS
                {
                mPLUS(); 

                }
                break;
            case 20 :
                // src/antlr3/Plumhead.g:1:156: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 21 :
                // src/antlr3/Plumhead.g:1:163: BITWISE_OP
                {
                mBITWISE_OP(); 

                }
                break;
            case 22 :
                // src/antlr3/Plumhead.g:1:174: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 23 :
                // src/antlr3/Plumhead.g:1:184: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 24 :
                // src/antlr3/Plumhead.g:1:191: IF
                {
                mIF(); 

                }
                break;
            case 25 :
                // src/antlr3/Plumhead.g:1:194: ELSE
                {
                mELSE(); 

                }
                break;

        }

    }


    protected DFA12 dfa12 = new DFA12(this);
    public static final String DFA12_eotS =
        "\1\uffff\1\35\1\36\1\37\1\40\1\41\1\34\1\43\1\45\3\34\1\56\1\57"+
        "\1\34\1\61\1\34\1\63\1\64\1\65\2\66\1\67\1\70\1\72\1\74\2\34\6\uffff"+
        "\1\104\3\uffff\1\34\1\107\1\uffff\1\34\1\110\1\uffff\2\34\2\uffff"+
        "\1\116\1\uffff\1\120\6\uffff\1\127\1\uffff\1\74\1\uffff\1\74\1\131"+
        "\6\uffff\1\104\3\uffff\2\34\2\uffff\1\116\15\uffff\1\140\1\141\7"+
        "\uffff";
    public static final String DFA12_eofS =
        "\144\uffff";
    public static final String DFA12_minS =
        "\6\0\1\76\1\77\3\0\1\143\2\0\1\101\1\0\1\60\11\0\1\75\1\146\1\uffff"+
        "\6\0\2\uffff\3\0\1\uffff\2\0\1\uffff\1\163\1\150\21\0\5\uffff\2"+
        "\0\1\uffff\2\0\1\145\1\157\2\uffff\2\0\1\uffff\1\0\6\uffff\1\0\1"+
        "\uffff\1\0\1\uffff\2\0\3\uffff\2\0\2\uffff";
    public static final String DFA12_maxS =
        "\6\ufffe\1\76\1\77\3\ufffe\1\154\2\ufffe\1\172\1\ufffe\1\71\11\ufffe"+
        "\1\75\1\146\1\uffff\5\0\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff\2\ufffe"+
        "\1\uffff\1\163\1\150\2\0\1\ufffe\1\0\1\ufffe\6\0\1\ufffe\1\0\1\ufffe"+
        "\1\0\2\ufffe\5\uffff\1\0\1\ufffe\1\uffff\2\0\1\145\1\157\2\uffff"+
        "\1\ufffe\1\0\1\uffff\1\0\6\uffff\1\0\1\uffff\1\0\1\uffff\2\ufffe"+
        "\3\uffff\2\0\2\uffff";
    public static final String DFA12_acceptS =
        "\34\uffff\1\6\6\uffff\1\27\1\7\3\uffff\1\12\2\uffff\1\13\23\uffff"+
        "\1\1\1\2\1\3\1\4\1\5\2\uffff\1\11\4\uffff\1\15\1\16\2\uffff\1\20"+
        "\1\uffff\1\22\1\23\2\24\2\25\1\uffff\1\26\1\uffff\1\10\2\uffff\1"+
        "\17\1\21\1\30\2\uffff\1\31\1\14";
    public static final String DFA12_specialS =
        "\1\104\1\76\1\51\1\43\1\67\1\15\1\22\1\uffff\1\66\1\42\1\6\1\53"+
        "\1\64\1\11\1\13\1\4\1\50\1\70\1\34\1\62\1\46\1\31\1\71\1\47\1\33"+
        "\1\65\1\102\1\44\1\uffff\1\7\1\0\1\37\1\40\1\41\1\12\2\uffff\1\23"+
        "\1\60\1\5\1\uffff\1\61\1\1\1\uffff\1\32\1\30\1\10\1\73\1\35\1\54"+
        "\1\14\1\101\1\103\1\105\1\106\1\74\1\75\1\26\1\2\1\107\1\77\1\56"+
        "\1\52\5\uffff\1\57\1\24\1\uffff\1\20\1\17\1\16\1\36\2\uffff\1\55"+
        "\1\72\1\uffff\1\45\6\uffff\1\100\1\uffff\1\21\1\uffff\1\27\1\63"+
        "\3\uffff\1\25\1\3\2\uffff}>";
    public static final String[] DFA12_transition = {
        "\11\34\2\10\2\34\1\10\22\34\1\10\1\32\1\11\1\34\1\16\1\25\1\27\1"+
        "\12\1\14\1\15\1\23\1\22\1\34\1\21\1\20\1\24\12\17\1\34\1\1\1\7\1"+
        "\30\1\31\1\6\33\34\1\4\1\34\1\5\7\34\1\13\3\34\1\33\21\34\1\2\1"+
        "\26\1\3\uff81\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\1\42",
        "\1\44",
        "\11\34\2\10\2\34\1\10\22\34\1\10\33\34\1\uffff\uffc2\34",
        "\42\46\1\47\31\46\1\50\uffc2\46",
        "\47\51\1\52\24\51\1\53\uffc2\51",
        "\1\55\10\uffff\1\54",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\32\60\6\uffff\32\60",
        "\56\34\1\20\1\34\12\17\2\34\1\uffff\uffc2\34",
        "\12\62",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\1\71\uffc1\34",
        "\74\34\1\uffff\1\73\uffc1\34",
        "\1\75",
        "\1\76",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\12\34\1\105\61\34\1\uffff\uffc2\34",
        "",
        "",
        "\1\uffff",
        "\42\46\1\47\31\46\1\50\uffc2\46",
        "\74\34\1\uffff\uffc2\34",
        "",
        "\47\51\1\52\24\51\1\53\uffc2\51",
        "\74\34\1\uffff\uffc2\34",
        "",
        "\1\111",
        "\1\112",
        "\1\uffff",
        "\1\uffff",
        "\74\34\1\uffff\4\34\32\115\6\34\32\115\uff84\34",
        "\1\uffff",
        "\60\34\12\62\2\34\1\uffff\uffc2\34",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\74\34\1\uffff\uffc2\34",
        "\1\uffff",
        "\74\34\1\uffff\uffc2\34",
        "\1\uffff",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "",
        "",
        "",
        "",
        "",
        "\1\uffff",
        "\74\34\1\uffff\uffc2\34",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\133",
        "\1\134",
        "",
        "",
        "\74\34\1\uffff\4\34\32\115\6\34\32\115\uff84\34",
        "\1\uffff",
        "",
        "\1\uffff",
        "",
        "",
        "",
        "",
        "",
        "",
        "\1\uffff",
        "",
        "\1\uffff",
        "",
        "\74\34\1\uffff\uffc2\34",
        "\74\34\1\uffff\uffc2\34",
        "",
        "",
        "",
        "\1\uffff",
        "\1\uffff",
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
            return "1:1: Tokens : ( T31 | T32 | T33 | T34 | T35 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | PAREN_OPEN | PAREN_CLOSE | SCALAR | INTEGER | NUMBER | MINUS | PLUS | MUL_OP | BITWISE_OP | ASSIGN_OP | REL_OP | IF | ELSE );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 64;}

                        else if ( ( !codeMode ) ) {s = 28;}

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        int LA12_42 = input.LA(1);
                        s = -1;
                        if ( ((LA12_42>='\u0000' && LA12_42<=';')||(LA12_42>='=' && LA12_42<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 72;

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 88;}

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 99;}

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        int LA12_15 = input.LA(1);
                        s = -1;
                        if ( ((LA12_15>='0' && LA12_15<='9')) && ((  codeMode || !codeMode ))) {s = 15;}

                        else if ( (LA12_15=='.') && ((  codeMode || !codeMode ))) {s = 16;}

                        else if ( ((LA12_15>='\u0000' && LA12_15<='-')||LA12_15=='/'||(LA12_15>=':' && LA12_15<=';')||(LA12_15>='=' && LA12_15<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 49;

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        int LA12_39 = input.LA(1);
                        s = -1;
                        if ( ((LA12_39>='\u0000' && LA12_39<=';')||(LA12_39>='=' && LA12_39<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 71;

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        int LA12_10 = input.LA(1);
                        s = -1;
                        if ( ((LA12_10>='\u0000' && LA12_10<='&')||(LA12_10>='(' && LA12_10<=';')||(LA12_10>='=' && LA12_10<='\uFFFE')) && ((  codeMode || !codeMode ))) {s = 41;}

                        else if ( (LA12_10=='\'') && ((  codeMode || !codeMode ))) {s = 42;}

                        else if ( (LA12_10=='<') && (  codeMode )) {s = 43;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 63;}

                        else if ( ( !codeMode ) ) {s = 28;}

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 75;}

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        int LA12_13 = input.LA(1);
                        s = -1;
                        if ( ((LA12_13>='\u0000' && LA12_13<=';')||(LA12_13>='=' && LA12_13<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 47;

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        int LA12_34 = input.LA(1);
                        s = -1;
                        if ( (LA12_34=='\n') && ((  codeMode || !codeMode ))) {s = 69;}

                        else if ( ((LA12_34>='\u0000' && LA12_34<='\t')||(LA12_34>='\u000B' && LA12_34<=';')||(LA12_34>='=' && LA12_34<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 68;

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA12_14 = input.LA(1);
                        s = -1;
                        if ( ((LA12_14>='A' && LA12_14<='Z')||(LA12_14>='a' && LA12_14<='z')) && ((  codeMode || !codeMode ))) {s = 48;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        int LA12_50 = input.LA(1);
                        s = -1;
                        if ( ((LA12_50>='0' && LA12_50<='9')) && ((  codeMode || !codeMode ))) {s = 50;}

                        else if ( ((LA12_50>='\u0000' && LA12_50<='/')||(LA12_50>=':' && LA12_50<=';')||(LA12_50>='=' && LA12_50<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 80;

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        int LA12_5 = input.LA(1);
                        s = -1;
                        if ( ((LA12_5>='\u0000' && LA12_5<=';')||(LA12_5>='=' && LA12_5<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 33;

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        int LA12_73 = input.LA(1);
                        s = -1;
                        if ( (LA12_73=='e') && ((  codeMode || !codeMode ))) {s = 91;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 43;}

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 40;}

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 95;}

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        int LA12_6 = input.LA(1);
                        s = -1;
                        if ( (LA12_6=='>') && ((  codeMode || !codeMode ))) {s = 34;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 70;}

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        int LA12_69 = input.LA(1);
                        s = -1;
                        if ( ((LA12_69>='\u0000' && LA12_69<=';')||(LA12_69>='=' && LA12_69<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 68;

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 98;}

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        int LA12_57 = input.LA(1);
                        s = -1;
                        if ( ((LA12_57>='\u0000' && LA12_57<=';')||(LA12_57>='=' && LA12_57<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 87;

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        int LA12_91 = input.LA(1);
                        s = -1;
                        if ( ((LA12_91>='\u0000' && LA12_91<=';')||(LA12_91>='=' && LA12_91<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 96;

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        int LA12_45 = input.LA(1);
                        s = -1;
                        if ( (LA12_45=='h') && ((  codeMode || !codeMode ))) {s = 74;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        int LA12_21 = input.LA(1);
                        s = -1;
                        if ( ((LA12_21>='\u0000' && LA12_21<=';')||(LA12_21>='=' && LA12_21<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 54;

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        int LA12_44 = input.LA(1);
                        s = -1;
                        if ( (LA12_44=='s') && ((  codeMode || !codeMode ))) {s = 73;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        int LA12_24 = input.LA(1);
                        s = -1;
                        if ( (LA12_24=='=') && ((  codeMode || !codeMode ))) {s = 57;}

                        else if ( ((LA12_24>='\u0000' && LA12_24<=';')||(LA12_24>='>' && LA12_24<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 58;

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        int LA12_18 = input.LA(1);
                        s = -1;
                        if ( ((LA12_18>='\u0000' && LA12_18<=';')||(LA12_18>='=' && LA12_18<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 52;

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        int LA12_48 = input.LA(1);
                        s = -1;
                        if ( ((LA12_48>='A' && LA12_48<='Z')||(LA12_48>='a' && LA12_48<='z')) && ((  codeMode || !codeMode ))) {s = 77;}

                        else if ( ((LA12_48>='\u0000' && LA12_48<=';')||(LA12_48>='=' && LA12_48<='@')||(LA12_48>='[' && LA12_48<='`')||(LA12_48>='{' && LA12_48<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 78;

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        int LA12_74 = input.LA(1);
                        s = -1;
                        if ( (LA12_74=='o') && ((  codeMode || !codeMode ))) {s = 92;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 65;}

                        else if ( ( !codeMode ) ) {s = 28;}

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 66;}

                        else if ( ( !codeMode ) ) {s = 28;}

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 67;}

                        else if ( ( !codeMode ) ) {s = 28;}

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        int LA12_9 = input.LA(1);
                        s = -1;
                        if ( ((LA12_9>='\u0000' && LA12_9<='!')||(LA12_9>='#' && LA12_9<=';')||(LA12_9>='=' && LA12_9<='\uFFFE')) && ((  codeMode || !codeMode ))) {s = 38;}

                        else if ( (LA12_9=='\"') && ((  codeMode || !codeMode ))) {s = 39;}

                        else if ( (LA12_9=='<') && (  codeMode )) {s = 40;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        int LA12_3 = input.LA(1);
                        s = -1;
                        if ( ((LA12_3>='\u0000' && LA12_3<=';')||(LA12_3>='=' && LA12_3<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 31;

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        int LA12_27 = input.LA(1);
                        s = -1;
                        if ( (LA12_27=='f') && ((  codeMode || !codeMode ))) {s = 62;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 94;}

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        int LA12_20 = input.LA(1);
                        s = -1;
                        if ( ((LA12_20>='\u0000' && LA12_20<=';')||(LA12_20>='=' && LA12_20<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 54;

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        int LA12_23 = input.LA(1);
                        s = -1;
                        if ( ((LA12_23>='\u0000' && LA12_23<=';')||(LA12_23>='=' && LA12_23<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 56;

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        int LA12_16 = input.LA(1);
                        s = -1;
                        if ( ((LA12_16>='0' && LA12_16<='9')) && ((  codeMode || !codeMode ))) {s = 50;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        int LA12_2 = input.LA(1);
                        s = -1;
                        if ( ((LA12_2>='\u0000' && LA12_2<=';')||(LA12_2>='=' && LA12_2<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        int LA12_62 = input.LA(1);
                        s = -1;
                        if ( ((LA12_62>='\u0000' && LA12_62<=';')||(LA12_62>='=' && LA12_62<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 89;

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        int LA12_11 = input.LA(1);
                        s = -1;
                        if ( (LA12_11=='l') && ((  codeMode || !codeMode ))) {s = 44;}

                        else if ( (LA12_11=='c') && ((  codeMode || !codeMode ))) {s = 45;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 79;}

                        if ( s>=0 ) return s;
                        break;
                    case 45 : 
                        int LA12_77 = input.LA(1);
                        s = -1;
                        if ( ((LA12_77>='A' && LA12_77<='Z')||(LA12_77>='a' && LA12_77<='z')) && ((  codeMode || !codeMode ))) {s = 77;}

                        else if ( ((LA12_77>='\u0000' && LA12_77<=';')||(LA12_77>='=' && LA12_77<='@')||(LA12_77>='[' && LA12_77<='`')||(LA12_77>='{' && LA12_77<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 78;

                        if ( s>=0 ) return s;
                        break;
                    case 46 : 
                        int LA12_61 = input.LA(1);
                        s = -1;
                        if ( ((LA12_61>='\u0000' && LA12_61<=';')||(LA12_61>='=' && LA12_61<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 60;

                        if ( s>=0 ) return s;
                        break;
                    case 47 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 90;}

                        if ( s>=0 ) return s;
                        break;
                    case 48 : 
                        int LA12_38 = input.LA(1);
                        s = -1;
                        if ( (LA12_38=='\"') && ((  codeMode || !codeMode ))) {s = 39;}

                        else if ( ((LA12_38>='\u0000' && LA12_38<='!')||(LA12_38>='#' && LA12_38<=';')||(LA12_38>='=' && LA12_38<='\uFFFE')) && ((  codeMode || !codeMode ))) {s = 38;}

                        else if ( (LA12_38=='<') && (  codeMode )) {s = 40;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 49 : 
                        int LA12_41 = input.LA(1);
                        s = -1;
                        if ( (LA12_41=='\'') && ((  codeMode || !codeMode ))) {s = 42;}

                        else if ( ((LA12_41>='\u0000' && LA12_41<='&')||(LA12_41>='(' && LA12_41<=';')||(LA12_41>='=' && LA12_41<='\uFFFE')) && ((  codeMode || !codeMode ))) {s = 41;}

                        else if ( (LA12_41=='<') && (  codeMode )) {s = 43;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 50 : 
                        int LA12_19 = input.LA(1);
                        s = -1;
                        if ( ((LA12_19>='\u0000' && LA12_19<=';')||(LA12_19>='=' && LA12_19<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 53;

                        if ( s>=0 ) return s;
                        break;
                    case 51 : 
                        int LA12_92 = input.LA(1);
                        s = -1;
                        if ( ((LA12_92>='\u0000' && LA12_92<=';')||(LA12_92>='=' && LA12_92<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 97;

                        if ( s>=0 ) return s;
                        break;
                    case 52 : 
                        int LA12_12 = input.LA(1);
                        s = -1;
                        if ( ((LA12_12>='\u0000' && LA12_12<=';')||(LA12_12>='=' && LA12_12<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 46;

                        if ( s>=0 ) return s;
                        break;
                    case 53 : 
                        int LA12_25 = input.LA(1);
                        s = -1;
                        if ( (LA12_25=='=') ) {s = 59;}

                        else if ( ((LA12_25>='\u0000' && LA12_25<=';')||(LA12_25>='>' && LA12_25<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 60;

                        if ( s>=0 ) return s;
                        break;
                    case 54 : 
                        int LA12_8 = input.LA(1);
                        s = -1;
                        if ( ((LA12_8>='\t' && LA12_8<='\n')||LA12_8=='\r'||LA12_8==' ') && ((  codeMode || !codeMode ))) {s = 8;}

                        else if ( ((LA12_8>='\u0000' && LA12_8<='\b')||(LA12_8>='\u000B' && LA12_8<='\f')||(LA12_8>='\u000E' && LA12_8<='\u001F')||(LA12_8>='!' && LA12_8<=';')||(LA12_8>='=' && LA12_8<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 37;

                        if ( s>=0 ) return s;
                        break;
                    case 55 : 
                        int LA12_4 = input.LA(1);
                        s = -1;
                        if ( ((LA12_4>='\u0000' && LA12_4<=';')||(LA12_4>='=' && LA12_4<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 32;

                        if ( s>=0 ) return s;
                        break;
                    case 56 : 
                        int LA12_17 = input.LA(1);
                        s = -1;
                        if ( ((LA12_17>='\u0000' && LA12_17<=';')||(LA12_17>='=' && LA12_17<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 51;

                        if ( s>=0 ) return s;
                        break;
                    case 57 : 
                        int LA12_22 = input.LA(1);
                        s = -1;
                        if ( ((LA12_22>='\u0000' && LA12_22<=';')||(LA12_22>='=' && LA12_22<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 55;

                        if ( s>=0 ) return s;
                        break;
                    case 58 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 93;}

                        if ( s>=0 ) return s;
                        break;
                    case 59 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 76;}

                        if ( s>=0 ) return s;
                        break;
                    case 60 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 85;}

                        if ( s>=0 ) return s;
                        break;
                    case 61 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (true) ) {s = 86;}

                        if ( s>=0 ) return s;
                        break;
                    case 62 : 
                        int LA12_1 = input.LA(1);
                        s = -1;
                        if ( ((LA12_1>='\u0000' && LA12_1<=';')||(LA12_1>='=' && LA12_1<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 29;

                        if ( s>=0 ) return s;
                        break;
                    case 63 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (true) ) {s = 35;}

                        if ( s>=0 ) return s;
                        break;
                    case 64 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 35;}

                        if ( s>=0 ) return s;
                        break;
                    case 65 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 81;}

                        if ( s>=0 ) return s;
                        break;
                    case 66 : 
                        int LA12_26 = input.LA(1);
                        s = -1;
                        if ( (LA12_26=='=') ) {s = 61;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 67 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 82;}

                        if ( s>=0 ) return s;
                        break;
                    case 68 : 
                        int LA12_0 = input.LA(1);
                        s = -1;
                        if ( (LA12_0==';') ) {s = 1;}

                        else if ( (LA12_0=='{') ) {s = 2;}

                        else if ( (LA12_0=='}') ) {s = 3;}

                        else if ( (LA12_0=='[') ) {s = 4;}

                        else if ( (LA12_0==']') ) {s = 5;}

                        else if ( (LA12_0=='?') && ((  codeMode || !codeMode ))) {s = 6;}

                        else if ( (LA12_0=='<') ) {s = 7;}

                        else if ( ((LA12_0>='\t' && LA12_0<='\n')||LA12_0=='\r'||LA12_0==' ') && ((  codeMode || !codeMode ))) {s = 8;}

                        else if ( (LA12_0=='\"') && ((  codeMode || !codeMode ))) {s = 9;}

                        else if ( (LA12_0=='\'') && ((  codeMode || !codeMode ))) {s = 10;}

                        else if ( (LA12_0=='e') && ((  codeMode || !codeMode ))) {s = 11;}

                        else if ( (LA12_0=='(') && ((  codeMode || !codeMode ))) {s = 12;}

                        else if ( (LA12_0==')') && ((  codeMode || !codeMode ))) {s = 13;}

                        else if ( (LA12_0=='$') && ((  codeMode || !codeMode ))) {s = 14;}

                        else if ( ((LA12_0>='0' && LA12_0<='9')) && ((  codeMode || !codeMode ))) {s = 15;}

                        else if ( (LA12_0=='.') && ((  codeMode || !codeMode ))) {s = 16;}

                        else if ( (LA12_0=='-') && ((  codeMode || !codeMode ))) {s = 17;}

                        else if ( (LA12_0=='+') && ((  codeMode || !codeMode ))) {s = 18;}

                        else if ( (LA12_0=='*') && ((  codeMode || !codeMode ))) {s = 19;}

                        else if ( (LA12_0=='/') ) {s = 20;}

                        else if ( (LA12_0=='%') ) {s = 21;}

                        else if ( (LA12_0=='|') && ((  codeMode || !codeMode ))) {s = 22;}

                        else if ( (LA12_0=='&') ) {s = 23;}

                        else if ( (LA12_0=='=') && ((  codeMode || !codeMode ))) {s = 24;}

                        else if ( (LA12_0=='>') ) {s = 25;}

                        else if ( (LA12_0=='!') ) {s = 26;}

                        else if ( (LA12_0=='i') && ((  codeMode || !codeMode ))) {s = 27;}

                        else if ( ((LA12_0>='\u0000' && LA12_0<='\b')||(LA12_0>='\u000B' && LA12_0<='\f')||(LA12_0>='\u000E' && LA12_0<='\u001F')||LA12_0=='#'||LA12_0==','||LA12_0==':'||(LA12_0>='@' && LA12_0<='Z')||LA12_0=='\\'||(LA12_0>='^' && LA12_0<='d')||(LA12_0>='f' && LA12_0<='h')||(LA12_0>='j' && LA12_0<='z')||(LA12_0>='~' && LA12_0<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        if ( s>=0 ) return s;
                        break;
                    case 69 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (  codeMode ) ) {s = 83;}

                        if ( s>=0 ) return s;
                        break;
                    case 70 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 28;}

                        else if ( (true) ) {s = 84;}

                        if ( s>=0 ) return s;
                        break;
                    case 71 : 
                        int LA12_59 = input.LA(1);
                        s = -1;
                        if ( ((LA12_59>='\u0000' && LA12_59<=';')||(LA12_59>='=' && LA12_59<='\uFFFE')) && ( !codeMode )) {s = 28;}

                        else s = 60;

                        if ( s>=0 ) return s;
                        break;
            }
            NoViableAltException nvae =
                new NoViableAltException(getDescription(), 12, _s, input);
            error(nvae);
            throw nvae;
        }
    }
 

}