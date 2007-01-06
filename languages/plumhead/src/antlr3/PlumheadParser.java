// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-06 14:04:04

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "START_CODE", "SEA", "PHP_CODE", "NEWLINE"
    };
    public static final int START_CODE=4;
    public static final int EOF=-1;
    public static final int PHP_CODE=6;
    public static final int SEA=5;
    public static final int NEWLINE=7;

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
    // src/antlr3/Plumhead.g:26:1: program : SEA PHP_CODE SEA NEWLINE -> ^( START_CODE ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA1=null;
        Token PHP_CODE2=null;
        Token SEA3=null;
        Token NEWLINE4=null;
        List list_PHP_CODE=new ArrayList();
        List list_SEA=new ArrayList();
        List list_NEWLINE=new ArrayList();
        CommonTree SEA1_tree=null;
        CommonTree PHP_CODE2_tree=null;
        CommonTree SEA3_tree=null;
        CommonTree NEWLINE4_tree=null;

        try {
            // src/antlr3/Plumhead.g:27:5: ( SEA PHP_CODE SEA NEWLINE -> ^( START_CODE ) )
            // src/antlr3/Plumhead.g:27:5: SEA PHP_CODE SEA NEWLINE
            {
            SEA1=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_program135); 
            list_SEA.add(SEA1);

            PHP_CODE2=(Token)input.LT(1);
            match(input,PHP_CODE,FOLLOW_PHP_CODE_in_program137); 
            list_PHP_CODE.add(PHP_CODE2);

            SEA3=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_program139); 
            list_SEA.add(SEA3);

            NEWLINE4=(Token)input.LT(1);
            match(input,NEWLINE,FOLLOW_NEWLINE_in_program141); 
            list_NEWLINE.add(NEWLINE4);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 27:30: -> ^( START_CODE )
            {
                // src/antlr3/Plumhead.g:27:33: ^( START_CODE )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(START_CODE, "START_CODE"), root_1);

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


 

    public static final BitSet FOLLOW_SEA_in_program135 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_PHP_CODE_in_program137 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_SEA_in_program139 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_NEWLINE_in_program141 = new BitSet(new long[]{0x0000000000000002L});

}