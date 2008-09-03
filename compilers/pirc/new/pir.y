%{

/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*

=head1 NAME

pir.y

=head1 DESCRIPTION

This is a complete rewrite of the parser for the PIR language.

=cut

TODO:
1. [done 9/8/8]  fix argument stuff related to the :named flag.
2. [done 9/8/8]  fix parameter stuff
3. [done 17/8/8] clean up back-end a bit (refactoring, consting)
4. improve memory management (free it!)
5. test
6. [done 12/8/8] write vanilla register allocator
7. generate PBC, using Parrot_PackFile (and related) data structures. This needs
   linkage to libparrot, which seems to fail.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "pirparser.h"
#include "pircompiler.h"
#include "pircompunit.h"
#include "pirsymbol.h"

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

#include "pirlexer.h"

/* Enumeration of mathematical operator types. */
typedef enum pir_math_operators {
    OP_ADD,
    OP_INC, /* special case for OP_ADD; must be 1 position after OP_ADD */
    OP_SUB,
    OP_DEC, /* special case for OP_DEC; must be 1 position after OP_SUB */
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
    OP_NE = OP_ISNE + 1,   /* continue after OP_ISNE */
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
static char *concat_strings(char *a, char *b);

/* Parrot can check out whether the specified text is the name of an op.
 * We define a dummy function for now; replace this later.
 */
static int is_parrot_op(char const * const spelling);


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


/* the parser aborts if there are more than 10 errors */
#define MAX_NUM_ERRORS  10


%}

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

%type <targ> sub
             method
             pmc_object
             opt_ret_cont
             target
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

/*
%type <targ> local_id local_id_list
*/
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
             augm_add_op


%type <invo> long_invocation
             methodcall
             subcall
             simple_invocation
             long_yield_stat
             long_return_stat
             short_yield_stat
             short_return_stat

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
                            { set_hll($2); }
                  ;

hll_mapping       : ".HLL_map" TK_STRINGC '=' TK_STRINGC
                            { set_hll_map($2, $4); }
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

parameters        : /* empty */
                  | parameters parameter
                  ;

parameter         : ".param" param param_flags "\n"
                  ;

param             : type identifier
                         { add_param(lexer, $1, $2); }
                  ;

param_flags       : /* empty */
                         { $$ = 0; }
                  | param_flags param_flag
                         { SET_FLAG($$, $2); }
                  ;

param_flag        : target_flag
                  | invocant_param
                  ;

invocant_param    : ":invocant" '(' multi_type ')'
                         { $$ = TARGET_FLAG_INVOCANT; }
                  ;

/* Instructions */

instructions      : /* empty */
                  | instructions instruction
                  ;

/* helper rule to create a new instruction node before the instruction is parsed */
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
                         { set_instr(lexer, $1); }
                  ;

opt_op_args       : /* empty */
                        {
                          char const *instr = get_instr(lexer);
                          if (!is_parrot_op(instr))
                             yyerror(yyscanner, lexer, "parrot opcode expected");
                        }
                  | parrot_op_args
                        {
                          char const *instr = get_instr(lexer);
                          if (!is_parrot_op(instr))
                             yyerror(yyscanner, lexer, "parrot opcode expected");
                        }
                  | keylist_assignment
                  ;

parrot_op_args    : op_arg
                  | parrot_op_args ',' op_arg
                  ;

keylist_assignment: keylist '=' expression
                       {
                         /* the "instruction" that was set now appears to be
                          * an identifier; get the name, and check its type.
                          */
                         char const *instr = get_instr(lexer);
                         symbol *sym = find_symbol(lexer, instr);
                         target *obj;

                         if (sym == NULL) {
                            yyerror(yyscanner, lexer, "indexed object not declared");
                            sym = new_symbol(instr, PMC_TYPE);
                         }
                         if (sym->type != PMC_TYPE)
                            yyerror(yyscanner, lexer, "indexed object must be of type 'pmc'");

                         obj = target_from_symbol(sym);

                         set_instr(lexer, "set");
                         set_target_key(lexer->curtarget, $1);

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
                           set_target_key($1, $2);
                           $$ = $1;
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

/*

=head1 INSTRUCTION SELECTION

Instruction selection is implemented in the parser. This is done by writing
many specific alternatives, instead of using C<general> rules that
would match all input. This way, the parser's matching mechanism is
used to select specific cases, for instance adding 2 integer numbers.

Based on the values of the terminals, some instructions can be optimized
by selecting more efficient equivalent instructions.

The table below specifies how this is done. Terminals are numbered and
referenced using YACC syntax ($1 for the first terminal, $2 for the
second, etc.). This table only lists the special cases; normal cases,
such as C<$I0 = $I1 + 2>, where each of the operands is different are
not listed.


 rule              | instruction         | condition
 =============================================================
 T = 0             | null $1             |
                   |                     |
 T = T             | set $1, $3          | $1 != $3
                   | noop                | $1 == $3
                   |                     |
 T = T * 0         | null $1             | $1 == $3
 T = T / 1         | noop                | $1 == $3
 T = T / 0         | error: divide by 0  | $1 == $3
                   |                     |
 T = T + 1         | inc $1              | $1 == $3
 T = T + {I,N}     | add $1, $5          | $1 == $3
 T = T + 0         | noop                | $1 == $3
                   |                     |
                   |                     |

C<T> means C<target>, C<I> means C<integer constant>, C<N> means C<numeric constant>,
and C<S> means C<string literal>.

=cut

*/

assignment        : target '=' expression
                  | target '=' binary_expr
                  | target '=' keyaccess
                  | target augmented_op expression
                  | target augm_add_op expression
                  | target '=' unop expression
                  | keyword keylist_assignment
                  | TK_PREG keylist_assignment
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



/* Because instruction selection is implemented in the parser, some instructions are
 * handled in a special way: these are some math. operators and the C<set> opcode.
 * These tokens must therefore be handled as separate tokens, which also means they
 * must be handled as a possible alternative for identifiers (as opcode names are
 * allowed as identifiers).
 * Whenever a certain opcode is handled specially in the parser, it must be added
 * to the C<special_op> rule.
 */

conditional_stat  : conditional_instr "\n"
                  ;

conditional_instr : if_unless "null" TK_IDENT "goto" identifier
                  | if_unless "null" "int" "goto" identifier
                  | if_unless "null" "num" "goto" identifier
                  | if_unless "null" "pmc" "goto" identifier
                  | if_unless "null" "string" "goto" identifier
                  | if_unless "null" "if" "goto" identifier
                  | if_unless "null" "unless" "goto" identifier
                  | if_unless "null" "goto" "goto" identifier
                  | if_unless "null" "null" "goto" identifier
                  | if_unless constant then identifier
                  | if_unless TK_IDENT then identifier
                  | if_unless "int" then identifier
                  | if_unless "num" then identifier
                  | if_unless "pmc" then identifier
                  | if_unless "string" then identifier
                  | if_unless "if" then identifier
                  | if_unless "unless" then identifier
                  | if_unless "goto" "goto" identifier
                  | if_unless "null" "goto" identifier
                  | if_unless "goto" ',' identifier
                  | if_unless "null" ',' identifier
                  | if_unless condition "goto" identifier
                        {
                          if ($2 == -1) { /* -1 means the condition is evaluated during runtime */
                             if ($1) /* "unless"? if so, invert the instruction. */
                                 invert_instr(lexer);

                             push_operand(lexer, expr_from_ident($4));
                          }
                          else { /* evaluation during compile time */
                             /* if the result was false but the instr. was "unless", or,
                              * if the result was true and the instr. was "if",
                              * do an unconditional jump.
                              */
                             if ( (($2 == 0) && $1) || (($2 == 1) && !$1) )
                                set_instrf(lexer, "branch", "%I", $4);
                             else
                                set_instr(lexer, "nop");

                          }
                        }
                  ;

/* the condition rule returns -1 if the condition can't be evaluated yet, so
 * it must be done during runtime. Otherwise, if the condition evaluates to
 * "false", 0 is returned, and if true, 1 is returned.
 */
condition         : expression rel_op expression
                        {
                          set_instrf(lexer, opnames[$2], "%E%E", $1, $3);
                          $$ = -1;  /* -1 indicates this is evaluated at runtime */
                        }
                  ;

if_unless         : "if"       { $$ = 0; /* no need to invert */ }
                  | "unless"   { $$ = 1; /* yes, invert opname */ }
                  ;

then              : "goto" /* PIR mode */
                  | ','    /* PASM mode*/
                  ;

goto_stat         : "goto" identifier "\n"
                        { set_instrf(lexer, "branch", "%I", $2); }
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
                        { $$ = $1; }
                  ;

has_unique_reg    : /* empty */     { $$ = 0; }
                  | ":unique_reg"   { $$ = 1; }
                  ;

lex_decl          : ".lex" TK_STRINGC ',' pmc_object "\n"
                        { set_lex_flag($4, $2); }
                  ;

/* Sub/method invocation */


invocation_stat      : long_invocation_stat
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

long_argument        : ".arg" short_arg "\n"
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

methodcall           : pmc_object '.' method arguments
                           {
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
                                yyerror(yyscanner, lexer, "method identifier not declared");
                                /* make sure sym is not NULL; use a valid type to prevent
                                 * a type error below.
                                 */
                                sym = new_symbol($1, PMC_TYPE);
                             }
                             if (sym->type != PMC_TYPE && sym->type != STRING_TYPE)
                                 yyerror(yyscanner, lexer, "method identifier must be of type 'pmc' or 'string'");

                             $$ = target_from_symbol(sym);
                           }
                     | TK_PREG
                           { $$ = reg(lexer, PMC_TYPE, $1); }
                     | TK_SREG
                           { $$ = reg(lexer, STRING_TYPE, $1); }
                     | TK_STRINGC
                           { $$ = target_from_string($1); }
                     ;

pmc_object           : identifier
                           {
                             symbol *sym = find_symbol(lexer, $1);

                             if (sym == NULL) {
                                 yyerror(yyscanner, lexer, "object not declared");
                                 sym = new_symbol($1, PMC_TYPE);
                             }
                             if (sym->type != PMC_TYPE)
                                 yyerror(yyscanner, lexer, "object must be of type 'pmc'");

                             $$ = target_from_ident(PMC_TYPE, $1);
                           }
                     | TK_PREG
                           { $$ = reg(lexer, PMC_TYPE, $1); }

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
                           { $$ = set_param_flag($1, $2); }
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
                           {
                             $$ = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, $2);
                           }
                     ;

/* Returning and Yielding */


return_stat          : short_return_stat
                     | long_return_stat
                     ;

yield_stat           : short_yield_stat
                     | long_yield_stat
                     ;

short_return_stat    : ".return" arguments "\n"
                            {
                              $$ = invoke(lexer, CALL_RETURN);
                              set_invocation_args($$, $2);
                            }
                     | ".return" simple_invocation "\n"
                            { set_invocation_type($2, ($2->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
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

symbol      : TK_PREG    { $$ = reg(lexer, PMC_TYPE, $1);    }
            | TK_NREG    { $$ = reg(lexer, NUM_TYPE, $1);    }
            | TK_IREG    { $$ = reg(lexer, INT_TYPE, $1);    }
            | TK_SREG    { $$ = reg(lexer, STRING_TYPE, $1); }
            | identifier { /* a symbol must have been declared; check that at this point. */
                           symbol *sym = find_symbol(lexer, $1);
                           if (sym == NULL) {
                               yyerror(yyscanner, lexer, "symbol not declared");
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

augm_add_op : "+="         { $$ = OP_ADD; }
            | "-="         { $$ = OP_SUB; }
            ;

%%

#include <math.h>
#include <assert.h>

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
                    "cannot concatenate operands of type 'int' and 'int'\n");
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
            printf("This should never happen!");
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
                    "cannot apply binary operator to types 'num' and 'int'");
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
            printf("This should never happen!");
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
                    "cannot apply binary operator to types 'int' and 'num'");
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
            printf("This should never happen!");
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
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner),
                        "cannot divide by 0"); /* throw exception ? */
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
                    "cannot apply binary operator to arguments of type number");
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
                    "cannot apply binary operator to arguments of type number");
            return new_const(INT_TYPE, 0);

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
            printf("This should never happen!");
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

=cut

*/
static int
evaluate_s_s(char * const a, pir_rel_operator op, char * const b) {
    int result = strcmp(a, b);

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
evaluate_s(char *s)>

Evaluate a string in boolean context; if the string's length is 0, it's false.
If the string equals "0", ".0", "0." or "0.0", it's false.
Otherwise, it's true.

=cut

*/
static int
evaluate_s(char * const s) {
    int strlen_s = strlen(s);

    if (strlen_s > 0) {
        if ((strcmp(s, "0") == 0) || (strcmp(s, ".0") == 0)
            || (strcmp(s, "0.") == 0) || (strcmp(s, "0.0") == 0))
            return 0;
        else
            return 1;
    }
    return 0;
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

=item C<static int
is_parrot_op(char const * const spelling)>

=cut

*/
static int
is_parrot_op(char const * const spelling)
{
    /* only these are currently recognized as a Parrot instruction */
    char const * ops[] = {
        "print",
        "new",
        "newclass",
        "end",
        "set",
        "find_global",
        "set_hll_global",
        "get_hll_global",
        "setfile",
        "setline",
        "add",
        "sub",
        NULL
    };


    char const **iter = ops;

    while (*iter != NULL) {
        if (strcmp(spelling, *iter) == 0)
            return 1;
        iter++;
    }

    return 0;
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

