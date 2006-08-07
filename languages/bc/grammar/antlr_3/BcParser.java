// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-07 21:12:42

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class BcParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "STRING", "PLUS", "MINUS", "MUL", "DIV", "MOD", "NUMBER", "INTEGER", "ML_COMMENT", "WS", "NEWLINE", "';'", "'('", "')'", "'quit'"
    };
    public static final int INTEGER=12;
    public static final int MUL=8;
    public static final int MINUS=7;
    public static final int WS=14;
    public static final int NUMBER=11;
    public static final int EOF=-1;
    public static final int STRING=5;
    public static final int DIV=9;
    public static final int ML_COMMENT=13;
    public static final int MOD=10;
    public static final int PLUS=6;
    public static final int PROGRAM=4;
    public static final int NEWLINE=15;

        public BcParser(TokenStream input) {
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
    public String getGrammarFileName() { return "grammar/antlr_3/bc.g"; }


    public static class program_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start program
    // grammar/antlr_3/bc.g:26:1: program : ( input_item )+ quit -> ^( PROGRAM ( input_item )+ ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        input_item_return input_item1 = null;

        quit_return quit2 = null;

        List list_quit=new ArrayList();
        List list_input_item=new ArrayList();

        try {
            // grammar/antlr_3/bc.g:27:5: ( ( input_item )+ quit -> ^( PROGRAM ( input_item )+ ) )
            // grammar/antlr_3/bc.g:27:5: ( input_item )+ quit
            {
            // grammar/antlr_3/bc.g:27:5: ( input_item )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( (LA1_0==STRING||LA1_0==NUMBER||LA1_0==17) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:27:5: input_item
            	    {
            	    pushFollow(FOLLOW_input_item_in_program66);
            	    input_item1=input_item();
            	    _fsp--;

            	    list_input_item.add(input_item1.tree);

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

            pushFollow(FOLLOW_quit_in_program69);
            quit2=quit();
            _fsp--;

            list_quit.add(quit2.tree);

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 27:22: -> ^( PROGRAM ( input_item )+ )
            {
                // grammar/antlr_3/bc.g:27:25: ^( PROGRAM ( input_item )+ )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                // grammar/antlr_3/bc.g:27:36: ( input_item )+
                {
                int n_1 = list_input_item == null ? 0 : list_input_item.size();
                 


                if ( n_1==0 ) throw new RuntimeException("Must have more than one element for (...)+ loops");
                for (int i_1=0; i_1<n_1; i_1++) {
                    adaptor.addChild(root_1, list_input_item.get(i_1));

                }
                }

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

    public static class input_item_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start input_item
    // grammar/antlr_3/bc.g:31:1: input_item : semicolon_list ;
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        semicolon_list_return semicolon_list3 = null;



        try {
            // grammar/antlr_3/bc.g:32:5: ( semicolon_list )
            // grammar/antlr_3/bc.g:32:5: semicolon_list
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_semicolon_list_in_input_item94);
            semicolon_list3=semicolon_list();
            _fsp--;

            adaptor.addChild(root_0, semicolon_list3.tree);

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
    // $ANTLR end input_item

    public static class semicolon_list_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start semicolon_list
    // grammar/antlr_3/bc.g:35:1: semicolon_list : statement ( ';'! statement )* ;
    public semicolon_list_return semicolon_list() throws RecognitionException {   
        semicolon_list_return retval = new semicolon_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token char_literal5=null;
        statement_return statement4 = null;

        statement_return statement6 = null;


        CommonTree char_literal5_tree=null;

        try {
            // grammar/antlr_3/bc.g:36:5: ( statement ( ';'! statement )* )
            // grammar/antlr_3/bc.g:36:5: statement ( ';'! statement )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_statement_in_semicolon_list108);
            statement4=statement();
            _fsp--;

            adaptor.addChild(root_0, statement4.tree);
            // grammar/antlr_3/bc.g:36:15: ( ';'! statement )*
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);
                if ( (LA2_0==16) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:36:17: ';'! statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal5=(Token)input.LT(1);
            	    match(input,16,FOLLOW_16_in_semicolon_list112); 
            	    pushFollow(FOLLOW_statement_in_semicolon_list115);
            	    statement6=statement();
            	    _fsp--;

            	    adaptor.addChild(root_1, statement6.tree);

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
    // $ANTLR end semicolon_list

    public static class statement_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement
    // grammar/antlr_3/bc.g:40:1: statement : ( expression | STRING );
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token STRING8=null;
        expression_return expression7 = null;


        CommonTree STRING8_tree=null;

        try {
            // grammar/antlr_3/bc.g:41:5: ( expression | STRING )
            int alt3=2;
            int LA3_0 = input.LA(1);
            if ( (LA3_0==NUMBER||LA3_0==17) ) {
                alt3=1;
            }
            else if ( (LA3_0==STRING) ) {
                alt3=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("40:1: statement : ( expression | STRING );", 3, 0, input);

                throw nvae;
            }
            switch (alt3) {
                case 1 :
                    // grammar/antlr_3/bc.g:41:5: expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_expression_in_statement132);
                    expression7=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression7.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:43:5: STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    STRING8=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_statement144); 
                    STRING8_tree = (CommonTree)adaptor.create(STRING8);
                    adaptor.addChild(root_0, STRING8_tree);


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
    // $ANTLR end statement

    public static class expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start expression
    // grammar/antlr_3/bc.g:46:1: expression : adding_expression ;
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        adding_expression_return adding_expression9 = null;



        try {
            // grammar/antlr_3/bc.g:47:5: ( adding_expression )
            // grammar/antlr_3/bc.g:47:5: adding_expression
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_adding_expression_in_expression157);
            adding_expression9=adding_expression();
            _fsp--;

            adaptor.addChild(root_0, adding_expression9.tree);

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
    // grammar/antlr_3/bc.g:51:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS11=null;
        Token MINUS12=null;
        multiplying_expression_return multiplying_expression10 = null;

        multiplying_expression_return multiplying_expression13 = null;


        CommonTree PLUS11_tree=null;
        CommonTree MINUS12_tree=null;

        try {
            // grammar/antlr_3/bc.g:52:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // grammar/antlr_3/bc.g:52:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression171);
            multiplying_expression10=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression10.tree);
            // grammar/antlr_3/bc.g:52:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( ((LA5_0>=PLUS && LA5_0<=MINUS)) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:52:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // grammar/antlr_3/bc.g:52:30: ( PLUS^^ | MINUS^^ )
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
            	            new NoViableAltException("52:30: ( PLUS^^ | MINUS^^ )", 4, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt4) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:52:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS11=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression177); 
            	            PLUS11_tree = (CommonTree)adaptor.create(PLUS11);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS11_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // grammar/antlr_3/bc.g:52:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS12=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression182); 
            	            MINUS12_tree = (CommonTree)adaptor.create(MINUS12);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS12_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression187);
            	    multiplying_expression13=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression13.tree);

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
    // grammar/antlr_3/bc.g:56:1: multiplying_expression : unary_expression ( ( MUL^^ | DIV^^ | MOD^^ ) unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL15=null;
        Token DIV16=null;
        Token MOD17=null;
        unary_expression_return unary_expression14 = null;

        unary_expression_return unary_expression18 = null;


        CommonTree MUL15_tree=null;
        CommonTree DIV16_tree=null;
        CommonTree MOD17_tree=null;

        try {
            // grammar/antlr_3/bc.g:57:4: ( unary_expression ( ( MUL^^ | DIV^^ | MOD^^ ) unary_expression )* )
            // grammar/antlr_3/bc.g:57:4: unary_expression ( ( MUL^^ | DIV^^ | MOD^^ ) unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression203);
            unary_expression14=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression14.tree);
            // grammar/antlr_3/bc.g:57:21: ( ( MUL^^ | DIV^^ | MOD^^ ) unary_expression )*
            loop7:
            do {
                int alt7=2;
                int LA7_0 = input.LA(1);
                if ( ((LA7_0>=MUL && LA7_0<=MOD)) ) {
                    alt7=1;
                }


                switch (alt7) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:57:23: ( MUL^^ | DIV^^ | MOD^^ ) unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // grammar/antlr_3/bc.g:57:23: ( MUL^^ | DIV^^ | MOD^^ )
            	    int alt6=3;
            	    switch ( input.LA(1) ) {
            	    case MUL:
            	        alt6=1;
            	        break;
            	    case DIV:
            	        alt6=2;
            	        break;
            	    case MOD:
            	        alt6=3;
            	        break;
            	    default:
            	        NoViableAltException nvae =
            	            new NoViableAltException("57:23: ( MUL^^ | DIV^^ | MOD^^ )", 6, 0, input);

            	        throw nvae;
            	    }

            	    switch (alt6) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:57:25: MUL^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MUL15=(Token)input.LT(1);
            	            match(input,MUL,FOLLOW_MUL_in_multiplying_expression209); 
            	            MUL15_tree = (CommonTree)adaptor.create(MUL15);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MUL15_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // grammar/antlr_3/bc.g:57:33: DIV^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            DIV16=(Token)input.LT(1);
            	            match(input,DIV,FOLLOW_DIV_in_multiplying_expression214); 
            	            DIV16_tree = (CommonTree)adaptor.create(DIV16);
            	            root_0 = (CommonTree)adaptor.becomeRoot(DIV16_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 3 :
            	            // grammar/antlr_3/bc.g:57:41: MOD^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MOD17=(Token)input.LT(1);
            	            match(input,MOD,FOLLOW_MOD_in_multiplying_expression219); 
            	            MOD17_tree = (CommonTree)adaptor.create(MOD17);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MOD17_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression224);
            	    unary_expression18=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression18.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop7;
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
    // grammar/antlr_3/bc.g:61:1: unary_expression : ( NUMBER | '(' expression ')' -> expression );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER19=null;
        Token char_literal20=null;
        Token char_literal22=null;
        expression_return expression21 = null;

        List list_expression=new ArrayList();
        List list_18=new ArrayList();
        List list_17=new ArrayList();
        CommonTree NUMBER19_tree=null;
        CommonTree char_literal20_tree=null;
        CommonTree char_literal22_tree=null;

        try {
            // grammar/antlr_3/bc.g:62:5: ( NUMBER | '(' expression ')' -> expression )
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( (LA8_0==NUMBER) ) {
                alt8=1;
            }
            else if ( (LA8_0==17) ) {
                alt8=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("61:1: unary_expression : ( NUMBER | '(' expression ')' -> expression );", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // grammar/antlr_3/bc.g:62:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER19=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_unary_expression240); 
                    NUMBER19_tree = (CommonTree)adaptor.create(NUMBER19);
                    adaptor.addChild(root_0, NUMBER19_tree);


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:64:5: '(' expression ')'
                    {
                    char_literal20=(Token)input.LT(1);
                    match(input,17,FOLLOW_17_in_unary_expression252); 
                    list_17.add(char_literal20);

                    pushFollow(FOLLOW_expression_in_unary_expression254);
                    expression21=expression();
                    _fsp--;

                    list_expression.add(expression21.tree);
                    char_literal22=(Token)input.LT(1);
                    match(input,18,FOLLOW_18_in_unary_expression256); 
                    list_18.add(char_literal22);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 64:24: -> expression
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
    // $ANTLR end unary_expression

    public static class quit_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start quit
    // grammar/antlr_3/bc.g:100:1: quit : 'quit' ;
    public quit_return quit() throws RecognitionException {   
        quit_return retval = new quit_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token string_literal23=null;

        CommonTree string_literal23_tree=null;

        try {
            // grammar/antlr_3/bc.g:101:5: ( 'quit' )
            // grammar/antlr_3/bc.g:101:5: 'quit'
            {
            root_0 = (CommonTree)adaptor.nil();

            string_literal23=(Token)input.LT(1);
            match(input,19,FOLLOW_19_in_quit403); 
            string_literal23_tree = (CommonTree)adaptor.create(string_literal23);
            adaptor.addChild(root_0, string_literal23_tree);


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
    // $ANTLR end quit


 

    public static final BitSet FOLLOW_input_item_in_program66 = new BitSet(new long[]{0x00000000000A0820L});
    public static final BitSet FOLLOW_quit_in_program69 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_semicolon_list_in_input_item94 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list108 = new BitSet(new long[]{0x0000000000010002L});
    public static final BitSet FOLLOW_16_in_semicolon_list112 = new BitSet(new long[]{0x0000000000020820L});
    public static final BitSet FOLLOW_statement_in_semicolon_list115 = new BitSet(new long[]{0x0000000000010002L});
    public static final BitSet FOLLOW_expression_in_statement132 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_statement144 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression157 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression171 = new BitSet(new long[]{0x00000000000000C2L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression177 = new BitSet(new long[]{0x0000000000020800L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression182 = new BitSet(new long[]{0x0000000000020800L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression187 = new BitSet(new long[]{0x00000000000000C2L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression203 = new BitSet(new long[]{0x0000000000000702L});
    public static final BitSet FOLLOW_MUL_in_multiplying_expression209 = new BitSet(new long[]{0x0000000000020800L});
    public static final BitSet FOLLOW_DIV_in_multiplying_expression214 = new BitSet(new long[]{0x0000000000020800L});
    public static final BitSet FOLLOW_MOD_in_multiplying_expression219 = new BitSet(new long[]{0x0000000000020800L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression224 = new BitSet(new long[]{0x0000000000000702L});
    public static final BitSet FOLLOW_NUMBER_in_unary_expression240 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_17_in_unary_expression252 = new BitSet(new long[]{0x0000000000020800L});
    public static final BitSet FOLLOW_expression_in_unary_expression254 = new BitSet(new long[]{0x0000000000040000L});
    public static final BitSet FOLLOW_18_in_unary_expression256 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_19_in_quit403 = new BitSet(new long[]{0x0000000000000002L});

}