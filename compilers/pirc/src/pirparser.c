#include "pirlexer.h"
#include "pirparser.h"

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdarg.h>
#include <string.h>


#define MAX_ERRORS  10  /* quit after 10 errors to prevent too many errors */

/* parser_state structure
 * holds the current token, a pointer to the lexer,
 * and keeps track of the number of errors.
 *
 */
typedef struct parser_state {
    struct lexer_state *lexer;      /* the lexer */
    token curtoken;                 /* the current token as returned by the lexer */
    char *heredoc_ids[10];          /* array for holding heredoc arguments. XXX Limited to 10 currently XXX */
    int heredoc_index;              /* index to keep track of heredoc ids in the array */
    unsigned parse_errors;          /* parse_errors */


} parser_state;



/* call next() to get the next token from the lexer */
#define next(P) P->curtoken = next_token(P->lexer)

/* prototypes */
static void target(parser_state *p);
static void type(parser_state *p);



/* exit_parser()
 *
 * Clean up and exit the program normally.
 */
void
exit_parser(parser_state *p) {
    destroy_lexer(p->lexer);
    free(p);
    exit(0);
}

/* syntax_error()
 *
 * Handle all syntax error through this function.
 * numargs is the number of variable arguments.
 * All arguments should be of type "char *" !!!
 */
static void
syntax_error(parser_state *p, int numargs, ...) {
    va_list arg_ptr;
    int count;
    long line = get_current_line(p->lexer);
    char const *file = get_current_file(p->lexer);

    fprintf(stderr, "syntax error in file '%s', line %ld: ", file, line);

    va_start(arg_ptr, numargs);
    for (count = 0; count < numargs; count++) {
        char *arg = va_arg(arg_ptr, char *);
        fprintf(stderr, "%s", arg);
    }
    va_end(arg_ptr);

    fprintf(stderr, "\n");

    /* only show context on first error */
    if (p->parse_errors == 0) print_error_context(p->lexer);

    p->parse_errors++;


    if (p->parse_errors > MAX_ERRORS) {
        fprintf(stderr, "Too many errors; fix some first\n");
        exit_parser(p);
    }
}

/* match()
 *
 * checks whether the current token is the same
 * as the expected token. If so, all is ok, and the
 * next token is fetched. If not, an appropiate syntax error
 * is reported.
 */
static void
match(parser_state *p, token expected) {
    if (p->curtoken == expected) { /* if all is fine, get next token */
        next(p);
    }
    else {
        if (p->curtoken == T_EOF) { /* no characters have been read, so nothing to display */
            syntax_error(p, 3 , "expected ", find_keyword(expected), " but got end of file");
            exit_parser(p);     /* no use to continue when having read end of file */
        }
        else { /* 'normal' error; not end of file yet */
            char *curtoken = get_current_token(p->lexer);
            syntax_error(p, 5, "expected ", find_keyword(expected), " but got '", curtoken, "'");

            /* Try to reduce errors; skip tokens up to ".end" and
             * try to continue with the next subroutine, if any
             */
            do {
                next(p);
            }
            while (p->curtoken != T_END && p->curtoken != T_EOF);

            /* loop broke, see what happened: */
            if (p->curtoken == T_END) next(p);
            else exit_parser(p); /* we got T_EOF; clean up and go home */

        }
    }
}





/* grammar rules */

/* simple_expression()
 *
 * Parse a simple expression. Returns the type of the expression.
 */
static token
simple_expression(parser_state *p) {
    /* simple_expression -> IDENT | INTC | NUMC | STRINGC | REG */
    token exprtok = T_ERROR;
    switch(p->curtoken) {
        case T_IDENTIFIER:
        case T_INTEGER_CONSTANT:
        case T_NUMBER_CONSTANT:
        case T_SINGLE_QUOTED_STRING:
        case T_DOUBLE_QUOTED_STRING:
        case T_PASM_PREG: case T_PREG:
        case T_PASM_NREG: case T_NREG:
        case T_PASM_IREG: case T_IREG:
        case T_PASM_SREG: case T_SREG:
            exprtok = p->curtoken;
            next(p);
            break;
        default:
            syntax_error(p, 1, "simple expression expected");
            break;
    }
    return exprtok;
}


static void
key(parser_state *p) {
    if (p->curtoken == T_DOTDOT) { /* key -> '..' expr */
        next(p);
        simple_expression(p);
    }
    else { /* key -> expr [ '..' [ expr ] ] */
        simple_expression(p);
        if (p->curtoken == T_DOTDOT) {
            next(p);
            if (p->curtoken == T_RBRACKET) return;
            else simple_expression(p);
        }
    }
}


static void
keylist(parser_state *p) {
    /* keylist -> '[' key { (';'|',') key} ']' */
    match(p, T_LBRACKET); /* skip '[' */
    key(p);
    while(p->curtoken == T_SEMICOLON || p->curtoken == T_COMMA) {
        next(p); /* skip ',' */
        key(p);
    }
    match(p, T_RBRACKET); /* match closing ']' */
}

static void
argument(parser_state *p) {
    /* argument -> heredoc_ident | simple_expr */
    if (p->curtoken == T_HEREDOC_ID) { /* heredoc argument */
        p->heredoc_ids[p->heredoc_index++] = clone_string(get_current_token(p->lexer));
        next(p);
    }
    else {
        token exprtok = simple_expression(p);
        /* allow for "stringc '=>' expr" */
        if (exprtok == T_SINGLE_QUOTED_STRING || exprtok == T_DOUBLE_QUOTED_STRING) {
            if (p->curtoken == T_ARROW) {
                next(p);
                simple_expression(p);
            }
        }
    }
}

static void
argument_list(parser_state *p) {
    /* argument_list -> argument { ',' argument } */
    argument(p);
    while (p->curtoken == T_COMMA) {
        next(p);
        argument(p);
    }

}


static void
global_definition(parser_state *p) {
    /* global_definition -> '.global' IDENT */
    match(p, T_GLOBAL);
    match(p, T_IDENTIFIER);
}

static void
arguments(parser_state *p) {
    /* arguments -> '(' [argument_list] ')' { heredocstring heredoc_delimiter } */
    match(p, T_LPAREN);
    if (p->curtoken != T_RPAREN) argument_list(p);
    match(p, T_RPAREN);

    /* do NOT match() for T_NEWLINE, it will get the next token, but it might
    * be a heredoc, which needs a special lexer function */
    if (p->curtoken != T_NEWLINE) {
        syntax_error(p, 1, "'\\n' expected");
    }

    /* check whehter there are any heredocs to be parsed */
    if ( p->heredoc_index > 0) {
        int i;
        for (i = 0; i < p->heredoc_index; i++) {
            char *heredocid = p->heredoc_ids[i];
            p->curtoken = read_heredoc(p->lexer, heredocid);
            match(p, T_HEREDOC_STRING);
            free(heredocid); /* clean up memory of this string */
        }

        /* clear heredoc index */
        p->heredoc_index = 0;
    }
}

/* arith_expression()
 *
 * If the current token is a binary operator, then this operator
 * together with its right operand is parsed. If no operator,
 * just return.
 */
static void
arith_expression(parser_state *p) {
    /* arith_expr -> [binop simple_expr] */
    switch(p->curtoken) {
        case T_PLUS:
        case T_MINUS:
        case T_DIVIDE:
        case T_MULTIPLY:
        case T_MODULO:
        case T_OR:
        case T_BOR:
        case T_AND:
        case T_BAND:
        case T_CONCAT: /* yeah I know, it's not arithmatic */
            next(p);
            simple_expression(p);
            break;
        default:
            break;
    }
}

static void
assignment(parser_state *p) {
    /* assignment -> '=' (expr [binop expr] | target (keylist|arguments) | heredocstring ) '\n' */
    match(p, T_ASSIGN);

    switch(p->curtoken) {
        case T_IDENTIFIER:
        case T_PREG:
        case T_PASM_PREG:
            next(p);

            switch (p->curtoken) {
                case T_LPAREN:  /* function call */
                    arguments(p);
                    break;
                case T_LBRACKET: /* target '=' target '[' expr ']' */
                    keylist(p);
                    break;
                default: /* expression with a PMC target/id as first operand */
                    arith_expression(p);
                    break;
            }
            match(p, T_NEWLINE);
            break;

        case T_HEREDOC_ID: { /* parse heredoc string */
            char *heredocid = clone_string(get_current_token(p->lexer));
            /* read_heredoc() returns a special token */
            p->curtoken = read_heredoc(p->lexer, heredocid);
            match(p, T_HEREDOC_STRING);
            free(heredocid); /* clean up */
            match(p, T_NEWLINE);
            break;
        }

        default: /* general case for 'expr binop expr' */
            simple_expression(p);
            arith_expression(p);
            match(p, T_NEWLINE);
            break;
    }

}

static void
goto_statement(parser_state *p) {
    /* goto_statement -> 'goto' IDENT '\n' */
    match(p, T_GOTO);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

static void
return_statement(parser_state *p) {
    /* return_statement -> '.return' ( [arguments] | tailcall ) '\n' */
    match(p, T_RETURN);
    if (p->curtoken == T_LPAREN) { /* arguments */
        arguments(p);
    }
    else { /* tailcall */
        target(p);
        arguments(p);
    }
    match(p, T_NEWLINE);
}

static void
yield_statement(parser_state *p) {
    /* yield_statement -> '.yield' arguments '\n' */
    match(p, T_YIELD);
    arguments(p);
    match(p, T_NEWLINE);
}

static void
close_ns(parser_state *p) {
    /* close_ns -> '.endnamespace' IDENT '\n' */
    match(p, T_ENDNAMESPACE);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

static void
open_ns(parser_state *p) {
    /* open_ns -> '.namespace' IDENT '\n' */
    match(p, T_NAMESPACE);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

static void
local_id_list(parser_state *p) {
    /* local_id_list -> IDENT [flag] { ',' IDENT [flag] } */
    match(p, T_IDENTIFIER);
    if (p->curtoken == T_UNIQUE_REG_FLAG) next(p);

    while(p->curtoken == T_COMMA) {
        next(p); /* skip comma */
        match(p, T_IDENTIFIER);

        if (p->curtoken == T_UNIQUE_REG_FLAG) next(p);
    }
}

static void
declaration_list(parser_state *p) {
    /* declaration_list -> type local_id_list '\n' */
    type(p);
    local_id_list(p);
    match(p, T_NEWLINE);
}

static void
sym_declaration(parser_state *p) {
    /* sym_declaration -> '.sym' declaration_list */
    match(p, T_SYM);
    declaration_list(p);
}

static void
local_declaration(parser_state *p) {
    /* sym_declaration -> '.local' declaration_list */
    match(p, T_LOCAL);
    declaration_list(p);
}

static void
stringconstant(parser_state *p) {
    /* strinconstant -> double-quoted_string | single-quoted-string */
    if (p->curtoken == T_DOUBLE_QUOTED_STRING
        || p->curtoken == T_SINGLE_QUOTED_STRING) {
        next(p);
    }
    else {
        syntax_error(p, 1, "string constant expected");
    }
}

static void
lex_declaration(parser_state *p) {
    /* sym_declaration -> '.lex' STRINGC ',' target '\n' */
    match(p, T_LEX);
    stringconstant(p);
    match(p, T_COMMA);
    target(p);
    match(p, T_NEWLINE);
}



static void
conditional_expression(parser_state *p) {
    /* conditional_expression -> simple_expr [ ['>'|'>='|'<'|'<='|'=='|'!='] simple_expr] */
    simple_expression(p);

    switch(p->curtoken) { /* optional */
        case T_GE: case T_GT: case T_EQ: case T_NE: case T_LT: case T_LE:
            next(p); /* skip comparison op */
            simple_expression(p);
            break;
        default:
            break;
    }
}


static void
unless_statement(parser_state *p) {
    /* unless_statement -> 'unless' expression 'goto' IDENT '\n' */
    match(p, T_UNLESS);

    if (p->curtoken == T_NULL) { /* 'unless' 'null' expr 'goto' IDENT */
        next(p);
        simple_expression(p);
    }
    else { /* 'unless' cond_expr 'goto' IDENT */
        conditional_expression(p);
    }
    match(p, T_GOTO);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

static void
if_statement(parser_state *p) {
    /* if_statement -> 'if' expression 'goto' IDENT '\n' */
    match(p, T_IF);
    if (p->curtoken == T_NULL) { /* if null expr goto LABEL */
        next(p);
        simple_expression(p);
    }
    else { /* if x [op y] goto LABEL */
        conditional_expression(p);
    }
    match(p, T_GOTO);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

static void
int_const_definition(parser_state *p) {
    match(p, T_IDENTIFIER);
    match(p, T_ASSIGN);
    match(p, T_INTEGER_CONSTANT);
}

static void
string_const_definition(parser_state *p) {
    match(p, T_IDENTIFIER);
    match(p, T_ASSIGN);
    stringconstant(p);
}

static void
num_const_definition(parser_state *p) {
    match(p, T_IDENTIFIER);
    match(p, T_ASSIGN);
    match(p, T_NUMBER_CONSTANT);
}

static void
pmc_const_definition(parser_state *p) {
    match(p, T_IDENTIFIER);
    match(p, T_ASSIGN);
    stringconstant(p);
}


static void
const_definition(parser_state *p) {
    /* const_definition -> type IDENT '=' LITERAL */
    switch(p->curtoken) {
        case T_INT:
            next(p);
            int_const_definition(p);
            break;
        case T_NUM:
            next(p);
            num_const_definition(p);
            break;
        case T_PMC:
            next(p);
            pmc_const_definition(p);
            break;
        case T_STRING:
            next(p);
            string_const_definition(p);
            break;
        default:
            syntax_error(p, 1, "type expected");
            next(p);    /* try to restore, get next token */
            break;
    }
}


static void
methodcall(parser_state *p) {
    /* methodcall -> IDENT'.' (IDENT|STRINGC) arguments '\n' */
    match(p, T_INVOCANT_IDENT);

    if (p->curtoken == T_IDENTIFIER) next(p);
    else stringconstant(p);

    arguments(p);
    match(p, T_NEWLINE);
}


static void
target(parser_state *p) {
    /* target -> register | identifier */
    switch(p->curtoken) {
        case T_PASM_PREG: case T_PREG: case T_PASM_IREG: case T_IREG:
        case T_PASM_NREG: case T_NREG: case T_PASM_SREG: case T_SREG:
        case T_IDENTIFIER:
            next(p);
            break;
        default:
            syntax_error(p, 1, "register or identifier expected");
            break;
    }
}





static void
long_return_statement(parser_state *p) {
    /* long_return_statement -> '.pcc_begin_return' '\n' ... */
    match(p, T_PCC_BEGIN_RETURN);
    match(p, T_NEWLINE);

    while (p->curtoken == T_RETURN) { /* ... { '.return' simple_expr '\n' } ...*/
        next(p); /* skip .return */
        simple_expression(p);
        match(p, T_NEWLINE);
    }
    match(p, T_PCC_END_RETURN); /* ... '.pcc_end_return' '\n' */
    match(p, T_NEWLINE);
}

static void
arg_flag(parser_state *p) {
    while (p->curtoken != T_NEWLINE) {
        switch (p->curtoken) {
            case T_FLAT_FLAG:
                next(p);
                break;
            case T_NAMED_FLAG:
                next(p);
                if (p->curtoken == T_LPAREN) {
                    next(p);
                    stringconstant(p);
                    match(p, T_RPAREN);
                }
                break;
            default:
                syntax_error(p, 1, "':flat' or ':named' flag expected");
                break;
        }
    }
}

static void
long_invocation(parser_state *p) {
    int results = 1;

    match(p, T_PCC_BEGIN);  /* '.pcc_begin '\n' ... */
    match(p, T_NEWLINE);

    while (p->curtoken == T_ARG) { /* ... { '.arg' expr [flag] '\n' } ... */
        next(p);
        simple_expression(p);
        arg_flag(p);
        match(p, T_NEWLINE);
    }

    switch(p->curtoken) {
        case T_PCC_CALL: /* ... '.pcc_call' target '\n' ... */
        case T_NCI_CALL: /* ... '.nci_call' target '\n' ... */
            next(p);
            target(p);
            match(p, T_NEWLINE);
            break;
        case T_INVOCANT: /* '.invocant' target '\n' */
            next(p);
            target(p);
            match(p, T_NEWLINE);
            match(p, T_METH_CALL); /* .meth_call target '\n' */
            target(p);
            match(p, T_NEWLINE);
            break;
        default:
            syntax_error(p, 1, ".pcc_call, .nci_call or .invocant expected");
            break;
    }


    while (results) {
        switch (p->curtoken) {
            case T_LOCAL:
                local_declaration(p);
                break;
            case T_RESULT: /* '.result' target '\n' */
                next(p);
                target(p);
                match(p, T_NEWLINE);
                break;
            case T_PCC_END:
                results = 0; /* no more results, break loop */
                break;
            default:
                syntax_error(p, 3,
                    "'.local', '.result' or '.pcc_end' expected, but got '",
                    get_current_token(p->lexer), "'");
                results = 0; /* stop loop */
                break;
        }
    }

    match(p, T_PCC_END); /* '.pcc_end' '\n' */
    match(p, T_NEWLINE);
}


static void
long_yield_statement(parser_state *p) {
    /* long_yield_statement -> '.pcc_begin_yield' '\n' ... */
    match(p, T_PCC_BEGIN_YIELD);
    match(p, T_NEWLINE);

    while (p->curtoken == T_YIELD) { /* { '.yield' simple_expr '\n' } */
        match(p, T_YIELD);
        simple_expression(p);
        match(p, T_NEWLINE);
    }
    match(p, T_PCC_END_YIELD); /* '.pcc_end_yield' '\n' */
    match(p, T_NEWLINE);
}

static void
target_statement(parser_state *p) {
    target(p);

    /* after a target follows an assignment or subcall */
    switch(p->curtoken) {
        case T_ASSIGN:   /* target '=' expression */
            assignment(p);
            break;
        case T_PLUS_ASSIGN: /* target '+=' simple_expr '\n' (and '-=' etc.) */
        case T_MINUS_ASSIGN:
        case T_DIVIDE_ASSIGN:
        case T_POWER_ASSIGN:
        case T_MULTIPLY_ASSIGN:
            next(p);
            simple_expression(p);
            match(p, T_NEWLINE);
            break;
        case T_LBRACKET: /* target '[' keylist ']' '=' simple_expression */
            keylist(p);
            match(p, T_ASSIGN);
            simple_expression(p);
            match(p, T_NEWLINE);
            break;
        case T_PTR:  /* target '->' (stringc|identifier) arguments '\n' */
            next(p); /* skip '->' */
            if (p->curtoken == T_IDENTIFIER) next(p);   /* target '->' IDENT arguments */
            else stringconstant(p);                     /* target '->' stringc arguments */
            arguments(p);
            match(p, T_NEWLINE);
            break;
        case T_LPAREN:  /* target '(' arguments ')' */
            arguments(p);
            match(p, T_NEWLINE);
            break;
        default:
            syntax_error(p, 1, "'=', '+=' (etc.) '[', '.', '->' or '(' expected");
            break;
    }
}

static void
target_list(parser_state *p) {
    /* target_list -> '(' target {',' target } ')' */
    match(p, T_LPAREN);
    match(p, T_IDENTIFIER);
    while(p->curtoken == T_COMMA) {
        next(p);
        match(p, T_IDENTIFIER);
        /* add flags like slurpy */
    }
    match(p, T_RPAREN);
}

static void
multi_result_invocation(parser_state *p) {
    /* multi-result-invocation -> target_list '=' (subcall | methodcall) */
    target_list(p);
    match(p, T_ASSIGN);

    switch(p->curtoken) {
        case T_IDENTIFIER: /* target_list '=' subcall */
        case T_PASM_PREG:
        case T_PREG:
            next(p);
            arguments(p);
            match(p, T_NEWLINE);
            break;
        case T_INVOCANT_IDENT: /* target_list '=' methodcall */
            methodcall(p);
            break;
        default:
            syntax_error(p, 1, "sub or method invocation expected");
            break;
    }
}

/*
 TODO: create a parse tree for each macro definition, then on macro expansion
 the parse tree can be populated with the actual values (macro parameters).
 */
static void
macro_expansion(parser_state *p) {
    while (p->curtoken != T_NEWLINE)
        next(p);
    match(p, T_NEWLINE);
}


static void
var(parser_state *p) {
    switch (p->curtoken) {
        case T_IDENTIFIER:
        case T_PASM_PREG: case T_PREG:
        case T_PASM_SREG: case T_SREG:
        case T_PASM_NREG: case T_NREG:
        case T_PASM_IREG: case T_IREG:
            next(p);
            break;
        default:
            syntax_error(p, 1, "identifier or register expected");
            break;
    }
}

static void
get_results_instruction(parser_state *p) {
    /* get_results_instr -> '.get_results' '(' target_list ')' '\n' */
    match(p, T_GET_RESULTS);
    target_list(p);
    match(p, T_NEWLINE);
}


static void
instructions(parser_state *p) {
    int ok = 1;
    while (ok) {

        /* instruction -> {LABEL:} instr */
        while (p->curtoken == T_LABEL) {
            next(p);
            if (p->curtoken == T_NEWLINE) next(p); /* and continue loop */
            else break; /* break loop */
        }

        switch (p->curtoken) {
            case T_IF: /* instruction -> if_statement */
                if_statement(p);
                break;
            case T_UNLESS: /* instruction -> unless_statement */
                unless_statement(p);
                break;
            case T_LOCAL: /* instruction -> local_declaration */
                local_declaration(p);
                break;
            case T_LEX: /* instruction -> lex_declaration */
                lex_declaration(p);
                break;
            case T_SYM: /* instruction -> sym_declaration */
                sym_declaration(p);
                break;
            case T_GLOBALCONST:
                match(p, T_GLOBALCONST);
                const_definition(p);
                match(p, T_NEWLINE);
                break;
            case T_CONST: /* instruction -> const_definition '\n' */
                match(p, T_CONST);
                const_definition(p);
                match(p, T_NEWLINE);
                break;
            case T_NAMESPACE: /* instruction -> namespace */
                open_ns(p);
                break;
            case T_ENDNAMESPACE: /* instruction -> endnamespace */
                close_ns(p);
                break;
            case T_RETURN: /* instruction -> return_statement */
                return_statement(p);
                break;
            case T_YIELD: /* instruction -> yield_statement */
                yield_statement(p);
                break;
            case T_MACRO_IDENT:
                macro_expansion(p);
                break;
            case T_GOTO: /* instruction -> goto_statement */
                goto_statement(p);
                break;
            case T_IDENTIFIER: /* instruction -> assignment | call */
            case T_PASM_PREG: case T_PREG: case T_PASM_NREG: case T_NREG:
            case T_PASM_SREG: case T_SREG: case T_PASM_IREG: case T_IREG:
                target_statement(p);
                break;
            case T_INVOCANT_IDENT:  /* dot attached to identifier, like 'id.' */
                methodcall(p);
                break;
            case T_PCC_BEGIN:
                long_invocation(p);
                break;
            case T_PCC_BEGIN_RETURN:
                long_return_statement(p);
                break;
            case T_PCC_BEGIN_YIELD:
                long_yield_statement(p);
                break;
            case T_LPAREN: /* '(' target_list ')' '=' subcall */
                multi_result_invocation(p);
                break;
            case T_PARROT_OP: /* parrot instructions */
                next(p); /* XXX for now, parse as many arguments as necessary */
                while (p->curtoken != T_NEWLINE) {
                    next(p);
                    if (p->curtoken == T_COMMA) next(p);
                    else break;
                }
                match(p, T_NEWLINE);
                break;
            case T_NULL: /* 'null' is a PIR keyword, but also an instruction. */
                next(p);
                var(p); /* IMCC accepts "null $I0", does that make sense?? */
                break;
            case T_GET_RESULTS: /* '.get_results' target_list */
                get_results_instruction(p);
                break;
            case T_NEWLINE: /* skip newlines */
                next(p);
                break;
            default:
                ok = 0; /* stop loop */
                break;
        }
    }
}

static void
type(parser_state *p) {
    /* type -> INT | NUM | PMC | STRING */
    switch(p->curtoken) {
        case T_INT:
        case T_NUM:
        case T_PMC:
        case T_STRING:
            next(p);
            break;
        default:
            syntax_error(p, 1, "type expected");
            break;
    }
}

static void
multi_type_list(parser_state *p) {
    /* multi_type_list -> '(' [multi-type {',' multi-type}] ')' */
    int wantmore = 1;

    match(p, T_LPAREN);

    while (wantmore) {
        /* multi-type -> IDENT | stringc | '[' keylist ']' | type */
        switch (p->curtoken) {
            case T_IDENTIFIER:
            case T_SINGLE_QUOTED_STRING:
            case T_DOUBLE_QUOTED_STRING:
                next(p);
                break;
            case T_LBRACKET:
                keylist(p);
                break;
            case T_INT:
            case T_NUM:
            case T_PMC:
            case T_STRING:
                next(p);
                break;
            case T_RPAREN: /* ')', so stop parsing this list */
                wantmore = 0;
                break;
            default:
                syntax_error(p, 1, "multi type expected");
                wantmore = 0;
                break;
        }

        if (p->curtoken == T_COMMA) next(p);
        else wantmore = 0; /* no comma, so quit loop */
    }
    match(p, T_RPAREN);
}

static void
sub_flags(parser_state *p) {
    /* sub_flags -> flag { [','] flag } */
    int ok = 1;
    int wantmore = 0; /* flag that is set when a ',' is parsed */

    while (ok || wantmore) {
        switch(p->curtoken) {
            case T_ANON_FLAG:
                next(p);
                break;
            case T_INIT_FLAG:
                next(p);
                break;
            case T_LOAD_FLAG:
                next(p);
                break;
            case T_MAIN_FLAG:
                next(p);
                break;
            case T_LEX_FLAG:
                next(p);
                break;
            case T_OUTER_FLAG:
            case T_VTABLE_FLAG:
                next(p);
                match(p, T_LPAREN);
                stringconstant(p);
                match(p, T_RPAREN);
                break;
            case T_MULTI_FLAG:
                next(p);
                multi_type_list(p);
                break;
            case T_POSTCOMP_FLAG:    /* :postcomp and :immediate are the same */
            case T_IMMEDIATE_FLAG:
                next(p);
                break;
            case T_NEWLINE:
                ok = 0; /* stop loop; wantmore is always cleared, so loop will stop */
                if (wantmore) syntax_error(p, 1, "sub flag expected after ','");
                break;
            default:
                syntax_error(p, 3, "sub flag expected, but got '",
                             get_current_token(p->lexer), "'");
                /* attempt to reduce # of errors */
                next(p);
                ok = 0;
                break;
        }

        wantmore = 0; /* clear wantmore flag */

        /* after the optional comma we expect another sub flag */
        if (p->curtoken == T_COMMA) {
            next(p); /* skip the comma */
            wantmore = 1;
        }
    }
}

static void
param_flags(parser_state *p) {
    /* param_flag -> ':slurpy' | ':named'['(' string ')'] | ':unique_reg'
                               | ':optional' | ':opt_flag' */
    int ok = 1;
    while (ok) {
        switch(p->curtoken) {
            case T_SLURPY_FLAG:
            case T_UNIQUE_REG_FLAG:
            case T_OPTIONAL_FLAG:
            case T_OPT_FLAG_FLAG:
                next(p);
                break;
            case T_NAMED_FLAG: /* param_flag -> ':named' [ '(' string ')' ] */
                next(p);
                if (p->curtoken == T_LPAREN) {
                    next(p); /* skip '(' */
                    stringconstant(p);
                    match(p, T_RPAREN);
                }
                break;
            case T_NEWLINE:
                ok = 0; /* stop loop */
                break;
            default:
                syntax_error(p, 1, "syntax error: parameter flag or newline expected");
                ok = 0; /* stop loop */
                break;
        }
    }
}


static void
parameters(parser_state *p) {
    /* parameters -> { '.param' (register | type IDENT) [param_flag] '\n' */
    while (p->curtoken == T_PARAM) {
        next(p); /* skip '.param */
        if (p->curtoken == T_REGISTER) { /* parameter -> '.param' register */
            next(p);
        }
        else { /* parameter -> '.param' type IDENT param_flag */
            type(p);
            match(p, T_IDENTIFIER);
            param_flags(p);
        }
        match(p, T_NEWLINE);
    }
}

static void
sub_definition(parser_state *p) {
    /* sub_definition -> '.sub' (IDENT | stringc) '\n' parameters body '.end' */
    match(p, T_SUB);

    if (p->curtoken == T_IDENTIFIER) match(p, T_IDENTIFIER);
    else stringconstant(p);

    sub_flags(p);

    match(p, T_NEWLINE);
    parameters(p);
    instructions(p);
    match(p, T_END);
}

static void
emit_block(parser_state *p) {
    /* emit_block -> '.emit' '\n' {pasm_instruction} '.eom' */
    match(p, T_EMIT);
    match(p, T_NEWLINE);

    while (p->curtoken == T_PARROT_OP) {
        next(p);
        while (p->curtoken != T_NEWLINE) {
            next(p);
            if (p->curtoken == T_COMMA) next(p);
            else break; /* stop loop */
        }
        match(p, T_NEWLINE);
    }

    match(p, T_EOM);
}

static void
macro_parameters(parser_state *p) {
    /* macro_params -> [ '(' [ id {',' id} ] ')' ] */
    if (p->curtoken == T_LPAREN) next(p);
    else return; /* no parameters apparently */

    while (p->curtoken == T_IDENTIFIER) {
        next(p);
        if (p->curtoken == T_COMMA) next(p);
        else break; /* no comma, end of param list */
    }
    match(p, T_RPAREN);
}



static void
macro_definition(parser_state *p) {
    /* macro_definition -> '.macro' ident parameters '\n' macro_body '.endm' */
    match(p, T_MACRO);
    match(p, T_IDENTIFIER);
    macro_parameters(p);

    /* check but don't match a newline; match() gets the next token, which might
     * be the ".endm". This token would then be missed by read_macro().
     */
    if (p->curtoken != T_NEWLINE) {
        syntax_error(p, 1, "newline expected after macro parameters");
    }
    /* read a macro using a special lexer method */
    p->curtoken = read_macro(p->lexer);
    match(p, T_ENDM);
}

/* include()
 *
 * calls include_file() in the lexer. Then, the first token is initialized
 * by calling next(); then the TOP() routine is invoked to start parsing
 * the included file. After having parsed that file, continue the current file
 * by calling the next token.
 */
static void
include(parser_state *p) {
    next(p); /* skip '.include '*/

    /* only check, don't skip filename */
    if (p->curtoken != T_DOUBLE_QUOTED_STRING
        && p->curtoken != T_SINGLE_QUOTED_STRING) {
            syntax_error(p, 1, "string constant expected");
    }
    else {
        /* read the file to be included and get first token of the included file */
        open_include_file(p->lexer);
        next(p);

        /* go parse it */
        TOP(p);

        /* switch back to other file that included the one above */
        close_include_file(p->lexer);

        /* get next token from this file */
        next(p);
    }

}

static void
pragma(parser_state *p) {
    /* pragma -> '.pragma' 'n_operators' intc */
    match(p, T_PRAGMA);
    match(p, T_N_OPERATORS);
    match(p, T_INTEGER_CONSTANT);
}

static void
hll_specifier(parser_state *p) {
    /* hll_spec -> '.HLL' stringc ',' stringc */
    match(p, T_HLL);
    stringconstant(p);
    match(p, T_COMMA);
    stringconstant(p);
}

static void
hll_mapping(parser_state *p) {
    /* hll_mapping -> '.HLL_map' intc ',' intc */
    match(p, T_HLL_MAP);
    match(p, T_INTEGER_CONSTANT);
    match(p, T_COMMA);
    match(p, T_INTEGER_CONSTANT);
}

static void
namespace_declaration(parser_state *p) {
    /* namespace_decl -> '.namespace' [ '[' stringc { (','|';') stringc ']' ] */
    match(p, T_NAMESPACE);
    if (p->curtoken == T_LBRACKET) {
        next(p); /* skip '[' */
        stringconstant(p);

        while (p->curtoken == T_COMMA || p->curtoken == T_SEMICOLON) {
            next(p);
            stringconstant(p);
        }
        match(p, T_RBRACKET);
    }
}

static void
loadlib(parser_state *p) {
    /* loadlib -> '.loadlib' stringconstant */
    match(p, T_LOADLIB);
    stringconstant(p);
}

static void
compilation_unit(parser_state *p) {
    switch (p->curtoken) {
        case T_GLOBAL: /* compilation_unit -> global_definition */
            global_definition(p);
            break;
        case T_SUB: /* compilation_unit -> sub_definition */
        case T_PCC_SUB:
            sub_definition(p);
            break;
        case T_CONST: /* compilation_unit -> const_definition */
            match(p, T_CONST);
            const_definition(p);
            break;
        case T_EMIT: /* compilation_unit -> emit_block */
            emit_block(p);
            break;
        case T_INCLUDE: /* compilation_unit -> '.include' stringc */
            include(p);
            break;
        case T_MACRO:
            macro_definition(p);
            break;
        case T_PRAGMA:
            pragma(p);
            break;
        case T_LOADLIB:
            loadlib(p);
            break;
        case T_NAMESPACE:
            namespace_declaration(p);
            break;
        case T_HLL:
            hll_specifier(p);
            break;
        case T_HLL_MAP:
            hll_mapping(p);
            break;
        default:
            break;
    }
}


static void
program(parser_state *p) {
    /* program -> {'\n'} compilation_unit { '\n' compilation_unit } */

    /* the file may have some initial newlines; eat them */
    if (p->curtoken == T_NEWLINE) next(p);

    compilation_unit(p);

    while (p->curtoken != T_EOF ) {
        match(p, T_NEWLINE);
        compilation_unit(p);
    }
}

/* TOP()
 *
 * Entry point of the parser
 */
void
TOP(parser_state *p) {
    /* file -> program EOF */
    program(p);

    /* do NOT match T_EOF; match() tries to read the next token
     * instead, do a manual check.
     */
    if (p->curtoken != T_EOF) {
        syntax_error(p, 3, "end of file expected in file '", get_current_file(p->lexer), "'\n");

    }
    else {
        fprintf(stderr, "TOP: end of file '%s'\n", get_current_file(p->lexer));
    }

}


/* get_parse_errors()
 *
 * return the number of parse errors.
 */
int
get_parse_errors(parser_state *p) {
    return p->parse_errors;
}

/* new_parser()
 *
 * constructor for a parser_state object.
 */
parser_state *
new_parser(char const * filename) {
    parser_state *p = (parser_state *)malloc(sizeof(parser_state));

    if (p == NULL) {
        fprintf(stderr, "no parser");
        exit(1);
    }
    p->lexer         = new_lexer(filename);
    p->curtoken      = next_token(p->lexer);
    p->parse_errors  = 0;
    p->heredoc_index = 0;
    return p;
}


