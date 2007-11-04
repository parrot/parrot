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
#define YY_DECL int yylex(YYSTYPE *yylval,  yyscan_t yyscanner)

#include "pirlexer.h"


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
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 368 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 381 "pirparser.c"

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
#define YYLAST   476

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  117
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  99
/* YYNRULES -- Number of rules.  */
#define YYNRULES  252
/* YYNRULES -- Number of states.  */
#define YYNSTATES  402

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   356

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   109,     2,     2,     2,   114,     2,     2,
     105,   106,   113,   111,   102,   108,   116,   112,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   115,
       2,   107,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   103,     2,   104,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,   110,     2,     2,     2,
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
      95,    96,    97,    98,    99,   100,   101
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    30,    32,    36,    39,    44,    49,
      54,    55,    58,    61,    64,    66,    70,    72,    77,    79,
      83,    91,    93,    95,    96,    99,   101,   103,   105,   107,
     109,   111,   116,   119,   124,   126,   128,   129,   133,   135,
     137,   139,   141,   142,   145,   150,   153,   158,   159,   162,
     165,   168,   170,   172,   174,   176,   178,   180,   182,   184,
     186,   188,   190,   192,   194,   196,   198,   201,   205,   210,
     216,   219,   223,   226,   230,   233,   236,   238,   242,   245,
     247,   250,   252,   254,   257,   258,   260,   262,   266,   268,
     271,   273,   275,   277,   279,   281,   283,   285,   287,   289,
     291,   293,   295,   297,   299,   301,   303,   305,   307,   309,
     311,   313,   315,   317,   319,   321,   323,   325,   327,   329,
     331,   335,   337,   341,   343,   345,   347,   351,   355,   359,
     364,   366,   370,   372,   375,   377,   379,   385,   387,   389,
     398,   399,   402,   407,   411,   414,   420,   421,   424,   425,
     428,   433,   435,   442,   446,   449,   450,   452,   454,   458,
     461,   462,   465,   467,   469,   471,   474,   476,   478,   480,
     482,   484,   486,   491,   493,   495,   497,   499,   501,   503,
     505,   507,   513,   515,   517,   521,   525,   529,   533,   534,
     536,   538,   542,   545,   549,   555,   556,   559,   564,   565,
     568,   573,   574,   577,   579,   582,   583,   587,   590,   593,
     597,   602,   607,   612,   617,   620,   622,   626,   628,   630,
     632,   634,   636,   638,   640,   642,   644,   646,   648,   650,
     652,   654,   656,   658,   660,   662,   664,   666,   668,   670,
     672,   674,   676
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     118,     0,    -1,   119,   120,   119,    -1,    -1,     4,    -1,
     121,    -1,   120,     4,   121,    -1,   132,    -1,   205,    -1,
     130,    -1,   126,    -1,   124,    -1,   125,    -1,   123,    -1,
     122,    -1,    10,     9,    37,    -1,    11,    36,    -1,     5,
      36,   102,    36,    -1,     6,    36,   102,    36,    -1,     7,
       4,   127,     8,    -1,    -1,   127,   128,    -1,     3,     4,
      -1,     3,   129,    -1,   129,    -1,    47,   151,     4,    -1,
      17,    -1,    17,   103,   131,   104,    -1,    36,    -1,   131,
     161,    36,    -1,    12,   133,   134,     4,   138,   141,    13,
      -1,   168,    -1,    36,    -1,    -1,   134,   135,    -1,    88,
      -1,    85,    -1,    86,    -1,    87,    -1,    89,    -1,    92,
      -1,    90,   105,   133,   106,    -1,    91,   204,    -1,    93,
     105,   136,   106,    -1,    94,    -1,    95,    -1,    -1,   136,
     102,   137,    -1,   168,    -1,    36,    -1,   158,    -1,   214,
      -1,    -1,   138,   139,    -1,    14,   140,   182,     4,    -1,
     214,   168,    -1,   214,    36,    56,   168,    -1,    -1,   141,
     142,    -1,     3,     4,    -1,     3,   143,    -1,   143,    -1,
     162,    -1,   163,    -1,   164,    -1,   165,    -1,   169,    -1,
     206,    -1,   188,    -1,   190,    -1,   170,    -1,   147,    -1,
     146,    -1,   129,    -1,   145,    -1,   144,    -1,     1,     4,
      -1,    54,   215,     4,    -1,   215,   107,    54,     4,    -1,
      30,   105,   179,   106,     4,    -1,   186,     4,    -1,   215,
     148,     4,    -1,   157,   209,    -1,   158,   107,   209,    -1,
     107,   149,    -1,   155,   209,    -1,   209,    -1,   209,   156,
     209,    -1,   215,   158,    -1,   154,    -1,    36,   193,    -1,
     186,    -1,   150,    -1,    47,   152,    -1,    -1,   152,    -1,
     153,    -1,   152,   102,   153,    -1,   209,    -1,   185,   193,
      -1,   108,    -1,   109,    -1,   110,    -1,   111,    -1,   108,
      -1,   112,    -1,   113,    -1,   114,    -1,    70,    -1,    63,
      -1,    64,    -1,    65,    -1,    67,    -1,    68,    -1,    66,
      -1,    69,    -1,    74,    -1,    75,    -1,    76,    -1,    77,
      -1,    78,    -1,    79,    -1,    82,    -1,    80,    -1,    81,
      -1,    83,    -1,    84,    -1,    72,    -1,    73,    -1,    71,
      -1,   103,   159,   104,    -1,   160,    -1,   159,   161,   160,
      -1,   209,    -1,   115,    -1,   102,    -1,    52,   208,   164,
      -1,    53,   208,   164,    -1,    55,   168,     4,    -1,    16,
     214,   166,     4,    -1,   167,    -1,   166,   102,   167,    -1,
     168,    -1,   168,    96,    -1,    35,    -1,    47,    -1,    15,
      36,   102,   215,     4,    -1,   171,    -1,   178,    -1,    28,
       4,   172,   174,     4,   176,    29,     4,    -1,    -1,   172,
     173,    -1,    32,   209,   202,     4,    -1,    31,   185,   175,
      -1,    34,   185,    -1,    18,   185,     4,    19,   187,    -1,
      -1,   102,   185,    -1,    -1,   176,   177,    -1,    33,   215,
     182,     4,    -1,   165,    -1,   105,   179,   106,   107,   184,
       4,    -1,    36,   193,     4,    -1,   154,     4,    -1,    -1,
     180,    -1,   181,    -1,   180,   102,   181,    -1,   215,   182,
      -1,    -1,   182,   183,    -1,   100,    -1,   101,    -1,    98,
      -1,    97,   204,    -1,    96,    -1,   154,    -1,   186,    -1,
      43,    -1,    39,    -1,   168,    -1,   185,   116,   187,   193,
      -1,   168,    -1,    36,    -1,    45,    -1,    41,    -1,    39,
      -1,    43,    -1,   191,    -1,   189,    -1,    26,     4,   200,
      27,     4,    -1,   192,    -1,   197,    -1,    22,   193,     4,
      -1,    22,   184,     4,    -1,    23,   193,     4,    -1,   105,
     194,   106,    -1,    -1,   195,    -1,   196,    -1,   195,   102,
     196,    -1,   209,   202,    -1,    36,    56,   209,    -1,    24,
       4,   198,    25,     4,    -1,    -1,   198,   199,    -1,    23,
     209,   202,     4,    -1,    -1,   200,   201,    -1,    22,   209,
     202,     4,    -1,    -1,   202,   203,    -1,    99,    -1,    97,
     204,    -1,    -1,   105,    36,   106,    -1,    21,   207,    -1,
     205,     4,    -1,    20,   207,     4,    -1,    48,   168,   107,
      37,    -1,    49,   168,   107,    38,    -1,    50,   168,   107,
      36,    -1,    51,   168,   107,    36,    -1,    54,   209,    -1,
     209,    -1,   209,   213,   209,    -1,   215,    -1,   210,    -1,
      36,    -1,    37,    -1,    38,    -1,    43,    -1,    44,    -1,
      46,    -1,    45,    -1,   212,    -1,    39,    -1,    40,    -1,
      42,    -1,    41,    -1,    57,    -1,    58,    -1,    59,    -1,
      60,    -1,    62,    -1,    61,    -1,    48,    -1,    49,    -1,
      50,    -1,    51,    -1,   211,    -1,   168,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   210,   210,   215,   216,   219,   220,   223,   224,   225,
     226,   227,   228,   229,   230,   233,   236,   241,   244,   249,
     255,   256,   259,   260,   261,   264,   269,   270,   273,   274,
     279,   285,   286,   289,   290,   293,   294,   295,   296,   297,
     298,   299,   300,   301,   302,   303,   306,   307,   310,   311,
     312,   313,   316,   317,   320,   323,   324,   330,   331,   335,
     336,   337,   340,   341,   342,   343,   344,   345,   346,   347,
     348,   349,   350,   351,   352,   353,   354,   357,   358,   361,
     364,   367,   370,   371,   372,   375,   376,   377,   378,   379,
     380,   381,   382,   386,   389,   390,   393,   394,   397,   401,
     404,   405,   406,   409,   410,   411,   412,   413,   414,   415,
     416,   417,   418,   419,   420,   421,   425,   426,   427,   428,
     429,   430,   431,   432,   433,   434,   435,   436,   437,   438,
     441,   444,   445,   448,   451,   452,   456,   459,   462,   465,
     468,   469,   472,   473,   476,   477,   480,   483,   484,   487,
     494,   495,   498,   501,   502,   503,   507,   508,   511,   512,
     515,   516,   519,   520,   521,   524,   525,   528,   529,   532,
     535,   536,   539,   540,   541,   542,   543,   546,   547,   550,
     551,   552,   555,   558,   559,   560,   561,   562,   563,   566,
     567,   570,   576,   577,   580,   581,   584,   587,   590,   591,
     594,   595,   598,   599,   602,   607,   608,   611,   614,   615,
     618,   621,   622,   625,   626,   629,   630,   633,   636,   637,
     640,   641,   642,   643,   646,   647,   648,   651,   652,   655,
     656,   657,   660,   661,   662,   663,   664,   668,   669,   670,
     671,   674,   675,   676,   677,   678,   679,   682,   683,   684,
     685,   688,   689
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
  "';'", "'.'", "$accept", "program", "opt_nl", "compilation_units",
  "compilation_unit", "pir_pragma", "loadlib", "hll_specifier",
  "hll_mapping", "emit_block", "pasm_instructions", "pasm_instruction",
  "parrot_statement", "namespace_declaration", "namespace_id",
  "sub_definition", "sub_id", "sub_flags", "sub_flag", "multi_type_list",
  "multi_type", "parameters", "parameter", "param_def", "instructions",
  "labeled_instruction", "instruction", "null_statement",
  "getresults_statement", "methodcall_statement", "assignment_statement",
  "assignment_tail", "assignment_expression", "parrot_instruction",
  "opt_parrot_op_args", "parrot_op_args", "parrot_op_arg",
  "simple_invocation", "unop", "binop", "augmented_op", "keylist", "keys",
  "key", "separator", "if_statement", "unless_statement", "goto_statement",
  "local_declaration", "local_id_list", "local_id", "identifier",
  "lex_declaration", "invocation_statement", "long_invocation_statement",
  "long_arguments", "long_argument", "long_invocation",
  "opt_return_continuation", "long_results", "long_result",
  "short_invocation_statement", "opt_target_list", "target_list",
  "result_target", "param_flags", "param_flag", "invocation_expression",
  "invokable", "methodcall", "method", "return_statement",
  "long_return_statement", "yield_statement", "short_return_statement",
  "short_yield_statement", "arguments", "opt_arguments_list",
  "arguments_list", "argument", "long_yield_statement",
  "yield_expressions", "yield_expression", "return_expressions",
  "return_expression", "arg_flags", "arg_flag", "opt_paren_string",
  "const_declaration", "const_decl_statement", "const_tail", "condition",
  "expression", "constant", "reg", "pasm_reg", "rel_op", "type", "target", 0
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
     126,    43,    47,    42,    37,    59,    46
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   117,   118,   119,   119,   120,   120,   121,   121,   121,
     121,   121,   121,   121,   121,   122,   123,   124,   125,   126,
     127,   127,   128,   128,   128,   129,   130,   130,   131,   131,
     132,   133,   133,   134,   134,   135,   135,   135,   135,   135,
     135,   135,   135,   135,   135,   135,   136,   136,   137,   137,
     137,   137,   138,   138,   139,   140,   140,   141,   141,   142,
     142,   142,   143,   143,   143,   143,   143,   143,   143,   143,
     143,   143,   143,   143,   143,   143,   143,   144,   144,   145,
     146,   147,   148,   148,   148,   149,   149,   149,   149,   149,
     149,   149,   149,   150,   151,   151,   152,   152,   153,   154,
     155,   155,   155,   156,   156,   156,   156,   156,   156,   156,
     156,   156,   156,   156,   156,   156,   157,   157,   157,   157,
     157,   157,   157,   157,   157,   157,   157,   157,   157,   157,
     158,   159,   159,   160,   161,   161,   162,   163,   164,   165,
     166,   166,   167,   167,   168,   168,   169,   170,   170,   171,
     172,   172,   173,   174,   174,   174,   175,   175,   176,   176,
     177,   177,   178,   178,   178,   179,   179,   180,   180,   181,
     182,   182,   183,   183,   183,   183,   183,   184,   184,   185,
     185,   185,   186,   187,   187,   187,   187,   187,   187,   188,
     188,   189,   190,   190,   191,   191,   192,   193,   194,   194,
     195,   195,   196,   196,   197,   198,   198,   199,   200,   200,
     201,   202,   202,   203,   203,   204,   204,   205,   206,   206,
     207,   207,   207,   207,   208,   208,   208,   209,   209,   210,
     210,   210,   211,   211,   211,   211,   211,   212,   212,   212,
     212,   213,   213,   213,   213,   213,   213,   214,   214,   214,
     214,   215,   215
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     2,     4,     4,     4,
       0,     2,     2,     2,     1,     3,     1,     4,     1,     3,
       7,     1,     1,     0,     2,     1,     1,     1,     1,     1,
       1,     4,     2,     4,     1,     1,     0,     3,     1,     1,
       1,     1,     0,     2,     4,     2,     4,     0,     2,     2,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     3,     4,     5,
       2,     3,     2,     3,     2,     2,     1,     3,     2,     1,
       2,     1,     1,     2,     0,     1,     1,     3,     1,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     1,     3,     1,     1,     1,     3,     3,     3,     4,
       1,     3,     1,     2,     1,     1,     5,     1,     1,     8,
       0,     2,     4,     3,     2,     5,     0,     2,     0,     2,
       4,     1,     6,     3,     2,     0,     1,     1,     3,     2,
       0,     2,     1,     1,     1,     2,     1,     1,     1,     1,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     5,     1,     1,     3,     3,     3,     3,     0,     1,
       1,     3,     2,     3,     5,     0,     2,     4,     0,     2,
       4,     0,     2,     1,     2,     0,     3,     2,     2,     3,
       4,     4,     4,     4,     2,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    26,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,   144,    32,
     145,    33,    31,     0,     0,     0,     0,     0,   217,     4,
       2,     0,     0,     0,    15,     0,    28,     0,     0,     0,
       0,     0,     6,    17,    18,     0,    19,    94,    21,    24,
      52,    36,    37,    38,    35,    39,     0,   215,    40,     0,
      44,    45,    34,   135,    27,   134,     0,     0,     0,     0,
       0,    22,    23,   229,   230,   231,   237,   238,   240,   239,
     232,   233,   235,   234,     0,    95,    96,   252,    98,   228,
     251,   236,   227,    57,     0,     0,    42,    46,    29,   220,
     221,   222,   223,    25,     0,     0,    53,     0,     0,     0,
       0,    97,   247,   248,   249,   250,   170,     0,     0,     0,
      30,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   237,   232,   145,     0,     0,     0,     0,   165,    73,
      58,    61,    75,    74,    72,    71,     0,    62,    63,    64,
      65,   252,    66,    70,   147,   148,     0,     0,    68,   190,
      69,   189,   192,   193,     0,    67,     0,    41,   216,     0,
      43,     0,     0,    55,    76,    59,    60,     0,     0,     0,
     180,   179,   198,   177,   181,     0,   178,     0,     0,   205,
     208,   150,   165,     0,     0,     0,   225,     0,     0,     0,
       0,   166,   167,   170,   164,     0,    99,    80,   218,   129,
     127,   128,   116,   117,   118,   119,   120,   121,   123,   124,
     122,   125,   126,     0,     0,     0,     0,     0,    49,    47,
      50,    48,    51,    54,   176,   215,   174,   172,   173,   171,
       0,     0,     0,   140,   142,   219,   229,     0,   199,   200,
     211,   195,   194,   196,     0,     0,     0,     0,   163,   224,
     136,   241,   242,   243,   244,   246,   245,     0,   137,    77,
     138,     0,     0,   169,   184,   187,   186,   188,   185,   183,
       0,     0,   131,   133,   229,   145,     0,   100,   101,   102,
      84,    92,    89,     0,    91,    86,   227,    81,    82,     0,
     175,    56,     0,   139,     0,   143,     0,   197,     0,   202,
       0,     0,   206,     0,     0,   209,     0,     0,     0,     0,
     151,     0,     0,   226,     0,   168,   182,   130,     0,    90,
      93,    78,    85,   109,   110,   111,   114,   112,   113,   115,
     108,   104,   103,   105,   106,   107,     0,    88,    83,   146,
     141,   203,   201,   215,   213,   212,   211,   204,   211,   191,
       0,   156,   211,   154,   158,    79,     0,   132,    87,   214,
       0,     0,     0,     0,   153,     0,     0,   162,   207,   210,
       0,   157,   152,     0,     0,   161,   159,   155,   149,   170,
       0,   160
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      43,    58,   149,    20,    47,    21,    31,    45,    72,   120,
     239,   103,   116,   126,   117,   150,   151,   152,   153,   154,
     155,   235,   300,   301,    94,    95,    96,   156,   303,   356,
     236,   237,   291,   292,    76,   157,   158,   159,   160,   252,
     253,    97,   162,   163,   164,   266,   330,   331,   384,   386,
     396,   165,   210,   211,   212,   181,   249,   195,   166,   167,
     290,   168,   169,   170,   171,   172,   197,   257,   258,   259,
     173,   264,   322,   265,   325,   319,   365,   106,    22,   175,
      38,   205,    98,    99,   100,   101,   277,   127,   102
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -294
static const yytype_int16 yypact[] =
{
      36,  -294,    47,    66,  -294,    19,    20,    71,    87,    61,
      23,    22,   150,   109,  -294,  -294,  -294,  -294,  -294,  -294,
    -294,  -294,  -294,    28,    53,  -294,    85,  -294,  -294,  -294,
    -294,  -294,  -294,   122,    -6,    -6,    -6,    -6,  -294,    66,
    -294,   128,   138,    13,  -294,    57,  -294,   -65,    26,    79,
      88,    96,  -294,  -294,  -294,    10,  -294,   416,  -294,  -294,
    -294,  -294,  -294,  -294,  -294,  -294,    68,    99,  -294,   103,
    -294,  -294,  -294,  -294,  -294,  -294,   181,   183,   180,   187,
     189,  -294,  -294,  -294,  -294,  -294,  -294,  -294,  -294,  -294,
    -294,  -294,  -294,  -294,   227,   131,  -294,  -294,  -294,  -294,
    -294,  -294,  -294,   221,    23,   201,  -294,  -294,  -294,  -294,
    -294,  -294,  -294,  -294,   416,   162,  -294,   206,   132,   133,
      54,  -294,  -294,  -294,  -294,  -294,  -294,    44,   239,   253,
    -294,   208,   162,   150,   -24,   151,   251,   266,   267,   167,
     151,   -96,   -67,   366,   393,   393,   320,    -6,   320,  -294,
    -294,  -294,  -294,  -294,  -294,  -294,   276,  -294,  -294,  -294,
    -294,   -16,  -294,  -294,  -294,  -294,    65,   278,  -294,  -294,
    -294,  -294,  -294,  -294,   280,  -294,   343,  -294,  -294,    17,
    -294,    14,   229,  -294,  -294,  -294,  -294,   184,    -6,   283,
    -294,  -294,   429,  -294,  -294,   286,  -294,   287,   297,  -294,
    -294,  -294,   320,   298,   416,   248,   205,   248,   305,   306,
     207,   210,  -294,  -294,  -294,   118,  -294,  -294,  -294,  -294,
    -294,  -294,  -294,  -294,  -294,  -294,  -294,  -294,  -294,  -294,
    -294,  -294,  -294,   416,   290,   310,   416,   211,  -294,  -294,
    -294,  -294,  -294,  -294,  -294,    99,  -294,  -294,  -294,  -294,
      -6,   320,     6,  -294,   219,  -294,   264,   215,   220,  -294,
    -294,  -294,  -294,  -294,   160,    82,    67,   217,  -294,  -294,
    -294,  -294,  -294,  -294,  -294,  -294,  -294,   416,  -294,  -294,
    -294,   231,   320,    92,  -294,  -294,  -294,  -294,  -294,  -294,
     151,     1,  -294,  -294,   151,   416,   335,  -294,  -294,  -294,
    -294,  -294,  -294,   416,  -294,   282,   237,  -294,  -294,   416,
    -294,  -294,   337,  -294,    -6,  -294,   416,  -294,   429,    97,
     416,   338,  -294,   416,   339,  -294,   137,   137,   416,   137,
    -294,   349,   350,  -294,   137,  -294,  -294,  -294,   416,  -294,
     131,  -294,  -294,  -294,  -294,  -294,  -294,  -294,  -294,  -294,
    -294,  -294,  -294,  -294,  -294,  -294,   416,  -294,  -294,  -294,
    -294,  -294,  -294,    99,  -294,  -294,  -294,  -294,  -294,  -294,
     352,   255,  -294,  -294,  -294,  -294,   364,  -294,  -294,  -294,
      24,    41,   353,   137,  -294,    42,    15,  -294,  -294,  -294,
     118,  -294,  -294,   365,   320,  -294,  -294,  -294,  -294,  -294,
      31,  -294
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -294,  -294,   358,  -294,   336,  -294,  -294,  -294,  -294,  -294,
    -294,  -294,    -1,  -294,  -294,  -294,   270,  -294,  -294,  -294,
    -294,  -294,  -294,  -294,  -294,  -294,   247,  -294,  -294,  -294,
    -294,  -294,  -294,  -294,  -294,    83,   263,  -132,  -294,  -294,
    -294,  -172,  -294,    43,    91,  -294,  -294,     9,    -7,  -294,
      69,   -10,  -294,  -294,  -294,  -294,  -294,  -294,  -294,  -294,
    -294,  -294,   182,  -294,   104,  -208,  -294,    51,  -293,  -128,
      -3,  -294,  -294,  -294,  -294,  -294,  -123,  -294,  -294,    70,
    -294,  -294,  -294,  -294,  -294,  -284,  -294,  -237,   -55,  -294,
     256,   246,  -141,  -294,  -294,  -294,  -294,  -110,  -116
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -182
static const yytype_int16 yytable[] =
{
      32,   176,   193,   206,   206,   283,   196,   240,   310,  -180,
     313,    28,   198,   176,    81,   190,    55,   203,   243,   191,
    -180,    56,   188,    30,    48,    49,    50,    51,   388,    28,
     208,   132,   213,   370,   371,   401,   373,    73,  -179,    74,
       1,    30,    59,   216,   393,   389,   392,     4,   394,  -179,
      75,   260,    28,   238,    82,    23,    24,    57,    28,    29,
      57,    60,   174,   269,    30,   122,   123,   124,   125,   242,
      30,     5,     6,     7,   174,    25,     8,     9,    10,    28,
     182,   192,   380,    11,   381,   326,   213,    12,   385,  -181,
     391,    30,   293,   305,    32,   308,    26,    27,   327,   328,
    -181,   329,   302,    73,   323,   337,   304,   161,   314,   324,
     244,   245,   246,    39,   247,   248,    75,   183,   306,   161,
     233,   363,    44,   364,   194,    33,   379,   244,   245,   246,
      41,   247,   248,    77,   357,   312,   333,   209,   363,   363,
     364,   364,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    28,   284,    42,   179,   285,    46,   286,
     180,   287,   342,   288,    53,    30,   213,   336,   358,   241,
     192,   339,    28,   104,    54,   361,   190,   260,   254,   366,
     191,   215,   368,   320,    30,   321,    78,   372,   244,   245,
     246,   400,   247,   248,   363,    79,   364,   293,    34,    35,
      36,    37,   193,    80,   105,   289,   196,   128,   107,   129,
     122,   123,   124,   125,   270,   378,   278,   108,   110,   130,
     109,   131,   132,   111,   161,   112,   133,    12,   134,   135,
     136,   113,   137,   114,   138,   115,   139,   119,   177,   178,
     311,    28,   140,   184,   187,   141,    87,    88,    89,   142,
      91,    92,    93,   143,   128,   199,   192,   185,   144,   145,
     146,   147,   271,   272,   273,   274,   275,   276,   131,   132,
     200,   201,   202,   133,    12,   134,   135,   136,   399,   137,
     214,   138,   217,   139,   218,   250,   251,   255,    28,   140,
     261,   262,   141,    87,    88,    89,   142,    91,    92,    93,
     143,   263,   268,   147,   254,   144,   145,   146,   147,   279,
     280,   148,   282,   281,   307,   315,   194,   194,   309,   194,
     316,   317,   318,   332,   194,    28,   294,    84,    85,   141,
      87,    88,    89,   142,    91,    92,    93,   295,   334,   341,
     233,   359,   367,   369,   296,   343,   344,   345,   346,   347,
     348,   349,   350,   374,   375,    28,   382,   383,   148,    86,
      87,    88,    89,    90,    91,    92,    93,    30,   387,   398,
     -94,    40,   390,   194,   118,    52,   186,   121,   340,   395,
     289,   377,   338,   360,   267,   376,   335,   397,   362,   189,
     351,   207,     0,   352,   353,   354,   355,     0,   297,   298,
     299,    28,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    30,   219,   220,   221,   222,   223,   224,
     225,   226,   227,   228,   229,   230,   231,   232,    28,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      30,     0,     0,     0,     0,     0,   233,   204,     0,     0,
     234,    28,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    30,    28,   256,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    30
};

static const yytype_int16 yycheck[] =
{
      10,   117,   134,   144,   145,   213,   134,   179,   245,   105,
       4,    35,   135,   129,     4,    39,     3,   140,     4,    43,
     116,     8,   132,    47,    34,    35,    36,    37,     4,    35,
     146,    16,   148,   326,   327,     4,   329,   102,   105,   104,
       4,    47,    43,   166,    29,     4,     4,     0,    33,   116,
     115,   192,    35,    36,    55,    36,    36,    47,    35,    36,
      47,     4,   117,   204,    47,    48,    49,    50,    51,   179,
      47,     5,     6,     7,   129,     4,    10,    11,    12,    35,
      36,   105,   366,    17,   368,    18,   202,    21,   372,   105,
     383,    47,   233,   234,   104,   236,     9,    36,    31,    32,
     116,    34,   234,   102,    22,   104,   234,   117,   102,    27,
      96,    97,    98,     4,   100,   101,   115,   127,   234,   129,
     103,    97,    37,    99,   134,   103,   363,    96,    97,    98,
     102,   100,   101,   107,   306,   251,   277,   147,    97,    97,
      99,    99,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    35,    36,   102,   102,    39,    36,    41,
     106,    43,   303,    45,    36,    47,   282,   290,   309,   179,
     105,   294,    35,   105,    36,   316,    39,   318,   188,   320,
      43,   116,   323,    23,    47,    25,   107,   328,    96,    97,
      98,   399,   100,   101,    97,   107,    99,   338,    48,    49,
      50,    51,   334,   107,   105,   215,   334,     1,   105,     3,
      48,    49,    50,    51,   205,   356,   207,    36,    38,    13,
      37,    15,    16,    36,   234,    36,    20,    21,    22,    23,
      24,     4,    26,   102,    28,    14,    30,    36,   106,   106,
     250,    35,    36,     4,    36,    39,    40,    41,    42,    43,
      44,    45,    46,    47,     1,     4,   105,     4,    52,    53,
      54,    55,    57,    58,    59,    60,    61,    62,    15,    16,
       4,     4,   105,    20,    21,    22,    23,    24,   394,    26,
       4,    28,     4,    30,     4,    56,   102,     4,    35,    36,
       4,     4,    39,    40,    41,    42,    43,    44,    45,    46,
      47,     4,     4,    55,   314,    52,    53,    54,    55,     4,
       4,   105,   102,   106,     4,    96,   326,   327,   107,   329,
      56,   106,   102,   106,   334,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,   107,     4,
     103,     4,     4,     4,    54,    63,    64,    65,    66,    67,
      68,    69,    70,     4,     4,    35,     4,   102,   105,    39,
      40,    41,    42,    43,    44,    45,    46,    47,     4,     4,
       4,    13,    19,   383,   104,    39,   129,   114,   295,   386,
     390,   338,   291,   314,   202,   334,   282,   390,   318,   133,
     108,   145,    -1,   111,   112,   113,   114,    -1,   108,   109,
     110,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    -1,    -1,    -1,    -1,    -1,   103,    54,    -1,    -1,
     107,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   118,   119,     0,     5,     6,     7,    10,    11,
      12,    17,    21,   120,   121,   122,   123,   124,   125,   126,
     130,   132,   205,    36,    36,     4,     9,    36,    35,    36,
      47,   133,   168,   103,    48,    49,    50,    51,   207,     4,
     119,   102,   102,   127,    37,   134,    36,   131,   168,   168,
     168,   168,   121,    36,    36,     3,     8,    47,   128,   129,
       4,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,   135,   102,   104,   115,   161,   107,   107,   107,
     107,     4,   129,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,   151,   152,   153,   168,   209,   210,
     211,   212,   215,   138,   105,   105,   204,   105,    36,    37,
      38,    36,    36,     4,   102,    14,   139,   141,   133,    36,
     136,   153,    48,    49,    50,    51,   140,   214,     1,     3,
      13,    15,    16,    20,    22,    23,    24,    26,    28,    30,
      36,    39,    43,    47,    52,    53,    54,    55,   105,   129,
     142,   143,   144,   145,   146,   147,   154,   162,   163,   164,
     165,   168,   169,   170,   171,   178,   185,   186,   188,   189,
     190,   191,   192,   197,   205,   206,   215,   106,   106,   102,
     106,   182,    36,   168,     4,     4,   143,    36,   214,   207,
      39,    43,   105,   154,   168,   184,   186,   193,   193,     4,
       4,     4,   105,   193,    54,   208,   209,   208,   215,   168,
     179,   180,   181,   215,     4,   116,   193,     4,     4,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,   103,   107,   148,   157,   158,    36,   137,
     158,   168,   214,     4,    96,    97,    98,   100,   101,   183,
      56,   102,   166,   167,   168,     4,    36,   194,   195,   196,
     209,     4,     4,     4,   198,   200,   172,   179,     4,   209,
     164,    57,    58,    59,    60,    61,    62,   213,   164,     4,
       4,   106,   102,   182,    36,    39,    41,    43,    45,   168,
     187,   159,   160,   209,    36,    47,    54,   108,   109,   110,
     149,   150,   154,   155,   186,   209,   215,     4,   209,   107,
     204,   168,   215,     4,   102,    96,    56,   106,   102,   202,
      23,    25,   199,    22,    27,   201,    18,    31,    32,    34,
     173,   174,   106,   209,   107,   181,   193,   104,   161,   193,
     152,     4,   209,    63,    64,    65,    66,    67,    68,    69,
      70,   108,   111,   112,   113,   114,   156,   158,   209,     4,
     167,   209,   196,    97,    99,   203,   209,     4,   209,     4,
     185,   185,   209,   185,     4,     4,   184,   160,   209,   204,
     202,   202,     4,   102,   175,   202,   176,     4,     4,     4,
      19,   185,     4,    29,    33,   165,   177,   187,     4,   215,
     182,     4
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
        case 76:
#line 354 "pir.y"
    { yyerrok; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2046 "pirparser.c"
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


#line 692 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


