%{

/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*

=head1 NAME

pir.y - Bison specification for the PIR assembly language parser.

=head1 DESCRIPTION

This file implements the parser for the PIR assembly language. During the
parsing phase, data structures are created that represent the input. These
data structures are defined in C<pircompunit.h>.

The parser implements strength reduction and constant folding. Strength
reduction refers to the selection of instructions that have the same
effect as the instruction written by the PIR programmer, but are more
efficient. For instance:

 add $P0, $P0, $P1

can be reduced to:

 add $P0, $P1

as C<$P0> was an IN/OUT operand.

Constant folding refers to the compile-time evaluation of expressions,
if possible. For instance:

 add $I0, 10, 20

can be written as:

 set $I0, 30

as we can evaluate this result during compile time. Likewise, conditional
branch instructions may become unconditional branch instructions (if the
condition evaluates to I<true> during compile time) or it may become a C<noop>
(no op) instruction (if the condition evaluates to I<false> during compile time).

=cut

TODO:
1. improve memory management (free it!)
2. test the parser.
3. generate PBC, using Parrot_PackFile (and related) data structures.
4. handle branch/invoke instructions to calculate offsets etc.
5. handle freezing of PMC constants (representing subs)

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "pirparser.h"
#include "pircompiler.h"
#include "pircompunit.h"
#include "pirsymbol.h"

/* Note: the following sequence of #defines and #includes must be kept in this order.
 * Do not make changes to this; the sequence is important in order to be compilable.
 */

/**** Begin of Sequence. ****/

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

/* include "pirlexer.h" before "piryy.h" */
#include "pirlexer.h"
#include "piryy.h"

/* declare yylex(); do this I<after> including "pirlexer.h" */
extern YY_DECL;

/**** End of Sequence. ****/


/* Enumeration of mathematical operator types; these are used to index the opnames array. */
typedef enum pir_math_operators {
    OP_ADD = 0, /* make sure counting starts at 0 */
    OP_INC,     /* special case for OP_ADD; must be 1 position after OP_ADD */
    OP_SUB,
    OP_DEC,     /* special case for OP_DEC; must be 1 position after OP_SUB */
    OP_DIV,
    OP_MUL,
    OP_MOD,
    OP_BOR,
    OP_BAND,
    OP_BXOR,
    OP_POW,
    OP_CONCAT,
    OP_LSR,
    OP_SHR,
    OP_SHL,
    OP_OR,
    OP_AND,
    OP_FDIV,
    OP_XOR,
    OP_ISEQ,
    OP_ISLE,
    OP_ISLT,
    OP_ISGE,
    OP_ISGT,
    OP_ISNE

} pir_math_operator;

/* relational operator types */
typedef enum pir_rel_operators {
    OP_NE = OP_ISNE + 1,   /* continue after OP_ISNE in pir_math_operator. */
    OP_EQ,
    OP_LT,
    OP_LE,
    OP_GT,
    OP_GE

} pir_rel_operator;

/* names of the binary operators */
static char * const opnames[] = {
    "add",
    "inc", /* use this when "add"ing 1 */
    "sub",
    "dec", /* use this when "sub"ing 1 */
    "div",
    "mul",
    "mod",
    "bor",
    "band",
    "bxor",
    "pow",
    "concat",
    "lsr",
    "shr",
    "shl",
    "or",
    "and",
    "fdiv",
    "xor",
    "iseq",
    "isle",
    "islt",
    "isge",
    "isgt",
    "isne",
    /* note that from here on it's rel. ops; see pir_rel_operator enumeration */
    "ne",
    "eq",
    "lt",
    "le",
    "gt",
    "ge"
};

/* prototypes for constant folding and compile-time evaluation functions */
static constant *fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b);
static constant *fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b);
static constant *fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b);
static constant *fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b);
static constant *fold_s_s(yyscan_t yyscanner, char *a, pir_math_operator op, char *b);

static int evaluate_i_i(int a, pir_rel_operator op, int b);
static int evaluate_n_n(double a, pir_rel_operator op, double b);
static int evaluate_i_n(int a, pir_rel_operator op, double b);
static int evaluate_n_i(double a, pir_rel_operator op, int b);
static int evaluate_s_s(char * const a, pir_rel_operator op, char * const b);

static int evaluate_s(char * const s);
static int evaluate_c(constant * const c);

static char *concat_strings(char *a, char *b);

static void create_if_instr(yyscan_t yyscanner, lexer_state * const lexer, int invert,
                            int hasnull, char * const name, char * const label);

static void do_strength_reduction(lexer_state * const lexer);
static int check_value(constant * const c, int val);

static void check_first_arg_direction(yyscan_t yyscanner, char * const opname);

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


/* the parser aborts if there are more than 10 errors */
#define MAX_NUM_ERRORS  10


%}

/* list all types that can be moved from lexer to parser, or from
 * rule to rule in the parser only.
 */
%union {
    double              dval;
    int                 ival;
    char               *sval;
    struct constant    *cval;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;
    struct key         *key;
    struct symbol      *symb;
}


%token TK_NL                "\n"

%token TK_HLL               ".HLL"
       TK_HLL_MAP           ".HLL_map"
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
       TK_SET_YIELD         ".set_yield"
       TK_SET_RETURN        ".set_return"
       TK_BEGIN_YIELD       ".begin_yield"
       TK_END_YIELD         ".end_yield"
       TK_BEGIN_RETURN      ".begin_return"
       TK_END_RETURN        ".end_return"
       TK_BEGIN_CALL        ".begin_call"
       TK_END_CALL          ".end_call"
       TK_GET_RESULTS       ".get_results"
       TK_CALL              ".call"
       TK_SET_ARG           ".set_arg"
       TK_GET_RESULT        ".get_result"
       TK_NCI_CALL          ".nci_call"
       TK_TAILCALL          ".tailcall"

%token <sval> TK_LABEL      "label"
       <sval> TK_IDENT      "identifier"
       <sval> TK_INT        "int"
       <sval> TK_NUM        "num"
       <sval> TK_PMC        "pmc"
       <sval> TK_STRING     "string"
       <sval> TK_IF         "if"
       <sval> TK_UNLESS     "unless"
       <sval> TK_NULL       "null"
       <sval> TK_GOTO       "goto"

       <sval> TK_STRINGC    "string constant"
       <ival> TK_INTC       "integer constant"
       <dval> TK_NUMC       "number constant"
       <ival> TK_PREG       "PMC register"
       <ival> TK_NREG       "number register"
       <ival> TK_SREG       "string register"
       <ival> TK_IREG       "integer register"

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
       TK_INSTANCEOF        ":instanceof"

%token TK_FLAG_UNIQUE_REG   ":unique_reg"
       TK_FLAG_NAMED        ":named"
       TK_FLAG_SLURPY       ":slurpy"
       TK_FLAG_FLAT         ":flat"
       TK_FLAG_OPTIONAL     ":optional"
       TK_FLAG_OPT_FLAG     ":opt_flag"
       TK_FLAG_INVOCANT     ":invocant"

%type <sval> unop
             identifier
             sub_id
             opt_paren_string
             paren_string
             local_var_name
             keyword
             parrot_op

%type <targ> sub
             method
             pmc_object
             opt_ret_cont
             target
             param
             symbol
             result_target
             long_result
             long_results
             opt_long_results
             opt_target_list
             opt_list
             target_list
             keyaccess


%type <symb> local_id
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
             namespace_slice

%type <key>  keys
             keylist
             opt_namespace
             namespace

%type <ival> has_unique_reg
             type
             target_flags
             target_flag
             param_flags
             param_flag
             invocant_param
             arg_flags
             arg_flag
             if_unless
             binop
             rel_op
             condition
             augmented_op
             unique_reg_flag

%type <invo> long_invocation
             long_invocation_stat
             short_invocation_stat
             methodcall
             subcall
             simple_invocation
             long_yield_stat
             long_return_stat
             short_yield_stat
             short_return_stat
             invocation
             short_invocation
             return_instr

%type <cval> const_tail
             constant


/* needed for reentrancy */
%pure-parser

/* name of generated parser */
%output="pirparser.c"

/* move around a yyscan_t object */
%parse-param {yyscan_t yyscanner}
%lex-param   {yyscan_t yyscanner}

/* The parser is invoked with this extra parameter */
%parse-param {struct lexer_state * const lexer}

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
 * 2: simple rules that have only single tokens as alternatives. See the operators
 *    for an example.
 *
 * + Do not write embedded actions; instead, refactor the grammar by adding
 *   a new rule, so that the previously-embedded action becomes a 'normal'
 *   action.
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
                  ;

loadlib           : ".loadlib" TK_STRINGC
                            { load_library(lexer, $2); }
                  ;

/* HLL stuff      */

hll_specifier     : ".HLL" TK_STRINGC
                            { set_hll(lexer, $2); }
                  ;

hll_mapping       : ".HLL_map" TK_STRINGC '=' TK_STRINGC
                            { set_hll_map(lexer, $2, $4); }
                  ;

namespace_decl    : ".namespace" '[' opt_namespace ']'
                            { set_namespace(lexer, $3); }
                  ;

opt_namespace     : /* empty */
                            { $$ = NULL; }
                  | namespace
                            { $$ = $1; }
                  ;

namespace         : namespace_slice
                            { $$ = new_key($1); }
                  | namespace ';' namespace_slice
                            { $$ = add_key($1, $3); }
                  ;

namespace_slice   : TK_STRINGC
                            { $$ = expr_from_const(new_const(STRING_TYPE, $1)); }
                  ;

sub_def           : sub_head sub_flags "\n"
                    parameter_list
                    instructions
                    sub_end
                  ;

sub_end           : ".end"
                         { close_sub(lexer); }
                  ;

sub_head          : ".sub" sub_id
                         { new_subr(lexer, $2); }
                  ;

sub_id            : identifier
                  | TK_STRINGC
                  ;

sub_flags         : /* empty */
                  | sub_flags sub_flag
                  ;

sub_flag          : ":anon"
                         { set_sub_flag(lexer, SUB_FLAG_ANON);}
                  | ":init"
                         { set_sub_flag(lexer, SUB_FLAG_INIT); }
                  | ":load"
                         { set_sub_flag(lexer, SUB_FLAG_LOAD); }
                  | ":main"
                         { set_sub_flag(lexer, SUB_FLAG_MAIN); }
                  | ":method"
                         { set_sub_flag(lexer, SUB_FLAG_METHOD); }
                  | ":lex"
                         { set_sub_flag(lexer, SUB_FLAG_LEX); }
                  | ":postcomp"
                         { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); }
                  | ":immediate"
                         { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); }
                  | ":multi"
                         { set_sub_flag(lexer, SUB_FLAG_MULTI); }
                  | ":outer" '(' sub_id ')'
                         { set_sub_outer(lexer, $3); }
                  | ":vtable" opt_paren_string
                         { set_sub_vtable(lexer, $2); }
                  | ":lexid" paren_string
                         { set_sub_lexid(lexer, $2); }
                  | ":instanceof" paren_string
                         { set_sub_instanceof(lexer, $2); }
                  ;

multi_type        : identifier
                  | TK_STRINGC
                  | keylist
                  ;

parameter_list    : parameters
                         { generate_get_params(lexer); }
                  ;

parameters        : /* empty */
                  | parameters parameter
                  ;

parameter         : ".param" param param_flags "\n"
                         { set_param_flag(lexer, $2, $3); }
                  ;

param             : type identifier
                         { $$ = add_param(lexer, $1, $2); }
                  ;

param_flags       : /* empty */
                         { $$ = 0; }
                  | param_flags param_flag
                         { SET_FLAG($$, $2); }
                  ;

param_flag        : target_flag
                  | invocant_param
                  | unique_reg_flag
                  ;

invocant_param    : ":invocant" '(' multi_type ')'
                         { $$ = TARGET_FLAG_INVOCANT; /* XXX handle multi_type */}
                  ;

unique_reg_flag   : ":unique_reg"
                         { $$ = TARGET_FLAG_UNIQUE_REG; }
                  ;

/* Instructions */

instructions      : /* empty */
                  | instructions instruction
                  ;

instruction       : TK_LABEL statement
                         { set_label(lexer, $1); }
                  | statement
                  ;

statement         : conditional_stat
                  | goto_stat
                  | local_decl
                  | lex_decl
                  | const_decl_stat
                  | return_stat
                  | invocation_stat
                  | assignment_stat
                  | parrot_stat
                  | getresults_stat
                  | null_stat
                  | empty_stat
                  | error_stat
                  ;

/* make sure a new instruction node is created; call set_instr() for that. */
empty_stat        : "\n"
                        { set_instr(lexer, NULL); }
                  ;

/* "error" is a built-in rule; used for trying to recover. */
error_stat        : error "\n"
                         {
                           if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         }
                  ;

null_stat         : "null" target "\n"
                         { set_instrf(lexer, "null", "%T", $2); }
                  ;

getresults_stat   : ".get_results" opt_target_list "\n"
                         { set_instrf(lexer, "get_results", "%T", $2); }
                  ;

parrot_stat       : parrot_instruction "\n"
                  ;

parrot_instruction: parrot_op opt_op_args
                  ;

parrot_op         : TK_IDENT
                         { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, $1);
                           $$ = $1;
                         }
                  ;

opt_op_args       : op_args
                        { /* when this rule is activated, the initial identifier must
                           * be a parrot op. Check that, and if not, emit an error message.
                           */
                          char * const instr = get_instr(lexer);
                          if (!is_parrot_op(lexer, instr))
                              yyerror(yyscanner, lexer, "'%s' is not a parrot instruction", instr);
                          else
                              do_strength_reduction(lexer);
                        }
                  | keylist_assignment
                  ;

op_args           : /* empty */
                  | parrot_op_args
                  ;

parrot_op_args    : op_arg
                  | parrot_op_args ',' op_arg
                  ;

keylist_assignment: keylist '=' expression
                       {
                         /* the "instruction" that was set now appears to be
                          * an identifier; get the name, and check its type.
                          */
                         char * const instr = get_instr(lexer);
                         symbol *sym        = find_symbol(lexer, instr);
                         target *obj;

                         /* find the symbol for the object being indexed;
                          * it must have been declared
                          */
                         if (sym == NULL) {
                            yyerror(yyscanner, lexer, "indexed object '%s' not declared", instr);
                            sym = new_symbol(instr, PMC_TYPE);
                         }
                         else if (sym->type != PMC_TYPE) /* found symbol, now check it's a PMC */
                            yyerror(yyscanner, lexer,
                                    "indexed object '%s' must be of type 'pmc'", instr);

                         /* convert the symbol into a target */
                         obj = target_from_symbol(sym);

                         /* set the key on the target */
                         set_target_key(obj, $1);
                         /* indexed operation is a "set" opcode */
                         set_instrf(lexer, "set", "%T%E", obj, $3);
                       }
                  ;

op_arg            : expression
                         { push_operand(lexer, $1); }
                  | keylist
                         { push_operand(lexer, expr_from_key($1)); }
                  | keyaccess
                         { push_operand(lexer, expr_from_target($1)); }
                  ;

keyaccess         : pmc_object keylist
                         {
                           /* if $1 is a register, just return that */
                           if (TEST_FLAG($1->flags, TARGET_FLAG_IS_REG))
                               $$ = $1;
                           else { /* it's not a register, so it must be a declared symbol */
                               symbol *sym = find_symbol(lexer, target_name($1));
                               if (sym == NULL) {
                                   yyerror(yyscanner, lexer,
                                           "indexed object '%s' not declared", target_name($1));
                                   /* make sure sym is a valid pointer */
                                   sym = new_symbol(target_name($1), PMC_TYPE);
                               }
                               else if (sym->type != PMC_TYPE)
                                   yyerror(yyscanner, lexer,
                                           "indexed object '%s' is not of type 'pmc'",
                                           target_name($1));

                               /* create a target node based on the symbol node;
                                * sym already has a PASM register, so through
                                * this the target will get that too.
                                */
                               $$ = target_from_symbol(sym);
                           }

                           /* in both cases (register or symbol), set the key on this target */
                           set_target_key($$, $2);
                         }
                  ;

keylist           : '[' keys ']'
                         { $$ = $2; }
                  ;

keys              : expression
                         { $$ = new_key($1); }
                  | keys ';' expression
                         { $$ = add_key($1, $3); }
                  ;


assignment_stat   : assignment "\n"
                  ;

assignment        : target '=' TK_INTC
                        {
                          if ($3 == 0)
                              set_instrf(lexer, "null", "%T", $1);
                          else
                              set_instrf(lexer, "set", "%T%i", $1, $3);
                        }
                  | target '=' TK_NUMC
                        {
                          if ($3 == 0.0)
                              set_instrf(lexer, "null", "%T", $1);
                          else
                              set_instrf(lexer, "set", "%T%n", $1, $3);
                        }
                  | target '=' TK_STRINGC
                        { set_instrf(lexer, "set", "%T%s", $1, $3); }
                  | target '=' binary_expr
                        { unshift_operand(lexer, expr_from_target($1)); }
                  | target '=' parrot_op
                        {
                          symbol *sym = find_symbol(lexer, $3);
                          if (sym == NULL) {
                              if (!is_parrot_op(lexer, $3))
                                  yyerror(yyscanner, lexer, "'%s' is neither a declared symbol "
                                                            "nor a parrot opcode", $3);
                              else { /* handle it as an op */
                                  unshift_operand(lexer, expr_from_target($1));
                                  check_first_arg_direction(yyscanner, $3);
                              }
                          }
                          else /* handle it as a symbol */
                              set_instrf(lexer, "set", "%T%T", $1, target_from_symbol(sym));

                        }
                  | target '=' parrot_op expression ',' parrot_op_args
                        {
                          if (!is_parrot_op(lexer, $3))
                              yyerror(yyscanner, lexer, "'%s' is not a parrot op", $3);
                          else {
                              unshift_operand(lexer, $4);
                              unshift_operand(lexer, expr_from_target($1));
                              check_first_arg_direction(yyscanner, $3);
                              do_strength_reduction(lexer);

                          }
                        }
                  | target '=' parrot_op expression
                        {
                          if (!is_parrot_op(lexer, $3))
                              yyerror(yyscanner, lexer, "'%s' is not a parrot op", $3);
                          else {
                              set_instrf(lexer, $3, "%T%E", $1, $4);
                              check_first_arg_direction(yyscanner, $3);
                              do_strength_reduction(lexer);
                          }
                        }
                  | target '=' parrot_op keylist
                        {
                          symbol *sym = find_symbol(lexer, $3);
                          target *t;
                          if (sym == NULL) {
                              if (is_parrot_op(lexer, $3))
                                  set_instrf(lexer, $3, "%T%E", $1, expr_from_key($4));
                              else
                                  yyerror(yyscanner, lexer, "indexed object '%s' not declared", $3);

                              /* create a symbol node anyway, so we can continue with instr. gen. */
                              sym = new_symbol($3, PMC_TYPE);
                          }
                          /* at this point, sym is not NULL, even if there was an error */
                          if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", $3);

                          t = target_from_symbol(sym);
                          set_target_key(t, $4);
                          set_instrf(lexer, "set", "%T%T", $1, t);
                          /* No need to check first arg's direction; this grammar rule is
                           * only used for keyed acces.
                           */
                        }
                  | target '=' parrot_op keylist ',' parrot_op_args
                        {
                          unshift_operand(lexer, expr_from_key($4));
                          unshift_operand(lexer, expr_from_target($1));
                          check_first_arg_direction(yyscanner, $3);
                        }
                  | target '=' keyword keylist
                        {
                          symbol *sym = find_symbol(lexer, $3);
                          target *t;

                          if (sym == NULL) {
                              yyerror(yyscanner, lexer, "indexed object '%s' not declared", $3);
                              sym = new_symbol($3, PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", $3);

                          t = target_from_symbol(sym);
                          set_target_key(t, $4);
                          set_instrf(lexer, "set", "%T%T", $1, t);
                        }
                  | target '=' TK_PREG keylist
                        {
                          target *preg = new_reg(lexer, PMC_TYPE, $3);
                          set_target_key(preg, $4);
                          set_instrf(lexer, "set", "%T%T", $1, preg);
                        }
                  | target augmented_op expression
                        { set_instrf(lexer, opnames[$2], "%T%E", $1, $3); }
                  | target "+=" TK_INTC
                        {
                          if ($3 == 1)
                              set_instrf(lexer, "inc", "%T", $1);
                          else if ($3 == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%i", $1, $3);
                        }
                  | target "+=" TK_NUMC
                        {
                          if ($3 == 1.0)
                              set_instrf(lexer, "inc", "%T", $1);
                          else if ($3 == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%n", $1, $3);
                        }
                  | target "-=" TK_INTC
                        {
                          if ($3 == 1)
                              set_instrf(lexer, "dec", "%T", $1);
                          else if ($3 == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%i", $1, $3);
                        }
                  | target "-=" TK_NUMC
                        {
                          if ($3 == 1.0)
                              set_instrf(lexer, "dec", "%T", $1);
                          else if ($3 == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%n", $1, $3);
                        }
                  | target "+=" target
                        { set_instrf(lexer, "add", "%T%T", $1, $3); }
                  | target "-=" target
                        { set_instrf(lexer, "sub", "%T%T", $1, $3); }
                  | target '=' unop expression
                        { set_instrf(lexer, $3, "%T%E", $1, $4); }
                  | target '=' target binop target
                        {
                          if (targets_equal($1, $3)) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[$4], "%T%T", $1, $5);
                          else
                              set_instrf(lexer, opnames[$4], "%T%T%T", $1, $3, $5);
                        }
                  | keyword keylist '=' expression
                        {
                          symbol *sym = find_symbol(lexer, $1);
                          target *t;

                          if (sym == NULL) {
                              yyerror(yyscanner, lexer, "indexed object '%s' not declared", $1);
                              /* create a dummy symbol so we can continue without seg. faults */
                              sym = new_symbol($1, PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", $1);
                          /* at this point sym is a valid (possibly dummy) object for sure */
                          t = target_from_symbol(sym);
                          set_target_key(t, $2);
                          set_instrf(lexer, "set", "%T%E", t, $4);
                      }
                  | TK_PREG keylist '=' expression
                        {
                          target *preg = new_reg(lexer, PMC_TYPE, $1);
                          set_target_key(preg, $2);
                          set_instrf(lexer, "set", "%T%E", preg, $4);
                        }
                  ;


/*

=head1 CONSTANT FOLDING

A binary expression consists of two expressions, separated by a binary
operator. An expression can be a C<target> or a literal value. Such a
value can be an C<integer>, C<floating-point> or C<string> literal.

In the case that both operands are constants, we can pre-evaluate
the result of these constants, effectively preventing any calculation
during runtime. For instance:

 $I0 = 42 + 1

can be pre-evaluated as

 $I0 = 43

which will be assembled using the C<set> opcode. Likewise, concatenation
of two strings is done during compile time.

=cut

*/
binary_expr       : TK_INTC binop target
                         { set_instrf(lexer, opnames[$2], "%i%T", $1, $3); }
                  | TK_NUMC binop target
                         { set_instrf(lexer, opnames[$2], "%n%T", $1, $3); }
                  | TK_STRINGC binop target
                         { set_instrf(lexer, opnames[$2], "%s%T", $1, $3); }
                  | TK_STRINGC binop TK_STRINGC
                         { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, $1, $2, $3)); }
                  | TK_INTC binop TK_INTC
                         { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, $1, $2, $3)); }
                  | TK_NUMC binop TK_NUMC
                         { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, $1, $2, $3)); }
                  | TK_INTC binop TK_NUMC
                         { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, $1, $2, $3)); }
                  | TK_NUMC binop TK_INTC
                         { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, $1, $2, $3)); }
                  ;


conditional_stat  : conditional_instr "\n"
                  ;


/* In order to allow all keywords (data type names and words such as "if", "null", etc.
 * a lot of special cases must be distinguished; this is necessary in order to
 * do a correct parse and prevent shift/reduce conflicts.
 */
conditional_instr : if_unless "null" TK_IDENT "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, $3, $4); }
                  | if_unless "null" "int" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, "int", $4); }
                  | if_unless "null" "num" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, "num", $4); }
                  | if_unless "null" "pmc" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, "pmc", $4); }
                  | if_unless "null" "string" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, "string", $4); }
                  | if_unless "null" "if" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, "if", $4); }
                  | if_unless "null" "unless" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, "unless", $4); }
                  | if_unless "null" "goto" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, "goto", $4); }
                  | if_unless "null" "null" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 1, "null", $4); }
                  | if_unless constant then identifier
                        {
                          int istrue = evaluate_c($2);
                          /* if "unless", invert the true-ness */
                          istrue = $1 ? !istrue : istrue;
                          if (istrue) {
                              set_instrf(lexer, "branch", "%I", $4);
                              set_instr_flag(lexer, INSTR_FLAG_BRANCH);
                          }
                          else
                              set_instr(lexer, "noop");
                        }
                  | if_unless TK_IDENT then identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, $2, $4); }
                  | if_unless "int" then identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "int", $4); }
                  | if_unless "num" then identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "num", $4); }
                  | if_unless "pmc" then identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "pmc", $4); }
                  | if_unless "string" then identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "string", $4); }
                  | if_unless "if" then identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "if", $4); }
                  | if_unless "unless" then identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "unless", $4); }
                  | if_unless "goto" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "goto", $4); }
                  | if_unless "goto" ',' identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "goto", $4); }
                  | if_unless "null" "goto" identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "null", $4); }
                  | if_unless "null" ',' identifier
                        { create_if_instr(yyscanner, lexer, $1, 0, "null", $4); }
                  | if_unless condition "goto" identifier
                        {
                          if ($2 == -1) { /* -1 means the condition is evaluated during runtime */
                             if ($1) /* "unless"? if so, invert the instruction. */
                                 invert_instr(lexer);

                             push_operand(lexer, expr_from_ident($4));

                             set_instr_flag(lexer, INSTR_FLAG_ISXX);
                          }
                          else { /* evaluation during compile time */
                             /* if the result was false but the instr. was "unless", or,
                              * if the result was true and the instr. was "if",
                              * do an unconditional jump.
                              */
                             if ( (($2 == 0) && $1) || (($2 == 1) && !$1) ) {
                                set_instrf(lexer, "branch", "%I", $4);
                                set_instr_flag(lexer, INSTR_FLAG_BRANCH);
                             }
                             else
                                set_instr(lexer, "noop");

                          }
                        }
                  ;

/* the condition rule returns -1 if the condition can't be evaluated yet, so
 * it must be done during runtime. Otherwise, if the condition evaluates to
 * "false", 0 is returned, and if true, 1 is returned.
 */
condition         : target rel_op expression
                        {
                          set_instrf(lexer, opnames[$2], "%T%E", $1, $3);
                          $$ = -1;  /* -1 indicates this is evaluated at runtime */
                        }
                  | TK_INTC rel_op target
                        {
                          set_instrf(lexer, opnames[$2], "%i%T", $1, $3);
                          $$ = -1;
                        }
                  | TK_NUMC rel_op target
                        {
                          set_instrf(lexer, opnames[$2], "%n%T", $1, $3);
                          $$ = -1;
                        }
                  | TK_STRINGC rel_op target
                        {
                          set_instrf(lexer, opnames[$2], "%s%T", $1, $3);
                          $$ = -1;
                        }
                  | TK_INTC rel_op TK_INTC
                        { $$ = evaluate_i_i($1, $2, $3); }
                  | TK_INTC rel_op TK_NUMC
                        { $$ = evaluate_i_n($1, $2, $3); }
                  | TK_NUMC rel_op TK_INTC
                        { $$ = evaluate_n_i($1, $2, $3); }
                  | TK_NUMC rel_op TK_NUMC
                        { $$ = evaluate_n_n($1, $2, $3); }
                  | TK_STRINGC rel_op TK_STRINGC
                        { $$ = evaluate_s_s($1, $2, $3); }
                  ;

if_unless         : "if"       { $$ = 0; /* no need to invert */ }
                  | "unless"   { $$ = 1; /* yes, invert opname */ }
                  ;

then              : "goto" /* PIR mode */
                  | ','    /* PASM mode*/
                  ;

goto_stat         : "goto" identifier "\n"
                        {
                          set_instrf(lexer, "branch", "%I", $2);
                          set_instr_flag(lexer, INSTR_FLAG_BRANCH);
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

local_id          : local_var_name has_unique_reg
                        { $$ = new_local($1, $2); }
                  ;

local_var_name    : identifier
                        { /* try to find symbol for this id; if found, it was already declared */
                          symbol *sym = find_symbol(lexer, $1);
                          if (sym)
                              yyerror(yyscanner, lexer, "symbol '%s' is already declared", $1);
                          $$ = $1;
                        }
                  ;

has_unique_reg    : /* empty */     { $$ = 0; }
                  | ":unique_reg"   { $$ = 1; }
                  ;

lex_decl          : ".lex" TK_STRINGC ',' pmc_object "\n"
                        { /* if $4 is not a register, it must be a declared symbol */
                          if (!TEST_FLAG($4->flags, TARGET_FLAG_IS_REG)) {
                              symbol *sym = find_symbol(lexer, target_name($4));

                              if (sym == NULL) /* check declaration */
                                  yyerror(yyscanner, lexer, "lexical '%s' is not declared",
                                          target_name($4));
                              else if (sym->type != PMC_TYPE) /* a .lex must be a PMC */
                                  yyerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                          target_name($4));
                          }
                          set_lex_flag($4, $2);
                        }
                  ;

/* Sub/method invocation */


invocation_stat      : invocation
                           { convert_inv_to_instr(lexer, $1); }
                     ;

invocation           : long_invocation_stat
                     | short_invocation_stat
                     ;

long_invocation_stat : ".begin_call" "\n"
                       opt_long_arguments
                       long_invocation "\n"
                       opt_long_results
                       ".end_call" "\n"
                            { /* $4 contains an invocation object */
                              set_invocation_args($4, $3);
                              set_invocation_results($4, $6);
                              $$ = $4;
                            }
                     ;

opt_long_arguments   : /* empty */
                            { $$ = NULL; }
                     | long_arguments
                            { $$ = $1; }
                     ;

long_arguments       : long_argument
                            { $$ = $1; }
                     | long_arguments long_argument
                            { $$ = add_arg($1, $2); }
                     ;

long_argument        : ".set_arg" short_arg "\n"
                            { $$ = $2; }
                     ;

long_invocation      : ".call" pmc_object opt_ret_cont
                           { $$ = invoke(lexer, CALL_PCC, $2, $3); }
                     | ".nci_call" pmc_object
                           { $$ = invoke(lexer, CALL_NCI, $2); }
                     | ".invocant" pmc_object "\n"
                       ".meth_call" method
                           { $$ = invoke(lexer, CALL_METHOD, $2, $5); }
                     ;

opt_ret_cont         : /* empty */
                           { $$ = NULL; }
                     | ',' pmc_object
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

long_result          : ".get_result" result_target "\n"
                           { $$ = $2; }
                     | local_decl
                           { $$ = NULL; }
                     ;

short_invocation_stat: short_invocation "\n"
                     ;


short_invocation     : opt_target_list '=' simple_invocation
                           { set_invocation_results($3, $1);
                             $$ = $3;
                           }
                     | target '=' simple_invocation
                           { set_invocation_results($3, $1);
                             $$ = $3;
                           }
                     | simple_invocation
                           { set_invocation_results($1, NULL);
                             $$ = $1;
                           }
                     ;

simple_invocation    : subcall
                     | methodcall
                     ;

methodcall           : pmc_object '.' method arguments
                           {
                             /* if $1 is not a register, check whether the symbol was declared */
                             if (!TEST_FLAG($1->flags, TARGET_FLAG_IS_REG)) {
                                 symbol *sym = find_symbol(lexer, target_name($1));
                                 if (sym == NULL)
                                     yyerror(yyscanner, lexer, "object '%s' not declared",
                                             target_name($1));

                                 else if (sym->type != PMC_TYPE)
                                     yyerror(yyscanner, lexer,
                                             "cannot invoke method: '%s' is not of type 'pmc'",
                                             target_name($1));
                             }

                             $$ = invoke(lexer, CALL_METHOD, $1, $3);
                             set_invocation_args($$, $4);
                           }
                     ;

subcall              : sub arguments
                           {
                             $$ = invoke(lexer, CALL_PCC, $1, NULL);
                             set_invocation_args($$, $2);
                           }
                     ;

sub                  : pmc_object
                           { $$ = $1; }
                     | TK_STRINGC
                           { $$ = target_from_string($1); }
                     ;

method               : identifier
                           { /* check that this identifier was declared */
                             symbol *sym = find_symbol(lexer, $1);

                             if (sym == NULL) {
                                yyerror(yyscanner, lexer,
                                        "method identifier '%s' not declared", $1);
                                /* make sure sym is not NULL */
                                sym = new_symbol($1, PMC_TYPE);
                             }
                             else if (sym->type != PMC_TYPE && sym->type != STRING_TYPE)
                                 yyerror(yyscanner, lexer,
                                         "method '%s' must be of type 'pmc' or 'string'", $1);

                             $$ = target_from_symbol(sym);
                           }
                     | TK_PREG
                           { $$ = new_reg(lexer, PMC_TYPE, $1); }
                     | TK_SREG
                           { $$ = new_reg(lexer, STRING_TYPE, $1); }
                     | TK_STRINGC
                           { $$ = target_from_string($1); }
                     ;

pmc_object           : identifier
                           { $$ = target_from_ident(PMC_TYPE, $1); }
                     | TK_PREG
                           { $$ = new_reg(lexer, PMC_TYPE, $1); }

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
                           { $$ = set_param_flag(lexer, $1, $2); }
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
                     | ":named" opt_paren_string
                           {
                             $$ = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, $2);
                           }
                     ;

/* Returning and Yielding */


return_stat          : return_instr
                           { convert_inv_to_instr(lexer, $1); }
                     ;

return_instr         : short_return_stat
                     | long_return_stat
                     | short_yield_stat
                     | long_yield_stat
                     ;

short_return_stat    : ".return" arguments "\n"
                            {
                              $$ = invoke(lexer, CALL_RETURN);
                              set_invocation_args($$, $2);
                            }
                     | ".tailcall" simple_invocation "\n"
                            { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type($2, ($2->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              $$ = $2;
                            }
                     ;

short_yield_stat     : ".yield" arguments "\n"
                            {
                              $$ = invoke(lexer, CALL_YIELD);
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

arguments_list       : argument
                            { $$ = $1; }
                     | arguments_list ',' argument
                            { $$ = add_arg($1, $3); }
                     ;

argument             : short_arg
                     | named_arg
                     ;

named_arg            : TK_STRINGC "=>" arg
                            { $$ = set_arg_alias(lexer, $1); }
                     ;

short_arg            : arg arg_flags
                            { $$ = set_arg_flag($$, $2); }
                     ;

arg                  : expression
                            { $$ = set_curarg(lexer, new_argument($1));  }
                     ;

long_return_stat     : ".begin_return" "\n"
                       opt_return_expressions
                       ".end_return" "\n"
                            {
                              $$ = invoke(lexer, CALL_RETURN);
                              set_invocation_args($$, $3);
                            }
                     ;

long_yield_stat      : ".begin_yield" "\n"
                       opt_yield_expressions
                       ".end_yield" "\n"
                            {
                              $$ = invoke(lexer, CALL_YIELD);
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


yield_expression      : ".set_yield" short_arg "\n"
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

return_expression     : ".set_return" short_arg "\n"
                            { $$ = $2; }
                      ;


arg_flags             : /* empty */
                             { $$ = 0; }
                      | arg_flags arg_flag
                             { SET_FLAG($$, $2); }
                      ;

arg_flag              : ":flat"
                             { $$ = ARG_FLAG_FLAT; }
                      | ":named" opt_paren_string
                             {
                               $$ = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, $2);
                             }
                      ;

opt_paren_string      : /* empty */
                             { $$ = NULL; }
                      | paren_string
                             { $$ = $1; }
                      ;

paren_string          : '(' TK_STRINGC ')'
                             { $$ = $2; }
                      ;

const_decl_stat       : const_stat "\n"
                      ;

const_stat            : const_decl
                      | globalconst_decl
                      ;

const_decl            : ".const" const_tail
                            { store_global_const(lexer, $2); }
                      ;

globalconst_decl      : ".globalconst" const_tail
                            { /* XXX is .globalconst to be kept? */ }
                      ;

const_tail            : "int" identifier '=' TK_INTC
                            { $$ = new_named_const(INT_TYPE, $2, $4); }
                      | "num" identifier '=' TK_NUMC
                            { $$ = new_named_const(NUM_TYPE, $2, $4); }
                      | "string" identifier '=' TK_STRINGC
                            { $$ = new_named_const(STRING_TYPE, $2, $4); }
                      | "pmc" identifier '=' TK_STRINGC
                            { $$ = new_named_const(PMC_TYPE, $2, $4); }
                      /*
                      | "Sub" identifier '=' TK_STRINGC
                      | "Coroutine" identifier '=' TK_STRINGC
                      */

                      /* this might be useful, for:
                         .const "Sub" foo = "foo" # make a Sub PMC of subr. "foo"
                         .const "Float" PI = 3.14 # make a Float PMC for 3.14

                        Is: .const pmc x = 'foo' any useful? Type of x is not clear.

                      | TK_STRINGC identifier '=' constant
                            { $$ = new_pmc_const($1, $2, $4); }
                      */
                      ;



/* Expressions, variables and operators */

expression  : target         { $$ = expr_from_target($1); }
            | constant       { $$ = expr_from_const($1); }
            ;


constant    : TK_STRINGC     { $$ = new_const(STRING_TYPE, $1); }
            | TK_INTC        { $$ = new_const(INT_TYPE, $1); }
            | TK_NUMC        { $$ = new_const(NUM_TYPE, $1); }
            ;

rel_op      : "!="           { $$ = OP_NE; }
            | "=="           { $$ = OP_EQ; }
            | "<"            { $$ = OP_LT; }
            | "<="           { $$ = OP_LE; }
            | ">="           { $$ = OP_GE; }
            | ">"            { $$ = OP_GT; }
            ;

type        : "int"          { $$ = INT_TYPE; }
            | "num"          { $$ = NUM_TYPE; }
            | "pmc"          { $$ = PMC_TYPE; }
            | "string"       { $$ = STRING_TYPE; }
            ;

/* helper rule to set the symbol's target node as the "current"; this is needed for
 * setting flags etc. Instead of duplicating this code for each register type and
 * also for symbols, use this extra rule to do it once.
 */

target      : symbol     { set_curtarget(lexer, $1);  }
            ;

symbol      : TK_PREG    { $$ = new_reg(lexer, PMC_TYPE, $1);    }
            | TK_NREG    { $$ = new_reg(lexer, NUM_TYPE, $1);    }
            | TK_IREG    { $$ = new_reg(lexer, INT_TYPE, $1);    }
            | TK_SREG    { $$ = new_reg(lexer, STRING_TYPE, $1); }
            | identifier { /* a symbol must have been declared; check that at this point. */
                           symbol *sym = find_symbol(lexer, $1);
                           if (sym == NULL) {
                               yyerror(yyscanner, lexer, "symbol '%s' not declared", $1);

                               /* make sure sym is not NULL */
                               sym = new_symbol($1, UNKNOWN_TYPE);
                           }
                           $$ = target_from_symbol(sym);

                         }
            ;

/* an identifier can be any sequence of characters or one of the keywords */
identifier  : TK_IDENT
            | keyword
            ;

keyword     : "if"          { $$ = dupstr(lexer, "if"); }
            | "unless"      { $$ = dupstr(lexer, "unless"); }
            | "goto"        { $$ = dupstr(lexer, "goto"); }
            | "int"         { $$ = dupstr(lexer, "int"); }
            | "num"         { $$ = dupstr(lexer, "num"); }
            | "string"      { $$ = dupstr(lexer, "string"); }
            | "pmc"         { $$ = dupstr(lexer, "pmc"); }
            | "null"        { $$ = dupstr(lexer, "null"); }
            ;

unop        : '-'            { $$ = "neg"; }
            | '!'            { $$ = "not"; }
            | '~'            { $$ = "bnot"; }
            ;

binop       : '+'            { $$ = OP_ADD; }
            | '-'            { $$ = OP_SUB; }
            | '/'            { $$ = OP_DIV; }
            | '*'            { $$ = OP_MUL; }
            | '%'            { $$ = OP_MOD; }
            | '|'            { $$ = OP_BOR; }
            | '&'            { $$ = OP_BAND; }
            | '~'            { $$ = OP_BXOR; }
            | "**"           { $$ = OP_POW; }
            | "."            { $$ = OP_CONCAT; }
            | ">>>"          { $$ = OP_LSR; }
            | ">>"           { $$ = OP_SHR; }
            | "<<"           { $$ = OP_SHL; }
            | "||"           { $$ = OP_OR; }
            | "&&"           { $$ = OP_AND; }
            | "//"           { $$ = OP_FDIV; }
            | "~~"           { $$ = OP_XOR; }
            | "=="           { $$ = OP_ISEQ; }
            | "<="           { $$ = OP_ISLE; }
            | "<"            { $$ = OP_ISLT; }
            | ">="           { $$ = OP_ISGE; }
            | ">"            { $$ = OP_ISGT; }
            | "!="           { $$ = OP_ISNE; }
            ;

/* note that += and -= are separated, because when adding/subtracting 1,
 * this is optimized by using the "inc"/"dec" instructions.
 */
augmented_op: "*="         { $$ = OP_MUL; }
            | "%="         { $$ = OP_MOD; }
            | "**="        { $$ = OP_POW; }
            | "/="         { $$ = OP_DIV; }
            | "//="        { $$ = OP_FDIV; }
            | "|="         { $$ = OP_BOR; }
            | "&="         { $$ = OP_BAND; }
            | "~="         { $$ = OP_BXOR; }
            | ".="         { $$ = OP_CONCAT; }
            | ">>="        { $$ = OP_SHR; }
            | "<<="        { $$ = OP_SHL; }
            | ">>>="       { $$ = OP_LSR; }
            ;

%%

#include <math.h>
#include <assert.h>
#include "parrot/oplib/ops.h"

/*

=head1 FUNCTIONS

=over 4

=item C<static constant *
fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b)>

Evaluates the expression C<a op b> and returns a constant node
containing the result value. Both C<a> and C<b> are integer values.

=cut

*/
static constant *
fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b) {
    int result;

    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0!");
            else
                result = a / b;
            break;
        case OP_MUL:
            result = a * b;
            break;
        case OP_MOD:
            result = a % b;
            break;
        case OP_BOR:
            result = (a | b);
            break;
        case OP_BAND:
            result = (a & b);
            break;
        case OP_BXOR:
            result = (a ^ b);
            break;
        case OP_POW:
            result = pow(a, b);
            break;
        case OP_CONCAT:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot concatenate operands of type 'int' and 'int'");
            break;
        case OP_LSR:
            /* from bits.ops: $1 = (INTVAL)((UINTVAL)$2 >> $3); */
            result = (int)((unsigned)a >> b);
            break;
        case OP_SHR:
            result = a >> b;
            break;
        case OP_SHL:
            result = a << b;
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            /* 7 // 2 -> 3, this is what integer division does (rounding down to whole integers) */
            result = a / b;
            break;
        case OP_XOR:
            result = a ^ b;
            break;
        case OP_ISEQ:
            result = (a == b);
            break;
        case OP_ISLE:
            result = (a <= b);
            break;
        case OP_ISLT:
            result = (a < b);
            break;
        case OP_ISGE:
            result = (a >= b);
            break;
        case OP_ISGT:
            result = (a > b);
            break;
        case OP_ISNE:
            result = (a != b);
            break;

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            panic("detected 'inc' or 'dec' in fold_i_i()");
            break;
    }
    return new_const(INT_TYPE, result);
}

/*

=item C<static constant *
fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b)>

Same as C<fold_i_i>, except C<a> is of type double.

=cut

*/
static constant *
fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b) {
    double result;
    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0!");
            else
                result = a / b;
            break;
        case OP_MUL:
            result = a * b;
            break;
        case OP_MOD:
        case OP_BOR:
        case OP_BAND:
        case OP_BXOR:
        case OP_SHR:
        case OP_SHL:
        case OP_LSR:
        case OP_XOR:
        case OP_CONCAT:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot apply binary operator '%s' to types 'num' and 'int'", opnames[op]);
            break;
        case OP_POW:
            result = pow(a, b);
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            result = floor(a / b);
            break;
        case OP_ISEQ:
            result = (a == b);
            break;
        case OP_ISLE:
            result = (a <= b);
            break;
        case OP_ISLT:
            result = (a < b);
            break;
        case OP_ISGE:
            result = (a >= b);
            break;
        case OP_ISGT:
            result = (a > b);
            break;
        case OP_ISNE:
            result = (a != b);
            break;

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            panic("detected 'inc' or 'dec' in fold_n_i()");
            break;
    }
    return new_const(NUM_TYPE, result);
}

/*

=item C<static constant *
fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b)>

Same as C<fold_i_i>, except C<b> is of type double.

=cut

*/
static constant *
fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b) {
    double result;

    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0!");
            else
                result = a / b;
            break;
        case OP_MUL:
            result = a * b;
            break;
        case OP_MOD:
        case OP_BOR:
        case OP_BAND:
        case OP_BXOR:
        case OP_LSR:
        case OP_SHR:
        case OP_SHL:
        case OP_XOR:
        case OP_CONCAT:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot apply binary operator '%s' to types 'int' and 'num'", opnames[op]);
            break;
        case OP_POW:
            result = pow(a, b);
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            result = floor(a / b);
            break;
        case OP_ISEQ:
            result = (a == b);
            break;
        case OP_ISLE:
            result = (a <= b);
            break;
        case OP_ISLT:
            result = (a < b);
            break;
        case OP_ISGE:
            result = (a >= b);
            break;
        case OP_ISGT:
            result = (a > b);
            break;
        case OP_ISNE:
            result = (a != b);
            break;

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            panic("detected 'inc' or 'dec' in fold_i_n()");
            break;
    }
    return new_const(NUM_TYPE, result);
}

/*

=item C<static constant *
fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b)>

Same as C<fold_i_i>, except that both C<a> and C<b> are of type double.

=cut

*/
static constant *
fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b) {
    double result;
    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0) /* throw exception ? */
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0");
            else
                result = a / b;
            break;
        case OP_MUL:
            result = a * b;
            break;
        case OP_POW:
            result = pow(a, b);
            break;
        case OP_MOD:
        case OP_BOR:
        case OP_BAND:
        case OP_BXOR:
        case OP_CONCAT:
        case OP_LSR:
        case OP_SHR:
        case OP_SHL:
        case OP_XOR:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot apply binary operator '%s' to arguments of type number", opnames[op]);
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0");
            else
                result = floor(a / b);
            break;
        case OP_ISEQ:
            result = (a == b);
            break;
        case OP_ISLE:
            result = (a <= b);
            break;
        case OP_ISLT:
            result = (a < b);
            break;
        case OP_ISGE:
            result = (a >= b);
            break;
        case OP_ISGT:
            result = (a > b);
            break;
        case OP_ISNE:
            result = (a != b);
            break;

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            break;
    }
    return new_const(NUM_TYPE, result);
}

/*

=item C<static constant *
fold_s_s(yyscan_t yyscanner, char *a, pir_math_operator op, char *b)>

Evaluate the expression C<a op b>, where both C<a> and C<b> are
strings. Only the concatenation and comparison operators are implemented;
other operators will result in an error.

=cut

*/
static constant *
fold_s_s(yyscan_t yyscanner, char *a, pir_math_operator op, char *b) {
    switch (op) {
        case OP_CONCAT:
            return new_const(STRING_TYPE, concat_strings(a, b));

        case OP_ADD:
        case OP_SUB:
        case OP_DIV:
        case OP_MUL:
        case OP_POW:
        case OP_MOD:
        case OP_BOR:
        case OP_BAND:
        case OP_BXOR:
        case OP_LSR:
        case OP_SHR:
        case OP_SHL:
        case OP_XOR:
        case OP_OR:
        case OP_AND:
        case OP_FDIV:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot apply binary operator '%s' to arguments of type number", opnames[op]);
            return new_const(STRING_TYPE, a);

        case OP_ISEQ:
        case OP_ISLE:
        case OP_ISLT:
        case OP_ISGE:
        case OP_ISGT:
        case OP_ISNE:
            return new_const(INT_TYPE, (1 == evaluate_s_s(a, op, b)));


        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            panic("detected 'inc' or 'dec' in fold_s_s()");
            break;
    }
    return NULL;
}

/*

=item C<static int
evaluate_i_i(int a, pir_rel_operator op, double b)>

Compare C<a> with C<b> according to the relational operator C<op>.
Wrapper for C<evaluate_n_n>, which takes arguments of type double.

=cut

*/
static int
evaluate_i_i(int a, pir_rel_operator op, int b) {
    return evaluate_n_n(a, op, b);
}

/*

=item C<static int
evaluate_n_i(int a, pir_rel_operator op, double b)>

Compare C<a> with C<b> according to the relational operator C<op>.
Wrapper for C<evaluate_n_n>, which takes arguments of type double.

=cut

*/
static int
evaluate_n_i(double a, pir_rel_operator op, int b) {
    return evaluate_n_n(a, op, b);
}

/*

=item C<static int
evaluate_i_n(int a, pir_rel_operator op, double b)>

Compare C<a> with C<b> according to the relational operator C<op>.
Wrapper for C<evaluate_n_n>, which takes arguments of type double.

=cut

*/
static int
evaluate_i_n(int a, pir_rel_operator op, double b) {
    return evaluate_n_n(a, op, b);
}

/*

=item C<static int
evaluate_n_n(double a, pir_rel_operator op, double b)>

Compare C<a> with C<b> according to the relational operator C<op>.
C<op> can be C<<!=>>, C<<==>>, C<< < >>, C<< <= >>, C<< > >> or C<< >= >>.

=cut

*/
static int
evaluate_n_n(double a, pir_rel_operator op, double b) {
    switch (op) {
        case OP_NE:
            return (a != b);
        case OP_EQ:
            return (a == b);
        case OP_LT:
            return (a < b);
        case OP_LE:
            return (a <= b);
        case OP_GT:
            return (a > b);
        case OP_GE:
            return (a >= b);
        default:
            return 0;
    }
}

/*

=item C<static int
evaluate_s_s(char *a, pir_rel_operator op, char *b)>

Compare string C<a> with string C<b> using the operator C<op>.
The function uses C's C<strcmp> function. Based on that result,
which can be -1 (smaller), 0 (equal) or 1 (larger), a boolean
result is returned.
Note that C<strcmp()> should not be replaced by the C<STREQ> macro used throughout
Parrot source code; this function uses the result of C<strcmp()>.

=cut

*/
static int
evaluate_s_s(char * const a, pir_rel_operator op, char * const b) {
    int result = strcmp(a, b); /* do /not/ use STREQ; we're interested in the result. */

    switch (op) {
        case OP_NE:
            return (result != 0);
        case OP_EQ:
            return (result == 0);
        case OP_LT:
            return (result < 0);
        case OP_LE:
            return (result <= 0);
        case OP_GT:
            return (result > 0);
        case OP_GE:
            return (result >= 0);
        default:
            return -1;
    }
}

/*

=item C<static int
evaluate_s(char * const s)>

Evaluate a string in boolean context; if the string's length is 0, it's false.
If the string equals "0", ".0", "0." or "0.0", it's false.
Otherwise, it's true.

=cut

*/
static int
evaluate_s(char * const s) {
    int strlen_s = strlen(s);

    if (strlen_s > 0) {
        if (strlen_s <= 3) { /* if strlen > 3, (max. nr of characters to represent "0")
                                no need to do expensive string comparison; it must be true. */
            if (STREQ(s, "0") || STREQ(s, ".0") || STREQ(s, "0.") || STREQ(s, "0.0"))
                return 0;
            else  /* short string but not equal to "0.0" or a variant */
                return 1;
        }
        else /* strlen > 3, so does not contain "0.0" or a variant */
            return 1;
    }
    else
        return 0; /* strlen is not larger than 0 */
}

/*

=item C<static int
evaluate_c(constant * const c)>

Evaluate a constant node in boolean context; if the constant is numeric,
it must be non-zero to be true; if it's a string, C<evaluate_s> is invoked
to evaluate the string.

=cut

*/
static int
evaluate_c(constant * const c) {
    switch (c->type) {
        case INT_TYPE:
            return (c->val.ival != 0);
        case NUM_TYPE:
            return (c->val.nval != 0);
        case STRING_TYPE:
            return evaluate_s(c->val.sval);
        case PMC_TYPE:
        case UNKNOWN_TYPE:
            panic("impossible constant type in evaluate_c()");
            break;
    }
    return 0; /* keep compiler happy; will never happen. */
}

/*

=item C<static char *
concat_strings(char *a, char *b)>

Concatenates two strings into a new buffer; frees all memory
of the old strings. The new string is returned.

=cut

*/
static char *
concat_strings(char *a, char *b) {
    int strlen_a = strlen(a);
    char *newstr = (char *)calloc(strlen_a + strlen(b) + 1, sizeof (char));
    assert(newstr != NULL);
    strcpy(newstr, a);
    strcpy(newstr + strlen_a, b);
    free(a);
    free(b);
    a = b = NULL;
    return newstr;
}


/*

=item C<static void
create_if_instr(yyscan_t yyscanner, lexer_state *lexer, int invert, int hasnull,
                char * const name, char * const label)>

Create an C<if> or C<unless> instruction; if C<invert> is non-zero (true), the
C<if> instruction is inverted, effectively becoming C<unless>.

If C<hasnull> is non-zero (true), the C<if> instruction becomes C<if_null>; again,
if C<invert> is non-zero, the instruction becomes C<unless_null>.

C<name> is the name of the variable that is checked during this instruction

=cut

*/
static void
create_if_instr(yyscan_t yyscanner, lexer_state * const lexer, int invert, int hasnull,
                char * const name,
                char * const label)
{
    /* try to find the symbol; if it was declared it will be found; otherwise emit an error. */
    symbol *sym = find_symbol(lexer, name);
    if (sym == NULL) {
        yyerror(yyscanner, lexer, "symbol '%s' not declared'", name);
        /* create a dummy symbol so we can continue without segfaulting. */
        sym = new_symbol(name, UNKNOWN_TYPE);
    }
    /* if there was a keyword "null", use the if/unless_null instruction variants. */
    if (hasnull)
        set_instrf(lexer, invert ? "unless_null" : "if_null", "%T%I", target_from_symbol(sym),
                   label);
    else
        set_instrf(lexer, invert ? "unless" : "if", "%T%I", target_from_symbol(sym), label);

    /* set a flag on this instruction */
    set_instr_flag(lexer, INSTR_FLAG_IFUNLESS);
}

/*

=item C<static int
check_value(constant * const c, int val)>

Check whether the current value of the constant C<c> equals C<val>.
For our purposes, it is sufficient to check for integer values (including
a check against 1.0 or 0.0). If the values are indeed equal, true is returned,
false otherwise. If the constant is not numeric, it returns always false.

=cut

*/
static int
check_value(constant * const c, int val) {
    switch(c->type) {
        case INT_TYPE:
            return (c->val.ival == val);
        case NUM_TYPE:
            return (c->val.nval == val);
        default:
            break;
    }
    return 0;
}

/*

=item C<static void
do_strength_reduction(lexer_state * const lexer)>

Implement strength reduction for the math operators C<add>, C<sub>, C<mul>, C<div> and C<fdiv>.
If the current instruction is any of these, then the first two operands are checked; if both
are targets and are equal, the second operand is removed; this means that the first operand
will be an IN/OUT operand. For instance:

 add $I0, $I0, $I1

becomes:

 add $I0, $I1

and

 add $I0, 1

becomes:

 inc $I0

=cut

*/
static void
do_strength_reduction(lexer_state * const lexer) {
    char * const instr         = get_instr(lexer);
    int          op            = -1;
    int          num_operands;
    expression  *arg1          = NULL;
    expression  *arg2          = NULL;

    int opcode = CURRENT_INSTRUCTION(lexer)->opcode;

    assert(opcode >= 0);

/*
    fprintf(stderr, "do_strength_reduction()\n");

    */
    /* note that the signature is not correct at this point; opcode may point to any variant
     * of the op; we don't know the actual signature of this op; this will be calculated later;
     * therefore, all variants must be considered. */

    switch (opcode) {
        case PARROT_OP_add_i_i:
        case PARROT_OP_add_i_ic:
        case PARROT_OP_add_n_n:
        case PARROT_OP_add_n_nc:
        case PARROT_OP_add_i_i_i:
        case PARROT_OP_add_i_ic_i:
        case PARROT_OP_add_i_i_ic:
        case PARROT_OP_add_n_n_n:
        case PARROT_OP_add_n_nc_n:
        case PARROT_OP_add_n_n_nc:
            op = OP_ADD;
            break;
        case PARROT_OP_div_i_i:
        case PARROT_OP_div_i_ic:
        case PARROT_OP_div_n_n:
        case PARROT_OP_div_n_nc:
        case PARROT_OP_div_i_i_i:
        case PARROT_OP_div_i_ic_i:
        case PARROT_OP_div_i_i_ic:
        case PARROT_OP_div_i_ic_ic:
        case PARROT_OP_div_n_n_n:
        case PARROT_OP_div_n_nc_n:
        case PARROT_OP_div_n_n_nc:
        case PARROT_OP_div_n_nc_nc:
            op = OP_DIV;
            break;
        case PARROT_OP_mul_i_i:
        case PARROT_OP_mul_i_ic:
        case PARROT_OP_mul_n_n:
        case PARROT_OP_mul_n_nc:
        case PARROT_OP_mul_i_i_i:
        case PARROT_OP_mul_i_ic_i:
        case PARROT_OP_mul_i_i_ic:
        case PARROT_OP_mul_n_n_n:
        case PARROT_OP_mul_n_nc_n:
        case PARROT_OP_mul_n_n_nc:
            op = OP_MUL;
            break;
        case PARROT_OP_fdiv_i_i:
        case PARROT_OP_fdiv_i_ic:
        case PARROT_OP_fdiv_n_n:
        case PARROT_OP_fdiv_n_nc:
        case PARROT_OP_fdiv_i_i_i:
        case PARROT_OP_fdiv_i_ic_i:
        case PARROT_OP_fdiv_i_i_ic:
        case PARROT_OP_fdiv_n_n_n:
        case PARROT_OP_fdiv_n_nc_n:
        case PARROT_OP_fdiv_n_n_nc:
            op = OP_FDIV;
            break;
        case PARROT_OP_sub_i_i:
        case PARROT_OP_sub_i_ic:
        case PARROT_OP_sub_n_n:
        case PARROT_OP_sub_n_nc:
        case PARROT_OP_sub_i_i_i:
        case PARROT_OP_sub_i_ic_i:
        case PARROT_OP_sub_i_i_ic:
        case PARROT_OP_sub_n_n_n:
        case PARROT_OP_sub_n_nc_n:
        case PARROT_OP_sub_n_n_nc:
            op = OP_SUB;
            break;
        default:
            return;
    }


    /* if the instruction is "add", "sub", "mul", "div" or "fdiv", do continue... */

/*
    if (STREQ(instr, "add"))
        op = OP_ADD;
    else if (STREQ(instr, "sub"))
        op = OP_SUB;
    else if (STREQ(instr, "mul"))
        op = OP_MUL;
    else if (STREQ(instr, "div"))
        op = OP_DIV;
    else if (STREQ(instr, "fdiv"))
        op = OP_FDIV;
    else
        return;

*/

    num_operands = get_operand_count(lexer);

    /*
    fprintf(stderr, "num_operands: %d\n", num_operands);
    */

    if (num_operands > 2) {
        /* get the operands */
        expression *op1, *op2;
        get_operands(lexer, 2, &op1, &op2);

        /* check whether operands are in fact targets */
        if ((op1->type == EXPR_TARGET) && (op2->type == EXPR_TARGET)) {

            /*
            fprintf(stderr, "op1->type == EXPR_TARGET && op2->type == EXPR_TARGET\n");
            */

            /* check whether targets are equal */
            if (targets_equal(op1->expr.t, op2->expr.t)) {
                /* in that case, remove the second one */
                op1->next = op2->next;
                free(op2);
                --num_operands;
            }
        }
    }

    /* don't even try to change "add $I0, 1" into "inc $I0" if number of operands is not 2 */
    if (num_operands != 2) {
        /*
        fprintf(stderr, "num_operands != 2\n");
        */
        return;
    }

    /*
    fprintf(stderr, "num_operands == 2\n");
    */

    get_operands(lexer, 2, &arg1, &arg2);
    assert(arg1);
    assert(arg2);

    switch (op) {
        case OP_ADD:
        case OP_SUB:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0)) { /* add $I0, 0  --> <delete> */
                    update_instr(lexer, "noop");
                    remove_all_operands(lexer);
                }
                else if (check_value(arg2->expr.c, 1)) { /* add $I0, 1 --> inc $I0 */
                    update_instr(lexer, opnames[op + 1]);

                    arg1->next = arg2->next;
                    /*free(arg2);*/
                }
            }
            break;
        case OP_MUL:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0)) {  /* mul $I0, 0 --> null $I0 */
                    update_instr(lexer, "null");

                    arg1->next = arg2->next;
                  /*  free(arg2); */
                }
                else if (check_value(arg2->expr.c, 1)) { /* mul $I0, 1 --> <delete> */
                    update_instr(lexer, "noop");
                    remove_all_operands(lexer);
                }
            }
            break;
        case OP_DIV:
        case OP_FDIV:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0)) /* div $I0, 0 --> error */
                    pirerror(lexer, "cannot divide by 0");
                else if (check_value(arg2->expr.c, 1)) { /* div $I0, 1 --> <delete> */
                    update_instr(lexer, "noop");
                    remove_all_operands(lexer);
                }
            }
            break;
        default:
            break;
    }

    fprintf(stderr, "do_strength_reduction() done\n");
}

/*

=item C<static void
check_first_arg_direction(yyscan_t yyscanner, char * const opname)>

This function checks the first argument's  direction of the op C<opname>.
If the direction is not C<OUT>, a syntax error is emitted. This function assumes
that C<opname> is a valid parrot op. This check is done to complain about
valid PIR syntax that is undesirable, such as:

 $S0 = print

which is another way of writing:

 print $S0

As the first argument C<$S0> is an C<IN> argument, the sugared version should
not be allowed.

=cut

*/
static void
check_first_arg_direction(yyscan_t yyscanner, char * const opname) {
    int dir_first_arg;
    lexer_state * const lexer = yyget_extra(yyscanner);

    assert(CURRENT_INSTRUCTION(lexer)->opinfo);

    /* get the direction of the first argument */
    dir_first_arg = CURRENT_INSTRUCTION(lexer)->opinfo->dirs[0];

    /* direction cannot be IN or INOUT */
    if (dir_first_arg != PARROT_ARGDIR_OUT)
        yyerror(yyscanner, lexer, "cannot write first arg of op '%s' as a target "
                                  "(direction of argument is not OUT).", opname);


}

/*

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

