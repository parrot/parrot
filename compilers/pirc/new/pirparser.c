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
     TK_DOTDOT = 259,
     TK_ENDM = 260,
     TK_NL = 261,
     TK_HLL = 262,
     TK_HLL_MAP = 263,
     TK_EMIT = 264,
     TK_EOM = 265,
     TK_N_OPERATORS = 266,
     TK_PRAGMA = 267,
     TK_LOADLIB = 268,
     TK_SUB = 269,
     TK_END = 270,
     TK_PARAM = 271,
     TK_LEX = 272,
     TK_LOCAL = 273,
     TK_NAMESPACE = 274,
     TK_ENDNAMESPACE = 275,
     TK_INVOCANT = 276,
     TK_METH_CALL = 277,
     TK_GLOBALCONST = 278,
     TK_CONST = 279,
     TK_RETURN = 280,
     TK_YIELD = 281,
     TK_PCC_BEGIN_YIELD = 282,
     TK_PCC_END_YIELD = 283,
     TK_PCC_BEGIN_RETURN = 284,
     TK_PCC_END_RETURN = 285,
     TK_PCC_BEGIN = 286,
     TK_PCC_END = 287,
     TK_GET_RESULTS = 288,
     TK_PCC_CALL = 289,
     TK_ARG = 290,
     TK_RESULT = 291,
     TK_NCI_CALL = 292,
     TK_IDENT = 293,
     TK_STRINGC = 294,
     TK_INTC = 295,
     TK_NUMC = 296,
     TK_PASM_PREG = 297,
     TK_PASM_NREG = 298,
     TK_PASM_SREG = 299,
     TK_PASM_IREG = 300,
     TK_SYM_PREG = 301,
     TK_SYM_NREG = 302,
     TK_SYM_SREG = 303,
     TK_SYM_IREG = 304,
     TK_PARROT_OP = 305,
     TK_INT = 306,
     TK_NUM = 307,
     TK_PMC = 308,
     TK_STRING = 309,
     TK_NULL = 310,
     TK_IF = 311,
     TK_UNLESS = 312,
     TK_GOTO = 313,
     TK_NEW = 314,
     TK_ARROW = 315,
     TK_NE = 316,
     TK_EQ = 317,
     TK_LT = 318,
     TK_LE = 319,
     TK_GT = 320,
     TK_GE = 321,
     TK_USHIFT = 322,
     TK_RSHIFT = 323,
     TK_LSHIFT = 324,
     TK_FDIV = 325,
     TK_OR = 326,
     TK_AND = 327,
     TK_XOR = 328,
     TK_CONC = 329,
     TK_ASSIGN_USHIFT = 330,
     TK_ASSIGN_RSHIFT = 331,
     TK_ASSIGN_LSHIFT = 332,
     TK_ASSIGN_INC = 333,
     TK_ASSIGN_DEC = 334,
     TK_ASSIGN_MUL = 335,
     TK_ASSIGN_MOD = 336,
     TK_ASSIGN_POW = 337,
     TK_ASSIGN_DIV = 338,
     TK_ASSIGN_BOR = 339,
     TK_ASSIGN_BAND = 340,
     TK_ASSIGN_FDIV = 341,
     TK_ASSIGN_BNOT = 342,
     TK_ASSIGN_CONC = 343,
     TK_FLAG_INIT = 344,
     TK_FLAG_LOAD = 345,
     TK_FLAG_MAIN = 346,
     TK_FLAG_ANON = 347,
     TK_FLAG_METHOD = 348,
     TK_FLAG_OUTER = 349,
     TK_FLAG_VTABLE = 350,
     TK_FLAG_LEX = 351,
     TK_FLAG_MULTI = 352,
     TK_FLAG_POSTCOMP = 353,
     TK_FLAG_IMMEDIATE = 354,
     TK_FLAG_UNIQUE_REG = 355,
     TK_FLAG_NAMED = 356,
     TK_FLAG_SLURPY = 357,
     TK_FLAG_FLAT = 358,
     TK_FLAG_OPTIONAL = 359,
     TK_FLAG_OPT_FLAG = 360
   };
#endif
/* Tokens.  */
#define TK_LABEL 258
#define TK_DOTDOT 259
#define TK_ENDM 260
#define TK_NL 261
#define TK_HLL 262
#define TK_HLL_MAP 263
#define TK_EMIT 264
#define TK_EOM 265
#define TK_N_OPERATORS 266
#define TK_PRAGMA 267
#define TK_LOADLIB 268
#define TK_SUB 269
#define TK_END 270
#define TK_PARAM 271
#define TK_LEX 272
#define TK_LOCAL 273
#define TK_NAMESPACE 274
#define TK_ENDNAMESPACE 275
#define TK_INVOCANT 276
#define TK_METH_CALL 277
#define TK_GLOBALCONST 278
#define TK_CONST 279
#define TK_RETURN 280
#define TK_YIELD 281
#define TK_PCC_BEGIN_YIELD 282
#define TK_PCC_END_YIELD 283
#define TK_PCC_BEGIN_RETURN 284
#define TK_PCC_END_RETURN 285
#define TK_PCC_BEGIN 286
#define TK_PCC_END 287
#define TK_GET_RESULTS 288
#define TK_PCC_CALL 289
#define TK_ARG 290
#define TK_RESULT 291
#define TK_NCI_CALL 292
#define TK_IDENT 293
#define TK_STRINGC 294
#define TK_INTC 295
#define TK_NUMC 296
#define TK_PASM_PREG 297
#define TK_PASM_NREG 298
#define TK_PASM_SREG 299
#define TK_PASM_IREG 300
#define TK_SYM_PREG 301
#define TK_SYM_NREG 302
#define TK_SYM_SREG 303
#define TK_SYM_IREG 304
#define TK_PARROT_OP 305
#define TK_INT 306
#define TK_NUM 307
#define TK_PMC 308
#define TK_STRING 309
#define TK_NULL 310
#define TK_IF 311
#define TK_UNLESS 312
#define TK_GOTO 313
#define TK_NEW 314
#define TK_ARROW 315
#define TK_NE 316
#define TK_EQ 317
#define TK_LT 318
#define TK_LE 319
#define TK_GT 320
#define TK_GE 321
#define TK_USHIFT 322
#define TK_RSHIFT 323
#define TK_LSHIFT 324
#define TK_FDIV 325
#define TK_OR 326
#define TK_AND 327
#define TK_XOR 328
#define TK_CONC 329
#define TK_ASSIGN_USHIFT 330
#define TK_ASSIGN_RSHIFT 331
#define TK_ASSIGN_LSHIFT 332
#define TK_ASSIGN_INC 333
#define TK_ASSIGN_DEC 334
#define TK_ASSIGN_MUL 335
#define TK_ASSIGN_MOD 336
#define TK_ASSIGN_POW 337
#define TK_ASSIGN_DIV 338
#define TK_ASSIGN_BOR 339
#define TK_ASSIGN_BAND 340
#define TK_ASSIGN_FDIV 341
#define TK_ASSIGN_BNOT 342
#define TK_ASSIGN_CONC 343
#define TK_FLAG_INIT 344
#define TK_FLAG_LOAD 345
#define TK_FLAG_MAIN 346
#define TK_FLAG_ANON 347
#define TK_FLAG_METHOD 348
#define TK_FLAG_OUTER 349
#define TK_FLAG_VTABLE 350
#define TK_FLAG_LEX 351
#define TK_FLAG_MULTI 352
#define TK_FLAG_POSTCOMP 353
#define TK_FLAG_IMMEDIATE 354
#define TK_FLAG_UNIQUE_REG 355
#define TK_FLAG_NAMED 356
#define TK_FLAG_SLURPY 357
#define TK_FLAG_FLAT 358
#define TK_FLAG_OPTIONAL 359
#define TK_FLAG_OPT_FLAG 360




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

#include "pirparser.h"
#include "pircompiler.h"


struct lexer_state;

extern int yyerror(struct lexer_state * const lexer,
                   char const * const message);


extern int yylex(YYSTYPE * const yylval,
                 struct lexer_state const * const lexer);



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
#line 175 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 372 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 385 "pirparser.c"

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
#define YYLAST   449

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  121
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  96
/* YYNRULES -- Number of rules.  */
#define YYNRULES  244
/* YYNRULES -- Number of states.  */
#define YYNSTATES  401

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   360

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   113,     2,     2,     2,   118,     2,     2,
     109,   110,   117,   115,   106,   112,   120,   116,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   119,
       2,   111,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   107,     2,   108,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,   114,     2,     2,     2,
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
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    30,    32,    36,    39,    44,    49,
      54,    55,    58,    61,    65,    68,    70,    75,    77,    81,
      89,    91,    93,    94,    97,    99,   101,   103,   105,   107,
     109,   114,   117,   122,   124,   126,   127,   131,   133,   135,
     137,   139,   140,   143,   148,   151,   156,   157,   160,   163,
     166,   168,   170,   172,   174,   176,   178,   180,   182,   184,
     186,   188,   190,   192,   194,   196,   198,   201,   207,   211,
     215,   219,   222,   226,   229,   233,   236,   239,   241,   245,
     248,   250,   253,   255,   257,   260,   262,   265,   267,   269,
     271,   273,   275,   277,   279,   281,   283,   285,   287,   289,
     291,   293,   295,   297,   299,   301,   303,   305,   307,   309,
     313,   315,   319,   321,   324,   328,   331,   333,   335,   338,
     342,   346,   350,   355,   357,   361,   363,   366,   372,   374,
     376,   385,   386,   389,   394,   397,   400,   406,   407,   410,
     415,   417,   424,   428,   431,   432,   434,   436,   440,   443,
     444,   447,   449,   451,   453,   456,   458,   460,   462,   464,
     466,   468,   473,   475,   477,   479,   481,   485,   489,   491,
     493,   499,   501,   503,   507,   511,   515,   519,   520,   522,
     524,   528,   531,   535,   541,   542,   545,   550,   551,   554,
     559,   560,   563,   565,   568,   569,   571,   575,   578,   581,
     585,   590,   595,   600,   605,   608,   610,   612,   616,   618,
     620,   622,   624,   626,   628,   630,   632,   634,   636,   638,
     640,   642,   644,   646,   648,   650,   652,   654,   656,   658,
     660,   662,   664,   666,   668
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     122,     0,    -1,   123,   124,   123,    -1,    -1,     6,    -1,
     125,    -1,   124,     6,   125,    -1,   135,    -1,   205,    -1,
     133,    -1,   130,    -1,   128,    -1,   129,    -1,   127,    -1,
     126,    -1,    12,    11,    40,    -1,    13,    39,    -1,     7,
      39,   106,    39,    -1,     8,    39,   106,    39,    -1,     9,
       6,   131,    10,    -1,    -1,   131,   132,    -1,     3,     6,
      -1,     3,    50,     6,    -1,    50,     6,    -1,    19,    -1,
      19,   107,   134,   108,    -1,    39,    -1,   134,   160,    39,
      -1,    14,   136,   137,     6,   141,   144,    15,    -1,    38,
      -1,    39,    -1,    -1,   137,   138,    -1,    92,    -1,    89,
      -1,    90,    -1,    91,    -1,    93,    -1,    96,    -1,    94,
     109,   136,   110,    -1,    95,   204,    -1,    97,   109,   139,
     110,    -1,    98,    -1,    99,    -1,    -1,   139,   106,   140,
      -1,    38,    -1,    39,    -1,   157,    -1,   215,    -1,    -1,
     141,   142,    -1,    16,   143,   180,     6,    -1,   215,    38,
      -1,   215,    39,    60,    38,    -1,    -1,   144,   145,    -1,
       3,     6,    -1,     3,   146,    -1,   146,    -1,   162,    -1,
     163,    -1,   164,    -1,   165,    -1,   168,    -1,   206,    -1,
     186,    -1,   187,    -1,   189,    -1,   169,    -1,   150,    -1,
     149,    -1,   148,    -1,   161,    -1,   147,    -1,     1,     6,
      -1,    33,   109,   177,   110,     6,    -1,    55,    42,     6,
      -1,    55,    46,     6,    -1,    55,    38,     6,    -1,   184,
       6,    -1,   216,   151,     6,    -1,   156,   210,    -1,   157,
     111,   210,    -1,   111,   152,    -1,   154,   210,    -1,   210,
      -1,   210,   155,   210,    -1,   216,   157,    -1,   153,    -1,
      39,   192,    -1,   184,    -1,    55,    -1,    59,    39,    -1,
     161,    -1,   183,   192,    -1,   112,    -1,   113,    -1,   114,
      -1,   115,    -1,   112,    -1,   116,    -1,   117,    -1,   118,
      -1,    74,    -1,    78,    -1,    79,    -1,    80,    -1,    82,
      -1,    83,    -1,    86,    -1,    84,    -1,    85,    -1,    87,
      -1,    88,    -1,    76,    -1,    77,    -1,    75,    -1,   107,
     158,   108,    -1,   159,    -1,   158,   160,   159,    -1,   210,
      -1,   210,     4,    -1,   210,     4,   210,    -1,     4,   210,
      -1,   119,    -1,   106,    -1,    50,     6,    -1,    56,   208,
     164,    -1,    57,   208,   164,    -1,    58,    38,     6,    -1,
      18,   215,   166,     6,    -1,   167,    -1,   166,   106,   167,
      -1,    38,    -1,    38,   100,    -1,    17,    39,   106,   216,
       6,    -1,   170,    -1,   176,    -1,    31,     6,   171,   173,
       6,   174,    32,     6,    -1,    -1,   171,   172,    -1,    35,
     210,   201,     6,    -1,    34,   183,    -1,    37,   183,    -1,
      21,   183,     6,    22,   185,    -1,    -1,   174,   175,    -1,
      36,   216,   180,     6,    -1,   165,    -1,   109,   177,   110,
     111,   182,     6,    -1,    39,   192,     6,    -1,   153,     6,
      -1,    -1,   178,    -1,   179,    -1,   178,   106,   179,    -1,
     216,   180,    -1,    -1,   180,   181,    -1,   104,    -1,   105,
      -1,   102,    -1,   101,   203,    -1,   100,    -1,   153,    -1,
     184,    -1,    46,    -1,    42,    -1,    38,    -1,   183,   120,
     185,   192,    -1,    38,    -1,    39,    -1,    42,    -1,    46,
      -1,    19,    38,     6,    -1,    20,    38,     6,    -1,   190,
      -1,   188,    -1,    29,     6,   199,    30,     6,    -1,   191,
      -1,   196,    -1,    25,   192,     6,    -1,    25,   182,     6,
      -1,    26,   192,     6,    -1,   109,   193,   110,    -1,    -1,
     194,    -1,   195,    -1,   194,   106,   195,    -1,   210,   201,
      -1,    39,    60,   210,    -1,    27,     6,   197,    28,     6,
      -1,    -1,   197,   198,    -1,    26,   210,   201,     6,    -1,
      -1,   199,   200,    -1,    25,   210,   201,     6,    -1,    -1,
     201,   202,    -1,   103,    -1,   101,   203,    -1,    -1,   204,
      -1,   109,    39,   110,    -1,    24,   207,    -1,   205,     6,
      -1,    23,   207,     6,    -1,    51,    38,   111,    40,    -1,
      52,    38,   111,    41,    -1,    53,    38,   111,    39,    -1,
      54,    38,   111,    39,    -1,    55,   210,    -1,   210,    -1,
     209,    -1,   210,   214,   210,    -1,    38,    -1,   211,    -1,
     212,    -1,    39,    -1,    40,    -1,    41,    -1,    46,    -1,
      47,    -1,    49,    -1,    48,    -1,   213,    -1,    42,    -1,
      43,    -1,    45,    -1,    44,    -1,    61,    -1,    62,    -1,
      63,    -1,    64,    -1,    66,    -1,    65,    -1,    51,    -1,
      52,    -1,    53,    -1,    54,    -1,   212,    -1,    38,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   198,   198,   203,   204,   207,   208,   211,   212,   213,
     214,   215,   216,   217,   218,   227,   235,   248,   251,   263,
     269,   270,   273,   274,   275,   285,   286,   289,   290,   295,
     301,   302,   305,   306,   324,   325,   326,   327,   328,   329,
     330,   331,   332,   333,   334,   337,   338,   341,   342,   343,
     344,   347,   348,   355,   364,   365,   371,   372,   382,   383,
     384,   387,   388,   389,   390,   391,   392,   393,   394,   395,
     396,   397,   398,   399,   400,   401,   402,   409,   412,   413,
     414,   417,   420,   423,   424,   425,   428,   429,   430,   431,
     432,   433,   434,   435,   436,   437,   441,   444,   445,   446,
     449,   450,   451,   452,   453,   454,   458,   459,   460,   461,
     462,   463,   464,   465,   466,   467,   468,   469,   470,   473,
     476,   477,   480,   481,   482,   483,   486,   487,   490,   493,
     496,   499,   502,   505,   506,   509,   510,   513,   516,   517,
     520,   527,   528,   531,   534,   535,   536,   540,   541,   544,
     545,   548,   549,   550,   553,   554,   557,   558,   561,   564,
     565,   568,   569,   570,   571,   572,   575,   576,   579,   580,
     581,   584,   587,   588,   589,   590,   593,   594,   597,   598,
     601,   607,   608,   611,   612,   615,   618,   621,   622,   625,
     626,   635,   636,   646,   651,   652,   655,   658,   659,   662,
     665,   666,   669,   670,   673,   674,   677,   680,   683,   684,
     696,   697,   698,   699,   709,   710,   711,   714,   716,   717,
     718,   721,   722,   723,   726,   727,   728,   729,   730,   734,
     735,   736,   737,   750,   751,   752,   753,   754,   755,   766,
     767,   768,   769,   772,   773
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"label\"", "\"..\"", "\".endm\"",
  "\"\\n\"", "\".HLL\"", "\".HLL_map\"", "\".emit\"", "\".eom\"",
  "\"n_operators\"", "\".pragma\"", "\".loadlib\"", "\".sub\"", "\".end\"",
  "\".param\"", "\".lex\"", "\".local\"", "\".namespace\"",
  "\".endnamespace\"", "\".invocant\"", "\".meth_call\"",
  "\".globalconst\"", "\".const\"", "\".return\"", "\".yield\"",
  "\".pcc_begin_yield\"", "\".pcc_end_yield\"", "\".pcc_begin_return\"",
  "\".pcc_end_return\"", "\".pcc_begin\"", "\".pcc_end\"",
  "\".get_results\"", "\".pcc_call\"", "\".arg\"", "\".result\"",
  "\".nci_call\"", "\"identifier\"", "\"string constant\"",
  "\"integer constant\"", "\"number constant\"", "\"PMC register\"",
  "\"Number register\"", "\"String register\"", "\"Integer register\"",
  "\"Symbolic PMC register\"", "\"Symbolic number register\"",
  "\"Symbolic string register\"", "\"Symbolic integer register\"",
  "\"parrot op\"", "\"int\"", "\"num\"", "\"pmc\"", "\"string\"",
  "\"null\"", "\"if\"", "\"unless\"", "\"goto\"", "\"new\"", "\"=>\"",
  "\"!=\"", "\"==\"", "\"<\"", "\"<=\"", "\">\"", "\">=\"", "\">>>\"",
  "\">>\"", "\"<<\"", "\"//\"", "\"||\"", "\"&&\"", "\"^\"", "\".\"",
  "\">>>=\"", "\">>=\"", "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"", "\"%=\"",
  "\"**=\"", "\"/=\"", "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"", "\".=\"",
  "\":init\"", "\":load\"", "\":main\"", "\":anon\"", "\":method\"",
  "\":outer\"", "\":vtable\"", "\":lex\"", "\":multi\"", "\":postcomp\"",
  "\":immediate\"", "\":unique_reg\"", "\":named\"", "\":slurpy\"",
  "\":flat\"", "\":optional\"", "\":opt_flag\"", "','", "'['", "']'",
  "'('", "')'", "'='", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'",
  "';'", "'.'", "$accept", "program", "opt_nl", "compilation_units",
  "compilation_unit", "pir_pragma", "loadlib", "hll_specifier",
  "hll_mapping", "emit_block", "pasm_instructions", "pasm_instruction",
  "namespace_declaration", "namespace_id", "sub_definition", "sub_id",
  "sub_flags", "sub_flag", "multi_type_list", "multi_type", "parameters",
  "parameter", "param_def", "instructions", "labeled_instruction",
  "instruction", "getresults_statement", "null_statement",
  "methodcall_statement", "assignment_statement", "assignment_tail",
  "assignment_expression", "simple_invocation", "unop", "binop",
  "augmented_op", "keylist", "keys", "key", "separator",
  "parrot_instruction", "if_statement", "unless_statement",
  "goto_statement", "local_declaration", "local_id_list", "local_id",
  "lex_declaration", "invocation_statement", "long_invocation_statement",
  "long_arguments", "long_argument", "long_invocation", "long_results",
  "long_result", "short_invocation_statement", "target_list",
  "return_target_list", "return_target", "param_flags", "param_flag",
  "invocation_expression", "invokable", "methodcall", "method",
  "namespace_statement", "return_statement", "long_return_statement",
  "yield_statement", "short_return_statement", "short_yield_statement",
  "arguments", "opt_arguments_list", "arguments_list", "argument",
  "long_yield_statement", "yield_expressions", "yield_expression",
  "return_expressions", "return_expression", "arg_flags", "arg_flag",
  "opt_paren_string", "paren_string", "const_declaration",
  "const_decl_statement", "const_tail", "condition",
  "conditional_expression", "expression", "constant", "reg", "pasm_reg",
  "rel_op", "type", "target", 0
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
     355,   356,   357,   358,   359,   360,    44,    91,    93,    40,
      41,    61,    45,    33,   126,    43,    47,    42,    37,    59,
      46
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   121,   122,   123,   123,   124,   124,   125,   125,   125,
     125,   125,   125,   125,   125,   126,   127,   128,   129,   130,
     131,   131,   132,   132,   132,   133,   133,   134,   134,   135,
     136,   136,   137,   137,   138,   138,   138,   138,   138,   138,
     138,   138,   138,   138,   138,   139,   139,   140,   140,   140,
     140,   141,   141,   142,   143,   143,   144,   144,   145,   145,
     145,   146,   146,   146,   146,   146,   146,   146,   146,   146,
     146,   146,   146,   146,   146,   146,   146,   147,   148,   148,
     148,   149,   150,   151,   151,   151,   152,   152,   152,   152,
     152,   152,   152,   152,   152,   152,   153,   154,   154,   154,
     155,   155,   155,   155,   155,   155,   156,   156,   156,   156,
     156,   156,   156,   156,   156,   156,   156,   156,   156,   157,
     158,   158,   159,   159,   159,   159,   160,   160,   161,   162,
     163,   164,   165,   166,   166,   167,   167,   168,   169,   169,
     170,   171,   171,   172,   173,   173,   173,   174,   174,   175,
     175,   176,   176,   176,   177,   177,   178,   178,   179,   180,
     180,   181,   181,   181,   181,   181,   182,   182,   183,   183,
     183,   184,   185,   185,   185,   185,   186,   186,   187,   187,
     188,   189,   189,   190,   190,   191,   192,   193,   193,   194,
     194,   195,   195,   196,   197,   197,   198,   199,   199,   200,
     201,   201,   202,   202,   203,   203,   204,   205,   206,   206,
     207,   207,   207,   207,   208,   208,   208,   209,   210,   210,
     210,   211,   211,   211,   212,   212,   212,   212,   212,   213,
     213,   213,   213,   214,   214,   214,   214,   214,   214,   215,
     215,   215,   215,   216,   216
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     2,     4,     4,     4,
       0,     2,     2,     3,     2,     1,     4,     1,     3,     7,
       1,     1,     0,     2,     1,     1,     1,     1,     1,     1,
       4,     2,     4,     1,     1,     0,     3,     1,     1,     1,
       1,     0,     2,     4,     2,     4,     0,     2,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     5,     3,     3,
       3,     2,     3,     2,     3,     2,     2,     1,     3,     2,
       1,     2,     1,     1,     2,     1,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       1,     3,     1,     2,     3,     2,     1,     1,     2,     3,
       3,     3,     4,     1,     3,     1,     2,     5,     1,     1,
       8,     0,     2,     4,     2,     2,     5,     0,     2,     4,
       1,     6,     3,     2,     0,     1,     1,     3,     2,     0,
       2,     1,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     4,     1,     1,     1,     1,     3,     3,     1,     1,
       5,     1,     1,     3,     3,     3,     3,     0,     1,     1,
       3,     2,     3,     5,     0,     2,     4,     0,     2,     4,
       0,     2,     1,     2,     0,     1,     3,     2,     2,     3,
       4,     4,     4,     4,     2,     1,     1,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    25,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,    30,    31,
      32,     0,     0,     0,     0,     0,   207,     4,     2,     0,
       0,     0,    15,     0,    27,     0,     0,     0,     0,     0,
       6,    17,    18,     0,    19,     0,    21,    51,    35,    36,
      37,    34,    38,     0,     0,    39,     0,    43,    44,    33,
     127,    26,   126,     0,     0,     0,     0,     0,    22,     0,
      24,    56,     0,     0,    41,    45,    28,   210,   211,   212,
     213,    23,     0,    52,     0,     0,     0,     0,   239,   240,
     241,   242,   159,     0,     0,     0,    29,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   244,     0,
     229,   230,   232,   231,   224,   225,   227,   226,     0,     0,
       0,     0,     0,   154,    57,    60,    75,    73,    72,    71,
       0,    74,    61,    62,    63,    64,    65,    70,   138,   139,
       0,     0,    67,    68,   179,    69,   178,   181,   182,     0,
      66,   243,   228,     0,    40,   206,     0,    42,     0,    54,
       0,    76,    58,    59,     0,     0,     0,     0,     0,   170,
     169,   168,   187,   166,     0,   167,     0,     0,   194,   197,
     141,   154,     0,   128,     0,     0,     0,   218,   221,   222,
     223,   229,   224,     0,     0,   216,   215,   219,   220,     0,
       0,   244,     0,   155,   156,   159,   153,     0,    96,    81,
     208,   118,   116,   117,   106,   107,   108,   109,   110,   112,
     113,   111,   114,   115,     0,     0,     0,     0,     0,    47,
      48,    46,    49,    50,    53,   165,   204,   163,   161,   162,
     160,     0,     0,   135,     0,   133,   176,   177,   209,   221,
       0,   188,   189,   200,   184,   183,   185,     0,     0,     0,
       0,   152,    80,    78,    79,   214,   129,   233,   234,   235,
     236,   238,   237,     0,   130,   131,     0,     0,   158,   172,
     173,   174,   175,     0,     0,     0,   120,   122,   218,   221,
      93,     0,    97,    98,    99,    85,    90,     0,    95,    92,
      87,   220,     0,    82,    83,     0,   164,   205,    55,     0,
     136,   132,     0,     0,   186,     0,   191,     0,     0,   195,
       0,     0,   198,     0,     0,     0,     0,   142,     0,     0,
     217,     0,   157,   171,   125,   119,     0,   123,    91,    94,
      86,   105,   101,   100,   102,   103,   104,     0,    89,    84,
     137,   134,   192,   190,   204,   202,   201,   200,   193,   200,
     180,     0,   144,   200,   145,   147,    77,     0,   121,   124,
      88,   203,     0,     0,     0,     0,     0,   151,   196,   199,
       0,   143,     0,     0,   150,   148,   146,   140,   159,     0,
     149
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      41,    56,    20,    45,    21,    30,    43,    69,    97,   241,
      81,    93,   102,    94,   134,   135,   136,   137,   138,   139,
     236,   305,   140,   307,   357,   237,   238,   295,   296,    73,
     141,   142,   143,   144,   145,   254,   255,   146,   147,   148,
     269,   337,   338,   386,   395,   149,   212,   213,   214,   168,
     250,   184,   150,   151,   293,   152,   153,   154,   155,   156,
     157,   186,   260,   261,   262,   158,   267,   329,   268,   332,
     326,   366,   316,   317,    22,   160,    36,   204,   205,   206,
     207,   208,   162,   283,   103,   215
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -355
static const yytype_int16 yypact[] =
{
      47,  -355,    25,    42,  -355,    59,    84,   121,    37,   129,
      30,    68,   163,   173,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,    79,    80,  -355,   151,  -355,  -355,  -355,
    -355,   157,   164,   170,   182,   183,  -355,    42,  -355,   162,
     194,     7,  -355,   150,  -355,    38,   123,   152,   153,   154,
    -355,  -355,  -355,    15,  -355,   260,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,   161,   172,  -355,   188,  -355,  -355,  -355,
    -355,  -355,  -355,   233,   242,   257,   262,   275,  -355,   316,
    -355,   327,    30,   284,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,   288,  -355,   180,   265,   266,   -21,  -355,  -355,
    -355,  -355,  -355,    72,   371,    57,  -355,   339,   288,   341,
     342,   163,   -22,   272,   376,   377,   378,   276,   -86,   272,
     -83,  -355,  -355,  -355,   -78,  -355,  -355,  -355,   380,   107,
     289,   289,   349,   231,  -355,  -355,  -355,  -355,  -355,  -355,
     382,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
      19,   383,  -355,  -355,  -355,  -355,  -355,  -355,  -355,   384,
    -355,  -355,  -355,   208,  -355,  -355,    40,  -355,    16,  -355,
     331,  -355,  -355,  -355,   286,   355,   388,   389,   390,  -355,
    -355,  -355,   307,  -355,   391,  -355,   392,   393,  -355,  -355,
    -355,   231,   394,  -355,   395,   396,   397,  -355,  -355,  -355,
    -355,  -355,  -355,   319,   346,  -355,   308,  -355,  -355,   346,
     399,  -355,   296,   301,  -355,  -355,  -355,   131,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,   264,   212,   402,   319,   298,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,   172,  -355,  -355,  -355,
    -355,   372,   231,   311,     3,  -355,  -355,  -355,  -355,   352,
     303,   309,  -355,  -355,  -355,  -355,  -355,   136,     8,     9,
     304,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,   319,  -355,  -355,   305,   231,   216,  -355,
    -355,  -355,  -355,   272,   319,    55,  -355,   413,    58,   272,
    -355,   379,  -355,  -355,  -355,  -355,  -355,   319,  -355,  -355,
     -45,   312,   313,  -355,  -355,   319,  -355,  -355,  -355,   415,
    -355,  -355,   355,   319,  -355,   307,   109,   319,   416,  -355,
     319,   417,  -355,   138,   138,   319,   138,  -355,   418,   419,
    -355,   138,  -355,  -355,  -355,  -355,   264,   319,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,  -355,   319,  -355,  -355,
    -355,  -355,  -355,  -355,   172,  -355,  -355,  -355,  -355,  -355,
    -355,   420,  -355,  -355,  -355,  -355,  -355,   421,  -355,  -355,
    -355,  -355,    21,    34,   406,    35,     0,  -355,  -355,  -355,
     131,  -355,   423,   231,  -355,  -355,  -355,  -355,  -355,    29,
    -355
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -355,  -355,   422,  -355,   400,  -355,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,   348,  -355,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,   326,  -355,  -355,  -355,  -355,
    -355,  -355,  -110,  -355,  -355,  -355,  -161,  -355,    86,   139,
     198,  -355,  -355,  -157,    50,  -355,   116,  -355,  -355,  -355,
    -355,  -355,  -355,  -355,  -355,  -355,   248,  -355,   155,  -211,
    -355,    99,  -144,  -109,    51,  -355,  -355,  -355,  -355,  -355,
    -355,  -105,  -355,  -355,   118,  -355,  -355,  -355,  -355,  -355,
    -354,  -355,    81,   385,    49,  -355,   333,   315,  -355,  -175,
    -355,   -94,  -355,  -355,  -102,   -93
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -245
static const yytype_int16 yytable[] =
{
     161,   163,   183,   185,   288,   242,   175,   263,   187,   321,
      53,   161,   163,   382,   192,   383,   179,    54,   108,   385,
     180,    78,   244,  -170,   181,     4,  -169,   388,   275,   351,
     333,  -168,   392,   330,  -170,   400,   393,  -169,   331,   161,
     389,   391,  -168,   334,   335,   218,   336,   276,    26,     5,
       6,     7,   284,     1,     8,     9,    10,    55,   104,   297,
     310,    11,   314,   172,   243,    79,    12,   352,    28,    29,
     353,   354,   355,   356,   107,   108,   109,   110,   239,   240,
     111,    12,   112,   113,   114,   166,   115,   182,   116,   167,
     117,    98,    99,   100,   101,   118,   119,   161,    23,   120,
     121,   122,   123,   124,   125,   126,   127,   128,   340,   322,
     169,   170,   129,   130,   131,   132,   245,   246,   247,   344,
     248,   249,   364,    24,   365,   306,   309,    25,   182,   245,
     246,   247,   350,   248,   249,   364,   364,   365,   365,   217,
     359,   311,   312,   159,    70,   194,    71,   234,   362,   195,
     263,   358,   367,   196,   159,   369,    57,    72,   161,   319,
     373,    70,   327,   345,   328,  -244,   133,  -170,    27,   289,
     290,   297,   379,   291,    72,    31,   179,   292,  -170,    37,
     180,   104,   380,   105,   181,    39,    40,   399,   343,   371,
     372,    42,   374,   161,   348,   106,    44,   107,   108,   109,
     110,    51,    46,   111,    12,   112,   113,   114,    47,   115,
     364,   116,   365,   117,    32,    33,    34,    35,   118,   119,
      48,    49,   120,   121,   122,   123,   124,   125,   126,   127,
     128,   183,   185,    52,    74,   129,   130,   131,   132,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
     298,   299,   199,   200,   120,   121,   122,   123,   124,   125,
     126,   127,   128,    75,    76,    77,    80,   300,   294,   211,
      82,   301,    86,   201,   121,   122,   123,   202,   125,   126,
     127,    83,    87,   221,   222,   223,   224,   225,   226,   133,
     227,   228,   229,   230,   231,   232,   233,    85,    88,   161,
     398,    89,   197,   198,   199,   200,   201,   121,   122,   123,
     202,   125,   126,   127,    90,   234,   245,   246,   247,   235,
     248,   249,    91,    96,   302,   303,   304,   197,   198,   199,
     200,   201,   121,   122,   123,   202,   125,   126,   127,    98,
      99,   100,   101,    92,   203,   197,   259,   199,   200,   201,
     121,   122,   123,   202,   125,   126,   127,   197,   198,   199,
     200,   201,   121,   122,   123,   202,   125,   126,   127,   277,
     278,   279,   280,   281,   282,   164,   165,   171,   174,   176,
     177,   182,   188,   189,   190,   191,   193,   210,   216,   219,
     220,   251,   252,   253,   256,   257,   258,   264,   265,   266,
     271,   272,   273,   274,   132,   285,   286,   287,   313,   315,
     318,   320,   323,   324,   339,   325,   341,   347,   349,  -243,
     234,   360,   368,   370,   375,   376,   384,   387,   390,   397,
      95,   173,   378,   308,   346,    38,   394,    50,   361,   270,
     377,   396,   342,   363,   178,   381,   209,     0,     0,    84
};

static const yytype_int16 yycheck[] =
{
      94,    94,   112,   112,   215,   166,   108,   182,   113,     6,
       3,   105,   105,   367,   119,   369,    38,    10,    18,   373,
      42,     6,     6,   109,    46,     0,   109,     6,   203,    74,
      21,   109,    32,    25,   120,     6,    36,   120,    30,   133,
       6,     6,   120,    34,    35,   150,    37,   204,    11,     7,
       8,     9,   209,     6,    12,    13,    14,    50,     1,   234,
     235,    19,   237,     6,   166,    50,    24,   112,    38,    39,
     115,   116,   117,   118,    17,    18,    19,    20,    38,    39,
      23,    24,    25,    26,    27,   106,    29,   109,    31,   110,
      33,    51,    52,    53,    54,    38,    39,   191,    39,    42,
      43,    44,    45,    46,    47,    48,    49,    50,   283,   106,
      38,    39,    55,    56,    57,    58,   100,   101,   102,   294,
     104,   105,   101,    39,   103,   235,   235,     6,   109,   100,
     101,   102,   307,   104,   105,   101,   101,   103,   103,   120,
     315,   235,   235,    94,   106,    38,   108,   107,   323,    42,
     325,   312,   327,    46,   105,   330,     6,   119,   252,   252,
     335,   106,    26,   108,    28,   107,   109,   109,    39,    38,
      39,   346,   347,    42,   119,   107,    38,    46,   120,     6,
      42,     1,   357,     3,    46,   106,   106,   398,   293,   333,
     334,    40,   336,   287,   299,    15,    39,    17,    18,    19,
      20,    39,    38,    23,    24,    25,    26,    27,    38,    29,
     101,    31,   103,    33,    51,    52,    53,    54,    38,    39,
      38,    38,    42,    43,    44,    45,    46,    47,    48,    49,
      50,   341,   341,    39,   111,    55,    56,    57,    58,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,   111,   111,   111,     6,    55,     4,    38,
     109,    59,    39,    42,    43,    44,    45,    46,    47,    48,
      49,   109,    40,    75,    76,    77,    78,    79,    80,   109,
      82,    83,    84,    85,    86,    87,    88,   109,    41,   393,
     393,    39,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    39,   107,   100,   101,   102,   111,
     104,   105,     6,    39,   112,   113,   114,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    51,
      52,    53,    54,    16,    55,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    61,
      62,    63,    64,    65,    66,   110,   110,     6,    39,    38,
      38,   109,     6,     6,     6,   109,     6,    38,     6,     6,
       6,    60,   106,    38,     6,     6,     6,     6,     6,     6,
       6,     6,     6,     6,    58,     6,   110,   106,     6,   111,
      38,   100,    60,   110,   110,   106,   111,     4,    39,   107,
     107,     6,     6,     6,     6,     6,     6,     6,    22,     6,
      82,   105,   346,   235,   295,    13,   386,    37,   322,   191,
     341,   390,   287,   325,   111,   364,   131,    -1,    -1,    64
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     6,   122,   123,     0,     7,     8,     9,    12,    13,
      14,    19,    24,   124,   125,   126,   127,   128,   129,   130,
     133,   135,   205,    39,    39,     6,    11,    39,    38,    39,
     136,   107,    51,    52,    53,    54,   207,     6,   123,   106,
     106,   131,    40,   137,    39,   134,    38,    38,    38,    38,
     125,    39,    39,     3,    10,    50,   132,     6,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   138,
     106,   108,   119,   160,   111,   111,   111,   111,     6,    50,
       6,   141,   109,   109,   204,   109,    39,    40,    41,    39,
      39,     6,    16,   142,   144,   136,    39,   139,    51,    52,
      53,    54,   143,   215,     1,     3,    15,    17,    18,    19,
      20,    23,    25,    26,    27,    29,    31,    33,    38,    39,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    55,
      56,    57,    58,   109,   145,   146,   147,   148,   149,   150,
     153,   161,   162,   163,   164,   165,   168,   169,   170,   176,
     183,   184,   186,   187,   188,   189,   190,   191,   196,   205,
     206,   212,   213,   216,   110,   110,   106,   110,   180,    38,
      39,     6,     6,   146,    39,   215,    38,    38,   207,    38,
      42,    46,   109,   153,   182,   184,   192,   192,     6,     6,
       6,   109,   192,     6,    38,    42,    46,    38,    39,    40,
      41,    42,    46,    55,   208,   209,   210,   211,   212,   208,
      38,    38,   177,   178,   179,   216,     6,   120,   192,     6,
       6,    75,    76,    77,    78,    79,    80,    82,    83,    84,
      85,    86,    87,    88,   107,   111,   151,   156,   157,    38,
      39,   140,   157,   215,     6,   100,   101,   102,   104,   105,
     181,    60,   106,    38,   166,   167,     6,     6,     6,    39,
     193,   194,   195,   210,     6,     6,     6,   197,   199,   171,
     177,     6,     6,     6,     6,   210,   164,    61,    62,    63,
      64,    65,    66,   214,   164,     6,   110,   106,   180,    38,
      39,    42,    46,   185,     4,   158,   159,   210,    38,    39,
      55,    59,   112,   113,   114,   152,   153,   154,   161,   184,
     210,   212,   216,     6,   210,   111,   203,   204,    38,   216,
     100,     6,   106,    60,   110,   106,   201,    26,    28,   198,
      25,    30,   200,    21,    34,    35,    37,   172,   173,   110,
     210,   111,   179,   192,   210,   108,   160,     4,   192,    39,
     210,    74,   112,   115,   116,   117,   118,   155,   157,   210,
       6,   167,   210,   195,   101,   103,   202,   210,     6,   210,
       6,   183,   183,   210,   183,     6,     6,   182,   159,   210,
     210,   203,   201,   201,     6,   201,   174,     6,     6,     6,
      22,     6,    32,    36,   165,   175,   185,     6,   216,   180,
       6
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
      yyerror (lexer, YY_("syntax error: cannot back up")); \
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
# define YYLEX yylex (&yylval, lexer)
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
		  Type, Value, lexer); \
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
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, struct lexer_state *lexer)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, lexer)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    struct lexer_state *lexer;
#endif
{
  if (!yyvaluep)
    return;
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
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, struct lexer_state *lexer)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, lexer)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    struct lexer_state *lexer;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep, lexer);
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
yy_reduce_print (YYSTYPE *yyvsp, int yyrule, struct lexer_state *lexer)
#else
static void
yy_reduce_print (yyvsp, yyrule, lexer)
    YYSTYPE *yyvsp;
    int yyrule;
    struct lexer_state *lexer;
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
		       		       , lexer);
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule, lexer); \
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
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, struct lexer_state *lexer)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, lexer)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    struct lexer_state *lexer;
#endif
{
  YYUSE (yyvaluep);
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
int yyparse (struct lexer_state *lexer);
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
yyparse (struct lexer_state *lexer)
#else
int
yyparse (lexer)
    struct lexer_state *lexer;
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
        case 76:
#line 403 "pir.y"
    { yyerrok; ;}
    break;

  case 221:
#line 721 "pir.y"
    { fprintf(stderr, "TK_STRINGC: [%s]\n", yylval.sval); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2040 "pirparser.c"
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
      yyerror (lexer, YY_("syntax error"));
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
	    yyerror (lexer, yymsg);
	  }
	else
	  {
	    yyerror (lexer, YY_("syntax error"));
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
		      yytoken, &yylval, lexer);
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
		  yystos[yystate], yyvsp, lexer);
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
  yyerror (lexer, YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, lexer);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, lexer);
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


#line 776 "pir.y"


/* the file being parsed */
extern FILE *yyin; /* CAN WE KEEP USING THIS IN A PURE-PARSER? */

/* the global buffer where the current token's characters are stored */
extern char *yytext; /* TODO: REMOVE THIS GLOBAL */

#include <string.h>
#include <assert.h>

extern void yyrestart(FILE *in);

/*

Pre-process the file only. Don't do any analysis.

*/
static void
do_pre_process(struct lexer_state *lexer) {
    int token;
    YYSTYPE val;

    do {
        token = yylex(&val, lexer);
        fprintf(stderr, "%s ", yytext);

        /* if we just printed a newline character, the trailing space should be removed:
         * do a carriage-return
         */
        if (strchr(yytext, '\n') != NULL)
            fprintf(stderr, "\r");
    }
    while (token > 0);
}

/*
 * Main compiler driver.
 */
int
main(int argc, char *argv[]) {

    struct lexer_state *lexer = NULL;
    int parse_errors = 0;
    int pre_process = 0;

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    /* skip program name */
    argc--;
    argv++;

    /* very basic argument handling; I'm too lazy to check out
     * the standard funtion for that, right now. This is a TODO. */
    while (argc > 0 && argv[0][0] == '-') {
        switch (argv[0][1]) {
            case 'E':
                pre_process = 1;
                break;
            /* Only allow for debug flag if the generated parser supports it */
#ifdef YYDEBUG
            case 'd':
                yydebug = 1;
                break;
#endif
            default:
                fprintf(stderr, "Unknown option: '%c'\n", argv[0][1]);
                break;
        }
        /* goto next command line argument */
        argv++;
        argc--;
    }

    if (argc < 1) {
        fprintf(stderr, "No input file specified\n");
        exit(EXIT_FAILURE);
    }



    while (argc > 0) {
        fprintf(stderr, "Processing file '%s'\n", argv[0]);

        /* done handling arguments, open the file */
        yyin = fopen(argv[0], "r");

        if (yyin == NULL) {
            fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
            exit(EXIT_FAILURE);
        }

        lexer = new_lexer(argv[0]);
        assert(lexer != NULL);

        if (pre_process) {
            fprintf(stderr, "pre-processing %s\n", argv[0]);
            do_pre_process(lexer);
        }
        else {
            fprintf(stderr, "compiling %s\n", argv[0]);
            yyparse(lexer);

            parse_errors += get_parse_errors(lexer);

            if (parse_errors == 0) {
             fprintf(stderr, "Parse successful!\n");
            }
            else {
                fprintf(stderr, "There %s %d %s in file '%s'\n", parse_errors > 1 ? "were" :
                        "was", parse_errors, parse_errors > 1 ? "errors" : "error",
                        get_current_file(lexer));
            }
        }

        /* close file after processing */
        fclose(yyin);

        /* this is necessary to allow for processing a file after another */
        yyrestart(yyin);


        argc--;
        argv++;
    }

    if (parse_errors > 0)
        fprintf(stderr, "There were %d parse errors in all files\n", parse_errors);


    return 0;
}

/*

*/
int
yyerror(struct lexer_state * const lexer, char const * const message) {

    /* increment parse errors in the lexer structure */
    parse_error(lexer);
    /* emit an error */
    fprintf(stderr, "\nError in file '%s' (line %d): %s ",
            get_current_file(lexer), get_line_nr(lexer), message);

    /* print current token if it's not a newline (or \r\n on windows) */
    if (strcmp(yytext, "\r\n") != 0 || strcmp(yytext, "\n") == 0) {
        fprintf(stderr, "('%s')", yytext);
    }
    else {
        fprintf(stderr, "\n\n");
    }


    return 0;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


