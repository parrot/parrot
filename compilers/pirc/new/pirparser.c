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
     TK_PREG = 292,
     TK_NREG = 293,
     TK_SREG = 294,
     TK_IREG = 295,
     TK_PARROT_OP = 296,
     TK_INT = 297,
     TK_NUM = 298,
     TK_PMC = 299,
     TK_STRING = 300,
     TK_IF = 301,
     TK_UNLESS = 302,
     TK_NULL = 303,
     TK_GOTO = 304,
     TK_ARROW = 305,
     TK_NE = 306,
     TK_EQ = 307,
     TK_LT = 308,
     TK_LE = 309,
     TK_GT = 310,
     TK_GE = 311,
     TK_USHIFT = 312,
     TK_RSHIFT = 313,
     TK_LSHIFT = 314,
     TK_FDIV = 315,
     TK_OR = 316,
     TK_AND = 317,
     TK_XOR = 318,
     TK_CONC = 319,
     TK_ASSIGN_USHIFT = 320,
     TK_ASSIGN_RSHIFT = 321,
     TK_ASSIGN_LSHIFT = 322,
     TK_ASSIGN_INC = 323,
     TK_ASSIGN_DEC = 324,
     TK_ASSIGN_MUL = 325,
     TK_ASSIGN_MOD = 326,
     TK_ASSIGN_POW = 327,
     TK_ASSIGN_DIV = 328,
     TK_ASSIGN_BOR = 329,
     TK_ASSIGN_BAND = 330,
     TK_ASSIGN_FDIV = 331,
     TK_ASSIGN_BNOT = 332,
     TK_ASSIGN_CONC = 333,
     TK_FLAG_INIT = 334,
     TK_FLAG_LOAD = 335,
     TK_FLAG_MAIN = 336,
     TK_FLAG_ANON = 337,
     TK_FLAG_METHOD = 338,
     TK_FLAG_OUTER = 339,
     TK_FLAG_VTABLE = 340,
     TK_FLAG_LEX = 341,
     TK_FLAG_MULTI = 342,
     TK_FLAG_POSTCOMP = 343,
     TK_FLAG_IMMEDIATE = 344,
     TK_FLAG_LEXID = 345,
     TK_FLAG_UNIQUE_REG = 346,
     TK_FLAG_NAMED = 347,
     TK_FLAG_SLURPY = 348,
     TK_FLAG_FLAT = 349,
     TK_FLAG_OPTIONAL = 350,
     TK_FLAG_OPT_FLAG = 351,
     TK_FLAG_INVOCANT = 352
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
#define TK_PREG 292
#define TK_NREG 293
#define TK_SREG 294
#define TK_IREG 295
#define TK_PARROT_OP 296
#define TK_INT 297
#define TK_NUM 298
#define TK_PMC 299
#define TK_STRING 300
#define TK_IF 301
#define TK_UNLESS 302
#define TK_NULL 303
#define TK_GOTO 304
#define TK_ARROW 305
#define TK_NE 306
#define TK_EQ 307
#define TK_LT 308
#define TK_LE 309
#define TK_GT 310
#define TK_GE 311
#define TK_USHIFT 312
#define TK_RSHIFT 313
#define TK_LSHIFT 314
#define TK_FDIV 315
#define TK_OR 316
#define TK_AND 317
#define TK_XOR 318
#define TK_CONC 319
#define TK_ASSIGN_USHIFT 320
#define TK_ASSIGN_RSHIFT 321
#define TK_ASSIGN_LSHIFT 322
#define TK_ASSIGN_INC 323
#define TK_ASSIGN_DEC 324
#define TK_ASSIGN_MUL 325
#define TK_ASSIGN_MOD 326
#define TK_ASSIGN_POW 327
#define TK_ASSIGN_DIV 328
#define TK_ASSIGN_BOR 329
#define TK_ASSIGN_BAND 330
#define TK_ASSIGN_FDIV 331
#define TK_ASSIGN_BNOT 332
#define TK_ASSIGN_CONC 333
#define TK_FLAG_INIT 334
#define TK_FLAG_LOAD 335
#define TK_FLAG_MAIN 336
#define TK_FLAG_ANON 337
#define TK_FLAG_METHOD 338
#define TK_FLAG_OUTER 339
#define TK_FLAG_VTABLE 340
#define TK_FLAG_LEX 341
#define TK_FLAG_MULTI 342
#define TK_FLAG_POSTCOMP 343
#define TK_FLAG_IMMEDIATE 344
#define TK_FLAG_LEXID 345
#define TK_FLAG_UNIQUE_REG 346
#define TK_FLAG_NAMED 347
#define TK_FLAG_SLURPY 348
#define TK_FLAG_FLAT 349
#define TK_FLAG_OPTIONAL 350
#define TK_FLAG_OPT_FLAG 351
#define TK_FLAG_INVOCANT 352




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

Features are:

=over 4

=item * constant folding is implemented in the parser

=item *

=back



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

/* mathematical operator types */
typedef enum pir_math_operators {
    OP_ADD,
    OP_SUB,
    OP_DIV,
    OP_MUL,
    OP_MOD,
    OP_BOR,
    OP_BAND,
    OP_BXOR,
    OP_POW,
    OP_CONCAT,
    OP_LSR,
    OP_SHR,
    OP_SHL,
    OP_OR,
    OP_AND,
    OP_FDIV,
    OP_XOR,
    OP_ISEQ,
    OP_ISLE,
    OP_ISLT,
    OP_ISGE,
    OP_ISGT,
    OP_ISNE

} pir_math_operator;

/* relational operator types */
typedef enum pir_rel_operators {
    OP_NE = OP_ISNE + 1,   /* continue after OP_ISNE */
    OP_EQ,
    OP_LT,
    OP_LE,
    OP_GT,
    OP_GE

} pir_rel_operator;

/* names of the binary operators */
static char * const opnames[] = {
    "add",
    "sub",
    "div",
    "mul",
    "mod",
    "bor",
    "band",
    "bxor",
    "pow",
    "concat",
    "lsr",
    "shr",
    "shl",
    "or",
    "and",
    "fdiv",
    "xor",
    "iseq",
    "isle",
    "islt",
    "isge",
    "isgt",
    "isne",
    /* note that from here on it's rel. ops */
    "ne",
    "eq",
    "lt",
    "le",
    "gt",
    "ge"
};

static constant *fold_i_i(int a, pir_math_operator op, int b);
static constant *fold_n_i(double a, pir_math_operator op, int b);
static constant *fold_i_n(int a, pir_math_operator op, double b);
static constant *fold_n_n(double a, pir_math_operator op, double b);
static int evaluate_i_i(int a, pir_rel_operator op, int b);
static int evaluate_n_n(double a, pir_rel_operator op, double b);
static int evaluate_i_n(int a, pir_rel_operator op, double b);
static int evaluate_n_i(double a, pir_rel_operator op, int b);
static int evaluate_s_s(char *a, pir_rel_operator op, char *b);

static char *concat_strings(char *a, char *b);

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
#define STORE_NAMED_ALIAS(NAME)             do { lexer->temp_flag_arg1 = NAME; } while (0)

#define IF_NAMED_ARG_SET_ALIAS(OBJ,EXPR)    if (TEST_FLAG(EXPR, ARG_FLAG_NAMED)) {       \
                                              set_arg_named(OBJ, lexer->temp_flag_arg1); \
                                            }


#define IF_NAMED_PARAM_SET_ALIAS(OBJ,EXPR)  if (TEST_FLAG(EXPR, TARGET_FLAG_NAMED)) {      \
                                              set_param_named(OBJ, lexer->temp_flag_arg1); \
                                            }

/* some defines to prevent magic "1"s and "0"s in the code */
#define GLOBALCONST     1

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
#line 178 "pir.y"
{
    double              dval;
    int                 ival;
    char               *sval;
    struct constant    *constval;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;

    void               *fixme;
}
/* Line 187 of yacc.c.  */
#line 481 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 494 "pirparser.c"

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
#define YYLAST   484

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  116
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  122
/* YYNRULES -- Number of rules.  */
#define YYNRULES  297
/* YYNRULES -- Number of states.  */
#define YYNSTATES  439

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   353

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   107,     2,     2,     2,   112,   114,     2,
     102,   103,   111,   109,   104,   106,   105,   110,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   101,
       2,    98,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    99,     2,   100,     2,     2,     2,     2,     2,     2,
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
      95,    96,    97,   115
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    30,    34,    37,    40,    45,    50,
      51,    53,    55,    59,    66,    69,    71,    73,    74,    77,
      79,    81,    83,    85,    87,    89,    91,    93,    95,    97,
     102,   105,   108,   110,   112,   114,   116,   117,   120,   126,
     127,   130,   131,   134,   137,   140,   142,   144,   146,   148,
     150,   152,   154,   156,   158,   160,   162,   164,   166,   168,
     171,   174,   177,   181,   185,   188,   192,   195,   200,   204,
     209,   214,   218,   221,   224,   227,   231,   235,   239,   243,
     247,   251,   255,   259,   263,   266,   269,   271,   272,   274,
     276,   280,   282,   284,   286,   289,   293,   295,   299,   302,
     308,   313,   318,   322,   326,   330,   334,   338,   342,   346,
     350,   352,   354,   356,   358,   360,   362,   364,   368,   373,
     375,   379,   382,   383,   385,   391,   393,   395,   397,   399,
     408,   409,   411,   413,   416,   420,   424,   427,   433,   434,
     437,   438,   440,   442,   445,   449,   451,   454,   458,   462,
     464,   466,   468,   473,   476,   478,   480,   482,   484,   486,
     488,   490,   492,   496,   497,   499,   501,   505,   508,   509,
     512,   514,   516,   518,   520,   523,   524,   527,   529,   531,
     536,   538,   540,   542,   544,   548,   552,   556,   560,   561,
     563,   565,   569,   571,   573,   577,   580,   582,   588,   594,
     595,   597,   599,   602,   606,   607,   609,   611,   614,   618,
     619,   622,   624,   627,   628,   630,   634,   637,   639,   641,
     644,   647,   652,   657,   662,   667,   669,   671,   673,   675,
     677,   679,   681,   683,   685,   687,   689,   691,   693,   695,
     697,   699,   701,   703,   705,   707,   709,   711,   713,   715,
     717,   719,   721,   723,   725,   727,   729,   731,   733,   735,
     737,   739,   741,   743,   745,   747,   749,   751,   753,   755,
     757,   759,   761,   763,   765,   767,   769,   771,   773,   775,
     777,   779,   781,   783,   785,   787,   789,   791
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     117,     0,    -1,   118,   119,   118,    -1,    -1,     4,    -1,
     120,    -1,   119,     4,   120,    -1,   128,    -1,   224,    -1,
     125,    -1,   123,    -1,   124,    -1,   122,    -1,   121,    -1,
       8,     7,    35,    -1,     9,    34,    -1,     5,    34,    -1,
       6,    34,    98,    34,    -1,    15,    99,   126,   100,    -1,
      -1,   127,    -1,    34,    -1,   127,   101,    34,    -1,   129,
     131,     4,   135,   137,    11,    -1,    10,   130,    -1,   233,
      -1,    34,    -1,    -1,   131,   132,    -1,    82,    -1,    79,
      -1,    80,    -1,    81,    -1,    83,    -1,    86,    -1,    88,
      -1,    89,    -1,    87,    -1,   133,    -1,    84,   102,   130,
     103,    -1,    85,   220,    -1,    90,   221,    -1,   233,    -1,
      34,    -1,   157,    -1,   230,    -1,    -1,   135,   136,    -1,
      12,   230,   233,   196,     4,    -1,    -1,   137,   138,    -1,
      -1,   139,   140,    -1,     3,     4,    -1,     3,   141,    -1,
     141,    -1,   159,    -1,   164,    -1,   165,    -1,   169,    -1,
     222,    -1,   199,    -1,   200,    -1,   171,    -1,   146,    -1,
     150,    -1,   145,    -1,   143,    -1,   142,    -1,     1,     4,
      -1,   144,     4,    -1,    48,   231,    -1,   231,    98,    48,
      -1,    28,   190,     4,    -1,   147,     4,    -1,   231,    98,
     227,    -1,   231,   148,    -1,   231,    98,   234,   227,    -1,
     231,    98,   149,    -1,   231,   157,    98,   227,    -1,   231,
      98,   231,   157,    -1,   231,    98,   151,    -1,   237,    35,
      -1,   237,    36,    -1,   236,   227,    -1,   231,   235,   227,
      -1,    35,   235,   231,    -1,    36,   235,   231,    -1,    34,
      64,   231,    -1,    34,    64,    34,    -1,    35,   235,    35,
      -1,    36,   235,    36,    -1,    35,   235,    36,    -1,    36,
     235,    35,    -1,   151,     4,    -1,   152,   153,    -1,    41,
      -1,    -1,   154,    -1,   155,    -1,   154,   104,   155,    -1,
     227,    -1,   157,    -1,   156,    -1,   231,   157,    -1,    99,
     158,   100,    -1,   227,    -1,   158,   101,   227,    -1,   160,
       4,    -1,   162,    48,   227,    49,   233,    -1,   162,   231,
     163,   233,    -1,   162,   161,    49,   233,    -1,   231,   229,
     227,    -1,    35,   229,   231,    -1,    36,   229,   231,    -1,
      35,   229,    35,    -1,    36,   229,    36,    -1,    35,   229,
      36,    -1,    36,   229,    35,    -1,    34,   229,    34,    -1,
      35,    -1,    36,    -1,    34,    -1,    46,    -1,    47,    -1,
      49,    -1,   104,    -1,    49,   233,     4,    -1,    14,   230,
     166,     4,    -1,   167,    -1,   166,   104,   167,    -1,   233,
     168,    -1,    -1,    91,    -1,    13,    34,   104,   170,     4,
      -1,   231,    -1,    41,    -1,   172,    -1,   181,    -1,    26,
       4,   173,   176,     4,   178,    27,     4,    -1,    -1,   174,
      -1,   175,    -1,   174,   175,    -1,    30,   208,     4,    -1,
      29,   188,   177,    -1,    32,   188,    -1,    16,   188,     4,
      17,   187,    -1,    -1,   104,   188,    -1,    -1,   179,    -1,
     180,    -1,   179,   180,    -1,    31,   193,     4,    -1,   165,
      -1,   182,     4,    -1,   190,    98,   183,    -1,   231,    98,
     183,    -1,   183,    -1,   185,    -1,   184,    -1,   188,   105,
     187,   203,    -1,   186,   203,    -1,   188,    -1,    34,    -1,
     188,    -1,   189,    -1,   233,    -1,    37,    -1,    34,    -1,
      39,    -1,   102,   191,   103,    -1,    -1,   192,    -1,   193,
      -1,   192,   104,   193,    -1,   231,   194,    -1,    -1,   194,
     195,    -1,    95,    -1,    96,    -1,    93,    -1,    91,    -1,
      92,   220,    -1,    -1,   196,   197,    -1,   195,    -1,   198,
      -1,    97,   102,   134,   103,    -1,   201,    -1,   210,    -1,
     202,    -1,   211,    -1,    20,   203,     4,    -1,    20,   183,
       4,    -1,    21,   203,     4,    -1,   102,   204,   103,    -1,
      -1,   205,    -1,   206,    -1,   205,   104,   206,    -1,   208,
      -1,   207,    -1,    34,    50,   209,    -1,   209,   218,    -1,
     227,    -1,    24,     4,   215,    25,     4,    -1,    22,     4,
     212,    23,     4,    -1,    -1,   213,    -1,   214,    -1,   213,
     214,    -1,    21,   208,     4,    -1,    -1,   216,    -1,   217,
      -1,   216,   217,    -1,    20,   208,     4,    -1,    -1,   218,
     219,    -1,    94,    -1,    92,   220,    -1,    -1,   221,    -1,
     102,    34,   103,    -1,   223,     4,    -1,   224,    -1,   225,
      -1,    19,   226,    -1,    18,   226,    -1,    42,   233,    98,
      35,    -1,    43,   233,    98,    36,    -1,    44,   233,    98,
      34,    -1,    45,   233,    98,    34,    -1,   231,    -1,   228,
      -1,    34,    -1,    35,    -1,    36,    -1,    51,    -1,    52,
      -1,    53,    -1,    54,    -1,    56,    -1,    55,    -1,    42,
      -1,    43,    -1,    44,    -1,    45,    -1,   232,    -1,    33,
      -1,    37,    -1,    38,    -1,    40,    -1,    39,    -1,    33,
      -1,    41,    -1,   106,    -1,   107,    -1,   108,    -1,   109,
      -1,   106,    -1,   110,    -1,   111,    -1,   112,    -1,   113,
      -1,   114,    -1,   108,    -1,   115,    -1,    64,    -1,    57,
      -1,    58,    -1,    59,    -1,    61,    -1,    62,    -1,    60,
      -1,    63,    -1,    52,    -1,    54,    -1,    53,    -1,    56,
      -1,    55,    -1,    51,    -1,    70,    -1,    71,    -1,    72,
      -1,    73,    -1,    76,    -1,    74,    -1,    75,    -1,    77,
      -1,    78,    -1,    66,    -1,    67,    -1,    65,    -1,    68,
      -1,    69,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   433,   433,   438,   439,   442,   443,   446,   447,   448,
     449,   450,   451,   452,   455,   459,   465,   469,   476,   480,
     481,   485,   487,   494,   500,   504,   505,   509,   510,   514,
     516,   518,   520,   522,   524,   526,   528,   530,   532,   535,
     539,   543,   549,   550,   551,   552,   555,   556,   559,   570,
     571,   574,   574,   578,   580,   582,   585,   586,   587,   588,
     589,   590,   591,   592,   593,   594,   595,   596,   597,   600,
     609,   612,   617,   624,   631,   634,   639,   645,   650,   652,
     657,   662,   666,   679,   684,   702,   707,   713,   719,   725,
     731,   736,   741,   746,   754,   757,   760,   764,   765,   768,
     770,   774,   775,   776,   779,   783,   787,   789,   793,   796,
     801,   806,   830,   836,   844,   852,   854,   856,   858,   860,
     862,   864,   866,   872,   873,   876,   877,   880,   887,   891,
     893,   897,   901,   902,   905,   920,   922,   929,   930,   933,
     945,   946,   950,   952,   956,   960,   962,   964,   970,   971,
     978,   979,   983,   985,   989,   991,   995,   999,  1001,  1003,
    1008,  1009,  1012,  1019,  1025,  1027,  1031,  1032,  1035,  1049,
    1053,  1055,  1060,  1065,  1066,  1070,  1072,  1076,  1085,  1086,
    1090,  1092,  1094,  1096,  1098,  1105,  1106,  1110,  1111,  1114,
    1121,  1122,  1125,  1126,  1129,  1133,  1137,  1143,  1148,  1149,
    1162,  1164,  1168,  1169,  1172,  1178,  1185,  1189,  1197,  1206,
    1207,  1212,  1214,  1219,  1224,  1225,  1229,  1231,  1235,  1241,
    1242,  1246,  1248,  1255,  1256,  1260,  1264,  1267,  1268,  1271,
    1275,  1279,  1281,  1283,  1285,  1294,  1295,  1298,  1299,  1300,
    1303,  1304,  1305,  1306,  1307,  1308,  1311,  1312,  1313,  1314,
    1317,  1318,  1327,  1328,  1329,  1330,  1333,  1334,  1337,  1338,
    1339,  1342,  1343,  1344,  1345,  1346,  1347,  1348,  1349,  1350,
    1351,  1352,  1353,  1354,  1355,  1356,  1357,  1358,  1359,  1360,
    1361,  1362,  1363,  1364,  1368,  1369,  1370,  1371,  1372,  1373,
    1374,  1375,  1376,  1377,  1378,  1379,  1382,  1383
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
  "\"PMC register\"", "\"number register\"", "\"string register\"",
  "\"integer register\"", "\"parrot instruction\"", "\"int\"", "\"num\"",
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
  "namespace_decl", "opt_namespace_id", "namespace_id", "sub_def",
  "sub_head", "sub_id", "sub_flags", "sub_flag", "sub_flag_with_arg",
  "multi_type", "parameters", "parameter", "instructions", "instruction",
  "@1", "instr", "statement", "error_stat", "null_stat", "null_instr",
  "getresults_stat", "assignment_stat", "assignment", "augmentive_expr",
  "binary_expr", "parrot_stat", "parrot_instruction", "parrot_op",
  "opt_op_args", "op_args", "op_arg", "keyaccess", "keylist", "keys",
  "conditional_stat", "conditional_instr", "condition", "if_unless",
  "then", "goto_stat", "local_decl", "local_id_list", "local_id",
  "has_unique_reg", "lex_decl", "lex_target", "invocation_stat",
  "long_invocation_stat", "opt_long_arguments", "long_arguments",
  "long_argument", "long_invocation", "opt_ret_cont", "opt_long_results",
  "long_results", "long_result", "short_invocation_stat",
  "short_invocation", "simple_invocation", "methodcall", "subcall", "sub",
  "method", "invokable", "string_object", "opt_target_list", "opt_list",
  "target_list", "result_target", "target_flags", "target_flag",
  "param_flags", "param_flag", "invocant_param", "return_stat",
  "yield_stat", "short_return_stat", "short_yield_stat", "arguments",
  "opt_arguments_list", "arguments_list", "argument", "named_arg",
  "short_arg", "arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "expression", "constant", "rel_op", "type", "target",
  "reg", "identifier", "unop", "binop", "augmented_op", "augm_add_op", 0
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
     345,   346,   347,   348,   349,   350,   351,   352,    61,    91,
      93,    59,    40,    41,    44,    46,    45,    33,   126,    43,
      47,    42,    37,   124,    38,   353
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   116,   117,   118,   118,   119,   119,   120,   120,   120,
     120,   120,   120,   120,   121,   122,   123,   124,   125,   126,
     126,   127,   127,   128,   129,   130,   130,   131,   131,   132,
     132,   132,   132,   132,   132,   132,   132,   132,   132,   133,
     133,   133,   134,   134,   134,   134,   135,   135,   136,   137,
     137,   139,   138,   140,   140,   140,   141,   141,   141,   141,
     141,   141,   141,   141,   141,   141,   141,   141,   141,   142,
     143,   144,   144,   145,   146,   147,   147,   147,   147,   147,
     147,   147,   148,   148,   148,   149,   149,   149,   149,   149,
     149,   149,   149,   149,   150,   151,   152,   153,   153,   154,
     154,   155,   155,   155,   156,   157,   158,   158,   159,   160,
     160,   160,   161,   161,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   162,   162,   163,   163,   164,   165,   166,
     166,   167,   168,   168,   169,   170,   170,   171,   171,   172,
     173,   173,   174,   174,   175,   176,   176,   176,   177,   177,
     178,   178,   179,   179,   180,   180,   181,   182,   182,   182,
     183,   183,   184,   185,   186,   186,   187,   187,   188,   188,
     189,   189,   190,   191,   191,   192,   192,   193,   194,   194,
     195,   195,   195,   195,   195,   196,   196,   197,   197,   198,
     199,   199,   200,   200,   201,   201,   202,   203,   204,   204,
     205,   205,   206,   206,   207,   208,   209,   210,   211,   212,
     212,   213,   213,   214,   215,   215,   216,   216,   217,   218,
     218,   219,   219,   220,   220,   221,   222,   223,   223,   224,
     225,   226,   226,   226,   226,   227,   227,   228,   228,   228,
     229,   229,   229,   229,   229,   229,   230,   230,   230,   230,
     231,   231,   232,   232,   232,   232,   233,   233,   234,   234,
     234,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   236,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   237,   237
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     3,     2,     2,     4,     4,     0,
       1,     1,     3,     6,     2,     1,     1,     0,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       2,     2,     1,     1,     1,     1,     0,     2,     5,     0,
       2,     0,     2,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       2,     2,     3,     3,     2,     3,     2,     4,     3,     4,
       4,     3,     2,     2,     2,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     2,     2,     1,     0,     1,     1,
       3,     1,     1,     1,     2,     3,     1,     3,     2,     5,
       4,     4,     3,     3,     3,     3,     3,     3,     3,     3,
       1,     1,     1,     1,     1,     1,     1,     3,     4,     1,
       3,     2,     0,     1,     5,     1,     1,     1,     1,     8,
       0,     1,     1,     2,     3,     3,     2,     5,     0,     2,
       0,     1,     1,     2,     3,     1,     2,     3,     3,     1,
       1,     1,     4,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     0,     1,     1,     3,     2,     0,     2,
       1,     1,     1,     1,     2,     0,     2,     1,     1,     4,
       1,     1,     1,     1,     3,     3,     3,     3,     0,     1,
       1,     3,     1,     1,     3,     2,     1,     5,     5,     0,
       1,     1,     2,     3,     0,     1,     1,     2,     3,     0,
       2,     1,     2,     0,     1,     3,     2,     1,     1,     2,
       2,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     3,     5,    13,    12,    10,    11,     9,     7,
      27,     8,    16,     0,     0,    15,   256,    26,   257,    24,
      25,    19,     0,     0,     0,     0,   229,     4,     2,     0,
       0,    14,    21,     0,    20,     0,     0,     0,     0,     6,
      46,    30,    31,    32,    29,    33,     0,   223,    34,    37,
      35,    36,     0,    28,    38,    17,    18,     0,     0,     0,
       0,     0,    49,     0,     0,    40,   224,    41,    22,   231,
     232,   233,   234,     0,    47,    51,     0,     0,   246,   247,
     248,   249,     0,    23,    50,     0,    39,   225,   185,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     251,   165,   252,   253,   255,   254,    96,   123,   124,     0,
       0,   173,    52,    55,    68,    67,     0,    66,    64,     0,
      65,     0,    97,    56,     0,     0,    57,    58,    59,    63,
     137,   138,     0,   159,   161,   160,     0,   164,     0,    61,
      62,   190,   192,   191,   193,    60,     0,   227,   228,     0,
     250,   168,     0,    69,    53,    54,     0,     0,   230,   169,
     198,     0,     0,     0,   209,   214,   140,     0,   251,   252,
      71,     0,     0,   174,   175,   178,    70,    74,    94,   237,
     238,   239,     0,    95,    98,    99,   103,   102,   101,   236,
     235,   108,   122,   120,   121,     0,     0,     0,   156,   163,
       0,     0,   226,   295,   293,   294,   296,   297,   284,   285,
     286,   287,   289,   290,   288,   291,   292,     0,    76,     0,
       0,     0,    48,   183,   223,   182,   180,   181,     0,   187,
     186,   188,     0,     0,   129,   132,   237,     0,   199,   200,
     203,   202,   219,   206,   235,   195,   194,   196,     0,     0,
     210,   211,     0,     0,   215,   216,     0,     0,   141,   142,
      73,   127,   172,     0,   177,     0,   106,     0,   104,   240,
     241,   242,   243,   245,   244,     0,     0,     0,     0,     0,
     125,   126,     0,     0,   170,   171,     0,   166,   167,   157,
     165,   238,   239,    72,   258,   259,   260,    78,    81,   158,
      75,   235,     0,     0,    84,    82,    83,   184,     0,   136,
       0,   135,   128,     0,   133,   131,     0,   197,     0,   205,
       0,     0,   212,     0,     0,   217,     0,     0,     0,     0,
       0,   143,   176,   179,   105,     0,   100,   119,   115,   117,
     113,   118,   116,   114,     0,   111,   110,   112,   162,     0,
     283,   278,   280,   279,   282,   281,   271,   272,   273,   276,
     274,   275,   277,   270,   262,   268,   261,   263,   264,   265,
     266,   267,   269,     0,     0,    80,     0,    77,    79,    43,
       0,    44,    45,    42,   134,   130,   204,   201,   223,   221,
     220,   213,   208,   218,   207,   144,     0,   148,   146,   150,
     107,   109,    89,    88,    90,    92,    86,    93,    91,    87,
      85,   189,   222,     0,     0,   145,     0,   155,     0,   151,
     152,     0,   149,     0,     0,   153,   147,   154,   139
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      43,    44,    19,    20,    29,    39,    63,    64,   390,    72,
      84,    85,    94,    95,   122,   123,   124,   125,   126,   127,
     128,   129,   228,   307,   130,   131,   132,   193,   194,   195,
     196,   197,   275,   133,   134,   206,   135,   292,   136,   137,
     243,   244,   325,   138,   320,   139,   140,   267,   268,   269,
     340,   425,   428,   429,   430,   141,   142,   143,   144,   145,
     146,   296,   147,   298,   148,   182,   183,   184,   274,   239,
     162,   240,   241,   149,   150,   151,   152,   172,   247,   248,
     249,   250,   251,   252,   153,   154,   259,   260,   261,   263,
     264,   265,   329,   400,    75,    76,   155,   156,    21,   158,
      36,   253,   199,   285,    92,   254,   160,   161,   312,   383,
     230,   231
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -392
static const yytype_int16 yypact[] =
{
      11,  -392,    21,   136,  -392,    22,    44,    67,    59,   115,
      18,   200,   109,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,    38,   108,  -392,  -392,  -392,  -392,  -392,
    -392,   131,   146,   146,   146,   146,  -392,   136,  -392,    40,
     133,  -392,  -392,    69,    79,   132,   140,   142,   150,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,   111,   134,  -392,  -392,
    -392,  -392,   134,  -392,  -392,  -392,  -392,   215,   222,   227,
     230,   231,   265,   115,   248,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,   353,  -392,   275,   184,   196,  -392,  -392,
    -392,  -392,   146,  -392,  -392,   213,  -392,  -392,  -392,   296,
     284,   267,   353,   200,   -21,   205,   307,   312,   315,   211,
     -10,  -392,   153,  -392,  -392,  -392,   179,  -392,  -392,   151,
     146,   151,  -392,  -392,  -392,  -392,   316,  -392,  -392,   322,
    -392,   323,    -3,  -392,   324,   138,  -392,  -392,  -392,  -392,
    -392,  -392,   325,  -392,  -392,  -392,   205,   238,   246,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,   332,  -392,  -392,   360,
    -392,  -392,    10,  -392,  -392,  -392,   271,   146,  -392,  -392,
     164,   378,   379,   380,   372,   382,   369,   396,  -392,  -392,
    -392,   407,   310,   308,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,   172,  -392,   335,  -392,  -392,  -392,  -392,  -392,
     317,  -392,   168,   168,   168,   172,   365,    33,  -392,  -392,
      75,    57,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,    32,  -392,   342,
     172,   157,  -392,  -392,   134,  -392,  -392,  -392,   339,  -392,
    -392,  -392,    14,     6,  -392,   351,   393,   343,   340,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,   172,   422,
     372,  -392,   172,   423,   382,  -392,   172,    47,   369,  -392,
    -392,  -392,  -392,   151,   183,   128,  -392,    -3,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,   413,   233,   302,   400,   146,
    -392,  -392,   146,   172,  -392,  -392,   205,  -392,  -392,  -392,
      13,   309,   309,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,   295,   172,   172,  -392,  -392,  -392,  -392,    16,  -392,
     446,  -392,  -392,   146,  -392,  -392,   172,  -392,   164,    60,
     447,   448,  -392,   449,   450,  -392,   451,   120,   120,   120,
     452,  -392,  -392,  -392,  -392,   172,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,   146,  -392,  -392,  -392,  -392,   256,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,   341,   352,  -392,   172,  -392,  -392,  -392,
     354,  -392,  -392,  -392,  -392,  -392,  -392,  -392,   134,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,   456,   357,  -392,     8,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,   445,   120,  -392,   151,  -392,   436,     8,
    -392,    75,  -392,   460,   461,  -392,  -392,  -392,  -392
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -392,  -392,   454,  -392,   430,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,   395,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,   370,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,   242,  -392,  -392,  -392,   194,
    -392,  -152,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -391,
    -392,   149,  -392,  -392,  -392,  -392,  -392,  -392,  -392,   206,
    -392,  -392,  -392,  -392,    46,  -392,  -392,   -93,  -392,  -392,
    -392,    42,  -206,  -392,   367,  -392,  -392,  -264,  -392,   203,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -100,  -392,  -392,
     152,  -392,   -98,   155,  -392,  -392,  -392,  -392,   218,  -392,
    -392,   219,  -392,  -392,  -228,   417,  -392,  -392,     4,  -392,
     381,  -130,  -392,  -162,  -101,   -92,  -392,    -9,  -392,  -283,
    -392,  -392
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -258
static const yytype_int16 yytable[] =
{
      30,   167,   198,   159,   297,   173,   317,   229,   159,   342,
     322,   171,    26,   111,   232,     1,   169,  -237,   427,   384,
      28,     4,   102,    45,    46,    47,    48,   180,   386,   185,
     178,   189,   190,   191,   179,   113,   114,   115,   427,   426,
     200,   286,   287,   207,    50,   293,   209,   178,   278,    26,
     389,   179,   113,   114,   115,   319,    22,    28,    88,    89,
      90,    91,   276,   337,    30,   110,   300,   301,   302,   112,
     113,   114,   115,   116,    24,   288,   338,   359,    23,   339,
     303,   170,   290,    98,   279,   280,   281,   282,   283,   284,
      26,   111,  -256,    25,   169,  -256,   192,   310,    28,   157,
     314,   233,   234,   235,   157,   236,   237,   238,    26,   294,
     323,   181,   169,    37,   295,   192,    28,    31,   299,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,   406,   407,   408,   309,   311,    40,   291,   304,   305,
     306,     5,     6,    41,     7,     8,     9,   198,    26,    27,
     321,    10,   398,    26,   399,    11,    28,   169,   245,   385,
     330,    28,   433,   357,   333,    42,   391,    65,   336,    66,
     422,   178,   202,   203,   204,   179,   113,   114,   115,    26,
      67,   185,   387,   388,   178,   200,   205,    28,   179,   113,
     114,   115,   315,   316,   350,   353,   358,   178,   246,   190,
     191,   179,   113,   114,   115,   178,   189,   190,   191,   179,
     113,   114,   115,    73,    99,   410,   100,   392,   432,   279,
     280,   281,   282,   283,   284,   297,   101,   102,   344,   345,
      68,   103,    11,   104,   105,   106,    74,   107,    69,   108,
      70,   109,    32,    33,    34,    35,   110,   111,    71,    78,
     112,   113,   114,   115,   116,  -169,   420,    79,  -169,   117,
     118,   119,   120,    80,    81,    82,   178,   413,   348,   349,
     179,   113,   114,   115,   233,   234,   235,    83,   236,   237,
     355,  -257,    87,   356,  -257,    99,    93,    96,   164,   178,
     412,   416,   419,   179,   113,   114,   115,   101,   102,    97,
     163,   166,   103,    11,   104,   105,   106,   170,   107,   393,
     108,   174,   109,   121,   245,   121,   175,   110,   111,   176,
     186,   112,   113,   114,   115,   116,   187,   188,   201,   208,
     117,   118,   119,   120,   185,   178,   212,   351,   352,   179,
     113,   114,   115,   210,   211,   411,   360,   361,   362,   363,
     364,   365,   366,   367,   368,   369,   370,   371,   372,   373,
     360,   361,   362,   363,   364,   365,   366,   367,   368,   369,
     370,   371,   372,   373,   178,   242,   414,   415,   179,   113,
     114,   115,   255,   256,   257,   178,   121,   417,   418,   179,
     113,   114,   115,   258,   192,    88,    89,    90,    91,   266,
     270,   374,   262,   375,   376,   377,   378,   379,   380,   381,
     382,   271,   273,   272,   289,   374,   192,   375,   376,   377,
     378,   379,   380,   381,   382,   213,   214,   215,   216,   217,
     218,   219,   220,   221,   222,   223,   224,   225,   226,   277,
     313,   318,   324,   326,   328,   331,   327,   347,   334,   354,
     394,   401,   402,   403,   404,   405,   409,   421,   227,   192,
     423,   424,   431,   434,   437,   438,    38,    49,    86,   308,
     165,   346,   395,   436,   341,   435,   177,   343,   332,    77,
     397,   396,     0,   335,   168
};

static const yytype_int16 yycheck[] =
{
       9,   102,   132,    95,   210,   105,   234,   159,   100,   273,
       4,   104,    33,    34,     4,     4,    37,     4,   409,   302,
      41,     0,    14,    32,    33,    34,    35,   119,   311,   121,
      33,    34,    35,    36,    37,    38,    39,    40,   429,    31,
     132,   203,   204,   135,     4,   207,   146,    33,   200,    33,
      34,    37,    38,    39,    40,    41,    34,    41,    42,    43,
      44,    45,   192,    16,    73,    33,    34,    35,    36,    37,
      38,    39,    40,    41,     7,   205,    29,    64,    34,    32,
      48,   102,    49,    92,    51,    52,    53,    54,    55,    56,
      33,    34,   102,    34,    37,   105,    99,   227,    41,    95,
     230,    91,    92,    93,   100,    95,    96,    97,    33,    34,
     104,   120,    37,     4,    39,    99,    41,    99,   211,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,   337,   338,   339,   227,   227,    98,   104,   106,   107,
     108,     5,     6,    35,     8,     9,    10,   277,    33,    34,
     242,    15,    92,    33,    94,    19,    41,    37,   167,   311,
     258,    41,   426,   293,   262,    34,   318,    34,   266,   100,
     398,    33,    34,    35,    36,    37,    38,    39,    40,    33,
     101,   273,   312,   313,    33,   277,    48,    41,    37,    38,
      39,    40,    35,    36,   286,   287,   296,    33,    34,    35,
      36,    37,    38,    39,    40,    33,    34,    35,    36,    37,
      38,    39,    40,   102,     1,   345,     3,   318,   424,    51,
      52,    53,    54,    55,    56,   431,    13,    14,   100,   101,
      98,    18,    19,    20,    21,    22,   102,    24,    98,    26,
      98,    28,    42,    43,    44,    45,    33,    34,    98,    34,
      37,    38,    39,    40,    41,   102,   386,    35,   105,    46,
      47,    48,    49,    36,    34,    34,    33,   359,    35,    36,
      37,    38,    39,    40,    91,    92,    93,    12,    95,    96,
     289,   102,    34,   292,   105,     1,    11,   103,     4,    33,
      34,   383,   384,    37,    38,    39,    40,    13,    14,   103,
       4,    34,    18,    19,    20,    21,    22,   102,    24,   318,
      26,     4,    28,   102,   323,   102,     4,    33,    34,     4,
       4,    37,    38,    39,    40,    41,     4,     4,     4,     4,
      46,    47,    48,    49,   426,    33,     4,    35,    36,    37,
      38,    39,    40,   105,    98,   354,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    33,   104,    35,    36,    37,    38,
      39,    40,     4,     4,     4,    33,   102,    35,    36,    37,
      38,    39,    40,    21,    99,    42,    43,    44,    45,    30,
       4,   106,    20,   108,   109,   110,   111,   112,   113,   114,
     115,     4,   104,   103,    49,   106,    99,   108,   109,   110,
     111,   112,   113,   114,   115,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,   104,
      98,   102,    91,    50,   104,    23,   103,    34,    25,    49,
       4,     4,     4,     4,     4,     4,     4,   103,    98,    99,
       4,   104,    17,    27,     4,     4,    12,    37,    73,   227,
     100,   277,   323,   431,   268,   429,   109,   274,   260,    62,
     328,   326,    -1,   264,   103
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   117,   118,     0,     5,     6,     8,     9,    10,
      15,    19,   119,   120,   121,   122,   123,   124,   125,   128,
     129,   224,    34,    34,     7,    34,    33,    34,    41,   130,
     233,    99,    42,    43,    44,    45,   226,     4,   118,   131,
      98,    35,    34,   126,   127,   233,   233,   233,   233,   120,
       4,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,    90,   132,   133,    34,   100,   101,    98,    98,
      98,    98,   135,   102,   102,   220,   221,   221,    34,    35,
      36,    34,    34,    12,   136,   137,   130,    34,    42,    43,
      44,    45,   230,    11,   138,   139,   103,   103,   233,     1,
       3,    13,    14,    18,    20,    21,    22,    24,    26,    28,
      33,    34,    37,    38,    39,    40,    41,    46,    47,    48,
      49,   102,   140,   141,   142,   143,   144,   145,   146,   147,
     150,   151,   152,   159,   160,   162,   164,   165,   169,   171,
     172,   181,   182,   183,   184,   185,   186,   188,   190,   199,
     200,   201,   202,   210,   211,   222,   223,   224,   225,   231,
     232,   233,   196,     4,     4,   141,    34,   230,   226,    37,
     102,   183,   203,   203,     4,     4,     4,   190,    33,    37,
     231,   233,   191,   192,   193,   231,     4,     4,     4,    34,
      35,    36,    99,   153,   154,   155,   156,   157,   227,   228,
     231,     4,    34,    35,    36,    48,   161,   231,     4,   203,
     105,    98,     4,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    98,   148,   157,
     236,   237,     4,    91,    92,    93,    95,    96,    97,   195,
     197,   198,   104,   166,   167,   233,    34,   204,   205,   206,
     207,   208,   209,   227,   231,     4,     4,     4,    21,   212,
     213,   214,    20,   215,   216,   217,    30,   173,   174,   175,
       4,     4,   103,   104,   194,   158,   227,   104,   157,    51,
      52,    53,    54,    55,    56,   229,   229,   229,   227,    49,
      49,   104,   163,   229,    34,    39,   187,   188,   189,   183,
      34,    35,    36,    48,   106,   107,   108,   149,   151,   183,
     227,   231,   234,    98,   227,    35,    36,   220,   102,    41,
     170,   231,     4,   104,    91,   168,    50,   103,   104,   218,
     208,    23,   214,   208,    25,   217,   208,    16,    29,    32,
     176,   175,   193,   195,   100,   101,   155,    34,    35,    36,
     231,    35,    36,   231,    49,   233,   233,   227,   203,    64,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,   106,   108,   109,   110,   111,   112,
     113,   114,   115,   235,   235,   157,   235,   227,   227,    34,
     134,   157,   230,   233,     4,   167,   209,   206,    92,    94,
     219,     4,     4,     4,     4,     4,   188,   188,   188,     4,
     227,   233,    34,   231,    35,    36,   231,    35,    36,   231,
     227,   103,   220,     4,   104,   177,    31,   165,   178,   179,
     180,    17,   188,   193,    27,   180,   187,     4,     4
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
#line 456 "pir.y"
    { set_pragma(PRAGMA_N_OPERATORS, (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 15:
#line 460 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 16:
#line 466 "pir.y"
    { set_hll((yyvsp[(2) - (2)].sval)); ;}
    break;

  case 17:
#line 470 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 19:
#line 480 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 20:
#line 482 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].fixme); ;}
    break;

  case 21:
#line 486 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 22:
#line 488 "pir.y"
    { ;}
    break;

  case 24:
#line 501 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 27:
#line 509 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 28:
#line 511 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 29:
#line 515 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 30:
#line 517 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 31:
#line 519 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 32:
#line 521 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 33:
#line 523 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 34:
#line 525 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 35:
#line 527 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 36:
#line 529 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 37:
#line 531 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 39:
#line 536 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;
                           set_sub_outer(lexer, (yyvsp[(3) - (4)].sval));
                         ;}
    break;

  case 40:
#line 540 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE;
                           set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 41:
#line 544 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEXID;
                           set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 48:
#line 560 "pir.y"
    {
                           declare_local(lexer, (yyvsp[(2) - (5)].ival), new_local((yyvsp[(3) - (5)].sval), 0));
                         ;}
    break;

  case 51:
#line 574 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 53:
#line 579 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 54:
#line 581 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 69:
#line 601 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 71:
#line 613 "pir.y"
    {
                           set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (2)].targ)));
                         ;}
    break;

  case 72:
#line 618 "pir.y"
    {
                           set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ)));
                         ;}
    break;

  case 73:
#line 625 "pir.y"
    {
                           set_instr(lexer, "get_results");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                         ;}
    break;

  case 75:
#line 635 "pir.y"
    {
                           set_instr(lexer, "set");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 76:
#line 640 "pir.y"
    {
                           /*set_instr(lexer, $2);*/
                           /*add_operands(lexer, 2, expr_from_target($1), $3);*/
                           unshift_operand(lexer, expr_from_target((yyvsp[(1) - (2)].targ)));
                         ;}
    break;

  case 77:
#line 646 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(3) - (4)].sval));
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)), (yyvsp[(4) - (4)].expr));
                         ;}
    break;

  case 78:
#line 651 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 79:
#line 653 "pir.y"
    {
                           set_instr(lexer, "set");
                           /* XXX fix key stuff */
                         ;}
    break;

  case 80:
#line 658 "pir.y"
    {
                           set_instr(lexer, "set");
                           /* XXX fix key stuff */
                         ;}
    break;

  case 81:
#line 663 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 82:
#line 667 "pir.y"
    {
                           if ((yyvsp[(2) - (2)].ival) == 1) {
                              if ((yyvsp[(1) - (2)].ival) == OP_ADD)
                                 set_instr(lexer, "inc");
                              else if((yyvsp[(1) - (2)].ival) == OP_SUB)
                                 set_instr(lexer, "dec");
                           }
                           else {
                              set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                              push_operand(lexer, expr_from_const(new_const(INT_TYPE, NULL, (yyvsp[(2) - (2)].ival))));
                           }
                         ;}
    break;

  case 83:
#line 680 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, expr_from_const(new_const(NUM_TYPE, NULL, (yyvsp[(2) - (2)].dval))));
                         ;}
    break;

  case 84:
#line 685 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, (yyvsp[(2) - (2)].expr));
                         ;}
    break;

  case 85:
#line 703 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 86:
#line 708 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(INT_TYPE, NULL, (yyvsp[(1) - (3)].ival))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 87:
#line 714 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(NUM_TYPE, NULL, (yyvsp[(1) - (3)].dval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 88:
#line 720 "pir.y"
    {
                           set_instr(lexer, "concat");
                           add_operands(lexer, 2, expr_from_const(new_const(STRING_TYPE, NULL, (yyvsp[(1) - (3)].sval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 89:
#line 726 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(new_const(STRING_TYPE, NULL,
                                                                         concat_strings((yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].sval)))));
                         ;}
    break;

  case 90:
#line 732 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 91:
#line 737 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))));
                         ;}
    break;

  case 92:
#line 742 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))));
                         ;}
    break;

  case 93:
#line 747 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 96:
#line 761 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 99:
#line 769 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 100:
#line 771 "pir.y"
    { push_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 104:
#line 780 "pir.y"
    { (yyval.expr) = NULL; ;}
    break;

  case 105:
#line 784 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 106:
#line 788 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 107:
#line 790 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 109:
#line 797 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null");
                           add_operands(lexer, 2, (yyvsp[(3) - (5)].expr), expr_from_ident((yyvsp[(5) - (5)].sval)));
                         ;}
    break;

  case 110:
#line 802 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)), expr_from_ident((yyvsp[(4) - (4)].sval)));
                         ;}
    break;

  case 111:
#line 807 "pir.y"
    {
                           if ((yyvsp[(2) - (4)].ival) == -1) { /* -1 means the condition is evaluated during runtime */
                              if ((yyvsp[(1) - (4)].ival)) /* "unless"? if so, invert the instruction. */
                                  invert_instr(lexer);

                              push_operand(lexer, expr_from_ident((yyvsp[(4) - (4)].sval)));
                           }
                           else { /* evaluation during compile time */
                              /* if the result was false but the instr. was "unless", or,
                               * if the result was true and the instr. was "if",
                               * do an unconditional jump.
                               */
                              if ( (((yyvsp[(2) - (4)].ival) == 0) && (yyvsp[(1) - (4)].ival)) || (((yyvsp[(2) - (4)].ival) == 1) && !(yyvsp[(1) - (4)].ival)) ) {
                                 set_instr(lexer, "branch");
                                 push_operand(lexer, expr_from_ident((yyvsp[(4) - (4)].sval)));
                              }
                              else {
                                 set_instr(lexer, "nop");
                              }
                           }
                         ;}
    break;

  case 112:
#line 831 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                           (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                         ;}
    break;

  case 113:
#line 837 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(INT_TYPE, NULL, (yyvsp[(1) - (3)].ival))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 114:
#line 845 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(NUM_TYPE, NULL, (yyvsp[(1) - (3)].dval))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 115:
#line 853 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 116:
#line 855 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 117:
#line 857 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 118:
#line 859 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 119:
#line 861 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 120:
#line 863 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].ival) ? 1 : 0; ;}
    break;

  case 121:
#line 865 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].dval) ? 1 : 0; ;}
    break;

  case 122:
#line 867 "pir.y"
    { /* if string length > 0 return true, unless the string equals "0". */
                           (yyval.ival) = strlen((yyvsp[(1) - (1)].sval)) ? ((strcmp((yyvsp[(1) - (1)].sval), "0") == 0) ? 0 : 1) : 0;
                         ;}
    break;

  case 123:
#line 872 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 124:
#line 873 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 127:
#line 881 "pir.y"
    {
                           set_instr(lexer, "branch");
                           push_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 128:
#line 888 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 129:
#line 892 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 130:
#line 894 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 131:
#line 898 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 132:
#line 901 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 133:
#line 902 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 134:
#line 906 "pir.y"
    { /* check whether the target was declared, and if its type is PMC */
                           if ((yyvsp[(4) - (5)].targ) != NULL) {
                               if ((yyvsp[(4) - (5)].targ)->type == PMC_TYPE)
                                   set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                               else
                                   yyerror(yyscanner, lexer,
                                           "2nd argument to .lex must be of type PMC");
                           }
                           else {
                                yyerror(yyscanner, lexer, "target for .lex was not declared");
                           }
                         ;}
    break;

  case 135:
#line 921 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 136:
#line 923 "pir.y"
    { (yyval.targ) = find_target(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 139:
#line 938 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                           ;}
    break;

  case 140:
#line 945 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 141:
#line 947 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 142:
#line 951 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 143:
#line 953 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 144:
#line 957 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 145:
#line 961 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 146:
#line 963 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 147:
#line 966 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 148:
#line 970 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 149:
#line 972 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 150:
#line 978 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 151:
#line 980 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 152:
#line 984 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 153:
#line 986 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 154:
#line 990 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 155:
#line 992 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 157:
#line 1000 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 158:
#line 1002 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 159:
#line 1004 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 162:
#line 1013 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 163:
#line 1020 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 164:
#line 1026 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 165:
#line 1028 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 168:
#line 1036 "pir.y"
    { symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                              /* if the symbol was found, its type must be a PMC;
                               * else, if the symbol was not found, it's a global identifier
                               * referring to some other sub. We don't check that during
                               * the parsing phase.
                               */
                              if (sym && sym->type != PMC_TYPE) {
                                  yyerror(yyscanner, lexer,
                                          "invokable identifier must be of type PMC!");
                              }

                              (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval));
                            ;}
    break;

  case 169:
#line 1050 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 170:
#line 1054 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 171:
#line 1056 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 172:
#line 1061 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 173:
#line 1065 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 174:
#line 1067 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 175:
#line 1071 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 176:
#line 1073 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 177:
#line 1077 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 178:
#line 1085 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 179:
#line 1087 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 180:
#line 1091 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 181:
#line 1093 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 182:
#line 1095 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 183:
#line 1097 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 184:
#line 1099 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 185:
#line 1105 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 186:
#line 1107 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 189:
#line 1115 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 194:
#line 1130 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 195:
#line 1134 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 196:
#line 1138 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 197:
#line 1144 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 198:
#line 1148 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 199:
#line 1150 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 200:
#line 1163 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 201:
#line 1165 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 204:
#line 1173 "pir.y"
    { (yyval.argm) = (yyvsp[(3) - (3)].argm);
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 205:
#line 1179 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (2)].argm);
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 206:
#line 1186 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 207:
#line 1192 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 208:
#line 1200 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 209:
#line 1206 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 210:
#line 1208 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 211:
#line 1213 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 212:
#line 1215 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 213:
#line 1220 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 214:
#line 1224 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 215:
#line 1226 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 216:
#line 1230 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 217:
#line 1232 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 218:
#line 1236 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 219:
#line 1241 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 220:
#line 1243 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 221:
#line 1247 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 222:
#line 1249 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 223:
#line 1255 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 224:
#line 1257 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 225:
#line 1261 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 229:
#line 1272 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 230:
#line 1276 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), GLOBALCONST); ;}
    break;

  case 231:
#line 1280 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 232:
#line 1282 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 233:
#line 1284 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 234:
#line 1286 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 235:
#line 1294 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 236:
#line 1295 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 237:
#line 1298 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 238:
#line 1299 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 239:
#line 1300 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 240:
#line 1303 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 241:
#line 1304 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 242:
#line 1305 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 243:
#line 1306 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 244:
#line 1307 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 245:
#line 1308 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 246:
#line 1311 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 247:
#line 1312 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 248:
#line 1313 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 249:
#line 1314 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 250:
#line 1317 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 251:
#line 1318 "pir.y"
    { /* find the symbol; if it's not there, emit an error */
                               symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                               if (sym == NULL)
                                   yyerror(yyscanner, lexer, "symbol not declared!");
                               else
                                   (yyval.targ) = new_target(sym->type, (yyvsp[(1) - (1)].sval));
                             ;}
    break;

  case 252:
#line 1327 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 253:
#line 1328 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 254:
#line 1329 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 255:
#line 1330 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 258:
#line 1337 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 259:
#line 1338 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 260:
#line 1339 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 261:
#line 1342 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 262:
#line 1343 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 263:
#line 1344 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 264:
#line 1345 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 265:
#line 1346 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 266:
#line 1347 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 267:
#line 1348 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 268:
#line 1349 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 269:
#line 1350 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 270:
#line 1351 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 271:
#line 1352 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 272:
#line 1353 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 273:
#line 1354 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 274:
#line 1355 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 275:
#line 1356 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 276:
#line 1357 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 277:
#line 1358 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 278:
#line 1359 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 279:
#line 1360 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 280:
#line 1361 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 281:
#line 1362 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 282:
#line 1363 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 283:
#line 1364 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 284:
#line 1368 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 285:
#line 1369 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 286:
#line 1370 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 287:
#line 1371 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 288:
#line 1372 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 289:
#line 1373 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 290:
#line 1374 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 291:
#line 1375 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 292:
#line 1376 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 293:
#line 1377 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 294:
#line 1378 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 295:
#line 1379 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 296:
#line 1382 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 297:
#line 1383 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3509 "pirparser.c"
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


#line 1386 "pir.y"


/* Constant folding routines.
 *
 *
 */

#include <math.h>
#include <assert.h>

static constant *
fold_i_i(int a, pir_math_operator op, int b) {
    int result;

    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                printf("cannot divide by 0!\n");
            else
                result = a / b;
            break;
        case OP_MUL:
            result = a * b;
            break;
        case OP_MOD:
            result = a % b;
            break;
        case OP_BOR:
            result = (a | b);
            break;
        case OP_BAND:
            result = (a & b);
            break;
        case OP_BXOR:
            result = (a ^ b);
            break;
        case OP_POW:
            result = pow(a, b);
            break;
        case OP_CONCAT:
            printf("cannot concatenate operands of type 'int' and 'int'\n");
            break;
        case OP_LSR:
            result = a; /* ?? */
            break;
        case OP_SHR:
            result = a >> b;
            break;
        case OP_SHL:
            result = a << b;
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            result = a; /* fdiv in c? */
            break;
        case OP_XOR:
            result = a ^ b; /* xor in c? */
            break;
        case OP_ISEQ:
            result = (a == b);
            break;
        case OP_ISLE:
            result = (a <= b);
            break;
        case OP_ISLT:
            result = (a < b);
            break;
        case OP_ISGE:
            result = (a >= b);
            break;
        case OP_ISGT:
            result = (a > b);
            break;
        case OP_ISNE:
            result = (a != b);
            break;
    }
    return new_const(INT_TYPE, NULL, result);
}

static constant *
fold_n_i(double a, pir_math_operator op, int b) {
    double result;
    /* XXX */
    return new_const(NUM_TYPE, NULL, result);
}

static constant *
fold_i_n(int a, pir_math_operator op, double b) {
    double result;
    /* XXX */
    return new_const(NUM_TYPE, NULL, result);
}

static constant *
fold_n_n(double a, pir_math_operator op, double b) {
    double result;
    /* XXX */
    return new_const(NUM_TYPE, NULL, result);
}

static int
evaluate_i_i(int a, pir_rel_operator op, int b) {
    return evaluate_n_n(a, op, b);
}

static int
evaluate_n_i(double a, pir_rel_operator op, int b) {
    return evaluate_n_n(a, op, b);
}

static int
evaluate_i_n(int a, pir_rel_operator op, double b) {
    return evaluate_n_n(a, op, b);
}

static int
evaluate_n_n(double a, pir_rel_operator op, double b) {
    switch (op) {
        case OP_NE:
            return (a != b);
        case OP_EQ:
            return (a == b);
        case OP_LT:
            return (a < b);
        case OP_LE:
            return (a <= b);
        case OP_GT:
            return (a > b);
        case OP_GE:
            return (a >= b);
        default:
            return 0;
    }
}

static int
evaluate_s_s(char *a, pir_rel_operator op, char *b) {
    /* XXX todo: implement this */
    return 0;
}

static char *
concat_strings(char *a, char *b) {
    int strlen_a = strlen(a);
    char *newstr = (char *)calloc(strlen_a + strlen(b) + 1, sizeof (char));
    assert(newstr != NULL);
    strcpy(newstr, a);
    strcpy(newstr + strlen_a, b);
    free(a);
    free(b);
    return newstr;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


