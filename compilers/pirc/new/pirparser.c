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
     TK_DOTDOT = 259,
     TK_NL = 260,
     TK_HLL = 261,
     TK_HLL_MAP = 262,
     TK_EMIT = 263,
     TK_EOM = 264,
     TK_N_OPERATORS = 265,
     TK_PRAGMA = 266,
     TK_LOADLIB = 267,
     TK_SUB = 268,
     TK_END = 269,
     TK_PARAM = 270,
     TK_LEX = 271,
     TK_LOCAL = 272,
     TK_NAMESPACE = 273,
     TK_INVOCANT = 274,
     TK_METH_CALL = 275,
     TK_GLOBALCONST = 276,
     TK_CONST = 277,
     TK_RETURN = 278,
     TK_YIELD = 279,
     TK_BEGIN_YIELD = 280,
     TK_END_YIELD = 281,
     TK_BEGIN_RETURN = 282,
     TK_END_RETURN = 283,
     TK_BEGIN_CALL = 284,
     TK_END_CALL = 285,
     TK_GET_RESULTS = 286,
     TK_CALL = 287,
     TK_ARG = 288,
     TK_RESULT = 289,
     TK_NCI_CALL = 290,
     TK_IDENT = 291,
     TK_STRINGC = 292,
     TK_INTC = 293,
     TK_NUMC = 294,
     TK_PASM_PREG = 295,
     TK_PASM_NREG = 296,
     TK_PASM_SREG = 297,
     TK_PASM_IREG = 298,
     TK_SYM_PREG = 299,
     TK_SYM_NREG = 300,
     TK_SYM_SREG = 301,
     TK_SYM_IREG = 302,
     TK_PARROT_OP = 303,
     TK_INT = 304,
     TK_NUM = 305,
     TK_PMC = 306,
     TK_STRING = 307,
     TK_IF = 308,
     TK_UNLESS = 309,
     TK_NULL = 310,
     TK_GOTO = 311,
     TK_ARROW = 312,
     TK_NE = 313,
     TK_EQ = 314,
     TK_LT = 315,
     TK_LE = 316,
     TK_GT = 317,
     TK_GE = 318,
     TK_USHIFT = 319,
     TK_RSHIFT = 320,
     TK_LSHIFT = 321,
     TK_FDIV = 322,
     TK_OR = 323,
     TK_AND = 324,
     TK_XOR = 325,
     TK_CONC = 326,
     TK_ASSIGN_USHIFT = 327,
     TK_ASSIGN_RSHIFT = 328,
     TK_ASSIGN_LSHIFT = 329,
     TK_ASSIGN_INC = 330,
     TK_ASSIGN_DEC = 331,
     TK_ASSIGN_MUL = 332,
     TK_ASSIGN_MOD = 333,
     TK_ASSIGN_POW = 334,
     TK_ASSIGN_DIV = 335,
     TK_ASSIGN_BOR = 336,
     TK_ASSIGN_BAND = 337,
     TK_ASSIGN_FDIV = 338,
     TK_ASSIGN_BNOT = 339,
     TK_ASSIGN_CONC = 340,
     TK_FLAG_INIT = 341,
     TK_FLAG_LOAD = 342,
     TK_FLAG_MAIN = 343,
     TK_FLAG_ANON = 344,
     TK_FLAG_METHOD = 345,
     TK_FLAG_OUTER = 346,
     TK_FLAG_VTABLE = 347,
     TK_FLAG_LEX = 348,
     TK_FLAG_MULTI = 349,
     TK_FLAG_POSTCOMP = 350,
     TK_FLAG_IMMEDIATE = 351,
     TK_FLAG_UNIQUE_REG = 352,
     TK_FLAG_NAMED = 353,
     TK_FLAG_SLURPY = 354,
     TK_FLAG_FLAT = 355,
     TK_FLAG_OPTIONAL = 356,
     TK_FLAG_OPT_FLAG = 357
   };
#endif
/* Tokens.  */
#define TK_LABEL 258
#define TK_DOTDOT 259
#define TK_NL 260
#define TK_HLL 261
#define TK_HLL_MAP 262
#define TK_EMIT 263
#define TK_EOM 264
#define TK_N_OPERATORS 265
#define TK_PRAGMA 266
#define TK_LOADLIB 267
#define TK_SUB 268
#define TK_END 269
#define TK_PARAM 270
#define TK_LEX 271
#define TK_LOCAL 272
#define TK_NAMESPACE 273
#define TK_INVOCANT 274
#define TK_METH_CALL 275
#define TK_GLOBALCONST 276
#define TK_CONST 277
#define TK_RETURN 278
#define TK_YIELD 279
#define TK_BEGIN_YIELD 280
#define TK_END_YIELD 281
#define TK_BEGIN_RETURN 282
#define TK_END_RETURN 283
#define TK_BEGIN_CALL 284
#define TK_END_CALL 285
#define TK_GET_RESULTS 286
#define TK_CALL 287
#define TK_ARG 288
#define TK_RESULT 289
#define TK_NCI_CALL 290
#define TK_IDENT 291
#define TK_STRINGC 292
#define TK_INTC 293
#define TK_NUMC 294
#define TK_PASM_PREG 295
#define TK_PASM_NREG 296
#define TK_PASM_SREG 297
#define TK_PASM_IREG 298
#define TK_SYM_PREG 299
#define TK_SYM_NREG 300
#define TK_SYM_SREG 301
#define TK_SYM_IREG 302
#define TK_PARROT_OP 303
#define TK_INT 304
#define TK_NUM 305
#define TK_PMC 306
#define TK_STRING 307
#define TK_IF 308
#define TK_UNLESS 309
#define TK_NULL 310
#define TK_GOTO 311
#define TK_ARROW 312
#define TK_NE 313
#define TK_EQ 314
#define TK_LT 315
#define TK_LE 316
#define TK_GT 317
#define TK_GE 318
#define TK_USHIFT 319
#define TK_RSHIFT 320
#define TK_LSHIFT 321
#define TK_FDIV 322
#define TK_OR 323
#define TK_AND 324
#define TK_XOR 325
#define TK_CONC 326
#define TK_ASSIGN_USHIFT 327
#define TK_ASSIGN_RSHIFT 328
#define TK_ASSIGN_LSHIFT 329
#define TK_ASSIGN_INC 330
#define TK_ASSIGN_DEC 331
#define TK_ASSIGN_MUL 332
#define TK_ASSIGN_MOD 333
#define TK_ASSIGN_POW 334
#define TK_ASSIGN_DIV 335
#define TK_ASSIGN_BOR 336
#define TK_ASSIGN_BAND 337
#define TK_ASSIGN_FDIV 338
#define TK_ASSIGN_BNOT 339
#define TK_ASSIGN_CONC 340
#define TK_FLAG_INIT 341
#define TK_FLAG_LOAD 342
#define TK_FLAG_MAIN 343
#define TK_FLAG_ANON 344
#define TK_FLAG_METHOD 345
#define TK_FLAG_OUTER 346
#define TK_FLAG_VTABLE 347
#define TK_FLAG_LEX 348
#define TK_FLAG_MULTI 349
#define TK_FLAG_POSTCOMP 350
#define TK_FLAG_IMMEDIATE 351
#define TK_FLAG_UNIQUE_REG 352
#define TK_FLAG_NAMED 353
#define TK_FLAG_SLURPY 354
#define TK_FLAG_FLAT 355
#define TK_FLAG_OPTIONAL 356
#define TK_FLAG_OPT_FLAG 357




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
#line 177 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 370 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 383 "pirparser.c"

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
#define YYLAST   484

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  118
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  99
/* YYNRULES -- Number of rules.  */
#define YYNRULES  255
/* YYNRULES -- Number of states.  */
#define YYNSTATES  406

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
       2,     2,     2,   110,     2,     2,     2,   115,     2,     2,
     106,   107,   114,   112,   103,   109,   117,   113,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   116,
       2,   108,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   104,     2,   105,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,   111,     2,     2,     2,
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
      95,    96,    97,    98,    99,   100,   101,   102
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
     331,   335,   337,   341,   343,   346,   350,   353,   355,   357,
     361,   365,   369,   374,   376,   380,   382,   385,   387,   389,
     395,   397,   399,   408,   409,   412,   417,   421,   424,   430,
     431,   434,   435,   438,   443,   445,   452,   456,   459,   460,
     462,   464,   468,   471,   472,   475,   477,   479,   481,   484,
     486,   488,   490,   492,   494,   496,   501,   503,   505,   507,
     509,   511,   513,   515,   517,   523,   525,   527,   531,   535,
     539,   543,   544,   546,   548,   552,   555,   559,   565,   566,
     569,   574,   575,   578,   583,   584,   587,   589,   592,   593,
     597,   600,   603,   607,   612,   617,   622,   627,   630,   632,
     636,   638,   640,   642,   644,   646,   648,   650,   652,   654,
     656,   658,   660,   662,   664,   666,   668,   670,   672,   674,
     676,   678,   680,   682,   684,   686
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     119,     0,    -1,   120,   121,   120,    -1,    -1,     5,    -1,
     122,    -1,   121,     5,   122,    -1,   133,    -1,   206,    -1,
     131,    -1,   127,    -1,   125,    -1,   126,    -1,   124,    -1,
     123,    -1,    11,    10,    38,    -1,    12,    37,    -1,     6,
      37,   103,    37,    -1,     7,    37,   103,    37,    -1,     8,
       5,   128,     9,    -1,    -1,   128,   129,    -1,     3,     5,
      -1,     3,   130,    -1,   130,    -1,    48,   152,     5,    -1,
      18,    -1,    18,   104,   132,   105,    -1,    37,    -1,   132,
     162,    37,    -1,    13,   134,   135,     5,   139,   142,    14,
      -1,   169,    -1,    37,    -1,    -1,   135,   136,    -1,    89,
      -1,    86,    -1,    87,    -1,    88,    -1,    90,    -1,    93,
      -1,    91,   106,   134,   107,    -1,    92,   205,    -1,    94,
     106,   137,   107,    -1,    95,    -1,    96,    -1,    -1,   137,
     103,   138,    -1,   169,    -1,    37,    -1,   159,    -1,   215,
      -1,    -1,   139,   140,    -1,    15,   141,   183,     5,    -1,
     215,   169,    -1,   215,    37,    57,   169,    -1,    -1,   142,
     143,    -1,     3,     5,    -1,     3,   144,    -1,   144,    -1,
     163,    -1,   164,    -1,   165,    -1,   166,    -1,   170,    -1,
     207,    -1,   189,    -1,   191,    -1,   171,    -1,   148,    -1,
     147,    -1,   130,    -1,   146,    -1,   145,    -1,     1,     5,
      -1,    55,   216,     5,    -1,   216,   108,    55,     5,    -1,
      31,   106,   180,   107,     5,    -1,   187,     5,    -1,   216,
     149,     5,    -1,   158,   210,    -1,   159,   108,   210,    -1,
     108,   150,    -1,   156,   210,    -1,   210,    -1,   210,   157,
     210,    -1,   216,   159,    -1,   155,    -1,    37,   194,    -1,
     187,    -1,   151,    -1,    48,   153,    -1,    -1,   153,    -1,
     154,    -1,   153,   103,   154,    -1,   210,    -1,   186,   194,
      -1,   109,    -1,   110,    -1,   111,    -1,   112,    -1,   109,
      -1,   113,    -1,   114,    -1,   115,    -1,    71,    -1,    64,
      -1,    65,    -1,    66,    -1,    68,    -1,    69,    -1,    67,
      -1,    70,    -1,    75,    -1,    76,    -1,    77,    -1,    78,
      -1,    79,    -1,    80,    -1,    83,    -1,    81,    -1,    82,
      -1,    84,    -1,    85,    -1,    73,    -1,    74,    -1,    72,
      -1,   104,   160,   105,    -1,   161,    -1,   160,   162,   161,
      -1,   210,    -1,   210,     4,    -1,   210,     4,   210,    -1,
       4,   210,    -1,   116,    -1,   103,    -1,    53,   209,   165,
      -1,    54,   209,   165,    -1,    56,   169,     5,    -1,    17,
     215,   167,     5,    -1,   168,    -1,   167,   103,   168,    -1,
     169,    -1,   169,    97,    -1,    36,    -1,    48,    -1,    16,
      37,   103,   216,     5,    -1,   172,    -1,   179,    -1,    29,
       5,   173,   175,     5,   177,    30,     5,    -1,    -1,   173,
     174,    -1,    33,   210,   203,     5,    -1,    32,   186,   176,
      -1,    35,   186,    -1,    19,   186,     5,    20,   188,    -1,
      -1,   103,   186,    -1,    -1,   177,   178,    -1,    34,   216,
     183,     5,    -1,   166,    -1,   106,   180,   107,   108,   185,
       5,    -1,    37,   194,     5,    -1,   155,     5,    -1,    -1,
     181,    -1,   182,    -1,   181,   103,   182,    -1,   216,   183,
      -1,    -1,   183,   184,    -1,   101,    -1,   102,    -1,    99,
      -1,    98,   205,    -1,    97,    -1,   155,    -1,   187,    -1,
      44,    -1,    40,    -1,   169,    -1,   186,   117,   188,   194,
      -1,   169,    -1,    37,    -1,    46,    -1,    42,    -1,    40,
      -1,    44,    -1,   192,    -1,   190,    -1,    27,     5,   201,
      28,     5,    -1,   193,    -1,   198,    -1,    23,   194,     5,
      -1,    23,   185,     5,    -1,    24,   194,     5,    -1,   106,
     195,   107,    -1,    -1,   196,    -1,   197,    -1,   196,   103,
     197,    -1,   210,   203,    -1,    37,    57,   210,    -1,    25,
       5,   199,    26,     5,    -1,    -1,   199,   200,    -1,    24,
     210,   203,     5,    -1,    -1,   201,   202,    -1,    23,   210,
     203,     5,    -1,    -1,   203,   204,    -1,   100,    -1,    98,
     205,    -1,    -1,   106,    37,   107,    -1,    22,   208,    -1,
     206,     5,    -1,    21,   208,     5,    -1,    49,   169,   108,
      38,    -1,    50,   169,   108,    39,    -1,    51,   169,   108,
      37,    -1,    52,   169,   108,    37,    -1,    55,   210,    -1,
     210,    -1,   210,   214,   210,    -1,   216,    -1,   211,    -1,
      37,    -1,    38,    -1,    39,    -1,    44,    -1,    45,    -1,
      47,    -1,    46,    -1,   213,    -1,    40,    -1,    41,    -1,
      43,    -1,    42,    -1,    58,    -1,    59,    -1,    60,    -1,
      61,    -1,    63,    -1,    62,    -1,    49,    -1,    50,    -1,
      51,    -1,    52,    -1,   212,    -1,   169,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   211,   211,   216,   217,   220,   221,   224,   225,   226,
     227,   228,   229,   230,   231,   234,   237,   242,   245,   250,
     256,   257,   260,   261,   262,   265,   270,   271,   274,   275,
     280,   286,   287,   290,   291,   294,   295,   296,   297,   298,
     299,   300,   301,   302,   303,   304,   307,   308,   311,   312,
     313,   314,   317,   318,   321,   324,   325,   331,   332,   336,
     337,   338,   341,   342,   343,   344,   345,   346,   347,   348,
     349,   350,   351,   352,   353,   354,   355,   358,   359,   362,
     365,   368,   371,   372,   373,   376,   377,   378,   379,   380,
     381,   382,   383,   387,   390,   391,   394,   395,   398,   402,
     405,   406,   407,   410,   411,   412,   413,   414,   415,   416,
     417,   418,   419,   420,   421,   422,   426,   427,   428,   429,
     430,   431,   432,   433,   434,   435,   436,   437,   438,   439,
     442,   445,   446,   449,   450,   451,   452,   455,   456,   460,
     463,   466,   469,   472,   473,   476,   477,   480,   481,   484,
     487,   488,   491,   498,   499,   502,   505,   506,   507,   511,
     512,   515,   516,   519,   520,   523,   524,   525,   528,   529,
     532,   533,   536,   539,   540,   543,   544,   545,   546,   547,
     550,   551,   554,   555,   556,   559,   562,   563,   564,   565,
     566,   567,   570,   571,   574,   580,   581,   584,   585,   588,
     591,   594,   595,   598,   599,   602,   603,   606,   611,   612,
     615,   618,   619,   622,   625,   626,   629,   630,   633,   634,
     637,   640,   641,   644,   645,   646,   647,   650,   651,   652,
     655,   656,   659,   660,   661,   664,   665,   666,   667,   668,
     672,   673,   674,   675,   678,   679,   680,   681,   682,   683,
     686,   687,   688,   689,   692,   693
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"label\"", "\"..\"", "\"\\n\"",
  "\".HLL\"", "\".HLL_map\"", "\".emit\"", "\".eom\"", "\"n_operators\"",
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
     355,   356,   357,    44,    91,    93,    40,    41,    61,    45,
      33,   126,    43,    47,    42,    37,    59,    46
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   118,   119,   120,   120,   121,   121,   122,   122,   122,
     122,   122,   122,   122,   122,   123,   124,   125,   126,   127,
     128,   128,   129,   129,   129,   130,   131,   131,   132,   132,
     133,   134,   134,   135,   135,   136,   136,   136,   136,   136,
     136,   136,   136,   136,   136,   136,   137,   137,   138,   138,
     138,   138,   139,   139,   140,   141,   141,   142,   142,   143,
     143,   143,   144,   144,   144,   144,   144,   144,   144,   144,
     144,   144,   144,   144,   144,   144,   144,   145,   145,   146,
     147,   148,   149,   149,   149,   150,   150,   150,   150,   150,
     150,   150,   150,   151,   152,   152,   153,   153,   154,   155,
     156,   156,   156,   157,   157,   157,   157,   157,   157,   157,
     157,   157,   157,   157,   157,   157,   158,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     159,   160,   160,   161,   161,   161,   161,   162,   162,   163,
     164,   165,   166,   167,   167,   168,   168,   169,   169,   170,
     171,   171,   172,   173,   173,   174,   175,   175,   175,   176,
     176,   177,   177,   178,   178,   179,   179,   179,   180,   180,
     181,   181,   182,   183,   183,   184,   184,   184,   184,   184,
     185,   185,   186,   186,   186,   187,   188,   188,   188,   188,
     188,   188,   189,   189,   190,   191,   191,   192,   192,   193,
     194,   195,   195,   196,   196,   197,   197,   198,   199,   199,
     200,   201,   201,   202,   203,   203,   204,   204,   205,   205,
     206,   207,   207,   208,   208,   208,   208,   209,   209,   209,
     210,   210,   211,   211,   211,   212,   212,   212,   212,   212,
     213,   213,   213,   213,   214,   214,   214,   214,   214,   214,
     215,   215,   215,   215,   216,   216
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
       3,     1,     3,     1,     2,     3,     2,     1,     1,     3,
       3,     3,     4,     1,     3,     1,     2,     1,     1,     5,
       1,     1,     8,     0,     2,     4,     3,     2,     5,     0,
       2,     0,     2,     4,     1,     6,     3,     2,     0,     1,
       1,     3,     2,     0,     2,     1,     1,     1,     2,     1,
       1,     1,     1,     1,     1,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     5,     1,     1,     3,     3,     3,
       3,     0,     1,     1,     3,     2,     3,     5,     0,     2,
       4,     0,     2,     4,     0,     2,     1,     2,     0,     3,
       2,     2,     3,     4,     4,     4,     4,     2,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    26,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,   147,    32,
     148,    33,    31,     0,     0,     0,     0,     0,   220,     4,
       2,     0,     0,     0,    15,     0,    28,     0,     0,     0,
       0,     0,     6,    17,    18,     0,    19,    94,    21,    24,
      52,    36,    37,    38,    35,    39,     0,   218,    40,     0,
      44,    45,    34,   138,    27,   137,     0,     0,     0,     0,
       0,    22,    23,   232,   233,   234,   240,   241,   243,   242,
     235,   236,   238,   237,     0,    95,    96,   255,    98,   231,
     254,   239,   230,    57,     0,     0,    42,    46,    29,   223,
     224,   225,   226,    25,     0,     0,    53,     0,     0,     0,
       0,    97,   250,   251,   252,   253,   173,     0,     0,     0,
      30,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   240,   235,   148,     0,     0,     0,     0,   168,    73,
      58,    61,    75,    74,    72,    71,     0,    62,    63,    64,
      65,   255,    66,    70,   150,   151,     0,     0,    68,   193,
      69,   192,   195,   196,     0,    67,     0,    41,   219,     0,
      43,     0,     0,    55,    76,    59,    60,     0,     0,     0,
     183,   182,   201,   180,   184,     0,   181,     0,     0,   208,
     211,   153,   168,     0,     0,     0,   228,     0,     0,     0,
       0,   169,   170,   173,   167,     0,    99,    80,   221,   129,
     127,   128,   116,   117,   118,   119,   120,   121,   123,   124,
     122,   125,   126,     0,     0,     0,     0,     0,    49,    47,
      50,    48,    51,    54,   179,   218,   177,   175,   176,   174,
       0,     0,     0,   143,   145,   222,   232,     0,   202,   203,
     214,   198,   197,   199,     0,     0,     0,     0,   166,   227,
     139,   244,   245,   246,   247,   249,   248,     0,   140,    77,
     141,     0,     0,   172,   187,   190,   189,   191,   188,   186,
       0,     0,     0,   131,   133,   232,   148,     0,   100,   101,
     102,    84,    92,    89,     0,    91,    86,   230,    81,    82,
       0,   178,    56,     0,   142,     0,   146,     0,   200,     0,
     205,     0,     0,   209,     0,     0,   212,     0,     0,     0,
       0,   154,     0,     0,   229,     0,   171,   185,   136,   130,
       0,   134,    90,    93,    78,    85,   109,   110,   111,   114,
     112,   113,   115,   108,   104,   103,   105,   106,   107,     0,
      88,    83,   149,   144,   206,   204,   218,   216,   215,   214,
     207,   214,   194,     0,   159,   214,   157,   161,    79,     0,
     132,   135,    87,   217,     0,     0,     0,     0,   156,     0,
       0,   165,   210,   213,     0,   160,   155,     0,     0,   164,
     162,   158,   152,   173,     0,   163
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      43,    58,   149,    20,    47,    21,    31,    45,    72,   120,
     239,   103,   116,   126,   117,   150,   151,   152,   153,   154,
     155,   235,   301,   302,    94,    95,    96,   156,   304,   359,
     236,   237,   292,   293,    76,   157,   158,   159,   160,   252,
     253,    97,   162,   163,   164,   266,   331,   332,   388,   390,
     400,   165,   210,   211,   212,   181,   249,   195,   166,   167,
     290,   168,   169,   170,   171,   172,   197,   257,   258,   259,
     173,   264,   323,   265,   326,   320,   368,   106,    22,   175,
      38,   205,    98,    99,   100,   101,   277,   127,   102
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -249
static const yytype_int16 yypact[] =
{
      24,  -249,    22,   150,  -249,     0,    32,    73,    65,    39,
     -20,    -4,   193,   122,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,    25,    67,  -249,   106,  -249,  -249,  -249,
    -249,  -249,  -249,   113,    84,    84,    84,    84,  -249,   150,
    -249,   137,   142,    42,  -249,   181,  -249,    72,    77,    82,
      94,   102,  -249,  -249,  -249,    18,  -249,   399,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,   107,   111,  -249,   115,
    -249,  -249,  -249,  -249,  -249,  -249,   182,   185,   186,   191,
     192,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,   225,   133,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,   223,   -20,   211,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,   399,   229,  -249,    17,   152,   153,
      45,  -249,  -249,  -249,  -249,  -249,  -249,    47,   244,   210,
    -249,   224,   229,   193,    41,   156,   293,   308,   309,   201,
     156,   -70,   -14,   349,   376,   376,   325,    84,   325,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,   310,  -249,  -249,  -249,
    -249,    54,  -249,  -249,  -249,  -249,    59,   314,  -249,  -249,
    -249,  -249,  -249,  -249,   316,  -249,   326,  -249,  -249,   260,
    -249,    14,   265,  -249,  -249,  -249,  -249,   220,    84,   319,
    -249,  -249,   412,  -249,  -249,   321,  -249,   322,   323,  -249,
    -249,  -249,   325,   324,   399,   295,   138,   295,   347,   348,
     248,   256,  -249,  -249,  -249,   172,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,   302,   247,   355,   399,   254,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,   111,  -249,  -249,  -249,  -249,
      84,   325,     6,  -249,   277,  -249,   306,   269,   279,  -249,
    -249,  -249,  -249,  -249,   -12,    70,    69,   276,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,   399,  -249,  -249,
    -249,   317,   325,   202,  -249,  -249,  -249,  -249,  -249,  -249,
     156,   399,    78,  -249,   422,   156,   399,   423,  -249,  -249,
    -249,  -249,  -249,  -249,   399,  -249,   266,   328,  -249,  -249,
     399,  -249,  -249,   424,  -249,    84,  -249,   399,  -249,   412,
     -48,   399,   428,  -249,   399,   456,  -249,    85,    85,   399,
      85,  -249,   457,   458,  -249,    85,  -249,  -249,  -249,  -249,
     302,   399,  -249,   133,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,   399,
    -249,  -249,  -249,  -249,  -249,  -249,   111,  -249,  -249,  -249,
    -249,  -249,  -249,   459,   362,  -249,  -249,  -249,  -249,   461,
    -249,  -249,  -249,  -249,    10,    38,   407,    85,  -249,    51,
      57,  -249,  -249,  -249,   172,  -249,  -249,   462,   325,  -249,
    -249,  -249,  -249,  -249,    44,  -249
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -249,  -249,   455,  -249,   430,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,    71,  -249,  -249,  -249,   366,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,   342,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,   176,   359,  -129,  -249,  -249,
    -249,  -177,  -249,   134,   183,  -249,  -249,   -52,    86,  -249,
     162,   -10,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,   278,  -249,   196,  -210,  -249,   144,  -248,  -128,
      87,  -249,  -249,  -249,  -249,  -249,  -131,  -249,  -249,   163,
    -249,  -249,  -249,  -249,  -249,  -180,  -249,  -235,     5,  -249,
     350,   339,  -137,  -249,  -249,  -249,  -249,  -111,  -116
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -185
static const yytype_int16 yytable[] =
{
      32,   176,   240,   283,   198,   193,   196,   206,   206,   203,
     311,   314,   321,   176,   322,   392,    28,    29,   128,   243,
     129,   188,     4,    81,    48,    49,    50,    51,    30,     1,
     208,   130,   213,   131,   132,   216,  -183,    23,   133,    12,
     134,   135,   136,   393,   137,    55,   138,  -183,   139,   405,
     366,    56,   367,    28,   140,   260,   396,   141,    87,    88,
      89,   142,    91,    92,    93,   143,    57,   269,   242,    24,
     144,   145,   146,   147,   132,    26,    27,    28,    25,   373,
     374,   190,   376,    28,   182,   191,   213,   397,   327,    30,
      57,   398,  -182,   324,    32,    30,   294,   306,   325,   309,
      33,   328,   329,  -182,   330,   303,   305,   161,   366,   315,
     367,   244,   245,   246,    59,   247,   248,   183,   307,   161,
      28,    28,   174,   148,   194,   190,    82,    39,    41,   191,
     360,   383,    30,    30,   174,   313,   366,   209,   367,   395,
     334,   244,   245,   246,    44,   247,   248,   192,   179,   366,
      46,   367,   180,   270,   338,   278,     5,     6,     7,   337,
    -184,     8,     9,    10,   342,   192,   213,   345,    11,   241,
      42,  -184,    12,   361,    53,    73,   215,    74,   254,    54,
     364,    73,   260,   339,   369,    77,    60,   371,    75,   384,
      78,   385,   375,   404,    75,   389,   271,   272,   273,   274,
     275,   276,    79,   294,   381,   289,   193,   196,    28,   284,
      80,   128,   285,   104,   286,   185,   287,   105,   288,   108,
      30,   107,   382,   109,   161,   110,   131,   132,   111,   112,
     113,   133,    12,   134,   135,   136,   114,   137,   115,   138,
     312,   139,    34,    35,    36,    37,    28,   140,   119,   184,
     141,    87,    88,    89,   142,    91,    92,    93,   143,   177,
     178,   187,   192,   144,   145,   146,   147,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,   122,   123,
     124,   125,   403,    28,   295,    84,    85,   141,    87,    88,
      89,   142,    91,    92,    93,   296,    28,   238,   199,   244,
     245,   246,   297,   247,   248,   254,   291,   202,    30,   122,
     123,   124,   125,   200,   201,   214,   148,   194,   194,   217,
     194,   218,   250,   251,   255,   194,   261,   262,   263,   268,
     346,   347,   348,   349,   350,   351,   352,   353,    28,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      30,   147,   279,   280,   -94,   281,   298,   299,   300,   282,
     308,    28,   310,   317,   233,    86,    87,    88,    89,    90,
      91,    92,    93,    30,   316,   354,   318,   194,   355,   356,
     357,   358,   319,   333,   289,    28,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    30,   219,   220,
     221,   222,   223,   224,   225,   226,   227,   228,   229,   230,
     231,   232,    28,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    30,   335,   341,   394,   344,   362,
     233,   204,   233,   370,   234,    28,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    30,    28,   256,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      30,   372,   377,   378,   386,   387,   391,   402,    40,    52,
     118,   186,   343,   121,   380,   340,   399,   363,   336,   379,
     267,   401,   365,   189,   207
};

static const yytype_uint16 yycheck[] =
{
      10,   117,   179,   213,   135,   134,   134,   144,   145,   140,
     245,     5,    24,   129,    26,     5,    36,    37,     1,     5,
       3,   132,     0,     5,    34,    35,    36,    37,    48,     5,
     146,    14,   148,    16,    17,   166,   106,    37,    21,    22,
      23,    24,    25,     5,    27,     3,    29,   117,    31,     5,
      98,     9,   100,    36,    37,   192,     5,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    48,   204,   179,    37,
      53,    54,    55,    56,    17,    10,    37,    36,     5,   327,
     328,    40,   330,    36,    37,    44,   202,    30,    19,    48,
      48,    34,   106,    23,   104,    48,   233,   234,    28,   236,
     104,    32,    33,   117,    35,   234,   234,   117,    98,   103,
     100,    97,    98,    99,    43,   101,   102,   127,   234,   129,
      36,    36,   117,   106,   134,    40,    55,     5,   103,    44,
     307,   366,    48,    48,   129,   251,    98,   147,   100,   387,
     277,    97,    98,    99,    38,   101,   102,   106,   103,    98,
      37,   100,   107,   205,   291,   207,     6,     7,     8,   290,
     106,    11,    12,    13,   295,   106,   282,   304,    18,   179,
     103,   117,    22,   310,    37,   103,   117,   105,   188,    37,
     317,   103,   319,   105,   321,   108,     5,   324,   116,   369,
     108,   371,   329,   403,   116,   375,    58,    59,    60,    61,
      62,    63,   108,   340,   341,   215,   335,   335,    36,    37,
     108,     1,    40,   106,    42,     5,    44,   106,    46,    37,
      48,   106,   359,    38,   234,    39,    16,    17,    37,    37,
       5,    21,    22,    23,    24,    25,   103,    27,    15,    29,
     250,    31,    49,    50,    51,    52,    36,    37,    37,     5,
      40,    41,    42,    43,    44,    45,    46,    47,    48,   107,
     107,    37,   106,    53,    54,    55,    56,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    49,    50,
      51,    52,   398,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    36,    37,     5,    97,
      98,    99,    55,   101,   102,   315,     4,   106,    48,    49,
      50,    51,    52,     5,     5,     5,   106,   327,   328,     5,
     330,     5,    57,   103,     5,   335,     5,     5,     5,     5,
      64,    65,    66,    67,    68,    69,    70,    71,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    56,     5,     5,     5,   107,   109,   110,   111,   103,
       5,    36,   108,    57,   104,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    97,   109,   107,   387,   112,   113,
     114,   115,   103,   107,   394,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    83,
      84,    85,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,   108,     4,    20,     5,     5,
     104,    55,   104,     5,   108,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,     5,     5,     5,     5,   103,     5,     5,    13,    39,
     104,   129,   296,   114,   340,   292,   390,   315,   282,   335,
     202,   394,   319,   133,   145
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     5,   119,   120,     0,     6,     7,     8,    11,    12,
      13,    18,    22,   121,   122,   123,   124,   125,   126,   127,
     131,   133,   206,    37,    37,     5,    10,    37,    36,    37,
      48,   134,   169,   104,    49,    50,    51,    52,   208,     5,
     120,   103,   103,   128,    38,   135,    37,   132,   169,   169,
     169,   169,   122,    37,    37,     3,     9,    48,   129,   130,
       5,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,   136,   103,   105,   116,   162,   108,   108,   108,
     108,     5,   130,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,   152,   153,   154,   169,   210,   211,
     212,   213,   216,   139,   106,   106,   205,   106,    37,    38,
      39,    37,    37,     5,   103,    15,   140,   142,   134,    37,
     137,   154,    49,    50,    51,    52,   141,   215,     1,     3,
      14,    16,    17,    21,    23,    24,    25,    27,    29,    31,
      37,    40,    44,    48,    53,    54,    55,    56,   106,   130,
     143,   144,   145,   146,   147,   148,   155,   163,   164,   165,
     166,   169,   170,   171,   172,   179,   186,   187,   189,   190,
     191,   192,   193,   198,   206,   207,   216,   107,   107,   103,
     107,   183,    37,   169,     5,     5,   144,    37,   215,   208,
      40,    44,   106,   155,   169,   185,   187,   194,   194,     5,
       5,     5,   106,   194,    55,   209,   210,   209,   216,   169,
     180,   181,   182,   216,     5,   117,   194,     5,     5,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,   104,   108,   149,   158,   159,    37,   138,
     159,   169,   215,     5,    97,    98,    99,   101,   102,   184,
      57,   103,   167,   168,   169,     5,    37,   195,   196,   197,
     210,     5,     5,     5,   199,   201,   173,   180,     5,   210,
     165,    58,    59,    60,    61,    62,    63,   214,   165,     5,
       5,   107,   103,   183,    37,    40,    42,    44,    46,   169,
     188,     4,   160,   161,   210,    37,    48,    55,   109,   110,
     111,   150,   151,   155,   156,   187,   210,   216,     5,   210,
     108,   205,   169,   216,     5,   103,    97,    57,   107,   103,
     203,    24,    26,   200,    23,    28,   202,    19,    32,    33,
      35,   174,   175,   107,   210,   108,   182,   194,   210,   105,
     162,     4,   194,   153,     5,   210,    64,    65,    66,    67,
      68,    69,    70,    71,   109,   112,   113,   114,   115,   157,
     159,   210,     5,   168,   210,   197,    98,   100,   204,   210,
       5,   210,     5,   186,   186,   210,   186,     5,     5,   185,
     161,   210,   210,   205,   203,   203,     5,   103,   176,   203,
     177,     5,     5,     5,    20,   186,     5,    30,    34,   166,
     178,   188,     5,   216,   183,     5
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
#line 355 "pir.y"
    { yyerrok; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2051 "pirparser.c"
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


#line 696 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


