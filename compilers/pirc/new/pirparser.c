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
     TK_N_OPERATORS = 262,
     TK_PRAGMA = 263,
     TK_LOADLIB = 264,
     TK_SUB = 265,
     TK_END = 266,
     TK_PARAM = 267,
     TK_LEX = 268,
     TK_LOCAL = 269,
     TK_NAMESPACE = 270,
     TK_INVOCANT = 271,
     TK_METH_CALL = 272,
     TK_GLOBALCONST = 273,
     TK_CONST = 274,
     TK_RETURN = 275,
     TK_YIELD = 276,
     TK_BEGIN_YIELD = 277,
     TK_END_YIELD = 278,
     TK_BEGIN_RETURN = 279,
     TK_END_RETURN = 280,
     TK_BEGIN_CALL = 281,
     TK_END_CALL = 282,
     TK_GET_RESULTS = 283,
     TK_CALL = 284,
     TK_ARG = 285,
     TK_RESULT = 286,
     TK_NCI_CALL = 287,
     TK_IDENT = 288,
     TK_STRINGC = 289,
     TK_INTC = 290,
     TK_NUMC = 291,
     TK_PREG = 292,
     TK_NREG = 293,
     TK_SREG = 294,
     TK_IREG = 295,
     TK_PARROT_OP = 296,
     TK_INT = 297,
     TK_NUM = 298,
     TK_PMC = 299,
     TK_STRING = 300,
     TK_IF = 301,
     TK_UNLESS = 302,
     TK_NULL = 303,
     TK_GOTO = 304,
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
     TK_FLAG_UNIQUE_REG = 346,
     TK_FLAG_NAMED = 347,
     TK_FLAG_SLURPY = 348,
     TK_FLAG_FLAT = 349,
     TK_FLAG_OPTIONAL = 350,
     TK_FLAG_OPT_FLAG = 351,
     TK_FLAG_INVOCANT = 352
   };
#endif
/* Tokens.  */
#define TK_LABEL 258
#define TK_NL 259
#define TK_HLL 260
#define TK_HLL_MAP 261
#define TK_N_OPERATORS 262
#define TK_PRAGMA 263
#define TK_LOADLIB 264
#define TK_SUB 265
#define TK_END 266
#define TK_PARAM 267
#define TK_LEX 268
#define TK_LOCAL 269
#define TK_NAMESPACE 270
#define TK_INVOCANT 271
#define TK_METH_CALL 272
#define TK_GLOBALCONST 273
#define TK_CONST 274
#define TK_RETURN 275
#define TK_YIELD 276
#define TK_BEGIN_YIELD 277
#define TK_END_YIELD 278
#define TK_BEGIN_RETURN 279
#define TK_END_RETURN 280
#define TK_BEGIN_CALL 281
#define TK_END_CALL 282
#define TK_GET_RESULTS 283
#define TK_CALL 284
#define TK_ARG 285
#define TK_RESULT 286
#define TK_NCI_CALL 287
#define TK_IDENT 288
#define TK_STRINGC 289
#define TK_INTC 290
#define TK_NUMC 291
#define TK_PREG 292
#define TK_NREG 293
#define TK_SREG 294
#define TK_IREG 295
#define TK_PARROT_OP 296
#define TK_INT 297
#define TK_NUM 298
#define TK_PMC 299
#define TK_STRING 300
#define TK_IF 301
#define TK_UNLESS 302
#define TK_NULL 303
#define TK_GOTO 304
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
#define TK_FLAG_UNIQUE_REG 346
#define TK_FLAG_NAMED 347
#define TK_FLAG_SLURPY 348
#define TK_FLAG_FLAT 349
#define TK_FLAG_OPTIONAL 350
#define TK_FLAG_OPT_FLAG 351
#define TK_FLAG_INVOCANT 352




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

Features are:

=over 4

=item * constant folding is implemented in the parser

=item *

=back



=cut

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "pirparser.h"
#include "pircompiler.h"
#include "pircompunit.h"
#include "pirsymbol.h"

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

/* the lexer contains a special temp. field for this purpose. */
#define STORE_NAMED_ALIAS(NAME)             do { lexer->temp_flag_arg1 = NAME; } while (0)

#define IF_NAMED_ARG_SET_ALIAS(OBJ,EXPR)    if (TEST_FLAG(EXPR, ARG_FLAG_NAMED)) {       \
                                              set_arg_named(OBJ, lexer->temp_flag_arg1); \
                                            }


#define IF_NAMED_PARAM_SET_ALIAS(OBJ,EXPR)  if (TEST_FLAG(EXPR, TARGET_FLAG_NAMED)) {      \
                                              set_param_named(OBJ, lexer->temp_flag_arg1); \
                                            }

/* some defines to prevent magic "1"s and "0"s in the code */
#define GLOBALCONST     1

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
#line 94 "pir.y"
{
    double              dval;
    int                 ival;
    char               *sval;
    struct constant    *constval;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;

    void               *fixme;
}
/* Line 187 of yacc.c.  */
#line 397 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 410 "pirparser.c"

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
#define YYLAST   482

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  116
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  120
/* YYNRULES -- Number of rules.  */
#define YYNRULES  289
/* YYNRULES -- Number of states.  */
#define YYNSTATES  433

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   353

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   107,     2,     2,     2,   112,   114,     2,
     102,   103,   111,   109,   104,   106,   105,   110,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   101,
       2,    98,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    99,     2,   100,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   113,     2,   108,     2,     2,     2,
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
      95,    96,    97,   115
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    30,    34,    37,    40,    45,    50,
      51,    53,    55,    59,    66,    69,    71,    73,    74,    77,
      79,    81,    83,    85,    87,    89,    91,    93,    95,    97,
     102,   105,   108,   110,   112,   114,   116,   117,   120,   126,
     127,   130,   131,   134,   137,   140,   142,   144,   146,   148,
     150,   152,   154,   156,   158,   160,   162,   164,   166,   168,
     171,   174,   177,   181,   185,   188,   192,   196,   201,   205,
     210,   215,   219,   223,   227,   231,   235,   239,   243,   247,
     251,   255,   258,   261,   263,   264,   266,   268,   272,   274,
     276,   278,   281,   285,   287,   291,   294,   300,   305,   310,
     315,   319,   323,   327,   331,   335,   337,   339,   341,   343,
     347,   352,   354,   358,   361,   362,   364,   370,   372,   374,
     376,   378,   387,   388,   390,   392,   395,   399,   403,   406,
     412,   413,   416,   417,   419,   421,   424,   428,   430,   433,
     437,   441,   443,   445,   447,   452,   455,   457,   459,   461,
     463,   465,   467,   469,   471,   475,   476,   478,   480,   484,
     487,   488,   491,   493,   495,   497,   499,   502,   503,   506,
     508,   510,   515,   517,   519,   521,   523,   527,   531,   535,
     539,   540,   542,   544,   548,   550,   552,   556,   559,   561,
     567,   573,   574,   576,   578,   581,   585,   586,   588,   590,
     593,   597,   598,   601,   603,   606,   607,   609,   613,   616,
     618,   620,   623,   626,   631,   636,   641,   646,   648,   650,
     652,   654,   656,   658,   660,   662,   664,   666,   668,   670,
     672,   674,   676,   678,   680,   682,   684,   686,   688,   690,
     692,   694,   696,   698,   700,   702,   704,   706,   708,   710,
     712,   714,   716,   718,   720,   722,   724,   726,   728,   730,
     732,   734,   736,   738,   740,   742,   744,   746,   748,   750,
     752,   754,   756,   758,   760,   762,   764,   766,   768,   770
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     117,     0,    -1,   118,   119,   118,    -1,    -1,     4,    -1,
     120,    -1,   119,     4,   120,    -1,   128,    -1,   223,    -1,
     125,    -1,   123,    -1,   124,    -1,   122,    -1,   121,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,    -1,
       6,    34,    98,    34,    -1,    15,    99,   126,   100,    -1,
      -1,   127,    -1,    34,    -1,   127,   101,    34,    -1,   129,
     131,     4,   135,   137,    11,    -1,    10,   130,    -1,   232,
      -1,    34,    -1,    -1,   131,   132,    -1,    82,    -1,    79,
      -1,    80,    -1,    81,    -1,    83,    -1,    86,    -1,    88,
      -1,    89,    -1,    87,    -1,   133,    -1,    84,   102,   130,
     103,    -1,    85,   219,    -1,    90,   220,    -1,   232,    -1,
      34,    -1,   156,    -1,   229,    -1,    -1,   135,   136,    -1,
      12,   229,   232,   195,     4,    -1,    -1,   137,   138,    -1,
      -1,   139,   140,    -1,     3,     4,    -1,     3,   141,    -1,
     141,    -1,   158,    -1,   163,    -1,   164,    -1,   168,    -1,
     221,    -1,   198,    -1,   199,    -1,   170,    -1,   146,    -1,
     149,    -1,   145,    -1,   143,    -1,   142,    -1,     1,     4,
      -1,   144,     4,    -1,    48,   230,    -1,   230,    98,    48,
      -1,    28,   189,     4,    -1,   147,     4,    -1,   230,    98,
     226,    -1,   230,   235,   226,    -1,   230,    98,   233,   226,
      -1,   230,    98,   148,    -1,   230,   156,    98,   226,    -1,
     230,    98,   230,   156,    -1,   230,    98,   150,    -1,   230,
     234,   226,    -1,    35,   234,   230,    -1,    36,   234,   230,
      -1,    34,    64,   230,    -1,    34,    64,    34,    -1,    35,
     234,    35,    -1,    36,   234,    36,    -1,    35,   234,    36,
      -1,    36,   234,    35,    -1,   150,     4,    -1,   151,   152,
      -1,    41,    -1,    -1,   153,    -1,   154,    -1,   153,   104,
     154,    -1,   226,    -1,   156,    -1,   155,    -1,   230,   156,
      -1,    99,   157,   100,    -1,   226,    -1,   157,   101,   226,
      -1,   159,     4,    -1,   161,    48,   226,    49,   232,    -1,
     161,   230,   162,   232,    -1,   161,   227,   162,   232,    -1,
     161,   160,    49,   232,    -1,   230,   228,   226,    -1,    35,
     228,   230,    -1,    36,   228,   230,    -1,    35,   228,    35,
      -1,    36,   228,    36,    -1,    46,    -1,    47,    -1,    49,
      -1,   104,    -1,    49,   232,     4,    -1,    14,   229,   165,
       4,    -1,   166,    -1,   165,   104,   166,    -1,   232,   167,
      -1,    -1,    91,    -1,    13,    34,   104,   169,     4,    -1,
     230,    -1,    41,    -1,   171,    -1,   180,    -1,    26,     4,
     172,   175,     4,   177,    27,     4,    -1,    -1,   173,    -1,
     174,    -1,   173,   174,    -1,    30,   207,     4,    -1,    29,
     187,   176,    -1,    32,   187,    -1,    16,   187,     4,    17,
     186,    -1,    -1,   104,   187,    -1,    -1,   178,    -1,   179,
      -1,   178,   179,    -1,    31,   192,     4,    -1,   164,    -1,
     181,     4,    -1,   189,    98,   182,    -1,   230,    98,   182,
      -1,   182,    -1,   184,    -1,   183,    -1,   187,   105,   186,
     202,    -1,   185,   202,    -1,   187,    -1,    34,    -1,   187,
      -1,   188,    -1,   232,    -1,    37,    -1,    34,    -1,    39,
      -1,   102,   190,   103,    -1,    -1,   191,    -1,   192,    -1,
     191,   104,   192,    -1,   230,   193,    -1,    -1,   193,   194,
      -1,    95,    -1,    96,    -1,    93,    -1,    91,    -1,    92,
     219,    -1,    -1,   195,   196,    -1,   194,    -1,   197,    -1,
      97,   102,   134,   103,    -1,   200,    -1,   209,    -1,   201,
      -1,   210,    -1,    20,   202,     4,    -1,    20,   182,     4,
      -1,    21,   202,     4,    -1,   102,   203,   103,    -1,    -1,
     204,    -1,   205,    -1,   204,   104,   205,    -1,   207,    -1,
     206,    -1,    34,    50,   208,    -1,   208,   217,    -1,   226,
      -1,    24,     4,   214,    25,     4,    -1,    22,     4,   211,
      23,     4,    -1,    -1,   212,    -1,   213,    -1,   212,   213,
      -1,    21,   207,     4,    -1,    -1,   215,    -1,   216,    -1,
     215,   216,    -1,    20,   207,     4,    -1,    -1,   217,   218,
      -1,    94,    -1,    92,   219,    -1,    -1,   220,    -1,   102,
      34,   103,    -1,   222,     4,    -1,   223,    -1,   224,    -1,
      19,   225,    -1,    18,   225,    -1,    42,   232,    98,    35,
      -1,    43,   232,    98,    36,    -1,    44,   232,    98,    34,
      -1,    45,   232,    98,    34,    -1,   230,    -1,   227,    -1,
      34,    -1,    35,    -1,    36,    -1,    51,    -1,    52,    -1,
      53,    -1,    54,    -1,    56,    -1,    55,    -1,    42,    -1,
      43,    -1,    44,    -1,    45,    -1,   231,    -1,    33,    -1,
      37,    -1,    38,    -1,    40,    -1,    39,    -1,    33,    -1,
      41,    -1,   106,    -1,   107,    -1,   108,    -1,   109,    -1,
     106,    -1,   110,    -1,   111,    -1,   112,    -1,   113,    -1,
     114,    -1,   108,    -1,   115,    -1,    64,    -1,    57,    -1,
      58,    -1,    59,    -1,    61,    -1,    62,    -1,    60,    -1,
      63,    -1,    52,    -1,    54,    -1,    53,    -1,    56,    -1,
      55,    -1,    51,    -1,    68,    -1,    69,    -1,    70,    -1,
      71,    -1,    72,    -1,    73,    -1,    76,    -1,    74,    -1,
      75,    -1,    77,    -1,    78,    -1,    66,    -1,    67,    -1,
      65,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   347,   347,   352,   353,   356,   357,   360,   361,   362,
     363,   364,   365,   366,   369,   373,   379,   383,   390,   394,
     395,   399,   401,   408,   414,   418,   419,   423,   424,   428,
     430,   432,   434,   436,   438,   440,   442,   444,   446,   449,
     453,   457,   463,   464,   465,   466,   469,   470,   473,   484,
     485,   488,   488,   492,   494,   496,   499,   500,   501,   502,
     503,   504,   505,   506,   507,   508,   509,   510,   511,   514,
     523,   526,   530,   536,   542,   545,   549,   553,   557,   559,
     563,   567,   586,   590,   596,   602,   607,   612,   617,   621,
     625,   632,   635,   638,   642,   643,   646,   648,   652,   653,
     654,   657,   661,   665,   667,   671,   674,   678,   682,   694,
     697,   698,   699,   700,   701,   704,   705,   708,   709,   712,
     718,   722,   724,   728,   732,   733,   736,   751,   753,   760,
     761,   764,   777,   778,   782,   784,   788,   792,   794,   796,
     802,   803,   810,   811,   815,   817,   821,   823,   827,   831,
     833,   835,   840,   841,   844,   851,   857,   859,   863,   864,
     867,   881,   885,   887,   892,   897,   898,   902,   904,   908,
     917,   918,   922,   924,   926,   928,   930,   937,   938,   942,
     943,   946,   953,   954,   957,   958,   961,   965,   969,   975,
     980,   981,   994,   996,  1000,  1001,  1004,  1010,  1017,  1021,
    1029,  1038,  1039,  1044,  1046,  1051,  1056,  1057,  1061,  1063,
    1067,  1073,  1074,  1078,  1080,  1087,  1088,  1092,  1096,  1099,
    1100,  1103,  1107,  1111,  1113,  1115,  1117,  1126,  1127,  1130,
    1131,  1132,  1135,  1136,  1137,  1138,  1139,  1140,  1143,  1144,
    1145,  1146,  1149,  1150,  1159,  1160,  1161,  1162,  1165,  1166,
    1169,  1170,  1171,  1174,  1175,  1176,  1177,  1178,  1179,  1180,
    1181,  1182,  1183,  1184,  1185,  1186,  1187,  1188,  1189,  1190,
    1191,  1192,  1193,  1194,  1195,  1196,  1200,  1201,  1202,  1203,
    1204,  1205,  1206,  1207,  1208,  1209,  1210,  1211,  1212,  1213
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"label\"", "\"\\n\"", "\".HLL\"",
  "\".HLL_map\"", "\"n_operators\"", "\".pragma\"", "\".loadlib\"",
  "\".sub\"", "\".end\"", "\".param\"", "\".lex\"", "\".local\"",
  "\".namespace\"", "\".invocant\"", "\".meth_call\"", "\".globalconst\"",
  "\".const\"", "\".return\"", "\".yield\"", "\".begin_yield\"",
  "\".end_yield\"", "\".begin_return\"", "\".end_return\"",
  "\".begin_call\"", "\".end_call\"", "\".get_results\"", "\".call\"",
  "\".arg\"", "\".result\"", "\".nci_call\"", "\"identifier\"",
  "\"string constant\"", "\"integer constant\"", "\"number constant\"",
  "\"PMC register\"", "\"number register\"", "\"string register\"",
  "\"integer register\"", "\"parrot instruction\"", "\"int\"", "\"num\"",
  "\"pmc\"", "\"string\"", "\"if\"", "\"unless\"", "\"null\"", "\"goto\"",
  "\"=>\"", "\"!=\"", "\"==\"", "\"<\"", "\"<=\"", "\">\"", "\">=\"",
  "\">>>\"", "\">>\"", "\"<<\"", "\"//\"", "\"||\"", "\"&&\"", "\"~~\"",
  "\".\"", "\">>>=\"", "\">>=\"", "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"",
  "\"%=\"", "\"**=\"", "\"/=\"", "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"",
  "\".=\"", "\":init\"", "\":load\"", "\":main\"", "\":anon\"",
  "\":method\"", "\":outer\"", "\":vtable\"", "\":lex\"", "\":multi\"",
  "\":postcomp\"", "\":immediate\"", "\":lexid\"", "\":unique_reg\"",
  "\":named\"", "\":slurpy\"", "\":flat\"", "\":optional\"",
  "\":opt_flag\"", "\":invocant\"", "'='", "'['", "']'", "';'", "'('",
  "')'", "','", "'.'", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'",
  "'|'", "'&'", "\"**\"", "$accept", "TOP", "opt_nl", "pir_chunks",
  "pir_chunk", "pir_pragma", "loadlib", "hll_specifier", "hll_mapping",
  "namespace_decl", "opt_namespace_id", "namespace_id", "sub_def",
  "sub_head", "sub_id", "sub_flags", "sub_flag", "sub_flag_with_arg",
  "multi_type", "parameters", "parameter", "instructions", "instruction",
  "@1", "instr", "statement", "error_stat", "null_stat", "null_instr",
  "getresults_stat", "assignment_stat", "assignment", "binary_expr",
  "parrot_stat", "parrot_instruction", "parrot_op", "opt_op_args",
  "op_args", "op_arg", "keyaccess", "keylist", "keys", "conditional_stat",
  "conditional_instr", "condition", "if_unless", "then", "goto_stat",
  "local_decl", "local_id_list", "local_id", "has_unique_reg", "lex_decl",
  "lex_target", "invocation_stat", "long_invocation_stat",
  "opt_long_arguments", "long_arguments", "long_argument",
  "long_invocation", "opt_ret_cont", "opt_long_results", "long_results",
  "long_result", "short_invocation_stat", "short_invocation",
  "simple_invocation", "methodcall", "subcall", "sub", "method",
  "invokable", "string_object", "opt_target_list", "opt_list",
  "target_list", "result_target", "target_flags", "target_flag",
  "param_flags", "param_flag", "invocant_param", "return_stat",
  "yield_stat", "short_return_stat", "short_yield_stat", "arguments",
  "opt_arguments_list", "arguments_list", "argument", "named_arg",
  "short_arg", "arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "expression", "constant", "rel_op", "type", "target",
  "reg", "identifier", "unop", "binop", "augmented_op", 0
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
     345,   346,   347,   348,   349,   350,   351,   352,    61,    91,
      93,    59,    40,    41,    44,    46,    45,    33,   126,    43,
      47,    42,    37,   124,    38,   353
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   116,   117,   118,   118,   119,   119,   120,   120,   120,
     120,   120,   120,   120,   121,   122,   123,   124,   125,   126,
     126,   127,   127,   128,   129,   130,   130,   131,   131,   132,
     132,   132,   132,   132,   132,   132,   132,   132,   132,   133,
     133,   133,   134,   134,   134,   134,   135,   135,   136,   137,
     137,   139,   138,   140,   140,   140,   141,   141,   141,   141,
     141,   141,   141,   141,   141,   141,   141,   141,   141,   142,
     143,   144,   144,   145,   146,   147,   147,   147,   147,   147,
     147,   147,   148,   148,   148,   148,   148,   148,   148,   148,
     148,   149,   150,   151,   152,   152,   153,   153,   154,   154,
     154,   155,   156,   157,   157,   158,   159,   159,   159,   159,
     160,   160,   160,   160,   160,   161,   161,   162,   162,   163,
     164,   165,   165,   166,   167,   167,   168,   169,   169,   170,
     170,   171,   172,   172,   173,   173,   174,   175,   175,   175,
     176,   176,   177,   177,   178,   178,   179,   179,   180,   181,
     181,   181,   182,   182,   183,   184,   185,   185,   186,   186,
     187,   187,   188,   188,   189,   190,   190,   191,   191,   192,
     193,   193,   194,   194,   194,   194,   194,   195,   195,   196,
     196,   197,   198,   198,   199,   199,   200,   200,   201,   202,
     203,   203,   204,   204,   205,   205,   206,   207,   208,   209,
     210,   211,   211,   212,   212,   213,   214,   214,   215,   215,
     216,   217,   217,   218,   218,   219,   219,   220,   221,   222,
     222,   223,   224,   225,   225,   225,   225,   226,   226,   227,
     227,   227,   228,   228,   228,   228,   228,   228,   229,   229,
     229,   229,   230,   230,   231,   231,   231,   231,   232,   232,
     233,   233,   233,   234,   234,   234,   234,   234,   234,   234,
     234,   234,   234,   234,   234,   234,   234,   234,   234,   234,
     234,   234,   234,   234,   234,   234,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     3,     2,     2,     4,     4,     0,
       1,     1,     3,     6,     2,     1,     1,     0,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       2,     2,     1,     1,     1,     1,     0,     2,     5,     0,
       2,     0,     2,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       2,     2,     3,     3,     2,     3,     3,     4,     3,     4,
       4,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     2,     2,     1,     0,     1,     1,     3,     1,     1,
       1,     2,     3,     1,     3,     2,     5,     4,     4,     4,
       3,     3,     3,     3,     3,     1,     1,     1,     1,     3,
       4,     1,     3,     2,     0,     1,     5,     1,     1,     1,
       1,     8,     0,     1,     1,     2,     3,     3,     2,     5,
       0,     2,     0,     1,     1,     2,     3,     1,     2,     3,
       3,     1,     1,     1,     4,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     3,     0,     1,     1,     3,     2,
       0,     2,     1,     1,     1,     1,     2,     0,     2,     1,
       1,     4,     1,     1,     1,     1,     3,     3,     3,     3,
       0,     1,     1,     3,     1,     1,     3,     2,     1,     5,
       5,     0,     1,     1,     2,     3,     0,     1,     1,     2,
       3,     0,     2,     1,     2,     0,     1,     3,     2,     1,
       1,     2,     2,     4,     4,     4,     4,     1,     1,     1,
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
       0,     0,     3,     5,    13,    12,    10,    11,     9,     7,
      27,     8,    16,     0,     0,    15,   248,    26,   249,    24,
      25,    19,     0,     0,     0,     0,   221,     4,     2,     0,
       0,    14,    21,     0,    20,     0,     0,     0,     0,     6,
      46,    30,    31,    32,    29,    33,     0,   215,    34,    37,
      35,    36,     0,    28,    38,    17,    18,     0,     0,     0,
       0,     0,    49,     0,     0,    40,   216,    41,    22,   223,
     224,   225,   226,     0,    47,    51,     0,     0,   238,   239,
     240,   241,     0,    23,    50,     0,    39,   217,   177,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     243,   157,   244,   245,   247,   246,    93,   115,   116,     0,
       0,   165,    52,    55,    68,    67,     0,    66,    64,     0,
      65,     0,    94,    56,     0,     0,    57,    58,    59,    63,
     129,   130,     0,   151,   153,   152,     0,   156,     0,    61,
      62,   182,   184,   183,   185,    60,     0,   219,   220,     0,
     242,   160,     0,    69,    53,    54,     0,     0,   222,   161,
     190,     0,     0,     0,   201,   206,   132,     0,   243,   244,
      71,     0,     0,   166,   167,   170,    70,    74,    91,   229,
     230,   231,     0,    92,    95,    96,   100,    99,    98,   228,
     227,   105,   230,   231,     0,     0,     0,     0,   148,   155,
       0,     0,   218,   289,   287,   288,   276,   277,   278,   279,
     280,   281,   283,   284,   282,   285,   286,     0,     0,     0,
      48,   175,   215,   174,   172,   173,     0,   179,   178,   180,
       0,     0,   121,   124,   229,     0,   191,   192,   195,   194,
     211,   198,   227,   187,   186,   188,     0,     0,   202,   203,
       0,     0,   207,   208,     0,     0,   133,   134,    73,   119,
     164,     0,   169,     0,   103,     0,   101,   232,   233,   234,
     235,   237,   236,     0,     0,     0,     0,   117,   118,     0,
       0,     0,   162,   163,     0,   158,   159,   149,   157,   230,
     231,    72,   250,   251,   252,    78,    81,   150,    75,   227,
       0,     0,    76,   176,     0,   128,     0,   127,   120,     0,
     125,   123,     0,   189,     0,   197,     0,     0,   204,     0,
       0,   209,     0,     0,     0,     0,     0,   135,   168,   171,
     102,     0,    97,   113,   111,   114,   112,     0,   109,   108,
     107,   110,   154,     0,   275,   270,   272,   271,   274,   273,
     263,   264,   265,   268,   266,   267,   269,   262,   254,   260,
     253,   255,   256,   257,   258,   259,   261,     0,     0,    80,
       0,    77,    79,    43,     0,    44,    45,    42,   126,   122,
     196,   193,   215,   213,   212,   205,   200,   210,   199,   136,
       0,   140,   138,   142,   104,   106,    86,    85,    87,    89,
      83,    90,    88,    84,    82,   181,   214,     0,     0,   137,
       0,   147,     0,   143,   144,     0,   141,     0,     0,   145,
     139,   146,   131
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      43,    44,    19,    20,    29,    39,    63,    64,   384,    72,
      84,    85,    94,    95,   122,   123,   124,   125,   126,   127,
     128,   129,   305,   130,   131,   132,   193,   194,   195,   196,
     197,   273,   133,   134,   205,   135,   289,   136,   137,   241,
     242,   321,   138,   316,   139,   140,   265,   266,   267,   336,
     419,   422,   423,   424,   141,   142,   143,   144,   145,   146,
     294,   147,   296,   148,   182,   183,   184,   272,   237,   162,
     238,   239,   149,   150,   151,   152,   172,   245,   246,   247,
     248,   249,   250,   153,   154,   257,   258,   259,   261,   262,
     263,   325,   394,    75,    76,   155,   156,    21,   158,    36,
     251,   199,   283,    92,   252,   160,   161,   310,   377,   229
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -393
static const yytype_int16 yypact[] =
{
      10,  -393,    44,   112,  -393,    29,    42,    82,    59,    13,
      -3,    65,   109,  -393,  -393,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,    21,    79,  -393,  -393,  -393,  -393,  -393,
    -393,    89,    54,    54,    54,    54,  -393,   112,  -393,    88,
      94,  -393,  -393,    30,    33,    38,    48,    67,    86,  -393,
    -393,  -393,  -393,  -393,  -393,  -393,    53,    61,  -393,  -393,
    -393,  -393,    61,  -393,  -393,  -393,  -393,   152,   153,   165,
     169,   179,   217,    13,   196,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,    99,  -393,   248,   159,   160,  -393,  -393,
    -393,  -393,    54,  -393,  -393,   186,  -393,  -393,  -393,   256,
     278,   230,    99,    65,     1,   163,   263,   272,   274,   181,
      80,  -393,   113,  -393,  -393,  -393,   126,  -393,  -393,   409,
      54,   409,  -393,  -393,  -393,  -393,   280,  -393,  -393,   283,
    -393,   285,   -18,  -393,   286,   218,  -393,  -393,  -393,  -393,
    -393,  -393,   289,  -393,  -393,  -393,   163,   189,   197,  -393,
    -393,  -393,  -393,  -393,  -393,  -393,   297,  -393,  -393,   171,
    -393,  -393,     9,  -393,  -393,  -393,   199,    54,  -393,  -393,
     296,   303,   304,   305,   292,   294,   290,   317,  -393,  -393,
    -393,   318,   220,   233,  -393,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,   334,  -393,   271,  -393,  -393,  -393,  -393,  -393,
     277,  -393,   337,   337,   334,   328,   -19,    98,  -393,  -393,
      45,    57,  -393,  -393,  -393,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,  -393,  -393,  -393,  -393,    32,   306,   334,
    -393,  -393,    61,  -393,  -393,  -393,   276,  -393,  -393,  -393,
     157,     8,  -393,   314,   345,   316,   323,  -393,  -393,  -393,
    -393,  -393,  -393,  -393,  -393,  -393,   334,   383,   292,  -393,
     334,   382,   294,  -393,   334,    23,   290,  -393,  -393,  -393,
    -393,   409,   359,   121,  -393,   -18,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,   393,   235,   360,    54,  -393,  -393,    54,
      54,   334,  -393,  -393,   163,  -393,  -393,  -393,    24,   302,
     302,  -393,  -393,  -393,  -393,  -393,  -393,  -393,  -393,   288,
     334,   334,  -393,  -393,    16,  -393,   425,  -393,  -393,    54,
    -393,  -393,   334,  -393,   296,   -17,   432,   433,  -393,   439,
     440,  -393,   441,    96,    96,    96,   449,  -393,  -393,  -393,
    -393,   334,  -393,  -393,  -393,  -393,  -393,    54,  -393,  -393,
    -393,  -393,  -393,   401,  -393,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,  -393,  -393,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,  -393,  -393,  -393,  -393,   346,   385,  -393,
     334,  -393,  -393,  -393,   353,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,    61,  -393,  -393,  -393,  -393,  -393,  -393,  -393,
     453,   354,  -393,    22,  -393,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,  -393,  -393,  -393,  -393,   442,    96,  -393,
     409,  -393,   434,    22,  -393,    45,  -393,   456,   458,  -393,
    -393,  -393,  -393
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -393,  -393,   451,  -393,   427,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,  -393,   392,  -393,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,  -393,  -393,   366,  -393,  -393,  -393,  -393,
    -393,  -393,  -393,  -393,   240,  -393,  -393,  -393,   193,  -393,
    -152,  -393,  -393,  -393,  -393,  -393,   262,  -393,  -392,  -393,
     151,  -393,  -393,  -393,  -393,  -393,  -393,  -393,   205,  -393,
    -393,  -393,  -393,    49,  -393,  -393,   -95,  -393,  -393,  -393,
      50,  -209,  -393,   364,  -393,  -393,  -261,  -393,   202,  -393,
    -393,  -393,  -393,  -393,  -393,  -393,  -101,  -393,  -393,   154,
    -393,  -100,   155,  -393,  -393,  -393,  -393,   221,  -393,  -393,
     214,  -393,  -393,  -226,   418,  -393,  -393,   -44,  -393,   378,
    -130,   347,  -170,   -97,   -92,  -393,    -9,  -393,  -268,  -393
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -250
static const yytype_int16 yytable[] =
{
      30,   295,   198,   159,   173,   167,   313,   228,   159,   171,
     338,   421,   318,   230,     1,   178,   189,   190,   191,   179,
     113,   114,   115,    45,    46,    47,    48,   180,  -229,   185,
     287,   421,   378,   284,    26,   111,   102,   291,   169,   333,
     200,   380,    28,   207,     4,   209,    26,    27,   276,    26,
     383,   157,   334,   420,    28,   335,   157,    28,    88,    89,
      90,    91,   274,    22,    30,   110,   298,   299,   300,   112,
     113,   114,   115,   116,   285,   392,    23,   393,    26,   292,
     301,   192,   169,    98,   293,   288,    28,    26,   353,    24,
      26,   111,    50,    25,   169,    28,    31,   308,    28,   312,
     231,   232,   233,   170,   234,   235,   236,    32,    33,    34,
      35,   181,   319,    37,    41,   192,   297,     5,     6,    40,
       7,     8,     9,    42,   400,   401,   402,    10,    65,    26,
      66,    11,   307,   169,    67,   309,    68,    28,   302,   303,
     304,    88,    89,    90,    91,   198,    69,   287,   317,   277,
     278,   279,   280,   281,   282,    73,   326,   379,   243,   427,
     329,   351,   385,    74,   332,    70,   416,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,   185,
     381,   382,  -248,   200,    71,  -248,    78,    99,    79,   100,
     178,   344,   346,   352,   179,   113,   114,   115,   315,   101,
     102,    80,   288,    81,   103,    11,   104,   105,   106,   426,
     107,   404,   108,    82,   109,  -161,   295,   386,  -161,   110,
     111,   340,   341,   112,   113,   114,   115,   116,  -249,    83,
      87,  -249,   117,   118,   119,   120,   213,   214,   215,   216,
     217,   218,   219,   220,   221,   222,   223,   224,   225,   226,
     414,   178,   189,   202,   203,   179,   113,   114,   115,    93,
     163,   407,    96,    97,   166,   170,   204,   174,   178,   227,
     192,   345,   179,   113,   114,   115,   175,   348,   176,    99,
     349,   350,   164,   121,   186,   410,   413,   187,   121,   188,
     201,   101,   102,   208,   210,   211,   103,    11,   104,   105,
     106,   212,   107,   240,   108,   387,   109,   253,   254,   255,
     243,   110,   111,   256,   260,   112,   113,   114,   115,   116,
     264,   268,   269,   270,   117,   118,   119,   120,   185,   178,
     244,   190,   191,   179,   113,   114,   115,   271,   405,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   354,   355,   356,   357,   358,   359,   360,
     361,   362,   363,   364,   365,   366,   367,   178,   189,   190,
     191,   179,   113,   114,   115,   275,   192,   286,   314,   178,
     121,   408,   409,   179,   113,   114,   115,   192,   277,   278,
     279,   280,   281,   282,   368,   322,   369,   370,   371,   372,
     373,   374,   375,   376,   311,   320,   327,   330,   368,   347,
     369,   370,   371,   372,   373,   374,   375,   376,   178,   323,
     411,   412,   179,   113,   114,   115,   178,   324,   343,   388,
     179,   113,   114,   115,   178,   406,   395,   396,   179,   113,
     114,   115,   178,   397,   398,   399,   179,   113,   114,   115,
     231,   232,   233,   403,   234,   235,   415,   417,   418,   425,
     431,   428,   432,    38,    49,    86,   165,   306,   342,   290,
     389,   337,   429,   177,   339,   430,   331,   390,   391,   328,
      77,   168,   206
};

static const yytype_uint16 yycheck[] =
{
       9,   210,   132,    95,   105,   102,   232,   159,   100,   104,
     271,   403,     4,     4,     4,    33,    34,    35,    36,    37,
      38,    39,    40,    32,    33,    34,    35,   119,     4,   121,
      49,   423,   300,   203,    33,    34,    14,   207,    37,    16,
     132,   309,    41,   135,     0,   146,    33,    34,   200,    33,
      34,    95,    29,    31,    41,    32,   100,    41,    42,    43,
      44,    45,   192,    34,    73,    33,    34,    35,    36,    37,
      38,    39,    40,    41,   204,    92,    34,    94,    33,    34,
      48,    99,    37,    92,    39,   104,    41,    33,    64,     7,
      33,    34,     4,    34,    37,    41,    99,   227,    41,   229,
      91,    92,    93,   102,    95,    96,    97,    42,    43,    44,
      45,   120,   104,     4,    35,    99,   211,     5,     6,    98,
       8,     9,    10,    34,   333,   334,   335,    15,    34,    33,
     100,    19,   227,    37,   101,   227,    98,    41,   106,   107,
     108,    42,    43,    44,    45,   275,    98,    49,   240,    51,
      52,    53,    54,    55,    56,   102,   256,   309,   167,   420,
     260,   291,   314,   102,   264,    98,   392,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,   271,
     310,   311,   102,   275,    98,   105,    34,     1,    35,     3,
      33,   283,   284,   294,    37,    38,    39,    40,    41,    13,
      14,    36,   104,    34,    18,    19,    20,    21,    22,   418,
      24,   341,    26,    34,    28,   102,   425,   314,   105,    33,
      34,   100,   101,    37,    38,    39,    40,    41,   102,    12,
      34,   105,    46,    47,    48,    49,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
     380,    33,    34,    35,    36,    37,    38,    39,    40,    11,
       4,   353,   103,   103,    34,   102,    48,     4,    33,    98,
      99,    36,    37,    38,    39,    40,     4,   286,     4,     1,
     289,   290,     4,   102,     4,   377,   378,     4,   102,     4,
       4,    13,    14,     4,   105,    98,    18,    19,    20,    21,
      22,     4,    24,   104,    26,   314,    28,     4,     4,     4,
     319,    33,    34,    21,    20,    37,    38,    39,    40,    41,
      30,     4,     4,   103,    46,    47,    48,    49,   420,    33,
      34,    35,    36,    37,    38,    39,    40,   104,   347,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    33,    34,    35,
      36,    37,    38,    39,    40,   104,    99,    49,   102,    33,
     102,    35,    36,    37,    38,    39,    40,    99,    51,    52,
      53,    54,    55,    56,   106,    50,   108,   109,   110,   111,
     112,   113,   114,   115,    98,    91,    23,    25,   106,    49,
     108,   109,   110,   111,   112,   113,   114,   115,    33,   103,
      35,    36,    37,    38,    39,    40,    33,   104,    35,     4,
      37,    38,    39,    40,    33,    34,     4,     4,    37,    38,
      39,    40,    33,     4,     4,     4,    37,    38,    39,    40,
      91,    92,    93,     4,    95,    96,   103,     4,   104,    17,
       4,    27,     4,    12,    37,    73,   100,   227,   275,   207,
     319,   266,   423,   109,   272,   425,   262,   322,   324,   258,
      62,   103,   135
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   117,   118,     0,     5,     6,     8,     9,    10,
      15,    19,   119,   120,   121,   122,   123,   124,   125,   128,
     129,   223,    34,    34,     7,    34,    33,    34,    41,   130,
     232,    99,    42,    43,    44,    45,   225,     4,   118,   131,
      98,    35,    34,   126,   127,   232,   232,   232,   232,   120,
       4,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,   132,   133,    34,   100,   101,    98,    98,
      98,    98,   135,   102,   102,   219,   220,   220,    34,    35,
      36,    34,    34,    12,   136,   137,   130,    34,    42,    43,
      44,    45,   229,    11,   138,   139,   103,   103,   232,     1,
       3,    13,    14,    18,    20,    21,    22,    24,    26,    28,
      33,    34,    37,    38,    39,    40,    41,    46,    47,    48,
      49,   102,   140,   141,   142,   143,   144,   145,   146,   147,
     149,   150,   151,   158,   159,   161,   163,   164,   168,   170,
     171,   180,   181,   182,   183,   184,   185,   187,   189,   198,
     199,   200,   201,   209,   210,   221,   222,   223,   224,   230,
     231,   232,   195,     4,     4,   141,    34,   229,   225,    37,
     102,   182,   202,   202,     4,     4,     4,   189,    33,    37,
     230,   232,   190,   191,   192,   230,     4,     4,     4,    34,
      35,    36,    99,   152,   153,   154,   155,   156,   226,   227,
     230,     4,    35,    36,    48,   160,   227,   230,     4,   202,
     105,    98,     4,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    98,   156,   235,
       4,    91,    92,    93,    95,    96,    97,   194,   196,   197,
     104,   165,   166,   232,    34,   203,   204,   205,   206,   207,
     208,   226,   230,     4,     4,     4,    21,   211,   212,   213,
      20,   214,   215,   216,    30,   172,   173,   174,     4,     4,
     103,   104,   193,   157,   226,   104,   156,    51,    52,    53,
      54,    55,    56,   228,   228,   226,    49,    49,   104,   162,
     162,   228,    34,    39,   186,   187,   188,   182,    34,    35,
      36,    48,   106,   107,   108,   148,   150,   182,   226,   230,
     233,    98,   226,   219,   102,    41,   169,   230,     4,   104,
      91,   167,    50,   103,   104,   217,   207,    23,   213,   207,
      25,   216,   207,    16,    29,    32,   175,   174,   192,   194,
     100,   101,   154,    35,   230,    36,   230,    49,   232,   232,
     232,   226,   202,    64,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,   106,   108,
     109,   110,   111,   112,   113,   114,   115,   234,   234,   156,
     234,   226,   226,    34,   134,   156,   229,   232,     4,   166,
     208,   205,    92,    94,   218,     4,     4,     4,     4,     4,
     187,   187,   187,     4,   226,   232,    34,   230,    35,    36,
     230,    35,    36,   230,   226,   103,   219,     4,   104,   176,
      31,   164,   177,   178,   179,    17,   187,   192,    27,   179,
     186,     4,     4
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
        case 14:
#line 370 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 374 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 380 "pir.y"
    { set_hll((yyvsp[(2) - (2)].sval)); ;}
    break;

  case 17:
#line 384 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 394 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 396 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].fixme); ;}
    break;

  case 21:
#line 400 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 22:
#line 402 "pir.y"
    { ;}
    break;

  case 24:
#line 415 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 27:
#line 423 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 28:
#line 425 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 29:
#line 429 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 30:
#line 431 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 31:
#line 433 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 32:
#line 435 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 33:
#line 437 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 34:
#line 439 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 35:
#line 441 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 36:
#line 443 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 37:
#line 445 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 39:
#line 450 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;
                           set_sub_outer(lexer, (yyvsp[(3) - (4)].sval));
                         ;}
    break;

  case 40:
#line 454 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE;
                           set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 41:
#line 458 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEXID;
                           set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 48:
#line 474 "pir.y"
    {
                           declare_local(lexer, (yyvsp[(2) - (5)].ival), new_local((yyvsp[(3) - (5)].sval), 0));
                         ;}
    break;

  case 51:
#line 488 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 53:
#line 493 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 54:
#line 495 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 69:
#line 515 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 71:
#line 527 "pir.y"
    { set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (2)].targ)));
                         ;}
    break;

  case 72:
#line 531 "pir.y"
    { set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ)));
                         ;}
    break;

  case 73:
#line 537 "pir.y"
    { set_instr(lexer, "get_results");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                         ;}
    break;

  case 75:
#line 546 "pir.y"
    { set_instr(lexer, "set");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 76:
#line 550 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 77:
#line 554 "pir.y"
    { set_instr(lexer, (yyvsp[(3) - (4)].sval));
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)), (yyvsp[(4) - (4)].expr));
                         ;}
    break;

  case 78:
#line 558 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 79:
#line 560 "pir.y"
    { set_instr(lexer, "set");
                           /* XXX fix key stuff */
                         ;}
    break;

  case 80:
#line 564 "pir.y"
    { set_instr(lexer, "set");
                           /* XXX fix key stuff */
                         ;}
    break;

  case 81:
#line 568 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 82:
#line 587 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 83:
#line 591 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                           add_operands(lexer, 2, expr_from_const(new_const(INT_TYPE, NULL, (yyvsp[(1) - (3)].ival))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 84:
#line 597 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                           add_operands(lexer, 2, expr_from_const(new_const(NUM_TYPE, NULL, (yyvsp[(1) - (3)].dval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 85:
#line 603 "pir.y"
    { set_instr(lexer, "concat");
                           add_operands(lexer, 2, expr_from_const(new_const(STRING_TYPE, NULL, (yyvsp[(1) - (3)].sval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 86:
#line 608 "pir.y"
    {
                           set_instr(lexer, "set");
                           /* concatenate strings and add result as operand */
                         ;}
    break;

  case 87:
#line 613 "pir.y"
    { set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(new_const(INT_TYPE, NULL, (yyvsp[(1) - (3)].ival) + (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 88:
#line 618 "pir.y"
    {
                          set_instr(lexer, "set");
                         ;}
    break;

  case 89:
#line 622 "pir.y"
    {
                          set_instr(lexer, "set");
                         ;}
    break;

  case 90:
#line 626 "pir.y"
    {
                          set_instr(lexer, "set");
                         ;}
    break;

  case 93:
#line 639 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 96:
#line 647 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 97:
#line 649 "pir.y"
    { push_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 101:
#line 658 "pir.y"
    { (yyval.expr) = NULL; ;}
    break;

  case 102:
#line 662 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 103:
#line 666 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 104:
#line 668 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 106:
#line 675 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null");
                           add_operands(lexer, 2, (yyvsp[(3) - (5)].expr), expr_from_ident((yyvsp[(5) - (5)].sval)));
                         ;}
    break;

  case 107:
#line 679 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)), expr_from_ident((yyvsp[(4) - (4)].sval)));
                         ;}
    break;

  case 108:
#line 683 "pir.y"
    {
                            /* do an unconditional jump if $2 is true/false */
                         ;}
    break;

  case 115:
#line 704 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 116:
#line 705 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 119:
#line 713 "pir.y"
    { set_instr(lexer, "branch");
                           push_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 120:
#line 719 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 121:
#line 723 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 122:
#line 725 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 123:
#line 729 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 124:
#line 732 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 125:
#line 733 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 126:
#line 737 "pir.y"
    { /* check whether the target was declared, and if its type is PMC */
                           if ((yyvsp[(4) - (5)].targ) != NULL) {
                               if ((yyvsp[(4) - (5)].targ)->type == PMC_TYPE)
                                   set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                               else
                                   yyerror(yyscanner, lexer,
                                           "2nd argument to .lex must be of type PMC");
                           }
                           else {
                                yyerror(yyscanner, lexer, "target for .lex was not declared");
                           }
                         ;}
    break;

  case 127:
#line 752 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 128:
#line 754 "pir.y"
    { (yyval.targ) = find_target(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 131:
#line 769 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                             (yyval.fixme) = NULL;
                           ;}
    break;

  case 132:
#line 777 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 133:
#line 779 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 134:
#line 783 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 135:
#line 785 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 136:
#line 789 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 137:
#line 793 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 138:
#line 795 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 139:
#line 798 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 140:
#line 802 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 141:
#line 804 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 142:
#line 810 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 143:
#line 812 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 144:
#line 816 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 145:
#line 818 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 146:
#line 822 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 147:
#line 824 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 149:
#line 832 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 150:
#line 834 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 151:
#line 836 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 154:
#line 845 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 155:
#line 852 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 156:
#line 858 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 157:
#line 860 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 160:
#line 868 "pir.y"
    { symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                              /* if the symbol was found, its type must be a PMC;
                               * else, if the symbol was not found, it's a global identifier
                               * referring to some other sub. We don't check that during
                               * the parsing phase.
                               */
                              if (sym && sym->type != PMC_TYPE) {
                                  yyerror(yyscanner, lexer,
                                          "invokable identifier must be of type PMC!");
                              }

                              (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval));
                            ;}
    break;

  case 161:
#line 882 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 162:
#line 886 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 163:
#line 888 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 164:
#line 893 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 165:
#line 897 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 166:
#line 899 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 167:
#line 903 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 168:
#line 905 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 169:
#line 909 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 170:
#line 917 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 171:
#line 919 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 172:
#line 923 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 173:
#line 925 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 174:
#line 927 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 175:
#line 929 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 176:
#line 931 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 177:
#line 937 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 178:
#line 939 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 181:
#line 947 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 186:
#line 962 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 187:
#line 966 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 188:
#line 970 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 189:
#line 976 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 190:
#line 980 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 191:
#line 982 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 192:
#line 995 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 193:
#line 997 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 196:
#line 1005 "pir.y"
    { (yyval.argm) = (yyvsp[(3) - (3)].argm);
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 197:
#line 1011 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (2)].argm);
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 198:
#line 1018 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 199:
#line 1024 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 200:
#line 1032 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 201:
#line 1038 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 202:
#line 1040 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 203:
#line 1045 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 204:
#line 1047 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 205:
#line 1052 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 206:
#line 1056 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 207:
#line 1058 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 208:
#line 1062 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 209:
#line 1064 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 210:
#line 1068 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 211:
#line 1073 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 212:
#line 1075 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 213:
#line 1079 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 214:
#line 1081 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 215:
#line 1087 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 216:
#line 1089 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 217:
#line 1093 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 221:
#line 1104 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 222:
#line 1108 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), GLOBALCONST); ;}
    break;

  case 223:
#line 1112 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 224:
#line 1114 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 225:
#line 1116 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 226:
#line 1118 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 227:
#line 1126 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 228:
#line 1127 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 229:
#line 1130 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 230:
#line 1131 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 231:
#line 1132 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 232:
#line 1135 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 233:
#line 1136 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 234:
#line 1137 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 235:
#line 1138 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 236:
#line 1139 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 237:
#line 1140 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 238:
#line 1143 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 239:
#line 1144 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 240:
#line 1145 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 241:
#line 1146 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 242:
#line 1149 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 243:
#line 1150 "pir.y"
    { /* find the symbol; if it's not there, emit an error */
                               symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                               if (sym == NULL)
                                   yyerror(yyscanner, lexer, "symbol not declared!");
                               else
                                   (yyval.targ) = new_target(sym->type, (yyvsp[(1) - (1)].sval));
                             ;}
    break;

  case 244:
#line 1159 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 245:
#line 1160 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 246:
#line 1161 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 247:
#line 1162 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 250:
#line 1169 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 251:
#line 1170 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 252:
#line 1171 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 253:
#line 1174 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 254:
#line 1175 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 255:
#line 1176 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 256:
#line 1177 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 257:
#line 1178 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 258:
#line 1179 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 259:
#line 1180 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 260:
#line 1181 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 261:
#line 1182 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 262:
#line 1183 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 263:
#line 1184 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 264:
#line 1185 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 265:
#line 1186 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 266:
#line 1187 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 267:
#line 1188 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 268:
#line 1189 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 269:
#line 1190 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 270:
#line 1191 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 271:
#line 1192 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 272:
#line 1193 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 273:
#line 1194 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 274:
#line 1195 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 275:
#line 1196 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 276:
#line 1200 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 277:
#line 1201 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 278:
#line 1202 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 279:
#line 1203 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 280:
#line 1204 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 281:
#line 1205 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 282:
#line 1206 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 283:
#line 1207 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 284:
#line 1208 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 285:
#line 1209 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 286:
#line 1210 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 287:
#line 1211 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 288:
#line 1212 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 289:
#line 1213 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3274 "pirparser.c"
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


#line 1215 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


