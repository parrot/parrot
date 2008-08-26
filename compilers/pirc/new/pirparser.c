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
     TK_LOADLIB = 262,
     TK_SUB = 263,
     TK_END = 264,
     TK_PARAM = 265,
     TK_LEX = 266,
     TK_LOCAL = 267,
     TK_NAMESPACE = 268,
     TK_INVOCANT = 269,
     TK_METH_CALL = 270,
     TK_GLOBALCONST = 271,
     TK_CONST = 272,
     TK_RETURN = 273,
     TK_YIELD = 274,
     TK_BEGIN_YIELD = 275,
     TK_END_YIELD = 276,
     TK_BEGIN_RETURN = 277,
     TK_END_RETURN = 278,
     TK_BEGIN_CALL = 279,
     TK_END_CALL = 280,
     TK_GET_RESULTS = 281,
     TK_CALL = 282,
     TK_ARG = 283,
     TK_RESULT = 284,
     TK_NCI_CALL = 285,
     TK_PARROT_SET = 286,
     TK_PARROT_ADD = 287,
     TK_PARROT_SUB = 288,
     TK_PARROT_MUL = 289,
     TK_PARROT_DIV = 290,
     TK_PARROT_FDIV = 291,
     TK_IDENT = 292,
     TK_SYMBOL = 293,
     TK_STRINGC = 294,
     TK_INTC = 295,
     TK_NUMC = 296,
     TK_PREG = 297,
     TK_NREG = 298,
     TK_SREG = 299,
     TK_IREG = 300,
     TK_PARROT_OP = 301,
     TK_INT = 302,
     TK_NUM = 303,
     TK_PMC = 304,
     TK_STRING = 305,
     TK_IF = 306,
     TK_UNLESS = 307,
     TK_NULL = 308,
     TK_GOTO = 309,
     TK_ARROW = 310,
     TK_NE = 311,
     TK_EQ = 312,
     TK_LT = 313,
     TK_LE = 314,
     TK_GT = 315,
     TK_GE = 316,
     TK_USHIFT = 317,
     TK_RSHIFT = 318,
     TK_LSHIFT = 319,
     TK_FDIV = 320,
     TK_OR = 321,
     TK_AND = 322,
     TK_XOR = 323,
     TK_CONC = 324,
     TK_ASSIGN_USHIFT = 325,
     TK_ASSIGN_RSHIFT = 326,
     TK_ASSIGN_LSHIFT = 327,
     TK_ASSIGN_INC = 328,
     TK_ASSIGN_DEC = 329,
     TK_ASSIGN_MUL = 330,
     TK_ASSIGN_MOD = 331,
     TK_ASSIGN_POW = 332,
     TK_ASSIGN_DIV = 333,
     TK_ASSIGN_BOR = 334,
     TK_ASSIGN_BAND = 335,
     TK_ASSIGN_FDIV = 336,
     TK_ASSIGN_BNOT = 337,
     TK_ASSIGN_CONC = 338,
     TK_FLAG_INIT = 339,
     TK_FLAG_LOAD = 340,
     TK_FLAG_MAIN = 341,
     TK_FLAG_ANON = 342,
     TK_FLAG_METHOD = 343,
     TK_FLAG_OUTER = 344,
     TK_FLAG_VTABLE = 345,
     TK_FLAG_LEX = 346,
     TK_FLAG_MULTI = 347,
     TK_FLAG_POSTCOMP = 348,
     TK_FLAG_IMMEDIATE = 349,
     TK_FLAG_LEXID = 350,
     TK_INSTANCEOF = 351,
     TK_FLAG_UNIQUE_REG = 352,
     TK_FLAG_NAMED = 353,
     TK_FLAG_SLURPY = 354,
     TK_FLAG_FLAT = 355,
     TK_FLAG_OPTIONAL = 356,
     TK_FLAG_OPT_FLAG = 357,
     TK_FLAG_INVOCANT = 358
   };
#endif
/* Tokens.  */
#define TK_LABEL 258
#define TK_NL 259
#define TK_HLL 260
#define TK_HLL_MAP 261
#define TK_LOADLIB 262
#define TK_SUB 263
#define TK_END 264
#define TK_PARAM 265
#define TK_LEX 266
#define TK_LOCAL 267
#define TK_NAMESPACE 268
#define TK_INVOCANT 269
#define TK_METH_CALL 270
#define TK_GLOBALCONST 271
#define TK_CONST 272
#define TK_RETURN 273
#define TK_YIELD 274
#define TK_BEGIN_YIELD 275
#define TK_END_YIELD 276
#define TK_BEGIN_RETURN 277
#define TK_END_RETURN 278
#define TK_BEGIN_CALL 279
#define TK_END_CALL 280
#define TK_GET_RESULTS 281
#define TK_CALL 282
#define TK_ARG 283
#define TK_RESULT 284
#define TK_NCI_CALL 285
#define TK_PARROT_SET 286
#define TK_PARROT_ADD 287
#define TK_PARROT_SUB 288
#define TK_PARROT_MUL 289
#define TK_PARROT_DIV 290
#define TK_PARROT_FDIV 291
#define TK_IDENT 292
#define TK_SYMBOL 293
#define TK_STRINGC 294
#define TK_INTC 295
#define TK_NUMC 296
#define TK_PREG 297
#define TK_NREG 298
#define TK_SREG 299
#define TK_IREG 300
#define TK_PARROT_OP 301
#define TK_INT 302
#define TK_NUM 303
#define TK_PMC 304
#define TK_STRING 305
#define TK_IF 306
#define TK_UNLESS 307
#define TK_NULL 308
#define TK_GOTO 309
#define TK_ARROW 310
#define TK_NE 311
#define TK_EQ 312
#define TK_LT 313
#define TK_LE 314
#define TK_GT 315
#define TK_GE 316
#define TK_USHIFT 317
#define TK_RSHIFT 318
#define TK_LSHIFT 319
#define TK_FDIV 320
#define TK_OR 321
#define TK_AND 322
#define TK_XOR 323
#define TK_CONC 324
#define TK_ASSIGN_USHIFT 325
#define TK_ASSIGN_RSHIFT 326
#define TK_ASSIGN_LSHIFT 327
#define TK_ASSIGN_INC 328
#define TK_ASSIGN_DEC 329
#define TK_ASSIGN_MUL 330
#define TK_ASSIGN_MOD 331
#define TK_ASSIGN_POW 332
#define TK_ASSIGN_DIV 333
#define TK_ASSIGN_BOR 334
#define TK_ASSIGN_BAND 335
#define TK_ASSIGN_FDIV 336
#define TK_ASSIGN_BNOT 337
#define TK_ASSIGN_CONC 338
#define TK_FLAG_INIT 339
#define TK_FLAG_LOAD 340
#define TK_FLAG_MAIN 341
#define TK_FLAG_ANON 342
#define TK_FLAG_METHOD 343
#define TK_FLAG_OUTER 344
#define TK_FLAG_VTABLE 345
#define TK_FLAG_LEX 346
#define TK_FLAG_MULTI 347
#define TK_FLAG_POSTCOMP 348
#define TK_FLAG_IMMEDIATE 349
#define TK_FLAG_LEXID 350
#define TK_INSTANCEOF 351
#define TK_FLAG_UNIQUE_REG 352
#define TK_FLAG_NAMED 353
#define TK_FLAG_SLURPY 354
#define TK_FLAG_FLAT 355
#define TK_FLAG_OPTIONAL 356
#define TK_FLAG_OPT_FLAG 357
#define TK_FLAG_INVOCANT 358




/* Copy the first part of user declarations.  */
#line 1 "pir.y"


/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*

=head1 NAME

pir.y

=head1 DESCRIPTION

This is a complete rewrite of the parser for the PIR language.

=cut

TODO:
1. [done 9/8/8]  fix argument stuff related to the :named flag.
2. [done 9/8/8]  fix parameter stuff
3. [done 17/8/8] clean up back-end a bit (refactoring, consting)
4. improve memory management (free it!)
5. test
6. [done 12/8/8] write vanilla register allocator
7. generate PBC, using Parrot_PackFile (and related) data structures. This needs
   linkage to libparrot, which seems to fail.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "pirparser.h"
#include "pircompiler.h"
#include "pircompunit.h"
#include "pirsymbol.h"

/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* define YY_DECL, so that in "pirlexer.h" it won't be defined */
#define YY_DECL int yylex(YYSTYPE *yylval, yyscan_t yyscanner)

#include "pirlexer.h"

/* Enumeration of mathematical operator types. */
typedef enum pir_math_operators {
    OP_ADD,
    OP_INC, /* special case for OP_ADD; must be 1 position after OP_ADD */
    OP_SUB,
    OP_DEC, /* special case for OP_DEC; must be 1 position after OP_SUB */
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
    "inc", /* use this when "add"ing 1 */
    "sub",
    "dec", /* use this when "sub"ing 1 */
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
    /* note that from here on it's rel. ops; see pir_rel_operator enumeration */
    "ne",
    "eq",
    "lt",
    "le",
    "gt",
    "ge"
};

/* prototypes for constant folding and compile-time evaluation functions */
static constant *fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b);
static constant *fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b);
static constant *fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b);
static constant *fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b);
static constant *fold_s_s(yyscan_t yyscanner, char *a, pir_math_operator op, char *b);
static int evaluate_i_i(int a, pir_rel_operator op, int b);
static int evaluate_n_n(double a, pir_rel_operator op, double b);
static int evaluate_i_n(int a, pir_rel_operator op, double b);
static int evaluate_n_i(double a, pir_rel_operator op, int b);
static int evaluate_s_s(char * const a, pir_rel_operator op, char * const b);
static int evaluate_s(char * const s);
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


/* the parser aborts if there are more than 10 errors */
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
#line 171 "pir.y"
{
    double              dval;
    int                 ival;
    char               *sval;
    struct constant    *cval;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;
    struct key         *key;
    struct symbol      *symb;
}
/* Line 187 of yacc.c.  */
#line 486 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 499 "pirparser.c"

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
#define YYLAST   684

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  122
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  127
/* YYNRULES -- Number of rules.  */
#define YYNRULES  351
/* YYNRULES -- Number of states.  */
#define YYNSTATES  507

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   359

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   113,     2,     2,     2,   118,   120,     2,
     108,   109,   117,   115,   110,   112,   111,   116,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   107,
       2,   104,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   105,     2,   106,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   119,     2,   114,     2,     2,     2,
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
      95,    96,    97,    98,    99,   100,   101,   102,   103,   121
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     7,     8,    10,    12,    16,    18,    20,
      22,    24,    26,    28,    31,    34,    39,    44,    45,    47,
      49,    53,    55,    62,    65,    67,    69,    70,    73,    75,
      77,    79,    81,    83,    85,    87,    89,    91,    96,    99,
     102,   105,   107,   109,   111,   113,   115,   116,   119,   124,
     127,   128,   131,   133,   135,   140,   141,   144,   145,   148,
     151,   154,   156,   158,   160,   162,   164,   166,   168,   170,
     172,   174,   176,   178,   180,   182,   184,   187,   190,   193,
     197,   201,   204,   207,   209,   210,   212,   214,   218,   220,
     222,   224,   227,   231,   233,   237,   240,   242,   246,   250,
     254,   258,   261,   266,   270,   276,   282,   288,   294,   298,
     302,   306,   309,   312,   315,   318,   322,   326,   330,   334,
     338,   342,   346,   350,   355,   360,   365,   370,   375,   380,
     385,   390,   395,   400,   405,   408,   413,   420,   425,   432,
     439,   446,   453,   460,   465,   472,   479,   486,   493,   500,
     507,   512,   517,   524,   531,   538,   545,   547,   549,   551,
     553,   555,   558,   564,   569,   574,   578,   582,   586,   590,
     594,   598,   602,   606,   610,   612,   614,   616,   618,   620,
     622,   624,   628,   633,   635,   639,   642,   644,   646,   648,
     649,   651,   657,   659,   661,   670,   671,   673,   675,   678,
     682,   686,   689,   695,   696,   699,   700,   702,   704,   707,
     711,   713,   716,   720,   724,   726,   728,   730,   735,   738,
     740,   742,   744,   746,   748,   750,   752,   754,   756,   760,
     761,   763,   765,   769,   772,   773,   776,   778,   780,   782,
     784,   787,   789,   791,   793,   795,   799,   803,   807,   811,
     812,   814,   816,   820,   822,   824,   828,   831,   833,   839,
     845,   846,   848,   850,   853,   857,   858,   860,   862,   865,
     869,   870,   873,   875,   878,   879,   881,   885,   888,   890,
     892,   895,   898,   903,   908,   913,   918,   920,   922,   924,
     926,   928,   930,   932,   934,   936,   938,   940,   942,   944,
     946,   948,   950,   952,   954,   956,   958,   960,   962,   964,
     966,   968,   970,   972,   974,   976,   978,   980,   982,   984,
     986,   988,   990,   992,   994,   996,   998,  1000,  1002,  1004,
    1006,  1008,  1010,  1012,  1014,  1016,  1018,  1020,  1022,  1024,
    1026,  1028,  1030,  1032,  1034,  1036,  1038,  1040,  1042,  1044,
    1046,  1048
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     123,     0,    -1,   124,   125,   124,    -1,    -1,     4,    -1,
     126,    -1,   125,     4,   126,    -1,   134,    -1,   234,    -1,
     130,    -1,   128,    -1,   129,    -1,   127,    -1,     7,    39,
      -1,     5,    39,    -1,     6,    39,   104,    39,    -1,    13,
     105,   131,   106,    -1,    -1,   132,    -1,   133,    -1,   132,
     107,   133,    -1,    39,    -1,   135,   137,     4,   140,   146,
       9,    -1,     8,   136,    -1,   244,    -1,    39,    -1,    -1,
     137,   138,    -1,    87,    -1,    84,    -1,    85,    -1,    86,
      -1,    88,    -1,    91,    -1,    93,    -1,    94,    -1,    92,
      -1,    89,   108,   136,   109,    -1,    90,   230,    -1,    95,
     231,    -1,    96,   231,    -1,    37,    -1,    46,    -1,    39,
      -1,   162,    -1,   241,    -1,    -1,   140,   141,    -1,    10,
     142,   143,     4,    -1,   241,   244,    -1,    -1,   143,   144,
      -1,   208,    -1,   145,    -1,   103,   108,   139,   109,    -1,
      -1,   146,   147,    -1,    -1,   148,   149,    -1,     3,     4,
      -1,     3,   150,    -1,   150,    -1,   172,    -1,   177,    -1,
     178,    -1,   183,    -1,   232,    -1,   209,    -1,   210,    -1,
     184,    -1,   164,    -1,   155,    -1,   154,    -1,   152,    -1,
     169,    -1,   151,    -1,     1,     4,    -1,   153,     4,    -1,
      53,   242,    -1,   242,   104,    53,    -1,    26,   203,     4,
      -1,   156,     4,    -1,   157,   158,    -1,    46,    -1,    -1,
     159,    -1,   160,    -1,   159,   110,   160,    -1,   238,    -1,
     162,    -1,   161,    -1,   242,   162,    -1,   105,   163,   106,
      -1,   238,    -1,   163,   107,   238,    -1,   165,     4,    -1,
     168,    -1,   242,   104,    40,    -1,   242,   104,    41,    -1,
     242,   104,    39,    -1,   242,   104,   242,    -1,   242,   166,
      -1,   242,   104,   245,   238,    -1,   242,   104,   167,    -1,
     242,   104,   242,   246,    40,    -1,   242,   104,   242,   246,
      41,    -1,   242,   104,   242,   246,    39,    -1,   242,   104,
     242,   246,   242,    -1,   161,   104,   238,    -1,   242,   104,
     161,    -1,   242,   104,   156,    -1,   248,    40,    -1,   248,
      41,    -1,   248,   242,    -1,   247,   238,    -1,    40,   246,
     242,    -1,    41,   246,   242,    -1,    39,   246,   242,    -1,
      39,   246,    39,    -1,    40,   246,    40,    -1,    41,   246,
      41,    -1,    40,   246,    41,    -1,    41,   246,    40,    -1,
      31,   242,   110,   161,    -1,    31,   161,   110,   238,    -1,
      31,   242,   110,   242,    -1,    31,   242,   110,    40,    -1,
      31,   242,   110,    41,    -1,    31,   242,   110,    39,    -1,
     242,   104,    31,    40,    -1,   242,   104,    31,    41,    -1,
     242,   104,    31,    39,    -1,   242,   104,    31,   161,    -1,
     242,   104,    31,   242,    -1,   170,     4,    -1,   171,   242,
     110,    40,    -1,   171,   242,   110,    40,   110,    40,    -1,
     171,   242,   110,    41,    -1,   171,   242,   110,    40,   110,
      41,    -1,   171,   242,   110,    41,   110,    41,    -1,   171,
     242,   110,    41,   110,    40,    -1,   171,   242,   110,    40,
     110,   242,    -1,   171,   242,   110,    41,   110,   242,    -1,
     171,   242,   110,   242,    -1,   171,   242,   110,   242,   110,
     242,    -1,   171,   242,   110,   242,   110,    41,    -1,   171,
     242,   110,   242,   110,    40,    -1,   242,   104,   171,   242,
     110,   242,    -1,   242,   104,   171,    40,   110,    40,    -1,
     242,   104,   171,    40,   110,    41,    -1,   242,   104,   171,
      40,    -1,   242,   104,   171,    41,    -1,   242,   104,   171,
      41,   110,    40,    -1,   242,   104,   171,    41,   110,    41,
      -1,   242,   104,   171,    41,   110,   242,    -1,   242,   104,
     171,   242,   110,    41,    -1,    32,    -1,    33,    -1,    34,
      -1,    35,    -1,    36,    -1,   173,     4,    -1,   175,    53,
     238,    54,   244,    -1,   175,   242,   176,   244,    -1,   175,
     174,    54,   244,    -1,   242,   240,   238,    -1,    40,   240,
     242,    -1,    41,   240,   242,    -1,    39,   240,   242,    -1,
      40,   240,    40,    -1,    41,   240,    41,    -1,    40,   240,
      41,    -1,    41,   240,    40,    -1,    39,   240,    39,    -1,
      40,    -1,    41,    -1,    39,    -1,    51,    -1,    52,    -1,
      54,    -1,   110,    -1,    54,   244,     4,    -1,    12,   241,
     179,     4,    -1,   180,    -1,   179,   110,   180,    -1,   181,
     182,    -1,   244,    -1,   171,    -1,    38,    -1,    -1,    97,
      -1,    11,    39,   110,   242,     4,    -1,   185,    -1,   194,
      -1,    24,     4,   186,   189,     4,   191,    25,     4,    -1,
      -1,   187,    -1,   188,    -1,   187,   188,    -1,    28,   218,
       4,    -1,    27,   201,   190,    -1,    30,   201,    -1,    14,
     201,     4,    15,   200,    -1,    -1,   110,   201,    -1,    -1,
     192,    -1,   193,    -1,   192,   193,    -1,    29,   206,     4,
      -1,   178,    -1,   195,     4,    -1,   203,   104,   196,    -1,
     242,   104,   196,    -1,   196,    -1,   198,    -1,   197,    -1,
     201,   111,   200,   213,    -1,   199,   213,    -1,   201,    -1,
      39,    -1,   201,    -1,   202,    -1,    37,    -1,    38,    -1,
      42,    -1,    39,    -1,    44,    -1,   108,   204,   109,    -1,
      -1,   205,    -1,   206,    -1,   205,   110,   206,    -1,   242,
     207,    -1,    -1,   207,   208,    -1,   101,    -1,   102,    -1,
      99,    -1,    97,    -1,    98,   230,    -1,   211,    -1,   220,
      -1,   212,    -1,   221,    -1,    18,   213,     4,    -1,    18,
     196,     4,    -1,    19,   213,     4,    -1,   108,   214,   109,
      -1,    -1,   215,    -1,   216,    -1,   215,   110,   216,    -1,
     218,    -1,   217,    -1,    39,    55,   219,    -1,   219,   228,
      -1,   238,    -1,    22,     4,   225,    23,     4,    -1,    20,
       4,   222,    21,     4,    -1,    -1,   223,    -1,   224,    -1,
     223,   224,    -1,    19,   218,     4,    -1,    -1,   226,    -1,
     227,    -1,   226,   227,    -1,    18,   218,     4,    -1,    -1,
     228,   229,    -1,   100,    -1,    98,   230,    -1,    -1,   231,
      -1,   108,    39,   109,    -1,   233,     4,    -1,   234,    -1,
     235,    -1,    17,   236,    -1,    16,   236,    -1,    47,   237,
     104,    40,    -1,    48,   237,   104,    41,    -1,    50,   237,
     104,    39,    -1,    49,   237,   104,    39,    -1,   244,    -1,
     171,    -1,   242,    -1,   239,    -1,    39,    -1,    40,    -1,
      41,    -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,
      61,    -1,    60,    -1,    47,    -1,    48,    -1,    49,    -1,
      50,    -1,   243,    -1,    42,    -1,    43,    -1,    45,    -1,
      44,    -1,    38,    -1,    37,    -1,    37,    -1,    46,    -1,
     112,    -1,   113,    -1,   114,    -1,   115,    -1,   112,    -1,
     116,    -1,   117,    -1,   118,    -1,   119,    -1,   120,    -1,
     114,    -1,   121,    -1,    69,    -1,    62,    -1,    63,    -1,
      64,    -1,    66,    -1,    67,    -1,    65,    -1,    68,    -1,
      57,    -1,    59,    -1,    58,    -1,    61,    -1,    60,    -1,
      56,    -1,    75,    -1,    76,    -1,    77,    -1,    78,    -1,
      81,    -1,    79,    -1,    80,    -1,    82,    -1,    83,    -1,
      71,    -1,    72,    -1,    70,    -1,    73,    -1,    74,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   423,   423,   428,   429,   432,   433,   436,   437,   438,
     439,   440,   441,   444,   450,   454,   458,   463,   464,   468,
     470,   474,   478,   484,   488,   489,   492,   493,   496,   498,
     500,   502,   504,   506,   508,   510,   512,   514,   516,   518,
     520,   524,   525,   526,   527,   528,   531,   532,   535,   538,
     543,   544,   548,   549,   552,   558,   559,   563,   563,   567,
     569,   571,   574,   575,   576,   577,   578,   579,   580,   581,
     582,   583,   584,   585,   586,   587,   591,   601,   604,   606,
     610,   614,   617,   620,   624,   625,   628,   629,   632,   634,
     636,   640,   651,   655,   657,   662,   708,   709,   716,   724,
     726,   733,   735,   737,   739,   765,   798,   805,   812,   814,
     816,   820,   833,   835,   837,   866,   868,   870,   872,   874,
     876,   878,   880,   885,   887,   889,   896,   903,   910,   912,
     919,   926,   928,   930,   940,   944,   959,   961,   982,   984,
     986,   988,  1010,  1023,  1025,  1034,  1054,  1089,  1096,  1098,
    1100,  1114,  1125,  1130,  1135,  1146,  1167,  1168,  1169,  1170,
    1171,  1175,  1178,  1180,  1182,  1208,  1213,  1218,  1223,  1228,
    1230,  1232,  1234,  1236,  1238,  1240,  1242,  1246,  1247,  1250,
    1251,  1254,  1258,  1262,  1264,  1268,  1272,  1274,  1276,  1283,
    1284,  1287,  1300,  1301,  1304,  1316,  1317,  1321,  1323,  1327,
    1331,  1333,  1335,  1341,  1342,  1347,  1348,  1352,  1354,  1358,
    1360,  1364,  1368,  1370,  1372,  1376,  1377,  1380,  1387,  1394,
    1396,  1400,  1401,  1404,  1406,  1414,  1418,  1420,  1425,  1430,
    1431,  1435,  1437,  1441,  1446,  1447,  1451,  1453,  1455,  1457,
    1459,  1469,  1470,  1473,  1474,  1477,  1482,  1489,  1496,  1501,
    1502,  1506,  1508,  1512,  1513,  1516,  1520,  1524,  1528,  1537,
    1547,  1548,  1553,  1555,  1560,  1565,  1566,  1570,  1572,  1576,
    1582,  1583,  1587,  1589,  1597,  1598,  1602,  1606,  1609,  1610,
    1613,  1617,  1621,  1623,  1625,  1627,  1640,  1642,  1649,  1650,
    1653,  1654,  1655,  1658,  1659,  1660,  1661,  1662,  1663,  1666,
    1667,  1668,  1669,  1677,  1680,  1681,  1682,  1683,  1684,  1685,
    1695,  1696,  1699,  1700,  1701,  1704,  1705,  1706,  1707,  1708,
    1709,  1710,  1711,  1712,  1713,  1714,  1715,  1716,  1717,  1718,
    1719,  1720,  1721,  1722,  1723,  1724,  1725,  1726,  1732,  1733,
    1734,  1735,  1736,  1737,  1738,  1739,  1740,  1741,  1742,  1743,
    1746,  1747
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"label\"", "\"\\n\"", "\".HLL\"",
  "\".HLL_map\"", "\".loadlib\"", "\".sub\"", "\".end\"", "\".param\"",
  "\".lex\"", "\".local\"", "\".namespace\"", "\".invocant\"",
  "\".meth_call\"", "\".globalconst\"", "\".const\"", "\".return\"",
  "\".yield\"", "\".begin_yield\"", "\".end_yield\"", "\".begin_return\"",
  "\".end_return\"", "\".begin_call\"", "\".end_call\"",
  "\".get_results\"", "\".call\"", "\".arg\"", "\".result\"",
  "\".nci_call\"", "\"set\"", "\"add\"", "\"sub\"", "\"mul\"", "\"div\"",
  "\"fdiv\"", "\"identifier\"", "\"symbol\"", "\"string constant\"",
  "\"integer constant\"", "\"number constant\"", "\"PMC register\"",
  "\"number register\"", "\"string register\"", "\"integer register\"",
  "\"parrot opname\"", "\"int\"", "\"num\"", "\"pmc\"", "\"string\"",
  "\"if\"", "\"unless\"", "\"null\"", "\"goto\"", "\"=>\"", "\"!=\"",
  "\"==\"", "\"<\"", "\"<=\"", "\">\"", "\">=\"", "\">>>\"", "\">>\"",
  "\"<<\"", "\"//\"", "\"||\"", "\"&&\"", "\"~~\"", "\".\"", "\">>>=\"",
  "\">>=\"", "\"<<=\"", "\"+=\"", "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"",
  "\"/=\"", "\"|=\"", "\"&=\"", "\"//=\"", "\"~=\"", "\".=\"", "\":init\"",
  "\":load\"", "\":main\"", "\":anon\"", "\":method\"", "\":outer\"",
  "\":vtable\"", "\":lex\"", "\":multi\"", "\":postcomp\"",
  "\":immediate\"", "\":lexid\"", "\":instanceof\"", "\":unique_reg\"",
  "\":named\"", "\":slurpy\"", "\":flat\"", "\":optional\"",
  "\":opt_flag\"", "\":invocant\"", "'='", "'['", "']'", "';'", "'('",
  "')'", "','", "'.'", "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'",
  "'|'", "'&'", "\"**\"", "$accept", "TOP", "opt_nl", "pir_chunks",
  "pir_chunk", "loadlib", "hll_specifier", "hll_mapping", "namespace_decl",
  "opt_namespace", "namespace", "namespace_slice", "sub_def", "sub_head",
  "sub_id", "sub_flags", "sub_flag", "multi_type", "parameters",
  "parameter", "param", "param_flags", "param_flag", "invocant_param",
  "instructions", "instruction", "@1", "instr", "statement", "error_stat",
  "null_stat", "null_instr", "getresults_stat", "parrot_stat",
  "parrot_instruction", "parrot_op", "opt_op_args", "op_args", "op_arg",
  "keyaccess", "keylist", "keys", "assignment_stat", "assignment",
  "augmentive_expr", "binary_expr", "set_instruction", "math_stat",
  "math_instruction", "math_op", "conditional_stat", "conditional_instr",
  "condition", "if_unless", "then", "goto_stat", "local_decl",
  "local_id_list", "local_id", "local_var_name", "has_unique_reg",
  "lex_decl", "invocation_stat", "long_invocation_stat",
  "opt_long_arguments", "long_arguments", "long_argument",
  "long_invocation", "opt_ret_cont", "opt_long_results", "long_results",
  "long_result", "short_invocation_stat", "short_invocation",
  "simple_invocation", "methodcall", "subcall", "sub", "method",
  "invokable", "string_object", "opt_target_list", "opt_list",
  "target_list", "result_target", "target_flags", "target_flag",
  "return_stat", "yield_stat", "short_return_stat", "short_yield_stat",
  "arguments", "opt_arguments_list", "arguments_list", "argument",
  "named_arg", "short_arg", "arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "const_name", "expression", "constant", "rel_op", "type",
  "target", "symbol", "identifier", "unop", "binop", "augmented_op",
  "augm_add_op", 0
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
     355,   356,   357,   358,    61,    91,    93,    59,    40,    41,
      44,    46,    45,    33,   126,    43,    47,    42,    37,   124,
      38,   359
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   122,   123,   124,   124,   125,   125,   126,   126,   126,
     126,   126,   126,   127,   128,   129,   130,   131,   131,   132,
     132,   133,   134,   135,   136,   136,   137,   137,   138,   138,
     138,   138,   138,   138,   138,   138,   138,   138,   138,   138,
     138,   139,   139,   139,   139,   139,   140,   140,   141,   142,
     143,   143,   144,   144,   145,   146,   146,   148,   147,   149,
     149,   149,   150,   150,   150,   150,   150,   150,   150,   150,
     150,   150,   150,   150,   150,   150,   151,   152,   153,   153,
     154,   155,   156,   157,   158,   158,   159,   159,   160,   160,
     160,   161,   162,   163,   163,   164,   165,   165,   165,   165,
     165,   165,   165,   165,   165,   165,   165,   165,   165,   165,
     165,   166,   166,   166,   166,   167,   167,   167,   167,   167,
     167,   167,   167,   168,   168,   168,   168,   168,   168,   168,
     168,   168,   168,   168,   169,   170,   170,   170,   170,   170,
     170,   170,   170,   170,   170,   170,   170,   170,   170,   170,
     170,   170,   170,   170,   170,   170,   171,   171,   171,   171,
     171,   172,   173,   173,   173,   174,   174,   174,   174,   174,
     174,   174,   174,   174,   174,   174,   174,   175,   175,   176,
     176,   177,   178,   179,   179,   180,   181,   181,   181,   182,
     182,   183,   184,   184,   185,   186,   186,   187,   187,   188,
     189,   189,   189,   190,   190,   191,   191,   192,   192,   193,
     193,   194,   195,   195,   195,   196,   196,   197,   198,   199,
     199,   200,   200,   201,   201,   201,   202,   202,   203,   204,
     204,   205,   205,   206,   207,   207,   208,   208,   208,   208,
     208,   209,   209,   210,   210,   211,   211,   212,   213,   214,
     214,   215,   215,   216,   216,   217,   218,   219,   220,   221,
     222,   222,   223,   223,   224,   225,   225,   226,   226,   227,
     228,   228,   229,   229,   230,   230,   231,   232,   233,   233,
     234,   235,   236,   236,   236,   236,   237,   237,   238,   238,
     239,   239,   239,   240,   240,   240,   240,   240,   240,   241,
     241,   241,   241,   242,   243,   243,   243,   243,   243,   243,
     244,   244,   245,   245,   245,   246,   246,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   246,   246,
     246,   246,   246,   246,   246,   246,   246,   246,   247,   247,
     247,   247,   247,   247,   247,   247,   247,   247,   247,   247,
     248,   248
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     2,     2,     4,     4,     0,     1,     1,
       3,     1,     6,     2,     1,     1,     0,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     2,     2,
       2,     1,     1,     1,     1,     1,     0,     2,     4,     2,
       0,     2,     1,     1,     4,     0,     2,     0,     2,     2,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     2,     2,     3,
       3,     2,     2,     1,     0,     1,     1,     3,     1,     1,
       1,     2,     3,     1,     3,     2,     1,     3,     3,     3,
       3,     2,     4,     3,     5,     5,     5,     5,     3,     3,
       3,     2,     2,     2,     2,     3,     3,     3,     3,     3,
       3,     3,     3,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     2,     4,     6,     4,     6,     6,
       6,     6,     6,     4,     6,     6,     6,     6,     6,     6,
       4,     4,     6,     6,     6,     6,     1,     1,     1,     1,
       1,     2,     5,     4,     4,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     1,     1,     1,     1,     1,
       1,     3,     4,     1,     3,     2,     1,     1,     1,     0,
       1,     5,     1,     1,     8,     0,     1,     1,     2,     3,
       3,     2,     5,     0,     2,     0,     1,     1,     2,     3,
       1,     2,     3,     3,     1,     1,     1,     4,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     0,
       1,     1,     3,     2,     0,     2,     1,     1,     1,     1,
       2,     1,     1,     1,     1,     3,     3,     3,     3,     0,
       1,     1,     3,     1,     1,     3,     2,     1,     5,     5,
       0,     1,     1,     2,     3,     0,     1,     1,     2,     3,
       0,     2,     1,     2,     0,     1,     3,     2,     1,     1,
       2,     2,     4,     4,     4,     4,     1,     1,     1,     1,
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
       0,     3,     5,    12,    10,    11,     9,     7,    26,     8,
      14,     0,    13,   310,    25,   311,    23,    24,    17,     0,
       0,     0,     0,   280,     4,     2,     0,     0,    21,     0,
      18,    19,   156,   157,   158,   159,   160,   287,     0,   286,
       0,     0,     0,     6,    46,    29,    30,    31,    28,    32,
       0,   274,    33,    36,    34,    35,     0,     0,    27,    15,
      16,     0,     0,     0,     0,     0,    55,     0,     0,    38,
     275,    39,    40,    20,   282,   283,   285,   284,     0,    47,
      57,     0,     0,   299,   300,   301,   302,    50,     0,    22,
      56,     0,    37,   276,     0,    49,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   309,   308,
     220,   304,   305,   307,   306,    83,   177,   178,     0,     0,
     229,    58,    61,    75,    73,     0,    72,    71,     0,    84,
       0,    70,     0,    96,    74,     0,     0,    62,     0,     0,
      63,    64,    65,    69,   192,   193,     0,   214,   216,   215,
       0,   219,     0,    67,    68,   241,   243,   242,   244,    66,
       0,   278,   279,     0,   303,    48,   239,   274,   238,   236,
     237,     0,    51,    53,    52,    76,    59,    60,     0,     0,
     281,   223,   224,   225,   249,     0,     0,     0,   260,   265,
     195,     0,   309,   308,   304,     0,     0,    78,     0,     0,
     230,   231,   234,    77,    81,   290,   291,   292,     0,    82,
      85,    86,    90,    89,    88,   289,   288,     0,    95,   134,
       0,   161,   176,   174,   175,     0,     0,     0,   211,   218,
       0,     0,   277,   349,   347,   348,   350,   351,   338,   339,
     340,   341,   343,   344,   342,   345,   346,     0,    91,   101,
       0,     0,   240,     0,     0,   188,   187,     0,   183,   189,
     186,   290,     0,   250,   251,   254,   253,   270,   257,   288,
     246,   245,   247,     0,     0,   261,   262,     0,     0,   266,
     267,     0,     0,   196,   197,    80,     0,     0,   181,   228,
       0,   233,     0,    93,     0,   108,     0,   293,   294,   295,
     296,   298,   297,     0,     0,     0,     0,     0,   179,   180,
       0,     0,   226,   227,     0,   221,   222,   212,     0,    99,
      97,    98,    79,   312,   313,   314,   110,   109,   103,     0,
     213,   100,     0,   114,   111,   112,   113,    41,    43,    42,
       0,    44,    45,     0,   182,     0,   190,   185,     0,   248,
       0,   256,     0,     0,   263,     0,     0,   268,     0,     0,
       0,     0,     0,   198,   124,   128,   126,   127,   123,   125,
     232,   235,    92,     0,    87,   135,   137,   143,   173,   168,
     169,   171,   166,   172,   170,   167,     0,   164,   163,   165,
     217,   131,   129,   130,   132,   133,   337,   332,   334,   333,
     336,   335,   325,   326,   327,   330,   328,   329,   331,   324,
     316,   322,   315,   317,   318,   319,   320,   321,   323,     0,
       0,     0,   150,   151,     0,     0,   102,    54,   191,   184,
     255,   252,   274,   272,   271,   264,   259,   269,   258,   199,
       0,   203,   201,   205,    94,     0,     0,     0,   162,   118,
     117,   119,   121,   115,   122,   120,   116,     0,     0,     0,
     106,   104,   105,   107,   273,     0,     0,   200,     0,   210,
       0,   206,   207,   136,   138,   141,   140,   139,   142,   146,
     145,   144,   148,   149,   152,   153,   154,   155,   147,     0,
     204,     0,     0,   208,   202,   209,   194
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    39,
      40,    41,    17,    18,    26,    36,    68,   350,    76,    89,
      97,   104,   182,   183,    90,   100,   101,   131,   132,   133,
     134,   135,   136,   137,   138,   139,   219,   220,   221,   140,
     258,   302,   141,   142,   259,   338,   143,   144,   145,    47,
     147,   148,   236,   149,   320,   150,   151,   267,   268,   269,
     357,   152,   153,   154,   292,   293,   294,   372,   477,   480,
     481,   482,   155,   156,   157,   158,   159,   160,   324,   161,
     326,   162,   209,   210,   211,   301,   184,   163,   164,   165,
     166,   196,   272,   273,   274,   275,   276,   277,   167,   168,
     284,   285,   286,   288,   289,   290,   361,   444,    79,    80,
     169,   170,    19,   172,    33,    48,   278,   225,   313,    98,
     279,   174,    49,   342,   429,   260,   261
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -432
static const yytype_int16 yypact[] =
{
      22,  -432,    37,    89,  -432,    77,    79,    83,    61,   -52,
      17,   156,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,    59,  -432,  -432,  -432,  -432,  -432,  -432,   128,    46,
      46,    46,    46,  -432,    89,  -432,   229,   145,  -432,    85,
      91,  -432,  -432,  -432,  -432,  -432,  -432,  -432,    97,  -432,
      98,    99,   101,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
     102,   103,  -432,  -432,  -432,  -432,   103,   103,  -432,  -432,
    -432,   128,   167,   168,   173,   177,   207,    61,   183,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,    38,  -432,
     220,   123,   132,  -432,  -432,  -432,  -432,  -432,   -10,  -432,
    -432,   242,  -432,  -432,    11,  -432,   238,   363,   205,    38,
      17,   -19,   144,   251,   252,   261,   161,   316,    28,    30,
    -432,    43,  -432,  -432,  -432,  -432,  -432,  -432,   316,   -10,
     316,  -432,  -432,  -432,  -432,   266,  -432,  -432,   267,    18,
     178,  -432,   268,  -432,  -432,   279,   316,  -432,   285,   105,
    -432,  -432,  -432,  -432,  -432,  -432,   286,  -432,  -432,  -432,
     144,   180,   188,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
     306,  -432,  -432,   483,  -432,  -432,  -432,   103,  -432,  -432,
    -432,   218,  -432,  -432,  -432,  -432,  -432,  -432,   217,   139,
    -432,  -432,  -432,  -432,   260,   324,   328,   329,   315,   327,
     318,   344,  -432,  -432,  -432,   239,    15,  -432,   347,   243,
     253,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   299,  -432,
     255,  -432,  -432,  -432,  -432,  -432,   257,   299,  -432,  -432,
     256,  -432,    71,    71,    71,   299,   317,    14,  -432,  -432,
     397,   269,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,   387,  -432,  -432,
     299,   530,  -432,    -6,   316,  -432,  -432,     7,  -432,   273,
    -432,   321,   263,   274,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,   299,   352,   315,  -432,   299,   354,   327,
    -432,   299,     2,   318,  -432,  -432,   299,   423,  -432,  -432,
     316,   149,   -30,  -432,    18,  -432,   539,  -432,  -432,  -432,
    -432,  -432,  -432,   151,   567,   576,   332,   -10,  -432,  -432,
     -10,   299,  -432,  -432,   144,  -432,  -432,  -432,   449,   390,
     482,   482,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   585,
    -432,   416,   299,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
     281,  -432,  -432,   388,  -432,   139,  -432,  -432,   299,  -432,
     260,    55,   389,   399,  -432,   400,   406,  -432,   407,    10,
      10,    10,   408,  -432,  -432,  -432,  -432,  -432,  -432,   257,
    -432,  -432,  -432,   299,  -432,   303,   333,   334,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,   -10,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,   257,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   182,
     594,   603,   335,   359,   360,   475,  -432,  -432,  -432,  -432,
    -432,  -432,   103,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
     433,   385,  -432,     9,  -432,   612,   621,   630,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,   142,   639,   193,
    -432,  -432,  -432,  -432,  -432,   376,    10,  -432,   316,  -432,
     413,     9,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   397,
    -432,   438,   492,  -432,  -432,  -432,  -432
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -432,  -432,   486,  -432,   469,  -432,  -432,  -432,  -432,  -432,
    -432,   451,  -432,  -432,   446,  -432,  -432,  -432,  -432,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   417,  -432,
    -432,  -432,  -432,  -432,   270,  -432,  -432,  -432,   221,  -105,
    -126,  -432,  -432,  -432,  -432,  -432,  -432,  -432,  -432,   -98,
    -432,  -432,  -432,  -432,  -432,  -432,  -431,  -432,   171,  -432,
    -432,  -432,  -432,  -432,  -432,  -432,   236,  -432,  -432,  -432,
    -432,    88,  -432,  -432,  -101,  -432,  -432,  -432,    53,  -236,
    -432,   462,  -432,  -432,  -292,  -432,   284,  -432,  -432,  -432,
    -432,  -106,  -432,  -432,   226,  -432,  -172,   231,  -432,  -432,
    -432,  -432,   305,  -432,  -432,   302,  -432,  -432,  -175,   113,
    -432,  -432,   -56,  -432,   485,    73,  -134,  -432,   -68,   -95,
    -100,  -432,    -8,  -432,  -306,  -432,  -432
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -226
static const yytype_int16 yytable[] =
{
      27,   173,   262,   146,   325,   224,   197,   173,   380,   146,
     195,   354,   205,   223,   189,   175,   369,   206,   191,   192,
     120,   109,   479,   193,   430,   431,     1,    23,   207,   370,
     212,   347,   371,   348,   222,   435,    25,     4,   478,   226,
     349,    93,    94,    95,    96,   171,   230,   191,   192,   237,
     479,   171,   193,    28,   239,   202,   203,   215,   216,   217,
     204,   122,   123,   124,    29,    30,    31,    32,   318,    27,
     307,   308,   309,   310,   311,   312,   382,   383,    42,    43,
      44,    45,    46,    23,   303,    93,    94,    95,    96,   194,
     105,   266,    25,   305,     5,     6,     7,     8,    23,   218,
      24,   316,     9,    50,    51,    52,    10,    25,   176,   177,
     178,   362,   179,   180,   181,   365,    20,   355,    21,   368,
     218,   208,    22,   218,   319,   297,   343,   307,   308,   309,
     310,   311,   312,   450,   451,   452,  -223,   351,  -224,  -223,
     327,  -224,   202,   203,   232,   233,   234,   204,   122,   123,
     124,  -225,   337,   442,  -225,   443,   340,   341,   235,   339,
      34,   346,   374,    37,   353,   314,   315,    38,   352,   321,
     224,    42,    43,    44,    45,    46,    23,   265,   223,    81,
      82,   270,   492,   493,    69,    25,   501,   399,   202,   203,
     388,    70,   378,   204,   122,   123,   124,   379,    71,   222,
     212,    72,    73,    74,   226,    75,   387,    84,   436,    85,
      77,    78,    86,   389,   392,   395,    87,    88,   400,   202,
     203,   459,    92,   404,   204,   122,   123,   124,   405,    99,
     202,   203,   102,    54,   497,   204,   122,   123,   124,   434,
     500,   103,   185,   106,   188,   107,   176,   177,   178,   454,
     179,   180,   194,   108,   109,   198,   199,   266,   110,    10,
     111,   112,   113,   325,   114,   200,   115,   474,   116,   130,
     213,   214,   228,   117,    42,    43,    44,    45,    46,   118,
     119,   120,   227,   229,   121,   122,   123,   124,   125,   231,
     238,   240,   241,   126,   127,   128,   129,   202,   203,   271,
     216,   217,   204,   122,   123,   124,   191,   192,   120,   397,
     242,   193,   398,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,   263,   264,   280,   460,
     463,   466,   281,   282,   283,   473,   202,   203,   215,   216,
     217,   204,   122,   123,   124,   287,   291,   270,   295,   296,
     130,   298,   299,   202,   203,   485,   488,   491,   204,   122,
     123,   124,   218,   300,   106,   304,   306,   186,   496,   498,
     356,   317,   359,   363,   108,   109,   358,   366,   212,   110,
      10,   111,   112,   113,   360,   114,   396,   115,   458,   116,
     437,   499,   438,   445,   117,    42,    43,    44,    45,    46,
     118,   119,   120,   446,   447,   121,   122,   123,   124,   125,
     448,   449,   453,   455,   126,   127,   128,   129,   328,    42,
      43,    44,    45,    46,   118,   119,   329,   330,   331,   121,
     122,   123,   124,   125,   191,   192,   322,   475,   502,   193,
     332,   323,   505,   456,   457,   467,   406,   407,   408,   409,
     410,   411,   412,   413,   414,   415,   416,   417,   418,   419,
     202,   203,   375,   376,   377,   204,   122,   123,   124,   468,
     469,   130,   406,   407,   408,   409,   410,   411,   412,   413,
     414,   415,   416,   417,   418,   419,   202,   203,   401,   402,
     403,   204,   122,   123,   124,   476,   506,    35,  -220,   333,
     334,   335,   420,    53,   421,   422,   423,   424,   425,   426,
     427,   428,   202,   203,   470,   471,   472,   204,   122,   123,
     124,   218,    83,    91,   187,   384,   439,   336,   420,   373,
     421,   422,   423,   424,   425,   426,   427,   428,   406,   407,
     408,   409,   410,   411,   412,   413,   414,   415,   416,   417,
     418,   419,   504,   243,   244,   245,   246,   247,   248,   249,
     250,   251,   252,   253,   254,   255,   256,   202,   203,   503,
     344,   345,   204,   122,   123,   124,   202,   203,   201,   385,
     386,   204,   122,   123,   124,   381,   441,   257,   218,   440,
     364,   367,     0,     0,   420,   190,   421,   422,   423,   424,
     425,   426,   427,   428,   202,   203,     0,   390,   391,   204,
     122,   123,   124,   202,   203,     0,   393,   394,   204,   122,
     123,   124,   202,   203,     0,   432,   433,   204,   122,   123,
     124,   202,   203,     0,   461,   462,   204,   122,   123,   124,
     202,   203,     0,   464,   465,   204,   122,   123,   124,   202,
     203,     0,   483,   484,   204,   122,   123,   124,   202,   203,
       0,   486,   487,   204,   122,   123,   124,   202,   203,     0,
     489,   490,   204,   122,   123,   124,   202,   203,     0,   494,
     495,   204,   122,   123,   124
};

static const yytype_int16 yycheck[] =
{
       8,   101,   177,   101,   240,   139,   112,   107,   300,   107,
     111,     4,   117,   139,   109,     4,    14,   117,    37,    38,
      39,    12,   453,    42,   330,   331,     4,    37,   128,    27,
     130,    37,    30,    39,   139,   341,    46,     0,    29,   139,
      46,    47,    48,    49,    50,   101,   146,    37,    38,   149,
     481,   107,    42,   105,   160,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    47,    48,    49,    50,    54,    77,
      56,    57,    58,    59,    60,    61,   106,   107,    32,    33,
      34,    35,    36,    37,   218,    47,    48,    49,    50,   108,
      98,   189,    46,   227,     5,     6,     7,     8,    37,   105,
      39,   235,    13,    30,    31,    32,    17,    46,    97,    98,
      99,   283,   101,   102,   103,   287,    39,   110,    39,   291,
     105,   129,    39,   105,   110,   110,   260,    56,    57,    58,
      59,    60,    61,   369,   370,   371,   108,   263,   108,   111,
     241,   111,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   108,   257,    98,   111,   100,   257,   257,    53,   257,
       4,   261,   296,   104,   264,   233,   234,    39,   263,   237,
     304,    32,    33,    34,    35,    36,    37,    38,   304,    66,
      67,   189,    40,    41,    39,    46,   478,   321,    37,    38,
      39,   106,   297,    42,    43,    44,    45,   297,   107,   304,
     300,   104,   104,   104,   304,   104,   306,    40,   342,    41,
     108,   108,    39,   313,   314,   315,    39,    10,   324,    37,
      38,    39,    39,   328,    42,    43,    44,    45,   328,     9,
      37,    38,   109,     4,    41,    42,    43,    44,    45,   339,
     476,   109,     4,     1,    39,     3,    97,    98,    99,   383,
     101,   102,   108,    11,    12,     4,     4,   355,    16,    17,
      18,    19,    20,   499,    22,     4,    24,   442,    26,   108,
       4,     4,     4,    31,    32,    33,    34,    35,    36,    37,
      38,    39,   104,     4,    42,    43,    44,    45,    46,     4,
       4,   111,   104,    51,    52,    53,    54,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    37,    38,    39,   317,
       4,    42,   320,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,   108,   110,     4,   429,
     430,   431,     4,     4,    19,   435,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    18,    28,   355,     4,   110,
     108,     4,   109,    37,    38,   455,   456,   457,    42,    43,
      44,    45,   105,   110,     1,   110,   110,     4,   468,   469,
      97,    54,   109,    21,    11,    12,    55,    23,   478,    16,
      17,    18,    19,    20,   110,    22,    54,    24,   396,    26,
     109,    15,     4,     4,    31,    32,    33,    34,    35,    36,
      37,    38,    39,     4,     4,    42,    43,    44,    45,    46,
       4,     4,     4,   110,    51,    52,    53,    54,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    37,    38,    39,     4,    25,    42,
      53,    44,     4,   110,   110,   110,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      37,    38,    39,    40,    41,    42,    43,    44,    45,   110,
     110,   108,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    37,    38,    39,    40,
      41,    42,    43,    44,    45,   110,     4,    11,   108,   112,
     113,   114,   112,    34,   114,   115,   116,   117,   118,   119,
     120,   121,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   105,    71,    77,   107,   304,   355,   257,   112,   293,
     114,   115,   116,   117,   118,   119,   120,   121,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,   499,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    37,    38,   481,
      40,    41,    42,    43,    44,    45,    37,    38,   116,    40,
      41,    42,    43,    44,    45,   301,   360,   104,   105,   358,
     285,   289,    -1,    -1,   112,   110,   114,   115,   116,   117,
     118,   119,   120,   121,    37,    38,    -1,    40,    41,    42,
      43,    44,    45,    37,    38,    -1,    40,    41,    42,    43,
      44,    45,    37,    38,    -1,    40,    41,    42,    43,    44,
      45,    37,    38,    -1,    40,    41,    42,    43,    44,    45,
      37,    38,    -1,    40,    41,    42,    43,    44,    45,    37,
      38,    -1,    40,    41,    42,    43,    44,    45,    37,    38,
      -1,    40,    41,    42,    43,    44,    45,    37,    38,    -1,
      40,    41,    42,    43,    44,    45,    37,    38,    -1,    40,
      41,    42,    43,    44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   123,   124,     0,     5,     6,     7,     8,    13,
      17,   125,   126,   127,   128,   129,   130,   134,   135,   234,
      39,    39,    39,    37,    39,    46,   136,   244,   105,    47,
      48,    49,    50,   236,     4,   124,   137,   104,    39,   131,
     132,   133,    32,    33,    34,    35,    36,   171,   237,   244,
     237,   237,   237,   126,     4,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,   138,    39,
     106,   107,   104,   104,   104,   104,   140,   108,   108,   230,
     231,   231,   231,   133,    40,    41,    39,    39,    10,   141,
     146,   136,    39,    47,    48,    49,    50,   142,   241,     9,
     147,   148,   109,   109,   143,   244,     1,     3,    11,    12,
      16,    18,    19,    20,    22,    24,    26,    31,    37,    38,
      39,    42,    43,    44,    45,    46,    51,    52,    53,    54,
     108,   149,   150,   151,   152,   153,   154,   155,   156,   157,
     161,   164,   165,   168,   169,   170,   171,   172,   173,   175,
     177,   178,   183,   184,   185,   194,   195,   196,   197,   198,
     199,   201,   203,   209,   210,   211,   212,   220,   221,   232,
     233,   234,   235,   242,   243,     4,    97,    98,    99,   101,
     102,   103,   144,   145,   208,     4,     4,   150,    39,   241,
     236,    37,    38,    42,   108,   196,   213,   213,     4,     4,
       4,   203,    37,    38,    42,   161,   242,   242,   244,   204,
     205,   206,   242,     4,     4,    39,    40,    41,   105,   158,
     159,   160,   161,   162,   238,   239,   242,   104,     4,     4,
     242,     4,    39,    40,    41,    53,   174,   242,     4,   213,
     111,   104,     4,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,   104,   162,   166,
     247,   248,   230,   108,   110,    38,   171,   179,   180,   181,
     244,    39,   214,   215,   216,   217,   218,   219,   238,   242,
       4,     4,     4,    19,   222,   223,   224,    18,   225,   226,
     227,    28,   186,   187,   188,     4,   110,   110,     4,   109,
     110,   207,   163,   238,   110,   238,   110,    56,    57,    58,
      59,    60,    61,   240,   240,   240,   238,    54,    54,   110,
     176,   240,    39,    44,   200,   201,   202,   196,    31,    39,
      40,    41,    53,   112,   113,   114,   156,   161,   167,   171,
     196,   242,   245,   238,    40,    41,   242,    37,    39,    46,
     139,   162,   241,   242,     4,   110,    97,   182,    55,   109,
     110,   228,   218,    21,   224,   218,    23,   227,   218,    14,
      27,    30,   189,   188,   238,    39,    40,    41,   161,   242,
     206,   208,   106,   107,   160,    40,    41,   242,    39,   242,
      40,    41,   242,    40,    41,   242,    54,   244,   244,   238,
     213,    39,    40,    41,   161,   242,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
     112,   114,   115,   116,   117,   118,   119,   120,   121,   246,
     246,   246,    40,    41,   242,   246,   238,   109,     4,   180,
     219,   216,    98,   100,   229,     4,     4,     4,     4,     4,
     201,   201,   201,     4,   238,   110,   110,   110,   244,    39,
     242,    40,    41,   242,    40,    41,   242,   110,   110,   110,
      39,    40,    41,   242,   230,     4,   110,   190,    29,   178,
     191,   192,   193,    40,    41,   242,    40,    41,   242,    40,
      41,   242,    40,    41,    40,    41,   242,    41,   242,    15,
     201,   206,    25,   193,   200,     4,     4
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
        case 13:
#line 445 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 14:
#line 451 "pir.y"
    { set_hll((yyvsp[(2) - (2)].sval)); ;}
    break;

  case 15:
#line 455 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 16:
#line 459 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 17:
#line 463 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 18:
#line 465 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 19:
#line 469 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 20:
#line 471 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 21:
#line 475 "pir.y"
    { (yyval.expr) = expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 23:
#line 485 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 28:
#line 497 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 29:
#line 499 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 30:
#line 501 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 31:
#line 503 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 32:
#line 505 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 33:
#line 507 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 34:
#line 509 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 35:
#line 511 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 36:
#line 513 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 37:
#line 515 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 38:
#line 517 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 39:
#line 519 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 521 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 49:
#line 539 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 50:
#line 543 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 51:
#line 545 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 54:
#line 553 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 57:
#line 563 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 59:
#line 568 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 60:
#line 570 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 76:
#line 592 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 78:
#line 605 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 79:
#line 607 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 80:
#line 611 "pir.y"
    { set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 83:
#line 621 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 88:
#line 633 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 89:
#line 635 "pir.y"
    { push_operand(lexer, expr_from_key((yyvsp[(1) - (1)].key))); ;}
    break;

  case 90:
#line 637 "pir.y"
    { push_operand(lexer, expr_from_target((yyvsp[(1) - (1)].targ))); ;}
    break;

  case 91:
#line 641 "pir.y"
    {
                           if ((yyvsp[(1) - (2)].targ)->type == PMC_TYPE) /* only PMCs can be indexed */
                              set_target_key((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].key));
                           else
                              yyerror(yyscanner, lexer, "indexed object is not of type PMC");

                           (yyval.targ) = (yyvsp[(1) - (2)].targ);
                         ;}
    break;

  case 92:
#line 652 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 93:
#line 656 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 94:
#line 658 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 97:
#line 710 "pir.y"
    {
                           if ((yyvsp[(3) - (3)].ival) == 0)   /* x = 0 -> null x */
                               set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                           else
                               set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                         ;}
    break;

  case 98:
#line 717 "pir.y"
    {
                           if ((yyvsp[(3) - (3)].dval) == 0.0)  /* x = 0.0 -> null x */
                               set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                           else
                               set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                         ;}
    break;

  case 99:
#line 725 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 100:
#line 727 "pir.y"
    {
                           if (targets_equal((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)))
                               set_instr(lexer, "nop");
                           else
                               set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));
                         ;}
    break;

  case 101:
#line 734 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (2)].targ))); ;}
    break;

  case 102:
#line 736 "pir.y"
    { set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 103:
#line 738 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 104:
#line 740 "pir.y"
    {
                            int equal = targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ));
                            if (equal) {
                                if ((yyvsp[(5) - (5)].ival) == 1) {
                                    /* x = x op 1 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB))
                                        set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival) + 1], "%T", (yyvsp[(1) - (5)].targ));
                                    else /* x = x * 1 -> delete */
                                        set_instr(lexer, "nop");
                                }
                                else if ((yyvsp[(5) - (5)].ival) == 0) {
                                    /* x = x op 0 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB))
                                        set_instr(lexer, "nop");
                                    else if ((yyvsp[(4) - (5)].ival) == OP_MUL) /* x = x * 0 -> null x */
                                        set_instrf(lexer, "null", "%T", (yyvsp[(1) - (5)].targ));
                                    else
                                        yyerror(yyscanner, lexer, "cannot divide by 0.0");
                                }
                                else /* x = x op 10 */
                                    set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%i", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].ival));
                            }
                            else /* x = y op ? */
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%i", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].ival));
                         ;}
    break;

  case 105:
#line 766 "pir.y"
    {
                            int equal = targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ));
                            if (equal) {
                                if ((yyvsp[(5) - (5)].dval) == 1.0) {
                                    /* x = x op 1 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB))
                                        set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival) + 1], "%T", (yyvsp[(1) - (5)].targ));
                                    else if (((yyvsp[(4) - (5)].ival) == OP_MUL) || ((yyvsp[(4) - (5)].ival) == OP_DIV) || ((yyvsp[(4) - (5)].ival) == OP_FDIV)) {
                                        /* x = x *|/|// 1 -> delete */
                                        set_instr(lexer, "nop");
                                    }
                                    else /* other operators; x = x >> 1 -> x >>= 1 */
                                        set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%n", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].dval));
                                }
                                else if ((yyvsp[(5) - (5)].dval) == 0.0) {
                                    /* x = x op 0.0 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB))
                                        set_instr(lexer, "nop");
                                    else if ((yyvsp[(4) - (5)].ival) == OP_MUL) /* x = x * 0.0 -> null x */
                                        set_instrf(lexer, "null", "%T", (yyvsp[(1) - (5)].targ));
                                    else if (((yyvsp[(4) - (5)].ival) == OP_DIV) || ((yyvsp[(4) - (5)].ival) == OP_FDIV)) /* x = x / 0 */
                                        yyerror(yyscanner, lexer, "cannot divide by 0.0");
                                    else /* x = x op 0.0 */
                                        set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%n", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].dval));
                                }
                                else /* x = x op 10 */
                                    set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%n", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].dval));
                            }
                            else /* x = y op ? */
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%n", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].dval));

                         ;}
    break;

  case 106:
#line 799 "pir.y"
    {
                            if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ))) /* x = x . "hi" -> x .= "hi" */
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%s", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].sval));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%s", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].sval));
                         ;}
    break;

  case 107:
#line 806 "pir.y"
    {
                           if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ)))
                               set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                           else
                               set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));
                         ;}
    break;

  case 108:
#line 813 "pir.y"
    { set_instrf(lexer, "set", "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 109:
#line 815 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 110:
#line 817 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 111:
#line 821 "pir.y"
    {
                           if ((yyvsp[(2) - (2)].ival) == 1) { /* adding/subtracting 1? */
                              /* "inc" is sorted right after "add";
                               * "dec" is sorted right after "sub";
                               * so select them by adding 1 to the index.
                               */
                              set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival) + 1]);
                           }
                           else
                              set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%i", (yyvsp[(2) - (2)].ival));

                         ;}
    break;

  case 112:
#line 834 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%n", (yyvsp[(2) - (2)].dval)); ;}
    break;

  case 113:
#line 836 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%T", (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 114:
#line 838 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%E", (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 115:
#line 867 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 116:
#line 869 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 117:
#line 871 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 118:
#line 873 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 119:
#line 875 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 120:
#line 877 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 121:
#line 879 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 122:
#line 881 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 123:
#line 886 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ)); ;}
    break;

  case 124:
#line 888 "pir.y"
    { set_instrf(lexer, "set", "%T%E", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 125:
#line 890 "pir.y"
    {
                            if (targets_equal((yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ))) /* set $I0, $I0 -> delete */
                                set_instr(lexer, "nop");
                            else
                                set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ));
                        ;}
    break;

  case 126:
#line 897 "pir.y"
    {
                           if ((yyvsp[(4) - (4)].ival) == 0) /* set $I0, 0 -> null $I0 */
                               set_instrf(lexer, "null", "%T", (yyvsp[(2) - (4)].targ));
                           else
                               set_instrf(lexer, "set", "%T%i", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].ival));
                        ;}
    break;

  case 127:
#line 904 "pir.y"
    {
                            if ((yyvsp[(4) - (4)].dval) == 0) /* set $N0, 0.0 -> null $N0 */
                                set_instrf(lexer, "null", "%T", (yyvsp[(2) - (4)].targ));
                            else
                                set_instrf(lexer, "set", "%T%n", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].dval));
                        ;}
    break;

  case 128:
#line 911 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 129:
#line 913 "pir.y"
    {
                            if ((yyvsp[(4) - (4)].ival) == 0) /* $I0 = set 0 -> null $I0 */
                                set_instrf(lexer, "null", "%T", (yyvsp[(1) - (4)].targ));
                            else
                                set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].ival));
                        ;}
    break;

  case 130:
#line 920 "pir.y"
    {
                            if ((yyvsp[(4) - (4)].dval) == 0) /* $N0 = set 0.0 -> null $N0 */
                                set_instrf(lexer, "null", "%T", (yyvsp[(1) - (4)].targ));
                            else
                                set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].dval));
                        ;}
    break;

  case 131:
#line 927 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 132:
#line 929 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ)); ;}
    break;

  case 133:
#line 931 "pir.y"
    {
                            if (targets_equal((yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ))) /* $I0 = set $I0 -> delete */
                                set_instr(lexer, "nop");
                            else
                                set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ));
                        ;}
    break;

  case 135:
#line 945 "pir.y"
    {
                            if (((yyvsp[(4) - (4)].ival) == 1) && (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) == OP_SUB)))
                                /* add $I0, 1 -> inc $I0 */
                                set_instrf(lexer, opnames[(yyvsp[(1) - (4)].ival) + 1], "%T", (yyvsp[(2) - (4)].targ));
                            else if (((yyvsp[(4) - (4)].ival) == 1) && (((yyvsp[(1) - (4)].ival) == OP_MUL) || ((yyvsp[(1) - (4)].ival) == OP_DIV) || ((yyvsp[(1) - (4)].ival) == OP_FDIV)))
                                /* mul $N0, 1 -> delete */
                                set_instr(lexer, "nop");
                            else if (((yyvsp[(4) - (4)].ival) == 0) && (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) == OP_SUB)))
                                /* add $I0, 0 -> delete */
                                set_instr(lexer, "nop");
                            else
                                set_instrf(lexer, opnames[(yyvsp[(1) - (4)].ival)], "%T%i", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].ival));

                        ;}
    break;

  case 136:
#line 960 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_i_i(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 137:
#line 962 "pir.y"
    {
                            if ((yyvsp[(4) - (4)].dval) == 0) {
                                if (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) == OP_SUB)) /* add $N0, 0.0 -> delete */
                                    set_instr(lexer, "nop");
                                else if ((yyvsp[(1) - (4)].ival) == OP_MUL) /* mul $N0, 0.0 -> null $N0 */
                                    set_instrf(lexer, "null", "%T", (yyvsp[(2) - (4)].targ));
                                else  /* $1 == OP_DIV || OP_FDIV */
                                    yyerror(yyscanner, lexer, "cannot divide by 0.0!");
                            }
                            else if ((yyvsp[(4) - (4)].dval) == 1.0) {
                                if (((yyvsp[(1) - (4)].ival) == OP_MUL) || ((yyvsp[(1) - (4)].ival) == OP_DIV) || ((yyvsp[(1) - (4)].ival) == OP_FDIV))
                                    /* mul $N0, 1.0 -> delete */
                                    set_instr(lexer, "nop");
                                else if (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) == OP_SUB))
                                    /* add $N0, 1.0 -> inc $N0 */
                                    set_instrf(lexer, opnames[(yyvsp[(1) - (4)].ival) + 1], "%T", (yyvsp[(2) - (4)].targ));
                            }
                            else
                                set_instrf(lexer, opnames[(yyvsp[(1) - (4)].ival)], "%T%n", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].dval));
                        ;}
    break;

  case 138:
#line 983 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_i_n(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 139:
#line 985 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_n_n(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 140:
#line 987 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_n_i(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 141:
#line 989 "pir.y"
    {
                            if ((yyvsp[(4) - (6)].ival) == 0) {
                                if (((yyvsp[(1) - (6)].ival) == OP_ADD) || ((yyvsp[(1) - (6)].ival) == OP_SUB)) {
                                    /* add $N0, 0, $N1 -> set $N0, $N1 */
                                    if (targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ))) /* set $N0, $N0 -> delete */
                                        set_instr(lexer, "nop");
                                    else /* set $N0, $N1 */
                                        set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ));
                                }
                                else if (((yyvsp[(1) - (6)].ival) == OP_MUL) || ((yyvsp[(1) - (6)].ival) == OP_DIV) || ((yyvsp[(1) - (6)].ival) == OP_FDIV)) {
                                    /* mul $N0, 0, $N1  -> set $N0, 0 -> null $N0 */
                                    /* div $N0, 0, $N1  -> set $N0, 0 -> null $N0 */
                                    /* fdiv $N0, 0, $N1 -> set $N0, 0 -> null $N0 */
                                    set_instrf(lexer, "null", "%T", (yyvsp[(2) - (6)].targ));
                                }
                            }
                            else if (((yyvsp[(4) - (6)].ival) == 1) && ((yyvsp[(1) - (6)].ival) == OP_MUL)) /* mul $N0, 1, $N1 -> set $N0, $N1 */
                                set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%i%T", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].ival), (yyvsp[(6) - (6)].targ));
                        ;}
    break;

  case 142:
#line 1011 "pir.y"
    {
                            if (((yyvsp[(4) - (6)].dval) == 1.0) && ((yyvsp[(1) - (6)].ival) == OP_MUL)) {
                                /* mul $N0, 1.0, $N1 -> set $N0, $N1 */
                                if (targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ))) /* mul $N0, 1.0, $N0 -> delete */
                                    set_instr(lexer, "nop");
                                else
                                    set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            }
                            else
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%n%T", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].dval), (yyvsp[(6) - (6)].targ));

                        ;}
    break;

  case 143:
#line 1024 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (4)].ival)], "%T%T", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ)); ;}
    break;

  case 144:
#line 1026 "pir.y"
    {
                            if (targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ)))
                                /* op $N0, $N0, $N1 -> op $N0, $N1 */
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].targ));

                        ;}
    break;

  case 145:
#line 1035 "pir.y"
    {
                            int equal = targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ));
                            if ((yyvsp[(6) - (6)].dval) == 1.0) {
                                if (((yyvsp[(1) - (6)].ival) == OP_MUL) || ((yyvsp[(1) - (6)].ival) == OP_DIV) || ((yyvsp[(1) - (6)].ival) == OP_FDIV)) {
                                    if (equal) /* mul $N0, $N0, 1.0 -> mul $N0, 1.0 -> delete*/
                                        set_instr(lexer, "nop");
                                    else /* mul $N0, $N1, 1.0 -> set $N0, $N1 */
                                        set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ));
                                }
                                else if (equal && (((yyvsp[(1) - (6)].ival) == OP_ADD) || ((yyvsp[(1) - (6)].ival) == OP_SUB)))
                                    /* add $I0, $I0, 1.0 */
                                    set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival) + 1], "%T", (yyvsp[(2) - (6)].targ));
                                else /* add $N0, $N1, 1.0 */
                                    set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T%n", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].dval));
                            }
                            else
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T%n", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].dval));

                        ;}
    break;

  case 146:
#line 1055 "pir.y"
    {
                            int equal = targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ));
                            if ((yyvsp[(6) - (6)].ival) == 1) {
                                if (((yyvsp[(1) - (6)].ival) == OP_MUL) || ((yyvsp[(1) - (6)].ival) == OP_DIV) || ((yyvsp[(1) - (6)].ival) == OP_FDIV)) {
                                    if (equal) /* mul $N0, $N0, 1 -> mul $N0, 1 -> delete */
                                        set_instr(lexer, "nop");
                                    else /* mul $N0, $N1, 1 -> set $N0, $N1 */
                                        set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ));
                                }
                                else if (equal && (((yyvsp[(1) - (6)].ival) == OP_ADD) || ((yyvsp[(1) - (6)].ival) == OP_SUB)))
                                    /* add $I0, $I0, 1 -> inc $I0 */
                                    set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival) + 1], "%T", (yyvsp[(2) - (6)].targ));
                                else
                                    set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T%i", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].ival));
                            }
                            else if (((yyvsp[(6) - (6)].ival) == 0) && (((yyvsp[(1) - (6)].ival) == OP_ADD) || ((yyvsp[(1) - (6)].ival) == OP_SUB))) {
                                if (equal) /* add $I0, $I0, 0 -> add $I0, 0 -> delete */
                                    set_instr(lexer, "nop");
                                else
                                    set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ));
                            }
                            else if ((yyvsp[(6) - (6)].ival) == 0) {
                                if ((yyvsp[(1) - (6)].ival) == OP_MUL) /* mul $N0, $N1, 0 -> set $N0, 0 -> null $N0 */
                                    set_instrf(lexer, "null", "%T", (yyvsp[(2) - (6)].targ));
                                else  /* $1 == OP_DIV || $1 == OP_FDIV */
                                    yyerror(yyscanner, lexer, "cannot divide by 0");
                            }
                            else {
                                if (equal)
                                    set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%i", (yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].ival));
                                else
                                    set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T%i", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].ival));
                            }
                        ;}
    break;

  case 147:
#line 1090 "pir.y"
    {
                            if (targets_equal((yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ)))
                                set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].targ));
                        ;}
    break;

  case 148:
#line 1097 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%C", (yyvsp[(1) - (6)].targ), fold_i_i(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 149:
#line 1099 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%C", (yyvsp[(1) - (6)].targ), fold_i_n(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 150:
#line 1101 "pir.y"
    {
                            if ((yyvsp[(4) - (4)].ival) == 0 && (((yyvsp[(3) - (4)].ival) == OP_ADD) || ((yyvsp[(3) - (4)].ival) == OP_SUB))) /* $I0 = add 0 => delete */
                                set_instr(lexer, "nop");
                            else if ((yyvsp[(4) - (4)].ival) == 1) {
                                if (((yyvsp[(3) - (4)].ival) == OP_MUL) || ((yyvsp[(3) - (4)].ival) == OP_DIV) || ((yyvsp[(3) - (4)].ival) == OP_FDIV))
                                    /* $I0 = mul 1 => delete */
                                    set_instr(lexer, "nop");
                                else if (((yyvsp[(3) - (4)].ival) == OP_ADD) || ((yyvsp[(3) - (4)].ival) == OP_SUB)) /* $I0 = add 1 -> inc $I0 */
                                    set_instrf(lexer, opnames[(yyvsp[(3) - (4)].ival) + 1], "%T", (yyvsp[(1) - (4)].targ));
                            }
                            else
                                set_instrf(lexer, opnames[(yyvsp[(3) - (4)].ival)], "%T%i", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].ival));
                        ;}
    break;

  case 151:
#line 1115 "pir.y"
    {
                            /* $I0 = add 0 -> delete */
                            if ((yyvsp[(4) - (4)].dval) == 0 && (((yyvsp[(3) - (4)].ival) == OP_ADD) || ((yyvsp[(3) - (4)].ival) == OP_SUB)))
                                set_instr(lexer, "nop");
                            /* $I0 = mul 1 -> delete */
                            else if ((yyvsp[(4) - (4)].dval) == 1 && (((yyvsp[(3) - (4)].ival) == OP_MUL) || ((yyvsp[(3) - (4)].ival) == OP_DIV) || ((yyvsp[(3) - (4)].ival) == OP_FDIV)))
                                set_instr(lexer, "nop");
                            else
                                set_instrf(lexer, opnames[(yyvsp[(3) - (4)].ival)], "%T%n", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].dval));
                        ;}
    break;

  case 152:
#line 1126 "pir.y"
    {
                            /* $N0 = add 1.5, 10 -> set $N0, 15 */
                            set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (6)].targ), fold_n_i(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].ival)));
                        ;}
    break;

  case 153:
#line 1131 "pir.y"
    {
                            /* $I0 = add 1, 2 -> $I0 = 3 */
                            set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (6)].targ), fold_n_n(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].dval)));
                        ;}
    break;

  case 154:
#line 1136 "pir.y"
    {
                            if (((yyvsp[(4) - (6)].dval) == 1.0) && ((yyvsp[(3) - (6)].ival) == OP_MUL))
                                /* $N0 = mul 1, $N1 -> set $N0, $N1 */
                                set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else if (((yyvsp[(4) - (6)].dval) == 0) && (((yyvsp[(3) - (6)].ival) == OP_ADD) || ((yyvsp[(3) - (6)].ival) == OP_SUB)))
                                /* $N0 = add 0, $N1 -> set $N0, $N1 */
                                set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%n%T", (yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].dval), (yyvsp[(6) - (6)].targ));
                        ;}
    break;

  case 155:
#line 1147 "pir.y"
    {
                            int equal = targets_equal((yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ));
                            if (((yyvsp[(6) - (6)].dval) == 1.0) && (((yyvsp[(3) - (6)].ival) == OP_MUL) || ((yyvsp[(3) - (6)].ival) == OP_DIV) || ((yyvsp[(3) - (6)].ival) == OP_FDIV))) {
                                /* $N0 = mul $N1, 1  -> set $N0, $N1 */
                                /* $N0 = div $N1, 1  -> set $N0, $N1 */
                                /* $N0 = fdiv $N1, 1 -> set $N0, $N1 */
                                if (equal)
                                    set_instr(lexer, "nop");
                                else
                                    set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ));
                            }
                            else {
                                if (equal) /* add $N0, $N0, 42.0 -> add $N0, 42.0 */
                                    set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%n", (yyvsp[(1) - (6)].targ), (yyvsp[(6) - (6)].dval));
                                else /* add $N0, $N1, 42.0 */
                                    set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%T%n", (yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].dval));
                            }
                        ;}
    break;

  case 156:
#line 1167 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 157:
#line 1168 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 158:
#line 1169 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 159:
#line 1170 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 160:
#line 1171 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 162:
#line 1179 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%E%I", (yyvsp[(3) - (5)].expr), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 163:
#line 1181 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 164:
#line 1183 "pir.y"
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
                             if ( (((yyvsp[(2) - (4)].ival) == 0) && (yyvsp[(1) - (4)].ival)) || (((yyvsp[(2) - (4)].ival) == 1) && !(yyvsp[(1) - (4)].ival)) )
                                set_instrf(lexer, "branch", "%I", (yyvsp[(4) - (4)].sval));
                             else
                                set_instr(lexer, "nop");

                          }
                        ;}
    break;

  case 165:
#line 1209 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                        ;}
    break;

  case 166:
#line 1214 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 167:
#line 1219 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 168:
#line 1224 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 169:
#line 1229 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 170:
#line 1231 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 171:
#line 1233 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 172:
#line 1235 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 173:
#line 1237 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 174:
#line 1239 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].ival) ? 1 : 0; ;}
    break;

  case 175:
#line 1241 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].dval) ? 1 : 0; ;}
    break;

  case 176:
#line 1243 "pir.y"
    { (yyval.ival) = evaluate_s((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 177:
#line 1246 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 178:
#line 1247 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 181:
#line 1255 "pir.y"
    { set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 182:
#line 1259 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 183:
#line 1263 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 184:
#line 1265 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 185:
#line 1269 "pir.y"
    { (yyval.symb) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 186:
#line 1273 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 187:
#line 1275 "pir.y"
    { (yyval.sval) = opnames[(yyvsp[(1) - (1)].ival)]; ;}
    break;

  case 188:
#line 1277 "pir.y"
    { /* if a symbol was found, that means it was already declared */
                          yyerror(yyscanner, lexer, "local symbol already declared!");
                          (yyval.sval) = (yyvsp[(1) - (1)].symb)->name; /* always return something to prevent seg. faults. */
                        ;}
    break;

  case 189:
#line 1283 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 190:
#line 1284 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 191:
#line 1288 "pir.y"
    {
                          if ((yyvsp[(4) - (5)].targ)->type == PMC_TYPE) /* only PMCs can be stored as lexicals */
                              set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                          else
                              yyerror(yyscanner, lexer,
                                      "second argument to .lex must be of type PMC");
                        ;}
    break;

  case 194:
#line 1309 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 195:
#line 1316 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 196:
#line 1318 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 197:
#line 1322 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 198:
#line 1324 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 199:
#line 1328 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 200:
#line 1332 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 201:
#line 1334 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 202:
#line 1337 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 203:
#line 1341 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 204:
#line 1343 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 205:
#line 1347 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 206:
#line 1349 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 207:
#line 1353 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 208:
#line 1355 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 209:
#line 1359 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 210:
#line 1361 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 212:
#line 1369 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 213:
#line 1371 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 214:
#line 1373 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 217:
#line 1381 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                             set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                           ;}
    break;

  case 218:
#line 1388 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 219:
#line 1395 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 220:
#line 1397 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 223:
#line 1405 "pir.y"
    { (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 224:
#line 1407 "pir.y"
    { /* local identifiers */
                             if ((yyvsp[(1) - (1)].symb)->type != PMC_TYPE)
                                 yyerror(yyscanner, lexer,
                                         "invokable identifier must be of type PMC");

                             (yyval.targ) = target_from_symbol((yyvsp[(1) - (1)].symb));
                           ;}
    break;

  case 225:
#line 1415 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 226:
#line 1419 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 227:
#line 1421 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 228:
#line 1426 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 229:
#line 1430 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 230:
#line 1432 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 231:
#line 1436 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 232:
#line 1438 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 233:
#line 1442 "pir.y"
    { (yyval.targ) = set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 234:
#line 1446 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 235:
#line 1448 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 236:
#line 1452 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 237:
#line 1454 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 238:
#line 1456 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 239:
#line 1458 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 240:
#line 1460 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 245:
#line 1478 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 246:
#line 1483 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                            ;}
    break;

  case 247:
#line 1490 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 248:
#line 1497 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 249:
#line 1501 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 250:
#line 1503 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 251:
#line 1507 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 252:
#line 1509 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 255:
#line 1517 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 256:
#line 1521 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 257:
#line 1525 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument((yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 258:
#line 1531 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 259:
#line 1540 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 260:
#line 1547 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 261:
#line 1549 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 262:
#line 1554 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 263:
#line 1556 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 264:
#line 1561 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 265:
#line 1565 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 266:
#line 1567 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 267:
#line 1571 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 268:
#line 1573 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 269:
#line 1577 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 270:
#line 1582 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 271:
#line 1584 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 272:
#line 1588 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 273:
#line 1590 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 274:
#line 1597 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 275:
#line 1599 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 276:
#line 1603 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 280:
#line 1614 "pir.y"
    { store_global_const(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 281:
#line 1618 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 282:
#line 1622 "pir.y"
    { (yyval.cval) = new_named_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 283:
#line 1624 "pir.y"
    { (yyval.cval) = new_named_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 284:
#line 1626 "pir.y"
    { (yyval.cval) = new_named_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 285:
#line 1628 "pir.y"
    { (yyval.cval) = new_named_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 286:
#line 1641 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 287:
#line 1643 "pir.y"
    { (yyval.sval) = opnames[(yyvsp[(1) - (1)].ival)]; ;}
    break;

  case 288:
#line 1649 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 289:
#line 1650 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].cval)); ;}
    break;

  case 290:
#line 1653 "pir.y"
    { (yyval.cval) = new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 291:
#line 1654 "pir.y"
    { (yyval.cval) = new_const(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 292:
#line 1655 "pir.y"
    { (yyval.cval) = new_const(NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 293:
#line 1658 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 294:
#line 1659 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 295:
#line 1660 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 296:
#line 1661 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 297:
#line 1662 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 298:
#line 1663 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 299:
#line 1666 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 300:
#line 1667 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 301:
#line 1668 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 302:
#line 1669 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 303:
#line 1677 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 304:
#line 1680 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 305:
#line 1681 "pir.y"
    { (yyval.targ) = reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 306:
#line 1682 "pir.y"
    { (yyval.targ) = reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 307:
#line 1683 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 308:
#line 1684 "pir.y"
    { (yyval.targ) = target_from_symbol((yyvsp[(1) - (1)].symb)); ;}
    break;

  case 309:
#line 1685 "pir.y"
    { /*
                            * if an TK_IDENT was returned, that means the ID was not
                            * declared; emit an error.
                            */
                           yyerror(yyscanner, lexer, "symbol not declared!");
                           /* to prevent seg. faulting, always return something */
                           (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 312:
#line 1699 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 313:
#line 1700 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 314:
#line 1701 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 315:
#line 1704 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 316:
#line 1705 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 317:
#line 1706 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 318:
#line 1707 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 319:
#line 1708 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 320:
#line 1709 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 321:
#line 1710 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 322:
#line 1711 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 323:
#line 1712 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 324:
#line 1713 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 325:
#line 1714 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 326:
#line 1715 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 327:
#line 1716 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 328:
#line 1717 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 329:
#line 1718 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 330:
#line 1719 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 331:
#line 1720 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 332:
#line 1721 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 333:
#line 1722 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 334:
#line 1723 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 335:
#line 1724 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 336:
#line 1725 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 337:
#line 1726 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 338:
#line 1732 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 339:
#line 1733 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 340:
#line 1734 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 341:
#line 1735 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 342:
#line 1736 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 343:
#line 1737 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 344:
#line 1738 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 345:
#line 1739 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 346:
#line 1740 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 347:
#line 1741 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 348:
#line 1742 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 349:
#line 1743 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 350:
#line 1746 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 351:
#line 1747 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4089 "pirparser.c"
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


#line 1750 "pir.y"


#include <math.h>
#include <assert.h>

/*

=head1 FUNCTIONS

=over 4

=item C<static constant *
fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b)>

Evaluates the expression C<a op b> and returns a constant node
containing the result value. Both C<a> and C<b> are integer values.

=cut

*/
static constant *
fold_i_i(yyscan_t yyscanner, int a, pir_math_operator op, int b) {
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
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0!");
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
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot concatenate operands of type 'int' and 'int'\n");
            break;
        case OP_LSR:
            /* from bits.ops: $1 = (INTVAL)((UINTVAL)$2 >> $3); */
            result = (int)((unsigned)a >> b);
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
            /* 7 // 2 -> 3, this is what integer division does (rounding down to whole integers) */
            result = a / b;
            break;
        case OP_XOR:
            result = a ^ b;
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

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            printf("This should never happen!");
            break;
    }
    return new_const(INT_TYPE, result);
}

/*

=item C<static constant *
fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b)>

Same as C<fold_i_i>, except C<a> is of type double.

=cut

*/
static constant *
fold_n_i(yyscan_t yyscanner, double a, pir_math_operator op, int b) {
    double result;
    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0!");
            else
                result = a / b;
            break;
        case OP_MUL:
            result = a * b;
            break;
        case OP_MOD:
        case OP_BOR:
        case OP_BAND:
        case OP_BXOR:
        case OP_SHR:
        case OP_SHL:
        case OP_LSR:
        case OP_XOR:
        case OP_CONCAT:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot apply binary operator to types 'num' and 'int'");
            break;
        case OP_POW:
            result = pow(a, b);
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            result = floor(a / b);
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

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            printf("This should never happen!");
            break;
    }
    return new_const(NUM_TYPE, result);
}

/*

=item C<static constant *
fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b)>

Same as C<fold_i_i>, except C<b> is of type double.

=cut

*/
static constant *
fold_i_n(yyscan_t yyscanner, int a, pir_math_operator op, double b) {
    double result;

    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0!");
            else
                result = a / b;
            break;
        case OP_MUL:
            result = a * b;
            break;
        case OP_MOD:
        case OP_BOR:
        case OP_BAND:
        case OP_BXOR:
        case OP_LSR:
        case OP_SHR:
        case OP_SHL:
        case OP_XOR:
        case OP_CONCAT:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot apply binary operator to types 'int' and 'num'");
            break;
        case OP_POW:
            result = pow(a, b);
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            result = floor(a / b);
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

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            printf("This should never happen!");
            break;
    }
    return new_const(NUM_TYPE, result);
}

/*

=item C<static constant *
fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b)>

Same as C<fold_i_i>, except that both C<a> and C<b> are of type double.

=cut

*/
static constant *
fold_n_n(yyscan_t yyscanner, double a, pir_math_operator op, double b) {
    double result;
    switch (op) {
        case OP_ADD:
            result = a + b;
            break;
        case OP_SUB:
            result = a - b;
            break;
        case OP_DIV:
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner),
                        "cannot divide by 0"); /* throw exception ? */
            else
                result = a / b;
            break;
        case OP_MUL:
            result = a * b;
            break;
        case OP_POW:
            result = pow(a, b);
            break;
        case OP_MOD:
        case OP_BOR:
        case OP_BAND:
        case OP_BXOR:
        case OP_CONCAT:
        case OP_LSR:
        case OP_SHR:
        case OP_SHL:
        case OP_XOR:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot apply binary operator to arguments of type number");
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            if (b == 0)
                yyerror(yyscanner, yyget_extra(yyscanner), "cannot divide by 0");
            else
                result = floor(a / b);
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

        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            break;
    }
    return new_const(NUM_TYPE, result);
}

/*

=item C<static constant *
fold_s_s(yyscan_t yyscanner, char *a, pir_math_operator op, char *b)>

Evaluate the expression C<a op b>, where both C<a> and C<b> are
strings. Only the concatenation and comparison operators are implemented;
other operators will result in an error.

=cut

*/
static constant *
fold_s_s(yyscan_t yyscanner, char *a, pir_math_operator op, char *b) {
    switch (op) {
        case OP_CONCAT:
            return new_const(STRING_TYPE, concat_strings(a, b));

        case OP_ADD:
        case OP_SUB:
        case OP_DIV:
        case OP_MUL:
        case OP_POW:
        case OP_MOD:
        case OP_BOR:
        case OP_BAND:
        case OP_BXOR:
        case OP_LSR:
        case OP_SHR:
        case OP_SHL:
        case OP_XOR:
        case OP_OR:
        case OP_AND:
        case OP_FDIV:
            yyerror(yyscanner, yyget_extra(yyscanner),
                    "cannot apply binary operator to arguments of type number");
            return new_const(INT_TYPE, 0);

        case OP_ISEQ:
        case OP_ISLE:
        case OP_ISLT:
        case OP_ISGE:
        case OP_ISGT:
        case OP_ISNE:
            return new_const(INT_TYPE, (1 == evaluate_s_s(a, op, b)));


        /* OP_INC and OP_DEC are here only to keep the C compiler happy */
        case OP_INC:
        case OP_DEC:
            printf("This should never happen!");
            break;
    }
    return NULL;
}

/*

=item C<static int
evaluate_i_i(int a, pir_rel_operator op, double b)>

Compare C<a> with C<b> according to the relational operator C<op>.
Wrapper for C<evaluate_n_n>, which takes arguments of type double.

=cut

*/
static int
evaluate_i_i(int a, pir_rel_operator op, int b) {
    return evaluate_n_n(a, op, b);
}

/*

=item C<static int
evaluate_n_i(int a, pir_rel_operator op, double b)>

Compare C<a> with C<b> according to the relational operator C<op>.
Wrapper for C<evaluate_n_n>, which takes arguments of type double.

=cut

*/
static int
evaluate_n_i(double a, pir_rel_operator op, int b) {
    return evaluate_n_n(a, op, b);
}

/*

=item C<static int
evaluate_i_n(int a, pir_rel_operator op, double b)>

Compare C<a> with C<b> according to the relational operator C<op>.
Wrapper for C<evaluate_n_n>, which takes arguments of type double.

=cut

*/
static int
evaluate_i_n(int a, pir_rel_operator op, double b) {
    return evaluate_n_n(a, op, b);
}

/*

=item C<static int
evaluate_n_n(double a, pir_rel_operator op, double b)>

Compare C<a> with C<b> according to the relational operator C<op>.
C<op> can be C<<!=>>, C<<==>>, C<< < >>, C<< <= >>, C<< > >> or C<< >= >>.

=cut

*/
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

/*

=item C<static int
evaluate_s_s(char *a, pir_rel_operator op, char *b)>

Compare string C<a> with string C<b> using the operator C<op>.
The function uses C's C<strcmp> function. Based on that result,
which can be -1 (smaller), 0 (equal) or 1 (larger), a boolean
result is returned.

=cut

*/
static int
evaluate_s_s(char * const a, pir_rel_operator op, char * const b) {
    int result = strcmp(a, b);

    switch (op) {
        case OP_NE:
            return (result != 0);
        case OP_EQ:
            return (result == 0);
        case OP_LT:
            return (result < 0);
        case OP_LE:
            return (result <= 0);
        case OP_GT:
            return (result > 0);
        case OP_GE:
            return (result >= 0);
        default:
            return -1;
    }
}

/*

=item C<static int
evaluate_s(char *s)>

Evaluate a string in boolean context; if the string's length is 0, it's false.
If the string equals "0", ".0", "0." or "0.0", it's false.
Otherwise, it's true.

=cut

*/
static int
evaluate_s(char * const s) {
    int strlen_s = strlen(s);

    if (strlen_s > 0) {
        if ((strcmp(s, "0") == 0) || (strcmp(s, ".0") == 0)
            || (strcmp(s, "0.") == 0) || (strcmp(s, "0.0") == 0))
            return 0;
        else
            return 1;
    }
    return 0;
}

/*

=item C<static char *
concat_strings(char *a, char *b)>

Concatenates two strings into a new buffer; frees all memory
of the old strings. The new string is returned.

=cut

*/
static char *
concat_strings(char *a, char *b) {
    int strlen_a = strlen(a);
    char *newstr = (char *)calloc(strlen_a + strlen(b) + 1, sizeof (char));
    assert(newstr != NULL);
    strcpy(newstr, a);
    strcpy(newstr + strlen_a, b);
    free(a);
    free(b);
    a = b = NULL;
    return newstr;
}

/*

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


