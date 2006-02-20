// $ANTLR 3.0ea7 grammar/antlr_3/BcParser.lexer.g 2006-02-20 19:18:25

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class BcParserLexer extends Lexer {
    public static final int INT=5;
    public static final int WS=6;
    public static final int PROGRAM=4;
    public static final int T7=7;
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

    public void mT7() throws RecognitionException {
        int type = T7;
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

    public void mWS() throws RecognitionException {
        int type = WS;
        int start = getCharIndex();
        int line = getLine();
        int charPosition = getCharPositionInLine();
        int channel = Token.DEFAULT_CHANNEL;
        // grammar/antlr_3/BcParser.lexer.g:7:6: ( ( (' '|'\t'|'\r'|'\n'))+ )
        // grammar/antlr_3/BcParser.lexer.g:7:6: ( (' '|'\t'|'\r'|'\n'))+
        {

        // grammar/antlr_3/BcParser.lexer.g:7:6: ( (' '|'\t'|'\r'|'\n'))+
        int cnt2=0;
        loop2:
        do {
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0>='\t' && LA2_0<='\n')||LA2_0=='\r'||LA2_0==' ' ) {
                alt2=1;
            }


            switch (alt2) {
        	case 1 :
        	    // grammar/antlr_3/BcParser.lexer.g:7:8: (' '|'\t'|'\r'|'\n')
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
        	    if ( cnt2 >= 1 ) break loop2;
                    EarlyExitException eee =
                        new EarlyExitException(2, input);
                    throw eee;
            }
            cnt2++;
        } while (true);



         channel = 99;
         

        }

        if ( token==null ) {emit(type,line,charPosition,channel,start,getCharIndex()-1);}
    }

    public void mTokens() throws RecognitionException {
        // grammar/antlr_3/BcParser.lexer.g:1:10: ( T7 | INT | WS )
        int alt3=3;
        switch ( input.LA(1) ) {
        case 'q':
            alt3=1;
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
            alt3=2;
            break;
        case '\t':
        case '\n':
        case '\r':
        case ' ':
            alt3=3;
            break;
        default:

            NoViableAltException nvae =
                new NoViableAltException("1:1: Tokens : ( T7 | INT | WS );", 3, 0, input);

            throw nvae;
        }

        switch (alt3) {
            case 1 :
                // grammar/antlr_3/BcParser.lexer.g:1:10: T7
                {

                mT7();

                }
                break;
            case 2 :
                // grammar/antlr_3/BcParser.lexer.g:1:13: INT
                {

                mINT();

                }
                break;
            case 3 :
                // grammar/antlr_3/BcParser.lexer.g:1:17: WS
                {

                mWS();

                }
                break;

        }

    }


}