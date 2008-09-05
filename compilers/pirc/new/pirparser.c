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
     TK_HLL = 259,
     TK_HLL_MAP = 260,
     TK_LOADLIB = 261,
     TK_SUB = 262,
     TK_END = 263,
     TK_PARAM = 264,
     TK_LEX = 265,
     TK_LOCAL = 266,
     TK_NAMESPACE = 267,
     TK_INVOCANT = 268,
     TK_METH_CALL = 269,
     TK_GLOBALCONST = 270,
     TK_CONST = 271,
     TK_RETURN = 272,
     TK_YIELD = 273,
     TK_SET_YIELD = 274,
     TK_SET_RETURN = 275,
     TK_BEGIN_YIELD = 276,
     TK_END_YIELD = 277,
     TK_BEGIN_RETURN = 278,
     TK_END_RETURN = 279,
     TK_BEGIN_CALL = 280,
     TK_END_CALL = 281,
     TK_GET_RESULTS = 282,
     TK_CALL = 283,
     TK_SET_ARG = 284,
     TK_GET_RESULT = 285,
     TK_NCI_CALL = 286,
     TK_TAILCALL = 287,
     TK_LABEL = 288,
     TK_IDENT = 289,
     TK_INT = 290,
     TK_NUM = 291,
     TK_PMC = 292,
     TK_STRING = 293,
     TK_IF = 294,
     TK_UNLESS = 295,
     TK_NULL = 296,
     TK_GOTO = 297,
     TK_STRINGC = 298,
     TK_INTC = 299,
     TK_NUMC = 300,
     TK_PREG = 301,
     TK_NREG = 302,
     TK_SREG = 303,
     TK_IREG = 304,
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
     TK_INSTANCEOF = 346,
     TK_FLAG_UNIQUE_REG = 347,
     TK_FLAG_NAMED = 348,
     TK_FLAG_SLURPY = 349,
     TK_FLAG_FLAT = 350,
     TK_FLAG_OPTIONAL = 351,
     TK_FLAG_OPT_FLAG = 352,
     TK_FLAG_INVOCANT = 353
   };
#endif
/* Tokens.  */
#define TK_NL 258
#define TK_HLL 259
#define TK_HLL_MAP 260
#define TK_LOADLIB 261
#define TK_SUB 262
#define TK_END 263
#define TK_PARAM 264
#define TK_LEX 265
#define TK_LOCAL 266
#define TK_NAMESPACE 267
#define TK_INVOCANT 268
#define TK_METH_CALL 269
#define TK_GLOBALCONST 270
#define TK_CONST 271
#define TK_RETURN 272
#define TK_YIELD 273
#define TK_SET_YIELD 274
#define TK_SET_RETURN 275
#define TK_BEGIN_YIELD 276
#define TK_END_YIELD 277
#define TK_BEGIN_RETURN 278
#define TK_END_RETURN 279
#define TK_BEGIN_CALL 280
#define TK_END_CALL 281
#define TK_GET_RESULTS 282
#define TK_CALL 283
#define TK_SET_ARG 284
#define TK_GET_RESULT 285
#define TK_NCI_CALL 286
#define TK_TAILCALL 287
#define TK_LABEL 288
#define TK_IDENT 289
#define TK_INT 290
#define TK_NUM 291
#define TK_PMC 292
#define TK_STRING 293
#define TK_IF 294
#define TK_UNLESS 295
#define TK_NULL 296
#define TK_GOTO 297
#define TK_STRINGC 298
#define TK_INTC 299
#define TK_NUMC 300
#define TK_PREG 301
#define TK_NREG 302
#define TK_SREG 303
#define TK_IREG 304
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
#define TK_INSTANCEOF 346
#define TK_FLAG_UNIQUE_REG 347
#define TK_FLAG_NAMED 348
#define TK_FLAG_SLURPY 349
#define TK_FLAG_FLAT 350
#define TK_FLAG_OPTIONAL 351
#define TK_FLAG_OPT_FLAG 352
#define TK_FLAG_INVOCANT 353




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
static int evaluate_c(constant * const c);
static char *concat_strings(char *a, char *b);

/* Parrot can check out whether the specified text is the name of an op.
 * We define a dummy function for now; replace this later.
 */
static int is_parrot_op(char const * const spelling);
static void create_if_instr(yyscan_t yyscanner, lexer_state * const lexer, int invert, int hasnull,
                            char * const name, char * const label);

extern int yyerror(yyscan_t yyscanner, lexer_state * const lexer,
                   char const * const message, ...);

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
#line 179 "pir.y"
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
#line 484 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 497 "pirparser.c"

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
#define YYLAST   814

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  117
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  123
/* YYNRULES -- Number of rules.  */
#define YYNRULES  328
/* YYNRULES -- Number of states.  */
#define YYNSTATES  513

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   354

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   108,     2,     2,     2,   113,   115,     2,
     103,   104,   112,   110,   105,   107,   106,   111,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   102,
       2,    99,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   100,     2,   101,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   114,     2,   109,     2,     2,     2,
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
      95,    96,    97,    98,   116
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
     102,   105,   107,   109,   111,   112,   115,   120,   123,   124,
     127,   129,   131,   136,   137,   140,   141,   144,   147,   150,
     152,   154,   156,   158,   160,   162,   164,   166,   168,   170,
     172,   174,   176,   178,   181,   185,   189,   192,   195,   197,
     199,   201,   202,   204,   206,   210,   214,   216,   218,   220,
     223,   227,   229,   233,   236,   237,   239,   241,   245,   249,
     253,   257,   261,   266,   270,   274,   278,   282,   286,   290,
     294,   299,   305,   310,   315,   319,   323,   327,   331,   335,
     339,   343,   347,   350,   356,   362,   368,   374,   380,   386,
     392,   398,   404,   409,   414,   419,   424,   429,   434,   439,
     444,   449,   454,   459,   464,   469,   473,   477,   481,   485,
     489,   493,   497,   501,   505,   507,   509,   511,   513,   517,
     522,   524,   528,   531,   533,   534,   536,   542,   544,   546,
     555,   556,   558,   560,   563,   567,   571,   574,   580,   581,
     584,   585,   587,   589,   592,   596,   598,   601,   605,   609,
     611,   613,   615,   620,   623,   625,   627,   629,   631,   633,
     635,   637,   639,   643,   644,   646,   648,   652,   655,   656,
     659,   661,   663,   665,   667,   670,   672,   674,   676,   678,
     682,   686,   690,   694,   695,   697,   699,   703,   705,   707,
     711,   714,   716,   722,   728,   729,   731,   733,   736,   740,
     741,   743,   745,   748,   752,   753,   756,   758,   761,   762,
     764,   768,   771,   773,   775,   778,   781,   786,   791,   796,
     801,   803,   805,   807,   809,   811,   813,   815,   817,   819,
     821,   823,   825,   827,   829,   831,   833,   835,   837,   839,
     841,   843,   845,   847,   849,   851,   853,   855,   857,   859,
     861,   863,   865,   867,   869,   871,   873,   875,   877,   879,
     881,   883,   885,   887,   889,   891,   893,   895,   897,   899,
     901,   903,   905,   907,   909,   911,   913,   915,   917,   919,
     921,   923,   925,   927,   929,   931,   933,   935,   937
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     118,     0,    -1,   119,   120,   119,    -1,    -1,     3,    -1,
     121,    -1,   120,     3,   121,    -1,   129,    -1,   226,    -1,
     125,    -1,   123,    -1,   124,    -1,   122,    -1,     6,    43,
      -1,     4,    43,    -1,     5,    43,    99,    43,    -1,    12,
     100,   126,   101,    -1,    -1,   127,    -1,   128,    -1,   127,
     102,   128,    -1,    43,    -1,   130,   132,     3,   135,   141,
       8,    -1,     7,   131,    -1,   235,    -1,    43,    -1,    -1,
     132,   133,    -1,    82,    -1,    79,    -1,    80,    -1,    81,
      -1,    83,    -1,    86,    -1,    88,    -1,    89,    -1,    87,
      -1,    84,   103,   131,   104,    -1,    85,   222,    -1,    90,
     223,    -1,    91,   223,    -1,   235,    -1,    43,    -1,   158,
      -1,    -1,   135,   136,    -1,     9,   137,   138,     3,    -1,
     232,   235,    -1,    -1,   138,   139,    -1,   200,    -1,   140,
      -1,    98,   103,   134,   104,    -1,    -1,   141,   142,    -1,
      -1,   143,   144,    -1,    33,     3,    -1,    33,   145,    -1,
     145,    -1,   165,    -1,   170,    -1,   171,    -1,   176,    -1,
     224,    -1,   201,    -1,   202,    -1,   177,    -1,   160,    -1,
     149,    -1,   148,    -1,   147,    -1,   146,    -1,     1,     3,
      -1,    41,   233,     3,    -1,    27,   195,     3,    -1,   150,
       3,    -1,   151,   152,    -1,    34,    -1,   153,    -1,   155,
      -1,    -1,   154,    -1,   156,    -1,   154,   105,   156,    -1,
     158,    99,   229,    -1,   229,    -1,   158,    -1,   157,    -1,
     194,   158,    -1,   100,   159,   101,    -1,   229,    -1,   159,
     102,   229,    -1,   163,     3,    -1,    -1,   162,    -1,   156,
      -1,   162,   105,   156,    -1,   233,    99,    44,    -1,   233,
      99,    45,    -1,   233,    99,    43,    -1,   233,    99,   164,
      -1,   233,    99,   151,   161,    -1,   233,   239,   229,    -1,
     233,    68,    44,    -1,   233,    68,    45,    -1,   233,    69,
      44,    -1,   233,    69,    45,    -1,   233,    68,   233,    -1,
     233,    69,   233,    -1,   233,    99,   237,   229,    -1,   233,
      99,   233,   238,   233,    -1,   236,   158,    99,   229,    -1,
      46,   158,    99,   229,    -1,    44,   238,   233,    -1,    45,
     238,   233,    -1,    43,   238,   233,    -1,    43,   238,    43,
      -1,    44,   238,    44,    -1,    45,   238,    45,    -1,    44,
     238,    45,    -1,    45,   238,    44,    -1,   166,     3,    -1,
     168,    41,    34,    42,   235,    -1,   168,    41,    35,    42,
     235,    -1,   168,    41,    36,    42,   235,    -1,   168,    41,
      37,    42,   235,    -1,   168,    41,    38,    42,   235,    -1,
     168,    41,    39,    42,   235,    -1,   168,    41,    40,    42,
     235,    -1,   168,    41,    42,    42,   235,    -1,   168,    41,
      41,    42,   235,    -1,   168,   230,   169,   235,    -1,   168,
      34,   169,   235,    -1,   168,    35,   169,   235,    -1,   168,
      36,   169,   235,    -1,   168,    37,   169,   235,    -1,   168,
      38,   169,   235,    -1,   168,    39,   169,   235,    -1,   168,
      40,   169,   235,    -1,   168,    42,    42,   235,    -1,   168,
      42,   105,   235,    -1,   168,    41,    42,   235,    -1,   168,
      41,   105,   235,    -1,   168,   167,    42,   235,    -1,   233,
     231,   229,    -1,    44,   231,   233,    -1,    45,   231,   233,
      -1,    43,   231,   233,    -1,    44,   231,    44,    -1,    44,
     231,    45,    -1,    45,   231,    44,    -1,    45,   231,    45,
      -1,    43,   231,    43,    -1,    39,    -1,    40,    -1,    42,
      -1,   105,    -1,    42,   235,     3,    -1,    11,   232,   172,
       3,    -1,   173,    -1,   172,   105,   173,    -1,   174,   175,
      -1,   235,    -1,    -1,    92,    -1,    10,    43,   105,   194,
       3,    -1,   178,    -1,   187,    -1,    25,     3,   179,   182,
       3,   184,    26,     3,    -1,    -1,   180,    -1,   181,    -1,
     180,   181,    -1,    29,   210,     3,    -1,    28,   194,   183,
      -1,    31,   194,    -1,    13,   194,     3,    14,   193,    -1,
      -1,   105,   194,    -1,    -1,   185,    -1,   186,    -1,   185,
     186,    -1,    30,   198,     3,    -1,   171,    -1,   188,     3,
      -1,   195,    99,   189,    -1,   233,    99,   189,    -1,   189,
      -1,   191,    -1,   190,    -1,   194,   106,   193,   205,    -1,
     192,   205,    -1,   194,    -1,    43,    -1,   235,    -1,    46,
      -1,    48,    -1,    43,    -1,   235,    -1,    46,    -1,   103,
     196,   104,    -1,    -1,   197,    -1,   198,    -1,   197,   105,
     198,    -1,   233,   199,    -1,    -1,   199,   200,    -1,    96,
      -1,    97,    -1,    94,    -1,    92,    -1,    93,   222,    -1,
     203,    -1,   212,    -1,   204,    -1,   213,    -1,    17,   205,
       3,    -1,    32,   189,     3,    -1,    18,   205,     3,    -1,
     103,   206,   104,    -1,    -1,   207,    -1,   208,    -1,   207,
     105,   208,    -1,   210,    -1,   209,    -1,    43,    50,   211,
      -1,   211,   220,    -1,   229,    -1,    23,     3,   217,    24,
       3,    -1,    21,     3,   214,    22,     3,    -1,    -1,   215,
      -1,   216,    -1,   215,   216,    -1,    19,   210,     3,    -1,
      -1,   218,    -1,   219,    -1,   218,   219,    -1,    20,   210,
       3,    -1,    -1,   220,   221,    -1,    95,    -1,    93,   222,
      -1,    -1,   223,    -1,   103,    43,   104,    -1,   225,     3,
      -1,   226,    -1,   227,    -1,    16,   228,    -1,    15,   228,
      -1,    35,   235,    99,    44,    -1,    36,   235,    99,    45,
      -1,    38,   235,    99,    43,    -1,    37,   235,    99,    43,
      -1,   233,    -1,   230,    -1,    43,    -1,    44,    -1,    45,
      -1,    51,    -1,    52,    -1,    53,    -1,    54,    -1,    56,
      -1,    55,    -1,    35,    -1,    36,    -1,    37,    -1,    38,
      -1,   234,    -1,    46,    -1,    47,    -1,    49,    -1,    48,
      -1,   235,    -1,    34,    -1,   236,    -1,    39,    -1,    40,
      -1,    42,    -1,    35,    -1,    36,    -1,    38,    -1,    37,
      -1,    41,    -1,   107,    -1,   108,    -1,   109,    -1,   110,
      -1,   107,    -1,   111,    -1,   112,    -1,   113,    -1,   114,
      -1,   115,    -1,   109,    -1,   116,    -1,    64,    -1,    57,
      -1,    58,    -1,    59,    -1,    61,    -1,    62,    -1,    60,
      -1,    63,    -1,    52,    -1,    54,    -1,    53,    -1,    56,
      -1,    55,    -1,    51,    -1,    70,    -1,    71,    -1,    72,
      -1,    73,    -1,    76,    -1,    74,    -1,    75,    -1,    77,
      -1,    78,    -1,    66,    -1,    67,    -1,    65,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   424,   424,   429,   430,   433,   434,   437,   438,   439,
     440,   441,   442,   445,   451,   455,   459,   464,   465,   469,
     471,   475,   479,   485,   489,   490,   493,   494,   497,   499,
     501,   503,   505,   507,   509,   511,   513,   515,   517,   519,
     521,   525,   526,   527,   530,   531,   534,   537,   542,   543,
     547,   548,   551,   557,   558,   562,   562,   566,   568,   570,
     573,   574,   575,   576,   577,   578,   579,   580,   581,   582,
     583,   584,   585,   589,   599,   603,   607,   610,   613,   617,
     625,   628,   629,   632,   633,   636,   665,   667,   669,   673,
     700,   704,   706,   711,   757,   758,   761,   762,   765,   772,
     779,   785,   791,   793,   795,   804,   813,   822,   831,   833,
     835,   837,   844,   861,   894,   896,   898,   900,   902,   904,
     906,   908,   923,   931,   933,   935,   937,   939,   941,   943,
     945,   947,   949,   959,   961,   963,   965,   967,   969,   971,
     973,   975,   977,   979,   981,  1007,  1012,  1017,  1022,  1027,
    1029,  1031,  1033,  1035,  1039,  1040,  1043,  1044,  1047,  1051,
    1055,  1057,  1061,  1065,  1074,  1075,  1078,  1098,  1099,  1102,
    1114,  1115,  1119,  1121,  1125,  1129,  1131,  1133,  1139,  1140,
    1145,  1146,  1150,  1152,  1156,  1158,  1162,  1166,  1168,  1170,
    1174,  1175,  1178,  1198,  1205,  1207,  1211,  1230,  1232,  1234,
    1238,  1240,  1245,  1250,  1251,  1255,  1257,  1261,  1266,  1267,
    1271,  1273,  1275,  1277,  1279,  1289,  1290,  1293,  1294,  1297,
    1302,  1312,  1319,  1324,  1325,  1329,  1331,  1335,  1336,  1339,
    1343,  1347,  1351,  1360,  1370,  1371,  1376,  1378,  1383,  1388,
    1389,  1393,  1395,  1399,  1405,  1406,  1410,  1412,  1420,  1421,
    1425,  1429,  1432,  1433,  1436,  1440,  1444,  1446,  1448,  1450,
    1467,  1468,  1472,  1473,  1474,  1477,  1478,  1479,  1480,  1481,
    1482,  1485,  1486,  1487,  1488,  1496,  1499,  1500,  1501,  1502,
    1503,  1518,  1519,  1522,  1523,  1524,  1525,  1526,  1527,  1528,
    1529,  1532,  1533,  1534,  1537,  1538,  1539,  1540,  1541,  1542,
    1543,  1544,  1545,  1546,  1547,  1548,  1549,  1550,  1551,  1552,
    1553,  1554,  1555,  1556,  1557,  1558,  1559,  1565,  1566,  1567,
    1568,  1569,  1570,  1571,  1572,  1573,  1574,  1575,  1576
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\"\\n\"", "\".HLL\"", "\".HLL_map\"",
  "\".loadlib\"", "\".sub\"", "\".end\"", "\".param\"", "\".lex\"",
  "\".local\"", "\".namespace\"", "\".invocant\"", "\".meth_call\"",
  "\".globalconst\"", "\".const\"", "\".return\"", "\".yield\"",
  "\".set_yield\"", "\".set_return\"", "\".begin_yield\"",
  "\".end_yield\"", "\".begin_return\"", "\".end_return\"",
  "\".begin_call\"", "\".end_call\"", "\".get_results\"", "\".call\"",
  "\".set_arg\"", "\".get_result\"", "\".nci_call\"", "\".tailcall\"",
  "\"label\"", "\"identifier\"", "\"int\"", "\"num\"", "\"pmc\"",
  "\"string\"", "\"if\"", "\"unless\"", "\"null\"", "\"goto\"",
  "\"string constant\"", "\"integer constant\"", "\"number constant\"",
  "\"PMC register\"", "\"number register\"", "\"string register\"",
  "\"integer register\"", "\"=>\"", "\"!=\"", "\"==\"", "\"<\"", "\"<=\"",
  "\">\"", "\">=\"", "\">>>\"", "\">>\"", "\"<<\"", "\"//\"", "\"||\"",
  "\"&&\"", "\"~~\"", "\".\"", "\">>>=\"", "\">>=\"", "\"<<=\"", "\"+=\"",
  "\"-=\"", "\"*=\"", "\"%=\"", "\"**=\"", "\"/=\"", "\"|=\"", "\"&=\"",
  "\"//=\"", "\"~=\"", "\".=\"", "\":init\"", "\":load\"", "\":main\"",
  "\":anon\"", "\":method\"", "\":outer\"", "\":vtable\"", "\":lex\"",
  "\":multi\"", "\":postcomp\"", "\":immediate\"", "\":lexid\"",
  "\":instanceof\"", "\":unique_reg\"", "\":named\"", "\":slurpy\"",
  "\":flat\"", "\":optional\"", "\":opt_flag\"", "\":invocant\"", "'='",
  "'['", "']'", "';'", "'('", "')'", "','", "'.'", "'-'", "'!'", "'~'",
  "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"", "$accept", "TOP",
  "opt_nl", "pir_chunks", "pir_chunk", "loadlib", "hll_specifier",
  "hll_mapping", "namespace_decl", "opt_namespace", "namespace",
  "namespace_slice", "sub_def", "sub_head", "sub_id", "sub_flags",
  "sub_flag", "multi_type", "parameters", "parameter", "param",
  "param_flags", "param_flag", "invocant_param", "instructions",
  "instruction", "@1", "instr", "statement", "error_stat", "null_stat",
  "getresults_stat", "parrot_stat", "parrot_instruction", "parrot_op",
  "opt_op_args", "op_args", "parrot_op_args", "keylist_assignment",
  "op_arg", "keyaccess", "keylist", "keys", "assignment_stat", "args1",
  "args2", "assignment", "binary_expr", "conditional_stat",
  "conditional_instr", "condition", "if_unless", "then", "goto_stat",
  "local_decl", "local_id_list", "local_id", "local_var_name",
  "has_unique_reg", "lex_decl", "invocation_stat", "long_invocation_stat",
  "opt_long_arguments", "long_arguments", "long_argument",
  "long_invocation", "opt_ret_cont", "opt_long_results", "long_results",
  "long_result", "short_invocation_stat", "short_invocation",
  "simple_invocation", "methodcall", "subcall", "sub", "method",
  "pmc_object", "opt_target_list", "opt_list", "target_list",
  "result_target", "target_flags", "target_flag", "return_stat",
  "yield_stat", "short_return_stat", "short_yield_stat", "arguments",
  "opt_arguments_list", "arguments_list", "argument", "named_arg",
  "short_arg", "arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "expression", "constant", "rel_op", "type", "target",
  "symbol", "identifier", "keyword", "unop", "binop", "augmented_op", 0
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
     345,   346,   347,   348,   349,   350,   351,   352,   353,    61,
      91,    93,    59,    40,    41,    44,    46,    45,    33,   126,
      43,    47,    42,    37,   124,    38,   354
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   117,   118,   119,   119,   120,   120,   121,   121,   121,
     121,   121,   121,   122,   123,   124,   125,   126,   126,   127,
     127,   128,   129,   130,   131,   131,   132,   132,   133,   133,
     133,   133,   133,   133,   133,   133,   133,   133,   133,   133,
     133,   134,   134,   134,   135,   135,   136,   137,   138,   138,
     139,   139,   140,   141,   141,   143,   142,   144,   144,   144,
     145,   145,   145,   145,   145,   145,   145,   145,   145,   145,
     145,   145,   145,   146,   147,   148,   149,   150,   151,   152,
     152,   153,   153,   154,   154,   155,   156,   156,   156,   157,
     158,   159,   159,   160,   161,   161,   162,   162,   163,   163,
     163,   163,   163,   163,   163,   163,   163,   163,   163,   163,
     163,   163,   163,   163,   164,   164,   164,   164,   164,   164,
     164,   164,   165,   166,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   166,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   166,   166,   167,   167,   167,   167,   167,
     167,   167,   167,   167,   168,   168,   169,   169,   170,   171,
     172,   172,   173,   174,   175,   175,   176,   177,   177,   178,
     179,   179,   180,   180,   181,   182,   182,   182,   183,   183,
     184,   184,   185,   185,   186,   186,   187,   188,   188,   188,
     189,   189,   190,   191,   192,   192,   193,   193,   193,   193,
     194,   194,   195,   196,   196,   197,   197,   198,   199,   199,
     200,   200,   200,   200,   200,   201,   201,   202,   202,   203,
     203,   204,   205,   206,   206,   207,   207,   208,   208,   209,
     210,   211,   212,   213,   214,   214,   215,   215,   216,   217,
     217,   218,   218,   219,   220,   220,   221,   221,   222,   222,
     223,   224,   225,   225,   226,   227,   228,   228,   228,   228,
     229,   229,   230,   230,   230,   231,   231,   231,   231,   231,
     231,   232,   232,   232,   232,   233,   234,   234,   234,   234,
     234,   235,   235,   236,   236,   236,   236,   236,   236,   236,
     236,   237,   237,   237,   238,   238,   238,   238,   238,   238,
     238,   238,   238,   238,   238,   238,   238,   238,   238,   238,
     238,   238,   238,   238,   238,   238,   238,   239,   239,   239,
     239,   239,   239,   239,   239,   239,   239,   239,   239
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     2,     2,     4,     4,     0,     1,     1,
       3,     1,     6,     2,     1,     1,     0,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     2,     2,
       2,     1,     1,     1,     0,     2,     4,     2,     0,     2,
       1,     1,     4,     0,     2,     0,     2,     2,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     2,     3,     3,     2,     2,     1,     1,
       1,     0,     1,     1,     3,     3,     1,     1,     1,     2,
       3,     1,     3,     2,     0,     1,     1,     3,     3,     3,
       3,     3,     4,     3,     3,     3,     3,     3,     3,     3,
       4,     5,     4,     4,     3,     3,     3,     3,     3,     3,
       3,     3,     2,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     4,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     1,     1,     1,     1,     3,     4,
       1,     3,     2,     1,     0,     1,     5,     1,     1,     8,
       0,     1,     1,     2,     3,     3,     2,     5,     0,     2,
       0,     1,     1,     2,     3,     1,     2,     3,     3,     1,
       1,     1,     4,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     0,     1,     1,     3,     2,     0,     2,
       1,     1,     1,     1,     2,     1,     1,     1,     1,     3,
       3,     3,     3,     0,     1,     1,     3,     1,     1,     3,
       2,     1,     5,     5,     0,     1,     1,     2,     3,     0,
       1,     1,     2,     3,     0,     2,     1,     2,     0,     1,
       3,     2,     1,     1,     2,     2,     4,     4,     4,     4,
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
       0,     3,     5,    12,    10,    11,     9,     7,    26,     8,
      14,     0,    13,   281,   286,   287,   289,   288,   283,   284,
     290,   285,    25,    23,    24,   282,    17,     0,     0,     0,
       0,   254,     4,     2,     0,     0,    21,     0,    18,    19,
       0,     0,     0,     0,     6,    44,    29,    30,    31,    28,
      32,     0,   248,    33,    36,    34,    35,     0,     0,    27,
      15,    16,     0,     0,     0,     0,     0,    53,     0,     0,
      38,   249,    39,    40,    20,   256,   257,   259,   258,     0,
      45,    55,     0,     0,   271,   272,   273,   274,    48,     0,
      22,    54,     0,    37,   250,     0,    47,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   281,
     283,   284,   290,   285,   195,   276,   277,   279,   278,   203,
      56,    59,    72,    71,    70,    69,     0,    81,    68,     0,
      60,     0,     0,    61,    62,    63,    67,   167,   168,     0,
     189,   191,   190,     0,   194,     0,    65,    66,   215,   217,
     216,   218,    64,     0,   252,   253,     0,   275,   280,   282,
      46,   213,   248,   212,   210,   211,     0,    49,    51,    50,
      73,     0,     0,   255,   223,     0,     0,   234,   239,   170,
       0,   201,     0,   200,    57,    58,   276,     0,   280,     0,
       0,     0,     0,   204,   205,   208,    76,   262,   263,   264,
     276,    77,    79,    82,    80,    83,    88,    87,     0,    86,
     261,   260,    93,   122,   281,   286,   287,   289,   288,   283,
     284,   290,   285,   262,   263,   264,     0,     0,     0,   186,
     193,     0,     0,   251,   328,   326,   327,     0,     0,   317,
     318,   319,   320,   322,   323,   321,   324,   325,     0,     0,
       0,   214,     0,     0,     0,   160,   164,   163,   262,     0,
     224,   225,   228,   227,   244,   231,   219,   221,     0,     0,
     235,   236,     0,     0,   240,   241,     0,     0,   171,   172,
      75,   220,    74,   158,     0,    91,     0,   202,     0,   207,
       0,     0,    89,   156,   157,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   265,   266,   267,   268,   270,   269,
       0,     0,     0,     0,     0,     0,   199,   197,   198,     0,
     196,   187,   104,   105,   108,   106,   107,   109,   100,    98,
      99,   291,   292,   293,    94,   101,   188,     0,     0,   103,
       0,    42,     0,    43,    41,     0,   159,     0,   165,   162,
       0,   222,     0,   230,     0,     0,   237,     0,     0,   242,
       0,     0,     0,     0,     0,   173,    90,     0,   113,   206,
     209,    84,    87,    85,   133,   134,   135,   136,   137,   138,
     139,     0,     0,     0,     0,     0,     0,     0,     0,   285,
     142,   143,   140,   141,   153,   148,   149,   150,   146,   151,
     152,   147,   144,   132,   145,   192,   316,   311,   313,   312,
     315,   314,   304,   305,   306,   309,   307,   308,   310,   303,
     295,   301,   294,   296,   297,   298,   299,   300,   302,     0,
       0,     0,    96,   102,    95,     0,   110,   112,    52,   166,
     161,   229,   226,   248,   246,   245,   238,   233,   243,   232,
     174,     0,   178,   176,   180,    92,   123,   124,   125,   126,
     127,   128,   129,   131,   130,   117,   116,   118,   120,   114,
     121,   119,   115,     0,   111,   247,     0,     0,   175,     0,
     185,     0,   181,   182,    97,     0,   179,     0,     0,   183,
     177,   184,   169
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    47,
      48,    49,    17,    18,    33,    44,    69,   362,    77,    90,
      98,   105,   177,   178,    91,   101,   102,   130,   131,   132,
     133,   134,   135,   136,   137,   211,   212,   213,   214,   215,
     216,   392,   294,   138,   453,   454,   139,   355,   140,   141,
     236,   142,   305,   143,   144,   264,   265,   266,   369,   145,
     146,   147,   287,   288,   289,   384,   498,   501,   502,   503,
     148,   149,   150,   151,   152,   153,   339,   154,   155,   202,
     203,   204,   299,   179,   156,   157,   158,   159,   185,   269,
     270,   271,   272,   273,   274,   160,   161,   279,   280,   281,
     283,   284,   285,   373,   465,    80,    81,   162,   163,    19,
     165,    41,   275,   220,   330,    99,   221,   167,   198,    35,
     358,   449,   259
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -464
static const yytype_int16 yypact[] =
{
       9,  -464,    15,   304,  -464,   -19,    -6,    -2,   518,   -50,
      69,    52,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,   -38,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,  -464,  -464,  -464,    26,   763,   763,   763,
     763,  -464,   304,  -464,   189,    29,  -464,   -15,   -10,  -464,
       0,    14,    17,    21,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,    27,    28,  -464,  -464,  -464,  -464,    28,    28,  -464,
    -464,  -464,    26,    49,    83,    89,   104,   134,   518,   105,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,   191,
    -464,   143,    46,    50,  -464,  -464,  -464,  -464,  -464,   763,
    -464,  -464,    41,  -464,  -464,    25,  -464,   159,   132,   191,
      69,    93,    93,   198,   199,   201,   118,   247,   402,   142,
     539,   555,   747,   763,  -464,    -5,  -464,  -464,  -464,   747,
    -464,  -464,  -464,  -464,  -464,  -464,   204,   434,  -464,   221,
    -464,   227,   571,  -464,  -464,  -464,  -464,  -464,  -464,   229,
    -464,  -464,  -464,    93,   133,   139,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,   237,  -464,  -464,   473,  -464,    -3,   141,
    -464,  -464,    28,  -464,  -464,  -464,   140,  -464,  -464,  -464,
    -464,   144,   763,  -464,   587,   241,   245,   232,   233,   238,
     263,  -464,   288,  -464,  -464,  -464,  -464,   292,  -464,   293,
     603,   205,   202,   200,  -464,  -464,  -464,  -464,  -464,  -464,
       8,  -464,  -464,   212,  -464,  -464,  -464,   208,   141,  -464,
    -464,  -464,  -464,  -464,   -20,   -20,   -20,   -20,   -20,   -20,
     -20,   100,    -9,   117,   117,   117,   277,   -20,   117,  -464,
    -464,   174,   247,  -464,  -464,  -464,  -464,   619,   635,  -464,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,   418,   603,
     219,  -464,   222,   330,     7,  -464,   231,  -464,   271,   220,
     236,  -464,  -464,  -464,  -464,  -464,  -464,  -464,   603,   320,
     232,  -464,   603,   319,   233,  -464,   603,    12,   238,  -464,
    -464,  -464,  -464,  -464,   -53,  -464,   603,  -464,   747,   101,
     434,   603,  -464,  -464,  -464,   763,   763,   763,   763,   763,
     763,   763,   302,   303,   305,   306,   307,   308,   309,   310,
     772,   763,   763,   763,  -464,  -464,  -464,  -464,  -464,  -464,
     715,   651,   667,   763,   763,   603,  -464,  -464,  -464,    93,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,   276,   455,
     455,  -464,  -464,  -464,   434,  -464,  -464,   455,   603,  -464,
     603,  -464,   249,  -464,  -464,   359,  -464,   763,  -464,  -464,
     603,  -464,   587,   -49,   360,   374,  -464,   375,   377,  -464,
     378,   330,   330,   330,   379,  -464,  -464,   603,  -464,  -464,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,   763,   763,   763,   763,   763,   763,   763,   763,   763,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,   731,
     683,   699,  -464,  -464,   279,   747,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,    28,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,   399,   301,  -464,     5,  -464,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,   434,  -464,  -464,   393,   330,  -464,   747,
    -464,   382,     5,  -464,  -464,   174,  -464,   406,   407,  -464,
    -464,  -464,  -464
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -464,  -464,   400,  -464,   372,  -464,  -464,  -464,  -464,  -464,
    -464,   343,  -464,  -464,   338,  -464,  -464,  -464,  -464,  -464,
    -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,   312,  -464,
    -464,  -464,  -464,  -464,   163,  -464,  -464,  -464,  -464,  -294,
    -464,  -116,  -464,  -464,  -464,  -464,  -464,  -464,  -464,  -464,
    -464,  -464,   -70,  -464,  -463,  -464,    55,  -464,  -464,  -464,
    -464,  -464,  -464,  -464,   136,  -464,  -464,  -464,  -464,   -76,
    -464,  -464,  -109,  -464,  -464,  -464,   -77,  -136,   315,  -464,
    -464,  -293,  -464,   147,  -464,  -464,  -464,  -464,  -108,  -464,
    -464,    60,  -464,  -215,    63,  -464,  -464,  -464,  -464,   155,
    -464,  -464,   203,  -464,  -464,  -169,    58,  -464,  -464,   -82,
    -464,   337,  -135,   342,  -221,   381,   -95,  -464,    -8,   -64,
    -464,  -331,  -464
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -202
static const yytype_int16 yytable[] =
{
      34,   218,   219,   261,   186,   389,   391,   166,   192,   201,
     366,   500,     1,   331,   332,     4,   109,   335,   450,   451,
     164,   217,   303,   166,    20,   381,   455,   197,   170,    50,
      51,    52,    53,   322,   205,   499,   164,    21,   169,   500,
     382,    22,   107,   383,   463,   240,   464,   238,   386,   387,
      36,   108,   109,   260,   169,    42,   110,    10,   111,   112,
     452,    45,   113,   374,   114,   295,   115,   377,   116,    46,
      34,   380,    70,   117,   118,   119,    24,    25,    26,    27,
     120,   121,   122,   123,   124,   304,    71,   125,   126,   127,
     128,   106,    72,    85,   168,   200,   323,  -200,  -201,    73,
    -200,  -201,   302,  -200,    37,    38,    39,    40,  -201,   193,
     168,  -201,   367,    74,  -201,   199,    75,   171,   172,   173,
      76,   174,   175,   176,   359,    82,    83,   365,    86,   168,
      78,    79,    87,   341,   312,   313,   314,   315,   316,   317,
     318,   319,   320,    89,   129,   -78,   363,    88,    93,   356,
     103,   100,   344,   347,   104,   306,   307,   308,   309,   310,
     311,   388,   180,   357,   218,   219,   393,   334,   324,   325,
     326,   327,   328,   329,   267,   181,   -78,   -78,   -78,   -78,
     -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,
     -78,   -78,    55,   171,   172,   173,   184,   174,   175,   504,
     424,   187,   188,   205,   189,   321,   507,   206,    23,    24,
      25,    26,    27,    28,    29,    30,    31,   336,   218,   219,
     337,   129,   338,   456,   222,   457,    94,    95,    96,    97,
     223,   425,   239,   340,   193,   415,   418,   421,   242,   241,
     243,   200,   -78,   262,   276,   471,   472,   473,   277,   263,
     168,   278,   475,   282,   364,   193,    23,    24,    25,    26,
      27,    28,    29,    30,    31,   361,   290,   286,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    23,    24,    25,    26,    27,    28,    29,    30,    31,
     124,   291,   168,   191,   495,   292,   293,   394,   395,   396,
     397,   398,   399,   400,   296,   298,   297,   301,     5,     6,
       7,     8,   410,   411,   412,   413,     9,   300,   360,   333,
      10,   370,   200,   368,   371,   422,   423,   426,   427,   428,
     429,   430,   431,   432,   433,   434,   435,   436,   437,   438,
     439,   372,   375,   378,   401,   402,   168,   403,   404,   405,
     406,   407,   408,   458,   486,   489,   492,   218,   219,   267,
     494,   506,   459,   466,    23,    24,    25,    26,    27,    28,
      29,    30,    31,   193,   193,   193,   191,   467,   468,  -195,
     469,   470,   474,   440,   493,   441,   442,   443,   444,   445,
     446,   447,   448,   476,   477,   478,   479,   480,   481,   482,
     483,   484,   496,   107,   205,   194,   497,   505,   508,   511,
     512,    43,   108,   109,    54,    84,    92,   110,    10,   111,
     112,   354,   460,   113,   385,   114,   509,   115,   510,   116,
     195,   190,   462,   461,   117,   376,   119,    24,    25,    26,
      27,   120,   121,   122,   123,   124,   390,   183,   125,   126,
     127,   128,   119,    24,    25,    26,    27,    28,    29,    30,
      31,   348,   349,   350,   210,   126,   127,   128,    23,    24,
      25,    26,    27,    28,    29,    30,    31,   207,   208,   209,
     210,   126,   127,   128,   237,   168,     0,   379,     0,   193,
     182,     0,     0,     0,     0,     0,     0,   340,     0,     0,
       0,     0,     0,     0,     0,   129,   426,   427,   428,   429,
     430,   431,   432,   433,   434,   435,   436,   437,   438,   439,
       0,     0,     0,     0,     0,   351,   352,   353,     0,     0,
       0,     0,     0,     0,   200,     0,     0,     0,   244,   245,
     246,   247,   248,   249,   250,   251,   252,   253,   254,   255,
     256,   257,    23,    24,    25,    26,    27,    28,    29,    30,
      31,    32,   440,     0,   441,   442,   443,   444,   445,   446,
     447,   448,   258,  -154,  -154,  -154,  -154,  -154,  -154,  -154,
    -154,  -154,  -154,  -154,  -154,  -154,  -154,  -154,  -154,  -155,
    -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,  -155,  -155,  -155,   224,   225,   226,   227,   228,
     229,   230,   231,   232,   233,   234,   235,   196,   126,   127,
     128,    23,    24,    25,    26,    27,    28,    29,    30,    31,
     268,   208,   209,   196,   126,   127,   128,    23,    24,    25,
      26,    27,    28,    29,    30,    31,   207,   208,   209,   196,
     126,   127,   128,    23,    24,    25,    26,    27,    28,    29,
      30,    31,     0,   342,   343,   196,   126,   127,   128,    23,
      24,    25,    26,    27,    28,    29,    30,    31,     0,   345,
     346,   196,   126,   127,   128,    23,    24,    25,    26,    27,
      28,    29,    30,    31,     0,   416,   417,   196,   126,   127,
     128,    23,    24,    25,    26,    27,    28,    29,    30,    31,
       0,   419,   420,   196,   126,   127,   128,    23,    24,    25,
      26,    27,    28,    29,    30,    31,     0,   487,   488,   196,
     126,   127,   128,    23,    24,    25,    26,    27,    28,    29,
      30,    31,     0,   490,   491,   196,   126,   127,   128,    23,
      24,    25,    26,    27,    28,    29,    30,    31,   414,     0,
       0,   196,   126,   127,   128,    23,    24,    25,    26,    27,
      28,    29,    30,    31,   485,     0,     0,   196,   126,   127,
     128,    23,    24,    25,    26,    27,    28,    29,    30,    31,
       0,     0,     0,   196,   126,   127,   128,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    23,    24,    25,    26,
      27,    28,    29,    30,   409
};

static const yytype_int16 yycheck[] =
{
       8,   137,   137,   172,   112,   298,   300,   102,   117,   125,
       3,   474,     3,   234,   235,     0,    11,   238,   349,   350,
     102,   137,    42,   118,    43,    13,   357,   122,     3,    37,
      38,    39,    40,    42,   129,    30,   118,    43,   102,   502,
      28,    43,     1,    31,    93,   153,    95,   142,   101,   102,
     100,    10,    11,   169,   118,     3,    15,    16,    17,    18,
     354,    99,    21,   278,    23,   200,    25,   282,    27,    43,
      78,   286,    43,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,   105,   101,    46,    47,    48,
      49,    99,   102,    44,   102,   100,   105,   100,   103,    99,
     103,   106,   218,   106,    35,    36,    37,    38,   100,   117,
     118,   103,   105,    99,   106,   123,    99,    92,    93,    94,
      99,    96,    97,    98,   259,    67,    68,   263,    45,   137,
     103,   103,    43,   242,    34,    35,    36,    37,    38,    39,
      40,    41,    42,     9,   103,     3,   262,    43,    43,   258,
     104,     8,   247,   248,   104,   225,   226,   227,   228,   229,
     230,   296,     3,   258,   300,   300,   301,   237,    51,    52,
      53,    54,    55,    56,   182,    43,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,     3,    92,    93,    94,   103,    96,    97,   493,
     335,     3,     3,   298,     3,   105,   499,     3,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,   354,   354,
      46,   103,    48,   358,     3,   360,    35,    36,    37,    38,
       3,   339,     3,   241,   242,   330,   331,   332,    99,   106,
       3,   100,   100,   103,     3,   381,   382,   383,     3,   105,
     258,    19,   387,    20,   262,   263,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,     3,    29,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,     3,   300,    46,   463,     3,     3,   305,   306,   307,
     308,   309,   310,   311,    99,   105,   104,    99,     4,     5,
       6,     7,   320,   321,   322,   323,    12,   105,    99,    42,
      16,    50,   100,    92,   104,   333,   334,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,   105,    22,    24,    42,    42,   354,    42,    42,    42,
      42,    42,    42,   104,   449,   450,   451,   493,   493,   367,
     455,   497,     3,     3,    34,    35,    36,    37,    38,    39,
      40,    41,    42,   381,   382,   383,    46,     3,     3,   103,
       3,     3,     3,   107,   105,   109,   110,   111,   112,   113,
     114,   115,   116,   401,   402,   403,   404,   405,   406,   407,
     408,   409,     3,     1,   499,     3,   105,    14,    26,     3,
       3,    11,    10,    11,    42,    72,    78,    15,    16,    17,
      18,   258,   367,    21,   288,    23,   502,    25,   505,    27,
     118,   116,   372,   370,    32,   280,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,   299,   110,    46,    47,
      48,    49,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,   142,   493,    -1,   284,    -1,   497,
     109,    -1,    -1,    -1,    -1,    -1,    -1,   505,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   103,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      -1,    -1,    -1,    -1,    -1,   107,   108,   109,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,   107,    -1,   109,   110,   111,   112,   113,   114,
     115,   116,    99,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    -1,    44,    45,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    -1,    44,
      45,    46,    47,    48,    49,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    -1,    44,    45,    46,    47,    48,
      49,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      -1,    44,    45,    46,    47,    48,    49,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    -1,    44,    45,    46,
      47,    48,    49,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    -1,    44,    45,    46,    47,    48,    49,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    -1,
      -1,    46,    47,    48,    49,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    -1,    -1,    46,    47,    48,
      49,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      -1,    -1,    -1,    46,    47,    48,    49,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    34,    35,    36,    37,
      38,    39,    40,    41,    42
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,   118,   119,     0,     4,     5,     6,     7,    12,
      16,   120,   121,   122,   123,   124,   125,   129,   130,   226,
      43,    43,    43,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,   131,   235,   236,   100,    35,    36,    37,
      38,   228,     3,   119,   132,    99,    43,   126,   127,   128,
     235,   235,   235,   235,   121,     3,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,   133,
      43,   101,   102,    99,    99,    99,    99,   135,   103,   103,
     222,   223,   223,   223,   128,    44,    45,    43,    43,     9,
     136,   141,   131,    43,    35,    36,    37,    38,   137,   232,
       8,   142,   143,   104,   104,   138,   235,     1,    10,    11,
      15,    17,    18,    21,    23,    25,    27,    32,    33,    34,
      39,    40,    41,    42,    43,    46,    47,    48,    49,   103,
     144,   145,   146,   147,   148,   149,   150,   151,   160,   163,
     165,   166,   168,   170,   171,   176,   177,   178,   187,   188,
     189,   190,   191,   192,   194,   195,   201,   202,   203,   204,
     212,   213,   224,   225,   226,   227,   233,   234,   235,   236,
       3,    92,    93,    94,    96,    97,    98,   139,   140,   200,
       3,    43,   232,   228,   103,   205,   205,     3,     3,     3,
     195,    46,   189,   235,     3,   145,    46,   233,   235,   235,
     100,   158,   196,   197,   198,   233,     3,    43,    44,    45,
      46,   152,   153,   154,   155,   156,   157,   158,   194,   229,
     230,   233,     3,     3,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,   167,   230,   233,     3,
     205,   106,    99,     3,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    99,   239,
     158,   222,   103,   105,   172,   173,   174,   235,    43,   206,
     207,   208,   209,   210,   211,   229,     3,     3,    19,   214,
     215,   216,    20,   217,   218,   219,    29,   179,   180,   181,
       3,     3,     3,     3,   159,   229,    99,   104,   105,   199,
     105,    99,   158,    42,   105,   169,   169,   169,   169,   169,
     169,   169,    34,    35,    36,    37,    38,    39,    40,    41,
      42,   105,    42,   105,    51,    52,    53,    54,    55,    56,
     231,   231,   231,    42,   169,   231,    43,    46,    48,   193,
     235,   189,    44,    45,   233,    44,    45,   233,    43,    44,
      45,   107,   108,   109,   151,   164,   189,   233,   237,   229,
      99,    43,   134,   158,   235,   194,     3,   105,    92,   175,
      50,   104,   105,   220,   210,    22,   216,   210,    24,   219,
     210,    13,    28,    31,   182,   181,   101,   102,   229,   198,
     200,   156,   158,   229,   235,   235,   235,   235,   235,   235,
     235,    42,    42,    42,    42,    42,    42,    42,    42,    42,
     235,   235,   235,   235,    43,   233,    44,    45,   233,    44,
      45,   233,   235,   235,   229,   205,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
     107,   109,   110,   111,   112,   113,   114,   115,   116,   238,
     238,   238,   156,   161,   162,   238,   229,   229,   104,     3,
     173,   211,   208,    93,    95,   221,     3,     3,     3,     3,
       3,   194,   194,   194,     3,   229,   235,   235,   235,   235,
     235,   235,   235,   235,   235,    43,   233,    44,    45,   233,
      44,    45,   233,   105,   233,   222,     3,   105,   183,    30,
     171,   184,   185,   186,   156,    14,   194,   198,    26,   186,
     193,     3,     3
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
#line 446 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 14:
#line 452 "pir.y"
    { set_hll((yyvsp[(2) - (2)].sval)); ;}
    break;

  case 15:
#line 456 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 16:
#line 460 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 17:
#line 464 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 18:
#line 466 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 19:
#line 470 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 20:
#line 472 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 21:
#line 476 "pir.y"
    { (yyval.expr) = expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 23:
#line 486 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 28:
#line 498 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 29:
#line 500 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 30:
#line 502 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 31:
#line 504 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 32:
#line 506 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 33:
#line 508 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 34:
#line 510 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 35:
#line 512 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 36:
#line 514 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 37:
#line 516 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 38:
#line 518 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 39:
#line 520 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 40:
#line 522 "pir.y"
    { set_sub_instanceof(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 47:
#line 538 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 48:
#line 542 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 49:
#line 544 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 52:
#line 552 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 55:
#line 562 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 57:
#line 567 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 58:
#line 569 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 73:
#line 590 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 74:
#line 600 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 75:
#line 604 "pir.y"
    { set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 78:
#line 614 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 79:
#line 618 "pir.y"
    { /* when this rule is activated, the initial identifier must
                           * be a parrot op. Check that, and if not, emit an error message.
                           */
                          char *instr = get_instr(lexer);
                          if (!is_parrot_op(instr))
                             yyerror(yyscanner, lexer, "'%s' is not a parrot instruction", instr);
                        ;}
    break;

  case 85:
#line 637 "pir.y"
    {
                         /* the "instruction" that was set now appears to be
                          * an identifier; get the name, and check its type.
                          */
                         char * const instr = get_instr(lexer);
                         symbol *sym = find_symbol(lexer, instr);
                         target *obj;

                         if (sym == NULL) {
                            yyerror(yyscanner, lexer,
                                    "indexed object '%s' not declared", instr);
                            sym = new_symbol(instr, PMC_TYPE);
                         }
                         else if (sym->type != PMC_TYPE)
                            yyerror(yyscanner, lexer,
                                    "indexed object '%s' must be of type 'pmc'",
                                    instr);

                         /* convert the symbol into a target */
                         obj = target_from_symbol(sym);

                         /* set the key on the target */
                         set_target_key(obj, (yyvsp[(1) - (3)].key));
                         /* indexed operation is a "set" opcode */
                         set_instrf(lexer, "set", "%T%E", obj, (yyvsp[(3) - (3)].expr));
                       ;}
    break;

  case 86:
#line 666 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 87:
#line 668 "pir.y"
    { push_operand(lexer, expr_from_key((yyvsp[(1) - (1)].key))); ;}
    break;

  case 88:
#line 670 "pir.y"
    { push_operand(lexer, expr_from_target((yyvsp[(1) - (1)].targ))); ;}
    break;

  case 89:
#line 674 "pir.y"
    {
                           if (TEST_FLAG((yyvsp[(1) - (2)].targ)->flags, TARGET_FLAG_IS_REG))
                               (yyval.targ) = (yyvsp[(1) - (2)].targ);
                           else {
                               symbol *sym = find_symbol(lexer, target_name((yyvsp[(1) - (2)].targ)));
                               if (sym == NULL)
                                   yyerror(yyscanner, lexer,
                                           "indexed object '%s' not declared",
                                           target_name((yyvsp[(1) - (2)].targ)));

                               else if (sym->type != PMC_TYPE)
                                   yyerror(yyscanner, lexer,
                                           "indexed object '%s' "
                                           "is not of type 'pmc'",
                                           target_name((yyvsp[(1) - (2)].targ)));

                               /* create a target node based on the symbol node;
                                * sym already has a PASM register, so through
                                * this the target will get that too.
                                */
                               (yyval.targ) = target_from_symbol(sym);
                           }
                           set_target_key((yyval.targ), (yyvsp[(2) - (2)].key));
                         ;}
    break;

  case 90:
#line 701 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 91:
#line 705 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 92:
#line 707 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 98:
#line 766 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 99:
#line 773 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                          else
                              set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 100:
#line 780 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 101:
#line 786 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 102:
#line 792 "pir.y"
    { set_instr(lexer, "set"); ;}
    break;

  case 103:
#line 794 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 104:
#line 796 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 105:
#line 805 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "inc", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "add", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 106:
#line 814 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].ival) == 1)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].ival) == 0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                        ;}
    break;

  case 107:
#line 823 "pir.y"
    {
                          if ((yyvsp[(3) - (3)].dval) == 1.0)
                              set_instrf(lexer, "dec", "%T", (yyvsp[(1) - (3)].targ));
                          else if ((yyvsp[(3) - (3)].dval) == 0.0)
                              set_instr(lexer, "noop");
                          else
                              set_instrf(lexer, "sub", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));
                        ;}
    break;

  case 108:
#line 832 "pir.y"
    { set_instrf(lexer, "add", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 109:
#line 834 "pir.y"
    { set_instrf(lexer, "sub", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 110:
#line 836 "pir.y"
    { set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 111:
#line 838 "pir.y"
    {
                          if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ)))
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                          else
                              set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));
                        ;}
    break;

  case 112:
#line 845 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (4)].sval));
                          target *t;

                          if (sym == NULL) {
                              yyerror(yyscanner, lexer, "indexed object '%s' not declared", (yyvsp[(1) - (4)].sval));
                              sym = new_symbol((yyvsp[(1) - (4)].sval), PMC_TYPE);
                          }
                          else if (sym->type != PMC_TYPE)
                              yyerror(yyscanner, lexer,
                                      "indexed object '%s' must be of type 'pmc'", (yyvsp[(1) - (4)].sval));

                          t = target_from_symbol(sym);
                          set_target_key(t, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", (yyvsp[(1) - (4)].sval), (yyvsp[(4) - (4)].expr));
                      ;}
    break;

  case 113:
#line 862 "pir.y"
    {
                          target *preg = reg(lexer, PMC_TYPE, (yyvsp[(1) - (4)].ival));
                          set_target_key(preg, (yyvsp[(2) - (4)].key));
                          set_instrf(lexer, "set", "%T%E", preg, (yyvsp[(4) - (4)].expr));
                        ;}
    break;

  case 114:
#line 895 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 115:
#line 897 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 116:
#line 899 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 117:
#line 901 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 118:
#line 903 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 119:
#line 905 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 120:
#line 907 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 121:
#line 909 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 123:
#line 932 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, (yyvsp[(3) - (5)].sval), (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 124:
#line 934 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "int", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 125:
#line 936 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "num", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 126:
#line 938 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "pmc", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 127:
#line 940 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "string", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 128:
#line 942 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "if", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 129:
#line 944 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "unless", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 130:
#line 946 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "goto", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 131:
#line 948 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (5)].ival), 1, "null", (yyvsp[(4) - (5)].sval)); ;}
    break;

  case 132:
#line 950 "pir.y"
    {
                          int istrue = evaluate_c((yyvsp[(2) - (4)].cval));
                          /* if "unless", invert the true-ness */
                          istrue = (yyvsp[(1) - (4)].ival) ? !istrue : istrue;
                          if (istrue)
                              set_instrf(lexer, "branch", "%I", (yyvsp[(4) - (4)].sval));
                          else
                              set_instr(lexer, "noop");
                        ;}
    break;

  case 133:
#line 960 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 134:
#line 962 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "int", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 135:
#line 964 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "num", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 136:
#line 966 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "pmc", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 137:
#line 968 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "string", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 138:
#line 970 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "if", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 139:
#line 972 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "unless", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 140:
#line 974 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 141:
#line 976 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "goto", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 142:
#line 978 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 143:
#line 980 "pir.y"
    { create_if_instr(yyscanner, lexer, (yyvsp[(1) - (4)].ival), 0, "null", (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 144:
#line 982 "pir.y"
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
                                set_instr(lexer, "noop");

                          }
                        ;}
    break;

  case 145:
#line 1008 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                          (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                        ;}
    break;

  case 146:
#line 1013 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 147:
#line 1018 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 148:
#line 1023 "pir.y"
    {
                          set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));
                          (yyval.ival) = -1;
                        ;}
    break;

  case 149:
#line 1028 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 150:
#line 1030 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 151:
#line 1032 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 152:
#line 1034 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 153:
#line 1036 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 154:
#line 1039 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 155:
#line 1040 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 158:
#line 1048 "pir.y"
    { set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 159:
#line 1052 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].symb)); ;}
    break;

  case 160:
#line 1056 "pir.y"
    { (yyval.symb) = (yyvsp[(1) - (1)].symb); ;}
    break;

  case 161:
#line 1058 "pir.y"
    { (yyval.symb) = add_local((yyvsp[(1) - (3)].symb), (yyvsp[(3) - (3)].symb)); ;}
    break;

  case 162:
#line 1062 "pir.y"
    { (yyval.symb) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 163:
#line 1066 "pir.y"
    {
                          symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                          if (sym)
                              yyerror(yyscanner, lexer, "symbol '%s' is already declared", (yyvsp[(1) - (1)].sval));
                          (yyval.sval) = (yyvsp[(1) - (1)].sval);
                        ;}
    break;

  case 164:
#line 1074 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 165:
#line 1075 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 166:
#line 1079 "pir.y"
    {
                          if (!TEST_FLAG((yyvsp[(4) - (5)].targ)->flags, TARGET_FLAG_IS_REG)) {
                              symbol *sym = find_symbol(lexer, target_name((yyvsp[(4) - (5)].targ)));
                              if (sym == NULL) {
                                  yyerror(yyscanner, lexer, "lexical '%s' is not declared",
                                          target_name((yyvsp[(4) - (5)].targ)));
                                  sym = new_symbol(target_name((yyvsp[(4) - (5)].targ)), PMC_TYPE);
                              }
                              else if (sym->type != PMC_TYPE)
                                  yyerror(yyscanner, lexer, "lexical '%s' must be of type 'pmc'",
                                          target_name((yyvsp[(4) - (5)].targ)));
                          }
                          set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                        ;}
    break;

  case 169:
#line 1107 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 170:
#line 1114 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 171:
#line 1116 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 172:
#line 1120 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 173:
#line 1122 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 174:
#line 1126 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 175:
#line 1130 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 176:
#line 1132 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 177:
#line 1135 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 178:
#line 1139 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 179:
#line 1141 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 180:
#line 1145 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 181:
#line 1147 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 182:
#line 1151 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 183:
#line 1153 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 184:
#line 1157 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 185:
#line 1159 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 187:
#line 1167 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 188:
#line 1169 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 189:
#line 1171 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 192:
#line 1179 "pir.y"
    {
                             if (!TEST_FLAG((yyvsp[(1) - (4)].targ)->flags, TARGET_FLAG_IS_REG)) {
                                 symbol *sym = find_symbol(lexer, target_name((yyvsp[(1) - (4)].targ)));
                                 if (sym == NULL)
                                     yyerror(yyscanner, lexer,
                                             "object '%s' not declared",
                                             target_name((yyvsp[(1) - (4)].targ)));

                                 else if (sym->type != PMC_TYPE)
                                     yyerror(yyscanner, lexer,
                                             "cannot invoke method: '%s' is not of type 'pmc'",
                                             target_name((yyvsp[(1) - (4)].targ)));
                             }

                             (yyval.invo) = invoke(lexer, CALL_METHOD, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                             set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                           ;}
    break;

  case 193:
#line 1199 "pir.y"
    {
                             (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                             set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                           ;}
    break;

  case 194:
#line 1206 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 195:
#line 1208 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 196:
#line 1212 "pir.y"
    { /* check that this identifier was declared */
                             symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));

                             if (sym == NULL) {
                                yyerror(yyscanner, lexer,
                                        "method identifier '%s' not declared",
                                        (yyvsp[(1) - (1)].sval));
                                /* make sure sym is not NULL; use a valid type to prevent
                                 * a type error below.
                                 */
                                sym = new_symbol((yyvsp[(1) - (1)].sval), PMC_TYPE);
                             }
                             if (sym->type != PMC_TYPE && sym->type != STRING_TYPE)
                                 yyerror(yyscanner, lexer,
                                         "method '%s' must be of type 'pmc' or 'string'", (yyvsp[(1) - (1)].sval));

                             (yyval.targ) = target_from_symbol(sym);
                           ;}
    break;

  case 197:
#line 1231 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 198:
#line 1233 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 199:
#line 1235 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 200:
#line 1239 "pir.y"
    { (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 201:
#line 1241 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 202:
#line 1246 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 203:
#line 1250 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 204:
#line 1252 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 205:
#line 1256 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 206:
#line 1258 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 207:
#line 1262 "pir.y"
    { (yyval.targ) = set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 208:
#line 1266 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 209:
#line 1268 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 210:
#line 1272 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 211:
#line 1274 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 212:
#line 1276 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 213:
#line 1278 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 214:
#line 1280 "pir.y"
    {
                             (yyval.ival) = TARGET_FLAG_NAMED;
                             set_param_alias(lexer, (yyvsp[(2) - (2)].sval));
                           ;}
    break;

  case 219:
#line 1298 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 220:
#line 1303 "pir.y"
    { /* was the invocation a method call? then it becomes a method tail call,
                               * otherwise it's just a normal (sub) tail call.
                               */
                              set_invocation_type((yyvsp[(2) - (3)].invo), ((yyvsp[(2) - (3)].invo)->type == CALL_METHOD)
                                                      ? CALL_METHOD_TAILCALL
                                                      : CALL_TAILCALL);
                            ;}
    break;

  case 221:
#line 1313 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 222:
#line 1320 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 223:
#line 1324 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 224:
#line 1326 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 225:
#line 1330 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 226:
#line 1332 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 229:
#line 1340 "pir.y"
    { (yyval.argm) = set_arg_alias(lexer, (yyvsp[(1) - (3)].sval)); ;}
    break;

  case 230:
#line 1344 "pir.y"
    { (yyval.argm) = set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 231:
#line 1348 "pir.y"
    { (yyval.argm) = set_curarg(lexer, new_argument((yyvsp[(1) - (1)].expr)));  ;}
    break;

  case 232:
#line 1354 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RETURN);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 233:
#line 1363 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 234:
#line 1370 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 235:
#line 1372 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 236:
#line 1377 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 237:
#line 1379 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 238:
#line 1384 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 239:
#line 1388 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 240:
#line 1390 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 241:
#line 1394 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 242:
#line 1396 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 243:
#line 1400 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 244:
#line 1405 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 245:
#line 1407 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 246:
#line 1411 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 247:
#line 1413 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               set_arg_alias(lexer, (yyvsp[(2) - (2)].sval));
                             ;}
    break;

  case 248:
#line 1420 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 249:
#line 1422 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 250:
#line 1426 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 254:
#line 1437 "pir.y"
    { store_global_const(lexer, (yyvsp[(2) - (2)].cval)); ;}
    break;

  case 255:
#line 1441 "pir.y"
    { /* XXX is .globalconst to be kept? */ ;}
    break;

  case 256:
#line 1445 "pir.y"
    { (yyval.cval) = new_named_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 257:
#line 1447 "pir.y"
    { (yyval.cval) = new_named_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 258:
#line 1449 "pir.y"
    { (yyval.cval) = new_named_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 259:
#line 1451 "pir.y"
    { (yyval.cval) = new_named_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 260:
#line 1467 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 261:
#line 1468 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].cval)); ;}
    break;

  case 262:
#line 1472 "pir.y"
    { (yyval.cval) = new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 263:
#line 1473 "pir.y"
    { (yyval.cval) = new_const(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 264:
#line 1474 "pir.y"
    { (yyval.cval) = new_const(NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 265:
#line 1477 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 266:
#line 1478 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 267:
#line 1479 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 268:
#line 1480 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 269:
#line 1481 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 270:
#line 1482 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 271:
#line 1485 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 272:
#line 1486 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 273:
#line 1487 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 274:
#line 1488 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 275:
#line 1496 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 276:
#line 1499 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 277:
#line 1500 "pir.y"
    { (yyval.targ) = reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 278:
#line 1501 "pir.y"
    { (yyval.targ) = reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 279:
#line 1502 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 280:
#line 1503 "pir.y"
    { /* a symbol must have been declared; check that at this point. */
                           symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                           if (sym == NULL) {
                               yyerror(yyscanner, lexer,
                                       "symbol '%s' not declared", (yyvsp[(1) - (1)].sval));

                               /* make sure sym is not NULL */
                               sym = new_symbol((yyvsp[(1) - (1)].sval), UNKNOWN_TYPE);
                           }
                           (yyval.targ) = target_from_symbol(sym);

                         ;}
    break;

  case 283:
#line 1522 "pir.y"
    { (yyval.sval) = "if"; ;}
    break;

  case 284:
#line 1523 "pir.y"
    { (yyval.sval) = "unless"; ;}
    break;

  case 285:
#line 1524 "pir.y"
    { (yyval.sval) = "goto"; ;}
    break;

  case 286:
#line 1525 "pir.y"
    { (yyval.sval) = "int"; ;}
    break;

  case 287:
#line 1526 "pir.y"
    { (yyval.sval) = "num"; ;}
    break;

  case 288:
#line 1527 "pir.y"
    { (yyval.sval) = "string"; ;}
    break;

  case 289:
#line 1528 "pir.y"
    { (yyval.sval) = "pmc"; ;}
    break;

  case 290:
#line 1529 "pir.y"
    { (yyval.sval) = "null"; ;}
    break;

  case 291:
#line 1532 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 292:
#line 1533 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 293:
#line 1534 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 294:
#line 1537 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 295:
#line 1538 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 296:
#line 1539 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 297:
#line 1540 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 298:
#line 1541 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 299:
#line 1542 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 300:
#line 1543 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 301:
#line 1544 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 302:
#line 1545 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 303:
#line 1546 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 304:
#line 1547 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 305:
#line 1548 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 306:
#line 1549 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 307:
#line 1550 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 308:
#line 1551 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 309:
#line 1552 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 310:
#line 1553 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 311:
#line 1554 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 312:
#line 1555 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 313:
#line 1556 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 314:
#line 1557 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 315:
#line 1558 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 316:
#line 1559 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 317:
#line 1565 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 318:
#line 1566 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 319:
#line 1567 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 320:
#line 1568 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 321:
#line 1569 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 322:
#line 1570 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 323:
#line 1571 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 324:
#line 1572 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 325:
#line 1573 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 326:
#line 1574 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 327:
#line 1575 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 328:
#line 1576 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3846 "pirparser.c"
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


#line 1579 "pir.y"


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
evaluate_s(char * const s)>

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

=item C<static int
evaluate_c(constant * const c)>

Evaluate a constant node in boolean context; if the constant is numeric,
it must be non-zero to be true; if it's a string, C<evaluate_s> is invoked
to evaluate the string.

=cut

*/
static int
evaluate_c(constant * const c) {
    switch (c->type) {
        case INT_TYPE:
            return (c->val.ival != 0);
        case NUM_TYPE:
            return (c->val.nval != 0);
        case STRING_TYPE:
            return evaluate_s(c->val.sval);
        case PMC_TYPE:
        case UNKNOWN_TYPE:
            printf("impossible constant type");
            break;
    }
    return 0; /* keep compiler happy; will never happen. */
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

=item C<static int
is_parrot_op(char const * const spelling)>

=cut

*/
static int
is_parrot_op(char const * const spelling)
{
    /* only these are currently recognized as a Parrot instruction */
    char const * ops[] = {
        "print",
        "new",
        "newclass",
        "end",
        "set",
        "find_global",
        "set_hll_global",
        "get_hll_global",
        "setfile",
        "setline",
        "add",
        "sub",
        NULL
    };


    char const **iter = ops;

    while (*iter != NULL) {
        if (strcmp(spelling, *iter) == 0)
            return 1;
        iter++;
    }

    return 0;
}


/*

=item C<static void
create_if_instr(yyscan_t yyscanner, lexer_state *lexer, int invert, int hasnull,
                char * const name,
                char * const label)>

Create an C<if> or C<unless> instruction; if C<invert> is non-zero (true), the
C<if> instruction is inverted, effectively becoming C<unless>.

If C<hasnull> is non-zero (true), the C<if> instruction becomes C<if_null>; again,
if C<invert> is non-zero, the instruction becomes C<unless_null>.

C<name> is the name of the variable that is checked during this instruction

=cut

*/
static void
create_if_instr(yyscan_t yyscanner, lexer_state * const lexer, int invert, int hasnull,
                char * const name,
                char * const label)
{
    /* try to find the symbol; if it was declared it will be found; otherwise emit an error. */
    symbol *sym = find_symbol(lexer, name);
    if (sym == NULL) {
        sym = new_symbol(name, UNKNOWN_TYPE);
        yyerror(yyscanner, lexer, "symbol not declared'");
    }
    /* if there was a keyword "null", use the if/unless_null instruction variants. */
    if (hasnull)
        set_instrf(lexer, invert ? "unless_null" : "if_null", "%T%I", target_from_symbol(sym),
                   label);
    else
        set_instrf(lexer, invert ? "unless" : "if", "%T%I", target_from_symbol(sym), label);
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


