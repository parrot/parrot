// $ANTLR 3.0ea7 grammar/antlr_3/BcParser.lexer.g 2006-02-23 21:51:42

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class BcParserLexer extends Lexer {
    public static final int INT=5;
    public static final int WS=7;
    public static final int ML_COMMENT=6;
    public static final int T8=8;
    public static final int PROGRAM=4;
    public BcParserLexer(CharStream input) {
        super(input);
    }
    public Token nextToken() {
        token=null;
retry:
        while (true) {
            if ( input.LA(1)==CharStream.EOF ) {
                return Token.EOF_TOKEN;
            }	
            try {
                mTokens();
                break retry;
            }
            catch (RecognitionException re) {
                reportError(re);
                recover(re);
            }
        }
        return token;
    }

    public void mT8() throws RecognitionException {
        int type = T8;
        int start = getCharIndex();
        int line = getLine();
        int charPosition = getCharPositionInLine();
        int channel = Token.DEFAULT_CHANNEL;
        // grammar/antlr_3/BcParser.lexer.g:3:6: ( 'quit' )
        // grammar/antlr_3/BcParser.lexer.g:3:6: 'quit'
        {

        match("quit");


        }

        if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
    }

    public void mINT() throws RecognitionException {
        int type = INT;
        int start = getCharIndex();
        int line = getLine();
        int charPosition = getCharPositionInLine();
        int channel = Token.DEFAULT_CHANNEL;
        // grammar/antlr_3/BcParser.lexer.g:5:7: ( ( '0' .. '9' )+ )
        // grammar/antlr_3/BcParser.lexer.g:5:7: ( '0' .. '9' )+
        {

        // grammar/antlr_3/BcParser.lexer.g:5:7: ( '0' .. '9' )+
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
        	    // grammar/antlr_3/BcParser.lexer.g:5:9: '0' .. '9'
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

    public void mML_COMMENT() throws RecognitionException {
        int type = ML_COMMENT;
        int start = getCharIndex();
        int line = getLine();
        int charPosition = getCharPositionInLine();
        int channel = Token.DEFAULT_CHANNEL;
        // grammar/antlr_3/BcParser.lexer.g:7:14: ( '/*' ( options {greedy=false; } : . )* '*/' )
        // grammar/antlr_3/BcParser.lexer.g:7:14: '/*' ( options {greedy=false; } : . )* '*/'
        {

        match("/*");


        // grammar/antlr_3/BcParser.lexer.g:7:19: ( options {greedy=false; } : . )*
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
        	    // grammar/antlr_3/BcParser.lexer.g:7:48: .
        	    {

        	    matchAny();

        	    }
        	    break;

        	default :
        	    break loop2;
            }
        } while (true);


        match("*/");



         channel = 99; // send into nirwana 
         

        }

        if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
    }

    public void mWS() throws RecognitionException {
        int type = WS;
        int start = getCharIndex();
        int line = getLine();
        int charPosition = getCharPositionInLine();
        int channel = Token.DEFAULT_CHANNEL;
        // grammar/antlr_3/BcParser.lexer.g:11:6: ( ( (' '|'\t'|'\r'|'\n'))+ )
        // grammar/antlr_3/BcParser.lexer.g:11:6: ( (' '|'\t'|'\r'|'\n'))+
        {

        // grammar/antlr_3/BcParser.lexer.g:11:6: ( (' '|'\t'|'\r'|'\n'))+
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
        	    // grammar/antlr_3/BcParser.lexer.g:11:8: (' '|'\t'|'\r'|'\n')
        	    {

        	    if ( (input.LA(1)>='\t' && input.LA(1)<='\n')||input.LA(1)=='\r'||input.LA(1)==' ' ) {
        	        input.consume();
        	        errorRecovery=false;
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



         channel = 99; // send into nirwana 
         

        }

        if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
    }

    public void mTokens() throws RecognitionException {
        // grammar/antlr_3/BcParser.lexer.g:1:10: ( T8 | INT | ML_COMMENT | WS )
        int alt4=4;
        switch ( input.LA(1) ) {
        case 'q':
            alt4=1;
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
            alt4=2;
            break;
        case '/':
            alt4=3;
            break;
        case '\t':
        case '\n':
        case '\r':
        case ' ':
            alt4=4;
            break;
        default:

            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T8 | INT | ML_COMMENT | WS );", 4, 0, input);

            throw nvae;
        }

        switch (alt4) {
            case 1 :
                // grammar/antlr_3/BcParser.lexer.g:1:10: T8
                {

                mT8();

                }
                break;
            case 2 :
                // grammar/antlr_3/BcParser.lexer.g:1:13: INT
                {

                mINT();

                }
                break;
            case 3 :
                // grammar/antlr_3/BcParser.lexer.g:1:17: ML_COMMENT
                {

                mML_COMMENT();

                }
                break;
            case 4 :
                // grammar/antlr_3/BcParser.lexer.g:1:28: WS
                {

                mWS();

                }
                break;

        }

    }


}