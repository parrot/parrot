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

/* Substitute the variable and function names.  */
#define yyparse macroparse
#define yylex   macrolex
#define yyerror macroerror
#define yylval  macrolval
#define yychar  macrochar
#define yydebug macrodebug
#define yynerrs macronerrs


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TK_MACRO = 258,
     TK_NL = 259,
     TK_ENDM = 260,
     TK_INCLUDE = 261,
     TK_MACRO_CONST = 262,
     TK_MACRO_LOCAL = 263,
     TK_MACRO_LABEL = 264,
     TK_INT = 265,
     TK_NUM = 266,
     TK_STRING = 267,
     TK_PMC = 268,
     TK_IDENT = 269,
     TK_ANY = 270,
     TK_BODY = 271,
     TK_DOT_IDENT = 272,
     TK_LABEL_ID = 273,
     TK_LOCAL_ID = 274,
     TK_VAR_EXPANSION = 275,
     TK_LABEL_EXPANSION = 276,
     TK_UNIQUE_LABEL = 277,
     TK_UNIQUE_LOCAL = 278,
     TK_STRINGC = 279,
     TK_NUMC = 280,
     TK_INTC = 281
   };
#endif
/* Tokens.  */
#define TK_MACRO 258
#define TK_NL 259
#define TK_ENDM 260
#define TK_INCLUDE 261
#define TK_MACRO_CONST 262
#define TK_MACRO_LOCAL 263
#define TK_MACRO_LABEL 264
#define TK_INT 265
#define TK_NUM 266
#define TK_STRING 267
#define TK_PMC 268
#define TK_IDENT 269
#define TK_ANY 270
#define TK_BODY 271
#define TK_DOT_IDENT 272
#define TK_LABEL_ID 273
#define TK_LOCAL_ID 274
#define TK_VAR_EXPANSION 275
#define TK_LABEL_EXPANSION 276
#define TK_UNIQUE_LABEL 277
#define TK_UNIQUE_LOCAL 278
#define TK_STRINGC 279
#define TK_NUMC 280
#define TK_INTC 281




/* Copy the first part of user declarations.  */
#line 1 "macro.y"


/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */


#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <stdarg.h>
#include <math.h>

#include "macro.h"

/* prevent declarations of malloc() and free() in macroparser.h */
#define YYMALLOC
#define YYFREE

#include "macroparser.h"

#include "lexer.h"

#include "parrot/string_funcs.h"
#include "parrot/parrot.h"


/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* declare yylex prototype BEFORE inclusion of lexer header file. */
#define YY_DECL int macrolex(YYSTYPE *yylval, yyscan_t yyscanner)

/* inlude flex-generated lexer header file. */
#include "macrolexer.h"

/* declare yylex. */
extern YY_DECL;

/* declare yyerror */
int yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...);

#define YYDEBUG         1


#ifndef YYENABLE_NLS
#  define YYENABLE_NLS 0
#endif

#ifndef YYLTYPE_IS_TRIVIAL
#  define YYLTYPE_IS_TRIVIAL 0
#endif




static void process_file(char const * const filename, lexer_state * const lexer);
static void process_string(char const * const buffer, lexer_state * const lexer);
static void include_file(char const * const filename, lexer_state * const lexer, int currentline);
static void expand(yyscan_t yyscanner, macro_def * const macro, list *args,
                   lexer_state * const lexer);

static void define_constant(constant_table * const table, char const * const name,
                            char const * const value);

static void define_macro(constant_table * const table, char const * const name, list * const parameters,
                         char const * const body, int line_defined);

static void emit(lexer_state * const lexer, char const * const str);
static void emitf(lexer_state * const lexer, char const * const str, ...);

static list *new_list(char const * const first_item);
static list *add_item(list * const L, char const * const item);

static char *munge_id(char const * const label_id, int is_label_declaration,
                      lexer_state * const lexer);

static constant_table *new_constant_table(constant_table * const current,
                                          lexer_state * const lexer);

static constant_table *pop_constant_table(lexer_state * const lexer);

static void delete_constant_table(constant_table *table);
static void update_unique_id(lexer_state * const lexer);

macro_def *find_macro(constant_table * const table, char * const name);

extern char *dupstr(char const * const str);
extern char *dupstrn(char const * const str, size_t len);

static char const *concat(char const *str1, char const *str2, int insert_space);
static char *concatn(int insert_space, unsigned numargs, ...);




/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 99 "macro.y"
{
    char const       *sval;
    struct list      *lval;
    struct macro_def *mval;
}
/* Line 187 of yacc.c.  */
#line 260 "macroparser.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 273 "macroparser.c"

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
#define YYLAST   58

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  32
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  28
/* YYNRULES -- Number of rules.  */
#define YYNRULES  58
/* YYNRULES -- Number of states.  */
#define YYNSTATES  75

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   281

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      27,    28,     2,     2,    29,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    30,     2,    31,     2,     2,     2,     2,
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
      25,    26
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     4,     8,     9,    11,    13,    17,    19,
      21,    23,    25,    27,    29,    32,    34,    37,    39,    41,
      43,    45,    48,    52,    59,    61,    62,    64,    66,    69,
      71,    73,    75,    78,    82,    84,    86,    88,    90,    91,
      95,    96,    98,   100,   104,   105,   109,   110,   112,   114,
     118,   120,   122,   126,   127,   130,   132,   134,   136
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      33,     0,    -1,    -1,    34,    35,    34,    -1,    -1,     4,
      -1,    37,    -1,    35,    36,    37,    -1,     4,    -1,    42,
      -1,    40,    -1,    41,    -1,    38,    -1,    39,    -1,    38,
      39,    -1,    15,    -1,    17,    53,    -1,    21,    -1,    22,
      -1,    23,    -1,    20,    -1,     6,    24,    -1,     7,    14,
      59,    -1,    43,    14,    50,     4,    44,     5,    -1,     3,
      -1,    -1,    45,    -1,    46,    -1,    45,    46,    -1,    15,
      -1,    47,    -1,    48,    -1,     9,    18,    -1,     8,    49,
      19,    -1,    10,    -1,    13,    -1,    11,    -1,    12,    -1,
      -1,    27,    51,    28,    -1,    -1,    52,    -1,    14,    -1,
      52,    29,    14,    -1,    -1,    27,    54,    28,    -1,    -1,
      55,    -1,    56,    -1,    55,    29,    56,    -1,    59,    -1,
      57,    -1,    30,    58,    31,    -1,    -1,    58,    15,    -1,
      14,    -1,    25,    -1,    26,    -1,    24,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   178,   178,   179,   182,   183,   186,   187,   191,   198,
     199,   200,   201,   206,   207,   210,   212,   214,   219,   224,
     229,   236,   240,   246,   256,   261,   262,   265,   266,   270,
     271,   272,   275,   279,   285,   286,   287,   288,   292,   293,
     298,   299,   302,   304,   309,   310,   315,   316,   319,   321,
     325,   326,   329,   334,   335,   342,   343,   344,   345
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "\".macro\"", "\"\\n\"", "\".endm\"",
  "\".include\"", "\".macro_const\"", "\".macro_local\"",
  "\".macro_label\"", "\"int\"", "\"num\"", "\"string\"", "\"pmc\"",
  "\"identifier\"", "\"any token\"", "\"macro body\"", "\".identifier\"",
  "\"label\"", "\"$identifier\"", "\"var expansion\"",
  "\"label target expansion\"", "\"unique label\"", "\"unique local\"",
  "\"string constant\"", "\"number constant\"", "\"integer constant\"",
  "'('", "')'", "','", "'{'", "'}'", "$accept", "program", "opt_nl",
  "statements", "newline", "statement", "anything", "any",
  "include_statement", "macro_const_definition", "macro_definition",
  "macro_keyword", "opt_macro_body", "macro_body", "body_token",
  "label_declaration", "local_declaration", "type", "parameters",
  "opt_param_list", "param_list", "arguments", "opt_arg_list", "arg_list",
  "arg", "braced_arg", "long_arg", "expression", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,    40,    41,    44,
     123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    32,    33,    33,    34,    34,    35,    35,    36,    37,
      37,    37,    37,    38,    38,    39,    39,    39,    39,    39,
      39,    40,    41,    42,    43,    44,    44,    45,    45,    46,
      46,    46,    47,    48,    49,    49,    49,    49,    50,    50,
      51,    51,    52,    52,    53,    53,    54,    54,    55,    55,
      56,    56,    57,    58,    58,    59,    59,    59,    59
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     3,     0,     1,     1,     3,     1,     1,
       1,     1,     1,     1,     2,     1,     2,     1,     1,     1,
       1,     2,     3,     6,     1,     0,     1,     1,     2,     1,
       1,     1,     2,     3,     1,     1,     1,     1,     0,     3,
       0,     1,     1,     3,     0,     3,     0,     1,     1,     3,
       1,     1,     3,     0,     2,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       4,     5,     0,     0,     1,    24,     0,     0,    15,    44,
      20,    17,    18,    19,     4,     6,    12,    13,    10,    11,
       9,     0,    21,     0,    46,    16,     8,     3,     0,    14,
      38,    55,    58,    56,    57,    22,    53,     0,    47,    48,
      51,    50,     7,    40,     0,     0,    45,     0,    42,     0,
      41,    25,    54,    52,    49,    39,     0,     0,     0,    29,
       0,    26,    27,    30,    31,    43,    34,    36,    37,    35,
       0,    32,    23,    28,    33
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     2,     3,    14,    28,    15,    16,    17,    18,    19,
      20,    21,    60,    61,    62,    63,    64,    70,    44,    49,
      50,    25,    37,    38,    39,    40,    45,    41
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -17
static const yytype_int8 yypact[] =
{
       6,   -17,     7,    -3,   -17,   -17,   -15,     1,   -17,   -16,
     -17,   -17,   -17,   -17,    18,   -17,    15,   -17,   -17,   -17,
     -17,    17,   -17,     2,    -1,   -17,    33,   -17,    -3,   -17,
      16,   -17,   -17,   -17,   -17,   -17,   -17,    19,     5,   -17,
     -17,   -17,   -17,    30,    41,   -10,   -17,    -1,   -17,    20,
      21,    -7,   -17,   -17,   -17,   -17,    32,    29,    31,   -17,
      46,    -7,   -17,   -17,   -17,   -17,   -17,   -17,   -17,   -17,
      34,   -17,   -17,   -17,   -17
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -17,   -17,    38,   -17,   -17,    26,   -17,    39,   -17,   -17,
     -17,   -17,   -17,   -17,    -5,   -17,   -17,   -17,   -17,   -17,
     -17,   -17,   -17,   -17,    10,   -17,   -17,    35
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -6
static const yytype_int8 yytable[] =
{
       5,    57,    58,     6,     7,    52,    -2,     4,    59,    22,
       1,    24,     8,    31,     9,    23,    31,    10,    11,    12,
      13,    53,    26,    32,    33,    34,    32,    33,    34,    36,
       8,    30,     9,    -5,    47,    10,    11,    12,    13,    66,
      67,    68,    69,    43,    48,    51,    65,    46,    55,    71,
      56,    72,    27,    74,    42,    29,    73,    54,    35
};

static const yytype_uint8 yycheck[] =
{
       3,     8,     9,     6,     7,    15,     0,     0,    15,    24,
       4,    27,    15,    14,    17,    14,    14,    20,    21,    22,
      23,    31,     4,    24,    25,    26,    24,    25,    26,    30,
      15,    14,    17,     0,    29,    20,    21,    22,    23,    10,
      11,    12,    13,    27,    14,     4,    14,    28,    28,    18,
      29,     5,    14,    19,    28,    16,    61,    47,    23
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     4,    33,    34,     0,     3,     6,     7,    15,    17,
      20,    21,    22,    23,    35,    37,    38,    39,    40,    41,
      42,    43,    24,    14,    27,    53,     4,    34,    36,    39,
      14,    14,    24,    25,    26,    59,    30,    54,    55,    56,
      57,    59,    37,    27,    50,    58,    28,    29,    14,    51,
      52,     4,    15,    31,    56,    28,    29,     8,     9,    15,
      44,    45,    46,    47,    48,    14,    10,    11,    12,    13,
      49,    18,     5,    46,    19
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
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, yyscan_t yyscanner, struct lexer_state *lexer)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yyscanner, lexer)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state *lexer;
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
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, yyscan_t yyscanner, struct lexer_state *lexer)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yyscanner, lexer)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state *lexer;
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
yy_reduce_print (YYSTYPE *yyvsp, int yyrule, yyscan_t yyscanner, struct lexer_state *lexer)
#else
static void
yy_reduce_print (yyvsp, yyrule, yyscanner, lexer)
    YYSTYPE *yyvsp;
    int yyrule;
    yyscan_t yyscanner;
    struct lexer_state *lexer;
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
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, yyscan_t yyscanner, struct lexer_state *lexer)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yyscanner, lexer)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    yyscan_t yyscanner;
    struct lexer_state *lexer;
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
int yyparse (yyscan_t yyscanner, struct lexer_state *lexer);
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
yyparse (yyscan_t yyscanner, struct lexer_state *lexer)
#else
int
yyparse (yyscanner, lexer)
    yyscan_t yyscanner;
    struct lexer_state *lexer;
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
        case 8:
#line 192 "macro.y"
    { emit(lexer, "\n");  /* after each statement, emit a newline */ ;}
    break;

  case 15:
#line 211 "macro.y"
    { emit(lexer, (yyvsp[(1) - (1)].sval)); ;}
    break;

  case 16:
#line 213 "macro.y"
    { expand(yyscanner, (yyvsp[(1) - (2)].mval), (yyvsp[(2) - (2)].lval), lexer); ;}
    break;

  case 17:
#line 215 "macro.y"
    {
                              char *label = munge_id((yyvsp[(1) - (1)].sval), 1, lexer);
                              emit(lexer, label);
                            ;}
    break;

  case 18:
#line 220 "macro.y"
    {
                              char *label = munge_id((yyvsp[(1) - (1)].sval), 1, lexer);
                              emit(lexer, label);
                            ;}
    break;

  case 19:
#line 225 "macro.y"
    {
                              char *local = munge_id((yyvsp[(1) - (1)].sval), 0, lexer);
                              emit(lexer, local);
                            ;}
    break;

  case 20:
#line 230 "macro.y"
    { char *label = munge_id((yyvsp[(1) - (1)].sval), 0, lexer);
                              emit(lexer, label);
                            ;}
    break;

  case 21:
#line 237 "macro.y"
    { include_file((yyvsp[(2) - (2)].sval), lexer, macroget_lineno(yyscanner)); ;}
    break;

  case 22:
#line 241 "macro.y"
    { define_constant(lexer->globaldefinitions, (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 23:
#line 249 "macro.y"
    {
                              define_macro(lexer->globaldefinitions, (yyvsp[(2) - (6)].sval), (yyvsp[(3) - (6)].lval), (yyvsp[(5) - (6)].sval),
                                           lexer->line_defined);
                            ;}
    break;

  case 24:
#line 257 "macro.y"
    { lexer->line_defined = macroget_lineno(yyscanner); ;}
    break;

  case 25:
#line 261 "macro.y"
    { (yyval.sval) = ""; ;}
    break;

  case 28:
#line 267 "macro.y"
    { (yyval.sval) = concat((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval), 1); ;}
    break;

  case 32:
#line 276 "macro.y"
    { (yyval.sval) = (yyvsp[(2) - (2)].sval); ;}
    break;

  case 33:
#line 280 "macro.y"
    { /* create a string like ".local <type> <id>" */
                              (yyval.sval) = concatn(1, 3, ".local", (yyvsp[(2) - (3)].sval), (yyvsp[(3) - (3)].sval));
                            ;}
    break;

  case 38:
#line 292 "macro.y"
    { (yyval.lval) = NULL; ;}
    break;

  case 39:
#line 294 "macro.y"
    { (yyval.lval) = (yyvsp[(2) - (3)].lval);   ;}
    break;

  case 40:
#line 298 "macro.y"
    { (yyval.lval) = NULL; ;}
    break;

  case 42:
#line 303 "macro.y"
    { (yyval.lval) = new_list((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 43:
#line 305 "macro.y"
    { (yyval.lval) = add_item((yyvsp[(1) - (3)].lval), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 44:
#line 309 "macro.y"
    { (yyval.lval) = NULL; ;}
    break;

  case 45:
#line 311 "macro.y"
    { (yyval.lval) = (yyvsp[(2) - (3)].lval);   ;}
    break;

  case 46:
#line 315 "macro.y"
    { (yyval.lval) = NULL; ;}
    break;

  case 48:
#line 320 "macro.y"
    { (yyval.lval) = new_list((yyvsp[(1) - (1)].sval)); ;}
    break;

  case 49:
#line 322 "macro.y"
    { (yyval.lval) = add_item((yyvsp[(1) - (3)].lval), (yyvsp[(3) - (3)].sval)); ;}
    break;

  case 52:
#line 330 "macro.y"
    { (yyval.sval) = (yyvsp[(2) - (3)].sval); ;}
    break;

  case 53:
#line 334 "macro.y"
    { (yyval.sval) = ""; ;}
    break;

  case 54:
#line 336 "macro.y"
    { (yyval.sval) = concat((yyvsp[(1) - (2)].sval), (yyvsp[(2) - (2)].sval), 0); ;}
    break;


/* Line 1267 of yacc.c.  */
#line 1707 "macroparser.c"
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


#line 350 "macro.y"



/*

=head1 Functions

=over 4

=item C<static list *
new_list(char const * const first_item)>

Create a new list node. The specified item is assigned to the node's value.
Returns the newly created node.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static list *
new_list(char const * const first_item) {
    list *L = (list *)mem_sys_allocate_zeroed(sizeof (list));
    L->item = first_item;
    return L;
}

/*

=item C<static list *
add_item(list * const L, char const * const item)>

Add a new item to the specified list. The item is added
at the back of the list, so items added are kept in order.

A pointer to the beginning of the list is returned (the
same as was specified).

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
static list *
add_item(list * const L, char const * const item) {
    list *iter = L;
    PARROT_ASSERT(iter != NULL);

    /* the item is added at the end of the list. This
     * can be done more efficiently, but for now this works.
     */
    while (iter->next != NULL) {
        iter = iter->next;
    }
    /* iter->next is now NULL, link the new node onto it. */
    iter->next = new_list(item);

    return L;
}

/*

=item C<static void
include_file(char const * const filename, lexer_state * const lexer, int currentline)>

Process the specified file.


=cut

*/
static void
include_file(char const * const filename, lexer_state * const lexer, int currentline) {
    char * const temp = dupstrn(filename + 1, strlen(filename) - 1);

    PARROT_ASSERT(filename != NULL);

    fprintf(stderr, "including: %s\n", filename);

    emitf(lexer, "\n.line 1\n");
    emitf(lexer, ".file '%s'\n", temp);

    /* give address of string, skipping opening quote */
    process_file(temp, lexer);

    emitf(lexer, "\n.line %d\n", currentline);
    emitf(lexer, ".file '%s'\n", lexer->currentfile);

    mem_sys_free(temp);
}

/*

=item C<static void
update_unique_id(lexer_state * const lexer)>

=cut

*/
static void
update_unique_id(lexer_state * const lexer) {
    /* each expansion has a unique id that is used for label/local munging */
    lexer->id_gen++;
    /* Count number of digits:
     * log10 returns a double, get the part before the dot (so, "3.14" -> "3")
     * using the floor() function.
     * log10(1000) -> 3, so add 1 more digit.
     */
    lexer->num_digits = (int)floor(log10(lexer->id_gen)) + 1;
}


/*

=item C<static void
expand(yyscan_t yyscanner, macro_def * const macro, list * args, lexer_state * const lexer)>

Expand the specified macro (or constant).

=cut

*/
static void
expand(yyscan_t yyscanner, macro_def * const macro, list * args, lexer_state * const lexer) {
    /* construct a map data structure that maps the argument values to the parameter names */
    /* enter the parameters as temporary symbols (.macro_const) */
    constant_table *macro_params = new_constant_table(lexer->globaldefinitions, lexer);
    list           *params       = macro->parameters;

    int             current_scope_nr;
    char const     *current_macro_id;

    while (params && args) {
        define_constant(macro_params, params->item, args->item);
        params = params->next;
        args   = args->next;
    }

    /* check for both conditions; either can be non-null, indicating an error.
     * If both are null, then all went ok.
     */
    if (params != NULL)  /* args must be null, so too few arguments */
        fprintf(stderr, "Too few arguments for macro expansion %s.\n", macro->name);

    if (args != NULL)  /* params must be null, so too many arguments */
        fprintf(stderr, "Too many arguments for macro expansion %s.\n", macro->name);


    /* parse the macro body */

    current_macro_id = lexer->macro_id;
    lexer->macro_id  = macro->name;
    /* save current scope id */
    current_scope_nr = lexer->unique_id;
    update_unique_id(lexer);
    lexer->unique_id = lexer->id_gen;

    if (macro->line_defined)
        emitf(lexer, "\n.line %d\n", macro->line_defined);

    process_string(macro->body, lexer);

    if (macro->line_defined)
        emitf(lexer, "\n.line %d\n", macroget_lineno(yyscanner));

    /* restore current scope id */
    lexer->unique_id = current_scope_nr;
    lexer->macro_id  = current_macro_id;

    /* now remove the temporary constant definitions */
    pop_constant_table(lexer);
    delete_constant_table(macro_params);

}


/*

=item C<static void
define_constant(constant_table * const table, char const * const name, char const * const value)>

=cut

*/
PARROT_MALLOC
PARROT_IGNORABLE_RESULT
static void
define_constant(constant_table * const table, char const * const name, char const * const value) {
    macro_def *def     = (macro_def *)mem_sys_allocate_zeroed(sizeof (macro_def));
    def->name          = name;
    def->body          = value;
    def->next          = table->definitions;
    table->definitions = def;
}

/*

=item C<void
define_macro(constant_table * const table, char * const name, list * const parameters)>

Define a macro by the given name, parameters and body.

=cut

*/
PARROT_MALLOC
static void
define_macro(constant_table * const table, char const * const name, list * const parameters,
             char const * const body, int line_defined)
{
    struct macro_def *macro   = (struct macro_def *)mem_sys_allocate(sizeof (struct macro_def));

    /* initialize the fields */
    macro->name         = name;
    macro->body         = body;
    macro->parameters   = parameters;
    macro->line_defined = line_defined;

    /* link the macro in the list */
    macro->next         = table->definitions;
    table->definitions  = macro;
}


/*

=item C<macro_def *
find_macro(constant_table * const table, char * const name)>

Find the specified macro. If the specified macro does not exist,
NULL is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
macro_def *
find_macro(constant_table * const table, char * const name) {
    macro_def *iter = table->definitions;
    PARROT_ASSERT(name != NULL);

    /* iterate over the list and compare each node's name */
    while (iter != NULL) {
        if (strcmp(iter->name, name) == 0)
            return iter;
        iter = iter->next;
    }

    if (table->prev)
        return find_macro(table->prev, name);

    return NULL;
}

/*

=item C<static char const *
concat(char const * str1, char const * str2, int need_space)>

Concatenate two strings, and return the result. If the first string is NULL, then
the result consists of the second string. If need_space is true, a space is
inserted between the two strings.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char const *
concat(char const * str1, char const * str2, int need_space) {
    PARROT_ASSERT (str2 != NULL);
    if (str1 == NULL)
        return str2;
    else {
        /* allocate a new buffer large enough to hold both strings, a space, and the NULL char. */
        /* TODO: make this more efficient; don't malloc every time, just allocate a big enough
         * buffer, and only increase it if it's full. For now this is the easiest solution.
         */
        int   strlen1   = strlen(str1);
        char *newbuffer = (char *)mem_sys_allocate((strlen1 + strlen(str2) + 1
                                                   + (need_space ? 1 : 0))
                                                   * sizeof (char));


        sprintf(newbuffer, "%s%s%s", str1, need_space ? " " : "", str2);

        mem_sys_free((void *)((char const *)str1));
        mem_sys_free((void *)((char const *)str2));

        return newbuffer;
    }
}

/*

=item C<static char *
concatn(int need_space, unsigned numargs, ...)>

Concatenate C<numargs> strings together into one new string. If C<need_space> is
non-zero, the strings are separated by a space.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char *
concatn(int need_space, unsigned numargs, ...) {
    va_list  arg_ptr;
    unsigned iter;
    char   **args;
    size_t   totalsize = 1; /* always 1 for NULL character */
    char    *result;
    size_t   result_index = 0;

    args = (char **)mem_sys_allocate(numargs * sizeof (char *));

    va_start(arg_ptr, numargs);

    for (iter = 0; iter < numargs; iter++) {
        /* store the argument in an array */
        args[iter] = va_arg(arg_ptr, char *);
        /* update total length so far */
        totalsize += strlen(args[iter]);
    }

    va_end(arg_ptr);

    if (need_space) /* then also allocate for separating spaces */
        totalsize += numargs - 1; /* 10 arguments would be separated by 9 spaces */

    result = (char *)mem_sys_allocate_zeroed(totalsize * sizeof (char));

    for (iter = 0; iter < numargs; iter++) {
        /* sprintf returns the number of characters printed; use that as an offset for next time */
        result_index += sprintf(result + result_index, "%s%s", args[iter], need_space ? " " : "");
        /* free old memory */
        mem_sys_free(args[iter]);
    }

    mem_sys_free(args);

    return result;
}

/* short-cut to check for a label; last character must be ":" */
#define is_label(X)     (X[strlen(X) - 1] == ':')

/* short-cut to check for token equality */
#define is_token(X,Y)   (strcmp(X,Y) == 0)


/*

=item C<static void
emit(lexer_state * const lexer, char const * const str)>

Emit the specified string. This function will be the "gateway" to the
output file. All tokens except C<.sub>, C<.end> and C<.namespace> are indented.
All tokens are separated with a space,  C<)>, C<]>, C<,>.

=cut

*/
static void
emit(lexer_state * const lexer, char const * const str) {
    fprintf(lexer->outfile, "%s ", str);
}

/*

=item C<static void
emitf(lexer_state * const lexer, char const * const str, ...)>

=cut

*/
static void
emitf(lexer_state * const lexer, char const * const str, ...) {
    va_list arg_ptr;
    va_start(arg_ptr, str);
    vfprintf(lexer->outfile, str, arg_ptr);
    va_end(arg_ptr);
}

static void
pretty_print(char * const str) {
    FILE *output = stdout;
    /* globals! */
    static int just_nl    = 1;
    static int need_space = 1;

    /* emit a newline between .subs and .namespaces */
    if (is_token(str, ".sub") || is_token(str, ".namespace"))
        fprintf(output, "\n");

    /* if the token needs indention, all except .sub, .end and .namespace. */
    if (!is_token(str, ".sub") && !is_token(str, ".end") && !is_token(str, ".namespace")) {
        if (just_nl) { /* just a newline means we need some indention */
            if (is_label(str)) { /* indent labels a bit less than other tokens */
                fprintf(output, "  ");
            }
            else { /* not a label */
                fprintf(output, "    ");
            }
        }
    }
    /* print the token; if it's a token like a comma, that shouldn't be prefixed with space,
     * remove the space (backspace)
     */
    /*
    if (is_token(str, ",") || is_token(str, ")") || is_token(str, "]")) {
        fprintf(output, "%c", '\b');
    }
    */

    if (is_token(str, "(") || is_token(str, "[")) {
        need_space = 0; /* no separation needed after these tokens */
    }
    else { /* all normal cases emit a separation space for tokens */
        need_space = 1;
    }
    /* print the token */
    fprintf(output, "%s", str);
    /* check for newline */
    if (is_token(str, "\n"))
        just_nl = 1;
    else {
        just_nl = 0;
        if (need_space)
            fprintf(output, " ");
    }

}

/*

=item C<new_constant_table>

=cut

*/
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static constant_table *
new_constant_table(constant_table * const current, lexer_state * const lexer) {
    constant_table *table    = (constant_table *)mem_sys_allocate(sizeof (constant_table));
    table->definitions       = NULL;
    table->prev              = current;
    lexer->globaldefinitions = table;
    return table;
}


/*

=item C<pop_constant_table>

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
static constant_table *
pop_constant_table(lexer_state * const lexer) {
    constant_table *popped   = lexer->globaldefinitions;
    lexer->globaldefinitions = popped->prev;
    return popped;
}

/*

=item C<delete_constant_table>

=cut

*/
static void
delete_constant_table(constant_table *table) {
    /* destroy all definitions */
    macro_def *iter = table->definitions;

    while (iter != NULL) {
        macro_def *temp = iter;
        iter            = iter->next;
        mem_sys_free(temp);
    }
    mem_sys_free(table);
}



/*

=item C<munge_id>

Generate an identifier based on a macro label or locaal declaration, or a macro label
or local expansion.

A label declaration looks like: ".label $LABEL:", from which a normal
PIR label is created, formatted as: "_unique_MACRO_LABEL_?:".

A label expansion looks like ".$LABEL", from which a label identifier is
generated, formatted as: "_unique_MACRO_LABEL_?"
(note the difference, there is no colon at the end.

The same works for local identifiers, but of course the is_label_declaration
argument must be 0 for that.

=cut

*/
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static char *
munge_id(char const * const id, int is_label_declaration, lexer_state * const lexer) {
    /* the format of the generated label: */
    char const * const format        = "_unique_%s_%s_%d%s"; /* 18 characters */
    int  const         format_length = strlen(format);



    /* calculate length of the generated label: length of macro name,
     * plus length of label name.
     */
    int   length    = format_length + strlen(lexer->macro_id) + lexer->num_digits;
    char *munged_id;

    length += strlen(id);

    if (is_label_declaration)
        length++; /* reserve 1 more byte for the ":" */

    munged_id = (char *)mem_sys_allocate((length + 1) * sizeof (char));

    /* generate the identifier; if it's a declaration, then add the colon. */
    sprintf(munged_id, format, lexer->macro_id, id, lexer->unique_id,
            is_label_declaration ? ":" : "");

    return munged_id;
}



/*

=item C<static void
process_string(char * const buffer, lexer_state * const lexer)>

Process the string stored in C<buffer>. First a new yyscan_t
object is created, initialized, after which the specified
buffer is parsed. Afterwards the yyscan_t object is destroyed.

=cut

*/
static void
process_string(char const * const buffer, lexer_state * const lexer) {
    /* initialize a yyscan_t object */
    yyscan_t yyscanner;
    macrolex_init(&yyscanner);

    macroset_debug(lexer->flexdebug, yyscanner);
    macroset_extra(lexer, yyscanner);
    PARROT_ASSERT(buffer != NULL);
    /* set the scanner to a string buffer and go parse */
    macro_scan_string(buffer, yyscanner);
    yyparse(yyscanner, lexer);
    /* clean up after playing */
    macrolex_destroy(yyscanner);
}

/*

=item C<static void
process_file(char const * const filename, lexer_state * const lexer)>

Process the specified file.

=cut

*/
static void
process_file(char const * const filename, lexer_state * const lexer) {
    char const *temp_file;
    FILE       *fp;
    yyscan_t    yyscanner;

    if (filename == NULL)  /* no file name means reading from stdin. */
        fp = stdin;
    else  /* open the specified file */
        fp = fopen(filename, "r");

    if (fp == NULL) {
        fprintf(stderr, "Failed to open file %s\n", filename);
        return;
    }

    /* save current state of lexer, these are overwritten, so that
     * error messages indicate an error in the string (macro body).
     */
    temp_file = lexer->currentfile;

    /* construct a yylex_t object */
    macrolex_init(&yyscanner);
    macroset_in(fp, yyscanner);
    macroset_debug(lexer->flexdebug, yyscanner);
    macroset_extra(lexer, yyscanner);

    /* go parse the file */
    yyparse(yyscanner, lexer);
    /* and clean up */
    macrolex_destroy(yyscanner);

    /* restore state of lexer */
    lexer->currentfile = temp_file;

}

/*

=item C<static void
print_help(char const * const programname)>

=cut

*/
static void
print_help(char const * const programname) {
    fprintf(stderr, "Usage: %s [options] [input]\n", programname);
    fprintf(stderr, "where options are:\n");
    fprintf(stderr, "  -d  debug the generated parser\n");
    fprintf(stderr, "  -f  debug the generated lexer\n\n");
    fprintf(stderr, "If no input is specified, the program reads from stdin.\n");

}

/*

=item C<int
yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...)>

Function for syntax error handling.

=cut

*/
int
yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...) {
    va_list arg_ptr;

    fprintf(stderr, "Error in '%s' (line %d): ", lexer->currentfile, macroget_lineno(yyscanner));

    va_start(arg_ptr, message);
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);

    puts("");

    ++lexer->errors;
    return 0;
}


/*

=item C<int
main(int argc, char *argv[])>

Pre-processor main function.

=cut

*/
int
main(int argc, char *argv[]) {
    lexer_state *lexer = NULL;
    char const * const programname = argv[0];

    /* skip program name */
    argc--;
    argv++;

    lexer = (lexer_state *)mem_sys_allocate_zeroed(sizeof (lexer_state));

    lexer->unique_id         = 0;
    lexer->errors            = 0;
    lexer->flexdebug         = 0;
    lexer->macro_id          = NULL;
    lexer->globaldefinitions = new_constant_table(NULL, lexer);

    lexer->outfile           = stdout;

    /* very basic argument handling; I'm too lazy to check out
     * the standard funtion for that, right now. This is a TODO.
     */
    while (argc > 0 && argv[0][0] == '-') {
        switch (argv[0][1]) {
            /* Only allow for debug flag if the generated parser supports it */
#ifdef YYDEBUG
            case 'd':
                yydebug = 1;
                break;
#endif
            case 'f':
                lexer->flexdebug = 1;
                break;
            case 'h':
                print_help(programname);
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

    if (argc > 0) { /* a command line argument was given */
        lexer->currentfile = argv[0];
        process_file(argv[0], lexer);
    }
    else { /* no filename */
        lexer->currentfile = "STDIN";
        process_file(NULL, lexer);
    }

    if (lexer->errors > 0)
        fprintf(stderr, "There were %d error(s)\n", lexer->errors);


    /* clean up and go home */
    delete_constant_table(lexer->globaldefinitions);
    mem_sys_free(lexer);

    return 0;
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


