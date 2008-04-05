%{
/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

#include "pasmparser.h"

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* declare yylex prototype BEFORE inclusion of lexer header file. */
#define YY_DECL int pasmlex(YYSTYPE *yylval, yyscan_t yyscanner)

#include "pasmlexer.h"

extern YY_DECL;

extern int yyerror(yyscan_t yyscanner, char *message);

#define YYDEBUG 1

%}


%union {
    char  *sval;
    int    ival;
    double nval;
}

%token TK_PARROT_OP      "parrot op"
       TK_LABEL          "label"
       TK_STRINGC        "string constant"
       TK_INTC           "integer constant"
       TK_NUMC           "number constant"
       TK_PREG           "PMC register"
       TK_IREG           "Integer register"
       TK_SREG           "String register"
       TK_NREG           "Number register"

%token TK_NAMESPACE      ".namespace"
       TK_PCC_SUB        ".pcc_sub"
       TK_LEX            ".lex"
       TK_NL             "\n"

%token TK_FLAG_INIT      ":init"
       TK_FLAG_MAIN      ":main"
       TK_FLAG_LOAD      ":load"
       TK_FLAG_ANON      ":anon"
       TK_FLAG_IMMEDIATE ":immediate"
       TK_FLAG_POSTCOMP  ":postcomp"


%output="pasmparser.c"

/* replace Bison's standard prefix "yy" by "pasm" */
%name-prefix="pasm"

/* for more helpful error messages */
%error-verbose

/* declare parameters to move around */
%parse-param {yyscan_t yyscanner}
%lex-param   {yyscan_t yyscanner}


%pure-parser

%start pasm_file

%%

pasm_file: pasm_lines
         ;

pasm_lines: pasm_line "\n"
          | pasm_lines pasm_line "\n"
          ;

pasm_line: pasm_instruction
         | namespace_directive
         ;

namespace_directive: ".namespace" key
                   ;

key: '[' keys ']'
   ;

keys: TK_STRINGC
    | keys ';' TK_STRINGC
    ;

pasm_instruction: /* empty */
                | TK_LABEL
                | sub_directive TK_LABEL
                | sub_directive TK_LABEL instruction
                ;

sub_directive: ".pcc_sub" sub_flags
             ;

sub_flags: /* empty */
         | sub_flags sub_flag
         ;

sub_flag: ":init"
        | ":main"
        | ":load"
        | ":anon"
        | ":postcomp"
        | ":immediate"
        ;

instruction: TK_PARROT_OP opt_arguments
           | ".lex" TK_STRINGC ',' TK_PREG
           ;

opt_arguments: /* empty */
             | arguments
             ;

arguments: argument
         | arguments ',' argument
         ;

argument: TK_STRINGC
        | TK_INTC
        | TK_NUMC
        | reg
        | key
        ;

reg: TK_PREG
   | TK_NREG
   | TK_SREG
   | TK_IREG
   ;


%%

/* globals! */
int line_nr = 1;
int errors  = 0;

int
yyerror(yyscan_t yyscanner, char *message) {
    fprintf(stderr, "Syntax error (line %d): %s\n", line_nr, message);
    errors++;
    return 0;
}


int
main(int argc, char *argv[]) {
    yyscan_t yyscanner;
    int flexdebug = 0;
    FILE *fp;

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    fp = fopen(argv[1], "r");
    if (fp == NULL) {
        fprintf(stderr, "Failed to open file '%s'\n", argv[1]);
        exit(EXIT_FAILURE);
    }

    pasmlex_init(&yyscanner);
    pasmset_debug(flexdebug, yyscanner);
    pasmset_in(fp, yyscanner);
    yyparse(yyscanner);
    pasmlex_destroy(yyscanner);

    if (errors > 0) {
        fprintf(stderr, "There were %d errors\n", errors);
    }

    return 0;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
