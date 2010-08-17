/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 1

/* Using locations.  */
#define YYLSP_NEEDED 0

/* Substitute the variable and function names.  */
#define yyparse yypirparse
#define yylex   yypirlex
#define yyerror yypirerror
#define yylval  yypirlval
#define yychar  yypirchar
#define yydebug yypirdebug
#define yynerrs yypirnerrs


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TK_HLL = 258,
     TK_LOADLIB = 259,
     TK_SUB = 260,
     TK_END = 261,
     TK_PARAM = 262,
     TK_LEX = 263,
     TK_LINE = 264,
     TK_FILE = 265,
     TK_LOCAL = 266,
     TK_NAMESPACE = 267,
     TK_INVOCANT = 268,
     TK_METH_CALL = 269,
     TK_GLOBALCONST = 270,
     TK_CONST = 271,
     TK_RETURN = 272,
     TK_YIELD = 273,
     TK_SET_YIELD = 274,
     TK_SET_RETURN = 275,
     TK_BEGIN_YIELD = 276,
     TK_END_YIELD = 277,
     TK_BEGIN_RETURN = 278,
     TK_END_RETURN = 279,
     TK_BEGIN_CALL = 280,
     TK_END_CALL = 281,
     TK_GET_RESULTS = 282,
     TK_CALL = 283,
     TK_SET_ARG = 284,
     TK_GET_RESULT = 285,
     TK_NCI_CALL = 286,
     TK_TAILCALL = 287,
     TK_ANNOTATE = 288,
     TK_NL = 289,
     TK_LABEL = 290,
     TK_IDENT = 291,
     TK_INT = 292,
     TK_NUM = 293,
     TK_PMC = 294,
     TK_STRING = 295,
     TK_IF = 296,
     TK_UNLESS = 297,
     TK_NULL = 298,
     TK_GOTO = 299,
     TK_STRINGC = 300,
     TK_USTRINGC = 301,
     TK_INTC = 302,
     TK_NUMC = 303,
     TK_PREG = 304,
     TK_NREG = 305,
     TK_SREG = 306,
     TK_IREG = 307,
     TK_ARROW = 308,
     TK_NE = 309,
     TK_EQ = 310,
     TK_LT = 311,
     TK_LE = 312,
     TK_GT = 313,
     TK_GE = 314,
     TK_USHIFT = 315,
     TK_RSHIFT = 316,
     TK_LSHIFT = 317,
     TK_FDIV = 318,
     TK_OR = 319,
     TK_AND = 320,
     TK_XOR = 321,
     TK_CONC = 322,
     TK_ASSIGN_USHIFT = 323,
     TK_ASSIGN_RSHIFT = 324,
     TK_ASSIGN_LSHIFT = 325,
     TK_ASSIGN_INC = 326,
     TK_ASSIGN_DEC = 327,
     TK_ASSIGN_MUL = 328,
     TK_ASSIGN_MOD = 329,
     TK_ASSIGN_POW = 330,
     TK_ASSIGN_DIV = 331,
     TK_ASSIGN_BOR = 332,
     TK_ASSIGN_BAND = 333,
     TK_ASSIGN_FDIV = 334,
     TK_ASSIGN_BNOT = 335,
     TK_ASSIGN_CONC = 336,
     TK_FLAG_INIT = 337,
     TK_FLAG_LOAD = 338,
     TK_FLAG_MAIN = 339,
     TK_FLAG_ANON = 340,
     TK_FLAG_METHOD = 341,
     TK_FLAG_OUTER = 342,
     TK_FLAG_VTABLE = 343,
     TK_FLAG_LEX = 344,
     TK_FLAG_MULTI = 345,
     TK_FLAG_POSTCOMP = 346,
     TK_FLAG_IMMEDIATE = 347,
     TK_FLAG_SUBID = 348,
     TK_FLAG_INSTANCEOF = 349,
     TK_FLAG_NSENTRY = 350,
     TK_FLAG_UNIQUE_REG = 351,
     TK_FLAG_NAMED = 352,
     TK_FLAG_SLURPY = 353,
     TK_FLAG_FLAT = 354,
     TK_FLAG_OPTIONAL = 355,
     TK_FLAG_OPT_FLAG = 356,
     TK_FLAG_INVOCANT = 357,
     TK_FLAG_LOOKAHEAD = 358,
     TK_MACRO = 359,
     TK_ENDM = 360,
     TK_MACRO_LOCAL = 361,
     TK_MACRO_LABEL = 362,
     TK_MACRO_CONST = 363,
     TK_MACRO_LABEL_ID = 364,
     TK_MACRO_LOCAL_ID = 365,
     TK_MACRO_IDENT = 366,
     TK_MACRO_ARG_IDENT = 367,
     TK_MACRO_ARG_OTHER = 368,
     TK_MACRO_CONST_VAL = 369,
     TK_PASM_MARKER_START = 370,
     TK_PIR_MARKER_START = 371,
     TK_PCC_SUB = 372,
     TK_PARROT_OP = 373
   };
#endif
/* Tokens.  */
#define TK_HLL 258
#define TK_LOADLIB 259
#define TK_SUB 260
#define TK_END 261
#define TK_PARAM 262
#define TK_LEX 263
#define TK_LINE 264
#define TK_FILE 265
#define TK_LOCAL 266
#define TK_NAMESPACE 267
#define TK_INVOCANT 268
#define TK_METH_CALL 269
#define TK_GLOBALCONST 270
#define TK_CONST 271
#define TK_RETURN 272
#define TK_YIELD 273
#define TK_SET_YIELD 274
#define TK_SET_RETURN 275
#define TK_BEGIN_YIELD 276
#define TK_END_YIELD 277
#define TK_BEGIN_RETURN 278
#define TK_END_RETURN 279
#define TK_BEGIN_CALL 280
#define TK_END_CALL 281
#define TK_GET_RESULTS 282
#define TK_CALL 283
#define TK_SET_ARG 284
#define TK_GET_RESULT 285
#define TK_NCI_CALL 286
#define TK_TAILCALL 287
#define TK_ANNOTATE 288
#define TK_NL 289
#define TK_LABEL 290
#define TK_IDENT 291
#define TK_INT 292
#define TK_NUM 293
#define TK_PMC 294
#define TK_STRING 295
#define TK_IF 296
#define TK_UNLESS 297
#define TK_NULL 298
#define TK_GOTO 299
#define TK_STRINGC 300
#define TK_USTRINGC 301
#define TK_INTC 302
#define TK_NUMC 303
#define TK_PREG 304
#define TK_NREG 305
#define TK_SREG 306
#define TK_IREG 307
#define TK_ARROW 308
#define TK_NE 309
#define TK_EQ 310
#define TK_LT 311
#define TK_LE 312
#define TK_GT 313
#define TK_GE 314
#define TK_USHIFT 315
#define TK_RSHIFT 316
#define TK_LSHIFT 317
#define TK_FDIV 318
#define TK_OR 319
#define TK_AND 320
#define TK_XOR 321
#define TK_CONC 322
#define TK_ASSIGN_USHIFT 323
#define TK_ASSIGN_RSHIFT 324
#define TK_ASSIGN_LSHIFT 325
#define TK_ASSIGN_INC 326
#define TK_ASSIGN_DEC 327
#define TK_ASSIGN_MUL 328
#define TK_ASSIGN_MOD 329
#define TK_ASSIGN_POW 330
#define TK_ASSIGN_DIV 331
#define TK_ASSIGN_BOR 332
#define TK_ASSIGN_BAND 333
#define TK_ASSIGN_FDIV 334
#define TK_ASSIGN_BNOT 335
#define TK_ASSIGN_CONC 336
#define TK_FLAG_INIT 337
#define TK_FLAG_LOAD 338
#define TK_FLAG_MAIN 339
#define TK_FLAG_ANON 340
#define TK_FLAG_METHOD 341
#define TK_FLAG_OUTER 342
#define TK_FLAG_VTABLE 343
#define TK_FLAG_LEX 344
#define TK_FLAG_MULTI 345
#define TK_FLAG_POSTCOMP 346
#define TK_FLAG_IMMEDIATE 347
#define TK_FLAG_SUBID 348
#define TK_FLAG_INSTANCEOF 349
#define TK_FLAG_NSENTRY 350
#define TK_FLAG_UNIQUE_REG 351
#define TK_FLAG_NAMED 352
#define TK_FLAG_SLURPY 353
#define TK_FLAG_FLAT 354
#define TK_FLAG_OPTIONAL 355
#define TK_FLAG_OPT_FLAG 356
#define TK_FLAG_INVOCANT 357
#define TK_FLAG_LOOKAHEAD 358
#define TK_MACRO 359
#define TK_ENDM 360
#define TK_MACRO_LOCAL 361
#define TK_MACRO_LABEL 362
#define TK_MACRO_CONST 363
#define TK_MACRO_LABEL_ID 364
#define TK_MACRO_LOCAL_ID 365
#define TK_MACRO_IDENT 366
#define TK_MACRO_ARG_IDENT 367
#define TK_MACRO_ARG_OTHER 368
#define TK_MACRO_CONST_VAL 369
#define TK_PASM_MARKER_START 370
#define TK_PIR_MARKER_START 371
#define TK_PCC_SUB 372
#define TK_PARROT_OP 373




/* Copy the first part of user declarations.  */
#line 1 "pir.y"


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

static void check_first_arg_direction(
    ARGMOD(lexer_state *lexer),
    ARGIN(char const *opname))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*lexer);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static char * concat_strings(
    ARGMOD(lexer_state *lexer),
    ARGIN(const char * a),
    ARGIN(const char * b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*lexer);

static void create_if_instr(
    ARGMOD(lexer_state *lexer),
    int invert,
    int hasnull,
    ARGIN(const char *name),
    ARGIN(const char *label))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*lexer);

static void do_strength_reduction(ARGMOD(lexer_state *lexer))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*lexer);

PARROT_WARN_UNUSED_RESULT
static int evaluate_i_i(int a, pir_rel_operator op, int b);

PARROT_WARN_UNUSED_RESULT
static int evaluate_i_n(int a, pir_rel_operator op, double b);

PARROT_WARN_UNUSED_RESULT
static int evaluate_n_i(double a, pir_rel_operator op, int b);

static void undeclared_symbol(
    ARGMOD(lexer_state *lexer),
    ARGIN(char const *symbol))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*lexer);

static void yy_reduce_print (
    YYSTYPE *yyvsp,
    int yyrule,
    yyscan_t yyscanner,
    struct lexer_state * const lexer);

static void yy_stack_print (yytype_int16 *bottom, yytype_int16 *top);
static void yy_symbol_print (
    FILE *yyoutput,
    int yytype,
    YYSTYPE const * const yyvaluep,
    yyscan_t yyscanner,
    struct lexer_state * const lexer);

static void yy_symbol_value_print (
    FILE *yyoutput,
    int yytype,
    YYSTYPE const * const yyvaluep,
    yyscan_t yyscanner,
    struct lexer_state * const lexer);

static void yydestruct (
    const char *yymsg,
    int yytype,
    YYSTYPE *yyvaluep,
    yyscan_t yyscanner,
    struct lexer_state * const lexer);

static int YYID (int i);
static char * yystpcpy (char *yydest, const char *yysrc);
static YYSIZE_T yystrlen (const char *yystr);
static YYSIZE_T yysyntax_error (char *yyresult, int yystate, int yychar);
static YYSIZE_T yytnamerr (char *yyres, const char *yystr);
#define ASSERT_ARGS_check_first_arg_direction __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(opname))
#define ASSERT_ARGS_concat_strings __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(a) \
    , PARROT_ASSERT_ARG(b))
#define ASSERT_ARGS_create_if_instr __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(label))
#define ASSERT_ARGS_do_strength_reduction __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_evaluate_i_i __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_evaluate_i_n __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_evaluate_n_i __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_undeclared_symbol __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(symbol))
#define ASSERT_ARGS_yy_reduce_print  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_yy_stack_print  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_yy_symbol_print  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_yy_symbol_value_print  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_yydestruct  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_YYID  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_yystpcpy  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_yystrlen  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_yysyntax_error  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_yytnamerr  __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
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



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 236 "pir.y"
{
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
/* Line 193 of yacc.c.  */
#line 592 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 605 "pirparser.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  11
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1178

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  139
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  172
/* YYNRULES -- Number of rules.  */
#define YYNRULES  431
/* YYNRULES -- Number of states.  */
#define YYNSTATES  669

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   374

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   130,     2,     2,     2,   135,   137,     2,
     119,   120,   134,   132,   121,   129,   128,   133,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   124,
       2,   127,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   122,     2,   123,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   125,   136,   126,   131,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   138
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    13,    14,    16,    18,    20,
      24,    26,    28,    30,    32,    34,    36,    38,    40,    42,
      44,    48,    56,    59,    60,    62,    64,    68,    70,    71,
      73,    75,    78,    81,    83,    85,    88,    92,    95,    98,
     101,   104,   109,   110,   112,   114,   118,   120,   127,   129,
     132,   134,   136,   137,   140,   142,   144,   146,   148,   150,
     152,   154,   157,   162,   165,   168,   171,   174,   177,   181,
     182,   184,   186,   190,   192,   194,   196,   198,   199,   202,
     207,   210,   211,   214,   216,   218,   220,   222,   225,   230,
     232,   233,   236,   239,   241,   243,   245,   247,   249,   251,
     253,   255,   257,   259,   261,   263,   265,   267,   269,   271,
     273,   279,   281,   285,   286,   290,   291,   293,   295,   299,
     301,   303,   306,   308,   312,   313,   316,   318,   320,   322,
     325,   327,   330,   333,   337,   341,   344,   347,   349,   351,
     353,   355,   356,   358,   360,   364,   368,   370,   372,   374,
     376,   378,   380,   383,   387,   389,   393,   400,   405,   412,
     415,   417,   419,   423,   427,   431,   435,   439,   443,   448,
     453,   458,   462,   466,   470,   474,   478,   482,   486,   491,
     497,   502,   507,   511,   515,   519,   523,   527,   531,   535,
     539,   542,   548,   554,   560,   566,   572,   578,   584,   590,
     596,   601,   607,   612,   617,   622,   627,   632,   637,   642,
     647,   652,   657,   662,   667,   672,   676,   680,   684,   688,
     692,   696,   700,   704,   708,   712,   716,   720,   722,   724,
     726,   728,   730,   732,   736,   741,   743,   747,   750,   751,
     753,   759,   761,   763,   765,   774,   775,   777,   779,   782,
     786,   790,   793,   799,   800,   803,   804,   806,   808,   811,
     815,   817,   820,   824,   828,   830,   832,   834,   839,   842,
     844,   846,   848,   850,   852,   854,   856,   858,   862,   863,
     865,   867,   871,   874,   878,   879,   882,   884,   886,   888,
     891,   893,   895,   897,   899,   901,   905,   909,   913,   917,
     918,   920,   922,   926,   928,   930,   934,   937,   939,   945,
     951,   952,   954,   956,   959,   963,   964,   966,   968,   971,
     975,   976,   979,   981,   984,   985,   987,   991,   994,   997,
     999,  1001,  1004,  1006,  1008,  1011,  1016,  1021,  1026,  1031,
    1036,  1038,  1040,  1042,  1044,  1046,  1048,  1050,  1052,  1054,
    1056,  1058,  1060,  1062,  1064,  1066,  1068,  1070,  1072,  1074,
    1076,  1078,  1080,  1082,  1084,  1086,  1088,  1090,  1092,  1094,
    1096,  1098,  1100,  1102,  1104,  1106,  1108,  1110,  1112,  1114,
    1116,  1118,  1120,  1122,  1124,  1126,  1128,  1130,  1132,  1134,
    1136,  1138,  1140,  1142,  1144,  1146,  1148,  1150,  1152,  1154,
    1156,  1158,  1160,  1162,  1164,  1166,  1168,  1170,  1172,  1174,
    1176,  1178,  1180,  1182,  1184,  1187,  1189,  1191,  1194,  1196,
    1199,  1201,  1204,  1207,  1209,  1212,  1215,  1217,  1219,  1221,
    1225,  1227
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     140,     0,    -1,   116,   141,    -1,   115,   302,    -1,   142,
     144,   142,    -1,    -1,   143,    -1,    34,    -1,   145,    -1,
     144,   143,   145,    -1,   166,    -1,   281,    -1,   162,    -1,
     161,    -1,   159,    -1,   160,    -1,   146,    -1,   200,    -1,
     147,    -1,   148,    -1,   108,    36,   114,    -1,   149,   119,
     150,   120,    34,   153,   105,    -1,   104,   297,    -1,    -1,
     151,    -1,   152,    -1,   151,   121,   152,    -1,   297,    -1,
      -1,   154,    -1,   155,    -1,   154,   155,    -1,   156,   143,
      -1,   157,    -1,   158,    -1,   107,   109,    -1,   106,   293,
     110,    -1,     4,    45,    -1,     9,    47,    -1,    10,    45,
      -1,     3,    45,    -1,    12,   122,   163,   123,    -1,    -1,
     164,    -1,   165,    -1,   164,   124,   165,    -1,    45,    -1,
     168,   170,   143,   176,   185,   167,    -1,     6,    -1,     5,
     169,    -1,   297,    -1,    45,    -1,    -1,   170,   171,    -1,
      85,    -1,    82,    -1,    83,    -1,    84,    -1,    89,    -1,
      91,    -1,    92,    -1,    90,   172,    -1,    87,   119,   169,
     120,    -1,    86,   278,    -1,    88,   278,    -1,    93,   279,
      -1,    94,   279,    -1,    95,   279,    -1,   119,   173,   120,
      -1,    -1,   174,    -1,   175,    -1,   174,   121,   175,    -1,
     297,    -1,    45,    -1,   213,    -1,   177,    -1,    -1,   177,
     178,    -1,     7,   179,   180,   143,    -1,   293,   297,    -1,
      -1,   180,   181,    -1,   256,    -1,   183,    -1,   182,    -1,
     184,    -1,   103,   279,    -1,   102,   119,   175,   120,    -1,
      96,    -1,    -1,   185,   186,    -1,    35,   187,    -1,   187,
      -1,   203,    -1,   220,    -1,   226,    -1,   227,    -1,   231,
      -1,   280,    -1,   257,    -1,   232,    -1,   216,    -1,   202,
      -1,   201,    -1,   198,    -1,   199,    -1,   189,    -1,   188,
      -1,   200,    -1,    33,    45,   121,   290,   143,    -1,   190,
      -1,   111,   191,   143,    -1,    -1,   119,   192,   120,    -1,
      -1,   193,    -1,   194,    -1,   193,   121,   194,    -1,   112,
      -1,   113,    -1,   111,   191,    -1,   195,    -1,   125,   196,
     126,    -1,    -1,   196,   197,    -1,    34,    -1,   113,    -1,
     112,    -1,   111,   191,    -1,   143,    -1,   160,   143,    -1,
       1,   143,    -1,    43,   294,   143,    -1,    27,   251,   143,
      -1,   204,   143,    -1,   205,   206,    -1,   215,    -1,    36,
      -1,   207,    -1,   209,    -1,    -1,   208,    -1,   210,    -1,
     208,   121,   210,    -1,   213,   127,   289,    -1,   211,    -1,
     213,    -1,   290,    -1,   297,    -1,   296,    -1,   212,    -1,
     250,   213,    -1,   122,   214,   123,    -1,   289,    -1,   214,
     124,   289,    -1,   294,   127,   205,   211,   121,   208,    -1,
     294,   127,   205,   211,    -1,   294,   127,   205,   213,   121,
     208,    -1,   218,   143,    -1,    36,    -1,   298,    -1,   294,
     127,    47,    -1,   294,   127,    48,    -1,   294,   127,   291,
      -1,   294,   127,   296,    -1,   294,   127,   217,    -1,   294,
     127,   219,    -1,   294,   127,   205,   213,    -1,   294,   127,
     298,   213,    -1,   294,   127,    49,   213,    -1,   294,   301,
     289,    -1,   294,    71,    47,    -1,   294,    71,    48,    -1,
     294,    72,    47,    -1,   294,    72,    48,    -1,   294,    71,
     294,    -1,   294,    72,   294,    -1,   294,   127,   299,   289,
      -1,   294,   127,   294,   300,   289,    -1,   298,   213,   127,
     289,    -1,    49,   213,   127,   289,    -1,    47,   300,   294,
      -1,    48,   300,   294,    -1,    45,   300,   294,    -1,    45,
     300,    45,    -1,    47,   300,    47,    -1,    48,   300,    48,
      -1,    47,   300,    48,    -1,    48,   300,    47,    -1,   221,
     143,    -1,   224,    43,    36,    44,   297,    -1,   224,    43,
      37,    44,   297,    -1,   224,    43,    38,    44,   297,    -1,
     224,    43,    39,    44,   297,    -1,   224,    43,    40,    44,
     297,    -1,   224,    43,    41,    44,   297,    -1,   224,    43,
      42,    44,   297,    -1,   224,    43,    44,    44,   297,    -1,
     224,    43,    43,    44,   297,    -1,   224,   290,   225,   297,
      -1,   224,    43,    49,   225,   297,    -1,   224,    36,   225,
     297,    -1,   224,   296,   225,   297,    -1,   224,    37,   225,
     297,    -1,   224,    38,   225,   297,    -1,   224,    39,   225,
     297,    -1,   224,    40,   225,   297,    -1,   224,    41,   225,
     297,    -1,   224,    42,   225,   297,    -1,   224,    44,    44,
     297,    -1,   224,    44,   121,   297,    -1,   224,    43,    44,
     297,    -1,   224,    43,   121,   297,    -1,   224,   222,    44,
     297,    -1,   294,   292,   289,    -1,    47,   292,   294,    -1,
      48,   292,   294,    -1,    45,   292,   294,    -1,    47,   292,
      47,    -1,    47,   292,    48,    -1,    48,   292,    47,    -1,
      48,   292,    48,    -1,    45,   292,    45,    -1,    45,   292,
     223,    -1,    47,   292,    45,    -1,    48,   292,    45,    -1,
      47,    -1,    48,    -1,    41,    -1,    42,    -1,    44,    -1,
     121,    -1,    44,   297,   143,    -1,    11,   293,   228,   143,
      -1,   229,    -1,   228,   121,   229,    -1,   297,   230,    -1,
      -1,    96,    -1,     8,    45,   121,   250,   143,    -1,   233,
      -1,   234,    -1,   243,    -1,    25,   143,   235,   238,   143,
     240,    26,   143,    -1,    -1,   236,    -1,   237,    -1,   236,
     237,    -1,    29,   266,   143,    -1,    28,   248,   239,    -1,
      31,   250,    -1,    13,   250,   143,    14,   249,    -1,    -1,
     121,   250,    -1,    -1,   241,    -1,   242,    -1,   241,   242,
      -1,    30,   254,   143,    -1,   227,    -1,   244,   143,    -1,
     251,   127,   245,    -1,   294,   127,   245,    -1,   245,    -1,
     247,    -1,   246,    -1,   250,   128,   249,   261,    -1,   248,
     261,    -1,   250,    -1,    45,    -1,   297,    -1,    49,    -1,
      51,    -1,    45,    -1,   297,    -1,    49,    -1,   119,   252,
     120,    -1,    -1,   253,    -1,   254,    -1,   253,   121,   254,
      -1,   294,   255,    -1,    45,    53,   294,    -1,    -1,   255,
     256,    -1,   100,    -1,   101,    -1,    98,    -1,    97,   278,
      -1,   258,    -1,   259,    -1,   268,    -1,   260,    -1,   269,
      -1,    17,   261,   143,    -1,    32,   245,   143,    -1,    18,
     261,   143,    -1,   119,   262,   120,    -1,    -1,   263,    -1,
     264,    -1,   263,   121,   264,    -1,   266,    -1,   265,    -1,
      45,    53,   267,    -1,   267,   276,    -1,   289,    -1,    23,
     143,   273,    24,   143,    -1,    21,   143,   270,    22,   143,
      -1,    -1,   271,    -1,   272,    -1,   271,   272,    -1,    19,
     266,   143,    -1,    -1,   274,    -1,   275,    -1,   274,   275,
      -1,    20,   266,   143,    -1,    -1,   276,   277,    -1,    99,
      -1,    97,   278,    -1,    -1,   279,    -1,   119,    45,   120,
      -1,   282,   143,    -1,    16,   286,    -1,   283,    -1,   285,
      -1,    16,   284,    -1,   286,    -1,   287,    -1,    15,   286,
      -1,    37,   297,   127,    47,    -1,    38,   297,   127,    48,
      -1,    40,   297,   127,    45,    -1,    40,   297,   127,    46,
      -1,    45,   297,   127,   288,    -1,   290,    -1,   297,    -1,
     294,    -1,   290,    -1,    47,    -1,    48,    -1,   291,    -1,
      45,    -1,    46,    -1,    54,    -1,    55,    -1,    56,    -1,
      57,    -1,    59,    -1,    58,    -1,    37,    -1,    38,    -1,
      39,    -1,    40,    -1,   295,    -1,   296,    -1,   297,    -1,
      49,    -1,    50,    -1,    52,    -1,    51,    -1,    36,    -1,
     298,    -1,    41,    -1,    42,    -1,    44,    -1,    37,    -1,
      38,    -1,    40,    -1,    39,    -1,    43,    -1,   129,    -1,
     130,    -1,   131,    -1,   132,    -1,   129,    -1,   133,    -1,
     134,    -1,   135,    -1,   136,    -1,   137,    -1,   131,    -1,
     138,    -1,    67,    -1,    60,    -1,    61,    -1,    62,    -1,
      64,    -1,    65,    -1,    63,    -1,    66,    -1,    55,    -1,
      57,    -1,    56,    -1,    59,    -1,    58,    -1,    54,    -1,
      73,    -1,    74,    -1,    75,    -1,    76,    -1,    79,    -1,
      77,    -1,    78,    -1,    80,    -1,    81,    -1,    69,    -1,
      70,    -1,    68,    -1,   303,   304,    -1,   142,    -1,   305,
      -1,   304,   305,    -1,   306,    -1,   162,   143,    -1,   231,
      -1,   160,   143,    -1,   146,   143,    -1,   190,    -1,    35,
     307,    -1,   308,   307,    -1,   310,    -1,   198,    -1,   310,
      -1,   309,   170,    35,    -1,   117,    -1,   205,   207,   143,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   563,   563,   564,   569,   575,   576,   579,   583,   584,
     587,   588,   589,   590,   591,   592,   593,   594,   601,   602,
     605,   609,   615,   622,   623,   626,   627,   630,   634,   635,
     638,   639,   642,   645,   646,   649,   653,   664,   668,   670,
     676,   680,   685,   686,   690,   692,   696,   700,   706,   710,
     714,   715,   718,   719,   722,   724,   726,   728,   730,   732,
     734,   736,   738,   740,   742,   744,   746,   748,   752,   757,
     761,   765,   774,   785,   787,   789,   793,   798,   799,   812,
     816,   821,   822,   826,   827,   828,   829,   832,   839,   846,
     852,   853,   863,   865,   868,   869,   870,   871,   872,   873,
     874,   875,   876,   877,   878,   879,   880,   881,   882,   883,
     886,   893,   896,   901,   902,   907,   908,   911,   913,   921,
     929,   930,   932,   935,   941,   942,   951,   953,   954,   955,
     963,   967,   971,   980,   987,   993,   996,   997,  1000,  1009,
    1016,  1019,  1020,  1023,  1024,  1027,  1063,  1065,  1069,  1071,
    1076,  1078,  1082,  1105,  1109,  1111,  1120,  1131,  1143,  1153,
    1156,  1157,  1160,  1169,  1178,  1183,  1188,  1209,  1214,  1255,
    1273,  1280,  1285,  1296,  1307,  1318,  1329,  1334,  1339,  1344,
    1354,  1373,  1407,  1409,  1411,  1413,  1415,  1417,  1419,  1421,
    1426,  1435,  1437,  1439,  1441,  1443,  1445,  1447,  1449,  1451,
    1453,  1465,  1472,  1474,  1480,  1482,  1484,  1486,  1488,  1490,
    1492,  1494,  1496,  1498,  1500,  1531,  1557,  1565,  1574,  1583,
    1585,  1587,  1589,  1591,  1595,  1600,  1602,  1607,  1608,  1611,
    1612,  1615,  1616,  1619,  1627,  1631,  1633,  1637,  1641,  1642,
    1645,  1660,  1664,  1665,  1668,  1680,  1681,  1685,  1687,  1691,
    1695,  1697,  1699,  1705,  1706,  1711,  1712,  1716,  1718,  1727,
    1729,  1733,  1737,  1739,  1741,  1745,  1746,  1749,  1769,  1776,
    1778,  1788,  1805,  1807,  1809,  1813,  1822,  1827,  1834,  1835,
    1839,  1841,  1845,  1847,  1852,  1853,  1857,  1859,  1861,  1863,
    1873,  1877,  1878,  1879,  1880,  1883,  1888,  1899,  1906,  1911,
    1912,  1916,  1918,  1922,  1923,  1926,  1930,  1934,  1938,  1947,
    1957,  1958,  1963,  1965,  1970,  1975,  1976,  1980,  1982,  1986,
    1992,  1993,  1997,  1999,  2007,  2008,  2012,  2016,  2019,  2023,
    2024,  2027,  2031,  2032,  2035,  2039,  2041,  2043,  2045,  2049,
    2053,  2054,  2067,  2068,  2072,  2073,  2074,  2077,  2078,  2081,
    2082,  2083,  2084,  2085,  2086,  2089,  2090,  2091,  2092,  2100,
    2103,  2104,  2117,  2118,  2119,  2120,  2124,  2125,  2128,  2129,
    2130,  2131,  2132,  2133,  2134,  2135,  2138,  2139,  2140,  2143,
    2144,  2145,  2146,  2147,  2148,  2149,  2150,  2151,  2152,  2153,
    2154,  2155,  2156,  2157,  2158,  2159,  2160,  2161,  2162,  2163,
    2164,  2165,  2171,  2172,  2173,  2174,  2175,  2176,  2177,  2178,
    2179,  2180,  2181,  2182,  2194,  2202,  2206,  2207,  2210,  2211,
    2212,  2213,  2214,  2215,  2218,  2220,  2221,  2224,  2225,  2228,
    2232,  2237
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\".HLL\"", "\".loadlib\"", "\".sub\"",
  "\".end\"", "\".param\"", "\".lex\"", "\".line\"", "\".file\"",
  "\".local\"", "\".namespace\"", "\".invocant\"", "\".meth_call\"",
  "\".globalconst\"", "\".const\"", "\".return\"", "\".yield\"",
  "\".set_yield\"", "\".set_return\"", "\".begin_yield\"",
  "\".end_yield\"", "\".begin_return\"", "\".end_return\"",
  "\".begin_call\"", "\".end_call\"", "\".get_results\"", "\".call\"",
  "\".set_arg\"", "\".get_result\"", "\".nci_call\"", "\".tailcall\"",
  "\".annotate\"", "\"\\n\"", "\"label\"", "\"identifier\"", "\"int\"",
  "\"num\"", "\"pmc\"", "\"string\"", "\"if\"", "\"unless\"", "\"null\"",
  "\"goto\"", "\"string constant\"", "\"unicode string\"",
  "\"integer constant\"", "\"number constant\"", "\"PMC register\"",
  "\"number register\"", "\"string register\"", "\"integer register\"",
  "\"=>\"", "\"!=\"", "\"==\"", "\"<\"", "\"<=\"", "\">\"", "\">=\"",
  "\">>>\"", "\">>\"", "\"<<\"", "\"//\"", "\"||\"", "\"&&\"", "\"~~\"",
  "\".\"", "\">>>=\"", "\">>=\"", "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"",
  "\"%=\"", "\"**=\"", "\"/=\"", "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"",
  "\".=\"", "\":init\"", "\":load\"", "\":main\"", "\":anon\"",
  "\":method\"", "\":outer\"", "\":vtable\"", "\":lex\"", "\":multi\"",
  "\":postcomp\"", "\":immediate\"", "\":subid\"", "\":instanceof\"",
  "\":nsentry\"", "\":unique_reg\"", "\":named\"", "\":slurpy\"",
  "\":flat\"", "\":optional\"", "\":opt_flag\"", "\":invocant\"",
  "\":lookahead\"", "\".macro\"", "\".endm\"", "\".macro_local\"",
  "\".macro_label\"", "\".macro_const\"", "\"macro-label\"",
  "\"macro-local\"", "\"macro-identifier\"", "\"macro-id-argument\"",
  "\"macro-argument\"", "\"macro-constant\"", "\"<pasm-input>\"",
  "\"<pir-input>\"", "\".pcc_sub\"", "\"parrot-op\"", "'('", "')'", "','",
  "'['", "']'", "';'", "'{'", "'}'", "'='", "'.'", "'-'", "'!'", "'~'",
  "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"", "$accept", "TOP",
  "pir_contents", "opt_nl", "newline", "pir_chunks", "pir_chunk",
  "macro_definition", "macro_const", "macro", "macro_header",
  "macro_parameters", "macro_params", "macro_param", "macro_body",
  "macro_statements", "macro_statement", "macro_instr", "macro_label_decl",
  "macro_local_decl", "loadlib", "location_directive", "hll_specifier",
  "namespace_decl", "opt_namespace", "namespace", "namespace_slice",
  "sub_def", "sub_end", "sub_head", "sub_id", "sub_flags", "sub_flag",
  "multi_type_list", "opt_multi_types", "multi_types", "multi_type",
  "parameter_list", "parameters", "parameter", "param", "param_flags",
  "param_flag", "lookahead_flag", "invocant_flag", "unique_reg_flag",
  "instructions", "instruction", "statement", "annotation",
  "expansion_stat", "macro_expansion", "opt_macro_args", "macro_args",
  "macro_arg_list", "macro_arg", "braced_arg", "braced_contents",
  "braced_item", "empty_stat", "location_stat", "error_stat", "null_stat",
  "getresults_stat", "parrot_stat", "parrot_instruction", "parrot_op",
  "opt_op_args", "op_args", "parrot_op_args", "keylist_assignment",
  "op_arg", "op_arg_expr", "keyaccess", "keylist", "keys",
  "parrot_op_assign", "assignment_stat", "rhs_ident", "assignment",
  "binary_expr", "conditional_stat", "conditional_instr", "condition",
  "int_or_num", "if_unless", "then", "goto_stat", "local_decl",
  "local_id_list", "local_id", "has_unique_reg", "lex_decl",
  "invocation_stat", "invocation", "long_invocation_stat",
  "opt_long_arguments", "long_arguments", "long_argument",
  "long_invocation", "opt_ret_cont", "opt_long_results", "long_results",
  "long_result", "short_invocation_stat", "short_invocation",
  "simple_invocation", "methodcall", "subcall", "sub", "method",
  "pmc_object", "opt_target_list", "opt_list", "target_list",
  "result_target", "target_flags", "target_flag", "return_stat",
  "return_instr", "short_return_stat", "short_yield_stat", "arguments",
  "opt_arguments_list", "arguments_list", "argument", "named_arg",
  "short_arg", "arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl_stat", "const_decl_chunk", "const_stat", "const_decl",
  "const_tail", "globalconst_decl", "basic_const_tail", "pmc_const_tail",
  "pmc_const", "expression", "constant", "stringconst", "rel_op", "type",
  "target", "symbol", "reg", "identifier", "keyword", "unop", "binop",
  "augmented_op", "pasm_contents", "pasm_init", "pasm_lines", "pasm_line",
  "pasm_statement", "opt_pasm_instruction", "pasm_sub_directive",
  "pasm_sub_head", "pasm_instruction", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,    40,
      41,    44,    91,    93,    59,   123,   125,    61,    46,    45,
      33,   126,    43,    47,    42,    37,   124,    38,   374
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   139,   140,   140,   141,   142,   142,   143,   144,   144,
     145,   145,   145,   145,   145,   145,   145,   145,   146,   146,
     147,   148,   149,   150,   150,   151,   151,   152,   153,   153,
     154,   154,   155,   156,   156,   157,   158,   159,   160,   160,
     161,   162,   163,   163,   164,   164,   165,   166,   167,   168,
     169,   169,   170,   170,   171,   171,   171,   171,   171,   171,
     171,   171,   171,   171,   171,   171,   171,   171,   172,   173,
     173,   174,   174,   175,   175,   175,   176,   177,   177,   178,
     179,   180,   180,   181,   181,   181,   181,   182,   183,   184,
     185,   185,   186,   186,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     188,   189,   190,   191,   191,   192,   192,   193,   193,   194,
     194,   194,   194,   195,   196,   196,   197,   197,   197,   197,
     198,   199,   200,   201,   202,   203,   204,   204,   205,   206,
     206,   207,   207,   208,   208,   209,   210,   210,   211,   211,
     211,   211,   212,   213,   214,   214,   215,   215,   215,   216,
     217,   217,   218,   218,   218,   218,   218,   218,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,   218,
     218,   218,   219,   219,   219,   219,   219,   219,   219,   219,
     220,   221,   221,   221,   221,   221,   221,   221,   221,   221,
     221,   221,   221,   221,   221,   221,   221,   221,   221,   221,
     221,   221,   221,   221,   221,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   222,   223,   223,   224,
     224,   225,   225,   226,   227,   228,   228,   229,   230,   230,
     231,   232,   233,   233,   234,   235,   235,   236,   236,   237,
     238,   238,   238,   239,   239,   240,   240,   241,   241,   242,
     242,   243,   244,   244,   244,   245,   245,   246,   247,   248,
     248,   249,   249,   249,   249,   250,   250,   251,   252,   252,
     253,   253,   254,   254,   255,   255,   256,   256,   256,   256,
     257,   258,   258,   258,   258,   259,   259,   260,   261,   262,
     262,   263,   263,   264,   264,   265,   266,   267,   268,   269,
     270,   270,   271,   271,   272,   273,   273,   274,   274,   275,
     276,   276,   277,   277,   278,   278,   279,   280,   281,   282,
     282,   283,   284,   284,   285,   286,   286,   286,   286,   287,
     288,   288,   289,   289,   290,   290,   290,   291,   291,   292,
     292,   292,   292,   292,   292,   293,   293,   293,   293,   294,
     295,   295,   296,   296,   296,   296,   297,   297,   298,   298,
     298,   298,   298,   298,   298,   298,   299,   299,   299,   300,
     300,   300,   300,   300,   300,   300,   300,   300,   300,   300,
     300,   300,   300,   300,   300,   300,   300,   300,   300,   300,
     300,   300,   301,   301,   301,   301,   301,   301,   301,   301,
     301,   301,   301,   301,   302,   303,   304,   304,   305,   305,
     305,   305,   305,   305,   306,   306,   306,   307,   307,   308,
     309,   310
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     3,     0,     1,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     7,     2,     0,     1,     1,     3,     1,     0,     1,
       1,     2,     2,     1,     1,     2,     3,     2,     2,     2,
       2,     4,     0,     1,     1,     3,     1,     6,     1,     2,
       1,     1,     0,     2,     1,     1,     1,     1,     1,     1,
       1,     2,     4,     2,     2,     2,     2,     2,     3,     0,
       1,     1,     3,     1,     1,     1,     1,     0,     2,     4,
       2,     0,     2,     1,     1,     1,     1,     2,     4,     1,
       0,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       5,     1,     3,     0,     3,     0,     1,     1,     3,     1,
       1,     2,     1,     3,     0,     2,     1,     1,     1,     2,
       1,     2,     2,     3,     3,     2,     2,     1,     1,     1,
       1,     0,     1,     1,     3,     3,     1,     1,     1,     1,
       1,     1,     2,     3,     1,     3,     6,     4,     6,     2,
       1,     1,     3,     3,     3,     3,     3,     3,     4,     4,
       4,     3,     3,     3,     3,     3,     3,     3,     4,     5,
       4,     4,     3,     3,     3,     3,     3,     3,     3,     3,
       2,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       4,     5,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     1,     1,     1,
       1,     1,     1,     3,     4,     1,     3,     2,     0,     1,
       5,     1,     1,     1,     8,     0,     1,     1,     2,     3,
       3,     2,     5,     0,     2,     0,     1,     1,     2,     3,
       1,     2,     3,     3,     1,     1,     1,     4,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     0,     1,
       1,     3,     2,     3,     0,     2,     1,     1,     1,     2,
       1,     1,     1,     1,     1,     3,     3,     3,     3,     0,
       1,     1,     3,     1,     1,     3,     2,     1,     5,     5,
       0,     1,     1,     2,     3,     0,     1,     1,     2,     3,
       0,     2,     1,     2,     0,     1,     3,     2,     2,     1,
       1,     2,     1,     1,     2,     4,     4,     4,     4,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     2,     1,     1,     2,     1,     2,
       1,     2,     2,     1,     2,     2,     1,     1,     1,     3,
       1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     5,     5,     0,     7,   415,     6,     3,     0,     2,
       0,     1,     0,     0,     0,     0,     0,   138,     0,     0,
     113,   430,     0,    18,    19,     0,     0,     0,   423,   141,
     420,   414,   416,   418,     0,    52,   426,     0,     0,     0,
       0,     0,     5,     8,    16,    14,    15,    13,    12,    10,
      52,    17,    11,     0,    38,    39,    42,   130,   427,   424,
     428,   366,   371,   372,   374,   373,   368,   369,   375,   370,
      22,   367,     0,   115,     0,   422,    23,   421,   419,   347,
     348,   344,   345,   362,   363,   365,   364,     0,     0,   142,
     143,   146,   151,   147,     0,   148,   346,   150,   149,   417,
     425,     0,   132,    40,    37,    51,    49,    50,     0,     0,
       0,   328,     4,     0,     0,     0,    46,     0,    43,    44,
      20,   113,   119,   120,   124,     0,   116,   117,   122,   112,
       0,    24,    25,    27,   362,     0,   154,   343,   342,   359,
     360,   361,   431,     0,   152,   429,    55,    56,    57,    54,
     324,     0,   324,    58,     0,    59,    60,     0,     0,     0,
      53,     0,     0,     0,     9,    77,   276,     0,   275,    41,
       0,   121,     0,   114,     0,     0,     0,   153,     0,   144,
       0,    63,   325,     0,    64,    69,    61,    65,    66,    67,
       0,     0,     0,    90,    76,   240,    45,   126,   113,   128,
     127,   123,   125,   118,    28,    26,   155,     0,     0,    74,
       0,    70,    71,    75,    73,   335,   336,   337,   338,     0,
       0,    78,   129,     0,     0,     0,    29,    30,     0,    33,
      34,   326,    62,    68,     0,    48,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   138,   368,
     369,   375,   370,   270,   362,   278,     0,    47,    91,    93,
     108,   107,   111,   105,   106,   109,   104,   103,    94,     0,
     141,   137,   102,     0,    95,     0,     0,    96,    97,    98,
     101,   241,   242,   243,     0,   264,   266,   265,     0,   269,
       0,   100,   290,   291,   293,   292,   294,    99,     0,   329,
     330,     0,   361,   367,   355,   356,   357,   358,    81,     0,
       0,    35,    21,    31,    32,    72,     0,   334,     0,   331,
     332,   333,   299,     0,     0,   310,   315,   245,     0,     0,
       0,    92,     0,     0,     0,     0,     0,   279,   280,   284,
     131,   135,   136,   139,   140,   147,   159,   190,   366,   371,
     372,   374,   373,   368,   369,   375,   370,   347,   344,   345,
       0,     0,     0,   360,   261,   268,     0,     0,   327,   413,
     411,   412,     0,     0,   402,   403,   404,   405,   407,   408,
     406,   409,   410,     0,     0,     0,     0,    80,    36,     0,
     235,   238,     0,   347,     0,   300,   301,   304,   303,   320,
     307,   295,   297,     0,     0,   311,   312,     0,     0,   316,
     317,     0,     0,   246,   247,   134,   296,     0,   133,   233,
       0,     0,   277,     0,   282,     0,   231,   232,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   349,   350,
     351,   352,   354,   353,     0,     0,     0,     0,     0,     0,
       0,   274,   272,   273,     0,   271,   262,   172,   173,   176,
     174,   175,   177,   366,   270,   162,   163,   362,   376,   377,
     378,     0,   166,   167,   263,   164,     0,   360,   367,     0,
     171,     0,    89,   324,   288,   286,   287,     0,     0,    79,
      82,    85,    84,    86,    83,     0,   234,   239,   237,     0,
       0,   298,     0,   306,     0,     0,   313,     0,     0,   318,
       0,     0,     0,     0,     0,   248,     0,   181,   283,   281,
     285,   145,   202,   204,   205,   206,   207,   208,   209,     0,
       0,     0,     0,     0,     0,     0,     0,   370,   212,     0,
     213,   210,   211,   223,   227,   228,   224,   218,   225,   219,
     220,   216,   226,   221,   222,   217,   214,   200,   215,   203,
     267,   401,   396,   398,   397,   400,   399,   389,   390,   391,
     394,   392,   393,   395,   388,   380,   386,   379,   381,   382,
     383,   384,   385,   387,     0,     0,     0,   170,   157,   168,
       0,   169,   178,   180,   289,     0,    87,   236,   339,   340,
     341,   305,   302,   324,   322,   321,   314,   309,   319,   308,
     249,     0,   253,   269,   251,   255,   110,   191,   192,   193,
     194,   195,   196,   197,   199,   198,   201,   185,   184,   186,
     188,   182,   189,   187,   183,     0,     0,   179,     0,   323,
       0,     0,   250,     0,   260,     0,   256,   257,   156,   158,
      88,     0,   254,     0,     0,   258,   252,   259,   244
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     9,     5,    57,    42,    43,    22,    23,    24,
      25,   130,   131,   132,   225,   226,   227,   228,   229,   230,
      45,    26,    47,    27,   117,   118,   119,    49,   257,    50,
     106,   101,   160,   186,   210,   211,   212,   193,   194,   221,
     308,   386,   500,   501,   502,   503,   219,   258,   259,   260,
     261,    28,    74,   125,   126,   127,   128,   172,   202,    58,
     264,    51,   266,   267,   268,   269,    29,   342,    88,    89,
     344,    90,    91,    92,    93,   135,   271,   272,   482,   273,
     483,   274,   275,   360,   556,   276,   428,   277,   278,   389,
     390,   508,    30,   280,   281,   282,   412,   413,   414,   524,
     652,   655,   656,   657,   283,   284,   285,   286,   287,   288,
     464,    94,   290,   336,   337,   338,   424,   504,   291,   292,
     293,   294,   323,   394,   395,   396,   397,   398,   399,   295,
     296,   404,   405,   406,   408,   409,   410,   513,   615,   181,
     182,   297,    52,   298,   299,   319,   300,   111,   321,   608,
     400,   137,    96,   454,   309,   138,   139,   140,   141,    71,
     489,   594,   384,     7,     8,    31,    32,    33,    59,    34,
      35,    36
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -588
static const yytype_int16 yypact[] =
{
      70,    25,    25,    55,  -588,  -588,  -588,  -588,    44,  -588,
      73,  -588,    22,    41,    27,     7,    57,  -588,   923,    95,
      18,  -588,    25,  -588,  -588,    20,    25,    25,  -588,   699,
    -588,    44,  -588,  -588,    57,  -588,  -588,    25,   106,   109,
     816,   127,    25,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,    37,  -588,  -588,   115,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,    62,    32,    25,  -588,   923,  -588,  -588,  -588,
    -588,  -588,  -588,    47,  -588,  -588,  -588,   889,    25,    50,
    -588,  -588,  -588,  -588,    58,  -588,  -588,  -588,    72,  -588,
    -588,   815,  -588,  -588,  -588,  -588,  -588,  -588,   923,   923,
     923,  -588,  -588,    30,   740,   325,  -588,    82,    96,  -588,
    -588,    18,  -588,  -588,  -588,    76,   114,  -588,  -588,  -588,
     110,   125,  -588,  -588,  -588,    68,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,   699,  -588,  -588,  -588,  -588,  -588,  -588,
     129,   133,   129,  -588,   135,  -588,  -588,   129,   129,   129,
    -588,   140,   143,   144,  -588,  -588,  -588,    25,  -588,  -588,
     115,  -588,    15,  -588,    32,   222,   923,  -588,   889,  -588,
     228,  -588,  -588,   816,  -588,   171,  -588,  -588,  -588,  -588,
     237,   239,   173,  -588,   279,  -588,  -588,  -588,    18,  -588,
    -588,  -588,  -588,  -588,   117,  -588,  -588,   168,   169,  -588,
     170,   174,  -588,  -588,  -588,  -588,  -588,  -588,  -588,   534,
     238,  -588,  -588,   238,   182,   187,   117,  -588,    25,  -588,
    -588,  -588,  -588,  -588,   171,  -588,   238,   127,   150,   175,
     175,    25,    25,    25,   179,   462,   254,   649,   768,   906,
     935,   399,   923,  -588,    40,  1071,    25,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,    25,
     699,  -588,  -588,    25,  -588,    25,   952,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,    25,  -588,  -588,  -588,   175,   172,
     188,  -588,  -588,  -588,  -588,  -588,  -588,  -588,    25,  -588,
    -588,   843,     4,    58,  -588,  -588,  -588,  -588,  -588,   923,
     191,  -588,  -588,  -588,  -588,  -588,   923,  -588,   923,  -588,
    -588,  -588,   969,    25,    25,   283,   296,   288,    25,    25,
     197,  -588,    25,    25,   193,   268,   205,   203,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,   199,  -588,  -588,   -21,   -21,
     -21,   -21,   -21,   -21,   -21,   270,    -7,   204,   204,   204,
     285,   -21,   204,   -21,  -588,  -588,  1105,   462,  -588,  -588,
    -588,  -588,  1003,  1020,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,   682,   889,   206,   101,  -588,  -588,    -6,
    -588,   240,   207,   277,   215,   216,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,   889,   316,   283,  -588,   889,   315,   296,
    -588,   889,   105,   288,  -588,  -588,  -588,   234,  -588,  -588,
     889,   399,  -588,  1071,   128,   889,  -588,  -588,   923,   923,
     923,   923,   923,   923,   923,   297,   298,   299,   302,   303,
     304,   305,   307,  1134,   -21,   923,   923,   923,  -588,  -588,
    -588,  -588,  -588,  -588,   436,   841,   986,   923,   923,   889,
     923,  -588,  -588,  -588,   175,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,   557,   650,   735,   735,    40,  -588,  -588,
    -588,   699,  -588,  -588,  -588,  -588,   735,   318,   -10,   889,
    -588,   889,  -588,   129,  -588,  -588,  -588,   236,   129,  -588,
    -588,  -588,  -588,  -588,  -588,   923,  -588,  -588,  -588,  1121,
     889,  -588,   969,     2,    25,    25,  -588,    25,    25,  -588,
      25,   325,   462,   325,    25,  -588,    25,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,   923,
     923,   923,   923,   923,   923,   923,   923,   923,  -588,   923,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  1088,  1037,  1054,  -588,   235,   250,
     889,  -588,  -588,  -588,  -588,   171,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,   129,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,    25,   251,  -588,  -588,    21,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,   699,   699,  -588,   253,  -588,
     343,   325,  -588,  1071,  -588,   332,    21,  -588,    50,    50,
    -588,  1105,  -588,    25,    25,  -588,  -588,  -588,  -588
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -588,  -588,  -588,    42,    -1,  -588,   246,     9,  -588,  -588,
    -588,  -588,  -588,   200,  -588,  -588,   151,  -588,  -588,  -588,
    -588,    -2,  -588,    12,  -588,  -588,   208,  -588,  -588,  -588,
     198,   330,  -588,  -588,  -588,  -588,  -230,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -588,  -588,   136,  -588,
    -588,  -157,   -74,  -588,  -588,   210,  -588,  -588,  -588,  -155,
    -588,  -153,  -588,  -588,  -588,  -588,  -204,  -588,   112,  -408,
    -588,   243,   -94,  -588,   -81,  -588,  -588,  -588,  -588,  -588,
    -588,  -588,  -588,  -588,  -588,  -588,  -244,  -588,  -587,  -588,
    -116,  -588,  -144,  -588,  -588,  -588,  -588,  -588,   -20,  -588,
    -588,  -588,  -588,  -264,  -588,  -588,  -227,  -588,  -588,  -128,
    -266,   -98,   153,  -588,  -588,  -409,  -588,   -26,  -588,  -588,
    -588,  -588,  -228,  -588,  -588,  -113,  -588,  -261,  -109,  -588,
    -588,  -588,  -588,    -3,  -588,  -588,     1,  -588,  -588,  -149,
    -148,  -588,  -588,  -588,  -588,  -588,  -588,    13,  -588,  -588,
     -80,   -27,    29,  -184,  -178,  -190,  -588,   -23,   -13,  -199,
    -588,  -405,  -588,  -588,  -588,  -588,   372,  -588,   374,  -588,
    -588,    34
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -367
static const yytype_int16 yytable[] =
{
       6,     6,    95,   184,   315,    70,    97,   136,    46,   187,
     188,   189,   324,   144,   529,   270,    98,   167,   329,    44,
     303,    75,    48,   426,  -161,    77,    78,   107,     4,   301,
      -6,    37,   236,    38,    39,    40,   102,   446,   654,    13,
      14,   113,    15,   270,    10,   310,    41,   171,   303,   197,
      60,   653,    12,    13,    14,    11,    15,   301,   316,     4,
     365,   332,   262,   133,   263,   339,   265,    53,    60,   654,
     595,   596,    55,   129,    37,   279,    38,    39,    40,    16,
      17,   600,    13,    14,   112,    15,   362,   142,    54,    41,
     262,     4,   263,    17,   265,   161,   162,   163,   206,   613,
     427,   614,   168,   279,   213,   429,   430,   431,   432,   433,
     434,    46,    87,   165,   447,   505,    95,   458,   521,   460,
      97,   289,    44,  -275,   222,    48,   198,   199,   200,    56,
      98,    72,  -275,   522,    18,     4,   523,    73,    19,    76,
     466,   201,   514,   121,   122,   123,   517,   289,    18,   289,
     520,   103,    19,   213,   104,    20,   484,   124,   115,  -276,
     116,    21,    87,   133,   108,   109,   195,   110,  -276,  -276,
     107,   143,   214,   334,   455,   456,   120,    18,   459,   481,
      87,    19,   469,   472,   488,     1,     2,   108,   109,   345,
     110,   177,   178,   486,  -275,   318,   173,   492,   493,   494,
     549,   495,   496,   497,   498,   169,   302,    61,    62,    63,
      64,    65,    66,    67,    68,    69,   209,   256,   217,   218,
     170,   214,   385,   223,   224,   493,   494,   314,   495,   496,
     175,   528,   168,   339,   302,   174,   570,   658,   659,   333,
     325,   326,   327,    95,   663,   256,   176,    97,   180,   361,
     317,   320,   183,   363,   185,   340,   204,    98,   448,   449,
     450,   451,   452,   453,   557,   561,   565,   190,   341,   289,
     191,   192,   346,   207,   347,   304,   305,   306,   307,    79,
      80,    81,    82,   364,   215,   289,   220,   216,   231,   232,
     233,   311,   312,    87,   322,   234,   387,   368,   255,   330,
     366,   388,   403,   391,   490,   392,   435,   436,   437,   438,
     439,   440,   441,   442,   443,   367,   407,   411,   417,   444,
     420,   421,   401,   402,   423,   422,   425,   415,   416,   457,
     510,   418,   419,   491,   509,   511,   507,   512,   515,   518,
     527,   539,   540,   541,   604,   531,   542,   543,   544,   545,
     606,   546,  -165,   465,   168,   605,   645,   661,   664,   164,
     487,    61,    62,    63,    64,    65,    66,    67,    68,    69,
     302,   646,   651,   660,   166,   648,   205,   313,   196,   568,
     114,   208,   343,   331,   203,   499,   179,   598,   506,   607,
     526,   445,   665,   525,   622,   666,   597,   328,   530,   612,
     599,   611,   516,    99,   638,   641,   644,   601,   100,   602,
     519,   603,   485,     0,     0,   532,   533,   534,   535,   536,
     537,   538,     0,   621,   623,   624,     0,     0,     0,     0,
     548,     0,   550,   551,   552,    61,    62,    63,    64,    65,
      66,    67,    68,    69,   566,   567,     0,   569,   134,    84,
      85,    86,     0,     0,    95,     0,     0,     0,    97,     0,
       0,     0,     0,   339,   649,     0,     0,     0,    98,     0,
       0,     0,    61,    62,    63,    64,    65,    66,    67,    68,
      69,   553,   609,   554,   555,   134,    84,    85,    86,     0,
       0,     0,   391,     0,     0,     0,   610,     0,    61,    62,
      63,    64,    65,    66,    67,    68,    69,   253,   168,   168,
     168,   166,     0,   616,   617,     0,   618,   619,     0,   620,
     647,     0,     0,   625,   213,   626,   627,   628,   629,   630,
     631,   632,   633,   634,   635,    37,   636,     0,     0,     0,
     235,     0,    12,    13,    14,   236,     0,     0,     0,   237,
     238,   239,   240,   662,     0,   241,     0,   242,     0,   243,
       0,   244,     0,     0,     0,     0,   245,   246,     4,   247,
     248,    62,    63,    64,    65,   249,   250,   251,   252,   253,
       0,     0,     0,   254,    84,    85,    86,     0,     0,     0,
       0,  -160,   214,  -138,  -138,  -138,  -138,  -138,  -138,  -138,
    -138,  -138,  -138,  -138,  -138,  -138,  -138,  -138,  -138,  -138,
       0,     0,     0,     0,     0,     0,     0,     0,    95,    95,
     650,     0,    97,    97,     0,     0,     0,     0,     0,     0,
       0,     0,    98,    98,     0,     0,     0,     0,   168,     0,
       0,     0,     0,     0,     0,    20,     0,     0,   465,     0,
      37,     0,     0,   255,     0,     0,     0,    12,    13,    14,
     236,     0,   667,   668,   237,   238,   239,   240,     0,     0,
     241,     0,   242,     0,   243,     0,   244,     0,     0,  -138,
       0,   245,   246,     4,  -347,   248,    62,    63,    64,    65,
     249,   250,   251,   252,   253,     0,     0,     0,   254,    84,
      85,    86,     0,     0,   571,   572,   573,   574,   575,   576,
     577,   578,   579,   580,   581,   582,   583,   584,   473,    62,
      63,    64,    65,    66,    67,    68,    69,   474,    80,   475,
     476,   477,    84,    85,    86,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    79,    80,    81,    82,    83,    84,
      85,    86,     0,     0,     0,     0,     0,     0,     0,     0,
      20,     0,     0,     0,     0,     0,     0,     0,   255,     0,
       0,     0,     0,     0,     4,     0,     0,     0,     0,   585,
       0,   586,   587,   588,   589,   590,   591,   592,   593,   571,
     572,   573,   574,   575,   576,   577,   578,   579,   580,   581,
     582,   583,   584,     0,     0,     0,     0,     0,     0,     0,
       0,   478,   479,   480,     0,     0,     0,     0,     0,     0,
       0,    87,   146,   147,   148,   149,   150,   151,   152,   153,
     154,   155,   156,   157,   158,   159,  -366,  -366,  -366,  -366,
    -366,  -366,  -366,  -366,  -366,  -366,  -366,  -366,  -366,  -366,
     145,     0,    61,    62,    63,    64,    65,    66,    67,    68,
      69,   105,     0,     0,   585,     0,   586,   587,   588,   589,
     590,   591,   592,   593,     0,     0,     0,    61,    62,    63,
      64,    65,    66,    67,    68,    69,   558,  -366,   559,   560,
     134,    84,    85,    86,     0,  -366,  -366,   146,   147,   148,
     149,   150,   151,   152,   153,   154,   155,   156,   157,   158,
     159,   369,   370,   371,   372,   373,   374,   375,   376,   377,
     378,   379,   380,   381,   382,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    79,    80,    81,    82,   134,    84,
      85,    86,  -229,  -229,  -229,  -229,  -229,  -229,  -229,  -229,
    -229,  -229,  -229,  -229,  -229,  -229,  -229,  -229,  -229,    61,
      62,    63,    64,    65,    66,    67,    68,    69,     0,     0,
     383,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,   348,   349,
     350,   351,   352,   353,   354,   355,   356,   357,    80,   358,
     359,   134,    84,    85,    86,    61,    62,    63,    64,    65,
      66,    67,    68,    69,   393,    80,    81,    82,   134,    84,
      85,    86,    61,    62,    63,    64,    65,    66,    67,    68,
      69,   562,     0,   563,   564,   134,    84,    85,    86,    61,
      62,    63,    64,    65,    66,    67,    68,    69,     0,     0,
     467,   468,   134,    84,    85,    86,    61,    62,    63,    64,
      65,    66,    67,    68,    69,     0,     0,   470,   471,   134,
      84,    85,    86,    61,    62,    63,    64,    65,    66,    67,
      68,    69,     0,     0,   639,   640,   134,    84,    85,    86,
      61,    62,    63,    64,    65,    66,    67,    68,    69,     0,
       0,   642,   643,   134,    84,    85,    86,    61,    62,    63,
      64,    65,    66,    67,    68,    69,   335,     0,     0,     0,
     134,    84,    85,    86,    61,    62,    63,    64,    65,    66,
      67,    68,    69,   637,     0,     0,     0,   134,    84,    85,
      86,    61,    62,    63,    64,    65,    66,    67,    68,    69,
     461,     0,     0,     0,   462,     0,   463,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    79,    80,    81,    82,
      61,    62,    63,    64,    65,    66,    67,    68,   547
};

static const yytype_int16 yycheck[] =
{
       1,     2,    29,   152,   234,    18,    29,    87,    10,   157,
     158,   159,   240,    94,   423,   219,    29,   115,   245,    10,
     219,    22,    10,    44,    34,    26,    27,    40,    34,   219,
       0,     1,    11,     3,     4,     5,    37,    44,   625,     9,
      10,    42,    12,   247,     2,   223,    16,   121,   247,    34,
      16,    30,     8,     9,    10,     0,    12,   247,   236,    34,
     288,   251,   219,    76,   219,   255,   219,    45,    34,   656,
     475,   476,    45,    74,     1,   219,     3,     4,     5,    35,
      36,   486,     9,    10,    42,    12,   276,    88,    47,    16,
     247,    34,   247,    36,   247,   108,   109,   110,   178,    97,
     121,    99,   115,   247,   185,   349,   350,   351,   352,   353,
     354,   113,   122,   114,   121,   121,   143,   361,    13,   363,
     143,   219,   113,   119,   198,   113,   111,   112,   113,   122,
     143,    36,   128,    28,   104,    34,    31,   119,   108,   119,
     367,   126,   403,   111,   112,   113,   407,   245,   104,   247,
     411,    45,   108,   234,    45,   111,   383,   125,   121,   119,
      45,   117,   122,   176,    37,    38,   167,    40,   128,   122,
     183,   121,   185,   254,   358,   359,   114,   104,   362,   383,
     122,   108,   372,   373,   383,   115,   116,    37,    38,   270,
      40,   123,   124,   383,   122,    45,   120,    96,    97,    98,
     444,   100,   101,   102,   103,   123,   219,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,   219,    45,    46,
     124,   234,   303,   106,   107,    97,    98,   228,   100,   101,
     120,   421,   245,   423,   247,   121,   464,   645,   646,   252,
     241,   242,   243,   270,   653,   247,   121,   270,   119,   276,
     237,   238,   119,   276,   119,   256,    34,   270,    54,    55,
      56,    57,    58,    59,   454,   455,   456,   127,   269,   367,
     127,   127,   273,    45,   275,    37,    38,    39,    40,    45,
      46,    47,    48,   284,    47,   383,     7,    48,   120,   120,
     120,   109,   105,   122,   119,   121,   309,   298,   119,    45,
     128,   110,    19,   316,   384,   318,    36,    37,    38,    39,
      40,    41,    42,    43,    44,   127,    20,    29,   121,    49,
     127,    53,   323,   324,   121,   120,   127,   328,   329,    44,
      53,   332,   333,   127,   127,   120,    96,   121,    22,    24,
     420,    44,    44,    44,   493,   425,    44,    44,    44,    44,
     498,    44,    34,   366,   367,   119,   121,    14,    26,   113,
     383,    36,    37,    38,    39,    40,    41,    42,    43,    44,
     383,   121,   121,   120,    49,   605,   176,   226,   170,   459,
      50,   183,   270,   247,   174,   386,   143,   481,   389,   505,
     417,   121,   656,   413,   522,   661,   477,   244,   424,   512,
     481,   510,   405,    31,   594,   595,   596,   488,    34,   489,
     409,   491,   383,    -1,    -1,   428,   429,   430,   431,   432,
     433,   434,    -1,   521,   522,   523,    -1,    -1,    -1,    -1,
     443,    -1,   445,   446,   447,    36,    37,    38,    39,    40,
      41,    42,    43,    44,   457,   458,    -1,   460,    49,    50,
      51,    52,    -1,    -1,   481,    -1,    -1,    -1,   481,    -1,
      -1,    -1,    -1,   653,   613,    -1,    -1,    -1,   481,    -1,
      -1,    -1,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,   509,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,   505,    -1,    -1,    -1,   509,    -1,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,   521,   522,
     523,    49,    -1,   514,   515,    -1,   517,   518,    -1,   520,
     600,    -1,    -1,   524,   605,   526,   539,   540,   541,   542,
     543,   544,   545,   546,   547,     1,   549,    -1,    -1,    -1,
       6,    -1,     8,     9,    10,    11,    -1,    -1,    -1,    15,
      16,    17,    18,   651,    -1,    21,    -1,    23,    -1,    25,
      -1,    27,    -1,    -1,    -1,    -1,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      -1,    -1,    -1,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    34,   605,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   645,   646,
     621,    -1,   645,   646,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   645,   646,    -1,    -1,    -1,    -1,   651,    -1,
      -1,    -1,    -1,    -1,    -1,   111,    -1,    -1,   661,    -1,
       1,    -1,    -1,   119,    -1,    -1,    -1,     8,     9,    10,
      11,    -1,   663,   664,    15,    16,    17,    18,    -1,    -1,
      21,    -1,    23,    -1,    25,    -1,    27,    -1,    -1,   122,
      -1,    32,    33,    34,    34,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    -1,    -1,    -1,    49,    50,
      51,    52,    -1,    -1,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     111,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
      -1,    -1,    -1,    -1,    34,    -1,    -1,    -1,    -1,   129,
      -1,   131,   132,   133,   134,   135,   136,   137,   138,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   122,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      35,    -1,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    -1,    -1,   129,    -1,   131,   132,   133,   134,
     135,   136,   137,   138,    -1,    -1,    -1,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,   119,    47,    48,
      49,    50,    51,    52,    -1,   127,   128,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    -1,    -1,
     127,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    -1,    47,    48,    49,    50,    51,    52,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    -1,    -1,
      47,    48,    49,    50,    51,    52,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    -1,    -1,    47,    48,    49,
      50,    51,    52,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    -1,    -1,    47,    48,    49,    50,    51,    52,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    -1,
      -1,    47,    48,    49,    50,    51,    52,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    -1,    -1,    -1,
      49,    50,    51,    52,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    -1,    -1,    -1,    49,    50,    51,
      52,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    -1,    -1,    -1,    49,    -1,    51,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      36,    37,    38,    39,    40,    41,    42,    43,    44
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   115,   116,   140,    34,   142,   143,   302,   303,   141,
     142,     0,     8,     9,    10,    12,    35,    36,   104,   108,
     111,   117,   146,   147,   148,   149,   160,   162,   190,   205,
     231,   304,   305,   306,   308,   309,   310,     1,     3,     4,
       5,    16,   144,   145,   146,   159,   160,   161,   162,   166,
     168,   200,   281,    45,    47,    45,   122,   143,   198,   307,
     310,    36,    37,    38,    39,    40,    41,    42,    43,    44,
     297,   298,    36,   119,   191,   143,   119,   143,   143,    45,
      46,    47,    48,    49,    50,    51,    52,   122,   207,   208,
     210,   211,   212,   213,   250,   290,   291,   296,   297,   305,
     307,   170,   143,    45,    45,    45,   169,   297,    37,    38,
      40,   286,   142,   143,   170,   121,    45,   163,   164,   165,
     114,   111,   112,   113,   125,   192,   193,   194,   195,   143,
     150,   151,   152,   297,    49,   214,   289,   290,   294,   295,
     296,   297,   143,   121,   213,    35,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
     171,   297,   297,   297,   145,   143,    49,   250,   297,   123,
     124,   191,   196,   120,   121,   120,   121,   123,   124,   210,
     119,   278,   279,   119,   278,   119,   172,   279,   279,   279,
     127,   127,   127,   176,   177,   143,   165,    34,   111,   112,
     113,   126,   197,   194,    34,   152,   289,    45,   169,    45,
     173,   174,   175,   213,   297,    47,    48,    45,    46,   185,
       7,   178,   191,   106,   107,   153,   154,   155,   156,   157,
     158,   120,   120,   120,   121,     6,    11,    15,    16,    17,
      18,    21,    23,    25,    27,    32,    33,    35,    36,    41,
      42,    43,    44,    45,    49,   119,   160,   167,   186,   187,
     188,   189,   190,   198,   199,   200,   201,   202,   203,   204,
     205,   215,   216,   218,   220,   221,   224,   226,   227,   231,
     232,   233,   234,   243,   244,   245,   246,   247,   248,   250,
     251,   257,   258,   259,   260,   268,   269,   280,   282,   283,
     285,   294,   297,   298,    37,    38,    39,    40,   179,   293,
     293,   109,   105,   155,   143,   175,   293,   286,    45,   284,
     286,   287,   119,   261,   261,   143,   143,   143,   251,   245,
      45,   187,   294,   297,   213,    45,   252,   253,   254,   294,
     143,   143,   206,   207,   209,   213,   143,   143,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    47,    48,
     222,   290,   294,   296,   143,   261,   128,   127,   143,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,   127,   301,   213,   180,   297,   110,   228,
     229,   297,   297,    45,   262,   263,   264,   265,   266,   267,
     289,   143,   143,    19,   270,   271,   272,    20,   273,   274,
     275,    29,   235,   236,   237,   143,   143,   121,   143,   143,
     127,    53,   120,   121,   255,   127,    44,   121,   225,   225,
     225,   225,   225,   225,   225,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    49,   121,    44,   121,    54,    55,
      56,    57,    58,    59,   292,   292,   292,    44,   225,   292,
     225,    45,    49,    51,   249,   297,   245,    47,    48,   294,
      47,    48,   294,    36,    45,    47,    48,    49,   129,   130,
     131,   205,   217,   219,   245,   291,   294,   296,   298,   299,
     289,   127,    96,    97,    98,   100,   101,   102,   103,   143,
     181,   182,   183,   184,   256,   121,   143,    96,   230,   127,
      53,   120,   121,   276,   266,    22,   272,   266,    24,   275,
     266,    13,    28,    31,   238,   237,   290,   289,   294,   254,
     256,   289,   297,   297,   297,   297,   297,   297,   297,    44,
      44,    44,    44,    44,    44,    44,    44,    44,   297,   225,
     297,   297,   297,    45,    47,    48,   223,   294,    45,    47,
      48,   294,    45,    47,    48,   294,   297,   297,   289,   297,
     261,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,   129,   131,   132,   133,   134,
     135,   136,   137,   138,   300,   300,   300,   213,   211,   213,
     300,   213,   289,   289,   278,   119,   279,   229,   288,   290,
     297,   267,   264,    97,    99,   277,   143,   143,   143,   143,
     143,   250,   248,   250,   250,   143,   143,   297,   297,   297,
     297,   297,   297,   297,   297,   297,   297,    45,   294,    47,
      48,   294,    47,    48,   294,   121,   121,   289,   175,   278,
     143,   121,   239,    30,   227,   240,   241,   242,   208,   208,
     120,    14,   250,   254,    26,   242,   249,   143,   143
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (yyscanner, lexer, YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (&yylval, YYLEX_PARAM)
#else
# define YYLEX yylex (&yylval, yyscanner)
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, yyscanner, lexer); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, yyscan_t yyscanner, struct lexer_state * const lexer)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yyscanner, lexer)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state * const lexer;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yyscanner);
  YYUSE (lexer);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, yyscan_t yyscanner, struct lexer_state * const lexer)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yyscanner, lexer)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state * const lexer;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yyscanner, lexer);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule, yyscan_t yyscanner, struct lexer_state * const lexer)
#else
static void
yy_reduce_print (yyvsp, yyrule, yyscanner, lexer)
    YYSTYPE *yyvsp;
    int yyrule;
    yyscan_t yyscanner;
    struct lexer_state * const lexer;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       , yyscanner, lexer);
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule, yyscanner, lexer); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, yyscan_t yyscanner, struct lexer_state * const lexer)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yyscanner, lexer)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state * const lexer;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yyscanner);
  YYUSE (lexer);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (yyscan_t yyscanner, struct lexer_state * const lexer);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */






/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (yyscan_t yyscanner, struct lexer_state * const lexer)
#else
int
yyparse (yyscanner, lexer)
    yyscan_t yyscanner;
    struct lexer_state * const lexer;
#endif
#endif
{
  /* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;

  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 4:
#line 572 "pir.y"
    { fixup_global_labels(lexer); ;}
    break;

  case 7:
#line 580 "pir.y"
    { lexer->linenr += (yyvsp[(1) - (1)].ival); ;}
    break;

  case 20:
#line 606 "pir.y"
    { new_macro_const(lexer->macros, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval), yypirget_lineno(yyscanner)); ;}
    break;

  case 21:
#line 612 "pir.y"
    { /* fprintf(stderr, "macro body: [%s]\n", CURRENT_MACRO(lexer)->body);*/ ;}
    break;

  case 22:
#line 616 "pir.y"
    {
                          new_macro(lexer->macros, (yyvsp[(2) - (2)].sval), yypirget_lineno(yyscanner), TRUE,
                                    lexer->macro_size);
                        ;}
    break;

  case 27:
#line 631 "pir.y"
    { add_macro_param(CURRENT_MACRO(lexer), (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 35:
#line 650 "pir.y"
    { store_macro_string(CURRENT_MACRO(lexer), "%s\n", (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 36:
#line 654 "pir.y"
    {
                          store_macro_string(CURRENT_MACRO(lexer), ".local %s %s\n",
                                             pir_type_names[(yyvsp[(2) - (3)].ival)], (yyvsp[(3) - (3)].sval));
                        ;}
    break;

  case 37:
#line 665 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 38:
#line 669 "pir.y"
    { yypirset_lineno ((yyvsp[(2) - (2)].ival), yyscanner); ;}
    break;

  case 39:
#line 671 "pir.y"
    { lexer->filename = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 40:
#line 677 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 41:
#line 681 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 42:
#line 685 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 43:
#line 687 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 44:
#line 691 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 45:
#line 693 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 46:
#line 697 "pir.y"
    { (yyval.expr) = expr_from_string(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 48:
#line 707 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 49:
#line 711 "pir.y"
    { new_subr(lexer, lexer->sval /*$2*/); ;}
    break;

  case 54:
#line 723 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_ANON);;}
    break;

  case 55:
#line 725 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_INIT); ;}
    break;

  case 56:
#line 727 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_LOAD); ;}
    break;

  case 57:
#line 729 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_MAIN); ;}
    break;

  case 58:
#line 731 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_LEX); ;}
    break;

  case 59:
#line 733 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_POSTCOMP); ;}
    break;

  case 60:
#line 735 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_IMMEDIATE); ;}
    break;

  case 61:
#line 737 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_MULTI); ;}
    break;

  case 62:
#line 739 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 63:
#line 741 "pir.y"
    { set_sub_methodname(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 64:
#line 743 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 65:
#line 745 "pir.y"
    { set_sub_subid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 66:
#line 747 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 67:
#line 749 "pir.y"
    { set_sub_nsentry(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 68:
#line 753 "pir.y"
    { set_sub_multi_types(lexer, (yyvsp[(2) - (3)].expr)); ;}
    break;

  case 69:
#line 757 "pir.y"
    {
                          CURRENT_SUB(lexer)->info.num_multi_types = 1;
                          /* n=1 means :multi() -- without any types. */
                        ;}
    break;

  case 70:
#line 762 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 71:
#line 766 "pir.y"
    {
                          CURRENT_SUB(lexer)->info.num_multi_types = 2;
                          /* start counting multi types; always 1 higher than actual number
                           * so that n=0 means no :multi, n=1 means :multi(), n=2 means
                           * :multi(Type1), n=3 means :multi(Type1,Type2), etc.
                           */
                           (yyval.expr) = (yyvsp[(1) - (1)].expr);
                        ;}
    break;

  case 72:
#line 775 "pir.y"
    {
                          ++CURRENT_SUB(lexer)->info.num_multi_types;
                          /* link the multi types in reverse other. That's fine,
                           * as long as you remember that it's reversed.
                           */
                          (yyvsp[(3) - (3)].expr)->next = (yyvsp[(1) - (3)].expr);
                          (yyval.expr) = (yyvsp[(3) - (3)].expr);
                        ;}
    break;

  case 73:
#line 786 "pir.y"
    { (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 74:
#line 788 "pir.y"
    { (yyval.expr) = expr_from_string(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 75:
#line 790 "pir.y"
    { (yyval.expr) = expr_from_key(lexer, (yyvsp[(1) - (1)].key)); ;}
    break;

  case 76:
#line 794 "pir.y"
    { generate_parameters_instr(lexer, (yyvsp[(1) - (1)].uval)); ;}
    break;

  case 77:
#line 798 "pir.y"
    { (yyval.uval) = 0; ;}
    break;

  case 78:
#line 800 "pir.y"
    {
                          /* if the :named flag was set, there's an extra
                           * constant string argument for the name. count that too.
                           */
                          if (TEST_FLAG((yyvsp[(2) - (2)].targ)->flags, TARGET_FLAG_NAMED))
                              (yyval.uval) += 2;
                          else
                              ++(yyval.uval);

                        ;}
    break;

  case 79:
#line 813 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 80:
#line 817 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 81:
#line 821 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 82:
#line 823 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 87:
#line 833 "pir.y"
    {
                           (yyval.ival) = TARGET_FLAG_LOOKAHEAD;
                           set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 88:
#line 840 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT;
                           /* XXX handle multi_type */

                         ;}
    break;

  case 89:
#line 847 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 91:
#line 854 "pir.y"
    {
                         ++lexer->stmt_counter;
                         /* increment the logical statement counter; a statement can be
                          * multiple lines, but each statement has its own ID for the
                          * linear scan register allocator.
                          */
                        ;}
    break;

  case 92:
#line 864 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 110:
#line 887 "pir.y"
    { annotate(lexer, (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].cval)); ;}
    break;

  case 112:
#line 897 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (3)].mval), (yyvsp[(2) - (3)].pval)); ;}
    break;

  case 113:
#line 901 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 114:
#line 903 "pir.y"
    { (yyval.pval) = (yyvsp[(2) - (3)].pval); ;}
    break;

  case 115:
#line 907 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 117:
#line 912 "pir.y"
    { (yyval.pval) = new_macro_param((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 118:
#line 914 "pir.y"
    {
                          macro_param *param = new_macro_param((yyvsp[(3) - (3)].sval));
                          param->next = (yyvsp[(1) - (3)].pval);
                          (yyval.pval) = param;
                        ;}
    break;

  case 119:
#line 922 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "macro argument '%s' is not a "
                                                           "declared identifier", (yyvsp[(1) - (1)].sval));
                          }
                        ;}
    break;

  case 121:
#line 931 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 123:
#line 936 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 124:
#line 941 "pir.y"
    { (yyval.sval) = ""; ;}
    break;

  case 125:
#line 943 "pir.y"
    { /* XXX cleanup memory stuff */
                          char *newbuff = (char *)mem_sys_allocate((strlen((yyvsp[(1) - (2)].sval)) + strlen((yyvsp[(2) - (2)].sval)) + 2)
                                                                   * sizeof (char));
                          sprintf(newbuff, "%s %s", (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval));
                          (yyval.sval) = newbuff;
                        ;}
    break;

  case 126:
#line 952 "pir.y"
    { (yyval.sval) = "\n"; ;}
    break;

  case 129:
#line 956 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 130:
#line 964 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 132:
#line 972 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         ;}
    break;

  case 133:
#line 981 "pir.y"
    {
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(lexer);
                         ;}
    break;

  case 134:
#line 988 "pir.y"
    {
                           generate_getresults_instr(lexer, (yyvsp[(2) - (3)].targ));
                         ;}
    break;

  case 138:
#line 1001 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 139:
#line 1010 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(lexer))
                              do_strength_reduction(lexer);
                        ;}
    break;

  case 145:
#line 1028 "pir.y"
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
                         set_target_key(obj, (yyvsp[(1) - (3)].key));

                         /* indexed operation is a "set" opcode */
                         update_instr(lexer, "set");
                         unshift_operand(lexer, (yyvsp[(3) - (3)].expr));
                         unshift_operand(lexer, expr_from_target(lexer, obj));

                         get_opinfo(lexer);
                       ;}
    break;

  case 146:
#line 1064 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 147:
#line 1066 "pir.y"
    { push_operand(lexer, expr_from_key(lexer, (yyvsp[(1) - (1)].key))); ;}
    break;

  case 148:
#line 1070 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 149:
#line 1072 "pir.y"
    { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 150:
#line 1077 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 151:
#line 1079 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 152:
#line 1083 "pir.y"
    {
                           /* if $1 is a register, just return that */
                           if (TEST_FLAG((yyvsp[(1) - (2)].targ)->flags, TARGET_FLAG_IS_REG))
                               (yyval.targ) = (yyvsp[(1) - (2)].targ);
                           else { /* it's not a register, so it must be a declared symbol */
                               if ((yyvsp[(1) - (2)].targ)->info->type != PMC_TYPE)
                                   yypirerror(yyscanner, lexer,
                                           "indexed object '%s' is not of type 'pmc'",
                                           (yyvsp[(1) - (2)].targ)->info->id.name);

                               /* create a target node based on the symbol node;
                                * sym already has a PASM register, so through
                                * this the target will get that too.
                                */
                               (yyval.targ) = (yyvsp[(1) - (2)].targ);
                           }

                           /* in both cases (register or symbol), set the key on this target */
                           set_target_key((yyval.targ), (yyvsp[(2) - (2)].key));
                         ;}
    break;

  case 153:
#line 1106 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 154:
#line 1110 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 155:
#line 1112 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 156:
#line 1121 "pir.y"
    {
                          /* the instruction is already set in parrot_op rule */
                          unshift_operand(lexer, (yyvsp[(4) - (6)].expr));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));

                          if (check_op_args_for_symbols(lexer)) {
                              check_first_arg_direction(lexer, (yyvsp[(3) - (6)].sval));
                              do_strength_reduction(lexer);
                          }
                        ;}
    break;

  case 157:
#line 1132 "pir.y"
    {
                          /* the instruction is already set in parrot_op rule */
                          unshift_operand(lexer, (yyvsp[(4) - (4)].expr));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (4)].targ)));

                          /* if checking op args is successful, do other checks */
                          if (check_op_args_for_symbols(lexer)) {
                              check_first_arg_direction(lexer, (yyvsp[(3) - (4)].sval));
                              do_strength_reduction(lexer);
                          }
                        ;}
    break;

  case 158:
#line 1144 "pir.y"
    {
                          unshift_operand(lexer, expr_from_key(lexer, (yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));
                          if (check_op_args_for_symbols(lexer))
                              check_first_arg_direction(lexer, (yyvsp[(3) - (6)].sval));
                              /* no strength reduction here */
                        ;}
    break;

  case 162:
#line 1161 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                          CURRENT_INSTRUCTION(lexer)->sourceline = lexer->linenr;
                          get_opinfo(lexer);
                        ;}
    break;

  case 163:
#line 1170 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(lexer);
                        ;}
    break;

  case 164:
#line 1179 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].cval));
                          get_opinfo(lexer);
                        ;}
    break;

  case 165:
#line 1184 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 166:
#line 1189 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (3)].sval));
                          if (sym) {
                              target *rhs = target_from_symbol(lexer, sym);
                              if (!targets_equal((yyvsp[(1) - (3)].targ), rhs)) {
                                  set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), rhs);
                                  get_opinfo(lexer);
                              }
                          }
                          else { /* not a symbol */
                              if (is_parrot_op(lexer, (yyvsp[(3) - (3)].sval))) {
                                  set_instrf(lexer, (yyvsp[(3) - (3)].sval), "%T", (yyvsp[(1) - (3)].targ));
                                  get_opinfo(lexer);
                              }
                              else {
                                  yypirerror(yyscanner, lexer, "'%s' is neither a declared symbol "
                                             "nor a parrot opcode", (yyvsp[(3) - (3)].sval));
                              }
                          }
                        ;}
    break;

  case 167:
#line 1210 "pir.y"
    {
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                          get_opinfo(lexer);
                        ;}
    break;

  case 168:
#line 1215 "pir.y"
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
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (4)].sval));
                          target *t;
                          if (sym == NULL) {
                              if (is_parrot_op(lexer, (yyvsp[(3) - (4)].sval))) {
                                  set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), expr_from_key(lexer, (yyvsp[(4) - (4)].key)));
                                  get_opinfo(lexer);
                              }
                              else
                                  yypirerror(yyscanner, lexer,
                                             "indexed object '%s' not declared", (yyvsp[(3) - (4)].sval));

                              /* create a symbol node anyway, so we can continue with instr. gen. */
                              sym = new_symbol(lexer, (yyvsp[(3) - (4)].sval), PMC_TYPE);
                          }
                          else {
                              /* at this point, sym is not NULL, even if there was an error */
                              if (sym->info.type != PMC_TYPE)
                                  yypirerror(yyscanner, lexer,
                                          "indexed object '%s' must be of type 'pmc'", (yyvsp[(3) - (4)].sval));

                              t = target_from_symbol(lexer, sym);
                              set_target_key(t, (yyvsp[(4) - (4)].key));
                              update_instr(lexer, "set");
                              unshift_operand(lexer, expr_from_target(lexer, t));
                              unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (4)].targ)));
                              get_opinfo(lexer);
                          }
                        ;}
    break;

  case 169:
#line 1256 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(3) - (4)].sval));
                              sym = new_symbol(lexer, (yyvsp[(3) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->info.type != PMC_TYPE)
                              yypirerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(3) - (4)].sval));

                          t = target_from_symbol(lexer, sym);
                          set_target_key(t, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), t);
                          get_opinfo(lexer);
                        ;}
    break;

  case 170:
#line 1274 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                          get_opinfo(lexer);
                        ;}
    break;

  case 171:
#line 1281 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 172:
#line 1286 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(lexer);
                        ;}
    break;

  case 173:
#line 1297 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(lexer);
                        ;}
    break;

  case 174:
#line 1308 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(lexer);
                        ;}
    break;

  case 175:
#line 1319 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(lexer);
                        ;}
    break;

  case 176:
#line 1330 "pir.y"
    {
                          set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 177:
#line 1335 "pir.y"
    {
                          set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 178:
#line 1340 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 179:
#line 1345 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%E", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].expr));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%E", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].expr));

                          get_opinfo(lexer);
                          do_strength_reduction(lexer);
                        ;}
    break;

  case 180:
#line 1355 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(1) - (4)].sval));
                              /* create a dummy symbol so we can continue without seg. faults */
                              sym = new_symbol(lexer, (yyvsp[(1) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->info.type != PMC_TYPE)
                              yypirerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(1) - (4)].sval));
                          /* at this point sym is a valid (possibly dummy) object for sure */
                          t = target_from_symbol(lexer, sym);
                          set_target_key(t, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", t, (yyvsp[(4) - (4)].expr));
                          get_opinfo(lexer);
                      ;}
    break;

  case 181:
#line 1374 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 182:
#line 1408 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 183:
#line 1410 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 184:
#line 1412 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 185:
#line 1414 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 186:
#line 1416 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 187:
#line 1418 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 188:
#line 1420 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 189:
#line 1422 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 190:
#line 1427 "pir.y"
    { get_opinfo(lexer); ;}
    break;

  case 191:
#line 1436 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 192:
#line 1438 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 193:
#line 1440 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 194:
#line 1442 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 195:
#line 1444 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 196:
#line 1446 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 197:
#line 1448 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 198:
#line 1450 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 199:
#line 1452 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 200:
#line 1454 "pir.y"
    {
                          int istrue = evaluate_c(lexer, (yyvsp[(2) - (4)].cval));
                          /* if "unless", invert the true-ness */
                          istrue = (yyvsp[(1) - (4)].ival) ? !istrue : istrue;
                          if (istrue) {
                              set_instrf(lexer, "branch", "%I", (yyvsp[(4) - (4)].sval));
                              set_op_labelflag(lexer, BIT(1));
                          }
                          else
                              set_instr(lexer, "noop");
                        ;}
    break;

  case 201:
#line 1466 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (5)].ival)), (yyvsp[(5) - (5)].sval));
                          /* set a flag indicating that the 2nd operand is a label */
                          set_op_labelflag(lexer, BIT(1));
                        ;}
    break;

  case 202:
#line 1473 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 203:
#line 1475 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval));
                          /* set a flag indicating that the 2nd operand is a label */
                          set_op_labelflag(lexer, BIT(1));
                        ;}
    break;

  case 204:
#line 1481 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 205:
#line 1483 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 206:
#line 1485 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 207:
#line 1487 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 208:
#line 1489 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 209:
#line 1491 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 210:
#line 1493 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 211:
#line 1495 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 212:
#line 1497 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 213:
#line 1499 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 214:
#line 1501 "pir.y"
    {
                          if ((yyvsp[(2) - (4)].ival) == COMPUTE_DURING_RUNTIME) {
                             if ((yyvsp[(1) - (4)].ival) == NEED_INVERT_OPNAME) /* "unless" */
                                 invert_instr(lexer);

                             push_operand(lexer, expr_from_ident(lexer, (yyvsp[(4) - (4)].sval)));
                             /* set a flag indicating that the 3rd operand is a label */
                             set_op_labelflag(lexer, BIT(2));
                          }
                          else { /* evaluation during compile time */
                             /* if the result was false but the instr. was "unless", or,
                              * if the result was true and the instr. was "if",
                              * do an unconditional jump.
                              */
                             if (((yyvsp[(2) - (4)].ival) == FALSE && (yyvsp[(1) - (4)].ival) == NEED_INVERT_OPNAME)/* unless false -> jump */
                             ||  ((yyvsp[(2) - (4)].ival) == TRUE  && (yyvsp[(1) - (4)].ival) == DONT_INVERT_OPNAME)) {  /* if true -> jump */
                                set_instrf(lexer, "branch", "%I", (yyvsp[(4) - (4)].sval));
                                set_op_labelflag(lexer, BIT(0));
                             }
                             else                       /* if false, unless true --> do nothing */
                                set_instr(lexer, "noop");

                          }
                        ;}
    break;

  case 215:
#line 1532 "pir.y"
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
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%E%T", (yyvsp[(3) - (3)].expr), (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;  /* indicates this is evaluated at runtime */
                        ;}
    break;

  case 216:
#line 1558 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%i", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].ival));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 217:
#line 1566 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%n", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].dval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 218:
#line 1575 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%s", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].sval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 219:
#line 1584 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 220:
#line 1586 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 221:
#line 1588 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 222:
#line 1590 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 223:
#line 1592 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 224:
#line 1596 "pir.y"
    {
                          yypirerror(yyscanner, lexer, "cannot compare string to %s",
                                     (yyvsp[(3) - (3)].ival) == INT_TYPE ? "integer" : "number");
                        ;}
    break;

  case 225:
#line 1601 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare integer to string"); ;}
    break;

  case 226:
#line 1603 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare number to string"); ;}
    break;

  case 227:
#line 1607 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 228:
#line 1608 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 229:
#line 1611 "pir.y"
    { (yyval.ival) = DONT_INVERT_OPNAME; /* no need to invert */ ;}
    break;

  case 230:
#line 1612 "pir.y"
    { (yyval.ival) = NEED_INVERT_OPNAME; /* yes, invert opname */ ;}
    break;

  case 233:
#line 1620 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_op_labelflag(lexer, BIT(0)); /* bit 0 means: "1 << 0" */
                          get_opinfo(lexer);
                        ;}
    break;

  case 234:
#line 1628 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 235:
#line 1632 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 236:
#line 1634 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 237:
#line 1638 "pir.y"
    { (yyval.symb) = new_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 238:
#line 1641 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 239:
#line 1642 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 240:
#line 1646 "pir.y"
    { /* if $4 is not a register, it must be a declared symbol */
                          if (!TEST_FLAG((yyvsp[(4) - (5)].targ)->flags, TARGET_FLAG_IS_REG)) {

                              if ((yyvsp[(4) - (5)].targ)->info->type != PMC_TYPE) /* a .lex must be a PMC */
                                  yypirerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                             (yyvsp[(4) - (5)].targ)->info->id.name);
                          }
                          set_lex_flag(lexer, (yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                        ;}
    break;

  case 241:
#line 1661 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 244:
#line 1673 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args(lexer, (yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              (yyval.invo) = set_invocation_results(lexer, (yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 245:
#line 1680 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 246:
#line 1682 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 247:
#line 1686 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 248:
#line 1688 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 249:
#line 1692 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 250:
#line 1696 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 251:
#line 1698 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 252:
#line 1701 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].expr)); ;}
    break;

  case 253:
#line 1705 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 254:
#line 1707 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 255:
#line 1711 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 256:
#line 1713 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 257:
#line 1717 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 258:
#line 1719 "pir.y"
    {
                             if ((yyvsp[(2) - (2)].targ))
                                 (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ));
                             else
                                 (yyval.targ) = (yyvsp[(1) - (2)].targ)
                           ;}
    break;

  case 259:
#line 1728 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 260:
#line 1730 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 262:
#line 1738 "pir.y"
    { (yyval.invo) = set_invocation_results(lexer, (yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 263:
#line 1740 "pir.y"
    { (yyval.invo) = set_invocation_results(lexer, (yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 264:
#line 1742 "pir.y"
    {  (yyval.invo) = set_invocation_results(lexer, (yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 267:
#line 1750 "pir.y"
    {
                             /* if $1 is not a register, check whether the symbol was declared */
                             if (!TEST_FLAG((yyvsp[(1) - (4)].targ)->flags, TARGET_FLAG_IS_REG)) {

                                 symbol *sym = find_symbol(lexer, (yyvsp[(1) - (4)].targ)->info->id.name);
                                 if (sym == NULL)
                                     yypirerror(yyscanner, lexer,
                                             "symbol '%s' was not declared", (yyvsp[(1) - (4)].targ)->info->id.name);
                                 else if ((yyvsp[(1) - (4)].targ)->info->type != PMC_TYPE)
                                     yypirerror(yyscanner, lexer,
                                             "cannot invoke method: '%s' is not of type 'pmc'",
                                             (yyvsp[(1) - (4)].targ)->info->id.name);
                             }

                             (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].expr));
                             set_invocation_args(lexer, (yyval.invo), (yyvsp[(4) - (4)].argm));
                           ;}
    break;

  case 268:
#line 1770 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 269:
#line 1777 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 270:
#line 1779 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);
                           ;}
    break;

  case 271:
#line 1789 "pir.y"
    { /* check that this identifier was declared */
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));

                             if (sym == NULL) {
                                yypirerror(yyscanner, lexer,
                                        "method identifier '%s' not declared", (yyvsp[(1) - (1)].sval));
                                /* make sure sym is not NULL */
                                sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);
                             }
                             else if (sym->info.type != PMC_TYPE
                                  &&  sym->info.type != STRING_TYPE)
                                 yypirerror(yyscanner, lexer,
                                         "method '%s' must be of type 'pmc' or 'string'", (yyvsp[(1) - (1)].sval));

                             (yyval.expr) = expr_from_target(lexer, target_from_symbol(lexer, sym));
                           ;}
    break;

  case 272:
#line 1806 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 273:
#line 1808 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 274:
#line 1810 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_VAL, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 275:
#line 1814 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);

                           ;}
    break;

  case 276:
#line 1823 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 277:
#line 1828 "pir.y"
    {
                             (yyval.targ) = (yyvsp[(2) - (3)].targ);
                           ;}
    break;

  case 278:
#line 1834 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 279:
#line 1836 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 280:
#line 1840 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 281:
#line 1842 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 282:
#line 1846 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 283:
#line 1848 "pir.y"
    { (yyval.targ) = set_param_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 284:
#line 1852 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 285:
#line 1854 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 286:
#line 1858 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 287:
#line 1860 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 288:
#line 1862 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 289:
#line 1864 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 290:
#line 1874 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 295:
#line 1884 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 296:
#line 1889 "pir.y"
    { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              (yyval.invo) = (yyvsp[(2) - (3)].invo);
                            ;}
    break;

  case 297:
#line 1900 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 298:
#line 1907 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 299:
#line 1911 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 300:
#line 1913 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 301:
#line 1917 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 302:
#line 1919 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 305:
#line 1927 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 306:
#line 1931 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 307:
#line 1935 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument(lexer, (yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 308:
#line 1941 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 309:
#line 1950 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 310:
#line 1957 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 311:
#line 1959 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 312:
#line 1964 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 313:
#line 1966 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 314:
#line 1971 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 315:
#line 1975 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 316:
#line 1977 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 317:
#line 1981 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 318:
#line 1983 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 319:
#line 1987 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 320:
#line 1992 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 321:
#line 1994 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 322:
#line 1998 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 323:
#line 2000 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 324:
#line 2007 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 325:
#line 2009 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 326:
#line 2013 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 328:
#line 2020 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cdec)); ;}
    break;

  case 331:
#line 2028 "pir.y"
    { (yyval.cdec) = (yyvsp[(2) - (2)].cdec); ;}
    break;

  case 334:
#line 2036 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cdec)); ;}
    break;

  case 335:
#line 2040 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, INT_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 336:
#line 2042 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, NUM_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 337:
#line 2044 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, STRING_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 338:
#line 2046 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, USTRING_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ustr)); ;}
    break;

  case 339:
#line 2050 "pir.y"
    { (yyval.cdec) = new_pmc_const(lexer, (yyvsp[(1) - (4)].sval), (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].cval)); ;}
    break;

  case 341:
#line 2055 "pir.y"
    { /* this alternative is necessary, otherwise the parser
                               * just stops when assigning an identifier to a pmc
                               * const, without an error message. That may be
                               * a bug in bison.
                               */
                              yypirerror(yyscanner, lexer, "unexpected identifier");
                            ;}
    break;

  case 342:
#line 2067 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 343:
#line 2068 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 344:
#line 2072 "pir.y"
    { (yyval.cval) = new_const(lexer, INT_VAL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 345:
#line 2073 "pir.y"
    { (yyval.cval) = new_const(lexer, NUM_VAL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 346:
#line 2074 "pir.y"
    { (yyval.cval) = (yyvsp[(1) - (1)].cval); ;}
    break;

  case 347:
#line 2077 "pir.y"
    { (yyval.cval) = new_const(lexer, STRING_VAL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 348:
#line 2078 "pir.y"
    { (yyval.cval) = new_const(lexer, USTRING_VAL, (yyvsp[(1) - (1)].ustr)); ;}
    break;

  case 349:
#line 2081 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 350:
#line 2082 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 351:
#line 2083 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 352:
#line 2084 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 353:
#line 2085 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 354:
#line 2086 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 355:
#line 2089 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 356:
#line 2090 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 357:
#line 2091 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 358:
#line 2092 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 359:
#line 2100 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 361:
#line 2104 "pir.y"
    { /* a symbol must have been declared; check that at this point. */
                           symbol * sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                           if (sym == NULL) {
                               undeclared_symbol(lexer, (yyvsp[(1) - (1)].sval));
                               /* make sure sym is not NULL */
                               sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), UNKNOWN_TYPE);
                           }


                           (yyval.targ) = target_from_symbol(lexer, sym);
                         ;}
    break;

  case 362:
#line 2117 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 363:
#line 2118 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 364:
#line 2119 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 365:
#line 2120 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 368:
#line 2128 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 369:
#line 2129 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 370:
#line 2130 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 371:
#line 2131 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 372:
#line 2132 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 373:
#line 2133 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 374:
#line 2134 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 375:
#line 2135 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 376:
#line 2138 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 377:
#line 2139 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 378:
#line 2140 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 379:
#line 2143 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 380:
#line 2144 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 381:
#line 2145 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 382:
#line 2146 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 383:
#line 2147 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 384:
#line 2148 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 385:
#line 2149 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 386:
#line 2150 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 387:
#line 2151 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 388:
#line 2152 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 389:
#line 2153 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 390:
#line 2154 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 391:
#line 2155 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 392:
#line 2156 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 393:
#line 2157 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 394:
#line 2158 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 395:
#line 2159 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 396:
#line 2160 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 397:
#line 2161 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 398:
#line 2162 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 399:
#line 2163 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 400:
#line 2164 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 401:
#line 2165 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 402:
#line 2171 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 403:
#line 2172 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 404:
#line 2173 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 405:
#line 2174 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 406:
#line 2175 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 407:
#line 2176 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 408:
#line 2177 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 409:
#line 2178 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 410:
#line 2179 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 411:
#line 2180 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 412:
#line 2181 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 413:
#line 2182 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 415:
#line 2203 "pir.y"
    { new_subr(lexer, Parrot_str_new(lexer->interp, "@start", 6)); ;}
    break;

  case 424:
#line 2219 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 429:
#line 2229 "pir.y"
    { set_sub_name(lexer, (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 430:
#line 2233 "pir.y"
    { new_subr(lexer, NULL); ;}
    break;

  case 431:
#line 2238 "pir.y"
    {

                                  if (is_parrot_op(lexer, (yyvsp[(1) - (3)].sval))) {
                                      check_op_args_for_symbols(lexer);
                                      /* get_opinfo(lexer); */
                                  }
                                  else /* not a parrot op */
                                      yypirerror(yyscanner, lexer, "'%s' is not a parrot op", (yyvsp[(1) - (3)].sval));

                                ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4812 "pirparser.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (yyscanner, lexer, YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yyscanner, lexer, yymsg);
	  }
	else
	  {
	    yyerror (yyscanner, lexer, YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, yyscanner, lexer);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yyscanner, lexer);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (yyscanner, lexer, YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, yyscanner, lexer);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yyscanner, lexer);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 2252 "pir.y"






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
fold_s_s(yyscan_t yyscanner, ARGIN(const char *a), pir_math_operator op, ARGIN(char const *b)) {
    lexer_state * const lexer = (lexer_state *)yypirget_extra(yyscanner);
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

=item C<static int evaluate_i_i(int a, pir_rel_operator op, int b)>

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

=item C<static int evaluate_n_i(double a, pir_rel_operator op, int b)>

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

=item C<static int evaluate_i_n(int a, pir_rel_operator op, double b)>

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
evaluate_s_s(ARGIN(const char *a), pir_rel_operator op, ARGIN(const char *b)) {
    const int result = strcmp(a, b); /* do /not/ use STREQ; we're interested in the result. */

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
evaluate_s(ARGIN(char const *s)) {
    const size_t strlen_s = strlen(s);

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
evaluate_c(ARGIN(lexer_state * const lexer), ARGIN(const constant *c)) {
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

=item C<static char * concat_strings(lexer_state *lexer, const char * a, const
char * b)>

Concatenates two strings into a new buffer. The new string is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
static char *
concat_strings(ARGMOD(lexer_state *lexer), ARGIN(const char * a),
               ARGIN(const char * b))
{
    const size_t strlen_a = strlen(a);
    const char * const newstr = (char *)pir_mem_allocate_zeroed(lexer, (strlen_a + strlen(b) + 1)
                                                          * sizeof (char));
    strcpy(newstr, a);
    strcpy(newstr + strlen_a, b);
    a = b = NULL;
    return newstr;
}


/*

=item C<static void create_if_instr(lexer_state *lexer, int invert, int hasnull,
const char *name, const char *label)>

Create an C<if> or C<unless> instruction; if C<invert> is non-zero (true), the
C<if> instruction is inverted, effectively becoming C<unless>.

If C<hasnull> is non-zero (true), the C<if> instruction becomes C<if_null>; again,
if C<invert> is non-zero, the instruction becomes C<unless_null>.

C<name> is the name of the variable that is checked during this instruction

=cut

*/
static void
create_if_instr(ARGMOD(lexer_state *lexer), int invert, int hasnull,
                ARGIN(const char *name), ARGIN(const char *label))
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

=item C<static void do_strength_reduction(lexer_state *lexer)>

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
do_strength_reduction(ARGMOD(lexer_state *lexer)) {
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

    return;
}

/*

=item C<static void check_first_arg_direction(lexer_state *lexer, char const
*opname)>

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
check_first_arg_direction(ARGMOD(lexer_state *lexer), ARGIN(char const *opname)) {
    int dir_first_arg;

    /* op_count also counts the instruction itself, so must be at least 2 */
    assert(CURRENT_INSTRUCTION(lexer)->opinfo->op_count >= 2);

    /* get the direction of the first argument */
    if (!CURRENT_INSTRUCTION(lexer)->opinfo->dirs)
        fprintf(stderr, "no opinfo->dirs!\n");
    else {
        const op_info_t * const opinfo = CURRENT_INSTRUCTION(lexer)->opinfo;

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
check_op_args_for_symbols(ARGMOD(lexer_state *lexer)) {
    struct op_info_t  * opinfo;
    unsigned short      i;
    short               opcount;
    int                 opcode;
    int                 result;
    int                 label_bitmask = 0; /* an int is at least 32 bits;
                                            * an op cannot have more than 8 operands, as defined in
                                            * include/parrot/op.h:18, so an int is good enough for
                                            * a bit mask to cover all operands.
                                            */

    /* iterate over all operands to set the type and PASM register on all target nodes, if any */
    const unsigned int num_operands = get_operand_count(lexer);

    for (i = 0; i < num_operands; i++) {
        expression * const operand = get_operand(lexer, i + 1); /* get_operand counts from 1 */

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

=item C<static void undeclared_symbol(lexer_state *lexer, char const *symbol)>

Report an error message saying that C<symbol> was not declared. Then test
whether the symbol is perhaps a PASM register identifier. The user may have
mistakenly tried to use a PASM register in PIR mode.

=cut

*/
static void
undeclared_symbol(ARGMOD(lexer_state *lexer), ARGIN(char const *symbol)) {
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


