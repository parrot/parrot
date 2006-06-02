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
     UNIQUE_REG = 349,
     LABEL = 350,
     EMIT = 351,
     EOM = 352,
     IREG = 353,
     NREG = 354,
     SREG = 355,
     PREG = 356,
     IDENTIFIER = 357,
     REG = 358,
     MACRO = 359,
     ENDM = 360,
     STRINGC = 361,
     INTC = 362,
     FLOATC = 363,
     USTRINGC = 364,
     PARROT_OP = 365,
     VAR = 366,
     LINECOMMENT = 367,
     FILECOMMENT = 368,
     DOT = 369,
     CONCAT = 370,
     POINTY = 371
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
#define UNIQUE_REG 349
#define LABEL 350
#define EMIT 351
#define EOM 352
#define IREG 353
#define NREG 354
#define SREG 355
#define PREG 356
#define IDENTIFIER 357
#define REG 358
#define MACRO 359
#define ENDM 360
#define STRINGC 361
#define INTC 362
#define FLOATC 363
#define USTRINGC 364
#define PARROT_OP 365
#define VAR 366
#define LINECOMMENT 367
#define FILECOMMENT 368
#define DOT 369
#define CONCAT 370
#define POINTY 371




/* Copy the first part of user declarations.  */
#line 1 "compilers/imcc/imcc.y"

/*
 * imcc.y
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 * Copyright (C) 2002-2006, The Perl Foundation.
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
    int len, ascii;

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
    ascii = (*constant == '\'' || *constant == '"' );
    if (ascii) {
        /* strip delimiters */
        len = strlen(constant);
        name = mem_sys_allocate(len);
        constant[len - 1] = '\0';
        strcpy(name, constant + 1);
        free(constant);
    }
    else
        name = constant;
    switch (type_enum) {
        case enum_class_Sub:
        case enum_class_Coroutine:
            rhs = mk_const(interp, name, 'p');
            if (!ascii)
                rhs->type |= VT_ENCODED;  
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
    r->type = (r->type & VT_ENCODED) ? VT_PCC_SUB|VT_ENCODED : VT_PCC_SUB;
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

static SymReg *
mk_sub_address_u(Interp *interp, char * name)
{
    SymReg *r = mk_sub_address(interp, name);
    r->type |= VT_ENCODED;
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
    if(!ins || !ins->r[0] || !(ins->r[0]->type & VT_PCC_SUB))
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
#line 389 "compilers/imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 191 of yacc.c.  */
#line 703 "compilers/imcc/imcparser.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 214 of yacc.c.  */
#line 715 "compilers/imcc/imcparser.c"

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
#define YYLAST   750

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  133
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  116
/* YYNRULES -- Number of rules. */
#define YYNRULES  333
/* YYNRULES -- Number of states. */
#define YYNSTATES  581

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   371

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   123,     2,     2,     2,   129,   130,     2,
     121,   122,   127,   126,     2,   124,     2,   128,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,   132,
       2,   118,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   119,     2,   120,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,   131,     2,   125,     2,     2,     2,
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
     116,   117
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    12,    14,    16,    18,
      20,    22,    25,    27,    29,    33,    36,    39,    44,    49,
      53,    59,    60,    67,    68,    75,    77,    79,    81,    84,
      88,    91,    93,    95,    97,    99,   100,   104,   105,   110,
     113,   118,   119,   121,   122,   127,   128,   130,   135,   136,
     137,   138,   149,   150,   152,   156,   157,   161,   165,   171,
     172,   174,   179,   184,   189,   190,   194,   196,   198,   200,
     202,   204,   206,   208,   212,   213,   215,   216,   217,   218,
     229,   230,   240,   241,   244,   245,   249,   250,   252,   254,
     258,   260,   262,   264,   266,   268,   270,   272,   274,   276,
     282,   286,   290,   294,   298,   304,   310,   311,   315,   318,
     319,   323,   327,   328,   333,   334,   337,   339,   341,   343,
     345,   350,   352,   354,   356,   358,   360,   361,   367,   369,
     370,   373,   377,   381,   382,   388,   389,   395,   396,   398,
     402,   406,   412,   414,   417,   418,   421,   424,   426,   428,
     429,   431,   434,   436,   438,   442,   444,   448,   451,   453,
     455,   457,   460,   463,   464,   469,   474,   475,   482,   484,
     485,   492,   495,   498,   501,   504,   506,   508,   510,   511,
     513,   515,   517,   519,   521,   523,   525,   529,   534,   539,
     544,   550,   556,   562,   568,   574,   580,   586,   592,   598,
     604,   610,   616,   622,   628,   634,   640,   646,   652,   658,
     664,   670,   676,   682,   689,   696,   703,   711,   716,   721,
     728,   735,   743,   748,   753,   758,   763,   770,   778,   782,
     783,   793,   795,   797,   799,   803,   804,   810,   814,   818,
     822,   826,   830,   834,   838,   842,   846,   850,   854,   858,
     862,   867,   869,   871,   873,   875,   879,   883,   887,   889,
     891,   892,   898,   899,   903,   905,   911,   915,   918,   919,
     922,   924,   926,   931,   934,   938,   944,   946,   950,   951,
     958,   965,   971,   977,   982,   987,   992,   997,   999,  1001,
    1003,  1005,  1007,  1009,  1011,  1013,  1014,  1016,  1020,  1022,
    1024,  1029,  1033,  1035,  1037,  1039,  1041,  1043,  1045,  1047,
    1049,  1051,  1053,  1055,  1056,  1059,  1061,  1065,  1066,  1071,
    1073,  1077,  1080,  1083,  1085,  1087,  1089,  1091,  1093,  1095,
    1097,  1099,  1101,  1103
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
     134,     0,    -1,   135,    -1,   136,    -1,   135,   136,    -1,
     155,    -1,   141,    -1,   140,    -1,   156,    -1,   170,    -1,
     152,    -1,   105,     4,    -1,   137,    -1,     4,    -1,     6,
     138,     4,    -1,   139,     4,    -1,     7,   108,    -1,     8,
     107,    72,   107,    -1,     9,   108,    72,   108,    -1,    61,
     212,   103,    -1,    61,   212,   103,   118,   247,    -1,    -1,
      29,   142,   212,   103,   118,   247,    -1,    -1,    29,   144,
     108,   239,   118,   145,    -1,   107,    -1,   110,    -1,   147,
      -1,   146,   147,    -1,   202,   148,     4,    -1,   105,     4,
      -1,   114,    -1,   113,    -1,   155,    -1,   143,    -1,    -1,
     149,   111,   151,    -1,    -1,    78,   150,   178,    96,    -1,
      14,   240,    -1,    28,   107,    72,   104,    -1,    -1,   233,
      -1,    -1,    97,   153,   154,    98,    -1,    -1,   146,    -1,
      22,   119,   241,   120,    -1,    -1,    -1,    -1,    25,   157,
     236,   158,   178,     4,   159,   160,   169,    73,    -1,    -1,
       4,    -1,   160,   161,     4,    -1,    -1,     5,   162,   163,
      -1,   212,   103,   187,    -1,   212,   107,    20,   103,   187,
      -1,    -1,    72,    -1,    94,   121,   167,   122,    -1,    92,
     121,   107,   122,    -1,    92,   121,   103,   122,    -1,    -1,
     167,    72,   168,    -1,   168,    -1,    49,    -1,    50,    -1,
      52,    -1,    51,    -1,   103,    -1,   107,    -1,   119,   241,
     120,    -1,    -1,   199,    -1,    -1,    -1,    -1,    78,   171,
     103,   172,   178,     4,   173,   160,   169,    73,    -1,    -1,
      75,     4,   175,   182,   177,   181,   176,   184,    76,    -1,
      -1,   204,     4,    -1,    -1,    85,   240,     4,    -1,    -1,
     179,    -1,   180,    -1,   179,   164,   180,    -1,    87,    -1,
      86,    -1,    88,    -1,    89,    -1,    91,    -1,    90,    -1,
      93,    -1,   165,    -1,   166,    -1,    77,   240,    72,   240,
       4,    -1,    77,   240,     4,    -1,    83,   240,     4,    -1,
      84,   232,     4,    -1,    84,   107,     4,    -1,    84,   232,
      72,   240,     4,    -1,    84,   107,    72,   240,     4,    -1,
      -1,   182,   183,     4,    -1,    11,   225,    -1,    -1,   184,
     185,     4,    -1,    64,   232,   187,    -1,    -1,    27,   186,
     212,   207,    -1,    -1,   187,   188,    -1,    16,    -1,    17,
      -1,    18,    -1,    19,    -1,    19,   121,   107,   122,    -1,
      95,    -1,    79,    -1,    81,    -1,    80,    -1,    82,    -1,
      -1,   189,     4,   192,   193,   190,    -1,   195,    -1,    -1,
     193,     4,    -1,   193,   194,     4,    -1,    65,   240,   226,
      -1,    -1,    65,   121,   196,   198,   122,    -1,    -1,    66,
     121,   197,   198,   122,    -1,    -1,   225,    -1,   107,    20,
     240,    -1,   198,    72,   225,    -1,   198,    72,   107,    20,
     240,    -1,   201,    -1,   199,   201,    -1,    -1,   200,   205,
      -1,   105,     4,    -1,   114,    -1,   113,    -1,    -1,   203,
      -1,   203,   204,    -1,   204,    -1,    96,    -1,   202,   208,
       4,    -1,   207,    -1,   206,    72,   207,    -1,   103,    95,
      -1,   103,    -1,   214,    -1,   230,    -1,    22,   103,    -1,
      23,   103,    -1,    -1,    27,   209,   212,   206,    -1,    28,
     107,    72,   232,    -1,    -1,    29,   210,   212,   103,   118,
     247,    -1,   143,    -1,    -1,    32,   211,   212,   103,   118,
     247,    -1,    65,   222,    -1,    10,   238,    -1,   111,   233,
      -1,    14,   240,    -1,   222,    -1,   174,    -1,   191,    -1,
      -1,    49,    -1,    50,    -1,    51,    -1,    52,    -1,    53,
      -1,   213,    -1,   103,    -1,   232,   118,   240,    -1,   232,
     118,   123,   240,    -1,   232,   118,   124,   240,    -1,   232,
     118,   125,   240,    -1,   232,   118,   240,   126,   240,    -1,
     232,   118,   240,   124,   240,    -1,   232,   118,   240,   127,
     240,    -1,   232,   118,   240,    68,   240,    -1,   232,   118,
     240,   128,   240,    -1,   232,   118,   240,    41,   240,    -1,
     232,   118,   240,   129,   240,    -1,   232,   118,   240,   116,
     240,    -1,   232,   118,   240,    55,   240,    -1,   232,   118,
     240,    56,   240,    -1,   232,   118,   240,    57,   240,    -1,
     232,   118,   240,    59,   240,    -1,   232,   118,   240,    60,
     240,    -1,   232,   118,   240,    58,   240,    -1,   232,   118,
     240,    47,   240,    -1,   232,   118,   240,    48,   240,    -1,
     232,   118,   240,    69,   240,    -1,   232,   118,   240,    70,
     240,    -1,   232,   118,   240,    71,   240,    -1,   232,   118,
     240,    54,   240,    -1,   232,   118,   240,   130,   240,    -1,
     232,   118,   240,   131,   240,    -1,   232,   118,   240,   125,
     240,    -1,   232,   118,   240,   119,   241,   120,    -1,   232,
     119,   241,   120,   118,   240,    -1,   232,   118,    21,   213,
      72,   240,    -1,   232,   118,    21,   213,   119,   241,   120,
      -1,   232,   118,    21,   213,    -1,   232,   118,    21,   240,
      -1,   232,   118,    21,   119,   241,   120,    -1,   232,   118,
      21,   240,    72,   240,    -1,   232,   118,    21,   240,   119,
     241,   120,    -1,   232,   118,    63,   103,    -1,   232,   118,
      62,   248,    -1,    62,   248,   118,   240,    -1,    21,   232,
      72,   240,    -1,    21,   232,    72,   240,    72,   240,    -1,
      21,   232,    72,   240,   119,   241,   120,    -1,   232,   118,
     222,    -1,    -1,   121,   215,   229,   122,   118,   220,   121,
     224,   122,    -1,   216,    -1,   218,    -1,   219,    -1,   232,
     118,    14,    -1,    -1,    67,   217,   121,   229,   122,    -1,
     232,    33,   240,    -1,   232,    34,   240,    -1,   232,    35,
     240,    -1,   232,    36,   240,    -1,   232,    43,   240,    -1,
     232,    42,   240,    -1,   232,    37,   240,    -1,   232,    38,
     240,    -1,   232,    39,   240,    -1,   232,    40,   240,    -1,
     232,    44,   240,    -1,   232,    45,   240,    -1,   232,    46,
     240,    -1,   232,   118,   111,   151,    -1,   103,    -1,   107,
      -1,   110,    -1,   232,    -1,   232,   221,   237,    -1,   232,
     221,   107,    -1,   232,   221,   232,    -1,   117,    -1,   115,
      -1,    -1,   220,   223,   121,   224,   122,    -1,    -1,   224,
      72,   225,    -1,   225,    -1,   224,    72,   107,    20,   240,
      -1,   107,    20,   240,    -1,   240,   226,    -1,    -1,   226,
     227,    -1,    15,    -1,    19,    -1,    19,   121,   107,   122,
      -1,   232,   187,    -1,   229,    72,   228,    -1,   229,    72,
     107,    20,   232,    -1,   228,    -1,   107,    20,   232,    -1,
      -1,    12,   240,   231,   240,    10,   238,    -1,    13,   240,
     231,   240,    10,   238,    -1,    12,    14,   240,    10,   238,
      -1,    13,    14,   240,    10,   238,    -1,    12,   240,    10,
     238,    -1,    13,   240,    10,   238,    -1,    12,   240,    72,
     238,    -1,    13,   240,    72,   238,    -1,    55,    -1,    56,
      -1,    57,    -1,    58,    -1,    59,    -1,    60,    -1,   112,
      -1,   246,    -1,    -1,   234,    -1,   234,    72,   235,    -1,
     235,    -1,   239,    -1,   232,   119,   241,   120,    -1,   119,
     241,   120,    -1,   237,    -1,   107,    -1,   110,    -1,   103,
      -1,   111,    -1,   103,    -1,   111,    -1,   238,    -1,   240,
      -1,   232,    -1,   247,    -1,    -1,   242,   243,    -1,   245,
      -1,   243,   132,   245,    -1,    -1,   243,    72,   244,   245,
      -1,   240,    -1,   240,    74,   240,    -1,    74,   240,    -1,
     240,    74,    -1,    99,    -1,   100,    -1,   101,    -1,   102,
      -1,   104,    -1,   108,    -1,   109,    -1,   107,    -1,   110,
      -1,   101,    -1,   107,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   472,   472,   476,   477,   481,   482,   483,   484,   485,
     486,   487,   488,   489,   492,   493,   496,   504,   513,   522,
     528,   537,   537,   542,   542,   546,   547,   551,   552,   556,
     557,   558,   559,   560,   561,   564,   564,   569,   568,   579,
     581,   586,   590,   594,   594,   604,   606,   610,   627,   631,
     634,   626,   640,   641,   642,   651,   651,   655,   660,   670,
     671,   675,   678,   681,   687,   688,   689,   693,   694,   695,
     696,   697,   707,   717,   720,   722,   726,   728,   732,   726,
     739,   738,   770,   771,   775,   776,   781,   782,   786,   787,
     791,   792,   793,   794,   795,   796,   797,   798,   799,   803,
     808,   810,   815,   817,   819,   823,   831,   832,   836,   841,
     842,   846,   847,   847,   860,   861,   865,   866,   867,   868,
     869,   870,   875,   876,   880,   881,   886,   885,   890,   896,
     897,   900,   906,   911,   910,   918,   917,   927,   928,   934,
     936,   942,   948,   949,   961,   965,   967,   968,   969,   973,
     974,   978,   979,   983,   989,   994,  1001,  1010,  1018,  1028,
    1029,  1030,  1031,  1032,  1032,  1047,  1051,  1051,  1053,  1054,
    1054,  1056,  1060,  1061,  1064,  1066,  1067,  1068,  1069,  1073,
    1074,  1075,  1076,  1077,  1078,  1082,  1093,  1094,  1095,  1096,
    1097,  1098,  1099,  1100,  1101,  1102,  1103,  1104,  1105,  1106,
    1107,  1108,  1109,  1110,  1111,  1113,  1115,  1117,  1119,  1121,
    1123,  1125,  1127,  1129,  1131,  1133,  1135,  1137,  1139,  1141,
    1143,  1145,  1147,  1150,  1152,  1156,  1158,  1160,  1163,  1170,
    1169,  1178,  1179,  1180,  1181,  1185,  1185,  1191,  1193,  1195,
    1197,  1199,  1201,  1203,  1205,  1207,  1209,  1211,  1213,  1215,
    1220,  1227,  1228,  1229,  1230,  1235,  1236,  1237,  1240,  1241,
    1246,  1245,  1255,  1256,  1262,  1268,  1270,  1274,  1278,  1279,
    1283,  1284,  1285,  1288,  1292,  1298,  1300,  1306,  1307,  1311,
    1313,  1315,  1317,  1319,  1321,  1323,  1325,  1330,  1331,  1332,
    1333,  1334,  1335,  1339,  1340,  1344,  1345,  1349,  1350,  1354,
    1355,  1361,  1368,  1369,  1370,  1374,  1375,  1379,  1380,  1384,
    1385,  1389,  1390,  1393,  1393,  1398,  1399,  1401,  1401,  1406,
    1411,  1414,  1415,  1419,  1420,  1421,  1422,  1423,  1427,  1428,
    1429,  1430,  1434,  1435
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
  "UNIQUE_REG", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", 
  "IDENTIFIER", "REG", "MACRO", "ENDM", "STRINGC", "INTC", "FLOATC", 
  "USTRINGC", "PARROT_OP", "VAR", "LINECOMMENT", "FILECOMMENT", "DOT", 
  "CONCAT", "POINTY", "'='", "'['", "']'", "'('", "')'", "'!'", "'-'", 
  "'~'", "'+'", "'*'", "'/'", "'%'", "'&'", "'|'", "';'", "$accept", 
  "program", "compilation_units", "compilation_unit", "pragma", 
  "pragma_1", "hll_def", "global", "constdef", "@1", "pmc_const", "@2", 
  "any_string", "pasmcode", "pasmline", "pasm_inst", "@3", "@4", 
  "pasm_args", "emit", "@5", "opt_pasmcode", "class_namespace", "sub", 
  "@6", "@7", "@8", "sub_params", "sub_param", "@9", "sub_param_type_def", 
  "opt_comma", "multi", "outer", "multi_types", "multi_type", "sub_body", 
  "pcc_sub", "@10", "@11", "@12", "pcc_sub_call", "@13", "opt_label", 
  "opt_invocant", "sub_proto", "sub_proto_list", "proto", "pcc_call", 
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@14", 
  "paramtype_list", "paramtype", "begin_ret_or_yield", "end_ret_or_yield", 
  "pcc_ret", "@15", "pcc_returns", "pcc_return", "pcc_return_many", "@16", 
  "@17", "var_returns", "statements", "helper_clear_state", "statement", 
  "labels", "_labels", "label", "instruction", "id_list", "id_list_id", 
  "labeled_inst", "@18", "@19", "@20", "type", "classname", "assignment", 
  "@21", "get_results", "@22", "op_assign", "func_assign", "the_sub", 
  "ptr", "sub_call", "@23", "arglist", "arg", "argtype_list", "argtype", 
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
     364,   365,   366,   367,   368,   369,   370,   371,    61,    91,
      93,    40,    41,    33,    45,   126,    43,    42,    47,    37,
      38,   124,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,   133,   134,   135,   135,   136,   136,   136,   136,   136,
     136,   136,   136,   136,   137,   137,   138,   139,   139,   140,
     140,   142,   141,   144,   143,   145,   145,   146,   146,   147,
     147,   147,   147,   147,   147,   149,   148,   150,   148,   148,
     148,   148,   151,   153,   152,   154,   154,   155,   157,   158,
     159,   156,   160,   160,   160,   162,   161,   163,   163,   164,
     164,   165,   166,   166,   167,   167,   167,   168,   168,   168,
     168,   168,   168,   168,   169,   169,   171,   172,   173,   170,
     175,   174,   176,   176,   177,   177,   178,   178,   179,   179,
     180,   180,   180,   180,   180,   180,   180,   180,   180,   181,
     181,   181,   181,   181,   181,   181,   182,   182,   183,   184,
     184,   185,   186,   185,   187,   187,   188,   188,   188,   188,
     188,   188,   189,   189,   190,   190,   192,   191,   191,   193,
     193,   193,   194,   196,   195,   197,   195,   198,   198,   198,
     198,   198,   199,   199,   200,   201,   201,   201,   201,   202,
     202,   203,   203,   204,   205,   206,   206,   207,   207,   208,
     208,   208,   208,   209,   208,   208,   210,   208,   208,   211,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   212,
     212,   212,   212,   212,   212,   213,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   214,
     214,   214,   214,   214,   214,   214,   214,   214,   214,   215,
     214,   214,   214,   214,   214,   217,   216,   218,   218,   218,
     218,   218,   218,   218,   218,   218,   218,   218,   218,   218,
     219,   220,   220,   220,   220,   220,   220,   220,   221,   221,
     223,   222,   224,   224,   224,   224,   224,   225,   226,   226,
     227,   227,   227,   228,   229,   229,   229,   229,   229,   230,
     230,   230,   230,   230,   230,   230,   230,   231,   231,   231,
     231,   231,   231,   232,   232,   233,   233,   234,   234,   235,
     235,   235,   236,   236,   236,   237,   237,   238,   238,   239,
     239,   240,   240,   242,   241,   243,   243,   244,   243,   245,
     245,   245,   245,   246,   246,   246,   246,   246,   247,   247,
     247,   247,   248,   248
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     3,     2,     2,     4,     4,     3,
       5,     0,     6,     0,     6,     1,     1,     1,     2,     3,
       2,     1,     1,     1,     1,     0,     3,     0,     4,     2,
       4,     0,     1,     0,     4,     0,     1,     4,     0,     0,
       0,    10,     0,     1,     3,     0,     3,     3,     5,     0,
       1,     4,     4,     4,     0,     3,     1,     1,     1,     1,
       1,     1,     1,     3,     0,     1,     0,     0,     0,    10,
       0,     9,     0,     2,     0,     3,     0,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     5,
       3,     3,     3,     3,     5,     5,     0,     3,     2,     0,
       3,     3,     0,     4,     0,     2,     1,     1,     1,     1,
       4,     1,     1,     1,     1,     1,     0,     5,     1,     0,
       2,     3,     3,     0,     5,     0,     5,     0,     1,     3,
       3,     5,     1,     2,     0,     2,     2,     1,     1,     0,
       1,     2,     1,     1,     3,     1,     3,     2,     1,     1,
       1,     2,     2,     0,     4,     4,     0,     6,     1,     0,
       6,     2,     2,     2,     2,     1,     1,     1,     0,     1,
       1,     1,     1,     1,     1,     1,     3,     4,     4,     4,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     6,     6,     6,     7,     4,     4,     6,
       6,     7,     4,     4,     4,     4,     6,     7,     3,     0,
       9,     1,     1,     1,     3,     0,     5,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       4,     1,     1,     1,     1,     3,     3,     3,     1,     1,
       0,     5,     0,     3,     1,     5,     3,     2,     0,     2,
       1,     1,     4,     2,     3,     5,     1,     3,     0,     6,
       6,     5,     5,     4,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     1,     3,     1,     1,
       4,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     2,     1,     3,     0,     4,     1,
       3,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned short yydefact[] =
{
       0,    13,     0,     0,     0,     0,    48,    21,     0,    76,
      43,     0,     0,     2,     3,    12,     0,     7,     6,    10,
       5,     8,     9,     0,     0,     0,     0,   313,     0,     0,
     179,   180,   181,   182,   183,   185,     0,   184,     0,   149,
      11,     1,     4,    15,    16,    14,     0,     0,     0,     0,
     305,   303,   304,   306,    49,   302,     0,    19,    77,    23,
     153,     0,    32,    31,    34,   149,    27,     0,    33,    35,
     150,   152,    17,    18,    47,     0,   323,   324,   325,   326,
     327,   330,   328,   329,   331,   293,   311,   319,   314,   315,
     294,   312,    86,     0,     0,    86,     0,    30,    28,    44,
       0,     0,    37,     0,     0,   151,   321,   322,   317,     0,
      91,    90,    92,    93,    95,    94,     0,    96,     0,    97,
      98,     0,    59,    88,     0,    20,     0,     0,    39,     0,
      86,    29,   295,   320,     0,   316,     0,    64,    50,    60,
       0,    22,    78,   307,   308,   309,     0,   310,     0,     0,
     313,    36,   311,    42,   296,   298,   299,   318,     0,     0,
      67,    68,    70,    69,    71,    72,   313,     0,    66,    52,
      89,    52,     0,    40,    38,     0,   313,     0,    63,    62,
       0,     0,    61,    53,   144,   144,    25,    26,    24,   301,
       0,   297,    73,    65,    55,     0,   148,   147,     0,     0,
     144,   149,   142,     0,   300,     0,   146,    54,    51,   143,
     178,   145,    79,    56,     0,     0,     0,     0,     0,     0,
       0,     0,   163,     0,   166,   169,     0,     0,     0,   235,
       0,   122,   123,   251,   252,   253,   295,   229,   168,   176,
       0,   177,   128,     0,   159,   231,   232,   233,   260,   175,
     160,   254,   114,     0,   172,     0,     0,     0,     0,   174,
       0,   161,   162,     0,     0,     0,     0,   332,   333,     0,
     133,   171,   254,   135,     0,    80,   173,   278,   126,   154,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   259,   258,     0,   313,     0,    57,
       0,     0,     0,   287,   288,   289,   290,   291,   292,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   137,   137,   278,   106,     0,   276,     0,   114,   129,
     262,   237,   238,   239,   240,   243,   244,   245,   246,   242,
     241,   247,   248,   249,   234,     0,     0,     0,   330,   331,
     295,     0,     0,     0,   228,   311,   186,     0,   256,   257,
     255,   116,   117,   118,   119,   121,   115,   114,     0,   283,
     285,     0,     0,   284,   286,     0,   225,   158,   164,   155,
     165,     0,     0,   224,   330,     0,   138,   268,     0,     0,
      84,     0,     0,     0,   273,     0,   330,     0,   264,   313,
     217,   218,   223,   222,   250,   187,   188,   189,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   313,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    58,   281,     0,   282,     0,     0,
     313,   157,     0,     0,     0,     0,     0,   134,   267,   136,
     236,     0,     0,     0,     0,   277,     0,   274,     0,   130,
       0,   124,   125,   127,     0,     0,     0,   261,     0,     0,
     313,     0,   313,   195,   204,   205,   209,   198,   199,   200,
     203,   201,   202,   193,   206,   207,   208,   197,     0,   191,
     212,   190,   192,   194,   196,   210,   211,     0,     0,   279,
     280,   226,     0,   156,   167,   170,   139,   330,   140,   270,
     271,   269,   108,     0,     0,     0,     0,    82,   107,     0,
       0,   268,   131,   266,   330,   263,   219,   215,     0,   220,
       0,   213,   214,   120,   227,     0,     0,    85,     0,     0,
       0,     0,   109,     0,   275,   262,   132,     0,   216,   221,
     141,     0,   100,     0,   101,   103,     0,   102,     0,     0,
      83,     0,   265,   272,     0,     0,     0,   112,     0,    81,
       0,   230,    99,   105,   104,     0,   114,   110,     0,   111,
     113
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,    12,    13,    14,    15,    24,    16,    17,    18,    29,
      64,    96,   188,    65,    66,   103,   104,   130,   151,    19,
      39,    67,    20,    21,    28,    92,   169,   184,   198,   205,
     213,   140,   119,   120,   167,   168,   199,    22,    38,    95,
     171,   239,   324,   542,   453,   121,   122,   123,   517,   390,
     454,   559,   570,   575,   299,   366,   240,   463,   241,   329,
     395,   464,   242,   321,   322,   385,   200,   201,   202,    69,
      70,    71,   211,   378,   379,   243,   263,   265,   266,    36,
      37,   244,   277,   245,   274,   246,   247,   248,   298,   249,
     280,   397,   386,   448,   511,   326,   327,   250,   310,    86,
     153,   154,   155,    54,    55,   145,   156,   387,    48,    49,
      88,   134,    89,    90,    91,   269
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -435
static const short yypact[] =
{
      15,  -435,    31,   -85,    -1,   -68,  -435,  -435,   166,  -435,
    -435,    52,   108,    15,  -435,  -435,   117,  -435,  -435,  -435,
    -435,  -435,  -435,    14,   124,    69,    87,  -435,   122,   166,
    -435,  -435,  -435,  -435,  -435,  -435,    40,  -435,    62,    19,
    -435,  -435,  -435,  -435,  -435,  -435,    65,    70,    57,   375,
    -435,  -435,  -435,  -435,  -435,  -435,    76,    73,  -435,  -435,
    -435,   185,  -435,  -435,  -435,    33,  -435,   104,  -435,    21,
      98,  -435,  -435,  -435,  -435,   568,  -435,  -435,  -435,  -435,
    -435,  -435,  -435,  -435,  -435,  -435,  -435,   130,   -57,  -435,
    -435,  -435,   268,    92,   187,   268,    97,  -435,  -435,  -435,
     568,   106,  -435,   216,   110,  -435,  -435,   568,  -435,   375,
    -435,  -435,  -435,  -435,  -435,  -435,   105,  -435,   114,  -435,
    -435,   255,     7,  -435,   187,  -435,   257,   554,  -435,   194,
     268,  -435,   509,  -435,   375,  -435,    54,    20,  -435,  -435,
     268,  -435,  -435,  -435,  -435,  -435,   152,  -435,   169,   178,
    -435,  -435,   157,  -435,   206,  -435,  -435,  -435,   162,   164,
    -435,  -435,  -435,  -435,  -435,  -435,  -435,   -55,  -435,   275,
    -435,   275,    60,  -435,  -435,   167,  -435,   509,  -435,  -435,
     184,    20,  -435,  -435,     5,     5,  -435,  -435,  -435,  -435,
     192,  -435,  -435,  -435,  -435,   315,  -435,  -435,   316,   232,
     149,    98,  -435,   250,  -435,   166,  -435,  -435,  -435,  -435,
     424,  -435,  -435,  -435,    59,   -77,    99,   181,   568,   156,
     224,   225,  -435,   222,   234,  -435,    35,   494,   209,  -435,
     328,  -435,  -435,  -435,  -435,  -435,   509,  -435,  -435,  -435,
     329,  -435,  -435,   344,  -435,  -435,  -435,  -435,  -435,  -435,
    -435,   301,  -435,   330,  -435,   568,    96,   568,   125,  -435,
     277,  -435,  -435,   166,   279,   166,   166,  -435,  -435,   245,
    -435,  -435,   -52,  -435,   243,  -435,  -435,   199,  -435,  -435,
     259,   568,   568,   568,   568,   568,   568,   568,   568,   568,
     568,   568,   568,   568,  -435,  -435,   449,  -435,   214,    42,
     287,   381,   -77,  -435,  -435,  -435,  -435,  -435,  -435,   -77,
     568,   383,   -77,   -77,   568,   568,   291,   156,   292,   294,
     568,   582,   582,   199,  -435,   384,  -435,   -42,  -435,  -435,
     596,  -435,  -435,  -435,  -435,  -435,  -435,  -435,  -435,  -435,
    -435,  -435,  -435,  -435,  -435,   523,    35,   302,   286,   289,
     509,   568,   568,   568,  -435,    71,   521,   288,  -435,  -435,
    -435,  -435,  -435,  -435,   293,  -435,  -435,  -435,   -77,  -435,
    -435,   402,   -77,  -435,  -435,   403,    39,   320,   349,  -435,
    -435,   305,   306,  -435,   405,   -41,  -435,  -435,   -36,   -26,
       2,   156,   299,   309,    42,     8,   409,   -20,  -435,  -435,
      44,    68,  -435,  -435,  -435,  -435,  -435,  -435,   568,   568,
     568,   568,   568,   568,   568,   568,   568,   568,   568,   568,
     568,   568,   568,  -435,   568,   568,   568,   568,   568,   568,
     568,   568,   312,   324,    42,  -435,   -77,  -435,   -77,   568,
    -435,  -435,   291,   187,   187,   568,   610,  -435,   212,  -435,
    -435,   568,   568,   -30,   428,  -435,   413,  -435,   638,  -435,
     568,  -435,  -435,  -435,   431,   568,   624,  -435,   319,   568,
    -435,   568,  -435,  -435,  -435,  -435,  -435,  -435,  -435,  -435,
    -435,  -435,  -435,  -435,  -435,  -435,  -435,  -435,   322,  -435,
    -435,  -435,  -435,  -435,  -435,  -435,  -435,   568,   318,  -435,
    -435,  -435,   323,  -435,  -435,  -435,  -435,   430,  -435,  -435,
     334,  -435,  -435,   440,   568,   568,   394,    98,  -435,   156,
     336,  -435,  -435,  -435,   438,  -435,  -435,  -435,   339,  -435,
     340,  -435,  -435,  -435,  -435,   568,   354,  -435,    10,   458,
      23,    25,  -435,   460,  -435,   596,   212,   568,  -435,  -435,
    -435,   343,  -435,   568,  -435,  -435,   568,  -435,   568,    50,
    -435,    26,  -435,  -435,   462,   463,   464,  -435,   156,  -435,
     465,  -435,  -435,  -435,  -435,   166,  -435,  -435,   291,    42,
    -435
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -435,  -435,  -435,   467,  -435,  -435,  -435,  -435,  -435,  -435,
     263,  -435,  -435,  -435,   416,  -435,  -435,  -435,   128,  -435,
    -435,  -435,     3,  -435,  -435,  -435,  -435,   317,  -435,  -435,
    -435,  -435,  -435,  -435,  -435,   321,   331,  -435,  -435,  -435,
    -435,  -435,  -435,  -435,  -435,   -56,  -435,   357,  -435,  -435,
    -435,  -435,  -435,  -435,  -324,  -435,  -435,  -435,  -435,  -435,
    -435,  -435,  -435,  -435,  -435,   186,  -435,  -435,   300,   308,
    -435,   -69,  -435,  -435,  -434,  -435,  -435,  -435,  -435,   -29,
     172,  -435,  -435,  -435,  -435,  -435,  -435,    49,  -435,  -211,
    -435,   -31,  -321,    -3,  -435,   127,   197,  -435,   264,  -127,
     285,  -435,   352,  -435,   235,  -208,   410,   -43,  -148,  -435,
    -435,  -435,   -89,  -435,   -91,   193
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -255
static const short yytable[] =
{
      56,   105,   175,   125,   394,   152,    87,   254,   503,   398,
     194,   -87,   459,   451,   552,   108,   271,   181,   180,     1,
     135,     2,    25,     3,     4,   -41,   143,   555,   190,   557,
     392,   446,   106,   141,   144,   100,   446,     5,    23,   126,
       6,     5,    68,   434,     7,   157,   392,   514,    59,   101,
     152,    27,   466,   515,   516,     5,    40,   128,   361,   362,
     363,   364,    59,   294,   133,   295,    87,   182,    68,   160,
     161,   162,   163,   460,   149,   109,     8,   567,   -74,   139,
     393,   447,   553,   251,   147,   354,   449,   452,   461,   147,
     462,    87,   260,     9,   369,   556,   450,   558,   466,   102,
     272,   370,   467,   -87,   373,   374,   302,    26,    41,   152,
     195,   439,    10,   255,   568,    60,   469,   -45,   196,   197,
      11,    43,    44,   164,    61,   508,   569,   165,    45,    60,
     512,   -46,    62,    63,   147,   312,   267,   365,    61,   166,
     471,    46,   268,    57,   580,   525,    62,    63,   571,   357,
     328,   303,   304,   305,   306,   307,   308,   158,   440,    47,
     435,   159,   252,   470,   437,    58,   253,   186,   309,   355,
     187,   359,    72,   256,   258,   259,   214,    74,    73,    93,
     303,   304,   305,   306,   307,   308,   294,   472,   295,    97,
     380,    94,  -254,   147,    60,   257,   328,   313,    76,    77,
      78,    79,    99,    80,   107,   127,    81,    82,    83,    84,
     124,    85,   301,   129,   311,    30,    31,    32,    33,    34,
     131,   132,   -75,   152,   398,    50,   136,   509,   499,    51,
     500,   510,    52,    53,   316,   137,   318,   319,   331,   332,
     333,   334,   335,   336,   337,   338,   339,   340,   341,   342,
     343,   468,   579,   356,   195,    76,    77,    78,    79,   138,
      80,   142,   196,   197,   455,   328,   148,   371,    85,    35,
     172,   375,   376,   173,   174,   488,   176,   383,   177,   183,
      76,    77,    78,    79,   178,    80,   179,   189,    81,    82,
      83,    84,   502,    85,    81,    82,    83,    84,    76,    77,
      78,    79,   401,    80,   192,   208,   325,   147,   405,   406,
     407,    85,   204,    76,    77,    78,    79,    50,    80,   206,
     207,   358,   528,   212,   530,    53,    85,   261,   262,   264,
     273,   272,   275,   278,   281,   282,   283,   284,   285,   286,
     287,   288,   -23,   289,   290,   291,   292,   293,   279,   315,
     300,   317,   504,   505,   110,   111,   112,   113,   114,   115,
     116,   117,   118,   320,   323,   473,   474,   475,   476,   477,
     478,   479,   480,   481,   482,   483,   484,   485,   486,   487,
     330,   489,   490,   491,   492,   493,   494,   495,   496,   541,
     367,   368,   544,   372,   377,   381,   501,   382,    76,    77,
      78,    79,   506,    80,   391,   403,   456,  -252,   432,   513,
    -253,    85,   436,   438,   433,   441,   294,   521,   295,   296,
     297,   442,   523,   443,   444,   445,   527,   458,   529,   465,
     497,   498,   518,   519,   215,   522,   216,   217,   218,   526,
     533,   576,   531,   534,   537,   219,   220,   221,   543,    75,
     535,   222,   223,   224,   532,   536,   225,   545,   547,   548,
     549,   551,   554,   344,   560,   563,   572,   573,   574,   577,
     345,   538,   539,   238,    76,    77,    78,    79,   404,    80,
      42,    98,    81,    82,    83,    84,   226,    85,   185,   227,
     228,   229,   550,    76,    77,    78,    79,   170,    80,   230,
     209,   540,   193,   231,   562,   232,    85,   520,   388,   210,
     564,   346,   347,   565,   561,   566,   203,   400,   546,   457,
     389,   276,   314,    76,    77,    78,    79,   233,    80,   191,
       0,   234,     0,   360,   235,   236,    85,   146,     0,   402,
       0,     0,     0,     0,     0,   237,   578,     0,    76,    77,
      78,    79,   233,    80,     0,     0,   348,    82,    83,   349,
     350,    85,   408,     0,     0,     0,     0,     0,   409,   410,
       0,     0,   351,   352,   353,   411,   412,   413,   414,   415,
     416,   417,     0,     0,     0,     0,     0,     0,     0,   418,
     419,   420,   421,    76,    77,    78,    79,   233,    80,     0,
       0,   234,     0,     0,   235,     0,    85,     0,    76,    77,
      78,    79,   143,    80,     0,   270,    81,    82,    83,    84,
     144,    85,    76,    77,    78,    79,    35,    80,   150,     0,
      81,    82,    83,    84,     0,    85,     0,   422,     0,     0,
     423,     0,   399,     0,     0,   424,   425,   426,   427,   428,
     429,   430,   431,    76,    77,    78,    79,   143,    80,     0,
       0,    81,    82,    83,    84,   144,    85,    76,    77,    78,
      79,     0,    80,     0,     0,    81,    82,    83,    84,     0,
      85,    76,    77,    78,    79,     0,    80,     0,     0,   384,
      82,    83,    84,     0,    85,    76,    77,    78,    79,     0,
      80,     0,     0,   396,    82,    83,    84,     0,    85,    76,
      77,    78,    79,     0,    80,     0,     0,   507,    82,    83,
      84,     0,    85,    76,    77,    78,    79,     0,    80,     0,
       0,   524,    82,    83,    84,     0,    85,    76,    77,    78,
      79,   233,    80,     0,     0,   234,     0,     0,   235,     0,
      85
};

static const short yycheck[] =
{
      29,    70,   150,    94,   328,   132,    49,   215,   442,   330,
       5,     4,     4,    11,     4,    72,   227,    72,   166,     4,
     109,     6,   107,     8,     9,     4,   103,     4,   176,     4,
      72,    72,    75,   124,   111,    14,    72,    22,     7,    95,
      25,    22,    39,   367,    29,   134,    72,    77,    29,    28,
     177,   119,    72,    83,    84,    22,     4,   100,    16,    17,
      18,    19,    29,   115,   107,   117,   109,   122,    65,    49,
      50,    51,    52,    65,   130,   132,    61,    27,    73,    72,
     122,   122,    72,   210,   127,   296,   122,    85,    80,   132,
      82,   134,   219,    78,   302,    72,   122,    72,    72,    78,
     227,   309,   122,    96,   312,   313,    10,   108,     0,   236,
     105,    72,    97,    14,    64,    96,    72,    98,   113,   114,
     105,     4,   108,   103,   105,   446,    76,   107,     4,    96,
     451,    98,   113,   114,   177,    10,   101,    95,   105,   119,
      72,    72,   107,   103,   578,   466,   113,   114,   122,   297,
     277,    55,    56,    57,    58,    59,    60,   103,   119,    72,
     368,   107,   103,   119,   372,   103,   107,   107,    72,   296,
     110,   298,   107,   216,   217,   218,   205,   120,   108,   103,
      55,    56,    57,    58,    59,    60,   115,   119,   117,     4,
     317,   118,   121,   236,    96,    14,   323,    72,    99,   100,
     101,   102,    98,   104,    74,   108,   107,   108,   109,   110,
     118,   112,   255,   107,   257,    49,    50,    51,    52,    53,
       4,   111,    73,   350,   545,   103,   121,    15,   436,   107,
     438,    19,   110,   111,   263,   121,   265,   266,   281,   282,
     283,   284,   285,   286,   287,   288,   289,   290,   291,   292,
     293,   399,   576,   296,   105,    99,   100,   101,   102,     4,
     104,     4,   113,   114,   391,   392,    72,   310,   112,   103,
     118,   314,   315,   104,    96,   423,   119,   320,    72,     4,
      99,   100,   101,   102,   122,   104,   122,   120,   107,   108,
     109,   110,   440,   112,   107,   108,   109,   110,    99,   100,
     101,   102,   345,   104,   120,    73,   107,   350,   351,   352,
     353,   112,   120,    99,   100,   101,   102,   103,   104,     4,
       4,   107,   470,    73,   472,   111,   112,   103,   103,   107,
     121,   458,     4,     4,    33,    34,    35,    36,    37,    38,
      39,    40,   108,    42,    43,    44,    45,    46,     4,    72,
      20,    72,   443,   444,    86,    87,    88,    89,    90,    91,
      92,    93,    94,   118,   121,   408,   409,   410,   411,   412,
     413,   414,   415,   416,   417,   418,   419,   420,   421,   422,
     121,   424,   425,   426,   427,   428,   429,   430,   431,   516,
     103,    10,   519,    10,   103,   103,   439,   103,    99,   100,
     101,   102,   445,   104,    20,   103,   107,   121,   120,   452,
     121,   112,    10,    10,   121,    95,   115,   460,   117,   118,
     119,    72,   465,   118,   118,    20,   469,   118,   471,    20,
     118,   107,     4,    20,    10,     4,    12,    13,    14,   120,
     122,   568,   120,   120,     4,    21,    22,    23,   517,    74,
      20,    27,    28,    29,   497,   121,    32,   121,    20,   120,
     120,   107,     4,    14,     4,   122,     4,     4,     4,     4,
      21,   514,   515,   210,    99,   100,   101,   102,   350,   104,
      13,    65,   107,   108,   109,   110,    62,   112,   171,    65,
      66,    67,   535,    99,   100,   101,   102,   140,   104,    75,
     200,   107,   181,    79,   547,    81,   112,   458,   322,   201,
     553,    62,    63,   556,   545,   558,   185,   345,   521,   392,
     323,   236,   258,    99,   100,   101,   102,   103,   104,   177,
      -1,   107,    -1,   298,   110,   111,   112,   127,    -1,   346,
      -1,    -1,    -1,    -1,    -1,   121,   575,    -1,    99,   100,
     101,   102,   103,   104,    -1,    -1,   107,   108,   109,   110,
     111,   112,    41,    -1,    -1,    -1,    -1,    -1,    47,    48,
      -1,    -1,   123,   124,   125,    54,    55,    56,    57,    58,
      59,    60,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      69,    70,    71,    99,   100,   101,   102,   103,   104,    -1,
      -1,   107,    -1,    -1,   110,    -1,   112,    -1,    99,   100,
     101,   102,   103,   104,    -1,   121,   107,   108,   109,   110,
     111,   112,    99,   100,   101,   102,   103,   104,   119,    -1,
     107,   108,   109,   110,    -1,   112,    -1,   116,    -1,    -1,
     119,    -1,   119,    -1,    -1,   124,   125,   126,   127,   128,
     129,   130,   131,    99,   100,   101,   102,   103,   104,    -1,
      -1,   107,   108,   109,   110,   111,   112,    99,   100,   101,
     102,    -1,   104,    -1,    -1,   107,   108,   109,   110,    -1,
     112,    99,   100,   101,   102,    -1,   104,    -1,    -1,   107,
     108,   109,   110,    -1,   112,    99,   100,   101,   102,    -1,
     104,    -1,    -1,   107,   108,   109,   110,    -1,   112,    99,
     100,   101,   102,    -1,   104,    -1,    -1,   107,   108,   109,
     110,    -1,   112,    99,   100,   101,   102,    -1,   104,    -1,
      -1,   107,   108,   109,   110,    -1,   112,    99,   100,   101,
     102,   103,   104,    -1,    -1,   107,    -1,    -1,   110,    -1,
     112
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,     4,     6,     8,     9,    22,    25,    29,    61,    78,
      97,   105,   134,   135,   136,   137,   139,   140,   141,   152,
     155,   156,   170,     7,   138,   107,   108,   119,   157,   142,
      49,    50,    51,    52,    53,   103,   212,   213,   171,   153,
       4,     0,   136,     4,   108,     4,    72,    72,   241,   242,
     103,   107,   110,   111,   236,   237,   212,   103,   103,    29,
      96,   105,   113,   114,   143,   146,   147,   154,   155,   202,
     203,   204,   107,   108,   120,    74,    99,   100,   101,   102,
     104,   107,   108,   109,   110,   112,   232,   240,   243,   245,
     246,   247,   158,   103,   118,   172,   144,     4,   147,    98,
      14,    28,    78,   148,   149,   204,   240,    74,    72,   132,
      86,    87,    88,    89,    90,    91,    92,    93,    94,   165,
     166,   178,   179,   180,   118,   247,   178,   108,   240,   107,
     150,     4,   111,   240,   244,   245,   121,   121,     4,    72,
     164,   247,     4,   103,   111,   238,   239,   240,    72,   178,
     119,   151,   232,   233,   234,   235,   239,   245,   103,   107,
      49,    50,    51,    52,   103,   107,   119,   167,   168,   159,
     180,   173,   118,   104,    96,   241,   119,    72,   122,   122,
     241,    72,   122,     4,   160,   160,   107,   110,   145,   120,
     241,   235,   120,   168,     5,   105,   113,   114,   161,   169,
     199,   200,   201,   169,   120,   162,     4,     4,    73,   201,
     202,   205,    73,   163,   212,    10,    12,    13,    14,    21,
      22,    23,    27,    28,    29,    32,    62,    65,    66,    67,
      75,    79,    81,   103,   107,   110,   111,   121,   143,   174,
     189,   191,   195,   208,   214,   216,   218,   219,   220,   222,
     230,   232,   103,   107,   238,    14,   240,    14,   240,   240,
     232,   103,   103,   209,   107,   210,   211,   101,   107,   248,
     121,   222,   232,   121,   217,     4,   233,   215,     4,     4,
     223,    33,    34,    35,    36,    37,    38,    39,    40,    42,
      43,    44,    45,    46,   115,   117,   118,   119,   221,   187,
      20,   240,    10,    55,    56,    57,    58,    59,    60,    72,
     231,   240,    10,    72,   231,    72,   212,    72,   212,   212,
     118,   196,   197,   121,   175,   107,   228,   229,   232,   192,
     121,   240,   240,   240,   240,   240,   240,   240,   240,   240,
     240,   240,   240,   240,    14,    21,    62,    63,   107,   110,
     111,   123,   124,   125,   222,   232,   240,   241,   107,   232,
     237,    16,    17,    18,    19,    95,   188,   103,    10,   238,
     238,   240,    10,   238,   238,   240,   240,   103,   206,   207,
     232,   103,   103,   240,   107,   198,   225,   240,   198,   229,
     182,    20,    72,   122,   187,   193,   107,   224,   225,   119,
     213,   240,   248,   103,   151,   240,   240,   240,    41,    47,
      48,    54,    55,    56,    57,    58,    59,    60,    68,    69,
      70,    71,   116,   119,   124,   125,   126,   127,   128,   129,
     130,   131,   120,   121,   187,   238,    10,   238,    10,    72,
     119,    95,    72,   118,   118,    20,    72,   122,   226,   122,
     122,    11,    85,   177,   183,   232,   107,   228,   118,     4,
      65,    80,    82,   190,   194,    20,    72,   122,   241,    72,
     119,    72,   119,   240,   240,   240,   240,   240,   240,   240,
     240,   240,   240,   240,   240,   240,   240,   240,   241,   240,
     240,   240,   240,   240,   240,   240,   240,   118,   107,   238,
     238,   240,   241,   207,   247,   247,   240,   107,   225,    15,
      19,   227,   225,   240,    77,    83,    84,   181,     4,    20,
     220,   240,     4,   240,   107,   225,   120,   240,   241,   240,
     241,   120,   240,   122,   120,    20,   121,     4,   240,   240,
     107,   232,   176,   204,   232,   121,   226,    20,   120,   120,
     240,   107,     4,    72,     4,     4,    72,     4,    72,   184,
       4,   224,   240,   122,   240,   240,   240,    27,    64,    76,
     185,   122,     4,     4,     4,   186,   232,     4,   212,   187,
     207
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
#line 472 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 5:
#line 481 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 6:
#line 482 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 7:
#line 483 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 8:
#line 484 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 9:
#line 485 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 10:
#line 486 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; imc_close_unit(interp, cur_unit); cur_unit = 0; }
    break;

  case 11:
#line 487 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 488 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 489 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 492 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 493 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 497 "compilers/imcc/imcc.y"
    { if (yyvsp[0].s)
                          IMCC_INFO(interp)->state->pragmas |= PR_N_OPERATORS;
                      else
                          IMCC_INFO(interp)->state->pragmas &= ~PR_N_OPERATORS;
                    }
    break;

  case 17:
#line 505 "compilers/imcc/imcc.y"
    {
            STRING *hll_name, *hll_lib;
            hll_name = string_unescape_cstring(interp, yyvsp[-2].s + 1, '"', NULL);
            hll_lib =  string_unescape_cstring(interp, yyvsp[0].s + 1, '"', NULL);
            CONTEXT(((Interp*)interp)->ctx)->current_HLL = 
                Parrot_register_HLL(interp, hll_name, hll_lib);
            yyval.t = 0;
         }
    break;

  case 18:
#line 514 "compilers/imcc/imcc.y"
    {
             Parrot_register_HLL_type(interp,
                CONTEXT(((Interp*)interp)->ctx)->current_HLL, atoi(yyvsp[-2].s), atoi(yyvsp[0].s));
             yyval.t = 0;
         }
    break;

  case 19:
#line 523 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 20:
#line 529 "compilers/imcc/imcc.y"
    {
            IMCC_fataly(interp, E_SyntaxError,
                ".global not implemented yet\n");
            yyval.i = 0;
         }
    break;

  case 21:
#line 537 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 22:
#line 538 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 23:
#line 542 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 24:
#line 543 "compilers/imcc/imcc.y"
    { yyval.i = mk_pmc_const(interp, cur_unit, yyvsp[-3].s, yyvsp[-2].sr, yyvsp[0].s);is_def=0; }
    break;

  case 29:
#line 556 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 30:
#line 557 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 558 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 32:
#line 559 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 33:
#line 560 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 35:
#line 564 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 36:
#line 566 "compilers/imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s,0,regs,nargs,keyvec,1);
                     free(yyvsp[-1].s); }
    break;

  case 37:
#line 569 "compilers/imcc/imcc.y"
    {
                    imc_close_unit(interp, cur_unit);
                    cur_unit = imc_open_unit(interp, IMC_PASM);
                    }
    break;

  case 38:
#line 574 "compilers/imcc/imcc.y"
    {
                     yyval.i = iSUBROUTINE(interp, cur_unit,
                                mk_sub_label(interp, yyvsp[0].s));
                     cur_call->pcc_sub->pragma = yyvsp[-1].t;
                   }
    break;

  case 39:
#line 580 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 40:
#line 582 "compilers/imcc/imcc.y"
    {
                       SymReg *r = mk_pasm_reg(interp, yyvsp[0].s);
                       set_lexical(interp, r, yyvsp[-2].s); yyval.i = 0;
                   }
    break;

  case 41:
#line 586 "compilers/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 43:
#line 594 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PASM); }
    break;

  case 44:
#line 596 "compilers/imcc/imcc.y"
    { /*
                      if (optimizer_level & OPT_PASM)
                         imc_compile_unit(interp, IMCC_INFO(interp)->cur_unit);
                         emit_flush(interp);
                     */
                     yyval.i=0; }
    break;

  case 47:
#line 611 "compilers/imcc/imcc.y"
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

  case 48:
#line 627 "compilers/imcc/imcc.y"
    {
           cur_unit = imc_open_unit(interp, IMC_PCCSUB);
        }
    break;

  case 49:
#line 631 "compilers/imcc/imcc.y"
    {
          iSUBROUTINE(interp, cur_unit, yyvsp[0].sr);
        }
    break;

  case 50:
#line 634 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 51:
#line 636 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 52:
#line 640 "compilers/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 53:
#line 641 "compilers/imcc/imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 642 "compilers/imcc/imcc.y"
    { 
         if (adv_named_id) {
             add_pcc_named_param(interp,cur_call,adv_named_id,yyvsp[-1].sr);
             adv_named_id = NULL;
         } else add_pcc_param(cur_call, yyvsp[-1].sr);
   }
    break;

  case 55:
#line 651 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 56:
#line 651 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr; is_def=0; }
    break;

  case 57:
#line 655 "compilers/imcc/imcc.y"
    { if (yyvsp[0].t & VT_UNIQUE_REG)
                                             yyval.sr = mk_ident_ur(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         else
                                             yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-2].t);
                                         yyval.sr->type |= yyvsp[0].t; }
    break;

  case 58:
#line 660 "compilers/imcc/imcc.y"
    { 
                                         if (yyvsp[0].t & VT_UNIQUE_REG)
                                             yyval.sr = mk_ident_ur(interp, yyvsp[-1].s, yyvsp[-4].t);
                                         else
                                             yyval.sr = mk_ident(interp, yyvsp[-1].s, yyvsp[-4].t);
                                         yyval.sr->type |= yyvsp[0].t;
                                         adv_named_set(interp,yyvsp[-3].s);}
    break;

  case 59:
#line 670 "compilers/imcc/imcc.y"
    { yyval.t = 0;  }
    break;

  case 61:
#line 675 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 62:
#line 679 "compilers/imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_sub_address_fromc(interp, yyvsp[-1].s); }
    break;

  case 63:
#line 682 "compilers/imcc/imcc.y"
    { yyval.t = 0; cur_unit->outer =
                     mk_const(interp, yyvsp[-1].s, 'S'); }
    break;

  case 64:
#line 687 "compilers/imcc/imcc.y"
    { add_pcc_multi(cur_call, NULL); }
    break;

  case 65:
#line 688 "compilers/imcc/imcc.y"
    { yyval.t = 0; add_pcc_multi(cur_call, yyvsp[0].sr); }
    break;

  case 66:
#line 689 "compilers/imcc/imcc.y"
    { yyval.t = 0;  add_pcc_multi(cur_call, yyvsp[0].sr);}
    break;

  case 67:
#line 693 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("INTVAL"), 'S'); }
    break;

  case 68:
#line 694 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("FLOATVAL"), 'S'); }
    break;

  case 69:
#line 695 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("PMC"), 'S'); }
    break;

  case 70:
#line 696 "compilers/imcc/imcc.y"
    { yyval.sr = mk_const(interp, str_dup("STRING"), 'S'); }
    break;

  case 71:
#line 697 "compilers/imcc/imcc.y"
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

  case 72:
#line 707 "compilers/imcc/imcc.y"
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

  case 73:
#line 717 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; }
    break;

  case 76:
#line 726 "compilers/imcc/imcc.y"
    { cur_unit = imc_open_unit(interp, IMC_PCCSUB); }
    break;

  case 77:
#line 728 "compilers/imcc/imcc.y"
    {
            iSUBROUTINE(interp, cur_unit, mk_sub_label(interp, yyvsp[0].s));

         }
    break;

  case 78:
#line 732 "compilers/imcc/imcc.y"
    { cur_call->pcc_sub->pragma = yyvsp[-1].t; }
    break;

  case 79:
#line 734 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 80:
#line 739 "compilers/imcc/imcc.y"
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
         }
    break;

  case 81:
#line 766 "compilers/imcc/imcc.y"
    { yyval.i = 0; cur_call = NULL; }
    break;

  case 82:
#line 770 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 0; }
    break;

  case 83:
#line 771 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->label = 1; }
    break;

  case 84:
#line 775 "compilers/imcc/imcc.y"
    { yyval.i = NULL; }
    break;

  case 85:
#line 777 "compilers/imcc/imcc.y"
    { yyval.i = NULL;  cur_call->pcc_sub->object = yyvsp[-1].sr; }
    break;

  case 86:
#line 781 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 88:
#line 786 "compilers/imcc/imcc.y"
    { yyval.t = yyvsp[0].t; }
    break;

  case 89:
#line 787 "compilers/imcc/imcc.y"
    { yyval.t = yyvsp[-2].t | yyvsp[0].t; }
    break;

  case 90:
#line 791 "compilers/imcc/imcc.y"
    {  yyval.t = P_LOAD; }
    break;

  case 91:
#line 792 "compilers/imcc/imcc.y"
    {  yyval.t = P_MAIN; }
    break;

  case 92:
#line 793 "compilers/imcc/imcc.y"
    {  yyval.t = P_IMMEDIATE; }
    break;

  case 93:
#line 794 "compilers/imcc/imcc.y"
    {  yyval.t = P_POSTCOMP; }
    break;

  case 94:
#line 795 "compilers/imcc/imcc.y"
    {  yyval.t = P_ANON; }
    break;

  case 95:
#line 796 "compilers/imcc/imcc.y"
    {  yyval.t = P_METHOD; }
    break;

  case 96:
#line 797 "compilers/imcc/imcc.y"
    {  yyval.t = P_NEED_LEX; }
    break;

  case 99:
#line 804 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 100:
#line 809 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 101:
#line 811 "compilers/imcc/imcc.y"
    {
            add_pcc_sub(cur_call, yyvsp[-1].sr);
            cur_call->pcc_sub->flags |= isNCI;
         }
    break;

  case 102:
#line 816 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-1].sr); }
    break;

  case 103:
#line 818 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-1].s,'S')); }
    break;

  case 104:
#line 820 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, yyvsp[-3].sr);
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 105:
#line 824 "compilers/imcc/imcc.y"
    {  add_pcc_sub(cur_call, mk_const(interp, yyvsp[-3].s,'S'));
            add_pcc_cc(cur_call, yyvsp[-1].sr);
         }
    break;

  case 106:
#line 831 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 107:
#line 832 "compilers/imcc/imcc.y"
    {  add_pcc_arg(cur_call, yyvsp[-1].sr); }
    break;

  case 108:
#line 836 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 109:
#line 841 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 110:
#line 842 "compilers/imcc/imcc.y"
    {  if(yyvsp[-1].sr) add_pcc_result(cur_call, yyvsp[-1].sr); }
    break;

  case 111:
#line 846 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 112:
#line 847 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 113:
#line 848 "compilers/imcc/imcc.y"
    {
         IdList* l = yyvsp[0].idlist;
         if (l->unique_reg)
                 mk_ident_ur(interp, l->id, yyvsp[-1].t);
             else
                 mk_ident(interp, l->id, yyvsp[-1].t);
         is_def=0;
         yyval.sr=0;
     }
    break;

  case 114:
#line 860 "compilers/imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 115:
#line 861 "compilers/imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 116:
#line 865 "compilers/imcc/imcc.y"
    {  yyval.t = VT_FLAT;   }
    break;

  case 117:
#line 866 "compilers/imcc/imcc.y"
    {  yyval.t = VT_OPTIONAL; }
    break;

  case 118:
#line 867 "compilers/imcc/imcc.y"
    {  yyval.t = VT_OPT_FLAG; }
    break;

  case 119:
#line 868 "compilers/imcc/imcc.y"
    {  yyval.t = VT_NAMED; }
    break;

  case 120:
#line 869 "compilers/imcc/imcc.y"
    {  adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; }
    break;

  case 121:
#line 870 "compilers/imcc/imcc.y"
    {  yyval.t = VT_UNIQUE_REG; }
    break;

  case 122:
#line 875 "compilers/imcc/imcc.y"
    { yyval.t = 0; }
    break;

  case 123:
#line 876 "compilers/imcc/imcc.y"
    { yyval.t = 1; }
    break;

  case 126:
#line 886 "compilers/imcc/imcc.y"
    { begin_return_or_yield(interp, yyvsp[-1].t); }
    break;

  case 127:
#line 889 "compilers/imcc/imcc.y"
    { yyval.i = 0;   IMCC_INFO(interp)->asm_state = AsmDefault; }
    break;

  case 128:
#line 890 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.i = 0;  }
    break;

  case 129:
#line 896 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 130:
#line 897 "compilers/imcc/imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   }
    break;

  case 131:
#line 900 "compilers/imcc/imcc.y"
    {
       if(yyvsp[-1].sr) add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[-1].sr); 
   }
    break;

  case 132:
#line 906 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 133:
#line 911 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 0);
        }
    break;

  case 134:
#line 916 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 135:
#line 918 "compilers/imcc/imcc.y"
    {
            if ( IMCC_INFO(interp)->asm_state == AsmDefault)
                begin_return_or_yield(interp, 1);
        }
    break;

  case 136:
#line 923 "compilers/imcc/imcc.y"
    {  IMCC_INFO(interp)->asm_state = AsmDefault; yyval.t = 0;  }
    break;

  case 137:
#line 927 "compilers/imcc/imcc.y"
    { yyval.i = 0; }
    break;

  case 138:
#line 928 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id, yyvsp[0].sr);
          adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr); }
    break;

  case 139:
#line 934 "compilers/imcc/imcc.y"
    {
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 140:
#line 936 "compilers/imcc/imcc.y"
    {  
      if (adv_named_id) {
          add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,
                               adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
      } else add_pcc_return(IMCC_INFO(interp)->sr_return, yyvsp[0].sr);    }
    break;

  case 141:
#line 942 "compilers/imcc/imcc.y"
    {  
      add_pcc_named_return(interp,IMCC_INFO(interp)->sr_return,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 144:
#line 961 "compilers/imcc/imcc.y"
    { clear_state(); }
    break;

  case 145:
#line 966 "compilers/imcc/imcc.y"
    {  yyval.i = yyvsp[0].i; }
    break;

  case 146:
#line 967 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 147:
#line 968 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 148:
#line 969 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 149:
#line 973 "compilers/imcc/imcc.y"
    {  yyval.i = NULL; }
    break;

  case 153:
#line 983 "compilers/imcc/imcc.y"
    {
                     yyval.i = iLABEL(cur_unit, mk_local_label(interp, yyvsp[0].s));
                   }
    break;

  case 154:
#line 990 "compilers/imcc/imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 155:
#line 995 "compilers/imcc/imcc.y"
    {
         IdList* l = yyvsp[0].idlist;
         l->next = NULL;
         yyval.idlist = l;
     }
    break;

  case 156:
#line 1002 "compilers/imcc/imcc.y"
    {  
         IdList* l = yyvsp[0].idlist;
         l->next = yyvsp[-2].idlist;
         yyval.idlist = l;
     }
    break;

  case 157:
#line 1011 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = yyvsp[-1].s;
         l->unique_reg = 1;
         yyval.idlist = l;
     }
    break;

  case 158:
#line 1019 "compilers/imcc/imcc.y"
    {
         IdList* l = malloc(sizeof(IdList));
         l->id = yyvsp[0].s;
         l->unique_reg = 0;
         yyval.idlist = l;
     }
    break;

  case 161:
#line 1030 "compilers/imcc/imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 162:
#line 1031 "compilers/imcc/imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 163:
#line 1032 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 164:
#line 1033 "compilers/imcc/imcc.y"
    {
         IdList* l = yyvsp[0].idlist;
         while(l) {
             IdList* l1;
             if (l->unique_reg)
                 mk_ident_ur(interp, l->id, yyvsp[-1].t);
             else
                 mk_ident(interp, l->id, yyvsp[-1].t);
             l1 = l;
             l = l->next;
             free(l1);
         }
         is_def=0; yyval.i=0;
     }
    break;

  case 165:
#line 1048 "compilers/imcc/imcc.y"
    {
                       set_lexical(interp, yyvsp[0].sr, yyvsp[-2].s); yyval.i = 0;
                    }
    break;

  case 166:
#line 1051 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 167:
#line 1052 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 169:
#line 1054 "compilers/imcc/imcc.y"
    { is_def=1; }
    break;

  case 170:
#line 1055 "compilers/imcc/imcc.y"
    { mk_const_ident(interp, yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 171:
#line 1056 "compilers/imcc/imcc.y"
    { yyval.i = NULL;
                           cur_call->pcc_sub->flags |= isTAIL_CALL;
                           cur_call = NULL;
                        }
    break;

  case 172:
#line 1060 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "branch",1, yyvsp[0].sr); }
    break;

  case 173:
#line 1062 "compilers/imcc/imcc.y"
    { yyval.i = INS(interp, cur_unit, yyvsp[-1].s, 0, regs, nargs, keyvec, 1);
                                          free(yyvsp[-1].s); }
    break;

  case 174:
#line 1065 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[0].sr); }
    break;

  case 175:
#line 1066 "compilers/imcc/imcc.y"
    {  yyval.i = 0; cur_call = NULL; }
    break;

  case 176:
#line 1067 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 178:
#line 1069 "compilers/imcc/imcc.y"
    { yyval.i = 0;}
    break;

  case 179:
#line 1073 "compilers/imcc/imcc.y"
    { yyval.t = 'I'; }
    break;

  case 180:
#line 1074 "compilers/imcc/imcc.y"
    { yyval.t = 'N'; }
    break;

  case 181:
#line 1075 "compilers/imcc/imcc.y"
    { yyval.t = 'S'; }
    break;

  case 182:
#line 1076 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 183:
#line 1077 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; }
    break;

  case 184:
#line 1078 "compilers/imcc/imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 185:
#line 1083 "compilers/imcc/imcc.y"
    {
            if (( cur_pmc_type = pmc_type(interp,
                  string_from_cstring(interp, yyvsp[0].s, 0))) <= 0) {
                IMCC_fataly(interp, E_SyntaxError,
                   "Unknown PMC type '%s'\n", yyvsp[0].s);
            }
         }
    break;

  case 186:
#line 1093 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 187:
#line 1094 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "not", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 188:
#line 1095 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "neg", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 189:
#line 1096 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bnot", 2, yyvsp[-3].sr, yyvsp[0].sr);}
    break;

  case 190:
#line 1097 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 191:
#line 1098 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 192:
#line 1099 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 193:
#line 1100 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "pow", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 194:
#line 1101 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 195:
#line 1102 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 196:
#line 1103 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr);  }
    break;

  case 197:
#line 1104 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 3, yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 198:
#line 1105 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "iseq", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 199:
#line 1106 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isne", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 200:
#line 1107 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isgt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 201:
#line 1108 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "islt", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 202:
#line 1109 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isle", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 203:
#line 1110 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "isge", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 204:
#line 1112 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 205:
#line 1114 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 206:
#line 1116 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 207:
#line 1118 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "and", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 208:
#line 1120 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "or", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 209:
#line 1122 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "xor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 210:
#line 1124 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 211:
#line 1126 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 212:
#line 1128 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 213:
#line 1130 "compilers/imcc/imcc.y"
    { yyval.i = iINDEXFETCH(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 214:
#line 1132 "compilers/imcc/imcc.y"
    { yyval.i = iINDEXSET(interp, cur_unit, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 215:
#line 1134 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 216:
#line 1136 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-6].sr, yyvsp[-3].s, yyvsp[-1].sr, 1); }
    break;

  case 217:
#line 1138 "compilers/imcc/imcc.y"
    { yyval.i = iNEW(interp, cur_unit, yyvsp[-3].sr, yyvsp[0].s, NULL, 1); }
    break;

  case 218:
#line 1140 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 219:
#line 1142 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-5].sr, yyvsp[-1].sr); }
    break;

  case 220:
#line 1144 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 221:
#line 1146 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 222:
#line 1148 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "set_addr",
                            2, yyvsp[-3].sr, mk_label_address(interp, yyvsp[0].s)); }
    break;

  case 223:
#line 1151 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "find_global",2,yyvsp[-3].sr,yyvsp[0].sr);}
    break;

  case 224:
#line 1153 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "store_global",2, yyvsp[-2].sr,yyvsp[0].sr); }
    break;

  case 225:
#line 1157 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 226:
#line 1159 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 227:
#line 1161 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "new", 3, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 228:
#line 1164 "compilers/imcc/imcc.y"
    {
            add_pcc_result(yyvsp[0].i->r[0], yyvsp[-2].sr);
            cur_call = NULL;
            yyval.i = 0;
         }
    break;

  case 229:
#line 1170 "compilers/imcc/imcc.y"
    {
            yyval.i = IMCC_create_itcall_label(interp);
         }
    break;

  case 230:
#line 1174 "compilers/imcc/imcc.y"
    {
           IMCC_itcall_sub(interp, yyvsp[-3].sr);
           cur_call = NULL;
         }
    break;

  case 234:
#line 1182 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, "null", 1, yyvsp[-2].sr); }
    break;

  case 235:
#line 1185 "compilers/imcc/imcc.y"
    { yyval.i = IMCC_create_itcall_label(interp);
                           yyval.i->type &= ~ITCALL; yyval.i->type |= ITRESULT; }
    break;

  case 236:
#line 1187 "compilers/imcc/imcc.y"
    {  yyval.i = 0; }
    break;

  case 237:
#line 1192 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "add", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 238:
#line 1194 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "sub", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 239:
#line 1196 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mul", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 240:
#line 1198 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "div", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 241:
#line 1200 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "mod", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 242:
#line 1202 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "fdiv", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 243:
#line 1204 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "concat", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 244:
#line 1206 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "band", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 245:
#line 1208 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 246:
#line 1210 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "bxor", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 247:
#line 1212 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 248:
#line 1214 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "shl", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 249:
#line 1216 "compilers/imcc/imcc.y"
    { yyval.i = MK_I(interp, cur_unit, "lsr", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 250:
#line 1221 "compilers/imcc/imcc.y"
    { yyval.i = func_ins(interp, cur_unit, yyvsp[-3].sr, yyvsp[-1].s,
                                   regs,nargs,keyvec,1);
                     free(yyvsp[-1].s);
                   }
    break;

  case 251:
#line 1227 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 252:
#line 1228 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 253:
#line 1229 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_u(interp, yyvsp[0].s); }
    break;

  case 254:
#line 1230 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[0].sr;
                       if (yyvsp[0].sr->set != 'P')
                            IMCC_fataly(interp, E_SyntaxError,
                                  "Sub isn't a PMC");
                     }
    break;

  case 255:
#line 1235 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 256:
#line 1236 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 257:
#line 1237 "compilers/imcc/imcc.y"
    { cur_obj = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 258:
#line 1240 "compilers/imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 259:
#line 1241 "compilers/imcc/imcc.y"
    { yyval.t=0; }
    break;

  case 260:
#line 1246 "compilers/imcc/imcc.y"
    {
           yyval.i = IMCC_create_itcall_label(interp);
           IMCC_itcall_sub(interp, yyvsp[0].sr);
        }
    break;

  case 261:
#line 1251 "compilers/imcc/imcc.y"
    {  yyval.i = yyvsp[-3].i; }
    break;

  case 262:
#line 1255 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 263:
#line 1256 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call, adv_named_id, yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr); 
   }
    break;

  case 264:
#line 1262 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; 
       if (adv_named_id) {
           add_pcc_named_arg(interp, cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_arg(cur_call, yyvsp[0].sr);
   }
    break;

  case 265:
#line 1268 "compilers/imcc/imcc.y"
    { yyval.sr = 0;
                                     add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 266:
#line 1270 "compilers/imcc/imcc.y"
    { yyval.sr = 0; add_pcc_named_arg(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr);}
    break;

  case 267:
#line 1274 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 268:
#line 1278 "compilers/imcc/imcc.y"
    {  yyval.t = 0; }
    break;

  case 269:
#line 1279 "compilers/imcc/imcc.y"
    {  yyval.t = yyvsp[-1].t | yyvsp[0].t; }
    break;

  case 270:
#line 1283 "compilers/imcc/imcc.y"
    { yyval.t = VT_FLAT; }
    break;

  case 271:
#line 1284 "compilers/imcc/imcc.y"
    { yyval.t = VT_NAMED; }
    break;

  case 272:
#line 1285 "compilers/imcc/imcc.y"
    { adv_named_set(interp,yyvsp[-1].s); yyval.t = 0; }
    break;

  case 273:
#line 1288 "compilers/imcc/imcc.y"
    { yyval.sr = yyvsp[-1].sr; yyval.sr->type |= yyvsp[0].t; }
    break;

  case 274:
#line 1292 "compilers/imcc/imcc.y"
    { 
         yyval.sr = 0;
         if (adv_named_id) {
             add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
             adv_named_id = NULL;
         } else add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 275:
#line 1298 "compilers/imcc/imcc.y"
    { 
        add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); }
    break;

  case 276:
#line 1300 "compilers/imcc/imcc.y"
    { 
       yyval.sr = 0;
       if (adv_named_id) {
           add_pcc_named_result(interp,cur_call,adv_named_id,yyvsp[0].sr);
           adv_named_id = NULL;
       } else add_pcc_result(cur_call, yyvsp[0].sr); }
    break;

  case 277:
#line 1306 "compilers/imcc/imcc.y"
    { add_pcc_named_result(interp,cur_call,yyvsp[-2].s,yyvsp[0].sr); }
    break;

  case 278:
#line 1307 "compilers/imcc/imcc.y"
    {  yyval.sr = 0; }
    break;

  case 279:
#line 1312 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, yyvsp[-3].s, 3, yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 280:
#line 1314 "compilers/imcc/imcc.y"
    {  yyval.i =MK_I(interp, cur_unit, inv_op(yyvsp[-3].s), 3, yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 281:
#line 1316 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 282:
#line 1318 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless_null", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 283:
#line 1320 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 284:
#line 1322 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless",2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 285:
#line 1324 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "if", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 286:
#line 1326 "compilers/imcc/imcc.y"
    {  yyval.i = MK_I(interp, cur_unit, "unless", 2, yyvsp[-2].sr, yyvsp[0].sr); }
    break;

  case 287:
#line 1330 "compilers/imcc/imcc.y"
    {  yyval.s = "eq"; }
    break;

  case 288:
#line 1331 "compilers/imcc/imcc.y"
    {  yyval.s = "ne"; }
    break;

  case 289:
#line 1332 "compilers/imcc/imcc.y"
    {  yyval.s = "gt"; }
    break;

  case 290:
#line 1333 "compilers/imcc/imcc.y"
    {  yyval.s = "ge"; }
    break;

  case 291:
#line 1334 "compilers/imcc/imcc.y"
    {  yyval.s = "lt"; }
    break;

  case 292:
#line 1335 "compilers/imcc/imcc.y"
    {  yyval.s = "le"; }
    break;

  case 295:
#line 1344 "compilers/imcc/imcc.y"
    {  yyval.sr = NULL; }
    break;

  case 296:
#line 1345 "compilers/imcc/imcc.y"
    {  yyval.sr = yyvsp[0].sr; }
    break;

  case 297:
#line 1349 "compilers/imcc/imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 299:
#line 1354 "compilers/imcc/imcc.y"
    {  regs[nargs++] = yyvsp[0].sr; }
    break;

  case 300:
#line 1356 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-3].sr;
                      keyvec |= KEY_BIT(nargs);
                      regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr;
                   }
    break;

  case 301:
#line 1362 "compilers/imcc/imcc.y"
    {
                      regs[nargs++] = yyvsp[-1].sr;
                      yyval.sr = yyvsp[-1].sr;
                   }
    break;

  case 303:
#line 1369 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_fromc(interp, yyvsp[0].s); }
    break;

  case 304:
#line 1370 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address_u(interp, yyvsp[0].s); }
    break;

  case 305:
#line 1374 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 306:
#line 1375 "compilers/imcc/imcc.y"
    { yyval.sr = mk_sub_address(interp, yyvsp[0].s); }
    break;

  case 307:
#line 1379 "compilers/imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 308:
#line 1380 "compilers/imcc/imcc.y"
    { yyval.sr = mk_label_address(interp, yyvsp[0].s); }
    break;

  case 313:
#line 1393 "compilers/imcc/imcc.y"
    {  nkeys=0; in_slice = 0; }
    break;

  case 314:
#line 1394 "compilers/imcc/imcc.y"
    {  yyval.sr = link_keys(interp, nkeys, keys); }
    break;

  case 315:
#line 1398 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 316:
#line 1400 "compilers/imcc/imcc.y"
    {  keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 317:
#line 1401 "compilers/imcc/imcc.y"
    { in_slice = 1; }
    break;

  case 318:
#line 1402 "compilers/imcc/imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 319:
#line 1406 "compilers/imcc/imcc.y"
    { if (in_slice) {
                         yyvsp[0].sr->type |= VT_START_SLICE | VT_END_SLICE;
                     }
                     yyval.sr = yyvsp[0].sr;
                   }
    break;

  case 320:
#line 1412 "compilers/imcc/imcc.y"
    { yyvsp[-2].sr->type |= VT_START_SLICE;  yyvsp[0].sr->type |= VT_END_SLICE;
                     keys[nkeys++] = yyvsp[-2].sr; yyval.sr = yyvsp[0].sr; }
    break;

  case 321:
#line 1414 "compilers/imcc/imcc.y"
    { yyvsp[0].sr->type |= VT_START_ZERO | VT_END_SLICE; yyval.sr = yyvsp[0].sr; }
    break;

  case 322:
#line 1415 "compilers/imcc/imcc.y"
    { yyvsp[-1].sr->type |= VT_START_SLICE | VT_END_INF; yyval.sr = yyvsp[-1].sr; }
    break;

  case 323:
#line 1419 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'I'); }
    break;

  case 324:
#line 1420 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'N'); }
    break;

  case 325:
#line 1421 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 326:
#line 1422 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'P'); }
    break;

  case 327:
#line 1423 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_pasm_reg(interp, yyvsp[0].s); }
    break;

  case 328:
#line 1427 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'I'); }
    break;

  case 329:
#line 1428 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'N'); }
    break;

  case 330:
#line 1429 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;

  case 331:
#line 1430 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'U'); }
    break;

  case 332:
#line 1434 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_symreg(interp, yyvsp[0].s, 'S'); }
    break;

  case 333:
#line 1435 "compilers/imcc/imcc.y"
    {  yyval.sr = mk_const(interp, yyvsp[0].s, 'S'); }
    break;


    }

/* Line 991 of yacc.c.  */
#line 3950 "compilers/imcc/imcparser.c"

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
#if defined (__GNUC_MINOR__) && 2093 <= (__GNUC__ * 1000 + __GNUC_MINOR__) \
    && !defined __cplusplus
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


#line 1440 "compilers/imcc/imcc.y"



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

