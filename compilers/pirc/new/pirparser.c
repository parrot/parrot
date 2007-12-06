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
     TK_PASM_PREG = 292,
     TK_PASM_NREG = 293,
     TK_PASM_SREG = 294,
     TK_PASM_IREG = 295,
     TK_SYM_PREG = 296,
     TK_SYM_NREG = 297,
     TK_SYM_SREG = 298,
     TK_SYM_IREG = 299,
     TK_PARROT_OP = 300,
     TK_INT = 301,
     TK_NUM = 302,
     TK_PMC = 303,
     TK_STRING = 304,
     TK_IF = 305,
     TK_UNLESS = 306,
     TK_NULL = 307,
     TK_GOTO = 308,
     TK_ARROW = 309,
     TK_NE = 310,
     TK_EQ = 311,
     TK_LT = 312,
     TK_LE = 313,
     TK_GT = 314,
     TK_GE = 315,
     TK_USHIFT = 316,
     TK_RSHIFT = 317,
     TK_LSHIFT = 318,
     TK_FDIV = 319,
     TK_OR = 320,
     TK_AND = 321,
     TK_XOR = 322,
     TK_CONC = 323,
     TK_ASSIGN_USHIFT = 324,
     TK_ASSIGN_RSHIFT = 325,
     TK_ASSIGN_LSHIFT = 326,
     TK_ASSIGN_INC = 327,
     TK_ASSIGN_DEC = 328,
     TK_ASSIGN_MUL = 329,
     TK_ASSIGN_MOD = 330,
     TK_ASSIGN_POW = 331,
     TK_ASSIGN_DIV = 332,
     TK_ASSIGN_BOR = 333,
     TK_ASSIGN_BAND = 334,
     TK_ASSIGN_FDIV = 335,
     TK_ASSIGN_BNOT = 336,
     TK_ASSIGN_CONC = 337,
     TK_FLAG_INIT = 338,
     TK_FLAG_LOAD = 339,
     TK_FLAG_MAIN = 340,
     TK_FLAG_ANON = 341,
     TK_FLAG_METHOD = 342,
     TK_FLAG_OUTER = 343,
     TK_FLAG_VTABLE = 344,
     TK_FLAG_LEX = 345,
     TK_FLAG_MULTI = 346,
     TK_FLAG_POSTCOMP = 347,
     TK_FLAG_IMMEDIATE = 348,
     TK_FLAG_UNIQUE_REG = 349,
     TK_FLAG_NAMED = 350,
     TK_FLAG_SLURPY = 351,
     TK_FLAG_FLAT = 352,
     TK_FLAG_OPTIONAL = 353,
     TK_FLAG_OPT_FLAG = 354
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
#define TK_PASM_PREG 292
#define TK_PASM_NREG 293
#define TK_PASM_SREG 294
#define TK_PASM_IREG 295
#define TK_SYM_PREG 296
#define TK_SYM_NREG 297
#define TK_SYM_SREG 298
#define TK_SYM_IREG 299
#define TK_PARROT_OP 300
#define TK_INT 301
#define TK_NUM 302
#define TK_PMC 303
#define TK_STRING 304
#define TK_IF 305
#define TK_UNLESS 306
#define TK_NULL 307
#define TK_GOTO 308
#define TK_ARROW 309
#define TK_NE 310
#define TK_EQ 311
#define TK_LT 312
#define TK_LE 313
#define TK_GT 314
#define TK_GE 315
#define TK_USHIFT 316
#define TK_RSHIFT 317
#define TK_LSHIFT 318
#define TK_FDIV 319
#define TK_OR 320
#define TK_AND 321
#define TK_XOR 322
#define TK_CONC 323
#define TK_ASSIGN_USHIFT 324
#define TK_ASSIGN_RSHIFT 325
#define TK_ASSIGN_LSHIFT 326
#define TK_ASSIGN_INC 327
#define TK_ASSIGN_DEC 328
#define TK_ASSIGN_MUL 329
#define TK_ASSIGN_MOD 330
#define TK_ASSIGN_POW 331
#define TK_ASSIGN_DIV 332
#define TK_ASSIGN_BOR 333
#define TK_ASSIGN_BAND 334
#define TK_ASSIGN_FDIV 335
#define TK_ASSIGN_BNOT 336
#define TK_ASSIGN_CONC 337
#define TK_FLAG_INIT 338
#define TK_FLAG_LOAD 339
#define TK_FLAG_MAIN 340
#define TK_FLAG_ANON 341
#define TK_FLAG_METHOD 342
#define TK_FLAG_OUTER 343
#define TK_FLAG_VTABLE 344
#define TK_FLAG_LEX 345
#define TK_FLAG_MULTI 346
#define TK_FLAG_POSTCOMP 347
#define TK_FLAG_IMMEDIATE 348
#define TK_FLAG_UNIQUE_REG 349
#define TK_FLAG_NAMED 350
#define TK_FLAG_SLURPY 351
#define TK_FLAG_FLAT 352
#define TK_FLAG_OPTIONAL 353
#define TK_FLAG_OPT_FLAG 354




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

#define IS_PASM_REG     1

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
#line 84 "pir.y"
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
#line 391 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 404 "pirparser.c"

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
#define YYLAST   506

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  118
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  116
/* YYNRULES -- Number of rules.  */
#define YYNRULES  279
/* YYNRULES -- Number of states.  */
#define YYNSTATES  421

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   355

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   109,     2,     2,     2,   114,   116,     2,
     103,   104,   113,   111,   100,   108,   107,   112,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   106,
       2,   105,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   101,     2,   102,     2,     2,     2,     2,     2,     2,
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
      95,    96,    97,    98,    99,   117
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    30,    34,    37,    42,    47,    50,
      51,    55,    57,    61,    62,    63,    73,    75,    77,    78,
      81,    83,    85,    87,    89,    91,    93,    95,    97,   102,
     107,   110,   111,   115,   117,   119,   121,   123,   124,   127,
     132,   135,   140,   141,   142,   146,   149,   152,   154,   156,
     158,   160,   162,   164,   166,   168,   170,   172,   174,   176,
     178,   180,   183,   187,   192,   196,   199,   203,   206,   210,
     213,   216,   218,   222,   225,   227,   228,   232,   233,   235,
     238,   240,   241,   245,   247,   249,   253,   255,   259,   261,
     263,   265,   271,   277,   279,   281,   284,   287,   289,   291,
     293,   297,   301,   306,   308,   312,   315,   316,   318,   324,
     326,   328,   337,   338,   340,   342,   345,   349,   353,   356,
     362,   363,   366,   367,   369,   371,   374,   378,   380,   385,
     390,   393,   395,   397,   402,   405,   407,   409,   411,   413,
     415,   417,   419,   421,   423,   425,   428,   432,   434,   438,
     441,   442,   445,   447,   449,   451,   453,   456,   458,   460,
     462,   464,   468,   472,   476,   480,   481,   483,   485,   489,
     491,   493,   497,   500,   506,   512,   513,   515,   517,   520,
     524,   525,   527,   529,   532,   536,   537,   540,   542,   545,
     546,   550,   553,   556,   560,   565,   570,   575,   580,   582,
     584,   586,   588,   590,   592,   594,   596,   598,   600,   602,
     604,   606,   608,   610,   612,   614,   616,   618,   620,   622,
     624,   626,   628,   630,   632,   634,   636,   638,   640,   642,
     644,   646,   648,   650,   652,   654,   656,   658,   660,   662,
     664,   666,   668,   670,   672,   674,   676,   678,   680,   682,
     684,   686,   688,   690,   692,   694,   696,   698,   700,   702,
     704,   706,   708,   710,   712,   714,   716,   718,   720,   722
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     119,     0,    -1,   120,   121,   120,    -1,    -1,     4,    -1,
     122,    -1,   121,     4,   122,    -1,   130,    -1,   218,    -1,
     127,    -1,   125,    -1,   126,    -1,   124,    -1,   123,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,   100,
      34,    -1,     6,    34,   100,    34,    -1,    15,   128,    -1,
      -1,   101,   129,   102,    -1,    34,    -1,   129,   162,    34,
      -1,    -1,    -1,    10,   133,   131,   134,     4,   132,   138,
     141,    11,    -1,   230,    -1,    34,    -1,    -1,   134,   135,
      -1,    86,    -1,    83,    -1,    84,    -1,    85,    -1,    87,
      -1,    90,    -1,    92,    -1,    93,    -1,    91,   103,   136,
     104,    -1,    88,   103,   133,   104,    -1,    89,   217,    -1,
      -1,   136,   100,   137,    -1,   230,    -1,    34,    -1,   159,
      -1,   226,    -1,    -1,   138,   139,    -1,    12,   140,   195,
       4,    -1,   226,   230,    -1,   226,    34,    54,   230,    -1,
      -1,    -1,   141,   142,   143,    -1,     3,     4,    -1,     3,
     144,    -1,   144,    -1,   163,    -1,   168,    -1,   169,    -1,
     173,    -1,   219,    -1,   197,    -1,   198,    -1,   174,    -1,
     149,    -1,   148,    -1,   147,    -1,   146,    -1,   145,    -1,
       1,     4,    -1,    52,   227,     4,    -1,   227,   105,    52,
       4,    -1,    28,   192,     4,    -1,   152,     4,    -1,   227,
     150,     4,    -1,   233,   223,    -1,   159,   105,   223,    -1,
     105,   151,    -1,   231,   223,    -1,   222,    -1,   223,   232,
     223,    -1,   227,   159,    -1,   152,    -1,    -1,    45,   153,
     154,    -1,    -1,   155,    -1,   156,   157,    -1,   221,    -1,
      -1,   157,   100,   158,    -1,   221,    -1,   159,    -1,   101,
     160,   102,    -1,   161,    -1,   160,   162,   161,    -1,   223,
      -1,   106,    -1,   100,    -1,   164,   167,   166,   230,     4,
      -1,   165,   223,   166,   230,     4,    -1,    50,    -1,    51,
      -1,    50,    52,    -1,    51,    52,    -1,    53,    -1,   100,
      -1,   223,    -1,   223,   225,   223,    -1,    53,   230,     4,
      -1,    14,   226,   170,     4,    -1,   171,    -1,   170,   100,
     171,    -1,   230,   172,    -1,    -1,    94,    -1,    13,    34,
     100,   227,     4,    -1,   175,    -1,   184,    -1,    26,     4,
     176,   179,     4,   181,    27,     4,    -1,    -1,   177,    -1,
     178,    -1,   177,   178,    -1,    30,   206,     4,    -1,    29,
     190,   180,    -1,    32,   190,    -1,    16,   190,     4,    17,
     189,    -1,    -1,   100,   190,    -1,    -1,   182,    -1,   183,
      -1,   182,   183,    -1,    31,   194,     4,    -1,   169,    -1,
     192,   105,   185,     4,    -1,   227,   105,   185,     4,    -1,
     185,     4,    -1,   187,    -1,   186,    -1,   190,   107,   189,
     201,    -1,   188,   201,    -1,   190,    -1,    34,    -1,   190,
      -1,   191,    -1,   230,    -1,    41,    -1,    37,    -1,    34,
      -1,    43,    -1,    39,    -1,   103,   104,    -1,   103,   193,
     104,    -1,   194,    -1,   193,   100,   194,    -1,   227,   195,
      -1,    -1,   195,   196,    -1,    98,    -1,    99,    -1,    96,
      -1,    94,    -1,    95,   217,    -1,   199,    -1,   207,    -1,
     200,    -1,   208,    -1,    20,   201,     4,    -1,    20,   185,
       4,    -1,    21,   201,     4,    -1,   103,   202,   104,    -1,
      -1,   203,    -1,   204,    -1,   203,   100,   204,    -1,   206,
      -1,   205,    -1,    34,    54,   223,    -1,   223,   215,    -1,
      24,     4,   212,    25,     4,    -1,    22,     4,   209,    23,
       4,    -1,    -1,   210,    -1,   211,    -1,   210,   211,    -1,
      21,   206,     4,    -1,    -1,   213,    -1,   214,    -1,   213,
     214,    -1,    20,   206,     4,    -1,    -1,   215,   216,    -1,
      97,    -1,    95,   217,    -1,    -1,   103,    34,   104,    -1,
      19,   220,    -1,   218,     4,    -1,    18,   220,     4,    -1,
      46,   230,   105,    35,    -1,    47,   230,   105,    36,    -1,
      48,   230,   105,    34,    -1,    49,   230,   105,    34,    -1,
     223,    -1,   224,    -1,   228,    -1,    33,    -1,   227,    -1,
     224,    -1,    34,    -1,    35,    -1,    36,    -1,    55,    -1,
      56,    -1,    57,    -1,    58,    -1,    60,    -1,    59,    -1,
      46,    -1,    47,    -1,    48,    -1,    49,    -1,   228,    -1,
     230,    -1,    41,    -1,    42,    -1,    44,    -1,    43,    -1,
     229,    -1,    37,    -1,    38,    -1,    40,    -1,    39,    -1,
      33,    -1,    45,    -1,   108,    -1,   109,    -1,   110,    -1,
     111,    -1,   108,    -1,   112,    -1,   113,    -1,   114,    -1,
     115,    -1,   116,    -1,   110,    -1,   117,    -1,    68,    -1,
      61,    -1,    62,    -1,    63,    -1,    65,    -1,    66,    -1,
      64,    -1,    67,    -1,    56,    -1,    58,    -1,    57,    -1,
      60,    -1,    59,    -1,    55,    -1,    72,    -1,    73,    -1,
      74,    -1,    75,    -1,    76,    -1,    77,    -1,    80,    -1,
      78,    -1,    79,    -1,    81,    -1,    82,    -1,    70,    -1,
      71,    -1,    69,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   324,   324,   329,   330,   333,   334,   337,   338,   339,
     340,   341,   342,   343,   346,   349,   354,   357,   363,   366,
     367,   370,   371,   376,   377,   376,   383,   384,   387,   388,
     391,   392,   393,   394,   395,   396,   397,   398,   399,   400,
     401,   404,   405,   408,   409,   410,   411,   414,   415,   418,
     423,   424,   430,   431,   431,   436,   437,   438,   441,   442,
     443,   444,   445,   446,   447,   448,   449,   450,   451,   452,
     453,   456,   464,   467,   472,   477,   480,   497,   498,   499,
     502,   503,   504,   505,   506,   510,   510,   514,   515,   518,
     522,   526,   527,   530,   531,   534,   537,   538,   541,   544,
     545,   549,   556,   563,   564,   568,   569,   572,   573,   577,
     580,   587,   592,   595,   596,   599,   602,   603,   608,   612,
     613,   616,   628,   629,   632,   633,   636,   639,   640,   641,
     645,   646,   651,   652,   655,   656,   659,   660,   663,   665,
     667,   672,   673,   676,   682,   687,   688,   691,   692,   695,
     696,   697,   700,   701,   702,   705,   706,   709,   710,   713,
     720,   721,   724,   725,   726,   727,   728,   736,   737,   740,
     741,   744,   747,   750,   755,   758,   759,   762,   763,   766,
     767,   770,   775,   783,   790,   797,   798,   802,   803,   807,
     810,   811,   814,   815,   818,   822,   823,   826,   827,   832,
     833,   836,   839,   840,   843,   844,   845,   846,   849,   853,
     854,   855,   858,   859,   862,   863,   864,   867,   868,   869,
     870,   871,   872,   875,   876,   877,   878,   881,   882,   885,
     886,   887,   888,   889,   892,   893,   894,   895,   898,   899,
     902,   903,   904,   907,   908,   909,   910,   911,   912,   913,
     914,   915,   916,   917,   918,   919,   920,   921,   922,   923,
     924,   925,   926,   927,   928,   929,   933,   934,   935,   936,
     937,   938,   939,   940,   941,   942,   943,   944,   945,   946
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
  "\"PMC register\"", "\"Number register\"", "\"String register\"",
  "\"Integer register\"", "\"Symbolic PMC register\"",
  "\"Symbolic number register\"", "\"Symbolic string register\"",
  "\"Symbolic integer register\"", "\"parrot op\"", "\"int\"", "\"num\"",
  "\"pmc\"", "\"string\"", "\"if\"", "\"unless\"", "\"null\"", "\"goto\"",
  "\"=>\"", "\"!=\"", "\"==\"", "\"<\"", "\"<=\"", "\">\"", "\">=\"",
  "\">>>\"", "\">>\"", "\"<<\"", "\"//\"", "\"||\"", "\"&&\"", "\"~~\"",
  "\".\"", "\">>>=\"", "\">>=\"", "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"",
  "\"%=\"", "\"**=\"", "\"/=\"", "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"",
  "\".=\"", "\":init\"", "\":load\"", "\":main\"", "\":anon\"",
  "\":method\"", "\":outer\"", "\":vtable\"", "\":lex\"", "\":multi\"",
  "\":postcomp\"", "\":immediate\"", "\":unique_reg\"", "\":named\"",
  "\":slurpy\"", "\":flat\"", "\":optional\"", "\":opt_flag\"", "','",
  "'['", "']'", "'('", "')'", "'='", "';'", "'.'", "'-'", "'!'", "'~'",
  "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"", "$accept", "program",
  "opt_nl", "compilation_units", "compilation_unit", "pir_pragma",
  "loadlib", "hll_specifier", "hll_mapping", "namespace_declaration",
  "opt_namespace_id", "namespace_id", "sub_definition", "@1", "@2",
  "sub_id", "sub_flags", "sub_flag", "multi_type_list", "multi_type",
  "parameters", "parameter", "param_def", "instructions", "@3",
  "instruction", "statement", "error_statement", "null_statement",
  "getresults_statement", "parrot_statement", "assignment_statement",
  "assignment_tail", "assignment_expression", "parrot_instruction", "@4",
  "opt_parrot_op_args", "parrot_op_args", "first_op_arg", "other_op_args",
  "other_op_arg", "keylist", "keys", "key", "separator",
  "conditional_statement", "if_type", "if_null_type", "then", "condition",
  "goto_statement", "local_declaration", "local_id_list", "local_id",
  "has_unique_reg", "lex_declaration", "invocation_statement",
  "long_invocation_statement", "opt_long_arguments", "long_arguments",
  "long_argument", "long_invocation", "opt_ret_cont", "opt_long_results",
  "long_results", "long_result", "short_invocation_statement",
  "simple_invocation", "methodcall", "subcall", "sub", "method",
  "invokable", "string_object", "opt_target_list", "target_list",
  "result_target", "param_flags", "param_flag", "return_statement",
  "yield_statement", "short_return_statement", "short_yield_statement",
  "arguments", "opt_arguments_list", "arguments_list", "argument",
  "named_arg", "short_arg", "long_return_statement",
  "long_yield_statement", "opt_yield_expressions", "yield_expressions",
  "yield_expression", "opt_return_expressions", "return_expressions",
  "return_expression", "arg_flags", "arg_flag", "opt_paren_string",
  "const_declaration", "const_decl_statement", "const_tail",
  "pasm_expression", "expression1", "expression", "constant", "rel_op",
  "type", "target", "reg", "pasm_reg", "identifier", "unop", "binop",
  "augmented_op", 0
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
      44,    91,    93,    40,    41,    61,    59,    46,    45,    33,
     126,    43,    47,    42,    37,   124,    38,   355
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   118,   119,   120,   120,   121,   121,   122,   122,   122,
     122,   122,   122,   122,   123,   124,   125,   126,   127,   128,
     128,   129,   129,   131,   132,   130,   133,   133,   134,   134,
     135,   135,   135,   135,   135,   135,   135,   135,   135,   135,
     135,   136,   136,   137,   137,   137,   137,   138,   138,   139,
     140,   140,   141,   142,   141,   143,   143,   143,   144,   144,
     144,   144,   144,   144,   144,   144,   144,   144,   144,   144,
     144,   145,   146,   146,   147,   148,   149,   150,   150,   150,
     151,   151,   151,   151,   151,   153,   152,   154,   154,   155,
     156,   157,   157,   158,   158,   159,   160,   160,   161,   162,
     162,   163,   163,   164,   164,   165,   165,   166,   166,   167,
     167,   168,   169,   170,   170,   171,   172,   172,   173,   174,
     174,   175,   176,   176,   177,   177,   178,   179,   179,   179,
     180,   180,   181,   181,   182,   182,   183,   183,   184,   184,
     184,   185,   185,   186,   187,   188,   188,   189,   189,   190,
     190,   190,   191,   191,   191,   192,   192,   193,   193,   194,
     195,   195,   196,   196,   196,   196,   196,   197,   197,   198,
     198,   199,   199,   200,   201,   202,   202,   203,   203,   204,
     204,   205,   206,   207,   208,   209,   209,   210,   210,   211,
     212,   212,   213,   213,   214,   215,   215,   216,   216,   217,
     217,   218,   219,   219,   220,   220,   220,   220,   221,   222,
     222,   222,   223,   223,   224,   224,   224,   225,   225,   225,
     225,   225,   225,   226,   226,   226,   226,   227,   227,   228,
     228,   228,   228,   228,   229,   229,   229,   229,   230,   230,
     231,   231,   231,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   233,   233,   233,   233,   233
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     3,     2,     4,     4,     2,     0,
       3,     1,     3,     0,     0,     9,     1,     1,     0,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     4,
       2,     0,     3,     1,     1,     1,     1,     0,     2,     4,
       2,     4,     0,     0,     3,     2,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     2,     3,     4,     3,     2,     3,     2,     3,     2,
       2,     1,     3,     2,     1,     0,     3,     0,     1,     2,
       1,     0,     3,     1,     1,     3,     1,     3,     1,     1,
       1,     5,     5,     1,     1,     2,     2,     1,     1,     1,
       3,     3,     4,     1,     3,     2,     0,     1,     5,     1,
       1,     8,     0,     1,     1,     2,     3,     3,     2,     5,
       0,     2,     0,     1,     1,     2,     3,     1,     4,     4,
       2,     1,     1,     4,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     2,     3,     1,     3,     2,
       0,     2,     1,     1,     1,     1,     2,     1,     1,     1,
       1,     3,     3,     3,     3,     0,     1,     1,     3,     1,
       1,     3,     2,     5,     5,     0,     1,     1,     2,     3,
       0,     1,     1,     2,     3,     0,     2,     1,     2,     0,
       3,     2,     2,     3,     4,     4,     4,     4,     1,     1,
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
      19,     0,     3,     5,    13,    12,    10,    11,     9,     7,
       8,     0,     0,     0,    15,   238,    27,   239,    23,    26,
       0,    18,     0,     0,     0,     0,   201,     4,     2,     0,
       0,    14,    28,    21,     0,     0,     0,     0,     0,     6,
      16,    17,     0,   100,    20,    99,     0,     0,     0,     0,
       0,    24,    31,    32,    33,    30,    34,     0,   199,    35,
       0,    36,    37,    29,    22,   204,   205,   206,   207,    47,
       0,     0,    40,    41,    52,     0,     0,     0,     0,    48,
      53,    39,   200,     0,    38,   223,   224,   225,   226,   160,
       0,    25,     0,    44,     0,    42,    45,    46,    43,     0,
       0,    50,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   146,   234,   235,   237,   236,   229,   230,
     232,   231,   239,   103,   104,     0,     0,     0,    54,    57,
      70,    69,    68,    67,    66,     0,    58,     0,     0,    59,
      60,    61,    65,   119,   120,     0,   142,   141,     0,   145,
       0,    63,    64,   167,   169,   168,   170,     0,    62,     0,
     227,   233,   228,   214,   215,   216,   234,   229,     0,    96,
      98,   213,   212,   228,    49,   165,   199,   164,   162,   163,
     161,     0,    71,    55,    56,     0,     0,     0,   151,   150,
     175,     0,     0,   149,     0,   185,   190,   122,     0,    87,
     105,   106,     0,     0,   155,     0,   157,   160,    75,     0,
     109,     0,   140,   144,     0,     0,   202,   279,   277,   278,
     266,   267,   268,   269,   270,   271,   273,   274,   272,   275,
     276,     0,     0,     0,     0,    95,     0,   166,    51,     0,
       0,   113,   116,   203,   214,     0,   176,   177,   180,   179,
     195,   172,   171,   173,     0,     0,   186,   187,     0,     0,
     191,   192,     0,     0,   123,   124,    74,    86,    88,    91,
      90,   208,    72,   111,     0,   156,   159,   107,   108,     0,
     217,   218,   219,   220,   222,   221,     0,     0,   152,   154,
     153,     0,   147,   148,     0,   238,   214,     0,   240,   241,
     242,    79,    84,     0,    81,     0,   213,   212,   227,     0,
      76,     0,    77,    97,     0,   112,     0,   117,   115,     0,
     174,     0,   182,     0,     0,   188,     0,     0,   193,     0,
       0,     0,     0,     0,   125,    89,   158,     0,   110,     0,
     143,   138,    73,   139,   265,   260,   262,   261,   264,   263,
     253,   254,   255,   258,   256,   257,   259,   252,   244,   250,
     243,   245,   246,   247,   248,   249,   251,     0,    83,    80,
      78,   118,   114,   181,   178,   199,   197,   196,   189,   184,
     194,   183,   126,     0,   130,   128,   132,     0,   101,   102,
      82,   198,     0,     0,   127,     0,   137,     0,   133,   134,
      92,    94,    93,     0,   131,     0,     0,   135,   129,   136,
     121
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      31,    44,    19,    42,    79,    28,    52,    73,    87,   105,
      84,    89,    99,    90,   102,   138,   139,   140,   141,   142,
     143,   144,   242,   311,   145,   209,   277,   278,   279,   345,
     410,   106,   178,   179,    56,   146,   147,   148,   289,   219,
     149,   150,   250,   251,   328,   151,   152,   153,   273,   274,
     275,   343,   404,   407,   408,   409,   154,   155,   156,   157,
     158,   301,   159,   303,   160,   215,   216,   109,   190,   161,
     162,   163,   164,   202,   255,   256,   257,   258,   259,   165,
     166,   265,   266,   267,   269,   270,   271,   332,   387,    82,
      20,   168,    36,   280,   314,   260,   181,   296,   100,   182,
     170,   171,   183,   319,   377,   244
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -360
static const yytype_int16 yypact[] =
{
      15,  -360,    20,    71,  -360,    19,    53,    87,    61,     9,
      10,   132,   121,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,    34,    35,   101,  -360,  -360,  -360,  -360,  -360,  -360,
     129,  -360,     5,     5,     5,     5,  -360,    71,  -360,   133,
     143,  -360,  -360,  -360,   -85,    60,    79,    81,    83,  -360,
    -360,  -360,    69,  -360,  -360,  -360,   155,   156,   130,   158,
     159,  -360,  -360,  -360,  -360,  -360,  -360,    93,    94,  -360,
      97,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
       9,   167,  -360,  -360,   190,   114,   116,   -86,   203,  -360,
     211,  -360,  -360,   165,  -360,  -360,  -360,  -360,  -360,  -360,
      76,  -360,   220,  -360,   448,  -360,  -360,  -360,  -360,     4,
     170,  -360,   221,   321,   192,   203,   132,    -6,   125,   225,
     226,   232,   134,  -360,   -52,  -360,  -360,  -360,   -18,  -360,
    -360,  -360,   392,   191,   193,   268,     5,   131,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,   243,  -360,   448,   448,  -360,
    -360,  -360,  -360,  -360,  -360,   251,  -360,  -360,   125,   160,
     151,  -360,  -360,  -360,  -360,  -360,  -360,   264,  -360,   375,
    -360,  -360,    -2,  -360,  -360,  -360,  -360,  -360,    12,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,    94,  -360,  -360,  -360,
    -360,     5,  -360,  -360,  -360,   169,     5,   270,  -360,  -360,
     461,   272,   273,  -360,   274,   258,   261,   252,   279,   448,
    -360,  -360,   280,   281,  -360,    46,  -360,  -360,  -360,   -31,
     149,   -31,  -360,  -360,   104,     7,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,    23,   282,   182,   448,  -360,   448,  -360,  -360,   268,
       6,  -360,   195,  -360,   236,   187,   194,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,   448,   269,   258,  -360,   448,   271,
     261,  -360,   448,     0,   252,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,   268,  -360,    21,  -360,  -360,     5,
    -360,  -360,  -360,  -360,  -360,  -360,   448,     5,  -360,  -360,
    -360,   125,  -360,  -360,   289,   293,   196,   294,  -360,  -360,
    -360,  -360,  -360,   296,  -360,   350,   298,   202,   310,   448,
    -360,   448,  -360,  -360,   311,  -360,     5,  -360,  -360,   448,
    -360,   461,    31,   312,   314,  -360,   315,   316,  -360,   317,
      37,    37,    37,   320,  -360,   227,  -360,   322,  -360,   324,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,  -360,   448,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,    94,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,   325,   230,  -360,    -1,   342,  -360,  -360,
    -360,  -360,   319,    37,  -360,   268,  -360,   323,    -1,  -360,
    -360,  -360,  -360,   104,  -360,   333,   334,  -360,  -360,  -360,
    -360
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -360,  -360,   332,  -360,   309,  -360,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,   276,  -360,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,  -360,  -360,   235,  -360,  -360,  -360,
    -360,  -360,  -360,  -360,   110,  -360,  -360,  -360,  -360,  -360,
    -360,  -166,  -360,   106,   175,  -360,  -360,  -360,   136,  -360,
    -360,  -359,  -360,    41,  -360,  -360,  -360,  -360,  -360,  -360,
      95,  -360,  -360,  -360,  -360,   -40,  -360,  -112,  -360,  -360,
    -360,   -43,  -218,  -360,   266,  -360,  -275,   172,  -360,  -360,
    -360,  -360,  -360,  -111,  -360,  -360,    59,  -360,  -176,  -360,
    -360,  -360,  -360,   126,  -360,  -360,   123,  -360,  -360,  -182,
     -30,  -360,   275,     1,  -360,  -102,   154,  -360,   -82,  -101,
     161,  -360,    -9,  -360,  -360,  -360
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -212
static const yytype_int16 yytable[] =
{
      29,   169,   180,   243,   247,   201,   302,   204,   184,   346,
     325,   107,   169,   115,    93,    53,   340,    54,    94,     1,
       4,    55,   287,    45,    46,    47,    48,    25,   123,   341,
     405,   198,   342,   196,   212,   199,   217,   406,    25,    27,
      25,   123,    25,    26,   198,   220,   221,   223,   199,   406,
      27,  -151,    27,    21,    27,  -151,   305,   306,   174,   175,
     124,   125,   126,   127,   128,   129,   130,   131,   132,   288,
      25,    29,   167,    61,   198,   307,     5,     6,   199,     7,
       8,     9,    27,   167,   108,  -150,    10,    22,   333,  -150,
      11,   111,   336,   172,    23,    24,   339,   200,   185,   186,
     187,  -149,   188,   189,   172,  -149,   326,   281,   203,    25,
     110,    30,    53,   304,   245,   185,   186,   187,    55,   188,
     189,    27,   393,   394,   395,    37,   385,   213,   386,   313,
     415,   308,   309,   310,    39,    40,    41,    25,   298,   315,
     317,   198,   322,   299,   180,   199,   284,   300,   324,    27,
     285,   378,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    43,    25,    57,    76,    50,   176,   125,
     126,   127,   177,   129,   130,   131,    27,    51,    32,    33,
      34,    35,   248,   217,    58,   414,    59,   252,    60,    74,
     350,    75,    77,    78,   348,   302,    80,    81,    25,   103,
      83,    86,    88,   401,   290,   291,   292,   293,   294,   295,
      27,    95,    96,    97,    98,   203,   203,   379,    91,   380,
      92,   112,   101,   113,   191,   192,   195,   383,   200,   205,
     206,   411,   172,   114,   115,   214,   207,   137,   116,    11,
     117,   118,   119,   210,   120,   211,   121,   218,   122,    95,
      96,    97,    98,    25,   123,   222,   225,   124,   125,   126,
     127,   128,   129,   130,   131,   132,   104,   224,   226,   249,
     133,   134,   135,   136,   253,   400,   261,   262,   263,   264,
     347,   268,   272,   276,   282,   283,   320,   321,   349,   327,
     329,   330,   334,   351,   331,   281,   337,  -211,   352,  -146,
     353,    25,  -209,   104,   217,   176,   125,   126,   127,   177,
     129,   130,   131,    27,  -210,   381,   388,   252,   389,   390,
     391,   392,   112,   137,   396,   193,   398,   397,   399,   402,
     403,   203,   203,   203,   114,   115,   413,   419,   420,   116,
      11,   117,   118,   119,    38,   120,    49,   121,   194,   122,
     416,   312,   323,   246,    25,   123,    85,   297,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   382,   417,   344,
     418,   133,   134,   135,   136,    25,   173,   174,   175,   176,
     125,   126,   127,   177,   129,   130,   131,    27,   208,   286,
     384,   197,   335,   338,   203,   316,   -85,     0,   412,     0,
       0,     0,   318,     0,   203,   354,   355,   356,   357,   358,
     359,   360,   361,   362,   363,   364,   365,   366,   367,     0,
       0,     0,     0,     0,   137,   -85,   -85,   -85,   -85,   -85,
     -85,   -85,   -85,   -85,   -85,   -85,   -85,   -85,     0,     0,
       0,     0,     0,   104,   227,   228,   229,   230,   231,   232,
     233,   234,   235,   236,   237,   238,   239,   240,   368,     0,
     369,   370,   371,   372,   373,   374,   375,   376,     0,     0,
       0,     0,     0,     0,     0,     0,   104,     0,     0,     0,
     241,    25,   173,   174,   175,   176,   125,   126,   127,   177,
     129,   130,   131,    27,    25,   254,   174,   175,   176,   125,
     126,   127,   177,   129,   130,   131,    27
};

static const yytype_int16 yycheck[] =
{
       9,   102,   104,   169,   186,   117,   224,   118,     4,   284,
       4,    93,   113,    14,   100,   100,    16,   102,   104,     4,
       0,   106,    53,    32,    33,    34,    35,    33,    34,    29,
      31,    37,    32,   115,   135,    41,   137,   396,    33,    45,
      33,    34,    33,    34,    37,   147,   148,   158,    41,   408,
      45,   103,    45,    34,    45,   107,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,   100,
      33,    80,   102,     4,    37,    52,     5,     6,    41,     8,
       9,    10,    45,   113,    93,   103,    15,    34,   264,   107,
      19,   100,   268,   102,     7,    34,   272,   103,    94,    95,
      96,   103,    98,    99,   113,   107,   100,   209,   117,    33,
      34,   101,   100,   225,   102,    94,    95,    96,   106,    98,
      99,    45,   340,   341,   342,     4,    95,   136,    97,   241,
     405,   108,   109,   110,   100,   100,    35,    33,    34,   241,
     241,    37,   244,    39,   246,    41,   100,    43,   249,    45,
     104,   317,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    34,    33,   105,    36,    34,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    34,    46,    47,
      48,    49,   191,   284,   105,   403,   105,   196,   105,    34,
     301,    35,    34,    34,   296,   413,   103,   103,    33,    34,
     103,    34,    12,   385,    55,    56,    57,    58,    59,    60,
      45,    46,    47,    48,    49,   224,   225,   319,   104,   321,
     104,     1,    11,     3,    54,     4,    34,   329,   103,     4,
       4,   397,   241,    13,    14,   104,     4,   103,    18,    19,
      20,    21,    22,    52,    24,    52,    26,     4,    28,    46,
      47,    48,    49,    33,    34,     4,   105,    37,    38,    39,
      40,    41,    42,    43,    44,    45,   101,   107,     4,   100,
      50,    51,    52,    53,     4,   377,     4,     4,     4,    21,
     289,    20,    30,     4,     4,     4,     4,   105,   297,    94,
      54,   104,    23,     4,   100,   397,    25,     4,     4,   103,
       4,    33,     4,   101,   405,    37,    38,    39,    40,    41,
      42,    43,    44,    45,     4,     4,     4,   326,     4,     4,
       4,     4,     1,   103,     4,     4,     4,   100,     4,     4,
     100,   340,   341,   342,    13,    14,    17,     4,     4,    18,
      19,    20,    21,    22,    12,    24,    37,    26,   113,    28,
      27,   241,   246,   178,    33,    34,    80,   221,    37,    38,
      39,    40,    41,    42,    43,    44,    45,   326,   408,   274,
     413,    50,    51,    52,    53,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,   122,   217,
     331,   116,   266,   270,   403,   241,     4,    -1,   397,    -1,
      -1,    -1,   241,    -1,   413,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    -1,
      -1,    -1,    -1,    -1,   103,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    -1,    -1,
      -1,    -1,    -1,   101,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,   108,    -1,
     110,   111,   112,   113,   114,   115,   116,   117,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
     105,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   119,   120,     0,     5,     6,     8,     9,    10,
      15,    19,   121,   122,   123,   124,   125,   126,   127,   130,
     218,    34,    34,     7,    34,    33,    34,    45,   133,   230,
     101,   128,    46,    47,    48,    49,   220,     4,   120,   100,
     100,    35,   131,    34,   129,   230,   230,   230,   230,   122,
      34,    34,   134,   100,   102,   106,   162,   105,   105,   105,
     105,     4,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,   135,    34,    35,    36,    34,    34,   132,
     103,   103,   217,   103,   138,   133,    34,   136,    12,   139,
     141,   104,   104,   100,   104,    46,    47,    48,    49,   140,
     226,    11,   142,    34,   101,   137,   159,   226,   230,   195,
      34,   230,     1,     3,    13,    14,    18,    20,    21,    22,
      24,    26,    28,    34,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    50,    51,    52,    53,   103,   143,   144,
     145,   146,   147,   148,   149,   152,   163,   164,   165,   168,
     169,   173,   174,   175,   184,   185,   186,   187,   188,   190,
     192,   197,   198,   199,   200,   207,   208,   218,   219,   227,
     228,   229,   230,    34,    35,    36,    37,    41,   160,   161,
     223,   224,   227,   230,     4,    94,    95,    96,    98,    99,
     196,    54,     4,     4,   144,    34,   226,   220,    37,    41,
     103,   185,   201,   230,   201,     4,     4,     4,   192,   153,
      52,    52,   227,   230,   104,   193,   194,   227,     4,   167,
     223,   223,     4,   201,   107,   105,     4,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,   105,   150,   159,   233,   102,   162,   217,   230,   100,
     170,   171,   230,     4,    34,   202,   203,   204,   205,   206,
     223,     4,     4,     4,    21,   209,   210,   211,    20,   212,
     213,   214,    30,   176,   177,   178,     4,   154,   155,   156,
     221,   223,     4,     4,   100,   104,   195,    53,   100,   166,
      55,    56,    57,    58,    59,    60,   225,   166,    34,    39,
      43,   189,   190,   191,   185,    33,    34,    52,   108,   109,
     110,   151,   152,   185,   222,   223,   224,   227,   228,   231,
       4,   105,   223,   161,   227,     4,   100,    94,   172,    54,
     104,   100,   215,   206,    23,   211,   206,    25,   214,   206,
      16,    29,    32,   179,   178,   157,   194,   230,   223,   230,
     201,     4,     4,     4,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,   108,   110,
     111,   112,   113,   114,   115,   116,   117,   232,   159,   223,
     223,     4,   171,   223,   204,    95,    97,   216,     4,     4,
       4,     4,     4,   190,   190,   190,     4,   100,     4,     4,
     223,   217,     4,   100,   180,    31,   169,   181,   182,   183,
     158,   159,   221,    17,   190,   194,    27,   183,   189,     4,
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
        case 14:
#line 346 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 349 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 354 "pir.y"
    { set_hll((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 17:
#line 357 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 366 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 367 "pir.y"
    { (yyval.fixme) = (yyvsp[(2) - (3)].fixme); ;}
    break;

  case 21:
#line 370 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 22:
#line 371 "pir.y"
    { ;}
    break;

  case 23:
#line 376 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 24:
#line 377 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(4) - (5)].ival)); ;}
    break;

  case 28:
#line 387 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 29:
#line 388 "pir.y"
    { (yyval.ival) |= (yyvsp[(2) - (2)].ival); ;}
    break;

  case 30:
#line 391 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 31:
#line 392 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 32:
#line 393 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 33:
#line 394 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 34:
#line 395 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 35:
#line 396 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 36:
#line 397 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 37:
#line 398 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 38:
#line 399 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 39:
#line 400 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 40:
#line 401 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 49:
#line 418 "pir.y"
    { set_param_flag((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                                                             IF_NAMED_PARAM_SET_ALIAS((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                                                           ;}
    break;

  case 50:
#line 423 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 51:
#line 424 "pir.y"
    { (yyval.targ) = add_param_named(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval), (yyvsp[(2) - (4)].sval)); ;}
    break;

  case 53:
#line 431 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 55:
#line 436 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 56:
#line 437 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 71:
#line 456 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                                  fprintf(stderr, "Too many errors. Compilation aborted.\n");
                                  exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                              }
                              yyerrok;
                            ;}
    break;

  case 72:
#line 464 "pir.y"
    { set_instr(lexer, "null");
                                                             add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                                                           ;}
    break;

  case 73:
#line 467 "pir.y"
    { set_instr(lexer, "null");
                                                             add_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                                                           ;}
    break;

  case 74:
#line 472 "pir.y"
    { set_instr(lexer, "get_results");
                                                             add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                                                           ;}
    break;

  case 76:
#line 480 "pir.y"
    { add_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 77:
#line 497 "pir.y"
    { assign(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 78:
#line 498 "pir.y"
    { assign(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 79:
#line 499 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 80:
#line 502 "pir.y"
    { assign(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 81:
#line 503 "pir.y"
    { assign(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 82:
#line 504 "pir.y"
    { assign(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 83:
#line 505 "pir.y"
    { assign(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 84:
#line 506 "pir.y"
    {  ;}
    break;

  case 85:
#line 510 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 90:
#line 522 "pir.y"
    { add_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 91:
#line 526 "pir.y"
    { /* nothing to do */;}
    break;

  case 92:
#line 527 "pir.y"
    { add_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 95:
#line 534 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 96:
#line 537 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 97:
#line 538 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 99:
#line 544 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 100:
#line 545 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 101:
#line 550 "pir.y"
    { /* it was "unless", so "invert" the opcode */
                                                             if ((yyvsp[(1) - (5)].ival) > 0) {
                                                                invert_instr(lexer);
                                                             }
                                                             add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                                                           ;}
    break;

  case 102:
#line 557 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval));
                                                             add_operand(lexer, (yyvsp[(2) - (5)].expr));
                                                             add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                                                           ;}
    break;

  case 103:
#line 563 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 104:
#line 564 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 105:
#line 568 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 106:
#line 569 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 109:
#line 577 "pir.y"
    { set_instr(lexer, "if");
                                                             add_operand(lexer, (yyvsp[(1) - (1)].expr));
                                                           ;}
    break;

  case 110:
#line 580 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                                                             add_operand(lexer, (yyvsp[(1) - (3)].expr));
                                                             add_operand(lexer, (yyvsp[(3) - (3)].expr));
                                                           ;}
    break;

  case 111:
#line 587 "pir.y"
    { set_instr(lexer, "branch");
                                                             add_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                                                           ;}
    break;

  case 112:
#line 592 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 113:
#line 595 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 114:
#line 596 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 115:
#line 599 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 116:
#line 602 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 117:
#line 603 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 118:
#line 608 "pir.y"
    { set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval)); ;}
    break;

  case 121:
#line 621 "pir.y"
    { /* $4 contains a invocation object */
                                                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                                                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                                                             (yyval.fixme) = NULL;
                                                           ;}
    break;

  case 122:
#line 628 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 123:
#line 629 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 124:
#line 632 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 125:
#line 633 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 126:
#line 636 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 127:
#line 639 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 128:
#line 640 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 129:
#line 642 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 130:
#line 645 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 131:
#line 646 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 132:
#line 651 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 133:
#line 652 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 134:
#line 655 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 135:
#line 656 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 136:
#line 659 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 137:
#line 660 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 138:
#line 664 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 139:
#line 666 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 140:
#line 668 "pir.y"
    { set_invocation_results((yyvsp[(1) - (2)].invo), NULL); ;}
    break;

  case 143:
#line 676 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                                                             set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                                                           ;}
    break;

  case 144:
#line 682 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                                                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                                                           ;}
    break;

  case 145:
#line 687 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 146:
#line 688 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 149:
#line 695 "pir.y"
    { (yyval.targ) = target_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 150:
#line 696 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 151:
#line 697 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 152:
#line 700 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 153:
#line 701 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 154:
#line 702 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 155:
#line 705 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 156:
#line 706 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 157:
#line 709 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 158:
#line 710 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 159:
#line 713 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                                                             set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                                                             /* get the :named argument if necessary */
                                                             IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                                                           ;}
    break;

  case 160:
#line 720 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 161:
#line 721 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 162:
#line 724 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 163:
#line 725 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 164:
#line 726 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 165:
#line 727 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 166:
#line 728 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                                                  STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                                           ;}
    break;

  case 171:
#line 744 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                                                             set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                                                           ;}
    break;

  case 172:
#line 747 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 173:
#line 750 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                                             set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                                                           ;}
    break;

  case 174:
#line 755 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 175:
#line 758 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 176:
#line 759 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 177:
#line 762 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 178:
#line 763 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 181:
#line 770 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                                             set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                                                           ;}
    break;

  case 182:
#line 775 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                                                             set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                                                             IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                                                           ;}
    break;

  case 183:
#line 785 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                                                             set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                                                           ;}
    break;

  case 184:
#line 792 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                                             set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                                                           ;}
    break;

  case 185:
#line 797 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 186:
#line 798 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 187:
#line 802 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 188:
#line 803 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 189:
#line 807 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 190:
#line 810 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 191:
#line 811 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 192:
#line 814 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 193:
#line 815 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 194:
#line 818 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 195:
#line 822 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 196:
#line 823 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 197:
#line 826 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 198:
#line 827 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                                                             STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                                           ;}
    break;

  case 199:
#line 832 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 200:
#line 833 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 201:
#line 836 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 203:
#line 840 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), GLOBALCONST); ;}
    break;

  case 204:
#line 843 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 205:
#line 844 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 206:
#line 845 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 207:
#line 846 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 209:
#line 853 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 210:
#line 854 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 211:
#line 855 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 212:
#line 858 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 213:
#line 859 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 214:
#line 862 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 215:
#line 863 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 216:
#line 864 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 217:
#line 867 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 218:
#line 868 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 219:
#line 869 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 220:
#line 870 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 221:
#line 871 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 222:
#line 872 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 223:
#line 875 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 224:
#line 876 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 225:
#line 877 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 226:
#line 878 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 227:
#line 881 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 228:
#line 882 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 229:
#line 885 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 230:
#line 886 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 231:
#line 887 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 232:
#line 888 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 234:
#line 892 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 235:
#line 893 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 236:
#line 894 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 237:
#line 895 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 240:
#line 902 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 241:
#line 903 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 242:
#line 904 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 243:
#line 907 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 244:
#line 908 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 245:
#line 909 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 246:
#line 910 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 247:
#line 911 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 248:
#line 912 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 249:
#line 913 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 250:
#line 914 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 251:
#line 915 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 252:
#line 916 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 253:
#line 917 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 254:
#line 918 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 255:
#line 919 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 256:
#line 920 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 257:
#line 921 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 258:
#line 922 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 259:
#line 923 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 260:
#line 924 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 261:
#line 925 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 262:
#line 926 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 263:
#line 927 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 264:
#line 928 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 265:
#line 929 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 266:
#line 933 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 267:
#line 934 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 268:
#line 935 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 269:
#line 936 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 270:
#line 937 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 271:
#line 938 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 272:
#line 939 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 273:
#line 940 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 274:
#line 941 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 275:
#line 942 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 276:
#line 943 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 277:
#line 944 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 278:
#line 945 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 279:
#line 946 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3208 "pirparser.c"
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


#line 948 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


