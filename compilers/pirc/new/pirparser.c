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
1. test the parser.
2. generate PBC, using Parrot_PackFile (and related) data structures.
3. handle branch/invoke instructions to calculate offsets etc.
4. handle freezing of PMC constants (representing subs)

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "pirparser.h"
#include "pircompiler.h"
#include "pircompunit.h"
#include "pirsymbol.h"

/* Note: the following sequence of #defines and #includes must be kept in this order.
 * Do not make changes to this; the sequence is important in order to be compilable.
 */

/**** Begin of Sequence. ****/

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

/* include "pirlexer.h" before "piryy.h" */
#include "pirlexer.h"
#include "piryy.h"

/* declare yylex(); do this I<after> including "pirlexer.h" */
extern YY_DECL;

/**** End of Sequence. ****/


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
static constant *fold_s_s(yyscan_t yyscanner, char *a, pir_math_operator op, char *b);

static int evaluate_i_i(int a, pir_rel_operator op, int b);
static int evaluate_n_n(double a, pir_rel_operator op, double b);
static int evaluate_i_n(int a, pir_rel_operator op, double b);
static int evaluate_n_i(double a, pir_rel_operator op, int b);
static int evaluate_s_s(char * const a, pir_rel_operator op, char * const b);

static int evaluate_s(char * const s);
static int evaluate_c(lexer_state * lexer, constant * const c);

static char *concat_strings(lexer_state * lexer, char *a, char *b);

static void create_if_instr(yyscan_t yyscanner, lexer_state * const lexer, int invert,
                            int hasnull, char * const name, char * const label);

static void do_strength_reduction(yyscan_t yyscanner);
static int check_value(constant * const c, int val);

static void check_first_arg_direction(yyscan_t yyscanner, char * const opname);

static int check_op_args_for_symbols(yyscan_t yyscanner);
static int get_opinfo(yyscan_t yyscanner);

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
#line 220 "pir.y"
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
#line 522 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 535 "pirparser.c"

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
#define YYLAST   854

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  117
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  127
/* YYNRULES -- Number of rules.  */
#define YYNRULES  340
/* YYNRULES -- Number of states.  */
#define YYNSTATES  533

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
     198,   200,   202,   204,   206,   207,   209,   211,   215,   219,
     221,   223,   225,   227,   229,   231,   234,   238,   240,   244,
     251,   256,   263,   266,   270,   274,   278,   282,   286,   291,
     296,   301,   305,   309,   313,   317,   321,   325,   329,   334,
     340,   345,   350,   354,   358,   362,   366,   370,   374,   378,
     382,   385,   391,   397,   403,   409,   415,   421,   427,   433,
     439,   444,   450,   455,   460,   465,   470,   475,   480,   485,
     490,   495,   500,   505,   510,   515,   519,   523,   527,   531,
     535,   539,   543,   547,   551,   553,   555,   557,   559,   563,
     568,   570,   574,   577,   579,   580,   582,   588,   590,   592,
     594,   603,   604,   606,   608,   611,   615,   619,   622,   628,
     629,   632,   633,   635,   637,   640,   644,   646,   649,   653,
     657,   659,   661,   663,   668,   671,   673,   675,   677,   679,
     681,   683,   685,   687,   691,   692,   694,   696,   700,   703,
     704,   707,   709,   711,   713,   716,   718,   720,   722,   724,
     726,   730,   734,   738,   742,   743,   745,   747,   751,   753,
     755,   759,   762,   764,   770,   776,   777,   779,   781,   784,
     788,   789,   791,   793,   796,   800,   801,   804,   806,   809,
     810,   812,   816,   819,   821,   823,   826,   829,   834,   839,
     844,   849,   851,   853,   855,   857,   859,   861,   863,   865,
     867,   869,   871,   873,   875,   877,   879,   881,   883,   885,
     887,   889,   891,   893,   895,   897,   899,   901,   903,   905,
     907,   909,   911,   913,   915,   917,   919,   921,   923,   925,
     927,   929,   931,   933,   935,   937,   939,   941,   943,   945,
     947,   949,   951,   953,   955,   957,   959,   961,   963,   965,
     967,   969,   971,   973,   975,   977,   979,   981,   983,   985,
     987
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     118,     0,    -1,   119,   120,   119,    -1,    -1,     3,    -1,
     121,    -1,   120,     3,   121,    -1,   129,    -1,   229,    -1,
     125,    -1,   123,    -1,   124,    -1,   122,    -1,     6,    43,
      -1,     4,    43,    -1,     5,    43,    99,    43,    -1,    12,
     100,   126,   101,    -1,    -1,   127,    -1,   128,    -1,   127,
     102,   128,    -1,    43,    -1,   131,   133,     3,   136,   144,
     130,    -1,     8,    -1,     7,   132,    -1,   239,    -1,    43,
      -1,    -1,   133,   134,    -1,    82,    -1,    79,    -1,    80,
      -1,    81,    -1,    83,    -1,    86,    -1,    88,    -1,    89,
      -1,    87,    -1,    84,   103,   132,   104,    -1,    85,   225,
      -1,    90,   226,    -1,    91,   226,    -1,   239,    -1,    43,
      -1,   161,    -1,   137,    -1,    -1,   137,   138,    -1,     9,
     139,   140,     3,    -1,   235,   239,    -1,    -1,   140,   141,
      -1,   203,    -1,   142,    -1,   143,    -1,    98,   103,   135,
     104,    -1,    92,    -1,    -1,   144,   145,    -1,    33,   146,
      -1,   146,    -1,   151,    -1,   167,    -1,   172,    -1,   173,
      -1,   178,    -1,   227,    -1,   204,    -1,   179,    -1,   164,
      -1,   150,    -1,   149,    -1,   147,    -1,   148,    -1,     3,
      -1,     1,     3,    -1,    41,   236,     3,    -1,    27,   198,
       3,    -1,   152,     3,    -1,   153,   154,    -1,   163,    -1,
      34,    -1,   155,    -1,   157,    -1,    -1,   156,    -1,   158,
      -1,   156,   105,   158,    -1,   161,    99,   232,    -1,   159,
      -1,   161,    -1,   160,    -1,   233,    -1,   239,    -1,   238,
      -1,   197,   161,    -1,   100,   162,   101,    -1,   232,    -1,
     162,   102,   232,    -1,   236,    99,   153,   159,   105,   156,
      -1,   236,    99,   153,   159,    -1,   236,    99,   153,   161,
     105,   156,    -1,   165,     3,    -1,   236,    99,    44,    -1,
     236,    99,    45,    -1,   236,    99,    43,    -1,   236,    99,
     166,    -1,   236,    99,   153,    -1,   236,    99,   153,   161,
      -1,   236,    99,   240,   161,    -1,   236,    99,    46,   161,
      -1,   236,   243,   232,    -1,   236,    68,    44,    -1,   236,
      68,    45,    -1,   236,    69,    44,    -1,   236,    69,    45,
      -1,   236,    68,   236,    -1,   236,    69,   236,    -1,   236,
      99,   241,   232,    -1,   236,    99,   236,   242,   236,    -1,
     240,   161,    99,   232,    -1,    46,   161,    99,   232,    -1,
      44,   242,   236,    -1,    45,   242,   236,    -1,    43,   242,
     236,    -1,    43,   242,    43,    -1,    44,   242,    44,    -1,
      45,   242,    45,    -1,    44,   242,    45,    -1,    45,   242,
      44,    -1,   168,     3,    -1,   170,    41,    34,    42,   239,
      -1,   170,    41,    35,    42,   239,    -1,   170,    41,    36,
      42,   239,    -1,   170,    41,    37,    42,   239,    -1,   170,
      41,    38,    42,   239,    -1,   170,    41,    39,    42,   239,
      -1,   170,    41,    40,    42,   239,    -1,   170,    41,    42,
      42,   239,    -1,   170,    41,    41,    42,   239,    -1,   170,
     233,   171,   239,    -1,   170,    41,    46,   171,   239,    -1,
     170,    34,   171,   239,    -1,   170,   238,   171,   239,    -1,
     170,    35,   171,   239,    -1,   170,    36,   171,   239,    -1,
     170,    37,   171,   239,    -1,   170,    38,   171,   239,    -1,
     170,    39,   171,   239,    -1,   170,    40,   171,   239,    -1,
     170,    42,    42,   239,    -1,   170,    42,   105,   239,    -1,
     170,    41,    42,   239,    -1,   170,    41,   105,   239,    -1,
     170,   169,    42,   239,    -1,   236,   234,   232,    -1,    44,
     234,   236,    -1,    45,   234,   236,    -1,    43,   234,   236,
      -1,    44,   234,    44,    -1,    44,   234,    45,    -1,    45,
     234,    44,    -1,    45,   234,    45,    -1,    43,   234,    43,
      -1,    39,    -1,    40,    -1,    42,    -1,   105,    -1,    42,
     239,     3,    -1,    11,   235,   174,     3,    -1,   175,    -1,
     174,   105,   175,    -1,   176,   177,    -1,   239,    -1,    -1,
      92,    -1,    10,    43,   105,   197,     3,    -1,   180,    -1,
     181,    -1,   190,    -1,    25,     3,   182,   185,     3,   187,
      26,     3,    -1,    -1,   183,    -1,   184,    -1,   183,   184,
      -1,    29,   213,     3,    -1,    28,   197,   186,    -1,    31,
     197,    -1,    13,   197,     3,    14,   196,    -1,    -1,   105,
     197,    -1,    -1,   188,    -1,   189,    -1,   188,   189,    -1,
      30,   201,     3,    -1,   173,    -1,   191,     3,    -1,   198,
      99,   192,    -1,   236,    99,   192,    -1,   192,    -1,   194,
      -1,   193,    -1,   197,   106,   196,   208,    -1,   195,   208,
      -1,   197,    -1,    43,    -1,   239,    -1,    46,    -1,    48,
      -1,    43,    -1,   239,    -1,    46,    -1,   103,   199,   104,
      -1,    -1,   200,    -1,   201,    -1,   200,   105,   201,    -1,
     236,   202,    -1,    -1,   202,   203,    -1,    96,    -1,    97,
      -1,    94,    -1,    93,   225,    -1,   205,    -1,   206,    -1,
     215,    -1,   207,    -1,   216,    -1,    17,   208,     3,    -1,
      32,   192,     3,    -1,    18,   208,     3,    -1,   103,   209,
     104,    -1,    -1,   210,    -1,   211,    -1,   210,   105,   211,
      -1,   213,    -1,   212,    -1,    43,    50,   214,    -1,   214,
     223,    -1,   232,    -1,    23,     3,   220,    24,     3,    -1,
      21,     3,   217,    22,     3,    -1,    -1,   218,    -1,   219,
      -1,   218,   219,    -1,    19,   213,     3,    -1,    -1,   221,
      -1,   222,    -1,   221,   222,    -1,    20,   213,     3,    -1,
      -1,   223,   224,    -1,    95,    -1,    93,   225,    -1,    -1,
     226,    -1,   103,    43,   104,    -1,   228,     3,    -1,   229,
      -1,   230,    -1,    16,   231,    -1,    15,   231,    -1,    35,
     239,    99,    44,    -1,    36,   239,    99,    45,    -1,    38,
     239,    99,    43,    -1,    37,   239,    99,    43,    -1,   236,
      -1,   233,    -1,    43,    -1,    44,    -1,    45,    -1,    51,
      -1,    52,    -1,    53,    -1,    54,    -1,    56,    -1,    55,
      -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,   237,
      -1,   238,    -1,   239,    -1,    46,    -1,    47,    -1,    49,
      -1,    48,    -1,    34,    -1,   240,    -1,    39,    -1,    40,
      -1,    42,    -1,    35,    -1,    36,    -1,    38,    -1,    37,
      -1,    41,    -1,   107,    -1,   108,    -1,   109,    -1,   110,
      -1,   107,    -1,   111,    -1,   112,    -1,   113,    -1,   114,
      -1,   115,    -1,   109,    -1,   116,    -1,    64,    -1,    57,
      -1,    58,    -1,    59,    -1,    61,    -1,    62,    -1,    60,
      -1,    63,    -1,    52,    -1,    54,    -1,    53,    -1,    56,
      -1,    55,    -1,    51,    -1,    70,    -1,    71,    -1,    72,
      -1,    73,    -1,    76,    -1,    74,    -1,    75,    -1,    77,
      -1,    78,    -1,    66,    -1,    67,    -1,    65,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   473,   473,   478,   479,   482,   483,   486,   487,   488,
     489,   490,   491,   494,   500,   504,   508,   513,   514,   518,
     520,   524,   528,   534,   538,   542,   543,   546,   547,   550,
     552,   554,   556,   558,   560,   562,   564,   566,   568,   570,
     572,   574,   578,   579,   580,   583,   587,   588,   591,   595,
     600,   601,   605,   606,   607,   610,   614,   620,   621,   624,
     626,   629,   630,   631,   632,   633,   634,   635,   636,   637,
     638,   639,   640,   641,   645,   650,   659,   666,   673,   676,
     677,   680,   689,   696,   699,   700,   703,   704,   707,   742,
     744,   746,   750,   752,   757,   761,   791,   795,   797,   806,
     817,   829,   838,   842,   849,   856,   858,   860,   879,   916,
     933,   939,   941,   950,   959,   968,   977,   979,   981,   983,
     990,  1008,  1041,  1043,  1045,  1047,  1049,  1051,  1053,  1055,
    1060,  1069,  1071,  1073,  1075,  1077,  1079,  1081,  1083,  1085,
    1087,  1099,  1104,  1106,  1108,  1110,  1112,  1114,  1116,  1118,
    1120,  1122,  1124,  1126,  1128,  1158,  1172,  1180,  1189,  1198,
    1200,  1202,  1204,  1206,  1210,  1211,  1214,  1215,  1218,  1226,
    1230,  1232,  1236,  1240,  1249,  1250,  1253,  1272,  1276,  1277,
    1280,  1293,  1294,  1298,  1300,  1304,  1308,  1310,  1312,  1318,
    1319,  1324,  1325,  1329,  1331,  1335,  1337,  1341,  1345,  1349,
    1353,  1359,  1360,  1363,  1391,  1398,  1400,  1404,  1420,  1422,
    1424,  1428,  1430,  1435,  1440,  1441,  1445,  1447,  1451,  1456,
    1457,  1461,  1463,  1465,  1467,  1477,  1481,  1482,  1483,  1484,
    1487,  1492,  1503,  1510,  1515,  1516,  1520,  1522,  1526,  1527,
    1530,  1534,  1538,  1542,  1551,  1561,  1562,  1567,  1569,  1574,
    1579,  1580,  1584,  1586,  1590,  1596,  1597,  1601,  1603,  1611,
    1612,  1616,  1620,  1623,  1624,  1627,  1631,  1635,  1637,  1639,
    1641,  1663,  1664,  1668,  1669,  1670,  1673,  1674,  1675,  1676,
    1677,  1678,  1681,  1682,  1683,  1684,  1692,  1695,  1696,  1709,
    1710,  1711,  1712,  1716,  1717,  1720,  1721,  1722,  1723,  1724,
    1725,  1726,  1727,  1730,  1731,  1732,  1735,  1736,  1737,  1738,
    1739,  1740,  1741,  1742,  1743,  1744,  1745,  1746,  1747,  1748,
    1749,  1750,  1751,  1752,  1753,  1754,  1755,  1756,  1757,  1763,
    1764,  1765,  1766,  1767,  1768,  1769,  1770,  1771,  1772,  1773,
    1774
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
  "op_args", "parrot_op_args", "keylist_assignment", "op_arg",
  "op_arg_expr", "keyaccess", "keylist", "keys", "parrot_op_assign",
  "assignment_stat", "assignment", "binary_expr", "conditional_stat",
  "conditional_instr", "condition", "if_unless", "then", "goto_stat",
  "local_decl", "local_id_list", "local_id", "local_var_name",
  "has_unique_reg", "lex_decl", "invocation_stat", "invocation",
  "long_invocation_stat", "opt_long_arguments", "long_arguments",
  "long_argument", "long_invocation", "opt_ret_cont", "opt_long_results",
  "long_results", "long_result", "short_invocation_stat",
  "short_invocation", "simple_invocation", "methodcall", "subcall", "sub",
  "method", "pmc_object", "opt_target_list", "opt_list", "target_list",
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
  "augmented_op", 0
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
     152,   153,   154,   154,   155,   155,   156,   156,   157,   158,
     158,   158,   159,   159,   159,   160,   161,   162,   162,   163,
     163,   163,   164,   165,   165,   165,   165,   165,   165,   165,
     165,   165,   165,   165,   165,   165,   165,   165,   165,   165,
     165,   165,   166,   166,   166,   166,   166,   166,   166,   166,
     167,   168,   168,   168,   168,   168,   168,   168,   168,   168,
     168,   168,   168,   168,   168,   168,   168,   168,   168,   168,
     168,   168,   168,   168,   168,   169,   169,   169,   169,   169,
     169,   169,   169,   169,   170,   170,   171,   171,   172,   173,
     174,   174,   175,   176,   177,   177,   178,   179,   180,   180,
     181,   182,   182,   183,   183,   184,   185,   185,   185,   186,
     186,   187,   187,   188,   188,   189,   189,   190,   191,   191,
     191,   192,   192,   193,   194,   195,   195,   196,   196,   196,
     196,   197,   197,   198,   199,   199,   200,   200,   201,   202,
     202,   203,   203,   203,   203,   204,   205,   205,   205,   205,
     206,   206,   207,   208,   209,   209,   210,   210,   211,   211,
     212,   213,   214,   215,   216,   217,   217,   218,   218,   219,
     220,   220,   221,   221,   222,   223,   223,   224,   224,   225,
     225,   226,   227,   228,   228,   229,   230,   231,   231,   231,
     231,   232,   232,   233,   233,   233,   234,   234,   234,   234,
     234,   234,   235,   235,   235,   235,   236,   237,   237,   238,
     238,   238,   238,   239,   239,   240,   240,   240,   240,   240,
     240,   240,   240,   241,   241,   241,   242,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   243,
     243,   243,   243,   243,   243,   243,   243,   243,   243,   243,
     243
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
       1,     1,     1,     1,     0,     1,     1,     3,     3,     1,
       1,     1,     1,     1,     1,     2,     3,     1,     3,     6,
       4,     6,     2,     3,     3,     3,     3,     3,     4,     4,
       4,     3,     3,     3,     3,     3,     3,     3,     4,     5,
       4,     4,     3,     3,     3,     3,     3,     3,     3,     3,
       2,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       4,     5,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     1,     1,     1,     3,     4,
       1,     3,     2,     1,     0,     1,     5,     1,     1,     1,
       8,     0,     1,     1,     2,     3,     3,     2,     5,     0,
       2,     0,     1,     1,     2,     3,     1,     2,     3,     3,
       1,     1,     1,     4,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     0,     1,     1,     3,     2,     0,
       2,     1,     1,     1,     2,     1,     1,     1,     1,     1,
       3,     3,     3,     3,     0,     1,     1,     3,     1,     1,
       3,     2,     1,     5,     5,     0,     1,     1,     2,     3,
       0,     1,     1,     2,     3,     0,     2,     1,     2,     0,
       1,     3,     2,     1,     1,     2,     2,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     3,     5,    12,    10,    11,     9,     7,    27,     8,
      14,     0,    13,   293,   298,   299,   301,   300,   295,   296,
     302,   297,    26,    24,    25,   294,    17,     0,     0,     0,
       0,   265,     4,     2,     0,     0,    21,     0,    18,    19,
       0,     0,     0,     0,     6,    46,    30,    31,    32,    29,
      33,     0,   259,    34,    37,    35,    36,     0,     0,    28,
      15,    16,     0,     0,     0,     0,     0,    57,    45,     0,
       0,    39,   260,    40,    41,    20,   267,   268,   270,   269,
       0,     0,    47,     0,     0,     0,    74,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   293,
     295,   296,   302,   297,   206,   289,   290,   292,   291,   214,
      22,    58,    60,    72,    73,    71,    70,    61,     0,    84,
      80,    69,     0,    62,     0,     0,    63,    64,    65,    68,
     177,   178,   179,     0,   200,   202,   201,     0,   205,     0,
      67,   225,   226,   228,   227,   229,    66,     0,   263,   264,
       0,   286,   287,   288,   294,   282,   283,   284,   285,    50,
       0,    38,   261,    75,     0,     0,   266,   234,     0,     0,
     245,   250,   181,     0,   212,     0,   211,    59,   289,     0,
     288,     0,     0,     0,     0,   215,   216,   219,    78,   273,
     274,   275,   289,    79,    82,    85,    83,    86,    89,    91,
      90,     0,    92,    94,    93,   102,   130,   293,   298,   299,
     301,   300,   295,   296,   302,   297,   273,   274,   275,     0,
       0,     0,   287,   197,   204,     0,     0,   262,   340,   338,
     339,     0,     0,   329,   330,   331,   332,   334,   335,   333,
     336,   337,     0,     0,     0,     0,    49,     0,     0,   170,
     174,   173,   273,     0,   235,   236,   239,   238,   255,   242,
     272,   271,   230,   232,     0,     0,   246,   247,     0,     0,
     251,   252,     0,     0,   182,   183,    77,   231,    76,   168,
       0,    97,     0,   213,     0,   218,     0,     0,    95,   166,
     167,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   276,   277,   278,   279,   281,   280,     0,     0,     0,
       0,     0,     0,     0,   210,   208,   209,     0,   207,   198,
     112,   113,   116,   114,   115,   117,   105,   103,   104,   289,
     303,   304,   305,   107,   106,   199,     0,   294,     0,   111,
       0,    48,    56,   259,   223,   221,   222,     0,    51,    53,
      54,    52,     0,   169,     0,   175,   172,     0,   233,     0,
     241,     0,     0,   248,     0,     0,   253,     0,     0,     0,
       0,     0,   184,    96,     0,   121,   217,   220,    87,    90,
      88,   142,   144,   145,   146,   147,   148,   149,     0,     0,
       0,     0,     0,     0,     0,     0,   297,   152,     0,   153,
     150,   151,   163,   158,   159,   160,   156,   161,   162,   157,
     154,   140,   155,   143,   203,   328,   323,   325,   324,   327,
     326,   316,   317,   318,   321,   319,   320,   322,   315,   307,
     313,   306,   308,   309,   310,   311,   312,   314,     0,     0,
       0,   110,   100,   108,    93,     0,   109,   118,   120,   224,
       0,   176,   171,   240,   237,   259,   257,   256,   249,   244,
     254,   243,   185,     0,   189,   187,   191,    98,   131,   132,
     133,   134,   135,   136,   137,   139,   138,   141,   125,   124,
     126,   128,   122,   129,   127,   123,     0,     0,   119,    43,
       0,    44,    42,   258,     0,     0,   186,     0,   196,     0,
     192,   193,    99,   101,    55,     0,   190,     0,     0,   194,
     188,   195,   180
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    47,
      48,    49,    17,   120,    18,    33,    44,    69,   510,    77,
      78,    92,   169,   255,   368,   369,   370,    90,   121,   122,
     123,   124,   125,   126,   127,   128,   129,   203,   204,   205,
     206,   207,   208,   209,   399,   290,   130,   131,   132,   354,
     133,   134,   229,   135,   301,   136,   137,   258,   259,   260,
     376,   138,   139,   140,   141,   283,   284,   285,   391,   516,
     519,   520,   521,   142,   143,   144,   145,   146,   147,   337,
     148,   149,   194,   195,   196,   295,   371,   150,   151,   152,
     153,   178,   263,   264,   265,   266,   267,   268,   154,   155,
     275,   276,   277,   279,   280,   281,   380,   477,    81,    82,
     156,   157,    19,   159,    41,   269,   270,   327,   170,   271,
     161,   162,   190,    35,   358,   458,   253
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -476
static const yytype_int16 yypact[] =
{
       9,  -476,    23,   125,  -476,     8,    24,    61,   802,   -53,
     122,   124,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,    34,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,    96,   474,   474,   474,
     474,  -476,   125,  -476,   357,    99,  -476,    46,    59,  -476,
      64,    65,    66,    69,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,    67,    71,  -476,  -476,  -476,  -476,    71,    71,  -476,
    -476,  -476,    96,   128,   139,   144,   146,  -476,   179,   802,
     151,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
     316,   145,  -476,    91,    93,   196,  -476,  -476,   158,   145,
     122,   100,   100,   201,   203,   216,   117,   415,   175,    49,
     606,   627,   771,   474,  -476,   -37,  -476,  -476,  -476,   771,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,   223,   445,
    -476,  -476,   226,  -476,   227,   643,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,   228,  -476,  -476,  -476,   100,   127,   136,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,   234,  -476,  -476,
     561,  -476,  -476,   -85,   138,  -476,  -476,  -476,  -476,  -476,
     474,  -476,  -476,  -476,   134,   474,  -476,   659,   237,   242,
     229,   230,   217,   250,  -476,   251,  -476,  -476,  -476,   282,
    -476,   283,   675,   153,   183,   184,  -476,  -476,  -476,  -476,
    -476,  -476,   190,  -476,  -476,   186,  -476,  -476,  -476,  -476,
     193,   138,  -476,  -476,   206,  -476,  -476,     1,     1,     1,
       1,     1,     1,     1,    19,     2,   249,   249,   249,   265,
       1,   249,     1,  -476,  -476,   787,   415,  -476,  -476,  -476,
    -476,   235,   541,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,   429,   675,   210,    22,  -476,   222,     6,  -476,
     221,  -476,   264,   211,   213,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,   675,   294,   229,  -476,   675,   296,
     230,  -476,   675,    97,   217,  -476,  -476,  -476,  -476,  -476,
       0,  -476,   675,  -476,   771,    57,   445,   675,  -476,  -476,
    -476,   474,   474,   474,   474,   474,   474,   474,   279,   286,
     287,   288,   293,   298,   300,   302,   812,     1,   474,   474,
     474,  -476,  -476,  -476,  -476,  -476,  -476,   386,   691,   707,
     474,   474,   675,   474,  -476,  -476,  -476,   100,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,   495,   509,   509,   -37,
    -476,  -476,  -476,   484,  -476,  -476,   509,   138,   675,  -476,
     675,  -476,  -476,    71,  -476,  -476,  -476,   233,  -476,  -476,
    -476,  -476,   335,  -476,   474,  -476,  -476,   675,  -476,   659,
     -25,   343,   344,  -476,   358,   364,  -476,   366,   222,   222,
     222,   367,  -476,  -476,   675,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,   474,   474,
     474,   474,   474,   474,   474,   474,   474,  -476,   474,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,   755,   723,
     739,  -476,   266,   270,  -476,   771,  -476,  -476,  -476,  -476,
      38,  -476,  -476,  -476,  -476,    71,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,   373,   272,  -476,     4,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,   445,   445,  -476,  -476,
     274,  -476,  -476,  -476,   375,   222,  -476,   771,  -476,   365,
       4,  -476,   186,   186,  -476,   787,  -476,   387,   390,  -476,
    -476,  -476,  -476
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -476,  -476,   383,  -476,   353,  -476,  -476,  -476,  -476,  -476,
    -476,   324,  -476,  -476,  -476,   318,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,  -476,   290,
    -476,  -476,  -476,  -476,  -476,  -476,   147,  -476,  -476,  -394,
    -476,   113,    58,  -476,  -102,  -476,  -476,  -476,  -476,  -476,
    -476,  -476,  -476,  -476,  -182,  -476,  -475,  -476,    39,  -476,
    -476,  -476,  -476,  -476,  -476,  -476,  -476,   130,  -476,  -476,
    -476,  -476,  -108,  -476,  -476,  -100,  -476,  -476,  -476,  -110,
    -123,   310,  -476,  -476,  -292,  -476,   123,  -476,  -476,  -476,
    -476,  -101,  -476,  -476,    51,  -476,  -134,    40,  -476,  -476,
    -476,  -476,   219,  -476,  -476,   180,  -476,  -476,  -358,    78,
    -476,  -476,   -66,  -476,   359,  -189,  -121,  -105,   397,   -86,
    -476,  -119,    -8,   -73,  -476,  -328,  -476
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -213
static const yytype_int16 yytable[] =
{
      34,   179,   396,   291,   160,   469,   211,   185,   212,   373,
     213,   518,     1,   193,   230,    99,   232,   164,  -211,   459,
     460,  -211,   160,     4,   158,   361,   189,   210,   465,    50,
      51,    52,    53,   197,   517,   164,   302,   303,   304,   305,
     306,   307,   158,   299,   319,   518,   234,    36,   331,   231,
     333,    20,   -81,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   254,   192,   359,   317,  -212,    21,   475,  -212,
     476,    34,    23,    24,    25,    26,    27,    28,    29,    30,
      31,   509,   163,   -81,   -81,   -81,   -81,   -81,   -81,   -81,
     -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   186,
     163,   393,   394,   395,    22,   191,   300,   320,   400,   298,
     388,   374,   522,   523,   362,   363,   364,   513,   365,   366,
     367,   214,   328,   329,   318,   389,   332,    42,   390,     5,
       6,     7,     8,    45,   372,   418,   339,     9,   192,    46,
     381,    10,    70,   432,   384,    83,    84,    71,   387,   -81,
     363,   364,   355,   365,   366,   342,   345,    37,    38,    39,
      40,    72,   256,    73,    74,    75,   356,   261,    76,   467,
      79,   468,    86,   211,    80,   212,    95,   213,    96,   357,
     165,   166,   167,   168,    87,    98,    99,    88,    91,    89,
     100,    10,   101,   102,    94,   171,   103,   172,   104,   173,
     105,   174,   106,   177,   180,   487,   181,   107,   197,   109,
      24,    25,    26,    27,   110,   111,   112,   113,   114,   182,
     119,   115,   116,   117,   118,   527,   198,   338,   186,   215,
     216,   233,   212,   235,   213,   236,   434,   237,   192,   257,
     272,   423,   426,   429,   163,   273,   282,   461,   274,   186,
     278,   463,   292,   286,   287,   466,    23,    24,    25,    26,
      27,    28,    29,    30,    31,   483,   484,   485,   184,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   119,   340,
     341,   188,   116,   117,   118,   288,   289,   293,   214,   294,
    -212,   296,   297,   401,   402,   403,   404,   405,   406,   407,
     321,   322,   323,   324,   325,   326,  -211,   330,   417,   360,
     419,   420,   421,   375,   377,   378,   382,    95,   379,    96,
     385,   408,   430,   431,    97,   433,    98,    99,   409,   410,
     411,   100,    10,   101,   102,   412,   470,   103,   471,   104,
     413,   105,   414,   106,   415,   464,   478,   479,   107,   108,
     109,    24,    25,    26,    27,   110,   111,   112,   113,   114,
      55,   480,   115,   116,   117,   118,   261,   481,   511,   482,
     486,   506,   499,   502,   505,   507,   514,   515,   524,   508,
     186,   186,   186,   211,   211,   212,   212,   213,   213,   525,
     531,   528,   526,   532,    43,    54,    85,    93,   187,   353,
     488,   489,   490,   491,   492,   493,   494,   495,   496,   398,
     497,   462,   529,   472,   392,   530,   183,   473,   397,   119,
      23,    24,    25,    26,    27,    28,    29,    30,    31,   422,
     474,   197,   188,   116,   117,   118,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   114,   176,
     386,   184,   512,   109,    24,    25,    26,    27,    28,    29,
      30,    31,   346,   347,   348,   349,   116,   117,   118,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   199,   200,
     201,   202,   116,   117,   118,   383,   175,     0,   214,   214,
       0,     0,     0,     0,     0,     0,     0,   186,    23,    24,
      25,    26,    27,    28,    29,    30,    31,   338,    23,    24,
      25,    26,    27,    28,    29,    30,    31,   199,   200,   201,
     188,   116,   117,   118,     0,     0,   350,   351,   352,     0,
       0,     0,     0,     0,     0,   192,   435,   436,   437,   438,
     439,   440,   441,   442,   443,   444,   445,   446,   447,   448,
     435,   436,   437,   438,   439,   440,   441,   442,   443,   444,
     445,   446,   447,   448,     0,    23,    24,    25,    26,    27,
      28,    29,    30,    31,   192,   343,   344,   188,   116,   117,
     118,     0,     0,     0,     0,     0,     0,     0,  -206,     0,
       0,     0,   449,     0,   450,   451,   452,   453,   454,   455,
     456,   457,     0,     0,     0,     0,   449,     0,   450,   451,
     452,   453,   454,   455,   456,   457,   238,   239,   240,   241,
     242,   243,   244,   245,   246,   247,   248,   249,   250,   251,
    -164,  -164,  -164,  -164,  -164,  -164,  -164,  -164,  -164,  -164,
    -164,  -164,  -164,  -164,  -164,  -164,     0,     0,     0,     0,
     252,  -165,  -165,  -165,  -165,  -165,  -165,  -165,  -165,  -165,
    -165,  -165,  -165,  -165,  -165,  -165,  -165,   217,   218,   219,
     220,   221,   222,   223,   224,   225,   226,   227,   228,   188,
     116,   117,   118,    23,    24,    25,    26,    27,    28,    29,
      30,    31,   262,   200,   201,   188,   116,   117,   118,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   199,   200,
     201,   188,   116,   117,   118,    23,    24,    25,    26,    27,
      28,    29,    30,    31,     0,   424,   425,   188,   116,   117,
     118,    23,    24,    25,    26,    27,    28,    29,    30,    31,
       0,   427,   428,   188,   116,   117,   118,    23,    24,    25,
      26,    27,    28,    29,    30,    31,     0,   500,   501,   188,
     116,   117,   118,    23,    24,    25,    26,    27,    28,    29,
      30,    31,     0,   503,   504,   188,   116,   117,   118,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   498,     0,
       0,   188,   116,   117,   118,    23,    24,    25,    26,    27,
      28,    29,    30,    31,     0,     0,     0,   188,   116,   117,
     118,    23,    24,    25,    26,    27,    28,    29,    30,    31,
     334,     0,     0,   335,     0,   336,    23,    24,    25,    26,
      27,    28,    29,    30,    31,    32,    23,    24,    25,    26,
      27,    28,    29,    30,   416
};

static const yytype_int16 yycheck[] =
{
       8,   102,   294,   192,    90,   363,   129,   107,   129,     3,
     129,   486,     3,   115,   135,    11,   135,    90,   103,   347,
     348,   106,   108,     0,    90,     3,   112,   129,   356,    37,
      38,    39,    40,   119,    30,   108,   218,   219,   220,   221,
     222,   223,   108,    42,    42,   520,   147,   100,   230,   135,
     232,    43,     3,    34,    35,    36,    37,    38,    39,    40,
      41,    42,   164,   100,   253,    46,   103,    43,    93,   106,
      95,    79,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    90,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,   107,
     108,   101,   102,   292,    43,   113,   105,   105,   297,   211,
      13,   105,   506,   507,    92,    93,    94,   475,    96,    97,
      98,   129,   227,   228,   105,    28,   231,     3,    31,     4,
       5,     6,     7,    99,   257,   317,   236,    12,   100,    43,
     274,    16,    43,   332,   278,    67,    68,   101,   282,   100,
      93,    94,   252,    96,    97,   241,   242,    35,    36,    37,
      38,   102,   170,    99,    99,    99,   252,   175,    99,   358,
     103,   360,    44,   296,   103,   296,     1,   296,     3,   252,
      35,    36,    37,    38,    45,    10,    11,    43,     9,    43,
      15,    16,    17,    18,    43,   104,    21,   104,    23,     3,
      25,    43,    27,   103,     3,   394,     3,    32,   294,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,     3,
     103,    46,    47,    48,    49,   517,     3,   235,   236,     3,
       3,     3,   353,   106,   353,    99,   337,     3,   100,   105,
       3,   327,   328,   329,   252,     3,    29,   349,    19,   257,
      20,   353,    99,     3,     3,   357,    34,    35,    36,    37,
      38,    39,    40,    41,    42,   388,   389,   390,    46,    34,
      35,    36,    37,    38,    39,    40,    41,    42,   103,    44,
      45,    46,    47,    48,    49,     3,     3,   104,   296,   105,
     100,   105,    99,   301,   302,   303,   304,   305,   306,   307,
      51,    52,    53,    54,    55,    56,   100,    42,   316,    99,
     318,   319,   320,    92,    50,   104,    22,     1,   105,     3,
      24,    42,   330,   331,     8,   333,    10,    11,    42,    42,
      42,    15,    16,    17,    18,    42,   103,    21,     3,    23,
      42,    25,    42,    27,    42,   353,     3,     3,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
       3,     3,    46,    47,    48,    49,   374,     3,   470,     3,
       3,   105,   458,   459,   460,   105,     3,   105,   104,   465,
     388,   389,   390,   506,   507,   506,   507,   506,   507,    14,
       3,    26,   515,     3,    11,    42,    72,    79,   108,   252,
     408,   409,   410,   411,   412,   413,   414,   415,   416,   296,
     418,   353,   520,   374,   284,   525,   106,   377,   295,   103,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
     379,   517,    46,    47,    48,    49,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,   100,
     280,    46,   470,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,   276,    99,    -1,   506,   507,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   515,    34,    35,
      36,    37,    38,    39,    40,    41,    42,   525,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    -1,    -1,   107,   108,   109,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    -1,    34,    35,    36,    37,    38,
      39,    40,    41,    42,   100,    44,    45,    46,    47,    48,
      49,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,
      -1,    -1,   107,    -1,   109,   110,   111,   112,   113,   114,
     115,   116,    -1,    -1,    -1,    -1,   107,    -1,   109,   110,
     111,   112,   113,   114,   115,   116,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    -1,    -1,    -1,    -1,
      99,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    -1,    44,    45,    46,    47,    48,
      49,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      -1,    44,    45,    46,    47,    48,    49,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    -1,    44,    45,    46,
      47,    48,    49,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    -1,    44,    45,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    -1,
      -1,    46,    47,    48,    49,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    -1,    -1,    -1,    46,    47,    48,
      49,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    -1,    -1,    46,    -1,    48,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    34,    35,    36,    37,
      38,    39,    40,    41,    42
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,   118,   119,     0,     4,     5,     6,     7,    12,
      16,   120,   121,   122,   123,   124,   125,   129,   131,   229,
      43,    43,    43,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,   132,   239,   240,   100,    35,    36,    37,
      38,   231,     3,   119,   133,    99,    43,   126,   127,   128,
     239,   239,   239,   239,   121,     3,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,   134,
      43,   101,   102,    99,    99,    99,    99,   136,   137,   103,
     103,   225,   226,   226,   226,   128,    44,    45,    43,    43,
     144,     9,   138,   132,    43,     1,     3,     8,    10,    11,
      15,    17,    18,    21,    23,    25,    27,    32,    33,    34,
      39,    40,    41,    42,    43,    46,    47,    48,    49,   103,
     130,   145,   146,   147,   148,   149,   150,   151,   152,   153,
     163,   164,   165,   167,   168,   170,   172,   173,   178,   179,
     180,   181,   190,   191,   192,   193,   194,   195,   197,   198,
     204,   205,   206,   207,   215,   216,   227,   228,   229,   230,
     236,   237,   238,   239,   240,    35,    36,    37,    38,   139,
     235,   104,   104,     3,    43,   235,   231,   103,   208,   208,
       3,     3,     3,   198,    46,   192,   239,   146,    46,   236,
     239,   239,   100,   161,   199,   200,   201,   236,     3,    43,
      44,    45,    46,   154,   155,   156,   157,   158,   159,   160,
     161,   197,   233,   238,   239,     3,     3,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,   169,
     233,   236,   238,     3,   208,   106,    99,     3,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    99,   243,   161,   140,   239,   105,   174,   175,
     176,   239,    43,   209,   210,   211,   212,   213,   214,   232,
     233,   236,     3,     3,    19,   217,   218,   219,    20,   220,
     221,   222,    29,   182,   183,   184,     3,     3,     3,     3,
     162,   232,    99,   104,   105,   202,   105,    99,   161,    42,
     105,   171,   171,   171,   171,   171,   171,   171,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    46,   105,    42,
     105,    51,    52,    53,    54,    55,    56,   234,   234,   234,
      42,   171,   234,   171,    43,    46,    48,   196,   239,   192,
      44,    45,   236,    44,    45,   236,    43,    44,    45,    46,
     107,   108,   109,   153,   166,   192,   236,   240,   241,   232,
      99,     3,    92,    93,    94,    96,    97,    98,   141,   142,
     143,   203,   197,     3,   105,    92,   177,    50,   104,   105,
     223,   213,    22,   219,   213,    24,   222,   213,    13,    28,
      31,   185,   184,   101,   102,   232,   201,   203,   158,   161,
     232,   239,   239,   239,   239,   239,   239,   239,    42,    42,
      42,    42,    42,    42,    42,    42,    42,   239,   171,   239,
     239,   239,    43,   236,    44,    45,   236,    44,    45,   236,
     239,   239,   232,   239,   208,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,   107,
     109,   110,   111,   112,   113,   114,   115,   116,   242,   242,
     242,   161,   159,   161,   239,   242,   161,   232,   232,   225,
     103,     3,   175,   214,   211,    93,    95,   224,     3,     3,
       3,     3,     3,   197,   197,   197,     3,   232,   239,   239,
     239,   239,   239,   239,   239,   239,   239,   239,    43,   236,
      44,    45,   236,    44,    45,   236,   105,   105,   236,    43,
     135,   161,   239,   225,     3,   105,   186,    30,   173,   187,
     188,   189,   156,   156,   104,    14,   197,   201,    26,   189,
     196,     3,     3
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
#line 495 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 14:
#line 501 "pir.y"
    { set_hll(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 15:
#line 505 "pir.y"
    { set_hll_map(lexer, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 16:
#line 509 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 17:
#line 513 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 18:
#line 515 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 19:
#line 519 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 20:
#line 521 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 21:
#line 525 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 23:
#line 535 "pir.y"
    { close_sub(lexer); ;}
    break;

  case 24:
#line 539 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 29:
#line 551 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 30:
#line 553 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 31:
#line 555 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 32:
#line 557 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 33:
#line 559 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 34:
#line 561 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 35:
#line 563 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 36:
#line 565 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 37:
#line 567 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 38:
#line 569 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 39:
#line 571 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 573 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 41:
#line 575 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 45:
#line 584 "pir.y"
    { generate_get_params(lexer); ;}
    break;

  case 48:
#line 592 "pir.y"
    { set_param_flag(lexer, (yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival)); ;}
    break;

  case 49:
#line 596 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 50:
#line 600 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 51:
#line 602 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 55:
#line 611 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; /* XXX handle multi_type */;}
    break;

  case 56:
#line 615 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 59:
#line 625 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 74:
#line 646 "pir.y"
    { set_instr(lexer, NULL); ;}
    break;

  case 75:
#line 651 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS)
                               panic(lexer, "Too many errors. Compilation aborted.\n");

                           yyerrok;
                         ;}
    break;

  case 76:
#line 660 "pir.y"
    {
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 77:
#line 667 "pir.y"
    {
                           set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ));
                           get_opinfo(yyscanner);
                         ;}
    break;

  case 81:
#line 681 "pir.y"
    { /* at this point, TK_IDENT may in fact be a symbol identifier,
                            * not an op, so don't do any checks like is_parrot_op() just yet.
                            */
                           set_instr(lexer, (yyvsp[(1) - (1)].sval));
                           (yyval.sval) = (yyvsp[(1) - (1)].sval);
                         ;}
    break;

  case 82:
#line 690 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op.
                           */
                          if (check_op_args_for_symbols(yyscanner))
                              do_strength_reduction(yyscanner);
                        ;}
    break;

  case 88:
#line 708 "pir.y"
    {
                         /* the "instruction" that was set now appears to be
                          * an identifier; get the name, and check its type.
                          */
                         char * const instr = CURRENT_INSTRUCTION(lexer)->opname;
                         symbol *sym        = find_symbol(lexer, instr);
                         target *obj;

                         /* find the symbol for the object being indexed;
                          * it must have been declared.
                          */
                         if (sym == NULL) {
                            yyerror(yyscanner, lexer, "indexed object '%s' not declared", instr);
                            sym = new_symbol(lexer, instr, PMC_TYPE);
                         }
                         else if (sym->type != PMC_TYPE) /* found symbol, now check it's a PMC */
                            yyerror(yyscanner, lexer,
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

  case 89:
#line 743 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 90:
#line 745 "pir.y"
    { push_operand(lexer, expr_from_key(lexer, (yyvsp[(1) - (1)].key))); ;}
    break;

  case 91:
#line 747 "pir.y"
    { push_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (1)].targ))); ;}
    break;

  case 92:
#line 751 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 93:
#line 753 "pir.y"
    { /* this is either a LABEL or a symbol; in the latter case, the type
                            * will be filled in later. */
                           (yyval.expr) = expr_from_target(lexer, new_target(lexer, UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)));
                         ;}
    break;

  case 94:
#line 758 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 95:
#line 762 "pir.y"
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
                                   sym = new_symbol(lexer, target_name((yyvsp[(1) - (2)].targ)), PMC_TYPE);
                               }
                               else if (sym->type != PMC_TYPE)
                                   yyerror(yyscanner, lexer,
                                           "indexed object '%s' is not of type 'pmc'",
                                           target_name((yyvsp[(1) - (2)].targ)));

                               /* create a target node based on the symbol node;
                                * sym already has a PASM register, so through
                                * this the target will get that too.
                                */
                               (yyval.targ) = target_from_symbol(lexer, sym);
                           }

                           /* in both cases (register or symbol), set the key on this target */
                           set_target_key((yyval.targ), (yyvsp[(2) - (2)].key));
                         ;}
    break;

  case 96:
#line 792 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 97:
#line 796 "pir.y"
    { (yyval.key) = new_key(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 98:
#line 798 "pir.y"
    { (yyval.key) = add_key(lexer, (yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 99:
#line 807 "pir.y"
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

  case 100:
#line 818 "pir.y"
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

  case 101:
#line 830 "pir.y"
    {
                          unshift_operand(lexer, expr_from_key(lexer, (yyvsp[(4) - (6)].key)));
                          unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (6)].targ)));
                          if (check_op_args_for_symbols(yyscanner))
                              check_first_arg_direction(yyscanner, (yyvsp[(3) - (6)].sval));
                        ;}
    break;

  case 102:
#line 839 "pir.y"
    { get_opinfo(yyscanner); ;}
    break;

  case 103:
#line 843 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 104:
#line 850 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 105:
#line 857 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 106:
#line 859 "pir.y"
    { unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (3)].targ))); ;}
    break;

  case 107:
#line 861 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (3)].sval));
                          if (sym == NULL) {
                              if (!is_parrot_op(lexer, (yyvsp[(3) - (3)].sval)))
                                  yyerror(yyscanner, lexer, "'%s' is neither a declared symbol "
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

  case 108:
#line 880 "pir.y"
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
                                  yyerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(3) - (4)].sval));

                              /* create a symbol node anyway, so we can continue with instr. gen. */
                              sym = new_symbol(lexer, (yyvsp[(3) - (4)].sval), PMC_TYPE);
                          }
                          else {
                              /* at this point, sym is not NULL, even if there was an error */
                              if (sym->type != PMC_TYPE)
                                  yyerror(yyscanner, lexer,
                                          "indexed object '%s' must be of type 'pmc'", (yyvsp[(3) - (4)].sval));

                              t = target_from_symbol(lexer, sym);
                              set_target_key(t, (yyvsp[(4) - (4)].key));
                              update_instr(lexer, "set");
                              unshift_operand(lexer, expr_from_target(lexer, t));
                              unshift_operand(lexer, expr_from_target(lexer, (yyvsp[(1) - (4)].targ)));
                          }
                        ;}
    break;

  case 109:
#line 917 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(3) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yyerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(3) - (4)].sval));
                              sym = new_symbol(lexer, (yyvsp[(3) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(3) - (4)].sval));

                          t = target_from_symbol(lexer, sym);
                          set_target_key(t, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), t);
                        ;}
    break;

  case 110:
#line 934 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (4)].ival));
                          set_target_key(preg, (yyvsp[(4) - (4)].key));
                          set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), preg);
                        ;}
    break;

  case 111:
#line 940 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 112:
#line 942 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 113:
#line 951 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 114:
#line 960 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 115:
#line 969 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 116:
#line 978 "pir.y"
    { set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 117:
#line 980 "pir.y"
    { set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 118:
#line 982 "pir.y"
    { set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 119:
#line 984 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* $P0 = $P0 + $P1 ==> $P0 += $P1 */
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));
                        ;}
    break;

  case 120:
#line 991 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yyerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(1) - (4)].sval));
                              /* create a dummy symbol so we can continue without seg. faults */
                              sym = new_symbol(lexer, (yyvsp[(1) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(1) - (4)].sval));
                          /* at this point sym is a valid (possibly dummy) object for sure */
                          t = target_from_symbol(lexer, sym);
                          set_target_key(t, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", t, (yyvsp[(4) - (4)].expr));
                      ;}
    break;

  case 121:
#line 1009 "pir.y"
    {
                          target *preg = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                        ;}
    break;

  case 122:
#line 1042 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 123:
#line 1044 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 124:
#line 1046 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 125:
#line 1048 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 126:
#line 1050 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 127:
#line 1052 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 128:
#line 1054 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 129:
#line 1056 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 130:
#line 1061 "pir.y"
    { get_opinfo(yyscanner); ;}
    break;

  case 131:
#line 1070 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 132:
#line 1072 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 133:
#line 1074 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 134:
#line 1076 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 135:
#line 1078 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 136:
#line 1080 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 137:
#line 1082 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 138:
#line 1084 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 139:
#line 1086 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 140:
#line 1088 "pir.y"
    {
                          int istrue = evaluate_c(lexer, (yyvsp[(2) - (4)].cval));
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

  case 141:
#line 1100 "pir.y"
    {
                          set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%T%I",
                                     new_reg(lexer, PMC_TYPE, (yyvsp[(3) - (5)].ival)), (yyvsp[(5) - (5)].sval));
                        ;}
    break;

  case 142:
#line 1105 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 143:
#line 1107 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 144:
#line 1109 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 145:
#line 1111 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 146:
#line 1113 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 147:
#line 1115 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 148:
#line 1117 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 149:
#line 1119 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 150:
#line 1121 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 151:
#line 1123 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 152:
#line 1125 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 153:
#line 1127 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 154:
#line 1129 "pir.y"
    {
                          if ((yyvsp[(2) - (4)].ival) == -1) { /* -1 means the condition is evaluated during runtime */
                             if ((yyvsp[(1) - (4)].ival)) /* "unless"? if so, invert the instruction. */
                                 invert_instr(lexer);

                             push_operand(lexer, expr_from_ident(lexer, (yyvsp[(4) - (4)].sval)));

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

  case 155:
#line 1159 "pir.y"
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

                          (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                        ;}
    break;

  case 156:
#line 1173 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%i", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].ival));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 157:
#line 1181 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival) + 1], "%T%n", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].dval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = -1;
                        ;}
    break;

  case 158:
#line 1190 "pir.y"
    {
                          if ((yyvsp[(2) - (3)].ival) == OP_GE || (yyvsp[(2) - (3)].ival) == OP_GT)
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%s", (yyvsp[(3) - (3)].targ), (yyvsp[(1) - (3)].sval));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));

                          (yyval.ival) = -1;
                        ;}
    break;

  case 159:
#line 1199 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 160:
#line 1201 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 161:
#line 1203 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 162:
#line 1205 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 163:
#line 1207 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 164:
#line 1210 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 165:
#line 1211 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 168:
#line 1219 "pir.y"
    {
                          set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval));
                          set_instr_flag(lexer, INSTR_FLAG_BRANCH);
                          get_opinfo(yyscanner);
                        ;}
    break;

  case 169:
#line 1227 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 170:
#line 1231 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 171:
#line 1233 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 172:
#line 1237 "pir.y"
    { (yyval.symb) = new_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 173:
#line 1241 "pir.y"
    { /* try to find symbol for this id; if found, it was already declared */
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym)
                              yyerror(yyscanner, lexer, "symbol '%s' is already declared", (yyvsp[(1) - (1)].sval));
                          (yyval.sval) = (yyvsp[(1) - (1)].sval);
                        ;}
    break;

  case 174:
#line 1249 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 175:
#line 1250 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 176:
#line 1254 "pir.y"
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

  case 177:
#line 1273 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 180:
#line 1285 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                              (yyval.invo) = (yyvsp[(4) - (8)].invo);
                            ;}
    break;

  case 181:
#line 1293 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 182:
#line 1295 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 183:
#line 1299 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 184:
#line 1301 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 185:
#line 1305 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 186:
#line 1309 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 187:
#line 1311 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 188:
#line 1314 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].expr)); ;}
    break;

  case 189:
#line 1318 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 190:
#line 1320 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 191:
#line 1324 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 192:
#line 1326 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 193:
#line 1330 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 194:
#line 1332 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 195:
#line 1336 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 196:
#line 1338 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 198:
#line 1346 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 199:
#line 1350 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ));
                             (yyval.invo) = (yyvsp[(3) - (3)].invo);
                           ;}
    break;

  case 200:
#line 1354 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL);
                             (yyval.invo) = (yyvsp[(1) - (1)].invo);
                           ;}
    break;

  case 203:
#line 1364 "pir.y"
    {
                             target *invocant;

                             /* if $1 is not a register, check whether the symbol was declared */
                             if (TEST_FLAG((yyvsp[(1) - (4)].targ)->flags, TARGET_FLAG_IS_REG)) {
                                invocant = (yyvsp[(1) - (4)].targ);
                             }
                             else { /* is not a register but a symbol */
                                 symbol *sym = find_symbol(lexer, target_name((yyvsp[(1) - (4)].targ)));
                                 if (sym == NULL)
                                     yyerror(yyscanner, lexer, "object '%s' not declared",
                                             target_name((yyvsp[(1) - (4)].targ)));

                                 else if (sym->type != PMC_TYPE)
                                     yyerror(yyscanner, lexer,
                                             "cannot invoke method: '%s' is not of type 'pmc'",
                                             target_name((yyvsp[(1) - (4)].targ)));

                                 /* get a target based on the symbol, it contains a register */
                                 invocant = target_from_symbol(lexer, sym);
                             }

                             (yyval.invo) = invoke(lexer, CALL_METHOD, invocant, (yyvsp[(3) - (4)].expr));
                             set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                           ;}
    break;

  case 204:
#line 1392 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 205:
#line 1399 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 206:
#line 1401 "pir.y"
    { (yyval.targ) = target_from_string(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 207:
#line 1405 "pir.y"
    { /* check that this identifier was declared */
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));

                             if (sym == NULL) {
                                yyerror(yyscanner, lexer,
                                        "method identifier '%s' not declared", (yyvsp[(1) - (1)].sval));
                                /* make sure sym is not NULL */
                                sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), PMC_TYPE);
                             }
                             else if (sym->type != PMC_TYPE && sym->type != STRING_TYPE)
                                 yyerror(yyscanner, lexer,
                                         "method '%s' must be of type 'pmc' or 'string'", (yyvsp[(1) - (1)].sval));

                             (yyval.expr) = expr_from_target(lexer, target_from_symbol(lexer, sym));
                           ;}
    break;

  case 208:
#line 1421 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 209:
#line 1423 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival))); ;}
    break;

  case 210:
#line 1425 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 211:
#line 1429 "pir.y"
    { (yyval.targ) = target_from_ident(lexer, PMC_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 212:
#line 1431 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 213:
#line 1436 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 214:
#line 1440 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 215:
#line 1442 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 216:
#line 1446 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 217:
#line 1448 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 218:
#line 1452 "pir.y"
    { (yyval.targ) = set_param_flag(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 219:
#line 1456 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 220:
#line 1458 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 221:
#line 1462 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 222:
#line 1464 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 223:
#line 1466 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 224:
#line 1468 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 225:
#line 1478 "pir.y"
    { convert_inv_to_instr(lexer, (yyvsp[(1) - (1)].invo)); ;}
    break;

  case 230:
#line 1488 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 231:
#line 1493 "pir.y"
    { /* was the invocation a method call? then it becomes a method tail
                               * call, otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                              (yyval.invo) = (yyvsp[(2) - (3)].invo);
                            ;}
    break;

  case 232:
#line 1504 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 233:
#line 1511 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 234:
#line 1515 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 235:
#line 1517 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 236:
#line 1521 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 237:
#line 1523 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 240:
#line 1531 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 241:
#line 1535 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 242:
#line 1539 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument(lexer, (yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 243:
#line 1545 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 244:
#line 1554 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 245:
#line 1561 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 246:
#line 1563 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 247:
#line 1568 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 248:
#line 1570 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 249:
#line 1575 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 250:
#line 1579 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 251:
#line 1581 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 252:
#line 1585 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 253:
#line 1587 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 254:
#line 1591 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 255:
#line 1596 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 256:
#line 1598 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 257:
#line 1602 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 258:
#line 1604 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 259:
#line 1611 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 260:
#line 1613 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 261:
#line 1617 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 265:
#line 1628 "pir.y"
    { store_global_constant(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 266:
#line 1632 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 267:
#line 1636 "pir.y"
    { (yyval.cval) = new_named_const(lexer, INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 268:
#line 1638 "pir.y"
    { (yyval.cval) = new_named_const(lexer, NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 269:
#line 1640 "pir.y"
    { (yyval.cval) = new_named_const(lexer, STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 270:
#line 1642 "pir.y"
    { (yyval.cval) = new_named_const(lexer, PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 271:
#line 1663 "pir.y"
    { (yyval.expr) = expr_from_target(lexer, (yyvsp[(1) - (1)].targ)); ;}
    break;

  case 272:
#line 1664 "pir.y"
    { (yyval.expr) = expr_from_const(lexer, (yyvsp[(1) - (1)].cval)); ;}
    break;

  case 273:
#line 1668 "pir.y"
    { (yyval.cval) = new_const(lexer, STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 274:
#line 1669 "pir.y"
    { (yyval.cval) = new_const(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 275:
#line 1670 "pir.y"
    { (yyval.cval) = new_const(lexer, NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 276:
#line 1673 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 277:
#line 1674 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 278:
#line 1675 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 279:
#line 1676 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 280:
#line 1677 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 281:
#line 1678 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 282:
#line 1681 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 283:
#line 1682 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 284:
#line 1683 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 285:
#line 1684 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 286:
#line 1692 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 288:
#line 1696 "pir.y"
    { /* a symbol must have been declared; check that at this point. */
                           symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                           if (sym == NULL) {
                               yyerror(yyscanner, lexer, "symbol '%s' not declared", (yyvsp[(1) - (1)].sval));

                                   /* make sure sym is not NULL */
                               sym = new_symbol(lexer, (yyvsp[(1) - (1)].sval), UNKNOWN_TYPE);
                           }
                           (yyval.targ) = target_from_symbol(lexer, sym);

                         ;}
    break;

  case 289:
#line 1709 "pir.y"
    { (yyval.targ) = new_reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 290:
#line 1710 "pir.y"
    { (yyval.targ) = new_reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 291:
#line 1711 "pir.y"
    { (yyval.targ) = new_reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 292:
#line 1712 "pir.y"
    { (yyval.targ) = new_reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 295:
#line 1720 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 296:
#line 1721 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 297:
#line 1722 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 298:
#line 1723 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 299:
#line 1724 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 300:
#line 1725 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 301:
#line 1726 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 302:
#line 1727 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 303:
#line 1730 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 304:
#line 1731 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 305:
#line 1732 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 306:
#line 1735 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 307:
#line 1736 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 308:
#line 1737 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 309:
#line 1738 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 310:
#line 1739 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 311:
#line 1740 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 312:
#line 1741 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 313:
#line 1742 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 314:
#line 1743 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 315:
#line 1744 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 316:
#line 1745 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 317:
#line 1746 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 318:
#line 1747 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 319:
#line 1748 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 320:
#line 1749 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 321:
#line 1750 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 322:
#line 1751 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 323:
#line 1752 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 324:
#line 1753 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 325:
#line 1754 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 326:
#line 1755 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 327:
#line 1756 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 328:
#line 1757 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 329:
#line 1763 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 330:
#line 1764 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 331:
#line 1765 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 332:
#line 1766 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 333:
#line 1767 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 334:
#line 1768 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 335:
#line 1769 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 336:
#line 1770 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 337:
#line 1771 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 338:
#line 1772 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 339:
#line 1773 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 340:
#line 1774 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4159 "pirparser.c"
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


#line 1777 "pir.y"


#include <math.h>
#include "parrot/oplib/ops.h"

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
            panic(yyget_extra(yyscanner), "detected 'inc' or 'dec' in fold_i_i()");
            break;
    }
    return new_const(yyget_extra(yyscanner), INT_TYPE, result);
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
            panic(yyget_extra(yyscanner), "detected 'inc' or 'dec' in fold_n_i()");
            break;
    }
    return new_const(yyget_extra(yyscanner), NUM_TYPE, result);
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
            panic(yyget_extra(yyscanner), "detected 'inc' or 'dec' in fold_i_n()");
            break;
    }
    return new_const(yyget_extra(yyscanner), NUM_TYPE, result);
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
    return new_const(yyget_extra(yyscanner), NUM_TYPE, result);
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
        case OP_CONCAT: {
            lexer_state *lexer = yyget_extra(yyscanner);
            return new_const(lexer, STRING_TYPE, concat_strings(lexer, a, b));
        }
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
            return new_const(yyget_extra(yyscanner), STRING_TYPE, a);

        case OP_ISEQ:
        case OP_ISLE:
        case OP_ISLT:
        case OP_ISGE:
        case OP_ISGT:
        case OP_ISNE:
            return new_const(yyget_extra(yyscanner), INT_TYPE, (1 == evaluate_s_s(a, op, b)));


        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            panic(yyget_extra(yyscanner), "detected 'inc' or 'dec' in fold_s_s()");
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
Note that C<strcmp()> should not be replaced by the C<STREQ> macro used throughout
Parrot source code; this function uses the result of C<strcmp()>.

=cut

*/
static int
evaluate_s_s(char * const a, pir_rel_operator op, char * const b) {
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
static int
evaluate_s(char * const s) {
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
evaluate_c(constant * const c)>

Evaluate a constant node in boolean context; if the constant is numeric,
it must be non-zero to be true; if it's a string, C<evaluate_s> is invoked
to evaluate the string.

=cut

*/
static int
evaluate_c(lexer_state * lexer, constant * const c) {
    switch (c->type) {
        case INT_TYPE:
            return (c->val.ival != 0);
        case NUM_TYPE:
            return (c->val.nval != 0);
        case STRING_TYPE:
            return evaluate_s(c->val.sval);
        case PMC_TYPE:
        case UNKNOWN_TYPE:
            panic(lexer, "impossible constant type in evaluate_c()");
            break;
    }
    return 0; /* keep compiler happy; will never happen. */
}

/*

=item C<static char *
concat_strings(char *a, char *b)>

Concatenates two strings into a new buffer. The new string is returned.

=cut

*/
static char *
concat_strings(lexer_state * lexer, char * a, char * b) {
    int strlen_a = strlen(a);
    char *newstr = (char *)pir_mem_allocate_zeroed(lexer, (strlen_a + strlen(b) + 1)
                                                          * sizeof (char));
    PARROT_ASSERT(newstr != NULL);
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
create_if_instr(yyscan_t yyscanner, lexer_state * const lexer, int invert, int hasnull,
                char * const name,
                char * const label)
{
    /* try to find the symbol; if it was declared it will be found; otherwise emit an error. */
    symbol *sym = find_symbol(lexer, name);
    if (sym == NULL) {
        yyerror(yyscanner, lexer, "symbol '%s' not declared'", name);
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


static void
reduce_strength(yyscan_t yyscanner, int newop) {
    lexer_state * const lexer = yyget_extra(yyscanner);
    instruction * instr = CURRENT_INSTRUCTION(lexer);

    /* based on the signatures, we know for sure that the
     * first and second operands are targets.
     */

    /* get the operands */
    expression *op1, *op2;
    get_operands(lexer, 2, &op1, &op2);

    /* check whether targets are equal */
    if (targets_equal(op1->expr.t, op2->expr.t)) {
        /* in that case, remove the second one */
        op1->next = op2->next;
    }

    instr->opinfo = &lexer->interp->op_info_table[newop];
    /* opinfo->full_name is a const char * ... */
    instr->opname = (char *)instr->opinfo->full_name;
    instr->opcode = newop;


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
    lexer_state * const lexer  = yyget_extra(yyscanner);
    char * const instr         = CURRENT_INSTRUCTION(lexer)->opname;
    int          op            = -1;
    int          num_operands;
    expression  *arg1          = NULL;
    expression  *arg2          = NULL;

    /* all interesting opcodes with three operands */
    switch (CURRENT_INSTRUCTION(lexer)->opcode) {
        case PARROT_OP_add_i_i_i:
            reduce_strength(yyscanner, PARROT_OP_add_i_i);
            break;
        case PARROT_OP_add_i_i_ic:
            reduce_strength(yyscanner, PARROT_OP_add_i_ic);
            break;
        case PARROT_OP_add_n_n_n:
            reduce_strength(yyscanner, PARROT_OP_add_n_n);
            break;
        case PARROT_OP_add_n_n_nc:
            reduce_strength(yyscanner, PARROT_OP_add_n_nc);
            break;

        case PARROT_OP_div_i_i_i:
            reduce_strength(yyscanner, PARROT_OP_div_i_i);
            break;
        case PARROT_OP_div_i_i_ic:
            reduce_strength(yyscanner, PARROT_OP_div_i_ic);
            break;
        case PARROT_OP_div_n_n_n:
            reduce_strength(yyscanner, PARROT_OP_div_n_n);
            break;
        case PARROT_OP_div_n_n_nc:
            reduce_strength(yyscanner, PARROT_OP_div_n_nc);
            break;

        case PARROT_OP_mul_i_i_i:
            reduce_strength(yyscanner, PARROT_OP_mul_i_i);
            break;
        case PARROT_OP_mul_i_i_ic:
            reduce_strength(yyscanner, PARROT_OP_mul_i_ic);
            break;
        case PARROT_OP_mul_n_n_n:
            reduce_strength(yyscanner, PARROT_OP_mul_n_n);
            break;
        case PARROT_OP_mul_n_n_nc:
            reduce_strength(yyscanner, PARROT_OP_mul_n_nc);
            break;

        case PARROT_OP_fdiv_i_i_i:
            reduce_strength(yyscanner, PARROT_OP_fdiv_i_i);
            break;
        case PARROT_OP_fdiv_i_i_ic:
            reduce_strength(yyscanner, PARROT_OP_fdiv_i_ic);
            break;
        case PARROT_OP_fdiv_n_n_n:
            reduce_strength(yyscanner, PARROT_OP_fdiv_n_n);
            break;
        case PARROT_OP_fdiv_n_n_nc:
            reduce_strength(yyscanner, PARROT_OP_fdiv_n_nc);
            break;

        case PARROT_OP_sub_i_i_i:
            reduce_strength(yyscanner, PARROT_OP_sub_i_i);
            break;
        case PARROT_OP_sub_i_i_ic:
            reduce_strength(yyscanner, PARROT_OP_sub_i_ic);
            break;
        case PARROT_OP_sub_n_n_n:
            reduce_strength(yyscanner, PARROT_OP_sub_n_n);
            break;
        case PARROT_OP_sub_n_n_nc:
            reduce_strength(yyscanner, PARROT_OP_sub_n_nc);
            break;
        default:
            return;
    }

    get_operands(lexer, 2, &arg1, &arg2);

    switch (CURRENT_INSTRUCTION(lexer)->opcode) {
        case PARROT_OP_add_i_ic:
            if (check_value(arg2->expr.c, 1)) {
                CURRENT_INSTRUCTION(lexer)->opcode = PARROT_OP_inc_i;
                arg1->next = arg2->next;
            }
            else if (check_value(arg2->expr.c, 0)) {
                CURRENT_INSTRUCTION(lexer)->opcode = PARROT_OP_noop;

            }
        case PARROT_OP_add_n_nc:


        case PARROT_OP_div_i_ic:
        case PARROT_OP_div_n_nc:

        case PARROT_OP_mul_i_ic:
        case PARROT_OP_mul_n_nc:

        case PARROT_OP_fdiv_i_ic:
        case PARROT_OP_fdiv_n_nc:

        case PARROT_OP_sub_i_ic:
        case PARROT_OP_sub_n_nc:

        default:
            return;
    }

    return;

    /* XXX what to do with these variants: ?
    switch (opcode) {


        case PARROT_OP_add_i_ic_i:
        case PARROT_OP_add_n_nc_n:

            op = OP_ADD;
            break;


        case PARROT_OP_div_i_ic_i:
        case PARROT_OP_div_i_ic_ic:

        case PARROT_OP_div_n_nc_n:
        case PARROT_OP_div_n_nc_nc:
            op = OP_DIV;
            break;


        case PARROT_OP_mul_i_ic_i:
        case PARROT_OP_mul_n_nc_n:

            op = OP_MUL;
            break;


        case PARROT_OP_fdiv_n_nc_n:
        case PARROT_OP_fdiv_i_ic_i:

            op = OP_FDIV;
            break;

        case PARROT_OP_sub_i_ic_i:
        case PARROT_OP_sub_n_nc_n:
            op = OP_SUB;
            break;
        default:
            return;
    }

    */

    /* clean up the rest of this function */
    num_operands = get_operand_count(lexer);


    /* try to convert a OP X, Y, Z into OP X, Z, iff X == Z */
    if (num_operands > 2) {
        /* get the operands */
        expression *op1, *op2;
        get_operands(lexer, 2, &op1, &op2);

        /* check whether operands are in fact targets */
        if ((op1->type == EXPR_TARGET) && (op2->type == EXPR_TARGET)) {

            /* check whether targets are equal */
            if (targets_equal(op1->expr.t, op2->expr.t)) {
                /* in that case, remove the second one */
                op1->next = op2->next;
                --num_operands;
            }
        }
    }

    /* don't even try to change "add $I0, 1" into "inc $I0" if number of operands is not 2 */
    if (num_operands != 2) {
        /*
        fprintf(stderr, "num_operands != 2\n");
        */
        return;
    }

    /*
    fprintf(stderr, "num_operands == 2\n");
    */

    get_operands(lexer, 2, &arg1, &arg2);
    PARROT_ASSERT(arg1);
    PARROT_ASSERT(arg2);

    /* XXX TODO: remove a lot of this code; we know the correct signature, so we know exactly
     * what's in each operand; including if it's a constant. If it is, do our little trick.
     */
    switch (op) {
        case OP_ADD:
        case OP_SUB:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0)) { /* add $I0, 0  --> <delete> */
                    update_instr(lexer, "noop");
                    remove_all_operands(lexer);
                }
                else if (check_value(arg2->expr.c, 1)) { /* add $I0, 1 --> inc $I0 */
                    update_instr(lexer, opnames[op + 1]);
                    arg1->next = arg2->next;
                }
            }
            break;
        case OP_MUL:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0)) {  /* mul $I0, 0 --> null $I0 */
                    update_instr(lexer, "null");

                    arg1->next = arg2->next;
                }
                else if (check_value(arg2->expr.c, 1)) { /* mul $I0, 1 --> <delete> */
                    update_instr(lexer, "noop");
                    remove_all_operands(lexer);
                }
            }
            break;
        case OP_DIV:
        case OP_FDIV:
            if (arg2->type == EXPR_CONSTANT) {
                if (check_value(arg2->expr.c, 0)) /* div $I0, 0 --> error */
                    pirerror(lexer, "cannot divide by 0");
                else if (check_value(arg2->expr.c, 1)) { /* div $I0, 1 --> <delete> */
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
check_first_arg_direction(yyscan_t yyscanner, char * const opname) {
    int dir_first_arg;
    lexer_state * const lexer = yyget_extra(yyscanner);

    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer));

    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer)->opinfo);

    /* op_count also counts the instruction itself, so must be at least 2 */
    PARROT_ASSERT(CURRENT_INSTRUCTION(lexer)->opinfo->op_count >= 2);

    /* get the direction of the first argument */
    dir_first_arg = CURRENT_INSTRUCTION(lexer)->opinfo->dirs[0];

    /* direction cannot be IN or INOUT */
    if (dir_first_arg == PARROT_ARGDIR_IN)
        yyerror(yyscanner, lexer, "cannot write first arg of op '%s' as a target "
                                  "(direction of argument is IN).", opname);

}

char *get_signatured_opname(lexer_state * const lexer, instruction * const instr);

/*

=item C<static int
get_opinfo(yyscan_t yyscanner)>



=cut

*/
static int
get_opinfo(yyscan_t yyscanner) {
    lexer_state * const lexer = yyget_extra(yyscanner);

    instruction * const instr = CURRENT_INSTRUCTION(lexer);

    char * const fullopname   = get_signatured_opname(lexer, instr);

    /* find the numeric opcode for the signatured op. */
    int opcode = lexer->interp->op_lib->op_code(fullopname, 1);

    /* if the op does not exist, emit an error message */
    if (opcode < 0) {
        yyerror(yyscanner, lexer, "'%s' is not a parrot op", fullopname);
        return FALSE;
    }

    /* store the opinfo, signatured opnmae and opcde in the current instruction */
    instr->opinfo = &lexer->interp->op_info_table[opcode];
    instr->opname = fullopname;
    instr->opcode = opcode;

    return TRUE;

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
static int
check_op_args_for_symbols(yyscan_t yyscanner) {
    lexer_state * const lexer = yyget_extra(yyscanner);
    struct   op_info_t * opinfo;
    short    i;
    short    opcount;
    unsigned num_operands;
    char    *fullopname;
    int      opcode;
    int      result;
    int      label_bitmask = 0; /* an int is at least 32 bits;
                                 * an op cannot have more than 8 operands, as defined in
                                 * include/parrot/op.h:18, so an int is good enough for
                                 * a bit mask to cover all operands.
                                 */

    /* iterate over all operands to set the type and PASM register on all target nodes, if any */
    num_operands = get_operand_count(lexer);
    for (i = 0; i < num_operands; i++) {
        expression *operand = get_operand(lexer, i + 1);
        if (operand->type == EXPR_TARGET) { /* if it is a target... */

            if (!TEST_FLAG(operand->expr.t->flags, TARGET_FLAG_IS_REG)) { /* not a register */
                symbol *sym = find_symbol(lexer, target_name(operand->expr.t));

                if (sym) { /* copy the type and PASM register from the symbol */
                    operand->expr.t->type  = sym->type;
                    operand->expr.t->color = sym->color;
                }
                else { /* it's not a declared symbol; for now assume it's a label */
                    if (operand->type == EXPR_TARGET) {
                        /* if it's not a register (otherwise, no need to check) */
                        if (!TEST_FLAG(operand->expr.t->flags, TARGET_FLAG_IS_REG)) {
                            /* convert the target to an identifier */
                            operand->expr.id = target_name(operand->expr.t);
                            operand->type    = EXPR_IDENT;

                            /* set a bit in the bitmask indicating it is assumed to be a label;
                             * this prevents us doing a symbol lookup in the second loop; a
                             * bitmask is faster. Note that i starts at 0, hence the "+ 1".
                             */
                            SET_BIT(label_bitmask, BIT(i + 1));
                        }
                    }
                }
            }
        }
    }


    /* make sure the current instruction gets a pointer to the relevant opinfo entry */
    result = get_opinfo(yyscanner);

    /* if failure, return false */
    if (result == FALSE)
        return FALSE;

    opinfo = CURRENT_INSTRUCTION(lexer)->opinfo;

    PARROT_ASSERT(opinfo);

    opcount = opinfo->op_count - 1; /* according to op.h, opcount also counts the op itself. */

    PARROT_ASSERT(opcount >= 0);

    for (i = 0; i < opcount; i++) {
        expression *operand = get_operand(lexer, i + 1);

        PARROT_ASSERT(operand);

        if (opinfo->labels[i] == 0) { /* operand i is NOT a LABEL */
             /* test the bitmask; if we expected this operand was a label, but now we found out
              * through opinfo that it's not supposed to be a label at this position, so emit
              * an error.
              */
             if (TEST_BIT(label_bitmask, BIT(i + 1))) {
                 PARROT_ASSERT(operand->type == EXPR_IDENT);
                 yyerror(yyscanner, lexer, "symbol '%s' is not declared", operand->expr.id);
                 return FALSE;
             }
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


