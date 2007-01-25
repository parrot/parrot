// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-25 22:04:03

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "NOQUOTE_STRING", "STMTS", "SEA", "CODE_START", "CODE_END", "WS", "DOUBLEQUOTE_STRING", "SINGLEQUOTE_STRING", "ECHO", "INTEGER", "NUMBER", "MINUS", "PLUS", "MUL_OP", "REL_OP", "IF", "';'", "'('", "')'", "'{'", "'}'", "'else'"
    };
    public static final int CODE_START=8;
    public static final int MINUS=16;
    public static final int WS=10;
    public static final int NUMBER=15;
    public static final int SINGLEQUOTE_STRING=12;
    public static final int MUL_OP=18;
    public static final int SEA=7;
    public static final int CODE_END=9;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int INTEGER=14;
    public static final int DOUBLEQUOTE_STRING=11;
    public static final int ECHO=13;
    public static final int IF=20;
    public static final int EOF=-1;
    public static final int REL_OP=19;
    public static final int PLUS=17;
    public static final int NOQUOTE_STRING=5;

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
    // src/antlr3/Plumhead.g:61:1: program : sea_or_code -> ^( PROGRAM sea_or_code ) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_or_code_return sea_or_code1 = null;

        List list_sea_or_code=new ArrayList();

        try {
            // src/antlr3/Plumhead.g:62:5: ( sea_or_code -> ^( PROGRAM sea_or_code ) )
            // src/antlr3/Plumhead.g:62:5: sea_or_code
            {
            pushFollow(FOLLOW_sea_or_code_in_program437);
            sea_or_code1=sea_or_code();
            _fsp--;

            list_sea_or_code.add(sea_or_code1.tree);

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 62:17: -> ^( PROGRAM sea_or_code )
            {
                // src/antlr3/Plumhead.g:62:20: ^( PROGRAM sea_or_code )
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
    // src/antlr3/Plumhead.g:65:1: sea_or_code : ( sea | code )+ ;
    public sea_or_code_return sea_or_code() throws RecognitionException {   
        sea_or_code_return retval = new sea_or_code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_return sea2 = null;

        code_return code3 = null;



        try {
            // src/antlr3/Plumhead.g:66:5: ( ( sea | code )+ )
            // src/antlr3/Plumhead.g:66:5: ( sea | code )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:66:5: ( sea | code )+
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
            	    // src/antlr3/Plumhead.g:66:7: sea
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_sea_in_sea_or_code462);
            	    sea2=sea();
            	    _fsp--;

            	    adaptor.addChild(root_1, sea2.tree);

            	    adaptor.addChild(root_0, root_1);

            	    }
            	    break;
            	case 2 :
            	    // src/antlr3/Plumhead.g:66:13: code
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_code_in_sea_or_code466);
            	    code3=code();
            	    _fsp--;

            	    adaptor.addChild(root_1, code3.tree);

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
    // $ANTLR end sea_or_code

    public static class sea_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start sea
    // src/antlr3/Plumhead.g:69:1: sea : SEA -> ^( ECHO NOQUOTE_STRING[$SEA] ) ;
    public sea_return sea() throws RecognitionException {   
        sea_return retval = new sea_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA4=null;
        List list_SEA=new ArrayList();
        CommonTree SEA4_tree=null;

        try {
            // src/antlr3/Plumhead.g:70:5: ( SEA -> ^( ECHO NOQUOTE_STRING[$SEA] ) )
            // src/antlr3/Plumhead.g:70:5: SEA
            {
            SEA4=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_sea483); 
            list_SEA.add(SEA4);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 70:9: -> ^( ECHO NOQUOTE_STRING[$SEA] )
            {
                // src/antlr3/Plumhead.g:70:12: ^( ECHO NOQUOTE_STRING[$SEA] )
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
    // src/antlr3/Plumhead.g:73:1: code : CODE_START statements CODE_END -> statements ;
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
            // src/antlr3/Plumhead.g:74:5: ( CODE_START statements CODE_END -> statements )
            // src/antlr3/Plumhead.g:74:5: CODE_START statements CODE_END
            {
            CODE_START5=(Token)input.LT(1);
            match(input,CODE_START,FOLLOW_CODE_START_in_code507); 
            list_CODE_START.add(CODE_START5);

            pushFollow(FOLLOW_statements_in_code509);
            statements6=statements();
            _fsp--;

            list_statements.add(statements6.tree);
            CODE_END7=(Token)input.LT(1);
            match(input,CODE_END,FOLLOW_CODE_END_in_code511); 
            list_CODE_END.add(CODE_END7);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 74:36: -> statements
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
    // src/antlr3/Plumhead.g:77:1: relational_expression : expression ( REL_OP^^ expression )? ;
    public relational_expression_return relational_expression() throws RecognitionException {   
        relational_expression_return retval = new relational_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token REL_OP9=null;
        expression_return expression8 = null;

        expression_return expression10 = null;


        CommonTree REL_OP9_tree=null;

        try {
            // src/antlr3/Plumhead.g:78:5: ( expression ( REL_OP^^ expression )? )
            // src/antlr3/Plumhead.g:78:5: expression ( REL_OP^^ expression )?
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_expression_in_relational_expression529);
            expression8=expression();
            _fsp--;

            adaptor.addChild(root_0, expression8.tree);
            // src/antlr3/Plumhead.g:78:16: ( REL_OP^^ expression )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0==REL_OP) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:78:18: REL_OP^^ expression
                    {
                    CommonTree root_1 = (CommonTree)adaptor.nil();

                    REL_OP9=(Token)input.LT(1);
                    match(input,REL_OP,FOLLOW_REL_OP_in_relational_expression533); 
                    REL_OP9_tree = (CommonTree)adaptor.create(REL_OP9);
                    root_0 = (CommonTree)adaptor.becomeRoot(REL_OP9_tree, root_0);

                    pushFollow(FOLLOW_expression_in_relational_expression536);
                    expression10=expression();
                    _fsp--;

                    adaptor.addChild(root_1, expression10.tree);

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

    public static class statements_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statements
    // src/antlr3/Plumhead.g:81:1: statements : ( statement )* ;
    public statements_return statements() throws RecognitionException {   
        statements_return retval = new statements_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        statement_return statement11 = null;



        try {
            // src/antlr3/Plumhead.g:82:5: ( ( statement )* )
            // src/antlr3/Plumhead.g:82:5: ( statement )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:82:5: ( statement )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);
                if ( (LA3_0==CODE_END) ) {
                    int LA3_1 = input.LA(2);
                    if ( (LA3_1==SEA) ) {
                        int LA3_3 = input.LA(3);
                        if ( (LA3_3==CODE_START) ) {
                            alt3=1;
                        }


                    }


                }
                else if ( (LA3_0==ECHO||LA3_0==IF) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:82:7: statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_statement_in_statements554);
            	    statement11=statement();
            	    _fsp--;

            	    adaptor.addChild(root_1, statement11.tree);

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
    // $ANTLR end statements

    public static class statement_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement
    // src/antlr3/Plumhead.g:85:1: statement : ( ECHO^^ expression ';'! | IF '(' relational_expression ')' '{' s1= statement '}' ( 'else' '{' s2= statement '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) );
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
        Token string_literal21=null;
        Token char_literal22=null;
        Token char_literal23=null;
        Token CODE_END24=null;
        Token SEA25=null;
        Token CODE_START26=null;
        statement_return s1 = null;

        statement_return s2 = null;

        expression_return expression13 = null;

        relational_expression_return relational_expression17 = null;

        List list_statement=new ArrayList();
        List list_relational_expression=new ArrayList();
        List list_CODE_START=new ArrayList();
        List list_24=new ArrayList();
        List list_SEA=new ArrayList();
        List list_26=new ArrayList();
        List list_22=new ArrayList();
        List list_IF=new ArrayList();
        List list_23=new ArrayList();
        List list_CODE_END=new ArrayList();
        List list_25=new ArrayList();
        CommonTree ECHO12_tree=null;
        CommonTree char_literal14_tree=null;
        CommonTree IF15_tree=null;
        CommonTree char_literal16_tree=null;
        CommonTree char_literal18_tree=null;
        CommonTree char_literal19_tree=null;
        CommonTree char_literal20_tree=null;
        CommonTree string_literal21_tree=null;
        CommonTree char_literal22_tree=null;
        CommonTree char_literal23_tree=null;
        CommonTree CODE_END24_tree=null;
        CommonTree SEA25_tree=null;
        CommonTree CODE_START26_tree=null;

        try {
            // src/antlr3/Plumhead.g:86:5: ( ECHO^^ expression ';'! | IF '(' relational_expression ')' '{' s1= statement '}' ( 'else' '{' s2= statement '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) )
            int alt5=3;
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
            default:
                NoViableAltException nvae =
                    new NoViableAltException("85:1: statement : ( ECHO^^ expression ';'! | IF '(' relational_expression ')' '{' s1= statement '}' ( 'else' '{' s2= statement '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) );", 5, 0, input);

                throw nvae;
            }

            switch (alt5) {
                case 1 :
                    // src/antlr3/Plumhead.g:86:5: ECHO^^ expression ';'!
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    ECHO12=(Token)input.LT(1);
                    match(input,ECHO,FOLLOW_ECHO_in_statement570); 
                    ECHO12_tree = (CommonTree)adaptor.create(ECHO12);
                    root_0 = (CommonTree)adaptor.becomeRoot(ECHO12_tree, root_0);

                    pushFollow(FOLLOW_expression_in_statement573);
                    expression13=expression();
                    _fsp--;

                    adaptor.addChild(root_0, expression13.tree);
                    char_literal14=(Token)input.LT(1);
                    match(input,21,FOLLOW_21_in_statement575); 

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:87:5: IF '(' relational_expression ')' '{' s1= statement '}' ( 'else' '{' s2= statement '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )
                    {
                    IF15=(Token)input.LT(1);
                    match(input,IF,FOLLOW_IF_in_statement583); 
                    list_IF.add(IF15);

                    char_literal16=(Token)input.LT(1);
                    match(input,22,FOLLOW_22_in_statement585); 
                    list_22.add(char_literal16);

                    pushFollow(FOLLOW_relational_expression_in_statement587);
                    relational_expression17=relational_expression();
                    _fsp--;

                    list_relational_expression.add(relational_expression17.tree);
                    char_literal18=(Token)input.LT(1);
                    match(input,23,FOLLOW_23_in_statement589); 
                    list_23.add(char_literal18);

                    char_literal19=(Token)input.LT(1);
                    match(input,24,FOLLOW_24_in_statement591); 
                    list_24.add(char_literal19);

                    pushFollow(FOLLOW_statement_in_statement595);
                    s1=statement();
                    _fsp--;

                    list_statement.add(s1.tree);
                    char_literal20=(Token)input.LT(1);
                    match(input,25,FOLLOW_25_in_statement597); 
                    list_25.add(char_literal20);

                    // src/antlr3/Plumhead.g:88:5: ( 'else' '{' s2= statement '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )
                    int alt4=2;
                    int LA4_0 = input.LA(1);
                    if ( (LA4_0==26) ) {
                        alt4=1;
                    }
                    else if ( (LA4_0==CODE_END||LA4_0==ECHO||LA4_0==IF||LA4_0==25) ) {
                        alt4=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("88:5: ( 'else' '{' s2= statement '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )", 4, 0, input);

                        throw nvae;
                    }
                    switch (alt4) {
                        case 1 :
                            // src/antlr3/Plumhead.g:88:7: 'else' '{' s2= statement '}'
                            {
                            string_literal21=(Token)input.LT(1);
                            match(input,26,FOLLOW_26_in_statement605); 
                            list_26.add(string_literal21);

                            char_literal22=(Token)input.LT(1);
                            match(input,24,FOLLOW_24_in_statement607); 
                            list_24.add(char_literal22);

                            pushFollow(FOLLOW_statement_in_statement611);
                            s2=statement();
                            _fsp--;

                            list_statement.add(s2.tree);
                            char_literal23=(Token)input.LT(1);
                            match(input,25,FOLLOW_25_in_statement613); 
                            list_25.add(char_literal23);


                            // AST REWRITE
                            int i_0 = 0;
                            retval.tree = root_0;
                            root_0 = (CommonTree)adaptor.nil();
                            // 88:35: -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) )
                            {
                                // src/antlr3/Plumhead.g:88:38: ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) )
                                {
                                CommonTree root_1 = (CommonTree)adaptor.nil();
                                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_IF.get(i_0), root_1);

                                adaptor.addChild(root_1, list_relational_expression.get(i_0));
                                // src/antlr3/Plumhead.g:88:66: ^( STMTS $s1)
                                {
                                CommonTree root_2 = (CommonTree)adaptor.nil();
                                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(STMTS, "STMTS"), root_2);

                                adaptor.addChild(root_2, s1.tree);

                                adaptor.addChild(root_1, root_2);
                                }
                                // src/antlr3/Plumhead.g:88:81: ^( STMTS $s2)
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
                            // src/antlr3/Plumhead.g:89:35: 
                            {

                            // AST REWRITE
                            int i_0 = 0;
                            retval.tree = root_0;
                            root_0 = (CommonTree)adaptor.nil();
                            // 89:35: -> ^( IF relational_expression ^( STMTS $s1) )
                            {
                                // src/antlr3/Plumhead.g:89:38: ^( IF relational_expression ^( STMTS $s1) )
                                {
                                CommonTree root_1 = (CommonTree)adaptor.nil();
                                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_IF.get(i_0), root_1);

                                adaptor.addChild(root_1, list_relational_expression.get(i_0));
                                // src/antlr3/Plumhead.g:89:66: ^( STMTS $s1)
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
                    // src/antlr3/Plumhead.g:91:5: CODE_END SEA CODE_START
                    {
                    CODE_END24=(Token)input.LT(1);
                    match(input,CODE_END,FOLLOW_CODE_END_in_statement707); 
                    list_CODE_END.add(CODE_END24);

                    SEA25=(Token)input.LT(1);
                    match(input,SEA,FOLLOW_SEA_in_statement709); 
                    list_SEA.add(SEA25);

                    CODE_START26=(Token)input.LT(1);
                    match(input,CODE_START,FOLLOW_CODE_START_in_statement711); 
                    list_CODE_START.add(CODE_START26);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 91:29: -> ^( ECHO NOQUOTE_STRING[$SEA] )
                    {
                        // src/antlr3/Plumhead.g:91:32: ^( ECHO NOQUOTE_STRING[$SEA] )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ECHO, "ECHO"), root_1);

                        adaptor.addChild(root_1, adaptor.create(NOQUOTE_STRING, SEA25));

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
    // src/antlr3/Plumhead.g:94:1: expression : ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | adding_expression );
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token DOUBLEQUOTE_STRING27=null;
        Token SINGLEQUOTE_STRING28=null;
        adding_expression_return adding_expression29 = null;


        CommonTree DOUBLEQUOTE_STRING27_tree=null;
        CommonTree SINGLEQUOTE_STRING28_tree=null;

        try {
            // src/antlr3/Plumhead.g:95:5: ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | adding_expression )
            int alt6=3;
            switch ( input.LA(1) ) {
            case DOUBLEQUOTE_STRING:
                alt6=1;
                break;
            case SINGLEQUOTE_STRING:
                alt6=2;
                break;
            case NUMBER:
            case MINUS:
            case 22:
                alt6=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("94:1: expression : ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | adding_expression );", 6, 0, input);

                throw nvae;
            }

            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:95:5: DOUBLEQUOTE_STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    DOUBLEQUOTE_STRING27=(Token)input.LT(1);
                    match(input,DOUBLEQUOTE_STRING,FOLLOW_DOUBLEQUOTE_STRING_in_expression735); 
                    DOUBLEQUOTE_STRING27_tree = (CommonTree)adaptor.create(DOUBLEQUOTE_STRING27);
                    adaptor.addChild(root_0, DOUBLEQUOTE_STRING27_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:96:5: SINGLEQUOTE_STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    SINGLEQUOTE_STRING28=(Token)input.LT(1);
                    match(input,SINGLEQUOTE_STRING,FOLLOW_SINGLEQUOTE_STRING_in_expression741); 
                    SINGLEQUOTE_STRING28_tree = (CommonTree)adaptor.create(SINGLEQUOTE_STRING28);
                    adaptor.addChild(root_0, SINGLEQUOTE_STRING28_tree);


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:97:5: adding_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_adding_expression_in_expression747);
                    adding_expression29=adding_expression();
                    _fsp--;

                    adaptor.addChild(root_0, adding_expression29.tree);

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
    // src/antlr3/Plumhead.g:100:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS31=null;
        Token MINUS32=null;
        multiplying_expression_return multiplying_expression30 = null;

        multiplying_expression_return multiplying_expression33 = null;


        CommonTree PLUS31_tree=null;
        CommonTree MINUS32_tree=null;

        try {
            // src/antlr3/Plumhead.g:101:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // src/antlr3/Plumhead.g:101:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression760);
            multiplying_expression30=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression30.tree);
            // src/antlr3/Plumhead.g:101:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop8:
            do {
                int alt8=2;
                int LA8_0 = input.LA(1);
                if ( ((LA8_0>=MINUS && LA8_0<=PLUS)) ) {
                    alt8=1;
                }


                switch (alt8) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:101:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // src/antlr3/Plumhead.g:101:30: ( PLUS^^ | MINUS^^ )
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
            	            new NoViableAltException("101:30: ( PLUS^^ | MINUS^^ )", 7, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt7) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:101:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS31=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression766); 
            	            PLUS31_tree = (CommonTree)adaptor.create(PLUS31);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS31_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // src/antlr3/Plumhead.g:101:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS32=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression771); 
            	            MINUS32_tree = (CommonTree)adaptor.create(MINUS32);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS32_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression776);
            	    multiplying_expression33=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression33.tree);

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
    // src/antlr3/Plumhead.g:104:1: multiplying_expression : unary_expression ( MUL_OP^^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP35=null;
        unary_expression_return unary_expression34 = null;

        unary_expression_return unary_expression36 = null;


        CommonTree MUL_OP35_tree=null;

        try {
            // src/antlr3/Plumhead.g:105:5: ( unary_expression ( MUL_OP^^ unary_expression )* )
            // src/antlr3/Plumhead.g:105:5: unary_expression ( MUL_OP^^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression793);
            unary_expression34=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression34.tree);
            // src/antlr3/Plumhead.g:105:22: ( MUL_OP^^ unary_expression )*
            loop9:
            do {
                int alt9=2;
                int LA9_0 = input.LA(1);
                if ( (LA9_0==MUL_OP) ) {
                    alt9=1;
                }


                switch (alt9) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:105:24: MUL_OP^^ unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    MUL_OP35=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression797); 
            	    MUL_OP35_tree = (CommonTree)adaptor.create(MUL_OP35);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP35_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression800);
            	    unary_expression36=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression36.tree);

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
    // src/antlr3/Plumhead.g:108:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP["n_mul"] NUMBER["-1"] postfix_expression ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS38=null;
        postfix_expression_return postfix_expression37 = null;

        postfix_expression_return postfix_expression39 = null;

        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        CommonTree MINUS38_tree=null;

        try {
            // src/antlr3/Plumhead.g:109:5: ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) )
            int alt10=2;
            int LA10_0 = input.LA(1);
            if ( (LA10_0==NUMBER||LA10_0==22) ) {
                alt10=1;
            }
            else if ( (LA10_0==MINUS) ) {
                alt10=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("108:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) );", 10, 0, input);

                throw nvae;
            }
            switch (alt10) {
                case 1 :
                    // src/antlr3/Plumhead.g:109:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression816);
                    postfix_expression37=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression37.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:110:5: MINUS postfix_expression
                    {
                    MINUS38=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression822); 
                    list_MINUS.add(MINUS38);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression824);
                    postfix_expression39=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression39.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 110:30: -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression )
                    {
                        // src/antlr3/Plumhead.g:110:33: ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression )
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
    // src/antlr3/Plumhead.g:113:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER40=null;
        Token char_literal41=null;
        Token char_literal43=null;
        expression_return expression42 = null;

        List list_expression=new ArrayList();
        List list_22=new ArrayList();
        List list_23=new ArrayList();
        CommonTree NUMBER40_tree=null;
        CommonTree char_literal41_tree=null;
        CommonTree char_literal43_tree=null;

        try {
            // src/antlr3/Plumhead.g:114:5: ( NUMBER | '(' expression ')' -> expression )
            int alt11=2;
            int LA11_0 = input.LA(1);
            if ( (LA11_0==NUMBER) ) {
                alt11=1;
            }
            else if ( (LA11_0==22) ) {
                alt11=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("113:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );", 11, 0, input);

                throw nvae;
            }
            switch (alt11) {
                case 1 :
                    // src/antlr3/Plumhead.g:114:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER40=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression851); 
                    NUMBER40_tree = (CommonTree)adaptor.create(NUMBER40);
                    adaptor.addChild(root_0, NUMBER40_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:115:5: '(' expression ')'
                    {
                    char_literal41=(Token)input.LT(1);
                    match(input,22,FOLLOW_22_in_postfix_expression857); 
                    list_22.add(char_literal41);

                    pushFollow(FOLLOW_expression_in_postfix_expression859);
                    expression42=expression();
                    _fsp--;

                    list_expression.add(expression42.tree);
                    char_literal43=(Token)input.LT(1);
                    match(input,23,FOLLOW_23_in_postfix_expression861); 
                    list_23.add(char_literal43);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 115:24: -> expression
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


 

    public static final BitSet FOLLOW_sea_or_code_in_program437 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_sea_in_sea_or_code462 = new BitSet(new long[]{0x0000000000000182L});
    public static final BitSet FOLLOW_code_in_sea_or_code466 = new BitSet(new long[]{0x0000000000000182L});
    public static final BitSet FOLLOW_SEA_in_sea483 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_START_in_code507 = new BitSet(new long[]{0x0000000000102200L});
    public static final BitSet FOLLOW_statements_in_code509 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_CODE_END_in_code511 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_relational_expression529 = new BitSet(new long[]{0x0000000000080002L});
    public static final BitSet FOLLOW_REL_OP_in_relational_expression533 = new BitSet(new long[]{0x0000000000419800L});
    public static final BitSet FOLLOW_expression_in_relational_expression536 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements554 = new BitSet(new long[]{0x0000000000102202L});
    public static final BitSet FOLLOW_ECHO_in_statement570 = new BitSet(new long[]{0x0000000000419800L});
    public static final BitSet FOLLOW_expression_in_statement573 = new BitSet(new long[]{0x0000000000200000L});
    public static final BitSet FOLLOW_21_in_statement575 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IF_in_statement583 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_22_in_statement585 = new BitSet(new long[]{0x0000000000419800L});
    public static final BitSet FOLLOW_relational_expression_in_statement587 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_statement589 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_24_in_statement591 = new BitSet(new long[]{0x0000000000102200L});
    public static final BitSet FOLLOW_statement_in_statement595 = new BitSet(new long[]{0x0000000002000000L});
    public static final BitSet FOLLOW_25_in_statement597 = new BitSet(new long[]{0x0000000004000002L});
    public static final BitSet FOLLOW_26_in_statement605 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_24_in_statement607 = new BitSet(new long[]{0x0000000000102200L});
    public static final BitSet FOLLOW_statement_in_statement611 = new BitSet(new long[]{0x0000000002000000L});
    public static final BitSet FOLLOW_25_in_statement613 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_END_in_statement707 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_SEA_in_statement709 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_CODE_START_in_statement711 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DOUBLEQUOTE_STRING_in_expression735 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SINGLEQUOTE_STRING_in_expression741 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression747 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression760 = new BitSet(new long[]{0x0000000000030002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression766 = new BitSet(new long[]{0x0000000000418000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression771 = new BitSet(new long[]{0x0000000000418000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression776 = new BitSet(new long[]{0x0000000000030002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression793 = new BitSet(new long[]{0x0000000000040002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression797 = new BitSet(new long[]{0x0000000000418000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression800 = new BitSet(new long[]{0x0000000000040002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression816 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression822 = new BitSet(new long[]{0x0000000000408000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression824 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression851 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_postfix_expression857 = new BitSet(new long[]{0x0000000000419800L});
    public static final BitSet FOLLOW_expression_in_postfix_expression859 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_postfix_expression861 = new BitSet(new long[]{0x0000000000000002L});

}