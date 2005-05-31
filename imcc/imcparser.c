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
     HLL = 263,
     CALL = 264,
     GOTO = 265,
     ARG = 266,
     FLATTEN_ARG = 267,
     FLATTEN = 268,
     IF = 269,
     UNLESS = 270,
     END = 271,
     SAVEALL = 272,
     RESTOREALL = 273,
     NEW = 274,
     NEWSUB = 275,
     NEWCLOSURE = 276,
     NEWCOR = 277,
     NEWCONT = 278,
     NAMESPACE = 279,
     ENDNAMESPACE = 280,
     CLASS = 281,
     ENDCLASS = 282,
     FIELD = 283,
     DOT_METHOD = 284,
     SUB = 285,
     SYM = 286,
     LOCAL = 287,
     CONST = 288,
     INC = 289,
     DEC = 290,
     GLOBAL_CONST = 291,
     PLUS_ASSIGN = 292,
     MINUS_ASSIGN = 293,
     MUL_ASSIGN = 294,
     DIV_ASSIGN = 295,
     CONCAT_ASSIGN = 296,
     BAND_ASSIGN = 297,
     BOR_ASSIGN = 298,
     BXOR_ASSIGN = 299,
     FDIV = 300,
     FDIV_ASSIGN = 301,
     MOD_ASSIGN = 302,
     SHR_ASSIGN = 303,
     SHL_ASSIGN = 304,
     SHR_U_ASSIGN = 305,
     SHIFT_LEFT = 306,
     SHIFT_RIGHT = 307,
     INTV = 308,
     FLOATV = 309,
     STRINGV = 310,
     PMCV = 311,
     OBJECTV = 312,
     LOG_XOR = 313,
     RELOP_EQ = 314,
     RELOP_NE = 315,
     RELOP_GT = 316,
     RELOP_GTE = 317,
     RELOP_LT = 318,
     RELOP_LTE = 319,
     GLOBAL = 320,
     GLOBALOP = 321,
     ADDR = 322,
     RESULT = 323,
     RETURN = 324,
     YIELDT = 325,
     POW = 326,
     SHIFT_RIGHT_U = 327,
     LOG_AND = 328,
     LOG_OR = 329,
     COMMA = 330,
     ESUB = 331,
     DOTDOT = 332,
     PCC_BEGIN = 333,
     PCC_END = 334,
     PCC_CALL = 335,
     PCC_SUB = 336,
     PCC_BEGIN_RETURN = 337,
     PCC_END_RETURN = 338,
     PCC_BEGIN_YIELD = 339,
     PCC_END_YIELD = 340,
     NCI_CALL = 341,
     METH_CALL = 342,
     INVOCANT = 343,
     PROTOTYPED = 344,
     NON_PROTOTYPED = 345,
     MAIN = 346,
     LOAD = 347,
     IMMEDIATE = 348,
     POSTCOMP = 349,
     METHOD = 350,
     ANON = 351,
     MULTI = 352,
     LABEL = 353,
     EMIT = 354,
     EOM = 355,
     IREG = 356,
     NREG = 357,
     SREG = 358,
     PREG = 359,
     IDENTIFIER = 360,
     REG = 361,
     MACRO = 362,
     ENDM = 363,
     STRINGC = 364,
     INTC = 365,
     FLOATC = 366,
     USTRINGC = 367,
     PARROT_OP = 368,
     VAR = 369,
     LINECOMMENT = 370,
     FILECOMMENT = 371,
     DOT = 372,
     CONCAT = 373,
     POINTY = 374
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define FASTCALL 261
#define N_OPERATORS 262
#define HLL 263
#define CALL 264
#define GOTO 265
#define ARG 266
#define FLATTEN_ARG 267
#define FLATTEN 268
#define IF 269
#define UNLESS 270
#define END 271
#define SAVEALL 272
#define RESTOREALL 273
#define NEW 274
#define NEWSUB 275
#define NEWCLOSURE 276
#define NEWCOR 277
#define NEWCONT 278
#define NAMESPACE 279
#define ENDNAMESPACE 280
#define CLASS 281
#define ENDCLASS 282
#define FIELD 283
#define DOT_METHOD 284
#define SUB 285
#define SYM 286
#define LOCAL 287
#define CONST 288
#define INC 289
#define DEC 290
#define GLOBAL_CONST 291
#define PLUS_ASSIGN 292
#define MINUS_ASSIGN 293
#define MUL_ASSIGN 294
#define DIV_ASSIGN 295
#define CONCAT_ASSIGN 296
#define BAND_ASSIGN 297
#define BOR_ASSIGN 298
#define BXOR_ASSIGN 299
#define FDIV 300
#define FDIV_ASSIGN 301
#define MOD_ASSIGN 302
#define SHR_ASSIGN 303
#define SHL_ASSIGN 304
#define SHR_U_ASSIGN 305
#define SHIFT_LEFT 306
#define SHIFT_RIGHT 307
#define INTV 308
#define FLOATV 309
#define STRINGV 310
#define PMCV 311
#define OBJECTV 312
#define LOG_XOR 313
#define RELOP_EQ 314
#define RELOP_NE 315
#define RELOP_GT 316
#define RELOP_GTE 317
#define RELOP_LT 318
#define RELOP_LTE 319
#define GLOBAL 320
#define GLOBALOP 321
#define ADDR 322
#define RESULT 323
#define RETURN 324
#define YIELDT 325
#define POW 326
#define SHIFT_RIGHT_U 327
#define LOG_AND 328
#define LOG_OR 329
#define COMMA 330
#define ESUB 331
#define DOTDOT 332
#define PCC_BEGIN 333
#define PCC_END 334
#define PCC_CALL 335
#define PCC_SUB 336
#define PCC_BEGIN_RETURN 337
#define PCC_END_RETURN 338
#define PCC_BEGIN_YIELD 339
#define PCC_END_YIELD 340
#define NCI_CALL 341
#define METH_CALL 342
#define INVOCANT 343
#define PROTOTYPED 344
#define NON_PROTOTYPED 345
#define MAIN 346
#define LOAD 347
#define IMMEDIATE 348
#define POSTCOMP 349
#define METHOD 350
#define ANON 351
#define MULTI 352
#define LABEL 353
#define EMIT 354
#define EOM 355
#define IREG 356
#define NREG 357
#define SREG 358
#define PREG 359
#define IDENTIFIER 360
#define REG 361
#define MACRO 362
#define ENDM 363
#define STRINGC 364
#define INTC 365
#define FLOATC 366
#define USTRINGC 367
#define PARROT_OP 368
#define VAR 369
#define LINECOMMENT 370
#define FILECOMMENT 371
#define DOT 372
#define CONCAT 373
#define POINTY 374




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
#line 642 "imcc/imcparser.c"
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
#line 663 "imcc/imcparser.c"

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
#define YYFINAL  43
#define YYLAST   575

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  136
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  114
/* YYNRULES -- Number of rules. */
#define YYNRULES  315
/* YYNRULES -- Number of states. */
#define YYNSTATES  529

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
      20,    22,    24,    27,    29,    31,    35,    38,    40,    43,
      48,    52,    58,    59,    66,    67,    74,    76,    79,    83,
      86,    88,    90,    92,    94,    95,    99,   103,   104,   106,
     107,   112,   113,   115,   120,   121,   128,   130,   131,   133,
     136,   138,   140,   142,   147,   152,   153,   154,   155,   166,
     167,   169,   173,   174,   179,   180,   184,   188,   190,   192,
     197,   198,   202,   204,   206,   208,   210,   212,   214,   215,
     217,   218,   219,   220,   231,   232,   243,   244,   247,   248,
     252,   254,   256,   257,   261,   263,   265,   267,   269,   271,
     273,   275,   277,   283,   287,   291,   295,   299,   305,   311,
     312,   316,   319,   322,   325,   326,   330,   333,   334,   339,
     341,   343,   345,   347,   348,   354,   356,   357,   360,   364,
     367,   370,   371,   377,   378,   384,   385,   387,   391,   393,
     396,   397,   400,   403,   405,   407,   408,   410,   413,   415,
     417,   421,   423,   427,   429,   431,   434,   437,   438,   443,
     444,   451,   453,   454,   461,   462,   467,   470,   473,   476,
     479,   482,   485,   488,   489,   493,   496,   498,   500,   502,
     503,   505,   507,   509,   511,   513,   515,   517,   519,   521,
     523,   525,   529,   534,   539,   544,   550,   556,   562,   568,
     574,   580,   586,   592,   598,   604,   610,   616,   622,   628,
     634,   640,   646,   653,   660,   667,   675,   680,   685,   692,
     700,   705,   712,   717,   722,   727,   732,   739,   747,   751,
     752,   762,   764,   766,   770,   774,   778,   782,   786,   790,
     794,   798,   802,   806,   810,   814,   818,   823,   825,   827,
     829,   833,   837,   841,   843,   845,   846,   852,   853,   857,
     859,   861,   864,   867,   871,   873,   880,   887,   892,   897,
     902,   907,   909,   911,   913,   915,   917,   919,   921,   923,
     924,   926,   930,   932,   934,   939,   941,   943,   945,   947,
     949,   951,   953,   955,   957,   959,   960,   963,   965,   969,
     970,   975,   977,   981,   984,   987,   989,   991,   993,   995,
     997,   999,  1001,  1003,  1005,  1007
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     137,     0,    -1,   138,    -1,   139,    -1,   138,   139,    -1,
     157,    -1,   156,    -1,   144,    -1,   143,    -1,   164,    -1,
     176,    -1,   153,    -1,   108,     4,    -1,   140,    -1,     4,
      -1,     6,   141,     4,    -1,   142,     4,    -1,     7,    -1,
       8,   111,    -1,     9,   110,    76,   110,    -1,    66,   218,
     106,    -1,    66,   218,   106,   121,   248,    -1,    -1,    34,
     145,   218,   106,   121,   248,    -1,    -1,    34,   147,   111,
     240,   121,   110,    -1,   149,    -1,   148,   149,    -1,   206,
     150,     4,    -1,   108,     4,    -1,   117,    -1,   116,    -1,
     156,    -1,   146,    -1,    -1,   151,   114,   152,    -1,    82,
     185,    99,    -1,    -1,   234,    -1,    -1,   100,   154,   155,
     101,    -1,    -1,   148,    -1,    25,   122,   242,   123,    -1,
      -1,    27,   106,   158,     4,   159,    28,    -1,   160,    -1,
      -1,   161,    -1,   160,   161,    -1,   162,    -1,   163,    -1,
       4,    -1,    29,   218,   106,     4,    -1,    30,   106,   106,
       4,    -1,    -1,    -1,    -1,    31,   165,   237,   166,   171,
       4,   167,   168,   175,    77,    -1,    -1,     4,    -1,   168,
     169,     4,    -1,    -1,     5,   170,   218,   106,    -1,    -1,
     171,    76,   186,    -1,   171,    76,   172,    -1,   186,    -1,
     172,    -1,    98,   124,   173,   125,    -1,    -1,   173,    76,
     174,    -1,   174,    -1,    54,    -1,    55,    -1,    57,    -1,
      56,    -1,   106,    -1,    -1,   203,    -1,    -1,    -1,    -1,
      82,   177,   106,   178,   171,     4,   179,   168,   175,    77,
      -1,    -1,    79,   184,     4,   181,   188,   183,   187,   182,
     190,    80,    -1,    -1,   208,     4,    -1,    -1,    89,   241,
       4,    -1,    90,    -1,    91,    -1,    -1,   185,    76,   186,
      -1,   186,    -1,   184,    -1,    93,    -1,    92,    -1,    94,
      -1,    95,    -1,    97,    -1,    96,    -1,    81,   241,    76,
     241,     4,    -1,    81,   241,     4,    -1,    87,   241,     4,
      -1,    88,   233,     4,    -1,    88,   110,     4,    -1,    88,
     233,    76,   241,     4,    -1,    88,   110,    76,   241,     4,
      -1,    -1,   188,   189,     4,    -1,    12,   241,    -1,    14,
     233,    -1,    13,   233,    -1,    -1,   190,   191,     4,    -1,
      69,   233,    -1,    -1,    33,   192,   218,   106,    -1,    83,
      -1,    85,    -1,    84,    -1,    86,    -1,    -1,   193,     4,
     196,   197,   194,    -1,   199,    -1,    -1,   197,     4,    -1,
     197,   198,     4,    -1,    70,   241,    -1,    14,   233,    -1,
      -1,    70,   124,   200,   202,   125,    -1,    -1,    71,   124,
     201,   202,   125,    -1,    -1,   241,    -1,   202,    76,   241,
      -1,   205,    -1,   203,   205,    -1,    -1,   204,   209,    -1,
     108,     4,    -1,   117,    -1,   116,    -1,    -1,   207,    -1,
     207,   208,    -1,   208,    -1,    99,    -1,   206,   211,     4,
      -1,   106,    -1,   210,    76,   106,    -1,   220,    -1,   231,
      -1,    25,   106,    -1,    26,   106,    -1,    -1,    33,   212,
     218,   210,    -1,    -1,    34,   213,   218,   106,   121,   248,
      -1,   146,    -1,    -1,    37,   214,   218,   106,   121,   248,
      -1,    -1,     5,   215,   218,   106,    -1,     5,   247,    -1,
      69,   241,    -1,    12,   241,    -1,    70,   241,    -1,    70,
     226,    -1,    10,   239,    -1,    11,   239,    -1,    -1,    21,
     216,   152,    -1,   114,   234,    -1,   226,    -1,   180,    -1,
     195,    -1,    -1,    21,    -1,    22,    -1,    23,    -1,    24,
      -1,    54,    -1,    55,    -1,    56,    -1,    57,    -1,    58,
      -1,   219,    -1,   106,    -1,   233,   121,   241,    -1,   233,
     121,   126,   241,    -1,   233,   121,   127,   241,    -1,   233,
     121,   128,   241,    -1,   233,   121,   241,   129,   241,    -1,
     233,   121,   241,   127,   241,    -1,   233,   121,   241,   130,
     241,    -1,   233,   121,   241,    72,   241,    -1,   233,   121,
     241,   131,   241,    -1,   233,   121,   241,    46,   241,    -1,
     233,   121,   241,   132,   241,    -1,   233,   121,   241,   119,
     241,    -1,   233,   121,   241,    52,   241,    -1,   233,   121,
     241,    53,   241,    -1,   233,   121,   241,    73,   241,    -1,
     233,   121,   241,    74,   241,    -1,   233,   121,   241,    75,
     241,    -1,   233,   121,   241,    59,   241,    -1,   233,   121,
     241,   133,   241,    -1,   233,   121,   241,   134,   241,    -1,
     233,   121,   241,   128,   241,    -1,   233,   121,   241,   122,
     242,   123,    -1,   233,   122,   242,   123,   121,   241,    -1,
     233,   121,    20,   219,    76,   241,    -1,   233,   121,    20,
     219,   122,   242,   123,    -1,   233,   121,    20,   219,    -1,
     233,   121,    20,   241,    -1,   233,   121,    20,   241,    76,
     241,    -1,   233,   121,    20,   241,   122,   242,   123,    -1,
     233,   121,   217,   106,    -1,   233,   121,   217,   106,    76,
     106,    -1,   233,   121,    68,   106,    -1,   233,   121,    67,
     249,    -1,    67,   249,   121,   241,    -1,    20,   233,    76,
     241,    -1,    20,   233,    76,   241,    76,   241,    -1,    20,
     233,    76,   241,   122,   242,   123,    -1,   233,   121,   226,
      -1,    -1,   221,   124,   230,   125,   121,   224,   124,   228,
     125,    -1,   222,    -1,   223,    -1,   233,    38,   241,    -1,
     233,    39,   241,    -1,   233,    40,   241,    -1,   233,    41,
     241,    -1,   233,    48,   241,    -1,   233,    47,   241,    -1,
     233,    42,   241,    -1,   233,    43,   241,    -1,   233,    44,
     241,    -1,   233,    45,   241,    -1,   233,    49,   241,    -1,
     233,    50,   241,    -1,   233,    51,   241,    -1,   233,   121,
     114,   152,    -1,   106,    -1,   110,    -1,   233,    -1,   233,
     225,   238,    -1,   233,   225,   110,    -1,   233,   225,   233,
      -1,   120,    -1,   118,    -1,    -1,   224,   227,   124,   228,
     125,    -1,    -1,   228,    76,   229,    -1,   229,    -1,   241,
      -1,    14,   233,    -1,    13,   233,    -1,   230,    76,   233,
      -1,   233,    -1,    15,   241,   232,   241,    11,   239,    -1,
      16,   241,   232,   241,    11,   239,    -1,    15,   241,    11,
     239,    -1,    16,   241,    11,   239,    -1,    15,   241,    76,
     239,    -1,    16,   241,    76,   239,    -1,    60,    -1,    61,
      -1,    62,    -1,    63,    -1,    64,    -1,    65,    -1,   115,
      -1,   247,    -1,    -1,   235,    -1,   235,    76,   236,    -1,
     236,    -1,   240,    -1,   233,   122,   242,   123,    -1,   238,
      -1,   110,    -1,   106,    -1,   114,    -1,   106,    -1,   114,
      -1,   239,    -1,   241,    -1,   233,    -1,   248,    -1,    -1,
     243,   244,    -1,   246,    -1,   244,   135,   246,    -1,    -1,
     244,    76,   245,   246,    -1,   241,    -1,   241,    78,   241,
      -1,    78,   241,    -1,   241,    78,    -1,   102,    -1,   103,
      -1,   104,    -1,   105,    -1,   107,    -1,   111,    -1,   112,
      -1,   110,    -1,   113,    -1,   104,    -1,   110,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   402,   402,   406,   408,   411,   413,   414,   415,   416,
     417,   418,   419,   420,   421,   424,   425,   428,   429,   437,
     448,   455,   464,   463,   469,   468,   472,   474,   477,   479,
     480,   481,   482,   483,   486,   486,   490,   497,   500,   505,
     504,   515,   517,   520,   538,   536,   552,   554,   557,   559,
     562,   564,   565,   568,   582,   600,   606,   611,   598,   616,
     618,   619,   623,   622,   627,   629,   630,   631,   632,   635,
     638,   640,   641,   644,   646,   647,   648,   649,   661,   663,
     667,   669,   675,   666,   682,   680,   712,   714,   717,   719,
     722,   724,   727,   729,   730,   733,   734,   735,   736,   737,
     738,   739,   742,   748,   750,   755,   757,   759,   763,   769,
     771,   774,   776,   779,   782,   784,   787,   790,   790,   794,
     796,   799,   801,   806,   804,   810,   815,   817,   819,   823,
     825,   830,   828,   837,   836,   845,   847,   848,   852,   854,
     865,   869,   872,   873,   874,   877,   879,   882,   884,   887,
     893,   898,   906,   914,   916,   917,   918,   919,   919,   932,
     932,   934,   935,   935,   937,   937,   940,   941,   942,   943,
     944,   948,   949,   950,   950,   953,   956,   957,   958,   959,
     962,   964,   965,   966,   969,   971,   972,   973,   974,   975,
     978,   989,   991,   992,   993,   994,   995,   996,   997,   998,
     999,  1000,  1001,  1002,  1004,  1006,  1008,  1010,  1012,  1014,
    1016,  1018,  1020,  1022,  1024,  1026,  1028,  1030,  1032,  1034,
    1036,  1039,  1046,  1049,  1051,  1055,  1057,  1059,  1062,  1069,
    1068,  1077,  1078,  1081,  1084,  1086,  1088,  1090,  1092,  1094,
    1096,  1098,  1100,  1102,  1104,  1106,  1110,  1118,  1119,  1120,
    1125,  1126,  1127,  1130,  1131,  1136,  1134,  1144,  1146,  1147,
    1150,  1153,  1156,  1160,  1162,  1165,  1168,  1170,  1172,  1174,
    1176,  1180,  1182,  1183,  1184,  1185,  1186,  1189,  1191,  1194,
    1196,  1199,  1201,  1204,  1206,  1213,  1215,  1218,  1220,  1223,
    1225,  1228,  1230,  1233,  1235,  1238,  1238,  1242,  1244,  1246,
    1246,  1250,  1256,  1259,  1260,  1263,  1265,  1266,  1267,  1268,
    1271,  1273,  1274,  1275,  1278,  1280
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "FASTCALL", "N_OPERATORS", "HLL", "CALL", "GOTO", "ARG", "FLATTEN_ARG", 
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
  "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", "POINTY", "'='", "'['", 
  "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", 
  "'&'", "'|'", "';'", "$accept", "program", "compilation_units", 
  "compilation_unit", "pragma", "pragma_1", "hll_def", "global", 
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
     139,   139,   139,   139,   139,   140,   140,   141,   141,   142,
     143,   143,   145,   144,   147,   146,   148,   148,   149,   149,
     149,   149,   149,   149,   151,   150,   150,   150,   152,   154,
     153,   155,   155,   156,   158,   157,   159,   159,   160,   160,
     161,   161,   161,   162,   163,   165,   166,   167,   164,   168,
     168,   168,   170,   169,   171,   171,   171,   171,   171,   172,
     173,   173,   173,   174,   174,   174,   174,   174,   175,   175,
     177,   178,   179,   176,   181,   180,   182,   182,   183,   183,
     184,   184,   185,   185,   185,   186,   186,   186,   186,   186,
     186,   186,   187,   187,   187,   187,   187,   187,   187,   188,
     188,   189,   189,   189,   190,   190,   191,   192,   191,   193,
     193,   194,   194,   196,   195,   195,   197,   197,   197,   198,
     198,   200,   199,   201,   199,   202,   202,   202,   203,   203,
     204,   205,   205,   205,   205,   206,   206,   207,   207,   208,
     209,   210,   210,   211,   211,   211,   211,   212,   211,   213,
     211,   211,   214,   211,   215,   211,   211,   211,   211,   211,
     211,   211,   211,   216,   211,   211,   211,   211,   211,   211,
     217,   217,   217,   217,   218,   218,   218,   218,   218,   218,
     219,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   220,   220,   220,   220,   221,
     220,   220,   220,   222,   222,   222,   222,   222,   222,   222,
     222,   222,   222,   222,   222,   222,   223,   224,   224,   224,
     224,   224,   224,   225,   225,   227,   226,   228,   228,   228,
     229,   229,   229,   230,   230,   231,   231,   231,   231,   231,
     231,   232,   232,   232,   232,   232,   232,   233,   233,   234,
     234,   235,   235,   236,   236,   237,   237,   238,   238,   239,
     239,   240,   240,   241,   241,   243,   242,   244,   244,   245,
     244,   246,   246,   246,   246,   247,   247,   247,   247,   247,
     248,   248,   248,   248,   249,   249
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     2,     1,     1,     3,     2,     1,     2,     4,
       3,     5,     0,     6,     0,     6,     1,     2,     3,     2,
       1,     1,     1,     1,     0,     3,     3,     0,     1,     0,
       4,     0,     1,     4,     0,     6,     1,     0,     1,     2,
       1,     1,     1,     4,     4,     0,     0,     0,    10,     0,
       1,     3,     0,     4,     0,     3,     3,     1,     1,     4,
       0,     3,     1,     1,     1,     1,     1,     1,     0,     1,
       0,     0,     0,    10,     0,    10,     0,     2,     0,     3,
       1,     1,     0,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     5,     3,     3,     3,     3,     5,     5,     0,
       3,     2,     2,     2,     0,     3,     2,     0,     4,     1,
       1,     1,     1,     0,     5,     1,     0,     2,     3,     2,
       2,     0,     5,     0,     5,     0,     1,     3,     1,     2,
       0,     2,     2,     1,     1,     0,     1,     2,     1,     1,
       3,     1,     3,     1,     1,     2,     2,     0,     4,     0,
       6,     1,     0,     6,     0,     4,     2,     2,     2,     2,
       2,     2,     2,     0,     3,     2,     1,     1,     1,     0,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     4,     4,     4,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     6,     6,     6,     7,     4,     4,     6,     7,
       4,     6,     4,     4,     4,     4,     6,     7,     3,     0,
       9,     1,     1,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     4,     1,     1,     1,
       3,     3,     3,     1,     1,     0,     5,     0,     3,     1,
       1,     2,     2,     3,     1,     6,     6,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       1,     3,     1,     1,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     2,     1,     3,     0,
       4,     1,     3,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    14,     0,     0,     0,     0,    55,    22,     0,    80,
      39,     0,     0,     2,     3,    13,     0,     8,     7,    11,
       6,     5,     9,    10,    17,     0,     0,     0,   295,    44,
       0,     0,   184,   185,   186,   187,   188,   190,     0,   189,
       0,   145,    12,     1,     4,    16,    18,    15,     0,     0,
       0,     0,   287,   286,   288,    56,   285,     0,    20,    81,
      24,   149,     0,    31,    30,    33,   145,    26,     0,    32,
      34,   146,   148,    19,    43,     0,   305,   306,   307,   308,
     309,   312,   310,   311,   313,   277,   293,   301,   296,   297,
     278,   294,    47,    64,     0,     0,    64,     0,    29,    27,
      40,    92,     0,     0,   147,   303,   304,   299,     0,    52,
       0,     0,     0,    46,    48,    50,    51,    90,    91,    97,
      96,    98,    99,   101,   100,     0,     0,    68,    95,    67,
       0,    21,     0,     0,     0,    94,    28,   279,   302,     0,
     298,     0,     0,    45,    49,    70,    57,     0,    23,    82,
     289,   290,   291,     0,   292,     0,    36,    35,   293,    38,
     280,   282,   283,   300,     0,     0,    73,    74,    76,    75,
      77,     0,    72,    59,    66,    65,    59,     0,    93,   295,
       0,    53,    54,     0,    69,    60,   140,   140,    25,     0,
     281,    71,    62,     0,   144,   143,     0,     0,   140,   145,
     138,     0,   284,     0,   142,    61,    58,   139,   179,   141,
      83,     0,   164,     0,     0,     0,     0,     0,     0,   173,
       0,     0,   157,   159,   162,     0,     0,     0,     0,     0,
     119,   120,   247,   248,   279,   161,   177,     0,   178,   125,
       0,   153,     0,   231,   232,   255,   176,   154,   249,    63,
       0,   166,   171,   172,   168,     0,     0,     0,   279,   155,
     156,     0,     0,     0,   314,   315,     0,   167,   312,   131,
     170,   293,   169,   133,     0,   175,   123,   150,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   254,   253,     0,   295,     0,     0,     0,
     271,   272,   273,   274,   275,   276,     0,     0,     0,     0,
       0,     0,   174,     0,     0,     0,     0,   135,   135,    84,
     126,     0,   264,   257,   233,   234,   235,   236,   239,   240,
     241,   242,   238,   237,   243,   244,   245,     0,   180,   181,
     182,   183,     0,     0,   279,     0,     0,     0,     0,   228,
     191,     0,   251,   252,   250,   165,   267,   269,     0,   268,
     270,     0,   225,   151,   158,     0,     0,   224,     0,   136,
       0,   109,     0,     0,     0,     0,     0,     0,   259,   260,
     216,   217,   223,   222,   246,   192,   193,   194,   220,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   295,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   295,     0,     0,     0,     0,   132,   134,    88,   127,
       0,     0,   121,   122,   124,     0,   263,     0,   262,   261,
       0,   256,     0,   295,     0,   295,     0,   200,   203,   204,
     208,   198,   205,   206,   207,   202,     0,   196,   211,   195,
     197,   199,   201,   209,   210,     0,   265,   266,   226,     0,
     152,   160,   163,   137,     0,     0,     0,     0,     0,     0,
     130,   129,   128,     0,   249,   258,   214,     0,   218,     0,
     221,   212,   213,   227,   111,   113,   112,     0,     0,     0,
       0,    86,   110,   257,   215,   219,    89,     0,     0,     0,
       0,   114,     0,     0,   103,     0,   104,   106,     0,   105,
       0,     0,    87,   230,     0,     0,     0,   117,     0,    85,
       0,   102,   108,   107,     0,   116,   115,     0,   118
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    26,    16,    17,    18,    31,
      65,    97,    66,    67,   102,   103,   157,    19,    41,    68,
      20,    21,    51,   112,   113,   114,   115,   116,    22,    30,
      93,   173,   186,   196,   203,   126,   127,   171,   172,   197,
      23,    40,    96,   176,   236,   371,   501,   468,   128,   134,
     129,   491,   418,   469,   511,   520,   524,   237,   424,   238,
     320,   372,   425,   239,   317,   318,   368,   198,   199,   200,
      70,    71,    72,   209,   364,   240,   261,   262,   263,   250,
     258,   348,    38,    39,   241,   242,   243,   244,   245,   297,
     246,   279,   377,   378,   321,   247,   307,    86,   159,   160,
     161,    55,    56,   152,   162,   154,    49,    50,    88,   139,
      89,    90,    91,   266
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -252
static const short yypact[] =
{
       9,  -252,   154,   -84,   -78,   -65,  -252,  -252,    70,  -252,
    -252,    53,    60,     9,  -252,  -252,    85,  -252,  -252,  -252,
    -252,  -252,  -252,  -252,  -252,    37,   160,    98,  -252,  -252,
      61,    70,  -252,  -252,  -252,  -252,  -252,  -252,    72,  -252,
      93,   -11,  -252,  -252,  -252,  -252,  -252,  -252,    78,    87,
     322,   203,  -252,  -252,  -252,  -252,  -252,   123,   129,  -252,
    -252,  -252,   247,  -252,  -252,  -252,    13,  -252,   167,  -252,
       1,   162,  -252,  -252,  -252,   450,  -252,  -252,  -252,  -252,
    -252,  -252,  -252,  -252,  -252,  -252,  -252,   201,   -55,  -252,
    -252,  -252,   136,   476,   165,   115,   476,   172,  -252,  -252,
    -252,   377,   288,   182,  -252,  -252,   450,  -252,   322,  -252,
      70,   191,   273,   136,  -252,  -252,  -252,  -252,  -252,  -252,
    -252,  -252,  -252,  -252,  -252,   184,     2,  -252,  -252,  -252,
     115,  -252,    35,   224,   -54,  -252,  -252,   224,  -252,   322,
    -252,   209,   210,  -252,  -252,    99,  -252,   476,  -252,  -252,
    -252,  -252,  -252,   198,  -252,   377,  -252,  -252,   202,  -252,
     257,  -252,  -252,  -252,   319,   336,  -252,  -252,  -252,  -252,
    -252,   -51,  -252,   337,  -252,  -252,   337,   241,  -252,  -252,
     224,  -252,  -252,    99,  -252,  -252,    -1,    -1,  -252,   237,
    -252,  -252,  -252,   357,  -252,  -252,   358,   296,    74,   162,
    -252,   298,  -252,    70,  -252,  -252,  -252,  -252,   381,  -252,
    -252,   270,   277,    67,    67,   450,   450,   450,   170,  -252,
     272,   282,  -252,   278,  -252,   -75,   450,   396,   266,   156,
    -252,  -252,  -252,  -252,   224,  -252,  -252,   390,  -252,  -252,
     394,  -252,   275,  -252,  -252,  -252,  -252,  -252,   173,  -252,
      70,  -252,  -252,  -252,  -252,     6,   242,   327,   224,  -252,
    -252,    70,    70,    70,  -252,  -252,   283,  -252,   281,  -252,
    -252,   164,  -252,  -252,   405,  -252,  -252,  -252,   170,   286,
     450,   450,   450,   450,   450,   450,   450,   450,   450,   450,
     450,   450,   450,  -252,  -252,    31,  -252,   152,   305,    67,
    -252,  -252,  -252,  -252,  -252,  -252,    67,   450,    67,    67,
     450,   450,  -252,   306,   307,   310,   450,   450,   450,  -252,
    -252,   -44,  -252,    82,  -252,  -252,  -252,  -252,  -252,  -252,
    -252,  -252,  -252,  -252,  -252,  -252,  -252,   436,  -252,  -252,
    -252,  -252,   -75,   313,   224,   450,   450,   450,   316,  -252,
     403,   308,  -252,  -252,  -252,  -252,  -252,  -252,   417,  -252,
    -252,   419,   -45,  -252,   360,   317,   318,  -252,    71,  -252,
      73,  -252,    16,   170,   323,   170,   170,    76,  -252,  -252,
     -12,    55,  -252,  -252,  -252,  -252,  -252,  -252,   364,   450,
     450,   450,   450,   450,   450,   450,   450,   450,  -252,   450,
     450,   450,   450,   450,   450,   450,   450,   324,    67,    67,
     450,  -252,   341,   115,   115,   450,  -252,  -252,    -2,  -252,
     170,   450,  -252,  -252,  -252,   439,  -252,   207,  -252,  -252,
      82,  -252,   450,  -252,   450,  -252,   347,  -252,  -252,  -252,
    -252,  -252,  -252,  -252,  -252,  -252,   331,  -252,  -252,  -252,
    -252,  -252,  -252,  -252,  -252,   450,  -252,  -252,  -252,   334,
    -252,  -252,  -252,  -252,   450,   170,   170,   450,   -25,   455,
    -252,  -252,  -252,   355,    88,  -252,  -252,   342,  -252,   359,
    -252,  -252,  -252,  -252,  -252,  -252,  -252,   477,   450,   450,
     262,   162,  -252,    82,  -252,  -252,  -252,    42,   485,    44,
      46,  -252,   486,    84,  -252,   450,  -252,  -252,   450,  -252,
     450,    39,  -252,  -252,   488,   490,   493,  -252,   170,  -252,
     500,  -252,  -252,  -252,    70,  -252,  -252,   374,  -252
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -252,  -252,  -252,   497,  -252,  -252,  -252,  -252,  -252,  -252,
     304,  -252,  -252,   447,  -252,  -252,  -251,  -252,  -252,  -252,
     -17,  -252,  -252,  -252,  -252,   401,  -252,  -252,  -252,  -252,
    -252,  -252,   339,  -252,  -252,   420,   370,  -252,   335,   332,
    -252,  -252,  -252,  -252,  -252,  -252,  -252,  -252,   292,  -252,
     -82,  -252,  -252,  -252,  -252,  -252,  -252,  -252,  -252,  -252,
    -252,  -252,  -252,  -252,  -252,  -252,   205,  -252,  -252,   326,
     328,  -252,   -70,  -252,  -252,  -252,  -252,  -252,  -252,  -252,
    -252,  -252,   -31,   189,  -252,  -252,  -252,  -252,   101,  -252,
    -211,  -252,    36,   114,  -252,  -252,   289,   -95,   325,  -252,
     376,  -252,   253,  -205,   425,   -47,  -146,  -252,  -252,  -252,
     -81,   352,   -93,   233
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -250
static const short yytable[] =
{
      57,   104,   131,    87,   192,   -37,   146,   312,   252,   253,
     464,   465,   466,     1,     4,     2,   270,   299,     3,   135,
     419,   107,   155,    60,    69,   183,    27,   140,   105,   264,
     420,   410,   373,   189,     4,   265,     5,   148,     4,   149,
       6,    29,   158,     7,    28,   156,   504,    60,   507,    69,
     509,   337,   338,   339,   340,   341,   488,    42,   163,   138,
      43,    87,   489,   490,   432,   175,   300,   301,   302,   303,
     304,   305,   517,   178,   184,     8,   -78,   411,   147,   141,
     108,   374,   306,   101,   349,   158,   421,   467,    61,    45,
     -41,     9,    87,   384,   356,   375,   376,    62,   342,   343,
     422,   357,   423,   359,   360,    63,    64,   193,   518,    10,
     433,   147,    61,   248,   -42,   194,   195,    11,   505,   519,
     508,    62,   510,   257,    32,    33,    34,    35,    36,    63,
      64,   434,   271,    76,    77,    78,    79,   232,    80,   158,
     109,   268,    82,    83,    84,   344,    85,   415,    46,   415,
     351,   -79,   430,   166,   167,   168,   169,   345,   346,   347,
     430,    24,    25,   158,    47,   110,   111,    52,   254,   255,
     256,    53,   211,   150,    48,    54,    37,   435,    58,   267,
     272,   151,   193,   322,    76,    77,    78,    79,    73,    80,
     194,   195,    81,    82,    83,    84,   416,    85,   417,    59,
     271,   431,   353,   456,   457,   170,   293,    92,   294,   513,
      74,   280,   281,   282,   283,   284,   285,   286,   287,   298,
     288,   289,   290,   291,   292,    81,    82,    83,    84,    94,
     313,   314,   315,   324,   325,   326,   327,   328,   329,   330,
     331,   332,   333,   334,   335,   336,   117,   118,   350,   158,
      95,    98,   446,   308,    76,    77,    78,    79,    52,    80,
     358,    61,   352,   361,   362,   459,    54,    85,   100,   367,
     369,   369,    76,    77,    78,    79,   379,    80,   426,   106,
     428,   429,   293,   133,   294,    85,   130,   477,  -249,   479,
     381,   293,   136,   294,   295,   296,   137,   142,   385,   386,
     387,   143,   300,   301,   302,   303,   304,   305,   145,    76,
      77,    78,    79,   232,    80,   164,   165,   233,   309,   177,
     461,   462,    85,   181,   179,   470,    76,    77,    78,    79,
     150,    80,   474,   180,    81,    82,    83,    84,   151,    85,
     182,   185,   437,   438,   439,   440,   441,   442,   443,   444,
     445,   188,   447,   448,   449,   450,   451,   452,   453,   454,
     202,   204,   205,   458,    76,    77,    78,    79,   463,    80,
     485,   486,   499,   206,   471,   210,   249,    85,   259,    76,
      77,    78,    79,   379,    80,   476,   212,   478,   260,   -24,
     273,   213,   214,   215,   276,   500,   216,   217,   277,   278,
      75,   218,   219,   311,   316,  -248,   220,   221,   482,   319,
     323,   355,   363,   365,   222,   223,   366,   484,   224,   383,
     487,   502,   388,   525,    76,    77,    78,    79,   408,    80,
     409,   407,    81,    82,    83,    84,   412,    85,   413,   414,
     436,   497,   498,   472,   427,   455,   379,   460,   225,   389,
     226,   227,   228,   480,   481,   390,   391,   483,   514,   492,
     229,   515,   392,   516,   230,   494,   231,   117,   118,   119,
     120,   121,   122,   123,   124,   393,   394,   395,   396,   493,
     528,   496,   495,    76,    77,    78,    79,   232,    80,   506,
     512,   233,   521,   527,   522,   234,    85,   523,    76,    77,
      78,    79,   232,    80,   526,  -229,   268,    82,    83,    84,
      44,    85,   235,    99,   144,   187,   132,   174,   191,   201,
     269,   274,   397,   370,   207,   398,   380,   208,   473,   503,
     399,   400,   401,   402,   403,   404,   405,   406,    76,    77,
      78,    79,    37,    80,   475,   310,    81,    82,    83,    84,
     354,    85,    76,    77,    78,    79,   190,    80,   153,   275,
      81,    82,    83,    84,   251,    85,   117,   118,   119,   120,
     121,   122,   123,   124,   125,   382
};

static const unsigned short yycheck[] =
{
      31,    71,    95,    50,     5,     4,     4,   258,   213,   214,
      12,    13,    14,     4,    25,     6,   227,    11,     9,   101,
       4,    76,    76,    34,    41,    76,   110,   108,    75,   104,
      14,    76,    76,   179,    25,   110,    27,   130,    25,     4,
      31,   106,   137,    34,   122,    99,     4,    34,     4,    66,
       4,    20,    21,    22,    23,    24,    81,     4,   139,   106,
       0,   108,    87,    88,    76,   147,    60,    61,    62,    63,
      64,    65,    33,   155,   125,    66,    77,   122,    76,   110,
     135,   125,    76,    82,   295,   180,    70,    89,    99,     4,
     101,    82,   139,   344,   299,    13,    14,   108,    67,    68,
      84,   306,    86,   308,   309,   116,   117,   108,    69,   100,
     122,    76,    99,   208,   101,   116,   117,   108,    76,    80,
      76,   108,    76,   218,    54,    55,    56,    57,    58,   116,
     117,    76,   227,   102,   103,   104,   105,   106,   107,   234,
       4,   110,   111,   112,   113,   114,   115,    76,   111,    76,
     296,    77,    76,    54,    55,    56,    57,   126,   127,   128,
      76,     7,     8,   258,     4,    29,    30,   106,   215,   216,
     217,   110,   203,   106,    76,   114,   106,   122,   106,   226,
     227,   114,   108,   278,   102,   103,   104,   105,   110,   107,
     116,   117,   110,   111,   112,   113,   125,   115,   125,   106,
     295,   125,   297,   408,   409,   106,   118,     4,   120,   125,
     123,    38,    39,    40,    41,    42,    43,    44,    45,   250,
      47,    48,    49,    50,    51,   110,   111,   112,   113,   106,
     261,   262,   263,   280,   281,   282,   283,   284,   285,   286,
     287,   288,   289,   290,   291,   292,    90,    91,   295,   344,
     121,     4,   398,    11,   102,   103,   104,   105,   106,   107,
     307,    99,   110,   310,   311,   411,   114,   115,   101,   316,
     317,   318,   102,   103,   104,   105,   323,   107,   373,    78,
     375,   376,   118,   111,   120,   115,   121,   433,   124,   435,
     337,   118,     4,   120,   121,   122,   114,   106,   345,   346,
     347,    28,    60,    61,    62,    63,    64,    65,   124,   102,
     103,   104,   105,   106,   107,   106,   106,   110,    76,   121,
     413,   414,   115,     4,   122,   420,   102,   103,   104,   105,
     106,   107,   427,    76,   110,   111,   112,   113,   114,   115,
       4,     4,   389,   390,   391,   392,   393,   394,   395,   396,
     397,   110,   399,   400,   401,   402,   403,   404,   405,   406,
     123,     4,     4,   410,   102,   103,   104,   105,   415,   107,
     465,   466,   110,    77,   421,    77,   106,   115,   106,   102,
     103,   104,   105,   430,   107,   432,     5,   434,   106,   111,
     124,    10,    11,    12,     4,   490,    15,    16,     4,   124,
      78,    20,    21,    76,   121,   124,    25,    26,   455,     4,
     124,   106,   106,   106,    33,    34,   106,   464,    37,   106,
     467,   491,   106,   518,   102,   103,   104,   105,    11,   107,
      11,   123,   110,   111,   112,   113,    76,   115,   121,   121,
      76,   488,   489,     4,   121,   121,   493,   106,    67,    46,
      69,    70,    71,   106,   123,    52,    53,   123,   505,     4,
      79,   508,    59,   510,    83,   123,    85,    90,    91,    92,
      93,    94,    95,    96,    97,    72,    73,    74,    75,   124,
     106,     4,   123,   102,   103,   104,   105,   106,   107,     4,
       4,   110,     4,   524,     4,   114,   115,     4,   102,   103,
     104,   105,   106,   107,     4,   124,   110,   111,   112,   113,
      13,   115,   208,    66,   113,   176,    96,   147,   183,   187,
     124,   229,   119,   318,   198,   122,   337,   199,   427,   493,
     127,   128,   129,   130,   131,   132,   133,   134,   102,   103,
     104,   105,   106,   107,   430,   256,   110,   111,   112,   113,
     297,   115,   102,   103,   104,   105,   180,   107,   133,   234,
     110,   111,   112,   113,   212,   115,    90,    91,    92,    93,
      94,    95,    96,    97,    98,   342
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     9,    25,    27,    31,    34,    66,    82,
     100,   108,   137,   138,   139,   140,   142,   143,   144,   153,
     156,   157,   164,   176,     7,     8,   141,   110,   122,   106,
     165,   145,    54,    55,    56,    57,    58,   106,   218,   219,
     177,   154,     4,     0,   139,     4,   111,     4,    76,   242,
     243,   158,   106,   110,   114,   237,   238,   218,   106,   106,
      34,    99,   108,   116,   117,   146,   148,   149,   155,   156,
     206,   207,   208,   110,   123,    78,   102,   103,   104,   105,
     107,   110,   111,   112,   113,   115,   233,   241,   244,   246,
     247,   248,     4,   166,   106,   121,   178,   147,     4,   149,
     101,    82,   150,   151,   208,   241,    78,    76,   135,     4,
      29,    30,   159,   160,   161,   162,   163,    90,    91,    92,
      93,    94,    95,    96,    97,    98,   171,   172,   184,   186,
     121,   248,   171,   111,   185,   186,     4,   114,   241,   245,
     246,   218,   106,    28,   161,   124,     4,    76,   248,     4,
     106,   114,   239,   240,   241,    76,    99,   152,   233,   234,
     235,   236,   240,   246,   106,   106,    54,    55,    56,    57,
     106,   173,   174,   167,   172,   186,   179,   121,   186,   122,
      76,     4,     4,    76,   125,     4,   168,   168,   110,   242,
     236,   174,     5,   108,   116,   117,   169,   175,   203,   204,
     205,   175,   123,   170,     4,     4,    77,   205,   206,   209,
      77,   218,     5,    10,    11,    12,    15,    16,    20,    21,
      25,    26,    33,    34,    37,    67,    69,    70,    71,    79,
      83,    85,   106,   110,   114,   146,   180,   193,   195,   199,
     211,   220,   221,   222,   223,   224,   226,   231,   233,   106,
     215,   247,   239,   239,   241,   241,   241,   233,   216,   106,
     106,   212,   213,   214,   104,   110,   249,   241,   110,   124,
     226,   233,   241,   124,   184,   234,     4,     4,   124,   227,
      38,    39,    40,    41,    42,    43,    44,    45,    47,    48,
      49,    50,    51,   118,   120,   121,   122,   225,   218,    11,
      60,    61,    62,    63,    64,    65,    76,   232,    11,    76,
     232,    76,   152,   218,   218,   218,   121,   200,   201,     4,
     196,   230,   233,   124,   241,   241,   241,   241,   241,   241,
     241,   241,   241,   241,   241,   241,   241,    20,    21,    22,
      23,    24,    67,    68,   114,   126,   127,   128,   217,   226,
     241,   242,   110,   233,   238,   106,   239,   239,   241,   239,
     239,   241,   241,   106,   210,   106,   106,   241,   202,   241,
     202,   181,   197,    76,   125,    13,    14,   228,   229,   241,
     219,   241,   249,   106,   152,   241,   241,   241,   106,    46,
      52,    53,    59,    72,    73,    74,    75,   119,   122,   127,
     128,   129,   130,   131,   132,   133,   134,   123,    11,    11,
      76,   122,    76,   121,   121,    76,   125,   125,   188,     4,
      14,    70,    84,    86,   194,   198,   233,   121,   233,   233,
      76,   125,    76,   122,    76,   122,    76,   241,   241,   241,
     241,   241,   241,   241,   241,   241,   242,   241,   241,   241,
     241,   241,   241,   241,   241,   121,   239,   239,   241,   242,
     106,   248,   248,   241,    12,    13,    14,    89,   183,   189,
     233,   241,     4,   224,   233,   229,   241,   242,   241,   242,
     106,   123,   241,   123,   241,   233,   233,   241,    81,    87,
      88,   187,     4,   124,   123,   123,     4,   241,   241,   110,
     233,   182,   208,   228,     4,    76,     4,     4,    76,     4,
      76,   190,     4,   125,   241,   241,   241,    33,    69,    80,
     191,     4,     4,     4,   192,   233,     4,   218,   106
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
#line 425 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 17:
#line 428 "imcc/imcc.y"
    { IMCC_INFO(interp)->state->pragmas |= PR_FASTCALL; }
    break;

  case 18:
#line 430 "imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 19:
#line 438 "imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, yyvsp[-2].s + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, yyvsp[0].s + 1, '"', NULL);
            IMCC_INFO(interp)->HLL_name = hll_name;
            Parrot_register_HLL(interp, hll_name, hll_lib);
            yyval.t = 0;
         }
    break;

  case 20:
#line 450 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 456 "imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 22:
#line 464 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 23:
#line 465 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 24:
#line 469 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 25:
#line 470 "imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 28:
#line 478 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 479 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 480 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 481 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 32:
#line 482 "imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 34:
#line 486 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 35:
#line 488 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 36:
#line 491 "imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
                     yyval.i->r[1] = mk_pcc_sub(interp, str_dup(yyval.i->r[0]->name), 0);
                     add_namespace(interp, cur_unit);
                     yyval.i->r[1]->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 37:
#line 497 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 39:
#line 505 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 40:
#line 507 "imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 43:
#line 522 "imcc/imcc.y"
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

  case 44:
#line 538 "imcc/imcc.y"
    {
                      Symbol * sym = new_symbol(yyvsp[0].s);
                      cur_unit = imc_open_unit(interp, IMC_CLASS);
                      current_class = new_class(sym);
                      sym->p = (void*)current_class;
                      store_symbol(&global_sym_tab, sym); }
    break;

  case 45:
#line 545 "imcc/imcc.y"
    {
                      /* Do nothing for now. Need to parse metadata for
                       * PBC creation. */
                      current_class = NULL;
                      yyval.i = 0; }
    break;

  case 47:
#line 554 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 52:
#line 565 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 570 "imcc/imcc.y"
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

  case 54:
#line 584 "imcc/imcc.y"
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

  case 55:
#line 600 "imcc/imcc.y"
    {
           cur_unit = (IMCC_INFO(interp)->state->pragmas & PR_FASTCALL ?
                  imc_open_unit(interp, IMC_FASTSUB)
                : imc_open_unit(interp, IMC_PCCSUB));
        }
    break;

  case 56:
#line 606 "imcc/imcc.y"
    {
          Instruction *i = iSUBROUTINE(cur_unit, yyvsp[0].sr);
          i->r[1] = cur_call = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
          add_namespace(interp, cur_unit);
        }
    break;

  case 57:
#line 611 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 58:
#line 613 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 59:
#line 617 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 60:
#line 618 "imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 61:
#line 619 "imcc/imcc.y"
    { add_pcc_param(cur_call, yyvsp[-1].sr);}
    break;

  case 62:
#line 623 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 63:
#line 624 "imcc/imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 64:
#line 628 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 65:
#line 629 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 66:
#line 630 "imcc/imcc.y"
    { yyval.t = yyvsp[-2].t; }
    break;

  case 67:
#line 631 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 68:
#line 632 "imcc/imcc.y"
    { yyval.t = P_NONE; }
    break;

  case 69:
#line 635 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 70:
#line 639 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 71:
#line 640 "imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 72:
#line 641 "imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 73:
#line 645 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 74:
#line 646 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 75:
#line 647 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 76:
#line 648 "imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 77:
#line 649 "imcc/imcc.y"
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

  case 80:
#line 667 "imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 81:
#line 669 "imcc/imcc.y"
    {
            Instruction *i = iSUBROUTINE(cur_unit, mk_sub_label(interp, yyvsp[0].s));
            i->r[1] = cur_call = mk_pcc_sub(interp, str_dup(i->r[0]->name), 0);
            add_namespace(interp, cur_unit);

         }
    break;

  case 82:
#line 675 "imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 83:
#line 677 "imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 84:
#line 682 "imcc/imcc.y"
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

  case 85:
#line 709 "imcc/imcc.y"
    { yyval.i = 0; current_call = NULL; }
    break;

  case 86:
#line 713 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 0; }
    break;

  case 87:
#line 714 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->label = 1; }
    break;

  case 88:
#line 718 "imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 89:
#line 720 "imcc/imcc.y"
    { yyval.i = NULL;  current_call->r[0]->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 90:
#line 723 "imcc/imcc.y"
    {  yyval.t = P_PROTOTYPED ; }
    break;

  case 91:
#line 724 "imcc/imcc.y"
    {  yyval.t = P_NON_PROTOTYPED ; }
    break;

  case 92:
#line 728 "imcc/imcc.y"
    {  yyval.t = P_NONE; }
    break;

  case 93:
#line 729 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 94:
#line 730 "imcc/imcc.y"
    { yyval.t |= yyvsp[0].t; }
    break;

  case 96:
#line 734 "imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 97:
#line 735 "imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 98:
#line 736 "imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 99:
#line 737 "imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 100:
#line 738 "imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 101:
#line 739 "imcc/imcc.y"
    {  yyval.t = P_METHOD | P_NONE ; }
    break;

  case 102:
#line 744 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 103:
#line 749 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 104:
#line 751 "imcc/imcc.y"
    {
            add_pcc_sub(current_call->r[0], yyvsp[-1].sr);
            current_call->r[0]->pcc_sub->flags |= isNCI;
         }
    break;

  case 105:
#line 756 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 106:
#line 758 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 107:
#line 760 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], yyvsp[-3].sr);
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 108:
#line 764 "imcc/imcc.y"
    {  add_pcc_sub(current_call->r[0], mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(current_call->r[0], yyvsp[-1].sr);
         }
    break;

  case 109:
#line 770 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 110:
#line 771 "imcc/imcc.y"
    {  add_pcc_arg(current_call->r[0], yyvsp[-1].sr);}
    break;

  case 111:
#line 775 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 112:
#line 776 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 113:
#line 779 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 114:
#line 783 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 115:
#line 784 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(current_call->r[0], yyvsp[-1].sr); }
    break;

  case 116:
#line 789 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 117:
#line 790 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 118:
#line 791 "imcc/imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; }
    break;

  case 119:
#line 795 "imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 120:
#line 796 "imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 123:
#line 806 "imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 124:
#line 809 "imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 125:
#line 810 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 126:
#line 816 "imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 127:
#line 818 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 128:
#line 820 "imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); }
    break;

  case 129:
#line 824 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 130:
#line 825 "imcc/imcc.y"
    {  yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 131:
#line 830 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 132:
#line 835 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 133:
#line 837 "imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 134:
#line 842 "imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 135:
#line 846 "imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 136:
#line 847 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 137:
#line 848 "imcc/imcc.y"
    {  add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 140:
#line 866 "imcc/imcc.y"
    { clear_state(); }
    break;

  case 141:
#line 871 "imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 142:
#line 872 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 143:
#line 873 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 144:
#line 874 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 145:
#line 878 "imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 149:
#line 888 "imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 150:
#line 895 "imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 151:
#line 899 "imcc/imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         }
    break;

  case 152:
#line 907 "imcc/imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        }
    break;

  case 155:
#line 917 "imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 156:
#line 918 "imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 157:
#line 919 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 158:
#line 920 "imcc/imcc.y"
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

  case 159:
#line 932 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 160:
#line 933 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 162:
#line 935 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 163:
#line 936 "imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 164:
#line 937 "imcc/imcc.y"
    { is_def=1; }
    break;

  case 165:
#line 938 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore",
                                1, mk_ident(interp, yyvsp[0].s, yyvsp[-1].t));is_def=0; }
    break;

  case 166:
#line 940 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 167:
#line 941 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "restore", 1, yyvsp[0].sr); }
    break;

  case 168:
#line 942 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 169:
#line 943 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "save", 1, yyvsp[0].sr); }
    break;

  case 170:
#line 944 "imcc/imcc.y"
    { yyval.i = NULL;
                           current_call->r[0]->pcc_sub->flags |= isTAIL_CALL;
                           current_call = NULL;
                        }
    break;

  case 171:
#line 948 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bsr",  1, yyvsp[0].sr); }
    break;

  case 172:
#line 949 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 173:
#line 950 "imcc/imcc.y"
    { expect_pasm = 1; }
    break;

  case 174:
#line 952 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, "newsub",0,regs,nargs,keyvec,1); }
    break;

  case 175:
#line 954 "imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 176:
#line 956 "imcc/imcc.y"
    {  yyval.i = 0; current_call = NULL; }
    break;

  case 177:
#line 957 "imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 179:
#line 959 "imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 180:
#line 963 "imcc/imcc.y"
    { yyval.t = NEWSUB; }
    break;

  case 181:
#line 964 "imcc/imcc.y"
    { yyval.t = NEWCLOSURE; }
    break;

  case 182:
#line 965 "imcc/imcc.y"
    { yyval.t = NEWCOR; }
    break;

  case 183:
#line 966 "imcc/imcc.y"
    { yyval.t = NEWCONT; }
    break;

  case 184:
#line 970 "imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 185:
#line 971 "imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 186:
#line 972 "imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 187:
#line 973 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 188:
#line 974 "imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 189:
#line 975 "imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 190:
#line 980 "imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 191:
#line 990 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 192:
#line 991 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 193:
#line 992 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 194:
#line 993 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 195:
#line 994 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 995 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 197:
#line 996 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 198:
#line 997 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 998 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 999 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 1000 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 1001 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 203:
#line 1003 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 1005 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1007 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1009 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 1011 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1013 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1015 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1017 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 1019 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1021 "imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 213:
#line 1023 "imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 214:
#line 1025 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 215:
#line 1027 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 216:
#line 1029 "imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 217:
#line 1031 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 218:
#line 1033 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1035 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 220:
#line 1037 "imcc/imcc.y"
    { yyval.i = iNEWSUB(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].t,
                                  mk_sub_address(interp, yyvsp[0].s), NULL, 1); }
    break;

  case 221:
#line 1040 "imcc/imcc.y"
    { /* XXX: Fix 4arg version of newsub PASM op
                              * to use  instead of implicit P0
                              */
                              yyval.i = iNEWSUB(interp, cur_unit, NULL, yyvsp[-3].t,
                                           mk_sub_address(interp, yyvsp[-2].s),
                                           mk_sub_address(interp, yyvsp[0].s), 1); }
    break;

  case 222:
#line 1047 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 223:
#line 1050 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 224:
#line 1052 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 225:
#line 1056 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1058 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1060 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 228:
#line 1063 "imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            current_call = NULL;
            yyval.i = 0;
         }
    break;

  case 229:
#line 1069 "imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 230:
#line 1073 "imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           current_call = NULL;
         }
    break;

  case 233:
#line 1083 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 234:
#line 1085 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 235:
#line 1087 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 236:
#line 1089 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 237:
#line 1091 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 238:
#line 1093 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 239:
#line 1095 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 240:
#line 1097 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 241:
#line 1099 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1101 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1103 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1105 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1107 "imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1112 "imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 247:
#line 1118 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 248:
#line 1119 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 249:
#line 1120 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 250:
#line 1125 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 251:
#line 1126 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 252:
#line 1127 "imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 253:
#line 1130 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 254:
#line 1131 "imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 255:
#line 1136 "imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 256:
#line 1141 "imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 257:
#line 1145 "imcc/imcc.y"
    {  yyval.symlist = 0; }
    break;

  case 258:
#line 1146 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 259:
#line 1147 "imcc/imcc.y"
    {  yyval.symlist = 0; add_pcc_arg(current_call->r[0], yyvsp[0].sr); }
    break;

  case 260:
#line 1152 "imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 261:
#line 1153 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 262:
#line 1157 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_FLATTEN; yyval.sr = yyvsp[0].sr; }
    break;

  case 263:
#line 1161 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 264:
#line 1162 "imcc/imcc.y"
    { yyval.symlist = 0; add_pcc_result(current_call->r[0], yyvsp[0].sr); }
    break;

  case 265:
#line 1167 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 266:
#line 1169 "imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 267:
#line 1171 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 268:
#line 1173 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 269:
#line 1175 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 270:
#line 1177 "imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 271:
#line 1181 "imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 272:
#line 1182 "imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 273:
#line 1183 "imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 274:
#line 1184 "imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 275:
#line 1185 "imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 276:
#line 1186 "imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 279:
#line 1195 "imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 280:
#line 1196 "imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 281:
#line 1200 "imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 283:
#line 1205 "imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 284:
#line 1207 "imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 286:
#line 1215 "imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 287:
#line 1219 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 288:
#line 1220 "imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 289:
#line 1224 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 290:
#line 1225 "imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 295:
#line 1238 "imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 296:
#line 1239 "imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 297:
#line 1243 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 298:
#line 1245 "imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 299:
#line 1246 "imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 300:
#line 1247 "imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 301:
#line 1251 "imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 302:
#line 1257 "imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 303:
#line 1259 "imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 304:
#line 1260 "imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 305:
#line 1264 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 306:
#line 1265 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 307:
#line 1266 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 308:
#line 1267 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 309:
#line 1268 "imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 310:
#line 1272 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 311:
#line 1273 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 312:
#line 1274 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 313:
#line 1275 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 314:
#line 1279 "imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 315:
#line 1280 "imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 3630 "imcc/imcparser.c"

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


#line 1285 "imcc/imcc.y"



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

