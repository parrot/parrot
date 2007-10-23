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
#line 185 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 187 of yacc.c.  */
#line 382 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 395 "pirparser.c"

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
#define YYLAST   456

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  121
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  99
/* YYNRULES -- Number of rules.  */
#define YYNRULES  249
/* YYNRULES -- Number of states.  */
#define YYNSTATES  405

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
      54,    55,    58,    61,    64,    66,    68,    73,    75,    79,
      87,    89,    91,    92,    95,    97,    99,   101,   103,   105,
     107,   112,   115,   120,   122,   124,   125,   129,   131,   133,
     135,   137,   138,   141,   146,   149,   154,   155,   158,   161,
     164,   166,   168,   170,   172,   174,   176,   178,   180,   182,
     184,   186,   188,   190,   192,   194,   196,   199,   205,   209,
     213,   217,   220,   224,   227,   231,   234,   237,   239,   243,
     246,   248,   251,   253,   255,   258,   260,   263,   265,   267,
     269,   271,   273,   275,   277,   279,   281,   283,   285,   287,
     289,   291,   293,   295,   297,   299,   301,   303,   305,   307,
     311,   313,   317,   319,   322,   326,   329,   331,   333,   337,
     338,   340,   342,   346,   348,   352,   356,   360,   365,   367,
     371,   373,   376,   382,   384,   386,   395,   396,   399,   404,
     407,   410,   416,   417,   420,   425,   427,   434,   438,   441,
     442,   444,   446,   450,   453,   454,   457,   459,   461,   463,
     466,   468,   470,   472,   474,   476,   478,   483,   485,   487,
     489,   491,   495,   499,   501,   503,   509,   511,   513,   517,
     521,   525,   529,   530,   532,   534,   538,   541,   545,   551,
     552,   555,   560,   561,   564,   569,   570,   573,   575,   578,
     579,   581,   585,   588,   591,   595,   600,   605,   610,   615,
     618,   620,   622,   626,   628,   630,   632,   634,   636,   638,
     640,   642,   644,   646,   648,   650,   652,   654,   656,   658,
     660,   662,   664,   666,   668,   670,   672,   674,   676,   678
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     122,     0,    -1,   123,   124,   123,    -1,    -1,     6,    -1,
     125,    -1,   124,     6,   125,    -1,   135,    -1,   208,    -1,
     133,    -1,   130,    -1,   128,    -1,   129,    -1,   127,    -1,
     126,    -1,    12,    11,    40,    -1,    13,    39,    -1,     7,
      39,   106,    39,    -1,     8,    39,   106,    39,    -1,     9,
       6,   131,    10,    -1,    -1,   131,   132,    -1,     3,     6,
      -1,     3,   161,    -1,   161,    -1,    19,    -1,    19,   107,
     134,   108,    -1,    39,    -1,   134,   160,    39,    -1,    14,
     136,   137,     6,   141,   144,    15,    -1,    38,    -1,    39,
      -1,    -1,   137,   138,    -1,    92,    -1,    89,    -1,    90,
      -1,    91,    -1,    93,    -1,    96,    -1,    94,   109,   136,
     110,    -1,    95,   207,    -1,    97,   109,   139,   110,    -1,
      98,    -1,    99,    -1,    -1,   139,   106,   140,    -1,    38,
      -1,    39,    -1,   157,    -1,   218,    -1,    -1,   141,   142,
      -1,    16,   143,   183,     6,    -1,   218,    38,    -1,   218,
      39,    60,    38,    -1,    -1,   144,   145,    -1,     3,     6,
      -1,     3,   146,    -1,   146,    -1,   165,    -1,   166,    -1,
     167,    -1,   168,    -1,   171,    -1,   209,    -1,   189,    -1,
     190,    -1,   192,    -1,   172,    -1,   150,    -1,   149,    -1,
     148,    -1,   161,    -1,   147,    -1,     1,     6,    -1,    33,
     109,   180,   110,     6,    -1,    55,    42,     6,    -1,    55,
      46,     6,    -1,    55,    38,     6,    -1,   187,     6,    -1,
     219,   151,     6,    -1,   156,   213,    -1,   157,   111,   213,
      -1,   111,   152,    -1,   154,   213,    -1,   213,    -1,   213,
     155,   213,    -1,   219,   157,    -1,   153,    -1,    39,   195,
      -1,   187,    -1,    55,    -1,    59,    39,    -1,   161,    -1,
     186,   195,    -1,   112,    -1,   113,    -1,   114,    -1,   115,
      -1,   112,    -1,   116,    -1,   117,    -1,   118,    -1,    74,
      -1,    78,    -1,    79,    -1,    80,    -1,    82,    -1,    83,
      -1,    86,    -1,    84,    -1,    85,    -1,    87,    -1,    88,
      -1,    76,    -1,    77,    -1,    75,    -1,   107,   158,   108,
      -1,   159,    -1,   158,   160,   159,    -1,   213,    -1,   213,
       4,    -1,   213,     4,   213,    -1,     4,   213,    -1,   119,
      -1,   106,    -1,    50,   162,     6,    -1,    -1,   163,    -1,
     164,    -1,   163,   106,   164,    -1,   213,    -1,    56,   211,
     167,    -1,    57,   211,   167,    -1,    58,    38,     6,    -1,
      18,   218,   169,     6,    -1,   170,    -1,   169,   106,   170,
      -1,    38,    -1,    38,   100,    -1,    17,    39,   106,   219,
       6,    -1,   173,    -1,   179,    -1,    31,     6,   174,   176,
       6,   177,    32,     6,    -1,    -1,   174,   175,    -1,    35,
     213,   204,     6,    -1,    34,   186,    -1,    37,   186,    -1,
      21,   186,     6,    22,   188,    -1,    -1,   177,   178,    -1,
      36,   219,   183,     6,    -1,   168,    -1,   109,   180,   110,
     111,   185,     6,    -1,    39,   195,     6,    -1,   153,     6,
      -1,    -1,   181,    -1,   182,    -1,   181,   106,   182,    -1,
     219,   183,    -1,    -1,   183,   184,    -1,   104,    -1,   105,
      -1,   102,    -1,   101,   206,    -1,   100,    -1,   153,    -1,
     187,    -1,    46,    -1,    42,    -1,    38,    -1,   186,   120,
     188,   195,    -1,    38,    -1,    39,    -1,    42,    -1,    46,
      -1,    19,    38,     6,    -1,    20,    38,     6,    -1,   193,
      -1,   191,    -1,    29,     6,   202,    30,     6,    -1,   194,
      -1,   199,    -1,    25,   195,     6,    -1,    25,   185,     6,
      -1,    26,   195,     6,    -1,   109,   196,   110,    -1,    -1,
     197,    -1,   198,    -1,   197,   106,   198,    -1,   213,   204,
      -1,    39,    60,   213,    -1,    27,     6,   200,    28,     6,
      -1,    -1,   200,   201,    -1,    26,   213,   204,     6,    -1,
      -1,   202,   203,    -1,    25,   213,   204,     6,    -1,    -1,
     204,   205,    -1,   103,    -1,   101,   206,    -1,    -1,   207,
      -1,   109,    39,   110,    -1,    24,   210,    -1,   208,     6,
      -1,    23,   210,     6,    -1,    51,    38,   111,    40,    -1,
      52,    38,   111,    41,    -1,    53,    38,   111,    39,    -1,
      54,    38,   111,    39,    -1,    55,   213,    -1,   213,    -1,
     212,    -1,   213,   217,   213,    -1,    38,    -1,   214,    -1,
     215,    -1,    39,    -1,    40,    -1,    41,    -1,    46,    -1,
      47,    -1,    49,    -1,    48,    -1,   216,    -1,    42,    -1,
      43,    -1,    45,    -1,    44,    -1,    61,    -1,    62,    -1,
      63,    -1,    64,    -1,    66,    -1,    65,    -1,    51,    -1,
      52,    -1,    53,    -1,    54,    -1,   215,    -1,    38,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   219,   219,   224,   225,   228,   229,   232,   233,   234,
     235,   236,   237,   238,   239,   248,   256,   269,   272,   284,
     290,   291,   294,   295,   296,   308,   309,   312,   313,   318,
     324,   325,   328,   329,   347,   348,   349,   350,   351,   352,
     353,   354,   355,   356,   357,   360,   361,   364,   365,   366,
     367,   370,   371,   378,   387,   388,   394,   395,   405,   406,
     407,   410,   411,   412,   413,   414,   415,   416,   417,   418,
     419,   420,   421,   422,   423,   424,   425,   432,   435,   436,
     437,   440,   443,   446,   447,   448,   451,   452,   453,   454,
     455,   456,   457,   458,   459,   460,   464,   467,   468,   469,
     472,   473,   474,   475,   476,   477,   481,   482,   483,   484,
     485,   486,   487,   488,   489,   490,   491,   492,   493,   496,
     499,   500,   503,   504,   505,   506,   509,   510,   513,   516,
     517,   520,   521,   524,   527,   530,   533,   536,   539,   540,
     543,   544,   547,   550,   551,   554,   561,   562,   565,   568,
     569,   570,   574,   575,   578,   579,   582,   583,   584,   587,
     588,   591,   592,   595,   598,   599,   602,   603,   604,   605,
     606,   609,   610,   613,   614,   615,   618,   621,   622,   623,
     624,   627,   628,   631,   632,   635,   641,   642,   645,   646,
     649,   652,   655,   656,   659,   660,   669,   670,   680,   685,
     686,   689,   692,   693,   696,   699,   700,   703,   704,   707,
     708,   711,   714,   717,   718,   730,   731,   732,   733,   743,
     744,   745,   748,   750,   751,   752,   755,   756,   757,   760,
     761,   762,   763,   764,   768,   769,   770,   771,   784,   785,
     786,   787,   788,   789,   800,   801,   802,   803,   806,   807
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
  "parrot_instruction", "opt_parrot_op_args", "parrot_op_args",
  "parrot_op_arg", "if_statement", "unless_statement", "goto_statement",
  "local_declaration", "local_id_list", "local_id", "lex_declaration",
  "invocation_statement", "long_invocation_statement", "long_arguments",
  "long_argument", "long_invocation", "long_results", "long_result",
  "short_invocation_statement", "target_list", "return_target_list",
  "return_target", "param_flags", "param_flag", "invocation_expression",
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
     162,   163,   163,   164,   165,   166,   167,   168,   169,   169,
     170,   170,   171,   172,   172,   173,   174,   174,   175,   176,
     176,   176,   177,   177,   178,   178,   179,   179,   179,   180,
     180,   181,   181,   182,   183,   183,   184,   184,   184,   184,
     184,   185,   185,   186,   186,   186,   187,   188,   188,   188,
     188,   189,   189,   190,   190,   191,   192,   192,   193,   193,
     194,   195,   196,   196,   197,   197,   198,   198,   199,   200,
     200,   201,   202,   202,   203,   204,   204,   205,   205,   206,
     206,   207,   208,   209,   209,   210,   210,   210,   210,   211,
     211,   211,   212,   213,   213,   213,   214,   214,   214,   215,
     215,   215,   215,   215,   216,   216,   216,   216,   217,   217,
     217,   217,   217,   217,   218,   218,   218,   218,   219,   219
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     2,     4,     4,     4,
       0,     2,     2,     2,     1,     1,     4,     1,     3,     7,
       1,     1,     0,     2,     1,     1,     1,     1,     1,     1,
       4,     2,     4,     1,     1,     0,     3,     1,     1,     1,
       1,     0,     2,     4,     2,     4,     0,     2,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     5,     3,     3,
       3,     2,     3,     2,     3,     2,     2,     1,     3,     2,
       1,     2,     1,     1,     2,     1,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       1,     3,     1,     2,     3,     2,     1,     1,     3,     0,
       1,     1,     3,     1,     3,     3,     3,     4,     1,     3,
       1,     2,     5,     1,     1,     8,     0,     2,     4,     2,
       2,     5,     0,     2,     4,     1,     6,     3,     2,     0,
       1,     1,     3,     2,     0,     2,     1,     1,     1,     2,
       1,     1,     1,     1,     1,     1,     4,     1,     1,     1,
       1,     3,     3,     1,     1,     5,     1,     1,     3,     3,
       3,     3,     0,     1,     1,     3,     2,     3,     5,     0,
       2,     4,     0,     2,     4,     0,     2,     1,     2,     0,
       1,     3,     2,     2,     3,     4,     4,     4,     4,     2,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,    25,     0,     3,     5,    14,    13,    11,    12,    10,
       9,     7,     8,     0,     0,    20,     0,    16,    30,    31,
      32,     0,     0,     0,     0,     0,   212,     4,     2,     0,
       0,     0,    15,     0,    27,     0,     0,     0,     0,     0,
       6,    17,    18,     0,    19,   129,    21,    24,    51,    35,
      36,    37,    34,    38,     0,     0,    39,     0,    43,    44,
      33,   127,    26,   126,     0,     0,     0,     0,     0,    22,
      23,   223,   226,   227,   228,   234,   235,   237,   236,   229,
     230,   232,   231,     0,   130,   131,   133,   224,   225,   233,
      56,     0,     0,    41,    45,    28,   215,   216,   217,   218,
     128,     0,     0,    52,     0,     0,     0,     0,   132,   244,
     245,   246,   247,   164,     0,     0,     0,    29,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   249,
       0,   234,   229,     0,     0,     0,     0,   159,    57,    60,
      75,    73,    72,    71,     0,    74,    61,    62,    63,    64,
      65,    70,   143,   144,     0,     0,    67,    68,   184,    69,
     183,   186,   187,     0,    66,   248,     0,    40,   211,     0,
      42,     0,    54,     0,    76,    58,    59,     0,     0,     0,
       0,     0,   175,   174,   173,   192,   171,     0,   172,     0,
       0,   199,   202,   146,   159,     0,     0,     0,     0,     0,
       0,   221,   220,     0,     0,   249,     0,   160,   161,   164,
     158,     0,    96,    81,   213,   118,   116,   117,   106,   107,
     108,   109,   110,   112,   113,   111,   114,   115,     0,     0,
       0,     0,     0,    47,    48,    46,    49,    50,    53,   170,
     209,   168,   166,   167,   165,     0,     0,   140,     0,   138,
     181,   182,   214,   226,     0,   193,   194,   205,   189,   188,
     190,     0,     0,     0,     0,   157,    80,    78,    79,   219,
     134,   238,   239,   240,   241,   243,   242,     0,   135,   136,
       0,     0,   163,   177,   178,   179,   180,     0,     0,     0,
     120,   122,   223,   226,    93,     0,    97,    98,    99,    85,
      90,     0,    95,    92,    87,   225,     0,    82,    83,     0,
     169,   210,    55,     0,   141,   137,     0,     0,   191,     0,
     196,     0,     0,   200,     0,     0,   203,     0,     0,     0,
       0,   147,     0,     0,   222,     0,   162,   176,   125,   119,
       0,   123,    91,    94,    86,   105,   101,   100,   102,   103,
     104,     0,    89,    84,   142,   139,   197,   195,   209,   207,
     206,   205,   198,   205,   185,     0,   149,   205,   150,   152,
      77,     0,   121,   124,    88,   208,     0,     0,     0,     0,
       0,   156,   201,   204,     0,   148,     0,     0,   155,   153,
     151,   145,   164,     0,   154
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    13,    14,    15,    16,    17,    18,    19,
      41,    56,    20,    45,    21,    30,    43,    70,   117,   245,
     100,   113,   123,   114,   148,   149,   150,   151,   152,   153,
     240,   309,   154,   311,   361,   241,   242,   299,   300,    74,
     155,    93,    94,    95,   156,   157,   158,   159,   258,   259,
     160,   161,   162,   273,   341,   342,   390,   399,   163,   216,
     217,   218,   181,   254,   197,   164,   165,   297,   166,   167,
     168,   169,   170,   171,   199,   264,   265,   266,   172,   271,
     333,   272,   336,   330,   370,   320,   321,    22,   174,    36,
     210,   211,    96,    97,    98,    99,   287,   124,   219
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -241
static const yytype_int16 yypact[] =
{
       8,  -241,    51,   188,  -241,   -10,    -1,    60,    62,    40,
      21,   -15,   102,   100,  -241,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,    22,    28,  -241,   132,  -241,  -241,  -241,
    -241,   136,   142,   146,   151,   161,  -241,   188,  -241,   164,
     166,    24,  -241,    69,  -241,    -3,    97,   107,   108,   110,
    -241,  -241,  -241,    20,  -241,   264,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,   117,   118,  -241,   126,  -241,  -241,
    -241,  -241,  -241,  -241,   174,   199,   201,   206,   207,  -241,
    -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,   234,   152,  -241,  -241,  -241,  -241,  -241,
     241,    21,   220,  -241,  -241,  -241,  -241,  -241,  -241,  -241,
    -241,   264,   235,  -241,    38,   167,   168,   -89,  -241,  -241,
    -241,  -241,  -241,  -241,   177,   273,   205,  -241,   243,   235,
     242,   283,   102,   -18,   222,   326,   328,   329,   227,   -72,
     222,   -31,    65,   195,   314,   314,   304,   344,  -241,  -241,
    -241,  -241,  -241,  -241,   337,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,    67,   338,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,   340,  -241,  -241,   240,  -241,  -241,    -8,
    -241,    13,  -241,   288,  -241,  -241,  -241,   244,   327,   358,
     360,   361,  -241,  -241,  -241,   332,  -241,   362,  -241,   377,
     378,  -241,  -241,  -241,   344,   379,   397,   400,   401,   264,
     350,  -241,   333,   350,   403,  -241,   301,   306,  -241,  -241,
    -241,   291,  -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,   252,   226,
     404,   264,   302,  -241,  -241,  -241,  -241,  -241,  -241,  -241,
     118,  -241,  -241,  -241,  -241,   376,   344,   315,     3,  -241,
    -241,  -241,  -241,   356,   307,   312,  -241,  -241,  -241,  -241,
    -241,   155,    17,    15,   309,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,  -241,  -241,  -241,   264,  -241,  -241,
     310,   344,   300,  -241,  -241,  -241,  -241,   222,   264,    63,
    -241,   416,    32,   222,  -241,   383,  -241,  -241,  -241,  -241,
    -241,   264,  -241,  -241,    33,   316,   317,  -241,  -241,   264,
    -241,  -241,  -241,   419,  -241,  -241,   327,   264,  -241,   332,
      91,   264,   420,  -241,   264,   421,  -241,   303,   303,   264,
     303,  -241,   422,   423,  -241,   303,  -241,  -241,  -241,  -241,
     252,   264,  -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,
    -241,   264,  -241,  -241,  -241,  -241,  -241,  -241,   118,  -241,
    -241,  -241,  -241,  -241,  -241,   424,  -241,  -241,  -241,  -241,
    -241,   425,  -241,  -241,  -241,  -241,     9,    26,   410,    29,
     104,  -241,  -241,  -241,   291,  -241,   427,   344,  -241,  -241,
    -241,  -241,  -241,    19,  -241
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -241,  -241,   426,  -241,   398,  -241,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,  -241,   335,  -241,  -241,  -241,  -241,
    -241,  -241,  -241,  -241,  -241,   308,  -241,  -241,  -241,  -241,
    -241,  -241,  -131,  -241,  -241,  -241,  -172,  -241,    87,   139,
     -35,  -241,  -241,   330,  -241,  -241,   -75,    50,  -241,   116,
    -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,  -241,   239,
    -241,   153,  -211,  -241,   101,  -236,  -128,    53,  -241,  -241,
    -241,  -241,  -241,  -241,  -124,  -241,  -241,   119,  -241,  -241,
    -241,  -241,  -241,  -240,  -241,    77,   384,  -103,  -241,   318,
     311,  -241,  -141,  -241,  -114,  -241,  -241,  -107,  -113
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -250
static const yytype_int16 yytable[] =
{
     175,   176,   196,   212,   212,   198,    57,   246,   292,   325,
     200,   173,   175,   176,     1,   392,   205,   179,    80,   248,
     192,   180,   188,   173,   193,   404,    79,    53,   194,    23,
     243,   244,   393,   175,    54,   395,   337,  -175,    24,   125,
     222,   126,   334,   119,   120,   121,   122,   335,  -175,   338,
     339,     4,   340,   127,   267,   128,   129,   130,   131,    28,
      29,   132,    12,   133,   134,   135,    25,   136,   279,   137,
      55,   138,   247,    26,    55,    58,   139,   140,  -174,    27,
     141,    86,    87,    88,   142,    90,    91,    92,    55,  -174,
     175,   195,    31,   143,   144,   145,   146,   301,   314,   238,
     318,   375,   376,    71,   378,    72,    37,   355,   310,   326,
     368,   313,   369,   249,   250,   251,    73,   252,   253,   249,
     250,   251,   129,   252,   253,   315,   316,   368,    39,   369,
     368,   386,   369,   387,    40,   280,   396,   389,   288,  -249,
     397,  -175,   175,   323,   362,   356,   344,   147,   357,   358,
     359,   360,  -175,    32,    33,    34,    35,   348,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    71,
     354,   349,    42,   347,  -173,    44,   195,   175,   363,   352,
      46,   331,    73,   332,    47,  -173,   366,   221,   267,    48,
     371,   403,   368,   373,   369,     5,     6,     7,   377,    49,
       8,     9,    10,    51,   312,    52,   125,    11,    75,   301,
     383,   185,    12,   105,   196,   182,   183,   198,    76,    77,
     384,    78,   128,   129,   130,   131,   101,   102,   132,    12,
     133,   134,   135,   206,   136,   104,   137,   207,   138,   106,
     110,   208,   107,   139,   140,   108,   109,   141,    86,    87,
      88,   142,    90,    91,    92,    55,   298,   112,   111,   116,
     143,   144,   145,   146,   302,   303,    83,    84,   141,    86,
      87,    88,   142,    90,    91,    92,    55,   177,   178,   184,
     189,   304,   187,   175,   402,   305,   119,   120,   121,   122,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,   147,   225,   226,   227,   228,   229,
     230,   190,   231,   232,   233,   234,   235,   236,   237,   293,
     294,   195,   201,   295,   202,   203,   204,   296,   306,   307,
     308,   192,   214,   220,   223,   193,   224,   238,   255,   194,
     256,   239,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,   260,   257,   261,   262,   268,   209,
      81,   263,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,   215,   269,   270,   275,    85,    86,    87,    88,
      89,    90,    91,    92,   281,   282,   283,   284,   285,   286,
     249,   250,   251,   276,   252,   253,   277,   278,   146,   289,
     317,   290,   291,   319,   322,   324,   327,   328,   329,   343,
     351,   345,   353,  -248,   238,   364,   372,   374,   379,   380,
     388,   391,   394,   401,   186,    50,   115,   382,   350,    38,
     398,   118,   365,   274,   346,   385,   381,   400,   367,   103,
     191,     0,     0,     0,     0,     0,   213
};

static const yytype_int16 yycheck[] =
{
     114,   114,   133,   144,   145,   133,    41,   179,   219,     6,
     134,   114,   126,   126,     6,     6,   140,   106,    53,     6,
      38,   110,   129,   126,    42,     6,     6,     3,    46,    39,
      38,    39,     6,   147,    10,     6,    21,   109,    39,     1,
     164,     3,    25,    51,    52,    53,    54,    30,   120,    34,
      35,     0,    37,    15,   195,    17,    18,    19,    20,    38,
      39,    23,    24,    25,    26,    27,     6,    29,   209,    31,
      50,    33,   179,    11,    50,     6,    38,    39,   109,    39,
      42,    43,    44,    45,    46,    47,    48,    49,    50,   120,
     204,   109,   107,    55,    56,    57,    58,   238,   239,   107,
     241,   337,   338,   106,   340,   108,     6,    74,   239,   106,
     101,   239,   103,   100,   101,   102,   119,   104,   105,   100,
     101,   102,    18,   104,   105,   239,   239,   101,   106,   103,
     101,   371,   103,   373,   106,   210,    32,   377,   213,   107,
      36,   109,   256,   256,   316,   112,   287,   109,   115,   116,
     117,   118,   120,    51,    52,    53,    54,   298,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,    99,   106,
     311,   108,    40,   297,   109,    39,   109,   291,   319,   303,
      38,    26,   119,    28,    38,   120,   327,   120,   329,    38,
     331,   402,   101,   334,   103,     7,     8,     9,   339,    38,
      12,    13,    14,    39,   239,    39,     1,    19,   111,   350,
     351,     6,    24,    39,   345,    38,    39,   345,   111,   111,
     361,   111,    17,    18,    19,    20,   109,   109,    23,    24,
      25,    26,    27,    38,    29,   109,    31,    42,    33,    40,
       6,    46,    41,    38,    39,    39,    39,    42,    43,    44,
      45,    46,    47,    48,    49,    50,     4,    16,   106,    39,
      55,    56,    57,    58,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,   110,   110,     6,
      38,    55,    39,   397,   397,    59,    51,    52,    53,    54,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,   109,    75,    76,    77,    78,    79,
      80,    38,    82,    83,    84,    85,    86,    87,    88,    38,
      39,   109,     6,    42,     6,     6,   109,    46,   112,   113,
     114,    38,    38,     6,     6,    42,     6,   107,    60,    46,
     106,   111,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,     6,    38,     6,     6,     6,    55,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    38,     6,     6,     6,    42,    43,    44,    45,
      46,    47,    48,    49,    61,    62,    63,    64,    65,    66,
     100,   101,   102,     6,   104,   105,     6,     6,    58,     6,
       6,   110,   106,   111,    38,   100,    60,   110,   106,   110,
       4,   111,    39,   107,   107,     6,     6,     6,     6,     6,
       6,     6,    22,     6,   126,    37,   101,   350,   299,    13,
     390,   111,   326,   204,   291,   368,   345,   394,   329,    65,
     132,    -1,    -1,    -1,    -1,    -1,   145
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     6,   122,   123,     0,     7,     8,     9,    12,    13,
      14,    19,    24,   124,   125,   126,   127,   128,   129,   130,
     133,   135,   208,    39,    39,     6,    11,    39,    38,    39,
     136,   107,    51,    52,    53,    54,   210,     6,   123,   106,
     106,   131,    40,   137,    39,   134,    38,    38,    38,    38,
     125,    39,    39,     3,    10,    50,   132,   161,     6,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    99,
     138,   106,   108,   119,   160,   111,   111,   111,   111,     6,
     161,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,   162,   163,   164,   213,   214,   215,   216,
     141,   109,   109,   207,   109,    39,    40,    41,    39,    39,
       6,   106,    16,   142,   144,   136,    39,   139,   164,    51,
      52,    53,    54,   143,   218,     1,     3,    15,    17,    18,
      19,    20,    23,    25,    26,    27,    29,    31,    33,    38,
      39,    42,    46,    55,    56,    57,    58,   109,   145,   146,
     147,   148,   149,   150,   153,   161,   165,   166,   167,   168,
     171,   172,   173,   179,   186,   187,   189,   190,   191,   192,
     193,   194,   199,   208,   209,   215,   219,   110,   110,   106,
     110,   183,    38,    39,     6,     6,   146,    39,   218,    38,
      38,   210,    38,    42,    46,   109,   153,   185,   187,   195,
     195,     6,     6,     6,   109,   195,    38,    42,    46,    55,
     211,   212,   213,   211,    38,    38,   180,   181,   182,   219,
       6,   120,   195,     6,     6,    75,    76,    77,    78,    79,
      80,    82,    83,    84,    85,    86,    87,    88,   107,   111,
     151,   156,   157,    38,    39,   140,   157,   218,     6,   100,
     101,   102,   104,   105,   184,    60,   106,    38,   169,   170,
       6,     6,     6,    39,   196,   197,   198,   213,     6,     6,
       6,   200,   202,   174,   180,     6,     6,     6,     6,   213,
     167,    61,    62,    63,    64,    65,    66,   217,   167,     6,
     110,   106,   183,    38,    39,    42,    46,   188,     4,   158,
     159,   213,    38,    39,    55,    59,   112,   113,   114,   152,
     153,   154,   161,   187,   213,   215,   219,     6,   213,   111,
     206,   207,    38,   219,   100,     6,   106,    60,   110,   106,
     204,    26,    28,   201,    25,    30,   203,    21,    34,    35,
      37,   175,   176,   110,   213,   111,   182,   195,   213,   108,
     160,     4,   195,    39,   213,    74,   112,   115,   116,   117,
     118,   155,   157,   213,     6,   170,   213,   198,   101,   103,
     205,   213,     6,   213,     6,   186,   186,   213,   186,     6,
       6,   185,   159,   213,   213,   206,   204,   204,     6,   204,
     177,     6,     6,     6,    22,     6,    32,    36,   168,   178,
     188,     6,   219,   183,     6
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
#line 426 "pir.y"
    { yyerrok; ;}
    break;

  case 226:
#line 755 "pir.y"
    { fprintf(stderr, "TK_STRINGC: [%s]\n", yylval.sval); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2061 "pirparser.c"
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


#line 810 "pir.y"


#include <string.h>
#include <assert.h>




/* wrapper function for yyerror.

*/
void
syntax_error(void *yyscanner, struct lexer_state *lexer, char *message) {
    fprintf(stderr, "SYNTAX ERROR: %s\n", message);
}


/*

Pre-process the file only. Don't do any analysis.

*/
static void
do_pre_process(yyscan_t yyscanner, struct lexer_state *lexer) {
    int token;
    YYSTYPE val;

    do {

        token = yylex(&val, yyscanner);

        fprintf(stderr, "%s ", yyget_text(yyscanner));

        /* if we just printed a newline character, the trailing space should be removed:
         * do a carriage-return
         */
        if (strchr(yyget_text(yyscanner), '\n') != NULL)
            fprintf(stderr, "\r");
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
        fprintf(stderr, "('%s')", text);
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


