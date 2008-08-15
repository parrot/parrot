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
     TK_FLAG_UNIQUE_REG = 351,
     TK_FLAG_NAMED = 352,
     TK_FLAG_SLURPY = 353,
     TK_FLAG_FLAT = 354,
     TK_FLAG_OPTIONAL = 355,
     TK_FLAG_OPT_FLAG = 356,
     TK_FLAG_INVOCANT = 357
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
#define TK_FLAG_UNIQUE_REG 351
#define TK_FLAG_NAMED 352
#define TK_FLAG_SLURPY 353
#define TK_FLAG_FLAT 354
#define TK_FLAG_OPTIONAL 355
#define TK_FLAG_OPT_FLAG 356
#define TK_FLAG_INVOCANT 357




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

=item * the back-end has a built-in vanilla register allocator. Any further optimizations
of register usage can take it from there, without having to worry about declared .locals
and symbolic/PIR registers.

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
6. [done 12/8/8] write vanilla register allocator
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
#line 189 "pir.y"
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
    struct symbol      *sym;
}
/* Line 187 of yacc.c.  */
#line 502 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 515 "pirparser.c"

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
#define YYLAST   658

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  121
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  125
/* YYNRULES -- Number of rules.  */
#define YYNRULES  344
/* YYNRULES -- Number of states.  */
#define YYNSTATES  500

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   358

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   112,     2,     2,     2,   117,   119,     2,
     107,   108,   116,   114,   109,   111,   110,   115,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   106,
       2,   103,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   104,     2,   105,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   118,     2,   113,     2,     2,     2,
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
      95,    96,    97,    98,    99,   100,   101,   102,   120
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
     736,   738,   740,   742,   746,   747,   749,   751,   755,   758,
     759,   762,   764,   766,   768,   770,   773,   775,   777,   779,
     781,   785,   789,   793,   797,   798,   800,   802,   806,   808,
     810,   814,   817,   819,   825,   831,   832,   834,   836,   839,
     843,   844,   846,   848,   851,   855,   856,   859,   861,   864,
     865,   867,   871,   874,   876,   878,   881,   884,   889,   894,
     899,   904,   906,   908,   910,   912,   914,   916,   918,   920,
     922,   924,   926,   928,   930,   932,   934,   936,   938,   940,
     942,   944,   946,   948,   950,   952,   954,   956,   958,   960,
     962,   964,   966,   968,   970,   972,   974,   976,   978,   980,
     982,   984,   986,   988,   990,   992,   994,   996,   998,  1000,
    1002,  1004,  1006,  1008,  1010,  1012,  1014,  1016,  1018,  1020,
    1022,  1024,  1026,  1028,  1030
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     122,     0,    -1,   123,   124,   123,    -1,    -1,     4,    -1,
     125,    -1,   124,     4,   125,    -1,   133,    -1,   232,    -1,
     129,    -1,   127,    -1,   128,    -1,   126,    -1,     7,    39,
      -1,     5,    39,    -1,     6,    39,   103,    39,    -1,    13,
     104,   130,   105,    -1,    -1,   131,    -1,   132,    -1,   131,
     106,   132,    -1,    39,    -1,   134,   136,     4,   139,   145,
       9,    -1,     8,   135,    -1,   241,    -1,    39,    -1,    -1,
     136,   137,    -1,    87,    -1,    84,    -1,    85,    -1,    86,
      -1,    88,    -1,    91,    -1,    93,    -1,    94,    -1,    92,
      -1,    89,   107,   135,   108,    -1,    90,   228,    -1,    95,
     229,    -1,    37,    -1,    46,    -1,    39,    -1,   161,    -1,
     238,    -1,    -1,   139,   140,    -1,    10,   141,   142,     4,
      -1,   238,   241,    -1,    -1,   142,   143,    -1,   206,    -1,
     144,    -1,   102,   107,   138,   108,    -1,    -1,   145,   146,
      -1,    -1,   147,   148,    -1,     3,     4,    -1,     3,   149,
      -1,   149,    -1,   171,    -1,   176,    -1,   177,    -1,   181,
      -1,   230,    -1,   207,    -1,   208,    -1,   182,    -1,   163,
      -1,   154,    -1,   153,    -1,   151,    -1,   168,    -1,   150,
      -1,     1,     4,    -1,   152,     4,    -1,    53,   239,    -1,
     239,   103,    53,    -1,    26,   201,     4,    -1,   155,     4,
      -1,   156,   157,    -1,    46,    -1,    -1,   158,    -1,   159,
      -1,   158,   109,   159,    -1,   235,    -1,   161,    -1,   160,
      -1,   239,   161,    -1,   104,   162,   105,    -1,   235,    -1,
     162,   106,   235,    -1,   164,     4,    -1,   167,    -1,   239,
     103,    40,    -1,   239,   103,    41,    -1,   239,   103,    39,
      -1,   239,   103,   239,    -1,   239,   165,    -1,   239,   103,
     242,   235,    -1,   239,   103,   166,    -1,   239,   103,   239,
     243,    40,    -1,   239,   103,   239,   243,    41,    -1,   239,
     103,   239,   243,    39,    -1,   239,   103,   239,   243,   239,
      -1,   160,   103,   235,    -1,   239,   103,   160,    -1,   239,
     103,   155,    -1,   245,    40,    -1,   245,    41,    -1,   245,
     239,    -1,   244,   235,    -1,    40,   243,   239,    -1,    41,
     243,   239,    -1,    39,   243,   239,    -1,    39,   243,    39,
      -1,    40,   243,    40,    -1,    41,   243,    41,    -1,    40,
     243,    41,    -1,    41,   243,    40,    -1,    31,   239,   109,
     160,    -1,    31,   160,   109,   235,    -1,    31,   239,   109,
     239,    -1,    31,   239,   109,    40,    -1,    31,   239,   109,
      41,    -1,    31,   239,   109,    39,    -1,   239,   103,    31,
      40,    -1,   239,   103,    31,    41,    -1,   239,   103,    31,
      39,    -1,   239,   103,    31,   160,    -1,   239,   103,    31,
     239,    -1,   169,     4,    -1,   170,   239,   109,    40,    -1,
     170,   239,   109,    40,   109,    40,    -1,   170,   239,   109,
      41,    -1,   170,   239,   109,    40,   109,    41,    -1,   170,
     239,   109,    41,   109,    41,    -1,   170,   239,   109,    41,
     109,    40,    -1,   170,   239,   109,    40,   109,   239,    -1,
     170,   239,   109,    41,   109,   239,    -1,   170,   239,   109,
     239,   109,   239,    -1,   170,   239,   109,   239,   109,    41,
      -1,   170,   239,   109,   239,   109,    40,    -1,   239,   103,
     170,   239,   109,   239,    -1,   239,   103,   170,    40,   109,
      40,    -1,   239,   103,   170,    40,   109,    41,    -1,   239,
     103,   170,    40,    -1,   239,   103,   170,    41,    -1,   239,
     103,   170,    41,   109,    40,    -1,   239,   103,   170,    41,
     109,    41,    -1,   239,   103,   170,    41,   109,   239,    -1,
     239,   103,   170,   239,   109,    41,    -1,    32,    -1,    33,
      -1,    34,    -1,    35,    -1,    36,    -1,   172,     4,    -1,
     174,    53,   235,    54,   241,    -1,   174,   239,   175,   241,
      -1,   174,   173,    54,   241,    -1,   239,   237,   235,    -1,
      40,   237,   239,    -1,    41,   237,   239,    -1,    39,   237,
     239,    -1,    40,   237,    40,    -1,    41,   237,    41,    -1,
      40,   237,    41,    -1,    41,   237,    40,    -1,    39,   237,
      39,    -1,    40,    -1,    41,    -1,    39,    -1,    51,    -1,
      52,    -1,    54,    -1,   109,    -1,    54,   241,     4,    -1,
      12,   238,   178,     4,    -1,   179,    -1,   178,   109,   179,
      -1,   241,   180,    -1,    -1,    96,    -1,    11,    39,   109,
     239,     4,    -1,   183,    -1,   192,    -1,    24,     4,   184,
     187,     4,   189,    25,     4,    -1,    -1,   185,    -1,   186,
      -1,   185,   186,    -1,    28,   216,     4,    -1,    27,   199,
     188,    -1,    30,   199,    -1,    14,   199,     4,    15,   198,
      -1,    -1,   109,   199,    -1,    -1,   190,    -1,   191,    -1,
     190,   191,    -1,    29,   204,     4,    -1,   177,    -1,   193,
       4,    -1,   201,   103,   194,    -1,   239,   103,   194,    -1,
     194,    -1,   196,    -1,   195,    -1,   199,   110,   198,   211,
      -1,   197,   211,    -1,   199,    -1,    39,    -1,   199,    -1,
     200,    -1,    37,    -1,    38,    -1,    42,    -1,    39,    -1,
      44,    -1,   107,   202,   108,    -1,    -1,   203,    -1,   204,
      -1,   203,   109,   204,    -1,   239,   205,    -1,    -1,   205,
     206,    -1,   100,    -1,   101,    -1,    98,    -1,    96,    -1,
      97,   228,    -1,   209,    -1,   218,    -1,   210,    -1,   219,
      -1,    18,   211,     4,    -1,    18,   194,     4,    -1,    19,
     211,     4,    -1,   107,   212,   108,    -1,    -1,   213,    -1,
     214,    -1,   213,   109,   214,    -1,   216,    -1,   215,    -1,
      39,    55,   217,    -1,   217,   226,    -1,   235,    -1,    22,
       4,   223,    23,     4,    -1,    20,     4,   220,    21,     4,
      -1,    -1,   221,    -1,   222,    -1,   221,   222,    -1,    19,
     216,     4,    -1,    -1,   224,    -1,   225,    -1,   224,   225,
      -1,    18,   216,     4,    -1,    -1,   226,   227,    -1,    99,
      -1,    97,   228,    -1,    -1,   229,    -1,   107,    39,   108,
      -1,   231,     4,    -1,   232,    -1,   233,    -1,    17,   234,
      -1,    16,   234,    -1,    47,   241,   103,    40,    -1,    48,
     241,   103,    41,    -1,    49,   241,   103,    39,    -1,    50,
     241,   103,    39,    -1,   239,    -1,   236,    -1,    39,    -1,
      40,    -1,    41,    -1,    56,    -1,    57,    -1,    58,    -1,
      59,    -1,    61,    -1,    60,    -1,    47,    -1,    48,    -1,
      49,    -1,    50,    -1,   240,    -1,    42,    -1,    43,    -1,
      45,    -1,    44,    -1,    38,    -1,    37,    -1,    37,    -1,
      46,    -1,   111,    -1,   112,    -1,   113,    -1,   114,    -1,
     111,    -1,   115,    -1,   116,    -1,   117,    -1,   118,    -1,
     119,    -1,   113,    -1,   120,    -1,    69,    -1,    62,    -1,
      63,    -1,    64,    -1,    66,    -1,    67,    -1,    65,    -1,
      68,    -1,    57,    -1,    59,    -1,    58,    -1,    61,    -1,
      60,    -1,    56,    -1,    75,    -1,    76,    -1,    77,    -1,
      78,    -1,    81,    -1,    79,    -1,    80,    -1,    82,    -1,
      83,    -1,    71,    -1,    72,    -1,    70,    -1,    73,    -1,
      74,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   439,   439,   444,   445,   448,   449,   452,   453,   454,
     455,   456,   457,   460,   466,   470,   477,   482,   483,   487,
     489,   493,   500,   506,   510,   511,   514,   515,   518,   520,
     522,   524,   526,   528,   530,   532,   534,   536,   538,   540,
     544,   545,   546,   547,   548,   551,   552,   555,   558,   563,
     564,   568,   569,   572,   578,   579,   582,   582,   586,   588,
     590,   593,   594,   595,   596,   597,   598,   599,   600,   601,
     602,   603,   604,   605,   606,   610,   620,   623,   625,   629,
     633,   636,   639,   643,   644,   647,   648,   651,   653,   655,
     659,   666,   670,   672,   677,   680,   681,   688,   696,   698,
     706,   708,   710,   712,   742,   780,   789,   796,   798,   800,
     804,   817,   819,   821,   836,   838,   840,   842,   844,   846,
     848,   850,   882,   884,   886,   894,   902,   909,   911,   918,
     925,   927,   929,   939,   965,   980,   982,  1005,  1007,  1009,
    1011,  1033,  1046,  1055,  1075,  1110,  1117,  1119,  1121,  1135,
    1146,  1151,  1156,  1167,  1188,  1189,  1190,  1191,  1192,  1196,
    1199,  1201,  1203,  1230,  1235,  1240,  1245,  1250,  1252,  1254,
    1256,  1258,  1260,  1262,  1264,  1268,  1269,  1272,  1273,  1276,
    1280,  1284,  1286,  1290,  1294,  1295,  1298,  1311,  1312,  1315,
    1327,  1328,  1332,  1334,  1338,  1342,  1344,  1346,  1352,  1353,
    1358,  1359,  1363,  1365,  1369,  1371,  1375,  1379,  1381,  1383,
    1387,  1388,  1391,  1398,  1405,  1407,  1411,  1412,  1415,  1417,
    1425,  1429,  1431,  1436,  1441,  1442,  1446,  1448,  1452,  1460,
    1461,  1465,  1467,  1469,  1471,  1473,  1480,  1481,  1484,  1485,
    1488,  1493,  1497,  1504,  1509,  1510,  1514,  1516,  1520,  1521,
    1524,  1532,  1539,  1543,  1552,  1562,  1563,  1568,  1570,  1575,
    1580,  1581,  1585,  1587,  1591,  1597,  1598,  1602,  1604,  1612,
    1613,  1617,  1621,  1624,  1625,  1628,  1632,  1636,  1638,  1640,
    1642,  1651,  1652,  1655,  1656,  1657,  1660,  1661,  1662,  1663,
    1664,  1665,  1668,  1669,  1670,  1671,  1679,  1682,  1683,  1684,
    1685,  1686,  1687,  1697,  1698,  1701,  1702,  1703,  1706,  1707,
    1708,  1709,  1710,  1711,  1712,  1713,  1714,  1715,  1716,  1717,
    1718,  1719,  1720,  1721,  1722,  1723,  1724,  1725,  1726,  1727,
    1728,  1734,  1735,  1736,  1737,  1738,  1739,  1740,  1741,  1742,
    1743,  1744,  1745,  1748,  1749
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
  "\":immediate\"", "\":lexid\"", "\":unique_reg\"", "\":named\"",
  "\":slurpy\"", "\":flat\"", "\":optional\"", "\":opt_flag\"",
  "\":invocant\"", "'='", "'['", "']'", "';'", "'('", "')'", "','", "'.'",
  "'-'", "'!'", "'~'", "'+'", "'/'", "'*'", "'%'", "'|'", "'&'", "\"**\"",
  "$accept", "TOP", "opt_nl", "pir_chunks", "pir_chunk", "loadlib",
  "hll_specifier", "hll_mapping", "namespace_decl", "opt_namespace",
  "namespace", "namespace_slice", "sub_def", "sub_head", "sub_id",
  "sub_flags", "sub_flag", "multi_type", "parameters", "parameter",
  "param", "param_flags", "param_flag", "invocant_param", "instructions",
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
     355,   356,   357,    61,    91,    93,    59,    40,    41,    44,
      46,    45,    33,   126,    43,    47,    42,    37,   124,    38,
     358
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   121,   122,   123,   123,   124,   124,   125,   125,   125,
     125,   125,   125,   126,   127,   128,   129,   130,   130,   131,
     131,   132,   133,   134,   135,   135,   136,   136,   137,   137,
     137,   137,   137,   137,   137,   137,   137,   137,   137,   137,
     138,   138,   138,   138,   138,   139,   139,   140,   141,   142,
     142,   143,   143,   144,   145,   145,   147,   146,   148,   148,
     148,   149,   149,   149,   149,   149,   149,   149,   149,   149,
     149,   149,   149,   149,   149,   150,   151,   152,   152,   153,
     154,   155,   156,   157,   157,   158,   158,   159,   159,   159,
     160,   161,   162,   162,   163,   164,   164,   164,   164,   164,
     164,   164,   164,   164,   164,   164,   164,   164,   164,   164,
     165,   165,   165,   165,   166,   166,   166,   166,   166,   166,
     166,   166,   167,   167,   167,   167,   167,   167,   167,   167,
     167,   167,   167,   168,   169,   169,   169,   169,   169,   169,
     169,   169,   169,   169,   169,   169,   169,   169,   169,   169,
     169,   169,   169,   169,   170,   170,   170,   170,   170,   171,
     172,   172,   172,   173,   173,   173,   173,   173,   173,   173,
     173,   173,   173,   173,   173,   174,   174,   175,   175,   176,
     177,   178,   178,   179,   180,   180,   181,   182,   182,   183,
     184,   184,   185,   185,   186,   187,   187,   187,   188,   188,
     189,   189,   190,   190,   191,   191,   192,   193,   193,   193,
     194,   194,   195,   196,   197,   197,   198,   198,   199,   199,
     199,   200,   200,   201,   202,   202,   203,   203,   204,   205,
     205,   206,   206,   206,   206,   206,   207,   207,   208,   208,
     209,   209,   210,   211,   212,   212,   213,   213,   214,   214,
     215,   216,   217,   218,   219,   220,   220,   221,   221,   222,
     223,   223,   224,   224,   225,   226,   226,   227,   227,   228,
     228,   229,   230,   231,   231,   232,   233,   234,   234,   234,
     234,   235,   235,   236,   236,   236,   237,   237,   237,   237,
     237,   237,   238,   238,   238,   238,   239,   240,   240,   240,
     240,   240,   240,   241,   241,   242,   242,   242,   243,   243,
     243,   243,   243,   243,   243,   243,   243,   243,   243,   243,
     243,   243,   243,   243,   243,   243,   243,   243,   243,   243,
     243,   244,   244,   244,   244,   244,   244,   244,   244,   244,
     244,   244,   244,   245,   245
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     2,     2,     4,     4,     0,     1,     1,
       3,     1,     6,     2,     1,     1,     0,     2,     1,     1,
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
       1,     1,     1,     3,     0,     1,     1,     3,     2,     0,
       2,     1,     1,     1,     1,     2,     1,     1,     1,     1,
       3,     3,     3,     3,     0,     1,     1,     3,     1,     1,
       3,     2,     1,     5,     5,     0,     1,     1,     2,     3,
       0,     1,     1,     2,     3,     0,     2,     1,     2,     0,
       1,     3,     2,     1,     1,     2,     2,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     3,     5,    12,    10,    11,     9,     7,    26,     8,
      14,     0,    13,   303,    25,   304,    23,    24,    17,     0,
       0,     0,     0,   275,     4,     2,     0,     0,    21,     0,
      18,    19,     0,     0,     0,     0,     6,    45,    29,    30,
      31,    28,    32,     0,   269,    33,    36,    34,    35,     0,
      27,    15,    16,     0,     0,     0,     0,     0,    54,     0,
       0,    38,   270,    39,    20,   277,   278,   279,   280,     0,
      46,    56,     0,     0,   292,   293,   294,   295,    49,     0,
      22,    55,     0,    37,   271,     0,    48,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   154,
     155,   156,   157,   158,   302,   301,   215,   297,   298,   300,
     299,    82,   175,   176,     0,     0,   224,    57,    60,    74,
      72,     0,    71,    70,     0,    83,     0,    69,     0,    95,
      73,     0,     0,    61,     0,     0,    62,    63,    64,    68,
     187,   188,     0,   209,   211,   210,     0,   214,     0,    66,
      67,   236,   238,   237,   239,    65,     0,   273,   274,     0,
     296,    47,   234,   269,   233,   231,   232,     0,    50,    52,
      51,    75,    58,    59,     0,     0,   276,   218,   219,   220,
     244,     0,     0,     0,   255,   260,   190,     0,   302,   301,
     297,     0,     0,    77,     0,     0,   225,   226,   229,    76,
      80,   283,   284,   285,     0,    81,    84,    85,    89,    88,
      87,   282,   281,     0,    94,   133,     0,   159,   174,   172,
     173,     0,     0,     0,   206,   213,     0,     0,   272,   342,
     340,   341,   343,   344,   331,   332,   333,   334,   336,   337,
     335,   338,   339,     0,    90,   100,     0,     0,   235,     0,
       0,     0,   181,   184,   283,     0,   245,   246,   249,   248,
     265,   252,   281,   241,   240,   242,     0,     0,   256,   257,
       0,     0,   261,   262,     0,     0,   191,   192,    79,     0,
       0,   179,   223,     0,   228,     0,    92,     0,   107,     0,
     286,   287,   288,   289,   291,   290,     0,     0,     0,     0,
       0,   177,   178,     0,     0,   221,   222,     0,   216,   217,
     207,     0,    98,    96,    97,    78,   305,   306,   307,   109,
     108,   102,     0,   208,    99,     0,   113,   110,   111,   112,
      40,    42,    41,     0,    43,    44,     0,   180,     0,   185,
     183,     0,   243,     0,   251,     0,     0,   258,     0,     0,
     263,     0,     0,     0,     0,     0,   193,   123,   127,   125,
     126,   122,   124,   227,   230,    91,     0,    86,   134,   136,
       0,   171,   166,   167,   169,   164,   170,   168,   165,     0,
     162,   161,   163,   212,   130,   128,   129,   131,   132,   330,
     325,   327,   326,   329,   328,   318,   319,   320,   323,   321,
     322,   324,   317,   309,   315,   308,   310,   311,   312,   313,
     314,   316,     0,     0,     0,   148,   149,     0,     0,   101,
      53,   186,   182,   250,   247,   269,   267,   266,   259,   254,
     264,   253,   194,     0,   198,   196,   200,    93,     0,     0,
       0,   160,   117,   116,   118,   120,   114,   121,   119,   115,
       0,     0,     0,   105,   103,   104,   106,   268,     0,     0,
     195,     0,   205,     0,   201,   202,   135,   137,   140,   139,
     138,   141,   144,   143,   142,   146,   147,   150,   151,   152,
     153,   145,     0,   199,     0,     0,   203,   197,   204,   189
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    39,
      40,    41,    17,    18,    26,    36,    60,   343,    68,    80,
      88,    95,   178,   179,    81,    91,    92,   127,   128,   129,
     130,   131,   132,   133,   134,   135,   215,   216,   217,   136,
     254,   295,   137,   138,   255,   331,   139,   140,   141,   142,
     143,   144,   232,   145,   313,   146,   147,   261,   262,   350,
     148,   149,   150,   285,   286,   287,   365,   470,   473,   474,
     475,   151,   152,   153,   154,   155,   156,   317,   157,   319,
     158,   205,   206,   207,   294,   180,   159,   160,   161,   162,
     192,   265,   266,   267,   268,   269,   270,   163,   164,   277,
     278,   279,   281,   282,   283,   354,   437,    71,    72,   165,
     166,    19,   168,    33,   271,   221,   306,    89,   272,   170,
      27,   335,   422,   256,   257
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -426
static const yytype_int16 yypact[] =
{
      35,  -426,    56,    23,  -426,    65,    89,    93,   121,   -52,
     178,   129,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,
    -426,    51,  -426,  -426,  -426,  -426,  -426,  -426,   116,    -4,
      -4,    -4,    -4,  -426,    23,  -426,    54,   124,  -426,    69,
      63,  -426,    67,    82,    83,    85,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,    84,    90,  -426,  -426,  -426,  -426,    90,
    -426,  -426,  -426,   116,   150,   161,   164,   167,   194,   121,
     169,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,   305,
    -426,   200,   103,   114,  -426,  -426,  -426,  -426,  -426,    -4,
    -426,  -426,   257,  -426,  -426,    13,  -426,   219,   364,   216,
     305,   178,   -19,   132,   252,   266,   267,   171,   175,  -426,
    -426,  -426,  -426,  -426,   -53,   -15,  -426,    52,  -426,  -426,
    -426,  -426,  -426,  -426,   175,    -4,   175,  -426,  -426,  -426,
    -426,   276,  -426,  -426,   280,    25,   183,  -426,   283,  -426,
    -426,   293,   175,  -426,   294,   139,  -426,  -426,  -426,  -426,
    -426,  -426,   300,  -426,  -426,  -426,   132,   162,   202,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,   302,  -426,  -426,   268,
    -426,  -426,  -426,    90,  -426,  -426,  -426,   211,  -426,  -426,
    -426,  -426,  -426,  -426,   198,    -4,  -426,  -426,  -426,  -426,
     193,   315,   329,   330,   316,   319,   331,   356,  -426,  -426,
    -426,   253,   -82,  -426,   359,   258,   264,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,   205,  -426,   265,  -426,  -426,  -426,
    -426,  -426,   263,   205,  -426,  -426,   269,  -426,   256,   256,
     256,   205,   323,    64,  -426,  -426,   215,   157,  -426,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,    40,  -426,  -426,   205,   496,  -426,    -2,
     175,    10,  -426,   289,   332,   281,   282,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,   205,   371,   316,  -426,
     205,   370,   319,  -426,   205,    73,   331,  -426,  -426,   205,
     284,  -426,  -426,   175,   165,   -80,  -426,    25,  -426,   505,
    -426,  -426,  -426,  -426,  -426,  -426,   595,   514,   523,   340,
      -4,  -426,  -426,    -4,   205,  -426,  -426,   132,  -426,  -426,
    -426,   478,   363,   394,   394,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,   532,  -426,   380,   205,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,   296,  -426,  -426,   401,  -426,    -4,  -426,
    -426,   205,  -426,   193,    -3,   407,   408,  -426,   409,   410,
    -426,   429,    70,    70,    70,   430,  -426,  -426,  -426,  -426,
    -426,  -426,   263,  -426,  -426,  -426,   205,  -426,   326,   355,
     357,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,    -4,
    -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,   263,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,   604,   541,   550,   358,   360,   366,   487,  -426,
    -426,  -426,  -426,  -426,  -426,    90,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,   461,   376,  -426,    12,  -426,   559,   568,
     577,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,
      76,   586,   613,  -426,  -426,  -426,  -426,  -426,   453,    70,
    -426,   175,  -426,   447,    12,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,   215,  -426,   469,   482,  -426,  -426,  -426,  -426
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -426,  -426,   476,  -426,   454,  -426,  -426,  -426,  -426,  -426,
    -426,   426,  -426,  -426,   421,  -426,  -426,  -426,  -426,  -426,
    -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,   403,  -426,
    -426,  -426,  -426,  -426,   239,  -426,  -426,  -426,   206,   -97,
    -122,  -426,  -426,  -426,  -426,  -426,  -426,  -426,  -426,   249,
    -426,  -426,  -426,  -426,  -426,  -426,  -425,  -426,   156,  -426,
    -426,  -426,  -426,  -426,  -426,   220,  -426,  -426,  -426,  -426,
      61,  -426,  -426,   -87,  -426,  -426,  -426,    79,  -228,  -426,
     437,  -426,  -426,  -284,  -426,   259,  -426,  -426,  -426,  -426,
     -96,  -426,  -426,   209,  -426,  -225,   229,  -426,  -426,  -426,
    -426,   311,  -426,  -426,   325,  -426,  -426,  -168,   539,  -426,
    -426,     7,  -426,   515,  -125,  -426,  -103,   -88,   -92,  -426,
     -28,  -426,  -233,  -426,  -426
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -221
static const yytype_int16 yytable[] =
{
     169,    42,    43,    44,    45,   258,   169,   193,   318,   373,
     220,   201,   185,   219,   347,   191,   202,   171,   187,   188,
     116,   472,   214,   189,   100,   375,   376,   290,     5,     6,
       7,     8,   203,    23,   208,   340,     9,   341,   218,     1,
      10,   471,    25,   222,   342,    84,    85,    86,    87,   472,
     226,   355,    28,   233,  -218,   358,     4,  -218,    47,   361,
     235,    96,   198,   199,   211,   212,   213,   200,   118,   119,
     120,   321,   109,   110,   111,   112,   113,   114,   115,   322,
     323,   324,   117,   118,   119,   120,   121,   362,   190,   296,
     423,   424,  -219,   325,   435,  -219,   436,   204,   298,   167,
     363,   428,   214,   364,    20,   167,   309,   187,   188,   172,
     173,   174,   189,   175,   176,   177,   485,   486,   311,   348,
     300,   301,   302,   303,   304,   305,   307,   308,    21,   214,
     314,   336,    22,    34,   443,   444,   445,   344,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
     320,   326,   327,   328,    37,    38,   330,   263,    23,  -220,
      24,   334,  -220,    61,   367,   339,   333,    25,   346,    63,
      64,   345,   220,   312,    62,   219,   198,   199,   228,   229,
     230,   200,   118,   119,   120,    65,    66,   494,    67,   392,
      75,    69,   231,   371,   187,   188,   116,    70,   372,   189,
     218,   208,    76,    77,    79,   222,    78,   380,    83,    90,
     429,    93,   198,   199,   382,   385,   388,   200,   118,   119,
     120,   393,    94,   181,   397,    29,    30,    31,    32,   398,
     198,   199,   264,   212,   213,   200,   118,   119,   120,   190,
     427,   493,   198,   199,   211,   212,   213,   200,   118,   119,
     120,   447,   187,   188,   315,   184,   194,   189,    97,   316,
      98,   172,   173,   174,   318,   175,   176,   467,    99,   100,
     195,   196,   236,   101,    10,   102,   103,   104,   126,   105,
     209,   106,   390,   107,   210,   391,   223,   224,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   225,   227,   117,
     118,   119,   120,   121,   234,   237,   238,   260,   122,   123,
     124,   125,   300,   301,   302,   303,   304,   305,   259,   273,
     263,   198,   199,   368,   369,   370,   200,   118,   119,   120,
     453,   456,   459,   274,   275,   276,   466,   280,   239,   240,
     241,   242,   243,   244,   245,   246,   247,   248,   249,   250,
     251,   252,    84,    85,    86,    87,   478,   481,   484,   284,
     288,   451,   289,   291,   126,    97,   292,   214,   182,   489,
     491,   253,   214,   293,   297,    99,   100,   310,   299,   208,
     101,    10,   102,   103,   104,   349,   105,   351,   106,   352,
     107,   353,   356,   359,   389,   108,   109,   110,   111,   112,
     113,   114,   115,   116,   430,   431,   117,   118,   119,   120,
     121,   438,   439,   440,   441,   122,   123,   124,   125,   399,
     400,   401,   402,   403,   404,   405,   406,   407,   408,   409,
     410,   411,   412,   442,   446,   448,   399,   400,   401,   402,
     403,   404,   405,   406,   407,   408,   409,   410,   411,   412,
     399,   400,   401,   402,   403,   404,   405,   406,   407,   408,
     409,   410,   411,   412,   449,   468,   450,   460,   492,   461,
    -215,   126,   495,   498,   413,   462,   414,   415,   416,   417,
     418,   419,   420,   421,   214,   469,   499,    35,    46,    74,
      82,   413,   329,   414,   415,   416,   417,   418,   419,   420,
     421,   183,   332,   377,   432,   413,   366,   414,   415,   416,
     417,   418,   419,   420,   421,   198,   199,   394,   395,   396,
     200,   118,   119,   120,   198,   199,   463,   464,   465,   200,
     118,   119,   120,   198,   199,   496,   337,   338,   200,   118,
     119,   120,   198,   199,   197,   378,   379,   200,   118,   119,
     120,   198,   199,   374,   383,   384,   200,   118,   119,   120,
     198,   199,   434,   386,   387,   200,   118,   119,   120,   198,
     199,   497,   425,   426,   200,   118,   119,   120,   198,   199,
     433,   454,   455,   200,   118,   119,   120,   198,   199,   357,
     457,   458,   200,   118,   119,   120,   198,   199,    73,   476,
     477,   200,   118,   119,   120,   198,   199,   360,   479,   480,
     200,   118,   119,   120,   198,   199,   186,   482,   483,   200,
     118,   119,   120,   198,   199,     0,   487,   488,   200,   118,
     119,   120,   198,   199,   381,     0,     0,   200,   118,   119,
     120,   198,   199,   452,     0,     0,   200,   118,   119,   120,
     198,   199,     0,     0,   490,   200,   118,   119,   120
};

static const yytype_int16 yycheck[] =
{
      92,    29,    30,    31,    32,   173,    98,   103,   236,   293,
     135,   108,   100,   135,     4,   102,   108,     4,    37,    38,
      39,   446,   104,    42,    12,   105,   106,   109,     5,     6,
       7,     8,   124,    37,   126,    37,    13,    39,   135,     4,
      17,    29,    46,   135,    46,    47,    48,    49,    50,   474,
     142,   276,   104,   145,   107,   280,     0,   110,     4,   284,
     156,    89,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    14,   107,   214,
     323,   324,   107,    53,    97,   110,    99,   125,   223,    92,
      27,   334,   104,    30,    39,    98,   231,    37,    38,    96,
      97,    98,    42,   100,   101,   102,    40,    41,    54,   109,
      56,    57,    58,    59,    60,    61,   229,   230,    39,   104,
     233,   256,    39,     4,   362,   363,   364,   259,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
     237,   111,   112,   113,   103,    39,   253,   185,    37,   107,
      39,   253,   110,    39,   289,   257,   253,    46,   260,   106,
     103,   259,   297,   109,   105,   297,    37,    38,    39,    40,
      41,    42,    43,    44,    45,   103,   103,   471,   103,   314,
      40,   107,    53,   290,    37,    38,    39,   107,   290,    42,
     297,   293,    41,    39,    10,   297,    39,   299,    39,     9,
     335,   108,    37,    38,   306,   307,   308,    42,    43,    44,
      45,   317,   108,     4,   321,    47,    48,    49,    50,   321,
      37,    38,    39,    40,    41,    42,    43,    44,    45,   107,
     332,   469,    37,    38,    39,    40,    41,    42,    43,    44,
      45,   376,    37,    38,    39,    39,     4,    42,     1,    44,
       3,    96,    97,    98,   492,   100,   101,   435,    11,    12,
       4,     4,   110,    16,    17,    18,    19,    20,   107,    22,
       4,    24,   310,    26,     4,   313,   103,     4,    31,    32,
      33,    34,    35,    36,    37,    38,    39,     4,     4,    42,
      43,    44,    45,    46,     4,   103,     4,   109,    51,    52,
      53,    54,    56,    57,    58,    59,    60,    61,   107,     4,
     348,    37,    38,    39,    40,    41,    42,    43,    44,    45,
     422,   423,   424,     4,     4,    19,   428,    18,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    47,    48,    49,    50,   448,   449,   450,    28,
       4,   389,   109,     4,   107,     1,   108,   104,     4,   461,
     462,   103,   104,   109,   109,    11,    12,    54,   109,   471,
      16,    17,    18,    19,    20,    96,    22,    55,    24,   108,
      26,   109,    21,    23,    54,    31,    32,    33,    34,    35,
      36,    37,    38,    39,   108,     4,    42,    43,    44,    45,
      46,     4,     4,     4,     4,    51,    52,    53,    54,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,     4,     4,   109,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,   109,     4,   109,   109,    15,   109,
     107,   107,    25,     4,   111,   109,   113,   114,   115,   116,
     117,   118,   119,   120,   104,   109,     4,    11,    34,    63,
      69,   111,   253,   113,   114,   115,   116,   117,   118,   119,
     120,    98,   253,   297,   348,   111,   286,   113,   114,   115,
     116,   117,   118,   119,   120,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    37,    38,   474,    40,    41,    42,    43,
      44,    45,    37,    38,   107,    40,    41,    42,    43,    44,
      45,    37,    38,   294,    40,    41,    42,    43,    44,    45,
      37,    38,   353,    40,    41,    42,    43,    44,    45,    37,
      38,   492,    40,    41,    42,    43,    44,    45,    37,    38,
     351,    40,    41,    42,    43,    44,    45,    37,    38,   278,
      40,    41,    42,    43,    44,    45,    37,    38,    59,    40,
      41,    42,    43,    44,    45,    37,    38,   282,    40,    41,
      42,    43,    44,    45,    37,    38,   101,    40,    41,    42,
      43,    44,    45,    37,    38,    -1,    40,    41,    42,    43,
      44,    45,    37,    38,    39,    -1,    -1,    42,    43,    44,
      45,    37,    38,    39,    -1,    -1,    42,    43,    44,    45,
      37,    38,    -1,    -1,    41,    42,    43,    44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   122,   123,     0,     5,     6,     7,     8,    13,
      17,   124,   125,   126,   127,   128,   129,   133,   134,   232,
      39,    39,    39,    37,    39,    46,   135,   241,   104,    47,
      48,    49,    50,   234,     4,   123,   136,   103,    39,   130,
     131,   132,   241,   241,   241,   241,   125,     4,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
     137,    39,   105,   106,   103,   103,   103,   103,   139,   107,
     107,   228,   229,   229,   132,    40,    41,    39,    39,    10,
     140,   145,   135,    39,    47,    48,    49,    50,   141,   238,
       9,   146,   147,   108,   108,   142,   241,     1,     3,    11,
      12,    16,    18,    19,    20,    22,    24,    26,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    42,    43,    44,
      45,    46,    51,    52,    53,    54,   107,   148,   149,   150,
     151,   152,   153,   154,   155,   156,   160,   163,   164,   167,
     168,   169,   170,   171,   172,   174,   176,   177,   181,   182,
     183,   192,   193,   194,   195,   196,   197,   199,   201,   207,
     208,   209,   210,   218,   219,   230,   231,   232,   233,   239,
     240,     4,    96,    97,    98,   100,   101,   102,   143,   144,
     206,     4,     4,   149,    39,   238,   234,    37,    38,    42,
     107,   194,   211,   211,     4,     4,     4,   201,    37,    38,
      42,   160,   239,   239,   241,   202,   203,   204,   239,     4,
       4,    39,    40,    41,   104,   157,   158,   159,   160,   161,
     235,   236,   239,   103,     4,     4,   239,     4,    39,    40,
      41,    53,   173,   239,     4,   211,   110,   103,     4,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,   103,   161,   165,   244,   245,   228,   107,
     109,   178,   179,   241,    39,   212,   213,   214,   215,   216,
     217,   235,   239,     4,     4,     4,    19,   220,   221,   222,
      18,   223,   224,   225,    28,   184,   185,   186,     4,   109,
     109,     4,   108,   109,   205,   162,   235,   109,   235,   109,
      56,    57,    58,    59,    60,    61,   237,   237,   237,   235,
      54,    54,   109,   175,   237,    39,    44,   198,   199,   200,
     194,    31,    39,    40,    41,    53,   111,   112,   113,   155,
     160,   166,   170,   194,   239,   242,   235,    40,    41,   239,
      37,    39,    46,   138,   161,   238,   239,     4,   109,    96,
     180,    55,   108,   109,   226,   216,    21,   222,   216,    23,
     225,   216,    14,    27,    30,   187,   186,   235,    39,    40,
      41,   160,   239,   204,   206,   105,   106,   159,    40,    41,
     239,    39,   239,    40,    41,   239,    40,    41,   239,    54,
     241,   241,   235,   211,    39,    40,    41,   160,   239,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,   111,   113,   114,   115,   116,   117,   118,
     119,   120,   243,   243,   243,    40,    41,   239,   243,   235,
     108,     4,   179,   217,   214,    97,    99,   227,     4,     4,
       4,     4,     4,   199,   199,   199,     4,   235,   109,   109,
     109,   241,    39,   239,    40,    41,   239,    40,    41,   239,
     109,   109,   109,    39,    40,    41,   239,   228,     4,   109,
     188,    29,   177,   189,   190,   191,    40,    41,   239,    40,
      41,   239,    40,    41,   239,    40,    41,    40,    41,   239,
      41,   239,    15,   199,   204,    25,   191,   198,     4,     4
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
#line 461 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 14:
#line 467 "pir.y"
    { set_hll((yyvsp[(2) - (2)].sval)); ;}
    break;

  case 15:
#line 471 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 16:
#line 478 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].key)); ;}
    break;

  case 17:
#line 482 "pir.y"
    { (yyval.key) = NULL; ;}
    break;

  case 18:
#line 484 "pir.y"
    { (yyval.key) = (yyvsp[(1) - (1)].key); ;}
    break;

  case 19:
#line 488 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 20:
#line 490 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 21:
#line 494 "pir.y"
    { expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval))); ;}
    break;

  case 23:
#line 507 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 28:
#line 519 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 29:
#line 521 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 30:
#line 523 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 31:
#line 525 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 32:
#line 527 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 33:
#line 529 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 34:
#line 531 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 35:
#line 533 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 36:
#line 535 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 37:
#line 537 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 38:
#line 539 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 39:
#line 541 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 48:
#line 559 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 49:
#line 563 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 50:
#line 565 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 53:
#line 573 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 56:
#line 582 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 58:
#line 587 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 59:
#line 589 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 75:
#line 611 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 77:
#line 624 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 78:
#line 626 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 79:
#line 630 "pir.y"
    { set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 82:
#line 640 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 87:
#line 652 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 88:
#line 654 "pir.y"
    { push_operand(lexer, expr_from_key((yyvsp[(1) - (1)].key))); ;}
    break;

  case 89:
#line 656 "pir.y"
    { push_operand(lexer, expr_from_target((yyvsp[(1) - (1)].targ))); ;}
    break;

  case 90:
#line 660 "pir.y"
    {
                            (yyvsp[(1) - (2)].targ)->key = (yyvsp[(2) - (2)].key);
                            (yyval.targ) = (yyvsp[(1) - (2)].targ);
                         ;}
    break;

  case 91:
#line 667 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 92:
#line 671 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 93:
#line 673 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 96:
#line 682 "pir.y"
    {
                           if ((yyvsp[(3) - (3)].ival) == 0)   /* x = 0 -> null x */
                               set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                           else
                               set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                         ;}
    break;

  case 97:
#line 689 "pir.y"
    {
                           if ((yyvsp[(3) - (3)].dval) == 0.0)  /* x = 0.0 -> null x */
                               set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                           else
                               set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                         ;}
    break;

  case 98:
#line 697 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 99:
#line 699 "pir.y"
    {
                           if (targets_equal((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)))
                               set_instr(lexer, "nop");
                           else
                               set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));

                         ;}
    break;

  case 100:
#line 707 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (2)].targ))); ;}
    break;

  case 101:
#line 709 "pir.y"
    { set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 102:
#line 711 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 103:
#line 713 "pir.y"
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
                                    else if ((yyvsp[(4) - (5)].ival) == OP_MUL) {
                                        /* x = x * 0 -> null x */
                                        set_instrf(lexer, "null", "%T", (yyvsp[(1) - (5)].targ));
                                    }
                                    else
                                        yyerror(yyscanner, lexer, "cannot divide by 0.0");
                                }
                                else /* x = x op 10 */
                                    set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%i", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].ival));
                            }
                            else {
                                /* x = y op ? */
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%i", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].ival));
                            }
                         ;}
    break;

  case 104:
#line 743 "pir.y"
    {
                            int equal = targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ));
                            if (equal) {
                                if ((yyvsp[(5) - (5)].dval) == 1.0) {
                                    /* x = x op 1 */
                                    if (((yyvsp[(4) - (5)].ival) == OP_ADD) || ((yyvsp[(4) - (5)].ival) == OP_SUB)) {
                                        set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival) + 1], "%T", (yyvsp[(1) - (5)].targ));
                                    }
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
                                    else if ((yyvsp[(4) - (5)].ival) == OP_MUL) {
                                        /* x = x * 0.0 -> null x */
                                        set_instrf(lexer, "null", "%T", (yyvsp[(1) - (5)].targ));
                                    }
                                    else if (((yyvsp[(4) - (5)].ival) == OP_DIV) || ((yyvsp[(4) - (5)].ival) == OP_FDIV)) {
                                        /* x = x / 0 */
                                        yyerror(yyscanner, lexer, "cannot divide by 0.0");
                                    }
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

  case 105:
#line 781 "pir.y"
    {
                            if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ)))
                                /* x = x . "hi" -> x .= "hi" */
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%s", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].sval));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%s", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].sval));

                         ;}
    break;

  case 106:
#line 790 "pir.y"
    {
                           if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ)))
                               set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                           else
                               set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));
                         ;}
    break;

  case 107:
#line 797 "pir.y"
    { set_instrf(lexer, "set", "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 108:
#line 799 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 109:
#line 801 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 110:
#line 805 "pir.y"
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

  case 111:
#line 818 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%n", (yyvsp[(2) - (2)].dval)); ;}
    break;

  case 112:
#line 820 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%T", (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 113:
#line 822 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%E", (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 114:
#line 837 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 115:
#line 839 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 116:
#line 841 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 117:
#line 843 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 118:
#line 845 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 119:
#line 847 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 120:
#line 849 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 121:
#line 851 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 122:
#line 883 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ)); ;}
    break;

  case 123:
#line 885 "pir.y"
    { set_instrf(lexer, "set", "%T%E", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 124:
#line 887 "pir.y"
    {
                            if (targets_equal((yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ)))
                                /* set $I0, $I0 -> delete */
                                set_instr(lexer, "nop");
                            else
                                set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ));
                        ;}
    break;

  case 125:
#line 895 "pir.y"
    {
                       if ((yyvsp[(4) - (4)].ival) == 0)
                           /* set $I0, 0 -> null $I0 */
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (4)].targ));
                       else
                           set_instrf(lexer, "set", "%T%i", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].ival));
                    ;}
    break;

  case 126:
#line 903 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].dval) == 0) /* set $N0, 0.0 -> null $N0 */
                            set_instrf(lexer, "null", "%T", (yyvsp[(2) - (4)].targ));
                        else
                            set_instrf(lexer, "set", "%T%n", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].dval));
                    ;}
    break;

  case 127:
#line 910 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 128:
#line 912 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].ival) == 0) /* $I0 = set 0 -> null $I0 */
                            set_instrf(lexer, "null", "%T", (yyvsp[(1) - (4)].targ));
                        else
                            set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].ival));
                    ;}
    break;

  case 129:
#line 919 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].dval) == 0) /* $N0 = set 0.0 -> null $N0 */
                            set_instrf(lexer, "null", "%T", (yyvsp[(1) - (4)].targ));
                        else
                            set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].dval));
                    ;}
    break;

  case 130:
#line 926 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 131:
#line 928 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ)); ;}
    break;

  case 132:
#line 930 "pir.y"
    {
                        if (targets_equal((yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ))) /* $I0 = set $I0 -> delete */
                            set_instr(lexer, "nop");
                        else
                            set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ));
                    ;}
    break;

  case 134:
#line 966 "pir.y"
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

  case 135:
#line 981 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_i_i(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 136:
#line 983 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].dval) == 0) {
                            if (((yyvsp[(1) - (4)].ival) == OP_ADD) || ((yyvsp[(1) - (4)].ival) == OP_SUB))
                                /* add $N0, 0.0 -> delete */
                                set_instr(lexer, "nop");
                            else if ((yyvsp[(1) - (4)].ival) == OP_MUL)
                                /* mul $N0, 0.0 -> null $N0 */
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

  case 137:
#line 1006 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_i_n(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 138:
#line 1008 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_n_n(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 139:
#line 1010 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_n_i(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 140:
#line 1012 "pir.y"
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

  case 141:
#line 1034 "pir.y"
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

  case 142:
#line 1047 "pir.y"
    {
                            if (targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ)))
                                /* op $N0, $N0, $N1 -> op $N0, $N1 */
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].targ));

                        ;}
    break;

  case 143:
#line 1056 "pir.y"
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

  case 144:
#line 1076 "pir.y"
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

  case 145:
#line 1111 "pir.y"
    {
                            if (targets_equal((yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ)))
                                set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].targ));
                        ;}
    break;

  case 146:
#line 1118 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%C", (yyvsp[(1) - (6)].targ), fold_i_i(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 147:
#line 1120 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%C", (yyvsp[(1) - (6)].targ), fold_i_n(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 148:
#line 1122 "pir.y"
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

  case 149:
#line 1136 "pir.y"
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

  case 150:
#line 1147 "pir.y"
    {
                            /* $N0 = add 1.5, 10 -> set $N0, 15 */
                            set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (6)].targ), fold_n_i(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].ival)));
                        ;}
    break;

  case 151:
#line 1152 "pir.y"
    {
                            /* $I0 = add 1, 2 -> $I0 = 3 */
                            set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (6)].targ), fold_n_n(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].dval)));
                        ;}
    break;

  case 152:
#line 1157 "pir.y"
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

  case 153:
#line 1168 "pir.y"
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

  case 154:
#line 1188 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 155:
#line 1189 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 156:
#line 1190 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 157:
#line 1191 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 158:
#line 1192 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 160:
#line 1200 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%E%I", (yyvsp[(3) - (5)].expr), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 161:
#line 1202 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 162:
#line 1204 "pir.y"
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

  case 163:
#line 1231 "pir.y"
    {
                           set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                           (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                         ;}
    break;

  case 164:
#line 1236 "pir.y"
    {
                           set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 165:
#line 1241 "pir.y"
    {
                           set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 166:
#line 1246 "pir.y"
    {
                           set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 167:
#line 1251 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 168:
#line 1253 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 169:
#line 1255 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 170:
#line 1257 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 171:
#line 1259 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 172:
#line 1261 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].ival) ? 1 : 0; ;}
    break;

  case 173:
#line 1263 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].dval) ? 1 : 0; ;}
    break;

  case 174:
#line 1265 "pir.y"
    { (yyval.ival) = evaluate_s((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 175:
#line 1268 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 176:
#line 1269 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 179:
#line 1277 "pir.y"
    { set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 180:
#line 1281 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].sym)); ;}
    break;

  case 181:
#line 1285 "pir.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym); ;}
    break;

  case 182:
#line 1287 "pir.y"
    { (yyval.sym) = add_local((yyvsp[(1) - (3)].sym), (yyvsp[(3) - (3)].sym)); ;}
    break;

  case 183:
#line 1291 "pir.y"
    { (yyval.sym) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 184:
#line 1294 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 185:
#line 1295 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 186:
#line 1299 "pir.y"
    {
                           if ((yyvsp[(4) - (5)].targ)->type == PMC_TYPE)
                               set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                           else
                               yyerror(yyscanner, lexer,
                                       "second argument to .lex must be of type PMC");
                         ;}
    break;

  case 189:
#line 1320 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 190:
#line 1327 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 191:
#line 1329 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 192:
#line 1333 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 193:
#line 1335 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 194:
#line 1339 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 195:
#line 1343 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 196:
#line 1345 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 197:
#line 1348 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 198:
#line 1352 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 199:
#line 1354 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 200:
#line 1358 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 201:
#line 1360 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 202:
#line 1364 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 203:
#line 1366 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 204:
#line 1370 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 205:
#line 1372 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 207:
#line 1380 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 208:
#line 1382 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 209:
#line 1384 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 212:
#line 1392 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 213:
#line 1399 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 214:
#line 1406 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 215:
#line 1408 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 218:
#line 1416 "pir.y"
    { (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 219:
#line 1418 "pir.y"
    { /* local identifiers */
                              if ((yyvsp[(1) - (1)].sym)->type != PMC_TYPE)
                                  yyerror(yyscanner, lexer,
                                          "invokable identifier must be of type PMC");

                              (yyval.targ) = target_from_symbol((yyvsp[(1) - (1)].sym));
                            ;}
    break;

  case 220:
#line 1426 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 221:
#line 1430 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 222:
#line 1432 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 223:
#line 1437 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 224:
#line 1441 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 225:
#line 1443 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 226:
#line 1447 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 227:
#line 1449 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 228:
#line 1453 "pir.y"
    {
                              (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 229:
#line 1460 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 230:
#line 1462 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 231:
#line 1466 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 232:
#line 1468 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 233:
#line 1470 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 234:
#line 1472 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 235:
#line 1474 "pir.y"
    { set_alias(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 240:
#line 1489 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 241:
#line 1494 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 242:
#line 1498 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 243:
#line 1505 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 244:
#line 1509 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 245:
#line 1511 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 246:
#line 1515 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 247:
#line 1517 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 250:
#line 1525 "pir.y"
    {
                              (yyval.argm) = (yyvsp[(3) - (3)].argm);
                              lexer->curarg->alias = (yyvsp[(1) - (3)].sval);
                              SET_FLAG(lexer->curarg->flags, ARG_FLAG_NAMED);
                            ;}
    break;

  case 251:
#line 1533 "pir.y"
    {
                              (yyval.argm) = (yyvsp[(1) - (2)].argm);
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 252:
#line 1540 "pir.y"
    { (yyval.argm) = lexer->curarg = new_argument((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 253:
#line 1546 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 254:
#line 1555 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 255:
#line 1562 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 256:
#line 1564 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 257:
#line 1569 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 258:
#line 1571 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 259:
#line 1576 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 260:
#line 1580 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 261:
#line 1582 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 262:
#line 1586 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 263:
#line 1588 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 264:
#line 1592 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 265:
#line 1597 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 266:
#line 1599 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 267:
#line 1603 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 268:
#line 1605 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               lexer->curarg->alias = (yyvsp[(2) - (2)].sval);
                             ;}
    break;

  case 269:
#line 1612 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 270:
#line 1614 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 271:
#line 1618 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 275:
#line 1629 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].cval), !GLOBALCONST); ;}
    break;

  case 276:
#line 1633 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].cval), GLOBALCONST); ;}
    break;

  case 277:
#line 1637 "pir.y"
    { (yyval.cval) = new_named_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 278:
#line 1639 "pir.y"
    { (yyval.cval) = new_named_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 279:
#line 1641 "pir.y"
    { (yyval.cval) = new_named_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 280:
#line 1643 "pir.y"
    { (yyval.cval) = new_named_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 281:
#line 1651 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 282:
#line 1652 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].cval)); ;}
    break;

  case 283:
#line 1655 "pir.y"
    { (yyval.cval) = new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 284:
#line 1656 "pir.y"
    { (yyval.cval) = new_const(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 285:
#line 1657 "pir.y"
    { (yyval.cval) = new_const(NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 286:
#line 1660 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 287:
#line 1661 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 288:
#line 1662 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 289:
#line 1663 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 290:
#line 1664 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 291:
#line 1665 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 292:
#line 1668 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 293:
#line 1669 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 294:
#line 1670 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 295:
#line 1671 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 296:
#line 1679 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 297:
#line 1682 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 298:
#line 1683 "pir.y"
    { (yyval.targ) = reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 299:
#line 1684 "pir.y"
    { (yyval.targ) = reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 300:
#line 1685 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 301:
#line 1686 "pir.y"
    { (yyval.targ) = target_from_symbol((yyvsp[(1) - (1)].sym)); ;}
    break;

  case 302:
#line 1687 "pir.y"
    { /*
                            * if an TK_IDENT was returned, that means the ID was not
                            * declared; emit an error.
                            */
                           yyerror(yyscanner, lexer, "symbol not declared!");
                           /* to prevent seg. faulting, always return something */
                           (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 305:
#line 1701 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 306:
#line 1702 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 307:
#line 1703 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 308:
#line 1706 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 309:
#line 1707 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 310:
#line 1708 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 311:
#line 1709 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 312:
#line 1710 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 313:
#line 1711 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 314:
#line 1712 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 315:
#line 1713 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 316:
#line 1714 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 317:
#line 1715 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 318:
#line 1716 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 319:
#line 1717 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 320:
#line 1718 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 321:
#line 1719 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 322:
#line 1720 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 323:
#line 1721 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 324:
#line 1722 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 325:
#line 1723 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 326:
#line 1724 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 327:
#line 1725 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 328:
#line 1726 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 329:
#line 1727 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 330:
#line 1728 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 331:
#line 1734 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 332:
#line 1735 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 333:
#line 1736 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 334:
#line 1737 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 335:
#line 1738 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 336:
#line 1739 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 337:
#line 1740 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 338:
#line 1741 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 339:
#line 1742 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 340:
#line 1743 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 341:
#line 1744 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 342:
#line 1745 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 343:
#line 1748 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 344:
#line 1749 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4068 "pirparser.c"
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


#line 1752 "pir.y"


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


