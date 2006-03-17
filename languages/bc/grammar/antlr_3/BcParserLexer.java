// $ANTLR 3.0ea8 grammar/antlr_3/bc.g 2006-03-17 18:45:45

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class BcParserLexer extends Lexer {
    public static final int T10=10;
    public static final int UNARY_MINUS=5;
    public static final int T9=9;
    public static final int INT=6;
    public static final int EOF=-1;
    public static final int WS=8;
    public static final int Tokens=11;
    public static final int ML_COMMENT=7;
    public static final int PROGRAM=4;
    public BcParserLexer() {;} 
    public BcParserLexer(CharStream input) {
        super(input);
    }


    // $ANTLR start T9
    public void mT9() throws RecognitionException {
        try {
            int type = T9;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:3:6: ( '-' )
            // grammar/antlr_3/bc.g:3:6: '-'
            {
            match('-'); 

            }

            if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
        }
        finally {
        }
    }
    // $ANTLR end T9


    // $ANTLR start T10
    public void mT10() throws RecognitionException {
        try {
            int type = T10;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:4:7: ( 'quit' )
            // grammar/antlr_3/bc.g:4:7: 'quit'
            {
            match("quit"); 


            }

            if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
        }
        finally {
        }
    }
    // $ANTLR end T10


    // $ANTLR start INT
    public void mINT() throws RecognitionException {
        try {
            int type = INT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:36:4: ( ( '0' .. '9' )+ )
            // grammar/antlr_3/bc.g:36:4: ( '0' .. '9' )+
            {
            // grammar/antlr_3/bc.g:36:4: ( '0' .. '9' )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( (LA1_0>='0' && LA1_0<='9') ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:36:5: '0' .. '9'
            	    {
            	    matchRange('0','9'); 

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

            if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
        }
        finally {
        }
    }
    // $ANTLR end INT


    // $ANTLR start ML_COMMENT
    public void mML_COMMENT() throws RecognitionException {
        try {
            int type = ML_COMMENT;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:48:5: ( '/*' ( options {greedy=false; } : . )* '*/' )
            // grammar/antlr_3/bc.g:48:5: '/*' ( options {greedy=false; } : . )* '*/'
            {
            match("/*"); 

            // grammar/antlr_3/bc.g:49:5: ( options {greedy=false; } : . )*
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);
                if ( LA2_0=='*' ) {
                    int LA2_1 = input.LA(2);
                    if ( LA2_1=='/' ) {
                        alt2=2;
                    }
                    else if ( (LA2_1>='\u0000' && LA2_1<='.')||(LA2_1>='0' && LA2_1<='\uFFFE') ) {
                        alt2=1;
                    }


                }
                else if ( (LA2_0>='\u0000' && LA2_0<=')')||(LA2_0>='+' && LA2_0<='\uFFFE') ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:49:33: .
            	    {
            	    matchAny(); 

            	    }
            	    break;

            	default :
            	    break loop2;
                }
            } while (true);

            match("*/"); 


                  channel = 99;       // send into nirwana 
                

            }

            if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
        }
        finally {
        }
    }
    // $ANTLR end ML_COMMENT


    // $ANTLR start WS
    public void mWS() throws RecognitionException {
        try {
            int type = WS;
            int start = getCharIndex();
            int line = getLine();
            int charPosition = getCharPositionInLine();
            int channel = Token.DEFAULT_CHANNEL;
            // grammar/antlr_3/bc.g:57:5: ( ( (' '|'\t'|'\r'|'\n'))+ )
            // grammar/antlr_3/bc.g:57:5: ( (' '|'\t'|'\r'|'\n'))+
            {
            // grammar/antlr_3/bc.g:57:5: ( (' '|'\t'|'\r'|'\n'))+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( (LA3_0>='\t' && LA3_0<='\n')||LA3_0=='\r'||LA3_0==' ' ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:57:9: (' '|'\t'|'\r'|'\n')
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


                  channel = 99;       // send into nirwana 
                

            }

            if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
        }
        finally {
        }
    }
    // $ANTLR end WS

    public void mTokens() throws RecognitionException {
        // grammar/antlr_3/bc.g:1:10: ( T9 | T10 | INT | ML_COMMENT | WS )
        int alt4=5;
        switch ( input.LA(1) ) {
        case '-':
            alt4=1;
            break;
        case 'q':
            alt4=2;
            break;
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            alt4=3;
            break;
        case '/':
            alt4=4;
            break;
        case '\t':
        case '\n':
        case '\r':
        case ' ':
            alt4=5;
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T9 | T10 | INT | ML_COMMENT | WS );", 4, 0, input);

            throw nvae;
        }

        switch (alt4) {
            case 1 :
                // grammar/antlr_3/bc.g:1:10: T9
                {
                mT9(); 

                }
                break;
            case 2 :
                // grammar/antlr_3/bc.g:1:13: T10
                {
                mT10(); 

                }
                break;
            case 3 :
                // grammar/antlr_3/bc.g:1:17: INT
                {
                mINT(); 

                }
                break;
            case 4 :
                // grammar/antlr_3/bc.g:1:21: ML_COMMENT
                {
                mML_COMMENT(); 

                }
                break;
            case 5 :
                // grammar/antlr_3/bc.g:1:32: WS
                {
                mWS(); 

                }
                break;

        }

    }


}