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
#line 81 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 384 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 397 "pirparser.c"

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
#define YYLAST   477

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  105
/* YYNRULES -- Number of rules.  */
#define YYNRULES  271
/* YYNRULES -- Number of states.  */
#define YYNSTATES  426

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
     108,   110,   112,   114,   116,   118,   123,   126,   131,   132,
     136,   138,   140,   142,   144,   145,   148,   153,   156,   161,
     162,   165,   168,   171,   173,   175,   177,   179,   181,   183,
     185,   187,   189,   191,   193,   195,   197,   199,   202,   206,
     211,   217,   220,   224,   227,   231,   234,   237,   239,   243,
     246,   248,   251,   253,   255,   258,   259,   261,   263,   267,
     269,   272,   274,   276,   278,   280,   282,   284,   286,   288,
     290,   292,   294,   296,   298,   300,   302,   304,   306,   308,
     310,   312,   314,   316,   318,   320,   322,   324,   326,   328,
     330,   332,   334,   336,   338,   340,   342,   344,   346,   348,
     350,   352,   356,   358,   362,   364,   366,   368,   374,   382,
     388,   390,   392,   395,   398,   400,   402,   406,   411,   413,
     417,   420,   421,   423,   429,   431,   433,   442,   443,   446,
     451,   455,   458,   464,   465,   468,   469,   472,   477,   479,
     486,   490,   493,   494,   496,   498,   502,   505,   506,   509,
     511,   513,   515,   518,   520,   522,   524,   526,   528,   530,
     535,   537,   539,   541,   543,   545,   547,   549,   551,   557,
     559,   561,   565,   569,   573,   577,   578,   580,   582,   586,
     589,   593,   599,   600,   603,   607,   608,   611,   615,   618,
     619,   622,   624,   627,   628,   632,   635,   638,   642,   647,
     652,   657,   662,   664,   666,   668,   670,   672,   674,   676,
     678,   680,   682,   684,   686,   688,   690,   692,   694,   696,
     698,   700,   702,   704,   706,   708,   710,   712,   714,   716,
     718,   720
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
      -1,     3,   132,    -1,   132,    -1,    47,   156,     4,    -1,
      17,   134,    -1,    -1,   103,   135,   104,    -1,    36,    -1,
     135,   166,    36,    -1,    -1,    12,   138,   137,   139,     4,
     143,   146,    13,    -1,   224,    -1,    36,    -1,    -1,   139,
     140,    -1,    88,    -1,    85,    -1,    86,    -1,    87,    -1,
      89,    -1,    92,    -1,    94,    -1,    95,    -1,    90,   105,
     138,   106,    -1,    91,   212,    -1,    93,   105,   141,   106,
      -1,    -1,   141,   102,   142,    -1,   224,    -1,    36,    -1,
     163,    -1,   220,    -1,    -1,   143,   144,    -1,    14,   145,
     189,     4,    -1,   220,   224,    -1,   220,    36,    56,   224,
      -1,    -1,   146,   147,    -1,     3,     4,    -1,     3,   148,
      -1,   148,    -1,   167,    -1,   171,    -1,   172,    -1,   176,
      -1,   214,    -1,   195,    -1,   197,    -1,   177,    -1,   152,
      -1,   151,    -1,   132,    -1,   150,    -1,   149,    -1,     1,
       4,    -1,    54,   221,     4,    -1,   221,   107,    54,     4,
      -1,    30,   105,   186,   106,     4,    -1,   193,     4,    -1,
     221,   153,     4,    -1,   162,   217,    -1,   163,   107,   217,
      -1,   107,   154,    -1,   160,   217,    -1,   217,    -1,   217,
     161,   217,    -1,   221,   163,    -1,   159,    -1,    36,   200,
      -1,   193,    -1,   155,    -1,    47,   157,    -1,    -1,   157,
      -1,   158,    -1,   157,   102,   158,    -1,   216,    -1,   192,
     200,    -1,   108,    -1,   109,    -1,   110,    -1,   111,    -1,
     108,    -1,   112,    -1,   113,    -1,   114,    -1,   115,    -1,
     116,    -1,   110,    -1,   117,    -1,    70,    -1,    63,    -1,
      64,    -1,    65,    -1,    67,    -1,    68,    -1,    66,    -1,
      69,    -1,    58,    -1,    60,    -1,    59,    -1,    62,    -1,
      61,    -1,    57,    -1,    74,    -1,    75,    -1,    76,    -1,
      77,    -1,    78,    -1,    79,    -1,    82,    -1,    80,    -1,
      81,    -1,    83,    -1,    84,    -1,    72,    -1,    73,    -1,
      71,    -1,   103,   164,   104,    -1,   165,    -1,   164,   166,
     165,    -1,   217,    -1,   118,    -1,   102,    -1,   168,   217,
     170,   224,     4,    -1,   168,   217,   219,   217,   170,   224,
       4,    -1,   169,   217,   170,   224,     4,    -1,    52,    -1,
      53,    -1,    52,    54,    -1,    53,    54,    -1,    55,    -1,
     102,    -1,    55,   224,     4,    -1,    16,   220,   173,     4,
      -1,   174,    -1,   173,   102,   174,    -1,   224,   175,    -1,
      -1,    96,    -1,    15,    36,   102,   221,     4,    -1,   178,
      -1,   185,    -1,    28,     4,   179,   181,     4,   183,    29,
       4,    -1,    -1,   179,   180,    -1,    32,   217,   210,     4,
      -1,    31,   192,   182,    -1,    34,   192,    -1,    18,   192,
       4,    19,   194,    -1,    -1,   102,   192,    -1,    -1,   183,
     184,    -1,    33,   221,   189,     4,    -1,   172,    -1,   105,
     186,   106,   107,   191,     4,    -1,    36,   200,     4,    -1,
     159,     4,    -1,    -1,   187,    -1,   188,    -1,   187,   102,
     188,    -1,   221,   189,    -1,    -1,   189,   190,    -1,   100,
      -1,   101,    -1,    98,    -1,    97,   212,    -1,    96,    -1,
     159,    -1,   193,    -1,    43,    -1,    39,    -1,   224,    -1,
     192,   119,   194,   200,    -1,   224,    -1,    36,    -1,    45,
      -1,    41,    -1,    39,    -1,    43,    -1,   198,    -1,   196,
      -1,    26,     4,   207,    27,     4,    -1,   199,    -1,   204,
      -1,    22,   200,     4,    -1,    22,   191,     4,    -1,    23,
     200,     4,    -1,   105,   201,   106,    -1,    -1,   202,    -1,
     203,    -1,   202,   102,   203,    -1,   217,   210,    -1,    36,
      56,   217,    -1,    24,     4,   205,    25,     4,    -1,    -1,
     205,   206,    -1,    23,   209,     4,    -1,    -1,   207,   208,
      -1,    22,   209,     4,    -1,   217,   210,    -1,    -1,   210,
     211,    -1,    99,    -1,    97,   212,    -1,    -1,   105,    36,
     106,    -1,    21,   215,    -1,   213,     4,    -1,    20,   215,
       4,    -1,    48,   224,   107,    37,    -1,    49,   224,   107,
      38,    -1,    50,   224,   107,    36,    -1,    51,   224,   107,
      36,    -1,   218,    -1,   223,    -1,   221,    -1,   218,    -1,
      36,    -1,    37,    -1,    38,    -1,    57,    -1,    58,    -1,
      59,    -1,    60,    -1,    62,    -1,    61,    -1,    48,    -1,
      49,    -1,    50,    -1,    51,    -1,   222,    -1,   224,    -1,
      43,    -1,    44,    -1,    46,    -1,    45,    -1,   223,    -1,
      39,    -1,    40,    -1,    42,    -1,    41,    -1,    35,    -1,
      47,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   235,   235,   240,   241,   244,   245,   248,   249,   250,
     251,   252,   253,   254,   255,   258,   261,   267,   270,   275,
     281,   282,   285,   286,   287,   290,   295,   298,   299,   302,
     303,   308,   308,   315,   316,   319,   320,   323,   324,   325,
     326,   327,   328,   329,   330,   331,   332,   333,   336,   337,
     340,   341,   342,   343,   346,   347,   350,   353,   354,   362,
     363,   367,   368,   369,   372,   373,   374,   375,   376,   377,
     378,   379,   380,   381,   382,   383,   384,   385,   388,   389,
     392,   395,   398,   401,   402,   403,   406,   407,   408,   409,
     410,   411,   412,   413,   426,   429,   430,   433,   434,   437,
     441,   444,   445,   446,   449,   450,   451,   452,   453,   454,
     455,   456,   457,   458,   459,   460,   461,   462,   463,   464,
     465,   466,   467,   468,   469,   470,   471,   475,   476,   477,
     478,   479,   480,   481,   482,   483,   484,   485,   486,   487,
     488,   491,   494,   495,   498,   501,   502,   506,   508,   510,
     514,   515,   519,   520,   523,   524,   532,   536,   539,   540,
     543,   547,   548,   553,   556,   557,   560,   567,   568,   571,
     574,   575,   576,   580,   581,   584,   585,   588,   589,   592,
     593,   594,   597,   598,   601,   602,   605,   608,   609,   612,
     613,   614,   615,   616,   619,   620,   623,   624,   625,   628,
     631,   632,   633,   634,   635,   636,   639,   640,   643,   649,
     650,   653,   654,   657,   660,   663,   664,   667,   668,   671,
     672,   677,   682,   683,   686,   689,   690,   693,   696,   699,
     700,   703,   704,   707,   708,   711,   714,   715,   718,   719,
     720,   721,   724,   725,   728,   729,   732,   733,   734,   737,
     738,   739,   740,   741,   742,   745,   746,   747,   748,   751,
     752,   755,   756,   757,   758,   759,   762,   763,   764,   765,
     768,   769
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
  "parameter", "param_def", "instructions", "labeled_instruction",
  "instruction", "null_statement", "getresults_statement",
  "methodcall_statement", "assignment_statement", "assignment_tail",
  "assignment_expression", "parrot_instruction", "opt_parrot_op_args",
  "parrot_op_args", "parrot_op_arg", "simple_invocation", "unop", "binop",
  "augmented_op", "keylist", "keys", "key", "separator",
  "conditional_statement", "if_type", "if_null_type", "goto_or_comma",
  "goto_statement", "local_declaration", "local_id_list", "local_id",
  "has_unique_reg", "lex_declaration", "invocation_statement",
  "long_invocation_statement", "long_arguments", "long_argument",
  "long_invocation", "opt_return_continuation", "long_results",
  "long_result", "short_invocation_statement", "opt_target_list",
  "target_list", "result_target", "param_flags", "param_flag",
  "invocation_expression", "invokable", "methodcall", "method",
  "return_statement", "long_return_statement", "yield_statement",
  "short_return_statement", "short_yield_statement", "arguments",
  "opt_arguments_list", "arguments_list", "argument",
  "long_yield_statement", "yield_expressions", "yield_expression",
  "return_expressions", "return_expression", "result", "arg_flags",
  "arg_flag", "opt_paren_string", "const_declaration",
  "const_decl_statement", "const_tail", "pasm_expression", "expression",
  "constant", "rel_op", "type", "target", "reg", "pasm_reg", "identifier", 0
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
     148,   148,   148,   148,   148,   148,   148,   148,   149,   149,
     150,   151,   152,   153,   153,   153,   154,   154,   154,   154,
     154,   154,   154,   154,   155,   156,   156,   157,   157,   158,
     159,   160,   160,   160,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   161,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   161,   161,   161,   161,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   162,   162,   162,
     162,   163,   164,   164,   165,   166,   166,   167,   167,   167,
     168,   168,   169,   169,   170,   170,   171,   172,   173,   173,
     174,   175,   175,   176,   177,   177,   178,   179,   179,   180,
     181,   181,   181,   182,   182,   183,   183,   184,   184,   185,
     185,   185,   186,   186,   187,   187,   188,   189,   189,   190,
     190,   190,   190,   190,   191,   191,   192,   192,   192,   193,
     194,   194,   194,   194,   194,   194,   195,   195,   196,   197,
     197,   198,   198,   199,   200,   201,   201,   202,   202,   203,
     203,   204,   205,   205,   206,   207,   207,   208,   209,   210,
     210,   211,   211,   212,   212,   213,   214,   214,   215,   215,
     215,   215,   216,   216,   217,   217,   218,   218,   218,   219,
     219,   219,   219,   219,   219,   220,   220,   220,   220,   221,
     221,   222,   222,   222,   222,   222,   223,   223,   223,   223,
     224,   224
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     2,     4,     4,     4,
       0,     2,     2,     2,     1,     3,     2,     0,     3,     1,
       3,     0,     8,     1,     1,     0,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     2,     4,     0,     3,
       1,     1,     1,     1,     0,     2,     4,     2,     4,     0,
       2,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     3,     4,
       5,     2,     3,     2,     3,     2,     2,     1,     3,     2,
       1,     2,     1,     1,     2,     0,     1,     1,     3,     1,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     3,     1,     1,     1,     5,     7,     5,
       1,     1,     2,     2,     1,     1,     3,     4,     1,     3,
       2,     0,     1,     5,     1,     1,     8,     0,     2,     4,
       3,     2,     5,     0,     2,     0,     2,     4,     1,     6,
       3,     2,     0,     1,     1,     3,     2,     0,     2,     1,
       1,     1,     2,     1,     1,     1,     1,     1,     1,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     5,     1,
       1,     3,     3,     3,     3,     0,     1,     1,     3,     2,
       3,     5,     0,     2,     3,     0,     2,     3,     2,     0,
       2,     1,     2,     0,     3,     2,     2,     3,     4,     4,
       4,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    27,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,   270,    34,
     271,    31,    33,     0,    26,     0,     0,     0,     0,   235,
       4,     2,     0,     0,     0,    15,    35,    29,     0,     0,
       0,     0,     0,     6,    17,    18,     0,    19,    95,    21,
      24,     0,   146,    28,   145,     0,     0,     0,     0,     0,
      22,    23,   246,   247,   248,   266,   267,   269,   268,     0,
      96,    97,    99,   242,   243,    54,    38,    39,    40,    37,
      41,     0,   233,    42,     0,    43,    44,    36,    30,   238,
     239,   240,   241,    25,     0,    59,     0,     0,    46,    48,
      98,     0,    55,     0,     0,     0,     0,   255,   256,   257,
     258,   187,     0,     0,     0,    32,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   266,   261,   262,   264,
     263,   271,   150,   151,     0,     0,   182,    74,    60,    63,
      76,    75,    73,    72,     0,    64,     0,     0,    65,    66,
      67,    71,   164,   165,     0,     0,    69,   207,    70,   206,
     209,   210,     0,    68,     0,   259,   265,   260,    45,   234,
       0,    47,     0,     0,    57,    77,    61,    62,     0,     0,
       0,   197,   196,   215,   194,     0,   195,     0,   198,     0,
     222,   225,   167,   182,     0,   152,   153,   261,     0,   260,
       0,     0,   183,   184,   187,   181,     0,   245,   244,     0,
       0,   100,    81,   236,   140,   138,   139,   127,   128,   129,
     130,   131,   132,   134,   135,   133,   136,   137,     0,     0,
       0,     0,     0,    51,    49,    52,    53,    50,    56,   193,
     233,   191,   189,   190,   188,     0,     0,     0,   158,   161,
     237,   246,     0,   216,   217,   229,   212,   211,   213,     0,
       0,     0,     0,   180,    78,   156,     0,     0,   186,   154,
     249,   250,   251,   252,   254,   253,   155,     0,     0,     0,
     201,   204,   203,   205,   202,     0,   200,     0,   142,   144,
     246,   271,     0,   101,   102,   103,    85,    93,    90,     0,
      92,    87,   244,    82,    83,     0,   192,    58,     0,   157,
       0,   162,   160,     0,   214,     0,   219,     0,     0,   223,
       0,     0,   226,     0,     0,     0,     0,   168,     0,     0,
       0,   185,     0,     0,     0,   199,   141,     0,    91,    94,
      79,    86,   126,   121,   123,   122,   125,   124,   114,   115,
     116,   119,   117,   118,   120,   113,   105,   111,   104,   106,
     107,   108,   109,   110,   112,     0,    89,    84,   163,   159,
     220,   218,   233,   231,   230,     0,   229,   221,     0,   208,
       0,   173,   229,   171,   175,    80,     0,   147,     0,   149,
     143,    88,   232,   224,   228,   227,     0,     0,   170,     0,
       0,   179,     0,     0,   174,   169,     0,     0,   178,   176,
     148,   172,   166,   187,     0,   177
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      44,    59,   147,    20,    34,    48,    21,    46,    31,    61,
      97,   116,   244,   105,   112,   121,   113,   148,   149,   150,
     151,   152,   153,   240,   306,   307,    79,    80,    81,   154,
     309,   375,   241,   242,   297,   298,    65,   155,   156,   157,
     287,   158,   159,   257,   258,   322,   160,   161,   162,   271,
     337,   338,   408,   410,   419,   163,   211,   212,   213,   182,
     254,   195,   164,   165,   295,   166,   167,   168,   169,   170,
     197,   262,   263,   264,   171,   269,   329,   270,   332,   385,
     326,   384,   108,    22,   173,    39,    82,   265,   217,   288,
     122,   218,   175,   176,   209
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -314
static const yytype_int16 yypact[] =
{
      14,  -314,    36,   151,  -314,    19,    29,   100,   104,    93,
      -5,    37,   164,   129,  -314,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,    57,    62,  -314,   139,  -314,  -314,  -314,
    -314,  -314,  -314,   163,  -314,    41,    41,    41,    41,  -314,
     151,  -314,   172,   192,    30,  -314,  -314,  -314,    16,   137,
     141,   143,   150,  -314,  -314,  -314,    13,  -314,   182,  -314,
    -314,    60,  -314,  -314,  -314,   220,   221,   222,   223,   229,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,   196,
     165,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,
    -314,   168,   170,  -314,   175,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,   182,   267,    -5,   246,  -314,  -314,
    -314,   204,  -314,   248,   179,   180,    71,  -314,  -314,  -314,
    -314,  -314,    38,   292,   316,  -314,   261,   204,   164,     4,
     193,   295,   300,   302,   203,   193,   -65,   -57,  -314,  -314,
    -314,    42,   253,   255,   149,    41,   149,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,   307,  -314,   387,   387,  -314,  -314,
    -314,  -314,  -314,  -314,   -53,   308,  -314,  -314,  -314,  -314,
    -314,  -314,   309,  -314,   159,  -314,  -314,   -52,  -314,  -314,
      21,  -314,    10,   258,  -314,  -314,  -314,  -314,   213,    41,
     312,  -314,  -314,   430,  -314,   314,  -314,   315,  -314,   317,
    -314,  -314,  -314,   149,   318,  -314,  -314,  -314,   321,  -314,
     323,   227,   226,  -314,  -314,  -314,    40,  -314,  -314,   -39,
     351,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,   387,   337,
     325,   387,   228,  -314,  -314,  -314,  -314,  -314,  -314,  -314,
     170,  -314,  -314,  -314,  -314,    41,   149,    15,  -314,   238,
    -314,   285,   237,   243,  -314,  -314,  -314,  -314,  -314,   202,
     109,    27,   241,  -314,  -314,  -314,   242,   149,   106,  -314,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,    41,   387,    41,
    -314,  -314,  -314,  -314,  -314,   193,  -314,    65,  -314,  -314,
     193,   182,   344,  -314,  -314,  -314,  -314,  -314,  -314,   387,
    -314,   347,   247,  -314,  -314,   387,  -314,  -314,   350,  -314,
      41,  -314,  -314,   387,  -314,   430,    88,   387,   360,  -314,
     387,   361,  -314,   162,   162,   387,   162,  -314,   362,   363,
     162,  -314,   381,   -39,   385,  -314,  -314,   387,  -314,   165,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,  -314,   387,  -314,  -314,  -314,  -314,
    -314,  -314,   170,  -314,  -314,   389,  -314,  -314,   391,  -314,
     395,   298,  -314,  -314,  -314,  -314,   397,  -314,    41,  -314,
    -314,  -314,  -314,  -314,    88,  -314,   383,   162,  -314,    31,
       8,  -314,   414,   351,  -314,  -314,   415,   149,  -314,  -314,
    -314,  -314,  -314,  -314,    25,  -314
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -314,  -314,   407,  -314,   396,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,    49,  -314,  -314,  -314,  -314,  -314,   329,  -314,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,  -314,   313,  -314,
    -314,  -314,  -314,  -314,  -314,  -314,  -314,   138,   334,  -124,
    -314,  -314,  -314,  -171,  -314,    94,   145,  -314,  -314,  -314,
    -206,  -314,    33,  -314,   120,  -314,  -314,  -314,  -314,  -314,
    -314,  -314,  -314,  -314,  -314,  -314,   245,  -314,   167,  -212,
    -314,   110,  -313,  -123,    39,  -314,  -314,  -314,  -314,  -314,
    -120,  -314,  -314,   124,  -314,  -314,  -314,  -314,  -314,   121,
    -254,  -314,  -239,    58,  -314,   326,  -314,  -149,   -55,  -314,
    -105,  -112,  -314,   -54,   -10
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -199
static const yytype_int16 yytable[] =
{
      32,   174,   278,    83,    84,   194,   196,   216,   219,   245,
     199,   316,   174,   289,   248,   204,   279,    70,     1,   319,
     390,   391,   189,   393,   127,    49,    50,    51,    52,   425,
      28,    29,   208,    56,   214,   415,     4,   416,    57,    28,
    -197,   417,    30,   191,   221,   333,   -95,   192,  -196,    83,
      84,    30,   193,  -198,  -197,    23,    28,   243,   334,   335,
      58,   336,  -196,   286,    85,    24,   220,  -198,    30,   117,
     118,   119,   120,    28,   183,   246,    28,    58,    72,    73,
      74,    75,    76,    77,    78,    30,    83,    84,    30,   299,
     311,   214,   314,    60,   414,   279,    32,   280,   281,   282,
     283,   284,   285,   177,    25,    71,   249,   250,   251,   193,
     252,   253,   184,    26,   177,   308,   310,   320,    62,   198,
      63,   249,   250,   251,   238,   252,   253,   312,   382,    27,
     383,   330,   404,    40,    64,   210,   331,   398,   409,   343,
      33,   376,   286,   402,   318,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,     5,     6,     7,    42,
     351,     8,     9,    10,    43,   214,   377,    62,    11,   346,
     247,   172,    12,   180,   380,   345,    45,   181,   386,   259,
     348,   386,   172,    64,    28,   382,   392,   383,    75,    76,
      77,    78,   207,   138,   139,   140,    30,    28,   299,    47,
     103,   191,   249,   250,   251,   192,   252,   253,    54,    30,
     296,   424,    35,    36,    37,    38,   194,   196,    72,    73,
      74,    75,    76,    77,    78,   327,   401,   328,    55,   177,
     224,   225,   226,   227,   228,   229,   230,   231,   232,   233,
     234,   235,   236,   237,    66,   317,    83,    84,    67,   123,
      68,   124,   117,   118,   119,   120,    98,    69,    99,   101,
     100,   125,   238,   126,   127,   102,   239,   104,   128,    12,
     129,   130,   131,   106,   132,   107,   133,   342,   134,   344,
     109,   111,   115,    28,   135,   178,   179,   136,    76,    77,
      78,   137,   138,   139,   140,   141,   185,   188,   193,   200,
     142,   143,   144,   145,   201,   423,   202,   205,   203,   206,
     259,   215,   222,   223,   255,   256,   260,   123,   266,   267,
     186,   268,   273,   198,   198,   274,   198,   275,   277,   313,
     198,   126,   127,   276,   321,   315,   128,    12,   129,   130,
     131,   323,   132,   324,   133,   325,   134,   339,   350,   340,
     238,    28,   135,   146,   378,   136,    76,    77,    78,   137,
     138,   139,   140,   141,   387,   389,   394,   395,   142,   143,
     144,   145,    28,   300,    73,    74,   136,    76,    77,    78,
     137,   138,   139,   140,   301,   397,    28,   290,   412,   399,
     291,   302,   292,   403,   293,   405,   294,   198,    30,   406,
     407,   411,   413,   296,   352,   353,   354,   355,   356,   357,
     358,   359,   360,   361,   362,   363,   364,   365,   420,   422,
      41,   146,    28,    72,    73,    74,    75,    76,    77,    78,
     207,   138,   139,   140,    30,   114,    53,   187,   110,   349,
     379,   400,   347,   418,   341,   303,   304,   305,   272,   381,
     396,   388,   421,     0,   190,   366,     0,   367,   368,   369,
     370,   371,   372,   373,   374,    28,   261,    73,    74,    75,
      76,    77,    78,   207,   138,   139,   140,    30
};

static const yytype_int16 yycheck[] =
{
      10,   113,   214,    58,    58,   129,   129,   156,   157,   180,
     130,   250,   124,   219,     4,   135,    55,     4,     4,     4,
     333,   334,   127,   336,    16,    35,    36,    37,    38,     4,
      35,    36,   144,     3,   146,     4,     0,    29,     8,    35,
     105,    33,    47,    39,   164,    18,     4,    43,   105,   104,
     104,    47,   105,   105,   119,    36,    35,    36,    31,    32,
      47,    34,   119,   102,     4,    36,   119,   119,    47,    48,
      49,    50,    51,    35,    36,   180,    35,    47,    36,    37,
      38,    39,    40,    41,    42,    47,   141,   141,    47,   238,
     239,   203,   241,    44,   407,    55,   106,    57,    58,    59,
      60,    61,    62,   113,     4,    56,    96,    97,    98,   105,
     100,   101,   122,     9,   124,   239,   239,   102,   102,   129,
     104,    96,    97,    98,   103,   100,   101,   239,    97,    36,
      99,    22,   386,     4,   118,   145,    27,   343,   392,   288,
     103,   312,   102,   382,   256,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,     5,     6,     7,   102,
     309,    10,    11,    12,   102,   277,   315,   102,    17,   104,
     180,   113,    21,   102,   323,   295,    37,   106,   327,   189,
     300,   330,   124,   118,    35,    97,   335,    99,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    35,   347,    36,
       4,    39,    96,    97,    98,    43,   100,   101,    36,    47,
     220,   423,    48,    49,    50,    51,   340,   340,    36,    37,
      38,    39,    40,    41,    42,    23,   375,    25,    36,   239,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,   107,   255,   301,   301,   107,     1,
     107,     3,    48,    49,    50,    51,    36,   107,    37,    36,
      38,    13,   103,    15,    16,    36,   107,   102,    20,    21,
      22,    23,    24,   105,    26,   105,    28,   287,    30,   289,
     105,    14,    36,    35,    36,   106,   106,    39,    40,    41,
      42,    43,    44,    45,    46,    47,     4,    36,   105,     4,
      52,    53,    54,    55,     4,   417,     4,    54,   105,    54,
     320,     4,     4,     4,    56,   102,     4,     1,     4,     4,
       4,     4,     4,   333,   334,     4,   336,     4,   102,     4,
     340,    15,    16,   106,    96,   107,    20,    21,    22,    23,
      24,    56,    26,   106,    28,   102,    30,   106,     4,   107,
     103,    35,    36,   105,     4,    39,    40,    41,    42,    43,
      44,    45,    46,    47,     4,     4,     4,     4,    52,    53,
      54,    55,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,     4,    35,    36,   398,     4,
      39,    54,    41,     4,    43,     4,    45,   407,    47,     4,
     102,     4,    19,   413,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,     4,     4,
      13,   105,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,   106,    40,   124,   104,   301,
     320,   347,   297,   410,   277,   108,   109,   110,   203,   325,
     340,   330,   413,    -1,   128,   108,    -1,   110,   111,   112,
     113,   114,   115,   116,   117,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     7,    10,    11,
      12,    17,    21,   123,   124,   125,   126,   127,   128,   129,
     133,   136,   213,    36,    36,     4,     9,    36,    35,    36,
      47,   138,   224,   103,   134,    48,    49,    50,    51,   215,
       4,   122,   102,   102,   130,    37,   137,    36,   135,   224,
     224,   224,   224,   124,    36,    36,     3,     8,    47,   131,
     132,   139,   102,   104,   118,   166,   107,   107,   107,   107,
       4,   132,    36,    37,    38,    39,    40,    41,    42,   156,
     157,   158,   216,   218,   223,     4,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,   140,    36,    37,
      38,    36,    36,     4,   102,   143,   105,   105,   212,   105,
     158,    14,   144,   146,   138,    36,   141,    48,    49,    50,
      51,   145,   220,     1,     3,    13,    15,    16,    20,    22,
      23,    24,    26,    28,    30,    36,    39,    43,    44,    45,
      46,    47,    52,    53,    54,    55,   105,   132,   147,   148,
     149,   150,   151,   152,   159,   167,   168,   169,   171,   172,
     176,   177,   178,   185,   192,   193,   195,   196,   197,   198,
     199,   204,   213,   214,   221,   222,   223,   224,   106,   106,
     102,   106,   189,    36,   224,     4,     4,   148,    36,   220,
     215,    39,    43,   105,   159,   191,   193,   200,   224,   200,
       4,     4,     4,   105,   200,    54,    54,    43,   221,   224,
     224,   186,   187,   188,   221,     4,   217,   218,   221,   217,
     119,   200,     4,     4,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,   103,   107,
     153,   162,   163,    36,   142,   163,   220,   224,     4,    96,
      97,    98,   100,   101,   190,    56,   102,   173,   174,   224,
       4,    36,   201,   202,   203,   217,     4,     4,     4,   205,
     207,   179,   186,     4,     4,     4,   106,   102,   189,    55,
      57,    58,    59,    60,    61,    62,   102,   170,   219,   170,
      36,    39,    41,    43,    45,   194,   224,   164,   165,   217,
      36,    47,    54,   108,   109,   110,   154,   155,   159,   160,
     193,   217,   221,     4,   217,   107,   212,   224,   221,     4,
     102,    96,   175,    56,   106,   102,   210,    23,    25,   206,
      22,    27,   208,    18,    31,    32,    34,   180,   181,   106,
     107,   188,   224,   217,   224,   200,   104,   166,   200,   157,
       4,   217,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,   108,   110,   111,   112,
     113,   114,   115,   116,   117,   161,   163,   217,     4,   174,
     217,   203,    97,    99,   211,   209,   217,     4,   209,     4,
     192,   192,   217,   192,     4,     4,   191,     4,   170,     4,
     165,   217,   212,     4,   210,     4,     4,   102,   182,   210,
     183,     4,   224,    19,   192,     4,    29,    33,   172,   184,
       4,   194,     4,   221,   189,     4
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
#line 262 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 31:
#line 308 "pir.y"
    { new_sub(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 37:
#line 323 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON); ;}
    break;

  case 38:
#line 324 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 39:
#line 325 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 40:
#line 326 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 41:
#line 327 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 42:
#line 328 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 43:
#line 329 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 44:
#line 330 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 45:
#line 331 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 46:
#line 332 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 57:
#line 353 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 58:
#line 354 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval));   /* add a new parameter */
                                              set_param_named(lexer, (yyvsp[(2) - (4)].sval)); /* set the :named flag on it */
                                            ;}
    break;

  case 61:
#line 367 "pir.y"
    { add_instr(lexer, (yyvsp[(1) - (2)].sval), NULL); ;}
    break;

  case 62:
#line 368 "pir.y"
    { add_instr(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval));   ;}
    break;

  case 63:
#line 369 "pir.y"
    { add_instr(lexer, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 64:
#line 372 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 65:
#line 373 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 66:
#line 374 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 67:
#line 375 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 68:
#line 376 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 69:
#line 377 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 70:
#line 378 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 71:
#line 379 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 72:
#line 380 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 73:
#line 381 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 74:
#line 382 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 75:
#line 383 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 76:
#line 384 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 77:
#line 385 "pir.y"
    { yyerrok; ;}
    break;

  case 78:
#line 388 "pir.y"
    { new_instr(lexer, "null", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 79:
#line 389 "pir.y"
    { new_instr(lexer, "null", (yyvsp[(1) - (4)].sval)); ;}
    break;

  case 101:
#line 444 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 102:
#line 445 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 103:
#line 446 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 104:
#line 449 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 105:
#line 450 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 106:
#line 451 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 107:
#line 452 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 108:
#line 453 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 109:
#line 454 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 110:
#line 455 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 111:
#line 456 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 112:
#line 457 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 113:
#line 458 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 114:
#line 459 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 115:
#line 460 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 116:
#line 461 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 117:
#line 462 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 118:
#line 463 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 119:
#line 464 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 120:
#line 465 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 121:
#line 466 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 122:
#line 467 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 123:
#line 468 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 124:
#line 469 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 125:
#line 470 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 126:
#line 471 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 127:
#line 475 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 128:
#line 476 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 129:
#line 477 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 130:
#line 478 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 131:
#line 479 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 132:
#line 480 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 133:
#line 481 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 134:
#line 482 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 135:
#line 483 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 136:
#line 484 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 137:
#line 485 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 138:
#line 486 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 139:
#line 487 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 140:
#line 488 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 147:
#line 507 "pir.y"
    { new_instr(lexer, (yyvsp[(1) - (5)].sval), (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 148:
#line 509 "pir.y"
    { new_instr(lexer, (yyvsp[(3) - (7)].sval), (yyvsp[(1) - (7)].sval), (yyvsp[(2) - (7)].sval), (yyvsp[(4) - (7)].sval), (yyvsp[(6) - (7)].sval)); ;}
    break;

  case 149:
#line 511 "pir.y"
    { new_instr(lexer, (yyvsp[(1) - (5)].sval), (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 150:
#line 514 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 151:
#line 515 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 152:
#line 519 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 153:
#line 520 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 156:
#line 533 "pir.y"
    { new_instr(lexer, "branch", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 160:
#line 544 "pir.y"
    { declare_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 161:
#line 547 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 162:
#line 548 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 189:
#line 612 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_OPTIONAL); ;}
    break;

  case 190:
#line 613 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_OPT_FLAG); ;}
    break;

  case 191:
#line 614 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_SLURPY); ;}
    break;

  case 192:
#line 615 "pir.y"
    { set_param_named(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 193:
#line 616 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_UNIQUE_REG); ;}
    break;

  case 220:
#line 672 "pir.y"
    { add_arg(lexer, (yyvsp[(3) - (3)].sval));
                                              set_arg_named(lexer, (yyvsp[(1) - (3)].sval));
                                            ;}
    break;

  case 231:
#line 703 "pir.y"
    { set_arg_flag(lexer, ARG_FLAG_FLAT); ;}
    break;

  case 232:
#line 704 "pir.y"
    { set_arg_named(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 233:
#line 707 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 234:
#line 708 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 235:
#line 711 "pir.y"
    { /* define_const(lexer, $1, 0); */ ;}
    break;

  case 237:
#line 715 "pir.y"
    { /* define_const(lexer, $2, 1); */ ;}
    break;

  case 249:
#line 737 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 250:
#line 738 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 251:
#line 739 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 252:
#line 740 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 253:
#line 741 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 254:
#line 742 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 255:
#line 745 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 256:
#line 746 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 257:
#line 747 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 258:
#line 748 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2614 "pirparser.c"
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


#line 773 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


