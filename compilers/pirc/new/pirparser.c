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
     TK_NL = 258,
     TK_HLL = 259,
     TK_HLL_MAP = 260,
     TK_LOADLIB = 261,
     TK_SUB = 262,
     TK_END = 263,
     TK_PARAM = 264,
     TK_LEX = 265,
     TK_LINE = 266,
     TK_FILE = 267,
     TK_LOCAL = 268,
     TK_NAMESPACE = 269,
     TK_INVOCANT = 270,
     TK_METH_CALL = 271,
     TK_GLOBALCONST = 272,
     TK_CONST = 273,
     TK_RETURN = 274,
     TK_YIELD = 275,
     TK_SET_YIELD = 276,
     TK_SET_RETURN = 277,
     TK_BEGIN_YIELD = 278,
     TK_END_YIELD = 279,
     TK_BEGIN_RETURN = 280,
     TK_END_RETURN = 281,
     TK_BEGIN_CALL = 282,
     TK_END_CALL = 283,
     TK_GET_RESULTS = 284,
     TK_CALL = 285,
     TK_SET_ARG = 286,
     TK_GET_RESULT = 287,
     TK_NCI_CALL = 288,
     TK_TAILCALL = 289,
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
     TK_FLAG_LEXID = 347,
     TK_INSTANCEOF = 348,
     TK_FLAG_UNIQUE_REG = 349,
     TK_FLAG_NAMED = 350,
     TK_FLAG_SLURPY = 351,
     TK_FLAG_FLAT = 352,
     TK_FLAG_OPTIONAL = 353,
     TK_FLAG_OPT_FLAG = 354,
     TK_FLAG_INVOCANT = 355,
     TK_MACRO = 356,
     TK_ENDM = 357,
     TK_MACRO_LOCAL = 358,
     TK_MACRO_LABEL = 359,
     TK_MACRO_CONST = 360,
     TK_MACRO_LABEL_ID = 361,
     TK_MACRO_LOCAL_ID = 362,
     TK_MACRO_IDENT = 363,
     TK_MACRO_ARG_IDENT = 364,
     TK_MACRO_ARG_OTHER = 365,
     TK_MACRO_CONST_VAL = 366,
     TK_PASM_MARKER_START = 367,
     TK_PIR_MARKER_START = 368,
     TK_PARROT_OP = 369
   };
#endif
/* Tokens.  */
#define TK_NL 258
#define TK_HLL 259
#define TK_HLL_MAP 260
#define TK_LOADLIB 261
#define TK_SUB 262
#define TK_END 263
#define TK_PARAM 264
#define TK_LEX 265
#define TK_LINE 266
#define TK_FILE 267
#define TK_LOCAL 268
#define TK_NAMESPACE 269
#define TK_INVOCANT 270
#define TK_METH_CALL 271
#define TK_GLOBALCONST 272
#define TK_CONST 273
#define TK_RETURN 274
#define TK_YIELD 275
#define TK_SET_YIELD 276
#define TK_SET_RETURN 277
#define TK_BEGIN_YIELD 278
#define TK_END_YIELD 279
#define TK_BEGIN_RETURN 280
#define TK_END_RETURN 281
#define TK_BEGIN_CALL 282
#define TK_END_CALL 283
#define TK_GET_RESULTS 284
#define TK_CALL 285
#define TK_SET_ARG 286
#define TK_GET_RESULT 287
#define TK_NCI_CALL 288
#define TK_TAILCALL 289
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
#define TK_FLAG_LEXID 347
#define TK_INSTANCEOF 348
#define TK_FLAG_UNIQUE_REG 349
#define TK_FLAG_NAMED 350
#define TK_FLAG_SLURPY 351
#define TK_FLAG_FLAT 352
#define TK_FLAG_OPTIONAL 353
#define TK_FLAG_OPT_FLAG 354
#define TK_FLAG_INVOCANT 355
#define TK_MACRO 356
#define TK_ENDM 357
#define TK_MACRO_LOCAL 358
#define TK_MACRO_LABEL 359
#define TK_MACRO_CONST 360
#define TK_MACRO_LABEL_ID 361
#define TK_MACRO_LOCAL_ID 362
#define TK_MACRO_IDENT 363
#define TK_MACRO_ARG_IDENT 364
#define TK_MACRO_ARG_OTHER 365
#define TK_MACRO_CONST_VAL 366
#define TK_PASM_MARKER_START 367
#define TK_PIR_MARKER_START 368
#define TK_PARROT_OP 369




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

void expand_macro(yyscan_t yyscanner, macro_def * const macro, macro_param * args);

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

/* names of the Parrot types */
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
#line 233 "pir.y"
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
#line 577 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 590 "pirparser.c"

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
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   933

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  166
/* YYNRULES -- Number of rules.  */
#define YYNRULES  421
/* YYNRULES -- Number of states.  */
#define YYNSTATES  644

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   371

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   124,     2,     2,     2,   129,   131,     2,
     115,   116,   128,   126,   117,   123,   122,   127,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   121,
       2,   118,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   119,     2,   120,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   130,     2,   125,     2,     2,     2,
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
     132,   133
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
     155,   157,   159,   161,   166,   169,   172,   175,   177,   179,
     181,   183,   184,   187,   192,   195,   196,   199,   201,   203,
     205,   210,   212,   213,   216,   219,   221,   223,   225,   227,
     229,   231,   233,   235,   237,   239,   241,   243,   245,   247,
     249,   251,   255,   256,   260,   261,   263,   265,   269,   271,
     273,   275,   278,   281,   285,   289,   292,   295,   297,   299,
     301,   303,   304,   306,   308,   312,   316,   318,   320,   322,
     324,   326,   328,   331,   335,   337,   341,   348,   353,   360,
     363,   367,   371,   375,   379,   383,   388,   393,   398,   402,
     406,   410,   414,   418,   422,   426,   431,   437,   442,   447,
     451,   455,   459,   463,   467,   471,   475,   479,   482,   488,
     494,   500,   506,   512,   518,   524,   530,   536,   541,   547,
     552,   557,   562,   567,   572,   577,   582,   587,   592,   597,
     602,   607,   612,   616,   620,   624,   628,   632,   636,   640,
     644,   648,   652,   656,   660,   662,   664,   666,   668,   670,
     672,   676,   681,   683,   687,   690,   692,   693,   695,   701,
     703,   705,   707,   716,   717,   719,   721,   724,   728,   732,
     735,   741,   742,   745,   746,   748,   750,   753,   757,   759,
     762,   766,   770,   772,   774,   776,   781,   784,   786,   788,
     790,   792,   794,   796,   798,   800,   804,   805,   807,   809,
     813,   816,   817,   820,   822,   824,   826,   829,   831,   833,
     835,   837,   839,   843,   847,   851,   855,   856,   858,   860,
     864,   866,   868,   872,   875,   877,   883,   889,   890,   892,
     894,   897,   901,   902,   904,   906,   909,   913,   914,   917,
     919,   922,   923,   925,   929,   932,   934,   936,   939,   942,
     947,   952,   957,   962,   964,   966,   968,   970,   972,   974,
     976,   978,   980,   982,   984,   986,   988,   990,   992,   994,
     996,   998,  1000,  1002,  1004,  1006,  1008,  1010,  1012,  1014,
    1016,  1018,  1020,  1022,  1024,  1026,  1028,  1030,  1032,  1034,
    1036,  1038,  1040,  1042,  1044,  1046,  1048,  1050,  1052,  1054,
    1056,  1058,  1060,  1062,  1064,  1066,  1068,  1070,  1072,  1074,
    1076,  1078,  1080,  1082,  1084,  1086,  1088,  1090,  1092,  1094,
    1096,  1098,  1100,  1102,  1105,  1107,  1110,  1113,  1115,  1119,
    1123,  1125,  1129,  1132,  1134,  1135,  1137,  1140,  1142,  1145,
    1146,  1149,  1151,  1153,  1155,  1157,  1159,  1161,  1164,  1169,
    1170,  1172,  1174,  1178,  1180,  1182,  1184,  1186,  1188,  1190,
    1192,  1194
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     135,     0,    -1,   113,   136,    -1,   112,   283,    -1,   137,
     138,   137,    -1,    -1,     3,    -1,   139,    -1,   138,     3,
     139,    -1,   161,    -1,   268,    -1,   157,    -1,   155,    -1,
     156,    -1,   153,    -1,   154,    -1,   140,    -1,   141,    -1,
     142,    -1,   105,    36,   111,    -1,   143,   115,   144,   116,
       3,   147,   102,    -1,   101,   278,    -1,    -1,   145,    -1,
     146,    -1,   145,   117,   146,    -1,   278,    -1,    -1,   148,
      -1,   149,    -1,   148,   149,    -1,   150,     3,    -1,   151,
      -1,   152,    -1,   104,   106,    -1,   103,   274,   107,    -1,
       6,    45,    -1,    11,    46,    -1,    12,    45,    -1,     4,
      45,    -1,     5,    45,   118,    45,    -1,    14,   119,   158,
     120,    -1,    -1,   159,    -1,   160,    -1,   159,   121,   160,
      -1,    45,    -1,   163,   165,     3,   168,   176,   162,    -1,
       8,    -1,     7,   164,    -1,   278,    -1,    45,    -1,    -1,
     165,   166,    -1,    84,    -1,    81,    -1,    82,    -1,    83,
      -1,    85,    -1,    88,    -1,    90,    -1,    91,    -1,    89,
      -1,    86,   115,   164,   116,    -1,    87,   264,    -1,    92,
     265,    -1,    93,   265,    -1,   278,    -1,    45,    -1,   199,
      -1,   169,    -1,    -1,   169,   170,    -1,     9,   171,   172,
       3,    -1,   274,   278,    -1,    -1,   172,   173,    -1,   242,
      -1,   174,    -1,   175,    -1,   100,   115,   167,   116,    -1,
      94,    -1,    -1,   176,   177,    -1,    35,   178,    -1,   178,
      -1,   189,    -1,   205,    -1,   211,    -1,   212,    -1,   217,
      -1,   266,    -1,   243,    -1,   218,    -1,   202,    -1,   188,
      -1,   187,    -1,   184,    -1,   185,    -1,   179,    -1,   186,
      -1,   108,   180,     3,    -1,    -1,   115,   181,   116,    -1,
      -1,   182,    -1,   183,    -1,   182,   117,   183,    -1,   109,
      -1,   110,    -1,     3,    -1,   154,     3,    -1,     1,     3,
      -1,    43,   275,     3,    -1,    29,   237,     3,    -1,   190,
       3,    -1,   191,   192,    -1,   201,    -1,    36,    -1,   193,
      -1,   195,    -1,    -1,   194,    -1,   196,    -1,   194,   117,
     196,    -1,   199,   118,   271,    -1,   197,    -1,   199,    -1,
     272,    -1,   278,    -1,   277,    -1,   198,    -1,   236,   199,
      -1,   119,   200,   120,    -1,   271,    -1,   200,   121,   271,
      -1,   275,   118,   191,   197,   117,   194,    -1,   275,   118,
     191,   197,    -1,   275,   118,   191,   199,   117,   194,    -1,
     203,     3,    -1,   275,   118,    46,    -1,   275,   118,    47,
      -1,   275,   118,    45,    -1,   275,   118,   204,    -1,   275,
     118,   191,    -1,   275,   118,   191,   199,    -1,   275,   118,
     279,   199,    -1,   275,   118,    48,   199,    -1,   275,   282,
     271,    -1,   275,    70,    46,    -1,   275,    70,    47,    -1,
     275,    71,    46,    -1,   275,    71,    47,    -1,   275,    70,
     275,    -1,   275,    71,   275,    -1,   275,   118,   280,   271,
      -1,   275,   118,   275,   281,   275,    -1,   279,   199,   118,
     271,    -1,    48,   199,   118,   271,    -1,    46,   281,   275,
      -1,    47,   281,   275,    -1,    45,   281,   275,    -1,    45,
     281,    45,    -1,    46,   281,    46,    -1,    47,   281,    47,
      -1,    46,   281,    47,    -1,    47,   281,    46,    -1,   206,
       3,    -1,   209,    43,    36,    44,   278,    -1,   209,    43,
      37,    44,   278,    -1,   209,    43,    38,    44,   278,    -1,
     209,    43,    39,    44,   278,    -1,   209,    43,    40,    44,
     278,    -1,   209,    43,    41,    44,   278,    -1,   209,    43,
      42,    44,   278,    -1,   209,    43,    44,    44,   278,    -1,
     209,    43,    43,    44,   278,    -1,   209,   272,   210,   278,
      -1,   209,    43,    48,   210,   278,    -1,   209,    36,   210,
     278,    -1,   209,   277,   210,   278,    -1,   209,    37,   210,
     278,    -1,   209,    38,   210,   278,    -1,   209,    39,   210,
     278,    -1,   209,    40,   210,   278,    -1,   209,    41,   210,
     278,    -1,   209,    42,   210,   278,    -1,   209,    44,    44,
     278,    -1,   209,    44,   117,   278,    -1,   209,    43,    44,
     278,    -1,   209,    43,   117,   278,    -1,   209,   207,    44,
     278,    -1,   275,   273,   271,    -1,    46,   273,   275,    -1,
      47,   273,   275,    -1,    45,   273,   275,    -1,    46,   273,
      46,    -1,    46,   273,    47,    -1,    47,   273,    46,    -1,
      47,   273,    47,    -1,    45,   273,    45,    -1,    45,   273,
     208,    -1,    46,   273,    45,    -1,    47,   273,    45,    -1,
      46,    -1,    47,    -1,    41,    -1,    42,    -1,    44,    -1,
     117,    -1,    44,   278,     3,    -1,    13,   274,   213,     3,
      -1,   214,    -1,   213,   117,   214,    -1,   215,   216,    -1,
     278,    -1,    -1,    94,    -1,    10,    45,   117,   236,     3,
      -1,   219,    -1,   220,    -1,   229,    -1,    27,     3,   221,
     224,     3,   226,    28,     3,    -1,    -1,   222,    -1,   223,
      -1,   222,   223,    -1,    31,   252,     3,    -1,    30,   236,
     225,    -1,    33,   236,    -1,    15,   236,     3,    16,   235,
      -1,    -1,   117,   236,    -1,    -1,   227,    -1,   228,    -1,
     227,   228,    -1,    32,   240,     3,    -1,   212,    -1,   230,
       3,    -1,   237,   118,   231,    -1,   275,   118,   231,    -1,
     231,    -1,   233,    -1,   232,    -1,   236,   122,   235,   247,
      -1,   234,   247,    -1,   236,    -1,    45,    -1,   278,    -1,
      48,    -1,    50,    -1,    45,    -1,   278,    -1,    48,    -1,
     115,   238,   116,    -1,    -1,   239,    -1,   240,    -1,   239,
     117,   240,    -1,   275,   241,    -1,    -1,   241,   242,    -1,
      98,    -1,    99,    -1,    96,    -1,    95,   264,    -1,   244,
      -1,   245,    -1,   254,    -1,   246,    -1,   255,    -1,    19,
     247,     3,    -1,    19,   231,     3,    -1,    20,   247,     3,
      -1,   115,   248,   116,    -1,    -1,   249,    -1,   250,    -1,
     249,   117,   250,    -1,   252,    -1,   251,    -1,    45,    52,
     253,    -1,   253,   262,    -1,   271,    -1,    25,     3,   259,
      26,     3,    -1,    23,     3,   256,    24,     3,    -1,    -1,
     257,    -1,   258,    -1,   257,   258,    -1,    21,   252,     3,
      -1,    -1,   260,    -1,   261,    -1,   260,   261,    -1,    22,
     252,     3,    -1,    -1,   262,   263,    -1,    97,    -1,    95,
     264,    -1,    -1,   265,    -1,   115,    45,   116,    -1,   267,
       3,    -1,   268,    -1,   269,    -1,    18,   270,    -1,    17,
     270,    -1,    37,   278,   118,    46,    -1,    38,   278,   118,
      47,    -1,    40,   278,   118,    45,    -1,    39,   278,   118,
      45,    -1,   275,    -1,   272,    -1,    45,    -1,    46,    -1,
      47,    -1,    53,    -1,    54,    -1,    55,    -1,    56,    -1,
      58,    -1,    57,    -1,    37,    -1,    38,    -1,    39,    -1,
      40,    -1,   276,    -1,   277,    -1,   278,    -1,    48,    -1,
      49,    -1,    51,    -1,    50,    -1,    36,    -1,   279,    -1,
      41,    -1,    42,    -1,    44,    -1,    37,    -1,    38,    -1,
      40,    -1,    39,    -1,    43,    -1,   123,    -1,   124,    -1,
     125,    -1,   126,    -1,   123,    -1,   127,    -1,   128,    -1,
     129,    -1,   130,    -1,   131,    -1,   125,    -1,   132,    -1,
      66,    -1,    59,    -1,    60,    -1,    61,    -1,    63,    -1,
      64,    -1,    62,    -1,    65,    -1,    54,    -1,    56,    -1,
      55,    -1,    58,    -1,    57,    -1,    53,    -1,    72,    -1,
      73,    -1,    74,    -1,    75,    -1,    78,    -1,    76,    -1,
      77,    -1,    79,    -1,    80,    -1,    68,    -1,    69,    -1,
      67,    -1,   137,   284,    -1,   285,    -1,   284,   285,    -1,
     289,     3,    -1,   286,    -1,    14,   287,     3,    -1,   119,
     288,   120,    -1,    45,    -1,   288,   121,    45,    -1,   291,
     290,    -1,   295,    -1,    -1,   295,    -1,   292,    35,    -1,
      35,    -1,   133,   293,    -1,    -1,   293,   294,    -1,    81,
      -1,    83,    -1,    82,    -1,    84,    -1,    90,    -1,    91,
      -1,   114,   296,    -1,    10,    45,   117,    48,    -1,    -1,
     297,    -1,   298,    -1,   297,   117,   298,    -1,    45,    -1,
      46,    -1,    47,    -1,   299,    -1,   287,    -1,    48,    -1,
      49,    -1,    50,    -1,    51,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   526,   526,   527,   532,   538,   539,   542,   543,   546,
     547,   548,   549,   550,   551,   552,   553,   560,   561,   564,
     568,   574,   581,   582,   585,   586,   589,   593,   594,   597,
     598,   601,   604,   605,   608,   612,   623,   627,   629,   635,
     639,   643,   648,   649,   653,   655,   659,   663,   669,   673,
     677,   678,   681,   682,   685,   687,   689,   691,   693,   695,
     697,   699,   701,   703,   705,   707,   709,   713,   714,   715,
     718,   726,   727,   730,   734,   739,   740,   744,   745,   746,
     749,   756,   762,   763,   766,   768,   771,   772,   773,   774,
     775,   776,   777,   778,   779,   780,   781,   782,   783,   784,
     785,   791,   796,   797,   802,   803,   806,   808,   816,   824,
     831,   835,   839,   848,   855,   862,   865,   866,   869,   878,
     885,   888,   889,   892,   893,   896,   932,   934,   941,   943,
     948,   950,   954,   977,   981,   983,   992,  1003,  1015,  1025,
    1029,  1036,  1043,  1045,  1047,  1066,  1103,  1120,  1126,  1128,
    1137,  1146,  1155,  1164,  1166,  1168,  1170,  1177,  1195,  1228,
    1230,  1232,  1234,  1236,  1238,  1240,  1242,  1247,  1256,  1258,
    1260,  1262,  1264,  1266,  1268,  1270,  1272,  1274,  1286,  1291,
    1293,  1295,  1297,  1299,  1301,  1303,  1305,  1307,  1309,  1311,
    1313,  1315,  1346,  1360,  1368,  1377,  1386,  1388,  1390,  1392,
    1394,  1398,  1403,  1405,  1410,  1411,  1414,  1415,  1418,  1419,
    1422,  1430,  1434,  1436,  1440,  1444,  1453,  1454,  1457,  1472,
    1476,  1477,  1480,  1493,  1494,  1498,  1500,  1504,  1508,  1510,
    1512,  1518,  1519,  1524,  1525,  1529,  1531,  1535,  1537,  1541,
    1545,  1549,  1553,  1559,  1560,  1563,  1591,  1598,  1600,  1609,
    1626,  1628,  1630,  1634,  1643,  1648,  1653,  1654,  1658,  1660,
    1664,  1669,  1670,  1674,  1676,  1678,  1680,  1690,  1694,  1695,
    1696,  1697,  1700,  1706,  1717,  1724,  1729,  1730,  1734,  1736,
    1740,  1741,  1744,  1748,  1752,  1756,  1765,  1775,  1776,  1781,
    1783,  1788,  1793,  1794,  1798,  1800,  1804,  1810,  1811,  1815,
    1817,  1825,  1826,  1830,  1834,  1837,  1838,  1841,  1845,  1849,
    1851,  1853,  1855,  1877,  1878,  1882,  1883,  1884,  1887,  1888,
    1889,  1890,  1891,  1892,  1895,  1896,  1897,  1898,  1906,  1909,
    1910,  1923,  1924,  1925,  1926,  1930,  1931,  1934,  1935,  1936,
    1937,  1938,  1939,  1940,  1941,  1944,  1945,  1946,  1949,  1950,
    1951,  1952,  1953,  1954,  1955,  1956,  1957,  1958,  1959,  1960,
    1961,  1962,  1963,  1964,  1965,  1966,  1967,  1968,  1969,  1970,
    1971,  1977,  1978,  1979,  1980,  1981,  1982,  1983,  1984,  1985,
    1986,  1987,  1988,  1994,  1999,  2000,  2003,  2004,  2007,  2010,
    2013,  2014,  2017,  2018,  2021,  2022,  2025,  2026,  2029,  2032,
    2033,  2036,  2037,  2038,  2039,  2040,  2041,  2044,  2045,  2049,
    2050,  2053,  2054,  2057,  2058,  2059,  2060,  2061,  2064,  2065,
    2066,  2067
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"\\n\"", "\".HLL\"", "\".HLL_map\"",
  "\".loadlib\"", "\".sub\"", "\".end\"", "\".param\"", "\".lex\"",
  "\".line\"", "\".file\"", "\".local\"", "\".namespace\"",
  "\".invocant\"", "\".meth_call\"", "\".globalconst\"", "\".const\"",
  "\".return\"", "\".yield\"", "\".set_yield\"", "\".set_return\"",
  "\".begin_yield\"", "\".end_yield\"", "\".begin_return\"",
  "\".end_return\"", "\".begin_call\"", "\".end_call\"",
  "\".get_results\"", "\".call\"", "\".set_arg\"", "\".get_result\"",
  "\".nci_call\"", "\".tailcall\"", "\"label\"", "\"identifier\"",
  "\"int\"", "\"num\"", "\"pmc\"", "\"string\"", "\"if\"", "\"unless\"",
  "\"null\"", "\"goto\"", "\"string constant\"", "\"integer constant\"",
  "\"number constant\"", "\"PMC register\"", "\"number register\"",
  "\"string register\"", "\"integer register\"", "\"=>\"", "\"!=\"",
  "\"==\"", "\"<\"", "\"<=\"", "\">\"", "\">=\"", "\">>>\"", "\">>\"",
  "\"<<\"", "\"//\"", "\"||\"", "\"&&\"", "\"~~\"", "\".\"", "\">>>=\"",
  "\">>=\"", "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"",
  "\"/=\"", "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"", "\".=\"", "\":init\"",
  "\":load\"", "\":main\"", "\":anon\"", "\":method\"", "\":outer\"",
  "\":vtable\"", "\":lex\"", "\":multi\"", "\":postcomp\"",
  "\":immediate\"", "\":lexid\"", "\":instanceof\"", "\":unique_reg\"",
  "\":named\"", "\":slurpy\"", "\":flat\"", "\":optional\"",
  "\":opt_flag\"", "\":invocant\"", "\".macro\"", "\".endm\"",
  "\".macro_local\"", "\".macro_label\"", "\".macro_const\"",
  "\"macro-label\"", "\"macro-local\"", "\"macro-identifier\"",
  "\"macro-id-argument\"", "\"macro-argument\"", "\"macro-constant\"",
  "\"<pasm-marker>\"", "\"<pir-marker>\"", "\"parrot-op\"", "'('", "')'",
  "','", "'='", "'['", "']'", "';'", "'.'", "'-'", "'!'", "'~'", "'+'",
  "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"", "\".pcc_sub\"", "$accept",
  "TOP", "pir_contents", "opt_nl", "pir_chunks", "pir_chunk",
  "macro_definition", "macro_const", "macro", "macro_header",
  "macro_parameters", "macro_params", "macro_param", "macro_body",
  "macro_statements", "macro_statement", "macro_instr", "macro_label_decl",
  "macro_local_decl", "loadlib", "location_directive", "hll_specifier",
  "hll_mapping", "namespace_decl", "opt_namespace", "namespace",
  "namespace_slice", "sub_def", "sub_end", "sub_head", "sub_id",
  "sub_flags", "sub_flag", "multi_type", "parameter_list", "parameters",
  "parameter", "param", "param_flags", "param_flag", "invocant_param",
  "unique_reg_flag", "instructions", "instruction", "statement",
  "macro_expansion", "opt_macro_args", "macro_args", "macro_arg_list",
  "macro_arg", "empty_stat", "location_stat", "error_stat", "null_stat",
  "getresults_stat", "parrot_stat", "parrot_instruction", "parrot_op",
  "opt_op_args", "op_args", "parrot_op_args", "keylist_assignment",
  "op_arg", "op_arg_expr", "keyaccess", "keylist", "keys",
  "parrot_op_assign", "assignment_stat", "assignment", "binary_expr",
  "conditional_stat", "conditional_instr", "condition", "int_or_num",
  "if_unless", "then", "goto_stat", "local_decl", "local_id_list",
  "local_id", "local_var_name", "has_unique_reg", "lex_decl",
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
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "expression", "constant", "rel_op", "type", "target",
  "symbol", "reg", "identifier", "keyword", "unop", "binop",
  "augmented_op", "pasm_contents", "pasm_lines", "pasm_line",
  "namespace_directive", "pasm_key", "pasm_keys", "pasm_statement",
  "opt_pasm_instruction", "label", "sub_directive", "pasm_sub_flags",
  "pasm_sub_flag", "pasm_instruction", "opt_pasm_arguments",
  "pasm_arguments", "pasm_argument", "pasm_reg", 0
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
     365,   366,   367,   368,   369,    40,    41,    44,    61,    91,
      93,    59,    46,    45,    33,   126,    43,    47,    42,    37,
     124,    38,   370,   371
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   134,   135,   135,   136,   137,   137,   138,   138,   139,
     139,   139,   139,   139,   139,   139,   139,   140,   140,   141,
     142,   143,   144,   144,   145,   145,   146,   147,   147,   148,
     148,   149,   150,   150,   151,   152,   153,   154,   154,   155,
     156,   157,   158,   158,   159,   159,   160,   161,   162,   163,
     164,   164,   165,   165,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   166,   166,   166,   166,   167,   167,   167,
     168,   169,   169,   170,   171,   172,   172,   173,   173,   173,
     174,   175,   176,   176,   177,   177,   178,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   178,   178,   178,   178,
     178,   179,   180,   180,   181,   181,   182,   182,   183,   183,
     184,   185,   186,   187,   188,   189,   190,   190,   191,   192,
     192,   193,   193,   194,   194,   195,   196,   196,   197,   197,
     197,   197,   198,   199,   200,   200,   201,   201,   201,   202,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   204,
     204,   204,   204,   204,   204,   204,   204,   205,   206,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   207,   207,   207,   207,   207,   207,   207,   207,
     207,   207,   207,   207,   208,   208,   209,   209,   210,   210,
     211,   212,   213,   213,   214,   215,   216,   216,   217,   218,
     219,   219,   220,   221,   221,   222,   222,   223,   224,   224,
     224,   225,   225,   226,   226,   227,   227,   228,   228,   229,
     230,   230,   230,   231,   231,   232,   233,   234,   234,   235,
     235,   235,   235,   236,   236,   237,   238,   238,   239,   239,
     240,   241,   241,   242,   242,   242,   242,   243,   244,   244,
     244,   244,   245,   245,   246,   247,   248,   248,   249,   249,
     250,   250,   251,   252,   253,   254,   255,   256,   256,   257,
     257,   258,   259,   259,   260,   260,   261,   262,   262,   263,
     263,   264,   264,   265,   266,   267,   267,   268,   269,   270,
     270,   270,   270,   271,   271,   272,   272,   272,   273,   273,
     273,   273,   273,   273,   274,   274,   274,   274,   275,   276,
     276,   277,   277,   277,   277,   278,   278,   279,   279,   279,
     279,   279,   279,   279,   279,   280,   280,   280,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   281,   281,   281,   281,   281,   281,   281,   281,   281,
     281,   282,   282,   282,   282,   282,   282,   282,   282,   282,
     282,   282,   282,   283,   284,   284,   285,   285,   286,   287,
     288,   288,   289,   289,   290,   290,   291,   291,   292,   293,
     293,   294,   294,   294,   294,   294,   294,   295,   295,   296,
     296,   297,   297,   298,   298,   298,   298,   298,   299,   299,
     299,   299
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
       1,     1,     1,     4,     2,     2,     2,     1,     1,     1,
       1,     0,     2,     4,     2,     0,     2,     1,     1,     1,
       4,     1,     0,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     0,     3,     0,     1,     1,     3,     1,     1,
       1,     2,     2,     3,     3,     2,     2,     1,     1,     1,
       1,     0,     1,     1,     3,     3,     1,     1,     1,     1,
       1,     1,     2,     3,     1,     3,     6,     4,     6,     2,
       3,     3,     3,     3,     3,     4,     4,     4,     3,     3,
       3,     3,     3,     3,     3,     4,     5,     4,     4,     3,
       3,     3,     3,     3,     3,     3,     3,     2,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     4,     5,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     1,     1,     1,     1,     1,
       3,     4,     1,     3,     2,     1,     0,     1,     5,     1,
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
       1,     1,     1,     2,     1,     2,     2,     1,     3,     3,
       1,     3,     2,     1,     0,     1,     2,     1,     2,     0,
       2,     1,     1,     1,     1,     1,     1,     2,     4,     0,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     5,     5,     0,     6,     0,     3,     2,     0,     1,
       0,     0,   397,   409,   399,   383,   384,   387,     0,   394,
       0,   393,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     5,     7,    16,    17,    18,     0,    14,    15,
      12,    13,    11,     9,    52,    10,     0,     0,     0,   413,
     414,   415,   418,   419,   420,   421,   417,   407,   410,   411,
     416,   398,   385,   386,   392,   395,   396,    39,     0,    36,
     335,   340,   341,   343,   342,   337,   338,   344,   339,    51,
      49,    50,   336,    37,    38,    42,     0,     0,     0,     0,
     307,    21,     0,     6,     4,    22,     0,     0,   390,     0,
     388,     0,   401,   403,   402,   404,   405,   406,   400,     0,
      46,     0,    43,    44,     0,     0,     0,     0,    19,     8,
       0,    23,    24,    26,    71,    55,    56,    57,    54,    58,
       0,   301,    59,    62,    60,    61,     0,     0,    53,   408,
     389,     0,   412,    40,    41,     0,     0,     0,     0,     0,
       0,     0,    82,    70,     0,     0,    64,   302,    65,    66,
     391,    45,   309,   310,   312,   311,    27,    25,     0,     0,
      72,     0,     0,     0,     0,     0,    28,    29,     0,    32,
      33,     0,   110,    48,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   335,   337,   338,   344,   339,   248,
     331,   332,   334,   333,   102,   256,     0,    47,    83,    85,
      99,    97,    98,   100,    96,    95,    86,     0,   121,   117,
      94,     0,    87,     0,     0,    88,    89,    90,    93,   219,
     220,   221,     0,   242,   244,   243,     0,   247,     0,    92,
     267,   268,   270,   269,   271,    91,     0,   305,   306,     0,
     328,   329,   330,   336,   324,   325,   326,   327,    75,     0,
      63,   303,     0,    34,    20,    30,    31,   112,     0,     0,
     308,   254,   276,     0,     0,   253,     0,   287,   292,   223,
       0,    84,   331,     0,   330,     0,     0,     0,   104,     0,
       0,   257,   258,   261,   111,   115,   315,   316,   317,   331,
     116,   119,   122,   120,   123,   126,   131,   127,     0,   128,
     130,   129,   139,   167,   335,   340,   341,   343,   342,   337,
     338,   344,   339,   315,   316,   317,     0,     0,     0,   329,
     239,   246,     0,     0,   304,   382,   380,   381,     0,     0,
     371,   372,   373,   374,   376,   377,   375,   378,   379,     0,
       0,     0,     0,    74,    35,     0,     0,   212,   216,   215,
     315,     0,   277,   278,   281,   280,   297,   284,   314,   313,
     273,   272,   274,     0,     0,   288,   289,     0,     0,   293,
     294,     0,     0,   224,   225,   114,   113,   210,     0,   134,
       0,   108,   109,     0,   105,   106,   101,   255,     0,   260,
       0,     0,   132,   208,   209,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   318,   319,   320,   321,   323,
     322,     0,     0,     0,     0,     0,     0,     0,   252,   250,
     251,     0,   249,   240,   149,   150,   153,   151,   152,   154,
     142,   140,   141,   331,   345,   346,   347,   144,   143,   241,
       0,   336,     0,   148,     0,    73,    81,   301,   265,   263,
     264,     0,    76,    78,    79,    77,     0,   211,     0,   217,
     214,     0,   275,     0,   283,     0,     0,   290,     0,     0,
     295,     0,     0,     0,     0,     0,   226,   133,     0,   158,
     103,     0,   259,   262,   124,   127,   125,   179,   181,   182,
     183,   184,   185,   186,     0,     0,     0,     0,     0,     0,
       0,     0,   339,   189,     0,   190,   187,   188,   200,   204,
     205,   201,   195,   202,   196,   197,   193,   203,   198,   199,
     194,   191,   177,   192,   180,   245,   370,   365,   367,   366,
     369,   368,   358,   359,   360,   363,   361,   362,   364,   357,
     349,   355,   348,   350,   351,   352,   353,   354,   356,     0,
       0,     0,   147,   137,   145,     0,   146,   155,   157,   266,
       0,   218,   213,   282,   279,   301,   299,   298,   291,   286,
     296,   285,   227,     0,   231,   229,   233,   135,   107,   168,
     169,   170,   171,   172,   173,   174,   176,   175,   178,   162,
     161,   163,   165,   159,   166,   164,   160,     0,     0,   156,
      68,     0,    69,    67,   300,     0,     0,   228,     0,   238,
       0,   234,   235,   136,   138,    80,     0,   232,     0,     0,
     236,   230,   237,   222
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     7,     5,    32,    33,    34,    35,    36,    37,
     120,   121,   122,   175,   176,   177,   178,   179,   180,    38,
      39,    40,    41,    42,   111,   112,   113,    43,   207,    44,
      80,    96,   138,   621,   152,   153,   170,   258,   352,   472,
     473,   474,   168,   208,   209,   210,   289,   393,   394,   395,
     211,   212,   213,   214,   215,   216,   217,   218,   300,   301,
     302,   303,   304,   305,   306,   505,   388,   219,   220,   221,
     458,   222,   223,   326,   531,   224,   405,   225,   226,   356,
     357,   358,   480,   227,   228,   229,   230,   382,   383,   384,
     495,   627,   630,   631,   632,   231,   232,   233,   234,   235,
     236,   441,   237,   238,   290,   291,   292,   399,   475,   239,
     240,   241,   242,   274,   361,   362,   363,   364,   365,   366,
     243,   244,   374,   375,   376,   378,   379,   380,   484,   587,
     156,   157,   245,   246,    45,   248,    90,   367,   368,   431,
     259,   369,   250,   251,   284,    82,   462,   569,   350,     6,
      15,    16,    17,    56,    99,    18,    64,    19,    20,    61,
     108,    21,    57,    58,    59,    60
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -585
static const yytype_int16 yypact[] =
{
     -47,    22,    22,    33,  -585,     1,  -585,  -585,    86,  -585,
       9,   -63,  -585,    60,  -585,     1,  -585,  -585,    64,     0,
      36,  -585,    44,    51,    54,   870,    67,    80,    23,   220,
     880,    83,   125,  -585,  -585,  -585,  -585,    31,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,    21,   103,   149,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,    43,  -585,
    -585,    49,  -585,  -585,  -585,  -585,  -585,  -585,    45,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,   120,   880,   880,   880,   880,
    -585,  -585,    63,    86,  -585,   880,   119,   130,  -585,   -19,
    -585,    60,  -585,  -585,  -585,  -585,  -585,  -585,  -585,   136,
    -585,    68,    62,  -585,    72,   101,   114,   127,  -585,  -585,
      76,   137,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
     146,   147,  -585,  -585,  -585,  -585,   147,   147,  -585,  -585,
    -585,   218,  -585,  -585,  -585,   120,   221,   223,   226,   227,
     265,   880,  -585,   266,   870,   229,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,    13,  -585,   315,   263,
    -585,   162,   163,   263,   170,   178,    13,  -585,   302,  -585,
    -585,   303,  -585,  -585,   264,   263,   220,   534,   195,   308,
     309,   310,   200,   437,    37,   628,   644,   199,   880,  -585,
      42,  -585,  -585,  -585,   202,   199,   311,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,   316,   464,  -585,
    -585,   317,  -585,   318,   666,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,   319,  -585,  -585,  -585,   195,   207,   213,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,   333,  -585,  -585,   583,
    -585,  -585,   -87,   222,  -585,  -585,  -585,  -585,  -585,   880,
    -585,  -585,   230,  -585,  -585,  -585,  -585,  -585,   228,   880,
    -585,  -585,   682,   336,   340,  -585,   343,   326,   327,   330,
     345,  -585,  -585,   359,  -585,   364,   698,   250,    26,   366,
     254,   257,  -585,  -585,  -585,  -585,  -585,  -585,  -585,   258,
    -585,  -585,   259,  -585,  -585,  -585,  -585,   260,   222,  -585,
    -585,   268,  -585,  -585,   -23,   -23,   -23,   -23,   -23,   -23,
     -23,   480,   -22,   160,   160,   160,   335,   -23,   160,   -23,
    -585,  -585,   842,   600,  -585,  -585,  -585,  -585,   762,   778,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,   248,
     698,   270,    55,  -585,  -585,   857,     3,  -585,   295,  -585,
     338,   275,   276,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,   698,   368,   326,  -585,   698,   374,   327,
    -585,   698,    88,   330,  -585,  -585,  -585,  -585,    74,  -585,
     698,  -585,  -585,   278,   284,  -585,  -585,  -585,   199,    71,
     464,   698,  -585,  -585,  -585,   880,   880,   880,   880,   880,
     880,   880,   361,   367,   375,   376,   377,   378,   380,   381,
     889,   -23,   880,   880,   880,  -585,  -585,  -585,  -585,  -585,
    -585,   714,   730,   746,   880,   880,   698,   880,  -585,  -585,
    -585,   195,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
     503,   477,   477,    42,  -585,  -585,  -585,   464,  -585,  -585,
     477,   222,   698,  -585,   698,  -585,  -585,   147,  -585,  -585,
    -585,   312,  -585,  -585,  -585,  -585,   415,  -585,   880,  -585,
    -585,   698,  -585,   682,   -58,   423,   425,  -585,   426,   428,
    -585,   430,   857,   857,   857,   431,  -585,  -585,   698,  -585,
    -585,    26,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,   880,   880,   880,   880,   880,   880,
     880,   880,   880,  -585,   880,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,   826,
     794,   810,  -585,   320,   322,   199,  -585,  -585,  -585,  -585,
     185,  -585,  -585,  -585,  -585,   147,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,   432,   324,  -585,    19,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,   464,   464,  -585,
    -585,   328,  -585,  -585,  -585,   420,   857,  -585,   199,  -585,
     414,    19,  -585,   259,   259,  -585,   842,  -585,   440,   442,
    -585,  -585,  -585,  -585
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -585,  -585,  -585,    16,  -585,   353,  -585,  -585,  -585,  -585,
    -585,  -585,   300,  -585,  -585,   282,  -585,  -585,  -585,  -585,
    -144,  -585,  -585,  -585,  -585,  -585,   307,  -585,  -585,  -585,
     305,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,   272,  -585,  -585,  -585,  -585,   -38,
    -585,  -585,  -585,  -585,  -585,  -585,  -585,   121,  -585,  -585,
    -420,  -585,    84,    14,  -585,  -184,  -585,  -585,  -585,  -585,
    -585,  -585,  -585,  -585,  -585,  -585,  -274,  -585,  -584,  -585,
      -6,  -585,  -585,  -585,  -585,  -585,  -585,  -585,  -585,   100,
    -585,  -585,  -585,  -585,  -133,  -585,  -585,  -174,  -585,  -585,
    -585,  -111,  -211,   334,  -585,  -585,  -395,  -585,   128,  -585,
    -585,  -585,  -585,  -186,  -585,  -585,    46,  -585,  -236,    65,
    -585,  -585,  -585,  -585,   169,  -585,  -585,   168,  -585,  -585,
    -458,   115,  -585,  -585,  -141,  -585,   362,  -278,  -204,  -148,
    -154,  -167,  -585,  -201,   -25,  -164,  -585,  -392,  -585,  -585,
    -585,   535,  -585,   538,  -585,  -585,  -585,  -585,  -585,  -585,
    -585,   532,  -585,  -585,   452,  -585
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -255
static const yytype_int16 yytable[] =
{
      81,   249,   276,   502,   253,    91,   477,   308,   389,   579,
      10,    10,   629,   273,   309,    11,   287,   310,     8,   262,
     327,   403,   423,   329,   206,     4,   249,   247,  -253,   253,
     283,   269,   185,     9,   307,  -253,    12,   585,   293,   586,
    -118,   406,   407,   408,   409,   410,   411,   629,    94,   206,
     331,   628,   247,   435,    46,   437,    47,   328,   465,   570,
     571,   114,   115,   116,   117,     1,     2,    63,   575,   351,
     123,    66,   463,  -118,  -118,  -118,  -118,  -118,  -118,  -118,
    -118,  -118,  -118,  -118,  -118,  -118,  -118,  -118,  -118,    67,
      22,    23,    24,    25,   404,   424,    68,    26,    27,    69,
      28,   140,   141,   492,    29,    49,    50,    51,    52,    53,
      54,    55,   499,    83,    13,    13,   173,   174,   493,    92,
     478,   494,   124,   506,   402,    84,   123,   624,    93,    81,
     102,   103,   104,   105,    14,   391,   392,   485,    97,   106,
     107,   488,    85,   252,   476,   491,    95,   524,    98,   466,
     467,   468,   100,   469,   470,   471,  -118,  -254,   543,   443,
     101,   286,   275,   109,  -254,   110,   467,   468,   252,   469,
     470,   446,   449,   285,   118,   459,   432,   433,   139,    47,
     436,   143,   460,   145,   577,   461,   578,    30,   144,   308,
     146,    31,   150,   311,   497,   498,   309,   633,   634,   310,
     125,   126,   127,   128,   129,   130,   131,   132,   133,   134,
     135,   136,   137,   425,   426,   427,   428,   429,   430,   147,
     597,    70,    71,    72,    73,    74,    75,    76,    77,    78,
     620,   293,   148,   638,   353,    70,    71,    72,    73,    74,
      75,    76,    77,    78,   359,   149,   308,   282,   201,   202,
     203,   158,   159,   309,   151,   545,   310,    86,    87,    88,
      89,   154,   155,   160,   532,   536,   540,   162,   166,   572,
     163,   164,   165,   574,   172,   169,   263,   576,   260,   261,
     264,   593,   594,   595,   194,    71,    72,    73,    74,    75,
      76,    77,    78,   450,   451,   452,   453,   201,   202,   203,
     254,   255,   256,   257,   286,   266,   267,   442,   275,   268,
     272,   277,   278,   279,   294,   205,   181,   288,   182,   295,
     312,   313,   330,   183,   252,   184,    26,    27,   185,   332,
     275,   333,   186,    29,   187,   188,   334,   354,   189,   370,
     190,   286,   191,   371,   192,   355,   372,   373,   385,   377,
     193,   194,    71,    72,    73,    74,   195,   196,   197,   198,
     199,   381,   386,   200,   201,   202,   203,   387,   390,   396,
     397,   454,   455,   456,   398,   311,   400,  -254,   401,   434,
     507,   508,   509,   510,   511,   512,   513,  -253,   464,   479,
     481,   482,   486,   483,   500,   523,   622,   525,   526,   527,
     489,   501,   610,   613,   616,   514,   308,   308,   619,   541,
     542,   515,   544,   309,   309,   637,   310,   310,   581,   516,
     517,   518,   519,   204,   520,   521,   588,   580,   589,   590,
     205,   591,   311,   592,   596,   625,   636,   617,   181,   618,
     182,   626,   639,   642,   635,   643,   119,   184,    26,    27,
     185,   167,   161,   359,   186,    29,   187,   188,   265,   171,
     189,   293,   190,   598,   191,   281,   192,   275,   275,   275,
     457,   573,   582,   194,    71,    72,    73,    74,   195,   196,
     197,   198,   199,   496,   504,   200,   201,   202,   203,   599,
     600,   601,   602,   603,   604,   605,   606,   607,   640,   608,
      70,    71,    72,    73,    74,    75,    76,    77,    78,   296,
     297,   298,   299,   201,   202,   203,   412,   413,   414,   415,
     416,   417,   418,   419,   420,   641,   280,   503,   421,   584,
     546,   547,   548,   549,   550,   551,   552,   553,   554,   555,
     556,   557,   558,   559,   487,   204,   583,   490,   270,    48,
      62,    65,   205,   142,     0,   623,   546,   547,   548,   549,
     550,   551,   552,   553,   554,   555,   556,   557,   558,   559,
      70,    71,    72,    73,    74,    75,    76,    77,    78,   199,
       0,     0,   271,   286,     0,     0,     0,     0,     0,     0,
       0,     0,   311,   311,     0,     0,     0,   422,     0,     0,
     560,   275,   561,   562,   563,   564,   565,   566,   567,   568,
       0,   442,     0,     0,     0,     0,     0,     0,  -248,     0,
       0,     0,     0,     0,     0,     0,   560,     0,   561,   562,
     563,   564,   565,   566,   567,   568,    70,    71,    72,    73,
      74,    75,    76,    77,    78,   199,     0,     0,   271,   272,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,  -206,  -206,  -206,  -206,  -206,  -206,
    -206,  -206,  -206,  -206,  -206,  -206,  -206,  -206,  -206,  -206,
    -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,
    -207,  -207,  -207,  -207,  -207,  -207,     0,     0,     0,     0,
       0,   349,   314,   315,   316,   317,   318,   319,   320,   321,
     322,   323,   324,   325,   282,   201,   202,   203,    70,    71,
      72,    73,    74,    75,    76,    77,    78,   360,   297,   298,
     282,   201,   202,   203,    70,    71,    72,    73,    74,    75,
      76,    77,    78,   296,   297,   298,   282,   201,   202,   203,
      70,    71,    72,    73,    74,    75,    76,    77,    78,   528,
     529,   530,   282,   201,   202,   203,    70,    71,    72,    73,
      74,    75,    76,    77,    78,   533,   534,   535,   282,   201,
     202,   203,    70,    71,    72,    73,    74,    75,    76,    77,
      78,   537,   538,   539,   282,   201,   202,   203,    70,    71,
      72,    73,    74,    75,    76,    77,    78,     0,   444,   445,
     282,   201,   202,   203,    70,    71,    72,    73,    74,    75,
      76,    77,    78,     0,   447,   448,   282,   201,   202,   203,
      70,    71,    72,    73,    74,    75,    76,    77,    78,     0,
     611,   612,   282,   201,   202,   203,    70,    71,    72,    73,
      74,    75,    76,    77,    78,     0,   614,   615,   282,   201,
     202,   203,    70,    71,    72,    73,    74,    75,    76,    77,
      78,   609,     0,     0,   282,   201,   202,   203,    70,    71,
      72,    73,    74,    75,    76,    77,    78,   438,     0,     0,
     439,     0,   440,    70,    71,    72,    73,    74,    75,    76,
      77,    78,     0,     0,     0,   271,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    70,    71,    72,    73,    74,
      75,    76,    77,   522
};

static const yytype_int16 yycheck[] =
{
      25,   168,   188,   398,   168,    30,     3,   218,   286,   467,
      10,    10,   596,   187,   218,    14,   200,   218,     2,   173,
     224,    44,    44,   224,   168,     3,   193,   168,   115,   193,
     197,   185,    13,     0,   218,   122,    35,    95,   205,    97,
       3,   315,   316,   317,   318,   319,   320,   631,    32,   193,
     236,    32,   193,   327,    45,   329,   119,   224,     3,   451,
     452,    86,    87,    88,    89,   112,   113,     3,   460,   253,
      95,    35,   350,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    45,
       4,     5,     6,     7,   117,   117,    45,    11,    12,    45,
      14,   120,   121,    15,    18,    45,    46,    47,    48,    49,
      50,    51,   390,    46,   114,   114,   103,   104,    30,    36,
     117,    33,     3,   401,   308,    45,   151,   585,     3,   154,
      81,    82,    83,    84,   133,   109,   110,   373,   117,    90,
      91,   377,   119,   168,   355,   381,   115,   421,    45,    94,
      95,    96,     3,    98,    99,   100,   119,   115,   436,   333,
     117,   119,   187,   118,   122,    45,    95,    96,   193,    98,
      99,   338,   339,   198,   111,   349,   324,   325,    48,   119,
     328,    45,   349,   121,   462,   349,   464,   101,   120,   400,
     118,   105,   116,   218,   120,   121,   400,   617,   618,   400,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    53,    54,    55,    56,    57,    58,   118,
     498,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   398,   118,   628,   259,    36,    37,    38,    39,    40,
      41,    42,    43,    44,   269,   118,   457,    48,    49,    50,
      51,   136,   137,   457,   117,   441,   457,    37,    38,    39,
      40,   115,   115,    45,   431,   432,   433,    46,     3,   453,
      47,    45,    45,   457,    45,     9,   106,   461,   116,   116,
     102,   492,   493,   494,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      37,    38,    39,    40,   119,     3,     3,   332,   333,    45,
     115,     3,     3,     3,     3,   115,     1,   115,     3,     3,
       3,     3,     3,     8,   349,    10,    11,    12,    13,   122,
     355,   118,    17,    18,    19,    20,     3,   107,    23,     3,
      25,   119,    27,     3,    29,   117,     3,    21,     3,    22,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    31,     3,    48,    49,    50,    51,     3,   118,     3,
     116,   123,   124,   125,   117,   400,   117,   119,   118,    44,
     405,   406,   407,   408,   409,   410,   411,   119,   118,    94,
      52,   116,    24,   117,   116,   420,   580,   422,   423,   424,
      26,   117,   569,   570,   571,    44,   617,   618,   575,   434,
     435,    44,   437,   617,   618,   626,   617,   618,     3,    44,
      44,    44,    44,   108,    44,    44,     3,   115,     3,     3,
     115,     3,   457,     3,     3,     3,    16,   117,     1,   117,
       3,   117,    28,     3,   116,     3,    93,    10,    11,    12,
      13,   151,   145,   478,    17,    18,    19,    20,   176,   154,
      23,   628,    25,   501,    27,   193,    29,   492,   493,   494,
     349,   457,   478,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,   383,   400,    48,    49,    50,    51,   514,
     515,   516,   517,   518,   519,   520,   521,   522,   631,   524,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    36,    37,    38,    39,
      40,    41,    42,    43,    44,   636,   192,   399,    48,   483,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,   375,   108,   481,   379,   186,    11,
      15,    19,   115,   101,    -1,   580,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      -1,    -1,    48,   119,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   617,   618,    -1,    -1,    -1,   117,    -1,    -1,
     123,   626,   125,   126,   127,   128,   129,   130,   131,   132,
      -1,   636,    -1,    -1,    -1,    -1,    -1,    -1,   115,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   123,    -1,   125,   126,
     127,   128,   129,   130,   131,   132,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    -1,    -1,    48,   115,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
      -1,   118,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    -1,    46,    47,
      48,    49,    50,    51,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    -1,    46,    47,    48,    49,    50,    51,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    -1,
      46,    47,    48,    49,    50,    51,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    -1,    46,    47,    48,    49,
      50,    51,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    -1,    -1,    48,    49,    50,    51,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    -1,    -1,
      48,    -1,    50,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    -1,    -1,    -1,    48,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    36,    37,    38,    39,    40,
      41,    42,    43,    44
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   112,   113,   135,     3,   137,   283,   136,   137,     0,
      10,    14,    35,   114,   133,   284,   285,   286,   289,   291,
     292,   295,     4,     5,     6,     7,    11,    12,    14,    18,
     101,   105,   138,   139,   140,   141,   142,   143,   153,   154,
     155,   156,   157,   161,   163,   268,    45,   119,   287,    45,
      46,    47,    48,    49,    50,    51,   287,   296,   297,   298,
     299,   293,   285,     3,   290,   295,    35,    45,    45,    45,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
     164,   278,   279,    46,    45,   119,    37,    38,    39,    40,
     270,   278,    36,     3,   137,   115,   165,   117,    45,   288,
       3,   117,    81,    82,    83,    84,    90,    91,   294,   118,
      45,   158,   159,   160,   278,   278,   278,   278,   111,   139,
     144,   145,   146,   278,     3,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,   166,    48,
     120,   121,   298,    45,   120,   121,   118,   118,   118,   118,
     116,   117,   168,   169,   115,   115,   264,   265,   265,   265,
      45,   160,    46,    47,    45,    45,     3,   146,   176,     9,
     170,   164,    45,   103,   104,   147,   148,   149,   150,   151,
     152,     1,     3,     8,    10,    13,    17,    19,    20,    23,
      25,    27,    29,    35,    36,    41,    42,    43,    44,    45,
      48,    49,    50,    51,   108,   115,   154,   162,   177,   178,
     179,   184,   185,   186,   187,   188,   189,   190,   191,   201,
     202,   203,   205,   206,   209,   211,   212,   217,   218,   219,
     220,   229,   230,   231,   232,   233,   234,   236,   237,   243,
     244,   245,   246,   254,   255,   266,   267,   268,   269,   275,
     276,   277,   278,   279,    37,    38,    39,    40,   171,   274,
     116,   116,   274,   106,   102,   149,     3,     3,    45,   274,
     270,    48,   115,   231,   247,   278,   247,     3,     3,     3,
     237,   178,    48,   275,   278,   278,   119,   199,   115,   180,
     238,   239,   240,   275,     3,     3,    45,    46,    47,    48,
     192,   193,   194,   195,   196,   197,   198,   199,   236,   272,
     277,   278,     3,     3,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,   207,   272,   275,   277,
       3,   247,   122,   118,     3,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,   118,
     282,   199,   172,   278,   107,   117,   213,   214,   215,   278,
      45,   248,   249,   250,   251,   252,   253,   271,   272,   275,
       3,     3,     3,    21,   256,   257,   258,    22,   259,   260,
     261,    31,   221,   222,   223,     3,     3,     3,   200,   271,
     118,   109,   110,   181,   182,   183,     3,   116,   117,   241,
     117,   118,   199,    44,   117,   210,   210,   210,   210,   210,
     210,   210,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    48,   117,    44,   117,    53,    54,    55,    56,    57,
      58,   273,   273,   273,    44,   210,   273,   210,    45,    48,
      50,   235,   278,   231,    46,    47,   275,    46,    47,   275,
      45,    46,    47,    48,   123,   124,   125,   191,   204,   231,
     275,   279,   280,   271,   118,     3,    94,    95,    96,    98,
      99,   100,   173,   174,   175,   242,   236,     3,   117,    94,
     216,    52,   116,   117,   262,   252,    24,   258,   252,    26,
     261,   252,    15,    30,    33,   224,   223,   120,   121,   271,
     116,   117,   240,   242,   196,   199,   271,   278,   278,   278,
     278,   278,   278,   278,    44,    44,    44,    44,    44,    44,
      44,    44,    44,   278,   210,   278,   278,   278,    45,    46,
      47,   208,   275,    45,    46,    47,   275,    45,    46,    47,
     275,   278,   278,   271,   278,   247,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
     123,   125,   126,   127,   128,   129,   130,   131,   132,   281,
     281,   281,   199,   197,   199,   281,   199,   271,   271,   264,
     115,     3,   214,   253,   250,    95,    97,   263,     3,     3,
       3,     3,     3,   236,   236,   236,     3,   271,   183,   278,
     278,   278,   278,   278,   278,   278,   278,   278,   278,    45,
     275,    46,    47,   275,    46,    47,   275,   117,   117,   275,
      45,   167,   199,   278,   264,     3,   117,   225,    32,   212,
     226,   227,   228,   194,   194,   116,    16,   236,   240,    28,
     228,   235,     3,     3
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
#line 535 "pir.y"
    { fixup_global_labels(lexer); ;}
    break;

  case 19:
#line 565 "pir.y"
    { new_macro_const(lexer->macros, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval), yypirget_lineno(yyscanner)); ;}
    break;

  case 20:
#line 571 "pir.y"
    { /* fprintf(stderr, "macro body: [%s]\n", CURRENT_MACRO(lexer)->body);*/ ;}
    break;

  case 21:
#line 575 "pir.y"
    {
                          new_macro(lexer->macros, (yyvsp[(2) - (2)].sval), yypirget_lineno(yyscanner), TRUE,
                                    lexer->macro_size);
                        ;}
    break;

  case 26:
#line 590 "pir.y"
    { add_macro_param(CURRENT_MACRO(lexer), (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 34:
#line 609 "pir.y"
    { store_macro_string(CURRENT_MACRO(lexer), "%s\n", (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 35:
#line 613 "pir.y"
    {
                          store_macro_string(CURRENT_MACRO(lexer), ".local %s %s\n",
                                             pir_type_names[(yyvsp[(2) - (3)].ival)], (yyvsp[(3) - (3)].sval));
                        ;}
    break;

  case 36:
#line 624 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 37:
#line 628 "pir.y"
    { yypirset_lineno ((yyvsp[(2) - (2)].ival), yyscanner); ;}
    break;

  case 38:
#line 630 "pir.y"
    { lexer->filename = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 39:
#line 636 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 640 "pir.y"
    { set_hll_map(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 41:
#line 644 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 42:
#line 648 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 43:
#line 650 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 44:
#line 654 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 45:
#line 656 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 46:
#line 660 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 48:
#line 670 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 49:
#line 674 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 54:
#line 686 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 55:
#line 688 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 56:
#line 690 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 57:
#line 692 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 58:
#line 694 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 59:
#line 696 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 60:
#line 698 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 61:
#line 700 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 62:
#line 702 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 63:
#line 704 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 64:
#line 706 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 65:
#line 708 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 66:
#line 710 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 70:
#line 719 "pir.y"
    { /* XXX */
                           /* generate_get_params(lexer); */
                           set_instr(lexer, "get_params");
                           update_op(lexer, CURRENT_INSTRUCTION(lexer), PARROT_OP_get_params_pc);
                         ;}
    break;

  case 73:
#line 731 "pir.y"
    { set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 74:
#line 735 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 75:
#line 739 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 76:
#line 741 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 80:
#line 750 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT;
                           /* XXX handle multi_type */

                         ;}
    break;

  case 81:
#line 757 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 84:
#line 767 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 101:
#line 792 "pir.y"
    { expand_macro(yyscanner, (yyvsp[(1) - (3)].mval), (yyvsp[(2) - (3)].pval)); ;}
    break;

  case 102:
#line 796 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 103:
#line 798 "pir.y"
    { (yyval.pval) = (yyvsp[(2) - (3)].pval); ;}
    break;

  case 104:
#line 802 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 106:
#line 807 "pir.y"
    { (yyval.pval) = new_macro_param((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 107:
#line 809 "pir.y"
    {
                          macro_param *param = new_macro_param((yyvsp[(3) - (3)].sval));
                          param->next = (yyvsp[(1) - (3)].pval);
                          (yyval.pval) = param;
                        ;}
    break;

  case 108:
#line 817 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "macro argument '%s' is not a "
                                                           "declared identifier", (yyvsp[(1) - (1)].sval));
                          }
                        ;}
    break;

  case 110:
#line 832 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 112:
#line 840 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         ;}
    break;

  case 113:
#line 849 "pir.y"
    {
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 114:
#line 856 "pir.y"
    {
                           set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 118:
#line 870 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 119:
#line 879 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(yyscanner))
                              do_strength_reduction(yyscanner);
                        ;}
    break;

  case 125:
#line 897 "pir.y"
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

  case 126:
#line 933 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 127:
#line 938 "pir.y"
    { push_operand(lexer, expr_from_key(lexer, (yyvsp[(1) - (1)].key))); ;}
    break;

  case 128:
#line 942 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 129:
#line 944 "pir.y"
    { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 130:
#line 949 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 131:
#line 951 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 132:
#line 955 "pir.y"
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

  case 133:
#line 978 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 134:
#line 982 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 135:
#line 984 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 136:
#line 993 "pir.y"
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

  case 137:
#line 1004 "pir.y"
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

  case 138:
#line 1016 "pir.y"
    { /* XXX create a PMC const for $4 */
                          unshift_operand(lexer, expr_from_key(lexer, (yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));
                          if (check_op_args_for_symbols(yyscanner))
                              check_first_arg_direction(yyscanner, (yyvsp[(3) - (6)].sval));
                              /* no strength reduction here */
                        ;}
    break;

  case 139:
#line 1026 "pir.y"
    { get_opinfo(yyscanner); ;}
    break;

  case 140:
#line 1030 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 141:
#line 1037 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 142:
#line 1044 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 143:
#line 1046 "pir.y"
    { unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ))); ;}
    break;

  case 144:
#line 1048 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (3)].sval));
                          if (sym == NULL) {
                              if (!is_parrot_op(lexer, (yyvsp[(3) - (3)].sval)))
                                  yypirerror(yyscanner, lexer, "'%s' is neither a declared symbol "
                                                            "nor a parrot opcode", (yyvsp[(3) - (3)].sval));
                              else { /* handle it as an op */
                                  unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                                  check_first_arg_direction(yyscanner, (yyvsp[(3) - (3)].sval));
                              }
                          }
                          else { /* handle it as a symbol */
                              update_instr(lexer, "set");
                              unshift_operand(lexer, expr_from_target(lexer,
                                                     target_from_symbol(lexer, sym)));
                              unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                          }
                        ;}
    break;

  case 145:
#line 1067 "pir.y"
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
                              if (is_parrot_op(lexer, (yyvsp[(3) - (4)].sval)))
                                  set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), expr_from_key(lexer, (yyvsp[(4) - (4)].key)));
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
                          }
                        ;}
    break;

  case 146:
#line 1104 "pir.y"
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
                        ;}
    break;

  case 147:
#line 1121 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                        ;}
    break;

  case 148:
#line 1127 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 149:
#line 1129 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 150:
#line 1138 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 151:
#line 1147 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 152:
#line 1156 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 153:
#line 1165 "pir.y"
    { set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 154:
#line 1167 "pir.y"
    { set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 155:
#line 1169 "pir.y"
    { set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 156:
#line 1171 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));
                        ;}
    break;

  case 157:
#line 1178 "pir.y"
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
                      ;}
    break;

  case 158:
#line 1196 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                        ;}
    break;

  case 159:
#line 1229 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 160:
#line 1231 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 161:
#line 1233 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 162:
#line 1235 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 163:
#line 1237 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 164:
#line 1239 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 165:
#line 1241 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 166:
#line 1243 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 167:
#line 1248 "pir.y"
    { get_opinfo(yyscanner); ;}
    break;

  case 168:
#line 1257 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 169:
#line 1259 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 170:
#line 1261 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 171:
#line 1263 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 172:
#line 1265 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 173:
#line 1267 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 174:
#line 1269 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 175:
#line 1271 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 176:
#line 1273 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 177:
#line 1275 "pir.y"
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

  case 178:
#line 1287 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (5)].ival)), (yyvsp[(5) - (5)].sval));
                        ;}
    break;

  case 179:
#line 1292 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 180:
#line 1294 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 181:
#line 1296 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 182:
#line 1298 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 183:
#line 1300 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 184:
#line 1302 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 185:
#line 1304 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 186:
#line 1306 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 187:
#line 1308 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 188:
#line 1310 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 189:
#line 1312 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 190:
#line 1314 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 191:
#line 1316 "pir.y"
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
                                set_op_labelflag(lexer, BIT(1));
                             }
                             else                       /* if false, unless true --> do nothing */
                                set_instr(lexer, "noop");

                          }
                        ;}
    break;

  case 192:
#line 1347 "pir.y"
    {
                          /* the instructions "gt" and "ge" are converted to "lt" and "le".
                           * if so, then the arguments must be reversed as well. "lt" and
                           * "le" are 1 position after "gt" and "ge" respectively in the
                           * opnames array; hence the [$2 + 1] index.
                           */
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%E%T", (yyvsp[(3) - (3)].expr), (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;  /* indicates this is evaluated at runtime */
                        ;}
    break;

  case 193:
#line 1361 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%i", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].ival));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 194:
#line 1369 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%n", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].dval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 195:
#line 1378 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%s", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].sval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 196:
#line 1387 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 197:
#line 1389 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 198:
#line 1391 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 199:
#line 1393 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 200:
#line 1395 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 201:
#line 1399 "pir.y"
    {
                          yypirerror(yyscanner, lexer, "cannot compare string to %s",
                                     (yyvsp[(3) - (3)].ival) == INT_TYPE ? "integer" : "number");
                        ;}
    break;

  case 202:
#line 1404 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare integer to string"); ;}
    break;

  case 203:
#line 1406 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare number to string"); ;}
    break;

  case 204:
#line 1410 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 205:
#line 1411 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 206:
#line 1414 "pir.y"
    { (yyval.ival) = DONT_INVERT_OPNAME; /* no need to invert */ ;}
    break;

  case 207:
#line 1415 "pir.y"
    { (yyval.ival) = NEED_INVERT_OPNAME; /* yes, invert opname */ ;}
    break;

  case 210:
#line 1423 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_op_labelflag(lexer, BIT(1));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 211:
#line 1431 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 212:
#line 1435 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 213:
#line 1437 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 214:
#line 1441 "pir.y"
    { (yyval.symb) = new_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 215:
#line 1445 "pir.y"
    { /* try to find symbol for this id; if found, it was already declared */
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym)
                              yypirerror(yyscanner, lexer, "symbol '%s' is already declared", (yyvsp[(1) - (1)].sval));
                          (yyval.sval) = (yyvsp[(1) - (1)].sval);
                        ;}
    break;

  case 216:
#line 1453 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 217:
#line 1454 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 218:
#line 1458 "pir.y"
    { /* if $4 is not a register, it must be a declared symbol */
                          if (!TEST_FLAG((yyvsp[(4) - (5)].targ)->flags, TARGET_FLAG_IS_REG)) {

                              if ((yyvsp[(4) - (5)].targ)->s.sym->type != PMC_TYPE) /* a .lex must be a PMC */
                                  yypirerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                             (yyvsp[(4) - (5)].targ)->s.sym->name);
                          }
                          set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                        ;}
    break;

  case 219:
#line 1473 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 222:
#line 1485 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                              (yyval.invo) = (yyvsp[(4) - (8)].invo);
                            ;}
    break;

  case 223:
#line 1493 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 224:
#line 1495 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 225:
#line 1499 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 226:
#line 1501 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 227:
#line 1505 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 228:
#line 1509 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 229:
#line 1511 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 230:
#line 1514 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].expr)); ;}
    break;

  case 231:
#line 1518 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 232:
#line 1520 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 233:
#line 1524 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 234:
#line 1526 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 235:
#line 1530 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 236:
#line 1532 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 237:
#line 1536 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 238:
#line 1538 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 240:
#line 1546 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 241:
#line 1550 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 242:
#line 1554 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL);
                             (yyval.invo) = (yyvsp[(1) - (1)].invo);
                           ;}
    break;

  case 245:
#line 1564 "pir.y"
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

  case 246:
#line 1592 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 247:
#line 1599 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 248:
#line 1601 "pir.y"
    {
                               symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                               if (sym == NULL)
                                   sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                               (yyval.targ) = target_from_symbol(lexer, sym); ;}
    break;

  case 249:
#line 1610 "pir.y"
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

  case 250:
#line 1627 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 251:
#line 1629 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 252:
#line 1631 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 253:
#line 1635 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);

                           ;}
    break;

  case 254:
#line 1644 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 255:
#line 1649 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 256:
#line 1653 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 257:
#line 1655 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 258:
#line 1659 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 259:
#line 1661 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 260:
#line 1665 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 261:
#line 1669 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 262:
#line 1671 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 263:
#line 1675 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 264:
#line 1677 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 265:
#line 1679 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 266:
#line 1681 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 267:
#line 1691 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 272:
#line 1701 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 273:
#line 1707 "pir.y"
    { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              (yyval.invo) = (yyvsp[(2) - (3)].invo);
                            ;}
    break;

  case 274:
#line 1718 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 275:
#line 1725 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 276:
#line 1729 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 277:
#line 1731 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 278:
#line 1735 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 279:
#line 1737 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 282:
#line 1745 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 283:
#line 1749 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 284:
#line 1753 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument(lexer, (yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 285:
#line 1759 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 286:
#line 1768 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 287:
#line 1775 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 288:
#line 1777 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 289:
#line 1782 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 290:
#line 1784 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 291:
#line 1789 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 292:
#line 1793 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 293:
#line 1795 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 294:
#line 1799 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 295:
#line 1801 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 296:
#line 1805 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 297:
#line 1810 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 298:
#line 1812 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 299:
#line 1816 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 300:
#line 1818 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 301:
#line 1825 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 302:
#line 1827 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 303:
#line 1831 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 307:
#line 1842 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 308:
#line 1846 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 309:
#line 1850 "pir.y"
    { (yyval.cval) = new_named_const(lexer, INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 310:
#line 1852 "pir.y"
    { (yyval.cval) = new_named_const(lexer, NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 311:
#line 1854 "pir.y"
    { (yyval.cval) = new_named_const(lexer, STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 312:
#line 1856 "pir.y"
    { (yyval.cval) = new_named_const(lexer, PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 313:
#line 1877 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 314:
#line 1878 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 315:
#line 1882 "pir.y"
    { (yyval.cval) = new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 316:
#line 1883 "pir.y"
    { (yyval.cval) = new_const(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 317:
#line 1884 "pir.y"
    { (yyval.cval) = new_const(lexer, NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 318:
#line 1887 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 319:
#line 1888 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 320:
#line 1889 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 321:
#line 1890 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 322:
#line 1891 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 323:
#line 1892 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 324:
#line 1895 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 325:
#line 1896 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 326:
#line 1897 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 327:
#line 1898 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 328:
#line 1906 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 330:
#line 1910 "pir.y"
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

  case 331:
#line 1923 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 332:
#line 1924 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 333:
#line 1925 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 334:
#line 1926 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 337:
#line 1934 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 338:
#line 1935 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 339:
#line 1936 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 340:
#line 1937 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 341:
#line 1938 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 342:
#line 1939 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 343:
#line 1940 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 344:
#line 1941 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 345:
#line 1944 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 346:
#line 1945 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 347:
#line 1946 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 348:
#line 1949 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 349:
#line 1950 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 350:
#line 1951 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 351:
#line 1952 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 352:
#line 1953 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 353:
#line 1954 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 354:
#line 1955 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 355:
#line 1956 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 356:
#line 1957 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 357:
#line 1958 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 358:
#line 1959 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 359:
#line 1960 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 360:
#line 1961 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 361:
#line 1962 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 362:
#line 1963 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 363:
#line 1964 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 364:
#line 1965 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 365:
#line 1966 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 366:
#line 1967 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 367:
#line 1968 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 368:
#line 1969 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 369:
#line 1970 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 370:
#line 1971 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 371:
#line 1977 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 372:
#line 1978 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 373:
#line 1979 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 374:
#line 1980 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 375:
#line 1981 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 376:
#line 1982 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 377:
#line 1983 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 378:
#line 1984 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 379:
#line 1985 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 380:
#line 1986 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 381:
#line 1987 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 382:
#line 1988 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 383:
#line 1996 "pir.y"
    { fprintf(stderr, "PASM input is not handled yet.\n"); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4484 "pirparser.c"
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


#line 2070 "pir.y"



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

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
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


    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer));

    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer)->opinfo);

    /* op_count also counts the instruction itself, so must be at least 2 */
    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer)->opinfo->op_count >= 2);

    /* get the direction of the first argument */
    dir_first_arg = CURRENT_INSTRUCTION(lexer)->opinfo->dirs[0];

    /* direction cannot be IN or INOUT */
    if (dir_first_arg == PARROT_ARGDIR_IN)
        yypirerror(yyscanner, lexer, "cannot write first arg of op '%s' as a target "
                                  "(direction of argument is IN).", opname);

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
    fprintf(stderr, "check args\n");

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
                fprintf(stderr, "%s must be a label\n", operand->expr.id);
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

        iter = iter->next; /* go to first */


        /* iterate over all operands */
        while (iter != CURRENT_INSTRUCTION(lexer)->operands->next) {
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
                /* fprintf(stderr, "operand %d is expected to be a label\n", i); */

            }

            iter = iter->next;
            ++i;
        }
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


