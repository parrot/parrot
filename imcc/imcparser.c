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
     DOT_METHOD = 280,
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
     METHOD = 330,
     LABEL = 331,
     EMIT = 332,
     EOM = 333,
     IREG = 334,
     NREG = 335,
     SREG = 336,
     PREG = 337,
     IDENTIFIER = 338,
     STRINGC = 339,
     INTC = 340,
     FLOATC = 341,
     REG = 342,
     MACRO = 343,
     ENDM = 344,
     PARROT_OP = 345,
     VAR = 346,
     LINECOMMENT = 347,
     FILECOMMENT = 348,
     POINTY = 349
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
#define DOT_METHOD 280
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
#define METHOD 330
#define LABEL 331
#define EMIT 332
#define EOM 333
#define IREG 334
#define NREG 335
#define SREG 336
#define PREG 337
#define IDENTIFIER 338
#define STRINGC 339
#define INTC 340
#define FLOATC 341
#define REG 342
#define MACRO 343
#define ENDM 344
#define PARROT_OP 345
#define VAR 346
#define LINECOMMENT 347
#define FILECOMMENT 348
#define POINTY 349




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
SymReg *cur_namespace; /* ugly hack for mk_address */

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
#line 227 "imcc/imcc.y"
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
#line 497 "imcc/imcparser.c"
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
#line 518 "imcc/imcparser.c"

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
#define YYFINAL  35
#define YYLAST   494

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  112
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  96
/* YYNRULES -- Number of rules. */
#define YYNRULES  250
/* YYNRULES -- Number of states. */
#define YYNSTATES  427

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   349

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   100,     2,     2,     2,   106,   107,     2,
     109,   110,   104,   103,     2,   101,    95,   105,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   111,
       2,    97,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    98,     2,    99,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   108,     2,   102,     2,     2,     2,
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
      86,    87,    88,    89,    90,    91,    92,    93,    94,    96
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    24,    27,    29,    33,    39,    40,    47,    49,
      52,    56,    59,    61,    63,    65,    66,    70,    74,    75,
      77,    78,    83,    88,    89,    96,    98,    99,   101,   104,
     106,   108,   110,   115,   120,   121,   122,   131,   132,   134,
     138,   139,   144,   147,   148,   149,   158,   159,   161,   165,
     166,   171,   172,   182,   183,   186,   188,   190,   191,   195,
     197,   199,   201,   203,   205,   207,   209,   215,   219,   223,
     224,   228,   231,   234,   235,   239,   242,   243,   248,   249,
     255,   256,   262,   263,   266,   270,   273,   275,   278,   279,
     282,   285,   287,   289,   290,   292,   295,   297,   299,   303,
     305,   307,   310,   313,   314,   319,   320,   327,   328,   335,
     336,   341,   344,   347,   350,   353,   356,   359,   362,   365,
     367,   369,   371,   372,   376,   379,   381,   383,   385,   387,
     388,   390,   392,   394,   396,   398,   400,   402,   404,   406,
     408,   410,   414,   419,   424,   429,   435,   441,   447,   453,
     459,   465,   471,   477,   483,   489,   495,   501,   507,   513,
     519,   525,   532,   539,   546,   551,   556,   563,   568,   576,
     581,   586,   591,   596,   597,   601,   606,   614,   619,   623,
     624,   634,   636,   638,   642,   646,   650,   652,   654,   655,
     661,   662,   666,   668,   670,   673,   677,   679,   686,   693,
     698,   703,   708,   713,   715,   717,   719,   721,   723,   725,
     727,   729,   731,   733,   734,   736,   740,   742,   744,   749,
     751,   753,   755,   757,   759,   761,   763,   764,   767,   769,
     773,   775,   777,   779,   781,   783,   785,   787,   789,   791,
     793
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     113,     0,    -1,   114,    -1,   115,    -1,   114,   115,    -1,
     127,    -1,   126,    -1,   117,    -1,   116,    -1,   134,    -1,
     141,    -1,   124,    -1,    89,     4,    -1,     4,    -1,    49,
     179,    84,    -1,    49,   179,    84,    97,   206,    -1,    -1,
      30,   118,   179,    84,    97,   206,    -1,   120,    -1,   119,
     120,    -1,   168,   121,     4,    -1,    89,     4,    -1,    94,
      -1,    93,    -1,   126,    -1,    -1,   122,    91,   123,    -1,
      64,   151,    77,    -1,    -1,   195,    -1,    -1,    78,   125,
     119,    79,    -1,    21,    98,   201,    99,    -1,    -1,    23,
      84,   128,     4,   129,    24,    -1,   130,    -1,    -1,   131,
      -1,   130,   131,    -1,   132,    -1,   133,    -1,     4,    -1,
      25,   179,    84,     4,    -1,    26,    84,    84,     4,    -1,
      -1,    -1,    27,   135,    84,   151,     4,   136,   137,   140,
      -1,    -1,     4,    -1,   137,   138,     4,    -1,    -1,     5,
     139,   179,    84,    -1,   165,    60,    -1,    -1,    -1,    64,
     142,    84,   151,     4,   143,   144,   140,    -1,    -1,     4,
      -1,   144,   145,     4,    -1,    -1,     5,   146,   179,    84,
      -1,    -1,    61,   150,     4,   148,   154,   153,   149,   156,
      62,    -1,    -1,   170,     4,    -1,    70,    -1,    71,    -1,
      -1,   151,    59,   152,    -1,   152,    -1,   150,    -1,    73,
      -1,    72,    -1,    74,    -1,    75,    -1,    76,    -1,    63,
     200,    59,   200,     4,    -1,    63,   200,     4,    -1,    69,
     200,     4,    -1,    -1,   154,   155,     4,    -1,     9,   200,
      -1,    10,   193,    -1,    -1,   156,   157,     4,    -1,    53,
     193,    -1,    -1,    29,   158,   179,    84,    -1,    -1,    65,
       4,   160,   163,    66,    -1,    -1,    67,     4,   162,   163,
      68,    -1,    -1,   163,     4,    -1,   163,   164,     4,    -1,
      54,   200,    -1,   167,    -1,   165,   167,    -1,    -1,   166,
     171,    -1,    89,     4,    -1,    94,    -1,    93,    -1,    -1,
     169,    -1,   169,   170,    -1,   170,    -1,    77,    -1,   168,
     172,     4,    -1,   181,    -1,   191,    -1,    21,    84,    -1,
      22,    84,    -1,    -1,    29,   173,   179,    84,    -1,    -1,
      30,   174,   179,    84,    97,   206,    -1,    -1,    33,   175,
     179,    84,    97,   206,    -1,    -1,     5,   176,   179,    84,
      -1,     5,   205,    -1,    53,   200,    -1,     9,   200,    -1,
      54,   200,    -1,     7,   198,    -1,     8,   198,    -1,    31,
     200,    -1,    32,   200,    -1,    14,    -1,    15,    -1,    13,
      -1,    -1,    17,   177,   123,    -1,    91,   195,    -1,   186,
      -1,   147,    -1,   159,    -1,   161,    -1,    -1,    17,    -1,
      18,    -1,    19,    -1,    20,    -1,    36,    -1,    37,    -1,
      38,    -1,    39,    -1,    40,    -1,   180,    -1,    84,    -1,
     193,    97,   200,    -1,   193,    97,   100,   200,    -1,   193,
      97,   101,   200,    -1,   193,    97,   102,   200,    -1,   193,
      97,   200,   103,   200,    -1,   193,    97,   200,   101,   200,
      -1,   193,    97,   200,   104,   200,    -1,   193,    97,   200,
      55,   200,    -1,   193,    97,   200,   105,   200,    -1,   193,
      97,   200,   106,   200,    -1,   193,    97,   200,    95,   200,
      -1,   193,    97,   200,    34,   200,    -1,   193,    97,   200,
      35,   200,    -1,   193,    97,   200,    56,   200,    -1,   193,
      97,   200,    57,   200,    -1,   193,    97,   200,    58,   200,
      -1,   193,    97,   200,    42,   200,    -1,   193,    97,   200,
     107,   200,    -1,   193,    97,   200,   108,   200,    -1,   193,
      97,   200,   102,   200,    -1,   193,    97,   200,    98,   201,
      99,    -1,   200,    98,   201,    99,    97,   200,    -1,   193,
      97,    16,   180,    59,   200,    -1,   193,    97,    16,   180,
      -1,   193,    97,   178,    84,    -1,   193,    97,   178,    84,
      59,    84,    -1,   193,    97,    41,   200,    -1,   193,    97,
      41,   200,    98,   201,    99,    -1,   193,    97,    52,   200,
      -1,   193,    97,    51,    84,    -1,   193,    97,    50,   207,
      -1,    50,   207,    97,   200,    -1,    -1,    16,   182,   123,
      -1,    41,   193,    59,   200,    -1,    41,   193,    59,   200,
      98,   201,    99,    -1,    52,   193,    59,   200,    -1,   193,
      97,   186,    -1,    -1,   183,   109,   190,   110,    97,   184,
     109,   188,   110,    -1,    84,    -1,    92,    -1,    92,   185,
      84,    -1,    92,   185,    85,    -1,    92,   185,   193,    -1,
      96,    -1,    95,    -1,    -1,   184,   187,   109,   188,   110,
      -1,    -1,   188,    59,   189,    -1,   189,    -1,   200,    -1,
      10,   193,    -1,   190,    59,   193,    -1,   193,    -1,    11,
     200,   192,   200,     8,   198,    -1,    12,   200,   192,   200,
       8,   198,    -1,    11,   200,     8,   198,    -1,    12,   200,
       8,   198,    -1,    11,   200,    59,   198,    -1,    12,   200,
      59,   198,    -1,    43,    -1,    44,    -1,    45,    -1,    46,
      -1,    47,    -1,    48,    -1,    92,    -1,   205,    -1,    92,
      -1,   205,    -1,    -1,   196,    -1,   196,    59,   197,    -1,
     197,    -1,   199,    -1,   194,    98,   201,    99,    -1,    84,
      -1,    91,    -1,   198,    -1,   200,    -1,    92,    -1,   205,
      -1,   206,    -1,    -1,   202,   203,    -1,   204,    -1,   203,
     111,   204,    -1,   200,    -1,    80,    -1,    81,    -1,    82,
      -1,    83,    -1,    88,    -1,    86,    -1,    87,    -1,    85,
      -1,    82,    -1,    85,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   296,   296,   300,   302,   305,   307,   308,   309,   310,
     311,   312,   313,   314,   317,   323,   331,   330,   335,   337,
     340,   342,   343,   344,   345,   348,   348,   352,   359,   362,
     367,   366,   378,   387,   385,   401,   403,   406,   408,   411,
     413,   414,   417,   431,   449,   454,   447,   464,   466,   467,
     471,   470,   475,   480,   482,   479,   492,   494,   495,   499,
     498,   505,   503,   533,   535,   538,   540,   543,   545,   546,
     549,   550,   551,   552,   553,   554,   557,   563,   565,   572,
     574,   577,   579,   582,   584,   587,   590,   590,   596,   594,
     616,   614,   635,   637,   639,   643,   647,   649,   660,   664,
     667,   668,   669,   672,   674,   677,   679,   682,   689,   694,
     696,   697,   698,   699,   699,   700,   700,   702,   702,   704,
     704,   706,   707,   708,   709,   710,   711,   712,   713,   714,
     715,   716,   717,   717,   720,   723,   724,   725,   726,   727,
     730,   732,   733,   734,   737,   739,   740,   741,   742,   743,
     746,   755,   757,   758,   759,   760,   761,   762,   763,   764,
     765,   766,   767,   769,   771,   773,   775,   777,   779,   781,
     783,   785,   787,   789,   791,   793,   796,   803,   805,   808,
     810,   813,   815,   820,   819,   823,   825,   828,   831,   838,
     837,   848,   849,   853,   854,   855,   858,   859,   864,   862,
     872,   874,   875,   878,   881,   885,   887,   890,   893,   895,
     897,   899,   901,   905,   907,   908,   909,   910,   911,   914,
     916,   919,   921,   924,   926,   929,   931,   934,   936,   944,
     946,   949,   951,   954,   956,   957,   960,   960,   964,   966,
     970,   974,   976,   977,   978,   979,   982,   984,   985,   988,
     990
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
  "NAMESPACE", "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "DOT_METHOD", 
  "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", 
  "OBJECTV", "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", 
  "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", 
  "CLONE", "RESULT", "RETURN", "POW", "SHIFT_RIGHT_U", "LOG_AND", 
  "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", "PCC_END", "PCC_CALL", 
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "PROTOTYPED", "NON_PROTOTYPED", "MAIN", 
  "LOAD", "IMMEDIATE", "POSTCOMP", "METHOD", "LABEL", "EMIT", "EOM", 
  "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "STRINGC", "INTC", 
  "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", "LINECOMMENT", 
  "FILECOMMENT", "'.'", "POINTY", "'='", "'['", "']'", "'!'", "'-'", 
  "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "'('", "')'", "';'", 
  "$accept", "program", "compilation_units", "compilation_unit", "global", 
  "constdef", "@1", "pasmcode", "pasmline", "pasm_inst", "@2", 
  "pasm_args", "emit", "@3", "class_namespace", "class", "@4", 
  "class_body", "member_decls", "member_decl", "field_decl", 
  "method_decl", "sub", "@5", "@6", "sub_params", "sub_param", "@7", 
  "sub_body", "pcc_sub", "@8", "@9", "pcc_params", "pcc_param", "@10", 
  "pcc_sub_call", "@11", "opt_label", "pcc_proto", "pcc_sub_proto", 
  "proto", "pcc_call", "pcc_args", "pcc_arg", "pcc_results", "pcc_result", 
  "@12", "pcc_ret", "@13", "pcc_yield", "@14", "pcc_returns", 
  "pcc_return", "statements", "helper_clear_state", "statement", "labels", 
  "_labels", "label", "instruction", "labeled_inst", "@15", "@16", "@17", 
  "@18", "@19", "newsub", "type", "classname", "assignment", "@20", "@21", 
  "the_sub", "ptr", "sub_call", "@22", "arglist", "arg", "targetlist", 
  "if_statement", "relop", "target", "lhs", "vars", "_vars", "_var_or_i", 
  "label_op", "var_or_i", "var", "keylist", "@23", "_keylist", "key", 
  "reg", "const", "string", 0
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
     344,   345,   346,   347,   348,    46,   349,    61,    91,    93,
      33,    45,   126,    43,    42,    47,    37,    38,   124,    40,
      41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   112,   113,   114,   114,   115,   115,   115,   115,   115,
     115,   115,   115,   115,   116,   116,   118,   117,   119,   119,
     120,   120,   120,   120,   120,   122,   121,   121,   121,   123,
     125,   124,   126,   128,   127,   129,   129,   130,   130,   131,
     131,   131,   132,   133,   135,   136,   134,   137,   137,   137,
     139,   138,   140,   142,   143,   141,   144,   144,   144,   146,
     145,   148,   147,   149,   149,   150,   150,   151,   151,   151,
     152,   152,   152,   152,   152,   152,   153,   153,   153,   154,
     154,   155,   155,   156,   156,   157,   158,   157,   160,   159,
     162,   161,   163,   163,   163,   164,   165,   165,   166,   167,
     167,   167,   167,   168,   168,   169,   169,   170,   171,   172,
     172,   172,   172,   173,   172,   174,   172,   175,   172,   176,
     172,   172,   172,   172,   172,   172,   172,   172,   172,   172,
     172,   172,   177,   172,   172,   172,   172,   172,   172,   172,
     178,   178,   178,   178,   179,   179,   179,   179,   179,   179,
     180,   181,   181,   181,   181,   181,   181,   181,   181,   181,
     181,   181,   181,   181,   181,   181,   181,   181,   181,   181,
     181,   181,   181,   181,   181,   181,   181,   181,   181,   181,
     181,   181,   181,   182,   181,   181,   181,   181,   181,   183,
     181,   184,   184,   184,   184,   184,   185,   185,   187,   186,
     188,   188,   188,   189,   189,   190,   190,   191,   191,   191,
     191,   191,   191,   192,   192,   192,   192,   192,   192,   193,
     193,   194,   194,   195,   195,   196,   196,   197,   197,   198,
     198,   199,   199,   200,   200,   200,   202,   201,   203,   203,
     204,   205,   205,   205,   205,   205,   206,   206,   206,   207,
     207
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     3,     5,     0,     6,     1,     2,
       3,     2,     1,     1,     1,     0,     3,     3,     0,     1,
       0,     4,     4,     0,     6,     1,     0,     1,     2,     1,
       1,     1,     4,     4,     0,     0,     8,     0,     1,     3,
       0,     4,     2,     0,     0,     8,     0,     1,     3,     0,
       4,     0,     9,     0,     2,     1,     1,     0,     3,     1,
       1,     1,     1,     1,     1,     1,     5,     3,     3,     0,
       3,     2,     2,     0,     3,     2,     0,     4,     0,     5,
       0,     5,     0,     2,     3,     2,     1,     2,     0,     2,
       2,     1,     1,     0,     1,     2,     1,     1,     3,     1,
       1,     2,     2,     0,     4,     0,     6,     0,     6,     0,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     1,
       1,     1,     0,     3,     2,     1,     1,     1,     1,     0,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     4,     4,     4,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     6,     6,     6,     4,     4,     6,     4,     7,     4,
       4,     4,     4,     0,     3,     4,     7,     4,     3,     0,
       9,     1,     1,     3,     3,     3,     1,     1,     0,     5,
       0,     3,     1,     1,     2,     3,     1,     6,     6,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     1,     3,     1,     1,     4,     1,
       1,     1,     1,     1,     1,     1,     0,     2,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,    13,     0,     0,    44,    16,     0,    53,    30,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     236,    33,     0,     0,   144,   145,   146,   147,   148,   150,
       0,   149,     0,   103,    12,     1,     4,     0,     0,     0,
      67,     0,    14,    67,   107,     0,    23,    22,   103,    18,
      24,    25,   104,   106,    32,   241,   242,   243,   244,   248,
     246,   247,   245,   233,   240,   237,   238,   234,   235,    36,
      65,    66,    72,    71,    73,    74,    75,    70,     0,    69,
       0,     0,     0,    21,    31,    19,    67,     0,     0,   105,
       0,    41,     0,     0,     0,    35,    37,    39,    40,    45,
       0,     0,    15,    54,     0,    20,   223,   239,     0,     0,
      34,    38,    47,    68,    17,    56,    27,   229,   230,   233,
      26,     0,    29,   224,   226,   231,   227,   232,   234,     0,
       0,    48,    98,    57,    98,   236,     0,    42,    43,    50,
       0,   102,   101,     0,    46,    98,   103,    96,    59,    55,
       0,     0,   225,     0,   100,    49,    52,    97,   139,    99,
       0,    58,   228,     0,   119,     0,     0,     0,     0,     0,
     131,   129,   130,   183,   132,     0,     0,   113,   115,     0,
       0,   117,     0,     0,     0,     0,     0,     0,     0,     0,
     191,   223,   192,   136,   137,   138,     0,   109,     0,   198,
     135,   110,     0,     0,   220,     0,    51,     0,   121,   125,
     126,   123,     0,     0,   223,   223,   111,   112,     0,     0,
     127,   128,     0,   219,     0,   220,   249,   250,     0,     0,
     122,   124,     0,    88,    90,   134,   197,   196,     0,   108,
       0,     0,     0,   236,    60,     0,     0,   213,   214,   215,
     216,   217,   218,     0,     0,     0,     0,     0,   184,   133,
       0,     0,     0,     0,     0,     0,    61,    92,    92,   193,
     194,   195,     0,   206,   200,     0,   140,   141,   142,   143,
       0,     0,     0,     0,   233,     0,     0,     0,     0,   188,
     151,     0,   120,   209,   211,     0,   210,   212,     0,   114,
       0,     0,   185,   182,   187,    79,     0,     0,     0,     0,
       0,     0,   202,   203,   174,   177,   181,   180,   179,   152,
     153,   154,   175,     0,     0,     0,     0,     0,     0,     0,
       0,   236,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   236,     0,    93,     0,    89,
       0,    91,   205,     0,   204,     0,   199,     0,   236,     0,
     162,   163,   167,   158,   164,   165,   166,   161,     0,   156,
     170,   155,   157,   159,   160,   168,   169,     0,   207,   208,
     116,   118,     0,     0,     0,     0,     0,    63,     0,    95,
      94,   192,     0,   201,   173,     0,   176,   171,   172,   186,
      81,    82,     0,     0,    83,     0,    80,   200,   178,    77,
       0,    78,     0,    64,     0,     0,    86,     0,    62,     0,
     190,    76,     0,    85,    84,     0,    87
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    48,    49,    87,
      88,   120,    15,    33,    16,    17,    39,    94,    95,    96,
      97,    98,    18,    22,   112,   132,   143,   153,   144,    19,
      32,   115,   134,   150,   160,   193,   305,   404,    77,    78,
      79,   387,   346,   388,   412,   419,   422,   194,   267,   195,
     268,   306,   350,   145,   146,   147,    51,    52,    53,   159,
     196,   218,   219,   222,   207,   215,   288,    30,    31,   197,
     214,   198,   199,   238,   200,   241,   311,   312,   272,   201,
     254,   202,   121,   122,   123,   124,   125,   126,   127,    37,
      38,    65,    66,    67,    68,   228
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -163
static const short yypact[] =
{
      40,  -163,   -85,   -42,  -163,  -163,   128,  -163,  -163,    51,
      47,    40,  -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,
    -163,  -163,   -19,   128,  -163,  -163,  -163,  -163,  -163,  -163,
      -9,  -163,    29,    16,  -163,  -163,  -163,     0,   389,   107,
     234,    32,    38,   234,  -163,   132,  -163,  -163,    -6,  -163,
    -163,    13,    62,  -163,  -163,  -163,  -163,  -163,  -163,  -163,
    -163,  -163,  -163,  -163,  -163,    30,  -163,  -163,  -163,    15,
    -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,     3,  -163,
      45,    34,    20,  -163,  -163,  -163,   234,   141,    56,  -163,
     389,  -163,   128,    76,   131,    15,  -163,  -163,  -163,  -163,
     234,    34,  -163,  -163,   -48,  -163,   106,  -163,    77,    78,
    -163,  -163,   175,  -163,  -163,   178,  -163,  -163,  -163,   102,
    -163,   109,  -163,   152,  -163,  -163,  -163,  -163,   116,   211,
     212,  -163,     7,  -163,     9,  -163,   106,  -163,  -163,  -163,
     213,  -163,  -163,   216,  -163,   -44,    62,  -163,  -163,  -163,
     219,   125,  -163,   128,  -163,  -163,  -163,  -163,   348,  -163,
     128,  -163,  -163,   142,    95,   -59,   -59,   389,   389,   389,
    -163,  -163,  -163,  -163,  -163,   146,   147,  -163,  -163,   389,
     389,  -163,   121,   -26,   121,   389,   389,    37,   221,   229,
    -163,   106,    28,  -163,  -163,  -163,   231,  -163,   127,  -163,
    -163,  -163,   140,   143,   144,   155,  -163,   128,  -163,  -163,
    -163,  -163,   126,   226,   106,   106,  -163,  -163,   128,   128,
    -163,  -163,   128,  -163,   181,  -163,  -163,  -163,   148,   184,
    -163,  -163,   242,  -163,  -163,  -163,  -163,  -163,   402,  -163,
     121,   139,   366,  -163,  -163,   168,   -59,  -163,  -163,  -163,
    -163,  -163,  -163,   -59,   389,   -59,   -59,   389,  -163,  -163,
     169,   170,   172,   389,   389,   389,  -163,  -163,  -163,  -163,
    -163,  -163,   -38,  -163,    71,   173,  -163,  -163,  -163,  -163,
     389,   -26,   174,   389,   -61,   389,   389,   389,   177,  -163,
     225,   163,  -163,  -163,  -163,   255,  -163,  -163,   256,  -163,
     171,   179,   180,  -163,  -163,  -163,    14,     6,   121,   182,
     121,   -20,  -163,  -163,   218,   188,  -163,  -163,  -163,  -163,
    -163,  -163,   236,   389,   389,   389,   389,   389,   389,   389,
     389,  -163,   389,   389,   389,   389,   389,   389,   389,   389,
     214,   -59,   -59,    34,    34,  -163,    43,  -163,   389,  -163,
     271,  -163,  -163,   -54,  -163,    71,  -163,   389,  -163,   230,
    -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,   217,  -163,
    -163,  -163,  -163,  -163,  -163,  -163,  -163,   389,  -163,  -163,
    -163,  -163,   223,   389,   121,   389,   389,    62,   309,  -163,
    -163,   -69,   206,  -163,  -163,   235,  -163,  -163,  -163,  -163,
    -163,  -163,    27,   314,  -163,   320,  -163,    71,  -163,  -163,
     389,  -163,     4,  -163,   -13,   321,  -163,   121,  -163,   331,
    -163,  -163,   128,  -163,  -163,   253,  -163
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -163,  -163,  -163,   327,  -163,  -163,  -163,  -163,   291,  -163,
    -163,   -87,  -163,  -163,    -5,  -163,  -163,  -163,  -163,   245,
    -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,   208,  -163,
    -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,   156,   -35,
     244,  -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,
    -163,    80,  -163,  -163,  -163,   200,   205,  -163,   -51,  -163,
    -163,  -163,  -163,  -163,  -163,  -163,  -163,   -23,    79,  -163,
    -163,  -163,    -7,  -163,   110,  -163,   -49,    11,  -163,  -163,
     154,  -162,  -163,   185,  -163,   232,  -161,  -163,   -36,  -126,
    -163,  -163,   282,  -100,   -78,    92
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -235
static const short yytable[] =
{
      41,    89,    64,   102,   209,   210,   128,    99,    82,   151,
     347,   100,   139,    20,   148,     2,   156,   -28,   347,    91,
     224,   308,   229,   114,   103,   117,   236,   237,    50,   116,
     190,   409,   118,   416,   236,   237,   128,     2,   391,   355,
      92,    93,    21,    50,     1,   140,   355,    35,  -192,   141,
     142,   104,   383,   384,    64,    34,   226,   417,   204,   227,
     348,     2,   100,     3,   208,    40,   418,     4,   348,   108,
       5,    44,   309,    84,   351,    42,   271,    86,   273,   100,
     349,   310,   225,    45,   225,   293,   410,    46,    47,     6,
     356,   128,   294,    44,   296,   297,   140,   420,   140,    54,
     141,   142,   141,   142,     7,    45,   385,    70,    71,    46,
      47,    69,   386,    43,   128,   128,    80,   291,     8,    59,
      60,    61,   203,   236,   237,  -219,  -233,   258,   259,     9,
     163,   211,   212,   213,   246,    81,    83,   205,   225,    44,
     225,    90,   101,   220,   221,   105,   352,   106,   354,   230,
     231,    55,    56,    57,    58,   110,    59,    60,    61,    62,
     109,   129,   130,    63,    24,    25,    26,    27,    28,   247,
     248,   249,   250,   251,   252,    55,    56,    57,    58,   131,
     378,   379,   133,    62,   245,   253,    55,    56,    57,    58,
     117,    59,    60,    61,    62,   260,   261,   118,   119,   262,
    -221,    55,    56,    57,    58,   368,   290,   135,   225,    62,
     225,   136,    29,   223,  -222,   137,   138,   154,   295,   382,
     155,   298,   401,   161,   162,   233,   206,   302,   303,   304,
     216,   217,   395,   234,   255,   239,   240,   242,   313,   244,
     263,   243,  -234,   265,   315,   264,   266,   318,   274,   319,
     320,   321,   292,   299,   300,   423,   301,    29,   317,   323,
     324,   322,   340,   341,   342,   380,   381,   325,   343,   247,
     248,   249,   250,   251,   252,   390,   344,   357,   345,   353,
     326,   327,   328,   329,   225,   256,   358,   360,   361,   362,
     363,   364,   365,   366,   367,   359,   369,   370,   371,   372,
     373,   374,   375,   376,    70,    71,    72,    73,    74,    75,
      76,   377,   389,   406,   396,   407,   397,   225,   411,   313,
     330,   394,   399,   331,   413,   421,   332,   333,   334,   335,
     336,   337,   338,   339,   408,   424,   405,   426,    36,    85,
     111,   398,   149,   232,   113,   157,   392,   400,   307,   402,
     403,   158,   289,   164,   314,   165,   166,   167,   414,   168,
     169,   170,   171,   172,   173,   174,   393,   257,   152,   175,
     176,   313,   107,   316,   415,     0,   235,   177,   178,   179,
     180,   181,   275,   276,   277,   278,   279,     0,     0,   182,
       0,     0,     0,     0,     0,     0,     0,     0,   183,   425,
     184,   185,   186,     0,     0,     0,     0,   280,     0,   187,
       0,     0,     0,   188,     0,   189,   281,   282,   283,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    55,    56,
      57,    58,   190,    59,    60,    61,    62,     0,     0,   191,
     192,     0,     0,     0,     0,     0,    55,    56,    57,    58,
     190,    59,    60,    61,    62,     0,     0,  -189,   284,     0,
       0,     0,     0,     0,     0,     0,   285,   286,   287,    55,
      56,    57,    58,     0,    59,    60,    61,    62,     0,     0,
       0,    63,    55,    56,    57,    58,   269,   270,     0,     0,
      62,     0,     0,     0,   223
};

static const short yycheck[] =
{
      23,    52,    38,    81,   165,   166,   106,     4,    43,   135,
       4,    59,     5,    98,     5,    21,    60,     4,     4,     4,
     182,    59,   184,   101,     4,    84,    95,    96,    33,    77,
      84,     4,    91,    29,    95,    96,   136,    21,    92,    59,
      25,    26,    84,    48,     4,    89,    59,     0,   109,    93,
      94,    86,     9,    10,    90,     4,    82,    53,   158,    85,
      54,    21,    59,    23,   164,    84,    62,    27,    54,    92,
      30,    77,   110,    79,    68,    84,   238,    64,   240,    59,
      66,    10,   182,    89,   184,   246,    59,    93,    94,    49,
     110,   191,   253,    77,   255,   256,    89,   110,    89,    99,
      93,    94,    93,    94,    64,    89,    63,    70,    71,    93,
      94,     4,    69,    84,   214,   215,    84,   243,    78,    85,
      86,    87,   158,    95,    96,    97,    98,   214,   215,    89,
     153,   167,   168,   169,     8,    97,     4,   160,   238,    77,
     240,   111,    97,   179,   180,     4,   308,    91,   310,   185,
     186,    80,    81,    82,    83,    24,    85,    86,    87,    88,
      84,    84,    84,    92,    36,    37,    38,    39,    40,    43,
      44,    45,    46,    47,    48,    80,    81,    82,    83,     4,
     341,   342,     4,    88,   207,    59,    80,    81,    82,    83,
      84,    85,    86,    87,    88,   218,   219,    91,    92,   222,
      98,    80,    81,    82,    83,   331,   242,    98,   308,    88,
     310,    59,    84,    92,    98,     4,     4,     4,   254,   345,
       4,   257,   384,     4,    99,     4,    84,   263,   264,   265,
      84,    84,   358,     4,     8,     4,   109,    97,   274,    84,
      59,    98,    98,    59,   280,    97,     4,   283,   109,   285,
     286,   287,    84,    84,    84,   417,    84,    84,    84,    34,
      35,    84,    99,     8,     8,   343,   344,    42,    97,    43,
      44,    45,    46,    47,    48,     4,    97,    59,    98,    97,
      55,    56,    57,    58,   384,    59,    98,   323,   324,   325,
     326,   327,   328,   329,   330,    59,   332,   333,   334,   335,
     336,   337,   338,   339,    70,    71,    72,    73,    74,    75,
      76,    97,   348,     4,    84,   109,    99,   417,     4,   355,
      95,   357,    99,    98,     4,     4,   101,   102,   103,   104,
     105,   106,   107,   108,    99,     4,   387,    84,    11,    48,
      95,   377,   134,   187,   100,   145,   353,   383,   268,   385,
     386,   146,   242,     5,   275,     7,     8,     9,   407,    11,
      12,    13,    14,    15,    16,    17,   355,   213,   136,    21,
      22,   407,    90,   281,   410,    -1,   191,    29,    30,    31,
      32,    33,    16,    17,    18,    19,    20,    -1,    -1,    41,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    50,   422,
      52,    53,    54,    -1,    -1,    -1,    -1,    41,    -1,    61,
      -1,    -1,    -1,    65,    -1,    67,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    -1,    -1,    91,
      92,    -1,    -1,    -1,    -1,    -1,    80,    81,    82,    83,
      84,    85,    86,    87,    88,    -1,    -1,   109,    92,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,   101,   102,    80,
      81,    82,    83,    -1,    85,    86,    87,    88,    -1,    -1,
      -1,    92,    80,    81,    82,    83,    84,    85,    -1,    -1,
      88,    -1,    -1,    -1,    92
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    49,    64,    78,    89,
     113,   114,   115,   116,   117,   124,   126,   127,   134,   141,
      98,    84,   135,   118,    36,    37,    38,    39,    40,    84,
     179,   180,   142,   125,     4,     0,   115,   201,   202,   128,
      84,   179,    84,    84,    77,    89,    93,    94,   119,   120,
     126,   168,   169,   170,    99,    80,    81,    82,    83,    85,
      86,    87,    88,    92,   200,   203,   204,   205,   206,     4,
      70,    71,    72,    73,    74,    75,    76,   150,   151,   152,
      84,    97,   151,     4,    79,   120,    64,   121,   122,   170,
     111,     4,    25,    26,   129,   130,   131,   132,   133,     4,
      59,    97,   206,     4,   151,     4,    91,   204,   179,    84,
      24,   131,   136,   152,   206,   143,    77,    84,    91,    92,
     123,   194,   195,   196,   197,   198,   199,   200,   205,    84,
      84,     4,   137,     4,   144,    98,    59,     4,     4,     5,
      89,    93,    94,   138,   140,   165,   166,   167,     5,   140,
     145,   201,   197,   139,     4,     4,    60,   167,   168,   171,
     146,     4,    99,   179,     5,     7,     8,     9,    11,    12,
      13,    14,    15,    16,    17,    21,    22,    29,    30,    31,
      32,    33,    41,    50,    52,    53,    54,    61,    65,    67,
      84,    91,    92,   147,   159,   161,   172,   181,   183,   184,
     186,   191,   193,   200,   205,   179,    84,   176,   205,   198,
     198,   200,   200,   200,   182,   177,    84,    84,   173,   174,
     200,   200,   175,    92,   193,   205,    82,    85,   207,   193,
     200,   200,   150,     4,     4,   195,    95,    96,   185,     4,
     109,   187,    97,    98,    84,   179,     8,    43,    44,    45,
      46,    47,    48,    59,   192,     8,    59,   192,   123,   123,
     179,   179,   179,    59,    97,    59,     4,   160,   162,    84,
      85,   193,   190,   193,   109,    16,    17,    18,    19,    20,
      41,    50,    51,    52,    92,   100,   101,   102,   178,   186,
     200,   201,    84,   198,   198,   200,   198,   198,   200,    84,
      84,    84,   200,   200,   200,   148,   163,   163,    59,   110,
      10,   188,   189,   200,   180,   200,   207,    84,   200,   200,
     200,   200,    84,    34,    35,    42,    55,    56,    57,    58,
      95,    98,   101,   102,   103,   104,   105,   106,   107,   108,
      99,     8,     8,    97,    97,    98,   154,     4,    54,    66,
     164,    68,   193,    97,   193,    59,   110,    59,    98,    59,
     200,   200,   200,   200,   200,   200,   200,   200,   201,   200,
     200,   200,   200,   200,   200,   200,   200,    97,   198,   198,
     206,   206,   201,     9,    10,    63,    69,   153,   155,   200,
       4,    92,   184,   189,   200,   201,    84,    99,   200,    99,
     200,   193,   200,   200,   149,   170,     4,   109,    99,     4,
      59,     4,   156,     4,   188,   200,    29,    53,    62,   157,
     110,     4,   158,   193,     4,   179,    84
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
#line 297 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 306 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 307 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 308 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 309 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 310 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 311 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 312 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 313 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 314 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 319 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 324 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 331 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 332 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 20:
#line 341 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 342 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 343 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 344 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 345 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 25:
#line 348 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 26:
#line 350 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 27:
#line 353 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, yyval.i->r[1]);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 28:
#line 359 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 30:
#line 367 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 31:
#line 370 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 32:
#line 379 "imcc/imcc.y"
    { yyval.i=0;
                                 IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                                 cur_namespace = yyvsp[-1].sr;
                                 }
    break;

  case 33:
#line 387 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 34:
#line 394 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 36:
#line 403 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 41:
#line 414 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 42:
#line 419 "imcc/imcc.y"
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

  case 43:
#line 433 "imcc/imcc.y"
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

  case 44:
#line 449 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 45:
#line 454 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, i->r[1]);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 46:
#line 461 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 465 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 466 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 467 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 50:
#line 471 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 472 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 52:
#line 476 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 480 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 54:
#line 482 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, i->r[1]);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 55:
#line 489 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 493 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 494 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 58:
#line 495 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 59:
#line 499 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 500 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 61:
#line 505 "imcc/imcc.y"
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

  case 62:
#line 530 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 63:
#line 534 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 64:
#line 535 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 65:
#line 539 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 66:
#line 540 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 67:
#line 544 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 68:
#line 545 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 69:
#line 546 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 71:
#line 550 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 72:
#line 551 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 73:
#line 552 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 74:
#line 553 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 75:
#line 554 "imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 76:
#line 559 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
            add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
         }
    break;

  case 77:
#line 564 "imcc/imcc.y"
    {  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr); }
    break;

  case 78:
#line 566 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
            yyvsp[-4].sr ->pcc_sub->nci = 1;
         }
    break;

  case 79:
#line 573 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 80:
#line 574 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 81:
#line 578 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 82:
#line 579 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 83:
#line 583 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 84:
#line 584 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 85:
#line 589 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 86:
#line 590 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 87:
#line 591 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 88:
#line 596 "imcc/imcc.y"
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

  case 89:
#line 611 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 90:
#line 616 "imcc/imcc.y"
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

  case 91:
#line 632 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 92:
#line 636 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 93:
#line 638 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 94:
#line 640 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 95:
#line 644 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 98:
#line 661 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 99:
#line 666 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 100:
#line 667 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 101:
#line 668 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 102:
#line 669 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 103:
#line 673 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 107:
#line 683 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 108:
#line 691 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 111:
#line 697 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 112:
#line 698 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 113:
#line 699 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 114:
#line 699 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 115:
#line 700 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 116:
#line 701 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 117:
#line 702 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 118:
#line 703 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 119:
#line 704 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 120:
#line 704 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 121:
#line 706 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 122:
#line 707 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 123:
#line 708 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 124:
#line 709 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 125:
#line 710 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 126:
#line 711 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 127:
#line 712 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 128:
#line 713 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 129:
#line 714 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 130:
#line 715 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 131:
#line 716 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 132:
#line 717 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 133:
#line 719 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 134:
#line 721 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 135:
#line 723 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 136:
#line 724 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 139:
#line 727 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 140:
#line 731 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 141:
#line 732 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 142:
#line 733 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 143:
#line 734 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 144:
#line 738 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 145:
#line 739 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 146:
#line 740 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 147:
#line 741 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 148:
#line 742 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 149:
#line 743 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 150:
#line 748 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 151:
#line 756 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 152:
#line 757 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 153:
#line 758 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 154:
#line 759 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 155:
#line 760 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 761 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 762 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 763 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 764 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 765 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 766 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 162:
#line 768 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 770 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 772 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 774 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 776 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 778 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 780 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 782 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 784 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 786 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 172:
#line 788 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 790 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 174:
#line 792 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 175:
#line 794 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 176:
#line 797 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 177:
#line 804 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 806 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 179:
#line 809 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 811 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 181:
#line 814 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 182:
#line 816 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 183:
#line 820 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 184:
#line 822 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 185:
#line 824 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 826 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 187:
#line 829 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 832 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 189:
#line 838 "imcc/imcc.y"
    {
            yyval.i = create_itcall_label();
         }
    break;

  case 190:
#line 842 "imcc/imcc.y"
    {
           itcall_sub(yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 191:
#line 848 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 192:
#line 849 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 193:
#line 853 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 194:
#line 854 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 195:
#line 855 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 196:
#line 858 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 197:
#line 859 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 198:
#line 864 "imcc/imcc.y"
    {
           yyval.i = create_itcall_label();
           itcall_sub(yyvsp[0].sr);
        }
    break;

  case 199:
#line 869 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 200:
#line 873 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 201:
#line 874 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 202:
#line 875 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 203:
#line 880 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 204:
#line 882 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 205:
#line 886 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 206:
#line 887 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 207:
#line 892 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 894 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 896 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 898 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 900 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 902 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 906 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 214:
#line 907 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 215:
#line 908 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 216:
#line 909 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 217:
#line 910 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 218:
#line 911 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 223:
#line 925 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 224:
#line 926 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 225:
#line 930 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 227:
#line 935 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 228:
#line 937 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 229:
#line 945 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 230:
#line 946 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 236:
#line 960 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 237:
#line 961 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 238:
#line 965 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 239:
#line 967 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 241:
#line 975 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 242:
#line 976 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 243:
#line 977 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 244:
#line 978 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 245:
#line 979 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 246:
#line 983 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 247:
#line 984 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 248:
#line 985 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 249:
#line 989 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 250:
#line 990 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3035 "imcc/imcparser.c"

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


#line 995 "imcc/imcc.y"



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

