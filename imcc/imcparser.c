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
     PRAGMA = 260,
     CALL = 261,
     GOTO = 262,
     ARG = 263,
     FLATTEN_ARG = 264,
     IF = 265,
     UNLESS = 266,
     END = 267,
     SAVEALL = 268,
     RESTOREALL = 269,
     NEW = 270,
     NEWSUB = 271,
     NEWCLOSURE = 272,
     NEWCOR = 273,
     NEWCONT = 274,
     NAMESPACE = 275,
     ENDNAMESPACE = 276,
     CLASS = 277,
     ENDCLASS = 278,
     FIELD = 279,
     METHOD = 280,
     SUB = 281,
     SYM = 282,
     LOCAL = 283,
     CONST = 284,
     INC = 285,
     DEC = 286,
     GLOBAL_CONST = 287,
     SHIFT_LEFT = 288,
     SHIFT_RIGHT = 289,
     INTV = 290,
     FLOATV = 291,
     STRINGV = 292,
     PMCV = 293,
     OBJECTV = 294,
     DEFINED = 295,
     LOG_XOR = 296,
     RELOP_EQ = 297,
     RELOP_NE = 298,
     RELOP_GT = 299,
     RELOP_GTE = 300,
     RELOP_LT = 301,
     RELOP_LTE = 302,
     GLOBAL = 303,
     GLOBALOP = 304,
     ADDR = 305,
     CLONE = 306,
     RESULT = 307,
     RETURN = 308,
     POW = 309,
     SHIFT_RIGHT_U = 310,
     LOG_AND = 311,
     LOG_OR = 312,
     COMMA = 313,
     ESUB = 314,
     PCC_BEGIN = 315,
     PCC_END = 316,
     PCC_CALL = 317,
     PCC_SUB = 318,
     PCC_BEGIN_RETURN = 319,
     PCC_END_RETURN = 320,
     PCC_BEGIN_YIELD = 321,
     PCC_END_YIELD = 322,
     NCI_CALL = 323,
     PROTOTYPED = 324,
     NON_PROTOTYPED = 325,
     LABEL = 326,
     EMIT = 327,
     EOM = 328,
     IREG = 329,
     NREG = 330,
     SREG = 331,
     PREG = 332,
     IDENTIFIER = 333,
     STRINGC = 334,
     INTC = 335,
     FLOATC = 336,
     REG = 337,
     MACRO = 338,
     ENDM = 339,
     PARROT_OP = 340,
     VAR = 341,
     LINECOMMENT = 342,
     FILECOMMENT = 343
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define CALL 261
#define GOTO 262
#define ARG 263
#define FLATTEN_ARG 264
#define IF 265
#define UNLESS 266
#define END 267
#define SAVEALL 268
#define RESTOREALL 269
#define NEW 270
#define NEWSUB 271
#define NEWCLOSURE 272
#define NEWCOR 273
#define NEWCONT 274
#define NAMESPACE 275
#define ENDNAMESPACE 276
#define CLASS 277
#define ENDCLASS 278
#define FIELD 279
#define METHOD 280
#define SUB 281
#define SYM 282
#define LOCAL 283
#define CONST 284
#define INC 285
#define DEC 286
#define GLOBAL_CONST 287
#define SHIFT_LEFT 288
#define SHIFT_RIGHT 289
#define INTV 290
#define FLOATV 291
#define STRINGV 292
#define PMCV 293
#define OBJECTV 294
#define DEFINED 295
#define LOG_XOR 296
#define RELOP_EQ 297
#define RELOP_NE 298
#define RELOP_GT 299
#define RELOP_GTE 300
#define RELOP_LT 301
#define RELOP_LTE 302
#define GLOBAL 303
#define GLOBALOP 304
#define ADDR 305
#define CLONE 306
#define RESULT 307
#define RETURN 308
#define POW 309
#define SHIFT_RIGHT_U 310
#define LOG_AND 311
#define LOG_OR 312
#define COMMA 313
#define ESUB 314
#define PCC_BEGIN 315
#define PCC_END 316
#define PCC_CALL 317
#define PCC_SUB 318
#define PCC_BEGIN_RETURN 319
#define PCC_END_RETURN 320
#define PCC_BEGIN_YIELD 321
#define PCC_END_YIELD 322
#define NCI_CALL 323
#define PROTOTYPED 324
#define NON_PROTOTYPED 325
#define LABEL 326
#define EMIT 327
#define EOM 328
#define IREG 329
#define NREG 330
#define SREG 331
#define PREG 332
#define IDENTIFIER 333
#define STRINGC 334
#define INTC 335
#define FLOATC 336
#define REG 337
#define MACRO 338
#define ENDM 339
#define PARROT_OP 340
#define VAR 341
#define LINECOMMENT 342
#define FILECOMMENT 343




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
static Instruction * current_call;
IMC_Unit * cur_unit;

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
MK_I(struct Parrot_Interp *interpreter, IMC_Unit * unit, const char * fmt, int n, ...)
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
    return INS(interpreter, unit, opname, fmt, r, n, keyvec, 1);
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

Instruction * INS_LABEL(IMC_Unit * unit, SymReg * r0, int emit)
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
        emitb(unit, ins);
    return ins;
}

static Instruction * iLABEL(IMC_Unit * unit, SymReg * r0) {
    Instruction *i = INS_LABEL(unit, r0, 1);
    i->line = line;
    clear_state();
    return i;
}

static Instruction * iSUBROUTINE(IMC_Unit * unit, SymReg * r0) {
    Instruction *i;
    function = r0->name;
    i =  iLABEL(unit, r0);
    i->line = line - 1;
    return i;
}

/*
 * substr or X = Pkey
 */
static Instruction *
iINDEXFETCH(struct Parrot_Interp *interp, IMC_Unit * unit, SymReg * r0, SymReg * r1,
    SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        return MK_I(interp, unit, "substr %s, %s, %s, 1", 4, r0, r1, r2, r3);
    }
    keyvec |= KEY_BIT(2);
    return MK_I(interp, unit, "set %s, %s[%s]", 3, r0,r1,r2);
}

/*
 * substr or Pkey = X
 */

static Instruction *
iINDEXSET(struct Parrot_Interp *interp, IMC_Unit * unit,
          SymReg * r0, SymReg * r1, SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        MK_I(interp, unit, "substr %s, %s, %s, %s", 4, r0, r1,r3, r2);
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I(interp, unit, "set %s[%s], %s", 3, r0,r1,r2);
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
#line 197 "imcc/imcc.y"
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
#line 455 "imcc/imcparser.c"
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
#line 476 "imcc/imcparser.c"

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
#define YYFINAL  32
#define YYLAST   455

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  106
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  92
/* YYNRULES -- Number of rules. */
#define YYNRULES  233
/* YYNRULES -- Number of states. */
#define YYNSTATES  406

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   343

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    91,     2,     2,     2,    97,    99,     2,
     103,   104,    95,    94,     2,    92,    98,    96,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   105,
       2,    90,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   101,     2,   102,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   100,     2,    93,     2,     2,     2,
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
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    31,    37,    38,    45,    47,    50,
      54,    57,    59,    61,    62,    66,    69,    70,    72,    73,
      78,    79,    86,    88,    89,    91,    94,    96,    98,   100,
     105,   110,   111,   112,   121,   122,   124,   128,   129,   134,
     137,   138,   139,   148,   149,   151,   155,   156,   161,   162,
     173,   174,   177,   179,   181,   182,   184,   190,   194,   198,
     199,   203,   206,   209,   210,   214,   217,   218,   223,   224,
     231,   232,   239,   240,   243,   247,   250,   252,   255,   256,
     259,   262,   264,   266,   268,   270,   272,   274,   275,   277,
     280,   282,   284,   288,   290,   292,   295,   298,   299,   304,
     305,   312,   313,   320,   321,   326,   329,   332,   335,   338,
     341,   344,   347,   350,   352,   354,   356,   357,   361,   364,
     365,   367,   369,   371,   373,   375,   377,   379,   381,   383,
     385,   387,   391,   396,   401,   406,   412,   418,   424,   430,
     436,   442,   448,   454,   460,   466,   472,   478,   484,   490,
     496,   502,   509,   516,   523,   528,   533,   540,   545,   553,
     558,   563,   568,   573,   574,   578,   583,   591,   596,   600,
     601,   611,   612,   618,   619,   623,   625,   627,   630,   634,
     636,   643,   650,   655,   660,   665,   670,   672,   674,   676,
     678,   680,   682,   684,   686,   688,   690,   691,   693,   697,
     699,   701,   706,   708,   710,   712,   714,   716,   718,   720,
     721,   724,   726,   730,   732,   734,   736,   738,   740,   742,
     744,   746,   748,   750
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     107,     0,    -1,   108,    -1,   109,    -1,   108,   109,    -1,
     120,    -1,   111,    -1,   110,    -1,   127,    -1,   134,    -1,
     118,    -1,    84,     4,    -1,     4,    -1,    49,   171,    79,
      -1,    49,   171,    79,    90,   196,    -1,    -1,    30,   112,
     171,    79,    90,   196,    -1,   114,    -1,   113,   114,    -1,
     160,   115,     4,    -1,    84,     4,    -1,    89,    -1,    88,
      -1,    -1,   116,    86,   117,    -1,    64,    72,    -1,    -1,
     185,    -1,    -1,    73,   119,   113,    74,    -1,    -1,    23,
      79,   121,     4,   122,    24,    -1,   123,    -1,    -1,   124,
      -1,   123,   124,    -1,   125,    -1,   126,    -1,     4,    -1,
      25,   171,    79,     4,    -1,    26,    79,    79,     4,    -1,
      -1,    -1,    27,   128,    79,   144,     4,   129,   130,   133,
      -1,    -1,     4,    -1,   130,   131,     4,    -1,    -1,     5,
     132,   171,    79,    -1,   157,    60,    -1,    -1,    -1,    64,
     135,    79,   144,     4,   136,   137,   133,    -1,    -1,     4,
      -1,   137,   138,     4,    -1,    -1,     5,   139,   171,    79,
      -1,    -1,    61,   143,     4,   141,   146,   145,   142,   148,
      62,     4,    -1,    -1,   162,     4,    -1,    70,    -1,    71,
      -1,    -1,   143,    -1,    63,   190,    59,   190,     4,    -1,
      63,   190,     4,    -1,    69,   190,     4,    -1,    -1,   146,
     147,     4,    -1,     9,   190,    -1,    10,   183,    -1,    -1,
     148,   149,     4,    -1,    53,   183,    -1,    -1,    29,   150,
     171,    79,    -1,    -1,    65,     4,   152,   155,    66,     4,
      -1,    -1,    67,     4,   154,   155,    68,     4,    -1,    -1,
     155,     4,    -1,   155,   156,     4,    -1,    54,   190,    -1,
     159,    -1,   157,   159,    -1,    -1,   158,   163,    -1,    84,
       4,    -1,   176,    -1,   140,    -1,   151,    -1,   153,    -1,
      89,    -1,    88,    -1,    -1,   161,    -1,   161,   162,    -1,
     162,    -1,    72,    -1,   160,   164,     4,    -1,   173,    -1,
     181,    -1,    21,    79,    -1,    22,    79,    -1,    -1,    29,
     165,   171,    79,    -1,    -1,    30,   166,   171,    79,    90,
     196,    -1,    -1,    33,   167,   171,    79,    90,   196,    -1,
      -1,     5,   168,   171,    79,    -1,     5,   195,    -1,    53,
     190,    -1,     9,   190,    -1,    54,   190,    -1,     7,   188,
      -1,     8,   188,    -1,    31,   190,    -1,    32,   190,    -1,
      14,    -1,    15,    -1,    13,    -1,    -1,    17,   169,   117,
      -1,    86,   185,    -1,    -1,    17,    -1,    18,    -1,    19,
      -1,    20,    -1,    36,    -1,    37,    -1,    38,    -1,    39,
      -1,    40,    -1,   172,    -1,    79,    -1,   183,    90,   190,
      -1,   183,    90,    91,   190,    -1,   183,    90,    92,   190,
      -1,   183,    90,    93,   190,    -1,   183,    90,   190,    94,
     190,    -1,   183,    90,   190,    92,   190,    -1,   183,    90,
     190,    95,   190,    -1,   183,    90,   190,    55,   190,    -1,
     183,    90,   190,    96,   190,    -1,   183,    90,   190,    97,
     190,    -1,   183,    90,   190,    98,   190,    -1,   183,    90,
     190,    34,   190,    -1,   183,    90,   190,    35,   190,    -1,
     183,    90,   190,    56,   190,    -1,   183,    90,   190,    57,
     190,    -1,   183,    90,   190,    58,   190,    -1,   183,    90,
     190,    42,   190,    -1,   183,    90,   190,    99,   190,    -1,
     183,    90,   190,   100,   190,    -1,   183,    90,   190,    93,
     190,    -1,   183,    90,   190,   101,   191,   102,    -1,   190,
     101,   191,   102,    90,   190,    -1,   183,    90,    16,   172,
      59,   190,    -1,   183,    90,    16,   172,    -1,   183,    90,
     170,    79,    -1,   183,    90,   170,    79,    59,    79,    -1,
     183,    90,    41,   190,    -1,   183,    90,    41,   190,   101,
     191,   102,    -1,   183,    90,    52,   190,    -1,   183,    90,
      51,    79,    -1,   183,    90,    50,   197,    -1,    50,   197,
      90,   190,    -1,    -1,    16,   174,   117,    -1,    41,   183,
      59,   190,    -1,    41,   183,    59,   190,   101,   191,   102,
      -1,    52,   183,    59,   190,    -1,   183,    90,   176,    -1,
      -1,   175,   103,   180,   104,    90,    79,   103,   178,   104,
      -1,    -1,    79,   177,   103,   178,   104,    -1,    -1,   178,
      59,   179,    -1,   179,    -1,   190,    -1,    10,   183,    -1,
     180,    59,   183,    -1,   183,    -1,    11,   190,   182,   190,
       8,   188,    -1,    12,   190,   182,   190,     8,   188,    -1,
      11,   190,     8,   188,    -1,    12,   190,     8,   188,    -1,
      11,   190,    59,   188,    -1,    12,   190,    59,   188,    -1,
      43,    -1,    44,    -1,    45,    -1,    46,    -1,    47,    -1,
      48,    -1,    87,    -1,   195,    -1,    87,    -1,   195,    -1,
      -1,   186,    -1,   186,    59,   187,    -1,   187,    -1,   189,
      -1,   184,   101,   191,   102,    -1,    79,    -1,    86,    -1,
     188,    -1,   190,    -1,    87,    -1,   195,    -1,   196,    -1,
      -1,   192,   193,    -1,   194,    -1,   193,   105,   194,    -1,
     190,    -1,    75,    -1,    76,    -1,    77,    -1,    78,    -1,
      83,    -1,    81,    -1,    82,    -1,    80,    -1,    77,    -1,
      80,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   261,   261,   265,   267,   270,   272,   273,   274,   275,
     276,   277,   278,   281,   287,   295,   294,   299,   301,   304,
     306,   307,   308,   311,   311,   315,   319,   322,   327,   326,
     340,   338,   354,   356,   359,   361,   364,   366,   367,   370,
     384,   402,   407,   400,   417,   419,   420,   424,   423,   428,
     433,   435,   432,   445,   447,   448,   452,   451,   458,   456,
     486,   488,   491,   493,   496,   498,   501,   507,   509,   516,
     518,   521,   523,   526,   528,   531,   534,   534,   540,   538,
     560,   558,   579,   581,   583,   587,   591,   593,   604,   608,
     611,   612,   613,   614,   615,   616,   617,   620,   622,   625,
     627,   630,   637,   642,   644,   645,   646,   647,   647,   648,
     648,   650,   650,   652,   652,   654,   655,   656,   657,   658,
     659,   660,   661,   662,   663,   664,   665,   665,   668,   671,
     674,   676,   677,   678,   681,   683,   684,   685,   686,   687,
     690,   699,   701,   702,   703,   704,   705,   706,   707,   708,
     709,   710,   711,   713,   715,   717,   719,   721,   723,   725,
     727,   729,   731,   733,   735,   737,   740,   747,   749,   752,
     754,   757,   759,   764,   763,   767,   769,   772,   775,   782,
     781,   805,   803,   823,   825,   826,   829,   832,   836,   838,
     841,   844,   846,   848,   850,   852,   856,   858,   859,   860,
     861,   862,   865,   867,   870,   872,   875,   877,   880,   882,
     885,   887,   895,   897,   900,   902,   905,   907,   908,   911,
     911,   915,   917,   921,   925,   927,   928,   929,   930,   933,
     935,   936,   939,   941
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "CALL", "GOTO", "ARG", "FLATTEN_ARG", "IF", "UNLESS", "END", "SAVEALL", 
  "RESTOREALL", "NEW", "NEWSUB", "NEWCLOSURE", "NEWCOR", "NEWCONT", 
  "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "METHOD", 
  "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", 
  "OBJECTV", "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", 
  "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", 
  "CLONE", "RESULT", "RETURN", "POW", "SHIFT_RIGHT_U", "LOG_AND", 
  "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", "PCC_END", "PCC_CALL", 
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "PROTOTYPED", "NON_PROTOTYPED", "LABEL", 
  "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "STRINGC", 
  "INTC", "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "'='", "'!'", "'-'", "'~'", "'+'", "'*'", 
  "'/'", "'%'", "'.'", "'&'", "'|'", "'['", "']'", "'('", "')'", "';'", 
  "$accept", "program", "compilation_units", "compilation_unit", "global", 
  "constdef", "@1", "pasmcode", "pasmline", "pasm_inst", "@2", 
  "pasm_args", "emit", "@3", "class", "@4", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "@5", "@6", 
  "sub_params", "sub_param", "@7", "sub_body", "pcc_sub", "@8", "@9", 
  "pcc_params", "pcc_param", "@10", "pcc_sub_call", "@11", "opt_label", 
  "pcc_proto", "pcc_sub_proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@12", "pcc_ret", "@13", "pcc_yield", 
  "@14", "pcc_returns", "pcc_return", "statements", "helper_clear_state", 
  "statement", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@15", "@16", "@17", "@18", "@19", "newsub", "type", 
  "classname", "assignment", "@20", "@21", "sub_call", "@22", "arglist", 
  "arg", "targetlist", "if_statement", "relop", "target", "lhs", "vars", 
  "_vars", "_var_or_i", "label_op", "var_or_i", "var", "keylist", "@23", 
  "_keylist", "key", "reg", "const", "string", 0
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
     334,   335,   336,   337,   338,   339,   340,   341,   342,   343,
      61,    33,    45,   126,    43,    42,    47,    37,    46,    38,
     124,    91,    93,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   106,   107,   108,   108,   109,   109,   109,   109,   109,
     109,   109,   109,   110,   110,   112,   111,   113,   113,   114,
     114,   114,   114,   116,   115,   115,   115,   117,   119,   118,
     121,   120,   122,   122,   123,   123,   124,   124,   124,   125,
     126,   128,   129,   127,   130,   130,   130,   132,   131,   133,
     135,   136,   134,   137,   137,   137,   139,   138,   141,   140,
     142,   142,   143,   143,   144,   144,   145,   145,   145,   146,
     146,   147,   147,   148,   148,   149,   150,   149,   152,   151,
     154,   153,   155,   155,   155,   156,   157,   157,   158,   159,
     159,   159,   159,   159,   159,   159,   159,   160,   160,   161,
     161,   162,   163,   164,   164,   164,   164,   165,   164,   166,
     164,   167,   164,   168,   164,   164,   164,   164,   164,   164,
     164,   164,   164,   164,   164,   164,   169,   164,   164,   164,
     170,   170,   170,   170,   171,   171,   171,   171,   171,   171,
     172,   173,   173,   173,   173,   173,   173,   173,   173,   173,
     173,   173,   173,   173,   173,   173,   173,   173,   173,   173,
     173,   173,   173,   173,   173,   173,   173,   173,   173,   173,
     173,   173,   173,   174,   173,   173,   173,   173,   173,   175,
     173,   177,   176,   178,   178,   178,   179,   179,   180,   180,
     181,   181,   181,   181,   181,   181,   182,   182,   182,   182,
     182,   182,   183,   183,   184,   184,   185,   185,   186,   186,
     187,   187,   188,   188,   189,   189,   190,   190,   190,   192,
     191,   193,   193,   194,   195,   195,   195,   195,   195,   196,
     196,   196,   197,   197
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     3,     5,     0,     6,     1,     2,     3,
       2,     1,     1,     0,     3,     2,     0,     1,     0,     4,
       0,     6,     1,     0,     1,     2,     1,     1,     1,     4,
       4,     0,     0,     8,     0,     1,     3,     0,     4,     2,
       0,     0,     8,     0,     1,     3,     0,     4,     0,    10,
       0,     2,     1,     1,     0,     1,     5,     3,     3,     0,
       3,     2,     2,     0,     3,     2,     0,     4,     0,     6,
       0,     6,     0,     2,     3,     2,     1,     2,     0,     2,
       2,     1,     1,     1,     1,     1,     1,     0,     1,     2,
       1,     1,     3,     1,     1,     2,     2,     0,     4,     0,
       6,     0,     6,     0,     4,     2,     2,     2,     2,     2,
       2,     2,     2,     1,     1,     1,     0,     3,     2,     0,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     4,     4,     4,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     6,     6,     6,     4,     4,     6,     4,     7,     4,
       4,     4,     4,     0,     3,     4,     7,     4,     3,     0,
       9,     0,     5,     0,     3,     1,     1,     2,     3,     1,
       6,     6,     4,     4,     4,     4,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     0,     1,     3,     1,
       1,     4,     1,     1,     1,     1,     1,     1,     1,     0,
       2,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,    12,     0,    41,    15,     0,    50,    28,     0,     0,
       2,     3,     7,     6,    10,     5,     8,     9,    30,     0,
       0,   134,   135,   136,   137,   138,   140,     0,   139,     0,
      97,    11,     1,     4,     0,    64,     0,    13,    64,   101,
       0,    22,    21,    97,    17,    23,    98,   100,    33,    62,
      63,    65,     0,     0,     0,     0,    20,    29,    18,     0,
       0,     0,    99,    38,     0,     0,     0,    32,    34,    36,
      37,    42,     0,   231,   229,   230,    14,    51,    25,    19,
     206,     0,     0,    31,    35,    44,    16,    53,   224,   225,
     226,   227,   212,   228,   213,   216,    24,     0,    27,   207,
     209,   214,   210,   215,   217,   218,     0,     0,    45,    88,
      54,    88,   219,     0,    39,    40,    47,     0,     0,     0,
     181,     0,    96,    95,     0,    43,    92,    93,    94,    88,
      97,    86,    91,    56,    52,     0,     0,     0,   208,     0,
       0,    78,    80,     0,    90,    46,    49,    87,   129,    89,
       0,    55,   211,   216,   223,   220,   221,   217,     0,    58,
      82,    82,   183,   113,     0,     0,     0,     0,     0,   125,
     123,   124,   173,   126,     0,     0,   107,   109,     0,     0,
     111,     0,     0,     0,     0,     0,   206,   202,     0,   103,
       0,   104,     0,     0,   203,     0,     0,    48,    69,     0,
       0,     0,     0,   185,   186,     0,   115,   119,   120,   117,
       0,     0,   206,   206,   105,   106,     0,     0,   121,   122,
       0,   202,     0,   203,   232,   233,     0,     0,   116,   118,
     128,   102,     0,     0,   219,    57,   222,     0,    83,     0,
       0,     0,     0,   187,     0,   182,     0,     0,   196,   197,
     198,   199,   200,   201,     0,     0,     0,     0,     0,   174,
     127,     0,     0,     0,     0,     0,     0,     0,   189,     0,
     130,   131,   132,   133,     0,     0,     0,     0,     0,     0,
       0,     0,   178,   141,     0,     0,     0,     0,     0,    60,
       0,    85,    79,    84,    81,   184,   114,   192,   194,     0,
     193,   195,     0,   108,     0,     0,   175,   172,   177,     0,
       0,   164,   167,   171,   170,   169,   142,   143,   144,   165,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   219,     0,    71,    72,
       0,     0,    73,     0,    70,     0,     0,     0,     0,   219,
     188,     0,     0,   219,     0,   152,   153,   157,   148,   154,
     155,   156,   146,   160,   145,   147,   149,   150,   151,   158,
     159,     0,     0,    67,     0,    68,     0,    61,   190,   191,
     110,   112,     0,     0,   163,     0,   166,   161,   162,     0,
      76,     0,     0,     0,   176,   183,   168,    66,     0,    75,
      59,    74,     0,     0,   180,    77
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     9,    10,    11,    12,    13,    20,    43,    44,    60,
      61,    96,    14,    30,    15,    34,    66,    67,    68,    69,
      70,    16,    19,    85,   109,   124,   139,   125,    17,    29,
      87,   111,   135,   150,   126,   198,   342,    51,    52,   289,
     237,   290,   376,   393,   398,   127,   160,   128,   161,   199,
     241,   129,   130,   131,    45,    46,    47,   149,   188,   216,
     217,   220,   205,   213,   281,    27,    28,   189,   212,   190,
     132,   143,   202,   203,   267,   191,   255,   192,    97,    98,
      99,   100,   101,   102,   103,   136,   137,   155,   156,   157,
     105,   226
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -227
static const short yypact[] =
{
       1,  -227,   -70,  -227,  -227,   196,  -227,  -227,    15,    68,
       1,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,     3,
     196,  -227,  -227,  -227,  -227,  -227,  -227,     8,  -227,    18,
     -62,  -227,  -227,  -227,    75,   -38,    30,    -7,   -38,  -227,
      82,  -227,  -227,    29,  -227,     0,    28,  -227,    26,  -227,
    -227,  -227,   101,    22,    34,   104,  -227,  -227,  -227,    39,
     116,    35,  -227,  -227,   196,    45,   105,    26,  -227,  -227,
    -227,  -227,    34,  -227,  -227,  -227,  -227,  -227,  -227,  -227,
     349,    49,    53,  -227,  -227,   131,  -227,   134,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,    38,  -227,    41,  -227,    81,
    -227,  -227,  -227,  -227,    43,  -227,   141,   142,  -227,    76,
    -227,   263,  -227,   349,  -227,  -227,  -227,   -38,   144,   147,
    -227,   148,  -227,  -227,   155,  -227,  -227,  -227,  -227,   334,
      28,  -227,  -227,  -227,  -227,   157,    60,   202,  -227,   196,
     159,  -227,  -227,    64,  -227,  -227,  -227,  -227,   240,  -227,
     196,  -227,  -227,  -227,  -227,    63,  -227,  -227,    99,  -227,
    -227,  -227,   304,    98,   -37,   -37,   202,   202,   202,  -227,
    -227,  -227,  -227,  -227,   103,   107,  -227,  -227,   202,   202,
    -227,   -40,   -24,   -40,   202,   202,   349,    83,   179,  -227,
      92,  -227,   108,   100,   102,   120,   202,  -227,  -227,    12,
       7,   -40,   -47,  -227,  -227,   196,  -227,  -227,  -227,  -227,
      47,   146,   349,   349,  -227,  -227,   196,   196,  -227,  -227,
     196,  -227,   143,  -227,  -227,  -227,   114,   149,  -227,  -227,
    -227,  -227,   -40,   284,  -227,  -227,  -227,     4,  -227,   202,
     205,   206,   207,  -227,   304,  -227,   127,   -37,  -227,  -227,
    -227,  -227,  -227,  -227,   -37,   202,   -37,   -37,   202,  -227,
    -227,   150,   158,   160,   202,   202,   202,   -42,  -227,   161,
    -227,  -227,  -227,  -227,   202,   -24,   162,   202,   202,   202,
     202,   163,  -227,   354,   126,   202,   -40,   202,   202,    28,
     234,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,   235,
    -227,  -227,   242,  -227,   168,   169,   164,  -227,  -227,   -40,
     170,   204,   166,  -227,  -227,  -227,  -227,  -227,  -227,   215,
     202,   202,   202,   202,   202,   202,   202,   202,   202,   202,
     202,   202,   202,   202,   202,   202,  -227,   186,  -227,  -227,
      21,   282,  -227,   287,  -227,   -37,   -37,    34,    34,  -227,
    -227,   209,   202,  -227,   218,  -227,  -227,  -227,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,
    -227,   197,   202,  -227,   202,  -227,   -14,  -227,  -227,  -227,
    -227,  -227,   203,   195,  -227,   208,  -227,  -227,  -227,   302,
    -227,   -40,   303,   305,  -227,   304,  -227,  -227,   196,  -227,
    -227,  -227,   -41,   229,  -227,  -227
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -227,  -227,  -227,   301,  -227,  -227,  -227,  -227,   270,  -227,
    -227,  -167,  -227,  -227,  -227,  -227,  -227,  -227,   252,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,  -227,   220,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,  -227,   212,   294,  -227,
    -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,  -227,   172,
    -227,  -227,  -227,   210,   211,  -227,   -43,  -227,  -227,  -227,
    -227,  -227,  -227,  -227,  -227,   -20,    69,  -227,  -227,  -227,
     111,  -227,   -58,    96,  -227,  -227,   135,  -160,  -227,   167,
    -227,   232,  -158,  -227,  -108,  -226,  -227,  -227,   152,   -79,
     -52,    74
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -218
static const short yytable[] =
{
      36,   104,    76,    62,   -26,     1,   207,   208,   284,    18,
      39,   238,   244,   285,   286,   390,   238,   309,   244,    31,
      86,   222,    40,   227,     2,   373,    41,    42,     3,   154,
      63,     4,    49,    50,   104,    88,    89,    90,    91,   391,
     193,   243,    92,    93,    81,   259,   260,   221,   392,    94,
       5,    64,    65,   224,   204,   247,   225,   245,   209,   210,
     211,   239,   310,   404,    59,     6,   239,   287,    32,   194,
     218,   219,   268,   288,     7,   242,   228,   229,   240,    48,
     374,   116,    35,    54,   206,     8,    56,    37,   154,   297,
     248,   249,   250,   251,   252,   253,   298,    38,   300,   301,
      39,    39,   223,    57,   223,    71,   254,   104,    77,    53,
     371,    78,    72,    40,    73,    74,    75,    41,    42,   158,
      79,    80,   223,   382,    82,   283,   339,   385,   106,    83,
     195,   291,   107,   104,   104,   108,   204,   117,   110,  -204,
     113,   118,   112,   119,  -205,   114,   115,   299,   141,   350,
     302,   142,   144,   223,   256,   120,   306,   307,   308,   145,
     121,   151,   152,   159,   122,   123,   312,   162,   196,   315,
     316,   317,   318,    88,    89,    90,    91,   338,   197,   340,
     341,    93,   214,   231,  -216,   246,   215,   378,   379,   248,
     249,   250,   251,   252,   253,   232,   261,   262,   233,   235,
     263,   234,   264,  -217,   265,   257,   296,   223,   266,   292,
     293,   294,   355,   356,   357,   358,   359,   360,   361,   362,
     363,   364,   365,   366,   367,   368,   369,   370,   337,   303,
     223,   399,    21,    22,    23,    24,    25,   304,   344,   305,
      26,   314,   319,   345,   384,   163,   343,   164,   165,   166,
     346,   167,   168,   169,   170,   171,   172,   173,   347,   348,
     351,   174,   175,   352,   388,   349,   389,   353,   133,   176,
     177,   178,   179,   180,   354,    26,   372,    88,    89,    90,
      91,   181,    73,    74,    75,    93,   375,   204,   383,   153,
     182,   377,   183,   184,   185,   380,   381,   386,   395,   387,
     269,   270,   271,   272,   273,   394,   397,   400,   405,   401,
     396,    33,   223,    58,   201,    88,    89,    90,    91,    84,
      73,    74,    75,    93,   117,   274,   186,   187,   118,   140,
     119,   134,    55,   200,   275,   276,   277,   402,   311,   147,
     295,   148,   120,  -179,   282,   138,   258,   121,   236,   313,
       0,   122,   123,   230,     0,     0,     0,     0,     0,    88,
      89,    90,    91,   120,    73,    74,    75,    93,     0,     0,
       0,   153,     0,     0,     0,   278,   279,   280,   403,    88,
      89,    90,    91,     0,    73,    74,    75,    93,   320,   321,
       0,   153,     0,     0,   146,   117,   322,     0,     0,   118,
       0,   119,     0,     0,     0,     0,     0,     0,     0,   323,
     324,   325,   326,   120,     0,     0,     0,     0,   121,     0,
       0,     0,   122,   123,    88,    89,    90,    91,    92,    73,
      74,    75,    93,     0,     0,    94,    95,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   327,   328,   329,   330,
     331,   332,   333,   334,   335,   336
};

static const short yycheck[] =
{
      20,    80,    54,    46,     4,     4,   164,   165,   234,    79,
      72,     4,    59,     9,    10,    29,     4,    59,    59,     4,
      72,   181,    84,   183,    23,     4,    88,    89,    27,   137,
       4,    30,    70,    71,   113,    75,    76,    77,    78,    53,
     148,   201,    79,    83,    64,   212,   213,    87,    62,    86,
      49,    25,    26,    77,   162,     8,    80,   104,   166,   167,
     168,    54,   104,   104,    64,    64,    54,    63,     0,   148,
     178,   179,   232,    69,    73,    68,   184,   185,    66,     4,
      59,     5,    79,    90,   163,    84,     4,    79,   196,   247,
      43,    44,    45,    46,    47,    48,   254,    79,   256,   257,
      72,    72,   181,    74,   183,     4,    59,   186,     4,    79,
     336,    72,    90,    84,    80,    81,    82,    88,    89,   139,
       4,    86,   201,   349,    79,   233,   286,   353,    79,    24,
     150,   239,    79,   212,   213,     4,   244,    61,     4,   101,
      59,    65,   101,    67,   101,     4,     4,   255,     4,   309,
     258,     4,     4,   232,     8,    79,   264,   265,   266,     4,
      84,     4,   102,     4,    88,    89,   274,   103,   105,   277,
     278,   279,   280,    75,    76,    77,    78,   285,    79,   287,
     288,    83,    79,     4,   101,   205,    79,   345,   346,    43,
      44,    45,    46,    47,    48,   103,   216,   217,    90,    79,
     220,   101,    59,   101,    90,    59,    79,   286,    59,     4,
       4,     4,   320,   321,   322,   323,   324,   325,   326,   327,
     328,   329,   330,   331,   332,   333,   334,   335,   102,    79,
     309,   391,    36,    37,    38,    39,    40,    79,     4,    79,
      79,    79,    79,     8,   352,     5,   289,     7,     8,     9,
       8,    11,    12,    13,    14,    15,    16,    17,    90,    90,
      90,    21,    22,    59,   372,   101,   374,   101,     5,    29,
      30,    31,    32,    33,    59,    79,    90,    75,    76,    77,
      78,    41,    80,    81,    82,    83,     4,   395,    79,    87,
      50,     4,    52,    53,    54,   347,   348,    79,   103,   102,
      16,    17,    18,    19,    20,   102,     4,     4,    79,     4,
     102,    10,   391,    43,    10,    75,    76,    77,    78,    67,
      80,    81,    82,    83,    61,    41,    86,    87,    65,   117,
      67,   111,    38,   161,    50,    51,    52,   395,   269,   129,
     244,   130,    79,   103,   233,   113,   211,    84,   196,   275,
      -1,    88,    89,   186,    -1,    -1,    -1,    -1,    -1,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    -1,    -1,
      -1,    87,    -1,    -1,    -1,    91,    92,    93,   398,    75,
      76,    77,    78,    -1,    80,    81,    82,    83,    34,    35,
      -1,    87,    -1,    -1,    60,    61,    42,    -1,    -1,    65,
      -1,    67,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    55,
      56,    57,    58,    79,    -1,    -1,    -1,    -1,    84,    -1,
      -1,    -1,    88,    89,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    -1,    -1,    86,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    92,    93,    94,    95,
      96,    97,    98,    99,   100,   101
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    23,    27,    30,    49,    64,    73,    84,   107,
     108,   109,   110,   111,   118,   120,   127,   134,    79,   128,
     112,    36,    37,    38,    39,    40,    79,   171,   172,   135,
     119,     4,     0,   109,   121,    79,   171,    79,    79,    72,
      84,    88,    89,   113,   114,   160,   161,   162,     4,    70,
      71,   143,   144,    79,    90,   144,     4,    74,   114,    64,
     115,   116,   162,     4,    25,    26,   122,   123,   124,   125,
     126,     4,    90,    80,    81,    82,   196,     4,    72,     4,
      86,   171,    79,    24,   124,   129,   196,   136,    75,    76,
      77,    78,    79,    83,    86,    87,   117,   184,   185,   186,
     187,   188,   189,   190,   195,   196,    79,    79,     4,   130,
       4,   137,   101,    59,     4,     4,     5,    61,    65,    67,
      79,    84,    88,    89,   131,   133,   140,   151,   153,   157,
     158,   159,   176,     5,   133,   138,   191,   192,   187,   132,
     143,     4,     4,   177,     4,     4,    60,   159,   160,   163,
     139,     4,   102,    87,   190,   193,   194,   195,   171,     4,
     152,   154,   103,     5,     7,     8,     9,    11,    12,    13,
      14,    15,    16,    17,    21,    22,    29,    30,    31,    32,
      33,    41,    50,    52,    53,    54,    86,    87,   164,   173,
     175,   181,   183,   190,   195,   171,   105,    79,   141,   155,
     155,    10,   178,   179,   190,   168,   195,   188,   188,   190,
     190,   190,   174,   169,    79,    79,   165,   166,   190,   190,
     167,    87,   183,   195,    77,    80,   197,   183,   190,   190,
     185,     4,   103,    90,   101,    79,   194,   146,     4,    54,
      66,   156,    68,   183,    59,   104,   171,     8,    43,    44,
      45,    46,    47,    48,    59,   182,     8,    59,   182,   117,
     117,   171,   171,   171,    59,    90,    59,   180,   183,    16,
      17,    18,    19,    20,    41,    50,    51,    52,    91,    92,
      93,   170,   176,   190,   191,     9,    10,    63,    69,   145,
     147,   190,     4,     4,     4,   179,    79,   188,   188,   190,
     188,   188,   190,    79,    79,    79,   190,   190,   190,    59,
     104,   172,   190,   197,    79,   190,   190,   190,   190,    79,
      34,    35,    42,    55,    56,    57,    58,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   190,   183,
     190,   190,   142,   162,     4,     8,     8,    90,    90,   101,
     183,    90,    59,   101,    59,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
     190,   191,    90,     4,    59,     4,   148,     4,   188,   188,
     196,   196,   191,    79,   190,   191,    79,   102,   190,   190,
      29,    53,    62,   149,   102,   103,   102,     4,   150,   183,
       4,     4,   178,   171,   104,    79
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
#line 262 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 271 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 272 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 273 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 274 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 275 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 276 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 277 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 278 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 283 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 14:
#line 288 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 295 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 16:
#line 296 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 19:
#line 305 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 20:
#line 306 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 307 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 308 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 311 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 24:
#line 313 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 25:
#line 316 "imcc/imcc.y"
    { char *name = str_dup(yyvsp[0].s);
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(name, 0); }
    break;

  case 26:
#line 319 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 28:
#line 327 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 29:
#line 330 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 30:
#line 340 "imcc/imcc.y"
    { 
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 31:
#line 347 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 33:
#line 356 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 38:
#line 367 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 39:
#line 372 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[-1].s);
                      if(lookup_field_symbol(current_class, yyvsp[-1].s)) {
                         fataly(EX_SOFTWARE, sourcefile, line,
                            "field '%s' previously declared in class '%s'\n",
                            yyvsp[-1].s, current_class->sym->name);
                      }
                      sym->type = yyvsp[-2].t;
                      store_field_symbol(current_class, sym);
                      yyval.i = 0; }
    break;

  case 40:
#line 386 "imcc/imcc.y"
    {
           Method * meth;
           Symbol * sym = new_symbol(yyvsp[-2].s);
           if(lookup_method_symbol(current_class, yyvsp[-2].s)) {
              fataly(EX_SOFTWARE, sourcefile, line,
                 "method '%s' previously declared in class '%s'\n",
                    yyvsp[-2].s, current_class->sym->name);
           }
           meth = new_method(sym, new_symbol(yyvsp[-1].s));
           store_method_symbol(current_class, sym);
           yyval.i = 0;
        }
    break;

  case 41:
#line 402 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 42:
#line 407 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 43:
#line 414 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 44:
#line 418 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 45:
#line 419 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 46:
#line 420 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 47:
#line 424 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 48:
#line 425 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 49:
#line 429 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 433 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 51:
#line 435 "imcc/imcc.y"
    {
            char *name = str_dup(yyvsp[-2].s);
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
            i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
         }
    break;

  case 52:
#line 442 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 446 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 447 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 55:
#line 448 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 56:
#line 452 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 57:
#line 453 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 58:
#line 458 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, line - 1);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            r->pcc_sub->prototyped = yyvsp[-1].t;
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r1 of the first ins
             */
            if (cur_unit->instructions->r[1] && cur_unit->instructions->r[1]->pcc_sub)
                cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
         }
    break;

  case 59:
#line 483 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 60:
#line 487 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 61:
#line 488 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 62:
#line 492 "imcc/imcc.y"
    {  yyval.t = 1; }
    break;

  case 63:
#line 493 "imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 64:
#line 497 "imcc/imcc.y"
    {  yyval.t = -1; }
    break;

  case 66:
#line 503 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
            add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
         }
    break;

  case 67:
#line 508 "imcc/imcc.y"
    {  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr); }
    break;

  case 68:
#line 510 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
            yyvsp[-4].sr ->pcc_sub->nci = 1;
         }
    break;

  case 69:
#line 517 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 70:
#line 518 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 71:
#line 522 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 72:
#line 523 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 73:
#line 527 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 74:
#line 528 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 75:
#line 533 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 76:
#line 534 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 77:
#line 535 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 78:
#line 540 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_return not inside pcc subroutine\n");
            sprintf(name, "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, line - 1);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL;
         }
    break;

  case 79:
#line 555 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 80:
#line 560 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_yield not inside pcc subroutine\n");
            ins->r[1]->pcc_sub->calls_a_sub = 1;
            sprintf(name, "%cpcc_sub_yield_%d", IMCC_INTERNAL_CHAR, line - 1);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
         }
    break;

  case 81:
#line 576 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 82:
#line 580 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 83:
#line 582 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 84:
#line 584 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 85:
#line 588 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 88:
#line 605 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 89:
#line 610 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 90:
#line 611 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 91:
#line 612 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 92:
#line 613 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 95:
#line 616 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 96:
#line 617 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 97:
#line 621 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 101:
#line 631 "imcc/imcc.y"
    { 
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 102:
#line 639 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 105:
#line 645 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 106:
#line 646 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 107:
#line 647 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 108:
#line 647 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 109:
#line 648 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 110:
#line 649 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 111:
#line 650 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 112:
#line 651 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 113:
#line 652 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 114:
#line 652 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 115:
#line 654 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 116:
#line 655 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 117:
#line 656 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 118:
#line 657 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 119:
#line 658 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 120:
#line 659 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 121:
#line 660 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 122:
#line 661 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 123:
#line 662 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 124:
#line 663 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 125:
#line 664 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 126:
#line 665 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 127:
#line 667 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 128:
#line 669 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 129:
#line 671 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 130:
#line 675 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 131:
#line 676 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 132:
#line 677 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 133:
#line 678 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 134:
#line 682 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 135:
#line 683 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 136:
#line 684 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 137:
#line 685 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 138:
#line 686 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 139:
#line 687 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 140:
#line 692 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 141:
#line 700 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 142:
#line 701 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 143:
#line 702 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 144:
#line 703 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 145:
#line 704 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 146:
#line 705 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 147:
#line 706 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 707 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 149:
#line 708 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 150:
#line 709 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 151:
#line 710 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 152:
#line 712 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 153:
#line 714 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 154:
#line 716 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 155:
#line 718 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 720 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 722 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 724 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 726 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 728 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 730 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 162:
#line 732 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 734 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 164:
#line 736 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 165:
#line 738 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 166:
#line 741 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 167:
#line 748 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 750 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 169:
#line 753 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 755 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 171:
#line 758 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 172:
#line 760 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 173:
#line 764 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 174:
#line 766 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 175:
#line 768 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 770 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 177:
#line 773 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 776 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 179:
#line 782 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r;
            Instruction *i;
            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, line - 1);
            r = mk_pcc_sub(str_dup(name), 0);
            current_call = i = iLABEL(cur_unit, r);
            i->type = ITCALL | ITPCCSUB;
            yyval.i = i;
         }
    break;

  case 180:
#line 793 "imcc/imcc.y"
    {
            current_call->r[0]->pcc_sub->sub = mk_sub_address(yyvsp[-3].s);
            current_call->r[0]->pcc_sub->prototyped = 1;
            if(cur_unit->type == IMC_PCCSUB)
               cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;

            current_call = NULL;
         }
    break;

  case 181:
#line 805 "imcc/imcc.y"
    {
           char name[128];           
           SymReg * r; 
           Instruction *i;
           sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, line - 1);
           r = mk_pcc_sub(str_dup(name), 0);
           current_call = i = iLABEL(cur_unit, r);
           i->type = ITCALL | ITPCCSUB;
           yyval.i = i;
           current_call->r[0]->pcc_sub->sub = mk_sub_address(yyvsp[0].s);
           current_call->r[0]->pcc_sub->prototyped = 1;
           if(cur_unit->type == IMC_PCCSUB)
              cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
        }
    break;

  case 182:
#line 820 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 183:
#line 824 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 184:
#line 825 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 185:
#line 826 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 186:
#line 831 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 187:
#line 833 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 188:
#line 837 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 189:
#line 838 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 190:
#line 843 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 191:
#line 845 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 847 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 193:
#line 849 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 851 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 853 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 857 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 197:
#line 858 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 198:
#line 859 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 199:
#line 860 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 200:
#line 861 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 201:
#line 862 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 206:
#line 876 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 207:
#line 877 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 208:
#line 881 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 210:
#line 886 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 211:
#line 888 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 212:
#line 896 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 213:
#line 897 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 219:
#line 911 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 220:
#line 912 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 221:
#line 916 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 222:
#line 918 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 224:
#line 926 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 225:
#line 927 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 226:
#line 928 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 227:
#line 929 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 228:
#line 930 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 229:
#line 934 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 230:
#line 935 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 231:
#line 936 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 232:
#line 940 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 233:
#line 941 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/local/share/bison/yacc.c.  */
#line 2891 "imcc/imcparser.c"

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


#line 946 "imcc/imcc.y"



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

