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
     TK_FLAG_OPT_FLAG = 354,
     TK_FLAG_INVOCANT = 355
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
#define TK_FLAG_INVOCANT 355




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
#line 393 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 406 "pirparser.c"

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
#define YYLAST   542

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  119
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  116
/* YYNRULES -- Number of rules.  */
#define YYNRULES  279
/* YYNRULES -- Number of states.  */
#define YYNSTATES  419

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   356

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   110,     2,     2,     2,   115,   117,     2,
     105,   106,   114,   112,   101,   109,   108,   113,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   104,
       2,   107,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   102,     2,   103,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   116,     2,   111,     2,     2,     2,
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
      95,    96,    97,    98,    99,   100,   118
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    30,    34,    37,    42,    47,    50,
      51,    55,    57,    61,    62,    63,    73,    75,    77,    78,
      81,    83,    85,    87,    89,    91,    93,    95,    97,    99,
     104,   107,   109,   111,   113,   115,   116,   119,   124,   127,
     132,   133,   134,   138,   141,   144,   146,   148,   150,   152,
     154,   156,   158,   160,   162,   164,   166,   168,   170,   172,
     175,   179,   184,   188,   191,   195,   198,   202,   205,   208,
     210,   214,   217,   219,   220,   224,   225,   227,   230,   232,
     233,   237,   239,   241,   245,   247,   251,   257,   263,   265,
     267,   270,   273,   275,   277,   279,   283,   287,   292,   294,
     298,   301,   302,   304,   310,   312,   314,   323,   324,   326,
     328,   331,   335,   339,   342,   348,   349,   352,   353,   355,
     357,   360,   364,   366,   371,   376,   379,   381,   383,   388,
     391,   393,   395,   397,   399,   401,   403,   405,   407,   409,
     411,   415,   416,   418,   420,   424,   427,   428,   431,   433,
     435,   437,   439,   442,   443,   446,   448,   450,   455,   457,
     459,   461,   463,   467,   471,   475,   479,   480,   482,   484,
     488,   490,   492,   496,   499,   505,   511,   512,   514,   516,
     519,   523,   524,   526,   528,   531,   535,   536,   539,   541,
     544,   545,   549,   552,   555,   559,   564,   569,   574,   579,
     581,   583,   585,   587,   589,   591,   593,   595,   597,   599,
     601,   603,   605,   607,   609,   611,   613,   615,   617,   619,
     621,   623,   625,   627,   629,   631,   633,   635,   637,   639,
     641,   643,   645,   647,   649,   651,   653,   655,   657,   659,
     661,   663,   665,   667,   669,   671,   673,   675,   677,   679,
     681,   683,   685,   687,   689,   691,   693,   695,   697,   699,
     701,   703,   705,   707,   709,   711,   713,   715,   717,   719
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     120,     0,    -1,   121,   122,   121,    -1,    -1,     4,    -1,
     123,    -1,   122,     4,   123,    -1,   131,    -1,   220,    -1,
     128,    -1,   126,    -1,   127,    -1,   125,    -1,   124,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,   101,
      34,    -1,     6,    34,   101,    34,    -1,    15,   129,    -1,
      -1,   102,   130,   103,    -1,    34,    -1,   130,   104,    34,
      -1,    -1,    -1,    10,   134,   132,   135,     4,   133,   138,
     141,    11,    -1,   231,    -1,    34,    -1,    -1,   135,   136,
      -1,    86,    -1,    83,    -1,    84,    -1,    85,    -1,    87,
      -1,    90,    -1,    92,    -1,    93,    -1,    91,    -1,    88,
     105,   134,   106,    -1,    89,   219,    -1,   231,    -1,    34,
      -1,   159,    -1,   227,    -1,    -1,   138,   139,    -1,    12,
     140,   196,     4,    -1,   227,   231,    -1,   227,    34,    54,
     231,    -1,    -1,    -1,   141,   142,   143,    -1,     3,     4,
      -1,     3,   144,    -1,   144,    -1,   161,    -1,   166,    -1,
     167,    -1,   171,    -1,   221,    -1,   199,    -1,   200,    -1,
     172,    -1,   149,    -1,   148,    -1,   147,    -1,   146,    -1,
     145,    -1,     1,     4,    -1,    52,   228,     4,    -1,   228,
     107,    52,     4,    -1,    28,   190,     4,    -1,   152,     4,
      -1,   228,   150,     4,    -1,   234,   224,    -1,   159,   107,
     224,    -1,   107,   151,    -1,   232,   224,    -1,   223,    -1,
     224,   233,   224,    -1,   228,   159,    -1,   152,    -1,    -1,
      45,   153,   154,    -1,    -1,   155,    -1,   156,   157,    -1,
     224,    -1,    -1,   157,   101,   158,    -1,   224,    -1,   159,
      -1,   102,   160,   103,    -1,   224,    -1,   160,   104,   224,
      -1,   162,   165,   164,   231,     4,    -1,   163,   224,   164,
     231,     4,    -1,    50,    -1,    51,    -1,    50,    52,    -1,
      51,    52,    -1,    53,    -1,   101,    -1,   224,    -1,   224,
     226,   224,    -1,    53,   231,     4,    -1,    14,   227,   168,
       4,    -1,   169,    -1,   168,   101,   169,    -1,   231,   170,
      -1,    -1,    94,    -1,    13,    34,   101,   228,     4,    -1,
     173,    -1,   182,    -1,    26,     4,   174,   177,     4,   179,
      27,     4,    -1,    -1,   175,    -1,   176,    -1,   175,   176,
      -1,    30,   208,     4,    -1,    29,   188,   178,    -1,    32,
     188,    -1,    16,   188,     4,    17,   187,    -1,    -1,   101,
     188,    -1,    -1,   180,    -1,   181,    -1,   180,   181,    -1,
      31,   193,     4,    -1,   167,    -1,   190,   107,   183,     4,
      -1,   228,   107,   183,     4,    -1,   183,     4,    -1,   185,
      -1,   184,    -1,   188,   108,   187,   203,    -1,   186,   203,
      -1,   188,    -1,    34,    -1,   188,    -1,   189,    -1,   231,
      -1,    41,    -1,    37,    -1,    34,    -1,    43,    -1,    39,
      -1,   105,   191,   106,    -1,    -1,   192,    -1,   193,    -1,
     192,   101,   193,    -1,   228,   194,    -1,    -1,   194,   195,
      -1,    98,    -1,    99,    -1,    96,    -1,    94,    -1,    95,
     219,    -1,    -1,   196,   197,    -1,   195,    -1,   198,    -1,
     100,   105,   137,   106,    -1,   201,    -1,   209,    -1,   202,
      -1,   210,    -1,    20,   203,     4,    -1,    20,   183,     4,
      -1,    21,   203,     4,    -1,   105,   204,   106,    -1,    -1,
     205,    -1,   206,    -1,   205,   101,   206,    -1,   208,    -1,
     207,    -1,    34,    54,   224,    -1,   224,   217,    -1,    24,
       4,   214,    25,     4,    -1,    22,     4,   211,    23,     4,
      -1,    -1,   212,    -1,   213,    -1,   212,   213,    -1,    21,
     208,     4,    -1,    -1,   215,    -1,   216,    -1,   215,   216,
      -1,    20,   208,     4,    -1,    -1,   217,   218,    -1,    97,
      -1,    95,   219,    -1,    -1,   105,    34,   106,    -1,    19,
     222,    -1,   220,     4,    -1,    18,   222,     4,    -1,    46,
     231,   107,    35,    -1,    47,   231,   107,    36,    -1,    48,
     231,   107,    34,    -1,    49,   231,   107,    34,    -1,   225,
      -1,   229,    -1,    33,    -1,   228,    -1,   225,    -1,    34,
      -1,    35,    -1,    36,    -1,    55,    -1,    56,    -1,    57,
      -1,    58,    -1,    60,    -1,    59,    -1,    46,    -1,    47,
      -1,    48,    -1,    49,    -1,   229,    -1,   231,    -1,    41,
      -1,    42,    -1,    44,    -1,    43,    -1,   230,    -1,    37,
      -1,    38,    -1,    40,    -1,    39,    -1,    33,    -1,    45,
      -1,   109,    -1,   110,    -1,   111,    -1,   112,    -1,   109,
      -1,   113,    -1,   114,    -1,   115,    -1,   116,    -1,   117,
      -1,   111,    -1,   118,    -1,    68,    -1,    61,    -1,    62,
      -1,    63,    -1,    65,    -1,    66,    -1,    64,    -1,    67,
      -1,    56,    -1,    58,    -1,    57,    -1,    60,    -1,    59,
      -1,    55,    -1,    72,    -1,    73,    -1,    74,    -1,    75,
      -1,    76,    -1,    77,    -1,    80,    -1,    78,    -1,    79,
      -1,    81,    -1,    82,    -1,    70,    -1,    71,    -1,    69,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   335,   335,   340,   341,   344,   345,   348,   349,   350,
     351,   352,   353,   354,   357,   361,   367,   371,   378,   382,
     383,   387,   389,   396,   397,   396,   403,   404,   408,   409,
     413,   415,   417,   419,   421,   423,   425,   427,   429,   431,
     433,   438,   439,   440,   441,   444,   445,   448,   454,   456,
     463,   464,   464,   469,   471,   473,   476,   477,   478,   479,
     480,   481,   482,   483,   484,   485,   486,   487,   488,   491,
     500,   504,   510,   516,   519,   544,   546,   548,   552,   554,
     556,   558,   560,   565,   565,   569,   570,   573,   577,   583,
     584,   588,   589,   592,   596,   598,   602,   609,   616,   617,
     621,   623,   627,   628,   632,   636,   644,   650,   654,   656,
     660,   664,   665,   670,   677,   678,   681,   694,   695,   699,
     701,   705,   709,   711,   713,   719,   720,   727,   728,   732,
     734,   738,   740,   744,   746,   748,   753,   754,   757,   764,
     770,   772,   776,   777,   780,   782,   784,   788,   790,   792,
     797,   802,   803,   807,   809,   813,   822,   823,   827,   829,
     831,   833,   835,   842,   843,   847,   848,   851,   858,   859,
     862,   863,   866,   870,   874,   880,   885,   886,   890,   892,
     896,   897,   900,   906,   914,   922,   931,   932,   937,   939,
     944,   949,   950,   954,   956,   960,   966,   967,   971,   973,
     980,   981,   985,   989,   990,   994,   996,   998,  1000,  1010,
    1011,  1012,  1015,  1016,  1019,  1020,  1021,  1024,  1025,  1026,
    1027,  1028,  1029,  1032,  1033,  1034,  1035,  1038,  1039,  1042,
    1043,  1044,  1045,  1046,  1049,  1050,  1051,  1052,  1055,  1056,
    1059,  1060,  1061,  1064,  1065,  1066,  1067,  1068,  1069,  1070,
    1071,  1072,  1073,  1074,  1075,  1076,  1077,  1078,  1079,  1080,
    1081,  1082,  1083,  1084,  1085,  1086,  1090,  1091,  1092,  1093,
    1094,  1095,  1096,  1097,  1098,  1099,  1100,  1101,  1102,  1103
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
  "\":slurpy\"", "\":flat\"", "\":optional\"", "\":opt_flag\"",
  "\":invocant\"", "','", "'['", "']'", "';'", "'('", "')'", "'='", "'.'",
  "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"",
  "$accept", "TOP", "opt_nl", "pir_chunks", "pir_chunk", "pir_pragma",
  "loadlib", "hll_specifier", "hll_mapping", "namespace_decl",
  "opt_namespace_id", "namespace_id", "sub_def", "@1", "@2", "sub_id",
  "sub_flags", "sub_flag", "multi_type", "parameters", "parameter",
  "param_def", "instructions", "@3", "instruction", "statement",
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
  "arg_flags", "arg_flag", "opt_paren_string", "const_decl",
  "const_decl_stat", "const_tail", "expression1", "expression", "constant",
  "rel_op", "type", "target", "reg", "pasm_reg", "identifier", "unop",
  "binop", "augmented_op", 0
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
     355,    44,    91,    93,    59,    40,    41,    61,    46,    45,
      33,   126,    43,    47,    42,    37,   124,    38,   356
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   119,   120,   121,   121,   122,   122,   123,   123,   123,
     123,   123,   123,   123,   124,   125,   126,   127,   128,   129,
     129,   130,   130,   132,   133,   131,   134,   134,   135,   135,
     136,   136,   136,   136,   136,   136,   136,   136,   136,   136,
     136,   137,   137,   137,   137,   138,   138,   139,   140,   140,
     141,   142,   141,   143,   143,   143,   144,   144,   144,   144,
     144,   144,   144,   144,   144,   144,   144,   144,   144,   145,
     146,   146,   147,   148,   149,   150,   150,   150,   151,   151,
     151,   151,   151,   153,   152,   154,   154,   155,   156,   157,
     157,   158,   158,   159,   160,   160,   161,   161,   162,   162,
     163,   163,   164,   164,   165,   165,   166,   167,   168,   168,
     169,   170,   170,   171,   172,   172,   173,   174,   174,   175,
     175,   176,   177,   177,   177,   178,   178,   179,   179,   180,
     180,   181,   181,   182,   182,   182,   183,   183,   184,   185,
     186,   186,   187,   187,   188,   188,   188,   189,   189,   189,
     190,   191,   191,   192,   192,   193,   194,   194,   195,   195,
     195,   195,   195,   196,   196,   197,   197,   198,   199,   199,
     200,   200,   201,   201,   202,   203,   204,   204,   205,   205,
     206,   206,   207,   208,   209,   210,   211,   211,   212,   212,
     213,   214,   214,   215,   215,   216,   217,   217,   218,   218,
     219,   219,   220,   221,   221,   222,   222,   222,   222,   223,
     223,   223,   224,   224,   225,   225,   225,   226,   226,   226,
     226,   226,   226,   227,   227,   227,   227,   228,   228,   229,
     229,   229,   229,   229,   230,   230,   230,   230,   231,   231,
     232,   232,   232,   233,   233,   233,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   233,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   233,   234,   234,   234,   234,
     234,   234,   234,   234,   234,   234,   234,   234,   234,   234
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     3,     2,     4,     4,     2,     0,
       3,     1,     3,     0,     0,     9,     1,     1,     0,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       2,     1,     1,     1,     1,     0,     2,     4,     2,     4,
       0,     0,     3,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       3,     4,     3,     2,     3,     2,     3,     2,     2,     1,
       3,     2,     1,     0,     3,     0,     1,     2,     1,     0,
       3,     1,     1,     3,     1,     3,     5,     5,     1,     1,
       2,     2,     1,     1,     1,     3,     3,     4,     1,     3,
       2,     0,     1,     5,     1,     1,     8,     0,     1,     1,
       2,     3,     3,     2,     5,     0,     2,     0,     1,     1,
       2,     3,     1,     4,     4,     2,     1,     1,     4,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     0,     1,     1,     3,     2,     0,     2,     1,     1,
       1,     1,     2,     0,     2,     1,     1,     4,     1,     1,
       1,     1,     3,     3,     3,     3,     0,     1,     1,     3,
       1,     1,     3,     2,     5,     5,     0,     1,     1,     2,
       3,     0,     1,     1,     2,     3,     0,     2,     1,     2,
       0,     3,     2,     2,     3,     4,     4,     4,     4,     1,
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
       0,    18,     0,     0,     0,     0,   202,     4,     2,     0,
       0,    14,    28,    21,     0,     0,     0,     0,     0,     6,
      16,    17,     0,    20,     0,     0,     0,     0,     0,    24,
      31,    32,    33,    30,    34,     0,   200,    35,    38,    36,
      37,    29,    22,   205,   206,   207,   208,    45,     0,     0,
      40,    50,     0,     0,     0,    46,    51,    39,   201,   223,
     224,   225,   226,   163,     0,    25,     0,     0,     0,    48,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   141,   234,   235,   237,   236,   229,   230,   232,   231,
     239,    98,    99,     0,     0,   151,    52,    55,    68,    67,
      66,    65,    64,     0,    56,     0,     0,    57,    58,    59,
      63,   114,   115,     0,   137,   136,     0,   140,     0,    61,
      62,   168,   170,   169,   171,     0,    60,     0,   227,   233,
     228,    47,   161,   200,   160,   158,   159,     0,   165,   164,
     166,     0,    69,    53,    54,     0,     0,     0,   146,   145,
     176,     0,     0,   144,     0,   186,   191,   117,     0,    85,
     100,   101,   234,   229,     0,   228,     0,     0,   152,   153,
     156,    73,   214,   215,   216,     0,   104,   213,   212,     0,
     135,   139,     0,     0,   203,   279,   277,   278,   266,   267,
     268,   269,   270,   271,   273,   274,   272,   275,   276,     0,
       0,     0,     0,     0,   162,     0,    49,     0,     0,   108,
     111,   204,   214,     0,   177,   178,   181,   180,   196,   173,
     172,   174,     0,     0,   187,   188,     0,     0,   192,   193,
       0,     0,   118,   119,    72,    84,    86,    89,    88,    70,
     106,   150,     0,   155,   102,   103,     0,   217,   218,   219,
     220,   222,   221,     0,     0,   147,   149,   148,     0,   142,
     143,     0,     0,    94,   238,   214,     0,   240,   241,   242,
      77,    82,     0,    79,     0,   213,   212,   227,     0,    74,
       0,    75,    42,     0,    43,    44,    41,     0,   107,     0,
     112,   110,     0,   175,     0,   183,     0,     0,   189,     0,
       0,   194,     0,     0,     0,     0,     0,   120,    87,   154,
     157,     0,   105,     0,   138,   133,    93,     0,    71,   134,
     265,   260,   262,   261,   264,   263,   253,   254,   255,   258,
     256,   257,   259,   252,   244,   250,   243,   245,   246,   247,
     248,   249,   251,     0,    81,    78,    76,   167,   113,   109,
     182,   179,   200,   198,   197,   190,   185,   195,   184,   121,
       0,   125,   123,   127,     0,    96,    97,    95,    80,   199,
       0,     0,   122,     0,   132,     0,   128,   129,    90,    92,
      91,     0,   126,     0,     0,   130,   124,   131,   116
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      31,    44,    19,    42,    77,    28,    52,    71,   313,    81,
      85,    93,    86,    96,   126,   127,   128,   129,   130,   131,
     132,   231,   300,   133,   189,   265,   266,   267,   338,   408,
     232,   292,   134,   135,   136,   276,   205,   137,   138,   238,
     239,   321,   139,   140,   141,   261,   262,   263,   336,   402,
     405,   406,   407,   142,   143,   144,   145,   146,   288,   147,
     290,   148,   197,   198,   199,   273,   168,    97,   169,   170,
     149,   150,   151,   152,   182,   243,   244,   245,   246,   247,
     153,   154,   253,   254,   255,   257,   258,   259,   325,   384,
      80,    20,   156,    36,   303,   248,   207,   283,    94,   208,
     158,   159,   195,   308,   373,   233
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -367
static const yytype_int16 yypact[] =
{
      11,  -367,    20,    36,  -367,    -5,    50,    45,    57,    34,
     -43,    65,    91,  -367,  -367,  -367,  -367,  -367,  -367,  -367,
    -367,    17,    30,    81,  -367,  -367,  -367,  -367,  -367,  -367,
      85,  -367,    48,    48,    48,    48,  -367,    36,  -367,   106,
     110,  -367,  -367,  -367,    18,    26,    39,    40,    43,  -367,
    -367,  -367,   144,  -367,   118,   125,   136,   127,   141,  -367,
    -367,  -367,  -367,  -367,  -367,    74,    76,  -367,  -367,  -367,
    -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,    34,   146,
    -367,   170,    77,    78,   117,  -367,   174,  -367,  -367,  -367,
    -367,  -367,  -367,  -367,    55,  -367,   250,    10,   132,  -367,
     183,   319,   154,   117,    65,    -2,    87,   189,   190,   191,
      92,  -367,   -86,  -367,  -367,  -367,   -52,  -367,  -367,  -367,
     421,   147,   148,    33,    48,    33,  -367,  -367,  -367,  -367,
    -367,  -367,  -367,   192,  -367,   472,   472,  -367,  -367,  -367,
    -367,  -367,  -367,   194,  -367,  -367,    87,    94,    98,  -367,
    -367,  -367,  -367,  -367,  -367,   202,  -367,   422,  -367,  -367,
      -6,  -367,  -367,    76,  -367,  -367,  -367,   102,  -367,  -367,
    -367,    48,  -367,  -367,  -367,   107,    48,   205,  -367,  -367,
     497,   206,   207,  -367,   208,   193,   196,   187,   209,   472,
    -367,  -367,  -367,  -367,   214,  -367,   215,   114,   121,  -367,
    -367,  -367,  -367,  -367,  -367,   -36,    99,  -367,  -367,   -36,
    -367,  -367,    93,    49,  -367,  -367,  -367,  -367,  -367,  -367,
    -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,   472,
     341,   219,   131,   472,  -367,    15,  -367,    33,     6,  -367,
     145,  -367,   171,   134,   142,  -367,  -367,  -367,  -367,  -367,
    -367,  -367,   472,   221,   193,  -367,   472,   217,   196,  -367,
     472,     5,   187,  -367,  -367,  -367,  -367,  -367,  -367,  -367,
    -367,  -367,    33,    75,  -367,  -367,    48,  -367,  -367,  -367,
    -367,  -367,  -367,   472,    48,  -367,  -367,  -367,    87,  -367,
    -367,   241,    25,  -367,   242,   143,   243,  -367,  -367,  -367,
    -367,  -367,   245,  -367,   371,   246,   150,   251,   472,  -367,
     472,  -367,  -367,   151,  -367,  -367,  -367,   252,  -367,    48,
    -367,  -367,   472,  -367,   497,   -59,   254,   255,  -367,   256,
     257,  -367,   261,   108,   108,   108,   262,  -367,   153,  -367,
    -367,   269,  -367,   273,  -367,  -367,  -367,   472,  -367,  -367,
    -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,
    -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,  -367,
    -367,  -367,  -367,   472,  -367,  -367,  -367,  -367,  -367,  -367,
    -367,  -367,    76,  -367,  -367,  -367,  -367,  -367,  -367,  -367,
     275,   179,  -367,     2,   370,  -367,  -367,  -367,  -367,  -367,
     264,   108,  -367,    33,  -367,   258,     2,  -367,  -367,  -367,
    -367,    93,  -367,   278,   282,  -367,  -367,  -367,  -367
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -367,  -367,   284,  -367,   260,  -367,  -367,  -367,  -367,  -367,
    -367,  -367,  -367,  -367,  -367,   220,  -367,  -367,  -367,  -367,
    -367,  -367,  -367,  -367,  -367,   198,  -367,  -367,  -367,  -367,
    -367,  -367,  -367,    79,  -367,  -367,  -367,  -367,  -367,  -367,
    -226,  -367,  -367,  -367,  -367,    95,  -367,  -367,  -366,  -367,
     -14,  -367,  -367,  -367,  -367,  -367,  -367,    44,  -367,  -367,
    -367,  -367,   -94,  -367,   -93,  -367,  -367,  -367,  -104,  -210,
    -367,   201,  -367,  -367,  -264,  -367,    41,  -367,  -367,  -367,
    -367,  -367,  -367,  -367,   -99,  -367,  -367,   -11,  -367,  -202,
    -367,  -367,  -367,  -367,    61,  -367,  -367,    58,  -367,  -367,
    -158,   -83,  -367,   213,  -367,  -132,    88,  -367,   -92,   -95,
      89,  -367,    -9,  -367,  -367,  -367
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -212
static const yytype_int16 yytable[] =
{
      29,   157,   289,   206,   209,   234,   157,   184,   339,   314,
     318,   176,   181,   155,   161,     1,   103,   274,   155,  -146,
       4,   333,  -146,    45,    46,    47,    48,   404,   194,    21,
     200,    25,   111,   403,   334,   178,   382,   335,   383,   179,
     404,     5,     6,    27,     7,     8,     9,   211,    25,   312,
     326,    10,    23,  -145,   329,    11,  -145,   268,   332,    30,
      27,    89,    90,    91,    92,   275,    25,    25,    26,    29,
     192,   113,   114,   115,   193,   117,   118,   119,    27,    27,
     374,    25,    25,   111,    22,    99,   178,   160,    25,    98,
     179,    24,   160,    27,    27,    37,   183,   293,   304,  -144,
      27,   311,  -144,   180,   162,   163,   164,   319,   165,   166,
     167,    32,    33,    34,    35,   196,    41,   229,    39,    43,
     291,    53,    54,   390,   391,   392,    25,   285,   346,   347,
     178,    40,   286,    55,   179,   306,   287,   302,    27,   413,
      50,    25,   317,   315,    51,   178,    56,    57,    59,   179,
      58,   342,    72,    27,   277,   278,   279,   280,   281,   282,
      73,    75,   236,    89,    90,    91,    92,   240,   409,   162,
     163,   164,    74,   165,   166,    76,   375,   200,   376,    78,
      83,    79,    84,    87,    88,    95,   171,   172,   175,   344,
     380,   412,   180,   185,   186,   187,   201,   125,   210,   190,
     191,   289,   212,   183,   183,   213,   214,   235,   237,   241,
     249,   250,   251,   264,   252,   397,   256,   260,   269,   270,
     271,   160,   272,   309,   399,   322,   316,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,   310,   320,
     323,   398,   330,   324,   327,   345,  -211,   348,  -141,   349,
    -209,   100,   229,   101,   394,  -210,   378,   377,   385,   386,
     387,   388,   410,   102,   103,   389,   393,   341,   104,    11,
     105,   106,   107,   395,   108,   343,   109,   396,   110,   400,
     401,   411,   417,    25,   111,   414,   418,   112,   113,   114,
     115,   116,   117,   118,   119,   120,    38,    49,    82,   174,
     121,   122,   123,   124,   284,   379,   337,   416,   200,   301,
     240,   188,   415,   381,   340,   328,   331,   177,   305,   307,
     100,     0,     0,   173,   183,   183,   183,     0,     0,     0,
       0,     0,   102,   103,     0,     0,     0,   104,    11,   105,
     106,   107,     0,   108,     0,   109,     0,   110,     0,     0,
       0,     0,    25,   111,     0,   125,   112,   113,   114,   115,
     116,   117,   118,   119,   120,     0,     0,     0,     0,   121,
     122,   123,   124,     0,   294,   295,   203,   204,   112,   113,
     114,   115,   116,   117,   118,   119,   120,     0,     0,     0,
       0,     0,   183,   296,     0,     0,     0,     0,     0,     0,
       0,     0,   183,    25,   202,   203,   204,   192,   113,   114,
     115,   193,   117,   118,   119,    27,     0,     0,     0,     0,
       0,     0,     0,     0,   125,   -83,   350,   351,   352,   353,
     354,   355,   356,   357,   358,   359,   360,   361,   362,   363,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     297,   298,   299,     0,   -83,   -83,   -83,   -83,   -83,   -83,
     -83,   -83,   -83,   -83,   -83,   -83,   -83,     0,     0,     0,
       0,     0,   229,     0,     0,     0,     0,     0,     0,     0,
     364,     0,   365,   366,   367,   368,   369,   370,   371,   372,
       0,   215,   216,   217,   218,   219,   220,   221,   222,   223,
     224,   225,   226,   227,   228,    25,   202,   203,   204,   192,
     113,   114,   115,   193,   117,   118,   119,    27,     0,     0,
       0,     0,     0,     0,   229,     0,     0,     0,     0,   230,
      25,   242,   203,   204,   192,   113,   114,   115,   193,   117,
     118,   119,    27
};

static const yytype_int16 yycheck[] =
{
       9,    96,   212,   135,   136,   163,   101,   106,   272,   235,
       4,   103,   105,    96,     4,     4,    14,    53,   101,   105,
       0,    16,   108,    32,    33,    34,    35,   393,   123,    34,
     125,    33,    34,    31,    29,    37,    95,    32,    97,    41,
     406,     5,     6,    45,     8,     9,    10,   146,    33,    34,
     252,    15,     7,   105,   256,    19,   108,   189,   260,   102,
      45,    46,    47,    48,    49,   101,    33,    33,    34,    78,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    45,
     306,    33,    33,    34,    34,    94,    37,    96,    33,    34,
      41,    34,   101,    45,    45,     4,   105,   229,   230,   105,
      45,   233,   108,   105,    94,    95,    96,   101,    98,    99,
     100,    46,    47,    48,    49,   124,    35,   102,   101,    34,
     213,   103,   104,   333,   334,   335,    33,    34,   103,   104,
      37,   101,    39,   107,    41,   230,    43,   230,    45,   403,
      34,    33,   237,   235,    34,    37,   107,   107,     4,    41,
     107,   283,    34,    45,    55,    56,    57,    58,    59,    60,
      35,    34,   171,    46,    47,    48,    49,   176,   394,    94,
      95,    96,    36,    98,    99,    34,   308,   272,   310,   105,
      34,   105,    12,   106,   106,    11,    54,     4,    34,   288,
     322,   401,   105,     4,     4,     4,     4,   105,     4,    52,
      52,   411,   108,   212,   213,   107,     4,   105,   101,     4,
       4,     4,     4,     4,    21,   347,    20,    30,     4,     4,
     106,   230,   101,     4,   382,    54,   235,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,   107,    94,
     106,   373,    25,   101,    23,     4,     4,     4,   105,     4,
       4,     1,   102,     3,   101,     4,     4,   106,     4,     4,
       4,     4,   394,    13,    14,     4,     4,   276,    18,    19,
      20,    21,    22,     4,    24,   284,    26,     4,    28,     4,
     101,    17,     4,    33,    34,    27,     4,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    12,    37,    78,   101,
      50,    51,    52,    53,   209,   319,   262,   411,   403,   230,
     319,   110,   406,   324,   273,   254,   258,   104,   230,   230,
       1,    -1,    -1,     4,   333,   334,   335,    -1,    -1,    -1,
      -1,    -1,    13,    14,    -1,    -1,    -1,    18,    19,    20,
      21,    22,    -1,    24,    -1,    26,    -1,    28,    -1,    -1,
      -1,    -1,    33,    34,    -1,   105,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    -1,    -1,    -1,    -1,    50,
      51,    52,    53,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    -1,    -1,    -1,
      -1,    -1,   401,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   411,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   105,     4,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,   110,   111,    -1,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    -1,    -1,    -1,
      -1,    -1,   102,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     109,    -1,   111,   112,   113,   114,   115,   116,   117,   118,
      -1,    69,    70,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    -1,    -1,
      -1,    -1,    -1,    -1,   102,    -1,    -1,    -1,    -1,   107,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   120,   121,     0,     5,     6,     8,     9,    10,
      15,    19,   122,   123,   124,   125,   126,   127,   128,   131,
     220,    34,    34,     7,    34,    33,    34,    45,   134,   231,
     102,   129,    46,    47,    48,    49,   222,     4,   121,   101,
     101,    35,   132,    34,   130,   231,   231,   231,   231,   123,
      34,    34,   135,   103,   104,   107,   107,   107,   107,     4,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,   136,    34,    35,    36,    34,    34,   133,   105,   105,
     219,   138,   134,    34,    12,   139,   141,   106,   106,    46,
      47,    48,    49,   140,   227,    11,   142,   196,    34,   231,
       1,     3,    13,    14,    18,    20,    21,    22,    24,    26,
      28,    34,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    50,    51,    52,    53,   105,   143,   144,   145,   146,
     147,   148,   149,   152,   161,   162,   163,   166,   167,   171,
     172,   173,   182,   183,   184,   185,   186,   188,   190,   199,
     200,   201,   202,   209,   210,   220,   221,   228,   229,   230,
     231,     4,    94,    95,    96,    98,    99,   100,   195,   197,
     198,    54,     4,     4,   144,    34,   227,   222,    37,    41,
     105,   183,   203,   231,   203,     4,     4,     4,   190,   153,
      52,    52,    37,    41,   228,   231,   231,   191,   192,   193,
     228,     4,    34,    35,    36,   165,   224,   225,   228,   224,
       4,   203,   108,   107,     4,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,   102,
     107,   150,   159,   234,   219,   105,   231,   101,   168,   169,
     231,     4,    34,   204,   205,   206,   207,   208,   224,     4,
       4,     4,    21,   211,   212,   213,    20,   214,   215,   216,
      30,   174,   175,   176,     4,   154,   155,   156,   224,     4,
       4,   106,   101,   194,    53,   101,   164,    55,    56,    57,
      58,    59,    60,   226,   164,    34,    39,    43,   187,   188,
     189,   183,   160,   224,    33,    34,    52,   109,   110,   111,
     151,   152,   183,   223,   224,   225,   228,   229,   232,     4,
     107,   224,    34,   137,   159,   227,   231,   228,     4,   101,
      94,   170,    54,   106,   101,   217,   208,    23,   213,   208,
      25,   216,   208,    16,    29,    32,   177,   176,   157,   193,
     195,   231,   224,   231,   203,     4,   103,   104,     4,     4,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,   109,   111,   112,   113,   114,   115,
     116,   117,   118,   233,   159,   224,   224,   106,     4,   169,
     224,   206,    95,    97,   218,     4,     4,     4,     4,     4,
     188,   188,   188,     4,   101,     4,     4,   224,   224,   219,
       4,   101,   178,    31,   167,   179,   180,   181,   158,   159,
     224,    17,   188,   193,    27,   181,   187,     4,     4
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
#line 358 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 362 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 368 "pir.y"
    { set_hll((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 17:
#line 372 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 382 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 384 "pir.y"
    { (yyval.fixme) = (yyvsp[(2) - (3)].fixme); ;}
    break;

  case 21:
#line 388 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 22:
#line 390 "pir.y"
    { ;}
    break;

  case 23:
#line 396 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 24:
#line 397 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(4) - (5)].ival)); ;}
    break;

  case 28:
#line 408 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 29:
#line 410 "pir.y"
    { (yyval.ival) |= (yyvsp[(2) - (2)].ival); ;}
    break;

  case 30:
#line 414 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 31:
#line 416 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 32:
#line 418 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 33:
#line 420 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 34:
#line 422 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 35:
#line 424 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 36:
#line 426 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 37:
#line 428 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 38:
#line 430 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 39:
#line 432 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 40:
#line 434 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 47:
#line 449 "pir.y"
    { set_param_flag((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                          IF_NAMED_PARAM_SET_ALIAS((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                        ;}
    break;

  case 48:
#line 455 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 49:
#line 457 "pir.y"
    { (yyval.targ) = add_param_named(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval), (yyvsp[(2) - (4)].sval)); ;}
    break;

  case 51:
#line 464 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 53:
#line 470 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 54:
#line 472 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 69:
#line 492 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                              fprintf(stderr, "Too many errors. Compilation aborted.\n");
                              exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                          }
                          yyerrok;
                        ;}
    break;

  case 70:
#line 501 "pir.y"
    { set_instr(lexer, "null");
                          add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                        ;}
    break;

  case 71:
#line 505 "pir.y"
    { set_instr(lexer, "null");
                          add_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                        ;}
    break;

  case 72:
#line 511 "pir.y"
    { set_instr(lexer, "get_results");
                          add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                        ;}
    break;

  case 74:
#line 520 "pir.y"
    { add_first_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 75:
#line 545 "pir.y"
    { assign(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 76:
#line 547 "pir.y"
    { assign(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 77:
#line 549 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 78:
#line 553 "pir.y"
    { assign(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 79:
#line 555 "pir.y"
    { assign(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 80:
#line 557 "pir.y"
    { assign(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 81:
#line 559 "pir.y"
    { assign(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 82:
#line 561 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 83:
#line 565 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 88:
#line 578 "pir.y"
    { add_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 89:
#line 583 "pir.y"
    { /* nothing to do */;}
    break;

  case 90:
#line 585 "pir.y"
    { add_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 93:
#line 593 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 94:
#line 597 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 95:
#line 599 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 96:
#line 603 "pir.y"
    { /* it was "unless", so "invert" the opcode */
                           if ((yyvsp[(1) - (5)].ival) > 0) {
                              invert_instr(lexer);
                           }
                           add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                         ;}
    break;

  case 97:
#line 610 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval));
                           add_operand(lexer, (yyvsp[(2) - (5)].expr));
                           add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                         ;}
    break;

  case 98:
#line 616 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 99:
#line 617 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 100:
#line 622 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 101:
#line 624 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 104:
#line 633 "pir.y"
    { set_instr(lexer, "if");
                           add_operand(lexer, (yyvsp[(1) - (1)].expr));
                         ;}
    break;

  case 105:
#line 637 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                           add_operand(lexer, (yyvsp[(1) - (3)].expr));
                           add_operand(lexer, (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 106:
#line 645 "pir.y"
    { set_instr(lexer, "branch");
                           add_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 107:
#line 651 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 108:
#line 655 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 109:
#line 657 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 110:
#line 661 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 111:
#line 664 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 112:
#line 665 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 113:
#line 671 "pir.y"
    { set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval)); ;}
    break;

  case 116:
#line 686 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                             (yyval.fixme) = NULL;
                           ;}
    break;

  case 117:
#line 694 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 118:
#line 696 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 119:
#line 700 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 120:
#line 702 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 121:
#line 706 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 122:
#line 710 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 123:
#line 712 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 124:
#line 715 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 125:
#line 719 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 126:
#line 721 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 127:
#line 727 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 128:
#line 729 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 129:
#line 733 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 130:
#line 735 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 131:
#line 739 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 132:
#line 741 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 133:
#line 745 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 134:
#line 747 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 135:
#line 749 "pir.y"
    { set_invocation_results((yyvsp[(1) - (2)].invo), NULL); ;}
    break;

  case 138:
#line 758 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 139:
#line 765 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 140:
#line 771 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 141:
#line 773 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 144:
#line 781 "pir.y"
    { (yyval.targ) = target_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 145:
#line 783 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 146:
#line 785 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 147:
#line 789 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 148:
#line 791 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 149:
#line 793 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 150:
#line 798 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 151:
#line 802 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 152:
#line 804 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 153:
#line 808 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 154:
#line 810 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 155:
#line 814 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 156:
#line 822 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 157:
#line 824 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 158:
#line 828 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 159:
#line 830 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 160:
#line 832 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 161:
#line 834 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 162:
#line 836 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 163:
#line 842 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 164:
#line 844 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 167:
#line 852 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 172:
#line 867 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 173:
#line 871 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 174:
#line 875 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 175:
#line 881 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 176:
#line 885 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 177:
#line 887 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 178:
#line 891 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 179:
#line 893 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 182:
#line 901 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 183:
#line 907 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 184:
#line 917 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 185:
#line 925 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 186:
#line 931 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 187:
#line 933 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 188:
#line 938 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 189:
#line 940 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 190:
#line 945 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 191:
#line 949 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 192:
#line 951 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 193:
#line 955 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 194:
#line 957 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 195:
#line 961 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 196:
#line 966 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 197:
#line 968 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 198:
#line 972 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 199:
#line 974 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 200:
#line 980 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 201:
#line 982 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 202:
#line 986 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 204:
#line 991 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), GLOBALCONST); ;}
    break;

  case 205:
#line 995 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 206:
#line 997 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 207:
#line 999 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 208:
#line 1001 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 209:
#line 1010 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 210:
#line 1011 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 211:
#line 1012 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 212:
#line 1015 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 213:
#line 1016 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 214:
#line 1019 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 215:
#line 1020 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 216:
#line 1021 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 217:
#line 1024 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 218:
#line 1025 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 219:
#line 1026 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 220:
#line 1027 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 221:
#line 1028 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 222:
#line 1029 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 223:
#line 1032 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 224:
#line 1033 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 225:
#line 1034 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 226:
#line 1035 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 227:
#line 1038 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 228:
#line 1039 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 229:
#line 1042 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 230:
#line 1043 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 231:
#line 1044 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 232:
#line 1045 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 234:
#line 1049 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 235:
#line 1050 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 236:
#line 1051 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 237:
#line 1052 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 240:
#line 1059 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 241:
#line 1060 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 242:
#line 1061 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 243:
#line 1064 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 244:
#line 1065 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 245:
#line 1066 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 246:
#line 1067 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 247:
#line 1068 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 248:
#line 1069 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 249:
#line 1070 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 250:
#line 1071 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 251:
#line 1072 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 252:
#line 1073 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 253:
#line 1074 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 254:
#line 1075 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 255:
#line 1076 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 256:
#line 1077 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 257:
#line 1078 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 258:
#line 1079 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 259:
#line 1080 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 260:
#line 1081 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 261:
#line 1082 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 262:
#line 1083 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 263:
#line 1084 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 264:
#line 1085 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 265:
#line 1086 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 266:
#line 1090 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 267:
#line 1091 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 268:
#line 1092 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 269:
#line 1093 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 270:
#line 1094 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 271:
#line 1095 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 272:
#line 1096 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 273:
#line 1097 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 274:
#line 1098 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 275:
#line 1099 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 276:
#line 1100 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 277:
#line 1101 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 278:
#line 1102 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 279:
#line 1103 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3223 "pirparser.c"
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


#line 1105 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


