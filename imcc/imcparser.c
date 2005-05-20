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
     FASTCALL = 261,
     N_OPERATORS = 262,
     CALL = 263,
     GOTO = 264,
     ARG = 265,
     FLATTEN_ARG = 266,
     FLATTEN = 267,
     IF = 268,
     UNLESS = 269,
     END = 270,
     SAVEALL = 271,
     RESTOREALL = 272,
     NEW = 273,
     NEWSUB = 274,
     NEWCLOSURE = 275,
     NEWCOR = 276,
     NEWCONT = 277,
     NAMESPACE = 278,
     ENDNAMESPACE = 279,
     CLASS = 280,
     ENDCLASS = 281,
     FIELD = 282,
     DOT_METHOD = 283,
     SUB = 284,
     SYM = 285,
     LOCAL = 286,
     CONST = 287,
     INC = 288,
     DEC = 289,
     GLOBAL_CONST = 290,
     PLUS_ASSIGN = 291,
     MINUS_ASSIGN = 292,
     MUL_ASSIGN = 293,
     DIV_ASSIGN = 294,
     CONCAT_ASSIGN = 295,
     BAND_ASSIGN = 296,
     BOR_ASSIGN = 297,
     BXOR_ASSIGN = 298,
     FDIV = 299,
     FDIV_ASSIGN = 300,
     MOD_ASSIGN = 301,
     SHR_ASSIGN = 302,
     SHL_ASSIGN = 303,
     SHR_U_ASSIGN = 304,
     SHIFT_LEFT = 305,
     SHIFT_RIGHT = 306,
     INTV = 307,
     FLOATV = 308,
     STRINGV = 309,
     PMCV = 310,
     OBJECTV = 311,
     LOG_XOR = 312,
     RELOP_EQ = 313,
     RELOP_NE = 314,
     RELOP_GT = 315,
     RELOP_GTE = 316,
     RELOP_LT = 317,
     RELOP_LTE = 318,
     GLOBAL = 319,
     GLOBALOP = 320,
     ADDR = 321,
     RESULT = 322,
     RETURN = 323,
     YIELDT = 324,
     POW = 325,
     SHIFT_RIGHT_U = 326,
     LOG_AND = 327,
     LOG_OR = 328,
     COMMA = 329,
     ESUB = 330,
     DOTDOT = 331,
     PCC_BEGIN = 332,
     PCC_END = 333,
     PCC_CALL = 334,
     PCC_SUB = 335,
     PCC_BEGIN_RETURN = 336,
     PCC_END_RETURN = 337,
     PCC_BEGIN_YIELD = 338,
     PCC_END_YIELD = 339,
     NCI_CALL = 340,
     METH_CALL = 341,
     INVOCANT = 342,
     PROTOTYPED = 343,
     NON_PROTOTYPED = 344,
     MAIN = 345,
     LOAD = 346,
     IMMEDIATE = 347,
     POSTCOMP = 348,
     METHOD = 349,
     ANON = 350,
     MULTI = 351,
     LABEL = 352,
     EMIT = 353,
     EOM = 354,
     IREG = 355,
     NREG = 356,
     SREG = 357,
     PREG = 358,
     IDENTIFIER = 359,
     REG = 360,
     MACRO = 361,
     ENDM = 362,
     STRINGC = 363,
     INTC = 364,
     FLOATC = 365,
     USTRINGC = 366,
     PARROT_OP = 367,
     VAR = 368,
     LINECOMMENT = 369,
     FILECOMMENT = 370,
     DOT = 371,
     CONCAT = 372,
     POINTY = 373
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define FASTCALL 261
#define N_OPERATORS 262
#define CALL 263
#define GOTO 264
#define ARG 265
#define FLATTEN_ARG 266
#define FLATTEN 267
#define IF 268
#define UNLESS 269
#define END 270
#define SAVEALL 271
#define RESTOREALL 272
#define NEW 273
#define NEWSUB 274
#define NEWCLOSURE 275
#define NEWCOR 276
#define NEWCONT 277
#define NAMESPACE 278
#define ENDNAMESPACE 279
#define CLASS 280
#define ENDCLASS 281
#define FIELD 282
#define DOT_METHOD 283
#define SUB 284
#define SYM 285
#define LOCAL 286
#define CONST 287
#define INC 288
#define DEC 289
#define GLOBAL_CONST 290
#define PLUS_ASSIGN 291
#define MINUS_ASSIGN 292
#define MUL_ASSIGN 293
#define DIV_ASSIGN 294
#define CONCAT_ASSIGN 295
#define BAND_ASSIGN 296
#define BOR_ASSIGN 297
#define BXOR_ASSIGN 298
#define FDIV 299
#define FDIV_ASSIGN 300
#define MOD_ASSIGN 301
#define SHR_ASSIGN 302
#define SHL_ASSIGN 303
#define SHR_U_ASSIGN 304
#define SHIFT_LEFT 305
#define SHIFT_RIGHT 306
#define INTV 307
#define FLOATV 308
#define STRINGV 309
#define PMCV 310
#define OBJECTV 311
#define LOG_XOR 312
#define RELOP_EQ 313
#define RELOP_NE 314
#define RELOP_GT 315
#define RELOP_GTE 316
#define RELOP_LT 317
#define RELOP_LTE 318
#define GLOBAL 319
#define GLOBALOP 320
#define ADDR 321
#define RESULT 322
#define RETURN 323
#define YIELDT 324
#define POW 325
#define SHIFT_RIGHT_U 326
#define LOG_AND 327
#define LOG_OR 328
#define COMMA 329
#define ESUB 330
#define DOTDOT 331
#define PCC_BEGIN 332
#define PCC_END 333
#define PCC_CALL 334
#define PCC_SUB 335
#define PCC_BEGIN_RETURN 336
#define PCC_END_RETURN 337
#define PCC_BEGIN_YIELD 338
#define PCC_END_YIELD 339
#define NCI_CALL 340
#define METH_CALL 341
#define INVOCANT 342
#define PROTOTYPED 343
#define NON_PROTOTYPED 344
#define MAIN 345
#define LOAD 346
#define IMMEDIATE 347
#define POSTCOMP 348
#define METHOD 349
#define ANON 350
#define MULTI 351
#define LABEL 352
#define EMIT 353
#define EOM 354
#define IREG 355
#define NREG 356
#define SREG 357
#define PREG 358
#define IDENTIFIER 359
#define REG 360
#define MACRO 361
#define ENDM 362
#define STRINGC 363
#define INTC 364
#define FLOATC 365
#define USTRINGC 366
#define PARROT_OP 367
#define VAR 368
#define LINECOMMENT 369
#define FILECOMMENT 370
#define DOT 371
#define CONCAT 372
#define POINTY 373




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
static SymReg *cur_obj, *cur_call;
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
mk_pmc_const(Parrot_Interp interp, IMC_Unit *unit,
        char *type, SymReg *left, char *constant)
{
    int type_enum = atoi(type);
    SymReg *rhs;
    SymReg *r[IMCC_MAX_REGS];
    char *name;
    int len;

    if (left->type == VTADDRESS) {      /* IDENTIFIER */
        if (IMCC_INFO(interp)->state->pasm_file) {
            IMCC_fataly(interp, E_SyntaxError,
            "Ident as PMC constant",
                " %s\n", left->name);
        }
        left->type = VTIDENTIFIER;
        left->set = 'P';
    }
    r[0] = left;
    /* strip delimiters */
    len = strlen(constant);
    name = mem_sys_allocate(len);
    constant[len - 1] = '\0';
    strcpy(name, constant + 1);
    free(constant);
    switch (type_enum) {
        case enum_class_Sub:
        case enum_class_Coroutine:
            rhs = mk_const(interp, name, 'p');
            r[1] = rhs;
            rhs->pmc_type = type_enum;
            rhs->usage = U_FIXUP;
            return INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
    }
    rhs = mk_const(interp, name, 'P');
    r[1] = rhs;
    rhs->pmc_type = type_enum;
    return INS(interp, unit, "set_p_pc", "", r, 2, 0, 1);
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
        SymReg * r3 = mk_const(interp, str_dup("1"), 'I');
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
        SymReg * r3 = mk_const(interp, str_dup("1"), 'I');
        MK_I(interp, unit, "substr %s, %s, %s, %s", 4, r0, r1,r3, r2);
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I(interp, unit, "set %s[%s], %s", 3, r0,r1,r2);
    }
    else {
        IMCC_fataly(interp, E_SyntaxError,
            "unsupported indexed set op\n");
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

    sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
    r = mk_pcc_sub(interpreter, str_dup(name), 0);
    current_call = i = iLABEL(cur_unit, r);
    i->type = ITCALL | ITPCCSUB;
    return i;
}


static SymReg *
mk_sub_address_fromc(Interp *interp, char * name)
{
    /* name is a quoted sub name */
    SymReg *r;

    name[strlen(name) - 1] = '\0';
    r = mk_sub_address(interp, str_dup(name + 1));
    mem_sys_free(name);
    return r;
}

void
IMCC_itcall_sub(Interp* interp, SymReg* sub)
{
   current_call->r[0]->pcc_sub->sub = sub;
   if (cur_obj) {
       if (cur_obj->set != 'P')
        IMCC_fataly(interp, E_SyntaxError, "object isn't a PMC");
       current_call->r[0]->pcc_sub->object = cur_obj;
       cur_obj = NULL;
   }
   /* FIXME use the default settings from .pragma */
   current_call->r[0]->pcc_sub->pragma = P_PROTOTYPED;
   if (current_call->r[0]->pcc_sub->sub->pmc_type == enum_class_NCI)
       current_call->r[0]->pcc_sub->flags |= isNCI;
   if (cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[1]->pcc_sub->calls_a_sub |= 1;
}

static void
begin_return_or_yield(Interp *interp, int yield)
{
    Instruction *i, *ins;
    char name[128];
    ins = cur_unit->instructions;
    if(!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
        IMCC_fataly(interp, E_SyntaxError,
              "yield or return directive outside pcc subroutine\n");
    if(yield)
       ins->r[1]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
    sprintf(name, yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
    interp->imc_info->sr_return = mk_pcc_sub(interp, str_dup(name), 0);
    i = iLABEL(cur_unit, interp->imc_info->sr_return);
    i->type = yield ? ITPCCSUB | ITLABEL | ITPCCYIELD : ITPCCSUB | ITLABEL ;
    interp->imc_info->asm_state = yield ? AsmInYield : AsmInReturn;
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
#line 321 "imcc/imcc.y"
typedef union {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 640 "imcc/imcparser.c"
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
#line 661 "imcc/imcparser.c"

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
#define YYFINAL  40
#define YYLAST   585

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  136
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  113
/* YYNRULES -- Number of rules. */
#define YYNRULES  313
/* YYNRULES -- Number of states. */
#define YYNSTATES  523

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   374

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   126,     2,     2,     2,   132,   133,     2,
     124,   125,   130,   129,     2,   127,     2,   131,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   135,
       2,   121,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   122,     2,   123,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   134,     2,   128,     2,     2,     2,
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
     106,   107,   108,   109,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   119,   120
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    24,    27,    29,    31,    35,    37,    40,    44,
      50,    51,    58,    59,    66,    68,    71,    75,    78,    80,
      82,    84,    86,    87,    91,    95,    96,    98,    99,   104,
     105,   107,   112,   113,   120,   122,   123,   125,   128,   130,
     132,   134,   139,   144,   145,   146,   147,   158,   159,   161,
     165,   166,   171,   172,   176,   180,   182,   184,   189,   190,
     194,   196,   198,   200,   202,   204,   206,   207,   209,   210,
     211,   212,   223,   224,   235,   236,   239,   240,   244,   246,
     248,   249,   253,   255,   257,   259,   261,   263,   265,   267,
     269,   275,   279,   283,   287,   291,   297,   303,   304,   308,
     311,   314,   317,   318,   322,   325,   326,   331,   333,   335,
     337,   339,   340,   346,   348,   349,   352,   356,   359,   362,
     363,   369,   370,   376,   377,   379,   383,   385,   388,   389,
     392,   395,   397,   399,   400,   402,   405,   407,   409,   413,
     415,   419,   421,   423,   426,   429,   430,   435,   436,   443,
     445,   446,   453,   454,   459,   462,   465,   468,   471,   474,
     477,   480,   481,   485,   488,   490,   492,   494,   495,   497,
     499,   501,   503,   505,   507,   509,   511,   513,   515,   517,
     521,   526,   531,   536,   542,   548,   554,   560,   566,   572,
     578,   584,   590,   596,   602,   608,   614,   620,   626,   632,
     638,   645,   652,   659,   667,   672,   677,   684,   692,   697,
     704,   709,   714,   719,   724,   731,   739,   743,   744,   754,
     756,   758,   762,   766,   770,   774,   778,   782,   786,   790,
     794,   798,   802,   806,   810,   815,   817,   819,   821,   825,
     829,   833,   835,   837,   838,   844,   845,   849,   851,   853,
     856,   859,   863,   865,   872,   879,   884,   889,   894,   899,
     901,   903,   905,   907,   909,   911,   913,   915,   916,   918,
     922,   924,   926,   931,   933,   935,   937,   939,   941,   943,
     945,   947,   949,   951,   952,   955,   957,   961,   962,   967,
     969,   973,   976,   979,   981,   983,   985,   987,   989,   991,
     993,   995,   997,   999
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     137,     0,    -1,   138,    -1,   139,    -1,   138,   139,    -1,
     156,    -1,   155,    -1,   143,    -1,   142,    -1,   163,    -1,
     175,    -1,   152,    -1,   107,     4,    -1,   140,    -1,     4,
      -1,     6,   141,   120,    -1,     7,    -1,     8,   110,    -1,
      65,   217,   105,    -1,    65,   217,   105,   121,   247,    -1,
      -1,    33,   144,   217,   105,   121,   247,    -1,    -1,    33,
     146,   110,   239,   121,   109,    -1,   148,    -1,   147,   148,
      -1,   205,   149,     4,    -1,   107,     4,    -1,   116,    -1,
     115,    -1,   155,    -1,   145,    -1,    -1,   150,   113,   151,
      -1,    81,   184,    98,    -1,    -1,   233,    -1,    -1,    99,
     153,   154,   100,    -1,    -1,   147,    -1,    24,   122,   241,
     123,    -1,    -1,    26,   105,   157,     4,   158,    27,    -1,
     159,    -1,    -1,   160,    -1,   159,   160,    -1,   161,    -1,
     162,    -1,     4,    -1,    28,   217,   105,     4,    -1,    29,
     105,   105,     4,    -1,    -1,    -1,    -1,    30,   164,   236,
     165,   170,     4,   166,   167,   174,    76,    -1,    -1,     4,
      -1,   167,   168,     4,    -1,    -1,     5,   169,   217,   105,
      -1,    -1,   170,    75,   185,    -1,   170,    75,   171,    -1,
     185,    -1,   171,    -1,    97,   124,   172,   125,    -1,    -1,
     172,    75,   173,    -1,   173,    -1,    53,    -1,    54,    -1,
      56,    -1,    55,    -1,   105,    -1,    -1,   202,    -1,    -1,
      -1,    -1,    81,   176,   105,   177,   170,     4,   178,   167,
     174,    76,    -1,    -1,    78,   183,     4,   180,   187,   182,
     186,   181,   189,    79,    -1,    -1,   207,     4,    -1,    -1,
      88,   240,     4,    -1,    89,    -1,    90,    -1,    -1,   184,
      75,   185,    -1,   185,    -1,   183,    -1,    92,    -1,    91,
      -1,    93,    -1,    94,    -1,    96,    -1,    95,    -1,    80,
     240,    75,   240,     4,    -1,    80,   240,     4,    -1,    86,
     240,     4,    -1,    87,   232,     4,    -1,    87,   109,     4,
      -1,    87,   232,    75,   240,     4,    -1,    87,   109,    75,
     240,     4,    -1,    -1,   187,   188,     4,    -1,    11,   240,
      -1,    13,   232,    -1,    12,   232,    -1,    -1,   189,   190,
       4,    -1,    68,   232,    -1,    -1,    32,   191,   217,   105,
      -1,    82,    -1,    84,    -1,    83,    -1,    85,    -1,    -1,
     192,     4,   195,   196,   193,    -1,   198,    -1,    -1,   196,
       4,    -1,   196,   197,     4,    -1,    69,   240,    -1,    13,
     232,    -1,    -1,    69,   124,   199,   201,   125,    -1,    -1,
      70,   124,   200,   201,   125,    -1,    -1,   240,    -1,   201,
      75,   240,    -1,   204,    -1,   202,   204,    -1,    -1,   203,
     208,    -1,   107,     4,    -1,   116,    -1,   115,    -1,    -1,
     206,    -1,   206,   207,    -1,   207,    -1,    98,    -1,   205,
     210,     4,    -1,   105,    -1,   209,    75,   105,    -1,   219,
      -1,   230,    -1,    24,   105,    -1,    25,   105,    -1,    -1,
      32,   211,   217,   209,    -1,    -1,    33,   212,   217,   105,
     121,   247,    -1,   145,    -1,    -1,    36,   213,   217,   105,
     121,   247,    -1,    -1,     5,   214,   217,   105,    -1,     5,
     246,    -1,    68,   240,    -1,    11,   240,    -1,    69,   240,
      -1,    69,   225,    -1,     9,   238,    -1,    10,   238,    -1,
      -1,    20,   215,   151,    -1,   113,   233,    -1,   225,    -1,
     179,    -1,   194,    -1,    -1,    20,    -1,    21,    -1,    22,
      -1,    23,    -1,    53,    -1,    54,    -1,    55,    -1,    56,
      -1,    57,    -1,   218,    -1,   105,    -1,   232,   121,   240,
      -1,   232,   121,   126,   240,    -1,   232,   121,   127,   240,
      -1,   232,   121,   128,   240,    -1,   232,   121,   240,   129,
     240,    -1,   232,   121,   240,   127,   240,    -1,   232,   121,
     240,   130,   240,    -1,   232,   121,   240,    71,   240,    -1,
     232,   121,   240,   131,   240,    -1,   232,   121,   240,    45,
     240,    -1,   232,   121,   240,   132,   240,    -1,   232,   121,
     240,   118,   240,    -1,   232,   121,   240,    51,   240,    -1,
     232,   121,   240,    52,   240,    -1,   232,   121,   240,    72,
     240,    -1,   232,   121,   240,    73,   240,    -1,   232,   121,
     240,    74,   240,    -1,   232,   121,   240,    58,   240,    -1,
     232,   121,   240,   133,   240,    -1,   232,   121,   240,   134,
     240,    -1,   232,   121,   240,   128,   240,    -1,   232,   121,
     240,   122,   241,   123,    -1,   232,   122,   241,   123,   121,
     240,    -1,   232,   121,    19,   218,    75,   240,    -1,   232,
     121,    19,   218,   122,   241,   123,    -1,   232,   121,    19,
     218,    -1,   232,   121,    19,   240,    -1,   232,   121,    19,
     240,    75,   240,    -1,   232,   121,    19,   240,   122,   241,
     123,    -1,   232,   121,   216,   105,    -1,   232,   121,   216,
     105,    75,   105,    -1,   232,   121,    67,   105,    -1,   232,
     121,    66,   248,    -1,    66,   248,   121,   240,    -1,    19,
     232,    75,   240,    -1,    19,   232,    75,   240,    75,   240,
      -1,    19,   232,    75,   240,   122,   241,   123,    -1,   232,
     121,   225,    -1,    -1,   220,   124,   229,   125,   121,   223,
     124,   227,   125,    -1,   221,    -1,   222,    -1,   232,    37,
     240,    -1,   232,    38,   240,    -1,   232,    39,   240,    -1,
     232,    40,   240,    -1,   232,    47,   240,    -1,   232,    46,
     240,    -1,   232,    41,   240,    -1,   232,    42,   240,    -1,
     232,    43,   240,    -1,   232,    44,   240,    -1,   232,    48,
     240,    -1,   232,    49,   240,    -1,   232,    50,   240,    -1,
     232,   121,   113,   151,    -1,   105,    -1,   109,    -1,   232,
      -1,   232,   224,   237,    -1,   232,   224,   109,    -1,   232,
     224,   232,    -1,   119,    -1,   117,    -1,    -1,   223,   226,
     124,   227,   125,    -1,    -1,   227,    75,   228,    -1,   228,
      -1,   240,    -1,    13,   232,    -1,    12,   232,    -1,   229,
      75,   232,    -1,   232,    -1,    14,   240,   231,   240,    10,
     238,    -1,    15,   240,   231,   240,    10,   238,    -1,    14,
     240,    10,   238,    -1,    15,   240,    10,   238,    -1,    14,
     240,    75,   238,    -1,    15,   240,    75,   238,    -1,    59,
      -1,    60,    -1,    61,    -1,    62,    -1,    63,    -1,    64,
      -1,   114,    -1,   246,    -1,    -1,   234,    -1,   234,    75,
     235,    -1,   235,    -1,   239,    -1,   232,   122,   241,   123,
      -1,   237,    -1,   109,    -1,   105,    -1,   113,    -1,   105,
      -1,   113,    -1,   238,    -1,   240,    -1,   232,    -1,   247,
      -1,    -1,   242,   243,    -1,   245,    -1,   243,   135,   245,
      -1,    -1,   243,    75,   244,   245,    -1,   240,    -1,   240,
      77,   240,    -1,    77,   240,    -1,   240,    77,    -1,   101,
      -1,   102,    -1,   103,    -1,   104,    -1,   106,    -1,   110,
      -1,   111,    -1,   109,    -1,   112,    -1,   103,    -1,   109,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   402,   402,   406,   408,   411,   413,   414,   415,   416,
     417,   418,   419,   420,   421,   424,   427,   428,   436,   443,
     452,   451,   457,   456,   460,   462,   465,   467,   468,   469,
     470,   471,   474,   474,   478,   485,   488,   493,   492,   503,
     505,   508,   526,   524,   540,   542,   545,   547,   550,   552,
     553,   556,   570,   588,   594,   599,   586,   604,   606,   607,
     611,   610,   615,   617,   618,   619,   620,   623,   626,   628,
     629,   632,   634,   635,   636,   637,   649,   651,   655,   657,
     663,   654,   670,   668,   700,   702,   705,   707,   710,   712,
     715,   717,   718,   721,   722,   723,   724,   725,   726,   727,
     730,   736,   738,   743,   745,   747,   751,   757,   759,   762,
     764,   767,   770,   772,   775,   778,   778,   782,   784,   787,
     789,   794,   792,   798,   803,   805,   807,   811,   813,   818,
     816,   825,   824,   833,   835,   836,   840,   842,   853,   857,
     860,   861,   862,   865,   867,   870,   872,   875,   881,   886,
     894,   902,   904,   905,   906,   907,   907,   920,   920,   922,
     923,   923,   925,   925,   928,   929,   930,   931,   932,   936,
     937,   938,   938,   941,   944,   945,   946,   947,   950,   952,
     953,   954,   957,   959,   960,   961,   962,   963,   966,   977,
     979,   980,   981,   982,   983,   984,   985,   986,   987,   988,
     989,   990,   992,   994,   996,   998,  1000,  1002,  1004,  1006,
    1008,  1010,  1012,  1014,  1016,  1018,  1020,  1022,  1024,  1027,
    1034,  1037,  1039,  1043,  1045,  1047,  1050,  1057,  1056,  1065,
    1066,  1069,  1072,  1074,  1076,  1078,  1080,  1082,  1084,  1086,
    1088,  1090,  1092,  1094,  1098,  1106,  1107,  1108,  1113,  1114,
    1115,  1118,  1119,  1124,  1122,  1132,  1134,  1135,  1138,  1141,
    1144,  1148,  1150,  1153,  1156,  1158,  1160,  1162,  1164,  1168,
    1170,  1171,  1172,  1173,  1174,  1177,  1179,  1182,  1184,  1187,
    1189,  1192,  1194,  1201,  1203,  1206,  1208,  1211,  1213,  1216,
    1218,  1221,  1223,  1226,  1226,  1230,  1232,  1234,  1234,  1238,
    1244,  1247,  1248,  1251,  1253,  1254,  1255,  1256,  1259,  1261,
    1262,  1263,  1266,  1268
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "FASTCALL", "N_OPERATORS", "CALL", "GOTO", "ARG", "FLATTEN_ARG", 
  "FLATTEN", "IF", "UNLESS", "END", "SAVEALL", "RESTOREALL", "NEW", 
  "NEWSUB", "NEWCLOSURE", "NEWCOR", "NEWCONT", "NAMESPACE", 
  "ENDNAMESPACE", "CLASS", "ENDCLASS", "FIELD", "DOT_METHOD", "SUB", 
  "SYM", "LOCAL", "CONST", "INC", "DEC", "GLOBAL_CONST", "PLUS_ASSIGN", 
  "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "CONCAT_ASSIGN", 
  "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", "FDIV_ASSIGN", 
  "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", "SHIFT_LEFT", 
  "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", "OBJECTV", 
  "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", "RELOP_LT", 
  "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT", "RETURN", "YIELDT", 
  "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "DOTDOT", 
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", 
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "NCI_CALL", 
  "METH_CALL", "INVOCANT", "PROTOTYPED", "NON_PROTOTYPED", "MAIN", "LOAD", 
  "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "MULTI", "LABEL", "EMIT", 
  "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "REG", "MACRO", 
  "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", "PARROT_OP", "VAR", 
  "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "\"\\n\"", 
  "'='", "'['", "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", 
  "'/'", "'%'", "'&'", "'|'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "pragma", "pragma_1", "global", 
  "constdef", "@1", "pmc_const", "@2", "pasmcode", "pasmline", 
  "pasm_inst", "@3", "pasm_args", "emit", "@4", "opt_pasmcode", 
  "class_namespace", "class", "@5", "class_body", "member_decls", 
  "member_decl", "field_decl", "method_decl", "sub", "@6", "@7", "@8", 
  "sub_params", "sub_param", "@9", "sub_proto", "multi", "multi_types", 
  "multi_type", "sub_body", "pcc_sub", "@10", "@11", "@12", 
  "pcc_sub_call", "@13", "opt_label", "opt_invocant", "pcc_proto", 
  "pcc_sub_proto", "proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@14", "begin_ret_or_yield", 
  "end_ret_or_yield", "pcc_ret", "@15", "pcc_returns", "pcc_return", 
  "pcc_return_many", "@16", "@17", "var_returns", "statements", 
  "helper_clear_state", "statement", "labels", "_labels", "label", 
  "instruction", "id_list", "labeled_inst", "@18", "@19", "@20", "@21", 
  "@22", "newsub", "type", "classname", "assignment", "@23", "op_assign", 
  "func_assign", "the_sub", "ptr", "sub_call", "@24", "arglist", "arg", 
  "targetlist", "if_statement", "relop", "target", "vars", "_vars", 
  "_var_or_i", "sub_label_op_c", "sub_label_op", "label_op", "var_or_i", 
  "var", "keylist", "@25", "_keylist", "@26", "key", "reg", "const", 
  "string", 0
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
     364,   365,   366,   367,   368,   369,   370,   371,   372,   373,
     374,    61,    91,    93,    40,    41,    33,    45,   126,    43,
      42,    47,    37,    38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   136,   137,   138,   138,   139,   139,   139,   139,   139,
     139,   139,   139,   139,   139,   140,   141,   141,   142,   142,
     144,   143,   146,   145,   147,   147,   148,   148,   148,   148,
     148,   148,   150,   149,   149,   149,   151,   153,   152,   154,
     154,   155,   157,   156,   158,   158,   159,   159,   160,   160,
     160,   161,   162,   164,   165,   166,   163,   167,   167,   167,
     169,   168,   170,   170,   170,   170,   170,   171,   172,   172,
     172,   173,   173,   173,   173,   173,   174,   174,   176,   177,
     178,   175,   180,   179,   181,   181,   182,   182,   183,   183,
     184,   184,   184,   185,   185,   185,   185,   185,   185,   185,
     186,   186,   186,   186,   186,   186,   186,   187,   187,   188,
     188,   188,   189,   189,   190,   191,   190,   192,   192,   193,
     193,   195,   194,   194,   196,   196,   196,   197,   197,   199,
     198,   200,   198,   201,   201,   201,   202,   202,   203,   204,
     204,   204,   204,   205,   205,   206,   206,   207,   208,   209,
     209,   210,   210,   210,   210,   211,   210,   212,   210,   210,
     213,   210,   214,   210,   210,   210,   210,   210,   210,   210,
     210,   215,   210,   210,   210,   210,   210,   210,   216,   216,
     216,   216,   217,   217,   217,   217,   217,   217,   218,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   219,   219,   219,
     219,   219,   219,   219,   219,   219,   219,   220,   219,   219,
     219,   221,   221,   221,   221,   221,   221,   221,   221,   221,
     221,   221,   221,   221,   222,   223,   223,   223,   223,   223,
     223,   224,   224,   226,   225,   227,   227,   227,   228,   228,
     228,   229,   229,   230,   230,   230,   230,   230,   230,   231,
     231,   231,   231,   231,   231,   232,   232,   233,   233,   234,
     234,   235,   235,   236,   236,   237,   237,   238,   238,   239,
     239,   240,   240,   242,   241,   243,   243,   244,   243,   245,
     245,   245,   245,   246,   246,   246,   246,   246,   247,   247,
     247,   247,   248,   248
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     1,     3,     1,     2,     3,     5,
       0,     6,     0,     6,     1,     2,     3,     2,     1,     1,
       1,     1,     0,     3,     3,     0,     1,     0,     4,     0,
       1,     4,     0,     6,     1,     0,     1,     2,     1,     1,
       1,     4,     4,     0,     0,     0,    10,     0,     1,     3,
       0,     4,     0,     3,     3,     1,     1,     4,     0,     3,
       1,     1,     1,     1,     1,     1,     0,     1,     0,     0,
       0,    10,     0,    10,     0,     2,     0,     3,     1,     1,
       0,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       5,     3,     3,     3,     3,     5,     5,     0,     3,     2,
       2,     2,     0,     3,     2,     0,     4,     1,     1,     1,
       1,     0,     5,     1,     0,     2,     3,     2,     2,     0,
       5,     0,     5,     0,     1,     3,     1,     2,     0,     2,
       2,     1,     1,     0,     1,     2,     1,     1,     3,     1,
       3,     1,     1,     2,     2,     0,     4,     0,     6,     1,
       0,     6,     0,     4,     2,     2,     2,     2,     2,     2,
       2,     0,     3,     2,     1,     1,     1,     0,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       4,     4,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       6,     6,     6,     7,     4,     4,     6,     7,     4,     6,
       4,     4,     4,     4,     6,     7,     3,     0,     9,     1,
       1,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     4,     1,     1,     1,     3,     3,
       3,     1,     1,     0,     5,     0,     3,     1,     1,     2,
       2,     3,     1,     6,     6,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     2,     1,     3,     0,     4,     1,
       3,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    14,     0,     0,     0,    53,    20,     0,    78,    37,
       0,     0,     2,     3,    13,     8,     7,    11,     6,     5,
       9,    10,    16,     0,     0,   293,    42,     0,     0,   182,
     183,   184,   185,   186,   188,     0,   187,     0,   143,    12,
       1,     4,    17,    15,     0,     0,     0,   285,   284,   286,
      54,   283,     0,    18,    79,    22,   147,     0,    29,    28,
      31,   143,    24,     0,    30,    32,   144,   146,    41,     0,
     303,   304,   305,   306,   307,   310,   308,   309,   311,   275,
     291,   299,   294,   295,   276,   292,    45,    62,     0,     0,
      62,     0,    27,    25,    38,    90,     0,     0,   145,   301,
     302,   297,     0,    50,     0,     0,     0,    44,    46,    48,
      49,    88,    89,    95,    94,    96,    97,    99,    98,     0,
       0,    66,    93,    65,     0,    19,     0,     0,     0,    92,
      26,   277,   300,     0,   296,     0,     0,    43,    47,    68,
      55,     0,    21,    80,   287,   288,   289,     0,   290,     0,
      34,    33,   291,    36,   278,   280,   281,   298,     0,     0,
      71,    72,    74,    73,    75,     0,    70,    57,    64,    63,
      57,     0,    91,   293,     0,    51,    52,     0,    67,    58,
     138,   138,    23,     0,   279,    69,    60,     0,   142,   141,
       0,     0,   138,   143,   136,     0,   282,     0,   140,    59,
      56,   137,   177,   139,    81,     0,   162,     0,     0,     0,
       0,     0,     0,   171,     0,     0,   155,   157,   160,     0,
       0,     0,     0,     0,   117,   118,   245,   246,   277,   159,
     175,     0,   176,   123,     0,   151,     0,   229,   230,   253,
     174,   152,   247,    61,     0,   164,   169,   170,   166,     0,
       0,     0,   277,   153,   154,     0,     0,     0,   312,   313,
       0,   165,   310,   129,   168,   291,   167,   131,     0,   173,
     121,   148,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   252,   251,     0,
     293,     0,     0,     0,   269,   270,   271,   272,   273,   274,
       0,     0,     0,     0,     0,     0,   172,     0,     0,     0,
       0,   133,   133,    82,   124,     0,   262,   255,   231,   232,
     233,   234,   237,   238,   239,   240,   236,   235,   241,   242,
     243,     0,   178,   179,   180,   181,     0,     0,   277,     0,
       0,     0,     0,   226,   189,     0,   249,   250,   248,   163,
     265,   267,     0,   266,   268,     0,   223,   149,   156,     0,
       0,   222,     0,   134,     0,   107,     0,     0,     0,     0,
       0,     0,   257,   258,   214,   215,   221,   220,   244,   190,
     191,   192,   218,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   293,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   293,     0,     0,     0,     0,
     130,   132,    86,   125,     0,     0,   119,   120,   122,     0,
     261,     0,   260,   259,     0,   254,     0,   293,     0,   293,
       0,   198,   201,   202,   206,   196,   203,   204,   205,   200,
       0,   194,   209,   193,   195,   197,   199,   207,   208,     0,
     263,   264,   224,     0,   150,   158,   161,   135,     0,     0,
       0,     0,     0,     0,   128,   127,   126,     0,   247,   256,
     212,     0,   216,     0,   219,   210,   211,   225,   109,   111,
     110,     0,     0,     0,     0,    84,   108,   255,   213,   217,
      87,     0,     0,     0,     0,   112,     0,     0,   101,     0,
     102,   104,     0,   103,     0,     0,    85,   228,     0,     0,
       0,   115,     0,    83,     0,   100,   106,   105,     0,   114,
     113,     0,   116
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    11,    12,    13,    14,    24,    15,    16,    28,    60,
      91,    61,    62,    96,    97,   151,    17,    38,    63,    18,
      19,    46,   106,   107,   108,   109,   110,    20,    27,    87,
     167,   180,   190,   197,   120,   121,   165,   166,   191,    21,
      37,    90,   170,   230,   365,   495,   462,   122,   128,   123,
     485,   412,   463,   505,   514,   518,   231,   418,   232,   314,
     366,   419,   233,   311,   312,   362,   192,   193,   194,    65,
      66,    67,   203,   358,   234,   255,   256,   257,   244,   252,
     342,    35,    36,   235,   236,   237,   238,   239,   291,   240,
     273,   371,   372,   315,   241,   301,    80,   153,   154,   155,
      50,    51,   146,   156,   148,    44,    45,    82,   133,    83,
      84,    85,   260
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -249
static const short yypact[] =
{
       5,  -249,    34,   -76,   -51,  -249,  -249,    95,  -249,  -249,
      62,    71,     5,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,   -30,   -12,  -249,  -249,    49,    95,  -249,
    -249,  -249,  -249,  -249,  -249,    17,  -249,    19,     0,  -249,
    -249,  -249,  -249,  -249,    14,   284,   122,  -249,  -249,  -249,
    -249,  -249,    39,    24,  -249,  -249,  -249,   142,  -249,  -249,
    -249,   165,  -249,    59,  -249,     4,    63,  -249,  -249,   224,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,    86,   -57,  -249,  -249,  -249,    99,   480,    47,   263,
     480,    69,  -249,  -249,  -249,   489,   177,    75,  -249,  -249,
     224,  -249,   284,  -249,    95,    89,   169,    99,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,    83,
       6,  -249,  -249,  -249,   263,  -249,     8,   298,   -55,  -249,
    -249,   298,  -249,   284,  -249,   117,   118,  -249,  -249,   150,
    -249,   480,  -249,  -249,  -249,  -249,  -249,   105,  -249,   489,
    -249,  -249,   102,  -249,   173,  -249,  -249,  -249,   247,   250,
    -249,  -249,  -249,  -249,  -249,   -53,  -249,   252,  -249,  -249,
     252,   135,  -249,  -249,   298,  -249,  -249,   150,  -249,  -249,
      -2,    -2,  -249,   141,  -249,  -249,  -249,   265,  -249,  -249,
     266,   195,   167,    63,  -249,   200,  -249,    95,  -249,  -249,
    -249,  -249,   417,  -249,  -249,   174,   378,   -77,   -77,   224,
     224,   224,   275,  -249,   180,   184,  -249,   181,  -249,   144,
     224,   207,   170,   -26,  -249,  -249,  -249,  -249,   298,  -249,
    -249,   294,  -249,  -249,   301,  -249,   182,  -249,  -249,  -249,
    -249,  -249,   171,  -249,    95,  -249,  -249,  -249,  -249,   111,
     240,   232,   298,  -249,  -249,    95,    95,    95,  -249,  -249,
     193,  -249,   196,  -249,  -249,   -62,  -249,  -249,   328,  -249,
    -249,  -249,   275,   213,   224,   224,   224,   224,   224,   224,
     224,   224,   224,   224,   224,   224,   224,  -249,  -249,    29,
    -249,   431,   243,   -77,  -249,  -249,  -249,  -249,  -249,  -249,
     -77,   224,   -77,   -77,   224,   224,  -249,   253,   254,   257,
     224,   224,   224,  -249,  -249,   -52,  -249,    81,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,   401,  -249,  -249,  -249,  -249,   144,   258,   298,   224,
     224,   224,   259,  -249,   420,   234,  -249,  -249,  -249,  -249,
    -249,  -249,   356,  -249,  -249,   359,   -43,  -249,   295,   262,
     270,  -249,   -48,  -249,   -14,  -249,    40,   275,   276,   275,
     275,    -7,  -249,  -249,   -16,   103,  -249,  -249,  -249,  -249,
    -249,  -249,   331,   224,   224,   224,   224,   224,   224,   224,
     224,   224,  -249,   224,   224,   224,   224,   224,   224,   224,
     224,   292,   -77,   -77,   224,  -249,   310,   263,   263,   224,
    -249,  -249,     3,  -249,   275,   224,  -249,  -249,  -249,   412,
    -249,   454,  -249,  -249,    81,  -249,   224,  -249,   224,  -249,
     313,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
     296,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,   224,
    -249,  -249,  -249,   300,  -249,  -249,  -249,  -249,   224,   275,
     275,   224,   172,   421,  -249,  -249,  -249,   305,   -72,  -249,
    -249,   307,  -249,   311,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,   429,   224,   224,   360,    63,  -249,    81,  -249,  -249,
    -249,     9,   436,    13,    22,  -249,   440,    -6,  -249,   224,
    -249,  -249,   224,  -249,   224,    85,  -249,  -249,   441,   442,
     443,  -249,   275,  -249,   444,  -249,  -249,  -249,    95,  -249,
    -249,   319,  -249
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -249,  -249,  -249,   423,  -249,  -249,  -249,  -249,  -249,   249,
    -249,  -249,   391,  -249,  -249,  -248,  -249,  -249,  -249,    -1,
    -249,  -249,  -249,  -249,   347,  -249,  -249,  -249,  -249,  -249,
    -249,   286,  -249,  -249,   367,   318,  -249,   290,   287,  -249,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,   273,  -249,   -74,
    -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,  -249,  -249,  -249,  -249,   158,  -249,  -249,   281,   282,
    -249,   -64,  -249,  -249,  -249,  -249,  -249,  -249,  -249,  -249,
    -249,   -28,   145,  -249,  -249,  -249,  -249,    56,  -249,  -202,
    -249,     1,    65,  -249,  -249,   248,   -92,   269,  -249,   326,
    -249,   217,  -201,   382,   -44,  -143,  -249,  -249,  -249,   -68,
     308,   -84,   188
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -248
static const short yytable[] =
{
      52,    81,    98,   186,   306,   125,   246,   247,   -35,     1,
     140,     2,   143,   498,   458,   459,   460,   501,   101,   264,
     149,   129,   177,   367,     3,    99,   503,   409,   144,     3,
     183,     4,   404,    55,   134,     5,   145,    64,     6,   152,
     142,    22,    23,   150,   413,   287,    25,   288,   331,   332,
     333,   334,   335,   414,    26,   287,   132,   288,    81,   426,
      64,   409,  -247,   111,   112,   157,    39,   169,   424,   424,
       7,    40,   178,   368,   -76,   172,   135,   410,   102,   405,
      42,   141,   152,   141,   499,    95,     8,   343,   502,    81,
     378,   461,   350,   369,   370,   336,   337,   504,    56,   351,
     -39,   353,   354,   103,     9,   187,   427,    57,    43,   415,
     242,   411,    10,   188,   189,    58,    59,   511,   425,   507,
     251,   293,    53,   416,    54,   417,    86,   104,   105,   265,
      70,    71,    72,    73,   226,    74,   152,    68,   262,    76,
      77,    78,   338,    79,    88,    89,    92,   345,    29,    30,
      31,    32,    33,   512,    47,   339,   340,   341,    48,    94,
     152,    56,    49,   100,   513,   248,   249,   250,   124,   205,
     294,   295,   296,   297,   298,   299,   261,   266,   428,   127,
     316,   130,    70,    71,    72,    73,   300,    74,   131,     3,
      75,    76,    77,    78,   136,    79,   137,   265,    55,   347,
      34,   450,   451,   160,   161,   162,   163,   139,   274,   275,
     276,   277,   278,   279,   280,   281,   292,   282,   283,   284,
     285,   286,   158,   159,   173,   429,   171,   307,   308,   309,
     318,   319,   320,   321,   322,   323,   324,   325,   326,   327,
     328,   329,   330,   -77,   182,   344,   152,   258,   174,   440,
     302,   175,   482,   259,   176,   164,   179,   352,   483,   484,
     355,   356,   453,    56,   196,   -40,   361,   363,   363,   198,
     199,   200,    57,   373,   187,   420,   204,   422,   423,   243,
      58,    59,   188,   189,   471,   253,   473,   375,   287,   254,
     288,   -22,   289,   290,   267,   379,   380,   381,   270,   294,
     295,   296,   297,   298,   299,   271,   272,   305,    70,    71,
      72,    73,   226,    74,   310,   303,   262,    76,    77,    78,
    -246,    79,   464,   455,   456,    70,    71,    72,    73,   468,
      74,   263,   313,    75,    76,    77,    78,   317,    79,   431,
     432,   433,   434,   435,   436,   437,   438,   439,   349,   441,
     442,   443,   444,   445,   446,   447,   448,   401,   357,   359,
     452,    69,   360,   377,   382,   457,   402,   479,   480,   403,
     406,   465,    75,    76,    77,    78,    70,    71,    72,    73,
     373,    74,   470,   407,   472,    70,    71,    72,    73,    79,
      74,   408,   494,    75,    76,    77,    78,   421,    79,    70,
      71,    72,    73,   144,    74,   476,   430,    75,    76,    77,
      78,   145,    79,   449,   478,   454,   466,   481,   474,   475,
     519,   496,   206,   477,   522,   486,   207,   208,   209,   487,
     488,   210,   211,   490,   489,    41,   212,   213,   491,   492,
     500,   214,   215,   373,   506,   515,   516,   517,   520,   216,
     217,   229,    93,   218,   138,   508,   181,   126,   509,   168,
     510,    70,    71,    72,    73,   383,    74,   185,   195,   493,
     364,   384,   385,   201,    79,   202,   374,   467,   386,    70,
      71,    72,    73,   219,    74,   220,   221,   222,   497,   469,
     521,   387,   388,   389,   390,   223,   268,   269,   304,   224,
     184,   225,    70,    71,    72,    73,    34,    74,   348,   147,
      75,    76,    77,    78,   245,    79,     0,     0,    70,    71,
      72,    73,   226,    74,   376,     0,   227,     0,     0,     0,
     228,    79,    70,    71,    72,    73,    47,    74,   391,     0,
     346,  -227,   392,     0,    49,    79,     0,   393,   394,   395,
     396,   397,   398,   399,   400,    70,    71,    72,    73,   226,
      74,     0,     0,   227,     0,     0,     0,     0,    79,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   111,   112,
     113,   114,   115,   116,   117,   118
};

static const short yycheck[] =
{
      28,    45,    66,     5,   252,    89,   207,   208,     4,     4,
       4,     6,     4,     4,    11,    12,    13,     4,    75,   221,
      75,    95,    75,    75,    24,    69,     4,    75,   105,    24,
     173,    26,    75,    33,   102,    30,   113,    38,    33,   131,
     124,     7,     8,    98,     4,   117,   122,   119,    19,    20,
      21,    22,    23,    13,   105,   117,   100,   119,   102,    75,
      61,    75,   124,    89,    90,   133,     4,   141,    75,    75,
      65,     0,   125,   125,    76,   149,   104,   125,   135,   122,
     110,    75,   174,    75,    75,    81,    81,   289,    75,   133,
     338,    88,   293,    12,    13,    66,    67,    75,    98,   300,
     100,   302,   303,     4,    99,   107,   122,   107,   120,    69,
     202,   125,   107,   115,   116,   115,   116,    32,   125,   125,
     212,    10,   105,    83,   105,    85,     4,    28,    29,   221,
     101,   102,   103,   104,   105,   106,   228,   123,   109,   110,
     111,   112,   113,   114,   105,   121,     4,   290,    53,    54,
      55,    56,    57,    68,   105,   126,   127,   128,   109,   100,
     252,    98,   113,    77,    79,   209,   210,   211,   121,   197,
      59,    60,    61,    62,    63,    64,   220,   221,    75,   110,
     272,     4,   101,   102,   103,   104,    75,   106,   113,    24,
     109,   110,   111,   112,   105,   114,    27,   289,    33,   291,
     105,   402,   403,    53,    54,    55,    56,   124,    37,    38,
      39,    40,    41,    42,    43,    44,   244,    46,    47,    48,
      49,    50,   105,   105,   122,   122,   121,   255,   256,   257,
     274,   275,   276,   277,   278,   279,   280,   281,   282,   283,
     284,   285,   286,    76,   109,   289,   338,   103,    75,   392,
      10,     4,    80,   109,     4,   105,     4,   301,    86,    87,
     304,   305,   405,    98,   123,   100,   310,   311,   312,     4,
       4,    76,   107,   317,   107,   367,    76,   369,   370,   105,
     115,   116,   115,   116,   427,   105,   429,   331,   117,   105,
     119,   110,   121,   122,   124,   339,   340,   341,     4,    59,
      60,    61,    62,    63,    64,     4,   124,    75,   101,   102,
     103,   104,   105,   106,   121,    75,   109,   110,   111,   112,
     124,   114,   414,   407,   408,   101,   102,   103,   104,   421,
     106,   124,     4,   109,   110,   111,   112,   124,   114,   383,
     384,   385,   386,   387,   388,   389,   390,   391,   105,   393,
     394,   395,   396,   397,   398,   399,   400,   123,   105,   105,
     404,    77,   105,   105,   105,   409,    10,   459,   460,    10,
      75,   415,   109,   110,   111,   112,   101,   102,   103,   104,
     424,   106,   426,   121,   428,   101,   102,   103,   104,   114,
     106,   121,   484,   109,   110,   111,   112,   121,   114,   101,
     102,   103,   104,   105,   106,   449,    75,   109,   110,   111,
     112,   113,   114,   121,   458,   105,     4,   461,   105,   123,
     512,   485,     5,   123,   105,     4,     9,    10,    11,   124,
     123,    14,    15,     4,   123,    12,    19,    20,   482,   483,
       4,    24,    25,   487,     4,     4,     4,     4,     4,    32,
      33,   202,    61,    36,   107,   499,   170,    90,   502,   141,
     504,   101,   102,   103,   104,    45,   106,   177,   181,   109,
     312,    51,    52,   192,   114,   193,   331,   421,    58,   101,
     102,   103,   104,    66,   106,    68,    69,    70,   487,   424,
     518,    71,    72,    73,    74,    78,   223,   228,   250,    82,
     174,    84,   101,   102,   103,   104,   105,   106,   291,   127,
     109,   110,   111,   112,   206,   114,    -1,    -1,   101,   102,
     103,   104,   105,   106,   336,    -1,   109,    -1,    -1,    -1,
     113,   114,   101,   102,   103,   104,   105,   106,   118,    -1,
     109,   124,   122,    -1,   113,   114,    -1,   127,   128,   129,
     130,   131,   132,   133,   134,   101,   102,   103,   104,   105,
     106,    -1,    -1,   109,    -1,    -1,    -1,    -1,   114,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    89,    90,
      91,    92,    93,    94,    95,    96
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,    24,    26,    30,    33,    65,    81,    99,
     107,   137,   138,   139,   140,   142,   143,   152,   155,   156,
     163,   175,     7,     8,   141,   122,   105,   164,   144,    53,
      54,    55,    56,    57,   105,   217,   218,   176,   153,     4,
       0,   139,   110,   120,   241,   242,   157,   105,   109,   113,
     236,   237,   217,   105,   105,    33,    98,   107,   115,   116,
     145,   147,   148,   154,   155,   205,   206,   207,   123,    77,
     101,   102,   103,   104,   106,   109,   110,   111,   112,   114,
     232,   240,   243,   245,   246,   247,     4,   165,   105,   121,
     177,   146,     4,   148,   100,    81,   149,   150,   207,   240,
      77,    75,   135,     4,    28,    29,   158,   159,   160,   161,
     162,    89,    90,    91,    92,    93,    94,    95,    96,    97,
     170,   171,   183,   185,   121,   247,   170,   110,   184,   185,
       4,   113,   240,   244,   245,   217,   105,    27,   160,   124,
       4,    75,   247,     4,   105,   113,   238,   239,   240,    75,
      98,   151,   232,   233,   234,   235,   239,   245,   105,   105,
      53,    54,    55,    56,   105,   172,   173,   166,   171,   185,
     178,   121,   185,   122,    75,     4,     4,    75,   125,     4,
     167,   167,   109,   241,   235,   173,     5,   107,   115,   116,
     168,   174,   202,   203,   204,   174,   123,   169,     4,     4,
      76,   204,   205,   208,    76,   217,     5,     9,    10,    11,
      14,    15,    19,    20,    24,    25,    32,    33,    36,    66,
      68,    69,    70,    78,    82,    84,   105,   109,   113,   145,
     179,   192,   194,   198,   210,   219,   220,   221,   222,   223,
     225,   230,   232,   105,   214,   246,   238,   238,   240,   240,
     240,   232,   215,   105,   105,   211,   212,   213,   103,   109,
     248,   240,   109,   124,   225,   232,   240,   124,   183,   233,
       4,     4,   124,   226,    37,    38,    39,    40,    41,    42,
      43,    44,    46,    47,    48,    49,    50,   117,   119,   121,
     122,   224,   217,    10,    59,    60,    61,    62,    63,    64,
      75,   231,    10,    75,   231,    75,   151,   217,   217,   217,
     121,   199,   200,     4,   195,   229,   232,   124,   240,   240,
     240,   240,   240,   240,   240,   240,   240,   240,   240,   240,
     240,    19,    20,    21,    22,    23,    66,    67,   113,   126,
     127,   128,   216,   225,   240,   241,   109,   232,   237,   105,
     238,   238,   240,   238,   238,   240,   240,   105,   209,   105,
     105,   240,   201,   240,   201,   180,   196,    75,   125,    12,
      13,   227,   228,   240,   218,   240,   248,   105,   151,   240,
     240,   240,   105,    45,    51,    52,    58,    71,    72,    73,
      74,   118,   122,   127,   128,   129,   130,   131,   132,   133,
     134,   123,    10,    10,    75,   122,    75,   121,   121,    75,
     125,   125,   187,     4,    13,    69,    83,    85,   193,   197,
     232,   121,   232,   232,    75,   125,    75,   122,    75,   122,
      75,   240,   240,   240,   240,   240,   240,   240,   240,   240,
     241,   240,   240,   240,   240,   240,   240,   240,   240,   121,
     238,   238,   240,   241,   105,   247,   247,   240,    11,    12,
      13,    88,   182,   188,   232,   240,     4,   223,   232,   228,
     240,   241,   240,   241,   105,   123,   240,   123,   240,   232,
     232,   240,    80,    86,    87,   186,     4,   124,   123,   123,
       4,   240,   240,   109,   232,   181,   207,   227,     4,    75,
       4,     4,    75,     4,    75,   189,     4,   125,   240,   240,
     240,    32,    68,    79,   190,     4,     4,     4,   191,   232,
       4,   217,   105
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
#line 403 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 412 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; cur_unit = 0; }
    break;

  case 6:
#line 413 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 414 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 415 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 9:
#line 416 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 417 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 418 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 12:
#line 419 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 420 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 421 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 424 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 427 "imcc/imcc.y"
    { IMCC_INFO(interp)->state->pragmas |= PR_FASTCALL; }
    break;

  case 17:
#line 429 "imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 18:
#line 438 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 19:
#line 444 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 20:
#line 452 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 21:
#line 453 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 22:
#line 457 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 458 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 26:
#line 466 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 27:
#line 467 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 28:
#line 468 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 469 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 470 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 32:
#line 474 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 33:
#line 476 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 34:
#line 479 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(interp, str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 35:
#line 485 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 37:
#line 493 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 38:
#line 495 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 41:
#line 510 "imcc/imcc.y"
    {
                    int re_open = 0;
                    yyval.i=0;
                    if (IMCC_INFO(interp)->state->pasm_file && cur_namespace) {
                        imc_close_unit(interp, cur_unit);
                        re_open = 1;
                    }
                    IMCC_INFO(interp)->cur_namespace = yyvsp[-1].sr;
                    cur_namespace = yyvsp[-1].sr;
                    if (re_open)
                        cur_unit = imc_open_unit(interp, IMC_PASM);
                }
    break;

  case 42:
#line 526 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 43:
#line 533 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 45:
#line 542 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 50:
#line 553 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 51:
#line 558 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[-1].s);
                      if(lookup_field_symbol(current_class, yyvsp[-1].s)) {
                        IMCC_fataly(interp, E_SyntaxError,
                            "field '%s' previously declared in class '%s'\n",
                            yyvsp[-1].s, current_class->sym->name);
                      }
                      sym->type = yyvsp[-2].t;
                      store_field_symbol(current_class, sym);
                      yyval.i = 0; }
    break;

  case 52:
#line 572 "imcc/imcc.y"
    {
           Method * meth;
           Symbol * sym = new_symbol(yyvsp[-2].s);
           if(lookup_method_symbol(current_class, yyvsp[-2].s)) {
                IMCC_fataly(interp, E_SyntaxError,
                 "method '%s' previously declared in class '%s'\n",
                    yyvsp[-2].s, current_class->sym->name);
           }
           meth = new_method(sym, new_symbol(yyvsp[-1].s));
           store_method_symbol(current_class, sym);
           yyval.i = 0;
        }
    break;

  case 53:
#line 588 "imcc/imcc.y"
    {
           cur_unit = (IMCC_INFO(interp)->state->pragmas & PR_FASTCALL ?
                  imc_open_unit(interp, IMC_FASTSUB)
                : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 54:
#line 594 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[0].sr);
          i->r[1] = cur_call = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
          add_namespace(interp, cur_unit);
        }
    break;

  case 55:
#line 599 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 56:
#line 601 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 57:
#line 605 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 58:
#line 606 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 59:
#line 607 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 60:
#line 611 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 61:
#line 612 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 62:
#line 616 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 63:
#line 617 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 64:
#line 618 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t; }
    break;

  case 65:
#line 619 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 66:
#line 620 "imcc/imcc.y"
    { yyval.t = P_NONE; }
    break;

  case 67:
#line 623 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 68:
#line 627 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 69:
#line 628 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 70:
#line 629 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 71:
#line 633 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 72:
#line 634 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 73:
#line 635 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 74:
#line 636 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 75:
#line 637 "imcc/imcc.y"
    {
                          SymReg *r;
                          if (strcmp(yyvsp[0].s, "_"))
                              r = mk_const(interp, yyvsp[0].s, 'S');
                          else {
                              free(yyvsp[0].s),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           yyval.sr = r;
                       }
    break;

  case 78:
#line 655 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 79:
#line 657 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
            i->r[1] = cur_call = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
            add_namespace(interp, cur_unit);

         }
    break;

  case 80:
#line 663 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 81:
#line 665 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 82:
#line 670 "imcc/imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(interp, str_dup(name), 0);
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

  case 83:
#line 697 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 84:
#line 701 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 85:
#line 702 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 86:
#line 706 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 87:
#line 708 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 88:
#line 711 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 89:
#line 712 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 90:
#line 716 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 91:
#line 717 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 92:
#line 718 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 94:
#line 722 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 95:
#line 723 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 96:
#line 724 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 97:
#line 725 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 98:
#line 726 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 99:
#line 727 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 100:
#line 732 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 101:
#line 737 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 102:
#line 739 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->flags |= isNCI;
         }
    break;

  case 103:
#line 744 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 104:
#line 746 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 105:
#line 748 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 106:
#line 752 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 107:
#line 758 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 108:
#line 759 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 109:
#line 763 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 110:
#line 764 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 111:
#line 767 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 112:
#line 771 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 113:
#line 772 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 114:
#line 777 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 115:
#line 778 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 116:
#line 779 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 117:
#line 783 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 118:
#line 784 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 121:
#line 794 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 122:
#line 797 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 123:
#line 798 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 124:
#line 804 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 125:
#line 806 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 126:
#line 808 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 127:
#line 812 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 128:
#line 813 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 129:
#line 818 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 130:
#line 823 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 131:
#line 825 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 132:
#line 830 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 133:
#line 834 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 134:
#line 835 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 135:
#line 836 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 138:
#line 854 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 139:
#line 859 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 140:
#line 860 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 141:
#line 861 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 142:
#line 862 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 143:
#line 866 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 147:
#line 876 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 148:
#line 883 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 149:
#line 887 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 150:
#line 895 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 153:
#line 905 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 154:
#line 906 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 155:
#line 907 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 156:
#line 908 "imcc/imcc.y"
    {
        IdList* l = yyvsp[0].idlist;
         while(l) {
             IdList* l1;
             mk_ident(interp, l->id, yyvsp[-1].t);
             l1 = l;
             l = l->next;
             free(l1);
     }
    is_def=0; yyval.i=0;

   }
    break;

  case 157:
#line 920 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 158:
#line 921 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 160:
#line 923 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 161:
#line 924 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 162:
#line 925 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 163:
#line 926 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
                                1, mk_ident(interp, yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 164:
#line 928 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 165:
#line 929 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 166:
#line 930 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 167:
#line 931 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 168:
#line 932 "imcc/imcc.y"
    { yyval.i = NULL;
                           current_call->r[0]->pcc_sub->flags |= isTAIL_CALL;
                           current_call = NULL;
                        }
    break;

  case 169:
#line 936 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 170:
#line 937 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 171:
#line 938 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 172:
#line 940 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 173:
#line 942 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 174:
#line 944 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 175:
#line 945 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 177:
#line 947 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 178:
#line 951 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 179:
#line 952 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 180:
#line 953 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 181:
#line 954 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 182:
#line 958 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 183:
#line 959 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 184:
#line 960 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 185:
#line 961 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 186:
#line 962 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 187:
#line 963 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 188:
#line 968 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 189:
#line 978 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 190:
#line 979 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 191:
#line 980 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 192:
#line 981 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 193:
#line 982 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 194:
#line 983 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 195:
#line 984 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 985 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 986 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 987 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 988 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 989 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 201:
#line 991 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 993 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 995 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 997 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 999 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1001 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 1003 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1005 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1007 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1009 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 211:
#line 1011 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1013 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 213:
#line 1015 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 214:
#line 1017 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 215:
#line 1019 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 216:
#line 1021 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 217:
#line 1023 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 218:
#line 1025 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                  mk_sub_address(interp, yyvsp[0].s), NULL, 1); }
    break;

  case 219:
#line 1028 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(interp, yyvsp[-2].s),
                                           mk_sub_address(interp, yyvsp[0].s), 1); }
    break;

  case 220:
#line 1035 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 221:
#line 1038 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 222:
#line 1040 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 223:
#line 1044 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 224:
#line 1046 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 225:
#line 1048 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 226:
#line 1051 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 227:
#line 1057 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 228:
#line 1061 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 231:
#line 1071 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 232:
#line 1073 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 233:
#line 1075 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 234:
#line 1077 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 235:
#line 1079 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1081 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 237:
#line 1083 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 238:
#line 1085 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 239:
#line 1087 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 240:
#line 1089 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 241:
#line 1091 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1093 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1095 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1100 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 245:
#line 1106 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 246:
#line 1107 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 247:
#line 1108 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 248:
#line 1113 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 249:
#line 1114 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 250:
#line 1115 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 251:
#line 1118 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 252:
#line 1119 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 253:
#line 1124 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 254:
#line 1129 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 255:
#line 1133 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 256:
#line 1134 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 257:
#line 1135 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 258:
#line 1140 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 259:
#line 1141 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 260:
#line 1145 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 261:
#line 1149 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 262:
#line 1150 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 263:
#line 1155 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 264:
#line 1157 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 265:
#line 1159 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 266:
#line 1161 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 267:
#line 1163 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 268:
#line 1165 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 269:
#line 1169 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 270:
#line 1170 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 271:
#line 1171 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 272:
#line 1172 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 273:
#line 1173 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 274:
#line 1174 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 277:
#line 1183 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 278:
#line 1184 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 279:
#line 1188 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 281:
#line 1193 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 282:
#line 1195 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 284:
#line 1203 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 285:
#line 1207 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 286:
#line 1208 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 287:
#line 1212 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 288:
#line 1213 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 293:
#line 1226 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 294:
#line 1227 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 295:
#line 1231 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 296:
#line 1233 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 297:
#line 1234 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 298:
#line 1235 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 299:
#line 1239 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 300:
#line 1245 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 301:
#line 1247 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 302:
#line 1248 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 303:
#line 1252 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 304:
#line 1253 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 305:
#line 1254 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 306:
#line 1255 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 307:
#line 1256 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 308:
#line 1260 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 309:
#line 1261 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 310:
#line 1262 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 311:
#line 1263 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 312:
#line 1267 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 313:
#line 1268 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3613 "imcc/imcparser.c"

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


#line 1273 "imcc/imcc.y"



int yyerror(char * s)
{
    /* XXX */
    IMCC_fataly(NULL, E_SyntaxError, s);
    /* fprintf(stderr, "last token = [%s]\n", yylval.s); */
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

