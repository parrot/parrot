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

Features are:

=over 4

=item * constant folding is implemented in the parser

=item *

=back



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
#define STORE_NAMED_ALIAS(NAME)             do { lexer->temp_flag_arg1 = NAME; } while (0)

#define IF_NAMED_ARG_SET_ALIAS(OBJ,EXPR)    if (TEST_FLAG(EXPR, ARG_FLAG_NAMED)) {       \
                                              set_arg_named(OBJ, lexer->temp_flag_arg1); \
                                            }


#define IF_NAMED_PARAM_SET_ALIAS(OBJ,EXPR)  if (TEST_FLAG(EXPR, TARGET_FLAG_NAMED)) {      \
                                              set_param_named(OBJ, lexer->temp_flag_arg1); \
                                            }

/* some defines to prevent magic "1"s and "0"s in the code */
#define GLOBALCONST     1

#define MAX_NUM_ERRORS  10


%}

%union {
    double              dval;
    int                 ival;
    char               *sval;
    struct constant    *constval;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;

    void               *fixme;
}


%token <sval> TK_LABEL      "label"
       TK_NL                "\n"

%token TK_HLL               ".HLL"
       TK_HLL_MAP           ".HLL_map"
       TK_N_OPERATORS       "n_operators"
       TK_PRAGMA            ".pragma"
       TK_LOADLIB           ".loadlib"

%token TK_SUB               ".sub"
       TK_END               ".end"
       TK_PARAM             ".param"
       TK_LEX               ".lex"
       TK_LOCAL             ".local"
       TK_NAMESPACE         ".namespace"
       TK_INVOCANT          ".invocant"
       TK_METH_CALL         ".meth_call"
       TK_GLOBALCONST       ".globalconst"
       TK_CONST             ".const"
       TK_RETURN            ".return"
       TK_YIELD             ".yield"
       TK_BEGIN_YIELD       ".begin_yield"
       TK_END_YIELD         ".end_yield"
       TK_BEGIN_RETURN      ".begin_return"
       TK_END_RETURN        ".end_return"
       TK_BEGIN_CALL        ".begin_call"
       TK_END_CALL          ".end_call"
       TK_GET_RESULTS       ".get_results"
       TK_CALL              ".call"
       TK_ARG               ".arg"
       TK_RESULT            ".result"
       TK_NCI_CALL          ".nci_call"

%token <sval> TK_IDENT      "identifier"
       <sval> TK_STRINGC    "string constant"
       <ival> TK_INTC       "integer constant"
       <dval> TK_NUMC       "number constant"
       <ival> TK_PREG       "PMC register"
       <ival> TK_NREG       "number register"
       <ival> TK_SREG       "string register"
       <ival> TK_IREG       "integer register"
       <sval> TK_PARROT_OP  "parrot instruction"

%token TK_INT               "int"
       TK_NUM               "num"
       TK_PMC               "pmc"
       TK_STRING            "string"
       TK_IF                "if"
       TK_UNLESS            "unless"
       TK_NULL              "null"
       TK_GOTO              "goto"

%token TK_ARROW             "=>"
       TK_NE                "!="
       TK_EQ                "=="
       TK_LT                "<"
       TK_LE                "<="
       TK_GT                ">"
       TK_GE                ">="

       TK_USHIFT            ">>>"
       TK_RSHIFT            ">>"
       TK_LSHIFT            "<<"
       TK_FDIV              "//"
       TK_OR                "||"
       TK_AND               "&&"
       TK_XOR               "~~"
       TK_CONC              "."
       TK_ASSIGN_USHIFT     ">>>="
       TK_ASSIGN_RSHIFT     ">>="
       TK_ASSIGN_LSHIFT     "<<="

%token TK_ASSIGN_INC        "+="
       TK_ASSIGN_DEC        "-="
       TK_ASSIGN_MUL        "*="
       TK_ASSIGN_MOD        "%="
       TK_ASSIGN_POW        "**="
       TK_ASSIGN_DIV        "/="
       TK_ASSIGN_BOR        "|="
       TK_ASSIGN_BAND       "&="
       TK_ASSIGN_FDIV       "//="
       TK_ASSIGN_BNOT       "~="
       TK_ASSIGN_CONC       ".="

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
       TK_FLAG_LEXID        ":lexid"

%token TK_FLAG_UNIQUE_REG   ":unique_reg"
       TK_FLAG_NAMED        ":named"
       TK_FLAG_SLURPY       ":slurpy"
       TK_FLAG_FLAT         ":flat"
       TK_FLAG_OPTIONAL     ":optional"
       TK_FLAG_OPT_FLAG     ":opt_flag"
       TK_FLAG_INVOCANT     ":invocant"

%type <sval> unop
             binop
             augmented_op
             rel_op
             identifier
             sub_id
             opt_paren_string
             paren_string

%type <targ> sub
             method
             string_object
             invokable
             opt_ret_cont
             reg
             target
             lex_target
             result_target
             long_result
             long_results
             opt_long_results
             opt_target_list
             opt_list
             target_list
             local_id
             local_id_list

%type <argm> named_arg
             short_arg
             arguments
             argument
             arg
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

%type <expr> expression
             keylist
             op_args
             op_arg
             keys
             keyaccess

%type <ival> has_unique_reg
             type
             target_flags
             target_flag
             param_flags
             param_flag
             invocant_param
             arg_flags
             arg_flag
             sub_flags
             sub_flag
             sub_flag_with_arg
             if_unless

%type <invo> long_invocation
             methodcall
             subcall
             simple_invocation
             long_yield_stat
             long_return_stat
             short_yield_stat

%type <constval> const_tail
                 constant

%type <fixme> long_invocation_stat
              short_return_stat
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


/* A note on the layout of the grammar rules.
 *
 * All actions should be written on the next line, with a fixed indention
 * w.r.t. colon (':'). This is true for all rules, except:
 *
 * 1: simple actions that return a flag. For instance, the <has_unique_reg> rule.
 * 2: action blocks that are embedded between (non) terminal tokens.
 * 3: simple rules that have only single tokens as alternatives. See the operators
 *    for an example.
 *
 * + The default rule ( $$ = $1; ) is not written explicitly, except if an
 *   alternative of the rule has a different action.
 *
 * + Do not write embedded actions; instead, refactor the grammar by adding
 *   a new rule, so that the previously-embedded action becomes a 'normal'
 *   action.
 *
 * + The grammar can be written in a more concise way. This, however, would
 *   make it less readable; having a few rules more works great as self documenting
 *   code.
 */

/* Top-level rule */
%start TOP



%%

/* Top-level rules */

TOP               : opt_nl
                    pir_chunks
                    opt_nl
                  ;

opt_nl            : /* empty */
                  | "\n"
                  ;

pir_chunks        : pir_chunk
                  | pir_chunks "\n" pir_chunk
                  ;

pir_chunk         : sub_def
                  | const_decl
                  | namespace_decl
                  | hll_specifier
                  | hll_mapping
                  | loadlib
                  | pir_pragma
                  ;

pir_pragma        : ".pragma" "n_operators" TK_INTC
                            { set_pragma(PRAGMA_N_OPERATORS, $3); }
                  ;

loadlib           : ".loadlib" TK_STRINGC
                            { load_library(lexer, $2); }
                  ;

/* HLL stuff      */

hll_specifier     : ".HLL" TK_STRINGC
                            { set_hll($2); }
                  ;

hll_mapping       : ".HLL_map" TK_STRINGC '=' TK_STRINGC
                            { set_hll_map($2, $4); }
                  ;


/* Namespaces */

namespace_decl    : ".namespace" '[' opt_namespace_id ']'
                  ;

opt_namespace_id  : /* empty */
                            { $$ = NULL; }
                  | namespace_id
                            { $$ = $1; }
                  ;

namespace_id      : TK_STRINGC
                            { $$ = $1; }
                  | namespace_id ';' TK_STRINGC
                            { }
                  ;


/* Sub definition */

sub_def           : sub_head sub_flags "\n"
                    parameters
                    instructions
                    ".end"
                  ;

sub_head          : ".sub" sub_id
                         { new_subr(lexer, $2); }
                  ;

sub_id            : identifier
                  | TK_STRINGC
                  ;

sub_flags         : /* empty */
                         { $$ = 0; }
                  | sub_flags sub_flag
                         { set_sub_flag(lexer, $2); }
                  ;

sub_flag          : ":anon"
                         { $$ = SUB_FLAG_ANON;}
                  | ":init"
                         { $$ = SUB_FLAG_INIT; }
                  | ":load"
                         { $$ = SUB_FLAG_LOAD; }
                  | ":main"
                         { $$ = SUB_FLAG_MAIN; }
                  | ":method"
                         { $$ = SUB_FLAG_METHOD; }
                  | ":lex"
                         { $$ = SUB_FLAG_LEX; }
                  | ":postcomp"
                         { $$ = SUB_FLAG_POSTCOMP; }
                  | ":immediate"
                         { $$ = SUB_FLAG_IMMEDIATE; }
                  | ":multi"
                         { $$ = SUB_FLAG_MULTI; }
                  | sub_flag_with_arg
                  ;

sub_flag_with_arg : ":outer" '(' sub_id ')'
                         { $$ = SUB_FLAG_OUTER;
                           set_sub_outer(lexer, $3);
                         }
                  | ":vtable" opt_paren_string
                         { $$ = SUB_FLAG_VTABLE;
                           set_sub_vtable(lexer, $2);
                         }
                  | ":lexid" paren_string
                         { $$ = SUB_FLAG_LEXID;
                           set_sub_lexid(lexer, $2);
                         }
                  ;

multi_type        : identifier
                  | TK_STRINGC
                  | keylist
                  | type
                  ;

parameters        : /* empty */
                  | parameters parameter
                  ;

parameter         : ".param" type identifier param_flags "\n"
                         {
                           declare_local(lexer, $2, new_local($3, 0));
                         }
                  ;


/* Instructions */



instructions      : /* empty */
                  | instructions instruction
                  ;

instruction       : { new_instr(lexer); }
                    instr
                  ;

instr             : TK_LABEL "\n"
                         { set_label(lexer, $1); }
                  | TK_LABEL statement
                         { set_label(lexer, $1); }
                  | statement
                  ;

statement         : conditional_stat
                  | goto_stat
                  | local_decl
                  | lex_decl
                  | const_decl_stat
                  | return_stat
                  | yield_stat
                  | invocation_stat
                  | assignment_stat
                  | parrot_stat
                  | getresults_stat
                  | null_stat
                  | error_stat
                  ;

error_stat        : error "\n"
                         { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         }
                  ;

null_stat         : null_instr "\n"
                  ;

null_instr        : "null" target
                         { set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target($2));
                         }
                  | target '=' "null"
                         { set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target($1));
                         }
                  ;

getresults_stat   : ".get_results" opt_target_list "\n"
                         { set_instr(lexer, "get_results");
                           push_operand(lexer, expr_from_target($2));
                         }
                  ;

assignment_stat   : assignment "\n"
                  ;

assignment        : target '=' expression
                         { set_instr(lexer, "set");
                           add_operands(lexer, 2, expr_from_target($1), $3);
                         }
                  | target augmented_op expression
                         { set_instr(lexer, $2);
                           add_operands(lexer, 2, expr_from_target($1), $3);
                         }
                  | target '=' unop expression
                         { set_instr(lexer, $3);
                           add_operands(lexer, 2, expr_from_target($1), $4);
                         }
                  | target '=' binary_expr
                         { unshift_operand(lexer, expr_from_target($1)); }
                  | target keylist '=' expression
                         { set_instr(lexer, "set");
                           /* XXX fix key stuff */
                         }
                  | target '=' target keylist
                         { set_instr(lexer, "set");
                           /* XXX fix key stuff */
                         }
                  | target '=' parrot_instruction
                         { unshift_operand(lexer, expr_from_target($1)); }
                  ;

/**

implementation of constant folding IN the parser; this saves us a lot of back-end code
which is crap to write. This is probably more efficient as well, as it is brute-force,
straightforward, as opposed to a lot of conditional code. It does make the grammar a bit
uglier, but oh well, still readable. Some refactoring would help (in the end).

There's not so many combinations, as there's no such thing as a PMC constant literal,
and there's only 1 binary operation for strings, so only {num, int} x {num, int}.

XXX fix type of binop into integer, and use that in a switch statement to do the
constant folding. Now binop is of type char *.

**/

binary_expr       : target binop expression
                         { set_instr(lexer, $2);
                           add_operands(lexer, 2, expr_from_target($1), $3);
                         }
                  | TK_INTC binop target
                         { set_instr(lexer, $2);
                           add_operands(lexer, 2, expr_from_const(new_const(INT_TYPE, NULL, $1)),
                                                                  expr_from_target($3));
                         }

                  | TK_NUMC binop target
                         { set_instr(lexer, $2);
                           add_operands(lexer, 2, expr_from_const(new_const(NUM_TYPE, NULL, $1)),
                                                                  expr_from_target($3));
                         }

                  | TK_STRINGC "." target
                         { set_instr(lexer, "concat");
                           add_operands(lexer, 2, expr_from_const(new_const(STRING_TYPE, NULL, $1)),
                                                                  expr_from_target($3));
                         }
                  | TK_STRINGC "." TK_STRINGC
                         {
                           set_instr(lexer, "set");
                           /* concatenate strings and add result as operand */
                         }
                  | TK_INTC binop TK_INTC
                         { set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(new_const(INT_TYPE, NULL, $1 + $3)));
                         }

                  | TK_NUMC binop TK_NUMC
                         {
                          set_instr(lexer, "set");
                         }
                  | TK_INTC binop TK_NUMC
                         {
                          set_instr(lexer, "set");
                         }
                  | TK_NUMC binop TK_INTC
                         {
                          set_instr(lexer, "set");
                         }
                  ;


parrot_stat       : parrot_instruction "\n"
                  ;

parrot_instruction: parrot_op opt_op_args
                  ;

parrot_op         : TK_PARROT_OP
                         { set_instr(lexer, $1); }
                  ;

opt_op_args       : /* empty */
                  | op_args
                  ;

op_args           : op_arg
                         { push_operand(lexer, $1); }
                  | op_args ',' op_arg
                         { push_operand(lexer, $3); }
                  ;

op_arg            : expression
                  | keylist
                  | keyaccess
                  ;

keyaccess         : target keylist
                         { $$ = NULL; }
                  ;

keylist           : '[' keys ']'
                         { $$ = $2; }
                  ;

keys              : expression
                         { $$ = $1; }
                  | keys ';' expression
                         { $$ = add_key($1, $3); }
                  ;

conditional_stat  : conditional_instr "\n"
                  ;

conditional_instr : if_unless "null" expression "goto" identifier
                         { set_instr(lexer, $1 ? "unless_null" : "if_null");
                           add_operands(lexer, 2, $3, expr_from_ident($5));
                         }
                  | if_unless target then identifier
                         { set_instr(lexer, $1 ? "unless" : "if");
                           add_operands(lexer, 2, expr_from_target($2), expr_from_ident($4));
                         }
                  | if_unless constant then identifier
                         {
                            /* do an unconditional jump if $2 is true/false */
                         }
                  /*
                  | if_unless expression rel_op expression "goto" identifier
                         { set_instr(lexer, $1 ? get_inverse($3) : $3);
                           add_operands(lexer, 3, $2, $4, expr_from_ident($6));


                         }
                  */
                  | if_unless condition "goto" identifier
                  ;

condition         : target rel_op expression
                  | TK_INTC rel_op target
                  | TK_NUMC rel_op target
                  | TK_INTC rel_op TK_INTC
                  | TK_NUMC rel_op TK_NUMC
                  ;

if_unless         : "if"       { $$ = 0; /* no need to invert */ }
                  | "unless"   { $$ = 1; /* yes, invert opname */ }
                  ;

then              : "goto" /* PIR mode */
                  | ','    /* PASM mode*/
                  ;

goto_stat         : "goto" identifier "\n"
                         { set_instr(lexer, "branch");
                           push_operand(lexer, expr_from_ident($2));
                         }
                  ;

local_decl        : ".local" type local_id_list "\n"
                         { declare_local(lexer, $2, $3); }
                  ;

local_id_list     : local_id
                         { $$ = $1; }
                  | local_id_list ',' local_id
                         { $$ = add_local($1, $3); }
                  ;

local_id          : identifier has_unique_reg
                         { $$ = new_local($1, $2); }
                  ;

has_unique_reg    : /* empty */     { $$ = 0; }
                  | ":unique_reg"   { $$ = 1; }
                  ;

lex_decl          : ".lex" TK_STRINGC ',' lex_target "\n"
                         { /* check whether the target was declared, and if its type is PMC */
                           if ($4 != NULL) {
                               if ($4->type == PMC_TYPE)
                                   set_lex_flag($4, $2);
                               else
                                   yyerror(yyscanner, lexer,
                                           "2nd argument to .lex must be of type PMC");
                           }
                           else {
                                yyerror(yyscanner, lexer, "target for .lex was not declared");
                           }
                         }
                  ;

lex_target        : target
                         { $$ = $1; }
                  | TK_PARROT_OP
                         { $$ = find_target(lexer, $1); }
                  ;

/* Sub/method invocation */


invocation_stat   : long_invocation_stat
                  | short_invocation_stat
                  ;

long_invocation_stat: ".begin_call" "\n"
                      opt_long_arguments
                      long_invocation "\n"
                      opt_long_results
                      ".end_call" "\n"
                           { /* $4 contains an invocation object */
                             set_invocation_args($4, $3);
                             set_invocation_results($4, $6);
                             $$ = NULL;
                           }
                    ;

opt_long_arguments  : /* empty */
                           { $$ = NULL; }
                    | long_arguments
                           { $$ = $1; }
                    ;

long_arguments      : long_argument
                           { $$ = $1; }
                    | long_arguments long_argument
                           { $$ = add_arg($1, $2); }
                    ;

long_argument       : ".arg" short_arg "\n"
                           { $$ = $2; }
                    ;

long_invocation     : ".call" invokable opt_ret_cont
                           { $$ = invoke(lexer, CALL_PCC, $2, $3); }
                    | ".nci_call" invokable
                           { $$ = invoke(lexer, CALL_NCI, $2); }
                    | ".invocant" invokable "\n"
                      ".meth_call" method
                           { $$ = invoke(lexer, CALL_METH, $2, $5); }
                    ;

opt_ret_cont        : /* empty */
                           { $$ = NULL; }
                    | ',' invokable
                           { $$ = $2; }
                    ;



opt_long_results     : /* empty */
                           { $$ = NULL; }
                     | long_results
                           { $$ = $1; }
                     ;

long_results         : long_result
                             { $$ = $1; }
                     | long_results long_result
                             { $$ = add_target(lexer, $1, $2); }
                     ;

long_result          : ".result" result_target "\n"
                             { $$ = $2; }
                     | local_decl
                             { $$ = NULL; }
                     ;

short_invocation_stat: short_invocation "\n"
                     ;


short_invocation     : opt_target_list '=' simple_invocation
                             { set_invocation_results($3, $1); }
                     | target '=' simple_invocation
                             { set_invocation_results($3, $1); }
                     | simple_invocation
                             { set_invocation_results($1, NULL); }
                     ;


simple_invocation    : subcall
                     | methodcall
                     ;

methodcall           : invokable '.' method arguments
                            { $$ = invoke(lexer, CALL_METH, $1, $3);
                              set_invocation_args($$, $4);
                            }
                     ;


subcall              : sub arguments
                            { $$ = invoke(lexer, CALL_PCC, $1, NULL);
                              set_invocation_args($$, $2);
                            }
                     ;

sub                  : invokable
                            { $$ = $1; }
                     | TK_STRINGC
                            { $$ = target_from_string($1); }
                     ;

method               : invokable
                     | string_object
                     ;

invokable            : identifier
                            { symbol *sym = find_symbol(lexer, $1);
                              /* if the symbol was found, its type must be a PMC;
                               * else, if the symbol was not found, it's a global identifier
                               * referring to some other sub. We don't check that during
                               * the parsing phase.
                               */
                              if (sym && sym->type != PMC_TYPE) {
                                  yyerror(yyscanner, lexer,
                                          "invokable identifier must be of type PMC!");
                              }

                              $$ = target_from_ident(PMC_TYPE, $1);
                            }
                     | TK_PREG
                            { $$ = reg(PMC_TYPE, $1); }
                     ;

string_object        : TK_STRINGC
                            { $$ = target_from_string($1); }
                     | TK_SREG
                            { $$ = reg(STRING_TYPE, $1); }
                     ;


opt_target_list      : '(' opt_list ')'
                            { $$ = $2; }
                     ;

opt_list             : /* empty */
                            { $$ = NULL; }
                     | target_list
                            { $$ = $1; }
                     ;

target_list          : result_target
                            { $$ = $1; }
                     | target_list ',' result_target
                            { $$ = add_target(lexer, $1, $3); }
                     ;

result_target        : target target_flags
                            { $$ = $1;
                              set_param_flag($1, $2);
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS($1, $2);
                            }
                     ;

target_flags         : /* empty */
                            { $$ = 0; }
                     | target_flags target_flag
                            { SET_FLAG($$, $2); }
                     ;

target_flag          : ":optional"
                            { $$ = TARGET_FLAG_OPTIONAL; }
                     | ":opt_flag"
                            { $$ = TARGET_FLAG_OPT_FLAG; }
                     | ":slurpy"
                            { $$ = TARGET_FLAG_SLURPY; }
                     | ":unique_reg"
                            { $$ = TARGET_FLAG_UNIQUE_REG; }
                     | ":named" opt_paren_string
                            { $$ = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS($2);
                            }
                     ;

param_flags          : /* empty */
                            { $$ = 0; }
                     | param_flags param_flag
                            { SET_FLAG($$, $2); }
                     ;

param_flag           : target_flag
                     | invocant_param
                     ;

invocant_param       : ":invocant" '(' multi_type ')'
                            { $$ = TARGET_FLAG_INVOCANT; }
                     ;

/* Returning and Yielding */


return_stat          : short_return_stat
                     | long_return_stat
                     ;

yield_stat           : short_yield_stat
                     | long_yield_stat
                     ;

short_return_stat    : ".return" arguments "\n"
                             { $$ = invoke(lexer, CALL_RET);
                               set_invocation_args($$, $2);
                             }
                     | ".return" simple_invocation "\n"
                             { set_invocation_type($2, CALL_TAIL); }
                     ;

short_yield_stat     : ".yield" arguments "\n"
                              { $$ = invoke(lexer, CALL_YIELD);
                                set_invocation_args($$, $2);
                              }
                     ;

arguments            : '(' opt_arguments_list ')'
                              { $$ = $2; }
                     ;

opt_arguments_list   : /* empty */
                              { $$ = NULL; }
                     | arguments_list
                              { $$ = $1; }
                     ;


/**

change semantic actions of arguments in such a way, that arg:expression puts the new
argument object in place. Then, if there's a :named argument, the arg's name can
be set immediately on that object, instead of through a temp. field and those ugly
macros (IF_NAMED_ARG_SET_ALIAS etc.).

**/
arguments_list       : argument
                              { $$ = $1; }
                     | arguments_list ',' argument
                              { $$ = add_arg($1, $3); }
                     ;

argument             : short_arg
                     | named_arg
                     ;

named_arg            : TK_STRINGC "=>" arg
                               { $$ = $3;
                                 set_arg_named($$, $1);
                               }
                     ;

short_arg            : arg arg_flags
                            { $$ = $1;
                              set_arg_flag($$, $2);
                              IF_NAMED_ARG_SET_ALIAS($$, $2);
                            }
                     ;

arg                  : expression
                            { $$ = new_argument($1); }
                     ;

long_return_stat     : ".begin_return" "\n"
                       opt_return_expressions
                       ".end_return" "\n"
                            { $$ = invoke(lexer, CALL_RET);
                              set_invocation_args($$, $3);
                            }
                     ;

long_yield_stat      : ".begin_yield" "\n"
                       opt_yield_expressions
                       ".end_yield" "\n"
                            { $$ = invoke(lexer, CALL_YIELD);
                              set_invocation_args($$, $3);
                            }
                     ;

opt_yield_expressions : /* empty */
                            { $$ = NULL; }
                      | yield_expressions
                            { $$ = $1; }
                      ;


yield_expressions     : yield_expression
                            { $$ = $1; }
                      | yield_expressions yield_expression
                            { $$ = add_arg($1, $2); }
                      ;


yield_expression      : ".yield" short_arg "\n"
                            { $$ = $2; }
                      ;

opt_return_expressions: /* empty */
                            { $$ = NULL; }
                      | return_expressions
                            { $$ = $1; }
                      ;

return_expressions    : return_expression
                            { $$ = $1; }
                      | return_expressions return_expression
                            { $$ = add_arg($1, $2); }
                      ;

return_expression     : ".return" short_arg "\n"
                            { $$ = $2; }
                      ;


arg_flags        : /* empty */
                        { $$ = 0; }
                 | arg_flags arg_flag
                        { SET_FLAG($$, $2); }
                 ;

arg_flag         : ":flat"
                        { $$ = ARG_FLAG_FLAT; }
                 | ":named" opt_paren_string
                        { $$ = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS($2);
                        }
                 ;

opt_paren_string : /* empty */
                        { $$ = NULL; }
                 | paren_string
                        { $$ = $1; }
                 ;

paren_string     : '(' TK_STRINGC ')'
                        { $$ = $2; }
                 ;

const_decl_stat  : const_stat "\n"
                 ;

const_stat       : const_decl
                 | globalconst_decl
                 ;

const_decl       : ".const" const_tail
                        { define_const(lexer, $2, !GLOBALCONST); }
                 ;

globalconst_decl : ".globalconst" const_tail
                        { define_const(lexer, $2, GLOBALCONST); }
                 ;

const_tail       : "int" identifier '=' TK_INTC
                        { $$ = new_const(INT_TYPE, $2, $4); }
                 | "num" identifier '=' TK_NUMC
                        { $$ = new_const(NUM_TYPE, $2, $4); }
                 | "pmc" identifier '=' TK_STRINGC
                        { $$ = new_const(PMC_TYPE, $2, $4); }
                 | "string" identifier '=' TK_STRINGC
                        { $$ = new_const(STRING_TYPE, $2, $4); }
                 ;




/* Expressions, variables and operators */

expression  : target         { $$ = expr_from_target($1); }
            | constant       { $$ = expr_from_const($1); }
            ;

constant    : TK_STRINGC     { $$ = new_const(STRING_TYPE, NULL, $1); }
            | TK_INTC        { $$ = new_const(INT_TYPE, NULL, $1); }
            | TK_NUMC        { $$ = new_const(NUM_TYPE, NULL, $1); }
            ;

rel_op      : "!="           { $$ = "ne"; }
            | "=="           { $$ = "eq"; }
            | "<"            { $$ = "lt"; }
            | "<="           { $$ = "le"; }
            | ">="           { $$ = "ge"; }
            | ">"            { $$ = "gt"; }
            ;

type        : "int"          { $$ = INT_TYPE; }
            | "num"          { $$ = NUM_TYPE; }
            | "pmc"          { $$ = PMC_TYPE; }
            | "string"       { $$ = STRING_TYPE; }
            ;

target      : reg            { $$ = $1; }
            | TK_IDENT       { /* find the symbol; if it's not there, emit an error */
                               symbol *sym = find_symbol(lexer, $1);
                               if (sym == NULL)
                                   yyerror(yyscanner, lexer, "symbol not declared!");
                               else
                                   $$ = new_target(sym->type, $1);
                             }
            ;

reg         : TK_PREG    { $$ = reg(PMC_TYPE, $1); }
            | TK_NREG    { $$ = reg(NUM_TYPE, $1); }
            | TK_IREG    { $$ = reg(INT_TYPE, $1); }
            | TK_SREG    { $$ = reg(STRING_TYPE, $1); }
            ;

identifier  : TK_IDENT
            | TK_PARROT_OP
            ;

unop        : '-'            { $$ = "neg"; }
            | '!'            { $$ = "not"; }
            | '~'            { $$ = "bnot"; }
            ;

binop       : '+'            { $$ = "add"; }
            | '-'            { $$ = "sub"; }
            | '/'            { $$ = "div"; }
            | '*'            { $$ = "mul"; }
            | '%'            { $$ = "mod"; }
            | '|'            { $$ = "bor"; }
            | '&'            { $$ = "band"; }
            | '~'            { $$ = "bxor"; }
            | "**"           { $$ = "pow"; }
            | "."            { $$ = "concat"; }
            | ">>>"          { $$ = "lsr"; }
            | ">>"           { $$ = "shr"; }
            | "<<"           { $$ = "shl"; }
            | "||"           { $$ = "or";  }
            | "&&"           { $$ = "and"; }
            | "//"           { $$ = "fdiv"; }
            | "~~"           { $$ = "xor"; }
            | "=="           { $$ = "iseq"; }
            | "<="           { $$ = "isle"; }
            | "<"            { $$ = "islt"; }
            | ">="           { $$ = "isge"; }
            | ">"            { $$ = "isgt"; }
            | "!="           { $$ = "isne"; }
            ;


augmented_op: "+="         { $$ = "add"; }
            | "-="         { $$ = "sub"; }
            | "*="         { $$ = "mul"; }
            | "%="         { $$ = "mod"; }
            | "**="        { $$ = "pow"; }
            | "/="         { $$ = "div"; }
            | "//="        { $$ = "fdiv"; }
            | "|="         { $$ = "bor"; }
            | "&="         { $$ = "band" }
            | "~="         { $$ = "bxor"; }
            | ".="         { $$ = "concat"; }
            | ">>="        { $$ = "shr"; }
            | "<<="        { $$ = "shl"; }
            | ">>>="       { $$ = "lsr"; }
            ;
%%



/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

