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
     END = 266,
     SAVEALL = 267,
     RESTOREALL = 268,
     NEW = 269,
     NEWSUB = 270,
     NEWCLOSURE = 271,
     NEWCOR = 272,
     NEWCONT = 273,
     NAMESPACE = 274,
     ENDNAMESPACE = 275,
     CLASS = 276,
     ENDCLASS = 277,
     FIELD = 278,
     METHOD = 279,
     SUB = 280,
     SYM = 281,
     LOCAL = 282,
     CONST = 283,
     INC = 284,
     DEC = 285,
     GLOBAL_CONST = 286,
     SHIFT_LEFT = 287,
     SHIFT_RIGHT = 288,
     INTV = 289,
     FLOATV = 290,
     STRINGV = 291,
     DEFINED = 292,
     LOG_XOR = 293,
     RELOP_EQ = 294,
     RELOP_NE = 295,
     RELOP_GT = 296,
     RELOP_GTE = 297,
     RELOP_LT = 298,
     RELOP_LTE = 299,
     GLOBAL = 300,
     ADDR = 301,
     CLONE = 302,
     RESULT = 303,
     RETURN = 304,
     POW = 305,
     SHIFT_RIGHT_U = 306,
     LOG_AND = 307,
     LOG_OR = 308,
     COMMA = 309,
     ESUB = 310,
     PCC_BEGIN = 311,
     PCC_END = 312,
     PCC_CALL = 313,
     PCC_SUB = 314,
     PCC_BEGIN_RETURN = 315,
     PCC_END_RETURN = 316,
     PCC_BEGIN_YIELD = 317,
     PCC_END_YIELD = 318,
     NCI_CALL = 319,
     PROTOTYPED = 320,
     NON_PROTOTYPED = 321,
     LABEL = 322,
     EMIT = 323,
     EOM = 324,
     IREG = 325,
     NREG = 326,
     SREG = 327,
     PREG = 328,
     IDENTIFIER = 329,
     STRINGC = 330,
     INTC = 331,
     FLOATC = 332,
     REG = 333,
     MACRO = 334,
     ENDM = 335,
     PARROT_OP = 336,
     VAR = 337,
     LINECOMMENT = 338,
     FILECOMMENT = 339
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
#define END 266
#define SAVEALL 267
#define RESTOREALL 268
#define NEW 269
#define NEWSUB 270
#define NEWCLOSURE 271
#define NEWCOR 272
#define NEWCONT 273
#define NAMESPACE 274
#define ENDNAMESPACE 275
#define CLASS 276
#define ENDCLASS 277
#define FIELD 278
#define METHOD 279
#define SUB 280
#define SYM 281
#define LOCAL 282
#define CONST 283
#define INC 284
#define DEC 285
#define GLOBAL_CONST 286
#define SHIFT_LEFT 287
#define SHIFT_RIGHT 288
#define INTV 289
#define FLOATV 290
#define STRINGV 291
#define DEFINED 292
#define LOG_XOR 293
#define RELOP_EQ 294
#define RELOP_NE 295
#define RELOP_GT 296
#define RELOP_GTE 297
#define RELOP_LT 298
#define RELOP_LTE 299
#define GLOBAL 300
#define ADDR 301
#define CLONE 302
#define RESULT 303
#define RETURN 304
#define POW 305
#define SHIFT_RIGHT_U 306
#define LOG_AND 307
#define LOG_OR 308
#define COMMA 309
#define ESUB 310
#define PCC_BEGIN 311
#define PCC_END 312
#define PCC_CALL 313
#define PCC_SUB 314
#define PCC_BEGIN_RETURN 315
#define PCC_END_RETURN 316
#define PCC_BEGIN_YIELD 317
#define PCC_END_YIELD 318
#define NCI_CALL 319
#define PROTOTYPED 320
#define NON_PROTOTYPED 321
#define LABEL 322
#define EMIT 323
#define EOM 324
#define IREG 325
#define NREG 326
#define SREG 327
#define PREG 328
#define IDENTIFIER 329
#define STRINGC 330
#define INTC 331
#define FLOATC 332
#define REG 333
#define MACRO 334
#define ENDM 335
#define PARROT_OP 336
#define VAR 337
#define LINECOMMENT 338
#define FILECOMMENT 339




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
#line 453 "imcc/imcparser.c"
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
#line 474 "imcc/imcparser.c"

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
#define YYLAST   367

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  100
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  82
/* YYNRULES -- Number of rules. */
#define YYNRULES  208
/* YYNRULES -- Number of states. */
#define YYNSTATES  356

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   339

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    87,     2,     2,     2,    93,    95,     2,
       2,     2,    91,    90,     2,    88,    94,    92,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    99,
       2,    86,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    97,     2,    98,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    96,     2,    89,     2,     2,     2,
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
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85
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
     306,   309,   312,   314,   316,   318,   319,   323,   326,   327,
     329,   331,   333,   335,   337,   339,   341,   343,   345,   349,
     354,   359,   364,   370,   376,   382,   388,   394,   400,   406,
     412,   418,   424,   430,   436,   442,   448,   454,   460,   467,
     474,   481,   486,   491,   496,   504,   509,   514,   519,   524,
     525,   529,   534,   542,   547,   554,   561,   566,   571,   576,
     581,   583,   585,   587,   589,   591,   593,   595,   597,   599,
     601,   602,   604,   608,   610,   612,   617,   619,   621,   623,
     625,   627,   629,   630,   633,   635,   639,   641,   643,   645,
     647,   649,   651,   653,   655,   657,   659,   661,   663
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     101,     0,    -1,    -1,   102,   104,    -1,   112,    -1,   119,
      -1,   123,    -1,   110,    -1,    80,     4,    -1,     4,    -1,
     103,    -1,   104,   103,    -1,   106,    -1,   105,   106,    -1,
     149,   107,     4,    -1,    80,     4,    -1,    85,    -1,    84,
      -1,    -1,   108,    82,   109,    -1,    60,    68,    -1,    -1,
     168,    -1,    -1,    69,   111,   105,    70,    -1,    -1,    22,
      75,   113,     4,   114,    23,    -1,   115,    -1,    -1,   116,
      -1,   115,   116,    -1,   117,    -1,   118,    -1,     4,    -1,
      24,   160,    75,     4,    -1,    25,    75,     4,    -1,   121,
     120,    -1,   146,    56,    -1,    -1,    26,   122,    75,     4,
      -1,    -1,    -1,    60,   124,    75,   133,     4,   125,   126,
     120,    -1,    -1,     4,    -1,   126,   127,     4,    -1,    -1,
       5,   128,   160,    75,    -1,    -1,    57,   132,     4,   130,
     135,   134,   131,   137,    58,     4,    -1,    -1,   151,     4,
      -1,    66,    -1,    67,    -1,    -1,   132,    -1,    59,   173,
      55,   173,     4,    -1,    59,   173,     4,    -1,    65,   173,
       4,    -1,    -1,   135,   136,     4,    -1,     8,   173,    -1,
       9,   166,    -1,    -1,   137,   138,     4,    -1,    49,   166,
      -1,    -1,    28,   139,   160,    75,    -1,    -1,    61,     4,
     141,   144,    62,     4,    -1,    -1,    63,     4,   143,   144,
      64,     4,    -1,    -1,   144,     4,    -1,   144,   145,     4,
      -1,    50,   173,    -1,   148,    -1,   146,   148,    -1,    -1,
     147,   152,    -1,    80,     4,    -1,   129,    -1,   140,    -1,
     142,    -1,    85,    -1,    84,    -1,    -1,   150,    -1,   150,
     151,    -1,   151,    -1,    68,    -1,   149,   153,     4,    -1,
     162,    -1,   164,    -1,    20,    75,    -1,    21,    75,    -1,
      -1,    28,   154,   160,    75,    -1,    -1,    29,   155,   160,
      75,    86,   180,    -1,    -1,    32,   156,   160,    75,    86,
     180,    -1,    -1,     5,   157,   160,    75,    -1,     5,   179,
      -1,    49,   173,    -1,     8,   173,    -1,    50,   173,    -1,
       6,   171,    -1,     7,   171,    -1,    30,   173,    -1,    31,
     173,    -1,    13,    -1,    14,    -1,    12,    -1,    -1,    16,
     158,   109,    -1,    82,   168,    -1,    -1,    16,    -1,    17,
      -1,    18,    -1,    19,    -1,    35,    -1,    36,    -1,    37,
      -1,   161,    -1,    75,    -1,   166,    86,   173,    -1,   166,
      86,    87,   173,    -1,   166,    86,    88,   173,    -1,   166,
      86,    89,   173,    -1,   166,    86,   173,    90,   173,    -1,
     166,    86,   173,    88,   173,    -1,   166,    86,   173,    91,
     173,    -1,   166,    86,   173,    51,   173,    -1,   166,    86,
     173,    92,   173,    -1,   166,    86,   173,    93,   173,    -1,
     166,    86,   173,    94,   173,    -1,   166,    86,   173,    33,
     173,    -1,   166,    86,   173,    34,   173,    -1,   166,    86,
     173,    52,   173,    -1,   166,    86,   173,    53,   173,    -1,
     166,    86,   173,    54,   173,    -1,   166,    86,   173,    39,
     173,    -1,   166,    86,   173,    95,   173,    -1,   166,    86,
     173,    96,   173,    -1,   166,    86,   173,    89,   173,    -1,
     166,    86,   173,    97,   174,    98,    -1,   173,    97,   174,
      98,    86,   173,    -1,   166,    86,    15,   161,    55,   173,
      -1,   166,    86,    15,   161,    -1,   166,    86,   159,    75,
      -1,   166,    86,    38,   173,    -1,   166,    86,    38,   173,
      97,   174,    98,    -1,   166,    86,    48,   173,    -1,   166,
      86,    47,    75,    -1,   166,    86,    46,   181,    -1,    46,
     181,    86,   173,    -1,    -1,    15,   163,   109,    -1,    38,
     166,    55,   173,    -1,    38,   166,    55,   173,    97,   174,
      98,    -1,    48,   166,    55,   173,    -1,    10,   173,   165,
     173,     7,   171,    -1,    11,   173,   165,   173,     7,   171,
      -1,    10,   173,     7,   171,    -1,    11,   173,     7,   171,
      -1,    10,   173,    55,   171,    -1,    11,   173,    55,   171,
      -1,    40,    -1,    41,    -1,    42,    -1,    43,    -1,    44,
      -1,    45,    -1,    83,    -1,   179,    -1,    83,    -1,   179,
      -1,    -1,   169,    -1,   169,    55,   170,    -1,   170,    -1,
     172,    -1,   167,    97,   174,    98,    -1,    75,    -1,    82,
      -1,   171,    -1,   173,    -1,    83,    -1,   178,    -1,    -1,
     175,   176,    -1,   177,    -1,   176,    99,   177,    -1,   173,
      -1,   179,    -1,   180,    -1,    71,    -1,    72,    -1,    73,
      -1,    74,    -1,    79,    -1,    77,    -1,    78,    -1,    76,
      -1,    73,    -1,    76,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   260,   260,   260,   264,   266,   267,   268,   269,   270,
     273,   274,   277,   278,   281,   282,   283,   284,   287,   287,
     290,   296,   299,   304,   303,   314,   312,   327,   329,   332,
     334,   337,   339,   340,   343,   357,   371,   375,   384,   384,
     390,   392,   390,   402,   403,   404,   407,   407,   411,   411,
     440,   441,   444,   445,   448,   449,   452,   456,   459,   465,
     466,   469,   470,   473,   474,   477,   478,   478,   481,   481,
     497,   497,   514,   515,   516,   519,   522,   523,   533,   536,
     538,   539,   540,   541,   542,   543,   546,   547,   550,   551,
     554,   557,   561,   563,   564,   565,   566,   566,   567,   567,
     569,   569,   571,   571,   573,   574,   575,   576,   577,   578,
     579,   580,   581,   582,   583,   584,   584,   586,   588,   591,
     593,   594,   595,   598,   600,   601,   602,   605,   609,   611,
     612,   613,   614,   615,   616,   617,   618,   619,   620,   621,
     622,   623,   624,   625,   626,   627,   628,   629,   630,   631,
     632,   633,   634,   636,   637,   639,   640,   642,   643,   646,
     646,   648,   649,   651,   654,   656,   658,   659,   660,   661,
     665,   667,   668,   669,   670,   671,   675,   676,   678,   679,
     682,   683,   686,   687,   690,   691,   695,   697,   699,   701,
     704,   705,   708,   708,   712,   713,   716,   719,   720,   723,
     724,   725,   726,   727,   730,   731,   732,   735,   736
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "CALL", 
  "GOTO", "ARG", "FLATTEN_ARG", "IF", "UNLESS", "END", "SAVEALL", 
  "RESTOREALL", "NEW", "NEWSUB", "NEWCLOSURE", "NEWCOR", "NEWCONT", 
  "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "METHOD", 
  "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
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
  "pasm_args", "emit", "@3", "class", "@4", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "sub_body", 
  "sub_start", "@5", "pcc_sub", "@6", "@7", "pcc_params", "pcc_param", 
  "@8", "pcc_sub_call", "@9", "opt_label", "pcc_proto", "pcc_sub_proto", 
  "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@10", 
  "pcc_ret", "@11", "pcc_yield", "@12", "pcc_returns", "pcc_return", 
  "statements", "helper_clear_state", "statement", "labels", "_labels", 
  "label", "instruction", "labeled_inst", "@13", "@14", "@15", "@16", 
  "@17", "newsub", "type", "classname", "assignment", "@18", 
  "if_statement", "relop", "target", "lhs", "vars", "_vars", "_var_or_i", 
  "label_op", "var_or_i", "var", "keylist", "@19", "_keylist", "key", 
  "rc", "reg", "const", "string", 0
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
     334,   335,   336,   337,   338,   339,    61,    33,    45,   126,
      43,    42,    47,    37,    46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   100,   102,   101,   103,   103,   103,   103,   103,   103,
     104,   104,   105,   105,   106,   106,   106,   106,   108,   107,
     107,   107,   109,   111,   110,   113,   112,   114,   114,   115,
     115,   116,   116,   116,   117,   118,   119,   120,   122,   121,
     124,   125,   123,   126,   126,   126,   128,   127,   130,   129,
     131,   131,   132,   132,   133,   133,   134,   134,   134,   135,
     135,   136,   136,   137,   137,   138,   139,   138,   141,   140,
     143,   142,   144,   144,   144,   145,   146,   146,   147,   148,
     148,   148,   148,   148,   148,   148,   149,   149,   150,   150,
     151,   152,   153,   153,   153,   153,   154,   153,   155,   153,
     156,   153,   157,   153,   153,   153,   153,   153,   153,   153,
     153,   153,   153,   153,   153,   158,   153,   153,   153,   159,
     159,   159,   159,   160,   160,   160,   160,   161,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   162,   162,   163,
     162,   162,   162,   162,   164,   164,   164,   164,   164,   164,
     165,   165,   165,   165,   165,   165,   166,   166,   167,   167,
     168,   168,   169,   169,   170,   170,   171,   171,   172,   172,
     173,   173,   175,   174,   176,   176,   177,   178,   178,   179,
     179,   179,   179,   179,   180,   180,   180,   181,   181
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
       2,     2,     1,     1,     1,     0,     3,     2,     0,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     4,
       4,     4,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     6,     6,
       6,     4,     4,     4,     7,     4,     4,     4,     4,     0,
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
       2,     0,     0,     1,     9,     0,    38,    40,    23,     0,
      10,     3,     7,     4,     5,    78,     6,    25,     0,     0,
      86,     8,    11,     0,     0,     0,     0,    85,    84,    36,
      81,    82,    83,    78,    86,    76,     0,     0,    54,    90,
       0,    17,    16,    86,    12,    18,    87,    89,    52,    53,
       0,    68,    70,    80,    37,    77,   118,    79,    28,    39,
      55,     0,    15,    24,    13,     0,     0,     0,    88,    48,
      72,    72,   102,     0,     0,     0,     0,     0,   114,   112,
     113,   159,   115,     0,     0,    96,    98,     0,     0,   100,
       0,     0,     0,     0,     0,   199,   200,   201,   202,   206,
     204,   205,   203,   180,   176,     0,    92,    93,     0,     0,
     191,   177,   198,    33,     0,     0,     0,    27,    29,    31,
      32,    41,    20,    14,   180,    59,     0,     0,     0,   104,
     186,   187,   108,   109,   190,   106,   197,     0,     0,   180,
     180,    94,    95,     0,     0,   110,   111,     0,   176,     0,
     177,   207,   208,     0,     0,   105,   107,   190,     0,   117,
     181,   183,   188,   184,   189,   197,    91,     0,   192,   123,
     124,   125,   127,     0,   126,     0,    26,    30,    43,    19,
      22,     0,    73,     0,     0,     0,     0,     0,     0,   170,
     171,   172,   173,   174,   175,     0,     0,     0,     0,     0,
     160,   116,     0,     0,     0,     0,     0,     0,   192,     0,
       0,   119,   120,   121,   122,     0,     0,     0,     0,     0,
       0,     0,     0,   128,     0,     0,     0,    35,    44,    78,
       0,     0,     0,     0,    50,     0,    75,    69,    74,    71,
     103,   166,   168,     0,   167,   169,     0,    97,     0,     0,
     161,   158,   163,     0,   182,   151,   153,   157,   156,   155,
     129,   130,   131,   152,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     192,     0,   196,   193,   194,    34,    46,    42,     0,    61,
      62,     0,     0,    63,     0,    60,     0,     0,     0,     0,
     192,   185,     0,   192,   139,   140,   144,   135,   141,   142,
     143,   133,   147,   132,   134,   136,   137,   138,   145,   146,
       0,     0,     0,     0,    45,    57,     0,    58,     0,    51,
     164,   165,    99,   101,     0,   150,     0,   148,   149,   195,
       0,     0,    66,     0,     0,     0,   162,   154,    47,    56,
       0,    65,    49,    64,     0,    67
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    10,    11,    43,    44,    66,    67,   179,
      12,    20,    13,    36,   116,   117,   118,   119,   120,    14,
      29,    15,    18,    16,    19,   178,   229,   288,   323,    30,
     125,   293,    50,    61,   234,   181,   235,   328,   345,   350,
      31,    70,    32,    71,   126,   185,    33,    34,    35,    45,
      46,    47,    57,   105,   143,   144,   147,   128,   140,   222,
     173,   174,   106,   139,   107,   196,   108,   158,   180,   160,
     161,   162,   163,   164,   224,   225,   283,   284,   110,   136,
     112,   153
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -257
static const short yypact[] =
{
    -257,    37,     9,  -257,  -257,   -43,  -257,  -257,  -257,    61,
    -257,     9,  -257,  -257,  -257,    64,  -257,  -257,   -27,    12,
     112,  -257,  -257,   -48,    75,    78,    84,  -257,  -257,  -257,
    -257,  -257,  -257,    44,    22,  -257,    91,    94,   -48,  -257,
      98,  -257,  -257,   109,  -257,     7,    22,  -257,  -257,  -257,
     100,  -257,  -257,  -257,  -257,  -257,   236,  -257,   161,  -257,
    -257,   102,  -257,  -257,  -257,    51,   116,    40,  -257,  -257,
    -257,  -257,   166,   -70,   -70,   256,   256,   256,  -257,  -257,
    -257,  -257,  -257,    56,    60,  -257,  -257,   256,   256,  -257,
     -22,     4,   -22,   256,   256,  -257,  -257,  -257,  -257,  -257,
    -257,  -257,  -257,   128,    46,   141,  -257,  -257,    66,    49,
    -257,    57,  -257,  -257,   -15,    80,   144,   161,  -257,  -257,
    -257,  -257,  -257,  -257,   128,  -257,    13,     6,   -15,  -257,
    -257,  -257,  -257,  -257,  -257,  -257,  -257,    96,   119,   128,
     128,  -257,  -257,   -15,   -15,  -257,  -257,   -15,  -257,   113,
    -257,  -257,  -257,    87,   123,  -257,  -257,    85,    90,  -257,
     133,  -257,  -257,  -257,  -257,   101,  -257,   278,  -257,  -257,
    -257,  -257,  -257,   120,  -257,   187,  -257,  -257,   204,  -257,
    -257,    32,  -257,   256,   208,   209,   210,   158,   -70,  -257,
    -257,  -257,  -257,  -257,  -257,   -70,   256,   -70,   -70,   256,
    -257,  -257,   159,   160,   180,   256,   256,   256,  -257,   128,
     183,  -257,  -257,  -257,  -257,   256,     4,   184,   256,   256,
     256,   256,   185,    20,   163,   256,   258,  -257,  -257,     1,
     256,   -22,   256,   256,    22,   259,  -257,  -257,  -257,  -257,
    -257,  -257,  -257,   262,  -257,  -257,   263,  -257,   189,   190,
     174,  -257,  -257,   181,  -257,   223,   186,  -257,  -257,  -257,
    -257,  -257,  -257,  -257,   256,   256,   256,   256,   256,   256,
     256,   256,   256,   256,   256,   256,   256,   256,   256,   256,
    -257,   194,  -257,   182,  -257,  -257,  -257,  -257,   284,  -257,
    -257,    11,   285,  -257,   286,  -257,   -70,   -70,    16,    16,
    -257,  -257,   256,  -257,  -257,  -257,  -257,  -257,  -257,  -257,
    -257,  -257,  -257,  -257,  -257,  -257,  -257,  -257,  -257,  -257,
     193,   256,   256,   -15,  -257,  -257,   256,  -257,    -3,  -257,
    -257,  -257,  -257,  -257,   200,  -257,   201,  -257,  -257,  -257,
     217,   296,  -257,   -22,   297,   298,  -257,  -257,  -257,  -257,
     -15,  -257,  -257,  -257,   228,  -257
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -257,  -257,  -257,   293,  -257,  -257,   268,  -257,  -257,  -116,
    -257,  -257,  -257,  -257,  -257,  -257,   188,  -257,  -257,  -257,
      77,  -257,  -257,  -257,  -257,  -257,  -257,  -257,  -257,  -257,
    -257,  -257,   279,  -257,  -257,  -257,  -257,  -257,  -257,  -257,
    -257,  -257,  -257,  -257,   249,  -257,  -257,  -257,   288,   289,
    -257,   -44,  -257,  -257,  -257,  -257,  -257,  -257,  -257,  -257,
    -114,   121,  -257,  -257,  -257,   198,   -89,  -257,   219,  -257,
     129,   -65,  -257,   -49,  -204,  -257,  -257,    15,  -257,   -56,
    -256,   124
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -198
static const short yytable[] =
{
     111,   149,    68,   154,   253,   130,   286,   109,   132,   133,
     182,   -21,   131,     4,   187,   325,   129,   182,    48,    49,
     169,   170,   171,   200,   201,   342,   135,   137,   138,   202,
     203,     5,    17,   204,   150,     6,   150,     3,   145,   146,
     230,   231,   332,   333,   155,   156,   343,   165,    37,    95,
      96,    97,    98,   264,   265,   344,   183,   102,    23,   266,
     172,   148,    24,   183,    25,    21,   326,    65,   165,     7,
     186,   267,   268,   269,   270,   184,   320,   151,     8,    51,
     152,    26,    52,   165,   165,    27,    28,    38,    53,     9,
      39,   232,    99,   100,   101,    58,   334,   233,    59,   336,
      54,    23,    62,   188,    69,    24,   121,    25,   271,   272,
     273,   274,   275,   276,   277,   278,   279,   280,   223,   122,
     123,    23,   124,   241,    26,    24,   197,    25,    27,    28,
     242,   141,   244,   245,   236,   142,   189,   190,   191,   192,
     193,   194,   290,  -190,    26,   166,   168,   243,    27,    28,
     246,   195,   167,   165,  -197,   175,   250,   251,   252,   189,
     190,   191,   192,   193,   194,   113,   256,   176,   205,   259,
     260,   261,   262,   206,   198,   150,   282,    39,   207,    63,
      39,   289,  -178,   291,   292,   114,   115,   208,   209,    40,
     294,   227,    40,    41,    42,   226,    41,    42,  -179,    95,
      96,    97,    98,   130,    99,   100,   101,   102,   228,   340,
     131,   157,   237,   238,   239,   304,   305,   306,   307,   308,
     309,   310,   311,   312,   313,   314,   315,   316,   317,   318,
     319,   330,   331,   240,   247,   248,   354,    95,    96,    97,
      98,    72,    73,    74,    75,   102,    76,    77,    78,    79,
      80,    81,    82,   335,   351,   249,    83,    84,   172,   258,
     263,   281,   285,   295,    85,    86,    87,    88,    89,   296,
     297,   300,   338,   282,    90,   298,   299,   341,   302,   301,
     321,   322,    91,   303,    92,    93,    94,   150,   324,   327,
     329,   337,   348,   210,   211,   212,   213,   214,   346,   347,
     349,   352,   353,   355,    22,   177,   287,    95,    96,    97,
      98,    64,    99,   100,   101,   102,   215,    60,   103,   104,
     127,    55,   159,    56,   216,   217,   218,    95,    96,    97,
      98,   255,    99,   100,   101,   102,   199,   339,   254,   134,
     257,     0,     0,     0,     0,     0,     0,     0,     0,    95,
      96,    97,    98,     0,    99,   100,   101,   102,     0,     0,
       0,   134,     0,     0,     0,   219,   220,   221
};

static const short yycheck[] =
{
      56,    90,    46,    92,   208,    75,     5,    56,    73,    74,
       4,     4,    82,     4,   128,     4,    72,     4,    66,    67,
      35,    36,    37,   139,   140,    28,    75,    76,    77,   143,
     144,    22,    75,   147,    90,    26,    92,     0,    87,    88,
       8,     9,   298,   299,    93,    94,    49,   103,    75,    71,
      72,    73,    74,    33,    34,    58,    50,    79,    57,    39,
      75,    83,    61,    50,    63,     4,    55,    60,   124,    60,
      64,    51,    52,    53,    54,    62,   280,    73,    69,     4,
      76,    80,     4,   139,   140,    84,    85,    75,     4,    80,
      68,    59,    76,    77,    78,     4,   300,    65,     4,   303,
      56,    57,     4,     7,     4,    61,     4,    63,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,   167,    68,
       4,    57,    82,   188,    80,    61,     7,    63,    84,    85,
     195,    75,   197,   198,   183,    75,    40,    41,    42,    43,
      44,    45,   231,    97,    80,     4,    97,   196,    84,    85,
     199,    55,    86,   209,    97,    75,   205,   206,   207,    40,
      41,    42,    43,    44,    45,     4,   215,    23,    55,   218,
     219,   220,   221,    86,    55,   231,   225,    68,    55,    70,
      68,   230,    97,   232,   233,    24,    25,    97,    55,    80,
     234,     4,    80,    84,    85,    75,    84,    85,    97,    71,
      72,    73,    74,    75,    76,    77,    78,    79,     4,   323,
      82,    83,     4,     4,     4,   264,   265,   266,   267,   268,
     269,   270,   271,   272,   273,   274,   275,   276,   277,   278,
     279,   296,   297,    75,    75,    75,   350,    71,    72,    73,
      74,     5,     6,     7,     8,    79,    10,    11,    12,    13,
      14,    15,    16,   302,   343,    75,    20,    21,    75,    75,
      75,    98,     4,     4,    28,    29,    30,    31,    32,     7,
       7,    97,   321,   322,    38,    86,    86,   326,    55,    98,
      86,    99,    46,    97,    48,    49,    50,   343,     4,     4,
       4,    98,    75,    15,    16,    17,    18,    19,    98,    98,
       4,     4,     4,    75,    11,   117,   229,    71,    72,    73,
      74,    43,    76,    77,    78,    79,    38,    38,    82,    83,
      71,    33,   103,    34,    46,    47,    48,    71,    72,    73,
      74,   210,    76,    77,    78,    79,   138,   322,   209,    83,
     216,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    -1,    76,    77,    78,    79,    -1,    -1,
      -1,    83,    -1,    -1,    -1,    87,    88,    89
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,   101,   102,     0,     4,    22,    26,    60,    69,    80,
     103,   104,   110,   112,   119,   121,   123,    75,   122,   124,
     111,     4,   103,    57,    61,    63,    80,    84,    85,   120,
     129,   140,   142,   146,   147,   148,   113,    75,    75,    68,
      80,    84,    85,   105,   106,   149,   150,   151,    66,    67,
     132,     4,     4,     4,    56,   148,   149,   152,     4,     4,
     132,   133,     4,    70,   106,    60,   107,   108,   151,     4,
     141,   143,     5,     6,     7,     8,    10,    11,    12,    13,
      14,    15,    16,    20,    21,    28,    29,    30,    31,    32,
      38,    46,    48,    49,    50,    71,    72,    73,    74,    76,
      77,    78,    79,    82,    83,   153,   162,   164,   166,   173,
     178,   179,   180,     4,    24,    25,   114,   115,   116,   117,
     118,     4,    68,     4,    82,   130,   144,   144,   157,   179,
      75,    82,   171,   171,    83,   173,   179,   173,   173,   163,
     158,    75,    75,   154,   155,   173,   173,   156,    83,   166,
     179,    73,    76,   181,   166,   173,   173,    83,   167,   168,
     169,   170,   171,   172,   173,   179,     4,    86,    97,    35,
      36,    37,    75,   160,   161,    75,    23,   116,   125,   109,
     168,   135,     4,    50,    62,   145,    64,   160,     7,    40,
      41,    42,    43,    44,    45,    55,   165,     7,    55,   165,
     109,   109,   160,   160,   160,    55,    86,    55,    97,    55,
      15,    16,    17,    18,    19,    38,    46,    47,    48,    87,
      88,    89,   159,   173,   174,   175,    75,     4,     4,   126,
       8,     9,    59,    65,   134,   136,   173,     4,     4,     4,
      75,   171,   171,   173,   171,   171,   173,    75,    75,    75,
     173,   173,   173,   174,   170,   161,   173,   181,    75,   173,
     173,   173,   173,    75,    33,    34,    39,    51,    52,    53,
      54,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,   173,   176,   177,     4,     5,   120,   127,   173,
     166,   173,   173,   131,   151,     4,     7,     7,    86,    86,
      97,    98,    55,    97,   173,   173,   173,   173,   173,   173,
     173,   173,   173,   173,   173,   173,   173,   173,   173,   173,
     174,    86,    99,   128,     4,     4,    55,     4,   137,     4,
     171,   171,   180,   180,   174,   173,   174,    98,   173,   177,
     160,   173,    28,    49,    58,   138,    98,    98,    75,     4,
     139,   166,     4,     4,   160,    75
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
#line 260 "imcc/imcc.y"
    { open_comp_unit(); yyval.i = 0;}
    break;

  case 3:
#line 261 "imcc/imcc.y"
    { close_comp_unit(interp); yyval.i = 0; }
    break;

  case 8:
#line 269 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 9:
#line 270 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 281 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 282 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 283 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 284 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 18:
#line 287 "imcc/imcc.y"
    {clear_state();}
    break;

  case 19:
#line 288 "imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                                          free(yyvsp[-1].s); }
    break;

  case 20:
#line 290 "imcc/imcc.y"
    {
                                          char *name = str_dup(yyvsp[0].s);
                                          yyval.i = iSUBROUTINE(
                                          mk_address(yyvsp[0].s, U_add_uniq_sub));
                                          yyval.i->r[1] =  mk_pcc_sub(name, 0);
                                        }
    break;

  case 21:
#line 296 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 23:
#line 304 "imcc/imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 24:
#line 307 "imcc/imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                imc_compile_unit(interp, instructions);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 25:
#line 314 "imcc/imcc.y"
    { 
           Symbol * sym = new_symbol(yyvsp[0].s);
           current_class = new_class(sym);
           sym->p = (void*)current_class;
           store_symbol(&global_sym_tab, sym);
        }
    break;

  case 26:
#line 321 "imcc/imcc.y"
    {
           yyval.i = 0;
           current_class = NULL;
        }
    break;

  case 28:
#line 329 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 33:
#line 340 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 34:
#line 345 "imcc/imcc.y"
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
#line 359 "imcc/imcc.y"
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
#line 377 "imcc/imcc.y"
    {
          yyval.i = 0;
	  imc_compile_unit(interp, instructions);
	  emit_flush(interp);
        }
    break;

  case 38:
#line 384 "imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 39:
#line 386 "imcc/imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 40:
#line 390 "imcc/imcc.y"
    { open_comp_unit(); }
    break;

  case 41:
#line 392 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 42:
#line 399 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 43:
#line 402 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 44:
#line 403 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 45:
#line 404 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 46:
#line 407 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 47:
#line 408 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 48:
#line 411 "imcc/imcc.y"
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
#line 437 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 440 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 51:
#line 441 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 52:
#line 444 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 53:
#line 445 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 54:
#line 448 "imcc/imcc.y"
    { yyval.t = -1; }
    break;

  case 56:
#line 452 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 57:
#line 456 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 58:
#line 459 "imcc/imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
                  yyvsp[-4].sr ->pcc_sub->nci = 1;
              }
    break;

  case 59:
#line 465 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 466 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 61:
#line 469 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 62:
#line 470 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 63:
#line 473 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 64:
#line 474 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 65:
#line 477 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 66:
#line 478 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 67:
#line 478 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 68:
#line 481 "imcc/imcc.y"
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
#line 494 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 70:
#line 497 "imcc/imcc.y"
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
#line 511 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 72:
#line 514 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 73:
#line 515 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 74:
#line 516 "imcc/imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 75:
#line 519 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 78:
#line 533 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 79:
#line 537 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 80:
#line 538 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 81:
#line 539 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 84:
#line 542 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 85:
#line 543 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 86:
#line 546 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 90:
#line 554 "imcc/imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 91:
#line 558 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 94:
#line 564 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 95:
#line 565 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 96:
#line 566 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 97:
#line 566 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 98:
#line 567 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 99:
#line 568 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 100:
#line 569 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 101:
#line 570 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 102:
#line 571 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 103:
#line 571 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 104:
#line 573 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 105:
#line 574 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restore", 1, yyvsp[0].sr); }
    break;

  case 106:
#line 575 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 107:
#line 576 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "save", 1, yyvsp[0].sr); }
    break;

  case 108:
#line 577 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bsr",  1, yyvsp[0].sr); }
    break;

  case 109:
#line 578 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "branch",1, yyvsp[0].sr); }
    break;

  case 110:
#line 579 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "inc",1, yyvsp[0].sr); }
    break;

  case 111:
#line 580 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "dec",1, yyvsp[0].sr); }
    break;

  case 112:
#line 581 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,0); }
    break;

  case 113:
#line 582 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,0); }
    break;

  case 114:
#line 583 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "end" ,0); }
    break;

  case 115:
#line 584 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 116:
#line 585 "imcc/imcc.y"
    { yyval.i = INS(interp, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 117:
#line 586 "imcc/imcc.y"
    { yyval.i = INS(interp, yyvsp[-1].s,0,regs,nargs,keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 118:
#line 588 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 119:
#line 592 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 120:
#line 593 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 121:
#line 594 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 122:
#line 595 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 123:
#line 599 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 124:
#line 600 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 125:
#line 601 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 126:
#line 602 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 128:
#line 610 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 129:
#line 611 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 130:
#line 612 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 131:
#line 613 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 132:
#line 614 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 133:
#line 615 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 134:
#line 616 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 135:
#line 617 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 136:
#line 618 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 137:
#line 619 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 138:
#line 620 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 139:
#line 621 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 140:
#line 622 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 141:
#line 623 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 624 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 143:
#line 625 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 144:
#line 626 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 145:
#line 627 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 146:
#line 628 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 147:
#line 629 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 630 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 149:
#line 631 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 150:
#line 632 "imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 151:
#line 633 "imcc/imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 152:
#line 634 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, yyvsp[-3].sr, yyvsp[-1].t,
                                                 mk_address(yyvsp[0].s, U_add_once), 1); }
    break;

  case 153:
#line 636 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 154:
#line 637 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 155:
#line 639 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 640 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          2, yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once)); }
    break;

  case 157:
#line 642 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "find_global",2, yyvsp[-3].sr,yyvsp[0].sr); }
    break;

  case 158:
#line 643 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 159:
#line 646 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 160:
#line 647 "imcc/imcc.y"
    { yyval.i = INS(interp, "new",0,regs,nargs,keyvec,1); }
    break;

  case 161:
#line 648 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 649 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                                  yyval.i = MK_I(interp, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 163:
#line 651 "imcc/imcc.y"
    { yyval.i = MK_I(interp, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 655 "imcc/imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 656 "imcc/imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 658 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 659 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 660 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 661 "imcc/imcc.y"
    {yyval.i= MK_I(interp, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 666 "imcc/imcc.y"
    { yyval.s = "eq"; }
    break;

  case 171:
#line 667 "imcc/imcc.y"
    { yyval.s = "ne"; }
    break;

  case 172:
#line 668 "imcc/imcc.y"
    { yyval.s = "gt"; }
    break;

  case 173:
#line 669 "imcc/imcc.y"
    { yyval.s = "ge"; }
    break;

  case 174:
#line 670 "imcc/imcc.y"
    { yyval.s = "lt"; }
    break;

  case 175:
#line 671 "imcc/imcc.y"
    { yyval.s = "le"; }
    break;

  case 180:
#line 682 "imcc/imcc.y"
    { yyval.sr = NULL; }
    break;

  case 181:
#line 683 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 182:
#line 686 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 184:
#line 690 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 185:
#line 691 "imcc/imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 186:
#line 696 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 187:
#line 697 "imcc/imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 192:
#line 708 "imcc/imcc.y"
    { nkeys=0; }
    break;

  case 193:
#line 709 "imcc/imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 194:
#line 712 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 195:
#line 713 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 199:
#line 723 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 200:
#line 724 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 201:
#line 725 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 202:
#line 726 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 203:
#line 727 "imcc/imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 204:
#line 730 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 205:
#line 731 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 206:
#line 732 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 207:
#line 735 "imcc/imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 208:
#line 736 "imcc/imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/local/share/bison/yacc.c.  */
#line 2613 "imcc/imcparser.c"

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


#line 740 "imcc/imcc.y"



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

