// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-08 23:54:41

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class BcParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "VAR", "STRING", "LETTER", "PLUS", "MINUS", "MUL", "DIV", "MOD", "INCR", "DECR", "NUMBER", "INTEGER", "ML_COMMENT", "WS", "NEWLINE", "';'", "'('", "')'", "'quit'"
    };
    public static final int LETTER=7;
    public static final int MINUS=9;
    public static final int INCR=13;
    public static final int DECR=14;
    public static final int NUMBER=15;
    public static final int WS=18;
    public static final int STRING=6;
    public static final int MOD=12;
    public static final int PROGRAM=4;
    public static final int NEWLINE=19;
    public static final int VAR=5;
    public static final int MUL=10;
    public static final int INTEGER=16;
    public static final int EOF=-1;
    public static final int DIV=11;
    public static final int PLUS=8;
    public static final int ML_COMMENT=17;

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
    // grammar/antlr_3/bc.g:27:1: program : ( input_item )+ quit -> ^( PROGRAM ( input_item )+ ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        input_item_return input_item1 = null;

        quit_return quit2 = null;

        List list_quit=new ArrayList();
        List list_input_item=new ArrayList();

        try {
            // grammar/antlr_3/bc.g:28:5: ( ( input_item )+ quit -> ^( PROGRAM ( input_item )+ ) )
            // grammar/antlr_3/bc.g:28:5: ( input_item )+ quit
            {
            // grammar/antlr_3/bc.g:28:5: ( input_item )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( ((LA1_0>=STRING && LA1_0<=LETTER)||(LA1_0>=INCR && LA1_0<=NUMBER)||LA1_0==21) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:28:5: input_item
            	    {
            	    pushFollow(FOLLOW_input_item_in_program71);
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

            pushFollow(FOLLOW_quit_in_program74);
            quit2=quit();
            _fsp--;

            list_quit.add(quit2.tree);

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 28:22: -> ^( PROGRAM ( input_item )+ )
            {
                // grammar/antlr_3/bc.g:28:25: ^( PROGRAM ( input_item )+ )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                // grammar/antlr_3/bc.g:28:36: ( input_item )+
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
    // grammar/antlr_3/bc.g:32:1: input_item : semicolon_list ;
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        semicolon_list_return semicolon_list3 = null;



        try {
            // grammar/antlr_3/bc.g:33:5: ( semicolon_list )
            // grammar/antlr_3/bc.g:33:5: semicolon_list
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_semicolon_list_in_input_item99);
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
    // grammar/antlr_3/bc.g:36:1: semicolon_list : statement ( ';'! statement )* ;
    public semicolon_list_return semicolon_list() throws RecognitionException {   
        semicolon_list_return retval = new semicolon_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token char_literal5=null;
        statement_return statement4 = null;

        statement_return statement6 = null;


        CommonTree char_literal5_tree=null;

        try {
            // grammar/antlr_3/bc.g:37:5: ( statement ( ';'! statement )* )
            // grammar/antlr_3/bc.g:37:5: statement ( ';'! statement )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_statement_in_semicolon_list113);
            statement4=statement();
            _fsp--;

            adaptor.addChild(root_0, statement4.tree);
            // grammar/antlr_3/bc.g:37:15: ( ';'! statement )*
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);
                if ( (LA2_0==20) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:37:17: ';'! statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal5=(Token)input.LT(1);
            	    match(input,20,FOLLOW_20_in_semicolon_list117); 
            	    pushFollow(FOLLOW_statement_in_semicolon_list120);
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
    // grammar/antlr_3/bc.g:41:1: statement : ( expression | STRING );
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token STRING8=null;
        expression_return expression7 = null;


        CommonTree STRING8_tree=null;

        try {
            // grammar/antlr_3/bc.g:42:5: ( expression | STRING )
            int alt3=2;
            int LA3_0 = input.LA(1);
            if ( (LA3_0==LETTER||(LA3_0>=INCR && LA3_0<=NUMBER)||LA3_0==21) ) {
                alt3=1;
            }
            else if ( (LA3_0==STRING) ) {
                alt3=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("41:1: statement : ( expression | STRING );", 3, 0, input);

                throw nvae;
            }
            switch (alt3) {
                case 1 :
                    // grammar/antlr_3/bc.g:42:5: expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_expression_in_statement137);
                    expression7=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression7.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:44:5: STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    STRING8=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_statement149); 
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
    // grammar/antlr_3/bc.g:47:1: expression : ( named_expression | adding_expression );
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        named_expression_return named_expression9 = null;

        adding_expression_return adding_expression10 = null;



        try {
            // grammar/antlr_3/bc.g:48:5: ( named_expression | adding_expression )
            int alt4=2;
            int LA4_0 = input.LA(1);
            if ( (LA4_0==LETTER) ) {
                alt4=1;
            }
            else if ( ((LA4_0>=INCR && LA4_0<=NUMBER)||LA4_0==21) ) {
                alt4=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("47:1: expression : ( named_expression | adding_expression );", 4, 0, input);

                throw nvae;
            }
            switch (alt4) {
                case 1 :
                    // grammar/antlr_3/bc.g:48:5: named_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_expression162);
                    named_expression9=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression9.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:50:5: adding_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_adding_expression_in_expression174);
                    adding_expression10=adding_expression();
                    _fsp--;

                    adaptor.addChild(root_0, adding_expression10.tree);

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

    public static class named_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start named_expression
    // grammar/antlr_3/bc.g:53:1: named_expression : LETTER -> ^( VAR LETTER ) ;
    public named_expression_return named_expression() throws RecognitionException {   
        named_expression_return retval = new named_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER11=null;
        List list_LETTER=new ArrayList();
        CommonTree LETTER11_tree=null;

        try {
            // grammar/antlr_3/bc.g:54:5: ( LETTER -> ^( VAR LETTER ) )
            // grammar/antlr_3/bc.g:54:5: LETTER
            {
            LETTER11=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_named_expression187); 
            list_LETTER.add(LETTER11);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 54:12: -> ^( VAR LETTER )
            {
                // grammar/antlr_3/bc.g:54:15: ^( VAR LETTER )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_1);

                adaptor.addChild(root_1, (Token)list_LETTER.get(i_0));

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
    // $ANTLR end named_expression

    public static class adding_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start adding_expression
    // grammar/antlr_3/bc.g:58:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS13=null;
        Token MINUS14=null;
        multiplying_expression_return multiplying_expression12 = null;

        multiplying_expression_return multiplying_expression15 = null;


        CommonTree PLUS13_tree=null;
        CommonTree MINUS14_tree=null;

        try {
            // grammar/antlr_3/bc.g:59:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // grammar/antlr_3/bc.g:59:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression212);
            multiplying_expression12=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression12.tree);
            // grammar/antlr_3/bc.g:59:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( ((LA6_0>=PLUS && LA6_0<=MINUS)) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:59:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // grammar/antlr_3/bc.g:59:30: ( PLUS^^ | MINUS^^ )
            	    int alt5=2;
            	    int LA5_0 = input.LA(1);
            	    if ( (LA5_0==PLUS) ) {
            	        alt5=1;
            	    }
            	    else if ( (LA5_0==MINUS) ) {
            	        alt5=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("59:30: ( PLUS^^ | MINUS^^ )", 5, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt5) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:59:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS13=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression218); 
            	            PLUS13_tree = (CommonTree)adaptor.create(PLUS13);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS13_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // grammar/antlr_3/bc.g:59:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS14=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression223); 
            	            MINUS14_tree = (CommonTree)adaptor.create(MINUS14);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS14_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression228);
            	    multiplying_expression15=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression15.tree);

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
    // $ANTLR end adding_expression

    public static class multiplying_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start multiplying_expression
    // grammar/antlr_3/bc.g:63:1: multiplying_expression : unary_expression ( ( MUL^^ | DIV^^ | MOD^^ ) unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL17=null;
        Token DIV18=null;
        Token MOD19=null;
        unary_expression_return unary_expression16 = null;

        unary_expression_return unary_expression20 = null;


        CommonTree MUL17_tree=null;
        CommonTree DIV18_tree=null;
        CommonTree MOD19_tree=null;

        try {
            // grammar/antlr_3/bc.g:64:5: ( unary_expression ( ( MUL^^ | DIV^^ | MOD^^ ) unary_expression )* )
            // grammar/antlr_3/bc.g:64:5: unary_expression ( ( MUL^^ | DIV^^ | MOD^^ ) unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression245);
            unary_expression16=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression16.tree);
            // grammar/antlr_3/bc.g:64:22: ( ( MUL^^ | DIV^^ | MOD^^ ) unary_expression )*
            loop8:
            do {
                int alt8=2;
                int LA8_0 = input.LA(1);
                if ( ((LA8_0>=MUL && LA8_0<=MOD)) ) {
                    alt8=1;
                }


                switch (alt8) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:64:24: ( MUL^^ | DIV^^ | MOD^^ ) unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // grammar/antlr_3/bc.g:64:24: ( MUL^^ | DIV^^ | MOD^^ )
            	    int alt7=3;
            	    switch ( input.LA(1) ) {
            	    case MUL:
            	        alt7=1;
            	        break;
            	    case DIV:
            	        alt7=2;
            	        break;
            	    case MOD:
            	        alt7=3;
            	        break;
            	    default:
            	        NoViableAltException nvae =
            	            new NoViableAltException("64:24: ( MUL^^ | DIV^^ | MOD^^ )", 7, 0, input);

            	        throw nvae;
            	    }

            	    switch (alt7) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:64:26: MUL^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MUL17=(Token)input.LT(1);
            	            match(input,MUL,FOLLOW_MUL_in_multiplying_expression251); 
            	            MUL17_tree = (CommonTree)adaptor.create(MUL17);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MUL17_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // grammar/antlr_3/bc.g:64:34: DIV^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            DIV18=(Token)input.LT(1);
            	            match(input,DIV,FOLLOW_DIV_in_multiplying_expression256); 
            	            DIV18_tree = (CommonTree)adaptor.create(DIV18);
            	            root_0 = (CommonTree)adaptor.becomeRoot(DIV18_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 3 :
            	            // grammar/antlr_3/bc.g:64:42: MOD^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MOD19=(Token)input.LT(1);
            	            match(input,MOD,FOLLOW_MOD_in_multiplying_expression261); 
            	            MOD19_tree = (CommonTree)adaptor.create(MOD19);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MOD19_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression266);
            	    unary_expression20=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression20.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop8;
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
    // grammar/antlr_3/bc.g:68:1: unary_expression : ( postfix_expression | ( INCR^^ | DECR^^ ) postfix_expression );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token INCR22=null;
        Token DECR23=null;
        postfix_expression_return postfix_expression21 = null;

        postfix_expression_return postfix_expression24 = null;


        CommonTree INCR22_tree=null;
        CommonTree DECR23_tree=null;

        try {
            // grammar/antlr_3/bc.g:69:5: ( postfix_expression | ( INCR^^ | DECR^^ ) postfix_expression )
            int alt10=2;
            int LA10_0 = input.LA(1);
            if ( (LA10_0==NUMBER||LA10_0==21) ) {
                alt10=1;
            }
            else if ( ((LA10_0>=INCR && LA10_0<=DECR)) ) {
                alt10=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("68:1: unary_expression : ( postfix_expression | ( INCR^^ | DECR^^ ) postfix_expression );", 10, 0, input);

                throw nvae;
            }
            switch (alt10) {
                case 1 :
                    // grammar/antlr_3/bc.g:69:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression283);
                    postfix_expression21=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression21.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:71:5: ( INCR^^ | DECR^^ ) postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    // grammar/antlr_3/bc.g:71:5: ( INCR^^ | DECR^^ )
                    int alt9=2;
                    int LA9_0 = input.LA(1);
                    if ( (LA9_0==INCR) ) {
                        alt9=1;
                    }
                    else if ( (LA9_0==DECR) ) {
                        alt9=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("71:5: ( INCR^^ | DECR^^ )", 9, 0, input);

                        throw nvae;
                    }
                    switch (alt9) {
                        case 1 :
                            // grammar/antlr_3/bc.g:71:7: INCR^^
                            {
                            CommonTree root_1 = (CommonTree)adaptor.nil();

                            INCR22=(Token)input.LT(1);
                            match(input,INCR,FOLLOW_INCR_in_unary_expression297); 
                            INCR22_tree = (CommonTree)adaptor.create(INCR22);
                            root_0 = (CommonTree)adaptor.becomeRoot(INCR22_tree, root_0);


                            adaptor.addChild(root_0, root_1);

                            }
                            break;
                        case 2 :
                            // grammar/antlr_3/bc.g:71:16: DECR^^
                            {
                            CommonTree root_1 = (CommonTree)adaptor.nil();

                            DECR23=(Token)input.LT(1);
                            match(input,DECR,FOLLOW_DECR_in_unary_expression302); 
                            DECR23_tree = (CommonTree)adaptor.create(DECR23);
                            root_0 = (CommonTree)adaptor.becomeRoot(DECR23_tree, root_0);


                            adaptor.addChild(root_0, root_1);

                            }
                            break;

                    }

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression307);
                    postfix_expression24=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression24.tree);

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
    // grammar/antlr_3/bc.g:74:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER25=null;
        Token char_literal26=null;
        Token char_literal28=null;
        expression_return expression27 = null;

        List list_expression=new ArrayList();
        List list_21=new ArrayList();
        List list_22=new ArrayList();
        CommonTree NUMBER25_tree=null;
        CommonTree char_literal26_tree=null;
        CommonTree char_literal28_tree=null;

        try {
            // grammar/antlr_3/bc.g:75:5: ( NUMBER | '(' expression ')' -> expression )
            int alt11=2;
            int LA11_0 = input.LA(1);
            if ( (LA11_0==NUMBER) ) {
                alt11=1;
            }
            else if ( (LA11_0==21) ) {
                alt11=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("74:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );", 11, 0, input);

                throw nvae;
            }
            switch (alt11) {
                case 1 :
                    // grammar/antlr_3/bc.g:75:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER25=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression320); 
                    NUMBER25_tree = (CommonTree)adaptor.create(NUMBER25);
                    adaptor.addChild(root_0, NUMBER25_tree);


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:77:5: '(' expression ')'
                    {
                    char_literal26=(Token)input.LT(1);
                    match(input,21,FOLLOW_21_in_postfix_expression332); 
                    list_21.add(char_literal26);

                    pushFollow(FOLLOW_expression_in_postfix_expression334);
                    expression27=expression();
                    _fsp--;

                    list_expression.add(expression27.tree);
                    char_literal28=(Token)input.LT(1);
                    match(input,22,FOLLOW_22_in_postfix_expression336); 
                    list_22.add(char_literal28);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 77:24: -> expression
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

    public static class quit_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start quit
    // grammar/antlr_3/bc.g:121:1: quit : 'quit' ;
    public quit_return quit() throws RecognitionException {   
        quit_return retval = new quit_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token string_literal29=null;

        CommonTree string_literal29_tree=null;

        try {
            // grammar/antlr_3/bc.g:122:5: ( 'quit' )
            // grammar/antlr_3/bc.g:122:5: 'quit'
            {
            root_0 = (CommonTree)adaptor.nil();

            string_literal29=(Token)input.LT(1);
            match(input,23,FOLLOW_23_in_quit509); 
            string_literal29_tree = (CommonTree)adaptor.create(string_literal29);
            adaptor.addChild(root_0, string_literal29_tree);


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


 

    public static final BitSet FOLLOW_input_item_in_program71 = new BitSet(new long[]{0x0000000000A0E0C0L});
    public static final BitSet FOLLOW_quit_in_program74 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_semicolon_list_in_input_item99 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list113 = new BitSet(new long[]{0x0000000000100002L});
    public static final BitSet FOLLOW_20_in_semicolon_list117 = new BitSet(new long[]{0x000000000020E0C0L});
    public static final BitSet FOLLOW_statement_in_semicolon_list120 = new BitSet(new long[]{0x0000000000100002L});
    public static final BitSet FOLLOW_expression_in_statement137 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_statement149 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_named_expression_in_expression162 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression174 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_named_expression187 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression212 = new BitSet(new long[]{0x0000000000000302L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression218 = new BitSet(new long[]{0x000000000020E000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression223 = new BitSet(new long[]{0x000000000020E000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression228 = new BitSet(new long[]{0x0000000000000302L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression245 = new BitSet(new long[]{0x0000000000001C02L});
    public static final BitSet FOLLOW_MUL_in_multiplying_expression251 = new BitSet(new long[]{0x000000000020E000L});
    public static final BitSet FOLLOW_DIV_in_multiplying_expression256 = new BitSet(new long[]{0x000000000020E000L});
    public static final BitSet FOLLOW_MOD_in_multiplying_expression261 = new BitSet(new long[]{0x000000000020E000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression266 = new BitSet(new long[]{0x0000000000001C02L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression283 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INCR_in_unary_expression297 = new BitSet(new long[]{0x0000000000208000L});
    public static final BitSet FOLLOW_DECR_in_unary_expression302 = new BitSet(new long[]{0x0000000000208000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression307 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression320 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_21_in_postfix_expression332 = new BitSet(new long[]{0x000000000020E080L});
    public static final BitSet FOLLOW_expression_in_postfix_expression334 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_22_in_postfix_expression336 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_23_in_quit509 = new BitSet(new long[]{0x0000000000000002L});

}