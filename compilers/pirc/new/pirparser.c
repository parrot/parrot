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
     PARROT_SET = 286,
     PARROT_ADD = 287,
     PARROT_SUB = 288,
     PARROT_MUL = 289,
     PARROT_DIV = 290,
     PARROT_FDIV = 291,
     TK_IDENT = 292,
     TK_STRINGC = 293,
     TK_INTC = 294,
     TK_NUMC = 295,
     TK_PREG = 296,
     TK_NREG = 297,
     TK_SREG = 298,
     TK_IREG = 299,
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
#define PARROT_SET 286
#define PARROT_ADD 287
#define PARROT_SUB 288
#define PARROT_MUL 289
#define PARROT_DIV 290
#define PARROT_FDIV 291
#define TK_IDENT 292
#define TK_STRINGC 293
#define TK_INTC 294
#define TK_NUMC 295
#define TK_PREG 296
#define TK_NREG 297
#define TK_SREG 298
#define TK_IREG 299
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
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*

=head1 NAME

pir.y

=head1 DESCRIPTION

This is a complete rewrite of the parser for the PIR language.

Features are:

=over 4

=item * constant folding is implemented in the parser

This increases the number of grammar rules quite a bit, but no special optimization
code is necessary anymore in the back-end. The selection of the cases is semi-automatic,
using the parser's mechanism of selecting the rules, and custom code to make the final
decisions. The code can probably be refactored quite a bit.

=back

TODO:
1. [done 9/8/8] fix argument stuff related to the :named flag.
2. [done 9/8/8] fix parameter stuff
3. clean up back-end a bit (refactor?)
4. improve memory management (free it!)
5. test
LATER:
6. write register allocator(s)
7. generate PBC

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
    /* note that from here on it's rel. ops */
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
static int evaluate_s_s(char *a, pir_rel_operator op, char *b);
static int evaluate_s(char *s);
static char *concat_strings(char *a, char *b);


extern int yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message);
extern void syntax_error(yyscan_t yyscanner, char const * const message);

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
#line 186 "pir.y"
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
    struct key         *key;

    void               *fixme;
}
/* Line 187 of yacc.c.  */
#line 498 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 511 "pirparser.c"

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
#define YYLAST   629

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  120
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  125
/* YYNRULES -- Number of rules.  */
#define YYNRULES  342
/* YYNRULES -- Number of states.  */
#define YYNSTATES  497

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
     106,   107,   115,   113,   108,   110,   109,   114,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   105,
       2,   102,     2,     2,     2,     2,     2,     2,     2,     2,
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
      22,    24,    26,    28,    31,    34,    39,    44,    45,    47,
      49,    53,    60,    63,    65,    67,    68,    71,    73,    75,
      77,    79,    81,    83,    85,    87,    89,    91,    96,    99,
     102,   104,   106,   108,   110,   112,   113,   116,   121,   124,
     125,   128,   130,   132,   137,   138,   141,   142,   145,   148,
     151,   153,   155,   157,   159,   161,   163,   165,   167,   169,
     171,   173,   175,   177,   179,   181,   184,   187,   190,   194,
     198,   201,   204,   206,   207,   209,   211,   215,   217,   219,
     221,   224,   228,   230,   234,   237,   239,   243,   247,   251,
     255,   258,   263,   267,   273,   279,   285,   291,   295,   299,
     303,   306,   309,   312,   315,   319,   323,   327,   331,   335,
     339,   343,   347,   352,   357,   362,   367,   372,   377,   382,
     387,   392,   397,   402,   405,   410,   417,   422,   429,   436,
     443,   450,   457,   464,   471,   478,   485,   492,   499,   504,
     509,   516,   523,   530,   537,   539,   541,   543,   545,   547,
     550,   556,   561,   566,   570,   574,   578,   582,   586,   590,
     594,   598,   602,   604,   606,   608,   610,   612,   614,   616,
     620,   625,   627,   631,   634,   635,   637,   643,   645,   647,
     656,   657,   659,   661,   664,   668,   672,   675,   681,   682,
     685,   686,   688,   690,   693,   697,   699,   702,   706,   710,
     712,   714,   716,   721,   724,   726,   728,   730,   732,   734,
     736,   738,   740,   744,   745,   747,   749,   753,   756,   757,
     760,   762,   764,   766,   768,   771,   773,   775,   777,   779,
     783,   787,   791,   795,   796,   798,   800,   804,   806,   808,
     812,   815,   817,   823,   829,   830,   832,   834,   837,   841,
     842,   844,   846,   849,   853,   854,   857,   859,   862,   863,
     865,   869,   872,   874,   876,   879,   882,   887,   892,   897,
     902,   904,   906,   908,   910,   912,   914,   916,   918,   920,
     922,   924,   926,   928,   930,   932,   934,   936,   938,   940,
     942,   944,   946,   948,   950,   952,   954,   956,   958,   960,
     962,   964,   966,   968,   970,   972,   974,   976,   978,   980,
     982,   984,   986,   988,   990,   992,   994,   996,   998,  1000,
    1002,  1004,  1006,  1008,  1010,  1012,  1014,  1016,  1018,  1020,
    1022,  1024,  1026
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     121,     0,    -1,   122,   123,   122,    -1,    -1,     4,    -1,
     124,    -1,   123,     4,   124,    -1,   131,    -1,   231,    -1,
     128,    -1,   126,    -1,   127,    -1,   125,    -1,     7,    38,
      -1,     5,    38,    -1,     6,    38,   102,    38,    -1,    13,
     103,   129,   104,    -1,    -1,   130,    -1,    38,    -1,   130,
     105,    38,    -1,   132,   134,     4,   138,   144,     9,    -1,
       8,   133,    -1,   240,    -1,    38,    -1,    -1,   134,   135,
      -1,    86,    -1,    83,    -1,    84,    -1,    85,    -1,    87,
      -1,    90,    -1,    92,    -1,    93,    -1,    91,    -1,   136,
      -1,    88,   106,   133,   107,    -1,    89,   227,    -1,    94,
     228,    -1,    37,    -1,    45,    -1,    38,    -1,   160,    -1,
     237,    -1,    -1,   138,   139,    -1,    10,   140,   141,     4,
      -1,   237,   240,    -1,    -1,   141,   142,    -1,   205,    -1,
     143,    -1,   101,   106,   137,   107,    -1,    -1,   144,   145,
      -1,    -1,   146,   147,    -1,     3,     4,    -1,     3,   148,
      -1,   148,    -1,   170,    -1,   175,    -1,   176,    -1,   180,
      -1,   229,    -1,   206,    -1,   207,    -1,   181,    -1,   162,
      -1,   153,    -1,   152,    -1,   150,    -1,   167,    -1,   149,
      -1,     1,     4,    -1,   151,     4,    -1,    52,   238,    -1,
     238,   102,    52,    -1,    26,   200,     4,    -1,   154,     4,
      -1,   155,   156,    -1,    45,    -1,    -1,   157,    -1,   158,
      -1,   157,   108,   158,    -1,   234,    -1,   160,    -1,   159,
      -1,   238,   160,    -1,   103,   161,   104,    -1,   234,    -1,
     161,   105,   234,    -1,   163,     4,    -1,   166,    -1,   238,
     102,    39,    -1,   238,   102,    40,    -1,   238,   102,    38,
      -1,   238,   102,   238,    -1,   238,   164,    -1,   238,   102,
     241,   234,    -1,   238,   102,   165,    -1,   238,   102,   238,
     242,    39,    -1,   238,   102,   238,   242,    40,    -1,   238,
     102,   238,   242,    38,    -1,   238,   102,   238,   242,   238,
      -1,   159,   102,   234,    -1,   238,   102,   159,    -1,   238,
     102,   154,    -1,   244,    39,    -1,   244,    40,    -1,   244,
     238,    -1,   243,   234,    -1,    39,   242,   238,    -1,    40,
     242,   238,    -1,    38,   242,   238,    -1,    38,   242,    38,
      -1,    39,   242,    39,    -1,    40,   242,    40,    -1,    39,
     242,    40,    -1,    40,   242,    39,    -1,    31,   238,   108,
     159,    -1,    31,   159,   108,   234,    -1,    31,   238,   108,
     238,    -1,    31,   238,   108,    39,    -1,    31,   238,   108,
      40,    -1,    31,   238,   108,    38,    -1,   238,   102,    31,
      39,    -1,   238,   102,    31,    40,    -1,   238,   102,    31,
      38,    -1,   238,   102,    31,   159,    -1,   238,   102,    31,
     238,    -1,   168,     4,    -1,   169,   238,   108,    39,    -1,
     169,   238,   108,    39,   108,    39,    -1,   169,   238,   108,
      40,    -1,   169,   238,   108,    39,   108,    40,    -1,   169,
     238,   108,    40,   108,    40,    -1,   169,   238,   108,    40,
     108,    39,    -1,   169,   238,   108,    39,   108,   238,    -1,
     169,   238,   108,    40,   108,   238,    -1,   169,   238,   108,
     238,   108,   238,    -1,   169,   238,   108,   238,   108,    40,
      -1,   169,   238,   108,   238,   108,    39,    -1,   238,   102,
     169,   238,   108,   238,    -1,   238,   102,   169,    39,   108,
      39,    -1,   238,   102,   169,    39,   108,    40,    -1,   238,
     102,   169,    39,    -1,   238,   102,   169,    40,    -1,   238,
     102,   169,    40,   108,    39,    -1,   238,   102,   169,    40,
     108,    40,    -1,   238,   102,   169,    40,   108,   238,    -1,
     238,   102,   169,   238,   108,    40,    -1,    32,    -1,    33,
      -1,    34,    -1,    35,    -1,    36,    -1,   171,     4,    -1,
     173,    52,   234,    53,   240,    -1,   173,   238,   174,   240,
      -1,   173,   172,    53,   240,    -1,   238,   236,   234,    -1,
      39,   236,   238,    -1,    40,   236,   238,    -1,    38,   236,
     238,    -1,    39,   236,    39,    -1,    40,   236,    40,    -1,
      39,   236,    40,    -1,    40,   236,    39,    -1,    38,   236,
      38,    -1,    39,    -1,    40,    -1,    38,    -1,    50,    -1,
      51,    -1,    53,    -1,   108,    -1,    53,   240,     4,    -1,
      12,   237,   177,     4,    -1,   178,    -1,   177,   108,   178,
      -1,   240,   179,    -1,    -1,    95,    -1,    11,    38,   108,
     238,     4,    -1,   182,    -1,   191,    -1,    24,     4,   183,
     186,     4,   188,    25,     4,    -1,    -1,   184,    -1,   185,
      -1,   184,   185,    -1,    28,   215,     4,    -1,    27,   198,
     187,    -1,    30,   198,    -1,    14,   198,     4,    15,   197,
      -1,    -1,   108,   198,    -1,    -1,   189,    -1,   190,    -1,
     189,   190,    -1,    29,   203,     4,    -1,   176,    -1,   192,
       4,    -1,   200,   102,   193,    -1,   238,   102,   193,    -1,
     193,    -1,   195,    -1,   194,    -1,   198,   109,   197,   210,
      -1,   196,   210,    -1,   198,    -1,    38,    -1,   198,    -1,
     199,    -1,   240,    -1,    41,    -1,    38,    -1,    43,    -1,
     106,   201,   107,    -1,    -1,   202,    -1,   203,    -1,   202,
     108,   203,    -1,   238,   204,    -1,    -1,   204,   205,    -1,
      99,    -1,   100,    -1,    97,    -1,    95,    -1,    96,   227,
      -1,   208,    -1,   217,    -1,   209,    -1,   218,    -1,    18,
     210,     4,    -1,    18,   193,     4,    -1,    19,   210,     4,
      -1,   106,   211,   107,    -1,    -1,   212,    -1,   213,    -1,
     212,   108,   213,    -1,   215,    -1,   214,    -1,    38,    54,
     216,    -1,   216,   225,    -1,   234,    -1,    22,     4,   222,
      23,     4,    -1,    20,     4,   219,    21,     4,    -1,    -1,
     220,    -1,   221,    -1,   220,   221,    -1,    19,   215,     4,
      -1,    -1,   223,    -1,   224,    -1,   223,   224,    -1,    18,
     215,     4,    -1,    -1,   225,   226,    -1,    98,    -1,    96,
     227,    -1,    -1,   228,    -1,   106,    38,   107,    -1,   230,
       4,    -1,   231,    -1,   232,    -1,    17,   233,    -1,    16,
     233,    -1,    46,   240,   102,    39,    -1,    47,   240,   102,
      40,    -1,    48,   240,   102,    38,    -1,    49,   240,   102,
      38,    -1,   238,    -1,   235,    -1,    38,    -1,    39,    -1,
      40,    -1,    55,    -1,    56,    -1,    57,    -1,    58,    -1,
      60,    -1,    59,    -1,    46,    -1,    47,    -1,    48,    -1,
      49,    -1,   239,    -1,    41,    -1,    42,    -1,    44,    -1,
      43,    -1,    37,    -1,    37,    -1,    45,    -1,   110,    -1,
     111,    -1,   112,    -1,   113,    -1,   110,    -1,   114,    -1,
     115,    -1,   116,    -1,   117,    -1,   118,    -1,   112,    -1,
     119,    -1,    68,    -1,    61,    -1,    62,    -1,    63,    -1,
      65,    -1,    66,    -1,    64,    -1,    67,    -1,    56,    -1,
      58,    -1,    57,    -1,    60,    -1,    59,    -1,    55,    -1,
      74,    -1,    75,    -1,    76,    -1,    77,    -1,    80,    -1,
      78,    -1,    79,    -1,    81,    -1,    82,    -1,    70,    -1,
      71,    -1,    69,    -1,    72,    -1,    73,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   444,   444,   449,   450,   453,   454,   457,   458,   459,
     460,   461,   462,   465,   471,   475,   482,   487,   488,   492,
     494,   501,   507,   511,   512,   516,   517,   521,   523,   525,
     527,   529,   531,   533,   535,   537,   539,   542,   547,   552,
     559,   560,   561,   562,   563,   566,   567,   570,   573,   578,
     579,   583,   584,   587,   593,   594,   597,   597,   601,   603,
     605,   608,   609,   610,   611,   612,   613,   614,   615,   616,
     617,   618,   619,   620,   621,   625,   634,   637,   642,   649,
     656,   659,   662,   666,   667,   670,   672,   676,   678,   680,
     684,   691,   695,   697,   702,   705,   706,   718,   730,   736,
     745,   747,   752,   754,   795,   852,   865,   875,   880,   885,
     889,   903,   908,   913,   931,   937,   943,   949,   954,   959,
     964,   969,  1000,  1005,  1010,  1020,  1031,  1044,  1050,  1063,
    1076,  1082,  1087,  1100,  1126,  1147,  1155,  1187,  1193,  1199,
    1205,  1240,  1260,  1273,  1305,  1360,  1371,  1377,  1383,  1405,
    1421,  1428,  1435,  1454,  1483,  1484,  1485,  1486,  1487,  1491,
    1494,  1499,  1504,  1532,  1538,  1546,  1554,  1562,  1564,  1566,
    1568,  1570,  1572,  1574,  1576,  1580,  1581,  1584,  1585,  1588,
    1595,  1599,  1601,  1605,  1609,  1610,  1613,  1626,  1627,  1630,
    1642,  1643,  1647,  1649,  1653,  1657,  1659,  1661,  1667,  1668,
    1673,  1674,  1678,  1680,  1684,  1686,  1690,  1694,  1696,  1698,
    1702,  1703,  1706,  1713,  1720,  1722,  1726,  1727,  1730,  1746,
    1750,  1752,  1757,  1762,  1763,  1767,  1769,  1773,  1781,  1782,
    1786,  1788,  1790,  1792,  1794,  1804,  1805,  1808,  1809,  1812,
    1817,  1821,  1828,  1833,  1834,  1838,  1840,  1844,  1845,  1848,
    1856,  1863,  1867,  1876,  1886,  1887,  1892,  1894,  1899,  1904,
    1905,  1909,  1911,  1915,  1921,  1922,  1926,  1928,  1936,  1937,
    1941,  1945,  1948,  1949,  1952,  1956,  1960,  1962,  1964,  1966,
    1975,  1976,  1979,  1980,  1981,  1984,  1985,  1986,  1987,  1988,
    1989,  1992,  1993,  1994,  1995,  2000,  2003,  2004,  2005,  2006,
    2007,  2016,  2017,  2020,  2021,  2022,  2025,  2026,  2027,  2028,
    2029,  2030,  2031,  2032,  2033,  2034,  2035,  2036,  2037,  2038,
    2039,  2040,  2041,  2042,  2043,  2044,  2045,  2046,  2047,  2053,
    2054,  2055,  2056,  2057,  2058,  2059,  2060,  2061,  2062,  2063,
    2064,  2067,  2068
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
  "\"fdiv\"", "\"identifier\"", "\"string constant\"",
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
  "\":immediate\"", "\":lexid\"", "\":unique_reg\"", "\":named\"",
  "\":slurpy\"", "\":flat\"", "\":optional\"", "\":opt_flag\"",
  "\":invocant\"", "'='", "'['", "']'", "';'", "'('", "')'", "','", "'.'",
  "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"",
  "$accept", "TOP", "opt_nl", "pir_chunks", "pir_chunk", "loadlib",
  "hll_specifier", "hll_mapping", "namespace_decl", "opt_namespace_id",
  "namespace_id", "sub_def", "sub_head", "sub_id", "sub_flags", "sub_flag",
  "sub_flag_with_arg", "multi_type", "parameters", "parameter", "param",
  "param_flags", "param_flag", "invocant_param", "instructions",
  "instruction", "@1", "instr", "statement", "error_stat", "null_stat",
  "null_instr", "getresults_stat", "parrot_stat", "parrot_instruction",
  "parrot_op", "opt_op_args", "op_args", "op_arg", "keyaccess", "keylist",
  "keys", "assignment_stat", "assignment", "augmentive_expr",
  "binary_expr", "set_instruction", "math_stat", "math_instruction",
  "math_op", "conditional_stat", "conditional_instr", "condition",
  "if_unless", "then", "goto_stat", "local_decl", "local_id_list",
  "local_id", "has_unique_reg", "lex_decl", "invocation_stat",
  "long_invocation_stat", "opt_long_arguments", "long_arguments",
  "long_argument", "long_invocation", "opt_ret_cont", "opt_long_results",
  "long_results", "long_result", "short_invocation_stat",
  "short_invocation", "simple_invocation", "methodcall", "subcall", "sub",
  "method", "invokable", "string_object", "opt_target_list", "opt_list",
  "target_list", "result_target", "target_flags", "target_flag",
  "return_stat", "yield_stat", "short_return_stat", "short_yield_stat",
  "arguments", "opt_arguments_list", "arguments_list", "argument",
  "named_arg", "short_arg", "arg", "long_return_stat", "long_yield_stat",
  "opt_yield_expressions", "yield_expressions", "yield_expression",
  "opt_return_expressions", "return_expressions", "return_expression",
  "arg_flags", "arg_flag", "opt_paren_string", "paren_string",
  "const_decl_stat", "const_stat", "const_decl", "globalconst_decl",
  "const_tail", "expression", "constant", "rel_op", "type", "target",
  "symbol", "identifier", "unop", "binop", "augmented_op", "augm_add_op", 0
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
     355,   356,    61,    91,    93,    59,    40,    41,    44,    46,
      45,    33,   126,    43,    47,    42,    37,   124,    38,   357
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   120,   121,   122,   122,   123,   123,   124,   124,   124,
     124,   124,   124,   125,   126,   127,   128,   129,   129,   130,
     130,   131,   132,   133,   133,   134,   134,   135,   135,   135,
     135,   135,   135,   135,   135,   135,   135,   136,   136,   136,
     137,   137,   137,   137,   137,   138,   138,   139,   140,   141,
     141,   142,   142,   143,   144,   144,   146,   145,   147,   147,
     147,   148,   148,   148,   148,   148,   148,   148,   148,   148,
     148,   148,   148,   148,   148,   149,   150,   151,   151,   152,
     153,   154,   155,   156,   156,   157,   157,   158,   158,   158,
     159,   160,   161,   161,   162,   163,   163,   163,   163,   163,
     163,   163,   163,   163,   163,   163,   163,   163,   163,   163,
     164,   164,   164,   164,   165,   165,   165,   165,   165,   165,
     165,   165,   166,   166,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   167,   168,   168,   168,   168,   168,   168,
     168,   168,   168,   168,   168,   168,   168,   168,   168,   168,
     168,   168,   168,   168,   169,   169,   169,   169,   169,   170,
     171,   171,   171,   172,   172,   172,   172,   172,   172,   172,
     172,   172,   172,   172,   172,   173,   173,   174,   174,   175,
     176,   177,   177,   178,   179,   179,   180,   181,   181,   182,
     183,   183,   184,   184,   185,   186,   186,   186,   187,   187,
     188,   188,   189,   189,   190,   190,   191,   192,   192,   192,
     193,   193,   194,   195,   196,   196,   197,   197,   198,   198,
     199,   199,   200,   201,   201,   202,   202,   203,   204,   204,
     205,   205,   205,   205,   205,   206,   206,   207,   207,   208,
     208,   209,   210,   211,   211,   212,   212,   213,   213,   214,
     215,   216,   217,   218,   219,   219,   220,   220,   221,   222,
     222,   223,   223,   224,   225,   225,   226,   226,   227,   227,
     228,   229,   230,   230,   231,   232,   233,   233,   233,   233,
     234,   234,   235,   235,   235,   236,   236,   236,   236,   236,
     236,   237,   237,   237,   237,   238,   239,   239,   239,   239,
     239,   240,   240,   241,   241,   241,   242,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   243,
     243,   243,   243,   243,   243,   243,   243,   243,   243,   243,
     243,   244,   244
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     2,     2,     4,     4,     0,     1,     1,
       3,     6,     2,     1,     1,     0,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     2,     2,
       1,     1,     1,     1,     1,     0,     2,     4,     2,     0,
       2,     1,     1,     4,     0,     2,     0,     2,     2,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     2,     2,     2,     3,     3,
       2,     2,     1,     0,     1,     1,     3,     1,     1,     1,
       2,     3,     1,     3,     2,     1,     3,     3,     3,     3,
       2,     4,     3,     5,     5,     5,     5,     3,     3,     3,
       2,     2,     2,     2,     3,     3,     3,     3,     3,     3,
       3,     3,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     2,     4,     6,     4,     6,     6,     6,
       6,     6,     6,     6,     6,     6,     6,     6,     4,     4,
       6,     6,     6,     6,     1,     1,     1,     1,     1,     2,
       5,     4,     4,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     1,     1,     1,     1,     1,     1,     1,     3,
       4,     1,     3,     2,     0,     1,     5,     1,     1,     8,
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
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     3,     5,    12,    10,    11,     9,     7,    25,     8,
      14,     0,    13,   301,    24,   302,    22,    23,    17,     0,
       0,     0,     0,   274,     4,     2,     0,     0,    19,     0,
      18,     0,     0,     0,     0,     6,    45,    28,    29,    30,
      27,    31,     0,   268,    32,    35,    33,    34,     0,    26,
      36,    15,    16,     0,     0,     0,     0,     0,    54,     0,
       0,    38,   269,    39,    20,   276,   277,   278,   279,     0,
      46,    56,     0,     0,   291,   292,   293,   294,    49,     0,
      21,    55,     0,    37,   270,     0,    48,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   154,
     155,   156,   157,   158,   300,   215,   296,   297,   299,   298,
      82,   175,   176,     0,     0,   223,    57,    60,    74,    72,
       0,    71,    70,     0,    83,     0,    69,     0,    95,    73,
       0,     0,    61,     0,     0,    62,    63,    64,    68,   187,
     188,     0,   209,   211,   210,     0,   214,     0,    66,    67,
     235,   237,   236,   238,    65,     0,   272,   273,     0,   295,
     218,    47,   233,   268,   232,   230,   231,     0,    50,    52,
      51,    75,    58,    59,     0,     0,   275,   219,   243,     0,
       0,     0,   254,   259,   190,     0,   300,   296,     0,     0,
      77,     0,     0,   224,   225,   228,    76,    80,   282,   283,
     284,     0,    81,    84,    85,    89,    88,    87,   281,   280,
       0,    94,   133,     0,   159,   174,   172,   173,     0,     0,
       0,   206,   213,     0,     0,   271,   340,   338,   339,   341,
     342,   329,   330,   331,   332,   334,   335,   333,   336,   337,
       0,    90,   100,     0,     0,   234,     0,     0,     0,   181,
     184,   282,     0,   244,   245,   248,   247,   264,   251,   280,
     240,   239,   241,     0,     0,   255,   256,     0,     0,   260,
     261,     0,     0,   191,   192,    79,     0,     0,   179,   222,
       0,   227,     0,    92,     0,   107,     0,   285,   286,   287,
     288,   290,   289,     0,     0,     0,     0,     0,   177,   178,
       0,     0,   220,   221,     0,   216,   217,   207,     0,    98,
      96,    97,    78,   303,   304,   305,   109,   108,   102,     0,
     208,    99,     0,   113,   110,   111,   112,    40,    42,    41,
       0,    43,    44,     0,   180,     0,   185,   183,     0,   242,
       0,   250,     0,     0,   257,     0,     0,   262,     0,     0,
       0,     0,     0,   193,   123,   127,   125,   126,   122,   124,
     226,   229,    91,     0,    86,   134,   136,     0,   171,   166,
     167,   169,   164,   170,   168,   165,     0,   162,   161,   163,
     212,   130,   128,   129,   131,   132,   328,   323,   325,   324,
     327,   326,   316,   317,   318,   321,   319,   320,   322,   315,
     307,   313,   306,   308,   309,   310,   311,   312,   314,     0,
       0,     0,   148,   149,     0,     0,   101,    53,   186,   182,
     249,   246,   268,   266,   265,   258,   253,   263,   252,   194,
       0,   198,   196,   200,    93,     0,     0,     0,   160,   117,
     116,   118,   120,   114,   121,   119,   115,     0,     0,     0,
     105,   103,   104,   106,   267,     0,     0,   195,     0,   205,
       0,   201,   202,   135,   137,   140,   139,   138,   141,   144,
     143,   142,   146,   147,   150,   151,   152,   153,   145,     0,
     199,     0,     0,   203,   197,   204,   189
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    39,
      40,    17,    18,    26,    36,    59,    60,   340,    68,    80,
      88,    95,   178,   179,    81,    91,    92,   126,   127,   128,
     129,   130,   131,   132,   133,   134,   212,   213,   214,   135,
     251,   292,   136,   137,   252,   328,   138,   139,   140,   141,
     142,   143,   229,   144,   310,   145,   146,   258,   259,   347,
     147,   148,   149,   282,   283,   284,   362,   467,   470,   471,
     472,   150,   151,   152,   153,   154,   155,   314,   156,   316,
     157,   202,   203,   204,   291,   180,   158,   159,   160,   161,
     190,   262,   263,   264,   265,   266,   267,   162,   163,   274,
     275,   276,   278,   279,   280,   351,   434,    71,    72,   164,
     165,    19,   167,    33,   268,   218,   303,    89,   269,   169,
     170,   332,   419,   253,   254
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -418
static const yytype_int16 yypact[] =
{
      26,  -418,    15,   167,  -418,     2,    24,    57,    61,    23,
     162,   108,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,
    -418,    43,  -418,  -418,  -418,  -418,  -418,  -418,   111,    78,
      78,    78,    78,  -418,   167,  -418,   203,   117,  -418,    54,
      66,    77,    79,    87,    98,  -418,  -418,  -418,  -418,  -418,
    -418,  -418,    95,   110,  -418,  -418,  -418,  -418,   110,  -418,
    -418,  -418,  -418,   164,   165,   177,   188,   194,   210,    61,
     196,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,   182,
    -418,   228,   132,   133,  -418,  -418,  -418,  -418,  -418,    78,
    -418,  -418,   232,  -418,  -418,     8,  -418,   238,   368,   207,
     182,   162,   -10,   135,   242,   249,   251,   151,   354,  -418,
    -418,  -418,  -418,  -418,   -70,  -418,    58,  -418,  -418,  -418,
      89,  -418,  -418,   354,    78,   354,  -418,  -418,  -418,  -418,
     256,  -418,  -418,   258,    49,   169,  -418,   268,  -418,  -418,
     274,   354,  -418,   275,    96,  -418,  -418,  -418,  -418,  -418,
    -418,   276,  -418,  -418,  -418,   135,   172,   198,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,   294,  -418,  -418,   237,  -418,
    -418,  -418,  -418,   110,  -418,  -418,  -418,   195,  -418,  -418,
    -418,  -418,  -418,  -418,   197,    78,  -418,  -418,   283,   299,
     300,   327,   313,   315,   307,   332,  -418,  -418,   241,    48,
    -418,   346,   244,   245,  -418,  -418,  -418,  -418,  -418,  -418,
    -418,   304,  -418,   257,  -418,  -418,  -418,  -418,  -418,   263,
     304,  -418,  -418,   262,  -418,   412,   412,   412,   304,   318,
     -11,  -418,  -418,    14,   109,  -418,  -418,  -418,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,
      32,  -418,  -418,   304,   497,  -418,    73,   354,     9,  -418,
     278,   298,   267,   273,  -418,  -418,  -418,  -418,  -418,  -418,
    -418,  -418,  -418,   304,   355,   313,  -418,   304,   352,   315,
    -418,   304,    11,   307,  -418,  -418,   304,   320,  -418,  -418,
     354,   -17,    -4,  -418,    49,  -418,   505,  -418,  -418,  -418,
    -418,  -418,  -418,   150,   513,   521,   329,    78,  -418,  -418,
      78,   304,  -418,  -418,   135,  -418,  -418,  -418,   481,   367,
     398,   398,  -418,  -418,  -418,  -418,  -418,  -418,  -418,   529,
    -418,   384,   304,  -418,  -418,  -418,  -418,  -418,  -418,  -418,
     282,  -418,  -418,   379,  -418,    78,  -418,  -418,   304,  -418,
     283,   -38,   389,   403,  -418,   404,   410,  -418,   411,   124,
     124,   124,   413,  -418,  -418,  -418,  -418,  -418,  -418,   263,
    -418,  -418,  -418,   304,  -418,   308,   328,   330,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,  -418,    78,  -418,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,   263,  -418,  -418,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,   181,
     537,   545,   370,   380,   381,   489,  -418,  -418,  -418,  -418,
    -418,  -418,   110,  -418,  -418,  -418,  -418,  -418,  -418,  -418,
     433,   382,  -418,     4,  -418,   553,   561,   569,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,  -418,  -418,    74,   577,   585,
    -418,  -418,  -418,  -418,  -418,   460,   124,  -418,   354,  -418,
     451,     4,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,    14,
    -418,   487,   488,  -418,  -418,  -418,  -418
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -418,  -418,   482,  -418,   461,  -418,  -418,  -418,  -418,  -418,
    -418,  -418,  -418,   435,  -418,  -418,  -418,  -418,  -418,  -418,
    -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,   407,  -418,
    -418,  -418,  -418,  -418,   259,  -418,  -418,  -418,   212,   -97,
    -124,  -418,  -418,  -418,  -418,  -418,  -418,  -418,  -418,   285,
    -418,  -418,  -418,  -418,  -418,  -418,  -417,  -418,   206,  -418,
    -418,  -418,  -418,  -418,  -418,   224,  -418,  -418,  -418,  -418,
      72,  -418,  -418,   -93,  -418,  -418,  -418,    70,  -230,  -418,
     468,  -418,  -418,  -285,  -418,   292,  -418,  -418,  -418,  -418,
     -99,  -418,  -418,   217,  -418,   -95,   243,  -418,  -418,  -418,
    -418,   324,  -418,  -418,   336,  -418,  -418,  -171,   549,  -418,
    -418,   -78,  -418,   522,  -126,  -418,  -102,   -94,   -91,  -418,
      -8,  -418,  -302,  -418,  -418
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -303
static const yytype_int16 yytable[] =
{
      27,   168,   255,   315,   191,   370,   185,   168,   217,   189,
     216,   198,   171,   344,   166,     4,   100,   199,   420,   421,
     166,    41,    42,    43,    44,   359,   469,    23,   115,   425,
       1,   187,   200,   468,   205,    25,  -301,   215,   360,  -301,
      20,   361,   308,   219,   297,   298,   299,   300,   301,   302,
     223,    23,   312,   230,   469,   187,   232,   313,   432,    25,
     433,    27,    21,   318,   109,   110,   111,   112,   113,   114,
     319,   320,   321,   116,   117,   118,   119,   120,   172,   173,
     174,    96,   175,   176,   322,   293,   196,   208,   209,   210,
     197,   117,   118,   119,   295,    22,   188,   309,    23,    24,
     372,   373,   306,   172,   173,   174,    25,   175,   176,   177,
     337,   338,    34,   482,   483,    23,   201,   345,   339,    84,
      85,    86,    87,    25,   304,   305,    28,   333,   311,   440,
     441,   442,   341,   196,   225,   226,   227,   197,   117,   118,
     119,   317,   323,   324,   325,    37,    23,   115,   228,    38,
     187,   211,   211,   327,    25,    61,   287,   330,    62,   331,
     364,    23,   342,   336,  -219,   187,   343,  -219,   217,    25,
     216,    63,     5,     6,     7,     8,   211,   260,   352,    64,
       9,    65,   355,   491,    10,   389,   358,   196,   378,    66,
     368,   197,   117,   118,   119,  -302,   369,   215,  -302,   205,
      67,    69,    74,   219,    75,   377,   426,    46,    29,    30,
      31,    32,   379,   382,   385,   390,    70,    76,   196,   449,
      79,   394,   197,   117,   118,   119,    77,   395,    84,    85,
      86,    87,    78,    97,    83,    98,   490,    90,   424,    93,
      94,   188,   181,    99,   100,   184,   192,   444,   101,    10,
     102,   103,   104,   193,   105,   194,   106,   125,   107,   315,
     206,   464,   207,   108,   109,   110,   111,   112,   113,   114,
     115,   220,   221,   116,   117,   118,   119,   120,   222,   224,
     231,   233,   121,   122,   123,   124,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,   235,   387,
     234,   256,   388,   270,   271,   257,   236,   237,   238,   239,
     240,   241,   242,   243,   244,   245,   246,   247,   248,   249,
     196,   261,   209,   210,   197,   117,   118,   119,   450,   453,
     456,   272,   273,   277,   463,   281,   285,   260,   125,   250,
     211,   196,   208,   209,   210,   197,   117,   118,   119,   286,
     288,   289,   348,   290,   475,   478,   481,   196,   365,   366,
     367,   197,   117,   118,   119,   294,   211,   486,   488,    97,
     296,   307,   182,   346,   349,   356,   353,   205,   448,    99,
     100,   350,   386,   428,   101,    10,   102,   103,   104,   427,
     105,   196,   106,   435,   107,   197,   117,   118,   119,   108,
     109,   110,   111,   112,   113,   114,   115,   436,   437,   116,
     117,   118,   119,   120,   438,   439,   445,   443,   121,   122,
     123,   124,   396,   397,   398,   399,   400,   401,   402,   403,
     404,   405,   406,   407,   408,   409,   446,   465,   447,   396,
     397,   398,   399,   400,   401,   402,   403,   404,   405,   406,
     407,   408,   409,   396,   397,   398,   399,   400,   401,   402,
     403,   404,   405,   406,   407,   408,   409,   297,   298,   299,
     300,   301,   302,  -215,   125,   489,   492,   410,   457,   411,
     412,   413,   414,   415,   416,   417,   418,   211,   458,   459,
     466,   495,   496,    35,   410,    45,   411,   412,   413,   414,
     415,   416,   417,   418,    82,   183,   374,   363,   410,   326,
     411,   412,   413,   414,   415,   416,   417,   418,   196,   391,
     392,   393,   197,   117,   118,   119,   196,   460,   461,   462,
     197,   117,   118,   119,   196,   329,   334,   335,   197,   117,
     118,   119,   196,   493,   375,   376,   197,   117,   118,   119,
     196,   429,   380,   381,   197,   117,   118,   119,   196,   494,
     383,   384,   197,   117,   118,   119,   196,   431,   422,   423,
     197,   117,   118,   119,   196,   195,   451,   452,   197,   117,
     118,   119,   196,   371,   454,   455,   197,   117,   118,   119,
     196,   430,   473,   474,   197,   117,   118,   119,   196,   354,
     476,   477,   197,   117,   118,   119,   196,    73,   479,   480,
     197,   117,   118,   119,   196,   357,   484,   485,   197,   117,
     118,   119,   196,   186,     0,   487,   197,   117,   118,   119
};

static const yytype_int16 yycheck[] =
{
       8,    92,   173,   233,   103,   290,   100,    98,   134,   102,
     134,   108,     4,     4,    92,     0,    12,   108,   320,   321,
      98,    29,    30,    31,    32,    14,   443,    37,    38,   331,
       4,    41,   123,    29,   125,    45,   106,   134,    27,   109,
      38,    30,    53,   134,    55,    56,    57,    58,    59,    60,
     141,    37,    38,   144,   471,    41,   155,    43,    96,    45,
      98,    69,    38,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    95,    96,
      97,    89,    99,   100,    52,   211,    37,    38,    39,    40,
      41,    42,    43,    44,   220,    38,   106,   108,    37,    38,
     104,   105,   228,    95,    96,    97,    45,    99,   100,   101,
      37,    38,     4,    39,    40,    37,   124,   108,    45,    46,
      47,    48,    49,    45,   226,   227,   103,   253,   230,   359,
     360,   361,   256,    37,    38,    39,    40,    41,    42,    43,
      44,   234,   110,   111,   112,   102,    37,    38,    52,    38,
      41,   103,   103,   250,    45,    38,   108,   250,   104,   250,
     286,    37,   256,   254,   106,    41,   257,   109,   294,    45,
     294,   105,     5,     6,     7,     8,   103,   185,   273,   102,
      13,   102,   277,   468,    17,   311,   281,    37,    38,   102,
     287,    41,    42,    43,    44,   106,   287,   294,   109,   290,
     102,   106,    38,   294,    39,   296,   332,     4,    46,    47,
      48,    49,   303,   304,   305,   314,   106,    40,    37,    38,
      10,   318,    41,    42,    43,    44,    38,   318,    46,    47,
      48,    49,    38,     1,    38,     3,   466,     9,   329,   107,
     107,   106,     4,    11,    12,    38,     4,   373,    16,    17,
      18,    19,    20,     4,    22,     4,    24,   106,    26,   489,
       4,   432,     4,    31,    32,    33,    34,    35,    36,    37,
      38,   102,     4,    41,    42,    43,    44,    45,     4,     4,
       4,   109,    50,    51,    52,    53,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,     4,   307,
     102,   106,   310,     4,     4,   108,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      37,    38,    39,    40,    41,    42,    43,    44,   419,   420,
     421,     4,    19,    18,   425,    28,     4,   345,   106,   102,
     103,    37,    38,    39,    40,    41,    42,    43,    44,   108,
       4,   107,    54,   108,   445,   446,   447,    37,    38,    39,
      40,    41,    42,    43,    44,   108,   103,   458,   459,     1,
     108,    53,     4,    95,   107,    23,    21,   468,   386,    11,
      12,   108,    53,     4,    16,    17,    18,    19,    20,   107,
      22,    37,    24,     4,    26,    41,    42,    43,    44,    31,
      32,    33,    34,    35,    36,    37,    38,     4,     4,    41,
      42,    43,    44,    45,     4,     4,   108,     4,    50,    51,
      52,    53,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,   108,     4,   108,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    55,    56,    57,
      58,    59,    60,   106,   106,    15,    25,   110,   108,   112,
     113,   114,   115,   116,   117,   118,   119,   103,   108,   108,
     108,     4,     4,    11,   110,    34,   112,   113,   114,   115,
     116,   117,   118,   119,    69,    98,   294,   283,   110,   250,
     112,   113,   114,   115,   116,   117,   118,   119,    37,    38,
      39,    40,    41,    42,    43,    44,    37,    38,    39,    40,
      41,    42,    43,    44,    37,   250,    39,    40,    41,    42,
      43,    44,    37,   471,    39,    40,    41,    42,    43,    44,
      37,   345,    39,    40,    41,    42,    43,    44,    37,   489,
      39,    40,    41,    42,    43,    44,    37,   350,    39,    40,
      41,    42,    43,    44,    37,   107,    39,    40,    41,    42,
      43,    44,    37,   291,    39,    40,    41,    42,    43,    44,
      37,   348,    39,    40,    41,    42,    43,    44,    37,   275,
      39,    40,    41,    42,    43,    44,    37,    58,    39,    40,
      41,    42,    43,    44,    37,   279,    39,    40,    41,    42,
      43,    44,    37,   101,    -1,    40,    41,    42,    43,    44
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   121,   122,     0,     5,     6,     7,     8,    13,
      17,   123,   124,   125,   126,   127,   128,   131,   132,   231,
      38,    38,    38,    37,    38,    45,   133,   240,   103,    46,
      47,    48,    49,   233,     4,   122,   134,   102,    38,   129,
     130,   240,   240,   240,   240,   124,     4,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,   135,
     136,    38,   104,   105,   102,   102,   102,   102,   138,   106,
     106,   227,   228,   228,    38,    39,    40,    38,    38,    10,
     139,   144,   133,    38,    46,    47,    48,    49,   140,   237,
       9,   145,   146,   107,   107,   141,   240,     1,     3,    11,
      12,    16,    18,    19,    20,    22,    24,    26,    31,    32,
      33,    34,    35,    36,    37,    38,    41,    42,    43,    44,
      45,    50,    51,    52,    53,   106,   147,   148,   149,   150,
     151,   152,   153,   154,   155,   159,   162,   163,   166,   167,
     168,   169,   170,   171,   173,   175,   176,   180,   181,   182,
     191,   192,   193,   194,   195,   196,   198,   200,   206,   207,
     208,   209,   217,   218,   229,   230,   231,   232,   238,   239,
     240,     4,    95,    96,    97,    99,   100,   101,   142,   143,
     205,     4,     4,   148,    38,   237,   233,    41,   106,   193,
     210,   210,     4,     4,     4,   200,    37,    41,   159,   238,
     238,   240,   201,   202,   203,   238,     4,     4,    38,    39,
      40,   103,   156,   157,   158,   159,   160,   234,   235,   238,
     102,     4,     4,   238,     4,    38,    39,    40,    52,   172,
     238,     4,   210,   109,   102,     4,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
     102,   160,   164,   243,   244,   227,   106,   108,   177,   178,
     240,    38,   211,   212,   213,   214,   215,   216,   234,   238,
       4,     4,     4,    19,   219,   220,   221,    18,   222,   223,
     224,    28,   183,   184,   185,     4,   108,   108,     4,   107,
     108,   204,   161,   234,   108,   234,   108,    55,    56,    57,
      58,    59,    60,   236,   236,   236,   234,    53,    53,   108,
     174,   236,    38,    43,   197,   198,   199,   193,    31,    38,
      39,    40,    52,   110,   111,   112,   154,   159,   165,   169,
     193,   238,   241,   234,    39,    40,   238,    37,    38,    45,
     137,   160,   237,   238,     4,   108,    95,   179,    54,   107,
     108,   225,   215,    21,   221,   215,    23,   224,   215,    14,
      27,    30,   186,   185,   234,    38,    39,    40,   159,   238,
     203,   205,   104,   105,   158,    39,    40,   238,    38,   238,
      39,    40,   238,    39,    40,   238,    53,   240,   240,   234,
     210,    38,    39,    40,   159,   238,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
     110,   112,   113,   114,   115,   116,   117,   118,   119,   242,
     242,   242,    39,    40,   238,   242,   234,   107,     4,   178,
     216,   213,    96,    98,   226,     4,     4,     4,     4,     4,
     198,   198,   198,     4,   234,   108,   108,   108,   240,    38,
     238,    39,    40,   238,    39,    40,   238,   108,   108,   108,
      38,    39,    40,   238,   227,     4,   108,   187,    29,   176,
     188,   189,   190,    39,    40,   238,    39,    40,   238,    39,
      40,   238,    39,    40,    39,    40,   238,    40,   238,    15,
     198,   203,    25,   190,   197,     4,     4
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
#line 466 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 14:
#line 472 "pir.y"
    { set_hll((yyvsp[(2) - (2)].sval)); ;}
    break;

  case 15:
#line 476 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 16:
#line 483 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].fixme)); ;}
    break;

  case 17:
#line 487 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 18:
#line 489 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].fixme); ;}
    break;

  case 19:
#line 493 "pir.y"
    { (yyval.fixme) = new_key(expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)))); ;}
    break;

  case 20:
#line 495 "pir.y"
    { (yyval.fixme) = add_key((yyvsp[(1) - (3)].fixme), expr_from_const(new_const(STRING_TYPE, (yyvsp[(3) - (3)].sval)))); ;}
    break;

  case 22:
#line 508 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 25:
#line 516 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 26:
#line 518 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 27:
#line 522 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 28:
#line 524 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 29:
#line 526 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 30:
#line 528 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 31:
#line 530 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 32:
#line 532 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 33:
#line 534 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 34:
#line 536 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 35:
#line 538 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 37:
#line 543 "pir.y"
    {
                           (yyval.ival) = SUB_FLAG_OUTER;
                           set_sub_outer(lexer, (yyvsp[(3) - (4)].sval));
                         ;}
    break;

  case 38:
#line 548 "pir.y"
    {
                           (yyval.ival) = SUB_FLAG_VTABLE;
                           set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 39:
#line 553 "pir.y"
    {
                           (yyval.ival) = SUB_FLAG_LEXID;
                           set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 48:
#line 574 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 49:
#line 578 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 50:
#line 580 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 53:
#line 588 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 56:
#line 597 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 58:
#line 602 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 59:
#line 604 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 75:
#line 626 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 77:
#line 638 "pir.y"
    {
                           set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (2)].targ)));
                         ;}
    break;

  case 78:
#line 643 "pir.y"
    {
                           set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ)));
                         ;}
    break;

  case 79:
#line 650 "pir.y"
    {
                           set_instr(lexer, "get_results");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                         ;}
    break;

  case 82:
#line 663 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 85:
#line 671 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 86:
#line 673 "pir.y"
    { push_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 87:
#line 677 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 88:
#line 679 "pir.y"
    { (yyval.expr) = expr_from_key((yyvsp[(1) - (1)].key)); ;}
    break;

  case 89:
#line 681 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 90:
#line 685 "pir.y"
    {
                            (yyvsp[(1) - (2)].targ)->key = (yyvsp[(2) - (2)].key);
                            (yyval.expr)      = expr_from_target((yyvsp[(1) - (2)].targ));
                         ;}
    break;

  case 91:
#line 692 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 92:
#line 696 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 93:
#line 698 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 96:
#line 707 "pir.y"
    {
                           if ((yyvsp[(3) - (3)].ival) == 0) {  /* x = 0 -> null x */
                               set_instr(lexer, "null");
                               push_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ)));
                           }
                           else {
                               set_instr(lexer, "set");
                               add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)),
                                                      expr_from_const(new_const(INT_TYPE, (yyvsp[(3) - (3)].ival))));
                           }
                         ;}
    break;

  case 97:
#line 719 "pir.y"
    {
                           if ((yyvsp[(3) - (3)].dval) == 0.0) {  /* x = 0.0 -> null x */
                               set_instr(lexer, "null");
                               push_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ)));
                           }
                           else {
                               set_instr(lexer, "set");
                               add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)),
                                                      expr_from_const(new_const(NUM_TYPE, (yyvsp[(3) - (3)].dval))));
                           }
                         ;}
    break;

  case 98:
#line 731 "pir.y"
    {
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)),
                                                   expr_from_const(new_const(STRING_TYPE, (yyvsp[(3) - (3)].sval))));
                         ;}
    break;

  case 99:
#line 737 "pir.y"
    {
                           if (targets_equal((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)))
                               set_instr(lexer, "nop");
                           else {
                               set_instr(lexer, "set");
                               add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), expr_from_target((yyvsp[(3) - (3)].targ)));
                           }
                         ;}
    break;

  case 100:
#line 746 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (2)].targ))); ;}
    break;

  case 101:
#line 748 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(3) - (4)].sval));
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)), (yyvsp[(4) - (4)].expr));
                         ;}
    break;

  case 102:
#line 753 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 103:
#line 755 "pir.y"
    {
                            int equal = targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ));
                            if (equal) {
                                if ((yyvsp[(5) - (5)].ival) == 1) {
                                    /* x = x op 1 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB)) {
                                        set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival) + 1]);
                                        push_operand(lexer, expr_from_target((yyvsp[(1) - (5)].targ)));
                                    }
                                    else { /* x = x * 1 -> delete */
                                        set_instr(lexer, "nop");
                                    }
                                }
                                else if ((yyvsp[(5) - (5)].ival) == 0) {
                                    /* x = x op 0 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB))
                                        set_instr(lexer, "nop");
                                    else if ((yyvsp[(4) - (5)].ival) == OP_MUL) {
                                        /* x = x * 0 -> null x */
                                        set_instr(lexer, "null");
                                        push_operand(lexer, expr_from_target((yyvsp[(1) - (5)].targ)));
                                    }
                                    else
                                        yyerror(yyscanner, lexer, "cannot divide by 0.0");
                                }
                                else {
                                    /* x = x op 10 */
                                    set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival)]);
                                    add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                           expr_from_const(new_const(INT_TYPE, (yyvsp[(5) - (5)].ival))));
                                }
                            }
                            else {
                                /* x = y op ? */
                                set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival)]);
                                add_operands(lexer, 3, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                       expr_from_target((yyvsp[(3) - (5)].targ)),
                                                       expr_from_const(new_const(INT_TYPE, (yyvsp[(5) - (5)].ival))));
                            }
                         ;}
    break;

  case 104:
#line 796 "pir.y"
    {
                            int equal = targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ));
                            if (equal) {
                                if ((yyvsp[(5) - (5)].dval) == 1.0) {
                                    /* x = x op 1 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB)) {
                                        set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival) + 1]);
                                        push_operand(lexer, expr_from_target((yyvsp[(1) - (5)].targ)));
                                    }
                                    else if (((yyvsp[(4) - (5)].ival) == OP_MUL) || ((yyvsp[(4) - (5)].ival) == OP_DIV) || ((yyvsp[(4) - (5)].ival) == OP_FDIV)) {
                                        /* x = x *|/|// 1 -> delete */
                                        set_instr(lexer, "nop");
                                    }
                                    else {   /* other operators */
                                        /* x = x >> 1 -> x >>= 1 */
                                        set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival)]);
                                        add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                               expr_from_const(new_const(NUM_TYPE, (yyvsp[(5) - (5)].dval))));
                                    }
                                }
                                else if ((yyvsp[(5) - (5)].dval) == 0.0) {
                                    /* x = x op 0.0 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB))
                                        set_instr(lexer, "nop");
                                    else if ((yyvsp[(4) - (5)].ival) == OP_MUL) {
                                        /* x = x * 0.0 -> null x */
                                        set_instr(lexer, "null");
                                        push_operand(lexer, expr_from_target((yyvsp[(1) - (5)].targ)));
                                    }
                                    else if (((yyvsp[(4) - (5)].ival) == OP_DIV) || ((yyvsp[(4) - (5)].ival) == OP_FDIV)) {
                                        /* x = x / 0 */
                                        yyerror(yyscanner, lexer, "cannot divide by 0.0");
                                    }
                                    else {
                                        /* x = x op 0.0 */
                                        set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival)]);
                                        add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                               expr_from_const(new_const(NUM_TYPE, (yyvsp[(5) - (5)].dval))));
                                    }
                                }
                                else {
                                    /* x = x op 10 */
                                    set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival)]);
                                    add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                           expr_from_const(new_const(NUM_TYPE, (yyvsp[(5) - (5)].dval))));
                                }
                            }
                            else {
                                /* x = y op ? */
                                set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival)]);
                                add_operands(lexer, 3, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                       expr_from_target((yyvsp[(3) - (5)].targ)),
                                                       expr_from_const(new_const(NUM_TYPE, (yyvsp[(5) - (5)].dval))));
                            }

                         ;}
    break;

  case 105:
#line 853 "pir.y"
    {
                            set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival)]);
                            if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ)))
                                /* x = x . "hi" -> x .= "hi" */
                                add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                       expr_from_const(new_const(STRING_TYPE, (yyvsp[(5) - (5)].sval))));
                            else
                                add_operands(lexer, 3, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                       expr_from_target((yyvsp[(3) - (5)].targ)),
                                                       expr_from_const(new_const(STRING_TYPE, (yyvsp[(5) - (5)].sval))));

                         ;}
    break;

  case 106:
#line 866 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(4) - (5)].ival)]);
                           if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ)))
                               add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (5)].targ)), expr_from_target((yyvsp[(5) - (5)].targ)));
                           else
                               add_operands(lexer, 3, expr_from_target((yyvsp[(1) - (5)].targ)),
                                                      expr_from_target((yyvsp[(3) - (5)].targ)),
                                                      expr_from_target((yyvsp[(5) - (5)].targ)));
                         ;}
    break;

  case 107:
#line 876 "pir.y"
    {
                           set_instr(lexer, "set");
                           add_operands(lexer, 2, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 108:
#line 881 "pir.y"
    {
                           set_instr(lexer, "set");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 109:
#line 886 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 110:
#line 890 "pir.y"
    {
                           if ((yyvsp[(2) - (2)].ival) == 1) { /* adding/subtracting 1? */
                              /* "inc" is sorted right after "add";
                               * "dec" is sorted right after "sub";
                               * so select them by adding 1 to the index.
                               */
                              set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival) + 1]);
                           }
                           else {
                              set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                              push_operand(lexer, expr_from_const(new_const(INT_TYPE, (yyvsp[(2) - (2)].ival))));
                           }
                         ;}
    break;

  case 111:
#line 904 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, expr_from_const(new_const(NUM_TYPE, (yyvsp[(2) - (2)].dval))));
                         ;}
    break;

  case 112:
#line 909 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (2)].targ)));
                         ;}
    break;

  case 113:
#line 914 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, (yyvsp[(2) - (2)].expr));
                         ;}
    break;

  case 114:
#line 932 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(INT_TYPE, (yyvsp[(1) - (3)].ival))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 115:
#line 938 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(NUM_TYPE, (yyvsp[(1) - (3)].dval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 116:
#line 944 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (3)].sval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 117:
#line 950 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))));
                         ;}
    break;

  case 118:
#line 955 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 119:
#line 960 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))));
                         ;}
    break;

  case 120:
#line 965 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))));
                         ;}
    break;

  case 121:
#line 970 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 122:
#line 1001 "pir.y"
    {
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)), (yyvsp[(4) - (4)].expr));
                    ;}
    break;

  case 123:
#line 1006 "pir.y"
    {
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, (yyvsp[(2) - (4)].expr), (yyvsp[(4) - (4)].expr));
                    ;}
    break;

  case 124:
#line 1011 "pir.y"
    {
                        if (targets_equal((yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ)))
                            /* set $I0, $I0 -> delete */
                            set_instr(lexer, "nop");
                        else {
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)), expr_from_target((yyvsp[(4) - (4)].targ)));
                        }
                    ;}
    break;

  case 125:
#line 1021 "pir.y"
    {
                       if ((yyvsp[(4) - (4)].ival) == 0) {
                           /* set $I0, 0 -> null $I0 */
                           set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (4)].targ)));
                       }
                       else {
                           set_instr0(lexer, "set", 2, expr_from_target((yyvsp[(2) - (4)].targ)), expr_from_const(new_const(INT_TYPE, (yyvsp[(4) - (4)].ival))));
                       }
                    ;}
    break;

  case 126:
#line 1032 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].dval) == 0) {
                            /* set $N0, 0.0 -> null $N0 */
                            set_instr(lexer, "null");
                            push_operand(lexer, expr_from_target((yyvsp[(2) - (4)].targ)));
                        }
                        else {
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)),
                                                   expr_from_const(new_const(NUM_TYPE, (yyvsp[(4) - (4)].dval))));
                        }
                    ;}
    break;

  case 127:
#line 1045 "pir.y"
    {
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)),
                                               expr_from_const(new_const(STRING_TYPE, (yyvsp[(4) - (4)].sval))));
                    ;}
    break;

  case 128:
#line 1051 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].ival) == 0) {
                            /* $I0 = set 0 -> null $I0 */
                            set_instr(lexer, "null");
                            push_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                        }
                        else {
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)),
                                                   expr_from_const(new_const(INT_TYPE, (yyvsp[(4) - (4)].ival))));
                        }
                    ;}
    break;

  case 129:
#line 1064 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].dval) == 0) {
                            /* $N0 = set 0.0 -> null $N0 */
                            set_instr(lexer, "null");
                            push_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                        }
                        else {
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)),
                                                   expr_from_const(new_const(NUM_TYPE, (yyvsp[(4) - (4)].dval))));
                        }
                    ;}
    break;

  case 130:
#line 1077 "pir.y"
    {
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)),
                                               expr_from_const(new_const(STRING_TYPE, (yyvsp[(4) - (4)].sval))));
                    ;}
    break;

  case 131:
#line 1083 "pir.y"
    {
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)), (yyvsp[(4) - (4)].expr));
                    ;}
    break;

  case 132:
#line 1088 "pir.y"
    {
                        if (targets_equal((yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ)))
                            /* $I0 = set $I0 -> delete */
                            set_instr(lexer, "nop");
                        else {
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)), expr_from_target((yyvsp[(4) - (4)].targ)));
                        }
                    ;}
    break;

  case 134:
#line 1127 "pir.y"
    {
                        if (((yyvsp[(4) - (4)].ival) == 1) && (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) == OP_SUB))) {
                            /* add $I0, 1 -> inc $I0 */
                            set_instr(lexer, opnames[(yyvsp[(1) - (4)].ival) + 1]);
                            push_operand(lexer, expr_from_target((yyvsp[(2) - (4)].targ)));
                        }
                        else if (((yyvsp[(4) - (4)].ival) == 1) && (((yyvsp[(1) - (4)].ival) == OP_MUL) || ((yyvsp[(1) - (4)].ival) == OP_DIV) || ((yyvsp[(1) - (4)].ival) == OP_FDIV))) {
                            /* mul $N0, 1 -> delete */
                            set_instr(lexer, "nop");
                        }
                        else if (((yyvsp[(4) - (4)].ival) == 0) && (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) = OP_SUB))) {
                            /* add $I0, 0 -> delete */
                            set_instr(lexer, "nop");
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(1) - (4)].ival)]);
                            add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)),
                                                   expr_from_const(new_const(INT_TYPE, (yyvsp[(4) - (4)].ival))));
                        }
                    ;}
    break;

  case 135:
#line 1148 "pir.y"
    {
                        /* add $I0, 10, 20 -> set $I0, 30 */
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)),
                                               expr_from_const(fold_i_i(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].ival))));

                    ;}
    break;

  case 136:
#line 1156 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].dval) == 0) {
                            if (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) == OP_SUB)) {
                                /* add $N0, 0.0 -> delete */
                                set_instr(lexer, "nop");
                            }
                            else if ((yyvsp[(1) - (4)].ival) == OP_MUL) {
                                /* mul $N0, 0.0 -> null $N0 */
                                set_instr(lexer, "null");
                                push_operand(lexer, expr_from_target((yyvsp[(2) - (4)].targ)));
                            }
                            else { /* $1 == OP_DIV || OP_FDIV */
                                yyerror(yyscanner, lexer, "cannot divide by 0.0!");
                            }
                        }
                        else if ((yyvsp[(4) - (4)].dval) == 1.0) {
                            if (((yyvsp[(1) - (4)].ival) == OP_MUL) || ((yyvsp[(1) - (4)].ival) == OP_DIV) || ((yyvsp[(1) - (4)].ival) == OP_FDIV))
                                /* mul $N0, 1.0 -> delete */
                                set_instr(lexer, "nop");
                            else if (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) == OP_SUB)) {
                                /* add $N0, 1.0 -> inc $N0 */
                                set_instr(lexer, opnames[(yyvsp[(1) - (4)].ival) + 1]);
                                push_operand(lexer, expr_from_target((yyvsp[(2) - (4)].targ)));
                            }
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(1) - (4)].ival)]);
                            add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)),
                                                   expr_from_const(new_const(NUM_TYPE, (yyvsp[(4) - (4)].dval))));
                        }
                    ;}
    break;

  case 137:
#line 1188 "pir.y"
    {
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)),
                                               expr_from_const(fold_i_n(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].dval))));
                    ;}
    break;

  case 138:
#line 1194 "pir.y"
    {
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)),
                                               expr_from_const(fold_n_n(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].dval))));
                    ;}
    break;

  case 139:
#line 1200 "pir.y"
    {
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)),
                                               expr_from_const(fold_n_i(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].ival))));
                    ;}
    break;

  case 140:
#line 1206 "pir.y"
    {
                        if ((yyvsp[(4) - (6)].ival) == 0) {
                            if (((yyvsp[(1) - (6)].ival) == OP_ADD) || ((yyvsp[(1) - (6)].ival) == OP_SUB)) {
                                /* add $N0, 0, $N1 -> set $N0, $N1 */
                                if (targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ)))
                                    /* set $N0, $N0 -> delete */
                                    set_instr(lexer, "nop");
                                else {
                                    /* set $N0, $N1 */
                                    set_instr(lexer, "set");
                                    add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)),
                                                           expr_from_target((yyvsp[(6) - (6)].targ)));
                                }
                            }
                            else if (((yyvsp[(1) - (6)].ival) == OP_MUL) || ((yyvsp[(1) - (6)].ival) == OP_DIV) || ((yyvsp[(1) - (6)].ival) == OP_FDIV)) {
                                /* mul $N0, 0, $N1  -> set $N0, 0 -> null $N0 */
                                /* div $N0, 0, $N1  -> set $N0, 0 -> null $N0 */
                                /* fdiv $N0, 0, $N1 -> set $N0, 0 -> null $N0 */
                                set_instr(lexer, "null");
                                push_operand(lexer, expr_from_target((yyvsp[(2) - (6)].targ)));
                            }
                        }
                        else if (((yyvsp[(4) - (6)].ival) == 1) && ((yyvsp[(1) - (6)].ival) == OP_MUL)) {
                            /* mul $N0, 1, $N1 -> set $N0, $N1 */
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(6) - (6)].targ)));
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival)]);
                            add_operands(lexer, 3, expr_from_target((yyvsp[(2) - (6)].targ)),
                                                   expr_from_const(new_const(INT_TYPE, (yyvsp[(4) - (6)].ival))),
                                                   expr_from_target((yyvsp[(6) - (6)].targ)));
                        }
                    ;}
    break;

  case 141:
#line 1241 "pir.y"
    {
                        if (((yyvsp[(4) - (6)].dval) == 1.0) && ((yyvsp[(1) - (6)].ival) == OP_MUL)) {
                            /* mul $N0, 1.0, $N1 -> set $N0, $N1 */

                            if (targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ)))
                                /* mul $N0, 1.0, $N0 -> delete */
                                set_instr(lexer, "nop");
                            else {
                                set_instr(lexer, "set");
                                add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(6) - (6)].targ)));
                            }
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival)]);
                            add_operands(lexer, 3, expr_from_target((yyvsp[(2) - (6)].targ)),
                                                   expr_from_const(new_const(NUM_TYPE, (yyvsp[(4) - (6)].dval))),
                                                   expr_from_target((yyvsp[(6) - (6)].targ)));
                        }
                    ;}
    break;

  case 142:
#line 1261 "pir.y"
    {
                        set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival)]);
                        if (targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ)))
                            /* op $N0, $N0, $N1 -> op $N0, $N1 */
                            add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)),
                                                   expr_from_target((yyvsp[(6) - (6)].targ)));
                        else
                            add_operands(lexer, 3, expr_from_target((yyvsp[(2) - (6)].targ)),
                                                   expr_from_target((yyvsp[(4) - (6)].targ)),
                                                   expr_from_target((yyvsp[(6) - (6)].targ)));

                    ;}
    break;

  case 143:
#line 1274 "pir.y"
    {
                        int equal = targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ));
                        if ((yyvsp[(6) - (6)].dval) == 1.0) {
                            if (((yyvsp[(1) - (6)].ival) == OP_MUL) || ((yyvsp[(1) - (6)].ival) == OP_DIV) || ((yyvsp[(1) - (6)].ival) == OP_FDIV)) {
                                if (equal)
                                    /* mul $N0, $N0, 1.0 -> mul $N0, 1.0 -> delete*/
                                    set_instr(lexer, "nop");
                                else {
                                    /* mul $N0, $N1, 1.0 -> set $N0, $N1 */
                                    set_instr(lexer, "set");
                                    add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(4) - (6)].targ)));
                                }
                            }
                            else if (equal && (((yyvsp[(1) - (6)].ival) == OP_ADD) || ((yyvsp[(1) - (6)].ival) == OP_SUB))) {
                                /* add $I0, $I0, 1.0 */
                                set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival) + 1]);
                                push_operand(lexer, expr_from_target((yyvsp[(2) - (6)].targ)));
                            }
                            else {
                                /* add $N0, $N1, 1.0 */
                                set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival)]);
                                add_operands(lexer, 3, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(4) - (6)].targ)),
                                                       expr_from_const(new_const(NUM_TYPE, (yyvsp[(6) - (6)].dval))));
                            }
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival)]);
                            add_operands(lexer, 3, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(4) - (6)].targ)),
                                                   expr_from_const(new_const(NUM_TYPE, (yyvsp[(6) - (6)].dval))));
                        }
                    ;}
    break;

  case 144:
#line 1306 "pir.y"
    {
                        int equal = targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ));

                        if ((yyvsp[(6) - (6)].ival) == 1) {
                            if (((yyvsp[(1) - (6)].ival) == OP_MUL) || ((yyvsp[(1) - (6)].ival) == OP_DIV) || ((yyvsp[(1) - (6)].ival) == OP_FDIV)) {
                                if (equal)
                                    /* mul $N0, $N0, 1 -> mul $N0, 1 -> delete */
                                    set_instr(lexer, "nop");
                                else {
                                    /* mul $N0, $N1, 1 -> set $N0, $N1 */
                                    set_instr(lexer, "set");
                                    add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(4) - (6)].targ)));
                                }
                            }
                            else if (equal && (((yyvsp[(1) - (6)].ival) == OP_ADD) || ((yyvsp[(1) - (6)].ival) == OP_SUB))) {
                                /* add $I0, $I0, 1 -> inc $I0 */
                                set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival) + 1]);
                                push_operand(lexer, expr_from_target((yyvsp[(2) - (6)].targ)));
                            }
                            else {
                                set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival)]);
                                add_operands(lexer, 3, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(4) - (6)].targ)),
                                                       expr_from_const(new_const(INT_TYPE, (yyvsp[(6) - (6)].ival))));
                            }
                        }
                        else if (((yyvsp[(6) - (6)].ival) == 0) && (((yyvsp[(1) - (6)].ival) == OP_ADD) || ((yyvsp[(1) - (6)].ival) == OP_SUB))) {
                            if (equal)
                                /* add $I0, $I0, 0 -> add $I0, 0 -> delete */
                                set_instr(lexer, "nop");
                            else {
                                set_instr(lexer, "set");
                                add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(4) - (6)].targ)));
                            }
                        }
                        else if ((yyvsp[(6) - (6)].ival) == 0) {
                            if ((yyvsp[(1) - (6)].ival) == OP_MUL) {
                                /* mul $N0, $N1, 0 -> set $N0, 0 -> null $N0 */
                                set_instr(lexer, "null");
                                push_operand(lexer, expr_from_target((yyvsp[(2) - (6)].targ)));
                            }
                            else  /* $1 == OP_DIV || $1 == OP_FDIV */
                                yyerror(yyscanner, lexer, "cannot divide by 0");

                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(1) - (6)].ival)]);
                            if (equal)
                                add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (6)].targ)),
                                                       expr_from_const(new_const(INT_TYPE, (yyvsp[(6) - (6)].ival))));
                            else
                                add_operands(lexer, 3, expr_from_target((yyvsp[(2) - (6)].targ)), expr_from_target((yyvsp[(4) - (6)].targ)),
                                                       expr_from_const(new_const(INT_TYPE, (yyvsp[(6) - (6)].ival))));
                        }
                    ;}
    break;

  case 145:
#line 1361 "pir.y"
    {
                        set_instr(lexer, opnames[(yyvsp[(3) - (6)].ival)]);
                        if (targets_equal((yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ)))
                            add_operands(lexer, 3, expr_from_target((yyvsp[(1) - (6)].targ)),
                                                   expr_from_target((yyvsp[(6) - (6)].targ)));
                        else
                            add_operands(lexer, 3, expr_from_target((yyvsp[(1) - (6)].targ)),
                                                   expr_from_target((yyvsp[(4) - (6)].targ)),
                                                   expr_from_target((yyvsp[(6) - (6)].targ)));
                    ;}
    break;

  case 146:
#line 1372 "pir.y"
    {
                        set_instr(lexer, opnames[(yyvsp[(3) - (6)].ival)]);
                        add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (6)].targ)),
                                               expr_from_const(fold_i_i(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].ival))));
                    ;}
    break;

  case 147:
#line 1378 "pir.y"
    {
                        set_instr(lexer, opnames[(yyvsp[(3) - (6)].ival)]);
                        add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (6)].targ)),
                                               expr_from_const(fold_i_n(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].dval))));
                    ;}
    break;

  case 148:
#line 1384 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].ival) == 0 && (((yyvsp[(3) - (4)].ival) == OP_ADD) || ((yyvsp[(3) - (4)].ival) == OP_SUB))) {
                            /* $I0 = add 0 => delete */
                            set_instr(lexer, "nop");
                        }
                        else if ((yyvsp[(4) - (4)].ival) == 1) {
                            if (((yyvsp[(3) - (4)].ival) == OP_MUL) || ((yyvsp[(3) - (4)].ival) == OP_DIV) || ((yyvsp[(3) - (4)].ival) == OP_FDIV))
                                /* $I0 = mul 1 => delete */
                                set_instr(lexer, "nop");
                            else if (((yyvsp[(3) - (4)].ival) == OP_ADD) || ((yyvsp[(3) - (4)].ival) == OP_SUB)) {
                                /* $I0 = add 1 -> inc $I0 */
                                set_instr(lexer, opnames[(yyvsp[(3) - (4)].ival) + 1]);
                                push_operand(lexer, expr_from_target((yyvsp[(1) - (4)].targ)));
                            }
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(3) - (4)].ival)]);
                            add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)),
                                                   expr_from_const(new_const(INT_TYPE, (yyvsp[(4) - (4)].ival))));
                        }
                    ;}
    break;

  case 149:
#line 1406 "pir.y"
    {
                        /* $I0 = add 0 -> delete */
                        if ((yyvsp[(4) - (4)].dval) == 0 && (((yyvsp[(3) - (4)].ival) == OP_ADD) || ((yyvsp[(3) - (4)].ival) == OP_SUB))) {
                            set_instr(lexer, "nop");
                        }
                        /* $I0 = mul 1 -> delete */
                        else if ((yyvsp[(4) - (4)].dval) == 1 && (((yyvsp[(3) - (4)].ival) == OP_MUL) || ((yyvsp[(3) - (4)].ival) == OP_DIV) || ((yyvsp[(3) - (4)].ival) == OP_FDIV))) {
                            set_instr(lexer, "nop");
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(3) - (4)].ival)]);
                            add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)),
                                                   expr_from_const(new_const(NUM_TYPE, (yyvsp[(4) - (4)].dval))));
                        }
                    ;}
    break;

  case 150:
#line 1422 "pir.y"
    {
                        /* $N0 = add 1.5, 10 -> set $N0, 15 */
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (6)].targ)),
                                               expr_from_const(fold_n_i(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].ival))));
                    ;}
    break;

  case 151:
#line 1429 "pir.y"
    {
                        /* $I0 = add 1, 2 -> $I0 = 3 */
                        set_instr(lexer, "set");
                        add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (6)].targ)),
                                               expr_from_const(fold_n_n(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].dval))));
                    ;}
    break;

  case 152:
#line 1436 "pir.y"
    {
                        if (((yyvsp[(4) - (6)].dval) == 1.0) && ((yyvsp[(3) - (6)].ival) == OP_MUL)) {
                            /* $N0 = mul 1, $N1 -> set $N0, $N1 */
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (6)].targ)), expr_from_target((yyvsp[(6) - (6)].targ)));
                        }
                        else if (((yyvsp[(4) - (6)].dval) == 0) && (((yyvsp[(3) - (6)].ival) == OP_ADD) || ((yyvsp[(3) - (6)].ival) == OP_SUB))) {
                            /* $N0 = add 0, $N1 -> set $N0, $N1 */
                            set_instr(lexer, "set");
                            add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (6)].targ)), expr_from_target((yyvsp[(6) - (6)].targ)));
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(3) - (6)].ival)]);
                            add_operands(lexer, 3, expr_from_target((yyvsp[(1) - (6)].targ)),
                                                   expr_from_const(new_const(NUM_TYPE, (yyvsp[(4) - (6)].dval))),
                                                   expr_from_target((yyvsp[(6) - (6)].targ)));
                        }
                    ;}
    break;

  case 153:
#line 1455 "pir.y"
    {
                        int equal = targets_equal((yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ));
                        if (((yyvsp[(6) - (6)].dval) == 1.0) && (((yyvsp[(3) - (6)].ival) == OP_MUL) || ((yyvsp[(3) - (6)].ival) == OP_DIV) || ((yyvsp[(3) - (6)].ival) == OP_FDIV))) {
                            /* $N0 = mul $N1, 1  -> set $N0, $N1 */
                            /* $N0 = div $N1, 1  -> set $N0, $N1 */
                            /* $N0 = fdiv $N1, 1 -> set $N0, $N1 */
                            if (equal)
                                set_instr(lexer, "nop");
                            else {
                                set_instr(lexer, "set");
                                add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (6)].targ)), expr_from_target((yyvsp[(4) - (6)].targ)));
                            }
                        }
                        else {
                            set_instr(lexer, opnames[(yyvsp[(3) - (6)].ival)]);
                            if (equal)
                                /* add $N0, $N0, 42.0 -> add $N0, 42.0 */
                                add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (6)].targ)),
                                                       expr_from_const(new_const(NUM_TYPE, (yyvsp[(6) - (6)].dval))));
                            else
                                /* add $N0, $N1, 42.0 */
                                add_operands(lexer, 3, expr_from_target((yyvsp[(1) - (6)].targ)),
                                                       expr_from_target((yyvsp[(4) - (6)].targ)),
                                                       expr_from_const(new_const(NUM_TYPE, (yyvsp[(6) - (6)].dval))));
                        }
                    ;}
    break;

  case 154:
#line 1483 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 155:
#line 1484 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 156:
#line 1485 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 157:
#line 1486 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 158:
#line 1487 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 160:
#line 1495 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null");
                           add_operands(lexer, 2, (yyvsp[(3) - (5)].expr), expr_from_ident((yyvsp[(5) - (5)].sval)));
                         ;}
    break;

  case 161:
#line 1500 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)), expr_from_ident((yyvsp[(4) - (4)].sval)));
                         ;}
    break;

  case 162:
#line 1505 "pir.y"
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

  case 163:
#line 1533 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                           (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                         ;}
    break;

  case 164:
#line 1539 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(INT_TYPE, (yyvsp[(1) - (3)].ival))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 165:
#line 1547 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(NUM_TYPE, (yyvsp[(1) - (3)].dval))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 166:
#line 1555 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (3)].sval))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 167:
#line 1563 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 168:
#line 1565 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 169:
#line 1567 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 170:
#line 1569 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 171:
#line 1571 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 172:
#line 1573 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].ival) ? 1 : 0; ;}
    break;

  case 173:
#line 1575 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].dval) ? 1 : 0; ;}
    break;

  case 174:
#line 1577 "pir.y"
    { (yyval.ival) = evaluate_s((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 175:
#line 1580 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 176:
#line 1581 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 179:
#line 1589 "pir.y"
    {
                           set_instr(lexer, "branch");
                           push_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 180:
#line 1596 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 181:
#line 1600 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 182:
#line 1602 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 183:
#line 1606 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 184:
#line 1609 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 185:
#line 1610 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 186:
#line 1614 "pir.y"
    {
                           if ((yyvsp[(4) - (5)].targ)->type == PMC_TYPE)
                               set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                           else
                               yyerror(yyscanner, lexer,
                                       "second argument to .lex must be of type PMC");
                         ;}
    break;

  case 189:
#line 1635 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 190:
#line 1642 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 191:
#line 1644 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 192:
#line 1648 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 193:
#line 1650 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 194:
#line 1654 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 195:
#line 1658 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 196:
#line 1660 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 197:
#line 1663 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 198:
#line 1667 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 199:
#line 1669 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 200:
#line 1673 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 201:
#line 1675 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 202:
#line 1679 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 203:
#line 1681 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 204:
#line 1685 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 205:
#line 1687 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 207:
#line 1695 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 208:
#line 1697 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 209:
#line 1699 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 212:
#line 1707 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 213:
#line 1714 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 214:
#line 1721 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 215:
#line 1723 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 218:
#line 1731 "pir.y"
    {
                              symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                              /* if the symbol was found, its type must be a PMC;
                               * else, if the symbol was not found, it's a global identifier
                               * referring to some other sub. We don't check that during
                               * the parsing phase.
                               */
                              if (sym && sym->type != PMC_TYPE) {
                                  yyerror(yyscanner, lexer,
                                          "invokable identifier must be of type PMC!");
                              }
                              else { /* identifier is global; don't check now. */ }

                              (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval));
                            ;}
    break;

  case 219:
#line 1747 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 220:
#line 1751 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 221:
#line 1753 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 222:
#line 1758 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 223:
#line 1762 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 224:
#line 1764 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 225:
#line 1768 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 226:
#line 1770 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 227:
#line 1774 "pir.y"
    {
                              (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 228:
#line 1781 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 229:
#line 1783 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 230:
#line 1787 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 231:
#line 1789 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 232:
#line 1791 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 233:
#line 1793 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 234:
#line 1795 "pir.y"
    {
                              (yyval.ival) = TARGET_FLAG_NAMED;
                              set_alias(lexer, (yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 239:
#line 1813 "pir.y"
    {
                              (yyval.fixme) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 240:
#line 1818 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 241:
#line 1822 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 242:
#line 1829 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 243:
#line 1833 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 244:
#line 1835 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 245:
#line 1839 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 246:
#line 1841 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 249:
#line 1849 "pir.y"
    {
                              (yyval.argm) = (yyvsp[(3) - (3)].argm);
                              lexer->curarg->alias = (yyvsp[(1) - (3)].sval);
                              SET_FLAG(lexer->curarg->flags, ARG_FLAG_NAMED);
                            ;}
    break;

  case 250:
#line 1857 "pir.y"
    {
                              (yyval.argm) = (yyvsp[(1) - (2)].argm);
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 251:
#line 1864 "pir.y"
    { (yyval.argm) = lexer->curarg = new_argument((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 252:
#line 1870 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 253:
#line 1879 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 254:
#line 1886 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 255:
#line 1888 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 256:
#line 1893 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 257:
#line 1895 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 258:
#line 1900 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 259:
#line 1904 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 260:
#line 1906 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 261:
#line 1910 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 262:
#line 1912 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 263:
#line 1916 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 264:
#line 1921 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 265:
#line 1923 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 266:
#line 1927 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 267:
#line 1929 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               lexer->curarg->alias = (yyvsp[(2) - (2)].sval);
                             ;}
    break;

  case 268:
#line 1936 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 269:
#line 1938 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 270:
#line 1942 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 274:
#line 1953 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 275:
#line 1957 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), GLOBALCONST); ;}
    break;

  case 276:
#line 1961 "pir.y"
    { (yyval.constval) = new_named_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 277:
#line 1963 "pir.y"
    { (yyval.constval) = new_named_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 278:
#line 1965 "pir.y"
    { (yyval.constval) = new_named_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 279:
#line 1967 "pir.y"
    { (yyval.constval) = new_named_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 280:
#line 1975 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 281:
#line 1976 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 282:
#line 1979 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 283:
#line 1980 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 284:
#line 1981 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 285:
#line 1984 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 286:
#line 1985 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 287:
#line 1986 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 288:
#line 1987 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 289:
#line 1988 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 290:
#line 1989 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 291:
#line 1992 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 292:
#line 1993 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 293:
#line 1994 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 294:
#line 1995 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 295:
#line 2000 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 296:
#line 2003 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 297:
#line 2004 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 298:
#line 2005 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 299:
#line 2006 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 300:
#line 2007 "pir.y"
    { /* find the symbol; if it's not there, emit an error */
                           symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                           if (sym == NULL)
                               yyerror(yyscanner, lexer, "symbol not declared!");
                           else
                               (yyval.targ) = new_target(sym->type, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 303:
#line 2020 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 304:
#line 2021 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 305:
#line 2022 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 306:
#line 2025 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 307:
#line 2026 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 308:
#line 2027 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 309:
#line 2028 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 310:
#line 2029 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 311:
#line 2030 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 312:
#line 2031 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 313:
#line 2032 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 314:
#line 2033 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 315:
#line 2034 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 316:
#line 2035 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 317:
#line 2036 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 318:
#line 2037 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 319:
#line 2038 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 320:
#line 2039 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 321:
#line 2040 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 322:
#line 2041 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 323:
#line 2042 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 324:
#line 2043 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 325:
#line 2044 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 326:
#line 2045 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 327:
#line 2046 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 328:
#line 2047 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 329:
#line 2053 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 330:
#line 2054 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 331:
#line 2055 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 332:
#line 2056 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 333:
#line 2057 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 334:
#line 2058 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 335:
#line 2059 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 336:
#line 2060 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 337:
#line 2061 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 338:
#line 2062 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 339:
#line 2063 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 340:
#line 2064 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 341:
#line 2067 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 342:
#line 2068 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4382 "pirparser.c"
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


#line 2071 "pir.y"


#include <math.h>
#include <assert.h>

/*

=head1 Constant folding routines.

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
                syntax_error(yyscanner, "cannot divide by 0!");
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
            syntax_error(yyscanner, "cannot concatenate operands of type 'int' and 'int'\n");
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
                syntax_error(yyscanner, "cannot divide by 0!");
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
            syntax_error(yyscanner, "cannot apply binary operator to types 'num' and 'int'");
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
                syntax_error(yyscanner, "cannot divide by 0!");
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
            syntax_error(yyscanner, "cannot apply binary operator to types 'int' and 'num'");
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
                syntax_error(yyscanner, "cannot divide by 0"); /* throw exception ? */
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
            syntax_error(yyscanner, "cannot apply % operator to arguments of type number");
            break;
        case OP_OR:
            result = (a || b);
            break;
        case OP_AND:
            result = (a && b);
            break;
        case OP_FDIV:
            if (b == 0)
                syntax_error(yyscanner, "cannot divide by 0");
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
            syntax_error(yyscanner, "cannot apply % operator to arguments of type number");
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

/*

=item C<static int
evaluate_n_n(double a, pir_rel_operator op, double b)>

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

static int
evaluate_s_s(char *a, pir_rel_operator op, char *b) {
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
evaluate_s(char *s) {
    int strlen_s = strlen(s);

    if (strlen_s > 0) {
        if ((strcmp(s, "0") == 0)  || (strcmp(s, ".0") == 0)
        ||  (strcmp(s, "0.") == 0) || (strcmp(s, "0.0") == 0))
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


