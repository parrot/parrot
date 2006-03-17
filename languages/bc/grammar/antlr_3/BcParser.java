// $ANTLR 3.0ea8 grammar/antlr_3/bc.g 2006-03-17 18:45:45

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class BcParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "UNARY_MINUS", "INT", "ML_COMMENT", "WS", "\'-\'", "\'quit\'"
    };
    public static final int UNARY_MINUS=5;
    public static final int INT=6;
    public static final int WS=8;
    public static final int EOF=-1;
    public static final int ML_COMMENT=7;
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


    public static class program_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start program
    // grammar/antlr_3/bc.g:22:1: program : input_item quit -> ^( PROGRAM input_item ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        input_item_return input_item1 = null;

        quit_return quit2 = null;

        List list_quit=new ArrayList();
        List list_input_item=new ArrayList();

        try {
            // grammar/antlr_3/bc.g:23:5: ( input_item quit -> ^( PROGRAM input_item ) )
            // grammar/antlr_3/bc.g:23:5: input_item quit
            {
            following.push(FOLLOW_input_item_in_program66);
            input_item1=input_item();
            following.pop();

            list_input_item.add(input_item1.tree);
            following.push(FOLLOW_quit_in_program68);
            quit2=quit();
            following.pop();

            list_quit.add(quit2.tree);

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 23:21: -> ^( PROGRAM input_item )
            {
                // grammar/antlr_3/bc.g:23:24: ^( PROGRAM input_item )
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
    // grammar/antlr_3/bc.g:26:1: input_item : ( expression )+ ;
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        expression_return expression3 = null;



        try {
            // grammar/antlr_3/bc.g:27:5: ( ( expression )+ )
            // grammar/antlr_3/bc.g:27:5: ( expression )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // grammar/antlr_3/bc.g:27:5: ( expression )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( LA1_0==INT||LA1_0==9 ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:27:5: expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    following.push(FOLLOW_expression_in_input_item91);
            	    expression3=expression();
            	    following.pop();

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
    // grammar/antlr_3/bc.g:30:1: expression : ( INT | '-' expression -> ^( UNARY_MINUS expression ) );
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token INT4=null;
        Token char_literal5=null;
        expression_return expression6 = null;

        List list_expression=new ArrayList();
        List list_9=new ArrayList();
        CommonTree INT4_tree=null;
        CommonTree char_literal5_tree=null;

        try {
            // grammar/antlr_3/bc.g:31:5: ( INT | '-' expression -> ^( UNARY_MINUS expression ) )
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( LA2_0==INT ) {
                alt2=1;
            }
            else if ( LA2_0==9 ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("30:1: expression : ( INT | \'-\' expression -> ^( UNARY_MINUS expression ) );", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // grammar/antlr_3/bc.g:31:5: INT
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    INT4=(Token)input.LT(1);
                    match(input,INT,FOLLOW_INT_in_expression106); 
                    INT4_tree = (CommonTree)adaptor.create(INT4);
                    adaptor.addChild(root_0, INT4_tree);


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:32:5: '-' expression
                    {
                    char_literal5=(Token)input.LT(1);
                    match(input,9,FOLLOW_9_in_expression112); 
                    list_9.add(char_literal5);

                    following.push(FOLLOW_expression_in_expression114);
                    expression6=expression();
                    following.pop();

                    list_expression.add(expression6.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 32:20: -> ^( UNARY_MINUS expression )
                    {
                        // grammar/antlr_3/bc.g:32:23: ^( UNARY_MINUS expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(UNARY_MINUS, "UNARY_MINUS"), root_1);

                        adaptor.addChild(root_1, list_expression.get(i_0));

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
    // $ANTLR end expression

    public static class quit_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start quit
    // grammar/antlr_3/bc.g:40:1: quit : 'quit' ;
    public quit_return quit() throws RecognitionException {   
        quit_return retval = new quit_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token string_literal7=null;

        CommonTree string_literal7_tree=null;

        try {
            // grammar/antlr_3/bc.g:41:5: ( 'quit' )
            // grammar/antlr_3/bc.g:41:5: 'quit'
            {
            root_0 = (CommonTree)adaptor.nil();

            string_literal7=(Token)input.LT(1);
            match(input,10,FOLLOW_10_in_quit154); 
            string_literal7_tree = (CommonTree)adaptor.create(string_literal7);
            adaptor.addChild(root_0, string_literal7_tree);


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




    public static final BitSet FOLLOW_input_item_in_program66 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_quit_in_program68 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_input_item91 = new BitSet(new long[]{0x0000000000000242L});
    public static final BitSet FOLLOW_INT_in_expression106 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_9_in_expression112 = new BitSet(new long[]{0x0000000000000240L});
    public static final BitSet FOLLOW_expression_in_expression114 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_10_in_quit154 = new BitSet(new long[]{0x0000000000000002L});

}