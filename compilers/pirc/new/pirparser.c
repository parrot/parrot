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

    struct constant *constval;
    struct instruction *instr;
    struct expression *expr;
    struct target *targ;
    struct argument *argm;
    void  *fixme;
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
#define YYLAST   491

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  116
/* YYNRULES -- Number of rules.  */
#define YYNRULES  283
/* YYNRULES -- Number of states.  */
#define YYNSTATES  435

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
     376,   384,   390,   392,   394,   397,   400,   402,   404,   408,
     413,   415,   419,   422,   423,   425,   431,   433,   435,   444,
     445,   448,   452,   456,   459,   465,   466,   469,   470,   473,
     478,   480,   487,   492,   495,   497,   499,   504,   507,   509,
     511,   513,   515,   517,   519,   521,   523,   525,   527,   528,
     530,   532,   536,   539,   540,   543,   545,   547,   549,   551,
     554,   556,   558,   560,   562,   566,   570,   574,   578,   579,
     581,   583,   587,   589,   591,   595,   598,   604,   610,   611,
     613,   615,   618,   622,   623,   625,   627,   630,   634,   635,
     638,   640,   643,   644,   648,   651,   654,   658,   663,   668,
     673,   678,   680,   682,   684,   686,   688,   690,   692,   694,
     696,   698,   700,   702,   704,   706,   708,   710,   712,   714,
     716,   718,   720,   722,   724,   726,   728,   730,   732,   734,
     736,   738,   740,   742
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     121,     0,    -1,   122,   123,   122,    -1,    -1,     4,    -1,
     124,    -1,   123,     4,   124,    -1,   139,    -1,   223,    -1,
     136,    -1,   129,    -1,   127,    -1,   128,    -1,   126,    -1,
     125,    -1,    10,     9,    37,    -1,    11,    36,    -1,     5,
      36,   102,    36,    -1,     6,    36,   102,    36,    -1,     7,
       4,   130,     8,    -1,    -1,   130,   131,    -1,     3,     4,
      -1,     3,   132,    -1,   132,    -1,    47,   133,     4,    -1,
      -1,   134,    -1,   135,    -1,   134,   102,   135,    -1,   226,
      -1,    17,   137,    -1,    -1,   103,   138,   104,    -1,    36,
      -1,   138,   170,    36,    -1,    -1,    -1,    12,   142,   140,
     143,     4,   141,   147,   150,    13,    -1,   235,    -1,    36,
      -1,    -1,   143,   144,    -1,    88,    -1,    85,    -1,    86,
      -1,    87,    -1,    89,    -1,    92,    -1,    94,    -1,    95,
      -1,    93,   105,   145,   106,    -1,    90,   105,   142,   106,
      -1,    91,   222,    -1,    -1,   145,   102,   146,    -1,   235,
      -1,    36,    -1,   167,    -1,   231,    -1,    -1,   147,   148,
      -1,    14,   149,   200,     4,    -1,   231,   235,    -1,   231,
      36,    56,   235,    -1,    -1,    -1,   150,   151,   152,    -1,
       3,     4,    -1,     3,   153,    -1,   153,    -1,   171,    -1,
     175,    -1,   176,    -1,   180,    -1,   224,    -1,   202,    -1,
     203,    -1,   181,    -1,   156,    -1,   132,    -1,   155,    -1,
     154,    -1,     1,     4,    -1,    54,   232,     4,    -1,   232,
     107,    54,     4,    -1,    30,   105,   197,   106,     4,    -1,
     232,   157,     4,    -1,   166,   228,    -1,   167,   107,   228,
      -1,   107,   158,    -1,   164,   228,    -1,   227,    -1,   228,
     165,   228,    -1,   232,   167,    -1,   159,    -1,    -1,    47,
     160,   161,    -1,    -1,   162,    -1,   163,    -1,   162,   102,
     163,    -1,   226,    -1,   108,    -1,   109,    -1,   110,    -1,
     111,    -1,   108,    -1,   112,    -1,   113,    -1,   114,    -1,
     115,    -1,   116,    -1,   110,    -1,   117,    -1,    70,    -1,
      63,    -1,    64,    -1,    65,    -1,    67,    -1,    68,    -1,
      66,    -1,    69,    -1,    58,    -1,    60,    -1,    59,    -1,
      62,    -1,    61,    -1,    57,    -1,    74,    -1,    75,    -1,
      76,    -1,    77,    -1,    78,    -1,    79,    -1,    82,    -1,
      80,    -1,    81,    -1,    83,    -1,    84,    -1,    72,    -1,
      73,    -1,    71,    -1,   103,   168,   104,    -1,   169,    -1,
     168,   170,   169,    -1,   228,    -1,   118,    -1,   102,    -1,
     172,   228,   174,   235,     4,    -1,   172,   228,   230,   228,
     174,   235,     4,    -1,   173,   228,   174,   235,     4,    -1,
      52,    -1,    53,    -1,    52,    54,    -1,    53,    54,    -1,
      55,    -1,   102,    -1,    55,   235,     4,    -1,    16,   231,
     177,     4,    -1,   178,    -1,   177,   102,   178,    -1,   235,
     179,    -1,    -1,    96,    -1,    15,    36,   102,   232,     4,
      -1,   182,    -1,   189,    -1,    28,     4,   183,   185,     4,
     187,    29,     4,    -1,    -1,   183,   184,    -1,    32,   211,
       4,    -1,    31,   194,   186,    -1,    34,   194,    -1,    18,
     194,     4,    19,   195,    -1,    -1,   102,   194,    -1,    -1,
     187,   188,    -1,    33,   232,   200,     4,    -1,   176,    -1,
     105,   197,   106,   107,   190,     4,    -1,   232,   107,   190,
       4,    -1,   190,     4,    -1,   192,    -1,   191,    -1,   194,
     119,   195,   206,    -1,   193,   206,    -1,   194,    -1,    36,
      -1,   235,    -1,    43,    -1,    39,    -1,   194,    -1,   196,
      -1,    36,    -1,    45,    -1,    41,    -1,    -1,   198,    -1,
     199,    -1,   198,   102,   199,    -1,   232,   200,    -1,    -1,
     200,   201,    -1,   100,    -1,   101,    -1,    98,    -1,    96,
      -1,    97,   222,    -1,   204,    -1,   212,    -1,   205,    -1,
     213,    -1,    22,   206,     4,    -1,    22,   190,     4,    -1,
      23,   206,     4,    -1,   105,   207,   106,    -1,    -1,   208,
      -1,   209,    -1,   208,   102,   209,    -1,   211,    -1,   210,
      -1,    36,    56,   228,    -1,   228,   220,    -1,    26,     4,
     217,    27,     4,    -1,    24,     4,   214,    25,     4,    -1,
      -1,   215,    -1,   216,    -1,   215,   216,    -1,    23,   211,
       4,    -1,    -1,   218,    -1,   219,    -1,   218,   219,    -1,
      22,   211,     4,    -1,    -1,   220,   221,    -1,    99,    -1,
      97,   222,    -1,    -1,   105,    36,   106,    -1,    21,   225,
      -1,   223,     4,    -1,    20,   225,     4,    -1,    48,   235,
     107,    37,    -1,    49,   235,   107,    38,    -1,    50,   235,
     107,    36,    -1,    51,   235,   107,    36,    -1,   229,    -1,
     234,    -1,   229,    -1,   233,    -1,    35,    -1,   232,    -1,
     229,    -1,    36,    -1,    37,    -1,    38,    -1,    57,    -1,
      58,    -1,    59,    -1,    60,    -1,    62,    -1,    61,    -1,
      48,    -1,    49,    -1,    50,    -1,    51,    -1,   233,    -1,
     235,    -1,    43,    -1,    44,    -1,    46,    -1,    45,    -1,
     234,    -1,    39,    -1,    40,    -1,    42,    -1,    41,    -1,
      35,    -1,    47,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   270,   270,   275,   276,   279,   280,   283,   284,   285,
     286,   287,   288,   289,   290,   293,   296,   302,   305,   310,
     316,   317,   320,   321,   322,   325,   328,   329,   332,   333,
     337,   342,   345,   346,   349,   350,   355,   356,   355,   362,
     363,   366,   367,   370,   371,   372,   373,   374,   375,   376,
     377,   378,   379,   380,   383,   384,   387,   388,   389,   390,
     393,   394,   397,   407,   408,   416,   417,   417,   422,   423,
     424,   427,   428,   429,   430,   431,   432,   433,   434,   435,
     436,   437,   438,   439,   442,   443,   446,   451,   468,   469,
     470,   473,   474,   475,   476,   477,   480,   480,   484,   485,
     488,   489,   492,   495,   496,   497,   500,   501,   502,   503,
     504,   505,   506,   507,   508,   509,   510,   511,   512,   513,
     514,   515,   516,   517,   518,   519,   520,   521,   522,   526,
     527,   528,   529,   530,   531,   532,   533,   534,   535,   536,
     537,   538,   539,   542,   545,   546,   549,   552,   553,   557,
     559,   561,   565,   566,   570,   571,   574,   575,   583,   587,
     590,   591,   594,   598,   599,   604,   608,   609,   612,   620,
     621,   624,   627,   628,   629,   633,   634,   637,   638,   641,
     642,   645,   646,   647,   651,   652,   655,   659,   662,   663,
     666,   667,   668,   671,   672,   675,   676,   677,   680,   681,
     684,   685,   688,   700,   701,   704,   705,   706,   707,   708,
     716,   717,   720,   721,   724,   725,   728,   731,   734,   735,
     738,   739,   742,   743,   746,   751,   765,   770,   775,   776,
     780,   781,   785,   788,   789,   792,   793,   796,   800,   801,
     804,   805,   810,   811,   814,   818,   819,   822,   823,   824,
     825,   828,   829,   833,   834,   835,   838,   839,   842,   843,
     844,   847,   848,   849,   850,   851,   852,   855,   856,   857,
     858,   861,   862,   865,   866,   867,   868,   869,   872,   873,
     874,   875,   878,   879
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
  "conditional_statement", "if_type", "if_null_type", "goto_or_comma",
  "goto_statement", "local_declaration", "local_id_list", "local_id",
  "has_unique_reg", "lex_declaration", "invocation_statement",
  "long_invocation_statement", "long_arguments", "long_argument",
  "long_invocation", "opt_return_continuation", "long_results",
  "long_result", "short_invocation_statement", "simple_invocation",
  "methodcall", "subcall", "sub", "invokable", "method", "string_object",
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
     171,   171,   172,   172,   173,   173,   174,   174,   175,   176,
     177,   177,   178,   179,   179,   180,   181,   181,   182,   183,
     183,   184,   185,   185,   185,   186,   186,   187,   187,   188,
     188,   189,   189,   189,   190,   190,   191,   192,   193,   193,
     194,   194,   194,   195,   195,   196,   196,   196,   197,   197,
     198,   198,   199,   200,   200,   201,   201,   201,   201,   201,
     202,   202,   203,   203,   204,   204,   205,   206,   207,   207,
     208,   208,   209,   209,   210,   211,   212,   213,   214,   214,
     215,   215,   216,   217,   217,   218,   218,   219,   220,   220,
     221,   221,   222,   222,   223,   224,   224,   225,   225,   225,
     225,   226,   226,   227,   227,   227,   228,   228,   229,   229,
     229,   230,   230,   230,   230,   230,   230,   231,   231,   231,
     231,   232,   232,   233,   233,   233,   233,   233,   234,   234,
     234,   234,   235,   235
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
       7,     5,     1,     1,     2,     2,     1,     1,     3,     4,
       1,     3,     2,     0,     1,     5,     1,     1,     8,     0,
       2,     3,     3,     2,     5,     0,     2,     0,     2,     4,
       1,     6,     4,     2,     1,     1,     4,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       1,     3,     2,     0,     2,     1,     1,     1,     1,     2,
       1,     1,     1,     1,     3,     3,     3,     3,     0,     1,
       1,     3,     1,     1,     3,     2,     5,     5,     0,     1,
       1,     2,     3,     0,     1,     1,     2,     3,     0,     2,
       1,     2,     0,     3,     2,     2,     3,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    32,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,   282,    40,
     283,    36,    39,     0,    31,     0,     0,     0,     0,   244,
       4,     2,     0,     0,     0,    15,    41,    34,     0,     0,
       0,     0,     0,     6,    17,    18,     0,    19,    26,    21,
      24,     0,   148,    33,   147,     0,     0,     0,     0,     0,
      22,    23,   258,   259,   260,   278,   279,   281,   280,     0,
      27,    28,    30,   251,   252,    37,    44,    45,    46,    43,
      47,     0,   242,    48,     0,    49,    50,    42,    35,   247,
     248,   249,   250,    25,     0,    60,     0,     0,    53,    54,
      29,    65,     0,     0,     0,     0,    61,    66,    52,   243,
       0,    51,   267,   268,   269,   270,   203,     0,    38,     0,
      57,     0,    55,    58,    59,    56,     0,     0,    63,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     189,   278,   273,   274,   276,   275,   283,   152,   153,     0,
       0,   198,    80,    67,    70,    82,    81,    79,    71,     0,
       0,    72,    73,    74,    78,   166,   167,     0,   185,   184,
       0,   188,    76,    77,   210,   212,   211,   213,     0,    75,
       0,   271,   277,   272,   273,     0,   144,   146,   257,   256,
     272,    62,   208,   242,   207,   205,   206,   204,     0,    83,
      68,    69,     0,     0,     0,   192,   191,   218,     0,     0,
     190,     0,   228,   233,   169,   198,   154,   155,     0,     0,
       0,   199,   200,   203,     0,     0,   183,   187,     0,   245,
     142,   140,   141,   129,   130,   131,   132,   133,   134,   136,
     137,   135,   138,   139,     0,     0,     0,     0,   143,     0,
     209,    64,     0,     0,   160,   163,   246,   258,     0,   219,
     220,   223,   222,   238,   215,   214,   216,     0,     0,   229,
     230,     0,     0,   234,   235,     0,     0,    84,   158,     0,
       0,   202,   156,   261,   262,   263,   264,   266,   265,   157,
       0,     0,     0,   195,   197,   196,   193,     0,   194,   282,
     258,   283,     0,   103,   104,   105,    90,    95,     0,     0,
      92,     0,   257,   256,   271,    87,    88,     0,   145,     0,
     159,     0,   164,   162,     0,   217,     0,   225,     0,     0,
     231,     0,     0,   236,     0,     0,     0,     0,   170,     0,
       0,     0,   201,     0,     0,     0,   186,    98,    85,    91,
     182,   128,   123,   125,   124,   127,   126,   116,   117,   118,
     121,   119,   120,   122,   115,   107,   113,   106,   108,   109,
     110,   111,   112,   114,     0,    94,    89,   165,   161,   224,
     221,   242,   240,   239,   232,   227,   237,   226,     0,   175,
       0,   173,   177,    86,     0,   149,     0,   151,    97,    99,
     100,   102,    93,   241,     0,     0,   172,   171,     0,   181,
       0,     0,     0,   176,     0,     0,   180,   178,   150,   101,
     174,   168,   203,     0,   179
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      44,    59,   162,    79,    80,    81,    20,    34,    48,    21,
      46,   105,    31,    61,    97,   114,   132,   111,   116,   126,
     117,   129,   163,   164,   165,   166,   167,   255,   316,   317,
     357,   408,   409,   410,   318,   384,   256,   133,   195,   196,
      65,   168,   169,   170,   300,   171,   172,   263,   264,   333,
     173,   174,   175,   285,   348,   349,   416,   418,   427,   176,
     177,   178,   179,   180,   181,   307,   308,   230,   231,   232,
     136,   207,   182,   183,   184,   185,   219,   268,   269,   270,
     271,   272,   186,   187,   278,   279,   280,   282,   283,   284,
     337,   393,   108,    22,   189,    39,    82,   320,   273,   198,
     301,   127,   199,   191,   192,   200
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -346
static const yytype_int16 yypact[] =
{
      19,  -346,    24,   158,  -346,    -5,     4,    63,    60,    39,
      59,    -6,   202,   101,  -346,  -346,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,     2,    22,  -346,    91,  -346,  -346,  -346,
    -346,  -346,  -346,   102,  -346,    54,    54,    54,    54,  -346,
     158,  -346,   104,   106,    41,  -346,  -346,  -346,   -83,    30,
      71,    74,    75,  -346,  -346,  -346,     9,  -346,   349,  -346,
    -346,    66,  -346,  -346,  -346,   130,   134,   145,   149,   151,
    -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,   185,
      88,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,
    -346,    87,    89,  -346,    94,  -346,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,  -346,   349,  -346,    59,   160,  -346,  -346,
    -346,   191,   103,   105,     1,   247,  -346,   193,  -346,  -346,
     166,  -346,  -346,  -346,  -346,  -346,  -346,   100,  -346,    38,
    -346,   393,  -346,  -346,  -346,  -346,    25,   152,  -346,   208,
     219,   182,   247,   202,   141,   114,   220,   222,   226,   127,
    -346,   -85,   -54,  -346,  -346,  -346,   335,   183,   184,   429,
      54,   429,  -346,  -346,  -346,  -346,  -346,  -346,  -346,   393,
     393,  -346,  -346,  -346,  -346,  -346,  -346,   232,  -346,  -346,
     114,   129,  -346,  -346,  -346,  -346,  -346,  -346,   252,  -346,
     343,  -346,  -346,   -33,  -346,   -47,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,    89,  -346,  -346,  -346,  -346,    54,  -346,
    -346,  -346,   165,    54,   264,  -346,  -346,   416,   266,   284,
    -346,   285,   270,   269,  -346,   429,  -346,  -346,   295,   313,
     212,   217,  -346,  -346,   268,   -39,  -346,  -346,   186,  -346,
    -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,  -346,   240,   316,   393,   215,  -346,   393,
    -346,  -346,   429,     7,  -346,   235,  -346,   282,   236,   243,
    -346,  -346,  -346,  -346,  -346,  -346,  -346,   393,   327,   270,
    -346,   393,   326,   269,  -346,    80,   260,  -346,  -346,   261,
     429,   301,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,
      54,   393,    54,  -346,  -346,  -346,  -346,   114,  -346,   363,
     287,   342,   365,  -346,  -346,  -346,  -346,  -346,   393,   389,
    -346,   246,   390,   292,   396,  -346,  -346,   393,  -346,   399,
    -346,    54,  -346,  -346,   393,  -346,   416,   -67,   400,   402,
    -346,   403,   404,  -346,   308,   308,   393,   308,  -346,   405,
     406,   297,  -346,   407,   -39,   409,  -346,   349,  -346,  -346,
    -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,  -346,   393,  -346,  -346,  -346,  -346,  -346,
    -346,    89,  -346,  -346,  -346,  -346,  -346,  -346,   437,   340,
     439,  -346,  -346,  -346,   440,  -346,    54,  -346,  -346,   345,
    -346,  -346,  -346,  -346,   426,   308,  -346,  -346,    17,  -346,
     444,   349,   186,  -346,   445,   429,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,    48,  -346
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -346,  -346,   452,  -346,   427,  -346,  -346,  -346,  -346,  -346,
    -346,  -346,    64,  -346,  -346,   362,  -346,  -346,  -346,  -346,
    -346,  -346,   371,  -346,  -346,  -346,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,   338,  -346,  -346,  -346,  -346,  -346,  -346,
    -346,  -346,  -346,    58,  -346,  -346,  -346,  -182,  -346,   221,
     286,  -346,  -346,  -346,  -221,  -346,    65,  -346,   153,  -346,
    -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,  -346,
    -141,  -346,  -346,  -346,  -229,    67,  -346,   257,  -346,   195,
    -228,  -346,  -346,  -346,  -346,  -346,  -135,  -346,  -346,   150,
    -346,  -259,  -346,  -346,  -346,  -346,   209,  -346,  -346,   204,
    -346,  -346,  -196,    33,  -346,   347,  -345,  -346,  -127,   -57,
    -346,  -105,  -123,   237,   -56,   -10
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -256
static const yytype_int16 yytable[] =
{
      32,    83,    84,   218,   197,   291,   190,   260,   257,   306,
     221,   330,   411,    70,   302,   134,   292,   190,   338,    62,
    -192,    63,   341,     1,     4,    49,    50,    51,    52,   201,
     391,    23,   392,   142,  -192,    64,   228,   213,   233,   139,
      24,   140,   234,   235,    56,   237,   424,    83,    84,    57,
     425,  -191,   434,   141,   142,    62,    58,   258,   143,    12,
     144,   145,   146,   299,   147,  -191,   148,    25,   149,    26,
      85,    64,  -190,    28,   150,    27,   411,   151,    76,    77,
      78,   152,   153,   154,   155,   156,  -190,   400,    58,    28,
     157,   158,   159,   160,    28,    29,    32,    33,   344,    83,
      84,    30,   233,   120,    42,    40,    30,   121,    60,   331,
     135,   345,   346,   319,   347,   398,   399,   138,   401,   193,
      71,   202,   203,   204,    43,   205,   206,   321,    45,   326,
     193,   323,   197,   406,   220,    28,   137,    66,    47,   329,
      54,   385,    55,   161,   202,   203,   204,    30,   205,   206,
     229,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,   188,     5,     6,     7,    98,   233,     8,     9,
      10,    99,   356,   188,   354,    11,    28,   150,    67,    12,
     215,    68,    69,   100,   216,   101,   423,   102,    30,   103,
     104,   359,   106,   306,   107,   413,   113,   322,   261,   109,
     386,    28,   130,   265,   433,   115,   128,   389,   208,   118,
     404,   119,   209,    30,   122,   123,   124,   125,   212,   217,
     139,    28,   303,   210,   222,   215,   223,   304,   220,   216,
     224,   305,   225,    30,   141,   142,   236,   226,   227,   143,
      12,   144,   145,   146,   193,   147,   217,   148,   238,   149,
      35,    36,    37,    38,    28,   150,   239,   412,   151,    76,
      77,    78,   152,   153,   154,   155,   156,   262,   266,   131,
     274,   157,   158,   159,   160,   309,   310,    73,    74,   151,
      76,    77,    78,   152,   153,   154,   155,   311,   275,   276,
     353,   281,   355,   277,   312,   122,   123,   124,   125,   287,
      83,    84,   432,   361,   362,   363,   364,   365,   366,   367,
     368,   369,   370,   371,   372,   373,   374,   288,   289,   290,
     325,   265,   327,   292,   161,   293,   294,   295,   296,   297,
     298,   332,    28,   150,   220,   220,   215,   220,   334,   -26,
     216,   220,   335,    28,    30,   336,   -96,   215,   313,   314,
     315,   216,   339,   342,   375,    30,   376,   377,   378,   379,
     380,   381,   382,   383,    83,    84,   350,  -255,   351,   358,
     299,    72,    73,    74,    75,    76,    77,    78,   -96,   -96,
     -96,   -96,   -96,   -96,   -96,    72,    73,    74,    75,    76,
      77,    78,  -189,   360,  -253,   131,   420,   202,   203,   204,
    -254,   205,   206,   387,   394,   220,   395,   396,   397,   402,
     403,   405,   220,   407,   240,   241,   242,   243,   244,   245,
     246,   247,   248,   249,   250,   251,   252,   253,    28,    72,
      73,    74,    75,    76,    77,    78,   194,   153,   154,   155,
      30,   414,   415,   417,   419,   422,   131,   421,   428,   431,
     254,    28,   267,    73,    74,    75,    76,    77,    78,   194,
     153,   154,   155,    30,    28,    41,   110,    53,    75,    76,
      77,    78,   194,   153,   154,   155,    30,   112,   211,   429,
     328,   259,   286,   426,   388,   352,   390,   343,   340,   430,
     214,   324
};

static const yytype_uint16 yycheck[] =
{
      10,    58,    58,   144,   131,   233,   129,   203,   190,   238,
     145,     4,   357,     4,   235,   120,    55,   140,   277,   102,
     105,   104,   281,     4,     0,    35,    36,    37,    38,     4,
      97,    36,    99,    16,   119,   118,   159,   142,   161,     1,
      36,     3,   169,   170,     3,   180,    29,   104,   104,     8,
      33,   105,     4,    15,    16,   102,    47,   104,    20,    21,
      22,    23,    24,   102,    26,   119,    28,     4,    30,     9,
       4,   118,   105,    35,    36,    36,   421,    39,    40,    41,
      42,    43,    44,    45,    46,    47,   119,   346,    47,    35,
      52,    53,    54,    55,    35,    36,   106,   103,    18,   156,
     156,    47,   225,   102,   102,     4,    47,   106,    44,   102,
     120,    31,    32,   254,    34,   344,   345,   127,   347,   129,
      56,    96,    97,    98,   102,   100,   101,   254,    37,   256,
     140,   254,   259,   354,   144,    35,    36,   107,    36,   262,
      36,   323,    36,   105,    96,    97,    98,    47,   100,   101,
     160,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,   129,     5,     6,     7,    36,   290,    10,    11,
      12,    37,   307,   140,   301,    17,    35,    36,   107,    21,
      39,   107,   107,    38,    43,    36,   415,    36,    47,     4,
     102,   318,   105,   422,   105,   391,    36,   254,   208,   105,
     327,    35,    36,   213,   432,    14,    13,   334,    56,   106,
     351,   106,     4,    47,    48,    49,    50,    51,    36,   105,
       1,    35,    36,     4,     4,    39,     4,    41,   238,    43,
       4,    45,   105,    47,    15,    16,     4,    54,    54,    20,
      21,    22,    23,    24,   254,    26,   105,    28,   119,    30,
      48,    49,    50,    51,    35,    36,     4,   384,    39,    40,
      41,    42,    43,    44,    45,    46,    47,   102,     4,   103,
       4,    52,    53,    54,    55,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,     4,     4,
     300,    22,   302,    23,    54,    48,    49,    50,    51,     4,
     357,   357,   425,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,     4,   106,   102,
       4,   331,   107,    55,   105,    57,    58,    59,    60,    61,
      62,    96,    35,    36,   344,   345,    39,   347,    56,     4,
      43,   351,   106,    35,    47,   102,     4,    39,   108,   109,
     110,    43,    25,    27,   108,    47,   110,   111,   112,   113,
     114,   115,   116,   117,   421,   421,   106,     4,   107,     4,
     102,    36,    37,    38,    39,    40,    41,    42,    36,    37,
      38,    39,    40,    41,    42,    36,    37,    38,    39,    40,
      41,    42,   105,     4,     4,   103,   406,    96,    97,    98,
       4,   100,   101,     4,     4,   415,     4,     4,     4,     4,
       4,     4,   422,     4,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,     4,   102,     4,     4,    19,   103,   102,     4,     4,
     107,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    35,    13,   104,    40,    39,    40,
      41,    42,    43,    44,    45,    46,    47,   106,   140,   421,
     259,   195,   225,   418,   331,   290,   336,   283,   279,   422,
     143,   254
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     7,    10,    11,
      12,    17,    21,   123,   124,   125,   126,   127,   128,   129,
     136,   139,   223,    36,    36,     4,     9,    36,    35,    36,
      47,   142,   235,   103,   137,    48,    49,    50,    51,   225,
       4,   122,   102,   102,   130,    37,   140,    36,   138,   235,
     235,   235,   235,   124,    36,    36,     3,     8,    47,   131,
     132,   143,   102,   104,   118,   170,   107,   107,   107,   107,
       4,   132,    36,    37,    38,    39,    40,    41,    42,   133,
     134,   135,   226,   229,   234,     4,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,   144,    36,    37,
      38,    36,    36,     4,   102,   141,   105,   105,   222,   105,
     135,   147,   142,    36,   145,    14,   148,   150,   106,   106,
     102,   106,    48,    49,    50,    51,   149,   231,    13,   151,
      36,   103,   146,   167,   231,   235,   200,    36,   235,     1,
       3,    15,    16,    20,    22,    23,    24,    26,    28,    30,
      36,    39,    43,    44,    45,    46,    47,    52,    53,    54,
      55,   105,   132,   152,   153,   154,   155,   156,   171,   172,
     173,   175,   176,   180,   181,   182,   189,   190,   191,   192,
     193,   194,   202,   203,   204,   205,   212,   213,   223,   224,
     232,   233,   234,   235,    43,   168,   169,   228,   229,   232,
     235,     4,    96,    97,    98,   100,   101,   201,    56,     4,
       4,   153,    36,   231,   225,    39,    43,   105,   190,   206,
     235,   206,     4,     4,     4,   105,    54,    54,   232,   235,
     197,   198,   199,   232,   228,   228,     4,   206,   119,     4,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,   107,   157,   166,   167,   104,   170,
     222,   235,   102,   177,   178,   235,     4,    36,   207,   208,
     209,   210,   211,   228,     4,     4,     4,    23,   214,   215,
     216,    22,   217,   218,   219,   183,   197,     4,     4,   106,
     102,   200,    55,    57,    58,    59,    60,    61,    62,   102,
     174,   230,   174,    36,    41,    45,   194,   195,   196,    35,
      36,    47,    54,   108,   109,   110,   158,   159,   164,   190,
     227,   228,   229,   232,   233,     4,   228,   107,   169,   232,
       4,   102,    96,   179,    56,   106,   102,   220,   211,    25,
     216,   211,    27,   219,    18,    31,    32,    34,   184,   185,
     106,   107,   199,   235,   228,   235,   206,   160,     4,   228,
       4,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,   108,   110,   111,   112,   113,
     114,   115,   116,   117,   165,   167,   228,     4,   178,   228,
     209,    97,    99,   221,     4,     4,     4,     4,   194,   194,
     211,   194,     4,     4,   190,     4,   174,     4,   161,   162,
     163,   226,   228,   222,     4,   102,   186,     4,   187,     4,
     235,   102,    19,   194,    29,    33,   176,   188,     4,   163,
     195,     4,   232,   200,     4
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
#line 297 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 36:
#line 355 "pir.y"
    { new_sub(lexer, (yyvsp[(2) - (2)].sval));  /* create a new sub node */ ;}
    break;

  case 37:
#line 356 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(4) - (5)].ival)); ;}
    break;

  case 41:
#line 366 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 42:
#line 367 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(1) - (2)].ival)); ;}
    break;

  case 43:
#line 370 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON; ;}
    break;

  case 44:
#line 371 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 45:
#line 372 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 46:
#line 373 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 47:
#line 374 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 48:
#line 375 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 49:
#line 376 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 50:
#line 377 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 51:
#line 378 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 52:
#line 379 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 53:
#line 380 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 62:
#line 397 "pir.y"
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
#line 407 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 64:
#line 408 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval));   /* add a new parameter */
                                              set_param_named((yyval.targ), (yyvsp[(2) - (4)].sval));  /* set the :named flag */
                                            ;}
    break;

  case 66:
#line 417 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 68:
#line 422 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 69:
#line 423 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval));   ;}
    break;

  case 71:
#line 427 "pir.y"
    { ;}
    break;

  case 72:
#line 428 "pir.y"
    { ;}
    break;

  case 73:
#line 429 "pir.y"
    { ;}
    break;

  case 74:
#line 430 "pir.y"
    { ;}
    break;

  case 75:
#line 431 "pir.y"
    { ;}
    break;

  case 76:
#line 432 "pir.y"
    { ;}
    break;

  case 77:
#line 433 "pir.y"
    { ;}
    break;

  case 78:
#line 434 "pir.y"
    { ;}
    break;

  case 79:
#line 435 "pir.y"
    { ;}
    break;

  case 80:
#line 436 "pir.y"
    { ;}
    break;

  case 81:
#line 437 "pir.y"
    { ;}
    break;

  case 82:
#line 438 "pir.y"
    { ;}
    break;

  case 83:
#line 439 "pir.y"
    { yyerrok; ;}
    break;

  case 84:
#line 442 "pir.y"
    { set_instr(lexer, "null"); ;}
    break;

  case 85:
#line 443 "pir.y"
    { set_instr(lexer, "null"); ;}
    break;

  case 86:
#line 447 "pir.y"
    { set_instr(lexer, "get_results"); ;}
    break;

  case 88:
#line 468 "pir.y"
    { new_rhs(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 89:
#line 469 "pir.y"
    { new_rhs(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].fixme), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 90:
#line 470 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 91:
#line 473 "pir.y"
    { new_rhs(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 92:
#line 474 "pir.y"
    { new_rhs(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 93:
#line 475 "pir.y"
    { new_rhs(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 94:
#line 476 "pir.y"
    { new_rhs(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].fixme)); ;}
    break;

  case 96:
#line 480 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 97:
#line 481 "pir.y"
    { (yyval.fixme) = 0; ;}
    break;

  case 103:
#line 495 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 104:
#line 496 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 105:
#line 497 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 106:
#line 500 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 107:
#line 501 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 108:
#line 502 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 109:
#line 503 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 110:
#line 504 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 111:
#line 505 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 112:
#line 506 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 113:
#line 507 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 114:
#line 508 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 115:
#line 509 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 116:
#line 510 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 117:
#line 511 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 118:
#line 512 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 119:
#line 513 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 120:
#line 514 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 121:
#line 515 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 122:
#line 516 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 123:
#line 517 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 124:
#line 518 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 125:
#line 519 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 126:
#line 520 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 127:
#line 521 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 128:
#line 522 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 129:
#line 526 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 130:
#line 527 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 131:
#line 528 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 132:
#line 529 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 133:
#line 530 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 134:
#line 531 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 135:
#line 532 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 136:
#line 533 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 137:
#line 534 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 138:
#line 535 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 139:
#line 536 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 140:
#line 537 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 141:
#line 538 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 142:
#line 539 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 143:
#line 542 "pir.y"
    {  ;}
    break;

  case 149:
#line 558 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval)); ;}
    break;

  case 150:
#line 560 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (7)].sval)); ;}
    break;

  case 151:
#line 562 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval)); ;}
    break;

  case 152:
#line 565 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 153:
#line 566 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 154:
#line 570 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 155:
#line 571 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 158:
#line 584 "pir.y"
    { set_instr(lexer, "branch"); ;}
    break;

  case 162:
#line 595 "pir.y"
    { declare_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 163:
#line 598 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 164:
#line 599 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 191:
#line 667 "pir.y"
    { ;}
    break;

  case 192:
#line 668 "pir.y"
    { ;}
    break;

  case 196:
#line 676 "pir.y"
    { ;}
    break;

  case 197:
#line 677 "pir.y"
    { ;}
    break;

  case 198:
#line 680 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 199:
#line 681 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 200:
#line 684 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 201:
#line 685 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 202:
#line 688 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                                             set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                                             /* get the :named flag argument if necessary */
                                             IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                                             /*
                                             if (TEST_FLAG($2, PARAM_FLAG_NAMED)) {
                                                 set_param_named($1, lexer->temp_flag_arg1);
                                             }
                                             */
                                           ;}
    break;

  case 203:
#line 700 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 204:
#line 701 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 205:
#line 704 "pir.y"
    { (yyval.ival) = PARAM_FLAG_OPTIONAL; ;}
    break;

  case 206:
#line 705 "pir.y"
    { (yyval.ival) = PARAM_FLAG_OPT_FLAG; ;}
    break;

  case 207:
#line 706 "pir.y"
    { (yyval.ival) = PARAM_FLAG_SLURPY; ;}
    break;

  case 208:
#line 707 "pir.y"
    { (yyval.ival) = PARAM_FLAG_UNIQUE_REG; ;}
    break;

  case 209:
#line 708 "pir.y"
    { STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                             (yyval.ival) = PARAM_FLAG_NAMED;
                                           ;}
    break;

  case 216:
#line 728 "pir.y"
    {  ;}
    break;

  case 217:
#line 731 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 218:
#line 734 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 219:
#line 735 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 220:
#line 738 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 221:
#line 739 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 224:
#line 746 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                             set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                                           ;}
    break;

  case 225:
#line 751 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                                             set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                                             IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));

                                             /* if necessary, get the argument for the :named flag */
                                             /* if (TEST_FLAG($2, ARG_FLAG_NAMED)) {
                                                 set_arg_named($$, lexer->temp_flag_arg1);
                                             }
                                             */
                                           ;}
    break;

  case 226:
#line 767 "pir.y"
    { ;}
    break;

  case 227:
#line 772 "pir.y"
    { ;}
    break;

  case 228:
#line 775 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 229:
#line 776 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 230:
#line 780 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 231:
#line 781 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 232:
#line 785 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 233:
#line 788 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 234:
#line 789 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 235:
#line 792 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 236:
#line 793 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 237:
#line 796 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 238:
#line 800 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 239:
#line 801 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 240:
#line 804 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 241:
#line 805 "pir.y"
    { STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                         (yyval.ival) = ARG_FLAG_NAMED;
                                       ;}
    break;

  case 242:
#line 810 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 243:
#line 811 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 244:
#line 815 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), 0);  ;}
    break;

  case 246:
#line 819 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), 1);  ;}
    break;

  case 247:
#line 822 "pir.y"
    { (yyval.constval) = new_iconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 248:
#line 823 "pir.y"
    { (yyval.constval) = new_nconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 249:
#line 824 "pir.y"
    { (yyval.constval) = new_pconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 250:
#line 825 "pir.y"
    { (yyval.constval) = new_sconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 253:
#line 833 "pir.y"
    { (yyval.expr) = expr_from_constant((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 254:
#line 834 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 255:
#line 835 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 256:
#line 838 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 257:
#line 839 "pir.y"
    { (yyval.expr) = expr_from_constant((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 258:
#line 842 "pir.y"
    { (yyval.constval) = new_sconst(NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 259:
#line 843 "pir.y"
    { (yyval.constval) = new_iconst(NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 260:
#line 844 "pir.y"
    { (yyval.constval) = new_nconst(NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 261:
#line 847 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 262:
#line 848 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 263:
#line 849 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 264:
#line 850 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 265:
#line 851 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 266:
#line 852 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 267:
#line 855 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 268:
#line 856 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 269:
#line 857 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 270:
#line 858 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 271:
#line 861 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 272:
#line 862 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 273:
#line 865 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 274:
#line 866 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 275:
#line 867 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 276:
#line 868 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 278:
#line 872 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 279:
#line 873 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 280:
#line 874 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 281:
#line 875 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3005 "pirparser.c"
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


#line 883 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


