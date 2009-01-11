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
     TK_HLL_MAP = 259,
     TK_LOADLIB = 260,
     TK_SUB = 261,
     TK_END = 262,
     TK_PARAM = 263,
     TK_LEX = 264,
     TK_LINE = 265,
     TK_FILE = 266,
     TK_LOCAL = 267,
     TK_NAMESPACE = 268,
     TK_INVOCANT = 269,
     TK_METH_CALL = 270,
     TK_GLOBALCONST = 271,
     TK_CONST = 272,
     TK_RETURN = 273,
     TK_YIELD = 274,
     TK_SET_YIELD = 275,
     TK_SET_RETURN = 276,
     TK_BEGIN_YIELD = 277,
     TK_END_YIELD = 278,
     TK_BEGIN_RETURN = 279,
     TK_END_RETURN = 280,
     TK_BEGIN_CALL = 281,
     TK_END_CALL = 282,
     TK_GET_RESULTS = 283,
     TK_CALL = 284,
     TK_SET_ARG = 285,
     TK_GET_RESULT = 286,
     TK_NCI_CALL = 287,
     TK_TAILCALL = 288,
     TK_ANNOTATE = 289,
     TK_NL = 290,
     TK_LABEL = 291,
     TK_IDENT = 292,
     TK_INT = 293,
     TK_NUM = 294,
     TK_PMC = 295,
     TK_STRING = 296,
     TK_IF = 297,
     TK_UNLESS = 298,
     TK_NULL = 299,
     TK_GOTO = 300,
     TK_STRINGC = 301,
     TK_USTRINGC = 302,
     TK_INTC = 303,
     TK_NUMC = 304,
     TK_PREG = 305,
     TK_NREG = 306,
     TK_SREG = 307,
     TK_IREG = 308,
     TK_ARROW = 309,
     TK_NE = 310,
     TK_EQ = 311,
     TK_LT = 312,
     TK_LE = 313,
     TK_GT = 314,
     TK_GE = 315,
     TK_USHIFT = 316,
     TK_RSHIFT = 317,
     TK_LSHIFT = 318,
     TK_FDIV = 319,
     TK_OR = 320,
     TK_AND = 321,
     TK_XOR = 322,
     TK_CONC = 323,
     TK_ASSIGN_USHIFT = 324,
     TK_ASSIGN_RSHIFT = 325,
     TK_ASSIGN_LSHIFT = 326,
     TK_ASSIGN_INC = 327,
     TK_ASSIGN_DEC = 328,
     TK_ASSIGN_MUL = 329,
     TK_ASSIGN_MOD = 330,
     TK_ASSIGN_POW = 331,
     TK_ASSIGN_DIV = 332,
     TK_ASSIGN_BOR = 333,
     TK_ASSIGN_BAND = 334,
     TK_ASSIGN_FDIV = 335,
     TK_ASSIGN_BNOT = 336,
     TK_ASSIGN_CONC = 337,
     TK_FLAG_INIT = 338,
     TK_FLAG_LOAD = 339,
     TK_FLAG_MAIN = 340,
     TK_FLAG_ANON = 341,
     TK_FLAG_METHOD = 342,
     TK_FLAG_OUTER = 343,
     TK_FLAG_VTABLE = 344,
     TK_FLAG_LEX = 345,
     TK_FLAG_MULTI = 346,
     TK_FLAG_POSTCOMP = 347,
     TK_FLAG_IMMEDIATE = 348,
     TK_FLAG_SUBID = 349,
     TK_FLAG_INSTANCEOF = 350,
     TK_FLAG_NSENTRY = 351,
     TK_FLAG_UNIQUE_REG = 352,
     TK_FLAG_NAMED = 353,
     TK_FLAG_SLURPY = 354,
     TK_FLAG_FLAT = 355,
     TK_FLAG_OPTIONAL = 356,
     TK_FLAG_OPT_FLAG = 357,
     TK_FLAG_INVOCANT = 358,
     TK_FLAG_LOOKAHEAD = 359,
     TK_MACRO = 360,
     TK_ENDM = 361,
     TK_MACRO_LOCAL = 362,
     TK_MACRO_LABEL = 363,
     TK_MACRO_CONST = 364,
     TK_MACRO_LABEL_ID = 365,
     TK_MACRO_LOCAL_ID = 366,
     TK_MACRO_IDENT = 367,
     TK_MACRO_ARG_IDENT = 368,
     TK_MACRO_ARG_OTHER = 369,
     TK_MACRO_CONST_VAL = 370,
     TK_PASM_MARKER_START = 371,
     TK_PIR_MARKER_START = 372,
     TK_PCC_SUB = 373,
     TK_PARROT_OP = 374
   };
#endif
/* Tokens.  */
#define TK_HLL 258
#define TK_HLL_MAP 259
#define TK_LOADLIB 260
#define TK_SUB 261
#define TK_END 262
#define TK_PARAM 263
#define TK_LEX 264
#define TK_LINE 265
#define TK_FILE 266
#define TK_LOCAL 267
#define TK_NAMESPACE 268
#define TK_INVOCANT 269
#define TK_METH_CALL 270
#define TK_GLOBALCONST 271
#define TK_CONST 272
#define TK_RETURN 273
#define TK_YIELD 274
#define TK_SET_YIELD 275
#define TK_SET_RETURN 276
#define TK_BEGIN_YIELD 277
#define TK_END_YIELD 278
#define TK_BEGIN_RETURN 279
#define TK_END_RETURN 280
#define TK_BEGIN_CALL 281
#define TK_END_CALL 282
#define TK_GET_RESULTS 283
#define TK_CALL 284
#define TK_SET_ARG 285
#define TK_GET_RESULT 286
#define TK_NCI_CALL 287
#define TK_TAILCALL 288
#define TK_ANNOTATE 289
#define TK_NL 290
#define TK_LABEL 291
#define TK_IDENT 292
#define TK_INT 293
#define TK_NUM 294
#define TK_PMC 295
#define TK_STRING 296
#define TK_IF 297
#define TK_UNLESS 298
#define TK_NULL 299
#define TK_GOTO 300
#define TK_STRINGC 301
#define TK_USTRINGC 302
#define TK_INTC 303
#define TK_NUMC 304
#define TK_PREG 305
#define TK_NREG 306
#define TK_SREG 307
#define TK_IREG 308
#define TK_ARROW 309
#define TK_NE 310
#define TK_EQ 311
#define TK_LT 312
#define TK_LE 313
#define TK_GT 314
#define TK_GE 315
#define TK_USHIFT 316
#define TK_RSHIFT 317
#define TK_LSHIFT 318
#define TK_FDIV 319
#define TK_OR 320
#define TK_AND 321
#define TK_XOR 322
#define TK_CONC 323
#define TK_ASSIGN_USHIFT 324
#define TK_ASSIGN_RSHIFT 325
#define TK_ASSIGN_LSHIFT 326
#define TK_ASSIGN_INC 327
#define TK_ASSIGN_DEC 328
#define TK_ASSIGN_MUL 329
#define TK_ASSIGN_MOD 330
#define TK_ASSIGN_POW 331
#define TK_ASSIGN_DIV 332
#define TK_ASSIGN_BOR 333
#define TK_ASSIGN_BAND 334
#define TK_ASSIGN_FDIV 335
#define TK_ASSIGN_BNOT 336
#define TK_ASSIGN_CONC 337
#define TK_FLAG_INIT 338
#define TK_FLAG_LOAD 339
#define TK_FLAG_MAIN 340
#define TK_FLAG_ANON 341
#define TK_FLAG_METHOD 342
#define TK_FLAG_OUTER 343
#define TK_FLAG_VTABLE 344
#define TK_FLAG_LEX 345
#define TK_FLAG_MULTI 346
#define TK_FLAG_POSTCOMP 347
#define TK_FLAG_IMMEDIATE 348
#define TK_FLAG_SUBID 349
#define TK_FLAG_INSTANCEOF 350
#define TK_FLAG_NSENTRY 351
#define TK_FLAG_UNIQUE_REG 352
#define TK_FLAG_NAMED 353
#define TK_FLAG_SLURPY 354
#define TK_FLAG_FLAT 355
#define TK_FLAG_OPTIONAL 356
#define TK_FLAG_OPT_FLAG 357
#define TK_FLAG_INVOCANT 358
#define TK_FLAG_LOOKAHEAD 359
#define TK_MACRO 360
#define TK_ENDM 361
#define TK_MACRO_LOCAL 362
#define TK_MACRO_LABEL 363
#define TK_MACRO_CONST 364
#define TK_MACRO_LABEL_ID 365
#define TK_MACRO_LOCAL_ID 366
#define TK_MACRO_IDENT 367
#define TK_MACRO_ARG_IDENT 368
#define TK_MACRO_ARG_OTHER 369
#define TK_MACRO_CONST_VAL 370
#define TK_PASM_MARKER_START 371
#define TK_PIR_MARKER_START 372
#define TK_PCC_SUB 373
#define TK_PARROT_OP 374




/* Copy the first part of user declarations.  */
#line 1 "pir.y"


/*
 * $Id$
 * Copyright (C) 2007-2009, The Perl Foundation.
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
/* Line 187 of yacc.c.  */
#line 593 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 606 "pirparser.c"

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
# if YYENABLE_NLS
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
#define YYFINAL  10
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1099

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  140
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  172
/* YYNRULES -- Number of rules.  */
#define YYNRULES  432
/* YYNRULES -- Number of states.  */
#define YYNSTATES  674

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   375

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   131,     2,     2,     2,   136,   138,     2,
     120,   121,   135,   133,   122,   130,   129,   134,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   126,
       2,   123,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   124,     2,   125,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   127,   137,   128,   132,     2,     2,     2,
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
     115,   116,   117,   118,   119,   139
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    13,    14,    16,    18,    22,
      24,    26,    28,    30,    32,    34,    36,    38,    40,    42,
      44,    48,    56,    59,    60,    62,    64,    68,    70,    71,
      73,    75,    78,    81,    83,    85,    88,    92,    95,    98,
     101,   104,   109,   114,   115,   117,   119,   123,   125,   132,
     134,   137,   139,   141,   142,   145,   147,   149,   151,   153,
     155,   157,   159,   162,   167,   170,   173,   176,   179,   182,
     186,   187,   189,   191,   195,   197,   199,   201,   203,   204,
     207,   212,   215,   216,   219,   221,   223,   225,   227,   231,
     236,   238,   239,   242,   245,   247,   249,   251,   253,   255,
     257,   259,   261,   263,   265,   267,   269,   271,   273,   275,
     277,   279,   285,   287,   291,   292,   296,   297,   299,   301,
     305,   307,   309,   312,   314,   318,   319,   322,   324,   326,
     328,   331,   333,   336,   339,   343,   347,   350,   353,   355,
     357,   359,   361,   362,   364,   366,   370,   374,   376,   378,
     380,   382,   384,   386,   389,   393,   395,   399,   406,   411,
     418,   421,   423,   425,   429,   433,   437,   441,   445,   449,
     454,   459,   464,   468,   472,   476,   480,   484,   488,   492,
     497,   503,   508,   513,   517,   521,   525,   529,   533,   537,
     541,   545,   548,   554,   560,   566,   572,   578,   584,   590,
     596,   602,   607,   613,   618,   623,   628,   633,   638,   643,
     648,   653,   658,   663,   668,   673,   678,   682,   686,   690,
     694,   698,   702,   706,   710,   714,   718,   722,   726,   728,
     730,   732,   734,   736,   738,   742,   747,   749,   753,   756,
     757,   759,   765,   767,   769,   771,   780,   781,   783,   785,
     788,   792,   796,   799,   805,   806,   809,   810,   812,   814,
     817,   821,   823,   826,   830,   834,   836,   838,   840,   845,
     848,   850,   852,   854,   856,   858,   860,   862,   864,   868,
     869,   871,   873,   877,   880,   884,   885,   888,   890,   892,
     894,   897,   899,   901,   903,   905,   907,   911,   915,   919,
     923,   924,   926,   928,   932,   934,   936,   940,   943,   945,
     951,   957,   958,   960,   962,   965,   969,   970,   972,   974,
     977,   981,   982,   985,   987,   990,   991,   993,   997,  1000,
    1003,  1005,  1007,  1010,  1012,  1014,  1017,  1022,  1027,  1032,
    1037,  1042,  1044,  1046,  1048,  1050,  1052,  1054,  1056,  1058,
    1060,  1062,  1064,  1066,  1068,  1070,  1072,  1074,  1076,  1078,
    1080,  1082,  1084,  1086,  1088,  1090,  1092,  1094,  1096,  1098,
    1100,  1102,  1104,  1106,  1108,  1110,  1112,  1114,  1116,  1118,
    1120,  1122,  1124,  1126,  1128,  1130,  1132,  1134,  1136,  1138,
    1140,  1142,  1144,  1146,  1148,  1150,  1152,  1154,  1156,  1158,
    1160,  1162,  1164,  1166,  1168,  1170,  1172,  1174,  1176,  1178,
    1180,  1182,  1184,  1186,  1188,  1190,  1193,  1195,  1197,  1200,
    1202,  1205,  1207,  1210,  1213,  1215,  1218,  1221,  1223,  1225,
    1227,  1231,  1233
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     141,     0,    -1,   117,   142,    -1,   116,   303,    -1,   143,
     144,   143,    -1,    -1,    35,    -1,   145,    -1,   144,    35,
     145,    -1,   167,    -1,   282,    -1,   163,    -1,   161,    -1,
     162,    -1,   159,    -1,   160,    -1,   146,    -1,   201,    -1,
     147,    -1,   148,    -1,   109,    37,   115,    -1,   149,   120,
     150,   121,    35,   153,   106,    -1,   105,   298,    -1,    -1,
     151,    -1,   152,    -1,   151,   122,   152,    -1,   298,    -1,
      -1,   154,    -1,   155,    -1,   154,   155,    -1,   156,    35,
      -1,   157,    -1,   158,    -1,   108,   110,    -1,   107,   294,
     111,    -1,     5,    46,    -1,    10,    48,    -1,    11,    46,
      -1,     3,    46,    -1,     4,    46,   123,    46,    -1,    13,
     124,   164,   125,    -1,    -1,   165,    -1,   166,    -1,   165,
     126,   166,    -1,    46,    -1,   169,   171,    35,   177,   186,
     168,    -1,     7,    -1,     6,   170,    -1,   298,    -1,    46,
      -1,    -1,   171,   172,    -1,    86,    -1,    83,    -1,    84,
      -1,    85,    -1,    90,    -1,    92,    -1,    93,    -1,    91,
     173,    -1,    88,   120,   170,   121,    -1,    87,   279,    -1,
      89,   279,    -1,    94,   280,    -1,    95,   280,    -1,    96,
     280,    -1,   120,   174,   121,    -1,    -1,   175,    -1,   176,
      -1,   175,   122,   176,    -1,   298,    -1,    46,    -1,   214,
      -1,   178,    -1,    -1,   178,   179,    -1,     8,   180,   181,
      35,    -1,   294,   298,    -1,    -1,   181,   182,    -1,   257,
      -1,   184,    -1,   183,    -1,   185,    -1,   104,   120,   121,
      -1,   103,   120,   176,   121,    -1,    97,    -1,    -1,   186,
     187,    -1,    36,   188,    -1,   188,    -1,   204,    -1,   221,
      -1,   227,    -1,   228,    -1,   232,    -1,   281,    -1,   258,
      -1,   233,    -1,   217,    -1,   203,    -1,   202,    -1,   199,
      -1,   200,    -1,   190,    -1,   189,    -1,   201,    -1,    34,
      46,   122,   291,    35,    -1,   191,    -1,   112,   192,    35,
      -1,    -1,   120,   193,   121,    -1,    -1,   194,    -1,   195,
      -1,   194,   122,   195,    -1,   113,    -1,   114,    -1,   112,
     192,    -1,   196,    -1,   127,   197,   128,    -1,    -1,   197,
     198,    -1,    35,    -1,   114,    -1,   113,    -1,   112,   192,
      -1,    35,    -1,   160,    35,    -1,     1,    35,    -1,    44,
     295,    35,    -1,    28,   252,    35,    -1,   205,    35,    -1,
     206,   207,    -1,   216,    -1,    37,    -1,   208,    -1,   210,
      -1,    -1,   209,    -1,   211,    -1,   209,   122,   211,    -1,
     214,   123,   290,    -1,   212,    -1,   214,    -1,   291,    -1,
     298,    -1,   297,    -1,   213,    -1,   251,   214,    -1,   124,
     215,   125,    -1,   290,    -1,   215,   126,   290,    -1,   295,
     123,   206,   212,   122,   209,    -1,   295,   123,   206,   212,
      -1,   295,   123,   206,   214,   122,   209,    -1,   219,    35,
      -1,    37,    -1,   299,    -1,   295,   123,    48,    -1,   295,
     123,    49,    -1,   295,   123,   292,    -1,   295,   123,   297,
      -1,   295,   123,   218,    -1,   295,   123,   220,    -1,   295,
     123,   206,   214,    -1,   295,   123,   299,   214,    -1,   295,
     123,    50,   214,    -1,   295,   302,   290,    -1,   295,    72,
      48,    -1,   295,    72,    49,    -1,   295,    73,    48,    -1,
     295,    73,    49,    -1,   295,    72,   295,    -1,   295,    73,
     295,    -1,   295,   123,   300,   290,    -1,   295,   123,   295,
     301,   290,    -1,   299,   214,   123,   290,    -1,    50,   214,
     123,   290,    -1,    48,   301,   295,    -1,    49,   301,   295,
      -1,    46,   301,   295,    -1,    46,   301,    46,    -1,    48,
     301,    48,    -1,    49,   301,    49,    -1,    48,   301,    49,
      -1,    49,   301,    48,    -1,   222,    35,    -1,   225,    44,
      37,    45,   298,    -1,   225,    44,    38,    45,   298,    -1,
     225,    44,    39,    45,   298,    -1,   225,    44,    40,    45,
     298,    -1,   225,    44,    41,    45,   298,    -1,   225,    44,
      42,    45,   298,    -1,   225,    44,    43,    45,   298,    -1,
     225,    44,    45,    45,   298,    -1,   225,    44,    44,    45,
     298,    -1,   225,   291,   226,   298,    -1,   225,    44,    50,
     226,   298,    -1,   225,    37,   226,   298,    -1,   225,   297,
     226,   298,    -1,   225,    38,   226,   298,    -1,   225,    39,
     226,   298,    -1,   225,    40,   226,   298,    -1,   225,    41,
     226,   298,    -1,   225,    42,   226,   298,    -1,   225,    43,
     226,   298,    -1,   225,    45,    45,   298,    -1,   225,    45,
     122,   298,    -1,   225,    44,    45,   298,    -1,   225,    44,
     122,   298,    -1,   225,   223,    45,   298,    -1,   295,   293,
     290,    -1,    48,   293,   295,    -1,    49,   293,   295,    -1,
      46,   293,   295,    -1,    48,   293,    48,    -1,    48,   293,
      49,    -1,    49,   293,    48,    -1,    49,   293,    49,    -1,
      46,   293,    46,    -1,    46,   293,   224,    -1,    48,   293,
      46,    -1,    49,   293,    46,    -1,    48,    -1,    49,    -1,
      42,    -1,    43,    -1,    45,    -1,   122,    -1,    45,   298,
      35,    -1,    12,   294,   229,    35,    -1,   230,    -1,   229,
     122,   230,    -1,   298,   231,    -1,    -1,    97,    -1,     9,
      46,   122,   251,    35,    -1,   234,    -1,   235,    -1,   244,
      -1,    26,    35,   236,   239,    35,   241,    27,    35,    -1,
      -1,   237,    -1,   238,    -1,   237,   238,    -1,    30,   267,
      35,    -1,    29,   249,   240,    -1,    32,   251,    -1,    14,
     251,    35,    15,   250,    -1,    -1,   122,   251,    -1,    -1,
     242,    -1,   243,    -1,   242,   243,    -1,    31,   255,    35,
      -1,   228,    -1,   245,    35,    -1,   252,   123,   246,    -1,
     295,   123,   246,    -1,   246,    -1,   248,    -1,   247,    -1,
     251,   129,   250,   262,    -1,   249,   262,    -1,   251,    -1,
      46,    -1,   298,    -1,    50,    -1,    52,    -1,    46,    -1,
     298,    -1,    50,    -1,   120,   253,   121,    -1,    -1,   254,
      -1,   255,    -1,   254,   122,   255,    -1,   295,   256,    -1,
      46,    54,   295,    -1,    -1,   256,   257,    -1,   101,    -1,
     102,    -1,    99,    -1,    98,   279,    -1,   259,    -1,   260,
      -1,   269,    -1,   261,    -1,   270,    -1,    18,   262,    35,
      -1,    33,   246,    35,    -1,    19,   262,    35,    -1,   120,
     263,   121,    -1,    -1,   264,    -1,   265,    -1,   264,   122,
     265,    -1,   267,    -1,   266,    -1,    46,    54,   268,    -1,
     268,   277,    -1,   290,    -1,    24,    35,   274,    25,    35,
      -1,    22,    35,   271,    23,    35,    -1,    -1,   272,    -1,
     273,    -1,   272,   273,    -1,    20,   267,    35,    -1,    -1,
     275,    -1,   276,    -1,   275,   276,    -1,    21,   267,    35,
      -1,    -1,   277,   278,    -1,   100,    -1,    98,   279,    -1,
      -1,   280,    -1,   120,    46,   121,    -1,   283,    35,    -1,
      17,   287,    -1,   284,    -1,   286,    -1,    17,   285,    -1,
     287,    -1,   288,    -1,    16,   287,    -1,    38,   298,   123,
      48,    -1,    39,   298,   123,    49,    -1,    41,   298,   123,
      46,    -1,    41,   298,   123,    47,    -1,    46,   298,   123,
     289,    -1,   291,    -1,   298,    -1,   295,    -1,   291,    -1,
      48,    -1,    49,    -1,   292,    -1,    46,    -1,    47,    -1,
      55,    -1,    56,    -1,    57,    -1,    58,    -1,    60,    -1,
      59,    -1,    38,    -1,    39,    -1,    40,    -1,    41,    -1,
     296,    -1,   297,    -1,   298,    -1,    50,    -1,    51,    -1,
      53,    -1,    52,    -1,    37,    -1,   299,    -1,    42,    -1,
      43,    -1,    45,    -1,    38,    -1,    39,    -1,    41,    -1,
      40,    -1,    44,    -1,   130,    -1,   131,    -1,   132,    -1,
     133,    -1,   130,    -1,   134,    -1,   135,    -1,   136,    -1,
     137,    -1,   138,    -1,   132,    -1,   139,    -1,    68,    -1,
      61,    -1,    62,    -1,    63,    -1,    65,    -1,    66,    -1,
      64,    -1,    67,    -1,    56,    -1,    58,    -1,    57,    -1,
      60,    -1,    59,    -1,    55,    -1,    74,    -1,    75,    -1,
      76,    -1,    77,    -1,    80,    -1,    78,    -1,    79,    -1,
      81,    -1,    82,    -1,    70,    -1,    71,    -1,    69,    -1,
     304,   305,    -1,   143,    -1,   306,    -1,   305,   306,    -1,
     307,    -1,   163,    35,    -1,   232,    -1,   160,    35,    -1,
     146,    35,    -1,   191,    -1,    36,   308,    -1,   309,   308,
      -1,   311,    -1,   199,    -1,   311,    -1,   310,   171,    36,
      -1,   118,    -1,   206,   208,    35,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   563,   563,   564,   569,   575,   576,   579,   580,   583,
     584,   585,   586,   587,   588,   589,   590,   591,   598,   599,
     602,   606,   612,   619,   620,   623,   624,   627,   631,   632,
     635,   636,   639,   642,   643,   646,   650,   661,   665,   667,
     673,   677,   681,   686,   687,   691,   693,   697,   701,   707,
     711,   715,   716,   719,   720,   723,   725,   727,   729,   731,
     733,   735,   737,   739,   741,   743,   745,   747,   749,   753,
     758,   762,   766,   775,   786,   788,   790,   794,   803,   804,
     817,   821,   826,   827,   831,   832,   833,   834,   837,   841,
     848,   854,   855,   865,   867,   870,   871,   872,   873,   874,
     875,   876,   877,   878,   879,   880,   881,   882,   883,   884,
     885,   888,   895,   898,   903,   904,   909,   910,   913,   915,
     923,   931,   932,   934,   937,   943,   944,   953,   954,   955,
     956,   964,   968,   972,   981,   988,   995,   998,   999,  1002,
    1011,  1018,  1021,  1022,  1025,  1026,  1029,  1065,  1067,  1071,
    1073,  1078,  1080,  1084,  1107,  1111,  1113,  1122,  1133,  1145,
    1155,  1158,  1159,  1162,  1171,  1180,  1185,  1190,  1211,  1216,
    1257,  1275,  1282,  1287,  1298,  1309,  1320,  1331,  1336,  1341,
    1346,  1356,  1375,  1409,  1411,  1413,  1415,  1417,  1419,  1421,
    1423,  1428,  1437,  1439,  1441,  1443,  1445,  1447,  1449,  1451,
    1453,  1455,  1467,  1472,  1474,  1476,  1478,  1480,  1482,  1484,
    1486,  1488,  1490,  1492,  1494,  1496,  1527,  1553,  1561,  1570,
    1579,  1581,  1583,  1585,  1587,  1591,  1596,  1598,  1603,  1604,
    1607,  1608,  1611,  1612,  1615,  1623,  1627,  1629,  1633,  1637,
    1638,  1641,  1656,  1660,  1661,  1664,  1676,  1677,  1681,  1683,
    1687,  1691,  1693,  1695,  1701,  1702,  1707,  1708,  1712,  1714,
    1723,  1725,  1729,  1733,  1735,  1737,  1741,  1742,  1745,  1765,
    1772,  1774,  1784,  1801,  1803,  1805,  1809,  1818,  1823,  1830,
    1831,  1835,  1837,  1841,  1843,  1848,  1849,  1853,  1855,  1857,
    1859,  1869,  1873,  1874,  1875,  1876,  1879,  1884,  1895,  1902,
    1907,  1908,  1912,  1914,  1918,  1919,  1922,  1926,  1930,  1934,
    1943,  1953,  1954,  1959,  1961,  1966,  1971,  1972,  1976,  1978,
    1982,  1988,  1989,  1993,  1995,  2003,  2004,  2008,  2012,  2015,
    2019,  2020,  2023,  2027,  2028,  2031,  2035,  2037,  2039,  2041,
    2045,  2049,  2050,  2063,  2064,  2068,  2069,  2070,  2073,  2074,
    2077,  2078,  2079,  2080,  2081,  2082,  2085,  2086,  2087,  2088,
    2096,  2099,  2100,  2113,  2114,  2115,  2116,  2120,  2121,  2124,
    2125,  2126,  2127,  2128,  2129,  2130,  2131,  2134,  2135,  2136,
    2139,  2140,  2141,  2142,  2143,  2144,  2145,  2146,  2147,  2148,
    2149,  2150,  2151,  2152,  2153,  2154,  2155,  2156,  2157,  2158,
    2159,  2160,  2161,  2167,  2168,  2169,  2170,  2171,  2172,  2173,
    2174,  2175,  2176,  2177,  2178,  2190,  2198,  2202,  2203,  2206,
    2207,  2208,  2209,  2210,  2211,  2214,  2216,  2217,  2220,  2221,
    2224,  2228,  2233
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\".HLL\"", "\".HLL_map\"",
  "\".loadlib\"", "\".sub\"", "\".end\"", "\".param\"", "\".lex\"",
  "\".line\"", "\".file\"", "\".local\"", "\".namespace\"",
  "\".invocant\"", "\".meth_call\"", "\".globalconst\"", "\".const\"",
  "\".return\"", "\".yield\"", "\".set_yield\"", "\".set_return\"",
  "\".begin_yield\"", "\".end_yield\"", "\".begin_return\"",
  "\".end_return\"", "\".begin_call\"", "\".end_call\"",
  "\".get_results\"", "\".call\"", "\".set_arg\"", "\".get_result\"",
  "\".nci_call\"", "\".tailcall\"", "\".annotate\"", "\"\\n\"",
  "\"label\"", "\"identifier\"", "\"int\"", "\"num\"", "\"pmc\"",
  "\"string\"", "\"if\"", "\"unless\"", "\"null\"", "\"goto\"",
  "\"string constant\"", "\"unicode string\"", "\"integer constant\"",
  "\"number constant\"", "\"PMC register\"", "\"number register\"",
  "\"string register\"", "\"integer register\"", "\"=>\"", "\"!=\"",
  "\"==\"", "\"<\"", "\"<=\"", "\">\"", "\">=\"", "\">>>\"", "\">>\"",
  "\"<<\"", "\"//\"", "\"||\"", "\"&&\"", "\"~~\"", "\".\"", "\">>>=\"",
  "\">>=\"", "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"",
  "\"/=\"", "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"", "\".=\"", "\":init\"",
  "\":load\"", "\":main\"", "\":anon\"", "\":method\"", "\":outer\"",
  "\":vtable\"", "\":lex\"", "\":multi\"", "\":postcomp\"",
  "\":immediate\"", "\":subid\"", "\":instanceof\"", "\":nsentry\"",
  "\":unique_reg\"", "\":named\"", "\":slurpy\"", "\":flat\"",
  "\":optional\"", "\":opt_flag\"", "\":invocant\"", "\":lookahead\"",
  "\".macro\"", "\".endm\"", "\".macro_local\"", "\".macro_label\"",
  "\".macro_const\"", "\"macro-label\"", "\"macro-local\"",
  "\"macro-identifier\"", "\"macro-id-argument\"", "\"macro-argument\"",
  "\"macro-constant\"", "\"<pasm-input>\"", "\"<pir-input>\"",
  "\".pcc_sub\"", "\"parrot-op\"", "'('", "')'", "','", "'='", "'['",
  "']'", "';'", "'{'", "'}'", "'.'", "'-'", "'!'", "'~'", "'+'", "'/'",
  "'*'", "'%'", "'|'", "'&'", "\"**\"", "$accept", "TOP", "pir_contents",
  "opt_nl", "pir_chunks", "pir_chunk", "macro_definition", "macro_const",
  "macro", "macro_header", "macro_parameters", "macro_params",
  "macro_param", "macro_body", "macro_statements", "macro_statement",
  "macro_instr", "macro_label_decl", "macro_local_decl", "loadlib",
  "location_directive", "hll_specifier", "hll_mapping", "namespace_decl",
  "opt_namespace", "namespace", "namespace_slice", "sub_def", "sub_end",
  "sub_head", "sub_id", "sub_flags", "sub_flag", "multi_type_list",
  "opt_multi_types", "multi_types", "multi_type", "parameter_list",
  "parameters", "parameter", "param", "param_flags", "param_flag",
  "lookahead_flag", "invocant_flag", "unique_reg_flag", "instructions",
  "instruction", "statement", "annotation", "expansion_stat",
  "macro_expansion", "opt_macro_args", "macro_args", "macro_arg_list",
  "macro_arg", "braced_arg", "braced_contents", "braced_item",
  "empty_stat", "location_stat", "error_stat", "null_stat",
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
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
      40,    41,    44,    61,    91,    93,    59,   123,   125,    46,
      45,    33,   126,    43,    47,    42,    37,   124,    38,   375
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   140,   141,   141,   142,   143,   143,   144,   144,   145,
     145,   145,   145,   145,   145,   145,   145,   145,   146,   146,
     147,   148,   149,   150,   150,   151,   151,   152,   153,   153,
     154,   154,   155,   156,   156,   157,   158,   159,   160,   160,
     161,   162,   163,   164,   164,   165,   165,   166,   167,   168,
     169,   170,   170,   171,   171,   172,   172,   172,   172,   172,
     172,   172,   172,   172,   172,   172,   172,   172,   172,   173,
     174,   174,   175,   175,   176,   176,   176,   177,   178,   178,
     179,   180,   181,   181,   182,   182,   182,   182,   183,   184,
     185,   186,   186,   187,   187,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   189,   190,   191,   192,   192,   193,   193,   194,   194,
     195,   195,   195,   195,   196,   197,   197,   198,   198,   198,
     198,   199,   200,   201,   202,   203,   204,   205,   205,   206,
     207,   207,   208,   208,   209,   209,   210,   211,   211,   212,
     212,   212,   212,   213,   214,   215,   215,   216,   216,   216,
     217,   218,   218,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   220,   220,   220,   220,   220,   220,   220,
     220,   221,   222,   222,   222,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   223,   223,   223,   223,
     223,   223,   223,   223,   223,   223,   223,   223,   224,   224,
     225,   225,   226,   226,   227,   228,   229,   229,   230,   231,
     231,   232,   233,   234,   234,   235,   236,   236,   237,   237,
     238,   239,   239,   239,   240,   240,   241,   241,   242,   242,
     243,   243,   244,   245,   245,   245,   246,   246,   247,   248,
     249,   249,   250,   250,   250,   250,   251,   251,   252,   253,
     253,   254,   254,   255,   255,   256,   256,   257,   257,   257,
     257,   258,   259,   259,   259,   259,   260,   260,   261,   262,
     263,   263,   264,   264,   265,   265,   266,   267,   268,   269,
     270,   271,   271,   272,   272,   273,   274,   274,   275,   275,
     276,   277,   277,   278,   278,   279,   279,   280,   281,   282,
     283,   283,   284,   285,   285,   286,   287,   287,   287,   287,
     288,   289,   289,   290,   290,   291,   291,   291,   292,   292,
     293,   293,   293,   293,   293,   293,   294,   294,   294,   294,
     295,   296,   296,   297,   297,   297,   297,   298,   298,   299,
     299,   299,   299,   299,   299,   299,   299,   300,   300,   300,
     301,   301,   301,   301,   301,   301,   301,   301,   301,   301,
     301,   301,   301,   301,   301,   301,   301,   301,   301,   301,
     301,   301,   301,   302,   302,   302,   302,   302,   302,   302,
     302,   302,   302,   302,   302,   303,   304,   305,   305,   306,
     306,   306,   306,   306,   306,   307,   307,   307,   308,   308,
     309,   310,   311
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     3,     0,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     7,     2,     0,     1,     1,     3,     1,     0,     1,
       1,     2,     2,     1,     1,     2,     3,     2,     2,     2,
       2,     4,     4,     0,     1,     1,     3,     1,     6,     1,
       2,     1,     1,     0,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     4,     2,     2,     2,     2,     2,     3,
       0,     1,     1,     3,     1,     1,     1,     1,     0,     2,
       4,     2,     0,     2,     1,     1,     1,     1,     3,     4,
       1,     0,     2,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     5,     1,     3,     0,     3,     0,     1,     1,     3,
       1,     1,     2,     1,     3,     0,     2,     1,     1,     1,
       2,     1,     2,     2,     3,     3,     2,     2,     1,     1,
       1,     1,     0,     1,     1,     3,     3,     1,     1,     1,
       1,     1,     1,     2,     3,     1,     3,     6,     4,     6,
       2,     1,     1,     3,     3,     3,     3,     3,     3,     4,
       4,     4,     3,     3,     3,     3,     3,     3,     3,     4,
       5,     4,     4,     3,     3,     3,     3,     3,     3,     3,
       3,     2,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     4,     5,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     1,     1,
       1,     1,     1,     1,     3,     4,     1,     3,     2,     0,
       1,     5,     1,     1,     1,     8,     0,     1,     1,     2,
       3,     3,     2,     5,     0,     2,     0,     1,     1,     2,
       3,     1,     2,     3,     3,     1,     1,     1,     4,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     0,
       1,     1,     3,     2,     3,     0,     2,     1,     1,     1,
       2,     1,     1,     1,     1,     1,     3,     3,     3,     3,
       0,     1,     1,     3,     1,     1,     3,     2,     1,     5,
       5,     0,     1,     1,     2,     3,     0,     1,     1,     2,
       3,     0,     2,     1,     2,     0,     1,     3,     2,     2,
       1,     1,     2,     1,     1,     2,     4,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     2,     1,     1,     2,     1,
       2,     1,     2,     2,     1,     2,     2,     1,     1,     1,
       3,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     5,     5,     0,     6,   416,     3,     0,     2,     0,
       1,     0,     0,     0,     0,     0,   139,     0,     0,   114,
     431,     0,    18,    19,     0,     0,     0,   424,   142,   421,
     415,   417,   419,     0,    53,   427,     0,     0,     0,     0,
       0,     0,     5,     7,    16,    14,    15,    12,    13,    11,
       9,    53,    17,    10,     0,    38,    39,    43,   131,   428,
     425,   429,   367,   372,   373,   375,   374,   369,   370,   376,
     371,    22,   368,     0,   116,     0,   423,    23,   422,   420,
     348,   349,   345,   346,   363,   364,   366,   365,     0,     0,
     143,   144,   147,   152,   148,     0,   149,   347,   151,   150,
     418,   426,     0,   133,    40,     0,    37,    52,    50,    51,
       0,     0,     0,   329,     0,     4,     0,     0,    47,     0,
      44,    45,    20,   114,   120,   121,   125,     0,   117,   118,
     123,   113,     0,    24,    25,    27,   363,     0,   155,   344,
     343,   360,   361,   362,   432,     0,   153,   430,    56,    57,
      58,    55,   325,     0,   325,    59,     0,    60,    61,     0,
       0,     0,    54,     0,     0,     0,     0,     8,    78,   277,
       0,   276,    42,     0,   122,     0,   115,     0,     0,     0,
     154,     0,   145,     0,    64,   326,     0,    65,    70,    62,
      66,    67,    68,    41,     0,     0,     0,    91,    77,   241,
      46,   127,   114,   129,   128,   124,   126,   119,    28,    26,
     156,     0,     0,    75,     0,    71,    72,    76,    74,   336,
     337,   338,   339,     0,     0,    79,   130,     0,     0,     0,
      29,    30,     0,    33,    34,   327,    63,    69,     0,    49,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   139,   369,   370,   376,   371,   271,   363,   279,
       0,    48,    92,    94,   109,   108,   112,   106,   107,   110,
     105,   104,    95,     0,   142,   138,   103,     0,    96,     0,
       0,    97,    98,    99,   102,   242,   243,   244,     0,   265,
     267,   266,     0,   270,     0,   101,   291,   292,   294,   293,
     295,   100,     0,   330,   331,     0,   362,   368,   356,   357,
     358,   359,    82,     0,     0,    35,    21,    31,    32,    73,
       0,   335,     0,   332,   333,   334,   300,     0,     0,   311,
     316,   246,     0,     0,     0,    93,     0,     0,     0,     0,
       0,   280,   281,   285,   132,   136,   137,   140,   141,   148,
     160,   191,   367,   372,   373,   375,   374,   369,   370,   376,
     371,   348,   345,   346,     0,     0,     0,   361,   262,   269,
       0,     0,   328,   414,   412,   413,     0,     0,   403,   404,
     405,   406,   408,   409,   407,   410,   411,     0,     0,     0,
       0,    81,    36,     0,   236,   239,     0,   348,     0,   301,
     302,   305,   304,   321,   308,   296,   298,     0,     0,   312,
     313,     0,     0,   317,   318,     0,     0,   247,   248,   135,
     297,     0,   134,   234,     0,     0,   278,     0,   283,     0,
     232,   233,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   350,   351,   352,   353,   355,   354,     0,     0,
       0,     0,     0,     0,     0,   275,   273,   274,     0,   272,
     263,   173,   174,   177,   175,   176,   178,   367,   271,   163,
     164,   363,   377,   378,   379,     0,   167,   168,   264,   165,
       0,   361,   368,     0,   172,     0,    80,    90,   325,   289,
     287,   288,     0,     0,    83,    86,    85,    87,    84,   235,
       0,   240,   238,     0,     0,   299,     0,   307,     0,     0,
     314,     0,     0,   319,     0,     0,     0,     0,     0,   249,
       0,   182,   284,   282,   286,   146,   203,   205,   206,   207,
     208,   209,   210,     0,     0,     0,     0,     0,     0,     0,
       0,   371,   213,     0,   214,   211,   212,   224,   228,   229,
     225,   219,   226,   220,   221,   217,   227,   222,   223,   218,
     215,   201,   216,   204,   268,   402,   397,   399,   398,   401,
     400,   390,   391,   392,   395,   393,   394,   396,   389,   381,
     387,   380,   382,   383,   384,   385,   386,   388,     0,     0,
       0,   171,   158,   169,     0,   170,   179,   181,   290,     0,
       0,   237,   340,   341,   342,   306,   303,   325,   323,   322,
     315,   310,   320,   309,   250,     0,   254,   270,   252,   256,
     111,   192,   193,   194,   195,   196,   197,   198,   200,   199,
     202,   186,   185,   187,   189,   183,   190,   188,   184,     0,
       0,   180,     0,    88,   324,     0,     0,   251,     0,   261,
       0,   257,   258,   157,   159,    89,     0,   255,     0,     0,
     259,   253,   260,   245
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     8,     5,    42,    43,    21,    22,    23,    24,
     132,   133,   134,   229,   230,   231,   232,   233,   234,    45,
      25,    47,    48,    26,   119,   120,   121,    50,   261,    51,
     108,   102,   162,   189,   214,   215,   216,   197,   198,   225,
     312,   390,   504,   505,   506,   507,   223,   262,   263,   264,
     265,    27,    75,   127,   128,   129,   130,   175,   206,    59,
     268,    52,   270,   271,   272,   273,    28,   346,    89,    90,
     348,    91,    92,    93,    94,   137,   275,   276,   486,   277,
     487,   278,   279,   364,   560,   280,   432,   281,   282,   393,
     394,   512,    29,   284,   285,   286,   416,   417,   418,   528,
     657,   660,   661,   662,   287,   288,   289,   290,   291,   292,
     468,    95,   294,   340,   341,   342,   428,   508,   295,   296,
     297,   298,   327,   398,   399,   400,   401,   402,   403,   299,
     300,   408,   409,   410,   412,   413,   414,   517,   619,   184,
     185,   301,    53,   302,   303,   323,   304,   113,   325,   612,
     404,   139,    97,   458,   313,   140,   141,   142,   143,    72,
     493,   598,   388,     6,     7,    30,    31,    32,    60,    33,
      34,    35
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -586
static const yytype_int16 yypact[] =
{
      99,    -7,    -7,    25,  -586,  -586,  -586,    37,  -586,    74,
    -586,    15,    19,    44,   -79,    51,  -586,  1045,    77,    13,
    -586,    84,  -586,  -586,    24,    92,   146,  -586,   618,  -586,
      37,  -586,  -586,    51,  -586,  -586,   170,   161,   163,   174,
    1035,   113,   191,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,   109,  -586,  -586,   187,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,   122,    11,   211,  -586,  1045,  -586,  -586,
    -586,  -586,  -586,  -586,   124,  -586,  -586,  -586,   767,   219,
     136,  -586,  -586,  -586,  -586,   135,  -586,  -586,  -586,   137,
    -586,  -586,   693,  -586,  -586,   147,  -586,  -586,  -586,  -586,
    1045,  1045,  1045,  -586,    26,  -586,   612,  1008,  -586,   148,
     145,  -586,  -586,    13,  -586,  -586,  -586,   158,   159,  -586,
    -586,  -586,   165,   166,  -586,  -586,  -586,   -21,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,   618,  -586,  -586,  -586,  -586,
    -586,  -586,   167,   178,   167,  -586,   180,  -586,  -586,   167,
     167,   167,  -586,   247,   171,   179,   181,  -586,  -586,  -586,
     285,  -586,  -586,   187,  -586,   -11,  -586,    11,   286,  1045,
    -586,   767,  -586,   281,  -586,  -586,  1035,  -586,   433,  -586,
    -586,  -586,  -586,  -586,   280,   297,   172,  -586,   339,  -586,
    -586,  -586,    13,  -586,  -586,  -586,  -586,  -586,   128,  -586,
    -586,   228,   230,  -586,   231,   233,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,   273,   173,  -586,  -586,   173,   240,   250,
     128,  -586,   322,  -586,  -586,  -586,  -586,  -586,   433,  -586,
     173,   113,   134,   239,   239,   325,   326,   329,   245,   994,
     320,   534,   646,   784,   808,   576,  1045,  -586,    21,   411,
     332,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,   333,   618,  -586,  -586,   334,  -586,   336,
     825,  -586,  -586,  -586,  -586,  -586,  -586,  -586,   337,  -586,
    -586,  -586,   239,   244,   251,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,   340,  -586,  -586,   721,   -13,   135,  -586,  -586,
    -586,  -586,  -586,  1045,   265,  -586,  -586,  -586,  -586,  -586,
    1045,  -586,  1045,  -586,  -586,  -586,   842,   342,   344,   360,
     363,   356,   352,   353,   267,  -586,   355,   357,   275,   345,
     279,   274,  -586,  -586,  -586,  -586,  -586,  -586,  -586,   278,
    -586,  -586,   -12,   -12,   -12,   -12,   -12,   -12,   -12,   461,
     -10,   144,   144,   144,   358,   -12,   144,   -12,  -586,  -586,
     978,   994,  -586,  -586,  -586,  -586,   893,   910,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,   292,   767,   282,
     126,  -586,  -586,   -16,  -586,   307,   283,   354,   288,   291,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,   767,   384,   360,
    -586,   767,   389,   363,  -586,   767,    97,   356,  -586,  -586,
    -586,   229,  -586,  -586,   767,   576,  -586,   411,    65,   767,
    -586,  -586,  1045,  1045,  1045,  1045,  1045,  1045,  1045,   380,
     381,   383,   386,   390,   391,   392,   393,  1054,   -12,  1045,
    1045,  1045,  -586,  -586,  -586,  -586,  -586,  -586,   695,   859,
     876,  1045,  1045,   767,  1045,  -586,  -586,  -586,   239,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,   556,   130,   626,
     626,    21,  -586,  -586,  -586,   618,  -586,  -586,  -586,  -586,
     626,   404,   -15,   767,  -586,   767,  -586,  -586,   167,  -586,
    -586,  -586,   323,   346,  -586,  -586,  -586,  -586,  -586,  -586,
    1045,  -586,  -586,  1022,   767,  -586,   842,    32,   405,   407,
    -586,   424,   430,  -586,   434,  1008,   994,  1008,   445,  -586,
     446,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  1045,  1045,  1045,  1045,  1045,  1045,  1045,
    1045,  1045,  -586,  1045,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,   961,   927,
     944,  -586,   324,   361,   767,  -586,  -586,  -586,  -586,   433,
     364,  -586,  -586,  -586,  -586,  -586,  -586,   167,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,   447,   362,  -586,  -586,    39,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,   618,
     618,  -586,   366,  -586,  -586,   473,  1008,  -586,   411,  -586,
     462,    39,  -586,   136,   136,  -586,   978,  -586,   455,   456,
    -586,  -586,  -586,  -586
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -586,  -586,  -586,    16,  -586,   378,     7,  -586,  -586,  -586,
    -586,  -586,   315,  -586,  -586,   277,  -586,  -586,  -586,  -586,
      -1,  -586,  -586,     8,  -586,  -586,   341,  -586,  -586,  -586,
     309,   464,  -586,  -586,  -586,  -586,  -231,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -586,  -586,   246,  -586,
    -586,  -202,  -113,  -586,  -586,   335,  -586,  -586,  -586,  -155,
    -586,  -154,  -586,  -586,  -586,  -586,  -211,  -586,   242,  -405,
    -586,   368,    33,  -586,   -90,  -586,  -586,  -586,  -586,  -586,
    -586,  -586,  -586,  -586,  -586,  -586,  -301,  -586,  -585,  -586,
      12,  -586,  -152,  -586,  -586,  -586,  -586,  -586,   100,  -586,
    -586,  -586,  -586,  -141,  -586,  -586,  -234,  -586,  -586,    -5,
    -143,  -115,   276,  -586,  -586,  -418,  -586,   111,  -586,  -586,
    -586,  -586,  -230,  -586,  -586,     9,  -586,  -233,    23,  -586,
    -586,  -586,  -586,   131,  -586,  -586,   129,  -586,  -586,  -150,
      -3,  -586,  -586,  -586,  -586,  -586,  -586,    10,  -586,  -586,
     -66,   -27,   160,  -223,  -168,  -217,  -586,   -25,   -17,  -210,
    -586,  -398,  -586,  -586,  -586,  -586,   518,  -586,   516,  -586,
    -586,    50
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -368
static const yytype_int16 yytable[] =
{
      71,    96,   170,    98,   187,   146,   305,   319,    46,   533,
     174,    99,   274,   307,   328,   333,    44,    49,     9,   509,
    -162,   266,   138,   109,   201,    10,    -6,    36,     4,    37,
      38,    39,    40,   430,   305,   450,    12,    13,   336,    14,
     274,   307,   343,    41,   659,    57,    11,    12,    13,   266,
      14,   240,   433,   434,   435,   436,   437,   438,   115,   314,
     135,    54,   369,   366,   462,    61,   464,    55,   267,   269,
     658,   283,   320,    15,    16,    36,   659,    37,    38,    39,
      40,   599,   600,    61,    12,    13,    58,    14,    16,   226,
      56,    41,   604,   164,   165,   166,   267,   269,   217,   283,
     171,   202,   203,   204,   180,   181,   510,  -276,   293,    88,
     431,   525,   451,    46,    73,   210,  -276,   205,    96,    76,
      98,    44,    49,   123,   124,   125,   526,    78,    99,   527,
     617,    17,   618,    74,   293,    18,   293,   470,   126,   459,
     460,  -277,    17,   463,    77,    88,    18,   553,   217,    19,
    -277,   110,   111,   488,   112,    20,   190,   191,   192,   473,
     476,   496,   135,   498,   499,  -348,   500,   501,   338,   109,
     490,   218,   110,   111,   518,   112,   485,   492,   521,    17,
     322,    79,   524,    18,   349,   575,   576,   577,   578,   579,
     580,   581,   582,   583,   584,   585,   586,   587,   588,   452,
     453,   454,   455,   456,   457,   103,   306,   104,   532,   105,
     343,   308,   309,   310,   311,     1,     2,   389,   221,   222,
     106,   218,   260,   497,   498,   499,   114,   500,   501,   502,
     503,   117,   171,   118,   306,   227,   228,   122,   574,   337,
     668,   561,   565,   569,   663,   664,   131,    96,  -277,    98,
     260,   321,   324,   365,   144,   367,   293,    99,   145,    88,
     589,  -276,   590,   591,   592,   593,   594,   595,   596,   597,
     163,   173,   293,   172,    36,    80,    81,    82,    83,   176,
     239,   177,    11,    12,    13,   240,   178,   183,   179,   241,
     242,   243,   244,   193,   194,   245,   391,   246,   186,   247,
     188,   248,   195,   395,   196,   396,   249,   250,    58,   251,
     252,    63,    64,    65,    66,   253,   254,   255,   256,   257,
     199,   208,   494,   258,    85,    86,    87,   211,   219,   477,
      63,    64,    65,    66,    67,    68,    69,    70,   478,    81,
     479,   480,   481,    85,    86,    87,   220,   224,   608,   235,
     315,   236,   237,   469,   171,   238,   316,   318,   531,   326,
     329,   330,   491,   535,   331,   259,   334,   344,   345,   350,
     306,   351,   368,   370,   371,   372,   392,   405,   652,   406,
     407,   642,   645,   648,   411,    19,   415,   419,   420,   421,
     422,   601,   423,   259,   530,   603,   427,   572,   424,   425,
     426,   429,   605,   461,   511,   495,   513,   519,   514,   515,
     625,   627,   628,   516,   522,   536,   537,   538,   539,   540,
     541,   542,   482,   483,   484,   543,   544,   606,   545,   607,
     552,   546,   554,   555,   556,   547,   548,   549,   550,  -166,
     620,   343,   621,   609,   570,   571,   649,   573,    62,    63,
      64,    65,    66,    67,    68,    69,    70,   339,    96,   622,
      98,   136,    85,    86,    87,   623,   610,   654,    99,   624,
      62,    63,    64,    65,    66,    67,    68,    69,    70,   213,
     629,   630,   655,   650,   656,   653,   613,   665,   666,   669,
     672,   673,   167,   395,   209,   212,   614,   335,   439,   440,
     441,   442,   443,   444,   445,   446,   447,   317,   171,   171,
     171,   448,   207,   182,   200,   116,   347,   529,   602,   217,
     670,   626,   611,   671,   332,   616,   631,   632,   633,   634,
     635,   636,   637,   638,   639,    36,   640,   615,   651,   534,
     520,   667,   523,    11,    12,    13,   240,   489,   100,   101,
     241,   242,   243,   244,     0,     0,   245,    88,   246,     0,
     247,     0,   248,     0,     0,     0,     0,   249,   250,    58,
       0,   252,    63,    64,    65,    66,   253,   254,   255,   256,
     257,     0,     0,   449,   258,    85,    86,    87,     0,     0,
       0,  -161,   218,  -139,  -139,  -139,  -139,  -139,  -139,  -139,
    -139,  -139,  -139,  -139,  -139,  -139,  -139,  -139,  -139,  -139,
       0,     0,     0,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    96,    96,    98,    98,   136,    85,    86,    87,
       0,     0,    99,    99,     0,     0,     0,     0,     0,   171,
       0,     0,     0,     0,     0,     0,    19,   168,     0,   469,
       0,     0,     0,     0,   259,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    80,    81,    82,    83,    84,    85,
      86,    87,     0,     0,     0,     0,     0,     0,     0,     0,
    -139,   575,   576,   577,   578,   579,   580,   581,   582,   583,
     584,   585,   586,   587,   588,   148,   149,   150,   151,   152,
     153,   154,   155,   156,   157,   158,   159,   160,   161,     0,
       0,     0,     0,     0,     0,  -367,  -367,  -367,  -367,  -367,
    -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,   147,
       0,     0,    62,    63,    64,    65,    66,    67,    68,    69,
      70,   557,    88,   558,   559,   136,    85,    86,    87,     0,
       0,     0,     0,     0,     0,     0,   589,     0,   590,   591,
     592,   593,   594,   595,   596,   597,  -367,     0,     0,  -367,
       0,     0,     0,     0,     0,  -367,   148,   149,   150,   151,
     152,   153,   154,   155,   156,   157,   158,   159,   160,   161,
     373,   374,   375,   376,   377,   378,   379,   380,   381,   382,
     383,   384,   385,   386,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    80,    81,    82,    83,   136,    85,    86,
      87,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,     0,     0,
       0,     0,     0,     0,   387,  -231,  -231,  -231,  -231,  -231,
    -231,  -231,  -231,  -231,  -231,  -231,  -231,  -231,  -231,  -231,
    -231,  -231,   352,   353,   354,   355,   356,   357,   358,   359,
     360,   361,    81,   362,   363,   136,    85,    86,    87,    62,
      63,    64,    65,    66,    67,    68,    69,    70,   397,    81,
      82,    83,   136,    85,    86,    87,    62,    63,    64,    65,
      66,    67,    68,    69,    70,   562,     0,   563,   564,   136,
      85,    86,    87,    62,    63,    64,    65,    66,    67,    68,
      69,    70,   566,     0,   567,   568,   136,    85,    86,    87,
      62,    63,    64,    65,    66,    67,    68,    69,    70,     0,
       0,   471,   472,   136,    85,    86,    87,    62,    63,    64,
      65,    66,    67,    68,    69,    70,     0,     0,   474,   475,
     136,    85,    86,    87,    62,    63,    64,    65,    66,    67,
      68,    69,    70,     0,     0,   643,   644,   136,    85,    86,
      87,    62,    63,    64,    65,    66,    67,    68,    69,    70,
       0,     0,   646,   647,   136,    85,    86,    87,    62,    63,
      64,    65,    66,    67,    68,    69,    70,   641,     0,     0,
       0,   136,    85,    86,    87,    62,    63,    64,    65,    66,
      67,    68,    69,    70,   465,     0,     0,     0,   466,     0,
     467,    62,    63,    64,    65,    66,    67,    68,    69,    70,
     257,     0,     0,     0,   169,    62,    63,    64,    65,    66,
      67,    68,    69,    70,     0,     0,     0,     0,   169,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    80,    81,
      82,    83,    62,    63,    64,    65,    66,    67,    68,    69,
      70,   107,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    62,    63,    64,    65,    66,    67,    68,    69,   551
};

static const yytype_int16 yycheck[] =
{
      17,    28,   117,    28,   154,    95,   223,   238,     9,   427,
     123,    28,   223,   223,   244,   249,     9,     9,     2,    35,
      35,   223,    88,    40,    35,     0,     0,     1,    35,     3,
       4,     5,     6,    45,   251,    45,    10,    11,   255,    13,
     251,   251,   259,    17,   629,   124,     9,    10,    11,   251,
      13,    12,   353,   354,   355,   356,   357,   358,    42,   227,
      77,    46,   292,   280,   365,    15,   367,    48,   223,   223,
      31,   223,   240,    36,    37,     1,   661,     3,     4,     5,
       6,   479,   480,    33,    10,    11,    35,    13,    37,   202,
      46,    17,   490,   110,   111,   112,   251,   251,   188,   251,
     117,   112,   113,   114,   125,   126,   122,   120,   223,   124,
     122,    14,   122,   114,    37,   181,   129,   128,   145,    35,
     145,   114,   114,   112,   113,   114,    29,    35,   145,    32,
      98,   105,   100,   120,   249,   109,   251,   371,   127,   362,
     363,   120,   105,   366,   120,   124,   109,   448,   238,   112,
     129,    38,    39,   387,    41,   118,   159,   160,   161,   376,
     377,    35,   179,    98,    99,    35,   101,   102,   258,   186,
     387,   188,    38,    39,   407,    41,   387,   387,   411,   105,
      46,    35,   415,   109,   274,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    55,
      56,    57,    58,    59,    60,    35,   223,    46,   425,    46,
     427,    38,    39,    40,    41,   116,   117,   307,    46,    47,
      46,   238,   223,    97,    98,    99,    35,   101,   102,   103,
     104,   122,   249,    46,   251,   107,   108,   115,   468,   256,
     658,   458,   459,   460,   649,   650,    35,   274,   124,   274,
     251,   241,   242,   280,    35,   280,   371,   274,   122,   124,
     130,   124,   132,   133,   134,   135,   136,   137,   138,   139,
     123,   126,   387,   125,     1,    46,    47,    48,    49,   121,
       7,   122,     9,    10,    11,    12,   121,   120,   122,    16,
      17,    18,    19,    46,   123,    22,   313,    24,   120,    26,
     120,    28,   123,   320,   123,   322,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      35,    35,   388,    50,    51,    52,    53,    46,    48,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    49,     8,   498,   121,
     110,   121,   121,   370,   371,   122,   106,    35,   424,   120,
      35,    35,   387,   429,    35,   120,    46,    35,    35,    35,
     387,    35,    35,   129,   123,    35,   111,    35,   609,    35,
      20,   598,   599,   600,    21,   112,    30,    35,    35,   122,
      35,   481,    35,   120,   421,   485,   122,   463,   123,    54,
     121,   123,   492,    45,    97,   123,   123,    23,    54,   121,
     525,   526,   527,   122,    25,   432,   433,   434,   435,   436,
     437,   438,   130,   131,   132,    45,    45,   493,    45,   495,
     447,    45,   449,   450,   451,    45,    45,    45,    45,    35,
      35,   658,    35,   120,   461,   462,   122,   464,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,   485,    35,
     485,    50,    51,    52,    53,    35,   120,   617,   485,    35,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      35,    35,    35,   122,   122,   121,   513,   121,    15,    27,
      35,    35,   114,   510,   179,   186,   513,   251,    37,    38,
      39,    40,    41,    42,    43,    44,    45,   230,   525,   526,
     527,    50,   177,   145,   173,    51,   274,   417,   485,   609,
     661,   526,   510,   666,   248,   516,   543,   544,   545,   546,
     547,   548,   549,   550,   551,     1,   553,   514,   604,   428,
     409,   656,   413,     9,    10,    11,    12,   387,    30,    33,
      16,    17,    18,    19,    -1,    -1,    22,   124,    24,    -1,
      26,    -1,    28,    -1,    -1,    -1,    -1,    33,    34,    35,
      -1,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    -1,    -1,   122,    50,    51,    52,    53,    -1,    -1,
      -1,    35,   609,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      -1,    -1,    -1,    37,    38,    39,    40,    41,    42,    43,
      44,    45,   649,   650,   649,   650,    50,    51,    52,    53,
      -1,    -1,   649,   650,    -1,    -1,    -1,    -1,    -1,   656,
      -1,    -1,    -1,    -1,    -1,    -1,   112,    35,    -1,   666,
      -1,    -1,    -1,    -1,   120,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     124,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    -1,
      -1,    -1,    -1,    -1,    -1,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    36,
      -1,    -1,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,   124,    48,    49,    50,    51,    52,    53,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   130,    -1,   132,   133,
     134,   135,   136,   137,   138,   139,   120,    -1,    -1,   123,
      -1,    -1,    -1,    -1,    -1,   129,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    -1,    -1,
      -1,    -1,    -1,    -1,   123,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    -1,    48,    49,    50,
      51,    52,    53,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    -1,    48,    49,    50,    51,    52,    53,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    -1,
      -1,    48,    49,    50,    51,    52,    53,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    -1,    -1,    48,    49,
      50,    51,    52,    53,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    -1,    -1,    48,    49,    50,    51,    52,
      53,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      -1,    -1,    48,    49,    50,    51,    52,    53,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    -1,    -1,
      -1,    50,    51,    52,    53,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    -1,    -1,    -1,    50,    -1,
      52,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    -1,    -1,    -1,    50,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    -1,    -1,    -1,    -1,    50,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    37,    38,    39,    40,    41,    42,    43,    44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   116,   117,   141,    35,   143,   303,   304,   142,   143,
       0,     9,    10,    11,    13,    36,    37,   105,   109,   112,
     118,   146,   147,   148,   149,   160,   163,   191,   206,   232,
     305,   306,   307,   309,   310,   311,     1,     3,     4,     5,
       6,    17,   144,   145,   146,   159,   160,   161,   162,   163,
     167,   169,   201,   282,    46,    48,    46,   124,    35,   199,
     308,   311,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   298,   299,    37,   120,   192,    35,   120,    35,    35,
      46,    47,    48,    49,    50,    51,    52,    53,   124,   208,
     209,   211,   212,   213,   214,   251,   291,   292,   297,   298,
     306,   308,   171,    35,    46,    46,    46,    46,   170,   298,
      38,    39,    41,   287,    35,   143,   171,   122,    46,   164,
     165,   166,   115,   112,   113,   114,   127,   193,   194,   195,
     196,    35,   150,   151,   152,   298,    50,   215,   290,   291,
     295,   296,   297,   298,    35,   122,   214,    36,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,   172,   123,   298,   298,   298,   145,    35,    50,
     251,   298,   125,   126,   192,   197,   121,   122,   121,   122,
     125,   126,   211,   120,   279,   280,   120,   279,   120,   173,
     280,   280,   280,    46,   123,   123,   123,   177,   178,    35,
     166,    35,   112,   113,   114,   128,   198,   195,    35,   152,
     290,    46,   170,    46,   174,   175,   176,   214,   298,    48,
      49,    46,    47,   186,     8,   179,   192,   107,   108,   153,
     154,   155,   156,   157,   158,   121,   121,   121,   122,     7,
      12,    16,    17,    18,    19,    22,    24,    26,    28,    33,
      34,    36,    37,    42,    43,    44,    45,    46,    50,   120,
     160,   168,   187,   188,   189,   190,   191,   199,   200,   201,
     202,   203,   204,   205,   206,   216,   217,   219,   221,   222,
     225,   227,   228,   232,   233,   234,   235,   244,   245,   246,
     247,   248,   249,   251,   252,   258,   259,   260,   261,   269,
     270,   281,   283,   284,   286,   295,   298,   299,    38,    39,
      40,    41,   180,   294,   294,   110,   106,   155,    35,   176,
     294,   287,    46,   285,   287,   288,   120,   262,   262,    35,
      35,    35,   252,   246,    46,   188,   295,   298,   214,    46,
     253,   254,   255,   295,    35,    35,   207,   208,   210,   214,
      35,    35,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    48,    49,   223,   291,   295,   297,    35,   262,
     129,   123,    35,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,   123,   302,   214,
     181,   298,   111,   229,   230,   298,   298,    46,   263,   264,
     265,   266,   267,   268,   290,    35,    35,    20,   271,   272,
     273,    21,   274,   275,   276,    30,   236,   237,   238,    35,
      35,   122,    35,    35,   123,    54,   121,   122,   256,   123,
      45,   122,   226,   226,   226,   226,   226,   226,   226,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    50,   122,
      45,   122,    55,    56,    57,    58,    59,    60,   293,   293,
     293,    45,   226,   293,   226,    46,    50,    52,   250,   298,
     246,    48,    49,   295,    48,    49,   295,    37,    46,    48,
      49,    50,   130,   131,   132,   206,   218,   220,   246,   292,
     295,   297,   299,   300,   290,   123,    35,    97,    98,    99,
     101,   102,   103,   104,   182,   183,   184,   185,   257,    35,
     122,    97,   231,   123,    54,   121,   122,   277,   267,    23,
     273,   267,    25,   276,   267,    14,    29,    32,   239,   238,
     291,   290,   295,   255,   257,   290,   298,   298,   298,   298,
     298,   298,   298,    45,    45,    45,    45,    45,    45,    45,
      45,    45,   298,   226,   298,   298,   298,    46,    48,    49,
     224,   295,    46,    48,    49,   295,    46,    48,    49,   295,
     298,   298,   290,   298,   262,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,   130,
     132,   133,   134,   135,   136,   137,   138,   139,   301,   301,
     301,   214,   212,   214,   301,   214,   290,   290,   279,   120,
     120,   230,   289,   291,   298,   268,   265,    98,   100,   278,
      35,    35,    35,    35,    35,   251,   249,   251,   251,    35,
      35,   298,   298,   298,   298,   298,   298,   298,   298,   298,
     298,    46,   295,    48,    49,   295,    48,    49,   295,   122,
     122,   290,   176,   121,   279,    35,   122,   240,    31,   228,
     241,   242,   243,   209,   209,   121,    15,   251,   255,    27,
     243,   250,    35,    35
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
# if YYLTYPE_IS_TRIVIAL
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

  case 20:
#line 603 "pir.y"
    { new_macro_const(lexer->macros, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval), yypirget_lineno(yyscanner)); ;}
    break;

  case 21:
#line 609 "pir.y"
    { /* fprintf(stderr, "macro body: [%s]\n", CURRENT_MACRO(lexer)->body);*/ ;}
    break;

  case 22:
#line 613 "pir.y"
    {
                          new_macro(lexer->macros, (yyvsp[(2) - (2)].sval), yypirget_lineno(yyscanner), TRUE,
                                    lexer->macro_size);
                        ;}
    break;

  case 27:
#line 628 "pir.y"
    { add_macro_param(CURRENT_MACRO(lexer), (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 35:
#line 647 "pir.y"
    { store_macro_string(CURRENT_MACRO(lexer), "%s\n", (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 36:
#line 651 "pir.y"
    {
                          store_macro_string(CURRENT_MACRO(lexer), ".local %s %s\n",
                                             pir_type_names[(yyvsp[(2) - (3)].ival)], (yyvsp[(3) - (3)].sval));
                        ;}
    break;

  case 37:
#line 662 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 38:
#line 666 "pir.y"
    { yypirset_lineno ((yyvsp[(2) - (2)].ival), yyscanner); ;}
    break;

  case 39:
#line 668 "pir.y"
    { lexer->filename = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 40:
#line 674 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 41:
#line 678 "pir.y"
    { set_hll_map(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 42:
#line 682 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 43:
#line 686 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 44:
#line 688 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 45:
#line 692 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 46:
#line 694 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 47:
#line 698 "pir.y"
    { (yyval.expr) = expr_from_string(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 49:
#line 708 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 50:
#line 712 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 55:
#line 724 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_ANON);;}
    break;

  case 56:
#line 726 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_INIT); ;}
    break;

  case 57:
#line 728 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_LOAD); ;}
    break;

  case 58:
#line 730 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_MAIN); ;}
    break;

  case 59:
#line 732 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_LEX); ;}
    break;

  case 60:
#line 734 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_POSTCOMP); ;}
    break;

  case 61:
#line 736 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_IMMEDIATE); ;}
    break;

  case 62:
#line 738 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_MULTI); ;}
    break;

  case 63:
#line 740 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 64:
#line 742 "pir.y"
    { set_sub_methodname(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 65:
#line 744 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 66:
#line 746 "pir.y"
    { set_sub_subid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 67:
#line 748 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 68:
#line 750 "pir.y"
    { set_sub_nsentry(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 69:
#line 754 "pir.y"
    { set_sub_multi_types(lexer, (yyvsp[(2) - (3)].expr)); ;}
    break;

  case 70:
#line 758 "pir.y"
    {
                          CURRENT_SUB(lexer)->info.num_multi_types = 1;
                          /* n=1 means :multi() -- without any types. */
                        ;}
    break;

  case 71:
#line 763 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 72:
#line 767 "pir.y"
    {
                          CURRENT_SUB(lexer)->info.num_multi_types = 2;
                          /* start counting multi types; always 1 higher than actual number
                           * so that n=0 means no :multi, n=1 means :multi(), n=2 means
                           * :multi(Type1), n=3 means :multi(Type1,Type2), etc.
                           */
                           (yyval.expr) = (yyvsp[(1) - (1)].expr);
                        ;}
    break;

  case 73:
#line 776 "pir.y"
    {
                          ++CURRENT_SUB(lexer)->info.num_multi_types;
                          /* link the multi types in reverse other. That's fine,
                           * as long as you remember that it's reversed.
                           */
                          (yyvsp[(3) - (3)].expr)->next = (yyvsp[(1) - (3)].expr);
                          (yyval.expr) = (yyvsp[(3) - (3)].expr);
                        ;}
    break;

  case 74:
#line 787 "pir.y"
    { (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 75:
#line 789 "pir.y"
    { (yyval.expr) = expr_from_string(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 76:
#line 791 "pir.y"
    { (yyval.expr) = expr_from_key(lexer, (yyvsp[(1) - (1)].key)); ;}
    break;

  case 77:
#line 795 "pir.y"
    {
                           /* if there are parameters, then emit a get_params instruction. */
                           if ((yyvsp[(1) - (1)].uval) > 0)
                               generate_parameters_instr(lexer, (yyvsp[(1) - (1)].uval));
                         ;}
    break;

  case 78:
#line 803 "pir.y"
    { (yyval.uval) = 0; ;}
    break;

  case 79:
#line 805 "pir.y"
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

  case 80:
#line 818 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 81:
#line 822 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 82:
#line 826 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 83:
#line 828 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 88:
#line 838 "pir.y"
    { (yyval.ival) = TARGET_FLAG_LOOKAHEAD; ;}
    break;

  case 89:
#line 842 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT;
                           /* XXX handle multi_type */

                         ;}
    break;

  case 90:
#line 849 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 92:
#line 856 "pir.y"
    {
                         ++lexer->stmt_counter;
                         /* increment the logical statement counter; a statement can be
                          * multiple lines, but each statement has its own ID for the
                          * linear scan register allocator.
                          */
                        ;}
    break;

  case 93:
#line 866 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 111:
#line 889 "pir.y"
    { annotate(lexer, (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].cval)); ;}
    break;

  case 113:
#line 899 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (3)].mval), (yyvsp[(2) - (3)].pval)); ;}
    break;

  case 114:
#line 903 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 115:
#line 905 "pir.y"
    { (yyval.pval) = (yyvsp[(2) - (3)].pval); ;}
    break;

  case 116:
#line 909 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 118:
#line 914 "pir.y"
    { (yyval.pval) = new_macro_param((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 119:
#line 916 "pir.y"
    {
                          macro_param *param = new_macro_param((yyvsp[(3) - (3)].sval));
                          param->next = (yyvsp[(1) - (3)].pval);
                          (yyval.pval) = param;
                        ;}
    break;

  case 120:
#line 924 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "macro argument '%s' is not a "
                                                           "declared identifier", (yyvsp[(1) - (1)].sval));
                          }
                        ;}
    break;

  case 122:
#line 933 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 124:
#line 938 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 125:
#line 943 "pir.y"
    { (yyval.sval) = ""; ;}
    break;

  case 126:
#line 945 "pir.y"
    { /* XXX cleanup memory stuff */
                          char *newbuff = (char *)mem_sys_allocate((strlen((yyvsp[(1) - (2)].sval)) + strlen((yyvsp[(2) - (2)].sval)) + 2)
                                                                   * sizeof (char));
                          sprintf(newbuff, "%s %s", (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval));
                          (yyval.sval) = newbuff;
                        ;}
    break;

  case 130:
#line 957 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 131:
#line 965 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 133:
#line 973 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         ;}
    break;

  case 134:
#line 982 "pir.y"
    {
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(lexer);
                         ;}
    break;

  case 135:
#line 989 "pir.y"
    {
                           set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(lexer);
                         ;}
    break;

  case 139:
#line 1003 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 140:
#line 1012 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(lexer))
                              do_strength_reduction(lexer);
                        ;}
    break;

  case 146:
#line 1030 "pir.y"
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

  case 147:
#line 1066 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 148:
#line 1068 "pir.y"
    { push_operand(lexer, expr_from_key(lexer, (yyvsp[(1) - (1)].key))); ;}
    break;

  case 149:
#line 1072 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 150:
#line 1074 "pir.y"
    { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 151:
#line 1079 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 152:
#line 1081 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 153:
#line 1085 "pir.y"
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

  case 154:
#line 1108 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 155:
#line 1112 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 156:
#line 1114 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 157:
#line 1123 "pir.y"
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

  case 158:
#line 1134 "pir.y"
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

  case 159:
#line 1146 "pir.y"
    {
                          unshift_operand(lexer, expr_from_key(lexer, (yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));
                          if (check_op_args_for_symbols(lexer))
                              check_first_arg_direction(lexer, (yyvsp[(3) - (6)].sval));
                              /* no strength reduction here */
                        ;}
    break;

  case 163:
#line 1163 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(lexer);
                        ;}
    break;

  case 164:
#line 1172 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(lexer);
                        ;}
    break;

  case 165:
#line 1181 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].cval));
                          get_opinfo(lexer);
                        ;}
    break;

  case 166:
#line 1186 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 167:
#line 1191 "pir.y"
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

  case 168:
#line 1212 "pir.y"
    {
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                          get_opinfo(lexer);
                        ;}
    break;

  case 169:
#line 1217 "pir.y"
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

  case 170:
#line 1258 "pir.y"
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

  case 171:
#line 1276 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                          get_opinfo(lexer);
                        ;}
    break;

  case 172:
#line 1283 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 173:
#line 1288 "pir.y"
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

  case 174:
#line 1299 "pir.y"
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

  case 175:
#line 1310 "pir.y"
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

  case 176:
#line 1321 "pir.y"
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

  case 177:
#line 1332 "pir.y"
    {
                          set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 178:
#line 1337 "pir.y"
    {
                          set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 179:
#line 1342 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 180:
#line 1347 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%E", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].expr));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%E", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].expr));

                          get_opinfo(lexer);
                          do_strength_reduction(lexer);
                        ;}
    break;

  case 181:
#line 1357 "pir.y"
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

  case 182:
#line 1376 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 183:
#line 1410 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 184:
#line 1412 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 185:
#line 1414 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 186:
#line 1416 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 187:
#line 1418 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 188:
#line 1420 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 189:
#line 1422 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 190:
#line 1424 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 191:
#line 1429 "pir.y"
    { get_opinfo(lexer); ;}
    break;

  case 192:
#line 1438 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 193:
#line 1440 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 194:
#line 1442 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 195:
#line 1444 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 196:
#line 1446 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 197:
#line 1448 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 198:
#line 1450 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 199:
#line 1452 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 200:
#line 1454 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 201:
#line 1456 "pir.y"
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

  case 202:
#line 1468 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (5)].ival)), (yyvsp[(5) - (5)].sval));
                        ;}
    break;

  case 203:
#line 1473 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 204:
#line 1475 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 205:
#line 1477 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 206:
#line 1479 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 207:
#line 1481 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 208:
#line 1483 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 209:
#line 1485 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 210:
#line 1487 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 211:
#line 1489 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 212:
#line 1491 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 213:
#line 1493 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 214:
#line 1495 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 215:
#line 1497 "pir.y"
    {
                          if ((yyvsp[(2) - (4)].ival) == COMPUTE_DURING_RUNTIME) {
                             if ((yyvsp[(1) - (4)].ival) == NEED_INVERT_OPNAME) /* "unless" */
                                 invert_instr(lexer);

                             push_operand(lexer, expr_from_ident(lexer, (yyvsp[(4) - (4)].sval)));

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

  case 216:
#line 1528 "pir.y"
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
                           * exactly one place in the whole grammer, we can be sure of this.
                           */
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%E%T", (yyvsp[(3) - (3)].expr), (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;  /* indicates this is evaluated at runtime */
                        ;}
    break;

  case 217:
#line 1554 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%i", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].ival));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 218:
#line 1562 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%n", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].dval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 219:
#line 1571 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%s", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].sval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 220:
#line 1580 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 221:
#line 1582 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 222:
#line 1584 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 223:
#line 1586 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 224:
#line 1588 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 225:
#line 1592 "pir.y"
    {
                          yypirerror(yyscanner, lexer, "cannot compare string to %s",
                                     (yyvsp[(3) - (3)].ival) == INT_TYPE ? "integer" : "number");
                        ;}
    break;

  case 226:
#line 1597 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare integer to string"); ;}
    break;

  case 227:
#line 1599 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare number to string"); ;}
    break;

  case 228:
#line 1603 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 229:
#line 1604 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 230:
#line 1607 "pir.y"
    { (yyval.ival) = DONT_INVERT_OPNAME; /* no need to invert */ ;}
    break;

  case 231:
#line 1608 "pir.y"
    { (yyval.ival) = NEED_INVERT_OPNAME; /* yes, invert opname */ ;}
    break;

  case 234:
#line 1616 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_op_labelflag(lexer, BIT(0)); /* bit 0 means: "1 << 0" */
                          get_opinfo(lexer);
                        ;}
    break;

  case 235:
#line 1624 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 236:
#line 1628 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 237:
#line 1630 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 238:
#line 1634 "pir.y"
    { (yyval.symb) = new_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 239:
#line 1637 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 240:
#line 1638 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 241:
#line 1642 "pir.y"
    { /* if $4 is not a register, it must be a declared symbol */
                          if (!TEST_FLAG((yyvsp[(4) - (5)].targ)->flags, TARGET_FLAG_IS_REG)) {

                              if ((yyvsp[(4) - (5)].targ)->info->type != PMC_TYPE) /* a .lex must be a PMC */
                                  yypirerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                             (yyvsp[(4) - (5)].targ)->info->id.name);
                          }
                          set_lex_flag(lexer, (yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                        ;}
    break;

  case 242:
#line 1657 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 245:
#line 1669 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args(lexer, (yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              (yyval.invo) = set_invocation_results(lexer, (yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 246:
#line 1676 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 247:
#line 1678 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 248:
#line 1682 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 249:
#line 1684 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 250:
#line 1688 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 251:
#line 1692 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 252:
#line 1694 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 253:
#line 1697 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].expr)); ;}
    break;

  case 254:
#line 1701 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 255:
#line 1703 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 256:
#line 1707 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 257:
#line 1709 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 258:
#line 1713 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 259:
#line 1715 "pir.y"
    {
                             if ((yyvsp[(2) - (2)].targ))
                                 (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ));
                             else
                                 (yyval.targ) = (yyvsp[(1) - (2)].targ)
                           ;}
    break;

  case 260:
#line 1724 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 261:
#line 1726 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 263:
#line 1734 "pir.y"
    { (yyval.invo) = set_invocation_results(lexer, (yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 264:
#line 1736 "pir.y"
    { (yyval.invo) = set_invocation_results(lexer, (yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 265:
#line 1738 "pir.y"
    {  (yyval.invo) = set_invocation_results(lexer, (yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 268:
#line 1746 "pir.y"
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

  case 269:
#line 1766 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 270:
#line 1773 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 271:
#line 1775 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);
                           ;}
    break;

  case 272:
#line 1785 "pir.y"
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

  case 273:
#line 1802 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 274:
#line 1804 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 275:
#line 1806 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_VAL, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 276:
#line 1810 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);

                           ;}
    break;

  case 277:
#line 1819 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 278:
#line 1824 "pir.y"
    {
                             (yyval.targ) = (yyvsp[(2) - (3)].targ);
                           ;}
    break;

  case 279:
#line 1830 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 280:
#line 1832 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 281:
#line 1836 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 282:
#line 1838 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 283:
#line 1842 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 284:
#line 1844 "pir.y"
    { (yyval.targ) = set_param_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 285:
#line 1848 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 286:
#line 1850 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 287:
#line 1854 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 288:
#line 1856 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 289:
#line 1858 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 290:
#line 1860 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 291:
#line 1870 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 296:
#line 1880 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 297:
#line 1885 "pir.y"
    { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              (yyval.invo) = (yyvsp[(2) - (3)].invo);
                            ;}
    break;

  case 298:
#line 1896 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 299:
#line 1903 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 300:
#line 1907 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 301:
#line 1909 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 302:
#line 1913 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 303:
#line 1915 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 306:
#line 1923 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 307:
#line 1927 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 308:
#line 1931 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument(lexer, (yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 309:
#line 1937 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 310:
#line 1946 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 311:
#line 1953 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 312:
#line 1955 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 313:
#line 1960 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 314:
#line 1962 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 315:
#line 1967 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 316:
#line 1971 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 317:
#line 1973 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 318:
#line 1977 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 319:
#line 1979 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 320:
#line 1983 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 321:
#line 1988 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 322:
#line 1990 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 323:
#line 1994 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 324:
#line 1996 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 325:
#line 2003 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 326:
#line 2005 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 327:
#line 2009 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 329:
#line 2016 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cdec)); ;}
    break;

  case 332:
#line 2024 "pir.y"
    { (yyval.cdec) = (yyvsp[(2) - (2)].cdec); ;}
    break;

  case 335:
#line 2032 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cdec)); ;}
    break;

  case 336:
#line 2036 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, INT_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 337:
#line 2038 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, NUM_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 338:
#line 2040 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, STRING_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 339:
#line 2042 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, USTRING_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ustr)); ;}
    break;

  case 340:
#line 2046 "pir.y"
    { (yyval.cdec) = new_pmc_const(lexer, (yyvsp[(1) - (4)].sval), (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].cval)); ;}
    break;

  case 342:
#line 2051 "pir.y"
    { /* this alternative is necessary, otherwise the parser
                               * just stops when assigning an identifier to a pmc
                               * const, without an error message. That may be
                               * a bug in bison.
                               */
                              yypirerror(yyscanner, lexer, "unexpected identifier");
                            ;}
    break;

  case 343:
#line 2063 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 344:
#line 2064 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 345:
#line 2068 "pir.y"
    { (yyval.cval) = new_const(lexer, INT_VAL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 346:
#line 2069 "pir.y"
    { (yyval.cval) = new_const(lexer, NUM_VAL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 347:
#line 2070 "pir.y"
    { (yyval.cval) = (yyvsp[(1) - (1)].cval); ;}
    break;

  case 348:
#line 2073 "pir.y"
    { (yyval.cval) = new_const(lexer, STRING_VAL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 349:
#line 2074 "pir.y"
    { (yyval.cval) = new_const(lexer, USTRING_VAL, (yyvsp[(1) - (1)].ustr)); ;}
    break;

  case 350:
#line 2077 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 351:
#line 2078 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 352:
#line 2079 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 353:
#line 2080 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 354:
#line 2081 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 355:
#line 2082 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 356:
#line 2085 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 357:
#line 2086 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 358:
#line 2087 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 359:
#line 2088 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 360:
#line 2096 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 362:
#line 2100 "pir.y"
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

  case 363:
#line 2113 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 364:
#line 2114 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 365:
#line 2115 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 366:
#line 2116 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 369:
#line 2124 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 370:
#line 2125 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 371:
#line 2126 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 372:
#line 2127 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 373:
#line 2128 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 374:
#line 2129 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 375:
#line 2130 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 376:
#line 2131 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 377:
#line 2134 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 378:
#line 2135 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 379:
#line 2136 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 380:
#line 2139 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 381:
#line 2140 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 382:
#line 2141 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 383:
#line 2142 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 384:
#line 2143 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 385:
#line 2144 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 386:
#line 2145 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 387:
#line 2146 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 388:
#line 2147 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 389:
#line 2148 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 390:
#line 2149 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 391:
#line 2150 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 392:
#line 2151 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 393:
#line 2152 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 394:
#line 2153 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 395:
#line 2154 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 396:
#line 2155 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 397:
#line 2156 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 398:
#line 2157 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 399:
#line 2158 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 400:
#line 2159 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 401:
#line 2160 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 402:
#line 2161 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 403:
#line 2167 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 404:
#line 2168 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 405:
#line 2169 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 406:
#line 2170 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 407:
#line 2171 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 408:
#line 2172 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 409:
#line 2173 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 410:
#line 2174 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 411:
#line 2175 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 412:
#line 2176 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 413:
#line 2177 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 414:
#line 2178 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 416:
#line 2199 "pir.y"
    { new_subr(lexer, "@start"); ;}
    break;

  case 425:
#line 2215 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 430:
#line 2225 "pir.y"
    { set_sub_name(lexer, (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 431:
#line 2229 "pir.y"
    { new_subr(lexer, NULL); ;}
    break;

  case 432:
#line 2234 "pir.y"
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
#line 4792 "pirparser.c"
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


#line 2248 "pir.y"






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

    /* set a flag on this instruction */
    set_op_labelflag(lexer, BIT(2));
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

/* XXX */
#if 0
/* experimental code to integrate constants. Doesn't work properly, this is only
 * 1 spot in which symbol lookups are done; needs to be done everywhere.
 * XXX possibly integrate constdecl and symbol, or represent constdecl's as symbols.
 */
                constdecl *c = find_global_constant(lexer, operand->expr.id);

                if (c) { /* it's a constant */

                    /* convert the operand to a constant, copy the const value into this. */
                    operand->type         = EXPR_CONSTANT;
                    /* allocate a new const; doesn't matter which type/value, overwritten later */
                    operand->expr.c       = new_const(lexer, INT_VAL, 0); /* dummy value */
                    operand->expr.c->val  = c->val; /* copy value union */
                    operand->expr.c->type = c->type; /* copy value type */
                }
                else
#endif
/* XXX */
                {
                    /* it must be a label */
                    SET_BIT(label_bitmask, BIT(i));
                }
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


