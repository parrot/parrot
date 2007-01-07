// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-07 14:13:13

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "SEA", "CODE_START", "CODE_END", "WS", "STRING", "ECHO", "INTEGER", "MINUS", "PLUS", "MUL_OP", "REL_OP", "';'"
    };
    public static final int CODE_START=6;
    public static final int INTEGER=11;
    public static final int MINUS=12;
    public static final int ECHO=10;
    public static final int WS=8;
    public static final int EOF=-1;
    public static final int STRING=9;
    public static final int REL_OP=15;
    public static final int MUL_OP=14;
    public static final int PLUS=13;
    public static final int SEA=5;
    public static final int CODE_END=7;
    public static final int PROGRAM=4;

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
    // src/antlr3/Plumhead.g:36:1: program : s1= sea code s2= sea ( WS )? -> ^( PROGRAM $s1 code $s2) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token WS2=null;
        sea_return s1 = null;

        sea_return s2 = null;

        code_return code1 = null;

        List list_code=new ArrayList();
        List list_sea=new ArrayList();
        List list_WS=new ArrayList();
        CommonTree WS2_tree=null;

        try {
            // src/antlr3/Plumhead.g:37:5: (s1= sea code s2= sea ( WS )? -> ^( PROGRAM $s1 code $s2) )
            // src/antlr3/Plumhead.g:37:5: s1= sea code s2= sea ( WS )?
            {
            pushFollow(FOLLOW_sea_in_program291);
            s1=sea();
            _fsp--;

            list_sea.add(s1.tree);
            pushFollow(FOLLOW_code_in_program293);
            code1=code();
            _fsp--;

            list_code.add(code1.tree);
            pushFollow(FOLLOW_sea_in_program297);
            s2=sea();
            _fsp--;

            list_sea.add(s2.tree);
            // src/antlr3/Plumhead.g:37:24: ( WS )?
            int alt1=2;
            int LA1_0 = input.LA(1);
            if ( (LA1_0==WS) ) {
                alt1=1;
            }
            switch (alt1) {
                case 1 :
                    // src/antlr3/Plumhead.g:37:24: WS
                    {
                    WS2=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_program299); 
                    list_WS.add(WS2);


                    }
                    break;

            }


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 37:28: -> ^( PROGRAM $s1 code $s2)
            {
                // src/antlr3/Plumhead.g:37:31: ^( PROGRAM $s1 code $s2)
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                adaptor.addChild(root_1, s1.tree);
                adaptor.addChild(root_1, list_code.get(i_0));
                adaptor.addChild(root_1, s2.tree);

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
    // $ANTLR end program

    public static class sea_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start sea
    // src/antlr3/Plumhead.g:40:1: sea : SEA -> ^( ECHO STRING[$SEA] ) ;
    public sea_return sea() throws RecognitionException {   
        sea_return retval = new sea_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA3=null;
        List list_SEA=new ArrayList();
        CommonTree SEA3_tree=null;

        try {
            // src/antlr3/Plumhead.g:41:5: ( SEA -> ^( ECHO STRING[$SEA] ) )
            // src/antlr3/Plumhead.g:41:5: SEA
            {
            SEA3=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_sea329); 
            list_SEA.add(SEA3);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 41:9: -> ^( ECHO STRING[$SEA] )
            {
                // src/antlr3/Plumhead.g:41:12: ^( ECHO STRING[$SEA] )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ECHO, "ECHO"), root_1);

                adaptor.addChild(root_1, adaptor.create(STRING, SEA3));

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
    // $ANTLR end sea

    public static class code_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start code
    // src/antlr3/Plumhead.g:44:1: code : CODE_START statements ( WS )? CODE_END ( WS )? -> statements ;
    public code_return code() throws RecognitionException {   
        code_return retval = new code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token CODE_START4=null;
        Token WS6=null;
        Token CODE_END7=null;
        Token WS8=null;
        statements_return statements5 = null;

        List list_statements=new ArrayList();
        List list_CODE_START=new ArrayList();
        List list_WS=new ArrayList();
        List list_CODE_END=new ArrayList();
        CommonTree CODE_START4_tree=null;
        CommonTree WS6_tree=null;
        CommonTree CODE_END7_tree=null;
        CommonTree WS8_tree=null;

        try {
            // src/antlr3/Plumhead.g:45:5: ( CODE_START statements ( WS )? CODE_END ( WS )? -> statements )
            // src/antlr3/Plumhead.g:45:5: CODE_START statements ( WS )? CODE_END ( WS )?
            {
            CODE_START4=(Token)input.LT(1);
            match(input,CODE_START,FOLLOW_CODE_START_in_code353); 
            list_CODE_START.add(CODE_START4);

            pushFollow(FOLLOW_statements_in_code355);
            statements5=statements();
            _fsp--;

            list_statements.add(statements5.tree);
            // src/antlr3/Plumhead.g:45:27: ( WS )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0==WS) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:45:27: WS
                    {
                    WS6=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_code357); 
                    list_WS.add(WS6);


                    }
                    break;

            }

            CODE_END7=(Token)input.LT(1);
            match(input,CODE_END,FOLLOW_CODE_END_in_code360); 
            list_CODE_END.add(CODE_END7);

            // src/antlr3/Plumhead.g:45:40: ( WS )?
            int alt3=2;
            int LA3_0 = input.LA(1);
            if ( (LA3_0==WS) ) {
                alt3=1;
            }
            switch (alt3) {
                case 1 :
                    // src/antlr3/Plumhead.g:45:40: WS
                    {
                    WS8=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_code362); 
                    list_WS.add(WS8);


                    }
                    break;

            }


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 45:44: -> statements
            {
                adaptor.addChild(root_0, list_statements.get(i_0));

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
    // src/antlr3/Plumhead.g:48:1: statements : ( statement )+ ;
    public statements_return statements() throws RecognitionException {   
        statements_return retval = new statements_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        statement_return statement9 = null;



        try {
            // src/antlr3/Plumhead.g:49:5: ( ( statement )+ )
            // src/antlr3/Plumhead.g:49:5: ( statement )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:49:5: ( statement )+
            int cnt4=0;
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( (LA4_0==WS) ) {
                    int LA4_1 = input.LA(2);
                    if ( (LA4_1==ECHO) ) {
                        alt4=1;
                    }


                }
                else if ( (LA4_0==ECHO) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:49:7: statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_statement_in_statements382);
            	    statement9=statement();
            	    _fsp--;

            	    adaptor.addChild(root_1, statement9.tree);

            	    adaptor.addChild(root_0, root_1);

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
    // src/antlr3/Plumhead.g:52:1: statement : ( WS )? ECHO ( WS )? expression ( WS )? ';' -> ^( ECHO expression ) ;
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token WS10=null;
        Token ECHO11=null;
        Token WS12=null;
        Token WS14=null;
        Token char_literal15=null;
        expression_return expression13 = null;

        List list_expression=new ArrayList();
        List list_16=new ArrayList();
        List list_ECHO=new ArrayList();
        List list_WS=new ArrayList();
        CommonTree WS10_tree=null;
        CommonTree ECHO11_tree=null;
        CommonTree WS12_tree=null;
        CommonTree WS14_tree=null;
        CommonTree char_literal15_tree=null;

        try {
            // src/antlr3/Plumhead.g:53:5: ( ( WS )? ECHO ( WS )? expression ( WS )? ';' -> ^( ECHO expression ) )
            // src/antlr3/Plumhead.g:53:5: ( WS )? ECHO ( WS )? expression ( WS )? ';'
            {
            // src/antlr3/Plumhead.g:53:5: ( WS )?
            int alt5=2;
            int LA5_0 = input.LA(1);
            if ( (LA5_0==WS) ) {
                alt5=1;
            }
            switch (alt5) {
                case 1 :
                    // src/antlr3/Plumhead.g:53:5: WS
                    {
                    WS10=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_statement398); 
                    list_WS.add(WS10);


                    }
                    break;

            }

            ECHO11=(Token)input.LT(1);
            match(input,ECHO,FOLLOW_ECHO_in_statement401); 
            list_ECHO.add(ECHO11);

            // src/antlr3/Plumhead.g:53:14: ( WS )?
            int alt6=2;
            int LA6_0 = input.LA(1);
            if ( (LA6_0==WS) ) {
                alt6=1;
            }
            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:53:14: WS
                    {
                    WS12=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_statement403); 
                    list_WS.add(WS12);


                    }
                    break;

            }

            pushFollow(FOLLOW_expression_in_statement406);
            expression13=expression();
            _fsp--;

            list_expression.add(expression13.tree);
            // src/antlr3/Plumhead.g:53:29: ( WS )?
            int alt7=2;
            int LA7_0 = input.LA(1);
            if ( (LA7_0==WS) ) {
                alt7=1;
            }
            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:53:29: WS
                    {
                    WS14=(Token)input.LT(1);
                    match(input,WS,FOLLOW_WS_in_statement408); 
                    list_WS.add(WS14);


                    }
                    break;

            }

            char_literal15=(Token)input.LT(1);
            match(input,16,FOLLOW_16_in_statement411); 
            list_16.add(char_literal15);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 53:37: -> ^( ECHO expression )
            {
                // src/antlr3/Plumhead.g:53:40: ^( ECHO expression )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_ECHO.get(i_0), root_1);

                adaptor.addChild(root_1, list_expression.get(i_0));

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

    public static class expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start expression
    // src/antlr3/Plumhead.g:56:1: expression : ( STRING | unary_expression );
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token STRING16=null;
        unary_expression_return unary_expression17 = null;


        CommonTree STRING16_tree=null;

        try {
            // src/antlr3/Plumhead.g:57:5: ( STRING | unary_expression )
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( (LA8_0==STRING) ) {
                alt8=1;
            }
            else if ( ((LA8_0>=INTEGER && LA8_0<=MINUS)) ) {
                alt8=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("56:1: expression : ( STRING | unary_expression );", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:57:5: STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    STRING16=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_expression434); 
                    STRING16_tree = (CommonTree)adaptor.create(STRING16);
                    adaptor.addChild(root_0, STRING16_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:58:5: unary_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_unary_expression_in_expression440);
                    unary_expression17=unary_expression();
                    _fsp--;

                    adaptor.addChild(root_0, unary_expression17.tree);

                    }
                    break;

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
    // $ANTLR end expression

    public static class unary_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start unary_expression
    // src/antlr3/Plumhead.g:61:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP["n_mul"] INTEGER["-1"] postfix_expression ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS19=null;
        postfix_expression_return postfix_expression18 = null;

        postfix_expression_return postfix_expression20 = null;

        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        CommonTree MINUS19_tree=null;

        try {
            // src/antlr3/Plumhead.g:62:5: ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] INTEGER[\"-1\"] postfix_expression ) )
            int alt9=2;
            int LA9_0 = input.LA(1);
            if ( (LA9_0==INTEGER) ) {
                alt9=1;
            }
            else if ( (LA9_0==MINUS) ) {
                alt9=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("61:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] INTEGER[\"-1\"] postfix_expression ) );", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:62:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression453);
                    postfix_expression18=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression18.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:63:5: MINUS postfix_expression
                    {
                    MINUS19=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression459); 
                    list_MINUS.add(MINUS19);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression461);
                    postfix_expression20=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression20.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 63:30: -> ^( MUL_OP[\"n_mul\"] INTEGER[\"-1\"] postfix_expression )
                    {
                        // src/antlr3/Plumhead.g:63:33: ^( MUL_OP[\"n_mul\"] INTEGER[\"-1\"] postfix_expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(MUL_OP, "n_mul"), root_1);

                        adaptor.addChild(root_1, adaptor.create(INTEGER, "-1"));
                        adaptor.addChild(root_1, list_postfix_expression.get(i_0));

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;

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
    // $ANTLR end unary_expression

    public static class postfix_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start postfix_expression
    // src/antlr3/Plumhead.g:66:1: postfix_expression : INTEGER ;
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token INTEGER21=null;

        CommonTree INTEGER21_tree=null;

        try {
            // src/antlr3/Plumhead.g:67:5: ( INTEGER )
            // src/antlr3/Plumhead.g:67:5: INTEGER
            {
            root_0 = (CommonTree)adaptor.nil();

            INTEGER21=(Token)input.LT(1);
            match(input,INTEGER,FOLLOW_INTEGER_in_postfix_expression488); 
            INTEGER21_tree = (CommonTree)adaptor.create(INTEGER21);
            adaptor.addChild(root_0, INTEGER21_tree);


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
    // $ANTLR end postfix_expression


 

    public static final BitSet FOLLOW_sea_in_program291 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_code_in_program293 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_sea_in_program297 = new BitSet(new long[]{0x0000000000000102L});
    public static final BitSet FOLLOW_WS_in_program299 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SEA_in_sea329 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_START_in_code353 = new BitSet(new long[]{0x0000000000000500L});
    public static final BitSet FOLLOW_statements_in_code355 = new BitSet(new long[]{0x0000000000000180L});
    public static final BitSet FOLLOW_WS_in_code357 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_CODE_END_in_code360 = new BitSet(new long[]{0x0000000000000102L});
    public static final BitSet FOLLOW_WS_in_code362 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements382 = new BitSet(new long[]{0x0000000000000502L});
    public static final BitSet FOLLOW_WS_in_statement398 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_ECHO_in_statement401 = new BitSet(new long[]{0x0000000000001B00L});
    public static final BitSet FOLLOW_WS_in_statement403 = new BitSet(new long[]{0x0000000000001A00L});
    public static final BitSet FOLLOW_expression_in_statement406 = new BitSet(new long[]{0x0000000000010100L});
    public static final BitSet FOLLOW_WS_in_statement408 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_16_in_statement411 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_expression434 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_unary_expression_in_expression440 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression453 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression459 = new BitSet(new long[]{0x0000000000000800L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression461 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INTEGER_in_postfix_expression488 = new BitSet(new long[]{0x0000000000000002L});

}