// $ANTLR 3.0b6 src/antlr3/Plumhead.g 2007-03-02 12:05:45

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "NOQUOTE_STRING", "STMTS", "SCALAR", "ARRAY", "FUNCTION", "PREFIX", "SEA", "CODE_START", "CODE_END", "WS", "DOUBLEQUOTE_STRING", "SINGLEQUOTE_STRING", "ECHO", "VAR_DUMP", "PAREN_OPEN", "PAREN_CLOSE", "IDENT", "VAR_IDENT", "DIGITS", "INTEGER", "NUMBER", "MINUS", "PLUS", "MUL_OP", "BITWISE_OP", "ASSIGN_OP", "REL_OP", "IF", "ELSE", "';'", "'{'", "'}'", "'['", "']'"
    };
    public static final int CODE_START=12;
    public static final int MINUS=26;
    public static final int DIGITS=23;
    public static final int IDENT=21;
    public static final int ARRAY=8;
    public static final int BITWISE_OP=29;
    public static final int NUMBER=25;
    public static final int WS=14;
    public static final int SINGLEQUOTE_STRING=16;
    public static final int MUL_OP=28;
    public static final int SEA=11;
    public static final int CODE_END=13;
    public static final int STMTS=6;
    public static final int PROGRAM=4;
    public static final int PREFIX=10;
    public static final int PAREN_OPEN=19;
    public static final int ASSIGN_OP=30;
    public static final int INTEGER=24;
    public static final int DOUBLEQUOTE_STRING=15;
    public static final int PAREN_CLOSE=20;
    public static final int ECHO=17;
    public static final int ELSE=33;
    public static final int FUNCTION=9;
    public static final int IF=32;
    public static final int EOF=-1;
    public static final int VAR_DUMP=18;
    public static final int REL_OP=31;
    public static final int PLUS=27;
    public static final int NOQUOTE_STRING=5;
    public static final int VAR_IDENT=22;
    public static final int SCALAR=7;

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
    // src/antlr3/Plumhead.g:65:1: program : sea_or_code -> ^( PROGRAM sea_or_code ) ;
    public program_return program() throws RecognitionException {
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_or_code_return sea_or_code1 = null;

        List list_sea_or_code=new ArrayList();

        try {
            // src/antlr3/Plumhead.g:66:5: ( sea_or_code -> ^( PROGRAM sea_or_code ) )
            // src/antlr3/Plumhead.g:66:5: sea_or_code
            {
            pushFollow(FOLLOW_sea_or_code_in_program827);
            sea_or_code1=sea_or_code();
            _fsp--;

            list_sea_or_code.add(sea_or_code1.getTree());

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 66:17: -> ^( PROGRAM sea_or_code )
            {
                // src/antlr3/Plumhead.g:66:20: ^( PROGRAM sea_or_code )
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
    // src/antlr3/Plumhead.g:69:1: sea_or_code : ( sea | code )+ ;
    public sea_or_code_return sea_or_code() throws RecognitionException {
        sea_or_code_return retval = new sea_or_code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_return sea2 = null;

        code_return code3 = null;



        try {
            // src/antlr3/Plumhead.g:70:5: ( ( sea | code )+ )
            // src/antlr3/Plumhead.g:70:5: ( sea | code )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:70:5: ( sea | code )+
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
            	    // src/antlr3/Plumhead.g:70:7: sea
            	    {
            	    pushFollow(FOLLOW_sea_in_sea_or_code852);
            	    sea2=sea();
            	    _fsp--;

            	    adaptor.addChild(root_0, sea2.getTree());

            	    }
            	    break;
            	case 2 :
            	    // src/antlr3/Plumhead.g:70:13: code
            	    {
            	    pushFollow(FOLLOW_code_in_sea_or_code856);
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
    // src/antlr3/Plumhead.g:73:1: sea : SEA -> ^( ECHO NOQUOTE_STRING[$SEA] ) ;
    public sea_return sea() throws RecognitionException {
        sea_return retval = new sea_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA4=null;
        List list_SEA=new ArrayList();
        CommonTree SEA4_tree=null;

        try {
            // src/antlr3/Plumhead.g:74:5: ( SEA -> ^( ECHO NOQUOTE_STRING[$SEA] ) )
            // src/antlr3/Plumhead.g:74:5: SEA
            {
            SEA4=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_sea873); 
            list_SEA.add(SEA4);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 74:9: -> ^( ECHO NOQUOTE_STRING[$SEA] )
            {
                // src/antlr3/Plumhead.g:74:12: ^( ECHO NOQUOTE_STRING[$SEA] )
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
    // src/antlr3/Plumhead.g:77:1: code : CODE_START statements ( CODE_END )? -> statements ;
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
            // src/antlr3/Plumhead.g:78:5: ( CODE_START statements ( CODE_END )? -> statements )
            // src/antlr3/Plumhead.g:78:5: CODE_START statements ( CODE_END )?
            {
            CODE_START5=(Token)input.LT(1);
            match(input,CODE_START,FOLLOW_CODE_START_in_code897); 
            list_CODE_START.add(CODE_START5);

            pushFollow(FOLLOW_statements_in_code899);
            statements6=statements();
            _fsp--;

            list_statements.add(statements6.getTree());
            // src/antlr3/Plumhead.g:78:27: ( CODE_END )?
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0==CODE_END) ) {
                alt2=1;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:78:27: CODE_END
                    {
                    CODE_END7=(Token)input.LT(1);
                    match(input,CODE_END,FOLLOW_CODE_END_in_code901); 
                    list_CODE_END.add(CODE_END7);


                    }
                    break;

            }


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 78:37: -> statements
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
    // src/antlr3/Plumhead.g:81:1: relational_expression : expression ( REL_OP^ expression )? ;
    public relational_expression_return relational_expression() throws RecognitionException {
        relational_expression_return retval = new relational_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token REL_OP9=null;
        expression_return expression8 = null;

        expression_return expression10 = null;


        CommonTree REL_OP9_tree=null;

        try {
            // src/antlr3/Plumhead.g:82:5: ( expression ( REL_OP^ expression )? )
            // src/antlr3/Plumhead.g:82:5: expression ( REL_OP^ expression )?
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_expression_in_relational_expression920);
            expression8=expression();
            _fsp--;

            adaptor.addChild(root_0, expression8.getTree());
            // src/antlr3/Plumhead.g:82:16: ( REL_OP^ expression )?
            int alt3=2;
            int LA3_0 = input.LA(1);
            if ( (LA3_0==REL_OP) ) {
                alt3=1;
            }
            switch (alt3) {
                case 1 :
                    // src/antlr3/Plumhead.g:82:18: REL_OP^ expression
                    {
                    REL_OP9=(Token)input.LT(1);
                    match(input,REL_OP,FOLLOW_REL_OP_in_relational_expression924); 
                    REL_OP9_tree = (CommonTree)adaptor.create(REL_OP9);
                    root_0 = (CommonTree)adaptor.becomeRoot(REL_OP9_tree, root_0);

                    pushFollow(FOLLOW_expression_in_relational_expression927);
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
    // src/antlr3/Plumhead.g:85:1: statements : ( statement )* ;
    public statements_return statements() throws RecognitionException {
        statements_return retval = new statements_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        statement_return statement11 = null;



        try {
            // src/antlr3/Plumhead.g:86:5: ( ( statement )* )
            // src/antlr3/Plumhead.g:86:5: ( statement )*
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:86:5: ( statement )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( (LA4_0==CODE_END) ) {
                    int LA4_1 = input.LA(2);
                    if ( (LA4_1==SEA) ) {
                        int LA4_4 = input.LA(3);
                        if ( (LA4_4==CODE_START) ) {
                            alt4=1;
                        }


                    }


                }
                else if ( ((LA4_0>=ECHO && LA4_0<=VAR_DUMP)||LA4_0==VAR_IDENT||LA4_0==IF) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:86:7: statement
            	    {
            	    pushFollow(FOLLOW_statement_in_statements945);
            	    statement11=statement();
            	    _fsp--;

            	    adaptor.addChild(root_0, statement11.getTree());

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
    // $ANTLR end statements

    public static class statement_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement
    // src/antlr3/Plumhead.g:89:1: statement : ( ECHO expression ';' -> ^( ECHO expression ) | VAR_DUMP PAREN_OPEN e= expression PAREN_CLOSE ';' -> ^( ECHO[\"asdf\"] $e) | IF PAREN_OPEN relational_expression PAREN_CLOSE '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) | VAR_IDENT ASSIGN_OP val= expression ';' -> ^( ASSIGN_OP SCALAR[$VAR_IDENT] $val) | VAR_IDENT '[' key= expression ']' ASSIGN_OP val= expression ';' -> ^( ASSIGN_OP ^( ARRAY[$VAR_IDENT] $key) $val) );
    public statement_return statement() throws RecognitionException {
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token ECHO12=null;
        Token char_literal14=null;
        Token VAR_DUMP15=null;
        Token PAREN_OPEN16=null;
        Token PAREN_CLOSE17=null;
        Token char_literal18=null;
        Token IF19=null;
        Token PAREN_OPEN20=null;
        Token PAREN_CLOSE22=null;
        Token char_literal23=null;
        Token char_literal24=null;
        Token ELSE25=null;
        Token char_literal26=null;
        Token char_literal27=null;
        Token CODE_END28=null;
        Token SEA29=null;
        Token CODE_START30=null;
        Token VAR_IDENT31=null;
        Token ASSIGN_OP32=null;
        Token char_literal33=null;
        Token VAR_IDENT34=null;
        Token char_literal35=null;
        Token char_literal36=null;
        Token ASSIGN_OP37=null;
        Token char_literal38=null;
        expression_return e = null;

        statements_return s1 = null;

        statements_return s2 = null;

        expression_return val = null;

        expression_return key = null;

        expression_return expression13 = null;

        relational_expression_return relational_expression21 = null;

        List list_statements=new ArrayList();
        List list_relational_expression=new ArrayList();
        List list_expression=new ArrayList();
        List list_PAREN_OPEN=new ArrayList();
        List list_CODE_START=new ArrayList();
        List list_ASSIGN_OP=new ArrayList();
        List list_PAREN_CLOSE=new ArrayList();
        List list_ECHO=new ArrayList();
        List list_ELSE=new ArrayList();
        List list_38=new ArrayList();
        List list_IF=new ArrayList();
        List list_36=new ArrayList();
        List list_VAR_DUMP=new ArrayList();
        List list_35=new ArrayList();
        List list_37=new ArrayList();
        List list_SEA=new ArrayList();
        List list_VAR_IDENT=new ArrayList();
        List list_CODE_END=new ArrayList();
        List list_34=new ArrayList();
        CommonTree ECHO12_tree=null;
        CommonTree char_literal14_tree=null;
        CommonTree VAR_DUMP15_tree=null;
        CommonTree PAREN_OPEN16_tree=null;
        CommonTree PAREN_CLOSE17_tree=null;
        CommonTree char_literal18_tree=null;
        CommonTree IF19_tree=null;
        CommonTree PAREN_OPEN20_tree=null;
        CommonTree PAREN_CLOSE22_tree=null;
        CommonTree char_literal23_tree=null;
        CommonTree char_literal24_tree=null;
        CommonTree ELSE25_tree=null;
        CommonTree char_literal26_tree=null;
        CommonTree char_literal27_tree=null;
        CommonTree CODE_END28_tree=null;
        CommonTree SEA29_tree=null;
        CommonTree CODE_START30_tree=null;
        CommonTree VAR_IDENT31_tree=null;
        CommonTree ASSIGN_OP32_tree=null;
        CommonTree char_literal33_tree=null;
        CommonTree VAR_IDENT34_tree=null;
        CommonTree char_literal35_tree=null;
        CommonTree char_literal36_tree=null;
        CommonTree ASSIGN_OP37_tree=null;
        CommonTree char_literal38_tree=null;

        try {
            // src/antlr3/Plumhead.g:90:5: ( ECHO expression ';' -> ^( ECHO expression ) | VAR_DUMP PAREN_OPEN e= expression PAREN_CLOSE ';' -> ^( ECHO[\"asdf\"] $e) | IF PAREN_OPEN relational_expression PAREN_CLOSE '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) | VAR_IDENT ASSIGN_OP val= expression ';' -> ^( ASSIGN_OP SCALAR[$VAR_IDENT] $val) | VAR_IDENT '[' key= expression ']' ASSIGN_OP val= expression ';' -> ^( ASSIGN_OP ^( ARRAY[$VAR_IDENT] $key) $val) )
            int alt6=6;
            switch ( input.LA(1) ) {
            case ECHO:
                alt6=1;
                break;
            case VAR_DUMP:
                alt6=2;
                break;
            case IF:
                alt6=3;
                break;
            case CODE_END:
                alt6=4;
                break;
            case VAR_IDENT:
                int LA6_5 = input.LA(2);
                if ( (LA6_5==ASSIGN_OP) ) {
                    alt6=5;
                }
                else if ( (LA6_5==37) ) {
                    alt6=6;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("89:1: statement : ( ECHO expression ';' -> ^( ECHO expression ) | VAR_DUMP PAREN_OPEN e= expression PAREN_CLOSE ';' -> ^( ECHO[\"asdf\"] $e) | IF PAREN_OPEN relational_expression PAREN_CLOSE '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) | VAR_IDENT ASSIGN_OP val= expression ';' -> ^( ASSIGN_OP SCALAR[$VAR_IDENT] $val) | VAR_IDENT '[' key= expression ']' ASSIGN_OP val= expression ';' -> ^( ASSIGN_OP ^( ARRAY[$VAR_IDENT] $key) $val) );", 6, 5, input);

                    throw nvae;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("89:1: statement : ( ECHO expression ';' -> ^( ECHO expression ) | VAR_DUMP PAREN_OPEN e= expression PAREN_CLOSE ';' -> ^( ECHO[\"asdf\"] $e) | IF PAREN_OPEN relational_expression PAREN_CLOSE '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) ) | CODE_END SEA CODE_START -> ^( ECHO NOQUOTE_STRING[$SEA] ) | VAR_IDENT ASSIGN_OP val= expression ';' -> ^( ASSIGN_OP SCALAR[$VAR_IDENT] $val) | VAR_IDENT '[' key= expression ']' ASSIGN_OP val= expression ';' -> ^( ASSIGN_OP ^( ARRAY[$VAR_IDENT] $key) $val) );", 6, 0, input);

                throw nvae;
            }

            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:90:5: ECHO expression ';'
                    {
                    ECHO12=(Token)input.LT(1);
                    match(input,ECHO,FOLLOW_ECHO_in_statement961); 
                    list_ECHO.add(ECHO12);

                    pushFollow(FOLLOW_expression_in_statement963);
                    expression13=expression();
                    _fsp--;

                    list_expression.add(expression13.getTree());
                    char_literal14=(Token)input.LT(1);
                    match(input,34,FOLLOW_34_in_statement965); 
                    list_34.add(char_literal14);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 90:69: -> ^( ECHO expression )
                    {
                        // src/antlr3/Plumhead.g:90:72: ^( ECHO expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot((Token)list_ECHO.get(i_0), root_1);

                        adaptor.addChild(root_1, list_expression.get(i_0));

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:91:5: VAR_DUMP PAREN_OPEN e= expression PAREN_CLOSE ';'
                    {
                    VAR_DUMP15=(Token)input.LT(1);
                    match(input,VAR_DUMP,FOLLOW_VAR_DUMP_in_statement1025); 
                    list_VAR_DUMP.add(VAR_DUMP15);

                    PAREN_OPEN16=(Token)input.LT(1);
                    match(input,PAREN_OPEN,FOLLOW_PAREN_OPEN_in_statement1027); 
                    list_PAREN_OPEN.add(PAREN_OPEN16);

                    pushFollow(FOLLOW_expression_in_statement1031);
                    e=expression();
                    _fsp--;

                    list_expression.add(e.getTree());
                    PAREN_CLOSE17=(Token)input.LT(1);
                    match(input,PAREN_CLOSE,FOLLOW_PAREN_CLOSE_in_statement1033); 
                    list_PAREN_CLOSE.add(PAREN_CLOSE17);

                    char_literal18=(Token)input.LT(1);
                    match(input,34,FOLLOW_34_in_statement1035); 
                    list_34.add(char_literal18);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 91:69: -> ^( ECHO[\"asdf\"] $e)
                    {
                        // src/antlr3/Plumhead.g:91:72: ^( ECHO[\"asdf\"] $e)
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ECHO, "asdf"), root_1);

                        adaptor.addChild(root_1, e.tree);

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:92:5: IF PAREN_OPEN relational_expression PAREN_CLOSE '{' s1= statements '}' ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )
                    {
                    IF19=(Token)input.LT(1);
                    match(input,IF,FOLLOW_IF_in_statement1068); 
                    list_IF.add(IF19);

                    PAREN_OPEN20=(Token)input.LT(1);
                    match(input,PAREN_OPEN,FOLLOW_PAREN_OPEN_in_statement1070); 
                    list_PAREN_OPEN.add(PAREN_OPEN20);

                    pushFollow(FOLLOW_relational_expression_in_statement1072);
                    relational_expression21=relational_expression();
                    _fsp--;

                    list_relational_expression.add(relational_expression21.getTree());
                    PAREN_CLOSE22=(Token)input.LT(1);
                    match(input,PAREN_CLOSE,FOLLOW_PAREN_CLOSE_in_statement1074); 
                    list_PAREN_CLOSE.add(PAREN_CLOSE22);

                    char_literal23=(Token)input.LT(1);
                    match(input,35,FOLLOW_35_in_statement1076); 
                    list_35.add(char_literal23);

                    pushFollow(FOLLOW_statements_in_statement1080);
                    s1=statements();
                    _fsp--;

                    list_statements.add(s1.getTree());
                    char_literal24=(Token)input.LT(1);
                    match(input,36,FOLLOW_36_in_statement1082); 
                    list_36.add(char_literal24);

                    // src/antlr3/Plumhead.g:93:5: ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )
                    int alt5=2;
                    int LA5_0 = input.LA(1);
                    if ( (LA5_0==ELSE) ) {
                        alt5=1;
                    }
                    else if ( (LA5_0==EOF||(LA5_0>=SEA && LA5_0<=CODE_END)||(LA5_0>=ECHO && LA5_0<=VAR_DUMP)||LA5_0==VAR_IDENT||LA5_0==IF||LA5_0==36) ) {
                        alt5=2;
                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("93:5: ( ELSE '{' s2= statements '}' -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) ) | -> ^( IF relational_expression ^( STMTS $s1) ) )", 5, 0, input);

                        throw nvae;
                    }
                    switch (alt5) {
                        case 1 :
                            // src/antlr3/Plumhead.g:93:7: ELSE '{' s2= statements '}'
                            {
                            ELSE25=(Token)input.LT(1);
                            match(input,ELSE,FOLLOW_ELSE_in_statement1090); 
                            list_ELSE.add(ELSE25);

                            char_literal26=(Token)input.LT(1);
                            match(input,35,FOLLOW_35_in_statement1092); 
                            list_35.add(char_literal26);

                            pushFollow(FOLLOW_statements_in_statement1096);
                            s2=statements();
                            _fsp--;

                            list_statements.add(s2.getTree());
                            char_literal27=(Token)input.LT(1);
                            match(input,36,FOLLOW_36_in_statement1098); 
                            list_36.add(char_literal27);


                            // AST REWRITE
                            int i_0 = 0;
                            retval.tree = root_0;
                            root_0 = (CommonTree)adaptor.nil();
                            // 93:69: -> ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) )
                            {
                                // src/antlr3/Plumhead.g:93:72: ^( IF relational_expression ^( STMTS $s1) ^( STMTS $s2) )
                                {
                                CommonTree root_1 = (CommonTree)adaptor.nil();
                                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_IF.get(i_0), root_1);

                                adaptor.addChild(root_1, list_relational_expression.get(i_0));
                                // src/antlr3/Plumhead.g:93:100: ^( STMTS $s1)
                                {
                                CommonTree root_2 = (CommonTree)adaptor.nil();
                                root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(STMTS, "STMTS"), root_2);

                                adaptor.addChild(root_2, s1.tree);

                                adaptor.addChild(root_1, root_2);
                                }
                                // src/antlr3/Plumhead.g:93:115: ^( STMTS $s2)
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
                            // src/antlr3/Plumhead.g:94:69: 
                            {

                            // AST REWRITE
                            int i_0 = 0;
                            retval.tree = root_0;
                            root_0 = (CommonTree)adaptor.nil();
                            // 94:69: -> ^( IF relational_expression ^( STMTS $s1) )
                            {
                                // src/antlr3/Plumhead.g:94:72: ^( IF relational_expression ^( STMTS $s1) )
                                {
                                CommonTree root_1 = (CommonTree)adaptor.nil();
                                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_IF.get(i_0), root_1);

                                adaptor.addChild(root_1, list_relational_expression.get(i_0));
                                // src/antlr3/Plumhead.g:94:100: ^( STMTS $s1)
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
                case 4 :
                    // src/antlr3/Plumhead.g:96:5: CODE_END SEA CODE_START
                    {
                    CODE_END28=(Token)input.LT(1);
                    match(input,CODE_END,FOLLOW_CODE_END_in_statement1261); 
                    list_CODE_END.add(CODE_END28);

                    SEA29=(Token)input.LT(1);
                    match(input,SEA,FOLLOW_SEA_in_statement1263); 
                    list_SEA.add(SEA29);

                    CODE_START30=(Token)input.LT(1);
                    match(input,CODE_START,FOLLOW_CODE_START_in_statement1265); 
                    list_CODE_START.add(CODE_START30);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 96:69: -> ^( ECHO NOQUOTE_STRING[$SEA] )
                    {
                        // src/antlr3/Plumhead.g:96:72: ^( ECHO NOQUOTE_STRING[$SEA] )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ECHO, "ECHO"), root_1);

                        adaptor.addChild(root_1, adaptor.create(NOQUOTE_STRING, SEA29));

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 5 :
                    // src/antlr3/Plumhead.g:97:5: VAR_IDENT ASSIGN_OP val= expression ';'
                    {
                    VAR_IDENT31=(Token)input.LT(1);
                    match(input,VAR_IDENT,FOLLOW_VAR_IDENT_in_statement1322); 
                    list_VAR_IDENT.add(VAR_IDENT31);

                    ASSIGN_OP32=(Token)input.LT(1);
                    match(input,ASSIGN_OP,FOLLOW_ASSIGN_OP_in_statement1324); 
                    list_ASSIGN_OP.add(ASSIGN_OP32);

                    pushFollow(FOLLOW_expression_in_statement1328);
                    val=expression();
                    _fsp--;

                    list_expression.add(val.getTree());
                    char_literal33=(Token)input.LT(1);
                    match(input,34,FOLLOW_34_in_statement1330); 
                    list_34.add(char_literal33);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 97:69: -> ^( ASSIGN_OP SCALAR[$VAR_IDENT] $val)
                    {
                        // src/antlr3/Plumhead.g:97:72: ^( ASSIGN_OP SCALAR[$VAR_IDENT] $val)
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot((Token)list_ASSIGN_OP.get(i_0), root_1);

                        adaptor.addChild(root_1, adaptor.create(SCALAR, VAR_IDENT31));
                        adaptor.addChild(root_1, val.tree);

                        adaptor.addChild(root_0, root_1);
                        }

                    }



                    }
                    break;
                case 6 :
                    // src/antlr3/Plumhead.g:98:5: VAR_IDENT '[' key= expression ']' ASSIGN_OP val= expression ';'
                    {
                    VAR_IDENT34=(Token)input.LT(1);
                    match(input,VAR_IDENT,FOLLOW_VAR_IDENT_in_statement1376); 
                    list_VAR_IDENT.add(VAR_IDENT34);

                    char_literal35=(Token)input.LT(1);
                    match(input,37,FOLLOW_37_in_statement1378); 
                    list_37.add(char_literal35);

                    pushFollow(FOLLOW_expression_in_statement1382);
                    key=expression();
                    _fsp--;

                    list_expression.add(key.getTree());
                    char_literal36=(Token)input.LT(1);
                    match(input,38,FOLLOW_38_in_statement1384); 
                    list_38.add(char_literal36);

                    ASSIGN_OP37=(Token)input.LT(1);
                    match(input,ASSIGN_OP,FOLLOW_ASSIGN_OP_in_statement1386); 
                    list_ASSIGN_OP.add(ASSIGN_OP37);

                    pushFollow(FOLLOW_expression_in_statement1390);
                    val=expression();
                    _fsp--;

                    list_expression.add(val.getTree());
                    char_literal38=(Token)input.LT(1);
                    match(input,34,FOLLOW_34_in_statement1392); 
                    list_34.add(char_literal38);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 98:69: -> ^( ASSIGN_OP ^( ARRAY[$VAR_IDENT] $key) $val)
                    {
                        // src/antlr3/Plumhead.g:98:72: ^( ASSIGN_OP ^( ARRAY[$VAR_IDENT] $key) $val)
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot((Token)list_ASSIGN_OP.get(i_0), root_1);

                        // src/antlr3/Plumhead.g:98:85: ^( ARRAY[$VAR_IDENT] $key)
                        {
                        CommonTree root_2 = (CommonTree)adaptor.nil();
                        root_2 = (CommonTree)adaptor.becomeRoot(adaptor.create(ARRAY, VAR_IDENT34), root_2);

                        adaptor.addChild(root_2, key.tree);

                        adaptor.addChild(root_1, root_2);
                        }
                        adaptor.addChild(root_1, val.tree);

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
    // src/antlr3/Plumhead.g:101:1: expression : ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | bitwise_expression | a= VAR_IDENT ( '[' key= expression ']' -> ^( ARRAY[$a] $key) )? );
    public expression_return expression() throws RecognitionException {
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token a=null;
        Token DOUBLEQUOTE_STRING39=null;
        Token SINGLEQUOTE_STRING40=null;
        Token char_literal42=null;
        Token char_literal43=null;
        expression_return key = null;

        bitwise_expression_return bitwise_expression41 = null;

        List list_expression=new ArrayList();
        List list_37=new ArrayList();
        List list_38=new ArrayList();
        List list_VAR_IDENT=new ArrayList();
        CommonTree a_tree=null;
        CommonTree DOUBLEQUOTE_STRING39_tree=null;
        CommonTree SINGLEQUOTE_STRING40_tree=null;
        CommonTree char_literal42_tree=null;
        CommonTree char_literal43_tree=null;

        try {
            // src/antlr3/Plumhead.g:102:5: ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | bitwise_expression | a= VAR_IDENT ( '[' key= expression ']' -> ^( ARRAY[$a] $key) )? )
            int alt8=4;
            switch ( input.LA(1) ) {
            case DOUBLEQUOTE_STRING:
                alt8=1;
                break;
            case SINGLEQUOTE_STRING:
                alt8=2;
                break;
            case PAREN_OPEN:
            case INTEGER:
            case NUMBER:
            case MINUS:
                alt8=3;
                break;
            case VAR_IDENT:
                alt8=4;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("101:1: expression : ( DOUBLEQUOTE_STRING | SINGLEQUOTE_STRING | bitwise_expression | a= VAR_IDENT ( '[' key= expression ']' -> ^( ARRAY[$a] $key) )? );", 8, 0, input);

                throw nvae;
            }

            switch (alt8) {
                case 1 :
                    // src/antlr3/Plumhead.g:102:5: DOUBLEQUOTE_STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    DOUBLEQUOTE_STRING39=(Token)input.LT(1);
                    match(input,DOUBLEQUOTE_STRING,FOLLOW_DOUBLEQUOTE_STRING_in_expression1428); 
                    DOUBLEQUOTE_STRING39_tree = (CommonTree)adaptor.create(DOUBLEQUOTE_STRING39);
                    adaptor.addChild(root_0, DOUBLEQUOTE_STRING39_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:103:5: SINGLEQUOTE_STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    SINGLEQUOTE_STRING40=(Token)input.LT(1);
                    match(input,SINGLEQUOTE_STRING,FOLLOW_SINGLEQUOTE_STRING_in_expression1434); 
                    SINGLEQUOTE_STRING40_tree = (CommonTree)adaptor.create(SINGLEQUOTE_STRING40);
                    adaptor.addChild(root_0, SINGLEQUOTE_STRING40_tree);


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:104:5: bitwise_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_bitwise_expression_in_expression1440);
                    bitwise_expression41=bitwise_expression();
                    _fsp--;

                    adaptor.addChild(root_0, bitwise_expression41.getTree());

                    }
                    break;
                case 4 :
                    // src/antlr3/Plumhead.g:105:5: a= VAR_IDENT ( '[' key= expression ']' -> ^( ARRAY[$a] $key) )?
                    {
                    a=(Token)input.LT(1);
                    match(input,VAR_IDENT,FOLLOW_VAR_IDENT_in_expression1448); 
                    list_VAR_IDENT.add(a);

                    // src/antlr3/Plumhead.g:105:17: ( '[' key= expression ']' -> ^( ARRAY[$a] $key) )?
                    int alt7=2;
                    int LA7_0 = input.LA(1);
                    if ( (LA7_0==37) ) {
                        alt7=1;
                    }
                    switch (alt7) {
                        case 1 :
                            // src/antlr3/Plumhead.g:105:19: '[' key= expression ']'
                            {
                            char_literal42=(Token)input.LT(1);
                            match(input,37,FOLLOW_37_in_expression1452); 
                            list_37.add(char_literal42);

                            pushFollow(FOLLOW_expression_in_expression1456);
                            key=expression();
                            _fsp--;

                            list_expression.add(key.getTree());
                            char_literal43=(Token)input.LT(1);
                            match(input,38,FOLLOW_38_in_expression1458); 
                            list_38.add(char_literal43);


                            // AST REWRITE
                            int i_0 = 0;
                            retval.tree = root_0;
                            root_0 = (CommonTree)adaptor.nil();
                            // 105:42: -> ^( ARRAY[$a] $key)
                            {
                                // src/antlr3/Plumhead.g:105:45: ^( ARRAY[$a] $key)
                                {
                                CommonTree root_1 = (CommonTree)adaptor.nil();
                                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ARRAY, a), root_1);

                                adaptor.addChild(root_1, key.tree);

                                adaptor.addChild(root_0, root_1);
                                }

                            }



                            }
                            break;

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

    public static class bitwise_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start bitwise_expression
    // src/antlr3/Plumhead.g:108:1: bitwise_expression : adding_expression ( BITWISE_OP^ adding_expression )* ;
    public bitwise_expression_return bitwise_expression() throws RecognitionException {
        bitwise_expression_return retval = new bitwise_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token BITWISE_OP45=null;
        adding_expression_return adding_expression44 = null;

        adding_expression_return adding_expression46 = null;


        CommonTree BITWISE_OP45_tree=null;

        try {
            // src/antlr3/Plumhead.g:109:5: ( adding_expression ( BITWISE_OP^ adding_expression )* )
            // src/antlr3/Plumhead.g:109:5: adding_expression ( BITWISE_OP^ adding_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_adding_expression_in_bitwise_expression1486);
            adding_expression44=adding_expression();
            _fsp--;

            adaptor.addChild(root_0, adding_expression44.getTree());
            // src/antlr3/Plumhead.g:109:23: ( BITWISE_OP^ adding_expression )*
            loop9:
            do {
                int alt9=2;
                int LA9_0 = input.LA(1);
                if ( (LA9_0==BITWISE_OP) ) {
                    alt9=1;
                }


                switch (alt9) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:109:25: BITWISE_OP^ adding_expression
            	    {
            	    BITWISE_OP45=(Token)input.LT(1);
            	    match(input,BITWISE_OP,FOLLOW_BITWISE_OP_in_bitwise_expression1490); 
            	    BITWISE_OP45_tree = (CommonTree)adaptor.create(BITWISE_OP45);
            	    root_0 = (CommonTree)adaptor.becomeRoot(BITWISE_OP45_tree, root_0);

            	    pushFollow(FOLLOW_adding_expression_in_bitwise_expression1493);
            	    adding_expression46=adding_expression();
            	    _fsp--;

            	    adaptor.addChild(root_0, adding_expression46.getTree());

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
    // $ANTLR end bitwise_expression

    public static class adding_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start adding_expression
    // src/antlr3/Plumhead.g:112:1: adding_expression : multiplying_expression ( ( PLUS^ | MINUS^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS48=null;
        Token MINUS49=null;
        multiplying_expression_return multiplying_expression47 = null;

        multiplying_expression_return multiplying_expression50 = null;


        CommonTree PLUS48_tree=null;
        CommonTree MINUS49_tree=null;

        try {
            // src/antlr3/Plumhead.g:113:5: ( multiplying_expression ( ( PLUS^ | MINUS^ ) multiplying_expression )* )
            // src/antlr3/Plumhead.g:113:5: multiplying_expression ( ( PLUS^ | MINUS^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression1509);
            multiplying_expression47=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression47.getTree());
            // src/antlr3/Plumhead.g:113:28: ( ( PLUS^ | MINUS^ ) multiplying_expression )*
            loop11:
            do {
                int alt11=2;
                int LA11_0 = input.LA(1);
                if ( ((LA11_0>=MINUS && LA11_0<=PLUS)) ) {
                    alt11=1;
                }


                switch (alt11) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:113:30: ( PLUS^ | MINUS^ ) multiplying_expression
            	    {
            	    // src/antlr3/Plumhead.g:113:30: ( PLUS^ | MINUS^ )
            	    int alt10=2;
            	    int LA10_0 = input.LA(1);
            	    if ( (LA10_0==PLUS) ) {
            	        alt10=1;
            	    }
            	    else if ( (LA10_0==MINUS) ) {
            	        alt10=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("113:30: ( PLUS^ | MINUS^ )", 10, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt10) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:113:32: PLUS^
            	            {
            	            PLUS48=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression1515); 
            	            PLUS48_tree = (CommonTree)adaptor.create(PLUS48);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS48_tree, root_0);


            	            }
            	            break;
            	        case 2 :
            	            // src/antlr3/Plumhead.g:113:40: MINUS^
            	            {
            	            MINUS49=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression1520); 
            	            MINUS49_tree = (CommonTree)adaptor.create(MINUS49);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS49_tree, root_0);


            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression1525);
            	    multiplying_expression50=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_0, multiplying_expression50.getTree());

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
    // $ANTLR end adding_expression

    public static class multiplying_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start multiplying_expression
    // src/antlr3/Plumhead.g:116:1: multiplying_expression : unary_expression ( MUL_OP^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP52=null;
        unary_expression_return unary_expression51 = null;

        unary_expression_return unary_expression53 = null;


        CommonTree MUL_OP52_tree=null;

        try {
            // src/antlr3/Plumhead.g:117:5: ( unary_expression ( MUL_OP^ unary_expression )* )
            // src/antlr3/Plumhead.g:117:5: unary_expression ( MUL_OP^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression1542);
            unary_expression51=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression51.getTree());
            // src/antlr3/Plumhead.g:117:22: ( MUL_OP^ unary_expression )*
            loop12:
            do {
                int alt12=2;
                int LA12_0 = input.LA(1);
                if ( (LA12_0==MUL_OP) ) {
                    alt12=1;
                }


                switch (alt12) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:117:24: MUL_OP^ unary_expression
            	    {
            	    MUL_OP52=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression1546); 
            	    MUL_OP52_tree = (CommonTree)adaptor.create(MUL_OP52);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP52_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression1549);
            	    unary_expression53=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_0, unary_expression53.getTree());

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
    // $ANTLR end multiplying_expression

    public static class unary_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start unary_expression
    // src/antlr3/Plumhead.g:120:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( PREFIX[\"-\"] postfix_expression ) );
    public unary_expression_return unary_expression() throws RecognitionException {
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS55=null;
        postfix_expression_return postfix_expression54 = null;

        postfix_expression_return postfix_expression56 = null;

        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        CommonTree MINUS55_tree=null;

        try {
            // src/antlr3/Plumhead.g:121:5: ( postfix_expression | MINUS postfix_expression -> ^( PREFIX[\"-\"] postfix_expression ) )
            int alt13=2;
            int LA13_0 = input.LA(1);
            if ( (LA13_0==PAREN_OPEN||(LA13_0>=INTEGER && LA13_0<=NUMBER)) ) {
                alt13=1;
            }
            else if ( (LA13_0==MINUS) ) {
                alt13=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("120:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( PREFIX[\"-\"] postfix_expression ) );", 13, 0, input);

                throw nvae;
            }
            switch (alt13) {
                case 1 :
                    // src/antlr3/Plumhead.g:121:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1565);
                    postfix_expression54=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression54.getTree());

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:122:5: MINUS postfix_expression
                    {
                    MINUS55=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression1571); 
                    list_MINUS.add(MINUS55);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression1573);
                    postfix_expression56=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression56.getTree());

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 122:30: -> ^( PREFIX[\"-\"] postfix_expression )
                    {
                        // src/antlr3/Plumhead.g:122:33: ^( PREFIX[\"-\"] postfix_expression )
                        {
                        CommonTree root_1 = (CommonTree)adaptor.nil();
                        root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PREFIX, "-"), root_1);

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
    // src/antlr3/Plumhead.g:125:1: postfix_expression : ( NUMBER | INTEGER | PAREN_OPEN expression PAREN_CLOSE -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER57=null;
        Token INTEGER58=null;
        Token PAREN_OPEN59=null;
        Token PAREN_CLOSE61=null;
        expression_return expression60 = null;

        List list_expression=new ArrayList();
        List list_PAREN_OPEN=new ArrayList();
        List list_PAREN_CLOSE=new ArrayList();
        CommonTree NUMBER57_tree=null;
        CommonTree INTEGER58_tree=null;
        CommonTree PAREN_OPEN59_tree=null;
        CommonTree PAREN_CLOSE61_tree=null;

        try {
            // src/antlr3/Plumhead.g:126:5: ( NUMBER | INTEGER | PAREN_OPEN expression PAREN_CLOSE -> expression )
            int alt14=3;
            switch ( input.LA(1) ) {
            case NUMBER:
                alt14=1;
                break;
            case INTEGER:
                alt14=2;
                break;
            case PAREN_OPEN:
                alt14=3;
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("125:1: postfix_expression : ( NUMBER | INTEGER | PAREN_OPEN expression PAREN_CLOSE -> expression );", 14, 0, input);

                throw nvae;
            }

            switch (alt14) {
                case 1 :
                    // src/antlr3/Plumhead.g:126:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER57=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression1597); 
                    NUMBER57_tree = (CommonTree)adaptor.create(NUMBER57);
                    adaptor.addChild(root_0, NUMBER57_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:127:5: INTEGER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    INTEGER58=(Token)input.LT(1);
                    match(input,INTEGER,FOLLOW_INTEGER_in_postfix_expression1603); 
                    INTEGER58_tree = (CommonTree)adaptor.create(INTEGER58);
                    adaptor.addChild(root_0, INTEGER58_tree);


                    }
                    break;
                case 3 :
                    // src/antlr3/Plumhead.g:128:5: PAREN_OPEN expression PAREN_CLOSE
                    {
                    PAREN_OPEN59=(Token)input.LT(1);
                    match(input,PAREN_OPEN,FOLLOW_PAREN_OPEN_in_postfix_expression1609); 
                    list_PAREN_OPEN.add(PAREN_OPEN59);

                    pushFollow(FOLLOW_expression_in_postfix_expression1611);
                    expression60=expression();
                    _fsp--;

                    list_expression.add(expression60.getTree());
                    PAREN_CLOSE61=(Token)input.LT(1);
                    match(input,PAREN_CLOSE,FOLLOW_PAREN_CLOSE_in_postfix_expression1613); 
                    list_PAREN_CLOSE.add(PAREN_CLOSE61);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 128:39: -> expression
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


 

    public static final BitSet FOLLOW_sea_or_code_in_program827 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_sea_in_sea_or_code852 = new BitSet(new long[]{0x0000000000001802L});
    public static final BitSet FOLLOW_code_in_sea_or_code856 = new BitSet(new long[]{0x0000000000001802L});
    public static final BitSet FOLLOW_SEA_in_sea873 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_START_in_code897 = new BitSet(new long[]{0x0000000100462002L});
    public static final BitSet FOLLOW_statements_in_code899 = new BitSet(new long[]{0x0000000000002002L});
    public static final BitSet FOLLOW_CODE_END_in_code901 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_expression_in_relational_expression920 = new BitSet(new long[]{0x0000000080000002L});
    public static final BitSet FOLLOW_REL_OP_in_relational_expression924 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_expression_in_relational_expression927 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements945 = new BitSet(new long[]{0x0000000100462002L});
    public static final BitSet FOLLOW_ECHO_in_statement961 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_expression_in_statement963 = new BitSet(new long[]{0x0000000400000000L});
    public static final BitSet FOLLOW_34_in_statement965 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_VAR_DUMP_in_statement1025 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_PAREN_OPEN_in_statement1027 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_expression_in_statement1031 = new BitSet(new long[]{0x0000000000100000L});
    public static final BitSet FOLLOW_PAREN_CLOSE_in_statement1033 = new BitSet(new long[]{0x0000000400000000L});
    public static final BitSet FOLLOW_34_in_statement1035 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_IF_in_statement1068 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_PAREN_OPEN_in_statement1070 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_relational_expression_in_statement1072 = new BitSet(new long[]{0x0000000000100000L});
    public static final BitSet FOLLOW_PAREN_CLOSE_in_statement1074 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_statement1076 = new BitSet(new long[]{0x0000001100462000L});
    public static final BitSet FOLLOW_statements_in_statement1080 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_statement1082 = new BitSet(new long[]{0x0000000200000002L});
    public static final BitSet FOLLOW_ELSE_in_statement1090 = new BitSet(new long[]{0x0000000800000000L});
    public static final BitSet FOLLOW_35_in_statement1092 = new BitSet(new long[]{0x0000001100462000L});
    public static final BitSet FOLLOW_statements_in_statement1096 = new BitSet(new long[]{0x0000001000000000L});
    public static final BitSet FOLLOW_36_in_statement1098 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_END_in_statement1261 = new BitSet(new long[]{0x0000000000000800L});
    public static final BitSet FOLLOW_SEA_in_statement1263 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_CODE_START_in_statement1265 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_VAR_IDENT_in_statement1322 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_ASSIGN_OP_in_statement1324 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_expression_in_statement1328 = new BitSet(new long[]{0x0000000400000000L});
    public static final BitSet FOLLOW_34_in_statement1330 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_VAR_IDENT_in_statement1376 = new BitSet(new long[]{0x0000002000000000L});
    public static final BitSet FOLLOW_37_in_statement1378 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_expression_in_statement1382 = new BitSet(new long[]{0x0000004000000000L});
    public static final BitSet FOLLOW_38_in_statement1384 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_ASSIGN_OP_in_statement1386 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_expression_in_statement1390 = new BitSet(new long[]{0x0000000400000000L});
    public static final BitSet FOLLOW_34_in_statement1392 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_DOUBLEQUOTE_STRING_in_expression1428 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SINGLEQUOTE_STRING_in_expression1434 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_bitwise_expression_in_expression1440 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_VAR_IDENT_in_expression1448 = new BitSet(new long[]{0x0000002000000002L});
    public static final BitSet FOLLOW_37_in_expression1452 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_expression_in_expression1456 = new BitSet(new long[]{0x0000004000000000L});
    public static final BitSet FOLLOW_38_in_expression1458 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_bitwise_expression1486 = new BitSet(new long[]{0x0000000020000002L});
    public static final BitSet FOLLOW_BITWISE_OP_in_bitwise_expression1490 = new BitSet(new long[]{0x0000000007080000L});
    public static final BitSet FOLLOW_adding_expression_in_bitwise_expression1493 = new BitSet(new long[]{0x0000000020000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1509 = new BitSet(new long[]{0x000000000C000002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression1515 = new BitSet(new long[]{0x0000000007080000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression1520 = new BitSet(new long[]{0x0000000007080000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression1525 = new BitSet(new long[]{0x000000000C000002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1542 = new BitSet(new long[]{0x0000000010000002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression1546 = new BitSet(new long[]{0x0000000007080000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression1549 = new BitSet(new long[]{0x0000000010000002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1565 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression1571 = new BitSet(new long[]{0x0000000003080000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression1573 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression1597 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_INTEGER_in_postfix_expression1603 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_PAREN_OPEN_in_postfix_expression1609 = new BitSet(new long[]{0x0000000007498000L});
    public static final BitSet FOLLOW_expression_in_postfix_expression1611 = new BitSet(new long[]{0x0000000000100000L});
    public static final BitSet FOLLOW_PAREN_CLOSE_in_postfix_expression1613 = new BitSet(new long[]{0x0000000000000002L});

}