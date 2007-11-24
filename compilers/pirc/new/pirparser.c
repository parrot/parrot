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

    struct constant *constval;
}
/* Line 187 of yacc.c.  */
#line 386 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 399 "pirparser.c"

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
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  108
/* YYNRULES -- Number of rules.  */
#define YYNRULES  269
/* YYNRULES -- Number of states.  */
#define YYNSTATES  421

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
     245,   248,   249,   251,   253,   257,   259,   261,   263,   265,
     267,   269,   271,   273,   275,   277,   279,   281,   283,   285,
     287,   289,   291,   293,   295,   297,   299,   301,   303,   305,
     307,   309,   311,   313,   315,   317,   319,   321,   323,   325,
     327,   329,   331,   333,   335,   337,   339,   343,   345,   349,
     351,   353,   355,   361,   369,   375,   377,   379,   382,   385,
     387,   389,   393,   398,   400,   404,   407,   408,   410,   416,
     418,   420,   429,   430,   433,   437,   441,   444,   450,   451,
     454,   455,   458,   463,   465,   472,   475,   478,   481,   483,
     484,   486,   488,   492,   493,   497,   498,   501,   503,   505,
     507,   509,   512,   517,   519,   521,   523,   525,   527,   529,
     531,   533,   535,   537,   543,   545,   547,   551,   555,   559,
     563,   564,   566,   568,   572,   574,   576,   580,   581,   585,
     591,   592,   595,   599,   600,   603,   607,   610,   611,   614,
     616,   619,   620,   624,   627,   630,   634,   639,   644,   649,
     654,   656,   658,   660,   662,   664,   666,   668,   670,   672,
     674,   676,   678,   680,   682,   684,   686,   688,   690,   692,
     694,   696,   698,   700,   702,   704,   706,   708,   710,   712
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     121,     0,    -1,   122,   123,   122,    -1,    -1,     4,    -1,
     124,    -1,   123,     4,   124,    -1,   136,    -1,   216,    -1,
     133,    -1,   129,    -1,   127,    -1,   128,    -1,   126,    -1,
     125,    -1,    10,     9,    37,    -1,    11,    36,    -1,     5,
      36,   102,    36,    -1,     6,    36,   102,    36,    -1,     7,
       4,   130,     8,    -1,    -1,   130,   131,    -1,     3,     4,
      -1,     3,   132,    -1,   132,    -1,    47,   155,     4,    -1,
      17,   134,    -1,    -1,   103,   135,   104,    -1,    36,    -1,
     135,   164,    36,    -1,    -1,    12,   138,   137,   139,     4,
     143,   146,    13,    -1,   227,    -1,    36,    -1,    -1,   139,
     140,    -1,    88,    -1,    85,    -1,    86,    -1,    87,    -1,
      89,    -1,    92,    -1,    94,    -1,    95,    -1,    93,   105,
     141,   106,    -1,    90,   105,   138,   106,    -1,    91,   215,
      -1,    -1,   141,   102,   142,    -1,   227,    -1,    36,    -1,
     161,    -1,   223,    -1,    -1,   143,   144,    -1,    14,   145,
     189,     4,    -1,   223,   227,    -1,   223,    36,    56,   227,
      -1,    -1,   146,   147,    -1,     3,     4,    -1,     3,   148,
      -1,   148,    -1,   165,    -1,   169,    -1,   170,    -1,   174,
      -1,   217,    -1,   195,    -1,   197,    -1,   175,    -1,   151,
      -1,   132,    -1,   150,    -1,   149,    -1,     1,     4,    -1,
      54,   224,     4,    -1,   224,   107,    54,     4,    -1,    30,
     105,   185,   106,     4,    -1,   224,   152,     4,    -1,   160,
     220,    -1,   161,   107,   220,    -1,   107,   153,    -1,   158,
     220,    -1,   220,    -1,   220,   159,   220,    -1,   224,   161,
      -1,   184,    -1,   154,    -1,    47,   156,    -1,    -1,   156,
      -1,   157,    -1,   156,   102,   157,    -1,   219,    -1,   108,
      -1,   109,    -1,   110,    -1,   111,    -1,   108,    -1,   112,
      -1,   113,    -1,   114,    -1,   115,    -1,   116,    -1,   110,
      -1,   117,    -1,    70,    -1,    63,    -1,    64,    -1,    65,
      -1,    67,    -1,    68,    -1,    66,    -1,    69,    -1,    58,
      -1,    60,    -1,    59,    -1,    62,    -1,    61,    -1,    57,
      -1,    74,    -1,    75,    -1,    76,    -1,    77,    -1,    78,
      -1,    79,    -1,    82,    -1,    80,    -1,    81,    -1,    83,
      -1,    84,    -1,    72,    -1,    73,    -1,    71,    -1,   103,
     162,   104,    -1,   163,    -1,   162,   164,   163,    -1,   220,
      -1,   118,    -1,   102,    -1,   166,   220,   168,   227,     4,
      -1,   166,   220,   222,   220,   168,   227,     4,    -1,   167,
     220,   168,   227,     4,    -1,    52,    -1,    53,    -1,    52,
      54,    -1,    53,    54,    -1,    55,    -1,   102,    -1,    55,
     227,     4,    -1,    16,   223,   171,     4,    -1,   172,    -1,
     171,   102,   172,    -1,   227,   173,    -1,    -1,    96,    -1,
      15,    36,   102,   224,     4,    -1,   176,    -1,   183,    -1,
      28,     4,   177,   179,     4,   181,    29,     4,    -1,    -1,
     177,   178,    -1,    32,   205,     4,    -1,    31,   192,   180,
      -1,    34,   192,    -1,    18,   192,     4,    19,   193,    -1,
      -1,   102,   192,    -1,    -1,   181,   182,    -1,    33,   224,
     189,     4,    -1,   170,    -1,   105,   185,   106,   107,   184,
       4,    -1,   184,     4,    -1,   192,   200,    -1,    36,   200,
      -1,   191,    -1,    -1,   186,    -1,   187,    -1,   186,   102,
     187,    -1,    -1,   224,   188,   189,    -1,    -1,   189,   190,
      -1,   100,    -1,   101,    -1,    98,    -1,    96,    -1,    97,
     215,    -1,   192,   119,   193,   200,    -1,   227,    -1,    43,
      -1,    39,    -1,   192,    -1,   194,    -1,    36,    -1,    45,
      -1,    41,    -1,   198,    -1,   196,    -1,    26,     4,   210,
      27,     4,    -1,   199,    -1,   207,    -1,    22,   200,     4,
      -1,    22,   184,     4,    -1,    23,   200,     4,    -1,   105,
     201,   106,    -1,    -1,   202,    -1,   203,    -1,   202,   102,
     203,    -1,   205,    -1,   204,    -1,    36,    56,   220,    -1,
      -1,   220,   206,   213,    -1,    24,     4,   208,    25,     4,
      -1,    -1,   208,   209,    -1,    23,   212,     4,    -1,    -1,
     210,   211,    -1,    22,   212,     4,    -1,   220,   213,    -1,
      -1,   213,   214,    -1,    99,    -1,    97,   215,    -1,    -1,
     105,    36,   106,    -1,    21,   218,    -1,   216,     4,    -1,
      20,   218,     4,    -1,    48,   227,   107,    37,    -1,    49,
     227,   107,    38,    -1,    50,   227,   107,    36,    -1,    51,
     227,   107,    36,    -1,   221,    -1,   226,    -1,   224,    -1,
     221,    -1,    36,    -1,    37,    -1,    38,    -1,    57,    -1,
      58,    -1,    59,    -1,    60,    -1,    62,    -1,    61,    -1,
      48,    -1,    49,    -1,    50,    -1,    51,    -1,   225,    -1,
     227,    -1,    43,    -1,    44,    -1,    46,    -1,    45,    -1,
     226,    -1,    39,    -1,    40,    -1,    42,    -1,    41,    -1,
      35,    -1,    47,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   239,   239,   244,   245,   248,   249,   252,   253,   254,
     255,   256,   257,   258,   259,   262,   265,   271,   274,   279,
     285,   286,   289,   290,   291,   294,   299,   302,   303,   306,
     307,   312,   312,   319,   320,   323,   324,   327,   328,   329,
     330,   331,   332,   333,   334,   335,   336,   337,   340,   341,
     344,   345,   346,   347,   350,   351,   354,   357,   358,   366,
     367,   371,   372,   373,   376,   377,   378,   379,   380,   381,
     382,   383,   384,   385,   386,   387,   388,   391,   392,   395,
     403,   406,   407,   408,   411,   412,   413,   414,   415,   417,
     430,   433,   434,   437,   438,   441,   444,   445,   446,   449,
     450,   451,   452,   453,   454,   455,   456,   457,   458,   459,
     460,   461,   462,   463,   464,   465,   466,   467,   468,   469,
     470,   471,   475,   476,   477,   478,   479,   480,   481,   482,
     483,   484,   485,   486,   487,   488,   491,   494,   495,   498,
     501,   502,   506,   508,   510,   514,   515,   519,   520,   523,
     524,   532,   536,   539,   540,   543,   547,   548,   553,   556,
     557,   560,   567,   568,   571,   574,   575,   576,   580,   581,
     584,   585,   588,   589,   592,   593,   597,   598,   599,   602,
     603,   606,   607,   610,   610,   614,   615,   618,   619,   620,
     621,   622,   627,   630,   631,   632,   635,   636,   639,   640,
     641,   644,   645,   648,   654,   655,   658,   659,   662,   665,
     668,   669,   672,   673,   676,   677,   680,   685,   685,   689,
     694,   695,   698,   701,   702,   705,   708,   711,   712,   715,
     716,   719,   720,   723,   726,   727,   730,   731,   732,   733,
     736,   737,   740,   741,   744,   745,   746,   749,   750,   751,
     752,   753,   754,   757,   758,   759,   760,   763,   764,   767,
     768,   769,   770,   771,   774,   775,   776,   777,   780,   781
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
  "assignment_statement", "assignment_tail", "assignment_expression",
  "parrot_instruction", "opt_parrot_op_args", "parrot_op_args",
  "parrot_op_arg", "unop", "binop", "augmented_op", "keylist", "keys",
  "key", "separator", "conditional_statement", "if_type", "if_null_type",
  "goto_or_comma", "goto_statement", "local_declaration", "local_id_list",
  "local_id", "has_unique_reg", "lex_declaration", "invocation_statement",
  "long_invocation_statement", "long_arguments", "long_argument",
  "long_invocation", "opt_return_continuation", "long_results",
  "long_result", "short_invocation_statement", "simple_invocation",
  "opt_target_list", "target_list", "result_target", "@2", "param_flags",
  "param_flag", "methodcall", "invokable", "method", "string_object",
  "return_statement", "long_return_statement", "yield_statement",
  "short_return_statement", "short_yield_statement", "arguments",
  "opt_arguments_list", "arguments_list", "argument", "named_arg",
  "short_arg", "@3", "long_yield_statement", "yield_expressions",
  "yield_expression", "return_expressions", "return_expression", "result",
  "arg_flags", "arg_flag", "opt_paren_string", "const_declaration",
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
     148,   148,   148,   148,   148,   148,   148,   149,   149,   150,
     151,   152,   152,   152,   153,   153,   153,   153,   153,   153,
     154,   155,   155,   156,   156,   157,   158,   158,   158,   159,
     159,   159,   159,   159,   159,   159,   159,   159,   159,   159,
     159,   159,   159,   159,   159,   159,   159,   159,   159,   159,
     159,   159,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   160,   160,   160,   160,   160,   161,   162,   162,   163,
     164,   164,   165,   165,   165,   166,   166,   167,   167,   168,
     168,   169,   170,   171,   171,   172,   173,   173,   174,   175,
     175,   176,   177,   177,   178,   179,   179,   179,   180,   180,
     181,   181,   182,   182,   183,   183,   184,   184,   184,   185,
     185,   186,   186,   188,   187,   189,   189,   190,   190,   190,
     190,   190,   191,   192,   192,   192,   193,   193,   194,   194,
     194,   195,   195,   196,   197,   197,   198,   198,   199,   200,
     201,   201,   202,   202,   203,   203,   204,   206,   205,   207,
     208,   208,   209,   210,   210,   211,   212,   213,   213,   214,
     214,   215,   215,   216,   217,   217,   218,   218,   218,   218,
     219,   219,   220,   220,   221,   221,   221,   222,   222,   222,
     222,   222,   222,   223,   223,   223,   223,   224,   224,   225,
     225,   225,   225,   225,   226,   226,   226,   226,   227,   227
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
       3,     2,     3,     2,     2,     1,     3,     2,     1,     1,
       2,     0,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     3,     1,     3,     1,
       1,     1,     5,     7,     5,     1,     1,     2,     2,     1,
       1,     3,     4,     1,     3,     2,     0,     1,     5,     1,
       1,     8,     0,     2,     3,     3,     2,     5,     0,     2,
       0,     2,     4,     1,     6,     2,     2,     2,     1,     0,
       1,     1,     3,     0,     3,     0,     2,     1,     1,     1,
       1,     2,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     5,     1,     1,     3,     3,     3,     3,
       0,     1,     1,     3,     1,     1,     3,     0,     3,     5,
       0,     2,     3,     0,     2,     3,     2,     0,     2,     1,
       2,     0,     3,     2,     2,     3,     4,     4,     4,     4,
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
       0,    27,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,   268,    34,
     269,    31,    33,     0,    26,     0,     0,     0,     0,   233,
       4,     2,     0,     0,     0,    15,    35,    29,     0,     0,
       0,     0,     0,     6,    17,    18,     0,    19,    91,    21,
      24,     0,   141,    28,   140,     0,     0,     0,     0,     0,
      22,    23,   244,   245,   246,   264,   265,   267,   266,     0,
      92,    93,    95,   240,   241,    54,    38,    39,    40,    37,
      41,     0,   231,    42,     0,    43,    44,    36,    30,   236,
     237,   238,   239,    25,     0,    59,     0,     0,    47,    48,
      94,     0,    55,     0,     0,     0,     0,   253,   254,   255,
     256,   185,     0,     0,     0,    32,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   264,   259,   260,   262,
     261,   269,   145,   146,     0,     0,   179,    73,    60,    63,
      75,    74,    72,    64,     0,     0,    65,    66,    67,    71,
     159,   160,     0,   178,     0,    69,   202,    70,   201,   204,
     205,     0,    68,     0,   257,   263,   258,    46,   232,     0,
      45,     0,     0,    57,    76,    61,    62,     0,     0,     0,
     195,   194,   210,     0,     0,   193,     0,   220,   223,   162,
     179,   177,   147,   148,   259,     0,   258,     0,     0,   180,
     181,   183,     0,   243,   242,     0,   175,     0,   176,   234,
     135,   133,   134,   122,   123,   124,   125,   126,   127,   129,
     130,   128,   131,   132,     0,     0,     0,     0,     0,    51,
      49,    52,    53,    50,    56,   190,   231,   189,   187,   188,
     186,     0,     0,     0,   153,   156,   235,   244,     0,   211,
     212,   215,   214,   217,   207,   206,   208,     0,     0,     0,
       0,    77,   151,     0,     0,   185,   149,   247,   248,   249,
     250,   252,   251,   150,     0,     0,     0,   198,   200,   199,
     196,     0,   197,     0,   137,   139,   244,   269,     0,    96,
      97,    98,    83,    89,     0,    88,    85,   242,    80,    81,
       0,   191,    58,     0,   152,     0,   157,   155,     0,   209,
       0,   227,     0,     0,   221,     0,     0,   224,     0,     0,
       0,     0,   163,     0,     0,     0,   182,   184,     0,     0,
       0,   192,   136,     0,    90,    78,    84,   121,   116,   118,
     117,   120,   119,   109,   110,   111,   114,   112,   113,   115,
     108,   100,   106,    99,   101,   102,   103,   104,   105,   107,
       0,    87,    82,   158,   154,   216,   213,   218,     0,   227,
     219,     0,   203,     0,   168,     0,   166,   170,    79,     0,
     142,     0,   144,   138,    86,   231,   229,   228,   222,   226,
     225,     0,     0,   165,   164,     0,   174,     0,   230,     0,
     169,     0,     0,   173,   171,   143,   167,   161,   185,     0,
     172
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      44,    59,   147,    20,    34,    48,    21,    46,    31,    61,
      97,   116,   240,   105,   112,   121,   113,   148,   149,   150,
     151,   152,   236,   302,   303,    79,    80,    81,   304,   370,
     237,   238,   293,   294,    65,   153,   154,   155,   284,   156,
     157,   253,   254,   317,   158,   159,   160,   269,   332,   333,
     403,   405,   414,   161,   162,   208,   209,   210,   275,   181,
     250,   163,   164,   291,   292,   165,   166,   167,   168,   169,
     201,   258,   259,   260,   261,   262,   321,   170,   267,   324,
     268,   327,   378,   377,   397,   108,    22,   172,    39,    82,
     263,   213,   285,   122,   214,   174,   175,   206
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -269
static const yytype_int16 yypact[] =
{
      11,  -269,    23,   296,  -269,    20,    39,    98,   104,    85,
      69,    36,   172,   137,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,    49,    50,  -269,   112,  -269,  -269,  -269,
    -269,  -269,  -269,   117,  -269,    60,    60,    60,    60,  -269,
     296,  -269,   122,   125,    86,  -269,  -269,  -269,   -80,    56,
      67,    70,    73,  -269,  -269,  -269,    10,  -269,   198,  -269,
    -269,   124,  -269,  -269,  -269,   130,   145,   146,   150,   151,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,   188,
      91,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,   119,   140,  -269,   149,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,   198,   241,    69,   220,  -269,  -269,
    -269,   261,  -269,    38,   155,   156,    40,  -269,  -269,  -269,
    -269,  -269,    75,   256,   243,  -269,   232,   261,   172,     1,
     165,   268,   271,   273,   175,   165,   -89,   -84,  -269,  -269,
    -269,   190,   227,   237,   344,    60,   344,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,   331,   331,  -269,  -269,  -269,  -269,
    -269,  -269,   288,  -269,   -74,  -269,  -269,  -269,  -269,  -269,
    -269,   290,  -269,   342,  -269,  -269,   -50,  -269,  -269,   154,
    -269,    29,   248,  -269,  -269,  -269,  -269,   197,    60,   310,
    -269,  -269,   392,   311,   312,  -269,   316,  -269,  -269,  -269,
     344,  -269,  -269,  -269,  -269,   318,  -269,   319,   218,   224,
    -269,  -269,   191,  -269,  -269,   -35,  -269,   405,  -269,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,   331,   292,   336,   331,   234,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,   140,  -269,  -269,  -269,
    -269,    60,   344,     7,  -269,   246,  -269,   287,   238,   245,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,    47,    25,   113,
     239,  -269,  -269,   242,   344,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,    60,   331,    60,  -269,  -269,  -269,
    -269,   165,  -269,    -3,  -269,  -269,   165,   198,   346,  -269,
    -269,  -269,  -269,  -269,   331,  -269,   295,   277,  -269,  -269,
     331,  -269,  -269,   347,  -269,    60,  -269,  -269,   331,  -269,
     392,  -269,   331,   378,  -269,   331,   389,  -269,   136,   136,
     331,   136,  -269,   390,   391,   129,  -269,    99,   393,   -35,
     394,  -269,  -269,   331,    91,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
     331,  -269,  -269,  -269,  -269,  -269,  -269,    35,   400,  -269,
    -269,   438,  -269,   439,   294,   443,  -269,  -269,  -269,   447,
    -269,    60,  -269,  -269,  -269,   140,  -269,  -269,  -269,    35,
    -269,   434,   136,  -269,  -269,    13,  -269,   450,  -269,   405,
    -269,   451,   344,  -269,  -269,  -269,  -269,  -269,  -269,    59,
    -269
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -269,  -269,   444,  -269,   416,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,    80,  -269,  -269,  -269,  -269,  -269,   352,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,  -269,  -269,   335,  -269,
    -269,  -269,  -269,  -269,  -269,  -269,   163,   357,  -269,  -269,
    -269,  -169,  -269,   120,   169,  -269,  -269,  -269,  -202,  -269,
      61,  -269,   152,  -269,  -269,  -269,  -269,  -269,  -269,  -269,
    -269,  -269,  -269,  -269,  -127,   264,  -269,   194,  -269,  -268,
    -269,  -269,  -211,    62,  -269,  -269,  -269,  -269,  -269,  -269,
    -121,  -269,  -269,   153,  -269,   135,  -269,  -269,  -269,  -269,
    -269,  -269,   144,    93,  -269,  -241,   -48,  -269,   348,  -269,
    -137,   -55,  -269,  -108,  -112,  -269,   -54,   -10
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -196
static const yytype_int16 yytable[] =
{
      32,   173,   193,    83,    84,   311,   290,   337,   194,   196,
     241,   314,   173,   286,    70,     1,  -195,   212,   215,   188,
     276,  -194,    62,     4,    63,    49,    50,    51,    52,   127,
    -195,   192,   205,   244,   211,  -194,    28,   135,    64,   123,
     190,   124,   411,   218,   191,   217,   412,   325,    30,    83,
      84,   125,   326,   126,   127,  -193,    23,    58,   128,    12,
     129,   130,   131,   420,   132,   171,   133,   283,   134,  -193,
     322,   242,   323,    28,   135,    24,   171,   136,    76,    77,
      78,   137,   138,   139,   140,   141,    83,    84,   211,    56,
     142,   143,   144,   145,    57,    28,    32,   295,   306,    62,
     309,   342,    25,   176,    28,    29,   192,    30,   305,   315,
      28,   182,   183,    26,   176,    64,    30,   383,   384,   195,
     386,    27,    30,   307,    60,   245,   246,   247,    85,   248,
     249,   328,   395,    58,   396,   207,    71,   391,   371,    33,
     313,    40,   179,   146,   329,   330,   180,   331,   339,    45,
     419,    42,    43,    47,   408,   245,   246,   247,    54,   248,
     249,    55,   211,    66,    28,   135,    98,   346,   190,   243,
     341,    28,   191,   372,    67,   190,    30,    68,   255,   191,
      69,   375,    99,    30,   100,   379,   101,   102,   379,    28,
     239,   410,   103,   104,   -91,   245,   246,   247,   290,   248,
     249,    30,   117,   118,   119,   120,   295,   195,   389,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      35,    36,    37,    38,   106,   176,    72,    73,    74,    75,
      76,    77,    78,   394,    72,    73,    74,    75,    76,    77,
      78,   312,    83,    84,   123,   107,   276,   185,   277,   278,
     279,   280,   281,   282,   109,   111,   115,   234,   126,   127,
     184,   177,   178,   128,    12,   129,   130,   131,   187,   132,
     192,   133,   197,   134,   338,   198,   340,   199,    28,   135,
     200,   202,   136,    76,    77,    78,   137,   138,   139,   140,
     141,   203,   216,   283,   219,   142,   143,   144,   145,   252,
     418,     5,     6,     7,   251,   255,     8,     9,    10,   117,
     118,   119,   120,    11,   256,   264,   265,    12,   195,   195,
     266,   195,   271,   272,   273,   195,   274,    28,   296,    73,
      74,   136,    76,    77,    78,   137,   138,   139,   140,   297,
     308,   310,   316,   318,   319,   334,   298,   320,   146,   335,
     345,   373,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,    28,    72,    73,    74,
      75,    76,    77,    78,   204,   138,   139,   140,    30,    28,
     234,   407,   380,    75,    76,    77,    78,   204,   138,   139,
     140,    30,   195,   382,   387,   388,   402,   390,   392,   195,
     299,   300,   301,   361,   398,   362,   363,   364,   365,   366,
     367,   368,   369,   220,   221,   222,   223,   224,   225,   226,
     227,   228,   229,   230,   231,   232,   233,    28,   257,    73,
      74,    75,    76,    77,    78,   204,   138,   139,   140,    30,
      28,   287,   400,   401,   190,   234,   288,   404,   191,   235,
     289,   406,    30,   409,   415,   417,    53,    41,   114,   186,
     344,   110,   343,   393,   270,   385,   413,   374,   336,   381,
       0,   416,   399,   376,     0,     0,   189
};

static const yytype_int16 yycheck[] =
{
      10,   113,   129,    58,    58,   246,   217,   275,   129,   130,
     179,     4,   124,   215,     4,     4,   105,   154,   155,   127,
      55,   105,   102,     0,   104,    35,    36,    37,    38,    16,
     119,   105,   144,     4,   146,   119,    35,    36,   118,     1,
      39,     3,    29,   164,    43,   119,    33,    22,    47,   104,
     104,    13,    27,    15,    16,   105,    36,    47,    20,    21,
      22,    23,    24,     4,    26,   113,    28,   102,    30,   119,
      23,   179,    25,    35,    36,    36,   124,    39,    40,    41,
      42,    43,    44,    45,    46,    47,   141,   141,   200,     3,
      52,    53,    54,    55,     8,    35,   106,   234,   235,   102,
     237,   104,     4,   113,    35,    36,   105,    47,   235,   102,
      35,    36,   122,     9,   124,   118,    47,   328,   329,   129,
     331,    36,    47,   235,    44,    96,    97,    98,     4,   100,
     101,    18,    97,    47,    99,   145,    56,   339,   307,   103,
     252,     4,   102,   105,    31,    32,   106,    34,   285,    37,
     418,   102,   102,    36,   395,    96,    97,    98,    36,   100,
     101,    36,   274,   107,    35,    36,    36,   304,    39,   179,
     291,    35,    43,   310,   107,    39,    47,   107,   188,    43,
     107,   318,    37,    47,    38,   322,    36,    36,   325,    35,
      36,   402,     4,   102,     4,    96,    97,    98,   409,   100,
     101,    47,    48,    49,    50,    51,   343,   217,   335,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      48,    49,    50,    51,   105,   235,    36,    37,    38,    39,
      40,    41,    42,   370,    36,    37,    38,    39,    40,    41,
      42,   251,   297,   297,     1,   105,    55,     4,    57,    58,
      59,    60,    61,    62,   105,    14,    36,   103,    15,    16,
       4,   106,   106,    20,    21,    22,    23,    24,    36,    26,
     105,    28,     4,    30,   284,     4,   286,     4,    35,    36,
     105,    54,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    54,     4,   102,     4,    52,    53,    54,    55,   102,
     412,     5,     6,     7,    56,   315,    10,    11,    12,    48,
      49,    50,    51,    17,     4,     4,     4,    21,   328,   329,
       4,   331,     4,     4,   106,   335,   102,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
       4,   107,    96,    56,   106,   106,    54,   102,   105,   107,
       4,     4,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    35,
     103,   391,     4,    39,    40,    41,    42,    43,    44,    45,
      46,    47,   402,     4,     4,     4,   102,     4,     4,   409,
     108,   109,   110,   108,     4,   110,   111,   112,   113,   114,
     115,   116,   117,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    83,    84,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      35,    36,     4,     4,    39,   103,    41,     4,    43,   107,
      45,     4,    47,    19,     4,     4,    40,    13,   106,   124,
     297,   104,   293,   343,   200,   330,   405,   315,   274,   325,
      -1,   409,   379,   320,    -1,    -1,   128
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     7,    10,    11,
      12,    17,    21,   123,   124,   125,   126,   127,   128,   129,
     133,   136,   216,    36,    36,     4,     9,    36,    35,    36,
      47,   138,   227,   103,   134,    48,    49,    50,    51,   218,
       4,   122,   102,   102,   130,    37,   137,    36,   135,   227,
     227,   227,   227,   124,    36,    36,     3,     8,    47,   131,
     132,   139,   102,   104,   118,   164,   107,   107,   107,   107,
       4,   132,    36,    37,    38,    39,    40,    41,    42,   155,
     156,   157,   219,   221,   226,     4,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,   140,    36,    37,
      38,    36,    36,     4,   102,   143,   105,   105,   215,   105,
     157,    14,   144,   146,   138,    36,   141,    48,    49,    50,
      51,   145,   223,     1,     3,    13,    15,    16,    20,    22,
      23,    24,    26,    28,    30,    36,    39,    43,    44,    45,
      46,    47,    52,    53,    54,    55,   105,   132,   147,   148,
     149,   150,   151,   165,   166,   167,   169,   170,   174,   175,
     176,   183,   184,   191,   192,   195,   196,   197,   198,   199,
     207,   216,   217,   224,   225,   226,   227,   106,   106,   102,
     106,   189,    36,   227,     4,     4,   148,    36,   223,   218,
      39,    43,   105,   184,   200,   227,   200,     4,     4,     4,
     105,   200,    54,    54,    43,   224,   227,   227,   185,   186,
     187,   224,   220,   221,   224,   220,     4,   119,   200,     4,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,   103,   107,   152,   160,   161,    36,
     142,   161,   223,   227,     4,    96,    97,    98,   100,   101,
     190,    56,   102,   171,   172,   227,     4,    36,   201,   202,
     203,   204,   205,   220,     4,     4,     4,   208,   210,   177,
     185,     4,     4,   106,   102,   188,    55,    57,    58,    59,
      60,    61,    62,   102,   168,   222,   168,    36,    41,    45,
     192,   193,   194,   162,   163,   220,    36,    47,    54,   108,
     109,   110,   153,   154,   158,   184,   220,   224,     4,   220,
     107,   215,   227,   224,     4,   102,    96,   173,    56,   106,
     102,   206,    23,    25,   209,    22,    27,   211,    18,    31,
      32,    34,   178,   179,   106,   107,   187,   189,   227,   220,
     227,   200,   104,   164,   156,     4,   220,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,   108,   110,   111,   112,   113,   114,   115,   116,   117,
     159,   161,   220,     4,   172,   220,   203,   213,   212,   220,
       4,   212,     4,   192,   192,   205,   192,     4,     4,   184,
       4,   168,     4,   163,   220,    97,    99,   214,     4,   213,
       4,     4,   102,   180,     4,   181,     4,   227,   215,    19,
     192,    29,    33,   170,   182,     4,   193,     4,   224,   189,
       4
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
#line 266 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 31:
#line 312 "pir.y"
    { new_sub(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 37:
#line 327 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON); ;}
    break;

  case 38:
#line 328 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 39:
#line 329 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 40:
#line 330 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 41:
#line 331 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 42:
#line 332 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 43:
#line 333 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 44:
#line 334 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 45:
#line 335 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 46:
#line 336 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 47:
#line 337 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 57:
#line 357 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 58:
#line 358 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval));   /* add a new parameter */
                                              set_param_named(lexer, (yyvsp[(2) - (4)].sval)); /* set the :named flag on it */
                                            ;}
    break;

  case 61:
#line 371 "pir.y"
    { add_instr(lexer, (yyvsp[(1) - (2)].sval), NULL); ;}
    break;

  case 62:
#line 372 "pir.y"
    { add_instr(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval));   ;}
    break;

  case 63:
#line 373 "pir.y"
    { add_instr(lexer, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 64:
#line 376 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 65:
#line 377 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 66:
#line 378 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 67:
#line 379 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 68:
#line 380 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 69:
#line 381 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 70:
#line 382 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 71:
#line 383 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 72:
#line 384 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 73:
#line 385 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 74:
#line 386 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 75:
#line 387 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 76:
#line 388 "pir.y"
    { yyerrok; ;}
    break;

  case 77:
#line 391 "pir.y"
    { new_instr(lexer, "null", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 78:
#line 392 "pir.y"
    { new_instr(lexer, "null", (yyvsp[(1) - (4)].sval)); ;}
    break;

  case 96:
#line 444 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 97:
#line 445 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 98:
#line 446 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 99:
#line 449 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 100:
#line 450 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 101:
#line 451 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 102:
#line 452 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 103:
#line 453 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 104:
#line 454 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 105:
#line 455 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 106:
#line 456 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 107:
#line 457 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 108:
#line 458 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 109:
#line 459 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 110:
#line 460 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 111:
#line 461 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 112:
#line 462 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 113:
#line 463 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 114:
#line 464 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 115:
#line 465 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 116:
#line 466 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 117:
#line 467 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 118:
#line 468 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 119:
#line 469 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 120:
#line 470 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 121:
#line 471 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 122:
#line 475 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 123:
#line 476 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 124:
#line 477 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 125:
#line 478 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 126:
#line 479 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 127:
#line 480 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 128:
#line 481 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 129:
#line 482 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 130:
#line 483 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 131:
#line 484 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 132:
#line 485 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 133:
#line 486 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 134:
#line 487 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 135:
#line 488 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 142:
#line 507 "pir.y"
    { new_instr(lexer, (yyvsp[(1) - (5)].sval), (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 143:
#line 509 "pir.y"
    { new_instr(lexer, (yyvsp[(3) - (7)].sval), (yyvsp[(1) - (7)].sval), (yyvsp[(2) - (7)].sval), (yyvsp[(4) - (7)].sval), (yyvsp[(6) - (7)].sval)); ;}
    break;

  case 144:
#line 511 "pir.y"
    { new_instr(lexer, (yyvsp[(1) - (5)].sval), (yyvsp[(2) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 145:
#line 514 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 146:
#line 515 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 147:
#line 519 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 148:
#line 520 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 151:
#line 533 "pir.y"
    { new_instr(lexer, "branch", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 155:
#line 544 "pir.y"
    { declare_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 156:
#line 547 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 157:
#line 548 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 159:
#line 556 "pir.y"
    { new_invocation(lexer); ;}
    break;

  case 160:
#line 557 "pir.y"
    { new_invocation(lexer); ;}
    break;

  case 183:
#line 610 "pir.y"
    { add_target(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 187:
#line 618 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_OPTIONAL); ;}
    break;

  case 188:
#line 619 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_OPT_FLAG); ;}
    break;

  case 189:
#line 620 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_SLURPY); ;}
    break;

  case 190:
#line 621 "pir.y"
    { set_param_flag(lexer, PARAM_FLAG_UNIQUE_REG); ;}
    break;

  case 191:
#line 622 "pir.y"
    { set_param_named(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 193:
#line 630 "pir.y"
    { ;}
    break;

  case 194:
#line 631 "pir.y"
    { ;}
    break;

  case 195:
#line 632 "pir.y"
    { ;}
    break;

  case 216:
#line 680 "pir.y"
    { add_arg(lexer, (yyvsp[(3) - (3)].sval));
                                             set_arg_named(lexer, (yyvsp[(1) - (3)].sval));
                                           ;}
    break;

  case 217:
#line 685 "pir.y"
    { add_arg(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 229:
#line 715 "pir.y"
    { set_arg_flag(lexer, ARG_FLAG_FLAT); ;}
    break;

  case 230:
#line 716 "pir.y"
    { set_arg_named(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 231:
#line 719 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 232:
#line 720 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 233:
#line 723 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), 0);  ;}
    break;

  case 235:
#line 727 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), 1);  ;}
    break;

  case 236:
#line 730 "pir.y"
    { (yyval.constval) = new_iconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 237:
#line 731 "pir.y"
    { (yyval.constval) = new_nconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 238:
#line 732 "pir.y"
    { (yyval.constval) = new_pconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 239:
#line 733 "pir.y"
    { (yyval.constval) = new_sconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 247:
#line 749 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 248:
#line 750 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 249:
#line 751 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 250:
#line 752 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 251:
#line 753 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 252:
#line 754 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 253:
#line 757 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 254:
#line 758 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 255:
#line 759 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 256:
#line 760 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2665 "pirparser.c"
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


#line 785 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


