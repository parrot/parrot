// $ANTLR 3.0b6 src/antlr3/Plumhead.g 2007-02-16 21:50:12

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int CODE_START=9;
    public static final int MINUS=19;
    public static final int T29=29;
    public static final int IDENT=15;
    public static final int ARRAY=7;
    public static final int WS=11;
    public static final int NUMBER=18;
    public static final int T28=28;
    public static final int SINGLEQUOTE_STRING=13;
    public static final int MUL_OP=21;
    public static final int SEA=8;
    public static final int CODE_END=10;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int ASSIGN_OP=22;
    public static final int INTEGER=17;
    public static final int DOUBLEQUOTE_STRING=12;
    public static final int ECHO=14;
    public static final int ELSE=25;
    public static final int T26=26;
    public static final int IF=24;
    public static final int EOF=-1;
    public static final int T32=32;
    public static final int Tokens=33;
    public static final int T31=31;
    public static final int REL_OP=23;
    public static final int PLUS=20;
    public static final int T27=27;
    public static final int NOQUOTE_STRING=5;
    public static final int T30=30;
    public static final int SCALAR=16;

      public static boolean codeMode = false;

    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T26
    public void mT26() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T26;
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
    // $ANTLR end T26

    // $ANTLR start T27
    public void mT27() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T27;
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
    // $ANTLR end T27

    // $ANTLR start T28
    public void mT28() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T28;
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
    // $ANTLR end T28

    // $ANTLR start T29
    public void mT29() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T29;
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
    // $ANTLR end T29

    // $ANTLR start T30
    public void mT30() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T30;
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
    // $ANTLR end T30

    // $ANTLR start T31
    public void mT31() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T31;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:11:7: ( '[' )
            // src/antlr3/Plumhead.g:11:7: '['
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
            // src/antlr3/Plumhead.g:12:7: ( ']' )
            // src/antlr3/Plumhead.g:12:7: ']'
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
    // $ANTLR end T32

    // $ANTLR start SEA
    public void mSEA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SEA;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:31:15: ({...}? => (~ '<' )+ )
            // src/antlr3/Plumhead.g:31:15: {...}? => (~ '<' )+
            {
            if ( !( !codeMode ) ) {
                throw new FailedPredicateException(input, "SEA", " !codeMode ");
            }
            // src/antlr3/Plumhead.g:31:32: (~ '<' )+
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
            	    // src/antlr3/Plumhead.g:31:33: ~ '<'
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
            // src/antlr3/Plumhead.g:32:15: ( '<?php' )
            // src/antlr3/Plumhead.g:32:15: '<?php'
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
            // src/antlr3/Plumhead.g:33:15: ({...}? => '?>' ( '\\n' )? )
            // src/antlr3/Plumhead.g:33:15: {...}? => '?>' ( '\\n' )?
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "CODE_END", " codeMode ");
            }
            match("?>"); 

            // src/antlr3/Plumhead.g:33:36: ( '\\n' )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0=='\n') ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:33:36: '\\n'
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
            // src/antlr3/Plumhead.g:35:5: ({...}? => ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // src/antlr3/Plumhead.g:35:5: {...}? => ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "WS", " codeMode ");
            }
            // src/antlr3/Plumhead.g:36:5: ( (' '|'\\t'|'\\r'|'\\n'))+
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
            	    // src/antlr3/Plumhead.g:36:7: (' '|'\\t'|'\\r'|'\\n')
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
            // src/antlr3/Plumhead.g:41:23: ({...}? => '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:41:23: {...}? => '\\\"' (~ '\\\"' )* '\\\"'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "DOUBLEQUOTE_STRING", " codeMode ");
            }
            match('\"'); 
            // src/antlr3/Plumhead.g:41:44: (~ '\\\"' )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>='\u0000' && LA4_0<='!')||(LA4_0>='#' && LA4_0<='\uFFFE')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:41:46: ~ '\\\"'
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
            // src/antlr3/Plumhead.g:42:23: ({...}? => '\\'' (~ '\\'' )* '\\'' )
            // src/antlr3/Plumhead.g:42:23: {...}? => '\\'' (~ '\\'' )* '\\''
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "SINGLEQUOTE_STRING", " codeMode ");
            }
            match('\''); 
            // src/antlr3/Plumhead.g:42:44: (~ '\\'' )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>='\u0000' && LA5_0<='&')||(LA5_0>='(' && LA5_0<='\uFFFE')) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:42:46: ~ '\\''
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
            // src/antlr3/Plumhead.g:43:23: ({...}? => 'echo' )
            // src/antlr3/Plumhead.g:43:23: {...}? => 'echo'
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

    // $ANTLR start IDENT
    public void mIDENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // src/antlr3/Plumhead.g:46:11: ({...}? => ('a'..'z'|'A'..'Z') ( ('a'..'z'|'A'..'Z'))* )
            // src/antlr3/Plumhead.g:46:11: {...}? => ('a'..'z'|'A'..'Z') ( ('a'..'z'|'A'..'Z'))*
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "IDENT", " codeMode ");
            }
            if ( (input.LA(1)>='A' && input.LA(1)<='Z')||(input.LA(1)>='a' && input.LA(1)<='z') ) {
                input.consume();

            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recover(mse);    throw mse;
            }

            // src/antlr3/Plumhead.g:46:50: ( ('a'..'z'|'A'..'Z'))*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( ((LA6_0>='A' && LA6_0<='Z')||(LA6_0>='a' && LA6_0<='z')) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:46:52: ('a'..'z'|'A'..'Z')
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
            // src/antlr3/Plumhead.g:48:11: ({...}? => '$' IDENT )
            // src/antlr3/Plumhead.g:48:11: {...}? => '$' IDENT
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "SCALAR", " codeMode ");
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

    // $ANTLR start INTEGER
    public void mINTEGER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // src/antlr3/Plumhead.g:51:11: ({...}? => ( '0' .. '9' )+ )
            // src/antlr3/Plumhead.g:51:11: {...}? => ( '0' .. '9' )+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "INTEGER", " codeMode ");
            }
            // src/antlr3/Plumhead.g:51:27: ( '0' .. '9' )+
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
            	    // src/antlr3/Plumhead.g:51:28: '0' .. '9'
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
            // src/antlr3/Plumhead.g:54:6: ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt9=2;
            int LA9_0 = input.LA(1);
            if ( ((LA9_0>='0' && LA9_0<='9')) && ( codeMode )) {
                alt9=1;
            }
            else if ( (LA9_0=='.') ) {
                alt9=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("53:1: NUMBER : ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER );", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:54:6: {...}? => INTEGER ( '.' INTEGER )?
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "NUMBER", " codeMode ");
                    }
                    mINTEGER(); 
                    // src/antlr3/Plumhead.g:54:31: ( '.' INTEGER )?
                    int alt8=2;
                    int LA8_0 = input.LA(1);
                    if ( (LA8_0=='.') ) {
                        alt8=1;
                    }
                    switch (alt8) {
                        case 1 :
                            // src/antlr3/Plumhead.g:54:32: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:55:7: '.' INTEGER
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
            // src/antlr3/Plumhead.g:58:13: ({...}? => '-' )
            // src/antlr3/Plumhead.g:58:13: {...}? => '-'
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
            // src/antlr3/Plumhead.g:59:13: ({...}? => '+' )
            // src/antlr3/Plumhead.g:59:13: {...}? => '+'
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
            // src/antlr3/Plumhead.g:60:13: ({...}? => '*' | '/' | '%' )
            int alt10=3;
            int LA10_0 = input.LA(1);
            if ( (LA10_0=='*') && ( codeMode )) {
                alt10=1;
            }
            else if ( (LA10_0=='/') ) {
                alt10=2;
            }
            else if ( (LA10_0=='%') ) {
                alt10=3;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("60:1: MUL_OP : ({...}? => '*' | '/' | '%' );", 10, 0, input);

                throw nvae;
            }
            switch (alt10) {
                case 1 :
                    // src/antlr3/Plumhead.g:60:13: {...}? => '*'
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "MUL_OP", " codeMode ");
                    }
                    match('*'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:60:37: '/'
                    {
                    match('/'); 

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:60:44: '%'
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

    // $ANTLR start ASSIGN_OP
    public void mASSIGN_OP() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = ASSIGN_OP;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:61:13: ({...}? => '=' )
            // src/antlr3/Plumhead.g:61:13: {...}? => '='
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "ASSIGN_OP", " codeMode ");
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
            // src/antlr3/Plumhead.g:62:13: ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' )
            int alt11=6;
            int LA11_0 = input.LA(1);
            if ( (LA11_0=='=') && ( codeMode )) {
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
                    new NoViableAltException("62:1: REL_OP : ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' );", 11, 0, input);

                throw nvae;
            }
            switch (alt11) {
                case 1 :
                    // src/antlr3/Plumhead.g:62:13: {...}? => '=='
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "REL_OP", " codeMode ");
                    }
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:62:37: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:62:44: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:62:51: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:62:58: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:62:65: '>'
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
            // src/antlr3/Plumhead.g:64:13: ({...}? => 'if' )
            // src/antlr3/Plumhead.g:64:13: {...}? => 'if'
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
            // src/antlr3/Plumhead.g:65:13: ({...}? => 'else' )
            // src/antlr3/Plumhead.g:65:13: {...}? => 'else'
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
        // src/antlr3/Plumhead.g:1:10: ( T26 | T27 | T28 | T29 | T30 | T31 | T32 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | SCALAR | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | IF | ELSE )
        int alt12=23;
        alt12 = dfa12.predict(input);
        switch (alt12) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T26
                {
                mT26(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: T27
                {
                mT27(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: T28
                {
                mT28(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:22: T29
                {
                mT29(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:26: T30
                {
                mT30(); 

                }
                break;
            case 6 :
                // src/antlr3/Plumhead.g:1:30: T31
                {
                mT31(); 

                }
                break;
            case 7 :
                // src/antlr3/Plumhead.g:1:34: T32
                {
                mT32(); 

                }
                break;
            case 8 :
                // src/antlr3/Plumhead.g:1:38: SEA
                {
                mSEA(); 

                }
                break;
            case 9 :
                // src/antlr3/Plumhead.g:1:42: CODE_START
                {
                mCODE_START(); 

                }
                break;
            case 10 :
                // src/antlr3/Plumhead.g:1:53: CODE_END
                {
                mCODE_END(); 

                }
                break;
            case 11 :
                // src/antlr3/Plumhead.g:1:62: WS
                {
                mWS(); 

                }
                break;
            case 12 :
                // src/antlr3/Plumhead.g:1:65: DOUBLEQUOTE_STRING
                {
                mDOUBLEQUOTE_STRING(); 

                }
                break;
            case 13 :
                // src/antlr3/Plumhead.g:1:84: SINGLEQUOTE_STRING
                {
                mSINGLEQUOTE_STRING(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:103: ECHO
                {
                mECHO(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:108: SCALAR
                {
                mSCALAR(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:115: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:122: MINUS
                {
                mMINUS(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:128: PLUS
                {
                mPLUS(); 

                }
                break;
            case 19 :
                // src/antlr3/Plumhead.g:1:133: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 20 :
                // src/antlr3/Plumhead.g:1:140: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 21 :
                // src/antlr3/Plumhead.g:1:150: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 22 :
                // src/antlr3/Plumhead.g:1:157: IF
                {
                mIF(); 

                }
                break;
            case 23 :
                // src/antlr3/Plumhead.g:1:160: ELSE
                {
                mELSE(); 

                }
                break;

        }

    }


    protected DFA12 dfa12 = new DFA12(this);
    public static final String DFA12_eotS =
        "\1\uffff\1\33\1\34\1\35\1\36\1\37\1\40\1\41\1\32\1\43\1\45\4\32"+
        "\1\57\1\32\1\62\1\63\1\64\2\65\1\67\1\71\2\32\10\uffff\1\104\3\uffff"+
        "\1\32\1\106\1\uffff\1\32\1\107\1\uffff\2\32\1\113\1\uffff\1\32\1"+
        "\116\4\uffff\1\123\1\uffff\1\71\1\uffff\1\71\1\125\7\uffff\1\104"+
        "\4\uffff\2\32\1\113\2\uffff\1\57\11\uffff\1\134\1\135\7\uffff";
    public static final String DFA12_eofS =
        "\140\uffff";
    public static final String DFA12_minS =
        "\10\0\1\76\1\77\3\0\1\143\1\101\1\0\1\60\7\0\1\75\1\146\1\uffff"+
        "\10\0\2\uffff\3\0\1\uffff\2\0\1\uffff\1\150\1\163\2\0\1\60\13\0"+
        "\7\uffff\2\0\1\uffff\2\0\1\157\1\145\2\0\1\uffff\2\0\4\uffff\1\0"+
        "\1\uffff\1\0\1\uffff\2\0\3\uffff\2\0\2\uffff";
    public static final String DFA12_maxS =
        "\10\ufffe\1\76\1\77\3\ufffe\1\154\1\172\1\ufffe\1\71\7\ufffe\1\75"+
        "\1\146\1\uffff\7\0\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff\2\ufffe\1"+
        "\uffff\1\150\1\163\1\ufffe\1\0\1\71\1\ufffe\4\0\1\ufffe\1\0\1\ufffe"+
        "\1\0\2\ufffe\7\uffff\1\ufffe\1\0\1\uffff\2\0\1\157\1\145\1\ufffe"+
        "\1\0\1\uffff\1\ufffe\1\0\4\uffff\1\0\1\uffff\1\0\1\uffff\2\ufffe"+
        "\3\uffff\2\0\2\uffff";
    public static final String DFA12_acceptS =
        "\32\uffff\1\10\10\uffff\1\25\1\11\3\uffff\1\14\2\uffff\1\15\20\uffff"+
        "\1\1\1\2\1\3\1\4\1\5\1\6\1\7\2\uffff\1\13\6\uffff\1\20\2\uffff\1"+
        "\21\1\22\2\23\1\uffff\1\24\1\uffff\1\12\2\uffff\1\17\1\20\1\26\2"+
        "\uffff\1\16\1\27";
    public static final String DFA12_specialS =
        "\1\76\1\14\1\42\1\57\1\75\1\5\1\36\1\34\1\26\1\uffff\1\56\1\101"+
        "\1\21\1\13\1\43\1\32\1\17\1\12\1\62\1\31\1\3\1\11\1\41\1\23\1\67"+
        "\1\30\1\uffff\1\77\1\103\1\27\1\6\1\66\1\35\1\47\1\100\2\uffff\1"+
        "\73\1\64\1\105\1\uffff\1\70\1\50\1\uffff\1\20\1\15\1\104\1\2\1\10"+
        "\1\46\1\45\1\53\1\40\1\37\1\52\1\25\1\61\1\55\1\4\1\44\7\uffff\1"+
        "\60\1\16\1\uffff\1\65\1\72\1\0\1\71\1\24\1\22\1\uffff\1\7\1\1\4"+
        "\uffff\1\54\1\uffff\1\33\1\uffff\1\51\1\74\3\uffff\1\102\1\63\2"+
        "\uffff}>";
    public static final String[] DFA12_transition = {
        "\11\32\2\12\2\32\1\12\22\32\1\12\1\30\1\13\1\32\1\16\1\25\1\32\1"+
        "\14\1\2\1\3\1\23\1\22\1\32\1\21\1\20\1\24\12\17\1\32\1\1\1\11\1"+
        "\26\1\27\1\10\33\32\1\6\1\32\1\7\7\32\1\15\3\32\1\31\21\32\1\4\1"+
        "\32\1\5\uff81\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\1\42",
        "\1\44",
        "\11\32\2\12\2\32\1\12\22\32\1\12\33\32\1\uffff\uffc2\32",
        "\42\46\1\47\31\46\1\50\uffc2\46",
        "\47\51\1\52\24\51\1\53\uffc2\51",
        "\1\54\10\uffff\1\55",
        "\32\56\6\uffff\32\56",
        "\56\32\1\60\1\32\12\17\2\32\1\uffff\uffc2\32",
        "\12\61",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\1\66\uffc1\32",
        "\74\32\1\uffff\1\70\uffc1\32",
        "\1\72",
        "\1\73",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\12\32\1\103\61\32\1\uffff\uffc2\32",
        "",
        "",
        "\1\uffff",
        "\42\46\1\47\31\46\1\50\uffc2\46",
        "\74\32\1\uffff\uffc2\32",
        "",
        "\47\51\1\52\24\51\1\53\uffc2\51",
        "\74\32\1\uffff\uffc2\32",
        "",
        "\1\110",
        "\1\111",
        "\74\32\1\uffff\4\32\32\112\6\32\32\112\uff84\32",
        "\1\uffff",
        "\12\115",
        "\60\32\12\61\2\32\1\uffff\uffc2\32",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\74\32\1\uffff\uffc2\32",
        "\1\uffff",
        "\74\32\1\uffff\uffc2\32",
        "\1\uffff",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "\74\32\1\uffff\uffc2\32",
        "\1\uffff",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\127",
        "\1\130",
        "\74\32\1\uffff\4\32\32\112\6\32\32\112\uff84\32",
        "\1\uffff",
        "",
        "\60\32\12\115\2\32\1\uffff\uffc2\32",
        "\1\uffff",
        "",
        "",
        "",
        "",
        "\1\uffff",
        "",
        "\1\uffff",
        "",
        "\74\32\1\uffff\uffc2\32",
        "\74\32\1\uffff\uffc2\32",
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
            return "1:1: Tokens : ( T26 | T27 | T28 | T29 | T30 | T31 | T32 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | SCALAR | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | IF | ELSE );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        int LA12_72 = input.LA(1);
                        s = -1;
                        if ( (LA12_72=='o') && (( codeMode || !codeMode ))) {s = 87;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( (true) ) {s = 90;}

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 76;}

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        int LA12_20 = input.LA(1);
                        s = -1;
                        if ( ((LA12_20>='\u0000' && LA12_20<=';')||(LA12_20>='=' && LA12_20<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 53;

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        int LA12_58 = input.LA(1);
                        s = -1;
                        if ( ((LA12_58>='\u0000' && LA12_58<=';')||(LA12_58>='=' && LA12_58<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 57;

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        int LA12_5 = input.LA(1);
                        s = -1;
                        if ( ((LA12_5>='\u0000' && LA12_5<=';')||(LA12_5>='=' && LA12_5<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 31;

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 63;}

                        else if ( ( !codeMode ) ) {s = 26;}

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        int LA12_77 = input.LA(1);
                        s = -1;
                        if ( ((LA12_77>='0' && LA12_77<='9')) && (( codeMode || !codeMode ))) {s = 77;}

                        else if ( ((LA12_77>='\u0000' && LA12_77<='/')||(LA12_77>=':' && LA12_77<=';')||(LA12_77>='=' && LA12_77<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 47;

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        int LA12_48 = input.LA(1);
                        s = -1;
                        if ( ((LA12_48>='0' && LA12_48<='9')) && (( codeMode || !codeMode ))) {s = 77;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        int LA12_21 = input.LA(1);
                        s = -1;
                        if ( ((LA12_21>='\u0000' && LA12_21<=';')||(LA12_21>='=' && LA12_21<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 53;

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        int LA12_17 = input.LA(1);
                        s = -1;
                        if ( ((LA12_17>='\u0000' && LA12_17<=';')||(LA12_17>='=' && LA12_17<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA12_13 = input.LA(1);
                        s = -1;
                        if ( (LA12_13=='c') && (( codeMode || !codeMode ))) {s = 44;}

                        else if ( (LA12_13=='l') && (( codeMode || !codeMode ))) {s = 45;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        int LA12_1 = input.LA(1);
                        s = -1;
                        if ( ((LA12_1>='\u0000' && LA12_1<=';')||(LA12_1>='=' && LA12_1<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 27;

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        int LA12_45 = input.LA(1);
                        s = -1;
                        if ( (LA12_45=='s') && (( codeMode || !codeMode ))) {s = 73;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 86;}

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        int LA12_16 = input.LA(1);
                        s = -1;
                        if ( ((LA12_16>='0' && LA12_16<='9')) ) {s = 49;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        int LA12_44 = input.LA(1);
                        s = -1;
                        if ( (LA12_44=='h') && (( codeMode || !codeMode ))) {s = 72;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        int LA12_12 = input.LA(1);
                        s = -1;
                        if ( ((LA12_12>='\u0000' && LA12_12<='&')||(LA12_12>='(' && LA12_12<=';')||(LA12_12>='=' && LA12_12<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 41;}

                        else if ( (LA12_12=='\'') && (( codeMode || !codeMode ))) {s = 42;}

                        else if ( (LA12_12=='<') && ( codeMode )) {s = 43;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 89;}

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        int LA12_23 = input.LA(1);
                        s = -1;
                        if ( (LA12_23=='=') ) {s = 56;}

                        else if ( ((LA12_23>='\u0000' && LA12_23<=';')||(LA12_23>='>' && LA12_23<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 57;

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        int LA12_74 = input.LA(1);
                        s = -1;
                        if ( ((LA12_74>='A' && LA12_74<='Z')||(LA12_74>='a' && LA12_74<='z')) && (( codeMode || !codeMode ))) {s = 74;}

                        else if ( ((LA12_74>='\u0000' && LA12_74<=';')||(LA12_74>='=' && LA12_74<='@')||(LA12_74>='[' && LA12_74<='`')||(LA12_74>='{' && LA12_74<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 75;

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 84;}

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        int LA12_8 = input.LA(1);
                        s = -1;
                        if ( (LA12_8=='>') && (( codeMode || !codeMode ))) {s = 34;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 62;}

                        else if ( ( !codeMode ) ) {s = 26;}

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        int LA12_25 = input.LA(1);
                        s = -1;
                        if ( (LA12_25=='f') && (( codeMode || !codeMode ))) {s = 59;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        int LA12_19 = input.LA(1);
                        s = -1;
                        if ( ((LA12_19>='\u0000' && LA12_19<=';')||(LA12_19>='=' && LA12_19<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 52;

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        int LA12_15 = input.LA(1);
                        s = -1;
                        if ( (LA12_15=='.') && (( codeMode || !codeMode ))) {s = 48;}

                        else if ( ((LA12_15>='0' && LA12_15<='9')) && (( codeMode || !codeMode ))) {s = 15;}

                        else if ( ((LA12_15>='\u0000' && LA12_15<='-')||LA12_15=='/'||(LA12_15>=':' && LA12_15<=';')||(LA12_15>='=' && LA12_15<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 47;

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 91;}

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        int LA12_7 = input.LA(1);
                        s = -1;
                        if ( ((LA12_7>='\u0000' && LA12_7<=';')||(LA12_7>='=' && LA12_7<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 33;

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 65;}

                        else if ( ( !codeMode ) ) {s = 26;}

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        int LA12_6 = input.LA(1);
                        s = -1;
                        if ( ((LA12_6>='\u0000' && LA12_6<=';')||(LA12_6>='=' && LA12_6<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 32;

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( (true) ) {s = 82;}

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 81;}

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
                        int LA12_22 = input.LA(1);
                        s = -1;
                        if ( (LA12_22=='=') && (( codeMode || !codeMode ))) {s = 54;}

                        else if ( ((LA12_22>='\u0000' && LA12_22<=';')||(LA12_22>='>' && LA12_22<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 55;

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        int LA12_2 = input.LA(1);
                        s = -1;
                        if ( ((LA12_2>='\u0000' && LA12_2<=';')||(LA12_2>='=' && LA12_2<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        int LA12_14 = input.LA(1);
                        s = -1;
                        if ( ((LA12_14>='A' && LA12_14<='Z')||(LA12_14>='a' && LA12_14<='z')) && (( codeMode || !codeMode ))) {s = 46;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        int LA12_59 = input.LA(1);
                        s = -1;
                        if ( ((LA12_59>='\u0000' && LA12_59<=';')||(LA12_59>='=' && LA12_59<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 85;

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 79;}

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        int LA12_49 = input.LA(1);
                        s = -1;
                        if ( ((LA12_49>='0' && LA12_49<='9')) ) {s = 49;}

                        else if ( ((LA12_49>='\u0000' && LA12_49<='/')||(LA12_49>=':' && LA12_49<=';')||(LA12_49>='=' && LA12_49<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 78;

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 66;}

                        else if ( ( !codeMode ) ) {s = 26;}

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        int LA12_42 = input.LA(1);
                        s = -1;
                        if ( ((LA12_42>='\u0000' && LA12_42<=';')||(LA12_42>='=' && LA12_42<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 71;

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        int LA12_87 = input.LA(1);
                        s = -1;
                        if ( ((LA12_87>='\u0000' && LA12_87<=';')||(LA12_87>='=' && LA12_87<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 92;

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        int LA12_54 = input.LA(1);
                        s = -1;
                        if ( ((LA12_54>='\u0000' && LA12_54<=';')||(LA12_54>='=' && LA12_54<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 83;

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 80;}

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 35;}

                        if ( s>=0 ) return s;
                        break;
                    case 45 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( (true) ) {s = 35;}

                        if ( s>=0 ) return s;
                        break;
                    case 46 : 
                        int LA12_10 = input.LA(1);
                        s = -1;
                        if ( ((LA12_10>='\t' && LA12_10<='\n')||LA12_10=='\r'||LA12_10==' ') && (( codeMode || !codeMode ))) {s = 10;}

                        else if ( ((LA12_10>='\u0000' && LA12_10<='\b')||(LA12_10>='\u000B' && LA12_10<='\f')||(LA12_10>='\u000E' && LA12_10<='\u001F')||(LA12_10>='!' && LA12_10<=';')||(LA12_10>='=' && LA12_10<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 37;

                        if ( s>=0 ) return s;
                        break;
                    case 47 : 
                        int LA12_3 = input.LA(1);
                        s = -1;
                        if ( ((LA12_3>='\u0000' && LA12_3<=';')||(LA12_3>='=' && LA12_3<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 29;

                        if ( s>=0 ) return s;
                        break;
                    case 48 : 
                        int LA12_67 = input.LA(1);
                        s = -1;
                        if ( ((LA12_67>='\u0000' && LA12_67<=';')||(LA12_67>='=' && LA12_67<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 68;

                        if ( s>=0 ) return s;
                        break;
                    case 49 : 
                        int LA12_56 = input.LA(1);
                        s = -1;
                        if ( ((LA12_56>='\u0000' && LA12_56<=';')||(LA12_56>='=' && LA12_56<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 57;

                        if ( s>=0 ) return s;
                        break;
                    case 50 : 
                        int LA12_18 = input.LA(1);
                        s = -1;
                        if ( ((LA12_18>='\u0000' && LA12_18<=';')||(LA12_18>='=' && LA12_18<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 51;

                        if ( s>=0 ) return s;
                        break;
                    case 51 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 95;}

                        if ( s>=0 ) return s;
                        break;
                    case 52 : 
                        int LA12_38 = input.LA(1);
                        s = -1;
                        if ( (LA12_38=='\"') && (( codeMode || !codeMode ))) {s = 39;}

                        else if ( ((LA12_38>='\u0000' && LA12_38<='!')||(LA12_38>='#' && LA12_38<=';')||(LA12_38>='=' && LA12_38<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 38;}

                        else if ( (LA12_38=='<') && ( codeMode )) {s = 40;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 53 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 40;}

                        if ( s>=0 ) return s;
                        break;
                    case 54 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 64;}

                        else if ( ( !codeMode ) ) {s = 26;}

                        if ( s>=0 ) return s;
                        break;
                    case 55 : 
                        int LA12_24 = input.LA(1);
                        s = -1;
                        if ( (LA12_24=='=') ) {s = 58;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 56 : 
                        int LA12_41 = input.LA(1);
                        s = -1;
                        if ( (LA12_41=='\'') && (( codeMode || !codeMode ))) {s = 42;}

                        else if ( ((LA12_41>='\u0000' && LA12_41<='&')||(LA12_41>='(' && LA12_41<=';')||(LA12_41>='=' && LA12_41<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 41;}

                        else if ( (LA12_41=='<') && ( codeMode )) {s = 43;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 57 : 
                        int LA12_73 = input.LA(1);
                        s = -1;
                        if ( (LA12_73=='e') && (( codeMode || !codeMode ))) {s = 88;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 58 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 43;}

                        if ( s>=0 ) return s;
                        break;
                    case 59 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 69;}

                        if ( s>=0 ) return s;
                        break;
                    case 60 : 
                        int LA12_88 = input.LA(1);
                        s = -1;
                        if ( ((LA12_88>='\u0000' && LA12_88<=';')||(LA12_88>='=' && LA12_88<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 93;

                        if ( s>=0 ) return s;
                        break;
                    case 61 : 
                        int LA12_4 = input.LA(1);
                        s = -1;
                        if ( ((LA12_4>='\u0000' && LA12_4<=';')||(LA12_4>='=' && LA12_4<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 62 : 
                        int LA12_0 = input.LA(1);
                        s = -1;
                        if ( (LA12_0==';') ) {s = 1;}

                        else if ( (LA12_0=='(') ) {s = 2;}

                        else if ( (LA12_0==')') ) {s = 3;}

                        else if ( (LA12_0=='{') ) {s = 4;}

                        else if ( (LA12_0=='}') ) {s = 5;}

                        else if ( (LA12_0=='[') ) {s = 6;}

                        else if ( (LA12_0==']') ) {s = 7;}

                        else if ( (LA12_0=='?') && (( codeMode || !codeMode ))) {s = 8;}

                        else if ( (LA12_0=='<') ) {s = 9;}

                        else if ( ((LA12_0>='\t' && LA12_0<='\n')||LA12_0=='\r'||LA12_0==' ') && (( codeMode || !codeMode ))) {s = 10;}

                        else if ( (LA12_0=='\"') && (( codeMode || !codeMode ))) {s = 11;}

                        else if ( (LA12_0=='\'') && (( codeMode || !codeMode ))) {s = 12;}

                        else if ( (LA12_0=='e') && (( codeMode || !codeMode ))) {s = 13;}

                        else if ( (LA12_0=='$') && (( codeMode || !codeMode ))) {s = 14;}

                        else if ( ((LA12_0>='0' && LA12_0<='9')) && (( codeMode || !codeMode ))) {s = 15;}

                        else if ( (LA12_0=='.') ) {s = 16;}

                        else if ( (LA12_0=='-') && (( codeMode || !codeMode ))) {s = 17;}

                        else if ( (LA12_0=='+') && (( codeMode || !codeMode ))) {s = 18;}

                        else if ( (LA12_0=='*') && (( codeMode || !codeMode ))) {s = 19;}

                        else if ( (LA12_0=='/') ) {s = 20;}

                        else if ( (LA12_0=='%') ) {s = 21;}

                        else if ( (LA12_0=='=') && (( codeMode || !codeMode ))) {s = 22;}

                        else if ( (LA12_0=='>') ) {s = 23;}

                        else if ( (LA12_0=='!') ) {s = 24;}

                        else if ( (LA12_0=='i') && (( codeMode || !codeMode ))) {s = 25;}

                        else if ( ((LA12_0>='\u0000' && LA12_0<='\b')||(LA12_0>='\u000B' && LA12_0<='\f')||(LA12_0>='\u000E' && LA12_0<='\u001F')||LA12_0=='#'||LA12_0=='&'||LA12_0==','||LA12_0==':'||(LA12_0>='@' && LA12_0<='Z')||LA12_0=='\\'||(LA12_0>='^' && LA12_0<='d')||(LA12_0>='f' && LA12_0<='h')||(LA12_0>='j' && LA12_0<='z')||LA12_0=='|'||(LA12_0>='~' && LA12_0<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        if ( s>=0 ) return s;
                        break;
                    case 63 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 60;}

                        else if ( ( !codeMode ) ) {s = 26;}

                        if ( s>=0 ) return s;
                        break;
                    case 64 : 
                        int LA12_34 = input.LA(1);
                        s = -1;
                        if ( (LA12_34=='\n') && (( codeMode || !codeMode ))) {s = 67;}

                        else if ( ((LA12_34>='\u0000' && LA12_34<='\t')||(LA12_34>='\u000B' && LA12_34<=';')||(LA12_34>='=' && LA12_34<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 68;

                        if ( s>=0 ) return s;
                        break;
                    case 65 : 
                        int LA12_11 = input.LA(1);
                        s = -1;
                        if ( ((LA12_11>='\u0000' && LA12_11<='!')||(LA12_11>='#' && LA12_11<=';')||(LA12_11>='=' && LA12_11<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 38;}

                        else if ( (LA12_11=='\"') && (( codeMode || !codeMode ))) {s = 39;}

                        else if ( (LA12_11=='<') && ( codeMode )) {s = 40;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 66 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 26;}

                        else if ( ( codeMode ) ) {s = 94;}

                        if ( s>=0 ) return s;
                        break;
                    case 67 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 61;}

                        else if ( ( !codeMode ) ) {s = 26;}

                        if ( s>=0 ) return s;
                        break;
                    case 68 : 
                        int LA12_46 = input.LA(1);
                        s = -1;
                        if ( ((LA12_46>='A' && LA12_46<='Z')||(LA12_46>='a' && LA12_46<='z')) && (( codeMode || !codeMode ))) {s = 74;}

                        else if ( ((LA12_46>='\u0000' && LA12_46<=';')||(LA12_46>='=' && LA12_46<='@')||(LA12_46>='[' && LA12_46<='`')||(LA12_46>='{' && LA12_46<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 75;

                        if ( s>=0 ) return s;
                        break;
                    case 69 : 
                        int LA12_39 = input.LA(1);
                        s = -1;
                        if ( ((LA12_39>='\u0000' && LA12_39<=';')||(LA12_39>='=' && LA12_39<='\uFFFE')) && ( !codeMode )) {s = 26;}

                        else s = 70;

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