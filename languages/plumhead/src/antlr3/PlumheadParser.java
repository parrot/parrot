// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2006-12-30 20:12:34

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "START_PHP", "END_PHP", "ARRAY", "FUNCTION", "PRINT", "PROGRAM", "STMTS", "VAR", "NEWLINE", "STRING", "LETTER", "INTEGER", "NUMBER", "MINUS", "PLUS", "MUL_OP", "ASSIGN_OP", "REL_OP", "INCR", "DECR", "Define", "Break", "Quit", "Length", "Return", "For", "If", "While", "Sqrt", "Scale", "Ibase", "Obase", "Auto", "ML_COMMENT", "WS", "';'", "'('", "')'", "'{'", "'}'", "'['", "']'", "','"
    };
    public static final int LETTER=14;
    public static final int MINUS=17;
    public static final int INCR=22;
    public static final int ARRAY=6;
    public static final int If=30;
    public static final int WS=38;
    public static final int DECR=23;
    public static final int NUMBER=16;
    public static final int Break=25;
    public static final int Sqrt=32;
    public static final int STRING=13;
    public static final int Ibase=34;
    public static final int START_PHP=4;
    public static final int Scale=33;
    public static final int MUL_OP=19;
    public static final int Auto=36;
    public static final int Define=24;
    public static final int Quit=26;
    public static final int PROGRAM=9;
    public static final int STMTS=10;
    public static final int NEWLINE=12;
    public static final int VAR=11;
    public static final int ASSIGN_OP=20;
    public static final int INTEGER=15;
    public static final int PRINT=8;
    public static final int Obase=35;
    public static final int FUNCTION=7;
    public static final int END_PHP=5;
    public static final int While=31;
    public static final int EOF=-1;
    public static final int REL_OP=21;
    public static final int ML_COMMENT=37;
    public static final int PLUS=18;
    public static final int Length=27;
    public static final int For=29;
    public static final int Return=28;

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
    // src/antlr3/Plumhead.g:91:1: program : START_PHP ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token START_PHP1=null;

        CommonTree START_PHP1_tree=null;

        try {
            // src/antlr3/Plumhead.g:92:5: ( START_PHP )
            // src/antlr3/Plumhead.g:92:5: START_PHP
            {
            root_0 = (CommonTree)adaptor.nil();

            START_PHP1=(Token)input.LT(1);
            match(input,START_PHP,FOLLOW_START_PHP_in_program631); 
            START_PHP1_tree = (CommonTree)adaptor.create(START_PHP1);
            adaptor.addChild(root_0, START_PHP1_tree);


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
    // src/antlr3/Plumhead.g:95:1: input_item : ( semicolon_list NEWLINE! | function );
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NEWLINE3=null;
        semicolon_list_return semicolon_list2 = null;

        function_return function4 = null;


        CommonTree NEWLINE3_tree=null;

        try {
            // src/antlr3/Plumhead.g:96:5: ( semicolon_list NEWLINE! | function )
            int alt1=2;
            int LA1_0 = input.LA(1);
            if ( ((LA1_0>=NEWLINE && LA1_0<=LETTER)||(LA1_0>=NUMBER && LA1_0<=MINUS)||(LA1_0>=INCR && LA1_0<=DECR)||LA1_0==If||(LA1_0>=39 && LA1_0<=40)||LA1_0==42) ) {
                alt1=1;
            }
            else if ( (LA1_0==Define) ) {
                alt1=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("95:1: input_item : ( semicolon_list NEWLINE! | function );", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // src/antlr3/Plumhead.g:96:5: semicolon_list NEWLINE!
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_semicolon_list_in_input_item645);
                    semicolon_list2=semicolon_list();
                    _fsp--;

                    adaptor.addChild(root_0, semicolon_list2.tree);
                    NEWLINE3=(Token)input.LT(1);
                    match(input,NEWLINE,FOLLOW_NEWLINE_in_input_item647); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:97:5: function
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_function_in_input_item654);
                    function4=function();
                    _fsp--;

                    adaptor.addChild(root_0, function4.tree);

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
    // $ANTLR end input_item

    public static class semicolon_list_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start semicolon_list
    // src/antlr3/Plumhead.g:100:1: semicolon_list : ( statement )? ( ';'! ( statement )? )* ;
    public semicolon_list_return semicolon_list() throws RecognitionException {   
        semicolon_list_return retval = new semicolon_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token char_literal6=null;
        statement_return statement5 = null;

        statement_return statement7 = null;


        CommonTree char_literal6_tree=null;

        try {
            // src/antlr3/Plumhead.g:101:5: ( ( statement )? ( ';'! ( statement )? )* )
            // src/antlr3/Plumhead.g:101:5: ( statement )? ( ';'! ( statement )? )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:101:5: ( statement )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( ((LA2_0>=STRING && LA2_0<=LETTER)||(LA2_0>=NUMBER && LA2_0<=MINUS)||(LA2_0>=INCR && LA2_0<=DECR)||LA2_0==If||LA2_0==40||LA2_0==42) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:101:5: statement
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_statement_in_semicolon_list668);
                    statement5=statement();
                    _fsp--;

                    adaptor.addChild(root_1, statement5.tree);

                    adaptor.addChild(root_0, root_1);

                    }
                    break;

            }

            // src/antlr3/Plumhead.g:101:16: ( ';'! ( statement )? )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( (LA4_0==39) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:101:18: ';'! ( statement )?
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal6=(Token)input.LT(1);
            	    match(input,39,FOLLOW_39_in_semicolon_list673); 
            	    // src/antlr3/Plumhead.g:101:23: ( statement )?
            	    int alt3=2;
            	    int LA3_0 = input.LA(1);
            	    if ( ((LA3_0>=STRING && LA3_0<=LETTER)||(LA3_0>=NUMBER && LA3_0<=MINUS)||(LA3_0>=INCR && LA3_0<=DECR)||LA3_0==If||LA3_0==40||LA3_0==42) ) {
            	        alt3=1;
            	    }
            	    switch (alt3) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:101:23: statement
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            pushFollow(FOLLOW_statement_in_semicolon_list676);
            	            statement7=statement();
            	            _fsp--;

            	            adaptor.addChild(root_2, statement7.tree);

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

    public static class statement_list_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement_list
    // src/antlr3/Plumhead.g:104:1: statement_list : ( statement | NEWLINE! | ';'! )* ;
    public statement_list_return statement_list() throws RecognitionException {   
        statement_list_return retval = new statement_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NEWLINE9=null;
        Token char_literal10=null;
        statement_return statement8 = null;


        CommonTree NEWLINE9_tree=null;
        CommonTree char_literal10_tree=null;

        try {
            // src/antlr3/Plumhead.g:105:5: ( ( statement | NEWLINE! | ';'! )* )
            // src/antlr3/Plumhead.g:105:5: ( statement | NEWLINE! | ';'! )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:105:5: ( statement | NEWLINE! | ';'! )*
            loop5:
            do {
                int alt5=4;
                switch ( input.LA(1) ) {
                case STRING:
                case LETTER:
                case NUMBER:
                case MINUS:
                case INCR:
                case DECR:
                case If:
                case 40:
                case 42:
                    alt5=1;
                    break;
                case NEWLINE:
                    alt5=2;
                    break;
                case 39:
                    alt5=3;
                    break;

                }

                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:105:7: statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_statement_in_statement_list700);
            	    statement8=statement();
            	    _fsp--;

            	    adaptor.addChild(root_1, statement8.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;
            	case 2 :
            	    // src/antlr3/Plumhead.g:105:19: NEWLINE!
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    NEWLINE9=(Token)input.LT(1);
            	    match(input,NEWLINE,FOLLOW_NEWLINE_in_statement_list704); 

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;
            	case 3 :
            	    // src/antlr3/Plumhead.g:105:30: ';'!
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal10=(Token)input.LT(1);
            	    match(input,39,FOLLOW_39_in_statement_list709); 

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
    // $ANTLR end statement_list

    public static class statement_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement
    // src/antlr3/Plumhead.g:109:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) ) | '{'! statement_list '}'! );
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token ASSIGN_OP12=null;
        Token STRING15=null;
        Token If16=null;
        Token char_literal17=null;
        Token char_literal19=null;
        Token char_literal21=null;
        Token char_literal23=null;
        named_expression_return named_expression11 = null;

        expression_return expression13 = null;

        expression_return expression14 = null;

        relational_expression_return relational_expression18 = null;

        statement_return statement20 = null;

        statement_list_return statement_list22 = null;

        List list_statement=new ArrayList();
        List list_relational_expression=new ArrayList();
        List list_expression=new ArrayList();
        List list_41=new ArrayList();
        List list_If=new ArrayList();
        List list_40=new ArrayList();
        List list_STRING=new ArrayList();
        CommonTree ASSIGN_OP12_tree=null;
        CommonTree STRING15_tree=null;
        CommonTree If16_tree=null;
        CommonTree char_literal17_tree=null;
        CommonTree char_literal19_tree=null;
        CommonTree char_literal21_tree=null;
        CommonTree char_literal23_tree=null;

        try {
            // src/antlr3/Plumhead.g:110:5: ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) ) | '{'! statement_list '}'! )
            int alt6=5;
            switch ( input.LA(1) ) {
            case LETTER:
                int LA6_1 = input.LA(2);
                if ( ((LA6_1>=NEWLINE && LA6_1<=LETTER)||(LA6_1>=NUMBER && LA6_1<=MUL_OP)||(LA6_1>=INCR && LA6_1<=DECR)||LA6_1==If||(LA6_1>=39 && LA6_1<=40)||(LA6_1>=42 && LA6_1<=43)) ) {
                    alt6=2;
                }
                else if ( (LA6_1==ASSIGN_OP) ) {
                    alt6=1;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("109:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) ) | '{'! statement_list '}'! );", 6, 1, input);

                    throw nvae;
                }
                break;
            case NUMBER:
            case MINUS:
            case INCR:
            case DECR:
            case 40:
                alt6=2;
                break;
            case STRING:
                alt6=3;
                break;
            case If:
                alt6=4;
                break;
            case 42:
                alt6=5;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("109:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) ) | '{'! statement_list '}'! );", 6, 0, input);

                throw nvae;
            }

            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:110:5: named_expression ASSIGN_OP^^ expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_statement727);
                    named_expression11=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression11.tree);
                    ASSIGN_OP12=(Token)input.LT(1);
                    match(input,ASSIGN_OP,FOLLOW_ASSIGN_OP_in_statement729); 
                    ASSIGN_OP12_tree = (CommonTree)adaptor.create(ASSIGN_OP12);
                    root_0 = (CommonTree)adaptor.becomeRoot(ASSIGN_OP12_tree, root_0);

                    pushFollow(FOLLOW_expression_in_statement732);
                    expression13=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression13.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:111:5: expression
                    {
                    pushFollow(FOLLOW_expression_in_statement738);
                    expression14=expression();
                    _fsp--;

                    list_expression.add(expression14.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 111:16: -> ^( PRINT expression ) ^( PRINT NEWLINE )
                    {
                        // src/antlr3/Plumhead.g:111:19: ^( PRINT expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PRINT, "PRINT"), root_1);

                        adaptor.addChild(root_1, list_expression.get(i_0));

                        adaptor.addChild(root_0, root_1);
                        }
                        // src/antlr3/Plumhead.g:111:41: ^( PRINT NEWLINE )
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
                    // src/antlr3/Plumhead.g:112:5: STRING
                    {
                    STRING15=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_statement762); 
                    list_STRING.add(STRING15);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 112:12: -> ^( PRINT STRING )
                    {
                        // src/antlr3/Plumhead.g:112:15: ^( PRINT STRING )
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
                    // src/antlr3/Plumhead.g:113:5: If '(' relational_expression ')' statement
                    {
                    If16=(Token)input.LT(1);
                    match(input,If,FOLLOW_If_in_statement778); 
                    list_If.add(If16);

                    char_literal17=(Token)input.LT(1);
                    match(input,40,FOLLOW_40_in_statement780); 
                    list_40.add(char_literal17);

                    pushFollow(FOLLOW_relational_expression_in_statement782);
                    relational_expression18=relational_expression();
                    _fsp--;

                    list_relational_expression.add(relational_expression18.tree);
                    char_literal19=(Token)input.LT(1);
                    match(input,41,FOLLOW_41_in_statement784); 
                    list_41.add(char_literal19);

                    pushFollow(FOLLOW_statement_in_statement786);
                    statement20=statement();
                    _fsp--;

                    list_statement.add(statement20.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 113:48: -> ^( If relational_expression ^( STMTS statement ) )
                    {
                        // src/antlr3/Plumhead.g:113:51: ^( If relational_expression ^( STMTS statement ) )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot((Token)list_If.get(i_0), root_1);

                        adaptor.addChild(root_1, list_relational_expression.get(i_0));
                        // src/antlr3/Plumhead.g:113:79: ^( STMTS statement )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(STMTS, "STMTS"), root_2);

                        adaptor.addChild(root_2, list_statement.get(i_0));

                        adaptor.addChild(root_1, root_2);
                        }

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:114:5: '{'! statement_list '}'!
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    char_literal21=(Token)input.LT(1);
                    match(input,42,FOLLOW_42_in_statement810); 
                    pushFollow(FOLLOW_statement_list_in_statement813);
                    statement_list22=statement_list();
                    _fsp--;

                    adaptor.addChild(root_0, statement_list22.tree);
                    char_literal23=(Token)input.LT(1);
                    match(input,43,FOLLOW_43_in_statement815); 

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

    public static class function_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start function
    // src/antlr3/Plumhead.g:118:1: function : Define LETTER '(' ( parameter_list )? ')' '{' NEWLINE ( auto_define_list )? statement_list '}' -> ^( FUNCTION LETTER ) ;
    public function_return function() throws RecognitionException {   
        function_return retval = new function_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token Define24=null;
        Token LETTER25=null;
        Token char_literal26=null;
        Token char_literal28=null;
        Token char_literal29=null;
        Token NEWLINE30=null;
        Token char_literal33=null;
        parameter_list_return parameter_list27 = null;

        auto_define_list_return auto_define_list31 = null;

        statement_list_return statement_list32 = null;

        List list_statement_list=new ArrayList();
        List list_parameter_list=new ArrayList();
        List list_auto_define_list=new ArrayList();
        List list_43=new ArrayList();
        List list_LETTER=new ArrayList();
        List list_41=new ArrayList();
        List list_Define=new ArrayList();
        List list_42=new ArrayList();
        List list_40=new ArrayList();
        List list_NEWLINE=new ArrayList();
        CommonTree Define24_tree=null;
        CommonTree LETTER25_tree=null;
        CommonTree char_literal26_tree=null;
        CommonTree char_literal28_tree=null;
        CommonTree char_literal29_tree=null;
        CommonTree NEWLINE30_tree=null;
        CommonTree char_literal33_tree=null;

        try {
            // src/antlr3/Plumhead.g:119:5: ( Define LETTER '(' ( parameter_list )? ')' '{' NEWLINE ( auto_define_list )? statement_list '}' -> ^( FUNCTION LETTER ) )
            // src/antlr3/Plumhead.g:119:5: Define LETTER '(' ( parameter_list )? ')' '{' NEWLINE ( auto_define_list )? statement_list '}'
            {
            Define24=(Token)input.LT(1);
            match(input,Define,FOLLOW_Define_in_function830); 
            list_Define.add(Define24);

            LETTER25=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_function832); 
            list_LETTER.add(LETTER25);

            char_literal26=(Token)input.LT(1);
            match(input,40,FOLLOW_40_in_function834); 
            list_40.add(char_literal26);

            // src/antlr3/Plumhead.g:119:23: ( parameter_list )?
            int alt7=2;
            int LA7_0 = input.LA(1);
            if ( (LA7_0==LETTER) ) {
                alt7=1;
            }
            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:119:23: parameter_list
                    {
                    pushFollow(FOLLOW_parameter_list_in_function836);
                    parameter_list27=parameter_list();
                    _fsp--;

                    list_parameter_list.add(parameter_list27.tree);

                    }
                    break;

            }

            char_literal28=(Token)input.LT(1);
            match(input,41,FOLLOW_41_in_function839); 
            list_41.add(char_literal28);

            char_literal29=(Token)input.LT(1);
            match(input,42,FOLLOW_42_in_function841); 
            list_42.add(char_literal29);

            NEWLINE30=(Token)input.LT(1);
            match(input,NEWLINE,FOLLOW_NEWLINE_in_function843); 
            list_NEWLINE.add(NEWLINE30);

            // src/antlr3/Plumhead.g:119:55: ( auto_define_list )?
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( (LA8_0==Auto) ) {
                alt8=1;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:119:55: auto_define_list
                    {
                    pushFollow(FOLLOW_auto_define_list_in_function845);
                    auto_define_list31=auto_define_list();
                    _fsp--;

                    list_auto_define_list.add(auto_define_list31.tree);

                    }
                    break;

            }

            pushFollow(FOLLOW_statement_list_in_function848);
            statement_list32=statement_list();
            _fsp--;

            list_statement_list.add(statement_list32.tree);
            char_literal33=(Token)input.LT(1);
            match(input,43,FOLLOW_43_in_function850); 
            list_43.add(char_literal33);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 119:92: -> ^( FUNCTION LETTER )
            {
                // src/antlr3/Plumhead.g:119:95: ^( FUNCTION LETTER )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(FUNCTION, "FUNCTION"), root_1);

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
    // $ANTLR end function

    public static class parameter_list_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start parameter_list
    // src/antlr3/Plumhead.g:123:1: parameter_list : define_list ;
    public parameter_list_return parameter_list() throws RecognitionException {   
        parameter_list_return retval = new parameter_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        define_list_return define_list34 = null;



        try {
            // src/antlr3/Plumhead.g:124:5: ( define_list )
            // src/antlr3/Plumhead.g:124:5: define_list
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_define_list_in_parameter_list881);
            define_list34=define_list();
            _fsp--;

            adaptor.addChild(root_0, define_list34.tree);

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
    // $ANTLR end parameter_list

    public static class auto_define_list_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start auto_define_list
    // src/antlr3/Plumhead.g:127:1: auto_define_list : Auto define_list (NEWLINE|';');
    public auto_define_list_return auto_define_list() throws RecognitionException {   
        auto_define_list_return retval = new auto_define_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token Auto35=null;
        Token set37=null;
        define_list_return define_list36 = null;


        CommonTree Auto35_tree=null;
        CommonTree set37_tree=null;

        try {
            // src/antlr3/Plumhead.g:128:5: ( Auto define_list (NEWLINE|';'))
            // src/antlr3/Plumhead.g:128:5: Auto define_list (NEWLINE|';')
            {
            root_0 = (CommonTree)adaptor.nil();

            Auto35=(Token)input.LT(1);
            match(input,Auto,FOLLOW_Auto_in_auto_define_list894); 
            Auto35_tree = (CommonTree)adaptor.create(Auto35);
            adaptor.addChild(root_0, Auto35_tree);

            pushFollow(FOLLOW_define_list_in_auto_define_list896);
            define_list36=define_list();
            _fsp--;

            adaptor.addChild(root_0, define_list36.tree);
            set37=(Token)input.LT(1);
            if ( input.LA(1)==NEWLINE||input.LA(1)==39 ) {
                adaptor.addChild(root_0, adaptor.create(set37));
                input.consume();
                errorRecovery=false;
            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recoverFromMismatchedSet(input,mse,FOLLOW_set_in_auto_define_list900);    throw mse;
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
    // $ANTLR end auto_define_list

    public static class define_list_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start define_list
    // src/antlr3/Plumhead.g:131:1: define_list : LETTER ( '[' ']' )? ( ',' LETTER ( '[' ']' )? )* ;
    public define_list_return define_list() throws RecognitionException {   
        define_list_return retval = new define_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER38=null;
        Token char_literal39=null;
        Token char_literal40=null;
        Token char_literal41=null;
        Token LETTER42=null;
        Token char_literal43=null;
        Token char_literal44=null;

        CommonTree LETTER38_tree=null;
        CommonTree char_literal39_tree=null;
        CommonTree char_literal40_tree=null;
        CommonTree char_literal41_tree=null;
        CommonTree LETTER42_tree=null;
        CommonTree char_literal43_tree=null;
        CommonTree char_literal44_tree=null;

        try {
            // src/antlr3/Plumhead.g:132:5: ( LETTER ( '[' ']' )? ( ',' LETTER ( '[' ']' )? )* )
            // src/antlr3/Plumhead.g:132:5: LETTER ( '[' ']' )? ( ',' LETTER ( '[' ']' )? )*
            {
            root_0 = (CommonTree)adaptor.nil();

            LETTER38=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_define_list919); 
            LETTER38_tree = (CommonTree)adaptor.create(LETTER38);
            adaptor.addChild(root_0, LETTER38_tree);

            // src/antlr3/Plumhead.g:132:12: ( '[' ']' )?
            int alt9=2;
            int LA9_0 = input.LA(1);
            if ( (LA9_0==44) ) {
                alt9=1;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:132:14: '[' ']'
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    char_literal39=(Token)input.LT(1);
                    match(input,44,FOLLOW_44_in_define_list923); 
                    char_literal39_tree = (CommonTree)adaptor.create(char_literal39);
                    adaptor.addChild(root_1, char_literal39_tree);

                    char_literal40=(Token)input.LT(1);
                    match(input,45,FOLLOW_45_in_define_list925); 
                    char_literal40_tree = (CommonTree)adaptor.create(char_literal40);
                    adaptor.addChild(root_1, char_literal40_tree);


                    adaptor.addChild(root_0, root_1);

                    }
                    break;

            }

            // src/antlr3/Plumhead.g:132:25: ( ',' LETTER ( '[' ']' )? )*
            loop11:
            do {
                int alt11=2;
                int LA11_0 = input.LA(1);
                if ( (LA11_0==46) ) {
                    alt11=1;
                }


                switch (alt11) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:132:27: ',' LETTER ( '[' ']' )?
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal41=(Token)input.LT(1);
            	    match(input,46,FOLLOW_46_in_define_list932); 
            	    char_literal41_tree = (CommonTree)adaptor.create(char_literal41);
            	    adaptor.addChild(root_1, char_literal41_tree);

            	    LETTER42=(Token)input.LT(1);
            	    match(input,LETTER,FOLLOW_LETTER_in_define_list934); 
            	    LETTER42_tree = (CommonTree)adaptor.create(LETTER42);
            	    adaptor.addChild(root_1, LETTER42_tree);

            	    // src/antlr3/Plumhead.g:132:38: ( '[' ']' )?
            	    int alt10=2;
            	    int LA10_0 = input.LA(1);
            	    if ( (LA10_0==44) ) {
            	        alt10=1;
            	    }
            	    switch (alt10) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:132:40: '[' ']'
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            char_literal43=(Token)input.LT(1);
            	            match(input,44,FOLLOW_44_in_define_list938); 
            	            char_literal43_tree = (CommonTree)adaptor.create(char_literal43);
            	            adaptor.addChild(root_2, char_literal43_tree);

            	            char_literal44=(Token)input.LT(1);
            	            match(input,45,FOLLOW_45_in_define_list940); 
            	            char_literal44_tree = (CommonTree)adaptor.create(char_literal44);
            	            adaptor.addChild(root_2, char_literal44_tree);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }


            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop11;
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
    // $ANTLR end define_list

    public static class argument_list_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start argument_list
    // src/antlr3/Plumhead.g:135:1: argument_list : ( expression | LETTER '[' ']' ',' argument_list );
    public argument_list_return argument_list() throws RecognitionException {   
        argument_list_return retval = new argument_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER46=null;
        Token char_literal47=null;
        Token char_literal48=null;
        Token char_literal49=null;
        expression_return expression45 = null;

        argument_list_return argument_list50 = null;


        CommonTree LETTER46_tree=null;
        CommonTree char_literal47_tree=null;
        CommonTree char_literal48_tree=null;
        CommonTree char_literal49_tree=null;

        try {
            // src/antlr3/Plumhead.g:136:5: ( expression | LETTER '[' ']' ',' argument_list )
            int alt12=2;
            int LA12_0 = input.LA(1);
            if ( ((LA12_0>=NUMBER && LA12_0<=MINUS)||(LA12_0>=INCR && LA12_0<=DECR)||LA12_0==40) ) {
                alt12=1;
            }
            else if ( (LA12_0==LETTER) ) {
                int LA12_2 = input.LA(2);
                if ( (LA12_2==44) ) {
                    alt12=2;
                }
                else if ( ((LA12_2>=MINUS && LA12_2<=MUL_OP)) ) {
                    alt12=1;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("135:1: argument_list : ( expression | LETTER '[' ']' ',' argument_list );", 12, 2, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("135:1: argument_list : ( expression | LETTER '[' ']' ',' argument_list );", 12, 0, input);

                throw nvae;
            }
            switch (alt12) {
                case 1 :
                    // src/antlr3/Plumhead.g:136:5: expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_expression_in_argument_list959);
                    expression45=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression45.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:137:5: LETTER '[' ']' ',' argument_list
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    LETTER46=(Token)input.LT(1);
                    match(input,LETTER,FOLLOW_LETTER_in_argument_list965); 
                    LETTER46_tree = (CommonTree)adaptor.create(LETTER46);
                    adaptor.addChild(root_0, LETTER46_tree);

                    char_literal47=(Token)input.LT(1);
                    match(input,44,FOLLOW_44_in_argument_list967); 
                    char_literal47_tree = (CommonTree)adaptor.create(char_literal47);
                    adaptor.addChild(root_0, char_literal47_tree);

                    char_literal48=(Token)input.LT(1);
                    match(input,45,FOLLOW_45_in_argument_list969); 
                    char_literal48_tree = (CommonTree)adaptor.create(char_literal48);
                    adaptor.addChild(root_0, char_literal48_tree);

                    char_literal49=(Token)input.LT(1);
                    match(input,46,FOLLOW_46_in_argument_list971); 
                    char_literal49_tree = (CommonTree)adaptor.create(char_literal49);
                    adaptor.addChild(root_0, char_literal49_tree);

                    pushFollow(FOLLOW_argument_list_in_argument_list973);
                    argument_list50=argument_list();
                    _fsp--;

                    adaptor.addChild(root_0, argument_list50.tree);

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
    // $ANTLR end argument_list

    public static class relational_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start relational_expression
    // src/antlr3/Plumhead.g:140:1: relational_expression : expression ( REL_OP^^ expression )? ;
    public relational_expression_return relational_expression() throws RecognitionException {   
        relational_expression_return retval = new relational_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token REL_OP52=null;
        expression_return expression51 = null;

        expression_return expression53 = null;


        CommonTree REL_OP52_tree=null;

        try {
            // src/antlr3/Plumhead.g:141:5: ( expression ( REL_OP^^ expression )? )
            // src/antlr3/Plumhead.g:141:5: expression ( REL_OP^^ expression )?
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_expression_in_relational_expression987);
            expression51=expression();
            _fsp--;

            adaptor.addChild(root_0, expression51.tree);
            // src/antlr3/Plumhead.g:141:16: ( REL_OP^^ expression )?
            int alt13=2;
            int LA13_0 = input.LA(1);
            if ( (LA13_0==REL_OP) ) {
                alt13=1;
            }
            switch (alt13) {
                case 1 :
                    // src/antlr3/Plumhead.g:141:18: REL_OP^^ expression
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    REL_OP52=(Token)input.LT(1);
                    match(input,REL_OP,FOLLOW_REL_OP_in_relational_expression991); 
                    REL_OP52_tree = (CommonTree)adaptor.create(REL_OP52);
                    root_0 = (CommonTree)adaptor.becomeRoot(REL_OP52_tree, root_0);

                    pushFollow(FOLLOW_expression_in_relational_expression994);
                    expression53=expression();
                    _fsp--;

                    adaptor.addChild(root_1, expression53.tree);

                    adaptor.addChild(root_0, root_1);

                    }
                    break;

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
    // $ANTLR end relational_expression

    public static class return_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start return_expression
    // src/antlr3/Plumhead.g:144:1: return_expression : ( expression )? ;
    public return_expression_return return_expression() throws RecognitionException {   
        return_expression_return retval = new return_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        expression_return expression54 = null;



        try {
            // src/antlr3/Plumhead.g:145:5: ( ( expression )? )
            // src/antlr3/Plumhead.g:145:5: ( expression )?
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:145:5: ( expression )?
            int alt14=2;
            int LA14_0 = input.LA(1);
            if ( (LA14_0==LETTER||(LA14_0>=NUMBER && LA14_0<=MINUS)||(LA14_0>=INCR && LA14_0<=DECR)||LA14_0==40) ) {
                alt14=1;
            }
            switch (alt14) {
                case 1 :
                    // src/antlr3/Plumhead.g:145:5: expression
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_expression_in_return_expression1010);
                    expression54=expression();
                    _fsp--;

                    adaptor.addChild(root_1, expression54.tree);

                    adaptor.addChild(root_0, root_1);

                    }
                    break;

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
    // $ANTLR end return_expression

    public static class expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start expression
    // src/antlr3/Plumhead.g:148:1: expression : adding_expression ;
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        adding_expression_return adding_expression55 = null;



        try {
            // src/antlr3/Plumhead.g:149:5: ( adding_expression )
            // src/antlr3/Plumhead.g:149:5: adding_expression
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_adding_expression_in_expression1024);
            adding_expression55=adding_expression();
            _fsp--;

            adaptor.addChild(root_0, adding_expression55.tree);

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
    // src/antlr3/Plumhead.g:152:1: named_expression : LETTER -> ^( VAR LETTER ) ;
    public named_expression_return named_expression() throws RecognitionException {   
        named_expression_return retval = new named_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER56=null;
        List list_LETTER=new ArrayList();
        CommonTree LETTER56_tree=null;

        try {
            // src/antlr3/Plumhead.g:153:5: ( LETTER -> ^( VAR LETTER ) )
            // src/antlr3/Plumhead.g:153:5: LETTER
            {
            LETTER56=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_named_expression1037); 
            list_LETTER.add(LETTER56);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 153:12: -> ^( VAR LETTER )
            {
                // src/antlr3/Plumhead.g:153:15: ^( VAR LETTER )
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
    // src/antlr3/Plumhead.g:158:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS58=null;
        Token MINUS59=null;
        multiplying_expression_return multiplying_expression57 = null;

        multiplying_expression_return multiplying_expression60 = null;


        CommonTree PLUS58_tree=null;
        CommonTree MINUS59_tree=null;

        try {
            // src/antlr3/Plumhead.g:159:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // src/antlr3/Plumhead.g:159:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression1063);
            multiplying_expression57=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression57.tree);
            // src/antlr3/Plumhead.g:159:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop16:
            do {
                int alt16=2;
                int LA16_0 = input.LA(1);
                if ( (LA16_0==MINUS) ) {
                    switch ( input.LA(2) ) {
                    case NUMBER:
                        alt16=1;
                        break;
                    case LETTER:
                    case MINUS:
                    case INCR:
                    case DECR:
                        alt16=1;
                        break;
                    case 40:
                        alt16=1;
                        break;

                    }

                }
                else if ( (LA16_0==PLUS) ) {
                    alt16=1;
                }


                switch (alt16) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:159:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // src/antlr3/Plumhead.g:159:30: ( PLUS^^ | MINUS^^ )
            	    int alt15=2;
            	    int LA15_0 = input.LA(1);
            	    if ( (LA15_0==PLUS) ) {
            	        alt15=1;
            	    }
            	    else if ( (LA15_0==MINUS) ) {
            	        alt15=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("159:30: ( PLUS^^ | MINUS^^ )", 15, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt15) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:159:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS58=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression1069); 
            	            PLUS58_tree = (CommonTree)adaptor.create(PLUS58);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS58_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // src/antlr3/Plumhead.g:159:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS59=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression1074); 
            	            MINUS59_tree = (CommonTree)adaptor.create(MINUS59);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS59_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression1079);
            	    multiplying_expression60=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression60.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop16;
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
    // src/antlr3/Plumhead.g:162:1: multiplying_expression : unary_expression ( MUL_OP^^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP62=null;
        unary_expression_return unary_expression61 = null;

        unary_expression_return unary_expression63 = null;


        CommonTree MUL_OP62_tree=null;

        try {
            // src/antlr3/Plumhead.g:163:5: ( unary_expression ( MUL_OP^^ unary_expression )* )
            // src/antlr3/Plumhead.g:163:5: unary_expression ( MUL_OP^^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression1096);
            unary_expression61=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression61.tree);
            // src/antlr3/Plumhead.g:163:22: ( MUL_OP^^ unary_expression )*
            loop17:
            do {
                int alt17=2;
                int LA17_0 = input.LA(1);
                if ( (LA17_0==MUL_OP) ) {
                    alt17=1;
                }


                switch (alt17) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:163:24: MUL_OP^^ unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    MUL_OP62=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression1100); 
            	    MUL_OP62_tree = (CommonTree)adaptor.create(MUL_OP62);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP62_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression1103);
            	    unary_expression63=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression63.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop17;
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
    // src/antlr3/Plumhead.g:166:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP["*"] NUMBER["-1"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER["a"] ) ^( PLUS["+"] ^( VAR LETTER["a"] ) NUMBER["1"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER["a"] ) ^( MINUS["-"] ^( VAR LETTER["a"] ) NUMBER["1"] ) ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS65=null;
        Token INCR67=null;
        Token DECR69=null;
        postfix_expression_return postfix_expression64 = null;

        postfix_expression_return postfix_expression66 = null;

        named_expression_return named_expression68 = null;

        named_expression_return named_expression70 = null;

        List list_named_expression=new ArrayList();
        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        List list_INCR=new ArrayList();
        List list_DECR=new ArrayList();
        CommonTree MINUS65_tree=null;
        CommonTree INCR67_tree=null;
        CommonTree DECR69_tree=null;

        try {
            // src/antlr3/Plumhead.g:167:5: ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) )
            int alt18=4;
            switch ( input.LA(1) ) {
            case LETTER:
            case NUMBER:
            case 40:
                alt18=1;
                break;
            case MINUS:
                alt18=2;
                break;
            case INCR:
                alt18=3;
                break;
            case DECR:
                alt18=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("166:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) );", 18, 0, input);

                throw nvae;
            }

            switch (alt18) {
                case 1 :
                    // src/antlr3/Plumhead.g:167:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1119);
                    postfix_expression64=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression64.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:168:5: MINUS postfix_expression
                    {
                    MINUS65=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression1125); 
                    list_MINUS.add(MINUS65);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1127);
                    postfix_expression66=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression66.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 168:30: -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression )
                    {
                        // src/antlr3/Plumhead.g:168:33: ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression )
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
                    // src/antlr3/Plumhead.g:169:5: INCR named_expression
                    {
                    INCR67=(Token)input.LT(1);
                    match(input,INCR,FOLLOW_INCR_in_unary_expression1147); 
                    list_INCR.add(INCR67);

                    pushFollow(FOLLOW_named_expression_in_unary_expression1149);
                    named_expression68=named_expression();
                    _fsp--;

                    list_named_expression.add(named_expression68.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 169:30: -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                    {
                        // src/antlr3/Plumhead.g:169:33: ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_1);

                        // src/antlr3/Plumhead.g:169:46: ^( VAR LETTER[\"a\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_2);

                        adaptor.addChild(root_2, adaptor.create(LETTER, "a"));

                        adaptor.addChild(root_1, root_2);
                        }
                        // src/antlr3/Plumhead.g:169:65: ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(PLUS, "+"), root_2);

                        // src/antlr3/Plumhead.g:169:78: ^( VAR LETTER[\"a\"] )
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
                    // src/antlr3/Plumhead.g:170:5: DECR named_expression
                    {
                    DECR69=(Token)input.LT(1);
                    match(input,DECR,FOLLOW_DECR_in_unary_expression1190); 
                    list_DECR.add(DECR69);

                    pushFollow(FOLLOW_named_expression_in_unary_expression1192);
                    named_expression70=named_expression();
                    _fsp--;

                    list_named_expression.add(named_expression70.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 170:30: -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                    {
                        // src/antlr3/Plumhead.g:170:33: ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_1);

                        // src/antlr3/Plumhead.g:170:46: ^( VAR LETTER[\"a\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_2);

                        adaptor.addChild(root_2, adaptor.create(LETTER, "a"));

                        adaptor.addChild(root_1, root_2);
                        }
                        // src/antlr3/Plumhead.g:170:65: ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(MINUS, "-"), root_2);

                        // src/antlr3/Plumhead.g:170:79: ^( VAR LETTER[\"a\"] )
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
    // src/antlr3/Plumhead.g:173:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER71=null;
        Token char_literal73=null;
        Token char_literal75=null;
        named_expression_return named_expression72 = null;

        expression_return expression74 = null;

        List list_expression=new ArrayList();
        List list_41=new ArrayList();
        List list_40=new ArrayList();
        CommonTree NUMBER71_tree=null;
        CommonTree char_literal73_tree=null;
        CommonTree char_literal75_tree=null;

        try {
            // src/antlr3/Plumhead.g:174:5: ( NUMBER | named_expression | '(' expression ')' -> expression )
            int alt19=3;
            switch ( input.LA(1) ) {
            case NUMBER:
                alt19=1;
                break;
            case LETTER:
                alt19=2;
                break;
            case 40:
                alt19=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("173:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );", 19, 0, input);

                throw nvae;
            }

            switch (alt19) {
                case 1 :
                    // src/antlr3/Plumhead.g:174:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER71=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression1240); 
                    NUMBER71_tree = (CommonTree)adaptor.create(NUMBER71);
                    adaptor.addChild(root_0, NUMBER71_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:175:5: named_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_postfix_expression1246);
                    named_expression72=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression72.tree);

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:176:5: '(' expression ')'
                    {
                    char_literal73=(Token)input.LT(1);
                    match(input,40,FOLLOW_40_in_postfix_expression1252); 
                    list_40.add(char_literal73);

                    pushFollow(FOLLOW_expression_in_postfix_expression1254);
                    expression74=expression();
                    _fsp--;

                    list_expression.add(expression74.tree);
                    char_literal75=(Token)input.LT(1);
                    match(input,41,FOLLOW_41_in_postfix_expression1256); 
                    list_41.add(char_literal75);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 176:24: -> expression
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


 

    public static final BitSet FOLLOW_START_PHP_in_program631 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_semicolon_list_in_input_item645 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_NEWLINE_in_input_item647 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_function_in_input_item654 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list668 = new BitSet(new long[]{0x0000008000000002L});
    public static final BitSet FOLLOW_39_in_semicolon_list673 = new BitSet(new long[]{0x0000058040C36002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list676 = new BitSet(new long[]{0x0000008000000002L});
    public static final BitSet FOLLOW_statement_in_statement_list700 = new BitSet(new long[]{0x0000058040C37002L});
    public static final BitSet FOLLOW_NEWLINE_in_statement_list704 = new BitSet(new long[]{0x0000058040C37002L});
    public static final BitSet FOLLOW_39_in_statement_list709 = new BitSet(new long[]{0x0000058040C37002L});
    public static final BitSet FOLLOW_named_expression_in_statement727 = new BitSet(new long[]{0x0000000000100000L});
    public static final BitSet FOLLOW_ASSIGN_OP_in_statement729 = new BitSet(new long[]{0x0000010000C34000L});
    public static final BitSet FOLLOW_expression_in_statement732 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_statement738 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_statement762 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_If_in_statement778 = new BitSet(new long[]{0x0000010000000000L});
    public static final BitSet FOLLOW_40_in_statement780 = new BitSet(new long[]{0x0000010000C34000L});
    public static final BitSet FOLLOW_relational_expression_in_statement782 = new BitSet(new long[]{0x0000020000000000L});
    public static final BitSet FOLLOW_41_in_statement784 = new BitSet(new long[]{0x0000050040C36000L});
    public static final BitSet FOLLOW_statement_in_statement786 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_42_in_statement810 = new BitSet(new long[]{0x00000D8040C37000L});
    public static final BitSet FOLLOW_statement_list_in_statement813 = new BitSet(new long[]{0x0000080000000000L});
    public static final BitSet FOLLOW_43_in_statement815 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_Define_in_function830 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_LETTER_in_function832 = new BitSet(new long[]{0x0000010000000000L});
    public static final BitSet FOLLOW_40_in_function834 = new BitSet(new long[]{0x0000020000004000L});
    public static final BitSet FOLLOW_parameter_list_in_function836 = new BitSet(new long[]{0x0000020000000000L});
    public static final BitSet FOLLOW_41_in_function839 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_42_in_function841 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_NEWLINE_in_function843 = new BitSet(new long[]{0x00000D9040C37000L});
    public static final BitSet FOLLOW_auto_define_list_in_function845 = new BitSet(new long[]{0x00000D8040C37000L});
    public static final BitSet FOLLOW_statement_list_in_function848 = new BitSet(new long[]{0x0000080000000000L});
    public static final BitSet FOLLOW_43_in_function850 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_define_list_in_parameter_list881 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_Auto_in_auto_define_list894 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_define_list_in_auto_define_list896 = new BitSet(new long[]{0x0000008000001000L});
    public static final BitSet FOLLOW_set_in_auto_define_list900 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_define_list919 = new BitSet(new long[]{0x0000500000000002L});
    public static final BitSet FOLLOW_44_in_define_list923 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_define_list925 = new BitSet(new long[]{0x0000400000000002L});
    public static final BitSet FOLLOW_46_in_define_list932 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_LETTER_in_define_list934 = new BitSet(new long[]{0x0000500000000002L});
    public static final BitSet FOLLOW_44_in_define_list938 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_define_list940 = new BitSet(new long[]{0x0000400000000002L});
    public static final BitSet FOLLOW_expression_in_argument_list959 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_argument_list965 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_argument_list967 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_argument_list969 = new BitSet(new long[]{0x0000400000000000L});
    public static final BitSet FOLLOW_46_in_argument_list971 = new BitSet(new long[]{0x0000010000C34000L});
    public static final BitSet FOLLOW_argument_list_in_argument_list973 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_relational_expression987 = new BitSet(new long[]{0x0000000000200002L});
    public static final BitSet FOLLOW_REL_OP_in_relational_expression991 = new BitSet(new long[]{0x0000010000C34000L});
    public static final BitSet FOLLOW_expression_in_relational_expression994 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_return_expression1010 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression1024 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_named_expression1037 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1063 = new BitSet(new long[]{0x0000000000060002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression1069 = new BitSet(new long[]{0x0000010000C34000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression1074 = new BitSet(new long[]{0x0000010000C34000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1079 = new BitSet(new long[]{0x0000000000060002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1096 = new BitSet(new long[]{0x0000000000080002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression1100 = new BitSet(new long[]{0x0000010000C34000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1103 = new BitSet(new long[]{0x0000000000080002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1119 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression1125 = new BitSet(new long[]{0x0000010000014000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1127 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INCR_in_unary_expression1147 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_named_expression_in_unary_expression1149 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DECR_in_unary_expression1190 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_named_expression_in_unary_expression1192 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression1240 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_named_expression_in_postfix_expression1246 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_40_in_postfix_expression1252 = new BitSet(new long[]{0x0000010000C34000L});
    public static final BitSet FOLLOW_expression_in_postfix_expression1254 = new BitSet(new long[]{0x0000020000000000L});
    public static final BitSet FOLLOW_41_in_postfix_expression1256 = new BitSet(new long[]{0x0000000000000002L});

}