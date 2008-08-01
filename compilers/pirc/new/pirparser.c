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
#line 82 "pir.y"
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
#define YYLAST   432

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  116
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  112
/* YYNRULES -- Number of rules.  */
#define YYNRULES  268
/* YYNRULES -- Number of states.  */
#define YYNSTATES  407

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
      79,    81,    83,    85,    87,    89,    91,    93,    95,   100,
     103,   106,   108,   110,   112,   114,   115,   118,   124,   125,
     126,   130,   133,   136,   138,   140,   142,   144,   146,   148,
     150,   152,   154,   156,   158,   160,   162,   164,   167,   171,
     176,   180,   183,   187,   190,   194,   197,   200,   202,   206,
     209,   211,   212,   216,   217,   219,   222,   224,   225,   229,
     231,   233,   237,   239,   243,   250,   256,   264,   266,   268,
     270,   272,   276,   281,   283,   287,   290,   291,   293,   299,
     301,   303,   312,   313,   315,   317,   320,   324,   328,   331,
     337,   338,   341,   342,   344,   346,   349,   353,   355,   360,
     365,   368,   370,   372,   377,   380,   382,   384,   386,   388,
     390,   392,   394,   396,   400,   401,   403,   405,   409,   412,
     413,   416,   418,   420,   422,   424,   427,   428,   431,   433,
     435,   440,   442,   444,   446,   448,   452,   456,   460,   464,
     465,   467,   469,   473,   475,   477,   481,   484,   490,   496,
     497,   499,   501,   504,   508,   509,   511,   513,   516,   520,
     521,   524,   526,   529,   530,   532,   536,   539,   542,   546,
     551,   556,   561,   566,   568,   570,   572,   574,   576,   578,
     580,   582,   584,   586,   588,   590,   592,   594,   596,   598,
     600,   602,   604,   606,   608,   610,   612,   614,   616,   618,
     620,   622,   624,   626,   628,   630,   632,   634,   636,   638,
     640,   642,   644,   646,   648,   650,   652,   654,   656,   658,
     660,   662,   664,   666,   668,   670,   672,   674,   676,   678,
     680,   682,   684,   686,   688,   690,   692,   694,   696
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     117,     0,    -1,   118,   119,   118,    -1,    -1,     4,    -1,
     120,    -1,   119,     4,   120,    -1,   128,    -1,   214,    -1,
     125,    -1,   123,    -1,   124,    -1,   122,    -1,   121,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,    -1,
       6,    34,    98,    34,    -1,    15,    99,   126,   100,    -1,
      -1,   127,    -1,    34,    -1,   127,   101,    34,    -1,   129,
     131,     4,   134,   136,    11,    -1,    10,   130,    -1,   224,
      -1,    34,    -1,    -1,   131,   132,    -1,    82,    -1,    79,
      -1,    80,    -1,    81,    -1,    83,    -1,    86,    -1,    88,
      -1,    89,    -1,    87,    -1,    84,   102,   130,   103,    -1,
      85,   212,    -1,    90,   213,    -1,   224,    -1,    34,    -1,
     154,    -1,   221,    -1,    -1,   134,   135,    -1,    12,   221,
     224,   189,     4,    -1,    -1,    -1,   136,   137,   138,    -1,
       3,     4,    -1,     3,   139,    -1,   139,    -1,   156,    -1,
     159,    -1,   160,    -1,   164,    -1,   215,    -1,   192,    -1,
     193,    -1,   165,    -1,   144,    -1,   143,    -1,   142,    -1,
     141,    -1,   140,    -1,     1,     4,    -1,    48,   222,     4,
      -1,   222,    98,    48,     4,    -1,    28,   183,     4,    -1,
     147,     4,    -1,   222,   145,     4,    -1,   227,   218,    -1,
     154,    98,   218,    -1,    98,   146,    -1,   225,   218,    -1,
     217,    -1,   218,   226,   218,    -1,   222,   154,    -1,   147,
      -1,    -1,    41,   148,   149,    -1,    -1,   150,    -1,   151,
     152,    -1,   218,    -1,    -1,   152,   104,   153,    -1,   218,
      -1,   154,    -1,    99,   155,   100,    -1,   218,    -1,   155,
     101,   218,    -1,   157,    48,   218,    49,   224,     4,    -1,
     157,   218,   158,   224,     4,    -1,   157,   218,   220,   218,
      49,   224,     4,    -1,    46,    -1,    47,    -1,    49,    -1,
     104,    -1,    49,   224,     4,    -1,    14,   221,   161,     4,
      -1,   162,    -1,   161,   104,   162,    -1,   224,   163,    -1,
      -1,    91,    -1,    13,    34,   104,   222,     4,    -1,   166,
      -1,   175,    -1,    26,     4,   167,   170,     4,   172,    27,
       4,    -1,    -1,   168,    -1,   169,    -1,   168,   169,    -1,
      30,   201,     4,    -1,    29,   181,   171,    -1,    32,   181,
      -1,    16,   181,     4,    17,   180,    -1,    -1,   104,   181,
      -1,    -1,   173,    -1,   174,    -1,   173,   174,    -1,    31,
     186,     4,    -1,   160,    -1,   183,    98,   176,     4,    -1,
     222,    98,   176,     4,    -1,   176,     4,    -1,   178,    -1,
     177,    -1,   181,   105,   180,   196,    -1,   179,   196,    -1,
     181,    -1,    34,    -1,   181,    -1,   182,    -1,   224,    -1,
      37,    -1,    34,    -1,    39,    -1,   102,   184,   103,    -1,
      -1,   185,    -1,   186,    -1,   185,   104,   186,    -1,   222,
     187,    -1,    -1,   187,   188,    -1,    95,    -1,    96,    -1,
      93,    -1,    91,    -1,    92,   212,    -1,    -1,   189,   190,
      -1,   188,    -1,   191,    -1,    97,   102,   133,   103,    -1,
     194,    -1,   202,    -1,   195,    -1,   203,    -1,    20,   196,
       4,    -1,    20,   176,     4,    -1,    21,   196,     4,    -1,
     102,   197,   103,    -1,    -1,   198,    -1,   199,    -1,   198,
     104,   199,    -1,   201,    -1,   200,    -1,    34,    50,   218,
      -1,   218,   210,    -1,    24,     4,   207,    25,     4,    -1,
      22,     4,   204,    23,     4,    -1,    -1,   205,    -1,   206,
      -1,   205,   206,    -1,    21,   201,     4,    -1,    -1,   208,
      -1,   209,    -1,   208,   209,    -1,    20,   201,     4,    -1,
      -1,   210,   211,    -1,    94,    -1,    92,   212,    -1,    -1,
     213,    -1,   102,    34,   103,    -1,    19,   216,    -1,   214,
       4,    -1,    18,   216,     4,    -1,    42,   224,    98,    35,
      -1,    43,   224,    98,    36,    -1,    44,   224,    98,    34,
      -1,    45,   224,    98,    34,    -1,   219,    -1,   223,    -1,
      33,    -1,   222,    -1,   219,    -1,    34,    -1,    35,    -1,
      36,    -1,    51,    -1,    52,    -1,    53,    -1,    54,    -1,
      56,    -1,    55,    -1,    42,    -1,    43,    -1,    44,    -1,
      45,    -1,   223,    -1,   224,    -1,    37,    -1,    38,    -1,
      40,    -1,    39,    -1,    33,    -1,    41,    -1,   106,    -1,
     107,    -1,   108,    -1,   109,    -1,   106,    -1,   110,    -1,
     111,    -1,   112,    -1,   113,    -1,   114,    -1,   108,    -1,
     115,    -1,    64,    -1,    57,    -1,    58,    -1,    59,    -1,
      61,    -1,    62,    -1,    60,    -1,    63,    -1,    52,    -1,
      54,    -1,    53,    -1,    56,    -1,    55,    -1,    51,    -1,
      68,    -1,    69,    -1,    70,    -1,    71,    -1,    72,    -1,
      73,    -1,    76,    -1,    74,    -1,    75,    -1,    77,    -1,
      78,    -1,    66,    -1,    67,    -1,    65,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   331,   331,   336,   337,   340,   341,   344,   345,   346,
     347,   348,   349,   350,   353,   357,   363,   367,   374,   378,
     379,   383,   385,   392,   398,   402,   403,   407,   408,   412,
     414,   416,   418,   420,   422,   424,   426,   428,   430,   432,
     434,   439,   440,   441,   442,   445,   446,   449,   460,   461,
     461,   466,   468,   470,   473,   474,   475,   476,   477,   478,
     479,   480,   481,   482,   483,   484,   485,   488,   497,   501,
     507,   513,   516,   542,   544,   546,   550,   552,   554,   556,
     558,   563,   563,   567,   568,   571,   575,   581,   582,   586,
     587,   590,   594,   596,   600,   601,   602,   605,   606,   609,
     610,   613,   619,   623,   625,   629,   633,   634,   639,   646,
     647,   650,   663,   664,   668,   670,   674,   678,   680,   682,
     688,   689,   696,   697,   701,   703,   707,   709,   713,   715,
     717,   722,   723,   726,   733,   739,   741,   745,   746,   749,
     751,   755,   757,   762,   767,   768,   772,   774,   778,   787,
     788,   792,   794,   796,   798,   800,   807,   808,   812,   813,
     816,   823,   824,   827,   828,   831,   835,   839,   845,   850,
     851,   855,   857,   861,   862,   865,   871,   879,   887,   896,
     897,   902,   904,   909,   914,   915,   919,   921,   925,   931,
     932,   936,   938,   945,   946,   950,   954,   958,   959,   963,
     965,   967,   969,   979,   980,   981,   984,   985,   988,   989,
     990,   993,   994,   995,   996,   997,   998,  1001,  1002,  1003,
    1004,  1007,  1008,  1011,  1012,  1013,  1014,  1017,  1018,  1021,
    1022,  1023,  1026,  1027,  1028,  1029,  1030,  1031,  1032,  1033,
    1034,  1035,  1036,  1037,  1038,  1039,  1040,  1041,  1042,  1043,
    1044,  1045,  1046,  1047,  1048,  1052,  1053,  1054,  1055,  1056,
    1057,  1058,  1059,  1060,  1061,  1062,  1063,  1064,  1065
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
  "\"parrot instruction\"", "\"int\"", "\"num\"", "\"pmc\"", "\"string\"",
  "\"if\"", "\"unless\"", "\"null\"", "\"goto\"", "\"=>\"", "\"!=\"",
  "\"==\"", "\"<\"", "\"<=\"", "\">\"", "\">=\"", "\">>>\"", "\">>\"",
  "\"<<\"", "\"//\"", "\"||\"", "\"&&\"", "\"~~\"", "\".\"", "\">>>=\"",
  "\">>=\"", "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"",
  "\"/=\"", "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"", "\".=\"", "\":init\"",
  "\":load\"", "\":main\"", "\":anon\"", "\":method\"", "\":outer\"",
  "\":vtable\"", "\":lex\"", "\":multi\"", "\":postcomp\"",
  "\":immediate\"", "\":lexid\"", "\":unique_reg\"", "\":named\"",
  "\":slurpy\"", "\":flat\"", "\":optional\"", "\":opt_flag\"",
  "\":invocant\"", "'='", "'['", "']'", "';'", "'('", "')'", "','", "'.'",
  "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"",
  "$accept", "TOP", "opt_nl", "pir_chunks", "pir_chunk", "pir_pragma",
  "loadlib", "hll_specifier", "hll_mapping", "namespace_decl",
  "opt_namespace_id", "namespace_id", "sub_def", "sub_head", "sub_id",
  "sub_flags", "sub_flag", "multi_type", "parameters", "parameter",
  "instructions", "@1", "instruction", "statement", "error_stat",
  "null_stat", "getresults_stat", "parrot_stat", "assignment_stat",
  "assign_tail", "assign_expr", "parrot_instruction", "@2",
  "opt_parrot_op_args", "parrot_op_args", "first_op_arg", "other_op_args",
  "other_op_arg", "keylist", "keys", "conditional_stat", "if_unless",
  "then", "goto_stat", "local_decl", "local_id_list", "local_id",
  "has_unique_reg", "lex_decl", "invocation_stat", "long_invocation_stat",
  "opt_long_arguments", "long_arguments", "long_argument",
  "long_invocation", "opt_ret_cont", "opt_long_results", "long_results",
  "long_result", "short_invocation_stat", "simple_invocation",
  "methodcall", "subcall", "sub", "method", "invokable", "string_object",
  "opt_target_list", "opt_list", "target_list", "result_target",
  "target_flags", "target_flag", "param_flags", "param_flag",
  "invocant_param", "return_stat", "yield_stat", "short_return_stat",
  "short_yield_stat", "arguments", "opt_arguments_list", "arguments_list",
  "argument", "named_arg", "short_arg", "long_return_stat",
  "long_yield_stat", "opt_yield_expressions", "yield_expressions",
  "yield_expression", "opt_return_expressions", "return_expressions",
  "return_expression", "arg_flags", "arg_flag", "opt_paren_string",
  "paren_string", "const_decl", "const_decl_stat", "const_tail",
  "expression1", "expression", "constant", "rel_op", "type", "target",
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
     132,   132,   132,   132,   132,   132,   132,   132,   132,   132,
     132,   133,   133,   133,   133,   134,   134,   135,   136,   137,
     136,   138,   138,   138,   139,   139,   139,   139,   139,   139,
     139,   139,   139,   139,   139,   139,   139,   140,   141,   141,
     142,   143,   144,   145,   145,   145,   146,   146,   146,   146,
     146,   148,   147,   149,   149,   150,   151,   152,   152,   153,
     153,   154,   155,   155,   156,   156,   156,   157,   157,   158,
     158,   159,   160,   161,   161,   162,   163,   163,   164,   165,
     165,   166,   167,   167,   168,   168,   169,   170,   170,   170,
     171,   171,   172,   172,   173,   173,   174,   174,   175,   175,
     175,   176,   176,   177,   178,   179,   179,   180,   180,   181,
     181,   182,   182,   183,   184,   184,   185,   185,   186,   187,
     187,   188,   188,   188,   188,   188,   189,   189,   190,   190,
     191,   192,   192,   193,   193,   194,   194,   195,   196,   197,
     197,   198,   198,   199,   199,   200,   201,   202,   203,   204,
     204,   205,   205,   206,   207,   207,   208,   208,   209,   210,
     210,   211,   211,   212,   212,   213,   214,   215,   215,   216,
     216,   216,   216,   217,   217,   217,   218,   218,   219,   219,
     219,   220,   220,   220,   220,   220,   220,   221,   221,   221,
     221,   222,   222,   223,   223,   223,   223,   224,   224,   225,
     225,   225,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   226,   226,   226,   226,   226,
     226,   226,   226,   226,   226,   227,   227,   227,   227,   227,
     227,   227,   227,   227,   227,   227,   227,   227,   227
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     3,     2,     2,     4,     4,     0,
       1,     1,     3,     6,     2,     1,     1,     0,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     2,
       2,     1,     1,     1,     1,     0,     2,     5,     0,     0,
       3,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     3,     4,
       3,     2,     3,     2,     3,     2,     2,     1,     3,     2,
       1,     0,     3,     0,     1,     2,     1,     0,     3,     1,
       1,     3,     1,     3,     6,     5,     7,     1,     1,     1,
       1,     3,     4,     1,     3,     2,     0,     1,     5,     1,
       1,     8,     0,     1,     1,     2,     3,     3,     2,     5,
       0,     2,     0,     1,     1,     2,     3,     1,     4,     4,
       2,     1,     1,     4,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     0,     1,     1,     3,     2,     0,
       2,     1,     1,     1,     1,     2,     0,     2,     1,     1,
       4,     1,     1,     1,     1,     3,     3,     3,     3,     0,
       1,     1,     3,     1,     1,     3,     2,     5,     5,     0,
       1,     1,     2,     3,     0,     1,     1,     2,     3,     0,
       2,     1,     2,     0,     1,     3,     2,     2,     3,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
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
       0,     0,     3,     5,    13,    12,    10,    11,     9,     7,
      27,     8,    16,     0,     0,    15,   227,    26,   228,    24,
      25,    19,     0,     0,     0,     0,   196,     4,     2,     0,
       0,    14,    21,     0,    20,     0,     0,     0,     0,     6,
      45,    30,    31,    32,    29,    33,     0,   193,    34,    37,
      35,    36,     0,    28,    17,    18,     0,     0,     0,     0,
       0,    48,     0,     0,    39,   194,    40,    22,   199,   200,
     201,   202,     0,    46,    49,     0,     0,   217,   218,   219,
     220,     0,    23,     0,    38,   195,   156,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   136,   223,
     224,   226,   225,   228,    97,    98,     0,     0,   144,    50,
      53,    66,    65,    64,    63,    62,     0,    54,     0,    55,
      56,    57,    61,   109,   110,     0,   132,   131,     0,   135,
       0,    59,    60,   161,   163,   162,   164,     0,    58,     0,
     221,   222,     0,    67,    51,    52,     0,     0,     0,   140,
     169,     0,     0,   139,     0,   179,   184,   112,     0,    83,
     223,     0,   222,     0,     0,   145,   146,   149,    71,   208,
     209,   210,     0,     0,   207,   206,   130,   134,     0,     0,
     197,   268,   266,   267,   255,   256,   257,   258,   259,   260,
     262,   263,   261,   264,   265,     0,     0,     0,     0,     0,
      47,   154,   193,   153,   151,   152,     0,   158,   157,   159,
       0,     0,   103,   106,   198,   208,     0,   170,   171,   174,
     173,   189,   166,   165,   167,     0,     0,   180,   181,     0,
       0,   185,   186,     0,     0,   113,   114,    70,    82,    84,
      87,    86,    68,   101,   143,     0,   148,     0,    99,   211,
     212,   213,   214,   216,   215,   100,     0,     0,   141,   142,
       0,   137,   138,     0,   227,   208,     0,   229,   230,   231,
      75,    80,     0,    77,     0,   207,   206,   221,     0,     0,
      92,    72,     0,    73,   155,     0,     0,   102,     0,   107,
     105,     0,   168,     0,   176,     0,     0,   182,     0,     0,
     187,     0,     0,     0,     0,     0,   115,    85,   147,   150,
       0,     0,     0,   133,   128,    69,   129,   254,   249,   251,
     250,   253,   252,   242,   243,   244,   247,   245,   246,   248,
     241,   233,   239,   232,   234,   235,   236,   237,   238,   240,
       0,    79,    76,    91,     0,    74,    42,     0,    43,    44,
      41,   108,   104,   175,   172,   193,   191,   190,   183,   178,
     188,   177,   116,     0,   120,   118,   122,     0,     0,    95,
       0,    78,    93,   160,   192,     0,     0,   117,     0,   127,
       0,   123,   124,    88,    90,    89,    94,     0,     0,   121,
       0,     0,   125,    96,   119,   126,   111
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      43,    44,    19,    20,    29,    39,    63,   357,    71,    83,
      84,    93,   119,   120,   121,   122,   123,   124,   125,   207,
     280,   126,   169,   248,   249,   250,   317,   393,   208,   289,
     127,   128,   266,   129,   130,   221,   222,   300,   131,   132,
     133,   244,   245,   246,   315,   387,   390,   391,   392,   134,
     135,   136,   137,   138,   270,   139,   272,   140,   174,   175,
     176,   256,   217,   152,   218,   219,   141,   142,   143,   144,
     162,   226,   227,   228,   229,   230,   145,   146,   236,   237,
     238,   240,   241,   242,   304,   367,    74,    75,    21,   148,
      36,   283,   231,   184,   267,    91,   185,   150,   172,   288,
     350,   209
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -349
static const yytype_int16 yypact[] =
{
      45,  -349,    79,   131,  -349,    34,    47,    83,    52,   134,
      -7,    70,    94,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,    35,    67,  -349,  -349,  -349,  -349,  -349,
    -349,    73,     9,     9,     9,     9,  -349,   131,  -349,   105,
      96,  -349,  -349,    53,    51,    36,    37,    56,    57,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,    69,    74,  -349,  -349,
    -349,  -349,    74,  -349,  -349,  -349,   135,   142,   145,   144,
     148,   188,   134,   173,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,   281,  -349,   198,   112,   114,  -349,  -349,  -349,
    -349,     9,  -349,   200,  -349,  -349,  -349,   212,   294,   189,
     281,    70,   -19,   123,   223,   225,   226,   129,  -349,   -86,
    -349,  -349,  -349,   124,  -349,  -349,    32,     9,    32,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,   231,  -349,   242,  -349,
    -349,  -349,  -349,  -349,  -349,   238,  -349,  -349,   123,   138,
     146,  -349,  -349,  -349,  -349,  -349,  -349,   241,  -349,   195,
    -349,   -85,     4,  -349,  -349,  -349,   149,     9,   252,  -349,
     325,   254,   270,  -349,   280,   264,   267,   258,   287,   345,
    -349,   288,  -349,   292,   194,   196,  -349,  -349,  -349,  -349,
    -349,  -349,   345,    68,  -349,  -349,  -349,  -349,   171,   110,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,    -2,   345,   297,   208,   345,
    -349,  -349,    74,  -349,  -349,  -349,   207,  -349,  -349,  -349,
      32,     7,  -349,   219,  -349,   269,   214,   217,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,   345,   306,   264,  -349,   345,
     305,   267,  -349,   345,   113,   258,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,    32,   159,   289,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,     9,   345,  -349,  -349,
     123,  -349,  -349,   332,   333,   237,   363,  -349,  -349,  -349,
    -349,  -349,   364,  -349,   293,   365,   271,   368,   345,   -39,
    -349,  -349,   345,  -349,  -349,    33,   369,  -349,     9,  -349,
    -349,   345,  -349,   325,   -47,   370,   371,  -349,   372,   383,
    -349,   384,   165,   165,   165,   386,  -349,   290,  -349,  -349,
       9,   387,   343,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
     345,  -349,  -349,  -349,   345,  -349,  -349,   295,  -349,  -349,
    -349,  -349,  -349,  -349,  -349,    74,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,   389,   291,  -349,    -1,    19,   393,  -349,
       9,  -349,  -349,  -349,  -349,   392,   165,  -349,    32,  -349,
     373,    -1,  -349,  -349,  -349,  -349,  -349,   406,   171,  -349,
     407,   408,  -349,  -349,  -349,  -349,  -349
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -349,  -349,   401,  -349,   377,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,  -349,   344,  -349,  -349,  -349,  -349,  -349,
    -349,  -349,  -349,   317,  -349,  -349,  -349,  -349,  -349,  -349,
    -349,   213,  -349,  -349,  -349,  -349,  -349,  -349,  -274,  -349,
    -349,  -349,  -349,  -349,  -348,  -349,   119,  -349,  -349,  -349,
    -349,  -349,  -349,   174,  -349,  -349,  -349,  -349,    29,  -349,
     -95,  -349,  -349,  -349,    23,  -187,  -349,   315,  -349,  -349,
    -250,  -349,   167,  -349,  -349,  -349,  -349,  -349,  -349,  -349,
     -97,  -349,  -349,   121,  -349,  -195,  -349,  -349,  -349,  -349,
     190,  -349,  -349,   184,  -349,  -349,  -209,   366,   -13,  -349,
     328,  -349,  -118,   221,  -349,   -98,   -89,   227,    -9,  -349,
    -349,  -349
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -206
static const yytype_int16 yytable[] =
{
      30,   271,   157,   294,   149,   318,   164,   161,   210,   149,
     183,   297,   351,   100,    26,   108,  -140,  -139,   159,  -140,
    -139,   358,    28,    45,    46,    47,    48,   171,   389,   177,
     388,   274,   275,   180,   181,   109,   110,   111,   112,   113,
     305,   187,    26,   389,   308,   365,   276,   366,   311,     1,
      28,   251,    26,   179,   180,   181,   170,   110,   111,   112,
      28,   353,   354,    30,   257,    26,    26,   356,    22,   170,
     110,   111,   112,    28,    28,    87,    88,    89,    90,     4,
     147,    23,    96,   160,   151,   147,    25,   284,   290,   151,
      24,   293,    31,   163,   273,   211,   212,   213,    37,   214,
     215,   216,    41,   394,   277,   278,   279,    42,   173,    50,
     282,   298,    32,    33,    34,    35,   286,   258,   206,   259,
     260,   261,   262,   263,   264,   373,   374,   375,   -81,   312,
      64,   296,   206,    40,    67,    68,     5,     6,   400,     7,
       8,     9,   313,    26,   108,   314,    10,   159,   223,   322,
      11,    28,    66,    65,    69,    70,   384,   -81,   -81,   -81,
     -81,   -81,   -81,   -81,   -81,   -81,   177,    26,    27,    77,
     352,    72,   265,   323,   355,    28,    73,    78,    80,   163,
     163,    79,    81,   363,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,   151,   359,    26,   399,
      82,    97,   159,    98,    26,   268,    28,    86,   159,    92,
     269,   271,    28,    99,   100,    94,   153,    95,   101,    11,
     102,   103,   104,   156,   105,   160,   106,   165,   107,   166,
     167,   118,   381,    26,   108,   178,   382,   109,   110,   111,
     112,   113,   186,   188,   189,   190,   114,   115,   116,   117,
     211,   212,   213,   220,   214,   215,   224,   321,   232,   395,
     191,   192,   193,   194,   195,   196,   197,   198,   199,   200,
     201,   202,   203,   204,   233,    26,   179,   180,   181,   170,
     110,   111,   112,    28,   234,   235,   360,   239,   243,   223,
     182,   247,   252,   205,   206,    97,   253,   254,   154,   177,
     255,   291,   118,   163,   163,   163,   292,    99,   100,   295,
     299,   378,   101,    11,   102,   103,   104,   302,   105,   301,
     106,   303,   107,    87,    88,    89,    90,    26,   108,   306,
     309,   109,   110,   111,   112,   113,   324,  -205,   320,  -136,
     114,   115,   116,   117,   327,   328,   329,   330,   331,   332,
     333,   334,   335,   336,   337,   338,   339,   340,    26,   225,
     180,   181,   170,   110,   111,   112,    28,   325,   326,  -203,
     206,   397,  -204,   361,   368,   369,   370,   163,    26,   179,
     180,   181,   170,   110,   111,   112,    28,   371,   372,   163,
     376,   379,   380,   385,   377,   386,   118,   396,   383,   341,
     401,   342,   343,   344,   345,   346,   347,   348,   349,   398,
     403,   405,   406,    38,    49,   155,    85,   362,   281,   316,
     402,   404,   168,   319,   364,   310,   285,   307,    76,   158,
       0,     0,   287
};

static const yytype_int16 yycheck[] =
{
       9,   188,   100,   212,    93,   255,   103,   102,     4,    98,
     128,     4,   286,    14,    33,    34,   102,   102,    37,   105,
     105,   295,    41,    32,    33,    34,    35,   116,   376,   118,
      31,    33,    34,    35,    36,    37,    38,    39,    40,    41,
     235,   138,    33,   391,   239,    92,    48,    94,   243,     4,
      41,   169,    33,    34,    35,    36,    37,    38,    39,    40,
      41,   100,   101,    72,   182,    33,    33,    34,    34,    37,
      38,    39,    40,    41,    41,    42,    43,    44,    45,     0,
      93,    34,    91,   102,    93,    98,    34,   205,   206,    98,
       7,   209,    99,   102,   189,    91,    92,    93,     4,    95,
      96,    97,    35,   377,   106,   107,   108,    34,   117,     4,
     205,   104,    42,    43,    44,    45,   205,    49,    99,    51,
      52,    53,    54,    55,    56,   312,   313,   314,     4,    16,
      34,   220,    99,    98,    98,    98,     5,     6,   388,     8,
       9,    10,    29,    33,    34,    32,    15,    37,   157,   267,
      19,    41,   101,   100,    98,    98,   365,    33,    34,    35,
      36,    37,    38,    39,    40,    41,   255,    33,    34,    34,
     288,   102,   104,   270,   292,    41,   102,    35,    34,   188,
     189,    36,    34,   301,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,   205,   295,    33,   386,
      12,     1,    37,     3,    33,    34,    41,    34,    37,    11,
      39,   398,    41,    13,    14,   103,     4,   103,    18,    19,
      20,    21,    22,    34,    24,   102,    26,     4,    28,     4,
       4,   102,   350,    33,    34,     4,   354,    37,    38,    39,
      40,    41,     4,   105,    98,     4,    46,    47,    48,    49,
      91,    92,    93,   104,    95,    96,     4,   266,     4,   377,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,     4,    33,    34,    35,    36,    37,
      38,    39,    40,    41,     4,    21,   295,    20,    30,   298,
      48,     4,     4,    98,    99,     1,     4,   103,     4,   388,
     104,     4,   102,   312,   313,   314,    98,    13,    14,   102,
      91,   320,    18,    19,    20,    21,    22,   103,    24,    50,
      26,   104,    28,    42,    43,    44,    45,    33,    34,    23,
      25,    37,    38,    39,    40,    41,     4,     4,    49,   102,
      46,    47,    48,    49,    51,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    33,    34,
      35,    36,    37,    38,    39,    40,    41,     4,     4,     4,
      99,   380,     4,     4,     4,     4,     4,   386,    33,    34,
      35,    36,    37,    38,    39,    40,    41,     4,     4,   398,
       4,     4,    49,     4,   104,   104,   102,     4,   103,   106,
      27,   108,   109,   110,   111,   112,   113,   114,   115,    17,
       4,     4,     4,    12,    37,    98,    72,   298,   205,   245,
     391,   398,   107,   256,   303,   241,   205,   237,    62,   101,
      -1,    -1,   205
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   117,   118,     0,     5,     6,     8,     9,    10,
      15,    19,   119,   120,   121,   122,   123,   124,   125,   128,
     129,   214,    34,    34,     7,    34,    33,    34,    41,   130,
     224,    99,    42,    43,    44,    45,   216,     4,   118,   131,
      98,    35,    34,   126,   127,   224,   224,   224,   224,   120,
       4,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,   132,    34,   100,   101,    98,    98,    98,
      98,   134,   102,   102,   212,   213,   213,    34,    35,    36,
      34,    34,    12,   135,   136,   130,    34,    42,    43,    44,
      45,   221,    11,   137,   103,   103,   224,     1,     3,    13,
      14,    18,    20,    21,    22,    24,    26,    28,    34,    37,
      38,    39,    40,    41,    46,    47,    48,    49,   102,   138,
     139,   140,   141,   142,   143,   144,   147,   156,   157,   159,
     160,   164,   165,   166,   175,   176,   177,   178,   179,   181,
     183,   192,   193,   194,   195,   202,   203,   214,   215,   222,
     223,   224,   189,     4,     4,   139,    34,   221,   216,    37,
     102,   176,   196,   224,   196,     4,     4,     4,   183,   148,
      37,   222,   224,   224,   184,   185,   186,   222,     4,    34,
      35,    36,    48,   218,   219,   222,     4,   196,   105,    98,
       4,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    98,    99,   145,   154,   227,
       4,    91,    92,    93,    95,    96,    97,   188,   190,   191,
     104,   161,   162,   224,     4,    34,   197,   198,   199,   200,
     201,   218,     4,     4,     4,    21,   204,   205,   206,    20,
     207,   208,   209,    30,   167,   168,   169,     4,   149,   150,
     151,   218,     4,     4,   103,   104,   187,   218,    49,    51,
      52,    53,    54,    55,    56,   104,   158,   220,    34,    39,
     180,   181,   182,   176,    33,    34,    48,   106,   107,   108,
     146,   147,   176,   217,   218,   219,   222,   223,   225,   155,
     218,     4,    98,   218,   212,   102,   222,     4,   104,    91,
     163,    50,   103,   104,   210,   201,    23,   206,   201,    25,
     209,   201,    16,    29,    32,   170,   169,   152,   186,   188,
      49,   224,   218,   196,     4,     4,     4,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,   106,   108,   109,   110,   111,   112,   113,   114,   115,
     226,   154,   218,   100,   101,   218,    34,   133,   154,   221,
     224,     4,   162,   218,   199,    92,    94,   211,     4,     4,
       4,     4,     4,   181,   181,   181,     4,   104,   224,     4,
      49,   218,   218,   103,   212,     4,   104,   171,    31,   160,
     172,   173,   174,   153,   154,   218,     4,   224,    17,   181,
     186,    27,   174,     4,   180,     4,     4
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
#line 354 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 358 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 364 "pir.y"
    { /*set_hll($2, $4);*/ ;}
    break;

  case 17:
#line 368 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 378 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 380 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].fixme); ;}
    break;

  case 21:
#line 384 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 22:
#line 386 "pir.y"
    { ;}
    break;

  case 24:
#line 399 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 27:
#line 407 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 28:
#line 409 "pir.y"
    { { set_sub_flag(lexer, (yyvsp[(2) - (2)].ival)); } ;}
    break;

  case 29:
#line 413 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 30:
#line 415 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 31:
#line 417 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 32:
#line 419 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 33:
#line 421 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 34:
#line 423 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 35:
#line 425 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 36:
#line 427 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 37:
#line 429 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 38:
#line 431 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 39:
#line 433 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 435 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEXID; /* do something with this */ ;}
    break;

  case 47:
#line 450 "pir.y"
    { /* set_param_flag($2, $3);
                          IF_NAMED_PARAM_SET_ALIAS($2, $3);
                          */
                        ;}
    break;

  case 49:
#line 461 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 51:
#line 467 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 52:
#line 469 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 67:
#line 489 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                              fprintf(stderr, "Too many errors. Compilation aborted.\n");
                              exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                          }
                          yyerrok;
                        ;}
    break;

  case 68:
#line 498 "pir.y"
    { set_instr(lexer, "null");
                          add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                        ;}
    break;

  case 69:
#line 502 "pir.y"
    { set_instr(lexer, "null");
                          add_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                        ;}
    break;

  case 70:
#line 508 "pir.y"
    { set_instr(lexer, "get_results");
                          add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                        ;}
    break;

  case 72:
#line 517 "pir.y"
    { add_first_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 73:
#line 543 "pir.y"
    { assign(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 74:
#line 545 "pir.y"
    { assign(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 75:
#line 547 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 76:
#line 551 "pir.y"
    { assign(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 77:
#line 553 "pir.y"
    { assign(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 78:
#line 555 "pir.y"
    { assign(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 79:
#line 557 "pir.y"
    { assign(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 80:
#line 559 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 81:
#line 563 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 86:
#line 576 "pir.y"
    { add_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 87:
#line 581 "pir.y"
    { /* nothing to do */;}
    break;

  case 88:
#line 583 "pir.y"
    { add_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 91:
#line 591 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 92:
#line 595 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 93:
#line 597 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 97:
#line 605 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 98:
#line 606 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 101:
#line 614 "pir.y"
    { set_instr(lexer, "branch");
                           add_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 102:
#line 620 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 103:
#line 624 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 104:
#line 626 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 105:
#line 630 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 106:
#line 633 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 107:
#line 634 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 108:
#line 640 "pir.y"
    { set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval)); ;}
    break;

  case 111:
#line 655 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                             (yyval.fixme) = NULL;
                           ;}
    break;

  case 112:
#line 663 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 113:
#line 665 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 114:
#line 669 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 115:
#line 671 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 116:
#line 675 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 117:
#line 679 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 118:
#line 681 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 119:
#line 684 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 120:
#line 688 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 121:
#line 690 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 122:
#line 696 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 123:
#line 698 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 124:
#line 702 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 125:
#line 704 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 126:
#line 708 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 127:
#line 710 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 128:
#line 714 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 129:
#line 716 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 130:
#line 718 "pir.y"
    { set_invocation_results((yyvsp[(1) - (2)].invo), NULL); ;}
    break;

  case 133:
#line 727 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 134:
#line 734 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 135:
#line 740 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 136:
#line 742 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 139:
#line 750 "pir.y"
    { (yyval.targ) = target_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 140:
#line 752 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 141:
#line 756 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 142:
#line 758 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 143:
#line 763 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 144:
#line 767 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 145:
#line 769 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 146:
#line 773 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 147:
#line 775 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 148:
#line 779 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 149:
#line 787 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 150:
#line 789 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 151:
#line 793 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 152:
#line 795 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 153:
#line 797 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 154:
#line 799 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 155:
#line 801 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 156:
#line 807 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 157:
#line 809 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 160:
#line 817 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 165:
#line 832 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 166:
#line 836 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 167:
#line 840 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 168:
#line 846 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 169:
#line 850 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 170:
#line 852 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 171:
#line 856 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 172:
#line 858 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 175:
#line 866 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 176:
#line 872 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 177:
#line 882 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 178:
#line 890 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 179:
#line 896 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 180:
#line 898 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 181:
#line 903 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 182:
#line 905 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 183:
#line 910 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 184:
#line 914 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 185:
#line 916 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 186:
#line 920 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 187:
#line 922 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 188:
#line 926 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 189:
#line 931 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 190:
#line 933 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 191:
#line 937 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 192:
#line 939 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 193:
#line 945 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 194:
#line 947 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 195:
#line 951 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 196:
#line 955 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 198:
#line 960 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), GLOBALCONST); ;}
    break;

  case 199:
#line 964 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 200:
#line 966 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 201:
#line 968 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 202:
#line 970 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 203:
#line 979 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 204:
#line 980 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 205:
#line 981 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 206:
#line 984 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 207:
#line 985 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 208:
#line 988 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 209:
#line 989 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 210:
#line 990 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 211:
#line 993 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 212:
#line 994 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 213:
#line 995 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 214:
#line 996 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 215:
#line 997 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 216:
#line 998 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 217:
#line 1001 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 218:
#line 1002 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 219:
#line 1003 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 220:
#line 1004 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 221:
#line 1007 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 222:
#line 1008 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 223:
#line 1011 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 224:
#line 1012 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 225:
#line 1013 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 226:
#line 1014 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), 0); ;}
    break;

  case 229:
#line 1021 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 230:
#line 1022 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 231:
#line 1023 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 232:
#line 1026 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 233:
#line 1027 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 234:
#line 1028 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 235:
#line 1029 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 236:
#line 1030 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 237:
#line 1031 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 238:
#line 1032 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 239:
#line 1033 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 240:
#line 1034 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 241:
#line 1035 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 242:
#line 1036 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 243:
#line 1037 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 244:
#line 1038 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 245:
#line 1039 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 246:
#line 1040 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 247:
#line 1041 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 248:
#line 1042 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 249:
#line 1043 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 250:
#line 1044 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 251:
#line 1045 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 252:
#line 1046 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 253:
#line 1047 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 254:
#line 1048 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 255:
#line 1052 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 256:
#line 1053 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 257:
#line 1054 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 258:
#line 1055 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 259:
#line 1056 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 260:
#line 1057 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 261:
#line 1058 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 262:
#line 1059 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 263:
#line 1060 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 264:
#line 1061 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 265:
#line 1062 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 266:
#line 1063 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 267:
#line 1064 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 268:
#line 1065 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3104 "pirparser.c"
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


#line 1067 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


