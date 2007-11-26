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
                                              set_param_named(OBJ, lexer->temp_flag_arg1); \
                                            }


#define GLOBALCONST     1

#define IS_PASM_REG     1



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
#line 79 "pir.y"
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
    struct variable    *varb;

    void *fixme;
}
/* Line 187 of yacc.c.  */
#line 387 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 400 "pirparser.c"

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
#define YYLAST   467

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  118
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  113
/* YYNRULES -- Number of rules.  */
#define YYNRULES  275
/* YYNRULES -- Number of states.  */
#define YYNSTATES  417

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
       2,     2,     2,   107,     2,     2,     2,   112,   114,     2,
     103,   104,   111,   109,   100,   106,   117,   110,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   116,
       2,   105,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   101,     2,   102,     2,     2,     2,     2,     2,     2,
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
      95,    96,    97,    98,    99,   115
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
     178,   181,   185,   190,   194,   197,   201,   204,   208,   211,
     214,   216,   220,   223,   225,   226,   230,   231,   233,   235,
     239,   241,   243,   245,   247,   249,   251,   253,   255,   257,
     259,   261,   263,   265,   267,   269,   271,   273,   275,   277,
     279,   281,   283,   285,   287,   289,   291,   293,   295,   297,
     299,   301,   303,   305,   307,   309,   311,   313,   315,   317,
     319,   321,   325,   327,   331,   333,   335,   337,   343,   349,
     351,   353,   356,   359,   361,   363,   365,   369,   373,   378,
     380,   384,   387,   388,   390,   396,   398,   400,   409,   410,
     412,   414,   417,   421,   425,   428,   434,   435,   438,   439,
     441,   443,   446,   450,   452,   457,   462,   465,   467,   469,
     474,   477,   479,   481,   483,   485,   487,   489,   491,   493,
     495,   497,   500,   504,   506,   510,   513,   514,   517,   519,
     521,   523,   525,   528,   530,   532,   534,   536,   540,   544,
     548,   552,   553,   555,   557,   561,   563,   565,   569,   572,
     578,   584,   585,   587,   589,   592,   596,   597,   599,   601,
     604,   608,   609,   612,   614,   617,   618,   622,   625,   628,
     632,   637,   642,   647,   652,   654,   656,   658,   660,   662,
     664,   666,   668,   670,   672,   674,   676,   678,   680,   682,
     684,   686,   688,   690,   692,   694,   696,   698,   700,   702,
     704,   706,   708,   710,   712,   714
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
     148,    -1,   147,    -1,   146,    -1,   145,    -1,     1,     4,
      -1,    52,   227,     4,    -1,   227,   105,    52,     4,    -1,
      28,   192,     4,    -1,   151,     4,    -1,   227,   149,     4,
      -1,   158,   223,    -1,   159,   105,   223,    -1,   105,   150,
      -1,   156,   223,    -1,   222,    -1,   223,   157,   223,    -1,
     227,   159,    -1,   151,    -1,    -1,    45,   152,   153,    -1,
      -1,   154,    -1,   155,    -1,   154,   100,   155,    -1,   221,
      -1,   106,    -1,   107,    -1,   108,    -1,   109,    -1,   106,
      -1,   110,    -1,   111,    -1,   112,    -1,   113,    -1,   114,
      -1,   108,    -1,   115,    -1,    68,    -1,    61,    -1,    62,
      -1,    63,    -1,    65,    -1,    66,    -1,    64,    -1,    67,
      -1,    56,    -1,    58,    -1,    57,    -1,    60,    -1,    59,
      -1,    55,    -1,    72,    -1,    73,    -1,    74,    -1,    75,
      -1,    76,    -1,    77,    -1,    80,    -1,    78,    -1,    79,
      -1,    81,    -1,    82,    -1,    70,    -1,    71,    -1,    69,
      -1,   101,   160,   102,    -1,   161,    -1,   160,   162,   161,
      -1,   223,    -1,   116,    -1,   100,    -1,   164,   167,   166,
     230,     4,    -1,   165,   223,   166,   230,     4,    -1,    50,
      -1,    51,    -1,    50,    52,    -1,    51,    52,    -1,    53,
      -1,   100,    -1,   223,    -1,   223,   225,   223,    -1,    53,
     230,     4,    -1,    14,   226,   170,     4,    -1,   171,    -1,
     170,   100,   171,    -1,   230,   172,    -1,    -1,    94,    -1,
      13,    34,   100,   227,     4,    -1,   175,    -1,   184,    -1,
      26,     4,   176,   179,     4,   181,    27,     4,    -1,    -1,
     177,    -1,   178,    -1,   177,   178,    -1,    30,   206,     4,
      -1,    29,   190,   180,    -1,    32,   190,    -1,    16,   190,
       4,    17,   189,    -1,    -1,   100,   190,    -1,    -1,   182,
      -1,   183,    -1,   182,   183,    -1,    31,   194,     4,    -1,
     169,    -1,   192,   105,   185,     4,    -1,   227,   105,   185,
       4,    -1,   185,     4,    -1,   187,    -1,   186,    -1,   190,
     117,   189,   201,    -1,   188,   201,    -1,   190,    -1,    34,
      -1,   190,    -1,   191,    -1,   230,    -1,    41,    -1,    37,
      -1,    34,    -1,    43,    -1,    39,    -1,   103,   104,    -1,
     103,   193,   104,    -1,   194,    -1,   193,   100,   194,    -1,
     227,   195,    -1,    -1,   195,   196,    -1,    98,    -1,    99,
      -1,    96,    -1,    94,    -1,    95,   217,    -1,   199,    -1,
     207,    -1,   200,    -1,   208,    -1,    20,   201,     4,    -1,
      20,   185,     4,    -1,    21,   201,     4,    -1,   103,   202,
     104,    -1,    -1,   203,    -1,   204,    -1,   203,   100,   204,
      -1,   206,    -1,   205,    -1,    34,    54,   223,    -1,   223,
     215,    -1,    24,     4,   212,    25,     4,    -1,    22,     4,
     209,    23,     4,    -1,    -1,   210,    -1,   211,    -1,   210,
     211,    -1,    21,   206,     4,    -1,    -1,   213,    -1,   214,
      -1,   213,   214,    -1,    20,   206,     4,    -1,    -1,   215,
     216,    -1,    97,    -1,    95,   217,    -1,    -1,   103,    34,
     104,    -1,    19,   220,    -1,   218,     4,    -1,    18,   220,
       4,    -1,    46,   230,   105,    35,    -1,    47,   230,   105,
      36,    -1,    48,   230,   105,    34,    -1,    49,   230,   105,
      34,    -1,   223,    -1,   224,    -1,   228,    -1,    33,    -1,
     227,    -1,   224,    -1,    34,    -1,    35,    -1,    36,    -1,
      55,    -1,    56,    -1,    57,    -1,    58,    -1,    60,    -1,
      59,    -1,    46,    -1,    47,    -1,    48,    -1,    49,    -1,
     228,    -1,   230,    -1,    41,    -1,    42,    -1,    44,    -1,
      43,    -1,   229,    -1,    37,    -1,    38,    -1,    40,    -1,
      39,    -1,    33,    -1,    45,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   310,   310,   315,   316,   319,   320,   323,   324,   325,
     326,   327,   328,   329,   332,   335,   340,   343,   349,   352,
     353,   356,   357,   362,   363,   362,   369,   370,   373,   374,
     377,   378,   379,   380,   381,   382,   383,   384,   385,   386,
     387,   390,   391,   394,   395,   396,   397,   400,   401,   404,
     414,   415,   423,   424,   424,   429,   430,   431,   434,   435,
     436,   437,   438,   439,   440,   441,   442,   443,   444,   445,
     446,   449,   452,   457,   462,   465,   482,   483,   484,   487,
     488,   489,   490,   491,   495,   495,   499,   500,   503,   504,
     507,   510,   511,   512,   515,   516,   517,   518,   519,   520,
     521,   522,   523,   524,   525,   526,   527,   528,   529,   530,
     531,   532,   533,   534,   535,   536,   537,   541,   542,   543,
     544,   545,   546,   547,   548,   549,   550,   551,   552,   553,
     554,   557,   560,   561,   564,   567,   568,   572,   579,   583,
     584,   588,   589,   592,   593,   597,   600,   606,   609,   612,
     613,   616,   619,   620,   625,   629,   630,   633,   645,   646,
     649,   650,   653,   656,   657,   658,   662,   663,   668,   669,
     672,   673,   676,   677,   680,   682,   684,   689,   690,   693,
     699,   704,   705,   708,   709,   712,   713,   714,   717,   718,
     719,   722,   723,   726,   727,   730,   742,   743,   746,   747,
     748,   749,   750,   758,   759,   762,   763,   766,   769,   772,
     777,   780,   781,   784,   785,   788,   789,   792,   797,   805,
     812,   819,   820,   824,   825,   829,   832,   833,   836,   837,
     840,   844,   845,   848,   849,   854,   855,   858,   861,   862,
     865,   866,   867,   868,   871,   875,   876,   877,   880,   881,
     884,   885,   886,   889,   890,   891,   892,   893,   894,   897,
     898,   899,   900,   903,   904,   907,   908,   909,   910,   911,
     914,   915,   916,   917,   920,   921
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
  "'['", "']'", "'('", "')'", "'='", "'-'", "'!'", "'~'", "'+'", "'/'",
  "'*'", "'%'", "'|'", "'&'", "\"**\"", "';'", "'.'", "$accept", "program",
  "opt_nl", "compilation_units", "compilation_unit", "pir_pragma",
  "loadlib", "hll_specifier", "hll_mapping", "namespace_declaration",
  "opt_namespace_id", "namespace_id", "sub_definition", "@1", "@2",
  "sub_id", "sub_flags", "sub_flag", "multi_type_list", "multi_type",
  "parameters", "parameter", "param_def", "instructions", "@3",
  "instruction", "statement", "null_statement", "getresults_statement",
  "parrot_statement", "assignment_statement", "assignment_tail",
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
  "subcall", "sub", "method", "invokable", "string_object",
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
      44,    91,    93,    40,    41,    61,    45,    33,   126,    43,
      47,    42,    37,   124,    38,   355,    59,    46
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
     144,   145,   145,   146,   147,   148,   149,   149,   149,   150,
     150,   150,   150,   150,   152,   151,   153,   153,   154,   154,
     155,   156,   156,   156,   157,   157,   157,   157,   157,   157,
     157,   157,   157,   157,   157,   157,   157,   157,   157,   157,
     157,   157,   157,   157,   157,   157,   157,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   159,   160,   160,   161,   162,   162,   163,   163,   164,
     164,   165,   165,   166,   166,   167,   167,   168,   169,   170,
     170,   171,   172,   172,   173,   174,   174,   175,   176,   176,
     177,   177,   178,   179,   179,   179,   180,   180,   181,   181,
     182,   182,   183,   183,   184,   184,   184,   185,   185,   186,
     187,   188,   188,   189,   189,   190,   190,   190,   191,   191,
     191,   192,   192,   193,   193,   194,   195,   195,   196,   196,
     196,   196,   196,   197,   197,   198,   198,   199,   199,   200,
     201,   202,   202,   203,   203,   204,   204,   205,   206,   207,
     208,   209,   209,   210,   210,   211,   212,   212,   213,   213,
     214,   215,   215,   216,   216,   217,   217,   218,   219,   219,
     220,   220,   220,   220,   221,   222,   222,   222,   223,   223,
     224,   224,   224,   225,   225,   225,   225,   225,   225,   226,
     226,   226,   226,   227,   227,   228,   228,   228,   228,   228,
     229,   229,   229,   229,   230,   230
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
       2,     3,     4,     3,     2,     3,     2,     3,     2,     2,
       1,     3,     2,     1,     0,     3,     0,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     3,     1,     1,     1,     5,     5,     1,
       1,     2,     2,     1,     1,     1,     3,     3,     4,     1,
       3,     2,     0,     1,     5,     1,     1,     8,     0,     1,
       1,     2,     3,     3,     2,     5,     0,     2,     0,     1,
       1,     2,     3,     1,     4,     4,     2,     1,     1,     4,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     2,     3,     1,     3,     2,     0,     2,     1,     1,
       1,     1,     2,     1,     1,     1,     1,     3,     3,     3,
       3,     0,     1,     1,     3,     1,     1,     3,     2,     5,
       5,     0,     1,     1,     2,     3,     0,     1,     1,     2,
       3,     0,     2,     1,     2,     0,     3,     2,     2,     3,
       4,     4,     4,     4,     1,     1,     1,     1,     1,     1,
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
      19,     0,     3,     5,    13,    12,    10,    11,     9,     7,
       8,     0,     0,     0,    15,   274,    27,   275,    23,    26,
       0,    18,     0,     0,     0,     0,   237,     4,     2,     0,
       0,    14,    28,    21,     0,     0,     0,     0,     0,     6,
      16,    17,     0,   136,    20,   135,     0,     0,     0,     0,
       0,    24,    31,    32,    33,    30,    34,     0,   235,    35,
       0,    36,    37,    29,    22,   240,   241,   242,   243,    47,
       0,     0,    40,    41,    52,     0,     0,     0,     0,    48,
      53,    39,   236,     0,    38,   259,   260,   261,   262,   196,
       0,    25,     0,    44,     0,    42,    45,    46,    43,     0,
       0,    50,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   182,   270,   271,   273,   272,   265,   266,
     268,   267,   275,   139,   140,     0,     0,     0,    54,    57,
      69,    68,    67,    66,     0,    58,     0,     0,    59,    60,
      61,    65,   155,   156,     0,   178,   177,     0,   181,     0,
      63,    64,   203,   205,   204,   206,     0,    62,     0,   263,
     269,   264,   250,   251,   252,   270,   265,     0,   132,   134,
     249,   248,   264,    49,   201,   235,   200,   198,   199,   197,
       0,    70,    55,    56,     0,     0,     0,   187,   186,   211,
       0,     0,   185,     0,   221,   226,   158,     0,    86,   141,
     142,     0,     0,   191,     0,   193,   196,    74,     0,   145,
       0,   176,   180,     0,     0,   238,   130,   128,   129,   117,
     118,   119,   120,   121,   122,   124,   125,   123,   126,   127,
       0,     0,     0,     0,   131,     0,   202,    51,     0,     0,
     149,   152,   239,   250,     0,   212,   213,   216,   215,   231,
     208,   207,   209,     0,     0,   222,   223,     0,     0,   227,
     228,     0,     0,   159,   160,    73,    85,    87,    88,    90,
     244,    71,   147,     0,   192,   195,   143,   144,     0,   253,
     254,   255,   256,   258,   257,     0,     0,   188,   190,   189,
       0,   183,   184,     0,   274,   250,     0,    91,    92,    93,
      78,    83,     0,     0,    80,     0,   249,   248,   263,    75,
      76,     0,   133,     0,   148,     0,   153,   151,     0,   210,
       0,   218,     0,     0,   224,     0,     0,   229,     0,     0,
       0,     0,     0,   161,     0,   194,     0,   146,     0,   179,
     174,    72,    79,   175,   116,   111,   113,   112,   115,   114,
     104,   105,   106,   109,   107,   108,   110,   103,    95,   101,
      94,    96,    97,    98,    99,   100,   102,     0,    82,    77,
     154,   150,   217,   214,   235,   233,   232,   225,   220,   230,
     219,   162,     0,   166,   164,   168,    89,   137,   138,    81,
     234,     0,     0,   163,     0,   173,     0,   169,   170,     0,
     167,     0,     0,   171,   165,   172,   157
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      31,    44,    19,    42,    79,    28,    52,    73,    87,   105,
      84,    89,    99,    90,   102,   138,   139,   140,   141,   142,
     143,   241,   310,   144,   208,   276,   277,   278,   312,   377,
     242,   106,   177,   178,    56,   145,   146,   147,   288,   218,
     148,   149,   249,   250,   327,   150,   151,   152,   272,   273,
     274,   342,   403,   406,   407,   408,   153,   154,   155,   156,
     157,   300,   158,   302,   159,   214,   215,   109,   189,   160,
     161,   162,   163,   201,   254,   255,   256,   257,   258,   164,
     165,   264,   265,   266,   268,   269,   270,   331,   386,    82,
      20,   167,    36,   279,   314,   259,   180,   295,   100,   181,
     169,   170,   182
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -289
static const yytype_int16 yypact[] =
{
      36,  -289,    48,    80,  -289,    40,    41,    63,    43,    83,
      -7,   198,    92,  -289,  -289,  -289,  -289,  -289,  -289,  -289,
    -289,     0,     3,    91,  -289,  -289,  -289,  -289,  -289,  -289,
      84,  -289,   -12,   -12,   -12,   -12,  -289,    80,  -289,    95,
      98,  -289,  -289,  -289,   -53,    30,    31,    37,    39,  -289,
    -289,  -289,    72,  -289,  -289,  -289,   112,   131,   148,   136,
     151,  -289,  -289,  -289,  -289,  -289,  -289,    85,   102,  -289,
     103,  -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,
      83,   153,  -289,  -289,   182,    94,   105,   -62,   223,  -289,
     196,  -289,  -289,   -18,  -289,  -289,  -289,  -289,  -289,  -289,
     135,  -289,   215,  -289,   255,  -289,  -289,  -289,  -289,    15,
     157,  -289,   208,   301,   179,   223,   198,   -23,   114,   219,
     226,   228,   124,  -289,   -30,  -289,  -289,  -289,   -25,  -289,
    -289,  -289,   343,   188,   199,   416,   -12,   134,  -289,  -289,
    -289,  -289,  -289,  -289,   246,  -289,   255,   255,  -289,  -289,
    -289,  -289,  -289,  -289,   257,  -289,  -289,   114,   145,   159,
    -289,  -289,  -289,  -289,  -289,  -289,   259,  -289,   347,  -289,
    -289,    -5,  -289,  -289,  -289,  -289,  -289,   -35,  -289,  -289,
    -289,  -289,  -289,  -289,  -289,   102,  -289,  -289,  -289,  -289,
     -12,  -289,  -289,  -289,   173,   -12,   270,  -289,  -289,   397,
     272,   273,  -289,   274,   260,   262,   250,   279,   255,  -289,
    -289,   280,   281,  -289,   -32,  -289,  -289,  -289,   -36,    93,
     -36,  -289,  -289,   158,   100,  -289,  -289,  -289,  -289,  -289,
    -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,
      17,   282,   255,   201,  -289,   255,  -289,  -289,   416,     2,
    -289,   207,  -289,   253,   200,   209,  -289,  -289,  -289,  -289,
    -289,  -289,  -289,   255,   285,   260,  -289,   255,   286,   262,
    -289,   255,    50,   250,  -289,  -289,  -289,   210,  -289,  -289,
    -289,  -289,  -289,   416,  -289,   126,  -289,  -289,   -12,  -289,
    -289,  -289,  -289,  -289,  -289,   255,   -12,  -289,  -289,  -289,
     114,  -289,  -289,   308,   309,   214,   320,  -289,  -289,  -289,
    -289,  -289,   255,   322,  -289,   300,   324,   232,   332,  -289,
    -289,   255,  -289,   333,  -289,   -12,  -289,  -289,   255,  -289,
     397,   -56,   344,   345,  -289,   346,   365,  -289,   366,   163,
     163,   163,   367,  -289,   255,  -289,   368,  -289,   369,  -289,
    -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,
    -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,  -289,
    -289,  -289,  -289,  -289,  -289,  -289,  -289,   255,  -289,  -289,
    -289,  -289,  -289,  -289,   102,  -289,  -289,  -289,  -289,  -289,
    -289,  -289,   370,   275,  -289,     6,  -289,  -289,  -289,  -289,
    -289,   372,   163,  -289,   416,  -289,   363,     6,  -289,   158,
    -289,   387,   388,  -289,  -289,  -289,  -289
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -289,  -289,   382,  -289,   358,  -289,  -289,  -289,  -289,  -289,
    -289,  -289,  -289,  -289,  -289,   316,  -289,  -289,  -289,  -289,
    -289,  -289,  -289,  -289,  -289,  -289,   284,  -289,  -289,  -289,
    -289,  -289,  -289,   161,  -289,  -289,  -289,    54,  -289,  -289,
    -289,  -163,  -289,   154,   225,  -289,  -289,  -289,   183,  -289,
    -289,  -288,  -289,    82,  -289,  -289,  -289,  -289,  -289,  -289,
     132,  -289,  -289,  -289,  -289,    38,  -289,  -109,  -289,  -289,
    -289,    34,  -219,  -289,   325,  -289,  -274,   230,  -289,  -289,
    -289,  -289,  -289,  -111,  -289,  -289,   120,  -289,  -166,  -289,
    -289,  -289,  -289,   186,  -289,  -289,   175,  -289,  -289,  -182,
     -70,  -289,   348,  -289,  -289,  -102,   222,  -289,   -80,  -101,
     227,  -289,    -9
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -248
static const yytype_int16 yytable[] =
{
      29,   168,   179,   246,   301,   243,   324,   203,   200,   345,
      25,   123,   168,   107,   197,    25,   103,   286,   198,   183,
     115,    25,    27,    45,    46,    47,    48,    27,    95,    96,
      97,    98,   166,    27,   211,   195,   216,   404,    93,   384,
       1,   385,    94,   166,   219,   220,   222,    53,     4,    54,
     304,   305,   173,   174,   124,   125,   126,   127,   128,   129,
     130,   131,   132,    55,   287,    53,   339,   244,   283,   306,
      23,    29,   284,  -187,    21,    22,    61,    24,  -186,   340,
     199,    55,   341,   104,   108,     5,     6,  -187,     7,     8,
       9,   111,  -186,   171,    30,    10,    37,   332,  -185,    11,
      39,   335,   325,    40,   171,   338,   280,   405,   202,   184,
     185,   186,  -185,   187,   188,   303,    25,    26,    43,   405,
     392,   393,   394,   307,   308,   309,    41,   212,    27,    50,
     411,   313,    51,    25,   123,    57,    58,   197,   315,   317,
     320,   198,    59,   179,    60,    27,    74,   323,   289,   290,
     291,   292,   293,   294,   378,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    75,    25,    25,   110,
      77,   175,   125,   126,   127,   176,   129,   130,   131,    27,
      27,   247,   216,   410,    76,    78,   251,    86,    80,   349,
     301,    25,   297,   347,    88,   197,    25,   298,    91,   198,
     197,   299,   400,    27,   198,    81,    83,   101,    27,    92,
     352,   190,   191,   194,   202,   202,   112,   199,   113,   379,
     184,   185,   186,   204,   187,   188,   382,   137,   114,   115,
     205,   171,   206,   116,    11,   117,   118,   119,   213,   120,
     209,   121,   280,   122,    32,    33,    34,    35,    25,   123,
     217,   210,   124,   125,   126,   127,   128,   129,   130,   131,
     132,   221,   223,   225,   224,   133,   134,   135,   136,    95,
      96,    97,    98,   248,   252,   399,   260,   261,   262,   346,
     271,   263,   267,   275,   281,   282,   319,   348,    25,   172,
     173,   174,   175,   125,   126,   127,   176,   129,   130,   131,
      27,   326,   112,   216,   329,   192,   321,   328,   333,   330,
     344,   336,   350,  -247,   114,   115,   251,  -182,   137,   116,
      11,   117,   118,   119,   351,   120,   353,   121,  -245,   122,
     202,   202,   202,   104,    25,   123,  -246,   380,   124,   125,
     126,   127,   128,   129,   130,   131,   132,   -84,   387,   388,
     389,   133,   134,   135,   136,   354,   355,   356,   357,   358,
     359,   360,   361,   362,   363,   364,   365,   366,   367,   390,
     391,   395,   397,   398,   401,   402,   -84,   -84,   -84,   -84,
     -84,   -84,   -84,   -84,   -84,   -84,   -84,   -84,   -84,   409,
     412,   415,   416,   202,    38,    49,    85,   193,   396,   322,
     202,   311,   245,   296,   137,   343,   368,   381,   369,   370,
     371,   372,   373,   374,   375,   376,   226,   227,   228,   229,
     230,   231,   232,   233,   234,   235,   236,   237,   238,   239,
      25,   253,   173,   174,   175,   125,   126,   127,   176,   129,
     130,   131,    27,   414,   337,   413,   285,   207,   104,    25,
     383,   334,   240,   175,   125,   126,   127,   176,   129,   130,
     131,    27,   316,     0,   196,     0,     0,   318
};

static const yytype_int16 yycheck[] =
{
       9,   102,   104,   185,   223,   168,     4,   118,   117,   283,
      33,    34,   113,    93,    37,    33,    34,    53,    41,     4,
      14,    33,    45,    32,    33,    34,    35,    45,    46,    47,
      48,    49,   102,    45,   135,   115,   137,    31,   100,    95,
       4,    97,   104,   113,   146,   147,   157,   100,     0,   102,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,   116,   100,   100,    16,   102,   100,    52,
       7,    80,   104,   103,    34,    34,     4,    34,   103,    29,
     103,   116,    32,   101,    93,     5,     6,   117,     8,     9,
      10,   100,   117,   102,   101,    15,     4,   263,   103,    19,
     100,   267,   100,   100,   113,   271,   208,   395,   117,    94,
      95,    96,   117,    98,    99,   224,    33,    34,    34,   407,
     339,   340,   341,   106,   107,   108,    35,   136,    45,    34,
     404,   240,    34,    33,    34,   105,   105,    37,   240,   240,
     242,    41,   105,   245,   105,    45,    34,   248,    55,    56,
      57,    58,    59,    60,   317,    83,    84,    85,    86,    87,
      88,    89,    90,    91,    92,    93,    35,    33,    33,    34,
      34,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      45,   190,   283,   402,    36,    34,   195,    34,   103,   300,
     409,    33,    34,   295,    12,    37,    33,    39,   104,    41,
      37,    43,   384,    45,    41,   103,   103,    11,    45,   104,
     312,    54,     4,    34,   223,   224,     1,   103,     3,   321,
      94,    95,    96,     4,    98,    99,   328,   103,    13,    14,
       4,   240,     4,    18,    19,    20,    21,    22,   104,    24,
      52,    26,   344,    28,    46,    47,    48,    49,    33,    34,
       4,    52,    37,    38,    39,    40,    41,    42,    43,    44,
      45,     4,   117,     4,   105,    50,    51,    52,    53,    46,
      47,    48,    49,   100,     4,   377,     4,     4,     4,   288,
      30,    21,    20,     4,     4,     4,     4,   296,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    94,     1,   404,   104,     4,   105,    54,    23,   100,
     100,    25,     4,     4,    13,    14,   325,   103,   103,    18,
      19,    20,    21,    22,     4,    24,     4,    26,     4,    28,
     339,   340,   341,   101,    33,    34,     4,     4,    37,    38,
      39,    40,    41,    42,    43,    44,    45,     4,     4,     4,
       4,    50,    51,    52,    53,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,     4,
       4,     4,     4,     4,     4,   100,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    17,
      27,     4,     4,   402,    12,    37,    80,   113,   344,   245,
     409,   240,   177,   220,   103,   273,   106,   325,   108,   109,
     110,   111,   112,   113,   114,   115,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,   409,   269,   407,   216,   122,   101,    33,
     330,   265,   105,    37,    38,    39,    40,    41,    42,    43,
      44,    45,   240,    -1,   116,    -1,    -1,   240
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
      34,    34,   134,   100,   102,   116,   162,   105,   105,   105,
     105,     4,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,   135,    34,    35,    36,    34,    34,   132,
     103,   103,   217,   103,   138,   133,    34,   136,    12,   139,
     141,   104,   104,   100,   104,    46,    47,    48,    49,   140,
     226,    11,   142,    34,   101,   137,   159,   226,   230,   195,
      34,   230,     1,     3,    13,    14,    18,    20,    21,    22,
      24,    26,    28,    34,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    50,    51,    52,    53,   103,   143,   144,
     145,   146,   147,   148,   151,   163,   164,   165,   168,   169,
     173,   174,   175,   184,   185,   186,   187,   188,   190,   192,
     197,   198,   199,   200,   207,   208,   218,   219,   227,   228,
     229,   230,    34,    35,    36,    37,    41,   160,   161,   223,
     224,   227,   230,     4,    94,    95,    96,    98,    99,   196,
      54,     4,     4,   144,    34,   226,   220,    37,    41,   103,
     185,   201,   230,   201,     4,     4,     4,   192,   152,    52,
      52,   227,   230,   104,   193,   194,   227,     4,   167,   223,
     223,     4,   201,   117,   105,     4,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
     105,   149,   158,   159,   102,   162,   217,   230,   100,   170,
     171,   230,     4,    34,   202,   203,   204,   205,   206,   223,
       4,     4,     4,    21,   209,   210,   211,    20,   212,   213,
     214,    30,   176,   177,   178,     4,   153,   154,   155,   221,
     223,     4,     4,   100,   104,   195,    53,   100,   166,    55,
      56,    57,    58,    59,    60,   225,   166,    34,    39,    43,
     189,   190,   191,   185,    33,    34,    52,   106,   107,   108,
     150,   151,   156,   185,   222,   223,   224,   227,   228,     4,
     223,   105,   161,   227,     4,   100,    94,   172,    54,   104,
     100,   215,   206,    23,   211,   206,    25,   214,   206,    16,
      29,    32,   179,   178,   100,   194,   230,   223,   230,   201,
       4,     4,   223,     4,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,   106,   108,
     109,   110,   111,   112,   113,   114,   115,   157,   159,   223,
       4,   171,   223,   204,    95,    97,   216,     4,     4,     4,
       4,     4,   190,   190,   190,     4,   155,     4,     4,   223,
     217,     4,   100,   180,    31,   169,   181,   182,   183,    17,
     190,   194,    27,   183,   189,     4,     4
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
#line 332 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 335 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 340 "pir.y"
    { set_hll((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 17:
#line 343 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 352 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 353 "pir.y"
    { (yyval.fixme) = (yyvsp[(2) - (3)].fixme); ;}
    break;

  case 21:
#line 356 "pir.y"
    {;}
    break;

  case 22:
#line 357 "pir.y"
    {;}
    break;

  case 23:
#line 362 "pir.y"
    { new_sub(lexer, (yyvsp[(2) - (2)].sval));  /* create a new sub node */ ;}
    break;

  case 24:
#line 363 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(4) - (5)].ival)); ;}
    break;

  case 28:
#line 373 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 29:
#line 374 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(1) - (2)].ival)); ;}
    break;

  case 30:
#line 377 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON; ;}
    break;

  case 31:
#line 378 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 32:
#line 379 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 33:
#line 380 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 34:
#line 381 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 35:
#line 382 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 36:
#line 383 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 37:
#line 384 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 38:
#line 385 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 39:
#line 386 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 40:
#line 387 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 49:
#line 404 "pir.y"
    { set_param_flag((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                                                      IF_NAMED_PARAM_SET_ALIAS((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                                                      /*
                                                      if (TEST_FLAG($3, PARAM_FLAG_NAMED)) {
                                                        set_param_named($2, lexer->temp_flag_arg1);
                                                      }
                                                      */
                                                    ;}
    break;

  case 50:
#line 414 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 51:
#line 415 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval));
                                              set_param_named((yyval.targ), (yyvsp[(2) - (4)].sval));
                                            ;}
    break;

  case 53:
#line 424 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 55:
#line 429 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 56:
#line 430 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 58:
#line 434 "pir.y"
    { ;}
    break;

  case 59:
#line 435 "pir.y"
    { ;}
    break;

  case 60:
#line 436 "pir.y"
    { ;}
    break;

  case 61:
#line 437 "pir.y"
    { ;}
    break;

  case 62:
#line 438 "pir.y"
    { ;}
    break;

  case 63:
#line 439 "pir.y"
    { ;}
    break;

  case 64:
#line 440 "pir.y"
    { ;}
    break;

  case 65:
#line 441 "pir.y"
    { ;}
    break;

  case 66:
#line 442 "pir.y"
    { ;}
    break;

  case 67:
#line 443 "pir.y"
    { ;}
    break;

  case 68:
#line 444 "pir.y"
    { ;}
    break;

  case 69:
#line 445 "pir.y"
    { ;}
    break;

  case 70:
#line 446 "pir.y"
    { yyerrok; ;}
    break;

  case 71:
#line 449 "pir.y"
    { set_instr(lexer, "null");
                                                              /* set arguments */
                                                            ;}
    break;

  case 72:
#line 452 "pir.y"
    { set_instr(lexer, "null");
                                                              /* set arguments */
                                                            ;}
    break;

  case 73:
#line 457 "pir.y"
    { set_instr(lexer, "get_results");
                                                              /* set arguments */
                                                            ;}
    break;

  case 76:
#line 482 "pir.y"
    { new_rhs(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 77:
#line 483 "pir.y"
    { new_rhs(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].fixme), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 78:
#line 484 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 79:
#line 487 "pir.y"
    { new_rhs(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 80:
#line 488 "pir.y"
    { new_rhs(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 81:
#line 489 "pir.y"
    { new_rhs(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 82:
#line 490 "pir.y"
    { new_rhs(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].fixme)); ;}
    break;

  case 84:
#line 495 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 85:
#line 496 "pir.y"
    { (yyval.fixme) = 0; ;}
    break;

  case 91:
#line 510 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 92:
#line 511 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 93:
#line 512 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 94:
#line 515 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 95:
#line 516 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 96:
#line 517 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 97:
#line 518 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 98:
#line 519 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 99:
#line 520 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 100:
#line 521 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 101:
#line 522 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 102:
#line 523 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 103:
#line 524 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 104:
#line 525 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 105:
#line 526 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 106:
#line 527 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 107:
#line 528 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 108:
#line 529 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 109:
#line 530 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 110:
#line 531 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 111:
#line 532 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 112:
#line 533 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 113:
#line 534 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 114:
#line 535 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 115:
#line 536 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 116:
#line 537 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 117:
#line 541 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 118:
#line 542 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 119:
#line 543 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 120:
#line 544 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 121:
#line 545 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 122:
#line 546 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 123:
#line 547 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 124:
#line 548 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 125:
#line 549 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 126:
#line 550 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 127:
#line 551 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 128:
#line 552 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 129:
#line 553 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 130:
#line 554 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 131:
#line 557 "pir.y"
    { (yyval.fixme) = (yyvsp[(2) - (3)].fixme); ;}
    break;

  case 132:
#line 560 "pir.y"
    {;}
    break;

  case 133:
#line 561 "pir.y"
    {;}
    break;

  case 135:
#line 567 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 136:
#line 568 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 137:
#line 573 "pir.y"
    { /* add $4 as argument, and set a flag if $1 is "unless" */
                         if ((yyvsp[(1) - (5)].ival) > 0) { /* it was "unless", so we need to "invert" the opcode */
                            invert_instr(lexer);
                         }

                       ;}
    break;

  case 138:
#line 580 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval)); ;}
    break;

  case 139:
#line 583 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 140:
#line 584 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 141:
#line 588 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 142:
#line 589 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 145:
#line 597 "pir.y"
    { set_instr(lexer, "if");
                                                             /* set $1 as argument */
                                                           ;}
    break;

  case 146:
#line 600 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                                                             /* set $1 and $3 as arguments */
                                                           ;}
    break;

  case 147:
#line 606 "pir.y"
    { set_instr(lexer, "branch"); ;}
    break;

  case 151:
#line 616 "pir.y"
    { declare_local(lexer, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 152:
#line 619 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 153:
#line 620 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 154:
#line 625 "pir.y"
    { set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval)); ;}
    break;

  case 157:
#line 638 "pir.y"
    { /* $4 contains a invocation object */
                                                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                                                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                                                              (yyval.fixme) = NULL;
                                                            ;}
    break;

  case 158:
#line 645 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 159:
#line 646 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 160:
#line 649 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 161:
#line 650 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 162:
#line 653 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 163:
#line 656 "pir.y"
    { (yyval.invo) = invoke(CALL_PCC, (yyvsp[(2) - (3)].varb), (yyvsp[(3) - (3)].varb)); ;}
    break;

  case 164:
#line 657 "pir.y"
    { (yyval.invo) = invoke(CALL_NCI, (yyvsp[(2) - (2)].varb), NULL); ;}
    break;

  case 165:
#line 659 "pir.y"
    { (yyval.invo) = invoke(CALL_METH, (yyvsp[(2) - (5)].varb), (yyvsp[(5) - (5)].varb)); ;}
    break;

  case 166:
#line 662 "pir.y"
    { (yyval.varb) = NULL; ;}
    break;

  case 167:
#line 663 "pir.y"
    { (yyval.varb) = (yyvsp[(2) - (2)].varb); ;}
    break;

  case 168:
#line 668 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 169:
#line 669 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 170:
#line 672 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 171:
#line 673 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 172:
#line 676 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 173:
#line 677 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 174:
#line 681 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 175:
#line 683 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 176:
#line 685 "pir.y"
    { set_invocation_results((yyvsp[(1) - (2)].invo), NULL); ;}
    break;

  case 179:
#line 693 "pir.y"
    { (yyval.invo) = invoke(CALL_METH, (yyvsp[(1) - (4)].varb), (yyvsp[(3) - (4)].varb));
                                                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                                                            ;}
    break;

  case 180:
#line 699 "pir.y"
    { (yyval.invo) = invoke(CALL_PCC, (yyvsp[(1) - (2)].varb), NULL);
                                                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                                                            ;}
    break;

  case 181:
#line 704 "pir.y"
    { (yyval.varb) = (yyvsp[(1) - (1)].varb); ;}
    break;

  case 182:
#line 705 "pir.y"
    { (yyval.varb) = var_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 185:
#line 712 "pir.y"
    { (yyval.varb) = var_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 186:
#line 713 "pir.y"
    { (yyval.varb) = var_from_reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 187:
#line 714 "pir.y"
    { (yyval.varb) = var_from_reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 188:
#line 717 "pir.y"
    { (yyval.varb) = var_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 189:
#line 718 "pir.y"
    { (yyval.varb) = var_from_reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 190:
#line 719 "pir.y"
    { (yyval.varb) = var_from_reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 191:
#line 722 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 192:
#line 723 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 193:
#line 726 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 194:
#line 727 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 195:
#line 730 "pir.y"
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

  case 196:
#line 742 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 197:
#line 743 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 198:
#line 746 "pir.y"
    { (yyval.ival) = PARAM_FLAG_OPTIONAL; ;}
    break;

  case 199:
#line 747 "pir.y"
    { (yyval.ival) = PARAM_FLAG_OPT_FLAG; ;}
    break;

  case 200:
#line 748 "pir.y"
    { (yyval.ival) = PARAM_FLAG_SLURPY; ;}
    break;

  case 201:
#line 749 "pir.y"
    { (yyval.ival) = PARAM_FLAG_UNIQUE_REG; ;}
    break;

  case 202:
#line 750 "pir.y"
    { STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                                    (yyval.ival) = PARAM_FLAG_NAMED;
                                                  ;}
    break;

  case 207:
#line 766 "pir.y"
    { (yyval.fixme) = invoke(CALL_RET, NULL, NULL);
                                                             set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                                                           ;}
    break;

  case 208:
#line 769 "pir.y"
    { set_invocation_flag((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 209:
#line 772 "pir.y"
    { (yyval.invo) = invoke(CALL_YIELD, NULL, NULL);
                                                             set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                                                           ;}
    break;

  case 210:
#line 777 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 211:
#line 780 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 212:
#line 781 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 213:
#line 784 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 214:
#line 785 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 217:
#line 792 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                                             set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                                                           ;}
    break;

  case 218:
#line 797 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                                                             set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                                                             IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                                                           ;}
    break;

  case 219:
#line 807 "pir.y"
    { (yyval.invo) = invoke(CALL_RET, NULL, NULL);
                                                             set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                                                           ;}
    break;

  case 220:
#line 814 "pir.y"
    { (yyval.invo) = invoke(CALL_YIELD, NULL, NULL);
                                                             set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                                                           ;}
    break;

  case 221:
#line 819 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 222:
#line 820 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 223:
#line 824 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 224:
#line 825 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 225:
#line 829 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 226:
#line 832 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 227:
#line 833 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 228:
#line 836 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 229:
#line 837 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 230:
#line 840 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 231:
#line 844 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 232:
#line 845 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 233:
#line 848 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 234:
#line 849 "pir.y"
    { STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                                             (yyval.ival) = ARG_FLAG_NAMED;
                                                           ;}
    break;

  case 235:
#line 854 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 236:
#line 855 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 237:
#line 858 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST);  ;}
    break;

  case 239:
#line 862 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), GLOBALCONST);  ;}
    break;

  case 240:
#line 865 "pir.y"
    { (yyval.constval) = new_iconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 241:
#line 866 "pir.y"
    { (yyval.constval) = new_nconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 242:
#line 867 "pir.y"
    { (yyval.constval) = new_pconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 243:
#line 868 "pir.y"
    { (yyval.constval) = new_sconst((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 245:
#line 875 "pir.y"
    { (yyval.expr) = expr_from_constant((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 246:
#line 876 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 247:
#line 877 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 248:
#line 880 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 249:
#line 881 "pir.y"
    { (yyval.expr) = expr_from_constant((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 250:
#line 884 "pir.y"
    { (yyval.constval) = new_sconst(NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 251:
#line 885 "pir.y"
    { (yyval.constval) = new_iconst(NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 252:
#line 886 "pir.y"
    { (yyval.constval) = new_nconst(NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 253:
#line 889 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 254:
#line 890 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 255:
#line 891 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 256:
#line 892 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 257:
#line 893 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 258:
#line 894 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 259:
#line 897 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 260:
#line 898 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 261:
#line 899 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 262:
#line 900 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 263:
#line 903 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 264:
#line 904 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 265:
#line 907 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 266:
#line 908 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 267:
#line 909 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 268:
#line 910 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 270:
#line 914 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 271:
#line 915 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 272:
#line 916 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 273:
#line 917 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3218 "pirparser.c"
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


#line 925 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


