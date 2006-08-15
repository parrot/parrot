// $ANTLR 3.0b3 grammar/antlr_3/bc.g 2006-08-14 11:59:16

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class BcParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PRINT", "PROGRAM", "SAY", "UNARY_MINUS", "VAR", "Quit", "ASSIGN_OP", "STRING", "LETTER", "PLUS", "MINUS", "MUL_OP", "NUMBER", "INTEGER", "INCR_DECR", "ML_COMMENT", "WS", "NEWLINE", "';'", "'('", "')'"
    };
    public static final int INCR_DECR=18;
    public static final int LETTER=12;
    public static final int MINUS=14;
    public static final int WS=20;
    public static final int NUMBER=16;
    public static final int STRING=11;
    public static final int MUL_OP=15;
    public static final int Quit=9;
    public static final int PROGRAM=5;
    public static final int NEWLINE=21;
    public static final int VAR=8;
    public static final int ASSIGN_OP=10;
    public static final int INTEGER=17;
    public static final int SAY=6;
    public static final int PRINT=4;
    public static final int UNARY_MINUS=7;
    public static final int EOF=-1;
    public static final int PLUS=13;
    public static final int ML_COMMENT=19;

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
    // grammar/antlr_3/bc.g:30:1: program : ( input_item )+ Quit -> ^( PROGRAM ( input_item )+ ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token Quit2=null;
        input_item_return input_item1 = null;

        List list_input_item=new ArrayList();
        List list_Quit=new ArrayList();
        CommonTree Quit2_tree=null;

        try {
            // grammar/antlr_3/bc.g:31:5: ( ( input_item )+ Quit -> ^( PROGRAM ( input_item )+ ) )
            // grammar/antlr_3/bc.g:31:5: ( input_item )+ Quit
            {
            // grammar/antlr_3/bc.g:31:5: ( input_item )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( (LA1_0==Quit) ) {
                    int LA1_1 = input.LA(2);
                    if ( (LA1_1==Quit||(LA1_1>=STRING && LA1_1<=LETTER)||LA1_1==MINUS||LA1_1==NUMBER||(LA1_1>=22 && LA1_1<=23)) ) {
                        alt1=1;
                    }


                }
                else if ( ((LA1_0>=STRING && LA1_0<=LETTER)||LA1_0==MINUS||LA1_0==NUMBER||LA1_0==23) ) {
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


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 31:22: -> ^( PROGRAM ( input_item )+ )
            {
                // grammar/antlr_3/bc.g:31:25: ^( PROGRAM ( input_item )+ )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                // grammar/antlr_3/bc.g:31:36: ( input_item )+
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
    // grammar/antlr_3/bc.g:34:1: input_item : semicolon_list ;
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        semicolon_list_return semicolon_list3 = null;



        try {
            // grammar/antlr_3/bc.g:35:5: ( semicolon_list )
            // grammar/antlr_3/bc.g:35:5: semicolon_list
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_semicolon_list_in_input_item132);
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
    // grammar/antlr_3/bc.g:38:1: semicolon_list : statement ( ';'! statement )* ;
    public semicolon_list_return semicolon_list() throws RecognitionException {   
        semicolon_list_return retval = new semicolon_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token char_literal5=null;
        statement_return statement4 = null;

        statement_return statement6 = null;


        CommonTree char_literal5_tree=null;

        try {
            // grammar/antlr_3/bc.g:39:5: ( statement ( ';'! statement )* )
            // grammar/antlr_3/bc.g:39:5: statement ( ';'! statement )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_statement_in_semicolon_list146);
            statement4=statement();
            _fsp--;

            adaptor.addChild(root_0, statement4.tree);
            // grammar/antlr_3/bc.g:39:15: ( ';'! statement )*
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);
                if ( (LA2_0==22) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:39:17: ';'! statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal5=(Token)input.LT(1);
            	    match(input,22,FOLLOW_22_in_semicolon_list150); 
            	    pushFollow(FOLLOW_statement_in_semicolon_list153);
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
    // grammar/antlr_3/bc.g:43:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( SAY expression ) | STRING -> ^( PRINT STRING ) | Quit );
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token ASSIGN_OP8=null;
        Token STRING11=null;
        Token Quit12=null;
        named_expression_return named_expression7 = null;

        expression_return expression9 = null;

        expression_return expression10 = null;

        List list_expression=new ArrayList();
        List list_STRING=new ArrayList();
        CommonTree ASSIGN_OP8_tree=null;
        CommonTree STRING11_tree=null;
        CommonTree Quit12_tree=null;

        try {
            // grammar/antlr_3/bc.g:44:5: ( named_expression ASSIGN_OP^^ expression | expression -> ^( SAY expression ) | STRING -> ^( PRINT STRING ) | Quit )
            int alt3=4;
            switch ( input.LA(1) ) {
            case LETTER:
                int LA3_1 = input.LA(2);
                if ( (LA3_1==Quit||(LA3_1>=STRING && LA3_1<=NUMBER)||(LA3_1>=22 && LA3_1<=23)) ) {
                    alt3=2;
                }
                else if ( (LA3_1==ASSIGN_OP) ) {
                    alt3=1;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("43:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( SAY expression ) | STRING -> ^( PRINT STRING ) | Quit );", 3, 1, input);

                    throw nvae;
                }
                break;
            case MINUS:
            case NUMBER:
            case 23:
                alt3=2;
                break;
            case STRING:
                alt3=3;
                break;
            case Quit:
                alt3=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("43:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( SAY expression ) | STRING -> ^( PRINT STRING ) | Quit );", 3, 0, input);

                throw nvae;
            }

            switch (alt3) {
                case 1 :
                    // grammar/antlr_3/bc.g:44:5: named_expression ASSIGN_OP^^ expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_statement170);
                    named_expression7=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression7.tree);
                    ASSIGN_OP8=(Token)input.LT(1);
                    match(input,ASSIGN_OP,FOLLOW_ASSIGN_OP_in_statement172); 
                    ASSIGN_OP8_tree = (CommonTree)adaptor.create(ASSIGN_OP8);
                    root_0 = (CommonTree)adaptor.becomeRoot(ASSIGN_OP8_tree, root_0);

                    pushFollow(FOLLOW_expression_in_statement175);
                    expression9=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression9.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:46:5: expression
                    {
                    pushFollow(FOLLOW_expression_in_statement187);
                    expression10=expression();
                    _fsp--;

                    list_expression.add(expression10.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 46:16: -> ^( SAY expression )
                    {
                        // grammar/antlr_3/bc.g:46:19: ^( SAY expression )
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
                    // grammar/antlr_3/bc.g:48:5: STRING
                    {
                    STRING11=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_statement209); 
                    list_STRING.add(STRING11);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 48:12: -> ^( PRINT STRING )
                    {
                        // grammar/antlr_3/bc.g:48:15: ^( PRINT STRING )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PRINT, "PRINT"), root_1);

                        adaptor.addChild(root_1, (Token)list_STRING.get(i_0));

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 4 :
                    // grammar/antlr_3/bc.g:50:5: Quit
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    Quit12=(Token)input.LT(1);
                    match(input,Quit,FOLLOW_Quit_in_statement231); 
                    Quit12_tree = (CommonTree)adaptor.create(Quit12);
                    adaptor.addChild(root_0, Quit12_tree);


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
    // grammar/antlr_3/bc.g:53:1: expression : adding_expression ;
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        adding_expression_return adding_expression13 = null;



        try {
            // grammar/antlr_3/bc.g:54:5: ( adding_expression )
            // grammar/antlr_3/bc.g:54:5: adding_expression
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_adding_expression_in_expression244);
            adding_expression13=adding_expression();
            _fsp--;

            adaptor.addChild(root_0, adding_expression13.tree);

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
    // grammar/antlr_3/bc.g:57:1: named_expression : LETTER -> ^( VAR LETTER ) ;
    public named_expression_return named_expression() throws RecognitionException {   
        named_expression_return retval = new named_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER14=null;
        List list_LETTER=new ArrayList();
        CommonTree LETTER14_tree=null;

        try {
            // grammar/antlr_3/bc.g:58:5: ( LETTER -> ^( VAR LETTER ) )
            // grammar/antlr_3/bc.g:58:5: LETTER
            {
            LETTER14=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_named_expression257); 
            list_LETTER.add(LETTER14);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 58:12: -> ^( VAR LETTER )
            {
                // grammar/antlr_3/bc.g:58:15: ^( VAR LETTER )
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
    // grammar/antlr_3/bc.g:62:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS16=null;
        Token MINUS17=null;
        multiplying_expression_return multiplying_expression15 = null;

        multiplying_expression_return multiplying_expression18 = null;


        CommonTree PLUS16_tree=null;
        CommonTree MINUS17_tree=null;

        try {
            // grammar/antlr_3/bc.g:63:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // grammar/antlr_3/bc.g:63:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression282);
            multiplying_expression15=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression15.tree);
            // grammar/antlr_3/bc.g:63:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( (LA5_0==MINUS) ) {
                    switch ( input.LA(2) ) {
                    case NUMBER:
                        alt5=1;
                        break;
                    case LETTER:
                    case MINUS:
                        alt5=1;
                        break;
                    case 23:
                        alt5=1;
                        break;

                    }

                }
                else if ( (LA5_0==PLUS) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:63:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // grammar/antlr_3/bc.g:63:30: ( PLUS^^ | MINUS^^ )
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
            	            new NoViableAltException("63:30: ( PLUS^^ | MINUS^^ )", 4, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt4) {
            	        case 1 :
            	            // grammar/antlr_3/bc.g:63:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS16=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression288); 
            	            PLUS16_tree = (CommonTree)adaptor.create(PLUS16);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS16_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // grammar/antlr_3/bc.g:63:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS17=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression293); 
            	            MINUS17_tree = (CommonTree)adaptor.create(MINUS17);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS17_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression298);
            	    multiplying_expression18=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression18.tree);

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
    // grammar/antlr_3/bc.g:66:1: multiplying_expression : unary_expression ( MUL_OP^^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP20=null;
        unary_expression_return unary_expression19 = null;

        unary_expression_return unary_expression21 = null;


        CommonTree MUL_OP20_tree=null;

        try {
            // grammar/antlr_3/bc.g:67:5: ( unary_expression ( MUL_OP^^ unary_expression )* )
            // grammar/antlr_3/bc.g:67:5: unary_expression ( MUL_OP^^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression314);
            unary_expression19=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression19.tree);
            // grammar/antlr_3/bc.g:67:22: ( MUL_OP^^ unary_expression )*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);
                if ( (LA6_0==MUL_OP) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // grammar/antlr_3/bc.g:67:24: MUL_OP^^ unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    MUL_OP20=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression318); 
            	    MUL_OP20_tree = (CommonTree)adaptor.create(MUL_OP20);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP20_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression321);
            	    unary_expression21=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression21.tree);

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
    // grammar/antlr_3/bc.g:70:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( UNARY_MINUS postfix_expression ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS23=null;
        postfix_expression_return postfix_expression22 = null;

        postfix_expression_return postfix_expression24 = null;

        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        CommonTree MINUS23_tree=null;

        try {
            // grammar/antlr_3/bc.g:71:5: ( postfix_expression | MINUS postfix_expression -> ^( UNARY_MINUS postfix_expression ) )
            int alt7=2;
            int LA7_0 = input.LA(1);
            if ( (LA7_0==LETTER||LA7_0==NUMBER||LA7_0==23) ) {
                alt7=1;
            }
            else if ( (LA7_0==MINUS) ) {
                alt7=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("70:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( UNARY_MINUS postfix_expression ) );", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // grammar/antlr_3/bc.g:71:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression337);
                    postfix_expression22=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression22.tree);

                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:73:5: MINUS postfix_expression
                    {
                    MINUS23=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression349); 
                    list_MINUS.add(MINUS23);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression351);
                    postfix_expression24=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression24.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 73:30: -> ^( UNARY_MINUS postfix_expression )
                    {
                        // grammar/antlr_3/bc.g:73:33: ^( UNARY_MINUS postfix_expression )
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
    // grammar/antlr_3/bc.g:76:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER25=null;
        Token char_literal27=null;
        Token char_literal29=null;
        named_expression_return named_expression26 = null;

        expression_return expression28 = null;

        List list_expression=new ArrayList();
        List list_24=new ArrayList();
        List list_23=new ArrayList();
        CommonTree NUMBER25_tree=null;
        CommonTree char_literal27_tree=null;
        CommonTree char_literal29_tree=null;

        try {
            // grammar/antlr_3/bc.g:77:5: ( NUMBER | named_expression | '(' expression ')' -> expression )
            int alt8=3;
            switch ( input.LA(1) ) {
            case NUMBER:
                alt8=1;
                break;
            case LETTER:
                alt8=2;
                break;
            case 23:
                alt8=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("76:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );", 8, 0, input);

                throw nvae;
            }

            switch (alt8) {
                case 1 :
                    // grammar/antlr_3/bc.g:77:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER25=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression374); 
                    NUMBER25_tree = (CommonTree)adaptor.create(NUMBER25);
                    adaptor.addChild(root_0, NUMBER25_tree);


                    }
                    break;
                case 2 :
                    // grammar/antlr_3/bc.g:79:5: named_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_postfix_expression386);
                    named_expression26=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression26.tree);

                    }
                    break;
                case 3 :
                    // grammar/antlr_3/bc.g:81:5: '(' expression ')'
                    {
                    char_literal27=(Token)input.LT(1);
                    match(input,23,FOLLOW_23_in_postfix_expression403); 
                    list_23.add(char_literal27);

                    pushFollow(FOLLOW_expression_in_postfix_expression405);
                    expression28=expression();
                    _fsp--;

                    list_expression.add(expression28.tree);
                    char_literal29=(Token)input.LT(1);
                    match(input,24,FOLLOW_24_in_postfix_expression407); 
                    list_24.add(char_literal29);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 81:24: -> expression
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


 

    public static final BitSet FOLLOW_input_item_in_program105 = new BitSet(new long[]{0x0000000000815A00L});
    public static final BitSet FOLLOW_Quit_in_program108 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_semicolon_list_in_input_item132 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list146 = new BitSet(new long[]{0x0000000000400002L});
    public static final BitSet FOLLOW_22_in_semicolon_list150 = new BitSet(new long[]{0x0000000000815A00L});
    public static final BitSet FOLLOW_statement_in_semicolon_list153 = new BitSet(new long[]{0x0000000000400002L});
    public static final BitSet FOLLOW_named_expression_in_statement170 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_ASSIGN_OP_in_statement172 = new BitSet(new long[]{0x0000000000815000L});
    public static final BitSet FOLLOW_expression_in_statement175 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_statement187 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_statement209 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_Quit_in_statement231 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression244 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_named_expression257 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression282 = new BitSet(new long[]{0x0000000000006002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression288 = new BitSet(new long[]{0x0000000000815000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression293 = new BitSet(new long[]{0x0000000000815000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression298 = new BitSet(new long[]{0x0000000000006002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression314 = new BitSet(new long[]{0x0000000000008002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression318 = new BitSet(new long[]{0x0000000000815000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression321 = new BitSet(new long[]{0x0000000000008002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression337 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression349 = new BitSet(new long[]{0x0000000000811000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression351 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression374 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_named_expression_in_postfix_expression386 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_23_in_postfix_expression403 = new BitSet(new long[]{0x0000000000815000L});
    public static final BitSet FOLLOW_expression_in_postfix_expression405 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_24_in_postfix_expression407 = new BitSet(new long[]{0x0000000000000002L});

}