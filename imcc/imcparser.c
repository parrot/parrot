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
     CONCAT_ASSIGN = 292,
     BAND_ASSIGN = 293,
     BOR_ASSIGN = 294,
     BXOR_ASSIGN = 295,
     FDIV = 296,
     FDIV_ASSIGN = 297,
     SHR_ASSIGN = 298,
     SHL_ASSIGN = 299,
     SHR_U_ASSIGN = 300,
     SHIFT_LEFT = 301,
     SHIFT_RIGHT = 302,
     INTV = 303,
     FLOATV = 304,
     STRINGV = 305,
     PMCV = 306,
     OBJECTV = 307,
     LOG_XOR = 308,
     RELOP_EQ = 309,
     RELOP_NE = 310,
     RELOP_GT = 311,
     RELOP_GTE = 312,
     RELOP_LT = 313,
     RELOP_LTE = 314,
     GLOBAL = 315,
     GLOBALOP = 316,
     ADDR = 317,
     RESULT = 318,
     RETURN = 319,
     POW = 320,
     SHIFT_RIGHT_U = 321,
     LOG_AND = 322,
     LOG_OR = 323,
     COMMA = 324,
     ESUB = 325,
     DOTDOT = 326,
     PCC_BEGIN = 327,
     PCC_END = 328,
     PCC_CALL = 329,
     PCC_SUB = 330,
     PCC_BEGIN_RETURN = 331,
     PCC_END_RETURN = 332,
     PCC_BEGIN_YIELD = 333,
     PCC_END_YIELD = 334,
     NCI_CALL = 335,
     METH_CALL = 336,
     INVOCANT = 337,
     PROTOTYPED = 338,
     NON_PROTOTYPED = 339,
     MAIN = 340,
     LOAD = 341,
     IMMEDIATE = 342,
     POSTCOMP = 343,
     METHOD = 344,
     LABEL = 345,
     EMIT = 346,
     EOM = 347,
     IREG = 348,
     NREG = 349,
     SREG = 350,
     PREG = 351,
     IDENTIFIER = 352,
     REG = 353,
     MACRO = 354,
     ENDM = 355,
     STRINGC = 356,
     INTC = 357,
     FLOATC = 358,
     USTRINGC = 359,
     PARROT_OP = 360,
     VAR = 361,
     LINECOMMENT = 362,
     FILECOMMENT = 363,
     DOT = 364,
     CONCAT = 365,
     POINTY = 366
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
#define CONCAT_ASSIGN 292
#define BAND_ASSIGN 293
#define BOR_ASSIGN 294
#define BXOR_ASSIGN 295
#define FDIV 296
#define FDIV_ASSIGN 297
#define SHR_ASSIGN 298
#define SHL_ASSIGN 299
#define SHR_U_ASSIGN 300
#define SHIFT_LEFT 301
#define SHIFT_RIGHT 302
#define INTV 303
#define FLOATV 304
#define STRINGV 305
#define PMCV 306
#define OBJECTV 307
#define LOG_XOR 308
#define RELOP_EQ 309
#define RELOP_NE 310
#define RELOP_GT 311
#define RELOP_GTE 312
#define RELOP_LT 313
#define RELOP_LTE 314
#define GLOBAL 315
#define GLOBALOP 316
#define ADDR 317
#define RESULT 318
#define RETURN 319
#define POW 320
#define SHIFT_RIGHT_U 321
#define LOG_AND 322
#define LOG_OR 323
#define COMMA 324
#define ESUB 325
#define DOTDOT 326
#define PCC_BEGIN 327
#define PCC_END 328
#define PCC_CALL 329
#define PCC_SUB 330
#define PCC_BEGIN_RETURN 331
#define PCC_END_RETURN 332
#define PCC_BEGIN_YIELD 333
#define PCC_END_YIELD 334
#define NCI_CALL 335
#define METH_CALL 336
#define INVOCANT 337
#define PROTOTYPED 338
#define NON_PROTOTYPED 339
#define MAIN 340
#define LOAD 341
#define IMMEDIATE 342
#define POSTCOMP 343
#define METHOD 344
#define LABEL 345
#define EMIT 346
#define EOM 347
#define IREG 348
#define NREG 349
#define SREG 350
#define PREG 351
#define IDENTIFIER 352
#define REG 353
#define MACRO 354
#define ENDM 355
#define STRINGC 356
#define INTC 357
#define FLOATC 358
#define USTRINGC 359
#define PARROT_OP 360
#define VAR 361
#define LINECOMMENT 362
#define FILECOMMENT 363
#define DOT 364
#define CONCAT 365
#define POINTY 366




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
int cur_pmc_type;      /* used in mk_ident */
IMC_Unit * cur_unit;
SymReg *cur_namespace; /* ugly hack for mk_address */

/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_REGS];
static int nkeys, in_slice;
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
MK_I(Interp *interpreter, IMC_Unit * unit, const char * fmt, int n, ...)
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

static Instruction*
func_ins(Parrot_Interp interp, IMC_Unit *unit, SymReg *lhs, char *op,
           SymReg ** r, int n, int keyv, int emit)
{
    int i;
    /* shift regs up by 1 */
    for (i = n - 1; i >= 0; --i)
        r[i+1] = r[i];
    r[0] = lhs;
    /* shift keyvec */
    keyv <<= 1;
    return INS(interp, unit, op, "", r, n+1, keyv, emit);
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
iINDEXFETCH(Interp *interp, IMC_Unit * unit, SymReg * r0, SymReg * r1,
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
iINDEXSET(Interp *interp, IMC_Unit * unit,
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

Instruction *
IMCC_create_itcall_label(Interp* interpreter)
{
    char name[128];
    SymReg * r;
    Instruction *i;

    UNUSED(interpreter);
    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
    r = mk_pcc_sub(str_dup(name), 0);
    current_call = i = iLABEL(cur_unit, r);
    i->type = ITCALL | ITPCCSUB;
    return i;
}

void
IMCC_itcall_sub(Interp* interpreter, SymReg* sub)
{
   UNUSED(interpreter);
   current_call->r[0]->pcc_sub->sub = sub;
   if (cur_obj) {
       if (cur_obj->set != 'P')
          fataly(1, sourcefile, line, "object isn't a PMC");
       current_call->r[0]->pcc_sub->object = cur_obj;
       cur_obj = NULL;
   }
   /* FIXME use the default settings from .pragma */
   current_call->r[0]->pcc_sub->pragma = P_PROTOTYPED;
   if (current_call->r[0]->pcc_sub->sub->pmc_type == enum_class_NCI)
       current_call->r[0]->pcc_sub->nci = 1;
   if (cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[1]->pcc_sub->calls_a_sub |= 1;
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
#line 249 "imcc/imcc.y"
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
#line 553 "imcc/imcparser.c"
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
#line 574 "imcc/imcparser.c"

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
#define YYLAST   539

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  128
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  99
/* YYNRULES -- Number of rules. */
#define YYNRULES  271
/* YYNRULES -- Number of states. */
#define YYNSTATES  466

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   366

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   116,     2,     2,     2,   122,   123,     2,
     125,   126,   120,   119,     2,   117,     2,   121,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   127,
       2,   113,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   114,     2,   115,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   124,     2,   118,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112
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
     376,   379,   382,   385,   386,   390,   393,   395,   397,   399,
     401,   402,   404,   406,   408,   410,   412,   414,   416,   418,
     420,   422,   424,   428,   433,   438,   443,   449,   455,   461,
     467,   473,   479,   485,   491,   497,   503,   509,   515,   521,
     527,   533,   539,   545,   552,   559,   566,   574,   579,   584,
     591,   599,   604,   611,   616,   621,   626,   631,   638,   646,
     650,   651,   661,   663,   665,   669,   673,   677,   681,   685,
     689,   693,   697,   701,   705,   709,   713,   718,   720,   722,
     726,   730,   734,   736,   738,   739,   745,   746,   750,   752,
     754,   757,   761,   763,   770,   777,   782,   787,   792,   797,
     799,   801,   803,   805,   807,   809,   811,   813,   814,   816,
     820,   822,   824,   829,   831,   833,   835,   837,   839,   841,
     843,   845,   846,   849,   851,   855,   856,   861,   863,   867,
     870,   873,   875,   877,   879,   881,   883,   885,   887,   889,
     891,   893
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     129,     0,    -1,   130,    -1,   131,    -1,   130,   131,    -1,
     143,    -1,   142,    -1,   133,    -1,   132,    -1,   150,    -1,
     157,    -1,   140,    -1,   100,     4,    -1,     4,    -1,    61,
     196,    98,    -1,    61,   196,    98,   113,   225,    -1,    -1,
      30,   134,   196,    98,   113,   225,    -1,   136,    -1,   135,
     136,    -1,   185,   137,     4,    -1,   100,     4,    -1,   109,
      -1,   108,    -1,   142,    -1,    -1,   138,   106,   139,    -1,
      76,   168,    91,    -1,    -1,   212,    -1,    -1,    92,   141,
     135,    93,    -1,    21,   114,   219,   115,    -1,    -1,    23,
      98,   144,     4,   145,    24,    -1,   146,    -1,    -1,   147,
      -1,   146,   147,    -1,   148,    -1,   149,    -1,     4,    -1,
      25,   196,    98,     4,    -1,    26,    98,    98,     4,    -1,
      -1,    -1,    27,   151,   215,   168,     4,   152,   153,   156,
      -1,    -1,     4,    -1,   153,   154,     4,    -1,    -1,     5,
     155,   196,    98,    -1,   182,    71,    -1,    -1,    -1,    76,
     158,    98,   168,     4,   159,   160,   156,    -1,    -1,     4,
      -1,   160,   161,     4,    -1,    -1,     5,   162,   196,    98,
      -1,    -1,    73,   167,     4,   164,   171,   166,   170,   165,
     173,    74,    -1,    -1,   187,     4,    -1,    -1,    83,   218,
       4,    -1,    84,    -1,    85,    -1,    -1,   168,    70,   169,
      -1,   169,    -1,   167,    -1,    87,    -1,    86,    -1,    88,
      -1,    89,    -1,    90,    -1,    75,   218,    70,   218,     4,
      -1,    75,   218,     4,    -1,    81,   218,     4,    -1,    82,
     211,     4,    -1,    82,   102,     4,    -1,    82,   211,    70,
     218,     4,    -1,    82,   102,    70,   218,     4,    -1,    -1,
     171,   172,     4,    -1,     9,   218,    -1,    10,   211,    -1,
      -1,   173,   174,     4,    -1,    64,   211,    -1,    -1,    29,
     175,   196,    98,    -1,    -1,    77,     4,   177,   180,    78,
      -1,    -1,    79,     4,   179,   180,    80,    -1,    -1,   180,
       4,    -1,   180,   181,     4,    -1,    65,   218,    -1,   184,
      -1,   182,   184,    -1,    -1,   183,   188,    -1,   100,     4,
      -1,   109,    -1,   108,    -1,    -1,   186,    -1,   186,   187,
      -1,   187,    -1,    91,    -1,   185,   189,     4,    -1,   198,
      -1,   209,    -1,    21,    98,    -1,    22,    98,    -1,    -1,
      29,   190,   196,    98,    -1,    -1,    30,   191,   196,    98,
     113,   225,    -1,    -1,    33,   192,   196,    98,   113,   225,
      -1,    -1,     5,   193,   196,    98,    -1,     5,   224,    -1,
      64,   218,    -1,     9,   218,    -1,    65,   218,    -1,     7,
     216,    -1,     8,   216,    -1,    -1,    17,   194,   139,    -1,
     106,   212,    -1,   204,    -1,   163,    -1,   176,    -1,   178,
      -1,    -1,    17,    -1,    18,    -1,    19,    -1,    20,    -1,
      49,    -1,    50,    -1,    51,    -1,    52,    -1,    53,    -1,
     197,    -1,    98,    -1,   211,   113,   218,    -1,   211,   113,
     116,   218,    -1,   211,   113,   117,   218,    -1,   211,   113,
     118,   218,    -1,   211,   113,   218,   119,   218,    -1,   211,
     113,   218,   117,   218,    -1,   211,   113,   218,   120,   218,
      -1,   211,   113,   218,    66,   218,    -1,   211,   113,   218,
     121,   218,    -1,   211,   113,   218,    42,   218,    -1,   211,
     113,   218,   122,   218,    -1,   211,   113,   218,   111,   218,
      -1,   211,   113,   218,    47,   218,    -1,   211,   113,   218,
      48,   218,    -1,   211,   113,   218,    67,   218,    -1,   211,
     113,   218,    68,   218,    -1,   211,   113,   218,    69,   218,
      -1,   211,   113,   218,    54,   218,    -1,   211,   113,   218,
     123,   218,    -1,   211,   113,   218,   124,   218,    -1,   211,
     113,   218,   118,   218,    -1,   211,   113,   218,   114,   219,
     115,    -1,   211,   114,   219,   115,   113,   218,    -1,   211,
     113,    16,   197,    70,   218,    -1,   211,   113,    16,   197,
     114,   219,   115,    -1,   211,   113,    16,   197,    -1,   211,
     113,    16,   218,    -1,   211,   113,    16,   218,    70,   218,
      -1,   211,   113,    16,   218,   114,   219,   115,    -1,   211,
     113,   195,    98,    -1,   211,   113,   195,    98,    70,    98,
      -1,   211,   113,    63,    98,    -1,   211,   113,    62,   226,
      -1,    62,   226,   113,   218,    -1,    16,   211,    70,   218,
      -1,    16,   211,    70,   218,    70,   218,    -1,    16,   211,
      70,   218,   114,   219,   115,    -1,   211,   113,   204,    -1,
      -1,   199,   125,   208,   126,   113,   202,   125,   206,   126,
      -1,   200,    -1,   201,    -1,   211,    34,   218,    -1,   211,
      35,   218,    -1,   211,    36,   218,    -1,   211,    37,   218,
      -1,   211,    43,   218,    -1,   211,    38,   218,    -1,   211,
      39,   218,    -1,   211,    40,   218,    -1,   211,    41,   218,
      -1,   211,    44,   218,    -1,   211,    45,   218,    -1,   211,
      46,   218,    -1,   211,   113,   106,   139,    -1,    98,    -1,
     211,    -1,   211,   203,   215,    -1,   211,   203,   102,    -1,
     211,   203,   211,    -1,   112,    -1,   110,    -1,    -1,   202,
     205,   125,   206,   126,    -1,    -1,   206,    70,   207,    -1,
     207,    -1,   218,    -1,    10,   211,    -1,   208,    70,   211,
      -1,   211,    -1,    11,   218,   210,   218,     8,   216,    -1,
      12,   218,   210,   218,     8,   216,    -1,    11,   218,     8,
     216,    -1,    12,   218,     8,   216,    -1,    11,   218,    70,
     216,    -1,    12,   218,    70,   216,    -1,    55,    -1,    56,
      -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,   107,
      -1,   224,    -1,    -1,   213,    -1,   213,    70,   214,    -1,
     214,    -1,   217,    -1,   211,   114,   219,   115,    -1,    98,
      -1,   106,    -1,    98,    -1,   106,    -1,   216,    -1,   218,
      -1,   211,    -1,   225,    -1,    -1,   220,   221,    -1,   223,
      -1,   221,   127,   223,    -1,    -1,   221,    70,   222,   223,
      -1,   218,    -1,   218,    72,   218,    -1,    72,   218,    -1,
     218,    72,    -1,    94,    -1,    95,    -1,    96,    -1,    97,
      -1,    99,    -1,   103,    -1,   104,    -1,   102,    -1,   105,
      -1,    96,    -1,   102,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   324,   324,   328,   330,   333,   335,   336,   337,   338,
     339,   340,   341,   342,   345,   351,   359,   358,   363,   365,
     368,   370,   371,   372,   373,   376,   376,   380,   387,   390,
     395,   394,   406,   415,   413,   429,   431,   434,   436,   439,
     441,   442,   445,   459,   477,   482,   475,   492,   494,   495,
     499,   498,   503,   508,   510,   507,   520,   522,   523,   527,
     526,   533,   531,   563,   565,   568,   570,   573,   575,   578,
     580,   581,   584,   585,   586,   587,   588,   589,   592,   598,
     600,   605,   607,   609,   613,   619,   621,   624,   626,   629,
     631,   634,   637,   637,   643,   641,   663,   661,   682,   684,
     686,   690,   694,   696,   707,   711,   714,   715,   716,   719,
     721,   724,   726,   729,   736,   741,   743,   744,   745,   746,
     746,   747,   747,   749,   749,   751,   751,   753,   754,   755,
     756,   757,   758,   759,   759,   762,   765,   766,   767,   768,
     769,   772,   774,   775,   776,   779,   781,   782,   783,   784,
     785,   788,   798,   800,   801,   802,   803,   804,   805,   806,
     807,   808,   809,   810,   811,   813,   815,   817,   819,   821,
     823,   825,   827,   829,   831,   833,   835,   837,   839,   841,
     843,   845,   848,   855,   858,   860,   864,   866,   868,   871,
     878,   877,   886,   887,   890,   893,   895,   897,   899,   901,
     903,   905,   907,   909,   911,   913,   917,   925,   926,   930,
     931,   932,   935,   936,   941,   939,   949,   951,   952,   955,
     958,   962,   964,   967,   970,   972,   974,   976,   978,   982,
     984,   985,   986,   987,   988,   991,   993,   996,   998,  1001,
    1003,  1006,  1008,  1016,  1018,  1021,  1023,  1026,  1028,  1031,
    1033,  1036,  1036,  1040,  1042,  1044,  1044,  1048,  1054,  1057,
    1058,  1061,  1063,  1064,  1065,  1066,  1069,  1071,  1072,  1073,
    1076,  1078
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
  "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", 
  "FDIV_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", 
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", 
  "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
  "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT", "RETURN", "POW", 
  "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT", 
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", 
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", 
  "METH_CALL", "INVOCANT", "PROTOTYPED", "NON_PROTOTYPED", "MAIN", "LOAD", 
  "IMMEDIATE", "POSTCOMP", "METHOD", "LABEL", "EMIT", "EOM", "IREG", 
  "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", 
  "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", 
  "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['", "']'", "'!'", 
  "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "'('", "')'", 
  "';'", "$accept", "program", "compilation_units", "compilation_unit", 
  "global", "constdef", "@1", "pasmcode", "pasmline", "pasm_inst", "@2", 
  "pasm_args", "emit", "@3", "class_namespace", "class", "@4", 
  "class_body", "member_decls", "member_decl", "field_decl", 
  "method_decl", "sub", "@5", "@6", "sub_params", "sub_param", "@7", 
  "sub_body", "pcc_sub", "@8", "@9", "pcc_params", "pcc_param", "@10", 
  "pcc_sub_call", "@11", "opt_label", "opt_invocant", "pcc_proto", 
  "pcc_sub_proto", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@12", "pcc_ret", "@13", "pcc_yield", 
  "@14", "pcc_returns", "pcc_return", "statements", "helper_clear_state", 
  "statement", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@15", "@16", "@17", "@18", "@19", "newsub", "type", 
  "classname", "assignment", "@20", "op_assign", "func_assign", "the_sub", 
  "ptr", "sub_call", "@21", "arglist", "arg", "targetlist", 
  "if_statement", "relop", "target", "vars", "_vars", "_var_or_i", 
  "sub_label_op", "label_op", "var_or_i", "var", "keylist", "@22", 
  "_keylist", "@23", "key", "reg", "const", "string", 0
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
     364,   365,   366,    61,    91,    93,    33,    45,   126,    43,
      42,    47,    37,    38,   124,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   128,   129,   130,   130,   131,   131,   131,   131,   131,
     131,   131,   131,   131,   132,   132,   134,   133,   135,   135,
     136,   136,   136,   136,   136,   138,   137,   137,   137,   139,
     141,   140,   142,   144,   143,   145,   145,   146,   146,   147,
     147,   147,   148,   149,   151,   152,   150,   153,   153,   153,
     155,   154,   156,   158,   159,   157,   160,   160,   160,   162,
     161,   164,   163,   165,   165,   166,   166,   167,   167,   168,
     168,   168,   169,   169,   169,   169,   169,   169,   170,   170,
     170,   170,   170,   170,   170,   171,   171,   172,   172,   173,
     173,   174,   175,   174,   177,   176,   179,   178,   180,   180,
     180,   181,   182,   182,   183,   184,   184,   184,   184,   185,
     185,   186,   186,   187,   188,   189,   189,   189,   189,   190,
     189,   191,   189,   192,   189,   193,   189,   189,   189,   189,
     189,   189,   189,   194,   189,   189,   189,   189,   189,   189,
     189,   195,   195,   195,   195,   196,   196,   196,   196,   196,
     196,   197,   198,   198,   198,   198,   198,   198,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   198,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   198,   198,   198,
     198,   198,   198,   198,   198,   198,   198,   198,   198,   198,
     199,   198,   198,   198,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   201,   202,   202,   202,
     202,   202,   203,   203,   205,   204,   206,   206,   206,   207,
     207,   208,   208,   209,   209,   209,   209,   209,   209,   210,
     210,   210,   210,   210,   210,   211,   211,   212,   212,   213,
     213,   214,   214,   215,   215,   216,   216,   217,   217,   218,
     218,   220,   219,   221,   221,   222,   221,   223,   223,   223,
     223,   224,   224,   224,   224,   224,   225,   225,   225,   225,
     226,   226
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
       2,     2,     2,     0,     3,     2,     1,     1,     1,     1,
       0,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     3,     4,     4,     4,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     6,     6,     6,     7,     4,     4,     6,
       7,     4,     6,     4,     4,     4,     4,     6,     7,     3,
       0,     9,     1,     1,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     4,     1,     1,     3,
       3,     3,     1,     1,     0,     5,     0,     3,     1,     1,
       2,     3,     1,     6,     6,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     2,     1,     3,     0,     4,     1,     3,     2,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,    44,    16,     0,    53,    30,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     251,    33,     0,     0,   145,   146,   147,   148,   149,   151,
       0,   150,     0,   109,    12,     1,     4,     0,     0,     0,
     243,   244,    69,     0,    14,    69,   113,     0,    23,    22,
     109,    18,    24,    25,   110,   112,    32,     0,   261,   262,
     263,   264,   265,   268,   266,   267,   269,   235,   249,   257,
     252,   253,   236,   250,    36,    67,    68,    74,    73,    75,
      76,    77,    72,     0,    71,     0,     0,     0,    21,    31,
      19,    69,     0,     0,   111,   259,   260,   255,     0,    41,
       0,     0,     0,    35,    37,    39,    40,    45,     0,     0,
      15,    54,     0,    20,   237,   258,     0,   254,     0,     0,
      34,    38,    47,    70,    17,    56,    27,   245,   246,    26,
     249,    29,   238,   240,   247,   241,   248,   256,     0,     0,
      48,   104,    57,   104,   251,     0,    42,    43,    50,     0,
     108,   107,     0,    46,   104,   109,   102,    59,    55,     0,
       0,   239,     0,   106,    49,    52,   103,   140,   105,     0,
      58,   242,     0,   125,     0,     0,     0,     0,     0,     0,
     133,     0,     0,   119,   121,   123,     0,     0,     0,     0,
       0,     0,   207,   237,   137,   138,   139,     0,   115,     0,
     192,   193,   214,   136,   116,   208,     0,    51,     0,   127,
     131,   132,   129,     0,     0,     0,   237,   117,   118,     0,
       0,     0,   270,   271,     0,   128,   130,     0,    94,    96,
     135,   114,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   213,   212,     0,   251,
       0,    60,     0,     0,   229,   230,   231,   232,   233,   234,
       0,     0,     0,     0,     0,     0,   134,     0,     0,     0,
       0,    61,    98,    98,     0,   222,   216,   194,   195,   196,
     197,   199,   200,   201,   202,   198,   203,   204,   205,     0,
     141,   142,   143,   144,     0,     0,   237,     0,     0,     0,
       0,   189,   249,   152,     0,   210,   211,   209,   126,   225,
     227,     0,   226,   228,     0,   186,   120,     0,     0,   185,
      85,     0,     0,     0,     0,     0,     0,   218,   219,   177,
     178,   184,   183,   206,   153,   154,   155,   181,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   251,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     251,     0,     0,    65,    99,     0,    95,     0,    97,   221,
       0,   220,     0,   215,     0,   251,     0,   251,     0,   161,
     164,   165,   169,   159,   166,   167,   168,   163,     0,   157,
     172,   156,   158,   160,   162,   170,   171,     0,   223,   224,
     187,     0,   122,   124,     0,     0,     0,     0,     0,   101,
     100,     0,   208,   217,   175,     0,   179,     0,   182,   173,
     174,   188,    87,    88,     0,     0,     0,     0,    63,    86,
     216,   176,   180,    66,     0,     0,     0,     0,    89,     0,
       0,    79,     0,    80,    82,     0,    81,     0,     0,    64,
     191,     0,     0,     0,    92,     0,    62,     0,    78,    84,
      83,     0,    91,    90,     0,    93
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    50,    51,    92,
      93,   129,    15,    33,    16,    17,    39,   102,   103,   104,
     105,   106,    18,    22,   122,   141,   152,   162,   153,    19,
      32,   125,   143,   159,   169,   194,   320,   438,   407,    82,
      83,    84,   428,   363,   408,   448,   457,   461,   195,   272,
     196,   273,   321,   367,   154,   155,   156,    53,    54,    55,
     168,   197,   219,   220,   221,   208,   216,   300,    30,    31,
     198,   199,   200,   201,   202,   250,   203,   233,   326,   327,
     274,   204,   261,    68,   131,   132,   133,    42,   134,   135,
     136,    37,    38,    70,   116,    71,    72,    73,   224
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -211
static const short yypact[] =
{
     264,  -211,   -97,   -61,  -211,  -211,    82,  -211,  -211,    39,
      58,   264,  -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,
    -211,  -211,   -60,    82,  -211,  -211,  -211,  -211,  -211,  -211,
     -36,  -211,    -4,    36,  -211,  -211,  -211,   -10,   256,   106,
    -211,  -211,   171,    15,    13,   171,  -211,   133,  -211,  -211,
      83,  -211,  -211,     6,    56,  -211,  -211,   409,  -211,  -211,
    -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,    79,
     -63,  -211,  -211,  -211,   124,  -211,  -211,  -211,  -211,  -211,
    -211,  -211,  -211,     8,  -211,    54,     4,     9,  -211,  -211,
    -211,   171,   158,    65,  -211,  -211,   409,  -211,   256,  -211,
      82,    75,   155,   124,  -211,  -211,  -211,  -211,   171,     4,
    -211,  -211,   -43,  -211,   381,  -211,   256,  -211,    86,    88,
    -211,  -211,   189,  -211,  -211,   190,  -211,  -211,  -211,  -211,
      81,  -211,   141,  -211,  -211,  -211,  -211,  -211,   210,   211,
    -211,     3,  -211,    16,  -211,   381,  -211,  -211,  -211,   212,
    -211,  -211,   216,  -211,    69,    56,  -211,  -211,  -211,   217,
     108,  -211,    82,  -211,  -211,  -211,  -211,    23,  -211,    82,
    -211,  -211,   126,   237,   -33,   -33,   409,   409,   409,   306,
    -211,   129,   130,  -211,  -211,  -211,   -55,   409,   409,   105,
     227,   229,  -211,   381,  -211,  -211,  -211,   230,  -211,   111,
    -211,  -211,  -211,  -211,  -211,   411,   139,  -211,    82,  -211,
    -211,  -211,  -211,   214,   242,   168,   381,  -211,  -211,    82,
      82,    82,  -211,  -211,   131,  -211,  -211,   235,  -211,  -211,
    -211,  -211,   306,   118,   409,   409,   409,   409,   409,   409,
     409,   409,   409,   409,   409,   409,  -211,  -211,   326,  -211,
     432,  -211,   148,   -33,  -211,  -211,  -211,  -211,  -211,  -211,
     -33,   409,   -33,   -33,   409,   409,  -211,   150,   151,   153,
     409,  -211,  -211,  -211,   -54,  -211,    61,  -211,  -211,  -211,
    -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,   395,
    -211,  -211,  -211,  -211,   -55,   154,   381,   409,   409,   409,
     167,  -211,   107,   350,   138,  -211,  -211,  -211,  -211,  -211,
    -211,   258,  -211,  -211,   259,   -59,  -211,   162,   163,  -211,
    -211,    19,    11,   306,   166,   306,   -52,  -211,  -211,   -44,
     -16,  -211,  -211,  -211,  -211,  -211,  -211,   213,   409,   409,
     409,   409,   409,   409,   409,   409,   409,  -211,   409,   409,
     409,   409,   409,   409,   409,   409,   169,   -33,   -33,   409,
    -211,     4,     4,    40,  -211,   409,  -211,   276,  -211,  -211,
     286,  -211,    61,  -211,   409,  -211,   409,  -211,   183,  -211,
    -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,   173,  -211,
    -211,  -211,  -211,  -211,  -211,  -211,  -211,   409,  -211,  -211,
    -211,   174,  -211,  -211,   409,   306,   409,   100,   282,  -211,
    -211,   165,    49,  -211,  -211,   178,  -211,   180,  -211,  -211,
    -211,  -211,  -211,  -211,   292,   409,   409,   271,    56,  -211,
      61,  -211,  -211,  -211,    10,   317,    25,    29,  -211,   318,
     -51,  -211,   409,  -211,  -211,   409,  -211,   409,    -5,  -211,
    -211,   319,   322,   325,  -211,   306,  -211,   331,  -211,  -211,
    -211,    82,  -211,  -211,   240,  -211
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -211,  -211,  -211,   336,  -211,  -211,  -211,  -211,   298,  -211,
    -211,  -210,  -211,  -211,    18,  -211,  -211,  -211,  -211,   251,
    -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,   231,  -211,
    -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,   187,
     -25,   249,  -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,
    -211,  -211,    99,  -211,  -211,  -211,   225,   232,  -211,   -53,
    -211,  -211,  -211,  -211,  -211,  -211,  -211,  -211,   -23,    97,
    -211,  -211,  -211,  -211,    24,  -211,   160,  -211,   -34,    27,
    -211,  -211,   192,   -78,   218,  -211,   269,   159,  -170,  -211,
     -35,  -135,  -211,  -211,  -211,   -56,   253,   -84,   121
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -209
static const short yytable[] =
{
      43,    94,   110,    69,   210,   211,   266,    97,   148,   160,
     -28,   359,   107,   111,   441,   364,   323,    20,   372,   372,
      87,   157,    95,   364,   454,   124,   374,   108,   173,   444,
     174,   175,   176,   446,   177,   178,   130,    21,    40,   179,
     180,   222,   117,    34,   181,   182,    41,   223,   126,   404,
     405,    52,   183,   184,   376,   360,   185,     2,    35,   455,
     137,   115,    44,    69,    98,   127,   112,   130,    52,   456,
     375,   325,   324,   128,   373,   450,   365,   118,   108,   108,
     442,    69,    91,   309,   365,   186,   333,   187,   188,   205,
     310,   368,   312,   313,    45,   445,   189,   366,   377,   447,
     190,   215,   191,   149,     2,    56,    63,    64,    65,    66,
      74,   150,   151,    85,   304,   130,   149,    58,    59,    60,
      61,   192,    62,   406,   150,   151,    86,    46,    99,   193,
      67,    24,    25,    26,    27,    28,    47,    88,   130,   172,
     165,   212,   213,   214,    48,    49,   206,    46,  -190,   100,
     101,    96,   225,   226,   275,    58,    59,    60,    61,   246,
      62,   247,   113,    63,    64,    65,    66,   109,    67,   149,
     302,   114,   306,   119,    46,   425,    89,   150,   151,   120,
      29,   426,   427,    47,   138,   252,   139,   398,   399,    75,
      76,    48,    49,   140,   142,   144,   267,   268,   269,   277,
     278,   279,   280,   281,   282,   283,   284,   285,   286,   287,
     288,   145,   388,   303,   146,   147,   163,   246,   130,   247,
     164,   170,   253,   171,   207,   401,   311,   217,   218,   314,
     315,   228,  -208,   229,   231,   319,   232,   251,   265,   271,
     415,   328,   417,   276,   270,   369,   308,   371,   316,   317,
     262,   318,   332,   356,   330,    75,    76,    77,    78,    79,
      80,    81,   334,   335,   336,   337,   357,   358,     1,   254,
     255,   256,   257,   258,   259,   361,   362,   402,   403,   370,
     410,   418,   397,   378,   260,     2,   429,     3,   419,   421,
     430,     4,   412,   431,     5,   432,   433,   254,   255,   256,
     257,   258,   259,   379,   380,   381,   382,   383,   384,   385,
     386,   387,   263,   389,   390,   391,   392,   393,   394,   395,
     396,   443,   449,   458,   400,     6,   459,   423,    57,   460,
     409,    58,    59,    60,    61,   463,    62,   328,   465,   414,
       7,   416,   289,   290,   291,   292,   293,    36,    90,   437,
      58,    59,    60,    61,   121,    62,     8,   123,    63,    64,
      65,    66,   420,    67,     9,    58,    59,    60,    61,   422,
      62,   424,   322,   436,   158,   439,   227,   462,    67,   166,
      58,    59,    60,    61,   192,    62,   329,   167,   294,   295,
     434,   435,   338,    67,   411,   328,   440,   339,   340,   413,
      58,    59,    60,    61,   341,    62,   264,   451,   301,   307,
     452,   230,   453,    67,   161,   331,   342,   343,   344,   345,
      58,    59,    60,    61,   192,    62,   209,     0,    63,    64,
      65,    66,   296,    67,     0,     0,     0,     0,   464,     0,
       0,     0,   297,   298,   299,   234,   235,   236,   237,   238,
     239,   240,   241,     0,   242,   243,   244,   245,     0,     0,
       0,   346,     0,     0,   347,     0,     0,   348,   349,   350,
     351,   352,   353,   354,   355,    58,    59,    60,    61,   127,
      62,     0,     0,    63,    64,    65,    66,   128,    67,    58,
      59,    60,    61,    29,    62,     0,     0,    63,    64,    65,
      66,     0,    67,    58,    59,    60,    61,     0,    62,     0,
       0,    63,    64,    65,    66,     0,    67,     0,     0,     0,
       0,   246,     0,   247,   248,   249,    58,    59,    60,    61,
      40,    62,     0,     0,   305,     0,     0,     0,    41,    67
};

static const short yycheck[] =
{
      23,    54,    86,    38,   174,   175,   216,    70,     5,   144,
       4,    70,     4,     4,     4,     4,    70,   114,    70,    70,
      45,     5,    57,     4,    29,   109,    70,    70,     5,     4,
       7,     8,     9,     4,    11,    12,   114,    98,    98,    16,
      17,    96,    98,     4,    21,    22,   106,   102,    91,     9,
      10,    33,    29,    30,    70,   114,    33,    21,     0,    64,
     116,    96,    98,    98,   127,    98,    91,   145,    50,    74,
     114,    10,   126,   106,   126,   126,    65,   100,    70,    70,
      70,   116,    76,   253,    65,    62,   296,    64,    65,   167,
     260,    80,   262,   263,    98,    70,    73,    78,   114,    70,
      77,   179,    79,   100,    21,   115,   102,   103,   104,   105,
       4,   108,   109,    98,   249,   193,   100,    94,    95,    96,
      97,    98,    99,    83,   108,   109,   113,    91,     4,   106,
     107,    49,    50,    51,    52,    53,   100,     4,   216,   162,
      71,   176,   177,   178,   108,   109,   169,    91,   125,    25,
      26,    72,   187,   188,   232,    94,    95,    96,    97,   110,
      99,   112,     4,   102,   103,   104,   105,   113,   107,   100,
     248,   106,   250,    98,    91,    75,    93,   108,   109,    24,
      98,    81,    82,   100,    98,   208,    98,   357,   358,    84,
      85,   108,   109,     4,     4,   114,   219,   220,   221,   234,
     235,   236,   237,   238,   239,   240,   241,   242,   243,   244,
     245,    70,   347,   248,     4,     4,     4,   110,   296,   112,
       4,     4,     8,   115,    98,   360,   261,    98,    98,   264,
     265,     4,   125,     4,     4,   270,   125,    98,    70,     4,
     375,   276,   377,   125,   113,   323,    98,   325,    98,    98,
       8,    98,    98,   115,   289,    84,    85,    86,    87,    88,
      89,    90,   297,   298,   299,    98,     8,     8,     4,    55,
      56,    57,    58,    59,    60,   113,   113,   361,   362,   113,
       4,    98,   113,    70,    70,    21,     4,    23,   115,   115,
     125,    27,   370,   115,    30,   115,     4,    55,    56,    57,
      58,    59,    60,   338,   339,   340,   341,   342,   343,   344,
     345,   346,    70,   348,   349,   350,   351,   352,   353,   354,
     355,     4,     4,     4,   359,    61,     4,   405,    72,     4,
     365,    94,    95,    96,    97,     4,    99,   372,    98,   374,
      76,   376,    16,    17,    18,    19,    20,    11,    50,   427,
      94,    95,    96,    97,   103,    99,    92,   108,   102,   103,
     104,   105,   397,   107,   100,    94,    95,    96,    97,   404,
      99,   406,   273,   102,   143,   428,   189,   455,   107,   154,
      94,    95,    96,    97,    98,    99,   289,   155,    62,    63,
     425,   426,    42,   107,   370,   430,   430,    47,    48,   372,
      94,    95,    96,    97,    54,    99,   214,   442,   248,   250,
     445,   193,   447,   107,   145,   294,    66,    67,    68,    69,
      94,    95,    96,    97,    98,    99,   173,    -1,   102,   103,
     104,   105,   106,   107,    -1,    -1,    -1,    -1,   461,    -1,
      -1,    -1,   116,   117,   118,    34,    35,    36,    37,    38,
      39,    40,    41,    -1,    43,    44,    45,    46,    -1,    -1,
      -1,   111,    -1,    -1,   114,    -1,    -1,   117,   118,   119,
     120,   121,   122,   123,   124,    94,    95,    96,    97,    98,
      99,    -1,    -1,   102,   103,   104,   105,   106,   107,    94,
      95,    96,    97,    98,    99,    -1,    -1,   102,   103,   104,
     105,    -1,   107,    94,    95,    96,    97,    -1,    99,    -1,
      -1,   102,   103,   104,   105,    -1,   107,    -1,    -1,    -1,
      -1,   110,    -1,   112,   113,   114,    94,    95,    96,    97,
      98,    99,    -1,    -1,   102,    -1,    -1,    -1,   106,   107
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    61,    76,    92,   100,
     129,   130,   131,   132,   133,   140,   142,   143,   150,   157,
     114,    98,   151,   134,    49,    50,    51,    52,    53,    98,
     196,   197,   158,   141,     4,     0,   131,   219,   220,   144,
      98,   106,   215,   196,    98,    98,    91,   100,   108,   109,
     135,   136,   142,   185,   186,   187,   115,    72,    94,    95,
      96,    97,    99,   102,   103,   104,   105,   107,   211,   218,
     221,   223,   224,   225,     4,    84,    85,    86,    87,    88,
      89,    90,   167,   168,   169,    98,   113,   168,     4,    93,
     136,    76,   137,   138,   187,   218,    72,    70,   127,     4,
      25,    26,   145,   146,   147,   148,   149,     4,    70,   113,
     225,     4,   168,     4,   106,   218,   222,   223,   196,    98,
      24,   147,   152,   169,   225,   159,    91,    98,   106,   139,
     211,   212,   213,   214,   216,   217,   218,   223,    98,    98,
       4,   153,     4,   160,   114,    70,     4,     4,     5,   100,
     108,   109,   154,   156,   182,   183,   184,     5,   156,   161,
     219,   214,   155,     4,     4,    71,   184,   185,   188,   162,
       4,   115,   196,     5,     7,     8,     9,    11,    12,    16,
      17,    21,    22,    29,    30,    33,    62,    64,    65,    73,
      77,    79,    98,   106,   163,   176,   178,   189,   198,   199,
     200,   201,   202,   204,   209,   211,   196,    98,   193,   224,
     216,   216,   218,   218,   218,   211,   194,    98,    98,   190,
     191,   192,    96,   102,   226,   218,   218,   167,     4,     4,
     212,     4,   125,   205,    34,    35,    36,    37,    38,    39,
      40,    41,    43,    44,    45,    46,   110,   112,   113,   114,
     203,    98,   196,     8,    55,    56,    57,    58,    59,    60,
      70,   210,     8,    70,   210,    70,   139,   196,   196,   196,
     113,     4,   177,   179,   208,   211,   125,   218,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,    16,
      17,    18,    19,    20,    62,    63,   106,   116,   117,   118,
     195,   204,   211,   218,   219,   102,   211,   215,    98,   216,
     216,   218,   216,   216,   218,   218,    98,    98,    98,   218,
     164,   180,   180,    70,   126,    10,   206,   207,   218,   197,
     218,   226,    98,   139,   218,   218,   218,    98,    42,    47,
      48,    54,    66,    67,    68,    69,   111,   114,   117,   118,
     119,   120,   121,   122,   123,   124,   115,     8,     8,    70,
     114,   113,   113,   171,     4,    65,    78,   181,    80,   211,
     113,   211,    70,   126,    70,   114,    70,   114,    70,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   219,   218,
     218,   218,   218,   218,   218,   218,   218,   113,   216,   216,
     218,   219,   225,   225,     9,    10,    83,   166,   172,   218,
       4,   202,   211,   207,   218,   219,   218,   219,    98,   115,
     218,   115,   218,   211,   218,    75,    81,    82,   170,     4,
     125,   115,   115,     4,   218,   218,   102,   211,   165,   187,
     206,     4,    70,     4,     4,    70,     4,    70,   173,     4,
     126,   218,   218,   218,    29,    64,    74,   174,     4,     4,
       4,   175,   211,     4,   196,    98
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
#line 325 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 334 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 335 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 336 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 337 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 338 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 339 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 340 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 341 "imcc/imcc.y"
    { yyval.i = 0;  imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 13:
#line 342 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 347 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 15:
#line 352 "imcc/imcc.y"
    {
            fataly(EX_SOFTWARE, sourcefile, line, ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 16:
#line 359 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 17:
#line 360 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 20:
#line 369 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 21:
#line 370 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 22:
#line 371 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 23:
#line 372 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 373 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 25:
#line 376 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 26:
#line 378 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 27:
#line 381 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, yyval.i->r[1]);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 28:
#line 387 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 30:
#line 395 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM);
                     function = "(emit)"; }
    break;

  case 31:
#line 398 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 32:
#line 407 "imcc/imcc.y"
    { yyval.i=0;
                                 IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                                 cur_namespace = yyvsp[-1].sr;
                                 }
    break;

  case 33:
#line 415 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 34:
#line 422 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 36:
#line 431 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 41:
#line 442 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 42:
#line 447 "imcc/imcc.y"
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
#line 461 "imcc/imcc.y"
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
#line 477 "imcc/imcc.y"
    {
           cur_unit = (pragmas.fastcall ? imc_open_unit(interp, IMC_FASTSUB)
                                          : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 45:
#line 482 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[-2].sr);
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
          add_namespace(interp, i->r[1]);
          i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
        }
    break;

  case 46:
#line 489 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 493 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 494 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 49:
#line 495 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 50:
#line 499 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 500 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 52:
#line 504 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 508 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 54:
#line 510 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(yyvsp[-2].s));
            i->r[1] = yyval.sr = mk_pcc_sub(str_dup(i->r[0]->name), 0);
            add_namespace(interp, i->r[1]);
            i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
         }
    break;

  case 55:
#line 517 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 521 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 522 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 58:
#line 523 "imcc/imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 59:
#line 527 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 60:
#line 528 "imcc/imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 61:
#line 533 "imcc/imcc.y"
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
                r1->pcc_sub->calls_a_sub |= 1;
         }
    break;

  case 62:
#line 560 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 63:
#line 564 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 64:
#line 565 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 65:
#line 569 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 66:
#line 571 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 67:
#line 574 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 68:
#line 575 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 69:
#line 579 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 70:
#line 580 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 71:
#line 581 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 73:
#line 585 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 74:
#line 586 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 75:
#line 587 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 76:
#line 588 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 77:
#line 589 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 78:
#line 594 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 79:
#line 599 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 80:
#line 601 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->nci = 1;
         }
    break;

  case 81:
#line 606 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 82:
#line 608 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-1].s,'S')); }
    break;

  case 83:
#line 610 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 84:
#line 614 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 85:
#line 620 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 86:
#line 621 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 87:
#line 625 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 88:
#line 626 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 89:
#line 630 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 90:
#line 631 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 91:
#line 636 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 92:
#line 637 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 93:
#line 638 "imcc/imcc.y"
    {  mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 94:
#line 643 "imcc/imcc.y"
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
#line 658 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 96:
#line 663 "imcc/imcc.y"
    {
            Instruction *i, *ins;
            SymReg *r;
            char name[128];
            ins = cur_unit->instructions;
            if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
               fataly(EX_SOFTWARE, sourcefile, line,
                      "pcc_yield not inside pcc subroutine\n");
            ins->r[1]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
            sprintf(name, "%cpcc_sub_yield_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
            i = iLABEL(cur_unit, r);
            i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
         }
    break;

  case 97:
#line 679 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 98:
#line 683 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 99:
#line 685 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 100:
#line 687 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 101:
#line 691 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 104:
#line 708 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 105:
#line 713 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 106:
#line 714 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 107:
#line 715 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 108:
#line 716 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 109:
#line 720 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 113:
#line 730 "imcc/imcc.y"
    {
                     /* $$ = iLABEL(cur_unit, mk_address(, U_add_uniq_label)); */
                     yyval.i = iLABEL(cur_unit, mk_local_label(cur_unit, yyvsp[0].s));
                   }
    break;

  case 114:
#line 738 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 117:
#line 744 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 118:
#line 745 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 119:
#line 746 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 120:
#line 746 "imcc/imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 121:
#line 747 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 122:
#line 748 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 123:
#line 749 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 124:
#line 750 "imcc/imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 125:
#line 751 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 126:
#line 751 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
		                            1, mk_ident(yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 127:
#line 753 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 128:
#line 754 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 129:
#line 755 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 130:
#line 756 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 131:
#line 757 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 132:
#line 758 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 133:
#line 759 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 134:
#line 761 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 135:
#line 763 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 136:
#line 765 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 137:
#line 766 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 140:
#line 769 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 141:
#line 773 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 142:
#line 774 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 143:
#line 775 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 144:
#line 776 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 145:
#line 780 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 146:
#line 781 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 147:
#line 782 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 148:
#line 783 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 149:
#line 784 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 150:
#line 785 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 151:
#line 790 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
               fataly(1, sourcefile, line, "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 152:
#line 799 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 153:
#line 800 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 154:
#line 801 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 155:
#line 802 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 156:
#line 803 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 157:
#line 804 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 158:
#line 805 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 159:
#line 806 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 160:
#line 807 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 161:
#line 808 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 162:
#line 809 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 163:
#line 810 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 164:
#line 812 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 165:
#line 814 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 166:
#line 816 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 167:
#line 818 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 168:
#line 820 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 169:
#line 822 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 170:
#line 824 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 171:
#line 826 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 172:
#line 828 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 173:
#line 830 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 174:
#line 832 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 175:
#line 834 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 176:
#line 836 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 177:
#line 838 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 178:
#line 840 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 179:
#line 842 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 180:
#line 844 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 181:
#line 846 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                          mk_sub_address(yyvsp[0].s), NULL, 1); }
    break;

  case 182:
#line 849 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(yyvsp[-2].s),
                                           mk_sub_address(yyvsp[0].s), 1); }
    break;

  case 183:
#line 856 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                                    2, yyvsp[-3].sr, mk_label_address(cur_unit, yyvsp[0].s)); }
    break;

  case 184:
#line 859 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 185:
#line 861 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 186:
#line 865 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 867 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 188:
#line 869 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 189:
#line 872 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 190:
#line 878 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 191:
#line 882 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 194:
#line 892 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 894 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 896 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 898 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 900 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 902 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 904 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 906 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 908 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 910 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 912 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 914 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 919 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 207:
#line 925 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 208:
#line 926 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 209:
#line 930 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 210:
#line 931 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 211:
#line 932 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 212:
#line 935 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 213:
#line 936 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 214:
#line 941 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 215:
#line 946 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 216:
#line 950 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 217:
#line 951 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 218:
#line 952 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 219:
#line 957 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 220:
#line 959 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 221:
#line 963 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 222:
#line 964 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 223:
#line 969 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 971 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 973 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 975 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 977 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 979 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 983 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 230:
#line 984 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 231:
#line 985 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 232:
#line 986 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 233:
#line 987 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 234:
#line 988 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 237:
#line 997 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 238:
#line 998 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 239:
#line 1002 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 241:
#line 1007 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 242:
#line 1009 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 243:
#line 1017 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 244:
#line 1018 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 245:
#line 1022 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 246:
#line 1023 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 251:
#line 1036 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 252:
#line 1037 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 253:
#line 1041 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 254:
#line 1043 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 255:
#line 1044 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 256:
#line 1045 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 257:
#line 1049 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 258:
#line 1055 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 259:
#line 1057 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 260:
#line 1058 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 261:
#line 1062 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 262:
#line 1063 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 263:
#line 1064 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 264:
#line 1065 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 265:
#line 1066 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 266:
#line 1070 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 267:
#line 1071 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 268:
#line 1072 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 269:
#line 1073 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'U'); }
    break;

  case 270:
#line 1077 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 271:
#line 1078 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3263 "imcc/imcparser.c"

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


#line 1083 "imcc/imcc.y"



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

