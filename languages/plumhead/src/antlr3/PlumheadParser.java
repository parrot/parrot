// $ANTLR 3.0b5 src/antlr3/Plumhead.g 2007-01-18 23:22:30

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;


import org.antlr.runtime.tree.*;

public class PlumheadParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "PROGRAM", "SEA", "CODE_START", "CODE_END", "WS", "STRING", "ECHO", "INTEGER", "NUMBER", "MINUS", "PLUS", "MUL_OP", "REL_OP", "';'", "'('", "')'"
    };
    public static final int CODE_START=6;
    public static final int INTEGER=11;
    public static final int MINUS=13;
    public static final int ECHO=10;
    public static final int NUMBER=12;
    public static final int WS=8;
    public static final int EOF=-1;
    public static final int STRING=9;
    public static final int REL_OP=16;
    public static final int MUL_OP=15;
    public static final int PLUS=14;
    public static final int SEA=5;
    public static final int CODE_END=7;
    public static final int PROGRAM=4;

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
    // src/antlr3/Plumhead.g:57:1: program : s1= sea code s2= sea -> ^( PROGRAM $s1 code $s2) ;
    public program_return program() throws RecognitionException {   
        program_return retval = new program_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        sea_return s1 = null;

        sea_return s2 = null;

        code_return code1 = null;

        List list_code=new ArrayList();
        List list_sea=new ArrayList();

        try {
            // src/antlr3/Plumhead.g:58:5: (s1= sea code s2= sea -> ^( PROGRAM $s1 code $s2) )
            // src/antlr3/Plumhead.g:58:5: s1= sea code s2= sea
            {
            pushFollow(FOLLOW_sea_in_program365);
            s1=sea();
            _fsp--;

            list_sea.add(s1.tree);
            pushFollow(FOLLOW_code_in_program367);
            code1=code();
            _fsp--;

            list_code.add(code1.tree);
            pushFollow(FOLLOW_sea_in_program371);
            s2=sea();
            _fsp--;

            list_sea.add(s2.tree);

            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 58:24: -> ^( PROGRAM $s1 code $s2)
            {
                // src/antlr3/Plumhead.g:58:27: ^( PROGRAM $s1 code $s2)
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(PROGRAM, "PROGRAM"), root_1);

                adaptor.addChild(root_1, s1.tree);
                adaptor.addChild(root_1, list_code.get(i_0));
                adaptor.addChild(root_1, s2.tree);

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

    public static class sea_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start sea
    // src/antlr3/Plumhead.g:61:1: sea : SEA -> ^( ECHO STRING[$SEA] ) ;
    public sea_return sea() throws RecognitionException {   
        sea_return retval = new sea_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token SEA2=null;
        List list_SEA=new ArrayList();
        CommonTree SEA2_tree=null;

        try {
            // src/antlr3/Plumhead.g:62:5: ( SEA -> ^( ECHO STRING[$SEA] ) )
            // src/antlr3/Plumhead.g:62:5: SEA
            {
            SEA2=(Token)input.LT(1);
            match(input,SEA,FOLLOW_SEA_in_sea400); 
            list_SEA.add(SEA2);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 62:9: -> ^( ECHO STRING[$SEA] )
            {
                // src/antlr3/Plumhead.g:62:12: ^( ECHO STRING[$SEA] )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot(adaptor.create(ECHO, "ECHO"), root_1);

                adaptor.addChild(root_1, adaptor.create(STRING, SEA2));

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
    // src/antlr3/Plumhead.g:65:1: code : CODE_START statements CODE_END -> statements ;
    public code_return code() throws RecognitionException {   
        code_return retval = new code_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token CODE_START3=null;
        Token CODE_END5=null;
        statements_return statements4 = null;

        List list_statements=new ArrayList();
        List list_CODE_START=new ArrayList();
        List list_CODE_END=new ArrayList();
        CommonTree CODE_START3_tree=null;
        CommonTree CODE_END5_tree=null;

        try {
            // src/antlr3/Plumhead.g:66:5: ( CODE_START statements CODE_END -> statements )
            // src/antlr3/Plumhead.g:66:5: CODE_START statements CODE_END
            {
            CODE_START3=(Token)input.LT(1);
            match(input,CODE_START,FOLLOW_CODE_START_in_code424); 
            list_CODE_START.add(CODE_START3);

            pushFollow(FOLLOW_statements_in_code426);
            statements4=statements();
            _fsp--;

            list_statements.add(statements4.tree);
            CODE_END5=(Token)input.LT(1);
            match(input,CODE_END,FOLLOW_CODE_END_in_code428); 
            list_CODE_END.add(CODE_END5);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 66:36: -> statements
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

    public static class statements_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statements
    // src/antlr3/Plumhead.g:69:1: statements : ( statement )+ ;
    public statements_return statements() throws RecognitionException {   
        statements_return retval = new statements_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        statement_return statement6 = null;



        try {
            // src/antlr3/Plumhead.g:70:5: ( ( statement )+ )
            // src/antlr3/Plumhead.g:70:5: ( statement )+
            {
            root_0 = (CommonTree)adaptor.nil();

            // src/antlr3/Plumhead.g:70:5: ( statement )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);
                if ( (LA1_0==ECHO) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:70:7: statement
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    pushFollow(FOLLOW_statement_in_statements447);
            	    statement6=statement();
            	    _fsp--;

            	    adaptor.addChild(root_1, statement6.tree);

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
    // $ANTLR end statements

    public static class statement_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start statement
    // src/antlr3/Plumhead.g:73:1: statement : ECHO expression ';' -> ^( ECHO expression ) ;
    public statement_return statement() throws RecognitionException {   
        statement_return retval = new statement_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token ECHO7=null;
        Token char_literal9=null;
        expression_return expression8 = null;

        List list_expression=new ArrayList();
        List list_ECHO=new ArrayList();
        List list_17=new ArrayList();
        CommonTree ECHO7_tree=null;
        CommonTree char_literal9_tree=null;

        try {
            // src/antlr3/Plumhead.g:74:5: ( ECHO expression ';' -> ^( ECHO expression ) )
            // src/antlr3/Plumhead.g:74:5: ECHO expression ';'
            {
            ECHO7=(Token)input.LT(1);
            match(input,ECHO,FOLLOW_ECHO_in_statement463); 
            list_ECHO.add(ECHO7);

            pushFollow(FOLLOW_expression_in_statement465);
            expression8=expression();
            _fsp--;

            list_expression.add(expression8.tree);
            char_literal9=(Token)input.LT(1);
            match(input,17,FOLLOW_17_in_statement467); 
            list_17.add(char_literal9);


            // AST REWRITE
            int i_0 = 0;
            retval.tree = root_0;
            root_0 = (CommonTree)adaptor.nil();
            // 74:25: -> ^( ECHO expression )
            {
                // src/antlr3/Plumhead.g:74:28: ^( ECHO expression )
                {
                CommonTree root_1 = (CommonTree)adaptor.nil();
                root_1 = (CommonTree)adaptor.becomeRoot((Token)list_ECHO.get(i_0), root_1);

                adaptor.addChild(root_1, list_expression.get(i_0));

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
    // $ANTLR end statement

    public static class expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start expression
    // src/antlr3/Plumhead.g:77:1: expression : ( STRING | adding_expression );
    public expression_return expression() throws RecognitionException {   
        expression_return retval = new expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token STRING10=null;
        adding_expression_return adding_expression11 = null;


        CommonTree STRING10_tree=null;

        try {
            // src/antlr3/Plumhead.g:78:5: ( STRING | adding_expression )
            int alt2=2;
            int LA2_0 = input.LA(1);
            if ( (LA2_0==STRING) ) {
                alt2=1;
            }
            else if ( ((LA2_0>=NUMBER && LA2_0<=MINUS)||LA2_0==18) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("77:1: expression : ( STRING | adding_expression );", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // src/antlr3/Plumhead.g:78:5: STRING
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    STRING10=(Token)input.LT(1);
                    match(input,STRING,FOLLOW_STRING_in_expression490); 
                    STRING10_tree = (CommonTree)adaptor.create(STRING10);
                    adaptor.addChild(root_0, STRING10_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:79:5: adding_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_adding_expression_in_expression496);
                    adding_expression11=adding_expression();
                    _fsp--;

                    adaptor.addChild(root_0, adding_expression11.tree);

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
    // src/antlr3/Plumhead.g:82:1: adding_expression : multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* ;
    public adding_expression_return adding_expression() throws RecognitionException {   
        adding_expression_return retval = new adding_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token PLUS13=null;
        Token MINUS14=null;
        multiplying_expression_return multiplying_expression12 = null;

        multiplying_expression_return multiplying_expression15 = null;


        CommonTree PLUS13_tree=null;
        CommonTree MINUS14_tree=null;

        try {
            // src/antlr3/Plumhead.g:83:5: ( multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )* )
            // src/antlr3/Plumhead.g:83:5: multiplying_expression ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_multiplying_expression_in_adding_expression509);
            multiplying_expression12=multiplying_expression();
            _fsp--;

            adaptor.addChild(root_0, multiplying_expression12.tree);
            // src/antlr3/Plumhead.g:83:28: ( ( PLUS^^ | MINUS^^ ) multiplying_expression )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);
                if ( ((LA4_0>=MINUS && LA4_0<=PLUS)) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:83:30: ( PLUS^^ | MINUS^^ ) multiplying_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    // src/antlr3/Plumhead.g:83:30: ( PLUS^^ | MINUS^^ )
            	    int alt3=2;
            	    int LA3_0 = input.LA(1);
            	    if ( (LA3_0==PLUS) ) {
            	        alt3=1;
            	    }
            	    else if ( (LA3_0==MINUS) ) {
            	        alt3=2;
            	    }
            	    else {
            	        NoViableAltException nvae =
            	            new NoViableAltException("83:30: ( PLUS^^ | MINUS^^ )", 3, 0, input);

            	        throw nvae;
            	    }
            	    switch (alt3) {
            	        case 1 :
            	            // src/antlr3/Plumhead.g:83:32: PLUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            PLUS13=(Token)input.LT(1);
            	            match(input,PLUS,FOLLOW_PLUS_in_adding_expression515); 
            	            PLUS13_tree = (CommonTree)adaptor.create(PLUS13);
            	            root_0 = (CommonTree)adaptor.becomeRoot(PLUS13_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;
            	        case 2 :
            	            // src/antlr3/Plumhead.g:83:41: MINUS^^
            	            {
            	            CommonTree root_2 = (CommonTree)adaptor.nil();

            	            MINUS14=(Token)input.LT(1);
            	            match(input,MINUS,FOLLOW_MINUS_in_adding_expression520); 
            	            MINUS14_tree = (CommonTree)adaptor.create(MINUS14);
            	            root_0 = (CommonTree)adaptor.becomeRoot(MINUS14_tree, root_0);


            	            adaptor.addChild(root_1, root_2);

            	            }
            	            break;

            	    }

            	    pushFollow(FOLLOW_multiplying_expression_in_adding_expression525);
            	    multiplying_expression15=multiplying_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, multiplying_expression15.tree);

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
    // $ANTLR end adding_expression

    public static class multiplying_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start multiplying_expression
    // src/antlr3/Plumhead.g:86:1: multiplying_expression : unary_expression ( MUL_OP^^ unary_expression )* ;
    public multiplying_expression_return multiplying_expression() throws RecognitionException {   
        multiplying_expression_return retval = new multiplying_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MUL_OP17=null;
        unary_expression_return unary_expression16 = null;

        unary_expression_return unary_expression18 = null;


        CommonTree MUL_OP17_tree=null;

        try {
            // src/antlr3/Plumhead.g:87:5: ( unary_expression ( MUL_OP^^ unary_expression )* )
            // src/antlr3/Plumhead.g:87:5: unary_expression ( MUL_OP^^ unary_expression )*
            {
            root_0 = (CommonTree)adaptor.nil();

            pushFollow(FOLLOW_unary_expression_in_multiplying_expression542);
            unary_expression16=unary_expression();
            _fsp--;

            adaptor.addChild(root_0, unary_expression16.tree);
            // src/antlr3/Plumhead.g:87:22: ( MUL_OP^^ unary_expression )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);
                if ( (LA5_0==MUL_OP) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // src/antlr3/Plumhead.g:87:24: MUL_OP^^ unary_expression
            	    {
            	    CommonTree root_1 = (CommonTree)adaptor.nil();

            	    MUL_OP17=(Token)input.LT(1);
            	    match(input,MUL_OP,FOLLOW_MUL_OP_in_multiplying_expression546); 
            	    MUL_OP17_tree = (CommonTree)adaptor.create(MUL_OP17);
            	    root_0 = (CommonTree)adaptor.becomeRoot(MUL_OP17_tree, root_0);

            	    pushFollow(FOLLOW_unary_expression_in_multiplying_expression549);
            	    unary_expression18=unary_expression();
            	    _fsp--;

            	    adaptor.addChild(root_1, unary_expression18.tree);

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
    // $ANTLR end multiplying_expression

    public static class unary_expression_return extends ParserRuleReturnScope {
        CommonTree tree;
        public Object getTree() { return tree; }
    };

    // $ANTLR start unary_expression
    // src/antlr3/Plumhead.g:90:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP["n_mul"] NUMBER["-1"] postfix_expression ) );
    public unary_expression_return unary_expression() throws RecognitionException {   
        unary_expression_return retval = new unary_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token MINUS20=null;
        postfix_expression_return postfix_expression19 = null;

        postfix_expression_return postfix_expression21 = null;

        List list_postfix_expression=new ArrayList();
        List list_MINUS=new ArrayList();
        CommonTree MINUS20_tree=null;

        try {
            // src/antlr3/Plumhead.g:91:5: ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) )
            int alt6=2;
            int LA6_0 = input.LA(1);
            if ( (LA6_0==NUMBER||LA6_0==18) ) {
                alt6=1;
            }
            else if ( (LA6_0==MINUS) ) {
                alt6=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("90:1: unary_expression : ( postfix_expression | MINUS postfix_expression -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression ) );", 6, 0, input);

                throw nvae;
            }
            switch (alt6) {
                case 1 :
                    // src/antlr3/Plumhead.g:91:5: postfix_expression
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression565);
                    postfix_expression19=postfix_expression();
                    _fsp--;

                    adaptor.addChild(root_0, postfix_expression19.tree);

                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:92:5: MINUS postfix_expression
                    {
                    MINUS20=(Token)input.LT(1);
                    match(input,MINUS,FOLLOW_MINUS_in_unary_expression571); 
                    list_MINUS.add(MINUS20);

                    pushFollow(FOLLOW_postfix_expression_in_unary_expression573);
                    postfix_expression21=postfix_expression();
                    _fsp--;

                    list_postfix_expression.add(postfix_expression21.tree);

                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 92:30: -> ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression )
                    {
                        // src/antlr3/Plumhead.g:92:33: ^( MUL_OP[\"n_mul\"] NUMBER[\"-1\"] postfix_expression )
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
    // src/antlr3/Plumhead.g:95:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );
    public postfix_expression_return postfix_expression() throws RecognitionException {   
        postfix_expression_return retval = new postfix_expression_return();
        retval.start = input.LT(1);

        CommonTree root_0 = null;

        Token NUMBER22=null;
        Token char_literal23=null;
        Token char_literal25=null;
        expression_return expression24 = null;

        List list_expression=new ArrayList();
        List list_18=new ArrayList();
        List list_19=new ArrayList();
        CommonTree NUMBER22_tree=null;
        CommonTree char_literal23_tree=null;
        CommonTree char_literal25_tree=null;

        try {
            // src/antlr3/Plumhead.g:96:5: ( NUMBER | '(' expression ')' -> expression )
            int alt7=2;
            int LA7_0 = input.LA(1);
            if ( (LA7_0==NUMBER) ) {
                alt7=1;
            }
            else if ( (LA7_0==18) ) {
                alt7=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("95:1: postfix_expression : ( NUMBER | '(' expression ')' -> expression );", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // src/antlr3/Plumhead.g:96:5: NUMBER
                    {
                    root_0 = (CommonTree)adaptor.nil();

                    NUMBER22=(Token)input.LT(1);
                    match(input,NUMBER,FOLLOW_NUMBER_in_postfix_expression600); 
                    NUMBER22_tree = (CommonTree)adaptor.create(NUMBER22);
                    adaptor.addChild(root_0, NUMBER22_tree);


                    }
                    break;
                case 2 :
                    // src/antlr3/Plumhead.g:97:5: '(' expression ')'
                    {
                    char_literal23=(Token)input.LT(1);
                    match(input,18,FOLLOW_18_in_postfix_expression606); 
                    list_18.add(char_literal23);

                    pushFollow(FOLLOW_expression_in_postfix_expression608);
                    expression24=expression();
                    _fsp--;

                    list_expression.add(expression24.tree);
                    char_literal25=(Token)input.LT(1);
                    match(input,19,FOLLOW_19_in_postfix_expression610); 
                    list_19.add(char_literal25);


                    // AST REWRITE
                    int i_0 = 0;
                    retval.tree = root_0;
                    root_0 = (CommonTree)adaptor.nil();
                    // 97:24: -> expression
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


 

    public static final BitSet FOLLOW_sea_in_program365 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_code_in_program367 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_sea_in_program371 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_SEA_in_sea400 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_CODE_START_in_code424 = new BitSet(new long[]{0x0000000000000400L});
    public static final BitSet FOLLOW_statements_in_code426 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_CODE_END_in_code428 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_statement_in_statements447 = new BitSet(new long[]{0x0000000000000402L});
    public static final BitSet FOLLOW_ECHO_in_statement463 = new BitSet(new long[]{0x0000000000043200L});
    public static final BitSet FOLLOW_expression_in_statement465 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_17_in_statement467 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_STRING_in_expression490 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_adding_expression_in_expression496 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression509 = new BitSet(new long[]{0x0000000000006002L});
    public static final BitSet FOLLOW_PLUS_in_adding_expression515 = new BitSet(new long[]{0x0000000000043000L});
    public static final BitSet FOLLOW_MINUS_in_adding_expression520 = new BitSet(new long[]{0x0000000000043000L});
    public static final BitSet FOLLOW_multiplying_expression_in_adding_expression525 = new BitSet(new long[]{0x0000000000006002L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression542 = new BitSet(new long[]{0x0000000000008002L});
    public static final BitSet FOLLOW_MUL_OP_in_multiplying_expression546 = new BitSet(new long[]{0x0000000000043000L});
    public static final BitSet FOLLOW_unary_expression_in_multiplying_expression549 = new BitSet(new long[]{0x0000000000008002L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression565 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_MINUS_in_unary_expression571 = new BitSet(new long[]{0x0000000000041000L});
    public static final BitSet FOLLOW_postfix_expression_in_unary_expression573 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_NUMBER_in_postfix_expression600 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_18_in_postfix_expression606 = new BitSet(new long[]{0x0000000000043200L});
    public static final BitSet FOLLOW_expression_in_postfix_expression608 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_19_in_postfix_expression610 = new BitSet(new long[]{0x0000000000000002L});

}