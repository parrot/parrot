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
     METH_CALL = 324,
     INVOCANT = 325,
     PROTOTYPED = 326,
     NON_PROTOTYPED = 327,
     MAIN = 328,
     LOAD = 329,
     IMMEDIATE = 330,
     POSTCOMP = 331,
     METHOD = 332,
     LABEL = 333,
     EMIT = 334,
     EOM = 335,
     IREG = 336,
     NREG = 337,
     SREG = 338,
     PREG = 339,
     IDENTIFIER = 340,
     STRINGC = 341,
     INTC = 342,
     FLOATC = 343,
     REG = 344,
     MACRO = 345,
     ENDM = 346,
     PARROT_OP = 347,
     VAR = 348,
     LINECOMMENT = 349,
     FILECOMMENT = 350,
     POINTY = 351
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
#define METH_CALL 324
#define INVOCANT 325
#define PROTOTYPED 326
#define NON_PROTOTYPED 327
#define MAIN 328
#define LOAD 329
#define IMMEDIATE 330
#define POSTCOMP 331
#define METHOD 332
#define LABEL 333
#define EMIT 334
#define EOM 335
#define IREG 336
#define NREG 337
#define SREG 338
#define PREG 339
#define IDENTIFIER 340
#define STRINGC 341
#define INTC 342
#define FLOATC 343
#define REG 344
#define MACRO 345
#define ENDM 346
#define PARROT_OP 347
#define VAR 348
#define LINECOMMENT 349
#define FILECOMMENT 350
#define POINTY 351




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
#line 505 "imcc/imcparser.c"
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
#line 526 "imcc/imcparser.c"

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
#define YYLAST   479

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  114
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  96
/* YYNRULES -- Number of rules. */
#define YYNRULES  253
/* YYNRULES -- Number of states. */
#define YYNSTATES  437

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   351

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   102,     2,     2,     2,   108,   109,     2,
     111,   112,   106,   105,     2,   103,    97,   107,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   113,
       2,    99,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   100,     2,   101,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   110,     2,   104,     2,     2,     2,
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
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    98
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
     166,   171,   172,   183,   184,   187,   188,   192,   194,   196,
     197,   201,   203,   205,   207,   209,   211,   213,   215,   221,
     225,   229,   233,   237,   243,   249,   250,   254,   257,   260,
     261,   265,   268,   269,   274,   275,   281,   282,   288,   289,
     292,   296,   299,   301,   304,   305,   308,   311,   313,   315,
     316,   318,   321,   323,   325,   329,   331,   333,   336,   339,
     340,   345,   346,   353,   354,   361,   362,   367,   370,   373,
     376,   379,   382,   385,   388,   391,   393,   395,   397,   398,
     402,   405,   407,   409,   411,   413,   414,   416,   418,   420,
     422,   424,   426,   428,   430,   432,   434,   436,   440,   445,
     450,   455,   461,   467,   473,   479,   485,   491,   497,   503,
     509,   515,   521,   527,   533,   539,   545,   551,   558,   565,
     572,   577,   582,   589,   594,   602,   607,   612,   617,   622,
     623,   627,   632,   640,   645,   649,   650,   660,   662,   664,
     668,   672,   676,   678,   680,   681,   687,   688,   692,   694,
     696,   699,   703,   705,   712,   719,   724,   729,   734,   739,
     741,   743,   745,   747,   749,   751,   753,   755,   756,   758,
     762,   764,   766,   771,   773,   775,   777,   779,   781,   783,
     784,   787,   789,   793,   795,   797,   799,   801,   803,   805,
     807,   809,   811,   813
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     115,     0,    -1,   116,    -1,   117,    -1,   116,   117,    -1,
     129,    -1,   128,    -1,   119,    -1,   118,    -1,   136,    -1,
     143,    -1,   126,    -1,    91,     4,    -1,     4,    -1,    49,
     182,    86,    -1,    49,   182,    86,    99,   208,    -1,    -1,
      30,   120,   182,    86,    99,   208,    -1,   122,    -1,   121,
     122,    -1,   171,   123,     4,    -1,    91,     4,    -1,    96,
      -1,    95,    -1,   128,    -1,    -1,   124,    93,   125,    -1,
      64,   154,    79,    -1,    -1,   197,    -1,    -1,    80,   127,
     121,    81,    -1,    21,   100,   203,   101,    -1,    -1,    23,
      86,   130,     4,   131,    24,    -1,   132,    -1,    -1,   133,
      -1,   132,   133,    -1,   134,    -1,   135,    -1,     4,    -1,
      25,   182,    86,     4,    -1,    26,    86,    86,     4,    -1,
      -1,    -1,    27,   137,    86,   154,     4,   138,   139,   142,
      -1,    -1,     4,    -1,   139,   140,     4,    -1,    -1,     5,
     141,   182,    86,    -1,   168,    60,    -1,    -1,    -1,    64,
     144,    86,   154,     4,   145,   146,   142,    -1,    -1,     4,
      -1,   146,   147,     4,    -1,    -1,     5,   148,   182,    86,
      -1,    -1,    61,   153,     4,   150,   157,   152,   156,   151,
     159,    62,    -1,    -1,   173,     4,    -1,    -1,    71,   202,
       4,    -1,    72,    -1,    73,    -1,    -1,   154,    59,   155,
      -1,   155,    -1,   153,    -1,    75,    -1,    74,    -1,    76,
      -1,    77,    -1,    78,    -1,    63,   202,    59,   202,     4,
      -1,    63,   202,     4,    -1,    69,   202,     4,    -1,    70,
     196,     4,    -1,    70,    87,     4,    -1,    70,   196,    59,
     202,     4,    -1,    70,    87,    59,   202,     4,    -1,    -1,
     157,   158,     4,    -1,     9,   202,    -1,    10,   196,    -1,
      -1,   159,   160,     4,    -1,    53,   196,    -1,    -1,    29,
     161,   182,    86,    -1,    -1,    65,     4,   163,   166,    66,
      -1,    -1,    67,     4,   165,   166,    68,    -1,    -1,   166,
       4,    -1,   166,   167,     4,    -1,    54,   202,    -1,   170,
      -1,   168,   170,    -1,    -1,   169,   174,    -1,    91,     4,
      -1,    96,    -1,    95,    -1,    -1,   172,    -1,   172,   173,
      -1,   173,    -1,    79,    -1,   171,   175,     4,    -1,   184,
      -1,   194,    -1,    21,    86,    -1,    22,    86,    -1,    -1,
      29,   176,   182,    86,    -1,    -1,    30,   177,   182,    86,
      99,   208,    -1,    -1,    33,   178,   182,    86,    99,   208,
      -1,    -1,     5,   179,   182,    86,    -1,     5,   207,    -1,
      53,   202,    -1,     9,   202,    -1,    54,   202,    -1,     7,
     200,    -1,     8,   200,    -1,    31,   202,    -1,    32,   202,
      -1,    14,    -1,    15,    -1,    13,    -1,    -1,    17,   180,
     125,    -1,    93,   197,    -1,   189,    -1,   149,    -1,   162,
      -1,   164,    -1,    -1,    17,    -1,    18,    -1,    19,    -1,
      20,    -1,    36,    -1,    37,    -1,    38,    -1,    39,    -1,
      40,    -1,   183,    -1,    86,    -1,   196,    99,   202,    -1,
     196,    99,   102,   202,    -1,   196,    99,   103,   202,    -1,
     196,    99,   104,   202,    -1,   196,    99,   202,   105,   202,
      -1,   196,    99,   202,   103,   202,    -1,   196,    99,   202,
     106,   202,    -1,   196,    99,   202,    55,   202,    -1,   196,
      99,   202,   107,   202,    -1,   196,    99,   202,   108,   202,
      -1,   196,    99,   202,    97,   202,    -1,   196,    99,   202,
      34,   202,    -1,   196,    99,   202,    35,   202,    -1,   196,
      99,   202,    56,   202,    -1,   196,    99,   202,    57,   202,
      -1,   196,    99,   202,    58,   202,    -1,   196,    99,   202,
      42,   202,    -1,   196,    99,   202,   109,   202,    -1,   196,
      99,   202,   110,   202,    -1,   196,    99,   202,   104,   202,
      -1,   196,    99,   202,   100,   203,   101,    -1,   196,   100,
     203,   101,    99,   202,    -1,   196,    99,    16,   183,    59,
     202,    -1,   196,    99,    16,   183,    -1,   196,    99,   181,
      86,    -1,   196,    99,   181,    86,    59,    86,    -1,   196,
      99,    41,   202,    -1,   196,    99,    41,   202,   100,   203,
     101,    -1,   196,    99,    52,   202,    -1,   196,    99,    51,
      86,    -1,   196,    99,    50,   209,    -1,    50,   209,    99,
     202,    -1,    -1,    16,   185,   125,    -1,    41,   196,    59,
     202,    -1,    41,   196,    59,   202,   100,   203,   101,    -1,
      52,   196,    59,   202,    -1,   196,    99,   189,    -1,    -1,
     186,   111,   193,   112,    99,   187,   111,   191,   112,    -1,
      86,    -1,    94,    -1,   196,   188,    86,    -1,   196,   188,
      87,    -1,   196,   188,   196,    -1,    98,    -1,    97,    -1,
      -1,   187,   190,   111,   191,   112,    -1,    -1,   191,    59,
     192,    -1,   192,    -1,   202,    -1,    10,   196,    -1,   193,
      59,   196,    -1,   196,    -1,    11,   202,   195,   202,     8,
     200,    -1,    12,   202,   195,   202,     8,   200,    -1,    11,
     202,     8,   200,    -1,    12,   202,     8,   200,    -1,    11,
     202,    59,   200,    -1,    12,   202,    59,   200,    -1,    43,
      -1,    44,    -1,    45,    -1,    46,    -1,    47,    -1,    48,
      -1,    94,    -1,   207,    -1,    -1,   198,    -1,   198,    59,
     199,    -1,   199,    -1,   201,    -1,   196,   100,   203,   101,
      -1,    86,    -1,    93,    -1,   200,    -1,   202,    -1,   196,
      -1,   208,    -1,    -1,   204,   205,    -1,   206,    -1,   205,
     113,   206,    -1,   202,    -1,    82,    -1,    83,    -1,    84,
      -1,    85,    -1,    90,    -1,    88,    -1,    89,    -1,    87,
      -1,    84,    -1,    87,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   301,   301,   305,   307,   310,   312,   313,   314,   315,
     316,   317,   318,   319,   322,   328,   336,   335,   340,   342,
     345,   347,   348,   349,   350,   353,   353,   357,   364,   367,
     372,   371,   383,   392,   390,   406,   408,   411,   413,   416,
     418,   419,   422,   436,   454,   459,   452,   469,   471,   472,
     476,   475,   480,   485,   487,   484,   497,   499,   500,   504,
     503,   510,   508,   540,   542,   545,   547,   550,   552,   555,
     557,   558,   561,   562,   563,   564,   565,   566,   569,   575,
     577,   582,   584,   586,   590,   596,   598,   601,   603,   606,
     608,   611,   614,   614,   620,   618,   640,   638,   659,   661,
     663,   667,   671,   673,   684,   688,   691,   692,   693,   696,
     698,   701,   703,   706,   713,   718,   720,   721,   722,   723,
     723,   724,   724,   726,   726,   728,   728,   730,   731,   732,
     733,   734,   735,   736,   737,   738,   739,   740,   741,   741,
     744,   747,   748,   749,   750,   751,   754,   756,   757,   758,
     761,   763,   764,   765,   766,   767,   770,   779,   781,   782,
     783,   784,   785,   786,   787,   788,   789,   790,   791,   793,
     795,   797,   799,   801,   803,   805,   807,   809,   811,   813,
     815,   817,   820,   827,   829,   832,   834,   837,   839,   844,
     843,   847,   849,   852,   855,   862,   861,   872,   873,   877,
     878,   879,   882,   883,   888,   886,   896,   898,   899,   902,
     905,   909,   911,   914,   917,   919,   921,   923,   925,   929,
     931,   932,   933,   934,   935,   938,   940,   943,   945,   948,
     950,   953,   955,   963,   965,   968,   970,   973,   975,   978,
     978,   982,   984,   988,   992,   994,   995,   996,   997,  1000,
    1002,  1003,  1006,  1008
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
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "PROTOTYPED", 
  "NON_PROTOTYPED", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", "METHOD", 
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", 
  "STRINGC", "INTC", "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "'.'", "POINTY", "'='", "'['", "']'", 
  "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "'('", 
  "')'", "';'", "$accept", "program", "compilation_units", 
  "compilation_unit", "global", "constdef", "@1", "pasmcode", "pasmline", 
  "pasm_inst", "@2", "pasm_args", "emit", "@3", "class_namespace", 
  "class", "@4", "class_body", "member_decls", "member_decl", 
  "field_decl", "method_decl", "sub", "@5", "@6", "sub_params", 
  "sub_param", "@7", "sub_body", "pcc_sub", "@8", "@9", "pcc_params", 
  "pcc_param", "@10", "pcc_sub_call", "@11", "opt_label", "opt_invocant", 
  "pcc_proto", "pcc_sub_proto", "proto", "pcc_call", "pcc_args", 
  "pcc_arg", "pcc_results", "pcc_result", "@12", "pcc_ret", "@13", 
  "pcc_yield", "@14", "pcc_returns", "pcc_return", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "labeled_inst", "@15", "@16", "@17", "@18", "@19", 
  "newsub", "type", "classname", "assignment", "@20", "@21", "the_sub", 
  "ptr", "sub_call", "@22", "arglist", "arg", "targetlist", 
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
     344,   345,   346,   347,   348,   349,   350,    46,   351,    61,
      91,    93,    33,    45,   126,    43,    42,    47,    37,    38,
     124,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   114,   115,   116,   116,   117,   117,   117,   117,   117,
     117,   117,   117,   117,   118,   118,   120,   119,   121,   121,
     122,   122,   122,   122,   122,   124,   123,   123,   123,   125,
     127,   126,   128,   130,   129,   131,   131,   132,   132,   133,
     133,   133,   134,   135,   137,   138,   136,   139,   139,   139,
     141,   140,   142,   144,   145,   143,   146,   146,   146,   148,
     147,   150,   149,   151,   151,   152,   152,   153,   153,   154,
     154,   154,   155,   155,   155,   155,   155,   155,   156,   156,
     156,   156,   156,   156,   156,   157,   157,   158,   158,   159,
     159,   160,   161,   160,   163,   162,   165,   164,   166,   166,
     166,   167,   168,   168,   169,   170,   170,   170,   170,   171,
     171,   172,   172,   173,   174,   175,   175,   175,   175,   176,
     175,   177,   175,   178,   175,   179,   175,   175,   175,   175,
     175,   175,   175,   175,   175,   175,   175,   175,   180,   175,
     175,   175,   175,   175,   175,   175,   181,   181,   181,   181,
     182,   182,   182,   182,   182,   182,   183,   184,   184,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   185,
     184,   184,   184,   184,   184,   186,   184,   187,   187,   187,
     187,   187,   188,   188,   190,   189,   191,   191,   191,   192,
     192,   193,   193,   194,   194,   194,   194,   194,   194,   195,
     195,   195,   195,   195,   195,   196,   196,   197,   197,   198,
     198,   199,   199,   200,   200,   201,   201,   202,   202,   204,
     203,   205,   205,   206,   207,   207,   207,   207,   207,   208,
     208,   208,   209,   209
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
       4,     0,    10,     0,     2,     0,     3,     1,     1,     0,
       3,     1,     1,     1,     1,     1,     1,     1,     5,     3,
       3,     3,     3,     5,     5,     0,     3,     2,     2,     0,
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
       3,     3,     1,     1,     0,     5,     0,     3,     1,     1,
       2,     3,     1,     6,     6,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     0,
       2,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,    13,     0,     0,    44,    16,     0,    53,    30,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     239,    33,     0,     0,   150,   151,   152,   153,   154,   156,
       0,   155,     0,   109,    12,     1,     4,     0,     0,     0,
      69,     0,    14,    69,   113,     0,    23,    22,   109,    18,
      24,    25,   110,   112,    32,   244,   245,   246,   247,   251,
     249,   250,   248,   225,   237,   243,   240,   241,   226,   238,
      36,    67,    68,    74,    73,    75,    76,    77,    72,     0,
      71,     0,     0,     0,    21,    31,    19,    69,     0,     0,
     111,     0,    41,     0,     0,     0,    35,    37,    39,    40,
      45,     0,     0,    15,    54,     0,    20,   227,   242,     0,
       0,    34,    38,    47,    70,    17,    56,    27,   233,   234,
      26,   237,    29,   228,   230,   235,   231,   236,     0,     0,
      48,   104,    57,   104,   239,     0,    42,    43,    50,     0,
     108,   107,     0,    46,   104,   109,   102,    59,    55,     0,
       0,   229,     0,   106,    49,    52,   103,   145,   105,     0,
      58,   232,     0,   125,     0,     0,     0,     0,     0,   137,
     135,   136,   189,   138,     0,     0,   119,   121,     0,     0,
     123,     0,     0,     0,     0,     0,     0,     0,     0,   197,
     227,   225,   142,   143,   144,     0,   115,     0,   204,   141,
     116,     0,     0,    51,     0,   127,   131,   132,   129,     0,
       0,   227,   227,   117,   118,     0,     0,   133,   134,     0,
       0,   252,   253,     0,     0,   128,   130,     0,    94,    96,
     140,   114,     0,     0,   203,   202,     0,   239,     0,    60,
       0,     0,   219,   220,   221,   222,   223,   224,     0,     0,
       0,     0,     0,   190,   139,     0,     0,     0,     0,     0,
       0,    61,    98,    98,     0,   212,   206,     0,   146,   147,
     148,   149,     0,     0,     0,     0,     0,     0,     0,     0,
     194,   237,   157,     0,   199,   200,   201,   126,   215,   217,
       0,   216,   218,     0,   120,     0,     0,   191,   188,   193,
      85,     0,     0,     0,     0,     0,     0,   208,   209,   180,
     183,   187,   186,   185,   158,   159,   160,   181,     0,     0,
       0,     0,     0,     0,     0,     0,   239,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     239,    65,    99,     0,    95,     0,    97,   211,     0,   210,
       0,   205,     0,   239,     0,   168,   169,   173,   164,   170,
     171,   172,   167,     0,   162,   176,   161,   163,   165,   166,
     174,   175,     0,   213,   214,   122,   124,     0,     0,     0,
       0,     0,     0,   101,   100,     0,     0,   207,   179,     0,
     182,   177,   178,   192,    87,    88,     0,     0,     0,     0,
      63,    86,   206,   184,    66,     0,     0,     0,     0,    89,
       0,     0,    79,     0,    80,    82,     0,    81,     0,     0,
      64,   196,     0,     0,     0,    92,     0,    62,     0,    78,
      84,    83,     0,    91,    90,     0,    93
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    48,    49,    88,
      89,   120,    15,    33,    16,    17,    39,    95,    96,    97,
      98,    99,    18,    22,   113,   131,   142,   152,   143,    19,
      32,   116,   133,   149,   159,   192,   300,   409,   381,    78,
      79,    80,   400,   341,   382,   419,   428,   432,   193,   262,
     194,   263,   301,   345,   144,   145,   146,    51,    52,    53,
     158,   195,   215,   216,   219,   204,   212,   279,    30,    31,
     196,   211,   197,   198,   238,   199,   233,   306,   307,   264,
     200,   249,    64,   122,   123,   124,   125,   126,   127,    37,
      38,    66,    67,    68,    69,   223
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -155
static const short yypact[] =
{
       1,  -155,   -65,   -30,  -155,  -155,   140,  -155,  -155,    64,
      77,     1,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,    37,   140,  -155,  -155,  -155,  -155,  -155,  -155,
      39,  -155,    48,    -6,  -155,  -155,  -155,   -80,   221,   131,
     344,    52,    51,   344,  -155,   136,  -155,  -155,   -17,  -155,
    -155,    12,    72,  -155,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,  -155,  -155,  -155,  -155,    28,  -155,  -155,  -155,
      41,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,    10,
    -155,    71,    19,    13,  -155,  -155,  -155,   344,   167,    79,
    -155,   221,  -155,   140,    87,   150,    41,  -155,  -155,  -155,
    -155,   344,    19,  -155,  -155,   -39,  -155,   235,  -155,   103,
     104,  -155,  -155,   187,  -155,  -155,   190,  -155,  -155,  -155,
    -155,    95,  -155,   138,  -155,  -155,  -155,  -155,   195,   197,
    -155,     4,  -155,     7,  -155,   235,  -155,  -155,  -155,   198,
    -155,  -155,   199,  -155,   -42,    72,  -155,  -155,  -155,   201,
     106,  -155,   140,  -155,  -155,  -155,  -155,   343,  -155,   140,
    -155,  -155,   122,    62,   -54,   -54,   221,   221,   221,  -155,
    -155,  -155,  -155,  -155,   124,   125,  -155,  -155,   221,   221,
    -155,   249,   -50,   249,   221,   221,   -13,   210,   211,  -155,
     235,   117,  -155,  -155,  -155,   213,  -155,   118,  -155,  -155,
    -155,    68,   135,  -155,   140,  -155,  -155,  -155,  -155,   110,
     116,   235,   235,  -155,  -155,   140,   140,  -155,  -155,   140,
     172,  -155,  -155,   128,   173,  -155,  -155,   229,  -155,  -155,
    -155,  -155,   249,   123,  -155,  -155,   168,  -155,   357,  -155,
     149,   -54,  -155,  -155,  -155,  -155,  -155,  -155,   -54,   221,
     -54,   -54,   221,  -155,  -155,   151,   152,   157,   221,   221,
     221,  -155,  -155,  -155,   -29,  -155,    32,   158,  -155,  -155,
    -155,  -155,   221,   -50,   159,   221,   221,   221,   221,   160,
    -155,    30,   356,   146,  -155,  -155,  -155,  -155,  -155,  -155,
     240,  -155,  -155,   253,  -155,   164,   165,   174,  -155,  -155,
    -155,     9,     3,   249,   176,   249,   -26,  -155,  -155,   217,
     178,  -155,  -155,  -155,  -155,  -155,  -155,   220,   221,   221,
     221,   221,   221,   221,   221,   221,  -155,   221,   221,   221,
     221,   221,   221,   221,   221,   182,   -54,   -54,    19,    19,
    -155,    17,  -155,   221,  -155,   286,  -155,  -155,   183,  -155,
      32,  -155,   221,  -155,   215,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,  -155,   212,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,   221,  -155,  -155,  -155,  -155,   225,   221,   249,
     221,   -22,   295,  -155,  -155,   191,    30,  -155,  -155,   234,
    -155,  -155,  -155,  -155,  -155,  -155,   308,   221,   221,   385,
      72,  -155,    32,  -155,  -155,    21,   326,    34,    42,  -155,
     333,    -8,  -155,   221,  -155,  -155,   221,  -155,   221,   -10,
    -155,  -155,   334,   336,   337,  -155,   249,  -155,   341,  -155,
    -155,  -155,   140,  -155,  -155,   260,  -155
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -155,  -155,  -155,   342,  -155,  -155,  -155,  -155,   299,  -155,
    -155,  -101,  -155,  -155,    -4,  -155,  -155,  -155,  -155,   267,
    -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,   236,  -155,
    -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,   181,
      18,   269,  -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,
    -155,  -155,   105,  -155,  -155,  -155,   227,   233,  -155,   -51,
    -155,  -155,  -155,  -155,  -155,  -155,  -155,  -155,   -23,   112,
    -155,  -155,  -155,    33,  -155,   147,  -155,   -16,    35,  -155,
    -155,   177,   -99,   202,  -155,   254,  -154,  -155,   -36,  -128,
    -155,  -155,   297,   231,   -79,   126
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -199
static const short yytable[] =
{
      41,    90,    65,   103,     2,     1,   150,   342,   121,   138,
     206,   207,   147,   342,   100,     2,   -28,   104,   155,   425,
     101,    54,     2,   115,     3,   412,   378,   379,     4,    50,
     303,     5,   118,   350,   221,    20,   121,   222,   415,   119,
     117,   397,   305,   426,    50,    92,   417,   398,   399,   139,
       6,   350,   427,   140,   141,    65,    21,   343,   201,    71,
      72,    83,    44,   343,    85,     7,    93,    94,    34,   101,
     109,   346,   101,    44,    45,   344,    87,    35,    46,    47,
     413,     8,   220,   304,   224,    45,   351,   288,   380,    46,
      47,   121,     9,   416,   289,   139,   291,   292,   139,   140,
     141,   418,   140,   141,   421,   105,    59,    60,    61,   283,
     253,   254,   121,   121,    55,    56,    57,    58,   241,    59,
      60,    61,    62,    40,   250,    42,    63,   234,   235,   162,
     208,   209,   210,   265,    43,    70,   202,   281,    81,   286,
      84,    91,   217,   218,    55,    56,    57,    58,   225,   226,
      82,    44,    62,   242,   243,   244,   245,   246,   247,   242,
     243,   244,   245,   246,   247,   234,   235,   236,   237,   248,
     102,   106,   107,   110,   111,   251,    24,    25,    26,    27,
      28,   240,   373,   374,   267,   268,   269,   270,   271,   128,
     129,   130,   255,   256,   132,   134,   257,   135,   363,   136,
     282,   137,   153,   154,   347,   160,   349,   161,   203,   272,
     213,   214,   377,   290,   228,   229,   293,   231,   273,   274,
     275,   239,   297,   298,   299,   389,    29,   259,  -198,   232,
     308,   258,   260,   261,   266,   287,   310,   294,   295,   313,
     314,   315,   316,   296,    29,   312,   317,   335,   336,   386,
      55,    56,    57,    58,   189,    59,    60,    61,    62,   375,
     376,   337,   191,   338,   339,    55,    56,    57,    58,   189,
     276,   277,   278,    62,   340,   348,   352,   191,   353,   354,
     395,   372,   355,   356,   357,   358,   359,   360,   361,   362,
     384,   364,   365,   366,   367,   368,   369,   370,   371,   401,
     408,   390,   402,    55,    56,    57,    58,   383,    59,    60,
      61,    62,   404,   391,   308,    63,   388,    55,    56,    57,
      58,   118,    59,    60,    61,    62,   393,   433,   119,    63,
     414,    55,    56,    57,    58,   403,   392,   420,   429,    62,
     430,   431,   394,    63,   396,   434,   436,    86,   163,   410,
     164,   165,   166,    36,   167,   168,   169,   170,   171,   172,
     173,   405,   406,   112,   174,   175,   308,   227,   302,   148,
     114,   156,   176,   177,   178,   179,   180,   422,   157,   309,
     423,   385,   424,   280,   181,   387,   411,   252,   108,   151,
     318,   319,   230,   182,   205,   183,   184,   185,   320,   311,
       0,     0,     0,     0,   186,     0,     0,     0,   187,   435,
     188,   321,   322,   323,   324,     0,    71,    72,    73,    74,
      75,    76,    77,     0,     0,    55,    56,    57,    58,   189,
       0,     0,     0,    62,     0,     0,   190,   191,     0,    55,
      56,    57,    58,   284,   285,     0,     0,    62,     0,     0,
       0,    63,     0,   325,  -195,     0,   326,     0,     0,   327,
     328,   329,   330,   331,   332,   333,   334,    55,    56,    57,
      58,     0,   407,     0,     0,    62,     0,     0,     0,    63
};

static const short yycheck[] =
{
      23,    52,    38,    82,    21,     4,   134,     4,   107,     5,
     164,   165,     5,     4,     4,    21,     4,     4,    60,    29,
      59,   101,    21,   102,    23,     4,     9,    10,    27,    33,
      59,    30,    86,    59,    84,   100,   135,    87,     4,    93,
      79,    63,    10,    53,    48,     4,     4,    69,    70,    91,
      49,    59,    62,    95,    96,    91,    86,    54,   157,    72,
      73,    43,    79,    54,    81,    64,    25,    26,     4,    59,
      93,    68,    59,    79,    91,    66,    64,     0,    95,    96,
      59,    80,   181,   112,   183,    91,   112,   241,    71,    95,
      96,   190,    91,    59,   248,    91,   250,   251,    91,    95,
      96,    59,    95,    96,   112,    87,    87,    88,    89,   237,
     211,   212,   211,   212,    82,    83,    84,    85,     8,    87,
      88,    89,    90,    86,     8,    86,    94,    97,    98,   152,
     166,   167,   168,   232,    86,     4,   159,   236,    86,   238,
       4,   113,   178,   179,    82,    83,    84,    85,   184,   185,
      99,    79,    90,    43,    44,    45,    46,    47,    48,    43,
      44,    45,    46,    47,    48,    97,    98,    99,   100,    59,
      99,     4,    93,    86,    24,    59,    36,    37,    38,    39,
      40,   204,   336,   337,    16,    17,    18,    19,    20,    86,
      86,     4,   215,   216,     4,   100,   219,    59,   326,     4,
     236,     4,     4,     4,   303,     4,   305,   101,    86,    41,
      86,    86,   340,   249,     4,     4,   252,     4,    50,    51,
      52,    86,   258,   259,   260,   353,    86,    99,   111,   111,
     266,    59,    59,     4,   111,    86,   272,    86,    86,   275,
     276,   277,   278,    86,    86,    86,    86,   101,     8,   348,
      82,    83,    84,    85,    86,    87,    88,    89,    90,   338,
     339,     8,    94,    99,    99,    82,    83,    84,    85,    86,
     102,   103,   104,    90,   100,    99,    59,    94,   100,    59,
     379,    99,   318,   319,   320,   321,   322,   323,   324,   325,
       4,   327,   328,   329,   330,   331,   332,   333,   334,     4,
     399,    86,   111,    82,    83,    84,    85,   343,    87,    88,
      89,    90,     4,   101,   350,    94,   352,    82,    83,    84,
      85,    86,    87,    88,    89,    90,   101,   426,    93,    94,
       4,    82,    83,    84,    85,   101,   372,     4,     4,    90,
       4,     4,   378,    94,   380,     4,    86,    48,     5,   400,
       7,     8,     9,    11,    11,    12,    13,    14,    15,    16,
      17,   397,   398,    96,    21,    22,   402,   186,   263,   133,
     101,   144,    29,    30,    31,    32,    33,   413,   145,   267,
     416,   348,   418,   236,    41,   350,   402,   210,    91,   135,
      34,    35,   190,    50,   163,    52,    53,    54,    42,   273,
      -1,    -1,    -1,    -1,    61,    -1,    -1,    -1,    65,   432,
      67,    55,    56,    57,    58,    -1,    72,    73,    74,    75,
      76,    77,    78,    -1,    -1,    82,    83,    84,    85,    86,
      -1,    -1,    -1,    90,    -1,    -1,    93,    94,    -1,    82,
      83,    84,    85,    86,    87,    -1,    -1,    90,    -1,    -1,
      -1,    94,    -1,    97,   111,    -1,   100,    -1,    -1,   103,
     104,   105,   106,   107,   108,   109,   110,    82,    83,    84,
      85,    -1,    87,    -1,    -1,    90,    -1,    -1,    -1,    94
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    49,    64,    80,    91,
     115,   116,   117,   118,   119,   126,   128,   129,   136,   143,
     100,    86,   137,   120,    36,    37,    38,    39,    40,    86,
     182,   183,   144,   127,     4,     0,   117,   203,   204,   130,
      86,   182,    86,    86,    79,    91,    95,    96,   121,   122,
     128,   171,   172,   173,   101,    82,    83,    84,    85,    87,
      88,    89,    90,    94,   196,   202,   205,   206,   207,   208,
       4,    72,    73,    74,    75,    76,    77,    78,   153,   154,
     155,    86,    99,   154,     4,    81,   122,    64,   123,   124,
     173,   113,     4,    25,    26,   131,   132,   133,   134,   135,
       4,    59,    99,   208,     4,   154,     4,    93,   206,   182,
      86,    24,   133,   138,   155,   208,   145,    79,    86,    93,
     125,   196,   197,   198,   199,   200,   201,   202,    86,    86,
       4,   139,     4,   146,   100,    59,     4,     4,     5,    91,
      95,    96,   140,   142,   168,   169,   170,     5,   142,   147,
     203,   199,   141,     4,     4,    60,   170,   171,   174,   148,
       4,   101,   182,     5,     7,     8,     9,    11,    12,    13,
      14,    15,    16,    17,    21,    22,    29,    30,    31,    32,
      33,    41,    50,    52,    53,    54,    61,    65,    67,    86,
      93,    94,   149,   162,   164,   175,   184,   186,   187,   189,
     194,   196,   182,    86,   179,   207,   200,   200,   202,   202,
     202,   185,   180,    86,    86,   176,   177,   202,   202,   178,
     196,    84,    87,   209,   196,   202,   202,   153,     4,     4,
     197,     4,   111,   190,    97,    98,    99,   100,   188,    86,
     182,     8,    43,    44,    45,    46,    47,    48,    59,   195,
       8,    59,   195,   125,   125,   182,   182,   182,    59,    99,
      59,     4,   163,   165,   193,   196,   111,    16,    17,    18,
      19,    20,    41,    50,    51,    52,   102,   103,   104,   181,
     189,   196,   202,   203,    86,    87,   196,    86,   200,   200,
     202,   200,   200,   202,    86,    86,    86,   202,   202,   202,
     150,   166,   166,    59,   112,    10,   191,   192,   202,   183,
     202,   209,    86,   202,   202,   202,   202,    86,    34,    35,
      42,    55,    56,    57,    58,    97,   100,   103,   104,   105,
     106,   107,   108,   109,   110,   101,     8,     8,    99,    99,
     100,   157,     4,    54,    66,   167,    68,   196,    99,   196,
      59,   112,    59,   100,    59,   202,   202,   202,   202,   202,
     202,   202,   202,   203,   202,   202,   202,   202,   202,   202,
     202,   202,    99,   200,   200,   208,   208,   203,     9,    10,
      71,   152,   158,   202,     4,   187,   196,   192,   202,   203,
      86,   101,   202,   101,   202,   196,   202,    63,    69,    70,
     156,     4,   111,   101,     4,   202,   202,    87,   196,   151,
     173,   191,     4,    59,     4,     4,    59,     4,    59,   159,
       4,   112,   202,   202,   202,    29,    53,    62,   160,     4,
       4,     4,   161,   196,     4,   182,    86
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
#line 302 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 311 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 312 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 313 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 314 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 315 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 316 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 317 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 318 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 319 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 324 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 329 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 336 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 337 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 20:
#line 346 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 347 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 348 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 349 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 350 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 25:
#line 353 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 26:
#line 355 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 27:
#line 358 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, yyval.i->r[1]);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 28:
#line 364 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 30:
#line 372 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 31:
#line 375 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 32:
#line 384 "imcc/imcc.y"
    { yyval.i=0;
                                 IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                                 cur_namespace = yyvsp[-1].sr;
                                 }
    break;

  case 33:
#line 392 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 34:
#line 399 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 36:
#line 408 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 41:
#line 419 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 42:
#line 424 "imcc/imcc.y"
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
#line 438 "imcc/imcc.y"
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
#line 454 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 45:
#line 459 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, i->r[1]);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 46:
#line 466 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 470 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 471 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 472 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 50:
#line 476 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 477 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 52:
#line 481 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 485 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 54:
#line 487 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, i->r[1]);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 55:
#line 494 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 498 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 499 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 58:
#line 500 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 59:
#line 504 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 505 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 61:
#line 510 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            r->pcc_sub->pragma = yyvsp[-1].t;
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            current_call = i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r1 of the first ins
             */
            r1 = cur_unit->instructions->r[1];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub = 1;
         }
    break;

  case 62:
#line 537 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 63:
#line 541 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 64:
#line 542 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 65:
#line 546 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 66:
#line 548 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 67:
#line 551 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 68:
#line 552 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 69:
#line 556 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 70:
#line 557 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 71:
#line 558 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 73:
#line 562 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 74:
#line 563 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 75:
#line 564 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 76:
#line 565 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 77:
#line 566 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 78:
#line 571 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 79:
#line 576 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 80:
#line 578 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 81:
#line 583 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 82:
#line 585 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-1].s,'S')); }
    break;

  case 83:
#line 587 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 84:
#line 591 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 85:
#line 597 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 86:
#line 598 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 87:
#line 602 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 88:
#line 603 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 89:
#line 607 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 90:
#line 608 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 91:
#line 613 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 92:
#line 614 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 93:
#line 615 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 94:
#line 620 "imcc/imcc.y"
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

  case 95:
#line 635 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 96:
#line 640 "imcc/imcc.y"
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

  case 97:
#line 656 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 98:
#line 660 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 99:
#line 662 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 100:
#line 664 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 101:
#line 668 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 104:
#line 685 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 105:
#line 690 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 106:
#line 691 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 107:
#line 692 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 108:
#line 693 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 109:
#line 697 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 113:
#line 707 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 114:
#line 715 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 117:
#line 721 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 118:
#line 722 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 119:
#line 723 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 120:
#line 723 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 121:
#line 724 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 122:
#line 725 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 123:
#line 726 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 124:
#line 727 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 125:
#line 728 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 126:
#line 728 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 127:
#line 730 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 128:
#line 731 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 129:
#line 732 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 130:
#line 733 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 131:
#line 734 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 132:
#line 735 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 133:
#line 736 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 134:
#line 737 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 135:
#line 738 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 136:
#line 739 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 137:
#line 740 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 138:
#line 741 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 139:
#line 743 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 140:
#line 745 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 141:
#line 747 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 142:
#line 748 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 145:
#line 751 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 146:
#line 755 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 147:
#line 756 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 148:
#line 757 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 149:
#line 758 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 150:
#line 762 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 151:
#line 763 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 152:
#line 764 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 153:
#line 765 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 154:
#line 766 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 155:
#line 767 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 156:
#line 772 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 157:
#line 780 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 781 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 159:
#line 782 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 160:
#line 783 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 161:
#line 784 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 785 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 786 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 787 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 788 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 789 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 790 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 168:
#line 792 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 794 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 796 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 798 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 800 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 802 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 804 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 806 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 808 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 810 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 178:
#line 812 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 814 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 180:
#line 816 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 181:
#line 818 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 182:
#line 821 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 183:
#line 828 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 830 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 185:
#line 833 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 835 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 187:
#line 838 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 188:
#line 840 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 189:
#line 844 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 190:
#line 846 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 191:
#line 848 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 850 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 193:
#line 853 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 856 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 195:
#line 862 "imcc/imcc.y"
    {
            yyval.i = create_itcall_label();
         }
    break;

  case 196:
#line 866 "imcc/imcc.y"
    {
           itcall_sub(yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 197:
#line 872 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 198:
#line 873 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 199:
#line 877 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 200:
#line 878 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 201:
#line 879 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 202:
#line 882 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 203:
#line 883 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 204:
#line 888 "imcc/imcc.y"
    {
           yyval.i = create_itcall_label();
           itcall_sub(yyvsp[0].sr);
        }
    break;

  case 205:
#line 893 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 206:
#line 897 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 207:
#line 898 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 208:
#line 899 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 209:
#line 904 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 210:
#line 906 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 211:
#line 910 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 212:
#line 911 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 213:
#line 916 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 918 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 920 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 922 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 924 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 926 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 930 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 220:
#line 931 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 221:
#line 932 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 222:
#line 933 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 223:
#line 934 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 224:
#line 935 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 227:
#line 944 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 228:
#line 945 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 229:
#line 949 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 231:
#line 954 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 232:
#line 956 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 233:
#line 964 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 234:
#line 965 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 239:
#line 978 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 240:
#line 979 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 241:
#line 983 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 242:
#line 985 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 244:
#line 993 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 245:
#line 994 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 246:
#line 995 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 247:
#line 996 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 248:
#line 997 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 249:
#line 1001 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 250:
#line 1002 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 251:
#line 1003 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 252:
#line 1007 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 253:
#line 1008 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3081 "imcc/imcparser.c"

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


#line 1013 "imcc/imcc.y"



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

