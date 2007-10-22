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
     TK_NL = 258,
     TK_LABEL = 259,
     TK_DOTDOT = 260,
     TK_HEREDOC = 261,
     TK_ENDM = 262,
     TK_HLL = 263,
     TK_HLL_MAP = 264,
     TK_EMIT = 265,
     TK_EOM = 266,
     TK_N_OPERATORS = 267,
     TK_PRAGMA = 268,
     TK_LOADLIB = 269,
     TK_SUB = 270,
     TK_END = 271,
     TK_PARAM = 272,
     TK_LEX = 273,
     TK_LOCAL = 274,
     TK_NAMESPACE = 275,
     TK_ENDNAMESPACE = 276,
     TK_INVOCANT = 277,
     TK_METH_CALL = 278,
     TK_GLOBALCONST = 279,
     TK_CONST = 280,
     TK_RETURN = 281,
     TK_YIELD = 282,
     TK_PCC_BEGIN_YIELD = 283,
     TK_PCC_END_YIELD = 284,
     TK_PCC_BEGIN_RETURN = 285,
     TK_PCC_END_RETURN = 286,
     TK_PCC_BEGIN = 287,
     TK_PCC_END = 288,
     TK_GET_RESULTS = 289,
     TK_PCC_CALL = 290,
     TK_ARG = 291,
     TK_RESULT = 292,
     TK_NCI_CALL = 293,
     TK_IDENT = 294,
     TK_STRINGC = 295,
     TK_INTC = 296,
     TK_NUMC = 297,
     TK_PASM_PREG = 298,
     TK_PASM_NREG = 299,
     TK_PASM_SREG = 300,
     TK_PASM_IREG = 301,
     TK_SYM_PREG = 302,
     TK_SYM_NREG = 303,
     TK_SYM_SREG = 304,
     TK_SYM_IREG = 305,
     TK_PARROT_OP = 306,
     TK_INT = 307,
     TK_NUM = 308,
     TK_PMC = 309,
     TK_STRING = 310,
     TK_NULL = 311,
     TK_IF = 312,
     TK_UNLESS = 313,
     TK_GOTO = 314,
     TK_NEW = 315,
     TK_ARROW = 316,
     TK_NE = 317,
     TK_EQ = 318,
     TK_LT = 319,
     TK_LE = 320,
     TK_GT = 321,
     TK_GE = 322,
     TK_ASSIGN_USHIFT = 323,
     TK_ASSIGN_RSHIFT = 324,
     TK_ASSIGN_LSHIFT = 325,
     TK_USHIFT = 326,
     TK_RSHIFT = 327,
     TK_LSHIFT = 328,
     TK_FDIV = 329,
     TK_OR = 330,
     TK_AND = 331,
     TK_XOR = 332,
     TK_CONC = 333,
     TK_ASSIGN_INC = 334,
     TK_ASSIGN_DEC = 335,
     TK_ASSIGN_MUL = 336,
     TK_ASSIGN_MOD = 337,
     TK_ASSIGN_POW = 338,
     TK_ASSIGN_DIV = 339,
     TK_ASSIGN_BOR = 340,
     TK_ASSIGN_BAND = 341,
     TK_ASSIGN_FDIV = 342,
     TK_ASSIGN_BNOT = 343,
     TK_ASSIGN_CONC = 344,
     TK_FLAG_INIT = 345,
     TK_FLAG_LOAD = 346,
     TK_FLAG_MAIN = 347,
     TK_FLAG_ANON = 348,
     TK_FLAG_METHOD = 349,
     TK_FLAG_OUTER = 350,
     TK_FLAG_VTABLE = 351,
     TK_FLAG_LEX = 352,
     TK_FLAG_MULTI = 353,
     TK_FLAG_POSTCOMP = 354,
     TK_FLAG_IMMEDIATE = 355,
     TK_FLAG_UNIQUE_REG = 356,
     TK_FLAG_NAMED = 357,
     TK_FLAG_SLURPY = 358,
     TK_FLAG_FLAT = 359,
     TK_FLAG_OPTIONAL = 360,
     TK_FLAG_OPT_FLAG = 361
   };
#endif
/* Tokens.  */
#define TK_NL 258
#define TK_LABEL 259
#define TK_DOTDOT 260
#define TK_HEREDOC 261
#define TK_ENDM 262
#define TK_HLL 263
#define TK_HLL_MAP 264
#define TK_EMIT 265
#define TK_EOM 266
#define TK_N_OPERATORS 267
#define TK_PRAGMA 268
#define TK_LOADLIB 269
#define TK_SUB 270
#define TK_END 271
#define TK_PARAM 272
#define TK_LEX 273
#define TK_LOCAL 274
#define TK_NAMESPACE 275
#define TK_ENDNAMESPACE 276
#define TK_INVOCANT 277
#define TK_METH_CALL 278
#define TK_GLOBALCONST 279
#define TK_CONST 280
#define TK_RETURN 281
#define TK_YIELD 282
#define TK_PCC_BEGIN_YIELD 283
#define TK_PCC_END_YIELD 284
#define TK_PCC_BEGIN_RETURN 285
#define TK_PCC_END_RETURN 286
#define TK_PCC_BEGIN 287
#define TK_PCC_END 288
#define TK_GET_RESULTS 289
#define TK_PCC_CALL 290
#define TK_ARG 291
#define TK_RESULT 292
#define TK_NCI_CALL 293
#define TK_IDENT 294
#define TK_STRINGC 295
#define TK_INTC 296
#define TK_NUMC 297
#define TK_PASM_PREG 298
#define TK_PASM_NREG 299
#define TK_PASM_SREG 300
#define TK_PASM_IREG 301
#define TK_SYM_PREG 302
#define TK_SYM_NREG 303
#define TK_SYM_SREG 304
#define TK_SYM_IREG 305
#define TK_PARROT_OP 306
#define TK_INT 307
#define TK_NUM 308
#define TK_PMC 309
#define TK_STRING 310
#define TK_NULL 311
#define TK_IF 312
#define TK_UNLESS 313
#define TK_GOTO 314
#define TK_NEW 315
#define TK_ARROW 316
#define TK_NE 317
#define TK_EQ 318
#define TK_LT 319
#define TK_LE 320
#define TK_GT 321
#define TK_GE 322
#define TK_ASSIGN_USHIFT 323
#define TK_ASSIGN_RSHIFT 324
#define TK_ASSIGN_LSHIFT 325
#define TK_USHIFT 326
#define TK_RSHIFT 327
#define TK_LSHIFT 328
#define TK_FDIV 329
#define TK_OR 330
#define TK_AND 331
#define TK_XOR 332
#define TK_CONC 333
#define TK_ASSIGN_INC 334
#define TK_ASSIGN_DEC 335
#define TK_ASSIGN_MUL 336
#define TK_ASSIGN_MOD 337
#define TK_ASSIGN_POW 338
#define TK_ASSIGN_DIV 339
#define TK_ASSIGN_BOR 340
#define TK_ASSIGN_BAND 341
#define TK_ASSIGN_FDIV 342
#define TK_ASSIGN_BNOT 343
#define TK_ASSIGN_CONC 344
#define TK_FLAG_INIT 345
#define TK_FLAG_LOAD 346
#define TK_FLAG_MAIN 347
#define TK_FLAG_ANON 348
#define TK_FLAG_METHOD 349
#define TK_FLAG_OUTER 350
#define TK_FLAG_VTABLE 351
#define TK_FLAG_LEX 352
#define TK_FLAG_MULTI 353
#define TK_FLAG_POSTCOMP 354
#define TK_FLAG_IMMEDIATE 355
#define TK_FLAG_UNIQUE_REG 356
#define TK_FLAG_NAMED 357
#define TK_FLAG_SLURPY 358
#define TK_FLAG_FLAT 359
#define TK_FLAG_OPTIONAL 360
#define TK_FLAG_OPT_FLAG 361




/* Copy the first part of user declarations.  */
#line 20 "pir.y"


#include <stdio.h>
#include <stdlib.h>

#include "pirparser.h"
#include "pircompiler.h"


struct lexer_state;

extern int yyerror(struct lexer_state *lexer,
                   char *message);


extern int yylex(YYSTYPE *yylval,
                 struct lexer_state *lexer);



/* enable debugging of generated parser */
#define YYDEBUG         1

/* enable slightly more helpful error messages */
#define YYERROR_VERBOSE 1



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
#line 89 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 342 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 355 "pirparser.c"

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
#define YYLAST   447

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  122
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  95
/* YYNRULES -- Number of rules.  */
#define YYNRULES  243
/* YYNRULES -- Number of states.  */
#define YYNSTATES  401

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   361

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   114,     2,     2,     2,   119,     2,     2,
     110,   111,   118,   116,   107,   113,   121,   117,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   120,
       2,   112,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   108,     2,   109,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,   115,     2,     2,     2,
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
     105,   106
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    21,
      23,    25,    27,    29,    31,    33,    37,    40,    45,    50,
      55,    56,    59,    62,    66,    69,    71,    76,    78,    82,
      90,    92,    94,    95,    98,   100,   102,   104,   106,   108,
     110,   115,   118,   123,   125,   127,   128,   132,   134,   136,
     138,   140,   141,   144,   149,   152,   157,   158,   161,   164,
     167,   169,   171,   173,   175,   177,   179,   181,   183,   185,
     187,   189,   191,   193,   195,   197,   199,   202,   208,   212,
     216,   220,   223,   227,   230,   234,   237,   240,   242,   246,
     249,   251,   254,   256,   258,   261,   263,   266,   268,   270,
     272,   274,   276,   278,   280,   282,   284,   286,   288,   290,
     292,   294,   296,   298,   300,   302,   304,   306,   308,   310,
     314,   316,   320,   322,   325,   329,   332,   334,   336,   339,
     343,   347,   351,   356,   358,   362,   364,   367,   373,   375,
     377,   386,   387,   390,   395,   398,   401,   407,   408,   411,
     416,   418,   425,   429,   432,   433,   435,   437,   441,   444,
     445,   448,   450,   452,   454,   457,   459,   461,   463,   465,
     467,   469,   474,   476,   478,   480,   482,   486,   490,   492,
     494,   500,   502,   504,   508,   512,   516,   520,   521,   523,
     525,   529,   532,   536,   542,   543,   546,   551,   552,   555,
     560,   561,   564,   566,   569,   570,   572,   576,   580,   584,
     589,   594,   599,   604,   607,   609,   611,   615,   617,   619,
     621,   623,   625,   627,   629,   631,   633,   635,   637,   639,
     641,   643,   645,   647,   649,   651,   653,   655,   657,   659,
     661,   663,   665,   667
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     123,     0,    -1,   124,   125,   124,    -1,    -1,     3,    -1,
     126,    -1,   125,     3,   126,    -1,   136,    -1,    25,   207,
      -1,   134,    -1,   131,    -1,   129,    -1,   130,    -1,   128,
      -1,   127,    -1,    13,    12,    41,    -1,    14,    40,    -1,
       8,    40,   107,    40,    -1,     9,    40,   107,    40,    -1,
      10,     3,   132,    11,    -1,    -1,   132,   133,    -1,     4,
       3,    -1,     4,    51,     3,    -1,    51,     3,    -1,    20,
      -1,    20,   108,   135,   109,    -1,    40,    -1,   135,   161,
      40,    -1,    15,   137,   138,     3,   142,   145,    16,    -1,
      39,    -1,    40,    -1,    -1,   138,   139,    -1,    93,    -1,
      90,    -1,    91,    -1,    92,    -1,    94,    -1,    97,    -1,
      95,   110,   137,   111,    -1,    96,   205,    -1,    98,   110,
     140,   111,    -1,    99,    -1,   100,    -1,    -1,   140,   107,
     141,    -1,    39,    -1,    40,    -1,   158,    -1,   215,    -1,
      -1,   142,   143,    -1,    17,   144,   181,     3,    -1,   215,
      39,    -1,   215,    40,    61,    39,    -1,    -1,   145,   146,
      -1,     4,     3,    -1,     4,   147,    -1,   147,    -1,   163,
      -1,   164,    -1,   165,    -1,   166,    -1,   169,    -1,   206,
      -1,   187,    -1,   188,    -1,   190,    -1,   170,    -1,   151,
      -1,   150,    -1,   149,    -1,   162,    -1,   148,    -1,     1,
       3,    -1,    34,   110,   178,   111,     3,    -1,    56,    43,
       3,    -1,    56,    47,     3,    -1,    56,    39,     3,    -1,
     185,     3,    -1,   216,   152,     3,    -1,   157,   210,    -1,
     158,   112,   210,    -1,   112,   153,    -1,   155,   210,    -1,
     210,    -1,   210,   156,   210,    -1,   216,   158,    -1,   154,
      -1,    40,   193,    -1,   185,    -1,    56,    -1,    60,    40,
      -1,   162,    -1,   184,   193,    -1,   113,    -1,   114,    -1,
     115,    -1,   116,    -1,   113,    -1,   117,    -1,   118,    -1,
     119,    -1,    78,    -1,    79,    -1,    80,    -1,    81,    -1,
      83,    -1,    84,    -1,    87,    -1,    85,    -1,    86,    -1,
      88,    -1,    89,    -1,    70,    -1,    69,    -1,    68,    -1,
     108,   159,   109,    -1,   160,    -1,   159,   161,   160,    -1,
     210,    -1,   210,     5,    -1,   210,     5,   210,    -1,     5,
     210,    -1,   120,    -1,   107,    -1,    51,     3,    -1,    57,
     208,   165,    -1,    58,   208,   165,    -1,    59,    39,     3,
      -1,    19,   215,   167,     3,    -1,   168,    -1,   167,   107,
     168,    -1,    39,    -1,    39,   101,    -1,    18,    40,   107,
     216,     3,    -1,   171,    -1,   177,    -1,    32,     3,   172,
     174,     3,   175,    33,     3,    -1,    -1,   172,   173,    -1,
      36,   210,   202,     3,    -1,    35,   184,    -1,    38,   184,
      -1,    22,   184,     3,    23,   186,    -1,    -1,   175,   176,
      -1,    37,   216,   181,     3,    -1,   166,    -1,   110,   178,
     111,   112,   183,     3,    -1,    40,   193,     3,    -1,   154,
       3,    -1,    -1,   179,    -1,   180,    -1,   179,   107,   180,
      -1,   216,   181,    -1,    -1,   181,   182,    -1,   105,    -1,
     106,    -1,   103,    -1,   102,   204,    -1,   101,    -1,   154,
      -1,   185,    -1,    47,    -1,    43,    -1,    39,    -1,   184,
     121,   186,   193,    -1,    39,    -1,    40,    -1,    43,    -1,
      47,    -1,    20,    39,     3,    -1,    21,    39,     3,    -1,
     191,    -1,   189,    -1,    30,     3,   200,    31,     3,    -1,
     192,    -1,   197,    -1,    26,   193,     3,    -1,    26,   183,
       3,    -1,    27,   193,     3,    -1,   110,   194,   111,    -1,
      -1,   195,    -1,   196,    -1,   195,   107,   196,    -1,   210,
     202,    -1,    40,    61,   210,    -1,    28,     3,   198,    29,
       3,    -1,    -1,   198,   199,    -1,    27,   210,   202,     3,
      -1,    -1,   200,   201,    -1,    26,   210,   202,     3,    -1,
      -1,   202,   203,    -1,   104,    -1,   102,   204,    -1,    -1,
     205,    -1,   110,    40,   111,    -1,    24,   207,     3,    -1,
      25,   207,     3,    -1,    52,    39,   112,    41,    -1,    53,
      39,   112,    42,    -1,    54,    39,   112,    40,    -1,    55,
      39,   112,    40,    -1,    56,   210,    -1,   210,    -1,   209,
      -1,   210,   214,   210,    -1,    39,    -1,   211,    -1,   212,
      -1,    40,    -1,    41,    -1,    42,    -1,    47,    -1,    48,
      -1,    50,    -1,    49,    -1,   213,    -1,    43,    -1,    44,
      -1,    46,    -1,    45,    -1,    62,    -1,    63,    -1,    64,
      -1,    65,    -1,    67,    -1,    66,    -1,    52,    -1,    53,
      -1,    54,    -1,    55,    -1,   212,    -1,    39,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   112,   112,   118,   119,   122,   123,   126,   127,   128,
     129,   130,   131,   132,   133,   136,   139,   144,   147,   152,
     158,   159,   162,   163,   164,   168,   169,   172,   173,   178,
     184,   185,   188,   189,   192,   193,   194,   195,   196,   197,
     198,   199,   200,   201,   202,   206,   207,   210,   211,   212,
     213,   216,   217,   220,   223,   224,   231,   232,   235,   236,
     237,   240,   241,   242,   243,   244,   245,   246,   247,   248,
     249,   250,   251,   252,   253,   254,   255,   258,   261,   262,
     263,   266,   269,   272,   273,   274,   277,   278,   279,   280,
     281,   282,   283,   284,   285,   286,   290,   293,   294,   295,
     298,   299,   300,   301,   302,   303,   307,   308,   309,   310,
     311,   312,   313,   314,   315,   316,   317,   318,   319,   322,
     325,   326,   329,   330,   331,   332,   335,   336,   339,   342,
     345,   348,   351,   354,   355,   358,   359,   362,   365,   366,
     369,   376,   377,   380,   383,   384,   385,   389,   390,   393,
     394,   397,   398,   399,   402,   403,   406,   407,   410,   413,
     414,   417,   418,   419,   420,   421,   424,   425,   428,   429,
     430,   433,   436,   437,   438,   439,   442,   443,   446,   447,
     450,   456,   457,   460,   461,   464,   467,   470,   471,   474,
     475,   478,   479,   482,   487,   488,   491,   494,   495,   498,
     501,   502,   505,   506,   509,   510,   513,   516,   517,   520,
     521,   522,   523,   526,   527,   528,   531,   533,   534,   535,
     538,   539,   540,   543,   544,   545,   546,   547,   550,   551,
     552,   553,   556,   557,   558,   559,   560,   561,   564,   565,
     566,   567,   570,   571
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "TK_NL", "TK_LABEL", "TK_DOTDOT",
  "TK_HEREDOC", "TK_ENDM", "TK_HLL", "TK_HLL_MAP", "TK_EMIT", "TK_EOM",
  "TK_N_OPERATORS", "TK_PRAGMA", "TK_LOADLIB", "TK_SUB", "TK_END",
  "TK_PARAM", "TK_LEX", "TK_LOCAL", "TK_NAMESPACE", "TK_ENDNAMESPACE",
  "TK_INVOCANT", "TK_METH_CALL", "TK_GLOBALCONST", "TK_CONST", "TK_RETURN",
  "TK_YIELD", "TK_PCC_BEGIN_YIELD", "TK_PCC_END_YIELD",
  "TK_PCC_BEGIN_RETURN", "TK_PCC_END_RETURN", "TK_PCC_BEGIN", "TK_PCC_END",
  "TK_GET_RESULTS", "TK_PCC_CALL", "TK_ARG", "TK_RESULT", "TK_NCI_CALL",
  "TK_IDENT", "TK_STRINGC", "TK_INTC", "TK_NUMC", "TK_PASM_PREG",
  "TK_PASM_NREG", "TK_PASM_SREG", "TK_PASM_IREG", "TK_SYM_PREG",
  "TK_SYM_NREG", "TK_SYM_SREG", "TK_SYM_IREG", "TK_PARROT_OP", "TK_INT",
  "TK_NUM", "TK_PMC", "TK_STRING", "TK_NULL", "TK_IF", "TK_UNLESS",
  "TK_GOTO", "TK_NEW", "TK_ARROW", "TK_NE", "TK_EQ", "TK_LT", "TK_LE",
  "TK_GT", "TK_GE", "TK_ASSIGN_USHIFT", "TK_ASSIGN_RSHIFT",
  "TK_ASSIGN_LSHIFT", "TK_USHIFT", "TK_RSHIFT", "TK_LSHIFT", "TK_FDIV",
  "TK_OR", "TK_AND", "TK_XOR", "TK_CONC", "TK_ASSIGN_INC", "TK_ASSIGN_DEC",
  "TK_ASSIGN_MUL", "TK_ASSIGN_MOD", "TK_ASSIGN_POW", "TK_ASSIGN_DIV",
  "TK_ASSIGN_BOR", "TK_ASSIGN_BAND", "TK_ASSIGN_FDIV", "TK_ASSIGN_BNOT",
  "TK_ASSIGN_CONC", "TK_FLAG_INIT", "TK_FLAG_LOAD", "TK_FLAG_MAIN",
  "TK_FLAG_ANON", "TK_FLAG_METHOD", "TK_FLAG_OUTER", "TK_FLAG_VTABLE",
  "TK_FLAG_LEX", "TK_FLAG_MULTI", "TK_FLAG_POSTCOMP", "TK_FLAG_IMMEDIATE",
  "TK_FLAG_UNIQUE_REG", "TK_FLAG_NAMED", "TK_FLAG_SLURPY", "TK_FLAG_FLAT",
  "TK_FLAG_OPTIONAL", "TK_FLAG_OPT_FLAG", "','", "'['", "']'", "'('",
  "')'", "'='", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'", "';'",
  "'.'", "$accept", "program", "opt_nl", "compilation_units",
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
  "opt_paren_string", "paren_string", "const_declaration", "const_tail",
  "condition", "conditional_expression", "expression", "constant", "reg",
  "pasm_reg", "rel_op", "type", "target", 0
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
     355,   356,   357,   358,   359,   360,   361,    44,    91,    93,
      40,    41,    61,    45,    33,   126,    43,    47,    42,    37,
      59,    46
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   122,   123,   124,   124,   125,   125,   126,   126,   126,
     126,   126,   126,   126,   126,   127,   128,   129,   130,   131,
     132,   132,   133,   133,   133,   134,   134,   135,   135,   136,
     137,   137,   138,   138,   139,   139,   139,   139,   139,   139,
     139,   139,   139,   139,   139,   140,   140,   141,   141,   141,
     141,   142,   142,   143,   144,   144,   145,   145,   146,   146,
     146,   147,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   147,   148,   149,   149,
     149,   150,   151,   152,   152,   152,   153,   153,   153,   153,
     153,   153,   153,   153,   153,   153,   154,   155,   155,   155,
     156,   156,   156,   156,   156,   156,   157,   157,   157,   157,
     157,   157,   157,   157,   157,   157,   157,   157,   157,   158,
     159,   159,   160,   160,   160,   160,   161,   161,   162,   163,
     164,   165,   166,   167,   167,   168,   168,   169,   170,   170,
     171,   172,   172,   173,   174,   174,   174,   175,   175,   176,
     176,   177,   177,   177,   178,   178,   179,   179,   180,   181,
     181,   182,   182,   182,   182,   182,   183,   183,   184,   184,
     184,   185,   186,   186,   186,   186,   187,   187,   188,   188,
     189,   190,   190,   191,   191,   192,   193,   194,   194,   195,
     195,   196,   196,   197,   198,   198,   199,   200,   200,   201,
     202,   202,   203,   203,   204,   204,   205,   206,   206,   207,
     207,   207,   207,   208,   208,   208,   209,   210,   210,   210,
     211,   211,   211,   212,   212,   212,   212,   212,   213,   213,
     213,   213,   214,   214,   214,   214,   214,   214,   215,   215,
     215,   215,   216,   216
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     2,     1,
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
       0,     2,     1,     2,     0,     1,     3,     3,     3,     4,
       4,     4,     4,     2,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    25,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     0,     0,    20,     0,    16,    30,    31,    32,
       0,     0,     0,     0,     0,     8,     4,     2,     0,     0,
       0,    15,     0,    27,     0,     0,     0,     0,     0,     6,
      17,    18,     0,    19,     0,    21,    51,    35,    36,    37,
      34,    38,     0,     0,    39,     0,    43,    44,    33,   127,
      26,   126,     0,     0,     0,     0,     0,    22,     0,    24,
      56,     0,     0,    41,    45,    28,   209,   210,   211,   212,
      23,     0,    52,     0,     0,     0,     0,   238,   239,   240,
     241,   159,     0,     0,     0,    29,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   243,     0,
     228,   229,   231,   230,   223,   224,   226,   225,     0,     0,
       0,     0,     0,   154,    57,    60,    75,    73,    72,    71,
       0,    74,    61,    62,    63,    64,    65,    70,   138,   139,
       0,     0,    67,    68,   179,    69,   178,   181,   182,    66,
     242,   227,     0,    40,   206,     0,    42,     0,    54,     0,
      76,    58,    59,     0,     0,     0,     0,     0,     0,   170,
     169,   168,   187,   166,     0,   167,     0,     0,   194,   197,
     141,   154,     0,   128,     0,     0,     0,   217,   220,   221,
     222,   228,   223,     0,     0,   215,   214,   218,   219,     0,
       0,   243,     0,   155,   156,   159,   153,     0,    96,    81,
     118,   117,   116,   106,   107,   108,   109,   110,   112,   113,
     111,   114,   115,     0,     0,     0,     0,     0,    47,    48,
      46,    49,    50,    53,   165,   204,   163,   161,   162,   160,
       0,     0,   135,     0,   133,   176,   177,   207,   208,   220,
       0,   188,   189,   200,   184,   183,   185,     0,     0,     0,
       0,   152,    80,    78,    79,   213,   129,   232,   233,   234,
     235,   237,   236,     0,   130,   131,     0,     0,   158,   172,
     173,   174,   175,     0,     0,     0,   120,   122,   217,   220,
      93,     0,    97,    98,    99,    85,    90,     0,    95,    92,
      87,   219,     0,    82,    83,     0,   164,   205,    55,     0,
     136,   132,     0,     0,   186,     0,   191,     0,     0,   195,
       0,     0,   198,     0,     0,     0,     0,   142,     0,     0,
     216,     0,   157,   171,   125,   119,     0,   123,    91,    94,
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
      40,    55,    20,    44,    21,    29,    42,    68,    96,   240,
      80,    92,   101,    93,   134,   135,   136,   137,   138,   139,
     235,   305,   140,   307,   357,   236,   237,   295,   296,    72,
     141,   142,   143,   144,   145,   253,   254,   146,   147,   148,
     269,   337,   338,   386,   395,   149,   212,   213,   214,   167,
     249,   184,   150,   151,   293,   152,   153,   154,   155,   156,
     157,   186,   260,   261,   262,   158,   267,   329,   268,   332,
     326,   366,   316,   317,   159,    35,   204,   205,   206,   207,
     208,   161,   283,   102,   215
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -288
static const yytype_int16 yypact[] =
{
      36,  -288,    49,   249,  -288,    19,    41,   104,   120,    95,
      57,    31,   282,   141,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,  -288,    48,    68,  -288,   139,  -288,  -288,  -288,  -288,
     145,   147,   163,   167,   168,  -288,   249,  -288,   169,   172,
      22,  -288,   143,  -288,   -78,   101,   111,   112,   113,  -288,
    -288,  -288,    16,  -288,   223,  -288,  -288,  -288,  -288,  -288,
    -288,  -288,   150,   156,  -288,   160,  -288,  -288,  -288,  -288,
    -288,  -288,   251,   258,   272,   275,   276,  -288,   335,  -288,
     347,    57,   328,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,   319,  -288,    44,   265,   266,   -84,  -288,  -288,  -288,
    -288,  -288,    83,   372,   171,  -288,   338,   319,   340,   341,
     282,   282,   -25,   271,   379,   380,   381,   277,   -89,   271,
     -86,  -288,  -288,  -288,   -74,  -288,  -288,  -288,   382,   161,
     283,   283,   349,   117,  -288,  -288,  -288,  -288,  -288,  -288,
     383,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
     -64,   386,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,  -288,   209,  -288,  -288,    -2,  -288,    12,  -288,   329,
    -288,  -288,  -288,   284,   353,   390,   391,   392,   393,  -288,
    -288,  -288,   301,  -288,   394,  -288,   395,   396,  -288,  -288,
    -288,   117,   397,  -288,   398,   399,   400,  -288,  -288,  -288,
    -288,  -288,  -288,   313,   345,  -288,   220,  -288,  -288,   345,
     402,  -288,   295,   300,  -288,  -288,  -288,   233,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,  -288,  -288,   263,   205,   405,   313,   297,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,   156,  -288,  -288,  -288,  -288,
     371,   117,   310,     5,  -288,  -288,  -288,  -288,  -288,   351,
     302,   307,  -288,  -288,  -288,  -288,  -288,    50,    35,    98,
     304,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,  -288,
    -288,  -288,  -288,   313,  -288,  -288,   305,   117,   264,  -288,
    -288,  -288,  -288,   271,   313,   -66,  -288,   411,    30,   271,
    -288,   378,  -288,  -288,  -288,  -288,  -288,   313,  -288,  -288,
      65,   311,   312,  -288,  -288,   313,  -288,  -288,  -288,   418,
    -288,  -288,   353,   313,  -288,   301,    46,   313,   419,  -288,
     313,   420,  -288,   228,   228,   313,   228,  -288,   421,   422,
    -288,   228,  -288,  -288,  -288,  -288,   263,   313,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,  -288,  -288,   313,  -288,  -288,
    -288,  -288,  -288,  -288,   156,  -288,  -288,  -288,  -288,  -288,
    -288,   423,  -288,  -288,  -288,  -288,  -288,   424,  -288,  -288,
    -288,  -288,     6,     7,   406,    17,    -3,  -288,  -288,  -288,
     233,  -288,   425,   117,  -288,  -288,  -288,  -288,  -288,    25,
    -288
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -288,  -288,   417,  -288,   401,  -288,  -288,  -288,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,   350,  -288,  -288,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,   330,  -288,  -288,  -288,  -288,
    -288,  -288,  -110,  -288,  -288,  -288,  -159,  -288,    86,   138,
     201,  -288,  -288,  -105,    52,  -288,   114,  -288,  -288,  -288,
    -288,  -288,  -288,  -288,  -288,  -288,   248,  -288,   153,  -210,
    -288,   100,  -163,  -109,    53,  -288,  -288,  -288,  -288,  -288,
    -288,  -106,  -288,  -288,   119,  -288,  -288,  -288,  -288,  -288,
    -287,  -288,    78,   384,  -288,    66,   314,  -288,  -178,  -288,
     -93,  -288,  -288,   -90,   -92
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -244
static const yytype_int16 yytable[] =
{
     160,   162,   183,   185,   263,   288,   241,   187,   321,   388,
     389,   160,   162,   192,   179,   243,   107,   174,   180,    77,
     391,  -170,   181,   165,  -169,   275,    52,   166,   400,    69,
     392,    70,  -170,    53,   393,  -169,  -168,   238,   239,     1,
     160,    69,    71,   345,   218,   103,   182,  -168,   104,     4,
      97,    98,    99,   100,    71,   297,   310,   217,   314,    22,
     105,   330,   106,   107,   108,   109,   331,    78,   110,   111,
     112,   113,   114,    54,   115,   242,   116,   327,   117,   328,
     382,    23,   383,   118,   119,   182,   385,   120,   121,   122,
     123,   124,   125,   126,   127,   128,    27,    28,   160,   276,
     129,   130,   131,   132,   284,   340,   233,    24,   364,   364,
     365,   365,   322,   244,   245,   246,   344,   247,   248,   364,
     333,   365,   168,   169,   306,   309,   244,   245,   246,   350,
     247,   248,    25,   334,   335,    26,   336,   359,  -243,    30,
    -170,   311,   312,   351,    36,   362,    56,   263,   364,   367,
     365,  -170,   369,   358,   133,    38,   211,   373,   160,   319,
     201,   121,   122,   123,   202,   125,   126,   127,   297,   379,
     371,   372,   103,   374,   171,    39,   177,   178,   352,   380,
      41,   353,   354,   355,   356,    43,    45,   343,   399,   106,
     107,   108,   109,   348,   160,   110,   111,   112,   113,   114,
     194,   115,    46,   116,   195,   117,    47,    48,   196,    50,
     118,   119,    51,    73,   120,   121,   122,   123,   124,   125,
     126,   127,   128,    74,    75,    76,    79,   129,   130,   131,
     132,   183,   185,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,   298,   299,   199,   200,   120,   121,
     122,   123,   124,   125,   126,   127,   128,     5,     6,     7,
      81,   300,     8,     9,    10,   301,    82,   179,   294,    11,
      84,   180,   289,   290,    12,   181,   291,   220,   221,   222,
     292,   133,   277,   278,   279,   280,   281,   282,   223,   224,
     225,    85,   226,   227,   228,   229,   230,   231,   232,    86,
     160,   398,   197,   198,   199,   200,   201,   121,   122,   123,
     202,   125,   126,   127,    87,    88,    89,   233,   302,   303,
     304,   234,   197,   198,   199,   200,   201,   121,   122,   123,
     202,   125,   126,   127,    31,    32,    33,    34,    90,   203,
     197,   259,   199,   200,   201,   121,   122,   123,   202,   125,
     126,   127,   197,   198,   199,   200,   201,   121,   122,   123,
     202,   125,   126,   127,    91,   244,   245,   246,    95,   247,
     248,    97,    98,    99,   100,   170,   163,   164,   173,   175,
     176,   182,   188,   189,   190,   193,   216,   191,   210,   219,
     250,   251,   252,   255,   256,   257,   258,   264,   265,   266,
     271,   272,   273,   274,   132,   285,   286,   287,   313,   315,
     318,   320,   323,   324,   325,   339,   347,   341,   349,  -242,
     233,   360,   368,   370,   375,   376,   384,   387,   397,   390,
      37,    94,   378,   346,   172,   308,   361,    49,   394,   270,
     342,   377,   381,   396,   363,   209,     0,    83
};

static const yytype_int16 yycheck[] =
{
      93,    93,   112,   112,   182,   215,   165,   113,     3,     3,
       3,   104,   104,   119,    39,     3,    19,   107,    43,     3,
       3,   110,    47,   107,   110,   203,     4,   111,     3,   107,
      33,   109,   121,    11,    37,   121,   110,    39,    40,     3,
     133,   107,   120,   109,   150,     1,   110,   121,     4,     0,
      52,    53,    54,    55,   120,   233,   234,   121,   236,    40,
      16,    26,    18,    19,    20,    21,    31,    51,    24,    25,
      26,    27,    28,    51,    30,   165,    32,    27,    34,    29,
     367,    40,   369,    39,    40,   110,   373,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    39,    40,   191,   204,
      56,    57,    58,    59,   209,   283,   108,     3,   102,   102,
     104,   104,   107,   101,   102,   103,   294,   105,   106,   102,
      22,   104,    39,    40,   234,   234,   101,   102,   103,   307,
     105,   106,    12,    35,    36,    40,    38,   315,   108,   108,
     110,   234,   234,    78,     3,   323,     3,   325,   102,   327,
     104,   121,   330,   312,   110,   107,    39,   335,   251,   251,
      43,    44,    45,    46,    47,    48,    49,    50,   346,   347,
     333,   334,     1,   336,     3,   107,   110,   111,   113,   357,
      41,   116,   117,   118,   119,    40,    39,   293,   398,    18,
      19,    20,    21,   299,   287,    24,    25,    26,    27,    28,
      39,    30,    39,    32,    43,    34,    39,    39,    47,    40,
      39,    40,    40,   112,    43,    44,    45,    46,    47,    48,
      49,    50,    51,   112,   112,   112,     3,    56,    57,    58,
      59,   341,   341,    90,    91,    92,    93,    94,    95,    96,
      97,    98,    99,   100,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,     8,     9,    10,
     110,    56,    13,    14,    15,    60,   110,    39,     5,    20,
     110,    43,    39,    40,    25,    47,    43,    68,    69,    70,
      47,   110,    62,    63,    64,    65,    66,    67,    79,    80,
      81,    40,    83,    84,    85,    86,    87,    88,    89,    41,
     393,   393,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    42,    40,    40,   108,   113,   114,
     115,   112,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    52,    53,    54,    55,     3,    56,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    17,   101,   102,   103,    40,   105,
     106,    52,    53,    54,    55,     3,   111,   111,    40,    39,
      39,   110,     3,     3,     3,     3,     3,   110,    39,     3,
      61,   107,    39,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,    59,     3,   111,   107,     3,   112,
      39,   101,    61,   111,   107,   111,     5,   112,    40,   108,
     108,     3,     3,     3,     3,     3,     3,     3,     3,    23,
      13,    81,   346,   295,   104,   234,   322,    36,   386,   191,
     287,   341,   364,   390,   325,   131,    -1,    63
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,   123,   124,     0,     8,     9,    10,    13,    14,
      15,    20,    25,   125,   126,   127,   128,   129,   130,   131,
     134,   136,    40,    40,     3,    12,    40,    39,    40,   137,
     108,    52,    53,    54,    55,   207,     3,   124,   107,   107,
     132,    41,   138,    40,   135,    39,    39,    39,    39,   126,
      40,    40,     4,    11,    51,   133,     3,    90,    91,    92,
      93,    94,    95,    96,    97,    98,    99,   100,   139,   107,
     109,   120,   161,   112,   112,   112,   112,     3,    51,     3,
     142,   110,   110,   205,   110,    40,    41,    42,    40,    40,
       3,    17,   143,   145,   137,    40,   140,    52,    53,    54,
      55,   144,   215,     1,     4,    16,    18,    19,    20,    21,
      24,    25,    26,    27,    28,    30,    32,    34,    39,    40,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    56,
      57,    58,    59,   110,   146,   147,   148,   149,   150,   151,
     154,   162,   163,   164,   165,   166,   169,   170,   171,   177,
     184,   185,   187,   188,   189,   190,   191,   192,   197,   206,
     212,   213,   216,   111,   111,   107,   111,   181,    39,    40,
       3,     3,   147,    40,   215,    39,    39,   207,   207,    39,
      43,    47,   110,   154,   183,   185,   193,   193,     3,     3,
       3,   110,   193,     3,    39,    43,    47,    39,    40,    41,
      42,    43,    47,    56,   208,   209,   210,   211,   212,   208,
      39,    39,   178,   179,   180,   216,     3,   121,   193,     3,
      68,    69,    70,    79,    80,    81,    83,    84,    85,    86,
      87,    88,    89,   108,   112,   152,   157,   158,    39,    40,
     141,   158,   215,     3,   101,   102,   103,   105,   106,   182,
      61,   107,    39,   167,   168,     3,     3,     3,     3,    40,
     194,   195,   196,   210,     3,     3,     3,   198,   200,   172,
     178,     3,     3,     3,     3,   210,   165,    62,    63,    64,
      65,    66,    67,   214,   165,     3,   111,   107,   181,    39,
      40,    43,    47,   186,     5,   159,   160,   210,    39,    40,
      56,    60,   113,   114,   115,   153,   154,   155,   162,   185,
     210,   212,   216,     3,   210,   112,   204,   205,    39,   216,
     101,     3,   107,    61,   111,   107,   202,    27,    29,   199,
      26,    31,   201,    22,    35,    36,    38,   173,   174,   111,
     210,   112,   180,   193,   210,   109,   161,     5,   193,    40,
     210,    78,   113,   116,   117,   118,   119,   156,   158,   210,
       3,   168,   210,   196,   102,   104,   203,   210,     3,   210,
       3,   184,   184,   210,   184,     3,     3,   183,   160,   210,
     210,   204,   202,   202,     3,   202,   175,     3,     3,     3,
      23,     3,    33,    37,   166,   176,   186,     3,   216,   181,
       3
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
        case 2:
#line 115 "pir.y"
    { fprintf(stderr, "program.\n"); ;}
    break;

  case 76:
#line 255 "pir.y"
    { yyerrok; ;}
    break;

  case 220:
#line 538 "pir.y"
    { fprintf(stderr, "TK_STRINGC: [%s]\n", yylval.sval); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2013 "pirparser.c"
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


#line 574 "pir.y"


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
    while (token);
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
        exit(1);
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
        exit(1);
    }



    while (argc > 0) {
        fprintf(stderr, "Processing file '%s'\n", argv[0]);

        /* done handling arguments, open the file */
        yyin = fopen(argv[0], "r");
        if (yyin == NULL) {
            fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
            exit(1);
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
yyerror(struct lexer_state *lexer, char *message) {

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


