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
     MAIN = 326,
     LOAD = 327,
     IMMEDIATE = 328,
     POSTCOMP = 329,
     LABEL = 330,
     EMIT = 331,
     EOM = 332,
     IREG = 333,
     NREG = 334,
     SREG = 335,
     PREG = 336,
     IDENTIFIER = 337,
     STRINGC = 338,
     INTC = 339,
     FLOATC = 340,
     REG = 341,
     MACRO = 342,
     ENDM = 343,
     PARROT_OP = 344,
     VAR = 345,
     LINECOMMENT = 346,
     FILECOMMENT = 347,
     POINTY = 348
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
#define MAIN 326
#define LOAD 327
#define IMMEDIATE 328
#define POSTCOMP 329
#define LABEL 330
#define EMIT 331
#define EOM 332
#define IREG 333
#define NREG 334
#define SREG 335
#define PREG 336
#define IDENTIFIER 337
#define STRINGC 338
#define INTC 339
#define FLOATC 340
#define REG 341
#define MACRO 342
#define ENDM 343
#define PARROT_OP 344
#define VAR 345
#define LINECOMMENT 346
#define FILECOMMENT 347
#define POINTY 348




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
#define PARSER_MAIN
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
static SymReg *cur_obj;
IMC_Unit * cur_unit;

/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_REGS];
static int nkeys;
static int keyvec;
static SymReg *regs[IMCC_MAX_REGS];
static int nargs;
static int cnr;



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

static Instruction *
create_itcall_label(void)
{
    char name[128];
    SymReg * r;
    Instruction *i;

    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
    r = mk_pcc_sub(str_dup(name), 0);
    current_call = i = iLABEL(cur_unit, r);
    i->type = ITCALL | ITPCCSUB;
    return i;
}

static void
itcall_sub(SymReg* sub)
{
   current_call->r[0]->pcc_sub->sub = sub;
   current_call->r[0]->pcc_sub->object = cur_obj;
   cur_obj = NULL;
   /* FIXME use the default settings from .pragma */
   current_call->r[0]->pcc_sub->pragma = P_PROTOTYPED;
   if(cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[1]->pcc_sub->calls_a_sub = 1;
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
#line 226 "imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 494 "imcc/imcparser.c"
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


/* Line 213 of /usr/share/bison/yacc.c.  */
#line 515 "imcc/imcparser.c"

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
#define YYLAST   424

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  111
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  95
/* YYNRULES -- Number of rules. */
#define YYNRULES  244
/* YYNRULES -- Number of states. */
#define YYNSTATES  418

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   348

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    97,     2,     2,     2,   103,   104,     2,
     108,   109,   101,   100,     2,    98,    94,   102,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   110,
       2,    96,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   106,     2,   107,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   105,     2,    99,     2,     2,     2,
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
      86,    87,    88,    89,    90,    91,    92,    93,    95
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    31,    37,    38,    45,    47,    50,
      54,    57,    59,    61,    62,    66,    70,    71,    73,    74,
      79,    80,    87,    89,    90,    92,    95,    97,    99,   101,
     106,   111,   112,   113,   122,   123,   125,   129,   130,   135,
     138,   139,   140,   149,   150,   152,   156,   157,   162,   163,
     173,   174,   177,   179,   181,   182,   186,   188,   190,   192,
     194,   196,   198,   204,   208,   212,   213,   217,   220,   223,
     224,   228,   231,   232,   237,   238,   244,   245,   251,   252,
     255,   259,   262,   264,   267,   268,   271,   274,   276,   278,
     279,   281,   284,   286,   288,   292,   294,   296,   299,   302,
     303,   308,   309,   316,   317,   324,   325,   330,   333,   336,
     339,   342,   345,   348,   351,   354,   356,   358,   360,   361,
     365,   368,   370,   372,   374,   376,   377,   379,   381,   383,
     385,   387,   389,   391,   393,   395,   397,   399,   403,   408,
     413,   418,   424,   430,   436,   442,   448,   454,   460,   466,
     472,   478,   484,   490,   496,   502,   508,   514,   521,   528,
     535,   540,   545,   552,   557,   565,   570,   575,   580,   585,
     586,   590,   595,   603,   608,   612,   613,   623,   625,   627,
     631,   633,   635,   636,   642,   643,   647,   649,   651,   654,
     658,   660,   667,   674,   679,   684,   689,   694,   696,   698,
     700,   702,   704,   706,   708,   710,   712,   714,   715,   717,
     721,   723,   725,   730,   732,   734,   736,   738,   740,   742,
     744,   745,   748,   750,   754,   756,   758,   760,   762,   764,
     766,   768,   770,   772,   774
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     112,     0,    -1,   113,    -1,   114,    -1,   113,   114,    -1,
     125,    -1,   116,    -1,   115,    -1,   132,    -1,   139,    -1,
     123,    -1,    88,     4,    -1,     4,    -1,    49,   177,    83,
      -1,    49,   177,    83,    96,   204,    -1,    -1,    30,   117,
     177,    83,    96,   204,    -1,   119,    -1,   118,   119,    -1,
     166,   120,     4,    -1,    88,     4,    -1,    93,    -1,    92,
      -1,    -1,   121,    90,   122,    -1,    64,   149,    76,    -1,
      -1,   193,    -1,    -1,    77,   124,   118,    78,    -1,    -1,
      23,    83,   126,     4,   127,    24,    -1,   128,    -1,    -1,
     129,    -1,   128,   129,    -1,   130,    -1,   131,    -1,     4,
      -1,    25,   177,    83,     4,    -1,    26,    83,    83,     4,
      -1,    -1,    -1,    27,   133,    83,   149,     4,   134,   135,
     138,    -1,    -1,     4,    -1,   135,   136,     4,    -1,    -1,
       5,   137,   177,    83,    -1,   163,    60,    -1,    -1,    -1,
      64,   140,    83,   149,     4,   141,   142,   138,    -1,    -1,
       4,    -1,   142,   143,     4,    -1,    -1,     5,   144,   177,
      83,    -1,    -1,    61,   148,     4,   146,   152,   151,   147,
     154,    62,    -1,    -1,   168,     4,    -1,    70,    -1,    71,
      -1,    -1,   149,    59,   150,    -1,   150,    -1,   148,    -1,
      73,    -1,    72,    -1,    74,    -1,    75,    -1,    63,   198,
      59,   198,     4,    -1,    63,   198,     4,    -1,    69,   198,
       4,    -1,    -1,   152,   153,     4,    -1,     9,   198,    -1,
      10,   191,    -1,    -1,   154,   155,     4,    -1,    53,   191,
      -1,    -1,    29,   156,   177,    83,    -1,    -1,    65,     4,
     158,   161,    66,    -1,    -1,    67,     4,   160,   161,    68,
      -1,    -1,   161,     4,    -1,   161,   162,     4,    -1,    54,
     198,    -1,   165,    -1,   163,   165,    -1,    -1,   164,   169,
      -1,    88,     4,    -1,    93,    -1,    92,    -1,    -1,   167,
      -1,   167,   168,    -1,   168,    -1,    76,    -1,   166,   170,
       4,    -1,   179,    -1,   189,    -1,    21,    83,    -1,    22,
      83,    -1,    -1,    29,   171,   177,    83,    -1,    -1,    30,
     172,   177,    83,    96,   204,    -1,    -1,    33,   173,   177,
      83,    96,   204,    -1,    -1,     5,   174,   177,    83,    -1,
       5,   203,    -1,    53,   198,    -1,     9,   198,    -1,    54,
     198,    -1,     7,   196,    -1,     8,   196,    -1,    31,   198,
      -1,    32,   198,    -1,    14,    -1,    15,    -1,    13,    -1,
      -1,    17,   175,   122,    -1,    90,   193,    -1,   184,    -1,
     145,    -1,   157,    -1,   159,    -1,    -1,    17,    -1,    18,
      -1,    19,    -1,    20,    -1,    36,    -1,    37,    -1,    38,
      -1,    39,    -1,    40,    -1,   178,    -1,    83,    -1,   191,
      96,   198,    -1,   191,    96,    97,   198,    -1,   191,    96,
      98,   198,    -1,   191,    96,    99,   198,    -1,   191,    96,
     198,   100,   198,    -1,   191,    96,   198,    98,   198,    -1,
     191,    96,   198,   101,   198,    -1,   191,    96,   198,    55,
     198,    -1,   191,    96,   198,   102,   198,    -1,   191,    96,
     198,   103,   198,    -1,   191,    96,   198,    94,   198,    -1,
     191,    96,   198,    34,   198,    -1,   191,    96,   198,    35,
     198,    -1,   191,    96,   198,    56,   198,    -1,   191,    96,
     198,    57,   198,    -1,   191,    96,   198,    58,   198,    -1,
     191,    96,   198,    42,   198,    -1,   191,    96,   198,   104,
     198,    -1,   191,    96,   198,   105,   198,    -1,   191,    96,
     198,    99,   198,    -1,   191,    96,   198,   106,   199,   107,
      -1,   198,   106,   199,   107,    96,   198,    -1,   191,    96,
      16,   178,    59,   198,    -1,   191,    96,    16,   178,    -1,
     191,    96,   176,    83,    -1,   191,    96,   176,    83,    59,
      83,    -1,   191,    96,    41,   198,    -1,   191,    96,    41,
     198,   106,   199,   107,    -1,   191,    96,    52,   198,    -1,
     191,    96,    51,    83,    -1,   191,    96,    50,   205,    -1,
      50,   205,    96,   198,    -1,    -1,    16,   180,   122,    -1,
      41,   191,    59,   198,    -1,    41,   191,    59,   198,   106,
     199,   107,    -1,    52,   191,    59,   198,    -1,   191,    96,
     184,    -1,    -1,   181,   108,   188,   109,    96,   182,   108,
     186,   109,    -1,    83,    -1,    91,    -1,    91,   183,    83,
      -1,    95,    -1,    94,    -1,    -1,   182,   185,   108,   186,
     109,    -1,    -1,   186,    59,   187,    -1,   187,    -1,   198,
      -1,    10,   191,    -1,   188,    59,   191,    -1,   191,    -1,
      11,   198,   190,   198,     8,   196,    -1,    12,   198,   190,
     198,     8,   196,    -1,    11,   198,     8,   196,    -1,    12,
     198,     8,   196,    -1,    11,   198,    59,   196,    -1,    12,
     198,    59,   196,    -1,    43,    -1,    44,    -1,    45,    -1,
      46,    -1,    47,    -1,    48,    -1,    91,    -1,   203,    -1,
      91,    -1,   203,    -1,    -1,   194,    -1,   194,    59,   195,
      -1,   195,    -1,   197,    -1,   192,   106,   199,   107,    -1,
      83,    -1,    90,    -1,   196,    -1,   198,    -1,    91,    -1,
     203,    -1,   204,    -1,    -1,   200,   201,    -1,   202,    -1,
     201,   110,   202,    -1,   198,    -1,    79,    -1,    80,    -1,
      81,    -1,    82,    -1,    87,    -1,    85,    -1,    86,    -1,
      84,    -1,    81,    -1,    84,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   295,   295,   299,   301,   304,   306,   307,   308,   309,
     310,   311,   312,   315,   321,   329,   328,   333,   335,   338,
     340,   341,   342,   345,   345,   349,   355,   358,   363,   362,
     376,   374,   390,   392,   395,   397,   400,   402,   403,   406,
     420,   438,   443,   436,   453,   455,   456,   460,   459,   464,
     469,   471,   468,   481,   483,   484,   488,   487,   494,   492,
     522,   524,   527,   529,   532,   534,   535,   538,   539,   540,
     541,   542,   545,   551,   553,   560,   562,   565,   567,   570,
     572,   575,   578,   578,   584,   582,   604,   602,   623,   625,
     627,   631,   635,   637,   648,   652,   655,   656,   657,   660,
     662,   665,   667,   670,   677,   682,   684,   685,   686,   687,
     687,   688,   688,   690,   690,   692,   692,   694,   695,   696,
     697,   698,   699,   700,   701,   702,   703,   704,   705,   705,
     708,   711,   712,   713,   714,   715,   718,   720,   721,   722,
     725,   727,   728,   729,   730,   731,   734,   743,   745,   746,
     747,   748,   749,   750,   751,   752,   753,   754,   755,   757,
     759,   761,   763,   765,   767,   769,   771,   773,   775,   777,
     779,   781,   784,   791,   793,   796,   798,   801,   803,   808,
     807,   811,   813,   816,   819,   826,   825,   836,   837,   841,
     844,   845,   850,   848,   858,   860,   861,   864,   867,   871,
     873,   876,   879,   881,   883,   885,   887,   891,   893,   894,
     895,   896,   897,   900,   902,   905,   907,   910,   912,   915,
     917,   920,   922,   930,   932,   935,   937,   940,   942,   943,
     946,   946,   950,   952,   956,   960,   962,   963,   964,   965,
     968,   970,   971,   974,   976
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
  "PCC_END_YIELD", "NCI_CALL", "PROTOTYPED", "NON_PROTOTYPED", "MAIN", 
  "LOAD", "IMMEDIATE", "POSTCOMP", "LABEL", "EMIT", "EOM", "IREG", "NREG", 
  "SREG", "PREG", "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", 
  "MACRO", "ENDM", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", 
  "'.'", "POINTY", "'='", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", 
  "'&'", "'|'", "'['", "']'", "'('", "')'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "global", "constdef", "@1", 
  "pasmcode", "pasmline", "pasm_inst", "@2", "pasm_args", "emit", "@3", 
  "class", "@4", "class_body", "member_decls", "member_decl", 
  "field_decl", "method_decl", "sub", "@5", "@6", "sub_params", 
  "sub_param", "@7", "sub_body", "pcc_sub", "@8", "@9", "pcc_params", 
  "pcc_param", "@10", "pcc_sub_call", "@11", "opt_label", "pcc_proto", 
  "pcc_sub_proto", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@12", "pcc_ret", "@13", "pcc_yield", 
  "@14", "pcc_returns", "pcc_return", "statements", "helper_clear_state", 
  "statement", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@15", "@16", "@17", "@18", "@19", "newsub", "type", 
  "classname", "assignment", "@20", "@21", "the_sub", "ptr", "sub_call", 
  "@22", "arglist", "arg", "targetlist", "if_statement", "relop", 
  "target", "lhs", "vars", "_vars", "_var_or_i", "label_op", "var_or_i", 
  "var", "keylist", "@23", "_keylist", "key", "reg", "const", "string", 0
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
     344,   345,   346,   347,    46,   348,    61,    33,    45,   126,
      43,    42,    47,    37,    38,   124,    91,    93,    40,    41,
      59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   111,   112,   113,   113,   114,   114,   114,   114,   114,
     114,   114,   114,   115,   115,   117,   116,   118,   118,   119,
     119,   119,   119,   121,   120,   120,   120,   122,   124,   123,
     126,   125,   127,   127,   128,   128,   129,   129,   129,   130,
     131,   133,   134,   132,   135,   135,   135,   137,   136,   138,
     140,   141,   139,   142,   142,   142,   144,   143,   146,   145,
     147,   147,   148,   148,   149,   149,   149,   150,   150,   150,
     150,   150,   151,   151,   151,   152,   152,   153,   153,   154,
     154,   155,   156,   155,   158,   157,   160,   159,   161,   161,
     161,   162,   163,   163,   164,   165,   165,   165,   165,   166,
     166,   167,   167,   168,   169,   170,   170,   170,   170,   171,
     170,   172,   170,   173,   170,   174,   170,   170,   170,   170,
     170,   170,   170,   170,   170,   170,   170,   170,   175,   170,
     170,   170,   170,   170,   170,   170,   176,   176,   176,   176,
     177,   177,   177,   177,   177,   177,   178,   179,   179,   179,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   180,
     179,   179,   179,   179,   179,   181,   179,   182,   182,   182,
     183,   183,   185,   184,   186,   186,   186,   187,   187,   188,
     188,   189,   189,   189,   189,   189,   189,   190,   190,   190,
     190,   190,   190,   191,   191,   192,   192,   193,   193,   194,
     194,   195,   195,   196,   196,   197,   197,   198,   198,   198,
     200,   199,   201,   201,   202,   203,   203,   203,   203,   203,
     204,   204,   204,   205,   205
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     3,     5,     0,     6,     1,     2,     3,
       2,     1,     1,     0,     3,     3,     0,     1,     0,     4,
       0,     6,     1,     0,     1,     2,     1,     1,     1,     4,
       4,     0,     0,     8,     0,     1,     3,     0,     4,     2,
       0,     0,     8,     0,     1,     3,     0,     4,     0,     9,
       0,     2,     1,     1,     0,     3,     1,     1,     1,     1,
       1,     1,     5,     3,     3,     0,     3,     2,     2,     0,
       3,     2,     0,     4,     0,     5,     0,     5,     0,     2,
       3,     2,     1,     2,     0,     2,     2,     1,     1,     0,
       1,     2,     1,     1,     3,     1,     1,     2,     2,     0,
       4,     0,     6,     0,     6,     0,     4,     2,     2,     2,
       2,     2,     2,     2,     2,     1,     1,     1,     0,     3,
       2,     1,     1,     1,     1,     0,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     3,     4,     4,
       4,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     6,     6,     6,
       4,     4,     6,     4,     7,     4,     4,     4,     4,     0,
       3,     4,     7,     4,     3,     0,     9,     1,     1,     3,
       1,     1,     0,     5,     0,     3,     1,     1,     2,     3,
       1,     6,     6,     4,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     1,
       0,     2,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,    12,     0,    41,    15,     0,    50,    28,     0,     0,
       2,     3,     7,     6,    10,     5,     8,     9,    30,     0,
       0,   140,   141,   142,   143,   144,   146,     0,   145,     0,
      99,    11,     1,     4,     0,    64,     0,    13,    64,   103,
       0,    22,    21,    99,    17,    23,   100,   102,    33,    62,
      63,    69,    68,    70,    71,    67,     0,    66,     0,     0,
       0,    20,    29,    18,    64,     0,     0,   101,    38,     0,
       0,     0,    32,    34,    36,    37,    42,     0,     0,   242,
     240,   241,    14,    51,     0,    19,   217,     0,     0,    31,
      35,    44,    65,    16,    53,    25,   235,   236,   237,   238,
     223,   239,   224,   227,    24,     0,    27,   218,   220,   225,
     221,   226,   228,   229,     0,     0,    45,    94,    54,    94,
     230,     0,    39,    40,    47,     0,    98,    97,     0,    43,
      94,    99,    92,    56,    52,     0,     0,     0,   219,     0,
      96,    46,    49,    93,   135,    95,     0,    55,   222,   227,
     234,   231,   232,   228,     0,   115,     0,     0,     0,     0,
       0,   127,   125,   126,   179,   128,     0,     0,   109,   111,
       0,     0,   113,     0,     0,     0,     0,     0,     0,     0,
       0,   187,   217,   188,   132,   133,   134,     0,   105,     0,
     192,   131,   106,     0,     0,   214,     0,     0,    48,     0,
     117,   121,   122,   119,     0,     0,   217,   217,   107,   108,
       0,     0,   123,   124,     0,   213,     0,   214,   243,   244,
       0,     0,   118,   120,     0,    84,    86,   130,   191,   190,
       0,   104,     0,     0,     0,   230,    57,   233,     0,     0,
     207,   208,   209,   210,   211,   212,     0,     0,     0,     0,
       0,   180,   129,     0,     0,     0,     0,     0,     0,    58,
      88,    88,   189,     0,   200,   194,     0,   136,   137,   138,
     139,     0,     0,     0,     0,   227,     0,     0,     0,     0,
     184,   147,     0,   116,   203,   205,     0,   204,   206,     0,
     110,     0,     0,   181,   178,   183,    75,     0,     0,     0,
       0,     0,     0,   196,   197,   170,   173,   177,   176,   175,
     148,   149,   150,   171,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     230,     0,     0,     0,     0,     0,   230,     0,    89,     0,
      85,     0,    87,   199,     0,   198,     0,   193,     0,   230,
       0,   158,   159,   163,   154,   160,   161,   162,   157,   152,
     166,   151,   153,   155,   156,   164,   165,     0,     0,   201,
     202,   112,   114,     0,     0,     0,     0,     0,    60,     0,
      91,    90,   188,     0,   195,   169,     0,   172,   167,   168,
     182,    77,    78,     0,     0,    79,     0,    76,   194,   174,
      73,     0,    74,     0,    61,     0,     0,    82,     0,    59,
       0,   186,    72,     0,    81,    80,     0,    83
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     9,    10,    11,    12,    13,    20,    43,    44,    65,
      66,   104,    14,    30,    15,    34,    71,    72,    73,    74,
      75,    16,    19,    91,   117,   128,   139,   129,    17,    29,
      94,   119,   135,   146,   184,   296,   395,    55,    56,    57,
     378,   337,   379,   403,   410,   413,   185,   260,   186,   261,
     297,   341,   130,   131,   132,    45,    46,    47,   145,   187,
     210,   211,   214,   199,   207,   279,    27,    28,   188,   206,
     189,   190,   230,   191,   233,   302,   303,   263,   192,   247,
     193,   105,   106,   107,   108,   109,   110,   111,   136,   137,
     151,   152,   153,   113,   220
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -230
static const short yypact[] =
{
       5,  -230,   -47,  -230,  -230,    74,  -230,  -230,    30,    27,
       5,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,   -21,
      74,  -230,  -230,  -230,  -230,  -230,  -230,     3,  -230,    22,
      96,  -230,  -230,  -230,    34,   161,    32,   -23,   161,  -230,
      64,  -230,  -230,    57,  -230,     6,    12,  -230,    25,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,    13,  -230,    28,   128,
      19,  -230,  -230,  -230,   161,   102,    31,  -230,  -230,    74,
      42,   103,    25,  -230,  -230,  -230,  -230,   161,   128,  -230,
    -230,  -230,  -230,  -230,   -29,  -230,   315,    47,    51,  -230,
    -230,   133,  -230,  -230,   137,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,    37,  -230,    40,  -230,    92,  -230,  -230,
    -230,  -230,    46,  -230,   150,   151,  -230,     7,  -230,    16,
    -230,   315,  -230,  -230,  -230,   166,  -230,  -230,   167,  -230,
     -49,    12,  -230,  -230,  -230,   174,    58,   190,  -230,    74,
    -230,  -230,  -230,  -230,   232,  -230,    74,  -230,  -230,  -230,
    -230,    73,  -230,  -230,   109,   250,     0,     0,   190,   190,
     190,  -230,  -230,  -230,  -230,  -230,   110,   112,  -230,  -230,
     190,   190,  -230,    95,   -36,    95,   190,   190,   -15,   181,
     212,  -230,   315,   200,  -230,  -230,  -230,   215,  -230,   121,
    -230,  -230,  -230,   124,   136,   146,   172,   190,  -230,    74,
    -230,  -230,  -230,  -230,   179,   302,   315,   315,  -230,  -230,
      74,    74,  -230,  -230,    74,  -230,   198,  -230,  -230,  -230,
     164,   207,  -230,  -230,   263,  -230,  -230,  -230,  -230,  -230,
     185,  -230,    95,   180,   284,  -230,  -230,  -230,   204,     0,
    -230,  -230,  -230,  -230,  -230,  -230,     0,   190,     0,     0,
     190,  -230,  -230,   206,   209,   222,   190,   190,   190,  -230,
    -230,  -230,  -230,   -44,  -230,    82,   224,  -230,  -230,  -230,
    -230,   190,   -36,   225,   190,    23,   190,   190,   190,   226,
    -230,   286,   183,  -230,  -230,  -230,   290,  -230,  -230,   318,
    -230,   231,   242,   233,  -230,  -230,  -230,    10,     9,    95,
     255,    95,   -35,  -230,  -230,   293,   247,  -230,  -230,  -230,
    -230,  -230,  -230,   295,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   190,   190,   190,   190,   190,   190,   190,
    -230,   259,     0,     0,   128,   128,  -230,    -2,  -230,   190,
    -230,   352,  -230,  -230,    45,  -230,    82,  -230,   190,  -230,
     274,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,   251,   190,  -230,
    -230,  -230,  -230,   252,   190,    95,   190,   190,    12,   356,
    -230,  -230,   -10,   254,  -230,  -230,   265,  -230,  -230,  -230,
    -230,  -230,  -230,    21,   369,  -230,   370,  -230,    82,  -230,
    -230,   190,  -230,     4,  -230,   -28,   372,  -230,    95,  -230,
     373,  -230,  -230,    74,  -230,  -230,   296,  -230
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -230,  -230,  -230,   368,  -230,  -230,  -230,  -230,   360,  -230,
    -230,  -104,  -230,  -230,  -230,  -230,  -230,  -230,   332,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,   288,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,   230,   -18,   333,
    -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,  -230,
     148,  -230,  -230,  -230,   281,   282,  -230,   -45,  -230,  -230,
    -230,  -230,  -230,  -230,  -230,  -230,   -20,   149,  -230,  -230,
    -230,    68,  -230,   182,  -230,    20,    71,  -230,  -230,   214,
    -157,  -230,   238,  -230,   300,  -152,  -230,  -118,  -229,  -230,
    -230,   217,   -84,   -56,   152
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -229
static const short yytable[] =
{
      36,    67,   112,    82,   201,   202,   282,   374,   375,     1,
     -26,   142,   124,   338,   338,   299,   216,    76,   221,   150,
      60,   133,    93,    83,   346,   400,   194,    32,     2,    68,
      77,   346,     3,   407,    31,     4,    18,   112,    48,   125,
     203,   204,   205,   126,   127,   218,    84,    95,   219,    87,
      69,    70,   212,   213,     5,    49,    50,   408,   222,   223,
     195,   376,    35,   339,   339,   300,   409,   377,    61,     6,
      64,   200,    77,    59,   347,   264,   340,   342,    77,   150,
     401,   411,     7,   100,   228,   229,    37,   284,    39,   217,
     102,   217,   301,     8,   285,   125,   287,   288,   112,   126,
     127,   367,   251,   252,   125,    38,    85,   373,   126,   127,
      21,    22,    23,    24,    25,    58,   281,   228,   229,   154,
     386,    86,   112,   112,    78,    88,   196,    89,   181,   286,
     114,  -188,   289,    39,   115,    62,   382,   116,   293,   294,
     295,   118,   343,  -215,   345,    40,   120,   304,   217,    41,
      42,   121,  -216,   306,   122,   123,   309,    26,   310,   311,
     312,    96,    97,    98,    99,   148,    79,    80,    81,   101,
     140,   141,    39,   149,    96,    97,    98,    99,   147,   238,
     369,   370,   101,   197,    40,   225,   215,   239,    41,    42,
     253,   254,   198,   208,   255,   209,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,    79,    80,    81,   217,   226,   217,   392,   231,
     234,   380,   240,   241,   242,   243,   244,   245,   304,   232,
     385,    49,    50,    51,    52,    53,    54,   155,   246,   156,
     157,   158,   235,   159,   160,   161,   162,   163,   164,   165,
     389,   414,  -228,   166,   167,   236,   391,   256,   393,   394,
     257,   168,   169,   170,   171,   172,   258,   259,   262,    96,
      97,    98,    99,   173,    79,    80,    81,   101,   371,   372,
     304,   149,   174,   406,   175,   176,   177,   283,   265,   290,
     331,   217,   291,   178,   228,   229,  -213,   179,   332,   180,
     266,   267,   268,   269,   270,   292,  -227,    26,   308,   313,
     248,    96,    97,    98,    99,   181,    79,    80,    81,   101,
     314,   315,   182,   183,   217,   271,   333,   334,   316,    96,
      97,    98,    99,   396,   272,   273,   274,   101,   335,   336,
    -185,   317,   318,   319,   320,   240,   241,   242,   243,   244,
     245,   344,   348,   349,   350,   368,   381,   387,   388,   390,
     397,   249,   398,    96,    97,    98,    99,   181,    79,    80,
      81,   101,   399,   402,   404,   275,   412,   415,    33,   417,
     321,   276,   277,   278,   322,   323,   324,   325,   326,   327,
     328,   329,   330,   416,    96,    97,    98,    99,   100,    79,
      80,    81,   101,    63,    90,   102,   103,   134,   224,   298,
      92,   143,   383,   144,   237,   305,   280,   384,   405,   250,
     227,   138,     0,     0,   307
};

static const short yycheck[] =
{
      20,    46,    86,    59,   156,   157,   235,     9,    10,     4,
       4,    60,     5,     4,     4,    59,   173,     4,   175,   137,
      38,     5,    78,     4,    59,     4,   144,     0,    23,     4,
      59,    59,    27,    29,     4,    30,    83,   121,     4,    88,
     158,   159,   160,    92,    93,    81,    64,    76,    84,    69,
      25,    26,   170,   171,    49,    70,    71,    53,   176,   177,
     144,    63,    83,    54,    54,   109,    62,    69,     4,    64,
      64,   155,    59,    96,   109,   232,    66,    68,    59,   197,
      59,   109,    77,    83,    94,    95,    83,   239,    76,   173,
      90,   175,    10,    88,   246,    88,   248,   249,   182,    92,
      93,   330,   206,   207,    88,    83,     4,   336,    92,    93,
      36,    37,    38,    39,    40,    83,   234,    94,    95,   139,
     349,    90,   206,   207,    96,    83,   146,    24,    83,   247,
      83,   108,   250,    76,    83,    78,    91,     4,   256,   257,
     258,     4,   299,   106,   301,    88,   106,   265,   232,    92,
      93,    59,   106,   271,     4,     4,   274,    83,   276,   277,
     278,    79,    80,    81,    82,   107,    84,    85,    86,    87,
       4,     4,    76,    91,    79,    80,    81,    82,     4,   199,
     332,   333,    87,   110,    88,     4,    91,     8,    92,    93,
     210,   211,    83,    83,   214,    83,   314,   315,   316,   317,
     318,   319,   320,   321,   322,   323,   324,   325,   326,   327,
     328,   329,    84,    85,    86,   299,     4,   301,   375,     4,
      96,   339,    43,    44,    45,    46,    47,    48,   346,   108,
     348,    70,    71,    72,    73,    74,    75,     5,    59,     7,
       8,     9,   106,    11,    12,    13,    14,    15,    16,    17,
     368,   408,   106,    21,    22,    83,   374,    59,   376,   377,
      96,    29,    30,    31,    32,    33,    59,     4,    83,    79,
      80,    81,    82,    41,    84,    85,    86,    87,   334,   335,
     398,    91,    50,   401,    52,    53,    54,    83,   108,    83,
     107,   375,    83,    61,    94,    95,    96,    65,     8,    67,
      16,    17,    18,    19,    20,    83,   106,    83,    83,    83,
       8,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      34,    35,    90,    91,   408,    41,     8,    96,    42,    79,
      80,    81,    82,   378,    50,    51,    52,    87,    96,   106,
     108,    55,    56,    57,    58,    43,    44,    45,    46,    47,
      48,    96,    59,   106,    59,    96,     4,    83,   107,   107,
       4,    59,   108,    79,    80,    81,    82,    83,    84,    85,
      86,    87,   107,     4,     4,    91,     4,     4,    10,    83,
      94,    97,    98,    99,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   413,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    43,    72,    90,    91,   119,   178,   261,
      77,   130,   344,   131,   197,   266,   234,   346,   398,   205,
     182,   121,    -1,    -1,   272
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    23,    27,    30,    49,    64,    77,    88,   112,
     113,   114,   115,   116,   123,   125,   132,   139,    83,   133,
     117,    36,    37,    38,    39,    40,    83,   177,   178,   140,
     124,     4,     0,   114,   126,    83,   177,    83,    83,    76,
      88,    92,    93,   118,   119,   166,   167,   168,     4,    70,
      71,    72,    73,    74,    75,   148,   149,   150,    83,    96,
     149,     4,    78,   119,    64,   120,   121,   168,     4,    25,
      26,   127,   128,   129,   130,   131,     4,    59,    96,    84,
      85,    86,   204,     4,   149,     4,    90,   177,    83,    24,
     129,   134,   150,   204,   141,    76,    79,    80,    81,    82,
      83,    87,    90,    91,   122,   192,   193,   194,   195,   196,
     197,   198,   203,   204,    83,    83,     4,   135,     4,   142,
     106,    59,     4,     4,     5,    88,    92,    93,   136,   138,
     163,   164,   165,     5,   138,   143,   199,   200,   195,   137,
       4,     4,    60,   165,   166,   169,   144,     4,   107,    91,
     198,   201,   202,   203,   177,     5,     7,     8,     9,    11,
      12,    13,    14,    15,    16,    17,    21,    22,    29,    30,
      31,    32,    33,    41,    50,    52,    53,    54,    61,    65,
      67,    83,    90,    91,   145,   157,   159,   170,   179,   181,
     182,   184,   189,   191,   198,   203,   177,   110,    83,   174,
     203,   196,   196,   198,   198,   198,   180,   175,    83,    83,
     171,   172,   198,   198,   173,    91,   191,   203,    81,    84,
     205,   191,   198,   198,   148,     4,     4,   193,    94,    95,
     183,     4,   108,   185,    96,   106,    83,   202,   177,     8,
      43,    44,    45,    46,    47,    48,    59,   190,     8,    59,
     190,   122,   122,   177,   177,   177,    59,    96,    59,     4,
     158,   160,    83,   188,   191,   108,    16,    17,    18,    19,
      20,    41,    50,    51,    52,    91,    97,    98,    99,   176,
     184,   198,   199,    83,   196,   196,   198,   196,   196,   198,
      83,    83,    83,   198,   198,   198,   146,   161,   161,    59,
     109,    10,   186,   187,   198,   178,   198,   205,    83,   198,
     198,   198,   198,    83,    34,    35,    42,    55,    56,    57,
      58,    94,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,     8,     8,    96,    96,   106,   152,     4,    54,
      66,   162,    68,   191,    96,   191,    59,   109,    59,   106,
      59,   198,   198,   198,   198,   198,   198,   198,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   199,    96,   196,
     196,   204,   204,   199,     9,    10,    63,    69,   151,   153,
     198,     4,    91,   182,   187,   198,   199,    83,   107,   198,
     107,   198,   191,   198,   198,   147,   168,     4,   108,   107,
       4,    59,     4,   154,     4,   186,   198,    29,    53,    62,
     155,   109,     4,   156,   191,     4,   177,    83
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
#line 296 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 305 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 306 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 307 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 308 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 309 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 310 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 311 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 312 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 317 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 14:
#line 322 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 329 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 16:
#line 330 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 19:
#line 339 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 20:
#line 340 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 341 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 342 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 345 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 24:
#line 347 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 25:
#line 350 "imcc/imcc.y"
    { char *name = str_dup(yyvsp[0].s);
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(name, 0);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 26:
#line 355 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 28:
#line 363 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 29:
#line 366 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 30:
#line 376 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 31:
#line 383 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 33:
#line 392 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 38:
#line 403 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 39:
#line 408 "imcc/imcc.y"
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
#line 422 "imcc/imcc.y"
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
#line 438 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 42:
#line 443 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 43:
#line 450 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 44:
#line 454 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 45:
#line 455 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 46:
#line 456 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 47:
#line 460 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 48:
#line 461 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 49:
#line 465 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 469 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 51:
#line 471 "imcc/imcc.y"
    {
            char *name = str_dup(yyvsp[-2].s);
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 52:
#line 478 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 482 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 483 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 55:
#line 484 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 56:
#line 488 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 57:
#line 489 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 58:
#line 494 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            r->pcc_sub->pragma = yyvsp[-1].t;
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
#line 519 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 60:
#line 523 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 61:
#line 524 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 62:
#line 528 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 63:
#line 529 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 64:
#line 533 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 65:
#line 534 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 66:
#line 535 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 68:
#line 539 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 69:
#line 540 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 70:
#line 541 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 71:
#line 542 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 72:
#line 547 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
            add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
         }
    break;

  case 73:
#line 552 "imcc/imcc.y"
    {  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr); }
    break;

  case 74:
#line 554 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
            yyvsp[-4].sr ->pcc_sub->nci = 1;
         }
    break;

  case 75:
#line 561 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 76:
#line 562 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 77:
#line 566 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 78:
#line 567 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 79:
#line 571 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 80:
#line 572 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 81:
#line 577 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 82:
#line 578 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 83:
#line 579 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 84:
#line 584 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_return not inside pcc subroutine\n");
            sprintf(name, "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL;
         }
    break;

  case 85:
#line 599 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 86:
#line 604 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_yield not inside pcc subroutine\n");
            ins->r[1]->pcc_sub->calls_a_sub = 1;
            sprintf(name, "%cpcc_sub_yield_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
         }
    break;

  case 87:
#line 620 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 88:
#line 624 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 89:
#line 626 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 90:
#line 628 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 91:
#line 632 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 94:
#line 649 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 95:
#line 654 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 96:
#line 655 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 97:
#line 656 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 98:
#line 657 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 99:
#line 661 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 103:
#line 671 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 104:
#line 679 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 107:
#line 685 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 108:
#line 686 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 109:
#line 687 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 110:
#line 687 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 111:
#line 688 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 112:
#line 689 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 113:
#line 690 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 114:
#line 691 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 115:
#line 692 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 116:
#line 692 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 117:
#line 694 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 118:
#line 695 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 119:
#line 696 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 120:
#line 697 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 121:
#line 698 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 122:
#line 699 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 123:
#line 700 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 124:
#line 701 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 125:
#line 702 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 126:
#line 703 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 127:
#line 704 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 128:
#line 705 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 129:
#line 707 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 130:
#line 709 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 131:
#line 711 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 132:
#line 712 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 135:
#line 715 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 136:
#line 719 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 137:
#line 720 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 138:
#line 721 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 139:
#line 722 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 140:
#line 726 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 141:
#line 727 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 142:
#line 728 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 143:
#line 729 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 144:
#line 730 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 145:
#line 731 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 146:
#line 736 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 147:
#line 744 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 148:
#line 745 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 149:
#line 746 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 150:
#line 747 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 151:
#line 748 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 152:
#line 749 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 153:
#line 750 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 154:
#line 751 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 155:
#line 752 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 753 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 754 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 158:
#line 756 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 758 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 760 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 762 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 764 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 766 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 768 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 770 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 772 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 774 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 168:
#line 776 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 778 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 170:
#line 780 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 171:
#line 782 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 172:
#line 785 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 173:
#line 792 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 794 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 175:
#line 797 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 799 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 177:
#line 802 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 178:
#line 804 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 179:
#line 808 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 180:
#line 810 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 181:
#line 812 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 182:
#line 814 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 183:
#line 817 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 820 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 185:
#line 826 "imcc/imcc.y"
    {
            yyval.i = create_itcall_label();
         }
    break;

  case 186:
#line 830 "imcc/imcc.y"
    {
           itcall_sub(yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 187:
#line 836 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 188:
#line 837 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 189:
#line 841 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 190:
#line 844 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 191:
#line 845 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 192:
#line 850 "imcc/imcc.y"
    {
           yyval.i = create_itcall_label();
           itcall_sub(yyvsp[0].sr);
        }
    break;

  case 193:
#line 855 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 194:
#line 859 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 195:
#line 860 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 196:
#line 861 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 197:
#line 866 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 198:
#line 868 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 199:
#line 872 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 200:
#line 873 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 201:
#line 878 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 880 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 882 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 884 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 886 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 888 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 892 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 208:
#line 893 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 209:
#line 894 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 210:
#line 895 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 211:
#line 896 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 212:
#line 897 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 217:
#line 911 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 218:
#line 912 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 219:
#line 916 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 221:
#line 921 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 222:
#line 923 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 223:
#line 931 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 224:
#line 932 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 230:
#line 946 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 231:
#line 947 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 232:
#line 951 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 233:
#line 953 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 235:
#line 961 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 236:
#line 962 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 237:
#line 963 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 238:
#line 964 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 239:
#line 965 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 240:
#line 969 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 241:
#line 970 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 242:
#line 971 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 243:
#line 975 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 244:
#line 976 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2974 "imcc/imcparser.c"

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


#line 981 "imcc/imcc.y"



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

