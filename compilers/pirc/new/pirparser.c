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
     TK_FLAG_LEXID = 349,
     TK_FLAG_UNIQUE_REG = 350,
     TK_FLAG_NAMED = 351,
     TK_FLAG_SLURPY = 352,
     TK_FLAG_FLAT = 353,
     TK_FLAG_OPTIONAL = 354,
     TK_FLAG_OPT_FLAG = 355,
     TK_FLAG_INVOCANT = 356
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
#define TK_FLAG_LEXID 349
#define TK_FLAG_UNIQUE_REG 350
#define TK_FLAG_NAMED 351
#define TK_FLAG_SLURPY 352
#define TK_FLAG_FLAT 353
#define TK_FLAG_OPTIONAL 354
#define TK_FLAG_OPT_FLAG 355
#define TK_FLAG_INVOCANT 356




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
#line 395 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 408 "pirparser.c"

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
#define YYLAST   472

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  116
/* YYNRULES -- Number of rules.  */
#define YYNRULES  279
/* YYNRULES -- Number of states.  */
#define YYNSTATES  416

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
       2,     2,     2,   111,     2,     2,     2,   116,   118,     2,
     106,   107,   115,   113,   108,   110,   109,   114,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   105,
       2,   102,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   103,     2,   104,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   117,     2,   112,     2,     2,     2,
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
      95,    96,    97,    98,    99,   100,   101,   119
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
     387,   389,   391,   393,   395,   397,   399,   401,   403,   405,
     409,   410,   412,   414,   418,   421,   422,   425,   427,   429,
     431,   433,   436,   437,   440,   442,   444,   449,   451,   453,
     455,   457,   461,   465,   469,   473,   474,   476,   478,   482,
     484,   486,   490,   493,   499,   505,   506,   508,   510,   513,
     517,   518,   520,   522,   525,   529,   530,   533,   535,   538,
     539,   541,   545,   548,   551,   555,   560,   565,   570,   575,
     577,   579,   581,   583,   585,   587,   589,   591,   593,   595,
     597,   599,   601,   603,   605,   607,   609,   611,   613,   615,
     617,   619,   621,   623,   625,   627,   629,   631,   633,   635,
     637,   639,   641,   643,   645,   647,   649,   651,   653,   655,
     657,   659,   661,   663,   665,   667,   669,   671,   673,   675,
     677,   679,   681,   683,   685,   687,   689,   691,   693,   695,
     697,   699,   701,   703,   705,   707,   709,   711,   713,   715
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     121,     0,    -1,   122,   123,   122,    -1,    -1,     4,    -1,
     124,    -1,   123,     4,   124,    -1,   132,    -1,   221,    -1,
     129,    -1,   127,    -1,   128,    -1,   126,    -1,   125,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,    -1,
       6,    34,   102,    34,    -1,    15,   103,   130,   104,    -1,
      -1,   131,    -1,    34,    -1,   131,   105,    34,    -1,    -1,
      -1,    10,   135,   133,   136,     4,   134,   139,   141,    11,
      -1,   232,    -1,    34,    -1,    -1,   136,   137,    -1,    86,
      -1,    83,    -1,    84,    -1,    85,    -1,    87,    -1,    90,
      -1,    92,    -1,    93,    -1,    91,    -1,    88,   106,   135,
     107,    -1,    89,   219,    -1,    94,   220,    -1,   232,    -1,
      34,    -1,   159,    -1,   228,    -1,    -1,   139,   140,    -1,
      12,   228,   232,   196,     4,    -1,    -1,    -1,   141,   142,
     143,    -1,     3,     4,    -1,     3,   144,    -1,   144,    -1,
     161,    -1,   166,    -1,   167,    -1,   171,    -1,   222,    -1,
     199,    -1,   200,    -1,   172,    -1,   149,    -1,   148,    -1,
     147,    -1,   146,    -1,   145,    -1,     1,     4,    -1,    52,
     229,     4,    -1,   229,   102,    52,     4,    -1,    28,   190,
       4,    -1,   152,     4,    -1,   229,   150,     4,    -1,   235,
     225,    -1,   159,   102,   225,    -1,   102,   151,    -1,   233,
     225,    -1,   224,    -1,   225,   234,   225,    -1,   229,   159,
      -1,   152,    -1,    -1,    45,   153,   154,    -1,    -1,   155,
      -1,   156,   157,    -1,   225,    -1,    -1,   157,   108,   158,
      -1,   225,    -1,   159,    -1,   103,   160,   104,    -1,   225,
      -1,   160,   105,   225,    -1,   162,   165,   164,   232,     4,
      -1,   163,   225,   164,   232,     4,    -1,    50,    -1,    51,
      -1,    50,    52,    -1,    51,    52,    -1,    53,    -1,   108,
      -1,   225,    -1,   225,   227,   225,    -1,    53,   232,     4,
      -1,    14,   228,   168,     4,    -1,   169,    -1,   168,   108,
     169,    -1,   232,   170,    -1,    -1,    95,    -1,    13,    34,
     108,   229,     4,    -1,   173,    -1,   182,    -1,    26,     4,
     174,   177,     4,   179,    27,     4,    -1,    -1,   175,    -1,
     176,    -1,   175,   176,    -1,    30,   208,     4,    -1,    29,
     188,   178,    -1,    32,   188,    -1,    16,   188,     4,    17,
     187,    -1,    -1,   108,   188,    -1,    -1,   180,    -1,   181,
      -1,   180,   181,    -1,    31,   193,     4,    -1,   167,    -1,
     190,   102,   183,     4,    -1,   229,   102,   183,     4,    -1,
     183,     4,    -1,   185,    -1,   184,    -1,   188,   109,   187,
     203,    -1,   186,   203,    -1,   188,    -1,    34,    -1,   188,
      -1,   189,    -1,   232,    -1,    41,    -1,    37,    -1,    34,
      -1,    43,    -1,    39,    -1,   106,   191,   107,    -1,    -1,
     192,    -1,   193,    -1,   192,   108,   193,    -1,   229,   194,
      -1,    -1,   194,   195,    -1,    99,    -1,   100,    -1,    97,
      -1,    95,    -1,    96,   219,    -1,    -1,   196,   197,    -1,
     195,    -1,   198,    -1,   101,   106,   138,   107,    -1,   201,
      -1,   209,    -1,   202,    -1,   210,    -1,    20,   203,     4,
      -1,    20,   183,     4,    -1,    21,   203,     4,    -1,   106,
     204,   107,    -1,    -1,   205,    -1,   206,    -1,   205,   108,
     206,    -1,   208,    -1,   207,    -1,    34,    54,   225,    -1,
     225,   217,    -1,    24,     4,   214,    25,     4,    -1,    22,
       4,   211,    23,     4,    -1,    -1,   212,    -1,   213,    -1,
     212,   213,    -1,    21,   208,     4,    -1,    -1,   215,    -1,
     216,    -1,   215,   216,    -1,    20,   208,     4,    -1,    -1,
     217,   218,    -1,    98,    -1,    96,   219,    -1,    -1,   220,
      -1,   106,    34,   107,    -1,    19,   223,    -1,   221,     4,
      -1,    18,   223,     4,    -1,    46,   232,   102,    35,    -1,
      47,   232,   102,    36,    -1,    48,   232,   102,    34,    -1,
      49,   232,   102,    34,    -1,   226,    -1,   230,    -1,    33,
      -1,   229,    -1,   226,    -1,    34,    -1,    35,    -1,    36,
      -1,    55,    -1,    56,    -1,    57,    -1,    58,    -1,    60,
      -1,    59,    -1,    46,    -1,    47,    -1,    48,    -1,    49,
      -1,   230,    -1,   232,    -1,    41,    -1,    42,    -1,    44,
      -1,    43,    -1,   231,    -1,    37,    -1,    38,    -1,    40,
      -1,    39,    -1,    33,    -1,    45,    -1,   110,    -1,   111,
      -1,   112,    -1,   113,    -1,   110,    -1,   114,    -1,   115,
      -1,   116,    -1,   117,    -1,   118,    -1,   112,    -1,   119,
      -1,    68,    -1,    61,    -1,    62,    -1,    63,    -1,    65,
      -1,    66,    -1,    64,    -1,    67,    -1,    56,    -1,    58,
      -1,    57,    -1,    60,    -1,    59,    -1,    55,    -1,    72,
      -1,    73,    -1,    74,    -1,    75,    -1,    76,    -1,    77,
      -1,    80,    -1,    78,    -1,    79,    -1,    81,    -1,    82,
      -1,    70,    -1,    71,    -1,    69,    -1
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
     771,   775,   776,   779,   781,   783,   787,   789,   791,   796,
     801,   802,   806,   808,   812,   821,   822,   826,   828,   830,
     832,   834,   841,   842,   846,   847,   850,   857,   858,   861,
     862,   865,   869,   873,   879,   884,   885,   889,   891,   895,
     896,   899,   905,   913,   921,   930,   931,   936,   938,   943,
     948,   949,   953,   955,   959,   965,   966,   970,   972,   979,
     980,   984,   988,   992,   993,   997,   999,  1001,  1003,  1013,
    1014,  1015,  1018,  1019,  1022,  1023,  1024,  1027,  1028,  1029,
    1030,  1031,  1032,  1035,  1036,  1037,  1038,  1041,  1042,  1045,
    1046,  1047,  1048,  1049,  1052,  1053,  1054,  1055,  1058,  1059,
    1062,  1063,  1064,  1067,  1068,  1069,  1070,  1071,  1072,  1073,
    1074,  1075,  1076,  1077,  1078,  1079,  1080,  1081,  1082,  1083,
    1084,  1085,  1086,  1087,  1088,  1089,  1093,  1094,  1095,  1096,
    1097,  1098,  1099,  1100,  1101,  1102,  1103,  1104,  1105,  1106
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
  "\":postcomp\"", "\":immediate\"", "\":lexid\"", "\":unique_reg\"",
  "\":named\"", "\":slurpy\"", "\":flat\"", "\":optional\"",
  "\":opt_flag\"", "\":invocant\"", "'='", "'['", "']'", "';'", "'('",
  "')'", "','", "'.'", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'",
  "'|'", "'&'", "\"**\"", "$accept", "TOP", "opt_nl", "pir_chunks",
  "pir_chunk", "pir_pragma", "loadlib", "hll_specifier", "hll_mapping",
  "namespace_decl", "opt_namespace_id", "namespace_id", "sub_def", "@1",
  "@2", "sub_id", "sub_flags", "sub_flag", "multi_type", "parameters",
  "parameter", "instructions", "@3", "instruction", "statement",
  "error_stat", "null_stat", "getresults_stat", "parrot_stat",
  "assignment_stat", "assign_tail", "assign_expr", "parrot_instruction",
  "@4", "opt_parrot_op_args", "parrot_op_args", "first_op_arg",
  "other_op_args", "other_op_arg", "keylist", "keys", "conditional_stat",
  "if_type", "if_null_type", "then", "condition", "goto_stat",
  "local_decl", "local_id_list", "local_id", "has_unique_reg", "lex_decl",
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
  "expression", "constant", "rel_op", "type", "target", "reg", "pasm_reg",
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
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,    61,    91,    93,    59,    40,    41,    44,    46,
      45,    33,   126,    43,    47,    42,    37,   124,    38,   357
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   120,   121,   122,   122,   123,   123,   124,   124,   124,
     124,   124,   124,   124,   125,   126,   127,   128,   129,   130,
     130,   131,   131,   133,   134,   132,   135,   135,   136,   136,
     137,   137,   137,   137,   137,   137,   137,   137,   137,   137,
     137,   137,   138,   138,   138,   138,   139,   139,   140,   141,
     142,   141,   143,   143,   143,   144,   144,   144,   144,   144,
     144,   144,   144,   144,   144,   144,   144,   144,   145,   146,
     146,   147,   148,   149,   150,   150,   150,   151,   151,   151,
     151,   151,   153,   152,   154,   154,   155,   156,   157,   157,
     158,   158,   159,   160,   160,   161,   161,   162,   162,   163,
     163,   164,   164,   165,   165,   166,   167,   168,   168,   169,
     170,   170,   171,   172,   172,   173,   174,   174,   175,   175,
     176,   177,   177,   177,   178,   178,   179,   179,   180,   180,
     181,   181,   182,   182,   182,   183,   183,   184,   185,   186,
     186,   187,   187,   188,   188,   188,   189,   189,   189,   190,
     191,   191,   192,   192,   193,   194,   194,   195,   195,   195,
     195,   195,   196,   196,   197,   197,   198,   199,   199,   200,
     200,   201,   201,   202,   203,   204,   204,   205,   205,   206,
     206,   207,   208,   209,   210,   211,   211,   212,   212,   213,
     214,   214,   215,   215,   216,   217,   217,   218,   218,   219,
     219,   220,   221,   222,   222,   223,   223,   223,   223,   224,
     224,   224,   225,   225,   226,   226,   226,   227,   227,   227,
     227,   227,   227,   228,   228,   228,   228,   229,   229,   230,
     230,   230,   230,   230,   231,   231,   231,   231,   232,   232,
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
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       0,     1,     1,     3,     2,     0,     2,     1,     1,     1,
       1,     2,     0,     2,     1,     1,     4,     1,     1,     1,
       1,     3,     3,     3,     3,     0,     1,     1,     3,     1,
       1,     3,     2,     5,     5,     0,     1,     1,     2,     3,
       0,     1,     1,     2,     3,     0,     2,     1,     2,     0,
       1,     3,     2,     2,     3,     4,     4,     4,     4,     1,
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
       0,     0,     3,     5,    13,    12,    10,    11,     9,     7,
       8,    16,     0,     0,    15,   238,    27,   239,    23,    26,
      19,     0,     0,     0,     0,   202,     4,     2,     0,    14,
      28,    21,     0,    20,     0,     0,     0,     0,     6,    17,
       0,    18,     0,     0,     0,     0,     0,    24,    31,    32,
      33,    30,    34,     0,   199,    35,    38,    36,    37,     0,
      29,    22,   205,   206,   207,   208,    46,     0,     0,    40,
     200,    41,    49,     0,     0,     0,    47,    50,    39,   201,
     223,   224,   225,   226,     0,    25,     0,   162,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   140,
     234,   235,   237,   236,   229,   230,   232,   231,   239,    97,
      98,     0,     0,   150,    51,    54,    67,    66,    65,    64,
      63,     0,    55,     0,     0,    56,    57,    58,    62,   113,
     114,     0,   136,   135,     0,   139,     0,    60,    61,   167,
     169,   168,   170,     0,    59,     0,   227,   233,   228,     0,
      68,    52,    53,     0,     0,     0,   145,   144,   175,     0,
       0,   143,     0,   185,   190,   116,     0,    84,    99,   100,
     234,   229,     0,   228,     0,     0,   151,   152,   155,    72,
     214,   215,   216,     0,   103,   213,   212,     0,   134,   138,
       0,     0,   203,   279,   277,   278,   266,   267,   268,   269,
     270,   271,   273,   274,   272,   275,   276,     0,     0,     0,
       0,     0,    48,   160,   199,   159,   157,   158,     0,   164,
     163,   165,     0,     0,   107,   110,   204,   214,     0,   176,
     177,   180,   179,   195,   172,   171,   173,     0,     0,   186,
     187,     0,     0,   191,   192,     0,     0,   117,   118,    71,
      83,    85,    88,    87,    69,   105,   149,     0,   154,   101,
     102,     0,   217,   218,   219,   220,   222,   221,     0,     0,
     146,   148,   147,     0,   141,   142,     0,   238,   214,     0,
     240,   241,   242,    76,    81,     0,    78,     0,   213,   212,
     227,     0,     0,    93,    73,     0,    74,   161,     0,     0,
     106,     0,   111,   109,     0,   174,     0,   182,     0,     0,
     188,     0,     0,   193,     0,     0,     0,     0,     0,   119,
      86,   153,   156,     0,   104,     0,   137,   132,    70,   133,
     265,   260,   262,   261,   264,   263,   253,   254,   255,   258,
     256,   257,   259,   252,   244,   250,   243,   245,   246,   247,
     248,   249,   251,     0,    80,    77,    92,     0,    75,    43,
       0,    44,    45,    42,   112,   108,   181,   178,   199,   197,
     196,   189,   184,   194,   183,   120,     0,   124,   122,   126,
       0,    95,    96,    79,    94,   166,   198,     0,     0,   121,
       0,   131,     0,   127,   128,    89,    91,    90,     0,   125,
       0,     0,   129,   123,   130,   115
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      42,    43,    19,    40,    76,    28,    50,    70,   370,    82,
      86,    87,    96,   124,   125,   126,   127,   128,   129,   130,
     219,   293,   131,   177,   260,   261,   262,   330,   405,   220,
     302,   132,   133,   134,   271,   193,   135,   136,   233,   234,
     313,   137,   138,   139,   256,   257,   258,   328,   399,   402,
     403,   404,   140,   141,   142,   143,   144,   283,   145,   285,
     146,   185,   186,   187,   268,   229,   159,   230,   231,   147,
     148,   149,   150,   170,   238,   239,   240,   241,   242,   151,
     152,   248,   249,   250,   252,   253,   254,   317,   380,    79,
      80,    20,   154,    35,   296,   243,   195,   278,    94,   196,
     156,   157,   183,   301,   363,   221
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -377
static const yytype_int16 yypact[] =
{
      13,  -377,    31,   130,  -377,     4,     6,    45,    33,    41,
     -34,   219,    67,  -377,  -377,  -377,  -377,  -377,  -377,  -377,
    -377,  -377,   -29,    48,  -377,  -377,  -377,  -377,  -377,  -377,
      64,   -13,   -13,   -13,   -13,  -377,   130,  -377,    66,  -377,
    -377,  -377,    14,    16,    17,    21,    23,    24,  -377,  -377,
     159,  -377,    99,   106,    98,   109,   110,  -377,  -377,  -377,
    -377,  -377,  -377,    47,    55,  -377,  -377,  -377,  -377,    55,
    -377,  -377,  -377,  -377,  -377,  -377,  -377,    41,   120,  -377,
    -377,  -377,   144,    58,    60,   265,  -377,   146,  -377,  -377,
    -377,  -377,  -377,  -377,   -13,  -377,   183,  -377,   165,   306,
     137,   265,   219,    -4,    68,   169,   172,   173,    72,  -377,
     -67,  -377,  -377,  -377,   -28,  -377,  -377,  -377,   392,   128,
     129,   253,   -13,   253,  -377,  -377,  -377,  -377,  -377,  -377,
    -377,   179,  -377,   341,   341,  -377,  -377,  -377,  -377,  -377,
    -377,   181,  -377,  -377,    68,    78,    87,  -377,  -377,  -377,
    -377,  -377,  -377,   186,  -377,   369,  -377,  -377,   -10,    10,
    -377,  -377,  -377,    85,   -13,   190,  -377,  -377,   419,   191,
     194,  -377,   195,   185,   193,   184,   211,   341,  -377,  -377,
    -377,  -377,   214,  -377,   215,   122,   123,  -377,  -377,  -377,
    -377,  -377,  -377,   -38,   199,  -377,  -377,   -38,  -377,  -377,
     125,    43,  -377,  -377,  -377,  -377,  -377,  -377,  -377,  -377,
    -377,  -377,  -377,  -377,  -377,  -377,  -377,    20,   341,   226,
     136,   341,  -377,  -377,    55,  -377,  -377,  -377,   126,  -377,
    -377,  -377,   253,     7,  -377,   145,  -377,   206,   132,   153,
    -377,  -377,  -377,  -377,  -377,  -377,  -377,   341,   240,   185,
    -377,   341,   244,   193,  -377,   341,    50,   184,  -377,  -377,
    -377,  -377,  -377,  -377,  -377,  -377,  -377,   253,    51,  -377,
    -377,   -13,  -377,  -377,  -377,  -377,  -377,  -377,   341,   -13,
    -377,  -377,  -377,    68,  -377,  -377,   280,   281,   182,   283,
    -377,  -377,  -377,  -377,  -377,   296,  -377,   305,   297,   200,
     300,   341,   -60,  -377,  -377,   341,  -377,  -377,     1,   302,
    -377,   -13,  -377,  -377,   341,  -377,   419,   -80,   304,   311,
    -377,   317,   318,  -377,   319,    56,    56,    56,   325,  -377,
     201,  -377,  -377,   327,  -377,   329,  -377,  -377,  -377,  -377,
    -377,  -377,  -377,  -377,  -377,  -377,  -377,  -377,  -377,  -377,
    -377,  -377,  -377,  -377,  -377,  -377,  -377,  -377,  -377,  -377,
    -377,  -377,  -377,   341,  -377,  -377,  -377,   341,  -377,  -377,
     228,  -377,  -377,  -377,  -377,  -377,  -377,  -377,    55,  -377,
    -377,  -377,  -377,  -377,  -377,  -377,   332,   229,  -377,     5,
     238,  -377,  -377,  -377,  -377,  -377,  -377,   321,    56,  -377,
     253,  -377,   315,     5,  -377,  -377,  -377,  -377,   125,  -377,
     348,   349,  -377,  -377,  -377,  -377
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -377,  -377,   342,  -377,   351,  -377,  -377,  -377,  -377,  -377,
    -377,  -377,  -377,  -377,  -377,   278,  -377,  -377,  -377,  -377,
    -377,  -377,  -377,  -377,   289,  -377,  -377,  -377,  -377,  -377,
    -377,  -377,   174,  -377,  -377,  -377,  -377,  -377,  -377,  -287,
    -377,  -377,  -377,  -377,   196,  -377,  -377,  -376,  -377,    79,
    -377,  -377,  -377,  -377,  -377,  -377,   135,  -377,  -377,  -377,
    -377,    -8,  -377,   -93,  -377,  -377,  -377,   -14,  -198,  -377,
     290,  -377,  -377,  -258,  -377,   133,  -377,  -377,  -377,  -377,
    -377,  -377,  -377,  -101,  -377,  -377,    81,  -377,  -135,  -377,
    -377,  -377,  -377,   151,  -377,  -377,   149,  -377,  -377,  -218,
     334,    18,  -377,   303,  -377,  -126,   187,  -377,   -96,   -95,
     189,  -377,    -9,  -377,  -377,  -377
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -212
static const yytype_int16 yytable[] =
{
      29,   155,   284,   172,   155,   164,   307,   194,   197,   331,
     169,   310,   364,   401,   222,   269,   378,     1,   379,   101,
      25,   371,    44,    45,    46,    47,   182,   401,   188,    25,
     109,     4,    27,   166,    25,   369,   400,   167,    21,  -145,
      22,    27,  -145,   199,   366,   367,    27,    90,    91,    92,
      93,   263,    23,   287,   288,   191,   192,   110,   111,   112,
     113,   114,   115,   116,   117,   118,   325,    24,    29,    30,
     270,    36,   289,    38,    25,    26,    25,   109,  -144,   326,
     166,  -144,   327,    39,   167,    97,    27,   158,    27,    25,
     158,   297,   303,   166,   171,   306,  -143,   167,    41,  -143,
      49,    27,   168,   406,   218,   223,   224,   225,   286,   226,
     227,   228,   318,   184,   153,   311,   321,   153,    51,    53,
     324,    52,   299,    54,   295,    55,    56,   386,   387,   388,
     290,   291,   292,    71,    73,     5,     6,   309,     7,     8,
       9,    72,   410,    74,    75,    10,   223,   224,   225,    11,
     226,   227,   334,    77,    84,   235,    85,    95,    25,   280,
     396,    78,   166,    57,   281,    88,   167,    89,   282,   160,
      27,   163,   188,   173,   168,   365,   174,   175,   123,   368,
     178,   179,   336,   189,    98,   198,    99,   200,   376,   201,
     202,   171,   171,   232,   236,   244,   100,   101,   245,   246,
     409,   102,    11,   103,   104,   105,   247,   106,   158,   107,
     284,   108,   372,   251,   255,   259,    25,   109,   264,   265,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   266,
     304,   267,   308,   119,   120,   121,   122,   393,   305,   315,
     312,   394,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,   272,   273,   274,   275,   276,   277,
     314,   316,   333,   319,   407,    31,    32,    33,    34,   322,
     335,    25,   190,   191,   192,   180,   111,   112,   113,   181,
     115,   116,   117,    27,   337,  -211,    25,   338,  -140,   123,
     180,   111,   112,   113,   181,   115,   116,   117,    27,   373,
     339,  -209,   235,   218,  -210,   188,   374,    98,   381,   390,
     161,    90,    91,    92,    93,   382,   171,   171,   171,   100,
     101,   383,   384,   385,   102,    11,   103,   104,   105,   389,
     106,   391,   107,   392,   108,   395,   397,   398,   408,    25,
     109,   218,   411,   110,   111,   112,   113,   114,   115,   116,
     117,   118,   414,   415,    37,    83,   119,   120,   121,   122,
     340,   341,   342,   343,   344,   345,   346,   347,   348,   349,
     350,   351,   352,   353,    25,   190,   191,   192,   180,   111,
     112,   113,   181,   115,   116,   117,    27,    48,   162,   171,
     375,   294,   329,   279,   413,   412,   -82,   377,   176,   171,
     320,   332,   323,    81,   298,   165,   300,     0,     0,     0,
       0,     0,   123,     0,     0,   354,     0,   355,   356,   357,
     358,   359,   360,   361,   362,   -82,   -82,   -82,   -82,   -82,
     -82,   -82,   -82,   -82,   -82,   -82,   -82,   -82,   203,   204,
     205,   206,   207,   208,   209,   210,   211,   212,   213,   214,
     215,   216,    25,   237,   191,   192,   180,   111,   112,   113,
     181,   115,   116,   117,    27,     0,     0,     0,     0,     0,
       0,   217,   218
};

static const yytype_int16 yycheck[] =
{
       9,    96,   200,   104,    99,   101,   224,   133,   134,   267,
     103,     4,   299,   389,     4,    53,    96,     4,    98,    14,
      33,   308,    31,    32,    33,    34,   121,   403,   123,    33,
      34,     0,    45,    37,    33,    34,    31,    41,    34,   106,
      34,    45,   109,   144,   104,   105,    45,    46,    47,    48,
      49,   177,     7,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    16,    34,    77,   103,
     108,     4,    52,   102,    33,    34,    33,    34,   106,    29,
      37,   109,    32,    35,    41,    94,    45,    96,    45,    33,
      99,   217,   218,    37,   103,   221,   106,    41,    34,   109,
      34,    45,   106,   390,   103,    95,    96,    97,   201,    99,
     100,   101,   247,   122,    96,   108,   251,    99,   104,   102,
     255,   105,   217,   102,   217,   102,   102,   325,   326,   327,
     110,   111,   112,    34,    36,     5,     6,   232,     8,     9,
      10,    35,   400,    34,    34,    15,    95,    96,    97,    19,
      99,   100,   278,   106,    34,   164,    12,    11,    33,    34,
     378,   106,    37,     4,    39,   107,    41,   107,    43,     4,
      45,    34,   267,     4,   106,   301,     4,     4,   106,   305,
      52,    52,   283,     4,     1,     4,     3,   109,   314,   102,
       4,   200,   201,   108,     4,     4,    13,    14,     4,     4,
     398,    18,    19,    20,    21,    22,    21,    24,   217,    26,
     408,    28,   308,    20,    30,     4,    33,    34,     4,     4,
      37,    38,    39,    40,    41,    42,    43,    44,    45,   107,
       4,   108,   106,    50,    51,    52,    53,   363,   102,   107,
      95,   367,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    55,    56,    57,    58,    59,    60,
      54,   108,   271,    23,   390,    46,    47,    48,    49,    25,
     279,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,     4,     4,    33,     4,   106,   106,
      37,    38,    39,    40,    41,    42,    43,    44,    45,   308,
       4,     4,   311,   103,     4,   400,     4,     1,     4,   108,
       4,    46,    47,    48,    49,     4,   325,   326,   327,    13,
      14,     4,     4,     4,    18,    19,    20,    21,    22,     4,
      24,     4,    26,     4,    28,   107,     4,   108,    17,    33,
      34,   103,    27,    37,    38,    39,    40,    41,    42,    43,
      44,    45,     4,     4,    12,    77,    50,    51,    52,    53,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    36,    99,   398,
     311,   217,   257,   197,   408,   403,     4,   316,   108,   408,
     249,   268,   253,    69,   217,   102,   217,    -1,    -1,    -1,
      -1,    -1,   106,    -1,    -1,   110,    -1,   112,   113,   114,
     115,   116,   117,   118,   119,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    -1,    -1,    -1,    -1,    -1,
      -1,   102,   103
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     8,     9,    10,
      15,    19,   123,   124,   125,   126,   127,   128,   129,   132,
     221,    34,    34,     7,    34,    33,    34,    45,   135,   232,
     103,    46,    47,    48,    49,   223,     4,   122,   102,    35,
     133,    34,   130,   131,   232,   232,   232,   232,   124,    34,
     136,   104,   105,   102,   102,   102,   102,     4,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
     137,    34,    35,    36,    34,    34,   134,   106,   106,   219,
     220,   220,   139,   135,    34,    12,   140,   141,   107,   107,
      46,    47,    48,    49,   228,    11,   142,   232,     1,     3,
      13,    14,    18,    20,    21,    22,    24,    26,    28,    34,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    50,
      51,    52,    53,   106,   143,   144,   145,   146,   147,   148,
     149,   152,   161,   162,   163,   166,   167,   171,   172,   173,
     182,   183,   184,   185,   186,   188,   190,   199,   200,   201,
     202,   209,   210,   221,   222,   229,   230,   231,   232,   196,
       4,     4,   144,    34,   228,   223,    37,    41,   106,   183,
     203,   232,   203,     4,     4,     4,   190,   153,    52,    52,
      37,    41,   229,   232,   232,   191,   192,   193,   229,     4,
      34,    35,    36,   165,   225,   226,   229,   225,     4,   203,
     109,   102,     4,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,   102,   103,   150,
     159,   235,     4,    95,    96,    97,    99,   100,   101,   195,
     197,   198,   108,   168,   169,   232,     4,    34,   204,   205,
     206,   207,   208,   225,     4,     4,     4,    21,   211,   212,
     213,    20,   214,   215,   216,    30,   174,   175,   176,     4,
     154,   155,   156,   225,     4,     4,   107,   108,   194,    53,
     108,   164,    55,    56,    57,    58,    59,    60,   227,   164,
      34,    39,    43,   187,   188,   189,   183,    33,    34,    52,
     110,   111,   112,   151,   152,   183,   224,   225,   226,   229,
     230,   233,   160,   225,     4,   102,   225,   219,   106,   229,
       4,   108,    95,   170,    54,   107,   108,   217,   208,    23,
     213,   208,    25,   216,   208,    16,    29,    32,   177,   176,
     157,   193,   195,   232,   225,   232,   203,     4,     4,     4,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,   110,   112,   113,   114,   115,   116,
     117,   118,   119,   234,   159,   225,   104,   105,   225,    34,
     138,   159,   228,   232,     4,   169,   225,   206,    96,    98,
     218,     4,     4,     4,     4,     4,   188,   188,   188,     4,
     108,     4,     4,   225,   225,   107,   219,     4,   108,   178,
      31,   167,   179,   180,   181,   158,   159,   225,    17,   188,
     193,    27,   181,   187,     4,     4
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
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 145:
#line 784 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 146:
#line 788 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 147:
#line 790 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 148:
#line 792 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 149:
#line 797 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 150:
#line 801 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 151:
#line 803 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 152:
#line 807 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 153:
#line 809 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 154:
#line 813 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 155:
#line 821 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 156:
#line 823 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 157:
#line 827 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 158:
#line 829 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 159:
#line 831 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 160:
#line 833 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 161:
#line 835 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 162:
#line 841 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 163:
#line 843 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 166:
#line 851 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 171:
#line 866 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 172:
#line 870 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 173:
#line 874 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 174:
#line 880 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 175:
#line 884 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 176:
#line 886 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 177:
#line 890 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 178:
#line 892 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 181:
#line 900 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 182:
#line 906 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 183:
#line 916 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 184:
#line 924 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 185:
#line 930 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 186:
#line 932 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 187:
#line 937 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 188:
#line 939 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 189:
#line 944 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 190:
#line 948 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 191:
#line 950 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 192:
#line 954 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 193:
#line 956 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 194:
#line 960 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 195:
#line 965 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 196:
#line 967 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 197:
#line 971 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 198:
#line 973 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 199:
#line 979 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 200:
#line 981 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 201:
#line 985 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 202:
#line 989 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 204:
#line 994 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), GLOBALCONST); ;}
    break;

  case 205:
#line 998 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 206:
#line 1000 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 207:
#line 1002 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 208:
#line 1004 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 209:
#line 1013 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 210:
#line 1014 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 211:
#line 1015 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 212:
#line 1018 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 213:
#line 1019 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 214:
#line 1022 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 215:
#line 1023 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 216:
#line 1024 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 217:
#line 1027 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 218:
#line 1028 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 219:
#line 1029 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 220:
#line 1030 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 221:
#line 1031 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 222:
#line 1032 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 223:
#line 1035 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 224:
#line 1036 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 225:
#line 1037 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 226:
#line 1038 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 227:
#line 1041 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 228:
#line 1042 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 229:
#line 1045 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 230:
#line 1046 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 231:
#line 1047 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 232:
#line 1048 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 234:
#line 1052 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 235:
#line 1053 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 236:
#line 1054 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 237:
#line 1055 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 240:
#line 1062 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 241:
#line 1063 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 242:
#line 1064 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 243:
#line 1067 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 244:
#line 1068 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 245:
#line 1069 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 246:
#line 1070 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 247:
#line 1071 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 248:
#line 1072 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 249:
#line 1073 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 250:
#line 1074 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 251:
#line 1075 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 252:
#line 1076 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 253:
#line 1077 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 254:
#line 1078 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 255:
#line 1079 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 256:
#line 1080 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 257:
#line 1081 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 258:
#line 1082 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 259:
#line 1083 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 260:
#line 1084 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 261:
#line 1085 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 262:
#line 1086 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 263:
#line 1087 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 264:
#line 1088 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 265:
#line 1089 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 266:
#line 1093 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 267:
#line 1094 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 268:
#line 1095 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 269:
#line 1096 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 270:
#line 1097 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 271:
#line 1098 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 272:
#line 1099 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 273:
#line 1100 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 274:
#line 1101 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 275:
#line 1102 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 276:
#line 1103 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 277:
#line 1104 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 278:
#line 1105 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 279:
#line 1106 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3211 "pirparser.c"
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


#line 1108 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


