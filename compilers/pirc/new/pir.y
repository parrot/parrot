%{

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

#include <stdio.h>
#include <stdlib.h>

#include "pirparser.h"
#include "pircompiler.h"

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval,  yyscan_t yyscanner)

#include "pirlexer.h"




/* declare yylex() */
extern YY_DECL;

extern int yyerror(yyscan_t yyscanner, struct lexer_state *lexer, char *message);

extern struct lexer_state *new_lexer(char *filename);





/* enable debugging of generated parser */
#define YYDEBUG         1

/* enable slightly more helpful error messages */
#define YYERROR_VERBOSE 1

/* keep MSVC happy */
#ifndef YYENABLE_NLS
#  define YYENABLE_NLS 0
#endif

/* keep MSVC happy */
#ifndef YYLTYPE_IS_TRIVIAL
#  define YYLTYPE_IS_TRIVIAL 0
#endif




%}

%token TK_MACRO_PARAM

%token TK_LABEL         "label"
       TK_DOTDOT        ".."
       TK_ENDM          ".endm"
       TK_NL            "\n"

%token TK_HLL           ".HLL"
       TK_HLL_MAP       ".HLL_map"
       TK_EMIT          ".emit"
       TK_EOM           ".eom"
       TK_N_OPERATORS   "n_operators"
       TK_PRAGMA        ".pragma"
       TK_LOADLIB       ".loadlib"

%token TK_SUB           ".sub"
       TK_END           ".end"
       TK_PARAM         ".param"
       TK_LEX           ".lex"
       TK_LOCAL         ".local"
       TK_NAMESPACE     ".namespace"
       TK_ENDNAMESPACE  ".endnamespace"
       TK_INVOCANT      ".invocant"
       TK_METH_CALL     ".meth_call"
       TK_GLOBALCONST   ".globalconst"
       TK_CONST         ".const"
       TK_RETURN        ".return"
       TK_YIELD         ".yield"
       TK_PCC_BEGIN_YIELD   ".pcc_begin_yield"
       TK_PCC_END_YIELD     ".pcc_end_yield"
       TK_PCC_BEGIN_RETURN  ".pcc_begin_return"
       TK_PCC_END_RETURN    ".pcc_end_return"
       TK_PCC_BEGIN     ".pcc_begin"
       TK_PCC_END       ".pcc_end"
       TK_GET_RESULTS   ".get_results"
       TK_PCC_CALL      ".pcc_call"
       TK_ARG           ".arg"
       TK_RESULT        ".result"
       TK_NCI_CALL      ".nci_call"

%token TK_IDENT         "identifier"
       TK_STRINGC       "string constant"
       TK_INTC          "integer constant"
       TK_NUMC          "number constant"
       TK_PASM_PREG     "PMC register"
       TK_PASM_NREG     "Number register"
       TK_PASM_SREG     "String register"
       TK_PASM_IREG     "Integer register"
       TK_SYM_PREG      "Symbolic PMC register"
       TK_SYM_NREG      "Symbolic number register"
       TK_SYM_SREG      "Symbolic string register"
       TK_SYM_IREG      "Symbolic integer register"
       TK_PARROT_OP     "parrot op"

%token TK_INT       "int"
       TK_NUM       "num"
       TK_PMC       "pmc"
       TK_STRING    "string"
       TK_IF        "if"
       TK_UNLESS    "unless"
       TK_GOTO      "goto"

%token TK_ARROW     "=>"
       TK_NE        "!="
       TK_EQ        "=="
       TK_LT        "<"
       TK_LE        "<="
       TK_GT        ">"
       TK_GE        ">="

       TK_USHIFT    ">>>"
       TK_RSHIFT    ">>"
       TK_LSHIFT    "<<"
       TK_FDIV      "//"
       TK_OR        "||"
       TK_AND       "&&"
       TK_XOR       "^"
       TK_CONC      "."
       TK_ASSIGN_USHIFT ">>>="
       TK_ASSIGN_RSHIFT ">>="
       TK_ASSIGN_LSHIFT "<<="

%token TK_ASSIGN_INC    "+="
       TK_ASSIGN_DEC    "-="
       TK_ASSIGN_MUL    "*="
       TK_ASSIGN_MOD    "%="
       TK_ASSIGN_POW    "**="
       TK_ASSIGN_DIV    "/="
       TK_ASSIGN_BOR    "|="
       TK_ASSIGN_BAND   "&="
       TK_ASSIGN_FDIV   "//="
       TK_ASSIGN_BNOT   "~="
       TK_ASSIGN_CONC   ".="

%token TK_FLAG_INIT         ":init"
       TK_FLAG_LOAD         ":load"
       TK_FLAG_MAIN         ":main"
       TK_FLAG_ANON         ":anon"
       TK_FLAG_METHOD       ":method"
       TK_FLAG_OUTER        ":outer"
       TK_FLAG_VTABLE       ":vtable"
       TK_FLAG_LEX          ":lex"
       TK_FLAG_MULTI        ":multi"
       TK_FLAG_POSTCOMP     ":postcomp"
       TK_FLAG_IMMEDIATE    ":immediate"

%token TK_FLAG_UNIQUE_REG   ":unique_reg"
       TK_FLAG_NAMED        ":named"
       TK_FLAG_SLURPY       ":slurpy"
       TK_FLAG_FLAT         ":flat"
       TK_FLAG_OPTIONAL     ":optional"
       TK_FLAG_OPT_FLAG     ":opt_flag"


/*
 *
 */
%union {
    double dval;
    int    ival;
    char  *sval;
}

/* a pure parser */
%pure-parser

/* name of generated parser */
%output="pirparser.c"

/* move around a yyscan_t object */
%parse-param {yyscan_t yyscanner}
%lex-param   {yyscan_t yyscanner}

/* The parser is invoked with this extra parameter */
%parse-param {struct lexer_state * lexer}

/* Note: don't declare the lexer_state argument as a %lex-param,
 * this object is stored in the yyscan_t structure, and can be
 * accessed through yy{set,get}_extra().
 */


/* Top-level rule */
%start program



%%

/* Compilation Units */

program: opt_nl
         compilation_units
         opt_nl
       ;

opt_nl: /* empty */
      | "\n"
      ;

compilation_units: compilation_unit
                 | compilation_units "\n" compilation_unit
                 ;

compilation_unit: sub_definition
                | const_declaration
                | namespace_declaration
                | emit_block
                | hll_specifier
                | hll_mapping
                | loadlib
                | pir_pragma
                ;

pir_pragma: ".pragma" "n_operators" TK_INTC
          ;

loadlib: ".loadlib" TK_STRINGC
       ;

/* HLL stuff */

hll_specifier: ".HLL" TK_STRINGC ',' TK_STRINGC
             ;

hll_mapping: ".HLL_map" TK_STRINGC ',' TK_STRINGC
           ;

/* Emit blocks */

emit_block: ".emit" "\n"
            pasm_instructions
            ".eom"
          ;


pasm_instructions: /* empty */
                 | pasm_instructions pasm_instruction
                 ;

pasm_instruction: TK_LABEL "\n"
                | TK_LABEL parrot_statement
                | parrot_statement
                ;

parrot_statement: TK_PARROT_OP opt_parrot_op_args "\n"
                ;

/* Namespaces */

namespace_declaration: ".namespace"
                     | ".namespace" '[' namespace_id ']'
                     ;

namespace_id: TK_STRINGC
            | namespace_id separator TK_STRINGC
            ;

/* Sub definition */

sub_definition: ".sub" sub_id sub_flags "\n"
                parameters
                instructions
                ".end"
                ;

sub_id: TK_IDENT /* is TK_PARROT_OP allowed too? in that case, <identifier> */
      | TK_STRINGC
      ;

sub_flags: /* empty */
         | sub_flags sub_flag
         ;

sub_flag: ":anon"
        | ":init"
        | ":load"
        | ":main"
        | ":method"
        | ":lex"
        | ":outer" '(' sub_id ')'
        | ":vtable" opt_paren_string
        | ":multi" '(' multi_type_list ')'
        | ":postcomp"
        | ":immediate"
        ;

multi_type_list: /* empty */
               | multi_type_list ',' multi_type
               ;

multi_type: identifier
          | TK_STRINGC
          | keylist
          | type
          ;

parameters: /* empty */
          | parameters parameter
          ;

parameter: ".param" param_def param_flags "\n"
         ;

param_def: type identifier
         | type TK_STRINGC "=>" identifier
         ;

/* Instructions */


instructions: /* empty */
            | instructions labeled_instruction
            ;


labeled_instruction: TK_LABEL "\n"
                   | TK_LABEL instruction
                   | instruction
                   ;

instruction: if_statement
           | unless_statement
           | goto_statement
           | local_declaration
           | lex_declaration
           | const_decl_statement
           | namespace_statement
           | return_statement
           | yield_statement
           | invocation_statement
           | assignment_statement
           | methodcall_statement
           | parrot_statement
           | getresults_statement
           | error "\n" { yyerrok; }
           ;

getresults_statement: ".get_results" '(' opt_target_list ')' "\n"
                    ;

methodcall_statement: methodcall "\n"
                    ;

assignment_statement: target assignment_tail "\n"
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
                     | TK_STRINGC arguments
                     | methodcall
                     | parrot_instruction
                     ;


parrot_instruction: TK_PARROT_OP parrot_op_args
                  ;

opt_parrot_op_args: /* empty */
                  | parrot_op_args
                  ;

parrot_op_args: parrot_op_arg
              | parrot_op_args ',' parrot_op_arg
              ;

parrot_op_arg: expression
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
     | "."
     ;


augmented_op: "+="
            | "-="
            | "*="
            | "**="
            | "/="
            | "//="
            | "|="
            | "&="
            | "~="
            | ".="
            | ">>="
            | "<<="
            | ">>>="
            ;

keylist: '[' keys ']'
       ;

keys: key
    | keys separator key
    ;

key: expression
   | expression ".."
   | expression ".." expression
   | ".." expression
   ;

separator: ';'
         | ','
         ;


if_statement: "if" condition goto_statement
            ;

unless_statement: "unless" condition goto_statement
                ;

goto_statement: "goto" identifier "\n"
              ;

local_declaration: ".local" type local_id_list "\n"
                 ;

local_id_list: local_id
             | local_id_list ',' local_id
             ;

local_id: identifier
        | identifier ":unique_reg"
        ;

identifier: TK_IDENT
          | TK_PARROT_OP
          ;

lex_declaration: ".lex" TK_STRINGC ',' target "\n"
               ;

invocation_statement: long_invocation_statement
                    | short_invocation_statement
                    ;

long_invocation_statement: ".pcc_begin" "\n"
                           long_arguments
                           long_invocation "\n"
                           long_results
                           ".pcc_end" "\n"
                         ;

long_arguments: /* empty */
              | long_arguments long_argument
              ;

long_argument: ".arg" expression arg_flags "\n"
             ;

long_invocation: ".pcc_call" invokable
               | ".nci_call" invokable
               | ".invocant" invokable "\n"
                 ".meth_call" method
               ;

long_results: /* empty */
            | long_results long_result
            ;

long_result: ".result" target param_flags "\n"
           | local_declaration
           ;

short_invocation_statement: '(' opt_target_list ')' '=' invocation_expression "\n"
                          | TK_STRINGC arguments "\n"
                          | simple_invocation "\n"
                          ;

opt_target_list: /* empty */
               | target_list
               ;

target_list: result_target
           | target_list ',' result_target
           ;

result_target: target param_flags
             ;

param_flags: /* empty */
           | param_flags param_flag
           ;

param_flag: ":optional"
          | ":opt_flag"
          | ":slurpy"
          | ":named" opt_paren_string
          | ":unique_reg"
          ;

invocation_expression: simple_invocation
                     | methodcall
                     ;

invokable: TK_SYM_PREG
         | TK_PASM_PREG
         | identifier
         ;

methodcall: invokable '.' method arguments
          ;

method: identifier
      | TK_STRINGC
      | TK_PASM_PREG
      | TK_SYM_PREG
      ;

namespace_statement: ".namespace" identifier "\n"
                   | ".endnamespace" identifier "\n"
                   ;

return_statement: short_return_statement
                | long_return_statement
                ;

long_return_statement: ".pcc_begin_return" "\n"
                       return_expressions
                       ".pcc_end_return" "\n"
                     ;


yield_statement: short_yield_statement
               | long_yield_statement
               ;

short_return_statement: ".return" arguments "\n"
                      | ".return" invocation_expression "\n"
                      ;

short_yield_statement: ".yield" arguments "\n"
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
        | TK_STRINGC "=>" expression
        ;

long_yield_statement: ".pcc_begin_yield" "\n"
                      yield_expressions
                      ".pcc_end_yield" "\n"
                    ;

yield_expressions: /* empty */
                 | yield_expressions yield_expression
                 ;

yield_expression: ".yield" expression arg_flags "\n"
                ;

return_expressions: /* empty */
                  | return_expressions return_expression
                  ;

return_expression: ".return" expression arg_flags "\n"
                 ;

arg_flags: /* empty */
         | arg_flags arg_flag
         ;

arg_flag: ":flat"
        | ":named" opt_paren_string
        ;

opt_paren_string: /* empty */
                | paren_string
                ;

paren_string: '(' TK_STRINGC ')'
            ;

const_declaration: ".const" const_tail
                 ;

const_decl_statement: const_declaration "\n"
                    | ".globalconst" const_tail "\n"
                    ;

const_tail: "int" identifier '=' TK_INTC
          | "num" identifier '=' TK_NUMC
          | "pmc" identifier '=' TK_STRINGC
          | "string" identifier '=' TK_STRINGC
          ;

condition: "null" expression
         | expression
         | conditional_expression
         ;

conditional_expression: expression rel_op expression


expression: target
          | constant
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

rel_op: "!="
      | "=="
      | "<"
      | "<="
      | ">="
      | ">"
      ;

type: "int"
    | "num"
    | "pmc"
    | "string"
    ;

target: reg
      | identifier
      ;

%%

#include <string.h>
#include <assert.h>


/*

wrapper function for yyerror.

*/
void
syntax_error(yyscan_t yyscanner, struct lexer_state *lexer, char *message) {
    yyerror(yyscanner, lexer, message);
}


/*

Pre-process the file only. Don't do any analysis.

*/
static void
do_pre_process(yyscan_t yyscanner, struct lexer_state *lexer) {
    int token;
    YYSTYPE val;

    do {

        token = yylex(&val, yyscanner);

        fprintf(stderr, "%s ", yyget_text(yyscanner));

        /* if we just printed a newline character, the trailing space should be removed:
         * do a carriage-return
         */
        if (strchr(yyget_text(yyscanner), '\n') != NULL)
            fprintf(stderr, "\r");
    }
    while (token > 0);
}

/*

*/
static void
print_help(char const * const program_name) {

    fprintf(stderr, "Usage: %s [options] <files>\n", program_name);
    fprintf(stderr, "Options:\n\n");
    fprintf(stderr, "  -E   pre-process\n");
    fprintf(stderr, "  -d   show debug messages of parser\n");
    fprintf(stderr, "  -h   show this help message\n");

}

/*
 * Main compiler driver.
 */
int
main(int argc, char *argv[]) {

    char const * const program_name = argv[0];
    int total_errors  = 0;
    int pre_process   = 0;
    yyscan_t yyscanner;

    if (argc < 2) {
        print_help(program_name);
        exit(EXIT_FAILURE);
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
            /* Only allow for debug flag if the generated parser supports it */
#ifdef YYDEBUG
            case 'd':
                yydebug = 1;
                break;
#endif
            case 'h':
                print_help(program_name);
                exit(EXIT_SUCCESS); /* asking for help doesn't make you a failure */
                /* break; */
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
        exit(EXIT_FAILURE);
    }


    /* compile all files specified on the command line */
    while (argc > 0) {
        FILE *infile = NULL;
        struct lexer_state *lexer = NULL;
        int parse_errors = 0;

        fprintf(stderr, "Processing file '%s'\n", argv[0]);

        /* done handling arguments, open the file */
        infile = fopen(argv[0], "r");

        if (infile == NULL) {
            fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
            exit(EXIT_FAILURE);
        }

        /* create a yyscan_t object */
        yylex_init(&yyscanner);
        /* set the input file */
        yyset_in(infile, yyscanner);

        /* set the extra parameter in the yyscan_t structure */
        lexer = new_lexer(argv[0]);
        yyset_extra(lexer, yyscanner);


        if (pre_process) {
            fprintf(stderr, "pre-processing %s\n", argv[0]);
            do_pre_process(yyscanner, lexer);
        }
        else {
            fprintf(stderr, "compiling %s\n", argv[0]);
            yyparse(yyscanner, lexer);

            /* get parse errors for this file */
            parse_errors = get_parse_errors(lexer);
            /* update total error count */
            total_errors += parse_errors;

            if (parse_errors == 0) {
                fprintf(stderr, "Parse successful!\n");
            }
            else {
                fprintf(stderr, "There %s %d %s in file '%s'\n", parse_errors > 1 ? "were" :
                        "was", parse_errors, parse_errors > 1 ? "errors" : "error",
                        get_current_file(lexer));
            }
        }

        /* clean up after playing */
        yylex_destroy(yyscanner);

        argc--;
        argv++;
    }

    if (total_errors > 0)
        fprintf(stderr, "There were %d parse errors in all files\n", total_errors);


    /* go home! */
    return 0;
}



/*

*/
int
yyerror(yyscan_t yyscanner, struct lexer_state * lexer, char * message) {

    char *text = yyget_text(yyscanner);

    /* increment parse errors in the lexer structure */
    parse_error(lexer);
    /* emit an error */
    fprintf(stderr, "\nError in file '%s' (line %d): %s ",
            get_current_file(lexer), get_line_nr(lexer), message);

    /* print current token if it's not a newline (or \r\n on windows) */

    /* the following should be fixed; the point is not to print the token if
     * it's a newline, that looks silly.
     */
    if (strcmp(text, "\r\n") != 0 || strcmp(text, "\n") == 0) {
        fprintf(stderr, "('%s')\n\n", text);
    }
    else {
        fprintf(stderr, "\n\n");
    }


    return 0;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

