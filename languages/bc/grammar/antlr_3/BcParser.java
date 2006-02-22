// $ANTLR 3.0ea7 grammar/antlr_3/bc.g 2006-02-22 22:44:02

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class BcParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "INT", "WS", "\'quit\'"
    };
    public static final int INT=5;
    public static final int WS=6;
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



    public static class program_return extends RuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start program
    // grammar/antlr_3/bc.g:21:1: program : input_item quit -> ^( PROGRAM input_item ) ;
    public program_return program() throws RecognitionException {   

        program_return retval = new program_return();
        retval.start = (Token)input.LT(1);

        CommonTree root_0 = null;


        input_item_return input_item1 = null;

        quit_return quit2 = null;

        List list_quit=new ArrayList();
        List list_input_item=new ArrayList();

        try {
            // grammar/antlr_3/bc.g:22:5: ( input_item quit -> ^( PROGRAM input_item ) )
            // grammar/antlr_3/bc.g:22:5: input_item quit
            {

            following.push(FOLLOW_input_item_in_program61);
            input_item1=input_item();
            following.pop();

            list_input_item.add(input_item1.tree);

            following.push(FOLLOW_quit_in_program63);
            quit2=quit();
            following.pop();

            list_quit.add(quit2.tree);


            // AST REWRITE
            if ( list_input_item.size()!=1 ) throw new RuntimeException("element input_item length="+list_input_item.size()+" != 1");

            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 22:21: -> ^( PROGRAM input_item )
            {
                // grammar/antlr_3/bc.g:22:24: ^( PROGRAM input_item )
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

            retval.stop = (Token)input.LT(-1);
            retval.tree = root_0;

        }

        return retval;

    }
    // $ANTLR end program


    public static class input_item_return extends RuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start input_item
    // grammar/antlr_3/bc.g:25:1: input_item : ( INT )+ ;
    public input_item_return input_item() throws RecognitionException {   

        input_item_return retval = new input_item_return();
        retval.start = (Token)input.LT(1);

        CommonTree root_0 = null;

        Token INT3=null;

        CommonTree INT3_tree=null;

        try {
            // grammar/antlr_3/bc.g:26:5: ( ( INT )+ )
            // grammar/antlr_3/bc.g:26:5: ( INT )+
            {
            root_0 = (CommonTree)adaptor.nil();


            // grammar/antlr_3/bc.g:26:5: ( INT )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( LA1_0==INT ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:26:5: INT
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();


            	    INT3=(Token)input.LT(1);
            	    match(input,INT,FOLLOW_INT_in_input_item86);
            	    INT3_tree = (CommonTree)adaptor.create(INT3);
            	    adaptor.addChild(root_1, INT3_tree);

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

            retval.stop = (Token)input.LT(-1);
            retval.tree = root_0;

        }

        return retval;

    }
    // $ANTLR end input_item


    public static class quit_return extends RuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start quit
    // grammar/antlr_3/bc.g:34:1: quit : 'quit' ;
    public quit_return quit() throws RecognitionException {   

        quit_return retval = new quit_return();
        retval.start = (Token)input.LT(1);

        CommonTree root_0 = null;

        Token string_literal4=null;

        CommonTree string_literal4_tree=null;

        try {
            // grammar/antlr_3/bc.g:35:5: ( 'quit' )
            // grammar/antlr_3/bc.g:35:5: 'quit'
            {
            root_0 = (CommonTree)adaptor.nil();


            string_literal4=(Token)input.LT(1);
            match(input,7,FOLLOW_7_in_quit118);
            string_literal4_tree = (CommonTree)adaptor.create(string_literal4);
            adaptor.addChild(root_0, string_literal4_tree);

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            retval.stop = (Token)input.LT(-1);
            retval.tree = root_0;

        }

        return retval;

    }
    // $ANTLR end quit




    public static final BitSet FOLLOW_input_item_in_program61 = new BitSet(new long[]{128L});
    public static final BitSet FOLLOW_quit_in_program63 = new BitSet(new long[]{2L});
    public static final BitSet FOLLOW_INT_in_input_item86 = new BitSet(new long[]{34L});
    public static final BitSet FOLLOW_7_in_quit118 = new BitSet(new long[]{2L});

}