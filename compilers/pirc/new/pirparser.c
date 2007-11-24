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
#include "pircompunit.h"

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

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
#line 64 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;

    struct constant *constval;
    void  *fixme;
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
#define YYLAST   487

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  112
/* YYNRULES -- Number of rules.  */
#define YYNRULES  275
/* YYNRULES -- Number of states.  */
#define YYNSTATES  428

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
      80,    84,    85,    94,    96,    98,    99,   102,   104,   106,
     108,   110,   112,   114,   116,   118,   123,   128,   131,   132,
     136,   138,   140,   142,   144,   145,   148,   153,   156,   161,
     162,   165,   168,   171,   173,   175,   177,   179,   181,   183,
     185,   187,   189,   191,   193,   195,   197,   200,   204,   209,
     215,   219,   222,   226,   229,   232,   234,   238,   241,   243,
     244,   248,   249,   251,   253,   257,   259,   261,   263,   265,
     267,   269,   271,   273,   275,   277,   279,   281,   283,   285,
     287,   289,   291,   293,   295,   297,   299,   301,   303,   305,
     307,   309,   311,   313,   315,   317,   319,   321,   323,   325,
     327,   329,   331,   333,   335,   337,   339,   343,   345,   349,
     351,   353,   355,   361,   369,   375,   377,   379,   382,   385,
     387,   389,   393,   398,   400,   404,   407,   408,   410,   416,
     418,   420,   429,   430,   433,   437,   441,   444,   450,   451,
     454,   455,   458,   463,   465,   472,   477,   480,   482,   484,
     489,   492,   494,   496,   498,   500,   502,   504,   506,   508,
     510,   512,   513,   515,   517,   521,   522,   526,   527,   530,
     532,   534,   536,   538,   541,   543,   545,   551,   553,   555,
     559,   563,   567,   571,   572,   574,   576,   580,   582,   584,
     588,   589,   593,   599,   600,   603,   607,   608,   611,   615,
     618,   619,   622,   624,   627,   628,   632,   635,   638,   642,
     647,   652,   657,   662,   664,   666,   668,   670,   672,   674,
     676,   678,   680,   682,   684,   686,   688,   690,   692,   694,
     696,   698,   700,   702,   704,   706,   708,   710,   712,   714,
     716,   718,   720,   722,   724,   726
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     121,     0,    -1,   122,   123,   122,    -1,    -1,     4,    -1,
     124,    -1,   123,     4,   124,    -1,   136,    -1,   219,    -1,
     133,    -1,   129,    -1,   127,    -1,   128,    -1,   126,    -1,
     125,    -1,    10,     9,    37,    -1,    11,    36,    -1,     5,
      36,   102,    36,    -1,     6,    36,   102,    36,    -1,     7,
       4,   130,     8,    -1,    -1,   130,   131,    -1,     3,     4,
      -1,     3,   132,    -1,   132,    -1,    47,   156,     4,    -1,
      17,   134,    -1,    -1,   103,   135,   104,    -1,    36,    -1,
     135,   165,    36,    -1,    -1,    12,   138,   137,   139,     4,
     143,   146,    13,    -1,   231,    -1,    36,    -1,    -1,   139,
     140,    -1,    88,    -1,    85,    -1,    86,    -1,    87,    -1,
      89,    -1,    92,    -1,    94,    -1,    95,    -1,    93,   105,
     141,   106,    -1,    90,   105,   138,   106,    -1,    91,   218,
      -1,    -1,   141,   102,   142,    -1,   231,    -1,    36,    -1,
     162,    -1,   227,    -1,    -1,   143,   144,    -1,    14,   145,
     196,     4,    -1,   227,   231,    -1,   227,    36,    56,   231,
      -1,    -1,   146,   147,    -1,     3,     4,    -1,     3,   148,
      -1,   148,    -1,   166,    -1,   170,    -1,   171,    -1,   175,
      -1,   220,    -1,   198,    -1,   200,    -1,   176,    -1,   151,
      -1,   132,    -1,   150,    -1,   149,    -1,     1,     4,    -1,
      54,   228,     4,    -1,   228,   107,    54,     4,    -1,    30,
     105,   192,   106,     4,    -1,   228,   152,     4,    -1,   161,
     224,    -1,   162,   107,   224,    -1,   107,   153,    -1,   159,
     224,    -1,   223,    -1,   224,   160,   224,    -1,   228,   162,
      -1,   154,    -1,    -1,    47,   155,   156,    -1,    -1,   157,
      -1,   158,    -1,   157,   102,   158,    -1,   222,    -1,   108,
      -1,   109,    -1,   110,    -1,   111,    -1,   108,    -1,   112,
      -1,   113,    -1,   114,    -1,   115,    -1,   116,    -1,   110,
      -1,   117,    -1,    70,    -1,    63,    -1,    64,    -1,    65,
      -1,    67,    -1,    68,    -1,    66,    -1,    69,    -1,    58,
      -1,    60,    -1,    59,    -1,    62,    -1,    61,    -1,    57,
      -1,    74,    -1,    75,    -1,    76,    -1,    77,    -1,    78,
      -1,    79,    -1,    82,    -1,    80,    -1,    81,    -1,    83,
      -1,    84,    -1,    72,    -1,    73,    -1,    71,    -1,   103,
     163,   104,    -1,   164,    -1,   163,   165,   164,    -1,   224,
      -1,   118,    -1,   102,    -1,   167,   224,   169,   231,     4,
      -1,   167,   224,   226,   224,   169,   231,     4,    -1,   168,
     224,   169,   231,     4,    -1,    52,    -1,    53,    -1,    52,
      54,    -1,    53,    54,    -1,    55,    -1,   102,    -1,    55,
     231,     4,    -1,    16,   227,   172,     4,    -1,   173,    -1,
     172,   102,   173,    -1,   231,   174,    -1,    -1,    96,    -1,
      15,    36,   102,   228,     4,    -1,   177,    -1,   184,    -1,
      28,     4,   178,   180,     4,   182,    29,     4,    -1,    -1,
     178,   179,    -1,    32,   208,     4,    -1,    31,   189,   181,
      -1,    34,   189,    -1,    18,   189,     4,    19,   190,    -1,
      -1,   102,   189,    -1,    -1,   182,   183,    -1,    33,   228,
     196,     4,    -1,   171,    -1,   105,   192,   106,   107,   185,
       4,    -1,   228,   107,   185,     4,    -1,   185,     4,    -1,
     187,    -1,   186,    -1,   189,   119,   190,   203,    -1,   188,
     203,    -1,   189,    -1,    36,    -1,   231,    -1,    43,    -1,
      39,    -1,   189,    -1,   191,    -1,    36,    -1,    45,    -1,
      41,    -1,    -1,   193,    -1,   194,    -1,   193,   102,   194,
      -1,    -1,   228,   195,   196,    -1,    -1,   196,   197,    -1,
     100,    -1,   101,    -1,    98,    -1,    96,    -1,    97,   218,
      -1,   201,    -1,   199,    -1,    26,     4,   213,    27,     4,
      -1,   202,    -1,   210,    -1,    22,   203,     4,    -1,    22,
     185,     4,    -1,    23,   203,     4,    -1,   105,   204,   106,
      -1,    -1,   205,    -1,   206,    -1,   205,   102,   206,    -1,
     208,    -1,   207,    -1,    36,    56,   224,    -1,    -1,   224,
     209,   216,    -1,    24,     4,   211,    25,     4,    -1,    -1,
     211,   212,    -1,    23,   215,     4,    -1,    -1,   213,   214,
      -1,    22,   215,     4,    -1,   224,   216,    -1,    -1,   216,
     217,    -1,    99,    -1,    97,   218,    -1,    -1,   105,    36,
     106,    -1,    21,   221,    -1,   219,     4,    -1,    20,   221,
       4,    -1,    48,   231,   107,    37,    -1,    49,   231,   107,
      38,    -1,    50,   231,   107,    36,    -1,    51,   231,   107,
      36,    -1,   225,    -1,   230,    -1,   225,    -1,   229,    -1,
      35,    -1,   228,    -1,   225,    -1,    36,    -1,    37,    -1,
      38,    -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,
      62,    -1,    61,    -1,    48,    -1,    49,    -1,    50,    -1,
      51,    -1,   229,    -1,   231,    -1,    43,    -1,    44,    -1,
      46,    -1,    45,    -1,   230,    -1,    39,    -1,    40,    -1,
      42,    -1,    41,    -1,    35,    -1,    47,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   224,   224,   229,   230,   233,   234,   237,   238,   239,
     240,   241,   242,   243,   244,   247,   250,   256,   259,   264,
     270,   271,   274,   275,   276,   279,   284,   287,   288,   291,
     292,   297,   297,   304,   305,   308,   309,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   325,   326,
     329,   330,   331,   332,   335,   336,   339,   342,   343,   351,
     352,   356,   357,   358,   361,   362,   363,   364,   365,   366,
     367,   368,   369,   370,   371,   372,   373,   376,   377,   380,
     385,   388,   389,   390,   393,   394,   395,   396,   397,   400,
     400,   404,   405,   408,   409,   412,   415,   416,   417,   420,
     421,   422,   423,   424,   425,   426,   427,   428,   429,   430,
     431,   432,   433,   434,   435,   436,   437,   438,   439,   440,
     441,   442,   446,   447,   448,   449,   450,   451,   452,   453,
     454,   455,   456,   457,   458,   459,   462,   465,   466,   469,
     472,   473,   477,   479,   481,   485,   486,   490,   491,   494,
     495,   503,   507,   510,   511,   514,   518,   519,   524,   527,
     528,   531,   538,   539,   542,   545,   546,   547,   551,   552,
     555,   556,   559,   560,   563,   564,   565,   569,   570,   573,
     577,   580,   581,   584,   585,   586,   589,   590,   593,   594,
     595,   598,   599,   602,   603,   606,   606,   610,   611,   614,
     615,   616,   617,   618,   624,   625,   628,   634,   635,   638,
     639,   642,   645,   648,   649,   652,   653,   656,   657,   660,
     665,   665,   669,   674,   675,   678,   681,   682,   685,   688,
     691,   692,   695,   696,   699,   700,   703,   706,   707,   710,
     711,   712,   713,   716,   717,   721,   722,   723,   726,   727,
     730,   731,   732,   735,   736,   737,   738,   739,   740,   743,
     744,   745,   746,   749,   750,   753,   754,   755,   756,   757,
     760,   761,   762,   763,   766,   767
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
  "opt_namespace_id", "namespace_id", "sub_definition", "@1", "sub_id",
  "sub_flags", "sub_flag", "multi_type_list", "multi_type", "parameters",
  "parameter", "param_def", "instructions", "instruction", "statement",
  "null_statement", "getresults_statement", "assignment_statement",
  "assignment_tail", "assignment_expression", "parrot_instruction", "@2",
  "opt_parrot_op_args", "parrot_op_args", "parrot_op_arg", "unop", "binop",
  "augmented_op", "keylist", "keys", "key", "separator",
  "conditional_statement", "if_type", "if_null_type", "goto_or_comma",
  "goto_statement", "local_declaration", "local_id_list", "local_id",
  "has_unique_reg", "lex_declaration", "invocation_statement",
  "long_invocation_statement", "long_arguments", "long_argument",
  "long_invocation", "opt_return_continuation", "long_results",
  "long_result", "short_invocation_statement", "simple_invocation",
  "methodcall", "subcall", "sub", "invokable", "method", "string_object",
  "opt_target_list", "target_list", "result_target", "@3", "param_flags",
  "param_flag", "return_statement", "long_return_statement",
  "yield_statement", "short_return_statement", "short_yield_statement",
  "arguments", "opt_arguments_list", "arguments_list", "argument",
  "named_arg", "short_arg", "@4", "long_yield_statement",
  "yield_expressions", "yield_expression", "return_expressions",
  "return_expression", "result", "arg_flags", "arg_flag",
  "opt_paren_string", "const_declaration", "const_decl_statement",
  "const_tail", "pasm_expression", "expression1", "expression", "constant",
  "rel_op", "type", "target", "reg", "pasm_reg", "identifier", 0
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
     135,   137,   136,   138,   138,   139,   139,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   141,   141,
     142,   142,   142,   142,   143,   143,   144,   145,   145,   146,
     146,   147,   147,   147,   148,   148,   148,   148,   148,   148,
     148,   148,   148,   148,   148,   148,   148,   149,   149,   150,
     151,   152,   152,   152,   153,   153,   153,   153,   153,   155,
     154,   156,   156,   157,   157,   158,   159,   159,   159,   160,
     160,   160,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   160,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   160,   161,   161,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   161,   161,   161,   162,   163,   163,   164,
     165,   165,   166,   166,   166,   167,   167,   168,   168,   169,
     169,   170,   171,   172,   172,   173,   174,   174,   175,   176,
     176,   177,   178,   178,   179,   180,   180,   180,   181,   181,
     182,   182,   183,   183,   184,   184,   184,   185,   185,   186,
     187,   188,   188,   189,   189,   189,   190,   190,   191,   191,
     191,   192,   192,   193,   193,   195,   194,   196,   196,   197,
     197,   197,   197,   197,   198,   198,   199,   200,   200,   201,
     201,   202,   203,   204,   204,   205,   205,   206,   206,   207,
     209,   208,   210,   211,   211,   212,   213,   213,   214,   215,
     216,   216,   217,   217,   218,   218,   219,   220,   220,   221,
     221,   221,   221,   222,   222,   223,   223,   223,   224,   224,
     225,   225,   225,   226,   226,   226,   226,   226,   226,   227,
     227,   227,   227,   228,   228,   229,   229,   229,   229,   229,
     230,   230,   230,   230,   231,   231
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     2,     4,     4,     4,
       0,     2,     2,     2,     1,     3,     2,     0,     3,     1,
       3,     0,     8,     1,     1,     0,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     4,     2,     0,     3,
       1,     1,     1,     1,     0,     2,     4,     2,     4,     0,
       2,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     3,     4,     5,
       3,     2,     3,     2,     2,     1,     3,     2,     1,     0,
       3,     0,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     3,     1,     3,     1,
       1,     1,     5,     7,     5,     1,     1,     2,     2,     1,
       1,     3,     4,     1,     3,     2,     0,     1,     5,     1,
       1,     8,     0,     2,     3,     3,     2,     5,     0,     2,
       0,     2,     4,     1,     6,     4,     2,     1,     1,     4,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     1,     1,     3,     0,     3,     0,     2,     1,
       1,     1,     1,     2,     1,     1,     5,     1,     1,     3,
       3,     3,     3,     0,     1,     1,     3,     1,     1,     3,
       0,     3,     5,     0,     2,     3,     0,     2,     3,     2,
       0,     2,     1,     2,     0,     3,     2,     2,     3,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
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
       9,     7,     8,     0,     0,    20,     0,    16,   274,    34,
     275,    31,    33,     0,    26,     0,     0,     0,     0,   236,
       4,     2,     0,     0,     0,    15,    35,    29,     0,     0,
       0,     0,     0,     6,    17,    18,     0,    19,    91,    21,
      24,     0,   141,    28,   140,     0,     0,     0,     0,     0,
      22,    23,   250,   251,   252,   270,   271,   273,   272,     0,
      92,    93,    95,   243,   244,    54,    38,    39,    40,    37,
      41,     0,   234,    42,     0,    43,    44,    36,    30,   239,
     240,   241,   242,    25,     0,    59,     0,     0,    47,    48,
      94,     0,    55,     0,     0,     0,     0,   259,   260,   261,
     262,   197,     0,     0,     0,    32,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   182,   270,   265,   266,   268,
     267,   275,   145,   146,     0,     0,   191,    73,    60,    63,
      75,    74,    72,    64,     0,     0,    65,    66,    67,    71,
     159,   160,     0,   178,   177,     0,   181,    69,   205,    70,
     204,   207,   208,     0,    68,     0,   263,   269,   264,    46,
     235,     0,    45,     0,     0,    57,    76,    61,    62,     0,
       0,     0,   185,   184,   213,     0,     0,   183,     0,   223,
     226,   162,   191,   147,   148,   265,     0,   264,     0,     0,
     192,   193,   195,     0,   249,   248,     0,   176,   180,     0,
     237,   135,   133,   134,   122,   123,   124,   125,   126,   127,
     129,   130,   128,   131,   132,     0,     0,     0,     0,     0,
      51,    49,    52,    53,    50,    56,   202,   234,   201,   199,
     200,   198,     0,     0,     0,   153,   156,   238,   250,     0,
     214,   215,   218,   217,   220,   210,   209,   211,     0,     0,
       0,     0,    77,   151,     0,     0,   197,   149,   253,   254,
     255,   256,   258,   257,   150,     0,     0,     0,   188,   190,
     189,   186,     0,   187,     0,   137,   139,   274,   250,   275,
       0,    96,    97,    98,    83,    88,     0,     0,    85,     0,
     249,   248,   263,    80,    81,     0,   203,    58,     0,   152,
       0,   157,   155,     0,   212,     0,   230,     0,     0,   224,
       0,     0,   227,     0,     0,     0,     0,   163,     0,     0,
       0,   194,   196,     0,     0,     0,   179,   136,     0,    91,
      78,    84,   175,   121,   116,   118,   117,   120,   119,   109,
     110,   111,   114,   112,   113,   115,   108,   100,   106,    99,
     101,   102,   103,   104,   105,   107,     0,    87,    82,   158,
     154,   219,   216,   221,     0,   230,   222,     0,   206,     0,
     168,     0,   166,   170,    79,     0,   142,     0,   144,   138,
      90,    86,   234,   232,   231,   225,   229,   228,     0,     0,
     165,   164,     0,   174,     0,   233,     0,   169,     0,     0,
     173,   171,   143,   167,   161,   197,     0,   172
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      44,    59,   147,    20,    34,    48,    21,    46,    31,    61,
      97,   116,   241,   105,   112,   121,   113,   148,   149,   150,
     151,   152,   237,   304,   305,   349,    79,    80,    81,   306,
     376,   238,   239,   294,   295,    65,   153,   154,   155,   285,
     156,   157,   254,   255,   322,   158,   159,   160,   270,   337,
     338,   410,   412,   421,   161,   162,   163,   164,   165,   166,
     292,   293,   209,   210,   211,   276,   183,   251,   167,   168,
     169,   170,   171,   196,   259,   260,   261,   262,   263,   326,
     172,   268,   329,   269,   332,   384,   383,   404,   108,    22,
     174,    39,    82,   308,   264,   214,   286,   122,   215,   176,
     177,   207
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -269
static const yytype_int16 yypact[] =
{
      27,  -269,    56,   187,  -269,    51,    64,    60,    99,    80,
     137,    14,   173,   127,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,    38,    59,  -269,   148,  -269,  -269,  -269,
    -269,  -269,  -269,   141,  -269,    57,    57,    57,    57,  -269,
     187,  -269,   159,   165,    81,  -269,  -269,  -269,   -11,    98,
     103,   104,   112,  -269,  -269,  -269,    19,  -269,   259,  -269,
    -269,    61,  -269,  -269,  -269,   170,   191,   196,   208,   219,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,   232,
     163,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,   161,   162,  -269,   168,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,   259,   254,   137,   238,  -269,  -269,
    -269,   200,  -269,   217,   179,   197,    16,  -269,  -269,  -269,
    -269,  -269,   155,   272,   312,  -269,   266,   200,   173,     0,
     199,   301,   302,   304,   204,  -269,   -75,   -52,  -269,  -269,
    -269,   242,   257,   258,   349,    57,   349,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,   408,   408,  -269,  -269,  -269,  -269,
    -269,  -269,   310,  -269,  -269,   199,   198,  -269,  -269,  -269,
    -269,  -269,  -269,   314,  -269,   358,  -269,  -269,   -37,  -269,
    -269,    10,  -269,    29,   263,  -269,  -269,  -269,  -269,   213,
      57,   316,  -269,  -269,   431,   317,   321,  -269,   325,  -269,
    -269,  -269,   349,  -269,  -269,  -269,   327,  -269,   333,   233,
     239,  -269,  -269,   -40,  -269,  -269,   -39,  -269,  -269,   123,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,  -269,   408,    34,   339,   408,   237,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,   162,  -269,  -269,
    -269,  -269,    57,   349,     7,  -269,   249,  -269,   290,   243,
     248,  -269,  -269,  -269,  -269,  -269,  -269,  -269,   202,    28,
      20,   255,  -269,  -269,   253,   349,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,  -269,    57,   408,    57,  -269,  -269,
    -269,  -269,   199,  -269,    -3,  -269,  -269,   359,   277,   250,
     379,  -269,  -269,  -269,  -269,  -269,   408,   381,  -269,   311,
     382,   294,   394,  -269,  -269,   408,  -269,  -269,   396,  -269,
      57,  -269,  -269,   408,  -269,   431,  -269,   408,   397,  -269,
     408,   398,  -269,    63,    63,   408,    63,  -269,   399,   400,
     140,  -269,   116,   401,   -39,   403,  -269,  -269,   408,   259,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,   408,  -269,  -269,  -269,
    -269,  -269,  -269,   132,   404,  -269,  -269,   405,  -269,   406,
     260,   407,  -269,  -269,  -269,   409,  -269,    57,  -269,  -269,
    -269,  -269,   162,  -269,  -269,  -269,   132,  -269,   393,    63,
    -269,  -269,     8,  -269,   410,  -269,   123,  -269,   411,   349,
    -269,  -269,  -269,  -269,  -269,  -269,    36,  -269
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -269,  -269,   443,  -269,   376,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,   144,  -269,  -269,  -269,  -269,  -269,   351,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,   296,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,    69,  -269,   354,  -269,
    -269,  -269,  -172,  -269,   111,   166,  -269,  -269,  -269,  -206,
    -269,    50,  -269,   143,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,  -269,  -125,  -269,  -269,  -269,  -213,
      48,  -269,   278,  -269,   206,  -269,  -268,  -269,  -269,  -269,
    -269,  -269,  -269,  -123,  -269,  -269,   154,  -269,   147,  -269,
    -269,  -269,  -269,  -269,  -269,   153,   100,  -269,  -242,    54,
    -269,   356,  -269,  -269,  -141,   -55,  -269,   -98,  -112,   251,
     -56,   -10
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -248
static const yytype_int16 yytable[] =
{
      32,   175,    84,    83,   195,   316,   291,   198,   342,   242,
     287,   319,   175,   213,   216,   277,   277,   278,   279,   280,
     281,   282,   283,    70,   127,    49,    50,    51,    52,   190,
    -185,     1,   206,   245,   212,    28,   135,   418,   333,   192,
     427,   419,   218,   193,  -185,    28,   240,    30,    84,    83,
     330,   334,   335,  -184,   336,   331,     4,    30,   117,   118,
     119,   120,   284,   284,    25,    85,    58,  -184,  -183,   297,
     298,    73,    74,   136,    76,    77,    78,   137,   138,   139,
     140,   299,  -183,   243,    56,    84,    83,    23,   300,    57,
     212,    62,    28,    63,   296,   309,    32,   314,    28,    62,
      24,   347,   192,   178,    30,   194,   193,    64,    26,   320,
      30,   307,   185,   235,   178,    64,    27,    33,   181,   197,
     389,   390,   182,   392,   311,   246,   247,   248,    58,   249,
     250,    40,   246,   247,   248,   208,   249,   250,   397,   377,
      42,   318,   301,   302,   303,   344,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,   426,    28,   288,
     415,    43,   192,   212,   289,   351,   193,   173,   290,   346,
      30,   244,    28,    29,   378,    28,   135,    47,   173,   192,
     256,   310,   381,   193,    30,    45,   385,    30,    60,   385,
      28,   184,     5,     6,     7,    54,   417,     8,     9,    10,
      71,    55,    30,   291,    11,    66,    98,   296,    12,   197,
      67,    68,   246,   247,   248,   395,   249,   250,   123,    69,
     124,    35,    36,    37,    38,   327,   178,   328,    99,   402,
     125,   403,   126,   127,   100,   401,   103,   128,    12,   129,
     130,   131,   317,   132,   101,   133,   -91,   134,   117,   118,
     119,   120,    28,   135,   -89,   102,   136,    76,    77,    78,
     137,   138,   139,   140,   141,   104,   106,   107,   111,   142,
     143,   144,   145,   109,   115,   343,   186,   345,    72,    73,
      74,    75,    76,    77,    78,   179,   -89,   -89,   -89,   -89,
     -89,   -89,   -89,    84,    83,    72,    73,    74,    75,    76,
      77,    78,   189,   180,   194,   199,   200,   425,   201,   202,
     256,   203,   204,   123,   217,   253,   187,   219,   220,   252,
     257,   265,   146,   197,   197,   266,   197,   126,   127,   267,
     197,   272,   128,    12,   129,   130,   131,   273,   132,   274,
     133,   275,   134,   313,   315,   321,   323,    28,   135,   324,
     325,   136,    76,    77,    78,   137,   138,   139,   140,   141,
     340,   339,   409,  -247,   142,   143,   144,   145,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,  -182,   350,    28,   352,  -245,   414,    75,    76,
      77,    78,   205,   138,   139,   140,    30,   235,  -246,   197,
     379,   386,   388,   393,   394,   396,   197,   398,   405,   407,
     408,   411,   416,   413,   422,   424,    53,   146,   400,   367,
     188,   368,   369,   370,   371,   372,   373,   374,   375,   221,
     222,   223,   224,   225,   226,   227,   228,   229,   230,   231,
     232,   233,   234,    28,    72,    73,    74,    75,    76,    77,
      78,   205,   138,   139,   140,    30,    41,   114,   110,   399,
     348,   235,   420,   380,   423,   236,    28,   258,    73,    74,
      75,    76,    77,    78,   205,   138,   139,   140,    30,   382,
     271,   341,   391,   387,   191,   406,     0,   312
};

static const yytype_int16 yycheck[] =
{
      10,   113,    58,    58,   129,   247,   219,   130,   276,   181,
     216,     4,   124,   154,   155,    55,    55,    57,    58,    59,
      60,    61,    62,     4,    16,    35,    36,    37,    38,   127,
     105,     4,   144,     4,   146,    35,    36,    29,    18,    39,
       4,    33,   165,    43,   119,    35,    36,    47,   104,   104,
      22,    31,    32,   105,    34,    27,     0,    47,    48,    49,
      50,    51,   102,   102,     4,     4,    47,   119,   105,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,   119,   181,     3,   141,   141,    36,    54,     8,
     202,   102,    35,   104,   235,   236,   106,   238,    35,   102,
      36,   104,    39,   113,    47,   105,    43,   118,     9,   102,
      47,   236,   122,   103,   124,   118,    36,   103,   102,   129,
     333,   334,   106,   336,   236,    96,    97,    98,    47,   100,
     101,     4,    96,    97,    98,   145,   100,   101,   344,   311,
     102,   253,   108,   109,   110,   286,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,   425,    35,    36,
     402,   102,    39,   275,    41,   306,    43,   113,    45,   292,
      47,   181,    35,    36,   315,    35,    36,    36,   124,    39,
     190,   236,   323,    43,    47,    37,   327,    47,    44,   330,
      35,    36,     5,     6,     7,    36,   409,    10,    11,    12,
      56,    36,    47,   416,    17,   107,    36,   348,    21,   219,
     107,   107,    96,    97,    98,   340,   100,   101,     1,   107,
       3,    48,    49,    50,    51,    23,   236,    25,    37,    97,
      13,    99,    15,    16,    38,   376,     4,    20,    21,    22,
      23,    24,   252,    26,    36,    28,     4,    30,    48,    49,
      50,    51,    35,    36,     4,    36,    39,    40,    41,    42,
      43,    44,    45,    46,    47,   102,   105,   105,    14,    52,
      53,    54,    55,   105,    36,   285,     4,   287,    36,    37,
      38,    39,    40,    41,    42,   106,    36,    37,    38,    39,
      40,    41,    42,   349,   349,    36,    37,    38,    39,    40,
      41,    42,    36,   106,   105,     4,     4,   419,     4,   105,
     320,    54,    54,     1,     4,   102,     4,   119,     4,    56,
       4,     4,   105,   333,   334,     4,   336,    15,    16,     4,
     340,     4,    20,    21,    22,    23,    24,     4,    26,   106,
      28,   102,    30,     4,   107,    96,    56,    35,    36,   106,
     102,    39,    40,    41,    42,    43,    44,    45,    46,    47,
     107,   106,   102,     4,    52,    53,    54,    55,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,   105,     4,    35,     4,     4,   397,    39,    40,
      41,    42,    43,    44,    45,    46,    47,   103,     4,   409,
       4,     4,     4,     4,     4,     4,   416,     4,     4,     4,
       4,     4,    19,     4,     4,     4,    40,   105,   349,   108,
     124,   110,   111,   112,   113,   114,   115,   116,   117,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    13,   106,   104,   348,
     294,   103,   412,   320,   416,   107,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,   325,
     202,   275,   335,   330,   128,   385,    -1,   236
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     7,    10,    11,
      12,    17,    21,   123,   124,   125,   126,   127,   128,   129,
     133,   136,   219,    36,    36,     4,     9,    36,    35,    36,
      47,   138,   231,   103,   134,    48,    49,    50,    51,   221,
       4,   122,   102,   102,   130,    37,   137,    36,   135,   231,
     231,   231,   231,   124,    36,    36,     3,     8,    47,   131,
     132,   139,   102,   104,   118,   165,   107,   107,   107,   107,
       4,   132,    36,    37,    38,    39,    40,    41,    42,   156,
     157,   158,   222,   225,   230,     4,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,   140,    36,    37,
      38,    36,    36,     4,   102,   143,   105,   105,   218,   105,
     158,    14,   144,   146,   138,    36,   141,    48,    49,    50,
      51,   145,   227,     1,     3,    13,    15,    16,    20,    22,
      23,    24,    26,    28,    30,    36,    39,    43,    44,    45,
      46,    47,    52,    53,    54,    55,   105,   132,   147,   148,
     149,   150,   151,   166,   167,   168,   170,   171,   175,   176,
     177,   184,   185,   186,   187,   188,   189,   198,   199,   200,
     201,   202,   210,   219,   220,   228,   229,   230,   231,   106,
     106,   102,   106,   196,    36,   231,     4,     4,   148,    36,
     227,   221,    39,    43,   105,   185,   203,   231,   203,     4,
       4,     4,   105,    54,    54,    43,   228,   231,   231,   192,
     193,   194,   228,   224,   225,   228,   224,     4,   203,   119,
       4,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,   103,   107,   152,   161,   162,
      36,   142,   162,   227,   231,     4,    96,    97,    98,   100,
     101,   197,    56,   102,   172,   173,   231,     4,    36,   204,
     205,   206,   207,   208,   224,     4,     4,     4,   211,   213,
     178,   192,     4,     4,   106,   102,   195,    55,    57,    58,
      59,    60,    61,    62,   102,   169,   226,   169,    36,    41,
      45,   189,   190,   191,   163,   164,   224,    35,    36,    47,
      54,   108,   109,   110,   153,   154,   159,   185,   223,   224,
     225,   228,   229,     4,   224,   107,   218,   231,   228,     4,
     102,    96,   174,    56,   106,   102,   209,    23,    25,   212,
      22,    27,   214,    18,    31,    32,    34,   179,   180,   106,
     107,   194,   196,   231,   224,   231,   203,   104,   165,   155,
       4,   224,     4,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,   108,   110,   111,
     112,   113,   114,   115,   116,   117,   160,   162,   224,     4,
     173,   224,   206,   216,   215,   224,     4,   215,     4,   189,
     189,   208,   189,     4,     4,   185,     4,   169,     4,   164,
     156,   224,    97,    99,   217,     4,   216,     4,     4,   102,
     181,     4,   182,     4,   231,   218,    19,   189,    29,    33,
     171,   183,     4,   190,     4,   228,   196,     4
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
        case 16:
#line 251 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 31:
#line 297 "pir.y"
    { new_sub(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 37:
#line 312 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON); ;}
    break;

  case 38:
#line 313 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 39:
#line 314 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 40:
#line 315 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 41:
#line 316 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 42:
#line 317 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 43:
#line 318 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 44:
#line 319 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 45:
#line 320 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 46:
#line 321 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 47:
#line 322 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 57:
#line 342 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 58:
#line 343 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval));   /* add a new parameter */
                                              set_param_named(lexer, (yyvsp[(2) - (4)].sval)); /* set the :named flag on it */
                                            ;}
    break;

  case 61:
#line 356 "pir.y"
    { add_instr(lexer, (yyvsp[(1) - (2)].sval), NULL); ;}
    break;

  case 62:
#line 357 "pir.y"
    { add_instr(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval));   ;}
    break;

  case 63:
#line 358 "pir.y"
    { add_instr(lexer, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 64:
#line 361 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 65:
#line 362 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 66:
#line 363 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 67:
#line 364 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 68:
#line 365 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 69:
#line 366 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 70:
#line 367 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 71:
#line 368 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 72:
#line 369 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 73:
#line 370 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 74:
#line 371 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 75:
#line 372 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 76:
#line 373 "pir.y"
    { yyerrok; ;}
    break;

  case 77:
#line 376 "pir.y"
    { new_instr(lexer, "null", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 78:
#line 377 "pir.y"
    { new_instr(lexer, "null", (yyvsp[(1) - (4)].sval)); ;}
    break;

  case 79:
#line 381 "pir.y"
    { new_instr(lexer, "get_results"); ;}
    break;

  case 80:
#line 385 "pir.y"
    { /* assign(lexer, $1, $2); */ ;}
    break;

  case 81:
#line 388 "pir.y"
    { (yyval.fixme) = new_rhs(lexer, EXPR_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 82:
#line 389 "pir.y"
    { (yyval.fixme) = new_rhs(lexer, EXPR_SETKEYED, (yyvsp[(1) - (3)].fixme), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 83:
#line 390 "pir.y"
    { (yyval.fixme) = (yyvsp[(2) - (2)].fixme); ;}
    break;

  case 84:
#line 393 "pir.y"
    { (yyval.fixme) = new_rhs(lexer, EXPR_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 85:
#line 394 "pir.y"
    { (yyval.fixme) = new_rhs(lexer, EXPR_SIMPLE, (yyvsp[(1) - (1)].fixme)); ;}
    break;

  case 86:
#line 395 "pir.y"
    { (yyval.fixme) = new_rhs(lexer, EXPR_BINOP, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 87:
#line 396 "pir.y"
    { (yyval.fixme) = new_rhs(lexer, EXPR_GETKEYED, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].fixme)); ;}
    break;

  case 88:
#line 397 "pir.y"
    { (yyval.fixme) = new_rhs(lexer, EXPR_PASM, (yyvsp[(1) - (1)].fixme)); ;}
    break;

  case 89:
#line 400 "pir.y"
    { (yyval.fixme) = NULL; /* $$ = new_instr(lexer, $1); */;}
    break;

  case 90:
#line 401 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 96:
#line 415 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 97:
#line 416 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 98:
#line 417 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 99:
#line 420 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 100:
#line 421 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 101:
#line 422 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 102:
#line 423 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 103:
#line 424 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 104:
#line 425 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 105:
#line 426 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 106:
#line 427 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 107:
#line 428 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 108:
#line 429 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 109:
#line 430 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 110:
#line 431 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 111:
#line 432 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 112:
#line 433 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 113:
#line 434 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 114:
#line 435 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 115:
#line 436 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 116:
#line 437 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 117:
#line 438 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 118:
#line 439 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 119:
#line 440 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 120:
#line 441 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 121:
#line 442 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 122:
#line 446 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 123:
#line 447 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 124:
#line 448 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 125:
#line 449 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 126:
#line 450 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 127:
#line 451 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 128:
#line 452 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 129:
#line 453 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 130:
#line 454 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 131:
#line 455 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 132:
#line 456 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 133:
#line 457 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 134:
#line 458 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 135:
#line 459 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 136:
#line 462 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 142:
#line 478 "pir.y"
    { new_instr(lexer, (yyvsp[(1) - (5)].sval), (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 143:
#line 480 "pir.y"
    { new_instr(lexer, (yyvsp[(3) - (7)].sval), (yyvsp[(1) - (7)].sval), (yyvsp[(2) - (7)].sval), (yyvsp[(4) - (7)].sval), (yyvsp[(6) - (7)].sval)); ;}
    break;

  case 144:
#line 482 "pir.y"
    { new_instr(lexer, (yyvsp[(1) - (5)].sval), (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 145:
#line 485 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 146:
#line 486 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 147:
#line 490 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 148:
#line 491 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 151:
#line 504 "pir.y"
    { new_instr(lexer, "branch", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 155:
#line 515 "pir.y"
    { declare_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 156:
#line 518 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 157:
#line 519 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 159:
#line 527 "pir.y"
    { new_invocation(lexer); ;}
    break;

  case 160:
#line 528 "pir.y"
    { new_invocation(lexer); ;}
    break;

  case 183:
#line 584 "pir.y"
    { ;}
    break;

  case 184:
#line 585 "pir.y"
    { ;}
    break;

  case 185:
#line 586 "pir.y"
    { ;}
    break;

  case 195:
#line 606 "pir.y"
    { add_target(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 199:
#line 614 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_OPTIONAL); ;}
    break;

  case 200:
#line 615 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_OPT_FLAG); ;}
    break;

  case 201:
#line 616 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_SLURPY); ;}
    break;

  case 202:
#line 617 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_UNIQUE_REG); ;}
    break;

  case 203:
#line 618 "pir.y"
    { set_param_named(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 219:
#line 660 "pir.y"
    { add_arg(lexer, (yyvsp[(3) - (3)].sval));
                                             set_arg_named(lexer, (yyvsp[(1) - (3)].sval));
                                           ;}
    break;

  case 220:
#line 665 "pir.y"
    { add_arg(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 232:
#line 695 "pir.y"
    { set_arg_flag(lexer, ARG_FLAG_FLAT); ;}
    break;

  case 233:
#line 696 "pir.y"
    { set_arg_named(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 234:
#line 699 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 235:
#line 700 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 236:
#line 703 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), 0);  ;}
    break;

  case 238:
#line 707 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), 1);  ;}
    break;

  case 239:
#line 710 "pir.y"
    { (yyval.constval) = new_iconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 240:
#line 711 "pir.y"
    { (yyval.constval) = new_nconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 241:
#line 712 "pir.y"
    { (yyval.constval) = new_pconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 242:
#line 713 "pir.y"
    { (yyval.constval) = new_sconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 245:
#line 721 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 246:
#line 722 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 247:
#line 723 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 253:
#line 735 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 254:
#line 736 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 255:
#line 737 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 256:
#line 738 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 257:
#line 739 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 258:
#line 740 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 259:
#line 743 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 260:
#line 744 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 261:
#line 745 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 262:
#line 746 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2739 "pirparser.c"
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


#line 771 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


