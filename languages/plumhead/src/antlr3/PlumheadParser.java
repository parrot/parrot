// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-03 20:11:09

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "START_PHP", "END_PHP", "ARRAY", "FUNCTION", "PRINT", "PROGRAM", "STMTS", "VAR", "SEA", "START_CODE", "NEWLINE", "STRING", "LETTER", "INTEGER", "NUMBER", "MINUS", "PLUS", "MUL_OP", "ASSIGN_OP", "REL_OP", "INCR", "DECR", "Define", "Break", "Quit", "Length", "Return", "For", "If", "While", "Sqrt", "Scale", "Ibase", "Obase", "Auto", "ML_COMMENT", "WS", "';'", "'('", "')'", "'{'", "'}'", "'['", "']'", "','"
    };
    public static final int LETTER=16;
    public static final int MINUS=19;
    public static final int INCR=24;
    public static final int ARRAY=6;
    public static final int START_CODE=13;
    public static final int If=32;
    public static final int WS=40;
    public static final int DECR=25;
    public static final int NUMBER=18;
    public static final int Break=27;
    public static final int Sqrt=34;
    public static final int STRING=15;
    public static final int Ibase=36;
    public static final int START_PHP=4;
    public static final int Scale=35;
    public static final int MUL_OP=21;
    public static final int SEA=12;
    public static final int Auto=38;
    public static final int Define=26;
    public static final int Quit=28;
    public static final int PROGRAM=9;
    public static final int STMTS=10;
    public static final int NEWLINE=14;
    public static final int VAR=11;
    public static final int ASSIGN_OP=22;
    public static final int INTEGER=17;
    public static final int PRINT=8;
    public static final int Obase=37;
    public static final int FUNCTION=7;
    public static final int END_PHP=5;
    public static final int While=33;
    public static final int EOF=-1;
    public static final int REL_OP=23;
    public static final int ML_COMMENT=39;
    public static final int PLUS=20;
    public static final int Length=29;
    public static final int For=31;
    public static final int Return=30;

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
    // src/antlr3/Plumhead.g:95:1: program : ( SEA )? START_CODE SEA -> ^( START_CODE ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA1=null;
        Token START_CODE2=null;
        Token SEA3=null;
        List list_SEA=new ArrayList();
        List list_START_CODE=new ArrayList();
        CommonTree SEA1_tree=null;
        CommonTree START_CODE2_tree=null;
        CommonTree SEA3_tree=null;

        try {
            // src/antlr3/Plumhead.g:96:5: ( ( SEA )? START_CODE SEA -> ^( START_CODE ) )
            // src/antlr3/Plumhead.g:96:5: ( SEA )? START_CODE SEA
            {
            // src/antlr3/Plumhead.g:96:5: ( SEA )?
            int alt1=2;
            int LA1_0 = input.LA(1);
            if ( (LA1_0==SEA) ) {
                alt1=1;
            }
            switch (alt1) {
                case 1 :
                    // src/antlr3/Plumhead.g:96:5: SEA
                    {
                    SEA1=(Token)input.LT(1);
                    match(input,SEA,FOLLOW_SEA_in_program651); 
                    list_SEA.add(SEA1);


                    }
                    break;

            }

            START_CODE2=(Token)input.LT(1);
            match(input,START_CODE,FOLLOW_START_CODE_in_program654); 
            list_START_CODE.add(START_CODE2);

            SEA3=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_program656); 
            list_SEA.add(SEA3);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 96:25: -> ^( START_CODE )
            {
                // src/antlr3/Plumhead.g:96:28: ^( START_CODE )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_START_CODE.get(i_0), root_1);

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
    // src/antlr3/Plumhead.g:99:1: input_item : ( semicolon_list NEWLINE! | function );
    public input_item_return input_item() throws RecognitionException {   
        input_item_return retval = new input_item_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NEWLINE5=null;
        semicolon_list_return semicolon_list4 = null;

        function_return function6 = null;


        CommonTree NEWLINE5_tree=null;

        try {
            // src/antlr3/Plumhead.g:100:5: ( semicolon_list NEWLINE! | function )
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( ((LA2_0>=NEWLINE && LA2_0<=LETTER)||(LA2_0>=NUMBER && LA2_0<=MINUS)||(LA2_0>=INCR && LA2_0<=DECR)||LA2_0==If||(LA2_0>=41 && LA2_0<=42)||LA2_0==44) ) {
                alt2=1;
            }
            else if ( (LA2_0==Define) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("99:1: input_item : ( semicolon_list NEWLINE! | function );", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:100:5: semicolon_list NEWLINE!
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_semicolon_list_in_input_item678);
                    semicolon_list4=semicolon_list();
                    _fsp--;

                    adaptor.addChild(root_0, semicolon_list4.tree);
                    NEWLINE5=(Token)input.LT(1);
                    match(input,NEWLINE,FOLLOW_NEWLINE_in_input_item680); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:101:5: function
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_function_in_input_item687);
                    function6=function();
                    _fsp--;

                    adaptor.addChild(root_0, function6.tree);

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
    // src/antlr3/Plumhead.g:104:1: semicolon_list : ( statement )? ( ';'! ( statement )? )* ;
    public semicolon_list_return semicolon_list() throws RecognitionException {   
        semicolon_list_return retval = new semicolon_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token char_literal8=null;
        statement_return statement7 = null;

        statement_return statement9 = null;


        CommonTree char_literal8_tree=null;

        try {
            // src/antlr3/Plumhead.g:105:5: ( ( statement )? ( ';'! ( statement )? )* )
            // src/antlr3/Plumhead.g:105:5: ( statement )? ( ';'! ( statement )? )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:105:5: ( statement )?
            int alt3=2;
            int LA3_0 = input.LA(1);
            if ( ((LA3_0>=STRING && LA3_0<=LETTER)||(LA3_0>=NUMBER && LA3_0<=MINUS)||(LA3_0>=INCR && LA3_0<=DECR)||LA3_0==If||LA3_0==42||LA3_0==44) ) {
                alt3=1;
            }
            switch (alt3) {
                case 1 :
                    // src/antlr3/Plumhead.g:105:5: statement
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_statement_in_semicolon_list701);
                    statement7=statement();
                    _fsp--;

                    adaptor.addChild(root_1, statement7.tree);

                    adaptor.addChild(root_0, root_1);

                    }
                    break;

            }

            // src/antlr3/Plumhead.g:105:16: ( ';'! ( statement )? )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( (LA5_0==41) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:105:18: ';'! ( statement )?
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal8=(Token)input.LT(1);
            	    match(input,41,FOLLOW_41_in_semicolon_list706); 
            	    // src/antlr3/Plumhead.g:105:23: ( statement )?
            	    int alt4=2;
            	    int LA4_0 = input.LA(1);
            	    if ( ((LA4_0>=STRING && LA4_0<=LETTER)||(LA4_0>=NUMBER && LA4_0<=MINUS)||(LA4_0>=INCR && LA4_0<=DECR)||LA4_0==If||LA4_0==42||LA4_0==44) ) {
            	        alt4=1;
            	    }
            	    switch (alt4) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:105:23: statement
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            pushFollow(FOLLOW_statement_in_semicolon_list709);
            	            statement9=statement();
            	            _fsp--;

            	            adaptor.addChild(root_2, statement9.tree);

            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }


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
    // $ANTLR end semicolon_list

    public static class statement_list_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement_list
    // src/antlr3/Plumhead.g:108:1: statement_list : ( statement | NEWLINE! | ';'! )* ;
    public statement_list_return statement_list() throws RecognitionException {   
        statement_list_return retval = new statement_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NEWLINE11=null;
        Token char_literal12=null;
        statement_return statement10 = null;


        CommonTree NEWLINE11_tree=null;
        CommonTree char_literal12_tree=null;

        try {
            // src/antlr3/Plumhead.g:109:5: ( ( statement | NEWLINE! | ';'! )* )
            // src/antlr3/Plumhead.g:109:5: ( statement | NEWLINE! | ';'! )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:109:5: ( statement | NEWLINE! | ';'! )*
            loop6:
            do {
                int alt6=4;
                switch ( input.LA(1) ) {
                case STRING:
                case LETTER:
                case NUMBER:
                case MINUS:
                case INCR:
                case DECR:
                case If:
                case 42:
                case 44:
                    alt6=1;
                    break;
                case NEWLINE:
                    alt6=2;
                    break;
                case 41:
                    alt6=3;
                    break;

                }

                switch (alt6) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:109:7: statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_statement_in_statement_list733);
            	    statement10=statement();
            	    _fsp--;

            	    adaptor.addChild(root_1, statement10.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;
            	case 2 :
            	    // src/antlr3/Plumhead.g:109:19: NEWLINE!
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    NEWLINE11=(Token)input.LT(1);
            	    match(input,NEWLINE,FOLLOW_NEWLINE_in_statement_list737); 

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;
            	case 3 :
            	    // src/antlr3/Plumhead.g:109:30: ';'!
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal12=(Token)input.LT(1);
            	    match(input,41,FOLLOW_41_in_statement_list742); 

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
    // $ANTLR end statement_list

    public static class statement_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement
    // src/antlr3/Plumhead.g:113:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) ) | '{'! statement_list '}'! );
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token ASSIGN_OP14=null;
        Token STRING17=null;
        Token If18=null;
        Token char_literal19=null;
        Token char_literal21=null;
        Token char_literal23=null;
        Token char_literal25=null;
        named_expression_return named_expression13 = null;

        expression_return expression15 = null;

        expression_return expression16 = null;

        relational_expression_return relational_expression20 = null;

        statement_return statement22 = null;

        statement_list_return statement_list24 = null;

        List list_statement=new ArrayList();
        List list_relational_expression=new ArrayList();
        List list_expression=new ArrayList();
        List list_43=new ArrayList();
        List list_42=new ArrayList();
        List list_If=new ArrayList();
        List list_STRING=new ArrayList();
        CommonTree ASSIGN_OP14_tree=null;
        CommonTree STRING17_tree=null;
        CommonTree If18_tree=null;
        CommonTree char_literal19_tree=null;
        CommonTree char_literal21_tree=null;
        CommonTree char_literal23_tree=null;
        CommonTree char_literal25_tree=null;

        try {
            // src/antlr3/Plumhead.g:114:5: ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) ) | '{'! statement_list '}'! )
            int alt7=5;
            switch ( input.LA(1) ) {
            case LETTER:
                int LA7_1 = input.LA(2);
                if ( (LA7_1==ASSIGN_OP) ) {
                    alt7=1;
                }
                else if ( ((LA7_1>=NEWLINE && LA7_1<=LETTER)||(LA7_1>=NUMBER && LA7_1<=MUL_OP)||(LA7_1>=INCR && LA7_1<=DECR)||LA7_1==If||(LA7_1>=41 && LA7_1<=42)||(LA7_1>=44 && LA7_1<=45)) ) {
                    alt7=2;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("113:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) ) | '{'! statement_list '}'! );", 7, 1, input);

                    throw nvae;
                }
                break;
            case NUMBER:
            case MINUS:
            case INCR:
            case DECR:
            case 42:
                alt7=2;
                break;
            case STRING:
                alt7=3;
                break;
            case If:
                alt7=4;
                break;
            case 44:
                alt7=5;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("113:1: statement : ( named_expression ASSIGN_OP^^ expression | expression -> ^( PRINT expression ) ^( PRINT NEWLINE ) | STRING -> ^( PRINT STRING ) | If '(' relational_expression ')' statement -> ^( If relational_expression ^( STMTS statement ) ) | '{'! statement_list '}'! );", 7, 0, input);

                throw nvae;
            }

            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:114:5: named_expression ASSIGN_OP^^ expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_statement760);
                    named_expression13=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression13.tree);
                    ASSIGN_OP14=(Token)input.LT(1);
                    match(input,ASSIGN_OP,FOLLOW_ASSIGN_OP_in_statement762); 
                    ASSIGN_OP14_tree = (CommonTree)adaptor.create(ASSIGN_OP14);
                    root_0 = (CommonTree)adaptor.becomeRoot(ASSIGN_OP14_tree, root_0);

                    pushFollow(FOLLOW_expression_in_statement765);
                    expression15=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression15.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:115:5: expression
                    {
                    pushFollow(FOLLOW_expression_in_statement771);
                    expression16=expression();
                    _fsp--;

                    list_expression.add(expression16.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 115:16: -> ^( PRINT expression ) ^( PRINT NEWLINE )
                    {
                        // src/antlr3/Plumhead.g:115:19: ^( PRINT expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PRINT, "PRINT"), root_1);

                        adaptor.addChild(root_1, list_expression.get(i_0));

                        adaptor.addChild(root_0, root_1);
                        }
                        // src/antlr3/Plumhead.g:115:41: ^( PRINT NEWLINE )
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
                    // src/antlr3/Plumhead.g:116:5: STRING
                    {
                    STRING17=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_statement795); 
                    list_STRING.add(STRING17);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 116:12: -> ^( PRINT STRING )
                    {
                        // src/antlr3/Plumhead.g:116:15: ^( PRINT STRING )
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
                    // src/antlr3/Plumhead.g:117:5: If '(' relational_expression ')' statement
                    {
                    If18=(Token)input.LT(1);
                    match(input,If,FOLLOW_If_in_statement811); 
                    list_If.add(If18);

                    char_literal19=(Token)input.LT(1);
                    match(input,42,FOLLOW_42_in_statement813); 
                    list_42.add(char_literal19);

                    pushFollow(FOLLOW_relational_expression_in_statement815);
                    relational_expression20=relational_expression();
                    _fsp--;

                    list_relational_expression.add(relational_expression20.tree);
                    char_literal21=(Token)input.LT(1);
                    match(input,43,FOLLOW_43_in_statement817); 
                    list_43.add(char_literal21);

                    pushFollow(FOLLOW_statement_in_statement819);
                    statement22=statement();
                    _fsp--;

                    list_statement.add(statement22.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 117:48: -> ^( If relational_expression ^( STMTS statement ) )
                    {
                        // src/antlr3/Plumhead.g:117:51: ^( If relational_expression ^( STMTS statement ) )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot((Token)list_If.get(i_0), root_1);

                        adaptor.addChild(root_1, list_relational_expression.get(i_0));
                        // src/antlr3/Plumhead.g:117:79: ^( STMTS statement )
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
                    // src/antlr3/Plumhead.g:118:5: '{'! statement_list '}'!
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    char_literal23=(Token)input.LT(1);
                    match(input,44,FOLLOW_44_in_statement843); 
                    pushFollow(FOLLOW_statement_list_in_statement846);
                    statement_list24=statement_list();
                    _fsp--;

                    adaptor.addChild(root_0, statement_list24.tree);
                    char_literal25=(Token)input.LT(1);
                    match(input,45,FOLLOW_45_in_statement848); 

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
    // src/antlr3/Plumhead.g:122:1: function : Define LETTER '(' ( parameter_list )? ')' '{' NEWLINE ( auto_define_list )? statement_list '}' -> ^( FUNCTION LETTER ) ;
    public function_return function() throws RecognitionException {   
        function_return retval = new function_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token Define26=null;
        Token LETTER27=null;
        Token char_literal28=null;
        Token char_literal30=null;
        Token char_literal31=null;
        Token NEWLINE32=null;
        Token char_literal35=null;
        parameter_list_return parameter_list29 = null;

        auto_define_list_return auto_define_list33 = null;

        statement_list_return statement_list34 = null;

        List list_statement_list=new ArrayList();
        List list_parameter_list=new ArrayList();
        List list_auto_define_list=new ArrayList();
        List list_43=new ArrayList();
        List list_LETTER=new ArrayList();
        List list_44=new ArrayList();
        List list_Define=new ArrayList();
        List list_42=new ArrayList();
        List list_NEWLINE=new ArrayList();
        List list_45=new ArrayList();
        CommonTree Define26_tree=null;
        CommonTree LETTER27_tree=null;
        CommonTree char_literal28_tree=null;
        CommonTree char_literal30_tree=null;
        CommonTree char_literal31_tree=null;
        CommonTree NEWLINE32_tree=null;
        CommonTree char_literal35_tree=null;

        try {
            // src/antlr3/Plumhead.g:123:5: ( Define LETTER '(' ( parameter_list )? ')' '{' NEWLINE ( auto_define_list )? statement_list '}' -> ^( FUNCTION LETTER ) )
            // src/antlr3/Plumhead.g:123:5: Define LETTER '(' ( parameter_list )? ')' '{' NEWLINE ( auto_define_list )? statement_list '}'
            {
            Define26=(Token)input.LT(1);
            match(input,Define,FOLLOW_Define_in_function863); 
            list_Define.add(Define26);

            LETTER27=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_function865); 
            list_LETTER.add(LETTER27);

            char_literal28=(Token)input.LT(1);
            match(input,42,FOLLOW_42_in_function867); 
            list_42.add(char_literal28);

            // src/antlr3/Plumhead.g:123:23: ( parameter_list )?
            int alt8=2;
            int LA8_0 = input.LA(1);
            if ( (LA8_0==LETTER) ) {
                alt8=1;
            }
            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:123:23: parameter_list
                    {
                    pushFollow(FOLLOW_parameter_list_in_function869);
                    parameter_list29=parameter_list();
                    _fsp--;

                    list_parameter_list.add(parameter_list29.tree);

                    }
                    break;

            }

            char_literal30=(Token)input.LT(1);
            match(input,43,FOLLOW_43_in_function872); 
            list_43.add(char_literal30);

            char_literal31=(Token)input.LT(1);
            match(input,44,FOLLOW_44_in_function874); 
            list_44.add(char_literal31);

            NEWLINE32=(Token)input.LT(1);
            match(input,NEWLINE,FOLLOW_NEWLINE_in_function876); 
            list_NEWLINE.add(NEWLINE32);

            // src/antlr3/Plumhead.g:123:55: ( auto_define_list )?
            int alt9=2;
            int LA9_0 = input.LA(1);
            if ( (LA9_0==Auto) ) {
                alt9=1;
            }
            switch (alt9) {
                case 1 :
                    // src/antlr3/Plumhead.g:123:55: auto_define_list
                    {
                    pushFollow(FOLLOW_auto_define_list_in_function878);
                    auto_define_list33=auto_define_list();
                    _fsp--;

                    list_auto_define_list.add(auto_define_list33.tree);

                    }
                    break;

            }

            pushFollow(FOLLOW_statement_list_in_function881);
            statement_list34=statement_list();
            _fsp--;

            list_statement_list.add(statement_list34.tree);
            char_literal35=(Token)input.LT(1);
            match(input,45,FOLLOW_45_in_function883); 
            list_45.add(char_literal35);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 123:92: -> ^( FUNCTION LETTER )
            {
                // src/antlr3/Plumhead.g:123:95: ^( FUNCTION LETTER )
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
    // src/antlr3/Plumhead.g:127:1: parameter_list : define_list ;
    public parameter_list_return parameter_list() throws RecognitionException {   
        parameter_list_return retval = new parameter_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        define_list_return define_list36 = null;



        try {
            // src/antlr3/Plumhead.g:128:5: ( define_list )
            // src/antlr3/Plumhead.g:128:5: define_list
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_define_list_in_parameter_list914);
            define_list36=define_list();
            _fsp--;

            adaptor.addChild(root_0, define_list36.tree);

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
    // src/antlr3/Plumhead.g:131:1: auto_define_list : Auto define_list (NEWLINE|';');
    public auto_define_list_return auto_define_list() throws RecognitionException {   
        auto_define_list_return retval = new auto_define_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token Auto37=null;
        Token set39=null;
        define_list_return define_list38 = null;


        CommonTree Auto37_tree=null;
        CommonTree set39_tree=null;

        try {
            // src/antlr3/Plumhead.g:132:5: ( Auto define_list (NEWLINE|';'))
            // src/antlr3/Plumhead.g:132:5: Auto define_list (NEWLINE|';')
            {
            root_0 = (CommonTree)adaptor.nil();

            Auto37=(Token)input.LT(1);
            match(input,Auto,FOLLOW_Auto_in_auto_define_list927); 
            Auto37_tree = (CommonTree)adaptor.create(Auto37);
            adaptor.addChild(root_0, Auto37_tree);

            pushFollow(FOLLOW_define_list_in_auto_define_list929);
            define_list38=define_list();
            _fsp--;

            adaptor.addChild(root_0, define_list38.tree);
            set39=(Token)input.LT(1);
            if ( input.LA(1)==NEWLINE||input.LA(1)==41 ) {
                adaptor.addChild(root_0, adaptor.create(set39));
                input.consume();
                errorRecovery=false;
            }
            else {
                MismatchedSetException mse =
                    new MismatchedSetException(null,input);
                recoverFromMismatchedSet(input,mse,FOLLOW_set_in_auto_define_list933);    throw mse;
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
    // src/antlr3/Plumhead.g:135:1: define_list : LETTER ( '[' ']' )? ( ',' LETTER ( '[' ']' )? )* ;
    public define_list_return define_list() throws RecognitionException {   
        define_list_return retval = new define_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER40=null;
        Token char_literal41=null;
        Token char_literal42=null;
        Token char_literal43=null;
        Token LETTER44=null;
        Token char_literal45=null;
        Token char_literal46=null;

        CommonTree LETTER40_tree=null;
        CommonTree char_literal41_tree=null;
        CommonTree char_literal42_tree=null;
        CommonTree char_literal43_tree=null;
        CommonTree LETTER44_tree=null;
        CommonTree char_literal45_tree=null;
        CommonTree char_literal46_tree=null;

        try {
            // src/antlr3/Plumhead.g:136:5: ( LETTER ( '[' ']' )? ( ',' LETTER ( '[' ']' )? )* )
            // src/antlr3/Plumhead.g:136:5: LETTER ( '[' ']' )? ( ',' LETTER ( '[' ']' )? )*
            {
            root_0 = (CommonTree)adaptor.nil();

            LETTER40=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_define_list952); 
            LETTER40_tree = (CommonTree)adaptor.create(LETTER40);
            adaptor.addChild(root_0, LETTER40_tree);

            // src/antlr3/Plumhead.g:136:12: ( '[' ']' )?
            int alt10=2;
            int LA10_0 = input.LA(1);
            if ( (LA10_0==46) ) {
                alt10=1;
            }
            switch (alt10) {
                case 1 :
                    // src/antlr3/Plumhead.g:136:14: '[' ']'
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    char_literal41=(Token)input.LT(1);
                    match(input,46,FOLLOW_46_in_define_list956); 
                    char_literal41_tree = (CommonTree)adaptor.create(char_literal41);
                    adaptor.addChild(root_1, char_literal41_tree);

                    char_literal42=(Token)input.LT(1);
                    match(input,47,FOLLOW_47_in_define_list958); 
                    char_literal42_tree = (CommonTree)adaptor.create(char_literal42);
                    adaptor.addChild(root_1, char_literal42_tree);


                    adaptor.addChild(root_0, root_1);

                    }
                    break;

            }

            // src/antlr3/Plumhead.g:136:25: ( ',' LETTER ( '[' ']' )? )*
            loop12:
            do {
                int alt12=2;
                int LA12_0 = input.LA(1);
                if ( (LA12_0==48) ) {
                    alt12=1;
                }


                switch (alt12) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:136:27: ',' LETTER ( '[' ']' )?
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    char_literal43=(Token)input.LT(1);
            	    match(input,48,FOLLOW_48_in_define_list965); 
            	    char_literal43_tree = (CommonTree)adaptor.create(char_literal43);
            	    adaptor.addChild(root_1, char_literal43_tree);

            	    LETTER44=(Token)input.LT(1);
            	    match(input,LETTER,FOLLOW_LETTER_in_define_list967); 
            	    LETTER44_tree = (CommonTree)adaptor.create(LETTER44);
            	    adaptor.addChild(root_1, LETTER44_tree);

            	    // src/antlr3/Plumhead.g:136:38: ( '[' ']' )?
            	    int alt11=2;
            	    int LA11_0 = input.LA(1);
            	    if ( (LA11_0==46) ) {
            	        alt11=1;
            	    }
            	    switch (alt11) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:136:40: '[' ']'
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            char_literal45=(Token)input.LT(1);
            	            match(input,46,FOLLOW_46_in_define_list971); 
            	            char_literal45_tree = (CommonTree)adaptor.create(char_literal45);
            	            adaptor.addChild(root_2, char_literal45_tree);

            	            char_literal46=(Token)input.LT(1);
            	            match(input,47,FOLLOW_47_in_define_list973); 
            	            char_literal46_tree = (CommonTree)adaptor.create(char_literal46);
            	            adaptor.addChild(root_2, char_literal46_tree);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }


            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop12;
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
    // src/antlr3/Plumhead.g:139:1: argument_list : ( expression | LETTER '[' ']' ',' argument_list );
    public argument_list_return argument_list() throws RecognitionException {   
        argument_list_return retval = new argument_list_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER48=null;
        Token char_literal49=null;
        Token char_literal50=null;
        Token char_literal51=null;
        expression_return expression47 = null;

        argument_list_return argument_list52 = null;


        CommonTree LETTER48_tree=null;
        CommonTree char_literal49_tree=null;
        CommonTree char_literal50_tree=null;
        CommonTree char_literal51_tree=null;

        try {
            // src/antlr3/Plumhead.g:140:5: ( expression | LETTER '[' ']' ',' argument_list )
            int alt13=2;
            int LA13_0 = input.LA(1);
            if ( ((LA13_0>=NUMBER && LA13_0<=MINUS)||(LA13_0>=INCR && LA13_0<=DECR)||LA13_0==42) ) {
                alt13=1;
            }
            else if ( (LA13_0==LETTER) ) {
                int LA13_2 = input.LA(2);
                if ( (LA13_2==46) ) {
                    alt13=2;
                }
                else if ( ((LA13_2>=MINUS && LA13_2<=MUL_OP)) ) {
                    alt13=1;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("139:1: argument_list : ( expression | LETTER '[' ']' ',' argument_list );", 13, 2, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("139:1: argument_list : ( expression | LETTER '[' ']' ',' argument_list );", 13, 0, input);

                throw nvae;
            }
            switch (alt13) {
                case 1 :
                    // src/antlr3/Plumhead.g:140:5: expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_expression_in_argument_list992);
                    expression47=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression47.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:141:5: LETTER '[' ']' ',' argument_list
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    LETTER48=(Token)input.LT(1);
                    match(input,LETTER,FOLLOW_LETTER_in_argument_list998); 
                    LETTER48_tree = (CommonTree)adaptor.create(LETTER48);
                    adaptor.addChild(root_0, LETTER48_tree);

                    char_literal49=(Token)input.LT(1);
                    match(input,46,FOLLOW_46_in_argument_list1000); 
                    char_literal49_tree = (CommonTree)adaptor.create(char_literal49);
                    adaptor.addChild(root_0, char_literal49_tree);

                    char_literal50=(Token)input.LT(1);
                    match(input,47,FOLLOW_47_in_argument_list1002); 
                    char_literal50_tree = (CommonTree)adaptor.create(char_literal50);
                    adaptor.addChild(root_0, char_literal50_tree);

                    char_literal51=(Token)input.LT(1);
                    match(input,48,FOLLOW_48_in_argument_list1004); 
                    char_literal51_tree = (CommonTree)adaptor.create(char_literal51);
                    adaptor.addChild(root_0, char_literal51_tree);

                    pushFollow(FOLLOW_argument_list_in_argument_list1006);
                    argument_list52=argument_list();
                    _fsp--;

                    adaptor.addChild(root_0, argument_list52.tree);

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
    // src/antlr3/Plumhead.g:144:1: relational_expression : expression ( REL_OP^^ expression )? ;
    public relational_expression_return relational_expression() throws RecognitionException {   
        relational_expression_return retval = new relational_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token REL_OP54=null;
        expression_return expression53 = null;

        expression_return expression55 = null;


        CommonTree REL_OP54_tree=null;

        try {
            // src/antlr3/Plumhead.g:145:5: ( expression ( REL_OP^^ expression )? )
            // src/antlr3/Plumhead.g:145:5: expression ( REL_OP^^ expression )?
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_expression_in_relational_expression1020);
            expression53=expression();
            _fsp--;

            adaptor.addChild(root_0, expression53.tree);
            // src/antlr3/Plumhead.g:145:16: ( REL_OP^^ expression )?
            int alt14=2;
            int LA14_0 = input.LA(1);
            if ( (LA14_0==REL_OP) ) {
                alt14=1;
            }
            switch (alt14) {
                case 1 :
                    // src/antlr3/Plumhead.g:145:18: REL_OP^^ expression
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    REL_OP54=(Token)input.LT(1);
                    match(input,REL_OP,FOLLOW_REL_OP_in_relational_expression1024); 
                    REL_OP54_tree = (CommonTree)adaptor.create(REL_OP54);
                    root_0 = (CommonTree)adaptor.becomeRoot(REL_OP54_tree, root_0);

                    pushFollow(FOLLOW_expression_in_relational_expression1027);
                    expression55=expression();
                    _fsp--;

                    adaptor.addChild(root_1, expression55.tree);

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
    // src/antlr3/Plumhead.g:148:1: return_expression : ( expression )? ;
    public return_expression_return return_expression() throws RecognitionException {   
        return_expression_return retval = new return_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        expression_return expression56 = null;



        try {
            // src/antlr3/Plumhead.g:149:5: ( ( expression )? )
            // src/antlr3/Plumhead.g:149:5: ( expression )?
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:149:5: ( expression )?
            int alt15=2;
            int LA15_0 = input.LA(1);
            if ( (LA15_0==LETTER||(LA15_0>=NUMBER && LA15_0<=MINUS)||(LA15_0>=INCR && LA15_0<=DECR)||LA15_0==42) ) {
                alt15=1;
            }
            switch (alt15) {
                case 1 :
                    // src/antlr3/Plumhead.g:149:5: expression
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_expression_in_return_expression1043);
                    expression56=expression();
                    _fsp--;

                    adaptor.addChild(root_1, expression56.tree);

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
    // src/antlr3/Plumhead.g:152:1: expression : adding_expression ;
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        adding_expression_return adding_expression57 = null;



        try {
            // src/antlr3/Plumhead.g:153:5: ( adding_expression )
            // src/antlr3/Plumhead.g:153:5: adding_expression
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_adding_expression_in_expression1057);
            adding_expression57=adding_expression();
            _fsp--;

            adaptor.addChild(root_0, adding_expression57.tree);

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
    // src/antlr3/Plumhead.g:156:1: named_expression : LETTER -> ^( VAR LETTER ) ;
    public named_expression_return named_expression() throws RecognitionException {   
        named_expression_return retval = new named_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token LETTER58=null;
        List list_LETTER=new ArrayList();
        CommonTree LETTER58_tree=null;

        try {
            // src/antlr3/Plumhead.g:157:5: ( LETTER -> ^( VAR LETTER ) )
            // src/antlr3/Plumhead.g:157:5: LETTER
            {
            LETTER58=(Token)input.LT(1);
            match(input,LETTER,FOLLOW_LETTER_in_named_expression1070); 
            list_LETTER.add(LETTER58);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 157:12: -> ^( VAR LETTER )
            {
                // src/antlr3/Plumhead.g:157:15: ^( VAR LETTER )
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
    // src/antlr3/Plumhead.g:162:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS60=null;
        Token MINUS61=null;
        multiplying_expression_return multiplying_expression59 = null;

        multiplying_expression_return multiplying_expression62 = null;


        CommonTree PLUS60_tree=null;
        CommonTree MINUS61_tree=null;

        try {
            // src/antlr3/Plumhead.g:163:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // src/antlr3/Plumhead.g:163:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression1096);
            multiplying_expression59=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression59.tree);
            // src/antlr3/Plumhead.g:163:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop17:
            do {
                int alt17=2;
                int LA17_0 = input.LA(1);
                if ( (LA17_0==MINUS) ) {
                    switch ( input.LA(2) ) {
                    case NUMBER:
                        alt17=1;
                        break;
                    case LETTER:
                    case MINUS:
                    case INCR:
                    case DECR:
                        alt17=1;
                        break;
                    case 42:
                        alt17=1;
                        break;

                    }

                }
                else if ( (LA17_0==PLUS) ) {
                    alt17=1;
                }


                switch (alt17) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:163:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // src/antlr3/Plumhead.g:163:30: ( PLUS^^ | MINUS^^ )
            	    int alt16=2;
            	    int LA16_0 = input.LA(1);
            	    if ( (LA16_0==PLUS) ) {
            	        alt16=1;
            	    }
            	    else if ( (LA16_0==MINUS) ) {
            	        alt16=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("163:30: ( PLUS^^ | MINUS^^ )", 16, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt16) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:163:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS60=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression1102); 
            	            PLUS60_tree = (CommonTree)adaptor.create(PLUS60);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS60_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // src/antlr3/Plumhead.g:163:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS61=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression1107); 
            	            MINUS61_tree = (CommonTree)adaptor.create(MINUS61);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS61_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression1112);
            	    multiplying_expression62=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression62.tree);

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
    // $ANTLR end adding_expression

    public static class multiplying_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start multiplying_expression
    // src/antlr3/Plumhead.g:166:1: multiplying_expression : unary_expression ( MUL_OP^^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP64=null;
        unary_expression_return unary_expression63 = null;

        unary_expression_return unary_expression65 = null;


        CommonTree MUL_OP64_tree=null;

        try {
            // src/antlr3/Plumhead.g:167:5: ( unary_expression ( MUL_OP^^ unary_expression )* )
            // src/antlr3/Plumhead.g:167:5: unary_expression ( MUL_OP^^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression1129);
            unary_expression63=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression63.tree);
            // src/antlr3/Plumhead.g:167:22: ( MUL_OP^^ unary_expression )*
            loop18:
            do {
                int alt18=2;
                int LA18_0 = input.LA(1);
                if ( (LA18_0==MUL_OP) ) {
                    alt18=1;
                }


                switch (alt18) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:167:24: MUL_OP^^ unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    MUL_OP64=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression1133); 
            	    MUL_OP64_tree = (CommonTree)adaptor.create(MUL_OP64);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP64_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression1136);
            	    unary_expression65=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression65.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;

            	default :
            	    break loop18;
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
    // src/antlr3/Plumhead.g:170:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP["*"] NUMBER["-1"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER["a"] ) ^( PLUS["+"] ^( VAR LETTER["a"] ) NUMBER["1"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER["a"] ) ^( MINUS["-"] ^( VAR LETTER["a"] ) NUMBER["1"] ) ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS67=null;
        Token INCR69=null;
        Token DECR71=null;
        postfix_expression_return postfix_expression66 = null;

        postfix_expression_return postfix_expression68 = null;

        named_expression_return named_expression70 = null;

        named_expression_return named_expression72 = null;

        List list_named_expression=new ArrayList();
        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        List list_INCR=new ArrayList();
        List list_DECR=new ArrayList();
        CommonTree MINUS67_tree=null;
        CommonTree INCR69_tree=null;
        CommonTree DECR71_tree=null;

        try {
            // src/antlr3/Plumhead.g:171:5: ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) )
            int alt19=4;
            switch ( input.LA(1) ) {
            case LETTER:
            case NUMBER:
            case 42:
                alt19=1;
                break;
            case MINUS:
                alt19=2;
                break;
            case INCR:
                alt19=3;
                break;
            case DECR:
                alt19=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("170:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression ) | INCR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) | DECR named_expression -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) ) );", 19, 0, input);

                throw nvae;
            }

            switch (alt19) {
                case 1 :
                    // src/antlr3/Plumhead.g:171:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1152);
                    postfix_expression66=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression66.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:172:5: MINUS postfix_expression
                    {
                    MINUS67=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression1158); 
                    list_MINUS.add(MINUS67);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1160);
                    postfix_expression68=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression68.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 172:30: -> ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression )
                    {
                        // src/antlr3/Plumhead.g:172:33: ^( MUL_OP[\"*\"] NUMBER[\"-1\"] postfix_expression )
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
                    // src/antlr3/Plumhead.g:173:5: INCR named_expression
                    {
                    INCR69=(Token)input.LT(1);
                    match(input,INCR,FOLLOW_INCR_in_unary_expression1180); 
                    list_INCR.add(INCR69);

                    pushFollow(FOLLOW_named_expression_in_unary_expression1182);
                    named_expression70=named_expression();
                    _fsp--;

                    list_named_expression.add(named_expression70.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 173:30: -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                    {
                        // src/antlr3/Plumhead.g:173:33: ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_1);

                        // src/antlr3/Plumhead.g:173:46: ^( VAR LETTER[\"a\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_2);

                        adaptor.addChild(root_2, adaptor.create(LETTER, "a"));

                        adaptor.addChild(root_1, root_2);
                        }
                        // src/antlr3/Plumhead.g:173:65: ^( PLUS[\"+\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(PLUS, "+"), root_2);

                        // src/antlr3/Plumhead.g:173:78: ^( VAR LETTER[\"a\"] )
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
                    // src/antlr3/Plumhead.g:174:5: DECR named_expression
                    {
                    DECR71=(Token)input.LT(1);
                    match(input,DECR,FOLLOW_DECR_in_unary_expression1223); 
                    list_DECR.add(DECR71);

                    pushFollow(FOLLOW_named_expression_in_unary_expression1225);
                    named_expression72=named_expression();
                    _fsp--;

                    list_named_expression.add(named_expression72.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 174:30: -> ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                    {
                        // src/antlr3/Plumhead.g:174:33: ^( ASSIGN_OP ^( VAR LETTER[\"a\"] ) ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] ) )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ASSIGN_OP, "ASSIGN_OP"), root_1);

                        // src/antlr3/Plumhead.g:174:46: ^( VAR LETTER[\"a\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(VAR, "VAR"), root_2);

                        adaptor.addChild(root_2, adaptor.create(LETTER, "a"));

                        adaptor.addChild(root_1, root_2);
                        }
                        // src/antlr3/Plumhead.g:174:65: ^( MINUS[\"-\"] ^( VAR LETTER[\"a\"] ) NUMBER[\"1\"] )
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(MINUS, "-"), root_2);

                        // src/antlr3/Plumhead.g:174:79: ^( VAR LETTER[\"a\"] )
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
    // src/antlr3/Plumhead.g:177:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER73=null;
        Token char_literal75=null;
        Token char_literal77=null;
        named_expression_return named_expression74 = null;

        expression_return expression76 = null;

        List list_expression=new ArrayList();
        List list_43=new ArrayList();
        List list_42=new ArrayList();
        CommonTree NUMBER73_tree=null;
        CommonTree char_literal75_tree=null;
        CommonTree char_literal77_tree=null;

        try {
            // src/antlr3/Plumhead.g:178:5: ( NUMBER | named_expression | '(' expression ')' -> expression )
            int alt20=3;
            switch ( input.LA(1) ) {
            case NUMBER:
                alt20=1;
                break;
            case LETTER:
                alt20=2;
                break;
            case 42:
                alt20=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("177:1: postfix_expression : ( NUMBER | named_expression | '(' expression ')' -> expression );", 20, 0, input);

                throw nvae;
            }

            switch (alt20) {
                case 1 :
                    // src/antlr3/Plumhead.g:178:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER73=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression1273); 
                    NUMBER73_tree = (CommonTree)adaptor.create(NUMBER73);
                    adaptor.addChild(root_0, NUMBER73_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:179:5: named_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_named_expression_in_postfix_expression1279);
                    named_expression74=named_expression();
                    _fsp--;

                    adaptor.addChild(root_0, named_expression74.tree);

                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:180:5: '(' expression ')'
                    {
                    char_literal75=(Token)input.LT(1);
                    match(input,42,FOLLOW_42_in_postfix_expression1285); 
                    list_42.add(char_literal75);

                    pushFollow(FOLLOW_expression_in_postfix_expression1287);
                    expression76=expression();
                    _fsp--;

                    list_expression.add(expression76.tree);
                    char_literal77=(Token)input.LT(1);
                    match(input,43,FOLLOW_43_in_postfix_expression1289); 
                    list_43.add(char_literal77);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 180:24: -> expression
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


 

    public static final BitSet FOLLOW_SEA_in_program651 = new BitSet(new long[]{0x0000000000002000L});
    public static final BitSet FOLLOW_START_CODE_in_program654 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_SEA_in_program656 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_semicolon_list_in_input_item678 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_NEWLINE_in_input_item680 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_function_in_input_item687 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list701 = new BitSet(new long[]{0x0000020000000002L});
    public static final BitSet FOLLOW_41_in_semicolon_list706 = new BitSet(new long[]{0x00001601030D8002L});
    public static final BitSet FOLLOW_statement_in_semicolon_list709 = new BitSet(new long[]{0x0000020000000002L});
    public static final BitSet FOLLOW_statement_in_statement_list733 = new BitSet(new long[]{0x00001601030DC002L});
    public static final BitSet FOLLOW_NEWLINE_in_statement_list737 = new BitSet(new long[]{0x00001601030DC002L});
    public static final BitSet FOLLOW_41_in_statement_list742 = new BitSet(new long[]{0x00001601030DC002L});
    public static final BitSet FOLLOW_named_expression_in_statement760 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_ASSIGN_OP_in_statement762 = new BitSet(new long[]{0x00000400030D0000L});
    public static final BitSet FOLLOW_expression_in_statement765 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_statement771 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_statement795 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_If_in_statement811 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_42_in_statement813 = new BitSet(new long[]{0x00000400030D0000L});
    public static final BitSet FOLLOW_relational_expression_in_statement815 = new BitSet(new long[]{0x0000080000000000L});
    public static final BitSet FOLLOW_43_in_statement817 = new BitSet(new long[]{0x00001401030D8000L});
    public static final BitSet FOLLOW_statement_in_statement819 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_44_in_statement843 = new BitSet(new long[]{0x00003601030DC000L});
    public static final BitSet FOLLOW_statement_list_in_statement846 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_statement848 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_Define_in_function863 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_LETTER_in_function865 = new BitSet(new long[]{0x0000040000000000L});
    public static final BitSet FOLLOW_42_in_function867 = new BitSet(new long[]{0x0000080000010000L});
    public static final BitSet FOLLOW_parameter_list_in_function869 = new BitSet(new long[]{0x0000080000000000L});
    public static final BitSet FOLLOW_43_in_function872 = new BitSet(new long[]{0x0000100000000000L});
    public static final BitSet FOLLOW_44_in_function874 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_NEWLINE_in_function876 = new BitSet(new long[]{0x00003641030DC000L});
    public static final BitSet FOLLOW_auto_define_list_in_function878 = new BitSet(new long[]{0x00003601030DC000L});
    public static final BitSet FOLLOW_statement_list_in_function881 = new BitSet(new long[]{0x0000200000000000L});
    public static final BitSet FOLLOW_45_in_function883 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_define_list_in_parameter_list914 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_Auto_in_auto_define_list927 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_define_list_in_auto_define_list929 = new BitSet(new long[]{0x0000020000004000L});
    public static final BitSet FOLLOW_set_in_auto_define_list933 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_define_list952 = new BitSet(new long[]{0x0001400000000002L});
    public static final BitSet FOLLOW_46_in_define_list956 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_define_list958 = new BitSet(new long[]{0x0001000000000002L});
    public static final BitSet FOLLOW_48_in_define_list965 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_LETTER_in_define_list967 = new BitSet(new long[]{0x0001400000000002L});
    public static final BitSet FOLLOW_46_in_define_list971 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_define_list973 = new BitSet(new long[]{0x0001000000000002L});
    public static final BitSet FOLLOW_expression_in_argument_list992 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_argument_list998 = new BitSet(new long[]{0x0000400000000000L});
    public static final BitSet FOLLOW_46_in_argument_list1000 = new BitSet(new long[]{0x0000800000000000L});
    public static final BitSet FOLLOW_47_in_argument_list1002 = new BitSet(new long[]{0x0001000000000000L});
    public static final BitSet FOLLOW_48_in_argument_list1004 = new BitSet(new long[]{0x00000400030D0000L});
    public static final BitSet FOLLOW_argument_list_in_argument_list1006 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_relational_expression1020 = new BitSet(new long[]{0x0000000000800002L});
    public static final BitSet FOLLOW_REL_OP_in_relational_expression1024 = new BitSet(new long[]{0x00000400030D0000L});
    public static final BitSet FOLLOW_expression_in_relational_expression1027 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_return_expression1043 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression1057 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_LETTER_in_named_expression1070 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1096 = new BitSet(new long[]{0x0000000000180002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression1102 = new BitSet(new long[]{0x00000400030D0000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression1107 = new BitSet(new long[]{0x00000400030D0000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1112 = new BitSet(new long[]{0x0000000000180002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1129 = new BitSet(new long[]{0x0000000000200002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression1133 = new BitSet(new long[]{0x00000400030D0000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1136 = new BitSet(new long[]{0x0000000000200002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1152 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression1158 = new BitSet(new long[]{0x0000040000050000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1160 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INCR_in_unary_expression1180 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_named_expression_in_unary_expression1182 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DECR_in_unary_expression1223 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_named_expression_in_unary_expression1225 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression1273 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_named_expression_in_postfix_expression1279 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_42_in_postfix_expression1285 = new BitSet(new long[]{0x00000400030D0000L});
    public static final BitSet FOLLOW_expression_in_postfix_expression1287 = new BitSet(new long[]{0x0000080000000000L});
    public static final BitSet FOLLOW_43_in_postfix_expression1289 = new BitSet(new long[]{0x0000000000000002L});

}