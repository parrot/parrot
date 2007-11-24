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
#include <string.h>

#include "pirparser.h"
#include "pircompiler.h"
#include "pircompunit.h"

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

#include "pirlexer.h"


extern int yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message);

/* declare yylex() */
extern YY_DECL;

/*
  experimental emit functions.

 */
/*
#define EMIT_EXPERIMENT
*/

#ifdef EMIT_EXPERIMENT
#  define emit1(X)        fprintf(stderr, "%s\n", X)
#  define emit2(X,Y)      fprintf(stderr, "%s %s\n", X,Y)
#  define emit3(A,B,C)    fprintf(stderr, "%s %s, %s\n", A,B,C)
#else
#  define emit1(X)
#  define emit2(X,Y)
#  define emit3(A,B,C)
#endif

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

%union {
    double dval;
    int    ival;
    char  *sval;

    struct constant *constval;
}


%token <sval> TK_LABEL  "label"
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
       TK_INVOCANT      ".invocant"
       TK_METH_CALL     ".meth_call"
       TK_GLOBALCONST   ".globalconst"
       TK_CONST         ".const"
       TK_RETURN        ".return"
       TK_YIELD         ".yield"
       TK_BEGIN_YIELD   ".begin_yield"
       TK_END_YIELD     ".end_yield"
       TK_BEGIN_RETURN  ".begin_return"
       TK_END_RETURN    ".end_return"
       TK_BEGIN_CALL    ".begin_call"
       TK_END_CALL      ".end_call"
       TK_GET_RESULTS   ".get_results"
       TK_CALL          ".call"
       TK_ARG           ".arg"
       TK_RESULT        ".result"
       TK_NCI_CALL      ".nci_call"

%token <sval> TK_IDENT         "identifier"
       <sval> TK_STRINGC       "string constant"
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
       <sval> TK_PARROT_OP     "parrot op"

%token TK_INT       "int"
       TK_NUM       "num"
       TK_PMC       "pmc"
       TK_STRING    "string"
       TK_IF        "if"
       TK_UNLESS    "unless"
       TK_NULL      "null"
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
       TK_XOR       "~~"
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


%type <sval> unop binop augmented_op rel_op target expression
              identifier if_type if_null_type
             constant reg pasm_reg
             sub_id opt_paren_string
             instruction

%type <ival> has_unique_reg type

%type <constval> const_tail


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
         { load_library(lexer, $2); }
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

namespace_declaration: ".namespace" opt_namespace_id
                     ;

opt_namespace_id: /* empty */
                | '[' namespace_id ']'
                ;

namespace_id: TK_STRINGC
            | namespace_id separator TK_STRINGC
            ;

/* Sub definition */

sub_definition: ".sub" sub_id               { new_sub(lexer, $2); }
                sub_flags "\n"
                parameters
                instructions
                ".end"
                ;

sub_id: identifier
      | TK_STRINGC
      ;

sub_flags: /* empty */
         | sub_flags sub_flag
         ;

sub_flag: ":anon"                           { set_sub_flag(lexer, SUB_FLAG_ANON); }
        | ":init"                           { set_sub_flag(lexer, SUB_FLAG_INIT); }
        | ":load"                           { set_sub_flag(lexer, SUB_FLAG_LOAD); }
        | ":main"                           { set_sub_flag(lexer, SUB_FLAG_MAIN); }
        | ":method"                         { set_sub_flag(lexer, SUB_FLAG_METHOD); }
        | ":lex"                            { set_sub_flag(lexer, SUB_FLAG_LEX); }
        | ":postcomp"                       { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); }
        | ":immediate"                      { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); }
        | ":multi" '(' multi_type_list ')'  { set_sub_flag(lexer, SUB_FLAG_MULTI); }
        | ":outer" '(' sub_id ')'           { set_sub_outer(lexer, $3); }
        | ":vtable" opt_paren_string        { set_sub_vtable(lexer, $2); }
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

param_def: type identifier                  { add_param(lexer, $1, $2); } /* add a new parameter */
         | type TK_STRINGC "=>" identifier  { add_param(lexer, $1, $4);   /* add a new parameter */
                                              set_param_named(lexer, $2); /* set the :named flag on it */
                                            }
         ;

/* Instructions */


instructions: /* empty */
            | instructions labeled_instruction
            ;


labeled_instruction: TK_LABEL "\n"            { add_instr(lexer, $1, NULL); }
                   | TK_LABEL instruction     { add_instr(lexer, $1, $2);   }
                   | instruction              { add_instr(lexer, NULL, $1); }
                   ;

instruction: conditional_statement { $$ = NULL; }
           | goto_statement        { $$ = NULL; }
           | local_declaration      { $$ = NULL; }
           | lex_declaration            { $$ = NULL; }
           | const_decl_statement      { $$ = NULL; }
           | return_statement           { $$ = NULL; }
           | yield_statement            { $$ = NULL; }
           | invocation_statement       { $$ = NULL; }
           | assignment_statement       { $$ = NULL; }
           | methodcall_statement       { $$ = NULL; }
           | parrot_statement           { $$ = NULL; }
           | getresults_statement       { $$ = NULL; }
           | null_statement             { $$ = NULL; }
           | error "\n" { yyerrok; }
           ;

null_statement: "null" target "\n"       { new_instr(lexer, "null", $2); }
              | target '=' "null" "\n"   { new_instr(lexer, "null", $1); }
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
                     | methodcall
                     | parrot_instruction
                     ;


/*
 * The case of a parrot instruction without arguments is covered by
 * the rule assignment_expression : expression.
 * This brings up the question, whether the check for "is_op()" should
 * be done in the lexer or here, in the parser, because when
 * reducing the rule "expression", we need to know whether it is
 * an op. If the check is done in the parser, then the token
 * TK_PARROT_OP can be removed.
 */
parrot_instruction: TK_PARROT_OP parrot_op_args
                  ;

opt_parrot_op_args: /* empty */
                  | parrot_op_args
                  ;

parrot_op_args: parrot_op_arg
              | parrot_op_args ',' parrot_op_arg
              ;

parrot_op_arg: pasm_expression
             ;

unop: '-'     { $$ = "neg"; }
    | '!'     { $$ = "not"; }
    | '~'     { $$ = "bnot"; }
    ;

binop: '+'    { $$ = "add"; }
     | '-'    { $$ = "sub"; }
     | '/'    { $$ = "div"; }
     | '*'    { $$ = "mul"; }
     | '%'    { $$ = "mod"; }
     | '|'    { $$ = "bor"; }
     | '&'    { $$ = "band"; }
     | '~'    { $$ = "bxor"; }
     | "**"   { $$ = "pow"; }
     | "."    { $$ = "concat"; }
     | ">>>"  { $$ = "lsr"; }
     | ">>"   { $$ = "shr"; }
     | "<<"   { $$ = "shl"; }
     | "||"   { $$ = "or";  }
     | "&&"   { $$ = "and"; }
     | "//"   { $$ = "fdiv"; }
     | "~~"   { $$ = "xor"; }
     | "=="   { $$ = "iseq"; }
     | "<="   { $$ = "isle"; }
     | "<"    { $$ = "islt"; }
     | ">="   { $$ = "isge"; }
     | ">"    { $$ = "isgt"; }
     | "!="   { $$ = "isne"; }
     ;


augmented_op: "+="   { $$ = "add"; }
            | "-="   { $$ = "sub"; }
            | "*="   { $$ = "mul"; }
            | "%="   { $$ = "mod"; }
            | "**="  { $$ = "pow"; }
            | "/="   { $$ = "div"; }
            | "//="  { $$ = "fdiv"; }
            | "|="   { $$ = "bor"; }
            | "&="   { $$ = "band" }
            | "~="   { $$ = "bxor"; }
            | ".="   { $$ = "concat"; }
            | ">>="  { $$ = "shr"; }
            | "<<="  { $$ = "shl"; }
            | ">>>=" { $$ = "lsr"; }
            ;

keylist: '[' keys ']'
       ;

keys: key
    | keys separator key
    ;

key: expression
   ;

separator: ';'
         | ','
         ;


conditional_statement: if_type expression goto_or_comma identifier "\n"
                       { new_instr(lexer, $1, $2, $4); }
                     | if_type expression rel_op expression goto_or_comma identifier "\n"
                       { new_instr(lexer, $3, $1, $2, $4, $6); }
                     | if_null_type expression goto_or_comma identifier "\n"
                       { new_instr(lexer, $1, $2, $4); }
                     ;

if_type: "if"      { $$ = "if"; }
       | "unless"  { $$ = "unless"; }
       ;


if_null_type: "if" "null"     { $$ = "if_null"; }
            | "unless" "null" { $$ = "unless_null"; }
            ;

goto_or_comma: "goto" /* PIR mode */
             | ','    /* PASM mode*/
             ;
/*
condition: expression
         | expression rel_op expression
         ;
*/

goto_statement: "goto" identifier "\n"
                { new_instr(lexer, "branch", $2); }
              ;

local_declaration: ".local" type local_id_list "\n"
                 ;

local_id_list: local_id
             | local_id_list ',' local_id
             ;

local_id: identifier has_unique_reg
          { declare_local(lexer, $1, $2); }
        ;

has_unique_reg: /* empty */     { $$ = 0; }
              | ":unique_reg"   { $$ = 1; }
              ;



lex_declaration: ".lex" TK_STRINGC ',' target "\n"
               ;

invocation_statement: long_invocation_statement   { new_invocation(lexer); }
                    | short_invocation_statement  { new_invocation(lexer); }
                    ;

long_invocation_statement: ".begin_call" "\n"
                           long_arguments
                           long_invocation "\n"
                           long_results
                           ".end_call" "\n"
                         ;

long_arguments: /* empty */
              | long_arguments long_argument
              ;

long_argument: ".arg" short_arg "\n"
             ;

long_invocation: ".call" invokable opt_return_continuation
               | ".nci_call" invokable
               | ".invocant" invokable "\n"
                 ".meth_call" method
               ;

opt_return_continuation: /* empty */
                       | ',' invokable
                       ;

long_results: /* empty */
            | long_results long_result
            ;

long_result: ".result" target param_flags "\n"
           | local_declaration
           ;

short_invocation_statement: '(' opt_target_list ')' '=' invocation_expression "\n"
                          | simple_invocation "\n"
                          ;


simple_invocation: invokable arguments
                 | TK_STRINGC arguments
                 ;

opt_target_list: /* empty */
               | target_list
               ;

target_list: result_target
           | target_list ',' result_target
           ;

result_target: target         { add_target(lexer, $1); }
               param_flags
             ;

param_flags: /* empty */
           | param_flags param_flag
           ;

param_flag: ":optional"                  { set_param_flag(lexer, PARAM_FLAG_OPTIONAL); }
          | ":opt_flag"                  { set_param_flag(lexer, PARAM_FLAG_OPT_FLAG); }
          | ":slurpy"                    { set_param_flag(lexer, PARAM_FLAG_SLURPY); }
          | ":unique_reg"                { set_param_flag(lexer, PARAM_FLAG_UNIQUE_REG); }
          | ":named" opt_paren_string    { set_param_named(lexer, $2); }
          ;

invocation_expression: simple_invocation
                     | methodcall
                     ;

methodcall: invokable '.' method arguments
          ;

invokable: identifier              { }
         | TK_SYM_PREG             { }
         | TK_PASM_PREG            { }
         ;

method: invokable
      | string_object
      ;

string_object: TK_STRINGC
             | TK_SYM_SREG
             | TK_PASM_SREG
             ;

return_statement: short_return_statement
                | long_return_statement
                ;

long_return_statement: ".begin_return" "\n"
                       return_expressions
                       ".end_return" "\n"
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

argument: short_arg
        | named_arg
        ;

named_arg: TK_STRINGC "=>" expression      { add_arg(lexer, $3);
                                             set_arg_named(lexer, $1);
                                           }
         ;

short_arg: expression   { add_arg(lexer, $1); }
           arg_flags
         ;

long_yield_statement: ".begin_yield" "\n"
                      yield_expressions
                      ".end_yield" "\n"
                    ;

yield_expressions: /* empty */
                 | yield_expressions yield_expression
                 ;

yield_expression: ".yield" result "\n"
                ;

return_expressions: /* empty */
                  | return_expressions return_expression
                  ;

return_expression: ".return" result "\n"
                 ;

result: expression arg_flags
      ;

arg_flags: /* empty */
         | arg_flags arg_flag
         ;

arg_flag: ":flat"                      { set_arg_flag(lexer, ARG_FLAG_FLAT); }
        | ":named" opt_paren_string    { set_arg_named(lexer, $2); }
        ;

opt_paren_string: /* empty */          { $$ = NULL; }
                | '(' TK_STRINGC ')'   { $$ = $2; }
                ;

const_declaration: ".const" const_tail               { define_const(lexer, $2, 0);  }
                 ;

const_decl_statement: const_declaration "\n"
                    | ".globalconst" const_tail "\n" { define_const(lexer, $2, 1);  }
                    ;

const_tail: "int"    identifier '=' TK_INTC     { $$ = new_iconst($2, $4); }
          | "num"    identifier '=' TK_NUMC     { $$ = new_nconst($2, $4); }
          | "pmc"    identifier '=' TK_STRINGC  { $$ = new_pconst($2, $4); }
          | "string" identifier '=' TK_STRINGC  { $$ = new_sconst($2, $4); }
          ;

pasm_expression: constant
               | pasm_reg
               ;

expression: target
          | constant
          ;

constant: TK_STRINGC
        | TK_INTC
        | TK_NUMC
        ;

rel_op: "!="  { $$ = "ne"; }
      | "=="  { $$ = "eq"; }
      | "<"   { $$ = "lt"; }
      | "<="  { $$ = "le"; }
      | ">="  { $$ = "ge"; }
      | ">"   { $$ = "gt"; }
      ;

type: "int"     { $$ = INT_TYPE; }
    | "num"     { $$ = NUM_TYPE; }
    | "pmc"     { $$ = PMC_TYPE; }
    | "string"  { $$ = STRING_TYPE; }
    ;

target: reg
      | identifier
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

identifier: TK_IDENT
          | TK_PARROT_OP
          ;


%%



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

