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
   if (cur_obj) {
       if (cur_obj->set != 'P')
          fataly(1, sourcefile, line, "object isn't a PMC");
       current_call->r[0]->pcc_sub->object = cur_obj;
       cur_obj = NULL;
   }
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
#line 231 "imcc/imcc.y"
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
#line 501 "imcc/imcparser.c"
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
#line 522 "imcc/imcparser.c"

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
#define YYLAST   489

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  112
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  95
/* YYNRULES -- Number of rules. */
#define YYNRULES  247
/* YYNRULES -- Number of states. */
#define YYNSTATES  422

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
     727,   729,   730,   732,   736,   738,   740,   745,   747,   749,
     751,   753,   755,   757,   758,   761,   763,   767,   769,   771,
     773,   775,   777,   779,   781,   783,   785,   787
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     113,     0,    -1,   114,    -1,   115,    -1,   114,   115,    -1,
     127,    -1,   126,    -1,   117,    -1,   116,    -1,   134,    -1,
     141,    -1,   124,    -1,    89,     4,    -1,     4,    -1,    49,
     179,    84,    -1,    49,   179,    84,    97,   205,    -1,    -1,
      30,   118,   179,    84,    97,   205,    -1,   120,    -1,   119,
     120,    -1,   168,   121,     4,    -1,    89,     4,    -1,    94,
      -1,    93,    -1,   126,    -1,    -1,   122,    91,   123,    -1,
      64,   151,    77,    -1,    -1,   194,    -1,    -1,    78,   125,
     119,    79,    -1,    21,    98,   200,    99,    -1,    -1,    23,
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
     199,    59,   199,     4,    -1,    63,   199,     4,    -1,    69,
     199,     4,    -1,    -1,   154,   155,     4,    -1,     9,   199,
      -1,    10,   193,    -1,    -1,   156,   157,     4,    -1,    53,
     193,    -1,    -1,    29,   158,   179,    84,    -1,    -1,    65,
       4,   160,   163,    66,    -1,    -1,    67,     4,   162,   163,
      68,    -1,    -1,   163,     4,    -1,   163,   164,     4,    -1,
      54,   199,    -1,   167,    -1,   165,   167,    -1,    -1,   166,
     171,    -1,    89,     4,    -1,    94,    -1,    93,    -1,    -1,
     169,    -1,   169,   170,    -1,   170,    -1,    77,    -1,   168,
     172,     4,    -1,   181,    -1,   191,    -1,    21,    84,    -1,
      22,    84,    -1,    -1,    29,   173,   179,    84,    -1,    -1,
      30,   174,   179,    84,    97,   205,    -1,    -1,    33,   175,
     179,    84,    97,   205,    -1,    -1,     5,   176,   179,    84,
      -1,     5,   204,    -1,    53,   199,    -1,     9,   199,    -1,
      54,   199,    -1,     7,   197,    -1,     8,   197,    -1,    31,
     199,    -1,    32,   199,    -1,    14,    -1,    15,    -1,    13,
      -1,    -1,    17,   177,   123,    -1,    91,   194,    -1,   186,
      -1,   147,    -1,   159,    -1,   161,    -1,    -1,    17,    -1,
      18,    -1,    19,    -1,    20,    -1,    36,    -1,    37,    -1,
      38,    -1,    39,    -1,    40,    -1,   180,    -1,    84,    -1,
     193,    97,   199,    -1,   193,    97,   100,   199,    -1,   193,
      97,   101,   199,    -1,   193,    97,   102,   199,    -1,   193,
      97,   199,   103,   199,    -1,   193,    97,   199,   101,   199,
      -1,   193,    97,   199,   104,   199,    -1,   193,    97,   199,
      55,   199,    -1,   193,    97,   199,   105,   199,    -1,   193,
      97,   199,   106,   199,    -1,   193,    97,   199,    95,   199,
      -1,   193,    97,   199,    34,   199,    -1,   193,    97,   199,
      35,   199,    -1,   193,    97,   199,    56,   199,    -1,   193,
      97,   199,    57,   199,    -1,   193,    97,   199,    58,   199,
      -1,   193,    97,   199,    42,   199,    -1,   193,    97,   199,
     107,   199,    -1,   193,    97,   199,   108,   199,    -1,   193,
      97,   199,   102,   199,    -1,   193,    97,   199,    98,   200,
      99,    -1,   193,    98,   200,    99,    97,   199,    -1,   193,
      97,    16,   180,    59,   199,    -1,   193,    97,    16,   180,
      -1,   193,    97,   178,    84,    -1,   193,    97,   178,    84,
      59,    84,    -1,   193,    97,    41,   199,    -1,   193,    97,
      41,   199,    98,   200,    99,    -1,   193,    97,    52,   199,
      -1,   193,    97,    51,    84,    -1,   193,    97,    50,   206,
      -1,    50,   206,    97,   199,    -1,    -1,    16,   182,   123,
      -1,    41,   193,    59,   199,    -1,    41,   193,    59,   199,
      98,   200,    99,    -1,    52,   193,    59,   199,    -1,   193,
      97,   186,    -1,    -1,   183,   109,   190,   110,    97,   184,
     109,   188,   110,    -1,    84,    -1,    92,    -1,   193,   185,
      84,    -1,   193,   185,    85,    -1,   193,   185,   193,    -1,
      96,    -1,    95,    -1,    -1,   184,   187,   109,   188,   110,
      -1,    -1,   188,    59,   189,    -1,   189,    -1,   199,    -1,
      10,   193,    -1,   190,    59,   193,    -1,   193,    -1,    11,
     199,   192,   199,     8,   197,    -1,    12,   199,   192,   199,
       8,   197,    -1,    11,   199,     8,   197,    -1,    12,   199,
       8,   197,    -1,    11,   199,    59,   197,    -1,    12,   199,
      59,   197,    -1,    43,    -1,    44,    -1,    45,    -1,    46,
      -1,    47,    -1,    48,    -1,    92,    -1,   204,    -1,    -1,
     195,    -1,   195,    59,   196,    -1,   196,    -1,   198,    -1,
     193,    98,   200,    99,    -1,    84,    -1,    91,    -1,   197,
      -1,   199,    -1,   193,    -1,   205,    -1,    -1,   201,   202,
      -1,   203,    -1,   202,   111,   203,    -1,   199,    -1,    80,
      -1,    81,    -1,    82,    -1,    83,    -1,    88,    -1,    86,
      -1,    87,    -1,    85,    -1,    82,    -1,    85,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   300,   300,   304,   306,   309,   311,   312,   313,   314,
     315,   316,   317,   318,   321,   327,   335,   334,   339,   341,
     344,   346,   347,   348,   349,   352,   352,   356,   363,   366,
     371,   370,   382,   391,   389,   405,   407,   410,   412,   415,
     417,   418,   421,   435,   453,   458,   451,   468,   470,   471,
     475,   474,   479,   484,   486,   483,   496,   498,   499,   503,
     502,   509,   507,   537,   539,   542,   544,   547,   549,   550,
     553,   554,   555,   556,   557,   558,   561,   567,   569,   576,
     578,   581,   583,   586,   588,   591,   594,   594,   600,   598,
     620,   618,   639,   641,   643,   647,   651,   653,   664,   668,
     671,   672,   673,   676,   678,   681,   683,   686,   693,   698,
     700,   701,   702,   703,   703,   704,   704,   706,   706,   708,
     708,   710,   711,   712,   713,   714,   715,   716,   717,   718,
     719,   720,   721,   721,   724,   727,   728,   729,   730,   731,
     734,   736,   737,   738,   741,   743,   744,   745,   746,   747,
     750,   759,   761,   762,   763,   764,   765,   766,   767,   768,
     769,   770,   771,   773,   775,   777,   779,   781,   783,   785,
     787,   789,   791,   793,   795,   797,   800,   807,   809,   812,
     814,   817,   819,   824,   823,   827,   829,   832,   835,   842,
     841,   852,   853,   857,   858,   859,   862,   863,   868,   866,
     876,   878,   879,   882,   885,   889,   891,   894,   897,   899,
     901,   903,   905,   909,   911,   912,   913,   914,   915,   918,
     920,   923,   925,   928,   930,   933,   935,   943,   945,   948,
     950,   953,   955,   958,   958,   962,   964,   968,   972,   974,
     975,   976,   977,   980,   982,   983,   986,   988
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
  "if_statement", "relop", "target", "vars", "_vars", "_var_or_i", 
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
     198,   199,   199,   201,   200,   202,   202,   203,   204,   204,
     204,   204,   204,   205,   205,   205,   206,   206
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
       1,     0,     1,     3,     1,     1,     4,     1,     1,     1,
       1,     1,     1,     0,     2,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,    13,     0,     0,    44,    16,     0,    53,    30,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     233,    33,     0,     0,   144,   145,   146,   147,   148,   150,
       0,   149,     0,   103,    12,     1,     4,     0,     0,     0,
      67,     0,    14,    67,   107,     0,    23,    22,   103,    18,
      24,    25,   104,   106,    32,   238,   239,   240,   241,   245,
     243,   244,   242,   219,   231,   237,   234,   235,   220,   232,
      36,    65,    66,    72,    71,    73,    74,    75,    70,     0,
      69,     0,     0,     0,    21,    31,    19,    67,     0,     0,
     105,     0,    41,     0,     0,     0,    35,    37,    39,    40,
      45,     0,     0,    15,    54,     0,    20,   221,   236,     0,
       0,    34,    38,    47,    68,    17,    56,    27,   227,   228,
      26,   231,    29,   222,   224,   229,   225,   230,     0,     0,
      48,    98,    57,    98,   233,     0,    42,    43,    50,     0,
     102,   101,     0,    46,    98,   103,    96,    59,    55,     0,
       0,   223,     0,   100,    49,    52,    97,   139,    99,     0,
      58,   226,     0,   119,     0,     0,     0,     0,     0,   131,
     129,   130,   183,   132,     0,     0,   113,   115,     0,     0,
     117,     0,     0,     0,     0,     0,     0,     0,     0,   191,
     221,   219,   136,   137,   138,     0,   109,     0,   198,   135,
     110,     0,     0,    51,     0,   121,   125,   126,   123,     0,
       0,   221,   221,   111,   112,     0,     0,   127,   128,     0,
       0,   246,   247,     0,     0,   122,   124,     0,    88,    90,
     134,   108,     0,     0,   197,   196,     0,   233,     0,    60,
       0,     0,   213,   214,   215,   216,   217,   218,     0,     0,
       0,     0,     0,   184,   133,     0,     0,     0,     0,     0,
       0,    61,    92,    92,     0,   206,   200,     0,   140,   141,
     142,   143,     0,     0,     0,     0,     0,     0,     0,     0,
     188,   231,   151,     0,   193,   194,   195,   120,   209,   211,
       0,   210,   212,     0,   114,     0,     0,   185,   182,   187,
      79,     0,     0,     0,     0,     0,     0,   202,   203,   174,
     177,   181,   180,   179,   152,   153,   154,   175,     0,     0,
       0,     0,     0,     0,     0,     0,   233,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     233,     0,    93,     0,    89,     0,    91,   205,     0,   204,
       0,   199,     0,   233,     0,   162,   163,   167,   158,   164,
     165,   166,   161,     0,   156,   170,   155,   157,   159,   160,
     168,   169,     0,   207,   208,   116,   118,     0,     0,     0,
       0,     0,    63,     0,    95,    94,     0,     0,   201,   173,
       0,   176,   171,   172,   186,    81,    82,     0,     0,    83,
       0,    80,   200,   178,    77,     0,    78,     0,    64,     0,
       0,    86,     0,    62,     0,   190,    76,     0,    85,    84,
       0,    87
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    48,    49,    88,
      89,   120,    15,    33,    16,    17,    39,    95,    96,    97,
      98,    99,    18,    22,   113,   131,   142,   152,   143,    19,
      32,   116,   133,   149,   159,   192,   300,   399,    78,    79,
      80,   382,   341,   383,   407,   414,   417,   193,   262,   194,
     263,   301,   345,   144,   145,   146,    51,    52,    53,   158,
     195,   215,   216,   219,   204,   212,   279,    30,    31,   196,
     211,   197,   198,   238,   199,   233,   306,   307,   264,   200,
     249,    64,   122,   123,   124,   125,   126,   127,    37,    38,
      66,    67,    68,    69,   223
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -155
static const short yypact[] =
{
       1,  -155,   -65,   -49,  -155,  -155,   134,  -155,  -155,    42,
      49,     1,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,   -46,   134,  -155,  -155,  -155,  -155,  -155,  -155,
     -16,  -155,    -6,     6,  -155,  -155,  -155,   -45,   146,    57,
     193,    24,    26,   193,  -155,    85,  -155,  -155,    -8,  -155,
    -155,     3,    33,  -155,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,  -155,  -155,  -155,  -155,    14,  -155,  -155,  -155,
      15,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,    13,
    -155,    30,    19,    16,  -155,  -155,  -155,   193,   124,    43,
    -155,   146,  -155,   134,    54,   111,    15,  -155,  -155,  -155,
    -155,   193,    19,  -155,  -155,   -34,  -155,   384,  -155,    62,
      63,  -155,  -155,   137,  -155,  -155,   147,  -155,  -155,  -155,
    -155,    52,  -155,    93,  -155,  -155,  -155,  -155,   181,   182,
    -155,    -1,  -155,     9,  -155,   384,  -155,  -155,  -155,   183,
    -155,  -155,   185,  -155,    51,    33,  -155,  -155,  -155,   186,
      92,  -155,   134,  -155,  -155,  -155,  -155,   343,  -155,   134,
    -155,  -155,   113,   163,   -52,   -52,   146,   146,   146,  -155,
    -155,  -155,  -155,  -155,   115,   117,  -155,  -155,   146,   146,
    -155,   127,   -48,   127,   146,   146,   -18,   190,   191,  -155,
     384,    94,  -155,  -155,  -155,   198,  -155,   102,  -155,  -155,
    -155,    70,   121,  -155,   134,  -155,  -155,  -155,  -155,   110,
     116,   384,   384,  -155,  -155,   134,   134,  -155,  -155,   134,
     155,  -155,  -155,   120,   161,  -155,  -155,   217,  -155,  -155,
    -155,  -155,   127,   126,  -155,  -155,   361,  -155,   397,  -155,
     153,   -52,  -155,  -155,  -155,  -155,  -155,  -155,   -52,   146,
     -52,   -52,   146,  -155,  -155,   164,   166,   168,   146,   146,
     146,  -155,  -155,  -155,   -44,  -155,    34,   169,  -155,  -155,
    -155,  -155,   146,   -48,   172,   146,   146,   146,   146,   173,
    -155,   -39,   220,   148,  -155,  -155,  -155,  -155,  -155,  -155,
     250,  -155,  -155,   253,  -155,   174,   175,   176,  -155,  -155,
    -155,     8,     5,   127,   184,   127,   -33,  -155,  -155,   211,
     192,  -155,  -155,  -155,  -155,  -155,  -155,   214,   146,   146,
     146,   146,   146,   146,   146,   146,  -155,   146,   146,   146,
     146,   146,   146,   146,   146,   202,   -52,   -52,    19,    19,
    -155,    38,  -155,   146,  -155,   275,  -155,  -155,    96,  -155,
      34,  -155,   146,  -155,   216,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,  -155,   203,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,   146,  -155,  -155,  -155,  -155,   204,   146,   127,
     146,   146,    33,   297,  -155,  -155,   195,   -39,  -155,  -155,
     206,  -155,  -155,  -155,  -155,  -155,  -155,    17,   302,  -155,
     304,  -155,    34,  -155,  -155,   146,  -155,   -11,  -155,   -30,
     305,  -155,   127,  -155,   306,  -155,  -155,   134,  -155,  -155,
     227,  -155
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -155,  -155,  -155,   301,  -155,  -155,  -155,  -155,   269,  -155,
    -155,  -148,  -155,  -155,    -3,  -155,  -155,  -155,  -155,   223,
    -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,   187,  -155,
    -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,   143,   -27,
     229,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,    69,  -155,  -155,  -155,   189,   194,  -155,   -51,  -155,
    -155,  -155,  -155,  -155,  -155,  -155,  -155,   -23,    67,  -155,
    -155,  -155,   -13,  -155,   101,  -155,   -64,   -10,  -155,  -155,
     131,   -99,   156,  -155,   208,  -154,  -155,   -36,  -128,  -155,
    -155,   256,   199,   -79,    76
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -193
static const short yytable[] =
{
      41,    90,    65,   103,   138,     1,   150,   -28,   121,   342,
     206,   207,   342,     2,   147,   303,    83,   100,   411,    92,
     104,   404,     2,   115,     3,   101,   350,     2,     4,   350,
      50,     5,   118,    20,   221,    21,   121,   222,    40,   119,
      93,    94,   412,   117,   305,    50,    34,   378,   379,    35,
       6,   413,    71,    72,    54,    65,   234,   235,   201,   343,
     105,    70,   343,   253,   254,     7,   304,    87,    42,    44,
     109,    85,   101,   346,   344,   101,   405,   351,    43,     8,
     415,    45,   220,    44,   224,    46,    47,   288,   139,    84,
       9,   121,   140,   141,   289,    45,   291,   292,   139,    46,
      47,   380,   140,   141,    59,    60,    61,   381,    81,   283,
      44,   155,   121,   121,    55,    56,    57,    58,   241,    59,
      60,    61,    62,    82,   250,    91,    63,   102,   106,   162,
     208,   209,   210,   265,   107,   111,   202,   281,   110,   286,
     139,   130,   217,   218,   140,   141,   128,   129,   225,   226,
     134,   132,   135,   242,   243,   244,   245,   246,   247,   242,
     243,   244,   245,   246,   247,   234,   235,   236,   237,   248,
      24,    25,    26,    27,    28,   251,    55,    56,    57,    58,
     189,   240,   373,   374,    62,   136,   137,   153,   191,   154,
     160,   161,   255,   256,   228,   229,   257,   203,   363,   213,
     282,   214,   231,  -192,   347,   239,   349,    55,    56,    57,
      58,   232,   377,   290,   258,    62,   293,   259,    29,    63,
     260,   261,   297,   298,   299,   390,    55,    56,    57,    58,
     308,    59,    60,    61,    62,   266,   310,   287,    63,   313,
     314,   315,   316,    55,    56,    57,    58,   335,   294,   387,
     295,    62,   296,    29,   318,   319,   312,   317,   336,   375,
     376,   337,   320,    71,    72,    73,    74,    75,    76,    77,
     352,   338,   339,   354,   340,   321,   322,   323,   324,   385,
     396,   348,   355,   356,   357,   358,   359,   360,   361,   362,
     353,   364,   365,   366,   367,   368,   369,   370,   371,   372,
     391,   401,   392,   394,   402,   403,   406,   384,   408,   416,
     419,   421,    36,   418,   308,   325,   389,    86,   326,   112,
     148,   327,   328,   329,   330,   331,   332,   333,   334,   227,
     114,   400,   302,   156,   309,   386,   393,   280,   409,   157,
     388,   252,   395,   151,   397,   398,   230,   108,   163,   311,
     164,   165,   166,     0,   167,   168,   169,   170,   171,   172,
     173,     0,   205,     0,   174,   175,   308,     0,     0,   410,
       0,     0,   176,   177,   178,   179,   180,   267,   268,   269,
     270,   271,     0,     0,   181,     0,     0,     0,     0,     0,
       0,     0,     0,   182,   420,   183,   184,   185,     0,     0,
       0,     0,   272,     0,   186,     0,     0,     0,   187,     0,
     188,   273,   274,   275,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    55,    56,    57,    58,   189,     0,     0,
       0,    62,     0,     0,   190,   191,     0,     0,     0,     0,
       0,    55,    56,    57,    58,   189,    59,    60,    61,    62,
       0,     0,  -189,   191,     0,     0,     0,     0,     0,     0,
       0,   276,   277,   278,    55,    56,    57,    58,   118,    59,
      60,    61,    62,     0,     0,   119,    63,    55,    56,    57,
      58,   284,   285,     0,     0,    62,     0,     0,     0,    63
};

static const short yycheck[] =
{
      23,    52,    38,    82,     5,     4,   134,     4,   107,     4,
     164,   165,     4,    21,     5,    59,    43,     4,    29,     4,
       4,     4,    21,   102,    23,    59,    59,    21,    27,    59,
      33,    30,    84,    98,    82,    84,   135,    85,    84,    91,
      25,    26,    53,    77,    10,    48,     4,     9,    10,     0,
      49,    62,    70,    71,    99,    91,    95,    96,   157,    54,
      87,     4,    54,   211,   212,    64,   110,    64,    84,    77,
      93,    79,    59,    68,    66,    59,    59,   110,    84,    78,
     110,    89,   181,    77,   183,    93,    94,   241,    89,     4,
      89,   190,    93,    94,   248,    89,   250,   251,    89,    93,
      94,    63,    93,    94,    85,    86,    87,    69,    84,   237,
      77,    60,   211,   212,    80,    81,    82,    83,     8,    85,
      86,    87,    88,    97,     8,   111,    92,    97,     4,   152,
     166,   167,   168,   232,    91,    24,   159,   236,    84,   238,
      89,     4,   178,   179,    93,    94,    84,    84,   184,   185,
      98,     4,    59,    43,    44,    45,    46,    47,    48,    43,
      44,    45,    46,    47,    48,    95,    96,    97,    98,    59,
      36,    37,    38,    39,    40,    59,    80,    81,    82,    83,
      84,   204,   336,   337,    88,     4,     4,     4,    92,     4,
       4,    99,   215,   216,     4,     4,   219,    84,   326,    84,
     236,    84,     4,   109,   303,    84,   305,    80,    81,    82,
      83,   109,   340,   249,    59,    88,   252,    97,    84,    92,
      59,     4,   258,   259,   260,   353,    80,    81,    82,    83,
     266,    85,    86,    87,    88,   109,   272,    84,    92,   275,
     276,   277,   278,    80,    81,    82,    83,    99,    84,   348,
      84,    88,    84,    84,    34,    35,    84,    84,     8,   338,
     339,     8,    42,    70,    71,    72,    73,    74,    75,    76,
      59,    97,    97,    59,    98,    55,    56,    57,    58,     4,
     379,    97,   318,   319,   320,   321,   322,   323,   324,   325,
      98,   327,   328,   329,   330,   331,   332,   333,   334,    97,
      84,     4,    99,    99,   109,    99,     4,   343,     4,     4,
       4,    84,    11,   412,   350,    95,   352,    48,    98,    96,
     133,   101,   102,   103,   104,   105,   106,   107,   108,   186,
     101,   382,   263,   144,   267,   348,   372,   236,   402,   145,
     350,   210,   378,   135,   380,   381,   190,    91,     5,   273,
       7,     8,     9,    -1,    11,    12,    13,    14,    15,    16,
      17,    -1,   163,    -1,    21,    22,   402,    -1,    -1,   405,
      -1,    -1,    29,    30,    31,    32,    33,    16,    17,    18,
      19,    20,    -1,    -1,    41,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    50,   417,    52,    53,    54,    -1,    -1,
      -1,    -1,    41,    -1,    61,    -1,    -1,    -1,    65,    -1,
      67,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    80,    81,    82,    83,    84,    -1,    -1,
      -1,    88,    -1,    -1,    91,    92,    -1,    -1,    -1,    -1,
      -1,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      -1,    -1,   109,    92,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,   101,   102,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    -1,    -1,    91,    92,    80,    81,    82,
      83,    84,    85,    -1,    -1,    88,    -1,    -1,    -1,    92
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    49,    64,    78,    89,
     113,   114,   115,   116,   117,   124,   126,   127,   134,   141,
      98,    84,   135,   118,    36,    37,    38,    39,    40,    84,
     179,   180,   142,   125,     4,     0,   115,   200,   201,   128,
      84,   179,    84,    84,    77,    89,    93,    94,   119,   120,
     126,   168,   169,   170,    99,    80,    81,    82,    83,    85,
      86,    87,    88,    92,   193,   199,   202,   203,   204,   205,
       4,    70,    71,    72,    73,    74,    75,    76,   150,   151,
     152,    84,    97,   151,     4,    79,   120,    64,   121,   122,
     170,   111,     4,    25,    26,   129,   130,   131,   132,   133,
       4,    59,    97,   205,     4,   151,     4,    91,   203,   179,
      84,    24,   131,   136,   152,   205,   143,    77,    84,    91,
     123,   193,   194,   195,   196,   197,   198,   199,    84,    84,
       4,   137,     4,   144,    98,    59,     4,     4,     5,    89,
      93,    94,   138,   140,   165,   166,   167,     5,   140,   145,
     200,   196,   139,     4,     4,    60,   167,   168,   171,   146,
       4,    99,   179,     5,     7,     8,     9,    11,    12,    13,
      14,    15,    16,    17,    21,    22,    29,    30,    31,    32,
      33,    41,    50,    52,    53,    54,    61,    65,    67,    84,
      91,    92,   147,   159,   161,   172,   181,   183,   184,   186,
     191,   193,   179,    84,   176,   204,   197,   197,   199,   199,
     199,   182,   177,    84,    84,   173,   174,   199,   199,   175,
     193,    82,    85,   206,   193,   199,   199,   150,     4,     4,
     194,     4,   109,   187,    95,    96,    97,    98,   185,    84,
     179,     8,    43,    44,    45,    46,    47,    48,    59,   192,
       8,    59,   192,   123,   123,   179,   179,   179,    59,    97,
      59,     4,   160,   162,   190,   193,   109,    16,    17,    18,
      19,    20,    41,    50,    51,    52,   100,   101,   102,   178,
     186,   193,   199,   200,    84,    85,   193,    84,   197,   197,
     199,   197,   197,   199,    84,    84,    84,   199,   199,   199,
     148,   163,   163,    59,   110,    10,   188,   189,   199,   180,
     199,   206,    84,   199,   199,   199,   199,    84,    34,    35,
      42,    55,    56,    57,    58,    95,    98,   101,   102,   103,
     104,   105,   106,   107,   108,    99,     8,     8,    97,    97,
      98,   154,     4,    54,    66,   164,    68,   193,    97,   193,
      59,   110,    59,    98,    59,   199,   199,   199,   199,   199,
     199,   199,   199,   200,   199,   199,   199,   199,   199,   199,
     199,   199,    97,   197,   197,   205,   205,   200,     9,    10,
      63,    69,   153,   155,   199,     4,   184,   193,   189,   199,
     200,    84,    99,   199,    99,   199,   193,   199,   199,   149,
     170,     4,   109,    99,     4,    59,     4,   156,     4,   188,
     199,    29,    53,    62,   157,   110,     4,   158,   193,     4,
     179,    84
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
#line 301 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 310 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 311 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 312 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 313 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 314 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 315 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 316 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 317 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 318 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 323 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 328 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 335 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 336 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 20:
#line 345 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 346 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 347 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 348 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 349 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 25:
#line 352 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 26:
#line 354 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 27:
#line 357 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, yyval.i->r[1]);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 28:
#line 363 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 30:
#line 371 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 31:
#line 374 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 32:
#line 383 "imcc/imcc.y"
    { yyval.i=0;
                                 IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                                 cur_namespace = yyvsp[-1].sr;
                                 }
    break;

  case 33:
#line 391 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 34:
#line 398 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 36:
#line 407 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 41:
#line 418 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 42:
#line 423 "imcc/imcc.y"
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
#line 437 "imcc/imcc.y"
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
#line 453 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 45:
#line 458 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, i->r[1]);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 46:
#line 465 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 469 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 470 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 471 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 50:
#line 475 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 476 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 52:
#line 480 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 484 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 54:
#line 486 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, i->r[1]);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 55:
#line 493 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 497 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 498 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 58:
#line 499 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 59:
#line 503 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 504 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 61:
#line 509 "imcc/imcc.y"
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
#line 534 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 63:
#line 538 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 64:
#line 539 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 65:
#line 543 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 66:
#line 544 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 67:
#line 548 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 68:
#line 549 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 69:
#line 550 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 71:
#line 554 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 72:
#line 555 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 73:
#line 556 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 74:
#line 557 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 75:
#line 558 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 76:
#line 563 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
            add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
         }
    break;

  case 77:
#line 568 "imcc/imcc.y"
    {  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr); }
    break;

  case 78:
#line 570 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
            yyvsp[-4].sr ->pcc_sub->nci = 1;
         }
    break;

  case 79:
#line 577 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 80:
#line 578 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 81:
#line 582 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 82:
#line 583 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 83:
#line 587 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 84:
#line 588 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 85:
#line 593 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 86:
#line 594 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 87:
#line 595 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 88:
#line 600 "imcc/imcc.y"
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
#line 615 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 90:
#line 620 "imcc/imcc.y"
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
#line 636 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 92:
#line 640 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 93:
#line 642 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 94:
#line 644 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 95:
#line 648 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 98:
#line 665 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 99:
#line 670 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 100:
#line 671 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 101:
#line 672 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 102:
#line 673 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 103:
#line 677 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 107:
#line 687 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 108:
#line 695 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 111:
#line 701 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 112:
#line 702 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 113:
#line 703 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 114:
#line 703 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 115:
#line 704 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 116:
#line 705 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 117:
#line 706 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 118:
#line 707 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 119:
#line 708 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 120:
#line 708 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 121:
#line 710 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 122:
#line 711 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 123:
#line 712 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 124:
#line 713 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 125:
#line 714 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 126:
#line 715 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 127:
#line 716 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 128:
#line 717 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 129:
#line 718 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 130:
#line 719 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 131:
#line 720 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 132:
#line 721 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 133:
#line 723 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 134:
#line 725 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 135:
#line 727 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 136:
#line 728 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 139:
#line 731 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 140:
#line 735 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 141:
#line 736 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 142:
#line 737 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 143:
#line 738 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 144:
#line 742 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 145:
#line 743 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 146:
#line 744 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 147:
#line 745 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 148:
#line 746 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 149:
#line 747 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 150:
#line 752 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 151:
#line 760 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 152:
#line 761 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 153:
#line 762 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 154:
#line 763 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 155:
#line 764 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 765 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 766 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 767 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 768 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 769 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 770 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 162:
#line 772 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 774 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 776 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 778 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 780 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 782 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 784 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 786 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 788 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 790 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 172:
#line 792 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 794 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 174:
#line 796 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 175:
#line 798 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 176:
#line 801 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 177:
#line 808 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 178:
#line 810 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 179:
#line 813 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 815 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 181:
#line 818 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 182:
#line 820 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 183:
#line 824 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 184:
#line 826 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 185:
#line 828 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 830 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 187:
#line 833 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 836 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 189:
#line 842 "imcc/imcc.y"
    {
            yyval.i = create_itcall_label();
         }
    break;

  case 190:
#line 846 "imcc/imcc.y"
    {
           itcall_sub(yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 191:
#line 852 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 192:
#line 853 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 193:
#line 857 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 194:
#line 858 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 195:
#line 859 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 196:
#line 862 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 197:
#line 863 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 198:
#line 868 "imcc/imcc.y"
    {
           yyval.i = create_itcall_label();
           itcall_sub(yyvsp[0].sr);
        }
    break;

  case 199:
#line 873 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 200:
#line 877 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 201:
#line 878 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 202:
#line 879 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 203:
#line 884 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 204:
#line 886 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 205:
#line 890 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 206:
#line 891 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 207:
#line 896 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 898 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 900 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 902 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 904 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 906 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 910 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 214:
#line 911 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 215:
#line 912 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 216:
#line 913 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 217:
#line 914 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 218:
#line 915 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 221:
#line 924 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 222:
#line 925 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 223:
#line 929 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 225:
#line 934 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 226:
#line 936 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 227:
#line 944 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 228:
#line 945 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 233:
#line 958 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 234:
#line 959 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 235:
#line 963 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 236:
#line 965 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 238:
#line 973 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 239:
#line 974 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 240:
#line 975 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 241:
#line 976 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 242:
#line 977 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 243:
#line 981 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 244:
#line 982 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 245:
#line 983 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 246:
#line 987 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 247:
#line 988 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3032 "imcc/imcparser.c"

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


#line 993 "imcc/imcc.y"



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

