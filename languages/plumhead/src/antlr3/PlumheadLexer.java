// $ANTLR 3.0b6 src/antlr3/Plumhead.g 2007-04-16 20:51:54

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int CODE_START=12;
    public static final int MINUS=26;
    public static final int VAR_NAME=22;
    public static final int DIGITS=23;
    public static final int IDENT=21;
    public static final int ARRAY=8;
    public static final int BITWISE_OP=29;
    public static final int T36=36;
    public static final int NUMBER=25;
    public static final int WS=14;
    public static final int SINGLEQUOTE_STRING=16;
    public static final int T35=35;
    public static final int MUL_OP=28;
    public static final int SEA=11;
    public static final int T34=34;
    public static final int CODE_END=13;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int PAREN_OPEN=19;
    public static final int PREFIX=10;
    public static final int INTEGER=24;
    public static final int ASSIGN_OP=30;
    public static final int DOUBLEQUOTE_STRING=15;
    public static final int PAREN_CLOSE=20;
    public static final int T37=37;
    public static final int ECHO=17;
    public static final int FUNCTION=9;
    public static final int ELSE=33;
    public static final int IF=32;
    public static final int EOF=-1;
    public static final int Tokens=39;
    public static final int VAR_DUMP=18;
    public static final int REL_OP=31;
    public static final int PLUS=27;
    public static final int T38=38;
    public static final int NOQUOTE_STRING=5;
    public static final int SCALAR=7;

      public static boolean codeMode = false;

    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T34
    public void mT34() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T34;
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
    // $ANTLR end T35

    // $ANTLR start T36
    public void mT36() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T36;
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
    // $ANTLR end T36

    // $ANTLR start T37
    public void mT37() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T37;
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
    // $ANTLR end T37

    // $ANTLR start T38
    public void mT38() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T38;
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
    // $ANTLR end T38

    // $ANTLR start SEA
    public void mSEA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SEA;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:34:23: ({...}? => (~ '<' )+ )
            // src/antlr3/Plumhead.g:34:23: {...}? => (~ '<' )+
            {
            if ( !( !codeMode ) ) {
                throw new FailedPredicateException(input, "SEA", " !codeMode ");
            }
            // src/antlr3/Plumhead.g:34:41: (~ '<' )+
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
            	    // src/antlr3/Plumhead.g:34:42: ~ '<'
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
            // src/antlr3/Plumhead.g:35:41: ( '<?php' )
            // src/antlr3/Plumhead.g:35:41: '<?php'
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
            // src/antlr3/Plumhead.g:36:23: ({...}? => '?>' ( '\\n' )? )
            // src/antlr3/Plumhead.g:36:23: {...}? => '?>' ( '\\n' )?
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "CODE_END", "  codeMode ");
            }
            match("?>"); 

            // src/antlr3/Plumhead.g:36:46: ( '\\n' )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0=='\n') ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:36:46: '\\n'
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
            // src/antlr3/Plumhead.g:37:23: ({...}? => ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // src/antlr3/Plumhead.g:37:23: {...}? => ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "WS", "  codeMode ");
            }
            // src/antlr3/Plumhead.g:37:41: ( (' '|'\\t'|'\\r'|'\\n'))+
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
            	    // src/antlr3/Plumhead.g:37:43: (' '|'\\t'|'\\r'|'\\n')
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
            // src/antlr3/Plumhead.g:38:23: ({...}? => '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:38:23: {...}? => '\\\"' (~ '\\\"' )* '\\\"'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "DOUBLEQUOTE_STRING", "  codeMode ");
            }
            match('\"'); 
            // src/antlr3/Plumhead.g:38:46: (~ '\\\"' )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='\u0000' && LA4_0<='!')||(LA4_0>='#' && LA4_0<='\uFFFE')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:38:48: ~ '\\\"'
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
            // src/antlr3/Plumhead.g:39:23: ({...}? => '\\'' (~ '\\'' )* '\\'' )
            // src/antlr3/Plumhead.g:39:23: {...}? => '\\'' (~ '\\'' )* '\\''
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "SINGLEQUOTE_STRING", "  codeMode ");
            }
            match('\''); 
            // src/antlr3/Plumhead.g:39:46: (~ '\\'' )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>='\u0000' && LA5_0<='&')||(LA5_0>='(' && LA5_0<='\uFFFE')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:39:48: ~ '\\''
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
            // src/antlr3/Plumhead.g:40:23: ({...}? => 'echo' )
            // src/antlr3/Plumhead.g:40:23: {...}? => 'echo'
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

    // $ANTLR start VAR_DUMP
    public void mVAR_DUMP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = VAR_DUMP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:41:23: ({...}? => 'var_dump' )
            // src/antlr3/Plumhead.g:41:23: {...}? => 'var_dump'
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "VAR_DUMP", "  codeMode ");
            }
            match("var_dump"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end VAR_DUMP

    // $ANTLR start PAREN_OPEN
    public void mPAREN_OPEN() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = PAREN_OPEN;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:42:23: ({...}? => '(' )
            // src/antlr3/Plumhead.g:42:23: {...}? => '('
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
            // src/antlr3/Plumhead.g:43:23: ({...}? => ')' )
            // src/antlr3/Plumhead.g:43:23: {...}? => ')'
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
            // src/antlr3/Plumhead.g:45:23: ({...}? => ('a'..'z'|'A'..'Z'|'_') ( ('a'..'z'|'A'..'Z'|'_'|'0'..'9'))* )
            // src/antlr3/Plumhead.g:45:23: {...}? => ('a'..'z'|'A'..'Z'|'_') ( ('a'..'z'|'A'..'Z'|'_'|'0'..'9'))*
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "IDENT", "  codeMode ");
            }
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }

            // src/antlr3/Plumhead.g:45:70: ( ('a'..'z'|'A'..'Z'|'_'|'0'..'9'))*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( ((LA6_0>='0' && LA6_0<='9')||(LA6_0>='A' && LA6_0<='Z')||LA6_0=='_'||(LA6_0>='a' && LA6_0<='z')) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:45:72: ('a'..'z'|'A'..'Z'|'_'|'0'..'9')
            	    {
            	    if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z')||input.LA(1)=='_'||(input.LA(1)>='a' && input.LA(1)<='z') ) {
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

    // $ANTLR start VAR_NAME
    public void mVAR_NAME() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = VAR_NAME;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:46:23: ({...}? => '$' IDENT )
            // src/antlr3/Plumhead.g:46:23: {...}? => '$' IDENT
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "VAR_NAME", "  codeMode ");
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
    // $ANTLR end VAR_NAME

    // $ANTLR start DIGITS
    public void mDIGITS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // src/antlr3/Plumhead.g:48:23: ({...}? => ( '0' .. '9' )+ )
            // src/antlr3/Plumhead.g:48:23: {...}? => ( '0' .. '9' )+
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "DIGITS", "  codeMode ");
            }
            // src/antlr3/Plumhead.g:48:41: ( '0' .. '9' )+
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
            	    // src/antlr3/Plumhead.g:48:43: '0' .. '9'
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
            // src/antlr3/Plumhead.g:49:23: ({...}? => DIGITS )
            // src/antlr3/Plumhead.g:49:23: {...}? => DIGITS
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
            // src/antlr3/Plumhead.g:50:23: ({...}? => ( DIGITS )? '.' DIGITS )
            // src/antlr3/Plumhead.g:50:23: {...}? => ( DIGITS )? '.' DIGITS
            {
            if ( !(  codeMode ) ) {
                throw new FailedPredicateException(input, "NUMBER", "  codeMode ");
            }
            // src/antlr3/Plumhead.g:50:41: ( DIGITS )?
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( ((LA8_0>='0' && LA8_0<='9')) && (  codeMode )) {
                alt8=1;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:50:41: DIGITS
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
            // src/antlr3/Plumhead.g:52:23: ({...}? => '-' )
            // src/antlr3/Plumhead.g:52:23: {...}? => '-'
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
            // src/antlr3/Plumhead.g:53:23: ({...}? => '+' )
            // src/antlr3/Plumhead.g:53:23: {...}? => '+'
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
            // src/antlr3/Plumhead.g:54:23: ({...}? => '*' | '/' | '%' )
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
                    new NoViableAltException("54:1: MUL_OP : ({...}? => '*' | '/' | '%' );", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:54:23: {...}? => '*'
                    {
                    if ( !(  codeMode ) ) {
                        throw new FailedPredicateException(input, "MUL_OP", "  codeMode ");
                    }
                    match('*'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:54:48: '/'
                    {
                    match('/'); 

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:54:55: '%'
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
            // src/antlr3/Plumhead.g:55:23: ({...}? => '|' | '&' | '^' )
            int alt10=3;
            int LA10_0 = input.LA(1);
            if ( (LA10_0=='|') && (  codeMode )) {
                alt10=1;
            }
            else if ( (LA10_0=='&') ) {
                alt10=2;
            }
            else if ( (LA10_0=='^') ) {
                alt10=3;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("55:1: BITWISE_OP : ({...}? => '|' | '&' | '^' );", 10, 0, input);

                throw nvae;
            }
            switch (alt10) {
                case 1 :
                    // src/antlr3/Plumhead.g:55:23: {...}? => '|'
                    {
                    if ( !(  codeMode ) ) {
                        throw new FailedPredicateException(input, "BITWISE_OP", "  codeMode ");
                    }
                    match('|'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:55:48: '&'
                    {
                    match('&'); 

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:55:54: '^'
                    {
                    match('^'); 

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
            // src/antlr3/Plumhead.g:56:23: ({...}? => '=' )
            // src/antlr3/Plumhead.g:56:23: {...}? => '='
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
            // src/antlr3/Plumhead.g:57:23: ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' )
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
                    new NoViableAltException("57:1: REL_OP : ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' );", 11, 0, input);

                throw nvae;
            }
            switch (alt11) {
                case 1 :
                    // src/antlr3/Plumhead.g:57:23: {...}? => '=='
                    {
                    if ( !(  codeMode ) ) {
                        throw new FailedPredicateException(input, "REL_OP", "  codeMode ");
                    }
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:57:48: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:57:55: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:57:62: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:57:69: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:57:76: '>'
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
            // src/antlr3/Plumhead.g:59:23: ({...}? => 'if' )
            // src/antlr3/Plumhead.g:59:23: {...}? => 'if'
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
            // src/antlr3/Plumhead.g:60:23: ({...}? => 'else' )
            // src/antlr3/Plumhead.g:60:23: {...}? => 'else'
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
        // src/antlr3/Plumhead.g:1:10: ( T34 | T35 | T36 | T37 | T38 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | VAR_DUMP | PAREN_OPEN | PAREN_CLOSE | VAR_NAME | INTEGER | NUMBER | MINUS | PLUS | MUL_OP | BITWISE_OP | ASSIGN_OP | REL_OP | IF | ELSE )
        int alt12=26;
        alt12 = dfa12.predict(input);
        switch (alt12) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T34
                {
                mT34(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T35
                {
                mT35(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T36
                {
                mT36(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: T37
                {
                mT37(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: T38
                {
                mT38(); 

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
                // src/antlr3/Plumhead.g:1:100: VAR_DUMP
                {
                mVAR_DUMP(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:109: PAREN_OPEN
                {
                mPAREN_OPEN(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:120: PAREN_CLOSE
                {
                mPAREN_CLOSE(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:132: VAR_NAME
                {
                mVAR_NAME(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:141: INTEGER
                {
                mINTEGER(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:149: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 19 :
                // src/antlr3/Plumhead.g:1:156: MINUS
                {
                mMINUS(); 

                }
                break;
            case 20 :
                // src/antlr3/Plumhead.g:1:162: PLUS
                {
                mPLUS(); 

                }
                break;
            case 21 :
                // src/antlr3/Plumhead.g:1:167: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 22 :
                // src/antlr3/Plumhead.g:1:174: BITWISE_OP
                {
                mBITWISE_OP(); 

                }
                break;
            case 23 :
                // src/antlr3/Plumhead.g:1:185: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 24 :
                // src/antlr3/Plumhead.g:1:195: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 25 :
                // src/antlr3/Plumhead.g:1:202: IF
                {
                mIF(); 

                }
                break;
            case 26 :
                // src/antlr3/Plumhead.g:1:205: ELSE
                {
                mELSE(); 

                }
                break;

        }

    }


    protected DFA12 dfa12 = new DFA12(this);
    public static final String DFA12_eotS =
        "\1\uffff\1\37\1\40\1\41\1\42\1\43\1\36\1\46\1\47\4\36\1\61\1\62"+
        "\1\36\1\64\1\36\1\66\1\67\1\70\2\71\1\72\2\73\1\75\1\77\2\36\6\uffff"+
        "\1\110\3\uffff\1\36\1\112\1\uffff\1\36\1\113\1\uffff\3\36\2\uffff"+
        "\1\122\1\uffff\1\124\6\uffff\1\133\1\uffff\1\77\1\uffff\1\77\1\135"+
        "\5\uffff\1\110\4\uffff\3\36\2\uffff\1\122\15\uffff\1\145\1\146\1"+
        "\36\5\uffff\1\36\2\uffff\2\36\1\155\2\uffff";
    public static final String DFA12_eofS =
        "\157\uffff";
    public static final String DFA12_minS =
        "\6\0\1\76\1\77\3\0\1\143\1\141\2\0\1\101\1\0\1\60\12\0\1\75\1\146"+
        "\1\uffff\6\0\2\uffff\3\0\1\uffff\2\0\1\uffff\1\150\1\163\1\162\21"+
        "\0\5\uffff\2\0\1\uffff\2\0\1\157\1\145\1\137\2\uffff\2\0\1\uffff"+
        "\1\0\6\uffff\1\0\1\uffff\1\0\1\uffff\2\0\1\144\3\uffff\2\0\1\165"+
        "\2\uffff\1\155\1\160\2\0\1\uffff";
    public static final String DFA12_maxS =
        "\6\ufffe\1\76\1\77\3\ufffe\1\154\1\141\2\ufffe\1\172\1\ufffe\1\71"+
        "\12\ufffe\1\75\1\146\1\uffff\5\0\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff"+
        "\2\ufffe\1\uffff\1\150\1\163\1\162\2\0\1\ufffe\1\0\1\ufffe\6\0\1"+
        "\ufffe\1\0\1\ufffe\1\0\2\ufffe\5\uffff\1\ufffe\1\0\1\uffff\2\0\1"+
        "\157\1\145\1\137\2\uffff\1\ufffe\1\0\1\uffff\1\0\6\uffff\1\0\1\uffff"+
        "\1\0\1\uffff\2\ufffe\1\144\3\uffff\2\0\1\165\2\uffff\1\155\1\160"+
        "\1\ufffe\1\0\1\uffff";
    public static final String DFA12_acceptS =
        "\36\uffff\1\6\6\uffff\1\7\1\30\3\uffff\1\12\2\uffff\1\13\24\uffff"+
        "\1\1\1\2\1\3\1\4\1\5\2\uffff\1\11\5\uffff\1\16\1\17\2\uffff\1\21"+
        "\1\uffff\1\23\1\24\2\25\2\26\1\uffff\1\27\1\uffff\1\10\3\uffff\1"+
        "\20\1\22\1\31\3\uffff\1\14\1\32\4\uffff\1\15";
    public static final String DFA12_specialS =
        "\1\41\1\47\1\23\1\15\1\52\1\101\1\106\1\uffff\1\111\1\110\1\37\1"+
        "\33\1\75\1\55\1\24\1\67\1\74\1\60\1\13\1\64\1\102\1\61\1\14\1\120"+
        "\1\40\1\31\1\104\1\34\1\11\1\45\1\uffff\1\117\1\77\1\100\1\16\1"+
        "\27\1\112\2\uffff\1\20\1\114\1\26\1\uffff\1\54\1\71\1\uffff\1\103"+
        "\1\105\1\65\1\32\1\35\1\44\1\72\1\53\1\46\1\115\1\62\1\63\1\56\1"+
        "\57\1\76\1\70\1\121\1\50\1\66\1\107\5\uffff\1\30\1\12\1\uffff\1"+
        "\7\1\3\1\113\1\17\1\2\2\uffff\1\42\1\25\1\uffff\1\73\6\uffff\1\51"+
        "\1\uffff\1\36\1\uffff\1\21\1\116\1\5\3\uffff\1\0\1\43\1\10\2\uffff"+
        "\1\1\1\6\1\4\1\22\1\uffff}>";
    public static final String[] DFA12_transition = {
        "\11\36\2\10\2\36\1\10\22\36\1\10\1\34\1\11\1\36\1\17\1\26\1\30\1"+
        "\12\1\15\1\16\1\24\1\23\1\36\1\22\1\21\1\25\12\20\1\36\1\1\1\7\1"+
        "\32\1\33\1\6\33\36\1\4\1\36\1\5\1\31\6\36\1\13\3\36\1\35\14\36\1"+
        "\14\4\36\1\2\1\27\1\3\uff81\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\1\44",
        "\1\45",
        "\11\36\2\10\2\36\1\10\22\36\1\10\33\36\1\uffff\uffc2\36",
        "\42\50\1\51\31\50\1\52\uffc2\50",
        "\47\53\1\54\24\53\1\55\uffc2\53",
        "\1\56\10\uffff\1\57",
        "\1\60",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\32\63\4\uffff\1\63\1\uffff\32\63",
        "\56\36\1\21\1\36\12\20\2\36\1\uffff\uffc2\36",
        "\12\65",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\1\74\uffc1\36",
        "\74\36\1\uffff\1\76\uffc1\36",
        "\1\100",
        "\1\101",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\12\36\1\107\61\36\1\uffff\uffc2\36",
        "",
        "",
        "\1\uffff",
        "\42\50\1\51\31\50\1\52\uffc2\50",
        "\74\36\1\uffff\uffc2\36",
        "",
        "\47\53\1\54\24\53\1\55\uffc2\53",
        "\74\36\1\uffff\uffc2\36",
        "",
        "\1\114",
        "\1\115",
        "\1\116",
        "\1\uffff",
        "\1\uffff",
        "\60\36\12\121\2\36\1\uffff\4\36\32\121\4\36\1\121\1\36\32\121\uff84"+
        "\36",
        "\1\uffff",
        "\60\36\12\65\2\36\1\uffff\uffc2\36",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\74\36\1\uffff\uffc2\36",
        "\1\uffff",
        "\74\36\1\uffff\uffc2\36",
        "\1\uffff",
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "",
        "",
        "",
        "",
        "",
        "\74\36\1\uffff\uffc2\36",
        "\1\uffff",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\137",
        "\1\140",
        "\1\141",
        "",
        "",
        "\60\36\12\121\2\36\1\uffff\4\36\32\121\4\36\1\121\1\36\32\121\uff84"+
        "\36",
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
        "\74\36\1\uffff\uffc2\36",
        "\74\36\1\uffff\uffc2\36",
        "\1\147",
        "",
        "",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\152",
        "",
        "",
        "\1\153",
        "\1\154",
        "\74\36\1\uffff\uffc2\36",
        "\1\uffff",
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
            return "1:1: Tokens : ( T34 | T35 | T36 | T37 | T38 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | VAR_DUMP | PAREN_OPEN | PAREN_CLOSE | VAR_NAME | INTEGER | NUMBER | MINUS | PLUS | MUL_OP | BITWISE_OP | ASSIGN_OP | REL_OP | IF | ELSE );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 104;}

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        int LA12_106 = input.LA(1);
                        s = -1;
                        if ( (LA12_106=='m') && ((  codeMode || !codeMode ))) {s = 107;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        int LA12_78 = input.LA(1);
                        s = -1;
                        if ( (LA12_78=='_') && ((  codeMode || !codeMode ))) {s = 97;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 45;}

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        int LA12_108 = input.LA(1);
                        s = -1;
                        if ( ((LA12_108>='\u0000' && LA12_108<=';')||(LA12_108>='=' && LA12_108<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 109;

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        int LA12_97 = input.LA(1);
                        s = -1;
                        if ( (LA12_97=='d') && ((  codeMode || !codeMode ))) {s = 103;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        int LA12_107 = input.LA(1);
                        s = -1;
                        if ( (LA12_107=='p') && ((  codeMode || !codeMode ))) {s = 108;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 42;}

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        int LA12_103 = input.LA(1);
                        s = -1;
                        if ( (LA12_103=='u') && ((  codeMode || !codeMode ))) {s = 106;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        int LA12_28 = input.LA(1);
                        s = -1;
                        if ( (LA12_28=='=') ) {s = 64;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 94;}

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA12_18 = input.LA(1);
                        s = -1;
                        if ( ((LA12_18>='\u0000' && LA12_18<=';')||(LA12_18>='=' && LA12_18<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 54;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        int LA12_22 = input.LA(1);
                        s = -1;
                        if ( ((LA12_22>='\u0000' && LA12_22<=';')||(LA12_22>='=' && LA12_22<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 57;

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        int LA12_3 = input.LA(1);
                        s = -1;
                        if ( ((LA12_3>='\u0000' && LA12_3<=';')||(LA12_3>='=' && LA12_3<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 33;

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 69;}

                        else if ( ( !codeMode ) ) {s = 30;}

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        int LA12_77 = input.LA(1);
                        s = -1;
                        if ( (LA12_77=='e') && ((  codeMode || !codeMode ))) {s = 96;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 73;}

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        int LA12_95 = input.LA(1);
                        s = -1;
                        if ( ((LA12_95>='\u0000' && LA12_95<=';')||(LA12_95>='=' && LA12_95<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 101;

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 110;}

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        int LA12_2 = input.LA(1);
                        s = -1;
                        if ( ((LA12_2>='\u0000' && LA12_2<=';')||(LA12_2>='=' && LA12_2<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 32;

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        int LA12_14 = input.LA(1);
                        s = -1;
                        if ( ((LA12_14>='\u0000' && LA12_14<=';')||(LA12_14>='=' && LA12_14<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 98;}

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        int LA12_41 = input.LA(1);
                        s = -1;
                        if ( ((LA12_41>='\u0000' && LA12_41<=';')||(LA12_41>='=' && LA12_41<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 74;

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 70;}

                        else if ( ( !codeMode ) ) {s = 30;}

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        int LA12_71 = input.LA(1);
                        s = -1;
                        if ( ((LA12_71>='\u0000' && LA12_71<=';')||(LA12_71>='=' && LA12_71<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 72;

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        int LA12_25 = input.LA(1);
                        s = -1;
                        if ( ((LA12_25>='\u0000' && LA12_25<=';')||(LA12_25>='=' && LA12_25<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 59;

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 79;}

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        int LA12_11 = input.LA(1);
                        s = -1;
                        if ( (LA12_11=='c') && ((  codeMode || !codeMode ))) {s = 46;}

                        else if ( (LA12_11=='l') && ((  codeMode || !codeMode ))) {s = 47;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        int LA12_27 = input.LA(1);
                        s = -1;
                        if ( (LA12_27=='=') ) {s = 62;}

                        else if ( ((LA12_27>='\u0000' && LA12_27<=';')||(LA12_27>='>' && LA12_27<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 63;

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 80;}

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 100;}

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        int LA12_10 = input.LA(1);
                        s = -1;
                        if ( ((LA12_10>='\u0000' && LA12_10<='&')||(LA12_10>='(' && LA12_10<=';')||(LA12_10>='=' && LA12_10<='\uFFFE')) && ((  codeMode || !codeMode ))) {s = 43;}

                        else if ( (LA12_10=='\'') && ((  codeMode || !codeMode ))) {s = 44;}

                        else if ( (LA12_10=='<') && (  codeMode )) {s = 45;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        int LA12_24 = input.LA(1);
                        s = -1;
                        if ( ((LA12_24>='\u0000' && LA12_24<=';')||(LA12_24>='=' && LA12_24<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 59;

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
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

                        else if ( (LA12_0=='v') && ((  codeMode || !codeMode ))) {s = 12;}

                        else if ( (LA12_0=='(') && ((  codeMode || !codeMode ))) {s = 13;}

                        else if ( (LA12_0==')') && ((  codeMode || !codeMode ))) {s = 14;}

                        else if ( (LA12_0=='$') && ((  codeMode || !codeMode ))) {s = 15;}

                        else if ( ((LA12_0>='0' && LA12_0<='9')) && ((  codeMode || !codeMode ))) {s = 16;}

                        else if ( (LA12_0=='.') && ((  codeMode || !codeMode ))) {s = 17;}

                        else if ( (LA12_0=='-') && ((  codeMode || !codeMode ))) {s = 18;}

                        else if ( (LA12_0=='+') && ((  codeMode || !codeMode ))) {s = 19;}

                        else if ( (LA12_0=='*') && ((  codeMode || !codeMode ))) {s = 20;}

                        else if ( (LA12_0=='/') ) {s = 21;}

                        else if ( (LA12_0=='%') ) {s = 22;}

                        else if ( (LA12_0=='|') && ((  codeMode || !codeMode ))) {s = 23;}

                        else if ( (LA12_0=='&') ) {s = 24;}

                        else if ( (LA12_0=='^') ) {s = 25;}

                        else if ( (LA12_0=='=') && ((  codeMode || !codeMode ))) {s = 26;}

                        else if ( (LA12_0=='>') ) {s = 27;}

                        else if ( (LA12_0=='!') ) {s = 28;}

                        else if ( (LA12_0=='i') && ((  codeMode || !codeMode ))) {s = 29;}

                        else if ( ((LA12_0>='\u0000' && LA12_0<='\b')||(LA12_0>='\u000B' && LA12_0<='\f')||(LA12_0>='\u000E' && LA12_0<='\u001F')||LA12_0=='#'||LA12_0==','||LA12_0==':'||(LA12_0>='@' && LA12_0<='Z')||LA12_0=='\\'||(LA12_0>='_' && LA12_0<='d')||(LA12_0>='f' && LA12_0<='h')||(LA12_0>='j' && LA12_0<='u')||(LA12_0>='w' && LA12_0<='z')||(LA12_0>='~' && LA12_0<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        int LA12_81 = input.LA(1);
                        s = -1;
                        if ( ((LA12_81>='0' && LA12_81<='9')||(LA12_81>='A' && LA12_81<='Z')||LA12_81=='_'||(LA12_81>='a' && LA12_81<='z')) && ((  codeMode || !codeMode ))) {s = 81;}

                        else if ( ((LA12_81>='\u0000' && LA12_81<='/')||(LA12_81>=':' && LA12_81<=';')||(LA12_81>='=' && LA12_81<='@')||(LA12_81>='[' && LA12_81<='^')||LA12_81=='`'||(LA12_81>='{' && LA12_81<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 82;

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 105;}

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        int LA12_51 = input.LA(1);
                        s = -1;
                        if ( ((LA12_51>='0' && LA12_51<='9')||(LA12_51>='A' && LA12_51<='Z')||LA12_51=='_'||(LA12_51>='a' && LA12_51<='z')) && ((  codeMode || !codeMode ))) {s = 81;}

                        else if ( ((LA12_51>='\u0000' && LA12_51<='/')||(LA12_51>=':' && LA12_51<=';')||(LA12_51>='=' && LA12_51<='@')||(LA12_51>='[' && LA12_51<='^')||LA12_51=='`'||(LA12_51>='{' && LA12_51<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 82;

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        int LA12_29 = input.LA(1);
                        s = -1;
                        if ( (LA12_29=='f') && ((  codeMode || !codeMode ))) {s = 65;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 85;}

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        int LA12_1 = input.LA(1);
                        s = -1;
                        if ( ((LA12_1>='\u0000' && LA12_1<=';')||(LA12_1>='=' && LA12_1<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 31;

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (true) ) {s = 38;}

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 38;}

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        int LA12_4 = input.LA(1);
                        s = -1;
                        if ( ((LA12_4>='\u0000' && LA12_4<=';')||(LA12_4>='=' && LA12_4<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 34;

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        int LA12_53 = input.LA(1);
                        s = -1;
                        if ( ((LA12_53>='0' && LA12_53<='9')) && ((  codeMode || !codeMode ))) {s = 53;}

                        else if ( ((LA12_53>='\u0000' && LA12_53<='/')||(LA12_53>=':' && LA12_53<=';')||(LA12_53>='=' && LA12_53<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 84;

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        int LA12_43 = input.LA(1);
                        s = -1;
                        if ( (LA12_43=='\'') && ((  codeMode || !codeMode ))) {s = 44;}

                        else if ( ((LA12_43>='\u0000' && LA12_43<='&')||(LA12_43>='(' && LA12_43<=';')||(LA12_43>='=' && LA12_43<='\uFFFE')) && ((  codeMode || !codeMode ))) {s = 43;}

                        else if ( (LA12_43=='<') && (  codeMode )) {s = 45;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 45 : 
                        int LA12_13 = input.LA(1);
                        s = -1;
                        if ( ((LA12_13>='\u0000' && LA12_13<=';')||(LA12_13>='=' && LA12_13<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 49;

                        if ( s>=0 ) return s;
                        break;
                    case 46 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 89;}

                        if ( s>=0 ) return s;
                        break;
                    case 47 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (true) ) {s = 90;}

                        if ( s>=0 ) return s;
                        break;
                    case 48 : 
                        int LA12_17 = input.LA(1);
                        s = -1;
                        if ( ((LA12_17>='0' && LA12_17<='9')) && ((  codeMode || !codeMode ))) {s = 53;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 49 : 
                        int LA12_21 = input.LA(1);
                        s = -1;
                        if ( ((LA12_21>='\u0000' && LA12_21<=';')||(LA12_21>='=' && LA12_21<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 57;

                        if ( s>=0 ) return s;
                        break;
                    case 50 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 87;}

                        if ( s>=0 ) return s;
                        break;
                    case 51 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (true) ) {s = 88;}

                        if ( s>=0 ) return s;
                        break;
                    case 52 : 
                        int LA12_19 = input.LA(1);
                        s = -1;
                        if ( ((LA12_19>='\u0000' && LA12_19<=';')||(LA12_19>='=' && LA12_19<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 55;

                        if ( s>=0 ) return s;
                        break;
                    case 53 : 
                        int LA12_48 = input.LA(1);
                        s = -1;
                        if ( (LA12_48=='r') && ((  codeMode || !codeMode ))) {s = 78;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 54 : 
                        int LA12_64 = input.LA(1);
                        s = -1;
                        if ( ((LA12_64>='\u0000' && LA12_64<=';')||(LA12_64>='=' && LA12_64<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 63;

                        if ( s>=0 ) return s;
                        break;
                    case 55 : 
                        int LA12_15 = input.LA(1);
                        s = -1;
                        if ( ((LA12_15>='A' && LA12_15<='Z')||LA12_15=='_'||(LA12_15>='a' && LA12_15<='z')) && ((  codeMode || !codeMode ))) {s = 51;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 56 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 92;}

                        if ( s>=0 ) return s;
                        break;
                    case 57 : 
                        int LA12_44 = input.LA(1);
                        s = -1;
                        if ( ((LA12_44>='\u0000' && LA12_44<=';')||(LA12_44>='=' && LA12_44<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 75;

                        if ( s>=0 ) return s;
                        break;
                    case 58 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 83;}

                        if ( s>=0 ) return s;
                        break;
                    case 59 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 99;}

                        if ( s>=0 ) return s;
                        break;
                    case 60 : 
                        int LA12_16 = input.LA(1);
                        s = -1;
                        if ( (LA12_16=='.') && ((  codeMode || !codeMode ))) {s = 17;}

                        else if ( ((LA12_16>='0' && LA12_16<='9')) && ((  codeMode || !codeMode ))) {s = 16;}

                        else if ( ((LA12_16>='\u0000' && LA12_16<='-')||LA12_16=='/'||(LA12_16>=':' && LA12_16<=';')||(LA12_16>='=' && LA12_16<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 52;

                        if ( s>=0 ) return s;
                        break;
                    case 61 : 
                        int LA12_12 = input.LA(1);
                        s = -1;
                        if ( (LA12_12=='a') && ((  codeMode || !codeMode ))) {s = 48;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 62 : 
                        int LA12_60 = input.LA(1);
                        s = -1;
                        if ( ((LA12_60>='\u0000' && LA12_60<=';')||(LA12_60>='=' && LA12_60<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 91;

                        if ( s>=0 ) return s;
                        break;
                    case 63 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 67;}

                        else if ( ( !codeMode ) ) {s = 30;}

                        if ( s>=0 ) return s;
                        break;
                    case 64 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 68;}

                        else if ( ( !codeMode ) ) {s = 30;}

                        if ( s>=0 ) return s;
                        break;
                    case 65 : 
                        int LA12_5 = input.LA(1);
                        s = -1;
                        if ( ((LA12_5>='\u0000' && LA12_5<=';')||(LA12_5>='=' && LA12_5<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 35;

                        if ( s>=0 ) return s;
                        break;
                    case 66 : 
                        int LA12_20 = input.LA(1);
                        s = -1;
                        if ( ((LA12_20>='\u0000' && LA12_20<=';')||(LA12_20>='=' && LA12_20<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 56;

                        if ( s>=0 ) return s;
                        break;
                    case 67 : 
                        int LA12_46 = input.LA(1);
                        s = -1;
                        if ( (LA12_46=='h') && ((  codeMode || !codeMode ))) {s = 76;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 68 : 
                        int LA12_26 = input.LA(1);
                        s = -1;
                        if ( (LA12_26=='=') && ((  codeMode || !codeMode ))) {s = 60;}

                        else if ( ((LA12_26>='\u0000' && LA12_26<=';')||(LA12_26>='>' && LA12_26<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 61;

                        if ( s>=0 ) return s;
                        break;
                    case 69 : 
                        int LA12_47 = input.LA(1);
                        s = -1;
                        if ( (LA12_47=='s') && ((  codeMode || !codeMode ))) {s = 77;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 70 : 
                        int LA12_6 = input.LA(1);
                        s = -1;
                        if ( (LA12_6=='>') && ((  codeMode || !codeMode ))) {s = 36;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 71 : 
                        int LA12_65 = input.LA(1);
                        s = -1;
                        if ( ((LA12_65>='\u0000' && LA12_65<=';')||(LA12_65>='=' && LA12_65<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 93;

                        if ( s>=0 ) return s;
                        break;
                    case 72 : 
                        int LA12_9 = input.LA(1);
                        s = -1;
                        if ( ((LA12_9>='\u0000' && LA12_9<='!')||(LA12_9>='#' && LA12_9<=';')||(LA12_9>='=' && LA12_9<='\uFFFE')) && ((  codeMode || !codeMode ))) {s = 40;}

                        else if ( (LA12_9=='\"') && ((  codeMode || !codeMode ))) {s = 41;}

                        else if ( (LA12_9=='<') && (  codeMode )) {s = 42;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 73 : 
                        int LA12_8 = input.LA(1);
                        s = -1;
                        if ( ((LA12_8>='\t' && LA12_8<='\n')||LA12_8=='\r'||LA12_8==' ') && ((  codeMode || !codeMode ))) {s = 8;}

                        else if ( ((LA12_8>='\u0000' && LA12_8<='\b')||(LA12_8>='\u000B' && LA12_8<='\f')||(LA12_8>='\u000E' && LA12_8<='\u001F')||(LA12_8>='!' && LA12_8<=';')||(LA12_8>='=' && LA12_8<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 39;

                        if ( s>=0 ) return s;
                        break;
                    case 74 : 
                        int LA12_36 = input.LA(1);
                        s = -1;
                        if ( (LA12_36=='\n') && ((  codeMode || !codeMode ))) {s = 71;}

                        else if ( ((LA12_36>='\u0000' && LA12_36<='\t')||(LA12_36>='\u000B' && LA12_36<=';')||(LA12_36>='=' && LA12_36<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 72;

                        if ( s>=0 ) return s;
                        break;
                    case 75 : 
                        int LA12_76 = input.LA(1);
                        s = -1;
                        if ( (LA12_76=='o') && ((  codeMode || !codeMode ))) {s = 95;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 76 : 
                        int LA12_40 = input.LA(1);
                        s = -1;
                        if ( (LA12_40=='\"') && ((  codeMode || !codeMode ))) {s = 41;}

                        else if ( ((LA12_40>='\u0000' && LA12_40<='!')||(LA12_40>='#' && LA12_40<=';')||(LA12_40>='=' && LA12_40<='\uFFFE')) && ((  codeMode || !codeMode ))) {s = 40;}

                        else if ( (LA12_40=='<') && (  codeMode )) {s = 42;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 77 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 30;}

                        else if ( (  codeMode ) ) {s = 86;}

                        if ( s>=0 ) return s;
                        break;
                    case 78 : 
                        int LA12_96 = input.LA(1);
                        s = -1;
                        if ( ((LA12_96>='\u0000' && LA12_96<=';')||(LA12_96>='=' && LA12_96<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 102;

                        if ( s>=0 ) return s;
                        break;
                    case 79 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 66;}

                        else if ( ( !codeMode ) ) {s = 30;}

                        if ( s>=0 ) return s;
                        break;
                    case 80 : 
                        int LA12_23 = input.LA(1);
                        s = -1;
                        if ( ((LA12_23>='\u0000' && LA12_23<=';')||(LA12_23>='=' && LA12_23<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 58;

                        if ( s>=0 ) return s;
                        break;
                    case 81 : 
                        int LA12_62 = input.LA(1);
                        s = -1;
                        if ( ((LA12_62>='\u0000' && LA12_62<=';')||(LA12_62>='=' && LA12_62<='\uFFFE')) && ( !codeMode )) {s = 30;}

                        else s = 63;

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