// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-15 15:59:14

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class BcParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PRINT", "PROGRAM", "SAY", "UNARY_MINUS", "VAR", "Quit", "NEWLINE", "SEMICOLON", "ASSIGN_OP", "STRING", "INCR_DECR", "LETTER", "PLUS", "MINUS", "MUL_OP", "NUMBER", "INTEGER", "ML_COMMENT", "WS", "'('", "')'"
    };
    public static final int INCR_DECR=14;
    public static final int LETTER=15;
    public static final int MINUS=17;
    public static final int WS=22;
    public static final int NUMBER=19;
    public static final int STRING=13;
    public static final int MUL_OP=18;
    public static final int Quit=9;
    public static final int PROGRAM=5;
    public static final int NEWLINE=10;
    public static final int VAR=8;
    public static final int INTEGER=20;
    public static final int ASSIGN_OP=12;
    public static final int SAY=6;
    public static final int PRINT=4;
    public static final int UNARY_MINUS=7;
    public static final int SEMICOLON=11;
    public static final int EOF=-1;
    public static final int ML_COMMENT=21;
    public static final int PLUS=16;

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
    // grammar/antlr_3/bc.g:30:1: program : ( input_item )+ Quit NEWLINE -> ^( PROGRAM ^( ASSIGN_OP ^( VAR LETTER["a"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["b"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["c"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["d"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["e"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["f"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["g"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["h"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["i"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["j"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["k"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["l"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["m"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["n"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["o"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["p"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["q"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["r"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["s"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["t"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["u"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["v"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["w"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["x"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["y"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["z"] ) NUMBER["0"] ) ( input_item )+ ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token Quit2=null;
        Token NEWLINE3=null;
        input_item_return input_item1 = null;

        List list_input_item=new ArrayList();
        List list_Quit=new ArrayList();
        List list_NEWLINE=new ArrayList();
        CommonTree Quit2_tree=null;
        CommonTree NEWLINE3_tree=null;

        try {
            // grammar/antlr_3/bc.g:31:5: ( ( input_item )+ Quit NEWLINE -> ^( PROGRAM ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"b\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"c\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"d\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"e\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"f\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"g\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"h\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"i\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"j\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"k\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"l\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"m\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"n\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"o\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"p\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"q\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"r\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"s\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"t\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"u\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"v\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"w\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"x\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"y\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"z\"] ) NUMBER[\"0\"] ) ( input_item )+ ) )
            // grammar/antlr_3/bc.g:31:5: ( input_item )+ Quit NEWLINE
            {
            // grammar/antlr_3/bc.g:31:5: ( input_item )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( ((LA1_0>=NEWLINE && LA1_0<=SEMICOLON)||(LA1_0>=STRING && LA1_0<=LETTER)||LA1_0==MINUS||LA1_0==NUMBER||LA1_0==23) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:31:5: input_item
            	    {
            	    pushFollow(FOLLOW_input_item_in_program105);
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

            Quit2=(Token)input.LT(1);
            match(input,Quit,FOLLOW_Quit_in_program108); 
            list_Quit.add(Quit2);

            NEWLINE3=(Token)input.LT(1);
            match(input,NEWLINE,FOLLOW_NEWLINE_in_program110); 
            list_NEWLINE.add(NEWLINE3);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 31:30: -> ^( PROGRAM ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"b\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"c\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"d\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"e\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"f\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"g\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"h\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"i\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"j\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"k\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"l\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"m\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"n\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"o\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"p\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"q\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"r\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"s\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"t\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"u\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"v\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"w\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"x\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"y\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"z\"] ) NUMBER[\"0\"] ) ( input_item )+ )
            {
                // grammar/antlr_3/bc.g:31:33: ^( PROGRAM ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"b\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"c\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"d\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"e\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"f\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"g\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"h\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"i\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"j\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"k\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"l\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"m\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"n\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"o\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"p\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"q\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"r\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"s\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"t\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"u\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"v\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"w\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"x\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"y\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"z\"] ) NUMBER[\"0\"] ) ( input_item )+ )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                // grammar/antlr_3/bc.g:32:36: ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:32:49: ^( VAR LETTER[\"a\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "a"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:33:36: ^( ASSIGN_OP ^( VAR LETTER[\"b\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:33:49: ^( VAR LETTER[\"b\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "b"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:34:36: ^( ASSIGN_OP ^( VAR LETTER[\"c\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:34:49: ^( VAR LETTER[\"c\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "c"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:35:36: ^( ASSIGN_OP ^( VAR LETTER[\"d\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:35:49: ^( VAR LETTER[\"d\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "d"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:36:36: ^( ASSIGN_OP ^( VAR LETTER[\"e\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:36:49: ^( VAR LETTER[\"e\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "e"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:37:36: ^( ASSIGN_OP ^( VAR LETTER[\"f\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:37:49: ^( VAR LETTER[\"f\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "f"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:38:36: ^( ASSIGN_OP ^( VAR LETTER[\"g\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:38:49: ^( VAR LETTER[\"g\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "g"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:39:36: ^( ASSIGN_OP ^( VAR LETTER[\"h\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:39:49: ^( VAR LETTER[\"h\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "h"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:40:36: ^( ASSIGN_OP ^( VAR LETTER[\"i\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:40:49: ^( VAR LETTER[\"i\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "i"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:41:36: ^( ASSIGN_OP ^( VAR LETTER[\"j\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:41:49: ^( VAR LETTER[\"j\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "j"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:42:36: ^( ASSIGN_OP ^( VAR LETTER[\"k\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:42:49: ^( VAR LETTER[\"k\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "k"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:43:36: ^( ASSIGN_OP ^( VAR LETTER[\"l\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:43:49: ^( VAR LETTER[\"l\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "l"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:44:36: ^( ASSIGN_OP ^( VAR LETTER[\"m\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:44:49: ^( VAR LETTER[\"m\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "m"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:45:36: ^( ASSIGN_OP ^( VAR LETTER[\"n\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:45:49: ^( VAR LETTER[\"n\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "n"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:46:36: ^( ASSIGN_OP ^( VAR LETTER[\"o\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:46:49: ^( VAR LETTER[\"o\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "o"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:47:36: ^( ASSIGN_OP ^( VAR LETTER[\"p\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:47:49: ^( VAR LETTER[\"p\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "p"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:48:36: ^( ASSIGN_OP ^( VAR LETTER[\"q\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:48:49: ^( VAR LETTER[\"q\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "q"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:49:36: ^( ASSIGN_OP ^( VAR LETTER[\"r\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:49:49: ^( VAR LETTER[\"r\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "r"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:50:36: ^( ASSIGN_OP ^( VAR LETTER[\"s\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:50:49: ^( VAR LETTER[\"s\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "s"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:51:36: ^( ASSIGN_OP ^( VAR LETTER[\"t\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:51:49: ^( VAR LETTER[\"t\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "t"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:52:36: ^( ASSIGN_OP ^( VAR LETTER[\"u\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:52:49: ^( VAR LETTER[\"u\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "u"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:53:36: ^( ASSIGN_OP ^( VAR LETTER[\"v\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:53:49: ^( VAR LETTER[\"v\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "v"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:54:36: ^( ASSIGN_OP ^( VAR LETTER[\"w\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:54:49: ^( VAR LETTER[\"w\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "w"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:55:36: ^( ASSIGN_OP ^( VAR LETTER[\"x\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:55:49: ^( VAR LETTER[\"x\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "x"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:56:36: ^( ASSIGN_OP ^( VAR LETTER[\"y\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:56:49: ^( VAR LETTER[\"y\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "y"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:57:36: ^( ASSIGN_OP ^( VAR LETTER[\"z\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:57:49: ^( VAR LETTER[\"z\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "z"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:58:36: ( input_item )+
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
    // grammar/antlr_3/bc.g:61:1: input_item : semicolon_list NEWLINE! ;
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NEWLINE5=null;
        semicolon_list_return semicolon_list4 = null;


        CommonTree NEWLINE5_tree=null;

        try {
            // grammar/antlr_3/bc.g:62:5: ( semicolon_list NEWLINE! )
            // grammar/antlr_3/bc.g:62:5: semicolon_list NEWLINE!
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_semicolon_list_in_input_item1496);
            semicolon_list4=semicolon_list();
            _fsp--;

            adaptor.addChild(root_0, semicolon_list4.tree);
            NEWLINE5=(Token)input.LT(1);
            match(input,NEWLINE,FOLLOW_NEWLINE_in_input_item1498); 

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
    // grammar/antlr_3/bc.g:65:1: semicolon_list : ( statement )? ( SEMICOLON! ( statement )? )* ;
    public semicolon_list_return semicolon_list() throws RecognitionException {   
        semicolon_list_return retval = new semicolon_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEMICOLON7=null;
        statement_return statement6 = null;

        statement_return statement8 = null;


        CommonTree SEMICOLON7_tree=null;

        try {
            // grammar/antlr_3/bc.g:66:5: ( ( statement )? ( SEMICOLON! ( statement )? )* )
            // grammar/antlr_3/bc.g:66:5: ( statement )? ( SEMICOLON! ( statement )? )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // grammar/antlr_3/bc.g:66:5: ( statement )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( ((LA2_0>=STRING && LA2_0<=LETTER)||LA2_0==MINUS||LA2_0==NUMBER||LA2_0==23) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // grammar/antlr_3/bc.g:66:5: statement
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_statement_in_semicolon_list1513);
                    statement6=statement();
                    _fsp--;

                    adaptor.addChild(root_1, statement6.tree);

                    adaptor.addChild(root_0, root_1);

                    }
                    break;

            }

            // grammar/antlr_3/bc.g:66:16: ( SEMICOLON! ( statement )? )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( (LA4_0==SEMICOLON) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:66:18: SEMICOLON! ( statement )?
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    SEMICOLON7=(Token)input.LT(1);
            	    match(input,SEMICOLON,FOLLOW_SEMICOLON_in_semicolon_list1518); 
            	    // grammar/antlr_3/bc.g:66:29: ( statement )?
            	    int alt3=2;
            	    int LA3_0 = input.LA(1);
            	    if ( ((LA3_0>=STRING && LA3_0<=LETTER)||LA3_0==MINUS||LA3_0==NUMBER||LA3_0==23) ) {
            	        alt3=1;
            	    }
            	    switch (alt3) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:66:29: statement
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            pushFollow(FOLLOW_statement_in_semicolon_list1521);
            	            statement8=statement();
            	            _fsp--;

            	            adaptor.addChild(root_2, statement8.tree);

            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }


            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop4;
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
    // grammar/antlr_3/bc.g:70:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( SAY expression ) | STRING -> ^( PRINT STRING ) );
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token ASSIGN_OP10=null;
        Token STRING13=null;
        named_expression_return named_expression9 = null;

        expression_return expression11 = null;

        expression_return expression12 = null;

        List list_expression=new ArrayList();
        List list_STRING=new ArrayList();
        CommonTree ASSIGN_OP10_tree=null;
        CommonTree STRING13_tree=null;

        try {
            // grammar/antlr_3/bc.g:71:5: ( named_expression ASSIGN_OP^^ expression | expression -> ^( SAY expression ) | STRING -> ^( PRINT STRING ) )
            int alt5=3;
            switch ( input.LA(1) ) {
            case LETTER:
                int LA5_1 = input.LA(2);
                if ( (LA5_1==ASSIGN_OP) ) {
                    alt5=1;
                }
                else if ( ((LA5_1>=NEWLINE && LA5_1<=SEMICOLON)||(LA5_1>=PLUS && LA5_1<=MUL_OP)) ) {
                    alt5=2;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("70:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( SAY expression ) | STRING -> ^( PRINT STRING ) );", 5, 1, input);

                    throw nvae;
                }
                break;
            case INCR_DECR:
            case MINUS:
            case NUMBER:
            case 23:
                alt5=2;
                break;
            case STRING:
                alt5=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("70:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( SAY expression ) | STRING -> ^( PRINT STRING ) );", 5, 0, input);

                throw nvae;
            }

            switch (alt5) {
                case 1 :
                    // grammar/antlr_3/bc.g:71:5: named_expression ASSIGN_OP^^ expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_statement1539);
                    named_expression9=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression9.tree);
                    ASSIGN_OP10=(Token)input.LT(1);
                    match(input,ASSIGN_OP,FOLLOW_ASSIGN_OP_in_statement1541); 
                    ASSIGN_OP10_tree = (CommonTree)adaptor.create(ASSIGN_OP10);
                    root_0 = (CommonTree)adaptor.becomeRoot(ASSIGN_OP10_tree, root_0);

                    pushFollow(FOLLOW_expression_in_statement1544);
                    expression11=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression11.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:73:5: expression
                    {
                    pushFollow(FOLLOW_expression_in_statement1556);
                    expression12=expression();
                    _fsp--;

                    list_expression.add(expression12.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 73:16: -> ^( SAY expression )
                    {
                        // grammar/antlr_3/bc.g:73:19: ^( SAY expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(SAY, "SAY"), root_1);

                        adaptor.addChild(root_1, list_expression.get(i_0));

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:75:5: STRING
                    {
                    STRING13=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_statement1578); 
                    list_STRING.add(STRING13);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 75:12: -> ^( PRINT STRING )
                    {
                        // grammar/antlr_3/bc.g:75:15: ^( PRINT STRING )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PRINT, "PRINT"), root_1);

                        adaptor.addChild(root_1, (Token)list_STRING.get(i_0));

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
    // $ANTLR end statement

    public static class expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start expression
    // grammar/antlr_3/bc.g:78:1: expression : ( adding_expression | INCR_DECR named_expression -> ^( PLUS named_expression NUMBER["1"] ) );
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token INCR_DECR15=null;
        adding_expression_return adding_expression14 = null;

        named_expression_return named_expression16 = null;

        List list_named_expression=new ArrayList();
        List list_INCR_DECR=new ArrayList();
        CommonTree INCR_DECR15_tree=null;

        try {
            // grammar/antlr_3/bc.g:79:5: ( adding_expression | INCR_DECR named_expression -> ^( PLUS named_expression NUMBER[\"1\"] ) )
            int alt6=2;
            int LA6_0 = input.LA(1);
            if ( (LA6_0==LETTER||LA6_0==MINUS||LA6_0==NUMBER||LA6_0==23) ) {
                alt6=1;
            }
            else if ( (LA6_0==INCR_DECR) ) {
                alt6=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("78:1: expression : ( adding_expression | INCR_DECR named_expression -> ^( PLUS named_expression NUMBER[\"1\"] ) );", 6, 0, input);

                throw nvae;
            }
            switch (alt6) {
                case 1 :
                    // grammar/antlr_3/bc.g:79:5: adding_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_adding_expression_in_expression1601);
                    adding_expression14=adding_expression();
                    _fsp--;

                    adaptor.addChild(root_0, adding_expression14.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:81:5: INCR_DECR named_expression
                    {
                    INCR_DECR15=(Token)input.LT(1);
                    match(input,INCR_DECR,FOLLOW_INCR_DECR_in_expression1613); 
                    list_INCR_DECR.add(INCR_DECR15);

                    pushFollow(FOLLOW_named_expression_in_expression1615);
                    named_expression16=named_expression();
                    _fsp--;

                    list_named_expression.add(named_expression16.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 81:32: -> ^( PLUS named_expression NUMBER[\"1\"] )
                    {
                        // grammar/antlr_3/bc.g:81:35: ^( PLUS named_expression NUMBER[\"1\"] )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PLUS, "PLUS"), root_1);

                        adaptor.addChild(root_1, list_named_expression.get(i_0));
                        adaptor.addChild(root_1, adaptor.create(NUMBER, "1"));

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

    public static class named_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start named_expression
    // grammar/antlr_3/bc.g:84:1: named_expression : LETTER -> ^( VAR LETTER ) ;
    public named_expression_return named_expression() throws RecognitionException {   
        named_expression_return retval = new named_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER17=null;
        List list_LETTER=new ArrayList();
        CommonTree LETTER17_tree=null;

        try {
            // grammar/antlr_3/bc.g:85:5: ( LETTER -> ^( VAR LETTER ) )
            // grammar/antlr_3/bc.g:85:5: LETTER
            {
            LETTER17=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_named_expression1641); 
            list_LETTER.add(LETTER17);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 85:12: -> ^( VAR LETTER )
            {
                // grammar/antlr_3/bc.g:85:15: ^( VAR LETTER )
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
    // grammar/antlr_3/bc.g:89:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS19=null;
        Token MINUS20=null;
        multiplying_expression_return multiplying_expression18 = null;

        multiplying_expression_return multiplying_expression21 = null;


        CommonTree PLUS19_tree=null;
        CommonTree MINUS20_tree=null;

        try {
            // grammar/antlr_3/bc.g:90:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // grammar/antlr_3/bc.g:90:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression1666);
            multiplying_expression18=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression18.tree);
            // grammar/antlr_3/bc.g:90:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop8:
            do {
                int alt8=2;
                int LA8_0 = input.LA(1);
                if ( ((LA8_0>=PLUS && LA8_0<=MINUS)) ) {
                    alt8=1;
                }


                switch (alt8) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:90:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // grammar/antlr_3/bc.g:90:30: ( PLUS^^ | MINUS^^ )
            	    int alt7=2;
            	    int LA7_0 = input.LA(1);
            	    if ( (LA7_0==PLUS) ) {
            	        alt7=1;
            	    }
            	    else if ( (LA7_0==MINUS) ) {
            	        alt7=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("90:30: ( PLUS^^ | MINUS^^ )", 7, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt7) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:90:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS19=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression1672); 
            	            PLUS19_tree = (CommonTree)adaptor.create(PLUS19);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS19_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // grammar/antlr_3/bc.g:90:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS20=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression1677); 
            	            MINUS20_tree = (CommonTree)adaptor.create(MINUS20);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS20_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression1682);
            	    multiplying_expression21=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression21.tree);

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
    // $ANTLR end adding_expression

    public static class multiplying_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start multiplying_expression
    // grammar/antlr_3/bc.g:93:1: multiplying_expression : unary_expression ( MUL_OP^^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP23=null;
        unary_expression_return unary_expression22 = null;

        unary_expression_return unary_expression24 = null;


        CommonTree MUL_OP23_tree=null;

        try {
            // grammar/antlr_3/bc.g:94:5: ( unary_expression ( MUL_OP^^ unary_expression )* )
            // grammar/antlr_3/bc.g:94:5: unary_expression ( MUL_OP^^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression1698);
            unary_expression22=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression22.tree);
            // grammar/antlr_3/bc.g:94:22: ( MUL_OP^^ unary_expression )*
            loop9:
            do {
                int alt9=2;
                int LA9_0 = input.LA(1);
                if ( (LA9_0==MUL_OP) ) {
                    alt9=1;
                }


                switch (alt9) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:94:24: MUL_OP^^ unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    MUL_OP23=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression1702); 
            	    MUL_OP23_tree = (CommonTree)adaptor.create(MUL_OP23);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP23_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression1705);
            	    unary_expression24=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression24.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop9;
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
    // grammar/antlr_3/bc.g:97:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( UNARY_MINUS postfix_expression ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS26=null;
        postfix_expression_return postfix_expression25 = null;

        postfix_expression_return postfix_expression27 = null;

        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        CommonTree MINUS26_tree=null;

        try {
            // grammar/antlr_3/bc.g:98:5: ( postfix_expression | MINUS postfix_expression -> ^( UNARY_MINUS postfix_expression ) )
            int alt10=2;
            int LA10_0 = input.LA(1);
            if ( (LA10_0==LETTER||LA10_0==NUMBER||LA10_0==23) ) {
                alt10=1;
            }
            else if ( (LA10_0==MINUS) ) {
                alt10=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("97:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( UNARY_MINUS postfix_expression ) );", 10, 0, input);

                throw nvae;
            }
            switch (alt10) {
                case 1 :
                    // grammar/antlr_3/bc.g:98:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1721);
                    postfix_expression25=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression25.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:100:5: MINUS postfix_expression
                    {
                    MINUS26=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression1733); 
                    list_MINUS.add(MINUS26);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1735);
                    postfix_expression27=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression27.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 100:30: -> ^( UNARY_MINUS postfix_expression )
                    {
                        // grammar/antlr_3/bc.g:100:33: ^( UNARY_MINUS postfix_expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(UNARY_MINUS, "UNARY_MINUS"), root_1);

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
    // grammar/antlr_3/bc.g:103:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER28=null;
        Token char_literal30=null;
        Token char_literal32=null;
        named_expression_return named_expression29 = null;

        expression_return expression31 = null;

        List list_expression=new ArrayList();
        List list_24=new ArrayList();
        List list_23=new ArrayList();
        CommonTree NUMBER28_tree=null;
        CommonTree char_literal30_tree=null;
        CommonTree char_literal32_tree=null;

        try {
            // grammar/antlr_3/bc.g:104:5: ( NUMBER | named_expression | '(' expression ')' -> expression )
            int alt11=3;
            switch ( input.LA(1) ) {
            case NUMBER:
                alt11=1;
                break;
            case LETTER:
                alt11=2;
                break;
            case 23:
                alt11=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("103:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );", 11, 0, input);

                throw nvae;
            }

            switch (alt11) {
                case 1 :
                    // grammar/antlr_3/bc.g:104:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER28=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression1758); 
                    NUMBER28_tree = (CommonTree)adaptor.create(NUMBER28);
                    adaptor.addChild(root_0, NUMBER28_tree);


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:106:5: named_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_postfix_expression1770);
                    named_expression29=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression29.tree);

                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:108:5: '(' expression ')'
                    {
                    char_literal30=(Token)input.LT(1);
                    match(input,23,FOLLOW_23_in_postfix_expression1787); 
                    list_23.add(char_literal30);

                    pushFollow(FOLLOW_expression_in_postfix_expression1789);
                    expression31=expression();
                    _fsp--;

                    list_expression.add(expression31.tree);
                    char_literal32=(Token)input.LT(1);
                    match(input,24,FOLLOW_24_in_postfix_expression1791); 
                    list_24.add(char_literal32);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 108:24: -> expression
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


 

    public static final BitSet FOLLOW_input_item_in_program105 = new BitSet(new long[]{0x00000000008AEE00L});
    public static final BitSet FOLLOW_Quit_in_program108 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_NEWLINE_in_program110 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_semicolon_list_in_input_item1496 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_NEWLINE_in_input_item1498 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list1513 = new BitSet(new long[]{0x0000000000000802L});
    public static final BitSet FOLLOW_SEMICOLON_in_semicolon_list1518 = new BitSet(new long[]{0x00000000008AE802L});
    public static final BitSet FOLLOW_statement_in_semicolon_list1521 = new BitSet(new long[]{0x0000000000000802L});
    public static final BitSet FOLLOW_named_expression_in_statement1539 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_ASSIGN_OP_in_statement1541 = new BitSet(new long[]{0x00000000008AC000L});
    public static final BitSet FOLLOW_expression_in_statement1544 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_statement1556 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_statement1578 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression1601 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INCR_DECR_in_expression1613 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_named_expression_in_expression1615 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_named_expression1641 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1666 = new BitSet(new long[]{0x0000000000030002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression1672 = new BitSet(new long[]{0x00000000008A8000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression1677 = new BitSet(new long[]{0x00000000008A8000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1682 = new BitSet(new long[]{0x0000000000030002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1698 = new BitSet(new long[]{0x0000000000040002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression1702 = new BitSet(new long[]{0x00000000008A8000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1705 = new BitSet(new long[]{0x0000000000040002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1721 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression1733 = new BitSet(new long[]{0x0000000000888000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1735 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression1758 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_named_expression_in_postfix_expression1770 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_23_in_postfix_expression1787 = new BitSet(new long[]{0x00000000008AC000L});
    public static final BitSet FOLLOW_expression_in_postfix_expression1789 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_24_in_postfix_expression1791 = new BitSet(new long[]{0x0000000000000002L});

}