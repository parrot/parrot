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
     MOD_ASSIGN = 298,
     SHR_ASSIGN = 299,
     SHL_ASSIGN = 300,
     SHR_U_ASSIGN = 301,
     SHIFT_LEFT = 302,
     SHIFT_RIGHT = 303,
     INTV = 304,
     FLOATV = 305,
     STRINGV = 306,
     PMCV = 307,
     OBJECTV = 308,
     LOG_XOR = 309,
     RELOP_EQ = 310,
     RELOP_NE = 311,
     RELOP_GT = 312,
     RELOP_GTE = 313,
     RELOP_LT = 314,
     RELOP_LTE = 315,
     GLOBAL = 316,
     GLOBALOP = 317,
     ADDR = 318,
     RESULT = 319,
     RETURN = 320,
     POW = 321,
     SHIFT_RIGHT_U = 322,
     LOG_AND = 323,
     LOG_OR = 324,
     COMMA = 325,
     ESUB = 326,
     DOTDOT = 327,
     PCC_BEGIN = 328,
     PCC_END = 329,
     PCC_CALL = 330,
     PCC_SUB = 331,
     PCC_BEGIN_RETURN = 332,
     PCC_END_RETURN = 333,
     PCC_BEGIN_YIELD = 334,
     PCC_END_YIELD = 335,
     NCI_CALL = 336,
     METH_CALL = 337,
     INVOCANT = 338,
     PROTOTYPED = 339,
     NON_PROTOTYPED = 340,
     MAIN = 341,
     LOAD = 342,
     IMMEDIATE = 343,
     POSTCOMP = 344,
     METHOD = 345,
     LABEL = 346,
     EMIT = 347,
     EOM = 348,
     IREG = 349,
     NREG = 350,
     SREG = 351,
     PREG = 352,
     IDENTIFIER = 353,
     REG = 354,
     MACRO = 355,
     ENDM = 356,
     STRINGC = 357,
     INTC = 358,
     FLOATC = 359,
     USTRINGC = 360,
     PARROT_OP = 361,
     VAR = 362,
     LINECOMMENT = 363,
     FILECOMMENT = 364,
     DOT = 365,
     CONCAT = 366,
     POINTY = 367
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
#define MOD_ASSIGN 298
#define SHR_ASSIGN 299
#define SHL_ASSIGN 300
#define SHR_U_ASSIGN 301
#define SHIFT_LEFT 302
#define SHIFT_RIGHT 303
#define INTV 304
#define FLOATV 305
#define STRINGV 306
#define PMCV 307
#define OBJECTV 308
#define LOG_XOR 309
#define RELOP_EQ 310
#define RELOP_NE 311
#define RELOP_GT 312
#define RELOP_GTE 313
#define RELOP_LT 314
#define RELOP_LTE 315
#define GLOBAL 316
#define GLOBALOP 317
#define ADDR 318
#define RESULT 319
#define RETURN 320
#define POW 321
#define SHIFT_RIGHT_U 322
#define LOG_AND 323
#define LOG_OR 324
#define COMMA 325
#define ESUB 326
#define DOTDOT 327
#define PCC_BEGIN 328
#define PCC_END 329
#define PCC_CALL 330
#define PCC_SUB 331
#define PCC_BEGIN_RETURN 332
#define PCC_END_RETURN 333
#define PCC_BEGIN_YIELD 334
#define PCC_END_YIELD 335
#define NCI_CALL 336
#define METH_CALL 337
#define INVOCANT 338
#define PROTOTYPED 339
#define NON_PROTOTYPED 340
#define MAIN 341
#define LOAD 342
#define IMMEDIATE 343
#define POSTCOMP 344
#define METHOD 345
#define LABEL 346
#define EMIT 347
#define EOM 348
#define IREG 349
#define NREG 350
#define SREG 351
#define PREG 352
#define IDENTIFIER 353
#define REG 354
#define MACRO 355
#define ENDM 356
#define STRINGC 357
#define INTC 358
#define FLOATC 359
#define USTRINGC 360
#define PARROT_OP 361
#define VAR 362
#define LINECOMMENT 363
#define FILECOMMENT 364
#define DOT 365
#define CONCAT 366
#define POINTY 367




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
#line 555 "imcc/imcparser.c"
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
#line 576 "imcc/imcparser.c"

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
#define YYLAST   555

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  129
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  99
/* YYNRULES -- Number of rules. */
#define YYNRULES  272
/* YYNRULES -- Number of states. */
#define YYNSTATES  468

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   367

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   117,     2,     2,     2,   123,   124,     2,
     126,   127,   121,   120,     2,   118,     2,   122,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   128,
       2,   114,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   115,     2,   116,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   125,     2,   119,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112,   113
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
     689,   693,   697,   701,   705,   709,   713,   717,   722,   724,
     726,   730,   734,   738,   740,   742,   743,   749,   750,   754,
     756,   758,   761,   765,   767,   774,   781,   786,   791,   796,
     801,   803,   805,   807,   809,   811,   813,   815,   817,   818,
     820,   824,   826,   828,   833,   835,   837,   839,   841,   843,
     845,   847,   849,   850,   853,   855,   859,   860,   865,   867,
     871,   874,   877,   879,   881,   883,   885,   887,   889,   891,
     893,   895,   897
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     130,     0,    -1,   131,    -1,   132,    -1,   131,   132,    -1,
     144,    -1,   143,    -1,   134,    -1,   133,    -1,   151,    -1,
     158,    -1,   141,    -1,   101,     4,    -1,     4,    -1,    62,
     197,    99,    -1,    62,   197,    99,   114,   226,    -1,    -1,
      30,   135,   197,    99,   114,   226,    -1,   137,    -1,   136,
     137,    -1,   186,   138,     4,    -1,   101,     4,    -1,   110,
      -1,   109,    -1,   143,    -1,    -1,   139,   107,   140,    -1,
      77,   169,    92,    -1,    -1,   213,    -1,    -1,    93,   142,
     136,    94,    -1,    21,   115,   220,   116,    -1,    -1,    23,
      99,   145,     4,   146,    24,    -1,   147,    -1,    -1,   148,
      -1,   147,   148,    -1,   149,    -1,   150,    -1,     4,    -1,
      25,   197,    99,     4,    -1,    26,    99,    99,     4,    -1,
      -1,    -1,    27,   152,   216,   169,     4,   153,   154,   157,
      -1,    -1,     4,    -1,   154,   155,     4,    -1,    -1,     5,
     156,   197,    99,    -1,   183,    72,    -1,    -1,    -1,    77,
     159,    99,   169,     4,   160,   161,   157,    -1,    -1,     4,
      -1,   161,   162,     4,    -1,    -1,     5,   163,   197,    99,
      -1,    -1,    74,   168,     4,   165,   172,   167,   171,   166,
     174,    75,    -1,    -1,   188,     4,    -1,    -1,    84,   219,
       4,    -1,    85,    -1,    86,    -1,    -1,   169,    71,   170,
      -1,   170,    -1,   168,    -1,    88,    -1,    87,    -1,    89,
      -1,    90,    -1,    91,    -1,    76,   219,    71,   219,     4,
      -1,    76,   219,     4,    -1,    82,   219,     4,    -1,    83,
     212,     4,    -1,    83,   103,     4,    -1,    83,   212,    71,
     219,     4,    -1,    83,   103,    71,   219,     4,    -1,    -1,
     172,   173,     4,    -1,     9,   219,    -1,    10,   212,    -1,
      -1,   174,   175,     4,    -1,    65,   212,    -1,    -1,    29,
     176,   197,    99,    -1,    -1,    78,     4,   178,   181,    79,
      -1,    -1,    80,     4,   180,   181,    81,    -1,    -1,   181,
       4,    -1,   181,   182,     4,    -1,    66,   219,    -1,   185,
      -1,   183,   185,    -1,    -1,   184,   189,    -1,   101,     4,
      -1,   110,    -1,   109,    -1,    -1,   187,    -1,   187,   188,
      -1,   188,    -1,    92,    -1,   186,   190,     4,    -1,   199,
      -1,   210,    -1,    21,    99,    -1,    22,    99,    -1,    -1,
      29,   191,   197,    99,    -1,    -1,    30,   192,   197,    99,
     114,   226,    -1,    -1,    33,   193,   197,    99,   114,   226,
      -1,    -1,     5,   194,   197,    99,    -1,     5,   225,    -1,
      65,   219,    -1,     9,   219,    -1,    66,   219,    -1,     7,
     217,    -1,     8,   217,    -1,    -1,    17,   195,   140,    -1,
     107,   213,    -1,   205,    -1,   164,    -1,   177,    -1,   179,
      -1,    -1,    17,    -1,    18,    -1,    19,    -1,    20,    -1,
      50,    -1,    51,    -1,    52,    -1,    53,    -1,    54,    -1,
     198,    -1,    99,    -1,   212,   114,   219,    -1,   212,   114,
     117,   219,    -1,   212,   114,   118,   219,    -1,   212,   114,
     119,   219,    -1,   212,   114,   219,   120,   219,    -1,   212,
     114,   219,   118,   219,    -1,   212,   114,   219,   121,   219,
      -1,   212,   114,   219,    67,   219,    -1,   212,   114,   219,
     122,   219,    -1,   212,   114,   219,    42,   219,    -1,   212,
     114,   219,   123,   219,    -1,   212,   114,   219,   112,   219,
      -1,   212,   114,   219,    48,   219,    -1,   212,   114,   219,
      49,   219,    -1,   212,   114,   219,    68,   219,    -1,   212,
     114,   219,    69,   219,    -1,   212,   114,   219,    70,   219,
      -1,   212,   114,   219,    55,   219,    -1,   212,   114,   219,
     124,   219,    -1,   212,   114,   219,   125,   219,    -1,   212,
     114,   219,   119,   219,    -1,   212,   114,   219,   115,   220,
     116,    -1,   212,   115,   220,   116,   114,   219,    -1,   212,
     114,    16,   198,    71,   219,    -1,   212,   114,    16,   198,
     115,   220,   116,    -1,   212,   114,    16,   198,    -1,   212,
     114,    16,   219,    -1,   212,   114,    16,   219,    71,   219,
      -1,   212,   114,    16,   219,   115,   220,   116,    -1,   212,
     114,   196,    99,    -1,   212,   114,   196,    99,    71,    99,
      -1,   212,   114,    64,    99,    -1,   212,   114,    63,   227,
      -1,    63,   227,   114,   219,    -1,    16,   212,    71,   219,
      -1,    16,   212,    71,   219,    71,   219,    -1,    16,   212,
      71,   219,   115,   220,   116,    -1,   212,   114,   205,    -1,
      -1,   200,   126,   209,   127,   114,   203,   126,   207,   127,
      -1,   201,    -1,   202,    -1,   212,    34,   219,    -1,   212,
      35,   219,    -1,   212,    36,   219,    -1,   212,    37,   219,
      -1,   212,    44,   219,    -1,   212,    43,   219,    -1,   212,
      38,   219,    -1,   212,    39,   219,    -1,   212,    40,   219,
      -1,   212,    41,   219,    -1,   212,    45,   219,    -1,   212,
      46,   219,    -1,   212,    47,   219,    -1,   212,   114,   107,
     140,    -1,    99,    -1,   212,    -1,   212,   204,   216,    -1,
     212,   204,   103,    -1,   212,   204,   212,    -1,   113,    -1,
     111,    -1,    -1,   203,   206,   126,   207,   127,    -1,    -1,
     207,    71,   208,    -1,   208,    -1,   219,    -1,    10,   212,
      -1,   209,    71,   212,    -1,   212,    -1,    11,   219,   211,
     219,     8,   217,    -1,    12,   219,   211,   219,     8,   217,
      -1,    11,   219,     8,   217,    -1,    12,   219,     8,   217,
      -1,    11,   219,    71,   217,    -1,    12,   219,    71,   217,
      -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,    60,
      -1,    61,    -1,   108,    -1,   225,    -1,    -1,   214,    -1,
     214,    71,   215,    -1,   215,    -1,   218,    -1,   212,   115,
     220,   116,    -1,    99,    -1,   107,    -1,    99,    -1,   107,
      -1,   217,    -1,   219,    -1,   212,    -1,   226,    -1,    -1,
     221,   222,    -1,   224,    -1,   222,   128,   224,    -1,    -1,
     222,    71,   223,   224,    -1,   219,    -1,   219,    73,   219,
      -1,    73,   219,    -1,   219,    73,    -1,    95,    -1,    96,
      -1,    97,    -1,    98,    -1,   100,    -1,   104,    -1,   105,
      -1,   103,    -1,   106,    -1,    97,    -1,   103,    -1
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
     903,   905,   907,   909,   911,   913,   915,   919,   927,   928,
     932,   933,   934,   937,   938,   943,   941,   951,   953,   954,
     957,   960,   964,   966,   969,   972,   974,   976,   978,   980,
     984,   986,   987,   988,   989,   990,   993,   995,   998,  1000,
    1003,  1005,  1008,  1010,  1018,  1020,  1023,  1025,  1028,  1030,
    1033,  1035,  1038,  1038,  1042,  1044,  1046,  1046,  1050,  1056,
    1059,  1060,  1063,  1065,  1066,  1067,  1068,  1071,  1073,  1074,
    1075,  1078,  1080
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
  "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", 
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", 
  "OBJECTV", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", 
  "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT", 
  "RETURN", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", 
  "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", 
  "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "PROTOTYPED", 
  "NON_PROTOTYPED", "MAIN", "LOAD", "IMMEDIATE", "POSTCOMP", "METHOD", 
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", 
  "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", 
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
  "newsub", "type", "classname", "assignment", "@20", "op_assign", 
  "func_assign", "the_sub", "ptr", "sub_call", "@21", "arglist", "arg", 
  "targetlist", "if_statement", "relop", "target", "vars", "_vars", 
  "_var_or_i", "sub_label_op", "label_op", "var_or_i", "var", "keylist", 
  "@22", "_keylist", "@23", "key", "reg", "const", "string", 0
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
     364,   365,   366,   367,    61,    91,    93,    33,    45,   126,
      43,    42,    47,    37,    38,   124,    40,    41,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   129,   130,   131,   131,   132,   132,   132,   132,   132,
     132,   132,   132,   132,   133,   133,   135,   134,   136,   136,
     137,   137,   137,   137,   137,   139,   138,   138,   138,   140,
     142,   141,   143,   145,   144,   146,   146,   147,   147,   148,
     148,   148,   149,   150,   152,   153,   151,   154,   154,   154,
     156,   155,   157,   159,   160,   158,   161,   161,   161,   163,
     162,   165,   164,   166,   166,   167,   167,   168,   168,   169,
     169,   169,   170,   170,   170,   170,   170,   170,   171,   171,
     171,   171,   171,   171,   171,   172,   172,   173,   173,   174,
     174,   175,   176,   175,   178,   177,   180,   179,   181,   181,
     181,   182,   183,   183,   184,   185,   185,   185,   185,   186,
     186,   187,   187,   188,   189,   190,   190,   190,   190,   191,
     190,   192,   190,   193,   190,   194,   190,   190,   190,   190,
     190,   190,   190,   195,   190,   190,   190,   190,   190,   190,
     190,   196,   196,   196,   196,   197,   197,   197,   197,   197,
     197,   198,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     200,   199,   199,   199,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   202,   203,   203,
     203,   203,   203,   204,   204,   206,   205,   207,   207,   207,
     208,   208,   209,   209,   210,   210,   210,   210,   210,   210,
     211,   211,   211,   211,   211,   211,   212,   212,   213,   213,
     214,   214,   215,   215,   216,   216,   217,   217,   218,   218,
     219,   219,   221,   220,   222,   222,   223,   222,   224,   224,
     224,   224,   225,   225,   225,   225,   225,   226,   226,   226,
     226,   227,   227
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
       3,     3,     3,     3,     3,     3,     3,     4,     1,     1,
       3,     3,     3,     1,     1,     0,     5,     0,     3,     1,
       1,     2,     3,     1,     6,     6,     4,     4,     4,     4,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       3,     1,     1,     4,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     2,     1,     3,     0,     4,     1,     3,
       2,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,    44,    16,     0,    53,    30,     0,
       0,     2,     3,     8,     7,    11,     6,     5,     9,    10,
     252,    33,     0,     0,   145,   146,   147,   148,   149,   151,
       0,   150,     0,   109,    12,     1,     4,     0,     0,     0,
     244,   245,    69,     0,    14,    69,   113,     0,    23,    22,
     109,    18,    24,    25,   110,   112,    32,     0,   262,   263,
     264,   265,   266,   269,   267,   268,   270,   236,   250,   258,
     253,   254,   237,   251,    36,    67,    68,    74,    73,    75,
      76,    77,    72,     0,    71,     0,     0,     0,    21,    31,
      19,    69,     0,     0,   111,   260,   261,   256,     0,    41,
       0,     0,     0,    35,    37,    39,    40,    45,     0,     0,
      15,    54,     0,    20,   238,   259,     0,   255,     0,     0,
      34,    38,    47,    70,    17,    56,    27,   246,   247,    26,
     250,    29,   239,   241,   248,   242,   249,   257,     0,     0,
      48,   104,    57,   104,   252,     0,    42,    43,    50,     0,
     108,   107,     0,    46,   104,   109,   102,    59,    55,     0,
       0,   240,     0,   106,    49,    52,   103,   140,   105,     0,
      58,   243,     0,   125,     0,     0,     0,     0,     0,     0,
     133,     0,     0,   119,   121,   123,     0,     0,     0,     0,
       0,     0,   208,   238,   137,   138,   139,     0,   115,     0,
     192,   193,   215,   136,   116,   209,     0,    51,     0,   127,
     131,   132,   129,     0,     0,     0,   238,   117,   118,     0,
       0,     0,   271,   272,     0,   128,   130,     0,    94,    96,
     135,   114,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   214,   213,     0,
     252,     0,    60,     0,     0,   230,   231,   232,   233,   234,
     235,     0,     0,     0,     0,     0,     0,   134,     0,     0,
       0,     0,    61,    98,    98,     0,   223,   217,   194,   195,
     196,   197,   200,   201,   202,   203,   199,   198,   204,   205,
     206,     0,   141,   142,   143,   144,     0,     0,   238,     0,
       0,     0,     0,   189,   250,   152,     0,   211,   212,   210,
     126,   226,   228,     0,   227,   229,     0,   186,   120,     0,
       0,   185,    85,     0,     0,     0,     0,     0,     0,   219,
     220,   177,   178,   184,   183,   207,   153,   154,   155,   181,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   252,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   252,     0,     0,    65,    99,     0,    95,     0,
      97,   222,     0,   221,     0,   216,     0,   252,     0,   252,
       0,   161,   164,   165,   169,   159,   166,   167,   168,   163,
       0,   157,   172,   156,   158,   160,   162,   170,   171,     0,
     224,   225,   187,     0,   122,   124,     0,     0,     0,     0,
       0,   101,   100,     0,   209,   218,   175,     0,   179,     0,
     182,   173,   174,   188,    87,    88,     0,     0,     0,     0,
      63,    86,   217,   176,   180,    66,     0,     0,     0,     0,
      89,     0,     0,    79,     0,    80,    82,     0,    81,     0,
       0,    64,   191,     0,     0,     0,    92,     0,    62,     0,
      78,    84,    83,     0,    91,    90,     0,    93
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    10,    11,    12,    13,    14,    23,    50,    51,    92,
      93,   129,    15,    33,    16,    17,    39,   102,   103,   104,
     105,   106,    18,    22,   122,   141,   152,   162,   153,    19,
      32,   125,   143,   159,   169,   194,   322,   440,   409,    82,
      83,    84,   430,   365,   410,   450,   459,   463,   195,   273,
     196,   274,   323,   369,   154,   155,   156,    53,    54,    55,
     168,   197,   219,   220,   221,   208,   216,   302,    30,    31,
     198,   199,   200,   201,   202,   251,   203,   233,   328,   329,
     275,   204,   262,    68,   131,   132,   133,    42,   134,   135,
     136,    37,    38,    70,   116,    71,    72,    73,   224
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -204
static const short yypact[] =
{
     157,  -204,   -98,   -73,  -204,  -204,   141,  -204,  -204,    37,
      46,   157,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,
    -204,  -204,    52,   141,  -204,  -204,  -204,  -204,  -204,  -204,
     -51,  -204,   -24,    35,  -204,  -204,  -204,   -36,   377,   109,
    -204,  -204,   463,    27,     9,   463,  -204,   124,  -204,  -204,
      -2,  -204,  -204,     6,    45,  -204,  -204,   419,  -204,  -204,
    -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,    62,
     -55,  -204,  -204,  -204,    43,  -204,  -204,  -204,  -204,  -204,
    -204,  -204,  -204,     7,  -204,    26,   148,     8,  -204,  -204,
    -204,   463,   163,    65,  -204,  -204,   419,  -204,   377,  -204,
     141,    75,   153,    43,  -204,  -204,  -204,  -204,   463,   148,
    -204,  -204,   -26,  -204,   391,  -204,   377,  -204,    80,    82,
    -204,  -204,   178,  -204,  -204,   179,  -204,  -204,  -204,  -204,
      73,  -204,   145,  -204,  -204,  -204,  -204,  -204,   208,   214,
    -204,     2,  -204,    15,  -204,   391,  -204,  -204,  -204,   218,
    -204,  -204,   221,  -204,   114,    45,  -204,  -204,  -204,   224,
     101,  -204,   141,  -204,  -204,  -204,  -204,    22,  -204,   141,
    -204,  -204,   130,   201,    63,    63,   419,   419,   419,   447,
    -204,   133,   134,  -204,  -204,  -204,   -44,   419,   419,    64,
     231,   234,  -204,   391,  -204,  -204,  -204,   235,  -204,   118,
    -204,  -204,  -204,  -204,  -204,   424,   146,  -204,   141,  -204,
    -204,  -204,  -204,   213,   229,   175,   391,  -204,  -204,   141,
     141,   141,  -204,  -204,   143,  -204,  -204,   244,  -204,  -204,
    -204,  -204,   447,   129,   419,   419,   419,   419,   419,   419,
     419,   419,   419,   419,   419,   419,   419,  -204,  -204,   338,
    -204,   287,  -204,   160,    63,  -204,  -204,  -204,  -204,  -204,
    -204,    63,   419,    63,    63,   419,   419,  -204,   161,   162,
     164,   419,  -204,  -204,  -204,   -65,  -204,    60,  -204,  -204,
    -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,
    -204,   405,  -204,  -204,  -204,  -204,   -44,   168,   391,   419,
     419,   419,   169,  -204,    21,   298,   159,  -204,  -204,  -204,
    -204,  -204,  -204,   254,  -204,  -204,   268,   -50,  -204,   167,
     177,  -204,  -204,    31,     5,   447,   181,   447,   -22,  -204,
    -204,   -43,   -39,  -204,  -204,  -204,  -204,  -204,  -204,   206,
     419,   419,   419,   419,   419,   419,   419,   419,   419,  -204,
     419,   419,   419,   419,   419,   419,   419,   419,   188,    63,
      63,   419,  -204,   148,   148,    14,  -204,   419,  -204,   274,
    -204,  -204,   331,  -204,    60,  -204,   419,  -204,   419,  -204,
     183,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,
     176,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,   419,
    -204,  -204,  -204,   187,  -204,  -204,   419,   447,   419,    93,
     279,  -204,  -204,   197,    20,  -204,  -204,   198,  -204,   209,
    -204,  -204,  -204,  -204,  -204,  -204,   289,   419,   419,   433,
      45,  -204,    60,  -204,  -204,  -204,    11,   300,    33,    38,
    -204,   320,   -21,  -204,   419,  -204,  -204,   419,  -204,   419,
     -11,  -204,  -204,   323,   324,   326,  -204,   447,  -204,   327,
    -204,  -204,  -204,   141,  -204,  -204,   236,  -204
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -204,  -204,  -204,   322,  -204,  -204,  -204,  -204,   284,  -204,
    -204,  -203,  -204,  -204,    24,  -204,  -204,  -204,  -204,   233,
    -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,   194,  -204,
    -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,   149,
     -31,   237,  -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,
    -204,  -204,    68,  -204,  -204,  -204,   190,   193,  -204,   -53,
    -204,  -204,  -204,  -204,  -204,  -204,  -204,  -204,   -23,    58,
    -204,  -204,  -204,  -204,   -20,  -204,   110,  -204,   -82,   -14,
    -204,  -204,   147,   -78,   170,  -204,   217,   119,  -170,  -204,
     -35,  -136,  -204,  -204,  -204,   -58,   196,   -84,    76
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -210
static const short yytable[] =
{
      43,    94,   110,    69,   210,   211,   325,   148,   160,   366,
     -28,   107,   111,   267,    87,   443,    97,    20,   456,     2,
     157,   361,    95,   406,   407,   124,    21,   173,   376,   174,
     175,   176,   378,   177,   178,   366,   130,   446,   179,   180,
     117,    34,   448,   181,   182,   108,    35,    99,    44,   374,
     374,   183,   184,   222,   457,   185,     2,    52,   137,   223,
     112,   115,   326,    69,   458,   362,   126,   130,   100,   101,
     327,   367,   377,    98,    52,    45,   379,   118,   108,   108,
      56,    69,   444,    91,   311,   186,   370,   187,   188,   205,
      46,   312,    89,   314,   315,   335,   189,   367,   408,    47,
     190,   215,   191,   149,   447,   375,   452,    48,    49,   449,
     368,   150,   151,    74,   306,   130,   149,    58,    59,    60,
      61,   192,    62,    86,   150,   151,    85,    46,    88,   193,
      67,   247,   247,   248,   248,    96,    47,    46,   130,   172,
     109,   212,   213,   214,    48,    49,   206,  -209,  -190,    75,
      76,    40,   225,   226,   276,    58,    59,    60,    61,    41,
      62,     1,   127,    63,    64,    65,    66,   113,    67,   427,
     128,   304,   114,   308,   119,   428,   429,   120,     2,   138,
       3,   139,   140,   142,     4,   253,   165,     5,   144,   400,
     401,    24,    25,    26,    27,    28,   268,   269,   270,   278,
     279,   280,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   290,   146,   390,   305,   149,   145,   171,   147,     6,
     130,   254,   163,   150,   151,   164,   403,   313,   170,   207,
     316,   317,   217,   218,     7,   228,   321,   263,   229,   231,
      29,   417,   330,   419,   232,   252,   266,   371,   272,   373,
       8,    63,    64,    65,    66,   277,   332,   271,     9,   310,
     318,   319,   359,   320,   336,   337,   338,   334,   339,   255,
     256,   257,   258,   259,   260,   358,   360,   380,   412,   404,
     405,   363,   420,   431,   261,   255,   256,   257,   258,   259,
     260,   364,   421,   435,   414,   372,    58,    59,    60,    61,
     264,    62,   399,   423,   445,   381,   382,   383,   384,   385,
     386,   387,   388,   389,   433,   391,   392,   393,   394,   395,
     396,   397,   398,   432,   451,   434,   402,   460,   461,   425,
     462,   465,   411,    36,    90,   467,   121,   158,   227,   330,
     340,   416,   324,   418,   166,   123,   341,   342,   167,   331,
     442,   439,   413,   343,   291,   292,   293,   294,   295,   303,
     415,   265,   161,   230,   422,   344,   345,   346,   347,   209,
     309,   424,   333,   426,     0,     0,     0,   441,     0,   464,
       0,     0,    58,    59,    60,    61,    40,    62,     0,     0,
     307,     0,   436,   437,    41,    67,     0,   330,     0,     0,
       0,   296,   297,     0,     0,     0,     0,     0,     0,   453,
     348,     0,   454,   349,   455,     0,   350,   351,   352,   353,
     354,   355,   356,   357,     0,     0,    58,    59,    60,    61,
     192,    62,     0,    58,    59,    60,    61,   192,    62,    67,
     466,    63,    64,    65,    66,   298,    67,     0,     0,     0,
      57,     0,     0,     0,     0,   299,   300,   301,   234,   235,
     236,   237,   238,   239,   240,   241,     0,   242,   243,   244,
     245,   246,    58,    59,    60,    61,     0,    62,     0,     0,
      63,    64,    65,    66,     0,    67,    58,    59,    60,    61,
     127,    62,     0,     0,    63,    64,    65,    66,   128,    67,
      58,    59,    60,    61,    29,    62,     0,     0,    63,    64,
      65,    66,     0,    67,    58,    59,    60,    61,     0,    62,
       0,     0,    63,    64,    65,    66,     0,    67,    58,    59,
      60,    61,     0,    62,     0,   247,   438,   248,   249,   250,
       0,    67,    58,    59,    60,    61,     0,    62,    75,    76,
      77,    78,    79,    80,    81,    67
};

static const short yycheck[] =
{
      23,    54,    86,    38,   174,   175,    71,     5,   144,     4,
       4,     4,     4,   216,    45,     4,    71,   115,    29,    21,
       5,    71,    57,     9,    10,   109,    99,     5,    71,     7,
       8,     9,    71,    11,    12,     4,   114,     4,    16,    17,
      98,     4,     4,    21,    22,    71,     0,     4,    99,    71,
      71,    29,    30,    97,    65,    33,    21,    33,   116,   103,
      91,    96,   127,    98,    75,   115,    92,   145,    25,    26,
      10,    66,   115,   128,    50,    99,   115,   100,    71,    71,
     116,   116,    71,    77,   254,    63,    81,    65,    66,   167,
      92,   261,    94,   263,   264,   298,    74,    66,    84,   101,
      78,   179,    80,   101,    71,   127,   127,   109,   110,    71,
      79,   109,   110,     4,   250,   193,   101,    95,    96,    97,
      98,    99,   100,   114,   109,   110,    99,    92,     4,   107,
     108,   111,   111,   113,   113,    73,   101,    92,   216,   162,
     114,   176,   177,   178,   109,   110,   169,   126,   126,    85,
      86,    99,   187,   188,   232,    95,    96,    97,    98,   107,
     100,     4,    99,   103,   104,   105,   106,     4,   108,    76,
     107,   249,   107,   251,    99,    82,    83,    24,    21,    99,
      23,    99,     4,     4,    27,   208,    72,    30,   115,   359,
     360,    50,    51,    52,    53,    54,   219,   220,   221,   234,
     235,   236,   237,   238,   239,   240,   241,   242,   243,   244,
     245,   246,     4,   349,   249,   101,    71,   116,     4,    62,
     298,     8,     4,   109,   110,     4,   362,   262,     4,    99,
     265,   266,    99,    99,    77,     4,   271,     8,     4,     4,
      99,   377,   277,   379,   126,    99,    71,   325,     4,   327,
      93,   103,   104,   105,   106,   126,   291,   114,   101,    99,
      99,    99,     8,    99,   299,   300,   301,    99,    99,    56,
      57,    58,    59,    60,    61,   116,     8,    71,     4,   363,
     364,   114,    99,     4,    71,    56,    57,    58,    59,    60,
      61,   114,   116,     4,   372,   114,    95,    96,    97,    98,
      71,   100,   114,   116,     4,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   116,   350,   351,   352,   353,   354,
     355,   356,   357,   126,     4,   116,   361,     4,     4,   407,
       4,     4,   367,    11,    50,    99,   103,   143,   189,   374,
      42,   376,   274,   378,   154,   108,    48,    49,   155,   291,
     432,   429,   372,    55,    16,    17,    18,    19,    20,   249,
     374,   214,   145,   193,   399,    67,    68,    69,    70,   173,
     251,   406,   296,   408,    -1,    -1,    -1,   430,    -1,   457,
      -1,    -1,    95,    96,    97,    98,    99,   100,    -1,    -1,
     103,    -1,   427,   428,   107,   108,    -1,   432,    -1,    -1,
      -1,    63,    64,    -1,    -1,    -1,    -1,    -1,    -1,   444,
     112,    -1,   447,   115,   449,    -1,   118,   119,   120,   121,
     122,   123,   124,   125,    -1,    -1,    95,    96,    97,    98,
      99,   100,    -1,    95,    96,    97,    98,    99,   100,   108,
     463,   103,   104,   105,   106,   107,   108,    -1,    -1,    -1,
      73,    -1,    -1,    -1,    -1,   117,   118,   119,    34,    35,
      36,    37,    38,    39,    40,    41,    -1,    43,    44,    45,
      46,    47,    95,    96,    97,    98,    -1,   100,    -1,    -1,
     103,   104,   105,   106,    -1,   108,    95,    96,    97,    98,
      99,   100,    -1,    -1,   103,   104,   105,   106,   107,   108,
      95,    96,    97,    98,    99,   100,    -1,    -1,   103,   104,
     105,   106,    -1,   108,    95,    96,    97,    98,    -1,   100,
      -1,    -1,   103,   104,   105,   106,    -1,   108,    95,    96,
      97,    98,    -1,   100,    -1,   111,   103,   113,   114,   115,
      -1,   108,    95,    96,    97,    98,    -1,   100,    85,    86,
      87,    88,    89,    90,    91,   108
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,    21,    23,    27,    30,    62,    77,    93,   101,
     130,   131,   132,   133,   134,   141,   143,   144,   151,   158,
     115,    99,   152,   135,    50,    51,    52,    53,    54,    99,
     197,   198,   159,   142,     4,     0,   132,   220,   221,   145,
      99,   107,   216,   197,    99,    99,    92,   101,   109,   110,
     136,   137,   143,   186,   187,   188,   116,    73,    95,    96,
      97,    98,   100,   103,   104,   105,   106,   108,   212,   219,
     222,   224,   225,   226,     4,    85,    86,    87,    88,    89,
      90,    91,   168,   169,   170,    99,   114,   169,     4,    94,
     137,    77,   138,   139,   188,   219,    73,    71,   128,     4,
      25,    26,   146,   147,   148,   149,   150,     4,    71,   114,
     226,     4,   169,     4,   107,   219,   223,   224,   197,    99,
      24,   148,   153,   170,   226,   160,    92,    99,   107,   140,
     212,   213,   214,   215,   217,   218,   219,   224,    99,    99,
       4,   154,     4,   161,   115,    71,     4,     4,     5,   101,
     109,   110,   155,   157,   183,   184,   185,     5,   157,   162,
     220,   215,   156,     4,     4,    72,   185,   186,   189,   163,
       4,   116,   197,     5,     7,     8,     9,    11,    12,    16,
      17,    21,    22,    29,    30,    33,    63,    65,    66,    74,
      78,    80,    99,   107,   164,   177,   179,   190,   199,   200,
     201,   202,   203,   205,   210,   212,   197,    99,   194,   225,
     217,   217,   219,   219,   219,   212,   195,    99,    99,   191,
     192,   193,    97,   103,   227,   219,   219,   168,     4,     4,
     213,     4,   126,   206,    34,    35,    36,    37,    38,    39,
      40,    41,    43,    44,    45,    46,    47,   111,   113,   114,
     115,   204,    99,   197,     8,    56,    57,    58,    59,    60,
      61,    71,   211,     8,    71,   211,    71,   140,   197,   197,
     197,   114,     4,   178,   180,   209,   212,   126,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,    16,    17,    18,    19,    20,    63,    64,   107,   117,
     118,   119,   196,   205,   212,   219,   220,   103,   212,   216,
      99,   217,   217,   219,   217,   217,   219,   219,    99,    99,
      99,   219,   165,   181,   181,    71,   127,    10,   207,   208,
     219,   198,   219,   227,    99,   140,   219,   219,   219,    99,
      42,    48,    49,    55,    67,    68,    69,    70,   112,   115,
     118,   119,   120,   121,   122,   123,   124,   125,   116,     8,
       8,    71,   115,   114,   114,   172,     4,    66,    79,   182,
      81,   212,   114,   212,    71,   127,    71,   115,    71,   115,
      71,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     220,   219,   219,   219,   219,   219,   219,   219,   219,   114,
     217,   217,   219,   220,   226,   226,     9,    10,    84,   167,
     173,   219,     4,   203,   212,   208,   219,   220,   219,   220,
      99,   116,   219,   116,   219,   212,   219,    76,    82,    83,
     171,     4,   126,   116,   116,     4,   219,   219,   103,   212,
     166,   188,   207,     4,    71,     4,     4,    71,     4,    71,
     174,     4,   127,   219,   219,   219,    29,    65,    75,   175,
       4,     4,     4,   176,   212,     4,   197,    99
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
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 902 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 904 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 906 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 908 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 910 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 912 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 914 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 916 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 921 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 208:
#line 927 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 209:
#line 928 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                          fataly(1, sourcefile, line, "Sub isn't a PMC");
                     }
    break;

  case 210:
#line 932 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 211:
#line 933 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 212:
#line 934 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 213:
#line 937 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 214:
#line 938 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 215:
#line 943 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 216:
#line 948 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 217:
#line 952 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 218:
#line 953 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 219:
#line 954 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 220:
#line 959 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 221:
#line 961 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 222:
#line 965 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 223:
#line 966 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 224:
#line 971 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 973 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 975 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 977 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 228:
#line 979 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 229:
#line 981 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 230:
#line 985 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 231:
#line 986 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 232:
#line 987 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 233:
#line 988 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 234:
#line 989 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 235:
#line 990 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 238:
#line 999 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 239:
#line 1000 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 240:
#line 1004 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 242:
#line 1009 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 243:
#line 1011 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 244:
#line 1019 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 245:
#line 1020 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(yyvsp[0].s); }
    break;

  case 246:
#line 1024 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 247:
#line 1025 "imcc/imcc.y"
    { yyval.sr = mk_label_address(cur_unit, yyvsp[0].s); }
    break;

  case 252:
#line 1038 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 253:
#line 1039 "imcc/imcc.y"
    {  yyval.sr = link_keys(nkeys, keys); }
    break;

  case 254:
#line 1043 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 255:
#line 1045 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 256:
#line 1046 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 257:
#line 1047 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 258:
#line 1051 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 259:
#line 1057 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 260:
#line 1059 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 261:
#line 1060 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 262:
#line 1064 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 263:
#line 1065 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 264:
#line 1066 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 265:
#line 1067 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 266:
#line 1068 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 267:
#line 1072 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 268:
#line 1073 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 269:
#line 1074 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 270:
#line 1075 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'U'); }
    break;

  case 271:
#line 1079 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 272:
#line 1080 "imcc/imcc.y"
    {  yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3274 "imcc/imcparser.c"

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


#line 1085 "imcc/imcc.y"



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

