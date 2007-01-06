// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-06 17:04:42

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "SEA", "CODE_START", "CODE_END", "WS", "STRING", "ECHO", "';'"
    };
    public static final int CODE_START=5;
    public static final int ECHO=9;
    public static final int EOF=-1;
    public static final int WS=7;
    public static final int STRING=8;
    public static final int SEA=4;
    public static final int CODE_END=6;

        public PlumheadParser(TokenStream input) {
            super(input);
        }
        
    protected TreeAdaptor adaptor = new CommonTreeAdaptor();

    public void setTreeAdaptor(TreeAdaptor adaptor) {
        this.adaptor = adaptor;
    }
    public TreeAdaptor getTreeAdaptor() {
        return adaptor;
    }

    public String[] getTokenNames() { return tokenNames; }
    public String getGrammarFileName() { return "src/antlr3/Plumhead.g"; }


    public static class program_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start program
    // src/antlr3/Plumhead.g:26:1: program : sea code sea ( WS )? -> code ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token WS4=null;
        sea_return sea1 = null;

        code_return code2 = null;

        sea_return sea3 = null;

        List list_code=new ArrayList();
        List list_sea=new ArrayList();
        List list_WS=new ArrayList();
        CommonTree WS4_tree=null;

        try {
            // src/antlr3/Plumhead.g:27:5: ( sea code sea ( WS )? -> code )
            // src/antlr3/Plumhead.g:27:5: sea code sea ( WS )?
            {
            pushFollow(FOLLOW_sea_in_program179);
            sea1=sea();
            _fsp--;

            list_sea.add(sea1.tree);
            pushFollow(FOLLOW_code_in_program181);
            code2=code();
            _fsp--;

            list_code.add(code2.tree);
            pushFollow(FOLLOW_sea_in_program183);
            sea3=sea();
            _fsp--;

            list_sea.add(sea3.tree);
            // src/antlr3/Plumhead.g:27:18: ( WS )?
            int alt1=2;
            int LA1_0 = input.LA(1);
            if ( (LA1_0==WS) ) {
                alt1=1;
            }
            switch (alt1) {
                case 1 :
                    // src/antlr3/Plumhead.g:27:18: WS
                    {
                    WS4=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_program185); 
                    list_WS.add(WS4);


                    }
                    break;

            }


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 27:22: -> code
            {
                adaptor.addChild(root_0, list_code.get(i_0));

            }



            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            retval.stop = input.LT(-1);

                retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
                adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

       }
        return retval;
    }
    // $ANTLR end program

    public static class sea_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start sea
    // src/antlr3/Plumhead.g:30:1: sea : SEA ;
    public sea_return sea() throws RecognitionException {   
        sea_return retval = new sea_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA5=null;

        CommonTree SEA5_tree=null;

        try {
            // src/antlr3/Plumhead.g:31:5: ( SEA )
            // src/antlr3/Plumhead.g:31:5: SEA
            {
            root_0 = (CommonTree)adaptor.nil();

            SEA5=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_sea203); 
            SEA5_tree = (CommonTree)adaptor.create(SEA5);
            adaptor.addChild(root_0, SEA5_tree);


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            retval.stop = input.LT(-1);

                retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
                adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

       }
        return retval;
    }
    // $ANTLR end sea

    public static class code_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start code
    // src/antlr3/Plumhead.g:34:1: code : CODE_START statements ( WS )? CODE_END -> ^( CODE_START statements ) ;
    public code_return code() throws RecognitionException {   
        code_return retval = new code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token CODE_START6=null;
        Token WS8=null;
        Token CODE_END9=null;
        statements_return statements7 = null;

        List list_statements=new ArrayList();
        List list_CODE_START=new ArrayList();
        List list_WS=new ArrayList();
        List list_CODE_END=new ArrayList();
        CommonTree CODE_START6_tree=null;
        CommonTree WS8_tree=null;
        CommonTree CODE_END9_tree=null;

        try {
            // src/antlr3/Plumhead.g:35:5: ( CODE_START statements ( WS )? CODE_END -> ^( CODE_START statements ) )
            // src/antlr3/Plumhead.g:35:5: CODE_START statements ( WS )? CODE_END
            {
            CODE_START6=(Token)input.LT(1);
            match(input,CODE_START,FOLLOW_CODE_START_in_code216); 
            list_CODE_START.add(CODE_START6);

            pushFollow(FOLLOW_statements_in_code218);
            statements7=statements();
            _fsp--;

            list_statements.add(statements7.tree);
            // src/antlr3/Plumhead.g:35:27: ( WS )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0==WS) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:35:27: WS
                    {
                    WS8=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_code220); 
                    list_WS.add(WS8);


                    }
                    break;

            }

            CODE_END9=(Token)input.LT(1);
            match(input,CODE_END,FOLLOW_CODE_END_in_code223); 
            list_CODE_END.add(CODE_END9);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 35:40: -> ^( CODE_START statements )
            {
                // src/antlr3/Plumhead.g:35:43: ^( CODE_START statements )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_CODE_START.get(i_0), root_1);

                adaptor.addChild(root_1, list_statements.get(i_0));

                adaptor.addChild(root_0, root_1);
                }

            }



            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            retval.stop = input.LT(-1);

                retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
                adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

       }
        return retval;
    }
    // $ANTLR end code

    public static class statements_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statements
    // src/antlr3/Plumhead.g:38:1: statements : ( statement )+ ;
    public statements_return statements() throws RecognitionException {   
        statements_return retval = new statements_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        statement_return statement10 = null;



        try {
            // src/antlr3/Plumhead.g:39:5: ( ( statement )+ )
            // src/antlr3/Plumhead.g:39:5: ( statement )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:39:5: ( statement )+
            int cnt3=0;
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( (LA3_0==WS) ) {
                    int LA3_1 = input.LA(2);
                    if ( (LA3_1==ECHO) ) {
                        alt3=1;
                    }


                }
                else if ( (LA3_0==ECHO) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:39:7: statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_statement_in_statements248);
            	    statement10=statement();
            	    _fsp--;

            	    adaptor.addChild(root_1, statement10.tree);

            	    adaptor.addChild(root_0, root_1);

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

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            retval.stop = input.LT(-1);

                retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
                adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

       }
        return retval;
    }
    // $ANTLR end statements

    public static class statement_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement
    // src/antlr3/Plumhead.g:42:1: statement : ( WS )? ECHO ( WS )? STRING ( WS )? ';' -> ^( ECHO STRING ) ;
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token WS11=null;
        Token ECHO12=null;
        Token WS13=null;
        Token STRING14=null;
        Token WS15=null;
        Token char_literal16=null;
        List list_10=new ArrayList();
        List list_ECHO=new ArrayList();
        List list_WS=new ArrayList();
        List list_STRING=new ArrayList();
        CommonTree WS11_tree=null;
        CommonTree ECHO12_tree=null;
        CommonTree WS13_tree=null;
        CommonTree STRING14_tree=null;
        CommonTree WS15_tree=null;
        CommonTree char_literal16_tree=null;

        try {
            // src/antlr3/Plumhead.g:43:5: ( ( WS )? ECHO ( WS )? STRING ( WS )? ';' -> ^( ECHO STRING ) )
            // src/antlr3/Plumhead.g:43:5: ( WS )? ECHO ( WS )? STRING ( WS )? ';'
            {
            // src/antlr3/Plumhead.g:43:5: ( WS )?
            int alt4=2;
            int LA4_0 = input.LA(1);
            if ( (LA4_0==WS) ) {
                alt4=1;
            }
            switch (alt4) {
                case 1 :
                    // src/antlr3/Plumhead.g:43:5: WS
                    {
                    WS11=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_statement264); 
                    list_WS.add(WS11);


                    }
                    break;

            }

            ECHO12=(Token)input.LT(1);
            match(input,ECHO,FOLLOW_ECHO_in_statement267); 
            list_ECHO.add(ECHO12);

            // src/antlr3/Plumhead.g:43:14: ( WS )?
            int alt5=2;
            int LA5_0 = input.LA(1);
            if ( (LA5_0==WS) ) {
                alt5=1;
            }
            switch (alt5) {
                case 1 :
                    // src/antlr3/Plumhead.g:43:14: WS
                    {
                    WS13=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_statement269); 
                    list_WS.add(WS13);


                    }
                    break;

            }

            STRING14=(Token)input.LT(1);
            match(input,STRING,FOLLOW_STRING_in_statement272); 
            list_STRING.add(STRING14);

            // src/antlr3/Plumhead.g:43:25: ( WS )?
            int alt6=2;
            int LA6_0 = input.LA(1);
            if ( (LA6_0==WS) ) {
                alt6=1;
            }
            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:43:25: WS
                    {
                    WS15=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_statement274); 
                    list_WS.add(WS15);


                    }
                    break;

            }

            char_literal16=(Token)input.LT(1);
            match(input,10,FOLLOW_10_in_statement277); 
            list_10.add(char_literal16);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 43:33: -> ^( ECHO STRING )
            {
                // src/antlr3/Plumhead.g:43:36: ^( ECHO STRING )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_ECHO.get(i_0), root_1);

                adaptor.addChild(root_1, (Token)list_STRING.get(i_0));

                adaptor.addChild(root_0, root_1);
                }

            }



            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
            retval.stop = input.LT(-1);

                retval.tree = (CommonTree)adaptor.rulePostProcessing(root_0);
                adaptor.setTokenBoundaries(retval.tree, retval.start, retval.stop);

       }
        return retval;
    }
    // $ANTLR end statement


 

    public static final BitSet FOLLOW_sea_in_program179 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_code_in_program181 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_sea_in_program183 = new BitSet(new long[]{0x0000000000000082L});
    public static final BitSet FOLLOW_WS_in_program185 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SEA_in_sea203 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_START_in_code216 = new BitSet(new long[]{0x0000000000000280L});
    public static final BitSet FOLLOW_statements_in_code218 = new BitSet(new long[]{0x00000000000000C0L});
    public static final BitSet FOLLOW_WS_in_code220 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_CODE_END_in_code223 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements248 = new BitSet(new long[]{0x0000000000000282L});
    public static final BitSet FOLLOW_WS_in_statement264 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_ECHO_in_statement267 = new BitSet(new long[]{0x0000000000000180L});
    public static final BitSet FOLLOW_WS_in_statement269 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_STRING_in_statement272 = new BitSet(new long[]{0x0000000000000480L});
    public static final BitSet FOLLOW_WS_in_statement274 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_10_in_statement277 = new BitSet(new long[]{0x0000000000000002L});

}