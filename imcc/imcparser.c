/* A Bison parser, made from imcc/imcc.y, by GNU bison 1.75.  */

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
     NEWSUB = 267,
     NEWCLOSURE = 268,
     END = 269,
     SAVEALL = 270,
     RESTOREALL = 271,
     NAMESPACE = 272,
     ENDNAMESPACE = 273,
     CLASS = 274,
     ENDCLASS = 275,
     FIELD = 276,
     METHOD = 277,
     SUB = 278,
     SYM = 279,
     LOCAL = 280,
     CONST = 281,
     INC = 282,
     DEC = 283,
     GLOBAL_CONST = 284,
     SHIFT_LEFT = 285,
     SHIFT_RIGHT = 286,
     INTV = 287,
     FLOATV = 288,
     STRINGV = 289,
     DEFINED = 290,
     LOG_XOR = 291,
     RELOP_EQ = 292,
     RELOP_NE = 293,
     RELOP_GT = 294,
     RELOP_GTE = 295,
     RELOP_LT = 296,
     RELOP_LTE = 297,
     GLOBAL = 298,
     ADDR = 299,
     CLONE = 300,
     RESULT = 301,
     RETURN = 302,
     POW = 303,
     SHIFT_RIGHT_U = 304,
     LOG_AND = 305,
     LOG_OR = 306,
     COMMA = 307,
     ESUB = 308,
     PCC_BEGIN = 309,
     PCC_END = 310,
     PCC_CALL = 311,
     PCC_SUB = 312,
     PCC_BEGIN_RETURN = 313,
     PCC_END_RETURN = 314,
     PCC_BEGIN_YIELD = 315,
     PCC_END_YIELD = 316,
     NCI_CALL = 317,
     PROTOTYPED = 318,
     NON_PROTOTYPED = 319,
     LABEL = 320,
     EMIT = 321,
     EOM = 322,
     IREG = 323,
     NREG = 324,
     SREG = 325,
     PREG = 326,
     IDENTIFIER = 327,
     STRINGC = 328,
     INTC = 329,
     FLOATC = 330,
     REG = 331,
     MACRO = 332,
     ENDM = 333,
     PARROT_OP = 334,
     VAR = 335,
     LINECOMMENT = 336,
     FILECOMMENT = 337
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
#define NEWSUB 267
#define NEWCLOSURE 268
#define END 269
#define SAVEALL 270
#define RESTOREALL 271
#define NAMESPACE 272
#define ENDNAMESPACE 273
#define CLASS 274
#define ENDCLASS 275
#define FIELD 276
#define METHOD 277
#define SUB 278
#define SYM 279
#define LOCAL 280
#define CONST 281
#define INC 282
#define DEC 283
#define GLOBAL_CONST 284
#define SHIFT_LEFT 285
#define SHIFT_RIGHT 286
#define INTV 287
#define FLOATV 288
#define STRINGV 289
#define DEFINED 290
#define LOG_XOR 291
#define RELOP_EQ 292
#define RELOP_NE 293
#define RELOP_GT 294
#define RELOP_GTE 295
#define RELOP_LT 296
#define RELOP_LTE 297
#define GLOBAL 298
#define ADDR 299
#define CLONE 300
#define RESULT 301
#define RETURN 302
#define POW 303
#define SHIFT_RIGHT_U 304
#define LOG_AND 305
#define LOG_OR 306
#define COMMA 307
#define ESUB 308
#define PCC_BEGIN 309
#define PCC_END 310
#define PCC_CALL 311
#define PCC_SUB 312
#define PCC_BEGIN_RETURN 313
#define PCC_END_RETURN 314
#define PCC_BEGIN_YIELD 315
#define PCC_END_YIELD 316
#define NCI_CALL 317
#define PROTOTYPED 318
#define NON_PROTOTYPED 319
#define LABEL 320
#define EMIT 321
#define EOM 322
#define IREG 323
#define NREG 324
#define SREG 325
#define PREG 326
#define IDENTIFIER 327
#define STRINGC 328
#define INTC 329
#define FLOATC 330
#define REG 331
#define MACRO 332
#define ENDM 333
#define PARROT_OP 334
#define VAR 335
#define LINECOMMENT 336
#define FILECOMMENT 337




/* Copy the first part of user declarations.  */
#line 1 "imcc/imcc.y"

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
 * Symbol tables and lists
 * This won't scale to multiple namespaces, for now we just keep
 * one symbol table per compilation file.
 */
SymbolTable global_sym_tab;

/*
 * No nested classes for now.
 */
static Class * current_class;


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
#line 203 "imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 193 of /usr/local/share/bison/yacc.c.  */
#line 449 "imcc/imcparser.c"
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
#line 470 "imcc/imcparser.c"

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
#define YYLAST   363

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  98
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  81
/* YYNRULES -- Number of rules. */
#define YYNRULES  205
/* YYNRULES -- Number of states. */
#define YYNSTATES  354

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   337

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    85,     2,     2,     2,    91,    93,     2,
       2,     2,    89,    88,     2,    86,    92,    90,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    97,
       2,    84,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    95,     2,    96,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    94,     2,    87,     2,     2,     2,
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
      76,    77,    78,    79,    80,    81,    82,    83
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    11,    13,    15,    18,
      20,    22,    25,    27,    30,    34,    37,    39,    41,    42,
      46,    49,    50,    52,    53,    58,    59,    66,    68,    69,
      71,    74,    76,    78,    80,    85,    89,    92,    95,    96,
     101,   102,   103,   112,   113,   115,   119,   120,   125,   126,
     137,   138,   141,   143,   145,   146,   148,   154,   158,   162,
     163,   167,   170,   173,   174,   178,   181,   182,   187,   188,
     195,   196,   203,   204,   207,   211,   214,   216,   219,   220,
     223,   226,   228,   230,   232,   234,   236,   237,   239,   242,
     244,   246,   250,   252,   254,   257,   260,   261,   266,   267,
     274,   275,   282,   283,   288,   291,   294,   297,   300,   303,
     306,   309,   312,   314,   316,   318,   321,   322,   324,   326,
     328,   330,   332,   336,   341,   346,   351,   357,   363,   369,
     375,   381,   387,   393,   399,   405,   411,   417,   423,   429,
     435,   441,   447,   454,   461,   468,   473,   478,   483,   488,
     496,   501,   506,   511,   516,   517,   521,   522,   526,   531,
     539,   544,   551,   558,   563,   568,   573,   578,   580,   582,
     584,   586,   588,   590,   592,   594,   596,   598,   599,   601,
     605,   607,   609,   614,   616,   618,   620,   622,   624,   626,
     627,   630,   632,   636,   638,   640,   642,   644,   646,   648,
     650,   652,   654,   656,   658,   660
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      99,     0,    -1,    -1,   100,   102,    -1,   110,    -1,   117,
      -1,   121,    -1,   108,    -1,    78,     4,    -1,     4,    -1,
     101,    -1,   102,   101,    -1,   104,    -1,   103,   104,    -1,
     147,   105,     4,    -1,    78,     4,    -1,    83,    -1,    82,
      -1,    -1,   106,    80,   107,    -1,    58,    66,    -1,    -1,
     165,    -1,    -1,    67,   109,   103,    68,    -1,    -1,    20,
      73,   111,     4,   112,    21,    -1,   113,    -1,    -1,   114,
      -1,   113,   114,    -1,   115,    -1,   116,    -1,     4,    -1,
      22,   156,    73,     4,    -1,    23,    73,     4,    -1,   119,
     118,    -1,   144,    54,    -1,    -1,    24,   120,    73,     4,
      -1,    -1,    -1,    58,   122,    73,   131,     4,   123,   124,
     118,    -1,    -1,     4,    -1,   124,   125,     4,    -1,    -1,
       5,   126,   156,    73,    -1,    -1,    55,   130,     4,   128,
     133,   132,   129,   135,    56,     4,    -1,    -1,   149,     4,
      -1,    64,    -1,    65,    -1,    -1,   130,    -1,    57,   170,
      53,   170,     4,    -1,    57,   170,     4,    -1,    63,   170,
       4,    -1,    -1,   133,   134,     4,    -1,     8,   170,    -1,
       9,   163,    -1,    -1,   135,   136,     4,    -1,    47,   163,
      -1,    -1,    26,   137,   156,    73,    -1,    -1,    59,     4,
     139,   142,    60,     4,    -1,    -1,    61,     4,   141,   142,
      62,     4,    -1,    -1,   142,     4,    -1,   142,   143,     4,
      -1,    48,   170,    -1,   146,    -1,   144,   146,    -1,    -1,
     145,   150,    -1,    78,     4,    -1,   127,    -1,   138,    -1,
     140,    -1,    83,    -1,    82,    -1,    -1,   148,    -1,   148,
     149,    -1,   149,    -1,    66,    -1,   147,   151,     4,    -1,
     158,    -1,   161,    -1,    18,    73,    -1,    19,    73,    -1,
      -1,    26,   152,   156,    73,    -1,    -1,    27,   153,   156,
      73,    84,   177,    -1,    -1,    30,   154,   156,    73,    84,
     177,    -1,    -1,     5,   155,   156,    73,    -1,     5,   176,
      -1,    47,   170,    -1,     8,   170,    -1,    48,   170,    -1,
       6,   168,    -1,     7,   168,    -1,    28,   170,    -1,    29,
     170,    -1,    16,    -1,    17,    -1,    15,    -1,    80,   165,
      -1,    -1,    33,    -1,    34,    -1,    35,    -1,   157,    -1,
      73,    -1,   163,    84,   170,    -1,   163,    84,    85,   170,
      -1,   163,    84,    86,   170,    -1,   163,    84,    87,   170,
      -1,   163,    84,   170,    88,   170,    -1,   163,    84,   170,
      86,   170,    -1,   163,    84,   170,    89,   170,    -1,   163,
      84,   170,    49,   170,    -1,   163,    84,   170,    90,   170,
      -1,   163,    84,   170,    91,   170,    -1,   163,    84,   170,
      92,   170,    -1,   163,    84,   170,    31,   170,    -1,   163,
      84,   170,    32,   170,    -1,   163,    84,   170,    50,   170,
      -1,   163,    84,   170,    51,   170,    -1,   163,    84,   170,
      52,   170,    -1,   163,    84,   170,    37,   170,    -1,   163,
      84,   170,    93,   170,    -1,   163,    84,   170,    94,   170,
      -1,   163,    84,   170,    87,   170,    -1,   163,    84,   170,
      95,   171,    96,    -1,   170,    95,   171,    96,    84,   170,
      -1,   163,    84,    12,   157,    53,   170,    -1,   163,    84,
      12,   157,    -1,   163,    84,    13,    73,    -1,   163,    84,
      14,    73,    -1,   163,    84,    36,   170,    -1,   163,    84,
      36,   170,    95,   171,    96,    -1,   163,    84,    46,   170,
      -1,   163,    84,    45,    73,    -1,   163,    84,    44,   178,
      -1,    44,   178,    84,   170,    -1,    -1,    12,   159,   107,
      -1,    -1,    13,   160,   107,    -1,    36,   163,    53,   170,
      -1,    36,   163,    53,   170,    95,   171,    96,    -1,    46,
     163,    53,   170,    -1,    10,   170,   162,   170,     7,   168,
      -1,    11,   170,   162,   170,     7,   168,    -1,    10,   170,
       7,   168,    -1,    11,   170,     7,   168,    -1,    10,   170,
      53,   168,    -1,    11,   170,    53,   168,    -1,    38,    -1,
      39,    -1,    40,    -1,    41,    -1,    42,    -1,    43,    -1,
      81,    -1,   176,    -1,    81,    -1,   176,    -1,    -1,   166,
      -1,   166,    53,   167,    -1,   167,    -1,   169,    -1,   164,
      95,   171,    96,    -1,    73,    -1,    80,    -1,   168,    -1,
     170,    -1,    81,    -1,   175,    -1,    -1,   172,   173,    -1,
     174,    -1,   173,    97,   174,    -1,   170,    -1,   176,    -1,
     177,    -1,    69,    -1,    70,    -1,    71,    -1,    72,    -1,
      77,    -1,    75,    -1,    76,    -1,    74,    -1,    71,    -1,
      74,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   259,   259,   259,   263,   265,   266,   267,   268,   269,
     272,   273,   276,   277,   280,   281,   282,   283,   286,   286,
     289,   295,   298,   303,   302,   313,   311,   326,   328,   331,
     333,   336,   338,   339,   342,   356,   370,   374,   383,   383,
     389,   391,   389,   401,   402,   403,   406,   406,   410,   410,
     439,   440,   443,   444,   447,   448,   451,   455,   458,   464,
     465,   468,   469,   472,   473,   476,   477,   477,   480,   480,
     496,   496,   513,   514,   515,   518,   521,   522,   532,   535,
     537,   538,   539,   540,   541,   542,   545,   546,   549,   550,
     553,   556,   559,   561,   562,   563,   564,   564,   565,   565,
     567,   567,   569,   569,   571,   572,   573,   574,   575,   576,
     577,   578,   579,   580,   581,   582,   584,   587,   589,   590,
     591,   594,   598,   600,   601,   602,   603,   604,   605,   606,
     607,   608,   609,   610,   611,   612,   613,   614,   615,   616,
     617,   618,   619,   620,   621,   622,   623,   625,   627,   628,
     630,   632,   634,   635,   636,   636,   638,   638,   640,   641,
     643,   646,   648,   650,   651,   652,   653,   657,   659,   660,
     661,   662,   663,   667,   668,   670,   671,   674,   675,   678,
     679,   682,   683,   687,   689,   691,   693,   696,   697,   700,
     700,   704,   705,   708,   711,   712,   715,   716,   717,   718,
     719,   722,   723,   724,   727,   728
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "CALL", 
  "GOTO", "ARG", "FLATTEN_ARG", "IF", "UNLESS", "NEW", "NEWSUB", 
  "NEWCLOSURE", "END", "SAVEALL", "RESTOREALL", "NAMESPACE", 
  "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "METHOD", "SUB", "SYM", 
  "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", "SHIFT_LEFT", 
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "DEFINED", "LOG_XOR", 
  "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
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
  "pasm_args", "emit", "@3", "class", "@4", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "sub_body", 
  "sub_start", "@5", "pcc_sub", "@6", "@7", "pcc_params", "pcc_param", 
  "@8", "pcc_sub_call", "@9", "opt_label", "pcc_proto", "pcc_sub_proto", 
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@10", 
  "pcc_ret", "@11", "pcc_yield", "@12", "pcc_returns", "pcc_return", 
  "statements", "helper_clear_state", "statement", "labels", "_labels", 
  "label", "instruction", "labeled_inst", "@13", "@14", "@15", "@16", 
  "type", "classname", "assignment", "@17", "@18", "if_statement", 
  "relop", "target", "lhs", "vars", "_vars", "_var_or_i", "label_op", 
  "var_or_i", "var", "keylist", "@19", "_keylist", "key", "rc", "reg", 
  "const", "string", 0
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
     334,   335,   336,   337,    61,    33,    45,   126,    43,    42,
      47,    37,    46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    98,   100,    99,   101,   101,   101,   101,   101,   101,
     102,   102,   103,   103,   104,   104,   104,   104,   106,   105,
     105,   105,   107,   109,   108,   111,   110,   112,   112,   113,
     113,   114,   114,   114,   115,   116,   117,   118,   120,   119,
     122,   123,   121,   124,   124,   124,   126,   125,   128,   127,
     129,   129,   130,   130,   131,   131,   132,   132,   132,   133,
     133,   134,   134,   135,   135,   136,   137,   136,   139,   138,
     141,   140,   142,   142,   142,   143,   144,   144,   145,   146,
     146,   146,   146,   146,   146,   146,   147,   147,   148,   148,
     149,   150,   151,   151,   151,   151,   152,   151,   153,   151,
     154,   151,   155,   151,   151,   151,   151,   151,   151,   151,
     151,   151,   151,   151,   151,   151,   151,   156,   156,   156,
     156,   157,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   158,   158,   158,   158,   158,   158,   158,   158,   158,
     158,   158,   158,   158,   159,   158,   160,   158,   158,   158,
     158,   161,   161,   161,   161,   161,   161,   162,   162,   162,
     162,   162,   162,   163,   163,   164,   164,   165,   165,   166,
     166,   167,   167,   168,   168,   169,   169,   170,   170,   172,
     171,   173,   173,   174,   175,   175,   176,   176,   176,   176,
     176,   177,   177,   177,   178,   178
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     1,     1,     1,     2,     1,
       1,     2,     1,     2,     3,     2,     1,     1,     0,     3,
       2,     0,     1,     0,     4,     0,     6,     1,     0,     1,
       2,     1,     1,     1,     4,     3,     2,     2,     0,     4,
       0,     0,     8,     0,     1,     3,     0,     4,     0,    10,
       0,     2,     1,     1,     0,     1,     5,     3,     3,     0,
       3,     2,     2,     0,     3,     2,     0,     4,     0,     6,
       0,     6,     0,     2,     3,     2,     1,     2,     0,     2,
       2,     1,     1,     1,     1,     1,     0,     1,     2,     1,
       1,     3,     1,     1,     2,     2,     0,     4,     0,     6,
       0,     6,     0,     4,     2,     2,     2,     2,     2,     2,
       2,     2,     1,     1,     1,     2,     0,     1,     1,     1,
       1,     1,     3,     4,     4,     4,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     6,     6,     6,     4,     4,     4,     4,     7,
       4,     4,     4,     4,     0,     3,     0,     3,     4,     7,
       4,     6,     6,     4,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     0,
       2,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     1,     9,     0,    38,    40,    23,     0,
      10,     3,     7,     4,     5,    78,     6,    25,     0,     0,
      86,     8,    11,     0,     0,     0,     0,    85,    84,    36,
      81,    82,    83,    78,    86,    76,     0,     0,    54,    90,
       0,    17,    16,    86,    12,    18,    87,    89,    52,    53,
       0,    68,    70,    80,    37,    77,   116,    79,    28,    39,
      55,     0,    15,    24,    13,     0,     0,     0,    88,    48,
      72,    72,   102,     0,     0,     0,     0,     0,   154,   156,
     114,   112,   113,     0,     0,    96,    98,     0,     0,   100,
       0,     0,     0,     0,     0,   196,   197,   198,   199,   203,
     201,   202,   200,   177,   173,     0,    92,    93,     0,     0,
     188,   174,   195,    33,     0,     0,     0,    27,    29,    31,
      32,    41,    20,    14,   177,    59,     0,     0,     0,   104,
     183,   184,   108,   109,   187,   106,   194,     0,     0,   177,
     177,    94,    95,     0,     0,   110,   111,     0,   173,     0,
     174,   204,   205,     0,     0,   105,   107,   187,     0,   115,
     178,   180,   185,   181,   186,   194,    91,     0,   189,   117,
     118,   119,   121,     0,   120,     0,    26,    30,    43,    19,
      22,     0,    73,     0,     0,     0,     0,     0,     0,   167,
     168,   169,   170,   171,   172,     0,     0,     0,     0,     0,
     155,   157,     0,     0,     0,     0,     0,     0,   189,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     122,     0,     0,     0,    35,    44,    78,     0,     0,     0,
       0,    50,     0,    75,    69,    74,    71,   103,   163,   165,
       0,   164,   166,     0,    97,     0,     0,   158,   153,   160,
       0,   179,   145,   146,   147,   148,   152,   151,   150,   123,
     124,   125,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   189,     0,
     193,   190,   191,    34,    46,    42,     0,    61,    62,     0,
       0,    63,     0,    60,     0,     0,     0,     0,   189,   182,
       0,   189,   133,   134,   138,   129,   135,   136,   137,   127,
     141,   126,   128,   130,   131,   132,   139,   140,     0,     0,
       0,     0,    45,    57,     0,    58,     0,    51,   161,   162,
      99,   101,     0,   144,     0,   142,   143,   192,     0,     0,
      66,     0,     0,     0,   159,   149,    47,    56,     0,    65,
      49,    64,     0,    67
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    10,    11,    43,    44,    66,    67,   179,
      12,    20,    13,    36,   116,   117,   118,   119,   120,    14,
      29,    15,    18,    16,    19,   178,   226,   286,   321,    30,
     125,   291,    50,    61,   231,   181,   232,   326,   343,   348,
      31,    70,    32,    71,   126,   185,    33,    34,    35,    45,
      46,    47,    57,   105,   143,   144,   147,   128,   173,   174,
     106,   139,   140,   107,   196,   108,   158,   180,   160,   161,
     162,   163,   164,   221,   222,   281,   282,   110,   136,   112,
     153
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -225
static const short yypact[] =
{
    -225,    15,    31,  -225,  -225,   -42,  -225,  -225,  -225,    33,
    -225,    31,  -225,  -225,  -225,   206,  -225,  -225,   -33,   -25,
      44,  -225,  -225,   -11,    58,    61,    71,  -225,  -225,  -225,
    -225,  -225,  -225,    53,    10,  -225,    81,    83,   -11,  -225,
      84,  -225,  -225,   108,  -225,    13,    10,  -225,  -225,  -225,
      89,  -225,  -225,  -225,  -225,  -225,   230,  -225,    19,  -225,
    -225,    91,  -225,  -225,  -225,    30,    95,    20,  -225,  -225,
    -225,  -225,   246,   -48,   -48,   282,   282,   282,  -225,  -225,
    -225,  -225,  -225,    38,    40,  -225,  -225,   282,   282,  -225,
     210,   -50,   210,   282,   282,  -225,  -225,  -225,  -225,  -225,
    -225,  -225,  -225,   269,    22,   120,  -225,  -225,    41,    34,
    -225,    42,  -225,  -225,   -15,    55,    94,    19,  -225,  -225,
    -225,  -225,  -225,  -225,   269,  -225,     1,     2,   -15,  -225,
    -225,  -225,  -225,  -225,  -225,  -225,  -225,    39,    63,   269,
     269,  -225,  -225,   -15,   -15,  -225,  -225,   -15,  -225,    85,
    -225,  -225,  -225,    56,    88,  -225,  -225,    49,    50,  -225,
      93,  -225,  -225,  -225,  -225,    54,  -225,   250,  -225,  -225,
    -225,  -225,  -225,    78,  -225,   148,  -225,  -225,   150,  -225,
    -225,     3,  -225,   282,   151,   155,   161,    98,   -48,  -225,
    -225,  -225,  -225,  -225,  -225,   -48,   282,   -48,   -48,   282,
    -225,  -225,   102,   104,   106,   282,   282,   282,  -225,   269,
     109,   110,   112,   282,   -50,   115,   282,   282,   282,   282,
     111,    70,   282,   180,  -225,  -225,     8,   282,   210,   282,
     282,    10,   185,  -225,  -225,  -225,  -225,  -225,  -225,  -225,
     186,  -225,  -225,   187,  -225,   124,   125,    97,  -225,  -225,
      99,  -225,   143,  -225,  -225,   116,  -225,  -225,  -225,  -225,
    -225,  -225,   282,   282,   282,   282,   282,   282,   282,   282,
     282,   282,   282,   282,   282,   282,   282,   282,  -225,   126,
    -225,   134,  -225,  -225,  -225,  -225,   208,  -225,  -225,     6,
     228,  -225,   229,  -225,   -48,   -48,    45,    45,  -225,  -225,
     282,  -225,  -225,  -225,  -225,  -225,  -225,  -225,  -225,  -225,
    -225,  -225,  -225,  -225,  -225,  -225,  -225,  -225,   154,   282,
     282,   -15,  -225,  -225,   282,  -225,    -4,  -225,  -225,  -225,
    -225,  -225,   157,  -225,   158,  -225,  -225,  -225,   166,   240,
    -225,   210,   251,   264,  -225,  -225,  -225,  -225,   -15,  -225,
    -225,  -225,   196,  -225
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -225,  -225,  -225,   261,  -225,  -225,   247,  -225,  -225,   -83,
    -225,  -225,  -225,  -225,  -225,  -225,   156,  -225,  -225,  -225,
      57,  -225,  -225,  -225,  -225,  -225,  -225,  -225,  -225,  -225,
    -225,  -225,   254,  -225,  -225,  -225,  -225,  -225,  -225,  -225,
    -225,  -225,  -225,  -225,   222,  -225,  -225,  -225,   265,   263,
    -225,   -44,  -225,  -225,  -225,  -225,  -225,  -225,  -114,   103,
    -225,  -225,  -225,  -225,   165,   -89,  -225,   205,  -225,   100,
     -65,  -225,   -49,  -204,  -225,  -225,    -8,  -225,   -56,  -224,
     114
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -195
static const short yytable[] =
{
     111,   149,    68,   154,   250,   182,   182,   109,   132,   133,
     323,   227,   228,   284,   187,     3,   129,   -21,   169,   170,
     171,   151,   340,   113,   152,   130,   135,   137,   138,   202,
     203,    17,   131,   204,   150,     4,   150,    21,   145,   146,
      37,   114,   115,   341,   155,   156,   188,   165,    38,   183,
     183,     5,   342,    48,    49,     6,   200,   201,   172,   324,
     229,   184,    51,    23,   186,    52,   230,    24,   165,    25,
     197,    65,   330,   331,   318,    53,    39,   189,   190,   191,
     192,   193,   194,   165,   165,    58,    26,    59,    62,     7,
      27,    28,   195,    69,   332,   121,   122,   334,     8,   123,
     124,   189,   190,   191,   192,   193,   194,    54,    23,     9,
      39,   141,    24,   142,    25,   176,   198,  -187,   220,    99,
     100,   101,    40,   238,   166,   167,    41,    42,   175,   168,
     239,    26,   241,   242,   233,    27,    28,  -194,   205,   288,
     206,   207,   262,   263,  -175,   208,   209,   240,   264,  -176,
     243,   223,   224,   165,   225,   234,   247,   248,   249,   235,
     265,   266,   267,   268,   255,   236,   279,   258,   259,   260,
     261,   237,   150,   280,    39,   244,    63,   245,   287,   246,
     289,   290,   172,   253,   283,   254,    40,   292,   257,   293,
      41,    42,   298,   294,   295,   299,   300,   269,   270,   271,
     272,   273,   274,   275,   276,   277,   278,   338,   296,   297,
     319,   301,   322,   302,   303,   304,   305,   306,   307,   308,
     309,   310,   311,   312,   313,   314,   315,   316,   317,   328,
     329,   320,   325,   327,   352,    72,    73,    74,    75,   346,
      76,    77,    78,    79,   347,    80,    81,    82,    83,    84,
     335,   333,   349,   344,   345,   350,    85,    86,    87,    88,
      89,    23,   210,   211,   212,    24,    90,    25,   351,   353,
     336,   280,    22,   177,    91,   339,    92,    93,    94,    95,
      96,    97,    98,   285,    26,   150,   213,   102,    27,    28,
      64,   148,    60,   127,   214,   215,   216,    56,    55,    95,
      96,    97,    98,   199,    99,   100,   101,   102,   159,   251,
     103,   104,   337,   252,     0,    95,    96,    97,    98,    95,
      96,    97,    98,   102,    99,   100,   101,   102,   256,     0,
       0,   134,     0,     0,     0,   217,   218,   219,    95,    96,
      97,    98,   130,    99,   100,   101,   102,     0,     0,   131,
     157,    95,    96,    97,    98,     0,    99,   100,   101,   102,
       0,     0,     0,   134
};

static const short yycheck[] =
{
      56,    90,    46,    92,   208,     4,     4,    56,    73,    74,
       4,     8,     9,     5,   128,     0,    72,     4,    33,    34,
      35,    71,    26,     4,    74,    73,    75,    76,    77,   143,
     144,    73,    80,   147,    90,     4,    92,     4,    87,    88,
      73,    22,    23,    47,    93,    94,     7,   103,    73,    48,
      48,    20,    56,    64,    65,    24,   139,   140,    73,    53,
      57,    60,     4,    55,    62,     4,    63,    59,   124,    61,
       7,    58,   296,   297,   278,     4,    66,    38,    39,    40,
      41,    42,    43,   139,   140,     4,    78,     4,     4,    58,
      82,    83,    53,     4,   298,     4,    66,   301,    67,     4,
      80,    38,    39,    40,    41,    42,    43,    54,    55,    78,
      66,    73,    59,    73,    61,    21,    53,    95,   167,    74,
      75,    76,    78,   188,     4,    84,    82,    83,    73,    95,
     195,    78,   197,   198,   183,    82,    83,    95,    53,   228,
      84,    53,    31,    32,    95,    95,    53,   196,    37,    95,
     199,    73,     4,   209,     4,     4,   205,   206,   207,     4,
      49,    50,    51,    52,   213,     4,    96,   216,   217,   218,
     219,    73,   228,   222,    66,    73,    68,    73,   227,    73,
     229,   230,    73,    73,     4,    73,    78,   231,    73,     4,
      82,    83,    95,     7,     7,    96,    53,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,   321,    84,    84,
      84,    95,     4,   262,   263,   264,   265,   266,   267,   268,
     269,   270,   271,   272,   273,   274,   275,   276,   277,   294,
     295,    97,     4,     4,   348,     5,     6,     7,     8,    73,
      10,    11,    12,    13,     4,    15,    16,    17,    18,    19,
      96,   300,   341,    96,    96,     4,    26,    27,    28,    29,
      30,    55,    12,    13,    14,    59,    36,    61,     4,    73,
     319,   320,    11,   117,    44,   324,    46,    47,    48,    69,
      70,    71,    72,   226,    78,   341,    36,    77,    82,    83,
      43,    81,    38,    71,    44,    45,    46,    34,    33,    69,
      70,    71,    72,   138,    74,    75,    76,    77,   103,   209,
      80,    81,   320,   210,    -1,    69,    70,    71,    72,    69,
      70,    71,    72,    77,    74,    75,    76,    77,   214,    -1,
      -1,    81,    -1,    -1,    -1,    85,    86,    87,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    -1,    -1,    80,
      81,    69,    70,    71,    72,    -1,    74,    75,    76,    77,
      -1,    -1,    -1,    81
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    99,   100,     0,     4,    20,    24,    58,    67,    78,
     101,   102,   108,   110,   117,   119,   121,    73,   120,   122,
     109,     4,   101,    55,    59,    61,    78,    82,    83,   118,
     127,   138,   140,   144,   145,   146,   111,    73,    73,    66,
      78,    82,    83,   103,   104,   147,   148,   149,    64,    65,
     130,     4,     4,     4,    54,   146,   147,   150,     4,     4,
     130,   131,     4,    68,   104,    58,   105,   106,   149,     4,
     139,   141,     5,     6,     7,     8,    10,    11,    12,    13,
      15,    16,    17,    18,    19,    26,    27,    28,    29,    30,
      36,    44,    46,    47,    48,    69,    70,    71,    72,    74,
      75,    76,    77,    80,    81,   151,   158,   161,   163,   170,
     175,   176,   177,     4,    22,    23,   112,   113,   114,   115,
     116,     4,    66,     4,    80,   128,   142,   142,   155,   176,
      73,    80,   168,   168,    81,   170,   176,   170,   170,   159,
     160,    73,    73,   152,   153,   170,   170,   154,    81,   163,
     176,    71,    74,   178,   163,   170,   170,    81,   164,   165,
     166,   167,   168,   169,   170,   176,     4,    84,    95,    33,
      34,    35,    73,   156,   157,    73,    21,   114,   123,   107,
     165,   133,     4,    48,    60,   143,    62,   156,     7,    38,
      39,    40,    41,    42,    43,    53,   162,     7,    53,   162,
     107,   107,   156,   156,   156,    53,    84,    53,    95,    53,
      12,    13,    14,    36,    44,    45,    46,    85,    86,    87,
     170,   171,   172,    73,     4,     4,   124,     8,     9,    57,
      63,   132,   134,   170,     4,     4,     4,    73,   168,   168,
     170,   168,   168,   170,    73,    73,    73,   170,   170,   170,
     171,   167,   157,    73,    73,   170,   178,    73,   170,   170,
     170,   170,    31,    32,    37,    49,    50,    51,    52,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
     170,   173,   174,     4,     5,   118,   125,   170,   163,   170,
     170,   129,   149,     4,     7,     7,    84,    84,    95,    96,
      53,    95,   170,   170,   170,   170,   170,   170,   170,   170,
     170,   170,   170,   170,   170,   170,   170,   170,   171,    84,
      97,   126,     4,     4,    53,     4,   135,     4,   168,   168,
     177,   177,   171,   170,   171,    96,   170,   174,   156,   170,
      26,    47,    56,   136,    96,    96,    73,     4,   137,   163,
       4,     4,   156,    73
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
#line 259 "imcc/imcc.y"
    { open_comp_unit(); yyval.i = 0;}
    break;

  case 3:
#line 260 "imcc/imcc.y"
    { close_comp_unit(interp); yyval.i = 0; }
    break;

  case 8:
#line 268 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 9:
#line 269 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 280 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 281 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 282 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 283 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 18:
#line 286 "imcc/imcc.y"
    {clear_state();}
    break;

  case 19:
#line 287 "imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 20:
#line 289 "imcc/imcc.y"
    {
                                          char *name = str_dup(yyvsp[0].s);
                                          yyval.i = iSUBROUTINE(
                                          mk_address(yyvsp[0].s, U_add_uniq_sub));
                                          yyval.i->r[1] =  mk_pcc_sub(name, 0);
                                        }
    break;

  case 21:
#line 295 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 23:
#line 303 "imcc/imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 24:
#line 306 "imcc/imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 25:
#line 313 "imcc/imcc.y"
    { 
           Symbol * sym = new_symbol(yyvsp[0].s);
           current_class = new_class(sym);
           sym->p = (void*)current_class;
           store_symbol(&global_sym_tab, sym);
        }
    break;

  case 26:
#line 320 "imcc/imcc.y"
    {
           yyval.i = 0;
           current_class = NULL;
        }
    break;

  case 28:
#line 328 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 33:
#line 339 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 34:
#line 344 "imcc/imcc.y"
    {
           Symbol * sym = new_symbol(yyvsp[-1].s);
           if(lookup_field_symbol(current_class, yyvsp[-1].s)) {
              fataly(EX_SOFTWARE, sourcefile, line,
                 "field '%s' previously declared in class '%s'\n",
                    yyvsp[-1].s, current_class->sym->name);
           }
           store_field_symbol(current_class, sym);
           yyval.i = 0;
        }
    break;

  case 35:
#line 358 "imcc/imcc.y"
    {
           Symbol * sym = new_symbol(yyvsp[-1].s);
           if(lookup_method_symbol(current_class, yyvsp[-1].s)) {
              fataly(EX_SOFTWARE, sourcefile, line,
                 "method '%s' previously declared in class '%s'\n",
                    yyvsp[-1].s, current_class->sym->name);
           }
           store_method_symbol(current_class, sym);
           yyval.i = 0;
        }
    break;

  case 37:
#line 376 "imcc/imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 38:
#line 383 "imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 39:
#line 385 "imcc/imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 40:
#line 389 "imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 41:
#line 391 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 42:
#line 398 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 43:
#line 401 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 44:
#line 402 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 45:
#line 403 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 46:
#line 406 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 47:
#line 407 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 48:
#line 410 "imcc/imcc.y"
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

  case 49:
#line 436 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 439 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 51:
#line 440 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 52:
#line 443 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 53:
#line 444 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 54:
#line 447 "imcc/imcc.y"
    { yyval.t = -1; }
    break;

  case 56:
#line 451 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 57:
#line 455 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 58:
#line 458 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
                  yyvsp[-4].sr ->pcc_sub->nci = 1;
              }
    break;

  case 59:
#line 464 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 465 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 61:
#line 468 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 62:
#line 469 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 63:
#line 472 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 64:
#line 473 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 65:
#line 476 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 66:
#line 477 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 67:
#line 477 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 68:
#line 480 "imcc/imcc.y"
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

  case 69:
#line 493 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 70:
#line 496 "imcc/imcc.y"
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

  case 71:
#line 510 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 72:
#line 513 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 73:
#line 514 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 74:
#line 515 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 75:
#line 518 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 78:
#line 532 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 79:
#line 536 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 80:
#line 537 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 81:
#line 538 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 84:
#line 541 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 85:
#line 542 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 86:
#line 545 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 90:
#line 553 "imcc/imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 91:
#line 557 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 94:
#line 562 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 95:
#line 563 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 96:
#line 564 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 97:
#line 564 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 98:
#line 565 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 99:
#line 566 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 100:
#line 567 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 101:
#line 568 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 102:
#line 569 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 103:
#line 569 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 104:
#line 571 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 105:
#line 572 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 106:
#line 573 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 107:
#line 574 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 108:
#line 575 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); }
    break;

  case 109:
#line 576 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); }
    break;

  case 110:
#line 577 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); }
    break;

  case 111:
#line 578 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); }
    break;

  case 112:
#line 579 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,0); }
    break;

  case 113:
#line 580 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,0); }
    break;

  case 114:
#line 581 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "end" ,0); }
    break;

  case 115:
#line 582 "imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 116:
#line 584 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 117:
#line 588 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 118:
#line 589 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 119:
#line 590 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 120:
#line 591 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 122:
#line 599 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 123:
#line 600 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 124:
#line 601 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 125:
#line 602 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 126:
#line 603 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 127:
#line 604 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 128:
#line 605 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 129:
#line 606 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 130:
#line 607 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 131:
#line 608 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 132:
#line 609 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 133:
#line 610 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 134:
#line 611 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 135:
#line 612 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 136:
#line 613 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 137:
#line 614 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 138:
#line 615 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 139:
#line 616 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 140:
#line 617 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 141:
#line 618 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 619 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 143:
#line 620 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 144:
#line 621 "imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 145:
#line 622 "imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 146:
#line 623 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, yyvsp[-3].sr, "Sub",
                                                 mk_address(yyvsp[0].s, U_add_once), 1); }
    break;

  case 147:
#line 625 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, yyvsp[-3].sr, "Closure",
                                                 mk_address(yyvsp[0].s, U_add_once), 1); }
    break;

  case 148:
#line 627 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 149:
#line 628 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 150:
#line 630 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr);
    }
    break;

  case 151:
#line 632 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 152:
#line 634 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 153:
#line 635 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 154:
#line 636 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 155:
#line 637 "imcc/imcc.y"
    { yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); }
    break;

  case 156:
#line 638 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 157:
#line 639 "imcc/imcc.y"
    { yyval.i = INS(interp, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 158:
#line 640 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 641 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 160:
#line 643 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 647 "imcc/imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 648 "imcc/imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 650 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 651 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 652 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 653 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 658 "imcc/imcc.y"
    { yyval.s = "eq"; }
    break;

  case 168:
#line 659 "imcc/imcc.y"
    { yyval.s = "ne"; }
    break;

  case 169:
#line 660 "imcc/imcc.y"
    { yyval.s = "gt"; }
    break;

  case 170:
#line 661 "imcc/imcc.y"
    { yyval.s = "ge"; }
    break;

  case 171:
#line 662 "imcc/imcc.y"
    { yyval.s = "lt"; }
    break;

  case 172:
#line 663 "imcc/imcc.y"
    { yyval.s = "le"; }
    break;

  case 177:
#line 674 "imcc/imcc.y"
    { yyval.sr = NULL; }
    break;

  case 178:
#line 675 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 179:
#line 678 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 181:
#line 682 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 182:
#line 683 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 183:
#line 688 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 184:
#line 689 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 189:
#line 700 "imcc/imcc.y"
    { nkeys=0; }
    break;

  case 190:
#line 701 "imcc/imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 191:
#line 704 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 192:
#line 705 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 196:
#line 715 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 197:
#line 716 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 198:
#line 717 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 199:
#line 718 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 200:
#line 719 "imcc/imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 201:
#line 722 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 202:
#line 723 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 203:
#line 724 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 204:
#line 727 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 205:
#line 728 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/local/share/bison/yacc.c.  */
#line 2596 "imcc/imcparser.c"

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


#line 732 "imcc/imcc.y"



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

