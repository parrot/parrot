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

#define STORE_NAMED_ALIAS(NAME)     lexer->temp_flag_arg1 = NAME

#define IF_NAMED_ARG_SET_ALIAS(OBJ,EXPR)    if (TEST_FLAG(EXPR, ARG_FLAG_NAMED)) {       \
                                              set_arg_named(OBJ, lexer->temp_flag_arg1); \
                                            }


#define IF_NAMED_PARAM_SET_ALIAS(OBJ,EXPR)    if (TEST_FLAG(EXPR, PARAM_FLAG_NAMED)) {   \
                                              set_arg_named(OBJ, lexer->temp_flag_arg1); \
                                            }



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
#line 74 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
    struct constant    *constval;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;

    void *fixme;
}
/* Line 187 of yacc.c.  */
#line 385 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 398 "pirparser.c"

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
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  119
/* YYNRULES -- Number of rules.  */
#define YYNRULES  288
/* YYNRULES -- Number of states.  */
#define YYNSTATES  436

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
      54,    55,    58,    61,    64,    66,    70,    71,    73,    75,
      79,    81,    84,    85,    89,    91,    95,    96,    97,   107,
     109,   111,   112,   115,   117,   119,   121,   123,   125,   127,
     129,   131,   136,   141,   144,   145,   149,   151,   153,   155,
     157,   158,   161,   166,   169,   174,   175,   176,   180,   183,
     186,   188,   190,   192,   194,   196,   198,   200,   202,   204,
     206,   208,   210,   212,   215,   219,   224,   230,   234,   237,
     241,   244,   247,   249,   253,   256,   258,   259,   263,   264,
     266,   268,   272,   274,   276,   278,   280,   282,   284,   286,
     288,   290,   292,   294,   296,   298,   300,   302,   304,   306,
     308,   310,   312,   314,   316,   318,   320,   322,   324,   326,
     328,   330,   332,   334,   336,   338,   340,   342,   344,   346,
     348,   350,   352,   354,   358,   360,   364,   366,   368,   370,
     376,   382,   384,   386,   389,   392,   394,   396,   398,   402,
     406,   411,   413,   417,   420,   421,   423,   429,   431,   433,
     442,   443,   445,   447,   450,   454,   458,   461,   467,   468,
     471,   472,   474,   476,   479,   483,   485,   492,   497,   500,
     502,   504,   509,   512,   514,   516,   518,   520,   522,   524,
     526,   528,   530,   532,   533,   535,   537,   541,   544,   545,
     548,   550,   552,   554,   556,   559,   561,   563,   565,   567,
     571,   575,   579,   583,   584,   586,   588,   592,   594,   596,
     600,   603,   609,   615,   616,   618,   620,   623,   627,   628,
     630,   632,   635,   639,   640,   643,   645,   648,   649,   653,
     656,   659,   663,   668,   673,   678,   683,   685,   687,   689,
     691,   693,   695,   697,   699,   701,   703,   705,   707,   709,
     711,   713,   715,   717,   719,   721,   723,   725,   727,   729,
     731,   733,   735,   737,   739,   741,   743,   745,   747
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     121,     0,    -1,   122,   123,   122,    -1,    -1,     4,    -1,
     124,    -1,   123,     4,   124,    -1,   139,    -1,   226,    -1,
     136,    -1,   129,    -1,   127,    -1,   128,    -1,   126,    -1,
     125,    -1,    10,     9,    37,    -1,    11,    36,    -1,     5,
      36,   102,    36,    -1,     6,    36,   102,    36,    -1,     7,
       4,   130,     8,    -1,    -1,   130,   131,    -1,     3,     4,
      -1,     3,   132,    -1,   132,    -1,    47,   133,     4,    -1,
      -1,   134,    -1,   135,    -1,   134,   102,   135,    -1,   229,
      -1,    17,   137,    -1,    -1,   103,   138,   104,    -1,    36,
      -1,   138,   170,    36,    -1,    -1,    -1,    12,   142,   140,
     143,     4,   141,   147,   150,    13,    -1,   238,    -1,    36,
      -1,    -1,   143,   144,    -1,    88,    -1,    85,    -1,    86,
      -1,    87,    -1,    89,    -1,    92,    -1,    94,    -1,    95,
      -1,    93,   105,   145,   106,    -1,    90,   105,   142,   106,
      -1,    91,   225,    -1,    -1,   145,   102,   146,    -1,   238,
      -1,    36,    -1,   167,    -1,   234,    -1,    -1,   147,   148,
      -1,    14,   149,   203,     4,    -1,   234,   238,    -1,   234,
      36,    56,   238,    -1,    -1,    -1,   150,   151,   152,    -1,
       3,     4,    -1,     3,   153,    -1,   153,    -1,   171,    -1,
     176,    -1,   177,    -1,   181,    -1,   227,    -1,   205,    -1,
     206,    -1,   182,    -1,   156,    -1,   132,    -1,   155,    -1,
     154,    -1,     1,     4,    -1,    54,   235,     4,    -1,   235,
     107,    54,     4,    -1,    30,   105,   200,   106,     4,    -1,
     235,   157,     4,    -1,   166,   231,    -1,   167,   107,   231,
      -1,   107,   158,    -1,   164,   231,    -1,   230,    -1,   231,
     165,   231,    -1,   235,   167,    -1,   159,    -1,    -1,    47,
     160,   161,    -1,    -1,   162,    -1,   163,    -1,   162,   102,
     163,    -1,   229,    -1,   108,    -1,   109,    -1,   110,    -1,
     111,    -1,   108,    -1,   112,    -1,   113,    -1,   114,    -1,
     115,    -1,   116,    -1,   110,    -1,   117,    -1,    70,    -1,
      63,    -1,    64,    -1,    65,    -1,    67,    -1,    68,    -1,
      66,    -1,    69,    -1,    58,    -1,    60,    -1,    59,    -1,
      62,    -1,    61,    -1,    57,    -1,    74,    -1,    75,    -1,
      76,    -1,    77,    -1,    78,    -1,    79,    -1,    82,    -1,
      80,    -1,    81,    -1,    83,    -1,    84,    -1,    72,    -1,
      73,    -1,    71,    -1,   103,   168,   104,    -1,   169,    -1,
     168,   170,   169,    -1,   231,    -1,   118,    -1,   102,    -1,
     172,   175,   174,   238,     4,    -1,   173,   231,   174,   238,
       4,    -1,    52,    -1,    53,    -1,    52,    54,    -1,    53,
      54,    -1,    55,    -1,   102,    -1,   231,    -1,   231,   233,
     231,    -1,    55,   238,     4,    -1,    16,   234,   178,     4,
      -1,   179,    -1,   178,   102,   179,    -1,   238,   180,    -1,
      -1,    96,    -1,    15,    36,   102,   235,     4,    -1,   183,
      -1,   192,    -1,    28,     4,   184,   187,     4,   189,    29,
       4,    -1,    -1,   185,    -1,   186,    -1,   185,   186,    -1,
      32,   214,     4,    -1,    31,   197,   188,    -1,    34,   197,
      -1,    18,   197,     4,    19,   198,    -1,    -1,   102,   197,
      -1,    -1,   190,    -1,   191,    -1,   190,   191,    -1,    33,
     202,     4,    -1,   177,    -1,   105,   200,   106,   107,   193,
       4,    -1,   235,   107,   193,     4,    -1,   193,     4,    -1,
     195,    -1,   194,    -1,   197,   119,   198,   209,    -1,   196,
     209,    -1,   197,    -1,    36,    -1,   238,    -1,    43,    -1,
      39,    -1,   197,    -1,   199,    -1,    36,    -1,    45,    -1,
      41,    -1,    -1,   201,    -1,   202,    -1,   201,   102,   202,
      -1,   235,   203,    -1,    -1,   203,   204,    -1,   100,    -1,
     101,    -1,    98,    -1,    96,    -1,    97,   225,    -1,   207,
      -1,   215,    -1,   208,    -1,   216,    -1,    22,   209,     4,
      -1,    22,   193,     4,    -1,    23,   209,     4,    -1,   105,
     210,   106,    -1,    -1,   211,    -1,   212,    -1,   211,   102,
     212,    -1,   214,    -1,   213,    -1,    36,    56,   231,    -1,
     231,   223,    -1,    26,     4,   220,    27,     4,    -1,    24,
       4,   217,    25,     4,    -1,    -1,   218,    -1,   219,    -1,
     218,   219,    -1,    23,   214,     4,    -1,    -1,   221,    -1,
     222,    -1,   221,   222,    -1,    22,   214,     4,    -1,    -1,
     223,   224,    -1,    99,    -1,    97,   225,    -1,    -1,   105,
      36,   106,    -1,    21,   228,    -1,   226,     4,    -1,    20,
     228,     4,    -1,    48,   238,   107,    37,    -1,    49,   238,
     107,    38,    -1,    50,   238,   107,    36,    -1,    51,   238,
     107,    36,    -1,   232,    -1,   237,    -1,   232,    -1,   236,
      -1,    35,    -1,   235,    -1,   232,    -1,    36,    -1,    37,
      -1,    38,    -1,    57,    -1,    58,    -1,    59,    -1,    60,
      -1,    62,    -1,    61,    -1,    48,    -1,    49,    -1,    50,
      -1,    51,    -1,   236,    -1,   238,    -1,    43,    -1,    44,
      -1,    46,    -1,    45,    -1,   237,    -1,    39,    -1,    40,
      -1,    42,    -1,    41,    -1,    35,    -1,    47,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   294,   294,   299,   300,   303,   304,   307,   308,   309,
     310,   311,   312,   313,   314,   317,   320,   326,   329,   334,
     340,   341,   344,   345,   346,   349,   352,   353,   356,   357,
     361,   366,   369,   370,   373,   374,   379,   380,   379,   386,
     387,   390,   391,   394,   395,   396,   397,   398,   399,   400,
     401,   402,   403,   404,   407,   408,   411,   412,   413,   414,
     417,   418,   421,   431,   432,   440,   441,   441,   446,   447,
     448,   451,   452,   453,   454,   455,   456,   457,   458,   459,
     460,   461,   462,   463,   466,   467,   470,   475,   492,   493,
     494,   497,   498,   499,   500,   501,   504,   504,   508,   509,
     512,   513,   516,   519,   520,   521,   524,   525,   526,   527,
     528,   529,   530,   531,   532,   533,   534,   535,   536,   537,
     538,   539,   540,   541,   542,   543,   544,   545,   546,   550,
     551,   552,   553,   554,   555,   556,   557,   558,   559,   560,
     561,   562,   563,   566,   569,   570,   573,   576,   577,   581,
     588,   592,   593,   597,   598,   601,   602,   606,   609,   615,
     618,   621,   622,   625,   628,   629,   634,   638,   639,   642,
     654,   655,   658,   659,   662,   665,   666,   667,   671,   672,
     677,   678,   681,   682,   685,   686,   689,   691,   693,   698,
     699,   702,   708,   713,   714,   717,   718,   719,   722,   723,
     726,   727,   728,   731,   732,   735,   736,   739,   751,   752,
     755,   756,   757,   758,   759,   767,   768,   771,   772,   775,
     778,   781,   786,   789,   790,   793,   794,   797,   798,   801,
     806,   814,   821,   828,   829,   833,   834,   838,   841,   842,
     845,   846,   849,   853,   854,   857,   858,   863,   864,   867,
     870,   871,   874,   875,   876,   877,   880,   881,   885,   886,
     887,   890,   891,   894,   895,   896,   899,   900,   901,   902,
     903,   904,   907,   908,   909,   910,   913,   914,   917,   918,
     919,   920,   921,   924,   925,   926,   927,   930,   931
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
  "pasm_instruction", "parrot_statement", "opt_pasm_args", "pasm_args",
  "pasm_arg", "namespace_declaration", "opt_namespace_id", "namespace_id",
  "sub_definition", "@1", "@2", "sub_id", "sub_flags", "sub_flag",
  "multi_type_list", "multi_type", "parameters", "parameter", "param_def",
  "instructions", "@3", "instruction", "statement", "null_statement",
  "getresults_statement", "assignment_statement", "assignment_tail",
  "assignment_expression", "parrot_instruction", "@4",
  "opt_parrot_op_args", "parrot_op_args", "parrot_op_arg", "unop", "binop",
  "augmented_op", "keylist", "keys", "key", "separator",
  "conditional_statement", "if_type", "if_null_type", "then", "condition",
  "goto_statement", "local_declaration", "local_id_list", "local_id",
  "has_unique_reg", "lex_declaration", "invocation_statement",
  "long_invocation_statement", "opt_long_arguments", "long_arguments",
  "long_argument", "long_invocation", "opt_return_continuation",
  "opt_long_results", "long_results", "long_result",
  "short_invocation_statement", "simple_invocation", "methodcall",
  "subcall", "sub", "invokable", "method", "string_object",
  "opt_target_list", "target_list", "result_target", "param_flags",
  "param_flag", "return_statement", "yield_statement",
  "short_return_statement", "short_yield_statement", "arguments",
  "opt_arguments_list", "arguments_list", "argument", "named_arg",
  "short_arg", "long_return_statement", "long_yield_statement",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "const_declaration",
  "const_decl_statement", "const_tail", "pasm_expression", "expression1",
  "expression", "constant", "rel_op", "type", "target", "reg", "pasm_reg",
  "identifier", 0
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
     130,   130,   131,   131,   131,   132,   133,   133,   134,   134,
     135,   136,   137,   137,   138,   138,   140,   141,   139,   142,
     142,   143,   143,   144,   144,   144,   144,   144,   144,   144,
     144,   144,   144,   144,   145,   145,   146,   146,   146,   146,
     147,   147,   148,   149,   149,   150,   151,   150,   152,   152,
     152,   153,   153,   153,   153,   153,   153,   153,   153,   153,
     153,   153,   153,   153,   154,   154,   155,   156,   157,   157,
     157,   158,   158,   158,   158,   158,   160,   159,   161,   161,
     162,   162,   163,   164,   164,   164,   165,   165,   165,   165,
     165,   165,   165,   165,   165,   165,   165,   165,   165,   165,
     165,   165,   165,   165,   165,   165,   165,   165,   165,   166,
     166,   166,   166,   166,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   167,   168,   168,   169,   170,   170,   171,
     171,   172,   172,   173,   173,   174,   174,   175,   175,   176,
     177,   178,   178,   179,   180,   180,   181,   182,   182,   183,
     184,   184,   185,   185,   186,   187,   187,   187,   188,   188,
     189,   189,   190,   190,   191,   191,   192,   192,   192,   193,
     193,   194,   195,   196,   196,   197,   197,   197,   198,   198,
     199,   199,   199,   200,   200,   201,   201,   202,   203,   203,
     204,   204,   204,   204,   204,   205,   205,   206,   206,   207,
     207,   208,   209,   210,   210,   211,   211,   212,   212,   213,
     214,   215,   216,   217,   217,   218,   218,   219,   220,   220,
     221,   221,   222,   223,   223,   224,   224,   225,   225,   226,
     227,   227,   228,   228,   228,   228,   229,   229,   230,   230,
     230,   231,   231,   232,   232,   232,   233,   233,   233,   233,
     233,   233,   234,   234,   234,   234,   235,   235,   236,   236,
     236,   236,   236,   237,   237,   237,   237,   238,   238
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     2,     4,     4,     4,
       0,     2,     2,     2,     1,     3,     0,     1,     1,     3,
       1,     2,     0,     3,     1,     3,     0,     0,     9,     1,
       1,     0,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     4,     2,     0,     3,     1,     1,     1,     1,
       0,     2,     4,     2,     4,     0,     0,     3,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     2,     3,     4,     5,     3,     2,     3,
       2,     2,     1,     3,     2,     1,     0,     3,     0,     1,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     1,     3,     1,     1,     1,     5,
       5,     1,     1,     2,     2,     1,     1,     1,     3,     3,
       4,     1,     3,     2,     0,     1,     5,     1,     1,     8,
       0,     1,     1,     2,     3,     3,     2,     5,     0,     2,
       0,     1,     1,     2,     3,     1,     6,     4,     2,     1,
       1,     4,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     1,     1,     3,     2,     0,     2,
       1,     1,     1,     1,     2,     1,     1,     1,     1,     3,
       3,     3,     3,     0,     1,     1,     3,     1,     1,     3,
       2,     5,     5,     0,     1,     1,     2,     3,     0,     1,
       1,     2,     3,     0,     2,     1,     2,     0,     3,     2,
       2,     3,     4,     4,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    32,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,   287,    40,
     288,    36,    39,     0,    31,     0,     0,     0,     0,   249,
       4,     2,     0,     0,     0,    15,    41,    34,     0,     0,
       0,     0,     0,     6,    17,    18,     0,    19,    26,    21,
      24,     0,   148,    33,   147,     0,     0,     0,     0,     0,
      22,    23,   263,   264,   265,   283,   284,   286,   285,     0,
      27,    28,    30,   256,   257,    37,    44,    45,    46,    43,
      47,     0,   247,    48,     0,    49,    50,    42,    35,   252,
     253,   254,   255,    25,     0,    60,     0,     0,    53,    54,
      29,    65,     0,     0,     0,     0,    61,    66,    52,   248,
       0,    51,   272,   273,   274,   275,   208,     0,    38,     0,
      57,     0,    55,    58,    59,    56,     0,     0,    63,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     194,   283,   278,   279,   281,   280,   288,   151,   152,     0,
       0,   203,    80,    67,    70,    82,    81,    79,    71,     0,
       0,    72,    73,    74,    78,   167,   168,     0,   190,   189,
       0,   193,    76,    77,   215,   217,   216,   218,     0,    75,
       0,   276,   282,   277,   278,     0,   144,   146,   262,   261,
     277,    62,   213,   247,   212,   210,   211,   209,     0,    83,
      68,    69,     0,     0,     0,   197,   196,   223,     0,     0,
     195,     0,   233,   238,   170,   203,   153,   154,     0,     0,
       0,   204,   205,   208,     0,   157,     0,   188,   192,     0,
     250,   142,   140,   141,   129,   130,   131,   132,   133,   134,
     136,   137,   135,   138,   139,     0,     0,     0,     0,   143,
       0,   214,    64,     0,     0,   161,   164,   251,   263,     0,
     224,   225,   228,   227,   243,   220,   219,   221,     0,     0,
     234,   235,     0,     0,   239,   240,     0,     0,   171,   172,
       0,    84,   159,     0,     0,   207,   155,   156,     0,   266,
     267,   268,   269,   271,   270,     0,     0,   200,   202,   201,
     198,     0,   199,   287,   263,   288,     0,   103,   104,   105,
      90,    95,     0,     0,    92,     0,   262,   261,   276,    87,
      88,     0,   145,     0,   160,     0,   165,   163,     0,   222,
       0,   230,     0,     0,   236,     0,     0,   241,     0,     0,
       0,     0,     0,   173,     0,     0,   206,     0,   158,     0,
     191,    98,    85,    91,   187,   128,   123,   125,   124,   127,
     126,   116,   117,   118,   121,   119,   120,   122,   115,   107,
     113,   106,   108,   109,   110,   111,   112,   114,     0,    94,
      89,   166,   162,   229,   226,   247,   245,   244,   237,   232,
     242,   231,   174,     0,   178,   176,   180,    86,     0,   149,
     150,    97,    99,   100,   102,    93,   246,     0,     0,   175,
       0,   185,     0,   181,   182,   186,     0,     0,   179,     0,
       0,   183,   101,   177,   184,   169
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      44,    59,   162,    79,    80,    81,    20,    34,    48,    21,
      46,   105,    31,    61,    97,   114,   132,   111,   116,   126,
     117,   129,   163,   164,   165,   166,   167,   256,   320,   321,
     361,   411,   412,   413,   322,   388,   257,   133,   195,   196,
      65,   168,   169,   170,   298,   234,   171,   172,   264,   265,
     337,   173,   174,   175,   287,   288,   289,   352,   419,   422,
     423,   424,   176,   177,   178,   179,   180,   181,   311,   312,
     230,   231,   232,   136,   207,   182,   183,   184,   185,   219,
     269,   270,   271,   272,   273,   186,   187,   279,   280,   281,
     283,   284,   285,   341,   397,   108,    22,   189,    39,    82,
     324,   274,   198,   305,   127,   199,   191,   192,   200
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -384
static const yytype_int16 yypact[] =
{
      11,  -384,    21,   296,  -384,    13,    14,    61,    79,    68,
      59,    25,   261,   114,  -384,  -384,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,    34,    39,  -384,   107,  -384,  -384,  -384,
    -384,  -384,  -384,   112,  -384,     9,     9,     9,     9,  -384,
     296,  -384,   113,   129,    29,  -384,  -384,  -384,   -73,    63,
      81,    85,    87,  -384,  -384,  -384,    10,  -384,   169,  -384,
    -384,    66,  -384,  -384,  -384,   130,   132,   148,   159,   166,
    -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,   212,
     122,  -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,
    -384,   118,   120,  -384,   123,  -384,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,  -384,   169,  -384,    59,   200,  -384,  -384,
    -384,   224,   134,   136,   -35,   301,  -384,   230,  -384,  -384,
     127,  -384,  -384,  -384,  -384,  -384,  -384,    91,  -384,    38,
    -384,   291,  -384,  -384,  -384,  -384,    15,   188,  -384,   244,
     211,   213,   301,   261,    62,   155,   255,   257,   258,   162,
    -384,   -85,   -50,  -384,  -384,  -384,   143,   214,   215,   397,
       9,   397,  -384,  -384,  -384,  -384,  -384,  -384,  -384,   291,
     291,  -384,  -384,  -384,  -384,  -384,  -384,   267,  -384,  -384,
     155,   153,  -384,  -384,  -384,  -384,  -384,  -384,   285,  -384,
     283,  -384,  -384,   -33,  -384,   -15,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,   120,  -384,  -384,  -384,  -384,     9,  -384,
    -384,  -384,   185,     9,   286,  -384,  -384,   356,   287,   289,
    -384,   290,   272,   276,   268,   397,  -384,  -384,   295,   310,
     209,   240,  -384,  -384,   -39,   388,   -39,  -384,  -384,   371,
    -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,  -384,  -384,   238,   339,   291,   237,  -384,
     291,  -384,  -384,   397,     5,  -384,   292,  -384,   297,   262,
     302,  -384,  -384,  -384,  -384,  -384,  -384,  -384,   291,   360,
     272,  -384,   291,   362,   276,  -384,   291,    12,   268,  -384,
     281,  -384,  -384,   298,   397,   121,  -384,  -384,     9,  -384,
    -384,  -384,  -384,  -384,  -384,   291,     9,  -384,  -384,  -384,
    -384,   155,  -384,   405,   306,   282,   409,  -384,  -384,  -384,
    -384,  -384,   291,   411,  -384,   314,   415,   317,   417,  -384,
    -384,   291,  -384,   419,  -384,     9,  -384,  -384,   291,  -384,
     356,   -75,   429,   430,  -384,   431,   447,  -384,   448,    86,
      86,    86,   449,  -384,   450,   154,  -384,   451,  -384,   452,
    -384,   169,  -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,  -384,  -384,  -384,  -384,  -384,   291,  -384,
    -384,  -384,  -384,  -384,  -384,   120,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,   453,   357,  -384,     2,  -384,   454,  -384,
    -384,  -384,   358,  -384,  -384,  -384,  -384,   442,    86,  -384,
     397,  -384,   433,     2,  -384,  -384,   169,   371,  -384,   459,
     460,  -384,  -384,  -384,  -384,  -384
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -384,  -384,   455,  -384,   425,  -384,  -384,  -384,  -384,  -384,
    -384,  -384,    64,  -384,  -384,   363,  -384,  -384,  -384,  -384,
    -384,  -384,   364,  -384,  -384,  -384,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,   326,  -384,  -384,  -384,  -384,  -384,  -384,
    -384,  -384,  -384,    43,  -384,  -384,  -384,  -182,  -384,   216,
     277,  -384,  -384,  -384,   235,  -384,  -384,  -383,  -384,   138,
    -384,  -384,  -384,  -384,  -384,  -384,   186,  -384,  -384,  -384,
    -384,    52,  -384,  -141,  -384,  -384,  -384,  -227,    50,  -384,
     253,  -384,  -289,   246,  -384,  -384,  -384,  -384,  -384,  -138,
    -384,  -384,   140,  -384,  -114,  -384,  -384,  -384,  -384,   201,
    -384,  -384,   198,  -384,  -384,  -199,     6,  -384,   340,  -351,
    -384,  -118,   -56,  -384,  -109,  -123,   229,   -57,   -10
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -261
static const yytype_int16 yytable[] =
{
      32,    84,    83,   218,   261,   356,   190,   221,   258,   334,
     414,   134,   310,   197,    70,     1,   296,   190,   142,   201,
    -197,     4,   395,   421,   396,    49,    50,    51,    52,    62,
     349,    63,    56,   213,  -197,   420,   228,    57,   233,   139,
     421,   140,   238,   350,    28,    64,   351,    84,    83,    23,
      24,   235,   236,   141,   142,  -196,    30,    58,   143,    12,
     144,   145,   146,   297,   147,    25,   148,   120,   149,  -196,
      85,   121,  -195,    28,   150,   414,    58,   151,    76,    77,
      78,   152,   153,   154,   155,   156,  -195,    62,    26,   259,
     157,   158,   159,   160,    28,    29,    32,    28,   150,    84,
      83,   215,   233,    64,    27,   216,    30,   335,    60,    30,
     135,   202,   203,   204,   323,   205,   206,   138,    40,   193,
      71,    28,   403,   404,   405,   215,    28,   137,    33,   216,
     193,   429,   327,    30,   220,   188,    42,   325,    30,   330,
     333,    43,   197,   161,    45,   389,   188,   -26,    47,    54,
     229,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    28,   130,   342,    55,    98,   217,   345,    99,
      66,   233,   348,   360,    30,   122,   123,   124,   125,    72,
      73,    74,    75,    76,    77,    78,   100,   358,    67,    28,
     150,   428,    68,   215,    69,   101,   416,   216,   262,   326,
     310,    30,   102,   266,   363,    72,    73,    74,    75,    76,
      77,    78,   139,   390,   408,   210,   103,   202,   203,   204,
     393,   205,   206,   106,   104,   107,   141,   142,   109,   220,
     131,   143,    12,   144,   145,   146,   113,   147,   115,   148,
     118,   149,   119,   128,   208,   193,    28,   150,   209,   212,
     151,    76,    77,    78,   152,   153,   154,   155,   156,   222,
     217,   223,   224,   157,   158,   159,   160,   225,   226,   227,
     415,   237,   239,   313,   314,    73,    74,   151,    76,    77,
      78,   152,   153,   154,   155,   315,   -96,   263,   357,   240,
     267,   275,   316,   276,   277,   278,   359,   233,   282,   291,
     286,     5,     6,     7,    84,    83,     8,     9,    10,    35,
      36,    37,    38,    11,   292,   293,   161,    12,   -96,   -96,
     -96,   -96,   -96,   -96,   -96,   266,    28,    72,    73,    74,
      75,    76,    77,    78,   194,   153,   154,   155,    30,   220,
     220,   220,   294,   329,   331,   220,   317,   318,   319,   122,
     123,   124,   125,   338,   241,   242,   243,   244,   245,   246,
     247,   248,   249,   250,   251,   252,   253,   254,   339,    84,
      83,   365,   366,   367,   368,   369,   370,   371,   372,   373,
     374,   375,   376,   377,   378,   343,   131,   354,   336,   346,
     255,    28,   268,    73,    74,    75,    76,    77,    78,   194,
     153,   154,   155,    30,   340,   355,    28,   307,   220,  -260,
     215,  -194,   308,   362,   216,   364,   309,   220,    30,  -258,
     131,  -259,   379,   391,   380,   381,   382,   383,   384,   385,
     386,   387,    28,   398,   399,   400,    75,    76,    77,    78,
     194,   153,   154,   155,    30,   299,   300,   301,   302,   303,
     304,   401,   402,   406,   407,   409,   410,   417,   425,   418,
     426,   427,   430,   434,   435,    53,   211,   110,    41,   432,
     112,   306,   260,   392,   353,   431,   332,   433,   290,   295,
     394,   344,   347,   214,   328
};

static const yytype_uint16 yycheck[] =
{
      10,    58,    58,   144,   203,   294,   129,   145,   190,     4,
     361,   120,   239,   131,     4,     4,    55,   140,    16,     4,
     105,     0,    97,   406,    99,    35,    36,    37,    38,   102,
      18,   104,     3,   142,   119,    33,   159,     8,   161,     1,
     423,     3,   180,    31,    35,   118,    34,   104,   104,    36,
      36,   169,   170,    15,    16,   105,    47,    47,    20,    21,
      22,    23,    24,   102,    26,     4,    28,   102,    30,   119,
       4,   106,   105,    35,    36,   426,    47,    39,    40,    41,
      42,    43,    44,    45,    46,    47,   119,   102,     9,   104,
      52,    53,    54,    55,    35,    36,   106,    35,    36,   156,
     156,    39,   225,   118,    36,    43,    47,   102,    44,    47,
     120,    96,    97,    98,   255,   100,   101,   127,     4,   129,
      56,    35,   349,   350,   351,    39,    35,    36,   103,    43,
     140,   420,   255,    47,   144,   129,   102,   255,    47,   257,
     263,   102,   260,   105,    37,   327,   140,     4,    36,    36,
     160,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    35,    36,   278,    36,    36,   105,   282,    37,
     107,   294,   286,   311,    47,    48,    49,    50,    51,    36,
      37,    38,    39,    40,    41,    42,    38,   305,   107,    35,
      36,   418,   107,    39,   107,    36,   395,    43,   208,   255,
     427,    47,    36,   213,   322,    36,    37,    38,    39,    40,
      41,    42,     1,   331,   355,     4,     4,    96,    97,    98,
     338,   100,   101,   105,   102,   105,    15,    16,   105,   239,
     103,    20,    21,    22,    23,    24,    36,    26,    14,    28,
     106,    30,   106,    13,    56,   255,    35,    36,     4,    36,
      39,    40,    41,    42,    43,    44,    45,    46,    47,     4,
     105,     4,     4,    52,    53,    54,    55,   105,    54,    54,
     388,     4,   119,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,     4,   102,   298,     4,
       4,     4,    54,     4,     4,    23,   306,   420,    22,     4,
      32,     5,     6,     7,   361,   361,    10,    11,    12,    48,
      49,    50,    51,    17,     4,   106,   105,    21,    36,    37,
      38,    39,    40,    41,    42,   335,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,   349,
     350,   351,   102,     4,   107,   355,   108,   109,   110,    48,
      49,    50,    51,    56,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,   106,   426,
     426,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    25,   103,   106,    96,    27,
     107,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,   102,   107,    35,    36,   418,     4,
      39,   105,    41,     4,    43,     4,    45,   427,    47,     4,
     103,     4,   108,     4,   110,   111,   112,   113,   114,   115,
     116,   117,    35,     4,     4,     4,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    57,    58,    59,    60,    61,
      62,     4,     4,     4,     4,     4,     4,     4,     4,   102,
     102,    19,    29,     4,     4,    40,   140,   104,    13,   426,
     106,   236,   195,   335,   288,   423,   260,   427,   225,   233,
     340,   280,   284,   143,   255
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     7,    10,    11,
      12,    17,    21,   123,   124,   125,   126,   127,   128,   129,
     136,   139,   226,    36,    36,     4,     9,    36,    35,    36,
      47,   142,   238,   103,   137,    48,    49,    50,    51,   228,
       4,   122,   102,   102,   130,    37,   140,    36,   138,   238,
     238,   238,   238,   124,    36,    36,     3,     8,    47,   131,
     132,   143,   102,   104,   118,   170,   107,   107,   107,   107,
       4,   132,    36,    37,    38,    39,    40,    41,    42,   133,
     134,   135,   229,   232,   237,     4,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,   144,    36,    37,
      38,    36,    36,     4,   102,   141,   105,   105,   225,   105,
     135,   147,   142,    36,   145,    14,   148,   150,   106,   106,
     102,   106,    48,    49,    50,    51,   149,   234,    13,   151,
      36,   103,   146,   167,   234,   238,   203,    36,   238,     1,
       3,    15,    16,    20,    22,    23,    24,    26,    28,    30,
      36,    39,    43,    44,    45,    46,    47,    52,    53,    54,
      55,   105,   132,   152,   153,   154,   155,   156,   171,   172,
     173,   176,   177,   181,   182,   183,   192,   193,   194,   195,
     196,   197,   205,   206,   207,   208,   215,   216,   226,   227,
     235,   236,   237,   238,    43,   168,   169,   231,   232,   235,
     238,     4,    96,    97,    98,   100,   101,   204,    56,     4,
       4,   153,    36,   234,   228,    39,    43,   105,   193,   209,
     238,   209,     4,     4,     4,   105,    54,    54,   235,   238,
     200,   201,   202,   235,   175,   231,   231,     4,   209,   119,
       4,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,   107,   157,   166,   167,   104,
     170,   225,   238,   102,   178,   179,   238,     4,    36,   210,
     211,   212,   213,   214,   231,     4,     4,     4,    23,   217,
     218,   219,    22,   220,   221,   222,    32,   184,   185,   186,
     200,     4,     4,   106,   102,   203,    55,   102,   174,    57,
      58,    59,    60,    61,    62,   233,   174,    36,    41,    45,
     197,   198,   199,    35,    36,    47,    54,   108,   109,   110,
     158,   159,   164,   193,   230,   231,   232,   235,   236,     4,
     231,   107,   169,   235,     4,   102,    96,   180,    56,   106,
     102,   223,   214,    25,   219,   214,    27,   222,   214,    18,
      31,    34,   187,   186,   106,   107,   202,   238,   231,   238,
     209,   160,     4,   231,     4,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,   108,
     110,   111,   112,   113,   114,   115,   116,   117,   165,   167,
     231,     4,   179,   231,   212,    97,    99,   224,     4,     4,
       4,     4,     4,   197,   197,   197,     4,     4,   193,     4,
       4,   161,   162,   163,   229,   231,   225,     4,   102,   188,
      33,   177,   189,   190,   191,     4,   102,    19,   197,   202,
      29,   191,   163,   198,     4,     4
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
#line 321 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 36:
#line 379 "pir.y"
    { new_sub(lexer, (yyvsp[(2) - (2)].sval));  /* create a new sub node */ ;}
    break;

  case 37:
#line 380 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(4) - (5)].ival)); ;}
    break;

  case 41:
#line 390 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 42:
#line 391 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(1) - (2)].ival)); ;}
    break;

  case 43:
#line 394 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON; ;}
    break;

  case 44:
#line 395 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 45:
#line 396 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 46:
#line 397 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 47:
#line 398 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 48:
#line 399 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 49:
#line 400 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 50:
#line 401 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 51:
#line 402 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 52:
#line 403 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 53:
#line 404 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 62:
#line 421 "pir.y"
    { set_param_flag((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                                                      IF_NAMED_PARAM_SET_ALIAS((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                                                      /*
                                                      if (TEST_FLAG($3, PARAM_FLAG_NAMED)) {
                                                        set_param_named($2, lexer->temp_flag_arg1);
                                                      }
                                                      */
                                                    ;}
    break;

  case 63:
#line 431 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 64:
#line 432 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval));   /* add a new parameter */
                                              set_param_named((yyval.targ), (yyvsp[(2) - (4)].sval));  /* set the :named flag */
                                            ;}
    break;

  case 66:
#line 441 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 68:
#line 446 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 69:
#line 447 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval));   ;}
    break;

  case 71:
#line 451 "pir.y"
    { ;}
    break;

  case 72:
#line 452 "pir.y"
    { ;}
    break;

  case 73:
#line 453 "pir.y"
    { ;}
    break;

  case 74:
#line 454 "pir.y"
    { ;}
    break;

  case 75:
#line 455 "pir.y"
    { ;}
    break;

  case 76:
#line 456 "pir.y"
    { ;}
    break;

  case 77:
#line 457 "pir.y"
    { ;}
    break;

  case 78:
#line 458 "pir.y"
    { ;}
    break;

  case 79:
#line 459 "pir.y"
    { ;}
    break;

  case 80:
#line 460 "pir.y"
    { ;}
    break;

  case 81:
#line 461 "pir.y"
    { ;}
    break;

  case 82:
#line 462 "pir.y"
    { ;}
    break;

  case 83:
#line 463 "pir.y"
    { yyerrok; ;}
    break;

  case 84:
#line 466 "pir.y"
    { set_instr(lexer, "null"); ;}
    break;

  case 85:
#line 467 "pir.y"
    { set_instr(lexer, "null"); ;}
    break;

  case 86:
#line 471 "pir.y"
    { set_instr(lexer, "get_results"); ;}
    break;

  case 88:
#line 492 "pir.y"
    { new_rhs(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 89:
#line 493 "pir.y"
    { new_rhs(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].fixme), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 90:
#line 494 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 91:
#line 497 "pir.y"
    { new_rhs(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 92:
#line 498 "pir.y"
    { new_rhs(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 93:
#line 499 "pir.y"
    { new_rhs(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 94:
#line 500 "pir.y"
    { new_rhs(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].fixme)); ;}
    break;

  case 96:
#line 504 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 97:
#line 505 "pir.y"
    { (yyval.fixme) = 0; ;}
    break;

  case 103:
#line 519 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 104:
#line 520 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 105:
#line 521 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 106:
#line 524 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 107:
#line 525 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 108:
#line 526 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 109:
#line 527 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 110:
#line 528 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 111:
#line 529 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 112:
#line 530 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 113:
#line 531 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 114:
#line 532 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 115:
#line 533 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 116:
#line 534 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 117:
#line 535 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 118:
#line 536 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 119:
#line 537 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 120:
#line 538 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 121:
#line 539 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 122:
#line 540 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 123:
#line 541 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 124:
#line 542 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 125:
#line 543 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 126:
#line 544 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 127:
#line 545 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 128:
#line 546 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 129:
#line 550 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 130:
#line 551 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 131:
#line 552 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 132:
#line 553 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 133:
#line 554 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 134:
#line 555 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 135:
#line 556 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 136:
#line 557 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 137:
#line 558 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 138:
#line 559 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 139:
#line 560 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 140:
#line 561 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 141:
#line 562 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 142:
#line 563 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 143:
#line 566 "pir.y"
    {  ;}
    break;

  case 149:
#line 582 "pir.y"
    { /* add $4 as argument, and set a flag if $1 is "unless" */
                         if ((yyvsp[(1) - (5)].ival) > 0) { /* it was "unless", so we need to "invert" the opcode */
                            invert_instr(lexer);
                         }

                       ;}
    break;

  case 150:
#line 589 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval)); ;}
    break;

  case 151:
#line 592 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 152:
#line 593 "pir.y"
    { (yyval.ival) = 1; /* yes, the opname should be inverted. */ ;}
    break;

  case 153:
#line 597 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 154:
#line 598 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 157:
#line 606 "pir.y"
    { set_instr(lexer, "if");
                                                             /* set $1 as argument */
                                                           ;}
    break;

  case 158:
#line 609 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                                                             /* set $1 and $3 as arguments */
                                                           ;}
    break;

  case 159:
#line 615 "pir.y"
    { set_instr(lexer, "branch"); ;}
    break;

  case 163:
#line 625 "pir.y"
    { declare_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 164:
#line 628 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 165:
#line 629 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 169:
#line 647 "pir.y"
    { /* $4 contains a invocation object */
                                                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                                                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                                                              (yyval.fixme) = NULL;
                                                            ;}
    break;

  case 170:
#line 654 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 171:
#line 655 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 172:
#line 658 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 173:
#line 659 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 174:
#line 662 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 175:
#line 665 "pir.y"
    { (yyval.invo) = invoke(CALL_PCC, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 176:
#line 666 "pir.y"
    { (yyval.invo) = invoke(CALL_NCI, (yyvsp[(2) - (2)].sval), NULL); ;}
    break;

  case 177:
#line 668 "pir.y"
    { (yyval.invo) = invoke(CALL_METH, (yyvsp[(2) - (5)].sval), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 178:
#line 671 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 179:
#line 672 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 180:
#line 677 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 181:
#line 678 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 182:
#line 681 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 183:
#line 682 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 184:
#line 685 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 185:
#line 686 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 186:
#line 690 "pir.y"
    { set_invocation_results((yyvsp[(5) - (6)].invo), (yyvsp[(2) - (6)].targ)); ;}
    break;

  case 187:
#line 692 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 188:
#line 694 "pir.y"
    { set_invocation_results((yyvsp[(1) - (2)].invo), NULL); ;}
    break;

  case 191:
#line 702 "pir.y"
    { (yyval.invo) = invoke(CALL_METH, (yyvsp[(1) - (4)].sval), (yyvsp[(3) - (4)].sval));
                                                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                                                            ;}
    break;

  case 192:
#line 708 "pir.y"
    { (yyval.invo) = invoke(CALL_PCC, (yyvsp[(1) - (2)].sval), NULL);
                                                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                                                            ;}
    break;

  case 196:
#line 718 "pir.y"
    { /* todo */ ;}
    break;

  case 197:
#line 719 "pir.y"
    { /* todo */ ;}
    break;

  case 201:
#line 727 "pir.y"
    { /* todo */ ;}
    break;

  case 202:
#line 728 "pir.y"
    { /* todo */ ;}
    break;

  case 203:
#line 731 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 204:
#line 732 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 205:
#line 735 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 206:
#line 736 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 207:
#line 739 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                                                    set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                                                    /* get the :named argument if necessary */
                                                    IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                                                    /*
                                                    if (TEST_FLAG($2, PARAM_FLAG_NAMED)) {
                                                        set_param_named($1, lexer->temp_flag_arg1);
                                                    }
                                                    */
                                                  ;}
    break;

  case 208:
#line 751 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 209:
#line 752 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 210:
#line 755 "pir.y"
    { (yyval.ival) = PARAM_FLAG_OPTIONAL; ;}
    break;

  case 211:
#line 756 "pir.y"
    { (yyval.ival) = PARAM_FLAG_OPT_FLAG; ;}
    break;

  case 212:
#line 757 "pir.y"
    { (yyval.ival) = PARAM_FLAG_SLURPY; ;}
    break;

  case 213:
#line 758 "pir.y"
    { (yyval.ival) = PARAM_FLAG_UNIQUE_REG; ;}
    break;

  case 214:
#line 759 "pir.y"
    { STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                                    (yyval.ival) = PARAM_FLAG_NAMED;
                                                  ;}
    break;

  case 219:
#line 775 "pir.y"
    { (yyval.fixme) = invoke(CALL_RET, NULL, NULL);
                                                             set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                                                           ;}
    break;

  case 220:
#line 778 "pir.y"
    { set_invocation_flag((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 221:
#line 781 "pir.y"
    { (yyval.invo) = invoke(CALL_YIELD, NULL, NULL);
                                                             set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                                                           ;}
    break;

  case 222:
#line 786 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 223:
#line 789 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 224:
#line 790 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 225:
#line 793 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 226:
#line 794 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 229:
#line 801 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                                             set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                                                           ;}
    break;

  case 230:
#line 806 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                                                             set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                                                             IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                                                           ;}
    break;

  case 231:
#line 816 "pir.y"
    { (yyval.invo) = invoke(CALL_RET, NULL, NULL);
                                                             set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                                                           ;}
    break;

  case 232:
#line 823 "pir.y"
    { (yyval.invo) = invoke(CALL_YIELD, NULL, NULL);
                                                             set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                                                           ;}
    break;

  case 233:
#line 828 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 234:
#line 829 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 235:
#line 833 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 236:
#line 834 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 237:
#line 838 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 238:
#line 841 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 239:
#line 842 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 240:
#line 845 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 241:
#line 846 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 242:
#line 849 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 243:
#line 853 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 244:
#line 854 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 245:
#line 857 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 246:
#line 858 "pir.y"
    { STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                                             (yyval.ival) = ARG_FLAG_NAMED;
                                                           ;}
    break;

  case 247:
#line 863 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 248:
#line 864 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 249:
#line 867 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), 0);  ;}
    break;

  case 251:
#line 871 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), 1);  ;}
    break;

  case 252:
#line 874 "pir.y"
    { (yyval.constval) = new_iconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 253:
#line 875 "pir.y"
    { (yyval.constval) = new_nconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 254:
#line 876 "pir.y"
    { (yyval.constval) = new_pconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 255:
#line 877 "pir.y"
    { (yyval.constval) = new_sconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 258:
#line 885 "pir.y"
    { (yyval.expr) = expr_from_constant((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 259:
#line 886 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 260:
#line 887 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 261:
#line 890 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 262:
#line 891 "pir.y"
    { (yyval.expr) = expr_from_constant((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 263:
#line 894 "pir.y"
    { (yyval.constval) = new_sconst(NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 264:
#line 895 "pir.y"
    { (yyval.constval) = new_iconst(NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 265:
#line 896 "pir.y"
    { (yyval.constval) = new_nconst(NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 266:
#line 899 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 267:
#line 900 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 268:
#line 901 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 269:
#line 902 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 270:
#line 903 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 271:
#line 904 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 272:
#line 907 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 273:
#line 908 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 274:
#line 909 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 275:
#line 910 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 276:
#line 913 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 277:
#line 914 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 278:
#line 917 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 279:
#line 918 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 280:
#line 919 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 281:
#line 920 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 283:
#line 924 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 284:
#line 925 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 285:
#line 926 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 286:
#line 927 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3149 "pirparser.c"
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


#line 935 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


