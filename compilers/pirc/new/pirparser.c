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
     TK_INTC = 302,
     TK_NUMC = 303,
     TK_PREG = 304,
     TK_NREG = 305,
     TK_SREG = 306,
     TK_IREG = 307,
     TK_CONST_VALUE = 308,
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
#define TK_INTC 302
#define TK_NUMC 303
#define TK_PREG 304
#define TK_NREG 305
#define TK_SREG 306
#define TK_IREG 307
#define TK_CONST_VALUE 308
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

static void undeclared_symbol(yyscan_t yyscanner, lexer_state * const lexer,
                              char const * const symbol);

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
#line 232 "pir.y"
{
    double              dval;
    int                 ival;
    unsigned            uval;
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
#line 585 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 598 "pirparser.c"

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
#define YYLAST   1007

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  139
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  163
/* YYNRULES -- Number of rules.  */
#define YYNRULES  416
/* YYNRULES -- Number of states.  */
#define YYNSTATES  648

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
      44,    48,    56,    59,    60,    62,    64,    68,    70,    71,
      73,    75,    78,    81,    83,    85,    88,    92,    95,    98,
     101,   106,   109,   114,   119,   120,   122,   124,   128,   130,
     137,   139,   142,   144,   146,   147,   150,   152,   154,   156,
     158,   160,   162,   164,   166,   171,   174,   177,   180,   183,
     186,   188,   190,   192,   194,   195,   198,   203,   206,   207,
     210,   212,   214,   216,   221,   223,   224,   227,   230,   232,
     234,   236,   238,   240,   242,   244,   246,   248,   250,   252,
     254,   256,   258,   260,   262,   264,   268,   269,   273,   274,
     276,   278,   282,   284,   286,   289,   291,   295,   296,   299,
     301,   303,   305,   308,   310,   313,   316,   320,   324,   327,
     330,   332,   334,   336,   338,   339,   341,   343,   347,   351,
     353,   355,   357,   359,   361,   363,   366,   370,   372,   376,
     383,   388,   395,   398,   400,   402,   406,   410,   414,   418,
     422,   426,   431,   436,   441,   445,   449,   453,   457,   461,
     465,   469,   474,   480,   485,   490,   494,   498,   502,   506,
     510,   514,   518,   522,   525,   531,   537,   543,   549,   555,
     561,   567,   573,   579,   584,   590,   595,   600,   605,   610,
     615,   620,   625,   630,   635,   640,   645,   650,   655,   659,
     663,   667,   671,   675,   679,   683,   687,   691,   695,   699,
     703,   705,   707,   709,   711,   713,   715,   719,   724,   726,
     730,   733,   734,   736,   742,   744,   746,   748,   757,   758,
     760,   762,   765,   769,   773,   776,   782,   783,   786,   787,
     789,   791,   794,   798,   800,   803,   807,   811,   813,   815,
     817,   822,   825,   827,   829,   831,   833,   835,   837,   839,
     841,   845,   846,   848,   850,   854,   857,   858,   861,   863,
     865,   867,   870,   872,   874,   876,   878,   880,   884,   888,
     892,   896,   897,   899,   901,   905,   907,   909,   913,   916,
     918,   924,   930,   931,   933,   935,   938,   942,   943,   945,
     947,   950,   954,   955,   958,   960,   963,   964,   966,   970,
     973,   975,   977,   980,   983,   988,   993,   998,  1003,  1005,
    1007,  1009,  1011,  1013,  1015,  1017,  1019,  1021,  1023,  1025,
    1027,  1029,  1031,  1033,  1035,  1037,  1039,  1041,  1043,  1045,
    1047,  1049,  1051,  1053,  1055,  1057,  1059,  1061,  1063,  1065,
    1067,  1069,  1071,  1073,  1075,  1077,  1079,  1081,  1083,  1085,
    1087,  1089,  1091,  1093,  1095,  1097,  1099,  1101,  1103,  1105,
    1107,  1109,  1111,  1113,  1115,  1117,  1119,  1121,  1123,  1125,
    1127,  1129,  1131,  1133,  1135,  1137,  1139,  1141,  1143,  1145,
    1148,  1150,  1152,  1155,  1157,  1160,  1162,  1165,  1168,  1170,
    1173,  1176,  1178,  1180,  1182,  1186,  1188
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     140,     0,    -1,   116,   141,    -1,   115,   293,    -1,   142,
     143,   142,    -1,    -1,    35,    -1,   144,    -1,   143,    35,
     144,    -1,   167,    -1,   278,    -1,   163,    -1,   161,    -1,
     162,    -1,   158,    -1,   159,    -1,   160,    -1,   145,    -1,
     146,    -1,   147,    -1,   108,    37,   114,    -1,   148,   119,
     149,   120,    35,   152,   105,    -1,   104,   288,    -1,    -1,
     150,    -1,   151,    -1,   150,   121,   151,    -1,   288,    -1,
      -1,   153,    -1,   154,    -1,   153,   154,    -1,   155,    35,
      -1,   156,    -1,   157,    -1,   107,   109,    -1,   106,   284,
     110,    -1,     5,    46,    -1,    10,    47,    -1,    11,    46,
      -1,    34,    46,   121,    46,    -1,     3,    46,    -1,     4,
      46,   122,    46,    -1,    13,   123,   164,   124,    -1,    -1,
     165,    -1,   166,    -1,   165,   125,   166,    -1,    46,    -1,
     169,   171,    35,   174,   182,   168,    -1,     7,    -1,     6,
     170,    -1,   288,    -1,    46,    -1,    -1,   171,   172,    -1,
      86,    -1,    83,    -1,    84,    -1,    85,    -1,    90,    -1,
      92,    -1,    93,    -1,    91,    -1,    88,   119,   170,   120,
      -1,    87,   274,    -1,    89,   274,    -1,    94,   275,    -1,
      95,   275,    -1,    96,   275,    -1,   288,    -1,    46,    -1,
     209,    -1,   175,    -1,    -1,   175,   176,    -1,     8,   177,
     178,    35,    -1,   284,   288,    -1,    -1,   178,   179,    -1,
     252,    -1,   180,    -1,   181,    -1,   103,   119,   173,   120,
      -1,    97,    -1,    -1,   182,   183,    -1,    36,   184,    -1,
     184,    -1,   199,    -1,   216,    -1,   222,    -1,   223,    -1,
     227,    -1,   276,    -1,   253,    -1,   228,    -1,   212,    -1,
     198,    -1,   197,    -1,   194,    -1,   195,    -1,   185,    -1,
     196,    -1,   186,    -1,   111,   187,    35,    -1,    -1,   119,
     188,   120,    -1,    -1,   189,    -1,   190,    -1,   189,   121,
     190,    -1,   112,    -1,   113,    -1,   111,   187,    -1,   191,
      -1,   126,   192,   127,    -1,    -1,   192,   193,    -1,    35,
      -1,   113,    -1,   112,    -1,   111,   187,    -1,    35,    -1,
     159,    35,    -1,     1,    35,    -1,    44,   285,    35,    -1,
      28,   247,    35,    -1,   200,    35,    -1,   201,   202,    -1,
     211,    -1,    37,    -1,   203,    -1,   205,    -1,    -1,   204,
      -1,   206,    -1,   204,   121,   206,    -1,   209,   122,   281,
      -1,   207,    -1,   209,    -1,   282,    -1,   288,    -1,   287,
      -1,   208,    -1,   246,   209,    -1,   123,   210,   124,    -1,
     281,    -1,   210,   125,   281,    -1,   285,   122,   201,   207,
     121,   204,    -1,   285,   122,   201,   207,    -1,   285,   122,
     201,   209,   121,   204,    -1,   214,    35,    -1,    37,    -1,
     289,    -1,   285,   122,    47,    -1,   285,   122,    48,    -1,
     285,   122,    46,    -1,   285,   122,   287,    -1,   285,   122,
     213,    -1,   285,   122,   215,    -1,   285,   122,   201,   209,
      -1,   285,   122,   289,   209,    -1,   285,   122,    49,   209,
      -1,   285,   292,   281,    -1,   285,    72,    47,    -1,   285,
      72,    48,    -1,   285,    73,    47,    -1,   285,    73,    48,
      -1,   285,    72,   285,    -1,   285,    73,   285,    -1,   285,
     122,   290,   281,    -1,   285,   122,   285,   291,   281,    -1,
     289,   209,   122,   281,    -1,    49,   209,   122,   281,    -1,
      47,   291,   285,    -1,    48,   291,   285,    -1,    46,   291,
     285,    -1,    46,   291,    46,    -1,    47,   291,    47,    -1,
      48,   291,    48,    -1,    47,   291,    48,    -1,    48,   291,
      47,    -1,   217,    35,    -1,   220,    44,    37,    45,   288,
      -1,   220,    44,    38,    45,   288,    -1,   220,    44,    39,
      45,   288,    -1,   220,    44,    40,    45,   288,    -1,   220,
      44,    41,    45,   288,    -1,   220,    44,    42,    45,   288,
      -1,   220,    44,    43,    45,   288,    -1,   220,    44,    45,
      45,   288,    -1,   220,    44,    44,    45,   288,    -1,   220,
     282,   221,   288,    -1,   220,    44,    49,   221,   288,    -1,
     220,    37,   221,   288,    -1,   220,   287,   221,   288,    -1,
     220,    38,   221,   288,    -1,   220,    39,   221,   288,    -1,
     220,    40,   221,   288,    -1,   220,    41,   221,   288,    -1,
     220,    42,   221,   288,    -1,   220,    43,   221,   288,    -1,
     220,    45,    45,   288,    -1,   220,    45,   121,   288,    -1,
     220,    44,    45,   288,    -1,   220,    44,   121,   288,    -1,
     220,   218,    45,   288,    -1,   285,   283,   281,    -1,    47,
     283,   285,    -1,    48,   283,   285,    -1,    46,   283,   285,
      -1,    47,   283,    47,    -1,    47,   283,    48,    -1,    48,
     283,    47,    -1,    48,   283,    48,    -1,    46,   283,    46,
      -1,    46,   283,   219,    -1,    47,   283,    46,    -1,    48,
     283,    46,    -1,    47,    -1,    48,    -1,    42,    -1,    43,
      -1,    45,    -1,   121,    -1,    45,   288,    35,    -1,    12,
     284,   224,    35,    -1,   225,    -1,   224,   121,   225,    -1,
     288,   226,    -1,    -1,    97,    -1,     9,    46,   121,   246,
      35,    -1,   229,    -1,   230,    -1,   239,    -1,    26,    35,
     231,   234,    35,   236,    27,    35,    -1,    -1,   232,    -1,
     233,    -1,   232,   233,    -1,    30,   262,    35,    -1,    29,
     244,   235,    -1,    32,   246,    -1,    14,   246,    35,    15,
     245,    -1,    -1,   121,   246,    -1,    -1,   237,    -1,   238,
      -1,   237,   238,    -1,    31,   250,    35,    -1,   223,    -1,
     240,    35,    -1,   247,   122,   241,    -1,   285,   122,   241,
      -1,   241,    -1,   243,    -1,   242,    -1,   246,   128,   245,
     257,    -1,   244,   257,    -1,   246,    -1,    46,    -1,   288,
      -1,    49,    -1,    51,    -1,    46,    -1,   288,    -1,    49,
      -1,   119,   248,   120,    -1,    -1,   249,    -1,   250,    -1,
     249,   121,   250,    -1,   285,   251,    -1,    -1,   251,   252,
      -1,   101,    -1,   102,    -1,    99,    -1,    98,   274,    -1,
     254,    -1,   255,    -1,   264,    -1,   256,    -1,   265,    -1,
      18,   257,    35,    -1,    33,   241,    35,    -1,    19,   257,
      35,    -1,   119,   258,   120,    -1,    -1,   259,    -1,   260,
      -1,   259,   121,   260,    -1,   262,    -1,   261,    -1,    46,
      54,   263,    -1,   263,   272,    -1,   281,    -1,    24,    35,
     269,    25,    35,    -1,    22,    35,   266,    23,    35,    -1,
      -1,   267,    -1,   268,    -1,   267,   268,    -1,    20,   262,
      35,    -1,    -1,   270,    -1,   271,    -1,   270,   271,    -1,
      21,   262,    35,    -1,    -1,   272,   273,    -1,   100,    -1,
      98,   274,    -1,    -1,   275,    -1,   119,    46,   120,    -1,
     277,    35,    -1,   278,    -1,   279,    -1,    17,   280,    -1,
      16,   280,    -1,    38,   288,   122,    47,    -1,    39,   288,
     122,    48,    -1,    41,   288,   122,    46,    -1,    46,   288,
     122,   282,    -1,   285,    -1,   282,    -1,    46,    -1,    47,
      -1,    48,    -1,    53,    -1,    55,    -1,    56,    -1,    57,
      -1,    58,    -1,    60,    -1,    59,    -1,    38,    -1,    39,
      -1,    40,    -1,    41,    -1,   286,    -1,   287,    -1,   288,
      -1,    49,    -1,    50,    -1,    52,    -1,    51,    -1,    37,
      -1,   289,    -1,    42,    -1,    43,    -1,    45,    -1,    38,
      -1,    39,    -1,    41,    -1,    40,    -1,    44,    -1,   129,
      -1,   130,    -1,   131,    -1,   132,    -1,   129,    -1,   133,
      -1,   134,    -1,   135,    -1,   136,    -1,   137,    -1,   131,
      -1,   138,    -1,    68,    -1,    61,    -1,    62,    -1,    63,
      -1,    65,    -1,    66,    -1,    64,    -1,    67,    -1,    56,
      -1,    58,    -1,    57,    -1,    60,    -1,    59,    -1,    55,
      -1,    74,    -1,    75,    -1,    76,    -1,    77,    -1,    80,
      -1,    78,    -1,    79,    -1,    81,    -1,    82,    -1,    70,
      -1,    71,    -1,    69,    -1,   294,   295,    -1,   142,    -1,
     296,    -1,   295,   296,    -1,   297,    -1,   163,    35,    -1,
     227,    -1,   159,    35,    -1,   145,    35,    -1,   186,    -1,
      36,   298,    -1,   299,   298,    -1,   301,    -1,   194,    -1,
     301,    -1,   300,   171,    36,    -1,   117,    -1,   201,   203,
      35,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   542,   542,   543,   548,   554,   555,   558,   559,   562,
     563,   564,   565,   566,   567,   568,   569,   570,   577,   578,
     581,   585,   591,   598,   599,   602,   603,   606,   610,   611,
     614,   615,   618,   621,   622,   625,   629,   640,   644,   646,
     650,   655,   659,   663,   668,   669,   673,   675,   679,   683,
     689,   693,   697,   698,   701,   702,   705,   707,   709,   711,
     713,   715,   717,   719,   721,   723,   725,   727,   729,   731,
     735,   736,   737,   740,   749,   750,   754,   758,   763,   764,
     768,   769,   770,   773,   780,   786,   787,   797,   799,   802,
     803,   804,   805,   806,   807,   808,   809,   810,   811,   812,
     813,   814,   815,   816,   822,   825,   830,   831,   836,   837,
     840,   842,   850,   858,   859,   861,   864,   870,   871,   880,
     881,   882,   883,   891,   895,   899,   908,   915,   922,   925,
     926,   929,   938,   945,   948,   949,   952,   953,   956,   992,
     994,  1001,  1003,  1008,  1010,  1014,  1037,  1041,  1043,  1052,
    1063,  1075,  1085,  1088,  1089,  1092,  1101,  1110,  1115,  1120,
    1141,  1146,  1187,  1205,  1212,  1217,  1228,  1239,  1250,  1261,
    1266,  1271,  1276,  1286,  1305,  1339,  1341,  1343,  1345,  1347,
    1349,  1351,  1353,  1358,  1367,  1369,  1371,  1373,  1375,  1377,
    1379,  1381,  1383,  1385,  1397,  1402,  1404,  1406,  1408,  1410,
    1412,  1414,  1416,  1418,  1420,  1422,  1424,  1426,  1457,  1483,
    1491,  1500,  1509,  1511,  1513,  1515,  1517,  1521,  1526,  1528,
    1533,  1534,  1537,  1538,  1541,  1542,  1545,  1553,  1557,  1559,
    1563,  1567,  1568,  1571,  1586,  1590,  1591,  1594,  1606,  1607,
    1611,  1613,  1617,  1621,  1623,  1625,  1631,  1632,  1637,  1638,
    1642,  1644,  1653,  1655,  1659,  1663,  1665,  1667,  1671,  1672,
    1675,  1695,  1702,  1704,  1714,  1731,  1733,  1735,  1739,  1748,
    1753,  1758,  1759,  1763,  1765,  1769,  1774,  1775,  1779,  1781,
    1783,  1785,  1795,  1799,  1800,  1801,  1802,  1805,  1810,  1821,
    1828,  1833,  1834,  1838,  1840,  1844,  1845,  1848,  1852,  1856,
    1860,  1869,  1879,  1880,  1885,  1887,  1892,  1897,  1898,  1902,
    1904,  1908,  1914,  1915,  1919,  1921,  1929,  1930,  1934,  1938,
    1941,  1942,  1945,  1949,  1953,  1955,  1957,  1959,  1967,  1968,
    1972,  1973,  1974,  1975,  1978,  1979,  1980,  1981,  1982,  1983,
    1986,  1987,  1988,  1989,  1997,  2000,  2001,  2012,  2013,  2014,
    2015,  2019,  2020,  2023,  2024,  2025,  2026,  2027,  2028,  2029,
    2030,  2033,  2034,  2035,  2038,  2039,  2040,  2041,  2042,  2043,
    2044,  2045,  2046,  2047,  2048,  2049,  2050,  2051,  2052,  2053,
    2054,  2055,  2056,  2057,  2058,  2059,  2060,  2066,  2067,  2068,
    2069,  2070,  2071,  2072,  2073,  2074,  2075,  2076,  2077,  2089,
    2097,  2101,  2102,  2105,  2106,  2107,  2108,  2109,  2110,  2113,
    2115,  2116,  2119,  2120,  2123,  2127,  2132
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
  "\"string constant\"", "\"integer constant\"", "\"number constant\"",
  "\"PMC register\"", "\"number register\"", "\"string register\"",
  "\"integer register\"", "\"constant-value\"", "\"=>\"", "\"!=\"",
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
  "sub_id", "sub_flags", "sub_flag", "multi_type", "parameter_list",
  "parameters", "parameter", "param", "param_flags", "param_flag",
  "invocant_param", "unique_reg_flag", "instructions", "instruction",
  "statement", "expansion_stat", "macro_expansion", "opt_macro_args",
  "macro_args", "macro_arg_list", "macro_arg", "braced_arg",
  "braced_contents", "braced_item", "empty_stat", "location_stat",
  "error_stat", "null_stat", "getresults_stat", "parrot_stat",
  "parrot_instruction", "parrot_op", "opt_op_args", "op_args",
  "parrot_op_args", "keylist_assignment", "op_arg", "op_arg_expr",
  "keyaccess", "keylist", "keys", "parrot_op_assign", "assignment_stat",
  "rhs_ident", "assignment", "binary_expr", "conditional_stat",
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
     365,   366,   367,   368,   369,   370,   371,   372,   373,    40,
      41,    44,    61,    91,    93,    59,   123,   125,    46,    45,
      33,   126,    43,    47,    42,    37,   124,    38,   374
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   139,   140,   140,   141,   142,   142,   143,   143,   144,
     144,   144,   144,   144,   144,   144,   144,   144,   145,   145,
     146,   147,   148,   149,   149,   150,   150,   151,   152,   152,
     153,   153,   154,   155,   155,   156,   157,   158,   159,   159,
     160,   161,   162,   163,   164,   164,   165,   165,   166,   167,
     168,   169,   170,   170,   171,   171,   172,   172,   172,   172,
     172,   172,   172,   172,   172,   172,   172,   172,   172,   172,
     173,   173,   173,   174,   175,   175,   176,   177,   178,   178,
     179,   179,   179,   180,   181,   182,   182,   183,   183,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   184,
     184,   184,   184,   184,   185,   186,   187,   187,   188,   188,
     189,   189,   190,   190,   190,   190,   191,   192,   192,   193,
     193,   193,   193,   194,   195,   196,   197,   198,   199,   200,
     200,   201,   202,   202,   203,   203,   204,   204,   205,   206,
     206,   207,   207,   207,   207,   208,   209,   210,   210,   211,
     211,   211,   212,   213,   213,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   215,   215,   215,   215,   215,
     215,   215,   215,   216,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,   218,
     219,   219,   220,   220,   221,   221,   222,   223,   224,   224,
     225,   226,   226,   227,   228,   229,   229,   230,   231,   231,
     232,   232,   233,   234,   234,   234,   235,   235,   236,   236,
     237,   237,   238,   238,   239,   240,   240,   240,   241,   241,
     242,   243,   244,   244,   245,   245,   245,   245,   246,   246,
     247,   248,   248,   249,   249,   250,   251,   251,   252,   252,
     252,   252,   253,   254,   254,   254,   254,   255,   255,   256,
     257,   258,   258,   259,   259,   260,   260,   261,   262,   263,
     264,   265,   266,   266,   267,   267,   268,   269,   269,   270,
     270,   271,   272,   272,   273,   273,   274,   274,   275,   276,
     277,   277,   278,   279,   280,   280,   280,   280,   281,   281,
     282,   282,   282,   282,   283,   283,   283,   283,   283,   283,
     284,   284,   284,   284,   285,   286,   286,   287,   287,   287,
     287,   288,   288,   289,   289,   289,   289,   289,   289,   289,
     289,   290,   290,   290,   291,   291,   291,   291,   291,   291,
     291,   291,   291,   291,   291,   291,   291,   291,   291,   291,
     291,   291,   291,   291,   291,   291,   291,   292,   292,   292,
     292,   292,   292,   292,   292,   292,   292,   292,   292,   293,
     294,   295,   295,   296,   296,   296,   296,   296,   296,   297,
     297,   297,   298,   298,   299,   300,   301
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     3,     0,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     7,     2,     0,     1,     1,     3,     1,     0,     1,
       1,     2,     2,     1,     1,     2,     3,     2,     2,     2,
       4,     2,     4,     4,     0,     1,     1,     3,     1,     6,
       1,     2,     1,     1,     0,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     2,     2,     2,     2,     2,
       1,     1,     1,     1,     0,     2,     4,     2,     0,     2,
       1,     1,     1,     4,     1,     0,     2,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     0,     3,     0,     1,
       1,     3,     1,     1,     2,     1,     3,     0,     2,     1,
       1,     1,     2,     1,     2,     2,     3,     3,     2,     2,
       1,     1,     1,     1,     0,     1,     1,     3,     3,     1,
       1,     1,     1,     1,     1,     2,     3,     1,     3,     6,
       4,     6,     2,     1,     1,     3,     3,     3,     3,     3,
       3,     4,     4,     4,     3,     3,     3,     3,     3,     3,
       3,     4,     5,     4,     4,     3,     3,     3,     3,     3,
       3,     3,     3,     2,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     4,     5,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       1,     1,     1,     1,     1,     1,     3,     4,     1,     3,
       2,     0,     1,     5,     1,     1,     1,     8,     0,     1,
       1,     2,     3,     3,     2,     5,     0,     2,     0,     1,
       1,     2,     3,     1,     2,     3,     3,     1,     1,     1,
       4,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     0,     1,     1,     3,     2,     0,     2,     1,     1,
       1,     2,     1,     1,     1,     1,     1,     3,     3,     3,
       3,     0,     1,     1,     3,     1,     1,     3,     2,     1,
       5,     5,     0,     1,     1,     2,     3,     0,     1,     1,
       2,     3,     0,     2,     1,     2,     0,     1,     3,     2,
       1,     1,     2,     2,     4,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       1,     1,     2,     1,     2,     1,     2,     2,     1,     2,
       2,     1,     1,     1,     3,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,     5,     5,     0,     6,   400,     3,     0,     2,     0,
       1,     0,     0,     0,     0,     0,   131,     0,     0,   106,
     415,     0,    18,    19,     0,     0,     0,   408,   134,   405,
     399,   401,   403,     0,    54,   411,     0,     0,     0,     0,
       0,     0,     5,     7,    17,    14,    15,    16,    12,    13,
      11,     9,    54,    10,     0,    38,    39,    44,   123,   412,
     409,   413,   351,   356,   357,   359,   358,   353,   354,   360,
     355,    22,   352,     0,   108,     0,   407,    23,   406,   404,
     330,   331,   332,   347,   348,   350,   349,   333,     0,     0,
     135,   136,   139,   144,   140,     0,   141,   143,   142,   402,
     410,     0,    41,     0,    37,    53,    51,    52,     0,     0,
       0,     0,   322,     0,     6,     4,     0,     0,    48,     0,
      45,    46,    20,   106,   112,   113,   117,     0,   109,   110,
     115,   105,     0,    24,    25,    27,   347,     0,   147,   329,
     328,   344,   345,   346,   416,     0,   145,   414,    57,    58,
      59,    56,   316,     0,   316,    60,    63,    61,    62,     0,
       0,     0,    55,     0,     0,     0,     0,     0,     0,     8,
      74,   269,     0,   268,    43,     0,   114,     0,   107,     0,
       0,     0,   146,     0,   137,     0,    65,   317,     0,    66,
      67,    68,    69,    42,     0,     0,     0,     0,    40,    85,
      73,   233,    47,   119,   106,   121,   120,   116,   118,   111,
      28,    26,   148,     0,     0,   324,   325,   326,   327,     0,
       0,    75,   122,     0,     0,     0,    29,    30,     0,    33,
      34,   318,    64,     0,    50,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   131,   353,   354,   360,   355,
     263,   347,   271,     0,    49,    86,    88,   102,   104,   100,
     101,   103,    99,    98,    89,     0,   134,   130,    97,     0,
      90,     0,     0,    91,    92,    93,    96,   234,   235,   236,
       0,   257,   259,   258,     0,   262,     0,    95,   282,   283,
     285,   284,   286,    94,     0,   320,   321,     0,   346,   352,
     340,   341,   342,   343,    78,     0,     0,    35,    21,    31,
      32,   125,     0,   323,   291,     0,     0,   302,   307,   238,
       0,     0,    87,     0,     0,     0,     0,   272,   273,   276,
     124,   128,   129,   132,   133,   140,   152,   183,   351,   356,
     357,   359,   358,   353,   354,   360,   355,   330,   331,   332,
       0,     0,     0,   345,   254,   261,     0,     0,   319,   398,
     396,   397,     0,     0,   387,   388,   389,   390,   392,   393,
     391,   394,   395,     0,     0,     0,     0,    77,    36,     0,
     228,   231,   330,     0,   292,   293,   296,   295,   312,   299,
     287,   289,     0,     0,   303,   304,     0,     0,   308,   309,
       0,     0,   239,   240,   127,   288,   126,   226,     0,   270,
       0,   275,     0,   224,   225,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   334,   335,   336,   337,   339,
     338,     0,     0,     0,     0,     0,     0,     0,   267,   265,
     266,     0,   264,   255,   165,   166,   169,   167,   168,   170,
     351,   157,   155,   156,   347,   361,   362,   363,     0,   159,
     160,   256,     0,   345,   352,     0,   164,     0,    76,    84,
     316,   280,   278,   279,     0,    79,    81,    82,    80,   227,
       0,   232,   230,     0,   290,     0,   298,     0,     0,   305,
       0,     0,   310,     0,     0,     0,     0,     0,   241,   174,
     274,   277,   138,   195,   197,   198,   199,   200,   201,   202,
       0,     0,     0,     0,     0,     0,     0,     0,   355,   205,
       0,   206,   203,   204,   216,   220,   221,   217,   211,   218,
     212,   213,   209,   219,   214,   215,   210,   207,   193,   208,
     196,   260,   386,   381,   383,   382,   385,   384,   374,   375,
     376,   379,   377,   378,   380,   373,   365,   371,   364,   366,
     367,   368,   369,   370,   372,     0,     0,     0,   163,   150,
     161,     0,   162,   171,   173,   281,     0,   229,   297,   294,
     316,   314,   313,   306,   301,   311,   300,   242,     0,   246,
     262,   244,   248,   184,   185,   186,   187,   188,   189,   190,
     192,   191,   194,   178,   177,   179,   181,   175,   182,   180,
     176,     0,     0,   172,    71,     0,    72,    70,   315,     0,
       0,   243,     0,   253,     0,   249,   250,   149,   151,    83,
       0,   247,     0,     0,   251,   245,   252,   237
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     3,     8,     5,    42,    43,    21,    22,    23,    24,
     132,   133,   134,   225,   226,   227,   228,   229,   230,    45,
      25,    47,    48,    49,    26,   119,   120,   121,    51,   254,
      52,   106,   101,   162,   625,   199,   200,   221,   304,   376,
     485,   486,   487,   219,   255,   256,   257,    27,    75,   127,
     128,   129,   130,   177,   208,    59,   260,   261,   262,   263,
     264,   265,    28,   332,    89,    90,   334,    91,    92,    93,
      94,   137,   267,   268,   469,   269,   470,   270,   271,   350,
     537,   272,   415,   273,   274,   379,   380,   492,    29,   276,
     277,   278,   401,   402,   403,   507,   631,   634,   635,   636,
     279,   280,   281,   282,   283,   284,   451,    95,   286,   326,
     327,   328,   411,   488,   287,   288,   289,   290,   315,   383,
     384,   385,   386,   387,   388,   291,   292,   393,   394,   395,
     397,   398,   399,   496,   592,   186,   187,   293,   294,    53,
     296,   112,   389,   139,   441,   305,   140,   141,   142,   143,
      72,   475,   575,   374,     6,     7,    30,    31,    32,    60,
      33,    34,    35
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -583
static const yytype_int16 yypact[] =
{
      83,    12,    12,    50,  -583,  -583,  -583,    15,  -583,    53,
    -583,    23,    42,    52,   -18,    47,  -583,   345,    64,    -6,
    -583,    82,  -583,  -583,     6,    92,   100,  -583,   533,  -583,
      15,  -583,  -583,    47,  -583,  -583,   114,   116,   119,   608,
      95,   123,   137,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,    56,  -583,  -583,   135,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,    87,     3,   170,  -583,   345,  -583,  -583,
    -583,  -583,  -583,    84,  -583,  -583,  -583,  -583,   752,   183,
     104,  -583,  -583,  -583,  -583,    98,  -583,  -583,   108,  -583,
    -583,   658,  -583,   107,  -583,  -583,  -583,  -583,   345,   345,
     345,   345,  -583,   112,    53,  -583,   589,   718,  -583,   124,
     125,  -583,  -583,    -6,  -583,  -583,  -583,   141,   148,  -583,
    -583,  -583,   164,   165,  -583,  -583,  -583,    99,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,   533,  -583,  -583,  -583,  -583,
    -583,  -583,   171,   172,   171,  -583,  -583,  -583,  -583,   171,
     171,   171,  -583,   246,   186,   187,   202,   203,   283,  -583,
    -583,  -583,   295,  -583,  -583,   135,  -583,   -16,  -583,     3,
     298,   345,  -583,   752,  -583,   288,  -583,  -583,   608,  -583,
    -583,  -583,  -583,  -583,   289,   290,   291,   106,  -583,  -583,
     333,  -583,  -583,  -583,    -6,  -583,  -583,  -583,  -583,  -583,
     131,  -583,  -583,   222,   223,  -583,  -583,  -583,  -583,   261,
     226,  -583,  -583,   226,   235,   240,   131,  -583,   311,  -583,
    -583,  -583,  -583,   312,  -583,   226,    95,   230,   230,   315,
     316,   317,   234,   437,   511,   646,   769,   792,   395,   345,
    -583,   -88,   395,   319,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,   320,   533,  -583,  -583,   322,
    -583,   323,   809,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
     324,  -583,  -583,  -583,   230,   232,   239,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,   327,  -583,  -583,   706,   -38,    98,
    -583,  -583,  -583,  -583,  -583,   345,   253,  -583,  -583,  -583,
    -583,  -583,   345,  -583,   826,   329,   331,   347,   352,   344,
     341,   342,  -583,   343,   360,   257,   285,   276,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,   284,  -583,  -583,   -13,   -13,
     -13,   -13,   -13,   -13,   -13,   214,   -12,   154,   154,   154,
     362,   -13,   154,   -13,  -583,  -583,   277,   437,  -583,  -583,
    -583,  -583,   891,   907,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,   145,   752,   286,    77,  -583,  -583,   -14,
    -583,   313,   355,   292,   293,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,   752,   388,   347,  -583,   752,   393,   352,  -583,
     752,    48,   344,  -583,  -583,  -583,  -583,  -583,   752,  -583,
     395,   118,   752,  -583,  -583,   345,   345,   345,   345,   345,
     345,   345,   374,   375,   376,   377,   378,   379,   381,   384,
     659,   -13,   345,   345,   345,  -583,  -583,  -583,  -583,  -583,
    -583,   843,   859,   875,   345,   345,   752,   345,  -583,  -583,
    -583,   230,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
     415,   576,   602,   602,   -88,  -583,  -583,  -583,   533,  -583,
    -583,  -583,   602,   396,   -20,   752,  -583,   752,  -583,  -583,
     171,  -583,  -583,  -583,   330,  -583,  -583,  -583,  -583,  -583,
     345,  -583,  -583,   752,  -583,   826,   -56,   413,   434,  -583,
     435,   436,  -583,   449,   718,   437,   718,   450,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
     345,   345,   345,   345,   345,   345,   345,   345,   345,  -583,
     345,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,   955,   923,   939,  -583,   351,
     369,   752,  -583,  -583,  -583,  -583,   105,  -583,  -583,  -583,
     171,  -583,  -583,  -583,  -583,  -583,  -583,  -583,   456,   371,
    -583,  -583,    18,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,   533,   533,  -583,  -583,   382,  -583,  -583,  -583,   479,
     718,  -583,   395,  -583,   468,    18,  -583,   104,   104,  -583,
     277,  -583,   461,   462,  -583,  -583,  -583,  -583
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -583,  -583,  -583,    25,  -583,   385,     7,  -583,  -583,  -583,
    -583,  -583,   334,  -583,  -583,   272,  -583,  -583,  -583,  -583,
      -4,  -583,  -583,  -583,     8,  -583,  -583,   326,  -583,  -583,
    -583,   328,   466,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -583,  -583,  -583,   270,  -583,  -196,  -105,  -583,
    -583,   340,  -583,  -583,  -583,  -190,  -583,  -583,  -583,  -583,
    -583,  -583,  -206,  -583,   258,  -340,  -583,   380,    58,  -583,
     -93,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,  -583,
    -583,  -583,  -268,  -583,  -582,  -583,    41,  -583,  -183,  -583,
    -583,  -583,  -583,  -583,   130,  -583,  -583,  -583,  -583,  -101,
    -583,  -583,  -233,  -583,  -583,    31,  -100,  -113,   299,  -583,
    -583,  -402,  -583,   132,  -583,  -583,  -583,  -583,  -229,  -583,
    -583,    63,  -583,  -192,    49,  -583,  -583,  -583,  -583,   151,
    -583,  -583,   149,  -583,  -583,  -148,   -22,  -583,  -583,  -176,
    -583,   332,   -81,   -27,  -106,  -189,  -207,  -583,   -25,   -17,
    -205,  -583,  -384,  -583,  -583,  -583,  -583,   529,  -583,   531,
    -583,  -583,    71
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -352
static const yytype_int16 yytable[] =
{
      71,    96,   146,    97,   172,    46,   189,   138,   510,   316,
     321,    98,   297,   266,   299,  -154,    44,    50,   176,   203,
     633,   489,   107,   258,    11,    12,    13,     9,    14,   259,
     235,  -269,   413,   433,   306,    88,   275,   297,   266,   299,
    -269,   323,   590,   295,   591,   329,   312,     4,   258,   632,
      10,    15,    16,   633,   259,   355,    36,    37,    38,    39,
     135,   275,   504,    12,    13,   352,    14,   115,   295,    54,
      40,   416,   417,   418,   419,   420,   421,   505,   576,   577,
     506,  -268,    58,   445,    16,   447,    61,    41,   581,    55,
    -268,   164,   165,   166,   167,   204,   205,   206,    56,   222,
     173,    73,   212,    88,    61,    57,   285,   490,   414,   434,
      46,   207,   478,    74,   123,   124,   125,    76,    96,    17,
      97,    44,    50,    18,   453,    77,    19,    78,    98,   126,
     285,   285,    20,   108,   109,    79,   110,   190,   191,   192,
     471,   111,    62,    63,    64,    65,    66,    67,    68,    69,
      70,   624,    80,    81,    82,   456,   459,    17,   325,    87,
     102,    18,   103,   530,   135,   104,   472,   468,   474,   113,
     218,   107,   114,   335,   479,   480,   481,   117,   482,   483,
     484,   118,   460,    63,    64,    65,    66,    67,    68,    69,
      70,   461,   462,   463,   464,    84,    85,    86,     1,     2,
     497,   122,   298,   329,   500,   131,   375,  -269,   503,   435,
     436,   437,   438,   439,   440,   253,   480,   481,   144,   482,
     483,    88,   551,   182,   183,   145,   173,   298,    88,   163,
     642,  -268,   324,   168,   538,   542,   546,   223,   224,    96,
     253,    97,   442,   443,   285,   351,   446,   353,   174,    98,
     175,   422,   423,   424,   425,   426,   427,   428,   429,   430,
     285,   178,   233,   431,   300,   301,   302,   303,   234,   179,
      11,    12,    13,   235,   465,   466,   467,   236,    40,   237,
     238,   637,   638,   239,   180,   240,   181,   241,   377,   242,
     185,   188,   193,   476,   243,   381,    58,   244,   245,    63,
      64,    65,    66,   246,   247,   248,   249,   250,   194,   195,
     251,    84,    85,    86,    62,    63,    64,    65,    66,    67,
      68,    69,    70,   448,   196,   197,   449,   509,   450,   198,
     201,   512,   585,   210,   213,   432,   215,   217,   216,   452,
     173,   220,   231,   232,   307,   308,   310,   311,   473,   314,
     317,   318,   319,   252,   330,   331,   298,   336,   337,   354,
     356,   357,   358,   378,   390,   549,   391,   392,   614,   617,
     620,   578,    19,   396,   400,   580,   404,   405,   406,   408,
     252,   582,    62,    63,    64,    65,    66,    67,    68,    69,
      70,   598,   600,   601,   583,   407,   584,   410,   513,   514,
     515,   516,   517,   518,   519,   409,   412,   444,   477,   493,
     491,   498,   494,   529,   495,   531,   532,   533,   501,   520,
     521,   522,   523,   524,   525,   329,   526,   547,   548,   527,
     550,  -158,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    96,   628,    97,   136,    84,    85,    86,   593,   586,
    -153,    98,  -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,
    -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,   594,
     595,   596,   621,   381,    62,    63,    64,    65,    66,    67,
      68,    69,    70,   250,   597,   602,   171,   173,   173,   173,
     622,   629,   630,   626,   640,   643,   646,   647,   309,   169,
     623,   202,   639,   603,   604,   605,   606,   607,   608,   609,
     610,   611,   233,   612,   322,   211,   214,   641,   116,   209,
      11,    12,    13,   235,   333,   184,   579,   236,    40,   237,
     238,   587,   508,   239,   644,   240,   599,   241,  -131,   242,
     645,   320,   588,   511,   243,   499,    58,   502,   245,    63,
      64,    65,    66,   246,   247,   248,   249,   250,   589,    99,
     251,    84,    85,    86,   100,     0,     0,     0,   313,   627,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    80,
      81,    82,    83,    84,    85,    86,    87,     0,     0,     0,
       0,     0,     0,     0,    96,    96,    97,    97,     0,     0,
       0,     0,     0,     0,    98,    98,     0,     0,     0,     0,
       0,     0,     0,   173,     0,     0,     0,     0,     0,     0,
       0,     0,    19,   452,   170,     0,     0,     0,     0,     0,
     252,   552,   553,   554,   555,   556,   557,   558,   559,   560,
     561,   562,   563,   564,   565,    62,    63,    64,    65,    66,
      67,    68,    69,    70,   105,     0,    88,   552,   553,   554,
     555,   556,   557,   558,   559,   560,   561,   562,   563,   564,
     565,     0,   148,   149,   150,   151,   152,   153,   154,   155,
     156,   157,   158,   159,   160,   161,     0,     0,     0,     0,
       0,     0,     0,     0,   147,  -263,    62,    63,    64,    65,
      66,    67,    68,    69,   528,   566,     0,   567,   568,   569,
     570,   571,   572,   573,   574,  -351,  -351,  -351,  -351,  -351,
    -351,  -351,  -351,  -351,  -351,  -351,  -351,  -351,  -351,     0,
       0,   566,     0,   567,   568,   569,   570,   571,   572,   573,
     574,   148,   149,   150,   151,   152,   153,   154,   155,   156,
     157,   158,   159,   160,   161,    62,    63,    64,    65,    66,
      67,    68,    69,    70,     0,  -351,     0,   171,  -351,     0,
       0,     0,     0,     0,  -351,   359,   360,   361,   362,   363,
     364,   365,   366,   367,   368,   369,   370,   371,   372,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    80,    81,
      82,   136,    84,    85,    86,    87,  -222,  -222,  -222,  -222,
    -222,  -222,  -222,  -222,  -222,  -222,  -222,  -222,  -222,  -222,
    -222,  -222,  -222,     0,     0,     0,     0,     0,   373,  -223,
    -223,  -223,  -223,  -223,  -223,  -223,  -223,  -223,  -223,  -223,
    -223,  -223,  -223,  -223,  -223,  -223,   338,   339,   340,   341,
     342,   343,   344,   345,   346,   347,   348,   349,   136,    84,
      85,    86,    87,    62,    63,    64,    65,    66,    67,    68,
      69,    70,   382,    81,    82,   136,    84,    85,    86,    87,
      62,    63,    64,    65,    66,    67,    68,    69,    70,   534,
     535,   536,   136,    84,    85,    86,    62,    63,    64,    65,
      66,    67,    68,    69,    70,   539,   540,   541,   136,    84,
      85,    86,    62,    63,    64,    65,    66,    67,    68,    69,
      70,   543,   544,   545,   136,    84,    85,    86,    62,    63,
      64,    65,    66,    67,    68,    69,    70,     0,   454,   455,
     136,    84,    85,    86,    62,    63,    64,    65,    66,    67,
      68,    69,    70,     0,   457,   458,   136,    84,    85,    86,
      62,    63,    64,    65,    66,    67,    68,    69,    70,     0,
     615,   616,   136,    84,    85,    86,    62,    63,    64,    65,
      66,    67,    68,    69,    70,     0,   618,   619,   136,    84,
      85,    86,    62,    63,    64,    65,    66,    67,    68,    69,
      70,   613,     0,     0,   136,    84,    85,    86
};

static const yytype_int16 yycheck[] =
{
      17,    28,    95,    28,   117,     9,   154,    88,   410,   238,
     243,    28,   219,   219,   219,    35,     9,     9,   123,    35,
     602,    35,    39,   219,     9,    10,    11,     2,    13,   219,
      12,   119,    45,    45,   223,   123,   219,   244,   244,   244,
     128,   248,    98,   219,   100,   252,   235,    35,   244,    31,
       0,    36,    37,   635,   244,   284,     3,     4,     5,     6,
      77,   244,    14,    10,    11,   272,    13,    42,   244,    46,
      17,   339,   340,   341,   342,   343,   344,    29,   462,   463,
      32,   119,    35,   351,    37,   353,    15,    34,   472,    47,
     128,   108,   109,   110,   111,   111,   112,   113,    46,   204,
     117,    37,   183,   123,    33,   123,   219,   121,   121,   121,
     114,   127,    35,   119,   111,   112,   113,    35,   145,   104,
     145,   114,   114,   108,   357,   119,   111,    35,   145,   126,
     243,   244,   117,    38,    39,    35,    41,   159,   160,   161,
     373,    46,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    46,    47,    48,   362,   363,   104,   251,    53,
      46,   108,    46,   431,   181,    46,   373,   373,   373,    46,
     197,   188,    35,   266,    97,    98,    99,   121,   101,   102,
     103,    46,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,   115,   116,
     392,   114,   219,   410,   396,    35,   299,   123,   400,    55,
      56,    57,    58,    59,    60,   219,    98,    99,    35,   101,
     102,   123,   451,   124,   125,   121,   243,   244,   123,   122,
     632,   123,   249,   121,   441,   442,   443,   106,   107,   266,
     244,   266,   348,   349,   357,   272,   352,   272,   124,   266,
     125,    37,    38,    39,    40,    41,    42,    43,    44,    45,
     373,   120,     1,    49,    38,    39,    40,    41,     7,   121,
       9,    10,    11,    12,   129,   130,   131,    16,    17,    18,
      19,   621,   622,    22,   120,    24,   121,    26,   305,    28,
     119,   119,    46,   374,    33,   312,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,   122,   122,
      49,    50,    51,    52,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,   122,   122,    49,   408,    51,    46,
      35,   412,   480,    35,    46,   121,    47,    46,    48,   356,
     357,     8,   120,   120,   109,   105,    35,    35,   373,   119,
      35,    35,    35,   119,    35,    35,   373,    35,    35,    35,
     128,   122,    35,   110,    35,   446,    35,    20,   575,   576,
     577,   464,   111,    21,    30,   468,    35,    35,    35,   122,
     119,   474,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   504,   505,   506,   475,    35,   477,   121,   415,   416,
     417,   418,   419,   420,   421,   120,   122,    45,   122,    54,
      97,    23,   120,   430,   121,   432,   433,   434,    25,    45,
      45,    45,    45,    45,    45,   632,    45,   444,   445,    45,
     447,    35,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   468,   590,   468,    49,    50,    51,    52,    35,   119,
      35,   468,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    35,
      35,    35,   121,   490,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    35,    35,    49,   504,   505,   506,
     121,    35,   121,   586,    15,    27,    35,    35,   226,   114,
     581,   175,   120,   520,   521,   522,   523,   524,   525,   526,
     527,   528,     1,   530,   244,   181,   188,   630,    52,   179,
       9,    10,    11,    12,   266,   145,   468,    16,    17,    18,
      19,   490,   402,    22,   635,    24,   505,    26,   123,    28,
     640,   242,   493,   411,    33,   394,    35,   398,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,   495,    30,
      49,    50,    51,    52,    33,    -1,    -1,    -1,   236,   586,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    53,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   621,   622,   621,   622,    -1,    -1,
      -1,    -1,    -1,    -1,   621,   622,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   630,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   640,    35,    -1,    -1,    -1,    -1,    -1,
     119,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    -1,   123,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    -1,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    36,   119,    37,    38,    39,    40,
      41,    42,    43,    44,    45,   129,    -1,   131,   132,   133,
     134,   135,   136,   137,   138,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    -1,
      -1,   129,    -1,   131,   132,   133,   134,   135,   136,   137,
     138,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    -1,   119,    -1,    49,   122,    -1,
      -1,    -1,    -1,    -1,   128,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    -1,    -1,    -1,    -1,    -1,   122,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    53,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    -1,    47,    48,
      49,    50,    51,    52,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    -1,    47,    48,    49,    50,    51,    52,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    -1,
      47,    48,    49,    50,    51,    52,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    -1,    47,    48,    49,    50,
      51,    52,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    -1,    -1,    49,    50,    51,    52
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,   115,   116,   140,    35,   142,   293,   294,   141,   142,
       0,     9,    10,    11,    13,    36,    37,   104,   108,   111,
     117,   145,   146,   147,   148,   159,   163,   186,   201,   227,
     295,   296,   297,   299,   300,   301,     3,     4,     5,     6,
      17,    34,   143,   144,   145,   158,   159,   160,   161,   162,
     163,   167,   169,   278,    46,    47,    46,   123,    35,   194,
     298,   301,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   288,   289,    37,   119,   187,    35,   119,    35,    35,
      46,    47,    48,    49,    50,    51,    52,    53,   123,   203,
     204,   206,   207,   208,   209,   246,   282,   287,   288,   296,
     298,   171,    46,    46,    46,    46,   170,   288,    38,    39,
      41,    46,   280,    46,    35,   142,   171,   121,    46,   164,
     165,   166,   114,   111,   112,   113,   126,   188,   189,   190,
     191,    35,   149,   150,   151,   288,    49,   210,   281,   282,
     285,   286,   287,   288,    35,   121,   209,    36,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,   172,   122,   288,   288,   288,   288,   121,   144,
      35,    49,   246,   288,   124,   125,   187,   192,   120,   121,
     120,   121,   124,   125,   206,   119,   274,   275,   119,   274,
     275,   275,   275,    46,   122,   122,   122,   122,    46,   174,
     175,    35,   166,    35,   111,   112,   113,   127,   193,   190,
      35,   151,   281,    46,   170,    47,    48,    46,   282,   182,
       8,   176,   187,   106,   107,   152,   153,   154,   155,   156,
     157,   120,   120,     1,     7,    12,    16,    18,    19,    22,
      24,    26,    28,    33,    36,    37,    42,    43,    44,    45,
      46,    49,   119,   159,   168,   183,   184,   185,   186,   194,
     195,   196,   197,   198,   199,   200,   201,   211,   212,   214,
     216,   217,   220,   222,   223,   227,   228,   229,   230,   239,
     240,   241,   242,   243,   244,   246,   247,   253,   254,   255,
     256,   264,   265,   276,   277,   278,   279,   285,   288,   289,
      38,    39,    40,    41,   177,   284,   284,   109,   105,   154,
      35,    35,   284,   280,   119,   257,   257,    35,    35,    35,
     247,   241,   184,   285,   288,   209,   248,   249,   250,   285,
      35,    35,   202,   203,   205,   209,    35,    35,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
     218,   282,   285,   287,    35,   257,   128,   122,    35,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,   122,   292,   209,   178,   288,   110,   224,
     225,   288,    46,   258,   259,   260,   261,   262,   263,   281,
      35,    35,    20,   266,   267,   268,    21,   269,   270,   271,
      30,   231,   232,   233,    35,    35,    35,    35,   122,   120,
     121,   251,   122,    45,   121,   221,   221,   221,   221,   221,
     221,   221,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    49,   121,    45,   121,    55,    56,    57,    58,    59,
      60,   283,   283,   283,    45,   221,   283,   221,    46,    49,
      51,   245,   288,   241,    47,    48,   285,    47,    48,   285,
      37,    46,    47,    48,    49,   129,   130,   131,   201,   213,
     215,   241,   285,   287,   289,   290,   281,   122,    35,    97,
      98,    99,   101,   102,   103,   179,   180,   181,   252,    35,
     121,    97,   226,    54,   120,   121,   272,   262,    23,   268,
     262,    25,   271,   262,    14,    29,    32,   234,   233,   281,
     250,   252,   281,   288,   288,   288,   288,   288,   288,   288,
      45,    45,    45,    45,    45,    45,    45,    45,    45,   288,
     221,   288,   288,   288,    46,    47,    48,   219,   285,    46,
      47,    48,   285,    46,    47,    48,   285,   288,   288,   281,
     288,   257,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,   129,   131,   132,   133,
     134,   135,   136,   137,   138,   291,   291,   291,   209,   207,
     209,   291,   209,   281,   281,   274,   119,   225,   263,   260,
      98,   100,   273,    35,    35,    35,    35,    35,   246,   244,
     246,   246,    35,   288,   288,   288,   288,   288,   288,   288,
     288,   288,   288,    46,   285,    47,    48,   285,    47,    48,
     285,   121,   121,   281,    46,   173,   209,   288,   274,    35,
     121,   235,    31,   223,   236,   237,   238,   204,   204,   120,
      15,   246,   250,    27,   238,   245,    35,    35
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
#line 551 "pir.y"
    { fixup_global_labels(lexer); ;}
    break;

  case 20:
#line 582 "pir.y"
    { new_macro_const(lexer->macros, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval), yypirget_lineno(yyscanner)); ;}
    break;

  case 21:
#line 588 "pir.y"
    { /* fprintf(stderr, "macro body: [%s]\n", CURRENT_MACRO(lexer)->body);*/ ;}
    break;

  case 22:
#line 592 "pir.y"
    {
                          new_macro(lexer->macros, (yyvsp[(2) - (2)].sval), yypirget_lineno(yyscanner), TRUE,
                                    lexer->macro_size);
                        ;}
    break;

  case 27:
#line 607 "pir.y"
    { add_macro_param(CURRENT_MACRO(lexer), (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 35:
#line 626 "pir.y"
    { store_macro_string(CURRENT_MACRO(lexer), "%s\n", (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 36:
#line 630 "pir.y"
    {
                          store_macro_string(CURRENT_MACRO(lexer), ".local %s %s\n",
                                             pir_type_names[(yyvsp[(2) - (3)].ival)], (yyvsp[(3) - (3)].sval));
                        ;}
    break;

  case 37:
#line 641 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 38:
#line 645 "pir.y"
    { yypirset_lineno ((yyvsp[(2) - (2)].ival), yyscanner); ;}
    break;

  case 39:
#line 647 "pir.y"
    { lexer->filename = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 41:
#line 656 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 42:
#line 660 "pir.y"
    { set_hll_map(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 43:
#line 664 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 44:
#line 668 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 45:
#line 670 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 46:
#line 674 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 47:
#line 676 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 48:
#line 680 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 50:
#line 690 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 51:
#line 694 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 56:
#line 706 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 57:
#line 708 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 58:
#line 710 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 59:
#line 712 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 60:
#line 714 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 61:
#line 716 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 62:
#line 718 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 63:
#line 720 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 64:
#line 722 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 65:
#line 724 "pir.y"
    { set_sub_methodname(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 66:
#line 726 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 67:
#line 728 "pir.y"
    { set_sub_subid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 68:
#line 730 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 69:
#line 732 "pir.y"
    { set_sub_nsentry(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 73:
#line 741 "pir.y"
    {
                           /* if there are parameters, then emit a get_params instruction. */
                           if ((yyvsp[(1) - (1)].uval) > 0)
                               generate_parameters_instr(lexer, (yyvsp[(1) - (1)].uval));
                         ;}
    break;

  case 74:
#line 749 "pir.y"
    { (yyval.uval) = 0; ;}
    break;

  case 75:
#line 751 "pir.y"
    { ++(yyval.uval); /* count number of parameters */ ;}
    break;

  case 76:
#line 755 "pir.y"
    { set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 77:
#line 759 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 78:
#line 763 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 79:
#line 765 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 83:
#line 774 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT;
                           /* XXX handle multi_type */

                         ;}
    break;

  case 84:
#line 781 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 86:
#line 788 "pir.y"
    {
                         ++lexer->stmt_counter;
                         /* increment the logical statement counter; a statement can be
                          * multiple lines, but each statement has its own ID for the
                          * linear scan register allocator.
                          */
                        ;}
    break;

  case 87:
#line 798 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 105:
#line 826 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (3)].mval), (yyvsp[(2) - (3)].pval)); ;}
    break;

  case 106:
#line 830 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 107:
#line 832 "pir.y"
    { (yyval.pval) = (yyvsp[(2) - (3)].pval); ;}
    break;

  case 108:
#line 836 "pir.y"
    { (yyval.pval) = NULL; ;}
    break;

  case 110:
#line 841 "pir.y"
    { (yyval.pval) = new_macro_param((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 111:
#line 843 "pir.y"
    {
                          macro_param *param = new_macro_param((yyvsp[(3) - (3)].sval));
                          param->next = (yyvsp[(1) - (3)].pval);
                          (yyval.pval) = param;
                        ;}
    break;

  case 112:
#line 851 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym == NULL) {
                              yypirerror(yyscanner, lexer, "macro argument '%s' is not a "
                                                           "declared identifier", (yyvsp[(1) - (1)].sval));
                          }
                        ;}
    break;

  case 114:
#line 860 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 116:
#line 865 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 117:
#line 870 "pir.y"
    { (yyval.sval) = ""; ;}
    break;

  case 118:
#line 872 "pir.y"
    { /* XXX cleanup memory stuff */
                          char *newbuff = (char *)mem_sys_allocate((strlen((yyvsp[(1) - (2)].sval)) + strlen((yyvsp[(2) - (2)].sval)) + 2)
                                                                   * sizeof (char));
                          sprintf(newbuff, "%s %s", (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval));
                          (yyval.sval) = newbuff;
                        ;}
    break;

  case 122:
#line 884 "pir.y"
    { (yyval.sval) = expand_macro(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].pval)); ;}
    break;

  case 123:
#line 892 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 125:
#line 900 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         ;}
    break;

  case 126:
#line 909 "pir.y"
    {
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 127:
#line 916 "pir.y"
    {
                           set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 131:
#line 930 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 132:
#line 939 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(yyscanner))
                              do_strength_reduction(yyscanner);
                        ;}
    break;

  case 138:
#line 957 "pir.y"
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

                         get_opinfo(yyscanner);
                       ;}
    break;

  case 139:
#line 993 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 140:
#line 998 "pir.y"
    { push_operand(lexer, expr_from_key(lexer, (yyvsp[(1) - (1)].key))); ;}
    break;

  case 141:
#line 1002 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 142:
#line 1004 "pir.y"
    { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           (yyval.expr) = expr_from_ident(lexer, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 143:
#line 1009 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 144:
#line 1011 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 145:
#line 1015 "pir.y"
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

  case 146:
#line 1038 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 147:
#line 1042 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 148:
#line 1044 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 149:
#line 1053 "pir.y"
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

  case 150:
#line 1064 "pir.y"
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

  case 151:
#line 1076 "pir.y"
    { /* XXX create a PMC const for $4 */
                          unshift_operand(lexer, expr_from_key(lexer, (yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));
                          if (check_op_args_for_symbols(yyscanner))
                              check_first_arg_direction(yyscanner, (yyvsp[(3) - (6)].sval));
                              /* no strength reduction here */
                        ;}
    break;

  case 155:
#line 1093 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 156:
#line 1102 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                          get_opinfo(yyscanner);
                        ;}
    break;

  case 157:
#line 1111 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 158:
#line 1116 "pir.y"
    {
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 159:
#line 1121 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (3)].sval));
                          if (sym) {
                              target *rhs = target_from_symbol(lexer, sym);
                              if (!targets_equal((yyvsp[(1) - (3)].targ), rhs)) {
                                  set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), rhs);
                                  get_opinfo(yyscanner);
                              }
                          }
                          else { /* not a symbol */
                              if (is_parrot_op(lexer, (yyvsp[(3) - (3)].sval))) {
                                  set_instrf(lexer, (yyvsp[(3) - (3)].sval), "%T", (yyvsp[(1) - (3)].targ));
                                  get_opinfo(yyscanner);
                              }
                              else {
                                  yypirerror(yyscanner, lexer, "'%s' is neither a declared symbol "
                                             "nor a parrot opcode", (yyvsp[(3) - (3)].sval));
                              }
                          }
                        ;}
    break;

  case 160:
#line 1142 "pir.y"
    {
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ)));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 161:
#line 1147 "pir.y"
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
                              get_opinfo(yyscanner);
                          }
                        ;}
    break;

  case 162:
#line 1188 "pir.y"
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
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 163:
#line 1206 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 164:
#line 1213 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 165:
#line 1218 "pir.y"
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

  case 166:
#line 1229 "pir.y"
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

  case 167:
#line 1240 "pir.y"
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

  case 168:
#line 1251 "pir.y"
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

  case 169:
#line 1262 "pir.y"
    {
                          set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 170:
#line 1267 "pir.y"
    {
                          set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 171:
#line 1272 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 172:
#line 1277 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%E", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].expr));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%E", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].expr));

                          get_opinfo(yyscanner);
                          do_strength_reduction(yyscanner);
                        ;}
    break;

  case 173:
#line 1287 "pir.y"
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
                          get_opinfo(yyscanner);
                      ;}
    break;

  case 174:
#line 1306 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 175:
#line 1340 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 176:
#line 1342 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 177:
#line 1344 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 178:
#line 1346 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 179:
#line 1348 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 180:
#line 1350 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 181:
#line 1352 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 182:
#line 1354 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 183:
#line 1359 "pir.y"
    { get_opinfo(yyscanner); ;}
    break;

  case 184:
#line 1368 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 185:
#line 1370 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 186:
#line 1372 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 187:
#line 1374 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 188:
#line 1376 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 189:
#line 1378 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 190:
#line 1380 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 191:
#line 1382 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 192:
#line 1384 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 193:
#line 1386 "pir.y"
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

  case 194:
#line 1398 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (5)].ival)), (yyvsp[(5) - (5)].sval));
                        ;}
    break;

  case 195:
#line 1403 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 196:
#line 1405 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 197:
#line 1407 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 198:
#line 1409 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 199:
#line 1411 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 200:
#line 1413 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 201:
#line 1415 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 202:
#line 1417 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 203:
#line 1419 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 204:
#line 1421 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 205:
#line 1423 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 206:
#line 1425 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 207:
#line 1427 "pir.y"
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

  case 208:
#line 1458 "pir.y"
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

  case 209:
#line 1484 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%i", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].ival));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 210:
#line 1492 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%n", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].dval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 211:
#line 1501 "pir.y"
    {
                          if (((yyvsp[(0) - (3)].ival) != NEED_INVERT_OPNAME) && ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT))
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%s", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].sval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = COMPUTE_DURING_RUNTIME;
                        ;}
    break;

  case 212:
#line 1510 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 213:
#line 1512 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 214:
#line 1514 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 215:
#line 1516 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 216:
#line 1518 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 217:
#line 1522 "pir.y"
    {
                          yypirerror(yyscanner, lexer, "cannot compare string to %s",
                                     (yyvsp[(3) - (3)].ival) == INT_TYPE ? "integer" : "number");
                        ;}
    break;

  case 218:
#line 1527 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare integer to string"); ;}
    break;

  case 219:
#line 1529 "pir.y"
    { yypirerror(yyscanner, lexer, "cannot compare number to string"); ;}
    break;

  case 220:
#line 1533 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 221:
#line 1534 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 222:
#line 1537 "pir.y"
    { (yyval.ival) = DONT_INVERT_OPNAME; /* no need to invert */ ;}
    break;

  case 223:
#line 1538 "pir.y"
    { (yyval.ival) = NEED_INVERT_OPNAME; /* yes, invert opname */ ;}
    break;

  case 226:
#line 1546 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_op_labelflag(lexer, BIT(0)); /* bit 0 means: "1 << 0" */
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 227:
#line 1554 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 228:
#line 1558 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 229:
#line 1560 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 230:
#line 1564 "pir.y"
    { (yyval.symb) = new_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 231:
#line 1567 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 232:
#line 1568 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 233:
#line 1572 "pir.y"
    { /* if $4 is not a register, it must be a declared symbol */
                          if (!TEST_FLAG((yyvsp[(4) - (5)].targ)->flags, TARGET_FLAG_IS_REG)) {

                              if ((yyvsp[(4) - (5)].targ)->info->type != PMC_TYPE) /* a .lex must be a PMC */
                                  yypirerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                             (yyvsp[(4) - (5)].targ)->info->id.name);
                          }
                          set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                        ;}
    break;

  case 234:
#line 1587 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 237:
#line 1599 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              (yyval.invo) = set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 238:
#line 1606 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 239:
#line 1608 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 240:
#line 1612 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 241:
#line 1614 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 242:
#line 1618 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 243:
#line 1622 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 244:
#line 1624 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 245:
#line 1627 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].expr)); ;}
    break;

  case 246:
#line 1631 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 247:
#line 1633 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 248:
#line 1637 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 249:
#line 1639 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 250:
#line 1643 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 251:
#line 1645 "pir.y"
    {
                             if ((yyvsp[(2) - (2)].targ))
                                 (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ));
                             else
                                 (yyval.targ) = (yyvsp[(1) - (2)].targ)
                           ;}
    break;

  case 252:
#line 1654 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 253:
#line 1656 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 255:
#line 1664 "pir.y"
    { (yyval.invo) = set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 256:
#line 1666 "pir.y"
    { (yyval.invo) = set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 257:
#line 1668 "pir.y"
    {  (yyval.invo) = set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 260:
#line 1676 "pir.y"
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
                             set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                           ;}
    break;

  case 261:
#line 1696 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 262:
#line 1703 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 263:
#line 1705 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);
                           ;}
    break;

  case 264:
#line 1715 "pir.y"
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

  case 265:
#line 1732 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 266:
#line 1734 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 267:
#line 1736 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 268:
#line 1740 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                             if (sym == NULL)
                                 sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);

                             (yyval.targ) = target_from_symbol(lexer, sym);

                           ;}
    break;

  case 269:
#line 1749 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 270:
#line 1754 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 271:
#line 1758 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 272:
#line 1760 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 273:
#line 1764 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 274:
#line 1766 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 275:
#line 1770 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 276:
#line 1774 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 277:
#line 1776 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 278:
#line 1780 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 279:
#line 1782 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 280:
#line 1784 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 281:
#line 1786 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 282:
#line 1796 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 287:
#line 1806 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 288:
#line 1811 "pir.y"
    { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              (yyval.invo) = (yyvsp[(2) - (3)].invo);
                            ;}
    break;

  case 289:
#line 1822 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 290:
#line 1829 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 291:
#line 1833 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 292:
#line 1835 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 293:
#line 1839 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 294:
#line 1841 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 297:
#line 1849 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 298:
#line 1853 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 299:
#line 1857 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument(lexer, (yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 300:
#line 1863 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 301:
#line 1872 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 302:
#line 1879 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 303:
#line 1881 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 304:
#line 1886 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 305:
#line 1888 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 306:
#line 1893 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 307:
#line 1897 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 308:
#line 1899 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 309:
#line 1903 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 310:
#line 1905 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 311:
#line 1909 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 312:
#line 1914 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 313:
#line 1916 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 314:
#line 1920 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 315:
#line 1922 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 316:
#line 1929 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 317:
#line 1931 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 318:
#line 1935 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 322:
#line 1946 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 323:
#line 1950 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 324:
#line 1954 "pir.y"
    { (yyval.cval) = new_named_const(lexer, INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 325:
#line 1956 "pir.y"
    { (yyval.cval) = new_named_const(lexer, NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 326:
#line 1958 "pir.y"
    { (yyval.cval) = new_named_const(lexer, STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 327:
#line 1960 "pir.y"
    { (yyval.cval) = new_pmc_const((yyvsp[(1) - (4)].sval), (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].cval)); ;}
    break;

  case 328:
#line 1967 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 329:
#line 1968 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 330:
#line 1972 "pir.y"
    { (yyval.cval) = new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 331:
#line 1973 "pir.y"
    { (yyval.cval) = new_const(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 332:
#line 1974 "pir.y"
    { (yyval.cval) = new_const(lexer, NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 333:
#line 1975 "pir.y"
    { (yyval.cval) = (yyvsp[(1) - (1)].cval); ;}
    break;

  case 334:
#line 1978 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 335:
#line 1979 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 336:
#line 1980 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 337:
#line 1981 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 338:
#line 1982 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 339:
#line 1983 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 340:
#line 1986 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 341:
#line 1987 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 342:
#line 1988 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 343:
#line 1989 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 344:
#line 1997 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 346:
#line 2001 "pir.y"
    { /* a symbol must have been declared; check that at this point. */
                           symbol * sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                           if (sym == NULL) {
                               undeclared_symbol(yyscanner, lexer, (yyvsp[(1) - (1)].sval));
                               /* make sure sym is not NULL */
                               sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), UNKNOWN_TYPE);
                           }
                           (yyval.targ) = target_from_symbol(lexer, sym);
                         ;}
    break;

  case 347:
#line 2012 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 348:
#line 2013 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 349:
#line 2014 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 350:
#line 2015 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 353:
#line 2023 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 354:
#line 2024 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 355:
#line 2025 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 356:
#line 2026 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 357:
#line 2027 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 358:
#line 2028 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 359:
#line 2029 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 360:
#line 2030 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 361:
#line 2033 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 362:
#line 2034 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 363:
#line 2035 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 364:
#line 2038 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 365:
#line 2039 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 366:
#line 2040 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 367:
#line 2041 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 368:
#line 2042 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 369:
#line 2043 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 370:
#line 2044 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 371:
#line 2045 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 372:
#line 2046 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 373:
#line 2047 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 374:
#line 2048 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 375:
#line 2049 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 376:
#line 2050 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 377:
#line 2051 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 378:
#line 2052 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 379:
#line 2053 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 380:
#line 2054 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 381:
#line 2055 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 382:
#line 2056 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 383:
#line 2057 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 384:
#line 2058 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 385:
#line 2059 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 386:
#line 2060 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 387:
#line 2066 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 388:
#line 2067 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 389:
#line 2068 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 390:
#line 2069 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 391:
#line 2070 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 392:
#line 2071 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 393:
#line 2072 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 394:
#line 2073 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 395:
#line 2074 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 396:
#line 2075 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 397:
#line 2076 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 398:
#line 2077 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 400:
#line 2098 "pir.y"
    { new_subr(lexer, "@start"); ;}
    break;

  case 409:
#line 2114 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 414:
#line 2124 "pir.y"
    { set_sub_name(lexer, (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 415:
#line 2128 "pir.y"
    { new_subr(lexer, NULL); ;}
    break;

  case 416:
#line 2133 "pir.y"
    {
                                  if (is_parrot_op(lexer, (yyvsp[(1) - (3)].sval)))
                                      get_opinfo(yyscanner);
                                  else /* not a parrot op */
                                      yypirerror(yyscanner, lexer, "'%s' is not a parrot op", (yyvsp[(1) - (3)].sval));

                                ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4626 "pirparser.c"
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


#line 2144 "pir.y"




/* the order of these letters match with the pir_type enumeration.
 * These are used for generating the full opname (set I0, 10 -> set_i_ic).
 */
static char const type_codes[5] = {'i', 's', 'p', 'n', '?'};


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
            *instr_writer++ = type_codes[iter->expr.t->info->type];

            if (iter->expr.t->key) {
                *instr_writer++ = '_';
                *instr_writer++ = 'k';

                /* XXX this switch replaces the messy code below. double-check before delete. */
                switch (iter->expr.t->key->expr->type) {
                    case EXPR_TARGET:
                        switch (iter->expr.t->key->expr->expr.t->info->type) {
                            case PMC_TYPE:
                                /* the key is a target, and its type is a PMC. In that
                                 * case, do not print the signature; 'kp' is not valid.
                                 */
                                break;
                            case INT_TYPE:
                                *instr_writer++ = 'i';
                                break;
                            default:
                                break;
                        }
                        break;
                    case EXPR_CONSTANT:
                        *instr_writer++ = 'c';
                        break;
                    default:
                        /* XXX does this ever happen? */
                        fprintf(stderr, "write_signature: non-constant key\n");
                        instr_writer = write_signature(iter->expr.t->key->expr, instr_writer);
                        break;
                }


                /*
                if ((iter->expr.t->key->expr->type == EXPR_TARGET)
                &&  (iter->expr.t->key->expr->expr.t->info->type == PMC_TYPE)) {

                }
                else {
                    if ((iter->expr.t->key->expr->type == EXPR_TARGET)
                    &&  (iter->expr.t->key->expr->expr.t->info->type == INT_TYPE))
                    {
                       *instr_writer++ = 'i';
                    }
                    else

                    switch (iter->expr.t->key->expr->type) {
                        case EXPR_CONSTANT:
                            *instr_writer++ = 'c';
                            break;
                        default:
                            fprintf(stderr, "write_signature: non-constant key\n");
                            instr_writer = write_signature(iter->expr.t->key->expr, instr_writer);
                            break;
                    }
                }*/

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
                /* operand->expr.t->s.sym = sym;  */ /* target's pointer set to symbol */
                operand->expr.t->info  = &sym->info;
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
                    undeclared_symbol(yyscanner, lexer, iter->expr.id);
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
undeclared_symbol(yyscan_t yyscanner, lexer_state * const lexer, char * const symbol)>

Report an error message saying that C<symbol> was not declared. Then test
whether the symbol is perhaps a PASM register identifier. The user may have
mistakenly tried to use a PASM register in PIR mode.

=cut

*/
static void
undeclared_symbol(yyscan_t yyscanner, lexer_state * const lexer, char const * const symbol) {
    yypirerror(yyscanner, lexer, "symbol '%s' not declared", symbol);

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


