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
     TK_PCC_SUB = 369,
     TK_PARROT_OP = 370
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
#define TK_PCC_SUB 369
#define TK_PARROT_OP 370




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
#line 579 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 592 "pirparser.c"

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
#define YYLAST   944

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  134
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  158
/* YYNRULES -- Number of rules.  */
#define YYNRULES  398
/* YYNRULES -- Number of states.  */
#define YYNSTATES  619

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
       2,     2,     2,   125,     2,     2,     2,   130,   132,     2,
     116,   117,   129,   127,   118,   124,   123,   128,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   122,
       2,   119,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   120,     2,   121,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   131,     2,   126,     2,     2,     2,
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
     115,   133
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
    1096,  1098,  1100,  1102,  1105,  1107,  1109,  1112,  1114,  1117,
    1119,  1122,  1125,  1128,  1130,  1132,  1134,  1138,  1140
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     135,     0,    -1,   113,   136,    -1,   112,   283,    -1,   137,
     138,   137,    -1,    -1,     3,    -1,   139,    -1,   138,     3,
     139,    -1,   161,    -1,   268,    -1,   157,    -1,   155,    -1,
     156,    -1,   153,    -1,   154,    -1,   140,    -1,   141,    -1,
     142,    -1,   105,    36,   111,    -1,   143,   116,   144,   117,
       3,   147,   102,    -1,   101,   278,    -1,    -1,   145,    -1,
     146,    -1,   145,   118,   146,    -1,   278,    -1,    -1,   148,
      -1,   149,    -1,   148,   149,    -1,   150,     3,    -1,   151,
      -1,   152,    -1,   104,   106,    -1,   103,   274,   107,    -1,
       6,    45,    -1,    11,    46,    -1,    12,    45,    -1,     4,
      45,    -1,     5,    45,   119,    45,    -1,    14,   120,   158,
     121,    -1,    -1,   159,    -1,   160,    -1,   159,   122,   160,
      -1,    45,    -1,   163,   165,     3,   168,   176,   162,    -1,
       8,    -1,     7,   164,    -1,   278,    -1,    45,    -1,    -1,
     165,   166,    -1,    84,    -1,    81,    -1,    82,    -1,    83,
      -1,    85,    -1,    88,    -1,    90,    -1,    91,    -1,    89,
      -1,    86,   116,   164,   117,    -1,    87,   264,    -1,    92,
     265,    -1,    93,   265,    -1,   278,    -1,    45,    -1,   199,
      -1,   169,    -1,    -1,   169,   170,    -1,     9,   171,   172,
       3,    -1,   274,   278,    -1,    -1,   172,   173,    -1,   242,
      -1,   174,    -1,   175,    -1,   100,   116,   167,   117,    -1,
      94,    -1,    -1,   176,   177,    -1,    35,   178,    -1,   178,
      -1,   189,    -1,   205,    -1,   211,    -1,   212,    -1,   217,
      -1,   266,    -1,   243,    -1,   218,    -1,   202,    -1,   188,
      -1,   187,    -1,   184,    -1,   185,    -1,   179,    -1,   186,
      -1,   108,   180,     3,    -1,    -1,   116,   181,   117,    -1,
      -1,   182,    -1,   183,    -1,   182,   118,   183,    -1,   109,
      -1,   110,    -1,     3,    -1,   154,     3,    -1,     1,     3,
      -1,    43,   275,     3,    -1,    29,   237,     3,    -1,   190,
       3,    -1,   191,   192,    -1,   201,    -1,    36,    -1,   193,
      -1,   195,    -1,    -1,   194,    -1,   196,    -1,   194,   118,
     196,    -1,   199,   119,   271,    -1,   197,    -1,   199,    -1,
     272,    -1,   278,    -1,   277,    -1,   198,    -1,   236,   199,
      -1,   120,   200,   121,    -1,   271,    -1,   200,   122,   271,
      -1,   275,   119,   191,   197,   118,   194,    -1,   275,   119,
     191,   197,    -1,   275,   119,   191,   199,   118,   194,    -1,
     203,     3,    -1,   275,   119,    46,    -1,   275,   119,    47,
      -1,   275,   119,    45,    -1,   275,   119,   204,    -1,   275,
     119,   191,    -1,   275,   119,   191,   199,    -1,   275,   119,
     279,   199,    -1,   275,   119,    48,   199,    -1,   275,   282,
     271,    -1,   275,    70,    46,    -1,   275,    70,    47,    -1,
     275,    71,    46,    -1,   275,    71,    47,    -1,   275,    70,
     275,    -1,   275,    71,   275,    -1,   275,   119,   280,   271,
      -1,   275,   119,   275,   281,   275,    -1,   279,   199,   119,
     271,    -1,    48,   199,   119,   271,    -1,    46,   281,   275,
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
     278,    -1,   209,    44,   118,   278,    -1,   209,    43,    44,
     278,    -1,   209,    43,   118,   278,    -1,   209,   207,    44,
     278,    -1,   275,   273,   271,    -1,    46,   273,   275,    -1,
      47,   273,   275,    -1,    45,   273,   275,    -1,    46,   273,
      46,    -1,    46,   273,    47,    -1,    47,   273,    46,    -1,
      47,   273,    47,    -1,    45,   273,    45,    -1,    45,   273,
     208,    -1,    46,   273,    45,    -1,    47,   273,    45,    -1,
      46,    -1,    47,    -1,    41,    -1,    42,    -1,    44,    -1,
     118,    -1,    44,   278,     3,    -1,    13,   274,   213,     3,
      -1,   214,    -1,   213,   118,   214,    -1,   215,   216,    -1,
     278,    -1,    -1,    94,    -1,    10,    45,   118,   236,     3,
      -1,   219,    -1,   220,    -1,   229,    -1,    27,     3,   221,
     224,     3,   226,    28,     3,    -1,    -1,   222,    -1,   223,
      -1,   222,   223,    -1,    31,   252,     3,    -1,    30,   236,
     225,    -1,    33,   236,    -1,    15,   236,     3,    16,   235,
      -1,    -1,   118,   236,    -1,    -1,   227,    -1,   228,    -1,
     227,   228,    -1,    32,   240,     3,    -1,   212,    -1,   230,
       3,    -1,   237,   119,   231,    -1,   275,   119,   231,    -1,
     231,    -1,   233,    -1,   232,    -1,   236,   123,   235,   247,
      -1,   234,   247,    -1,   236,    -1,    45,    -1,   278,    -1,
      48,    -1,    50,    -1,    45,    -1,   278,    -1,    48,    -1,
     116,   238,   117,    -1,    -1,   239,    -1,   240,    -1,   239,
     118,   240,    -1,   275,   241,    -1,    -1,   241,   242,    -1,
      98,    -1,    99,    -1,    96,    -1,    95,   264,    -1,   244,
      -1,   245,    -1,   254,    -1,   246,    -1,   255,    -1,    19,
     247,     3,    -1,    19,   231,     3,    -1,    20,   247,     3,
      -1,   116,   248,   117,    -1,    -1,   249,    -1,   250,    -1,
     249,   118,   250,    -1,   252,    -1,   251,    -1,    45,    52,
     253,    -1,   253,   262,    -1,   271,    -1,    25,     3,   259,
      26,     3,    -1,    23,     3,   256,    24,     3,    -1,    -1,
     257,    -1,   258,    -1,   257,   258,    -1,    21,   252,     3,
      -1,    -1,   260,    -1,   261,    -1,   260,   261,    -1,    22,
     252,     3,    -1,    -1,   262,   263,    -1,    97,    -1,    95,
     264,    -1,    -1,   265,    -1,   116,    45,   117,    -1,   267,
       3,    -1,   268,    -1,   269,    -1,    18,   270,    -1,    17,
     270,    -1,    37,   278,   119,    46,    -1,    38,   278,   119,
      47,    -1,    40,   278,   119,    45,    -1,    39,   278,   119,
      45,    -1,   275,    -1,   272,    -1,    45,    -1,    46,    -1,
      47,    -1,    53,    -1,    54,    -1,    55,    -1,    56,    -1,
      58,    -1,    57,    -1,    37,    -1,    38,    -1,    39,    -1,
      40,    -1,   276,    -1,   277,    -1,   278,    -1,    48,    -1,
      49,    -1,    51,    -1,    50,    -1,    36,    -1,   279,    -1,
      41,    -1,    42,    -1,    44,    -1,    37,    -1,    38,    -1,
      40,    -1,    39,    -1,    43,    -1,   124,    -1,   125,    -1,
     126,    -1,   127,    -1,   124,    -1,   128,    -1,   129,    -1,
     130,    -1,   131,    -1,   132,    -1,   126,    -1,   133,    -1,
      66,    -1,    59,    -1,    60,    -1,    61,    -1,    63,    -1,
      64,    -1,    62,    -1,    65,    -1,    54,    -1,    56,    -1,
      55,    -1,    58,    -1,    57,    -1,    53,    -1,    72,    -1,
      73,    -1,    74,    -1,    75,    -1,    78,    -1,    76,    -1,
      77,    -1,    79,    -1,    80,    -1,    68,    -1,    69,    -1,
      67,    -1,   284,   285,    -1,   137,    -1,   286,    -1,   285,
     286,    -1,   287,    -1,   157,     3,    -1,   217,    -1,   154,
       3,    -1,    35,   288,    -1,   289,   288,    -1,   291,    -1,
     184,    -1,   291,    -1,   290,   165,    35,    -1,   114,    -1,
     191,   193,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   527,   527,   528,   533,   539,   540,   543,   544,   547,
     548,   549,   550,   551,   552,   553,   554,   561,   562,   565,
     569,   575,   582,   583,   586,   587,   590,   594,   595,   598,
     599,   602,   605,   606,   609,   613,   624,   628,   630,   636,
     640,   644,   649,   650,   654,   656,   660,   664,   670,   674,
     678,   679,   682,   683,   686,   688,   690,   692,   694,   696,
     698,   700,   702,   704,   706,   708,   710,   714,   715,   716,
     719,   727,   728,   731,   735,   740,   741,   745,   746,   747,
     750,   757,   763,   764,   767,   769,   772,   773,   774,   775,
     776,   777,   778,   779,   780,   781,   782,   783,   784,   785,
     786,   792,   797,   798,   803,   804,   807,   809,   817,   825,
     832,   836,   840,   849,   856,   863,   866,   867,   870,   879,
     886,   889,   890,   893,   894,   897,   933,   935,   942,   944,
     949,   951,   955,   978,   982,   984,   993,  1004,  1016,  1026,
    1029,  1038,  1047,  1052,  1057,  1078,  1118,  1136,  1143,  1148,
    1159,  1170,  1181,  1192,  1197,  1202,  1207,  1216,  1235,  1269,
    1271,  1273,  1275,  1277,  1279,  1281,  1283,  1288,  1297,  1299,
    1301,  1303,  1305,  1307,  1309,  1311,  1313,  1315,  1327,  1332,
    1334,  1336,  1338,  1340,  1342,  1344,  1346,  1348,  1350,  1352,
    1354,  1356,  1387,  1401,  1409,  1418,  1427,  1429,  1431,  1433,
    1435,  1439,  1444,  1446,  1451,  1452,  1455,  1456,  1459,  1460,
    1463,  1471,  1475,  1477,  1481,  1485,  1494,  1495,  1498,  1513,
    1517,  1518,  1521,  1534,  1535,  1539,  1541,  1545,  1549,  1551,
    1553,  1559,  1560,  1565,  1566,  1570,  1572,  1576,  1578,  1582,
    1586,  1590,  1594,  1600,  1601,  1604,  1632,  1639,  1641,  1650,
    1667,  1669,  1671,  1675,  1684,  1689,  1694,  1695,  1699,  1701,
    1705,  1710,  1711,  1715,  1717,  1719,  1721,  1731,  1735,  1736,
    1737,  1738,  1741,  1747,  1758,  1765,  1770,  1771,  1775,  1777,
    1781,  1782,  1785,  1789,  1793,  1797,  1806,  1816,  1817,  1822,
    1824,  1829,  1834,  1835,  1839,  1841,  1845,  1851,  1852,  1856,
    1858,  1866,  1867,  1871,  1875,  1878,  1879,  1882,  1886,  1890,
    1892,  1894,  1896,  1918,  1919,  1923,  1924,  1925,  1928,  1929,
    1930,  1931,  1932,  1933,  1936,  1937,  1938,  1939,  1947,  1950,
    1951,  1964,  1965,  1966,  1967,  1971,  1972,  1975,  1976,  1977,
    1978,  1979,  1980,  1981,  1982,  1985,  1986,  1987,  1990,  1991,
    1992,  1993,  1994,  1995,  1996,  1997,  1998,  1999,  2000,  2001,
    2002,  2003,  2004,  2005,  2006,  2007,  2008,  2009,  2010,  2011,
    2012,  2018,  2019,  2020,  2021,  2022,  2023,  2024,  2025,  2026,
    2027,  2028,  2029,  2035,  2043,  2047,  2048,  2051,  2052,  2053,
    2054,  2057,  2059,  2060,  2063,  2064,  2067,  2071,  2075
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
  "\"<pasm-marker>\"", "\"<pir-marker>\"", "\".pcc_sub\"", "\"parrot-op\"",
  "'('", "')'", "','", "'='", "'['", "']'", "';'", "'.'", "'-'", "'!'",
  "'~'", "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"", "$accept",
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
     365,   366,   367,   368,   369,   370,    40,    41,    44,    61,
      91,    93,    59,    46,    45,    33,   126,    43,    47,    42,
      37,   124,    38,   371
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
     282,   282,   282,   283,   284,   285,   285,   286,   286,   286,
     286,   287,   287,   287,   288,   288,   289,   290,   291
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
       1,     1,     1,     2,     1,     1,     2,     1,     2,     1,
       2,     2,     2,     1,     1,     1,     3,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     5,     5,     0,     6,   384,     3,     0,     2,     0,
       1,     0,     0,     0,     0,     0,   118,   397,     0,     0,
     121,   389,   383,   385,   387,     0,    52,   393,     0,     0,
       0,     0,     0,     0,     0,     5,     7,    16,    17,    18,
       0,    14,    15,    12,    13,    11,     9,    52,    10,     0,
      37,    38,    42,   110,   394,   391,   395,   390,   388,   335,
     340,   341,   343,   342,   337,   338,   344,   339,   315,   316,
     317,   331,   332,   334,   333,     0,     0,   122,   123,   126,
     131,   127,     0,   128,   130,   129,   336,   386,   392,     0,
      39,     0,    36,    51,    49,    50,     0,     0,     0,     0,
     307,    21,     0,     6,     4,    22,     0,     0,    46,     0,
      43,    44,   331,     0,   134,   314,   313,   328,   329,   330,
     398,     0,   132,   396,    55,    56,    57,    54,    58,     0,
     301,    59,    62,    60,    61,     0,     0,    53,     0,     0,
       0,     0,     0,    19,     8,     0,    23,    24,    26,    71,
     254,     0,   253,    41,     0,   133,     0,   124,     0,     0,
      64,   302,    65,    66,    40,     0,     0,     0,     0,     0,
       0,    82,    70,   218,    45,   135,     0,     0,   309,   310,
     312,   311,    27,    25,     0,     0,    72,    63,   303,     0,
       0,     0,    28,    29,     0,    32,    33,     0,    48,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   335,   337,
     338,   344,   339,   248,   331,   102,   256,     0,    47,    83,
      85,    99,    97,    98,   100,    96,    95,    86,     0,   121,
     117,    94,     0,    87,     0,     0,    88,    89,    90,    93,
     219,   220,   221,     0,   242,   244,   243,     0,   247,     0,
      92,   267,   268,   270,   269,   271,    91,     0,   305,   306,
       0,   330,   336,   324,   325,   326,   327,    75,     0,     0,
      34,    20,    30,    31,   112,     0,   308,   276,     0,     0,
       0,   287,   292,   223,     0,    84,     0,     0,     0,   104,
       0,     0,   257,   258,   261,   111,   115,   116,   119,   120,
     127,   139,   167,   335,   340,   341,   343,   342,   337,   338,
     344,   339,   315,   316,   317,     0,     0,     0,   329,   239,
     246,     0,     0,   304,   382,   380,   381,     0,     0,   371,
     372,   373,   374,   376,   377,   375,   378,   379,     0,     0,
       0,     0,    74,    35,     0,   212,   216,   215,   315,     0,
     277,   278,   281,   280,   297,   284,   273,   272,   274,     0,
       0,   288,   289,     0,     0,   293,   294,     0,     0,   224,
     225,   114,   113,   210,     0,   108,   109,     0,   105,   106,
     101,   255,     0,   260,     0,   208,   209,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   318,   319,   320,
     321,   323,   322,     0,     0,     0,     0,     0,     0,     0,
     252,   250,   251,     0,   249,   240,   149,   150,   153,   151,
     152,   154,   142,   140,   141,   331,   345,   346,   347,   144,
     143,   241,     0,   336,     0,   148,     0,    73,    81,   301,
     265,   263,   264,     0,    76,    78,    79,    77,   211,     0,
     217,   214,     0,   275,     0,   283,     0,     0,   290,     0,
       0,   295,     0,     0,     0,     0,     0,   226,   158,   103,
       0,   259,   262,   125,   179,   181,   182,   183,   184,   185,
     186,     0,     0,     0,     0,     0,     0,     0,     0,   339,
     189,     0,   190,   187,   188,   200,   204,   205,   201,   195,
     202,   196,   197,   193,   203,   198,   199,   194,   191,   177,
     192,   180,   245,   370,   365,   367,   366,   369,   368,   358,
     359,   360,   363,   361,   362,   364,   357,   349,   355,   348,
     350,   351,   352,   353,   354,   356,     0,     0,     0,   147,
     137,   145,     0,   146,   155,   157,   266,     0,   213,   282,
     279,   301,   299,   298,   291,   286,   296,   285,   227,     0,
     231,   229,   233,   107,   168,   169,   170,   171,   172,   173,
     174,   176,   175,   178,   162,   161,   163,   165,   159,   166,
     164,   160,     0,     0,   156,    68,     0,    69,    67,   300,
       0,     0,   228,     0,   238,     0,   234,   235,   136,   138,
      80,     0,   232,     0,     0,   236,   230,   237,   222
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     8,     5,    35,    36,    37,    38,    39,    40,
     145,   146,   147,   191,   192,   193,   194,   195,   196,    41,
      18,    43,    44,    19,   109,   110,   111,    46,   218,    47,
      94,    89,   137,   596,   171,   172,   186,   267,   341,   454,
     455,   456,   184,   219,   220,   221,   290,   377,   378,   379,
      54,   223,   224,   225,   226,   227,   228,    20,   297,    76,
      77,   299,    78,    79,    80,    81,   113,   230,   231,   232,
     440,   233,   234,   315,   508,   235,   387,   236,   237,   344,
     345,   346,   461,    21,   239,   240,   241,   368,   369,   370,
     476,   602,   605,   606,   607,   242,   243,   244,   245,   246,
     247,   423,    82,   249,   291,   292,   293,   383,   457,   250,
     251,   252,   253,   279,   349,   350,   351,   352,   353,   354,
     254,   255,   360,   361,   362,   364,   365,   366,   465,   563,
     160,   161,   256,   257,    48,   259,   100,   355,   115,   413,
     268,   116,   117,   118,   119,    86,   444,   546,   339,     6,
       7,    22,    23,    24,    55,    25,    26,    27
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -549
static const yytype_int16 yypact[] =
{
      49,    30,    30,    39,  -549,  -549,  -549,     5,  -549,    31,
    -549,     3,     6,    29,   -32,    20,  -549,  -549,    83,    91,
     364,  -549,     5,  -549,  -549,    20,  -549,  -549,    52,    66,
      82,   881,   102,   891,    71,   126,  -549,  -549,  -549,  -549,
      19,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,    25,
    -549,  -549,   104,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,    55,  -549,  -549,  -549,   519,   148,    54,  -549,  -549,
    -549,  -549,    58,  -549,  -549,    68,  -549,  -549,  -549,   461,
    -549,    61,  -549,  -549,  -549,  -549,   891,   891,   891,   891,
    -549,  -549,    48,    31,  -549,   891,   112,   868,  -549,    65,
      57,  -549,  -549,     2,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,   364,  -549,  -549,  -549,  -549,  -549,  -549,  -549,    73,
      74,  -549,  -549,  -549,  -549,    74,    74,  -549,   137,    72,
      88,    89,    93,  -549,  -549,    97,    92,  -549,  -549,  -549,
    -549,   212,  -549,  -549,   104,  -549,   519,  -549,   881,   171,
    -549,  -549,  -549,  -549,  -549,   172,   173,   176,   178,   222,
     891,  -549,   217,  -549,  -549,  -549,   123,   124,  -549,  -549,
    -549,  -549,    62,  -549,   482,   108,  -549,  -549,  -549,   108,
     136,   142,    62,  -549,   242,  -549,  -549,   243,  -549,   108,
     102,   267,   131,   246,   248,   249,   134,   582,   226,   626,
     693,   837,   891,  -549,   -56,   138,   837,   250,  -549,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,   253,   364,
    -549,  -549,   254,  -549,   255,   709,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,   275,  -549,  -549,  -549,   131,   156,   161,
    -549,  -549,  -549,  -549,  -549,  -549,  -549,   278,  -549,  -549,
     389,   -25,    58,  -549,  -549,  -549,  -549,  -549,   891,   185,
    -549,  -549,  -549,  -549,  -549,   891,  -549,   725,   290,   291,
     293,   276,   277,   269,   295,  -549,   310,   313,   200,    59,
     317,   204,   205,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
     203,  -549,  -549,   -23,   -23,   -23,   -23,   -23,   -23,   -23,
     247,   -22,   100,   100,   100,   280,   -23,   100,   -23,  -549,
    -549,   853,   311,  -549,  -549,  -549,  -549,   394,   645,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,   292,   519,
     206,    22,  -549,  -549,     7,  -549,   232,  -549,   305,   227,
     245,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,   519,
     321,   276,  -549,   519,   334,   277,  -549,   519,    60,   269,
    -549,  -549,  -549,  -549,   519,  -549,  -549,   257,   258,  -549,
    -549,  -549,   837,    35,   519,  -549,  -549,   891,   891,   891,
     891,   891,   891,   891,   320,   331,   333,   337,   344,   346,
     347,   351,   900,   -23,   891,   891,   891,  -549,  -549,  -549,
    -549,  -549,  -549,   741,   757,   773,   891,   891,   519,   891,
    -549,  -549,  -549,   131,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,   581,   595,   595,   -56,  -549,  -549,  -549,   364,
    -549,  -549,   595,    58,   519,  -549,   519,  -549,  -549,    74,
    -549,  -549,  -549,   304,  -549,  -549,  -549,  -549,  -549,   891,
    -549,  -549,   519,  -549,   725,   -34,   419,   421,  -549,   422,
     423,  -549,   424,   868,   868,   868,   425,  -549,  -549,  -549,
      59,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,   891,   891,   891,   891,   891,   891,   891,   891,   891,
    -549,   891,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,   821,   789,   805,  -549,
     328,   329,   837,  -549,  -549,  -549,  -549,   194,  -549,  -549,
    -549,    74,  -549,  -549,  -549,  -549,  -549,  -549,  -549,   426,
     330,  -549,    34,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,   364,   364,  -549,  -549,   335,  -549,  -549,  -549,
     434,   868,  -549,   837,  -549,   442,    34,  -549,    54,    54,
    -549,   853,  -549,   448,   479,  -549,  -549,  -549,  -549
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -549,  -549,  -549,    24,  -549,   383,  -549,  -549,  -549,  -549,
    -549,  -549,   318,  -549,  -549,   297,  -549,  -549,  -549,  -549,
      -1,  -549,  -549,    11,  -549,  -549,   343,  -549,  -549,  -549,
     340,   440,  -549,  -549,  -549,  -549,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,  -549,   284,  -549,  -549,  -549,  -549,    23,
    -157,  -549,  -549,  -549,  -549,  -549,  -549,  -178,  -549,   281,
    -422,  -549,   391,    75,  -549,   -77,  -549,  -549,  -549,  -549,
    -549,  -549,  -549,  -549,  -549,  -549,  -236,  -549,  -548,  -549,
      45,  -549,  -549,  -156,  -549,  -549,  -549,  -549,  -549,   144,
    -549,  -549,  -549,  -549,   -91,  -549,  -549,  -194,  -549,  -549,
    -549,   -83,   -95,   323,  -549,  -549,  -379,  -549,   133,  -549,
    -549,  -549,  -549,  -201,  -549,  -549,    70,  -549,  -259,    76,
    -549,  -549,  -549,  -549,   174,  -549,  -549,   175,  -549,  -549,
    -435,    41,  -549,  -549,  -153,  -549,   336,   -57,   -18,  -204,
    -155,  -154,  -549,   -16,   -20,  -175,  -549,  -350,  -549,  -549,
    -549,  -549,   517,  -549,   516,  -549,  -549,    40
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -255
static const yytype_int16 yytable[] =
{
      85,   280,    83,   481,    84,   122,   229,   278,    42,   262,
     458,    95,   151,   101,   556,    11,    12,    13,   114,    14,
      45,   385,   405,    53,   604,   447,     9,   222,   238,   229,
     260,   258,   262,     4,   269,    28,    29,    30,    31,    10,
      15,    16,    12,    13,   275,    14,   320,   199,    49,    32,
     222,   238,    50,   260,   258,    56,    16,   286,   604,   104,
    -254,   561,   294,   562,    75,    56,   603,  -254,   388,   389,
     390,   391,   392,   393,    51,   473,   139,   140,   141,   142,
     417,   317,   419,   547,   548,   148,    57,   152,    52,   248,
     474,  -253,   552,   475,    58,   386,   406,    90,  -253,   175,
     466,    85,    42,    83,   469,    84,   248,   102,   472,   414,
     415,    91,   248,   418,    45,   149,   448,   449,   450,    17,
     451,   452,   453,   155,   156,   459,   599,    92,   425,   103,
     449,   450,    33,   451,   452,   105,    34,   288,    95,    96,
      97,    98,    99,   107,   441,   263,   264,   265,   266,   108,
     148,   120,   300,   407,   408,   409,   410,   411,   412,   143,
     439,     1,     2,   443,   261,   189,   190,   501,   375,   376,
     608,   609,   121,   428,   431,  -254,   162,   163,    75,   154,
     138,   152,   164,   217,   442,   340,   153,   261,  -253,   158,
     159,   165,   287,   124,   125,   126,   127,   128,   129,   130,
     131,   132,   133,   134,   135,   136,   217,   166,   167,    85,
     170,    83,   168,    84,   169,   173,   177,   316,   178,   318,
     179,   180,   522,   181,   613,   182,   185,   248,   294,  -118,
      59,    60,    61,    62,    63,    64,    65,    66,    67,   595,
     187,   188,   270,   248,   271,   273,   274,   277,   342,   281,
     216,   282,   283,   295,   289,   347,   296,   301,   302,   509,
     513,   517,  -118,  -118,  -118,  -118,  -118,  -118,  -118,  -118,
    -118,  -118,  -118,  -118,  -118,  -118,  -118,  -118,   319,   321,
     322,   323,   445,   394,   395,   396,   397,   398,   399,   400,
     401,   402,   343,   356,   357,   403,   358,   359,   371,   363,
     367,   424,   152,    59,    60,    61,    62,    63,    64,    65,
      66,    67,   213,   372,    75,   150,   373,   478,   261,   374,
     380,   381,   384,   382,   416,   446,   460,   483,   208,    60,
      61,    62,    63,    64,    65,    66,    67,   432,   433,   434,
     435,    72,    73,    74,   463,   467,  -118,    59,    60,    61,
      62,    63,    64,    65,    66,    67,   213,   462,   549,   150,
     470,   520,   551,   464,   491,   404,   553,   484,   485,   486,
     487,   488,   489,   490,   479,   492,   480,   493,   569,   570,
     571,   494,   500,   277,   502,   503,   504,   554,   495,   555,
     496,   497,   585,   588,   591,   498,   518,   519,   594,   521,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,   436,   437,   438,    85,
     557,    83,   564,    84,   565,   566,   567,   568,   572,   600,
      59,    60,    61,    62,    63,    64,    65,    66,    67,   347,
     426,   427,   112,    72,    73,    74,   592,   593,   601,   294,
     611,   617,   610,   152,   152,   152,   324,   325,   326,   327,
     328,   329,   330,   331,   332,   333,   334,   335,   336,   337,
     614,   574,   575,   576,   577,   578,   579,   580,   581,   582,
     597,   583,   618,   197,    75,    53,   144,   106,   183,   272,
     198,   285,    11,    12,    13,   199,   123,   174,   176,   200,
      32,   201,   202,   573,   558,   203,   612,   204,   338,   205,
     298,   206,   157,   477,   550,   615,   482,   207,   208,    60,
      61,    62,    63,   209,   210,   211,   212,   213,   616,   284,
     214,    72,    73,    74,   560,   468,   276,   598,   559,    87,
     471,    88,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   133,   134,   135,   136,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,   112,    72,    73,
      74,     0,    85,    85,    83,    83,    84,    84,     0,     0,
       0,   152,     0,   197,     0,    53,     0,     0,     0,     0,
     215,   424,    11,    12,    13,   199,     0,     0,   216,   200,
      32,   201,   202,     0,     0,   203,     0,   204,     0,   205,
       0,   206,     0,     0,     0,     0,     0,     0,   208,    60,
      61,    62,    63,   209,   210,   211,   212,   213,     0,     0,
     214,    72,    73,    74,   523,   524,   525,   526,   527,   528,
     529,   530,   531,   532,   533,   534,   535,   536,   523,   524,
     525,   526,   527,   528,   529,   530,   531,   532,   533,   534,
     535,   536,  -206,  -206,  -206,  -206,  -206,  -206,  -206,  -206,
    -206,  -206,  -206,  -206,  -206,  -206,  -206,  -206,     0,     0,
       0,    59,    60,    61,    62,    63,    64,    65,    66,    67,
     215,   429,   430,   112,    72,    73,    74,  -248,   216,     0,
       0,     0,     0,     0,     0,   537,     0,   538,   539,   540,
     541,   542,   543,   544,   545,     0,     0,     0,     0,   537,
       0,   538,   539,   540,   541,   542,   543,   544,   545,  -207,
    -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,
    -207,  -207,  -207,  -207,  -207,   303,   304,   305,   306,   307,
     308,   309,   310,   311,   312,   313,   314,   112,    72,    73,
      74,    59,    60,    61,    62,    63,    64,    65,    66,    67,
     348,    69,    70,   112,    72,    73,    74,    59,    60,    61,
      62,    63,    64,    65,    66,    67,   505,   506,   507,   112,
      72,    73,    74,    59,    60,    61,    62,    63,    64,    65,
      66,    67,   510,   511,   512,   112,    72,    73,    74,    59,
      60,    61,    62,    63,    64,    65,    66,    67,   514,   515,
     516,   112,    72,    73,    74,    59,    60,    61,    62,    63,
      64,    65,    66,    67,     0,   586,   587,   112,    72,    73,
      74,    59,    60,    61,    62,    63,    64,    65,    66,    67,
       0,   589,   590,   112,    72,    73,    74,    59,    60,    61,
      62,    63,    64,    65,    66,    67,   584,     0,     0,   112,
      72,    73,    74,    59,    60,    61,    62,    63,    64,    65,
      66,    67,     0,     0,     0,   112,    72,    73,    74,    59,
      60,    61,    62,    63,    64,    65,    66,    67,   420,     0,
       0,   421,     0,   422,    59,    60,    61,    62,    63,    64,
      65,    66,    67,     0,     0,     0,   150,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    93,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    59,    60,    61,    62,
      63,    64,    65,    66,   499
};

static const yytype_int16 yycheck[] =
{
      20,   202,    20,   382,    20,    82,   184,   201,     9,   184,
       3,    31,   107,    33,   449,    10,    11,    12,    75,    14,
       9,    44,    44,     3,   572,     3,     2,   184,   184,   207,
     184,   184,   207,     3,   189,     4,     5,     6,     7,     0,
      35,    36,    11,    12,   199,    14,   247,    13,    45,    18,
     207,   207,    46,   207,   207,    15,    36,   211,   606,    35,
     116,    95,   216,    97,   120,    25,    32,   123,   304,   305,
     306,   307,   308,   309,    45,    15,    96,    97,    98,    99,
     316,   235,   318,   433,   434,   105,     3,   107,   120,   184,
      30,   116,   442,    33,     3,   118,   118,    45,   123,   156,
     359,   121,   103,   121,   363,   121,   201,    36,   367,   313,
     314,    45,   207,   317,   103,     3,    94,    95,    96,   114,
      98,    99,   100,   121,   122,   118,   561,    45,   322,     3,
      95,    96,   101,    98,    99,   116,   105,   214,   158,    37,
      38,    39,    40,   118,   338,    37,    38,    39,    40,    45,
     170,     3,   229,    53,    54,    55,    56,    57,    58,   111,
     338,   112,   113,   338,   184,   103,   104,   403,   109,   110,
     592,   593,   118,   327,   328,   120,   135,   136,   120,   122,
     119,   201,    45,   184,   338,   262,   121,   207,   120,   116,
     116,   119,   212,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,   207,   119,   119,   229,
     118,   229,   119,   229,   117,     3,    45,   235,    46,   235,
      47,    45,   423,    45,   603,     3,     9,   322,   382,     3,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
     117,   117,   106,   338,   102,     3,     3,   116,   268,     3,
     116,     3,     3,     3,   116,   275,     3,     3,     3,   413,
     414,   415,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,     3,   123,
     119,     3,   339,    36,    37,    38,    39,    40,    41,    42,
      43,    44,   107,     3,     3,    48,     3,    21,     3,    22,
      31,   321,   322,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,     3,   120,    48,     3,   374,   338,   119,
       3,   117,   119,   118,    44,   119,    94,   384,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,   117,    24,   120,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    52,   435,    48,
      26,   418,   439,   118,    44,   118,   443,   387,   388,   389,
     390,   391,   392,   393,   117,    44,   118,    44,   473,   474,
     475,    44,   402,   116,   404,   405,   406,   444,    44,   446,
      44,    44,   546,   547,   548,    44,   416,   417,   552,   419,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,   124,   125,   126,   439,
     116,   439,     3,   439,     3,     3,     3,     3,     3,     3,
      36,    37,    38,    39,    40,    41,    42,    43,    44,   459,
      46,    47,    48,    49,    50,    51,   118,   118,   118,   603,
      16,     3,   117,   473,   474,   475,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      28,   491,   492,   493,   494,   495,   496,   497,   498,   499,
     557,   501,     3,     1,   120,     3,   103,    47,   170,   192,
       8,   207,    10,    11,    12,    13,    35,   154,   158,    17,
      18,    19,    20,   480,   459,    23,   601,    25,   119,    27,
     229,    29,   121,   369,   439,   606,   383,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,   611,   206,
      48,    49,    50,    51,   464,   361,   200,   557,   462,    22,
     365,    25,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    -1,   592,   593,   592,   593,   592,   593,    -1,    -1,
      -1,   601,    -1,     1,    -1,     3,    -1,    -1,    -1,    -1,
     108,   611,    10,    11,    12,    13,    -1,    -1,   116,    17,
      18,    19,    20,    -1,    -1,    23,    -1,    25,    -1,    27,
      -1,    29,    -1,    -1,    -1,    -1,    -1,    -1,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    -1,    -1,
      48,    49,    50,    51,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    36,    37,    38,    39,    40,    41,    42,    43,    44,
     108,    46,    47,    48,    49,    50,    51,   116,   116,    -1,
      -1,    -1,    -1,    -1,    -1,   124,    -1,   126,   127,   128,
     129,   130,   131,   132,   133,    -1,    -1,    -1,    -1,   124,
      -1,   126,   127,   128,   129,   130,   131,   132,   133,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    -1,    46,    47,    48,    49,    50,
      51,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      -1,    46,    47,    48,    49,    50,    51,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    -1,    -1,    48,
      49,    50,    51,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    -1,    -1,    -1,    48,    49,    50,    51,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    -1,
      -1,    48,    -1,    50,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    -1,    -1,    -1,    48,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    36,    37,    38,    39,
      40,    41,    42,    43,    44
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   112,   113,   135,     3,   137,   283,   284,   136,   137,
       0,    10,    11,    12,    14,    35,    36,   114,   154,   157,
     191,   217,   285,   286,   287,   289,   290,   291,     4,     5,
       6,     7,    18,   101,   105,   138,   139,   140,   141,   142,
     143,   153,   154,   155,   156,   157,   161,   163,   268,    45,
      46,    45,   120,     3,   184,   288,   291,     3,     3,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,   120,   193,   194,   196,   197,
     198,   199,   236,   272,   277,   278,   279,   286,   288,   165,
      45,    45,    45,    45,   164,   278,    37,    38,    39,    40,
     270,   278,    36,     3,   137,   116,   165,   118,    45,   158,
     159,   160,    48,   200,   271,   272,   275,   276,   277,   278,
       3,   118,   199,    35,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,   166,   119,   278,
     278,   278,   278,   111,   139,   144,   145,   146,   278,     3,
      48,   236,   278,   121,   122,   121,   122,   196,   116,   116,
     264,   265,   265,   265,    45,   119,   119,   119,   119,   117,
     118,   168,   169,     3,   160,   271,   164,    45,    46,    47,
      45,    45,     3,   146,   176,     9,   170,   117,   117,   103,
     104,   147,   148,   149,   150,   151,   152,     1,     8,    13,
      17,    19,    20,    23,    25,    27,    29,    35,    36,    41,
      42,    43,    44,    45,    48,   108,   116,   154,   162,   177,
     178,   179,   184,   185,   186,   187,   188,   189,   190,   191,
     201,   202,   203,   205,   206,   209,   211,   212,   217,   218,
     219,   220,   229,   230,   231,   232,   233,   234,   236,   237,
     243,   244,   245,   246,   254,   255,   266,   267,   268,   269,
     275,   278,   279,    37,    38,    39,    40,   171,   274,   274,
     106,   102,   149,     3,     3,   274,   270,   116,   231,   247,
     247,     3,     3,     3,   237,   178,   275,   278,   199,   116,
     180,   238,   239,   240,   275,     3,     3,   192,   193,   195,
     199,     3,     3,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,   207,   272,   275,   277,     3,
     247,   123,   119,     3,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,   119,   282,
     199,   172,   278,   107,   213,   214,   215,   278,    45,   248,
     249,   250,   251,   252,   253,   271,     3,     3,     3,    21,
     256,   257,   258,    22,   259,   260,   261,    31,   221,   222,
     223,     3,     3,     3,   119,   109,   110,   181,   182,   183,
       3,   117,   118,   241,   119,    44,   118,   210,   210,   210,
     210,   210,   210,   210,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    48,   118,    44,   118,    53,    54,    55,
      56,    57,    58,   273,   273,   273,    44,   210,   273,   210,
      45,    48,    50,   235,   278,   231,    46,    47,   275,    46,
      47,   275,    45,    46,    47,    48,   124,   125,   126,   191,
     204,   231,   275,   279,   280,   271,   119,     3,    94,    95,
      96,    98,    99,   100,   173,   174,   175,   242,     3,   118,
      94,   216,    52,   117,   118,   262,   252,    24,   258,   252,
      26,   261,   252,    15,    30,    33,   224,   223,   271,   117,
     118,   240,   242,   271,   278,   278,   278,   278,   278,   278,
     278,    44,    44,    44,    44,    44,    44,    44,    44,    44,
     278,   210,   278,   278,   278,    45,    46,    47,   208,   275,
      45,    46,    47,   275,    45,    46,    47,   275,   278,   278,
     271,   278,   247,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,   124,   126,   127,
     128,   129,   130,   131,   132,   133,   281,   281,   281,   199,
     197,   199,   281,   199,   271,   271,   264,   116,   214,   253,
     250,    95,    97,   263,     3,     3,     3,     3,     3,   236,
     236,   236,     3,   183,   278,   278,   278,   278,   278,   278,
     278,   278,   278,   278,    45,   275,    46,    47,   275,    46,
      47,   275,   118,   118,   275,    45,   167,   199,   278,   264,
       3,   118,   225,    32,   212,   226,   227,   228,   194,   194,
     117,    16,   236,   240,    28,   228,   235,     3,     3
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
#line 536 "pir.y"
    { fixup_global_labels(lexer); ;}
    break;

  case 19:
#line 566 "pir.y"
    { new_macro_const(lexer->macros, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval), yypirget_lineno(yyscanner)); ;}
    break;

  case 20:
#line 572 "pir.y"
    { /* fprintf(stderr, "macro body: [%s]\n", CURRENT_MACRO(lexer)->body);*/ ;}
    break;

  case 21:
#line 576 "pir.y"
    {
                          new_macro(lexer->macros, (yyvsp[(2) - (2)].sval), yypirget_lineno(yyscanner), TRUE,
                                    lexer->macro_size);
                        ;}
    break;

  case 26:
#line 591 "pir.y"
    { add_macro_param(CURRENT_MACRO(lexer), (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 34:
#line 610 "pir.y"
    { store_macro_string(CURRENT_MACRO(lexer), "%s\n", (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 35:
#line 614 "pir.y"
    {
                          store_macro_string(CURRENT_MACRO(lexer), ".local %s %s\n",
                                             pir_type_names[(yyvsp[(2) - (3)].ival)], (yyvsp[(3) - (3)].sval));
                        ;}
    break;

  case 36:
#line 625 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 37:
#line 629 "pir.y"
    { yypirset_lineno ((yyvsp[(2) - (2)].ival), yyscanner); ;}
    break;

  case 38:
#line 631 "pir.y"
    { lexer->filename = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 39:
#line 637 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 641 "pir.y"
    { set_hll_map(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 41:
#line 645 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 42:
#line 649 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 43:
#line 651 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 44:
#line 655 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 45:
#line 657 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 46:
#line 661 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 48:
#line 671 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 49:
#line 675 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 54:
#line 687 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 55:
#line 689 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 56:
#line 691 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 57:
#line 693 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 58:
#line 695 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 59:
#line 697 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 60:
#line 699 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 61:
#line 701 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 62:
#line 703 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 63:
#line 705 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 64:
#line 707 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 65:
#line 709 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 66:
#line 711 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 70:
#line 720 "pir.y"
    { /* XXX */
                           /* generate_get_params(lexer); */
                           set_instr(lexer, "get_params");
                           update_op(lexer, CURRENT_INSTRUCTION(lexer), PARROT_OP_get_params_pc);
                         ;}
    break;

  case 73:
#line 732 "pir.y"
    { set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 74:
#line 736 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 75:
#line 740 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 76:
#line 742 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 80:
#line 751 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT;
                           /* XXX handle multi_type */

                         ;}
    break;

  case 81:
#line 758 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 84:
#line 768 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 101:
#line 793 "pir.y"
    { expand_macro(yyscanner, (yyvsp[(1) - (3)].mval), (yyvsp[(2) - (3)].pval)); ;}
    break;

  case 102:
#line 797 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 103:
#line 799 "pir.y"
    { (yyval.pval) = (yyvsp[(2) - (3)].pval); ;}
    break;

  case 104:
#line 803 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 106:
#line 808 "pir.y"
    { (yyval.pval) = new_macro_param((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 107:
#line 810 "pir.y"
    {
                          macro_param *param = new_macro_param((yyvsp[(3) - (3)].sval));
                          param->next = (yyvsp[(1) - (3)].pval);
                          (yyval.pval) = param;
                        ;}
    break;

  case 108:
#line 818 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "macro argument '%s' is not a "
                                                           "declared identifier", (yyvsp[(1) - (1)].sval));
                          }
                        ;}
    break;

  case 110:
#line 833 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 112:
#line 841 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         ;}
    break;

  case 113:
#line 850 "pir.y"
    {
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 114:
#line 857 "pir.y"
    {
                           set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 118:
#line 871 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 119:
#line 880 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(yyscanner))
                              do_strength_reduction(yyscanner);
                        ;}
    break;

  case 125:
#line 898 "pir.y"
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
#line 934 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 127:
#line 939 "pir.y"
    { push_operand(lexer, expr_from_key(lexer, (yyvsp[(1) - (1)].key))); ;}
    break;

  case 128:
#line 943 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 129:
#line 945 "pir.y"
    { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 130:
#line 950 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 131:
#line 952 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 132:
#line 956 "pir.y"
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
#line 979 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 134:
#line 983 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 135:
#line 985 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 136:
#line 994 "pir.y"
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
#line 1005 "pir.y"
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
#line 1017 "pir.y"
    { /* XXX create a PMC const for $4 */
                          unshift_operand(lexer, expr_from_key(lexer, (yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));
                          if (check_op_args_for_symbols(yyscanner))
                              check_first_arg_direction(yyscanner, (yyvsp[(3) - (6)].sval));
                              /* no strength reduction here */
                        ;}
    break;

  case 140:
#line 1030 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 141:
#line 1039 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 142:
#line 1048 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 143:
#line 1053 "pir.y"
    {
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 144:
#line 1058 "pir.y"
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

  case 145:
#line 1079 "pir.y"
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

  case 146:
#line 1119 "pir.y"
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

  case 147:
#line 1137 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 148:
#line 1144 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 149:
#line 1149 "pir.y"
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

  case 150:
#line 1160 "pir.y"
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

  case 151:
#line 1171 "pir.y"
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

  case 152:
#line 1182 "pir.y"
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

  case 153:
#line 1193 "pir.y"
    {
                          set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 154:
#line 1198 "pir.y"
    {
                          set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 155:
#line 1203 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 156:
#line 1208 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 157:
#line 1217 "pir.y"
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

  case 158:
#line 1236 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 159:
#line 1270 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 160:
#line 1272 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 161:
#line 1274 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 162:
#line 1276 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 163:
#line 1278 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 164:
#line 1280 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 165:
#line 1282 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 166:
#line 1284 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 167:
#line 1289 "pir.y"
    { get_opinfo(yyscanner); ;}
    break;

  case 168:
#line 1298 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 169:
#line 1300 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 170:
#line 1302 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 171:
#line 1304 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 172:
#line 1306 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 173:
#line 1308 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 174:
#line 1310 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 175:
#line 1312 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 176:
#line 1314 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 177:
#line 1316 "pir.y"
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
#line 1328 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (5)].ival)), (yyvsp[(5) - (5)].sval));
                        ;}
    break;

  case 179:
#line 1333 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 180:
#line 1335 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 181:
#line 1337 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 182:
#line 1339 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 183:
#line 1341 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 184:
#line 1343 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 185:
#line 1345 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 186:
#line 1347 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 187:
#line 1349 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 188:
#line 1351 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 189:
#line 1353 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 190:
#line 1355 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 191:
#line 1357 "pir.y"
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

  case 192:
#line 1388 "pir.y"
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
#line 1402 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%i", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].ival));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 194:
#line 1410 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%n", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].dval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 195:
#line 1419 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%s", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].sval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 196:
#line 1428 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 197:
#line 1430 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 198:
#line 1432 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 199:
#line 1434 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 200:
#line 1436 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 201:
#line 1440 "pir.y"
    {
                          yypirerror(yyscanner, lexer, "cannot compare string to %s",
                                     (yyvsp[(3) - (3)].ival) == INT_TYPE ? "integer" : "number");
                        ;}
    break;

  case 202:
#line 1445 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare integer to string"); ;}
    break;

  case 203:
#line 1447 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare number to string"); ;}
    break;

  case 204:
#line 1451 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 205:
#line 1452 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 206:
#line 1455 "pir.y"
    { (yyval.ival) = DONT_INVERT_OPNAME; /* no need to invert */ ;}
    break;

  case 207:
#line 1456 "pir.y"
    { (yyval.ival) = NEED_INVERT_OPNAME; /* yes, invert opname */ ;}
    break;

  case 210:
#line 1464 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_op_labelflag(lexer, BIT(0)); /* bit 0 means: "1 << 0" */
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 211:
#line 1472 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 212:
#line 1476 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 213:
#line 1478 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 214:
#line 1482 "pir.y"
    { (yyval.symb) = new_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 215:
#line 1486 "pir.y"
    { /* try to find symbol for this id; if found, it was already declared */
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym)
                              yypirerror(yyscanner, lexer, "symbol '%s' is already declared", (yyvsp[(1) - (1)].sval));
                          (yyval.sval) = (yyvsp[(1) - (1)].sval);
                        ;}
    break;

  case 216:
#line 1494 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 217:
#line 1495 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 218:
#line 1499 "pir.y"
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
#line 1514 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 222:
#line 1526 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                              (yyval.invo) = (yyvsp[(4) - (8)].invo);
                            ;}
    break;

  case 223:
#line 1534 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 224:
#line 1536 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 225:
#line 1540 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 226:
#line 1542 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 227:
#line 1546 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 228:
#line 1550 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 229:
#line 1552 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 230:
#line 1555 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].expr)); ;}
    break;

  case 231:
#line 1559 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 232:
#line 1561 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 233:
#line 1565 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 234:
#line 1567 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 235:
#line 1571 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 236:
#line 1573 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 237:
#line 1577 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 238:
#line 1579 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 240:
#line 1587 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 241:
#line 1591 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 242:
#line 1595 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL);
                             (yyval.invo) = (yyvsp[(1) - (1)].invo);
                           ;}
    break;

  case 245:
#line 1605 "pir.y"
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
#line 1633 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 247:
#line 1640 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 248:
#line 1642 "pir.y"
    {
                               symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                               if (sym == NULL)
                                   sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                               (yyval.targ) = target_from_symbol(lexer, sym); ;}
    break;

  case 249:
#line 1651 "pir.y"
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
#line 1668 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 251:
#line 1670 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 252:
#line 1672 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 253:
#line 1676 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);

                           ;}
    break;

  case 254:
#line 1685 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 255:
#line 1690 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 256:
#line 1694 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 257:
#line 1696 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 258:
#line 1700 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 259:
#line 1702 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 260:
#line 1706 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 261:
#line 1710 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 262:
#line 1712 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 263:
#line 1716 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 264:
#line 1718 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 265:
#line 1720 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 266:
#line 1722 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 267:
#line 1732 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 272:
#line 1742 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 273:
#line 1748 "pir.y"
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
#line 1759 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 275:
#line 1766 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 276:
#line 1770 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 277:
#line 1772 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 278:
#line 1776 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 279:
#line 1778 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 282:
#line 1786 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 283:
#line 1790 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 284:
#line 1794 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument(lexer, (yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 285:
#line 1800 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 286:
#line 1809 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 287:
#line 1816 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 288:
#line 1818 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 289:
#line 1823 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 290:
#line 1825 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 291:
#line 1830 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 292:
#line 1834 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 293:
#line 1836 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 294:
#line 1840 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 295:
#line 1842 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 296:
#line 1846 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 297:
#line 1851 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 298:
#line 1853 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 299:
#line 1857 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 300:
#line 1859 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 301:
#line 1866 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 302:
#line 1868 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 303:
#line 1872 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 307:
#line 1883 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 308:
#line 1887 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 309:
#line 1891 "pir.y"
    { (yyval.cval) = new_named_const(lexer, INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 310:
#line 1893 "pir.y"
    { (yyval.cval) = new_named_const(lexer, NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 311:
#line 1895 "pir.y"
    { (yyval.cval) = new_named_const(lexer, STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 312:
#line 1897 "pir.y"
    { (yyval.cval) = new_named_const(lexer, PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 313:
#line 1918 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 314:
#line 1919 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 315:
#line 1923 "pir.y"
    { (yyval.cval) = new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 316:
#line 1924 "pir.y"
    { (yyval.cval) = new_const(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 317:
#line 1925 "pir.y"
    { (yyval.cval) = new_const(lexer, NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 318:
#line 1928 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 319:
#line 1929 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 320:
#line 1930 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 321:
#line 1931 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 322:
#line 1932 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 323:
#line 1933 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 324:
#line 1936 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 325:
#line 1937 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 326:
#line 1938 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 327:
#line 1939 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 328:
#line 1947 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 330:
#line 1951 "pir.y"
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
#line 1964 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 332:
#line 1965 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 333:
#line 1966 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 334:
#line 1967 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 337:
#line 1975 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 338:
#line 1976 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 339:
#line 1977 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 340:
#line 1978 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 341:
#line 1979 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 342:
#line 1980 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 343:
#line 1981 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 344:
#line 1982 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 345:
#line 1985 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 346:
#line 1986 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 347:
#line 1987 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 348:
#line 1990 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 349:
#line 1991 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 350:
#line 1992 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 351:
#line 1993 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 352:
#line 1994 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 353:
#line 1995 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 354:
#line 1996 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 355:
#line 1997 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 356:
#line 1998 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 357:
#line 1999 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 358:
#line 2000 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 359:
#line 2001 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 360:
#line 2002 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 361:
#line 2003 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 362:
#line 2004 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 363:
#line 2005 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 364:
#line 2006 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 365:
#line 2007 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 366:
#line 2008 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 367:
#line 2009 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 368:
#line 2010 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 369:
#line 2011 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 370:
#line 2012 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 371:
#line 2018 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 372:
#line 2019 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 373:
#line 2020 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 374:
#line 2021 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 375:
#line 2022 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 376:
#line 2023 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 377:
#line 2024 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 378:
#line 2025 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 379:
#line 2026 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 380:
#line 2027 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 381:
#line 2028 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 382:
#line 2029 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 384:
#line 2044 "pir.y"
    { new_subr(lexer, "@start"); ;}
    break;

  case 391:
#line 2058 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 396:
#line 2068 "pir.y"
    { set_sub_name(lexer, (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 397:
#line 2072 "pir.y"
    { new_subr(lexer, NULL); ;}
    break;

  case 398:
#line 2076 "pir.y"
    {
                                  if (!is_parrot_op(lexer, (yyvsp[(1) - (3)].sval))) {
                                      yypirerror(yyscanner, lexer, "'%s' is not a parrot op", (yyvsp[(1) - (3)].sval));
                                  }
                                  else {
                                      get_opinfo(yyscanner);
                                  }
                                ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4521 "pirparser.c"
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


#line 2088 "pir.y"



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
                /* fprintf(stderr, "%s must be a label\n", operand->expr.id);
                 */
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


