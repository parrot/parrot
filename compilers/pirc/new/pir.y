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
#include "pirsymbol.h"

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

#include "pirlexer.h"


extern int yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message);

/* declare yylex() */
extern YY_DECL;


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

/* the lexer contains a special temp. field for this purpose. */
#define STORE_NAMED_ALIAS(NAME)             lexer->temp_flag_arg1 = NAME

#define IF_NAMED_ARG_SET_ALIAS(OBJ,EXPR)    if (TEST_FLAG(EXPR, ARG_FLAG_NAMED)) {       \
                                              set_arg_named(OBJ, lexer->temp_flag_arg1); \
                                            }


#define IF_NAMED_PARAM_SET_ALIAS(OBJ,EXPR)  if (TEST_FLAG(EXPR, TARGET_FLAG_NAMED)) {      \
                                              set_param_named(OBJ, lexer->temp_flag_arg1); \
                                            }

/* some defines to prevent magic "1"s and "0"s in the code */
#define GLOBALCONST     1

#define IS_PASM_REG     1

#define MAX_NUM_ERRORS  10


%}

%union {
    double dval;
    int    ival;
    char  *sval;
    struct constant    *constval;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;

    void *fixme;
}


%token <sval> TK_LABEL  "label"
       TK_NL            "\n"

%token TK_HLL           ".HLL"
       TK_HLL_MAP       ".HLL_map"
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
       <ival> TK_INTC          "integer constant"
       <dval> TK_NUMC          "number constant"
       <ival> TK_PASM_PREG     "PMC register"
       <ival> TK_PASM_NREG     "Number register"
       <ival> TK_PASM_SREG     "String register"
       <ival> TK_PASM_IREG     "Integer register"
       <ival> TK_SYM_PREG      "Symbolic PMC register"
       <ival> TK_SYM_NREG      "Symbolic number register"
       <ival> TK_SYM_SREG      "Symbolic string register"
       <ival> TK_SYM_IREG      "Symbolic integer register"
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


%type <sval> unop
             binop
             augmented_op
             rel_op
             identifier
             if_null_type
             sub_id
             opt_paren_string
             parrot_instruction


%type <targ> sub
             method
             string_object
             invokable
             opt_ret_cont
             reg
             pasm_reg
             target
             result_target
             long_result
             long_results
             opt_long_results
             opt_target_list
             target_list
             param_def
             local_id
             local_id_list

%type <argm> named_arg
             short_arg
             arguments
             argument
             opt_arguments_list
             arguments_list
             opt_yield_expressions
             yield_expressions
             yield_expression
             opt_return_expressions
             return_expressions
             return_expression
             opt_long_arguments
             long_arguments
             long_argument

%type <expr> expression1
             expression
             key
             keylist
             pasm_expression
             other_op_args
             other_op_arg
             keys

%type <ival> has_unique_reg
             type
             param_flags
             param_flag
             arg_flags
             arg_flag
             sub_flags
             sub_flag
             if_type
             separator

%type <invo> long_invocation
             methodcall
             subcall
             simple_invocation
             long_yield_statement
             long_return_statement
             short_yield_statement

%type <constval> const_tail constant



%type <fixme> assignment_tail
              assignment_expression

              first_op_arg
              long_invocation_statement
              short_return_statement
              opt_namespace_id
              namespace_id




/* needed for reentrancy */
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
                | hll_specifier
                | hll_mapping
                | loadlib
                | pir_pragma
                ;

pir_pragma: ".pragma" "n_operators" TK_INTC                { set_pragma(PRAGMA_N_OPERATORS, $3); }
          ;

loadlib: ".loadlib" TK_STRINGC                             { load_library(lexer, $2); }
       ;

/* HLL stuff */

hll_specifier: ".HLL" TK_STRINGC ',' TK_STRINGC            { set_hll($2, $4); }
             ;

hll_mapping: ".HLL_map" TK_STRINGC ',' TK_STRINGC          { set_hll_map($2, $4); }
           ;


/* Namespaces */

namespace_declaration: ".namespace" opt_namespace_id
                     ;

opt_namespace_id: /* empty */                              { $$ = NULL; }
                | '[' namespace_id ']'                     { $$ = $2; }
                ;

namespace_id: TK_STRINGC                                   { $$ = $1; }
            | namespace_id separator TK_STRINGC            { }
            ;

/* Sub definition */

sub_definition: ".sub" sub_id                              { new_subr(lexer, $2); }
                sub_flags "\n"                             { set_sub_flag(lexer, $4); }
                parameters
                instructions
                ".end"
                ;

sub_id: identifier
      | TK_STRINGC
      ;

sub_flags: /* empty */                                     { $$ = 0; }
         | sub_flags sub_flag                              { SET_FLAG($$, $1); }
         ;

sub_flag: ":anon"                                          { $$ = SUB_FLAG_ANON; }
        | ":init"                                          { $$ = SUB_FLAG_INIT; }
        | ":load"                                          { $$ = SUB_FLAG_LOAD; }
        | ":main"                                          { $$ = SUB_FLAG_MAIN; }
        | ":method"                                        { $$ = SUB_FLAG_METHOD; }
        | ":lex"                                           { $$ = SUB_FLAG_LEX; }
        | ":postcomp"                                      { $$ = SUB_FLAG_POSTCOMP; }
        | ":immediate"                                     { $$ = SUB_FLAG_IMMEDIATE; }
        | ":multi" '(' multi_type_list ')'                 { $$ = SUB_FLAG_MULTI; }
        | ":outer" '(' sub_id ')'                          { $$ = SUB_FLAG_OUTER;  set_sub_outer(lexer, $3); }
        | ":vtable" opt_paren_string                       { $$ = SUB_FLAG_VTABLE; set_sub_vtable(lexer, $2); }
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

parameter: ".param" param_def param_flags "\n"             { set_param_flag($2, $3);
                                                             IF_NAMED_PARAM_SET_ALIAS($2, $3);
                                                           }
         ;

param_def: type identifier                                 { $$ = add_param(lexer, $1, $2); }
         | type TK_STRINGC "=>" identifier                 { $$ = add_param_named(lexer, $1, $4, $2); }
         ;

/* Instructions */


instructions: /* empty */
            | instructions                                 { new_instr(lexer); }
              instruction
            ;


instruction: TK_LABEL "\n"                                 { set_label(lexer, $1); }
           | TK_LABEL statement                            { set_label(lexer, $1); }
           | statement
           ;

statement: conditional_statement
         | goto_statement
         | local_declaration
         | lex_declaration
         | const_decl_statement
         | return_statement
         | yield_statement
         | invocation_statement
         | assignment_statement
         | parrot_statement
         | getresults_statement
         | null_statement
         | error_statement
         ;

error_statement: error "\n" { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                                  fprintf(stderr, "Too many errors. Compilation aborted.\n");
                                  exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                              }
                              yyerrok;
                            }
               ;

null_statement: "null" target "\n"                         { set_instr(lexer, "null");
                                                             add_operand(lexer, expr_from_target($2));
                                                           }
              | target '=' "null" "\n"                     { set_instr(lexer, "null");
                                                             add_operand(lexer, expr_from_target($1));
                                                           }
              ;

getresults_statement: ".get_results" opt_target_list "\n"  { set_instr(lexer, "get_results");
                                                             add_operand(lexer, expr_from_target($2));
                                                           }
                    ;

parrot_statement: parrot_instruction "\n"
                ;

assignment_statement: target assignment_tail "\n"          { add_operand(lexer, expr_from_target($1)); }
                    ;

/* possible assignment statements:

    target += expression                         add target, expression
    target keylist '=' expression                set target keylist, expression
    target '=' unop expression                   unop target, expression
    target '=' expression1                       set target, expression1
    target '=' exprA binop exprB                 binop target, exprA, exprB
    target '=' target1 keylist                   set target, target1 keylist
    target '=' parrot_instruction                parrot_instr->instr target, parrot_instr->args

    In all cases, target is the first operand.


*/
assignment_tail: augmented_op expression                   { assign(lexer, RHS_AUGMENT, $1, $2); }
               | keylist '=' expression                    { assign(lexer, RHS_SETKEYED, $1, $3); }
               | '=' assignment_expression                 { /* nothing to do */ }
               ;

assignment_expression: unop expression                     { assign(lexer, RHS_UNOP, $1, $2); }
                     | expression1                         { assign(lexer, RHS_SIMPLE, $1); }
                     | expression binop expression         { assign(lexer, RHS_BINOP, $2, $1, $3); }
                     | target keylist                      { assign(lexer, RHS_GETKEYED, $1, $2); }
                     | parrot_instruction                  {  }
                     ;


parrot_instruction: TK_PARROT_OP                           { set_instr(lexer, $1); }
                    opt_parrot_op_args
                  ;

opt_parrot_op_args: /* empty */
                  | parrot_op_args
                  ;

parrot_op_args: first_op_arg other_op_args
              ;

/* the first argument must be a normal expression */
first_op_arg: pasm_expression                              { add_operand(lexer, $1); }
            ;

/* later arguments can be either an expression or a keylist. */
other_op_args: /* empty */                                 {  }
             | other_op_args ',' other_op_arg              { add_operand(lexer, $3); }
             ;

other_op_arg: pasm_expression
            | keylist
            ;

keylist: '[' keys ']'                                      { $$ = $2; }
       ;

keys: key                                                  { $$ = $1; }
    | keys separator key                                   { $$ = add_key($1, $3); }
    ;

key: expression
   ;

separator: ';'                                             { $$ = 0; }
         | ','                                             { $$ = 1; }
         ;


conditional_statement: if_type condition then identifier "\n"
                                                           { /* it was "unless", so "invert" the opcode */
                                                             if ($1 > 0) {

                                                                invert_instr(lexer);
                                                             }
                                                             add_operand(lexer, expr_from_ident($4));
                                                           }
                     | if_null_type expression then identifier "\n"
                                                           { set_instr(lexer, $1);
                                                             add_operand(lexer, $2);
                                                             add_operand(lexer, expr_from_ident($4));
                                                           }
                     ;

if_type: "if"                                              { $$ = 0; /* no need to invert */ }
       | "unless"                                          { $$ = 1; /* yes, invert opname */ }
       ;


if_null_type: "if" "null"                                  { $$ = "if_null"; }
            | "unless" "null"                              { $$ = "unless_null"; }
            ;

then: "goto" /* PIR mode */
    | ','    /* PASM mode*/
    ;


condition: expression                                      { set_instr(lexer, "if");
                                                             add_operand(lexer, $1);
                                                           }
         | expression rel_op expression                    { set_instr(lexer, $2);
                                                             add_operand(lexer, $1);
                                                             add_operand(lexer, $3);
                                                           }
         ;


goto_statement: "goto" identifier "\n"                     { set_instr(lexer, "branch");
                                                             add_operand(lexer, expr_from_ident($2));
                                                           }
              ;

local_declaration: ".local" type local_id_list "\n"        { declare_local(lexer, $2, $3); }
                 ;

local_id_list: local_id                                    { $$ = $1; }
             | local_id_list ',' local_id                  { $$ = add_local($1, $3); }
             ;

local_id: identifier has_unique_reg                        { $$ = new_local($1, $2); }
        ;

has_unique_reg: /* empty */     { $$ = 0; }
              | ":unique_reg"   { $$ = 1; }
              ;



lex_declaration: ".lex" TK_STRINGC ',' target "\n"         { set_lex_flag($4, $2); }
               ;


invocation_statement: long_invocation_statement
                    | short_invocation_statement
                    ;

long_invocation_statement: ".begin_call" "\n"
                           opt_long_arguments
                           long_invocation "\n"
                           opt_long_results
                           ".end_call" "\n"
                                                           { /* $4 contains a invocation object */
                                                             set_invocation_args($4, $3);
                                                             set_invocation_results($4, $6);
                                                             $$ = NULL;
                                                           }
                         ;

opt_long_arguments: /* empty */                            { $$ = NULL; }
                  | long_arguments                         { $$ = $1; }
                  ;

long_arguments: long_argument                              { $$ = $1; }
              | long_arguments long_argument               { $$ = add_arg($1, $2); }
              ;

long_argument: ".arg" short_arg "\n"                       { $$ = $2; }
             ;

long_invocation: ".call" invokable opt_ret_cont            { $$ = invoke(lexer, CALL_PCC, $2, $3); }
               | ".nci_call" invokable                     { $$ = invoke(lexer, CALL_NCI, $2); }
               | ".invocant" invokable "\n"
                 ".meth_call" method                       { $$ = invoke(lexer, CALL_METH, $2, $5); }
               ;

opt_ret_cont: /* empty */                                  { $$ = NULL; }
            | ',' invokable                                { $$ = $2; }
            ;



opt_long_results: /* empty */                              { $$ = NULL; }
                | long_results                             { $$ = $1; }
                ;

long_results: long_result                                  { $$ = $1; }
            | long_results long_result                     { $$ = add_target(lexer, $1, $2); }
            ;

long_result: ".result" result_target "\n"                  { $$ = $2; }
           | local_declaration                             { $$ = NULL; }
           ;

short_invocation_statement: opt_target_list '=' simple_invocation "\n"
                                                           { set_invocation_results($3, $1); }
                          | target '=' simple_invocation "\n"
                                                           { set_invocation_results($3, $1); }
                          | simple_invocation "\n"
                                                           { set_invocation_results($1, NULL); }
                          ;


simple_invocation: subcall
                 | methodcall
                 ;

methodcall: invokable '.' method arguments                 { $$ = invoke(lexer, CALL_METH, $1, $3);
                                                             set_invocation_args($$, $4);
                                                           }
          ;


subcall: sub arguments                                     { $$ = invoke(lexer, CALL_PCC, $1, NULL);
                                                             set_invocation_args($$, $2);
                                                           }
       ;

sub: invokable                                             { $$ = $1; }
   | TK_STRINGC                                            { $$ = target_from_string($1); }
   ;

method: invokable
      | string_object
      ;

invokable: identifier                                      { $$ = target_from_ident($1); find_target(lexer, $1);}
         | TK_SYM_PREG                                     { $$ = reg(PMC_TYPE, $1, !IS_PASM_REG); }
         | TK_PASM_PREG                                    { $$ = reg(PMC_TYPE, $1, IS_PASM_REG); }
         ;

string_object: TK_STRINGC                                  { $$ = target_from_string($1); }
             | TK_SYM_SREG                                 { $$ = reg(STRING_TYPE, $1, !IS_PASM_REG); }
             | TK_PASM_SREG                                { $$ = reg(STRING_TYPE, $1, IS_PASM_REG); }
             ;

opt_target_list: '(' ')'                                   { $$ = NULL; }
               | '(' target_list ')'                       { $$ = $2; }
               ;

target_list: result_target                                 { $$ = $1; }
           | target_list ',' result_target                 { $$ = add_target(lexer, $1, $3); }
           ;

result_target: target param_flags                          { $$ = $1;
                                                             set_param_flag($1, $2);
                                                             /* get the :named argument if necessary */
                                                             IF_NAMED_PARAM_SET_ALIAS($1, $2);
                                                           }
             ;

param_flags: /* empty */                                   { $$ = 0; }
           | param_flags param_flag                        { SET_FLAG($$, $2); }
           ;

param_flag: ":optional"                                    { $$ = TARGET_FLAG_OPTIONAL; }
          | ":opt_flag"                                    { $$ = TARGET_FLAG_OPT_FLAG; }
          | ":slurpy"                                      { $$ = TARGET_FLAG_SLURPY; }
          | ":unique_reg"                                  { $$ = TARGET_FLAG_UNIQUE_REG; }
          | ":named" opt_paren_string                      { $$ = TARGET_FLAG_NAMED;
                                                                  STORE_NAMED_ALIAS($2);
                                                           }
          ;




return_statement: short_return_statement
                | long_return_statement
                ;

yield_statement: short_yield_statement
               | long_yield_statement
               ;

short_return_statement: ".return" arguments "\n"           { $$ = invoke(lexer, CALL_RET);
                                                             set_invocation_args($$, $2);
                                                           }
                      | ".return" simple_invocation "\n"   { set_invocation_type($2, CALL_TAIL); }
                      ;

short_yield_statement: ".yield" arguments "\n"             { $$ = invoke(lexer, CALL_YIELD);
                                                             set_invocation_args($$, $2);
                                                           }
                     ;

arguments: '(' opt_arguments_list ')'                      { $$ = $2; }
         ;

opt_arguments_list: /* empty */                            { $$ = NULL; }
                  | arguments_list                         { $$ = $1; }
                  ;

arguments_list: argument                                   { $$ = $1; }
              | arguments_list ',' argument                { $$ = add_arg($1, $3); }
              ;

argument: short_arg
        | named_arg
        ;

named_arg: TK_STRINGC "=>" expression                      { $$ = new_argument($3);
                                                             set_arg_named($$, $1);
                                                           }
         ;

short_arg: expression arg_flags                            { $$ = new_argument($1);
                                                             set_arg_flag($$, $2);
                                                             IF_NAMED_ARG_SET_ALIAS($$, $2);
                                                           }
         ;



long_return_statement: ".begin_return" "\n"
                       opt_return_expressions
                       ".end_return" "\n"                  { $$ = invoke(lexer, CALL_RET);
                                                             set_invocation_args($$, $3);
                                                           }
                     ;

long_yield_statement: ".begin_yield" "\n"
                      opt_yield_expressions
                      ".end_yield" "\n"                    { $$ = invoke(lexer, CALL_YIELD);
                                                             set_invocation_args($$, $3);
                                                           }
                    ;

opt_yield_expressions: /* empty */                         { $$ = NULL; }
                     | yield_expressions                   { $$ = $1; }
                     ;


yield_expressions: yield_expression                        { $$ = $1; }
                 | yield_expressions yield_expression      { $$ = add_arg($1, $2); }
                 ;


yield_expression: ".yield" short_arg "\n"                  { $$ = $2; }
                ;

opt_return_expressions: /* empty */                        { $$ = NULL; }
                      | return_expressions                 { $$ = $1; }
                      ;

return_expressions: return_expression                      { $$ = $1; }
                  | return_expressions return_expression   { $$ = add_arg($1, $2); }
                  ;

return_expression: ".return" short_arg "\n"                { $$ = $2; }
                 ;


arg_flags: /* empty */                                     { $$ = 0; }
         | arg_flags arg_flag                              { SET_FLAG($$, $2); }
         ;

arg_flag: ":flat"                                          { $$ = ARG_FLAG_FLAT; }
        | ":named" opt_paren_string                        { $$ = ARG_FLAG_NAMED;
                                                             STORE_NAMED_ALIAS($2);
                                                           }
        ;

opt_paren_string: /* empty */                              { $$ = NULL; }
                | '(' TK_STRINGC ')'                       { $$ = $2; }
                ;

const_declaration: ".const" const_tail                     { define_const(lexer, $2, !GLOBALCONST); }
                 ;

const_decl_statement: const_declaration "\n"
                    | ".globalconst" const_tail "\n"       { define_const(lexer, $2, GLOBALCONST); }
                    ;

const_tail: "int"    identifier '=' TK_INTC                { $$ = new_const(INT_TYPE, $2, $4); }
          | "num"    identifier '=' TK_NUMC                { $$ = new_const(NUM_TYPE, $2, $4); }
          | "pmc"    identifier '=' TK_STRINGC             { $$ = new_const(PMC_TYPE, $2, $4); }
          | "string" identifier '=' TK_STRINGC             { $$ = new_const(STRING_TYPE, $2, $4); }
          ;

pasm_expression: expression
               ;

/* expression1 is similar to expression, but it doesn't accept TK_PARROT_OP */
expression1: constant                                      { $$ = expr_from_const($1); }
           | reg                                           { $$ = expr_from_target($1); }
           | TK_IDENT                                      { $$ = expr_from_ident($1); }
           ;

expression: target                                         { $$ = expr_from_target($1); }
          | constant                                       { $$ = expr_from_const($1); }
          ;

constant: TK_STRINGC                                       { $$ = new_const(STRING_TYPE, NULL, $1); }
        | TK_INTC                                          { $$ = new_const(INT_TYPE, NULL, $1); }
        | TK_NUMC                                          { $$ = new_const(NUM_TYPE, NULL, $1); }
        ;

rel_op: "!="                                               { $$ = "ne"; }
      | "=="                                               { $$ = "eq"; }
      | "<"                                                { $$ = "lt"; }
      | "<="                                               { $$ = "le"; }
      | ">="                                               { $$ = "ge"; }
      | ">"                                                { $$ = "gt"; }
      ;

type: "int"                                                { $$ = INT_TYPE; }
    | "num"                                                { $$ = NUM_TYPE; }
    | "pmc"                                                { $$ = PMC_TYPE; }
    | "string"                                             { $$ = STRING_TYPE; }
    ;

target: reg                                                { $$ = $1; }
      | identifier                                         { $$ = new_target(UNKNOWN_TYPE, $1); }
      ;

reg: TK_SYM_PREG                                           { $$ = reg(PMC_TYPE, $1, !IS_PASM_REG); }
   | TK_SYM_NREG                                           { $$ = reg(NUM_TYPE, $1, !IS_PASM_REG); }
   | TK_SYM_IREG                                           { $$ = reg(INT_TYPE, $1, !IS_PASM_REG); }
   | TK_SYM_SREG                                           { $$ = reg(STRING_TYPE, $1, !IS_PASM_REG); }
   | pasm_reg
   ;

pasm_reg: TK_PASM_PREG                                     { $$ = reg(PMC_TYPE, $1, IS_PASM_REG); }
        | TK_PASM_NREG                                     { $$ = reg(NUM_TYPE, $1, IS_PASM_REG); }
        | TK_PASM_IREG                                     { $$ = reg(INT_TYPE, $1, IS_PASM_REG); }
        | TK_PASM_SREG                                     { $$ = reg(STRING_TYPE, $1, IS_PASM_REG); }
        ;

identifier: TK_IDENT
          | TK_PARROT_OP
          ;

unop: '-'                                                  { $$ = "neg"; }
    | '!'                                                  { $$ = "not"; }
    | '~'                                                  { $$ = "bnot"; }
    ;

binop: '+'                                                 { $$ = "add"; }
     | '-'                                                 { $$ = "sub"; }
     | '/'                                                 { $$ = "div"; }
     | '*'                                                 { $$ = "mul"; }
     | '%'                                                 { $$ = "mod"; }
     | '|'                                                 { $$ = "bor"; }
     | '&'                                                 { $$ = "band"; }
     | '~'                                                 { $$ = "bxor"; }
     | "**"                                                { $$ = "pow"; }
     | "."                                                 { $$ = "concat"; }
     | ">>>"                                               { $$ = "lsr"; }
     | ">>"                                                { $$ = "shr"; }
     | "<<"                                                { $$ = "shl"; }
     | "||"                                                { $$ = "or";  }
     | "&&"                                                { $$ = "and"; }
     | "//"                                                { $$ = "fdiv"; }
     | "~~"                                                { $$ = "xor"; }
     | "=="                                                { $$ = "iseq"; }
     | "<="                                                { $$ = "isle"; }
     | "<"                                                 { $$ = "islt"; }
     | ">="                                                { $$ = "isge"; }
     | ">"                                                 { $$ = "isgt"; }
     | "!="                                                { $$ = "isne"; }
     ;


augmented_op: "+="                                         { $$ = "add"; }
            | "-="                                         { $$ = "sub"; }
            | "*="                                         { $$ = "mul"; }
            | "%="                                         { $$ = "mod"; }
            | "**="                                        { $$ = "pow"; }
            | "/="                                         { $$ = "div"; }
            | "//="                                        { $$ = "fdiv"; }
            | "|="                                         { $$ = "bor"; }
            | "&="                                         { $$ = "band" }
            | "~="                                         { $$ = "bxor"; }
            | ".="                                         { $$ = "concat"; }
            | ">>="                                        { $$ = "shr"; }
            | "<<="                                        { $$ = "shl"; }
            | ">>>="                                       { $$ = "lsr"; }
            ;
%%



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

