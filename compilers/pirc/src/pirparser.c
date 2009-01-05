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
#line 591 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 604 "pirparser.c"

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
#define YYLAST   1079

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  139
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  171
/* YYNRULES -- Number of rules.  */
#define YYNRULES  430
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
       2,     2,     2,     2,     2,     2,     2,     2,     2,   125,
       2,   122,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   123,     2,   124,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   126,   136,   127,   131,     2,     2,     2,
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
       0,     0,     3,     6,     9,    13,    14,    16,    18,    22,
      24,    26,    28,    30,    32,    34,    36,    38,    40,    42,
      44,    46,    48,    52,    60,    63,    64,    66,    68,    72,
      74,    75,    77,    79,    82,    85,    87,    89,    92,    96,
      99,   102,   105,   110,   113,   118,   123,   124,   126,   128,
     132,   134,   141,   143,   146,   148,   150,   151,   154,   156,
     158,   160,   162,   164,   166,   168,   171,   176,   179,   182,
     185,   188,   191,   195,   196,   198,   200,   204,   206,   208,
     210,   212,   213,   216,   221,   224,   225,   228,   230,   232,
     234,   239,   241,   242,   245,   248,   250,   252,   254,   256,
     258,   260,   262,   264,   266,   268,   270,   272,   274,   276,
     278,   280,   282,   286,   287,   291,   292,   294,   296,   300,
     302,   304,   307,   309,   313,   314,   317,   319,   321,   323,
     326,   328,   331,   334,   338,   342,   345,   348,   350,   352,
     354,   356,   357,   359,   361,   365,   369,   371,   373,   375,
     377,   379,   381,   384,   388,   390,   394,   401,   406,   413,
     416,   418,   420,   424,   428,   432,   436,   440,   444,   449,
     454,   459,   463,   467,   471,   475,   479,   483,   487,   492,
     498,   503,   508,   512,   516,   520,   524,   528,   532,   536,
     540,   543,   549,   555,   561,   567,   573,   579,   585,   591,
     597,   602,   608,   613,   618,   623,   628,   633,   638,   643,
     648,   653,   658,   663,   668,   673,   677,   681,   685,   689,
     693,   697,   701,   705,   709,   713,   717,   721,   723,   725,
     727,   729,   731,   733,   737,   742,   744,   748,   751,   752,
     754,   760,   762,   764,   766,   775,   776,   778,   780,   783,
     787,   791,   794,   800,   801,   804,   805,   807,   809,   812,
     816,   818,   821,   825,   829,   831,   833,   835,   840,   843,
     845,   847,   849,   851,   853,   855,   857,   859,   863,   864,
     866,   868,   872,   875,   879,   880,   883,   885,   887,   889,
     892,   894,   896,   898,   900,   902,   906,   910,   914,   918,
     919,   921,   923,   927,   929,   931,   935,   938,   940,   946,
     952,   953,   955,   957,   960,   964,   965,   967,   969,   972,
     976,   977,   980,   982,   985,   986,   988,   992,   995,   998,
    1000,  1002,  1005,  1007,  1009,  1012,  1017,  1022,  1027,  1032,
    1034,  1036,  1038,  1040,  1042,  1044,  1046,  1048,  1050,  1052,
    1054,  1056,  1058,  1060,  1062,  1064,  1066,  1068,  1070,  1072,
    1074,  1076,  1078,  1080,  1082,  1084,  1086,  1088,  1090,  1092,
    1094,  1096,  1098,  1100,  1102,  1104,  1106,  1108,  1110,  1112,
    1114,  1116,  1118,  1120,  1122,  1124,  1126,  1128,  1130,  1132,
    1134,  1136,  1138,  1140,  1142,  1144,  1146,  1148,  1150,  1152,
    1154,  1156,  1158,  1160,  1162,  1164,  1166,  1168,  1170,  1172,
    1174,  1176,  1178,  1180,  1183,  1185,  1187,  1190,  1192,  1195,
    1197,  1200,  1203,  1205,  1208,  1211,  1213,  1215,  1217,  1221,
    1223
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     140,     0,    -1,   116,   141,    -1,   115,   301,    -1,   142,
     143,   142,    -1,    -1,    35,    -1,   144,    -1,   143,    35,
     144,    -1,     1,    -1,   167,    -1,   280,    -1,   163,    -1,
     161,    -1,   162,    -1,   158,    -1,   159,    -1,   160,    -1,
     145,    -1,   199,    -1,   146,    -1,   147,    -1,   108,    37,
     114,    -1,   148,   119,   149,   120,    35,   152,   105,    -1,
     104,   296,    -1,    -1,   150,    -1,   151,    -1,   150,   121,
     151,    -1,   296,    -1,    -1,   153,    -1,   154,    -1,   153,
     154,    -1,   155,    35,    -1,   156,    -1,   157,    -1,   107,
     109,    -1,   106,   292,   110,    -1,     5,    46,    -1,    10,
      48,    -1,    11,    46,    -1,    34,    46,   121,    46,    -1,
       3,    46,    -1,     4,    46,   122,    46,    -1,    13,   123,
     164,   124,    -1,    -1,   165,    -1,   166,    -1,   165,   125,
     166,    -1,    46,    -1,   169,   171,    35,   177,   185,   168,
      -1,     7,    -1,     6,   170,    -1,   296,    -1,    46,    -1,
      -1,   171,   172,    -1,    86,    -1,    83,    -1,    84,    -1,
      85,    -1,    90,    -1,    92,    -1,    93,    -1,    91,   173,
      -1,    88,   119,   170,   120,    -1,    87,   277,    -1,    89,
     277,    -1,    94,   278,    -1,    95,   278,    -1,    96,   278,
      -1,   119,   174,   120,    -1,    -1,   175,    -1,   176,    -1,
     175,   121,   176,    -1,   296,    -1,    46,    -1,   212,    -1,
     178,    -1,    -1,   178,   179,    -1,     8,   180,   181,    35,
      -1,   292,   296,    -1,    -1,   181,   182,    -1,   255,    -1,
     183,    -1,   184,    -1,   103,   119,   176,   120,    -1,    97,
      -1,    -1,   185,   186,    -1,    36,   187,    -1,   187,    -1,
     202,    -1,   219,    -1,   225,    -1,   226,    -1,   230,    -1,
     279,    -1,   256,    -1,   231,    -1,   215,    -1,   201,    -1,
     200,    -1,   197,    -1,   198,    -1,   188,    -1,   199,    -1,
     189,    -1,   111,   190,    35,    -1,    -1,   119,   191,   120,
      -1,    -1,   192,    -1,   193,    -1,   192,   121,   193,    -1,
     112,    -1,   113,    -1,   111,   190,    -1,   194,    -1,   126,
     195,   127,    -1,    -1,   195,   196,    -1,    35,    -1,   113,
      -1,   112,    -1,   111,   190,    -1,    35,    -1,   159,    35,
      -1,     1,    35,    -1,    44,   293,    35,    -1,    28,   250,
      35,    -1,   203,    35,    -1,   204,   205,    -1,   214,    -1,
      37,    -1,   206,    -1,   208,    -1,    -1,   207,    -1,   209,
      -1,   207,   121,   209,    -1,   212,   122,   288,    -1,   210,
      -1,   212,    -1,   289,    -1,   296,    -1,   295,    -1,   211,
      -1,   249,   212,    -1,   123,   213,   124,    -1,   288,    -1,
     213,   125,   288,    -1,   293,   122,   204,   210,   121,   207,
      -1,   293,   122,   204,   210,    -1,   293,   122,   204,   212,
     121,   207,    -1,   217,    35,    -1,    37,    -1,   297,    -1,
     293,   122,    48,    -1,   293,   122,    49,    -1,   293,   122,
     290,    -1,   293,   122,   295,    -1,   293,   122,   216,    -1,
     293,   122,   218,    -1,   293,   122,   204,   212,    -1,   293,
     122,   297,   212,    -1,   293,   122,    50,   212,    -1,   293,
     300,   288,    -1,   293,    72,    48,    -1,   293,    72,    49,
      -1,   293,    73,    48,    -1,   293,    73,    49,    -1,   293,
      72,   293,    -1,   293,    73,   293,    -1,   293,   122,   298,
     288,    -1,   293,   122,   293,   299,   288,    -1,   297,   212,
     122,   288,    -1,    50,   212,   122,   288,    -1,    48,   299,
     293,    -1,    49,   299,   293,    -1,    46,   299,   293,    -1,
      46,   299,    46,    -1,    48,   299,    48,    -1,    49,   299,
      49,    -1,    48,   299,    49,    -1,    49,   299,    48,    -1,
     220,    35,    -1,   223,    44,    37,    45,   296,    -1,   223,
      44,    38,    45,   296,    -1,   223,    44,    39,    45,   296,
      -1,   223,    44,    40,    45,   296,    -1,   223,    44,    41,
      45,   296,    -1,   223,    44,    42,    45,   296,    -1,   223,
      44,    43,    45,   296,    -1,   223,    44,    45,    45,   296,
      -1,   223,    44,    44,    45,   296,    -1,   223,   289,   224,
     296,    -1,   223,    44,    50,   224,   296,    -1,   223,    37,
     224,   296,    -1,   223,   295,   224,   296,    -1,   223,    38,
     224,   296,    -1,   223,    39,   224,   296,    -1,   223,    40,
     224,   296,    -1,   223,    41,   224,   296,    -1,   223,    42,
     224,   296,    -1,   223,    43,   224,   296,    -1,   223,    45,
      45,   296,    -1,   223,    45,   121,   296,    -1,   223,    44,
      45,   296,    -1,   223,    44,   121,   296,    -1,   223,   221,
      45,   296,    -1,   293,   291,   288,    -1,    48,   291,   293,
      -1,    49,   291,   293,    -1,    46,   291,   293,    -1,    48,
     291,    48,    -1,    48,   291,    49,    -1,    49,   291,    48,
      -1,    49,   291,    49,    -1,    46,   291,    46,    -1,    46,
     291,   222,    -1,    48,   291,    46,    -1,    49,   291,    46,
      -1,    48,    -1,    49,    -1,    42,    -1,    43,    -1,    45,
      -1,   121,    -1,    45,   296,    35,    -1,    12,   292,   227,
      35,    -1,   228,    -1,   227,   121,   228,    -1,   296,   229,
      -1,    -1,    97,    -1,     9,    46,   121,   249,    35,    -1,
     232,    -1,   233,    -1,   242,    -1,    26,    35,   234,   237,
      35,   239,    27,    35,    -1,    -1,   235,    -1,   236,    -1,
     235,   236,    -1,    30,   265,    35,    -1,    29,   247,   238,
      -1,    32,   249,    -1,    14,   249,    35,    15,   248,    -1,
      -1,   121,   249,    -1,    -1,   240,    -1,   241,    -1,   240,
     241,    -1,    31,   253,    35,    -1,   226,    -1,   243,    35,
      -1,   250,   122,   244,    -1,   293,   122,   244,    -1,   244,
      -1,   246,    -1,   245,    -1,   249,   128,   248,   260,    -1,
     247,   260,    -1,   249,    -1,    46,    -1,   296,    -1,    50,
      -1,    52,    -1,    46,    -1,   296,    -1,    50,    -1,   119,
     251,   120,    -1,    -1,   252,    -1,   253,    -1,   252,   121,
     253,    -1,   293,   254,    -1,    46,    54,   293,    -1,    -1,
     254,   255,    -1,   101,    -1,   102,    -1,    99,    -1,    98,
     277,    -1,   257,    -1,   258,    -1,   267,    -1,   259,    -1,
     268,    -1,    18,   260,    35,    -1,    33,   244,    35,    -1,
      19,   260,    35,    -1,   119,   261,   120,    -1,    -1,   262,
      -1,   263,    -1,   262,   121,   263,    -1,   265,    -1,   264,
      -1,    46,    54,   266,    -1,   266,   275,    -1,   288,    -1,
      24,    35,   272,    25,    35,    -1,    22,    35,   269,    23,
      35,    -1,    -1,   270,    -1,   271,    -1,   270,   271,    -1,
      20,   265,    35,    -1,    -1,   273,    -1,   274,    -1,   273,
     274,    -1,    21,   265,    35,    -1,    -1,   275,   276,    -1,
     100,    -1,    98,   277,    -1,    -1,   278,    -1,   119,    46,
     120,    -1,   281,    35,    -1,    17,   285,    -1,   282,    -1,
     284,    -1,    17,   283,    -1,   285,    -1,   286,    -1,    16,
     283,    -1,    38,   296,   122,    48,    -1,    39,   296,   122,
      49,    -1,    41,   296,   122,   290,    -1,    46,   296,   122,
     287,    -1,   289,    -1,   296,    -1,   293,    -1,   289,    -1,
      48,    -1,    49,    -1,   290,    -1,    46,    -1,    47,    -1,
      55,    -1,    56,    -1,    57,    -1,    58,    -1,    60,    -1,
      59,    -1,    38,    -1,    39,    -1,    40,    -1,    41,    -1,
     294,    -1,   295,    -1,   296,    -1,    50,    -1,    51,    -1,
      53,    -1,    52,    -1,    37,    -1,   297,    -1,    42,    -1,
      43,    -1,    45,    -1,    38,    -1,    39,    -1,    41,    -1,
      40,    -1,    44,    -1,   129,    -1,   130,    -1,   131,    -1,
     132,    -1,   129,    -1,   133,    -1,   134,    -1,   135,    -1,
     136,    -1,   137,    -1,   131,    -1,   138,    -1,    68,    -1,
      61,    -1,    62,    -1,    63,    -1,    65,    -1,    66,    -1,
      64,    -1,    67,    -1,    56,    -1,    58,    -1,    57,    -1,
      60,    -1,    59,    -1,    55,    -1,    74,    -1,    75,    -1,
      76,    -1,    77,    -1,    80,    -1,    78,    -1,    79,    -1,
      81,    -1,    82,    -1,    70,    -1,    71,    -1,    69,    -1,
     302,   303,    -1,   142,    -1,   304,    -1,   303,   304,    -1,
     305,    -1,   163,    35,    -1,   230,    -1,   159,    35,    -1,
     145,    35,    -1,   189,    -1,    36,   306,    -1,   307,   306,
      -1,   309,    -1,   197,    -1,   309,    -1,   308,   171,    36,
      -1,   117,    -1,   204,   206,    35,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   561,   561,   562,   567,   573,   574,   577,   578,   579,
     582,   583,   584,   585,   586,   587,   588,   589,   590,   591,
     598,   599,   602,   606,   612,   619,   620,   623,   624,   627,
     631,   632,   635,   636,   639,   642,   643,   646,   650,   661,
     665,   667,   671,   677,   681,   685,   690,   691,   695,   697,
     701,   705,   711,   715,   719,   720,   723,   724,   727,   729,
     731,   733,   735,   737,   739,   741,   743,   745,   747,   749,
     751,   753,   757,   762,   766,   770,   779,   790,   792,   794,
     798,   807,   808,   821,   825,   830,   831,   835,   836,   837,
     840,   847,   853,   854,   864,   866,   869,   870,   871,   872,
     873,   874,   875,   876,   877,   878,   879,   880,   881,   882,
     883,   889,   892,   897,   898,   903,   904,   907,   909,   917,
     925,   926,   928,   931,   937,   938,   947,   948,   949,   950,
     958,   962,   966,   975,   982,   989,   992,   993,   996,  1005,
    1012,  1015,  1016,  1019,  1020,  1023,  1059,  1061,  1065,  1067,
    1072,  1074,  1078,  1101,  1105,  1107,  1116,  1127,  1139,  1149,
    1152,  1153,  1156,  1165,  1174,  1179,  1184,  1205,  1210,  1251,
    1269,  1276,  1281,  1292,  1303,  1314,  1325,  1330,  1335,  1340,
    1350,  1369,  1403,  1405,  1407,  1409,  1411,  1413,  1415,  1417,
    1422,  1431,  1433,  1435,  1437,  1439,  1441,  1443,  1445,  1447,
    1449,  1461,  1466,  1468,  1470,  1472,  1474,  1476,  1478,  1480,
    1482,  1484,  1486,  1488,  1490,  1521,  1547,  1555,  1564,  1573,
    1575,  1577,  1579,  1581,  1585,  1590,  1592,  1597,  1598,  1601,
    1602,  1605,  1606,  1609,  1617,  1621,  1623,  1627,  1631,  1632,
    1635,  1650,  1654,  1655,  1658,  1670,  1671,  1675,  1677,  1681,
    1685,  1687,  1689,  1695,  1696,  1701,  1702,  1706,  1708,  1717,
    1719,  1723,  1727,  1729,  1731,  1735,  1736,  1739,  1759,  1766,
    1768,  1778,  1795,  1797,  1799,  1803,  1812,  1817,  1824,  1825,
    1829,  1831,  1835,  1837,  1842,  1843,  1847,  1849,  1851,  1853,
    1863,  1867,  1868,  1869,  1870,  1873,  1878,  1889,  1896,  1901,
    1902,  1906,  1908,  1912,  1913,  1916,  1920,  1924,  1928,  1937,
    1947,  1948,  1953,  1955,  1960,  1965,  1966,  1970,  1972,  1976,
    1982,  1983,  1987,  1989,  1997,  1998,  2002,  2006,  2009,  2013,
    2014,  2017,  2021,  2022,  2025,  2029,  2031,  2033,  2037,  2041,
    2042,  2055,  2056,  2060,  2061,  2062,  2065,  2066,  2069,  2070,
    2071,  2072,  2073,  2074,  2077,  2078,  2079,  2080,  2088,  2091,
    2092,  2105,  2106,  2107,  2108,  2112,  2113,  2116,  2117,  2118,
    2119,  2120,  2121,  2122,  2123,  2126,  2127,  2128,  2131,  2132,
    2133,  2134,  2135,  2136,  2137,  2138,  2139,  2140,  2141,  2142,
    2143,  2144,  2145,  2146,  2147,  2148,  2149,  2150,  2151,  2152,
    2153,  2159,  2160,  2161,  2162,  2163,  2164,  2165,  2166,  2167,
    2168,  2169,  2170,  2182,  2190,  2194,  2195,  2198,  2199,  2200,
    2201,  2202,  2203,  2206,  2208,  2209,  2212,  2213,  2216,  2220,
    2225
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
  "\":optional\"", "\":opt_flag\"", "\":invocant\"", "\".macro\"",
  "\".endm\"", "\".macro_local\"", "\".macro_label\"", "\".macro_const\"",
  "\"macro-label\"", "\"macro-local\"", "\"macro-identifier\"",
  "\"macro-id-argument\"", "\"macro-argument\"", "\"macro-constant\"",
  "\"<pasm-input>\"", "\"<pir-input>\"", "\".pcc_sub\"", "\"parrot-op\"",
  "'('", "')'", "','", "'='", "'['", "']'", "';'", "'{'", "'}'", "'.'",
  "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"",
  "$accept", "TOP", "pir_contents", "opt_nl", "pir_chunks", "pir_chunk",
  "macro_definition", "macro_const", "macro", "macro_header",
  "macro_parameters", "macro_params", "macro_param", "macro_body",
  "macro_statements", "macro_statement", "macro_instr", "macro_label_decl",
  "macro_local_decl", "loadlib", "location_directive", "annotation",
  "hll_specifier", "hll_mapping", "namespace_decl", "opt_namespace",
  "namespace", "namespace_slice", "sub_def", "sub_end", "sub_head",
  "sub_id", "sub_flags", "sub_flag", "multi_type_list", "opt_multi_types",
  "multi_types", "multi_type", "parameter_list", "parameters", "parameter",
  "param", "param_flags", "param_flag", "invocant_param",
  "unique_reg_flag", "instructions", "instruction", "statement",
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
      41,    44,    61,    91,    93,    59,   123,   125,    46,    45,
      33,   126,    43,    47,    42,    37,   124,    38,   374
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   139,   140,   140,   141,   142,   142,   143,   143,   143,
     144,   144,   144,   144,   144,   144,   144,   144,   144,   144,
     145,   145,   146,   147,   148,   149,   149,   150,   150,   151,
     152,   152,   153,   153,   154,   155,   155,   156,   157,   158,
     159,   159,   160,   161,   162,   163,   164,   164,   165,   165,
     166,   167,   168,   169,   170,   170,   171,   171,   172,   172,
     172,   172,   172,   172,   172,   172,   172,   172,   172,   172,
     172,   172,   173,   174,   174,   175,   175,   176,   176,   176,
     177,   178,   178,   179,   180,   181,   181,   182,   182,   182,
     183,   184,   185,   185,   186,   186,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   188,   189,   190,   190,   191,   191,   192,   192,   193,
     193,   193,   193,   194,   195,   195,   196,   196,   196,   196,
     197,   198,   199,   200,   201,   202,   203,   203,   204,   205,
     205,   206,   206,   207,   207,   208,   209,   209,   210,   210,
     210,   210,   211,   212,   213,   213,   214,   214,   214,   215,
     216,   216,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   218,   218,   218,   218,   218,   218,   218,   218,
     219,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   221,   221,   221,   221,   221,
     221,   221,   221,   221,   221,   221,   221,   222,   222,   223,
     223,   224,   224,   225,   226,   227,   227,   228,   229,   229,
     230,   231,   232,   232,   233,   234,   234,   235,   235,   236,
     237,   237,   237,   238,   238,   239,   239,   240,   240,   241,
     241,   242,   243,   243,   243,   244,   244,   245,   246,   247,
     247,   248,   248,   248,   248,   249,   249,   250,   251,   251,
     252,   252,   253,   253,   254,   254,   255,   255,   255,   255,
     256,   257,   257,   257,   257,   258,   258,   259,   260,   261,
     261,   262,   262,   263,   263,   264,   265,   266,   267,   268,
     269,   269,   270,   270,   271,   272,   272,   273,   273,   274,
     275,   275,   276,   276,   277,   277,   278,   279,   280,   281,
     281,   282,   283,   283,   284,   285,   285,   285,   286,   287,
     287,   288,   288,   289,   289,   289,   290,   290,   291,   291,
     291,   291,   291,   291,   292,   292,   292,   292,   293,   294,
     294,   295,   295,   295,   295,   296,   296,   297,   297,   297,
     297,   297,   297,   297,   297,   298,   298,   298,   299,   299,
     299,   299,   299,   299,   299,   299,   299,   299,   299,   299,
     299,   299,   299,   299,   299,   299,   299,   299,   299,   299,
     299,   300,   300,   300,   300,   300,   300,   300,   300,   300,
     300,   300,   300,   301,   302,   303,   303,   304,   304,   304,
     304,   304,   304,   305,   305,   305,   306,   306,   307,   308,
     309
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     3,     0,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     7,     2,     0,     1,     1,     3,     1,
       0,     1,     1,     2,     2,     1,     1,     2,     3,     2,
       2,     2,     4,     2,     4,     4,     0,     1,     1,     3,
       1,     6,     1,     2,     1,     1,     0,     2,     1,     1,
       1,     1,     1,     1,     1,     2,     4,     2,     2,     2,
       2,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     0,     2,     4,     2,     0,     2,     1,     1,     1,
       4,     1,     0,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     0,     3,     0,     1,     1,     3,     1,
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
       1,     2,     1,     1,     2,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     2,     1,     1,     2,     1,     2,     1,
       2,     2,     1,     2,     2,     1,     1,     1,     3,     1,
       3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     5,     5,     0,     6,   414,     3,     0,     2,     0,
       1,     0,     0,     0,     0,     0,   138,     0,     0,   113,
     429,     0,    20,    21,     0,     0,     0,   422,   141,   419,
     413,   415,   417,     0,    56,   425,     9,     0,     0,     0,
       0,     0,     0,     5,     7,    18,    15,    16,    17,    13,
      14,    12,    10,    56,    19,    11,     0,    40,    41,    46,
     130,   426,   423,   427,   365,   370,   371,   373,   372,   367,
     368,   374,   369,    24,   366,     0,   115,     0,   421,    25,
     420,   418,   346,   347,   343,   344,   361,   362,   364,   363,
       0,     0,   142,   143,   146,   151,   147,     0,   148,   345,
     150,   149,   416,   424,     0,   132,    43,     0,    39,    55,
      53,    54,     0,     0,     0,   328,     0,     0,     4,     0,
       0,    50,     0,    47,    48,    22,   113,   119,   120,   124,
       0,   116,   117,   122,   112,     0,    26,    27,    29,   361,
       0,   154,   342,   341,   358,   359,   360,   430,     0,   152,
     428,    59,    60,    61,    58,   324,     0,   324,    62,     0,
      63,    64,     0,     0,     0,    57,     0,     0,     0,     0,
       0,     0,     8,    81,   276,     0,   275,    45,     0,   121,
       0,   114,     0,     0,     0,   153,     0,   144,     0,    67,
     325,     0,    68,    73,    65,    69,    70,    71,    44,     0,
       0,     0,    42,    92,    80,   240,    49,   126,   113,   128,
     127,   123,   125,   118,    30,    28,   155,     0,     0,    78,
       0,    74,    75,    79,    77,   335,   336,   337,     0,     0,
      82,   129,     0,     0,     0,    31,    32,     0,    35,    36,
     326,    66,    72,     0,    52,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   138,   367,   368,   374,
     369,   270,   361,   278,     0,    51,    93,    95,   109,   111,
     107,   108,   110,   106,   105,    96,     0,   141,   137,   104,
       0,    97,     0,     0,    98,    99,   100,   103,   241,   242,
     243,     0,   264,   266,   265,     0,   269,     0,   102,   290,
     291,   293,   292,   294,   101,     0,   329,   330,     0,   360,
     366,   354,   355,   356,   357,    85,     0,     0,    37,    23,
      33,    34,    76,     0,     0,   334,   332,   333,   331,   299,
       0,     0,   310,   315,   245,     0,     0,    94,     0,     0,
       0,     0,     0,   279,   280,   284,   131,   135,   136,   139,
     140,   147,   159,   190,   365,   370,   371,   373,   372,   367,
     368,   374,   369,   346,   343,   344,     0,     0,     0,   359,
     261,   268,     0,     0,   327,   412,   410,   411,     0,     0,
     401,   402,   403,   404,   406,   407,   405,   408,   409,     0,
       0,     0,     0,    84,    38,     0,   235,   238,     0,   346,
       0,   300,   301,   304,   303,   320,   307,   295,   297,     0,
       0,   311,   312,     0,     0,   316,   317,     0,     0,   246,
     247,   134,   296,   133,   233,     0,     0,   277,     0,   282,
       0,   231,   232,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   348,   349,   350,   351,   353,   352,     0,
       0,     0,     0,     0,     0,     0,   274,   272,   273,     0,
     271,   262,   172,   173,   176,   174,   175,   177,   365,   270,
     162,   163,   361,   375,   376,   377,     0,   166,   167,   263,
     164,     0,   359,   366,     0,   171,     0,    83,    91,   324,
     288,   286,   287,     0,    86,    88,    89,    87,   234,     0,
     239,   237,     0,     0,   298,     0,   306,     0,     0,   313,
       0,     0,   318,     0,     0,     0,     0,     0,   248,   181,
     283,   281,   285,   145,   202,   204,   205,   206,   207,   208,
     209,     0,     0,     0,     0,     0,     0,     0,     0,   369,
     212,     0,   213,   210,   211,   223,   227,   228,   224,   218,
     225,   219,   220,   216,   226,   221,   222,   217,   214,   200,
     215,   203,   267,   400,   395,   397,   396,   399,   398,   388,
     389,   390,   393,   391,   392,   394,   387,   379,   385,   378,
     380,   381,   382,   383,   384,   386,     0,     0,     0,   170,
     157,   168,     0,   169,   178,   180,   289,     0,   236,   338,
     339,   340,   305,   302,   324,   322,   321,   314,   309,   319,
     308,   249,     0,   253,   269,   251,   255,   191,   192,   193,
     194,   195,   196,   197,   199,   198,   201,   185,   184,   186,
     188,   182,   189,   187,   183,     0,     0,   179,     0,   323,
       0,     0,   250,     0,   260,     0,   256,   257,   156,   158,
      90,     0,   254,     0,     0,   258,   252,   259,   244
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     8,     5,    43,    44,    21,    22,    23,    24,
     135,   136,   137,   234,   235,   236,   237,   238,   239,    46,
      25,    48,    49,    50,    26,   122,   123,   124,    52,   265,
      53,   110,   104,   165,   194,   220,   221,   222,   203,   204,
     230,   315,   392,   504,   505,   506,   228,   266,   267,   268,
      27,    77,   130,   131,   132,   133,   180,   212,    61,   271,
      54,   273,   274,   275,   276,    28,   348,    91,    92,   350,
      93,    94,    95,    96,   140,   278,   279,   487,   280,   488,
     281,   282,   366,   558,   283,   433,   284,   285,   395,   396,
     511,    29,   287,   288,   289,   418,   419,   420,   527,   652,
     655,   656,   657,   290,   291,   292,   293,   294,   295,   469,
      97,   297,   342,   343,   344,   429,   507,   298,   299,   300,
     301,   330,   400,   401,   402,   403,   404,   405,   302,   303,
     410,   411,   412,   414,   415,   416,   516,   616,   189,   190,
     304,    55,   305,   306,   325,   307,   326,   327,   609,   406,
     142,    99,   459,   316,   143,   144,   145,   146,    74,   494,
     596,   390,     6,     7,    30,    31,    32,    62,    33,    34,
      35
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -592
static const yytype_int16 yypact[] =
{
       2,    18,    18,    76,  -592,  -592,  -592,    41,  -592,    81,
    -592,    53,    54,    61,   -14,    46,  -592,   698,    77,     3,
    -592,    95,  -592,  -592,    35,   135,   146,  -592,   667,  -592,
      41,  -592,  -592,    46,  -592,  -592,   148,   142,   155,   167,
     554,   210,   170,   200,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,   115,  -592,  -592,   198,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,   139,    60,   222,  -592,   698,
    -592,  -592,  -592,  -592,  -592,  -592,   136,  -592,  -592,  -592,
     811,   226,   157,  -592,  -592,  -592,  -592,   156,  -592,  -592,
    -592,   158,  -592,  -592,   722,  -592,  -592,   160,  -592,  -592,
    -592,  -592,   698,   698,   698,  -592,   159,    21,  -592,   388,
     165,  -592,   166,   164,  -592,  -592,     3,  -592,  -592,  -592,
     171,   175,  -592,  -592,  -592,   177,   180,  -592,  -592,  -592,
     -36,  -592,  -592,  -592,  -592,  -592,  -592,  -592,   667,  -592,
    -592,  -592,  -592,  -592,  -592,   184,   189,   184,  -592,   191,
    -592,  -592,   184,   184,   184,  -592,   238,   202,   203,   219,
     277,   148,  -592,  -592,  -592,   307,  -592,  -592,   198,  -592,
      -7,  -592,    60,   309,   698,  -592,   811,  -592,   301,  -592,
    -592,   554,  -592,   153,  -592,  -592,  -592,  -592,  -592,   302,
     300,   100,  -592,  -592,   343,  -592,  -592,  -592,     3,  -592,
    -592,  -592,  -592,  -592,    56,  -592,  -592,   232,   233,  -592,
     234,   236,  -592,  -592,  -592,  -592,  -592,  -592,   276,   201,
    -592,  -592,   201,   249,   254,    56,  -592,   325,  -592,  -592,
    -592,  -592,  -592,   153,  -592,   201,   141,   141,   242,   242,
     327,   328,   330,   247,   293,   534,   705,   828,   851,  1004,
     698,  -592,     5,   460,   332,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,   333,   667,  -592,  -592,
     334,  -592,   335,   868,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,   338,  -592,  -592,  -592,   242,   246,   253,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,   341,  -592,  -592,   765,   -58,
     156,  -592,  -592,  -592,  -592,  -592,   698,   267,  -592,  -592,
    -592,  -592,  -592,   698,   698,  -592,  -592,  -592,  -592,   885,
     345,   346,   358,   364,   356,   353,   355,  -592,   357,   359,
     269,   342,   278,   280,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,   275,  -592,  -592,    -9,    -9,    -9,    -9,    -9,    -9,
      -9,   225,    -8,   163,   163,   163,   354,    -9,   163,    -9,
    -592,  -592,   412,   293,  -592,  -592,  -592,  -592,   598,   712,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,   617,
     811,   281,    58,  -592,  -592,    -2,  -592,   305,   282,   351,
     290,   291,  -592,  -592,  -592,  -592,  -592,  -592,  -592,   811,
     390,   358,  -592,   811,   389,   364,  -592,   811,    34,   356,
    -592,  -592,  -592,  -592,  -592,   811,  1004,  -592,   460,   130,
     811,  -592,  -592,   698,   698,   698,   698,   698,   698,   698,
     370,   379,   380,   381,   382,   383,   384,   385,  1034,    -9,
     698,   698,   698,  -592,  -592,  -592,  -592,  -592,  -592,   902,
     919,   936,   698,   698,   811,   698,  -592,  -592,  -592,   242,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,   650,   546,
     666,   666,     5,  -592,  -592,  -592,   667,  -592,  -592,  -592,
    -592,   666,   397,   -15,   811,  -592,   811,  -592,  -592,   184,
    -592,  -592,  -592,   317,  -592,  -592,  -592,  -592,  -592,   698,
    -592,  -592,  1021,   811,  -592,   885,    68,   402,   403,  -592,
     405,   406,  -592,   407,   165,   293,   165,   408,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,   698,   698,   698,   698,   698,   698,   698,   698,   698,
    -592,   698,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,   987,   953,   970,  -592,
     323,   326,   811,  -592,  -592,  -592,  -592,   153,  -592,  -592,
    -592,  -592,  -592,  -592,   184,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,   425,   344,  -592,  -592,    27,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,   667,   667,  -592,   347,  -592,
     451,   165,  -592,   460,  -592,   441,    27,  -592,   157,   157,
    -592,   412,  -592,   435,   452,  -592,  -592,  -592,  -592
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -592,  -592,  -592,    28,  -592,   369,     9,  -592,  -592,  -592,
    -592,  -592,   304,  -592,  -592,   255,  -592,  -592,  -592,  -592,
      -1,  -592,  -592,  -592,    10,  -592,  -592,   311,  -592,  -592,
    -592,   303,   438,  -592,  -592,  -592,  -592,  -236,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -592,  -592,  -592,   241,  -592,
    -213,   -97,  -592,  -592,   336,  -592,  -592,  -592,  -188,  -592,
    -182,  -592,  -592,  -592,  -592,  -212,  -592,   216,  -421,  -592,
     367,    30,  -592,   -93,  -592,  -592,  -592,  -592,  -592,  -592,
    -592,  -592,  -592,  -592,  -592,  -216,  -592,  -591,  -592,    11,
    -592,  -181,  -592,  -592,  -592,  -592,  -592,   102,  -592,  -592,
    -592,  -592,  -137,  -592,  -592,  -241,  -592,  -592,    -3,  -138,
    -118,   283,  -592,  -592,  -419,  -592,   108,  -592,  -592,  -592,
    -592,  -239,  -592,  -592,    23,  -592,  -349,    26,  -592,  -592,
    -592,  -592,   129,  -592,  -592,   126,  -592,  -592,  -151,   110,
    -592,  -592,  -592,  -592,   295,  -592,   506,  -592,  -592,   -85,
     -27,  -189,  -230,  -173,  -214,  -592,   -25,   -17,  -211,  -592,
    -401,  -592,  -592,  -592,  -592,   518,  -592,   516,  -592,  -592,
      42
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -366
static const yytype_int16 yytable[] =
{
      73,    98,   175,   100,   149,   141,   192,   322,    47,   531,
     331,   101,   227,   336,   308,   269,   277,   310,    45,    51,
    -161,    -6,   171,   111,    37,    38,    39,    40,   207,   179,
       9,    12,    13,   508,    14,   654,   431,   451,    41,   245,
     270,   308,   269,   277,   310,   338,   272,   286,   524,   345,
      11,    12,    13,     4,    14,    42,   371,    63,   653,   317,
     517,  -275,   138,   525,   520,   654,   526,   270,   523,   368,
    -275,   118,   323,   272,   286,    63,    10,    15,    16,   597,
     598,    60,    36,    16,    37,    38,    39,    40,   185,   186,
     602,    12,    13,   497,    14,   167,   168,   169,    41,    56,
     223,   216,    57,   176,   208,   209,   210,    58,    90,    59,
     296,   231,   432,   452,    75,    42,    47,     1,     2,   509,
     211,    98,    76,   100,  -276,    17,    45,    51,    90,    18,
      78,   101,   471,  -276,   460,   461,   296,   296,   464,   434,
     435,   436,   437,   438,   439,    17,    82,    83,   489,    18,
     223,   463,    19,   465,    79,   498,   499,   500,    20,   501,
     502,   503,   232,   233,   474,   477,   614,   138,   615,   340,
      80,   126,   127,   128,   111,   491,   224,   486,   493,   112,
     113,    81,   114,   105,   351,    17,   129,   324,   106,    18,
      64,    65,    66,    67,    68,    69,    70,    71,    72,   219,
     490,   107,    64,    65,    66,    67,    68,    69,    70,    71,
      72,   309,   530,   108,   345,   174,   116,   391,   453,   454,
     455,   456,   457,   458,   658,   659,   224,   264,   499,   500,
     572,   501,   502,   551,   663,   117,   120,   176,   309,   311,
     312,   313,   314,   339,   121,   559,   563,   567,   112,   113,
      98,   114,   100,   125,   264,   296,   367,   134,   369,  -276,
     101,   147,   440,   441,   442,   443,   444,   445,   446,   447,
     448,   296,   195,   196,   197,   449,    90,   171,   148,    90,
     170,  -275,   166,   244,   198,    11,    12,    13,   245,   178,
     177,   181,   246,   247,   248,   249,   182,   183,   250,   393,
     251,   184,   252,   188,   253,   495,   397,   398,   191,   254,
     193,    60,   255,   256,    65,    66,    67,    68,   257,   258,
     259,   260,   261,   202,   199,   200,   262,    87,    88,    89,
      64,    65,    66,    67,    68,    69,    70,    71,    72,   261,
     529,   201,   205,   174,   214,   533,   450,   217,   606,   226,
     225,   229,   240,   241,   242,   470,   176,   243,   318,   319,
     321,   329,   332,   333,   492,   334,   263,   346,   347,   352,
     353,   648,   309,   370,   372,   373,   374,   394,   409,   570,
     407,   408,   638,   641,   644,   413,   417,    19,   421,   599,
     422,   425,   423,   601,   424,   263,   426,   430,   427,   462,
     603,   428,   510,   496,   512,   513,   622,   624,   625,   604,
     514,   605,   515,   518,   521,   541,   534,   535,   536,   537,
     538,   539,   540,   173,   542,   543,   544,   545,   546,   547,
     548,   550,  -165,   552,   553,   554,   607,   617,   618,   345,
     619,   620,   621,   626,   645,   568,   569,   646,   571,    64,
      65,    66,    67,    68,    69,    70,    71,    72,   466,    98,
     650,   100,   467,   649,   468,   651,   661,   660,   664,   101,
     667,   151,   152,   153,   154,   155,   156,   157,   158,   159,
     160,   161,   162,   163,   164,   610,   172,   668,   215,   206,
     320,   119,   397,   349,   218,   611,   337,    64,    65,    66,
      67,    68,    69,    70,    71,    72,   341,   176,   176,   176,
     139,    87,    88,    89,   223,   187,   600,   647,   213,   665,
     608,   528,   623,   666,   627,   628,   629,   630,   631,   632,
     633,   634,   635,   662,   636,   171,   335,   532,   613,   612,
     519,   522,   328,    11,    12,    13,   245,   115,   102,   103,
     246,   247,   248,   249,     0,     0,   250,     0,   251,     0,
     252,     0,   253,     0,     0,     0,     0,   254,     0,    60,
       0,   256,    65,    66,    67,    68,   257,   258,   259,   260,
     261,  -346,     0,     0,   262,    87,    88,    89,     0,     0,
     224,    64,    65,    66,    67,    68,    69,    70,    71,    72,
     109,   573,   574,   575,   576,   577,   578,   579,   580,   581,
     582,   583,   584,   585,   586,     0,     0,     0,    98,    98,
     100,   100,     0,     0,     0,     0,     0,     0,   101,   101,
       0,     0,     0,     0,   176,    64,    65,    66,    67,    68,
      69,    70,    71,    72,   470,    19,   472,   473,   139,    87,
      88,    89,     0,   263,   478,    65,    66,    67,    68,    69,
      70,    71,    72,   479,    83,   480,   481,   482,    87,    88,
      89,     0,     0,     0,     0,   587,     0,   588,   589,   590,
     591,   592,   593,   594,   595,  -160,     0,  -138,  -138,  -138,
    -138,  -138,  -138,  -138,  -138,  -138,  -138,  -138,  -138,  -138,
    -138,  -138,  -138,  -138,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    82,    83,    84,    85,    86,    87,    88,
      89,   573,   574,   575,   576,   577,   578,   579,   580,   581,
     582,   583,   584,   585,   586,    64,    65,    66,    67,    68,
      69,    70,    71,    72,     0,     0,   483,   484,   485,    64,
      65,    66,    67,    68,    69,    70,    71,    72,   150,     0,
     475,   476,   139,    87,    88,    89,     0,     0,     0,     0,
       0,     0,     0,  -138,  -365,  -365,  -365,  -365,  -365,  -365,
    -365,  -365,  -365,  -365,  -365,  -365,  -365,  -365,     0,     0,
      90,     0,     0,     0,     0,   587,     0,   588,   589,   590,
     591,   592,   593,   594,   595,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,   162,   163,   164,     0,
       0,     0,     0,     0,  -365,     0,     0,  -365,     0,     0,
       0,     0,     0,  -365,   375,   376,   377,   378,   379,   380,
     381,   382,   383,   384,   385,   386,   387,   388,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    82,    83,    84,
      85,   139,    87,    88,    89,  -229,  -229,  -229,  -229,  -229,
    -229,  -229,  -229,  -229,  -229,  -229,  -229,  -229,  -229,  -229,
    -229,  -229,     0,     0,     0,     0,     0,   389,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,   354,   355,   356,   357,   358,
     359,   360,   361,   362,   363,    83,   364,   365,   139,    87,
      88,    89,    64,    65,    66,    67,    68,    69,    70,    71,
      72,   399,    83,    84,    85,   139,    87,    88,    89,    64,
      65,    66,    67,    68,    69,    70,    71,    72,   555,     0,
     556,   557,   139,    87,    88,    89,    64,    65,    66,    67,
      68,    69,    70,    71,    72,   560,     0,   561,   562,   139,
      87,    88,    89,    64,    65,    66,    67,    68,    69,    70,
      71,    72,   564,     0,   565,   566,   139,    87,    88,    89,
      64,    65,    66,    67,    68,    69,    70,    71,    72,     0,
       0,   639,   640,   139,    87,    88,    89,    64,    65,    66,
      67,    68,    69,    70,    71,    72,     0,     0,   642,   643,
     139,    87,    88,    89,    64,    65,    66,    67,    68,    69,
      70,    71,    72,   637,     0,     0,     0,   139,    87,    88,
      89,    64,    65,    66,    67,    68,    69,    70,    71,    72,
       0,     0,     0,     0,   139,    87,    88,    89,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    82,    83,    84,
      85,    64,    65,    66,    67,    68,    69,    70,    71,   549
};

static const yytype_int16 yycheck[] =
{
      17,    28,   120,    28,    97,    90,   157,   243,     9,   428,
     249,    28,   201,   254,   228,   228,   228,   228,     9,     9,
      35,     0,     1,    40,     3,     4,     5,     6,    35,   126,
       2,    10,    11,    35,    13,   626,    45,    45,    17,    12,
     228,   255,   255,   255,   255,   259,   228,   228,    14,   263,
       9,    10,    11,    35,    13,    34,   295,    15,    31,   232,
     409,   119,    79,    29,   413,   656,    32,   255,   417,   283,
     128,    43,   245,   255,   255,    33,     0,    36,    37,   480,
     481,    35,     1,    37,     3,     4,     5,     6,   124,   125,
     491,    10,    11,    35,    13,   112,   113,   114,    17,    46,
     193,   186,    48,   120,   111,   112,   113,    46,   123,   123,
     228,   208,   121,   121,    37,    34,   117,   115,   116,   121,
     127,   148,   119,   148,   119,   104,   117,   117,   123,   108,
      35,   148,   373,   128,   364,   365,   254,   255,   368,   355,
     356,   357,   358,   359,   360,   104,    46,    47,   389,   108,
     243,   367,   111,   369,   119,    97,    98,    99,   117,   101,
     102,   103,   106,   107,   378,   379,    98,   184,   100,   262,
      35,   111,   112,   113,   191,   389,   193,   389,   389,    38,
      39,    35,    41,    35,   277,   104,   126,    46,    46,   108,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
     389,    46,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   228,   426,    46,   428,    50,    46,   310,    55,    56,
      57,    58,    59,    60,   645,   646,   243,   228,    98,    99,
     469,   101,   102,   449,   653,    35,   121,   254,   255,    38,
      39,    40,    41,   260,    46,   459,   460,   461,    38,    39,
     277,    41,   277,   114,   255,   373,   283,    35,   283,   123,
     277,    35,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   389,   162,   163,   164,    50,   123,     1,   121,   123,
     121,   123,   122,     7,    46,     9,    10,    11,    12,   125,
     124,   120,    16,    17,    18,    19,   121,   120,    22,   316,
      24,   121,    26,   119,    28,   390,   323,   324,   119,    33,
     119,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    46,   122,   122,    50,    51,    52,    53,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
     425,   122,    35,    50,    35,   430,   121,    46,   499,    49,
      48,     8,   120,   120,   120,   372,   373,   121,   109,   105,
      35,   119,    35,    35,   389,    35,   119,    35,    35,    35,
      35,   607,   389,    35,   128,   122,    35,   110,    20,   464,
      35,    35,   596,   597,   598,    21,    30,   111,    35,   482,
      35,   122,    35,   486,    35,   119,    54,   122,   120,    45,
     493,   121,    97,   122,   122,    54,   524,   525,   526,   494,
     120,   496,   121,    23,    25,    45,   433,   434,   435,   436,
     437,   438,   439,    35,    45,    45,    45,    45,    45,    45,
      45,   448,    35,   450,   451,   452,   119,    35,    35,   653,
      35,    35,    35,    35,   121,   462,   463,   121,   465,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,   486,
      35,   486,    50,   614,    52,   121,    15,   120,    27,   486,
      35,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,   512,   117,    35,   184,   178,
     235,    53,   509,   277,   191,   512,   255,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,   524,   525,   526,
      50,    51,    52,    53,   607,   148,   486,   602,   182,   656,
     509,   419,   525,   661,   541,   542,   543,   544,   545,   546,
     547,   548,   549,   651,   551,     1,   253,   429,   515,   513,
     411,   415,   247,     9,    10,    11,    12,    41,    30,    33,
      16,    17,    18,    19,    -1,    -1,    22,    -1,    24,    -1,
      26,    -1,    28,    -1,    -1,    -1,    -1,    33,    -1,    35,
      -1,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    35,    -1,    -1,    50,    51,    52,    53,    -1,    -1,
     607,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    -1,    -1,    -1,   645,   646,
     645,   646,    -1,    -1,    -1,    -1,    -1,    -1,   645,   646,
      -1,    -1,    -1,    -1,   651,    37,    38,    39,    40,    41,
      42,    43,    44,    45,   661,   111,    48,    49,    50,    51,
      52,    53,    -1,   119,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    -1,    -1,    -1,    -1,   129,    -1,   131,   132,   133,
     134,   135,   136,   137,   138,    35,    -1,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      53,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    -1,    -1,   129,   130,   131,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    36,    -1,
      48,    49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   123,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    -1,    -1,
     123,    -1,    -1,    -1,    -1,   129,    -1,   131,   132,   133,
     134,   135,   136,   137,   138,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    96,    -1,
      -1,    -1,    -1,    -1,   119,    -1,    -1,   122,    -1,    -1,
      -1,    -1,    -1,   128,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    -1,    -1,    -1,    -1,    -1,   122,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    -1,
      48,    49,    50,    51,    52,    53,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    -1,    48,    49,    50,
      51,    52,    53,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    -1,    48,    49,    50,    51,    52,    53,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    -1,
      -1,    48,    49,    50,    51,    52,    53,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    -1,    -1,    48,    49,
      50,    51,    52,    53,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    -1,    -1,    -1,    50,    51,    52,
      53,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      -1,    -1,    -1,    -1,    50,    51,    52,    53,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    37,    38,    39,    40,    41,    42,    43,    44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   115,   116,   140,    35,   142,   301,   302,   141,   142,
       0,     9,    10,    11,    13,    36,    37,   104,   108,   111,
     117,   145,   146,   147,   148,   159,   163,   189,   204,   230,
     303,   304,   305,   307,   308,   309,     1,     3,     4,     5,
       6,    17,    34,   143,   144,   145,   158,   159,   160,   161,
     162,   163,   167,   169,   199,   280,    46,    48,    46,   123,
      35,   197,   306,   309,    37,    38,    39,    40,    41,    42,
      43,    44,    45,   296,   297,    37,   119,   190,    35,   119,
      35,    35,    46,    47,    48,    49,    50,    51,    52,    53,
     123,   206,   207,   209,   210,   211,   212,   249,   289,   290,
     295,   296,   304,   306,   171,    35,    46,    46,    46,    46,
     170,   296,    38,    39,    41,   285,    46,    35,   142,   171,
     121,    46,   164,   165,   166,   114,   111,   112,   113,   126,
     191,   192,   193,   194,    35,   149,   150,   151,   296,    50,
     213,   288,   289,   293,   294,   295,   296,    35,   121,   212,
      36,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,   172,   122,   296,   296,   296,
     121,     1,   144,    35,    50,   249,   296,   124,   125,   190,
     195,   120,   121,   120,   121,   124,   125,   209,   119,   277,
     278,   119,   277,   119,   173,   278,   278,   278,    46,   122,
     122,   122,    46,   177,   178,    35,   166,    35,   111,   112,
     113,   127,   196,   193,    35,   151,   288,    46,   170,    46,
     174,   175,   176,   212,   296,    48,    49,   290,   185,     8,
     179,   190,   106,   107,   152,   153,   154,   155,   156,   157,
     120,   120,   120,   121,     7,    12,    16,    17,    18,    19,
      22,    24,    26,    28,    33,    36,    37,    42,    43,    44,
      45,    46,    50,   119,   159,   168,   186,   187,   188,   189,
     197,   198,   199,   200,   201,   202,   203,   204,   214,   215,
     217,   219,   220,   223,   225,   226,   230,   231,   232,   233,
     242,   243,   244,   245,   246,   247,   249,   250,   256,   257,
     258,   259,   267,   268,   279,   281,   282,   284,   293,   296,
     297,    38,    39,    40,    41,   180,   292,   292,   109,   105,
     154,    35,   176,   292,    46,   283,   285,   286,   283,   119,
     260,   260,    35,    35,    35,   250,   244,   187,   293,   296,
     212,    46,   251,   252,   253,   293,    35,    35,   205,   206,
     208,   212,    35,    35,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    48,    49,   221,   289,   293,   295,
      35,   260,   128,   122,    35,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,   122,
     300,   212,   181,   296,   110,   227,   228,   296,   296,    46,
     261,   262,   263,   264,   265,   266,   288,    35,    35,    20,
     269,   270,   271,    21,   272,   273,   274,    30,   234,   235,
     236,    35,    35,    35,    35,   122,    54,   120,   121,   254,
     122,    45,   121,   224,   224,   224,   224,   224,   224,   224,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    50,
     121,    45,   121,    55,    56,    57,    58,    59,    60,   291,
     291,   291,    45,   224,   291,   224,    46,    50,    52,   248,
     296,   244,    48,    49,   293,    48,    49,   293,    37,    46,
      48,    49,    50,   129,   130,   131,   204,   216,   218,   244,
     290,   293,   295,   297,   298,   288,   122,    35,    97,    98,
      99,   101,   102,   103,   182,   183,   184,   255,    35,   121,
      97,   229,   122,    54,   120,   121,   275,   265,    23,   271,
     265,    25,   274,   265,    14,    29,    32,   237,   236,   288,
     293,   253,   255,   288,   296,   296,   296,   296,   296,   296,
     296,    45,    45,    45,    45,    45,    45,    45,    45,    45,
     296,   224,   296,   296,   296,    46,    48,    49,   222,   293,
      46,    48,    49,   293,    46,    48,    49,   293,   296,   296,
     288,   296,   260,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,   129,   131,   132,
     133,   134,   135,   136,   137,   138,   299,   299,   299,   212,
     210,   212,   299,   212,   288,   288,   277,   119,   228,   287,
     289,   296,   266,   263,    98,   100,   276,    35,    35,    35,
      35,    35,   249,   247,   249,   249,    35,   296,   296,   296,
     296,   296,   296,   296,   296,   296,   296,    46,   293,    48,
      49,   293,    48,    49,   293,   121,   121,   288,   176,   277,
      35,   121,   238,    31,   226,   239,   240,   241,   207,   207,
     120,    15,   249,   253,    27,   241,   248,    35,    35
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
#line 570 "pir.y"
    { fixup_global_labels(lexer); ;}
    break;

  case 22:
#line 603 "pir.y"
    { new_macro_const(lexer->macros, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval), yypirget_lineno(yyscanner)); ;}
    break;

  case 23:
#line 609 "pir.y"
    { /* fprintf(stderr, "macro body: [%s]\n", CURRENT_MACRO(lexer)->body);*/ ;}
    break;

  case 24:
#line 613 "pir.y"
    {
                          new_macro(lexer->macros, (yyvsp[(2) - (2)].sval), yypirget_lineno(yyscanner), TRUE,
                                    lexer->macro_size);
                        ;}
    break;

  case 29:
#line 628 "pir.y"
    { add_macro_param(CURRENT_MACRO(lexer), (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 37:
#line 647 "pir.y"
    { store_macro_string(CURRENT_MACRO(lexer), "%s\n", (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 38:
#line 651 "pir.y"
    {
                          store_macro_string(CURRENT_MACRO(lexer), ".local %s %s\n",
                                             pir_type_names[(yyvsp[(2) - (3)].ival)], (yyvsp[(3) - (3)].sval));
                        ;}
    break;

  case 39:
#line 662 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 666 "pir.y"
    { yypirset_lineno ((yyvsp[(2) - (2)].ival), yyscanner); ;}
    break;

  case 41:
#line 668 "pir.y"
    { lexer->filename = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 42:
#line 672 "pir.y"
    { annotate(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 43:
#line 678 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 44:
#line 682 "pir.y"
    { set_hll_map(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 45:
#line 686 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 46:
#line 690 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 47:
#line 692 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 48:
#line 696 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 49:
#line 698 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 50:
#line 702 "pir.y"
    { (yyval.expr) = expr_from_string(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 52:
#line 712 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 53:
#line 716 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 58:
#line 728 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_ANON);;}
    break;

  case 59:
#line 730 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_INIT); ;}
    break;

  case 60:
#line 732 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_LOAD); ;}
    break;

  case 61:
#line 734 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_MAIN); ;}
    break;

  case 62:
#line 736 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_LEX); ;}
    break;

  case 63:
#line 738 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_POSTCOMP); ;}
    break;

  case 64:
#line 740 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_IMMEDIATE); ;}
    break;

  case 65:
#line 742 "pir.y"
    { set_sub_flag(lexer, PIRC_SUB_FLAG_MULTI); ;}
    break;

  case 66:
#line 744 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 67:
#line 746 "pir.y"
    { set_sub_methodname(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 68:
#line 748 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 69:
#line 750 "pir.y"
    { set_sub_subid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 70:
#line 752 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 71:
#line 754 "pir.y"
    { set_sub_nsentry(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 72:
#line 758 "pir.y"
    { set_sub_multi_types(lexer, (yyvsp[(2) - (3)].expr)); ;}
    break;

  case 73:
#line 762 "pir.y"
    {
                          CURRENT_SUB(lexer)->info.num_multi_types = 1;
                          /* n=1 means :multi() -- without any types. */
                        ;}
    break;

  case 74:
#line 767 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 75:
#line 771 "pir.y"
    {
                          CURRENT_SUB(lexer)->info.num_multi_types = 2;
                          /* start counting multi types; always 1 higher than actual number
                           * so that n=0 means no :multi, n=1 means :multi(), n=2 means
                           * :multi(Type1), n=3 means :multi(Type1,Type2), etc.
                           */
                           (yyval.expr) = (yyvsp[(1) - (1)].expr);
                        ;}
    break;

  case 76:
#line 780 "pir.y"
    {
                          ++CURRENT_SUB(lexer)->info.num_multi_types;
                          /* link the multi types in reverse other. That's fine,
                           * as long as you remember that it's reversed.
                           */
                          (yyvsp[(3) - (3)].expr)->next = (yyvsp[(1) - (3)].expr);
                          (yyval.expr) = (yyvsp[(3) - (3)].expr);
                        ;}
    break;

  case 77:
#line 791 "pir.y"
    { (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 78:
#line 793 "pir.y"
    { (yyval.expr) = expr_from_string(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 79:
#line 795 "pir.y"
    { (yyval.expr) = expr_from_key(lexer, (yyvsp[(1) - (1)].key)); ;}
    break;

  case 80:
#line 799 "pir.y"
    {
                           /* if there are parameters, then emit a get_params instruction. */
                           if ((yyvsp[(1) - (1)].uval) > 0)
                               generate_parameters_instr(lexer, (yyvsp[(1) - (1)].uval));
                         ;}
    break;

  case 81:
#line 807 "pir.y"
    { (yyval.uval) = 0; ;}
    break;

  case 82:
#line 809 "pir.y"
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

  case 83:
#line 822 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 84:
#line 826 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 85:
#line 830 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 86:
#line 832 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 90:
#line 841 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT;
                           /* XXX handle multi_type */

                         ;}
    break;

  case 91:
#line 848 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 93:
#line 855 "pir.y"
    {
                         ++lexer->stmt_counter;
                         /* increment the logical statement counter; a statement can be
                          * multiple lines, but each statement has its own ID for the
                          * linear scan register allocator.
                          */
                        ;}
    break;

  case 94:
#line 865 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 112:
#line 893 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (3)].mval), (yyvsp[(2) - (3)].pval)); ;}
    break;

  case 113:
#line 897 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 114:
#line 899 "pir.y"
    { (yyval.pval) = (yyvsp[(2) - (3)].pval); ;}
    break;

  case 115:
#line 903 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 117:
#line 908 "pir.y"
    { (yyval.pval) = new_macro_param((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 118:
#line 910 "pir.y"
    {
                          macro_param *param = new_macro_param((yyvsp[(3) - (3)].sval));
                          param->next = (yyvsp[(1) - (3)].pval);
                          (yyval.pval) = param;
                        ;}
    break;

  case 119:
#line 918 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "macro argument '%s' is not a "
                                                           "declared identifier", (yyvsp[(1) - (1)].sval));
                          }
                        ;}
    break;

  case 121:
#line 927 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 123:
#line 932 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 124:
#line 937 "pir.y"
    { (yyval.sval) = ""; ;}
    break;

  case 125:
#line 939 "pir.y"
    { /* XXX cleanup memory stuff */
                          char *newbuff = (char *)mem_sys_allocate((strlen((yyvsp[(1) - (2)].sval)) + strlen((yyvsp[(2) - (2)].sval)) + 2)
                                                                   * sizeof (char));
                          sprintf(newbuff, "%s %s", (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval));
                          (yyval.sval) = newbuff;
                        ;}
    break;

  case 129:
#line 951 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 130:
#line 959 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 132:
#line 967 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         ;}
    break;

  case 133:
#line 976 "pir.y"
    {
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(lexer);
                         ;}
    break;

  case 134:
#line 983 "pir.y"
    {
                           set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(lexer);
                         ;}
    break;

  case 138:
#line 997 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 139:
#line 1006 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(lexer))
                              do_strength_reduction(lexer);
                        ;}
    break;

  case 145:
#line 1024 "pir.y"
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
#line 1060 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 147:
#line 1062 "pir.y"
    { push_operand(lexer, expr_from_key(lexer, (yyvsp[(1) - (1)].key))); ;}
    break;

  case 148:
#line 1066 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 149:
#line 1068 "pir.y"
    { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 150:
#line 1073 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 151:
#line 1075 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 152:
#line 1079 "pir.y"
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
#line 1102 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 154:
#line 1106 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 155:
#line 1108 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 156:
#line 1117 "pir.y"
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
#line 1128 "pir.y"
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
#line 1140 "pir.y"
    {
                          unshift_operand(lexer, expr_from_key(lexer, (yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));
                          if (check_op_args_for_symbols(lexer))
                              check_first_arg_direction(lexer, (yyvsp[(3) - (6)].sval));
                              /* no strength reduction here */
                        ;}
    break;

  case 162:
#line 1157 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(lexer);
                        ;}
    break;

  case 163:
#line 1166 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(lexer);
                        ;}
    break;

  case 164:
#line 1175 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].cval));
                          get_opinfo(lexer);
                        ;}
    break;

  case 165:
#line 1180 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 166:
#line 1185 "pir.y"
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
#line 1206 "pir.y"
    {
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                          get_opinfo(lexer);
                        ;}
    break;

  case 168:
#line 1211 "pir.y"
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
#line 1252 "pir.y"
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
#line 1270 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                          get_opinfo(lexer);
                        ;}
    break;

  case 171:
#line 1277 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 172:
#line 1282 "pir.y"
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
#line 1293 "pir.y"
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
#line 1304 "pir.y"
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
#line 1315 "pir.y"
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
#line 1326 "pir.y"
    {
                          set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 177:
#line 1331 "pir.y"
    {
                          set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(lexer);
                        ;}
    break;

  case 178:
#line 1336 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 179:
#line 1341 "pir.y"
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
#line 1351 "pir.y"
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
#line 1370 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                          get_opinfo(lexer);
                        ;}
    break;

  case 182:
#line 1404 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 183:
#line 1406 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 184:
#line 1408 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 185:
#line 1410 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 186:
#line 1412 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 187:
#line 1414 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 188:
#line 1416 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 189:
#line 1418 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 190:
#line 1423 "pir.y"
    { get_opinfo(lexer); ;}
    break;

  case 191:
#line 1432 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 192:
#line 1434 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 193:
#line 1436 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 194:
#line 1438 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 195:
#line 1440 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 196:
#line 1442 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 197:
#line 1444 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 198:
#line 1446 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 199:
#line 1448 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 200:
#line 1450 "pir.y"
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
#line 1462 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (5)].ival)), (yyvsp[(5) - (5)].sval));
                        ;}
    break;

  case 202:
#line 1467 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 203:
#line 1469 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 204:
#line 1471 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 205:
#line 1473 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 206:
#line 1475 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 207:
#line 1477 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 208:
#line 1479 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 209:
#line 1481 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 210:
#line 1483 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 211:
#line 1485 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 212:
#line 1487 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 213:
#line 1489 "pir.y"
    { create_if_instr(lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 214:
#line 1491 "pir.y"
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

  case 215:
#line 1522 "pir.y"
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

  case 216:
#line 1548 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%i", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].ival));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 217:
#line 1556 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%n", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].dval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 218:
#line 1565 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%s", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].sval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 219:
#line 1574 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 220:
#line 1576 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 221:
#line 1578 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 222:
#line 1580 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 223:
#line 1582 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 224:
#line 1586 "pir.y"
    {
                          yypirerror(yyscanner, lexer, "cannot compare string to %s",
                                     (yyvsp[(3) - (3)].ival) == INT_TYPE ? "integer" : "number");
                        ;}
    break;

  case 225:
#line 1591 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare integer to string"); ;}
    break;

  case 226:
#line 1593 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare number to string"); ;}
    break;

  case 227:
#line 1597 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 228:
#line 1598 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 229:
#line 1601 "pir.y"
    { (yyval.ival) = DONT_INVERT_OPNAME; /* no need to invert */ ;}
    break;

  case 230:
#line 1602 "pir.y"
    { (yyval.ival) = NEED_INVERT_OPNAME; /* yes, invert opname */ ;}
    break;

  case 233:
#line 1610 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_op_labelflag(lexer, BIT(0)); /* bit 0 means: "1 << 0" */
                          get_opinfo(lexer);
                        ;}
    break;

  case 234:
#line 1618 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 235:
#line 1622 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 236:
#line 1624 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 237:
#line 1628 "pir.y"
    { (yyval.symb) = new_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 238:
#line 1631 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 239:
#line 1632 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 240:
#line 1636 "pir.y"
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
#line 1651 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 244:
#line 1663 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args(lexer, (yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              (yyval.invo) = set_invocation_results(lexer, (yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 245:
#line 1670 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 246:
#line 1672 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 247:
#line 1676 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 248:
#line 1678 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 249:
#line 1682 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 250:
#line 1686 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 251:
#line 1688 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 252:
#line 1691 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].expr)); ;}
    break;

  case 253:
#line 1695 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 254:
#line 1697 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 255:
#line 1701 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 256:
#line 1703 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 257:
#line 1707 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 258:
#line 1709 "pir.y"
    {
                             if ((yyvsp[(2) - (2)].targ))
                                 (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ));
                             else
                                 (yyval.targ) = (yyvsp[(1) - (2)].targ)
                           ;}
    break;

  case 259:
#line 1718 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 260:
#line 1720 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 262:
#line 1728 "pir.y"
    { (yyval.invo) = set_invocation_results(lexer, (yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 263:
#line 1730 "pir.y"
    { (yyval.invo) = set_invocation_results(lexer, (yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 264:
#line 1732 "pir.y"
    {  (yyval.invo) = set_invocation_results(lexer, (yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 267:
#line 1740 "pir.y"
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
#line 1760 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 269:
#line 1767 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 270:
#line 1769 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);
                           ;}
    break;

  case 271:
#line 1779 "pir.y"
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
#line 1796 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 273:
#line 1798 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 274:
#line 1800 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 275:
#line 1804 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);

                           ;}
    break;

  case 276:
#line 1813 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 277:
#line 1818 "pir.y"
    {
                             (yyval.targ) = (yyvsp[(2) - (3)].targ);
                           ;}
    break;

  case 278:
#line 1824 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 279:
#line 1826 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 280:
#line 1830 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 281:
#line 1832 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 282:
#line 1836 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 283:
#line 1838 "pir.y"
    { (yyval.targ) = set_param_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 284:
#line 1842 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 285:
#line 1844 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 286:
#line 1848 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 287:
#line 1850 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 288:
#line 1852 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 289:
#line 1854 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 290:
#line 1864 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 295:
#line 1874 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 296:
#line 1879 "pir.y"
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
#line 1890 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 298:
#line 1897 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 299:
#line 1901 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 300:
#line 1903 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 301:
#line 1907 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 302:
#line 1909 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 305:
#line 1917 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 306:
#line 1921 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 307:
#line 1925 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument(lexer, (yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 308:
#line 1931 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 309:
#line 1940 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args(lexer, (yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 310:
#line 1947 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 311:
#line 1949 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 312:
#line 1954 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 313:
#line 1956 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 314:
#line 1961 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 315:
#line 1965 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 316:
#line 1967 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 317:
#line 1971 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 318:
#line 1973 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 319:
#line 1977 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 320:
#line 1982 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 321:
#line 1984 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 322:
#line 1988 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 323:
#line 1990 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 324:
#line 1997 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 325:
#line 1999 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 326:
#line 2003 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 328:
#line 2010 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cdec)); ;}
    break;

  case 331:
#line 2018 "pir.y"
    { (yyval.cdec) = (yyvsp[(2) - (2)].cdec); ;}
    break;

  case 334:
#line 2026 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cdec)); ;}
    break;

  case 335:
#line 2030 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, INT_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 336:
#line 2032 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, NUM_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 337:
#line 2034 "pir.y"
    { (yyval.cdec) = new_named_const(lexer, STRING_VAL, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].cval)); ;}
    break;

  case 338:
#line 2038 "pir.y"
    { (yyval.cdec) = new_pmc_const(lexer, (yyvsp[(1) - (4)].sval), (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].cval)); ;}
    break;

  case 340:
#line 2043 "pir.y"
    { /* this alternative is necessary, otherwise the parser
                               * just stops when assigning an identifier to a pmc
                               * const, without an error message. That may be
                               * a bug in bison.
                               */
                              yypirerror(yyscanner, lexer, "unexpected identifier");
                            ;}
    break;

  case 341:
#line 2055 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 342:
#line 2056 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 343:
#line 2060 "pir.y"
    { (yyval.cval) = new_const(lexer, INT_VAL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 344:
#line 2061 "pir.y"
    { (yyval.cval) = new_const(lexer, NUM_VAL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 345:
#line 2062 "pir.y"
    { (yyval.cval) = (yyvsp[(1) - (1)].cval); ;}
    break;

  case 346:
#line 2065 "pir.y"
    { (yyval.cval) = new_const(lexer, STRING_VAL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 347:
#line 2066 "pir.y"
    { (yyval.cval) = new_const(lexer, USTRING_VAL, (yyvsp[(1) - (1)].ustr)); ;}
    break;

  case 348:
#line 2069 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 349:
#line 2070 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 350:
#line 2071 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 351:
#line 2072 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 352:
#line 2073 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 353:
#line 2074 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 354:
#line 2077 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 355:
#line 2078 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 356:
#line 2079 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 357:
#line 2080 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 358:
#line 2088 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 360:
#line 2092 "pir.y"
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

  case 361:
#line 2105 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 362:
#line 2106 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 363:
#line 2107 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 364:
#line 2108 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 367:
#line 2116 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 368:
#line 2117 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 369:
#line 2118 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 370:
#line 2119 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 371:
#line 2120 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 372:
#line 2121 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 373:
#line 2122 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 374:
#line 2123 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 375:
#line 2126 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 376:
#line 2127 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 377:
#line 2128 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 378:
#line 2131 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 379:
#line 2132 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 380:
#line 2133 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 381:
#line 2134 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 382:
#line 2135 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 383:
#line 2136 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 384:
#line 2137 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 385:
#line 2138 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 386:
#line 2139 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 387:
#line 2140 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 388:
#line 2141 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 389:
#line 2142 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 390:
#line 2143 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 391:
#line 2144 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 392:
#line 2145 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 393:
#line 2146 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 394:
#line 2147 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 395:
#line 2148 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 396:
#line 2149 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 397:
#line 2150 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 398:
#line 2151 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 399:
#line 2152 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 400:
#line 2153 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 401:
#line 2159 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 402:
#line 2160 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 403:
#line 2161 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 404:
#line 2162 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 405:
#line 2163 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 406:
#line 2164 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 407:
#line 2165 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 408:
#line 2166 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 409:
#line 2167 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 410:
#line 2168 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 411:
#line 2169 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 412:
#line 2170 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 414:
#line 2191 "pir.y"
    { new_subr(lexer, "@start"); ;}
    break;

  case 423:
#line 2207 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 428:
#line 2217 "pir.y"
    { set_sub_name(lexer, (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 429:
#line 2221 "pir.y"
    { new_subr(lexer, NULL); ;}
    break;

  case 430:
#line 2226 "pir.y"
    {
                                  if (is_parrot_op(lexer, (yyvsp[(1) - (3)].sval)))
                                      get_opinfo(lexer);
                                  else /* not a parrot op */
                                      yypirerror(yyscanner, lexer, "'%s' is not a parrot op", (yyvsp[(1) - (3)].sval));

                                ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4768 "pirparser.c"
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


#line 2237 "pir.y"






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


