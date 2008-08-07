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
#define YYLAST   489

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  116
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  122
/* YYNRULES -- Number of rules.  */
#define YYNRULES  298
/* YYNRULES -- Number of states.  */
#define YYNSTATES  440

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
     209,   214,   218,   221,   224,   227,   230,   234,   238,   242,
     246,   250,   254,   258,   262,   266,   269,   272,   274,   275,
     277,   279,   283,   285,   287,   289,   292,   296,   298,   302,
     305,   311,   316,   321,   325,   329,   333,   337,   341,   345,
     349,   353,   355,   357,   359,   361,   363,   365,   367,   371,
     376,   378,   382,   385,   386,   388,   394,   396,   398,   400,
     402,   411,   412,   414,   416,   419,   423,   427,   430,   436,
     437,   440,   441,   443,   445,   448,   452,   454,   457,   461,
     465,   467,   469,   471,   476,   479,   481,   483,   485,   487,
     489,   491,   493,   495,   499,   500,   502,   504,   508,   511,
     512,   515,   517,   519,   521,   523,   526,   527,   530,   532,
     534,   539,   541,   543,   545,   547,   551,   555,   559,   563,
     564,   566,   568,   572,   574,   576,   580,   583,   585,   591,
     597,   598,   600,   602,   605,   609,   610,   612,   614,   617,
     621,   622,   625,   627,   630,   631,   633,   637,   640,   642,
     644,   647,   650,   655,   660,   665,   670,   672,   674,   676,
     678,   680,   682,   684,   686,   688,   690,   692,   694,   696,
     698,   700,   702,   704,   706,   708,   710,   712,   714,   716,
     718,   720,   722,   724,   726,   728,   730,   732,   734,   736,
     738,   740,   742,   744,   746,   748,   750,   752,   754,   756,
     758,   760,   762,   764,   766,   768,   770,   772,   774,   776,
     778,   780,   782,   784,   786,   788,   790,   792,   794
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
      -1,   237,    36,    -1,   237,   231,    -1,   236,   227,    -1,
     231,   235,   227,    -1,    35,   235,   231,    -1,    36,   235,
     231,    -1,    34,    64,   231,    -1,    34,    64,    34,    -1,
      35,   235,    35,    -1,    36,   235,    36,    -1,    35,   235,
      36,    -1,    36,   235,    35,    -1,   151,     4,    -1,   152,
     153,    -1,    41,    -1,    -1,   154,    -1,   155,    -1,   154,
     104,   155,    -1,   227,    -1,   157,    -1,   156,    -1,   231,
     157,    -1,    99,   158,   100,    -1,   227,    -1,   158,   101,
     227,    -1,   160,     4,    -1,   162,    48,   227,    49,   233,
      -1,   162,   231,   163,   233,    -1,   162,   161,    49,   233,
      -1,   231,   229,   227,    -1,    35,   229,   231,    -1,    36,
     229,   231,    -1,    35,   229,    35,    -1,    36,   229,    36,
      -1,    35,   229,    36,    -1,    36,   229,    35,    -1,    34,
     229,    34,    -1,    35,    -1,    36,    -1,    34,    -1,    46,
      -1,    47,    -1,    49,    -1,   104,    -1,    49,   233,     4,
      -1,    14,   230,   166,     4,    -1,   167,    -1,   166,   104,
     167,    -1,   233,   168,    -1,    -1,    91,    -1,    13,    34,
     104,   170,     4,    -1,   231,    -1,    41,    -1,   172,    -1,
     181,    -1,    26,     4,   173,   176,     4,   178,    27,     4,
      -1,    -1,   174,    -1,   175,    -1,   174,   175,    -1,    30,
     208,     4,    -1,    29,   188,   177,    -1,    32,   188,    -1,
      16,   188,     4,    17,   187,    -1,    -1,   104,   188,    -1,
      -1,   179,    -1,   180,    -1,   179,   180,    -1,    31,   193,
       4,    -1,   165,    -1,   182,     4,    -1,   190,    98,   183,
      -1,   231,    98,   183,    -1,   183,    -1,   185,    -1,   184,
      -1,   188,   105,   187,   203,    -1,   186,   203,    -1,   188,
      -1,    34,    -1,   188,    -1,   189,    -1,   233,    -1,    37,
      -1,    34,    -1,    39,    -1,   102,   191,   103,    -1,    -1,
     192,    -1,   193,    -1,   192,   104,   193,    -1,   231,   194,
      -1,    -1,   194,   195,    -1,    95,    -1,    96,    -1,    93,
      -1,    91,    -1,    92,   220,    -1,    -1,   196,   197,    -1,
     195,    -1,   198,    -1,    97,   102,   134,   103,    -1,   201,
      -1,   210,    -1,   202,    -1,   211,    -1,    20,   203,     4,
      -1,    20,   183,     4,    -1,    21,   203,     4,    -1,   102,
     204,   103,    -1,    -1,   205,    -1,   206,    -1,   205,   104,
     206,    -1,   208,    -1,   207,    -1,    34,    50,   209,    -1,
     209,   218,    -1,   227,    -1,    24,     4,   215,    25,     4,
      -1,    22,     4,   212,    23,     4,    -1,    -1,   213,    -1,
     214,    -1,   213,   214,    -1,    21,   208,     4,    -1,    -1,
     216,    -1,   217,    -1,   216,   217,    -1,    20,   208,     4,
      -1,    -1,   218,   219,    -1,    94,    -1,    92,   220,    -1,
      -1,   221,    -1,   102,    34,   103,    -1,   223,     4,    -1,
     224,    -1,   225,    -1,    19,   226,    -1,    18,   226,    -1,
      42,   233,    98,    35,    -1,    43,   233,    98,    36,    -1,
      44,   233,    98,    34,    -1,    45,   233,    98,    34,    -1,
     231,    -1,   228,    -1,    34,    -1,    35,    -1,    36,    -1,
      51,    -1,    52,    -1,    53,    -1,    54,    -1,    56,    -1,
      55,    -1,    42,    -1,    43,    -1,    44,    -1,    45,    -1,
     232,    -1,    33,    -1,    37,    -1,    38,    -1,    40,    -1,
      39,    -1,    33,    -1,    41,    -1,   106,    -1,   107,    -1,
     108,    -1,   109,    -1,   106,    -1,   110,    -1,   111,    -1,
     112,    -1,   113,    -1,   114,    -1,   108,    -1,   115,    -1,
      64,    -1,    57,    -1,    58,    -1,    59,    -1,    61,    -1,
      62,    -1,    60,    -1,    63,    -1,    52,    -1,    54,    -1,
      53,    -1,    56,    -1,    55,    -1,    51,    -1,    70,    -1,
      71,    -1,    72,    -1,    73,    -1,    76,    -1,    74,    -1,
      75,    -1,    77,    -1,    78,    -1,    66,    -1,    67,    -1,
      65,    -1,    68,    -1,    69,    -1
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
     609,   612,   617,   624,   631,   634,   639,   641,   646,   648,
     653,   658,   662,   676,   682,   687,   705,   710,   716,   722,
     728,   734,   739,   744,   749,   757,   760,   763,   767,   768,
     771,   773,   777,   778,   779,   782,   786,   790,   792,   796,
     799,   804,   809,   833,   839,   847,   855,   857,   859,   861,
     863,   865,   867,   869,   875,   876,   879,   880,   883,   890,
     894,   896,   900,   904,   905,   908,   923,   925,   932,   933,
     936,   948,   949,   953,   955,   959,   963,   965,   967,   973,
     974,   981,   982,   986,   988,   992,   994,   998,  1002,  1004,
    1006,  1011,  1012,  1015,  1022,  1028,  1030,  1034,  1035,  1038,
    1052,  1056,  1058,  1063,  1068,  1069,  1073,  1075,  1079,  1088,
    1089,  1093,  1095,  1097,  1099,  1101,  1108,  1109,  1113,  1114,
    1117,  1124,  1125,  1128,  1129,  1132,  1136,  1140,  1146,  1151,
    1152,  1165,  1167,  1171,  1172,  1175,  1181,  1188,  1192,  1200,
    1209,  1210,  1215,  1217,  1222,  1227,  1228,  1232,  1234,  1238,
    1244,  1245,  1249,  1251,  1258,  1259,  1263,  1267,  1270,  1271,
    1274,  1278,  1282,  1284,  1286,  1288,  1297,  1298,  1301,  1302,
    1303,  1306,  1307,  1308,  1309,  1310,  1311,  1314,  1315,  1316,
    1317,  1320,  1321,  1330,  1331,  1332,  1333,  1336,  1337,  1340,
    1341,  1342,  1345,  1346,  1347,  1348,  1349,  1350,  1351,  1352,
    1353,  1354,  1355,  1356,  1357,  1358,  1359,  1360,  1361,  1362,
    1363,  1364,  1365,  1366,  1367,  1373,  1374,  1375,  1376,  1377,
    1378,  1379,  1380,  1381,  1382,  1383,  1384,  1387,  1388
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
     147,   147,   148,   148,   148,   148,   149,   149,   149,   149,
     149,   149,   149,   149,   149,   150,   151,   152,   153,   153,
     154,   154,   155,   155,   155,   156,   157,   158,   158,   159,
     160,   160,   160,   161,   161,   161,   161,   161,   161,   161,
     161,   161,   161,   161,   162,   162,   163,   163,   164,   165,
     166,   166,   167,   168,   168,   169,   170,   170,   171,   171,
     172,   173,   173,   174,   174,   175,   176,   176,   176,   177,
     177,   178,   178,   179,   179,   180,   180,   181,   182,   182,
     182,   183,   183,   184,   185,   186,   186,   187,   187,   188,
     188,   189,   189,   190,   191,   191,   192,   192,   193,   194,
     194,   195,   195,   195,   195,   195,   196,   196,   197,   197,
     198,   199,   199,   200,   200,   201,   201,   202,   203,   204,
     204,   205,   205,   206,   206,   207,   208,   209,   210,   211,
     212,   212,   213,   213,   214,   215,   215,   216,   216,   217,
     218,   218,   219,   219,   220,   220,   221,   222,   223,   223,
     224,   225,   226,   226,   226,   226,   227,   227,   228,   228,
     228,   229,   229,   229,   229,   229,   229,   230,   230,   230,
     230,   231,   231,   232,   232,   232,   232,   233,   233,   234,
     234,   234,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   235,   235,   235,   235,   235,
     235,   235,   235,   235,   235,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,   236,   237,   237
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
       4,     3,     2,     2,     2,     2,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     2,     2,     1,     0,     1,
       1,     3,     1,     1,     1,     2,     3,     1,     3,     2,
       5,     4,     4,     3,     3,     3,     3,     3,     3,     3,
       3,     1,     1,     1,     1,     1,     1,     1,     3,     4,
       1,     3,     2,     0,     1,     5,     1,     1,     1,     1,
       8,     0,     1,     1,     2,     3,     3,     2,     5,     0,
       2,     0,     1,     1,     2,     3,     1,     2,     3,     3,
       1,     1,     1,     4,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     3,     0,     1,     1,     3,     2,     0,
       2,     1,     1,     1,     1,     2,     0,     2,     1,     1,
       4,     1,     1,     1,     1,     3,     3,     3,     3,     0,
       1,     1,     3,     1,     1,     3,     2,     1,     5,     5,
       0,     1,     1,     2,     3,     0,     1,     1,     2,     3,
       0,     2,     1,     2,     0,     1,     3,     2,     1,     1,
       2,     2,     4,     4,     4,     4,     1,     1,     1,     1,
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
       0,     0,     3,     5,    13,    12,    10,    11,     9,     7,
      27,     8,    16,     0,     0,    15,   257,    26,   258,    24,
      25,    19,     0,     0,     0,     0,   230,     4,     2,     0,
       0,    14,    21,     0,    20,     0,     0,     0,     0,     6,
      46,    30,    31,    32,    29,    33,     0,   224,    34,    37,
      35,    36,     0,    28,    38,    17,    18,     0,     0,     0,
       0,     0,    49,     0,     0,    40,   225,    41,    22,   232,
     233,   234,   235,     0,    47,    51,     0,     0,   247,   248,
     249,   250,     0,    23,    50,     0,    39,   226,   186,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     252,   166,   253,   254,   256,   255,    97,   124,   125,     0,
       0,   174,    52,    55,    68,    67,     0,    66,    64,     0,
      65,     0,    98,    56,     0,     0,    57,    58,    59,    63,
     138,   139,     0,   160,   162,   161,     0,   165,     0,    61,
      62,   191,   193,   192,   194,    60,     0,   228,   229,     0,
     251,   169,     0,    69,    53,    54,     0,     0,   231,   170,
     199,     0,     0,     0,   210,   215,   141,     0,   252,   253,
      71,     0,     0,   175,   176,   179,    70,    74,    95,   238,
     239,   240,     0,    96,    99,   100,   104,   103,   102,   237,
     236,   109,   123,   121,   122,     0,     0,     0,   157,   164,
       0,     0,   227,   296,   294,   295,   297,   298,   285,   286,
     287,   288,   290,   291,   289,   292,   293,     0,    76,     0,
       0,     0,    48,   184,   224,   183,   181,   182,     0,   188,
     187,   189,     0,     0,   130,   133,   238,     0,   200,   201,
     204,   203,   220,   207,   236,   196,   195,   197,     0,     0,
     211,   212,     0,     0,   216,   217,     0,     0,   142,   143,
      73,   128,   173,     0,   178,     0,   107,     0,   105,   241,
     242,   243,   244,   246,   245,     0,     0,     0,     0,     0,
     126,   127,     0,     0,   171,   172,     0,   167,   168,   158,
     166,   239,   240,    72,   259,   260,   261,    78,    81,   159,
      75,   236,     0,     0,    85,    82,    83,    84,   185,     0,
     137,     0,   136,   129,     0,   134,   132,     0,   198,     0,
     206,     0,     0,   213,     0,     0,   218,     0,     0,     0,
       0,     0,   144,   177,   180,   106,     0,   101,   120,   116,
     118,   114,   119,   117,   115,     0,   112,   111,   113,   163,
       0,   284,   279,   281,   280,   283,   282,   272,   273,   274,
     277,   275,   276,   278,   271,   263,   269,   262,   264,   265,
     266,   267,   268,   270,     0,     0,    80,     0,    77,    79,
      43,     0,    44,    45,    42,   135,   131,   205,   202,   224,
     222,   221,   214,   209,   219,   208,   145,     0,   149,   147,
     151,   108,   110,    90,    89,    91,    93,    87,    94,    92,
      88,    86,   190,   223,     0,     0,   146,     0,   156,     0,
     152,   153,     0,   150,     0,     0,   154,   148,   155,   140
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    12,    13,    14,    15,    16,    17,    18,
      43,    44,    19,    20,    29,    39,    63,    64,   391,    72,
      84,    85,    94,    95,   122,   123,   124,   125,   126,   127,
     128,   129,   228,   307,   130,   131,   132,   193,   194,   195,
     196,   197,   275,   133,   134,   206,   135,   292,   136,   137,
     243,   244,   326,   138,   321,   139,   140,   267,   268,   269,
     341,   426,   429,   430,   431,   141,   142,   143,   144,   145,
     146,   296,   147,   298,   148,   182,   183,   184,   274,   239,
     162,   240,   241,   149,   150,   151,   152,   172,   247,   248,
     249,   250,   251,   252,   153,   154,   259,   260,   261,   263,
     264,   265,   330,   401,    75,    76,   155,   156,    21,   158,
      36,   253,   199,   285,    92,   254,   160,   161,   312,   384,
     230,   231
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -389
static const yytype_int16 yypact[] =
{
       5,  -389,    45,   324,  -389,    39,    44,    49,    59,     3,
     -38,    86,    95,  -389,  -389,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,     6,    75,  -389,  -389,  -389,  -389,  -389,
    -389,    69,     0,     0,     0,     0,  -389,   324,  -389,   120,
      79,  -389,  -389,    19,    36,    40,    51,    53,    54,  -389,
    -389,  -389,  -389,  -389,  -389,  -389,    41,    58,  -389,  -389,
    -389,  -389,    58,  -389,  -389,  -389,  -389,   108,   131,   132,
     135,   138,   162,     3,   152,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,   170,  -389,   176,    90,    94,  -389,  -389,
    -389,  -389,     0,  -389,  -389,    68,  -389,  -389,  -389,   194,
     226,   191,   170,    86,    16,   118,   225,   237,   238,   141,
     -70,  -389,   -47,  -389,  -389,  -389,    -7,  -389,  -389,   184,
       0,   184,  -389,  -389,  -389,  -389,   245,  -389,  -389,   247,
    -389,   249,   -19,  -389,   252,   283,  -389,  -389,  -389,  -389,
    -389,  -389,   254,  -389,  -389,  -389,   118,   150,   163,  -389,
    -389,  -389,  -389,  -389,  -389,  -389,   258,  -389,  -389,   370,
    -389,  -389,    30,  -389,  -389,  -389,   165,     0,  -389,  -389,
     198,   266,   267,   272,   282,   284,   275,   302,  -389,  -389,
    -389,   320,   222,   223,  -389,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,   251,  -389,   232,  -389,  -389,  -389,  -389,  -389,
     227,  -389,   310,   310,   310,   251,   288,   124,  -389,  -389,
      26,   107,  -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,  -389,  -389,  -389,  -389,   261,  -389,   240,
     251,   351,  -389,  -389,    58,  -389,  -389,  -389,   239,  -389,
    -389,  -389,   151,     8,  -389,   253,   290,   242,   281,  -389,
    -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,   251,   369,
     282,  -389,   251,   317,   284,  -389,   251,    22,   275,  -389,
    -389,  -389,  -389,   184,   186,   -16,  -389,   -19,  -389,  -389,
    -389,  -389,  -389,  -389,  -389,   359,   361,   379,   354,     0,
    -389,  -389,     0,   251,  -389,  -389,   118,  -389,  -389,  -389,
      27,   319,   319,  -389,  -389,  -389,  -389,  -389,  -389,  -389,
    -389,   296,   251,   251,  -389,  -389,  -389,  -389,  -389,   112,
    -389,   409,  -389,  -389,     0,  -389,  -389,   251,  -389,   198,
     -15,   417,   418,  -389,   419,   420,  -389,   422,    33,    33,
      33,   446,  -389,  -389,  -389,  -389,   251,  -389,  -389,  -389,
    -389,  -389,  -389,  -389,  -389,     0,  -389,  -389,  -389,  -389,
     274,  -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,  -389,   416,   424,  -389,   251,  -389,  -389,
    -389,   355,  -389,  -389,  -389,  -389,  -389,  -389,  -389,    58,
    -389,  -389,  -389,  -389,  -389,  -389,  -389,   461,   316,  -389,
      -3,  -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,  -389,   449,    33,  -389,   184,  -389,   440,
      -3,  -389,    26,  -389,   466,   467,  -389,  -389,  -389,  -389
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -389,  -389,   460,  -389,   436,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,  -389,   401,  -389,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,  -389,  -389,   375,  -389,  -389,  -389,  -389,
    -389,  -389,  -389,  -389,  -389,   250,  -389,  -389,  -389,   199,
    -389,  -152,  -389,  -389,  -389,  -389,  -389,  -389,  -389,  -388,
    -389,   154,  -389,  -389,  -389,  -389,  -389,  -389,  -389,   211,
    -389,  -389,  -389,  -389,    50,  -389,  -389,   -91,  -389,  -389,
    -389,    52,  -206,  -389,   372,  -389,  -389,  -263,  -389,   208,
    -389,  -389,  -389,  -389,  -389,  -389,  -389,  -100,  -389,  -389,
     156,  -389,  -190,   159,  -389,  -389,  -389,  -389,   228,  -389,
    -389,   219,  -389,  -389,  -228,   425,  -389,  -389,   -48,  -389,
     386,  -130,  -389,   -42,  -101,   -92,  -389,    -9,  -389,  -272,
    -389,  -389
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -259
static const yytype_int16 yytable[] =
{
      30,   167,   198,   159,   297,   173,   318,   229,   159,     1,
     343,   102,   323,   171,   178,   189,   190,   191,   179,   113,
     114,   115,   428,    45,    46,    47,    48,   180,   427,   185,
     385,  -238,  -257,    26,   232,  -257,    26,    27,   338,   387,
     200,    28,   428,   207,    28,     4,   209,   157,   278,    26,
     111,   339,   157,   169,   340,  -170,    24,    28,  -170,    26,
     294,    31,   276,   169,    30,   295,    26,    28,   331,    99,
     169,   100,   334,    22,    28,   288,   337,   399,    23,   400,
     192,   101,   102,    98,   345,   346,   103,    11,   104,   105,
     106,   360,   107,    25,   108,  -258,   109,   310,  -258,    37,
     314,   110,   111,    42,    40,   112,   113,   114,   115,   116,
      41,   181,   324,    65,   117,   118,   119,   120,   170,    66,
     299,   233,   234,   235,    50,   236,   237,   238,    32,    33,
      34,    35,   407,   408,   409,   311,   309,    67,    68,   317,
      26,   111,    78,    73,   169,    26,   390,   198,    28,    69,
     322,    70,    71,    28,    88,    89,    90,    91,   245,   386,
      74,   286,   287,   358,   434,   293,    79,   392,    80,    81,
     121,   423,    82,   290,    83,   279,   280,   281,   282,   283,
     284,   185,   388,   389,   178,   200,    87,    93,   179,   113,
     114,   115,   320,    96,   351,   354,   359,    97,   163,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,   192,    88,    89,    90,    91,   411,   178,   393,   433,
     170,   179,   113,   114,   115,   166,   297,    99,   291,   174,
     164,   178,   246,   190,   191,   179,   113,   114,   115,   101,
     102,   175,   176,   121,   103,    11,   104,   105,   106,   186,
     107,   187,   108,   188,   109,   210,   201,   421,   208,   110,
     111,   211,   212,   112,   113,   114,   115,   116,   414,   242,
     255,   256,   117,   118,   119,   120,   257,   233,   234,   235,
     356,   236,   237,   357,   178,   189,   190,   191,   179,   113,
     114,   115,   417,   420,   110,   300,   301,   302,   112,   113,
     114,   115,   116,   258,   262,   266,   270,   178,   413,   303,
     394,   179,   113,   114,   115,   245,   178,   202,   203,   204,
     179,   113,   114,   115,   271,   272,   192,   273,   121,     5,
       6,   205,     7,     8,     9,   185,   277,   289,   313,    10,
     327,   319,   335,    11,   325,   328,   412,   361,   362,   363,
     364,   365,   366,   367,   368,   369,   370,   371,   372,   373,
     374,   279,   280,   281,   282,   283,   284,   304,   305,   306,
     361,   362,   363,   364,   365,   366,   367,   368,   369,   370,
     371,   372,   373,   374,   178,   329,   315,   316,   179,   113,
     114,   115,   332,   348,   178,   192,   349,   350,   179,   113,
     114,   115,   375,   355,   376,   377,   378,   379,   380,   381,
     382,   383,   178,   395,   352,   353,   179,   113,   114,   115,
     425,   402,   403,   404,   405,   375,   406,   376,   377,   378,
     379,   380,   381,   382,   383,   213,   214,   215,   216,   217,
     218,   219,   220,   221,   222,   223,   224,   225,   226,   178,
     410,   415,   416,   179,   113,   114,   115,   178,   422,   418,
     419,   179,   113,   114,   115,   424,   432,   435,   227,   192,
     438,   439,    38,    49,    86,   165,   347,   308,   396,   342,
     436,   177,   344,   336,   437,   398,   397,    77,   333,   168
};

static const yytype_uint16 yycheck[] =
{
       9,   102,   132,    95,   210,   105,   234,   159,   100,     4,
     273,    14,     4,   104,    33,    34,    35,    36,    37,    38,
      39,    40,   410,    32,    33,    34,    35,   119,    31,   121,
     302,     4,   102,    33,     4,   105,    33,    34,    16,   311,
     132,    41,   430,   135,    41,     0,   146,    95,   200,    33,
      34,    29,   100,    37,    32,   102,     7,    41,   105,    33,
      34,    99,   192,    37,    73,    39,    33,    41,   258,     1,
      37,     3,   262,    34,    41,   205,   266,    92,    34,    94,
      99,    13,    14,    92,   100,   101,    18,    19,    20,    21,
      22,    64,    24,    34,    26,   102,    28,   227,   105,     4,
     230,    33,    34,    34,    98,    37,    38,    39,    40,    41,
      35,   120,   104,    34,    46,    47,    48,    49,   102,   100,
     211,    91,    92,    93,     4,    95,    96,    97,    42,    43,
      44,    45,   338,   339,   340,   227,   227,   101,    98,   231,
      33,    34,    34,   102,    37,    33,    34,   277,    41,    98,
     242,    98,    98,    41,    42,    43,    44,    45,   167,   311,
     102,   203,   204,   293,   427,   207,    35,   319,    36,    34,
     102,   399,    34,    49,    12,    51,    52,    53,    54,    55,
      56,   273,   312,   313,    33,   277,    34,    11,    37,    38,
      39,    40,    41,   103,   286,   287,   296,   103,     4,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    99,    42,    43,    44,    45,   346,    33,   319,   425,
     102,    37,    38,    39,    40,    34,   432,     1,   104,     4,
       4,    33,    34,    35,    36,    37,    38,    39,    40,    13,
      14,     4,     4,   102,    18,    19,    20,    21,    22,     4,
      24,     4,    26,     4,    28,   105,     4,   387,     4,    33,
      34,    98,     4,    37,    38,    39,    40,    41,   360,   104,
       4,     4,    46,    47,    48,    49,     4,    91,    92,    93,
     289,    95,    96,   292,    33,    34,    35,    36,    37,    38,
      39,    40,   384,   385,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    21,    20,    30,     4,    33,    34,    48,
     319,    37,    38,    39,    40,   324,    33,    34,    35,    36,
      37,    38,    39,    40,     4,   103,    99,   104,   102,     5,
       6,    48,     8,     9,    10,   427,   104,    49,    98,    15,
      50,   102,    25,    19,    91,   103,   355,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    51,    52,    53,    54,    55,    56,   106,   107,   108,
      51,    52,    53,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    33,   104,    35,    36,    37,    38,
      39,    40,    23,    34,    33,    99,    35,    36,    37,    38,
      39,    40,   106,    49,   108,   109,   110,   111,   112,   113,
     114,   115,    33,     4,    35,    36,    37,    38,    39,    40,
     104,     4,     4,     4,     4,   106,     4,   108,   109,   110,
     111,   112,   113,   114,   115,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    33,
       4,    35,    36,    37,    38,    39,    40,    33,   103,    35,
      36,    37,    38,    39,    40,     4,    17,    27,    98,    99,
       4,     4,    12,    37,    73,   100,   277,   227,   324,   268,
     430,   109,   274,   264,   432,   329,   327,    62,   260,   103
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
     227,   231,   234,    98,   227,    35,    36,   231,   220,   102,
      41,   170,   231,     4,   104,    91,   168,    50,   103,   104,
     218,   208,    23,   214,   208,    25,   217,   208,    16,    29,
      32,   176,   175,   193,   195,   100,   101,   155,    34,    35,
      36,   231,    35,    36,   231,    49,   233,   233,   227,   203,
      64,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,   106,   108,   109,   110,   111,
     112,   113,   114,   115,   235,   235,   157,   235,   227,   227,
      34,   134,   157,   230,   233,     4,   167,   209,   206,    92,
      94,   219,     4,     4,     4,     4,     4,   188,   188,   188,
       4,   227,   233,    34,   231,    35,    36,   231,    35,    36,
     231,   227,   103,   220,     4,   104,   177,    31,   165,   178,
     179,   180,    17,   188,   193,    27,   180,   187,     4,     4
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
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (2)].targ))); ;}
    break;

  case 77:
#line 642 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(3) - (4)].sval));
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)), (yyvsp[(4) - (4)].expr));
                         ;}
    break;

  case 78:
#line 647 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 79:
#line 649 "pir.y"
    {
                           set_instr(lexer, "set");
                           /* XXX fix key stuff */
                         ;}
    break;

  case 80:
#line 654 "pir.y"
    {
                           set_instr(lexer, "set");
                           /* XXX fix key stuff */
                         ;}
    break;

  case 81:
#line 659 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 82:
#line 663 "pir.y"
    {
                           if ((yyvsp[(2) - (2)].ival) == 1) { /* adding/subtracting 1? */
                              if ((yyvsp[(1) - (2)].ival) == OP_ADD)
                                 set_instr(lexer, "inc");
                              else if((yyvsp[(1) - (2)].ival) == OP_SUB)
                                 set_instr(lexer, "dec");
                           }
                           else {
                              set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                              push_operand(lexer, expr_from_const(
                                           new_const(INT_TYPE, NULL, (yyvsp[(2) - (2)].ival))));
                           }
                         ;}
    break;

  case 83:
#line 677 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, expr_from_const(
                                        new_const(NUM_TYPE, NULL, (yyvsp[(2) - (2)].dval))));
                         ;}
    break;

  case 84:
#line 683 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (2)].targ)));
                         ;}
    break;

  case 85:
#line 688 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, (yyvsp[(2) - (2)].expr));
                         ;}
    break;

  case 86:
#line 706 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 87:
#line 711 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(INT_TYPE, NULL, (yyvsp[(1) - (3)].ival))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 88:
#line 717 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(NUM_TYPE, NULL, (yyvsp[(1) - (3)].dval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 89:
#line 723 "pir.y"
    {
                           set_instr(lexer, "concat");
                           add_operands(lexer, 2, expr_from_const(new_const(STRING_TYPE, NULL, (yyvsp[(1) - (3)].sval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 90:
#line 729 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(new_const(STRING_TYPE, NULL,
                                                                         concat_strings((yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].sval)))));
                         ;}
    break;

  case 91:
#line 735 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 92:
#line 740 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))));
                         ;}
    break;

  case 93:
#line 745 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))));
                         ;}
    break;

  case 94:
#line 750 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 97:
#line 764 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 100:
#line 772 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 101:
#line 774 "pir.y"
    { push_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 105:
#line 783 "pir.y"
    { (yyval.expr) = NULL; ;}
    break;

  case 106:
#line 787 "pir.y"
    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
    break;

  case 107:
#line 791 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 108:
#line 793 "pir.y"
    { (yyval.expr) = add_key((yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 110:
#line 800 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null");
                           add_operands(lexer, 2, (yyvsp[(3) - (5)].expr), expr_from_ident((yyvsp[(5) - (5)].sval)));
                         ;}
    break;

  case 111:
#line 805 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)), expr_from_ident((yyvsp[(4) - (4)].sval)));
                         ;}
    break;

  case 112:
#line 810 "pir.y"
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

  case 113:
#line 834 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                           (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                         ;}
    break;

  case 114:
#line 840 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(INT_TYPE, NULL, (yyvsp[(1) - (3)].ival))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 115:
#line 848 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(NUM_TYPE, NULL, (yyvsp[(1) - (3)].dval))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 116:
#line 856 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 117:
#line 858 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 118:
#line 860 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 119:
#line 862 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 120:
#line 864 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 121:
#line 866 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].ival) ? 1 : 0; ;}
    break;

  case 122:
#line 868 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].dval) ? 1 : 0; ;}
    break;

  case 123:
#line 870 "pir.y"
    { /* if string length > 0 return true, unless the string equals "0". */
                           (yyval.ival) = strlen((yyvsp[(1) - (1)].sval)) ? ((strcmp((yyvsp[(1) - (1)].sval), "0") == 0) ? 0 : 1) : 0;
                         ;}
    break;

  case 124:
#line 875 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 125:
#line 876 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 128:
#line 884 "pir.y"
    {
                           set_instr(lexer, "branch");
                           push_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 129:
#line 891 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 130:
#line 895 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 131:
#line 897 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 132:
#line 901 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 133:
#line 904 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 134:
#line 905 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 135:
#line 909 "pir.y"
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

  case 136:
#line 924 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 137:
#line 926 "pir.y"
    { (yyval.targ) = find_target(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 140:
#line 941 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                           ;}
    break;

  case 141:
#line 948 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 142:
#line 950 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 143:
#line 954 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 144:
#line 956 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 145:
#line 960 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 146:
#line 964 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 147:
#line 966 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 148:
#line 969 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 149:
#line 973 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 150:
#line 975 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 151:
#line 981 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 152:
#line 983 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 153:
#line 987 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 154:
#line 989 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 155:
#line 993 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 156:
#line 995 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 158:
#line 1003 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 159:
#line 1005 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 160:
#line 1007 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 163:
#line 1016 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 164:
#line 1023 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 165:
#line 1029 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 166:
#line 1031 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 169:
#line 1039 "pir.y"
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

  case 170:
#line 1053 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 171:
#line 1057 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 172:
#line 1059 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 173:
#line 1064 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 174:
#line 1068 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 175:
#line 1070 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 176:
#line 1074 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 177:
#line 1076 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 178:
#line 1080 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 179:
#line 1088 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 180:
#line 1090 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 181:
#line 1094 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 182:
#line 1096 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 183:
#line 1098 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 184:
#line 1100 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 185:
#line 1102 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 186:
#line 1108 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 187:
#line 1110 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 190:
#line 1118 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 195:
#line 1133 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 196:
#line 1137 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 197:
#line 1141 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 198:
#line 1147 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 199:
#line 1151 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 200:
#line 1153 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 201:
#line 1166 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 202:
#line 1168 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 205:
#line 1176 "pir.y"
    { (yyval.argm) = (yyvsp[(3) - (3)].argm);
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 206:
#line 1182 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (2)].argm);
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 207:
#line 1189 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 208:
#line 1195 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 209:
#line 1203 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 210:
#line 1209 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 211:
#line 1211 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 212:
#line 1216 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 213:
#line 1218 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 214:
#line 1223 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 215:
#line 1227 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 216:
#line 1229 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 217:
#line 1233 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 218:
#line 1235 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 219:
#line 1239 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 220:
#line 1244 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 221:
#line 1246 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 222:
#line 1250 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 223:
#line 1252 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 224:
#line 1258 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 225:
#line 1260 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 226:
#line 1264 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 230:
#line 1275 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 231:
#line 1279 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), GLOBALCONST); ;}
    break;

  case 232:
#line 1283 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 233:
#line 1285 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 234:
#line 1287 "pir.y"
    { (yyval.constval) = new_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 235:
#line 1289 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 236:
#line 1297 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 237:
#line 1298 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 238:
#line 1301 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, NULL, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 239:
#line 1302 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, NULL, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 240:
#line 1303 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, NULL, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 241:
#line 1306 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 242:
#line 1307 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 243:
#line 1308 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 244:
#line 1309 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 245:
#line 1310 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 246:
#line 1311 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 247:
#line 1314 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 248:
#line 1315 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 249:
#line 1316 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 250:
#line 1317 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 251:
#line 1320 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 252:
#line 1321 "pir.y"
    { /* find the symbol; if it's not there, emit an error */
                               symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                               if (sym == NULL)
                                   yyerror(yyscanner, lexer, "symbol not declared!");
                               else
                                   (yyval.targ) = new_target(sym->type, (yyvsp[(1) - (1)].sval));
                             ;}
    break;

  case 253:
#line 1330 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 254:
#line 1331 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 255:
#line 1332 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 256:
#line 1333 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 259:
#line 1340 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 260:
#line 1341 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 261:
#line 1342 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 262:
#line 1345 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 263:
#line 1346 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 264:
#line 1347 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 265:
#line 1348 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 266:
#line 1349 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 267:
#line 1350 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 268:
#line 1351 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 269:
#line 1352 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 270:
#line 1353 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 271:
#line 1354 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 272:
#line 1355 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 273:
#line 1356 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 274:
#line 1357 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 275:
#line 1358 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 276:
#line 1359 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 277:
#line 1360 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 278:
#line 1361 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 279:
#line 1362 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 280:
#line 1363 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 281:
#line 1364 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 282:
#line 1365 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 283:
#line 1366 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 284:
#line 1367 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 285:
#line 1373 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 286:
#line 1374 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 287:
#line 1375 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 288:
#line 1376 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 289:
#line 1377 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 290:
#line 1378 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 291:
#line 1379 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 292:
#line 1380 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 293:
#line 1381 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 294:
#line 1382 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 295:
#line 1383 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 296:
#line 1384 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 297:
#line 1387 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 298:
#line 1388 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3515 "pirparser.c"
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


#line 1391 "pir.y"


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


