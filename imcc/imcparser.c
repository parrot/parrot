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
     POINTY = 281,
     SUB = 282,
     SYM = 283,
     LOCAL = 284,
     CONST = 285,
     INC = 286,
     DEC = 287,
     GLOBAL_CONST = 288,
     SHIFT_LEFT = 289,
     SHIFT_RIGHT = 290,
     INTV = 291,
     FLOATV = 292,
     STRINGV = 293,
     PMCV = 294,
     OBJECTV = 295,
     DEFINED = 296,
     LOG_XOR = 297,
     RELOP_EQ = 298,
     RELOP_NE = 299,
     RELOP_GT = 300,
     RELOP_GTE = 301,
     RELOP_LT = 302,
     RELOP_LTE = 303,
     GLOBAL = 304,
     GLOBALOP = 305,
     ADDR = 306,
     CLONE = 307,
     RESULT = 308,
     RETURN = 309,
     POW = 310,
     SHIFT_RIGHT_U = 311,
     LOG_AND = 312,
     LOG_OR = 313,
     COMMA = 314,
     ESUB = 315,
     PCC_BEGIN = 316,
     PCC_END = 317,
     PCC_CALL = 318,
     PCC_SUB = 319,
     PCC_BEGIN_RETURN = 320,
     PCC_END_RETURN = 321,
     PCC_BEGIN_YIELD = 322,
     PCC_END_YIELD = 323,
     NCI_CALL = 324,
     PROTOTYPED = 325,
     NON_PROTOTYPED = 326,
     MAIN = 327,
     LOAD = 328,
     IMMEDIATE = 329,
     POSTCOMP = 330,
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
     FILECOMMENT = 348
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
#define POINTY 281
#define SUB 282
#define SYM 283
#define LOCAL 284
#define CONST 285
#define INC 286
#define DEC 287
#define GLOBAL_CONST 288
#define SHIFT_LEFT 289
#define SHIFT_RIGHT 290
#define INTV 291
#define FLOATV 292
#define STRINGV 293
#define PMCV 294
#define OBJECTV 295
#define DEFINED 296
#define LOG_XOR 297
#define RELOP_EQ 298
#define RELOP_NE 299
#define RELOP_GT 300
#define RELOP_GTE 301
#define RELOP_LT 302
#define RELOP_LTE 303
#define GLOBAL 304
#define GLOBALOP 305
#define ADDR 306
#define CLONE 307
#define RESULT 308
#define RETURN 309
#define POW 310
#define SHIFT_RIGHT_U 311
#define LOG_AND 312
#define LOG_OR 313
#define COMMA 314
#define ESUB 315
#define PCC_BEGIN 316
#define PCC_END 317
#define PCC_CALL 318
#define PCC_SUB 319
#define PCC_BEGIN_RETURN 320
#define PCC_END_RETURN 321
#define PCC_BEGIN_YIELD 322
#define PCC_END_YIELD 323
#define NCI_CALL 324
#define PROTOTYPED 325
#define NON_PROTOTYPED 326
#define MAIN 327
#define LOAD 328
#define IMMEDIATE 329
#define POSTCOMP 330
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
#line 223 "imcc/imcc.y"
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
#line 491 "imcc/imcparser.c"
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
#line 512 "imcc/imcparser.c"

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
#define YYLAST   441

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  111
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  97
/* YYNRULES -- Number of rules. */
#define YYNRULES  245
/* YYNRULES -- Number of states. */
#define YYNSTATES  421

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
       2,     2,     2,    96,     2,     2,     2,   102,   104,     2,
     108,   109,   100,    99,     2,    97,   103,   101,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   110,
       2,    95,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   106,     2,   107,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   105,     2,    98,     2,     2,     2,
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
      86,    87,    88,    89,    90,    91,    92,    93,    94
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
     365,   368,   370,   372,   374,   376,   378,   379,   381,   383,
     385,   387,   389,   391,   393,   395,   397,   399,   401,   405,
     410,   415,   420,   426,   432,   438,   444,   450,   456,   462,
     468,   474,   480,   486,   492,   498,   504,   510,   516,   523,
     530,   537,   542,   547,   554,   559,   567,   572,   577,   582,
     587,   588,   592,   597,   605,   610,   614,   615,   625,   627,
     629,   631,   632,   640,   641,   647,   648,   652,   654,   656,
     659,   663,   665,   672,   679,   684,   689,   694,   699,   701,
     703,   705,   707,   709,   711,   713,   715,   717,   719,   720,
     722,   726,   728,   730,   735,   737,   739,   741,   743,   745,
     747,   749,   750,   753,   755,   759,   761,   763,   765,   767,
     769,   771,   773,   775,   777,   779
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     112,     0,    -1,   113,    -1,   114,    -1,   113,   114,    -1,
     125,    -1,   116,    -1,   115,    -1,   132,    -1,   139,    -1,
     123,    -1,    89,     4,    -1,     4,    -1,    50,   177,    84,
      -1,    50,   177,    84,    95,   206,    -1,    -1,    31,   117,
     177,    84,    95,   206,    -1,   119,    -1,   118,   119,    -1,
     166,   120,     4,    -1,    89,     4,    -1,    94,    -1,    93,
      -1,    -1,   121,    91,   122,    -1,    65,   149,    77,    -1,
      -1,   195,    -1,    -1,    78,   124,   118,    79,    -1,    -1,
      23,    84,   126,     4,   127,    24,    -1,   128,    -1,    -1,
     129,    -1,   128,   129,    -1,   130,    -1,   131,    -1,     4,
      -1,    25,   177,    84,     4,    -1,    26,    84,    84,     4,
      -1,    -1,    -1,    28,   133,    84,   149,     4,   134,   135,
     138,    -1,    -1,     4,    -1,   135,   136,     4,    -1,    -1,
       5,   137,   177,    84,    -1,   163,    61,    -1,    -1,    -1,
      65,   140,    84,   149,     4,   141,   142,   138,    -1,    -1,
       4,    -1,   142,   143,     4,    -1,    -1,     5,   144,   177,
      84,    -1,    -1,    62,   148,     4,   146,   152,   151,   147,
     154,    63,    -1,    -1,   168,     4,    -1,    71,    -1,    72,
      -1,    -1,   149,    60,   150,    -1,   150,    -1,   148,    -1,
      74,    -1,    73,    -1,    75,    -1,    76,    -1,    64,   200,
      60,   200,     4,    -1,    64,   200,     4,    -1,    70,   200,
       4,    -1,    -1,   152,   153,     4,    -1,     9,   200,    -1,
      10,   193,    -1,    -1,   154,   155,     4,    -1,    54,   193,
      -1,    -1,    30,   156,   177,    84,    -1,    -1,    66,     4,
     158,   161,    67,    -1,    -1,    68,     4,   160,   161,    69,
      -1,    -1,   161,     4,    -1,   161,   162,     4,    -1,    55,
     200,    -1,   165,    -1,   163,   165,    -1,    -1,   164,   169,
      -1,    89,     4,    -1,    94,    -1,    93,    -1,    -1,   167,
      -1,   167,   168,    -1,   168,    -1,    77,    -1,   166,   170,
       4,    -1,   179,    -1,   191,    -1,    21,    84,    -1,    22,
      84,    -1,    -1,    30,   171,   177,    84,    -1,    -1,    31,
     172,   177,    84,    95,   206,    -1,    -1,    34,   173,   177,
      84,    95,   206,    -1,    -1,     5,   174,   177,    84,    -1,
       5,   205,    -1,    54,   200,    -1,     9,   200,    -1,    55,
     200,    -1,     7,   198,    -1,     8,   198,    -1,    32,   200,
      -1,    33,   200,    -1,    14,    -1,    15,    -1,    13,    -1,
      -1,    17,   175,   122,    -1,    91,   195,    -1,   186,    -1,
     184,    -1,   145,    -1,   157,    -1,   159,    -1,    -1,    17,
      -1,    18,    -1,    19,    -1,    20,    -1,    37,    -1,    38,
      -1,    39,    -1,    40,    -1,    41,    -1,   178,    -1,    84,
      -1,   193,    95,   200,    -1,   193,    95,    96,   200,    -1,
     193,    95,    97,   200,    -1,   193,    95,    98,   200,    -1,
     193,    95,   200,    99,   200,    -1,   193,    95,   200,    97,
     200,    -1,   193,    95,   200,   100,   200,    -1,   193,    95,
     200,    56,   200,    -1,   193,    95,   200,   101,   200,    -1,
     193,    95,   200,   102,   200,    -1,   193,    95,   200,   103,
     200,    -1,   193,    95,   200,    35,   200,    -1,   193,    95,
     200,    36,   200,    -1,   193,    95,   200,    57,   200,    -1,
     193,    95,   200,    58,   200,    -1,   193,    95,   200,    59,
     200,    -1,   193,    95,   200,    43,   200,    -1,   193,    95,
     200,   104,   200,    -1,   193,    95,   200,   105,   200,    -1,
     193,    95,   200,    98,   200,    -1,   193,    95,   200,   106,
     201,   107,    -1,   200,   106,   201,   107,    95,   200,    -1,
     193,    95,    16,   178,    60,   200,    -1,   193,    95,    16,
     178,    -1,   193,    95,   176,    84,    -1,   193,    95,   176,
      84,    60,    84,    -1,   193,    95,    42,   200,    -1,   193,
      95,    42,   200,   106,   201,   107,    -1,   193,    95,    53,
     200,    -1,   193,    95,    52,    84,    -1,   193,    95,    51,
     207,    -1,    51,   207,    95,   200,    -1,    -1,    16,   180,
     122,    -1,    42,   193,    60,   200,    -1,    42,   193,    60,
     200,   106,   201,   107,    -1,    53,   193,    60,   200,    -1,
     193,    95,   186,    -1,    -1,   181,   108,   190,   109,    95,
     182,   108,   188,   109,    -1,    84,    -1,    27,    -1,   103,
      -1,    -1,    92,   183,    84,   185,   108,   188,   109,    -1,
      -1,   182,   187,   108,   188,   109,    -1,    -1,   188,    60,
     189,    -1,   189,    -1,   200,    -1,    10,   193,    -1,   190,
      60,   193,    -1,   193,    -1,    11,   200,   192,   200,     8,
     198,    -1,    12,   200,   192,   200,     8,   198,    -1,    11,
     200,     8,   198,    -1,    12,   200,     8,   198,    -1,    11,
     200,    60,   198,    -1,    12,   200,    60,   198,    -1,    44,
      -1,    45,    -1,    46,    -1,    47,    -1,    48,    -1,    49,
      -1,    92,    -1,   205,    -1,    92,    -1,   205,    -1,    -1,
     196,    -1,   196,    60,   197,    -1,   197,    -1,   199,    -1,
     194,   106,   201,   107,    -1,    84,    -1,    91,    -1,   198,
      -1,   200,    -1,    92,    -1,   205,    -1,   206,    -1,    -1,
     202,   203,    -1,   204,    -1,   203,   110,   204,    -1,   200,
      -1,    80,    -1,    81,    -1,    82,    -1,    83,    -1,    88,
      -1,    86,    -1,    87,    -1,    85,    -1,    82,    -1,    85,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   289,   289,   293,   295,   298,   300,   301,   302,   303,
     304,   305,   306,   309,   315,   323,   322,   327,   329,   332,
     334,   335,   336,   339,   339,   343,   349,   352,   357,   356,
     370,   368,   384,   386,   389,   391,   394,   396,   397,   400,
     414,   432,   437,   430,   447,   449,   450,   454,   453,   458,
     463,   465,   462,   475,   477,   478,   482,   481,   488,   486,
     516,   518,   521,   523,   526,   528,   529,   532,   533,   534,
     535,   536,   539,   545,   547,   554,   556,   559,   561,   564,
     566,   569,   572,   572,   578,   576,   598,   596,   617,   619,
     621,   625,   629,   631,   642,   646,   649,   650,   651,   654,
     656,   659,   661,   664,   671,   676,   678,   679,   680,   681,
     681,   682,   682,   684,   684,   686,   686,   688,   689,   690,
     691,   692,   693,   694,   695,   696,   697,   698,   699,   699,
     702,   705,   706,   707,   708,   709,   710,   713,   715,   716,
     717,   720,   722,   723,   724,   725,   726,   729,   738,   740,
     741,   742,   743,   744,   745,   746,   747,   748,   749,   750,
     752,   754,   756,   758,   760,   762,   764,   766,   768,   770,
     772,   774,   776,   779,   786,   788,   791,   793,   796,   798,
     803,   802,   806,   808,   811,   814,   821,   820,   831,   839,
     840,   843,   842,   854,   852,   862,   864,   865,   868,   871,
     875,   877,   880,   883,   885,   887,   889,   891,   895,   897,
     898,   899,   900,   901,   904,   906,   909,   911,   914,   916,
     919,   921,   924,   926,   934,   936,   939,   941,   944,   946,
     947,   950,   950,   954,   956,   960,   964,   966,   967,   968,
     969,   972,   974,   975,   978,   980
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
  "POINTY", "SUB", "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
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
  "'='", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'.'", "'&'", 
  "'|'", "'['", "']'", "'('", "')'", "';'", "$accept", "program", 
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
  "classname", "assignment", "@20", "@21", "the_sub", "ptr", "meth_call", 
  "@22", "sub_call", "@23", "arglist", "arg", "targetlist", 
  "if_statement", "relop", "target", "lhs", "vars", "_vars", "_var_or_i", 
  "label_op", "var_or_i", "var", "keylist", "@24", "_keylist", "key", 
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
     344,   345,   346,   347,   348,    61,    33,    45,   126,    43,
      42,    47,    37,    46,    38,   124,    91,    93,    40,    41,
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
     170,   170,   170,   170,   170,   170,   170,   176,   176,   176,
     176,   177,   177,   177,   177,   177,   177,   178,   179,   179,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     179,   179,   179,   179,   179,   179,   179,   179,   179,   179,
     180,   179,   179,   179,   179,   179,   181,   179,   182,   183,
     183,   185,   184,   187,   186,   188,   188,   188,   189,   189,
     190,   190,   191,   191,   191,   191,   191,   191,   192,   192,
     192,   192,   192,   192,   193,   193,   194,   194,   195,   195,
     196,   196,   197,   197,   198,   198,   199,   199,   200,   200,
     200,   202,   201,   203,   203,   204,   205,   205,   205,   205,
     205,   206,   206,   206,   207,   207
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
       2,     1,     1,     1,     1,     1,     0,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     3,     4,
       4,     4,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     6,     6,
       6,     4,     4,     6,     4,     7,     4,     4,     4,     4,
       0,     3,     4,     7,     4,     3,     0,     9,     1,     1,
       1,     0,     7,     0,     5,     0,     3,     1,     1,     2,
       3,     1,     6,     6,     4,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       3,     1,     1,     4,     1,     1,     1,     1,     1,     1,
       1,     0,     2,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       0,    12,     0,    41,    15,     0,    50,    28,     0,     0,
       2,     3,     7,     6,    10,     5,     8,     9,    30,     0,
       0,   141,   142,   143,   144,   145,   147,     0,   146,     0,
      99,    11,     1,     4,     0,    64,     0,    13,    64,   103,
       0,    22,    21,    99,    17,    23,   100,   102,    33,    62,
      63,    69,    68,    70,    71,    67,     0,    66,     0,     0,
       0,    20,    29,    18,    64,     0,     0,   101,    38,     0,
       0,     0,    32,    34,    36,    37,    42,     0,     0,   243,
     241,   242,    14,    51,     0,    19,   218,     0,     0,    31,
      35,    44,    65,    16,    53,    25,   236,   237,   238,   239,
     224,   240,   225,   228,    24,     0,    27,   219,   221,   226,
     222,   227,   229,   230,     0,     0,    45,    94,    54,    94,
     231,     0,    39,    40,    47,     0,    98,    97,     0,    43,
      94,    99,    92,    56,    52,     0,     0,     0,   220,     0,
      96,    46,    49,    93,   136,    95,     0,    55,   223,   228,
     235,   232,   233,   229,     0,   115,     0,     0,     0,     0,
       0,   127,   125,   126,   180,   128,     0,     0,   109,   111,
       0,     0,   113,     0,     0,     0,     0,     0,     0,     0,
       0,   188,   218,   214,   133,   134,   135,     0,   105,     0,
     193,   132,   131,   106,     0,     0,   215,     0,     0,    48,
       0,   117,   121,   122,   119,     0,     0,   218,   218,   107,
     108,     0,     0,   123,   124,     0,   214,     0,   215,   244,
     245,     0,     0,   118,   120,     0,    84,    86,   130,   189,
     190,     0,   104,     0,     0,     0,   231,    57,   234,     0,
       0,   208,   209,   210,   211,   212,   213,     0,     0,     0,
       0,     0,   181,   129,     0,     0,     0,     0,     0,     0,
      58,    88,    88,   191,     0,   201,   195,     0,   137,   138,
     139,   140,     0,     0,     0,     0,     0,     0,     0,     0,
     185,   148,     0,   116,   204,   206,     0,   205,   207,     0,
     110,     0,     0,   182,   179,   184,    75,     0,     0,     0,
       0,     0,     0,     0,   197,   198,   171,   174,   178,   177,
     176,   149,   150,   151,   172,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   231,     0,     0,     0,     0,     0,   231,     0,    89,
       0,    85,     0,    87,   195,   200,     0,   199,     0,   194,
       0,   231,     0,   159,   160,   164,   155,   161,   162,   163,
     153,   167,   152,   154,   156,   157,   158,   165,   166,     0,
       0,   202,   203,   112,   114,     0,     0,     0,     0,     0,
      60,     0,    91,    90,     0,     0,   196,   170,     0,   173,
     168,   169,   183,    77,    78,     0,     0,    79,     0,    76,
     192,   195,   175,    73,     0,    74,     0,    61,     0,     0,
      82,     0,    59,     0,   187,    72,     0,    81,    80,     0,
      83
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     9,    10,    11,    12,    13,    20,    43,    44,    65,
      66,   104,    14,    30,    15,    34,    71,    72,    73,    74,
      75,    16,    19,    91,   117,   128,   139,   129,    17,    29,
      94,   119,   135,   146,   184,   296,   397,    55,    56,    57,
     380,   338,   381,   406,   413,   416,   185,   261,   186,   262,
     297,   342,   130,   131,   132,    45,    46,    47,   145,   187,
     211,   212,   215,   200,   208,   279,    27,    28,   188,   207,
     189,   190,   231,   191,   299,   192,   234,   303,   304,   264,
     193,   248,   194,   105,   106,   107,   108,   109,   110,   111,
     136,   137,   151,   152,   153,   113,   221
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -330
static const short yypact[] =
{
       5,  -330,   -54,  -330,  -330,   104,  -330,  -330,    30,    56,
       5,  -330,  -330,  -330,  -330,  -330,  -330,  -330,  -330,   -46,
     104,  -330,  -330,  -330,  -330,  -330,  -330,   -18,  -330,    31,
      92,  -330,  -330,  -330,    69,   258,    33,    19,   258,  -330,
     100,  -330,  -330,    57,  -330,     9,    43,  -330,    17,  -330,
    -330,  -330,  -330,  -330,  -330,  -330,    15,  -330,    26,   -41,
      20,  -330,  -330,  -330,   258,   118,    34,  -330,  -330,   104,
      44,    72,    17,  -330,  -330,  -330,  -330,   258,   -41,  -330,
    -330,  -330,  -330,  -330,   -10,  -330,   152,    46,    47,  -330,
    -330,   129,  -330,  -330,   144,  -330,  -330,  -330,  -330,  -330,
    -330,  -330,  -330,    48,  -330,    49,  -330,   101,  -330,  -330,
    -330,  -330,    54,  -330,   148,   158,  -330,    -1,  -330,    12,
    -330,   152,  -330,  -330,  -330,   159,  -330,  -330,   160,  -330,
     -30,    43,  -330,  -330,  -330,   170,    68,   214,  -330,   104,
    -330,  -330,  -330,  -330,   256,  -330,   104,  -330,  -330,  -330,
    -330,    66,  -330,  -330,    94,   167,   -68,   -68,   214,   214,
     214,  -330,  -330,  -330,  -330,  -330,    95,    98,  -330,  -330,
     214,   214,  -330,   285,   -50,   285,   214,   214,    40,   183,
     185,  -330,   152,   -22,  -330,  -330,  -330,   186,  -330,    86,
    -330,  -330,  -330,  -330,   119,    87,   107,   131,   214,  -330,
     104,  -330,  -330,  -330,  -330,   268,   312,   152,   152,  -330,
    -330,   104,   104,  -330,  -330,   104,  -330,   157,  -330,  -330,
    -330,   124,   162,  -330,  -330,   216,  -330,  -330,  -330,  -330,
    -330,   139,  -330,   285,   116,   333,  -330,  -330,  -330,   142,
     -68,  -330,  -330,  -330,  -330,  -330,  -330,   -68,   214,   -68,
     -68,   214,  -330,  -330,   143,   146,   161,   214,   214,   214,
    -330,  -330,  -330,  -330,   -40,  -330,    85,   168,  -330,  -330,
    -330,  -330,   214,   -50,   169,   214,   214,   214,   214,   172,
    -330,   335,   121,  -330,  -330,  -330,   233,  -330,  -330,   234,
    -330,   163,   171,   156,  -330,  -330,  -330,    10,     7,   166,
     285,   180,   285,   -31,  -330,  -330,   194,   175,  -330,  -330,
    -330,  -330,  -330,  -330,   223,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,  -330,   189,   -68,   -68,   -41,   -41,  -330,    38,  -330,
     214,  -330,   287,  -330,    85,  -330,   208,  -330,    85,  -330,
     214,  -330,   219,  -330,  -330,  -330,  -330,  -330,  -330,  -330,
    -330,  -330,  -330,  -330,  -330,  -330,  -330,  -330,  -330,   197,
     214,  -330,  -330,  -330,  -330,   198,   214,   285,   214,   214,
      43,   304,  -330,  -330,    -6,   211,  -330,  -330,   218,  -330,
    -330,  -330,  -330,  -330,  -330,    22,   317,  -330,   319,  -330,
    -330,    85,  -330,  -330,   214,  -330,    55,  -330,     1,   322,
    -330,   285,  -330,   341,  -330,  -330,   104,  -330,  -330,   262,
    -330
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -330,  -330,  -330,   344,  -330,  -330,  -330,  -330,   320,  -330,
    -330,  -121,  -330,  -330,  -330,  -330,  -330,  -330,   283,  -330,
    -330,  -330,  -330,  -330,  -330,  -330,  -330,   243,  -330,  -330,
    -330,  -330,  -330,  -330,  -330,  -330,  -330,   191,   -11,   297,
    -330,  -330,  -330,  -330,  -330,  -330,  -330,  -330,  -330,  -330,
     114,  -330,  -330,  -330,   249,   250,  -330,   -45,  -330,  -330,
    -330,  -330,  -330,  -330,  -330,  -330,   -20,   113,  -330,  -330,
    -330,    36,  -330,  -330,  -330,   153,  -330,  -329,    35,  -330,
    -330,   181,  -165,  -330,   207,  -330,   269,  -150,  -330,  -119,
    -224,  -330,  -330,   199,   -84,   -56,   122
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -230
static const short yytable[] =
{
      36,    67,   112,    82,   124,   229,   202,   203,   217,     1,
     222,   339,   282,   -26,   339,   384,   100,   133,   150,    76,
     300,    68,    93,   102,    83,   195,   403,    60,     2,   348,
      18,   142,   219,     3,    31,   220,     4,   112,    35,   204,
     205,   206,    69,    70,    79,    80,    81,   376,   377,    87,
      77,   213,   214,    84,   348,     5,    32,   223,   224,   125,
     196,   348,   340,   126,   127,   340,    37,    95,   265,   301,
       6,   201,   408,    48,    64,    77,   343,   341,   349,   150,
      77,   230,   404,     7,  -228,   410,   252,   253,   125,   218,
     284,   218,   126,   127,     8,   302,    89,   285,   112,   287,
     288,   125,   378,   400,    61,   126,   127,   369,   379,   411,
     414,    49,    50,   375,    59,    38,   281,    58,   412,   154,
      39,    78,    85,   112,   112,    86,   197,   388,    88,   286,
     114,   115,   289,   116,    39,   345,    62,   347,   293,   294,
     295,    21,    22,    23,    24,    25,    40,   305,   118,   218,
      41,    42,   122,   307,  -216,   120,   310,   311,   312,   313,
    -217,   121,   123,   140,   141,    96,    97,    98,    99,    39,
      79,    80,    81,   101,   147,   148,   198,   149,   199,   209,
     239,    40,   210,   371,   372,    41,    42,   226,    26,   227,
     232,   254,   255,   236,   233,   256,   353,   354,   355,   356,
     357,   358,   359,   360,   361,   362,   363,   364,   365,   366,
     367,   368,   394,  -229,   235,   237,   218,   257,   218,   258,
     260,   382,   259,   263,   266,   305,   283,   290,   332,   305,
     291,   387,    96,    97,    98,    99,   100,    79,    80,    81,
     101,   333,   334,   102,   103,   292,   417,    96,    97,    98,
      99,   391,    26,   309,   350,   101,   314,   393,   335,   395,
     396,   155,   337,   156,   157,   158,   336,   159,   160,   161,
     162,   163,   164,   165,   344,   346,   240,   166,   167,   373,
     374,   351,   305,   352,   370,   409,   168,   169,   170,   171,
     172,   383,   181,   218,    96,    97,    98,    99,   173,    79,
      80,    81,   101,   389,   390,   392,   149,   174,   399,   175,
     176,   177,   241,   242,   243,   244,   245,   246,   178,   401,
     249,   405,   179,   407,   180,   402,   415,   218,   247,    49,
      50,    51,    52,    53,    54,   398,    96,    97,    98,    99,
     181,    79,    80,    81,   101,   418,   420,   182,   183,   267,
     268,   269,   270,   271,    33,    90,   241,   242,   243,   244,
     245,   246,   134,    63,  -186,    96,    97,    98,    99,   225,
     315,   316,   250,   101,    92,   272,   298,   216,   317,   143,
     306,   144,   385,   386,   273,   274,   275,   251,   280,   228,
     138,   318,   319,   320,   321,   308,   419,   238,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    96,    97,    98,    99,   181,    79,    80,
      81,   101,     0,     0,     0,   149,     0,     0,     0,   276,
     277,   278,   322,   323,   324,   325,   326,   327,   328,   329,
     330,   331
};

static const short yycheck[] =
{
      20,    46,    86,    59,     5,    27,   156,   157,   173,     4,
     175,     4,   236,     4,     4,   344,    84,     5,   137,     4,
      60,     4,    78,    91,     4,   144,     4,    38,    23,    60,
      84,    61,    82,    28,     4,    85,    31,   121,    84,   158,
     159,   160,    25,    26,    85,    86,    87,     9,    10,    69,
      60,   170,   171,    64,    60,    50,     0,   176,   177,    89,
     144,    60,    55,    93,    94,    55,    84,    77,   233,   109,
      65,   155,   401,     4,    65,    60,    69,    67,   109,   198,
      60,   103,    60,    78,   106,    30,   207,   208,    89,   173,
     240,   175,    93,    94,    89,    10,    24,   247,   182,   249,
     250,    89,    64,   109,     4,    93,    94,   331,    70,    54,
     109,    71,    72,   337,    95,    84,   235,    84,    63,   139,
      77,    95,     4,   207,   208,    91,   146,   351,    84,   248,
      84,    84,   251,     4,    77,   300,    79,   302,   257,   258,
     259,    37,    38,    39,    40,    41,    89,   266,     4,   233,
      93,    94,     4,   272,   106,   106,   275,   276,   277,   278,
     106,    60,     4,     4,     4,    80,    81,    82,    83,    77,
      85,    86,    87,    88,     4,   107,   110,    92,    84,    84,
     200,    89,    84,   333,   334,    93,    94,     4,    84,     4,
       4,   211,   212,   106,   108,   215,   315,   316,   317,   318,
     319,   320,   321,   322,   323,   324,   325,   326,   327,   328,
     329,   330,   377,   106,    95,    84,   300,    60,   302,    95,
       4,   340,    60,    84,   108,   344,    84,    84,   107,   348,
      84,   350,    80,    81,    82,    83,    84,    85,    86,    87,
      88,     8,     8,    91,    92,    84,   411,    80,    81,    82,
      83,   370,    84,    84,    60,    88,    84,   376,    95,   378,
     379,     5,   106,     7,     8,     9,    95,    11,    12,    13,
      14,    15,    16,    17,   108,    95,     8,    21,    22,   335,
     336,   106,   401,    60,    95,   404,    30,    31,    32,    33,
      34,     4,    84,   377,    80,    81,    82,    83,    42,    85,
      86,    87,    88,    84,   107,   107,    92,    51,     4,    53,
      54,    55,    44,    45,    46,    47,    48,    49,    62,   108,
       8,     4,    66,     4,    68,   107,     4,   411,    60,    71,
      72,    73,    74,    75,    76,   380,    80,    81,    82,    83,
      84,    85,    86,    87,    88,     4,    84,    91,    92,    16,
      17,    18,    19,    20,    10,    72,    44,    45,    46,    47,
      48,    49,   119,    43,   108,    80,    81,    82,    83,   178,
      35,    36,    60,    88,    77,    42,   262,    92,    43,   130,
     267,   131,   346,   348,    51,    52,    53,   206,   235,   182,
     121,    56,    57,    58,    59,   273,   416,   198,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    -1,    -1,    -1,    92,    -1,    -1,    -1,    96,
      97,    98,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    23,    28,    31,    50,    65,    78,    89,   112,
     113,   114,   115,   116,   123,   125,   132,   139,    84,   133,
     117,    37,    38,    39,    40,    41,    84,   177,   178,   140,
     124,     4,     0,   114,   126,    84,   177,    84,    84,    77,
      89,    93,    94,   118,   119,   166,   167,   168,     4,    71,
      72,    73,    74,    75,    76,   148,   149,   150,    84,    95,
     149,     4,    79,   119,    65,   120,   121,   168,     4,    25,
      26,   127,   128,   129,   130,   131,     4,    60,    95,    85,
      86,    87,   206,     4,   149,     4,    91,   177,    84,    24,
     129,   134,   150,   206,   141,    77,    80,    81,    82,    83,
      84,    88,    91,    92,   122,   194,   195,   196,   197,   198,
     199,   200,   205,   206,    84,    84,     4,   135,     4,   142,
     106,    60,     4,     4,     5,    89,    93,    94,   136,   138,
     163,   164,   165,     5,   138,   143,   201,   202,   197,   137,
       4,     4,    61,   165,   166,   169,   144,     4,   107,    92,
     200,   203,   204,   205,   177,     5,     7,     8,     9,    11,
      12,    13,    14,    15,    16,    17,    21,    22,    30,    31,
      32,    33,    34,    42,    51,    53,    54,    55,    62,    66,
      68,    84,    91,    92,   145,   157,   159,   170,   179,   181,
     182,   184,   186,   191,   193,   200,   205,   177,   110,    84,
     174,   205,   198,   198,   200,   200,   200,   180,   175,    84,
      84,   171,   172,   200,   200,   173,    92,   193,   205,    82,
      85,   207,   193,   200,   200,   148,     4,     4,   195,    27,
     103,   183,     4,   108,   187,    95,   106,    84,   204,   177,
       8,    44,    45,    46,    47,    48,    49,    60,   192,     8,
      60,   192,   122,   122,   177,   177,   177,    60,    95,    60,
       4,   158,   160,    84,   190,   193,   108,    16,    17,    18,
      19,    20,    42,    51,    52,    53,    96,    97,    98,   176,
     186,   200,   201,    84,   198,   198,   200,   198,   198,   200,
      84,    84,    84,   200,   200,   200,   146,   161,   161,   185,
      60,   109,    10,   188,   189,   200,   178,   200,   207,    84,
     200,   200,   200,   200,    84,    35,    36,    43,    56,    57,
      58,    59,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,     8,     8,    95,    95,   106,   152,     4,
      55,    67,   162,    69,   108,   193,    95,   193,    60,   109,
      60,   106,    60,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   201,
      95,   198,   198,   206,   206,   201,     9,    10,    64,    70,
     151,   153,   200,     4,   188,   182,   189,   200,   201,    84,
     107,   200,   107,   200,   193,   200,   200,   147,   168,     4,
     109,   108,   107,     4,    60,     4,   154,     4,   188,   200,
      30,    54,    63,   155,   109,     4,   156,   193,     4,   177,
      84
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
#line 290 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 299 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 300 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 301 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 302 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 303 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 304 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 305 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 306 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 311 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 14:
#line 316 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 323 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 16:
#line 324 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 19:
#line 333 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 20:
#line 334 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 335 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 336 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 339 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 24:
#line 341 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 25:
#line 344 "imcc/imcc.y"
    { char *name = str_dup(yyvsp[0].s);
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(name, 0);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 26:
#line 349 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 28:
#line 357 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 29:
#line 360 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 30:
#line 370 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 31:
#line 377 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 33:
#line 386 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 38:
#line 397 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 39:
#line 402 "imcc/imcc.y"
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
#line 416 "imcc/imcc.y"
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
#line 432 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 42:
#line 437 "imcc/imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 43:
#line 444 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 44:
#line 448 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 45:
#line 449 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 46:
#line 450 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 47:
#line 454 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 48:
#line 455 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 49:
#line 459 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 463 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 51:
#line 465 "imcc/imcc.y"
    {
            char *name = str_dup(yyvsp[-2].s);
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 52:
#line 472 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 476 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 477 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 55:
#line 478 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 56:
#line 482 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 57:
#line 483 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 58:
#line 488 "imcc/imcc.y"
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
#line 513 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 60:
#line 517 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-2].sr ->pcc_sub->label = 0; }
    break;

  case 61:
#line 518 "imcc/imcc.y"
    { yyval.i = NULL;  yyvsp[-4].sr ->pcc_sub->label = 1; }
    break;

  case 62:
#line 522 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 63:
#line 523 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 64:
#line 527 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 65:
#line 528 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 66:
#line 529 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 68:
#line 533 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 69:
#line 534 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 70:
#line 535 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 71:
#line 536 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 72:
#line 541 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
            add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
         }
    break;

  case 73:
#line 546 "imcc/imcc.y"
    {  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr); }
    break;

  case 74:
#line 548 "imcc/imcc.y"
    {
            add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
            yyvsp[-4].sr ->pcc_sub->nci = 1;
         }
    break;

  case 75:
#line 555 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 76:
#line 556 "imcc/imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 77:
#line 560 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 78:
#line 561 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 79:
#line 565 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 80:
#line 566 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 81:
#line 571 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 82:
#line 572 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 83:
#line 573 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 84:
#line 578 "imcc/imcc.y"
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
#line 593 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 86:
#line 598 "imcc/imcc.y"
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
#line 614 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 88:
#line 618 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 89:
#line 620 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 90:
#line 622 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 91:
#line 626 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 94:
#line 643 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 95:
#line 648 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 96:
#line 649 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 97:
#line 650 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 98:
#line 651 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 99:
#line 655 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 103:
#line 665 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 104:
#line 673 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 107:
#line 679 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 108:
#line 680 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 109:
#line 681 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 110:
#line 681 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 111:
#line 682 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 112:
#line 683 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 113:
#line 684 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 114:
#line 685 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 115:
#line 686 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 116:
#line 686 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 117:
#line 688 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 118:
#line 689 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 119:
#line 690 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 120:
#line 691 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 121:
#line 692 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 122:
#line 693 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 123:
#line 694 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 124:
#line 695 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 125:
#line 696 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 126:
#line 697 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 127:
#line 698 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 128:
#line 699 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 129:
#line 701 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 130:
#line 703 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 131:
#line 705 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 132:
#line 706 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 133:
#line 707 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 136:
#line 710 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 137:
#line 714 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 138:
#line 715 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 139:
#line 716 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 140:
#line 717 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 141:
#line 721 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 142:
#line 722 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 143:
#line 723 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 144:
#line 724 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 145:
#line 725 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 146:
#line 726 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 147:
#line 731 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 148:
#line 739 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 149:
#line 740 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 150:
#line 741 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 151:
#line 742 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 152:
#line 743 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 153:
#line 744 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 154:
#line 745 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 155:
#line 746 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 156:
#line 747 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 748 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 749 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 159:
#line 751 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 753 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 755 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 757 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 759 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 761 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 763 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 765 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 767 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 769 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 169:
#line 771 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 773 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 171:
#line 775 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 172:
#line 777 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 173:
#line 780 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 174:
#line 787 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 789 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 176:
#line 792 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 794 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 178:
#line 797 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 179:
#line 799 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 180:
#line 803 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 181:
#line 805 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 182:
#line 807 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 183:
#line 809 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 184:
#line 812 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 185:
#line 815 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 186:
#line 821 "imcc/imcc.y"
    {
            yyval.i = create_itcall_label();
         }
    break;

  case 187:
#line 825 "imcc/imcc.y"
    {
           itcall_sub(yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 188:
#line 831 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 189:
#line 839 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 190:
#line 840 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 191:
#line 843 "imcc/imcc.y"
    {
           yyval.i = create_itcall_label();
           itcall_sub(mk_sub_address(yyvsp[0].s));
           current_call->r[0]->pcc_sub->object = yyvsp[-2].sr;
         }
    break;

  case 192:
#line 849 "imcc/imcc.y"
    {  yyval.i = yyvsp[-5].i; }
    break;

  case 193:
#line 854 "imcc/imcc.y"
    {
           yyval.i = create_itcall_label();
           itcall_sub(yyvsp[0].sr);
        }
    break;

  case 194:
#line 859 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 195:
#line 863 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 196:
#line 864 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 197:
#line 865 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 198:
#line 870 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 199:
#line 872 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 200:
#line 876 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 201:
#line 877 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 202:
#line 882 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 884 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 886 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 888 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 890 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 892 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 896 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 209:
#line 897 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 210:
#line 898 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 211:
#line 899 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 212:
#line 900 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 213:
#line 901 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 218:
#line 915 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 219:
#line 916 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 220:
#line 920 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 222:
#line 925 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 223:
#line 927 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 224:
#line 935 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 225:
#line 936 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 231:
#line 950 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 232:
#line 951 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 233:
#line 955 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 234:
#line 957 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 236:
#line 965 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 237:
#line 966 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 238:
#line 967 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 239:
#line 968 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 240:
#line 969 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 241:
#line 973 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 242:
#line 974 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 243:
#line 975 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 244:
#line 979 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 245:
#line 980 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2986 "imcc/imcparser.c"

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


#line 985 "imcc/imcc.y"



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

