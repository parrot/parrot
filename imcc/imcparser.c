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
     PLUS_ASSIGN = 288,
     MINUS_ASSIGN = 289,
     MUL_ASSIGN = 290,
     DIV_ASSIGN = 291,
     BAND_ASSIGN = 292,
     BOR_ASSIGN = 293,
     BXOR_ASSIGN = 294,
     SHR_ASSIGN = 295,
     SHL_ASSIGN = 296,
     SHR_U_ASSIGN = 297,
     SHIFT_LEFT = 298,
     SHIFT_RIGHT = 299,
     INTV = 300,
     FLOATV = 301,
     STRINGV = 302,
     PMCV = 303,
     OBJECTV = 304,
     DEFINED = 305,
     LOG_XOR = 306,
     RELOP_EQ = 307,
     RELOP_NE = 308,
     RELOP_GT = 309,
     RELOP_GTE = 310,
     RELOP_LT = 311,
     RELOP_LTE = 312,
     GLOBAL = 313,
     GLOBALOP = 314,
     ADDR = 315,
     CLONE = 316,
     RESULT = 317,
     RETURN = 318,
     POW = 319,
     SHIFT_RIGHT_U = 320,
     LOG_AND = 321,
     LOG_OR = 322,
     COMMA = 323,
     ESUB = 324,
     PCC_BEGIN = 325,
     PCC_END = 326,
     PCC_CALL = 327,
     PCC_SUB = 328,
     PCC_BEGIN_RETURN = 329,
     PCC_END_RETURN = 330,
     PCC_BEGIN_YIELD = 331,
     PCC_END_YIELD = 332,
     NCI_CALL = 333,
     METH_CALL = 334,
     INVOCANT = 335,
     PROTOTYPED = 336,
     NON_PROTOTYPED = 337,
     MAIN = 338,
     LOAD = 339,
     IMMEDIATE = 340,
     POSTCOMP = 341,
     METHOD = 342,
     LABEL = 343,
     EMIT = 344,
     EOM = 345,
     IREG = 346,
     NREG = 347,
     SREG = 348,
     PREG = 349,
     IDENTIFIER = 350,
     STRINGC = 351,
     INTC = 352,
     FLOATC = 353,
     REG = 354,
     MACRO = 355,
     ENDM = 356,
     PARROT_OP = 357,
     VAR = 358,
     LINECOMMENT = 359,
     FILECOMMENT = 360,
     DOT = 361,
     CONCAT = 362,
     POINTY = 363
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
#define PLUS_ASSIGN 288
#define MINUS_ASSIGN 289
#define MUL_ASSIGN 290
#define DIV_ASSIGN 291
#define BAND_ASSIGN 292
#define BOR_ASSIGN 293
#define BXOR_ASSIGN 294
#define SHR_ASSIGN 295
#define SHL_ASSIGN 296
#define SHR_U_ASSIGN 297
#define SHIFT_LEFT 298
#define SHIFT_RIGHT 299
#define INTV 300
#define FLOATV 301
#define STRINGV 302
#define PMCV 303
#define OBJECTV 304
#define DEFINED 305
#define LOG_XOR 306
#define RELOP_EQ 307
#define RELOP_NE 308
#define RELOP_GT 309
#define RELOP_GTE 310
#define RELOP_LT 311
#define RELOP_LTE 312
#define GLOBAL 313
#define GLOBALOP 314
#define ADDR 315
#define CLONE 316
#define RESULT 317
#define RETURN 318
#define POW 319
#define SHIFT_RIGHT_U 320
#define LOG_AND 321
#define LOG_OR 322
#define COMMA 323
#define ESUB 324
#define PCC_BEGIN 325
#define PCC_END 326
#define PCC_CALL 327
#define PCC_SUB 328
#define PCC_BEGIN_RETURN 329
#define PCC_END_RETURN 330
#define PCC_BEGIN_YIELD 331
#define PCC_END_YIELD 332
#define NCI_CALL 333
#define METH_CALL 334
#define INVOCANT 335
#define PROTOTYPED 336
#define NON_PROTOTYPED 337
#define MAIN 338
#define LOAD 339
#define IMMEDIATE 340
#define POSTCOMP 341
#define METHOD 342
#define LABEL 343
#define EMIT 344
#define EOM 345
#define IREG 346
#define NREG 347
#define SREG 348
#define PREG 349
#define IDENTIFIER 350
#define STRINGC 351
#define INTC 352
#define FLOATC 353
#define REG 354
#define MACRO 355
#define ENDM 356
#define PARROT_OP 357
#define VAR 358
#define LINECOMMENT 359
#define FILECOMMENT 360
#define DOT 361
#define CONCAT 362
#define POINTY 363




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
#line 529 "imcc/imcparser.c"
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
#line 550 "imcc/imcparser.c"

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
#define YYLAST   503

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  125
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  97
/* YYNRULES -- Number of rules. */
#define YYNRULES  264
/* YYNRULES -- Number of states. */
#define YYNSTATES  458

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   363

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   113,     2,     2,     2,   119,   120,     2,
     122,   123,   117,   116,     2,   114,     2,   118,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   124,
       2,   110,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   111,     2,   112,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   121,     2,   115,     2,     2,     2,
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
      96,    97,    98,    99,   100,   101,   102,   103,   104,   105,
     106,   107,   108,   109
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
     623,   627,   632,   640,   645,   649,   650,   660,   662,   666,
     670,   674,   678,   682,   686,   690,   694,   698,   702,   704,
     706,   710,   714,   718,   720,   722,   723,   729,   730,   734,
     736,   738,   741,   745,   747,   754,   761,   766,   771,   776,
     781,   783,   785,   787,   789,   791,   793,   795,   797,   798,
     800,   804,   806,   808,   813,   815,   817,   819,   821,   823,
     825,   826,   829,   831,   835,   837,   839,   841,   843,   845,
     847,   849,   851,   853,   855
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     126,     0,    -1,   127,    -1,   128,    -1,   127,   128,    -1,
     140,    -1,   139,    -1,   130,    -1,   129,    -1,   147,    -1,
     154,    -1,   137,    -1,   101,     4,    -1,     4,    -1,    59,
     193,    96,    -1,    59,   193,    96,   110,   220,    -1,    -1,
      30,   131,   193,    96,   110,   220,    -1,   133,    -1,   132,
     133,    -1,   182,   134,     4,    -1,   101,     4,    -1,   106,
      -1,   105,    -1,   139,    -1,    -1,   135,   103,   136,    -1,
      74,   165,    89,    -1,    -1,   209,    -1,    -1,    90,   138,
     132,    91,    -1,    21,   111,   215,   112,    -1,    -1,    23,
      96,   141,     4,   142,    24,    -1,   143,    -1,    -1,   144,
      -1,   143,   144,    -1,   145,    -1,   146,    -1,     4,    -1,
      25,   193,    96,     4,    -1,    26,    96,    96,     4,    -1,
      -1,    -1,    27,   148,    96,   165,     4,   149,   150,   153,
      -1,    -1,     4,    -1,   150,   151,     4,    -1,    -1,     5,
     152,   193,    96,    -1,   179,    70,    -1,    -1,    -1,    74,
     155,    96,   165,     4,   156,   157,   153,    -1,    -1,     4,
      -1,   157,   158,     4,    -1,    -1,     5,   159,   193,    96,
      -1,    -1,    71,   164,     4,   161,   168,   163,   167,   162,
     170,    72,    -1,    -1,   184,     4,    -1,    -1,    81,   214,
       4,    -1,    82,    -1,    83,    -1,    -1,   165,    69,   166,
      -1,   166,    -1,   164,    -1,    85,    -1,    84,    -1,    86,
      -1,    87,    -1,    88,    -1,    73,   214,    69,   214,     4,
      -1,    73,   214,     4,    -1,    79,   214,     4,    -1,    80,
     208,     4,    -1,    80,    97,     4,    -1,    80,   208,    69,
     214,     4,    -1,    80,    97,    69,   214,     4,    -1,    -1,
     168,   169,     4,    -1,     9,   214,    -1,    10,   208,    -1,
      -1,   170,   171,     4,    -1,    63,   208,    -1,    -1,    29,
     172,   193,    96,    -1,    -1,    75,     4,   174,   177,    76,
      -1,    -1,    77,     4,   176,   177,    78,    -1,    -1,   177,
       4,    -1,   177,   178,     4,    -1,    64,   214,    -1,   181,
      -1,   179,   181,    -1,    -1,   180,   185,    -1,   101,     4,
      -1,   106,    -1,   105,    -1,    -1,   183,    -1,   183,   184,
      -1,   184,    -1,    89,    -1,   182,   186,     4,    -1,   195,
      -1,   206,    -1,    21,    96,    -1,    22,    96,    -1,    -1,
      29,   187,   193,    96,    -1,    -1,    30,   188,   193,    96,
     110,   220,    -1,    -1,    33,   189,   193,    96,   110,   220,
      -1,    -1,     5,   190,   193,    96,    -1,     5,   219,    -1,
      63,   214,    -1,     9,   214,    -1,    64,   214,    -1,     7,
     212,    -1,     8,   212,    -1,    31,   214,    -1,    32,   214,
      -1,    14,    -1,    15,    -1,    13,    -1,    -1,    17,   191,
     136,    -1,   103,   209,    -1,   201,    -1,   160,    -1,   173,
      -1,   175,    -1,    -1,    17,    -1,    18,    -1,    19,    -1,
      20,    -1,    46,    -1,    47,    -1,    48,    -1,    49,    -1,
      50,    -1,   194,    -1,    96,    -1,   208,   110,   214,    -1,
     208,   110,   113,   214,    -1,   208,   110,   114,   214,    -1,
     208,   110,   115,   214,    -1,   208,   110,   214,   116,   214,
      -1,   208,   110,   214,   114,   214,    -1,   208,   110,   214,
     117,   214,    -1,   208,   110,   214,    65,   214,    -1,   208,
     110,   214,   118,   214,    -1,   208,   110,   214,   119,   214,
      -1,   208,   110,   214,   108,   214,    -1,   208,   110,   214,
      44,   214,    -1,   208,   110,   214,    45,   214,    -1,   208,
     110,   214,    66,   214,    -1,   208,   110,   214,    67,   214,
      -1,   208,   110,   214,    68,   214,    -1,   208,   110,   214,
      52,   214,    -1,   208,   110,   214,   120,   214,    -1,   208,
     110,   214,   121,   214,    -1,   208,   110,   214,   115,   214,
      -1,   208,   110,   214,   111,   215,   112,    -1,   208,   111,
     215,   112,   110,   214,    -1,   208,   110,    16,   194,    69,
     214,    -1,   208,   110,    16,   194,    -1,   208,   110,   192,
      96,    -1,   208,   110,   192,    96,    69,    96,    -1,   208,
     110,    51,   214,    -1,   208,   110,    51,   214,   111,   215,
     112,    -1,   208,   110,    62,   214,    -1,   208,   110,    61,
      96,    -1,   208,   110,    60,   221,    -1,    60,   221,   110,
     214,    -1,    -1,    16,   196,   136,    -1,    51,   208,    69,
     214,    -1,    51,   208,    69,   214,   111,   215,   112,    -1,
      62,   208,    69,   214,    -1,   208,   110,   201,    -1,    -1,
     197,   122,   205,   123,   110,   199,   122,   203,   123,    -1,
     198,    -1,   208,    34,   214,    -1,   208,    35,   214,    -1,
     208,    36,   214,    -1,   208,    37,   214,    -1,   208,    38,
     214,    -1,   208,    39,   214,    -1,   208,    40,   214,    -1,
     208,    41,   214,    -1,   208,    42,   214,    -1,   208,    43,
     214,    -1,    96,    -1,   104,    -1,   208,   200,    96,    -1,
     208,   200,    97,    -1,   208,   200,   208,    -1,   109,    -1,
     107,    -1,    -1,   199,   202,   122,   203,   123,    -1,    -1,
     203,    69,   204,    -1,   204,    -1,   214,    -1,    10,   208,
      -1,   205,    69,   208,    -1,   208,    -1,    11,   214,   207,
     214,     8,   212,    -1,    12,   214,   207,   214,     8,   212,
      -1,    11,   214,     8,   212,    -1,    12,   214,     8,   212,
      -1,    11,   214,    69,   212,    -1,    12,   214,    69,   212,
      -1,    53,    -1,    54,    -1,    55,    -1,    56,    -1,    57,
      -1,    58,    -1,   104,    -1,   219,    -1,    -1,   210,    -1,
     210,    69,   211,    -1,   211,    -1,   213,    -1,   208,   111,
     215,   112,    -1,    96,    -1,   103,    -1,   212,    -1,   214,
      -1,   208,    -1,   220,    -1,    -1,   216,   217,    -1,   218,
      -1,   217,   124,   218,    -1,   214,    -1,    92,    -1,    93,
      -1,    94,    -1,    95,    -1,   100,    -1,    98,    -1,    99,
      -1,    97,    -1,    94,    -1,    97,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   304,   304,   308,   310,   313,   315,   316,   317,   318,
     319,   320,   321,   322,   325,   331,   339,   338,   343,   345,
     348,   350,   351,   352,   353,   356,   356,   360,   367,   370,
     375,   374,   386,   395,   393,   409,   411,   414,   416,   419,
     421,   422,   425,   439,   457,   462,   455,   472,   474,   475,
     479,   478,   483,   488,   490,   487,   500,   502,   503,   507,
     506,   513,   511,   543,   545,   548,   550,   553,   555,   558,
     560,   561,   564,   565,   566,   567,   568,   569,   572,   578,
     580,   585,   587,   589,   593,   599,   601,   604,   606,   609,
     611,   614,   617,   617,   623,   621,   643,   641,   662,   664,
     666,   670,   674,   676,   687,   691,   694,   695,   696,   699,
     701,   704,   706,   709,   716,   721,   723,   724,   725,   726,
     726,   727,   727,   729,   729,   731,   731,   733,   734,   735,
     736,   737,   738,   739,   740,   741,   742,   743,   744,   744,
     747,   750,   751,   752,   753,   754,   757,   759,   760,   761,
     764,   766,   767,   768,   769,   770,   773,   782,   784,   785,
     786,   787,   788,   789,   790,   791,   792,   793,   794,   796,
     798,   800,   802,   804,   806,   808,   810,   812,   814,   816,
     818,   820,   823,   830,   832,   835,   837,   840,   842,   847,
     846,   850,   852,   855,   858,   865,   864,   873,   876,   879,
     881,   883,   885,   887,   889,   891,   893,   895,   899,   900,
     904,   905,   906,   909,   910,   915,   913,   923,   925,   926,
     929,   932,   936,   938,   941,   944,   946,   948,   950,   952,
     956,   958,   959,   960,   961,   962,   965,   967,   970,   972,
     975,   977,   980,   982,   990,   992,   995,   997,  1000,  1002,
    1005,  1005,  1009,  1011,  1015,  1019,  1021,  1022,  1023,  1024,
    1027,  1029,  1030,  1033,  1035
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
  "PLUS_ASSIGN", "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", 
  "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", 
  "SHR_U_ASSIGN", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", 
  "STRINGV", "PMCV", "OBJECTV", "DEFINED", "LOG_XOR", "RELOP_EQ", 
  "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", 
  "GLOBALOP", "ADDR", "CLONE", "RESULT", "RETURN", "POW", "SHIFT_RIGHT_U", 
  "LOG_AND", "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", "PCC_END", 
  "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", 
  "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", 
  "PROTOTYPED", "NON_PROTOTYPED", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", 
  "METHOD", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", 
  "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", "MACRO", "ENDM", 
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", 
  "POINTY", "'='", "'['", "']'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", 
  "'%'", "'&'", "'|'", "'('", "')'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "global", "constdef", "@1", 
  "pasmcode", "pasmline", "pasm_inst", "@2", "pasm_args", "emit", "@3", 
  "class_namespace", "class", "@4", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "@5", "@6", 
  "sub_params", "sub_param", "@7", "sub_body", "pcc_sub", "@8", "@9", 
  "pcc_params", "pcc_param", "@10", "pcc_sub_call", "@11", "opt_label", 
  "opt_invocant", "pcc_proto", "pcc_sub_proto", "proto", "pcc_call", 
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@12", "pcc_ret", 
  "@13", "pcc_yield", "@14", "pcc_returns", "pcc_return", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "labeled_inst", "@15", "@16", "@17", "@18", "@19", 
  "newsub", "type", "classname", "assignment", "@20", "@21", "op_assign", 
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
     344,   345,   346,   347,   348,   349,   350,   351,   352,   353,
     354,   355,   356,   357,   358,   359,   360,   361,   362,   363,
      61,    91,    93,    33,    45,   126,    43,    42,    47,    37,
      38,   124,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   125,   126,   127,   127,   128,   128,   128,   128,   128,
     128,   128,   128,   128,   129,   129,   131,   130,   132,   132,
     133,   133,   133,   133,   133,   135,   134,   134,   134,   136,
     138,   137,   139,   141,   140,   142,   142,   143,   143,   144,
     144,   144,   145,   146,   148,   149,   147,   150,   150,   150,
     152,   151,   153,   155,   156,   154,   157,   157,   157,   159,
     158,   161,   160,   162,   162,   163,   163,   164,   164,   165,
     165,   165,   166,   166,   166,   166,   166,   166,   167,   167,
     167,   167,   167,   167,   167,   168,   168,   169,   169,   170,
     170,   171,   172,   171,   174,   173,   176,   175,   177,   177,
     177,   178,   179,   179,   180,   181,   181,   181,   181,   182,
     182,   183,   183,   184,   185,   186,   186,   186,   186,   187,
     186,   188,   186,   189,   186,   190,   186,   186,   186,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   191,   186,
     186,   186,   186,   186,   186,   186,   192,   192,   192,   192,
     193,   193,   193,   193,   193,   193,   194,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   196,
     195,   195,   195,   195,   195,   197,   195,   195,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   198,   199,   199,
     199,   199,   199,   200,   200,   202,   201,   203,   203,   203,
     204,   204,   205,   205,   206,   206,   206,   206,   206,   206,
     207,   207,   207,   207,   207,   207,   208,   208,   209,   209,
     210,   210,   211,   211,   212,   212,   213,   213,   214,   214,
     216,   215,   217,   217,   218,   219,   219,   219,   219,   219,
     220,   220,   220,   221,   221
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
       3,     4,     7,     4,     3,     0,     9,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     1,     1,
       3,     3,     3,     1,     1,     0,     5,     0,     3,     1,
       1,     2,     3,     1,     6,     6,     4,     4,     4,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       3,     1,     1,     4,     1,     1,     1,     1,     1,     1,
       0,     2,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,    44,    16,     0,    53,    30,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     250,    33,     0,     0,   150,   151,   152,   153,   154,   156,
       0,   155,     0,   109,    12,     1,     4,     0,     0,     0,
      69,     0,    14,    69,   113,     0,    23,    22,   109,    18,
      24,    25,   110,   112,    32,   255,   256,   257,   258,   262,
     260,   261,   259,   236,   248,   254,   251,   252,   237,   249,
      36,    67,    68,    74,    73,    75,    76,    77,    72,     0,
      71,     0,     0,     0,    21,    31,    19,    69,     0,     0,
     111,     0,    41,     0,     0,     0,    35,    37,    39,    40,
      45,     0,     0,    15,    54,     0,    20,   238,   253,     0,
       0,    34,    38,    47,    70,    17,    56,    27,   244,   245,
      26,   248,    29,   239,   241,   246,   242,   247,     0,     0,
      48,   104,    57,   104,   250,     0,    42,    43,    50,     0,
     108,   107,     0,    46,   104,   109,   102,    59,    55,     0,
       0,   240,     0,   106,    49,    52,   103,   145,   105,     0,
      58,   243,     0,   125,     0,     0,     0,     0,     0,   137,
     135,   136,   189,   138,     0,     0,   119,   121,     0,     0,
     123,     0,     0,     0,     0,     0,     0,     0,     0,   208,
     238,   236,   142,   143,   144,     0,   115,     0,   197,   215,
     141,   116,     0,     0,    51,     0,   127,   131,   132,   129,
       0,     0,   238,   238,   117,   118,     0,     0,   133,   134,
       0,     0,   263,   264,     0,     0,   128,   130,     0,    94,
      96,   140,   114,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   214,   213,     0,   250,     0,
      60,     0,     0,   230,   231,   232,   233,   234,   235,     0,
       0,     0,     0,     0,   190,   139,     0,     0,     0,     0,
       0,     0,    61,    98,    98,     0,   223,   217,   198,   199,
     200,   201,   202,   203,   204,   205,   206,   207,     0,   146,
     147,   148,   149,     0,     0,     0,     0,     0,     0,     0,
       0,   194,   248,   157,     0,   210,   211,   212,   126,   226,
     228,     0,   227,   229,     0,   120,     0,     0,   191,   188,
     193,    85,     0,     0,     0,     0,     0,     0,   219,   220,
     180,   183,   187,   186,   185,   158,   159,   160,   181,     0,
       0,     0,     0,     0,     0,     0,     0,   250,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   250,    65,    99,     0,    95,     0,    97,   222,     0,
     221,     0,   216,     0,   250,     0,   168,   169,   173,   164,
     170,   171,   172,   167,     0,   162,   176,   161,   163,   165,
     166,   174,   175,     0,   224,   225,   122,   124,     0,     0,
       0,     0,     0,     0,   101,   100,     0,     0,   218,   179,
       0,   182,   177,   178,   192,    87,    88,     0,     0,     0,
       0,    63,    86,   217,   184,    66,     0,     0,     0,     0,
      89,     0,     0,    79,     0,    80,    82,     0,    81,     0,
       0,    64,   196,     0,     0,     0,    92,     0,    62,     0,
      78,    84,    83,     0,    91,    90,     0,    93
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    48,    49,    88,
      89,   120,    15,    33,    16,    17,    39,    95,    96,    97,
      98,    99,    18,    22,   113,   131,   142,   152,   143,    19,
      32,   116,   133,   149,   159,   192,   321,   430,   402,    78,
      79,    80,   421,   362,   403,   440,   449,   453,   193,   273,
     194,   274,   322,   366,   144,   145,   146,    51,    52,    53,
     158,   195,   216,   217,   220,   205,   213,   300,    30,    31,
     196,   212,   197,   198,   199,   249,   200,   234,   327,   328,
     275,   201,   260,    64,   122,   123,   124,   125,   126,   127,
      37,    38,    66,    67,    68,    69,   224
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -144
static const short yypact[] =
{
      36,  -144,   -86,   -62,  -144,  -144,     3,  -144,  -144,    39,
      47,    36,  -144,  -144,  -144,  -144,  -144,  -144,  -144,  -144,
    -144,  -144,   -42,     3,  -144,  -144,  -144,  -144,  -144,  -144,
     -38,  -144,   -34,   -12,  -144,  -144,  -144,   -47,   232,    71,
     167,    26,    17,   167,  -144,    96,  -144,  -144,   -15,  -144,
    -144,    14,    46,  -144,  -144,  -144,  -144,  -144,  -144,  -144,
    -144,  -144,  -144,  -144,  -144,  -144,    20,  -144,  -144,  -144,
      16,  -144,  -144,  -144,  -144,  -144,  -144,  -144,  -144,     4,
    -144,    18,    41,    23,  -144,  -144,  -144,   167,   137,    42,
    -144,   232,  -144,     3,    51,   128,    16,  -144,  -144,  -144,
    -144,   167,    41,  -144,  -144,   -50,  -144,    92,  -144,    57,
      68,  -144,  -144,   161,  -144,  -144,   162,  -144,  -144,  -144,
    -144,    58,  -144,   106,  -144,  -144,  -144,  -144,   176,   177,
    -144,     0,  -144,     2,  -144,    92,  -144,  -144,  -144,   194,
    -144,  -144,   205,  -144,    45,    46,  -144,  -144,  -144,   206,
     100,  -144,     3,  -144,  -144,  -144,  -144,   364,  -144,     3,
    -144,  -144,   117,    79,   -66,   -66,   232,   232,   232,  -144,
    -144,  -144,  -144,  -144,   127,   130,  -144,  -144,   232,   232,
    -144,   378,   -49,   378,   232,   232,    30,   224,   227,  -144,
      92,   110,  -144,  -144,  -144,   238,  -144,   124,  -144,  -144,
    -144,  -144,   370,   160,  -144,     3,  -144,  -144,  -144,  -144,
     392,   434,    92,    92,  -144,  -144,     3,     3,  -144,  -144,
       3,   189,  -144,  -144,   149,   195,  -144,  -144,   265,  -144,
    -144,  -144,  -144,   378,   152,   232,   232,   232,   232,   232,
     232,   232,   232,   232,   232,  -144,  -144,    63,  -144,   125,
    -144,   182,   -66,  -144,  -144,  -144,  -144,  -144,  -144,   -66,
     232,   -66,   -66,   232,  -144,  -144,   183,   184,   188,   232,
     232,   232,  -144,  -144,  -144,   -59,  -144,   173,  -144,  -144,
    -144,  -144,  -144,  -144,  -144,  -144,  -144,  -144,   190,  -144,
    -144,  -144,  -144,   232,   -49,   191,   232,   232,   232,   232,
     192,  -144,   -63,   231,   179,  -144,  -144,  -144,  -144,  -144,
    -144,   277,  -144,  -144,   281,  -144,   185,   201,   181,  -144,
    -144,  -144,     8,     7,   378,   210,   378,   -56,  -144,  -144,
     225,   211,  -144,  -144,  -144,  -144,  -144,  -144,   233,   232,
     232,   232,   232,   232,   232,   232,   232,  -144,   232,   232,
     232,   232,   232,   232,   232,   232,   213,   -66,   -66,    41,
      41,  -144,     6,  -144,   232,  -144,   289,  -144,  -144,   144,
    -144,   173,  -144,   232,  -144,   204,  -144,  -144,  -144,  -144,
    -144,  -144,  -144,  -144,   221,  -144,  -144,  -144,  -144,  -144,
    -144,  -144,  -144,   232,  -144,  -144,  -144,  -144,   222,   232,
     378,   232,   -44,   297,  -144,  -144,   216,   -63,  -144,  -144,
     228,  -144,  -144,  -144,  -144,  -144,  -144,   339,   232,   232,
     325,    46,  -144,   173,  -144,  -144,    27,   340,    28,    29,
    -144,   349,   -55,  -144,   232,  -144,  -144,   232,  -144,   232,
      -3,  -144,  -144,   350,   351,   352,  -144,   378,  -144,   354,
    -144,  -144,  -144,     3,  -144,  -144,   263,  -144
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -144,  -144,  -144,   353,  -144,  -144,  -144,  -144,   312,  -144,
    -144,   -92,  -144,  -144,   -10,  -144,  -144,  -144,  -144,   266,
    -144,  -144,  -144,  -144,  -144,  -144,  -144,  -144,   234,  -144,
    -144,  -144,  -144,  -144,  -144,  -144,  -144,  -144,  -144,   175,
     -26,   273,  -144,  -144,  -144,  -144,  -144,  -144,  -144,  -144,
    -144,  -144,   114,  -144,  -144,  -144,   240,   244,  -144,   -51,
    -144,  -144,  -144,  -144,  -144,  -144,  -144,  -144,   -23,    78,
    -144,  -144,  -144,  -144,    21,  -144,   145,  -144,   -32,    31,
    -144,  -144,   203,   -79,   209,  -144,   286,  -143,  -144,   -36,
    -131,  -144,  -144,   332,   253,   -78,   138
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -210
static const short yytable[] =
{
      41,    90,    65,   150,   103,   138,     2,   147,   100,     2,
     324,   363,   363,   371,   371,   399,   400,    83,   -28,   101,
      92,   207,   208,    50,   115,    20,   446,   104,   121,   418,
     118,   433,   436,   438,    21,   419,   420,   119,    50,   117,
       1,    93,    94,    34,   245,   222,   246,    35,   223,    24,
      25,    26,    27,    28,    40,    65,   121,     2,    42,     3,
     447,   105,    43,     4,   325,    54,     5,   372,   442,   448,
     109,   364,   364,   101,    44,    70,    85,    44,   202,   288,
     289,   290,   291,   292,   365,   367,    45,   401,    87,    45,
      46,    47,   101,    46,    47,     6,   434,   437,   439,    29,
      84,   139,   221,   139,   225,   140,   141,   140,   141,   309,
       7,   121,    71,    72,   293,   155,   310,   304,   312,   313,
     264,   265,    81,   294,   295,   296,     8,    82,   102,   162,
     209,   210,   211,   121,   121,    44,   203,     9,    59,    60,
      61,   106,   218,   219,    91,   107,   139,   110,   226,   227,
     140,   141,   111,   128,   276,    55,    56,    57,    58,   189,
      59,    60,    61,    62,   129,   130,   132,   191,   302,   134,
     307,    55,    56,    57,    58,   135,   297,   298,   299,    62,
     136,   137,   251,   326,    55,    56,    57,    58,   118,    59,
      60,    61,    62,   266,   267,   119,    63,   268,   153,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   154,
     160,   303,   161,   204,   394,   395,   384,    55,    56,    57,
      58,   305,   306,   214,   311,    62,   215,   314,   229,    63,
     398,   230,  -209,   318,   319,   320,    55,    56,    57,    58,
     189,   329,   232,   410,    62,   368,   233,   370,   191,    71,
      72,    73,    74,    75,    76,    77,   250,   331,   269,   270,
     334,   335,   336,   337,   271,    55,    56,    57,    58,   272,
      59,    60,    61,    62,   277,   339,   340,    63,   308,   315,
     316,   396,   397,   341,   317,   357,    29,   333,   338,   358,
     407,   356,   361,   405,   373,   359,   342,   343,   344,   345,
     411,   422,   375,   376,   377,   378,   379,   380,   381,   382,
     383,   360,   385,   386,   387,   388,   389,   390,   391,   392,
     369,   416,   374,   393,    55,    56,    57,    58,   404,    59,
      60,    61,    62,   412,   414,   329,    63,   409,   423,   346,
     424,   429,   347,   425,   435,   348,   349,   350,   351,   352,
     353,   354,   355,   441,   450,   451,   452,   413,   455,   457,
      86,   228,   112,   415,    36,   417,   330,   148,   454,   163,
     431,   164,   165,   166,   114,   167,   168,   169,   170,   171,
     172,   173,   426,   427,   156,   174,   175,   329,   323,   157,
     406,   432,   301,   176,   177,   178,   179,   180,   443,   231,
     252,   444,   408,   445,   235,   236,   237,   238,   239,   240,
     241,   242,   243,   244,   263,   181,   206,    55,    56,    57,
      58,   151,   428,   108,   182,    62,   183,   184,   185,    63,
     456,     0,   332,     0,     0,   186,     0,     0,     0,   187,
       0,   188,   261,     0,     0,   253,   254,   255,   256,   257,
     258,     0,     0,     0,     0,     0,    55,    56,    57,    58,
     189,   259,     0,     0,    62,     0,     0,   190,   191,     0,
      55,    56,    57,    58,     0,     0,     0,   245,    62,   246,
     247,   248,    63,     0,     0,     0,  -195,   253,   254,   255,
     256,   257,   258,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   262
};

static const short yycheck[] =
{
      23,    52,    38,   134,    82,     5,    21,     5,     4,    21,
      69,     4,     4,    69,    69,     9,    10,    43,     4,    69,
       4,   164,   165,    33,   102,   111,    29,     4,   107,    73,
      96,     4,     4,     4,    96,    79,    80,   103,    48,    89,
       4,    25,    26,     4,   107,    94,   109,     0,    97,    46,
      47,    48,    49,    50,    96,    91,   135,    21,    96,    23,
      63,    87,    96,    27,   123,   112,    30,   123,   123,    72,
      93,    64,    64,    69,    89,     4,    91,    89,   157,    16,
      17,    18,    19,    20,    76,    78,   101,    81,    74,   101,
     105,   106,    69,   105,   106,    59,    69,    69,    69,    96,
       4,   101,   181,   101,   183,   105,   106,   105,   106,   252,
      74,   190,    82,    83,    51,    70,   259,   248,   261,   262,
     212,   213,    96,    60,    61,    62,    90,   110,   110,   152,
     166,   167,   168,   212,   213,    89,   159,   101,    97,    98,
      99,     4,   178,   179,   124,   103,   101,    96,   184,   185,
     105,   106,    24,    96,   233,    92,    93,    94,    95,    96,
      97,    98,    99,   100,    96,     4,     4,   104,   247,   111,
     249,    92,    93,    94,    95,    69,   113,   114,   115,   100,
       4,     4,   205,    10,    92,    93,    94,    95,    96,    97,
      98,    99,   100,   216,   217,   103,   104,   220,     4,   235,
     236,   237,   238,   239,   240,   241,   242,   243,   244,     4,
       4,   247,   112,    96,   357,   358,   347,    92,    93,    94,
      95,    96,    97,    96,   260,   100,    96,   263,     4,   104,
     361,     4,   122,   269,   270,   271,    92,    93,    94,    95,
      96,   277,     4,   374,   100,   324,   122,   326,   104,    82,
      83,    84,    85,    86,    87,    88,    96,   293,    69,   110,
     296,   297,   298,   299,    69,    92,    93,    94,    95,     4,
      97,    98,    99,   100,   122,    44,    45,   104,    96,    96,
      96,   359,   360,    52,    96,     8,    96,    96,    96,     8,
     369,   112,   111,     4,    69,   110,    65,    66,    67,    68,
      96,     4,    69,   339,   340,   341,   342,   343,   344,   345,
     346,   110,   348,   349,   350,   351,   352,   353,   354,   355,
     110,   400,   111,   110,    92,    93,    94,    95,   364,    97,
      98,    99,   100,   112,   112,   371,   104,   373,   122,   108,
     112,   420,   111,     4,     4,   114,   115,   116,   117,   118,
     119,   120,   121,     4,     4,     4,     4,   393,     4,    96,
      48,   186,    96,   399,    11,   401,   288,   133,   447,     5,
     421,     7,     8,     9,   101,    11,    12,    13,    14,    15,
      16,    17,   418,   419,   144,    21,    22,   423,   274,   145,
     369,   423,   247,    29,    30,    31,    32,    33,   434,   190,
       8,   437,   371,   439,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,   211,    51,   163,    92,    93,    94,
      95,   135,    97,    91,    60,   100,    62,    63,    64,   104,
     453,    -1,   294,    -1,    -1,    71,    -1,    -1,    -1,    75,
      -1,    77,     8,    -1,    -1,    53,    54,    55,    56,    57,
      58,    -1,    -1,    -1,    -1,    -1,    92,    93,    94,    95,
      96,    69,    -1,    -1,   100,    -1,    -1,   103,   104,    -1,
      92,    93,    94,    95,    -1,    -1,    -1,   107,   100,   109,
     110,   111,   104,    -1,    -1,    -1,   122,    53,    54,    55,
      56,    57,    58,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    69
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    59,    74,    90,   101,
     126,   127,   128,   129,   130,   137,   139,   140,   147,   154,
     111,    96,   148,   131,    46,    47,    48,    49,    50,    96,
     193,   194,   155,   138,     4,     0,   128,   215,   216,   141,
      96,   193,    96,    96,    89,   101,   105,   106,   132,   133,
     139,   182,   183,   184,   112,    92,    93,    94,    95,    97,
      98,    99,   100,   104,   208,   214,   217,   218,   219,   220,
       4,    82,    83,    84,    85,    86,    87,    88,   164,   165,
     166,    96,   110,   165,     4,    91,   133,    74,   134,   135,
     184,   124,     4,    25,    26,   142,   143,   144,   145,   146,
       4,    69,   110,   220,     4,   165,     4,   103,   218,   193,
      96,    24,   144,   149,   166,   220,   156,    89,    96,   103,
     136,   208,   209,   210,   211,   212,   213,   214,    96,    96,
       4,   150,     4,   157,   111,    69,     4,     4,     5,   101,
     105,   106,   151,   153,   179,   180,   181,     5,   153,   158,
     215,   211,   152,     4,     4,    70,   181,   182,   185,   159,
       4,   112,   193,     5,     7,     8,     9,    11,    12,    13,
      14,    15,    16,    17,    21,    22,    29,    30,    31,    32,
      33,    51,    60,    62,    63,    64,    71,    75,    77,    96,
     103,   104,   160,   173,   175,   186,   195,   197,   198,   199,
     201,   206,   208,   193,    96,   190,   219,   212,   212,   214,
     214,   214,   196,   191,    96,    96,   187,   188,   214,   214,
     189,   208,    94,    97,   221,   208,   214,   214,   164,     4,
       4,   209,     4,   122,   202,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,   107,   109,   110,   111,   200,
      96,   193,     8,    53,    54,    55,    56,    57,    58,    69,
     207,     8,    69,   207,   136,   136,   193,   193,   193,    69,
     110,    69,     4,   174,   176,   205,   208,   122,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,    16,    17,
      18,    19,    20,    51,    60,    61,    62,   113,   114,   115,
     192,   201,   208,   214,   215,    96,    97,   208,    96,   212,
     212,   214,   212,   212,   214,    96,    96,    96,   214,   214,
     214,   161,   177,   177,    69,   123,    10,   203,   204,   214,
     194,   214,   221,    96,   214,   214,   214,   214,    96,    44,
      45,    52,    65,    66,    67,    68,   108,   111,   114,   115,
     116,   117,   118,   119,   120,   121,   112,     8,     8,   110,
     110,   111,   168,     4,    64,    76,   178,    78,   208,   110,
     208,    69,   123,    69,   111,    69,   214,   214,   214,   214,
     214,   214,   214,   214,   215,   214,   214,   214,   214,   214,
     214,   214,   214,   110,   212,   212,   220,   220,   215,     9,
      10,    81,   163,   169,   214,     4,   199,   208,   204,   214,
     215,    96,   112,   214,   112,   214,   208,   214,    73,    79,
      80,   167,     4,   122,   112,     4,   214,   214,    97,   208,
     162,   184,   203,     4,    69,     4,     4,    69,     4,    69,
     170,     4,   123,   214,   214,   214,    29,    63,    72,   171,
       4,     4,     4,   172,   208,     4,   193,    96
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
#line 305 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 314 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 315 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 316 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 317 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 318 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 319 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 320 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 321 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 322 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 327 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 332 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 339 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 340 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 20:
#line 349 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 350 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 351 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 352 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 353 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 25:
#line 356 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 26:
#line 358 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 27:
#line 361 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, yyval.i->r[1]);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 28:
#line 367 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 30:
#line 375 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 31:
#line 378 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 32:
#line 387 "imcc/imcc.y"
    { yyval.i=0;
                                 IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                                 cur_namespace = yyvsp[-1].sr;
                                 }
    break;

  case 33:
#line 395 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 34:
#line 402 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 36:
#line 411 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 41:
#line 422 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 42:
#line 427 "imcc/imcc.y"
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
#line 441 "imcc/imcc.y"
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
#line 457 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 45:
#line 462 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, i->r[1]);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 46:
#line 469 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 473 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 474 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 475 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 50:
#line 479 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 480 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 52:
#line 484 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 488 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 54:
#line 490 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, i->r[1]);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 55:
#line 497 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 501 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 502 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 58:
#line 503 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 59:
#line 507 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 508 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 61:
#line 513 "imcc/imcc.y"
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
#line 540 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 63:
#line 544 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 64:
#line 545 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 65:
#line 549 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 66:
#line 551 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 67:
#line 554 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 68:
#line 555 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 69:
#line 559 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 70:
#line 560 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 71:
#line 561 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 73:
#line 565 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 74:
#line 566 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 75:
#line 567 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 76:
#line 568 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 77:
#line 569 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 78:
#line 574 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 79:
#line 579 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 80:
#line 581 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 81:
#line 586 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 82:
#line 588 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-1].s,'S')); }
    break;

  case 83:
#line 590 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 84:
#line 594 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 85:
#line 600 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 86:
#line 601 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 87:
#line 605 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 88:
#line 606 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 89:
#line 610 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 90:
#line 611 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 91:
#line 616 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 92:
#line 617 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 93:
#line 618 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 94:
#line 623 "imcc/imcc.y"
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
#line 638 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 96:
#line 643 "imcc/imcc.y"
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
#line 659 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 98:
#line 663 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 99:
#line 665 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 100:
#line 667 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 101:
#line 671 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 104:
#line 688 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 105:
#line 693 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 106:
#line 694 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 107:
#line 695 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 108:
#line 696 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 109:
#line 700 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 113:
#line 710 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 114:
#line 718 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 117:
#line 724 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 118:
#line 725 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 119:
#line 726 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 120:
#line 726 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 121:
#line 727 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 122:
#line 728 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 123:
#line 729 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 124:
#line 730 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 125:
#line 731 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 126:
#line 731 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 127:
#line 733 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 128:
#line 734 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 129:
#line 735 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 130:
#line 736 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 131:
#line 737 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 132:
#line 738 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 133:
#line 739 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "inc",1, yyvsp[0].sr); }
    break;

  case 134:
#line 740 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "dec",1, yyvsp[0].sr); }
    break;

  case 135:
#line 741 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "saveall" ,0); }
    break;

  case 136:
#line 742 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restoreall" ,0); }
    break;

  case 137:
#line 743 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "end" ,0); }
    break;

  case 138:
#line 744 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 139:
#line 746 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 140:
#line 748 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 141:
#line 750 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 142:
#line 751 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 145:
#line 754 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 146:
#line 758 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 147:
#line 759 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 148:
#line 760 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 149:
#line 761 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 150:
#line 765 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 151:
#line 766 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 152:
#line 767 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 153:
#line 768 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 154:
#line 769 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 155:
#line 770 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 156:
#line 775 "imcc/imcc.y"
    {
            if((pmc_type(interp, string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 157:
#line 783 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 784 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 159:
#line 785 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 160:
#line 786 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 161:
#line 787 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 788 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 789 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 164:
#line 790 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 791 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 792 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 793 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 168:
#line 795 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 797 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 799 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 801 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 803 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 805 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 174:
#line 807 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 809 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 176:
#line 811 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 177:
#line 813 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 178:
#line 815 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 817 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 180:
#line 819 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 181:
#line 821 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 182:
#line 824 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 183:
#line 831 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 184:
#line 833 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3,yyvsp[-6].sr,yyvsp[-3].sr,yyvsp[-1].sr); }
    break;

  case 185:
#line 836 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone",2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 186:
#line 838 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 187:
#line 841 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 188:
#line 843 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 189:
#line 847 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 190:
#line 849 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "new",0,regs,nargs,keyvec,1); }
    break;

  case 191:
#line 851 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "defined", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 853 "imcc/imcc.y"
    { keyvec=KEY_BIT(2);
                          yyval.i = MK_I(interp, cur_unit, "defined", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 193:
#line 856 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "clone", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 859 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 195:
#line 865 "imcc/imcc.y"
    {
            yyval.i = create_itcall_label();
         }
    break;

  case 196:
#line 869 "imcc/imcc.y"
    {
           itcall_sub(yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 198:
#line 878 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 880 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 882 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 884 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 886 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 888 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 890 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 892 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 894 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 896 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 899 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 209:
#line 900 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 210:
#line 904 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 211:
#line 905 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 212:
#line 906 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 213:
#line 909 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 214:
#line 910 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 215:
#line 915 "imcc/imcc.y"
    {
           yyval.i = create_itcall_label();
           itcall_sub(yyvsp[0].sr);
        }
    break;

  case 216:
#line 920 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 217:
#line 924 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 218:
#line 925 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 219:
#line 926 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 220:
#line 931 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 221:
#line 933 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 222:
#line 937 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 223:
#line 938 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 224:
#line 943 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 945 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 947 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 949 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 951 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 953 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 230:
#line 957 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 231:
#line 958 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 232:
#line 959 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 233:
#line 960 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 234:
#line 961 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 235:
#line 962 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 238:
#line 971 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 239:
#line 972 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 240:
#line 976 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 242:
#line 981 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 243:
#line 983 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 244:
#line 991 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 245:
#line 992 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 250:
#line 1005 "imcc/imcc.y"
    {  nkeys=0; }
    break;

  case 251:
#line 1006 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 252:
#line 1010 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 253:
#line 1012 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 255:
#line 1020 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 256:
#line 1021 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 257:
#line 1022 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 258:
#line 1023 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 259:
#line 1024 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 260:
#line 1028 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 261:
#line 1029 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 262:
#line 1030 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 263:
#line 1034 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 264:
#line 1035 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3179 "imcc/imcparser.c"

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


#line 1040 "imcc/imcc.y"



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

