%{

/*
 * $Id$
 * Copyright (C) 2007-2009, Parrot Foundation.
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

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "parrot/oplib/ops.h"

#include "pircompiler.h"
#include "pircompunit.h"
#include "pirsymbol.h"
#include "piryy.h"
#include "pirmacro.h"
#include "pirpcc.h"
#include "pirerr.h"
#include "pirop.h"

/* #defines to prevent declarations of malloc() and free() in pirparser.h */
#define YYMALLOC
#define YYFREE
#include "pirparser.h"

/* #define to prevent declaration of yypirlex() in pirlexer.h */
#define YY_DECL
#include "pirlexer.h"

int yypirlex(YYSTYPE *yylval, yyscan_t yyscanner);

#ifdef _WIN32
/* prevent warnings about unreachable code. */
#  pragma warning (disable:4702)
/* prevent warnings about possible loss of data. */
#  pragma warning (disable:4244)
/* prevent warnings about uninitialized yylval object. */
#  pragma warning (disable:4701)

#else


#endif

/* HEADERIZER HFILE: none */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

char *expand_macro(yyscan_t yyscanner, macro_def * const macro, macro_param * args);

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
    OP_GT,
    OP_LT,
    OP_GE,
    OP_LE

} pir_rel_operator;

/* names of the binary operators */
static char const * const opnames[] = {
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
    "gt", /* 1 position before "lt" */
    "lt",
    "ge", /* 1 position before "le" */
    "le"
};

/* prototypes for constant folding and compile-time evaluation functions */
static constant *fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b);
static constant *fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b);
static constant *fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b);
static constant *fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b);
static constant *fold_s_s(yyscan_t yyscanner, char const *a, pir_math_operator op, char const *b);

static int evaluate_i_i(int a, pir_rel_operator op, int b);
static int evaluate_n_n(double a, pir_rel_operator op, double b);
static int evaluate_i_n(int a, pir_rel_operator op, double b);
static int evaluate_n_i(double a, pir_rel_operator op, int b);
static int evaluate_s_s(char const * const a, pir_rel_operator op, char const * const b);

static int evaluate_s(char const * const s);
static int evaluate_c(lexer_state * const lexer, constant * const c);

static char *concat_strings(lexer_state * const lexer, char const * a, char const * b);

static void create_if_instr(lexer_state * const lexer, int invert,
                            int hasnull, char const * const name, char const * const label);

static void do_strength_reduction(lexer_state * const lexer);
static int check_value(constant * const c, int val);

static void check_first_arg_direction(lexer_state * const lexer, char const * const opname);

static int check_op_args_for_symbols(lexer_state * const lexer);


static void undeclared_symbol(lexer_state * const lexer, char const * const symbol);

/* names of the Parrot types. Note that pir_type_names is (file-)global,
 * but it's read-only, so that's fine.
 */
static char const * const pir_type_names[] = { "int", "string", "pmc", "num" };


/* enable debugging of generated parser */
#define YYDEBUG         1

/* enable slightly more helpful error messages */
#define YYERROR_VERBOSE 1

#ifndef YYENABLE_NLS
#  define YYENABLE_NLS 0
#endif

#ifndef YYLTYPE_IS_TRIVIAL
#  define YYLTYPE_IS_TRIVIAL 0
#endif


/* the parser aborts if there are more than 10 errors */
#define MAX_NUM_ERRORS          10

#define COMPUTE_DURING_RUNTIME  -1

#define DONT_INVERT_OPNAME      0

#define NEED_INVERT_OPNAME      1

%}

/* list all types that can be moved from lexer to parser, or from
 * rule to rule in the parser only.
 */
%union {
    double              dval;
    int                 ival;
    unsigned            uval;
    char   const       *sval;
    struct constant    *cval;
    struct constdecl   *cdec;
    struct ucstring    *ustr;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;
    struct key         *key;
    struct symbol      *symb;
    struct macro_def   *mval;
    struct macro_param *pval;

}


%token TK_HLL               ".HLL"
       TK_LOADLIB           ".loadlib"

%token TK_SUB               ".sub"
       TK_END               ".end"
       TK_PARAM             ".param"
       TK_LEX               ".lex"
       TK_LINE              ".line"
       TK_FILE              ".file"
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
       TK_ANNOTATE          ".annotate"

%token <ival> TK_NL         "\n"

%token <sval> TK_LABEL      "label"
       <sval> TK_IDENT      "identifier"

%token <sval> TK_INT        "int"
       <sval> TK_NUM        "num"
       <sval> TK_PMC        "pmc"
       <sval> TK_STRING     "string"
       <sval> TK_IF         "if"
       <sval> TK_UNLESS     "unless"
       <sval> TK_NULL       "null"
       <sval> TK_GOTO       "goto"

%token <sval> TK_STRINGC    "string constant"
       <ustr> TK_USTRINGC   "unicode string"
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
       TK_FLAG_SUBID        ":subid"
       TK_FLAG_INSTANCEOF   ":instanceof"
       TK_FLAG_NSENTRY      ":nsentry"

%token TK_FLAG_UNIQUE_REG   ":unique_reg"
       TK_FLAG_NAMED        ":named"
       TK_FLAG_SLURPY       ":slurpy"
       TK_FLAG_FLAT         ":flat"
       TK_FLAG_OPTIONAL     ":optional"
       TK_FLAG_OPT_FLAG     ":opt_flag"
       TK_FLAG_INVOCANT     ":invocant"
       TK_FLAG_LOOKAHEAD    ":lookahead"

/* tokens and types for macro layer */

%token TK_MACRO                    ".macro"
       TK_ENDM                     ".endm"
       TK_MACRO_LOCAL              ".macro_local"
       TK_MACRO_LABEL              ".macro_label"
       TK_MACRO_CONST              ".macro_const"

%token <sval> TK_MACRO_LABEL_ID    "macro-label"
       <sval> TK_MACRO_LOCAL_ID    "macro-local"
       <mval> TK_MACRO_IDENT       "macro-identifier"
       <sval> TK_MACRO_ARG_IDENT   "macro-id-argument"
       <sval> TK_MACRO_ARG_OTHER   "macro-argument"
       <sval> TK_MACRO_CONST_VAL   "macro-constant"

%type <pval> opt_macro_args
             macro_args
             macro_arg_list

%type <sval> macro_arg

/* for PASM */

%token        TK_PASM_MARKER_START "<pasm-input>"
%token        TK_PIR_MARKER_START  "<pir-input>"
%token        TK_PCC_SUB           ".pcc_sub"
%token <sval> TK_PARROT_OP         "parrot-op"

/* normal rules and types */

%type <sval> unop
             identifier
             sub_id
             opt_paren_string
             paren_string
             keyword
             parrot_op
             macro_expansion
             braced_contents
             braced_arg
             braced_item
             rhs_ident

%type <targ> sub
             pmc_object
             opt_ret_cont
             target
             reg
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
             parameter


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
             method
             op_arg_expr
             multi_type
             opt_multi_types
             multi_types

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
             invocant_flag
             lookahead_flag
             arg_flags
             arg_flag
             if_unless
             binop
             rel_op
             condition
             augmented_op
             unique_reg_flag
             int_or_num

%type <uval> parameters

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

%type <cval> constant
             stringconst
             pmc_const

%type <cdec> const_tail
             const_decl
             globalconst_decl
             const_stat
             basic_const_tail
             pmc_const_tail


/* all exported functions start with "yypir", instead of default "yy". */
%name-prefix="yypir"

%debug

/* generate a header file with all token definitions for the lexer */
%defines

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

/* start rule */
%start TOP



%%

/* Top-level rules */


/* the very first token indicates what kind of file it is, and therefore
 * acts as a selector for the right grammar.
 */
TOP               : "<pir-input>"  pir_contents
                  | "<pasm-input>" pasm_contents
                  ;

/* PIR grammar */

pir_contents      : opt_nl
                    pir_chunks
                    opt_nl
                        { fixup_global_labels(lexer); }
                  ;

opt_nl            : /* empty */
                  | newline
                  ;

newline           : "\n"
                        { lexer->linenr += $1; }
                  ;

pir_chunks        : pir_chunk
                  | pir_chunks newline pir_chunk
                  ;

pir_chunk         : sub_def
                  | const_decl_chunk
                  | namespace_decl
                  | hll_specifier
                  | loadlib
                  | location_directive
                  | macro_definition
                  | error_stat
                  ;


/* implementation of macro layer: macro definition */


macro_definition  : macro_const
                  | macro
                  ;

macro_const       : ".macro_const" TK_IDENT TK_MACRO_CONST_VAL
                        { new_macro_const(lexer->macros, $2, $3, yypirget_lineno(yyscanner)); }
                  ;

macro             : macro_header '(' macro_parameters ')' "\n"
                    macro_body
                    ".endm"
                        { /* fprintf(stderr, "macro body: [%s]\n", CURRENT_MACRO(lexer)->body);*/ }
                  ;

macro_header      : ".macro" identifier
                        {
                          new_macro(lexer->macros, $2, yypirget_lineno(yyscanner), TRUE,
                                    lexer->macro_size);
                        }
                  ;

macro_parameters  : /* empty */
                  | macro_params
                  ;

macro_params      : macro_param
                  | macro_params ',' macro_param
                  ;

macro_param       : identifier
                        { add_macro_param(CURRENT_MACRO(lexer), $1); }
                  ;

macro_body        : /* empty */
                  | macro_statements
                  ;

macro_statements  : macro_statement
                  | macro_statements macro_statement
                  ;

macro_statement   : macro_instr newline
                  ;

macro_instr       : macro_label_decl
                  | macro_local_decl
                  ;

macro_label_decl  : ".macro_label" TK_MACRO_LABEL_ID
                        { store_macro_string(CURRENT_MACRO(lexer), "%s\n", $2); }
                  ;

macro_local_decl  : ".macro_local" type TK_MACRO_LOCAL_ID
                        {
                          store_macro_string(CURRENT_MACRO(lexer), ".local %s %s\n",
                                             pir_type_names[$2], $3);
                        }
                  ;

/* end of macro layer: definition */



loadlib           : ".loadlib" TK_STRINGC
                        { load_library(lexer, $2); }
                  ;

location_directive: ".line" TK_INTC
                        { yypirset_lineno ($2, yyscanner); }
                  | ".file" TK_STRINGC
                        { lexer->filename = $2; }
                  ;

/* HLL stuff      */

hll_specifier     : ".HLL" TK_STRINGC
                        { set_hll(lexer, $2); }
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
                        { $$ = new_key(lexer, $1); }
                  | namespace ';' namespace_slice
                        { $$ = add_key(lexer, $1, $3); }
                  ;

namespace_slice   : TK_STRINGC
                        { $$ = expr_from_string(lexer, $1); }
                  ;

sub_def           : sub_head sub_flags newline
                    parameter_list
                    instructions
                    sub_end
                  ;

sub_end           : ".end"
                         { close_sub(lexer); }
                  ;

sub_head          : ".sub" sub_id
                         { new_subr(lexer, lexer->sval /*$2*/); }
                  ;

sub_id            : identifier
                  | TK_STRINGC
                  ;

sub_flags         : /* empty */
                  | sub_flags sub_flag
                  ;

sub_flag          : ":anon"
                         { set_sub_flag(lexer, PIRC_SUB_FLAG_ANON);}
                  | ":init"
                         { set_sub_flag(lexer, PIRC_SUB_FLAG_INIT); }
                  | ":load"
                         { set_sub_flag(lexer, PIRC_SUB_FLAG_LOAD); }
                  | ":main"
                         { set_sub_flag(lexer, PIRC_SUB_FLAG_MAIN); }
                  | ":lex"
                         { set_sub_flag(lexer, PIRC_SUB_FLAG_LEX); }
                  | ":postcomp"
                         { set_sub_flag(lexer, PIRC_SUB_FLAG_POSTCOMP); }
                  | ":immediate"
                         { set_sub_flag(lexer, PIRC_SUB_FLAG_IMMEDIATE); }
                  | ":multi" multi_type_list
                         { set_sub_flag(lexer, PIRC_SUB_FLAG_MULTI); }
                  | ":outer" '(' sub_id ')'
                         { set_sub_outer(lexer, $3); }
                  | ":method" opt_paren_string
                         { set_sub_methodname(lexer, $2); }
                  | ":vtable" opt_paren_string
                         { set_sub_vtable(lexer, $2); }
                  | ":subid" paren_string
                         { set_sub_subid(lexer, $2); }
                  | ":instanceof" paren_string
                         { set_sub_instanceof(lexer, $2); }
                  | ":nsentry" paren_string
                         { set_sub_nsentry(lexer, $2); }
                  ;

multi_type_list   : '(' opt_multi_types ')'
                        { set_sub_multi_types(lexer, $2); }
                  ;

opt_multi_types   : /* empty */
                        {
                          CURRENT_SUB(lexer)->info.num_multi_types = 1;
                          /* n=1 means :multi() -- without any types. */
                        }
                  | multi_types
                        { $$ = $1; }
                  ;

multi_types       : multi_type
                        {
                          CURRENT_SUB(lexer)->info.num_multi_types = 2;
                          /* start counting multi types; always 1 higher than actual number
                           * so that n=0 means no :multi, n=1 means :multi(), n=2 means
                           * :multi(Type1), n=3 means :multi(Type1,Type2), etc.
                           */
                           $$ = $1;
                        }
                  | multi_types ',' multi_type
                        {
                          ++CURRENT_SUB(lexer)->info.num_multi_types;
                          /* link the multi types in reverse other. That's fine,
                           * as long as you remember that it's reversed.
                           */
                          $3->next = $1;
                          $$ = $3;
                        }
                  ;

multi_type        : identifier
                        { $$ = expr_from_ident(lexer, $1); }
                  | TK_STRINGC
                        { $$ = expr_from_string(lexer, $1); }
                  | keylist
                        { $$ = expr_from_key(lexer, $1); }
                  ;

parameter_list    : parameters
                         { generate_parameters_instr(lexer, $1); }
                  ;

parameters        : /* empty */
                        { $$ = 0; }
                  | parameters parameter
                        {
                          /* if the :named flag was set, there's an extra
                           * constant string argument for the name. count that too.
                           */
                          if (TEST_FLAG($2->flags, TARGET_FLAG_NAMED))
                              $$ += 2;
                          else
                              ++$$;

                        }
                  ;

parameter         : ".param" param param_flags newline
                         { $$ = set_param_flag(lexer, $2, $3); }
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
                  | invocant_flag
                  | lookahead_flag
                  | unique_reg_flag
                  ;

lookahead_flag    : ":lookahead" paren_string
                         {
                           $$ = TARGET_FLAG_LOOKAHEAD;
                           set_param_alias(lexer, $2);
                         }
                  ;

invocant_flag     : ":invocant" '(' multi_type ')'
                         { $$ = TARGET_FLAG_INVOCANT;
                           /* XXX handle multi_type */

                         }
                  ;

unique_reg_flag   : ":unique_reg"
                         { $$ = TARGET_FLAG_UNIQUE_REG; }
                  ;

/* Instructions */

instructions      : /* empty */
                  | instructions instruction
                        {
                         ++lexer->stmt_counter;
                         /* increment the logical statement counter; a statement can be
                          * multiple lines, but each statement has its own ID for the
                          * linear scan register allocator.
                          */
                        }
                  ;

instruction       : TK_LABEL statement
                        { set_label(lexer, $1); }
                  | statement
                  ;

statement         : parrot_stat
                  | conditional_stat
                  | goto_stat
                  | local_decl
                  | lex_decl
                  | const_decl_stat
                  | return_stat
                  | invocation_stat
                  | assignment_stat
                  | getresults_stat
                  | null_stat
                  | empty_stat
                  | location_stat
                  | expansion_stat
                  | annotation
                  | error_stat
                  ;

annotation        : ".annotate" TK_STRINGC ',' constant newline
                        { annotate(lexer, $2, $4); }
                  ;


/* grammar rules for macro expansion; .macro_const expansions are done in the lexer. */

expansion_stat    : macro_expansion
                  ;

macro_expansion   : TK_MACRO_IDENT opt_macro_args newline
                        { $$ = expand_macro(yyscanner, $1, $2); }
                  ;

opt_macro_args    : /* empty */
                        { $$ = NULL; }
                  | '(' macro_args ')'
                        { $$ = $2; }
                  ;

macro_args        : /* empty */
                        { $$ = NULL; }
                  | macro_arg_list
                  ;

macro_arg_list    : macro_arg
                        { $$ = new_macro_param($1); }
                  | macro_arg_list ',' macro_arg
                        {
                          macro_param *param = new_macro_param($3);
                          param->next = $1;
                          $$ = param;
                        }
                  ;

macro_arg         : TK_MACRO_ARG_IDENT  /* identifiers are handled separately to check them */
                        {
                          symbol *sym = find_symbol(lexer, $1);
                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "macro argument '%s' is not a "
                                                           "declared identifier", $1);
                          }
                        }
                  | TK_MACRO_ARG_OTHER  /* all other macro argument options */
                  | TK_MACRO_IDENT opt_macro_args
                        { $$ = expand_macro(yyscanner, $1, $2); }
                  | braced_arg
                  ;

braced_arg        : '{' braced_contents '}'
                        { $$ = $2; }
                  ;


braced_contents   : /* empty */
                        { $$ = ""; }
                  | braced_contents braced_item
                        { /* XXX cleanup memory stuff */
                          char *newbuff = (char *)mem_sys_allocate((strlen($1) + strlen($2) + 2)
                                                                   * sizeof (char));
                          sprintf(newbuff, "%s %s", $1, $2);
                          $$ = newbuff;
                        }
                  ;

braced_item       : "\n"
                        { $$ = "\n"; }
                  | TK_MACRO_ARG_OTHER
                  | TK_MACRO_ARG_IDENT
                  | TK_MACRO_IDENT opt_macro_args
                        { $$ = expand_macro(yyscanner, $1, $2); }
                  ;

/* end of macro expansion */


/* make sure a new instruction node is created; call set_instr() for that. */
empty_stat        : newline
                        { set_instr(lexer, NULL); }
                  ;

location_stat     : location_directive newline
                  ;

/* "error" is a built-in rule; used for trying to recover. */
error_stat        : error newline
                         {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         }
                  ;

null_stat         : "null" target newline
                         {
                           set_instrf(lexer, "null", "%T", $2);
                           get_opinfo(lexer);
                         }
                  ;

getresults_stat   : ".get_results" opt_target_list newline
                         {
                           generate_getresults_instr(lexer, $2);
                         }
                  ;

parrot_stat       : parrot_instruction newline
                  ;

parrot_instruction: parrot_op opt_op_args
                  | parrot_op_assign
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
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(lexer))
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
                         char const * const instr = CURRENT_INSTRUCTION(lexer)->opname;
                         symbol     *       sym   = find_symbol(lexer, instr);
                         target     *       obj;

                         /* find the symbol for the object being indexed;
                          * it must have been declared.
                          */
                         if (sym == NULL) {
                            yypirerror(yyscanner, lexer, "indexed object '%s' not declared", instr);
                            sym = new_symbol(lexer, instr, PMC_TYPE);
                         }
                         else if (sym->info.type != PMC_TYPE)
                            /* found symbol, now check it's a PMC */
                            yypirerror(yyscanner, lexer,
                                    "indexed object '%s' must be of type 'pmc'", instr);

                         /* convert the symbol into a target */
                         obj = target_from_symbol(lexer, sym);

                         /* set the key on the target */
                         set_target_key(obj, $1);

                         /* indexed operation is a "set" opcode */
                         update_instr(lexer, "set");
                         unshift_operand(lexer, $3);
                         unshift_operand(lexer, expr_from_target(lexer, obj));

                         get_opinfo(lexer);
                       }
                  ;

op_arg            : op_arg_expr
                         { push_operand(lexer, $1); }
                  | keylist
                         { push_operand(lexer, expr_from_key(lexer, $1)); }
                  ;

op_arg_expr       : constant
                         { $$ = expr_from_const(lexer, $1); }
                  | identifier
                         { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           $$ = expr_from_ident(lexer, $1);
                         }
                  | reg
                         { $$ = expr_from_target(lexer, $1); }
                  | keyaccess
                         { $$ = expr_from_target(lexer, $1); }
                  ;

keyaccess         : pmc_object keylist
                         {
                           /* if $1 is a register, just return that */
                           if (TEST_FLAG($1->flags, TARGET_FLAG_IS_REG))
                               $$ = $1;
                           else { /* it's not a register, so it must be a declared symbol */
                               if ($1->info->type != PMC_TYPE)
                                   yypirerror(yyscanner, lexer,
                                           "indexed object '%s' is not of type 'pmc'",
                                           $1->info->id.name);

                               /* create a target node based on the symbol node;
                                * sym already has a PASM register, so through
                                * this the target will get that too.
                                */
                               $$ = $1;
                           }

                           /* in both cases (register or symbol), set the key on this target */
                           set_target_key($$, $2);
                         }
                  ;

keylist           : '[' keys ']'
                         { $$ = $2; }
                  ;

keys              : expression
                         { $$ = new_key(lexer, $1); }
                  | keys ';' expression
                         { $$ = add_key(lexer, $1, $3); }
                  ;

/* The rule parrot_op_assign has alternatives that all include a parrot_op;
 * these alternatives all call the check_op_args_for_symbols() function.
 * Note the first two similar rules; they need separation as shown, to prevent
 * reduce conflicts when compiling (by Bison) this parser specification.
 */
parrot_op_assign  : target '=' parrot_op op_arg_expr ',' parrot_op_args
                        {
                          /* the instruction is already set in parrot_op rule */
                          unshift_operand(lexer, $4);
                          unshift_operand(lexer, expr_from_target(lexer, $1));

                          if (check_op_args_for_symbols(lexer)) {
                              check_first_arg_direction(lexer, $3);
                              do_strength_reduction(lexer);
                          }
                        }
                  | target '=' parrot_op op_arg_expr
                        {
                          /* the instruction is already set in parrot_op rule */
                          unshift_operand(lexer, $4);
                          unshift_operand(lexer, expr_from_target(lexer, $1));

                          /* if checking op args is successful, do other checks */
                          if (check_op_args_for_symbols(lexer)) {
                              check_first_arg_direction(lexer, $3);
                              do_strength_reduction(lexer);
                          }
                        }
                  | target '=' parrot_op keylist ',' parrot_op_args
                        {
                          unshift_operand(lexer, expr_from_key(lexer, $4));
                          unshift_operand(lexer, expr_from_target(lexer, $1));
                          if (check_op_args_for_symbols(lexer))
                              check_first_arg_direction(lexer, $3);
                              /* no strength reduction here */
                        }
                  ;

assignment_stat   : assignment newline
                  ;

rhs_ident         : TK_IDENT
                  | keyword
                  ;

assignment        : target '=' TK_INTC
                        {
                          if ($3 == 0)
                              set_instrf(lexer, "null", "%T", $1);
                          else
                              set_instrf(lexer, "set", "%T%i", $1, $3);
                          CURRENT_INSTRUCTION(lexer)->sourceline = lexer->linenr;
                          get_opinfo(lexer);
                        }
                  | target '=' TK_NUMC
                        {
                          if ($3 == 0.0)
                              set_instrf(lexer, "null", "%T", $1);
                          else
                              set_instrf(lexer, "set", "%T%n", $1, $3);

                          get_opinfo(lexer);
                        }
                  | target '=' stringconst
                        {
                          set_instrf(lexer, "set", "%T%C", $1, $3);
                          get_opinfo(lexer);
                        }
                  | target '=' reg
                        {
                          set_instrf(lexer, "set", "%T%T", $1, $3);
                          get_opinfo(lexer);
                        }
                  | target '=' rhs_ident
                        {
                          symbol *sym = find_symbol(lexer, $3);
                          if (sym) {
                              target *rhs = target_from_symbol(lexer, sym);
                              if (!targets_equal($1, rhs)) {
                                  set_instrf(lexer, "set", "%T%T", $1, rhs);
                                  get_opinfo(lexer);
                              }
                          }
                          else { /* not a symbol */
                              if (is_parrot_op(lexer, $3)) {
                                  set_instrf(lexer, $3, "%T", $1);
                                  get_opinfo(lexer);
                              }
                              else {
                                  yypirerror(yyscanner, lexer, "'%s' is neither a declared symbol "
                                             "nor a parrot opcode", $3);
                              }
                          }
                        }
                  | target '=' binary_expr
                        {
                          unshift_operand(lexer, expr_from_target(lexer, $1));
                          get_opinfo(lexer);
                        }
                  | target '=' parrot_op keylist
                        {
                          /*   $P0 = foo ["bar"]    # PIR style
                           *
                           * could be PIR sugar for this PASM code:
                           *
                           *    foo $P0, ["bar"]    # PASM style
                           *
                           * but as this sugar is already used for keyed access, the parser
                           * will not allow the former syntax; if there is an op C<foo>,
                           * where the second operand is a key, then this must be written
                           * in PASM style (shown above).
                           */
                          symbol *sym = find_symbol(lexer, $3);
                          target *t;
                          if (sym == NULL) {
                              if (is_parrot_op(lexer, $3)) {
                                  set_instrf(lexer, $3, "%T%E", $1, expr_from_key(lexer, $4));
                                  get_opinfo(lexer);
                              }
                              else
                                  yypirerror(yyscanner, lexer,
                                             "indexed object '%s' not declared", $3);

                              /* create a symbol node anyway, so we can continue with instr. gen. */
                              sym = new_symbol(lexer, $3, PMC_TYPE);
                          }
                          else {
                              /* at this point, sym is not NULL, even if there was an error */
                              if (sym->info.type != PMC_TYPE)
                                  yypirerror(yyscanner, lexer,
                                          "indexed object '%s' must be of type 'pmc'", $3);

                              t = target_from_symbol(lexer, sym);
                              set_target_key(t, $4);
                              update_instr(lexer, "set");
                              unshift_operand(lexer, expr_from_target(lexer, t));
                              unshift_operand(lexer, expr_from_target(lexer, $1));
                              get_opinfo(lexer);
                          }
                        }
                  | target '=' keyword keylist
                        {
                          symbol *sym = find_symbol(lexer, $3);
                          target *t;

                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "indexed object '%s' not declared", $3);
                              sym = new_symbol(lexer, $3, PMC_TYPE);
                          }
                          else if (sym->info.type != PMC_TYPE)
                              yypirerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", $3);

                          t = target_from_symbol(lexer, sym);
                          set_target_key(t, $4);
                          set_instrf(lexer, "set", "%T%T", $1, t);
                          get_opinfo(lexer);
                        }
                  | target '=' TK_PREG keylist
                        {
                          target *preg = new_reg(lexer, PMC_TYPE, $3);
                          set_target_key(preg, $4);
                          set_instrf(lexer, "set", "%T%T", $1, preg);
                          get_opinfo(lexer);
                        }
                  | target augmented_op expression
                        {
                          set_instrf(lexer, opnames[$2], "%T%E", $1, $3);
                          get_opinfo(lexer);
                        }
                  | target "+=" TK_INTC
                        {
                          if ($3 == 1)
                              set_instrf(lexer, "inc", "%T", $1);
                          else if ($3 == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%i", $1, $3);

                          get_opinfo(lexer);
                        }
                  | target "+=" TK_NUMC
                        {
                          if ($3 == 1.0)
                              set_instrf(lexer, "inc", "%T", $1);
                          else if ($3 == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%n", $1, $3);

                          get_opinfo(lexer);
                        }
                  | target "-=" TK_INTC
                        {
                          if ($3 == 1)
                              set_instrf(lexer, "dec", "%T", $1);
                          else if ($3 == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%i", $1, $3);

                          get_opinfo(lexer);
                        }
                  | target "-=" TK_NUMC
                        {
                          if ($3 == 1.0)
                              set_instrf(lexer, "dec", "%T", $1);
                          else if ($3 == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%n", $1, $3);

                          get_opinfo(lexer);
                        }
                  | target "+=" target
                        {
                          set_instrf(lexer, "add", "%T%T", $1, $3);
                          get_opinfo(lexer);
                        }
                  | target "-=" target
                        {
                          set_instrf(lexer, "sub", "%T%T", $1, $3);
                          get_opinfo(lexer);
                        }
                  | target '=' unop expression
                        {
                          set_instrf(lexer, $3, "%T%E", $1, $4);
                          get_opinfo(lexer);
                        }
                  | target '=' target binop expression
                        {
                          if (targets_equal($1, $3)) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[$4], "%T%E", $1, $5);
                          else
                              set_instrf(lexer, opnames[$4], "%T%T%E", $1, $3, $5);

                          get_opinfo(lexer);
                          do_strength_reduction(lexer);
                        }
                  | keyword keylist '=' expression
                        {
                          symbol *sym = find_symbol(lexer, $1);
                          target *t;

                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "indexed object '%s' not declared", $1);
                              /* create a dummy symbol so we can continue without seg. faults */
                              sym = new_symbol(lexer, $1, PMC_TYPE);
                          }
                          else if (sym->info.type != PMC_TYPE)
                              yypirerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", $1);
                          /* at this point sym is a valid (possibly dummy) object for sure */
                          t = target_from_symbol(lexer, sym);
                          set_target_key(t, $2);
                          set_instrf(lexer, "set", "%T%E", t, $4);
                          get_opinfo(lexer);
                      }
                  | TK_PREG keylist '=' expression
                        {
                          target *preg = new_reg(lexer, PMC_TYPE, $1);
                          set_target_key(preg, $2);
                          set_instrf(lexer, "set", "%T%E", preg, $4);
                          get_opinfo(lexer);
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


conditional_stat  : conditional_instr newline
                        { get_opinfo(lexer); }
                  ;


/* In order to allow all keywords (data type names and words such as "if", "null", etc.
 * a lot of special cases must be distinguished; this is necessary in order to
 * do a correct parse and prevent shift/reduce conflicts.
 */
conditional_instr : if_unless "null" TK_IDENT "goto" identifier
                        { create_if_instr(lexer, $1, 1, $3, $5); }
                  | if_unless "null" "int" "goto" identifier
                        { create_if_instr(lexer, $1, 1, "int", $5); }
                  | if_unless "null" "num" "goto" identifier
                        { create_if_instr(lexer, $1, 1, "num", $5); }
                  | if_unless "null" "pmc" "goto" identifier
                        { create_if_instr(lexer, $1, 1, "pmc", $5); }
                  | if_unless "null" "string" "goto" identifier
                        { create_if_instr(lexer, $1, 1, "string", $5); }
                  | if_unless "null" "if" "goto" identifier
                        { create_if_instr(lexer, $1, 1, "if", $5); }
                  | if_unless "null" "unless" "goto" identifier
                        { create_if_instr(lexer, $1, 1, "unless", $5); }
                  | if_unless "null" "goto" "goto" identifier
                        { create_if_instr(lexer, $1, 1, "goto", $5); }
                  | if_unless "null" "null" "goto" identifier
                        { create_if_instr(lexer, $1, 1, "null", $5); }
                  | if_unless constant then identifier
                        {
                          int istrue = evaluate_c(lexer, $2);
                          /* if "unless", invert the true-ness */
                          istrue = $1 ? !istrue : istrue;
                          if (istrue) {
                              set_instrf(lexer, "branch", "%I", $4);
                              set_op_labelflag(lexer, BIT(1));
                          }
                          else
                              set_instr(lexer, "noop");
                        }
                  | if_unless "null" TK_PREG then identifier
                        {
                          set_instrf(lexer, $1 ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, $3), $5);
                          /* set a flag indicating that the 2nd operand is a label */
                          set_op_labelflag(lexer, BIT(1));
                        }
                  | if_unless TK_IDENT then identifier
                        { create_if_instr(lexer, $1, 0, $2, $4); }
                  | if_unless reg then identifier
                        {
                          set_instrf(lexer, $1 ? "unless" : "if", "%T%I", $2, $4);
                          /* set a flag indicating that the 2nd operand is a label */
                          set_op_labelflag(lexer, BIT(1));
                        }
                  | if_unless "int" then identifier
                        { create_if_instr(lexer, $1, 0, "int", $4); }
                  | if_unless "num" then identifier
                        { create_if_instr(lexer, $1, 0, "num", $4); }
                  | if_unless "pmc" then identifier
                        { create_if_instr(lexer, $1, 0, "pmc", $4); }
                  | if_unless "string" then identifier
                        { create_if_instr(lexer, $1, 0, "string", $4); }
                  | if_unless "if" then identifier
                        { create_if_instr(lexer, $1, 0, "if", $4); }
                  | if_unless "unless" then identifier
                        { create_if_instr(lexer, $1, 0, "unless", $4); }
                  | if_unless "goto" "goto" identifier
                        { create_if_instr(lexer, $1, 0, "goto", $4); }
                  | if_unless "goto" ',' identifier
                        { create_if_instr(lexer, $1, 0, "goto", $4); }
                  | if_unless "null" "goto" identifier
                        { create_if_instr(lexer, $1, 0, "null", $4); }
                  | if_unless "null" ',' identifier
                        { create_if_instr(lexer, $1, 0, "null", $4); }
                  | if_unless condition "goto" identifier
                        {
                          if ($2 == COMPUTE_DURING_RUNTIME) {
                             if ($1 == NEED_INVERT_OPNAME) /* "unless" */
                                 invert_instr(lexer);

                             push_operand(lexer, expr_from_ident(lexer, $4));
                             /* set a flag indicating that the 3rd operand is a label */
                             set_op_labelflag(lexer, BIT(2));
                          }
                          else { /* evaluation during compile time */
                             /* if the result was false but the instr. was "unless", or,
                              * if the result was true and the instr. was "if",
                              * do an unconditional jump.
                              */
                             if (($2 == FALSE && $1 == NEED_INVERT_OPNAME)/* unless false -> jump */
                             ||  ($2 == TRUE  && $1 == DONT_INVERT_OPNAME)) {  /* if true -> jump */
                                set_instrf(lexer, "branch", "%I", $4);
                                set_op_labelflag(lexer, BIT(0));
                             }
                             else                       /* if false, unless true --> do nothing */
                                set_instr(lexer, "noop");

                          }
                        }
                  ;

/* the condition rule returns COMPUTE_DURING_RUNTIME (-1) if the condition can't be evaluated yet,
 * so it must be done during runtime. Otherwise, if the condition evaluates to
 * "false", FALSE (0) is returned, and if true, TRUE (1) is returned.
 */
condition         : target rel_op expression
                        {
                          /* the instructions "gt" and "ge" are converted to "lt" and "le".
                           * if so, then the arguments must be reversed as well. "lt" and
                           * "le" are 1 position after "gt" and "ge" respectively in the
                           * opnames array; hence the [$2 + 1] index.
                           */

                          /* NOTE: a reference is made here to $<ival>0. This is the <ival> of
                           * $0, which refers to the (non)terminal /before/ the use of
                           * the "condition" rule, in this case "if_unless". If the value
                           * of that non-terminal is in fact "NEED_INVERT_OPNAME", then
                           * we shouldn't do it here, as the inversion of "le" or "lt" is
                           * again "ge" or "gt", and these instructions don't exist.
                           *
                           * Note that this usage is Perfectly Safe, as long as we are sure
                           * that $0 has in fact a <ival>. As "condition" is only used in
                           * exactly one place in the whole grammar, we can be sure of this.
                           */
                          if (($<ival>0 != NEED_INVERT_OPNAME) && ($2 == OP_GE || $2 == OP_GT))
                              set_instrf(lexer, opnames[$2 + 1], "%E%T", $3, $1);
                          else
                              set_instrf(lexer, opnames[$2], "%T%E", $1, $3);

                          $$ = COMPUTE_DURING_RUNTIME;  /* indicates this is evaluated at runtime */
                        }
                  | TK_INTC rel_op target
                        {
                          if (($<ival>0 != NEED_INVERT_OPNAME) && ($2 == OP_GE || $2 == OP_GT))
                              set_instrf(lexer, opnames[$2 + 1], "%T%i", $3, $1);
                          else
                              set_instrf(lexer, opnames[$2], "%i%T", $1, $3);
                          $$ = COMPUTE_DURING_RUNTIME;
                        }
                  | TK_NUMC rel_op target
                        {
                          if (($<ival>0 != NEED_INVERT_OPNAME) && ($2 == OP_GE || $2 == OP_GT))
                              set_instrf(lexer, opnames[$2 + 1], "%T%n", $3, $1);
                          else
                              set_instrf(lexer, opnames[$2], "%n%T", $1, $3);

                          $$ = COMPUTE_DURING_RUNTIME;
                        }
                  | TK_STRINGC rel_op target
                        {
                          if (($<ival>0 != NEED_INVERT_OPNAME) && ($2 == OP_GE || $2 == OP_GT))
                              set_instrf(lexer, opnames[$2], "%T%s", $3, $1);
                          else
                              set_instrf(lexer, opnames[$2], "%s%T", $1, $3);

                          $$ = COMPUTE_DURING_RUNTIME;
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

                  /* if not catching these cases, error message is obscure */
                  | TK_STRINGC rel_op int_or_num
                        {
                          yypirerror(yyscanner, lexer, "cannot compare string to %s",
                                     $3 == INT_TYPE ? "integer" : "number");
                        }
                  | TK_INTC rel_op TK_STRINGC
                        { yypirerror(yyscanner, lexer, "cannot compare integer to string"); }
                  | TK_NUMC rel_op TK_STRINGC
                        { yypirerror(yyscanner, lexer, "cannot compare number to string"); }
                  ;

/* helper rule to for error catching; this rule is needed to prevent shift/reduce conflicts. */
int_or_num        : TK_INTC    { $$ = INT_TYPE; }
                  | TK_NUMC    { $$ = NUM_TYPE; }
                  ;

if_unless         : "if"       { $$ = DONT_INVERT_OPNAME; /* no need to invert */ }
                  | "unless"   { $$ = NEED_INVERT_OPNAME; /* yes, invert opname */ }
                  ;

then              : "goto" /* PIR mode */
                  | ','    /* PASM mode*/
                  ;

goto_stat         : "goto" identifier newline
                        {
                          set_instrf(lexer, "branch", "%I", $2);
                          set_op_labelflag(lexer, BIT(0)); /* bit 0 means: "1 << 0" */
                          get_opinfo(lexer);
                        }
                  ;

local_decl        : ".local" type local_id_list newline
                        { declare_local(lexer, $2, $3); }
                  ;

local_id_list     : local_id
                        { $$ = $1; }
                  | local_id_list ',' local_id
                        { $$ = add_local($1, $3); }
                  ;

local_id          : identifier has_unique_reg
                        { $$ = new_local(lexer, $1, $2); }
                  ;

has_unique_reg    : /* empty */     { $$ = 0; }
                  | ":unique_reg"   { $$ = 1; }
                  ;

lex_decl          : ".lex" TK_STRINGC ',' pmc_object newline
                        { /* if $4 is not a register, it must be a declared symbol */
                          if (!TEST_FLAG($4->flags, TARGET_FLAG_IS_REG)) {

                              if ($4->info->type != PMC_TYPE) /* a .lex must be a PMC */
                                  yypirerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                             $4->info->id.name);
                          }
                          set_lex_flag(lexer, $4, $2);
                        }
                  ;

/* Sub/method invocation */


invocation_stat      : invocation
                           { convert_inv_to_instr(lexer, $1); }
                     ;

invocation           : long_invocation_stat
                     | short_invocation_stat
                     ;

long_invocation_stat : ".begin_call" newline
                       opt_long_arguments
                       long_invocation newline
                       opt_long_results
                       ".end_call" newline
                            { /* $4 contains an invocation object */
                              set_invocation_args(lexer, $4, $3);
                              $$ = set_invocation_results(lexer, $4, $6);
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

long_argument        : ".set_arg" short_arg newline
                            { $$ = $2; }
                     ;

long_invocation      : ".call" sub opt_ret_cont
                           { $$ = invoke(lexer, CALL_PCC, $2, $3); }
                     | ".nci_call" pmc_object
                           { $$ = invoke(lexer, CALL_NCI, $2); }
                     | ".invocant" pmc_object newline
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
                           {
                             if ($2)
                                 $$ = add_target(lexer, $1, $2);
                             else
                                 $$ = $1
                           }
                     ;

long_result          : ".get_result" result_target newline
                           { $$ = $2; }
                     | local_decl
                           { $$ = NULL; }
                     ;

short_invocation_stat: short_invocation newline
                     ;


short_invocation     : opt_target_list '=' simple_invocation
                           { $$ = set_invocation_results(lexer, $3, $1); }
                     | target '=' simple_invocation
                           { $$ = set_invocation_results(lexer, $3, $1); }
                     | simple_invocation
                           {  $$ = set_invocation_results(lexer, $1, NULL); }
                     ;

simple_invocation    : subcall
                     | methodcall
                     ;

methodcall           : pmc_object '.' method arguments
                           {
                             /* if $1 is not a register, check whether the symbol was declared */
                             if (!TEST_FLAG($1->flags, TARGET_FLAG_IS_REG)) {

                                 symbol *sym = find_symbol(lexer, $1->info->id.name);
                                 if (sym == NULL)
                                     yypirerror(yyscanner, lexer,
                                             "symbol '%s' was not declared", $1->info->id.name);
                                 else if ($1->info->type != PMC_TYPE)
                                     yypirerror(yyscanner, lexer,
                                             "cannot invoke method: '%s' is not of type 'pmc'",
                                             $1->info->id.name);
                             }

                             $$ = invoke(lexer, CALL_METHOD, $1, $3);
                             set_invocation_args(lexer, $$, $4);
                           }
                     ;

subcall              : sub arguments
                           {
                             $$ = invoke(lexer, CALL_PCC, $1, NULL);
                             set_invocation_args(lexer, $$, $2);
                           }
                     ;

sub                  : pmc_object
                           { $$ = $1; }
                     | TK_STRINGC
                           {
                             symbol *sym = find_symbol(lexer, $1);
                             if (sym == NULL)
                                 sym = new_symbol(lexer, $1, PMC_TYPE);

                             $$ = target_from_symbol(lexer, sym);
                           }
                     ;

method               : identifier
                           { /* check that this identifier was declared */
                             symbol *sym = find_symbol(lexer, $1);

                             if (sym == NULL) {
                                yypirerror(yyscanner, lexer,
                                        "method identifier '%s' not declared", $1);
                                /* make sure sym is not NULL */
                                sym = new_symbol(lexer, $1, PMC_TYPE);
                             }
                             else if (sym->info.type != PMC_TYPE
                                  &&  sym->info.type != STRING_TYPE)
                                 yypirerror(yyscanner, lexer,
                                         "method '%s' must be of type 'pmc' or 'string'", $1);

                             $$ = expr_from_target(lexer, target_from_symbol(lexer, sym));
                           }
                     | TK_PREG
                           { $$ = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, $1)); }
                     | TK_SREG
                           { $$ = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, $1)); }
                     | TK_STRINGC
                           { $$ = expr_from_const(lexer, new_const(lexer, STRING_VAL, $1)); }
                     ;

pmc_object           : identifier
                           {
                             symbol *sym = find_symbol(lexer, $1);
                             if (sym == NULL)
                                 sym = new_symbol(lexer, $1, PMC_TYPE);

                             $$ = target_from_symbol(lexer, sym);

                           }
                     | TK_PREG
                           { $$ = new_reg(lexer, PMC_TYPE, $1); }

                     ;

opt_target_list      : '(' opt_list ')'
                           {
                             $$ = $2;
                           }
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
                     | TK_STRINGC "=>" target
                           { $$ = set_param_alias(lexer, $1); }
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

short_return_stat    : ".return" arguments newline
                            {
                              $$ = invoke(lexer, CALL_RETURN);
                              set_invocation_args(lexer, $$, $2);
                            }
                     | ".tailcall" simple_invocation newline
                            { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type($2, ($2->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              $$ = $2;
                            }
                     ;

short_yield_stat     : ".yield" arguments newline
                            {
                              $$ = invoke(lexer, CALL_YIELD);
                              set_invocation_args(lexer, $$, $2);
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
                            { $$ = set_curarg(lexer, new_argument(lexer, $1));  }
                     ;

long_return_stat     : ".begin_return" newline
                       opt_return_expressions
                       ".end_return" newline
                            {
                              $$ = invoke(lexer, CALL_RETURN);
                              set_invocation_args(lexer, $$, $3);
                            }
                     ;

long_yield_stat      : ".begin_yield" newline
                       opt_yield_expressions
                       ".end_yield" newline
                            {
                              $$ = invoke(lexer, CALL_YIELD);
                              set_invocation_args(lexer, $$, $3);
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


yield_expression      : ".set_yield" short_arg newline
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

return_expression     : ".set_return" short_arg newline
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

const_decl_stat       : const_stat newline
                      ;

const_decl_chunk      : ".const" basic_const_tail
                            { store_global_constant(lexer, $2); }
                      ;

const_stat            : const_decl
                      | globalconst_decl
                      ;

const_decl            : ".const" const_tail
                            { $$ = $2; }
                      ;

const_tail            : basic_const_tail
                      | pmc_const_tail
                      ;

globalconst_decl      : ".globalconst" basic_const_tail
                            { store_global_constant(lexer, $2); }
                      ;

basic_const_tail      : "int" identifier '=' TK_INTC
                            { $$ = new_named_const(lexer, INT_VAL, $2, $4); }
                      | "num" identifier '=' TK_NUMC
                            { $$ = new_named_const(lexer, NUM_VAL, $2, $4); }
                      | "string" identifier '=' TK_STRINGC
                            { $$ = new_named_const(lexer, STRING_VAL, $2, $4); }
                      | "string" identifier '=' TK_USTRINGC
                            { $$ = new_named_const(lexer, USTRING_VAL, $2, $4); }
                      ;

pmc_const_tail        : TK_STRINGC identifier '=' pmc_const
                            { $$ = new_pmc_const(lexer, $1, $2, $4); }
                      ;

pmc_const             : constant
                      | identifier
                            { /* this alternative is necessary, otherwise the parser
                               * just stops when assigning an identifier to a pmc
                               * const, without an error message. That may be
                               * a bug in bison.
                               */
                              yypirerror(yyscanner, lexer, "unexpected identifier");
                            }
                      ;


/* Expressions, variables and operators */

expression  : target         { $$ = expr_from_target(lexer, $1); }
            | constant       { $$ = expr_from_const(lexer, $1); }
            ;


constant    : TK_INTC        { $$ = new_const(lexer, INT_VAL, $1); }
            | TK_NUMC        { $$ = new_const(lexer, NUM_VAL, $1); }
            | stringconst    { $$ = $1; }
            ;

stringconst : TK_STRINGC     { $$ = new_const(lexer, STRING_VAL, $1); }
            | TK_USTRINGC    { $$ = new_const(lexer, USTRING_VAL, $1); }
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

symbol      : reg
            | identifier { /* a symbol must have been declared; check that at this point. */
                           symbol * sym = find_symbol(lexer, $1);
                           if (sym == NULL) {
                               undeclared_symbol(lexer, $1);
                               /* make sure sym is not NULL */
                               sym = new_symbol(lexer, $1, UNKNOWN_TYPE);
                           }


                           $$ = target_from_symbol(lexer, sym);
                         }
            ;

reg         : TK_PREG    { $$ = new_reg(lexer, PMC_TYPE, $1);    }
            | TK_NREG    { $$ = new_reg(lexer, NUM_TYPE, $1);    }
            | TK_IREG    { $$ = new_reg(lexer, INT_TYPE, $1);    }
            | TK_SREG    { $$ = new_reg(lexer, STRING_TYPE, $1); }
            ;

/* an identifier can be any sequence of characters or one of the keywords */
identifier  : TK_IDENT
            | keyword
            ;

keyword     : "if"          { $$ = "if"; }
            | "unless"      { $$ = "unless"; }
            | "goto"        { $$ = "goto"; }
            | "int"         { $$ = "int"; }
            | "num"         { $$ = "num"; }
            | "string"      { $$ = "string"; }
            | "pmc"         { $$ = "pmc"; }
            | "null"        { $$ = "null"; }
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


/* PASM grammar
 *
 * The PASM grammar uses a number of rules in PIR, but in PASM mode, a different set
 * of tokens is recognized by the lexer. Therefore, a number of alternatives in the
 * PIR grammar rules can never be matched, as the particular tokens will never be
 * returned by the lexer. Neat, huh.
 */

pasm_contents             : pasm_init pasm_lines
                          ;

/* helper rule to install the first subroutine; any parsed instruction must go into
 * a subroutine, but PASM allows you start writing ops immediately, without declaring
 * a subroutine first. Give the subroutine a funny name containing characters normally
 * not allowed, so we don't have any name collisions.
 */
pasm_init                 : opt_nl
                                { new_subr(lexer, Parrot_str_new(lexer->interp, "@start", 6)); }
                          ;

pasm_lines                : pasm_line
                          | pasm_lines pasm_line
                          ;

pasm_line                 : pasm_statement
                          | namespace_decl newline
                          | lex_decl                /* lex_decl rule has already a "\n" token */
                          | location_directive newline
                          | macro_definition newline
                          | macro_expansion
                          ;

pasm_statement            : TK_LABEL opt_pasm_instruction
                                { set_label(lexer, $1); }
                          | pasm_sub_directive opt_pasm_instruction
                          | pasm_instruction
                          ;

opt_pasm_instruction      : empty_stat
                          | pasm_instruction
                          ;

pasm_sub_directive        : pasm_sub_head sub_flags TK_LABEL
                                { set_sub_name(lexer, $3); } /* now update the sub's name */
                          ;

pasm_sub_head             : ".pcc_sub"
                                { new_subr(lexer, NULL); } /* don't know the sub's name yet,
                                                              hence NULL */
                          ;

pasm_instruction          : parrot_op op_args newline
                                {

                                  if (is_parrot_op(lexer, $1)) {
                                      check_op_args_for_symbols(lexer);
                                      /* get_opinfo(lexer); */
                                  }
                                  else /* not a parrot op */
                                      yypirerror(yyscanner, lexer, "'%s' is not a parrot op", $1);

                                }
                          ;



%%





/*

=head1 FUNCTIONS

=over 4

=item C<static constant *
fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b)>

Evaluates the expression C<a op b> and returns a constant node
containing the result value. Both C<a> and C<b> are integer values.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static constant *
fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b) {
    int result = 0;

    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
                           "cannot divide by 0!");
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
            /* is this cast safe? -- w.r.t. limits of int range. */
            result = (int)pow(a, b);
            break;
        case OP_CONCAT:
            yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
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

        default:
            panic((lexer_state *)yypirget_extra(yyscanner),
                  "detected 'inc' or 'dec' in fold_i_i()");
            break;
    }
    return new_const((lexer_state * const)yypirget_extra(yyscanner), INT_VAL, result);
}

/*

=item C<static constant *
fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b)>

Same as C<fold_i_i>, except C<a> is of type double.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static constant *
fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b) {
    double result = 0;
    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
                           "cannot divide by 0!");
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
            yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
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
        default:
            panic((lexer_state *)yypirget_extra(yyscanner),
                  "detected 'inc' or 'dec' in fold_n_i()");
            break;
    }
    return new_const((lexer_state * const)yypirget_extra(yyscanner), NUM_VAL, result);
}

/*

=item C<static constant *
fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b)>

Same as C<fold_i_i>, except C<b> is of type double.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static constant *
fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b) {
    double result = 0;

    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
                           "cannot divide by 0!");
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
            yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
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

        default:
            panic((lexer_state *)yypirget_extra(yyscanner),
                  "detected 'inc' or 'dec' in fold_i_n()");
            break;
    }
    return new_const((lexer_state * const)yypirget_extra(yyscanner), NUM_VAL, result);
}

/*

=item C<static constant *
fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b)>

Same as C<fold_i_i>, except that both C<a> and C<b> are of type double.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static constant *
fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b) {
    double result = 0;
    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0) /* throw exception ? */
                yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
                           "cannot divide by 0");
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
            yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
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
                yypirerror(yyscanner, (lexer_state * const)yypirget_extra(yyscanner),
                           "cannot divide by 0");
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

        default:
            break;
    }
    return new_const((lexer_state * const)yypirget_extra(yyscanner), NUM_VAL, result);
}

/*

=item C<static constant *
fold_s_s(yyscan_t yyscanner, char *a, pir_math_operator op, char *b)>

Evaluate the expression C<a op b>, where both C<a> and C<b> are
strings. Only the concatenation and comparison operators are implemented;
other operators will result in an error.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static constant *
fold_s_s(yyscan_t yyscanner, NOTNULL(char const *a), pir_math_operator op, NOTNULL(char const *b)) {
    lexer_state *lexer = (lexer_state *)yypirget_extra(yyscanner);
    switch (op) {
        case OP_CONCAT:
            return new_const(lexer, STRING_VAL, concat_strings(lexer, a, b));

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
            yypirerror(yyscanner, lexer,
                    "cannot apply binary operator '%s' to arguments of type number", opnames[op]);
            return new_const(lexer, STRING_VAL, a);

        case OP_ISEQ:
        case OP_ISLE:
        case OP_ISLT:
        case OP_ISGE:
        case OP_ISGT:
        case OP_ISNE:
            return new_const(lexer, INT_VAL, (1 == evaluate_s_s(a, op, b)));


        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        default:
            panic(lexer, "detected 'inc' or 'dec' in fold_s_s()");
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
PARROT_WARN_UNUSED_RESULT
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
PARROT_WARN_UNUSED_RESULT
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
PARROT_WARN_UNUSED_RESULT
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
PARROT_WARN_UNUSED_RESULT
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
PARROT_WARN_UNUSED_RESULT
static int
evaluate_s_s(NOTNULL(char const * const a), pir_rel_operator op, NOTNULL(char const * const b)) {
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
evaluate_s(char const * const s)>

Evaluate a string in boolean context; if the string's length is 0, it's false.
If the string equals "0", ".0", "0." or "0.0", it's false.
Otherwise, it's true.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static int
evaluate_s(NOTNULL(char const * const s)) {
    int strlen_s = strlen(s);

    if (strlen_s > 0) {
        if (strlen_s <= 3) { /* if strlen > 3, (max. nr of characters to represent "0")
                                no need to do expensive string comparison; it must be true. */
            if (STREQ(s, "0") || STREQ(s, ".0") || STREQ(s, "0.") || STREQ(s, "0.0"))
                return 0;
            else
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
evaluate_c(lexer_state * const lexer, constant * const c)>

Evaluate a constant node in boolean context; if the constant is numeric,
it must be non-zero to be true; if it's a string, C<evaluate_s> is invoked
to evaluate the string.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static int
evaluate_c(NOTNULL(lexer_state * const lexer), NOTNULL(constant * const c)) {
    switch (c->type) {
        case INT_VAL:
            return (c->val.ival != 0);
        case NUM_VAL:
            return (c->val.nval != 0);
        case STRING_VAL:
            return evaluate_s(c->val.sval);
        case USTRING_VAL:
            return evaluate_s(c->val.ustr->contents);
        default:
            panic(lexer, "impossible constant type in evaluate_c()");
            return 0;
    }
}

/*

=item C<static char *
concat_strings(lexer_state * const lexer, char const *a, char const *b)>

Concatenates two strings into a new buffer. The new string is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char *
concat_strings(NOTNULL(lexer_state * const lexer), NOTNULL(char const * a),
               NOTNULL(char const * b))
{
    int strlen_a = strlen(a);
    char *newstr = (char *)pir_mem_allocate_zeroed(lexer, (strlen_a + strlen(b) + 1)
                                                          * sizeof (char));
    strcpy(newstr, a);
    strcpy(newstr + strlen_a, b);
    a = b = NULL;
    return newstr;
}


/*

=item C<static void
create_if_instr(lexer_state *lexer, int invert, int hasnull,
                char * const name, char * const label)>

Create an C<if> or C<unless> instruction; if C<invert> is non-zero (true), the
C<if> instruction is inverted, effectively becoming C<unless>.

If C<hasnull> is non-zero (true), the C<if> instruction becomes C<if_null>; again,
if C<invert> is non-zero, the instruction becomes C<unless_null>.

C<name> is the name of the variable that is checked during this instruction

=cut

*/
static void
create_if_instr(NOTNULL(lexer_state * const lexer), int invert, int hasnull,
                NOTNULL(char const * const name),
                NOTNULL(char const * const label))
{
    /* try to find the symbol; if it was declared it will be found; otherwise emit an error. */
    symbol *sym = find_symbol(lexer, name);
    if (sym == NULL) {
        yypirerror(lexer->yyscanner, lexer, "symbol '%s' not declared'", name);
        /* create a dummy symbol so we can continue without segfaulting. */
        sym = new_symbol(lexer, name, UNKNOWN_TYPE);
    }
    /* if there was a keyword "null", use the if/unless_null instruction variants. */
    if (hasnull)
        set_instrf(lexer, invert ? "unless_null" : "if_null", "%T%I",
                   target_from_symbol(lexer, sym), label);
    else
        set_instrf(lexer, invert ? "unless" : "if", "%T%I", target_from_symbol(lexer, sym), label);

    /* set a flag on this instruction that the second operand is a label. */
    /*set_op_labelflag(lexer, BIT(2));
    */
    set_op_labelflag(lexer, BIT(1));
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
PARROT_WARN_UNUSED_RESULT
static int
check_value(NOTNULL(constant * const c), int val) {
    switch(c->type) {
        case INT_VAL:
            return (c->val.ival == val);
        case NUM_VAL:
            return (c->val.nval == val);
        default:
            break;
    }
    return 0;
}


/*

=item C<static void
reduce_strength(yyscan_t yyscanner, int newop, int op2_index)>

Do the actual strength reduction; the current op will be replaced by C<newop>.
The operands at position 1 and C<op2_index> will be retrieved. C<op2_index> indicates
the position of the second operand that must be retrieved.

When the current instruction is:

 add_i_i_ic

then C<op2_index> will be 1, indicating the second operand must be retrieved.
When the current instruction is:

 add_i_ic_i

then C<op2_index> will be 2, so that the two operands represented by target nodes
are retrieved (the operands indicated as C<i>, as opposed by C<ic>.)

Then, if the two operands (which are target nodes) are equal, then one of them can
be removed, so that the direction of the first operand will change from OUT to INOUT.


=cut

*/
static void
reduce_strength(yyscan_t yyscanner, int newop, int op2_index) {
    lexer_state *lexer = (lexer_state *)yypirget_extra(yyscanner);
    instruction *instr = CURRENT_INSTRUCTION(lexer);
    /* based on the signatures, we know for sure that the first and second operands are targets. */

    /* get the operands */
    expression *op1, *op2;

    PARROT_ASSERT(op2_index == 1 || op2_index == 2); /* count from 0, so 2nd or 3rd operand. */

    get_operands(lexer, BIT(0) | BIT(op2_index), &op1, &op2);

    /* check whether targets are equal */
    if (targets_equal(op1->expr.t, op2->expr.t)) {
        update_op(lexer, instr, newop);
        /* in that case, remove the second one */
        if (op2_index == 2)
            op2->next = op1;
        else
            op1->next = op2->next;
    }


}


/*

=item C<static int
convert_3_to_2_args(int opcode, int *second_op_index)>

Given the 3-operand version of a Parrot math op (in the parameter C<opcode>), get the
strength-reduced version with 2 operands. This is a low-level,
"dirty-job-but-someone-has-to-do-it" function, so other higher level functions
don't get cluttered. If a 2-operand version is specified, then that version is returned.

The second parameter C<second_op_index> will be assigned the index of the second target
parameter, if any (note this is an I<out> parameter, as it is passed by address).
So, in case of C<PARROT_OP_add_i_ic_i>, this will be 2, as that's the second target
(start counting from 0). In case of C<PARROT_OP_add_i_i_ic>, it's 1.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static int
convert_3_to_2_args(int opcode, NOTNULL(int *second_op_index)) {
    *second_op_index = 1; /* count from 0 */
    switch (opcode) {
        case PARROT_OP_add_i_i:
        case PARROT_OP_add_i_i_i:
            return PARROT_OP_add_i_i;

        case PARROT_OP_add_i_ic:
        case PARROT_OP_add_i_i_ic:
            return PARROT_OP_add_i_ic;

        case PARROT_OP_add_n_n_n:
            return PARROT_OP_add_n_n;
        case PARROT_OP_add_n_n_nc:
            return PARROT_OP_add_n_nc;

        case PARROT_OP_add_i_ic_i:
            *second_op_index = 2;
            return PARROT_OP_add_i_ic;

        case PARROT_OP_add_n_nc_n:
            *second_op_index = 2;
            return PARROT_OP_add_n_nc;

        case PARROT_OP_div_i_i_i:
            return PARROT_OP_div_i_i;
        case PARROT_OP_div_i_i_ic:
            return PARROT_OP_div_i_ic;
        case PARROT_OP_div_n_n_n:
            return PARROT_OP_div_n_n;
        case PARROT_OP_div_n_n_nc:
            return PARROT_OP_div_n_nc;

        case PARROT_OP_div_i_ic_i:
            *second_op_index = 2;
            return PARROT_OP_div_i_ic;
        case PARROT_OP_div_n_nc_n:
            *second_op_index = 2;
            return PARROT_OP_div_n_nc;

        /* shouldn't these be constant-folded? XXX Why do these ops exist?
        case PARROT_OP_div_i_ic_ic:
            return PARROT_OP_div_i_ic_ic;
        case PARROT_OP_div_n_nc_nc:
        */


        case PARROT_OP_mul_i_i_i:
            return PARROT_OP_mul_i_i;
        case PARROT_OP_mul_i_i_ic:
            return PARROT_OP_mul_i_ic;
        case PARROT_OP_mul_n_n_n:
            return PARROT_OP_mul_n_n;
        case PARROT_OP_mul_n_n_nc:
            return PARROT_OP_mul_n_nc;

        case PARROT_OP_mul_i_ic_i:
            *second_op_index = 2;
            return PARROT_OP_mul_i_ic;
        case PARROT_OP_mul_n_nc_n:
            *second_op_index = 2;
            return PARROT_OP_mul_n_nc;

        case PARROT_OP_fdiv_i_i_i:
            return PARROT_OP_fdiv_i_i;
        case PARROT_OP_fdiv_i_i_ic:
            return PARROT_OP_fdiv_i_ic;
        case PARROT_OP_fdiv_n_n_n:
            return PARROT_OP_fdiv_n_n;
        case PARROT_OP_fdiv_n_n_nc:
            return PARROT_OP_fdiv_n_nc;

        case PARROT_OP_fdiv_n_nc_n:
            *second_op_index = 2;
            return PARROT_OP_fdiv_n_nc;
        case PARROT_OP_fdiv_i_ic_i:
            *second_op_index = 2;
            return PARROT_OP_fdiv_i_ic;

        case PARROT_OP_sub_i_i_i:
            return PARROT_OP_sub_i_i;

        case PARROT_OP_sub_i_i_ic:
        case PARROT_OP_sub_i_ic:
            return PARROT_OP_sub_i_ic;

        case PARROT_OP_sub_n_n_n:
            return PARROT_OP_sub_n_n;
        case PARROT_OP_sub_n_n_nc:
        case PARROT_OP_sub_n_nc:
            return PARROT_OP_sub_n_nc;

        case PARROT_OP_sub_i_ic_i:
            *second_op_index = 2;
            return PARROT_OP_sub_i_ic;
        case PARROT_OP_sub_n_nc_n:
            *second_op_index = 2;
            return PARROT_OP_sub_n_nc;
        default:
            break;
    }
    return -1;
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
    instruction *instr;
    expression  *arg1;
    expression  *arg2;
    int          newop;
    int          second_op_index;
    int          num_operands;

    /* don't do strength reduction if a "don't do" flag was set */
    if (TEST_FLAG(lexer->flags, LEXER_FLAG_NOSTRENGTHREDUCTION))
        return;

    instr = CURRENT_INSTRUCTION(lexer);

    newop = convert_3_to_2_args(instr->opcode, &second_op_index);

    /* if it's not a parrot math op, don't do strength reduction. */
    if (newop == -1)
        return;


    /* if there's more than 2 operands, do strength reduction. op_count also
     * counts the operand itself, so compare with 3, not 2.
     */
    if (instr->opinfo->op_count > 3)
        reduce_strength(lexer->yyscanner, newop, second_op_index);

    /* Now, try to simplify instruction even more. add_i_ic can become inc_i if
     * the second operand is 1, for instance. The instruction can be removed if
     * the second operand is 0.
     */
    get_operands(lexer, BIT(0) | BIT(1), &arg1, &arg2);

    switch (instr->opcode) {
        case PARROT_OP_add_i_ic:
            if (check_value(arg2->expr.c, 1)) {
                update_op(lexer, instr, PARROT_OP_inc_i);
                if (second_op_index == 2)
                    arg1->next = arg1;
                else
                    arg1->next = arg2->next;
            }
            else if (check_value(arg2->expr.c, 0)) {
                update_op(lexer, instr, PARROT_OP_noop); /* clear this one */
            }
            break;
        case PARROT_OP_add_n_nc:
            if (check_value(arg2->expr.c, 1)) {
                update_op(lexer, instr, PARROT_OP_inc_n);
                arg1->next = arg2->next;
            }
            else if (check_value(arg2->expr.c, 0))
                update_op(lexer, instr, PARROT_OP_noop); /* clear this one */
            break;
        case PARROT_OP_div_i_ic:
        case PARROT_OP_div_n_nc:
        case PARROT_OP_fdiv_i_ic:
        case PARROT_OP_fdiv_n_nc:
            if (check_value(arg2->expr.c, 1))  /* div $I0, 1 --> noop */
                update_op(lexer, instr, PARROT_OP_noop);
            else if (check_value(arg2->expr.c, 0))  /* div $I0, 0 --> error */
                yypirerror(lexer->yyscanner, lexer, "cannot divide by 0");
            break;
        case PARROT_OP_mul_i_ic:
            if (check_value(arg2->expr.c, 1))  /* mul $I0, 1 --> noop */
                update_op(lexer, instr, PARROT_OP_noop);
            else if (check_value(arg2->expr.c, 0)) { /* mul $I0, 0 --> null $I0 */
                update_op(lexer, instr, PARROT_OP_null_i);
                arg1->next = arg2->next;
            }
            break;
        case PARROT_OP_mul_n_nc:
            if (check_value(arg2->expr.c, 1)) { /* mul $I0, 1 --> noop */
                update_op(lexer, instr, PARROT_OP_noop);
            }
            else if (check_value(arg2->expr.c, 0)) { /* mul $I0, 0 --> null $I0 */
                update_op(lexer, instr, PARROT_OP_null_n);
            }
            break;

        case PARROT_OP_sub_i_ic:
            if (check_value(arg2->expr.c, 1)) { /* sub $I0, 1 --> dec $I0 */
                update_op(lexer, instr, PARROT_OP_dec_i);
                if (second_op_index == 2)
                    arg1->next = arg1;
                else
                    arg1->next = arg2->next;
            }
            else if (check_value(arg2->expr.c, 0)) { /* sub $I0, 0 --> noop */
                update_op(lexer, instr, PARROT_OP_noop);
            }
            break;
        case PARROT_OP_sub_n_nc:
            if (check_value(arg2->expr.c, 1)) { /* sub $N0, 1 --> dec $N0 */
                update_op(lexer, instr, PARROT_OP_dec_n);
                arg1->next = arg2->next;
            }
            else if (check_value(arg2->expr.c, 0))  /* sub $I0, 0 --> noop */
                update_op(lexer, instr, PARROT_OP_noop);
            break;
        default:
            break;
    }


}

/*

=item C<static void
check_first_arg_direction(lexer_state * const lexer, char * const opname)>

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
check_first_arg_direction(lexer_state * const lexer, NOTNULL(char const * const opname)) {
    int dir_first_arg;

    /* op_count also counts the instruction itself, so must be at least 2 */
    assert(CURRENT_INSTRUCTION(lexer)->opinfo->op_count >= 2);

    /* get the direction of the first argument */
    if (!CURRENT_INSTRUCTION(lexer)->opinfo->dirs)
        fprintf(stderr, "no opinfo->dirs!\n");
    else {
        op_info_t *opinfo = CURRENT_INSTRUCTION(lexer)->opinfo;

        if (opinfo)
            dir_first_arg = CURRENT_INSTRUCTION(lexer)->opinfo->dirs[0];
        else {
            fprintf(stderr, " no opinfo!\n");
            return;
        }
    }

    /* direction cannot be IN or INOUT */
    if (dir_first_arg != PARROT_ARGDIR_OUT)
        yypirerror(lexer->yyscanner, lexer, "cannot write first arg of op '%s' as a target "
                                            "(direction of argument is IN/INOUT).", opname);

}






/*

=item C<static void
check_op_args_for_symbols(lexer_state * const lexer)>

Check the arguments of the current instruction. First, the number of expected arguments
is checked against the specified number of arguments. Then, for each argument, if the
particular argument should not be a label (instructions can take LABEL operands), and
if the argument is a target node, then the argument must be a declared symbol. If it
is not, an error message is given.

If there are errors, FALSE is returned; if successful, TRUE is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static int
check_op_args_for_symbols(lexer_state * const lexer) {
    struct op_info_t  * opinfo;
    unsigned short      i;
    short               opcount;
    unsigned            num_operands;
    char               *fullopname;
    int                 opcode;
    int                 result;
    int                 label_bitmask = 0; /* an int is at least 32 bits;
                                            * an op cannot have more than 8 operands, as defined in
                                            * include/parrot/op.h:18, so an int is good enough for
                                            * a bit mask to cover all operands.
                                            */

    /* iterate over all operands to set the type and PASM register on all target nodes, if any */
    num_operands = get_operand_count(lexer);
    for (i = 0; i < num_operands; i++) {
        expression *operand = get_operand(lexer, i + 1); /* get_operand counts from 1 */

        if (operand->type == EXPR_IDENT) { /* op_arg ::= identifier */
            /* the operand is an identifier, check now whether it was a symbol. If so,
             * then a new target node is created which receives a pointer to the symbol.
             * Then, convert the operand to an EXPR_TARGET.
             */
            symbol *sym = find_symbol(lexer, operand->expr.id);

            if (sym) {

                /*
                operand->expr.t = new_target(lexer);
                operand->expr.t->info  = &sym->info;
                */
                operand->expr.t = target_from_symbol(lexer, sym);
                operand->type   = EXPR_TARGET; /* convert operand node into EXPR_TARGET */
            }
            else { /* it may be a constant, otherwise it's a label */

                /* it must be a label */
                SET_BIT(label_bitmask, BIT(i));
            }
        }
    }


    /* make sure the current instruction gets a pointer to the relevant opinfo entry */
    result = get_opinfo(lexer);

    /* if failure, return false */
    if (result == FALSE)
        return FALSE;
    else {
        int i = 0;
        expression *iter = CURRENT_INSTRUCTION(lexer)->operands;
        opinfo           = CURRENT_INSTRUCTION(lexer)->opinfo;

        PARROT_ASSERT(opinfo);

        opcount = opinfo->op_count - 1; /* according to op.h, opcount also counts the op itself. */

        PARROT_ASSERT(opcount >= 0);

        if (iter == NULL)
            return TRUE;

        /* iterate over all operands */
        do {
            iter = iter->next;

            /* fprintf(stderr, "operand %d is %s supposed to be a label\n", i,
               opinfo->labels[i]? "":"not");
             */

            if (opinfo->labels[i] == 0) {
                /* test the bitmask; if we expected this operand was a label, but now we found out
                 * through opinfo that it's not supposed to be a label at this position, so emit
                 * an error.
                 */
                if (TEST_BIT(label_bitmask, BIT(i))) {
                    undeclared_symbol(lexer, iter->expr.id);
                    return FALSE;
                }
            }
            else { /* operand i is a label. */
                /* set the i'th flag, indicating that the i'th operand is actually a
                 * label. Then later, when we're going to fixup the labels, we know
                 * which one to fix.
                 */

                /* fprintf(stderr, "setting %dth label flag on instruction %s\n", BIT(i),
                        CURRENT_INSTRUCTION(lexer)->opname); */

                SET_FLAG(CURRENT_INSTRUCTION(lexer)->oplabelbits, BIT(i));
            }

            ++i;
        }
        while (iter != CURRENT_INSTRUCTION(lexer)->operands);
    }
    return TRUE;
}

/*

=item C<static void
undeclared_symbol(lexer_state * const lexer, char * const symbol)>

Report an error message saying that C<symbol> was not declared. Then test
whether the symbol is perhaps a PASM register identifier. The user may have
mistakenly tried to use a PASM register in PIR mode.

=cut

*/
static void
undeclared_symbol(lexer_state * const lexer, char const * const symbol) {
    if (TEST_FLAG(lexer->flags, LEXER_FLAG_PASMFILE)) {
        yypirerror(lexer->yyscanner, lexer,
                   "cannot use symbols in PASM mode ('%s')", symbol);
        return;
    }

    yypirerror(lexer->yyscanner, lexer, "symbol '%s' not declared", symbol);

    /* maybe user tried to use PASM register? */
    if (symbol[0] == 'S' || symbol[0] == 'N' || symbol[0] == 'I' || symbol[0] == 'P') {
        /* if all subsequent characters are digits, then it was
         * the format of a PASM register.
         */
        if ((strlen(symbol) > 1) /* make sure string is longer than 1 char */
        &&  (strspn(symbol + 1, "0123456789") == strlen(symbol + 1)))
            fprintf(stderr,
                "PASM registers ('%s') are not allowed in PIR code\n", symbol);

    }
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

