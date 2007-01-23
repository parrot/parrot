// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-23 20:13:39

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "NOQUOTE_STRING", "SEA", "CODE_START", "CODE_END", "WS", "DOUBLEQUOTE_STRING", "ECHO", "INTEGER", "NUMBER", "MINUS", "PLUS", "MUL_OP", "REL_OP", "';'", "'('", "')'"
    };
    public static final int CODE_START=7;
    public static final int INTEGER=12;
    public static final int MINUS=14;
    public static final int DOUBLEQUOTE_STRING=10;
    public static final int ECHO=11;
    public static final int NUMBER=13;
    public static final int WS=9;
    public static final int EOF=-1;
    public static final int REL_OP=17;
    public static final int MUL_OP=16;
    public static final int PLUS=15;
    public static final int SEA=6;
    public static final int NOQUOTE_STRING=5;
    public static final int CODE_END=8;
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
    // src/antlr3/Plumhead.g:58:1: program : sea_or_code -> ^( PROGRAM sea_or_code ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_or_code_return sea_or_code1 = null;

        List list_sea_or_code=new ArrayList();

        try {
            // src/antlr3/Plumhead.g:59:5: ( sea_or_code -> ^( PROGRAM sea_or_code ) )
            // src/antlr3/Plumhead.g:59:5: sea_or_code
            {
            pushFollow(FOLLOW_sea_or_code_in_program384);
            sea_or_code1=sea_or_code();
            _fsp--;

            list_sea_or_code.add(sea_or_code1.tree);

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 59:17: -> ^( PROGRAM sea_or_code )
            {
                // src/antlr3/Plumhead.g:59:20: ^( PROGRAM sea_or_code )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                adaptor.addChild(root_1, list_sea_or_code.get(i_0));

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

    public static class sea_or_code_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start sea_or_code
    // src/antlr3/Plumhead.g:62:1: sea_or_code : ( sea | code )+ ;
    public sea_or_code_return sea_or_code() throws RecognitionException {   
        sea_or_code_return retval = new sea_or_code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_return sea2 = null;

        code_return code3 = null;



        try {
            // src/antlr3/Plumhead.g:63:5: ( ( sea | code )+ )
            // src/antlr3/Plumhead.g:63:5: ( sea | code )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:63:5: ( sea | code )+
            int cnt1=0;
            loop1:
            do {
                int alt1=3;
                int LA1_0 = input.LA(1);
                if ( (LA1_0==SEA) ) {
                    alt1=1;
                }
                else if ( (LA1_0==CODE_START) ) {
                    alt1=2;
                }


                switch (alt1) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:63:7: sea
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_sea_in_sea_or_code409);
            	    sea2=sea();
            	    _fsp--;

            	    adaptor.addChild(root_1, sea2.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;
            	case 2 :
            	    // src/antlr3/Plumhead.g:63:13: code
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_code_in_sea_or_code413);
            	    code3=code();
            	    _fsp--;

            	    adaptor.addChild(root_1, code3.tree);

            	    adaptor.addChild(root_0, root_1);

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
    // $ANTLR end sea_or_code

    public static class sea_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start sea
    // src/antlr3/Plumhead.g:66:1: sea : SEA -> ^( ECHO NOQUOTE_STRING[$SEA] ) ;
    public sea_return sea() throws RecognitionException {   
        sea_return retval = new sea_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA4=null;
        List list_SEA=new ArrayList();
        CommonTree SEA4_tree=null;

        try {
            // src/antlr3/Plumhead.g:67:5: ( SEA -> ^( ECHO NOQUOTE_STRING[$SEA] ) )
            // src/antlr3/Plumhead.g:67:5: SEA
            {
            SEA4=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_sea430); 
            list_SEA.add(SEA4);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 67:9: -> ^( ECHO NOQUOTE_STRING[$SEA] )
            {
                // src/antlr3/Plumhead.g:67:12: ^( ECHO NOQUOTE_STRING[$SEA] )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ECHO, "ECHO"), root_1);

                adaptor.addChild(root_1, adaptor.create(NOQUOTE_STRING, SEA4));

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
    // src/antlr3/Plumhead.g:70:1: code : CODE_START statements CODE_END -> statements ;
    public code_return code() throws RecognitionException {   
        code_return retval = new code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token CODE_START5=null;
        Token CODE_END7=null;
        statements_return statements6 = null;

        List list_statements=new ArrayList();
        List list_CODE_START=new ArrayList();
        List list_CODE_END=new ArrayList();
        CommonTree CODE_START5_tree=null;
        CommonTree CODE_END7_tree=null;

        try {
            // src/antlr3/Plumhead.g:71:5: ( CODE_START statements CODE_END -> statements )
            // src/antlr3/Plumhead.g:71:5: CODE_START statements CODE_END
            {
            CODE_START5=(Token)input.LT(1);
            match(input,CODE_START,FOLLOW_CODE_START_in_code454); 
            list_CODE_START.add(CODE_START5);

            pushFollow(FOLLOW_statements_in_code456);
            statements6=statements();
            _fsp--;

            list_statements.add(statements6.tree);
            CODE_END7=(Token)input.LT(1);
            match(input,CODE_END,FOLLOW_CODE_END_in_code458); 
            list_CODE_END.add(CODE_END7);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 71:36: -> statements
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
    // src/antlr3/Plumhead.g:74:1: statements : ( statement )* ;
    public statements_return statements() throws RecognitionException {   
        statements_return retval = new statements_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        statement_return statement8 = null;



        try {
            // src/antlr3/Plumhead.g:75:5: ( ( statement )* )
            // src/antlr3/Plumhead.g:75:5: ( statement )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:75:5: ( statement )*
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);
                if ( (LA2_0==ECHO) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:75:7: statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_statement_in_statements477);
            	    statement8=statement();
            	    _fsp--;

            	    adaptor.addChild(root_1, statement8.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop2;
                }
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
    // src/antlr3/Plumhead.g:78:1: statement : ECHO expression ';' -> ^( ECHO expression ) ;
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token ECHO9=null;
        Token char_literal11=null;
        expression_return expression10 = null;

        List list_expression=new ArrayList();
        List list_ECHO=new ArrayList();
        List list_18=new ArrayList();
        CommonTree ECHO9_tree=null;
        CommonTree char_literal11_tree=null;

        try {
            // src/antlr3/Plumhead.g:79:5: ( ECHO expression ';' -> ^( ECHO expression ) )
            // src/antlr3/Plumhead.g:79:5: ECHO expression ';'
            {
            ECHO9=(Token)input.LT(1);
            match(input,ECHO,FOLLOW_ECHO_in_statement493); 
            list_ECHO.add(ECHO9);

            pushFollow(FOLLOW_expression_in_statement495);
            expression10=expression();
            _fsp--;

            list_expression.add(expression10.tree);
            char_literal11=(Token)input.LT(1);
            match(input,18,FOLLOW_18_in_statement497); 
            list_18.add(char_literal11);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 79:25: -> ^( ECHO expression )
            {
                // src/antlr3/Plumhead.g:79:28: ^( ECHO expression )
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
    // src/antlr3/Plumhead.g:82:1: expression : ( DOUBLEQUOTE_STRING | adding_expression );
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token DOUBLEQUOTE_STRING12=null;
        adding_expression_return adding_expression13 = null;


        CommonTree DOUBLEQUOTE_STRING12_tree=null;

        try {
            // src/antlr3/Plumhead.g:83:5: ( DOUBLEQUOTE_STRING | adding_expression )
            int alt3=2;
            int LA3_0 = input.LA(1);
            if ( (LA3_0==DOUBLEQUOTE_STRING) ) {
                alt3=1;
            }
            else if ( ((LA3_0>=NUMBER && LA3_0<=MINUS)||LA3_0==19) ) {
                alt3=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("82:1: expression : ( DOUBLEQUOTE_STRING | adding_expression );", 3, 0, input);

                throw nvae;
            }
            switch (alt3) {
                case 1 :
                    // src/antlr3/Plumhead.g:83:5: DOUBLEQUOTE_STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    DOUBLEQUOTE_STRING12=(Token)input.LT(1);
                    match(input,DOUBLEQUOTE_STRING,FOLLOW_DOUBLEQUOTE_STRING_in_expression520); 
                    DOUBLEQUOTE_STRING12_tree = (CommonTree)adaptor.create(DOUBLEQUOTE_STRING12);
                    adaptor.addChild(root_0, DOUBLEQUOTE_STRING12_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:84:5: adding_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_adding_expression_in_expression526);
                    adding_expression13=adding_expression();
                    _fsp--;

                    adaptor.addChild(root_0, adding_expression13.tree);

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

    public static class adding_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start adding_expression
    // src/antlr3/Plumhead.g:87:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS15=null;
        Token MINUS16=null;
        multiplying_expression_return multiplying_expression14 = null;

        multiplying_expression_return multiplying_expression17 = null;


        CommonTree PLUS15_tree=null;
        CommonTree MINUS16_tree=null;

        try {
            // src/antlr3/Plumhead.g:88:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // src/antlr3/Plumhead.g:88:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression539);
            multiplying_expression14=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression14.tree);
            // src/antlr3/Plumhead.g:88:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>=MINUS && LA5_0<=PLUS)) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:88:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // src/antlr3/Plumhead.g:88:30: ( PLUS^^ | MINUS^^ )
            	    int alt4=2;
            	    int LA4_0 = input.LA(1);
            	    if ( (LA4_0==PLUS) ) {
            	        alt4=1;
            	    }
            	    else if ( (LA4_0==MINUS) ) {
            	        alt4=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("88:30: ( PLUS^^ | MINUS^^ )", 4, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt4) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:88:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS15=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression545); 
            	            PLUS15_tree = (CommonTree)adaptor.create(PLUS15);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS15_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // src/antlr3/Plumhead.g:88:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS16=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression550); 
            	            MINUS16_tree = (CommonTree)adaptor.create(MINUS16);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS16_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression555);
            	    multiplying_expression17=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression17.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop5;
                }
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
    // $ANTLR end adding_expression

    public static class multiplying_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start multiplying_expression
    // src/antlr3/Plumhead.g:91:1: multiplying_expression : unary_expression ( MUL_OP^^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP19=null;
        unary_expression_return unary_expression18 = null;

        unary_expression_return unary_expression20 = null;


        CommonTree MUL_OP19_tree=null;

        try {
            // src/antlr3/Plumhead.g:92:5: ( unary_expression ( MUL_OP^^ unary_expression )* )
            // src/antlr3/Plumhead.g:92:5: unary_expression ( MUL_OP^^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression572);
            unary_expression18=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression18.tree);
            // src/antlr3/Plumhead.g:92:22: ( MUL_OP^^ unary_expression )*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( (LA6_0==MUL_OP) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:92:24: MUL_OP^^ unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    MUL_OP19=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression576); 
            	    MUL_OP19_tree = (CommonTree)adaptor.create(MUL_OP19);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP19_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression579);
            	    unary_expression20=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression20.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop6;
                }
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
    // $ANTLR end multiplying_expression

    public static class unary_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start unary_expression
    // src/antlr3/Plumhead.g:95:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP["n_mul"] NUMBER["-1"] postfix_expression ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS22=null;
        postfix_expression_return postfix_expression21 = null;

        postfix_expression_return postfix_expression23 = null;

        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        CommonTree MINUS22_tree=null;

        try {
            // src/antlr3/Plumhead.g:96:5: ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) )
            int alt7=2;
            int LA7_0 = input.LA(1);
            if ( (LA7_0==NUMBER||LA7_0==19) ) {
                alt7=1;
            }
            else if ( (LA7_0==MINUS) ) {
                alt7=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("95:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) );", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:96:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression595);
                    postfix_expression21=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression21.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:97:5: MINUS postfix_expression
                    {
                    MINUS22=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression601); 
                    list_MINUS.add(MINUS22);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression603);
                    postfix_expression23=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression23.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 97:30: -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression )
                    {
                        // src/antlr3/Plumhead.g:97:33: ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(MUL_OP, "n_mul"), root_1);

                        adaptor.addChild(root_1, adaptor.create(NUMBER, "-1"));
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
    // src/antlr3/Plumhead.g:100:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER24=null;
        Token char_literal25=null;
        Token char_literal27=null;
        expression_return expression26 = null;

        List list_expression=new ArrayList();
        List list_20=new ArrayList();
        List list_19=new ArrayList();
        CommonTree NUMBER24_tree=null;
        CommonTree char_literal25_tree=null;
        CommonTree char_literal27_tree=null;

        try {
            // src/antlr3/Plumhead.g:101:5: ( NUMBER | '(' expression ')' -> expression )
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( (LA8_0==NUMBER) ) {
                alt8=1;
            }
            else if ( (LA8_0==19) ) {
                alt8=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("100:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:101:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER24=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression630); 
                    NUMBER24_tree = (CommonTree)adaptor.create(NUMBER24);
                    adaptor.addChild(root_0, NUMBER24_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:102:5: '(' expression ')'
                    {
                    char_literal25=(Token)input.LT(1);
                    match(input,19,FOLLOW_19_in_postfix_expression636); 
                    list_19.add(char_literal25);

                    pushFollow(FOLLOW_expression_in_postfix_expression638);
                    expression26=expression();
                    _fsp--;

                    list_expression.add(expression26.tree);
                    char_literal27=(Token)input.LT(1);
                    match(input,20,FOLLOW_20_in_postfix_expression640); 
                    list_20.add(char_literal27);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 102:24: -> expression
                    {
                        adaptor.addChild(root_0, list_expression.get(i_0));

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
    // $ANTLR end postfix_expression


 

    public static final BitSet FOLLOW_sea_or_code_in_program384 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_sea_in_sea_or_code409 = new BitSet(new long[]{0x00000000000000C2L});
    public static final BitSet FOLLOW_code_in_sea_or_code413 = new BitSet(new long[]{0x00000000000000C2L});
    public static final BitSet FOLLOW_SEA_in_sea430 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_START_in_code454 = new BitSet(new long[]{0x0000000000000900L});
    public static final BitSet FOLLOW_statements_in_code456 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_CODE_END_in_code458 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements477 = new BitSet(new long[]{0x0000000000000802L});
    public static final BitSet FOLLOW_ECHO_in_statement493 = new BitSet(new long[]{0x0000000000086400L});
    public static final BitSet FOLLOW_expression_in_statement495 = new BitSet(new long[]{0x0000000000040000L});
    public static final BitSet FOLLOW_18_in_statement497 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DOUBLEQUOTE_STRING_in_expression520 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression526 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression539 = new BitSet(new long[]{0x000000000000C002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression545 = new BitSet(new long[]{0x0000000000086000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression550 = new BitSet(new long[]{0x0000000000086000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression555 = new BitSet(new long[]{0x000000000000C002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression572 = new BitSet(new long[]{0x0000000000010002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression576 = new BitSet(new long[]{0x0000000000086000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression579 = new BitSet(new long[]{0x0000000000010002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression595 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression601 = new BitSet(new long[]{0x0000000000082000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression603 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression630 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_19_in_postfix_expression636 = new BitSet(new long[]{0x0000000000086400L});
    public static final BitSet FOLLOW_expression_in_postfix_expression638 = new BitSet(new long[]{0x0000000000100000L});
    public static final BitSet FOLLOW_20_in_postfix_expression640 = new BitSet(new long[]{0x0000000000000002L});

}