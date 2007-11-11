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
     TK_LABEL = 258,
     TK_NL = 259,
     TK_HLL = 260,
     TK_HLL_MAP = 261,
     TK_EMIT = 262,
     TK_EOM = 263,
     TK_N_OPERATORS = 264,
     TK_PRAGMA = 265,
     TK_LOADLIB = 266,
     TK_SUB = 267,
     TK_END = 268,
     TK_PARAM = 269,
     TK_LEX = 270,
     TK_LOCAL = 271,
     TK_NAMESPACE = 272,
     TK_INVOCANT = 273,
     TK_METH_CALL = 274,
     TK_GLOBALCONST = 275,
     TK_CONST = 276,
     TK_RETURN = 277,
     TK_YIELD = 278,
     TK_BEGIN_YIELD = 279,
     TK_END_YIELD = 280,
     TK_BEGIN_RETURN = 281,
     TK_END_RETURN = 282,
     TK_BEGIN_CALL = 283,
     TK_END_CALL = 284,
     TK_GET_RESULTS = 285,
     TK_CALL = 286,
     TK_ARG = 287,
     TK_RESULT = 288,
     TK_NCI_CALL = 289,
     TK_IDENT = 290,
     TK_STRINGC = 291,
     TK_INTC = 292,
     TK_NUMC = 293,
     TK_PASM_PREG = 294,
     TK_PASM_NREG = 295,
     TK_PASM_SREG = 296,
     TK_PASM_IREG = 297,
     TK_SYM_PREG = 298,
     TK_SYM_NREG = 299,
     TK_SYM_SREG = 300,
     TK_SYM_IREG = 301,
     TK_PARROT_OP = 302,
     TK_INT = 303,
     TK_NUM = 304,
     TK_PMC = 305,
     TK_STRING = 306,
     TK_IF = 307,
     TK_UNLESS = 308,
     TK_NULL = 309,
     TK_GOTO = 310,
     TK_ARROW = 311,
     TK_NE = 312,
     TK_EQ = 313,
     TK_LT = 314,
     TK_LE = 315,
     TK_GT = 316,
     TK_GE = 317,
     TK_USHIFT = 318,
     TK_RSHIFT = 319,
     TK_LSHIFT = 320,
     TK_FDIV = 321,
     TK_OR = 322,
     TK_AND = 323,
     TK_XOR = 324,
     TK_CONC = 325,
     TK_ASSIGN_USHIFT = 326,
     TK_ASSIGN_RSHIFT = 327,
     TK_ASSIGN_LSHIFT = 328,
     TK_ASSIGN_INC = 329,
     TK_ASSIGN_DEC = 330,
     TK_ASSIGN_MUL = 331,
     TK_ASSIGN_MOD = 332,
     TK_ASSIGN_POW = 333,
     TK_ASSIGN_DIV = 334,
     TK_ASSIGN_BOR = 335,
     TK_ASSIGN_BAND = 336,
     TK_ASSIGN_FDIV = 337,
     TK_ASSIGN_BNOT = 338,
     TK_ASSIGN_CONC = 339,
     TK_FLAG_INIT = 340,
     TK_FLAG_LOAD = 341,
     TK_FLAG_MAIN = 342,
     TK_FLAG_ANON = 343,
     TK_FLAG_METHOD = 344,
     TK_FLAG_OUTER = 345,
     TK_FLAG_VTABLE = 346,
     TK_FLAG_LEX = 347,
     TK_FLAG_MULTI = 348,
     TK_FLAG_POSTCOMP = 349,
     TK_FLAG_IMMEDIATE = 350,
     TK_FLAG_UNIQUE_REG = 351,
     TK_FLAG_NAMED = 352,
     TK_FLAG_SLURPY = 353,
     TK_FLAG_FLAT = 354,
     TK_FLAG_OPTIONAL = 355,
     TK_FLAG_OPT_FLAG = 356
   };
#endif
/* Tokens.  */
#define TK_LABEL 258
#define TK_NL 259
#define TK_HLL 260
#define TK_HLL_MAP 261
#define TK_EMIT 262
#define TK_EOM 263
#define TK_N_OPERATORS 264
#define TK_PRAGMA 265
#define TK_LOADLIB 266
#define TK_SUB 267
#define TK_END 268
#define TK_PARAM 269
#define TK_LEX 270
#define TK_LOCAL 271
#define TK_NAMESPACE 272
#define TK_INVOCANT 273
#define TK_METH_CALL 274
#define TK_GLOBALCONST 275
#define TK_CONST 276
#define TK_RETURN 277
#define TK_YIELD 278
#define TK_BEGIN_YIELD 279
#define TK_END_YIELD 280
#define TK_BEGIN_RETURN 281
#define TK_END_RETURN 282
#define TK_BEGIN_CALL 283
#define TK_END_CALL 284
#define TK_GET_RESULTS 285
#define TK_CALL 286
#define TK_ARG 287
#define TK_RESULT 288
#define TK_NCI_CALL 289
#define TK_IDENT 290
#define TK_STRINGC 291
#define TK_INTC 292
#define TK_NUMC 293
#define TK_PASM_PREG 294
#define TK_PASM_NREG 295
#define TK_PASM_SREG 296
#define TK_PASM_IREG 297
#define TK_SYM_PREG 298
#define TK_SYM_NREG 299
#define TK_SYM_SREG 300
#define TK_SYM_IREG 301
#define TK_PARROT_OP 302
#define TK_INT 303
#define TK_NUM 304
#define TK_PMC 305
#define TK_STRING 306
#define TK_IF 307
#define TK_UNLESS 308
#define TK_NULL 309
#define TK_GOTO 310
#define TK_ARROW 311
#define TK_NE 312
#define TK_EQ 313
#define TK_LT 314
#define TK_LE 315
#define TK_GT 316
#define TK_GE 317
#define TK_USHIFT 318
#define TK_RSHIFT 319
#define TK_LSHIFT 320
#define TK_FDIV 321
#define TK_OR 322
#define TK_AND 323
#define TK_XOR 324
#define TK_CONC 325
#define TK_ASSIGN_USHIFT 326
#define TK_ASSIGN_RSHIFT 327
#define TK_ASSIGN_LSHIFT 328
#define TK_ASSIGN_INC 329
#define TK_ASSIGN_DEC 330
#define TK_ASSIGN_MUL 331
#define TK_ASSIGN_MOD 332
#define TK_ASSIGN_POW 333
#define TK_ASSIGN_DIV 334
#define TK_ASSIGN_BOR 335
#define TK_ASSIGN_BAND 336
#define TK_ASSIGN_FDIV 337
#define TK_ASSIGN_BNOT 338
#define TK_ASSIGN_CONC 339
#define TK_FLAG_INIT 340
#define TK_FLAG_LOAD 341
#define TK_FLAG_MAIN 342
#define TK_FLAG_ANON 343
#define TK_FLAG_METHOD 344
#define TK_FLAG_OUTER 345
#define TK_FLAG_VTABLE 346
#define TK_FLAG_LEX 347
#define TK_FLAG_MULTI 348
#define TK_FLAG_POSTCOMP 349
#define TK_FLAG_IMMEDIATE 350
#define TK_FLAG_UNIQUE_REG 351
#define TK_FLAG_NAMED 352
#define TK_FLAG_SLURPY 353
#define TK_FLAG_FLAT 354
#define TK_FLAG_OPTIONAL 355
#define TK_FLAG_OPT_FLAG 356




/* Copy the first part of user declarations.  */
#line 1 "pir.y"


/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*

=head1 NAME

pir.y

=head1 DESCRIPTION

This is a complete rewrite of the parser for the PIR language.

=cut

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "pirparser.h"
#include "pircompiler.h"

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

#include "pirlexer.h"


extern int yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message);

/* declare yylex() */
extern YY_DECL;

/*
  experimental emit functions.

 */
/*
#define EMIT_EXPERIMENT
*/

#ifdef EMIT_EXPERIMENT
#  define emit1(X)        fprintf(stderr, "%s\n", X)
#  define emit2(X,Y)      fprintf(stderr, "%s %s\n", X,Y)
#  define emit3(A,B,C)    fprintf(stderr, "%s %s, %s\n", A,B,C)
#else
#  define emit1(X)
#  define emit2(X,Y)
#  define emit3(A,B,C)
#endif

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
#line 80 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 383 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 396 "pirparser.c"

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
#define YYLAST   490

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  104
/* YYNRULES -- Number of rules.  */
#define YYNRULES  265
/* YYNRULES -- Number of states.  */
#define YYNSTATES  418

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   357

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   109,     2,     2,     2,   114,   116,     2,
     105,   106,   113,   111,   102,   108,   119,   112,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   118,
       2,   107,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   103,     2,   104,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   115,     2,   110,     2,     2,     2,
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
      95,    96,    97,    98,    99,   100,   101,   117
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    30,    32,    36,    39,    44,    49,
      54,    55,    58,    61,    64,    66,    70,    73,    74,    78,
      80,    84,    92,    94,    96,    97,   100,   102,   104,   106,
     108,   110,   112,   117,   120,   125,   127,   129,   130,   134,
     136,   138,   140,   142,   143,   146,   151,   154,   159,   160,
     163,   166,   169,   171,   173,   175,   177,   179,   181,   183,
     185,   187,   189,   191,   193,   195,   197,   200,   204,   209,
     215,   218,   222,   225,   229,   232,   235,   237,   241,   244,
     246,   249,   251,   253,   256,   257,   259,   261,   265,   267,
     270,   272,   274,   276,   278,   280,   282,   284,   286,   288,
     290,   292,   294,   296,   298,   300,   302,   304,   306,   308,
     310,   312,   314,   316,   318,   320,   322,   324,   326,   328,
     330,   332,   334,   336,   338,   340,   344,   346,   350,   352,
     354,   356,   362,   368,   370,   372,   375,   378,   380,   382,
     384,   388,   392,   397,   399,   403,   406,   407,   409,   411,
     413,   419,   421,   423,   432,   433,   436,   441,   445,   448,
     454,   455,   458,   459,   462,   467,   469,   476,   480,   483,
     484,   486,   488,   492,   495,   496,   499,   501,   503,   505,
     508,   510,   512,   514,   516,   518,   520,   525,   527,   529,
     531,   533,   535,   537,   539,   541,   547,   549,   551,   555,
     559,   563,   567,   568,   570,   572,   576,   579,   583,   589,
     590,   593,   598,   599,   602,   607,   608,   611,   613,   616,
     617,   621,   624,   627,   631,   636,   641,   646,   651,   653,
     655,   657,   659,   661,   663,   665,   667,   669,   671,   673,
     675,   677,   679,   681,   683,   685,   687,   689,   691,   693,
     695,   697,   699,   701,   703,   705
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     121,     0,    -1,   122,   123,   122,    -1,    -1,     4,    -1,
     124,    -1,   123,     4,   124,    -1,   136,    -1,   213,    -1,
     133,    -1,   129,    -1,   127,    -1,   128,    -1,   126,    -1,
     125,    -1,    10,     9,    37,    -1,    11,    36,    -1,     5,
      36,   102,    36,    -1,     6,    36,   102,    36,    -1,     7,
       4,   130,     8,    -1,    -1,   130,   131,    -1,     3,     4,
      -1,     3,   132,    -1,   132,    -1,    47,   155,     4,    -1,
      17,   134,    -1,    -1,   103,   135,   104,    -1,    36,    -1,
     135,   165,    36,    -1,    12,   137,   138,     4,   142,   145,
      13,    -1,   176,    -1,    36,    -1,    -1,   138,   139,    -1,
      88,    -1,    85,    -1,    86,    -1,    87,    -1,    89,    -1,
      92,    -1,    90,   105,   137,   106,    -1,    91,   212,    -1,
      93,   105,   140,   106,    -1,    94,    -1,    95,    -1,    -1,
     140,   102,   141,    -1,   176,    -1,    36,    -1,   162,    -1,
     222,    -1,    -1,   142,   143,    -1,    14,   144,   190,     4,
      -1,   222,   176,    -1,   222,    36,    56,   176,    -1,    -1,
     145,   146,    -1,     3,     4,    -1,     3,   147,    -1,   147,
      -1,   166,    -1,   171,    -1,   172,    -1,   177,    -1,   214,
      -1,   196,    -1,   198,    -1,   178,    -1,   151,    -1,   150,
      -1,   132,    -1,   149,    -1,   148,    -1,     1,     4,    -1,
      54,   223,     4,    -1,   223,   107,    54,     4,    -1,    30,
     105,   187,   106,     4,    -1,   194,     4,    -1,   223,   152,
       4,    -1,   161,   217,    -1,   162,   107,   217,    -1,   107,
     153,    -1,   159,   217,    -1,   217,    -1,   217,   160,   217,
      -1,   223,   162,    -1,   158,    -1,    36,   201,    -1,   194,
      -1,   154,    -1,    47,   156,    -1,    -1,   156,    -1,   157,
      -1,   156,   102,   157,    -1,   216,    -1,   193,   201,    -1,
     108,    -1,   109,    -1,   110,    -1,   111,    -1,   108,    -1,
     112,    -1,   113,    -1,   114,    -1,   115,    -1,   116,    -1,
     110,    -1,   117,    -1,    70,    -1,    63,    -1,    64,    -1,
      65,    -1,    67,    -1,    68,    -1,    66,    -1,    69,    -1,
     221,    -1,    74,    -1,    75,    -1,    76,    -1,    77,    -1,
      78,    -1,    79,    -1,    82,    -1,    80,    -1,    81,    -1,
      83,    -1,    84,    -1,    72,    -1,    73,    -1,    71,    -1,
     103,   163,   104,    -1,   164,    -1,   163,   165,   164,    -1,
     217,    -1,   118,    -1,   102,    -1,   167,   170,   169,   176,
       4,    -1,   168,   217,   169,   176,     4,    -1,    52,    -1,
      53,    -1,    52,    54,    -1,    53,    54,    -1,    55,    -1,
     102,    -1,   217,    -1,   217,   221,   217,    -1,    55,   176,
       4,    -1,    16,   222,   173,     4,    -1,   174,    -1,   173,
     102,   174,    -1,   176,   175,    -1,    -1,    96,    -1,    35,
      -1,    47,    -1,    15,    36,   102,   223,     4,    -1,   179,
      -1,   186,    -1,    28,     4,   180,   182,     4,   184,    29,
       4,    -1,    -1,   180,   181,    -1,    32,   217,   210,     4,
      -1,    31,   193,   183,    -1,    34,   193,    -1,    18,   193,
       4,    19,   195,    -1,    -1,   102,   193,    -1,    -1,   184,
     185,    -1,    33,   223,   190,     4,    -1,   172,    -1,   105,
     187,   106,   107,   192,     4,    -1,    36,   201,     4,    -1,
     158,     4,    -1,    -1,   188,    -1,   189,    -1,   188,   102,
     189,    -1,   223,   190,    -1,    -1,   190,   191,    -1,   100,
      -1,   101,    -1,    98,    -1,    97,   212,    -1,    96,    -1,
     158,    -1,   194,    -1,    43,    -1,    39,    -1,   176,    -1,
     193,   119,   195,   201,    -1,   176,    -1,    36,    -1,    45,
      -1,    41,    -1,    39,    -1,    43,    -1,   199,    -1,   197,
      -1,    26,     4,   208,    27,     4,    -1,   200,    -1,   205,
      -1,    22,   201,     4,    -1,    22,   192,     4,    -1,    23,
     201,     4,    -1,   105,   202,   106,    -1,    -1,   203,    -1,
     204,    -1,   203,   102,   204,    -1,   217,   210,    -1,    36,
      56,   217,    -1,    24,     4,   206,    25,     4,    -1,    -1,
     206,   207,    -1,    23,   217,   210,     4,    -1,    -1,   208,
     209,    -1,    22,   217,   210,     4,    -1,    -1,   210,   211,
      -1,    99,    -1,    97,   212,    -1,    -1,   105,    36,   106,
      -1,    21,   215,    -1,   213,     4,    -1,    20,   215,     4,
      -1,    48,   176,   107,    37,    -1,    49,   176,   107,    38,
      -1,    50,   176,   107,    36,    -1,    51,   176,   107,    36,
      -1,   218,    -1,   220,    -1,   223,    -1,   218,    -1,    36,
      -1,    37,    -1,    38,    -1,    43,    -1,    44,    -1,    46,
      -1,    45,    -1,   220,    -1,    39,    -1,    40,    -1,    42,
      -1,    41,    -1,    57,    -1,    58,    -1,    59,    -1,    60,
      -1,    62,    -1,    61,    -1,    48,    -1,    49,    -1,    50,
      -1,    51,    -1,   219,    -1,   176,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   231,   231,   237,   238,   241,   242,   245,   246,   247,
     248,   249,   250,   251,   252,   255,   258,   263,   266,   271,
     277,   278,   281,   282,   283,   286,   291,   294,   295,   298,
     299,   304,   310,   311,   314,   315,   318,   319,   320,   321,
     322,   323,   324,   325,   326,   327,   328,   331,   332,   335,
     336,   337,   338,   341,   342,   345,   348,   349,   355,   356,
     360,   361,   362,   365,   366,   367,   368,   369,   370,   371,
     372,   373,   374,   375,   376,   377,   378,   381,   382,   385,
     388,   391,   394,   395,   396,   399,   400,   401,   402,   403,
     404,   405,   406,   419,   422,   423,   426,   427,   430,   434,
     437,   438,   439,   442,   443,   444,   445,   446,   447,   448,
     449,   450,   451,   452,   453,   454,   455,   456,   457,   458,
     459,   463,   464,   465,   466,   467,   468,   469,   470,   471,
     472,   473,   474,   475,   476,   479,   482,   483,   486,   489,
     490,   494,   496,   500,   501,   505,   506,   509,   510,   513,
     514,   517,   521,   524,   525,   528,   531,   532,   535,   536,
     539,   542,   543,   546,   557,   558,   561,   564,   565,   566,
     570,   571,   574,   575,   578,   579,   582,   583,   584,   587,
     588,   591,   592,   595,   598,   599,   602,   603,   604,   605,
     606,   609,   610,   613,   614,   615,   618,   621,   622,   623,
     624,   625,   626,   629,   630,   633,   643,   644,   647,   652,
     655,   661,   664,   665,   668,   669,   672,   673,   676,   681,
     682,   685,   688,   689,   692,   695,   696,   699,   700,   703,
     704,   707,   710,   711,   714,   715,   716,   717,   720,   721,
     724,   725,   728,   729,   730,   733,   734,   735,   736,   737,
     741,   742,   743,   744,   747,   748,   749,   750,   751,   752,
     755,   756,   757,   758,   761,   762
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"label\"", "\"\\n\"", "\".HLL\"",
  "\".HLL_map\"", "\".emit\"", "\".eom\"", "\"n_operators\"",
  "\".pragma\"", "\".loadlib\"", "\".sub\"", "\".end\"", "\".param\"",
  "\".lex\"", "\".local\"", "\".namespace\"", "\".invocant\"",
  "\".meth_call\"", "\".globalconst\"", "\".const\"", "\".return\"",
  "\".yield\"", "\".begin_yield\"", "\".end_yield\"", "\".begin_return\"",
  "\".end_return\"", "\".begin_call\"", "\".end_call\"",
  "\".get_results\"", "\".call\"", "\".arg\"", "\".result\"",
  "\".nci_call\"", "\"identifier\"", "\"string constant\"",
  "\"integer constant\"", "\"number constant\"", "\"PMC register\"",
  "\"Number register\"", "\"String register\"", "\"Integer register\"",
  "\"Symbolic PMC register\"", "\"Symbolic number register\"",
  "\"Symbolic string register\"", "\"Symbolic integer register\"",
  "\"parrot op\"", "\"int\"", "\"num\"", "\"pmc\"", "\"string\"", "\"if\"",
  "\"unless\"", "\"null\"", "\"goto\"", "\"=>\"", "\"!=\"", "\"==\"",
  "\"<\"", "\"<=\"", "\">\"", "\">=\"", "\">>>\"", "\">>\"", "\"<<\"",
  "\"//\"", "\"||\"", "\"&&\"", "\"~~\"", "\".\"", "\">>>=\"", "\">>=\"",
  "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"", "\"/=\"",
  "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"", "\".=\"", "\":init\"",
  "\":load\"", "\":main\"", "\":anon\"", "\":method\"", "\":outer\"",
  "\":vtable\"", "\":lex\"", "\":multi\"", "\":postcomp\"",
  "\":immediate\"", "\":unique_reg\"", "\":named\"", "\":slurpy\"",
  "\":flat\"", "\":optional\"", "\":opt_flag\"", "','", "'['", "']'",
  "'('", "')'", "'='", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'",
  "'|'", "'&'", "\"**\"", "';'", "'.'", "$accept", "program", "opt_nl",
  "compilation_units", "compilation_unit", "pir_pragma", "loadlib",
  "hll_specifier", "hll_mapping", "emit_block", "pasm_instructions",
  "pasm_instruction", "parrot_statement", "namespace_declaration",
  "opt_namespace_id", "namespace_id", "sub_definition", "sub_id",
  "sub_flags", "sub_flag", "multi_type_list", "multi_type", "parameters",
  "parameter", "param_def", "instructions", "labeled_instruction",
  "instruction", "null_statement", "getresults_statement",
  "methodcall_statement", "assignment_statement", "assignment_tail",
  "assignment_expression", "parrot_instruction", "opt_parrot_op_args",
  "parrot_op_args", "parrot_op_arg", "simple_invocation", "unop", "binop",
  "augmented_op", "keylist", "keys", "key", "separator",
  "conditional_statement", "if_type", "if_null_type", "goto_or_comma",
  "condition", "goto_statement", "local_declaration", "local_id_list",
  "local_id", "has_unique_reg", "identifier", "lex_declaration",
  "invocation_statement", "long_invocation_statement", "long_arguments",
  "long_argument", "long_invocation", "opt_return_continuation",
  "long_results", "long_result", "short_invocation_statement",
  "opt_target_list", "target_list", "result_target", "param_flags",
  "param_flag", "invocation_expression", "invokable", "methodcall",
  "method", "return_statement", "long_return_statement", "yield_statement",
  "short_return_statement", "short_yield_statement", "arguments",
  "opt_arguments_list", "arguments_list", "argument",
  "long_yield_statement", "yield_expressions", "yield_expression",
  "return_expressions", "return_expression", "arg_flags", "arg_flag",
  "opt_paren_string", "const_declaration", "const_decl_statement",
  "const_tail", "pasm_expression", "expression", "constant", "reg",
  "pasm_reg", "rel_op", "type", "target", 0
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
     355,   356,    44,    91,    93,    40,    41,    61,    45,    33,
     126,    43,    47,    42,    37,   124,    38,   357,    59,    46
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   120,   121,   122,   122,   123,   123,   124,   124,   124,
     124,   124,   124,   124,   124,   125,   126,   127,   128,   129,
     130,   130,   131,   131,   131,   132,   133,   134,   134,   135,
     135,   136,   137,   137,   138,   138,   139,   139,   139,   139,
     139,   139,   139,   139,   139,   139,   139,   140,   140,   141,
     141,   141,   141,   142,   142,   143,   144,   144,   145,   145,
     146,   146,   146,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   147,   148,   148,   149,
     150,   151,   152,   152,   152,   153,   153,   153,   153,   153,
     153,   153,   153,   154,   155,   155,   156,   156,   157,   158,
     159,   159,   159,   160,   160,   160,   160,   160,   160,   160,
     160,   160,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   161,   161,   161,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   161,   161,   162,   163,   163,   164,   165,
     165,   166,   166,   167,   167,   168,   168,   169,   169,   170,
     170,   171,   172,   173,   173,   174,   175,   175,   176,   176,
     177,   178,   178,   179,   180,   180,   181,   182,   182,   182,
     183,   183,   184,   184,   185,   185,   186,   186,   186,   187,
     187,   188,   188,   189,   190,   190,   191,   191,   191,   191,
     191,   192,   192,   193,   193,   193,   194,   195,   195,   195,
     195,   195,   195,   196,   196,   197,   198,   198,   199,   199,
     200,   201,   202,   202,   203,   203,   204,   204,   205,   206,
     206,   207,   208,   208,   209,   210,   210,   211,   211,   212,
     212,   213,   214,   214,   215,   215,   215,   215,   216,   216,
     217,   217,   218,   218,   218,   219,   219,   219,   219,   219,
     220,   220,   220,   220,   221,   221,   221,   221,   221,   221,
     222,   222,   222,   222,   223,   223
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     2,     4,     4,     4,
       0,     2,     2,     2,     1,     3,     2,     0,     3,     1,
       3,     7,     1,     1,     0,     2,     1,     1,     1,     1,
       1,     1,     4,     2,     4,     1,     1,     0,     3,     1,
       1,     1,     1,     0,     2,     4,     2,     4,     0,     2,
       2,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     3,     4,     5,
       2,     3,     2,     3,     2,     2,     1,     3,     2,     1,
       2,     1,     1,     2,     0,     1,     1,     3,     1,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     1,     3,     1,     1,
       1,     5,     5,     1,     1,     2,     2,     1,     1,     1,
       3,     3,     4,     1,     3,     2,     0,     1,     1,     1,
       5,     1,     1,     8,     0,     2,     4,     3,     2,     5,
       0,     2,     0,     2,     4,     1,     6,     3,     2,     0,
       1,     1,     3,     2,     0,     2,     1,     1,     1,     2,
       1,     1,     1,     1,     1,     1,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     5,     1,     1,     3,     3,
       3,     3,     0,     1,     1,     3,     2,     3,     5,     0,
       2,     4,     0,     2,     4,     0,     2,     1,     2,     0,
       3,     2,     2,     3,     4,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    27,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,   158,    33,
     159,    34,    32,     0,    26,     0,     0,     0,     0,   231,
       4,     2,     0,     0,     0,    15,     0,    29,     0,     0,
       0,     0,     0,     6,    17,    18,     0,    19,    94,    21,
      24,    53,    37,    38,    39,    36,    40,     0,   229,    41,
       0,    45,    46,    35,   140,    28,   139,     0,     0,     0,
       0,     0,    22,    23,   242,   243,   244,   250,   251,   253,
     252,     0,    95,    96,    98,   238,   239,    58,     0,     0,
      43,    47,    30,   234,   235,   236,   237,    25,     0,     0,
      54,     0,     0,     0,     0,    97,   260,   261,   262,   263,
     184,     0,     0,     0,    31,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   250,   245,   246,   248,   247,
     159,   143,   144,     0,     0,   179,    73,    59,    62,    75,
      74,    72,    71,     0,    63,     0,     0,    64,    65,   265,
      66,    70,   161,   162,     0,     0,    68,   204,    69,   203,
     206,   207,     0,    67,   264,   249,     0,    42,   230,     0,
      44,     0,     0,    56,    76,    60,    61,     0,     0,     0,
     194,   193,   212,   191,   195,     0,   192,     0,     0,   219,
     222,   164,   179,     0,   145,   146,   245,   265,     0,     0,
       0,   180,   181,   184,   178,     0,   149,   241,   240,     0,
       0,    99,    80,   232,   134,   132,   133,   121,   122,   123,
     124,   125,   126,   128,   129,   127,   130,   131,     0,     0,
       0,     0,     0,    50,    48,    51,    49,    52,    55,   190,
     229,   188,   186,   187,   185,     0,     0,     0,   153,   156,
     233,   242,     0,   213,   214,   225,   209,   208,   210,     0,
       0,     0,     0,   177,    77,   151,     0,     0,   183,   147,
     148,     0,   254,   255,   256,   257,   259,   258,     0,     0,
     198,   201,   200,   202,   199,   197,     0,     0,   136,   138,
     242,   159,     0,   100,   101,   102,    84,    92,    89,     0,
      91,    86,   240,    81,    82,     0,   189,    57,     0,   152,
       0,   157,   155,     0,   211,     0,   216,     0,     0,   220,
       0,     0,   223,     0,     0,     0,     0,   165,     0,     0,
       0,   182,     0,   150,     0,   196,   135,     0,    90,    93,
      78,    85,   113,   114,   115,   118,   116,   117,   119,   112,
     104,   110,   103,   105,   106,   107,   108,   109,   111,     0,
     120,    88,    83,   160,   154,   217,   215,   229,   227,   226,
     225,   218,   225,   205,     0,   170,   225,   168,   172,    79,
       0,   141,   142,   137,    87,   228,     0,     0,     0,     0,
     167,     0,     0,   176,   221,   224,     0,   171,   166,     0,
       0,   175,   173,   169,   163,   184,     0,   174
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      44,    59,   146,    20,    34,    48,    21,    31,    46,    73,
     114,   244,    97,   110,   120,   111,   147,   148,   149,   150,
     151,   152,   240,   306,   307,    91,    92,    93,   153,   309,
     369,   241,   242,   297,   298,    77,   154,   155,   156,   281,
     215,   157,   158,   257,   258,   322,   207,   160,   161,   162,
     271,   337,   338,   400,   402,   412,   163,   210,   211,   212,
     181,   254,   195,   164,   165,   296,   166,   167,   168,   169,
     170,   197,   262,   263,   264,   171,   269,   329,   270,   332,
     326,   379,   100,    22,   173,    39,    94,   265,   217,   174,
     175,   288,   121,   218
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -319
static const yytype_int16 yypact[] =
{
      18,  -319,    31,   195,  -319,    22,    47,    38,    40,    70,
      67,   -36,   200,    94,  -319,  -319,  -319,  -319,  -319,  -319,
    -319,  -319,  -319,    26,    43,  -319,    90,  -319,  -319,  -319,
    -319,  -319,  -319,   100,  -319,    52,    52,    52,    52,  -319,
     195,  -319,   107,   125,    16,  -319,    62,  -319,   -70,    56,
      65,    68,    75,  -319,  -319,  -319,    17,  -319,   295,  -319,
    -319,  -319,  -319,  -319,  -319,  -319,  -319,    69,    79,  -319,
      84,  -319,  -319,  -319,  -319,  -319,  -319,   154,   171,   173,
     177,   178,  -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,
    -319,   205,   113,  -319,  -319,  -319,  -319,   212,    67,   191,
    -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,   295,   235,
    -319,   252,   122,   146,    -2,  -319,  -319,  -319,  -319,  -319,
    -319,   152,   240,   324,  -319,   218,   235,   200,     4,   158,
     255,   260,   265,   165,   158,   -64,   -44,  -319,  -319,  -319,
     156,   223,   227,   273,    52,   273,  -319,  -319,  -319,  -319,
    -319,  -319,  -319,   285,  -319,   409,   409,  -319,  -319,   -40,
    -319,  -319,  -319,  -319,   -23,   286,  -319,  -319,  -319,  -319,
    -319,  -319,   297,  -319,  -319,  -319,   159,  -319,  -319,    21,
    -319,    25,   246,  -319,  -319,  -319,  -319,   201,    52,   305,
    -319,  -319,   422,  -319,  -319,   307,  -319,   317,   318,  -319,
    -319,  -319,   273,   323,  -319,  -319,  -319,  -319,   325,   334,
     236,   239,  -319,  -319,  -319,   -25,   162,  -319,  -319,   -25,
     123,  -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,
    -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,   409,   362,
     339,   409,   242,  -319,  -319,  -319,  -319,  -319,  -319,  -319,
      79,  -319,  -319,  -319,  -319,    52,   273,     6,  -319,   257,
    -319,   299,   245,   254,  -319,  -319,  -319,  -319,  -319,    27,
      93,    28,   256,  -319,  -319,  -319,   251,   273,   160,  -319,
    -319,    52,  -319,  -319,  -319,  -319,  -319,  -319,   409,    52,
    -319,  -319,  -319,  -319,  -319,  -319,   158,   -28,  -319,  -319,
     158,   295,   357,  -319,  -319,  -319,  -319,  -319,  -319,   409,
    -319,   373,   269,  -319,  -319,   409,  -319,  -319,   369,  -319,
      52,  -319,  -319,   409,  -319,   422,    -8,   409,   370,  -319,
     409,   371,  -319,   138,   138,   409,   138,  -319,   376,   377,
     138,  -319,   378,  -319,   379,  -319,  -319,   409,  -319,   113,
    -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,
    -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,  -319,   409,
    -319,  -319,  -319,  -319,  -319,  -319,  -319,    79,  -319,  -319,
    -319,  -319,  -319,  -319,   380,   283,  -319,  -319,  -319,  -319,
     382,  -319,  -319,  -319,  -319,  -319,    13,    33,   368,   138,
    -319,    34,     7,  -319,  -319,  -319,   123,  -319,  -319,   384,
     273,  -319,  -319,  -319,  -319,  -319,    41,  -319
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -319,  -319,   381,  -319,   350,  -319,  -319,  -319,  -319,  -319,
    -319,  -319,    49,  -319,  -319,  -319,  -319,   293,  -319,  -319,
    -319,  -319,  -319,  -319,  -319,  -319,  -319,   270,  -319,  -319,
    -319,  -319,  -319,  -319,  -319,  -319,    91,   287,  -123,  -319,
    -319,  -319,  -172,  -319,    63,   114,  -319,  -319,  -319,   193,
    -319,  -319,    11,  -319,    95,  -319,   -10,  -319,  -319,  -319,
    -319,  -319,  -319,  -319,  -319,  -319,  -319,   215,  -319,   137,
    -211,  -319,    78,  -318,  -122,    14,  -319,  -319,  -319,  -319,
    -319,  -120,  -319,  -319,    96,  -319,  -319,  -319,  -319,  -319,
    -302,  -319,  -242,    -4,  -319,   292,  -319,  -144,   -55,  -319,
     -54,   111,  -106,  -110
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -196
static const yytype_int16 yytable[] =
{
      32,   176,   278,    95,    96,   193,   196,   245,   316,   198,
     319,   216,   219,   176,   203,   384,   385,   404,   387,    56,
     188,    82,     1,   126,    57,    49,    50,    51,    52,   248,
     279,     4,    74,   208,    75,   213,   409,   405,   408,    28,
     410,  -194,    25,   190,   221,   417,   333,   191,    76,    26,
     327,    30,   328,    95,    96,  -194,    28,   243,    23,   334,
     335,  -193,   336,    58,    58,  -195,    61,    33,    30,   116,
     117,   118,   119,   247,    74,  -193,   346,   280,   396,  -195,
     397,   407,   192,    24,   401,    95,    96,    28,    32,   377,
      76,   378,   213,    60,   299,   311,   220,   314,    40,    30,
     179,   159,    28,    29,   180,    83,    27,   172,   320,   192,
     377,   183,   378,   159,    30,   330,   308,   310,   194,   172,
     331,   249,   250,   251,   238,   252,   253,    45,    42,   312,
     377,   377,   378,   378,   209,   395,    47,   249,   250,   251,
     371,   252,   253,    54,   343,    43,   318,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    28,   290,
     -94,    55,   291,    78,   292,   351,   293,   213,   294,   246,
      30,   372,    79,    28,    98,    80,   345,   190,   259,   375,
     348,   191,    81,   380,    99,    30,   382,    28,   182,   101,
     102,   386,    84,    85,    86,    87,    88,    89,    90,    30,
       5,     6,     7,   299,   416,     8,     9,    10,   103,   107,
     295,   104,    11,   105,   106,   108,    12,   193,   196,   282,
     283,   284,   285,   286,   287,   394,   109,   113,   177,   159,
     224,   225,   226,   227,   228,   229,   230,   231,   232,   233,
     234,   235,   236,   237,   184,   317,    95,    96,    35,    36,
      37,    38,   178,   122,   187,   123,   249,   250,   251,   199,
     252,   253,   238,   192,   200,   124,   239,   125,   126,   201,
     202,   342,   127,    12,   128,   129,   130,   204,   131,   344,
     132,   205,   133,   116,   117,   118,   119,    28,   134,   214,
     222,   135,    88,    89,    90,   136,   137,   138,   139,   140,
     415,   223,   255,   256,   141,   142,   143,   144,    28,   260,
     259,   266,    87,    88,    89,    90,   206,   137,   138,   139,
      30,   267,   268,   194,   194,   122,   194,   273,   185,   274,
     194,    84,    85,    86,    87,    88,    89,    90,   275,   125,
     126,   277,   276,   313,   127,    12,   128,   129,   130,   315,
     131,   324,   132,   321,   133,   323,   325,   145,   340,    28,
     134,   350,   339,   135,    88,    89,    90,   136,   137,   138,
     139,   140,   238,   373,   381,   383,   141,   142,   143,   144,
     388,   389,   391,   392,   398,   399,   403,   406,   414,   194,
      53,   112,   349,   186,    41,   115,   295,    28,   300,    85,
      86,   135,    88,    89,    90,   136,   137,   138,   139,   301,
     393,   347,   289,   411,   341,   374,   302,   272,   390,   189,
     413,   376,   370,     0,     0,     0,     0,     0,     0,   145,
     282,   283,   284,   285,   286,   287,   352,   353,   354,   355,
     356,   357,   358,   359,    28,    84,    85,    86,    87,    88,
      89,    90,   206,   137,   138,   139,    30,    28,   261,    85,
      86,    87,    88,    89,    90,   206,   137,   138,   139,    30,
     303,   304,   305,     0,     0,     0,     0,     0,     0,     0,
       0,   360,     0,   361,   362,   363,   364,   365,   366,   367,
     368
};

static const yytype_int16 yycheck[] =
{
      10,   111,   213,    58,    58,   128,   128,   179,   250,   129,
       4,   155,   156,   123,   134,   333,   334,     4,   336,     3,
     126,     4,     4,    16,     8,    35,    36,    37,    38,     4,
      55,     0,   102,   143,   104,   145,    29,     4,     4,    35,
      33,   105,     4,    39,   164,     4,    18,    43,   118,     9,
      23,    47,    25,   108,   108,   119,    35,    36,    36,    31,
      32,   105,    34,    47,    47,   105,     4,   103,    47,    48,
      49,    50,    51,   179,   102,   119,   104,   102,   380,   119,
     382,   399,   105,    36,   386,   140,   140,    35,    98,    97,
     118,    99,   202,    44,   238,   239,   119,   241,     4,    47,
     102,   111,    35,    36,   106,    56,    36,   111,   102,   105,
      97,   121,    99,   123,    47,    22,   239,   239,   128,   123,
      27,    96,    97,    98,   103,   100,   101,    37,   102,   239,
      97,    97,    99,    99,   144,   377,    36,    96,    97,    98,
     312,   100,   101,    36,   288,   102,   256,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    94,    95,    35,    36,
       4,    36,    39,   107,    41,   309,    43,   277,    45,   179,
      47,   315,   107,    35,   105,   107,   296,    39,   188,   323,
     300,    43,   107,   327,   105,    47,   330,    35,    36,   105,
      36,   335,    36,    37,    38,    39,    40,    41,    42,    47,
       5,     6,     7,   347,   415,    10,    11,    12,    37,     4,
     220,    38,    17,    36,    36,   102,    21,   340,   340,    57,
      58,    59,    60,    61,    62,   369,    14,    36,   106,   239,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,     4,   255,   301,   301,    48,    49,
      50,    51,   106,     1,    36,     3,    96,    97,    98,     4,
     100,   101,   103,   105,     4,    13,   107,    15,    16,     4,
     105,   281,    20,    21,    22,    23,    24,    54,    26,   289,
      28,    54,    30,    48,    49,    50,    51,    35,    36,     4,
       4,    39,    40,    41,    42,    43,    44,    45,    46,    47,
     410,     4,    56,   102,    52,    53,    54,    55,    35,     4,
     320,     4,    39,    40,    41,    42,    43,    44,    45,    46,
      47,     4,     4,   333,   334,     1,   336,     4,     4,     4,
     340,    36,    37,    38,    39,    40,    41,    42,     4,    15,
      16,   102,   106,     4,    20,    21,    22,    23,    24,   107,
      26,   106,    28,    96,    30,    56,   102,   105,   107,    35,
      36,     4,   106,    39,    40,    41,    42,    43,    44,    45,
      46,    47,   103,     4,     4,     4,    52,    53,    54,    55,
       4,     4,     4,     4,     4,   102,     4,    19,     4,   399,
      40,    98,   301,   123,    13,   108,   406,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
     347,   297,   219,   402,   277,   320,    54,   202,   340,   127,
     406,   325,   311,    -1,    -1,    -1,    -1,    -1,    -1,   105,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
     108,   109,   110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   108,    -1,   110,   111,   112,   113,   114,   115,   116,
     117
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     7,    10,    11,
      12,    17,    21,   123,   124,   125,   126,   127,   128,   129,
     133,   136,   213,    36,    36,     4,     9,    36,    35,    36,
      47,   137,   176,   103,   134,    48,    49,    50,    51,   215,
       4,   122,   102,   102,   130,    37,   138,    36,   135,   176,
     176,   176,   176,   124,    36,    36,     3,     8,    47,   131,
     132,     4,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,   139,   102,   104,   118,   165,   107,   107,
     107,   107,     4,   132,    36,    37,    38,    39,    40,    41,
      42,   155,   156,   157,   216,   218,   220,   142,   105,   105,
     212,   105,    36,    37,    38,    36,    36,     4,   102,    14,
     143,   145,   137,    36,   140,   157,    48,    49,    50,    51,
     144,   222,     1,     3,    13,    15,    16,    20,    22,    23,
      24,    26,    28,    30,    36,    39,    43,    44,    45,    46,
      47,    52,    53,    54,    55,   105,   132,   146,   147,   148,
     149,   150,   151,   158,   166,   167,   168,   171,   172,   176,
     177,   178,   179,   186,   193,   194,   196,   197,   198,   199,
     200,   205,   213,   214,   219,   220,   223,   106,   106,   102,
     106,   190,    36,   176,     4,     4,   147,    36,   222,   215,
      39,    43,   105,   158,   176,   192,   194,   201,   201,     4,
       4,     4,   105,   201,    54,    54,    43,   176,   223,   176,
     187,   188,   189,   223,     4,   170,   217,   218,   223,   217,
     119,   201,     4,     4,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,   103,   107,
     152,   161,   162,    36,   141,   162,   176,   222,     4,    96,
      97,    98,   100,   101,   191,    56,   102,   173,   174,   176,
       4,    36,   202,   203,   204,   217,     4,     4,     4,   206,
     208,   180,   187,     4,     4,     4,   106,   102,   190,    55,
     102,   169,    57,    58,    59,    60,    61,    62,   221,   169,
      36,    39,    41,    43,    45,   176,   195,   163,   164,   217,
      36,    47,    54,   108,   109,   110,   153,   154,   158,   159,
     194,   217,   223,     4,   217,   107,   212,   176,   223,     4,
     102,    96,   175,    56,   106,   102,   210,    23,    25,   207,
      22,    27,   209,    18,    31,    32,    34,   181,   182,   106,
     107,   189,   176,   217,   176,   201,   104,   165,   201,   156,
       4,   217,    63,    64,    65,    66,    67,    68,    69,    70,
     108,   110,   111,   112,   113,   114,   115,   116,   117,   160,
     221,   162,   217,     4,   174,   217,   204,    97,    99,   211,
     217,     4,   217,     4,   193,   193,   217,   193,     4,     4,
     192,     4,     4,   164,   217,   212,   210,   210,     4,   102,
     183,   210,   184,     4,     4,     4,    19,   193,     4,    29,
      33,   172,   185,   195,     4,   223,   190,     4
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
        case 2:
#line 234 "pir.y"
    { emit1("end"); ;}
    break;

  case 76:
#line 378 "pir.y"
    { yyerrok; ;}
    break;

  case 77:
#line 381 "pir.y"
    { emit2("null", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 78:
#line 382 "pir.y"
    { emit2("null", (yyvsp[(1) - (4)].sval)); ;}
    break;

  case 100:
#line 437 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 101:
#line 438 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 102:
#line 439 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 103:
#line 442 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 104:
#line 443 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 105:
#line 444 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 106:
#line 445 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 107:
#line 446 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 108:
#line 447 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 109:
#line 448 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 110:
#line 449 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 111:
#line 450 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 112:
#line 451 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 113:
#line 452 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 114:
#line 453 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 115:
#line 454 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 116:
#line 455 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 117:
#line 456 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 118:
#line 457 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 119:
#line 458 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 120:
#line 459 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 121:
#line 463 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 122:
#line 464 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 123:
#line 465 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 124:
#line 466 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 125:
#line 467 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 126:
#line 468 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 127:
#line 469 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 128:
#line 470 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 129:
#line 471 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 130:
#line 472 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 131:
#line 473 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 132:
#line 474 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 133:
#line 475 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 134:
#line 476 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 141:
#line 495 "pir.y"
    { emit3((yyvsp[(1) - (5)].sval), (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 142:
#line 497 "pir.y"
    { emit3((yyvsp[(1) - (5)].sval), (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 143:
#line 500 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 144:
#line 501 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 145:
#line 505 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 146:
#line 506 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 151:
#line 518 "pir.y"
    { emit2("branch", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 156:
#line 531 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 157:
#line 532 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 163:
#line 551 "pir.y"
    {


                           ;}
    break;

  case 205:
#line 636 "pir.y"
    {
                            emit1("set_returns");
                            emit1("returncc");
                       ;}
    break;

  case 208:
#line 648 "pir.y"
    {
                            emit1("set_returns");
                            emit1("returncc");
                        ;}
    break;

  case 210:
#line 656 "pir.y"
    {
                           emit1("yield");
                       ;}
    break;

  case 254:
#line 747 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 255:
#line 748 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 256:
#line 749 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 257:
#line 750 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 258:
#line 751 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 259:
#line 752 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2375 "pirparser.c"
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


#line 765 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


