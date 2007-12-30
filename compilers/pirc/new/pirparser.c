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
#define YYLAST   483

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  119
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  115
/* YYNRULES -- Number of rules.  */
#define YYNRULES  278
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
     411,   414,   418,   420,   424,   427,   428,   431,   433,   435,
     437,   439,   442,   443,   446,   448,   450,   455,   457,   459,
     461,   463,   467,   471,   475,   479,   480,   482,   484,   488,
     490,   492,   496,   499,   505,   511,   512,   514,   516,   519,
     523,   524,   526,   528,   531,   535,   536,   539,   541,   544,
     545,   549,   552,   555,   559,   564,   569,   574,   579,   581,
     583,   585,   587,   589,   591,   593,   595,   597,   599,   601,
     603,   605,   607,   609,   611,   613,   615,   617,   619,   621,
     623,   625,   627,   629,   631,   633,   635,   637,   639,   641,
     643,   645,   647,   649,   651,   653,   655,   657,   659,   661,
     663,   665,   667,   669,   671,   673,   675,   677,   679,   681,
     683,   685,   687,   689,   691,   693,   695,   697,   699,   701,
     703,   705,   707,   709,   711,   713,   715,   717,   719
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     120,     0,    -1,   121,   122,   121,    -1,    -1,     4,    -1,
     123,    -1,   122,     4,   123,    -1,   131,    -1,   219,    -1,
     128,    -1,   126,    -1,   127,    -1,   125,    -1,   124,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,   101,
      34,    -1,     6,    34,   101,    34,    -1,    15,   129,    -1,
      -1,   102,   130,   103,    -1,    34,    -1,   130,   104,    34,
      -1,    -1,    -1,    10,   134,   132,   135,     4,   133,   138,
     141,    11,    -1,   230,    -1,    34,    -1,    -1,   135,   136,
      -1,    86,    -1,    83,    -1,    84,    -1,    85,    -1,    87,
      -1,    90,    -1,    92,    -1,    93,    -1,    91,    -1,    88,
     105,   134,   106,    -1,    89,   218,    -1,   230,    -1,    34,
      -1,   159,    -1,   226,    -1,    -1,   138,   139,    -1,    12,
     140,   195,     4,    -1,   226,   230,    -1,   226,    34,    54,
     230,    -1,    -1,    -1,   141,   142,   143,    -1,     3,     4,
      -1,     3,   144,    -1,   144,    -1,   161,    -1,   166,    -1,
     167,    -1,   171,    -1,   220,    -1,   198,    -1,   199,    -1,
     172,    -1,   149,    -1,   148,    -1,   147,    -1,   146,    -1,
     145,    -1,     1,     4,    -1,    52,   227,     4,    -1,   227,
     107,    52,     4,    -1,    28,   190,     4,    -1,   152,     4,
      -1,   227,   150,     4,    -1,   233,   223,    -1,   159,   107,
     223,    -1,   107,   151,    -1,   231,   223,    -1,   222,    -1,
     223,   232,   223,    -1,   227,   159,    -1,   152,    -1,    -1,
      45,   153,   154,    -1,    -1,   155,    -1,   156,   157,    -1,
     223,    -1,    -1,   157,   101,   158,    -1,   223,    -1,   159,
      -1,   102,   160,   103,    -1,   223,    -1,   160,   104,   223,
      -1,   162,   165,   164,   230,     4,    -1,   163,   223,   164,
     230,     4,    -1,    50,    -1,    51,    -1,    50,    52,    -1,
      51,    52,    -1,    53,    -1,   101,    -1,   223,    -1,   223,
     225,   223,    -1,    53,   230,     4,    -1,    14,   226,   168,
       4,    -1,   169,    -1,   168,   101,   169,    -1,   230,   170,
      -1,    -1,    94,    -1,    13,    34,   101,   227,     4,    -1,
     173,    -1,   182,    -1,    26,     4,   174,   177,     4,   179,
      27,     4,    -1,    -1,   175,    -1,   176,    -1,   175,   176,
      -1,    30,   207,     4,    -1,    29,   188,   178,    -1,    32,
     188,    -1,    16,   188,     4,    17,   187,    -1,    -1,   101,
     188,    -1,    -1,   180,    -1,   181,    -1,   180,   181,    -1,
      31,   192,     4,    -1,   167,    -1,   190,   107,   183,     4,
      -1,   227,   107,   183,     4,    -1,   183,     4,    -1,   185,
      -1,   184,    -1,   188,   108,   187,   202,    -1,   186,   202,
      -1,   188,    -1,    34,    -1,   188,    -1,   189,    -1,   230,
      -1,    41,    -1,    37,    -1,    34,    -1,    43,    -1,    39,
      -1,   105,   106,    -1,   105,   191,   106,    -1,   192,    -1,
     191,   101,   192,    -1,   227,   193,    -1,    -1,   193,   194,
      -1,    98,    -1,    99,    -1,    96,    -1,    94,    -1,    95,
     218,    -1,    -1,   195,   196,    -1,   194,    -1,   197,    -1,
     100,   105,   137,   106,    -1,   200,    -1,   208,    -1,   201,
      -1,   209,    -1,    20,   202,     4,    -1,    20,   183,     4,
      -1,    21,   202,     4,    -1,   105,   203,   106,    -1,    -1,
     204,    -1,   205,    -1,   204,   101,   205,    -1,   207,    -1,
     206,    -1,    34,    54,   223,    -1,   223,   216,    -1,    24,
       4,   213,    25,     4,    -1,    22,     4,   210,    23,     4,
      -1,    -1,   211,    -1,   212,    -1,   211,   212,    -1,    21,
     207,     4,    -1,    -1,   214,    -1,   215,    -1,   214,   215,
      -1,    20,   207,     4,    -1,    -1,   216,   217,    -1,    97,
      -1,    95,   218,    -1,    -1,   105,    34,   106,    -1,    19,
     221,    -1,   219,     4,    -1,    18,   221,     4,    -1,    46,
     230,   107,    35,    -1,    47,   230,   107,    36,    -1,    48,
     230,   107,    34,    -1,    49,   230,   107,    34,    -1,   224,
      -1,   228,    -1,    33,    -1,   227,    -1,   224,    -1,    34,
      -1,    35,    -1,    36,    -1,    55,    -1,    56,    -1,    57,
      -1,    58,    -1,    60,    -1,    59,    -1,    46,    -1,    47,
      -1,    48,    -1,    49,    -1,   228,    -1,   230,    -1,    41,
      -1,    42,    -1,    44,    -1,    43,    -1,   229,    -1,    37,
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
       0,   322,   322,   327,   328,   331,   332,   335,   336,   337,
     338,   339,   340,   341,   344,   348,   354,   358,   365,   369,
     370,   374,   376,   382,   383,   382,   389,   390,   394,   395,
     399,   401,   403,   405,   407,   409,   411,   413,   415,   417,
     419,   424,   425,   426,   427,   430,   431,   434,   440,   442,
     449,   450,   450,   455,   457,   459,   462,   463,   464,   465,
     466,   467,   468,   469,   470,   471,   472,   473,   474,   477,
     486,   490,   496,   502,   505,   523,   525,   527,   531,   533,
     535,   537,   539,   544,   544,   548,   549,   552,   556,   561,
     562,   566,   567,   570,   574,   576,   580,   587,   594,   595,
     599,   601,   605,   606,   610,   614,   622,   628,   632,   634,
     638,   642,   643,   648,   653,   654,   657,   669,   670,   673,
     674,   678,   682,   684,   686,   691,   692,   697,   698,   701,
     702,   706,   707,   710,   712,   714,   719,   720,   723,   730,
     736,   737,   741,   742,   745,   747,   749,   753,   755,   757,
     761,   762,   765,   766,   770,   779,   780,   784,   786,   788,
     790,   792,   799,   800,   804,   805,   808,   813,   814,   817,
     818,   821,   825,   829,   835,   839,   840,   843,   844,   848,
     849,   852,   858,   867,   875,   883,   884,   888,   889,   894,
     898,   899,   902,   903,   907,   912,   913,   916,   917,   922,
     923,   926,   930,   931,   935,   936,   937,   938,   943,   944,
     945,   948,   949,   952,   953,   954,   957,   958,   959,   960,
     961,   962,   965,   966,   967,   968,   971,   972,   975,   976,
     977,   978,   979,   982,   983,   984,   985,   988,   989,   992,
     993,   994,   997,   998,   999,  1000,  1001,  1002,  1003,  1004,
    1005,  1006,  1007,  1008,  1009,  1010,  1011,  1012,  1013,  1014,
    1015,  1016,  1017,  1018,  1019,  1023,  1024,  1025,  1026,  1027,
    1028,  1029,  1030,  1031,  1032,  1033,  1034,  1035,  1036
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
  "$accept", "program", "opt_nl", "pir_chunks", "pir_chunk", "pir_pragma",
  "loadlib", "hll_specifier", "hll_mapping", "namespace_declaration",
  "opt_namespace_id", "namespace_id", "sub_def", "@1", "@2", "sub_id",
  "sub_flags", "sub_flag", "multi_type", "parameters", "parameter",
  "param_def", "instructions", "@3", "instruction", "statement",
  "error_stat", "null_stat", "getresults_stat", "parrot_stat",
  "assignment_stat", "assign_tail", "assign_expr", "parrot_instruction",
  "@4", "opt_parrot_op_args", "parrot_op_args", "first_op_arg",
  "other_op_args", "other_op_arg", "keylist", "keys", "conditional_stat",
  "if_type", "if_null_type", "then", "condition", "goto_stat",
  "local_declaration", "local_id_list", "local_id", "has_unique_reg",
  "lex_declaration", "invocation_stat", "long_invocation_stat",
  "opt_long_arguments", "long_arguments", "long_argument",
  "long_invocation", "opt_ret_cont", "opt_long_results", "long_results",
  "long_result", "short_invocation_stat", "simple_invocation",
  "methodcall", "subcall", "sub", "method", "invokable", "string_object",
  "opt_target_list", "target_list", "result_target", "target_flags",
  "target_flag", "param_flags", "param_flag", "invocant_param",
  "return_stat", "yield_stat", "short_return_stat", "short_yield_stat",
  "arguments", "opt_arguments_list", "arguments_list", "argument",
  "named_arg", "short_arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "const_declaration",
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
     190,   190,   191,   191,   192,   193,   193,   194,   194,   194,
     194,   194,   195,   195,   196,   196,   197,   198,   198,   199,
     199,   200,   200,   201,   202,   203,   203,   204,   204,   205,
     205,   206,   207,   208,   209,   210,   210,   211,   211,   212,
     213,   213,   214,   214,   215,   216,   216,   217,   217,   218,
     218,   219,   220,   220,   221,   221,   221,   221,   222,   222,
     222,   223,   223,   224,   224,   224,   225,   225,   225,   225,
     225,   225,   226,   226,   226,   226,   227,   227,   228,   228,
     228,   228,   228,   229,   229,   229,   229,   230,   230,   231,
     231,   231,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   233,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   233,   233,   233,   233
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
       2,     3,     1,     3,     2,     0,     2,     1,     1,     1,
       1,     2,     0,     2,     1,     1,     4,     1,     1,     1,
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
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
      19,     0,     3,     5,    13,    12,    10,    11,     9,     7,
       8,     0,     0,     0,    15,   237,    27,   238,    23,    26,
       0,    18,     0,     0,     0,     0,   201,     4,     2,     0,
       0,    14,    28,    21,     0,     0,     0,     0,     0,     6,
      16,    17,     0,    20,     0,     0,     0,     0,     0,    24,
      31,    32,    33,    30,    34,     0,   199,    35,    38,    36,
      37,    29,    22,   204,   205,   206,   207,    45,     0,     0,
      40,    50,     0,     0,     0,    46,    51,    39,   200,   222,
     223,   224,   225,   162,     0,    25,     0,     0,     0,    48,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   141,   233,   234,   236,   235,   228,   229,   231,   230,
     238,    98,    99,     0,     0,     0,    52,    55,    68,    67,
      66,    65,    64,     0,    56,     0,     0,    57,    58,    59,
      63,   114,   115,     0,   137,   136,     0,   140,     0,    61,
      62,   167,   169,   168,   170,     0,    60,     0,   226,   232,
     227,    47,   160,   199,   159,   157,   158,     0,   164,   163,
     165,     0,    69,    53,    54,     0,     0,     0,   146,   145,
     175,     0,     0,   144,     0,   185,   190,   117,     0,    85,
     100,   101,   233,   228,     0,   227,     0,   150,     0,   152,
     155,    73,   213,   214,   215,     0,   104,   212,   211,     0,
     135,   139,     0,     0,   202,   278,   276,   277,   265,   266,
     267,   268,   269,   270,   272,   273,   271,   274,   275,     0,
       0,     0,     0,     0,   161,     0,    49,     0,     0,   108,
     111,   203,   213,     0,   176,   177,   180,   179,   195,   172,
     171,   173,     0,     0,   186,   187,     0,     0,   191,   192,
       0,     0,   118,   119,    72,    84,    86,    89,    88,    70,
     106,     0,   151,   154,   102,   103,     0,   216,   217,   218,
     219,   221,   220,     0,     0,   147,   149,   148,     0,   142,
     143,     0,     0,    94,   237,   213,     0,   239,   240,   241,
      77,    82,     0,    79,     0,   212,   211,   226,     0,    74,
       0,    75,    42,     0,    43,    44,    41,     0,   107,     0,
     112,   110,     0,   174,     0,   182,     0,     0,   188,     0,
       0,   193,     0,     0,     0,     0,     0,   120,    87,   153,
     156,     0,   105,     0,   138,   133,    93,     0,    71,   134,
     264,   259,   261,   260,   263,   262,   252,   253,   254,   257,
     255,   256,   258,   251,   243,   249,   242,   244,   245,   246,
     247,   248,   250,     0,    81,    78,    76,   166,   113,   109,
     181,   178,   199,   197,   196,   189,   184,   194,   183,   121,
       0,   125,   123,   127,     0,    96,    97,    95,    80,   198,
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
     290,   148,   198,   199,   273,   168,    97,   169,   170,   149,
     150,   151,   152,   182,   243,   244,   245,   246,   247,   153,
     154,   253,   254,   255,   257,   258,   259,   325,   384,    80,
      20,   156,    36,   303,   248,   207,   283,    94,   208,   158,
     159,   195,   308,   373,   233
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -378
static const yytype_int16 yypact[] =
{
      11,  -378,    68,    67,  -378,    54,    60,   119,    98,    50,
      32,   151,   137,  -378,  -378,  -378,  -378,  -378,  -378,  -378,
    -378,    45,    46,   120,  -378,  -378,  -378,  -378,  -378,  -378,
     129,  -378,    58,    58,    58,    58,  -378,    67,  -378,   130,
     132,  -378,  -378,  -378,    14,    63,    64,    65,    71,  -378,
    -378,  -378,   144,  -378,   140,   145,   139,   147,   153,  -378,
    -378,  -378,  -378,  -378,  -378,    80,    84,  -378,  -378,  -378,
    -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,    50,   159,
    -378,   183,    95,    96,   161,  -378,   194,  -378,  -378,  -378,
    -378,  -378,  -378,  -378,    79,  -378,   240,    10,   157,  -378,
     208,   314,   180,   161,   151,    26,   110,   213,   214,   215,
     115,  -378,   -65,  -378,  -378,  -378,   -64,  -378,  -378,  -378,
     399,   171,   172,   207,    58,    -6,  -378,  -378,  -378,  -378,
    -378,  -378,  -378,   221,  -378,   371,   371,  -378,  -378,  -378,
    -378,  -378,  -378,   234,  -378,  -378,   110,   131,   148,  -378,
    -378,  -378,  -378,  -378,  -378,   252,  -378,   376,  -378,  -378,
      28,  -378,  -378,    84,  -378,  -378,  -378,   152,  -378,  -378,
    -378,    58,  -378,  -378,  -378,   164,    58,   265,  -378,  -378,
     426,   266,   267,  -378,   268,   255,   269,   256,   283,   371,
    -378,  -378,  -378,  -378,   284,  -378,   303,  -378,    13,  -378,
    -378,  -378,  -378,  -378,  -378,   -40,   -38,  -378,  -378,   -40,
    -378,  -378,   149,    56,  -378,  -378,  -378,  -378,  -378,  -378,
    -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,   371,
      12,   305,   204,   371,  -378,   111,  -378,   207,     6,  -378,
     218,  -378,   259,   210,   216,  -378,  -378,  -378,  -378,  -378,
    -378,  -378,   371,   291,   255,  -378,   371,   294,   269,  -378,
     371,    49,   256,  -378,  -378,  -378,  -378,  -378,  -378,  -378,
    -378,   207,  -378,    55,  -378,  -378,    58,  -378,  -378,  -378,
    -378,  -378,  -378,   371,    58,  -378,  -378,  -378,   110,  -378,
    -378,   316,    35,  -378,   317,   217,   319,  -378,  -378,  -378,
    -378,  -378,   325,  -378,   313,   326,   229,   333,   371,  -378,
     371,  -378,  -378,   233,  -378,  -378,  -378,   337,  -378,    58,
    -378,  -378,   371,  -378,   426,    30,   339,   340,  -378,   342,
     345,  -378,   346,   128,   128,   128,   356,  -378,   260,  -378,
    -378,   358,  -378,   378,  -378,  -378,  -378,   371,  -378,  -378,
    -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,
    -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,  -378,
    -378,  -378,  -378,   371,  -378,  -378,  -378,  -378,  -378,  -378,
    -378,  -378,    84,  -378,  -378,  -378,  -378,  -378,  -378,  -378,
     379,   285,  -378,    48,   261,  -378,  -378,  -378,  -378,  -378,
     367,   128,  -378,   207,  -378,   360,    48,  -378,  -378,  -378,
    -378,   149,  -378,   381,   384,  -378,  -378,  -378,  -378
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -378,  -378,   377,  -378,   353,  -378,  -378,  -378,  -378,  -378,
    -378,  -378,  -378,  -378,  -378,   315,  -378,  -378,  -378,  -378,
    -378,  -378,  -378,  -378,  -378,   290,  -378,  -378,  -378,  -378,
    -378,  -378,  -378,   165,  -378,  -378,  -378,  -378,  -378,  -378,
    -226,  -378,  -378,  -378,  -378,   185,  -378,  -378,  -377,  -378,
      77,  -378,  -378,  -378,  -378,  -378,  -378,   135,  -378,  -378,
    -378,  -378,    -8,  -378,   -93,  -378,  -378,  -378,   -12,  -205,
    -378,   307,  -378,  -263,  -378,   127,  -378,  -378,  -378,  -378,
    -378,  -378,  -378,  -104,  -378,  -378,    94,  -378,  -186,  -378,
    -378,  -378,  -378,   166,  -378,  -378,   143,  -378,  -378,  -160,
      15,  -378,   368,  -378,  -131,   191,  -378,   -92,   -95,   193,
    -378,    -9,  -378,  -378,  -378
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -211
static const yytype_int16 yytable[] =
{
      29,   157,   184,   234,   206,   209,   157,   289,   339,   314,
     318,   176,   181,   274,   161,     1,   404,   277,   278,   279,
     280,   281,   282,    45,    46,    47,    48,    25,   194,   404,
     200,   192,   113,   114,   115,   193,   117,   118,   119,    27,
    -146,  -145,   211,  -146,  -145,   294,   295,   203,   204,   112,
     113,   114,   115,   116,   117,   118,   119,   120,   268,    25,
     111,   275,   103,   178,   296,   333,   326,   179,     4,    29,
     329,    27,     5,     6,   332,     7,     8,     9,   334,   403,
     374,   335,    10,    25,    26,    99,    11,   160,    21,    25,
     111,    25,   160,   178,    22,    27,   183,   179,   293,   304,
     197,    27,   311,    27,   162,   163,   164,   319,   165,   166,
     167,   155,    25,    98,   271,   196,   155,    53,    54,   272,
     291,   297,   298,   299,    27,   382,    23,   383,   390,   391,
     392,   180,    24,  -144,    30,   306,  -144,   302,   346,   347,
     413,    37,   317,   315,    25,   312,    39,    40,    59,   162,
     163,   164,   342,   165,   166,    41,    27,    89,    90,    91,
      92,    25,   236,    43,    50,   178,    51,   240,   409,   179,
      55,    56,    57,    27,    72,    74,   200,   375,    58,   376,
      73,    75,    25,   285,   344,    78,   178,    76,   286,    79,
     179,   380,   287,    83,    27,    84,   412,    32,    33,    34,
      35,    87,    88,   183,   183,    95,   289,    89,    90,    91,
      92,   171,   172,   229,   175,   180,   397,   185,   186,   187,
     125,   160,   399,   190,   191,   201,   316,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,   210,   212,
      25,   100,   398,   101,   192,   113,   114,   115,   193,   117,
     118,   119,    27,   102,   103,   213,   214,   235,   104,    11,
     105,   106,   107,   410,   108,   237,   109,   341,   110,   241,
     249,   250,   251,    25,   111,   343,   252,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   260,   264,   269,   256,
     121,   122,   123,   124,    25,   202,   203,   204,   192,   113,
     114,   115,   193,   117,   118,   119,    27,   270,   200,   309,
     240,   310,   320,   322,   327,   100,   323,   324,   173,   330,
     345,  -210,  -141,   348,   183,   183,   183,   102,   103,   349,
    -208,   229,   104,    11,   105,   106,   107,  -209,   108,   377,
     109,   378,   110,   385,   386,   125,   387,    25,   111,   388,
     389,   112,   113,   114,   115,   116,   117,   118,   119,   120,
     393,   394,   395,   229,   121,   122,   123,   124,   350,   351,
     352,   353,   354,   355,   356,   357,   358,   359,   360,   361,
     362,   363,   396,   400,   411,   417,   401,   414,   418,    38,
      49,   174,   183,    82,   284,   301,   379,   337,   415,   416,
     340,   331,   183,   -83,    25,   202,   203,   204,   192,   113,
     114,   115,   193,   117,   118,   119,    27,   188,   381,   125,
     328,   305,   364,   307,   365,   366,   367,   368,   369,   370,
     371,   372,   -83,   -83,   -83,   -83,   -83,   -83,   -83,   -83,
     -83,   -83,   -83,   -83,   -83,   215,   216,   217,   218,   219,
     220,   221,   222,   223,   224,   225,   226,   227,   228,    25,
     242,   203,   204,   192,   113,   114,   115,   193,   117,   118,
     119,    27,   177,     0,     0,     0,     0,     0,   229,     0,
       0,     0,     0,   230
};

static const yytype_int16 yycheck[] =
{
       9,    96,   106,   163,   135,   136,   101,   212,   271,   235,
       4,   103,   105,    53,     4,     4,   393,    55,    56,    57,
      58,    59,    60,    32,    33,    34,    35,    33,   123,   406,
     125,    37,    38,    39,    40,    41,    42,    43,    44,    45,
     105,   105,   146,   108,   108,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,   189,    33,
      34,   101,    14,    37,    52,    16,   252,    41,     0,    78,
     256,    45,     5,     6,   260,     8,     9,    10,    29,    31,
     306,    32,    15,    33,    34,    94,    19,    96,    34,    33,
      34,    33,   101,    37,    34,    45,   105,    41,   229,   230,
     106,    45,   233,    45,    94,    95,    96,   101,    98,    99,
     100,    96,    33,    34,   101,   124,   101,   103,   104,   106,
     213,   109,   110,   111,    45,    95,     7,    97,   333,   334,
     335,   105,    34,   105,   102,   230,   108,   230,   103,   104,
     403,     4,   237,   235,    33,    34,   101,   101,     4,    94,
      95,    96,   283,    98,    99,    35,    45,    46,    47,    48,
      49,    33,   171,    34,    34,    37,    34,   176,   394,    41,
     107,   107,   107,    45,    34,    36,   271,   308,   107,   310,
      35,    34,    33,    34,   288,   105,    37,    34,    39,   105,
      41,   322,    43,    34,    45,    12,   401,    46,    47,    48,
      49,   106,   106,   212,   213,    11,   411,    46,    47,    48,
      49,    54,     4,   102,    34,   105,   347,     4,     4,     4,
     105,   230,   382,    52,    52,     4,   235,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,     4,   108,
      33,     1,   373,     3,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    13,    14,   107,     4,   105,    18,    19,
      20,    21,    22,   394,    24,   101,    26,   276,    28,     4,
       4,     4,     4,    33,    34,   284,    21,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    30,     4,     4,    20,
      50,    51,    52,    53,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,     4,   403,     4,
     319,   107,    94,    54,    23,     1,   106,   101,     4,    25,
       4,     4,   105,     4,   333,   334,   335,    13,    14,     4,
       4,   102,    18,    19,    20,    21,    22,     4,    24,   106,
      26,     4,    28,     4,     4,   105,     4,    33,    34,     4,
       4,    37,    38,    39,    40,    41,    42,    43,    44,    45,
       4,   101,     4,   102,    50,    51,    52,    53,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,     4,     4,    17,     4,   101,    27,     4,    12,
      37,   101,   401,    78,   209,   230,   319,   262,   406,   411,
     273,   258,   411,     4,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,   110,   324,   105,
     254,   230,   109,   230,   111,   112,   113,   114,   115,   116,
     117,   118,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,   104,    -1,    -1,    -1,    -1,    -1,   102,    -1,
      -1,    -1,    -1,   107
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   120,   121,     0,     5,     6,     8,     9,    10,
      15,    19,   122,   123,   124,   125,   126,   127,   128,   131,
     219,    34,    34,     7,    34,    33,    34,    45,   134,   230,
     102,   129,    46,    47,    48,    49,   221,     4,   121,   101,
     101,    35,   132,    34,   130,   230,   230,   230,   230,   123,
      34,    34,   135,   103,   104,   107,   107,   107,   107,     4,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,   136,    34,    35,    36,    34,    34,   133,   105,   105,
     218,   138,   134,    34,    12,   139,   141,   106,   106,    46,
      47,    48,    49,   140,   226,    11,   142,   195,    34,   230,
       1,     3,    13,    14,    18,    20,    21,    22,    24,    26,
      28,    34,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    50,    51,    52,    53,   105,   143,   144,   145,   146,
     147,   148,   149,   152,   161,   162,   163,   166,   167,   171,
     172,   173,   182,   183,   184,   185,   186,   188,   190,   198,
     199,   200,   201,   208,   209,   219,   220,   227,   228,   229,
     230,     4,    94,    95,    96,    98,    99,   100,   194,   196,
     197,    54,     4,     4,   144,    34,   226,   221,    37,    41,
     105,   183,   202,   230,   202,     4,     4,     4,   190,   153,
      52,    52,    37,    41,   227,   230,   230,   106,   191,   192,
     227,     4,    34,    35,    36,   165,   223,   224,   227,   223,
       4,   202,   108,   107,     4,    69,    70,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,   102,
     107,   150,   159,   233,   218,   105,   230,   101,   168,   169,
     230,     4,    34,   203,   204,   205,   206,   207,   223,     4,
       4,     4,    21,   210,   211,   212,    20,   213,   214,   215,
      30,   174,   175,   176,     4,   154,   155,   156,   223,     4,
       4,   101,   106,   193,    53,   101,   164,    55,    56,    57,
      58,    59,    60,   225,   164,    34,    39,    43,   187,   188,
     189,   183,   160,   223,    33,    34,    52,   109,   110,   111,
     151,   152,   183,   222,   223,   224,   227,   228,   231,     4,
     107,   223,    34,   137,   159,   226,   230,   227,     4,   101,
      94,   170,    54,   106,   101,   216,   207,    23,   212,   207,
      25,   215,   207,    16,    29,    32,   177,   176,   157,   192,
     194,   230,   223,   230,   202,     4,   103,   104,     4,     4,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,   109,   111,   112,   113,   114,   115,
     116,   117,   118,   232,   159,   223,   223,   106,     4,   169,
     223,   205,    95,    97,   217,     4,     4,     4,     4,     4,
     188,   188,   188,     4,   101,     4,     4,   223,   223,   218,
       4,   101,   178,    31,   167,   179,   180,   181,   158,   159,
     223,    17,   188,   192,    27,   181,   187,     4,     4
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
#line 345 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 349 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 355 "pir.y"
    { set_hll((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 17:
#line 359 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 369 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 371 "pir.y"
    { (yyval.fixme) = (yyvsp[(2) - (3)].fixme); ;}
    break;

  case 21:
#line 375 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 22:
#line 377 "pir.y"
    { ;}
    break;

  case 23:
#line 382 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 24:
#line 383 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(4) - (5)].ival)); ;}
    break;

  case 28:
#line 394 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 29:
#line 396 "pir.y"
    { (yyval.ival) |= (yyvsp[(2) - (2)].ival); ;}
    break;

  case 30:
#line 400 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 31:
#line 402 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 32:
#line 404 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 33:
#line 406 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 34:
#line 408 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 35:
#line 410 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 36:
#line 412 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 37:
#line 414 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 38:
#line 416 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 39:
#line 418 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 40:
#line 420 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 47:
#line 435 "pir.y"
    { set_param_flag((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                        IF_NAMED_PARAM_SET_ALIAS((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                      ;}
    break;

  case 48:
#line 441 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 49:
#line 443 "pir.y"
    { (yyval.targ) = add_param_named(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval), (yyvsp[(2) - (4)].sval)); ;}
    break;

  case 51:
#line 450 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 53:
#line 456 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 54:
#line 458 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 69:
#line 478 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                            fprintf(stderr, "Too many errors. Compilation aborted.\n");
                            exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                        }
                        yyerrok;
                      ;}
    break;

  case 70:
#line 487 "pir.y"
    { set_instr(lexer, "null");
                        add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                      ;}
    break;

  case 71:
#line 491 "pir.y"
    { set_instr(lexer, "null");
                        add_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                      ;}
    break;

  case 72:
#line 497 "pir.y"
    { set_instr(lexer, "get_results");
                        add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                      ;}
    break;

  case 74:
#line 506 "pir.y"
    { add_first_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 75:
#line 524 "pir.y"
    { assign(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 76:
#line 526 "pir.y"
    { assign(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 77:
#line 528 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 78:
#line 532 "pir.y"
    { assign(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 79:
#line 534 "pir.y"
    { assign(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 80:
#line 536 "pir.y"
    { assign(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 81:
#line 538 "pir.y"
    { assign(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 82:
#line 540 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 83:
#line 544 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 88:
#line 556 "pir.y"
    { add_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 89:
#line 561 "pir.y"
    { /* nothing to do */;}
    break;

  case 90:
#line 563 "pir.y"
    { add_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 93:
#line 571 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 94:
#line 575 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 95:
#line 577 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 96:
#line 581 "pir.y"
    { /* it was "unless", so "invert" the opcode */
                             if ((yyvsp[(1) - (5)].ival) > 0) {
                                invert_instr(lexer);
                             }
                             add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                           ;}
    break;

  case 97:
#line 588 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval));
                             add_operand(lexer, (yyvsp[(2) - (5)].expr));
                             add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                           ;}
    break;

  case 98:
#line 594 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 99:
#line 595 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 100:
#line 600 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 101:
#line 602 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 104:
#line 611 "pir.y"
    { set_instr(lexer, "if");
                        add_operand(lexer, (yyvsp[(1) - (1)].expr));
                      ;}
    break;

  case 105:
#line 615 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                        add_operand(lexer, (yyvsp[(1) - (3)].expr));
                        add_operand(lexer, (yyvsp[(3) - (3)].expr));
                      ;}
    break;

  case 106:
#line 623 "pir.y"
    { set_instr(lexer, "branch");
                        add_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                      ;}
    break;

  case 107:
#line 629 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 108:
#line 633 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 109:
#line 635 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 110:
#line 639 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 111:
#line 642 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 112:
#line 643 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 113:
#line 649 "pir.y"
    { set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval)); ;}
    break;

  case 116:
#line 662 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                             (yyval.fixme) = NULL;
                           ;}
    break;

  case 117:
#line 669 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 120:
#line 675 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 121:
#line 679 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 122:
#line 683 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 123:
#line 685 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 124:
#line 688 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 125:
#line 691 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 126:
#line 692 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 127:
#line 697 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 130:
#line 703 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 131:
#line 706 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 132:
#line 707 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 133:
#line 711 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 134:
#line 713 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 135:
#line 715 "pir.y"
    { set_invocation_results((yyvsp[(1) - (2)].invo), NULL); ;}
    break;

  case 138:
#line 724 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                        set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                      ;}
    break;

  case 139:
#line 731 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                        set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                      ;}
    break;

  case 141:
#line 738 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 144:
#line 746 "pir.y"
    { (yyval.targ) = target_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 145:
#line 748 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 146:
#line 750 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 147:
#line 754 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 148:
#line 756 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 149:
#line 758 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 150:
#line 761 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 151:
#line 762 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 153:
#line 767 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 154:
#line 771 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                        set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                        /* get the :named argument if necessary */
                        IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                      ;}
    break;

  case 155:
#line 779 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 156:
#line 781 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 157:
#line 785 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 158:
#line 787 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 159:
#line 789 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 160:
#line 791 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 161:
#line 793 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                             STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                      ;}
    break;

  case 162:
#line 799 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 163:
#line 801 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 166:
#line 809 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 171:
#line 822 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                           set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                         ;}
    break;

  case 172:
#line 826 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 173:
#line 830 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                            set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                          ;}
    break;

  case 174:
#line 836 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 175:
#line 839 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 178:
#line 845 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 181:
#line 853 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                              set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                            ;}
    break;

  case 182:
#line 859 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                           set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                           IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                         ;}
    break;

  case 183:
#line 870 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                           set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                         ;}
    break;

  case 184:
#line 878 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                           set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                         ;}
    break;

  case 185:
#line 883 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 188:
#line 890 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 189:
#line 895 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 190:
#line 898 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 193:
#line 904 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 194:
#line 908 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 195:
#line 912 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 196:
#line 913 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 197:
#line 916 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 198:
#line 917 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                                        STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                                      ;}
    break;

  case 199:
#line 922 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 200:
#line 923 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 201:
#line 927 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 203:
#line 932 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), GLOBALCONST); ;}
    break;

  case 204:
#line 935 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 205:
#line 936 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 206:
#line 937 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 207:
#line 938 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 208:
#line 943 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 209:
#line 944 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 210:
#line 945 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 211:
#line 948 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 212:
#line 949 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 213:
#line 952 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 214:
#line 953 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 215:
#line 954 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 216:
#line 957 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 217:
#line 958 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 218:
#line 959 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 219:
#line 960 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 220:
#line 961 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 221:
#line 962 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 222:
#line 965 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 223:
#line 966 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 224:
#line 967 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 225:
#line 968 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 226:
#line 971 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 227:
#line 972 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 228:
#line 975 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 229:
#line 976 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 230:
#line 977 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 231:
#line 978 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 233:
#line 982 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 234:
#line 983 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 235:
#line 984 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 236:
#line 985 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 239:
#line 992 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 240:
#line 993 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 241:
#line 994 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 242:
#line 997 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 243:
#line 998 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 244:
#line 999 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 245:
#line 1000 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 246:
#line 1001 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 247:
#line 1002 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 248:
#line 1003 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 249:
#line 1004 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 250:
#line 1005 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 251:
#line 1006 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 252:
#line 1007 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 253:
#line 1008 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 254:
#line 1009 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 255:
#line 1010 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 256:
#line 1011 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 257:
#line 1012 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 258:
#line 1013 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 259:
#line 1014 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 260:
#line 1015 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 261:
#line 1016 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 262:
#line 1017 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 263:
#line 1018 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 264:
#line 1019 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 265:
#line 1023 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 266:
#line 1024 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 267:
#line 1025 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 268:
#line 1026 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 269:
#line 1027 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 270:
#line 1028 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 271:
#line 1029 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 272:
#line 1030 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 273:
#line 1031 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 274:
#line 1032 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 275:
#line 1033 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 276:
#line 1034 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 277:
#line 1035 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 278:
#line 1036 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3146 "pirparser.c"
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


#line 1038 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


