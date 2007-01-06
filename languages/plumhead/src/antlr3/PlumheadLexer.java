// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-06 14:04:04

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class PlumheadLexer extends Lexer {
    public static final int START_CODE=4;
    public static final int EOF=-1;
    public static final int PHP_CODE=6;
    public static final int Tokens=8;
    public static final int SEA=5;
    public static final int NEWLINE=7;
    public PlumheadLexer() {;} 
    public PlumheadLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }

    // $ANTLR start SEA
    public void mSEA() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = SEA;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:22:14: ( 'start_sea' ( options {greedy=false; } : . )* 'end_sea' )
            // src/antlr3/Plumhead.g:22:14: 'start_sea' ( options {greedy=false; } : . )* 'end_sea'
            {
            match("start_sea"); 

            // src/antlr3/Plumhead.g:22:26: ( options {greedy=false; } : . )*
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
                                        if ( (LA1_7=='a') ) {
                                            alt1=2;
                                        }
                                        else if ( ((LA1_7>='\u0000' && LA1_7<='`')||(LA1_7>='b' && LA1_7<='\uFFFE')) ) {
                                            alt1=1;
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
            	    // src/antlr3/Plumhead.g:22:54: .
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

    // $ANTLR start PHP_CODE
    public void mPHP_CODE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = PHP_CODE;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:23:14: ( '<?php' ( options {greedy=false; } : . )* '?>' )
            // src/antlr3/Plumhead.g:23:14: '<?php' ( options {greedy=false; } : . )* '?>'
            {
            match("<?php"); 

            // src/antlr3/Plumhead.g:23:22: ( options {greedy=false; } : . )*
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);
                if ( (LA2_0=='?') ) {
                    int LA2_1 = input.LA(2);
                    if ( (LA2_1=='>') ) {
                        alt2=2;
                    }
                    else if ( ((LA2_1>='\u0000' && LA2_1<='=')||(LA2_1>='?' && LA2_1<='\uFFFE')) ) {
                        alt2=1;
                    }


                }
                else if ( ((LA2_0>='\u0000' && LA2_0<='>')||(LA2_0>='@' && LA2_0<='\uFFFE')) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:23:50: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop2;
                }
            } while (true);

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
    // $ANTLR end PHP_CODE

    // $ANTLR start NEWLINE
    public void mNEWLINE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int _type = NEWLINE;
            int _start = getCharIndex();
            int _line = getLine();
            int _charPosition = getCharPositionInLine();
            int _channel = Token.DEFAULT_CHANNEL;
            // src/antlr3/Plumhead.g:24:14: ( '\\n' )
            // src/antlr3/Plumhead.g:24:14: '\\n'
            {
            match('\n'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(_type,_line,_charPosition,_channel,_start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end NEWLINE

    public void mTokens() throws RecognitionException {
        // src/antlr3/Plumhead.g:1:10: ( SEA | PHP_CODE | NEWLINE )
        int alt3=3;
        switch ( input.LA(1) ) {
        case 's':
            alt3=1;
            break;
        case '<':
            alt3=2;
            break;
        case '\n':
            alt3=3;
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( SEA | PHP_CODE | NEWLINE );", 3, 0, input);

            throw nvae;
        }

        switch (alt3) {
            case 1 :
                // src/antlr3/Plumhead.g:1:10: SEA
                {
                mSEA(); 

                }
                break;
            case 2 :
                // src/antlr3/Plumhead.g:1:14: PHP_CODE
                {
                mPHP_CODE(); 

                }
                break;
            case 3 :
                // src/antlr3/Plumhead.g:1:23: NEWLINE
                {
                mNEWLINE(); 

                }
                break;

        }

    }


 

}