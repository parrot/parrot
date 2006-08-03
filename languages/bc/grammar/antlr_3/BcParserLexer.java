// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-03 20:27:04

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class BcParserLexer extends Lexer {
    public static final int INTEGER=8;
    public static final int MINUS=6;
    public static final int EOF=-1;
    public static final int WS=10;
    public static final int NUMBER=7;
    public static final int T12=12;
    public static final int Tokens=14;
    public static final int PLUS=5;
    public static final int ML_COMMENT=9;
    public static final int T13=13;
    public static final int PROGRAM=4;
    public static final int NEWLINE=11;
    public BcParserLexer() {;} 
    public BcParserLexer(CharStream input) {
        super(input);
    }
    public String getGrammarFileName() { return "grammar/antlr_3/bc.g"; }

    // $ANTLR start T12
    public void mT12() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T12;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:3:7: ( ';' )
            // grammar/antlr_3/bc.g:3:7: ';'
            {
            match(';'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T12

    // $ANTLR start T13
    public void mT13() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = T13;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:4:7: ( 'quit' )
            // grammar/antlr_3/bc.g:4:7: 'quit'
            {
            match("quit"); 


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end T13

    // $ANTLR start NUMBER
    public void mNUMBER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NUMBER;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:60:5: ( INTEGER ( '.' INTEGER )? | '.' INTEGER )
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( ((LA2_0>='0' && LA2_0<='9')||(LA2_0>='A' && LA2_0<='F')) ) {
                alt2=1;
            }
            else if ( (LA2_0=='.') ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("59:1: NUMBER : ( INTEGER ( '.' INTEGER )? | '.' INTEGER );", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // grammar/antlr_3/bc.g:60:5: INTEGER ( '.' INTEGER )?
                    {
                    mINTEGER(); 
                    // grammar/antlr_3/bc.g:60:13: ( '.' INTEGER )?
                    int alt1=2;
                    int LA1_0 = input.LA(1);
                    if ( (LA1_0=='.') ) {
                        alt1=1;
                    }
                    switch (alt1) {
                        case 1 :
                            // grammar/antlr_3/bc.g:60:14: '.' INTEGER
                            {
                            match('.'); 
                            mINTEGER(); 

                            }
                            break;

                    }


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:62:5: '.' INTEGER
                    {
                    match('.'); 
                    mINTEGER(); 

                    }
                    break;

            }


                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end NUMBER

    // $ANTLR start INTEGER
    public void mINTEGER() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = INTEGER;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:66:5: ( ( ('0'..'9'|'A'..'F'))+ )
            // grammar/antlr_3/bc.g:66:5: ( ('0'..'9'|'A'..'F'))+
            {
            // grammar/antlr_3/bc.g:66:5: ( ('0'..'9'|'A'..'F'))+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>='0' && LA3_0<='9')||(LA3_0>='A' && LA3_0<='F')) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:66:6: ('0'..'9'|'A'..'F')
            	    {
            	    if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='F') ) {
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


            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end INTEGER

    // $ANTLR start MINUS
    public void mMINUS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = MINUS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:70:5: ( '-' )
            // grammar/antlr_3/bc.g:70:5: '-'
            {
            match('-'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
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
            int type = PLUS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:74:5: ( '+' )
            // grammar/antlr_3/bc.g:74:5: '+'
            {
            match('+'); 

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end PLUS

    // $ANTLR start ML_COMMENT
    public void mML_COMMENT() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = ML_COMMENT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:84:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // grammar/antlr_3/bc.g:84:5: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // grammar/antlr_3/bc.g:84:10: ( options {greedy=false; } : . )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( (LA4_0=='*') ) {
                    int LA4_1 = input.LA(2);
                    if ( (LA4_1=='/') ) {
                        alt4=2;
                    }
                    else if ( ((LA4_1>='\u0000' && LA4_1<='.')||(LA4_1>='0' && LA4_1<='\uFFFE')) ) {
                        alt4=1;
                    }


                }
                else if ( ((LA4_0>='\u0000' && LA4_0<=')')||(LA4_0>='+' && LA4_0<='\uFFFE')) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:84:38: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop4;
                }
            } while (true);

            match("*/"); 


                  channel = 99;       // send into nirwana 
                

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end ML_COMMENT

    // $ANTLR start WS
    public void mWS() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = WS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:92:5: ( ( (' '|'\\t'|'\\r'|'\\n'))+ )
            // grammar/antlr_3/bc.g:92:5: ( (' '|'\\t'|'\\r'|'\\n'))+
            {
            // grammar/antlr_3/bc.g:92:5: ( (' '|'\\t'|'\\r'|'\\n'))+
            int cnt5=0;
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>='\t' && LA5_0<='\n')||LA5_0=='\r'||LA5_0==' ') ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:92:9: (' '|'\\t'|'\\r'|'\\n')
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
            	    if ( cnt5 >= 1 ) break loop5;
                        EarlyExitException eee =
                            new EarlyExitException(5, input);
                        throw eee;
                }
                cnt5++;
            } while (true);


                  channel = 99;       // send into nirwana 
                

            }



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end WS

    // $ANTLR start NEWLINE
    public void mNEWLINE() throws RecognitionException {
        try {
            ruleNestingLevel++;
            int type = NEWLINE;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:104:5: ( ( '\\r' )? ( '\\n' )+ )
            // grammar/antlr_3/bc.g:104:5: ( '\\r' )? ( '\\n' )+
            {
            // grammar/antlr_3/bc.g:104:5: ( '\\r' )?
            int alt6=2;
            int LA6_0 = input.LA(1);
            if ( (LA6_0=='\r') ) {
                alt6=1;
            }
            switch (alt6) {
                case 1 :
                    // grammar/antlr_3/bc.g:104:6: '\\r'
                    {
                    match('\r'); 

                    }
                    break;

            }

            // grammar/antlr_3/bc.g:104:13: ( '\\n' )+
            int cnt7=0;
            loop7:
            do {
                int alt7=2;
                int LA7_0 = input.LA(1);
                if ( (LA7_0=='\n') ) {
                    alt7=1;
                }


                switch (alt7) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:104:13: '\\n'
            	    {
            	    match('\n'); 

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



                    if ( token==null && ruleNestingLevel==1 ) {
                        emit(type,line,charPosition,channel,start,getCharIndex()-1);
                    }

                        }
        finally {
            ruleNestingLevel--;
        }
    }
    // $ANTLR end NEWLINE

    public void mTokens() throws RecognitionException {
        // grammar/antlr_3/bc.g:1:10: ( T12 | T13 | NUMBER | INTEGER | MINUS | PLUS | ML_COMMENT | WS | NEWLINE )
        int alt8=9;
        alt8 = dfa8.predict(input);
        switch (alt8) {
            case 1 :
                // grammar/antlr_3/bc.g:1:10: T12
                {
                mT12(); 

                }
                break;
            case 2 :
                // grammar/antlr_3/bc.g:1:14: T13
                {
                mT13(); 

                }
                break;
            case 3 :
                // grammar/antlr_3/bc.g:1:18: NUMBER
                {
                mNUMBER(); 

                }
                break;
            case 4 :
                // grammar/antlr_3/bc.g:1:25: INTEGER
                {
                mINTEGER(); 

                }
                break;
            case 5 :
                // grammar/antlr_3/bc.g:1:33: MINUS
                {
                mMINUS(); 

                }
                break;
            case 6 :
                // grammar/antlr_3/bc.g:1:39: PLUS
                {
                mPLUS(); 

                }
                break;
            case 7 :
                // grammar/antlr_3/bc.g:1:44: ML_COMMENT
                {
                mML_COMMENT(); 

                }
                break;
            case 8 :
                // grammar/antlr_3/bc.g:1:55: WS
                {
                mWS(); 

                }
                break;
            case 9 :
                // grammar/antlr_3/bc.g:1:58: NEWLINE
                {
                mNEWLINE(); 

                }
                break;

        }

    }


    protected DFA8 dfa8 = new DFA8(this);
    public static final String DFA8_eotS =
        "\3\uffff\1\4\4\uffff\2\12\1\uffff";
    public static final String DFA8_eofS =
        "\13\uffff";
    public static final String DFA8_minS =
        "\1\11\2\uffff\1\60\4\uffff\2\12\1\uffff";
    public static final String DFA8_maxS =
        "\1\161\2\uffff\1\106\4\uffff\2\12\1\uffff";
    public static final String DFA8_acceptS =
        "\1\uffff\1\1\1\2\1\uffff\1\3\1\5\1\6\1\7\2\uffff\1\10";
    public static final String DFA8_specialS =
        "\13\uffff}>";
    public static final String[] DFA8_transition = {
        "\1\12\1\11\2\uffff\1\10\22\uffff\1\12\12\uffff\1\6\1\uffff\1\5\1"+
        "\4\1\7\12\3\1\uffff\1\1\5\uffff\6\3\52\uffff\1\2",
        "",
        "",
        "\12\3\7\uffff\6\3",
        "",
        "",
        "",
        "",
        "\1\11",
        "\1\11",
        ""
    };

    class DFA8 extends DFA {
        public DFA8(BaseRecognizer recognizer) {
            this.recognizer = recognizer;
            this.decisionNumber = 8;
            this.eot = DFA.unpackEncodedString(DFA8_eotS);
            this.eof = DFA.unpackEncodedString(DFA8_eofS);
            this.min = DFA.unpackEncodedStringToUnsignedChars(DFA8_minS);
            this.max = DFA.unpackEncodedStringToUnsignedChars(DFA8_maxS);
            this.accept = DFA.unpackEncodedString(DFA8_acceptS);
            this.special = DFA.unpackEncodedString(DFA8_specialS);
            int numStates = DFA8_transition.length;
            this.transition = new short[numStates][];
            for (int i=0; i<numStates; i++) {
                transition[i] = DFA.unpackEncodedString(DFA8_transition[i]);
            }
        }
        public String getDescription() {
            return "1:1: Tokens : ( T12 | T13 | NUMBER | INTEGER | MINUS | PLUS | ML_COMMENT | WS | NEWLINE );";
        }
    }
 

}