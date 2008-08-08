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
     TK_IDENT = 286,
     TK_STRINGC = 287,
     TK_INTC = 288,
     TK_NUMC = 289,
     TK_PREG = 290,
     TK_NREG = 291,
     TK_SREG = 292,
     TK_IREG = 293,
     TK_PARROT_OP = 294,
     TK_INT = 295,
     TK_NUM = 296,
     TK_PMC = 297,
     TK_STRING = 298,
     TK_IF = 299,
     TK_UNLESS = 300,
     TK_NULL = 301,
     TK_GOTO = 302,
     TK_ARROW = 303,
     TK_NE = 304,
     TK_EQ = 305,
     TK_LT = 306,
     TK_LE = 307,
     TK_GT = 308,
     TK_GE = 309,
     TK_USHIFT = 310,
     TK_RSHIFT = 311,
     TK_LSHIFT = 312,
     TK_FDIV = 313,
     TK_OR = 314,
     TK_AND = 315,
     TK_XOR = 316,
     TK_CONC = 317,
     TK_ASSIGN_USHIFT = 318,
     TK_ASSIGN_RSHIFT = 319,
     TK_ASSIGN_LSHIFT = 320,
     TK_ASSIGN_INC = 321,
     TK_ASSIGN_DEC = 322,
     TK_ASSIGN_MUL = 323,
     TK_ASSIGN_MOD = 324,
     TK_ASSIGN_POW = 325,
     TK_ASSIGN_DIV = 326,
     TK_ASSIGN_BOR = 327,
     TK_ASSIGN_BAND = 328,
     TK_ASSIGN_FDIV = 329,
     TK_ASSIGN_BNOT = 330,
     TK_ASSIGN_CONC = 331,
     TK_FLAG_INIT = 332,
     TK_FLAG_LOAD = 333,
     TK_FLAG_MAIN = 334,
     TK_FLAG_ANON = 335,
     TK_FLAG_METHOD = 336,
     TK_FLAG_OUTER = 337,
     TK_FLAG_VTABLE = 338,
     TK_FLAG_LEX = 339,
     TK_FLAG_MULTI = 340,
     TK_FLAG_POSTCOMP = 341,
     TK_FLAG_IMMEDIATE = 342,
     TK_FLAG_LEXID = 343,
     TK_FLAG_UNIQUE_REG = 344,
     TK_FLAG_NAMED = 345,
     TK_FLAG_SLURPY = 346,
     TK_FLAG_FLAT = 347,
     TK_FLAG_OPTIONAL = 348,
     TK_FLAG_OPT_FLAG = 349,
     TK_FLAG_INVOCANT = 350
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
#define TK_IDENT 286
#define TK_STRINGC 287
#define TK_INTC 288
#define TK_NUMC 289
#define TK_PREG 290
#define TK_NREG 291
#define TK_SREG 292
#define TK_IREG 293
#define TK_PARROT_OP 294
#define TK_INT 295
#define TK_NUM 296
#define TK_PMC 297
#define TK_STRING 298
#define TK_IF 299
#define TK_UNLESS 300
#define TK_NULL 301
#define TK_GOTO 302
#define TK_ARROW 303
#define TK_NE 304
#define TK_EQ 305
#define TK_LT 306
#define TK_LE 307
#define TK_GT 308
#define TK_GE 309
#define TK_USHIFT 310
#define TK_RSHIFT 311
#define TK_LSHIFT 312
#define TK_FDIV 313
#define TK_OR 314
#define TK_AND 315
#define TK_XOR 316
#define TK_CONC 317
#define TK_ASSIGN_USHIFT 318
#define TK_ASSIGN_RSHIFT 319
#define TK_ASSIGN_LSHIFT 320
#define TK_ASSIGN_INC 321
#define TK_ASSIGN_DEC 322
#define TK_ASSIGN_MUL 323
#define TK_ASSIGN_MOD 324
#define TK_ASSIGN_POW 325
#define TK_ASSIGN_DIV 326
#define TK_ASSIGN_BOR 327
#define TK_ASSIGN_BAND 328
#define TK_ASSIGN_FDIV 329
#define TK_ASSIGN_BNOT 330
#define TK_ASSIGN_CONC 331
#define TK_FLAG_INIT 332
#define TK_FLAG_LOAD 333
#define TK_FLAG_MAIN 334
#define TK_FLAG_ANON 335
#define TK_FLAG_METHOD 336
#define TK_FLAG_OUTER 337
#define TK_FLAG_VTABLE 338
#define TK_FLAG_LEX 339
#define TK_FLAG_MULTI 340
#define TK_FLAG_POSTCOMP 341
#define TK_FLAG_IMMEDIATE 342
#define TK_FLAG_LEXID 343
#define TK_FLAG_UNIQUE_REG 344
#define TK_FLAG_NAMED 345
#define TK_FLAG_SLURPY 346
#define TK_FLAG_FLAT 347
#define TK_FLAG_OPTIONAL 348
#define TK_FLAG_OPT_FLAG 349
#define TK_FLAG_INVOCANT 350




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
#line 180 "pir.y"
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
#line 480 "pirparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 493 "pirparser.c"

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
#define YYLAST   488

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  114
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  121
/* YYNRULES -- Number of rules.  */
#define YYNRULES  296
/* YYNRULES -- Number of states.  */
#define YYNSTATES  436

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   351

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   105,     2,     2,     2,   110,   112,     2,
     100,   101,   109,   107,   102,   104,   103,   108,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    99,
       2,    96,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    97,     2,    98,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   111,     2,   106,     2,     2,     2,
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
      95,   113
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
     102,   104,   106,   108,   110,   111,   114,   120,   121,   124,
     125,   128,   131,   134,   136,   138,   140,   142,   144,   146,
     148,   150,   152,   154,   156,   158,   160,   162,   165,   168,
     171,   175,   179,   182,   186,   189,   194,   198,   202,   206,
     210,   213,   216,   219,   222,   226,   230,   234,   238,   242,
     246,   250,   254,   258,   261,   264,   266,   267,   269,   271,
     275,   277,   279,   281,   284,   288,   290,   294,   297,   303,
     308,   313,   317,   321,   325,   329,   333,   337,   341,   345,
     347,   349,   351,   353,   355,   357,   359,   363,   368,   370,
     374,   377,   378,   380,   386,   388,   390,   392,   394,   403,
     404,   406,   408,   411,   415,   419,   422,   428,   429,   432,
     433,   435,   437,   440,   444,   446,   449,   453,   457,   459,
     461,   463,   468,   471,   473,   475,   477,   479,   481,   483,
     485,   487,   491,   492,   494,   496,   500,   503,   504,   507,
     509,   511,   513,   515,   518,   519,   522,   524,   526,   531,
     533,   535,   537,   539,   543,   547,   551,   555,   556,   558,
     560,   564,   566,   568,   572,   575,   577,   583,   589,   590,
     592,   594,   597,   601,   602,   604,   606,   609,   613,   614,
     617,   619,   622,   623,   625,   629,   632,   634,   636,   639,
     642,   647,   652,   657,   662,   664,   666,   668,   670,   672,
     674,   676,   678,   680,   682,   684,   686,   688,   690,   692,
     694,   696,   698,   700,   702,   704,   706,   708,   710,   712,
     714,   716,   718,   720,   722,   724,   726,   728,   730,   732,
     734,   736,   738,   740,   742,   744,   746,   748,   750,   752,
     754,   756,   758,   760,   762,   764,   766,   768,   770,   772,
     774,   776,   778,   780,   782,   784,   786
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     115,     0,    -1,   116,   117,   116,    -1,    -1,     4,    -1,
     118,    -1,   117,     4,   118,    -1,   125,    -1,   221,    -1,
     122,    -1,   120,    -1,   121,    -1,   119,    -1,     7,    32,
      -1,     5,    32,    -1,     6,    32,    96,    32,    -1,    13,
      97,   123,    98,    -1,    -1,   124,    -1,    32,    -1,   124,
      99,    32,    -1,   126,   128,     4,   132,   134,     9,    -1,
       8,   127,    -1,   230,    -1,    32,    -1,    -1,   128,   129,
      -1,    80,    -1,    77,    -1,    78,    -1,    79,    -1,    81,
      -1,    84,    -1,    86,    -1,    87,    -1,    85,    -1,   130,
      -1,    82,   100,   127,   101,    -1,    83,   217,    -1,    88,
     218,    -1,   230,    -1,    32,    -1,   154,    -1,   227,    -1,
      -1,   132,   133,    -1,    10,   227,   230,   193,     4,    -1,
      -1,   134,   135,    -1,    -1,   136,   137,    -1,     3,     4,
      -1,     3,   138,    -1,   138,    -1,   156,    -1,   161,    -1,
     162,    -1,   166,    -1,   219,    -1,   196,    -1,   197,    -1,
     168,    -1,   143,    -1,   147,    -1,   142,    -1,   140,    -1,
     139,    -1,     1,     4,    -1,   141,     4,    -1,    46,   228,
      -1,   228,    96,    46,    -1,    26,   187,     4,    -1,   144,
       4,    -1,   228,    96,   224,    -1,   228,   145,    -1,   228,
      96,   231,   224,    -1,   228,    96,   146,    -1,   153,    96,
     224,    -1,   228,    96,   153,    -1,   228,    96,   148,    -1,
     234,    33,    -1,   234,    34,    -1,   234,   228,    -1,   233,
     224,    -1,   228,   232,   224,    -1,    33,   232,   228,    -1,
      34,   232,   228,    -1,    32,    62,   228,    -1,    32,    62,
      32,    -1,    33,   232,    33,    -1,    34,   232,    34,    -1,
      33,   232,    34,    -1,    34,   232,    33,    -1,   148,     4,
      -1,   149,   150,    -1,    39,    -1,    -1,   151,    -1,   152,
      -1,   151,   102,   152,    -1,   224,    -1,   154,    -1,   153,
      -1,   228,   154,    -1,    97,   155,    98,    -1,   224,    -1,
     155,    99,   224,    -1,   157,     4,    -1,   159,    46,   224,
      47,   230,    -1,   159,   228,   160,   230,    -1,   159,   158,
      47,   230,    -1,   228,   226,   224,    -1,    33,   226,   228,
      -1,    34,   226,   228,    -1,    33,   226,    33,    -1,    34,
     226,    34,    -1,    33,   226,    34,    -1,    34,   226,    33,
      -1,    32,   226,    32,    -1,    33,    -1,    34,    -1,    32,
      -1,    44,    -1,    45,    -1,    47,    -1,   102,    -1,    47,
     230,     4,    -1,    12,   227,   163,     4,    -1,   164,    -1,
     163,   102,   164,    -1,   230,   165,    -1,    -1,    89,    -1,
      11,    32,   102,   167,     4,    -1,   228,    -1,    39,    -1,
     169,    -1,   178,    -1,    24,     4,   170,   173,     4,   175,
      25,     4,    -1,    -1,   171,    -1,   172,    -1,   171,   172,
      -1,    28,   205,     4,    -1,    27,   185,   174,    -1,    30,
     185,    -1,    14,   185,     4,    15,   184,    -1,    -1,   102,
     185,    -1,    -1,   176,    -1,   177,    -1,   176,   177,    -1,
      29,   190,     4,    -1,   162,    -1,   179,     4,    -1,   187,
      96,   180,    -1,   228,    96,   180,    -1,   180,    -1,   182,
      -1,   181,    -1,   185,   103,   184,   200,    -1,   183,   200,
      -1,   185,    -1,    32,    -1,   185,    -1,   186,    -1,   230,
      -1,    35,    -1,    32,    -1,    37,    -1,   100,   188,   101,
      -1,    -1,   189,    -1,   190,    -1,   189,   102,   190,    -1,
     228,   191,    -1,    -1,   191,   192,    -1,    93,    -1,    94,
      -1,    91,    -1,    89,    -1,    90,   217,    -1,    -1,   193,
     194,    -1,   192,    -1,   195,    -1,    95,   100,   131,   101,
      -1,   198,    -1,   207,    -1,   199,    -1,   208,    -1,    18,
     200,     4,    -1,    18,   180,     4,    -1,    19,   200,     4,
      -1,   100,   201,   101,    -1,    -1,   202,    -1,   203,    -1,
     202,   102,   203,    -1,   205,    -1,   204,    -1,    32,    48,
     206,    -1,   206,   215,    -1,   224,    -1,    22,     4,   212,
      23,     4,    -1,    20,     4,   209,    21,     4,    -1,    -1,
     210,    -1,   211,    -1,   210,   211,    -1,    19,   205,     4,
      -1,    -1,   213,    -1,   214,    -1,   213,   214,    -1,    18,
     205,     4,    -1,    -1,   215,   216,    -1,    92,    -1,    90,
     217,    -1,    -1,   218,    -1,   100,    32,   101,    -1,   220,
       4,    -1,   221,    -1,   222,    -1,    17,   223,    -1,    16,
     223,    -1,    40,   230,    96,    33,    -1,    41,   230,    96,
      34,    -1,    42,   230,    96,    32,    -1,    43,   230,    96,
      32,    -1,   228,    -1,   225,    -1,    32,    -1,    33,    -1,
      34,    -1,    49,    -1,    50,    -1,    51,    -1,    52,    -1,
      54,    -1,    53,    -1,    40,    -1,    41,    -1,    42,    -1,
      43,    -1,   229,    -1,    31,    -1,    35,    -1,    36,    -1,
      38,    -1,    37,    -1,    31,    -1,    39,    -1,   104,    -1,
     105,    -1,   106,    -1,   107,    -1,   104,    -1,   108,    -1,
     109,    -1,   110,    -1,   111,    -1,   112,    -1,   106,    -1,
     113,    -1,    62,    -1,    55,    -1,    56,    -1,    57,    -1,
      59,    -1,    60,    -1,    58,    -1,    61,    -1,    50,    -1,
      52,    -1,    51,    -1,    54,    -1,    53,    -1,    49,    -1,
      68,    -1,    69,    -1,    70,    -1,    71,    -1,    74,    -1,
      72,    -1,    73,    -1,    75,    -1,    76,    -1,    64,    -1,
      65,    -1,    63,    -1,    66,    -1,    67,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   435,   435,   440,   441,   444,   445,   448,   449,   450,
     451,   452,   453,   456,   462,   466,   473,   478,   479,   483,
     485,   492,   498,   502,   503,   507,   508,   512,   514,   516,
     518,   520,   522,   524,   526,   528,   530,   533,   537,   541,
     547,   548,   549,   550,   553,   554,   557,   568,   569,   572,
     572,   576,   578,   580,   583,   584,   585,   586,   587,   588,
     589,   590,   591,   592,   593,   594,   595,   599,   608,   611,
     616,   623,   630,   633,   638,   640,   645,   647,   652,   657,
     661,   676,   682,   687,   705,   710,   716,   722,   728,   734,
     739,   744,   749,   757,   760,   763,   767,   768,   771,   773,
     777,   779,   781,   785,   792,   796,   798,   802,   805,   810,
     815,   843,   849,   857,   865,   867,   869,   871,   873,   875,
     877,   879,   885,   886,   889,   890,   893,   900,   904,   906,
     910,   914,   915,   918,   933,   935,   942,   943,   946,   958,
     959,   963,   965,   969,   973,   975,   977,   983,   984,   991,
     992,   996,   998,  1002,  1004,  1008,  1012,  1014,  1016,  1021,
    1022,  1025,  1032,  1038,  1040,  1044,  1045,  1048,  1062,  1066,
    1068,  1073,  1078,  1079,  1083,  1085,  1089,  1098,  1099,  1103,
    1105,  1107,  1109,  1111,  1118,  1119,  1123,  1124,  1127,  1134,
    1135,  1138,  1139,  1142,  1146,  1150,  1156,  1161,  1162,  1175,
    1177,  1181,  1182,  1185,  1191,  1198,  1202,  1210,  1219,  1220,
    1225,  1227,  1232,  1237,  1238,  1242,  1244,  1248,  1254,  1255,
    1259,  1261,  1268,  1269,  1273,  1277,  1280,  1281,  1284,  1288,
    1292,  1294,  1296,  1298,  1307,  1308,  1311,  1312,  1313,  1316,
    1317,  1318,  1319,  1320,  1321,  1324,  1325,  1326,  1327,  1330,
    1331,  1340,  1341,  1342,  1343,  1346,  1347,  1350,  1351,  1352,
    1355,  1356,  1357,  1358,  1359,  1360,  1361,  1362,  1363,  1364,
    1365,  1366,  1367,  1368,  1369,  1370,  1371,  1372,  1373,  1374,
    1375,  1376,  1377,  1383,  1384,  1385,  1386,  1387,  1388,  1389,
    1390,  1391,  1392,  1393,  1394,  1397,  1398
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
  "\".nci_call\"", "\"identifier\"", "\"string constant\"",
  "\"integer constant\"", "\"number constant\"", "\"PMC register\"",
  "\"number register\"", "\"string register\"", "\"integer register\"",
  "\"parrot instruction\"", "\"int\"", "\"num\"", "\"pmc\"", "\"string\"",
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
  "sub_flag_with_arg", "multi_type", "parameters", "parameter",
  "instructions", "instruction", "@1", "instr", "statement", "error_stat",
  "null_stat", "null_instr", "getresults_stat", "assignment_stat",
  "assignment", "augmentive_expr", "binary_expr", "parrot_stat",
  "parrot_instruction", "parrot_op", "opt_op_args", "op_args", "op_arg",
  "keyaccess", "keylist", "keys", "conditional_stat", "conditional_instr",
  "condition", "if_unless", "then", "goto_stat", "local_decl",
  "local_id_list", "local_id", "has_unique_reg", "lex_decl", "lex_target",
  "invocation_stat", "long_invocation_stat", "opt_long_arguments",
  "long_arguments", "long_argument", "long_invocation", "opt_ret_cont",
  "opt_long_results", "long_results", "long_result",
  "short_invocation_stat", "short_invocation", "simple_invocation",
  "methodcall", "subcall", "sub", "method", "invokable", "string_object",
  "opt_target_list", "opt_list", "target_list", "result_target",
  "target_flags", "target_flag", "param_flags", "param_flag",
  "invocant_param", "return_stat", "yield_stat", "short_return_stat",
  "short_yield_stat", "arguments", "opt_arguments_list", "arguments_list",
  "argument", "named_arg", "short_arg", "arg", "long_return_stat",
  "long_yield_stat", "opt_yield_expressions", "yield_expressions",
  "yield_expression", "opt_return_expressions", "return_expressions",
  "return_expression", "arg_flags", "arg_flag", "opt_paren_string",
  "paren_string", "const_decl_stat", "const_stat", "const_decl",
  "globalconst_decl", "const_tail", "expression", "constant", "rel_op",
  "type", "target", "reg", "identifier", "unop", "binop", "augmented_op",
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
     345,   346,   347,   348,   349,   350,    61,    91,    93,    59,
      40,    41,    44,    46,    45,    33,   126,    43,    47,    42,
      37,   124,    38,   351
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   114,   115,   116,   116,   117,   117,   118,   118,   118,
     118,   118,   118,   119,   120,   121,   122,   123,   123,   124,
     124,   125,   126,   127,   127,   128,   128,   129,   129,   129,
     129,   129,   129,   129,   129,   129,   129,   130,   130,   130,
     131,   131,   131,   131,   132,   132,   133,   134,   134,   136,
     135,   137,   137,   137,   138,   138,   138,   138,   138,   138,
     138,   138,   138,   138,   138,   138,   138,   139,   140,   141,
     141,   142,   143,   144,   144,   144,   144,   144,   144,   144,
     145,   145,   145,   145,   146,   146,   146,   146,   146,   146,
     146,   146,   146,   147,   148,   149,   150,   150,   151,   151,
     152,   152,   152,   153,   154,   155,   155,   156,   157,   157,
     157,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   158,   159,   159,   160,   160,   161,   162,   163,   163,
     164,   165,   165,   166,   167,   167,   168,   168,   169,   170,
     170,   171,   171,   172,   173,   173,   173,   174,   174,   175,
     175,   176,   176,   177,   177,   178,   179,   179,   179,   180,
     180,   181,   182,   183,   183,   184,   184,   185,   185,   186,
     186,   187,   188,   188,   189,   189,   190,   191,   191,   192,
     192,   192,   192,   192,   193,   193,   194,   194,   195,   196,
     196,   197,   197,   198,   198,   199,   200,   201,   201,   202,
     202,   203,   203,   204,   205,   206,   207,   208,   209,   209,
     210,   210,   211,   212,   212,   213,   213,   214,   215,   215,
     216,   216,   217,   217,   218,   219,   220,   220,   221,   222,
     223,   223,   223,   223,   224,   224,   225,   225,   225,   226,
     226,   226,   226,   226,   226,   227,   227,   227,   227,   228,
     228,   229,   229,   229,   229,   230,   230,   231,   231,   231,
     232,   232,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,   232,   232,   232,   232,   232,
     232,   232,   232,   233,   233,   233,   233,   233,   233,   233,
     233,   233,   233,   233,   233,   234,   234
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     2,     2,     4,     4,     0,     1,     1,
       3,     6,     2,     1,     1,     0,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     4,     2,     2,
       1,     1,     1,     1,     0,     2,     5,     0,     2,     0,
       2,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     2,     2,     2,
       3,     3,     2,     3,     2,     4,     3,     3,     3,     3,
       2,     2,     2,     2,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     2,     2,     1,     0,     1,     1,     3,
       1,     1,     1,     2,     3,     1,     3,     2,     5,     4,
       4,     3,     3,     3,     3,     3,     3,     3,     3,     1,
       1,     1,     1,     1,     1,     1,     3,     4,     1,     3,
       2,     0,     1,     5,     1,     1,     1,     1,     8,     0,
       1,     1,     2,     3,     3,     2,     5,     0,     2,     0,
       1,     1,     2,     3,     1,     2,     3,     3,     1,     1,
       1,     4,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     0,     1,     1,     3,     2,     0,     2,     1,
       1,     1,     1,     2,     0,     2,     1,     1,     4,     1,
       1,     1,     1,     3,     3,     3,     3,     0,     1,     1,
       3,     1,     1,     3,     2,     1,     5,     5,     0,     1,
       1,     2,     3,     0,     1,     1,     2,     3,     0,     2,
       1,     2,     0,     1,     3,     2,     1,     1,     2,     2,
       4,     4,     4,     4,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       3,     4,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     3,     5,    12,    10,    11,     9,     7,    25,     8,
      14,     0,    13,   255,    24,   256,    22,    23,    17,     0,
       0,     0,     0,   228,     4,     2,     0,     0,    19,     0,
      18,     0,     0,     0,     0,     6,    44,    28,    29,    30,
      27,    31,     0,   222,    32,    35,    33,    34,     0,    26,
      36,    15,    16,     0,     0,     0,     0,     0,    47,     0,
       0,    38,   223,    39,    20,   230,   231,   232,   233,     0,
      45,    49,     0,     0,   245,   246,   247,   248,     0,    21,
      48,     0,    37,   224,   184,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   250,   164,   251,   252,
     254,   253,    95,   122,   123,     0,     0,   172,    50,    53,
      66,    65,     0,    64,    62,     0,    63,     0,    96,     0,
      54,     0,     0,    55,    56,    57,    61,   136,   137,     0,
     158,   160,   159,     0,   163,     0,    59,    60,   189,   191,
     190,   192,    58,     0,   226,   227,     0,   249,   167,     0,
      67,    51,    52,     0,     0,   229,   168,   197,     0,     0,
       0,   208,   213,   139,     0,   250,   251,    69,     0,     0,
     173,   174,   177,    68,    72,    93,   236,   237,   238,     0,
      94,    97,    98,   102,   101,   100,   235,   234,     0,   107,
     121,   119,   120,     0,     0,     0,   155,   162,     0,     0,
     225,   294,   292,   293,   295,   296,   283,   284,   285,   286,
     288,   289,   287,   290,   291,     0,    74,   103,     0,     0,
      46,   182,   222,   181,   179,   180,     0,   186,   185,   187,
       0,     0,   128,   131,   236,     0,   198,   199,   202,   201,
     218,   205,   234,   194,   193,   195,     0,     0,   209,   210,
       0,     0,   214,   215,     0,     0,   140,   141,    71,   126,
     171,     0,   176,     0,   105,     0,    77,   239,   240,   241,
     242,   244,   243,     0,     0,     0,     0,     0,   124,   125,
       0,     0,   169,   170,     0,   165,   166,   156,   164,   237,
     238,    70,   257,   258,   259,    76,    79,    78,   157,    73,
     234,     0,    83,    80,    81,    82,   183,     0,   135,     0,
     134,   127,     0,   132,   130,     0,   196,     0,   204,     0,
       0,   211,     0,     0,   216,     0,     0,     0,     0,     0,
     142,   175,   178,   104,     0,    99,   118,   114,   116,   112,
     117,   115,   113,     0,   110,   109,   111,   161,     0,   282,
     277,   279,   278,   281,   280,   270,   271,   272,   275,   273,
     274,   276,   269,   261,   267,   260,   262,   263,   264,   265,
     266,   268,     0,     0,     0,    75,    41,     0,    42,    43,
      40,   133,   129,   203,   200,   222,   220,   219,   212,   207,
     217,   206,   143,     0,   147,   145,   149,   106,   108,    88,
      87,    89,    91,    85,    92,    90,    86,    84,   188,   221,
       0,     0,   144,     0,   154,     0,   150,   151,     0,   148,
       0,     0,   152,   146,   153,   138
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    11,    12,    13,    14,    15,    16,    39,
      40,    17,    18,    26,    36,    59,    60,   387,    68,    80,
      81,    90,    91,   118,   119,   120,   121,   122,   123,   124,
     125,   226,   305,   126,   127,   128,   190,   191,   192,   129,
     227,   273,   130,   131,   204,   132,   290,   133,   134,   241,
     242,   324,   135,   319,   136,   137,   265,   266,   267,   339,
     422,   425,   426,   427,   138,   139,   140,   141,   142,   143,
     294,   144,   296,   145,   179,   180,   181,   272,   237,   159,
     238,   239,   146,   147,   148,   149,   169,   245,   246,   247,
     248,   249,   250,   150,   151,   257,   258,   259,   261,   262,
     263,   328,   397,    71,    72,   152,   153,    19,   155,    33,
     251,   196,   283,    88,   252,   157,   158,   311,   382,   228,
     229
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -392
static const yytype_int16 yypact[] =
{
      43,  -392,    60,   120,  -392,    32,    39,    70,     0,   -22,
     371,    74,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,    13,  -392,  -392,  -392,  -392,  -392,  -392,    73,    75,
      75,    75,    75,  -392,   120,  -392,     9,    97,  -392,    36,
      49,    42,    53,    56,    57,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,    54,    63,  -392,  -392,  -392,  -392,    63,  -392,
    -392,  -392,  -392,   128,   132,   134,   137,   140,   169,     0,
     157,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,   440,
    -392,   182,    91,    92,  -392,  -392,  -392,  -392,    75,  -392,
    -392,   218,  -392,  -392,  -392,   203,   284,   177,   440,   371,
      -2,   110,   207,   213,   214,   114,   -84,  -392,   -60,  -392,
    -392,  -392,   -27,  -392,  -392,   210,    75,   210,  -392,  -392,
    -392,  -392,   219,  -392,  -392,   221,  -392,   223,   109,   135,
    -392,   224,   167,  -392,  -392,  -392,  -392,  -392,  -392,   228,
    -392,  -392,  -392,   110,   130,   143,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,   239,  -392,  -392,   362,  -392,  -392,    22,
    -392,  -392,  -392,   150,    75,  -392,  -392,   238,   247,   254,
     255,   242,   248,   249,   263,  -392,  -392,  -392,   274,   179,
     181,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,   303,
    -392,   184,  -392,  -392,  -392,  -392,  -392,   187,   303,  -392,
     419,   419,   419,   303,   234,   124,  -392,  -392,   127,   151,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,    17,  -392,  -392,   303,   343,
    -392,  -392,    63,  -392,  -392,  -392,   189,  -392,  -392,  -392,
      46,     8,  -392,   198,   243,   193,   188,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,   303,   276,   242,  -392,
     303,   275,   248,  -392,   303,    14,   249,  -392,  -392,  -392,
    -392,   210,   385,    20,  -392,   109,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,   267,   352,   408,   258,    75,  -392,  -392,
      75,   303,  -392,  -392,   110,  -392,  -392,  -392,    10,   311,
     311,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
     297,   303,  -392,  -392,  -392,  -392,  -392,    27,  -392,   307,
    -392,  -392,    75,  -392,  -392,   303,  -392,   238,   -72,   308,
     309,  -392,   313,   320,  -392,   321,   149,   149,   149,   322,
    -392,  -392,  -392,  -392,   303,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,    75,  -392,  -392,  -392,  -392,   360,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,   416,   429,   303,  -392,  -392,   206,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,    63,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,   323,   230,  -392,     5,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -392,
     327,   149,  -392,   210,  -392,   318,     5,  -392,   127,  -392,
     340,   378,  -392,  -392,  -392,  -392
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -392,  -392,   364,  -392,   359,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,   330,  -392,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,   304,  -392,  -392,  -392,  -392,  -392,
    -392,  -392,  -392,  -392,   191,  -392,  -392,  -392,   165,  -118,
    -120,  -392,  -392,  -392,  -392,  -392,  -392,  -392,  -391,  -392,
      80,  -392,  -392,  -392,  -392,  -392,  -392,  -392,   190,  -392,
    -392,  -392,  -392,    29,  -392,  -392,   -89,  -392,  -392,  -392,
      33,  -206,  -392,   372,  -392,  -392,  -262,  -392,   176,  -392,
    -392,  -392,  -392,  -392,  -392,  -392,   -98,  -392,  -392,   158,
    -392,   -48,   159,  -392,  -392,  -392,  -392,   199,  -392,  -392,
     225,  -392,  -392,  -225,   428,  -392,  -392,   -34,  -392,   389,
    -124,  -392,  -102,   -93,   -90,  -392,    -8,  -392,  -264,  -392,
    -392
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -257
static const yytype_int16 yytable[] =
{
      27,   156,   295,   170,   195,   164,   156,   316,   194,   341,
     193,   168,   321,    46,  -236,   424,  -255,    98,   395,  -255,
     396,    41,    42,    43,    44,   177,   230,   182,   336,    23,
     107,    23,    24,   166,   423,   424,   383,    25,   197,    25,
    -168,   337,   205,  -168,   338,   207,   384,     1,   106,   298,
     299,   300,   108,   109,   110,   111,   112,   154,    23,   386,
       4,    27,   154,   301,    20,   274,    25,    84,    85,    86,
      87,    21,   358,  -256,   276,    28,  -256,   175,    34,   286,
      94,   176,   109,   110,   111,   318,    47,    48,    49,    50,
      51,    52,    53,    54,    55,    56,    57,    58,   167,   284,
     285,   309,    22,   291,   312,    38,    23,   307,   178,    37,
     322,   231,   232,   233,    25,   234,   235,   236,   343,   344,
     297,   302,   303,   304,   189,     5,     6,     7,     8,    61,
     403,   404,   405,     9,    62,   310,   308,    10,    64,   315,
     175,   186,   187,   188,   176,   109,   110,   111,    63,    65,
     320,   195,    66,    67,    69,   194,   243,   193,    23,   292,
      74,   430,   166,    70,   293,    75,    25,   356,    76,    77,
     419,   288,    78,   277,   278,   279,   280,   281,   282,    79,
      23,   182,    23,   107,   166,   197,   166,   385,    25,    83,
      25,    89,    92,    93,   349,   352,   357,   388,   175,   200,
     201,   202,   176,   109,   110,   111,   189,   160,   329,   163,
     167,   171,   332,   203,   117,   429,   335,   172,   173,    95,
     407,    96,   295,   183,   389,   184,   289,   185,   199,    97,
      98,   198,   206,   208,    99,    10,   100,   101,   102,   209,
     103,   175,   104,   210,   105,   176,   109,   110,   111,   106,
     107,   253,   240,   108,   109,   110,   111,   112,   254,   255,
     417,   256,   113,   114,   115,   116,   260,   268,   410,   175,
     244,   187,   188,   176,   109,   110,   111,   264,   269,   354,
     270,   287,   355,   271,   189,    95,   275,   323,   161,   317,
     327,   325,   413,   416,   326,    97,    98,   330,   333,   346,
      99,    10,   100,   101,   102,   353,   103,   418,   104,   390,
     105,   391,   398,   399,   243,   106,   107,   400,   117,   108,
     109,   110,   111,   112,   401,   402,   406,   420,   113,   114,
     115,   116,   421,   182,   175,   186,   187,   188,   176,   109,
     110,   111,   428,   431,   434,   408,   359,   360,   361,   362,
     363,   364,   365,   366,   367,   368,   369,   370,   371,   372,
     359,   360,   361,   362,   363,   364,   365,   366,   367,   368,
     369,   370,   371,   372,   175,    35,   313,   314,   176,   109,
     110,   111,   435,   175,   117,   347,   348,   176,   109,   110,
     111,   175,   409,    45,   189,   176,   109,   110,   111,    82,
     162,   373,   392,   374,   375,   376,   377,   378,   379,   380,
     381,    29,    30,    31,    32,   373,   306,   374,   375,   376,
     377,   378,   379,   380,   381,   211,   212,   213,   214,   215,
     216,   217,   218,   219,   220,   221,   222,   223,   224,   175,
     345,   350,   351,   176,   109,   110,   111,   175,   342,   411,
     412,   176,   109,   110,   111,   432,   340,   331,   225,   189,
     175,   433,   414,   415,   176,   109,   110,   111,   277,   278,
     279,   280,   281,   282,   231,   232,   233,   174,   234,   235,
      84,    85,    86,    87,   393,   394,    73,   334,   165
};

static const yytype_uint16 yycheck[] =
{
       8,    91,   208,   101,   128,    98,    96,   232,   128,   271,
     128,   100,     4,     4,     4,   406,   100,    12,    90,   103,
      92,    29,    30,    31,    32,   115,     4,   117,    14,    31,
      32,    31,    32,    35,    29,   426,   300,    39,   128,    39,
     100,    27,   132,   103,    30,   143,   310,     4,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    91,    31,    32,
       0,    69,    96,    46,    32,   189,    39,    40,    41,    42,
      43,    32,    62,   100,   198,    97,   103,    31,     4,   203,
      88,    35,    36,    37,    38,    39,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,   100,   201,
     202,   225,    32,   205,   228,    32,    31,   225,   116,    96,
     102,    89,    90,    91,    39,    93,    94,    95,    98,    99,
     209,   104,   105,   106,    97,     5,     6,     7,     8,    32,
     336,   337,   338,    13,    98,   225,   225,    17,    96,   229,
      31,    32,    33,    34,    35,    36,    37,    38,    99,    96,
     240,   275,    96,    96,   100,   275,   164,   275,    31,    32,
      32,   423,    35,   100,    37,    33,    39,   291,    34,    32,
     395,    47,    32,    49,    50,    51,    52,    53,    54,    10,
      31,   271,    31,    32,    35,   275,    35,   311,    39,    32,
      39,     9,   101,   101,   284,   285,   294,   317,    31,    32,
      33,    34,    35,    36,    37,    38,    97,     4,   256,    32,
     100,     4,   260,    46,   100,   421,   264,     4,     4,     1,
     344,     3,   428,     4,   317,     4,   102,     4,     4,    11,
      12,    96,     4,   103,    16,    17,    18,    19,    20,    96,
      22,    31,    24,     4,    26,    35,    36,    37,    38,    31,
      32,     4,   102,    35,    36,    37,    38,    39,     4,     4,
     384,    19,    44,    45,    46,    47,    18,     4,   358,    31,
      32,    33,    34,    35,    36,    37,    38,    28,     4,   287,
     101,    47,   290,   102,    97,     1,   102,    89,     4,   100,
     102,    48,   382,   383,   101,    11,    12,    21,    23,    32,
      16,    17,    18,    19,    20,    47,    22,   101,    24,   317,
      26,     4,     4,     4,   322,    31,    32,     4,   100,    35,
      36,    37,    38,    39,     4,     4,     4,     4,    44,    45,
      46,    47,   102,   423,    31,    32,    33,    34,    35,    36,
      37,    38,    15,    25,     4,   353,    49,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    31,    11,    33,    34,    35,    36,
      37,    38,     4,    31,   100,    33,    34,    35,    36,    37,
      38,    31,    32,    34,    97,    35,    36,    37,    38,    69,
      96,   104,   322,   106,   107,   108,   109,   110,   111,   112,
     113,    40,    41,    42,    43,   104,   225,   106,   107,   108,
     109,   110,   111,   112,   113,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    31,
     275,    33,    34,    35,    36,    37,    38,    31,   272,    33,
      34,    35,    36,    37,    38,   426,   266,   258,    96,    97,
      31,   428,    33,    34,    35,    36,    37,    38,    49,    50,
      51,    52,    53,    54,    89,    90,    91,   105,    93,    94,
      40,    41,    42,    43,   325,   327,    58,   262,    99
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,   115,   116,     0,     5,     6,     7,     8,    13,
      17,   117,   118,   119,   120,   121,   122,   125,   126,   221,
      32,    32,    32,    31,    32,    39,   127,   230,    97,    40,
      41,    42,    43,   223,     4,   116,   128,    96,    32,   123,
     124,   230,   230,   230,   230,   118,     4,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,   129,
     130,    32,    98,    99,    96,    96,    96,    96,   132,   100,
     100,   217,   218,   218,    32,    33,    34,    32,    32,    10,
     133,   134,   127,    32,    40,    41,    42,    43,   227,     9,
     135,   136,   101,   101,   230,     1,     3,    11,    12,    16,
      18,    19,    20,    22,    24,    26,    31,    32,    35,    36,
      37,    38,    39,    44,    45,    46,    47,   100,   137,   138,
     139,   140,   141,   142,   143,   144,   147,   148,   149,   153,
     156,   157,   159,   161,   162,   166,   168,   169,   178,   179,
     180,   181,   182,   183,   185,   187,   196,   197,   198,   199,
     207,   208,   219,   220,   221,   222,   228,   229,   230,   193,
       4,     4,   138,    32,   227,   223,    35,   100,   180,   200,
     200,     4,     4,     4,   187,    31,    35,   228,   230,   188,
     189,   190,   228,     4,     4,     4,    32,    33,    34,    97,
     150,   151,   152,   153,   154,   224,   225,   228,    96,     4,
      32,    33,    34,    46,   158,   228,     4,   200,   103,    96,
       4,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    96,   145,   154,   233,   234,
       4,    89,    90,    91,    93,    94,    95,   192,   194,   195,
     102,   163,   164,   230,    32,   201,   202,   203,   204,   205,
     206,   224,   228,     4,     4,     4,    19,   209,   210,   211,
      18,   212,   213,   214,    28,   170,   171,   172,     4,     4,
     101,   102,   191,   155,   224,   102,   224,    49,    50,    51,
      52,    53,    54,   226,   226,   226,   224,    47,    47,   102,
     160,   226,    32,    37,   184,   185,   186,   180,    32,    33,
      34,    46,   104,   105,   106,   146,   148,   153,   180,   224,
     228,   231,   224,    33,    34,   228,   217,   100,    39,   167,
     228,     4,   102,    89,   165,    48,   101,   102,   215,   205,
      21,   211,   205,    23,   214,   205,    14,    27,    30,   173,
     172,   190,   192,    98,    99,   152,    32,    33,    34,   228,
      33,    34,   228,    47,   230,   230,   224,   200,    62,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,   104,   106,   107,   108,   109,   110,   111,
     112,   113,   232,   232,   232,   224,    32,   131,   154,   227,
     230,     4,   164,   206,   203,    90,    92,   216,     4,     4,
       4,     4,     4,   185,   185,   185,     4,   224,   230,    32,
     228,    33,    34,   228,    33,    34,   228,   224,   101,   217,
       4,   102,   174,    29,   162,   175,   176,   177,    15,   185,
     190,    25,   177,   184,     4,     4
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
#line 457 "pir.y"
    { load_library(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 14:
#line 463 "pir.y"
    { set_hll((yyvsp[(2) - (2)].sval)); ;}
    break;

  case 15:
#line 467 "pir.y"
    { set_hll_map((yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 16:
#line 474 "pir.y"
    { set_namespace(lexer, (yyvsp[(3) - (4)].fixme)); ;}
    break;

  case 17:
#line 478 "pir.y"
    { (yyval.fixme) = NULL; ;}
    break;

  case 18:
#line 480 "pir.y"
    { (yyval.fixme) = (yyvsp[(1) - (1)].fixme); ;}
    break;

  case 19:
#line 484 "pir.y"
    { (yyval.fixme) = new_key(expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)))); ;}
    break;

  case 20:
#line 486 "pir.y"
    { (yyval.fixme) = add_key((yyvsp[(1) - (3)].fixme), expr_from_const(new_const(STRING_TYPE, (yyvsp[(3) - (3)].sval)))); ;}
    break;

  case 22:
#line 499 "pir.y"
    { new_subr(lexer, (yyvsp[(2) - (2)].sval)); ;}
    break;

  case 25:
#line 507 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 26:
#line 509 "pir.y"
    { set_sub_flag(lexer, (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 27:
#line 513 "pir.y"
    { (yyval.ival) = SUB_FLAG_ANON;;}
    break;

  case 28:
#line 515 "pir.y"
    { (yyval.ival) = SUB_FLAG_INIT; ;}
    break;

  case 29:
#line 517 "pir.y"
    { (yyval.ival) = SUB_FLAG_LOAD; ;}
    break;

  case 30:
#line 519 "pir.y"
    { (yyval.ival) = SUB_FLAG_MAIN; ;}
    break;

  case 31:
#line 521 "pir.y"
    { (yyval.ival) = SUB_FLAG_METHOD; ;}
    break;

  case 32:
#line 523 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEX; ;}
    break;

  case 33:
#line 525 "pir.y"
    { (yyval.ival) = SUB_FLAG_POSTCOMP; ;}
    break;

  case 34:
#line 527 "pir.y"
    { (yyval.ival) = SUB_FLAG_IMMEDIATE; ;}
    break;

  case 35:
#line 529 "pir.y"
    { (yyval.ival) = SUB_FLAG_MULTI; ;}
    break;

  case 37:
#line 534 "pir.y"
    { (yyval.ival) = SUB_FLAG_OUTER;
                           set_sub_outer(lexer, (yyvsp[(3) - (4)].sval));
                         ;}
    break;

  case 38:
#line 538 "pir.y"
    { (yyval.ival) = SUB_FLAG_VTABLE;
                           set_sub_vtable(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 39:
#line 542 "pir.y"
    { (yyval.ival) = SUB_FLAG_LEXID;
                           set_sub_lexid(lexer, (yyvsp[(2) - (2)].sval));
                         ;}
    break;

  case 46:
#line 558 "pir.y"
    {
                           declare_local(lexer, (yyvsp[(2) - (5)].ival), new_local((yyvsp[(3) - (5)].sval), 0));
                         ;}
    break;

  case 49:
#line 572 "pir.y"
    { new_instr(lexer); ;}
    break;

  case 51:
#line 577 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 52:
#line 579 "pir.y"
    { set_label(lexer, (yyvsp[(1) - (2)].sval)); ;}
    break;

  case 67:
#line 600 "pir.y"
    { if (lexer->parse_errors > MAX_NUM_ERRORS) {
                               fprintf(stderr, "Too many errors. Compilation aborted.\n");
                               exit(EXIT_FAILURE); /* fix: bail out and free() all memory */
                           }
                           yyerrok;
                         ;}
    break;

  case 69:
#line 612 "pir.y"
    {
                           set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (2)].targ)));
                         ;}
    break;

  case 70:
#line 617 "pir.y"
    {
                           set_instr(lexer, "null");
                           push_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ)));
                         ;}
    break;

  case 71:
#line 624 "pir.y"
    {
                           set_instr(lexer, "get_results");
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (3)].targ)));
                         ;}
    break;

  case 73:
#line 634 "pir.y"
    {
                           set_instr(lexer, "set");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 74:
#line 639 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (2)].targ))); ;}
    break;

  case 75:
#line 641 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(3) - (4)].sval));
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (4)].targ)), (yyvsp[(4) - (4)].expr));
                         ;}
    break;

  case 76:
#line 646 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 77:
#line 648 "pir.y"
    {
                           set_instr(lexer, "set");
                           add_operands(lexer, 2, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 78:
#line 653 "pir.y"
    {
                           set_instr(lexer, "set");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 79:
#line 658 "pir.y"
    { unshift_operand(lexer, expr_from_target((yyvsp[(1) - (3)].targ))); ;}
    break;

  case 80:
#line 662 "pir.y"
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
                              push_operand(lexer, expr_from_const(
                                           new_const(INT_TYPE, (yyvsp[(2) - (2)].ival))));
                           }
                         ;}
    break;

  case 81:
#line 677 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, expr_from_const(
                                        new_const(NUM_TYPE, (yyvsp[(2) - (2)].dval))));
                         ;}
    break;

  case 82:
#line 683 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, expr_from_target((yyvsp[(2) - (2)].targ)));
                         ;}
    break;

  case 83:
#line 688 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(1) - (2)].ival)]);
                           push_operand(lexer, (yyvsp[(2) - (2)].expr));
                         ;}
    break;

  case 84:
#line 706 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                         ;}
    break;

  case 85:
#line 711 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(INT_TYPE, (yyvsp[(1) - (3)].ival))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 86:
#line 717 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_const(new_const(NUM_TYPE, (yyvsp[(1) - (3)].dval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 87:
#line 723 "pir.y"
    {
                           set_instr(lexer, "concat");
                           add_operands(lexer, 2, expr_from_const(new_const(STRING_TYPE, (yyvsp[(1) - (3)].sval))),
                                                                  expr_from_target((yyvsp[(3) - (3)].targ)));
                         ;}
    break;

  case 88:
#line 729 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(new_const(STRING_TYPE,
                                                                         concat_strings((yyvsp[(1) - (3)].sval), (yyvsp[(3) - (3)].sval)))));
                         ;}
    break;

  case 89:
#line 735 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 90:
#line 740 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))));
                         ;}
    break;

  case 91:
#line 745 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval))));
                         ;}
    break;

  case 92:
#line 750 "pir.y"
    {
                           set_instr(lexer, "set");
                           push_operand(lexer, expr_from_const(fold_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival))));
                         ;}
    break;

  case 95:
#line 764 "pir.y"
    { set_instr(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 98:
#line 772 "pir.y"
    { push_operand(lexer, (yyvsp[(1) - (1)].expr)); ;}
    break;

  case 99:
#line 774 "pir.y"
    { push_operand(lexer, (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 100:
#line 778 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 101:
#line 780 "pir.y"
    { (yyval.expr) = expr_from_key((yyvsp[(1) - (1)].key)); ;}
    break;

  case 102:
#line 782 "pir.y"
    { (yyval.expr) = (yyvsp[(1) - (1)].expr); ;}
    break;

  case 103:
#line 786 "pir.y"
    {
                            (yyvsp[(1) - (2)].targ)->key = (yyvsp[(2) - (2)].key);
                            (yyval.expr) = expr_from_target((yyvsp[(1) - (2)].targ));
                         ;}
    break;

  case 104:
#line 793 "pir.y"
    { (yyval.key) = (yyvsp[(2) - (3)].key); ;}
    break;

  case 105:
#line 797 "pir.y"
    { (yyval.key) = new_key((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 106:
#line 799 "pir.y"
    { (yyval.key) = add_key((yyvsp[(1) - (3)].key), (yyvsp[(3) - (3)].expr)); ;}
    break;

  case 108:
#line 806 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(1) - (5)].ival) ? "unless_null" : "if_null");
                           add_operands(lexer, 2, (yyvsp[(3) - (5)].expr), expr_from_ident((yyvsp[(5) - (5)].sval)));
                         ;}
    break;

  case 109:
#line 811 "pir.y"
    {
                           set_instr(lexer, (yyvsp[(1) - (4)].ival) ? "unless" : "if");
                           add_operands(lexer, 2, expr_from_target((yyvsp[(2) - (4)].targ)), expr_from_ident((yyvsp[(4) - (4)].sval)));
                         ;}
    break;

  case 110:
#line 816 "pir.y"
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

  case 111:
#line 844 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2, expr_from_target((yyvsp[(1) - (3)].targ)), (yyvsp[(3) - (3)].expr));
                           (yyval.ival) = -1;  /* -1 indicates this is evaluated at runtime */
                         ;}
    break;

  case 112:
#line 850 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(INT_TYPE, (yyvsp[(1) - (3)].ival))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 113:
#line 858 "pir.y"
    {
                           set_instr(lexer, opnames[(yyvsp[(2) - (3)].ival)]);
                           add_operands(lexer, 2,
                                        expr_from_const(new_const(NUM_TYPE, (yyvsp[(1) - (3)].dval))),
                                        expr_from_target((yyvsp[(3) - (3)].targ)));
                           (yyval.ival) = -1;
                         ;}
    break;

  case 114:
#line 866 "pir.y"
    { (yyval.ival) = evaluate_i_i((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 115:
#line 868 "pir.y"
    { (yyval.ival) = evaluate_n_n((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 116:
#line 870 "pir.y"
    { (yyval.ival) = evaluate_i_n((yyvsp[(1) - (3)].ival), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].dval)); ;}
    break;

  case 117:
#line 872 "pir.y"
    { (yyval.ival) = evaluate_n_i((yyvsp[(1) - (3)].dval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].ival)); ;}
    break;

  case 118:
#line 874 "pir.y"
    { (yyval.ival) = evaluate_s_s((yyvsp[(1) - (3)].sval), (yyvsp[(2) - (3)].ival), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 119:
#line 876 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].ival) ? 1 : 0; ;}
    break;

  case 120:
#line 878 "pir.y"
    { (yyval.ival) = (yyvsp[(1) - (1)].dval) ? 1 : 0; ;}
    break;

  case 121:
#line 880 "pir.y"
    { /* if string length > 0 return true, unless the string equals "0". */
                           (yyval.ival) = strlen((yyvsp[(1) - (1)].sval)) ? ((strcmp((yyvsp[(1) - (1)].sval), "0") == 0) ? 0 : 1) : 0;
                         ;}
    break;

  case 122:
#line 885 "pir.y"
    { (yyval.ival) = 0; /* no need to invert */ ;}
    break;

  case 123:
#line 886 "pir.y"
    { (yyval.ival) = 1; /* yes, invert opname */ ;}
    break;

  case 126:
#line 894 "pir.y"
    {
                           set_instr(lexer, "branch");
                           push_operand(lexer, expr_from_ident((yyvsp[(2) - (3)].sval)));
                         ;}
    break;

  case 127:
#line 901 "pir.y"
    { declare_local(lexer, (yyvsp[(2) - (4)].ival), (yyvsp[(3) - (4)].targ)); ;}
    break;

  case 128:
#line 905 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 129:
#line 907 "pir.y"
    { (yyval.targ) = add_local((yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 130:
#line 911 "pir.y"
    { (yyval.targ) = new_local((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 131:
#line 914 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 132:
#line 915 "pir.y"
    { (yyval.ival) = 1; ;}
    break;

  case 133:
#line 919 "pir.y"
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

  case 134:
#line 934 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 135:
#line 936 "pir.y"
    { (yyval.targ) = find_target(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 138:
#line 951 "pir.y"
    { /* $4 contains an invocation object */
                             set_invocation_args((yyvsp[(4) - (8)].invo), (yyvsp[(3) - (8)].argm));
                             set_invocation_results((yyvsp[(4) - (8)].invo), (yyvsp[(6) - (8)].targ));
                           ;}
    break;

  case 139:
#line 958 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 140:
#line 960 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 141:
#line 964 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 142:
#line 966 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 143:
#line 970 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 144:
#line 974 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(2) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 145:
#line 976 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_NCI, (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 146:
#line 979 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(2) - (5)].targ), (yyvsp[(5) - (5)].targ)); ;}
    break;

  case 147:
#line 983 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 148:
#line 985 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (2)].targ); ;}
    break;

  case 149:
#line 991 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 150:
#line 993 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 151:
#line 997 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 152:
#line 999 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].targ)); ;}
    break;

  case 153:
#line 1003 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 154:
#line 1005 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 156:
#line 1013 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 157:
#line 1015 "pir.y"
    { set_invocation_results((yyvsp[(3) - (3)].invo), (yyvsp[(1) - (3)].targ)); ;}
    break;

  case 158:
#line 1017 "pir.y"
    { set_invocation_results((yyvsp[(1) - (1)].invo), NULL); ;}
    break;

  case 161:
#line 1026 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_METH, (yyvsp[(1) - (4)].targ), (yyvsp[(3) - (4)].targ));
                              set_invocation_args((yyval.invo), (yyvsp[(4) - (4)].argm));
                            ;}
    break;

  case 162:
#line 1033 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_PCC, (yyvsp[(1) - (2)].targ), NULL);
                              set_invocation_args((yyval.invo), (yyvsp[(2) - (2)].argm));
                            ;}
    break;

  case 163:
#line 1039 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 164:
#line 1041 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 167:
#line 1049 "pir.y"
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

  case 168:
#line 1063 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 169:
#line 1067 "pir.y"
    { (yyval.targ) = target_from_string((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 170:
#line 1069 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 171:
#line 1074 "pir.y"
    { (yyval.targ) = (yyvsp[(2) - (3)].targ); ;}
    break;

  case 172:
#line 1078 "pir.y"
    { (yyval.targ) = NULL; ;}
    break;

  case 173:
#line 1080 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 174:
#line 1084 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 175:
#line 1086 "pir.y"
    { (yyval.targ) = add_target(lexer, (yyvsp[(1) - (3)].targ), (yyvsp[(3) - (3)].targ)); ;}
    break;

  case 176:
#line 1090 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (2)].targ);
                              set_param_flag((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                              /* get the :named argument if necessary */
                              IF_NAMED_PARAM_SET_ALIAS((yyvsp[(1) - (2)].targ), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 177:
#line 1098 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 178:
#line 1100 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 179:
#line 1104 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPTIONAL; ;}
    break;

  case 180:
#line 1106 "pir.y"
    { (yyval.ival) = TARGET_FLAG_OPT_FLAG; ;}
    break;

  case 181:
#line 1108 "pir.y"
    { (yyval.ival) = TARGET_FLAG_SLURPY; ;}
    break;

  case 182:
#line 1110 "pir.y"
    { (yyval.ival) = TARGET_FLAG_UNIQUE_REG; ;}
    break;

  case 183:
#line 1112 "pir.y"
    { (yyval.ival) = TARGET_FLAG_NAMED;
                                   STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                            ;}
    break;

  case 184:
#line 1118 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 185:
#line 1120 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 188:
#line 1128 "pir.y"
    { (yyval.ival) = TARGET_FLAG_INVOCANT; ;}
    break;

  case 193:
#line 1143 "pir.y"
    { (yyval.fixme) = invoke(lexer, CALL_RET);
                               set_invocation_args((yyval.fixme), (yyvsp[(2) - (3)].argm));
                             ;}
    break;

  case 194:
#line 1147 "pir.y"
    { set_invocation_type((yyvsp[(2) - (3)].invo), CALL_TAIL); ;}
    break;

  case 195:
#line 1151 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                                set_invocation_args((yyval.invo), (yyvsp[(2) - (3)].argm));
                              ;}
    break;

  case 196:
#line 1157 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 197:
#line 1161 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 198:
#line 1163 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 199:
#line 1176 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 200:
#line 1178 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (3)].argm), (yyvsp[(3) - (3)].argm)); ;}
    break;

  case 203:
#line 1186 "pir.y"
    { (yyval.argm) = (yyvsp[(3) - (3)].argm);
                                 set_arg_named((yyval.argm), (yyvsp[(1) - (3)].sval));
                               ;}
    break;

  case 204:
#line 1192 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (2)].argm);
                              set_arg_flag((yyval.argm), (yyvsp[(2) - (2)].ival));
                              IF_NAMED_ARG_SET_ALIAS((yyval.argm), (yyvsp[(2) - (2)].ival));
                            ;}
    break;

  case 205:
#line 1199 "pir.y"
    { (yyval.argm) = new_argument((yyvsp[(1) - (1)].expr)); ;}
    break;

  case 206:
#line 1205 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_RET);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 207:
#line 1213 "pir.y"
    { (yyval.invo) = invoke(lexer, CALL_YIELD);
                              set_invocation_args((yyval.invo), (yyvsp[(3) - (5)].argm));
                            ;}
    break;

  case 208:
#line 1219 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 209:
#line 1221 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 210:
#line 1226 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 211:
#line 1228 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 212:
#line 1233 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 213:
#line 1237 "pir.y"
    { (yyval.argm) = NULL; ;}
    break;

  case 214:
#line 1239 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 215:
#line 1243 "pir.y"
    { (yyval.argm) = (yyvsp[(1) - (1)].argm); ;}
    break;

  case 216:
#line 1245 "pir.y"
    { (yyval.argm) = add_arg((yyvsp[(1) - (2)].argm), (yyvsp[(2) - (2)].argm)); ;}
    break;

  case 217:
#line 1249 "pir.y"
    { (yyval.argm) = (yyvsp[(2) - (3)].argm); ;}
    break;

  case 218:
#line 1254 "pir.y"
    { (yyval.ival) = 0; ;}
    break;

  case 219:
#line 1256 "pir.y"
    { SET_FLAG((yyval.ival), (yyvsp[(2) - (2)].ival)); ;}
    break;

  case 220:
#line 1260 "pir.y"
    { (yyval.ival) = ARG_FLAG_FLAT; ;}
    break;

  case 221:
#line 1262 "pir.y"
    { (yyval.ival) = ARG_FLAG_NAMED;
                          STORE_NAMED_ALIAS((yyvsp[(2) - (2)].sval));
                        ;}
    break;

  case 222:
#line 1268 "pir.y"
    { (yyval.sval) = NULL; ;}
    break;

  case 223:
#line 1270 "pir.y"
    { (yyval.sval) = (yyvsp[(1) - (1)].sval); ;}
    break;

  case 224:
#line 1274 "pir.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 228:
#line 1285 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), !GLOBALCONST); ;}
    break;

  case 229:
#line 1289 "pir.y"
    { define_const(lexer, (yyvsp[(2) - (2)].constval), GLOBALCONST); ;}
    break;

  case 230:
#line 1293 "pir.y"
    { (yyval.constval) = new_named_const(INT_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].ival)); ;}
    break;

  case 231:
#line 1295 "pir.y"
    { (yyval.constval) = new_named_const(NUM_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].dval)); ;}
    break;

  case 232:
#line 1297 "pir.y"
    { (yyval.constval) = new_named_const(PMC_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 233:
#line 1299 "pir.y"
    { (yyval.constval) = new_named_const(STRING_TYPE, (yyvsp[(2) - (4)].sval), (yyvsp[(4) - (4)].sval)); ;}
    break;

  case 234:
#line 1307 "pir.y"
    { (yyval.expr) = expr_from_target((yyvsp[(1) - (1)].targ)); ;}
    break;

  case 235:
#line 1308 "pir.y"
    { (yyval.expr) = expr_from_const((yyvsp[(1) - (1)].constval)); ;}
    break;

  case 236:
#line 1311 "pir.y"
    { (yyval.constval) = new_const(STRING_TYPE, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 237:
#line 1312 "pir.y"
    { (yyval.constval) = new_const(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 238:
#line 1313 "pir.y"
    { (yyval.constval) = new_const(NUM_TYPE, (yyvsp[(1) - (1)].dval)); ;}
    break;

  case 239:
#line 1316 "pir.y"
    { (yyval.ival) = OP_NE; ;}
    break;

  case 240:
#line 1317 "pir.y"
    { (yyval.ival) = OP_EQ; ;}
    break;

  case 241:
#line 1318 "pir.y"
    { (yyval.ival) = OP_LT; ;}
    break;

  case 242:
#line 1319 "pir.y"
    { (yyval.ival) = OP_LE; ;}
    break;

  case 243:
#line 1320 "pir.y"
    { (yyval.ival) = OP_GE; ;}
    break;

  case 244:
#line 1321 "pir.y"
    { (yyval.ival) = OP_GT; ;}
    break;

  case 245:
#line 1324 "pir.y"
    { (yyval.ival) = INT_TYPE; ;}
    break;

  case 246:
#line 1325 "pir.y"
    { (yyval.ival) = NUM_TYPE; ;}
    break;

  case 247:
#line 1326 "pir.y"
    { (yyval.ival) = PMC_TYPE; ;}
    break;

  case 248:
#line 1327 "pir.y"
    { (yyval.ival) = STRING_TYPE; ;}
    break;

  case 249:
#line 1330 "pir.y"
    { (yyval.targ) = (yyvsp[(1) - (1)].targ); ;}
    break;

  case 250:
#line 1331 "pir.y"
    { /* find the symbol; if it's not there, emit an error */
                               symbol *sym = find_symbol(lexer, (yyvsp[(1) - (1)].sval));
                               if (sym == NULL)
                                   yyerror(yyscanner, lexer, "symbol not declared!");
                               else
                                   (yyval.targ) = new_target(sym->type, (yyvsp[(1) - (1)].sval));
                             ;}
    break;

  case 251:
#line 1340 "pir.y"
    { (yyval.targ) = reg(PMC_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 252:
#line 1341 "pir.y"
    { (yyval.targ) = reg(NUM_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 253:
#line 1342 "pir.y"
    { (yyval.targ) = reg(INT_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 254:
#line 1343 "pir.y"
    { (yyval.targ) = reg(STRING_TYPE, (yyvsp[(1) - (1)].ival)); ;}
    break;

  case 257:
#line 1350 "pir.y"
    { (yyval.sval) = "neg"; ;}
    break;

  case 258:
#line 1351 "pir.y"
    { (yyval.sval) = "not"; ;}
    break;

  case 259:
#line 1352 "pir.y"
    { (yyval.sval) = "bnot"; ;}
    break;

  case 260:
#line 1355 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 261:
#line 1356 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;

  case 262:
#line 1357 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 263:
#line 1358 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 264:
#line 1359 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 265:
#line 1360 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 266:
#line 1361 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 267:
#line 1362 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 268:
#line 1363 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 269:
#line 1364 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 270:
#line 1365 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 271:
#line 1366 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 272:
#line 1367 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 273:
#line 1368 "pir.y"
    { (yyval.ival) = OP_OR; ;}
    break;

  case 274:
#line 1369 "pir.y"
    { (yyval.ival) = OP_AND; ;}
    break;

  case 275:
#line 1370 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 276:
#line 1371 "pir.y"
    { (yyval.ival) = OP_XOR; ;}
    break;

  case 277:
#line 1372 "pir.y"
    { (yyval.ival) = OP_ISEQ; ;}
    break;

  case 278:
#line 1373 "pir.y"
    { (yyval.ival) = OP_ISLE; ;}
    break;

  case 279:
#line 1374 "pir.y"
    { (yyval.ival) = OP_ISLT; ;}
    break;

  case 280:
#line 1375 "pir.y"
    { (yyval.ival) = OP_ISGE; ;}
    break;

  case 281:
#line 1376 "pir.y"
    { (yyval.ival) = OP_ISGT; ;}
    break;

  case 282:
#line 1377 "pir.y"
    { (yyval.ival) = OP_ISNE; ;}
    break;

  case 283:
#line 1383 "pir.y"
    { (yyval.ival) = OP_MUL; ;}
    break;

  case 284:
#line 1384 "pir.y"
    { (yyval.ival) = OP_MOD; ;}
    break;

  case 285:
#line 1385 "pir.y"
    { (yyval.ival) = OP_POW; ;}
    break;

  case 286:
#line 1386 "pir.y"
    { (yyval.ival) = OP_DIV; ;}
    break;

  case 287:
#line 1387 "pir.y"
    { (yyval.ival) = OP_FDIV; ;}
    break;

  case 288:
#line 1388 "pir.y"
    { (yyval.ival) = OP_BOR; ;}
    break;

  case 289:
#line 1389 "pir.y"
    { (yyval.ival) = OP_BAND; ;}
    break;

  case 290:
#line 1390 "pir.y"
    { (yyval.ival) = OP_BXOR; ;}
    break;

  case 291:
#line 1391 "pir.y"
    { (yyval.ival) = OP_CONCAT; ;}
    break;

  case 292:
#line 1392 "pir.y"
    { (yyval.ival) = OP_SHR; ;}
    break;

  case 293:
#line 1393 "pir.y"
    { (yyval.ival) = OP_SHL; ;}
    break;

  case 294:
#line 1394 "pir.y"
    { (yyval.ival) = OP_LSR; ;}
    break;

  case 295:
#line 1397 "pir.y"
    { (yyval.ival) = OP_ADD; ;}
    break;

  case 296:
#line 1398 "pir.y"
    { (yyval.ival) = OP_SUB; ;}
    break;


/* Line 1267 of yacc.c.  */
#line 3532 "pirparser.c"
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


#line 1401 "pir.y"


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
                /* XXX replace this by a call to parse_error or yyerror */
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
            /* XXX replace this by a call to parse_error or yyerror */
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
        case OP_INC:
        case OP_DEC:
            printf("This should never happen!");
            break;
    }
    return new_const(INT_TYPE, result);
}

static constant *
fold_n_i(double a, pir_math_operator op, int b) {
    double result;
    /* XXX check out what binary ops work on operands of type (double, int)*/
    return new_const(NUM_TYPE, result);
}

static constant *
fold_i_n(int a, pir_math_operator op, double b) {
    double result;
    /* XXX check out what binary ops work on operands of type (int, double)*/
    return new_const(NUM_TYPE, result);
}

static constant *
fold_n_n(double a, pir_math_operator op, double b) {
    double result;
    /* XXX check out what binary ops work on operands of type (double, double)*/
    return new_const(NUM_TYPE, result);
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
    /* for instance, "a" < "b" is true. */
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


