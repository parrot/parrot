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
     TK_BEGIN_YIELD = 274,
     TK_END_YIELD = 275,
     TK_BEGIN_RETURN = 276,
     TK_END_RETURN = 277,
     TK_BEGIN_CALL = 278,
     TK_END_CALL = 279,
     TK_GET_RESULTS = 280,
     TK_CALL = 281,
     TK_ARG = 282,
     TK_RESULT = 283,
     TK_NCI_CALL = 284,
     TK_LABEL = 285,
     TK_IDENT = 286,
     TK_INT = 287,
     TK_NUM = 288,
     TK_PMC = 289,
     TK_STRING = 290,
     TK_IF = 291,
     TK_UNLESS = 292,
     TK_NULL = 293,
     TK_GOTO = 294,
     TK_STRINGC = 295,
     TK_INTC = 296,
     TK_NUMC = 297,
     TK_PREG = 298,
     TK_NREG = 299,
     TK_SREG = 300,
     TK_IREG = 301,
     TK_ARROW = 302,
     TK_NE = 303,
     TK_EQ = 304,
     TK_LT = 305,
     TK_LE = 306,
     TK_GT = 307,
     TK_GE = 308,
     TK_USHIFT = 309,
     TK_RSHIFT = 310,
     TK_LSHIFT = 311,
     TK_FDIV = 312,
     TK_OR = 313,
     TK_AND = 314,
     TK_XOR = 315,
     TK_CONC = 316,
     TK_ASSIGN_USHIFT = 317,
     TK_ASSIGN_RSHIFT = 318,
     TK_ASSIGN_LSHIFT = 319,
     TK_ASSIGN_INC = 320,
     TK_ASSIGN_DEC = 321,
     TK_ASSIGN_MUL = 322,
     TK_ASSIGN_MOD = 323,
     TK_ASSIGN_POW = 324,
     TK_ASSIGN_DIV = 325,
     TK_ASSIGN_BOR = 326,
     TK_ASSIGN_BAND = 327,
     TK_ASSIGN_FDIV = 328,
     TK_ASSIGN_BNOT = 329,
     TK_ASSIGN_CONC = 330,
     TK_FLAG_INIT = 331,
     TK_FLAG_LOAD = 332,
     TK_FLAG_MAIN = 333,
     TK_FLAG_ANON = 334,
     TK_FLAG_METHOD = 335,
     TK_FLAG_OUTER = 336,
     TK_FLAG_VTABLE = 337,
     TK_FLAG_LEX = 338,
     TK_FLAG_MULTI = 339,
     TK_FLAG_POSTCOMP = 340,
     TK_FLAG_IMMEDIATE = 341,
     TK_FLAG_LEXID = 342,
     TK_INSTANCEOF = 343,
     TK_FLAG_UNIQUE_REG = 344,
     TK_FLAG_NAMED = 345,
     TK_FLAG_SLURPY = 346,
     TK_FLAG_FLAT = 347,
     TK_FLAG_OPTIONAL = 348,
     TK_FLAG_OPT_FLAG = 349,
     TK_FLAG_INVOCANT = 350
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
#define TK_BEGIN_YIELD 274
#define TK_END_YIELD 275
#define TK_BEGIN_RETURN 276
#define TK_END_RETURN 277
#define TK_BEGIN_CALL 278
#define TK_END_CALL 279
#define TK_GET_RESULTS 280
#define TK_CALL 281
#define TK_ARG 282
#define TK_RESULT 283
#define TK_NCI_CALL 284
#define TK_LABEL 285
#define TK_IDENT 286
#define TK_INT 287
#define TK_NUM 288
#define TK_PMC 289
#define TK_STRING 290
#define TK_IF 291
#define TK_UNLESS 292
#define TK_NULL 293
#define TK_GOTO 294
#define TK_STRINGC 295
#define TK_INTC 296
#define TK_NUMC 297
#define TK_PREG 298
#define TK_NREG 299
#define TK_SREG 300
#define TK_IREG 301
#define TK_ARROW 302
#define TK_NE 303
#define TK_EQ 304
#define TK_LT 305
#define TK_LE 306
#define TK_GT 307
#define TK_GE 308
#define TK_USHIFT 309
#define TK_RSHIFT 310
#define TK_LSHIFT 311
#define TK_FDIV 312
#define TK_OR 313
#define TK_AND 314
#define TK_XOR 315
#define TK_CONC 316
#define TK_ASSIGN_USHIFT 317
#define TK_ASSIGN_RSHIFT 318
#define TK_ASSIGN_LSHIFT 319
#define TK_ASSIGN_INC 320
#define TK_ASSIGN_DEC 321
#define TK_ASSIGN_MUL 322
#define TK_ASSIGN_MOD 323
#define TK_ASSIGN_POW 324
#define TK_ASSIGN_DIV 325
#define TK_ASSIGN_BOR 326
#define TK_ASSIGN_BAND 327
#define TK_ASSIGN_FDIV 328
#define TK_ASSIGN_BNOT 329
#define TK_ASSIGN_CONC 330
#define TK_FLAG_INIT 331
#define TK_FLAG_LOAD 332
#define TK_FLAG_MAIN 333
#define TK_FLAG_ANON 334
#define TK_FLAG_METHOD 335
#define TK_FLAG_OUTER 336
#define TK_FLAG_VTABLE 337
#define TK_FLAG_LEX 338
#define TK_FLAG_MULTI 339
#define TK_FLAG_POSTCOMP 340
#define TK_FLAG_IMMEDIATE 341
#define TK_FLAG_LEXID 342
#define TK_INSTANCEOF 343
#define TK_FLAG_UNIQUE_REG 344
#define TK_FLAG_NAMED 345
#define TK_FLAG_SLURPY 346
#define TK_FLAG_FLAT 347
#define TK_FLAG_OPTIONAL 348
#define TK_FLAG_OPT_FLAG 349
#define TK_FLAG_INVOCANT 350




/* Copy the first part of user declarations.  */
#line 1 "pir.y"


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
#line 176 "pir.y"
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
#line 475 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 488 "pirparser.c"

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
#define YYLAST   721

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  114
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  121
/* YYNRULES -- Number of rules.  */
#define YYNRULES  309
/* YYNRULES -- Number of states.  */
#define YYNSTATES  484

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   351

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   105,     2,     2,     2,   110,   112,     2,
     100,   101,   109,   107,   102,   104,   103,   108,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    99,
       2,    96,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    97,     2,    98,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   111,     2,   106,     2,     2,     2,
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
      95,   113
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    31,    34,    39,    44,    45,    47,
      49,    53,    55,    62,    65,    67,    69,    70,    73,    75,
      77,    79,    81,    83,    85,    87,    89,    91,    96,    99,
     102,   105,   107,   109,   111,   112,   115,   120,   123,   124,
     127,   129,   131,   136,   137,   140,   141,   144,   147,   150,
     152,   154,   156,   158,   160,   162,   164,   166,   168,   170,
     172,   174,   176,   178,   181,   185,   189,   192,   195,   197,
     198,   200,   202,   204,   208,   212,   214,   216,   218,   221,
     225,   227,   231,   234,   238,   242,   246,   250,   254,   259,
     262,   265,   269,   273,   277,   281,   285,   289,   293,   297,
     300,   306,   312,   318,   324,   330,   336,   342,   348,   354,
     359,   364,   369,   374,   379,   384,   389,   394,   399,   404,
     409,   414,   419,   423,   425,   427,   429,   431,   435,   440,
     442,   446,   449,   451,   452,   454,   460,   462,   464,   473,
     474,   476,   478,   481,   485,   489,   492,   498,   499,   502,
     503,   505,   507,   510,   514,   516,   519,   523,   527,   529,
     531,   533,   538,   541,   543,   545,   547,   549,   551,   553,
     555,   557,   561,   562,   564,   566,   570,   573,   574,   577,
     579,   581,   583,   585,   588,   590,   592,   594,   596,   600,
     604,   608,   612,   613,   615,   617,   621,   623,   625,   629,
     632,   634,   640,   646,   647,   649,   651,   654,   658,   659,
     661,   663,   666,   670,   671,   674,   676,   679,   680,   682,
     686,   689,   691,   693,   696,   699,   704,   709,   714,   719,
     721,   723,   725,   727,   729,   731,   733,   735,   737,   739,
     741,   743,   745,   747,   749,   751,   753,   755,   757,   759,
     761,   763,   765,   767,   769,   771,   773,   775,   777,   779,
     781,   783,   785,   787,   789,   791,   793,   795,   797,   799,
     801,   803,   805,   807,   809,   811,   813,   815,   817,   819,
     821,   823,   825,   827,   829,   831,   833,   835,   837,   839,
     841,   843,   845,   847,   849,   851,   853,   855,   857,   859
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     115,     0,    -1,   116,   117,   116,    -1,    -1,     3,    -1,
     118,    -1,   117,     3,   118,    -1,   126,    -1,   220,    -1,
     122,    -1,   120,    -1,   121,    -1,   119,    -1,     6,    40,
      -1,     4,    40,    -1,     5,    40,    96,    40,    -1,    12,
      97,   123,    98,    -1,    -1,   124,    -1,   125,    -1,   124,
      99,   125,    -1,    40,    -1,   127,   129,     3,   132,   138,
       8,    -1,     7,   128,    -1,   229,    -1,    40,    -1,    -1,
     129,   130,    -1,    79,    -1,    76,    -1,    77,    -1,    78,
      -1,    80,    -1,    83,    -1,    85,    -1,    86,    -1,    84,
      -1,    81,   100,   128,   101,    -1,    82,   216,    -1,    87,
     217,    -1,    88,   217,    -1,   229,    -1,    40,    -1,   154,
      -1,    -1,   132,   133,    -1,     9,   134,   135,     3,    -1,
     226,   229,    -1,    -1,   135,   136,    -1,   194,    -1,   137,
      -1,    95,   100,   131,   101,    -1,    -1,   138,   139,    -1,
      -1,   140,   141,    -1,    30,     3,    -1,    30,   142,    -1,
     142,    -1,   159,    -1,   164,    -1,   165,    -1,   170,    -1,
     218,    -1,   195,    -1,   196,    -1,   171,    -1,   156,    -1,
     146,    -1,   145,    -1,   144,    -1,   143,    -1,     1,     3,
      -1,    38,   227,     3,    -1,    25,   189,     3,    -1,   147,
       3,    -1,   148,   149,    -1,    31,    -1,    -1,   150,    -1,
     151,    -1,   152,    -1,   150,   102,   152,    -1,   154,    96,
     223,    -1,   223,    -1,   154,    -1,   153,    -1,   188,   154,
      -1,    97,   155,    98,    -1,   223,    -1,   155,    99,   223,
      -1,   157,     3,    -1,   227,    96,   223,    -1,   227,    96,
     158,    -1,   227,    96,   153,    -1,   227,   233,   223,    -1,
     227,   234,   223,    -1,   227,    96,   231,   223,    -1,   230,
     151,    -1,    43,   151,    -1,    41,   232,   227,    -1,    42,
     232,   227,    -1,    40,   232,   227,    -1,    40,   232,    40,
      -1,    41,   232,    41,    -1,    42,   232,    42,    -1,    41,
     232,    42,    -1,    42,   232,    41,    -1,   160,     3,    -1,
     162,    38,    31,    39,   229,    -1,   162,    38,    32,    39,
     229,    -1,   162,    38,    33,    39,   229,    -1,   162,    38,
      34,    39,   229,    -1,   162,    38,    35,    39,   229,    -1,
     162,    38,    36,    39,   229,    -1,   162,    38,    37,    39,
     229,    -1,   162,    38,    39,    39,   229,    -1,   162,    38,
      38,    39,   229,    -1,   162,   224,   163,   229,    -1,   162,
      31,   163,   229,    -1,   162,    32,   163,   229,    -1,   162,
      33,   163,   229,    -1,   162,    34,   163,   229,    -1,   162,
      35,   163,   229,    -1,   162,    36,   163,   229,    -1,   162,
      37,   163,   229,    -1,   162,    39,    39,   229,    -1,   162,
      38,    39,   229,    -1,   162,    39,   102,   229,    -1,   162,
      38,   102,   229,    -1,   162,   161,    39,   229,    -1,   223,
     225,   223,    -1,    36,    -1,    37,    -1,    39,    -1,   102,
      -1,    39,   229,     3,    -1,    11,   226,   166,     3,    -1,
     167,    -1,   166,   102,   167,    -1,   168,   169,    -1,   229,
      -1,    -1,    89,    -1,    10,    40,   102,   188,     3,    -1,
     172,    -1,   181,    -1,    23,     3,   173,   176,     3,   178,
      24,     3,    -1,    -1,   174,    -1,   175,    -1,   174,   175,
      -1,    27,   204,     3,    -1,    26,   188,   177,    -1,    29,
     188,    -1,    13,   188,     3,    14,   187,    -1,    -1,   102,
     188,    -1,    -1,   179,    -1,   180,    -1,   179,   180,    -1,
      28,   192,     3,    -1,   165,    -1,   182,     3,    -1,   189,
      96,   183,    -1,   227,    96,   183,    -1,   183,    -1,   185,
      -1,   184,    -1,   188,   103,   187,   199,    -1,   186,   199,
      -1,   188,    -1,    40,    -1,   229,    -1,    43,    -1,    45,
      -1,    40,    -1,   229,    -1,    43,    -1,   100,   190,   101,
      -1,    -1,   191,    -1,   192,    -1,   191,   102,   192,    -1,
     227,   193,    -1,    -1,   193,   194,    -1,    93,    -1,    94,
      -1,    91,    -1,    89,    -1,    90,   216,    -1,   197,    -1,
     206,    -1,   198,    -1,   207,    -1,    17,   199,     3,    -1,
      17,   183,     3,    -1,    18,   199,     3,    -1,   100,   200,
     101,    -1,    -1,   201,    -1,   202,    -1,   201,   102,   202,
      -1,   204,    -1,   203,    -1,    40,    47,   205,    -1,   205,
     214,    -1,   223,    -1,    21,     3,   211,    22,     3,    -1,
      19,     3,   208,    20,     3,    -1,    -1,   209,    -1,   210,
      -1,   209,   210,    -1,    18,   204,     3,    -1,    -1,   212,
      -1,   213,    -1,   212,   213,    -1,    17,   204,     3,    -1,
      -1,   214,   215,    -1,    92,    -1,    90,   216,    -1,    -1,
     217,    -1,   100,    40,   101,    -1,   219,     3,    -1,   220,
      -1,   221,    -1,    16,   222,    -1,    15,   222,    -1,    32,
     229,    96,    41,    -1,    33,   229,    96,    42,    -1,    35,
     229,    96,    40,    -1,    34,   229,    96,    40,    -1,   227,
      -1,   224,    -1,    40,    -1,    41,    -1,    42,    -1,    48,
      -1,    49,    -1,    50,    -1,    51,    -1,    53,    -1,    52,
      -1,    32,    -1,    33,    -1,    34,    -1,    35,    -1,   228,
      -1,    43,    -1,    44,    -1,    46,    -1,    45,    -1,   229,
      -1,    31,    -1,   230,    -1,    36,    -1,    37,    -1,    39,
      -1,    32,    -1,    33,    -1,    35,    -1,    34,    -1,    38,
      -1,   104,    -1,   105,    -1,   106,    -1,   107,    -1,   104,
      -1,   108,    -1,   109,    -1,   110,    -1,   111,    -1,   112,
      -1,   106,    -1,   113,    -1,    61,    -1,    54,    -1,    55,
      -1,    56,    -1,    58,    -1,    59,    -1,    57,    -1,    60,
      -1,    49,    -1,    51,    -1,    50,    -1,    53,    -1,    52,
      -1,    48,    -1,    67,    -1,    68,    -1,    69,    -1,    70,
      -1,    73,    -1,    71,    -1,    72,    -1,    74,    -1,    75,
      -1,    63,    -1,    64,    -1,    62,    -1,    65,    -1,    66,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   421,   421,   426,   427,   430,   431,   434,   435,   436,
     437,   438,   439,   442,   448,   452,   456,   461,   462,   466,
     468,   472,   476,   482,   486,   487,   490,   491,   494,   496,
     498,   500,   502,   504,   506,   508,   510,   512,   514,   516,
     518,   522,   523,   524,   527,   528,   531,   534,   539,   540,
     544,   545,   548,   554,   555,   559,   559,   563,   565,   567,
     570,   571,   572,   573,   574,   575,   576,   577,   578,   579,
     580,   581,   582,   586,   596,   600,   604,   607,   610,   615,
     620,   626,   629,   630,   633,   657,   659,   661,   665,   672,
     676,   678,   683,   729,   730,   731,   732,   733,   734,   735,
     736,   764,   766,   768,   770,   772,   774,   776,   778,   793,
     796,   797,   798,   799,   800,   801,   802,   803,   804,   805,
     806,   807,   808,   809,   810,   811,   812,   813,   814,   815,
     816,   817,   843,   850,   851,   854,   855,   858,   862,   866,
     868,   872,   876,   880,   881,   884,   891,   892,   895,   907,
     908,   912,   914,   918,   922,   924,   926,   932,   933,   938,
     939,   943,   945,   949,   951,   955,   959,   961,   963,   967,
     968,   971,   978,   985,   987,   991,  1007,  1009,  1011,  1015,
    1028,  1033,  1038,  1039,  1043,  1045,  1049,  1054,  1055,  1059,
    1061,  1063,  1065,  1067,  1077,  1078,  1081,  1082,  1085,  1090,
    1097,  1104,  1109,  1110,  1114,  1116,  1120,  1121,  1124,  1128,
    1132,  1136,  1145,  1155,  1156,  1161,  1163,  1168,  1173,  1174,
    1178,  1180,  1184,  1190,  1191,  1195,  1197,  1205,  1206,  1210,
    1214,  1217,  1218,  1221,  1225,  1229,  1231,  1233,  1235,  1252,
    1253,  1257,  1258,  1259,  1262,  1263,  1264,  1265,  1266,  1267,
    1270,  1271,  1272,  1273,  1281,  1284,  1285,  1286,  1287,  1288,
    1301,  1302,  1305,  1306,  1307,  1308,  1309,  1310,  1311,  1312,
    1315,  1316,  1317,  1320,  1321,  1322,  1323,  1324,  1325,  1326,
    1327,  1328,  1329,  1330,  1331,  1332,  1333,  1334,  1335,  1336,
    1337,  1338,  1339,  1340,  1341,  1342,  1348,  1349,  1350,  1351,
    1352,  1353,  1354,  1355,  1356,  1357,  1358,  1359,  1362,  1363
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
  "\".begin_yield\"", "\".end_yield\"", "\".begin_return\"",
  "\".end_return\"", "\".begin_call\"", "\".end_call\"",
  "\".get_results\"", "\".call\"", "\".arg\"", "\".result\"",
  "\".nci_call\"", "\"label\"", "\"identifier\"", "\"int\"", "\"num\"",
  "\"pmc\"", "\"string\"", "\"if\"", "\"unless\"", "\"null\"", "\"goto\"",
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
  "namespace_slice", "sub_def", "sub_head", "sub_id", "sub_flags",
  "sub_flag", "multi_type", "parameters", "parameter", "param",
  "param_flags", "param_flag", "invocant_param", "instructions",
  "instruction", "@1", "instr", "statement", "error_stat", "null_stat",
  "getresults_stat", "parrot_stat", "parrot_instruction", "parrot_op",
  "opt_op_args", "parrot_op_args", "keylist_assignment", "op_arg",
  "keyaccess", "keylist", "keys", "assignment_stat", "assignment",
  "binary_expr", "conditional_stat", "conditional_instr", "condition",
  "if_unless", "then", "goto_stat", "local_decl", "local_id_list",
  "local_id", "local_var_name", "has_unique_reg", "lex_decl",
  "invocation_stat", "long_invocation_stat", "opt_long_arguments",
  "long_arguments", "long_argument", "long_invocation", "opt_ret_cont",
  "opt_long_results", "long_results", "long_result",
  "short_invocation_stat", "short_invocation", "simple_invocation",
  "methodcall", "subcall", "sub", "method", "pmc_object",
  "opt_target_list", "opt_list", "target_list", "result_target",
  "target_flags", "target_flag", "return_stat", "yield_stat",
  "short_return_stat", "short_yield_stat", "arguments",
  "opt_arguments_list", "arguments_list", "argument", "named_arg",
  "short_arg", "arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "expression", "constant", "rel_op", "type", "target",
  "symbol", "identifier", "keyword", "unop", "binop", "augmented_op",
  "augm_add_op", 0
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
     345,   346,   347,   348,   349,   350,    61,    91,    93,    59,
      40,    41,    44,    46,    45,    33,   126,    43,    47,    42,
      37,   124,    38,   351
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   114,   115,   116,   116,   117,   117,   118,   118,   118,
     118,   118,   118,   119,   120,   121,   122,   123,   123,   124,
     124,   125,   126,   127,   128,   128,   129,   129,   130,   130,
     130,   130,   130,   130,   130,   130,   130,   130,   130,   130,
     130,   131,   131,   131,   132,   132,   133,   134,   135,   135,
     136,   136,   137,   138,   138,   140,   139,   141,   141,   141,
     142,   142,   142,   142,   142,   142,   142,   142,   142,   142,
     142,   142,   142,   143,   144,   145,   146,   147,   148,   149,
     149,   149,   150,   150,   151,   152,   152,   152,   153,   154,
     155,   155,   156,   157,   157,   157,   157,   157,   157,   157,
     157,   158,   158,   158,   158,   158,   158,   158,   158,   159,
     160,   160,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   160,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   160,   161,   162,   162,   163,   163,   164,   165,   166,
     166,   167,   168,   169,   169,   170,   171,   171,   172,   173,
     173,   174,   174,   175,   176,   176,   176,   177,   177,   178,
     178,   179,   179,   180,   180,   181,   182,   182,   182,   183,
     183,   184,   185,   186,   186,   187,   187,   187,   187,   188,
     188,   189,   190,   190,   191,   191,   192,   193,   193,   194,
     194,   194,   194,   194,   195,   195,   196,   196,   197,   197,
     198,   199,   200,   200,   201,   201,   202,   202,   203,   204,
     205,   206,   207,   208,   208,   209,   209,   210,   211,   211,
     212,   212,   213,   214,   214,   215,   215,   216,   216,   217,
     218,   219,   219,   220,   221,   222,   222,   222,   222,   223,
     223,   224,   224,   224,   225,   225,   225,   225,   225,   225,
     226,   226,   226,   226,   227,   228,   228,   228,   228,   228,
     229,   229,   230,   230,   230,   230,   230,   230,   230,   230,
     231,   231,   231,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   233,   233,   233,   234,   234
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     2,     2,     4,     4,     0,     1,     1,
       3,     1,     6,     2,     1,     1,     0,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     2,     2,
       2,     1,     1,     1,     0,     2,     4,     2,     0,     2,
       1,     1,     4,     0,     2,     0,     2,     2,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     2,     3,     3,     2,     2,     1,     0,
       1,     1,     1,     3,     3,     1,     1,     1,     2,     3,
       1,     3,     2,     3,     3,     3,     3,     3,     4,     2,
       2,     3,     3,     3,     3,     3,     3,     3,     3,     2,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     4,
       4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     3,     1,     1,     1,     1,     3,     4,     1,
       3,     2,     1,     0,     1,     5,     1,     1,     8,     0,
       1,     1,     2,     3,     3,     2,     5,     0,     2,     0,
       1,     1,     2,     3,     1,     2,     3,     3,     1,     1,
       1,     4,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     0,     1,     1,     3,     2,     0,     2,     1,
       1,     1,     1,     2,     1,     1,     1,     1,     3,     3,
       3,     3,     0,     1,     1,     3,     1,     1,     3,     2,
       1,     5,     5,     0,     1,     1,     2,     3,     0,     1,
       1,     2,     3,     0,     2,     1,     2,     0,     1,     3,
       2,     1,     1,     2,     2,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     3,     5,    12,    10,    11,     9,     7,    26,     8,
      14,     0,    13,   260,   265,   266,   268,   267,   262,   263,
     269,   264,    25,    23,    24,   261,    17,     0,     0,     0,
       0,   233,     4,     2,     0,     0,    21,     0,    18,    19,
       0,     0,     0,     0,     6,    44,    29,    30,    31,    28,
      32,     0,   227,    33,    36,    34,    35,     0,     0,    27,
      15,    16,     0,     0,     0,     0,     0,    53,     0,     0,
      38,   228,    39,    40,    20,   235,   236,   238,   237,     0,
      45,    55,     0,     0,   250,   251,   252,   253,    48,     0,
      22,    54,     0,    37,   229,     0,    47,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,   262,
     263,   269,   264,   174,   255,   256,   258,   257,   182,    56,
      59,    72,    71,    70,    69,     0,    79,    68,     0,    60,
       0,     0,    61,    62,    63,    67,   146,   147,     0,   168,
     170,   169,     0,   173,     0,    65,    66,   194,   196,   195,
     197,    64,     0,   231,   232,     0,   254,   259,   261,    46,
     192,   227,   191,   189,   190,     0,    49,    51,    50,    73,
       0,     0,   234,   180,   202,     0,     0,   179,     0,   213,
     218,   149,     0,    57,    58,   255,     0,   259,     0,     0,
     100,     0,     0,   183,   184,   187,    76,   241,   242,   243,
     180,    77,    80,    81,    82,    87,    86,     0,    85,   240,
     239,    92,   109,   260,   265,   266,   268,   267,   262,   263,
     269,   264,     0,     0,   240,   165,   172,     0,     0,   230,
     307,   305,   306,   308,   309,   296,   297,   298,   299,   301,
     302,   300,   303,   304,     0,     0,     0,    99,   193,     0,
       0,     0,   139,   143,   142,   241,     0,   203,   204,   207,
     206,   223,   210,   199,   198,   200,     0,     0,   214,   215,
       0,     0,   219,   220,     0,     0,   150,   151,    75,    74,
     137,     0,    90,     0,   181,     0,   186,     0,    88,   135,
     136,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   244,   245,   246,   247,   249,   248,     0,     0,   178,
     176,   177,     0,   175,   166,   174,   242,   243,   270,   271,
     272,    95,    94,   167,   173,    93,     0,    96,    97,    42,
       0,    43,    41,     0,   138,     0,   144,   141,     0,   201,
       0,   209,     0,     0,   216,     0,     0,   221,     0,     0,
       0,     0,     0,   152,    89,     0,    84,   185,   188,    83,
      86,   120,   121,   122,   123,   124,   125,   126,     0,     0,
       0,     0,     0,     0,     0,     0,   264,   128,   130,   127,
     129,   131,   132,   119,   171,   295,   290,   292,   291,   294,
     293,   283,   284,   285,   288,   286,   287,   289,   282,   274,
     280,   273,   275,   276,   277,   278,   279,   281,     0,     0,
       0,    98,    52,   145,   140,   208,   205,   227,   225,   224,
     217,   212,   222,   211,   153,     0,   157,   155,   159,    91,
     110,   111,   112,   113,   114,   115,   116,   118,   117,   104,
     103,   105,   107,   101,   108,   106,   102,   226,     0,     0,
     154,     0,   164,     0,   160,   161,     0,   158,     0,     0,
     162,   156,   163,   148
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    47,
      48,    49,    17,    18,    33,    44,    69,   350,    77,    90,
      98,   105,   176,   177,    91,   101,   102,   129,   130,   131,
     132,   133,   134,   135,   136,   211,   212,   200,   214,   215,
     201,   291,   137,   138,   342,   139,   140,   232,   141,   301,
     142,   143,   261,   262,   263,   357,   144,   145,   146,   285,
     286,   287,   372,   470,   473,   474,   475,   147,   148,   149,
     150,   151,   152,   332,   153,   154,   202,   203,   204,   296,
     178,   155,   156,   157,   158,   186,   266,   267,   268,   269,
     270,   271,   159,   160,   277,   278,   279,   281,   282,   283,
     361,   439,    80,    81,   161,   162,    19,   164,    41,   272,
     219,   327,    99,   220,   166,   197,    35,   346,   428,   255,
     256
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -432
static const yytype_int16 yypact[] =
{
      51,  -432,    65,   165,  -432,    50,    59,    72,   480,   -14,
     -10,   115,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,    23,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,    85,   305,   305,   305,
     305,  -432,   165,  -432,   272,    87,  -432,    31,    32,  -432,
      42,    44,    57,    62,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,    60,    64,  -432,  -432,  -432,  -432,    64,    64,  -432,
    -432,  -432,    85,    98,   117,   122,   126,   158,   480,   134,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   199,
    -432,   167,    75,    77,  -432,  -432,  -432,  -432,  -432,   305,
    -432,  -432,    41,  -432,  -432,     7,  -432,   176,   140,   199,
     -10,   245,    93,   193,   208,   209,   113,   388,   459,   546,
     567,   111,   305,  -432,   -82,  -432,  -432,  -432,   111,  -432,
    -432,  -432,  -432,  -432,  -432,   223,   438,  -432,   224,  -432,
     235,   583,  -432,  -432,  -432,  -432,  -432,  -432,   236,  -432,
    -432,  -432,    93,   137,   145,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,   239,  -432,  -432,   501,  -432,   -50,   147,  -432,
    -432,    64,  -432,  -432,  -432,   148,  -432,  -432,  -432,  -432,
     143,   305,  -432,  -432,   599,   244,   247,  -432,   251,   253,
     255,   243,   271,  -432,  -432,  -432,   283,  -432,   284,   615,
    -432,   194,   190,   204,  -432,  -432,  -432,  -432,  -432,  -432,
       8,  -432,   205,  -432,  -432,  -432,   194,   147,  -432,  -432,
    -432,  -432,  -432,   -20,   -20,   -20,   -20,   -20,   -20,   -20,
       2,   -13,   274,   252,   -20,  -432,  -432,   663,   678,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,   404,   615,   615,  -432,  -432,   152,
     185,     9,  -432,   203,  -432,   267,   214,   215,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,   615,   296,   253,  -432,
     615,   297,   255,  -432,   615,    79,   243,  -432,  -432,  -432,
    -432,   -30,  -432,   615,  -432,   111,    43,   438,  -432,  -432,
    -432,   305,   305,   305,   305,   305,   305,   305,   279,   282,
     285,   286,   287,   291,   292,   293,   340,   305,   305,   305,
     305,  -432,  -432,  -432,  -432,  -432,  -432,   615,   305,  -432,
    -432,  -432,    93,  -432,  -432,   149,   441,   441,  -432,  -432,
    -432,  -432,  -432,  -432,   -48,  -432,   615,  -432,  -432,  -432,
     221,  -432,  -432,   320,  -432,   305,  -432,  -432,   615,  -432,
     599,     3,   330,   331,  -432,   343,   361,  -432,   362,   185,
     185,   185,   363,  -432,  -432,   615,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   305,   305,
     305,   305,   305,   305,   305,   305,   305,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   647,   421,
     631,  -432,  -432,  -432,  -432,  -432,  -432,    64,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,   364,   266,  -432,    33,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   355,   185,
    -432,   111,  -432,   366,    33,  -432,   663,  -432,   389,   390,
    -432,  -432,  -432,  -432
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -432,  -432,   383,  -432,   353,  -432,  -432,  -432,  -432,  -432,
    -432,   324,  -432,  -432,   319,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   295,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -122,   103,   154,
    -129,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,    39,
    -432,  -431,  -432,    46,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,   116,  -432,  -432,  -432,  -432,   -64,  -432,  -432,  -103,
    -432,  -432,  -432,   -62,  -134,   299,  -432,  -432,  -289,  -432,
     120,  -432,  -432,  -432,  -432,  -107,  -432,  -432,    58,  -432,
    -163,    71,  -432,  -432,  -432,  -432,   139,  -432,  -432,   169,
    -432,  -432,  -168,    48,  -432,  -432,   -89,  -432,   375,  -132,
     289,  -432,   377,  -101,  -432,    -8,   -54,  -432,  -230,  -432,
    -432
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -261
static const yytype_int16 yytable[] =
{
      34,   165,   217,   258,   218,   188,   377,   216,   185,   233,
     169,  -255,   354,   163,   213,   199,   165,   472,  -180,   299,
     196,  -180,    37,    38,    39,    40,   318,   205,   163,    50,
      51,    52,    53,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   107,   472,   109,   236,   257,  -179,   168,   199,
    -179,   108,   109,  -179,     1,   237,   110,    10,   111,   112,
     113,   471,   114,   168,   115,     4,   116,   292,   374,   375,
      34,   117,   118,    24,    25,    26,    27,   119,   120,   121,
     122,   123,   300,    36,   124,   125,   126,   127,   298,   319,
      20,   106,   369,   437,   167,   438,   170,   171,   172,    21,
     173,   174,   175,   187,   317,   370,   429,   430,   371,   167,
    -255,   355,    22,   362,   198,    82,    83,   365,    42,    45,
     344,   368,   345,   347,   348,    46,   353,    70,   167,    71,
     351,    72,   170,   171,   172,   334,   173,   174,    73,    85,
      74,   128,    23,    24,    25,    26,    27,    28,    29,    30,
      31,   343,  -241,    75,   195,   125,   126,   127,    76,    86,
      78,   376,    87,   217,    79,   218,    88,    89,   380,     5,
       6,     7,     8,   264,    93,   100,   103,     9,   104,   179,
     180,    10,   478,    23,    24,    25,    26,    27,    28,    29,
      30,    31,   349,   184,   205,   402,   189,   405,   406,   407,
     408,   409,   410,   411,   412,   413,   414,   415,   416,   417,
     418,   190,   191,   128,   431,   298,    23,    24,    25,    26,
      27,    28,    29,    30,    31,   404,   206,   221,   183,   333,
     187,    94,    95,    96,    97,   445,   446,   447,   222,   235,
     237,   238,   239,   449,   199,   260,   167,   273,   259,   199,
     274,   352,   187,   419,   275,   420,   421,   422,   423,   424,
     425,   426,   427,   302,   303,   304,   305,   306,   307,   467,
     284,   276,   280,   328,   288,    55,    23,    24,    25,    26,
      27,    28,    29,    30,    31,   123,   289,   290,   183,   167,
     293,   294,   356,   381,   382,   383,   384,   385,   386,   387,
     321,   322,   323,   324,   325,   326,   295,   297,   397,   398,
     399,   400,   401,   320,   358,   359,   363,   360,   388,   366,
     403,   389,   432,   433,   390,   391,   392,   460,   463,   466,
     393,   394,   395,   440,   441,   477,    23,    24,    25,    26,
      27,    28,    29,    30,    31,   184,   442,   264,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,   187,   187,   187,   443,   444,   448,   468,   469,   476,
     205,    23,    24,    25,    26,    27,    28,    29,    30,   396,
     450,   451,   452,   453,   454,   455,   456,   457,   458,   107,
     479,   193,   482,   483,    43,    54,    84,    92,   108,   109,
     379,   434,   373,   110,    10,   111,   112,   113,   341,   114,
     480,   115,   194,   116,   481,   192,   378,   364,   436,   118,
      24,    25,    26,    27,   119,   120,   121,   122,   123,   435,
     234,   124,   125,   126,   127,    23,    24,    25,    26,    27,
      28,    29,    30,    31,   335,   336,   337,   210,   125,   126,
     127,   367,    23,    24,    25,    26,    27,    28,    29,    30,
      31,   187,   461,   462,   195,   125,   126,   127,   333,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   207,   208,
     209,   210,   125,   126,   127,   182,   181,     0,   128,   405,
     406,   407,   408,   409,   410,   411,   412,   413,   414,   415,
     416,   417,   418,     0,     0,     0,     0,     0,   338,   339,
     340,    23,    24,    25,    26,    27,    28,    29,    30,    31,
      32,  -260,  -260,  -260,  -260,  -260,  -260,  -260,  -260,  -260,
    -260,  -260,  -260,  -260,  -260,   199,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   419,     0,   420,   421,   422,
     423,   424,   425,   426,   427,  -260,     0,     0,     0,  -260,
       0,     0,  -260,   240,   241,   242,   243,   244,   245,   246,
     247,   248,   249,   250,   251,   252,   253,  -133,  -133,  -133,
    -133,  -133,  -133,  -133,  -133,  -133,  -133,  -133,  -133,  -133,
    -133,  -133,  -133,     0,     0,     0,     0,   254,  -134,  -134,
    -134,  -134,  -134,  -134,  -134,  -134,  -134,  -134,  -134,  -134,
    -134,  -134,  -134,  -134,   223,   224,   225,   226,   227,   228,
     229,   230,   231,   207,   208,   209,   195,   125,   126,   127,
      23,    24,    25,    26,    27,    28,    29,    30,    31,   265,
     208,   209,   195,   125,   126,   127,    23,    24,    25,    26,
      27,    28,    29,    30,    31,   207,   208,   209,   195,   125,
     126,   127,    23,    24,    25,    26,    27,    28,    29,    30,
      31,     0,   464,   465,   195,   125,   126,   127,    23,    24,
      25,    26,    27,    28,    29,    30,    31,   459,     0,     0,
     195,   125,   126,   127,    23,    24,    25,    26,    27,    28,
      29,    30,    31,   329,     0,     0,   330,     0,   331,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   123,     0,
       0,   183
};

static const yytype_int16 yycheck[] =
{
       8,   102,   136,   171,   136,   112,   295,   136,   111,   141,
       3,     3,     3,   102,   136,    97,   117,   448,   100,    39,
     121,   103,    32,    33,    34,    35,    39,   128,   117,    37,
      38,    39,    40,    31,    32,    33,    34,    35,    36,    37,
      38,    39,     1,   474,    11,   152,   168,    97,   102,    97,
     100,    10,    11,   103,     3,   103,    15,    16,    17,    18,
      19,    28,    21,   117,    23,     0,    25,   199,    98,    99,
      78,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,   102,    97,    43,    44,    45,    46,   217,   102,
      40,    99,    13,    90,   102,    92,    89,    90,    91,    40,
      93,    94,    95,   111,   102,    26,   336,   337,    29,   117,
     102,   102,    40,   276,   122,    67,    68,   280,     3,    96,
     254,   284,   254,   255,   256,    40,   260,    40,   136,    98,
     259,    99,    89,    90,    91,   238,    93,    94,    96,    41,
      96,   100,    31,    32,    33,    34,    35,    36,    37,    38,
      39,   254,     3,    96,    43,    44,    45,    46,    96,    42,
     100,   293,    40,   297,   100,   297,    40,     9,   297,     4,
       5,     6,     7,   181,    40,     8,   101,    12,   101,     3,
      40,    16,   471,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,   100,   295,   327,     3,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,     3,     3,   100,   346,   344,    31,    32,    33,    34,
      35,    36,    37,    38,    39,   332,     3,     3,    43,   237,
     238,    32,    33,    34,    35,   369,   370,   371,     3,     3,
     103,    96,     3,   375,    97,   102,   254,     3,   100,    97,
       3,   259,   260,   104,     3,   106,   107,   108,   109,   110,
     111,   112,   113,   224,   225,   226,   227,   228,   229,   437,
      27,    18,    17,   234,     3,     3,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,     3,     3,    43,   297,
      96,   101,    89,   301,   302,   303,   304,   305,   306,   307,
      48,    49,    50,    51,    52,    53,   102,   102,   316,   317,
     318,   319,   320,    39,    47,   101,    20,   102,    39,    22,
     328,    39,   101,     3,    39,    39,    39,   428,   429,   430,
      39,    39,    39,     3,     3,   469,    31,    32,    33,    34,
      35,    36,    37,    38,    39,   100,     3,   355,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,   369,   370,   371,     3,     3,     3,     3,   102,    14,
     471,    31,    32,    33,    34,    35,    36,    37,    38,    39,
     388,   389,   390,   391,   392,   393,   394,   395,   396,     1,
      24,     3,     3,     3,    11,    42,    72,    78,    10,    11,
     297,   355,   286,    15,    16,    17,    18,    19,   254,    21,
     474,    23,   117,    25,   476,   116,   296,   278,   360,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,   358,
     141,    43,    44,    45,    46,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,   282,    31,    32,    33,    34,    35,    36,    37,    38,
      39,   469,    41,    42,    43,    44,    45,    46,   476,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,   110,   109,    -1,   100,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    -1,    -1,    -1,    -1,    -1,   104,   105,
     106,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    97,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   104,    -1,   106,   107,   108,
     109,   110,   111,   112,   113,    96,    -1,    -1,    -1,   100,
      -1,    -1,   103,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    -1,    -1,    -1,    -1,    96,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    -1,    41,    42,    43,    44,    45,    46,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    -1,    -1,
      43,    44,    45,    46,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    -1,    -1,    43,    -1,    45,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    -1,
      -1,    43
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,   115,   116,     0,     4,     5,     6,     7,    12,
      16,   117,   118,   119,   120,   121,   122,   126,   127,   220,
      40,    40,    40,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,   128,   229,   230,    97,    32,    33,    34,
      35,   222,     3,   116,   129,    96,    40,   123,   124,   125,
     229,   229,   229,   229,   118,     3,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,   130,
      40,    98,    99,    96,    96,    96,    96,   132,   100,   100,
     216,   217,   217,   217,   125,    41,    42,    40,    40,     9,
     133,   138,   128,    40,    32,    33,    34,    35,   134,   226,
       8,   139,   140,   101,   101,   135,   229,     1,    10,    11,
      15,    17,    18,    19,    21,    23,    25,    30,    31,    36,
      37,    38,    39,    40,    43,    44,    45,    46,   100,   141,
     142,   143,   144,   145,   146,   147,   148,   156,   157,   159,
     160,   162,   164,   165,   170,   171,   172,   181,   182,   183,
     184,   185,   186,   188,   189,   195,   196,   197,   198,   206,
     207,   218,   219,   220,   221,   227,   228,   229,   230,     3,
      89,    90,    91,    93,    94,    95,   136,   137,   194,     3,
      40,   226,   222,    43,   100,   183,   199,   229,   199,     3,
       3,     3,   189,     3,   142,    43,   227,   229,   229,    97,
     151,   154,   190,   191,   192,   227,     3,    40,    41,    42,
      43,   149,   150,   151,   152,   153,   154,   188,   223,   224,
     227,     3,     3,    31,    32,    33,    34,    35,    36,    37,
      38,    39,   161,   223,   224,     3,   199,   103,    96,     3,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    96,   233,   234,   151,   216,   100,
     102,   166,   167,   168,   229,    40,   200,   201,   202,   203,
     204,   205,   223,     3,     3,     3,    18,   208,   209,   210,
      17,   211,   212,   213,    27,   173,   174,   175,     3,     3,
       3,   155,   223,    96,   101,   102,   193,   102,   154,    39,
     102,   163,   163,   163,   163,   163,   163,   163,    31,    32,
      33,    34,    35,    36,    37,    38,    39,   102,    39,   102,
      39,    48,    49,    50,    51,    52,    53,   225,   163,    40,
      43,    45,   187,   229,   183,    40,    41,    42,   104,   105,
     106,   153,   158,   183,   188,   223,   231,   223,   223,    40,
     131,   154,   229,   188,     3,   102,    89,   169,    47,   101,
     102,   214,   204,    20,   210,   204,    22,   213,   204,    13,
      26,    29,   176,   175,    98,    99,   223,   192,   194,   152,
     154,   229,   229,   229,   229,   229,   229,   229,    39,    39,
      39,    39,    39,    39,    39,    39,    39,   229,   229,   229,
     229,   229,   223,   229,   199,    48,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,   104,
     106,   107,   108,   109,   110,   111,   112,   113,   232,   232,
     232,   223,   101,     3,   167,   205,   202,    90,    92,   215,
       3,     3,     3,     3,     3,   188,   188,   188,     3,   223,
     229,   229,   229,   229,   229,   229,   229,   229,   229,    40,
     227,    41,    42,   227,    41,    42,   227,   216,     3,   102,
     177,    28,   165,   178,   179,   180,    14,   188,   192,    24,
     180,   187,     3,     3
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
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, yyscan_t yyscanner, struct lexer_state * lexer)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yyscanner, lexer)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state * lexer;
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
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, yyscan_t yyscanner, struct lexer_state * lexer)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yyscanner, lexer)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state * lexer;
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
yy_reduce_print (YYSTYPE *yyvsp, int yyrule, yyscan_t yyscanner, struct lexer_state * lexer)
#else
static void
yy_reduce_print (yyvsp, yyrule, yyscanner, lexer)
    YYSTYPE *yyvsp;
    int yyrule;
    yyscan_t yyscanner;
    struct lexer_state * lexer;
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
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, yyscan_t yyscanner, struct lexer_state * lexer)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yyscanner, lexer)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state * lexer;
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
int yyparse (yyscan_t yyscanner, struct lexer_state * lexer);
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
yyparse (yyscan_t yyscanner, struct lexer_state * lexer)
#else
int
yyparse (yyscanner, lexer)
    yyscan_t yyscanner;
    struct lexer_state * lexer;
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
#line 443 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 14:
#line 449 "pir.y"
    { set_hll((yyvsp[(2) - (2)].sval)); ;}
    break;

  case 15:
#line 453 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 16:
#line 457 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 17:
#line 461 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 18:
#line 463 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 19:
#line 467 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 20:
#line 469 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 21:
#line 473 "pir.y"
    { (yyval.expr) = expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 23:
#line 483 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 28:
#line 495 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 29:
#line 497 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 30:
#line 499 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 31:
#line 501 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 32:
#line 503 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 33:
#line 505 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 34:
#line 507 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 35:
#line 509 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 36:
#line 511 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 37:
#line 513 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 38:
#line 515 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 39:
#line 517 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 519 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 47:
#line 535 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 48:
#line 539 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 49:
#line 541 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 52:
#line 549 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 55:
#line 559 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 57:
#line 564 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 58:
#line 566 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 73:
#line 587 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 74:
#line 597 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 75:
#line 601 "pir.y"
    { set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 78:
#line 611 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 79:
#line 615 "pir.y"
    {
                          char const *instr = get_instr(lexer);
                          if (!is_parrot_op(instr))
                             yyerror(yyscanner, lexer, "parrot opcode expected");
                        ;}
    break;

  case 80:
#line 621 "pir.y"
    {
                          char const *instr = get_instr(lexer);
                          if (!is_parrot_op(instr))
                             yyerror(yyscanner, lexer, "parrot opcode expected");
                        ;}
    break;

  case 84:
#line 634 "pir.y"
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
                         set_target_key(lexer->curtarget, (yyvsp[(1) - (3)].key));

                       ;}
    break;

  case 85:
#line 658 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 86:
#line 660 "pir.y"
    { push_operand(lexer, expr_from_key((yyvsp[(1) - (1)].key))); ;}
    break;

  case 87:
#line 662 "pir.y"
    { push_operand(lexer, expr_from_target((yyvsp[(1) - (1)].targ))); ;}
    break;

  case 88:
#line 666 "pir.y"
    {
                           set_target_key((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].key));
                           (yyval.targ) = (yyvsp[(1) - (2)].targ);
                         ;}
    break;

  case 89:
#line 673 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 90:
#line 677 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 91:
#line 679 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 101:
#line 765 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 102:
#line 767 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 103:
#line 769 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 104:
#line 771 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 105:
#line 773 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 106:
#line 775 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 107:
#line 777 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 108:
#line 779 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 131:
#line 818 "pir.y"
    {
                          if ((yyvsp[(2) - (4)].ival) == -1) { /* -1 means the condition is evaluated during runtime */
                             if ((yyvsp[(1) - (4)].ival)) /* "unless"? if so, invert the instruction. */
                                 invert_instr(lexer);

                             push_operand(lexer, expr_from_ident((yyvsp[(4) - (4)].sval)));
                          }
                          else { /* evaluation during compile time */
                             /* if the result was false but the instr. was "unless", or,
                              * if the result was true and the instr. was "if",
                              * do an unconditional jump.
                              */
                             if ( (((yyvsp[(2) - (4)].ival) == 0) && (yyvsp[(1) - (4)].ival)) || (((yyvsp[(2) - (4)].ival) == 1) && !(yyvsp[(1) - (4)].ival)) )
                                set_instrf(lexer, "branch", "%I", (yyvsp[(4) - (4)].sval));
                             else
                                set_instr(lexer, "nop");

                          }
                        ;}
    break;

  case 132:
#line 844 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%E%E", (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr));
                          (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                        ;}
    break;

  case 133:
#line 850 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 134:
#line 851 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 137:
#line 859 "pir.y"
    { set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 138:
#line 863 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 139:
#line 867 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 140:
#line 869 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 141:
#line 873 "pir.y"
    { (yyval.symb) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 142:
#line 877 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 143:
#line 880 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 144:
#line 881 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 145:
#line 885 "pir.y"
    { set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval)); ;}
    break;

  case 148:
#line 900 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 149:
#line 907 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 150:
#line 909 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 151:
#line 913 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 152:
#line 915 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 153:
#line 919 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 154:
#line 923 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 155:
#line 925 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 156:
#line 928 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 157:
#line 932 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 158:
#line 934 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 159:
#line 938 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 160:
#line 940 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 161:
#line 944 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 162:
#line 946 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 163:
#line 950 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 164:
#line 952 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 166:
#line 960 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 167:
#line 962 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 168:
#line 964 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 171:
#line 972 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                             set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                           ;}
    break;

  case 172:
#line 979 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 173:
#line 986 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 174:
#line 988 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 175:
#line 992 "pir.y"
    { /* check that this identifier was declared */
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));

                             if (sym == NULL) {
                                yyerror(yyscanner, lexer, "method identifier not declared");
                                /* make sure sym is not NULL; use a valid type to prevent
                                 * a type error below.
                                 */
                                sym = new_symbol((yyvsp[(1) - (1)].sval), PMC_TYPE);
                             }
                             if (sym->type != PMC_TYPE && sym->type != STRING_TYPE)
                                 yyerror(yyscanner, lexer, "method identifier must be of type 'pmc' or 'string'");

                             (yyval.targ) = target_from_symbol(sym);
                           ;}
    break;

  case 176:
#line 1008 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 177:
#line 1010 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 178:
#line 1012 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 179:
#line 1016 "pir.y"
    {
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));

                             if (sym == NULL) {
                                 yyerror(yyscanner, lexer, "object not declared");
                                 sym = new_symbol((yyvsp[(1) - (1)].sval), PMC_TYPE);
                             }
                             if (sym->type != PMC_TYPE)
                                 yyerror(yyscanner, lexer, "object must be of type 'pmc'");

                             (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval));
                           ;}
    break;

  case 180:
#line 1029 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 181:
#line 1034 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 182:
#line 1038 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 183:
#line 1040 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 184:
#line 1044 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 185:
#line 1046 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 186:
#line 1050 "pir.y"
    { (yyval.targ) = set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 187:
#line 1054 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 188:
#line 1056 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 189:
#line 1060 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 190:
#line 1062 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 191:
#line 1064 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 192:
#line 1066 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 193:
#line 1068 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 198:
#line 1086 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 199:
#line 1091 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                            ;}
    break;

  case 200:
#line 1098 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 201:
#line 1105 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 202:
#line 1109 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 203:
#line 1111 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 204:
#line 1115 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 205:
#line 1117 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 208:
#line 1125 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 209:
#line 1129 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 210:
#line 1133 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument((yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 211:
#line 1139 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 212:
#line 1148 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 213:
#line 1155 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 214:
#line 1157 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 215:
#line 1162 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 216:
#line 1164 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 217:
#line 1169 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 218:
#line 1173 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 219:
#line 1175 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 220:
#line 1179 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 221:
#line 1181 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 222:
#line 1185 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 223:
#line 1190 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 224:
#line 1192 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 225:
#line 1196 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 226:
#line 1198 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 227:
#line 1205 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 228:
#line 1207 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 229:
#line 1211 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 233:
#line 1222 "pir.y"
    { store_global_const(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 234:
#line 1226 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 235:
#line 1230 "pir.y"
    { (yyval.cval) = new_named_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 236:
#line 1232 "pir.y"
    { (yyval.cval) = new_named_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 237:
#line 1234 "pir.y"
    { (yyval.cval) = new_named_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 238:
#line 1236 "pir.y"
    { (yyval.cval) = new_named_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 239:
#line 1252 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 240:
#line 1253 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].cval)); ;}
    break;

  case 241:
#line 1257 "pir.y"
    { (yyval.cval) = new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 242:
#line 1258 "pir.y"
    { (yyval.cval) = new_const(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 243:
#line 1259 "pir.y"
    { (yyval.cval) = new_const(NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 244:
#line 1262 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 245:
#line 1263 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 246:
#line 1264 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 247:
#line 1265 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 248:
#line 1266 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 249:
#line 1267 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 250:
#line 1270 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 251:
#line 1271 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 252:
#line 1272 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 253:
#line 1273 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 254:
#line 1281 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 255:
#line 1284 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 256:
#line 1285 "pir.y"
    { (yyval.targ) = reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 257:
#line 1286 "pir.y"
    { (yyval.targ) = reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 258:
#line 1287 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 259:
#line 1288 "pir.y"
    { /* a symbol must have been declared; check that at this point. */
                           symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                           if (sym == NULL) {
                               yyerror(yyscanner, lexer, "symbol not declared");
                               /* make sure sym is not NULL */
                               sym = new_symbol((yyvsp[(1) - (1)].sval), UNKNOWN_TYPE);
                           }
                           (yyval.targ) = target_from_symbol(sym);

                         ;}
    break;

  case 262:
#line 1305 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 263:
#line 1306 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 264:
#line 1307 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 265:
#line 1308 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 266:
#line 1309 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 267:
#line 1310 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 268:
#line 1311 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 269:
#line 1312 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 270:
#line 1315 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 271:
#line 1316 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 272:
#line 1317 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 273:
#line 1320 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 274:
#line 1321 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 275:
#line 1322 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 276:
#line 1323 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 277:
#line 1324 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 278:
#line 1325 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 279:
#line 1326 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 280:
#line 1327 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 281:
#line 1328 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 282:
#line 1329 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 283:
#line 1330 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 284:
#line 1331 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 285:
#line 1332 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 286:
#line 1333 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 287:
#line 1334 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 288:
#line 1335 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 289:
#line 1336 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 290:
#line 1337 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 291:
#line 1338 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 292:
#line 1339 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 293:
#line 1340 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 294:
#line 1341 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 295:
#line 1342 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 296:
#line 1348 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 297:
#line 1349 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 298:
#line 1350 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 299:
#line 1351 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 300:
#line 1352 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 301:
#line 1353 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 302:
#line 1354 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 303:
#line 1355 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 304:
#line 1356 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 305:
#line 1357 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 306:
#line 1358 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 307:
#line 1359 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 308:
#line 1362 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 309:
#line 1363 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3455 "pirparser.c"
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


#line 1366 "pir.y"


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


