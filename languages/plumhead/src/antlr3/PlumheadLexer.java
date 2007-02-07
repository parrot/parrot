// $ANTLR 3.0b6 src/antlr3/Plumhead.g 2007-02-07 23:18:50

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int CODE_START=8;
    public static final int MINUS=19;
    public static final int T29=29;
    public static final int ARRAY=16;
    public static final int IDENT=14;
    public static final int WS=10;
    public static final int NUMBER=18;
    public static final int T28=28;
    public static final int SINGLEQUOTE_STRING=12;
    public static final int MUL_OP=21;
    public static final int SEA=7;
    public static final int CODE_END=9;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int ASSIGN_OP=22;
    public static final int INTEGER=17;
    public static final int DOUBLEQUOTE_STRING=11;
    public static final int ECHO=13;
    public static final int ELSE=25;
    public static final int T26=26;
    public static final int IF=24;
    public static final int EOF=-1;
    public static final int Tokens=31;
    public static final int REL_OP=23;
    public static final int PLUS=20;
    public static final int T27=27;
    public static final int NOQUOTE_STRING=5;
    public static final int T30=30;
    public static final int SCALAR=15;

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

    // $ANTLR start IDENT
    public void mIDENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            // src/antlr3/Plumhead.g:45:11: ({...}? => ('a'..'z'|'A'..'Z') ( ('a'..'z'|'A'..'Z'))* )
            // src/antlr3/Plumhead.g:45:11: {...}? => ('a'..'z'|'A'..'Z') ( ('a'..'z'|'A'..'Z'))*
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

            // src/antlr3/Plumhead.g:45:50: ( ('a'..'z'|'A'..'Z'))*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( ((LA6_0>='A' && LA6_0<='Z')||(LA6_0>='a' && LA6_0<='z')) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:45:52: ('a'..'z'|'A'..'Z')
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
            // src/antlr3/Plumhead.g:47:11: ({...}? => '$' IDENT )
            // src/antlr3/Plumhead.g:47:11: {...}? => '$' IDENT
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

    // $ANTLR start ARRAY
    public void mARRAY() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = ARRAY;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:48:11: ({...}? => '@' IDENT )
            // src/antlr3/Plumhead.g:48:11: {...}? => '@' IDENT
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "ARRAY", " codeMode ");
            }
            match('@'); 
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
    // $ANTLR end ARRAY

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
        // src/antlr3/Plumhead.g:1:10: ( T26 | T27 | T28 | T29 | T30 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | SCALAR | ARRAY | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | IF | ELSE )
        int alt12=22;
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
                // src/antlr3/Plumhead.g:1:100: SCALAR
                {
                mSCALAR(); 

                }
                break;
            case 14 :
                // src/antlr3/Plumhead.g:1:107: ARRAY
                {
                mARRAY(); 

                }
                break;
            case 15 :
                // src/antlr3/Plumhead.g:1:113: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 16 :
                // src/antlr3/Plumhead.g:1:120: MINUS
                {
                mMINUS(); 

                }
                break;
            case 17 :
                // src/antlr3/Plumhead.g:1:126: PLUS
                {
                mPLUS(); 

                }
                break;
            case 18 :
                // src/antlr3/Plumhead.g:1:131: MUL_OP
                {
                mMUL_OP(); 

                }
                break;
            case 19 :
                // src/antlr3/Plumhead.g:1:138: ASSIGN_OP
                {
                mASSIGN_OP(); 

                }
                break;
            case 20 :
                // src/antlr3/Plumhead.g:1:148: REL_OP
                {
                mREL_OP(); 

                }
                break;
            case 21 :
                // src/antlr3/Plumhead.g:1:155: IF
                {
                mIF(); 

                }
                break;
            case 22 :
                // src/antlr3/Plumhead.g:1:158: ELSE
                {
                mELSE(); 

                }
                break;

        }

    }


    protected DFA12 dfa12 = new DFA12(this);
    public static final String DFA12_eotS =
        "\1\uffff\1\32\1\33\1\34\1\35\1\36\1\31\1\41\1\42\5\31\1\55\1\31"+
        "\1\60\1\61\1\62\2\63\1\65\1\67\2\31\6\uffff\1\100\3\uffff\1\31\1"+
        "\102\1\uffff\1\31\1\103\1\uffff\2\31\1\106\1\110\1\uffff\1\31\1"+
        "\114\4\uffff\1\121\1\uffff\1\67\1\uffff\1\67\1\123\5\uffff\1\100"+
        "\4\uffff\2\31\1\uffff\1\106\1\uffff\1\110\1\uffff\1\55\11\uffff"+
        "\1\133\1\134\10\uffff";
    public static final String DFA12_eofS =
        "\137\uffff";
    public static final String DFA12_minS =
        "\6\0\1\76\1\77\3\0\1\143\2\101\1\0\1\60\7\0\1\75\1\146\1\uffff\6"+
        "\0\2\uffff\3\0\1\uffff\2\0\1\uffff\1\150\1\163\3\0\1\60\13\0\5\uffff"+
        "\2\0\1\uffff\2\0\1\157\1\145\4\0\1\uffff\2\0\4\uffff\1\0\1\uffff"+
        "\1\0\1\uffff\2\0\4\uffff\2\0\2\uffff";
    public static final String DFA12_maxS =
        "\6\ufffe\1\76\1\77\3\ufffe\1\154\2\172\1\ufffe\1\71\7\ufffe\1\75"+
        "\1\146\1\uffff\5\0\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff\2\ufffe\1"+
        "\uffff\1\150\1\163\2\ufffe\1\0\1\71\1\ufffe\4\0\1\ufffe\1\0\1\ufffe"+
        "\1\0\2\ufffe\5\uffff\1\ufffe\1\0\1\uffff\2\0\1\157\1\145\1\0\1\ufffe"+
        "\1\0\1\ufffe\1\uffff\1\ufffe\1\0\4\uffff\1\0\1\uffff\1\0\1\uffff"+
        "\2\ufffe\4\uffff\2\0\2\uffff";
    public static final String DFA12_acceptS =
        "\31\uffff\1\6\6\uffff\1\7\1\24\3\uffff\1\12\2\uffff\1\13\21\uffff"+
        "\1\1\1\2\1\3\1\4\1\5\2\uffff\1\11\10\uffff\1\17\2\uffff\1\20\1\21"+
        "\2\22\1\uffff\1\23\1\uffff\1\10\2\uffff\1\15\1\16\1\17\1\25\2\uffff"+
        "\1\14\1\26";
    public static final String DFA12_specialS =
        "\1\105\1\55\1\15\1\16\1\50\1\72\1\75\1\uffff\1\60\1\25\1\23\1\12"+
        "\1\77\1\70\1\35\1\34\1\13\1\64\1\10\1\17\1\33\1\11\1\22\1\74\1\31"+
        "\1\uffff\1\61\1\30\1\45\1\102\1\41\1\1\2\uffff\1\6\1\14\1\20\1\uffff"+
        "\1\42\1\100\1\uffff\1\65\1\66\1\62\1\0\1\27\1\4\1\53\1\3\1\73\1"+
        "\37\1\36\1\21\1\52\1\24\1\44\1\47\1\71\5\uffff\1\57\1\46\1\uffff"+
        "\1\67\1\2\1\54\1\63\1\76\1\51\1\103\1\40\1\uffff\1\56\1\26\4\uffff"+
        "\1\43\1\uffff\1\104\1\uffff\1\101\1\5\4\uffff\1\32\1\7\2\uffff}>";
    public static final String[] DFA12_transition = {
        "\11\31\2\10\2\31\1\10\22\31\1\10\1\27\1\11\1\31\1\14\1\24\1\31\1"+
        "\12\1\2\1\3\1\22\1\21\1\31\1\20\1\17\1\23\12\16\1\31\1\1\1\7\1\25"+
        "\1\26\1\6\1\15\44\31\1\13\3\31\1\30\21\31\1\4\1\31\1\5\uff81\31",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "\1\37",
        "\1\40",
        "\11\31\2\10\2\31\1\10\22\31\1\10\33\31\1\uffff\uffc2\31",
        "\42\43\1\44\31\43\1\45\uffc2\43",
        "\47\46\1\47\24\46\1\50\uffc2\46",
        "\1\51\10\uffff\1\52",
        "\32\53\6\uffff\32\53",
        "\32\54\6\uffff\32\54",
        "\56\31\1\56\1\31\12\16\2\31\1\uffff\uffc2\31",
        "\12\57",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\1\64\uffc1\31",
        "\74\31\1\uffff\1\66\uffc1\31",
        "\1\70",
        "\1\71",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\12\31\1\77\61\31\1\uffff\uffc2\31",
        "",
        "",
        "\1\uffff",
        "\42\43\1\44\31\43\1\45\uffc2\43",
        "\74\31\1\uffff\uffc2\31",
        "",
        "\47\46\1\47\24\46\1\50\uffc2\46",
        "\74\31\1\uffff\uffc2\31",
        "",
        "\1\104",
        "\1\105",
        "\74\31\1\uffff\4\31\32\107\6\31\32\107\uff84\31",
        "\74\31\1\uffff\4\31\32\111\6\31\32\111\uff84\31",
        "\1\uffff",
        "\12\113",
        "\60\31\12\57\2\31\1\uffff\uffc2\31",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\1\uffff",
        "\74\31\1\uffff\uffc2\31",
        "\1\uffff",
        "\74\31\1\uffff\uffc2\31",
        "\1\uffff",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "",
        "",
        "",
        "",
        "",
        "\74\31\1\uffff\uffc2\31",
        "\1\uffff",
        "",
        "\1\uffff",
        "\1\uffff",
        "\1\125",
        "\1\126",
        "\1\uffff",
        "\74\31\1\uffff\4\31\32\107\6\31\32\107\uff84\31",
        "\1\uffff",
        "\74\31\1\uffff\4\31\32\111\6\31\32\111\uff84\31",
        "",
        "\60\31\12\113\2\31\1\uffff\uffc2\31",
        "\1\uffff",
        "",
        "",
        "",
        "",
        "\1\uffff",
        "",
        "\1\uffff",
        "",
        "\74\31\1\uffff\uffc2\31",
        "\74\31\1\uffff\uffc2\31",
        "",
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
            return "1:1: Tokens : ( T26 | T27 | T28 | T29 | T30 | SEA | CODE_START | CODE_END | WS | DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | ECHO | SCALAR | ARRAY | NUMBER | MINUS | PLUS | MUL_OP | ASSIGN_OP | REL_OP | IF | ELSE );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        int LA12_44 = input.LA(1);
                        s = -1;
                        if ( ((LA12_44>='A' && LA12_44<='Z')||(LA12_44>='a' && LA12_44<='z')) && (( codeMode || !codeMode ))) {s = 73;}

                        else if ( ((LA12_44>='\u0000' && LA12_44<=';')||(LA12_44>='=' && LA12_44<='@')||(LA12_44>='[' && LA12_44<='`')||(LA12_44>='{' && LA12_44<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 72;

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        int LA12_31 = input.LA(1);
                        s = -1;
                        if ( (LA12_31=='\n') && (( codeMode || !codeMode ))) {s = 63;}

                        else if ( ((LA12_31>='\u0000' && LA12_31<='\t')||(LA12_31>='\u000B' && LA12_31<=';')||(LA12_31>='=' && LA12_31<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 64;

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 40;}

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 77;}

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        int LA12_46 = input.LA(1);
                        s = -1;
                        if ( ((LA12_46>='0' && LA12_46<='9')) && (( codeMode || !codeMode ))) {s = 75;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        int LA12_86 = input.LA(1);
                        s = -1;
                        if ( ((LA12_86>='\u0000' && LA12_86<=';')||(LA12_86>='=' && LA12_86<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 92;

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 65;}

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 94;}

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        int LA12_18 = input.LA(1);
                        s = -1;
                        if ( ((LA12_18>='\u0000' && LA12_18<=';')||(LA12_18>='=' && LA12_18<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 50;

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        int LA12_21 = input.LA(1);
                        s = -1;
                        if ( (LA12_21=='=') && (( codeMode || !codeMode ))) {s = 52;}

                        else if ( ((LA12_21>='\u0000' && LA12_21<=';')||(LA12_21>='>' && LA12_21<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 53;

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        int LA12_11 = input.LA(1);
                        s = -1;
                        if ( (LA12_11=='c') && (( codeMode || !codeMode ))) {s = 41;}

                        else if ( (LA12_11=='l') && (( codeMode || !codeMode ))) {s = 42;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA12_16 = input.LA(1);
                        s = -1;
                        if ( ((LA12_16>='\u0000' && LA12_16<=';')||(LA12_16>='=' && LA12_16<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 48;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        int LA12_35 = input.LA(1);
                        s = -1;
                        if ( (LA12_35=='\"') && (( codeMode || !codeMode ))) {s = 36;}

                        else if ( ((LA12_35>='\u0000' && LA12_35<='!')||(LA12_35>='#' && LA12_35<=';')||(LA12_35>='=' && LA12_35<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 35;}

                        else if ( (LA12_35=='<') && ( codeMode )) {s = 37;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        int LA12_2 = input.LA(1);
                        s = -1;
                        if ( ((LA12_2>='\u0000' && LA12_2<=';')||(LA12_2>='=' && LA12_2<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 27;

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        int LA12_3 = input.LA(1);
                        s = -1;
                        if ( ((LA12_3>='\u0000' && LA12_3<=';')||(LA12_3>='=' && LA12_3<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 28;

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        int LA12_19 = input.LA(1);
                        s = -1;
                        if ( ((LA12_19>='\u0000' && LA12_19<=';')||(LA12_19>='=' && LA12_19<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 51;

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        int LA12_36 = input.LA(1);
                        s = -1;
                        if ( ((LA12_36>='\u0000' && LA12_36<=';')||(LA12_36>='=' && LA12_36<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 66;

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        int LA12_52 = input.LA(1);
                        s = -1;
                        if ( ((LA12_52>='\u0000' && LA12_52<=';')||(LA12_52>='=' && LA12_52<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 81;

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        int LA12_22 = input.LA(1);
                        s = -1;
                        if ( (LA12_22=='=') ) {s = 54;}

                        else if ( ((LA12_22>='\u0000' && LA12_22<=';')||(LA12_22>='>' && LA12_22<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 55;

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        int LA12_10 = input.LA(1);
                        s = -1;
                        if ( ((LA12_10>='\u0000' && LA12_10<='&')||(LA12_10>='(' && LA12_10<=';')||(LA12_10>='=' && LA12_10<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 38;}

                        else if ( (LA12_10=='\'') && (( codeMode || !codeMode ))) {s = 39;}

                        else if ( (LA12_10=='<') && ( codeMode )) {s = 40;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        int LA12_54 = input.LA(1);
                        s = -1;
                        if ( ((LA12_54>='\u0000' && LA12_54<=';')||(LA12_54>='=' && LA12_54<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 55;

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        int LA12_9 = input.LA(1);
                        s = -1;
                        if ( ((LA12_9>='\u0000' && LA12_9<='!')||(LA12_9>='#' && LA12_9<=';')||(LA12_9>='=' && LA12_9<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 35;}

                        else if ( (LA12_9=='\"') && (( codeMode || !codeMode ))) {s = 36;}

                        else if ( (LA12_9=='<') && ( codeMode )) {s = 37;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( (true) ) {s = 89;}

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 74;}

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 59;}

                        else if ( ( !codeMode ) ) {s = 25;}

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        int LA12_24 = input.LA(1);
                        s = -1;
                        if ( (LA12_24=='f') && (( codeMode || !codeMode ))) {s = 57;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 93;}

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        int LA12_20 = input.LA(1);
                        s = -1;
                        if ( ((LA12_20>='\u0000' && LA12_20<=';')||(LA12_20>='=' && LA12_20<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 51;

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        int LA12_15 = input.LA(1);
                        s = -1;
                        if ( ((LA12_15>='0' && LA12_15<='9')) ) {s = 47;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        int LA12_14 = input.LA(1);
                        s = -1;
                        if ( (LA12_14=='.') && (( codeMode || !codeMode ))) {s = 46;}

                        else if ( ((LA12_14>='0' && LA12_14<='9')) && (( codeMode || !codeMode ))) {s = 14;}

                        else if ( ((LA12_14>='\u0000' && LA12_14<='-')||LA12_14=='/'||(LA12_14>=':' && LA12_14<=';')||(LA12_14>='=' && LA12_14<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 45;

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( (true) ) {s = 80;}

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 79;}

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        int LA12_73 = input.LA(1);
                        s = -1;
                        if ( ((LA12_73>='A' && LA12_73<='Z')||(LA12_73>='a' && LA12_73<='z')) && (( codeMode || !codeMode ))) {s = 73;}

                        else if ( ((LA12_73>='\u0000' && LA12_73<=';')||(LA12_73>='=' && LA12_73<='@')||(LA12_73>='[' && LA12_73<='`')||(LA12_73>='{' && LA12_73<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 72;

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 62;}

                        else if ( ( !codeMode ) ) {s = 25;}

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        int LA12_38 = input.LA(1);
                        s = -1;
                        if ( (LA12_38=='\'') && (( codeMode || !codeMode ))) {s = 39;}

                        else if ( ((LA12_38>='\u0000' && LA12_38<='&')||(LA12_38>='(' && LA12_38<=';')||(LA12_38>='=' && LA12_38<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 38;}

                        else if ( (LA12_38=='<') && ( codeMode )) {s = 40;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 33;}

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( (true) ) {s = 33;}

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 60;}

                        else if ( ( !codeMode ) ) {s = 25;}

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 84;}

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        int LA12_56 = input.LA(1);
                        s = -1;
                        if ( ((LA12_56>='\u0000' && LA12_56<=';')||(LA12_56>='=' && LA12_56<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 55;

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        int LA12_4 = input.LA(1);
                        s = -1;
                        if ( ((LA12_4>='\u0000' && LA12_4<=';')||(LA12_4>='=' && LA12_4<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 29;

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        int LA12_71 = input.LA(1);
                        s = -1;
                        if ( ((LA12_71>='A' && LA12_71<='Z')||(LA12_71>='a' && LA12_71<='z')) && (( codeMode || !codeMode ))) {s = 71;}

                        else if ( ((LA12_71>='\u0000' && LA12_71<=';')||(LA12_71>='=' && LA12_71<='@')||(LA12_71>='[' && LA12_71<='`')||(LA12_71>='{' && LA12_71<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 70;

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 82;}

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        int LA12_47 = input.LA(1);
                        s = -1;
                        if ( ((LA12_47>='0' && LA12_47<='9')) ) {s = 47;}

                        else if ( ((LA12_47>='\u0000' && LA12_47<='/')||(LA12_47>=':' && LA12_47<=';')||(LA12_47>='=' && LA12_47<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 76;

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        int LA12_68 = input.LA(1);
                        s = -1;
                        if ( (LA12_68=='o') && (( codeMode || !codeMode ))) {s = 85;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 45 : 
                        int LA12_1 = input.LA(1);
                        s = -1;
                        if ( ((LA12_1>='\u0000' && LA12_1<=';')||(LA12_1>='=' && LA12_1<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 46 : 
                        int LA12_75 = input.LA(1);
                        s = -1;
                        if ( ((LA12_75>='0' && LA12_75<='9')) && (( codeMode || !codeMode ))) {s = 75;}

                        else if ( ((LA12_75>='\u0000' && LA12_75<='/')||(LA12_75>=':' && LA12_75<=';')||(LA12_75>='=' && LA12_75<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 45;

                        if ( s>=0 ) return s;
                        break;
                    case 47 : 
                        int LA12_63 = input.LA(1);
                        s = -1;
                        if ( ((LA12_63>='\u0000' && LA12_63<=';')||(LA12_63>='=' && LA12_63<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 64;

                        if ( s>=0 ) return s;
                        break;
                    case 48 : 
                        int LA12_8 = input.LA(1);
                        s = -1;
                        if ( ((LA12_8>='\t' && LA12_8<='\n')||LA12_8=='\r'||LA12_8==' ') && (( codeMode || !codeMode ))) {s = 8;}

                        else if ( ((LA12_8>='\u0000' && LA12_8<='\b')||(LA12_8>='\u000B' && LA12_8<='\f')||(LA12_8>='\u000E' && LA12_8<='\u001F')||(LA12_8>='!' && LA12_8<=';')||(LA12_8>='=' && LA12_8<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 34;

                        if ( s>=0 ) return s;
                        break;
                    case 49 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 58;}

                        else if ( ( !codeMode ) ) {s = 25;}

                        if ( s>=0 ) return s;
                        break;
                    case 50 : 
                        int LA12_43 = input.LA(1);
                        s = -1;
                        if ( ((LA12_43>='A' && LA12_43<='Z')||(LA12_43>='a' && LA12_43<='z')) && (( codeMode || !codeMode ))) {s = 71;}

                        else if ( ((LA12_43>='\u0000' && LA12_43<=';')||(LA12_43>='=' && LA12_43<='@')||(LA12_43>='[' && LA12_43<='`')||(LA12_43>='{' && LA12_43<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 70;

                        if ( s>=0 ) return s;
                        break;
                    case 51 : 
                        int LA12_69 = input.LA(1);
                        s = -1;
                        if ( (LA12_69=='e') && (( codeMode || !codeMode ))) {s = 86;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 52 : 
                        int LA12_17 = input.LA(1);
                        s = -1;
                        if ( ((LA12_17>='\u0000' && LA12_17<=';')||(LA12_17>='=' && LA12_17<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 49;

                        if ( s>=0 ) return s;
                        break;
                    case 53 : 
                        int LA12_41 = input.LA(1);
                        s = -1;
                        if ( (LA12_41=='h') && (( codeMode || !codeMode ))) {s = 68;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 54 : 
                        int LA12_42 = input.LA(1);
                        s = -1;
                        if ( (LA12_42=='s') && (( codeMode || !codeMode ))) {s = 69;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 55 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 37;}

                        if ( s>=0 ) return s;
                        break;
                    case 56 : 
                        int LA12_13 = input.LA(1);
                        s = -1;
                        if ( ((LA12_13>='A' && LA12_13<='Z')||(LA12_13>='a' && LA12_13<='z')) && (( codeMode || !codeMode ))) {s = 44;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 57 : 
                        int LA12_57 = input.LA(1);
                        s = -1;
                        if ( ((LA12_57>='\u0000' && LA12_57<=';')||(LA12_57>='=' && LA12_57<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 83;

                        if ( s>=0 ) return s;
                        break;
                    case 58 : 
                        int LA12_5 = input.LA(1);
                        s = -1;
                        if ( ((LA12_5>='\u0000' && LA12_5<=';')||(LA12_5>='=' && LA12_5<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 30;

                        if ( s>=0 ) return s;
                        break;
                    case 59 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 78;}

                        if ( s>=0 ) return s;
                        break;
                    case 60 : 
                        int LA12_23 = input.LA(1);
                        s = -1;
                        if ( (LA12_23=='=') ) {s = 56;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 61 : 
                        int LA12_6 = input.LA(1);
                        s = -1;
                        if ( (LA12_6=='>') && (( codeMode || !codeMode ))) {s = 31;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 62 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 87;}

                        if ( s>=0 ) return s;
                        break;
                    case 63 : 
                        int LA12_12 = input.LA(1);
                        s = -1;
                        if ( ((LA12_12>='A' && LA12_12<='Z')||(LA12_12>='a' && LA12_12<='z')) && (( codeMode || !codeMode ))) {s = 43;}

                        else s = 25;

                        if ( s>=0 ) return s;
                        break;
                    case 64 : 
                        int LA12_39 = input.LA(1);
                        s = -1;
                        if ( ((LA12_39>='\u0000' && LA12_39<=';')||(LA12_39>='=' && LA12_39<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 67;

                        if ( s>=0 ) return s;
                        break;
                    case 65 : 
                        int LA12_85 = input.LA(1);
                        s = -1;
                        if ( ((LA12_85>='\u0000' && LA12_85<=';')||(LA12_85>='=' && LA12_85<='\uFFFE')) && ( !codeMode )) {s = 25;}

                        else s = 91;

                        if ( s>=0 ) return s;
                        break;
                    case 66 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 61;}

                        else if ( ( !codeMode ) ) {s = 25;}

                        if ( s>=0 ) return s;
                        break;
                    case 67 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 88;}

                        if ( s>=0 ) return s;
                        break;
                    case 68 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 25;}

                        else if ( ( codeMode ) ) {s = 90;}

                        if ( s>=0 ) return s;
                        break;
                    case 69 : 
                        int LA12_0 = input.LA(1);
                        s = -1;
                        if ( (LA12_0==';') ) {s = 1;}

                        else if ( (LA12_0=='(') ) {s = 2;}

                        else if ( (LA12_0==')') ) {s = 3;}

                        else if ( (LA12_0=='{') ) {s = 4;}

                        else if ( (LA12_0=='}') ) {s = 5;}

                        else if ( (LA12_0=='?') && (( codeMode || !codeMode ))) {s = 6;}

                        else if ( (LA12_0=='<') ) {s = 7;}

                        else if ( ((LA12_0>='\t' && LA12_0<='\n')||LA12_0=='\r'||LA12_0==' ') && (( codeMode || !codeMode ))) {s = 8;}

                        else if ( (LA12_0=='\"') && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( (LA12_0=='\'') && (( codeMode || !codeMode ))) {s = 10;}

                        else if ( (LA12_0=='e') && (( codeMode || !codeMode ))) {s = 11;}

                        else if ( (LA12_0=='$') && (( codeMode || !codeMode ))) {s = 12;}

                        else if ( (LA12_0=='@') && (( codeMode || !codeMode ))) {s = 13;}

                        else if ( ((LA12_0>='0' && LA12_0<='9')) && (( codeMode || !codeMode ))) {s = 14;}

                        else if ( (LA12_0=='.') ) {s = 15;}

                        else if ( (LA12_0=='-') && (( codeMode || !codeMode ))) {s = 16;}

                        else if ( (LA12_0=='+') && (( codeMode || !codeMode ))) {s = 17;}

                        else if ( (LA12_0=='*') && (( codeMode || !codeMode ))) {s = 18;}

                        else if ( (LA12_0=='/') ) {s = 19;}

                        else if ( (LA12_0=='%') ) {s = 20;}

                        else if ( (LA12_0=='=') && (( codeMode || !codeMode ))) {s = 21;}

                        else if ( (LA12_0=='>') ) {s = 22;}

                        else if ( (LA12_0=='!') ) {s = 23;}

                        else if ( (LA12_0=='i') && (( codeMode || !codeMode ))) {s = 24;}

                        else if ( ((LA12_0>='\u0000' && LA12_0<='\b')||(LA12_0>='\u000B' && LA12_0<='\f')||(LA12_0>='\u000E' && LA12_0<='\u001F')||LA12_0=='#'||LA12_0=='&'||LA12_0==','||LA12_0==':'||(LA12_0>='A' && LA12_0<='d')||(LA12_0>='f' && LA12_0<='h')||(LA12_0>='j' && LA12_0<='z')||LA12_0=='|'||(LA12_0>='~' && LA12_0<='\uFFFE')) && ( !codeMode )) {s = 25;}

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