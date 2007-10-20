/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*

=head1 NAME

pir.y

=head1 DESCRIPTION

This is a complete rewrite of the parser for the PIR language.

=cut

*/

%{

#include <stdio.h>
#include <stdlib.h>

#include "pirparser.h"
#include "pircompiler.h"

/* forward declaration */


struct lexer_state;

extern int yyerror(struct lexer_state *lexer,
                   char *message);


extern int yylex(YYSTYPE *yylval,
                 struct lexer_state *lexer);




/* enable debugging of generated parser */
#define YYDEBUG         1

/* enable slightly more helpful error messages */
#define YYERROR_VERBOSE 1

/* HEADERIZER HFILE: compilers/pirc/new/pir.h */
/* HEADERIZER BEGIN: static */
/* HEADERIZER HFILE: none */
/* HEADERIZER STOP */

%}


%token TK_NL TK_LABEL TK_DOTDOT TK_HEREDOC TK_ENDM

%token TK_HLL TK_HLL_MAP TK_EMIT TK_EOM
       TK_N_OPERATORS TK_PRAGMA TK_LOADLIB

%token TK_SUB ".sub"
       TK_END ".end"
       TK_PARAM TK_LEX TK_LOCAL
       TK_NAMESPACE TK_ENDNAMESPACE
       TK_INVOCANT TK_METH_CALL TK_GLOBALCONST TK_CONST
       TK_RETURN TK_YIELD
       TK_PCC_BEGIN_YIELD TK_PCC_END_YIELD
       TK_PCC_BEGIN_RETURN TK_PCC_END_RETURN
       TK_PCC_BEGIN TK_PCC_END TK_GET_RESULTS
       TK_PCC_CALL TK_ARG TK_RESULT TK_NCI_CALL

%token TK_IDENT TK_STRINGC TK_INTC TK_NUMC
       TK_PASM_PREG TK_PASM_NREG TK_PASM_SREG TK_PASM_IREG
       TK_SYM_PREG TK_SYM_NREG TK_SYM_SREG TK_SYM_IREG
       TK_PARROT_OP

%token TK_INT TK_NUM TK_PMC TK_STRING TK_NULL
       TK_IF TK_UNLESS TK_GOTO TK_NEW

%token TK_ARROW TK_NE TK_EQ TK_LT TK_LE TK_GT TK_GE
       TK_ASSIGN_USHIFT TK_ASSIGN_RSHIFT TK_ASSIGN_LSHIFT
       TK_USHIFT TK_RSHIFT TK_LSHIFT
       TK_FDIV TK_OR TK_AND TK_XOR TK_CONC

%token TK_ASSIGN_INC TK_ASSIGN_DEC TK_ASSIGN_MUL
       TK_ASSIGN_MOD TK_ASSIGN_POW TK_ASSIGN_DIV
       TK_ASSIGN_BOR TK_ASSIGN_BAND TK_ASSIGN_FDIV
       TK_ASSIGN_BNOT TK_ASSIGN_CONC

%token TK_FLAG_INIT TK_FLAG_LOAD TK_FLAG_MAIN
       TK_FLAG_ANON TK_FLAG_METHOD TK_FLAG_OUTER
       TK_FLAG_VTABLE TK_FLAG_LEX TK_FLAG_MULTI
       TK_FLAG_POSTCOMP TK_FLAG_IMMEDIATE

%token TK_FLAG_UNIQUE_REG TK_FLAG_NAMED TK_FLAG_SLURPY
       TK_FLAG_FLAT TK_FLAG_OPTIONAL TK_FLAG_OPT_FLAG



%union {
    double dval;
    int    ival;
    char  *sval;
}

/* a pure parser */
%pure_parser

%parse-param {struct lexer_state *lexer}
%lex-param   {struct lexer_state *lexer}


%start program

%%

/* Compilation Units */

program: opt_nl
         compilation_units
         opt_nl

       ;

opt_nl: /* empty */
      | TK_NL
      ;

compilation_units: compilation_unit
                 | compilation_units TK_NL compilation_unit
                 ;

compilation_unit: sub_definition
                | TK_CONST const_tail
                | namespace_declaration
                | emit_block
                | hll_specifier
                | hll_mapping
                | loadlib
                | pir_pragma
                ;

pir_pragma: TK_PRAGMA TK_N_OPERATORS TK_INTC
          ;

loadlib: TK_LOADLIB TK_STRINGC
       ;

/* HLL stuff */

hll_specifier: TK_HLL TK_STRINGC ',' TK_STRINGC
             ;

hll_mapping: TK_HLL_MAP TK_STRINGC ',' TK_STRINGC
           ;

/* Emit blocks */

emit_block: TK_EMIT TK_NL
            pasm_instructions
            TK_EOM
          ;


pasm_instructions: /* empty */
                 | pasm_instructions pasm_instruction
                 ;

pasm_instruction: TK_LABEL TK_NL
                | TK_LABEL TK_PARROT_OP TK_NL
                | TK_PARROT_OP TK_NL
                ;

/* Namespaces */
namespace_declaration: TK_NAMESPACE
                     | TK_NAMESPACE '[' namespace_id ']'
                     ;

namespace_id: TK_STRINGC
            | namespace_id separator TK_STRINGC
            ;

/* Sub definition */

sub_definition: ".sub" sub_id sub_flags TK_NL
                parameters
                instructions
                ".end"
                ;

sub_id: TK_IDENT
      | TK_STRINGC
      ;

sub_flags: /* empty */
         | sub_flags sub_flag
         ;

sub_flag: TK_FLAG_ANON
        | TK_FLAG_INIT
        | TK_FLAG_LOAD
        | TK_FLAG_MAIN
        | TK_FLAG_METHOD
        | TK_FLAG_LEX
        | TK_FLAG_OUTER '(' sub_id ')'
        | TK_FLAG_VTABLE paren_string
        | TK_FLAG_MULTI '(' multi_type_list ')'
        | TK_FLAG_POSTCOMP
        | TK_FLAG_IMMEDIATE
        ;


multi_type_list: /* empty */
           | multi_type_list ',' multi_type
           ;

multi_type: TK_IDENT
          | TK_STRINGC
          | keylist
          | type
          ;

parameters: /* empty */
          | parameters parameter
          ;

parameter: TK_PARAM param_def param_flags TK_NL
         ;

param_def: type TK_IDENT
         | type TK_STRINGC TK_ARROW TK_IDENT
         ;


/* Instructions */


instructions: /* empty */
            | instructions labeled_instruction
            ;

labeled_instruction: TK_LABEL TK_NL
                   | TK_LABEL instruction
                   | instruction
                   ;

instruction: if_statement
           | unless_statement
           | goto_statement
           | local_declaration
           | lex_declaration
           | const_declaration
           | namespace_statement
           | return_statement
           | yield_statement
           | invocation_statement
           | assignment_statement
           | methodcall_statement
           | null_statement
           | parrot_instruction
           | error TK_NL { yyerrok; }
           ;

null_statement: TK_NULL TK_PASM_PREG TK_NL
              | TK_NULL TK_SYM_PREG TK_NL
              | TK_NULL TK_IDENT TK_NL
              ;

methodcall_statement: methodcall TK_NL
                    ;

assignment_statement: target assignment_tail TK_NL
                    ;

assignment_tail: augmented_op expression
               | keylist '=' expression
               | '=' assignment_expression
               ;

assignment_expression: unop expression
                     | expression
                     | expression binop expression
                     | target keylist
                     | simple_invocation
                     | TK_STRINGC arguments  /* refactor 2/3 */
                     | methodcall            /* refactor 3/3 */
                     | TK_NULL
                     | TK_NEW TK_STRINGC /* fix other variants */
                     | parrot_instruction
                     ;


simple_invocation: invokable arguments
                 ;

unop: '-'
    | '!'
    | '~'
    ;

binop: '+'
     | '-'
     | '/'
     | '*'
     | '%'
     | TK_CONC
     ;


augmented_op: TK_ASSIGN_INC
            | TK_ASSIGN_DEC
            | TK_ASSIGN_MUL
            | TK_ASSIGN_POW
            | TK_ASSIGN_DIV
            | TK_ASSIGN_FDIV
            | TK_ASSIGN_BOR
            | TK_ASSIGN_BAND
            | TK_ASSIGN_BNOT
            | TK_ASSIGN_CONC
            | TK_ASSIGN_LSHIFT
            | TK_ASSIGN_RSHIFT
            | TK_ASSIGN_USHIFT
            ;

keylist: '[' keys ']'
       ;

keys: key
    | keys separator key
    ;

key: expression
   | expression TK_DOTDOT
   | expression TK_DOTDOT expression
   | TK_DOTDOT expression
   ;

separator: ';'
         | ','
         ;

parrot_instruction: TK_PARROT_OP /* todo: arguments for op */ TK_NL
                  ;

if_statement: TK_IF condition goto_statement
            ;

unless_statement: TK_UNLESS condition goto_statement
                ;

goto_statement: TK_GOTO TK_IDENT TK_NL
       ;

local_declaration: TK_LOCAL type local_id_list TK_NL
                 ;

local_id_list: local_id
             | local_id_list ',' local_id
             ;

local_id: TK_IDENT
        | TK_IDENT TK_FLAG_UNIQUE_REG
        ;

lex_declaration: TK_LEX TK_STRINGC ',' target TK_NL
               ;

invocation_statement: long_invocation_statement
                    | short_invocation_statement
                    ;

long_invocation_statement: TK_PCC_BEGIN TK_NL
                           long_arguments
                           long_invocation TK_NL
                           long_results
                           TK_PCC_END TK_NL
                         ;

long_arguments: /* empty */
              | long_arguments long_argument
              ;

long_argument: TK_ARG expression arg_flags TK_NL
             ;

long_invocation: TK_PCC_CALL invokable
               | TK_NCI_CALL invokable
               | TK_INVOCANT invokable TK_NL
                 TK_METH_CALL method
               ;

long_results: /* empty */
            | long_results long_result
            ;

long_result: TK_RESULT target param_flags TK_NL
           | local_declaration
           ;

short_invocation_statement: '(' target_list ')' '=' invocation_expression TK_NL
                          | TK_STRINGC arguments TK_NL
                          | simple_invocation TK_NL
                          ;

target_list: /* empty */
           | return_target_list
           ;

return_target_list: return_target
                  | return_target_list ',' return_target
                  ;

return_target: target param_flags
             ;

param_flags: /* empty */
           | param_flags param_flag
           ;

param_flag: TK_FLAG_OPTIONAL
          | TK_FLAG_OPT_FLAG
          | TK_FLAG_SLURPY
          | TK_FLAG_NAMED opt_paren_string
          | TK_FLAG_UNIQUE_REG
          ;

invocation_expression: simple_invocation
                     | methodcall
                     ;

invokable: TK_SYM_PREG
         | TK_PASM_PREG
         | TK_IDENT
         ;

methodcall: invokable '.' method arguments
          ;

method: TK_IDENT
      | TK_STRINGC
      | TK_PASM_PREG
      | TK_SYM_PREG
      ;

namespace_statement: TK_NAMESPACE TK_IDENT TK_NL
                   | TK_ENDNAMESPACE TK_IDENT TK_NL
                   ;

return_statement: short_return_statement
                | long_return_statement
                ;

long_return_statement: TK_PCC_BEGIN_RETURN TK_NL
                       return_expressions
                       TK_PCC_END_RETURN TK_NL
                     ;


yield_statement: short_yield_statement
               | long_yield_statement
               ;

short_return_statement: TK_RETURN arguments TK_NL
                      | TK_RETURN invocation_expression TK_NL
                      ;

short_yield_statement: TK_YIELD arguments TK_NL
                     ;

arguments: '(' opt_arguments_list ')'
         ;

opt_arguments_list: /* empty */
                  | arguments_list
                  ;

arguments_list: argument
              | arguments_list ',' argument
              ;

argument: expression arg_flags
        | TK_STRINGC TK_ARROW expression
        ;

long_yield_statement: TK_PCC_BEGIN_YIELD TK_NL
                      yield_expressions
                      TK_PCC_END_YIELD TK_NL
                    ;

yield_expressions: /* empty */
                 | yield_expressions yield_expression
                 ;

yield_expression: TK_YIELD expression arg_flags TK_NL
                ;

return_expressions: /* empty */
                  | return_expressions return_expression
                  ;

return_expression: TK_RETURN expression arg_flags TK_NL
                 ;

arg_flags: /* empty */
         | arg_flags arg_flag
         ;

arg_flag: TK_FLAG_FLAT
        | TK_FLAG_NAMED opt_paren_string
        ;

opt_paren_string: /* empty */
                | paren_string
                ;

paren_string: '(' TK_STRINGC ')'
            ;

const_declaration: TK_GLOBALCONST const_tail TK_NL
                 | TK_CONST const_tail TK_NL
                 ;

const_tail: TK_INT TK_IDENT '=' TK_INTC
          | TK_NUM TK_IDENT '=' TK_NUMC
          | TK_PMC TK_IDENT '=' TK_STRINGC
          | TK_STRING TK_IDENT '=' TK_STRINGC
          ;

condition: TK_NULL expression
         | expression
         | conditional_expression
         ;

conditional_expression: expression rel_op expression

expression: TK_IDENT
          | constant
          | reg
          ;

constant: TK_STRINGC { fprintf(stderr, "TK_STRINGC: [%s]\n", yylval.sval); }
        | TK_INTC
        | TK_NUMC
        ;

reg: TK_SYM_PREG
   | TK_SYM_NREG
   | TK_SYM_IREG
   | TK_SYM_SREG
   | pasm_reg
   ;

pasm_reg: TK_PASM_PREG
        | TK_PASM_NREG
        | TK_PASM_IREG
        | TK_PASM_SREG
        ;

rel_op: TK_NE
      | TK_EQ
      | TK_LT
      | TK_LE
      | TK_GE
      | TK_GT
      ;

type: TK_INT
    | TK_NUM
    | TK_PMC
    | TK_STRING
    ;

target: reg
      | TK_IDENT
      ;

%%

/* the file being parsed */
extern FILE *yyin; /* CAN WE KEEP USING THIS IN A PURE-PARSER? */

/* the global buffer where the current token's characters are stored */
extern char *yytext; /* TODO: REMOVE THIS GLOBAL */


#include <string.h>

/*

Pre-process the file only. Don't do any analysis.

*/
static void
do_pre_process(struct lexer_state *lexer) {
    int token;
    YYSTYPE val;

    do {
        token = yylex(&val, lexer);
        fprintf(stderr, "%s ", yytext);

        /* if we just printed a newline character, the trailing space should be removed:
         * do a carriage-return
         */
        if (strchr(yytext, '\n') != NULL)
            fprintf(stderr, "\r");
    }
    while (token);
}

/*
 * Main compiler driver.
 */
int
main(int argc, char *argv[]) {

    struct lexer_state *lexer = NULL;
    int parse_errors;
    int pre_process;

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        exit(1);
    }

    /* skip program name */
    argc--;
    argv++;

    /* very basic argument handling; I'm too lazy to check out
     * the standard funtion for that, right now. This is a TODO. */
    while (argc > 0 && argv[0][0] == '-') {
        switch (argv[0][1]) {
            case 'E':
                pre_process = 1;
                break;
            default:
                fprintf(stderr, "Unknown option: '%c'\n", argv[0][1]);
                break;
        }
        /* goto next command line argument */
        argv++;
        argc--;
    }

    if (argc < 1) {
        fprintf(stderr, "No input file specified\n");
        exit(1);
    }

    /* done handling arguments, open the file */
    yyin = fopen(argv[0], "r");
    if (yyin == NULL) {
        fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
        exit(1);
    }

    /* yydebug = 1;
    */
    lexer = new_lexer();
    if (pre_process) {
        do_pre_process(lexer);
    }
    else {
        yyparse(lexer);
        parse_errors = get_parse_errors(lexer);

        if (parse_errors == 0) {
            fprintf(stderr, "Parse successful!\n");
        }
        else {
            fprintf(stderr, "There %s %d %s\n", parse_errors > 1 ? "were" :
                    "was", parse_errors, parse_errors > 1 ? "errors" : "error");
        }
    }

    /* close file after processing */
    fclose(yyin);

    return 0;
}


int
yyerror(struct lexer_state *lexer, char *message) {

    parse_error(lexer);


    fprintf(stderr, "\nError (line %d): %s at ['%s']\n\n", get_line_nr(lexer), message, yytext);

    /*
    fprintf(stderr, "first_line: %d\nfirst_column: %d\nlast_line: %d\nlast_column: %d\n",
            locp->first_line, locp->first_column, locp->last_line, locp->last_column);
            */
    return 0;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


