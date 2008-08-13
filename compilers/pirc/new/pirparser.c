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
#line 185 "pir.y"
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
    struct symbol      *sym;

    void               *fixme;
}
/* Line 187 of yacc.c.  */
#line 500 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 513 "pirparser.c"

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
#define YYNNTS  124
/* YYNRULES -- Number of rules.  */
#define YYNRULES  343
/* YYNRULES -- Number of states.  */
#define YYNSTATES  499

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
      49,    53,    60,    63,    65,    67,    68,    71,    73,    75,
      77,    79,    81,    83,    85,    87,    89,    94,    97,   100,
     102,   104,   106,   108,   110,   111,   114,   119,   122,   123,
     126,   128,   130,   135,   136,   139,   140,   143,   146,   149,
     151,   153,   155,   157,   159,   161,   163,   165,   167,   169,
     171,   173,   175,   177,   179,   182,   185,   188,   192,   196,
     199,   202,   204,   205,   207,   209,   213,   215,   217,   219,
     222,   226,   228,   232,   235,   237,   241,   245,   249,   253,
     256,   261,   265,   271,   277,   283,   289,   293,   297,   301,
     304,   307,   310,   313,   317,   321,   325,   329,   333,   337,
     341,   345,   350,   355,   360,   365,   370,   375,   380,   385,
     390,   395,   400,   403,   408,   415,   420,   427,   434,   441,
     448,   455,   462,   469,   476,   483,   490,   497,   502,   507,
     514,   521,   528,   535,   537,   539,   541,   543,   545,   548,
     554,   559,   564,   568,   572,   576,   580,   584,   588,   592,
     596,   600,   602,   604,   606,   608,   610,   612,   614,   618,
     623,   625,   629,   632,   633,   635,   641,   643,   645,   654,
     655,   657,   659,   662,   666,   670,   673,   679,   680,   683,
     684,   686,   688,   691,   695,   697,   700,   704,   708,   710,
     712,   714,   719,   722,   724,   726,   728,   730,   732,   734,
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
    1022,  1024,  1026,  1028
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     122,     0,    -1,   123,   124,   123,    -1,    -1,     4,    -1,
     125,    -1,   124,     4,   125,    -1,   132,    -1,   231,    -1,
     129,    -1,   127,    -1,   128,    -1,   126,    -1,     7,    39,
      -1,     5,    39,    -1,     6,    39,   103,    39,    -1,    13,
     104,   130,   105,    -1,    -1,   131,    -1,    39,    -1,   131,
     106,    39,    -1,   133,   135,     4,   138,   144,     9,    -1,
       8,   134,    -1,   240,    -1,    39,    -1,    -1,   135,   136,
      -1,    87,    -1,    84,    -1,    85,    -1,    86,    -1,    88,
      -1,    91,    -1,    93,    -1,    94,    -1,    92,    -1,    89,
     107,   134,   108,    -1,    90,   227,    -1,    95,   228,    -1,
      37,    -1,    46,    -1,    39,    -1,   160,    -1,   237,    -1,
      -1,   138,   139,    -1,    10,   140,   141,     4,    -1,   237,
     240,    -1,    -1,   141,   142,    -1,   205,    -1,   143,    -1,
     102,   107,   137,   108,    -1,    -1,   144,   145,    -1,    -1,
     146,   147,    -1,     3,     4,    -1,     3,   148,    -1,   148,
      -1,   170,    -1,   175,    -1,   176,    -1,   180,    -1,   229,
      -1,   206,    -1,   207,    -1,   181,    -1,   162,    -1,   153,
      -1,   152,    -1,   150,    -1,   167,    -1,   149,    -1,     1,
       4,    -1,   151,     4,    -1,    53,   238,    -1,   238,   103,
      53,    -1,    26,   200,     4,    -1,   154,     4,    -1,   155,
     156,    -1,    46,    -1,    -1,   157,    -1,   158,    -1,   157,
     109,   158,    -1,   234,    -1,   160,    -1,   159,    -1,   238,
     160,    -1,   104,   161,   105,    -1,   234,    -1,   161,   106,
     234,    -1,   163,     4,    -1,   166,    -1,   238,   103,    40,
      -1,   238,   103,    41,    -1,   238,   103,    39,    -1,   238,
     103,   238,    -1,   238,   164,    -1,   238,   103,   241,   234,
      -1,   238,   103,   165,    -1,   238,   103,   238,   242,    40,
      -1,   238,   103,   238,   242,    41,    -1,   238,   103,   238,
     242,    39,    -1,   238,   103,   238,   242,   238,    -1,   159,
     103,   234,    -1,   238,   103,   159,    -1,   238,   103,   154,
      -1,   244,    40,    -1,   244,    41,    -1,   244,   238,    -1,
     243,   234,    -1,    40,   242,   238,    -1,    41,   242,   238,
      -1,    39,   242,   238,    -1,    39,   242,    39,    -1,    40,
     242,    40,    -1,    41,   242,    41,    -1,    40,   242,    41,
      -1,    41,   242,    40,    -1,    31,   238,   109,   159,    -1,
      31,   159,   109,   234,    -1,    31,   238,   109,   238,    -1,
      31,   238,   109,    40,    -1,    31,   238,   109,    41,    -1,
      31,   238,   109,    39,    -1,   238,   103,    31,    40,    -1,
     238,   103,    31,    41,    -1,   238,   103,    31,    39,    -1,
     238,   103,    31,   159,    -1,   238,   103,    31,   238,    -1,
     168,     4,    -1,   169,   238,   109,    40,    -1,   169,   238,
     109,    40,   109,    40,    -1,   169,   238,   109,    41,    -1,
     169,   238,   109,    40,   109,    41,    -1,   169,   238,   109,
      41,   109,    41,    -1,   169,   238,   109,    41,   109,    40,
      -1,   169,   238,   109,    40,   109,   238,    -1,   169,   238,
     109,    41,   109,   238,    -1,   169,   238,   109,   238,   109,
     238,    -1,   169,   238,   109,   238,   109,    41,    -1,   169,
     238,   109,   238,   109,    40,    -1,   238,   103,   169,   238,
     109,   238,    -1,   238,   103,   169,    40,   109,    40,    -1,
     238,   103,   169,    40,   109,    41,    -1,   238,   103,   169,
      40,    -1,   238,   103,   169,    41,    -1,   238,   103,   169,
      41,   109,    40,    -1,   238,   103,   169,    41,   109,    41,
      -1,   238,   103,   169,    41,   109,   238,    -1,   238,   103,
     169,   238,   109,    41,    -1,    32,    -1,    33,    -1,    34,
      -1,    35,    -1,    36,    -1,   171,     4,    -1,   173,    53,
     234,    54,   240,    -1,   173,   238,   174,   240,    -1,   173,
     172,    54,   240,    -1,   238,   236,   234,    -1,    40,   236,
     238,    -1,    41,   236,   238,    -1,    39,   236,   238,    -1,
      40,   236,    40,    -1,    41,   236,    41,    -1,    40,   236,
      41,    -1,    41,   236,    40,    -1,    39,   236,    39,    -1,
      40,    -1,    41,    -1,    39,    -1,    51,    -1,    52,    -1,
      54,    -1,   109,    -1,    54,   240,     4,    -1,    12,   237,
     177,     4,    -1,   178,    -1,   177,   109,   178,    -1,   240,
     179,    -1,    -1,    96,    -1,    11,    39,   109,   238,     4,
      -1,   182,    -1,   191,    -1,    24,     4,   183,   186,     4,
     188,    25,     4,    -1,    -1,   184,    -1,   185,    -1,   184,
     185,    -1,    28,   215,     4,    -1,    27,   198,   187,    -1,
      30,   198,    -1,    14,   198,     4,    15,   197,    -1,    -1,
     109,   198,    -1,    -1,   189,    -1,   190,    -1,   189,   190,
      -1,    29,   203,     4,    -1,   176,    -1,   192,     4,    -1,
     200,   103,   193,    -1,   238,   103,   193,    -1,   193,    -1,
     195,    -1,   194,    -1,   198,   110,   197,   210,    -1,   196,
     210,    -1,   198,    -1,    39,    -1,   198,    -1,   199,    -1,
      37,    -1,    38,    -1,    42,    -1,    39,    -1,    44,    -1,
     107,   201,   108,    -1,    -1,   202,    -1,   203,    -1,   202,
     109,   203,    -1,   238,   204,    -1,    -1,   204,   205,    -1,
     100,    -1,   101,    -1,    98,    -1,    96,    -1,    97,   227,
      -1,   208,    -1,   217,    -1,   209,    -1,   218,    -1,    18,
     210,     4,    -1,    18,   193,     4,    -1,    19,   210,     4,
      -1,   107,   211,   108,    -1,    -1,   212,    -1,   213,    -1,
     212,   109,   213,    -1,   215,    -1,   214,    -1,    39,    55,
     216,    -1,   216,   225,    -1,   234,    -1,    22,     4,   222,
      23,     4,    -1,    20,     4,   219,    21,     4,    -1,    -1,
     220,    -1,   221,    -1,   220,   221,    -1,    19,   215,     4,
      -1,    -1,   223,    -1,   224,    -1,   223,   224,    -1,    18,
     215,     4,    -1,    -1,   225,   226,    -1,    99,    -1,    97,
     227,    -1,    -1,   228,    -1,   107,    39,   108,    -1,   230,
       4,    -1,   231,    -1,   232,    -1,    17,   233,    -1,    16,
     233,    -1,    47,   240,   103,    40,    -1,    48,   240,   103,
      41,    -1,    49,   240,   103,    39,    -1,    50,   240,   103,
      39,    -1,   238,    -1,   235,    -1,    39,    -1,    40,    -1,
      41,    -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,
      61,    -1,    60,    -1,    47,    -1,    48,    -1,    49,    -1,
      50,    -1,   239,    -1,    42,    -1,    43,    -1,    45,    -1,
      44,    -1,    38,    -1,    37,    -1,    37,    -1,    46,    -1,
     111,    -1,   112,    -1,   113,    -1,   114,    -1,   111,    -1,
     115,    -1,   116,    -1,   117,    -1,   118,    -1,   119,    -1,
     113,    -1,   120,    -1,    69,    -1,    62,    -1,    63,    -1,
      64,    -1,    66,    -1,    67,    -1,    65,    -1,    68,    -1,
      57,    -1,    59,    -1,    58,    -1,    61,    -1,    60,    -1,
      56,    -1,    75,    -1,    76,    -1,    77,    -1,    78,    -1,
      81,    -1,    79,    -1,    80,    -1,    82,    -1,    83,    -1,
      71,    -1,    72,    -1,    70,    -1,    73,    -1,    74,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   439,   439,   444,   445,   448,   449,   452,   453,   454,
     455,   456,   457,   460,   466,   470,   477,   482,   483,   487,
     489,   496,   502,   506,   507,   510,   511,   514,   516,   518,
     520,   522,   524,   526,   528,   530,   532,   534,   536,   540,
     541,   542,   543,   544,   547,   548,   551,   554,   559,   560,
     564,   565,   568,   574,   575,   578,   578,   582,   584,   586,
     589,   590,   591,   592,   593,   594,   595,   596,   597,   598,
     599,   600,   601,   602,   606,   616,   619,   621,   625,   629,
     632,   635,   639,   640,   643,   644,   647,   649,   651,   655,
     662,   666,   668,   673,   676,   677,   684,   692,   694,   702,
     704,   706,   708,   738,   776,   785,   792,   794,   796,   800,
     813,   815,   817,   832,   834,   836,   838,   840,   842,   844,
     846,   878,   880,   882,   890,   898,   905,   907,   914,   921,
     923,   925,   935,   961,   976,   978,  1001,  1003,  1005,  1007,
    1029,  1042,  1051,  1071,  1106,  1113,  1115,  1117,  1131,  1142,
    1147,  1152,  1163,  1184,  1185,  1186,  1187,  1188,  1192,  1195,
    1197,  1199,  1226,  1231,  1236,  1241,  1246,  1248,  1250,  1252,
    1254,  1256,  1258,  1260,  1264,  1265,  1268,  1269,  1272,  1276,
    1280,  1282,  1286,  1290,  1291,  1294,  1307,  1308,  1311,  1323,
    1324,  1328,  1330,  1334,  1338,  1340,  1342,  1348,  1349,  1354,
    1355,  1359,  1361,  1365,  1367,  1371,  1375,  1377,  1379,  1383,
    1384,  1387,  1394,  1401,  1403,  1407,  1408,  1411,  1413,  1421,
    1425,  1427,  1432,  1437,  1438,  1442,  1444,  1448,  1456,  1457,
    1461,  1463,  1465,  1467,  1469,  1479,  1480,  1483,  1484,  1487,
    1492,  1496,  1503,  1508,  1509,  1513,  1515,  1519,  1520,  1523,
    1531,  1538,  1542,  1551,  1561,  1562,  1567,  1569,  1574,  1579,
    1580,  1584,  1586,  1590,  1596,  1597,  1601,  1603,  1611,  1612,
    1616,  1620,  1623,  1624,  1627,  1631,  1635,  1637,  1639,  1641,
    1650,  1651,  1654,  1655,  1656,  1659,  1660,  1661,  1662,  1663,
    1664,  1667,  1668,  1669,  1670,  1678,  1681,  1682,  1683,  1684,
    1685,  1686,  1696,  1697,  1700,  1701,  1702,  1705,  1706,  1707,
    1708,  1709,  1710,  1711,  1712,  1713,  1714,  1715,  1716,  1717,
    1718,  1719,  1720,  1721,  1722,  1723,  1724,  1725,  1726,  1727,
    1733,  1734,  1735,  1736,  1737,  1738,  1739,  1740,  1741,  1742,
    1743,  1744,  1747,  1748
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
  "hll_specifier", "hll_mapping", "namespace_decl", "opt_namespace_id",
  "namespace_id", "sub_def", "sub_head", "sub_id", "sub_flags", "sub_flag",
  "multi_type", "parameters", "parameter", "param", "param_flags",
  "param_flag", "invocant_param", "instructions", "instruction", "@1",
  "instr", "statement", "error_stat", "null_stat", "null_instr",
  "getresults_stat", "parrot_stat", "parrot_instruction", "parrot_op",
  "opt_op_args", "op_args", "op_arg", "keyaccess", "keylist", "keys",
  "assignment_stat", "assignment", "augmentive_expr", "binary_expr",
  "set_instruction", "math_stat", "math_instruction", "math_op",
  "conditional_stat", "conditional_instr", "condition", "if_unless",
  "then", "goto_stat", "local_decl", "local_id_list", "local_id",
  "has_unique_reg", "lex_decl", "invocation_stat", "long_invocation_stat",
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
     131,   132,   133,   134,   134,   135,   135,   136,   136,   136,
     136,   136,   136,   136,   136,   136,   136,   136,   136,   137,
     137,   137,   137,   137,   138,   138,   139,   140,   141,   141,
     142,   142,   143,   144,   144,   146,   145,   147,   147,   147,
     148,   148,   148,   148,   148,   148,   148,   148,   148,   148,
     148,   148,   148,   148,   149,   150,   151,   151,   152,   153,
     154,   155,   156,   156,   157,   157,   158,   158,   158,   159,
     160,   161,   161,   162,   163,   163,   163,   163,   163,   163,
     163,   163,   163,   163,   163,   163,   163,   163,   163,   164,
     164,   164,   164,   165,   165,   165,   165,   165,   165,   165,
     165,   166,   166,   166,   166,   166,   166,   166,   166,   166,
     166,   166,   167,   168,   168,   168,   168,   168,   168,   168,
     168,   168,   168,   168,   168,   168,   168,   168,   168,   168,
     168,   168,   168,   169,   169,   169,   169,   169,   170,   171,
     171,   171,   172,   172,   172,   172,   172,   172,   172,   172,
     172,   172,   172,   172,   173,   173,   174,   174,   175,   176,
     177,   177,   178,   179,   179,   180,   181,   181,   182,   183,
     183,   184,   184,   185,   186,   186,   186,   187,   187,   188,
     188,   189,   189,   190,   190,   191,   192,   192,   192,   193,
     193,   194,   195,   196,   196,   197,   197,   198,   198,   198,
     199,   199,   200,   201,   201,   202,   202,   203,   204,   204,
     205,   205,   205,   205,   205,   206,   206,   207,   207,   208,
     208,   209,   210,   211,   211,   212,   212,   213,   213,   214,
     215,   216,   217,   218,   219,   219,   220,   220,   221,   222,
     222,   223,   223,   224,   225,   225,   226,   226,   227,   227,
     228,   229,   230,   230,   231,   232,   233,   233,   233,   233,
     234,   234,   235,   235,   235,   236,   236,   236,   236,   236,
     236,   237,   237,   237,   237,   238,   239,   239,   239,   239,
     239,   239,   240,   240,   241,   241,   241,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,   242,
     243,   243,   243,   243,   243,   243,   243,   243,   243,   243,
     243,   243,   244,   244
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     2,     2,     4,     4,     0,     1,     1,
       3,     6,     2,     1,     1,     0,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     2,     2,     1,
       1,     1,     1,     1,     0,     2,     4,     2,     0,     2,
       1,     1,     4,     0,     2,     0,     2,     2,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     2,     2,     2,     3,     3,     2,
       2,     1,     0,     1,     1,     3,     1,     1,     1,     2,
       3,     1,     3,     2,     1,     3,     3,     3,     3,     2,
       4,     3,     5,     5,     5,     5,     3,     3,     3,     2,
       2,     2,     2,     3,     3,     3,     3,     3,     3,     3,
       3,     4,     4,     4,     4,     4,     4,     4,     4,     4,
       4,     4,     2,     4,     6,     4,     6,     6,     6,     6,
       6,     6,     6,     6,     6,     6,     6,     4,     4,     6,
       6,     6,     6,     1,     1,     1,     1,     1,     2,     5,
       4,     4,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     1,     1,     1,     1,     1,     1,     1,     3,     4,
       1,     3,     2,     0,     1,     5,     1,     1,     8,     0,
       1,     1,     2,     3,     3,     2,     5,     0,     2,     0,
       1,     1,     2,     3,     1,     2,     3,     3,     1,     1,
       1,     4,     2,     1,     1,     1,     1,     1,     1,     1,
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
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     3,     5,    12,    10,    11,     9,     7,    25,     8,
      14,     0,    13,   302,    24,   303,    22,    23,    17,     0,
       0,     0,     0,   274,     4,     2,     0,     0,    19,     0,
      18,     0,     0,     0,     0,     6,    44,    28,    29,    30,
      27,    31,     0,   268,    32,    35,    33,    34,     0,    26,
      15,    16,     0,     0,     0,     0,     0,    53,     0,     0,
      37,   269,    38,    20,   276,   277,   278,   279,     0,    45,
      55,     0,     0,   291,   292,   293,   294,    48,     0,    21,
      54,     0,    36,   270,     0,    47,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   153,   154,
     155,   156,   157,   301,   300,   214,   296,   297,   299,   298,
      81,   174,   175,     0,     0,   223,    56,    59,    73,    71,
       0,    70,    69,     0,    82,     0,    68,     0,    94,    72,
       0,     0,    60,     0,     0,    61,    62,    63,    67,   186,
     187,     0,   208,   210,   209,     0,   213,     0,    65,    66,
     235,   237,   236,   238,    64,     0,   272,   273,     0,   295,
      46,   233,   268,   232,   230,   231,     0,    49,    51,    50,
      74,    57,    58,     0,     0,   275,   217,   218,   219,   243,
       0,     0,     0,   254,   259,   189,     0,   301,   300,   296,
       0,     0,    76,     0,     0,   224,   225,   228,    75,    79,
     282,   283,   284,     0,    80,    83,    84,    88,    87,    86,
     281,   280,     0,    93,   132,     0,   158,   173,   171,   172,
       0,     0,     0,   205,   212,     0,     0,   271,   341,   339,
     340,   342,   343,   330,   331,   332,   333,   335,   336,   334,
     337,   338,     0,    89,    99,     0,     0,   234,     0,     0,
       0,   180,   183,   282,     0,   244,   245,   248,   247,   264,
     251,   280,   240,   239,   241,     0,     0,   255,   256,     0,
       0,   260,   261,     0,     0,   190,   191,    78,     0,     0,
     178,   222,     0,   227,     0,    91,     0,   106,     0,   285,
     286,   287,   288,   290,   289,     0,     0,     0,     0,     0,
     176,   177,     0,     0,   220,   221,     0,   215,   216,   206,
       0,    97,    95,    96,    77,   304,   305,   306,   108,   107,
     101,     0,   207,    98,     0,   112,   109,   110,   111,    39,
      41,    40,     0,    42,    43,     0,   179,     0,   184,   182,
       0,   242,     0,   250,     0,     0,   257,     0,     0,   262,
       0,     0,     0,     0,     0,   192,   122,   126,   124,   125,
     121,   123,   226,   229,    90,     0,    85,   133,   135,     0,
     170,   165,   166,   168,   163,   169,   167,   164,     0,   161,
     160,   162,   211,   129,   127,   128,   130,   131,   329,   324,
     326,   325,   328,   327,   317,   318,   319,   322,   320,   321,
     323,   316,   308,   314,   307,   309,   310,   311,   312,   313,
     315,     0,     0,     0,   147,   148,     0,     0,   100,    52,
     185,   181,   249,   246,   268,   266,   265,   258,   253,   263,
     252,   193,     0,   197,   195,   199,    92,     0,     0,     0,
     159,   116,   115,   117,   119,   113,   120,   118,   114,     0,
       0,     0,   104,   102,   103,   105,   267,     0,     0,   194,
       0,   204,     0,   200,   201,   134,   136,   139,   138,   137,
     140,   143,   142,   141,   145,   146,   149,   150,   151,   152,
     144,     0,   198,     0,     0,   202,   196,   203,   188
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    39,
      40,    17,    18,    26,    36,    59,   342,    67,    79,    87,
      94,   177,   178,    80,    90,    91,   126,   127,   128,   129,
     130,   131,   132,   133,   134,   214,   215,   216,   135,   253,
     294,   136,   137,   254,   330,   138,   139,   140,   141,   142,
     143,   231,   144,   312,   145,   146,   260,   261,   349,   147,
     148,   149,   284,   285,   286,   364,   469,   472,   473,   474,
     150,   151,   152,   153,   154,   155,   316,   156,   318,   157,
     204,   205,   206,   293,   179,   158,   159,   160,   161,   191,
     264,   265,   266,   267,   268,   269,   162,   163,   276,   277,
     278,   280,   281,   282,   353,   436,    70,    71,   164,   165,
      19,   167,    33,   270,   220,   305,    88,   271,   169,    27,
     334,   421,   255,   256
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -423
static const yytype_int16 yypact[] =
{
      38,  -423,    80,    77,  -423,    60,    62,    67,    54,     4,
     305,   108,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,
    -423,    30,  -423,  -423,  -423,  -423,  -423,  -423,    98,   -19,
     -19,   -19,   -19,  -423,    77,  -423,    34,   112,  -423,    11,
      53,    59,    61,    64,    66,  -423,  -423,  -423,  -423,  -423,
    -423,  -423,    65,    76,  -423,  -423,  -423,  -423,    76,  -423,
    -423,  -423,   134,   144,   133,   157,   158,   189,    54,   161,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,   344,  -423,
     195,    95,   100,  -423,  -423,  -423,  -423,  -423,   -19,  -423,
    -423,   254,  -423,  -423,    13,  -423,   206,   364,   167,   344,
     305,   -18,   104,   217,   218,   219,   118,   175,  -423,  -423,
    -423,  -423,  -423,   -15,    -3,  -423,    50,  -423,  -423,  -423,
    -423,  -423,  -423,   175,   -19,   175,  -423,  -423,  -423,  -423,
     223,  -423,  -423,   224,   273,   139,  -423,   239,  -423,  -423,
     250,   175,  -423,   264,   194,  -423,  -423,  -423,  -423,  -423,
    -423,   265,  -423,  -423,  -423,   104,   165,   174,  -423,  -423,
    -423,  -423,  -423,  -423,  -423,   275,  -423,  -423,   268,  -423,
    -423,  -423,    76,  -423,  -423,  -423,   176,  -423,  -423,  -423,
    -423,  -423,  -423,   173,   -19,  -423,  -423,  -423,  -423,   283,
     290,   291,   297,   284,   286,   274,   325,  -423,  -423,  -423,
     200,    -6,  -423,   329,   226,   228,  -423,  -423,  -423,  -423,
    -423,  -423,  -423,   478,  -423,   253,  -423,  -423,  -423,  -423,
    -423,   231,   478,  -423,  -423,   255,  -423,   202,   202,   202,
     478,   309,   121,  -423,  -423,    17,   214,  -423,  -423,  -423,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,
    -423,  -423,    33,  -423,  -423,   478,   149,  -423,    -2,   175,
       8,  -423,   263,   311,   259,   269,  -423,  -423,  -423,  -423,
    -423,  -423,  -423,  -423,  -423,   478,   352,   284,  -423,   478,
     351,   286,  -423,   478,    22,   274,  -423,  -423,   478,   487,
    -423,  -423,   175,   148,    26,  -423,   273,  -423,   514,  -423,
    -423,  -423,  -423,  -423,  -423,   110,   523,   532,   331,   -19,
    -423,  -423,   -19,   478,  -423,  -423,   104,  -423,  -423,  -423,
     496,   363,   394,   394,  -423,  -423,  -423,  -423,  -423,  -423,
    -423,   541,  -423,   380,   478,  -423,  -423,  -423,  -423,  -423,
    -423,  -423,   279,  -423,  -423,   385,  -423,   -19,  -423,  -423,
     478,  -423,   283,   -71,   400,   401,  -423,   407,   408,  -423,
     409,    20,    20,    20,   410,  -423,  -423,  -423,  -423,  -423,
    -423,   231,  -423,  -423,  -423,   478,  -423,   324,   326,   355,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,   -19,  -423,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,   231,  -423,  -423,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,
    -423,   604,   550,   559,   356,   357,   358,   505,  -423,  -423,
    -423,  -423,  -423,  -423,    76,  -423,  -423,  -423,  -423,  -423,
    -423,  -423,   430,   359,  -423,    10,  -423,   568,   577,   586,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,   101,
     595,   613,  -423,  -423,  -423,  -423,  -423,   454,    20,  -423,
     175,  -423,   447,    10,  -423,  -423,  -423,  -423,  -423,  -423,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,
    -423,    17,  -423,   469,   471,  -423,  -423,  -423,  -423
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -423,  -423,   474,  -423,   452,  -423,  -423,  -423,  -423,  -423,
    -423,  -423,  -423,   419,  -423,  -423,  -423,  -423,  -423,  -423,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,   391,  -423,  -423,
    -423,  -423,  -423,   237,  -423,  -423,  -423,   196,   -94,  -120,
    -423,  -423,  -423,  -423,  -423,  -423,  -423,  -423,   238,  -423,
    -423,  -423,  -423,  -423,  -423,  -422,  -423,   154,  -423,  -423,
    -423,  -423,  -423,  -423,   221,  -423,  -423,  -423,  -423,    29,
    -423,  -423,   -86,  -423,  -423,  -423,    12,  -227,  -423,   398,
    -423,  -423,  -285,  -423,   260,  -423,  -423,  -423,  -423,   -92,
    -423,  -423,   210,  -423,  -250,   230,  -423,  -423,  -423,  -423,
     294,  -423,  -423,   308,  -423,  -423,  -167,   540,  -423,  -423,
     -10,  -423,   507,  -125,  -423,   -89,   -88,   -91,  -423,   -28,
    -423,  -292,  -423,  -423
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -220
static const yytype_int16 yytable[] =
{
     168,    41,    42,    43,    44,   257,   168,   372,   317,   219,
     192,   184,   346,   200,   218,   190,   201,   170,    23,   186,
     187,   115,    99,   471,   188,   354,   434,    25,   435,   357,
     422,   423,   202,   360,   207,   339,   361,   340,    46,   470,
     217,   427,     1,   221,   341,    83,    84,    85,    86,   362,
     225,   471,   363,   232,   186,   187,   314,   186,   187,   188,
      95,   315,   188,   234,   320,   108,   109,   110,   111,   112,
     113,   114,   321,   322,   323,   116,   117,   118,   119,   120,
       4,   166,     5,     6,     7,     8,   324,   166,   295,   189,
       9,    23,  -217,    24,    10,  -217,   203,   297,   213,    20,
      25,    21,   213,   289,  -218,   308,    22,  -218,    28,   171,
     172,   173,    34,   174,   175,   176,    61,   347,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
     335,   374,   375,    37,   442,   443,   444,    38,   343,   306,
     307,   484,   485,   313,   325,   326,   327,   197,   198,   380,
     319,    60,   199,   117,   118,   119,   262,  -219,   329,    62,
    -219,   333,    63,   366,    64,   338,   332,    65,   345,    66,
     344,   219,    68,    73,    75,   310,   218,   299,   300,   301,
     302,   303,   304,    69,    74,   493,   197,   198,   391,   336,
     337,   199,   117,   118,   119,   370,    76,    77,   371,    78,
      82,   207,   217,    92,    89,   221,   183,   379,    93,   428,
     180,   189,   197,   198,   381,   384,   387,   199,   117,   118,
     119,   193,   194,   195,   392,   125,   396,   208,   209,   397,
     311,   197,   198,   227,   228,   229,   199,   117,   118,   119,
     426,   492,   222,   223,   171,   172,   173,   230,   174,   175,
     446,   186,   187,   115,   224,    96,   188,    97,   299,   300,
     301,   302,   303,   304,   317,    98,    99,   466,   226,   233,
     100,    10,   101,   102,   103,   235,   104,   236,   105,   237,
     106,   389,   259,   258,   390,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   272,   273,   116,   117,   118,   119,
     120,   274,   283,   275,   279,   121,   122,   123,   124,   288,
     197,   198,   210,   211,   212,   199,   117,   118,   119,   262,
     197,   198,   263,   211,   212,   199,   117,   118,   119,   287,
     452,   455,   458,   290,   291,   213,   465,   292,   238,   239,
     240,   241,   242,   243,   244,   245,   246,   247,   248,   249,
     250,   251,    29,    30,    31,    32,   477,   480,   483,   348,
     450,   125,   296,   309,   298,    96,   350,   351,   181,   488,
     490,   252,   213,   355,   358,    98,    99,   213,   352,   207,
     100,    10,   101,   102,   103,   388,   104,   429,   105,   430,
     106,    83,    84,    85,    86,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   437,   438,   116,   117,   118,   119,
     120,   439,   440,   441,   445,   121,   122,   123,   124,   398,
     399,   400,   401,   402,   403,   404,   405,   406,   407,   408,
     409,   410,   411,   447,   467,   448,   398,   399,   400,   401,
     402,   403,   404,   405,   406,   407,   408,   409,   410,   411,
     398,   399,   400,   401,   402,   403,   404,   405,   406,   407,
     408,   409,   410,   411,   449,   459,   460,   461,   468,   491,
    -214,   125,   494,   497,   412,   498,   413,   414,   415,   416,
     417,   418,   419,   420,   213,    35,    45,    81,   182,   328,
     331,   412,   376,   413,   414,   415,   416,   417,   418,   419,
     420,   431,   495,   496,   196,   412,   365,   413,   414,   415,
     416,   417,   418,   419,   420,   197,   198,   210,   211,   212,
     199,   117,   118,   119,   197,   198,   367,   368,   369,   199,
     117,   118,   119,   197,   198,   393,   394,   395,   199,   117,
     118,   119,   197,   198,   462,   463,   464,   199,   117,   118,
     119,   197,   198,   373,   377,   378,   199,   117,   118,   119,
     197,   198,   433,   382,   383,   199,   117,   118,   119,   197,
     198,   356,   385,   386,   199,   117,   118,   119,   197,   198,
     432,   424,   425,   199,   117,   118,   119,   197,   198,   359,
     453,   454,   199,   117,   118,   119,   197,   198,    72,   456,
     457,   199,   117,   118,   119,   197,   198,   185,   475,   476,
     199,   117,   118,   119,   197,   198,     0,   478,   479,   199,
     117,   118,   119,   197,   198,     0,   481,   482,   199,   117,
     118,   119,   197,   198,     0,   486,   487,   199,   117,   118,
     119,   197,   198,   451,     0,     0,   199,   117,   118,   119,
     197,   198,     0,     0,   489,   199,   117,   118,   119
};

static const yytype_int16 yycheck[] =
{
      91,    29,    30,    31,    32,   172,    97,   292,   235,   134,
     102,    99,     4,   107,   134,   101,   107,     4,    37,    37,
      38,    39,    12,   445,    42,   275,    97,    46,    99,   279,
     322,   323,   123,   283,   125,    37,    14,    39,     4,    29,
     134,   333,     4,   134,    46,    47,    48,    49,    50,    27,
     141,   473,    30,   144,    37,    38,    39,    37,    38,    42,
      88,    44,    42,   155,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
       0,    91,     5,     6,     7,     8,    53,    97,   213,   107,
      13,    37,   107,    39,    17,   110,   124,   222,   104,    39,
      46,    39,   104,   109,   107,   230,    39,   110,   104,    96,
      97,    98,     4,   100,   101,   102,   105,   109,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
     255,   105,   106,   103,   361,   362,   363,    39,   258,   228,
     229,    40,    41,   232,   111,   112,   113,    37,    38,    39,
     236,    39,    42,    43,    44,    45,   184,   107,   252,   106,
     110,   252,   103,   288,   103,   256,   252,   103,   259,   103,
     258,   296,   107,    39,    41,    54,   296,    56,    57,    58,
      59,    60,    61,   107,    40,   470,    37,    38,   313,    40,
      41,    42,    43,    44,    45,   289,    39,    39,   289,    10,
      39,   292,   296,   108,     9,   296,    39,   298,   108,   334,
       4,   107,    37,    38,   305,   306,   307,    42,    43,    44,
      45,     4,     4,     4,   316,   107,   320,     4,     4,   320,
     109,    37,    38,    39,    40,    41,    42,    43,    44,    45,
     331,   468,   103,     4,    96,    97,    98,    53,   100,   101,
     375,    37,    38,    39,     4,     1,    42,     3,    56,    57,
      58,    59,    60,    61,   491,    11,    12,   434,     4,     4,
      16,    17,    18,    19,    20,   110,    22,   103,    24,     4,
      26,   309,   109,   107,   312,    31,    32,    33,    34,    35,
      36,    37,    38,    39,     4,     4,    42,    43,    44,    45,
      46,     4,    28,    19,    18,    51,    52,    53,    54,   109,
      37,    38,    39,    40,    41,    42,    43,    44,    45,   347,
      37,    38,    39,    40,    41,    42,    43,    44,    45,     4,
     421,   422,   423,     4,   108,   104,   427,   109,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    47,    48,    49,    50,   447,   448,   449,    96,
     388,   107,   109,    54,   109,     1,    55,   108,     4,   460,
     461,   103,   104,    21,    23,    11,    12,   104,   109,   470,
      16,    17,    18,    19,    20,    54,    22,   108,    24,     4,
      26,    47,    48,    49,    50,    31,    32,    33,    34,    35,
      36,    37,    38,    39,     4,     4,    42,    43,    44,    45,
      46,     4,     4,     4,     4,    51,    52,    53,    54,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,   109,     4,   109,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,   109,   109,   109,   109,   109,    15,
     107,   107,    25,     4,   111,     4,   113,   114,   115,   116,
     117,   118,   119,   120,   104,    11,    34,    68,    97,   252,
     252,   111,   296,   113,   114,   115,   116,   117,   118,   119,
     120,   347,   473,   491,   106,   111,   285,   113,   114,   115,
     116,   117,   118,   119,   120,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    37,    38,   293,    40,    41,    42,    43,    44,    45,
      37,    38,   352,    40,    41,    42,    43,    44,    45,    37,
      38,   277,    40,    41,    42,    43,    44,    45,    37,    38,
     350,    40,    41,    42,    43,    44,    45,    37,    38,   281,
      40,    41,    42,    43,    44,    45,    37,    38,    58,    40,
      41,    42,    43,    44,    45,    37,    38,   100,    40,    41,
      42,    43,    44,    45,    37,    38,    -1,    40,    41,    42,
      43,    44,    45,    37,    38,    -1,    40,    41,    42,    43,
      44,    45,    37,    38,    -1,    40,    41,    42,    43,    44,
      45,    37,    38,    39,    -1,    -1,    42,    43,    44,    45,
      37,    38,    -1,    -1,    41,    42,    43,    44,    45
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   122,   123,     0,     5,     6,     7,     8,    13,
      17,   124,   125,   126,   127,   128,   129,   132,   133,   231,
      39,    39,    39,    37,    39,    46,   134,   240,   104,    47,
      48,    49,    50,   233,     4,   123,   135,   103,    39,   130,
     131,   240,   240,   240,   240,   125,     4,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,   136,
      39,   105,   106,   103,   103,   103,   103,   138,   107,   107,
     227,   228,   228,    39,    40,    41,    39,    39,    10,   139,
     144,   134,    39,    47,    48,    49,    50,   140,   237,     9,
     145,   146,   108,   108,   141,   240,     1,     3,    11,    12,
      16,    18,    19,    20,    22,    24,    26,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    42,    43,    44,    45,
      46,    51,    52,    53,    54,   107,   147,   148,   149,   150,
     151,   152,   153,   154,   155,   159,   162,   163,   166,   167,
     168,   169,   170,   171,   173,   175,   176,   180,   181,   182,
     191,   192,   193,   194,   195,   196,   198,   200,   206,   207,
     208,   209,   217,   218,   229,   230,   231,   232,   238,   239,
       4,    96,    97,    98,   100,   101,   102,   142,   143,   205,
       4,     4,   148,    39,   237,   233,    37,    38,    42,   107,
     193,   210,   210,     4,     4,     4,   200,    37,    38,    42,
     159,   238,   238,   240,   201,   202,   203,   238,     4,     4,
      39,    40,    41,   104,   156,   157,   158,   159,   160,   234,
     235,   238,   103,     4,     4,   238,     4,    39,    40,    41,
      53,   172,   238,     4,   210,   110,   103,     4,    70,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,   103,   160,   164,   243,   244,   227,   107,   109,
     177,   178,   240,    39,   211,   212,   213,   214,   215,   216,
     234,   238,     4,     4,     4,    19,   219,   220,   221,    18,
     222,   223,   224,    28,   183,   184,   185,     4,   109,   109,
       4,   108,   109,   204,   161,   234,   109,   234,   109,    56,
      57,    58,    59,    60,    61,   236,   236,   236,   234,    54,
      54,   109,   174,   236,    39,    44,   197,   198,   199,   193,
      31,    39,    40,    41,    53,   111,   112,   113,   154,   159,
     165,   169,   193,   238,   241,   234,    40,    41,   238,    37,
      39,    46,   137,   160,   237,   238,     4,   109,    96,   179,
      55,   108,   109,   225,   215,    21,   221,   215,    23,   224,
     215,    14,    27,    30,   186,   185,   234,    39,    40,    41,
     159,   238,   203,   205,   105,   106,   158,    40,    41,   238,
      39,   238,    40,    41,   238,    40,    41,   238,    54,   240,
     240,   234,   210,    39,    40,    41,   159,   238,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,   111,   113,   114,   115,   116,   117,   118,   119,
     120,   242,   242,   242,    40,    41,   238,   242,   234,   108,
       4,   178,   216,   213,    97,    99,   226,     4,     4,     4,
       4,     4,   198,   198,   198,     4,   234,   109,   109,   109,
     240,    39,   238,    40,    41,   238,    40,    41,   238,   109,
     109,   109,    39,    40,    41,   238,   227,     4,   109,   187,
      29,   176,   188,   189,   190,    40,    41,   238,    40,    41,
     238,    40,    41,   238,    40,    41,    40,    41,   238,    41,
     238,    15,   198,   203,    25,   190,   197,     4,     4
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
    { set_namespace(lexer, (yyvsp[(3) - (4)].fixme)); ;}
    break;

  case 17:
#line 482 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 18:
#line 484 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].fixme); ;}
    break;

  case 19:
#line 488 "pir.y"
    { (yyval.fixme) = new_key(expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)))); ;}
    break;

  case 20:
#line 490 "pir.y"
    { (yyval.fixme) = add_key((yyvsp[(1) - (3)].fixme), expr_from_const(new_const(STRING_TYPE, (yyvsp[(3) - (3)].sval)))); ;}
    break;

  case 22:
#line 503 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 27:
#line 515 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_ANON);;}
    break;

  case 28:
#line 517 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_INIT); ;}
    break;

  case 29:
#line 519 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LOAD); ;}
    break;

  case 30:
#line 521 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MAIN); ;}
    break;

  case 31:
#line 523 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_METHOD); ;}
    break;

  case 32:
#line 525 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_LEX); ;}
    break;

  case 33:
#line 527 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_POSTCOMP); ;}
    break;

  case 34:
#line 529 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_IMMEDIATE); ;}
    break;

  case 35:
#line 531 "pir.y"
    { set_sub_flag(lexer, SUB_FLAG_MULTI); ;}
    break;

  case 36:
#line 533 "pir.y"
    { set_sub_outer(lexer, (yyvsp[(3) - (4)].sval)); ;}
    break;

  case 37:
#line 535 "pir.y"
    { set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 38:
#line 537 "pir.y"
    { set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 47:
#line 555 "pir.y"
    { add_param(lexer, (yyvsp[(1) - (2)].ival), (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 48:
#line 559 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 49:
#line 561 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 52:
#line 569 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 55:
#line 578 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 57:
#line 583 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 58:
#line 585 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 74:
#line 607 "pir.y"
    {
                           if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 76:
#line 620 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 77:
#line 622 "pir.y"
    { set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 78:
#line 626 "pir.y"
    { set_instrf(lexer, "get_results", "%T", (yyvsp[(2) - (3)].targ)); ;}
    break;

  case 81:
#line 636 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 86:
#line 648 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 87:
#line 650 "pir.y"
    { push_operand(lexer, expr_from_key((yyvsp[(1) - (1)].key))); ;}
    break;

  case 88:
#line 652 "pir.y"
    { push_operand(lexer, expr_from_target((yyvsp[(1) - (1)].targ))); ;}
    break;

  case 89:
#line 656 "pir.y"
    {
                            (yyvsp[(1) - (2)].targ)->key = (yyvsp[(2) - (2)].key);
                            (yyval.targ) = (yyvsp[(1) - (2)].targ);
                         ;}
    break;

  case 90:
#line 663 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 91:
#line 667 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 92:
#line 669 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 95:
#line 678 "pir.y"
    {
                           if ((yyvsp[(3) - (3)].ival) == 0)   /* x = 0 -> null x */
                               set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                           else
                               set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].ival));
                         ;}
    break;

  case 96:
#line 685 "pir.y"
    {
                           if ((yyvsp[(3) - (3)].dval) == 0.0)  /* x = 0.0 -> null x */
                               set_instrf(lexer, "null", "%T", (yyvsp[(1) - (3)].targ));
                           else
                               set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].dval));

                         ;}
    break;

  case 97:
#line 693 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 98:
#line 695 "pir.y"
    {
                           if (targets_equal((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)))
                               set_instr(lexer, "nop");
                           else
                               set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ));

                         ;}
    break;

  case 99:
#line 703 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (2)].targ))); ;}
    break;

  case 100:
#line 705 "pir.y"
    { set_instrf(lexer, (yyvsp[(3) - (4)].sval), "%T%E", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 101:
#line 707 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 102:
#line 709 "pir.y"
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

  case 103:
#line 739 "pir.y"
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

  case 104:
#line 777 "pir.y"
    {
                            if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ)))
                                /* x = x . "hi" -> x .= "hi" */
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%s", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].sval));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%s", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].sval));

                         ;}
    break;

  case 105:
#line 786 "pir.y"
    {
                           if (targets_equal((yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ)))
                               set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(5) - (5)].targ));
                           else
                               set_instrf(lexer, opnames[(yyvsp[(4) - (5)].ival)], "%T%T%T", (yyvsp[(1) - (5)].targ), (yyvsp[(3) - (5)].targ), (yyvsp[(5) - (5)].targ));
                         ;}
    break;

  case 106:
#line 793 "pir.y"
    { set_instrf(lexer, "set", "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 107:
#line 795 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 108:
#line 797 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 109:
#line 801 "pir.y"
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

  case 110:
#line 814 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%n", (yyvsp[(2) - (2)].dval)); ;}
    break;

  case 111:
#line 816 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%T", (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 112:
#line 818 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(1) - (2)].ival)], "%E", (yyvsp[(2) - (2)].expr)); ;}
    break;

  case 113:
#line 833 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 114:
#line 835 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 115:
#line 837 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 116:
#line 839 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_s_s(yyscanner, (yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval))); ;}
    break;

  case 117:
#line 841 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_i(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 118:
#line 843 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_n(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 119:
#line 845 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_i_n(yyscanner, (yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))); ;}
    break;

  case 120:
#line 847 "pir.y"
    { set_instrf(lexer, "set", "%C", fold_n_i(yyscanner, (yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))); ;}
    break;

  case 121:
#line 879 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ)); ;}
    break;

  case 122:
#line 881 "pir.y"
    { set_instrf(lexer, "set", "%T%E", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].expr)); ;}
    break;

  case 123:
#line 883 "pir.y"
    {
                            if (targets_equal((yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ)))
                                /* set $I0, $I0 -> delete */
                                set_instr(lexer, "nop");
                            else
                                set_instrf(lexer, "set", "%T%T", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].targ));
                        ;}
    break;

  case 124:
#line 891 "pir.y"
    {
                       if ((yyvsp[(4) - (4)].ival) == 0)
                           /* set $I0, 0 -> null $I0 */
                           set_instrf(lexer, "null", "%T", (yyvsp[(2) - (4)].targ));
                       else
                           set_instrf(lexer, "set", "%T%i", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].ival));
                    ;}
    break;

  case 125:
#line 899 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].dval) == 0) /* set $N0, 0.0 -> null $N0 */
                            set_instrf(lexer, "null", "%T", (yyvsp[(2) - (4)].targ));
                        else
                            set_instrf(lexer, "set", "%T%n", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].dval));
                    ;}
    break;

  case 126:
#line 906 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 127:
#line 908 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].ival) == 0) /* $I0 = set 0 -> null $I0 */
                            set_instrf(lexer, "null", "%T", (yyvsp[(1) - (4)].targ));
                        else
                            set_instrf(lexer, "set", "%T%i", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].ival));
                    ;}
    break;

  case 128:
#line 915 "pir.y"
    {
                        if ((yyvsp[(4) - (4)].dval) == 0) /* $N0 = set 0.0 -> null $N0 */
                            set_instrf(lexer, "null", "%T", (yyvsp[(1) - (4)].targ));
                        else
                            set_instrf(lexer, "set", "%T%n", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].dval));
                    ;}
    break;

  case 129:
#line 922 "pir.y"
    { set_instrf(lexer, "set", "%T%s", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 130:
#line 924 "pir.y"
    { set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ)); ;}
    break;

  case 131:
#line 926 "pir.y"
    {
                        if (targets_equal((yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ))) /* $I0 = set $I0 -> delete */
                            set_instr(lexer, "nop");
                        else
                            set_instrf(lexer, "set", "%T%T", (yyvsp[(1) - (4)].targ), (yyvsp[(4) - (4)].targ));
                    ;}
    break;

  case 133:
#line 962 "pir.y"
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

  case 134:
#line 977 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_i_i(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 135:
#line 979 "pir.y"
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

  case 136:
#line 1002 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_i_n(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 137:
#line 1004 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_n_n(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 138:
#line 1006 "pir.y"
    { set_instrf(lexer, "set", "%T%C", (yyvsp[(2) - (6)].targ), fold_n_i(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(1) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 139:
#line 1008 "pir.y"
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

  case 140:
#line 1030 "pir.y"
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

  case 141:
#line 1043 "pir.y"
    {
                            if (targets_equal((yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ)))
                                /* op $N0, $N0, $N1 -> op $N0, $N1 */
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(1) - (6)].ival)], "%T%T%T", (yyvsp[(2) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].targ));

                        ;}
    break;

  case 142:
#line 1052 "pir.y"
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

  case 143:
#line 1072 "pir.y"
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

  case 144:
#line 1107 "pir.y"
    {
                            if (targets_equal((yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ)))
                                set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(6) - (6)].targ));
                            else
                                set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%T%T", (yyvsp[(1) - (6)].targ), (yyvsp[(4) - (6)].targ), (yyvsp[(6) - (6)].targ));
                        ;}
    break;

  case 145:
#line 1114 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%C", (yyvsp[(1) - (6)].targ), fold_i_i(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].ival))); ;}
    break;

  case 146:
#line 1116 "pir.y"
    { set_instrf(lexer, opnames[(yyvsp[(3) - (6)].ival)], "%T%C", (yyvsp[(1) - (6)].targ), fold_i_n(yyscanner, (yyvsp[(4) - (6)].ival), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].dval))); ;}
    break;

  case 147:
#line 1118 "pir.y"
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

  case 148:
#line 1132 "pir.y"
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

  case 149:
#line 1143 "pir.y"
    {
                            /* $N0 = add 1.5, 10 -> set $N0, 15 */
                            set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (6)].targ), fold_n_i(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].ival)));
                        ;}
    break;

  case 150:
#line 1148 "pir.y"
    {
                            /* $I0 = add 1, 2 -> $I0 = 3 */
                            set_instrf(lexer, "set", "%T%C", (yyvsp[(1) - (6)].targ), fold_n_n(yyscanner, (yyvsp[(4) - (6)].dval), (yyvsp[(3) - (6)].ival), (yyvsp[(6) - (6)].dval)));
                        ;}
    break;

  case 151:
#line 1153 "pir.y"
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

  case 152:
#line 1164 "pir.y"
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

  case 153:
#line 1184 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 154:
#line 1185 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 155:
#line 1186 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 156:
#line 1187 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 157:
#line 1188 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 159:
#line 1196 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null", "%E%I", (yyvsp[(3) - (5)].expr), (yyvsp[(5) - (5)].sval)); ;}
    break;

  case 160:
#line 1198 "pir.y"
    { set_instrf(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if", "%T%I", (yyvsp[(2) - (4)].targ), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 161:
#line 1200 "pir.y"
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

  case 162:
#line 1227 "pir.y"
    {
                           set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%T%E", (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].expr));
                           (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                         ;}
    break;

  case 163:
#line 1232 "pir.y"
    {
                           set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%i%T", (yyvsp[(1) - (3)].ival), (yyvsp[(3) - (3)].targ));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 164:
#line 1237 "pir.y"
    {
                           set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%n%T", (yyvsp[(1) - (3)].dval), (yyvsp[(3) - (3)].targ));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 165:
#line 1242 "pir.y"
    {
                           set_instrf(lexer, opnames[(yyvsp[(2) - (3)].ival)], "%s%T", (yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].targ));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 166:
#line 1247 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 167:
#line 1249 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 168:
#line 1251 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 169:
#line 1253 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 170:
#line 1255 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 171:
#line 1257 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].ival) ? 1 : 0; ;}
    break;

  case 172:
#line 1259 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].dval) ? 1 : 0; ;}
    break;

  case 173:
#line 1261 "pir.y"
    { (yyval.ival) = evaluate_s((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 174:
#line 1264 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 175:
#line 1265 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 178:
#line 1273 "pir.y"
    { set_instrf(lexer, "branch", "%I", (yyvsp[(2) - (3)].sval)); ;}
    break;

  case 179:
#line 1277 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].sym)); ;}
    break;

  case 180:
#line 1281 "pir.y"
    { (yyval.sym) = (yyvsp[(1) - (1)].sym); ;}
    break;

  case 181:
#line 1283 "pir.y"
    { (yyval.sym) = add_local((yyvsp[(1) - (3)].sym), (yyvsp[(3) - (3)].sym)); ;}
    break;

  case 182:
#line 1287 "pir.y"
    { (yyval.sym) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 183:
#line 1290 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 184:
#line 1291 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 185:
#line 1295 "pir.y"
    {
                           if ((yyvsp[(4) - (5)].targ)->type == PMC_TYPE)
                               set_lex_flag((yyvsp[(4) - (5)].targ), (yyvsp[(2) - (5)].sval));
                           else
                               yyerror(yyscanner, lexer,
                                       "second argument to .lex must be of type PMC");
                         ;}
    break;

  case 188:
#line 1316 "pir.y"
    { /* $4 contains an invocation object */
                              set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                              set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                            ;}
    break;

  case 189:
#line 1323 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 190:
#line 1325 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 191:
#line 1329 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 192:
#line 1331 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 193:
#line 1335 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 194:
#line 1339 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 195:
#line 1341 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 196:
#line 1344 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 197:
#line 1348 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 198:
#line 1350 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 199:
#line 1354 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 200:
#line 1356 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 201:
#line 1360 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 202:
#line 1362 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 203:
#line 1366 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 204:
#line 1368 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 206:
#line 1376 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 207:
#line 1378 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 208:
#line 1380 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 211:
#line 1388 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 212:
#line 1395 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 213:
#line 1402 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 214:
#line 1404 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 217:
#line 1412 "pir.y"
    { (yyval.targ) = target_from_ident(PMC_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 218:
#line 1414 "pir.y"
    { /* local identifiers */
                              if ((yyvsp[(1) - (1)].sym)->type != PMC_TYPE)
                                  yyerror(yyscanner, lexer,
                                          "invokable identifier must be of type PMC");

                              (yyval.targ) = target_from_symbol((yyvsp[(1) - (1)].sym));
                            ;}
    break;

  case 219:
#line 1422 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 220:
#line 1426 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 221:
#line 1428 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 222:
#line 1433 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 223:
#line 1437 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 224:
#line 1439 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 225:
#line 1443 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 226:
#line 1445 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 227:
#line 1449 "pir.y"
    {
                              (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 228:
#line 1456 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 229:
#line 1458 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 230:
#line 1462 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 231:
#line 1464 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 232:
#line 1466 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 233:
#line 1468 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 234:
#line 1470 "pir.y"
    {
                              (yyval.ival) = TARGET_FLAG_NAMED;
                              set_alias(lexer, (yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 239:
#line 1488 "pir.y"
    {
                              (yyval.fixme) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 240:
#line 1493 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 241:
#line 1497 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                            ;}
    break;

  case 242:
#line 1504 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 243:
#line 1508 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 244:
#line 1510 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 245:
#line 1514 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 246:
#line 1516 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 249:
#line 1524 "pir.y"
    {
                              (yyval.argm) = (yyvsp[(3) - (3)].argm);
                              lexer->curarg->alias = (yyvsp[(1) - (3)].sval);
                              SET_FLAG(lexer->curarg->flags, ARG_FLAG_NAMED);
                            ;}
    break;

  case 250:
#line 1532 "pir.y"
    {
                              (yyval.argm) = (yyvsp[(1) - (2)].argm);
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 251:
#line 1539 "pir.y"
    { (yyval.argm) = lexer->curarg = new_argument((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 252:
#line 1545 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 253:
#line 1554 "pir.y"
    {
                              (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 254:
#line 1561 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 255:
#line 1563 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 256:
#line 1568 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 257:
#line 1570 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 258:
#line 1575 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 259:
#line 1579 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 260:
#line 1581 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 261:
#line 1585 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 262:
#line 1587 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 263:
#line 1591 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 264:
#line 1596 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 265:
#line 1598 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 266:
#line 1602 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 267:
#line 1604 "pir.y"
    {
                               (yyval.ival) = ARG_FLAG_NAMED;
                               lexer->curarg->alias = (yyvsp[(2) - (2)].sval);
                             ;}
    break;

  case 268:
#line 1611 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 269:
#line 1613 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 270:
#line 1617 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 274:
#line 1628 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 275:
#line 1632 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), GLOBALCONST); ;}
    break;

  case 276:
#line 1636 "pir.y"
    { (yyval.constval) = new_named_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 277:
#line 1638 "pir.y"
    { (yyval.constval) = new_named_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 278:
#line 1640 "pir.y"
    { (yyval.constval) = new_named_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 279:
#line 1642 "pir.y"
    { (yyval.constval) = new_named_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 280:
#line 1650 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 281:
#line 1651 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 282:
#line 1654 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 283:
#line 1655 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 284:
#line 1656 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 285:
#line 1659 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 286:
#line 1660 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 287:
#line 1661 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 288:
#line 1662 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 289:
#line 1663 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 290:
#line 1664 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 291:
#line 1667 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 292:
#line 1668 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 293:
#line 1669 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 294:
#line 1670 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 295:
#line 1678 "pir.y"
    { set_curtarget(lexer, (yyvsp[(1) - (1)].targ));  ;}
    break;

  case 296:
#line 1681 "pir.y"
    { (yyval.targ) = reg(lexer, PMC_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 297:
#line 1682 "pir.y"
    { (yyval.targ) = reg(lexer, NUM_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 298:
#line 1683 "pir.y"
    { (yyval.targ) = reg(lexer, INT_TYPE, (yyvsp[(1) - (1)].ival));    ;}
    break;

  case 299:
#line 1684 "pir.y"
    { (yyval.targ) = reg(lexer, STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 300:
#line 1685 "pir.y"
    { (yyval.targ) = target_from_symbol((yyvsp[(1) - (1)].sym)); ;}
    break;

  case 301:
#line 1686 "pir.y"
    { /*
                            * if an TK_IDENT was returned, that means the ID was not
                            * declared; emit an error.
                            */
                           yyerror(yyscanner, lexer, "symbol not declared!");
                           /* to prevent seg. faulting, always return something */
                           (yyval.targ) = new_target(UNKNOWN_TYPE, (yyvsp[(1) - (1)].sval));
                         ;}
    break;

  case 304:
#line 1700 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 305:
#line 1701 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 306:
#line 1702 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 307:
#line 1705 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 308:
#line 1706 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 309:
#line 1707 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 310:
#line 1708 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 311:
#line 1709 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 312:
#line 1710 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 313:
#line 1711 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 314:
#line 1712 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 315:
#line 1713 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 316:
#line 1714 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 317:
#line 1715 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 318:
#line 1716 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 319:
#line 1717 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 320:
#line 1718 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 321:
#line 1719 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 322:
#line 1720 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 323:
#line 1721 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 324:
#line 1722 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 325:
#line 1723 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 326:
#line 1724 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 327:
#line 1725 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 328:
#line 1726 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 329:
#line 1727 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 330:
#line 1733 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 331:
#line 1734 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 332:
#line 1735 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 333:
#line 1736 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 334:
#line 1737 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 335:
#line 1738 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 336:
#line 1739 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 337:
#line 1740 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 338:
#line 1741 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 339:
#line 1742 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 340:
#line 1743 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 341:
#line 1744 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 342:
#line 1747 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 343:
#line 1748 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 4063 "pirparser.c"
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


#line 1751 "pir.y"


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


