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
     TK_LABEL = 288,
     TK_IDENT = 289,
     TK_INT = 290,
     TK_NUM = 291,
     TK_PMC = 292,
     TK_STRING = 293,
     TK_IF = 294,
     TK_UNLESS = 295,
     TK_NULL = 296,
     TK_GOTO = 297,
     TK_STRINGC = 298,
     TK_INTC = 299,
     TK_NUMC = 300,
     TK_PREG = 301,
     TK_NREG = 302,
     TK_SREG = 303,
     TK_IREG = 304,
     TK_ARROW = 305,
     TK_NE = 306,
     TK_EQ = 307,
     TK_LT = 308,
     TK_LE = 309,
     TK_GT = 310,
     TK_GE = 311,
     TK_USHIFT = 312,
     TK_RSHIFT = 313,
     TK_LSHIFT = 314,
     TK_FDIV = 315,
     TK_OR = 316,
     TK_AND = 317,
     TK_XOR = 318,
     TK_CONC = 319,
     TK_ASSIGN_USHIFT = 320,
     TK_ASSIGN_RSHIFT = 321,
     TK_ASSIGN_LSHIFT = 322,
     TK_ASSIGN_INC = 323,
     TK_ASSIGN_DEC = 324,
     TK_ASSIGN_MUL = 325,
     TK_ASSIGN_MOD = 326,
     TK_ASSIGN_POW = 327,
     TK_ASSIGN_DIV = 328,
     TK_ASSIGN_BOR = 329,
     TK_ASSIGN_BAND = 330,
     TK_ASSIGN_FDIV = 331,
     TK_ASSIGN_BNOT = 332,
     TK_ASSIGN_CONC = 333,
     TK_FLAG_INIT = 334,
     TK_FLAG_LOAD = 335,
     TK_FLAG_MAIN = 336,
     TK_FLAG_ANON = 337,
     TK_FLAG_METHOD = 338,
     TK_FLAG_OUTER = 339,
     TK_FLAG_VTABLE = 340,
     TK_FLAG_LEX = 341,
     TK_FLAG_MULTI = 342,
     TK_FLAG_POSTCOMP = 343,
     TK_FLAG_IMMEDIATE = 344,
     TK_FLAG_LEXID = 345,
     TK_INSTANCEOF = 346,
     TK_FLAG_UNIQUE_REG = 347,
     TK_FLAG_NAMED = 348,
     TK_FLAG_SLURPY = 349,
     TK_FLAG_FLAT = 350,
     TK_FLAG_OPTIONAL = 351,
     TK_FLAG_OPT_FLAG = 352,
     TK_FLAG_INVOCANT = 353
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
#define TK_LABEL 288
#define TK_IDENT 289
#define TK_INT 290
#define TK_NUM 291
#define TK_PMC 292
#define TK_STRING 293
#define TK_IF 294
#define TK_UNLESS 295
#define TK_NULL 296
#define TK_GOTO 297
#define TK_STRINGC 298
#define TK_INTC 299
#define TK_NUMC 300
#define TK_PREG 301
#define TK_NREG 302
#define TK_SREG 303
#define TK_IREG 304
#define TK_ARROW 305
#define TK_NE 306
#define TK_EQ 307
#define TK_LT 308
#define TK_LE 309
#define TK_GT 310
#define TK_GE 311
#define TK_USHIFT 312
#define TK_RSHIFT 313
#define TK_LSHIFT 314
#define TK_FDIV 315
#define TK_OR 316
#define TK_AND 317
#define TK_XOR 318
#define TK_CONC 319
#define TK_ASSIGN_USHIFT 320
#define TK_ASSIGN_RSHIFT 321
#define TK_ASSIGN_LSHIFT 322
#define TK_ASSIGN_INC 323
#define TK_ASSIGN_DEC 324
#define TK_ASSIGN_MUL 325
#define TK_ASSIGN_MOD 326
#define TK_ASSIGN_POW 327
#define TK_ASSIGN_DIV 328
#define TK_ASSIGN_BOR 329
#define TK_ASSIGN_BAND 330
#define TK_ASSIGN_FDIV 331
#define TK_ASSIGN_BNOT 332
#define TK_ASSIGN_CONC 333
#define TK_FLAG_INIT 334
#define TK_FLAG_LOAD 335
#define TK_FLAG_MAIN 336
#define TK_FLAG_ANON 337
#define TK_FLAG_METHOD 338
#define TK_FLAG_OUTER 339
#define TK_FLAG_VTABLE 340
#define TK_FLAG_LEX 341
#define TK_FLAG_MULTI 342
#define TK_FLAG_POSTCOMP 343
#define TK_FLAG_IMMEDIATE 344
#define TK_FLAG_LEXID 345
#define TK_INSTANCEOF 346
#define TK_FLAG_UNIQUE_REG 347
#define TK_FLAG_NAMED 348
#define TK_FLAG_SLURPY 349
#define TK_FLAG_FLAT 350
#define TK_FLAG_OPTIONAL 351
#define TK_FLAG_OPT_FLAG 352
#define TK_FLAG_INVOCANT 353




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


/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

/* include "pirlexer.h" before "piryy.h" */
#include "pirlexer.h"
#include "piryy.h"

/* declare yylex(); do this I<after> including "pirlexer.h" */
extern YY_DECL;



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




/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
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
#line 212 "pir.y"
{
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
/* Line 187 of yacc.c.  */
#line 514 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 527 "pirparser.c"

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
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   863

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  117
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  124
/* YYNRULES -- Number of rules.  */
#define YYNRULES  333
/* YYNRULES -- Number of states.  */
#define YYNSTATES  521

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   354

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   108,     2,     2,     2,   113,   115,     2,
     103,   104,   112,   110,   105,   107,   106,   111,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   102,
       2,    99,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   100,     2,   101,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   114,     2,   109,     2,     2,     2,
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
      95,    96,    97,    98,   116
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    31,    34,    39,    44,    45,    47,
      49,    53,    55,    62,    64,    67,    69,    71,    72,    75,
      77,    79,    81,    83,    85,    87,    89,    91,    93,    98,
     101,   104,   107,   109,   111,   113,   115,   116,   119,   124,
     127,   128,   131,   133,   135,   137,   142,   144,   145,   148,
     151,   153,   155,   157,   159,   161,   163,   165,   167,   169,
     171,   173,   175,   177,   179,   181,   184,   188,   192,   195,
     198,   200,   202,   204,   205,   207,   209,   213,   217,   219,
     221,   223,   226,   230,   232,   236,   239,   243,   247,   251,
     255,   259,   266,   271,   276,   283,   288,   293,   297,   301,
     305,   309,   313,   317,   321,   326,   332,   337,   342,   346,
     350,   354,   358,   362,   366,   370,   374,   377,   383,   389,
     395,   401,   407,   413,   419,   425,   431,   436,   441,   446,
     451,   456,   461,   466,   471,   476,   481,   486,   491,   496,
     500,   504,   508,   512,   516,   520,   524,   528,   532,   534,
     536,   538,   540,   544,   549,   551,   555,   558,   560,   561,
     563,   569,   571,   573,   575,   584,   585,   587,   589,   592,
     596,   600,   603,   609,   610,   613,   614,   616,   618,   621,
     625,   627,   630,   634,   638,   640,   642,   644,   649,   652,
     654,   656,   658,   660,   662,   664,   666,   668,   672,   673,
     675,   677,   681,   684,   685,   688,   690,   692,   694,   697,
     699,   701,   703,   705,   707,   711,   715,   719,   723,   724,
     726,   728,   732,   734,   736,   740,   743,   745,   751,   757,
     758,   760,   762,   765,   769,   770,   772,   774,   777,   781,
     782,   785,   787,   790,   791,   793,   797,   800,   802,   804,
     807,   810,   815,   820,   825,   830,   832,   834,   836,   838,
     840,   842,   844,   846,   848,   850,   852,   854,   856,   858,
     860,   862,   864,   866,   868,   870,   872,   874,   876,   878,
     880,   882,   884,   886,   888,   890,   892,   894,   896,   898,
     900,   902,   904,   906,   908,   910,   912,   914,   916,   918,
     920,   922,   924,   926,   928,   930,   932,   934,   936,   938,
     940,   942,   944,   946,   948,   950,   952,   954,   956,   958,
     960,   962,   964,   966
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     118,     0,    -1,   119,   120,   119,    -1,    -1,     3,    -1,
     121,    -1,   120,     3,   121,    -1,   129,    -1,   227,    -1,
     125,    -1,   123,    -1,   124,    -1,   122,    -1,     6,    43,
      -1,     4,    43,    -1,     5,    43,    99,    43,    -1,    12,
     100,   126,   101,    -1,    -1,   127,    -1,   128,    -1,   127,
     102,   128,    -1,    43,    -1,   131,   133,     3,   136,   144,
     130,    -1,     8,    -1,     7,   132,    -1,   236,    -1,    43,
      -1,    -1,   133,   134,    -1,    82,    -1,    79,    -1,    80,
      -1,    81,    -1,    83,    -1,    86,    -1,    88,    -1,    89,
      -1,    87,    -1,    84,   103,   132,   104,    -1,    85,   223,
      -1,    90,   224,    -1,    91,   224,    -1,   236,    -1,    43,
      -1,   160,    -1,   137,    -1,    -1,   137,   138,    -1,     9,
     139,   140,     3,    -1,   233,   236,    -1,    -1,   140,   141,
      -1,   201,    -1,   142,    -1,   143,    -1,    98,   103,   135,
     104,    -1,    92,    -1,    -1,   144,   145,    -1,    33,   146,
      -1,   146,    -1,   165,    -1,   170,    -1,   171,    -1,   176,
      -1,   225,    -1,   202,    -1,   177,    -1,   162,    -1,   151,
      -1,   150,    -1,   149,    -1,   147,    -1,   148,    -1,     3,
      -1,     1,     3,    -1,    41,   234,     3,    -1,    27,   196,
       3,    -1,   152,     3,    -1,   153,   154,    -1,    34,    -1,
     155,    -1,   157,    -1,    -1,   156,    -1,   158,    -1,   156,
     105,   158,    -1,   160,    99,   230,    -1,   230,    -1,   160,
      -1,   159,    -1,   195,   160,    -1,   100,   161,   101,    -1,
     230,    -1,   161,   102,   230,    -1,   163,     3,    -1,   234,
      99,    44,    -1,   234,    99,    45,    -1,   234,    99,    43,
      -1,   234,    99,   164,    -1,   234,    99,   153,    -1,   234,
      99,   153,   230,   105,   156,    -1,   234,    99,   153,   230,
      -1,   234,    99,   153,   160,    -1,   234,    99,   153,   160,
     105,   156,    -1,   234,    99,   237,   160,    -1,   234,    99,
      46,   160,    -1,   234,   240,   230,    -1,   234,    68,    44,
      -1,   234,    68,    45,    -1,   234,    69,    44,    -1,   234,
      69,    45,    -1,   234,    68,   234,    -1,   234,    69,   234,
      -1,   234,    99,   238,   230,    -1,   234,    99,   234,   239,
     234,    -1,   237,   160,    99,   230,    -1,    46,   160,    99,
     230,    -1,    44,   239,   234,    -1,    45,   239,   234,    -1,
      43,   239,   234,    -1,    43,   239,    43,    -1,    44,   239,
      44,    -1,    45,   239,    45,    -1,    44,   239,    45,    -1,
      45,   239,    44,    -1,   166,     3,    -1,   168,    41,    34,
      42,   236,    -1,   168,    41,    35,    42,   236,    -1,   168,
      41,    36,    42,   236,    -1,   168,    41,    37,    42,   236,
      -1,   168,    41,    38,    42,   236,    -1,   168,    41,    39,
      42,   236,    -1,   168,    41,    40,    42,   236,    -1,   168,
      41,    42,    42,   236,    -1,   168,    41,    41,    42,   236,
      -1,   168,   231,   169,   236,    -1,   168,    34,   169,   236,
      -1,   168,    35,   169,   236,    -1,   168,    36,   169,   236,
      -1,   168,    37,   169,   236,    -1,   168,    38,   169,   236,
      -1,   168,    39,   169,   236,    -1,   168,    40,   169,   236,
      -1,   168,    42,    42,   236,    -1,   168,    42,   105,   236,
      -1,   168,    41,    42,   236,    -1,   168,    41,   105,   236,
      -1,   168,   167,    42,   236,    -1,   234,   232,   230,    -1,
      44,   232,   234,    -1,    45,   232,   234,    -1,    43,   232,
     234,    -1,    44,   232,    44,    -1,    44,   232,    45,    -1,
      45,   232,    44,    -1,    45,   232,    45,    -1,    43,   232,
      43,    -1,    39,    -1,    40,    -1,    42,    -1,   105,    -1,
      42,   236,     3,    -1,    11,   233,   172,     3,    -1,   173,
      -1,   172,   105,   173,    -1,   174,   175,    -1,   236,    -1,
      -1,    92,    -1,    10,    43,   105,   195,     3,    -1,   178,
      -1,   179,    -1,   188,    -1,    25,     3,   180,   183,     3,
     185,    26,     3,    -1,    -1,   181,    -1,   182,    -1,   181,
     182,    -1,    29,   211,     3,    -1,    28,   195,   184,    -1,
      31,   195,    -1,    13,   195,     3,    14,   194,    -1,    -1,
     105,   195,    -1,    -1,   186,    -1,   187,    -1,   186,   187,
      -1,    30,   199,     3,    -1,   171,    -1,   189,     3,    -1,
     196,    99,   190,    -1,   234,    99,   190,    -1,   190,    -1,
     192,    -1,   191,    -1,   195,   106,   194,   206,    -1,   193,
     206,    -1,   195,    -1,    43,    -1,   236,    -1,    46,    -1,
      48,    -1,    43,    -1,   236,    -1,    46,    -1,   103,   197,
     104,    -1,    -1,   198,    -1,   199,    -1,   198,   105,   199,
      -1,   234,   200,    -1,    -1,   200,   201,    -1,    96,    -1,
      97,    -1,    94,    -1,    93,   223,    -1,   203,    -1,   204,
      -1,   213,    -1,   205,    -1,   214,    -1,    17,   206,     3,
      -1,    32,   190,     3,    -1,    18,   206,     3,    -1,   103,
     207,   104,    -1,    -1,   208,    -1,   209,    -1,   208,   105,
     209,    -1,   211,    -1,   210,    -1,    43,    50,   212,    -1,
     212,   221,    -1,   230,    -1,    23,     3,   218,    24,     3,
      -1,    21,     3,   215,    22,     3,    -1,    -1,   216,    -1,
     217,    -1,   216,   217,    -1,    19,   211,     3,    -1,    -1,
     219,    -1,   220,    -1,   219,   220,    -1,    20,   211,     3,
      -1,    -1,   221,   222,    -1,    95,    -1,    93,   223,    -1,
      -1,   224,    -1,   103,    43,   104,    -1,   226,     3,    -1,
     227,    -1,   228,    -1,    16,   229,    -1,    15,   229,    -1,
      35,   236,    99,    44,    -1,    36,   236,    99,    45,    -1,
      38,   236,    99,    43,    -1,    37,   236,    99,    43,    -1,
     234,    -1,   231,    -1,    43,    -1,    44,    -1,    45,    -1,
      51,    -1,    52,    -1,    53,    -1,    54,    -1,    56,    -1,
      55,    -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,
     235,    -1,    46,    -1,    47,    -1,    49,    -1,    48,    -1,
     236,    -1,    34,    -1,   237,    -1,    39,    -1,    40,    -1,
      42,    -1,    35,    -1,    36,    -1,    38,    -1,    37,    -1,
      41,    -1,   107,    -1,   108,    -1,   109,    -1,   110,    -1,
     107,    -1,   111,    -1,   112,    -1,   113,    -1,   114,    -1,
     115,    -1,   109,    -1,   116,    -1,    64,    -1,    57,    -1,
      58,    -1,    59,    -1,    61,    -1,    62,    -1,    60,    -1,
      63,    -1,    52,    -1,    54,    -1,    53,    -1,    56,    -1,
      55,    -1,    51,    -1,    70,    -1,    71,    -1,    72,    -1,
      73,    -1,    76,    -1,    74,    -1,    75,    -1,    77,    -1,
      78,    -1,    66,    -1,    67,    -1,    65,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   463,   463,   468,   469,   472,   473,   476,   477,   478,
     479,   480,   481,   484,   490,   494,   498,   503,   504,   508,
     510,   514,   518,   524,   528,   532,   533,   536,   537,   540,
     542,   544,   546,   548,   550,   552,   554,   556,   558,   560,
     562,   564,   568,   569,   570,   573,   577,   578,   581,   585,
     590,   591,   595,   596,   597,   600,   604,   610,   611,   614,
     616,   619,   620,   621,   622,   623,   624,   625,   626,   627,
     628,   629,   630,   631,   635,   640,   650,   654,   658,   661,
     664,   673,   683,   686,   687,   690,   691,   694,   724,   726,
     728,   732,   762,   766,   768,   773,   776,   783,   790,   792,
     794,   808,   818,   827,   850,   855,   872,   878,   880,   889,
     898,   907,   916,   918,   920,   922,   929,   947,   980,   982,
     984,   986,   988,   990,   992,   994,   999,  1007,  1009,  1011,
    1013,  1015,  1017,  1019,  1021,  1023,  1025,  1037,  1039,  1041,
    1043,  1045,  1047,  1049,  1051,  1053,  1055,  1057,  1059,  1089,
    1094,  1099,  1104,  1109,  1111,  1113,  1115,  1117,  1121,  1122,
    1125,  1126,  1129,  1136,  1140,  1142,  1146,  1150,  1159,  1160,
    1163,  1182,  1186,  1187,  1190,  1203,  1204,  1208,  1210,  1214,
    1218,  1220,  1222,  1228,  1229,  1234,  1235,  1239,  1241,  1245,
    1247,  1251,  1255,  1259,  1263,  1269,  1270,  1273,  1293,  1300,
    1302,  1306,  1322,  1324,  1326,  1330,  1332,  1337,  1342,  1343,
    1347,  1349,  1353,  1358,  1359,  1363,  1365,  1367,  1369,  1379,
    1383,  1384,  1385,  1386,  1389,  1394,  1405,  1412,  1417,  1418,
    1422,  1424,  1428,  1429,  1432,  1436,  1440,  1444,  1453,  1463,
    1464,  1469,  1471,  1476,  1481,  1482,  1486,  1488,  1492,  1498,
    1499,  1503,  1505,  1513,  1514,  1518,  1522,  1525,  1526,  1529,
    1533,  1537,  1539,  1541,  1543,  1565,  1566,  1570,  1571,  1572,
    1575,  1576,  1577,  1578,  1579,  1580,  1583,  1584,  1585,  1586,
    1594,  1597,  1598,  1599,  1600,  1601,  1615,  1616,  1619,  1620,
    1621,  1622,  1623,  1624,  1625,  1626,  1629,  1630,  1631,  1634,
    1635,  1636,  1637,  1638,  1639,  1640,  1641,  1642,  1643,  1644,
    1645,  1646,  1647,  1648,  1649,  1650,  1651,  1652,  1653,  1654,
    1655,  1656,  1662,  1663,  1664,  1665,  1666,  1667,  1668,  1669,
    1670,  1671,  1672,  1673
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"\\n\"", "\".HLL\"", "\".HLL_map\"",
  "\".loadlib\"", "\".sub\"", "\".end\"", "\".param\"", "\".lex\"",
  "\".local\"", "\".namespace\"", "\".invocant\"", "\".meth_call\"",
  "\".globalconst\"", "\".const\"", "\".return\"", "\".yield\"",
  "\".set_yield\"", "\".set_return\"", "\".begin_yield\"",
  "\".end_yield\"", "\".begin_return\"", "\".end_return\"",
  "\".begin_call\"", "\".end_call\"", "\".get_results\"", "\".call\"",
  "\".set_arg\"", "\".get_result\"", "\".nci_call\"", "\".tailcall\"",
  "\"label\"", "\"identifier\"", "\"int\"", "\"num\"", "\"pmc\"",
  "\"string\"", "\"if\"", "\"unless\"", "\"null\"", "\"goto\"",
  "\"string constant\"", "\"integer constant\"", "\"number constant\"",
  "\"PMC register\"", "\"number register\"", "\"string register\"",
  "\"integer register\"", "\"=>\"", "\"!=\"", "\"==\"", "\"<\"", "\"<=\"",
  "\">\"", "\">=\"", "\">>>\"", "\">>\"", "\"<<\"", "\"//\"", "\"||\"",
  "\"&&\"", "\"~~\"", "\".\"", "\">>>=\"", "\">>=\"", "\"<<=\"", "\"+=\"",
  "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"", "\"/=\"", "\"|=\"", "\"&=\"",
  "\"//=\"", "\"~=\"", "\".=\"", "\":init\"", "\":load\"", "\":main\"",
  "\":anon\"", "\":method\"", "\":outer\"", "\":vtable\"", "\":lex\"",
  "\":multi\"", "\":postcomp\"", "\":immediate\"", "\":lexid\"",
  "\":instanceof\"", "\":unique_reg\"", "\":named\"", "\":slurpy\"",
  "\":flat\"", "\":optional\"", "\":opt_flag\"", "\":invocant\"", "'='",
  "'['", "']'", "';'", "'('", "')'", "','", "'.'", "'-'", "'!'", "'~'",
  "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"", "$accept", "TOP",
  "opt_nl", "pir_chunks", "pir_chunk", "loadlib", "hll_specifier",
  "hll_mapping", "namespace_decl", "opt_namespace", "namespace",
  "namespace_slice", "sub_def", "sub_end", "sub_head", "sub_id",
  "sub_flags", "sub_flag", "multi_type", "parameter_list", "parameters",
  "parameter", "param", "param_flags", "param_flag", "invocant_param",
  "unique_reg_flag", "instructions", "instruction", "statement",
  "empty_stat", "error_stat", "null_stat", "getresults_stat",
  "parrot_stat", "parrot_instruction", "parrot_op", "opt_op_args",
  "op_args", "parrot_op_args", "keylist_assignment", "op_arg", "keyaccess",
  "keylist", "keys", "assignment_stat", "assignment", "binary_expr",
  "conditional_stat", "conditional_instr", "condition", "if_unless",
  "then", "goto_stat", "local_decl", "local_id_list", "local_id",
  "local_var_name", "has_unique_reg", "lex_decl", "invocation_stat",
  "invocation", "long_invocation_stat", "opt_long_arguments",
  "long_arguments", "long_argument", "long_invocation", "opt_ret_cont",
  "opt_long_results", "long_results", "long_result",
  "short_invocation_stat", "short_invocation", "simple_invocation",
  "methodcall", "subcall", "sub", "method", "pmc_object",
  "opt_target_list", "opt_list", "target_list", "result_target",
  "target_flags", "target_flag", "return_stat", "return_instr",
  "short_return_stat", "short_yield_stat", "arguments",
  "opt_arguments_list", "arguments_list", "argument", "named_arg",
  "short_arg", "arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "expression", "constant", "rel_op", "type", "target",
  "symbol", "identifier", "keyword", "unop", "binop", "augmented_op", 0
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
     345,   346,   347,   348,   349,   350,   351,   352,   353,    61,
      91,    93,    59,    40,    41,    44,    46,    45,    33,   126,
      43,    47,    42,    37,   124,    38,   354
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   117,   118,   119,   119,   120,   120,   121,   121,   121,
     121,   121,   121,   122,   123,   124,   125,   126,   126,   127,
     127,   128,   129,   130,   131,   132,   132,   133,   133,   134,
     134,   134,   134,   134,   134,   134,   134,   134,   134,   134,
     134,   134,   135,   135,   135,   136,   137,   137,   138,   139,
     140,   140,   141,   141,   141,   142,   143,   144,   144,   145,
     145,   146,   146,   146,   146,   146,   146,   146,   146,   146,
     146,   146,   146,   146,   147,   148,   149,   150,   151,   152,
     153,   154,   154,   155,   155,   156,   156,   157,   158,   158,
     158,   159,   160,   161,   161,   162,   163,   163,   163,   163,
     163,   163,   163,   163,   163,   163,   163,   163,   163,   163,
     163,   163,   163,   163,   163,   163,   163,   163,   164,   164,
     164,   164,   164,   164,   164,   164,   165,   166,   166,   166,
     166,   166,   166,   166,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   166,   166,   166,   166,   166,   166,   167,
     167,   167,   167,   167,   167,   167,   167,   167,   168,   168,
     169,   169,   170,   171,   172,   172,   173,   174,   175,   175,
     176,   177,   178,   178,   179,   180,   180,   181,   181,   182,
     183,   183,   183,   184,   184,   185,   185,   186,   186,   187,
     187,   188,   189,   189,   189,   190,   190,   191,   192,   193,
     193,   194,   194,   194,   194,   195,   195,   196,   197,   197,
     198,   198,   199,   200,   200,   201,   201,   201,   201,   202,
     203,   203,   203,   203,   204,   204,   205,   206,   207,   207,
     208,   208,   209,   209,   210,   211,   212,   213,   214,   215,
     215,   216,   216,   217,   218,   218,   219,   219,   220,   221,
     221,   222,   222,   223,   223,   224,   225,   226,   226,   227,
     228,   229,   229,   229,   229,   230,   230,   231,   231,   231,
     232,   232,   232,   232,   232,   232,   233,   233,   233,   233,
     234,   235,   235,   235,   235,   235,   236,   236,   237,   237,
     237,   237,   237,   237,   237,   237,   238,   238,   238,   239,
     239,   239,   239,   239,   239,   239,   239,   239,   239,   239,
     239,   239,   239,   239,   239,   239,   239,   239,   239,   239,
     239,   239,   240,   240,   240,   240,   240,   240,   240,   240,
     240,   240,   240,   240
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     2,     2,     4,     4,     0,     1,     1,
       3,     1,     6,     1,     2,     1,     1,     0,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     2,
       2,     2,     1,     1,     1,     1,     0,     2,     4,     2,
       0,     2,     1,     1,     1,     4,     1,     0,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     2,     3,     3,     2,     2,
       1,     1,     1,     0,     1,     1,     3,     3,     1,     1,
       1,     2,     3,     1,     3,     2,     3,     3,     3,     3,
       3,     6,     4,     4,     6,     4,     4,     3,     3,     3,
       3,     3,     3,     3,     4,     5,     4,     4,     3,     3,
       3,     3,     3,     3,     3,     3,     2,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     1,     1,
       1,     1,     3,     4,     1,     3,     2,     1,     0,     1,
       5,     1,     1,     1,     8,     0,     1,     1,     2,     3,
       3,     2,     5,     0,     2,     0,     1,     1,     2,     3,
       1,     2,     3,     3,     1,     1,     1,     4,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     0,     1,
       1,     3,     2,     0,     2,     1,     1,     1,     2,     1,
       1,     1,     1,     1,     3,     3,     3,     3,     0,     1,
       1,     3,     1,     1,     3,     2,     1,     5,     5,     0,
       1,     1,     2,     3,     0,     1,     1,     2,     3,     0,
       2,     1,     2,     0,     1,     3,     2,     1,     1,     2,
       2,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     3,     5,    12,    10,    11,     9,     7,    27,     8,
      14,     0,    13,   286,   291,   292,   294,   293,   288,   289,
     295,   290,    26,    24,    25,   287,    17,     0,     0,     0,
       0,   259,     4,     2,     0,     0,    21,     0,    18,    19,
       0,     0,     0,     0,     6,    46,    30,    31,    32,    29,
      33,     0,   253,    34,    37,    35,    36,     0,     0,    28,
      15,    16,     0,     0,     0,     0,     0,    57,    45,     0,
       0,    39,   254,    40,    41,    20,   261,   262,   264,   263,
       0,     0,    47,     0,     0,     0,    74,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   286,
     288,   289,   295,   290,   200,   281,   282,   284,   283,   208,
      22,    58,    60,    72,    73,    71,    70,    69,     0,    83,
      68,     0,    61,     0,     0,    62,    63,    64,    67,   171,
     172,   173,     0,   194,   196,   195,     0,   199,     0,    66,
     219,   220,   222,   221,   223,    65,     0,   257,   258,     0,
     280,   285,   287,   276,   277,   278,   279,    50,     0,    38,
     255,    75,     0,     0,   260,   228,     0,     0,   239,   244,
     175,     0,   206,     0,   205,    59,   281,     0,   285,     0,
       0,     0,     0,   209,   210,   213,    78,   267,   268,   269,
     281,    79,    81,    84,    82,    85,    90,    89,     0,    88,
     266,   265,    95,   126,   286,   291,   292,   294,   293,   288,
     289,   295,   290,   267,   268,   269,     0,     0,     0,   191,
     198,     0,     0,   256,   333,   331,   332,     0,     0,   322,
     323,   324,   325,   327,   328,   326,   329,   330,     0,     0,
       0,     0,    49,     0,     0,   164,   168,   167,   267,     0,
     229,   230,   233,   232,   249,   236,   224,   226,     0,     0,
     240,   241,     0,     0,   245,   246,     0,     0,   176,   177,
      77,   225,    76,   162,     0,    93,     0,   207,     0,   212,
       0,     0,    91,   160,   161,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   270,   271,   272,   273,   275,   274,
       0,     0,     0,     0,     0,     0,   204,   202,   203,     0,
     201,   192,   108,   109,   112,   110,   111,   113,    98,    96,
      97,   281,   296,   297,   298,   100,    99,   193,     0,   287,
       0,   107,     0,    48,    56,   253,   217,   215,   216,     0,
      51,    53,    54,    52,     0,   163,     0,   169,   166,     0,
     227,     0,   235,     0,     0,   242,     0,     0,   247,     0,
       0,     0,     0,     0,   178,    92,     0,   117,   211,   214,
      86,    89,    87,   137,   138,   139,   140,   141,   142,   143,
       0,     0,     0,     0,     0,     0,     0,     0,   290,   146,
     147,   144,   145,   157,   152,   153,   154,   150,   155,   156,
     151,   148,   136,   149,   197,   321,   316,   318,   317,   320,
     319,   309,   310,   311,   314,   312,   313,   315,   308,   300,
     306,   299,   301,   302,   303,   304,   305,   307,     0,     0,
       0,   106,   103,   102,     0,   105,   114,   116,   218,     0,
     170,   165,   234,   231,   253,   251,   250,   243,   238,   248,
     237,   179,     0,   183,   181,   185,    94,   127,   128,   129,
     130,   131,   132,   133,   135,   134,   121,   120,   122,   124,
     118,   125,   123,   119,     0,     0,   115,    43,     0,    44,
      42,   252,     0,     0,   180,     0,   190,     0,   186,   187,
     104,   101,    55,     0,   184,     0,     0,   188,   182,   189,
     174
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    47,
      48,    49,    17,   120,    18,    33,    44,    69,   498,    77,
      78,    92,   167,   251,   360,   361,   362,    90,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   201,   202,   203,
     204,   205,   206,   391,   284,   130,   131,   346,   132,   133,
     226,   134,   295,   135,   136,   254,   255,   256,   368,   137,
     138,   139,   140,   277,   278,   279,   383,   504,   507,   508,
     509,   141,   142,   143,   144,   145,   146,   329,   147,   148,
     192,   193,   194,   289,   363,   149,   150,   151,   152,   176,
     259,   260,   261,   262,   263,   264,   153,   154,   269,   270,
     271,   273,   274,   275,   372,   466,    81,    82,   155,   156,
      19,   158,    41,   265,   210,   320,   168,   211,   160,   188,
      35,   350,   448,   249
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -462
static const yytype_int16 yypact[] =
{
       9,  -462,    44,   126,  -462,    22,    24,    27,   811,   -17,
      82,    95,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,
    -462,     2,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,    66,   272,   272,   272,
     272,  -462,   126,  -462,     6,    68,  -462,    34,    35,  -462,
      42,    60,    62,    64,  -462,  -462,  -462,  -462,  -462,  -462,
    -462,    40,    65,  -462,  -462,  -462,  -462,    65,    65,  -462,
    -462,  -462,    66,   123,   124,   127,   128,  -462,   163,   811,
     131,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,
     400,   118,  -462,    71,    72,   192,  -462,  -462,   153,   118,
      82,    96,    96,   194,   195,   197,    98,   785,   481,    15,
     577,   593,   769,   272,  -462,   -83,  -462,  -462,  -462,   769,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,   210,   283,
    -462,   211,  -462,   212,   609,  -462,  -462,  -462,  -462,  -462,
    -462,  -462,   213,  -462,  -462,  -462,    96,   111,   119,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,   217,  -462,  -462,   498,
    -462,   -34,   121,  -462,  -462,  -462,  -462,  -462,   272,  -462,
    -462,  -462,   117,   272,  -462,   625,   222,   223,   208,   209,
     201,   228,  -462,   230,  -462,  -462,  -462,   235,  -462,   238,
     641,   143,   139,   141,  -462,  -462,  -462,  -462,  -462,  -462,
     144,  -462,  -462,   154,  -462,  -462,  -462,   149,   121,  -462,
    -462,  -462,  -462,  -462,   -32,   -32,   -32,   -32,   -32,   -32,
     -32,   169,   -31,    94,    94,    94,   207,   -32,    94,  -462,
    -462,   435,   785,  -462,  -462,  -462,  -462,   657,   673,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,   145,   641,
     151,    10,  -462,   798,     5,  -462,   168,  -462,   231,   157,
     174,  -462,  -462,  -462,  -462,  -462,  -462,  -462,   641,   240,
     208,  -462,   641,   256,   209,  -462,   641,    12,   201,  -462,
    -462,  -462,  -462,  -462,    11,  -462,   641,  -462,   769,   -18,
     283,   641,  -462,  -462,  -462,   272,   272,   272,   272,   272,
     272,   272,   241,   242,   243,   244,   252,   253,   254,   255,
     821,   272,   272,   272,  -462,  -462,  -462,  -462,  -462,  -462,
     229,   689,   705,   272,   272,   641,  -462,  -462,  -462,    96,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,   480,   494,
     494,   -83,  -462,  -462,  -462,   302,  -462,  -462,   494,   121,
     641,  -462,   641,  -462,  -462,    65,  -462,  -462,  -462,   196,
    -462,  -462,  -462,  -462,   295,  -462,   272,  -462,  -462,   641,
    -462,   625,   -54,   297,   298,  -462,   330,   331,  -462,   332,
     798,   798,   798,   349,  -462,  -462,   641,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,
     272,   272,   272,   272,   272,   272,   272,   272,   272,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,   753,   721,
     737,  -462,   248,   249,   769,  -462,  -462,  -462,  -462,   425,
    -462,  -462,  -462,  -462,    65,  -462,  -462,  -462,  -462,  -462,
    -462,  -462,   352,   251,  -462,     4,  -462,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,   283,   283,  -462,  -462,   257,  -462,
    -462,  -462,   343,   798,  -462,   769,  -462,   333,     4,  -462,
     154,   154,  -462,   435,  -462,   357,   363,  -462,  -462,  -462,
    -462
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -462,  -462,   356,  -462,   327,  -462,  -462,  -462,  -462,  -462,
    -462,   303,  -462,  -462,  -462,   299,  -462,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,  -462,   268,
    -462,  -462,  -462,  -462,  -462,  -462,   129,  -462,  -462,  -355,
    -462,    97,  -462,   -94,  -462,  -462,  -462,  -462,  -462,  -462,
    -462,  -462,   -93,  -462,  -461,  -462,    14,  -462,  -462,  -462,
    -462,  -462,  -462,  -462,  -462,   106,  -462,  -462,  -462,  -462,
    -123,  -462,  -462,  -104,  -462,  -462,  -462,  -127,  -124,   282,
    -462,  -462,  -286,  -462,   100,  -462,  -462,  -462,  -462,  -101,
    -462,  -462,    19,  -462,  -230,    36,  -462,  -462,  -462,  -462,
     134,  -462,  -462,   132,  -462,  -462,  -348,    90,  -462,  -462,
     -71,  -462,   291,  -113,   273,  -144,   310,   -86,  -462,    -8,
     -84,  -462,  -312,  -462
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -207
static const yytype_int16 yytable[] =
{
      34,   177,   388,   183,   159,   208,   162,   458,   365,    55,
     293,   312,     1,   353,   506,    99,   209,   190,   -80,   157,
    -206,   191,   159,  -206,   162,   380,   187,   449,   450,    50,
      51,    52,    53,   195,   505,   207,   454,   157,   373,   464,
     381,   465,   376,   382,     4,   230,   379,   506,   228,   -80,
     -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,
     -80,   -80,   -80,   -80,   -80,    20,  -205,    21,   250,  -205,
      22,    34,  -205,   294,   313,   355,   356,   285,   357,   358,
     321,   322,   161,    36,   325,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    42,   184,
     161,    45,   354,   355,   356,   189,   357,   358,   359,    46,
     366,    70,   385,   386,   292,   -80,   501,    37,    38,    39,
      40,   161,   296,   297,   298,   299,   300,   301,   331,   364,
       5,     6,     7,     8,   324,    71,   351,    72,     9,   510,
     511,    73,    10,    79,   347,   314,   315,   316,   317,   318,
     319,   334,   337,   163,   164,   165,   166,    83,    84,    74,
     252,    75,   348,    76,   349,   257,   208,    86,    80,    87,
      88,    89,    91,   387,    94,   169,   170,   209,   392,   109,
      24,    25,    26,    27,    28,    29,    30,    31,   338,   339,
     340,   341,   116,   117,   118,   171,   172,   178,   179,   175,
     180,   119,   195,   302,   303,   304,   305,   306,   307,   308,
     309,   310,   423,   196,   212,   213,   229,   231,   232,   515,
     233,   190,   253,   330,   184,   266,   267,   268,   424,   272,
     276,   280,   453,   281,   414,   417,   420,   456,   282,   457,
     161,   283,   286,   287,  -206,   184,   288,   451,   291,   323,
     352,   452,   342,   343,   344,   455,   472,   473,   474,   290,
     367,   370,   374,    23,    24,    25,    26,    27,    28,    29,
      30,    31,   413,   476,   311,   186,   116,   117,   118,   371,
     377,   369,   161,   400,   401,   402,   403,   393,   394,   395,
     396,   397,   398,   399,   404,   405,   406,   407,   460,   459,
     467,   468,   409,   410,   411,   412,    23,    24,    25,    26,
      27,    28,    29,    30,    31,   421,   422,    23,    24,    25,
      26,    27,    28,    29,    30,    31,   197,   198,   199,   200,
     116,   117,   118,   469,   470,   471,    23,    24,    25,    26,
      27,    28,    29,    30,    31,   197,   198,   199,   186,   116,
     117,   118,   475,   494,   495,   502,   503,   513,   257,   516,
     519,   512,   487,   490,   493,   499,   520,    43,   496,    54,
     208,   208,   184,   184,   184,    85,   185,   345,    93,   514,
     461,   209,   209,   190,   384,   517,   518,   390,   181,   389,
     463,   174,   477,   478,   479,   480,   481,   482,   483,   484,
     485,    95,   190,    96,   375,   462,   378,   227,    97,   173,
      98,    99,     0,     0,     0,   100,    10,   101,   102,   195,
       0,   103,     0,   104,     0,   105,     0,   106,     0,     0,
       0,     0,   107,   108,   109,    24,    25,    26,    27,   110,
     111,   112,   113,   114,     0,     0,   115,   116,   117,   118,
       0,   500,     0,     0,     0,     0,     0,     0,     0,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   497,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   326,     0,
       0,   327,    95,   328,    96,     0,   161,   161,     0,     0,
       0,    98,    99,     0,     0,   184,   100,    10,   101,   102,
       0,     0,   103,   119,   104,   330,   105,     0,   106,     0,
       0,     0,     0,   107,     0,   109,    24,    25,    26,    27,
     110,   111,   112,   113,   114,   190,     0,   115,   116,   117,
     118,   425,   426,   427,   428,   429,   430,   431,   432,   433,
     434,   435,   436,   437,   438,   425,   426,   427,   428,   429,
     430,   431,   432,   433,   434,   435,   436,   437,   438,     0,
       0,     0,     0,   234,   235,   236,   237,   238,   239,   240,
     241,   242,   243,   244,   245,   246,   247,     0,     0,     0,
       0,     0,     0,  -200,   119,     0,     0,   439,     0,   440,
     441,   442,   443,   444,   445,   446,   447,   248,     0,     0,
       0,   439,     0,   440,   441,   442,   443,   444,   445,   446,
     447,  -158,  -158,  -158,  -158,  -158,  -158,  -158,  -158,  -158,
    -158,  -158,  -158,  -158,  -158,  -158,  -158,  -159,  -159,  -159,
    -159,  -159,  -159,  -159,  -159,  -159,  -159,  -159,  -159,  -159,
    -159,  -159,  -159,   214,   215,   216,   217,   218,   219,   220,
     221,   222,   223,   224,   225,   186,   116,   117,   118,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   258,   198,
     199,   186,   116,   117,   118,    23,    24,    25,    26,    27,
      28,    29,    30,    31,   197,   198,   199,   186,   116,   117,
     118,    23,    24,    25,    26,    27,    28,    29,    30,    31,
       0,   332,   333,   186,   116,   117,   118,    23,    24,    25,
      26,    27,    28,    29,    30,    31,     0,   335,   336,   186,
     116,   117,   118,    23,    24,    25,    26,    27,    28,    29,
      30,    31,     0,   415,   416,   186,   116,   117,   118,    23,
      24,    25,    26,    27,    28,    29,    30,    31,     0,   418,
     419,   186,   116,   117,   118,    23,    24,    25,    26,    27,
      28,    29,    30,    31,     0,   488,   489,   186,   116,   117,
     118,    23,    24,    25,    26,    27,    28,    29,    30,    31,
       0,   491,   492,   186,   116,   117,   118,    23,    24,    25,
      26,    27,    28,    29,    30,    31,   486,     0,     0,   186,
     116,   117,   118,    23,    24,    25,    26,    27,    28,    29,
      30,    31,     0,     0,     0,   186,   116,   117,   118,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   114,     0,
       0,   182,    23,    24,    25,    26,    27,    28,    29,    30,
      31,     0,     0,     0,   182,    23,    24,    25,    26,    27,
      28,    29,    30,    31,    32,    23,    24,    25,    26,    27,
      28,    29,    30,   408
};

static const yytype_int16 yycheck[] =
{
       8,   102,   288,   107,    90,   129,    90,   355,     3,     3,
      42,    42,     3,     3,   475,    11,   129,   100,     3,    90,
     103,   115,   108,   106,   108,    13,   112,   339,   340,    37,
      38,    39,    40,   119,    30,   129,   348,   108,   268,    93,
      28,    95,   272,    31,     0,   146,   276,   508,   134,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    43,   100,    43,   162,   103,
      43,    79,   106,   105,   105,    93,    94,   190,    96,    97,
     224,   225,    90,   100,   228,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    91,     3,   107,
     108,    99,    92,    93,    94,   113,    96,    97,    98,    43,
     105,    43,   101,   102,   208,   100,   464,    35,    36,    37,
      38,   129,   215,   216,   217,   218,   219,   220,   232,   253,
       4,     5,     6,     7,   227,   101,   249,   102,    12,   494,
     495,    99,    16,   103,   248,    51,    52,    53,    54,    55,
      56,   237,   238,    35,    36,    37,    38,    67,    68,    99,
     168,    99,   248,    99,   248,   173,   290,    44,   103,    45,
      43,    43,     9,   286,    43,   104,   104,   290,   291,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,     3,    43,     3,     3,   103,
       3,   103,   288,    34,    35,    36,    37,    38,    39,    40,
      41,    42,   325,     3,     3,     3,     3,   106,    99,   505,
       3,   100,   105,   231,   232,     3,     3,    19,   329,    20,
      29,     3,   345,     3,   320,   321,   322,   350,     3,   352,
     248,     3,    99,   104,   100,   253,   105,   341,    99,    42,
      99,   345,   107,   108,   109,   349,   380,   381,   382,   105,
      92,   104,    22,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,   386,   105,    46,    47,    48,    49,   105,
      24,    50,   290,    42,    42,    42,    42,   295,   296,   297,
     298,   299,   300,   301,    42,    42,    42,    42,     3,   103,
       3,     3,   310,   311,   312,   313,    34,    35,    36,    37,
      38,    39,    40,    41,    42,   323,   324,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,     3,     3,     3,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,     3,   105,   105,     3,   105,    14,   366,    26,
       3,   104,   448,   449,   450,   459,     3,    11,   454,    42,
     494,   495,   380,   381,   382,    72,   108,   248,    79,   503,
     366,   494,   495,   100,   278,   508,   513,   290,   106,   289,
     371,   100,   400,   401,   402,   403,   404,   405,   406,   407,
     408,     1,   100,     3,   270,   369,   274,   134,     8,    99,
      10,    11,    -1,    -1,    -1,    15,    16,    17,    18,   505,
      -1,    21,    -1,    23,    -1,    25,    -1,    27,    -1,    -1,
      -1,    -1,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    -1,    -1,    46,    47,    48,    49,
      -1,   459,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    -1,
      -1,    46,     1,    48,     3,    -1,   494,   495,    -1,    -1,
      -1,    10,    11,    -1,    -1,   503,    15,    16,    17,    18,
      -1,    -1,    21,   103,    23,   513,    25,    -1,    27,    -1,
      -1,    -1,    -1,    32,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,   100,    -1,    46,    47,    48,
      49,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    -1,
      -1,    -1,    -1,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   103,    -1,    -1,   107,    -1,   109,
     110,   111,   112,   113,   114,   115,   116,    99,    -1,    -1,
      -1,   107,    -1,   109,   110,   111,   112,   113,   114,   115,
     116,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      -1,    44,    45,    46,    47,    48,    49,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    -1,    44,    45,    46,
      47,    48,    49,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    -1,    44,    45,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    -1,    44,
      45,    46,    47,    48,    49,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    -1,    44,    45,    46,    47,    48,
      49,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      -1,    44,    45,    46,    47,    48,    49,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    -1,    -1,    46,
      47,    48,    49,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    -1,    -1,    -1,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    -1,
      -1,    46,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    -1,    -1,    -1,    46,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    34,    35,    36,    37,    38,
      39,    40,    41,    42
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,   118,   119,     0,     4,     5,     6,     7,    12,
      16,   120,   121,   122,   123,   124,   125,   129,   131,   227,
      43,    43,    43,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,   132,   236,   237,   100,    35,    36,    37,
      38,   229,     3,   119,   133,    99,    43,   126,   127,   128,
     236,   236,   236,   236,   121,     3,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,   134,
      43,   101,   102,    99,    99,    99,    99,   136,   137,   103,
     103,   223,   224,   224,   224,   128,    44,    45,    43,    43,
     144,     9,   138,   132,    43,     1,     3,     8,    10,    11,
      15,    17,    18,    21,    23,    25,    27,    32,    33,    34,
      39,    40,    41,    42,    43,    46,    47,    48,    49,   103,
     130,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     162,   163,   165,   166,   168,   170,   171,   176,   177,   178,
     179,   188,   189,   190,   191,   192,   193,   195,   196,   202,
     203,   204,   205,   213,   214,   225,   226,   227,   228,   234,
     235,   236,   237,    35,    36,    37,    38,   139,   233,   104,
     104,     3,    43,   233,   229,   103,   206,   206,     3,     3,
       3,   196,    46,   190,   236,   146,    46,   234,   236,   236,
     100,   160,   197,   198,   199,   234,     3,    43,    44,    45,
      46,   154,   155,   156,   157,   158,   159,   160,   195,   230,
     231,   234,     3,     3,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,   167,   231,   234,     3,
     206,   106,    99,     3,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    99,   240,
     160,   140,   236,   105,   172,   173,   174,   236,    43,   207,
     208,   209,   210,   211,   212,   230,     3,     3,    19,   215,
     216,   217,    20,   218,   219,   220,    29,   180,   181,   182,
       3,     3,     3,     3,   161,   230,    99,   104,   105,   200,
     105,    99,   160,    42,   105,   169,   169,   169,   169,   169,
     169,   169,    34,    35,    36,    37,    38,    39,    40,    41,
      42,   105,    42,   105,    51,    52,    53,    54,    55,    56,
     232,   232,   232,    42,   169,   232,    43,    46,    48,   194,
     236,   190,    44,    45,   234,    44,    45,   234,    43,    44,
      45,    46,   107,   108,   109,   153,   164,   190,   234,   237,
     238,   230,    99,     3,    92,    93,    94,    96,    97,    98,
     141,   142,   143,   201,   195,     3,   105,    92,   175,    50,
     104,   105,   221,   211,    22,   217,   211,    24,   220,   211,
      13,    28,    31,   183,   182,   101,   102,   230,   199,   201,
     158,   160,   230,   236,   236,   236,   236,   236,   236,   236,
      42,    42,    42,    42,    42,    42,    42,    42,    42,   236,
     236,   236,   236,    43,   234,    44,    45,   234,    44,    45,
     234,   236,   236,   230,   206,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,   107,
     109,   110,   111,   112,   113,   114,   115,   116,   239,   239,
     239,   160,   160,   230,   239,   160,   230,   230,   223,   103,
       3,   173,   212,   209,    93,    95,   222,     3,     3,     3,
       3,     3,   195,   195,   195,     3,   230,   236,   236,   236,
     236,   236,   236,   236,   236,   236,    43,   234,    44,    45,
     234,    44,    45,   234,   105,   105,   234,    43,   135,   160,
     236,   223,     3,   105,   184,    30,   171,   185,   186,   187,
     156,   156,   104,    14,   195,   199,    26,   187,   194,     3,
       3
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
        case 13:
#line 485 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 14:
#line 491 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 15:
#line 495 "pir.y"
    { set_hll_map(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 16:
#line 499 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 17:
#line 503 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 18:
#line 505 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 19:
#line 509 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 20:
#line 511 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 21:
#line 515 "pir.y"
    { (yyval.expr) = expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 23:
#line 525 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 24:
#line 529 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 29:
#line 541 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 30:
#line 543 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 31:
#line 545 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 32:
#line 547 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 33:
#line 549 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 34:
#line 551 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 35:
#line 553 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 36:
#line 555 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 37:
#line 557 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 38:
#line 559 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 39:
#line 561 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 563 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 41:
#line 565 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 45:
#line 574 "pir.y"
    { generate_get_params(lexer); ;}
    break;

  case 48:
#line 582 "pir.y"
    { set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 49:
#line 586 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 50:
#line 590 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 51:
#line 592 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 55:
#line 601 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; /* XXX handle multi_type */;}
    break;

  case 56:
#line 605 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 59:
#line 615 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 74:
#line 636 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 75:
#line 641 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 76:
#line 651 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 77:
#line 655 "pir.y"
    { set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 80:
#line 665 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 81:
#line 674 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op. Check that, and if not, emit an error message.
                           */
                          char * const instr = get_instr(lexer);
                          if (!is_parrot_op(lexer, instr))
                              yyerror(yyscanner, lexer, "'%s' is not a parrot instruction", instr);
                          else
                              do_strength_reduction(lexer);
                        ;}
    break;

  case 87:
#line 695 "pir.y"
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
                         set_target_key(obj, (yyvsp[(1) - (3)].key));
                         /* indexed operation is a "set" opcode */
                         set_instrf(lexer, "set", "%T%E", obj, (yyvsp[(3) - (3)].expr));
                       ;}
    break;

  case 88:
#line 725 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 89:
#line 727 "pir.y"
    { push_operand(lexer, expr_from_key((yyvsp[(1) - (1)].key))); ;}
    break;

  case 90:
#line 729 "pir.y"
    { push_operand(lexer, expr_from_target((yyvsp[(1) - (1)].targ))); ;}
    break;

  case 91:
#line 733 "pir.y"
    {
                           /* if $1 is a register, just return that */
                           if (TEST_FLAG((yyvsp[(1) - (2)].targ)->flags, TARGET_FLAG_IS_REG))
                               (yyval.targ) = (yyvsp[(1) - (2)].targ);
                           else { /* it's not a register, so it must be a declared symbol */
                               symbol *sym = find_symbol(lexer, target_name((yyvsp[(1) - (2)].targ)));
                               if (sym == NULL) {
                                   yyerror(yyscanner, lexer,
                                           "indexed object '%s' not declared", target_name((yyvsp[(1) - (2)].targ)));
                                   /* make sure sym is a valid pointer */
                                   sym = new_symbol(target_name((yyvsp[(1) - (2)].targ)), PMC_TYPE);
                               }
                               else if (sym->type != PMC_TYPE)
                                   yyerror(yyscanner, lexer,
                                           "indexed object '%s' is not of type 'pmc'",
                                           target_name((yyvsp[(1) - (2)].targ)));

                               /* create a target node based on the symbol node;
                                * sym already has a PASM register, so through
                                * this the target will get that too.
                                */
                               (yyval.targ) = target_from_symbol(sym);
                           }

                           /* in both cases (register or symbol), set the key on this target */
                           set_target_key((yyval.targ), (yyvsp[(2) - (2)].key));
                         ;}
    break;

  case 92:
#line 763 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 93:
#line 767 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 94:
#line 769 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 96:
#line 777 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 97:
#line 784 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 98:
#line 791 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 99:
#line 793 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 100:
#line 795 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (3)].sval));
                          if (sym == NULL) {
                              if (!is_parrot_op(lexer, (yyvsp[(3) - (3)].sval)))
                                  yyerror(yyscanner, lexer, "'%s' is neither a declared symbol "
                                                            "nor a parrot opcode", (yyvsp[(3) - (3)].sval));
                              else /* handle it as an op */
                                  unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ)));
                          }
                          else /* handle it as a symbol */
                              set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), target_from_symbol(sym));

                        ;}
    break;

  case 101:
#line 809 "pir.y"
    {
                          if (!is_parrot_op(lexer, (yyvsp[(3) - (6)].sval)))
                              yyerror(yyscanner, lexer, "'%s' is not a parrot op", (yyvsp[(3) - (6)].sval));
                          else {
                              unshift_operand(lexer, (yyvsp[(4) - (6)].expr));
                              unshift_operand(lexer, expr_from_target((yyvsp[(1) - (6)].targ)));
                              do_strength_reduction(lexer);
                          }
                        ;}
    break;

  case 102:
#line 819 "pir.y"
    {
                          if (!is_parrot_op(lexer, (yyvsp[(3) - (4)].sval)))
                              yyerror(yyscanner, lexer, "'%s' is not a parrot op", (yyvsp[(3) - (4)].sval));
                          else {
                              set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr));
                              do_strength_reduction(lexer);
                          }
                        ;}
    break;

  case 103:
#line 828 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (4)].sval));
                          target *t;
                          if (sym == NULL) {
                              if (is_parrot_op(lexer, (yyvsp[(3) - (4)].sval)))
                                  set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), expr_from_key((yyvsp[(4) - (4)].key)));
                              else
                                  yyerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(3) - (4)].sval));

                              /* create a symbol node anyway, so we can continue with instr. gen. */
                              sym = new_symbol((yyvsp[(3) - (4)].sval), PMC_TYPE);
                          }
                          /* at this point, sym is not NULL, even if there was an error */
                          if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(3) - (4)].sval));

                          t = target_from_symbol(sym);
                          set_target_key(t, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), t);

                        ;}
    break;

  case 104:
#line 851 "pir.y"
    {
                          unshift_operand(lexer, expr_from_key((yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target((yyvsp[(1) - (6)].targ)));
                        ;}
    break;

  case 105:
#line 856 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yyerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(3) - (4)].sval));
                              sym = new_symbol((yyvsp[(3) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(3) - (4)].sval));

                          t = target_from_symbol(sym);
                          set_target_key(t, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), t);
                        ;}
    break;

  case 106:
#line 873 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                        ;}
    break;

  case 107:
#line 879 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 108:
#line 881 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 109:
#line 890 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 110:
#line 899 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 111:
#line 908 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 112:
#line 917 "pir.y"
    { set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 113:
#line 919 "pir.y"
    { set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 114:
#line 921 "pir.y"
    { set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 115:
#line 923 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));
                        ;}
    break;

  case 116:
#line 930 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yyerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(1) - (4)].sval));
                              /* create a dummy symbol so we can continue without seg. faults */
                              sym = new_symbol((yyvsp[(1) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(1) - (4)].sval));
                          /* at this point sym is a valid (possibly dummy) object for sure */
                          t = target_from_symbol(sym);
                          set_target_key(t, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", t, (yyvsp[(4) - (4)].expr));
                      ;}
    break;

  case 117:
#line 948 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                        ;}
    break;

  case 118:
#line 981 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 119:
#line 983 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 120:
#line 985 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 121:
#line 987 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 122:
#line 989 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 123:
#line 991 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 124:
#line 993 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 125:
#line 995 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 127:
#line 1008 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 128:
#line 1010 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 129:
#line 1012 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 130:
#line 1014 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 131:
#line 1016 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 132:
#line 1018 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 133:
#line 1020 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 134:
#line 1022 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 135:
#line 1024 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 136:
#line 1026 "pir.y"
    {
                          int istrue = evaluate_c((yyvsp[(2) - (4)].cval));
                          /* if "unless", invert the true-ness */
                          istrue = (yyvsp[(1) - (4)].ival) ? !istrue : istrue;
                          if (istrue) {
                              set_instrf(lexer, "branch", "%I", (yyvsp[(4) - (4)].sval));
                              set_instr_flag(lexer, INSTR_FLAG_BRANCH);
                          }
                          else
                              set_instr(lexer, "noop");
                        ;}
    break;

  case 137:
#line 1038 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 138:
#line 1040 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 139:
#line 1042 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 140:
#line 1044 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 141:
#line 1046 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 142:
#line 1048 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 143:
#line 1050 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 144:
#line 1052 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 145:
#line 1054 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 146:
#line 1056 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 147:
#line 1058 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 148:
#line 1060 "pir.y"
    {
                          if ((yyvsp[(2) - (4)].ival) == -1) { /* -1 means the condition is evaluated during runtime */
                             if ((yyvsp[(1) - (4)].ival)) /* "unless"? if so, invert the instruction. */
                                 invert_instr(lexer);

                             push_operand(lexer, expr_from_ident((yyvsp[(4) - (4)].sval)));

                             set_instr_flag(lexer, INSTR_FLAG_ISXX);
                          }
                          else { /* evaluation during compile time */
                             /* if the result was false but the instr. was "unless", or,
                              * if the result was true and the instr. was "if",
                              * do an unconditional jump.
                              */
                             if ( (((yyvsp[(2) - (4)].ival) == 0) && (yyvsp[(1) - (4)].ival)) || (((yyvsp[(2) - (4)].ival) == 1) && !(yyvsp[(1) - (4)].ival)) ) {
                                set_instrf(lexer, "branch", "%I", (yyvsp[(4) - (4)].sval));
                                set_instr_flag(lexer, INSTR_FLAG_BRANCH);
                             }
                             else
                                set_instr(lexer, "noop");

                          }
                        ;}
    break;

  case 149:
#line 1090 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                        ;}
    break;

  case 150:
#line 1095 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 151:
#line 1100 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 152:
#line 1105 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 153:
#line 1110 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 154:
#line 1112 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 155:
#line 1114 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 156:
#line 1116 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 157:
#line 1118 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 158:
#line 1121 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 159:
#line 1122 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 162:
#line 1130 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_instr_flag(lexer, INSTR_FLAG_BRANCH);
                        ;}
    break;

  case 163:
#line 1137 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 164:
#line 1141 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 165:
#line 1143 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 166:
#line 1147 "pir.y"
    { (yyval.symb) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 167:
#line 1151 "pir.y"
    { /* try to find symbol for this id; if found, it was already declared */
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym)
                              yyerror(yyscanner, lexer, "symbol '%s' is already declared", (yyvsp[(1) - (1)].sval));
                          (yyval.sval) = (yyvsp[(1) - (1)].sval);
                        ;}
    break;

  case 168:
#line 1159 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 169:
#line 1160 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 170:
#line 1164 "pir.y"
    { /* if $4 is not a register, it must be a declared symbol */
                          if (!TEST_FLAG((yyvsp[(4) - (5)].targ)->flags, TARGET_FLAG_IS_REG)) {
                              symbol *sym = find_symbol(lexer, target_name((yyvsp[(4) - (5)].targ)));

                              if (sym == NULL) /* check declaration */
                                  yyerror(yyscanner, lexer, "lexical '%s' is not declared",
                                          target_name((yyvsp[(4) - (5)].targ)));
                              else if (sym->type != PMC_TYPE) /* a .lex must be a PMC */
                                  yyerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                          target_name((yyvsp[(4) - (5)].targ)));
                          }
                          set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                        ;}
    break;

  case 171:
#line 1183 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 174:
#line 1195 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                              (yyval.invo) = (yyvsp[(4) - (8)].invo);
                            ;}
    break;

  case 175:
#line 1203 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 176:
#line 1205 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 177:
#line 1209 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 178:
#line 1211 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 179:
#line 1215 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 180:
#line 1219 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 181:
#line 1221 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 182:
#line 1224 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 183:
#line 1228 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 184:
#line 1230 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 185:
#line 1234 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 186:
#line 1236 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 187:
#line 1240 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 188:
#line 1242 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 189:
#line 1246 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 190:
#line 1248 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 192:
#line 1256 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 193:
#line 1260 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 194:
#line 1264 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL);
                             (yyval.invo) = (yyvsp[(1) - (1)].invo);
                           ;}
    break;

  case 197:
#line 1274 "pir.y"
    {
                             /* if $1 is not a register, check whether the symbol was declared */
                             if (!TEST_FLAG((yyvsp[(1) - (4)].targ)->flags, TARGET_FLAG_IS_REG)) {
                                 symbol *sym = find_symbol(lexer, target_name((yyvsp[(1) - (4)].targ)));
                                 if (sym == NULL)
                                     yyerror(yyscanner, lexer, "object '%s' not declared",
                                             target_name((yyvsp[(1) - (4)].targ)));

                                 else if (sym->type != PMC_TYPE)
                                     yyerror(yyscanner, lexer,
                                             "cannot invoke method: '%s' is not of type 'pmc'",
                                             target_name((yyvsp[(1) - (4)].targ)));
                             }

                             (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                             set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                           ;}
    break;

  case 198:
#line 1294 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 199:
#line 1301 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 200:
#line 1303 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 201:
#line 1307 "pir.y"
    { /* check that this identifier was declared */
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));

                             if (sym == NULL) {
                                yyerror(yyscanner, lexer,
                                        "method identifier '%s' not declared", (yyvsp[(1) - (1)].sval));
                                /* make sure sym is not NULL */
                                sym = new_symbol((yyvsp[(1) - (1)].sval), PMC_TYPE);
                             }
                             else if (sym->type != PMC_TYPE && sym->type != STRING_TYPE)
                                 yyerror(yyscanner, lexer,
                                         "method '%s' must be of type 'pmc' or 'string'", (yyvsp[(1) - (1)].sval));

                             (yyval.targ) = target_from_symbol(sym);
                           ;}
    break;

  case 202:
#line 1323 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 203:
#line 1325 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 204:
#line 1327 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 205:
#line 1331 "pir.y"
    { (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 206:
#line 1333 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 207:
#line 1338 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 208:
#line 1342 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 209:
#line 1344 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 210:
#line 1348 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 211:
#line 1350 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 212:
#line 1354 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 213:
#line 1358 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 214:
#line 1360 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 215:
#line 1364 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 216:
#line 1366 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 217:
#line 1368 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 218:
#line 1370 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 219:
#line 1380 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 224:
#line 1390 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 225:
#line 1395 "pir.y"
    { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              (yyval.invo) = (yyvsp[(2) - (3)].invo);
                            ;}
    break;

  case 226:
#line 1406 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 227:
#line 1413 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 228:
#line 1417 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 229:
#line 1419 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 230:
#line 1423 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 231:
#line 1425 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 234:
#line 1433 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 235:
#line 1437 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 236:
#line 1441 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument((yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 237:
#line 1447 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 238:
#line 1456 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 239:
#line 1463 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 240:
#line 1465 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 241:
#line 1470 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 242:
#line 1472 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 243:
#line 1477 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 244:
#line 1481 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 245:
#line 1483 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 246:
#line 1487 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 247:
#line 1489 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 248:
#line 1493 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 249:
#line 1498 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 250:
#line 1500 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 251:
#line 1504 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 252:
#line 1506 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 253:
#line 1513 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 254:
#line 1515 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 255:
#line 1519 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 259:
#line 1530 "pir.y"
    { store_global_const(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 260:
#line 1534 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 261:
#line 1538 "pir.y"
    { (yyval.cval) = new_named_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 262:
#line 1540 "pir.y"
    { (yyval.cval) = new_named_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 263:
#line 1542 "pir.y"
    { (yyval.cval) = new_named_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 264:
#line 1544 "pir.y"
    { (yyval.cval) = new_named_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 265:
#line 1565 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 266:
#line 1566 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].cval)); ;}
    break;

  case 267:
#line 1570 "pir.y"
    { (yyval.cval) = new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 268:
#line 1571 "pir.y"
    { (yyval.cval) = new_const(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 269:
#line 1572 "pir.y"
    { (yyval.cval) = new_const(NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 270:
#line 1575 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 271:
#line 1576 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 272:
#line 1577 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 273:
#line 1578 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 274:
#line 1579 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 275:
#line 1580 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 276:
#line 1583 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 277:
#line 1584 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 278:
#line 1585 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 279:
#line 1586 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 280:
#line 1594 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 281:
#line 1597 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 282:
#line 1598 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 283:
#line 1599 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 284:
#line 1600 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 285:
#line 1601 "pir.y"
    { /* a symbol must have been declared; check that at this point. */
                           symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                           if (sym == NULL) {
                               yyerror(yyscanner, lexer, "symbol '%s' not declared", (yyvsp[(1) - (1)].sval));

                               /* make sure sym is not NULL */
                               sym = new_symbol((yyvsp[(1) - (1)].sval), UNKNOWN_TYPE);
                           }
                           (yyval.targ) = target_from_symbol(sym);

                         ;}
    break;

  case 288:
#line 1619 "pir.y"
    { (yyval.sval) = dupstr(lexer, "if"); ;}
    break;

  case 289:
#line 1620 "pir.y"
    { (yyval.sval) = dupstr(lexer, "unless"); ;}
    break;

  case 290:
#line 1621 "pir.y"
    { (yyval.sval) = dupstr(lexer, "goto"); ;}
    break;

  case 291:
#line 1622 "pir.y"
    { (yyval.sval) = dupstr(lexer, "int"); ;}
    break;

  case 292:
#line 1623 "pir.y"
    { (yyval.sval) = dupstr(lexer, "num"); ;}
    break;

  case 293:
#line 1624 "pir.y"
    { (yyval.sval) = dupstr(lexer, "string"); ;}
    break;

  case 294:
#line 1625 "pir.y"
    { (yyval.sval) = dupstr(lexer, "pmc"); ;}
    break;

  case 295:
#line 1626 "pir.y"
    { (yyval.sval) = dupstr(lexer, "null"); ;}
    break;

  case 296:
#line 1629 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 297:
#line 1630 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 298:
#line 1631 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 299:
#line 1634 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 300:
#line 1635 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 301:
#line 1636 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 302:
#line 1637 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 303:
#line 1638 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 304:
#line 1639 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 305:
#line 1640 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 306:
#line 1641 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 307:
#line 1642 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 308:
#line 1643 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 309:
#line 1644 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 310:
#line 1645 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 311:
#line 1646 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 312:
#line 1647 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 313:
#line 1648 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 314:
#line 1649 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 315:
#line 1650 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 316:
#line 1651 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 317:
#line 1652 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 318:
#line 1653 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 319:
#line 1654 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 320:
#line 1655 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 321:
#line 1656 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 322:
#line 1662 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 323:
#line 1663 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 324:
#line 1664 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 325:
#line 1665 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 326:
#line 1666 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 327:
#line 1667 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 328:
#line 1668 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 329:
#line 1669 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 330:
#line 1670 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 331:
#line 1671 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 332:
#line 1672 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 333:
#line 1673 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4041 "pirparser.c"
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


#line 1676 "pir.y"


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
            if ((strcmp(s, "0") == 0) || (strcmp(s, ".0") == 0)
                || (strcmp(s, "0.") == 0) || (strcmp(s, "0.0") == 0)) {
                return 0;
            }
            else  /* short string but not equal to "0.0" or a variant */
                return 1;
        }
        else /* strlen > 3, so does not contain "0.0" or a variant */
            return 1;
    }
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

=item C<static int
is_parrot_op(lexer_state * const lexer, char const * const spelling)>

=cut

*/
/*
static int
is_parrot_op(lexer_state * const lexer, char const * const spelling)
{
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
*/

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
    expression  *arg1, *arg2;

    /* if the instruction is "add", "sub", "mul", "div" or "fdiv", do continue... */
    if (strcmp(instr, "add") == 0)
        op = OP_ADD;
    else if (strcmp(instr, "sub") == 0)
        op = OP_SUB;
    else if (strcmp(instr, "mul") == 0)
        op = OP_MUL;
    else if (strcmp(instr, "div") == 0)
        op = OP_DIV;
    else if (strcmp(instr, "fdiv") == 0)
        op = OP_FDIV;
    else
        return;

    num_operands = get_operand_count(lexer);
    if (num_operands > 2) {
        /* get the operands */
        expression *op1, *op2;
        get_operands(lexer, 2, &op1, &op2);

        /* check whether operands are in fact targets */
        if ((op1->type == EXPR_TARGET) && (op2->type == EXPR_TARGET)) {

            /* check whether targets are equal */
            if (targets_equal(op1->expr.t, op2->expr.t)) {
                /* in that case, remove the second one */
                remove_operand(lexer, 2);
                free(op2);
                --num_operands;
            }
        }
    }

    /* don't even try to change "add $I0, 1" into "inc $I0" if number of operands is not 2 */
    if (num_operands != 2)
        return;

    arg1 = arg2 = NULL;
    get_operands(lexer, 2, &arg1, &arg2);
    assert(arg1);
    assert(arg2);

    switch (op) {
        case OP_ADD:
        case OP_SUB:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0)) {
                    update_instr(lexer, "noop");
                    remove_all_operands(lexer);
                }
                else if (check_value(arg2->expr.c, 1)) {
                    update_instr(lexer, opnames[op + 1]);
                    remove_operand(lexer, 2);
                }
            }
            break;
        case OP_MUL:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0)) {
                    update_instr(lexer, "null");
                    remove_operand(lexer, 2);
                }
                else if (check_value(arg2->expr.c, 1)) {
                    update_instr(lexer, "noop");
                    remove_all_operands(lexer);
                }
            }
            break;
        case OP_DIV:
        case OP_FDIV:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0))
                    pirerror(lexer, "cannot divide by 0");
                else if (check_value(arg2->expr.c, 1)) {
                    update_instr(lexer, "noop");
                    remove_all_operands(lexer);
                }
            }
            break;
        default:
            break;
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


