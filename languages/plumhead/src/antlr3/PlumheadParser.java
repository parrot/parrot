// $ANTLR 3.0b6 src/antlr3/Plumhead.g 2007-02-07 23:18:49

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "NOQUOTE_STRING", "STMTS", "SEA", "CODE_START", "CODE_END", "WS", "DOUBLEQUOTE_STRING", "SINGLEQUOTE_STRING", "ECHO", "IDENT", "SCALAR", "ARRAY", "INTEGER", "NUMBER", "MINUS", "PLUS", "MUL_OP", "ASSIGN_OP", "REL_OP", "IF", "ELSE", "';'", "'('", "')'", "'{'", "'}'"
    };
    public static final int CODE_START=8;
    public static final int MINUS=19;
    public static final int IDENT=14;
    public static final int ARRAY=16;
    public static final int WS=10;
    public static final int NUMBER=18;
    public static final int SINGLEQUOTE_STRING=12;
    public static final int MUL_OP=21;
    public static final int SEA=7;
    public static final int CODE_END=9;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int ASSIGN_OP=22;
    public static final int INTEGER=17;
    public static final int DOUBLEQUOTE_STRING=11;
    public static final int ECHO=13;
    public static final int ELSE=25;
    public static final int IF=24;
    public static final int EOF=-1;
    public static final int REL_OP=23;
    public static final int PLUS=20;
    public static final int NOQUOTE_STRING=5;
    public static final int SCALAR=15;

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
    // src/antlr3/Plumhead.g:70:1: program : sea_or_code -> ^( PROGRAM sea_or_code ) ;
    public program_return program() throws RecognitionException {
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_or_code_return sea_or_code1 = null;

        List list_sea_or_code=new ArrayList();

        try {
            // src/antlr3/Plumhead.g:71:5: ( sea_or_code -> ^( PROGRAM sea_or_code ) )
            // src/antlr3/Plumhead.g:71:5: sea_or_code
            {
            pushFollow(FOLLOW_sea_or_code_in_program538);
            sea_or_code1=sea_or_code();
            _fsp--;

            list_sea_or_code.add(sea_or_code1.getTree());

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 71:17: -> ^( PROGRAM sea_or_code )
            {
                // src/antlr3/Plumhead.g:71:20: ^( PROGRAM sea_or_code )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                adaptor.addChild(root_1, list_sea_or_code.get(i_0));

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

    public static class sea_or_code_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start sea_or_code
    // src/antlr3/Plumhead.g:74:1: sea_or_code : ( sea | code )+ ;
    public sea_or_code_return sea_or_code() throws RecognitionException {
        sea_or_code_return retval = new sea_or_code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_return sea2 = null;

        code_return code3 = null;



        try {
            // src/antlr3/Plumhead.g:75:5: ( ( sea | code )+ )
            // src/antlr3/Plumhead.g:75:5: ( sea | code )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:75:5: ( sea | code )+
            int cnt1=0;
            loop1:
            do {
                int alt1=3;
                int LA1_0 = input.LA(1);
                if ( (LA1_0==SEA) ) {
                    alt1=1;
                }
                else if ( (LA1_0==CODE_START) ) {
                    alt1=2;
                }


                switch (alt1) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:75:7: sea
            	    {
            	    pushFollow(FOLLOW_sea_in_sea_or_code563);
            	    sea2=sea();
            	    _fsp--;

            	    adaptor.addChild(root_0, sea2.getTree());

            	    }
            	    break;
            	case 2 :
            	    // src/antlr3/Plumhead.g:75:13: code
            	    {
            	    pushFollow(FOLLOW_code_in_sea_or_code567);
            	    code3=code();
            	    _fsp--;

            	    adaptor.addChild(root_0, code3.getTree());

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
    // $ANTLR end sea_or_code

    public static class sea_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start sea
    // src/antlr3/Plumhead.g:78:1: sea : SEA -> ^( ECHO NOQUOTE_STRING[$SEA] ) ;
    public sea_return sea() throws RecognitionException {
        sea_return retval = new sea_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA4=null;
        List list_SEA=new ArrayList();
        CommonTree SEA4_tree=null;

        try {
            // src/antlr3/Plumhead.g:79:5: ( SEA -> ^( ECHO NOQUOTE_STRING[$SEA] ) )
            // src/antlr3/Plumhead.g:79:5: SEA
            {
            SEA4=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_sea584); 
            list_SEA.add(SEA4);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 79:9: -> ^( ECHO NOQUOTE_STRING[$SEA] )
            {
                // src/antlr3/Plumhead.g:79:12: ^( ECHO NOQUOTE_STRING[$SEA] )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ECHO, "ECHO"), root_1);

                adaptor.addChild(root_1, adaptor.create(NOQUOTE_STRING, SEA4));

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
    // $ANTLR end sea

    public static class code_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start code
    // src/antlr3/Plumhead.g:82:1: code : CODE_START statements CODE_END -> statements ;
    public code_return code() throws RecognitionException {
        code_return retval = new code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token CODE_START5=null;
        Token CODE_END7=null;
        statements_return statements6 = null;

        List list_statements=new ArrayList();
        List list_CODE_START=new ArrayList();
        List list_CODE_END=new ArrayList();
        CommonTree CODE_START5_tree=null;
        CommonTree CODE_END7_tree=null;

        try {
            // src/antlr3/Plumhead.g:83:5: ( CODE_START statements CODE_END -> statements )
            // src/antlr3/Plumhead.g:83:5: CODE_START statements CODE_END
            {
            CODE_START5=(Token)input.LT(1);
            match(input,CODE_START,FOLLOW_CODE_START_in_code608); 
            list_CODE_START.add(CODE_START5);

            pushFollow(FOLLOW_statements_in_code610);
            statements6=statements();
            _fsp--;

            list_statements.add(statements6.getTree());
            CODE_END7=(Token)input.LT(1);
            match(input,CODE_END,FOLLOW_CODE_END_in_code612); 
            list_CODE_END.add(CODE_END7);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 83:36: -> statements
            {
                adaptor.addChild(root_0, list_statements.get(i_0));

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
    // $ANTLR end code

    public static class relational_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start relational_expression
    // src/antlr3/Plumhead.g:86:1: relational_expression : expression ( REL_OP^ expression )? ;
    public relational_expression_return relational_expression() throws RecognitionException {
        relational_expression_return retval = new relational_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token REL_OP9=null;
        expression_return expression8 = null;

        expression_return expression10 = null;


        CommonTree REL_OP9_tree=null;

        try {
            // src/antlr3/Plumhead.g:87:5: ( expression ( REL_OP^ expression )? )
            // src/antlr3/Plumhead.g:87:5: expression ( REL_OP^ expression )?
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_expression_in_relational_expression630);
            expression8=expression();
            _fsp--;

            adaptor.addChild(root_0, expression8.getTree());
            // src/antlr3/Plumhead.g:87:16: ( REL_OP^ expression )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0==REL_OP) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:87:18: REL_OP^ expression
                    {
                    REL_OP9=(Token)input.LT(1);
                    match(input,REL_OP,FOLLOW_REL_OP_in_relational_expression634); 
                    REL_OP9_tree = (CommonTree)adaptor.create(REL_OP9);
                    root_0 = (CommonTree)adaptor.becomeRoot(REL_OP9_tree, root_0);

                    pushFollow(FOLLOW_expression_in_relational_expression637);
                    expression10=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression10.getTree());

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

    public static class statements_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statements
    // src/antlr3/Plumhead.g:90:1: statements : ( statement )* ;
    public statements_return statements() throws RecognitionException {
        statements_return retval = new statements_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        statement_return statement11 = null;



        try {
            // src/antlr3/Plumhead.g:91:5: ( ( statement )* )
            // src/antlr3/Plumhead.g:91:5: ( statement )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:91:5: ( statement )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( (LA3_0==CODE_END) ) {
                    int LA3_1 = input.LA(2);
                    if ( (LA3_1==SEA) ) {
                        int LA3_4 = input.LA(3);
                        if ( (LA3_4==CODE_START) ) {
                            alt3=1;
                        }


                    }


                }
                else if ( (LA3_0==ECHO||LA3_0==SCALAR||LA3_0==IF) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:91:7: statement
            	    {
            	    pushFollow(FOLLOW_statement_in_statements655);
            	    statement11=statement();
            	    _fsp--;

            	    adaptor.addChild(root_0, statement11.getTree());

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
    // $ANTLR end statements

    public static class statement_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement
    // src/antlr3/Plumhead.g:94:1: statement : ( ECHO^ expression ';'! | IF '(' relational_expression ')' '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) | SCALAR ASSIGN_OP^ expression ';'! );
    public statement_return statement() throws RecognitionException {
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token ECHO12=null;
        Token char_literal14=null;
        Token IF15=null;
        Token char_literal16=null;
        Token char_literal18=null;
        Token char_literal19=null;
        Token char_literal20=null;
        Token ELSE21=null;
        Token char_literal22=null;
        Token char_literal23=null;
        Token CODE_END24=null;
        Token SEA25=null;
        Token CODE_START26=null;
        Token SCALAR27=null;
        Token ASSIGN_OP28=null;
        Token char_literal30=null;
        statements_return s1 = null;

        statements_return s2 = null;

        expression_return expression13 = null;

        relational_expression_return relational_expression17 = null;

        expression_return expression29 = null;

        List list_statements=new ArrayList();
        List list_relational_expression=new ArrayList();
        List list_28=new ArrayList();
        List list_CODE_START=new ArrayList();
        List list_29=new ArrayList();
        List list_30=new ArrayList();
        List list_ELSE=new ArrayList();
        List list_SEA=new ArrayList();
        List list_27=new ArrayList();
        List list_IF=new ArrayList();
        List list_CODE_END=new ArrayList();
        CommonTree ECHO12_tree=null;
        CommonTree char_literal14_tree=null;
        CommonTree IF15_tree=null;
        CommonTree char_literal16_tree=null;
        CommonTree char_literal18_tree=null;
        CommonTree char_literal19_tree=null;
        CommonTree char_literal20_tree=null;
        CommonTree ELSE21_tree=null;
        CommonTree char_literal22_tree=null;
        CommonTree char_literal23_tree=null;
        CommonTree CODE_END24_tree=null;
        CommonTree SEA25_tree=null;
        CommonTree CODE_START26_tree=null;
        CommonTree SCALAR27_tree=null;
        CommonTree ASSIGN_OP28_tree=null;
        CommonTree char_literal30_tree=null;

        try {
            // src/antlr3/Plumhead.g:95:5: ( ECHO^ expression ';'! | IF '(' relational_expression ')' '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) | SCALAR ASSIGN_OP^ expression ';'! )
            int alt5=4;
            switch ( input.LA(1) ) {
            case ECHO:
                alt5=1;
                break;
            case IF:
                alt5=2;
                break;
            case CODE_END:
                alt5=3;
                break;
            case SCALAR:
                alt5=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("94:1: statement : ( ECHO^ expression ';'! | IF '(' relational_expression ')' '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) | SCALAR ASSIGN_OP^ expression ';'! );", 5, 0, input);

                throw nvae;
            }

            switch (alt5) {
                case 1 :
                    // src/antlr3/Plumhead.g:95:5: ECHO^ expression ';'!
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    ECHO12=(Token)input.LT(1);
                    match(input,ECHO,FOLLOW_ECHO_in_statement671); 
                    ECHO12_tree = (CommonTree)adaptor.create(ECHO12);
                    root_0 = (CommonTree)adaptor.becomeRoot(ECHO12_tree, root_0);

                    pushFollow(FOLLOW_expression_in_statement674);
                    expression13=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression13.getTree());
                    char_literal14=(Token)input.LT(1);
                    match(input,26,FOLLOW_26_in_statement676); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:96:5: IF '(' relational_expression ')' '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )
                    {
                    IF15=(Token)input.LT(1);
                    match(input,IF,FOLLOW_IF_in_statement684); 
                    list_IF.add(IF15);

                    char_literal16=(Token)input.LT(1);
                    match(input,27,FOLLOW_27_in_statement686); 
                    list_27.add(char_literal16);

                    pushFollow(FOLLOW_relational_expression_in_statement688);
                    relational_expression17=relational_expression();
                    _fsp--;

                    list_relational_expression.add(relational_expression17.getTree());
                    char_literal18=(Token)input.LT(1);
                    match(input,28,FOLLOW_28_in_statement690); 
                    list_28.add(char_literal18);

                    char_literal19=(Token)input.LT(1);
                    match(input,29,FOLLOW_29_in_statement692); 
                    list_29.add(char_literal19);

                    pushFollow(FOLLOW_statements_in_statement696);
                    s1=statements();
                    _fsp--;

                    list_statements.add(s1.getTree());
                    char_literal20=(Token)input.LT(1);
                    match(input,30,FOLLOW_30_in_statement698); 
                    list_30.add(char_literal20);

                    // src/antlr3/Plumhead.g:97:5: ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )
                    int alt4=2;
                    int LA4_0 = input.LA(1);
                    if ( (LA4_0==ELSE) ) {
                        alt4=1;
                    }
                    else if ( (LA4_0==CODE_END||LA4_0==ECHO||LA4_0==SCALAR||LA4_0==IF||LA4_0==30) ) {
                        alt4=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("97:5: ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )", 4, 0, input);

                        throw nvae;
                    }
                    switch (alt4) {
                        case 1 :
                            // src/antlr3/Plumhead.g:97:7: ELSE '{' s2= statements '}'
                            {
                            ELSE21=(Token)input.LT(1);
                            match(input,ELSE,FOLLOW_ELSE_in_statement706); 
                            list_ELSE.add(ELSE21);

                            char_literal22=(Token)input.LT(1);
                            match(input,29,FOLLOW_29_in_statement708); 
                            list_29.add(char_literal22);

                            pushFollow(FOLLOW_statements_in_statement712);
                            s2=statements();
                            _fsp--;

                            list_statements.add(s2.getTree());
                            char_literal23=(Token)input.LT(1);
                            match(input,30,FOLLOW_30_in_statement714); 
                            list_30.add(char_literal23);


                            // AST REWRITE
                            int i_0 = 0;
                            retval.tree = root_0;
                            root_0 = (CommonTree)adaptor.nil();
                            // 97:34: -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) )
                            {
                                // src/antlr3/Plumhead.g:97:37: ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) )
                                {
                                CommonTree root_1 = (CommonTree)adaptor.nil();
                                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_IF.get(i_0), root_1);

                                adaptor.addChild(root_1, list_relational_expression.get(i_0));
                                // src/antlr3/Plumhead.g:97:65: ^( STMTS $s1)
                                {
                                CommonTree root_2 = (CommonTree)adaptor.nil();
                                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(STMTS, "STMTS"), root_2);

                                adaptor.addChild(root_2, s1.tree);

                                adaptor.addChild(root_1, root_2);
                                }
                                // src/antlr3/Plumhead.g:97:80: ^( STMTS $s2)
                                {
                                CommonTree root_2 = (CommonTree)adaptor.nil();
                                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(STMTS, "STMTS"), root_2);

                                adaptor.addChild(root_2, s2.tree);

                                adaptor.addChild(root_1, root_2);
                                }

                                adaptor.addChild(root_0, root_1);
                                }

                            }



                            }
                            break;
                        case 2 :
                            // src/antlr3/Plumhead.g:98:33: 
                            {

                            // AST REWRITE
                            int i_0 = 0;
                            retval.tree = root_0;
                            root_0 = (CommonTree)adaptor.nil();
                            // 98:33: -> ^( IF relational_expression ^( STMTS $s1) )
                            {
                                // src/antlr3/Plumhead.g:98:36: ^( IF relational_expression ^( STMTS $s1) )
                                {
                                CommonTree root_1 = (CommonTree)adaptor.nil();
                                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_IF.get(i_0), root_1);

                                adaptor.addChild(root_1, list_relational_expression.get(i_0));
                                // src/antlr3/Plumhead.g:98:64: ^( STMTS $s1)
                                {
                                CommonTree root_2 = (CommonTree)adaptor.nil();
                                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(STMTS, "STMTS"), root_2);

                                adaptor.addChild(root_2, s1.tree);

                                adaptor.addChild(root_1, root_2);
                                }

                                adaptor.addChild(root_0, root_1);
                                }

                            }



                            }
                            break;

                    }


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:100:5: CODE_END SEA CODE_START
                    {
                    CODE_END24=(Token)input.LT(1);
                    match(input,CODE_END,FOLLOW_CODE_END_in_statement806); 
                    list_CODE_END.add(CODE_END24);

                    SEA25=(Token)input.LT(1);
                    match(input,SEA,FOLLOW_SEA_in_statement808); 
                    list_SEA.add(SEA25);

                    CODE_START26=(Token)input.LT(1);
                    match(input,CODE_START,FOLLOW_CODE_START_in_statement810); 
                    list_CODE_START.add(CODE_START26);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 100:29: -> ^( ECHO NOQUOTE_STRING[$SEA] )
                    {
                        // src/antlr3/Plumhead.g:100:32: ^( ECHO NOQUOTE_STRING[$SEA] )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ECHO, "ECHO"), root_1);

                        adaptor.addChild(root_1, adaptor.create(NOQUOTE_STRING, SEA25));

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:101:5: SCALAR ASSIGN_OP^ expression ';'!
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    SCALAR27=(Token)input.LT(1);
                    match(input,SCALAR,FOLLOW_SCALAR_in_statement827); 
                    SCALAR27_tree = (CommonTree)adaptor.create(SCALAR27);
                    adaptor.addChild(root_0, SCALAR27_tree);

                    ASSIGN_OP28=(Token)input.LT(1);
                    match(input,ASSIGN_OP,FOLLOW_ASSIGN_OP_in_statement829); 
                    ASSIGN_OP28_tree = (CommonTree)adaptor.create(ASSIGN_OP28);
                    root_0 = (CommonTree)adaptor.becomeRoot(ASSIGN_OP28_tree, root_0);

                    pushFollow(FOLLOW_expression_in_statement832);
                    expression29=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression29.getTree());
                    char_literal30=(Token)input.LT(1);
                    match(input,26,FOLLOW_26_in_statement834); 

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
    // src/antlr3/Plumhead.g:104:1: expression : ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | adding_expression | SCALAR );
    public expression_return expression() throws RecognitionException {
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token DOUBLEQUOTE_STRING31=null;
        Token SINGLEQUOTE_STRING32=null;
        Token SCALAR34=null;
        adding_expression_return adding_expression33 = null;


        CommonTree DOUBLEQUOTE_STRING31_tree=null;
        CommonTree SINGLEQUOTE_STRING32_tree=null;
        CommonTree SCALAR34_tree=null;

        try {
            // src/antlr3/Plumhead.g:105:5: ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | adding_expression | SCALAR )
            int alt6=4;
            switch ( input.LA(1) ) {
            case DOUBLEQUOTE_STRING:
                alt6=1;
                break;
            case SINGLEQUOTE_STRING:
                alt6=2;
                break;
            case NUMBER:
            case MINUS:
            case 27:
                alt6=3;
                break;
            case SCALAR:
                alt6=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("104:1: expression : ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | adding_expression | SCALAR );", 6, 0, input);

                throw nvae;
            }

            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:105:5: DOUBLEQUOTE_STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    DOUBLEQUOTE_STRING31=(Token)input.LT(1);
                    match(input,DOUBLEQUOTE_STRING,FOLLOW_DOUBLEQUOTE_STRING_in_expression848); 
                    DOUBLEQUOTE_STRING31_tree = (CommonTree)adaptor.create(DOUBLEQUOTE_STRING31);
                    adaptor.addChild(root_0, DOUBLEQUOTE_STRING31_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:106:5: SINGLEQUOTE_STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    SINGLEQUOTE_STRING32=(Token)input.LT(1);
                    match(input,SINGLEQUOTE_STRING,FOLLOW_SINGLEQUOTE_STRING_in_expression854); 
                    SINGLEQUOTE_STRING32_tree = (CommonTree)adaptor.create(SINGLEQUOTE_STRING32);
                    adaptor.addChild(root_0, SINGLEQUOTE_STRING32_tree);


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:107:5: adding_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_adding_expression_in_expression860);
                    adding_expression33=adding_expression();
                    _fsp--;

                    adaptor.addChild(root_0, adding_expression33.getTree());

                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:108:5: SCALAR
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    SCALAR34=(Token)input.LT(1);
                    match(input,SCALAR,FOLLOW_SCALAR_in_expression866); 
                    SCALAR34_tree = (CommonTree)adaptor.create(SCALAR34);
                    adaptor.addChild(root_0, SCALAR34_tree);


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

    public static class adding_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start adding_expression
    // src/antlr3/Plumhead.g:111:1: adding_expression : multiplying_expression ( ( PLUS^ | MINUS^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS36=null;
        Token MINUS37=null;
        multiplying_expression_return multiplying_expression35 = null;

        multiplying_expression_return multiplying_expression38 = null;


        CommonTree PLUS36_tree=null;
        CommonTree MINUS37_tree=null;

        try {
            // src/antlr3/Plumhead.g:112:5: ( multiplying_expression ( ( PLUS^ | MINUS^ ) multiplying_expression )* )
            // src/antlr3/Plumhead.g:112:5: multiplying_expression ( ( PLUS^ | MINUS^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression879);
            multiplying_expression35=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression35.getTree());
            // src/antlr3/Plumhead.g:112:28: ( ( PLUS^ | MINUS^ ) multiplying_expression )*
            loop8:
            do {
                int alt8=2;
                int LA8_0 = input.LA(1);
                if ( ((LA8_0>=MINUS && LA8_0<=PLUS)) ) {
                    alt8=1;
                }


                switch (alt8) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:112:30: ( PLUS^ | MINUS^ ) multiplying_expression
            	    {
            	    // src/antlr3/Plumhead.g:112:30: ( PLUS^ | MINUS^ )
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
            	            new NoViableAltException("112:30: ( PLUS^ | MINUS^ )", 7, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt7) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:112:32: PLUS^
            	            {
            	            PLUS36=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression885); 
            	            PLUS36_tree = (CommonTree)adaptor.create(PLUS36);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS36_tree, root_0);


            	            }
            	            break;
            	        case 2 :
            	            // src/antlr3/Plumhead.g:112:40: MINUS^
            	            {
            	            MINUS37=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression890); 
            	            MINUS37_tree = (CommonTree)adaptor.create(MINUS37);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS37_tree, root_0);


            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression895);
            	    multiplying_expression38=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_0, multiplying_expression38.getTree());

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
    // src/antlr3/Plumhead.g:115:1: multiplying_expression : unary_expression ( MUL_OP^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP40=null;
        unary_expression_return unary_expression39 = null;

        unary_expression_return unary_expression41 = null;


        CommonTree MUL_OP40_tree=null;

        try {
            // src/antlr3/Plumhead.g:116:5: ( unary_expression ( MUL_OP^ unary_expression )* )
            // src/antlr3/Plumhead.g:116:5: unary_expression ( MUL_OP^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression912);
            unary_expression39=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression39.getTree());
            // src/antlr3/Plumhead.g:116:22: ( MUL_OP^ unary_expression )*
            loop9:
            do {
                int alt9=2;
                int LA9_0 = input.LA(1);
                if ( (LA9_0==MUL_OP) ) {
                    alt9=1;
                }


                switch (alt9) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:116:24: MUL_OP^ unary_expression
            	    {
            	    MUL_OP40=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression916); 
            	    MUL_OP40_tree = (CommonTree)adaptor.create(MUL_OP40);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP40_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression919);
            	    unary_expression41=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_0, unary_expression41.getTree());

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
    // src/antlr3/Plumhead.g:119:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) );
    public unary_expression_return unary_expression() throws RecognitionException {
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS43=null;
        postfix_expression_return postfix_expression42 = null;

        postfix_expression_return postfix_expression44 = null;

        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        CommonTree MINUS43_tree=null;

        try {
            // src/antlr3/Plumhead.g:120:5: ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) )
            int alt10=2;
            int LA10_0 = input.LA(1);
            if ( (LA10_0==NUMBER||LA10_0==27) ) {
                alt10=1;
            }
            else if ( (LA10_0==MINUS) ) {
                alt10=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("119:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) );", 10, 0, input);

                throw nvae;
            }
            switch (alt10) {
                case 1 :
                    // src/antlr3/Plumhead.g:120:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression935);
                    postfix_expression42=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression42.getTree());

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:121:5: MINUS postfix_expression
                    {
                    MINUS43=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression941); 
                    list_MINUS.add(MINUS43);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression943);
                    postfix_expression44=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression44.getTree());

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 121:30: -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression )
                    {
                        // src/antlr3/Plumhead.g:121:33: ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(MUL_OP, "n_mul"), root_1);

                        adaptor.addChild(root_1, adaptor.create(NUMBER, "-1"));
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
    // src/antlr3/Plumhead.g:124:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER45=null;
        Token char_literal46=null;
        Token char_literal48=null;
        expression_return expression47 = null;

        List list_expression=new ArrayList();
        List list_28=new ArrayList();
        List list_27=new ArrayList();
        CommonTree NUMBER45_tree=null;
        CommonTree char_literal46_tree=null;
        CommonTree char_literal48_tree=null;

        try {
            // src/antlr3/Plumhead.g:125:5: ( NUMBER | '(' expression ')' -> expression )
            int alt11=2;
            int LA11_0 = input.LA(1);
            if ( (LA11_0==NUMBER) ) {
                alt11=1;
            }
            else if ( (LA11_0==27) ) {
                alt11=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("124:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );", 11, 0, input);

                throw nvae;
            }
            switch (alt11) {
                case 1 :
                    // src/antlr3/Plumhead.g:125:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER45=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression970); 
                    NUMBER45_tree = (CommonTree)adaptor.create(NUMBER45);
                    adaptor.addChild(root_0, NUMBER45_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:126:5: '(' expression ')'
                    {
                    char_literal46=(Token)input.LT(1);
                    match(input,27,FOLLOW_27_in_postfix_expression976); 
                    list_27.add(char_literal46);

                    pushFollow(FOLLOW_expression_in_postfix_expression978);
                    expression47=expression();
                    _fsp--;

                    list_expression.add(expression47.getTree());
                    char_literal48=(Token)input.LT(1);
                    match(input,28,FOLLOW_28_in_postfix_expression980); 
                    list_28.add(char_literal48);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 126:24: -> expression
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


 

    public static final BitSet FOLLOW_sea_or_code_in_program538 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_sea_in_sea_or_code563 = new BitSet(new long[]{0x0000000000000182L});
    public static final BitSet FOLLOW_code_in_sea_or_code567 = new BitSet(new long[]{0x0000000000000182L});
    public static final BitSet FOLLOW_SEA_in_sea584 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_START_in_code608 = new BitSet(new long[]{0x000000000100A200L});
    public static final BitSet FOLLOW_statements_in_code610 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_CODE_END_in_code612 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_relational_expression630 = new BitSet(new long[]{0x0000000000800002L});
    public static final BitSet FOLLOW_REL_OP_in_relational_expression634 = new BitSet(new long[]{0x00000000080C9800L});
    public static final BitSet FOLLOW_expression_in_relational_expression637 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements655 = new BitSet(new long[]{0x000000000100A202L});
    public static final BitSet FOLLOW_ECHO_in_statement671 = new BitSet(new long[]{0x00000000080C9800L});
    public static final BitSet FOLLOW_expression_in_statement674 = new BitSet(new long[]{0x0000000004000000L});
    public static final BitSet FOLLOW_26_in_statement676 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IF_in_statement684 = new BitSet(new long[]{0x0000000008000000L});
    public static final BitSet FOLLOW_27_in_statement686 = new BitSet(new long[]{0x00000000080C9800L});
    public static final BitSet FOLLOW_relational_expression_in_statement688 = new BitSet(new long[]{0x0000000010000000L});
    public static final BitSet FOLLOW_28_in_statement690 = new BitSet(new long[]{0x0000000020000000L});
    public static final BitSet FOLLOW_29_in_statement692 = new BitSet(new long[]{0x000000004100A200L});
    public static final BitSet FOLLOW_statements_in_statement696 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_30_in_statement698 = new BitSet(new long[]{0x0000000002000002L});
    public static final BitSet FOLLOW_ELSE_in_statement706 = new BitSet(new long[]{0x0000000020000000L});
    public static final BitSet FOLLOW_29_in_statement708 = new BitSet(new long[]{0x000000004100A200L});
    public static final BitSet FOLLOW_statements_in_statement712 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_30_in_statement714 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_END_in_statement806 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_SEA_in_statement808 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_CODE_START_in_statement810 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SCALAR_in_statement827 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_ASSIGN_OP_in_statement829 = new BitSet(new long[]{0x00000000080C9800L});
    public static final BitSet FOLLOW_expression_in_statement832 = new BitSet(new long[]{0x0000000004000000L});
    public static final BitSet FOLLOW_26_in_statement834 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DOUBLEQUOTE_STRING_in_expression848 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SINGLEQUOTE_STRING_in_expression854 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression860 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SCALAR_in_expression866 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression879 = new BitSet(new long[]{0x0000000000180002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression885 = new BitSet(new long[]{0x00000000080C0000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression890 = new BitSet(new long[]{0x00000000080C0000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression895 = new BitSet(new long[]{0x0000000000180002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression912 = new BitSet(new long[]{0x0000000000200002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression916 = new BitSet(new long[]{0x00000000080C0000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression919 = new BitSet(new long[]{0x0000000000200002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression935 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression941 = new BitSet(new long[]{0x0000000008040000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression943 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression970 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_27_in_postfix_expression976 = new BitSet(new long[]{0x00000000080C9800L});
    public static final BitSet FOLLOW_expression_in_postfix_expression978 = new BitSet(new long[]{0x0000000010000000L});
    public static final BitSet FOLLOW_28_in_postfix_expression980 = new BitSet(new long[]{0x0000000000000002L});

}