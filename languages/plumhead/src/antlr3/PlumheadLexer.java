// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-06 20:10:29

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int CODE_START=6;
    public static final int ECHO=10;
    public static final int T11=11;
    public static final int EOF=-1;
    public static final int WS=8;
    public static final int STRING=9;
    public static final int Tokens=12;
    public static final int SEA=5;
    public static final int CODE_END=7;
    public static final int PROGRAM=4;
    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start T11
    public void mT11() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = T11;
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
    // $ANTLR end T11

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
                                        if ( ((LA1_7>='\u0000' && LA1_7<='`')||(LA1_7>='b' && LA1_7<='\uFFFE')) ) {
                                            alt1=1;
                                        }
                                        else if ( (LA1_7=='a') ) {
                                            alt1=2;
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
            // src/antlr3/Plumhead.g:26:14: ( ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // src/antlr3/Plumhead.g:26:14: ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            // src/antlr3/Plumhead.g:26:14: ( (' '|'\\t'|'\\r'|'\\n'))+
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
            	    // src/antlr3/Plumhead.g:26:16: (' '|'\\t'|'\\r'|'\\n')
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
            // src/antlr3/Plumhead.g:27:14: ( '\\\"' (~ '\\\"' )* '\\\"' )
            // src/antlr3/Plumhead.g:27:14: '\\\"' (~ '\\\"' )* '\\\"'
            {
            match('\"'); 
            // src/antlr3/Plumhead.g:27:19: (~ '\\\"' )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>='\u0000' && LA3_0<='!')||(LA3_0>='#' && LA3_0<='\uFFFE')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:27:21: ~ '\\\"'
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
            // src/antlr3/Plumhead.g:28:14: ( 'echo' )
            // src/antlr3/Plumhead.g:28:14: 'echo'
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

    public void mTokens() throws RecognitionException {
        // src/antlr3/Plumhead.g:1:10: ( T11 | SEA | CODE_START | CODE_END | WS | STRING | ECHO )
        int alt4=7;
        switch ( input.LA(1) ) {
        case ';':
            alt4=1;
            break;
        case 's':
            alt4=2;
            break;
        case '<':
            alt4=3;
            break;
        case '?':
            alt4=4;
            break;
        case '\t':
        case '\n':
        case '\r':
        case ' ':
            alt4=5;
            break;
        case '\"':
            alt4=6;
            break;
        case 'e':
            alt4=7;
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T11 | SEA | CODE_START | CODE_END | WS | STRING | ECHO );", 4, 0, input);

            throw nvae;
        }

        switch (alt4) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: T11
                {
                mT11(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: SEA
                {
                mSEA(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:18: CODE_START
                {
                mCODE_START(); 

                }
                break;
            case 4 :
                // src/antlr3/Plumhead.g:1:29: CODE_END
                {
                mCODE_END(); 

                }
                break;
            case 5 :
                // src/antlr3/Plumhead.g:1:38: WS
                {
                mWS(); 

                }
                break;
            case 6 :
                // src/antlr3/Plumhead.g:1:41: STRING
                {
                mSTRING(); 

                }
                break;
            case 7 :
                // src/antlr3/Plumhead.g:1:48: ECHO
                {
                mECHO(); 

                }
                break;

        }

    }


 

}