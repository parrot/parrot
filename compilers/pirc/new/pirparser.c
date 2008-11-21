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
     TK_INTC = 301,
     TK_NUMC = 302,
     TK_PREG = 303,
     TK_NREG = 304,
     TK_SREG = 305,
     TK_IREG = 306,
     TK_ARROW = 307,
     TK_NE = 308,
     TK_EQ = 309,
     TK_LT = 310,
     TK_LE = 311,
     TK_GT = 312,
     TK_GE = 313,
     TK_USHIFT = 314,
     TK_RSHIFT = 315,
     TK_LSHIFT = 316,
     TK_FDIV = 317,
     TK_OR = 318,
     TK_AND = 319,
     TK_XOR = 320,
     TK_CONC = 321,
     TK_ASSIGN_USHIFT = 322,
     TK_ASSIGN_RSHIFT = 323,
     TK_ASSIGN_LSHIFT = 324,
     TK_ASSIGN_INC = 325,
     TK_ASSIGN_DEC = 326,
     TK_ASSIGN_MUL = 327,
     TK_ASSIGN_MOD = 328,
     TK_ASSIGN_POW = 329,
     TK_ASSIGN_DIV = 330,
     TK_ASSIGN_BOR = 331,
     TK_ASSIGN_BAND = 332,
     TK_ASSIGN_FDIV = 333,
     TK_ASSIGN_BNOT = 334,
     TK_ASSIGN_CONC = 335,
     TK_FLAG_INIT = 336,
     TK_FLAG_LOAD = 337,
     TK_FLAG_MAIN = 338,
     TK_FLAG_ANON = 339,
     TK_FLAG_METHOD = 340,
     TK_FLAG_OUTER = 341,
     TK_FLAG_VTABLE = 342,
     TK_FLAG_LEX = 343,
     TK_FLAG_MULTI = 344,
     TK_FLAG_POSTCOMP = 345,
     TK_FLAG_IMMEDIATE = 346,
     TK_FLAG_SUBID = 347,
     TK_FLAG_INSTANCEOF = 348,
     TK_FLAG_NSENTRY = 349,
     TK_FLAG_UNIQUE_REG = 350,
     TK_FLAG_NAMED = 351,
     TK_FLAG_SLURPY = 352,
     TK_FLAG_FLAT = 353,
     TK_FLAG_OPTIONAL = 354,
     TK_FLAG_OPT_FLAG = 355,
     TK_FLAG_INVOCANT = 356,
     TK_MACRO = 357,
     TK_ENDM = 358,
     TK_MACRO_LOCAL = 359,
     TK_MACRO_LABEL = 360,
     TK_MACRO_CONST = 361,
     TK_MACRO_LABEL_ID = 362,
     TK_MACRO_LOCAL_ID = 363,
     TK_MACRO_IDENT = 364,
     TK_MACRO_ARG_IDENT = 365,
     TK_MACRO_ARG_OTHER = 366,
     TK_MACRO_CONST_VAL = 367,
     TK_PASM_MARKER_START = 368,
     TK_PIR_MARKER_START = 369,
     TK_PCC_SUB = 370,
     TK_PARROT_OP = 371
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
#define TK_INTC 301
#define TK_NUMC 302
#define TK_PREG 303
#define TK_NREG 304
#define TK_SREG 305
#define TK_IREG 306
#define TK_ARROW 307
#define TK_NE 308
#define TK_EQ 309
#define TK_LT 310
#define TK_LE 311
#define TK_GT 312
#define TK_GE 313
#define TK_USHIFT 314
#define TK_RSHIFT 315
#define TK_LSHIFT 316
#define TK_FDIV 317
#define TK_OR 318
#define TK_AND 319
#define TK_XOR 320
#define TK_CONC 321
#define TK_ASSIGN_USHIFT 322
#define TK_ASSIGN_RSHIFT 323
#define TK_ASSIGN_LSHIFT 324
#define TK_ASSIGN_INC 325
#define TK_ASSIGN_DEC 326
#define TK_ASSIGN_MUL 327
#define TK_ASSIGN_MOD 328
#define TK_ASSIGN_POW 329
#define TK_ASSIGN_DIV 330
#define TK_ASSIGN_BOR 331
#define TK_ASSIGN_BAND 332
#define TK_ASSIGN_FDIV 333
#define TK_ASSIGN_BNOT 334
#define TK_ASSIGN_CONC 335
#define TK_FLAG_INIT 336
#define TK_FLAG_LOAD 337
#define TK_FLAG_MAIN 338
#define TK_FLAG_ANON 339
#define TK_FLAG_METHOD 340
#define TK_FLAG_OUTER 341
#define TK_FLAG_VTABLE 342
#define TK_FLAG_LEX 343
#define TK_FLAG_MULTI 344
#define TK_FLAG_POSTCOMP 345
#define TK_FLAG_IMMEDIATE 346
#define TK_FLAG_SUBID 347
#define TK_FLAG_INSTANCEOF 348
#define TK_FLAG_NSENTRY 349
#define TK_FLAG_UNIQUE_REG 350
#define TK_FLAG_NAMED 351
#define TK_FLAG_SLURPY 352
#define TK_FLAG_FLAT 353
#define TK_FLAG_OPTIONAL 354
#define TK_FLAG_OPT_FLAG 355
#define TK_FLAG_INVOCANT 356
#define TK_MACRO 357
#define TK_ENDM 358
#define TK_MACRO_LOCAL 359
#define TK_MACRO_LABEL 360
#define TK_MACRO_CONST 361
#define TK_MACRO_LABEL_ID 362
#define TK_MACRO_LOCAL_ID 363
#define TK_MACRO_IDENT 364
#define TK_MACRO_ARG_IDENT 365
#define TK_MACRO_ARG_OTHER 366
#define TK_MACRO_CONST_VAL 367
#define TK_PASM_MARKER_START 368
#define TK_PIR_MARKER_START 369
#define TK_PCC_SUB 370
#define TK_PARROT_OP 371




/* Copy the first part of user declarations.  */
#line 1 "pir.y"


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
1. test the parser.
2. generate PBC, using Parrot_PackFile (and related) data structures.
3. handle branch/invoke instructions to calculate offsets etc.
4. handle freezing of PMC constants (representing subs)

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

static int evaluate_s(char * const s);
static int evaluate_c(lexer_state * const lexer, constant * const c);

static char *concat_strings(lexer_state * const lexer, char const * a, char const * b);

static void create_if_instr(yyscan_t yyscanner, lexer_state * const lexer, int invert,
                            int hasnull, char const * const name, char const * const label);

static void do_strength_reduction(yyscan_t yyscanner);
static int check_value(constant * const c, int val);

static void check_first_arg_direction(yyscan_t yyscanner, char const * const opname);

static int check_op_args_for_symbols(yyscan_t yyscanner);
static int get_opinfo(yyscan_t yyscanner);

/* names of the Parrot types. Note that pir_type_namwes is global,
 * but it's read-only, so that's fine.
 */
static char const * const pir_type_names[] = { "int", "num", "string", "pmc" };


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
#line 235 "pir.y"
{
    double              dval;
    int                 ival;
    char   const       *sval;
    struct constant    *cval;
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
#line 583 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 596 "pirparser.c"

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
#define YYLAST   962

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  137
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  161
/* YYNRULES -- Number of rules.  */
#define YYNRULES  408
/* YYNRULES -- Number of states.  */
#define YYNSTATES  635

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   372

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   128,     2,     2,     2,   133,   135,     2,
     117,   118,   132,   130,   119,   127,   126,   131,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   123,
       2,   120,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   121,     2,   122,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   124,   134,   125,   129,     2,     2,     2,
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
     115,   116,   136
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     9,    13,    14,    16,    18,    22,
      24,    26,    28,    30,    32,    34,    36,    38,    40,    42,
      46,    54,    57,    58,    60,    62,    66,    68,    69,    71,
      73,    76,    79,    81,    83,    86,    90,    93,    96,    99,
     102,   107,   112,   113,   115,   117,   121,   123,   130,   132,
     135,   137,   139,   140,   143,   145,   147,   149,   151,   153,
     155,   157,   159,   164,   167,   170,   173,   176,   179,   181,
     183,   185,   187,   188,   191,   196,   199,   200,   203,   205,
     207,   209,   214,   216,   217,   220,   223,   225,   227,   229,
     231,   233,   235,   237,   239,   241,   243,   245,   247,   249,
     251,   253,   255,   257,   261,   262,   266,   267,   269,   271,
     275,   277,   279,   282,   284,   288,   289,   292,   294,   296,
     298,   301,   303,   306,   309,   313,   317,   320,   323,   325,
     327,   329,   331,   332,   334,   336,   340,   344,   346,   348,
     350,   352,   354,   356,   359,   363,   365,   369,   376,   381,
     388,   391,   395,   399,   403,   407,   411,   416,   421,   426,
     430,   434,   438,   442,   446,   450,   454,   459,   465,   470,
     475,   479,   483,   487,   491,   495,   499,   503,   507,   510,
     516,   522,   528,   534,   540,   546,   552,   558,   564,   569,
     575,   580,   585,   590,   595,   600,   605,   610,   615,   620,
     625,   630,   635,   640,   644,   648,   652,   656,   660,   664,
     668,   672,   676,   680,   684,   688,   690,   692,   694,   696,
     698,   700,   704,   709,   711,   715,   718,   719,   721,   727,
     729,   731,   733,   742,   743,   745,   747,   750,   754,   758,
     761,   767,   768,   771,   772,   774,   776,   779,   783,   785,
     788,   792,   796,   798,   800,   802,   807,   810,   812,   814,
     816,   818,   820,   822,   824,   826,   830,   831,   833,   835,
     839,   842,   843,   846,   848,   850,   852,   855,   857,   859,
     861,   863,   865,   869,   873,   877,   881,   882,   884,   886,
     890,   892,   894,   898,   901,   903,   909,   915,   916,   918,
     920,   923,   927,   928,   930,   932,   935,   939,   940,   943,
     945,   948,   949,   951,   955,   958,   960,   962,   965,   968,
     973,   978,   983,   988,   990,   992,   994,   996,   998,  1000,
    1002,  1004,  1006,  1008,  1010,  1012,  1014,  1016,  1018,  1020,
    1022,  1024,  1026,  1028,  1030,  1032,  1034,  1036,  1038,  1040,
    1042,  1044,  1046,  1048,  1050,  1052,  1054,  1056,  1058,  1060,
    1062,  1064,  1066,  1068,  1070,  1072,  1074,  1076,  1078,  1080,
    1082,  1084,  1086,  1088,  1090,  1092,  1094,  1096,  1098,  1100,
    1102,  1104,  1106,  1108,  1110,  1112,  1114,  1116,  1118,  1120,
    1122,  1124,  1126,  1128,  1131,  1133,  1135,  1138,  1140,  1143,
    1145,  1148,  1151,  1154,  1156,  1158,  1160,  1164,  1166
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     138,     0,    -1,   114,   139,    -1,   113,   289,    -1,   140,
     141,   140,    -1,    -1,    34,    -1,   142,    -1,   141,    34,
     142,    -1,   164,    -1,   274,    -1,   160,    -1,   158,    -1,
     159,    -1,   156,    -1,   157,    -1,   143,    -1,   144,    -1,
     145,    -1,   106,    36,   112,    -1,   146,   117,   147,   118,
      34,   150,   103,    -1,   102,   284,    -1,    -1,   148,    -1,
     149,    -1,   148,   119,   149,    -1,   284,    -1,    -1,   151,
      -1,   152,    -1,   151,   152,    -1,   153,    34,    -1,   154,
      -1,   155,    -1,   105,   107,    -1,   104,   280,   108,    -1,
       5,    45,    -1,    10,    46,    -1,    11,    45,    -1,     3,
      45,    -1,     4,    45,   120,    45,    -1,    13,   121,   161,
     122,    -1,    -1,   162,    -1,   163,    -1,   162,   123,   163,
      -1,    45,    -1,   166,   168,    34,   171,   179,   165,    -1,
       7,    -1,     6,   167,    -1,   284,    -1,    45,    -1,    -1,
     168,   169,    -1,    84,    -1,    81,    -1,    82,    -1,    83,
      -1,    88,    -1,    90,    -1,    91,    -1,    89,    -1,    86,
     117,   167,   118,    -1,    85,   270,    -1,    87,   270,    -1,
      92,   271,    -1,    93,   271,    -1,    94,   271,    -1,   284,
      -1,    45,    -1,   206,    -1,   172,    -1,    -1,   172,   173,
      -1,     8,   174,   175,    34,    -1,   280,   284,    -1,    -1,
     175,   176,    -1,   248,    -1,   177,    -1,   178,    -1,   101,
     117,   170,   118,    -1,    95,    -1,    -1,   179,   180,    -1,
      35,   181,    -1,   181,    -1,   196,    -1,   212,    -1,   218,
      -1,   219,    -1,   223,    -1,   272,    -1,   249,    -1,   224,
      -1,   209,    -1,   195,    -1,   194,    -1,   191,    -1,   192,
      -1,   182,    -1,   193,    -1,   183,    -1,   109,   184,    34,
      -1,    -1,   117,   185,   118,    -1,    -1,   186,    -1,   187,
      -1,   186,   119,   187,    -1,   110,    -1,   111,    -1,   109,
     184,    -1,   188,    -1,   124,   189,   125,    -1,    -1,   189,
     190,    -1,    34,    -1,   111,    -1,   110,    -1,   109,   184,
      -1,    34,    -1,   157,    34,    -1,     1,    34,    -1,    43,
     281,    34,    -1,    28,   243,    34,    -1,   197,    34,    -1,
     198,   199,    -1,   208,    -1,    36,    -1,   200,    -1,   202,
      -1,    -1,   201,    -1,   203,    -1,   201,   119,   203,    -1,
     206,   120,   277,    -1,   204,    -1,   206,    -1,   278,    -1,
     284,    -1,   283,    -1,   205,    -1,   242,   206,    -1,   121,
     207,   122,    -1,   277,    -1,   207,   123,   277,    -1,   281,
     120,   198,   204,   119,   201,    -1,   281,   120,   198,   204,
      -1,   281,   120,   198,   206,   119,   201,    -1,   210,    34,
      -1,   281,   120,    46,    -1,   281,   120,    47,    -1,   281,
     120,    45,    -1,   281,   120,   211,    -1,   281,   120,   198,
      -1,   281,   120,   198,   206,    -1,   281,   120,   285,   206,
      -1,   281,   120,    48,   206,    -1,   281,   288,   277,    -1,
     281,    70,    46,    -1,   281,    70,    47,    -1,   281,    71,
      46,    -1,   281,    71,    47,    -1,   281,    70,   281,    -1,
     281,    71,   281,    -1,   281,   120,   286,   277,    -1,   281,
     120,   281,   287,   281,    -1,   285,   206,   120,   277,    -1,
      48,   206,   120,   277,    -1,    46,   287,   281,    -1,    47,
     287,   281,    -1,    45,   287,   281,    -1,    45,   287,    45,
      -1,    46,   287,    46,    -1,    47,   287,    47,    -1,    46,
     287,    47,    -1,    47,   287,    46,    -1,   213,    34,    -1,
     216,    43,    36,    44,   284,    -1,   216,    43,    37,    44,
     284,    -1,   216,    43,    38,    44,   284,    -1,   216,    43,
      39,    44,   284,    -1,   216,    43,    40,    44,   284,    -1,
     216,    43,    41,    44,   284,    -1,   216,    43,    42,    44,
     284,    -1,   216,    43,    44,    44,   284,    -1,   216,    43,
      43,    44,   284,    -1,   216,   278,   217,   284,    -1,   216,
      43,    48,   217,   284,    -1,   216,    36,   217,   284,    -1,
     216,   283,   217,   284,    -1,   216,    37,   217,   284,    -1,
     216,    38,   217,   284,    -1,   216,    39,   217,   284,    -1,
     216,    40,   217,   284,    -1,   216,    41,   217,   284,    -1,
     216,    42,   217,   284,    -1,   216,    44,    44,   284,    -1,
     216,    44,   119,   284,    -1,   216,    43,    44,   284,    -1,
     216,    43,   119,   284,    -1,   216,   214,    44,   284,    -1,
     281,   279,   277,    -1,    46,   279,   281,    -1,    47,   279,
     281,    -1,    45,   279,   281,    -1,    46,   279,    46,    -1,
      46,   279,    47,    -1,    47,   279,    46,    -1,    47,   279,
      47,    -1,    45,   279,    45,    -1,    45,   279,   215,    -1,
      46,   279,    45,    -1,    47,   279,    45,    -1,    46,    -1,
      47,    -1,    41,    -1,    42,    -1,    44,    -1,   119,    -1,
      44,   284,    34,    -1,    12,   280,   220,    34,    -1,   221,
      -1,   220,   119,   221,    -1,   284,   222,    -1,    -1,    95,
      -1,     9,    45,   119,   242,    34,    -1,   225,    -1,   226,
      -1,   235,    -1,    26,    34,   227,   230,    34,   232,    27,
      34,    -1,    -1,   228,    -1,   229,    -1,   228,   229,    -1,
      30,   258,    34,    -1,    29,   242,   231,    -1,    32,   242,
      -1,    14,   242,    34,    15,   241,    -1,    -1,   119,   242,
      -1,    -1,   233,    -1,   234,    -1,   233,   234,    -1,    31,
     246,    34,    -1,   219,    -1,   236,    34,    -1,   243,   120,
     237,    -1,   281,   120,   237,    -1,   237,    -1,   239,    -1,
     238,    -1,   242,   126,   241,   253,    -1,   240,   253,    -1,
     242,    -1,    45,    -1,   284,    -1,    48,    -1,    50,    -1,
      45,    -1,   284,    -1,    48,    -1,   117,   244,   118,    -1,
      -1,   245,    -1,   246,    -1,   245,   119,   246,    -1,   281,
     247,    -1,    -1,   247,   248,    -1,    99,    -1,   100,    -1,
      97,    -1,    96,   270,    -1,   250,    -1,   251,    -1,   260,
      -1,   252,    -1,   261,    -1,    18,   253,    34,    -1,    33,
     237,    34,    -1,    19,   253,    34,    -1,   117,   254,   118,
      -1,    -1,   255,    -1,   256,    -1,   255,   119,   256,    -1,
     258,    -1,   257,    -1,    45,    52,   259,    -1,   259,   268,
      -1,   277,    -1,    24,    34,   265,    25,    34,    -1,    22,
      34,   262,    23,    34,    -1,    -1,   263,    -1,   264,    -1,
     263,   264,    -1,    20,   258,    34,    -1,    -1,   266,    -1,
     267,    -1,   266,   267,    -1,    21,   258,    34,    -1,    -1,
     268,   269,    -1,    98,    -1,    96,   270,    -1,    -1,   271,
      -1,   117,    45,   118,    -1,   273,    34,    -1,   274,    -1,
     275,    -1,    17,   276,    -1,    16,   276,    -1,    37,   284,
     120,    46,    -1,    38,   284,   120,    47,    -1,    40,   284,
     120,    45,    -1,    45,   284,   120,   278,    -1,   281,    -1,
     278,    -1,    45,    -1,    46,    -1,    47,    -1,    53,    -1,
      54,    -1,    55,    -1,    56,    -1,    58,    -1,    57,    -1,
      37,    -1,    38,    -1,    39,    -1,    40,    -1,   282,    -1,
     283,    -1,   284,    -1,    48,    -1,    49,    -1,    51,    -1,
      50,    -1,    36,    -1,   285,    -1,    41,    -1,    42,    -1,
      44,    -1,    37,    -1,    38,    -1,    40,    -1,    39,    -1,
      43,    -1,   127,    -1,   128,    -1,   129,    -1,   130,    -1,
     127,    -1,   131,    -1,   132,    -1,   133,    -1,   134,    -1,
     135,    -1,   129,    -1,   136,    -1,    66,    -1,    59,    -1,
      60,    -1,    61,    -1,    63,    -1,    64,    -1,    62,    -1,
      65,    -1,    54,    -1,    56,    -1,    55,    -1,    58,    -1,
      57,    -1,    53,    -1,    72,    -1,    73,    -1,    74,    -1,
      75,    -1,    78,    -1,    76,    -1,    77,    -1,    79,    -1,
      80,    -1,    68,    -1,    69,    -1,    67,    -1,   290,   291,
      -1,   140,    -1,   292,    -1,   291,   292,    -1,   293,    -1,
     160,    34,    -1,   223,    -1,   157,    34,    -1,    35,   294,
      -1,   295,   294,    -1,   297,    -1,   191,    -1,   297,    -1,
     296,   168,    35,    -1,   115,    -1,   198,   200,    34,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   539,   539,   540,   545,   551,   552,   555,   556,   559,
     560,   561,   562,   563,   564,   565,   566,   573,   574,   577,
     581,   587,   594,   595,   598,   599,   602,   606,   607,   610,
     611,   614,   617,   618,   621,   625,   636,   640,   642,   648,
     652,   656,   661,   662,   666,   668,   672,   676,   682,   686,
     690,   691,   694,   695,   698,   700,   702,   704,   706,   708,
     710,   712,   714,   716,   718,   720,   722,   724,   728,   729,
     730,   733,   745,   746,   749,   753,   758,   759,   763,   764,
     765,   768,   775,   781,   782,   792,   794,   797,   798,   799,
     800,   801,   802,   803,   804,   805,   806,   807,   808,   809,
     810,   811,   817,   820,   825,   826,   831,   832,   835,   837,
     845,   853,   854,   856,   859,   865,   866,   875,   876,   877,
     878,   886,   890,   894,   903,   910,   917,   920,   921,   924,
     933,   940,   943,   944,   947,   948,   951,   987,   989,   996,
     998,  1003,  1005,  1009,  1032,  1036,  1038,  1047,  1058,  1070,
    1080,  1083,  1092,  1101,  1106,  1111,  1132,  1172,  1190,  1197,
    1202,  1213,  1224,  1235,  1246,  1251,  1256,  1261,  1270,  1289,
    1323,  1325,  1327,  1329,  1331,  1333,  1335,  1337,  1342,  1351,
    1353,  1355,  1357,  1359,  1361,  1363,  1365,  1367,  1369,  1381,
    1386,  1388,  1390,  1392,  1394,  1396,  1398,  1400,  1402,  1404,
    1406,  1408,  1410,  1441,  1467,  1475,  1484,  1493,  1495,  1497,
    1499,  1501,  1505,  1510,  1512,  1517,  1518,  1521,  1522,  1525,
    1526,  1529,  1537,  1541,  1543,  1547,  1551,  1552,  1555,  1570,
    1574,  1575,  1578,  1591,  1592,  1596,  1598,  1602,  1606,  1608,
    1610,  1616,  1617,  1622,  1623,  1627,  1629,  1638,  1640,  1644,
    1648,  1652,  1656,  1662,  1663,  1666,  1694,  1701,  1703,  1712,
    1729,  1731,  1733,  1737,  1746,  1751,  1756,  1757,  1761,  1763,
    1767,  1772,  1773,  1777,  1779,  1781,  1783,  1793,  1797,  1798,
    1799,  1800,  1803,  1808,  1819,  1826,  1831,  1832,  1836,  1838,
    1842,  1843,  1846,  1850,  1854,  1858,  1867,  1877,  1878,  1883,
    1885,  1890,  1895,  1896,  1900,  1902,  1906,  1912,  1913,  1917,
    1919,  1927,  1928,  1932,  1936,  1939,  1940,  1943,  1947,  1951,
    1953,  1955,  1957,  1965,  1966,  1970,  1971,  1972,  1975,  1976,
    1977,  1978,  1979,  1980,  1983,  1984,  1985,  1986,  1994,  1997,
    1998,  2011,  2012,  2013,  2014,  2018,  2019,  2022,  2023,  2024,
    2025,  2026,  2027,  2028,  2029,  2032,  2033,  2034,  2037,  2038,
    2039,  2040,  2041,  2042,  2043,  2044,  2045,  2046,  2047,  2048,
    2049,  2050,  2051,  2052,  2053,  2054,  2055,  2056,  2057,  2058,
    2059,  2065,  2066,  2067,  2068,  2069,  2070,  2071,  2072,  2073,
    2074,  2075,  2076,  2088,  2096,  2100,  2101,  2104,  2105,  2106,
    2107,  2110,  2112,  2113,  2116,  2117,  2120,  2124,  2129
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
  "\".nci_call\"", "\".tailcall\"", "\"\\n\"", "\"label\"",
  "\"identifier\"", "\"int\"", "\"num\"", "\"pmc\"", "\"string\"",
  "\"if\"", "\"unless\"", "\"null\"", "\"goto\"", "\"string constant\"",
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
  "sub_head", "sub_id", "sub_flags", "sub_flag", "multi_type",
  "parameter_list", "parameters", "parameter", "param", "param_flags",
  "param_flag", "invocant_param", "unique_reg_flag", "instructions",
  "instruction", "statement", "expansion_stat", "macro_expansion",
  "opt_macro_args", "macro_args", "macro_arg_list", "macro_arg",
  "braced_arg", "braced_contents", "braced_item", "empty_stat",
  "location_stat", "error_stat", "null_stat", "getresults_stat",
  "parrot_stat", "parrot_instruction", "parrot_op", "opt_op_args",
  "op_args", "parrot_op_args", "keylist_assignment", "op_arg",
  "op_arg_expr", "keyaccess", "keylist", "keys", "parrot_op_assign",
  "assignment_stat", "assignment", "binary_expr", "conditional_stat",
  "conditional_instr", "condition", "int_or_num", "if_unless", "then",
  "goto_stat", "local_decl", "local_id_list", "local_id", "has_unique_reg",
  "lex_decl", "invocation_stat", "invocation", "long_invocation_stat",
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
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "expression", "constant", "rel_op", "type", "target",
  "symbol", "reg", "identifier", "keyword", "unop", "binop",
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
     365,   366,   367,   368,   369,   370,   371,    40,    41,    44,
      61,    91,    93,    59,   123,   125,    46,    45,    33,   126,
      43,    47,    42,    37,   124,    38,   372
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   137,   138,   138,   139,   140,   140,   141,   141,   142,
     142,   142,   142,   142,   142,   142,   142,   143,   143,   144,
     145,   146,   147,   147,   148,   148,   149,   150,   150,   151,
     151,   152,   153,   153,   154,   155,   156,   157,   157,   158,
     159,   160,   161,   161,   162,   162,   163,   164,   165,   166,
     167,   167,   168,   168,   169,   169,   169,   169,   169,   169,
     169,   169,   169,   169,   169,   169,   169,   169,   170,   170,
     170,   171,   172,   172,   173,   174,   175,   175,   176,   176,
     176,   177,   178,   179,   179,   180,   180,   181,   181,   181,
     181,   181,   181,   181,   181,   181,   181,   181,   181,   181,
     181,   181,   182,   183,   184,   184,   185,   185,   186,   186,
     187,   187,   187,   187,   188,   189,   189,   190,   190,   190,
     190,   191,   192,   193,   194,   195,   196,   197,   197,   198,
     199,   199,   200,   200,   201,   201,   202,   203,   203,   204,
     204,   204,   204,   205,   206,   207,   207,   208,   208,   208,
     209,   210,   210,   210,   210,   210,   210,   210,   210,   210,
     210,   210,   210,   210,   210,   210,   210,   210,   210,   210,
     211,   211,   211,   211,   211,   211,   211,   211,   212,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   213,   213,   213,   213,   213,   213,   213,
     213,   213,   213,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   215,   215,   216,   216,   217,
     217,   218,   219,   220,   220,   221,   222,   222,   223,   224,
     225,   225,   226,   227,   227,   228,   228,   229,   230,   230,
     230,   231,   231,   232,   232,   233,   233,   234,   234,   235,
     236,   236,   236,   237,   237,   238,   239,   240,   240,   241,
     241,   241,   241,   242,   242,   243,   244,   244,   245,   245,
     246,   247,   247,   248,   248,   248,   248,   249,   250,   250,
     250,   250,   251,   251,   252,   253,   254,   254,   255,   255,
     256,   256,   257,   258,   259,   260,   261,   262,   262,   263,
     263,   264,   265,   265,   266,   266,   267,   268,   268,   269,
     269,   270,   270,   271,   272,   273,   273,   274,   275,   276,
     276,   276,   276,   277,   277,   278,   278,   278,   279,   279,
     279,   279,   279,   279,   280,   280,   280,   280,   281,   282,
     282,   283,   283,   283,   283,   284,   284,   285,   285,   285,
     285,   285,   285,   285,   285,   286,   286,   286,   287,   287,
     287,   287,   287,   287,   287,   287,   287,   287,   287,   287,
     287,   287,   287,   287,   287,   287,   287,   287,   287,   287,
     287,   288,   288,   288,   288,   288,   288,   288,   288,   288,
     288,   288,   288,   289,   290,   291,   291,   292,   292,   292,
     292,   293,   293,   293,   294,   294,   295,   296,   297
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     3,     0,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       7,     2,     0,     1,     1,     3,     1,     0,     1,     1,
       2,     2,     1,     1,     2,     3,     2,     2,     2,     2,
       4,     4,     0,     1,     1,     3,     1,     6,     1,     2,
       1,     1,     0,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     2,     2,     2,     2,     2,     1,     1,
       1,     1,     0,     2,     4,     2,     0,     2,     1,     1,
       1,     4,     1,     0,     2,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     0,     3,     0,     1,     1,     3,
       1,     1,     2,     1,     3,     0,     2,     1,     1,     1,
       2,     1,     2,     2,     3,     3,     2,     2,     1,     1,
       1,     1,     0,     1,     1,     3,     3,     1,     1,     1,
       1,     1,     1,     2,     3,     1,     3,     6,     4,     6,
       2,     3,     3,     3,     3,     3,     4,     4,     4,     3,
       3,     3,     3,     3,     3,     3,     4,     5,     4,     4,
       3,     3,     3,     3,     3,     3,     3,     3,     2,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     4,     5,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     1,     1,     1,     1,     1,
       1,     3,     4,     1,     3,     2,     0,     1,     5,     1,
       1,     1,     8,     0,     1,     1,     2,     3,     3,     2,
       5,     0,     2,     0,     1,     1,     2,     3,     1,     2,
       3,     3,     1,     1,     1,     4,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     0,     1,     1,     3,
       2,     0,     2,     1,     1,     1,     2,     1,     1,     1,
       1,     1,     3,     3,     3,     3,     0,     1,     1,     3,
       1,     1,     3,     2,     1,     5,     5,     0,     1,     1,
       2,     3,     0,     1,     1,     2,     3,     0,     2,     1,
       2,     0,     1,     3,     2,     1,     1,     2,     2,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     2,     1,     1,     2,     1,     2,     1,
       2,     2,     2,     1,     1,     1,     3,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     5,     5,     0,     6,   394,     3,     0,     2,     0,
       1,     0,     0,     0,     0,     0,   129,   407,     0,     0,
     132,   399,   393,   395,   397,     0,    52,   403,     0,     0,
       0,     0,     0,     0,     0,     5,     7,    16,    17,    18,
       0,    14,    15,    12,    13,    11,     9,    52,    10,     0,
      37,    38,    42,   121,   404,   401,   405,   400,   398,   345,
     350,   351,   353,   352,   347,   348,   354,   349,   325,   326,
     327,   341,   342,   344,   343,     0,     0,   133,   134,   137,
     142,   138,     0,   139,   141,   140,   346,   396,   402,     0,
      39,     0,    36,    51,    49,    50,     0,     0,     0,     0,
     317,    21,     0,     6,     4,    22,     0,     0,    46,     0,
      43,    44,   341,     0,   145,   324,   323,   338,   339,   340,
     408,     0,   143,   406,    55,    56,    57,    54,   311,     0,
     311,    58,    61,    59,    60,     0,     0,     0,    53,     0,
       0,     0,     0,     0,    19,     8,     0,    23,    24,    26,
      72,   264,     0,   263,    41,     0,   144,     0,   135,     0,
      63,   312,     0,    64,    65,    66,    67,    40,     0,     0,
       0,     0,     0,     0,    83,    71,   228,    45,   146,     0,
       0,   319,   320,   321,   322,    27,    25,     0,     0,    73,
     313,    62,     0,     0,     0,    28,    29,     0,    32,    33,
       0,    48,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   345,   347,   348,   354,   349,   258,   341,   104,
     266,     0,    47,    84,    86,   100,   102,    98,    99,   101,
      97,    96,    87,     0,   132,   128,    95,     0,    88,     0,
       0,    89,    90,    91,    94,   229,   230,   231,     0,   252,
     254,   253,     0,   257,     0,    93,   277,   278,   280,   279,
     281,    92,     0,   315,   316,     0,   340,   346,   334,   335,
     336,   337,    76,     0,     0,    34,    20,    30,    31,   123,
       0,   318,   286,     0,     0,   297,   302,   233,     0,     0,
      85,     0,     0,     0,   106,     0,     0,   267,   268,   271,
     122,   126,   127,   130,   131,   138,   150,   178,   345,   350,
     351,   353,   352,   347,   348,   354,   349,   325,   326,   327,
       0,     0,     0,   339,   249,   256,     0,     0,   314,   392,
     390,   391,     0,     0,   381,   382,   383,   384,   386,   387,
     385,   388,   389,     0,     0,     0,     0,    75,    35,     0,
     223,   226,   325,     0,   287,   288,   291,   290,   307,   294,
     282,   284,     0,     0,   298,   299,     0,     0,   303,   304,
       0,     0,   234,   235,   125,   283,   124,   221,     0,   104,
     110,   111,   115,     0,   107,   108,   113,   103,   265,     0,
     270,     0,   219,   220,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   328,   329,   330,   331,   333,   332,
       0,     0,     0,     0,     0,     0,     0,   262,   260,   261,
       0,   259,   250,   160,   161,   164,   162,   163,   165,   153,
     151,   152,   341,   355,   356,   357,   155,   154,   251,     0,
     346,     0,   159,     0,    74,    82,   311,   275,   273,   274,
       0,    77,    79,    80,    78,   222,     0,   227,   225,     0,
     285,     0,   293,     0,     0,   300,     0,     0,   305,     0,
       0,     0,     0,     0,   236,   169,   112,     0,   105,     0,
     269,   272,   136,   190,   192,   193,   194,   195,   196,   197,
       0,     0,     0,     0,     0,     0,     0,     0,   349,   200,
       0,   201,   198,   199,   211,   215,   216,   212,   206,   213,
     207,   208,   204,   214,   209,   210,   205,   202,   188,   203,
     191,   255,   380,   375,   377,   376,   379,   378,   368,   369,
     370,   373,   371,   372,   374,   367,   359,   365,   358,   360,
     361,   362,   363,   364,   366,     0,     0,     0,   158,   148,
     156,     0,   157,   166,   168,   276,     0,   224,   292,   289,
     311,   309,   308,   301,   296,   306,   295,   237,     0,   241,
     239,   243,   117,   104,   119,   118,   114,   116,   109,   179,
     180,   181,   182,   183,   184,   185,   187,   186,   189,   173,
     172,   174,   176,   170,   177,   175,   171,     0,     0,   167,
      69,     0,    70,    68,   310,     0,     0,   238,     0,   248,
       0,   244,   245,   120,   147,   149,    81,     0,   242,     0,
       0,   246,   240,   247,   232
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     8,     5,    35,    36,    37,    38,    39,    40,
     146,   147,   148,   194,   195,   196,   197,   198,   199,    41,
      18,    43,    44,    19,   109,   110,   111,    46,   222,    47,
      94,    89,   138,   611,   174,   175,   189,   272,   346,   461,
     462,   463,   187,   223,   224,   225,   226,   295,   383,   384,
     385,   386,   487,   587,    54,   228,   229,   230,   231,   232,
     233,    20,   302,    76,    77,   304,    78,    79,    80,    81,
     113,   235,   236,   237,   447,   238,   239,   320,   517,   240,
     394,   241,   242,   349,   350,   468,    21,   244,   245,   246,
     371,   372,   373,   483,   617,   620,   621,   622,   247,   248,
     249,   250,   251,   252,   430,    82,   254,   296,   297,   298,
     390,   464,   255,   256,   257,   258,   283,   353,   354,   355,
     356,   357,   358,   259,   260,   363,   364,   365,   367,   368,
     369,   472,   572,   160,   161,   261,   262,    48,   264,   100,
     359,   115,   420,   273,   116,   117,   118,   119,    86,   451,
     555,   344,     6,     7,    22,    23,    24,    55,    25,    26,
      27
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -558
static const yytype_int16 yypact[] =
{
      24,    -2,    -2,    47,  -558,  -558,  -558,     6,  -558,    33,
    -558,    29,    40,    44,   -24,    -1,  -558,  -558,    66,    79,
     455,  -558,     6,  -558,  -558,    -1,  -558,  -558,    88,    99,
     107,   411,    65,   381,   121,   134,  -558,  -558,  -558,  -558,
      68,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,    58,
    -558,  -558,   138,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,    67,  -558,  -558,  -558,   728,   152,    74,  -558,  -558,
    -558,  -558,    73,  -558,  -558,    86,  -558,  -558,  -558,   611,
    -558,    69,  -558,  -558,  -558,  -558,   381,   381,   381,   381,
    -558,  -558,    75,    33,  -558,   381,   382,   396,  -558,    90,
      72,  -558,  -558,    38,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,   455,  -558,  -558,  -558,  -558,  -558,  -558,    91,    96,
      91,  -558,  -558,  -558,  -558,    91,    91,    91,  -558,   170,
      98,   100,   101,   102,  -558,  -558,   106,   108,  -558,  -558,
    -558,  -558,   192,  -558,  -558,   138,  -558,   728,  -558,   197,
    -558,  -558,   411,  -558,  -558,  -558,  -558,  -558,   199,   200,
     198,    70,   212,   381,  -558,   240,  -558,  -558,  -558,   131,
     132,  -558,  -558,  -558,  -558,    60,  -558,   514,   142,  -558,
    -558,  -558,   142,   144,   149,    60,  -558,   220,  -558,  -558,
     221,  -558,   142,    65,   139,   139,   223,   224,   225,   156,
     161,   600,   292,   744,   768,   896,   381,  -558,   -59,   157,
     896,   241,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,   261,   455,  -558,  -558,   279,  -558,   280,
     784,  -558,  -558,  -558,  -558,  -558,  -558,  -558,   281,  -558,
    -558,  -558,   139,   151,   201,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,   282,  -558,  -558,   683,   -27,    73,  -558,  -558,
    -558,  -558,  -558,   381,   210,  -558,  -558,  -558,  -558,  -558,
     381,  -558,   800,   285,   286,   302,   303,   315,   310,   312,
    -558,   332,   333,   229,    16,   334,   230,   250,  -558,  -558,
    -558,  -558,  -558,  -558,  -558,   253,  -558,  -558,   -23,   -23,
     -23,   -23,   -23,   -23,   -23,   228,   -21,    93,    93,    93,
     340,   -23,    93,   -23,  -558,  -558,   912,   161,  -558,  -558,
    -558,  -558,   314,   531,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,   243,   728,   268,    23,  -558,  -558,   -12,
    -558,   300,   347,   283,   288,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,   728,   377,   302,  -558,   728,   380,   303,  -558,
     728,    34,   315,  -558,  -558,  -558,  -558,  -558,   728,   157,
    -558,  -558,  -558,   290,   291,  -558,  -558,  -558,  -558,   896,
      59,   728,  -558,  -558,   381,   381,   381,   381,   381,   381,
     381,   365,   367,   368,   370,   371,   383,   384,   386,   644,
     -23,   381,   381,   381,  -558,  -558,  -558,  -558,  -558,  -558,
     816,   832,   848,   381,   381,   728,   381,  -558,  -558,  -558,
     139,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,   599,
     613,   613,   -59,  -558,  -558,  -558,   455,  -558,  -558,   613,
      73,   728,  -558,   728,  -558,  -558,    91,  -558,  -558,  -558,
     325,  -558,  -558,  -558,  -558,  -558,   381,  -558,  -558,   728,
    -558,   800,    45,   409,   423,  -558,   424,   443,  -558,   444,
     396,   396,   396,   445,  -558,  -558,  -558,   -16,  -558,    16,
    -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
     381,   381,   381,   381,   381,   381,   381,   381,   381,  -558,
     381,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,  -558,  -558,   260,   864,   880,  -558,   326,
     388,   896,  -558,  -558,  -558,  -558,   196,  -558,  -558,  -558,
      91,  -558,  -558,  -558,  -558,  -558,  -558,  -558,   474,   390,
    -558,    28,  -558,   157,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,  -558,  -558,  -558,  -558,   455,   455,  -558,
    -558,   393,  -558,  -558,  -558,   497,   396,  -558,   896,  -558,
     462,    28,  -558,  -558,    74,    74,  -558,   912,  -558,   479,
     480,  -558,  -558,  -558,  -558
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -558,  -558,  -558,    25,  -558,   413,  -558,  -558,  -558,  -558,
    -558,  -558,   345,  -558,  -558,   324,  -558,  -558,  -558,  -558,
       5,  -558,  -558,    11,  -558,  -558,   372,  -558,  -558,  -558,
     358,   475,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -558,  -558,  -558,  -558,   317,  -558,  -558,  -373,  -558,  -558,
      46,  -558,  -558,  -558,  -162,  -558,  -558,  -558,  -558,  -558,
    -558,  -180,  -558,   295,  -432,  -558,   416,    95,  -558,   -56,
    -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,  -558,
    -241,  -558,  -557,  -558,    77,  -558,  -158,  -558,  -558,  -558,
    -558,  -558,   162,  -558,  -558,  -558,  -558,   -82,  -558,  -558,
    -198,  -558,  -558,  -558,   -83,   -99,   336,  -558,  -558,  -387,
    -558,   171,  -558,  -558,  -558,  -558,  -201,  -558,  -558,    89,
    -558,  -234,    97,  -558,  -558,  -558,  -558,   219,  -558,  -558,
     216,  -558,  -558,  -129,    35,  -558,  -558,  -157,  -558,   391,
     -66,   -17,  -188,  -147,  -159,  -558,   -15,   -20,  -177,  -558,
    -357,  -558,  -558,  -558,  -558,   563,  -558,   561,  -558,  -558,
      50
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -265
static const yytype_int16 yytable[] =
{
      85,   163,   490,    83,   284,    84,   486,   234,   152,   114,
     267,    95,   289,   101,    42,    11,    12,    13,   582,    14,
      45,   392,   465,   412,   619,   227,   122,     9,   265,   243,
     263,   234,     4,    53,   267,    16,    28,    29,    30,    31,
     202,    15,    16,    12,    13,   274,    14,    10,   480,   227,
      32,   325,   265,   243,   263,   280,   291,   454,  -264,   618,
     104,   299,    75,   481,   619,    56,   482,  -264,   395,   396,
     397,   398,   399,   400,    49,    56,   140,   141,   142,   143,
     424,   322,   426,   556,   557,   149,    50,   153,   253,    51,
    -263,   178,   561,   583,   584,   585,   393,    52,   413,  -263,
      57,    85,    96,    97,    83,    98,    84,   466,    42,   586,
      99,   253,   253,    58,    45,    68,    69,    70,   455,   456,
     457,    17,   458,   459,   460,   379,   380,   381,   473,   432,
     421,   422,   476,    90,   425,    33,   479,     1,     2,    34,
     382,   570,    95,   571,    91,   448,   414,   415,   416,   417,
     418,   419,    92,   149,   184,   456,   457,   102,   458,   459,
     156,   157,   293,   446,   192,   193,   450,   266,   103,   510,
     164,   165,   166,   435,   438,   624,   625,   107,   305,   268,
     269,   270,   271,   108,   449,   105,   120,   144,  -264,   139,
     153,   266,   221,   121,    75,   155,   292,    59,    60,    61,
      62,    63,    64,    65,    66,    67,   217,  -263,   159,   151,
     623,   345,   154,   162,    85,   167,   221,    83,   168,    84,
     169,   170,   171,   321,   172,   323,   176,   173,   253,   531,
     299,   629,    59,    60,    61,    62,    63,    64,    65,    66,
      67,   610,   179,   183,   253,   181,   185,   182,   188,   190,
     191,   275,   276,   347,   278,   279,   282,   285,   286,   287,
     351,   518,   522,   526,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   220,   294,   300,   410,   326,   452,   212,
      60,    61,    62,    63,    64,    65,    66,    67,   439,   440,
     441,   442,    72,    73,    74,   301,    59,    60,    61,    62,
      63,    64,    65,    66,    67,   599,   431,   153,   112,    72,
      73,    74,   485,   306,   307,   324,   328,    75,   348,   360,
     361,   327,   362,   266,   366,   492,  -129,   565,  -129,  -129,
    -129,  -129,  -129,  -129,  -129,  -129,  -129,  -129,  -129,  -129,
    -129,  -129,  -129,  -129,   374,   370,   375,   411,   388,   378,
      59,    60,    61,    62,    63,    64,    65,    66,    67,   529,
     433,   434,   112,    72,    73,    74,   376,   377,   387,   389,
     443,   444,   445,   391,   493,   494,   495,   496,   497,   498,
     499,   578,   579,   580,   423,   563,   558,   564,   453,   509,
     560,   511,   512,   513,   562,   467,   600,   603,   606,   469,
     474,   470,   609,   527,   528,   477,   530,   471,   488,   500,
     489,   501,   502,  -129,   503,   504,   150,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    85,   505,   506,    83,
     507,    84,    59,    60,    61,    62,    63,    64,    65,    66,
      67,   614,   566,   573,   151,   607,   351,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    93,   574,   575,   299,
     153,   153,   153,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,   134,   135,   136,   137,   576,   577,   581,
     589,   590,   591,   592,   593,   594,   595,   596,   597,   630,
     598,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,   608,   615,   616,
     612,   626,   627,   633,   634,   200,   145,   628,   186,   277,
     180,   201,   106,    11,    12,    13,   202,   177,   290,   303,
     203,    32,   204,   205,   484,   588,   206,   158,   207,   631,
     208,   559,   209,   567,   632,   288,   613,   210,    53,   211,
     212,    60,    61,    62,    63,   213,   214,   215,   216,   217,
     569,   491,   218,    72,    73,    74,   568,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    75,   436,   437,   112,
      72,    73,    74,   475,   478,    87,    88,    85,    85,     0,
      83,    83,    84,    84,   281,     0,   153,     0,     0,     0,
       0,   200,     0,     0,     0,     0,     0,   431,     0,    11,
      12,    13,   202,     0,     0,     0,   203,    32,   204,   205,
       0,     0,   206,   219,   207,     0,   208,     0,   209,     0,
       0,   220,     0,   210,    53,     0,   212,    60,    61,    62,
      63,   213,   214,   215,   216,   217,   123,     0,   218,    72,
      73,    74,   532,   533,   534,   535,   536,   537,   538,   539,
     540,   541,   542,   543,   544,   545,   532,   533,   534,   535,
     536,   537,   538,   539,   540,   541,   542,   543,   544,   545,
      59,    60,    61,    62,    63,    64,    65,    66,   508,     0,
       0,     0,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,   137,     0,     0,     0,   219,
       0,     0,     0,     0,     0,     0,  -258,   220,     0,     0,
       0,     0,     0,     0,     0,     0,   546,     0,   547,   548,
     549,   550,   551,   552,   553,   554,     0,     0,     0,     0,
     546,     0,   547,   548,   549,   550,   551,   552,   553,   554,
     329,   330,   331,   332,   333,   334,   335,   336,   337,   338,
     339,   340,   341,   342,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,   112,    72,    73,    74,
    -217,  -217,  -217,  -217,  -217,  -217,  -217,  -217,  -217,  -217,
    -217,  -217,  -217,  -217,  -217,  -217,     0,     0,     0,     0,
       0,     0,     0,   343,  -218,  -218,  -218,  -218,  -218,  -218,
    -218,  -218,  -218,  -218,  -218,  -218,  -218,  -218,  -218,  -218,
     308,   309,   310,   311,   312,   313,   314,   315,   316,   317,
     318,   319,   112,    72,    73,    74,    59,    60,    61,    62,
      63,    64,    65,    66,    67,   352,    69,    70,   112,    72,
      73,    74,    59,    60,    61,    62,    63,    64,    65,    66,
      67,   514,   515,   516,   112,    72,    73,    74,    59,    60,
      61,    62,    63,    64,    65,    66,    67,   519,   520,   521,
     112,    72,    73,    74,    59,    60,    61,    62,    63,    64,
      65,    66,    67,   523,   524,   525,   112,    72,    73,    74,
      59,    60,    61,    62,    63,    64,    65,    66,    67,     0,
     601,   602,   112,    72,    73,    74,    59,    60,    61,    62,
      63,    64,    65,    66,    67,     0,   604,   605,   112,    72,
      73,    74,    59,    60,    61,    62,    63,    64,    65,    66,
      67,     0,     0,     0,   112,    72,    73,    74,    59,    60,
      61,    62,    63,    64,    65,    66,    67,   427,     0,     0,
     428,     0,   429
};

static const yytype_int16 yycheck[] =
{
      20,   130,   389,    20,   205,    20,   379,   187,   107,    75,
     187,    31,   210,    33,     9,     9,    10,    11,    34,    13,
       9,    44,    34,    44,   581,   187,    82,     2,   187,   187,
     187,   211,    34,    34,   211,    36,     3,     4,     5,     6,
      12,    35,    36,    10,    11,   192,    13,     0,    14,   211,
      17,   252,   211,   211,   211,   202,   215,    34,   117,    31,
      35,   220,   121,    29,   621,    15,    32,   126,   309,   310,
     311,   312,   313,   314,    45,    25,    96,    97,    98,    99,
     321,   240,   323,   440,   441,   105,    46,   107,   187,    45,
     117,   157,   449,   109,   110,   111,   119,   121,   119,   126,
      34,   121,    37,    38,   121,    40,   121,   119,   103,   125,
      45,   210,   211,    34,   103,    45,    46,    47,    95,    96,
      97,   115,    99,   100,   101,   109,   110,   111,   362,   327,
     318,   319,   366,    45,   322,   102,   370,   113,   114,   106,
     124,    96,   162,    98,    45,   343,    53,    54,    55,    56,
      57,    58,    45,   173,   171,    96,    97,    36,    99,   100,
     122,   123,   218,   343,   104,   105,   343,   187,    34,   410,
     135,   136,   137,   332,   333,   607,   608,   119,   234,    37,
      38,    39,    40,    45,   343,   117,    34,   112,   121,   120,
     210,   211,   187,   119,   121,   123,   216,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,   121,   117,    48,
     583,   267,   122,   117,   234,    45,   211,   234,   120,   234,
     120,   120,   120,   240,   118,   240,    34,   119,   327,   430,
     389,   618,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    45,    45,   343,    46,    34,    47,     8,   118,
     118,   107,   103,   273,    34,    34,   117,    34,    34,    34,
     280,   420,   421,   422,    36,    37,    38,    39,    40,    41,
      42,    43,    44,   117,   117,    34,    48,   126,   344,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    34,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,   326,   327,    48,    49,
      50,    51,   378,    34,    34,    34,    34,   121,   108,    34,
      34,   120,    20,   343,    21,   391,    34,   456,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    34,    30,    34,   119,   118,   120,
      36,    37,    38,    39,    40,    41,    42,    43,    44,   425,
      46,    47,    48,    49,    50,    51,    34,    34,    34,   119,
     127,   128,   129,   120,   394,   395,   396,   397,   398,   399,
     400,   480,   481,   482,    44,   451,   442,   453,   120,   409,
     446,   411,   412,   413,   450,    95,   555,   556,   557,    52,
      23,   118,   561,   423,   424,    25,   426,   119,   118,    44,
     119,    44,    44,   121,    44,    44,    34,    36,    37,    38,
      39,    40,    41,    42,    43,    44,   446,    44,    44,   446,
      44,   446,    36,    37,    38,    39,    40,    41,    42,    43,
      44,   570,   117,    34,    48,   119,   466,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    34,    34,   618,
     480,   481,   482,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    34,    34,    34,
     500,   501,   502,   503,   504,   505,   506,   507,   508,    27,
     510,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,   119,    34,   119,
     566,   118,    15,    34,    34,     1,   103,   616,   173,   195,
     162,     7,    47,     9,    10,    11,    12,   155,   211,   234,
      16,    17,    18,    19,   372,   489,    22,   121,    24,   621,
      26,   446,    28,   466,   627,   209,   566,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
     471,   390,    48,    49,    50,    51,   469,    36,    37,    38,
      39,    40,    41,    42,    43,    44,   121,    46,    47,    48,
      49,    50,    51,   364,   368,    22,    25,   607,   608,    -1,
     607,   608,   607,   608,   203,    -1,   616,    -1,    -1,    -1,
      -1,     1,    -1,    -1,    -1,    -1,    -1,   627,    -1,     9,
      10,    11,    12,    -1,    -1,    -1,    16,    17,    18,    19,
      -1,    -1,    22,   109,    24,    -1,    26,    -1,    28,    -1,
      -1,   117,    -1,    33,    34,    -1,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    35,    -1,    48,    49,
      50,    51,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    -1,
      -1,    -1,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    -1,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,   117,   117,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   127,    -1,   129,   130,
     131,   132,   133,   134,   135,   136,    -1,    -1,    -1,    -1,
     127,    -1,   129,   130,   131,   132,   133,   134,   135,   136,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   120,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    -1,
      46,    47,    48,    49,    50,    51,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    -1,    46,    47,    48,    49,
      50,    51,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    -1,    -1,    -1,    48,    49,    50,    51,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    -1,    -1,
      48,    -1,    50
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   113,   114,   138,    34,   140,   289,   290,   139,   140,
       0,     9,    10,    11,    13,    35,    36,   115,   157,   160,
     198,   223,   291,   292,   293,   295,   296,   297,     3,     4,
       5,     6,    17,   102,   106,   141,   142,   143,   144,   145,
     146,   156,   157,   158,   159,   160,   164,   166,   274,    45,
      46,    45,   121,    34,   191,   294,   297,    34,    34,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,   121,   200,   201,   203,   204,
     205,   206,   242,   278,   283,   284,   285,   292,   294,   168,
      45,    45,    45,    45,   167,   284,    37,    38,    40,    45,
     276,   284,    36,    34,   140,   117,   168,   119,    45,   161,
     162,   163,    48,   207,   277,   278,   281,   282,   283,   284,
      34,   119,   206,    35,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,   169,   120,
     284,   284,   284,   284,   112,   142,   147,   148,   149,   284,
      34,    48,   242,   284,   122,   123,   122,   123,   203,   117,
     270,   271,   117,   270,   271,   271,   271,    45,   120,   120,
     120,   120,   118,   119,   171,   172,    34,   163,   277,    45,
     167,    46,    47,    45,   278,    34,   149,   179,     8,   173,
     118,   118,   104,   105,   150,   151,   152,   153,   154,   155,
       1,     7,    12,    16,    18,    19,    22,    24,    26,    28,
      33,    35,    36,    41,    42,    43,    44,    45,    48,   109,
     117,   157,   165,   180,   181,   182,   183,   191,   192,   193,
     194,   195,   196,   197,   198,   208,   209,   210,   212,   213,
     216,   218,   219,   223,   224,   225,   226,   235,   236,   237,
     238,   239,   240,   242,   243,   249,   250,   251,   252,   260,
     261,   272,   273,   274,   275,   281,   284,   285,    37,    38,
      39,    40,   174,   280,   280,   107,   103,   152,    34,    34,
     280,   276,   117,   253,   253,    34,    34,    34,   243,   237,
     181,   281,   284,   206,   117,   184,   244,   245,   246,   281,
      34,    34,   199,   200,   202,   206,    34,    34,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
     214,   278,   281,   283,    34,   253,   126,   120,    34,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,   120,   288,   206,   175,   284,   108,   220,
     221,   284,    45,   254,   255,   256,   257,   258,   259,   277,
      34,    34,    20,   262,   263,   264,    21,   265,   266,   267,
      30,   227,   228,   229,    34,    34,    34,    34,   120,   109,
     110,   111,   124,   185,   186,   187,   188,    34,   118,   119,
     247,   120,    44,   119,   217,   217,   217,   217,   217,   217,
     217,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      48,   119,    44,   119,    53,    54,    55,    56,    57,    58,
     279,   279,   279,    44,   217,   279,   217,    45,    48,    50,
     241,   284,   237,    46,    47,   281,    46,    47,   281,    45,
      46,    47,    48,   127,   128,   129,   198,   211,   237,   281,
     285,   286,   277,   120,    34,    95,    96,    97,    99,   100,
     101,   176,   177,   178,   248,    34,   119,    95,   222,    52,
     118,   119,   268,   258,    23,   264,   258,    25,   267,   258,
      14,    29,    32,   230,   229,   277,   184,   189,   118,   119,
     246,   248,   277,   284,   284,   284,   284,   284,   284,   284,
      44,    44,    44,    44,    44,    44,    44,    44,    44,   284,
     217,   284,   284,   284,    45,    46,    47,   215,   281,    45,
      46,    47,   281,    45,    46,    47,   281,   284,   284,   277,
     284,   253,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,   127,   129,   130,   131,
     132,   133,   134,   135,   136,   287,   287,   287,   206,   204,
     206,   287,   206,   277,   277,   270,   117,   221,   259,   256,
      96,    98,   269,    34,    34,    34,    34,    34,   242,   242,
     242,    34,    34,   109,   110,   111,   125,   190,   187,   284,
     284,   284,   284,   284,   284,   284,   284,   284,   284,    45,
     281,    46,    47,   281,    46,    47,   281,   119,   119,   281,
      45,   170,   206,   284,   270,    34,   119,   231,    31,   219,
     232,   233,   234,   184,   201,   201,   118,    15,   242,   246,
      27,   234,   241,    34,    34
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
#line 548 "pir.y"
    { fixup_global_labels(lexer); ;}
    break;

  case 19:
#line 578 "pir.y"
    { new_macro_const(lexer->macros, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval), yypirget_lineno(yyscanner)); ;}
    break;

  case 20:
#line 584 "pir.y"
    { /* fprintf(stderr, "macro body: [%s]\n", CURRENT_MACRO(lexer)->body);*/ ;}
    break;

  case 21:
#line 588 "pir.y"
    {
                          new_macro(lexer->macros, (yyvsp[(2) - (2)].sval), yypirget_lineno(yyscanner), TRUE,
                                    lexer->macro_size);
                        ;}
    break;

  case 26:
#line 603 "pir.y"
    { add_macro_param(CURRENT_MACRO(lexer), (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 34:
#line 622 "pir.y"
    { store_macro_string(CURRENT_MACRO(lexer), "%s\n", (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 35:
#line 626 "pir.y"
    {
                          store_macro_string(CURRENT_MACRO(lexer), ".local %s %s\n",
                                             pir_type_names[(yyvsp[(2) - (3)].ival)], (yyvsp[(3) - (3)].sval));
                        ;}
    break;

  case 36:
#line 637 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 37:
#line 641 "pir.y"
    { yypirset_lineno ((yyvsp[(2) - (2)].ival), yyscanner); ;}
    break;

  case 38:
#line 643 "pir.y"
    { lexer->filename = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 39:
#line 649 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 653 "pir.y"
    { set_hll_map(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 41:
#line 657 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 42:
#line 661 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 43:
#line 663 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 44:
#line 667 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 45:
#line 669 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 46:
#line 673 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 48:
#line 683 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 49:
#line 687 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 54:
#line 699 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 55:
#line 701 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 56:
#line 703 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 57:
#line 705 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 58:
#line 707 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 59:
#line 709 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 60:
#line 711 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 61:
#line 713 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 62:
#line 715 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 63:
#line 717 "pir.y"
    { set_sub_methodname(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 64:
#line 719 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 65:
#line 721 "pir.y"
    { set_sub_subid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 66:
#line 723 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 67:
#line 725 "pir.y"
    { set_sub_nsentry(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 71:
#line 734 "pir.y"
    { /* XXX */
                           /* generate_get_params(lexer); */
                           set_instr(lexer, "get_params");
                           /* don't infer the signatured opname from arguments, it's always same:
                            * get_params_pc (this is one of the special 4 instructions for
                            * sub invocation.
                            */
                           update_op(lexer, CURRENT_INSTRUCTION(lexer), PARROT_OP_get_params_pc);
                         ;}
    break;

  case 74:
#line 750 "pir.y"
    { set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 75:
#line 754 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 76:
#line 758 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 77:
#line 760 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 81:
#line 769 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT;
                           /* XXX handle multi_type */

                         ;}
    break;

  case 82:
#line 776 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 84:
#line 783 "pir.y"
    {
                         ++lexer->stmt_counter;
                         /* increment the logical statement counter; a statement can be
                          * multiple lines, but each statement has its own ID for the
                          * linear scan register allocator.
                          */
                        ;}
    break;

  case 85:
#line 793 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 103:
#line 821 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (3)].mval), (yyvsp[(2) - (3)].pval)); ;}
    break;

  case 104:
#line 825 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 105:
#line 827 "pir.y"
    { (yyval.pval) = (yyvsp[(2) - (3)].pval); ;}
    break;

  case 106:
#line 831 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 108:
#line 836 "pir.y"
    { (yyval.pval) = new_macro_param((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 109:
#line 838 "pir.y"
    {
                          macro_param *param = new_macro_param((yyvsp[(3) - (3)].sval));
                          param->next = (yyvsp[(1) - (3)].pval);
                          (yyval.pval) = param;
                        ;}
    break;

  case 110:
#line 846 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "macro argument '%s' is not a "
                                                           "declared identifier", (yyvsp[(1) - (1)].sval));
                          }
                        ;}
    break;

  case 112:
#line 855 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 114:
#line 860 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 115:
#line 865 "pir.y"
    { (yyval.sval) = ""; ;}
    break;

  case 116:
#line 867 "pir.y"
    { /* XXX cleanup memory stuff */
                          char *newbuff = (char *)mem_sys_allocate((strlen((yyvsp[(1) - (2)].sval)) + strlen((yyvsp[(2) - (2)].sval)) + 2)
                                                                   * sizeof (char));
                          sprintf(newbuff, "%s %s", (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval));
                          (yyval.sval) = newbuff;
                        ;}
    break;

  case 120:
#line 879 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 121:
#line 887 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 123:
#line 895 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         ;}
    break;

  case 124:
#line 904 "pir.y"
    {
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 125:
#line 911 "pir.y"
    {
                           set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 129:
#line 925 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 130:
#line 934 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(yyscanner))
                              do_strength_reduction(yyscanner);
                        ;}
    break;

  case 136:
#line 952 "pir.y"
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
                         else if (sym->type != PMC_TYPE)
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

                         get_opinfo(yyscanner);
                       ;}
    break;

  case 137:
#line 988 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 138:
#line 993 "pir.y"
    { push_operand(lexer, expr_from_key(lexer, (yyvsp[(1) - (1)].key))); ;}
    break;

  case 139:
#line 997 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 140:
#line 999 "pir.y"
    { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 141:
#line 1004 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 142:
#line 1006 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 143:
#line 1010 "pir.y"
    {
                           /* if $1 is a register, just return that */
                           if (TEST_FLAG((yyvsp[(1) - (2)].targ)->flags, TARGET_FLAG_IS_REG))
                               (yyval.targ) = (yyvsp[(1) - (2)].targ);
                           else { /* it's not a register, so it must be a declared symbol */
                               if ((yyvsp[(1) - (2)].targ)->s.sym->type != PMC_TYPE)
                                   yypirerror(yyscanner, lexer,
                                           "indexed object '%s' is not of type 'pmc'",
                                           (yyvsp[(1) - (2)].targ)->s.sym->name);

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

  case 144:
#line 1033 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 145:
#line 1037 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 146:
#line 1039 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 147:
#line 1048 "pir.y"
    {
                          /* the instruction is already set in parrot_op rule */
                          unshift_operand(lexer, (yyvsp[(4) - (6)].expr));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));

                          if (check_op_args_for_symbols(yyscanner)) {
                              check_first_arg_direction(yyscanner, (yyvsp[(3) - (6)].sval));
                              do_strength_reduction(yyscanner);
                          }
                        ;}
    break;

  case 148:
#line 1059 "pir.y"
    {
                          /* the instruction is already set in parrot_op rule */
                          unshift_operand(lexer, (yyvsp[(4) - (4)].expr));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (4)].targ)));

                          /* if checking op args is successful, do other checks */
                          if (check_op_args_for_symbols(yyscanner)) {
                              check_first_arg_direction(yyscanner, (yyvsp[(3) - (4)].sval));
                              do_strength_reduction(yyscanner);
                          }
                        ;}
    break;

  case 149:
#line 1071 "pir.y"
    { /* XXX create a PMC const for $4 */
                          unshift_operand(lexer, expr_from_key(lexer, (yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));
                          if (check_op_args_for_symbols(yyscanner))
                              check_first_arg_direction(yyscanner, (yyvsp[(3) - (6)].sval));
                              /* no strength reduction here */
                        ;}
    break;

  case 151:
#line 1084 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 152:
#line 1093 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 153:
#line 1102 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 154:
#line 1107 "pir.y"
    {
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 155:
#line 1112 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (3)].sval));
                          if (sym == NULL) {
                              if (!is_parrot_op(lexer, (yyvsp[(3) - (3)].sval)))
                                  yypirerror(yyscanner, lexer, "'%s' is neither a declared symbol "
                                                               "nor a parrot opcode", (yyvsp[(3) - (3)].sval));
                              else { /* handle it as an op */
                                  unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                                  get_opinfo(yyscanner);
                                  check_first_arg_direction(yyscanner, (yyvsp[(3) - (3)].sval));
                              }
                          }
                          else { /* handle it as a symbol */
                              update_instr(lexer, "set");
                              unshift_operand(lexer, expr_from_target(lexer,
                                                     target_from_symbol(lexer, sym)));
                              unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                              get_opinfo(yyscanner);
                          }
                        ;}
    break;

  case 156:
#line 1133 "pir.y"
    {
                          /*   $P0 = foo ["bar"]
                           *
                           * could be PIR sugar for this PASM code:
                           *
                           *    foo $P0, ["bar"]
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
                                  get_opinfo(yyscanner);
                              }
                              else
                                  yypirerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(3) - (4)].sval));

                              /* create a symbol node anyway, so we can continue with instr. gen. */
                              sym = new_symbol(lexer, (yyvsp[(3) - (4)].sval), PMC_TYPE);
                          }
                          else {
                              /* at this point, sym is not NULL, even if there was an error */
                              if (sym->type != PMC_TYPE)
                                  yypirerror(yyscanner, lexer,
                                          "indexed object '%s' must be of type 'pmc'", (yyvsp[(3) - (4)].sval));

                              t = target_from_symbol(lexer, sym);
                              set_target_key(t, (yyvsp[(4) - (4)].key));
                              update_instr(lexer, "set");
                              unshift_operand(lexer, expr_from_target(lexer, t));
                              unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (4)].targ)));
                              get_opinfo(yyscanner);
                          }
                        ;}
    break;

  case 157:
#line 1173 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(3) - (4)].sval));
                              sym = new_symbol(lexer, (yyvsp[(3) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yypirerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(3) - (4)].sval));

                          t = target_from_symbol(lexer, sym);
                          set_target_key(t, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), t);
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 158:
#line 1191 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 159:
#line 1198 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 160:
#line 1203 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 161:
#line 1214 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 162:
#line 1225 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 163:
#line 1236 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 164:
#line 1247 "pir.y"
    {
                          set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 165:
#line 1252 "pir.y"
    {
                          set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 166:
#line 1257 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 167:
#line 1262 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 168:
#line 1271 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(1) - (4)].sval));
                              /* create a dummy symbol so we can continue without seg. faults */
                              sym = new_symbol(lexer, (yyvsp[(1) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yypirerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(1) - (4)].sval));
                          /* at this point sym is a valid (possibly dummy) object for sure */
                          t = target_from_symbol(lexer, sym);
                          set_target_key(t, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", t, (yyvsp[(4) - (4)].expr));
                          get_opinfo(yyscanner);
                      ;}
    break;

  case 169:
#line 1290 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 170:
#line 1324 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 171:
#line 1326 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 172:
#line 1328 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 173:
#line 1330 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 174:
#line 1332 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 175:
#line 1334 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 176:
#line 1336 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 177:
#line 1338 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 178:
#line 1343 "pir.y"
    { get_opinfo(yyscanner); ;}
    break;

  case 179:
#line 1352 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 180:
#line 1354 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 181:
#line 1356 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 182:
#line 1358 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 183:
#line 1360 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 184:
#line 1362 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 185:
#line 1364 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 186:
#line 1366 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 187:
#line 1368 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 188:
#line 1370 "pir.y"
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

  case 189:
#line 1382 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (5)].ival)), (yyvsp[(5) - (5)].sval));
                        ;}
    break;

  case 190:
#line 1387 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 191:
#line 1389 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 192:
#line 1391 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 193:
#line 1393 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 194:
#line 1395 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 195:
#line 1397 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 196:
#line 1399 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 197:
#line 1401 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 198:
#line 1403 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 199:
#line 1405 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 200:
#line 1407 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 201:
#line 1409 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 202:
#line 1411 "pir.y"
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

  case 203:
#line 1442 "pir.y"
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

  case 204:
#line 1468 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%i", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].ival));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 205:
#line 1476 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%n", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].dval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 206:
#line 1485 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%s", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].sval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 207:
#line 1494 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 208:
#line 1496 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 209:
#line 1498 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 210:
#line 1500 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 211:
#line 1502 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 212:
#line 1506 "pir.y"
    {
                          yypirerror(yyscanner, lexer, "cannot compare string to %s",
                                     (yyvsp[(3) - (3)].ival) == INT_TYPE ? "integer" : "number");
                        ;}
    break;

  case 213:
#line 1511 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare integer to string"); ;}
    break;

  case 214:
#line 1513 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare number to string"); ;}
    break;

  case 215:
#line 1517 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 216:
#line 1518 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 217:
#line 1521 "pir.y"
    { (yyval.ival) = DONT_INVERT_OPNAME; /* no need to invert */ ;}
    break;

  case 218:
#line 1522 "pir.y"
    { (yyval.ival) = NEED_INVERT_OPNAME; /* yes, invert opname */ ;}
    break;

  case 221:
#line 1530 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_op_labelflag(lexer, BIT(0)); /* bit 0 means: "1 << 0" */
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 222:
#line 1538 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 223:
#line 1542 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 224:
#line 1544 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 225:
#line 1548 "pir.y"
    { (yyval.symb) = new_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 226:
#line 1551 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 227:
#line 1552 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 228:
#line 1556 "pir.y"
    { /* if $4 is not a register, it must be a declared symbol */
                          if (!TEST_FLAG((yyvsp[(4) - (5)].targ)->flags, TARGET_FLAG_IS_REG)) {

                              if ((yyvsp[(4) - (5)].targ)->s.sym->type != PMC_TYPE) /* a .lex must be a PMC */
                                  yypirerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                             (yyvsp[(4) - (5)].targ)->s.sym->name);
                          }
                          set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                        ;}
    break;

  case 229:
#line 1571 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 232:
#line 1583 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                              (yyval.invo) = (yyvsp[(4) - (8)].invo);
                            ;}
    break;

  case 233:
#line 1591 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 234:
#line 1593 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 235:
#line 1597 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 236:
#line 1599 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 237:
#line 1603 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 238:
#line 1607 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 239:
#line 1609 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 240:
#line 1612 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].expr)); ;}
    break;

  case 241:
#line 1616 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 242:
#line 1618 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 243:
#line 1622 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 244:
#line 1624 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 245:
#line 1628 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 246:
#line 1630 "pir.y"
    {
                               if ((yyvsp[(2) - (2)].targ))
                                   (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ));
                               else
                                   (yyval.targ) = (yyvsp[(1) - (2)].targ)
                           ;}
    break;

  case 247:
#line 1639 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 248:
#line 1641 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 250:
#line 1649 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 251:
#line 1653 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 252:
#line 1657 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL);
                             (yyval.invo) = (yyvsp[(1) - (1)].invo);
                           ;}
    break;

  case 255:
#line 1667 "pir.y"
    {
                             target *invocant;

                             /* if $1 is not a register, check whether the symbol was declared */
                             if (TEST_FLAG((yyvsp[(1) - (4)].targ)->flags, TARGET_FLAG_IS_REG)) {
                                invocant = (yyvsp[(1) - (4)].targ);
                             }
                             else { /* is not a register but a symbol */

                                 symbol *sym = find_symbol(lexer, (yyvsp[(1) - (4)].targ)->s.sym->name);
                                 if (sym == NULL)
                                     yypirerror(yyscanner, lexer,
                                             "symbol '%s' was not declared", (yyvsp[(1) - (4)].targ)->s.sym->name);
                                 else if ((yyvsp[(1) - (4)].targ)->s.sym->type != PMC_TYPE)
                                     yypirerror(yyscanner, lexer,
                                             "cannot invoke method: '%s' is not of type 'pmc'",
                                             (yyvsp[(1) - (4)].targ)->s.sym->name);

                                 /* get a target based on the symbol, it contains a register */
                                 invocant = (yyvsp[(1) - (4)].targ);
                             }

                             (yyval.invo) = invoke(lexer, CALL_METHOD, invocant, (yyvsp[(3) - (4)].expr));
                             set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                           ;}
    break;

  case 256:
#line 1695 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 257:
#line 1702 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 258:
#line 1704 "pir.y"
    {
                               symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                               if (sym == NULL)
                                   sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                               (yyval.targ) = target_from_symbol(lexer, sym); ;}
    break;

  case 259:
#line 1713 "pir.y"
    { /* check that this identifier was declared */
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));

                             if (sym == NULL) {
                                yypirerror(yyscanner, lexer,
                                        "method identifier '%s' not declared", (yyvsp[(1) - (1)].sval));
                                /* make sure sym is not NULL */
                                sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);
                             }
                             else if (sym->type != PMC_TYPE
                                  &&  sym->type != STRING_TYPE)
                                 yypirerror(yyscanner, lexer,
                                         "method '%s' must be of type 'pmc' or 'string'", (yyvsp[(1) - (1)].sval));

                             (yyval.expr) = expr_from_target(lexer, target_from_symbol(lexer, sym));
                           ;}
    break;

  case 260:
#line 1730 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 261:
#line 1732 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 262:
#line 1734 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 263:
#line 1738 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);

                           ;}
    break;

  case 264:
#line 1747 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 265:
#line 1752 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 266:
#line 1756 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 267:
#line 1758 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 268:
#line 1762 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 269:
#line 1764 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 270:
#line 1768 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 271:
#line 1772 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 272:
#line 1774 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 273:
#line 1778 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 274:
#line 1780 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 275:
#line 1782 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 276:
#line 1784 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 277:
#line 1794 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 282:
#line 1804 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 283:
#line 1809 "pir.y"
    { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              (yyval.invo) = (yyvsp[(2) - (3)].invo);
                            ;}
    break;

  case 284:
#line 1820 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 285:
#line 1827 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 286:
#line 1831 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 287:
#line 1833 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 288:
#line 1837 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 289:
#line 1839 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 292:
#line 1847 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 293:
#line 1851 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 294:
#line 1855 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument(lexer, (yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 295:
#line 1861 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 296:
#line 1870 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 297:
#line 1877 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 298:
#line 1879 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 299:
#line 1884 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 300:
#line 1886 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 301:
#line 1891 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 302:
#line 1895 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 303:
#line 1897 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 304:
#line 1901 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 305:
#line 1903 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 306:
#line 1907 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 307:
#line 1912 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 308:
#line 1914 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 309:
#line 1918 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 310:
#line 1920 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 311:
#line 1927 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 312:
#line 1929 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 313:
#line 1933 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 317:
#line 1944 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 318:
#line 1948 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 319:
#line 1952 "pir.y"
    { (yyval.cval) = new_named_const(lexer, INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 320:
#line 1954 "pir.y"
    { (yyval.cval) = new_named_const(lexer, NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 321:
#line 1956 "pir.y"
    { (yyval.cval) = new_named_const(lexer, STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 322:
#line 1958 "pir.y"
    { (yyval.cval) = new_pmc_const((yyvsp[(1) - (4)].sval), (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].cval)); ;}
    break;

  case 323:
#line 1965 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 324:
#line 1966 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 325:
#line 1970 "pir.y"
    { (yyval.cval) = new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 326:
#line 1971 "pir.y"
    { (yyval.cval) = new_const(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 327:
#line 1972 "pir.y"
    { (yyval.cval) = new_const(lexer, NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 328:
#line 1975 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 329:
#line 1976 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 330:
#line 1977 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 331:
#line 1978 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 332:
#line 1979 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 333:
#line 1980 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 334:
#line 1983 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 335:
#line 1984 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 336:
#line 1985 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 337:
#line 1986 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 338:
#line 1994 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 340:
#line 1998 "pir.y"
    { /* a symbol must have been declared; check that at this point. */
                           symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                           if (sym == NULL) {
                               yypirerror(yyscanner, lexer, "symbol '%s' not declared", (yyvsp[(1) - (1)].sval));

                                   /* make sure sym is not NULL */
                               sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), UNKNOWN_TYPE);
                           }
                           (yyval.targ) = target_from_symbol(lexer, sym);

                         ;}
    break;

  case 341:
#line 2011 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 342:
#line 2012 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 343:
#line 2013 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 344:
#line 2014 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 347:
#line 2022 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 348:
#line 2023 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 349:
#line 2024 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 350:
#line 2025 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 351:
#line 2026 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 352:
#line 2027 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 353:
#line 2028 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 354:
#line 2029 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 355:
#line 2032 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 356:
#line 2033 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 357:
#line 2034 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 358:
#line 2037 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 359:
#line 2038 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 360:
#line 2039 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 361:
#line 2040 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 362:
#line 2041 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 363:
#line 2042 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 364:
#line 2043 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 365:
#line 2044 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 366:
#line 2045 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 367:
#line 2046 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 368:
#line 2047 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 369:
#line 2048 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 370:
#line 2049 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 371:
#line 2050 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 372:
#line 2051 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 373:
#line 2052 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 374:
#line 2053 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 375:
#line 2054 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 376:
#line 2055 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 377:
#line 2056 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 378:
#line 2057 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 379:
#line 2058 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 380:
#line 2059 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 381:
#line 2065 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 382:
#line 2066 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 383:
#line 2067 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 384:
#line 2068 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 385:
#line 2069 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 386:
#line 2070 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 387:
#line 2071 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 388:
#line 2072 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 389:
#line 2073 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 390:
#line 2074 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 391:
#line 2075 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 392:
#line 2076 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 394:
#line 2097 "pir.y"
    { new_subr(lexer, "@start"); ;}
    break;

  case 401:
#line 2111 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 406:
#line 2121 "pir.y"
    { set_sub_name(lexer, (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 407:
#line 2125 "pir.y"
    { new_subr(lexer, NULL); ;}
    break;

  case 408:
#line 2130 "pir.y"
    {
                                  if (is_parrot_op(lexer, (yyvsp[(1) - (3)].sval)))
                                      get_opinfo(yyscanner);
                                  else /* not a parrot op */
                                      yypirerror(yyscanner, lexer, "'%s' is not a parrot op", (yyvsp[(1) - (3)].sval));

                                ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4600 "pirparser.c"
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


#line 2141 "pir.y"



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
    return new_const((lexer_state * const)yypirget_extra(yyscanner), INT_TYPE, result);
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
    return new_const((lexer_state * const)yypirget_extra(yyscanner), NUM_TYPE, result);
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
    return new_const((lexer_state * const)yypirget_extra(yyscanner), NUM_TYPE, result);
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
    return new_const((lexer_state * const)yypirget_extra(yyscanner), NUM_TYPE, result);
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
            return new_const(lexer, STRING_TYPE, concat_strings(lexer, a, b));

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
            return new_const(lexer, STRING_TYPE, a);

        case OP_ISEQ:
        case OP_ISLE:
        case OP_ISLT:
        case OP_ISGE:
        case OP_ISGT:
        case OP_ISNE:
            return new_const(lexer, INT_TYPE, (1 == evaluate_s_s(a, op, b)));


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
evaluate_s(char * const s)>

Evaluate a string in boolean context; if the string's length is 0, it's false.
If the string equals "0", ".0", "0." or "0.0", it's false.
Otherwise, it's true.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static int
evaluate_s(NOTNULL(char * const s)) {
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
        case INT_TYPE:
            return (c->val.ival != 0);
        case NUM_TYPE:
            return (c->val.nval != 0);
        case STRING_TYPE:
            return evaluate_s(c->val.sval);
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
create_if_instr(yyscan_t yyscanner, NOTNULL(lexer_state * const lexer), int invert, int hasnull,
                NOTNULL(char const * const name),
                NOTNULL(char const * const label))
{
    /* try to find the symbol; if it was declared it will be found; otherwise emit an error. */
    symbol *sym = find_symbol(lexer, name);
    if (sym == NULL) {
        yypirerror(yyscanner, lexer, "symbol '%s' not declared'", name);
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
do_strength_reduction(yyscan_t yyscanner)>

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
do_strength_reduction(yyscan_t yyscanner) {
    lexer_state *lexer = (lexer_state *)yypirget_extra(yyscanner);
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
        reduce_strength(yyscanner, newop, second_op_index);

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
                yypirerror(yyscanner, lexer, "cannot divide by 0");
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
check_first_arg_direction(yyscan_t yyscanner, NOTNULL(char const * const opname)) {
    int dir_first_arg;
    lexer_state * lexer = (lexer_state *)yypirget_extra(yyscanner);


    /* op_count also counts the instruction itself, so must be at least 2 */
    assert(CURRENT_INSTRUCTION(lexer)->opinfo->op_count >= 2);

    /* get the direction of the first argument */
    if (!CURRENT_INSTRUCTION(lexer)->opinfo->dirs)
        fprintf(stderr, "no opinfo->dirs!\n");
    else {
        op_info_t *opinfo =     CURRENT_INSTRUCTION(lexer)->opinfo;
        if (opinfo)

            dir_first_arg = CURRENT_INSTRUCTION(lexer)->opinfo->dirs[0];
        else
            fprintf(stderr, " no opinfo!\n");
    }

    /* direction cannot be IN or INOUT */
    if (dir_first_arg != PARROT_ARGDIR_OUT)
        yypirerror(yyscanner, lexer, "cannot write first arg of op '%s' as a target "
                                  "(direction of argument is IN/INOUT).", opname);

}




/*

=item C<static int
get_signature_length(expression * const e)>

Calculate the length of the signature for one operand; an operand is separated
from the instruction name or another operand through '_', which must also
be counted.

 set $I0, 42  --> set_i_ic

therefore, for $I0 (a target), return 1 for the type, 1 for the '_', and whatever
is needed for a key, if any, as in this example:

 set $P0[1] = "hi"  --> set_p_kic_sc

$P0 is a target, resulting in "_p", the key [1] is a key ('k') of type int ('i'),
and it's a constant ('c'). Add 1 for the '_'.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static int
get_signature_length(NOTNULL(expression * const e)) {
    switch (e->type) {
        case EXPR_TARGET:
            return 2 + ((e->expr.t->key != NULL) /* if there's a key on this target ... */
                       ? get_signature_length(e->expr.t->key->expr) + 1 /* ... get its length. */
                       : 0);
        case EXPR_CONSTANT:
            return 3;
        case EXPR_IDENT:
            return 3; /* 1 for '_', 1 for 'i', 1 for 'c' */
        case EXPR_KEY: /* for '_', 'k' */
            return 2 + get_signature_length(e->expr.k->expr);
        default:
            fprintf(stderr, "wrong expression typein get_signature_length()\n");
            break;
    }
    return 0;
}


/* the order of these letters match with the pir_type enumeration.
 * These are used for generating the full opname (set I0, 10 -> set_i_ic).
 */
static char const type_codes[5] = {'i', 'n', 's', 'p', '?'};


/*

=item C<static char *
write_signature(expression * const iter, char *instr_writer)>

Write the signature for the operand C<iter>, using the character
pointer C<instr_writer>. When the operand is an indexed target node
(in other words, it has a key node), this function is invoked recursively
passing the key as an argument.

This function returns the updated character pointer (due to pass-by-value
semantics of the C calling conventions).

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char *
write_signature(NOTNULL(expression * const iter), NOTNULL(char *instr_writer)) {
    switch (iter->type) {
        case EXPR_TARGET:
            if (TEST_FLAG(iter->expr.t->flags, TARGET_FLAG_IS_REG))
                *instr_writer++ = type_codes[iter->expr.t->s.reg->type];
            else
                *instr_writer++ = type_codes[iter->expr.t->s.sym->type];

            if (iter->expr.t->key) {
                *instr_writer++ = '_';
                *instr_writer++ = 'k';
                /* XXX fix this mess. */
                if ((iter->expr.t->key->expr->type == EXPR_TARGET)
                    &&
                    (  (iter->expr.t->key->expr->expr.t->flags & TARGET_FLAG_IS_REG)
                     ?
                       (iter->expr.t->key->expr->expr.t->s.reg->type == PMC_TYPE)
                     :
                       (iter->expr.t->key->expr->expr.t->s.sym->type == PMC_TYPE)
                    )
                   ) {
                    /* the key is a target, and its type is a PMC. In that case, do not
                     * print the signature; 'kp' is not valid.
                     */
                }
                else {
                    if (
                       (iter->expr.t->key->expr->type == EXPR_TARGET)
                       &&


                       (
                       (iter->expr.t->key->expr->expr.t->flags & TARGET_FLAG_IS_REG)
                       ?
                       (iter->expr.t->key->expr->expr.t->s.reg->type == INT_TYPE)
                       :
                       (iter->expr.t->key->expr->expr.t->s.sym->type == INT_TYPE)
                       )
                       )

                    {
                       *instr_writer++ = 'i';
                    }
                    else
                    /*
                    instr_writer = write_signature(iter->expr.t->key->expr, instr_writer);
                    */
                    switch (iter->expr.t->key->expr->type) {
                        case EXPR_CONSTANT:
                            *instr_writer++ = 'c';
                            break;
                        default:
                            fprintf(stderr, "write_signature: non-constant key\n");
                            instr_writer = write_signature(iter->expr.t->key->expr, instr_writer);
                            break;
                    }
                }
            }
            break;
        case EXPR_CONSTANT:
            *instr_writer++ = type_codes[iter->expr.c->type];
            *instr_writer++ = 'c';
            break;
        case EXPR_IDENT: /* used for labels; these will be converted to (i)nteger (c)onstants*/
            *instr_writer++ = 'i';
            *instr_writer++ = 'c';
            break;
        case EXPR_KEY:
            *instr_writer++ = 'k';

            instr_writer    = write_signature(iter->expr.k->expr, instr_writer);
            /*

            switch (iter->expr.k->expr->type) {
                case EXPR_CONSTANT:
                   *instr_writer++ = 'c';
                   break;
                default:
                    fprintf(stderr, "write_signature: non-constant key\n");
                    instr_writer = write_signature(iter->expr.k->expr, instr_writer);
                    break;
            }
            */

            break;
        default:
            fprintf(stderr, "wrong expression type in write_signature()\n");
            break;
    }
    return instr_writer;
}


/*

=item C<static char *
get_signatured_opname(instruction * const instr)>

Returns the full opname of the instruction C<name>; the signature
of the opname is based on the operands, some examples are shown
below:

 set I0, 10        --> set_i_ic
 print "hi"        --> print_sc
 set P0[1], 3.14   --> set_p_kic_nc

For each operand, an underscore is added; then for the types
int, num, string or pmc, an 'i', 'n', 's' or 'p' is added
respectively. If the operand is a constant, a 'c' suffic is added.

If the operand is a key of something, a 'k' prefix is added.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char *
get_signatured_opname(NOTNULL(lexer_state * const lexer), NOTNULL(instruction * const instr)) {
    size_t      fullname_length;
    char       *fullname;
    char       *instr_writer;
    expression *iter         = instr->operands;
    unsigned    num_operands = 0;

    /* get length of short opname (and add 1 for the NULL character) */
    fullname_length = strlen(instr->opname) + 1;

    /* for each operand, calculate the length of the signature (for that op.)
     * and add it to the full length.
     */
    if (iter) {
        iter = iter->next;
        do {
            int keylength    = get_signature_length(iter);
            /* printf("keylength of operand was: %d\n", keylength);
            */
            fullname_length += keylength;
            iter             = iter->next;
            ++num_operands;
        }
        while (iter != instr->operands->next);
    }

    /* now we know how long the fullname will be, allocate enough memory. */
    fullname = (char *)pir_mem_allocate_zeroed(lexer, fullname_length * sizeof (char));

    /* copy the short name into fullname buffer, and set instr_writer to
     * the character after that.
     */
    strcpy(fullname, instr->opname);
    instr_writer = fullname + strlen(instr->opname);

    /* now iterate again over all operands, and codify them into the fullname.
     * As we counted the number of operands, this loop can be written a bit simpler.
     */
    iter = instr->operands;
    while (num_operands-- > 0) {
        iter            = iter->next;
        *instr_writer++ = '_'; /* separate each operand code by a '_' */
        instr_writer    = write_signature(iter, instr_writer);
    }

    return fullname;
}


/*

=item C<static int
get_opinfo(yyscan_t yyscanner)>

Compute the signatured opname from the instruction name and its arguments.
Based on this signature, the opcode is retrieved. If the opcode cannot
be found (i.e., it's -1), then a check is done for some special math ops;
C<add_i_ic_ic> and the like do not exist, but instead should be replaced
by C<set_i_ic> (and the like). If it's not one of these special cases,
then that means the op is not valid, and an error message will be reported.

=cut

*/
PARROT_IGNORABLE_RESULT
static int
get_opinfo(yyscan_t yyscanner) {
    lexer_state * const lexer = (lexer_state * const)yypirget_extra(yyscanner);
    instruction * const instr = CURRENT_INSTRUCTION(lexer);

    char * const fullopname   = get_signatured_opname(lexer, instr);
    /* find the numeric opcode for the signatured op. */
    int          opcode       = lexer->interp->op_lib->op_code(fullopname, 1);

    if (opcode < 0) {
        yypirerror(yyscanner, lexer, "'%s' is not a parrot op", fullopname);
        return FALSE;
    }
    else {
        update_op(lexer, instr, opcode);
        return TRUE;
    }

}

/*

=item C<static void
check_op_args_for_symbols(yyscan_t yyscanner)>

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
check_op_args_for_symbols(yyscan_t yyscanner) {
    lexer_state * const lexer = (lexer_state * const)yypirget_extra(yyscanner);
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
                operand->expr.t        = new_target(lexer);
                operand->expr.t->s.sym = sym;  /* target's pointer set to symbol */
                operand->type          = EXPR_TARGET; /* convert operand node into EXPR_TARGET */
            }
            else { /* it must be a label */
                SET_BIT(label_bitmask, BIT(i));
            }
        }
    }


    /* make sure the current instruction gets a pointer to the relevant opinfo entry */
    result = get_opinfo(yyscanner);

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
                    yypirerror(yyscanner, lexer, "symbol '%s' is not declared", iter->expr.id);
                    return FALSE;
                }
            }
            else { /* operand i is a label. */
                /* set the i'th flag, indicating that the i'th operand is actually a
                 * label. Then later, when we're going to fixup the labels, we know
                 * which one to fix.
                 */

                /*
                fprintf(stderr, "setting %dth label flag on instruction %s\n", BIT(i),
                        CURRENT_INSTRUCTION(lexer)->opname);
                 */

                SET_FLAG(CURRENT_INSTRUCTION(lexer)->oplabelbits, BIT(i));

            }

            ++i;
        }
        while (iter != CURRENT_INSTRUCTION(lexer)->operands);
    }
    return TRUE;
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


