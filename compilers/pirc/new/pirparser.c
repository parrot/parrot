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
#define YYLAST   541

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  117
/* YYNRULES -- Number of rules.  */
#define YYNRULES  281
/* YYNRULES -- Number of states.  */
#define YYNSTATES  422

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
     106,   107,   115,   113,   102,   110,   109,   114,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   105,
       2,   108,     2,     2,     2,     2,     2,     2,     2,     2,
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
      22,    24,    26,    28,    30,    34,    37,    42,    47,    50,
      51,    55,    57,    61,    62,    63,    73,    75,    77,    78,
      81,    83,    85,    87,    89,    91,    93,    95,    97,    99,
     104,   107,   110,   112,   114,   116,   118,   119,   122,   127,
     130,   135,   136,   137,   141,   144,   147,   149,   151,   153,
     155,   157,   159,   161,   163,   165,   167,   169,   171,   173,
     175,   178,   182,   187,   191,   194,   198,   201,   205,   208,
     211,   213,   217,   220,   222,   223,   227,   228,   230,   233,
     235,   236,   240,   242,   244,   248,   250,   254,   260,   266,
     268,   270,   273,   276,   278,   280,   282,   286,   290,   295,
     297,   301,   304,   305,   307,   313,   315,   317,   326,   327,
     329,   331,   334,   338,   342,   345,   351,   352,   355,   356,
     358,   360,   363,   367,   369,   374,   379,   382,   384,   386,
     391,   394,   396,   398,   400,   402,   404,   406,   408,   410,
     412,   414,   418,   419,   421,   423,   427,   430,   431,   434,
     436,   438,   440,   442,   445,   446,   449,   451,   453,   458,
     460,   462,   464,   466,   470,   474,   478,   482,   483,   485,
     487,   491,   493,   495,   499,   502,   508,   514,   515,   517,
     519,   522,   526,   527,   529,   531,   534,   538,   539,   542,
     544,   547,   548,   550,   554,   557,   560,   564,   569,   574,
     579,   584,   586,   588,   590,   592,   594,   596,   598,   600,
     602,   604,   606,   608,   610,   612,   614,   616,   618,   620,
     622,   624,   626,   628,   630,   632,   634,   636,   638,   640,
     642,   644,   646,   648,   650,   652,   654,   656,   658,   660,
     662,   664,   666,   668,   670,   672,   674,   676,   678,   680,
     682,   684,   686,   688,   690,   692,   694,   696,   698,   700,
     702,   704,   706,   708,   710,   712,   714,   716,   718,   720,
     722,   724
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     121,     0,    -1,   122,   123,   122,    -1,    -1,     4,    -1,
     124,    -1,   123,     4,   124,    -1,   132,    -1,   222,    -1,
     129,    -1,   127,    -1,   128,    -1,   126,    -1,   125,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,   102,
      34,    -1,     6,    34,   102,    34,    -1,    15,   130,    -1,
      -1,   103,   131,   104,    -1,    34,    -1,   131,   105,    34,
      -1,    -1,    -1,    10,   135,   133,   136,     4,   134,   139,
     142,    11,    -1,   233,    -1,    34,    -1,    -1,   136,   137,
      -1,    86,    -1,    83,    -1,    84,    -1,    85,    -1,    87,
      -1,    90,    -1,    92,    -1,    93,    -1,    91,    -1,    88,
     106,   135,   107,    -1,    89,   220,    -1,    94,   221,    -1,
     233,    -1,    34,    -1,   160,    -1,   229,    -1,    -1,   139,
     140,    -1,    12,   141,   197,     4,    -1,   229,   233,    -1,
     229,    34,    54,   233,    -1,    -1,    -1,   142,   143,   144,
      -1,     3,     4,    -1,     3,   145,    -1,   145,    -1,   162,
      -1,   167,    -1,   168,    -1,   172,    -1,   223,    -1,   200,
      -1,   201,    -1,   173,    -1,   150,    -1,   149,    -1,   148,
      -1,   147,    -1,   146,    -1,     1,     4,    -1,    52,   230,
       4,    -1,   230,   108,    52,     4,    -1,    28,   191,     4,
      -1,   153,     4,    -1,   230,   151,     4,    -1,   236,   226,
      -1,   160,   108,   226,    -1,   108,   152,    -1,   234,   226,
      -1,   225,    -1,   226,   235,   226,    -1,   230,   160,    -1,
     153,    -1,    -1,    45,   154,   155,    -1,    -1,   156,    -1,
     157,   158,    -1,   226,    -1,    -1,   158,   102,   159,    -1,
     226,    -1,   160,    -1,   103,   161,   104,    -1,   226,    -1,
     161,   105,   226,    -1,   163,   166,   165,   233,     4,    -1,
     164,   226,   165,   233,     4,    -1,    50,    -1,    51,    -1,
      50,    52,    -1,    51,    52,    -1,    53,    -1,   102,    -1,
     226,    -1,   226,   228,   226,    -1,    53,   233,     4,    -1,
      14,   229,   169,     4,    -1,   170,    -1,   169,   102,   170,
      -1,   233,   171,    -1,    -1,    95,    -1,    13,    34,   102,
     230,     4,    -1,   174,    -1,   183,    -1,    26,     4,   175,
     178,     4,   180,    27,     4,    -1,    -1,   176,    -1,   177,
      -1,   176,   177,    -1,    30,   209,     4,    -1,    29,   189,
     179,    -1,    32,   189,    -1,    16,   189,     4,    17,   188,
      -1,    -1,   102,   189,    -1,    -1,   181,    -1,   182,    -1,
     181,   182,    -1,    31,   194,     4,    -1,   168,    -1,   191,
     108,   184,     4,    -1,   230,   108,   184,     4,    -1,   184,
       4,    -1,   186,    -1,   185,    -1,   189,   109,   188,   204,
      -1,   187,   204,    -1,   189,    -1,    34,    -1,   189,    -1,
     190,    -1,   233,    -1,    41,    -1,    37,    -1,    34,    -1,
      43,    -1,    39,    -1,   106,   192,   107,    -1,    -1,   193,
      -1,   194,    -1,   193,   102,   194,    -1,   230,   195,    -1,
      -1,   195,   196,    -1,    99,    -1,   100,    -1,    97,    -1,
      95,    -1,    96,   220,    -1,    -1,   197,   198,    -1,   196,
      -1,   199,    -1,   101,   106,   138,   107,    -1,   202,    -1,
     210,    -1,   203,    -1,   211,    -1,    20,   204,     4,    -1,
      20,   184,     4,    -1,    21,   204,     4,    -1,   106,   205,
     107,    -1,    -1,   206,    -1,   207,    -1,   206,   102,   207,
      -1,   209,    -1,   208,    -1,    34,    54,   226,    -1,   226,
     218,    -1,    24,     4,   215,    25,     4,    -1,    22,     4,
     212,    23,     4,    -1,    -1,   213,    -1,   214,    -1,   213,
     214,    -1,    21,   209,     4,    -1,    -1,   216,    -1,   217,
      -1,   216,   217,    -1,    20,   209,     4,    -1,    -1,   218,
     219,    -1,    98,    -1,    96,   220,    -1,    -1,   221,    -1,
     106,    34,   107,    -1,    19,   224,    -1,   222,     4,    -1,
      18,   224,     4,    -1,    46,   233,   108,    35,    -1,    47,
     233,   108,    36,    -1,    48,   233,   108,    34,    -1,    49,
     233,   108,    34,    -1,   227,    -1,   231,    -1,    33,    -1,
     230,    -1,   227,    -1,    34,    -1,    35,    -1,    36,    -1,
      55,    -1,    56,    -1,    57,    -1,    58,    -1,    60,    -1,
      59,    -1,    46,    -1,    47,    -1,    48,    -1,    49,    -1,
     231,    -1,   233,    -1,    41,    -1,    42,    -1,    44,    -1,
      43,    -1,   232,    -1,    37,    -1,    38,    -1,    40,    -1,
      39,    -1,    33,    -1,    45,    -1,   110,    -1,   111,    -1,
     112,    -1,   113,    -1,   110,    -1,   114,    -1,   115,    -1,
     116,    -1,   117,    -1,   118,    -1,   112,    -1,   119,    -1,
      68,    -1,    61,    -1,    62,    -1,    63,    -1,    65,    -1,
      66,    -1,    64,    -1,    67,    -1,    56,    -1,    58,    -1,
      57,    -1,    60,    -1,    59,    -1,    55,    -1,    72,    -1,
      73,    -1,    74,    -1,    75,    -1,    76,    -1,    77,    -1,
      80,    -1,    78,    -1,    79,    -1,    81,    -1,    82,    -1,
      70,    -1,    71,    -1,    69,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   337,   337,   342,   343,   346,   347,   350,   351,   352,
     353,   354,   355,   356,   359,   363,   369,   373,   380,   384,
     385,   389,   391,   398,   399,   398,   405,   406,   410,   411,
     415,   417,   419,   421,   423,   425,   427,   429,   431,   433,
     435,   437,   442,   443,   444,   445,   448,   449,   452,   458,
     460,   467,   468,   468,   473,   475,   477,   480,   481,   482,
     483,   484,   485,   486,   487,   488,   489,   490,   491,   492,
     495,   504,   508,   514,   520,   523,   548,   550,   552,   556,
     558,   560,   562,   564,   569,   569,   573,   574,   577,   581,
     587,   588,   592,   593,   596,   600,   602,   606,   613,   620,
     621,   625,   627,   631,   632,   636,   640,   648,   654,   658,
     660,   664,   668,   669,   674,   681,   682,   685,   698,   699,
     703,   705,   709,   713,   715,   717,   723,   724,   731,   732,
     736,   738,   742,   744,   748,   750,   752,   757,   758,   761,
     768,   774,   776,   780,   781,   784,   786,   788,   792,   794,
     796,   801,   806,   807,   811,   813,   817,   826,   827,   831,
     833,   835,   837,   839,   846,   847,   851,   852,   855,   862,
     863,   866,   867,   870,   874,   878,   884,   889,   890,   894,
     896,   900,   901,   904,   910,   918,   926,   935,   936,   941,
     943,   948,   953,   954,   958,   960,   964,   970,   971,   975,
     977,   984,   985,   989,   993,   997,   998,  1002,  1004,  1006,
    1008,  1018,  1019,  1020,  1023,  1024,  1027,  1028,  1029,  1032,
    1033,  1034,  1035,  1036,  1037,  1040,  1041,  1042,  1043,  1046,
    1047,  1050,  1051,  1052,  1053,  1054,  1057,  1058,  1059,  1060,
    1063,  1064,  1067,  1068,  1069,  1072,  1073,  1074,  1075,  1076,
    1077,  1078,  1079,  1080,  1081,  1082,  1083,  1084,  1085,  1086,
    1087,  1088,  1089,  1090,  1091,  1092,  1093,  1094,  1098,  1099,
    1100,  1101,  1102,  1103,  1104,  1105,  1106,  1107,  1108,  1109,
    1110,  1111
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
  "\":opt_flag\"", "\":invocant\"", "','", "'['", "']'", "';'", "'('",
  "')'", "'='", "'.'", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'",
  "'|'", "'&'", "\"**\"", "$accept", "TOP", "opt_nl", "pir_chunks",
  "pir_chunk", "pir_pragma", "loadlib", "hll_specifier", "hll_mapping",
  "namespace_decl", "opt_namespace_id", "namespace_id", "sub_def", "@1",
  "@2", "sub_id", "sub_flags", "sub_flag", "multi_type", "parameters",
  "parameter", "param_def", "instructions", "@3", "instruction",
  "statement", "error_stat", "null_stat", "getresults_stat", "parrot_stat",
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
     355,   356,    44,    91,    93,    59,    40,    41,    61,    46,
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
     141,   142,   143,   142,   144,   144,   144,   145,   145,   145,
     145,   145,   145,   145,   145,   145,   145,   145,   145,   145,
     146,   147,   147,   148,   149,   150,   151,   151,   151,   152,
     152,   152,   152,   152,   154,   153,   155,   155,   156,   157,
     158,   158,   159,   159,   160,   161,   161,   162,   162,   163,
     163,   164,   164,   165,   165,   166,   166,   167,   168,   169,
     169,   170,   171,   171,   172,   173,   173,   174,   175,   175,
     176,   176,   177,   178,   178,   178,   179,   179,   180,   180,
     181,   181,   182,   182,   183,   183,   183,   184,   184,   185,
     186,   187,   187,   188,   188,   189,   189,   189,   190,   190,
     190,   191,   192,   192,   193,   193,   194,   195,   195,   196,
     196,   196,   196,   196,   197,   197,   198,   198,   199,   200,
     200,   201,   201,   202,   202,   203,   204,   205,   205,   206,
     206,   207,   207,   208,   209,   210,   211,   212,   212,   213,
     213,   214,   215,   215,   216,   216,   217,   218,   218,   219,
     219,   220,   220,   221,   222,   223,   223,   224,   224,   224,
     224,   225,   225,   225,   226,   226,   227,   227,   227,   228,
     228,   228,   228,   228,   228,   229,   229,   229,   229,   230,
     230,   231,   231,   231,   231,   231,   232,   232,   232,   232,
     233,   233,   234,   234,   234,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   236,   236,
     236,   236,   236,   236,   236,   236,   236,   236,   236,   236,
     236,   236
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     3,     2,     4,     4,     2,     0,
       3,     1,     3,     0,     0,     9,     1,     1,     0,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       2,     2,     1,     1,     1,     1,     0,     2,     4,     2,
       4,     0,     0,     3,     2,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       2,     3,     4,     3,     2,     3,     2,     3,     2,     2,
       1,     3,     2,     1,     0,     3,     0,     1,     2,     1,
       0,     3,     1,     1,     3,     1,     3,     5,     5,     1,
       1,     2,     2,     1,     1,     1,     3,     3,     4,     1,
       3,     2,     0,     1,     5,     1,     1,     8,     0,     1,
       1,     2,     3,     3,     2,     5,     0,     2,     0,     1,
       1,     2,     3,     1,     4,     4,     2,     1,     1,     4,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     0,     1,     1,     3,     2,     0,     2,     1,
       1,     1,     1,     2,     0,     2,     1,     1,     4,     1,
       1,     1,     1,     3,     3,     3,     3,     0,     1,     1,
       3,     1,     1,     3,     2,     5,     5,     0,     1,     1,
       2,     3,     0,     1,     1,     2,     3,     0,     2,     1,
       2,     0,     1,     3,     2,     2,     3,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
      19,     0,     3,     5,    13,    12,    10,    11,     9,     7,
       8,     0,     0,     0,    15,   240,    27,   241,    23,    26,
       0,    18,     0,     0,     0,     0,   204,     4,     2,     0,
       0,    14,    28,    21,     0,     0,     0,     0,     0,     6,
      16,    17,     0,    20,     0,     0,     0,     0,     0,    24,
      31,    32,    33,    30,    34,     0,   201,    35,    38,    36,
      37,     0,    29,    22,   207,   208,   209,   210,    46,     0,
       0,    40,   202,    41,    51,     0,     0,     0,    47,    52,
      39,   203,   225,   226,   227,   228,   164,     0,    25,     0,
       0,     0,    49,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   142,   236,   237,   239,   238,   231,
     232,   234,   233,   241,    99,   100,     0,     0,   152,    53,
      56,    69,    68,    67,    66,    65,     0,    57,     0,     0,
      58,    59,    60,    64,   115,   116,     0,   138,   137,     0,
     141,     0,    62,    63,   169,   171,   170,   172,     0,    61,
       0,   229,   235,   230,    48,   162,   201,   161,   159,   160,
       0,   166,   165,   167,     0,    70,    54,    55,     0,     0,
       0,   147,   146,   177,     0,     0,   145,     0,   187,   192,
     118,     0,    86,   101,   102,   236,   231,     0,   230,     0,
       0,   153,   154,   157,    74,   216,   217,   218,     0,   105,
     215,   214,     0,   136,   140,     0,     0,   205,   281,   279,
     280,   268,   269,   270,   271,   272,   273,   275,   276,   274,
     277,   278,     0,     0,     0,     0,     0,   163,     0,    50,
       0,     0,   109,   112,   206,   216,     0,   178,   179,   182,
     181,   197,   174,   173,   175,     0,     0,   188,   189,     0,
       0,   193,   194,     0,     0,   119,   120,    73,    85,    87,
      90,    89,    71,   107,   151,     0,   156,   103,   104,     0,
     219,   220,   221,   222,   224,   223,     0,     0,   148,   150,
     149,     0,   143,   144,     0,     0,    95,   240,   216,     0,
     242,   243,   244,    78,    83,     0,    80,     0,   215,   214,
     229,     0,    75,     0,    76,    43,     0,    44,    45,    42,
       0,   108,     0,   113,   111,     0,   176,     0,   184,     0,
       0,   190,     0,     0,   195,     0,     0,     0,     0,     0,
     121,    88,   155,   158,     0,   106,     0,   139,   134,    94,
       0,    72,   135,   267,   262,   264,   263,   266,   265,   255,
     256,   257,   260,   258,   259,   261,   254,   246,   252,   245,
     247,   248,   249,   250,   251,   253,     0,    82,    79,    77,
     168,   114,   110,   183,   180,   201,   199,   198,   191,   186,
     196,   185,   122,     0,   126,   124,   128,     0,    97,    98,
      96,    81,   200,     0,     0,   123,     0,   133,     0,   129,
     130,    91,    93,    92,     0,   127,     0,     0,   131,   125,
     132,   117
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      31,    44,    19,    42,    78,    28,    52,    72,   316,    84,
      88,    96,    89,    99,   129,   130,   131,   132,   133,   134,
     135,   234,   303,   136,   192,   268,   269,   270,   341,   411,
     235,   295,   137,   138,   139,   279,   208,   140,   141,   241,
     242,   324,   142,   143,   144,   264,   265,   266,   339,   405,
     408,   409,   410,   145,   146,   147,   148,   149,   291,   150,
     293,   151,   200,   201,   202,   276,   171,   100,   172,   173,
     152,   153,   154,   155,   185,   246,   247,   248,   249,   250,
     156,   157,   256,   257,   258,   260,   261,   262,   328,   387,
      81,    82,    20,   159,    36,   306,   251,   210,   286,    97,
     211,   161,   162,   198,   311,   376,   236
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -370
static const yytype_int16 yypact[] =
{
      34,  -370,    66,    36,  -370,    43,    50,    80,    60,   -16,
      -7,   125,    96,  -370,  -370,  -370,  -370,  -370,  -370,  -370,
    -370,     0,    13,    82,  -370,  -370,  -370,  -370,  -370,  -370,
      88,  -370,     3,     3,     3,     3,  -370,    36,  -370,    89,
      91,  -370,  -370,  -370,   -46,    28,    29,    31,    32,  -370,
    -370,  -370,    69,  -370,   113,   115,   128,   132,   134,  -370,
    -370,  -370,  -370,  -370,  -370,    63,    85,  -370,  -370,  -370,
    -370,    85,  -370,  -370,  -370,  -370,  -370,  -370,  -370,   -16,
     154,  -370,  -370,  -370,   180,    86,    92,   149,  -370,   189,
    -370,  -370,  -370,  -370,  -370,  -370,  -370,    58,  -370,   247,
      10,   147,  -370,   198,   317,   169,   149,   125,    -2,    99,
     204,   205,   206,   105,  -370,   -87,  -370,  -370,  -370,   -53,
    -370,  -370,  -370,   418,   160,   161,   142,     3,   142,  -370,
    -370,  -370,  -370,  -370,  -370,  -370,   210,  -370,   470,   470,
    -370,  -370,  -370,  -370,  -370,  -370,   212,  -370,  -370,    99,
     108,   110,  -370,  -370,  -370,  -370,  -370,  -370,   215,  -370,
     420,  -370,  -370,   -23,  -370,  -370,    85,  -370,  -370,  -370,
     114,  -370,  -370,  -370,     3,  -370,  -370,  -370,   120,     3,
     219,  -370,  -370,   496,   221,   222,  -370,   223,   207,   211,
     200,   228,   470,  -370,  -370,  -370,  -370,   229,  -370,   230,
     129,   133,  -370,  -370,  -370,  -370,  -370,  -370,   -42,    74,
    -370,  -370,   -42,  -370,  -370,    35,    48,  -370,  -370,  -370,
    -370,  -370,  -370,  -370,  -370,  -370,  -370,  -370,  -370,  -370,
    -370,  -370,   470,   338,   233,   130,   470,  -370,    16,  -370,
     142,     6,  -370,   144,  -370,   186,   135,   141,  -370,  -370,
    -370,  -370,  -370,  -370,  -370,   470,   224,   207,  -370,   470,
     220,   211,  -370,   470,     5,   200,  -370,  -370,  -370,  -370,
    -370,  -370,  -370,  -370,  -370,   142,    49,  -370,  -370,     3,
    -370,  -370,  -370,  -370,  -370,  -370,   470,     3,  -370,  -370,
    -370,    99,  -370,  -370,   240,     9,  -370,   242,   143,   248,
    -370,  -370,  -370,  -370,  -370,   249,  -370,   369,   250,   148,
     251,   470,  -370,   470,  -370,  -370,   150,  -370,  -370,  -370,
     252,  -370,     3,  -370,  -370,   470,  -370,   496,   -44,   254,
     255,  -370,   259,   260,  -370,   268,    79,    79,    79,   270,
    -370,   174,  -370,  -370,   273,  -370,   275,  -370,  -370,  -370,
     470,  -370,  -370,  -370,  -370,  -370,  -370,  -370,  -370,  -370,
    -370,  -370,  -370,  -370,  -370,  -370,  -370,  -370,  -370,  -370,
    -370,  -370,  -370,  -370,  -370,  -370,   470,  -370,  -370,  -370,
    -370,  -370,  -370,  -370,  -370,    85,  -370,  -370,  -370,  -370,
    -370,  -370,  -370,   278,   181,  -370,     2,   373,  -370,  -370,
    -370,  -370,  -370,   276,    79,  -370,   142,  -370,   267,     2,
    -370,  -370,  -370,  -370,    35,  -370,   291,   292,  -370,  -370,
    -370,  -370
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -370,  -370,   289,  -370,   265,  -370,  -370,  -370,  -370,  -370,
    -370,  -370,  -370,  -370,  -370,   225,  -370,  -370,  -370,  -370,
    -370,  -370,  -370,  -370,  -370,   199,  -370,  -370,  -370,  -370,
    -370,  -370,  -370,    72,  -370,  -370,  -370,  -370,  -370,  -370,
    -230,  -370,  -370,  -370,  -370,    94,  -370,  -370,  -369,  -370,
     -15,  -370,  -370,  -370,  -370,  -370,  -370,    44,  -370,  -370,
    -370,  -370,   -99,  -370,   -95,  -370,  -370,  -370,  -103,  -210,
    -370,   201,  -370,  -370,  -263,  -370,    39,  -370,  -370,  -370,
    -370,  -370,  -370,  -370,  -102,  -370,  -370,   -11,  -370,  -188,
    -370,  -370,  -370,  -370,    55,  -370,  -370,    56,  -370,  -370,
    -164,   253,   -84,  -370,   213,  -370,  -135,    90,  -370,   -97,
     -98,    93,  -370,    -9,  -370,  -370,  -370
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -214
static const yytype_int16 yytable[] =
{
      29,   160,   237,   209,   212,   292,   160,   187,   317,   179,
     321,   277,   342,   184,   164,   158,   106,    25,    26,  -147,
     158,   336,  -147,    45,    46,    47,    48,   407,   197,    27,
     203,    25,   114,   406,   337,   181,    25,   338,     1,   182,
     407,     5,     6,    27,     7,     8,     9,   214,    27,    25,
     315,    10,   385,  -146,   386,    11,  -146,   271,    53,    54,
     278,    27,    92,    93,    94,    95,     4,   329,    25,   288,
      29,   332,   181,    59,   289,   335,   182,    21,   290,   377,
      27,    25,   114,  -145,    22,   181,  -145,    23,   102,   182,
     163,    25,   101,    27,    24,   163,    30,   296,   307,   186,
      37,   314,    39,    27,   183,   165,   166,   167,   322,   168,
     169,   170,    25,   349,   350,    40,   181,    41,   199,   232,
     182,   294,    43,    50,    27,    51,   393,   394,   395,   280,
     281,   282,   283,   284,   285,   309,    55,    56,   305,    57,
      58,   318,   320,   416,   165,   166,   167,    73,   168,   169,
      74,   345,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    75,   239,    76,   412,    77,    79,
     243,    32,    33,    34,    35,    25,   378,   203,   379,   195,
     116,   117,   118,   196,   120,   121,   122,    27,    86,   347,
     383,    80,    87,    90,   415,    92,    93,    94,    95,    91,
      98,   174,   175,   178,   292,   183,   186,   186,   188,   189,
     190,   128,   193,   194,   204,   400,   213,   215,   216,   217,
     238,   402,   240,   244,   163,   252,   253,   254,   255,   319,
     263,   259,   267,   272,   273,   275,   274,   312,   313,   323,
     325,   401,   326,   327,   348,   333,  -213,   330,   103,  -142,
     104,   232,   351,   352,  -211,  -212,   381,   380,   388,   389,
     105,   106,   413,   390,   391,   107,    11,   108,   109,   110,
     344,   111,   392,   112,   396,   113,   397,   398,   346,   399,
      25,   114,   403,   404,   115,   116,   117,   118,   119,   120,
     121,   122,   123,   414,   417,   420,   421,   124,   125,   126,
     127,    38,    49,   177,    85,   304,   287,   382,   203,   340,
     418,   419,   331,   243,   191,   343,   384,   334,   103,     0,
     180,   176,     0,   308,    83,     0,   310,   186,   186,   186,
     105,   106,     0,     0,     0,   107,    11,   108,   109,   110,
       0,   111,     0,   112,     0,   113,     0,     0,     0,     0,
      25,   114,     0,   128,   115,   116,   117,   118,   119,   120,
     121,   122,   123,     0,     0,     0,     0,   124,   125,   126,
     127,   297,   298,   206,   207,   115,   116,   117,   118,   119,
     120,   121,   122,   123,     0,     0,     0,     0,     0,     0,
     299,     0,     0,     0,     0,   186,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   186,    25,   205,   206,   207,
     195,   116,   117,   118,   196,   120,   121,   122,    27,     0,
       0,     0,   -84,   128,   353,   354,   355,   356,   357,   358,
     359,   360,   361,   362,   363,   364,   365,   366,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   300,   301,
     302,   -84,   -84,   -84,   -84,   -84,   -84,   -84,   -84,   -84,
     -84,   -84,   -84,   -84,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   232,     0,     0,   367,
       0,   368,   369,   370,   371,   372,   373,   374,   375,   218,
     219,   220,   221,   222,   223,   224,   225,   226,   227,   228,
     229,   230,   231,    25,   205,   206,   207,   195,   116,   117,
     118,   196,   120,   121,   122,    27,     0,     0,     0,     0,
       0,     0,     0,   232,     0,     0,     0,     0,   233,    25,
     245,   206,   207,   195,   116,   117,   118,   196,   120,   121,
     122,    27
};

static const yytype_int16 yycheck[] =
{
       9,    99,   166,   138,   139,   215,   104,   109,   238,   106,
       4,    53,   275,   108,     4,    99,    14,    33,    34,   106,
     104,    16,   109,    32,    33,    34,    35,   396,   126,    45,
     128,    33,    34,    31,    29,    37,    33,    32,     4,    41,
     409,     5,     6,    45,     8,     9,    10,   149,    45,    33,
      34,    15,    96,   106,    98,    19,   109,   192,   104,   105,
     102,    45,    46,    47,    48,    49,     0,   255,    33,    34,
      79,   259,    37,     4,    39,   263,    41,    34,    43,   309,
      45,    33,    34,   106,    34,    37,   109,     7,    97,    41,
      99,    33,    34,    45,    34,   104,   103,   232,   233,   108,
       4,   236,   102,    45,   106,    95,    96,    97,   102,    99,
     100,   101,    33,   104,   105,   102,    37,    35,   127,   103,
      41,   216,    34,    34,    45,    34,   336,   337,   338,    55,
      56,    57,    58,    59,    60,   233,   108,   108,   233,   108,
     108,   238,   240,   406,    95,    96,    97,    34,    99,   100,
      35,   286,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    36,   174,    34,   397,    34,   106,
     179,    46,    47,    48,    49,    33,   311,   275,   313,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    34,   291,
     325,   106,    12,   107,   404,    46,    47,    48,    49,   107,
      11,    54,     4,    34,   414,   106,   215,   216,     4,     4,
       4,   106,    52,    52,     4,   350,     4,   109,   108,     4,
     106,   385,   102,     4,   233,     4,     4,     4,    21,   238,
      30,    20,     4,     4,     4,   102,   107,     4,   108,    95,
      54,   376,   107,   102,     4,    25,     4,    23,     1,   106,
       3,   103,     4,     4,     4,     4,     4,   107,     4,     4,
      13,    14,   397,     4,     4,    18,    19,    20,    21,    22,
     279,    24,     4,    26,     4,    28,   102,     4,   287,     4,
      33,    34,     4,   102,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    17,    27,     4,     4,    50,    51,    52,
      53,    12,    37,   104,    79,   233,   212,   322,   406,   265,
     409,   414,   257,   322,   113,   276,   327,   261,     1,    -1,
     107,     4,    -1,   233,    71,    -1,   233,   336,   337,   338,
      13,    14,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      -1,    24,    -1,    26,    -1,    28,    -1,    -1,    -1,    -1,
      33,    34,    -1,   106,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    -1,    -1,    -1,    -1,    50,    51,    52,
      53,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    -1,    -1,    -1,    -1,    -1,    -1,
      52,    -1,    -1,    -1,    -1,   404,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   414,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    -1,
      -1,    -1,     4,   106,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,    -1,    -1,   110,
      -1,   112,   113,   114,   115,   116,   117,   118,   119,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,    -1,    -1,    -1,    -1,   108,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     8,     9,    10,
      15,    19,   123,   124,   125,   126,   127,   128,   129,   132,
     222,    34,    34,     7,    34,    33,    34,    45,   135,   233,
     103,   130,    46,    47,    48,    49,   224,     4,   122,   102,
     102,    35,   133,    34,   131,   233,   233,   233,   233,   124,
      34,    34,   136,   104,   105,   108,   108,   108,   108,     4,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,   137,    34,    35,    36,    34,    34,   134,   106,
     106,   220,   221,   221,   139,   135,    34,    12,   140,   142,
     107,   107,    46,    47,    48,    49,   141,   229,    11,   143,
     197,    34,   233,     1,     3,    13,    14,    18,    20,    21,
      22,    24,    26,    28,    34,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    50,    51,    52,    53,   106,   144,
     145,   146,   147,   148,   149,   150,   153,   162,   163,   164,
     167,   168,   172,   173,   174,   183,   184,   185,   186,   187,
     189,   191,   200,   201,   202,   203,   210,   211,   222,   223,
     230,   231,   232,   233,     4,    95,    96,    97,    99,   100,
     101,   196,   198,   199,    54,     4,     4,   145,    34,   229,
     224,    37,    41,   106,   184,   204,   233,   204,     4,     4,
       4,   191,   154,    52,    52,    37,    41,   230,   233,   233,
     192,   193,   194,   230,     4,    34,    35,    36,   166,   226,
     227,   230,   226,     4,   204,   109,   108,     4,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,   103,   108,   151,   160,   236,   220,   106,   233,
     102,   169,   170,   233,     4,    34,   205,   206,   207,   208,
     209,   226,     4,     4,     4,    21,   212,   213,   214,    20,
     215,   216,   217,    30,   175,   176,   177,     4,   155,   156,
     157,   226,     4,     4,   107,   102,   195,    53,   102,   165,
      55,    56,    57,    58,    59,    60,   228,   165,    34,    39,
      43,   188,   189,   190,   184,   161,   226,    33,    34,    52,
     110,   111,   112,   152,   153,   184,   225,   226,   227,   230,
     231,   234,     4,   108,   226,    34,   138,   160,   229,   233,
     230,     4,   102,    95,   171,    54,   107,   102,   218,   209,
      23,   214,   209,    25,   217,   209,    16,    29,    32,   178,
     177,   158,   194,   196,   233,   226,   233,   204,     4,   104,
     105,     4,     4,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,   110,   112,   113,
     114,   115,   116,   117,   118,   119,   235,   160,   226,   226,
     107,     4,   170,   226,   207,    96,    98,   219,     4,     4,
       4,     4,     4,   189,   189,   189,     4,   102,     4,     4,
     226,   226,   220,     4,   102,   179,    31,   168,   180,   181,
     182,   159,   160,   226,    17,   189,   194,    27,   182,   188,
       4,     4
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
#line 360 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 364 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 370 "pir.y"
    { set_hll((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 17:
#line 374 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 384 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 386 "pir.y"
    { (yyval.fixme) = (yyvsp[(2) - (3)].fixme); ;}
    break;

  case 21:
#line 390 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 22:
#line 392 "pir.y"
    { ;}
    break;

  case 23:
#line 398 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 24:
#line 399 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(4) - (5)].ival)); ;}
    break;

  case 28:
#line 410 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 29:
#line 412 "pir.y"
    { (yyval.ival) |= (yyvsp[(2) - (2)].ival); ;}
    break;

  case 30:
#line 416 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 31:
#line 418 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 32:
#line 420 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 33:
#line 422 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 34:
#line 424 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 35:
#line 426 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 36:
#line 428 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 37:
#line 430 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 38:
#line 432 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 39:
#line 434 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;  set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 40:
#line 436 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE; set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 41:
#line 438 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEXID; /* do something with this */ ;}
    break;

  case 48:
#line 453 "pir.y"
    { set_param_flag((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                          IF_NAMED_PARAM_SET_ALIAS((yyvsp[(2) - (4)].targ), (yyvsp[(3) - (4)].ival));
                        ;}
    break;

  case 49:
#line 459 "pir.y"
    { (yyval.targ) = add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 50:
#line 461 "pir.y"
    { (yyval.targ) = add_param_named(lexer, (yyvsp[(1) - (4)].ival), (yyvsp[(4) - (4)].sval), (yyvsp[(2) - (4)].sval)); ;}
    break;

  case 52:
#line 468 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 54:
#line 474 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 55:
#line 476 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 70:
#line 496 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                              fprintf(stderr, "Too many errors. Compilation aborted.\n");
                              exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                          }
                          yyerrok;
                        ;}
    break;

  case 71:
#line 505 "pir.y"
    { set_instr(lexer, "null");
                          add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                        ;}
    break;

  case 72:
#line 509 "pir.y"
    { set_instr(lexer, "null");
                          add_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                        ;}
    break;

  case 73:
#line 515 "pir.y"
    { set_instr(lexer, "get_results");
                          add_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                        ;}
    break;

  case 75:
#line 524 "pir.y"
    { add_first_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 76:
#line 549 "pir.y"
    { assign(lexer, RHS_AUGMENT, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 77:
#line 551 "pir.y"
    { assign(lexer, RHS_SETKEYED, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 78:
#line 553 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 79:
#line 557 "pir.y"
    { assign(lexer, RHS_UNOP, (yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 80:
#line 559 "pir.y"
    { assign(lexer, RHS_SIMPLE, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 81:
#line 561 "pir.y"
    { assign(lexer, RHS_BINOP, (yyvsp[(2) - (3)].sval), (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 82:
#line 563 "pir.y"
    { assign(lexer, RHS_GETKEYED, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 83:
#line 565 "pir.y"
    { /* nothing to do */ ;}
    break;

  case 84:
#line 569 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 89:
#line 582 "pir.y"
    { add_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 90:
#line 587 "pir.y"
    { /* nothing to do */;}
    break;

  case 91:
#line 589 "pir.y"
    { add_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 94:
#line 597 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 95:
#line 601 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 96:
#line 603 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 97:
#line 607 "pir.y"
    { /* it was "unless", so "invert" the opcode */
                           if ((yyvsp[(1) - (5)].ival) > 0) {
                              invert_instr(lexer);
                           }
                           add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                         ;}
    break;

  case 98:
#line 614 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (5)].sval));
                           add_operand(lexer, (yyvsp[(2) - (5)].expr));
                           add_operand(lexer, expr_from_ident((yyvsp[(4) - (5)].sval)));
                         ;}
    break;

  case 99:
#line 620 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 100:
#line 621 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 101:
#line 626 "pir.y"
    { (yyval.sval) = "if_null"; ;}
    break;

  case 102:
#line 628 "pir.y"
    { (yyval.sval) = "unless_null"; ;}
    break;

  case 105:
#line 637 "pir.y"
    { set_instr(lexer, "if");
                           add_operand(lexer, (yyvsp[(1) - (1)].expr));
                         ;}
    break;

  case 106:
#line 641 "pir.y"
    { set_instr(lexer, (yyvsp[(2) - (3)].sval));
                           add_operand(lexer, (yyvsp[(1) - (3)].expr));
                           add_operand(lexer, (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 107:
#line 649 "pir.y"
    { set_instr(lexer, "branch");
                           add_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 108:
#line 655 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 109:
#line 659 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 110:
#line 661 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 111:
#line 665 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 112:
#line 668 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 113:
#line 669 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 114:
#line 675 "pir.y"
    { set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval)); ;}
    break;

  case 117:
#line 690 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                             (yyval.fixme) = NULL;
                           ;}
    break;

  case 118:
#line 698 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 119:
#line 700 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 120:
#line 704 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 121:
#line 706 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 122:
#line 710 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 123:
#line 714 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 124:
#line 716 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 125:
#line 719 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 126:
#line 723 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 127:
#line 725 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 128:
#line 731 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 129:
#line 733 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 130:
#line 737 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 131:
#line 739 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 132:
#line 743 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 133:
#line 745 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 134:
#line 749 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 135:
#line 751 "pir.y"
    { set_invocation_results((yyvsp[(3) - (4)].invo), (yyvsp[(1) - (4)].targ)); ;}
    break;

  case 136:
#line 753 "pir.y"
    { set_invocation_results((yyvsp[(1) - (2)].invo), NULL); ;}
    break;

  case 139:
#line 762 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 140:
#line 769 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 141:
#line 775 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 142:
#line 777 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 145:
#line 785 "pir.y"
    { (yyval.targ) = target_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 146:
#line 787 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 147:
#line 789 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 148:
#line 793 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 149:
#line 795 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 150:
#line 797 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 151:
#line 802 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 152:
#line 806 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 153:
#line 808 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 154:
#line 812 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 155:
#line 814 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 156:
#line 818 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 157:
#line 826 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 158:
#line 828 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 159:
#line 832 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 160:
#line 834 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 161:
#line 836 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 162:
#line 838 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 163:
#line 840 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 164:
#line 846 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 165:
#line 848 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 168:
#line 856 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 173:
#line 871 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 174:
#line 875 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 175:
#line 879 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 176:
#line 885 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 177:
#line 889 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 178:
#line 891 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 179:
#line 895 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 180:
#line 897 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 183:
#line 905 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(3) - (3)].expr));
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 184:
#line 911 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (2)].expr));
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 185:
#line 921 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 186:
#line 929 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 187:
#line 935 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 188:
#line 937 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 189:
#line 942 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 190:
#line 944 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 191:
#line 949 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 192:
#line 953 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 193:
#line 955 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 194:
#line 959 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 195:
#line 961 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 196:
#line 965 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 197:
#line 970 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 198:
#line 972 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 199:
#line 976 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 200:
#line 978 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 201:
#line 984 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 202:
#line 986 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 203:
#line 990 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 204:
#line 994 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 206:
#line 999 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (3)].constval), GLOBALCONST); ;}
    break;

  case 207:
#line 1003 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 208:
#line 1005 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 209:
#line 1007 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 210:
#line 1009 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 211:
#line 1018 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 212:
#line 1019 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 213:
#line 1020 "pir.y"
    { (yyval.expr) = expr_from_ident((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 214:
#line 1023 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 215:
#line 1024 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 216:
#line 1027 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 217:
#line 1028 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 218:
#line 1029 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 219:
#line 1032 "pir.y"
    { (yyval.sval) = "ne"; ;}
    break;

  case 220:
#line 1033 "pir.y"
    { (yyval.sval) = "eq"; ;}
    break;

  case 221:
#line 1034 "pir.y"
    { (yyval.sval) = "lt"; ;}
    break;

  case 222:
#line 1035 "pir.y"
    { (yyval.sval) = "le"; ;}
    break;

  case 223:
#line 1036 "pir.y"
    { (yyval.sval) = "ge"; ;}
    break;

  case 224:
#line 1037 "pir.y"
    { (yyval.sval) = "gt"; ;}
    break;

  case 225:
#line 1040 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 226:
#line 1041 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 227:
#line 1042 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 228:
#line 1043 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 229:
#line 1046 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 230:
#line 1047 "pir.y"
    { (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 231:
#line 1050 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 232:
#line 1051 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 233:
#line 1052 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 234:
#line 1053 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), !IS_PASM_REG); ;}
    break;

  case 236:
#line 1057 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 237:
#line 1058 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 238:
#line 1059 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 239:
#line 1060 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival), IS_PASM_REG); ;}
    break;

  case 242:
#line 1067 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 243:
#line 1068 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 244:
#line 1069 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 245:
#line 1072 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 246:
#line 1073 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 247:
#line 1074 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 248:
#line 1075 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 249:
#line 1076 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 250:
#line 1077 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 251:
#line 1078 "pir.y"
    { (yyval.sval) = "band"; ;}
    break;

  case 252:
#line 1079 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 253:
#line 1080 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 254:
#line 1081 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 255:
#line 1082 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;

  case 256:
#line 1083 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 257:
#line 1084 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 258:
#line 1085 "pir.y"
    { (yyval.sval) = "or";  ;}
    break;

  case 259:
#line 1086 "pir.y"
    { (yyval.sval) = "and"; ;}
    break;

  case 260:
#line 1087 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 261:
#line 1088 "pir.y"
    { (yyval.sval) = "xor"; ;}
    break;

  case 262:
#line 1089 "pir.y"
    { (yyval.sval) = "iseq"; ;}
    break;

  case 263:
#line 1090 "pir.y"
    { (yyval.sval) = "isle"; ;}
    break;

  case 264:
#line 1091 "pir.y"
    { (yyval.sval) = "islt"; ;}
    break;

  case 265:
#line 1092 "pir.y"
    { (yyval.sval) = "isge"; ;}
    break;

  case 266:
#line 1093 "pir.y"
    { (yyval.sval) = "isgt"; ;}
    break;

  case 267:
#line 1094 "pir.y"
    { (yyval.sval) = "isne"; ;}
    break;

  case 268:
#line 1098 "pir.y"
    { (yyval.sval) = "add"; ;}
    break;

  case 269:
#line 1099 "pir.y"
    { (yyval.sval) = "sub"; ;}
    break;

  case 270:
#line 1100 "pir.y"
    { (yyval.sval) = "mul"; ;}
    break;

  case 271:
#line 1101 "pir.y"
    { (yyval.sval) = "mod"; ;}
    break;

  case 272:
#line 1102 "pir.y"
    { (yyval.sval) = "pow"; ;}
    break;

  case 273:
#line 1103 "pir.y"
    { (yyval.sval) = "div"; ;}
    break;

  case 274:
#line 1104 "pir.y"
    { (yyval.sval) = "fdiv"; ;}
    break;

  case 275:
#line 1105 "pir.y"
    { (yyval.sval) = "bor"; ;}
    break;

  case 276:
#line 1106 "pir.y"
    { (yyval.sval) = "band" ;}
    break;

  case 277:
#line 1107 "pir.y"
    { (yyval.sval) = "bxor"; ;}
    break;

  case 278:
#line 1108 "pir.y"
    { (yyval.sval) = "concat"; ;}
    break;

  case 279:
#line 1109 "pir.y"
    { (yyval.sval) = "shr"; ;}
    break;

  case 280:
#line 1110 "pir.y"
    { (yyval.sval) = "shl"; ;}
    break;

  case 281:
#line 1111 "pir.y"
    { (yyval.sval) = "lsr"; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3242 "pirparser.c"
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


#line 1113 "pir.y"




/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


