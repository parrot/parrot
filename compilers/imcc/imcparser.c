/* A Bison parser, made by GNU Bison 1.875.  */

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
#define YYBISON 1

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 1

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
     N_OPERATORS = 261,
     HLL = 262,
     HLL_MAP = 263,
     GOTO = 264,
     ARG = 265,
     IF = 266,
     UNLESS = 267,
     PNULL = 268,
     ADV_FLAT = 269,
     ADV_SLURPY = 270,
     ADV_OPTIONAL = 271,
     ADV_OPT_FLAG = 272,
     ADV_NAMED = 273,
     ADV_ARROW = 274,
     NEW = 275,
     NAMESPACE = 276,
     ENDNAMESPACE = 277,
     DOT_METHOD = 278,
     SUB = 279,
     SYM = 280,
     LOCAL = 281,
     LEXICAL = 282,
     CONST = 283,
     INC = 284,
     DEC = 285,
     GLOBAL_CONST = 286,
     PLUS_ASSIGN = 287,
     MINUS_ASSIGN = 288,
     MUL_ASSIGN = 289,
     DIV_ASSIGN = 290,
     CONCAT_ASSIGN = 291,
     BAND_ASSIGN = 292,
     BOR_ASSIGN = 293,
     BXOR_ASSIGN = 294,
     FDIV = 295,
     FDIV_ASSIGN = 296,
     MOD_ASSIGN = 297,
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
     YIELDT = 320,
     GET_RESULTS = 321,
     POW = 322,
     SHIFT_RIGHT_U = 323,
     LOG_AND = 324,
     LOG_OR = 325,
     COMMA = 326,
     ESUB = 327,
     DOTDOT = 328,
     PCC_BEGIN = 329,
     PCC_END = 330,
     PCC_CALL = 331,
     PCC_SUB = 332,
     PCC_BEGIN_RETURN = 333,
     PCC_END_RETURN = 334,
     PCC_BEGIN_YIELD = 335,
     PCC_END_YIELD = 336,
     NCI_CALL = 337,
     METH_CALL = 338,
     INVOCANT = 339,
     MAIN = 340,
     LOAD = 341,
     IMMEDIATE = 342,
     POSTCOMP = 343,
     METHOD = 344,
     ANON = 345,
     OUTER = 346,
     NEED_LEX = 347,
     MULTI = 348,
     LABEL = 349,
     EMIT = 350,
     EOM = 351,
     IREG = 352,
     NREG = 353,
     SREG = 354,
     PREG = 355,
     IDENTIFIER = 356,
     REG = 357,
     MACRO = 358,
     ENDM = 359,
     STRINGC = 360,
     INTC = 361,
     FLOATC = 362,
     USTRINGC = 363,
     PARROT_OP = 364,
     VAR = 365,
     LINECOMMENT = 366,
     FILECOMMENT = 367,
     DOT = 368,
     CONCAT = 369,
     POINTY = 370
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define N_OPERATORS 261
#define HLL 262
#define HLL_MAP 263
#define GOTO 264
#define ARG 265
#define IF 266
#define UNLESS 267
#define PNULL 268
#define ADV_FLAT 269
#define ADV_SLURPY 270
#define ADV_OPTIONAL 271
#define ADV_OPT_FLAG 272
#define ADV_NAMED 273
#define ADV_ARROW 274
#define NEW 275
#define NAMESPACE 276
#define ENDNAMESPACE 277
#define DOT_METHOD 278
#define SUB 279
#define SYM 280
#define LOCAL 281
#define LEXICAL 282
#define CONST 283
#define INC 284
#define DEC 285
#define GLOBAL_CONST 286
#define PLUS_ASSIGN 287
#define MINUS_ASSIGN 288
#define MUL_ASSIGN 289
#define DIV_ASSIGN 290
#define CONCAT_ASSIGN 291
#define BAND_ASSIGN 292
#define BOR_ASSIGN 293
#define BXOR_ASSIGN 294
#define FDIV 295
#define FDIV_ASSIGN 296
#define MOD_ASSIGN 297
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
#define YIELDT 320
#define GET_RESULTS 321
#define POW 322
#define SHIFT_RIGHT_U 323
#define LOG_AND 324
#define LOG_OR 325
#define COMMA 326
#define ESUB 327
#define DOTDOT 328
#define PCC_BEGIN 329
#define PCC_END 330
#define PCC_CALL 331
#define PCC_SUB 332
#define PCC_BEGIN_RETURN 333
#define PCC_END_RETURN 334
#define PCC_BEGIN_YIELD 335
#define PCC_END_YIELD 336
#define NCI_CALL 337
#define METH_CALL 338
#define INVOCANT 339
#define MAIN 340
#define LOAD 341
#define IMMEDIATE 342
#define POSTCOMP 343
#define METHOD 344
#define ANON 345
#define OUTER 346
#define NEED_LEX 347
#define MULTI 348
#define LABEL 349
#define EMIT 350
#define EOM 351
#define IREG 352
#define NREG 353
#define SREG 354
#define PREG 355
#define IDENTIFIER 356
#define REG 357
#define MACRO 358
#define ENDM 359
#define STRINGC 360
#define INTC 361
#define FLOATC 362
#define USTRINGC 363
#define PARROT_OP 364
#define VAR 365
#define LINECOMMENT 366
#define FILECOMMENT 367
#define DOT 368
#define CONCAT 369
#define POINTY 370




/* Copy the first part of user declarations.  */
#line 1 "compilers\\imcc\\imcc.y"

/*
 * imcc.y
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 * Copyright 2002-2006 The Perl Foundation. All Righs Reserved
 *
 * Grammar for the parser.
 *
 * $Id$
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
 * Some convenient vars
 */
static SymReg *cur_obj, *cur_call;
static char *adv_named_id = NULL;
int cur_pmc_type;      /* used in mk_ident */
IMC_Unit * cur_unit;
SymReg *cur_namespace; /* ugly hack for mk_address */

/*
 * these are used for constructing one INS
 */
static SymReg *keys[IMCC_MAX_FIX_REGS]; /* TODO key overflow check */
static int nkeys, in_slice;
static int keyvec;
#define IMCC_MAX_STATIC_REGS 100
static SymReg *regs[IMCC_MAX_STATIC_REGS];
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
    SymReg *r[IMCC_MAX_FIX_REGS];
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
    for (i = 0; i < n; ++i) {
	r[i] = va_arg(ap, SymReg *);
    }
    va_end(ap);
    return INS(interpreter, unit, opname, fmt, r, n, keyvec, 1);
}

static Instruction*
mk_pmc_const(Parrot_Interp interp, IMC_Unit *unit,
        char *type, SymReg *left, char *constant)
{
    int type_enum = atoi(type);
    SymReg *rhs;
    SymReg *r[2];
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
}

Instruction * INS_LABEL(IMC_Unit * unit, SymReg * r0, int emit)
{

    Instruction *ins;

    ins = _mk_instruction("","%s:", 1, &r0, 0);
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

static Instruction * iSUBROUTINE(Interp *interp, IMC_Unit * unit, SymReg * r) {
    Instruction *i;
    i =  iLABEL(unit, r);
    r->type = VT_PCC_SUB;
    r->pcc_sub = calloc(1, sizeof(struct pcc_sub_t));
    cur_call = r;
    i->line = line - 1;
    add_namespace(interp, unit);
    return i;
}

/*
 * substr or X = P[key]
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
 * substr or P[key] = X
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
    i = iLABEL(cur_unit, r);
    cur_call = r;
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
    cur_call->pcc_sub->sub = sub;
    if (cur_obj) {
        if (cur_obj->set != 'P')
            IMCC_fataly(interp, E_SyntaxError, "object isn't a PMC");
        cur_call->pcc_sub->object = cur_obj;
        cur_obj = NULL;
    }
    if (cur_call->pcc_sub->sub->pmc_type == enum_class_NCI)
        cur_call->pcc_sub->flags |= isNCI;
    if (cur_unit->type == IMC_PCCSUB)
        cur_unit->instructions->r[0]->pcc_sub->calls_a_sub |= 1;
}

static void
begin_return_or_yield(Interp *interp, int yield)
{
    Instruction *i, *ins;
    char name[128];
    ins = cur_unit->instructions;
    if(!ins || !ins->r[0] || ins->r[0]->type != VT_PCC_SUB)
        IMCC_fataly(interp, E_SyntaxError,
              "yield or return directive outside pcc subroutine\n");
    if(yield)
       ins->r[0]->pcc_sub->calls_a_sub = 1 | ITPCCYIELD;
    sprintf(name, yield ? "%cpcc_sub_yield_%d" : "%cpcc_sub_ret_%d", IMCC_INTERNAL_CHAR, cnr++);
    interp->imc_info->sr_return = mk_pcc_sub(interp, str_dup(name), 0);
    i = iLABEL(cur_unit, interp->imc_info->sr_return);
    i->type = yield ? ITPCCSUB | ITLABEL | ITPCCYIELD : ITPCCSUB | ITLABEL ;
    interp->imc_info->asm_state = yield ? AsmInYield : AsmInReturn;
}

static void
set_lexical(Interp *interp, SymReg *r, char *name)
{
    SymReg *n;
    r->usage |= U_LEXICAL;
    n = mk_const(interp, name, 'S');
    /* chain all names in r->reg */
    n->reg = r->reg;
    r->reg = n;
}


static void
add_pcc_named_arg(Interp *interp, SymReg *cur_call, char *name, SymReg *value)
{
    SymReg *r;
    r = mk_const(interp, name, 'S');
    r->type |= VT_NAMED;
    add_pcc_arg(cur_call, r);
    add_pcc_arg(cur_call, value);
}


static void
add_pcc_named_result(Interp *interp, SymReg *cur_call, char *name, SymReg *value)
{
    SymReg *r;
    r = mk_const(interp, name, 'S');
    r->type |= VT_NAMED;
    add_pcc_result(cur_call, r);
    add_pcc_result(cur_call, value);
}


static void
add_pcc_named_param(Interp *interp, SymReg *cur_call, char *name, SymReg *value)
{
    SymReg *r;
    r = mk_const(interp, name, 'S');
    r->type |= VT_NAMED;
    add_pcc_param(cur_call, r);
    add_pcc_param(cur_call, value);
}

static void
add_pcc_named_return(Interp *interp, SymReg *cur_call, char *name, SymReg *value)
{
    SymReg *r;
    r = mk_const(interp, name, 'S');
    r->type |= VT_NAMED;
    add_pcc_return(cur_call, r);
    add_pcc_return(cur_call, value);
}

static void
adv_named_set(Interp *interp, char *name) {
    if (adv_named_id) {
        IMCC_fataly(interp, E_SyntaxError,
                    "Named parameter with more than one name.\n");
    }
    adv_named_id = name;
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

#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 374 "compilers\\imcc\\imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 191 of yacc.c.  */
#line 686 "compilers\\imcc\\imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 214 of yacc.c.  */
#line 698 "compilers\\imcc\\imcparser.c"

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
	 || (YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAXIMUM)

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
	    (To)[yyi] = (From)[yyi];		\
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
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
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
#define YYFINAL  41
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   730

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  132
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  114
/* YYNRULES -- Number of rules. */
#define YYNRULES  324
/* YYNRULES -- Number of states. */
#define YYNSTATES  567

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   370

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   122,     2,     2,     2,   128,   129,     2,
     120,   121,   126,   125,     2,   123,     2,   127,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   131,
       2,   117,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   118,     2,   119,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   130,     2,   124,     2,     2,     2,
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
     116
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    49,
      53,    59,    60,    67,    68,    75,    77,    80,    84,    87,
      89,    91,    93,    95,    96,   100,   101,   106,   109,   114,
     115,   117,   118,   123,   124,   126,   131,   132,   133,   134,
     145,   146,   148,   152,   153,   157,   161,   167,   168,   170,
     175,   180,   185,   186,   190,   192,   194,   196,   198,   200,
     202,   204,   205,   207,   208,   209,   210,   221,   222,   232,
     233,   236,   237,   241,   242,   244,   246,   250,   252,   254,
     256,   258,   260,   262,   264,   266,   268,   274,   278,   282,
     286,   290,   296,   302,   303,   307,   310,   311,   315,   319,
     320,   325,   326,   329,   331,   333,   335,   337,   342,   344,
     346,   348,   350,   351,   357,   359,   360,   363,   367,   371,
     372,   378,   379,   385,   386,   388,   392,   396,   402,   404,
     407,   408,   411,   414,   416,   418,   419,   421,   424,   426,
     428,   432,   434,   438,   440,   442,   445,   448,   449,   454,
     459,   460,   467,   469,   470,   477,   480,   483,   486,   489,
     491,   493,   495,   496,   498,   500,   502,   504,   506,   508,
     510,   514,   519,   524,   529,   535,   541,   547,   553,   559,
     565,   571,   577,   583,   589,   595,   601,   607,   613,   619,
     625,   631,   637,   643,   649,   655,   661,   667,   674,   681,
     688,   696,   701,   706,   713,   721,   726,   731,   736,   741,
     748,   756,   760,   761,   771,   773,   775,   777,   781,   782,
     788,   792,   796,   800,   804,   808,   812,   816,   820,   824,
     828,   832,   836,   840,   845,   847,   849,   851,   855,   859,
     863,   865,   867,   868,   874,   875,   879,   881,   887,   891,
     894,   895,   898,   900,   902,   907,   910,   914,   920,   922,
     926,   927,   934,   941,   947,   953,   958,   963,   968,   973,
     975,   977,   979,   981,   983,   985,   987,   989,   990,   992,
     996,   998,  1000,  1005,  1009,  1011,  1013,  1015,  1017,  1019,
    1021,  1023,  1025,  1027,  1029,  1030,  1033,  1035,  1039,  1040,
    1045,  1047,  1051,  1054,  1057,  1059,  1061,  1063,  1065,  1067,
    1069,  1071,  1073,  1075,  1077
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     133,     0,    -1,   134,    -1,   135,    -1,   134,   135,    -1,
     153,    -1,   140,    -1,   139,    -1,   154,    -1,   168,    -1,
     150,    -1,   104,     4,    -1,   136,    -1,     4,    -1,     6,
     137,     4,    -1,   138,     4,    -1,     7,   107,    -1,     8,
     106,    72,   106,    -1,     9,   107,    72,   107,    -1,    61,
     209,   102,    -1,    61,   209,   102,   117,   244,    -1,    -1,
      29,   141,   209,   102,   117,   244,    -1,    -1,    29,   143,
     107,   236,   117,   106,    -1,   145,    -1,   144,   145,    -1,
     200,   146,     4,    -1,   104,     4,    -1,   113,    -1,   112,
      -1,   153,    -1,   142,    -1,    -1,   147,   110,   149,    -1,
      -1,    78,   148,   176,    95,    -1,    14,   237,    -1,    28,
     106,    72,   103,    -1,    -1,   230,    -1,    -1,    96,   151,
     152,    97,    -1,    -1,   144,    -1,    22,   118,   238,   119,
      -1,    -1,    -1,    -1,    25,   155,   233,   156,   176,     4,
     157,   158,   167,    73,    -1,    -1,     4,    -1,   158,   159,
       4,    -1,    -1,     5,   160,   161,    -1,   209,   102,   185,
      -1,   209,   106,    20,   102,   185,    -1,    -1,    72,    -1,
      94,   120,   165,   121,    -1,    92,   120,   106,   121,    -1,
      92,   120,   102,   121,    -1,    -1,   165,    72,   166,    -1,
     166,    -1,    49,    -1,    50,    -1,    52,    -1,    51,    -1,
     102,    -1,   106,    -1,    -1,   197,    -1,    -1,    -1,    -1,
      78,   169,   102,   170,   176,     4,   171,   158,   167,    73,
      -1,    -1,    75,     4,   173,   180,   175,   179,   174,   182,
      76,    -1,    -1,   202,     4,    -1,    -1,    85,   237,     4,
      -1,    -1,   177,    -1,   178,    -1,   177,   162,   178,    -1,
      87,    -1,    86,    -1,    88,    -1,    89,    -1,    91,    -1,
      90,    -1,    93,    -1,   163,    -1,   164,    -1,    77,   237,
      72,   237,     4,    -1,    77,   237,     4,    -1,    83,   237,
       4,    -1,    84,   229,     4,    -1,    84,   106,     4,    -1,
      84,   229,    72,   237,     4,    -1,    84,   106,    72,   237,
       4,    -1,    -1,   180,   181,     4,    -1,    11,   222,    -1,
      -1,   182,   183,     4,    -1,    64,   229,   185,    -1,    -1,
      27,   184,   209,   102,    -1,    -1,   185,   186,    -1,    16,
      -1,    17,    -1,    18,    -1,    19,    -1,    19,   120,   106,
     121,    -1,    79,    -1,    81,    -1,    80,    -1,    82,    -1,
      -1,   187,     4,   190,   191,   188,    -1,   193,    -1,    -1,
     191,     4,    -1,   191,   192,     4,    -1,    65,   237,   223,
      -1,    -1,    65,   120,   194,   196,   121,    -1,    -1,    66,
     120,   195,   196,   121,    -1,    -1,   222,    -1,   106,    20,
     237,    -1,   196,    72,   222,    -1,   196,    72,   106,    20,
     237,    -1,   199,    -1,   197,   199,    -1,    -1,   198,   203,
      -1,   104,     4,    -1,   113,    -1,   112,    -1,    -1,   201,
      -1,   201,   202,    -1,   202,    -1,    95,    -1,   200,   205,
       4,    -1,   102,    -1,   204,    72,   102,    -1,   211,    -1,
     227,    -1,    22,   102,    -1,    23,   102,    -1,    -1,    27,
     206,   209,   204,    -1,    28,   106,    72,   229,    -1,    -1,
      29,   207,   209,   102,   117,   244,    -1,   142,    -1,    -1,
      32,   208,   209,   102,   117,   244,    -1,    65,   219,    -1,
      10,   235,    -1,   110,   230,    -1,    14,   237,    -1,   219,
      -1,   172,    -1,   189,    -1,    -1,    49,    -1,    50,    -1,
      51,    -1,    52,    -1,    53,    -1,   210,    -1,   102,    -1,
     229,   117,   237,    -1,   229,   117,   122,   237,    -1,   229,
     117,   123,   237,    -1,   229,   117,   124,   237,    -1,   229,
     117,   237,   125,   237,    -1,   229,   117,   237,   123,   237,
      -1,   229,   117,   237,   126,   237,    -1,   229,   117,   237,
      68,   237,    -1,   229,   117,   237,   127,   237,    -1,   229,
     117,   237,    41,   237,    -1,   229,   117,   237,   128,   237,
      -1,   229,   117,   237,   115,   237,    -1,   229,   117,   237,
      55,   237,    -1,   229,   117,   237,    56,   237,    -1,   229,
     117,   237,    57,   237,    -1,   229,   117,   237,    59,   237,
      -1,   229,   117,   237,    60,   237,    -1,   229,   117,   237,
      58,   237,    -1,   229,   117,   237,    47,   237,    -1,   229,
     117,   237,    48,   237,    -1,   229,   117,   237,    69,   237,
      -1,   229,   117,   237,    70,   237,    -1,   229,   117,   237,
      71,   237,    -1,   229,   117,   237,    54,   237,    -1,   229,
     117,   237,   129,   237,    -1,   229,   117,   237,   130,   237,
      -1,   229,   117,   237,   124,   237,    -1,   229,   117,   237,
     118,   238,   119,    -1,   229,   118,   238,   119,   117,   237,
      -1,   229,   117,    21,   210,    72,   237,    -1,   229,   117,
      21,   210,   118,   238,   119,    -1,   229,   117,    21,   210,
      -1,   229,   117,    21,   237,    -1,   229,   117,    21,   237,
      72,   237,    -1,   229,   117,    21,   237,   118,   238,   119,
      -1,   229,   117,    63,   102,    -1,   229,   117,    62,   245,
      -1,    62,   245,   117,   237,    -1,    21,   229,    72,   237,
      -1,    21,   229,    72,   237,    72,   237,    -1,    21,   229,
      72,   237,   118,   238,   119,    -1,   229,   117,   219,    -1,
      -1,   120,   212,   226,   121,   117,   217,   120,   221,   121,
      -1,   213,    -1,   215,    -1,   216,    -1,   229,   117,    14,
      -1,    -1,    67,   214,   120,   226,   121,    -1,   229,    33,
     237,    -1,   229,    34,   237,    -1,   229,    35,   237,    -1,
     229,    36,   237,    -1,   229,    43,   237,    -1,   229,    42,
     237,    -1,   229,    37,   237,    -1,   229,    38,   237,    -1,
     229,    39,   237,    -1,   229,    40,   237,    -1,   229,    44,
     237,    -1,   229,    45,   237,    -1,   229,    46,   237,    -1,
     229,   117,   110,   149,    -1,   102,    -1,   106,    -1,   229,
      -1,   229,   218,   234,    -1,   229,   218,   106,    -1,   229,
     218,   229,    -1,   116,    -1,   114,    -1,    -1,   217,   220,
     120,   221,   121,    -1,    -1,   221,    72,   222,    -1,   222,
      -1,   221,    72,   106,    20,   237,    -1,   106,    20,   237,
      -1,   237,   223,    -1,    -1,   223,   224,    -1,    15,    -1,
      19,    -1,    19,   120,   106,   121,    -1,   229,   185,    -1,
     226,    72,   225,    -1,   226,    72,   106,    20,   229,    -1,
     225,    -1,   106,    20,   229,    -1,    -1,    12,   237,   228,
     237,    10,   235,    -1,    13,   237,   228,   237,    10,   235,
      -1,    12,    14,   237,    10,   235,    -1,    13,    14,   237,
      10,   235,    -1,    12,   237,    10,   235,    -1,    13,   237,
      10,   235,    -1,    12,   237,    72,   235,    -1,    13,   237,
      72,   235,    -1,    55,    -1,    56,    -1,    57,    -1,    58,
      -1,    59,    -1,    60,    -1,   111,    -1,   243,    -1,    -1,
     231,    -1,   231,    72,   232,    -1,   232,    -1,   236,    -1,
     229,   118,   238,   119,    -1,   118,   238,   119,    -1,   234,
      -1,   106,    -1,   102,    -1,   110,    -1,   102,    -1,   110,
      -1,   235,    -1,   237,    -1,   229,    -1,   244,    -1,    -1,
     239,   240,    -1,   242,    -1,   240,   131,   242,    -1,    -1,
     240,    72,   241,   242,    -1,   237,    -1,   237,    74,   237,
      -1,    74,   237,    -1,   237,    74,    -1,    98,    -1,    99,
      -1,   100,    -1,   101,    -1,   103,    -1,   107,    -1,   108,
      -1,   106,    -1,   109,    -1,   100,    -1,   106,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   456,   456,   460,   461,   465,   466,   467,   468,   469,
     470,   471,   472,   473,   476,   477,   480,   488,   497,   506,
     512,   521,   521,   526,   526,   530,   531,   535,   536,   537,
     538,   539,   540,   543,   543,   548,   547,   558,   560,   565,
     569,   573,   573,   583,   585,   589,   606,   610,   613,   605,
     619,   620,   621,   630,   630,   634,   636,   642,   643,   647,
     650,   653,   659,   660,   661,   665,   666,   667,   668,   669,
     679,   691,   693,   697,   699,   703,   697,   710,   709,   741,
     742,   746,   747,   752,   753,   757,   758,   762,   763,   764,
     765,   766,   767,   768,   769,   770,   774,   779,   781,   786,
     788,   790,   794,   802,   803,   807,   812,   813,   817,   818,
     818,   823,   824,   828,   829,   830,   831,   832,   837,   838,
     842,   843,   848,   847,   852,   858,   859,   862,   868,   873,
     872,   880,   879,   889,   890,   896,   898,   904,   910,   911,
     923,   927,   929,   930,   931,   935,   936,   940,   941,   945,
     951,   955,   963,   972,   973,   974,   975,   976,   976,   989,
     993,   993,   995,   996,   996,   998,  1002,  1003,  1006,  1008,
    1009,  1010,  1011,  1015,  1016,  1017,  1018,  1019,  1020,  1024,
    1035,  1036,  1037,  1038,  1039,  1040,  1041,  1042,  1043,  1044,
    1045,  1046,  1047,  1048,  1049,  1050,  1051,  1052,  1053,  1055,
    1057,  1059,  1061,  1063,  1065,  1067,  1069,  1071,  1073,  1075,
    1077,  1079,  1081,  1083,  1085,  1087,  1090,  1092,  1096,  1098,
    1100,  1103,  1110,  1109,  1118,  1119,  1120,  1121,  1125,  1125,
    1131,  1133,  1135,  1137,  1139,  1141,  1143,  1145,  1147,  1149,
    1151,  1153,  1155,  1160,  1167,  1168,  1169,  1174,  1175,  1176,
    1179,  1180,  1185,  1184,  1194,  1195,  1201,  1207,  1209,  1213,
    1217,  1218,  1222,  1223,  1224,  1227,  1231,  1237,  1239,  1245,
    1246,  1250,  1252,  1254,  1256,  1258,  1260,  1262,  1264,  1269,
    1270,  1271,  1272,  1273,  1274,  1278,  1279,  1283,  1284,  1288,
    1289,  1293,  1294,  1300,  1307,  1308,  1312,  1313,  1317,  1318,
    1322,  1323,  1327,  1328,  1331,  1331,  1336,  1337,  1339,  1339,
    1344,  1349,  1352,  1353,  1357,  1358,  1359,  1360,  1361,  1365,
    1366,  1367,  1368,  1372,  1373
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "LOW_PREC", "'\\n'", "PARAM", "PRAGMA", 
  "N_OPERATORS", "HLL", "HLL_MAP", "GOTO", "ARG", "IF", "UNLESS", "PNULL", 
  "ADV_FLAT", "ADV_SLURPY", "ADV_OPTIONAL", "ADV_OPT_FLAG", "ADV_NAMED", 
  "ADV_ARROW", "NEW", "NAMESPACE", "ENDNAMESPACE", "DOT_METHOD", "SUB", 
  "SYM", "LOCAL", "LEXICAL", "CONST", "INC", "DEC", "GLOBAL_CONST", 
  "PLUS_ASSIGN", "MINUS_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", 
  "CONCAT_ASSIGN", "BAND_ASSIGN", "BOR_ASSIGN", "BXOR_ASSIGN", "FDIV", 
  "FDIV_ASSIGN", "MOD_ASSIGN", "SHR_ASSIGN", "SHL_ASSIGN", "SHR_U_ASSIGN", 
  "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", "PMCV", 
  "OBJECTV", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", 
  "RELOP_LT", "RELOP_LTE", "GLOBAL", "GLOBALOP", "ADDR", "RESULT", 
  "RETURN", "YIELDT", "GET_RESULTS", "POW", "SHIFT_RIGHT_U", "LOG_AND", 
  "LOG_OR", "COMMA", "ESUB", "DOTDOT", "PCC_BEGIN", "PCC_END", "PCC_CALL", 
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "NCI_CALL", "METH_CALL", "INVOCANT", "MAIN", "LOAD", 
  "IMMEDIATE", "POSTCOMP", "METHOD", "ANON", "OUTER", "NEED_LEX", "MULTI", 
  "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", 
  "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", "USTRINGC", 
  "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", "CONCAT", 
  "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'", "'~'", "'+'", 
  "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", "program", 
  "compilation_units", "compilation_unit", "pragma", "pragma_1", 
  "hll_def", "global", "constdef", "@1", "pmc_const", "@2", "pasmcode", 
  "pasmline", "pasm_inst", "@3", "@4", "pasm_args", "emit", "@5", 
  "opt_pasmcode", "class_namespace", "sub", "@6", "@7", "@8", 
  "sub_params", "sub_param", "@9", "sub_param_type_def", "opt_comma", 
  "multi", "outer", "multi_types", "multi_type", "sub_body", "pcc_sub", 
  "@10", "@11", "@12", "pcc_sub_call", "@13", "opt_label", "opt_invocant", 
  "sub_proto", "sub_proto_list", "proto", "pcc_call", "pcc_args", 
  "pcc_arg", "pcc_results", "pcc_result", "@14", "paramtype_list", 
  "paramtype", "begin_ret_or_yield", "end_ret_or_yield", "pcc_ret", "@15", 
  "pcc_returns", "pcc_return", "pcc_return_many", "@16", "@17", 
  "var_returns", "statements", "helper_clear_state", "statement", 
  "labels", "_labels", "label", "instruction", "id_list", "labeled_inst", 
  "@18", "@19", "@20", "type", "classname", "assignment", "@21", 
  "get_results", "@22", "op_assign", "func_assign", "the_sub", "ptr", 
  "sub_call", "@23", "arglist", "arg", "argtype_list", "argtype", 
  "result", "targetlist", "if_statement", "relop", "target", "vars", 
  "_vars", "_var_or_i", "sub_label_op_c", "sub_label_op", "label_op", 
  "var_or_i", "var", "keylist", "@24", "_keylist", "@25", "key", "reg", 
  "const", "string", 0
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
     364,   365,   366,   367,   368,   369,   370,    61,    91,    93,
      40,    41,    33,    45,   126,    43,    42,    47,    37,    38,
     124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   132,   133,   134,   134,   135,   135,   135,   135,   135,
     135,   135,   135,   135,   136,   136,   137,   138,   138,   139,
     139,   141,   140,   143,   142,   144,   144,   145,   145,   145,
     145,   145,   145,   147,   146,   148,   146,   146,   146,   146,
     149,   151,   150,   152,   152,   153,   155,   156,   157,   154,
     158,   158,   158,   160,   159,   161,   161,   162,   162,   163,
     164,   164,   165,   165,   165,   166,   166,   166,   166,   166,
     166,   167,   167,   169,   170,   171,   168,   173,   172,   174,
     174,   175,   175,   176,   176,   177,   177,   178,   178,   178,
     178,   178,   178,   178,   178,   178,   179,   179,   179,   179,
     179,   179,   179,   180,   180,   181,   182,   182,   183,   184,
     183,   185,   185,   186,   186,   186,   186,   186,   187,   187,
     188,   188,   190,   189,   189,   191,   191,   191,   192,   194,
     193,   195,   193,   196,   196,   196,   196,   196,   197,   197,
     198,   199,   199,   199,   199,   200,   200,   201,   201,   202,
     203,   204,   204,   205,   205,   205,   205,   206,   205,   205,
     207,   205,   205,   208,   205,   205,   205,   205,   205,   205,
     205,   205,   205,   209,   209,   209,   209,   209,   209,   210,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   211,   211,   211,   211,   211,   211,   211,   211,
     211,   211,   212,   211,   211,   211,   211,   211,   214,   213,
     215,   215,   215,   215,   215,   215,   215,   215,   215,   215,
     215,   215,   215,   216,   217,   217,   217,   217,   217,   217,
     218,   218,   220,   219,   221,   221,   221,   221,   221,   222,
     223,   223,   224,   224,   224,   225,   226,   226,   226,   226,
     226,   227,   227,   227,   227,   227,   227,   227,   227,   228,
     228,   228,   228,   228,   228,   229,   229,   230,   230,   231,
     231,   232,   232,   232,   233,   233,   234,   234,   235,   235,
     236,   236,   237,   237,   239,   238,   240,   240,   241,   240,
     242,   242,   242,   242,   243,   243,   243,   243,   243,   244,
     244,   244,   244,   245,   245
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     4,     3,
       5,     0,     6,     0,     6,     1,     2,     3,     2,     1,
       1,     1,     1,     0,     3,     0,     4,     2,     4,     0,
       1,     0,     4,     0,     1,     4,     0,     0,     0,    10,
       0,     1,     3,     0,     3,     3,     5,     0,     1,     4,
       4,     4,     0,     3,     1,     1,     1,     1,     1,     1,
       1,     0,     1,     0,     0,     0,    10,     0,     9,     0,
       2,     0,     3,     0,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     5,     3,     3,     3,
       3,     5,     5,     0,     3,     2,     0,     3,     3,     0,
       4,     0,     2,     1,     1,     1,     1,     4,     1,     1,
       1,     1,     0,     5,     1,     0,     2,     3,     3,     0,
       5,     0,     5,     0,     1,     3,     3,     5,     1,     2,
       0,     2,     2,     1,     1,     0,     1,     2,     1,     1,
       3,     1,     3,     1,     1,     2,     2,     0,     4,     4,
       0,     6,     1,     0,     6,     2,     2,     2,     2,     1,
       1,     1,     0,     1,     1,     1,     1,     1,     1,     1,
       3,     4,     4,     4,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     6,     6,     6,
       7,     4,     4,     6,     7,     4,     4,     4,     4,     6,
       7,     3,     0,     9,     1,     1,     1,     3,     0,     5,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     4,     1,     1,     1,     3,     3,     3,
       1,     1,     0,     5,     0,     3,     1,     5,     3,     2,
       0,     2,     1,     1,     4,     2,     3,     5,     1,     3,
       0,     6,     6,     5,     5,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     0,     2,     1,     3,     0,     4,
       1,     3,     2,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,     0,    46,    21,     0,    73,
      41,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   304,     0,     0,
     173,   174,   175,   176,   177,   179,     0,   178,     0,   145,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     296,   295,   297,    47,   294,     0,    19,    74,    23,   149,
       0,    30,    29,    32,   145,    25,     0,    31,    33,   146,
     148,    17,    18,    45,     0,   314,   315,   316,   317,   318,
     321,   319,   320,   322,   285,   302,   310,   305,   306,   286,
     303,    83,     0,     0,    83,     0,    28,    26,    42,     0,
       0,    35,     0,     0,   147,   312,   313,   308,     0,    88,
      87,    89,    90,    92,    91,     0,    93,     0,    94,    95,
       0,    57,    85,     0,    20,     0,     0,    37,     0,    83,
      27,   287,   311,     0,   307,     0,    62,    48,    58,     0,
      22,    75,   298,   299,   300,     0,   301,     0,     0,   304,
      34,   302,    40,   288,   290,   291,   309,     0,     0,    65,
      66,    68,    67,    69,    70,     0,    64,    50,    86,    50,
       0,    38,    36,     0,   304,     0,    61,    60,     0,    59,
      51,   140,   140,    24,   293,     0,   289,    63,    53,     0,
     144,   143,     0,     0,   140,   145,   138,     0,   292,     0,
     142,    52,    49,   139,   172,   141,    76,    54,     0,     0,
       0,     0,     0,     0,     0,     0,   157,     0,   160,   163,
       0,     0,     0,   228,     0,   118,   119,   244,   245,   287,
     222,   162,   170,     0,   171,   124,     0,   153,   224,   225,
     226,   252,   169,   154,   246,   111,     0,   166,     0,     0,
       0,     0,   168,     0,   155,   156,     0,     0,     0,     0,
     323,   324,     0,   129,   165,   246,   131,     0,    77,   167,
     270,   122,   150,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   251,   250,     0,
     304,     0,    55,     0,     0,     0,   279,   280,   281,   282,
     283,   284,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   133,   133,   270,   103,     0,   268,
       0,   111,   125,   254,   230,   231,   232,   233,   236,   237,
     238,   239,   235,   234,   240,   241,   242,   227,     0,     0,
       0,   321,   287,     0,     0,     0,   221,   302,   180,     0,
     248,   249,   247,   113,   114,   115,   116,   112,   111,     0,
     275,   277,     0,     0,   276,   278,     0,   218,   151,   158,
     159,     0,     0,   217,   321,     0,   134,   260,     0,     0,
      81,     0,     0,     0,   265,     0,   321,     0,   256,   211,
     212,   216,   215,   243,   181,   182,   183,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   304,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    56,   273,     0,   274,     0,     0,   304,
       0,     0,     0,     0,     0,   130,   259,   132,   229,     0,
       0,     0,     0,   269,     0,   266,     0,   126,     0,   120,
     121,   123,     0,     0,     0,   253,     0,   304,     0,   304,
     189,   198,   199,   203,   192,   193,   194,   197,   195,   196,
     187,   200,   201,   202,   191,     0,   185,   206,   184,   186,
     188,   190,   204,   205,     0,     0,   271,   272,   219,     0,
     152,   161,   164,   135,   321,   136,   262,   263,   261,   105,
       0,     0,     0,     0,    79,   104,     0,     0,   260,   127,
     258,   321,   255,   209,     0,   213,     0,   207,   208,   117,
     220,     0,     0,    82,     0,     0,     0,     0,   106,     0,
     267,   254,   128,     0,   210,   214,   137,     0,    97,     0,
      98,   100,     0,    99,     0,     0,    80,     0,   257,   264,
       0,     0,     0,   109,     0,    78,     0,   223,    96,   102,
     101,     0,   111,   107,     0,   108,   110
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      63,    95,    64,    65,   102,   103,   129,   150,    19,    39,
      66,    20,    21,    28,    91,   167,   181,   192,   199,   207,
     139,   118,   119,   165,   166,   193,    22,    38,    94,   169,
     232,   317,   528,   441,   120,   121,   122,   504,   380,   442,
     545,   556,   561,   292,   357,   233,   451,   234,   322,   385,
     452,   235,   314,   315,   375,   194,   195,   196,    68,    69,
      70,   205,   369,   236,   256,   258,   259,    36,    37,   237,
     270,   238,   267,   239,   240,   241,   291,   242,   273,   387,
     376,   436,   498,   319,   320,   243,   303,    85,   152,   153,
     154,    53,    54,   144,   155,   377,    48,    49,    87,   133,
      88,    89,    90,   262
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -318
static const short yypact[] =
{
      70,  -318,    16,   -71,   -53,   -52,  -318,  -318,    -5,  -318,
    -318,   117,   136,    70,  -318,  -318,   133,  -318,  -318,  -318,
    -318,  -318,  -318,    43,   152,    79,    92,  -318,   -49,    -5,
    -318,  -318,  -318,  -318,  -318,  -318,    63,  -318,    71,    48,
    -318,  -318,  -318,  -318,  -318,  -318,    72,    87,    80,   236,
    -318,  -318,  -318,  -318,  -318,   115,   102,  -318,  -318,  -318,
     216,  -318,  -318,  -318,   155,  -318,   127,  -318,    15,   131,
    -318,  -318,  -318,  -318,   482,  -318,  -318,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,  -318,  -318,   154,   -58,  -318,  -318,
    -318,   636,   130,   147,   636,   144,  -318,  -318,  -318,   482,
     156,  -318,   257,   159,  -318,  -318,   482,  -318,   236,  -318,
    -318,  -318,  -318,  -318,  -318,   143,  -318,   157,  -318,  -318,
     271,     8,  -318,   147,  -318,   274,   454,  -318,   213,   636,
    -318,   344,  -318,   236,  -318,    56,    90,  -318,  -318,   636,
    -318,  -318,  -318,  -318,  -318,   169,  -318,   193,   202,  -318,
    -318,   180,  -318,   231,  -318,  -318,  -318,   183,   184,  -318,
    -318,  -318,  -318,  -318,  -318,   -63,  -318,   303,  -318,   303,
     203,  -318,  -318,   189,  -318,   344,  -318,  -318,    90,  -318,
    -318,    21,    21,  -318,  -318,   195,  -318,  -318,  -318,   308,
    -318,  -318,   319,   260,   145,   131,  -318,   265,  -318,    -5,
    -318,  -318,  -318,  -318,   406,  -318,  -318,  -318,    73,    44,
      82,   173,   482,   103,   244,   246,  -318,   243,   262,  -318,
     -64,   281,   230,  -318,   347,  -318,  -318,  -318,  -318,   344,
    -318,  -318,  -318,   349,  -318,  -318,   374,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,   282,  -318,   366,  -318,   482,   153,
     482,   234,  -318,   316,  -318,  -318,    -5,   317,    -5,    -5,
    -318,  -318,   276,  -318,  -318,    84,  -318,   275,  -318,  -318,
     592,  -318,  -318,   283,   482,   482,   482,   482,   482,   482,
     482,   482,   482,   482,   482,   482,   482,  -318,  -318,     6,
    -318,   569,   313,   289,   384,    44,  -318,  -318,  -318,  -318,
    -318,  -318,    44,   482,   392,    44,    44,   482,   482,   302,
     103,   304,   305,   482,   513,   513,   592,  -318,   388,  -318,
     -62,  -318,  -318,   527,  -318,  -318,  -318,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,  -318,  -318,  -318,  -318,   468,   -64,
     309,   294,   344,   482,   482,   482,  -318,    33,   480,   298,
    -318,  -318,  -318,  -318,  -318,  -318,   301,  -318,  -318,    44,
    -318,  -318,   412,    44,  -318,  -318,   413,   -51,  -318,   352,
    -318,   314,   315,  -318,   405,   -57,  -318,  -318,   -50,   -21,
      -3,   103,   601,   320,   313,     7,   410,     3,  -318,    39,
      54,  -318,  -318,  -318,  -318,  -318,  -318,   482,   482,   482,
     482,   482,   482,   482,   482,   482,   482,   482,   482,   482,
     482,   482,  -318,   482,   482,   482,   482,   482,   482,   482,
     482,   322,   334,   313,  -318,    44,  -318,    44,   482,  -318,
     324,   147,   147,   482,   541,  -318,    19,  -318,  -318,   482,
     482,   -44,   444,  -318,   429,  -318,   583,  -318,   482,  -318,
    -318,  -318,   452,   482,   555,  -318,   482,  -318,   482,  -318,
    -318,  -318,  -318,  -318,  -318,  -318,  -318,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,  -318,   338,  -318,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,   482,   340,  -318,  -318,  -318,   345,
    -318,  -318,  -318,  -318,   443,  -318,  -318,   346,  -318,  -318,
     461,   482,   482,   610,   131,  -318,   103,   350,  -318,  -318,
    -318,   447,  -318,  -318,   355,  -318,   356,  -318,  -318,  -318,
    -318,   482,   363,  -318,    12,   472,    13,    14,  -318,   473,
    -318,   527,    19,   482,  -318,  -318,  -318,   358,  -318,   482,
    -318,  -318,   482,  -318,   482,   -14,  -318,    50,  -318,  -318,
     476,   478,   479,  -318,   103,  -318,   484,  -318,  -318,  -318,
    -318,    -5,  -318,  -318,   382,   313,  -318
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -318,  -318,  -318,   481,  -318,  -318,  -318,  -318,  -318,  -318,
     285,  -318,  -318,   422,  -318,  -318,  -318,   149,  -318,  -318,
    -318,   -15,  -318,  -318,  -318,  -318,   323,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,   325,   311,  -318,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,   -69,  -318,   359,  -318,  -318,  -318,
    -318,  -318,  -318,  -317,  -318,  -318,  -318,  -318,  -318,  -318,
    -318,  -318,  -318,  -318,   182,  -318,  -318,   306,   300,  -318,
     -68,  -318,  -318,  -318,  -318,  -318,  -318,   -29,   164,  -318,
    -318,  -318,  -318,  -318,  -318,    64,  -318,  -169,  -318,   -20,
    -316,     5,  -318,   132,   199,  -318,   267,   -94,   290,  -318,
     348,  -318,   229,  -204,   396,   -43,  -146,  -318,  -318,  -318,
     -78,  -318,   -91,   185
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -247
static const short yytable[] =
{
      55,   104,   124,   173,   384,   247,    86,   388,   439,   178,
     382,   447,   -84,   553,   107,   434,   538,   541,   543,   -39,
     337,   428,   434,    23,    67,   125,   188,   338,   185,    99,
     134,   105,   140,   501,   496,    25,   260,   151,   497,   502,
     503,   423,   261,   100,    30,    31,    32,    33,    34,    67,
     554,   382,   264,    50,    26,   156,   127,    51,   179,   383,
     148,    52,   555,   132,   435,    86,    27,   429,   339,   340,
       5,   437,   448,   108,     1,   454,     2,    58,     3,     4,
     138,   151,   440,   146,   539,   542,   544,   449,   146,   450,
      86,   360,     5,   101,   -71,     6,   248,    35,   361,     7,
     438,   364,   365,   -84,    75,    76,    77,    78,   227,    79,
     244,   456,   341,    81,    82,    83,   342,    84,   495,   253,
     346,    40,   454,   499,   455,   189,   458,   265,   343,   344,
     345,     8,   146,   190,   191,   151,    41,    43,   512,   159,
     160,   161,   162,    59,   349,   -43,   142,   287,     9,   288,
      44,    46,    60,  -246,   143,   424,    45,   457,   157,   426,
      61,    62,   158,   295,    47,    56,    10,   249,   251,   252,
     208,   557,   459,    57,    11,   245,   321,     5,    71,   246,
      75,    76,    77,    78,    58,    79,   146,   250,    80,    81,
      82,    83,   163,    84,    72,   347,   164,   351,   287,    73,
     288,    75,    76,    77,    78,   294,    79,   304,   296,   297,
     298,   299,   300,   301,    84,   388,   370,    92,   -72,    93,
      96,   486,   321,   487,    98,   302,    59,   309,   106,   311,
     312,   324,   325,   326,   327,   328,   329,   330,   331,   332,
     333,   334,   335,   336,   305,   565,   348,   123,   151,   189,
      59,   126,   -44,    80,    81,    82,    83,   190,   191,    60,
     362,   130,   128,   135,   366,   367,   475,    61,    62,   131,
     373,    75,    76,    77,    78,   137,    79,   136,   141,    80,
      81,    82,    83,   489,    84,   147,   170,   443,   321,   296,
     297,   298,   299,   300,   301,   390,   171,   172,   174,   146,
     394,   395,   396,   175,   176,   177,   306,   180,   184,   183,
      74,   514,   200,   516,   198,   274,   275,   276,   277,   278,
     279,   280,   281,   201,   282,   283,   284,   285,   286,   353,
     354,   355,   356,   202,    75,    76,    77,    78,   206,    79,
     491,   492,    80,    81,    82,    83,   254,    84,   255,   257,
     266,   268,   265,   271,   460,   461,   462,   463,   464,   465,
     466,   467,   468,   469,   470,   471,   472,   473,   474,   -23,
     476,   477,   478,   479,   480,   481,   482,   483,   272,    75,
      76,    77,    78,   227,    79,   488,   293,   228,   308,   310,
     493,   358,    84,   313,   359,   316,   287,   500,   288,   289,
     290,   263,   363,   323,   368,   508,   371,   372,   381,   527,
     510,   392,   530,   513,  -245,   515,   209,   421,   210,   211,
     212,   422,   425,   427,   430,   433,   490,   213,   214,   215,
     453,   431,   432,   216,   217,   218,   529,   446,   219,   484,
     485,   518,    75,    76,    77,    78,   142,    79,   505,   506,
      80,    81,    82,    83,   143,    84,   509,   517,   524,   525,
     562,   519,   149,   521,   520,   523,   522,   533,   220,   537,
     531,   221,   222,   223,   534,   535,   540,   546,   536,   549,
     558,   224,   559,   560,   566,   225,    97,   226,   563,   231,
     548,   393,   182,   197,    42,   204,   550,   378,   168,   551,
     203,   552,   389,   187,    75,    76,    77,    78,   227,    79,
     507,   547,   228,   532,   445,   379,   229,    84,   307,   269,
     352,   397,   145,   186,   391,     0,   230,   398,   399,     0,
       0,     0,   564,     0,   400,   401,   402,   403,   404,   405,
     406,     0,     0,     0,     0,     0,     0,     0,   407,   408,
     409,   410,    75,    76,    77,    78,   142,    79,     0,     0,
      80,    81,    82,    83,   143,    84,    75,    76,    77,    78,
      35,    79,     0,     0,    80,    81,    82,    83,     0,    84,
      75,    76,    77,    78,     0,    79,     0,     0,    80,    81,
      82,    83,     0,    84,     0,   411,     0,     0,   412,     0,
       0,     0,     0,   413,   414,   415,   416,   417,   418,   419,
     420,    75,    76,    77,    78,     0,    79,     0,     0,   374,
      81,    82,    83,     0,    84,    75,    76,    77,    78,     0,
      79,     0,     0,   386,    81,    82,    83,     0,    84,    75,
      76,    77,    78,     0,    79,     0,     0,   494,    81,    82,
      83,     0,    84,    75,    76,    77,    78,     0,    79,     0,
       0,   511,    81,    82,    83,     0,    84,    75,    76,    77,
      78,    50,    79,     0,     0,   350,     0,     0,     0,    52,
      84,    75,    76,    77,    78,   227,    79,     0,     0,   228,
      75,    76,    77,    78,    84,    79,     0,     0,   318,    75,
      76,    77,    78,    84,    79,     0,     0,   444,    75,    76,
      77,    78,    84,    79,     0,     0,   526,     0,     0,     0,
       0,    84,   109,   110,   111,   112,   113,   114,   115,   116,
     117
};

static const short yycheck[] =
{
      29,    69,    93,   149,   321,   209,    49,   323,    11,    72,
      72,     4,     4,    27,    72,    72,     4,     4,     4,     4,
      14,    72,    72,     7,    39,    94,     5,    21,   174,    14,
     108,    74,   123,    77,    15,   106,   100,   131,    19,    83,
      84,   358,   106,    28,    49,    50,    51,    52,    53,    64,
      64,    72,   221,   102,   107,   133,    99,   106,   121,   121,
     129,   110,    76,   106,   121,   108,   118,   118,    62,    63,
      22,   121,    65,   131,     4,    72,     6,    29,     8,     9,
      72,   175,    85,   126,    72,    72,    72,    80,   131,    82,
     133,   295,    22,    78,    73,    25,    14,   102,   302,    29,
     121,   305,   306,    95,    98,    99,   100,   101,   102,   103,
     204,    72,   106,   107,   108,   109,   110,   111,   434,   213,
     289,     4,    72,   439,   121,   104,    72,   221,   122,   123,
     124,    61,   175,   112,   113,   229,     0,     4,   454,    49,
      50,    51,    52,    95,   290,    97,   102,   114,    78,   116,
     107,    72,   104,   120,   110,   359,     4,   118,   102,   363,
     112,   113,   106,    10,    72,   102,    96,   210,   211,   212,
     199,   121,   118,   102,   104,   102,   270,    22,   106,   106,
      98,    99,   100,   101,    29,   103,   229,    14,   106,   107,
     108,   109,   102,   111,   107,   289,   106,   291,   114,   119,
     116,    98,    99,   100,   101,   248,   103,   250,    55,    56,
      57,    58,    59,    60,   111,   531,   310,   102,    73,   117,
       4,   425,   316,   427,    97,    72,    95,   256,    74,   258,
     259,   274,   275,   276,   277,   278,   279,   280,   281,   282,
     283,   284,   285,   286,    10,   562,   289,   117,   342,   104,
      95,   107,    97,   106,   107,   108,   109,   112,   113,   104,
     303,     4,   106,   120,   307,   308,   412,   112,   113,   110,
     313,    98,    99,   100,   101,     4,   103,   120,     4,   106,
     107,   108,   109,   429,   111,    72,   117,   381,   382,    55,
      56,    57,    58,    59,    60,   338,   103,    95,   118,   342,
     343,   344,   345,    72,   121,   121,    72,     4,   119,   106,
      74,   457,     4,   459,   119,    33,    34,    35,    36,    37,
      38,    39,    40,     4,    42,    43,    44,    45,    46,    16,
      17,    18,    19,    73,    98,    99,   100,   101,    73,   103,
     431,   432,   106,   107,   108,   109,   102,   111,   102,   106,
     120,     4,   446,     4,   397,   398,   399,   400,   401,   402,
     403,   404,   405,   406,   407,   408,   409,   410,   411,   107,
     413,   414,   415,   416,   417,   418,   419,   420,     4,    98,
      99,   100,   101,   102,   103,   428,    20,   106,    72,    72,
     433,   102,   111,   117,    10,   120,   114,   440,   116,   117,
     118,   120,    10,   120,   102,   448,   102,   102,    20,   503,
     453,   102,   506,   456,   120,   458,    10,   119,    12,    13,
      14,   120,    10,    10,    72,    20,   102,    21,    22,    23,
      20,   117,   117,    27,    28,    29,   504,   117,    32,   117,
     106,   484,    98,    99,   100,   101,   102,   103,     4,    20,
     106,   107,   108,   109,   110,   111,     4,   119,   501,   502,
     554,   121,   118,    20,   119,     4,   120,    20,    62,   106,
     120,    65,    66,    67,   119,   119,     4,     4,   521,   121,
       4,    75,     4,     4,   102,    79,    64,    81,     4,   204,
     533,   342,   169,   182,    13,   195,   539,   315,   139,   542,
     194,   544,   338,   178,    98,    99,   100,   101,   102,   103,
     446,   531,   106,   508,   382,   316,   110,   111,   251,   229,
     291,    41,   126,   175,   339,    -1,   120,    47,    48,    -1,
      -1,    -1,   561,    -1,    54,    55,    56,    57,    58,    59,
      60,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,
      70,    71,    98,    99,   100,   101,   102,   103,    -1,    -1,
     106,   107,   108,   109,   110,   111,    98,    99,   100,   101,
     102,   103,    -1,    -1,   106,   107,   108,   109,    -1,   111,
      98,    99,   100,   101,    -1,   103,    -1,    -1,   106,   107,
     108,   109,    -1,   111,    -1,   115,    -1,    -1,   118,    -1,
      -1,    -1,    -1,   123,   124,   125,   126,   127,   128,   129,
     130,    98,    99,   100,   101,    -1,   103,    -1,    -1,   106,
     107,   108,   109,    -1,   111,    98,    99,   100,   101,    -1,
     103,    -1,    -1,   106,   107,   108,   109,    -1,   111,    98,
      99,   100,   101,    -1,   103,    -1,    -1,   106,   107,   108,
     109,    -1,   111,    98,    99,   100,   101,    -1,   103,    -1,
      -1,   106,   107,   108,   109,    -1,   111,    98,    99,   100,
     101,   102,   103,    -1,    -1,   106,    -1,    -1,    -1,   110,
     111,    98,    99,   100,   101,   102,   103,    -1,    -1,   106,
      98,    99,   100,   101,   111,   103,    -1,    -1,   106,    98,
      99,   100,   101,   111,   103,    -1,    -1,   106,    98,    99,
     100,   101,   111,   103,    -1,    -1,   106,    -1,    -1,    -1,
      -1,   111,    86,    87,    88,    89,    90,    91,    92,    93,
      94
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    61,    78,
      96,   104,   133,   134,   135,   136,   138,   139,   140,   150,
     153,   154,   168,     7,   137,   106,   107,   118,   155,   141,
      49,    50,    51,    52,    53,   102,   209,   210,   169,   151,
       4,     0,   135,     4,   107,     4,    72,    72,   238,   239,
     102,   106,   110,   233,   234,   209,   102,   102,    29,    95,
     104,   112,   113,   142,   144,   145,   152,   153,   200,   201,
     202,   106,   107,   119,    74,    98,    99,   100,   101,   103,
     106,   107,   108,   109,   111,   229,   237,   240,   242,   243,
     244,   156,   102,   117,   170,   143,     4,   145,    97,    14,
      28,    78,   146,   147,   202,   237,    74,    72,   131,    86,
      87,    88,    89,    90,    91,    92,    93,    94,   163,   164,
     176,   177,   178,   117,   244,   176,   107,   237,   106,   148,
       4,   110,   237,   241,   242,   120,   120,     4,    72,   162,
     244,     4,   102,   110,   235,   236,   237,    72,   176,   118,
     149,   229,   230,   231,   232,   236,   242,   102,   106,    49,
      50,    51,    52,   102,   106,   165,   166,   157,   178,   171,
     117,   103,    95,   238,   118,    72,   121,   121,    72,   121,
       4,   158,   158,   106,   119,   238,   232,   166,     5,   104,
     112,   113,   159,   167,   197,   198,   199,   167,   119,   160,
       4,     4,    73,   199,   200,   203,    73,   161,   209,    10,
      12,    13,    14,    21,    22,    23,    27,    28,    29,    32,
      62,    65,    66,    67,    75,    79,    81,   102,   106,   110,
     120,   142,   172,   187,   189,   193,   205,   211,   213,   215,
     216,   217,   219,   227,   229,   102,   106,   235,    14,   237,
      14,   237,   237,   229,   102,   102,   206,   106,   207,   208,
     100,   106,   245,   120,   219,   229,   120,   214,     4,   230,
     212,     4,     4,   220,    33,    34,    35,    36,    37,    38,
      39,    40,    42,    43,    44,    45,    46,   114,   116,   117,
     118,   218,   185,    20,   237,    10,    55,    56,    57,    58,
      59,    60,    72,   228,   237,    10,    72,   228,    72,   209,
      72,   209,   209,   117,   194,   195,   120,   173,   106,   225,
     226,   229,   190,   120,   237,   237,   237,   237,   237,   237,
     237,   237,   237,   237,   237,   237,   237,    14,    21,    62,
      63,   106,   110,   122,   123,   124,   219,   229,   237,   238,
     106,   229,   234,    16,    17,    18,    19,   186,   102,    10,
     235,   235,   237,    10,   235,   235,   237,   237,   102,   204,
     229,   102,   102,   237,   106,   196,   222,   237,   196,   226,
     180,    20,    72,   121,   185,   191,   106,   221,   222,   210,
     237,   245,   102,   149,   237,   237,   237,    41,    47,    48,
      54,    55,    56,    57,    58,    59,    60,    68,    69,    70,
      71,   115,   118,   123,   124,   125,   126,   127,   128,   129,
     130,   119,   120,   185,   235,    10,   235,    10,    72,   118,
      72,   117,   117,    20,    72,   121,   223,   121,   121,    11,
      85,   175,   181,   229,   106,   225,   117,     4,    65,    80,
      82,   188,   192,    20,    72,   121,    72,   118,    72,   118,
     237,   237,   237,   237,   237,   237,   237,   237,   237,   237,
     237,   237,   237,   237,   237,   238,   237,   237,   237,   237,
     237,   237,   237,   237,   117,   106,   235,   235,   237,   238,
     102,   244,   244,   237,   106,   222,    15,    19,   224,   222,
     237,    77,    83,    84,   179,     4,    20,   217,   237,     4,
     237,   106,   222,   237,   238,   237,   238,   119,   237,   121,
     119,    20,   120,     4,   237,   237,   106,   229,   174,   202,
     229,   120,   223,    20,   119,   119,   237,   106,     4,    72,
       4,     4,    72,     4,    72,   182,     4,   221,   237,   121,
     237,   237,   237,    27,    64,    76,   183,   121,     4,     4,
       4,   184,   229,     4,   209,   185,   102
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
#define YYEMPTY		(-2)
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
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { 								\
      yyerror (interp, "syntax error: cannot back up");\
      YYERROR;							\
    }								\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)         \
  Current.first_line   = Rhs[1].first_line;      \
  Current.first_column = Rhs[1].first_column;    \
  Current.last_line    = Rhs[N].last_line;       \
  Current.last_column  = Rhs[N].last_column;
#endif

/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (&yylval, YYLEX_PARAM)
#else
# define YYLEX yylex (&yylval)
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

# define YYDSYMPRINTF(Title, Token, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr, 					\
                  Token, Value);	\
      YYFPRINTF (stderr, "\n");					\
    }								\
} while (0)

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (cinluded).                                                   |
`------------------------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_stack_print (short *bottom, short *top)
#else
static void
yy_stack_print (bottom, top)
    short *bottom;
    short *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (/* Nothing. */; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_reduce_print (int yyrule)
#else
static void
yy_reduce_print (yyrule)
    int yyrule;
#endif
{
  int yyi;
  unsigned int yylineno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %u), ",
             yyrule - 1, yylineno);
  /* Print the symbols being reduced, and their result.  */
  for (yyi = yyprhs[yyrule]; 0 <= yyrhs[yyi]; yyi++)
    YYFPRINTF (stderr, "%s ", yytname [yyrhs[yyi]]);
  YYFPRINTF (stderr, "-> %s\n", yytname [yyr1[yyrule]]);
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (Rule);		\
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YYDSYMPRINT(Args)
# define YYDSYMPRINTF(Title, Token, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
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
/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yysymprint (FILE *yyoutput, int yytype, YYSTYPE *yyvaluep)
#else
static void
yysymprint (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

  if (yytype < YYNTOKENS)
    {
      YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
# ifdef YYPRINT
      YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
    }
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  switch (yytype)
    {
      default:
        break;
    }
  YYFPRINTF (yyoutput, ")");
}

#endif /* ! YYDEBUG */
/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yydestruct (int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yytype, yyvaluep)
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

  switch (yytype)
    {

      default:
        break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
int yyparse (void *YYPARSE_PARAM);
# else
int yyparse ();
# endif
#else /* ! YYPARSE_PARAM */
#if defined (__STDC__) || defined (__cplusplus)
int yyparse (Interp *interp);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */






/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
int yyparse (void *YYPARSE_PARAM)
# else
int yyparse (YYPARSE_PARAM)
  void *YYPARSE_PARAM;
# endif
#else /* ! YYPARSE_PARAM */
#if defined (__STDC__) || defined (__cplusplus)
int
yyparse (Interp *interp)
#else
int
yyparse (interp)
    Interp *interp;
#endif
#endif
{
  /* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;

  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;

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

  if (yyss + yystacksize - 1 <= yyssp)
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
      if (YYMAXDEPTH <= yystacksize)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
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

      if (yyss + yystacksize - 1 <= yyssp)
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

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YYDSYMPRINTF ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
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
  YYDPRINTF ((stderr, "Shifting token %s, ", yytname[yytoken]));

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


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 456 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 5:
#line 465 "compilers\\imcc\\imcc.y"
    { yyval.i = yyvsp[0].i; ;}
    break;

  case 6:
#line 466 "compilers\\imcc\\imcc.y"
    { yyval.i = yyvsp[0].i; ;}
    break;

  case 7:
#line 467 "compilers\\imcc\\imcc.y"
    { yyval.i = yyvsp[0].i; ;}
    break;

  case 8:
#line 468 "compilers\\imcc\\imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 9:
#line 469 "compilers\\imcc\\imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 10:
#line 470 "compilers\\imcc\\imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; ;}
    break;

  case 11:
#line 471 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 12:
#line 472 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 13:
#line 473 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 14:
#line 476 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 15:
#line 477 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 16:
#line 481 "compilers\\imcc\\imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    ;}
    break;

  case 17:
#line 489 "compilers\\imcc\\imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, yyvsp[-2].s + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, yyvsp[0].s + 1, '"', NULL);
            IMCC_INFO(interp)->HLL_id =
                Parrot_register_HLL(interp, hll_name, hll_lib);
            yyval.t = 0;
         ;}
    break;

  case 18:
#line 498 "compilers\\imcc\\imcc.y"
    {
             Parrot_register_HLL_type(interp,
                IMCC_INFO(interp)->HLL_id, atoi(yyvsp[-2].s), atoi(yyvsp[0].s));
             yyval.t = 0;
         ;}
    break;

  case 19:
#line 507 "compilers\\imcc\\imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         ;}
    break;

  case 20:
#line 513 "compilers\\imcc\\imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         ;}
    break;

  case 21:
#line 521 "compilers\\imcc\\imcc.y"
    { is_def=1; ;}
    break;

  case 22:
#line 522 "compilers\\imcc\\imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; ;}
    break;

  case 23:
#line 526 "compilers\\imcc\\imcc.y"
    { is_def=1; ;}
    break;

  case 24:
#line 527 "compilers\\imcc\\imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; ;}
    break;

  case 27:
#line 535 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 28:
#line 536 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 29:
#line 537 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 30:
#line 538 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 31:
#line 539 "compilers\\imcc\\imcc.y"
    { yyval.i = yyvsp[0].i; ;}
    break;

  case 33:
#line 543 "compilers\\imcc\\imcc.y"
    { clear_state(); ;}
    break;

  case 34:
#line 545 "compilers\\imcc\\imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); ;}
    break;

  case 35:
#line 548 "compilers\\imcc\\imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    ;}
    break;

  case 36:
#line 553 "compilers\\imcc\\imcc.y"
    {
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   ;}
    break;

  case 37:
#line 559 "compilers\\imcc\\imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); ;}
    break;

  case 38:
#line 561 "compilers\\imcc\\imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, yyvsp[0].s);
                       set_lexical(interp, r, yyvsp[-2].s); yyval.i = 0;
                   ;}
    break;

  case 39:
#line 565 "compilers\\imcc\\imcc.y"
    { yyval.i = 0;;}
    break;

  case 41:
#line 573 "compilers\\imcc\\imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); ;}
    break;

  case 42:
#line 575 "compilers\\imcc\\imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; ;}
    break;

  case 45:
#line 590 "compilers\\imcc\\imcc.y"
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
                ;}
    break;

  case 46:
#line 606 "compilers\\imcc\\imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        ;}
    break;

  case 47:
#line 610 "compilers\\imcc\\imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        ;}
    break;

  case 48:
#line 613 "compilers\\imcc\\imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; ;}
    break;

  case 49:
#line 615 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; cur_call = NULL; ;}
    break;

  case 50:
#line 619 "compilers\\imcc\\imcc.y"
    { yyval.sr = 0; ;}
    break;

  case 51:
#line 620 "compilers\\imcc\\imcc.y"
    { yyval.sr = 0; ;}
    break;

  case 52:
#line 621 "compilers\\imcc\\imcc.y"
    { 
         if (adv_named_id) {
             add_pcc_named_param(interp,cur_call,adv_named_id,yyvsp[-1].sr);
             adv_named_id = NULL;
         } else add_pcc_param(cur_call, yyvsp[-1].sr);
   ;}
    break;

  case 53:
#line 630 "compilers\\imcc\\imcc.y"
    { is_def=1; ;}
    break;

  case 54:
#line 630 "compilers\\imcc\\imcc.y"
    { yyval.sr = yyvsp[0].sr; is_def=0; ;}
    break;

  case 55:
#line 634 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         yyval.sr->type |= yyvsp[0].t; ;}
    break;

  case 56:
#line 636 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-4].t);
                                         yyval.sr->type |= yyvsp[0].t;
                                         adv_named_set(interp,yyvsp[-3].s);;}
    break;

  case 57:
#line 642 "compilers\\imcc\\imcc.y"
    { yyval.t = 0;  ;}
    break;

  case 59:
#line 647 "compilers\\imcc\\imcc.y"
    { yyval.t = 0; ;}
    break;

  case 60:
#line 651 "compilers\\imcc\\imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, yyvsp[-1].s); ;}
    break;

  case 61:
#line 654 "compilers\\imcc\\imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_const(interp, yyvsp[-1].s, 'S'); ;}
    break;

  case 62:
#line 659 "compilers\\imcc\\imcc.y"
    { yyval.t = 0; ;}
    break;

  case 63:
#line 660 "compilers\\imcc\\imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); ;}
    break;

  case 64:
#line 661 "compilers\\imcc\\imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);;}
    break;

  case 65:
#line 665 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); ;}
    break;

  case 66:
#line 666 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); ;}
    break;

  case 67:
#line 667 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); ;}
    break;

  case 68:
#line 668 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); ;}
    break;

  case 69:
#line 669 "compilers\\imcc\\imcc.y"
    {
                          SymReg *r;
                          if (strcmp(yyvsp[0].s, "_"))
                              r = mk_const(interp, yyvsp[0].s, 'S');
                          else {
                              free(yyvsp[0].s),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           yyval.sr = r;
                      ;}
    break;

  case 70:
#line 679 "compilers\\imcc\\imcc.y"
    {
                          SymReg *r;
                          if (strcmp(yyvsp[0].s, "_"))
                              r = mk_const(interp, yyvsp[0].s, 'S');
                          else {
                              free(yyvsp[0].s),
                              r = mk_const(interp, str_dup("PMC"), 'S');
                           }
                           yyval.sr = r;
                      ;}
    break;

  case 73:
#line 697 "compilers\\imcc\\imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); ;}
    break;

  case 74:
#line 699 "compilers\\imcc\\imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         ;}
    break;

  case 75:
#line 703 "compilers\\imcc\\imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; ;}
    break;

  case 76:
#line 705 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; cur_call = NULL; ;}
    break;

  case 77:
#line 710 "compilers\\imcc\\imcc.y"
    {
            char name[128];
            SymReg * r, *r1;
            Instruction *i;

            sprintf(name, "%cpcc_sub_call_%d", IMCC_INTERNAL_CHAR, cnr++);
            yyval.sr = r = mk_pcc_sub(interp, str_dup(name), 0);
            /* this mid rule action has the semantic value of the
             * sub SymReg.
             * This is used below to append args & results
             */
            i = iLABEL(cur_unit, r);
            cur_call = r;
            i->type = ITPCCSUB;
            /*
             * if we are inside a pcc_sub mark the sub as doing a
             * sub call; the sub is in r[0] of the first ins
             */
            r1 = cur_unit->instructions->r[0];
            if (r1 && r1->pcc_sub)
                r1->pcc_sub->calls_a_sub |= 1;
         ;}
    break;

  case 78:
#line 737 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; cur_call = NULL; ;}
    break;

  case 79:
#line 741 "compilers\\imcc\\imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; ;}
    break;

  case 80:
#line 742 "compilers\\imcc\\imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; ;}
    break;

  case 81:
#line 746 "compilers\\imcc\\imcc.y"
    { yyval.i = NULL; ;}
    break;

  case 82:
#line 748 "compilers\\imcc\\imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; ;}
    break;

  case 83:
#line 752 "compilers\\imcc\\imcc.y"
    { yyval.t = 0; ;}
    break;

  case 85:
#line 757 "compilers\\imcc\\imcc.y"
    { yyval.t = yyvsp[0].t; ;}
    break;

  case 86:
#line 758 "compilers\\imcc\\imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; ;}
    break;

  case 87:
#line 762 "compilers\\imcc\\imcc.y"
    {  yyval.t = P_LOAD; ;}
    break;

  case 88:
#line 763 "compilers\\imcc\\imcc.y"
    {  yyval.t = P_MAIN; ;}
    break;

  case 89:
#line 764 "compilers\\imcc\\imcc.y"
    {  yyval.t = P_IMMEDIATE; ;}
    break;

  case 90:
#line 765 "compilers\\imcc\\imcc.y"
    {  yyval.t = P_POSTCOMP; ;}
    break;

  case 91:
#line 766 "compilers\\imcc\\imcc.y"
    {  yyval.t = P_ANON; ;}
    break;

  case 92:
#line 767 "compilers\\imcc\\imcc.y"
    {  yyval.t = P_METHOD; ;}
    break;

  case 93:
#line 768 "compilers\\imcc\\imcc.y"
    {  yyval.t = P_NEED_LEX; ;}
    break;

  case 96:
#line 775 "compilers\\imcc\\imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         ;}
    break;

  case 97:
#line 780 "compilers\\imcc\\imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); ;}
    break;

  case 98:
#line 782 "compilers\\imcc\\imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         ;}
    break;

  case 99:
#line 787 "compilers\\imcc\\imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); ;}
    break;

  case 100:
#line 789 "compilers\\imcc\\imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); ;}
    break;

  case 101:
#line 791 "compilers\\imcc\\imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         ;}
    break;

  case 102:
#line 795 "compilers\\imcc\\imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         ;}
    break;

  case 103:
#line 802 "compilers\\imcc\\imcc.y"
    {  yyval.sr = 0; ;}
    break;

  case 104:
#line 803 "compilers\\imcc\\imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); ;}
    break;

  case 105:
#line 807 "compilers\\imcc\\imcc.y"
    {  yyval.sr = yyvsp[0].sr; ;}
    break;

  case 106:
#line 812 "compilers\\imcc\\imcc.y"
    {  yyval.sr = 0; ;}
    break;

  case 107:
#line 813 "compilers\\imcc\\imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); ;}
    break;

  case 108:
#line 817 "compilers\\imcc\\imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; ;}
    break;

  case 109:
#line 818 "compilers\\imcc\\imcc.y"
    { is_def=1; ;}
    break;

  case 110:
#line 819 "compilers\\imcc\\imcc.y"
    {  mk_ident(interp, yyvsp[0].s, yyvsp[-1].t); is_def=0; yyval.sr=0; ;}
    break;

  case 111:
#line 823 "compilers\\imcc\\imcc.y"
    {  yyval.t = 0; ;}
    break;

  case 112:
#line 824 "compilers\\imcc\\imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; ;}
    break;

  case 113:
#line 828 "compilers\\imcc\\imcc.y"
    {  yyval.t = VT_FLAT;   ;}
    break;

  case 114:
#line 829 "compilers\\imcc\\imcc.y"
    {  yyval.t = VT_OPTIONAL; ;}
    break;

  case 115:
#line 830 "compilers\\imcc\\imcc.y"
    {  yyval.t = VT_OPT_FLAG; ;}
    break;

  case 116:
#line 831 "compilers\\imcc\\imcc.y"
    {  yyval.t = VT_NAMED; ;}
    break;

  case 117:
#line 832 "compilers\\imcc\\imcc.y"
    {  adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; ;}
    break;

  case 118:
#line 837 "compilers\\imcc\\imcc.y"
    { yyval.t = 0; ;}
    break;

  case 119:
#line 838 "compilers\\imcc\\imcc.y"
    { yyval.t = 1; ;}
    break;

  case 122:
#line 848 "compilers\\imcc\\imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); ;}
    break;

  case 123:
#line 851 "compilers\\imcc\\imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; ;}
    break;

  case 124:
#line 852 "compilers\\imcc\\imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  ;}
    break;

  case 125:
#line 858 "compilers\\imcc\\imcc.y"
    {  yyval.sr = 0; ;}
    break;

  case 126:
#line 859 "compilers\\imcc\\imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   ;}
    break;

  case 127:
#line 862 "compilers\\imcc\\imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   ;}
    break;

  case 128:
#line 868 "compilers\\imcc\\imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; ;}
    break;

  case 129:
#line 873 "compilers\\imcc\\imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        ;}
    break;

  case 130:
#line 878 "compilers\\imcc\\imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  ;}
    break;

  case 131:
#line 880 "compilers\\imcc\\imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        ;}
    break;

  case 132:
#line 885 "compilers\\imcc\\imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  ;}
    break;

  case 133:
#line 889 "compilers\\imcc\\imcc.y"
    { yyval.i = 0; ;}
    break;

  case 134:
#line 890 "compilers\\imcc\\imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, yyvsp[0].sr);
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr); ;}
    break;

  case 135:
#line 896 "compilers\\imcc\\imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);;}
    break;

  case 136:
#line 898 "compilers\\imcc\\imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    ;}
    break;

  case 137:
#line 904 "compilers\\imcc\\imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);;}
    break;

  case 140:
#line 923 "compilers\\imcc\\imcc.y"
    { clear_state(); ;}
    break;

  case 141:
#line 928 "compilers\\imcc\\imcc.y"
    {  yyval.i = yyvsp[0].i; ;}
    break;

  case 142:
#line 929 "compilers\\imcc\\imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 143:
#line 930 "compilers\\imcc\\imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 144:
#line 931 "compilers\\imcc\\imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 145:
#line 935 "compilers\\imcc\\imcc.y"
    {  yyval.i = NULL; ;}
    break;

  case 149:
#line 945 "compilers\\imcc\\imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   ;}
    break;

  case 150:
#line 952 "compilers\\imcc\\imcc.y"
    { yyval.i = yyvsp[-1].i; ;}
    break;

  case 151:
#line 956 "compilers\\imcc\\imcc.y"
    {
            IdList* l = malloc(sizeof(IdList));
            l->next = NULL;
            l->id = yyvsp[0].s;
            yyval.idlist = l;
         ;}
    break;

  case 152:
#line 964 "compilers\\imcc\\imcc.y"
    {  IdList* l = malloc(sizeof(IdList));
           l->id = yyvsp[0].s;
           l->next = yyvsp[-2].idlist;
           yyval.idlist = l;
        ;}
    break;

  case 155:
#line 974 "compilers\\imcc\\imcc.y"
    { push_namespace(yyvsp[0].s); ;}
    break;

  case 156:
#line 975 "compilers\\imcc\\imcc.y"
    { pop_namespace(yyvsp[0].s); ;}
    break;

  case 157:
#line 976 "compilers\\imcc\\imcc.y"
    { is_def=1; ;}
    break;

  case 158:
#line 977 "compilers\\imcc\\imcc.y"
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

   ;}
    break;

  case 159:
#line 990 "compilers\\imcc\\imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    ;}
    break;

  case 160:
#line 993 "compilers\\imcc\\imcc.y"
    { is_def=1; ;}
    break;

  case 161:
#line 994 "compilers\\imcc\\imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; ;}
    break;

  case 163:
#line 996 "compilers\\imcc\\imcc.y"
    { is_def=1; ;}
    break;

  case 164:
#line 997 "compilers\\imcc\\imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; ;}
    break;

  case 165:
#line 998 "compilers\\imcc\\imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        ;}
    break;

  case 166:
#line 1002 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); ;}
    break;

  case 167:
#line 1004 "compilers\\imcc\\imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); ;}
    break;

  case 168:
#line 1007 "compilers\\imcc\\imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); ;}
    break;

  case 169:
#line 1008 "compilers\\imcc\\imcc.y"
    {  yyval.i = 0; cur_call = NULL; ;}
    break;

  case 170:
#line 1009 "compilers\\imcc\\imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 172:
#line 1011 "compilers\\imcc\\imcc.y"
    { yyval.i = 0;;}
    break;

  case 173:
#line 1015 "compilers\\imcc\\imcc.y"
    { yyval.t = 'I'; ;}
    break;

  case 174:
#line 1016 "compilers\\imcc\\imcc.y"
    { yyval.t = 'N'; ;}
    break;

  case 175:
#line 1017 "compilers\\imcc\\imcc.y"
    { yyval.t = 'S'; ;}
    break;

  case 176:
#line 1018 "compilers\\imcc\\imcc.y"
    { yyval.t = 'P'; ;}
    break;

  case 177:
#line 1019 "compilers\\imcc\\imcc.y"
    { yyval.t = 'P'; ;}
    break;

  case 178:
#line 1020 "compilers\\imcc\\imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); ;}
    break;

  case 179:
#line 1025 "compilers\\imcc\\imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         ;}
    break;

  case 180:
#line 1035 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 181:
#line 1036 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);;}
    break;

  case 182:
#line 1037 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);;}
    break;

  case 183:
#line 1038 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);;}
    break;

  case 184:
#line 1039 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  ;}
    break;

  case 185:
#line 1040 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  ;}
    break;

  case 186:
#line 1041 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  ;}
    break;

  case 187:
#line 1042 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  ;}
    break;

  case 188:
#line 1043 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  ;}
    break;

  case 189:
#line 1044 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 190:
#line 1045 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  ;}
    break;

  case 191:
#line 1046 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); ;}
    break;

  case 192:
#line 1047 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "iseq", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 193:
#line 1048 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isne", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 194:
#line 1049 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isgt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 195:
#line 1050 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "islt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 196:
#line 1051 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isle", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 197:
#line 1052 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isge", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 198:
#line 1054 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 199:
#line 1056 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 200:
#line 1058 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 201:
#line 1060 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 202:
#line 1062 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 203:
#line 1064 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 204:
#line 1066 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 205:
#line 1068 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 206:
#line 1070 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 207:
#line 1072 "compilers\\imcc\\imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;}
    break;

  case 208:
#line 1074 "compilers\\imcc\\imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); ;}
    break;

  case 209:
#line 1076 "compilers\\imcc\\imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); ;}
    break;

  case 210:
#line 1078 "compilers\\imcc\\imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); ;}
    break;

  case 211:
#line 1080 "compilers\\imcc\\imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); ;}
    break;

  case 212:
#line 1082 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); ;}
    break;

  case 213:
#line 1084 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 214:
#line 1086 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;}
    break;

  case 215:
#line 1088 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); ;}
    break;

  case 216:
#line 1091 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);;}
    break;

  case 217:
#line 1093 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); ;}
    break;

  case 218:
#line 1097 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 219:
#line 1099 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 220:
#line 1101 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); ;}
    break;

  case 221:
#line 1104 "compilers\\imcc\\imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         ;}
    break;

  case 222:
#line 1110 "compilers\\imcc\\imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         ;}
    break;

  case 223:
#line 1114 "compilers\\imcc\\imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         ;}
    break;

  case 227:
#line 1122 "compilers\\imcc\\imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); ;}
    break;

  case 228:
#line 1125 "compilers\\imcc\\imcc.y"
    { yyval.i = IMCC_create_itcall_label(interp);
                           yyval.i->type &= ~ITCALL; yyval.i->type |= ITRESULT; ;}
    break;

  case 229:
#line 1127 "compilers\\imcc\\imcc.y"
    {  yyval.i = 0; ;}
    break;

  case 230:
#line 1132 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 231:
#line 1134 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 232:
#line 1136 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 233:
#line 1138 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 234:
#line 1140 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 235:
#line 1142 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 236:
#line 1144 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 237:
#line 1146 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 238:
#line 1148 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 239:
#line 1150 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 240:
#line 1152 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 241:
#line 1154 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 242:
#line 1156 "compilers\\imcc\\imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 243:
#line 1161 "compilers\\imcc\\imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   ;}
    break;

  case 244:
#line 1167 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); ;}
    break;

  case 245:
#line 1168 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); ;}
    break;

  case 246:
#line 1169 "compilers\\imcc\\imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     ;}
    break;

  case 247:
#line 1174 "compilers\\imcc\\imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 248:
#line 1175 "compilers\\imcc\\imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); ;}
    break;

  case 249:
#line 1176 "compilers\\imcc\\imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 250:
#line 1179 "compilers\\imcc\\imcc.y"
    { yyval.t=0; ;}
    break;

  case 251:
#line 1180 "compilers\\imcc\\imcc.y"
    { yyval.t=0; ;}
    break;

  case 252:
#line 1185 "compilers\\imcc\\imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        ;}
    break;

  case 253:
#line 1190 "compilers\\imcc\\imcc.y"
    {  yyval.i = yyvsp[-3].i; ;}
    break;

  case 254:
#line 1194 "compilers\\imcc\\imcc.y"
    {  yyval.sr = 0; ;}
    break;

  case 255:
#line 1195 "compilers\\imcc\\imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call, adv_named_id, yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr); 
   ;}
    break;

  case 256:
#line 1201 "compilers\\imcc\\imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr);
   ;}
    break;

  case 257:
#line 1207 "compilers\\imcc\\imcc.y"
    { yyval.sr = 0;
                                     add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);;}
    break;

  case 258:
#line 1209 "compilers\\imcc\\imcc.y"
    { yyval.sr = 0; add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);;}
    break;

  case 259:
#line 1213 "compilers\\imcc\\imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; ;}
    break;

  case 260:
#line 1217 "compilers\\imcc\\imcc.y"
    {  yyval.t = 0; ;}
    break;

  case 261:
#line 1218 "compilers\\imcc\\imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; ;}
    break;

  case 262:
#line 1222 "compilers\\imcc\\imcc.y"
    { yyval.t = VT_FLAT; ;}
    break;

  case 263:
#line 1223 "compilers\\imcc\\imcc.y"
    { yyval.t = VT_NAMED; ;}
    break;

  case 264:
#line 1224 "compilers\\imcc\\imcc.y"
    { adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; ;}
    break;

  case 265:
#line 1227 "compilers\\imcc\\imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; ;}
    break;

  case 266:
#line 1231 "compilers\\imcc\\imcc.y"
    { 
         yyval.sr = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
             adv_named_id = NULL;
         } else add_pcc_result(cur_call, yyvsp[0].sr); ;}
    break;

  case 267:
#line 1237 "compilers\\imcc\\imcc.y"
    { 
        add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); ;}
    break;

  case 268:
#line 1239 "compilers\\imcc\\imcc.y"
    { 
       yyval.sr = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_result(cur_call, yyvsp[0].sr); ;}
    break;

  case 269:
#line 1245 "compilers\\imcc\\imcc.y"
    { add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); ;}
    break;

  case 270:
#line 1246 "compilers\\imcc\\imcc.y"
    {  yyval.sr = 0; ;}
    break;

  case 271:
#line 1251 "compilers\\imcc\\imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 272:
#line 1253 "compilers\\imcc\\imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 273:
#line 1255 "compilers\\imcc\\imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 274:
#line 1257 "compilers\\imcc\\imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 275:
#line 1259 "compilers\\imcc\\imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 276:
#line 1261 "compilers\\imcc\\imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 277:
#line 1263 "compilers\\imcc\\imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 278:
#line 1265 "compilers\\imcc\\imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); ;}
    break;

  case 279:
#line 1269 "compilers\\imcc\\imcc.y"
    {  yyval.s = "eq"; ;}
    break;

  case 280:
#line 1270 "compilers\\imcc\\imcc.y"
    {  yyval.s = "ne"; ;}
    break;

  case 281:
#line 1271 "compilers\\imcc\\imcc.y"
    {  yyval.s = "gt"; ;}
    break;

  case 282:
#line 1272 "compilers\\imcc\\imcc.y"
    {  yyval.s = "ge"; ;}
    break;

  case 283:
#line 1273 "compilers\\imcc\\imcc.y"
    {  yyval.s = "lt"; ;}
    break;

  case 284:
#line 1274 "compilers\\imcc\\imcc.y"
    {  yyval.s = "le"; ;}
    break;

  case 287:
#line 1283 "compilers\\imcc\\imcc.y"
    {  yyval.sr = NULL; ;}
    break;

  case 288:
#line 1284 "compilers\\imcc\\imcc.y"
    {  yyval.sr = yyvsp[0].sr; ;}
    break;

  case 289:
#line 1288 "compilers\\imcc\\imcc.y"
    { yyval.sr = regs[0]; ;}
    break;

  case 291:
#line 1293 "compilers\\imcc\\imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; ;}
    break;

  case 292:
#line 1295 "compilers\\imcc\\imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   ;}
    break;

  case 293:
#line 1301 "compilers\\imcc\\imcc.y"
    {
                      regs[nargs++] = yyvsp[-1].sr;
                      yyval.sr = yyvsp[-1].sr;
                   ;}
    break;

  case 295:
#line 1308 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); ;}
    break;

  case 296:
#line 1312 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); ;}
    break;

  case 297:
#line 1313 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); ;}
    break;

  case 298:
#line 1317 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); ;}
    break;

  case 299:
#line 1318 "compilers\\imcc\\imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); ;}
    break;

  case 304:
#line 1331 "compilers\\imcc\\imcc.y"
    {  nkeys=0; in_slice = 0; ;}
    break;

  case 305:
#line 1332 "compilers\\imcc\\imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); ;}
    break;

  case 306:
#line 1336 "compilers\\imcc\\imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; ;}
    break;

  case 307:
#line 1338 "compilers\\imcc\\imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; ;}
    break;

  case 308:
#line 1339 "compilers\\imcc\\imcc.y"
    { in_slice = 1; ;}
    break;

  case 309:
#line 1340 "compilers\\imcc\\imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; ;}
    break;

  case 310:
#line 1344 "compilers\\imcc\\imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   ;}
    break;

  case 311:
#line 1350 "compilers\\imcc\\imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 312:
#line 1352 "compilers\\imcc\\imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; ;}
    break;

  case 313:
#line 1353 "compilers\\imcc\\imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; ;}
    break;

  case 314:
#line 1357 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); ;}
    break;

  case 315:
#line 1358 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); ;}
    break;

  case 316:
#line 1359 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); ;}
    break;

  case 317:
#line 1360 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); ;}
    break;

  case 318:
#line 1361 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); ;}
    break;

  case 319:
#line 1365 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); ;}
    break;

  case 320:
#line 1366 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); ;}
    break;

  case 321:
#line 1367 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); ;}
    break;

  case 322:
#line 1368 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); ;}
    break;

  case 323:
#line 1372 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); ;}
    break;

  case 324:
#line 1373 "compilers\\imcc\\imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); ;}
    break;


    }

/* Line 991 of yacc.c.  */
#line 3855 "compilers\\imcc\\imcparser.c"

  yyvsp -= yylen;
  yyssp -= yylen;


  YY_STACK_PRINT (yyss, yyssp);

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
	  yysize += yystrlen ("syntax error, unexpected ") + 1;
	  yysize += yystrlen (yytname[yytype]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "syntax error, unexpected ");
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
	      yyerror (interp, yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror (interp, "syntax error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror (interp, "syntax error");
    }



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
	  while (yyss < yyssp)
	    {
	      YYDSYMPRINTF ("Error: popping", yystos[*yyssp], yyvsp, yylsp);
	      yydestruct (yystos[*yyssp], yyvsp);
	      YYPOPSTACK;
	    }
	  YYABORT;
        }

      YYDSYMPRINTF ("Error: discarding", yytoken, &yylval, &yylloc);
      yydestruct (yytoken, &yylval);
      yychar = YYEMPTY;

    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab2;


/*----------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action.  |
`----------------------------------------------------*/
yyerrlab1:

  /* Suppress GCC warning that yyerrlab1 is unused when no action
     invokes YYERROR.  */
#if defined (__GNUC_MINOR__) && 2093 <= (__GNUC__ * 1000 + __GNUC_MINOR__)
  __attribute__ ((__unused__))
#endif


  goto yyerrlab2;


/*---------------------------------------------------------------.
| yyerrlab2 -- pop states until the error token can be shifted.  |
`---------------------------------------------------------------*/
yyerrlab2:
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

      YYDSYMPRINTF ("Error: popping", yystos[*yyssp], yyvsp, yylsp);
      yydestruct (yystos[yystate], yyvsp);
      yyvsp--;
      yystate = *--yyssp;

      YY_STACK_PRINT (yyss, yyssp);
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
  yyerror (interp, "parser stack overflow");
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


#line 1378 "compilers\\imcc\\imcc.y"



int yyerror(Interp *interp, char * s)
{
    /* support bison 1.75, convert 'parse error to syntax error' */
    if (!memcmp(s, "parse", 5))
        IMCC_fataly(interp, E_SyntaxError, "syntax%s", s+5);
    else
        IMCC_fataly(interp, E_SyntaxError, s);
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

