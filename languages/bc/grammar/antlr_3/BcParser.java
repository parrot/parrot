// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-18 23:24:57

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class BcParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PRINT", "PROGRAM", "VAR", "Quit", "NEWLINE", "SEMICOLON", "ASSIGN_OP", "STRING", "LETTER", "PLUS", "MINUS", "MUL_OP", "INCR", "DECR", "NUMBER", "INTEGER", "ML_COMMENT", "WS", "'('", "')'"
    };
    public static final int LETTER=12;
    public static final int MINUS=14;
    public static final int INCR=16;
    public static final int WS=21;
    public static final int DECR=17;
    public static final int NUMBER=18;
    public static final int STRING=11;
    public static final int MUL_OP=15;
    public static final int Quit=7;
    public static final int PROGRAM=5;
    public static final int NEWLINE=8;
    public static final int VAR=6;
    public static final int ASSIGN_OP=10;
    public static final int INTEGER=19;
    public static final int PRINT=4;
    public static final int SEMICOLON=9;
    public static final int EOF=-1;
    public static final int ML_COMMENT=20;
    public static final int PLUS=13;

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
    // grammar/antlr_3/bc.g:28:1: program : ( input_item )+ Quit NEWLINE -> ^( PROGRAM ^( ASSIGN_OP ^( VAR LETTER["a"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["b"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["c"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["d"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["e"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["f"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["g"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["h"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["i"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["j"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["k"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["l"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["m"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["n"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["o"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["p"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["q"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["r"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["s"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["t"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["u"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["v"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["w"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["x"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["y"] ) NUMBER["0"] ) ^( ASSIGN_OP ^( VAR LETTER["z"] ) NUMBER["0"] ) ( input_item )+ ) ;
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
            // grammar/antlr_3/bc.g:29:5: ( ( input_item )+ Quit NEWLINE -> ^( PROGRAM ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"b\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"c\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"d\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"e\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"f\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"g\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"h\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"i\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"j\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"k\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"l\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"m\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"n\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"o\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"p\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"q\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"r\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"s\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"t\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"u\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"v\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"w\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"x\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"y\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"z\"] ) NUMBER[\"0\"] ) ( input_item )+ ) )
            // grammar/antlr_3/bc.g:29:5: ( input_item )+ Quit NEWLINE
            {
            // grammar/antlr_3/bc.g:29:5: ( input_item )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( ((LA1_0>=NEWLINE && LA1_0<=SEMICOLON)||(LA1_0>=STRING && LA1_0<=LETTER)||LA1_0==MINUS||(LA1_0>=INCR && LA1_0<=NUMBER)||LA1_0==22) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:29:5: input_item
            	    {
            	    pushFollow(FOLLOW_input_item_in_program95);
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
            match(input,Quit,FOLLOW_Quit_in_program98); 
            list_Quit.add(Quit2);

            NEWLINE3=(Token)input.LT(1);
            match(input,NEWLINE,FOLLOW_NEWLINE_in_program100); 
            list_NEWLINE.add(NEWLINE3);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 29:30: -> ^( PROGRAM ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"b\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"c\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"d\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"e\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"f\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"g\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"h\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"i\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"j\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"k\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"l\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"m\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"n\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"o\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"p\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"q\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"r\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"s\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"t\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"u\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"v\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"w\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"x\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"y\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"z\"] ) NUMBER[\"0\"] ) ( input_item )+ )
            {
                // grammar/antlr_3/bc.g:29:33: ^( PROGRAM ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"b\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"c\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"d\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"e\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"f\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"g\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"h\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"i\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"j\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"k\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"l\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"m\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"n\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"o\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"p\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"q\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"r\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"s\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"t\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"u\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"v\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"w\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"x\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"y\"] ) NUMBER[\"0\"] ) ^( ASSIGN_OP ^( VAR LETTER[\"z\"] ) NUMBER[\"0\"] ) ( input_item )+ )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                // grammar/antlr_3/bc.g:30:36: ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:30:49: ^( VAR LETTER[\"a\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "a"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:31:36: ^( ASSIGN_OP ^( VAR LETTER[\"b\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:31:49: ^( VAR LETTER[\"b\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "b"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:32:36: ^( ASSIGN_OP ^( VAR LETTER[\"c\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:32:49: ^( VAR LETTER[\"c\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "c"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:33:36: ^( ASSIGN_OP ^( VAR LETTER[\"d\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:33:49: ^( VAR LETTER[\"d\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "d"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:34:36: ^( ASSIGN_OP ^( VAR LETTER[\"e\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:34:49: ^( VAR LETTER[\"e\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "e"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:35:36: ^( ASSIGN_OP ^( VAR LETTER[\"f\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:35:49: ^( VAR LETTER[\"f\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "f"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:36:36: ^( ASSIGN_OP ^( VAR LETTER[\"g\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:36:49: ^( VAR LETTER[\"g\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "g"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:37:36: ^( ASSIGN_OP ^( VAR LETTER[\"h\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:37:49: ^( VAR LETTER[\"h\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "h"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:38:36: ^( ASSIGN_OP ^( VAR LETTER[\"i\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:38:49: ^( VAR LETTER[\"i\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "i"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:39:36: ^( ASSIGN_OP ^( VAR LETTER[\"j\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:39:49: ^( VAR LETTER[\"j\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "j"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:40:36: ^( ASSIGN_OP ^( VAR LETTER[\"k\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:40:49: ^( VAR LETTER[\"k\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "k"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:41:36: ^( ASSIGN_OP ^( VAR LETTER[\"l\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:41:49: ^( VAR LETTER[\"l\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "l"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:42:36: ^( ASSIGN_OP ^( VAR LETTER[\"m\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:42:49: ^( VAR LETTER[\"m\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "m"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:43:36: ^( ASSIGN_OP ^( VAR LETTER[\"n\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:43:49: ^( VAR LETTER[\"n\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "n"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:44:36: ^( ASSIGN_OP ^( VAR LETTER[\"o\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:44:49: ^( VAR LETTER[\"o\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "o"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:45:36: ^( ASSIGN_OP ^( VAR LETTER[\"p\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:45:49: ^( VAR LETTER[\"p\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "p"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:46:36: ^( ASSIGN_OP ^( VAR LETTER[\"q\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:46:49: ^( VAR LETTER[\"q\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "q"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:47:36: ^( ASSIGN_OP ^( VAR LETTER[\"r\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:47:49: ^( VAR LETTER[\"r\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "r"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:48:36: ^( ASSIGN_OP ^( VAR LETTER[\"s\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:48:49: ^( VAR LETTER[\"s\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "s"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:49:36: ^( ASSIGN_OP ^( VAR LETTER[\"t\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:49:49: ^( VAR LETTER[\"t\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "t"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:50:36: ^( ASSIGN_OP ^( VAR LETTER[\"u\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:50:49: ^( VAR LETTER[\"u\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "u"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:51:36: ^( ASSIGN_OP ^( VAR LETTER[\"v\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:51:49: ^( VAR LETTER[\"v\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "v"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:52:36: ^( ASSIGN_OP ^( VAR LETTER[\"w\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:52:49: ^( VAR LETTER[\"w\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "w"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:53:36: ^( ASSIGN_OP ^( VAR LETTER[\"x\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:53:49: ^( VAR LETTER[\"x\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "x"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:54:36: ^( ASSIGN_OP ^( VAR LETTER[\"y\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:54:49: ^( VAR LETTER[\"y\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "y"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:55:36: ^( ASSIGN_OP ^( VAR LETTER[\"z\"] ) NUMBER[\"0\"] )
                {
                CommonTree root_2 = (CommonTree)adaptor.nil();
                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_2);

                // grammar/antlr_3/bc.g:55:49: ^( VAR LETTER[\"z\"] )
                {
                CommonTree root_3 = (CommonTree)adaptor.nil();
                root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                adaptor.addChild(root_3, adaptor.create(LETTER, "z"));

                adaptor.addChild(root_2, root_3);
                }
                adaptor.addChild(root_2, adaptor.create(NUMBER, "0"));

                adaptor.addChild(root_1, root_2);
                }
                // grammar/antlr_3/bc.g:56:36: ( input_item )+
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
    // grammar/antlr_3/bc.g:59:1: input_item : semicolon_list NEWLINE! ;
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NEWLINE5=null;
        semicolon_list_return semicolon_list4 = null;


        CommonTree NEWLINE5_tree=null;

        try {
            // grammar/antlr_3/bc.g:60:5: ( semicolon_list NEWLINE! )
            // grammar/antlr_3/bc.g:60:5: semicolon_list NEWLINE!
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_semicolon_list_in_input_item1486);
            semicolon_list4=semicolon_list();
            _fsp--;

            adaptor.addChild(root_0, semicolon_list4.tree);
            NEWLINE5=(Token)input.LT(1);
            match(input,NEWLINE,FOLLOW_NEWLINE_in_input_item1488); 

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
    // grammar/antlr_3/bc.g:63:1: semicolon_list : ( statement )? ( SEMICOLON! ( statement )? )* ;
    public semicolon_list_return semicolon_list() throws RecognitionException {   
        semicolon_list_return retval = new semicolon_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEMICOLON7=null;
        statement_return statement6 = null;

        statement_return statement8 = null;


        CommonTree SEMICOLON7_tree=null;

        try {
            // grammar/antlr_3/bc.g:64:5: ( ( statement )? ( SEMICOLON! ( statement )? )* )
            // grammar/antlr_3/bc.g:64:5: ( statement )? ( SEMICOLON! ( statement )? )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // grammar/antlr_3/bc.g:64:5: ( statement )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( ((LA2_0>=STRING && LA2_0<=LETTER)||LA2_0==MINUS||(LA2_0>=INCR && LA2_0<=NUMBER)||LA2_0==22) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // grammar/antlr_3/bc.g:64:5: statement
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_statement_in_semicolon_list1503);
                    statement6=statement();
                    _fsp--;

                    adaptor.addChild(root_1, statement6.tree);

                    adaptor.addChild(root_0, root_1);

                    }
                    break;

            }

            // grammar/antlr_3/bc.g:64:16: ( SEMICOLON! ( statement )? )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( (LA4_0==SEMICOLON) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:64:18: SEMICOLON! ( statement )?
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    SEMICOLON7=(Token)input.LT(1);
            	    match(input,SEMICOLON,FOLLOW_SEMICOLON_in_semicolon_list1508); 
            	    // grammar/antlr_3/bc.g:64:29: ( statement )?
            	    int alt3=2;
            	    int LA3_0 = input.LA(1);
            	    if ( ((LA3_0>=STRING && LA3_0<=LETTER)||LA3_0==MINUS||(LA3_0>=INCR && LA3_0<=NUMBER)||LA3_0==22) ) {
            	        alt3=1;
            	    }
            	    switch (alt3) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:64:29: statement
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            pushFollow(FOLLOW_statement_in_semicolon_list1511);
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
    // grammar/antlr_3/bc.g:67:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) );
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
            // grammar/antlr_3/bc.g:68:5: ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) )
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
                        new NoViableAltException("67:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) );", 5, 1, input);

                    throw nvae;
                }
                break;
            case MINUS:
            case INCR:
            case DECR:
            case NUMBER:
            case 22:
                alt5=2;
                break;
            case STRING:
                alt5=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("67:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) );", 5, 0, input);

                throw nvae;
            }

            switch (alt5) {
                case 1 :
                    // grammar/antlr_3/bc.g:68:5: named_expression ASSIGN_OP^^ expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_statement1528);
                    named_expression9=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression9.tree);
                    ASSIGN_OP10=(Token)input.LT(1);
                    match(input,ASSIGN_OP,FOLLOW_ASSIGN_OP_in_statement1530); 
                    ASSIGN_OP10_tree = (CommonTree)adaptor.create(ASSIGN_OP10);
                    root_0 = (CommonTree)adaptor.becomeRoot(ASSIGN_OP10_tree, root_0);

                    pushFollow(FOLLOW_expression_in_statement1533);
                    expression11=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression11.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:70:5: expression
                    {
                    pushFollow(FOLLOW_expression_in_statement1545);
                    expression12=expression();
                    _fsp--;

                    list_expression.add(expression12.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 70:16: -> ^( PRINT expression ) ^( PRINT NEWLINE )
                    {
                        // grammar/antlr_3/bc.g:70:19: ^( PRINT expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PRINT, "PRINT"), root_1);

                        adaptor.addChild(root_1, list_expression.get(i_0));

                        adaptor.addChild(root_0, root_1);
                        }
                        // grammar/antlr_3/bc.g:70:41: ^( PRINT NEWLINE )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PRINT, "PRINT"), root_1);

                        adaptor.addChild(root_1, adaptor.create(NEWLINE, "NEWLINE"));

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:72:5: STRING
                    {
                    STRING13=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_statement1575); 
                    list_STRING.add(STRING13);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 72:12: -> ^( PRINT STRING )
                    {
                        // grammar/antlr_3/bc.g:72:15: ^( PRINT STRING )
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
    // grammar/antlr_3/bc.g:75:1: expression : adding_expression ;
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        adding_expression_return adding_expression14 = null;



        try {
            // grammar/antlr_3/bc.g:76:5: ( adding_expression )
            // grammar/antlr_3/bc.g:76:5: adding_expression
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_adding_expression_in_expression1598);
            adding_expression14=adding_expression();
            _fsp--;

            adaptor.addChild(root_0, adding_expression14.tree);

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
    // grammar/antlr_3/bc.g:79:1: named_expression : LETTER -> ^( VAR LETTER ) ;
    public named_expression_return named_expression() throws RecognitionException {   
        named_expression_return retval = new named_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER15=null;
        List list_LETTER=new ArrayList();
        CommonTree LETTER15_tree=null;

        try {
            // grammar/antlr_3/bc.g:80:5: ( LETTER -> ^( VAR LETTER ) )
            // grammar/antlr_3/bc.g:80:5: LETTER
            {
            LETTER15=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_named_expression1611); 
            list_LETTER.add(LETTER15);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 80:12: -> ^( VAR LETTER )
            {
                // grammar/antlr_3/bc.g:80:15: ^( VAR LETTER )
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
    // grammar/antlr_3/bc.g:84:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS17=null;
        Token MINUS18=null;
        multiplying_expression_return multiplying_expression16 = null;

        multiplying_expression_return multiplying_expression19 = null;


        CommonTree PLUS17_tree=null;
        CommonTree MINUS18_tree=null;

        try {
            // grammar/antlr_3/bc.g:85:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // grammar/antlr_3/bc.g:85:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression1636);
            multiplying_expression16=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression16.tree);
            // grammar/antlr_3/bc.g:85:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop7:
            do {
                int alt7=2;
                int LA7_0 = input.LA(1);
                if ( ((LA7_0>=PLUS && LA7_0<=MINUS)) ) {
                    alt7=1;
                }


                switch (alt7) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:85:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // grammar/antlr_3/bc.g:85:30: ( PLUS^^ | MINUS^^ )
            	    int alt6=2;
            	    int LA6_0 = input.LA(1);
            	    if ( (LA6_0==PLUS) ) {
            	        alt6=1;
            	    }
            	    else if ( (LA6_0==MINUS) ) {
            	        alt6=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("85:30: ( PLUS^^ | MINUS^^ )", 6, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt6) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:85:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS17=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression1642); 
            	            PLUS17_tree = (CommonTree)adaptor.create(PLUS17);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS17_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // grammar/antlr_3/bc.g:85:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS18=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression1647); 
            	            MINUS18_tree = (CommonTree)adaptor.create(MINUS18);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS18_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression1652);
            	    multiplying_expression19=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression19.tree);

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
    // $ANTLR end adding_expression

    public static class multiplying_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start multiplying_expression
    // grammar/antlr_3/bc.g:88:1: multiplying_expression : unary_expression ( MUL_OP^^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP21=null;
        unary_expression_return unary_expression20 = null;

        unary_expression_return unary_expression22 = null;


        CommonTree MUL_OP21_tree=null;

        try {
            // grammar/antlr_3/bc.g:89:5: ( unary_expression ( MUL_OP^^ unary_expression )* )
            // grammar/antlr_3/bc.g:89:5: unary_expression ( MUL_OP^^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression1669);
            unary_expression20=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression20.tree);
            // grammar/antlr_3/bc.g:89:22: ( MUL_OP^^ unary_expression )*
            loop8:
            do {
                int alt8=2;
                int LA8_0 = input.LA(1);
                if ( (LA8_0==MUL_OP) ) {
                    alt8=1;
                }


                switch (alt8) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:89:24: MUL_OP^^ unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    MUL_OP21=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression1673); 
            	    MUL_OP21_tree = (CommonTree)adaptor.create(MUL_OP21);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP21_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression1676);
            	    unary_expression22=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression22.tree);

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
    // grammar/antlr_3/bc.g:92:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP["*"] NUMBER["-1"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER["a"] ) ^( PLUS["+"] ^( VAR LETTER["a"] ) NUMBER["1"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER["a"] ) ^( MINUS["-"] ^( VAR LETTER["a"] ) NUMBER["1"] ) ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS24=null;
        Token INCR26=null;
        Token DECR28=null;
        postfix_expression_return postfix_expression23 = null;

        postfix_expression_return postfix_expression25 = null;

        named_expression_return named_expression27 = null;

        named_expression_return named_expression29 = null;

        List list_named_expression=new ArrayList();
        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        List list_INCR=new ArrayList();
        List list_DECR=new ArrayList();
        CommonTree MINUS24_tree=null;
        CommonTree INCR26_tree=null;
        CommonTree DECR28_tree=null;

        try {
            // grammar/antlr_3/bc.g:93:5: ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) )
            int alt9=4;
            switch ( input.LA(1) ) {
            case LETTER:
            case NUMBER:
            case 22:
                alt9=1;
                break;
            case MINUS:
                alt9=2;
                break;
            case INCR:
                alt9=3;
                break;
            case DECR:
                alt9=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("92:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) );", 9, 0, input);

                throw nvae;
            }

            switch (alt9) {
                case 1 :
                    // grammar/antlr_3/bc.g:93:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1692);
                    postfix_expression23=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression23.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:95:5: MINUS postfix_expression
                    {
                    MINUS24=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression1704); 
                    list_MINUS.add(MINUS24);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1706);
                    postfix_expression25=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression25.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 95:30: -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression )
                    {
                        // grammar/antlr_3/bc.g:95:33: ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(MUL_OP, "*"), root_1);

                        adaptor.addChild(root_1, adaptor.create(NUMBER, "-1"));
                        adaptor.addChild(root_1, list_postfix_expression.get(i_0));

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:97:5: INCR named_expression
                    {
                    INCR26=(Token)input.LT(1);
                    match(input,INCR,FOLLOW_INCR_in_unary_expression1732); 
                    list_INCR.add(INCR26);

                    pushFollow(FOLLOW_named_expression_in_unary_expression1734);
                    named_expression27=named_expression();
                    _fsp--;

                    list_named_expression.add(named_expression27.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 97:27: -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                    {
                        // grammar/antlr_3/bc.g:97:30: ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_1);

                        // grammar/antlr_3/bc.g:97:43: ^( VAR LETTER[\"a\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_2);

                        adaptor.addChild(root_2, adaptor.create(LETTER, "a"));

                        adaptor.addChild(root_1, root_2);
                        }
                        // grammar/antlr_3/bc.g:97:62: ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(PLUS, "+"), root_2);

                        // grammar/antlr_3/bc.g:97:75: ^( VAR LETTER[\"a\"] )
                        {
                        CommonTree root_3 = (CommonTree)adaptor.nil();
                        root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                        adaptor.addChild(root_3, adaptor.create(LETTER, "a"));

                        adaptor.addChild(root_2, root_3);
                        }
                        adaptor.addChild(root_2, adaptor.create(NUMBER, "1"));

                        adaptor.addChild(root_1, root_2);
                        }

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 4 :
                    // grammar/antlr_3/bc.g:99:5: DECR named_expression
                    {
                    DECR28=(Token)input.LT(1);
                    match(input,DECR,FOLLOW_DECR_in_unary_expression1778); 
                    list_DECR.add(DECR28);

                    pushFollow(FOLLOW_named_expression_in_unary_expression1780);
                    named_expression29=named_expression();
                    _fsp--;

                    list_named_expression.add(named_expression29.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 99:27: -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                    {
                        // grammar/antlr_3/bc.g:99:30: ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_1);

                        // grammar/antlr_3/bc.g:99:43: ^( VAR LETTER[\"a\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_2);

                        adaptor.addChild(root_2, adaptor.create(LETTER, "a"));

                        adaptor.addChild(root_1, root_2);
                        }
                        // grammar/antlr_3/bc.g:99:62: ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(MINUS, "-"), root_2);

                        // grammar/antlr_3/bc.g:99:76: ^( VAR LETTER[\"a\"] )
                        {
                        CommonTree root_3 = (CommonTree)adaptor.nil();
                        root_3 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_3);

                        adaptor.addChild(root_3, adaptor.create(LETTER, "a"));

                        adaptor.addChild(root_2, root_3);
                        }
                        adaptor.addChild(root_2, adaptor.create(NUMBER, "1"));

                        adaptor.addChild(root_1, root_2);
                        }

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
    // grammar/antlr_3/bc.g:102:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER30=null;
        Token char_literal32=null;
        Token char_literal34=null;
        named_expression_return named_expression31 = null;

        expression_return expression33 = null;

        List list_expression=new ArrayList();
        List list_22=new ArrayList();
        List list_23=new ArrayList();
        CommonTree NUMBER30_tree=null;
        CommonTree char_literal32_tree=null;
        CommonTree char_literal34_tree=null;

        try {
            // grammar/antlr_3/bc.g:103:5: ( NUMBER | named_expression | '(' expression ')' -> expression )
            int alt10=3;
            switch ( input.LA(1) ) {
            case NUMBER:
                alt10=1;
                break;
            case LETTER:
                alt10=2;
                break;
            case 22:
                alt10=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("102:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );", 10, 0, input);

                throw nvae;
            }

            switch (alt10) {
                case 1 :
                    // grammar/antlr_3/bc.g:103:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER30=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression1825); 
                    NUMBER30_tree = (CommonTree)adaptor.create(NUMBER30);
                    adaptor.addChild(root_0, NUMBER30_tree);


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:105:5: named_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_postfix_expression1837);
                    named_expression31=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression31.tree);

                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:107:5: '(' expression ')'
                    {
                    char_literal32=(Token)input.LT(1);
                    match(input,22,FOLLOW_22_in_postfix_expression1854); 
                    list_22.add(char_literal32);

                    pushFollow(FOLLOW_expression_in_postfix_expression1856);
                    expression33=expression();
                    _fsp--;

                    list_expression.add(expression33.tree);
                    char_literal34=(Token)input.LT(1);
                    match(input,23,FOLLOW_23_in_postfix_expression1858); 
                    list_23.add(char_literal34);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 107:24: -> expression
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


 

    public static final BitSet FOLLOW_input_item_in_program95 = new BitSet(new long[]{0x0000000000475B80L});
    public static final BitSet FOLLOW_Quit_in_program98 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_NEWLINE_in_program100 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_semicolon_list_in_input_item1486 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_NEWLINE_in_input_item1488 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list1503 = new BitSet(new long[]{0x0000000000000202L});
    public static final BitSet FOLLOW_SEMICOLON_in_semicolon_list1508 = new BitSet(new long[]{0x0000000000475A02L});
    public static final BitSet FOLLOW_statement_in_semicolon_list1511 = new BitSet(new long[]{0x0000000000000202L});
    public static final BitSet FOLLOW_named_expression_in_statement1528 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_ASSIGN_OP_in_statement1530 = new BitSet(new long[]{0x0000000000475000L});
    public static final BitSet FOLLOW_expression_in_statement1533 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_statement1545 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_statement1575 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression1598 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_named_expression1611 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1636 = new BitSet(new long[]{0x0000000000006002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression1642 = new BitSet(new long[]{0x0000000000475000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression1647 = new BitSet(new long[]{0x0000000000475000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1652 = new BitSet(new long[]{0x0000000000006002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1669 = new BitSet(new long[]{0x0000000000008002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression1673 = new BitSet(new long[]{0x0000000000475000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1676 = new BitSet(new long[]{0x0000000000008002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1692 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression1704 = new BitSet(new long[]{0x0000000000441000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1706 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INCR_in_unary_expression1732 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_named_expression_in_unary_expression1734 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DECR_in_unary_expression1778 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_named_expression_in_unary_expression1780 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression1825 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_named_expression_in_postfix_expression1837 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_postfix_expression1854 = new BitSet(new long[]{0x0000000000475000L});
    public static final BitSet FOLLOW_expression_in_postfix_expression1856 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_postfix_expression1858 = new BitSet(new long[]{0x0000000000000002L});

}