// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-07-29 17:24:12

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class BcParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "PLUS", "MINUS", "INT", "ML_COMMENT", "WS", "'quit'"
    };
    public static final int MINUS=6;
    public static final int INT=7;
    public static final int WS=9;
    public static final int EOF=-1;
    public static final int ML_COMMENT=8;
    public static final int PLUS=5;
    public static final int PROGRAM=4;

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
    // grammar/antlr_3/bc.g:20:1: program : input_item quit -> ^( PROGRAM input_item ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        input_item_return input_item1 = null;

        quit_return quit2 = null;

        List list_quit=new ArrayList();
        List list_input_item=new ArrayList();

        try {
            // grammar/antlr_3/bc.g:21:5: ( input_item quit -> ^( PROGRAM input_item ) )
            // grammar/antlr_3/bc.g:21:5: input_item quit
            {
            pushFollow(FOLLOW_input_item_in_program60);
            input_item1=input_item();
            _fsp--;

            list_input_item.add(input_item1.tree);
            pushFollow(FOLLOW_quit_in_program62);
            quit2=quit();
            _fsp--;

            list_quit.add(quit2.tree);

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 21:21: -> ^( PROGRAM input_item )
            {
                // grammar/antlr_3/bc.g:21:24: ^( PROGRAM input_item )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                adaptor.addChild(root_1, list_input_item.get(i_0));

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
    // grammar/antlr_3/bc.g:24:1: input_item : ( expression )+ ;
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        expression_return expression3 = null;



        try {
            // grammar/antlr_3/bc.g:25:5: ( ( expression )+ )
            // grammar/antlr_3/bc.g:25:5: ( expression )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // grammar/antlr_3/bc.g:25:5: ( expression )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( (LA1_0==INT) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:25:5: expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_expression_in_input_item85);
            	    expression3=expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, expression3.tree);

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
    // $ANTLR end input_item

    public static class expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start expression
    // grammar/antlr_3/bc.g:28:1: expression : adding_expression ;
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        adding_expression_return adding_expression4 = null;



        try {
            // grammar/antlr_3/bc.g:29:5: ( adding_expression )
            // grammar/antlr_3/bc.g:29:5: adding_expression
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_adding_expression_in_expression100);
            adding_expression4=adding_expression();
            _fsp--;

            adaptor.addChild(root_0, adding_expression4.tree);

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
    // grammar/antlr_3/bc.g:32:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS6=null;
        Token MINUS7=null;
        multiplying_expression_return multiplying_expression5 = null;

        multiplying_expression_return multiplying_expression8 = null;


        CommonTree PLUS6_tree=null;
        CommonTree MINUS7_tree=null;

        try {
            // grammar/antlr_3/bc.g:33:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // grammar/antlr_3/bc.g:33:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression113);
            multiplying_expression5=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression5.tree);
            // grammar/antlr_3/bc.g:33:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( ((LA3_0>=PLUS && LA3_0<=MINUS)) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:33:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // grammar/antlr_3/bc.g:33:30: ( PLUS^^ | MINUS^^ )
            	    int alt2=2;
            	    int LA2_0 = input.LA(1);
            	    if ( (LA2_0==PLUS) ) {
            	        alt2=1;
            	    }
            	    else if ( (LA2_0==MINUS) ) {
            	        alt2=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("33:30: ( PLUS^^ | MINUS^^ )", 2, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt2) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:33:31: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS6=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression118); 
            	            PLUS6_tree = (CommonTree)adaptor.create(PLUS6);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS6_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // grammar/antlr_3/bc.g:33:40: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS7=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression123); 
            	            MINUS7_tree = (CommonTree)adaptor.create(MINUS7);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS7_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression127);
            	    multiplying_expression8=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression8.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop3;
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
    // grammar/antlr_3/bc.g:36:1: multiplying_expression : INT ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token INT9=null;

        CommonTree INT9_tree=null;

        try {
            // grammar/antlr_3/bc.g:37:5: ( INT )
            // grammar/antlr_3/bc.g:37:5: INT
            {
            root_0 = (CommonTree)adaptor.nil();

            INT9=(Token)input.LT(1);
            match(input,INT,FOLLOW_INT_in_multiplying_expression143); 
            INT9_tree = (CommonTree)adaptor.create(INT9);
            adaptor.addChild(root_0, INT9_tree);


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

    public static class quit_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start quit
    // grammar/antlr_3/bc.g:54:1: quit : 'quit' ;
    public quit_return quit() throws RecognitionException {   
        quit_return retval = new quit_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token string_literal10=null;

        CommonTree string_literal10_tree=null;

        try {
            // grammar/antlr_3/bc.g:55:5: ( 'quit' )
            // grammar/antlr_3/bc.g:55:5: 'quit'
            {
            root_0 = (CommonTree)adaptor.nil();

            string_literal10=(Token)input.LT(1);
            match(input,10,FOLLOW_10_in_quit202); 
            string_literal10_tree = (CommonTree)adaptor.create(string_literal10);
            adaptor.addChild(root_0, string_literal10_tree);


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


 

    public static final BitSet FOLLOW_input_item_in_program60 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_quit_in_program62 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_input_item85 = new BitSet(new long[]{0x0000000000000082L});
    public static final BitSet FOLLOW_adding_expression_in_expression100 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression113 = new BitSet(new long[]{0x0000000000000062L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression118 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression123 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression127 = new BitSet(new long[]{0x0000000000000062L});
    public static final BitSet FOLLOW_INT_in_multiplying_expression143 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_10_in_quit202 = new BitSet(new long[]{0x0000000000000002L});

}