// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-18 23:22:31

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

      public static boolean codeMode = false;

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
            // src/antlr3/Plumhead.g:28:15: ({...}? => (~ '<' )+ )
            // src/antlr3/Plumhead.g:28:15: {...}? => (~ '<' )+
            {
            if ( !( !codeMode ) ) {
                throw new FailedPredicateException(input, "SEA", " !codeMode ");
            }
            // src/antlr3/Plumhead.g:28:32: (~ '<' )+
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
            	    // src/antlr3/Plumhead.g:28:33: ~ '<'
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
            // src/antlr3/Plumhead.g:29:15: ( '<?php' )
            // src/antlr3/Plumhead.g:29:15: '<?php'
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
            // src/antlr3/Plumhead.g:30:15: ({...}? => '?>' )
            // src/antlr3/Plumhead.g:30:15: {...}? => '?>'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "CODE_END", " codeMode ");
            }
            match("?>"); 

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
            // src/antlr3/Plumhead.g:32:5: ({...}? => ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // src/antlr3/Plumhead.g:32:5: {...}? => ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "WS", " codeMode ");
            }
            // src/antlr3/Plumhead.g:33:5: ( (' '|'\\t'|'\\r'|'\\n'))+
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
            	    // src/antlr3/Plumhead.g:33:7: (' '|'\\t'|'\\r'|'\\n')
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
            // src/antlr3/Plumhead.g:38:14: ({...}? => '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:38:14: {...}? => '\\\"' (~ '\\\"' )* '\\\"'
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "STRING", " codeMode ");
            }
            match('\"'); 
            // src/antlr3/Plumhead.g:38:35: (~ '\\\"' )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>='\u0000' && LA3_0<='!')||(LA3_0>='#' && LA3_0<='\uFFFE')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:38:37: ~ '\\\"'
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
            // src/antlr3/Plumhead.g:39:14: ({...}? => 'echo' )
            // src/antlr3/Plumhead.g:39:14: {...}? => 'echo'
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
            // src/antlr3/Plumhead.g:42:11: ({...}? => ( '0' .. '9' )+ )
            // src/antlr3/Plumhead.g:42:11: {...}? => ( '0' .. '9' )+
            {
            if ( !( codeMode ) ) {
                throw new FailedPredicateException(input, "INTEGER", " codeMode ");
            }
            // src/antlr3/Plumhead.g:42:27: ( '0' .. '9' )+
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
            	    // src/antlr3/Plumhead.g:42:28: '0' .. '9'
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
            // src/antlr3/Plumhead.g:45:6: ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt6=2;
            int LA6_0 = input.LA(1);
            if ( ((LA6_0>='0' && LA6_0<='9')) && ( codeMode )) {
                alt6=1;
            }
            else if ( (LA6_0=='.') ) {
                alt6=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("44:1: NUMBER : ({...}? => INTEGER ( '.' INTEGER )? | '.' INTEGER );", 6, 0, input);

                throw nvae;
            }
            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:45:6: {...}? => INTEGER ( '.' INTEGER )?
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "NUMBER", " codeMode ");
                    }
                    mINTEGER(); 
                    // src/antlr3/Plumhead.g:45:31: ( '.' INTEGER )?
                    int alt5=2;
                    int LA5_0 = input.LA(1);
                    if ( (LA5_0=='.') ) {
                        alt5=1;
                    }
                    switch (alt5) {
                        case 1 :
                            // src/antlr3/Plumhead.g:45:32: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:46:7: '.' INTEGER
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
            // src/antlr3/Plumhead.g:49:13: ({...}? => '-' )
            // src/antlr3/Plumhead.g:49:13: {...}? => '-'
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
            // src/antlr3/Plumhead.g:50:13: ({...}? => '+' )
            // src/antlr3/Plumhead.g:50:13: {...}? => '+'
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
            // src/antlr3/Plumhead.g:51:13: ({...}? => '*' | '/' | '%' )
            int alt7=3;
            int LA7_0 = input.LA(1);
            if ( (LA7_0=='*') && ( codeMode )) {
                alt7=1;
            }
            else if ( (LA7_0=='/') ) {
                alt7=2;
            }
            else if ( (LA7_0=='%') ) {
                alt7=3;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("51:1: MUL_OP : ({...}? => '*' | '/' | '%' );", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:51:13: {...}? => '*'
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "MUL_OP", " codeMode ");
                    }
                    match('*'); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:51:37: '/'
                    {
                    match('/'); 

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:51:44: '%'
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
            // src/antlr3/Plumhead.g:52:13: ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' )
            int alt8=6;
            int LA8_0 = input.LA(1);
            if ( (LA8_0=='=') && ( codeMode )) {
                alt8=1;
            }
            else if ( (LA8_0=='<') ) {
                int LA8_2 = input.LA(2);
                if ( (LA8_2=='=') ) {
                    alt8=2;
                }
                else {
                    alt8=5;}
            }
            else if ( (LA8_0=='>') ) {
                int LA8_3 = input.LA(2);
                if ( (LA8_3=='=') ) {
                    alt8=3;
                }
                else {
                    alt8=6;}
            }
            else if ( (LA8_0=='!') ) {
                alt8=4;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("52:1: REL_OP : ({...}? => '==' | '<=' | '>=' | '!=' | '<' | '>' );", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:52:13: {...}? => '=='
                    {
                    if ( !( codeMode ) ) {
                        throw new FailedPredicateException(input, "REL_OP", " codeMode ");
                    }
                    match("=="); 


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:52:37: '<='
                    {
                    match("<="); 


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:52:44: '>='
                    {
                    match(">="); 


                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:52:51: '!='
                    {
                    match("!="); 


                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:52:58: '<'
                    {
                    match('<'); 

                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:52:65: '>'
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
        int alt9=14;
        alt9 = dfa9.predict(input);
        switch (alt9) {
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


    protected DFA9 dfa9 = new DFA9(this);
    public static final String DFA9_eotS =
        "\1\uffff\1\24\1\25\1\26\1\23\1\31\1\32\2\23\1\37\1\23\1\42\1\43"+
        "\1\44\2\45\1\23\1\50\1\23\4\uffff\1\55\3\uffff\1\23\1\57\1\uffff"+
        "\1\23\1\uffff\1\23\1\63\4\uffff\1\70\1\50\1\uffff\1\50\6\uffff\1"+
        "\23\1\uffff\1\37\7\uffff\1\74\3\uffff";
    public static final String DFA9_eofS =
        "\76\uffff";
    public static final String DFA9_minS =
        "\4\0\1\76\1\77\2\0\1\143\1\0\1\60\5\0\1\75\1\0\1\75\1\uffff\4\0"+
        "\2\uffff\3\0\1\uffff\1\150\1\0\1\60\11\0\3\uffff\1\0\1\uffff\1\0"+
        "\1\157\1\uffff\2\0\4\uffff\1\0\1\uffff\1\0\1\uffff\1\0\1\uffff";
    public static final String DFA9_maxS =
        "\4\ufffe\1\76\1\77\2\ufffe\1\143\1\ufffe\1\71\5\ufffe\1\75\1\ufffe"+
        "\1\75\1\uffff\3\0\1\ufffe\2\uffff\1\0\2\ufffe\1\uffff\1\150\1\0"+
        "\1\71\1\ufffe\4\0\2\ufffe\1\0\1\ufffe\3\uffff\1\0\1\uffff\1\0\1"+
        "\157\1\uffff\1\ufffe\1\0\4\uffff\1\0\1\uffff\1\ufffe\1\uffff\1\0"+
        "\1\uffff";
    public static final String DFA9_acceptS =
        "\23\uffff\1\4\4\uffff\1\5\1\16\3\uffff\1\10\14\uffff\1\1\1\2\1\3"+
        "\1\uffff\1\7\2\uffff\1\12\2\uffff\1\13\1\14\2\15\1\uffff\1\6\1\uffff"+
        "\1\12\1\uffff\1\11";
    public static final String DFA9_specialS =
        "\1\5\1\51\1\22\1\23\1\24\1\uffff\1\4\1\46\1\30\1\41\1\1\1\42\1\37"+
        "\1\21\1\16\1\11\1\3\1\2\1\13\1\uffff\1\40\1\15\1\45\1\7\2\uffff"+
        "\1\31\1\52\1\36\1\uffff\1\25\1\44\1\47\1\26\1\14\1\12\1\17\1\20"+
        "\1\35\1\32\1\34\1\27\3\uffff\1\0\1\uffff\1\53\1\54\1\uffff\1\10"+
        "\1\43\4\uffff\1\33\1\uffff\1\50\1\uffff\1\6\1\uffff}>";
    public static final String[] DFA9_transition = {
        "\11\23\2\6\2\23\1\6\22\23\1\6\1\22\1\7\2\23\1\17\2\23\1\2\1\3\1"+
        "\15\1\14\1\23\1\13\1\12\1\16\12\11\1\23\1\1\1\5\1\20\1\21\1\4\45"+
        "\23\1\10\uff99\23",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\74\23\1\uffff\uffc2\23",
        "\1\27",
        "\1\30",
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
        "\74\23\1\uffff\uffc2\23",
        "",
        "",
        "\1\uffff",
        "\42\33\1\34\31\33\1\35\uffc2\33",
        "\74\23\1\uffff\uffc2\23",
        "",
        "\1\60",
        "\1\uffff",
        "\12\62",
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
        "",
        "\1\uffff",
        "\1\72",
        "",
        "\60\23\12\62\2\23\1\uffff\uffc2\23",
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

    class DFA9 extends DFA {
        public DFA9(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 9;
            this.eot = DFA.unpackEncodedString(DFA9_eotS);
            this.eof = DFA.unpackEncodedString(DFA9_eofS);
            this.min = DFA.unpackEncodedStringToUnsignedChars(DFA9_minS);
            this.max = DFA.unpackEncodedStringToUnsignedChars(DFA9_maxS);
            this.accept = DFA.unpackEncodedString(DFA9_acceptS);
            this.special = DFA.unpackEncodedString(DFA9_specialS);
            int numStates = DFA9_transition.length;
            this.transition = new short[numStates][];
            for (int i=0; i<numStates; i++) {
                transition[i] = DFA.unpackEncodedString(DFA9_transition[i]);
            }
        }
        public String getDescription() {
            return "1:1: Tokens : ( T17 | T18 | T19 | SEA | CODE_START | CODE_END | WS | STRING | ECHO | NUMBER | MINUS | PLUS | MUL_OP | REL_OP );";
        }
        public int specialStateTransition(int s) throws NoViableAltException {
        	int _s = s;
            switch ( s ) {
                    case 0 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 57;}

                        if ( s>=0 ) return s;
                        break;
                    case 1 : 
                        int LA9_10 = input.LA(1);
                        s = -1;
                        if ( ((LA9_10>='0' && LA9_10<='9')) ) {s = 33;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 2 : 
                        int LA9_17 = input.LA(1);
                        s = -1;
                        if ( (LA9_17=='=') ) {s = 39;}

                        else if ( ((LA9_17>='\u0000' && LA9_17<=';')||(LA9_17>='>' && LA9_17<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 40;

                        if ( s>=0 ) return s;
                        break;
                    case 3 : 
                        int LA9_16 = input.LA(1);
                        s = -1;
                        if ( (LA9_16=='=') && (( codeMode || !codeMode ))) {s = 38;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 4 : 
                        int LA9_6 = input.LA(1);
                        s = -1;
                        if ( ((LA9_6>='\t' && LA9_6<='\n')||LA9_6=='\r'||LA9_6==' ') && (( codeMode || !codeMode ))) {s = 6;}

                        else if ( ((LA9_6>='\u0000' && LA9_6<='\b')||(LA9_6>='\u000B' && LA9_6<='\f')||(LA9_6>='\u000E' && LA9_6<='\u001F')||(LA9_6>='!' && LA9_6<=';')||(LA9_6>='=' && LA9_6<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 26;

                        if ( s>=0 ) return s;
                        break;
                    case 5 : 
                        int LA9_0 = input.LA(1);
                        s = -1;
                        if ( (LA9_0==';') ) {s = 1;}

                        else if ( (LA9_0=='(') ) {s = 2;}

                        else if ( (LA9_0==')') ) {s = 3;}

                        else if ( (LA9_0=='?') && (( codeMode || !codeMode ))) {s = 4;}

                        else if ( (LA9_0=='<') ) {s = 5;}

                        else if ( ((LA9_0>='\t' && LA9_0<='\n')||LA9_0=='\r'||LA9_0==' ') && (( codeMode || !codeMode ))) {s = 6;}

                        else if ( (LA9_0=='\"') && (( codeMode || !codeMode ))) {s = 7;}

                        else if ( (LA9_0=='e') && (( codeMode || !codeMode ))) {s = 8;}

                        else if ( ((LA9_0>='0' && LA9_0<='9')) && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( (LA9_0=='.') ) {s = 10;}

                        else if ( (LA9_0=='-') && (( codeMode || !codeMode ))) {s = 11;}

                        else if ( (LA9_0=='+') && (( codeMode || !codeMode ))) {s = 12;}

                        else if ( (LA9_0=='*') && (( codeMode || !codeMode ))) {s = 13;}

                        else if ( (LA9_0=='/') ) {s = 14;}

                        else if ( (LA9_0=='%') ) {s = 15;}

                        else if ( (LA9_0=='=') && (( codeMode || !codeMode ))) {s = 16;}

                        else if ( (LA9_0=='>') ) {s = 17;}

                        else if ( (LA9_0=='!') ) {s = 18;}

                        else if ( ((LA9_0>='\u0000' && LA9_0<='\b')||(LA9_0>='\u000B' && LA9_0<='\f')||(LA9_0>='\u000E' && LA9_0<='\u001F')||(LA9_0>='#' && LA9_0<='$')||(LA9_0>='&' && LA9_0<='\'')||LA9_0==','||LA9_0==':'||(LA9_0>='@' && LA9_0<='d')||(LA9_0>='f' && LA9_0<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        if ( s>=0 ) return s;
                        break;
                    case 6 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 61;}

                        if ( s>=0 ) return s;
                        break;
                    case 7 : 
                        int LA9_23 = input.LA(1);
                        s = -1;
                        if ( ((LA9_23>='\u0000' && LA9_23<=';')||(LA9_23>='=' && LA9_23<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 45;

                        if ( s>=0 ) return s;
                        break;
                    case 8 : 
                        int LA9_50 = input.LA(1);
                        s = -1;
                        if ( ((LA9_50>='0' && LA9_50<='9')) && (( codeMode || !codeMode ))) {s = 50;}

                        else if ( ((LA9_50>='\u0000' && LA9_50<='/')||(LA9_50>=':' && LA9_50<=';')||(LA9_50>='=' && LA9_50<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 31;

                        if ( s>=0 ) return s;
                        break;
                    case 9 : 
                        int LA9_15 = input.LA(1);
                        s = -1;
                        if ( ((LA9_15>='\u0000' && LA9_15<=';')||(LA9_15>='=' && LA9_15<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 37;

                        if ( s>=0 ) return s;
                        break;
                    case 10 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 53;}

                        if ( s>=0 ) return s;
                        break;
                    case 11 : 
                        int LA9_18 = input.LA(1);
                        s = -1;
                        if ( (LA9_18=='=') ) {s = 41;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 12 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 52;}

                        if ( s>=0 ) return s;
                        break;
                    case 13 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 43;}

                        else if ( ( !codeMode ) ) {s = 19;}

                        if ( s>=0 ) return s;
                        break;
                    case 14 : 
                        int LA9_14 = input.LA(1);
                        s = -1;
                        if ( ((LA9_14>='\u0000' && LA9_14<=';')||(LA9_14>='=' && LA9_14<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 37;

                        if ( s>=0 ) return s;
                        break;
                    case 15 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 54;}

                        if ( s>=0 ) return s;
                        break;
                    case 16 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( (true) ) {s = 55;}

                        if ( s>=0 ) return s;
                        break;
                    case 17 : 
                        int LA9_13 = input.LA(1);
                        s = -1;
                        if ( ((LA9_13>='\u0000' && LA9_13<=';')||(LA9_13>='=' && LA9_13<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 36;

                        if ( s>=0 ) return s;
                        break;
                    case 18 : 
                        int LA9_2 = input.LA(1);
                        s = -1;
                        if ( ((LA9_2>='\u0000' && LA9_2<=';')||(LA9_2>='=' && LA9_2<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 21;

                        if ( s>=0 ) return s;
                        break;
                    case 19 : 
                        int LA9_3 = input.LA(1);
                        s = -1;
                        if ( ((LA9_3>='\u0000' && LA9_3<=';')||(LA9_3>='=' && LA9_3<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 22;

                        if ( s>=0 ) return s;
                        break;
                    case 20 : 
                        int LA9_4 = input.LA(1);
                        s = -1;
                        if ( (LA9_4=='>') && (( codeMode || !codeMode ))) {s = 23;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 21 : 
                        int LA9_30 = input.LA(1);
                        s = -1;
                        if ( (LA9_30=='h') && (( codeMode || !codeMode ))) {s = 48;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 22 : 
                        int LA9_33 = input.LA(1);
                        s = -1;
                        if ( ((LA9_33>='0' && LA9_33<='9')) ) {s = 33;}

                        else if ( ((LA9_33>='\u0000' && LA9_33<='/')||(LA9_33>=':' && LA9_33<=';')||(LA9_33>='=' && LA9_33<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 51;

                        if ( s>=0 ) return s;
                        break;
                    case 23 : 
                        int LA9_41 = input.LA(1);
                        s = -1;
                        if ( ((LA9_41>='\u0000' && LA9_41<=';')||(LA9_41>='=' && LA9_41<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 40;

                        if ( s>=0 ) return s;
                        break;
                    case 24 : 
                        int LA9_8 = input.LA(1);
                        s = -1;
                        if ( (LA9_8=='c') && (( codeMode || !codeMode ))) {s = 30;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 25 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 46;}

                        if ( s>=0 ) return s;
                        break;
                    case 26 : 
                        int LA9_39 = input.LA(1);
                        s = -1;
                        if ( ((LA9_39>='\u0000' && LA9_39<=';')||(LA9_39>='=' && LA9_39<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 40;

                        if ( s>=0 ) return s;
                        break;
                    case 27 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 25;}

                        if ( s>=0 ) return s;
                        break;
                    case 28 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( (true) ) {s = 25;}

                        if ( s>=0 ) return s;
                        break;
                    case 29 : 
                        int LA9_38 = input.LA(1);
                        s = -1;
                        if ( ((LA9_38>='\u0000' && LA9_38<=';')||(LA9_38>='=' && LA9_38<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 56;

                        if ( s>=0 ) return s;
                        break;
                    case 30 : 
                        int LA9_28 = input.LA(1);
                        s = -1;
                        if ( ((LA9_28>='\u0000' && LA9_28<=';')||(LA9_28>='=' && LA9_28<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 47;

                        if ( s>=0 ) return s;
                        break;
                    case 31 : 
                        int LA9_12 = input.LA(1);
                        s = -1;
                        if ( ((LA9_12>='\u0000' && LA9_12<=';')||(LA9_12>='=' && LA9_12<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 35;

                        if ( s>=0 ) return s;
                        break;
                    case 32 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 42;}

                        else if ( ( !codeMode ) ) {s = 19;}

                        if ( s>=0 ) return s;
                        break;
                    case 33 : 
                        int LA9_9 = input.LA(1);
                        s = -1;
                        if ( (LA9_9=='.') && (( codeMode || !codeMode ))) {s = 32;}

                        else if ( ((LA9_9>='0' && LA9_9<='9')) && (( codeMode || !codeMode ))) {s = 9;}

                        else if ( ((LA9_9>='\u0000' && LA9_9<='-')||LA9_9=='/'||(LA9_9>=':' && LA9_9<=';')||(LA9_9>='=' && LA9_9<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 31;

                        if ( s>=0 ) return s;
                        break;
                    case 34 : 
                        int LA9_11 = input.LA(1);
                        s = -1;
                        if ( ((LA9_11>='\u0000' && LA9_11<=';')||(LA9_11>='=' && LA9_11<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 34;

                        if ( s>=0 ) return s;
                        break;
                    case 35 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( (true) ) {s = 59;}

                        if ( s>=0 ) return s;
                        break;
                    case 36 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 49;}

                        if ( s>=0 ) return s;
                        break;
                    case 37 : 
                        input.rewind();
                        s = -1;
                        if ( (!( !codeMode )) ) {s = 44;}

                        else if ( ( !codeMode ) ) {s = 19;}

                        if ( s>=0 ) return s;
                        break;
                    case 38 : 
                        int LA9_7 = input.LA(1);
                        s = -1;
                        if ( ((LA9_7>='\u0000' && LA9_7<='!')||(LA9_7>='#' && LA9_7<=';')||(LA9_7>='=' && LA9_7<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 27;}

                        else if ( (LA9_7=='\"') && (( codeMode || !codeMode ))) {s = 28;}

                        else if ( (LA9_7=='<') && ( codeMode )) {s = 29;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 39 : 
                        int LA9_32 = input.LA(1);
                        s = -1;
                        if ( ((LA9_32>='0' && LA9_32<='9')) && (( codeMode || !codeMode ))) {s = 50;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 40 : 
                        int LA9_58 = input.LA(1);
                        s = -1;
                        if ( ((LA9_58>='\u0000' && LA9_58<=';')||(LA9_58>='=' && LA9_58<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 60;

                        if ( s>=0 ) return s;
                        break;
                    case 41 : 
                        int LA9_1 = input.LA(1);
                        s = -1;
                        if ( ((LA9_1>='\u0000' && LA9_1<=';')||(LA9_1>='=' && LA9_1<='\uFFFE')) && ( !codeMode )) {s = 19;}

                        else s = 20;

                        if ( s>=0 ) return s;
                        break;
                    case 42 : 
                        int LA9_27 = input.LA(1);
                        s = -1;
                        if ( (LA9_27=='\"') && (( codeMode || !codeMode ))) {s = 28;}

                        else if ( ((LA9_27>='\u0000' && LA9_27<='!')||(LA9_27>='#' && LA9_27<=';')||(LA9_27>='=' && LA9_27<='\uFFFE')) && (( codeMode || !codeMode ))) {s = 27;}

                        else if ( (LA9_27=='<') && ( codeMode )) {s = 29;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
                    case 43 : 
                        input.rewind();
                        s = -1;
                        if ( ( !codeMode ) ) {s = 19;}

                        else if ( ( codeMode ) ) {s = 29;}

                        if ( s>=0 ) return s;
                        break;
                    case 44 : 
                        int LA9_48 = input.LA(1);
                        s = -1;
                        if ( (LA9_48=='o') && (( codeMode || !codeMode ))) {s = 58;}

                        else s = 19;

                        if ( s>=0 ) return s;
                        break;
            }
            NoViableAltException nvae =
                new NoViableAltException(getDescription(), 9, _s, input);
            error(nvae);
            throw nvae;
        }
    }
 

}