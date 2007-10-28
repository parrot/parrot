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
     TK_MACRO_PARAM = 258,
     TK_LABEL = 259,
     TK_DOTDOT = 260,
     TK_ENDM = 261,
     TK_NL = 262,
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
     TK_IF = 311,
     TK_UNLESS = 312,
     TK_NULL = 313,
     TK_GOTO = 314,
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
#define TK_MACRO_PARAM 258
#define TK_LABEL 259
#define TK_DOTDOT 260
#define TK_ENDM 261
#define TK_NL 262
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
#define TK_IF 311
#define TK_UNLESS 312
#define TK_NULL 313
#define TK_GOTO 314
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

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval,  yyscan_t yyscanner)

#include "pirlexer.h"




/* declare yylex() */
extern YY_DECL;

extern int yyerror(yyscan_t yyscanner,
                   struct lexer_state * const lexer, char const * const message);

extern struct lexer_state *new_lexer(char * const filename);





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
#line 190 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 383 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 396 "pirparser.c"

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
#define YYLAST   496

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  121
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  101
/* YYNRULES -- Number of rules.  */
#define YYNRULES  250
/* YYNRULES -- Number of states.  */
#define YYNSTATES  404

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
      54,    55,    58,    61,    64,    66,    70,    72,    77,    79,
      83,    91,    93,    95,    96,    99,   101,   103,   105,   107,
     109,   111,   116,   119,   124,   126,   128,   129,   133,   135,
     137,   139,   141,   142,   145,   150,   153,   158,   159,   162,
     165,   168,   170,   172,   174,   176,   178,   180,   182,   184,
     186,   188,   190,   192,   194,   196,   198,   200,   203,   207,
     212,   218,   221,   225,   228,   232,   235,   238,   240,   244,
     247,   249,   252,   254,   256,   259,   260,   262,   264,   268,
     270,   273,   275,   277,   279,   281,   283,   285,   287,   289,
     291,   293,   295,   297,   299,   301,   303,   305,   307,   309,
     311,   313,   315,   317,   321,   323,   327,   329,   332,   336,
     339,   341,   343,   347,   351,   355,   360,   362,   366,   368,
     371,   373,   375,   381,   383,   385,   394,   395,   398,   403,
     406,   409,   415,   416,   419,   424,   426,   433,   437,   440,
     441,   443,   445,   449,   452,   453,   456,   458,   460,   462,
     465,   467,   469,   471,   473,   475,   477,   482,   484,   486,
     488,   490,   492,   494,   498,   502,   504,   506,   512,   514,
     516,   520,   524,   528,   532,   533,   535,   537,   541,   544,
     548,   554,   555,   558,   563,   564,   567,   572,   573,   576,
     578,   581,   582,   584,   588,   591,   594,   598,   603,   608,
     613,   618,   621,   623,   625,   629,   631,   633,   635,   637,
     639,   641,   643,   645,   647,   649,   651,   653,   655,   657,
     659,   661,   663,   665,   667,   669,   671,   673,   675,   677,
     679
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     122,     0,    -1,   123,   124,   123,    -1,    -1,     7,    -1,
     125,    -1,   124,     7,   125,    -1,   136,    -1,   210,    -1,
     134,    -1,   130,    -1,   128,    -1,   129,    -1,   127,    -1,
     126,    -1,    13,    12,    41,    -1,    14,    40,    -1,     8,
      40,   106,    40,    -1,     9,    40,   106,    40,    -1,    10,
       7,   131,    11,    -1,    -1,   131,   132,    -1,     4,     7,
      -1,     4,   133,    -1,   133,    -1,    51,   155,     7,    -1,
      20,    -1,    20,   107,   135,   108,    -1,    40,    -1,   135,
     165,    40,    -1,    15,   137,   138,     7,   142,   145,    16,
      -1,   172,    -1,    40,    -1,    -1,   138,   139,    -1,    92,
      -1,    89,    -1,    90,    -1,    91,    -1,    93,    -1,    96,
      -1,    94,   109,   137,   110,    -1,    95,   208,    -1,    97,
     109,   140,   110,    -1,    98,    -1,    99,    -1,    -1,   140,
     106,   141,    -1,   172,    -1,    40,    -1,   162,    -1,   220,
      -1,    -1,   142,   143,    -1,    17,   144,   185,     7,    -1,
     220,   172,    -1,   220,    40,    60,   172,    -1,    -1,   145,
     146,    -1,     4,     7,    -1,     4,   147,    -1,   147,    -1,
     166,    -1,   167,    -1,   168,    -1,   169,    -1,   173,    -1,
     211,    -1,   191,    -1,   192,    -1,   194,    -1,   174,    -1,
     151,    -1,   150,    -1,   133,    -1,   149,    -1,   148,    -1,
       1,     7,    -1,    58,   221,     7,    -1,   221,   111,    58,
       7,    -1,    34,   109,   182,   110,     7,    -1,   189,     7,
      -1,   221,   152,     7,    -1,   161,   215,    -1,   162,   111,
     215,    -1,   111,   153,    -1,   159,   215,    -1,   215,    -1,
     215,   160,   215,    -1,   221,   162,    -1,   158,    -1,    40,
     197,    -1,   189,    -1,   154,    -1,    51,   156,    -1,    -1,
     156,    -1,   157,    -1,   156,   106,   157,    -1,   215,    -1,
     188,   197,    -1,   112,    -1,   113,    -1,   114,    -1,   115,
      -1,   112,    -1,   116,    -1,   117,    -1,   118,    -1,    74,
      -1,    78,    -1,    79,    -1,    80,    -1,    82,    -1,    83,
      -1,    86,    -1,    84,    -1,    85,    -1,    87,    -1,    88,
      -1,    76,    -1,    77,    -1,    75,    -1,   107,   163,   108,
      -1,   164,    -1,   163,   165,   164,    -1,   215,    -1,   215,
       5,    -1,   215,     5,   215,    -1,     5,   215,    -1,   119,
      -1,   106,    -1,    56,   213,   168,    -1,    57,   213,   168,
      -1,    59,   172,     7,    -1,    19,   220,   170,     7,    -1,
     171,    -1,   170,   106,   171,    -1,   172,    -1,   172,   100,
      -1,    39,    -1,    51,    -1,    18,    40,   106,   221,     7,
      -1,   175,    -1,   181,    -1,    32,     7,   176,   178,     7,
     179,    33,     7,    -1,    -1,   176,   177,    -1,    36,   215,
     206,     7,    -1,    35,   188,    -1,    38,   188,    -1,    22,
     188,     7,    23,   190,    -1,    -1,   179,   180,    -1,    37,
     221,   185,     7,    -1,   169,    -1,   109,   182,   110,   111,
     187,     7,    -1,    40,   197,     7,    -1,   158,     7,    -1,
      -1,   183,    -1,   184,    -1,   183,   106,   184,    -1,   221,
     185,    -1,    -1,   185,   186,    -1,   104,    -1,   105,    -1,
     102,    -1,   101,   208,    -1,   100,    -1,   158,    -1,   189,
      -1,    47,    -1,    43,    -1,   172,    -1,   188,   120,   190,
     197,    -1,   172,    -1,    40,    -1,    49,    -1,    45,    -1,
      43,    -1,    47,    -1,    20,   172,     7,    -1,    21,   172,
       7,    -1,   195,    -1,   193,    -1,    30,     7,   204,    31,
       7,    -1,   196,    -1,   201,    -1,    26,   197,     7,    -1,
      26,   187,     7,    -1,    27,   197,     7,    -1,   109,   198,
     110,    -1,    -1,   199,    -1,   200,    -1,   199,   106,   200,
      -1,   215,   206,    -1,    40,    60,   215,    -1,    28,     7,
     202,    29,     7,    -1,    -1,   202,   203,    -1,    27,   215,
     206,     7,    -1,    -1,   204,   205,    -1,    26,   215,   206,
       7,    -1,    -1,   206,   207,    -1,   103,    -1,   101,   208,
      -1,    -1,   209,    -1,   109,    40,   110,    -1,    25,   212,
      -1,   210,     7,    -1,    24,   212,     7,    -1,    52,   172,
     111,    41,    -1,    53,   172,   111,    42,    -1,    54,   172,
     111,    40,    -1,    55,   172,   111,    40,    -1,    58,   215,
      -1,   215,    -1,   214,    -1,   215,   219,   215,    -1,   221,
      -1,   216,    -1,    40,    -1,    41,    -1,    42,    -1,    47,
      -1,    48,    -1,    50,    -1,    49,    -1,   218,    -1,    43,
      -1,    44,    -1,    46,    -1,    45,    -1,    61,    -1,    62,
      -1,    63,    -1,    64,    -1,    66,    -1,    65,    -1,    52,
      -1,    53,    -1,    54,    -1,    55,    -1,   217,    -1,   172,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   224,   224,   229,   230,   233,   234,   237,   238,   239,
     240,   241,   242,   243,   244,   247,   250,   255,   258,   263,
     269,   270,   273,   274,   275,   278,   283,   284,   287,   288,
     293,   299,   300,   303,   304,   307,   308,   309,   310,   311,
     312,   313,   314,   315,   316,   317,   320,   321,   324,   325,
     326,   327,   330,   331,   334,   337,   338,   344,   345,   349,
     350,   351,   354,   355,   356,   357,   358,   359,   360,   361,
     362,   363,   364,   365,   366,   367,   368,   369,   372,   373,
     376,   379,   382,   385,   386,   387,   390,   391,   392,   393,
     394,   395,   396,   397,   401,   404,   405,   408,   409,   412,
     416,   419,   420,   421,   424,   425,   426,   427,   428,   429,
     433,   434,   435,   436,   437,   438,   439,   440,   441,   442,
     443,   444,   445,   448,   451,   452,   455,   456,   457,   458,
     461,   462,   466,   469,   472,   475,   478,   479,   482,   483,
     486,   487,   490,   493,   494,   497,   504,   505,   508,   511,
     512,   513,   517,   518,   521,   522,   525,   526,   527,   530,
     531,   534,   535,   538,   541,   542,   545,   546,   547,   548,
     549,   552,   553,   556,   557,   558,   561,   564,   565,   566,
     567,   568,   569,   572,   573,   576,   577,   580,   586,   587,
     590,   591,   594,   597,   600,   601,   604,   605,   608,   609,
     612,   617,   618,   621,   624,   625,   628,   631,   632,   635,
     636,   639,   640,   643,   646,   649,   650,   653,   654,   655,
     656,   659,   660,   661,   664,   667,   668,   672,   673,   674,
     677,   678,   679,   680,   681,   685,   686,   687,   688,   691,
     692,   693,   694,   695,   696,   699,   700,   701,   702,   705,
     706
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "TK_MACRO_PARAM", "\"label\"", "\"..\"",
  "\".endm\"", "\"\\n\"", "\".HLL\"", "\".HLL_map\"", "\".emit\"",
  "\".eom\"", "\"n_operators\"", "\".pragma\"", "\".loadlib\"", "\".sub\"",
  "\".end\"", "\".param\"", "\".lex\"", "\".local\"", "\".namespace\"",
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
  "\"parrot op\"", "\"int\"", "\"num\"", "\"pmc\"", "\"string\"", "\"if\"",
  "\"unless\"", "\"null\"", "\"goto\"", "\"=>\"", "\"!=\"", "\"==\"",
  "\"<\"", "\"<=\"", "\">\"", "\">=\"", "\">>>\"", "\">>\"", "\"<<\"",
  "\"//\"", "\"||\"", "\"&&\"", "\"^\"", "\".\"", "\">>>=\"", "\">>=\"",
  "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"", "\"/=\"",
  "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"", "\".=\"", "\":init\"",
  "\":load\"", "\":main\"", "\":anon\"", "\":method\"", "\":outer\"",
  "\":vtable\"", "\":lex\"", "\":multi\"", "\":postcomp\"",
  "\":immediate\"", "\":unique_reg\"", "\":named\"", "\":slurpy\"",
  "\":flat\"", "\":optional\"", "\":opt_flag\"", "','", "'['", "']'",
  "'('", "')'", "'='", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'",
  "';'", "'.'", "$accept", "program", "opt_nl", "compilation_units",
  "compilation_unit", "pir_pragma", "loadlib", "hll_specifier",
  "hll_mapping", "emit_block", "pasm_instructions", "pasm_instruction",
  "parrot_statement", "namespace_declaration", "namespace_id",
  "sub_definition", "sub_id", "sub_flags", "sub_flag", "multi_type_list",
  "multi_type", "parameters", "parameter", "param_def", "instructions",
  "labeled_instruction", "instruction", "null_statement",
  "getresults_statement", "methodcall_statement", "assignment_statement",
  "assignment_tail", "assignment_expression", "parrot_instruction",
  "opt_parrot_op_args", "parrot_op_args", "parrot_op_arg",
  "simple_invocation", "unop", "binop", "augmented_op", "keylist", "keys",
  "key", "separator", "if_statement", "unless_statement", "goto_statement",
  "local_declaration", "local_id_list", "local_id", "identifier",
  "lex_declaration", "invocation_statement", "long_invocation_statement",
  "long_arguments", "long_argument", "long_invocation", "long_results",
  "long_result", "short_invocation_statement", "opt_target_list",
  "target_list", "result_target", "param_flags", "param_flag",
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
     131,   131,   132,   132,   132,   133,   134,   134,   135,   135,
     136,   137,   137,   138,   138,   139,   139,   139,   139,   139,
     139,   139,   139,   139,   139,   139,   140,   140,   141,   141,
     141,   141,   142,   142,   143,   144,   144,   145,   145,   146,
     146,   146,   147,   147,   147,   147,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   147,   147,   148,   148,
     149,   150,   151,   152,   152,   152,   153,   153,   153,   153,
     153,   153,   153,   153,   154,   155,   155,   156,   156,   157,
     158,   159,   159,   159,   160,   160,   160,   160,   160,   160,
     161,   161,   161,   161,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   162,   163,   163,   164,   164,   164,   164,
     165,   165,   166,   167,   168,   169,   170,   170,   171,   171,
     172,   172,   173,   174,   174,   175,   176,   176,   177,   178,
     178,   178,   179,   179,   180,   180,   181,   181,   181,   182,
     182,   183,   183,   184,   185,   185,   186,   186,   186,   186,
     186,   187,   187,   188,   188,   188,   189,   190,   190,   190,
     190,   190,   190,   191,   191,   192,   192,   193,   194,   194,
     195,   195,   196,   197,   198,   198,   199,   199,   200,   200,
     201,   202,   202,   203,   204,   204,   205,   206,   206,   207,
     207,   208,   208,   209,   210,   211,   211,   212,   212,   212,
     212,   213,   213,   213,   214,   215,   215,   216,   216,   216,
     217,   217,   217,   217,   217,   218,   218,   218,   218,   219,
     219,   219,   219,   219,   219,   220,   220,   220,   220,   221,
     221
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     2,     4,     4,     4,
       0,     2,     2,     2,     1,     3,     1,     4,     1,     3,
       7,     1,     1,     0,     2,     1,     1,     1,     1,     1,
       1,     4,     2,     4,     1,     1,     0,     3,     1,     1,
       1,     1,     0,     2,     4,     2,     4,     0,     2,     2,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     3,     4,
       5,     2,     3,     2,     3,     2,     2,     1,     3,     2,
       1,     2,     1,     1,     2,     0,     1,     1,     3,     1,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     1,     3,     1,     2,     3,     2,
       1,     1,     3,     3,     3,     4,     1,     3,     1,     2,
       1,     1,     5,     1,     1,     8,     0,     2,     4,     2,
       2,     5,     0,     2,     4,     1,     6,     3,     2,     0,
       1,     1,     3,     2,     0,     2,     1,     1,     1,     2,
       1,     1,     1,     1,     1,     1,     4,     1,     1,     1,
       1,     1,     1,     3,     3,     1,     1,     5,     1,     1,
       3,     3,     3,     3,     0,     1,     1,     3,     2,     3,
       5,     0,     2,     4,     0,     2,     4,     0,     2,     1,
       2,     0,     1,     3,     2,     2,     3,     4,     4,     4,
       4,     2,     1,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    26,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,   140,    32,
     141,    33,    31,     0,     0,     0,     0,     0,   214,     4,
       2,     0,     0,     0,    15,     0,    28,     0,     0,     0,
       0,     0,     6,    17,    18,     0,    19,    95,    21,    24,
      52,    36,    37,    38,    35,    39,     0,   211,    40,     0,
      44,    45,    34,   131,    27,   130,     0,     0,     0,     0,
       0,    22,    23,   227,   228,   229,   235,   236,   238,   237,
     230,   231,   233,   232,     0,    96,    97,   250,    99,   226,
     249,   234,   225,    57,     0,     0,    42,   212,    46,    29,
     217,   218,   219,   220,    25,     0,     0,    53,     0,     0,
       0,     0,    98,   245,   246,   247,   248,   164,     0,     0,
       0,    30,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   235,   230,   141,     0,     0,     0,
       0,   159,    74,    58,    61,    76,    75,    73,    72,     0,
      62,    63,    64,    65,   250,    66,    71,   143,   144,     0,
       0,    68,    69,   186,    70,   185,   188,   189,     0,    67,
       0,    41,   213,     0,    43,     0,     0,    55,    77,    59,
      60,     0,     0,     0,     0,     0,   174,   173,   194,   171,
     175,     0,   172,     0,     0,   201,   204,   146,   159,     0,
       0,     0,   223,   222,     0,     0,     0,     0,   160,   161,
     164,   158,     0,   100,    81,   215,   122,   120,   121,   110,
     111,   112,   113,   114,   116,   117,   115,   118,   119,     0,
       0,     0,     0,     0,    49,    47,    50,    48,    51,    54,
     170,   211,   168,   166,   167,   165,     0,     0,     0,   136,
     138,   183,   184,   216,   227,     0,   195,   196,   207,   191,
     190,   192,     0,     0,     0,     0,   157,   221,   132,   239,
     240,   241,   242,   244,   243,     0,   133,    78,   134,     0,
       0,   163,   178,   181,   180,   182,   179,   177,     0,     0,
       0,   124,   126,   227,   141,     0,   101,   102,   103,    85,
      93,    90,     0,    92,    87,   225,    82,    83,     0,   169,
      56,     0,   135,     0,   139,     0,   193,     0,   198,     0,
       0,   202,     0,     0,   205,     0,     0,     0,     0,   147,
       0,     0,   224,     0,   162,   176,   129,   123,     0,   127,
      91,    94,    79,    86,   109,   105,   104,   106,   107,   108,
       0,    89,    84,   142,   137,   199,   197,   211,   209,   208,
     207,   200,   207,   187,     0,   149,   207,   150,   152,    80,
       0,   125,   128,    88,   210,     0,     0,     0,     0,     0,
     156,   203,   206,     0,   148,     0,     0,   155,   153,   151,
     145,   164,     0,   154
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      43,    58,   152,    20,    47,    21,    31,    45,    72,   121,
     245,   103,   117,   127,   118,   153,   154,   155,   156,   157,
     158,   241,   309,   310,    94,    95,    96,   159,   312,   360,
     242,   243,   300,   301,    76,   160,   161,   162,   163,   258,
     259,    97,   165,   166,   167,   274,   339,   340,   389,   398,
     168,   217,   218,   219,   185,   255,   201,   169,   170,   298,
     171,   172,   173,   174,   175,   176,   203,   265,   266,   267,
     177,   272,   331,   273,   334,   328,   369,   106,   107,    22,
     179,    38,   211,   212,    98,    99,   100,   101,   285,   128,
     102
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -247
static const yytype_int16 yypact[] =
{
      26,  -247,    54,    65,  -247,    -6,    27,    86,   110,   104,
       8,    57,   166,   168,  -247,  -247,  -247,  -247,  -247,  -247,
    -247,  -247,  -247,    70,    71,  -247,   138,  -247,  -247,  -247,
    -247,  -247,  -247,   141,   -11,   -11,   -11,   -11,  -247,    65,
    -247,   143,   144,    18,  -247,    59,  -247,   -57,    75,    77,
      79,    84,  -247,  -247,  -247,    10,  -247,   419,  -247,  -247,
    -247,  -247,  -247,  -247,  -247,  -247,    88,    92,  -247,    94,
    -247,  -247,  -247,  -247,  -247,  -247,   165,   172,   164,   167,
     175,  -247,  -247,  -247,  -247,  -247,  -247,  -247,  -247,  -247,
    -247,  -247,  -247,  -247,   209,   129,  -247,  -247,  -247,  -247,
    -247,  -247,  -247,   219,     8,   202,  -247,  -247,  -247,  -247,
    -247,  -247,  -247,  -247,  -247,   419,   196,  -247,   213,   134,
     145,    36,  -247,  -247,  -247,  -247,  -247,  -247,    37,   247,
     311,  -247,   225,   196,   -11,   -11,   166,   -28,   157,   260,
     261,   269,   170,   157,   -38,     3,   364,   396,   396,   445,
     -11,   445,  -247,  -247,  -247,  -247,  -247,  -247,  -247,   273,
    -247,  -247,  -247,  -247,    17,  -247,  -247,  -247,  -247,    50,
     274,  -247,  -247,  -247,  -247,  -247,  -247,  -247,   275,  -247,
     346,  -247,  -247,    -9,  -247,     9,   223,  -247,  -247,  -247,
    -247,   179,   -11,   279,   280,   281,  -247,  -247,   432,  -247,
    -247,   282,  -247,   296,   297,  -247,  -247,  -247,   445,   298,
     419,   248,  -247,   162,   248,   299,   301,   200,   205,  -247,
    -247,  -247,   153,  -247,  -247,  -247,  -247,  -247,  -247,  -247,
    -247,  -247,  -247,  -247,  -247,  -247,  -247,  -247,  -247,   347,
     251,   307,   419,   204,  -247,  -247,  -247,  -247,  -247,  -247,
    -247,    92,  -247,  -247,  -247,  -247,   -11,   445,     1,  -247,
     216,  -247,  -247,  -247,   257,   210,   215,  -247,  -247,  -247,
    -247,  -247,   114,    66,    48,   214,  -247,  -247,  -247,  -247,
    -247,  -247,  -247,  -247,  -247,   419,  -247,  -247,  -247,   208,
     445,   173,  -247,  -247,  -247,  -247,  -247,  -247,   157,   419,
     -19,  -247,   318,   157,   419,   320,  -247,  -247,  -247,  -247,
    -247,  -247,   419,  -247,   -60,   227,  -247,  -247,   419,  -247,
    -247,   333,  -247,   -11,  -247,   419,  -247,   432,    62,   419,
     335,  -247,   419,   337,  -247,    52,    52,   419,    52,  -247,
     339,   340,  -247,    52,  -247,  -247,  -247,  -247,   347,   419,
    -247,   129,  -247,  -247,  -247,  -247,  -247,  -247,  -247,  -247,
     419,  -247,  -247,  -247,  -247,  -247,  -247,    92,  -247,  -247,
    -247,  -247,  -247,  -247,   341,  -247,  -247,  -247,  -247,  -247,
     342,  -247,  -247,  -247,  -247,    14,    28,   330,    29,    31,
    -247,  -247,  -247,   153,  -247,   359,   445,  -247,  -247,  -247,
    -247,  -247,    34,  -247
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -247,  -247,   360,  -247,   336,  -247,  -247,  -247,  -247,  -247,
    -247,  -247,   -23,  -247,  -247,  -247,   268,  -247,  -247,  -247,
    -247,  -247,  -247,  -247,  -247,  -247,   244,  -247,  -247,  -247,
    -247,  -247,  -247,  -247,  -247,    72,   262,  -135,  -247,  -247,
    -247,  -182,  -247,    30,    80,  -247,  -247,   -95,    -8,  -247,
      56,   -10,  -247,  -247,  -247,  -247,  -247,  -247,  -247,  -247,
    -247,   174,  -247,    95,  -216,  -247,    41,  -167,  -134,     6,
    -247,  -247,  -247,  -247,  -247,  -247,  -131,  -247,  -247,    73,
    -247,  -247,  -247,  -247,  -247,  -210,  -247,  -246,  -247,   -65,
    -247,   265,   254,  -247,  -138,  -247,  -247,  -247,  -247,  -120,
    -112
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -176
static const yytype_int16 yytable[] =
{
      32,   246,   199,   202,   291,   319,   180,   204,   322,   213,
     213,    28,   209,   192,   354,   196,   249,    81,   180,   197,
      59,   391,    55,    30,    48,    49,    50,    51,    28,    56,
      28,   244,    82,     1,    23,   392,   394,   215,   223,   220,
      30,   403,    30,   123,   124,   125,   126,    28,    29,    73,
     133,    74,   355,   178,     4,   356,   357,   358,   359,    30,
     268,    57,    75,   248,   395,   178,    60,    24,   396,    57,
     335,  -174,   277,     5,     6,     7,    28,   186,     8,     9,
      10,   198,  -174,   336,   337,    11,   338,    73,    30,   347,
      12,    28,   332,    25,    32,   196,   220,   333,   239,   197,
      75,   302,   314,    30,   317,   311,   313,   323,   164,   250,
     251,   252,  -173,   253,   254,   367,   278,   368,   187,   286,
     164,   384,    26,  -173,   193,   194,  -175,   200,   315,   367,
     367,   368,   368,   361,   250,   251,   252,  -175,   253,   254,
     216,   329,   183,   330,    27,   321,   184,   342,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,   198,
     385,   346,   386,   367,    33,   368,   388,   345,   374,   375,
     222,   377,   350,   247,   353,    39,    41,    42,   220,    44,
     362,    46,   260,    53,    54,   402,    77,   365,    78,   268,
      79,   370,    28,   292,   372,    80,   293,   104,   294,   376,
     295,   105,   296,   108,    30,   109,   111,   112,   199,   202,
     302,   382,   297,   110,   129,   113,   114,   130,    34,    35,
      36,    37,   383,   279,   280,   281,   282,   283,   284,   131,
     164,   132,   133,   134,   135,   115,   116,   136,    12,   137,
     138,   139,   120,   140,   181,   141,   320,   142,   123,   124,
     125,   126,    28,   143,   188,   182,   144,    87,    88,    89,
     145,    91,    92,    93,   146,   191,   198,   205,   206,   147,
     148,   149,   150,   250,   251,   252,   207,   253,   254,   208,
     221,   224,   225,   256,   401,   257,   261,   262,   263,   269,
      28,   303,    84,    85,   144,    87,    88,    89,   145,    91,
      92,    93,   304,   270,   271,   276,   287,   150,   288,   305,
     289,   290,   129,   260,   316,   318,   324,   325,   189,   343,
     326,   327,   151,   349,   341,   200,   200,   352,   200,   132,
     133,   134,   135,   200,   239,   136,    12,   137,   138,   139,
     363,   140,   371,   141,   373,   142,   378,   379,   387,   390,
      28,   143,   299,   393,   144,    87,    88,    89,   145,    91,
      92,    93,   146,   306,   307,   308,   400,   147,   148,   149,
     150,   -95,   119,    40,   190,    52,   351,   122,   381,   364,
     348,   397,   275,   297,   380,   344,    28,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    30,   399,
     366,   195,   214,    28,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    30,     0,     0,     0,     0,
     151,   226,   227,   228,   229,   230,   231,     0,   232,   233,
     234,   235,   236,   237,   238,    28,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    30,     0,     0,
       0,     0,     0,   239,   210,     0,     0,   240,    28,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      30,    28,   264,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    30,    28,     0,     0,     0,    86,    87,
      88,    89,    90,    91,    92,    93,    30
};

static const yytype_int16 yycheck[] =
{
      10,   183,   137,   137,   220,   251,   118,   138,     7,   147,
     148,    39,   143,   133,    74,    43,     7,     7,   130,    47,
      43,     7,     4,    51,    34,    35,    36,    37,    39,    11,
      39,    40,    55,     7,    40,     7,     7,   149,   169,   151,
      51,     7,    51,    52,    53,    54,    55,    39,    40,   106,
      19,   108,   112,   118,     0,   115,   116,   117,   118,    51,
     198,    51,   119,   183,    33,   130,     7,    40,    37,    51,
      22,   109,   210,     8,     9,    10,    39,    40,    13,    14,
      15,   109,   120,    35,    36,    20,    38,   106,    51,   108,
      25,    39,    26,     7,   104,    43,   208,    31,   107,    47,
     119,   239,   240,    51,   242,   240,   240,   106,   118,   100,
     101,   102,   109,   104,   105,   101,   211,   103,   128,   214,
     130,   367,    12,   120,   134,   135,   109,   137,   240,   101,
     101,   103,   103,   315,   100,   101,   102,   120,   104,   105,
     150,    27,   106,    29,    40,   257,   110,   285,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   109,
     370,   299,   372,   101,   107,   103,   376,   298,   335,   336,
     120,   338,   303,   183,   312,     7,   106,   106,   290,    41,
     318,    40,   192,    40,    40,   401,   111,   325,   111,   327,
     111,   329,    39,    40,   332,   111,    43,   109,    45,   337,
      47,   109,    49,   109,    51,    40,    42,    40,   343,   343,
     348,   349,   222,    41,     1,    40,     7,     4,    52,    53,
      54,    55,   360,    61,    62,    63,    64,    65,    66,    16,
     240,    18,    19,    20,    21,   106,    17,    24,    25,    26,
      27,    28,    40,    30,   110,    32,   256,    34,    52,    53,
      54,    55,    39,    40,     7,   110,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    40,   109,     7,     7,    56,
      57,    58,    59,   100,   101,   102,     7,   104,   105,   109,
       7,     7,     7,    60,   396,   106,     7,     7,     7,     7,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,     7,     7,     7,     7,    59,     7,    58,
     110,   106,     1,   323,     7,   111,   100,    60,     7,   111,
     110,   106,   109,     5,   110,   335,   336,     7,   338,    18,
      19,    20,    21,   343,   107,    24,    25,    26,    27,    28,
       7,    30,     7,    32,     7,    34,     7,     7,     7,     7,
      39,    40,     5,    23,    43,    44,    45,    46,    47,    48,
      49,    50,    51,   112,   113,   114,     7,    56,    57,    58,
      59,     7,   104,    13,   130,    39,   304,   115,   348,   323,
     300,   389,   208,   393,   343,   290,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,   393,
     327,   136,   148,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,
     109,    75,    76,    77,    78,    79,    80,    -1,    82,    83,
      84,    85,    86,    87,    88,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    -1,    -1,
      -1,    -1,    -1,   107,    58,    -1,    -1,   111,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    39,    -1,    -1,    -1,    43,    44,
      45,    46,    47,    48,    49,    50,    51
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     7,   122,   123,     0,     8,     9,    10,    13,    14,
      15,    20,    25,   124,   125,   126,   127,   128,   129,   130,
     134,   136,   210,    40,    40,     7,    12,    40,    39,    40,
      51,   137,   172,   107,    52,    53,    54,    55,   212,     7,
     123,   106,   106,   131,    41,   138,    40,   135,   172,   172,
     172,   172,   125,    40,    40,     4,    11,    51,   132,   133,
       7,    89,    90,    91,    92,    93,    94,    95,    96,    97,
      98,    99,   139,   106,   108,   119,   165,   111,   111,   111,
     111,     7,   133,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,   155,   156,   157,   172,   215,   216,
     217,   218,   221,   142,   109,   109,   208,   209,   109,    40,
      41,    42,    40,    40,     7,   106,    17,   143,   145,   137,
      40,   140,   157,    52,    53,    54,    55,   144,   220,     1,
       4,    16,    18,    19,    20,    21,    24,    26,    27,    28,
      30,    32,    34,    40,    43,    47,    51,    56,    57,    58,
      59,   109,   133,   146,   147,   148,   149,   150,   151,   158,
     166,   167,   168,   169,   172,   173,   174,   175,   181,   188,
     189,   191,   192,   193,   194,   195,   196,   201,   210,   211,
     221,   110,   110,   106,   110,   185,    40,   172,     7,     7,
     147,    40,   220,   172,   172,   212,    43,    47,   109,   158,
     172,   187,   189,   197,   197,     7,     7,     7,   109,   197,
      58,   213,   214,   215,   213,   221,   172,   182,   183,   184,
     221,     7,   120,   197,     7,     7,    75,    76,    77,    78,
      79,    80,    82,    83,    84,    85,    86,    87,    88,   107,
     111,   152,   161,   162,    40,   141,   162,   172,   220,     7,
     100,   101,   102,   104,   105,   186,    60,   106,   170,   171,
     172,     7,     7,     7,    40,   198,   199,   200,   215,     7,
       7,     7,   202,   204,   176,   182,     7,   215,   168,    61,
      62,    63,    64,    65,    66,   219,   168,     7,     7,   110,
     106,   185,    40,    43,    45,    47,    49,   172,   190,     5,
     163,   164,   215,    40,    51,    58,   112,   113,   114,   153,
     154,   158,   159,   189,   215,   221,     7,   215,   111,   208,
     172,   221,     7,   106,   100,    60,   110,   106,   206,    27,
      29,   203,    26,    31,   205,    22,    35,    36,    38,   177,
     178,   110,   215,   111,   184,   197,   215,   108,   165,     5,
     197,   156,     7,   215,    74,   112,   115,   116,   117,   118,
     160,   162,   215,     7,   171,   215,   200,   101,   103,   207,
     215,     7,   215,     7,   188,   188,   215,   188,     7,     7,
     187,   164,   215,   215,   208,   206,   206,     7,   206,   179,
       7,     7,     7,    23,     7,    33,    37,   169,   180,   190,
       7,   221,   185,     7
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
        case 77:
#line 369 "pir.y"
    { yyerrok; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2072 "pirparser.c"
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


#line 709 "pir.y"


#include <string.h>
#include <assert.h>


/*

wrapper function for yyerror.

*/
void
syntax_error(yyscan_t yyscanner, struct lexer_state *lexer, char *message) {
    yyerror(yyscanner, lexer, message);
}


/*

Pre-process the file only. Don't do any analysis.
This function does a bit of pretty-printing. Future improvement includes keeping track
of the amount of indention, for instance for labels and conditional blocks.

*/
static void
do_pre_process(yyscan_t yyscanner, struct lexer_state *lexer, char *outputfile) {
    int token;
    YYSTYPE val;
    int in_sub_body   = 0;    /* flag to keep track whether we're in a sub body */
    int just_print_nl = 0;    /* flag to keep track whether we just printed a newline */
    int indention     = 0;    /* amount of indention */
    FILE *output      = NULL; /* pointer to output file, if any is specified */


    if (outputfile != NULL) {
        output = fopen(outputfile, "w"); /* overwrite */
    }
    else {
        output = stderr; /* no file specified, output to stderr */
    }


    do {
        token = yylex(&val, yyscanner);

        if (token == TK_END) { /* ".end" must be printed at column 1 */
            in_sub_body = 0;
        }

        /* if we just printed a newline, and we're in a sub body ... */
        if (in_sub_body == 1 && just_print_nl) {
            /* ... and the current token is a non-indented token, (which needs to be printed
             * at column 1, print an indention.
             */

            if (token == TK_LABEL)
                indention = 1; /* labels are indented 1 space */
            else
                indention = 2; /* normal code is indented 2 spaces */
        }
        else { /* not in sub body or this is not first token on the line. */
            indention = 0;
        }

        /* print <indention> number of spaces before printing the token */
        fprintf(output, "%*s%s", indention, indention > 0 ? " " : "", yyget_text(yyscanner));

        /* don't print a space after one of these: [() */
        switch (token) {
            case '[': case ']':
            case '(': case ')':
                /* don't print a space */
                break;
            default:
                fprintf(output, " ");
                break;
        }


        if (token == TK_SUB) { /* we're entering a sub body, next lines must be indented. */
            in_sub_body = 1;
        }

        /* if we just printed a newline character, the trailing space should be removed:
         * do a carriage-return. Always clear flag of having read a newline.
         */
        just_print_nl = 0;
        if (strchr(yyget_text(yyscanner), '\n') != NULL) {
            fprintf(output, "\r");
            just_print_nl = 1;
        }
    }
    while (token > 0);

    if (outputfile != NULL) {
        fclose(output);
    }
}

/*

*/
static void
print_help(char const * const program_name) {

    fprintf(stderr, "Usage: %s [options] <files>\n", program_name);
    fprintf(stderr, "Options:\n\n");
    fprintf(stderr, "  -E        pre-process\n");
    fprintf(stderr, "  -d        show debug messages of parser\n");
    fprintf(stderr, "  -h        show this help message\n");
    fprintf(stderr, "  -o <file> write output to the specified file. "
                    "Currently only works in combination with '-E' option\n");
}

char debugtable[256];

/*
 * Main compiler driver.
 */
int
main(int argc, char *argv[]) {

    char const * const program_name = argv[0];
    int total_errors  = 0;
    int pre_process   = 0;
    int flexdebug     = 0;
    char *outputfile  = NULL;
    yyscan_t yyscanner;


    int i;

    for (i = 0; i < 256; i++) {
        debugtable[i] = i;
    }

    if (argc < 2) {
        print_help(program_name);
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
            case 'f':
                flexdebug = 1;
                break;
            case 'h':
                print_help(program_name);
                exit(EXIT_SUCCESS); /* asking for help doesn't make you a failure */
                /* break; */
            case 'o':
                if (argc > 1) { /* there must be at least 2 more args,
                                         the output file, and an input */
                    argc--;
                    argv++;
                    outputfile = argv[0];
                }
                else {
                    fprintf(stderr, "Missing argument for option '-o'\n");
                    exit(EXIT_FAILURE);
                }
                break;
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


    /* compile all files specified on the command line */
    while (argc > 0) {
        FILE *infile = NULL;
        struct lexer_state *lexer = NULL;
        int parse_errors = 0;

        fprintf(stderr, "Processing file '%s'\n", argv[0]);

        /* done handling arguments, open the file */
        infile = fopen(argv[0], "r");

        if (infile == NULL) {
            fprintf(stderr, "Failed to open file '%s'\n", argv[0]);
            exit(EXIT_FAILURE);
        }

        /* create a yyscan_t object */
        yylex_init(&yyscanner);
        /* set debug flag */
        yyset_debug(flexdebug, yyscanner);
        /* set the input file */
        yyset_in(infile, yyscanner);

        /* set the extra parameter in the yyscan_t structure */
        lexer = new_lexer(argv[0]);
        yyset_extra(lexer, yyscanner);


        if (pre_process) {
            fprintf(stderr, "pre-processing %s\n", argv[0]);
            do_pre_process(yyscanner, lexer, outputfile);
        }
        else {
            fprintf(stderr, "compiling %s\n", argv[0]);
            yyparse(yyscanner, lexer);

            /* get parse errors for this file */
            parse_errors = get_parse_errors(lexer);
            /* update total error count */
            total_errors += parse_errors;

            if (parse_errors == 0) {
                fprintf(stderr, "Parse successful!\n");
            }
            else {
                fprintf(stderr, "There %s %d %s in file '%s'\n", parse_errors > 1 ? "were" :
                        "was", parse_errors, parse_errors > 1 ? "errors" : "error",
                        get_current_file(lexer));
            }
        }

        /* clean up after playing */
        yylex_destroy(yyscanner);

        argc--;
        argv++;
    }

    if (total_errors > 0)
        fprintf(stderr, "There were %d parse errors in all files\n", total_errors);


    /* go home! */
    return 0;
}



/*

*/
int
yyerror(yyscan_t yyscanner, struct lexer_state * const  lexer, char const * const message) {

    char const * const text = yyget_text(yyscanner);

    /* increment parse errors in the lexer structure */
    parse_error(lexer);
    /* emit an error */
    fprintf(stderr, "\nError in file '%s' (line %d)\n%s ",
            get_current_file(lexer), get_line_nr(lexer), message);


    /* print current token if it's not a newline (or \r\n on windows) */

    /* the following should be fixed; the point is not to print the token if
     * it's a newline, that looks silly.
     */
    if (strcmp(text, "\r\n") != 0 || strcmp(text, "\n") == 0) {
        fprintf(stderr, "('%s')\n\n", text);
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


