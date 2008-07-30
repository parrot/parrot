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
     TK_SYM_PREG = 292,
     TK_SYM_NREG = 293,
     TK_SYM_SREG = 294,
     TK_SYM_IREG = 295,
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
#define TK_SYM_PREG 292
#define TK_SYM_NREG 293
#define TK_SYM_SREG 294
#define TK_SYM_IREG 295
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


TODO:

 * rename TK_SYM_?REG to TK_?REG (as there's no longer PASM registers)
 * use a flex-generated line counter in the lexer instead of custom
   code (this is in pir.l).

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
#define STORE_NAMED_ALIAS(NAME)             lexer->temp_flag_arg1 = NAME

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
#line 89 "pir.y"
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
#line 392 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 405 "pirparser.c"

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
#define YYLAST   419

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  116
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  115
/* YYNRULES -- Number of rules.  */
#define YYNRULES  272
/* YYNRULES -- Number of states.  */
#define YYNSTATES  408

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
      51,    53,    55,    59,    60,    61,    71,    73,    75,    76,
      79,    81,    83,    85,    87,    89,    91,    93,    95,    97,
     102,   105,   108,   110,   112,   114,   116,   117,   120,   126,
     127,   128,   132,   135,   138,   140,   142,   144,   146,   148,
     150,   152,   154,   156,   158,   160,   162,   164,   166,   169,
     173,   178,   182,   185,   189,   192,   196,   199,   202,   204,
     208,   211,   213,   214,   218,   219,   221,   224,   226,   227,
     231,   233,   235,   239,   241,   245,   251,   257,   259,   261,
     264,   267,   269,   271,   273,   277,   281,   286,   288,   292,
     295,   296,   298,   304,   306,   308,   317,   318,   320,   322,
     325,   329,   333,   336,   342,   343,   346,   347,   349,   351,
     354,   358,   360,   365,   370,   373,   375,   377,   382,   385,
     387,   389,   391,   393,   395,   397,   399,   401,   405,   406,
     408,   410,   414,   417,   418,   421,   423,   425,   427,   429,
     432,   433,   436,   438,   440,   445,   447,   449,   451,   453,
     457,   461,   465,   469,   470,   472,   474,   478,   480,   482,
     486,   489,   495,   501,   502,   504,   506,   509,   513,   514,
     516,   518,   521,   525,   526,   529,   531,   534,   535,   537,
     541,   544,   547,   551,   556,   561,   566,   571,   573,   575,
     577,   579,   581,   583,   585,   587,   589,   591,   593,   595,
     597,   599,   601,   603,   605,   607,   609,   611,   613,   615,
     617,   619,   621,   623,   625,   627,   629,   631,   633,   635,
     637,   639,   641,   643,   645,   647,   649,   651,   653,   655,
     657,   659,   661,   663,   665,   667,   669,   671,   673,   675,
     677,   679,   681,   683,   685,   687,   689,   691,   693,   695,
     697,   699,   701
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     117,     0,    -1,   118,   119,   118,    -1,    -1,     4,    -1,
     120,    -1,   119,     4,   120,    -1,   128,    -1,   217,    -1,
     125,    -1,   123,    -1,   124,    -1,   122,    -1,   121,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,    -1,
       6,    34,    98,    34,    -1,    15,    99,   126,   100,    -1,
      -1,   127,    -1,    34,    -1,   127,   101,    34,    -1,    -1,
      -1,    10,   131,   129,   132,     4,   130,   135,   137,    11,
      -1,   227,    -1,    34,    -1,    -1,   132,   133,    -1,    82,
      -1,    79,    -1,    80,    -1,    81,    -1,    83,    -1,    86,
      -1,    88,    -1,    89,    -1,    87,    -1,    84,   102,   131,
     103,    -1,    85,   215,    -1,    90,   216,    -1,   227,    -1,
      34,    -1,   155,    -1,   224,    -1,    -1,   135,   136,    -1,
      12,   224,   227,   192,     4,    -1,    -1,    -1,   137,   138,
     139,    -1,     3,     4,    -1,     3,   140,    -1,   140,    -1,
     157,    -1,   162,    -1,   163,    -1,   167,    -1,   218,    -1,
     195,    -1,   196,    -1,   168,    -1,   145,    -1,   144,    -1,
     143,    -1,   142,    -1,   141,    -1,     1,     4,    -1,    48,
     225,     4,    -1,   225,    98,    48,     4,    -1,    28,   186,
       4,    -1,   148,     4,    -1,   225,   146,     4,    -1,   230,
     221,    -1,   155,    98,   221,    -1,    98,   147,    -1,   228,
     221,    -1,   220,    -1,   221,   229,   221,    -1,   225,   155,
      -1,   148,    -1,    -1,    41,   149,   150,    -1,    -1,   151,
      -1,   152,   153,    -1,   221,    -1,    -1,   153,   104,   154,
      -1,   221,    -1,   155,    -1,    99,   156,   100,    -1,   221,
      -1,   156,   101,   221,    -1,   158,   161,   160,   227,     4,
      -1,   159,   221,   160,   227,     4,    -1,    46,    -1,    47,
      -1,    46,    48,    -1,    47,    48,    -1,    49,    -1,   104,
      -1,   221,    -1,   221,   223,   221,    -1,    49,   227,     4,
      -1,    14,   224,   164,     4,    -1,   165,    -1,   164,   104,
     165,    -1,   227,   166,    -1,    -1,    91,    -1,    13,    34,
     104,   225,     4,    -1,   169,    -1,   178,    -1,    26,     4,
     170,   173,     4,   175,    27,     4,    -1,    -1,   171,    -1,
     172,    -1,   171,   172,    -1,    30,   204,     4,    -1,    29,
     184,   174,    -1,    32,   184,    -1,    16,   184,     4,    17,
     183,    -1,    -1,   104,   184,    -1,    -1,   176,    -1,   177,
      -1,   176,   177,    -1,    31,   189,     4,    -1,   163,    -1,
     186,    98,   179,     4,    -1,   225,    98,   179,     4,    -1,
     179,     4,    -1,   181,    -1,   180,    -1,   184,   105,   183,
     199,    -1,   182,   199,    -1,   184,    -1,    34,    -1,   184,
      -1,   185,    -1,   227,    -1,    37,    -1,    34,    -1,    39,
      -1,   102,   187,   103,    -1,    -1,   188,    -1,   189,    -1,
     188,   104,   189,    -1,   225,   190,    -1,    -1,   190,   191,
      -1,    95,    -1,    96,    -1,    93,    -1,    91,    -1,    92,
     215,    -1,    -1,   192,   193,    -1,   191,    -1,   194,    -1,
      97,   102,   134,   103,    -1,   197,    -1,   205,    -1,   198,
      -1,   206,    -1,    20,   199,     4,    -1,    20,   179,     4,
      -1,    21,   199,     4,    -1,   102,   200,   103,    -1,    -1,
     201,    -1,   202,    -1,   201,   104,   202,    -1,   204,    -1,
     203,    -1,    34,    50,   221,    -1,   221,   213,    -1,    24,
       4,   210,    25,     4,    -1,    22,     4,   207,    23,     4,
      -1,    -1,   208,    -1,   209,    -1,   208,   209,    -1,    21,
     204,     4,    -1,    -1,   211,    -1,   212,    -1,   211,   212,
      -1,    20,   204,     4,    -1,    -1,   213,   214,    -1,    94,
      -1,    92,   215,    -1,    -1,   216,    -1,   102,    34,   103,
      -1,    19,   219,    -1,   217,     4,    -1,    18,   219,     4,
      -1,    42,   227,    98,    35,    -1,    43,   227,    98,    36,
      -1,    44,   227,    98,    34,    -1,    45,   227,    98,    34,
      -1,   222,    -1,   226,    -1,    33,    -1,   225,    -1,   222,
      -1,    34,    -1,    35,    -1,    36,    -1,    51,    -1,    52,
      -1,    53,    -1,    54,    -1,    56,    -1,    55,    -1,    42,
      -1,    43,    -1,    44,    -1,    45,    -1,   226,    -1,   227,
      -1,    37,    -1,    38,    -1,    40,    -1,    39,    -1,    33,
      -1,    41,    -1,   106,    -1,   107,    -1,   108,    -1,   109,
      -1,   106,    -1,   110,    -1,   111,    -1,   112,    -1,   113,
      -1,   114,    -1,   108,    -1,   115,    -1,    64,    -1,    57,
      -1,    58,    -1,    59,    -1,    61,    -1,    62,    -1,    60,
      -1,    63,    -1,    52,    -1,    54,    -1,    53,    -1,    56,
      -1,    55,    -1,    51,    -1,    68,    -1,    69,    -1,    70,
      -1,    71,    -1,    72,    -1,    73,    -1,    76,    -1,    74,
      -1,    75,    -1,    77,    -1,    78,    -1,    66,    -1,    67,
      -1,    65,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   336,   336,   341,   342,   345,   346,   349,   350,   351,
     352,   353,   354,   355,   358,   362,   368,   372,   379,   383,
     384,   388,   390,   397,   398,   397,   404,   405,   409,   410,
     414,   416,   418,   420,   422,   424,   426,   428,   430,   432,
     434,   436,   441,   442,   443,   444,   447,   448,   451,   462,
     463,   463,   468,   470,   472,   475,   476,   477,   478,   479,
     480,   481,   482,   483,   484,   485,   486,   487,   490,   499,
     503,   509,   515,   518,   543,   545,   547,   551,   553,   555,
     557,   559,   564,   564,   568,   569,   572,   576,   582,   583,
     587,   588,   591,   595,   597,   601,   608,   615,   616,   620,
     622,   626,   627,   631,   635,   643,   649,   653,   655,   659,
     663,   664,   669,   676,   677,   680,   693,   694,   698,   700,
     704,   708,   710,   712,   718,   719,   726,   727,   731,   733,
     737,   739,   743,   745,   747,   752,   753,   756,   763,   769,
     771,   775,   776,   779,   781,   785,   787,   792,   797,   798,
     802,   804,   808,   817,   818,   822,   824,   826,   828,   830,
     837,   838,   842,   843,   846,   853,   854,   857,   858,   861,
     865,   869,   875,   880,   881,   885,   887,   891,   892,   895,
     901,   909,   917,   926,   927,   932,   934,   939,   944,   945,
     949,   951,   955,   961,   962,   966,   968,   975,   976,   980,
     984,   988,   989,   993,   995,   997,   999,  1009,  1010,  1011,
    1014,  1015,  1018,  1019,  1020,  1023,  1024,  1025,  1026,  1027,
    1028,  1031,  1032,  1033,  1034,  1037,  1038,  1041,  1042,  1043,
    1044,  1047,  1048,  1051,  1052,  1053,  1056,  1057,  1058,  1059,
    1060,  1061,  1062,  1063,  1064,  1065,  1066,  1067,  1068,  1069,
    1070,  1071,  1072,  1073,  1074,  1075,  1076,  1077,  1078,  1082,
    1083,  1084,  1085,  1086,  1087,  1088,  1089,  1090,  1091,  1092,
    1093,  1094,  1095
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
  "\":immediate\"", "\":lexid\"", "\":unique_reg\"", "\":named\"",
  "\":slurpy\"", "\":flat\"", "\":optional\"", "\":opt_flag\"",
  "\":invocant\"", "'='", "'['", "']'", "';'", "'('", "')'", "','", "'.'",
  "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"",
  "$accept", "TOP", "opt_nl", "pir_chunks", "pir_chunk", "pir_pragma",
  "loadlib", "hll_specifier", "hll_mapping", "namespace_decl",
  "opt_namespace_id", "namespace_id", "sub_def", "@1", "@2", "sub_id",
  "sub_flags", "sub_flag", "multi_type", "parameters", "parameter",
  "instructions", "@3", "instruction", "statement", "error_stat",
  "null_stat", "getresults_stat", "parrot_stat", "assignment_stat",
  "assign_tail", "assign_expr", "parrot_instruction", "@4",
  "opt_parrot_op_args", "parrot_op_args", "first_op_arg", "other_op_args",
  "other_op_arg", "keylist", "keys", "conditional_stat", "if_type",
  "if_null_type", "then", "condition", "goto_stat", "local_decl",
  "local_id_list", "local_id", "has_unique_reg", "lex_decl",
  "invocation_stat", "long_invocation_stat", "opt_long_arguments",
  "long_arguments", "long_argument", "long_invocation", "opt_ret_cont",
  "opt_long_results", "long_results", "long_result",
  "short_invocation_stat", "simple_invocation", "methodcall", "subcall",
  "sub", "method", "invokable", "string_object", "opt_target_list",
  "opt_list", "target_list", "result_target", "target_flags",
  "target_flag", "param_flags", "param_flag", "invocant_param",
  "return_stat", "yield_stat", "short_return_stat", "short_yield_stat",
  "arguments", "opt_arguments_list", "arguments_list", "argument",
  "named_arg", "short_arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl", "const_decl_stat", "const_tail", "expression1",
  "expression", "constant", "rel_op", "type", "target", "reg",
  "identifier", "unop", "binop", "augmented_op", 0
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
     126,   127,   127,   129,   130,   128,   131,   131,   132,   132,
     133,   133,   133,   133,   133,   133,   133,   133,   133,   133,
     133,   133,   134,   134,   134,   134,   135,   135,   136,   137,
     138,   137,   139,   139,   139,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   141,   142,
     142,   143,   144,   145,   146,   146,   146,   147,   147,   147,
     147,   147,   149,   148,   150,   150,   151,   152,   153,   153,
     154,   154,   155,   156,   156,   157,   157,   158,   158,   159,
     159,   160,   160,   161,   161,   162,   163,   164,   164,   165,
     166,   166,   167,   168,   168,   169,   170,   170,   171,   171,
     172,   173,   173,   173,   174,   174,   175,   175,   176,   176,
     177,   177,   178,   178,   178,   179,   179,   180,   181,   182,
     182,   183,   183,   184,   184,   185,   185,   186,   187,   187,
     188,   188,   189,   190,   190,   191,   191,   191,   191,   191,
     192,   192,   193,   193,   194,   195,   195,   196,   196,   197,
     197,   198,   199,   200,   200,   201,   201,   202,   202,   203,
     204,   205,   206,   207,   207,   208,   208,   209,   210,   210,
     211,   211,   212,   213,   213,   214,   214,   215,   215,   216,
     217,   218,   218,   219,   219,   219,   219,   220,   220,   220,
     221,   221,   222,   222,   222,   223,   223,   223,   223,   223,
     223,   224,   224,   224,   224,   225,   225,   226,   226,   226,
     226,   227,   227,   228,   228,   228,   229,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   229,
     229,   229,   229,   229,   229,   229,   229,   229,   229,   230,
     230,   230,   230,   230,   230,   230,   230,   230,   230,   230,
     230,   230,   230
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     3,     2,     2,     4,     4,     0,
       1,     1,     3,     0,     0,     9,     1,     1,     0,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       2,     2,     1,     1,     1,     1,     0,     2,     5,     0,
       0,     3,     2,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     2,     3,
       4,     3,     2,     3,     2,     3,     2,     2,     1,     3,
       2,     1,     0,     3,     0,     1,     2,     1,     0,     3,
       1,     1,     3,     1,     3,     5,     5,     1,     1,     2,
       2,     1,     1,     1,     3,     3,     4,     1,     3,     2,
       0,     1,     5,     1,     1,     8,     0,     1,     1,     2,
       3,     3,     2,     5,     0,     2,     0,     1,     1,     2,
       3,     1,     4,     4,     2,     1,     1,     4,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     0,     1,
       1,     3,     2,     0,     2,     1,     1,     1,     1,     2,
       0,     2,     1,     1,     4,     1,     1,     1,     1,     3,
       3,     3,     3,     0,     1,     1,     3,     1,     1,     3,
       2,     5,     5,     0,     1,     1,     2,     3,     0,     1,
       1,     2,     3,     0,     2,     1,     2,     0,     1,     3,
       2,     2,     3,     4,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     3,     5,    13,    12,    10,    11,     9,     7,
       8,    16,     0,     0,    15,   231,    27,   232,    23,    26,
      19,     0,     0,     0,     0,   200,     4,     2,     0,    14,
      28,    21,     0,    20,     0,     0,     0,     0,     6,    17,
       0,    18,     0,     0,     0,     0,     0,    24,    31,    32,
      33,    30,    34,     0,   197,    35,    38,    36,    37,     0,
      29,    22,   203,   204,   205,   206,    46,     0,     0,    40,
     198,    41,    49,     0,     0,     0,    47,    50,    39,   199,
     221,   222,   223,   224,     0,    25,     0,   160,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   140,
     227,   228,   230,   229,   232,    97,    98,     0,     0,   148,
      51,    54,    67,    66,    65,    64,    63,     0,    55,     0,
       0,    56,    57,    58,    62,   113,   114,     0,   136,   135,
       0,   139,     0,    60,    61,   165,   167,   166,   168,     0,
      59,     0,   225,   226,     0,    68,    52,    53,     0,     0,
       0,   144,   173,     0,     0,   143,     0,   183,   188,   116,
       0,    84,    99,   100,   227,     0,   226,     0,     0,   149,
     150,   153,    72,   212,   213,   214,     0,   103,   211,   210,
       0,   134,   138,     0,     0,   201,   272,   270,   271,   259,
     260,   261,   262,   263,   264,   266,   267,   265,   268,   269,
       0,     0,     0,     0,     0,    48,   158,   197,   157,   155,
     156,     0,   162,   161,   163,     0,     0,   107,   110,   202,
     212,     0,   174,   175,   178,   177,   193,   170,   169,   171,
       0,     0,   184,   185,     0,     0,   189,   190,     0,     0,
     117,   118,    71,    83,    85,    88,    87,    69,   105,   147,
       0,   152,   101,   102,     0,   215,   216,   217,   218,   220,
     219,     0,     0,   145,   146,     0,   141,   142,     0,   231,
     212,     0,   233,   234,   235,    76,    81,     0,    78,     0,
     211,   210,   225,     0,     0,    93,    73,     0,    74,   159,
       0,     0,   106,     0,   111,   109,     0,   172,     0,   180,
       0,     0,   186,     0,     0,   191,     0,     0,     0,     0,
       0,   119,    86,   151,   154,     0,   104,     0,   137,   132,
      70,   133,   258,   253,   255,   254,   257,   256,   246,   247,
     248,   251,   249,   250,   252,   245,   237,   243,   236,   238,
     239,   240,   241,   242,   244,     0,    80,    77,    92,     0,
      75,    43,     0,    44,    45,    42,   112,   108,   179,   176,
     197,   195,   194,   187,   182,   192,   181,   120,     0,   124,
     122,   126,     0,    95,    96,    79,    94,   164,   196,     0,
       0,   121,     0,   131,     0,   127,   128,    89,    91,    90,
       0,   125,     0,     0,   129,   123,   130,   115
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      42,    43,    19,    40,    76,    28,    50,    70,   362,    82,
      86,    87,    96,   120,   121,   122,   123,   124,   125,   126,
     212,   285,   127,   171,   253,   254,   255,   322,   397,   213,
     294,   128,   129,   130,   264,   186,   131,   132,   226,   227,
     305,   133,   134,   135,   249,   250,   251,   320,   391,   394,
     395,   396,   136,   137,   138,   139,   140,   275,   141,   277,
     142,   178,   179,   180,   261,   222,   154,   223,   224,   143,
     144,   145,   146,   164,   231,   232,   233,   234,   235,   147,
     148,   241,   242,   243,   245,   246,   247,   309,   372,    79,
      80,    20,   150,    35,   288,   236,   188,   271,    94,   189,
     152,   176,   293,   355,   214
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -363
static const yytype_int16 yypact[] =
{
      12,  -363,    20,   153,  -363,    17,    36,    29,    37,     8,
     -56,    13,    72,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,   -21,    48,  -363,  -363,  -363,  -363,  -363,  -363,
      55,   -24,   -24,   -24,   -24,  -363,   153,  -363,    63,  -363,
    -363,  -363,     3,    16,    25,    38,    39,    62,  -363,  -363,
     186,  -363,    84,   100,   120,   136,   148,  -363,  -363,  -363,
    -363,  -363,  -363,    81,    89,  -363,  -363,  -363,  -363,    89,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,     8,   152,  -363,
    -363,  -363,   180,    96,    97,   122,  -363,   192,  -363,  -363,
    -363,  -363,  -363,  -363,   -24,  -363,    26,  -363,   200,   205,
     171,   122,    13,    47,   105,   207,   211,   212,   108,  -363,
      46,  -363,  -363,  -363,   292,   169,   172,   156,   -24,   156,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,   217,  -363,   301,
     301,  -363,  -363,  -363,  -363,  -363,  -363,   218,  -363,  -363,
     105,   123,   132,  -363,  -363,  -363,  -363,  -363,  -363,   228,
    -363,   279,  -363,    50,     9,  -363,  -363,  -363,   130,   -24,
     231,  -363,   349,   232,   236,  -363,   243,   227,   229,   220,
     252,   301,  -363,  -363,  -363,   282,  -363,   283,   185,   188,
    -363,  -363,  -363,  -363,  -363,  -363,   -35,   206,  -363,  -363,
     -35,  -363,  -363,    74,    45,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
     106,   301,   285,   195,   301,  -363,  -363,    89,  -363,  -363,
    -363,   193,  -363,  -363,  -363,   156,     6,  -363,   199,  -363,
     247,   196,   194,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
     301,   277,   227,  -363,   301,   278,   229,  -363,   301,     2,
     220,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
     156,    85,  -363,  -363,   -24,  -363,  -363,  -363,  -363,  -363,
    -363,   301,   -24,  -363,  -363,   105,  -363,  -363,   298,   300,
     203,   302,  -363,  -363,  -363,  -363,  -363,   354,  -363,   260,
     355,   261,   357,   301,   -39,  -363,  -363,   301,  -363,  -363,
      88,   358,  -363,   -24,  -363,  -363,   301,  -363,   349,   -57,
     359,   360,  -363,   361,   363,  -363,   372,    58,    58,    58,
     375,  -363,   276,  -363,  -363,   388,  -363,   389,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,   301,  -363,  -363,  -363,   301,
    -363,  -363,   291,  -363,  -363,  -363,  -363,  -363,  -363,  -363,
      89,  -363,  -363,  -363,  -363,  -363,  -363,  -363,   391,   293,
    -363,     1,   244,  -363,  -363,  -363,  -363,  -363,  -363,   379,
      58,  -363,   156,  -363,   371,     1,  -363,  -363,  -363,  -363,
      74,  -363,   395,   396,  -363,  -363,  -363,  -363
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -363,  -363,   390,  -363,   365,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,  -363,   326,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -363,   305,  -363,  -363,  -363,  -363,  -363,
    -363,  -363,   197,  -363,  -363,  -363,  -363,  -363,  -363,  -270,
    -363,  -363,  -363,  -363,   215,  -363,  -363,  -362,  -363,   103,
    -363,  -363,  -363,  -363,  -363,  -363,   158,  -363,  -363,  -363,
    -363,    14,  -363,   -96,  -363,  -363,  -363,    10,  -192,  -363,
     303,  -363,  -363,  -254,  -363,   151,  -363,  -363,  -363,  -363,
    -363,  -363,  -363,  -102,  -363,  -363,   107,  -363,  -124,  -363,
    -363,  -363,  -363,   174,  -363,  -363,   167,  -363,  -363,  -213,
     345,    75,  -363,   315,  -363,  -118,   208,  -363,   -98,   -91,
     209,    -9,  -363,  -363,  -363
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -210
static const yytype_int16 yytable[] =
{
      29,   276,   166,   159,   299,   151,   323,   163,   151,    25,
     302,   187,   190,   215,   262,   101,     1,    27,   317,   393,
       4,   356,    44,    45,    46,    47,   175,    98,   181,    99,
     363,   318,   392,   393,   319,   370,    23,   371,   192,   100,
     101,    25,    26,    30,   102,    11,   103,   104,   105,    27,
     106,    21,   107,   256,   108,    31,    32,    33,    34,    25,
     109,   358,   359,   110,   111,   112,   113,   114,    29,   263,
      22,    24,   115,   116,   117,   118,    36,    38,    25,   109,
      25,   109,   161,    39,   161,    97,    27,   153,    27,    41,
     153,    25,   289,   295,   165,   161,   298,    49,   278,    27,
     216,   217,   218,    51,   219,   220,   221,    25,   273,   177,
     303,   161,   398,   274,   287,    27,   310,    52,    71,   291,
     313,    25,   361,    53,   316,   378,   379,   380,   119,    27,
      90,    91,    92,    93,   301,    72,    54,    55,   402,   279,
     280,   184,   185,   110,   111,   112,   113,   114,  -144,   162,
     228,  -144,  -143,   326,   281,  -143,    73,   388,     5,     6,
      56,     7,     8,     9,    90,    91,    92,    93,    10,   181,
      74,   149,    11,   328,   149,   357,   216,   217,   218,   360,
     219,   220,    75,    77,   165,   165,    84,   211,   368,    25,
      57,    78,    85,   174,   111,   112,   113,    27,   401,    88,
      89,   153,   364,    95,   155,   158,    98,   162,   276,   156,
     119,   167,   282,   283,   284,   168,   169,   172,   100,   101,
     173,   182,   191,   102,    11,   103,   104,   105,   193,   106,
     194,   107,   195,   108,   225,   229,   237,   385,    25,   109,
     238,   386,   110,   111,   112,   113,   114,   239,   240,   244,
     248,   115,   116,   117,   118,   325,   252,   265,   266,   267,
     268,   269,   270,   327,   399,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    25,   183,   184,
     185,   174,   111,   112,   113,    27,   257,   258,   259,   296,
     304,   365,   260,   297,   228,   300,   -82,   306,   308,   307,
     311,   181,   329,   314,  -209,  -140,   330,   119,   165,   165,
     165,   332,   333,   334,   335,   336,   337,   338,   339,   340,
     341,   342,   343,   344,   345,   -82,   -82,   -82,   -82,   -82,
     -82,   -82,   -82,   -82,    25,   183,   184,   185,   174,   111,
     112,   113,    27,   211,   196,   197,   198,   199,   200,   201,
     202,   203,   204,   205,   206,   207,   208,   209,   331,  -207,
     211,  -208,   366,   373,   374,   375,   346,   376,   347,   348,
     349,   350,   351,   352,   353,   354,   377,   210,   211,   381,
     382,   165,    25,   230,   184,   185,   174,   111,   112,   113,
      27,   165,   383,   384,   387,   389,   400,   390,   403,   406,
     407,    48,    37,    83,   157,   272,   367,   286,   321,   404,
     405,   170,   324,   315,    81,   369,   312,   160,   290,   292
};

static const yytype_uint16 yycheck[] =
{
       9,   193,   104,   101,   217,    96,   260,   103,    99,    33,
       4,   129,   130,     4,    49,    14,     4,    41,    16,   381,
       0,   291,    31,    32,    33,    34,   117,     1,   119,     3,
     300,    29,    31,   395,    32,    92,     7,    94,   140,    13,
      14,    33,    34,    99,    18,    19,    20,    21,    22,    41,
      24,    34,    26,   171,    28,    42,    43,    44,    45,    33,
      34,   100,   101,    37,    38,    39,    40,    41,    77,   104,
      34,    34,    46,    47,    48,    49,     4,    98,    33,    34,
      33,    34,    37,    35,    37,    94,    41,    96,    41,    34,
      99,    33,   210,   211,   103,    37,   214,    34,   194,    41,
      91,    92,    93,   100,    95,    96,    97,    33,    34,   118,
     104,    37,   382,    39,   210,    41,   240,   101,    34,   210,
     244,    33,    34,    98,   248,   317,   318,   319,   102,    41,
      42,    43,    44,    45,   225,    35,    98,    98,   392,    33,
      34,    35,    36,    37,    38,    39,    40,    41,   102,   102,
     159,   105,   102,   271,    48,   105,    36,   370,     5,     6,
      98,     8,     9,    10,    42,    43,    44,    45,    15,   260,
      34,    96,    19,   275,    99,   293,    91,    92,    93,   297,
      95,    96,    34,   102,   193,   194,    34,    99,   306,    33,
       4,   102,    12,    37,    38,    39,    40,    41,   390,   103,
     103,   210,   300,    11,     4,    34,     1,   102,   400,     4,
     102,     4,   106,   107,   108,     4,     4,    48,    13,    14,
      48,     4,     4,    18,    19,    20,    21,    22,   105,    24,
      98,    26,     4,    28,   104,     4,     4,   355,    33,    34,
       4,   359,    37,    38,    39,    40,    41,     4,    21,    20,
      30,    46,    47,    48,    49,   264,     4,    51,    52,    53,
      54,    55,    56,   272,   382,    79,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    89,    90,    33,    34,    35,
      36,    37,    38,    39,    40,    41,     4,     4,   103,     4,
      91,   300,   104,    98,   303,   102,     4,    50,   104,   103,
      23,   392,     4,    25,     4,   102,     4,   102,   317,   318,
     319,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    99,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,     4,     4,
      99,     4,     4,     4,     4,     4,   106,     4,   108,   109,
     110,   111,   112,   113,   114,   115,     4,    98,    99,     4,
     104,   390,    33,    34,    35,    36,    37,    38,    39,    40,
      41,   400,     4,     4,   103,     4,    17,   104,    27,     4,
       4,    36,    12,    77,    99,   190,   303,   210,   250,   395,
     400,   108,   261,   246,    69,   308,   242,   102,   210,   210
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   117,   118,     0,     5,     6,     8,     9,    10,
      15,    19,   119,   120,   121,   122,   123,   124,   125,   128,
     217,    34,    34,     7,    34,    33,    34,    41,   131,   227,
      99,    42,    43,    44,    45,   219,     4,   118,    98,    35,
     129,    34,   126,   127,   227,   227,   227,   227,   120,    34,
     132,   100,   101,    98,    98,    98,    98,     4,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
     133,    34,    35,    36,    34,    34,   130,   102,   102,   215,
     216,   216,   135,   131,    34,    12,   136,   137,   103,   103,
      42,    43,    44,    45,   224,    11,   138,   227,     1,     3,
      13,    14,    18,    20,    21,    22,    24,    26,    28,    34,
      37,    38,    39,    40,    41,    46,    47,    48,    49,   102,
     139,   140,   141,   142,   143,   144,   145,   148,   157,   158,
     159,   162,   163,   167,   168,   169,   178,   179,   180,   181,
     182,   184,   186,   195,   196,   197,   198,   205,   206,   217,
     218,   225,   226,   227,   192,     4,     4,   140,    34,   224,
     219,    37,   102,   179,   199,   227,   199,     4,     4,     4,
     186,   149,    48,    48,    37,   225,   227,   227,   187,   188,
     189,   225,     4,    34,    35,    36,   161,   221,   222,   225,
     221,     4,   199,   105,    98,     4,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      98,    99,   146,   155,   230,     4,    91,    92,    93,    95,
      96,    97,   191,   193,   194,   104,   164,   165,   227,     4,
      34,   200,   201,   202,   203,   204,   221,     4,     4,     4,
      21,   207,   208,   209,    20,   210,   211,   212,    30,   170,
     171,   172,     4,   150,   151,   152,   221,     4,     4,   103,
     104,   190,    49,   104,   160,    51,    52,    53,    54,    55,
      56,   223,   160,    34,    39,   183,   184,   185,   179,    33,
      34,    48,   106,   107,   108,   147,   148,   179,   220,   221,
     222,   225,   226,   228,   156,   221,     4,    98,   221,   215,
     102,   225,     4,   104,    91,   166,    50,   103,   104,   213,
     204,    23,   209,   204,    25,   212,   204,    16,    29,    32,
     173,   172,   153,   189,   191,   227,   221,   227,   199,     4,
       4,     4,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,   106,   108,   109,   110,
     111,   112,   113,   114,   115,   229,   155,   221,   100,   101,
     221,    34,   134,   155,   224,   227,     4,   165,   221,   202,
      92,    94,   214,     4,     4,     4,     4,     4,   184,   184,
     184,     4,   104,     4,     4,   221,   221,   103,   215,     4,
     104,   174,    31,   163,   175,   176,   177,   154,   155,   221,
      17,   184,   189,    27,   177,   183,     4,     4
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
#line 359 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 363 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 369 "pir.y"
    { /*set_hll($2, $4);*/ ;}
    break;

  case 17:
#line 373 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 383 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 385 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].fixme); ;}
    break;

  case 21:
#line 389 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 22:
#line 391 "pir.y"
    { ;}
    break;

  case 23:
#line 397 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 24:
#line 398 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(4) - (5)].ival)); ;}
    break;

  case 28:
#line 409 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 29:
#line 411 "pir.y"
    { (yyval.ival) |= (yyvsp[(2) - (2)].ival); ;}
    break;

  case 30:
#line 415 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 31:
#line 417 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 32:
#line 419 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 33:
#line 421 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 34:
#line 423 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 35:
#line 425 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 36:
#line 427 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 37:
#line 429 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 38:
#line 431 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 39:
#line 433 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 40:
#line 435 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 41:
#line 437 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEXID; /* do something with this */ ;}
    break;

  case 48:
#line 452 "pir.y"
    { /* set_param_flag($2, $3);
                          IF_NAMED_PARAM_SET_ALIAS($2, $3);
                          */
                        ;}
    break;

  case 50:
#line 463 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 52:
#line 469 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 53:
#line 471 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 68:
#line 491 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                              fprintf(stderr, "Too many errors. Compilation aborted.\n");
                              exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                          }
                          yyerrok;
                        ;}
    break;

  case 69:
#line 500 "pir.y"
    { set_instr(lexer, "null");
                          add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                        ;}
    break;

  case 70:
#line 504 "pir.y"
    { set_instr(lexer, "null");
                          add_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                        ;}
    break;

  case 71:
#line 510 "pir.y"
    { set_instr(lexer, "get_results");
                          add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                        ;}
    break;

  case 73:
#line 519 "pir.y"
    { add_first_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 74:
#line 544 "pir.y"
    { assign(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 75:
#line 546 "pir.y"
    { assign(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 76:
#line 548 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 77:
#line 552 "pir.y"
    { assign(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 78:
#line 554 "pir.y"
    { assign(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 79:
#line 556 "pir.y"
    { assign(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 80:
#line 558 "pir.y"
    { assign(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 81:
#line 560 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 82:
#line 564 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 87:
#line 577 "pir.y"
    { add_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 88:
#line 582 "pir.y"
    { /* nothing to do */;}
    break;

  case 89:
#line 584 "pir.y"
    { add_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 92:
#line 592 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 93:
#line 596 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 94:
#line 598 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 95:
#line 602 "pir.y"
    { /* it was "unless", so "invert" the opcode */
                           if ((yyvsp[(1) - (5)].ival) > 0) {
                              invert_instr(lexer);
                           }
                           add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                         ;}
    break;

  case 96:
#line 609 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval));
                           add_operand(lexer, (yyvsp[(2) - (5)].expr));
                           add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                         ;}
    break;

  case 97:
#line 615 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 98:
#line 616 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 99:
#line 621 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 100:
#line 623 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 103:
#line 632 "pir.y"
    { set_instr(lexer, "if");
                           add_operand(lexer, (yyvsp[(1) - (1)].expr));
                         ;}
    break;

  case 104:
#line 636 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                           add_operand(lexer, (yyvsp[(1) - (3)].expr));
                           add_operand(lexer, (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 105:
#line 644 "pir.y"
    { set_instr(lexer, "branch");
                           add_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 106:
#line 650 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 107:
#line 654 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 108:
#line 656 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 109:
#line 660 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 110:
#line 663 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 111:
#line 664 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 112:
#line 670 "pir.y"
    { set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval)); ;}
    break;

  case 115:
#line 685 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                             (yyval.fixme) = NULL;
                           ;}
    break;

  case 116:
#line 693 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 117:
#line 695 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 118:
#line 699 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 119:
#line 701 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 120:
#line 705 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 121:
#line 709 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 122:
#line 711 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 123:
#line 714 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 124:
#line 718 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 125:
#line 720 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 126:
#line 726 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 127:
#line 728 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 128:
#line 732 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 129:
#line 734 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 130:
#line 738 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 131:
#line 740 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 132:
#line 744 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 133:
#line 746 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 134:
#line 748 "pir.y"
    { set_invocation_results((yyvsp[(1) - (2)].invo), NULL); ;}
    break;

  case 137:
#line 757 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 138:
#line 764 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 139:
#line 770 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 140:
#line 772 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 143:
#line 780 "pir.y"
    { (yyval.targ) = target_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 144:
#line 782 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 145:
#line 786 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 146:
#line 788 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 147:
#line 793 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 148:
#line 797 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 149:
#line 799 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 150:
#line 803 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 151:
#line 805 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 152:
#line 809 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 153:
#line 817 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 154:
#line 819 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 155:
#line 823 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 156:
#line 825 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 157:
#line 827 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 158:
#line 829 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 159:
#line 831 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 160:
#line 837 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 161:
#line 839 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 164:
#line 847 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 169:
#line 862 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 170:
#line 866 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 171:
#line 870 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 172:
#line 876 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 173:
#line 880 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 174:
#line 882 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 175:
#line 886 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 176:
#line 888 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 179:
#line 896 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 180:
#line 902 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 181:
#line 912 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 182:
#line 920 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 183:
#line 926 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 184:
#line 928 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 185:
#line 933 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 186:
#line 935 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 187:
#line 940 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 188:
#line 944 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 189:
#line 946 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 190:
#line 950 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 191:
#line 952 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 192:
#line 956 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 193:
#line 961 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 194:
#line 963 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 195:
#line 967 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 196:
#line 969 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 197:
#line 975 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 198:
#line 977 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 199:
#line 981 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 200:
#line 985 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 202:
#line 990 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), GLOBALCONST); ;}
    break;

  case 203:
#line 994 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 204:
#line 996 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 205:
#line 998 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 206:
#line 1000 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 207:
#line 1009 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 208:
#line 1010 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 209:
#line 1011 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 210:
#line 1014 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 211:
#line 1015 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 212:
#line 1018 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 213:
#line 1019 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 214:
#line 1020 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 215:
#line 1023 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 216:
#line 1024 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 217:
#line 1025 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 218:
#line 1026 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 219:
#line 1027 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 220:
#line 1028 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 221:
#line 1031 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 222:
#line 1032 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 223:
#line 1033 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 224:
#line 1034 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 225:
#line 1037 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 226:
#line 1038 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 227:
#line 1041 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 228:
#line 1042 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 229:
#line 1043 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 230:
#line 1044 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 233:
#line 1051 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 234:
#line 1052 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 235:
#line 1053 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 236:
#line 1056 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 237:
#line 1057 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 238:
#line 1058 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 239:
#line 1059 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 240:
#line 1060 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 241:
#line 1061 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 242:
#line 1062 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 243:
#line 1063 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 244:
#line 1064 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 245:
#line 1065 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 246:
#line 1066 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 247:
#line 1067 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 248:
#line 1068 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 249:
#line 1069 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 250:
#line 1070 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 251:
#line 1071 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 252:
#line 1072 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 253:
#line 1073 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 254:
#line 1074 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 255:
#line 1075 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 256:
#line 1076 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 257:
#line 1077 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 258:
#line 1078 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 259:
#line 1082 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 260:
#line 1083 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 261:
#line 1084 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 262:
#line 1085 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 263:
#line 1086 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 264:
#line 1087 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 265:
#line 1088 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 266:
#line 1089 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 267:
#line 1090 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 268:
#line 1091 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 269:
#line 1092 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 270:
#line 1093 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 271:
#line 1094 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 272:
#line 1095 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3161 "pirparser.c"
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


#line 1097 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


