/* A Bison parser, made from languages/imcc/imcc.y, by GNU bison 1.75.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002 Free Software Foundation, Inc.

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
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* Written by Richard Stallman by simplifying the original so called
   ``semantic'' parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON	1

/* Pure parsers.  */
#define YYPURE	1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LOW_PREC = 258,
     PARAM = 259,
     CALL = 260,
     GOTO = 261,
     ARG = 262,
     FLATTEN_ARG = 263,
     IF = 264,
     UNLESS = 265,
     NEW = 266,
     END = 267,
     SAVEALL = 268,
     RESTOREALL = 269,
     NAMESPACE = 270,
     ENDNAMESPACE = 271,
     CLASS = 272,
     ENDCLASS = 273,
     FIELD = 274,
     METHOD = 275,
     SUB = 276,
     SYM = 277,
     LOCAL = 278,
     CONST = 279,
     INC = 280,
     DEC = 281,
     GLOBAL_CONST = 282,
     SHIFT_LEFT = 283,
     SHIFT_RIGHT = 284,
     INTV = 285,
     FLOATV = 286,
     STRINGV = 287,
     DEFINED = 288,
     LOG_XOR = 289,
     RELOP_EQ = 290,
     RELOP_NE = 291,
     RELOP_GT = 292,
     RELOP_GTE = 293,
     RELOP_LT = 294,
     RELOP_LTE = 295,
     GLOBAL = 296,
     ADDR = 297,
     CLONE = 298,
     RESULT = 299,
     RETURN = 300,
     POW = 301,
     SHIFT_RIGHT_U = 302,
     LOG_AND = 303,
     LOG_OR = 304,
     COMMA = 305,
     ESUB = 306,
     PCC_BEGIN = 307,
     PCC_END = 308,
     PCC_CALL = 309,
     PCC_SUB = 310,
     PCC_BEGIN_RETURN = 311,
     PCC_END_RETURN = 312,
     PCC_BEGIN_YIELD = 313,
     PCC_END_YIELD = 314,
     NCI_CALL = 315,
     PROTOTYPED = 316,
     NON_PROTOTYPED = 317,
     LABEL = 318,
     EMIT = 319,
     EOM = 320,
     IREG = 321,
     NREG = 322,
     SREG = 323,
     PREG = 324,
     IDENTIFIER = 325,
     STRINGC = 326,
     INTC = 327,
     FLOATC = 328,
     REG = 329,
     MACRO = 330,
     ENDM = 331,
     PARROT_OP = 332,
     VAR = 333,
     LINECOMMENT = 334,
     FILECOMMENT = 335
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define CALL 260
#define GOTO 261
#define ARG 262
#define FLATTEN_ARG 263
#define IF 264
#define UNLESS 265
#define NEW 266
#define END 267
#define SAVEALL 268
#define RESTOREALL 269
#define NAMESPACE 270
#define ENDNAMESPACE 271
#define CLASS 272
#define ENDCLASS 273
#define FIELD 274
#define METHOD 275
#define SUB 276
#define SYM 277
#define LOCAL 278
#define CONST 279
#define INC 280
#define DEC 281
#define GLOBAL_CONST 282
#define SHIFT_LEFT 283
#define SHIFT_RIGHT 284
#define INTV 285
#define FLOATV 286
#define STRINGV 287
#define DEFINED 288
#define LOG_XOR 289
#define RELOP_EQ 290
#define RELOP_NE 291
#define RELOP_GT 292
#define RELOP_GTE 293
#define RELOP_LT 294
#define RELOP_LTE 295
#define GLOBAL 296
#define ADDR 297
#define CLONE 298
#define RESULT 299
#define RETURN 300
#define POW 301
#define SHIFT_RIGHT_U 302
#define LOG_AND 303
#define LOG_OR 304
#define COMMA 305
#define ESUB 306
#define PCC_BEGIN 307
#define PCC_END 308
#define PCC_CALL 309
#define PCC_SUB 310
#define PCC_BEGIN_RETURN 311
#define PCC_END_RETURN 312
#define PCC_BEGIN_YIELD 313
#define PCC_END_YIELD 314
#define NCI_CALL 315
#define PROTOTYPED 316
#define NON_PROTOTYPED 317
#define LABEL 318
#define EMIT 319
#define EOM 320
#define IREG 321
#define NREG 322
#define SREG 323
#define PREG 324
#define IDENTIFIER 325
#define STRINGC 326
#define INTC 327
#define FLOATC 328
#define REG 329
#define MACRO 330
#define ENDM 331
#define PARROT_OP 332
#define VAR 333
#define LINECOMMENT 334
#define FILECOMMENT 335




/* Copy the first part of user declarations.  */
#line 1 "languages/imcc/imcc.y"

/*
 * imcc.y
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * Grammar for the parser.
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define _PARSER
#define MAIN
#include "imc.h"
#include "pbc.h"
#include "parser.h"

#define YYDEBUG 1
#define YYERROR_VERBOSE 1

/*
 * we use a pure parser with the interpreter as a parameter
 * this still doesn't make the parser reentrant, there are too
 * many globals around.
 * These globals should go into one structure, which could be
 * attached to the interpreter
 */

#define YYPARSE_PARAM interp
#define YYLEX_PARAM interp
/*
 * Choosing instructions for Parrot is pretty easy since
 * many are polymorphic.
 */


/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_REGS];
static int nkeys;
static int keyvec;
static SymReg *regs[IMCC_MAX_REGS];
static int nargs;


/*
 * MK_I: build and emitb instruction by INS
 *
 * fmt may contain:
 *   op %s, %s # comment
 * or just
 *   op
 *
 */
static Instruction *
MK_I(struct Parrot_Interp *interpreter, const char * fmt, int n, ...)
{
    char opname[64];
    char *p;
    const char *q;
    va_list ap;
    SymReg *r[IMCC_MAX_REGS];
    int i;

    for (p = opname, q = fmt; *q && *q != ' '; )
	*p++ = *q++;
    *p = 0;
    if (!*q)
	fmt = 0;
    else
	fmt = ++q;
#if OPDEBUG
    fprintf(stderr, "op '%s' format '%s' (%d)\n", opname, fmt?:"",n);
#endif
    va_start(ap, n);
    i = 0;
    while (i < n) {
	r[i++] = va_arg(ap, SymReg *);
    }
    va_end(ap);
    while (i < IMCC_MAX_REGS)
	r[i++] = NULL;
    return INS(interpreter, opname, fmt, r, n, keyvec, 1);
}

/*
 * special instructions
 *
 * labels and such
 */


static void clear_state(void)
{
    nargs = 0;
    keyvec = 0;
    memset(regs, 0, sizeof(regs));
}


Instruction * INS_LABEL(SymReg * r0, int emit)
{

    SymReg *r[IMCC_MAX_REGS];
    Instruction *ins;
    int i;

    r[0] = r0;
    i = 1;
    while (i < IMCC_MAX_REGS)
	r[i++] = NULL;
    ins = _mk_instruction("","%s:", r, 0);
    ins->type = ITLABEL;
    r0->first_ins = ins;
    if (emit)
        emitb(ins);
    return ins;
}

static Instruction * iLABEL(SymReg * r0) {
    Instruction *i = INS_LABEL(r0, 1);
    i->line = line;
    clear_state();
    return i;
}


static Instruction * iSUBROUTINE(SymReg * r0) {
    Instruction *i;
    function = r0->name;
    i =  iLABEL(r0);
    i->line = line - 1;
    if (*r0->name != '_')
        fataly(EX_SOFTWARE, sourcefile, line,
        "illegal local label '%s'\n", r0->name);
    return i;
}


/*
 * substr or X = Pkey
 */
static Instruction *
iINDEXFETCH(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1,
    SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        return MK_I(interp, "substr %s, %s, %s, 1", 4, r0, r1, r2, r3);
    }
    keyvec |= KEY_BIT(2);
    return MK_I(interp, "set %s, %s[%s]", 3, r0,r1,r2);
}

/*
 * substr or Pkey = X
 */

static Instruction *
iINDEXSET(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1, SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        MK_I(interp, "substr %s, %s, %s, %s", 4, r0, r1,r3, r2);
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I(interp, "set %s[%s], %s", 3, r0,r1,r2);
    }
    else {
        fataly(EX_SOFTWARE, sourcefile, line,"unsupported indexed set op\n");
    }
    return 0;
}


static char * inv_op(char *op) {
    int n;
    return (char *) get_neg_op(op, &n);
}



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

#ifndef YYSTYPE
#line 191 "languages/imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/local/share/bison/yacc.c.  */
#line 430 "languages/imcc/imcparser.c"
# define YYSTYPE yystype
# define YYSTYPE_IS_TRIVIAL 1
#endif

#ifndef YYLTYPE
typedef struct yyltype
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} yyltype;
# define YYLTYPE yyltype
# define YYLTYPE_IS_TRIVIAL 1
#endif

/* Copy the second part of user declarations.  */


/* Line 213 of /usr/local/share/bison/yacc.c.  */
#line 451 "languages/imcc/imcparser.c"

#if ! defined (yyoverflow) || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# if YYSTACK_USE_ALLOCA
#  define YYSTACK_ALLOC alloca
# else
#  ifndef YYSTACK_USE_ALLOCA
#   if defined (alloca) || defined (_ALLOCA_H)
#    define YYSTACK_ALLOC alloca
#   else
#    ifdef __GNUC__
#     define YYSTACK_ALLOC __builtin_alloca
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
# else
#  if defined (__STDC__) || defined (__cplusplus)
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   define YYSIZE_T size_t
#  endif
#  define YYSTACK_ALLOC malloc
#  define YYSTACK_FREE free
# endif
#endif /* ! defined (yyoverflow) || YYERROR_VERBOSE */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (YYLTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAX (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAX)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  register YYSIZE_T yyi;		\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];	\
	}					\
      while (0)
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
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAX;	\
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (0)

#endif

#if defined (__STDC__) || defined (__cplusplus)
   typedef signed char yysigned_char;
#else
   typedef short yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  3
#define YYLAST   406

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  96
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  79
/* YYNRULES -- Number of rules. */
#define YYNRULES  198
/* YYNRULES -- Number of states. */
#define YYNSTATES  341

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   335

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    83,     2,     2,     2,    89,    91,     2,
       2,     2,    87,    86,     2,    84,    90,    88,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    95,
       2,    82,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    93,     2,    94,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    92,     2,    85,     2,     2,     2,
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
       2,     2,     2,     2,     2,     2,     1,     2,     3,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    11,    13,    15,    18,
      20,    22,    25,    27,    30,    34,    37,    39,    41,    42,
      46,    49,    50,    52,    53,    58,    62,    64,    66,    69,
      71,    73,    77,    80,    83,    86,    87,    92,    93,    94,
     103,   104,   106,   110,   111,   116,   117,   128,   129,   132,
     134,   136,   137,   139,   145,   149,   153,   154,   158,   161,
     164,   165,   169,   172,   173,   178,   179,   186,   187,   194,
     195,   198,   202,   205,   207,   210,   211,   214,   217,   219,
     221,   223,   225,   227,   228,   230,   233,   235,   237,   241,
     243,   245,   248,   251,   252,   257,   258,   265,   266,   273,
     274,   279,   282,   285,   288,   291,   294,   297,   300,   303,
     305,   307,   309,   312,   313,   315,   317,   319,   321,   323,
     327,   332,   337,   342,   348,   354,   360,   366,   372,   378,
     384,   390,   396,   402,   408,   414,   420,   426,   432,   438,
     445,   452,   459,   464,   469,   477,   482,   487,   492,   497,
     498,   502,   507,   515,   520,   527,   534,   539,   544,   549,
     554,   556,   558,   560,   562,   564,   566,   568,   570,   572,
     574,   575,   577,   581,   583,   585,   590,   592,   594,   596,
     598,   600,   602,   603,   606,   608,   612,   614,   616,   618,
     620,   622,   624,   626,   628,   630,   632,   634,   636
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      97,     0,    -1,    -1,    98,   100,    -1,   108,    -1,   114,
      -1,   118,    -1,   106,    -1,    76,     4,    -1,     4,    -1,
      99,    -1,   100,    99,    -1,   102,    -1,   101,   102,    -1,
     144,   103,     4,    -1,    76,     4,    -1,    81,    -1,    80,
      -1,    -1,   104,    78,   105,    -1,    56,    64,    -1,    -1,
     161,    -1,    -1,    65,   107,   101,    66,    -1,    18,   109,
      19,    -1,   110,    -1,   111,    -1,   110,   111,    -1,   112,
      -1,   113,    -1,    20,   153,    71,    -1,    21,    71,    -1,
     116,   115,    -1,   141,    52,    -1,    -1,    22,   117,    71,
       4,    -1,    -1,    -1,    56,   119,    71,   128,     4,   120,
     121,   115,    -1,    -1,     4,    -1,   121,   122,     4,    -1,
      -1,     5,   123,   153,    71,    -1,    -1,    53,   127,     4,
     125,   130,   129,   126,   132,    54,     4,    -1,    -1,   146,
       4,    -1,    62,    -1,    63,    -1,    -1,   127,    -1,    55,
     166,    51,   166,     4,    -1,    55,   166,     4,    -1,    61,
     166,     4,    -1,    -1,   130,   131,     4,    -1,     8,   166,
      -1,     9,   159,    -1,    -1,   132,   133,     4,    -1,    45,
     159,    -1,    -1,    24,   134,   153,    71,    -1,    -1,    57,
       4,   136,   139,    58,     4,    -1,    -1,    59,     4,   138,
     139,    60,     4,    -1,    -1,   139,     4,    -1,   139,   140,
       4,    -1,    46,   166,    -1,   143,    -1,   141,   143,    -1,
      -1,   142,   147,    -1,    76,     4,    -1,   124,    -1,   135,
      -1,   137,    -1,    81,    -1,    80,    -1,    -1,   145,    -1,
     145,   146,    -1,   146,    -1,    64,    -1,   144,   148,     4,
      -1,   155,    -1,   157,    -1,    16,    71,    -1,    17,    71,
      -1,    -1,    24,   149,   153,    71,    -1,    -1,    25,   150,
     153,    71,    82,   173,    -1,    -1,    28,   151,   153,    71,
      82,   173,    -1,    -1,     5,   152,   153,    71,    -1,     5,
     172,    -1,    45,   166,    -1,     8,   166,    -1,    46,   166,
      -1,     6,   164,    -1,     7,   164,    -1,    26,   166,    -1,
      27,   166,    -1,    14,    -1,    15,    -1,    13,    -1,    78,
     161,    -1,    -1,    31,    -1,    32,    -1,    33,    -1,   154,
      -1,    71,    -1,   159,    82,   166,    -1,   159,    82,    83,
     166,    -1,   159,    82,    84,   166,    -1,   159,    82,    85,
     166,    -1,   159,    82,   166,    86,   166,    -1,   159,    82,
     166,    84,   166,    -1,   159,    82,   166,    87,   166,    -1,
     159,    82,   166,    47,   166,    -1,   159,    82,   166,    88,
     166,    -1,   159,    82,   166,    89,   166,    -1,   159,    82,
     166,    90,   166,    -1,   159,    82,   166,    29,   166,    -1,
     159,    82,   166,    30,   166,    -1,   159,    82,   166,    48,
     166,    -1,   159,    82,   166,    49,   166,    -1,   159,    82,
     166,    50,   166,    -1,   159,    82,   166,    35,   166,    -1,
     159,    82,   166,    91,   166,    -1,   159,    82,   166,    92,
     166,    -1,   159,    82,   166,    85,   166,    -1,   159,    82,
     166,    93,   167,    94,    -1,   166,    93,   167,    94,    82,
     166,    -1,   159,    82,    12,   154,    51,   166,    -1,   159,
      82,    12,   154,    -1,   159,    82,    34,   166,    -1,   159,
      82,    34,   166,    93,   167,    94,    -1,   159,    82,    44,
     166,    -1,   159,    82,    43,    71,    -1,   159,    82,    42,
     174,    -1,    42,   174,    82,   166,    -1,    -1,    12,   156,
     105,    -1,    34,   159,    51,   166,    -1,    34,   159,    51,
     166,    93,   167,    94,    -1,    44,   159,    51,   166,    -1,
      10,   166,   158,   166,     7,   164,    -1,    11,   166,   158,
     166,     7,   164,    -1,    10,   166,     7,   164,    -1,    11,
     166,     7,   164,    -1,    10,   166,    51,   164,    -1,    11,
     166,    51,   164,    -1,    36,    -1,    37,    -1,    38,    -1,
      39,    -1,    40,    -1,    41,    -1,    79,    -1,   172,    -1,
      79,    -1,   172,    -1,    -1,   162,    -1,   162,    51,   163,
      -1,   163,    -1,   165,    -1,   160,    93,   167,    94,    -1,
      71,    -1,    78,    -1,   164,    -1,   166,    -1,    79,    -1,
     171,    -1,    -1,   168,   169,    -1,   170,    -1,   169,    95,
     170,    -1,   166,    -1,   172,    -1,   173,    -1,    67,    -1,
      68,    -1,    69,    -1,    70,    -1,    75,    -1,    73,    -1,
      74,    -1,    72,    -1,    69,    -1,    72,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   244,   244,   244,   248,   250,   251,   252,   253,   254,
     257,   258,   261,   262,   265,   266,   267,   268,   271,   271,
     274,   280,   283,   288,   287,   296,   301,   305,   307,   310,
     312,   315,   322,   329,   333,   342,   342,   348,   350,   348,
     360,   361,   362,   365,   365,   369,   369,   398,   399,   402,
     403,   406,   407,   410,   414,   417,   423,   424,   427,   428,
     431,   432,   435,   436,   436,   439,   439,   455,   455,   472,
     473,   474,   477,   480,   481,   491,   494,   496,   497,   498,
     499,   500,   501,   504,   505,   508,   509,   512,   515,   518,
     520,   521,   522,   523,   523,   524,   524,   526,   526,   528,
     528,   530,   531,   532,   533,   534,   535,   536,   537,   538,
     539,   540,   541,   543,   546,   548,   549,   550,   553,   557,
     559,   560,   561,   562,   563,   564,   565,   566,   567,   568,
     569,   570,   571,   572,   573,   574,   575,   576,   577,   578,
     579,   580,   581,   582,   583,   585,   587,   589,   590,   591,
     591,   593,   594,   596,   599,   601,   603,   604,   605,   606,
     610,   612,   613,   614,   615,   616,   620,   621,   623,   624,
     627,   628,   631,   632,   635,   636,   640,   642,   644,   646,
     649,   650,   653,   653,   657,   658,   661,   664,   665,   668,
     669,   670,   671,   672,   675,   676,   677,   680,   681
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "CALL", 
  "GOTO", "ARG", "FLATTEN_ARG", "IF", "UNLESS", "NEW", "END", "SAVEALL", 
  "RESTOREALL", "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", 
  "METHOD", "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "DEFINED", 
  "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
  "RELOP_LTE", "GLOBAL", "ADDR", "CLONE", "RESULT", "RETURN", "POW", 
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", 
  "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", 
  "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", "PROTOTYPED", 
  "NON_PROTOTYPED", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", 
  "PREG", "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", "MACRO", 
  "ENDM", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "'='", "'!'", 
  "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'.'", "'&'", "'|'", "'['", 
  "']'", "';'", "$accept", "program", "@1", "compilation_unit", 
  "compilation_units", "pasmcode", "pasmline", "pasm_inst", "@2", 
  "pasm_args", "emit", "@3", "class", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "sub_body", 
  "sub_start", "@4", "pcc_sub", "@5", "@6", "pcc_params", "pcc_param", 
  "@7", "pcc_sub_call", "@8", "opt_label", "pcc_proto", "pcc_sub_proto", 
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@9", 
  "pcc_ret", "@10", "pcc_yield", "@11", "pcc_returns", "pcc_return", 
  "statements", "helper_clear_state", "statement", "labels", "_labels", 
  "label", "instruction", "labeled_inst", "@12", "@13", "@14", "@15", 
  "type", "classname", "assignment", "@16", "if_statement", "relop", 
  "target", "lhs", "vars", "_vars", "_var_or_i", "label_op", "var_or_i", 
  "var", "keylist", "@17", "_keylist", "key", "rc", "reg", "const", 
  "string", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const unsigned short yytoknum[] =
{
       0,   256,   257,   258,    10,   259,   260,   261,   262,   263,
     264,   265,   266,   267,   268,   269,   270,   271,   272,   273,
     274,   275,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,   287,   288,   289,   290,   291,   292,   293,
     294,   295,   296,   297,   298,   299,   300,   301,   302,   303,
     304,   305,   306,   307,   308,   309,   310,   311,   312,   313,
     314,   315,   316,   317,   318,   319,   320,   321,   322,   323,
     324,   325,   326,   327,   328,   329,   330,   331,   332,   333,
     334,   335,    61,    33,    45,   126,    43,    42,    47,    37,
      46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    96,    98,    97,    99,    99,    99,    99,    99,    99,
     100,   100,   101,   101,   102,   102,   102,   102,   104,   103,
     103,   103,   105,   107,   106,   108,   109,   110,   110,   111,
     111,   112,   113,   114,   115,   117,   116,   119,   120,   118,
     121,   121,   121,   123,   122,   125,   124,   126,   126,   127,
     127,   128,   128,   129,   129,   129,   130,   130,   131,   131,
     132,   132,   133,   134,   133,   136,   135,   138,   137,   139,
     139,   139,   140,   141,   141,   142,   143,   143,   143,   143,
     143,   143,   143,   144,   144,   145,   145,   146,   147,   148,
     148,   148,   148,   149,   148,   150,   148,   151,   148,   152,
     148,   148,   148,   148,   148,   148,   148,   148,   148,   148,
     148,   148,   148,   148,   153,   153,   153,   153,   154,   155,
     155,   155,   155,   155,   155,   155,   155,   155,   155,   155,
     155,   155,   155,   155,   155,   155,   155,   155,   155,   155,
     155,   155,   155,   155,   155,   155,   155,   155,   155,   156,
     155,   155,   155,   155,   157,   157,   157,   157,   157,   157,
     158,   158,   158,   158,   158,   158,   159,   159,   160,   160,
     161,   161,   162,   162,   163,   163,   164,   164,   165,   165,
     166,   166,   168,   167,   169,   169,   170,   171,   171,   172,
     172,   172,   172,   172,   173,   173,   173,   174,   174
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     1,     1,     1,     2,     1,
       1,     2,     1,     2,     3,     2,     1,     1,     0,     3,
       2,     0,     1,     0,     4,     3,     1,     1,     2,     1,
       1,     3,     2,     2,     2,     0,     4,     0,     0,     8,
       0,     1,     3,     0,     4,     0,    10,     0,     2,     1,
       1,     0,     1,     5,     3,     3,     0,     3,     2,     2,
       0,     3,     2,     0,     4,     0,     6,     0,     6,     0,
       2,     3,     2,     1,     2,     0,     2,     2,     1,     1,
       1,     1,     1,     0,     1,     2,     1,     1,     3,     1,
       1,     2,     2,     0,     4,     0,     6,     0,     6,     0,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     1,
       1,     1,     2,     0,     1,     1,     1,     1,     1,     3,
       4,     4,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     6,
       6,     6,     4,     4,     7,     4,     4,     4,     4,     0,
       3,     4,     7,     4,     6,     6,     4,     4,     4,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       0,     1,     3,     1,     1,     4,     1,     1,     1,     1,
       1,     1,     0,     2,     1,     3,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     1,     9,     0,    35,    37,    23,     0,
      10,     3,     7,     4,     5,    75,     6,     0,     0,     0,
      26,    27,    29,    30,     0,     0,    83,     8,    11,     0,
       0,     0,     0,    82,    81,    33,    78,    79,    80,    75,
      83,    73,   114,   115,   116,   118,     0,   117,    32,    25,
      28,     0,    51,    87,     0,    17,    16,    83,    12,    18,
      84,    86,    49,    50,     0,    65,    67,    77,    34,    74,
     113,    76,    31,    36,    52,     0,    15,    24,    13,     0,
       0,     0,    85,    45,    69,    69,    99,     0,     0,     0,
       0,     0,   149,   111,   109,   110,     0,     0,    93,    95,
       0,     0,    97,     0,     0,     0,     0,     0,   189,   190,
     191,   192,   196,   194,   195,   193,   170,   166,     0,    89,
      90,     0,     0,   181,   167,   188,    38,    20,    14,   170,
      56,     0,     0,     0,   101,   176,   177,   105,   106,   180,
     103,   187,     0,     0,   170,    91,    92,     0,     0,   107,
     108,     0,   166,     0,   167,   197,   198,     0,     0,   102,
     104,   180,     0,   112,   171,   173,   178,   174,   179,   187,
      88,     0,   182,    40,    19,    22,     0,    70,     0,     0,
       0,     0,     0,     0,   160,   161,   162,   163,   164,   165,
       0,     0,     0,     0,     0,   150,     0,     0,     0,     0,
       0,     0,   182,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   119,     0,     0,    41,    75,     0,     0,     0,
       0,    47,     0,    72,    66,    71,    68,   100,   156,   158,
       0,   157,   159,     0,    94,     0,     0,   151,   148,   153,
       0,   172,   142,   143,   147,   146,   145,   120,   121,   122,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   182,     0,   186,   183,
     184,    43,    39,     0,    58,    59,     0,     0,    60,     0,
      57,     0,     0,     0,     0,   182,   175,     0,   182,   130,
     131,   135,   126,   132,   133,   134,   124,   138,   123,   125,
     127,   128,   129,   136,   137,     0,     0,     0,     0,    42,
      54,     0,    55,     0,    48,   154,   155,    96,    98,     0,
     141,     0,   139,   140,   185,     0,     0,    63,     0,     0,
       0,   152,   144,    44,    53,     0,    62,    46,    61,     0,
      64
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    10,    11,    57,    58,    80,    81,   174,
      12,    26,    13,    19,    20,    21,    22,    23,    14,    35,
      15,    24,    16,    25,   173,   216,   273,   308,    36,   130,
     278,    64,    75,   221,   176,   222,   313,   330,   335,    37,
      84,    38,    85,   131,   180,    39,    40,    41,    59,    60,
      61,    71,   118,   147,   148,   151,   133,    46,    47,   119,
     144,   120,   191,   121,   162,   175,   164,   165,   166,   167,
     168,   213,   214,   269,   270,   123,   141,   125,   157
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -207
static const short yypact[] =
{
    -207,    40,    16,  -207,  -207,    -8,  -207,  -207,  -207,    13,
    -207,    16,  -207,  -207,  -207,   165,  -207,    22,   -26,   -12,
      -8,  -207,  -207,  -207,   -21,   -14,    42,  -207,  -207,   -15,
      57,    62,    67,  -207,  -207,  -207,  -207,  -207,  -207,   158,
      18,  -207,  -207,  -207,  -207,  -207,    23,  -207,  -207,  -207,
    -207,    76,   -15,  -207,    82,  -207,  -207,     9,  -207,     7,
      18,  -207,  -207,  -207,    83,  -207,  -207,  -207,  -207,  -207,
     249,  -207,  -207,  -207,  -207,    91,  -207,  -207,  -207,    38,
      99,    26,  -207,  -207,  -207,  -207,   212,   -39,   -39,   101,
     101,   101,  -207,  -207,  -207,  -207,    34,    37,  -207,  -207,
     101,   101,  -207,   161,   -28,   161,   101,   101,  -207,  -207,
    -207,  -207,  -207,  -207,  -207,  -207,   297,    19,   105,  -207,
    -207,    31,    28,  -207,    32,  -207,  -207,  -207,  -207,   297,
    -207,     6,     5,    22,  -207,  -207,  -207,  -207,  -207,  -207,
    -207,  -207,    60,   121,   297,  -207,  -207,    22,    22,  -207,
    -207,    22,  -207,    64,  -207,  -207,  -207,    44,    73,  -207,
    -207,    36,    39,  -207,    80,  -207,  -207,  -207,  -207,    41,
    -207,   266,  -207,   134,  -207,  -207,    15,  -207,   101,   135,
     136,   138,    72,   -39,  -207,  -207,  -207,  -207,  -207,  -207,
     -39,   101,   -39,   -39,   101,  -207,    78,    81,    93,   101,
     101,   101,  -207,   297,    94,   101,   -28,    95,   101,   101,
     101,   101,   313,    84,   101,  -207,     3,   101,   161,   101,
     101,    18,   147,  -207,  -207,  -207,  -207,  -207,  -207,  -207,
     160,  -207,  -207,   170,  -207,   100,   102,    61,  -207,  -207,
      87,  -207,   132,    92,  -207,  -207,  -207,  -207,  -207,  -207,
     101,   101,   101,   101,   101,   101,   101,   101,   101,   101,
     101,   101,   101,   101,   101,   101,  -207,   120,  -207,   108,
    -207,  -207,  -207,   200,  -207,  -207,    17,   201,  -207,   203,
    -207,   -39,   -39,   -43,   -43,  -207,  -207,   101,  -207,  -207,
    -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,
    -207,  -207,  -207,  -207,  -207,   118,   101,   101,    22,  -207,
    -207,   101,  -207,     4,  -207,  -207,  -207,  -207,  -207,   119,
    -207,   122,  -207,  -207,  -207,   143,   215,  -207,   161,   216,
     217,  -207,  -207,  -207,  -207,    22,  -207,  -207,  -207,   154,
    -207
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -207,  -207,  -207,   221,  -207,  -207,   176,  -207,  -207,   104,
    -207,  -207,  -207,  -207,  -207,   207,  -207,  -207,  -207,    21,
    -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,
    -207,   183,  -207,  -207,  -207,  -207,  -207,  -207,  -207,  -207,
    -207,  -207,  -207,   159,  -207,  -207,  -207,   210,   211,  -207,
     -58,  -207,  -207,  -207,  -207,  -207,  -207,  -129,    46,  -207,
    -207,  -207,   109,  -102,  -207,   137,  -207,    65,   -73,  -207,
     -64,  -197,  -207,  -207,   -40,  -207,   -70,  -206,    63
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -188
static const short yytable[] =
{
     124,   153,    82,   158,   182,   240,   122,    49,   271,   177,
     177,   -21,    17,    18,   137,   138,   134,    27,   196,   197,
       4,   310,   198,   217,   218,   140,   142,   143,   327,   112,
     113,   114,   135,   154,     5,   154,   149,   150,     6,   136,
       3,   155,   159,   160,   156,    48,   169,    62,    63,   328,
      51,   178,   178,    42,    43,    44,    29,    52,   329,   169,
      30,    65,    31,    79,   179,   181,    66,   183,   311,   305,
     219,    67,     7,    53,   169,    77,   220,   317,   318,    32,
      73,     8,    53,    33,    34,    54,    76,    83,   319,    55,
      56,   321,     9,    45,    72,   126,   184,   185,   186,   187,
     188,   189,   127,   128,   129,   145,    53,   212,   146,   170,
     228,   190,  -180,   171,   223,   199,   275,   229,    54,   231,
     232,   172,    55,    56,   201,  -187,   200,   230,   192,  -168,
     233,   203,   202,   169,  -169,   237,   238,   239,   215,   224,
     225,   243,   226,   227,   246,   247,   248,   249,   154,   234,
     268,   280,   235,   274,   285,   276,   277,   184,   185,   186,
     187,   188,   189,   279,   236,    45,   245,   281,   108,   109,
     110,   111,   193,   112,   113,   114,   115,   282,   267,   325,
     139,   286,   283,   287,   284,   288,   289,   290,   291,   292,
     293,   294,   295,   296,   297,   298,   299,   300,   301,   302,
     303,   304,   306,   307,   309,   312,   339,   314,   315,   316,
      68,    29,   322,   331,   333,    30,   332,    31,    29,   334,
     337,   338,    30,   320,    31,   340,   336,    50,   108,   109,
     110,   111,    28,    78,    32,    74,   115,   272,    33,    34,
     152,    32,   323,   268,   132,    33,    34,   326,   195,    69,
     242,    70,   194,   163,    86,    87,    88,    89,   154,    90,
      91,    92,    93,    94,    95,    96,    97,   324,   241,   244,
       0,     0,     0,    98,    99,   100,   101,   102,   204,   108,
     109,   110,   111,   103,     0,     0,     0,   115,     0,     0,
       0,   104,     0,   105,   106,   107,     0,     0,     0,     0,
     205,     0,     0,     0,     0,     0,     0,     0,   206,   207,
     208,     0,     0,     0,     0,     0,   108,   109,   110,   111,
       0,   112,   113,   114,   115,     0,     0,   116,   117,     0,
       0,     0,     0,   108,   109,   110,   111,     0,   112,   113,
     114,   115,   250,   251,     0,   139,     0,     0,   252,   209,
     210,   211,     0,     0,     0,     0,     0,     0,     0,     0,
     253,   254,   255,   256,   108,   109,   110,   111,   135,   112,
     113,   114,   115,     0,     0,   136,   161,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   257,   258,   259,
     260,   261,   262,   263,   264,   265,   266
};

static const short yycheck[] =
{
      70,   103,    60,   105,   133,   202,    70,    19,     5,     4,
       4,     4,    20,    21,    87,    88,    86,     4,   147,   148,
       4,     4,   151,     8,     9,    89,    90,    91,    24,    72,
      73,    74,    71,   103,    18,   105,   100,   101,    22,    78,
       0,    69,   106,   107,    72,    71,   116,    62,    63,    45,
      71,    46,    46,    31,    32,    33,    53,    71,    54,   129,
      57,     4,    59,    56,    58,    60,     4,     7,    51,   266,
      55,     4,    56,    64,   144,    66,    61,   283,   284,    76,
       4,    65,    64,    80,    81,    76,     4,     4,   285,    80,
      81,   288,    76,    71,    71,     4,    36,    37,    38,    39,
      40,    41,    64,     4,    78,    71,    64,   171,    71,     4,
     183,    51,    93,    82,   178,    51,   218,   190,    76,   192,
     193,    93,    80,    81,    51,    93,    82,   191,     7,    93,
     194,    51,    93,   203,    93,   199,   200,   201,     4,     4,
       4,   205,     4,    71,   208,   209,   210,   211,   218,    71,
     214,     4,    71,   217,    93,   219,   220,    36,    37,    38,
      39,    40,    41,   221,    71,    71,    71,     7,    67,    68,
      69,    70,    51,    72,    73,    74,    75,     7,    94,   308,
      79,    94,    82,    51,    82,    93,   250,   251,   252,   253,
     254,   255,   256,   257,   258,   259,   260,   261,   262,   263,
     264,   265,    82,    95,     4,     4,   335,     4,   281,   282,
      52,    53,    94,    94,    71,    57,    94,    59,    53,     4,
       4,     4,    57,   287,    59,    71,   328,    20,    67,    68,
      69,    70,    11,    57,    76,    52,    75,   216,    80,    81,
      79,    76,   306,   307,    85,    80,    81,   311,   144,    39,
     204,    40,   143,   116,     5,     6,     7,     8,   328,    10,
      11,    12,    13,    14,    15,    16,    17,   307,   203,   206,
      -1,    -1,    -1,    24,    25,    26,    27,    28,    12,    67,
      68,    69,    70,    34,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    42,    -1,    44,    45,    46,    -1,    -1,    -1,    -1,
      34,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    42,    43,
      44,    -1,    -1,    -1,    -1,    -1,    67,    68,    69,    70,
      -1,    72,    73,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    67,    68,    69,    70,    -1,    72,    73,
      74,    75,    29,    30,    -1,    79,    -1,    -1,    35,    83,
      84,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      47,    48,    49,    50,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    97,    98,     0,     4,    18,    22,    56,    65,    76,
      99,   100,   106,   108,   114,   116,   118,    20,    21,   109,
     110,   111,   112,   113,   117,   119,   107,     4,    99,    53,
      57,    59,    76,    80,    81,   115,   124,   135,   137,   141,
     142,   143,    31,    32,    33,    71,   153,   154,    71,    19,
     111,    71,    71,    64,    76,    80,    81,   101,   102,   144,
     145,   146,    62,    63,   127,     4,     4,     4,    52,   143,
     144,   147,    71,     4,   127,   128,     4,    66,   102,    56,
     103,   104,   146,     4,   136,   138,     5,     6,     7,     8,
      10,    11,    12,    13,    14,    15,    16,    17,    24,    25,
      26,    27,    28,    34,    42,    44,    45,    46,    67,    68,
      69,    70,    72,    73,    74,    75,    78,    79,   148,   155,
     157,   159,   166,   171,   172,   173,     4,    64,     4,    78,
     125,   139,   139,   152,   172,    71,    78,   164,   164,    79,
     166,   172,   166,   166,   156,    71,    71,   149,   150,   166,
     166,   151,    79,   159,   172,    69,    72,   174,   159,   166,
     166,    79,   160,   161,   162,   163,   164,   165,   166,   172,
       4,    82,    93,   120,   105,   161,   130,     4,    46,    58,
     140,    60,   153,     7,    36,    37,    38,    39,    40,    41,
      51,   158,     7,    51,   158,   105,   153,   153,   153,    51,
      82,    51,    93,    51,    12,    34,    42,    43,    44,    83,
      84,    85,   166,   167,   168,     4,   121,     8,     9,    55,
      61,   129,   131,   166,     4,     4,     4,    71,   164,   164,
     166,   164,   164,   166,    71,    71,    71,   166,   166,   166,
     167,   163,   154,   166,   174,    71,   166,   166,   166,   166,
      29,    30,    35,    47,    48,    49,    50,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,   166,   169,
     170,     5,   115,   122,   166,   159,   166,   166,   126,   146,
       4,     7,     7,    82,    82,    93,    94,    51,    93,   166,
     166,   166,   166,   166,   166,   166,   166,   166,   166,   166,
     166,   166,   166,   166,   166,   167,    82,    95,   123,     4,
       4,    51,     4,   132,     4,   164,   164,   173,   173,   167,
     166,   167,    94,   166,   170,   153,   166,    24,    45,    54,
     133,    94,    94,    71,     4,   134,   159,     4,     4,   153,
      71
};

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# if defined (__STDC__) || defined (__cplusplus)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# endif
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrlab1

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
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { 								\
      yyerror ("syntax error: cannot back up");			\
      YYERROR;							\
    }								\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)           \
  Current.first_line   = Rhs[1].first_line;      \
  Current.first_column = Rhs[1].first_column;    \
  Current.last_line    = Rhs[N].last_line;       \
  Current.last_column  = Rhs[N].last_column;
#endif

/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX	yylex (&yylval, YYLEX_PARAM)
#else
# define YYLEX	yylex (&yylval)
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
} while (0)
# define YYDSYMPRINT(Args)			\
do {						\
  if (yydebug)					\
    yysymprint Args;				\
} while (0)
/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YYDSYMPRINT(Args)
#endif /* !YYDEBUG */

/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#if YYMAXDEPTH == 0
# undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined (__GLIBC__) && defined (_STRING_H)
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
#   if defined (__STDC__) || defined (__cplusplus)
yystrlen (const char *yystr)
#   else
yystrlen (yystr)
     const char *yystr;
#   endif
{
  register const char *yys = yystr;

  while (*yys++ != '\0')
    continue;

  return yys - yystr - 1;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined (__GLIBC__) && defined (_STRING_H) && defined (_GNU_SOURCE)
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
#   if defined (__STDC__) || defined (__cplusplus)
yystpcpy (char *yydest, const char *yysrc)
#   else
yystpcpy (yydest, yysrc)
     char *yydest;
     const char *yysrc;
#   endif
{
  register char *yyd = yydest;
  register const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

#endif /* !YYERROR_VERBOSE */



#if YYDEBUG
/*-----------------------------.
| Print this symbol on YYOUT.  |
`-----------------------------*/

static void
#if defined (__STDC__) || defined (__cplusplus)
yysymprint (FILE* yyout, int yytype, YYSTYPE yyvalue)
#else
yysymprint (yyout, yytype, yyvalue)
    FILE* yyout;
    int yytype;
    YYSTYPE yyvalue;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvalue;

  if (yytype < YYNTOKENS)
    {
      YYFPRINTF (yyout, "token %s (", yytname[yytype]);
# ifdef YYPRINT
      YYPRINT (yyout, yytoknum[yytype], yyvalue);
# endif
    }
  else
    YYFPRINTF (yyout, "nterm %s (", yytname[yytype]);

  switch (yytype)
    {
      default:
        break;
    }
  YYFPRINTF (yyout, ")");
}
#endif /* YYDEBUG. */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
#if defined (__STDC__) || defined (__cplusplus)
yydestruct (int yytype, YYSTYPE yyvalue)
#else
yydestruct (yytype, yyvalue)
    int yytype;
    YYSTYPE yyvalue;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvalue;

  switch (yytype)
    {
      default:
        break;
    }
}



/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
#  define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL
# else
#  define YYPARSE_PARAM_ARG YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
# endif
#else /* !YYPARSE_PARAM */
# define YYPARSE_PARAM_ARG
# define YYPARSE_PARAM_DECL
#endif /* !YYPARSE_PARAM */

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
# ifdef YYPARSE_PARAM
int yyparse (void *);
# else
int yyparse (void);
# endif
#endif




int
yyparse (YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  /* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of parse errors so far.  */
int yynerrs;

  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
  int yychar1 = 0;

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  short	yyssa[YYINITDEPTH];
  short *yyss = yyssa;
  register short *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;



#define YYPOPSTACK   (yyvsp--, yyssp--)

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* When reducing, the number of symbols on the RHS of the reduced
     rule.  */
  int yylen;

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
     have just been pushed. so pushing a state here evens the stacks.
     */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack. Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	short *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyoverflowlab;
# else
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;

      {
	short *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyoverflowlab;
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

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with.  */

  if (yychar <= 0)		/* This means end of input.  */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more.  */

      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yychar1 = YYTRANSLATE (yychar);

      /* We have to keep this `#if YYDEBUG', since we use variables
	 which are defined only if `YYDEBUG' is set.  */
      YYDPRINTF ((stderr, "Next token is "));
      YYDSYMPRINT ((stderr, yychar1, yylval));
      YYDPRINTF ((stderr, "\n"));
    }

  /* If the proper action on seeing token YYCHAR1 is to reduce or to
     detect an error, take that action.  */
  yyn += yychar1;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yychar1)
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

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %d (%s), ",
	      yychar, yytname[yychar1]));

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;


  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  yystate = yyn;
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



#if YYDEBUG
  /* We have to keep this `#if YYDEBUG', since we use variables which
     are defined only if `YYDEBUG' is set.  */
  if (yydebug)
    {
      int yyi;

      YYFPRINTF (stderr, "Reducing via rule %d (line %d), ",
		 yyn - 1, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (yyi = yyprhs[yyn]; yyrhs[yyi] >= 0; yyi++)
	YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
      YYFPRINTF (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif
  switch (yyn)
    {
        case 2:
#line 244 "languages/imcc/imcc.y"
    { open_comp_unit(); yyval.i = 0;}
    break;

  case 3:
#line 245 "languages/imcc/imcc.y"
    { close_comp_unit(interp); yyval.i = 0; }
    break;

  case 8:
#line 253 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 9:
#line 254 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 265 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 266 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 267 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 268 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 18:
#line 271 "languages/imcc/imcc.y"
    {clear_state();}
    break;

  case 19:
#line 272 "languages/imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 20:
#line 274 "languages/imcc/imcc.y"
    {
                                          char *name = str_dup(yyvsp[0].s);
                                          yyval.i = iSUBROUTINE(
                                          mk_address(yyvsp[0].s, U_add_uniq_sub));
                                          yyval.i->r[1] =  mk_pcc_sub(name, 0);
                                        }
    break;

  case 21:
#line 280 "languages/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 23:
#line 288 "languages/imcc/imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 24:
#line 291 "languages/imcc/imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 25:
#line 298 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 317 "languages/imcc/imcc.y"
    {
           yyval.i = 0;
        }
    break;

  case 32:
#line 324 "languages/imcc/imcc.y"
    {
           yyval.i = 0;
        }
    break;

  case 34:
#line 335 "languages/imcc/imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 35:
#line 342 "languages/imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 36:
#line 344 "languages/imcc/imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 37:
#line 348 "languages/imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 38:
#line 350 "languages/imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 39:
#line 357 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 40:
#line 360 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 41:
#line 361 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 42:
#line 362 "languages/imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 43:
#line 365 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 44:
#line 366 "languages/imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 45:
#line 369 "languages/imcc/imcc.y"
    {
              char name[128];
              SymReg * r;
              Instruction *i;

              sprintf(name, "#pcc_sub_call_%d", line - 1);
              yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
              r->pcc_sub->prototyped = yyvsp[-1].t;
              /* this mid rule action has the semantic value of the
                 sub SymReg.
                 This is used below to append args & results
              */
              i = iLABEL(r);
              i->type = ITPCCSUB;
              /*
               * if we are inside a pcc_sub mark the sub as doing a
               * sub call; the sub is in r1 of the first ins
               */
              if (instructions->r[1] && instructions->r[1]->pcc_sub)
                  instructions->r[1]->pcc_sub->calls_a_sub = 1;

           }
    break;

  case 46:
#line 395 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 398 "languages/imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 48:
#line 399 "languages/imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 49:
#line 402 "languages/imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 50:
#line 403 "languages/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 51:
#line 406 "languages/imcc/imcc.y"
    { yyval.t = -1; }
    break;

  case 53:
#line 410 "languages/imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 54:
#line 414 "languages/imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 55:
#line 417 "languages/imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
                  yyvsp[-4].sr ->pcc_sub->nci = 1;
              }
    break;

  case 56:
#line 423 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 424 "languages/imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 58:
#line 427 "languages/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 59:
#line 428 "languages/imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 60:
#line 431 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 61:
#line 432 "languages/imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 62:
#line 435 "languages/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 63:
#line 436 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 64:
#line 436 "languages/imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 65:
#line 439 "languages/imcc/imcc.y"
    {
                Instruction *i, *ins = instructions;
                SymReg *r;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, sourcefile, line,
                        "pcc_return not inside pcc subroutine\n");
                sprintf(name, "#pcc_sub_ret_%d", line - 1);
                yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(r);
                i->type = ITPCCSUB | ITLABEL;
        }
    break;

  case 66:
#line 452 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 67:
#line 455 "languages/imcc/imcc.y"
    {
                Instruction *i, *ins = instructions;
                SymReg *r;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, sourcefile, line,
                        "pcc_yield not inside pcc subroutine\n");
                ins->r[1]->pcc_sub->calls_a_sub = 1;
                sprintf(name, "#pcc_sub_yield_%d", line - 1);
                yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(r);
                i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
        }
    break;

  case 68:
#line 469 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 69:
#line 472 "languages/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 70:
#line 473 "languages/imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 71:
#line 474 "languages/imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 72:
#line 477 "languages/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 75:
#line 491 "languages/imcc/imcc.y"
    { clear_state(); }
    break;

  case 76:
#line 495 "languages/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 77:
#line 496 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 78:
#line 497 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 81:
#line 500 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 82:
#line 501 "languages/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 83:
#line 504 "languages/imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 87:
#line 512 "languages/imcc/imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 88:
#line 516 "languages/imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 91:
#line 521 "languages/imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 92:
#line 522 "languages/imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 93:
#line 523 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 94:
#line 523 "languages/imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 95:
#line 524 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 96:
#line 525 "languages/imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 97:
#line 526 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 98:
#line 527 "languages/imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 99:
#line 528 "languages/imcc/imcc.y"
    { is_def=1; }
    break;

  case 100:
#line 528 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 101:
#line 530 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 102:
#line 531 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 103:
#line 532 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 104:
#line 533 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 105:
#line 534 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); }
    break;

  case 106:
#line 535 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); }
    break;

  case 107:
#line 536 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); }
    break;

  case 108:
#line 537 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); }
    break;

  case 109:
#line 538 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,0); }
    break;

  case 110:
#line 539 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,0); }
    break;

  case 111:
#line 540 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "end" ,0); }
    break;

  case 112:
#line 541 "languages/imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 113:
#line 543 "languages/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 114:
#line 547 "languages/imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 115:
#line 548 "languages/imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 116:
#line 549 "languages/imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 117:
#line 550 "languages/imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 119:
#line 558 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 120:
#line 559 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 121:
#line 560 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 122:
#line 561 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 123:
#line 562 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 124:
#line 563 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 125:
#line 564 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 126:
#line 565 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 127:
#line 566 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 128:
#line 567 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 129:
#line 568 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 130:
#line 569 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 131:
#line 570 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 132:
#line 571 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 133:
#line 572 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 134:
#line 573 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 135:
#line 574 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 136:
#line 575 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 137:
#line 576 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 138:
#line 577 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 139:
#line 578 "languages/imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 140:
#line 579 "languages/imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 141:
#line 580 "languages/imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 142:
#line 581 "languages/imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 143:
#line 582 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 144:
#line 583 "languages/imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 145:
#line 585 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr);
    }
    break;

  case 146:
#line 587 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 147:
#line 589 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 148:
#line 590 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 149:
#line 591 "languages/imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 150:
#line 592 "languages/imcc/imcc.y"
    { yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); }
    break;

  case 151:
#line 593 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 152:
#line 594 "languages/imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 153:
#line 596 "languages/imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 154:
#line 600 "languages/imcc/imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 155:
#line 601 "languages/imcc/imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 603 "languages/imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 604 "languages/imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 605 "languages/imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 606 "languages/imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 611 "languages/imcc/imcc.y"
    { yyval.s = "eq"; }
    break;

  case 161:
#line 612 "languages/imcc/imcc.y"
    { yyval.s = "ne"; }
    break;

  case 162:
#line 613 "languages/imcc/imcc.y"
    { yyval.s = "gt"; }
    break;

  case 163:
#line 614 "languages/imcc/imcc.y"
    { yyval.s = "ge"; }
    break;

  case 164:
#line 615 "languages/imcc/imcc.y"
    { yyval.s = "lt"; }
    break;

  case 165:
#line 616 "languages/imcc/imcc.y"
    { yyval.s = "le"; }
    break;

  case 170:
#line 627 "languages/imcc/imcc.y"
    { yyval.sr = NULL; }
    break;

  case 171:
#line 628 "languages/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 172:
#line 631 "languages/imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 174:
#line 635 "languages/imcc/imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 175:
#line 636 "languages/imcc/imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 176:
#line 641 "languages/imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 177:
#line 642 "languages/imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 182:
#line 653 "languages/imcc/imcc.y"
    { nkeys=0; }
    break;

  case 183:
#line 654 "languages/imcc/imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 184:
#line 657 "languages/imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 185:
#line 658 "languages/imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 189:
#line 668 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 190:
#line 669 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 191:
#line 670 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 192:
#line 671 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 193:
#line 672 "languages/imcc/imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 194:
#line 675 "languages/imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 195:
#line 676 "languages/imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 196:
#line 677 "languages/imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 197:
#line 680 "languages/imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 198:
#line 681 "languages/imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/local/share/bison/yacc.c.  */
#line 2513 "languages/imcc/imcparser.c"

  yyvsp -= yylen;
  yyssp -= yylen;


#if YYDEBUG
  if (yydebug)
    {
      short *yyssp1 = yyss - 1;
      YYFPRINTF (stderr, "state stack now");
      while (yyssp1 != yyssp)
	YYFPRINTF (stderr, " %d", *++yyssp1);
      YYFPRINTF (stderr, "\n");
    }
#endif

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
#if YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (YYPACT_NINF < yyn && yyn < YYLAST)
	{
	  YYSIZE_T yysize = 0;
	  int yytype = YYTRANSLATE (yychar);
	  char *yymsg;
	  int yyx, yycount;

	  yycount = 0;
	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  for (yyx = yyn < 0 ? -yyn : 0;
	       yyx < (int) (sizeof (yytname) / sizeof (char *)); yyx++)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      yysize += yystrlen (yytname[yyx]) + 15, yycount++;
	  yysize += yystrlen ("parse error, unexpected ") + 1;
	  yysize += yystrlen (yytname[yytype]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "parse error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[yytype]);

	      if (yycount < 5)
		{
		  yycount = 0;
		  for (yyx = yyn < 0 ? -yyn : 0;
		       yyx < (int) (sizeof (yytname) / sizeof (char *));
		       yyx++)
		    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
		      {
			const char *yyq = ! yycount ? ", expecting " : " or ";
			yyp = yystpcpy (yyp, yyq);
			yyp = yystpcpy (yyp, yytname[yyx]);
			yycount++;
		      }
		}
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror ("parse error");
    }
  goto yyerrlab1;


/*----------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action.  |
`----------------------------------------------------*/
yyerrlab1:
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      /* Return failure if at end of input.  */
      if (yychar == YYEOF)
        {
	  /* Pop the error token.  */
          YYPOPSTACK;
	  /* Pop the rest of the stack.  */
	  while (yyssp > yyss)
	    {
	      YYDPRINTF ((stderr, "Error: popping "));
	      YYDSYMPRINT ((stderr,
			    yystos[*yyssp],
			    *yyvsp));
	      YYDPRINTF ((stderr, "\n"));
	      yydestruct (yystos[*yyssp], *yyvsp);
	      YYPOPSTACK;
	    }
	  YYABORT;
        }

      YYDPRINTF ((stderr, "Discarding token %d (%s).\n",
		  yychar, yytname[yychar1]));
      yydestruct (yychar1, yylval);
      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */

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

      YYDPRINTF ((stderr, "Error: popping "));
      YYDSYMPRINT ((stderr,
		    yystos[*yyssp], *yyvsp));
      YYDPRINTF ((stderr, "\n"));

      yydestruct (yystos[yystate], *yyvsp);
      yyvsp--;
      yystate = *--yyssp;


#if YYDEBUG
      if (yydebug)
	{
	  short *yyssp1 = yyss - 1;
	  YYFPRINTF (stderr, "Error: state stack now");
	  while (yyssp1 != yyssp)
	    YYFPRINTF (stderr, " %d", *++yyssp1);
	  YYFPRINTF (stderr, "\n");
	}
#endif
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  YYDPRINTF ((stderr, "Shifting error token, "));

  *++yyvsp = yylval;


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
/*----------------------------------------------.
| yyoverflowlab -- parser overflow comes here.  |
`----------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 685 "languages/imcc/imcc.y"



int yyerror(char * s)
{
    /* fprintf(stderr, "last token = [%s]\n", yylval.s); */
    fataly(EX_UNAVAILABLE, sourcefile, line, "%s\n", s);
    return 0;
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

