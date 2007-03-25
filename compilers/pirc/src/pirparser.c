/*

=head1 NAME

pirparser.c - parser for Parrot Intermediate Representation

=cut

*/

#include "pirlexer.h"
#include "pirparser.h"
#include "pirout.h" /* for test output */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdarg.h>
#include <string.h>

/*

parser_state structure holds the current token, a pointer to the lexer,
and keeps track of the number of errors.

*/

typedef struct parser_state {
    struct lexer_state *lexer;      /* the lexer */
    token curtoken;                 /* the current token as returned by the lexer */
    char *heredoc_ids[10];          /* array for holding heredoc arguments. XXX Limited to 10 currently XXX */
    int heredoc_index;              /* index to keep track of heredoc ids in the array */
    unsigned parse_errors;          /* parse_errors */

} parser_state;


/* quit after 10 errors to prevent too many errors */
#define MAX_ERRORS  10


/* call next() to get the next token from the lexer */ /* NOTE: it's calling pirout() */
#define next(P) do { pirout(P); P->curtoken = next_token(P->lexer); } while(0)


/*

=head1 HELPER FUNCTIONS

=over 4

=item void exit_parser()

Clean up and exit the program normally.

=cut

*/
void
exit_parser(parser_state *p) {
    destroy_lexer(p->lexer);
    free(p);
    exit(0);
}

/*

=item get_parse_errors()

return the number of parse errors.

=cut

*/
int
get_parse_errors(parser_state *p) {
    return p->parse_errors;
}

/*

=item new_parser()

constructor for a parser_state object.

=cut

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


/*

=item static void syntax_error()

Handle all syntax error through this function.
numargs is the number of variable arguments.
All arguments should be of type "char *" !!!

=cut

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

/*

=item static void match()

checks whether the current token is the same
as the expected token. If so, all is ok, and the
next token is fetched. If not, an appropiate syntax error
is reported.

=cut

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
            syntax_error(p, 4, "expected ", find_keyword(expected), " but got: ", find_keyword(p->curtoken));

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

/*

=item struct lexer_state const *get_lexer()

returns the specified parser's lexer

=cut

*/
struct lexer_state const *
get_lexer(parser_state *p) {
    return p->lexer;
}

/*

=item token get_token()

returns the specified parser's current token

=cut

*/
token get_token(parser_state *p) {
    return p->curtoken;
}



/*

=back

=head1 GRAMMAR RULES

=over 4

=item expression()

Parse a simple expression. Returns the type of the expression.

  expression -> ( IDENT | INTC | NUMC | STRINGC | REG )

=cut

*/
static token
expression(parser_state *p) {
    token exprtok = T_ERROR;

    switch (p->curtoken) {
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



/*

=item stringconstant()

  stringconstant -> DOUBLE_QUOTED_STRING | SINGLE_QUOTED_STRING

=cut

*/
static void
stringconstant(parser_state *p) {
    if (p->curtoken == T_DOUBLE_QUOTED_STRING || p->curtoken == T_SINGLE_QUOTED_STRING) {
        next(p);
    }
    else {
        syntax_error(p, 1, "string constant expected");
    }
}

/*

=item method()

  method -> IDENT | stringconstant

=cut

*/
static void
method(parser_state *p) {
    if (p->curtoken == T_IDENTIFIER) next(p);
    else stringconstant(p);
}



/*

=item target()

  target -> REGISTER | IDENTIFIER

=cut

*/
static void
target(parser_state *p) {
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

/*

=item type()

  type -> 'int' | 'num' | 'pmc' | 'string'

=cut

*/
static void
type(parser_state *p) {
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

/*

=item key()

  key -> unop expr | '..' expr | expr [ '..' [ expr ] ]

=cut

*/
static void
key(parser_state *p) {
    switch (p->curtoken) {
        case T_MINUS:
        /*
        case T_BXOR:
        case T_NOT:
        */
        case T_DOTDOT: /* key -> '..' expr */
            next(p);
            expression(p);
            break;
        default: /* key -> expr [ '..' [ expr ] ] */
            expression(p);
            if (p->curtoken == T_DOTDOT) {
                next(p);
                if (p->curtoken == T_RBRACKET) return;
                else expression(p);
            }
            break;
    }
}


/*

=item keylist()

  keylist -> '[' key { (';'|',') key } ']'

=cut

*/
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

/*

=item argument()

  argument -> HEREDOCID | expr | STRINGC '='> expr

=cut

*/
static void
argument(parser_state *p) {
    /* argument -> heredoc_ident | simple_expr */
    if (p->curtoken == T_HEREDOC_ID) { /* heredoc argument */
        p->heredoc_ids[p->heredoc_index++] = clone_string(get_current_token(p->lexer));
        next(p);
    }
    else {
        token exprtok = expression(p);
        /* allow for "stringc '=>' expr" */
        if (exprtok == T_SINGLE_QUOTED_STRING || exprtok == T_DOUBLE_QUOTED_STRING) {
            if (p->curtoken == T_ARROW) {
                next(p);
                expression(p);
            }
        }
    }
}

/*

=item argument_list()

  argument_list -> argument { ',' argument }

=cut

*/
static void
argument_list(parser_state *p) {
    /* argument_list -> argument { ',' argument } */
    argument(p);
    while (p->curtoken == T_COMMA) {
        next(p);
        argument(p);
    }

}

/*

=item global_definition()

  global_definition -> '.global' IDENT

=cut

*/
static void
global_definition(parser_state *p) {    
    match(p, T_GLOBAL_DECL);
    match(p, T_IDENTIFIER);
}


/*

=item arguments()

  arguments -> '(' [argument_list] ')' { HEREDOC_STRING HEREDOC_DELIM }

=cut

*/
static void
arguments(parser_state *p) {
    match(p, T_LPAREN);
    if (p->curtoken != T_RPAREN) argument_list(p);
    match(p, T_RPAREN);

    /* do NOT match() for T_NEWLINE, it will get the next token, but it might
    * be a heredoc, which needs a special lexer function
    */
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


/*

=item methodcall()

  methodcall -> INVOCANT_IDENT method arguments '\n'

=cut

*/
static void
methodcall(parser_state *p) {
    match(p, T_INVOCANT_IDENT);
    method(p);
    arguments(p);
}


/*

=item arith_expression()

If the current token is a binary operator, then this operator
together with its right operand is parsed. If no operator,
just return.

  arith_expr -> [ binop expression ]

  binop      -> '+'  | '-' | '*'  | '/' | '//' | '%'  | '~~'  | '~'
              | '&&' | '&' | '||' | '|' | '<<' | '>>' | '>>>' | '.'

=cut

*/
static void
arith_expression(parser_state *p) {
    switch(p->curtoken) {
        case T_PLUS:
        case T_MINUS:
        case T_DIVIDE:
        case T_FDIVIDE:
        case T_MULTIPLY:
        case T_MODULO:
        case T_XOR:
        case T_BXOR:
        case T_OR:
        case T_BOR:
        case T_AND:
        case T_BAND:
        case T_RSHIFT:
        case T_LOG_RSHIFT:
        case T_LSHIFT:
        case T_CONCAT: /* yeah I know, it's not arithmetic */
            next(p);
            expression(p);
            break;
        default:
            break;
    }
}


/*

=item assignment()

  assignment -> '=' ( unop expression
                    | expression [binop expression]
                    | target ( keylist | [ '->' method ] arguments )
                    | stringconstant arguments
                    | 'global' stringconstant
                    | heredocstring
                    | methodcall
                    | 'null'
                    ) '\n'

  unop       -> '-' | '!' | '~'

=cut

*/
static void
assignment(parser_state *p) {
    match(p, T_ASSIGN);

    switch(p->curtoken) {
        case T_NOT:
        case T_MINUS:
        case T_BXOR:  /* '~' used as binary 'not' op */
            next(p);
            expression(p);
            break;
        case T_INVOCANT_IDENT: /* method call */
            methodcall(p);
            break;
        case T_SINGLE_QUOTED_STRING: /* "foo"() */
        case T_DOUBLE_QUOTED_STRING:
            next(p);
            arguments(p);
            break;
        case T_IDENTIFIER:
        case T_PREG:
        case T_PASM_PREG:
            next(p);

            switch (p->curtoken) {
                case T_LPAREN:  /* function call; foo() */
                    arguments(p);
                    break;
                case T_PTR: /* method call; foo '->' method arguments */
                    next(p);
                    method(p);
                    arguments(p);
                    break;
                case T_LBRACKET: /* target '=' target '[' expr ']' */
                    keylist(p);
                    break;
                default: /* expression with a PMC target/id as first operand */
                    arith_expression(p);
                    break;
            }
            break;
        case T_GLOBAL: /* x = global 'i' */
            next(p);
            stringconstant(p);
            break;
        case T_NULL:
            next(p);
            break;
        case T_HEREDOC_ID: { /* parse heredoc string */
            char *heredocid = clone_string(get_current_token(p->lexer));
            /* read_heredoc() returns a special token */
            p->curtoken = read_heredoc(p->lexer, heredocid);
            match(p, T_HEREDOC_STRING);
            free(heredocid); /* clean up */
            break;
        }
        default: /* general case for 'expr binop expr' */
            expression(p);
            arith_expression(p);
            break;
    }
    match(p, T_NEWLINE);
}

/*

=item goto_statement()

  goto_statement -> 'goto' IDENT '\n'

=cut

*/
static void
goto_statement(parser_state *p) {
    match(p, T_GOTO);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}






/*

=item return_statement()

  return_statement -> '.return' ( arguments | target arguments | methodcall ) '\n'

=cut

*/
static void
return_statement(parser_state *p) {
    match(p, T_RETURN);
    switch (p->curtoken) {
        case T_LPAREN:
            arguments(p);
            break;
        case T_INVOCANT_IDENT: /* tail method call */
            methodcall(p);
            break;
        default: /* normal sub tailcall */
            target(p);
            if (p->curtoken == T_PTR) {
                next(p);
                method(p);
            }
            arguments(p);
            break;
    }
    match(p, T_NEWLINE);
}

/*

=item yield_statement()

  yield_statement -> '.yield' arguments '\n'

=cut

*/
static void
yield_statement(parser_state *p) {
    match(p, T_YIELD);
    arguments(p);
    match(p, T_NEWLINE);
}

/*

=item close_ns()

  close_ns -> '.endnamespace' IDENT '\n'

=cut

*/
static void
close_ns(parser_state *p) {
    match(p, T_ENDNAMESPACE);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

/*

=item open_ns()

  open_ns -> '.namespace' IDENT '\n'

=cut

*/
static void
open_ns(parser_state *p) {
    match(p, T_NAMESPACE);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

/*

=item local_id_list()

  local_id_list -> IDENT [flag] { ',' IDENT [flag] }

=cut

*/
static void
local_id_list(parser_state *p) {
    match(p, T_IDENTIFIER);
    if (p->curtoken == T_UNIQUE_REG_FLAG) next(p);

    while(p->curtoken == T_COMMA) {
        next(p); /* skip comma */
        match(p, T_IDENTIFIER);

        if (p->curtoken == T_UNIQUE_REG_FLAG) next(p);
    }
}

/*

=item declaration_list()

 declaration_list -> type local_id_list '\n'

=cut

*/

static void
declaration_list(parser_state *p) {
    type(p);
    local_id_list(p);
    match(p, T_NEWLINE);
}

/*

=item sym_declaration()

  sym_declaration -> '.sym' declaration_list

=cut

*/
static void
sym_declaration(parser_state *p) {
    match(p, T_SYM);
    declaration_list(p);
}

/*

=item local_declaration()

  local_declaration -> '.local' declaration_list

=cut

*/
static void
local_declaration(parser_state *p) {
    match(p, T_LOCAL);
    declaration_list(p);
}



/*

=item lex_declaration()

  lex_declaration -> '.lex' STRINGC ',' target '\n'

=cut

*/
static void
lex_declaration(parser_state *p) {
    match(p, T_LEX);
    stringconstant(p);
    match(p, T_COMMA);
    target(p);
    match(p, T_NEWLINE);
}



/*

=item condition_expression()

  conditional_expression -> expression [ ('>'|'>='|'<'|'<='|'=='|'!=') expression]

=cut

*/
static void
conditional_expression(parser_state *p) {
    expression(p);

    switch(p->curtoken) { /* optional */
        case T_GE: case T_GT: case T_EQ:
        case T_NE: case T_LT: case T_LE:
            next(p); /* skip comparison op */
            expression(p);
            break;
        default: /* cond-expr -> expr */
            break;
    }
}

/*

=item unless_statement()

  unless_statement -> 'unless' ('null' expression|conditional_epxression) 'goto' IDENT '\n'

=cut

*/
static void
unless_statement(parser_state *p) {
    match(p, T_UNLESS);

    if (p->curtoken == T_NULL) { /* 'unless' 'null' expr 'goto' IDENT */
        next(p);
        expression(p);
    }
    else { /* 'unless' cond_expr 'goto' IDENT */
        conditional_expression(p);
    }
    match(p, T_GOTO);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

/*

=item if_statement()

  if_statement -> 'if' ('null' expression|conditional_epxression) 'goto' IDENT '\n'

=cut

*/
static void
if_statement(parser_state *p) {
    match(p, T_IF);
    if (p->curtoken == T_NULL) { /* if null expr goto LABEL */
        next(p);
        expression(p);
    }
    else { /* if x [op y] goto LABEL */
        conditional_expression(p);
    }
    match(p, T_GOTO);
    match(p, T_IDENTIFIER);
    match(p, T_NEWLINE);
}

/*

=item const_definition()

  const_definition -> type IDENT '=' constant

=cut

*/
static void
const_definition(parser_state *p) {
    switch(p->curtoken) {
        case T_INT:
            next(p);
            match(p, T_IDENTIFIER);
            match(p, T_ASSIGN);
            match(p, T_INTEGER_CONSTANT);
            break;
        case T_NUM:
            next(p);
            match(p, T_IDENTIFIER);
            match(p, T_ASSIGN);
            match(p, T_NUMBER_CONSTANT);
            break;
        case T_STRING: /* both string and PMC have strings as constants */
        case T_PMC:
            next(p);
            match(p, T_IDENTIFIER);
            match(p, T_ASSIGN);
            stringconstant(p);
            break;
        default:
            syntax_error(p, 1, "type expected");
            next(p);    /* try to restore, get next token */
            break;
    }
}





/*

=item long_return_statement()

  long_return_statement -> '.pcc_begin_return' '\n'
                           { '.return' expression '\n' }
                           '.pcc_end_return' '\n'

=cut

*/
static void
long_return_statement(parser_state *p) {
    match(p, T_PCC_BEGIN_RETURN);
    match(p, T_NEWLINE);

    while (p->curtoken == T_RETURN) { /* ... { '.return' simple_expr '\n' } ...*/
        next(p); /* skip .return */
        expression(p);
        match(p, T_NEWLINE);
    }
    match(p, T_PCC_END_RETURN); /* ... '.pcc_end_return' '\n' */
    match(p, T_NEWLINE);
}

/*

=item arg_flags()

  arg_flags -> ':flat' | ':named' [ '(' stringconstant ')' ]

=cut

*/
static void
arg_flags(parser_state *p) {
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

/*

=item param_flags()

  param_flags -> ':slurpy'
               | ':named'['(' string ')']
               | ':unique_reg'
               | ':optional'
               | ':opt_flag'

=cut

*/
static void
param_flags(parser_state *p) {
    int ok = 1;
    while (ok) {
        /* if the current token is a flag, parse it */
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
            /* however, if the current token is a comma or ')', then quit parsing flags */
            case T_COMMA:
            case T_RPAREN:
                ok = 0; /* stop loop */
                break;
            /* if none of the above, error! */
            default:
                syntax_error(p, 2, "syntax error: parameter flag or newline expected, but got ", find_keyword(p->curtoken));
                ok = 0; /* stop loop */
                break;
        }
    }
}

/*

=item long_invocation()

  long-invocation -> '.pcc_begin' '\n'
                     { '.arg' expression arg_flags }
                     ('.pcc_call'|'.nci_call'|'.meth_call')
                     { (local_declaration| '.result' target '\n') }
                     '.pcc_end' '\n'

=cut

*/
static void
long_invocation(parser_state *p) {
    int results = 1; /* flag for while loop */

    match(p, T_PCC_BEGIN);  /* '.pcc_begin '\n' ... */
    match(p, T_NEWLINE);

    while (p->curtoken == T_ARG) { /* ... { '.arg' expr [flag] '\n' } ... */
        next(p);
        expression(p);
        arg_flags(p);
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


/*

=item long_yield_statement()

  long_yield_statement -> '.pcc_begin_yield' '\n'
                          { '.yield' expr '\n' }
                          '.pcc_end_yield' '\n'

=cut

*/
static void
long_yield_statement(parser_state *p) {
    match(p, T_PCC_BEGIN_YIELD);
    match(p, T_NEWLINE);

    while (p->curtoken == T_YIELD) { /* { '.yield' expr '\n' } */
        match(p, T_YIELD);
        expression(p);
        match(p, T_NEWLINE);
    }
    match(p, T_PCC_END_YIELD); /* '.pcc_end_yield' '\n' */
    match(p, T_NEWLINE);
}

/*

=item target_statement()

  target_statement -> target '=' assignment
                    | target augmented_op expression '\n'
                    | target keylist '=' expression '\n'
                    | target '->' (stringconstant|IDENT) arguments '\n'
                    | target arguments '\n'

  augmented_op    -> '+=' | '-=' | '%=' | '/='  | '//=' | '*='  | '.='
                   | '~=' | '&=' | '|=' | '**=' | '<<=' | '>>=' | '>>>='

=cut

*/
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
        case T_CONCAT_ASSIGN:
        case T_DIVIDE_ASSIGN:
        case T_FDIVIDE_ASSIGN:
        case T_POWER_ASSIGN:
        case T_MULTIPLY_ASSIGN:
        case T_BXOR_ASSIGN:
        case T_BAND_ASSIGN:
        case T_BOR_ASSIGN:
        case T_LSHIFT_ASSIGN:
        case T_RSHIFT_ASSIGN:
        case T_LOG_RSHIFT_ASSIGN:
            next(p);
            expression(p);
            match(p, T_NEWLINE);
            break;
        case T_LBRACKET: /* target '[' keylist ']' '=' expression */
            keylist(p);
            match(p, T_ASSIGN);
            expression(p);
            match(p, T_NEWLINE);
            break;
        case T_PTR:  /* target '->' (stringc|identifier) arguments '\n' */
            next(p); /* skip '->' */
            method(p);
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




/*

=item target_list

  target_list -> '(' target {',' target } ')'

=cut

*/
static void
target_list(parser_state *p) {
    match(p, T_LPAREN);
    target(p);
    while(p->curtoken == T_COMMA) {
        next(p);
        target(p);
        /* add flags like slurpy */
        param_flags(p);
    }
    match(p, T_RPAREN);
}

/*

=item multi_result_invocation()

  multi-result-invocation -> target_list '=' (subcall | methodcall)

=cut

*/
static void
multi_result_invocation(parser_state *p) {
    target_list(p);
    match(p, T_ASSIGN);

    switch(p->curtoken) { /* TODO: REFACTOR */
        case T_IDENTIFIER: /* target_list '=' subcall */
        case T_PASM_PREG:
        case T_PREG:
            next(p);
            arguments(p);
            match(p, T_NEWLINE);
            break;
        case T_INVOCANT_IDENT: /* target_list '=' methodcall */
            methodcall(p);
            match(p, T_NEWLINE);
            break;
        default:
            syntax_error(p, 1, "sub or method invocation expected");
            break;
    }
}

/*

=item macro_expansion()

  macro_expansion -> ??

TODO: create a parse tree for each macro definition, then on macro expansion
the parse tree can be populated with the actual values (macro parameters).

=cut

*/
static void
macro_expansion(parser_state *p) {
    while (p->curtoken != T_NEWLINE)
        next(p);
    match(p, T_NEWLINE);
}


/*

=item get_results_instruction()

  get_results_instr -> '.get_results' '(' target_list ')' '\n'

=cut

*/
static void
get_results_instruction(parser_state *p) {
    match(p, T_GET_RESULTS);
    target_list(p);
    match(p, T_NEWLINE);
}

/*

=item global_assignment()

Only PMCs can be stored as globals, so only PMC registers and identifiers
are allowed. Currently no check is done on the type of the identifier

  global_assignment -> 'global' stringconstant '=' (IDENT|PREG) '\n'

=cut

*/
static void
global_assignment(parser_state *p) {
    match(p, T_GLOBAL);
    stringconstant(p);
    match(p, T_ASSIGN);

    switch (p->curtoken) {
        case T_IDENTIFIER:
        case T_PASM_PREG:
        case T_PREG:
            next(p);
            break;
        default:
            syntax_error(p, 1, "PMC object (register or identifier) expected");
            break;
    }

    match(p, T_NEWLINE);
}


/*

=item instructions()

  instruction -> {LABEL '\n'} instr

  instr -> if_statement
         | unless_statement
         | local_declaration
         | sym_declaration
         | lex_declaration
         | globalconst_definition
         | const_definition
         | open_ns
         | close_ns
         | return_statement
         | yield_statement
         | macro_expansion
         | target_statement
         | methodcall
         | long_invocation
         | long_return_statement
         | long_yield_statement
         | NULL var
         | get_results_instruction
         | global_assignment
         | '\n'

=cut

*/
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
                match(p, T_NEWLINE);
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
                target(p); /* IMCC accepts "null $I0", does that make sense?? */
                break;
            case T_GET_RESULTS: /* '.get_results' target_list */
                get_results_instruction(p);
                break;
            case T_GLOBAL:
                global_assignment(p);
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


/*

=item multi_type_list()

  multi-type-list -> '(' [multi-type {',' multi-type } ] ')'

  multi-type -> IDENT | STRINGC | keylist | type

=cut

*/
static void
multi_type_list(parser_state *p) {
    int wantmore = 1;

    match(p, T_LPAREN);
    while (wantmore) {
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

/*

=item sub_flags()

  sub_flags -> [sub_flag { [','] sub_flag } ]

  sub_flag  -> ':anon'
             | ':init'
             | ':load'
             | ':main'
             | ':method'
             | ':lex'
             | ':outer' '(' stringconstant ')'
             | ':vtable' '(' stringconstant ')'
             | ':multi' multi-type-list
             | ':postcomp'
             | ':immediate'

=cut

*/
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
            case T_METHOD_FLAG:
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




/*

=item parameters()

  parameters -> { '.param (register | type IDENT) [param_flag] '\n' }

=cut

*/
static void
parameters(parser_state *p) {
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

/*

=item sub_definition()

  sub_definition -> '.sub' (IDENT | stringc) '\n' parameters body '.end'

=cut

*/
static void
sub_definition(parser_state *p) {
    match(p, T_SUB);

    if (p->curtoken == T_IDENTIFIER) match(p, T_IDENTIFIER);
    else stringconstant(p);

    sub_flags(p);

    match(p, T_NEWLINE);
    parameters(p);
    instructions(p);
    match(p, T_END);
}

/*

=item emit_block()

  emit_block -> '.emit' '\n' {pasm_instruction} '.eom'

=cut

*/
static void
emit_block(parser_state *p) {
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
    if (p->curtoken == T_NEWLINE) next(p);

    match(p, T_EOM);
}

/*

=item macro_parameters()

  macro_parameters -> [ '(' [ id {',' id} ] ')' ]

=cut

*/
static void
macro_parameters(parser_state *p) {
    if (p->curtoken == T_LPAREN) next(p);
    else return; /* no parameters apparently */

    while (p->curtoken == T_IDENTIFIER) {
        next(p);
        if (p->curtoken == T_COMMA) next(p);
        else break; /* no comma, end of param list */
    }
    match(p, T_RPAREN);
}



/*

=item macro_definition()

  '.macro' IDENT parameters '\n' macro_body '.endm'

=cut

*/
static void
macro_definition(parser_state *p) {
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

/*

=item include()

calls include_file() in the lexer. Then, the first token is initialized
by calling next(); then the TOP() routine is invoked to start parsing
the included file. After having parsed that file, continue the current file
by calling the next token.

  include -> '.include' stringconstant

=cut

*/
static void
include(parser_state *p) {
    next(p); /* skip '.include '*/

    /* only check, don't skip filename */
    if (p->curtoken != T_DOUBLE_QUOTED_STRING && p->curtoken != T_SINGLE_QUOTED_STRING) {
            syntax_error(p, 1, "string constant expected");
    }
    else {
        /* read the file to be included and get first token of the included file */
        open_include_file(p->lexer);
        next(p);

        TOP(p); /* go parse it */
        /* switch back to other file that included the one above */
        close_include_file(p->lexer);
        next(p); /* get next token from this file */
    }

}

/*

=item pragma()

  pragma -> '.pragma' 'n_operators' INTC

=cut

*/

static void
pragma(parser_state *p) {
    match(p, T_PRAGMA);
    match(p, T_N_OPERATORS);
    match(p, T_INTEGER_CONSTANT);
}

/*

=item hll_specifier()

  hll_specifier -> '.HLL' stringconstant ',' stringconstant

=cut

*/
static void
hll_specifier(parser_state *p) {
    match(p, T_HLL);
    stringconstant(p);
    match(p, T_COMMA);
    stringconstant(p);
}

/*

=item hll_mapping()

  hll_mapping -> '.HLL_map' INTC ',' INTC

=cut

*/
static void
hll_mapping(parser_state *p) {
    match(p, T_HLL_MAP);
    match(p, T_INTEGER_CONSTANT);
    match(p, T_COMMA);
    match(p, T_INTEGER_CONSTANT);
}

/*

=item namespace_declaration()

  namespace_declaration -> '.namespace' [ '[' stringc { (','|';') stringc ']' ]

=cut

*/
static void
namespace_declaration(parser_state *p) {
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

/*

=item loadlib()

  loadlib -> '.loadlib' stringconstant

=cut

*/
static void
loadlib(parser_state *p) {
    match(p, T_LOADLIB);
    stringconstant(p);
}

/*

=item compilation_unit()

  compilation_unit -> global_definition
                    | sub_definition
                    | const_definition
                    | emit_block
                    | include
                    | macro_definition
                    | pragma
                    | loadlib
                    | namespace_declaration
                    | hll_specifier
                    | hll_mapping

=cut

*/
static void
compilation_unit(parser_state *p) {
    switch (p->curtoken) {
        case T_GLOBAL_DECL: /* compilation_unit -> global_definition */
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


/*

=item program()

  program -> {'\n'} compilation_unit { '\n' compilation_unit }

=cut

*/
static void
program(parser_state *p) {
    /* the file may have some initial newlines; eat them */
    if (p->curtoken == T_NEWLINE) next(p);

    compilation_unit(p);

    while (p->curtoken != T_EOF ) {
        match(p, T_NEWLINE);
        compilation_unit(p);
    }
}

/*

=item TOP()

Entry point of the parser

  TOP -> program EOF

=cut

*/
void
TOP(parser_state *p) {
    /* file -> program EOF */
    program(p);

    /* do NOT match T_EOF; match() tries to read the next token instead, do a manual check. */
    if (p->curtoken != T_EOF) {
        syntax_error(p, 3, "end of file expected in file '", get_current_file(p->lexer), "'\n");
    }
}


/*

=back

=cut

*/
