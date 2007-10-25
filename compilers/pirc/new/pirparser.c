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
     TK_GOTO = 313,
     TK_ARROW = 314,
     TK_NE = 315,
     TK_EQ = 316,
     TK_LT = 317,
     TK_LE = 318,
     TK_GT = 319,
     TK_GE = 320,
     TK_USHIFT = 321,
     TK_RSHIFT = 322,
     TK_LSHIFT = 323,
     TK_FDIV = 324,
     TK_OR = 325,
     TK_AND = 326,
     TK_XOR = 327,
     TK_CONC = 328,
     TK_ASSIGN_USHIFT = 329,
     TK_ASSIGN_RSHIFT = 330,
     TK_ASSIGN_LSHIFT = 331,
     TK_ASSIGN_INC = 332,
     TK_ASSIGN_DEC = 333,
     TK_ASSIGN_MUL = 334,
     TK_ASSIGN_MOD = 335,
     TK_ASSIGN_POW = 336,
     TK_ASSIGN_DIV = 337,
     TK_ASSIGN_BOR = 338,
     TK_ASSIGN_BAND = 339,
     TK_ASSIGN_FDIV = 340,
     TK_ASSIGN_BNOT = 341,
     TK_ASSIGN_CONC = 342,
     TK_FLAG_INIT = 343,
     TK_FLAG_LOAD = 344,
     TK_FLAG_MAIN = 345,
     TK_FLAG_ANON = 346,
     TK_FLAG_METHOD = 347,
     TK_FLAG_OUTER = 348,
     TK_FLAG_VTABLE = 349,
     TK_FLAG_LEX = 350,
     TK_FLAG_MULTI = 351,
     TK_FLAG_POSTCOMP = 352,
     TK_FLAG_IMMEDIATE = 353,
     TK_FLAG_UNIQUE_REG = 354,
     TK_FLAG_NAMED = 355,
     TK_FLAG_SLURPY = 356,
     TK_FLAG_FLAT = 357,
     TK_FLAG_OPTIONAL = 358,
     TK_FLAG_OPT_FLAG = 359
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
#define TK_GOTO 313
#define TK_ARROW 314
#define TK_NE 315
#define TK_EQ 316
#define TK_LT 317
#define TK_LE 318
#define TK_GT 319
#define TK_GE 320
#define TK_USHIFT 321
#define TK_RSHIFT 322
#define TK_LSHIFT 323
#define TK_FDIV 324
#define TK_OR 325
#define TK_AND 326
#define TK_XOR 327
#define TK_CONC 328
#define TK_ASSIGN_USHIFT 329
#define TK_ASSIGN_RSHIFT 330
#define TK_ASSIGN_LSHIFT 331
#define TK_ASSIGN_INC 332
#define TK_ASSIGN_DEC 333
#define TK_ASSIGN_MUL 334
#define TK_ASSIGN_MOD 335
#define TK_ASSIGN_POW 336
#define TK_ASSIGN_DIV 337
#define TK_ASSIGN_BOR 338
#define TK_ASSIGN_BAND 339
#define TK_ASSIGN_FDIV 340
#define TK_ASSIGN_BNOT 341
#define TK_ASSIGN_CONC 342
#define TK_FLAG_INIT 343
#define TK_FLAG_LOAD 344
#define TK_FLAG_MAIN 345
#define TK_FLAG_ANON 346
#define TK_FLAG_METHOD 347
#define TK_FLAG_OUTER 348
#define TK_FLAG_VTABLE 349
#define TK_FLAG_LEX 350
#define TK_FLAG_MULTI 351
#define TK_FLAG_POSTCOMP 352
#define TK_FLAG_IMMEDIATE 353
#define TK_FLAG_UNIQUE_REG 354
#define TK_FLAG_NAMED 355
#define TK_FLAG_SLURPY 356
#define TK_FLAG_FLAT 357
#define TK_FLAG_OPTIONAL 358
#define TK_FLAG_OPT_FLAG 359




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

extern int yyerror(yyscan_t yyscanner, struct lexer_state *lexer, char *message);

extern struct lexer_state *new_lexer(char *filename);





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
#line 188 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 380 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 393 "pirparser.c"

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
#define YYLAST   470

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  121
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  100
/* YYNRULES -- Number of rules.  */
#define YYNRULES  245
/* YYNRULES -- Number of states.  */
#define YYNSTATES  396

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
       2,     2,     2,   112,     2,     2,     2,   117,     2,     2,
     108,   109,   116,   114,   105,   111,   119,   115,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   118,
       2,   110,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   106,     2,   107,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,   113,     2,     2,     2,
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
     120
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
     186,   188,   190,   192,   194,   196,   198,   201,   207,   210,
     214,   217,   221,   224,   227,   229,   233,   236,   238,   241,
     243,   245,   248,   249,   251,   253,   257,   259,   262,   264,
     266,   268,   270,   272,   274,   276,   278,   280,   282,   284,
     286,   288,   290,   292,   294,   296,   298,   300,   302,   304,
     306,   310,   312,   316,   318,   321,   325,   328,   330,   332,
     336,   340,   344,   349,   351,   355,   357,   360,   362,   364,
     370,   372,   374,   383,   384,   387,   392,   395,   398,   404,
     405,   408,   413,   415,   422,   426,   429,   430,   432,   434,
     438,   441,   442,   445,   447,   449,   451,   454,   456,   458,
     460,   462,   464,   466,   471,   473,   475,   477,   479,   483,
     487,   489,   491,   497,   499,   501,   505,   509,   513,   517,
     518,   520,   522,   526,   529,   533,   539,   540,   543,   548,
     549,   552,   557,   558,   561,   563,   566,   567,   569,   573,
     576,   579,   583,   588,   593,   598,   603,   606,   608,   610,
     614,   616,   618,   620,   622,   624,   626,   628,   630,   632,
     634,   636,   638,   640,   642,   644,   646,   648,   650,   652,
     654,   656,   658,   660,   662,   664
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     122,     0,    -1,   123,   124,   123,    -1,    -1,     7,    -1,
     125,    -1,   124,     7,   125,    -1,   136,    -1,   209,    -1,
     134,    -1,   130,    -1,   128,    -1,   129,    -1,   127,    -1,
     126,    -1,    13,    12,    41,    -1,    14,    40,    -1,     8,
      40,   105,    40,    -1,     9,    40,   105,    40,    -1,    10,
       7,   131,    11,    -1,    -1,   131,   132,    -1,     4,     7,
      -1,     4,   133,    -1,   133,    -1,    51,   154,     7,    -1,
      20,    -1,    20,   106,   135,   107,    -1,    40,    -1,   135,
     164,    40,    -1,    15,   137,   138,     7,   142,   145,    16,
      -1,    39,    -1,    40,    -1,    -1,   138,   139,    -1,    91,
      -1,    88,    -1,    89,    -1,    90,    -1,    92,    -1,    95,
      -1,    93,   108,   137,   109,    -1,    94,   207,    -1,    96,
     108,   140,   109,    -1,    97,    -1,    98,    -1,    -1,   140,
     105,   141,    -1,   171,    -1,    40,    -1,   161,    -1,   219,
      -1,    -1,   142,   143,    -1,    17,   144,   184,     7,    -1,
     219,   171,    -1,   219,    40,    59,   171,    -1,    -1,   145,
     146,    -1,     4,     7,    -1,     4,   147,    -1,   147,    -1,
     165,    -1,   166,    -1,   167,    -1,   168,    -1,   172,    -1,
     210,    -1,   190,    -1,   191,    -1,   193,    -1,   173,    -1,
     150,    -1,   149,    -1,   133,    -1,   148,    -1,     1,     7,
      -1,    34,   108,   181,   109,     7,    -1,   188,     7,    -1,
     220,   151,     7,    -1,   160,   214,    -1,   161,   110,   214,
      -1,   110,   152,    -1,   158,   214,    -1,   214,    -1,   214,
     159,   214,    -1,   220,   161,    -1,   157,    -1,    40,   196,
      -1,   188,    -1,   153,    -1,    51,   155,    -1,    -1,   155,
      -1,   156,    -1,   155,   105,   156,    -1,   214,    -1,   187,
     196,    -1,   111,    -1,   112,    -1,   113,    -1,   114,    -1,
     111,    -1,   115,    -1,   116,    -1,   117,    -1,    73,    -1,
      77,    -1,    78,    -1,    79,    -1,    81,    -1,    82,    -1,
      85,    -1,    83,    -1,    84,    -1,    86,    -1,    87,    -1,
      75,    -1,    76,    -1,    74,    -1,   106,   162,   107,    -1,
     163,    -1,   162,   164,   163,    -1,   214,    -1,   214,     5,
      -1,   214,     5,   214,    -1,     5,   214,    -1,   118,    -1,
     105,    -1,    56,   212,   167,    -1,    57,   212,   167,    -1,
      58,   171,     7,    -1,    19,   219,   169,     7,    -1,   170,
      -1,   169,   105,   170,    -1,   171,    -1,   171,    99,    -1,
      39,    -1,    51,    -1,    18,    40,   105,   220,     7,    -1,
     174,    -1,   180,    -1,    32,     7,   175,   177,     7,   178,
      33,     7,    -1,    -1,   175,   176,    -1,    36,   214,   205,
       7,    -1,    35,   187,    -1,    38,   187,    -1,    22,   187,
       7,    23,   189,    -1,    -1,   178,   179,    -1,    37,   220,
     184,     7,    -1,   168,    -1,   108,   181,   109,   110,   186,
       7,    -1,    40,   196,     7,    -1,   157,     7,    -1,    -1,
     182,    -1,   183,    -1,   182,   105,   183,    -1,   220,   184,
      -1,    -1,   184,   185,    -1,   103,    -1,   104,    -1,   101,
      -1,   100,   207,    -1,    99,    -1,   157,    -1,   188,    -1,
      47,    -1,    43,    -1,   171,    -1,   187,   119,   189,   196,
      -1,   171,    -1,    40,    -1,    43,    -1,    47,    -1,    20,
     171,     7,    -1,    21,   171,     7,    -1,   194,    -1,   192,
      -1,    30,     7,   203,    31,     7,    -1,   195,    -1,   200,
      -1,    26,   196,     7,    -1,    26,   186,     7,    -1,    27,
     196,     7,    -1,   108,   197,   109,    -1,    -1,   198,    -1,
     199,    -1,   198,   105,   199,    -1,   214,   205,    -1,    40,
      59,   214,    -1,    28,     7,   201,    29,     7,    -1,    -1,
     201,   202,    -1,    27,   214,   205,     7,    -1,    -1,   203,
     204,    -1,    26,   214,   205,     7,    -1,    -1,   205,   206,
      -1,   102,    -1,   100,   207,    -1,    -1,   208,    -1,   108,
      40,   109,    -1,    25,   211,    -1,   209,     7,    -1,    24,
     211,     7,    -1,    52,   171,   110,    41,    -1,    53,   171,
     110,    42,    -1,    54,   171,   110,    40,    -1,    55,   171,
     110,    40,    -1,   120,   214,    -1,   214,    -1,   213,    -1,
     214,   218,   214,    -1,   220,    -1,   215,    -1,    40,    -1,
      41,    -1,    42,    -1,    47,    -1,    48,    -1,    50,    -1,
      49,    -1,   217,    -1,    43,    -1,    44,    -1,    46,    -1,
      45,    -1,    60,    -1,    61,    -1,    62,    -1,    63,    -1,
      65,    -1,    64,    -1,    52,    -1,    53,    -1,    54,    -1,
      55,    -1,   216,    -1,   171,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   222,   222,   227,   228,   231,   232,   235,   236,   237,
     238,   239,   240,   241,   242,   245,   248,   253,   256,   261,
     267,   268,   271,   272,   273,   276,   281,   282,   285,   286,
     291,   297,   298,   301,   302,   305,   306,   307,   308,   309,
     310,   311,   312,   313,   314,   315,   318,   319,   322,   323,
     324,   325,   328,   329,   332,   335,   336,   342,   343,   347,
     348,   349,   352,   353,   354,   355,   356,   357,   358,   359,
     360,   361,   362,   363,   364,   365,   366,   369,   372,   375,
     378,   379,   380,   383,   384,   385,   386,   387,   388,   389,
     390,   394,   397,   398,   401,   402,   405,   409,   412,   413,
     414,   417,   418,   419,   420,   421,   422,   426,   427,   428,
     429,   430,   431,   432,   433,   434,   435,   436,   437,   438,
     441,   444,   445,   448,   449,   450,   451,   454,   455,   459,
     462,   465,   468,   471,   472,   475,   476,   479,   480,   483,
     486,   487,   490,   497,   498,   501,   504,   505,   506,   510,
     511,   514,   515,   518,   519,   520,   523,   524,   527,   528,
     531,   534,   535,   538,   539,   540,   541,   542,   545,   546,
     549,   550,   551,   554,   557,   558,   559,   560,   563,   564,
     567,   568,   571,   577,   578,   581,   582,   585,   588,   591,
     592,   595,   596,   599,   600,   603,   608,   609,   612,   615,
     616,   619,   622,   623,   626,   627,   630,   631,   634,   637,
     640,   641,   644,   645,   646,   647,   650,   651,   652,   655,
     658,   659,   663,   664,   665,   668,   669,   670,   671,   672,
     676,   677,   678,   679,   682,   683,   684,   685,   686,   687,
     690,   691,   692,   693,   696,   697
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
  "\"unless\"", "\"goto\"", "\"=>\"", "\"!=\"", "\"==\"", "\"<\"",
  "\"<=\"", "\">\"", "\">=\"", "\">>>\"", "\">>\"", "\"<<\"", "\"//\"",
  "\"||\"", "\"&&\"", "\"^\"", "\".\"", "\">>>=\"", "\">>=\"", "\"<<=\"",
  "\"+=\"", "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"", "\"/=\"", "\"|=\"",
  "\"&=\"", "\"//=\"", "\"~=\"", "\".=\"", "\":init\"", "\":load\"",
  "\":main\"", "\":anon\"", "\":method\"", "\":outer\"", "\":vtable\"",
  "\":lex\"", "\":multi\"", "\":postcomp\"", "\":immediate\"",
  "\":unique_reg\"", "\":named\"", "\":slurpy\"", "\":flat\"",
  "\":optional\"", "\":opt_flag\"", "','", "'['", "']'", "'('", "')'",
  "'='", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'", "';'", "'.'",
  "\"null\"", "$accept", "program", "opt_nl", "compilation_units",
  "compilation_unit", "pir_pragma", "loadlib", "hll_specifier",
  "hll_mapping", "emit_block", "pasm_instructions", "pasm_instruction",
  "parrot_statement", "namespace_declaration", "namespace_id",
  "sub_definition", "sub_id", "sub_flags", "sub_flag", "multi_type_list",
  "multi_type", "parameters", "parameter", "param_def", "instructions",
  "labeled_instruction", "instruction", "getresults_statement",
  "methodcall_statement", "assignment_statement", "assignment_tail",
  "assignment_expression", "parrot_instruction", "opt_parrot_op_args",
  "parrot_op_args", "parrot_op_arg", "simple_invocation", "unop", "binop",
  "augmented_op", "keylist", "keys", "key", "separator", "if_statement",
  "unless_statement", "goto_statement", "local_declaration",
  "local_id_list", "local_id", "identifier", "lex_declaration",
  "invocation_statement", "long_invocation_statement", "long_arguments",
  "long_argument", "long_invocation", "long_results", "long_result",
  "short_invocation_statement", "opt_target_list", "target_list",
  "result_target", "param_flags", "param_flag", "invocation_expression",
  "invokable", "methodcall", "method", "namespace_statement",
  "return_statement", "long_return_statement", "yield_statement",
  "short_return_statement", "short_yield_statement", "arguments",
  "opt_arguments_list", "arguments_list", "argument",
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
     355,   356,   357,   358,   359,    44,    91,    93,    40,    41,
      61,    45,    33,   126,    43,    47,    42,    37,    59,    46,
     360
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
     147,   147,   147,   147,   147,   147,   147,   148,   149,   150,
     151,   151,   151,   152,   152,   152,   152,   152,   152,   152,
     152,   153,   154,   154,   155,   155,   156,   157,   158,   158,
     158,   159,   159,   159,   159,   159,   159,   160,   160,   160,
     160,   160,   160,   160,   160,   160,   160,   160,   160,   160,
     161,   162,   162,   163,   163,   163,   163,   164,   164,   165,
     166,   167,   168,   169,   169,   170,   170,   171,   171,   172,
     173,   173,   174,   175,   175,   176,   177,   177,   177,   178,
     178,   179,   179,   180,   180,   180,   181,   181,   182,   182,
     183,   184,   184,   185,   185,   185,   185,   185,   186,   186,
     187,   187,   187,   188,   189,   189,   189,   189,   190,   190,
     191,   191,   192,   193,   193,   194,   194,   195,   196,   197,
     197,   198,   198,   199,   199,   200,   201,   201,   202,   203,
     203,   204,   205,   205,   206,   206,   207,   207,   208,   209,
     210,   210,   211,   211,   211,   211,   212,   212,   212,   213,
     214,   214,   215,   215,   215,   216,   216,   216,   216,   216,
     217,   217,   217,   217,   218,   218,   218,   218,   218,   218,
     219,   219,   219,   219,   220,   220
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
       1,     1,     1,     1,     1,     1,     2,     5,     2,     3,
       2,     3,     2,     2,     1,     3,     2,     1,     2,     1,
       1,     2,     0,     1,     1,     3,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     1,     3,     1,     2,     3,     2,     1,     1,     3,
       3,     3,     4,     1,     3,     1,     2,     1,     1,     5,
       1,     1,     8,     0,     2,     4,     2,     2,     5,     0,
       2,     4,     1,     6,     3,     2,     0,     1,     1,     3,
       2,     0,     2,     1,     1,     1,     2,     1,     1,     1,
       1,     1,     1,     4,     1,     1,     1,     1,     3,     3,
       1,     1,     5,     1,     1,     3,     3,     3,     3,     0,
       1,     1,     3,     2,     3,     5,     0,     2,     4,     0,
       2,     4,     0,     2,     1,     2,     0,     1,     3,     2,
       2,     3,     4,     4,     4,     4,     2,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    26,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,    31,    32,
      33,     0,     0,     0,     0,     0,   209,     4,     2,     0,
       0,     0,    15,     0,    28,     0,   137,   138,     0,     0,
       0,     0,     6,    17,    18,     0,    19,    92,    21,    24,
      52,    36,    37,    38,    35,    39,     0,   206,    40,     0,
      44,    45,    34,   128,    27,   127,     0,     0,     0,     0,
       0,    22,    23,   222,   223,   224,   230,   231,   233,   232,
     225,   226,   228,   227,     0,    93,    94,   245,    96,   221,
     244,   229,   220,    57,     0,     0,    42,   207,    46,    29,
     212,   213,   214,   215,    25,     0,     0,    53,     0,     0,
       0,     0,    95,   240,   241,   242,   243,   161,     0,     0,
       0,    30,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   230,   225,   138,     0,     0,     0,
     156,    74,    58,    61,    75,    73,    72,     0,    62,    63,
      64,    65,   245,    66,    71,   140,   141,     0,     0,    68,
      69,   181,    70,   180,   183,   184,     0,    67,     0,    41,
     208,     0,    43,     0,     0,    55,    76,    59,    60,     0,
       0,     0,     0,     0,   171,   170,   189,   168,   172,     0,
     169,     0,     0,   196,   199,   143,   156,     0,     0,     0,
     218,   217,     0,     0,     0,   157,   158,   161,   155,     0,
      97,    78,   210,   119,   117,   118,   107,   108,   109,   110,
     111,   113,   114,   112,   115,   116,     0,     0,     0,     0,
       0,    49,    47,    50,    48,    51,    54,   167,   206,   165,
     163,   164,   162,     0,     0,     0,   133,   135,   178,   179,
     211,   222,     0,   190,   191,   202,   186,   185,   187,     0,
       0,     0,     0,   154,   216,   129,   234,   235,   236,   237,
     239,   238,     0,   130,   131,     0,     0,   160,   175,   176,
     177,   174,     0,     0,     0,   121,   123,   222,   138,    98,
      99,   100,    82,    90,    87,     0,    89,    84,   220,    79,
      80,     0,   166,    56,     0,   132,     0,   136,     0,   188,
       0,   193,     0,     0,   197,     0,     0,   200,     0,     0,
       0,     0,   144,     0,     0,   219,     0,   159,   173,   126,
     120,     0,   124,    88,    91,    83,   106,   102,   101,   103,
     104,   105,     0,    86,    81,   139,   134,   194,   192,   206,
     204,   203,   202,   195,   202,   182,     0,   146,   202,   147,
     149,    77,     0,   122,   125,    85,   205,     0,     0,     0,
       0,     0,   153,   198,   201,     0,   145,     0,     0,   152,
     150,   148,   142,   161,     0,   151
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      41,    58,   151,    20,    45,    21,    30,    43,    72,   121,
     242,   103,   117,   127,   118,   152,   153,   154,   155,   156,
     238,   302,   303,    94,    95,    96,   157,   305,   352,   239,
     240,   294,   295,    76,   158,   159,   160,   161,   255,   256,
      97,   163,   164,   165,   271,   332,   333,   381,   390,   166,
     214,   215,   216,   183,   252,   199,   167,   168,   292,   169,
     170,   171,   172,   173,   174,   201,   262,   263,   264,   175,
     269,   324,   270,   327,   321,   361,   106,   107,    22,   177,
      36,   209,   210,    98,    99,   100,   101,   282,   128,   102
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -242
static const yytype_int16 yypact[] =
{
      90,  -242,    76,   146,  -242,    80,    85,   121,   131,   108,
     184,    47,    -3,   163,  -242,  -242,  -242,  -242,  -242,  -242,
    -242,  -242,  -242,    86,    89,  -242,   158,  -242,  -242,  -242,
    -242,   166,   -27,   -27,   -27,   -27,  -242,   146,  -242,   168,
     180,    18,  -242,   197,  -242,    -6,  -242,  -242,    93,   116,
     122,   128,  -242,  -242,  -242,     4,  -242,   380,  -242,  -242,
    -242,  -242,  -242,  -242,  -242,  -242,   132,   134,  -242,   142,
    -242,  -242,  -242,  -242,  -242,  -242,   211,   220,   221,   222,
     224,  -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,   291,   195,  -242,  -242,  -242,  -242,
    -242,  -242,  -242,   286,   184,   266,  -242,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,  -242,   380,   192,  -242,   209,   198,
     199,    41,  -242,  -242,  -242,  -242,  -242,  -242,    96,   303,
      14,  -242,   271,   192,   -27,   -27,    -3,    36,   204,   307,
     308,   309,   237,   204,   -52,   -15,   367,   279,   279,   -27,
     232,  -242,  -242,  -242,  -242,  -242,  -242,   340,  -242,  -242,
    -242,  -242,    43,  -242,  -242,  -242,  -242,    66,   341,  -242,
    -242,  -242,  -242,  -242,  -242,  -242,   342,  -242,   285,  -242,
    -242,   125,  -242,    30,   287,  -242,  -242,  -242,  -242,   245,
     -27,   344,   345,   347,  -242,  -242,   393,  -242,  -242,   348,
    -242,   349,   350,  -242,  -242,  -242,   232,   351,   380,   315,
    -242,   154,   315,   358,   267,   270,  -242,  -242,  -242,   262,
    -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,  -242,  -242,   339,   292,   370,   380,
     282,  -242,  -242,  -242,  -242,  -242,  -242,  -242,   134,  -242,
    -242,  -242,  -242,   -27,   232,     6,  -242,   294,  -242,  -242,
    -242,   335,   288,   293,  -242,  -242,  -242,  -242,  -242,     1,
      69,    46,   336,  -242,  -242,  -242,  -242,  -242,  -242,  -242,
    -242,  -242,   380,  -242,  -242,   290,   232,   169,  -242,  -242,
    -242,  -242,   204,   380,     9,  -242,   391,   204,   380,  -242,
    -242,  -242,  -242,  -242,  -242,   380,  -242,   -26,   295,  -242,
    -242,   380,  -242,  -242,   395,  -242,   -27,  -242,   380,  -242,
     393,    67,   380,   439,  -242,   380,   440,  -242,   150,   150,
     380,   150,  -242,   441,   442,  -242,   150,  -242,  -242,  -242,
    -242,   339,   380,  -242,   195,  -242,  -242,  -242,  -242,  -242,
    -242,  -242,   380,  -242,  -242,  -242,  -242,  -242,  -242,   134,
    -242,  -242,  -242,  -242,  -242,  -242,   443,  -242,  -242,  -242,
    -242,  -242,   444,  -242,  -242,  -242,  -242,    13,    19,   429,
      24,   -10,  -242,  -242,  -242,   262,  -242,   446,   232,  -242,
    -242,  -242,  -242,  -242,    38,  -242
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -242,  -242,   445,  -242,   417,  -242,  -242,  -242,  -242,  -242,
    -242,  -242,    39,  -242,  -242,  -242,   352,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,  -242,  -242,   325,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,   159,   346,  -129,  -242,  -242,  -242,
    -176,  -242,   118,   170,  -242,  -242,  -135,    79,  -242,   147,
     -32,  -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,
     256,  -242,   179,  -211,  -242,   130,  -145,  -127,    82,  -242,
    -242,  -242,  -242,  -242,  -242,  -124,  -242,  -242,   148,  -242,
    -242,  -242,  -242,  -242,  -166,  -242,  -241,  -242,    27,  -242,
     333,   322,  -242,  -130,  -242,  -242,  -242,  -242,  -108,  -114
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -173
static const yytype_int16 yytable[] =
{
      48,    49,    50,    51,   178,   243,   287,   312,   197,   133,
     200,    81,    46,   315,   202,   129,   178,   211,   211,   207,
     383,   187,    55,   387,    47,   190,   384,   388,   322,    56,
     323,   386,   132,   133,   134,   135,   217,   246,   136,    12,
     137,   138,   139,   220,   140,   395,   141,   346,   142,    32,
      33,    34,    35,    46,   143,    57,  -171,   144,    87,    88,
      89,   145,    91,    92,    93,   146,   265,  -171,   328,    57,
     147,   148,   149,   245,   275,    46,     4,   283,   274,   194,
      59,   329,   330,   195,   331,   347,   162,    47,   348,   349,
     350,   351,   217,  -170,    82,   325,   185,     1,   162,    73,
     326,    74,   191,   192,  -170,   198,   296,   307,   304,   310,
     306,   316,    75,   359,    73,   360,   340,   213,   376,   359,
      23,   360,   150,   308,   359,    24,   360,    75,    25,   247,
     248,   249,   353,   250,   251,    46,   184,   247,   248,   249,
     314,   250,   251,    26,   196,   176,   181,    47,    27,   244,
     182,  -172,   335,    31,     5,     6,     7,   176,   257,     8,
       9,    10,  -172,   339,    46,   241,    11,   359,   338,   360,
      37,    12,   217,   343,   196,   345,    47,   123,   124,   125,
     126,   354,   394,   366,   367,   219,   369,   291,   357,    46,
     265,    39,   362,   194,    40,   364,   377,   195,   378,    42,
     368,    47,   380,    77,    60,   162,    44,   197,    53,   200,
     129,   296,   374,   130,   276,   277,   278,   279,   280,   281,
      54,   313,   375,    28,    29,   131,    78,   132,   133,   134,
     135,   236,    79,   136,    12,   137,   138,   139,    80,   140,
     104,   141,   105,   142,   123,   124,   125,   126,    46,   143,
     108,   109,   144,    87,    88,    89,   145,    91,    92,    93,
     146,   110,   112,   111,   113,   147,   148,   149,   247,   248,
     249,    46,   250,   251,   393,    86,    87,    88,    89,    90,
      91,    92,    93,    47,   257,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,   198,   198,   114,   198,
     115,    46,   288,   116,   198,   289,   120,   179,   180,   290,
     186,   189,   196,    47,   203,   204,   205,   150,    46,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      47,    46,   297,    84,    85,   144,    87,    88,    89,   145,
      91,    92,    93,   298,   293,   206,   253,   218,   221,   222,
     254,   258,   259,   291,   260,   266,   267,   268,   273,   223,
     224,   225,   226,   227,   228,   284,   229,   230,   231,   232,
     233,   234,   235,   149,   -92,   286,   285,   309,    46,    83,
      84,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      47,   236,   311,   317,   318,   237,   342,   319,   320,   208,
     336,   236,   355,   299,   300,   301,    46,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    47,    46,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    47,    46,   261,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    47,   334,   363,   365,   370,   371,
     379,   382,   385,   392,    52,   188,   119,   344,    38,   373,
     389,   122,   272,   356,   341,   337,   372,   391,   358,   193,
     212
};

static const yytype_uint16 yycheck[] =
{
      32,    33,    34,    35,   118,   181,   217,   248,   137,    19,
     137,     7,    39,     7,   138,     1,   130,   147,   148,   143,
       7,     7,     4,    33,    51,   133,     7,    37,    27,    11,
      29,     7,    18,    19,    20,    21,   150,     7,    24,    25,
      26,    27,    28,   167,    30,     7,    32,    73,    34,    52,
      53,    54,    55,    39,    40,    51,   108,    43,    44,    45,
      46,    47,    48,    49,    50,    51,   196,   119,    22,    51,
      56,    57,    58,   181,   209,    39,     0,   212,   208,    43,
      41,    35,    36,    47,    38,   111,   118,    51,   114,   115,
     116,   117,   206,   108,    55,    26,   128,     7,   130,   105,
      31,   107,   134,   135,   119,   137,   236,   237,   237,   239,
     237,   105,   118,   100,   105,   102,   107,   149,   359,   100,
      40,   102,   108,   237,   100,    40,   102,   118,     7,    99,
     100,   101,   308,   103,   104,    39,    40,    99,   100,   101,
     254,   103,   104,    12,   108,   118,   105,    51,    40,   181,
     109,   108,   282,   106,     8,     9,    10,   130,   190,    13,
      14,    15,   119,   293,    39,    40,    20,   100,   292,   102,
       7,    25,   286,   297,   108,   305,    51,    52,    53,    54,
      55,   311,   393,   328,   329,   119,   331,   219,   318,    39,
     320,   105,   322,    43,   105,   325,   362,    47,   364,    41,
     330,    51,   368,   110,     7,   237,    40,   336,    40,   336,
       1,   341,   342,     4,    60,    61,    62,    63,    64,    65,
      40,   253,   352,    39,    40,    16,   110,    18,    19,    20,
      21,   106,   110,    24,    25,    26,    27,    28,   110,    30,
     108,    32,   108,    34,    52,    53,    54,    55,    39,    40,
     108,    40,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    41,    40,    42,    40,    56,    57,    58,    99,   100,
     101,    39,   103,   104,   388,    43,    44,    45,    46,    47,
      48,    49,    50,    51,   316,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,   328,   329,     7,   331,
     105,    39,    40,    17,   336,    43,    40,   109,   109,    47,
       7,    40,   108,    51,     7,     7,     7,   108,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,     5,   108,    59,     7,     7,     7,
     105,     7,     7,   385,     7,     7,     7,     7,     7,    74,
      75,    76,    77,    78,    79,     7,    81,    82,    83,    84,
      85,    86,    87,    58,     7,   105,   109,     7,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,   106,   110,    99,    59,   110,     5,   109,   105,   120,
     110,   106,     7,   111,   112,   113,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,   109,     7,     7,     7,     7,
       7,     7,    23,     7,    37,   130,   104,   298,    13,   341,
     381,   115,   206,   316,   294,   286,   336,   385,   320,   136,
     148
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     7,   122,   123,     0,     8,     9,    10,    13,    14,
      15,    20,    25,   124,   125,   126,   127,   128,   129,   130,
     134,   136,   209,    40,    40,     7,    12,    40,    39,    40,
     137,   106,    52,    53,    54,    55,   211,     7,   123,   105,
     105,   131,    41,   138,    40,   135,    39,    51,   171,   171,
     171,   171,   125,    40,    40,     4,    11,    51,   132,   133,
       7,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,   139,   105,   107,   118,   164,   110,   110,   110,
     110,     7,   133,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,   154,   155,   156,   171,   214,   215,
     216,   217,   220,   142,   108,   108,   207,   208,   108,    40,
      41,    42,    40,    40,     7,   105,    17,   143,   145,   137,
      40,   140,   156,    52,    53,    54,    55,   144,   219,     1,
       4,    16,    18,    19,    20,    21,    24,    26,    27,    28,
      30,    32,    34,    40,    43,    47,    51,    56,    57,    58,
     108,   133,   146,   147,   148,   149,   150,   157,   165,   166,
     167,   168,   171,   172,   173,   174,   180,   187,   188,   190,
     191,   192,   193,   194,   195,   200,   209,   210,   220,   109,
     109,   105,   109,   184,    40,   171,     7,     7,   147,    40,
     219,   171,   171,   211,    43,    47,   108,   157,   171,   186,
     188,   196,   196,     7,     7,     7,   108,   196,   120,   212,
     213,   214,   212,   171,   181,   182,   183,   220,     7,   119,
     196,     7,     7,    74,    75,    76,    77,    78,    79,    81,
      82,    83,    84,    85,    86,    87,   106,   110,   151,   160,
     161,    40,   141,   161,   171,   219,     7,    99,   100,   101,
     103,   104,   185,    59,   105,   169,   170,   171,     7,     7,
       7,    40,   197,   198,   199,   214,     7,     7,     7,   201,
     203,   175,   181,     7,   214,   167,    60,    61,    62,    63,
      64,    65,   218,   167,     7,   109,   105,   184,    40,    43,
      47,   171,   189,     5,   162,   163,   214,    40,    51,   111,
     112,   113,   152,   153,   157,   158,   188,   214,   220,     7,
     214,   110,   207,   171,   220,     7,   105,    99,    59,   109,
     105,   205,    27,    29,   202,    26,    31,   204,    22,    35,
      36,    38,   176,   177,   109,   214,   110,   183,   196,   214,
     107,   164,     5,   196,   155,   214,    73,   111,   114,   115,
     116,   117,   159,   161,   214,     7,   170,   214,   199,   100,
     102,   206,   214,     7,   214,     7,   187,   187,   214,   187,
       7,     7,   186,   163,   214,   214,   207,   205,   205,     7,
     205,   178,     7,     7,     7,    23,     7,    33,    37,   168,
     179,   189,     7,   220,   184,     7
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
        case 76:
#line 366 "pir.y"
    { yyerrok; ;}
    break;

  case 222:
#line 663 "pir.y"
    { fprintf(stderr, "TK_STRINGC: [%s]\n", yylval.sval); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2059 "pirparser.c"
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


#line 700 "pir.y"


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
do_pre_process(yyscan_t yyscanner, struct lexer_state *lexer) {
    int token;
    YYSTYPE val;
    int in_sub_body   = 0; /* flag to keep track whether we're in a sub body */
    int just_print_nl = 0; /* flag to keep track whether we just printed a newline */

    do {

        token = yylex(&val, yyscanner);

        /* if we just printed a newline, and we're in a sub body ... */
        if (in_sub_body == 1 && just_print_nl) {
            /* ... and the current token is a non-indented token, (which needs to be printed
             * at column 1, print an indention.
             */
            if (token != TK_SUB && token != TK_END
                && token != TK_NAMESPACE && token != TK_ENDNAMESPACE)

                fprintf(stderr, "  ");

        }

        fprintf(stderr, "%s", yyget_text(yyscanner));

        /* don't print a space after one of these: [() */
        switch (token) {
            case '[': case ']':
            case '(': case ')':
                /* do nothin' */
                break;
            default:
                fprintf(stderr, " ");
                break;
        }

        if (token == TK_SUB) { /* we're entering a sub body */
            in_sub_body = 1;
        }
        else if (token == TK_END) { /* we're falling out of a sub body */
            in_sub_body = 0;
        }

        /* if we just printed a newline character, the trailing space should be removed:
         * do a carriage-return. Always clear flag of having read a newline.
         */
        just_print_nl = 0;
        if (strchr(yyget_text(yyscanner), '\n') != NULL) {
            fprintf(stderr, "\r");
            just_print_nl = 1;
        }
    }
    while (token > 0);
}

/*

*/
static void
print_help(char const * const program_name) {

    fprintf(stderr, "Usage: %s [options] <files>\n", program_name);
    fprintf(stderr, "Options:\n\n");
    fprintf(stderr, "  -E   pre-process\n");
    fprintf(stderr, "  -d   show debug messages of parser\n");
    fprintf(stderr, "  -h   show this help message\n");

}

/*
 * Main compiler driver.
 */
int
main(int argc, char *argv[]) {

    char const * const program_name = argv[0];
    int total_errors  = 0;
    int pre_process   = 0;
    yyscan_t yyscanner;

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
            case 'h':
                print_help(program_name);
                exit(EXIT_SUCCESS); /* asking for help doesn't make you a failure */
                /* break; */
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
        /* set the input file */
        yyset_in(infile, yyscanner);

        /* set the extra parameter in the yyscan_t structure */
        lexer = new_lexer(argv[0]);
        yyset_extra(lexer, yyscanner);


        if (pre_process) {
            fprintf(stderr, "pre-processing %s\n", argv[0]);
            do_pre_process(yyscanner, lexer);
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
yyerror(yyscan_t yyscanner, struct lexer_state * lexer, char * message) {

    char *text = yyget_text(yyscanner);

    /* increment parse errors in the lexer structure */
    parse_error(lexer);
    /* emit an error */
    fprintf(stderr, "\nError in file '%s' (line %d): %s ",
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


